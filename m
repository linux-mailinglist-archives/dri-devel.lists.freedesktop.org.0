Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C331CD8E6
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 13:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0B289E38;
	Mon, 11 May 2020 11:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 514 seconds by postgrey-1.36 at gabe;
 Mon, 11 May 2020 11:51:43 UTC
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.78.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A851789D40;
 Mon, 11 May 2020 11:51:43 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id 4913C2802D276;
 Mon, 11 May 2020 13:43:08 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id F27E2ACC2; Mon, 11 May 2020 13:43:07 +0200 (CEST)
Date: Mon, 11 May 2020 13:43:07 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/6] RFC Support hot device unplug in amdgpu
Message-ID: <20200511114307.jfirnlvkikmulyhu@wunner.de>
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
 <20200511095433.GA206103@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511095433.GA206103@phenom.ffwll.local>
User-Agent: NeoMutt/20170113 (1.7.2)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: ckoenig.leichtzumerken@gmail.com, michel@daenzer.net,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 11:54:33AM +0200, Daniel Vetter wrote:
> - One unfortunate thing with drm_dev_unplug is that the driver core is
>   very opinionated and doesn't tell you whether it's a hotunplug or a
>   driver unload. In the former case trying to shut down hw just wastes
>   time (and might hit driver bugs), in the latter case driver engineers
>   very much expect everything to be shut down.

You can get that information at the PCI bus level with
pci_dev_is_disconnected().  The flag queried by this function is set
upon hot removal.  Be aware however that the device is guaranteed to
be unreachable if the function returns true, but the converse is NOT
guaranteed, i.e. the function may return false even though the device
has just gone away.

Those somewhat difficult semantics are one of the reasons why some
people are skeptical of the function's merits (notably Greg KH).
See this LWN article for more information:

https://lwn.net/Articles/767885/
(scroll down to the "Surprise removal" section)

I've suggested to Greg a few years back that we should have a flag
at the device level to indicate whether it's gone, not just at the bus
level.  That way the property could be expressed regardless of the bus
used.  It would facilitate the feature you're missing, that the driver
core tells you whether it's a surprise removal or not.  Unfortunately
Greg rejected the idea.

Thanks,

Lukas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
