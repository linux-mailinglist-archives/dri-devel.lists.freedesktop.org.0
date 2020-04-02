Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDBE19C8BE
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 20:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB916EAD3;
	Thu,  2 Apr 2020 18:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f64:0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B69D6EAD3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 18:25:05 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 4FB3530004861;
 Thu,  2 Apr 2020 20:25:04 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 278C011B319; Thu,  2 Apr 2020 20:25:04 +0200 (CEST)
Date: Thu, 2 Apr 2020 20:25:04 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Daniel Dadap <ddadap@nvidia.com>
Subject: Re: How to handle disconnection of eDP panels due to dynamic display
 mux switches
Message-ID: <20200402182504.jf3mvgc2vbu3vldm@wunner.de>
References: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
 <20200402113925.2zvatduiyqld7pj2@wunner.de>
 <fafd3a20-7da4-f370-0356-576bca565bd1@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fafd3a20-7da4-f370-0356-576bca565bd1@nvidia.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 02, 2020 at 12:56:04PM -0500, Daniel Dadap wrote:
> I'll check one of the eDP-based systems I've been experimenting on to see if
> setting the VGA_SWITCHER_NEEDS_EDP_CONFIG capability in the handler is
> sufficient to make i915 avoid poking the AUX channel when it's mux-switched
> away.

That will not be sufficient I'm afraid.  The capability was added in
preparation for taking advantage of pre-calibration by the active GPU
as permitted by the DP spec, but that feature only ever existed in the
experimental patches I linked to and which I never got around to
completing (so far).

BTW, if the inactive GPU sets up the eDP output with the precalibrated
values and the mux is switched without using the PSR trick you've
mentioned, will the transition be glitchy?

If so, is there a chance to switch the mux in a vblank to avoid glitches?


> (This would be in addition to hacking the can_switch() callback in the
> GPU drivers to allow switching while there are still active KMS clients for
> the purposes of this experiment, unless somebody can point me to a tree with
> the WIP per-output switching Daniel Vetter mentioned.

I'm not aware anyone ever bothered implementing per-output switching.
Which hardware supports that anyway?  I documented the situation on
the MacBook Pro in apple-gmux.c:

 * The external DP port is only fully switchable on the first two unibody
 * MacBook Pro generations, MBP5 2008/09 and MBP6 2010.
 * The following MacBook Pro generations replaced the external DP port with a
 * combined DP/Thunderbolt port and lost the ability to switch it between GPUs,
 * connecting it either to the discrete GPU or the Thunderbolt controller.
	
So only very old machines can switch the external DP port separately.
We just switch it in unison with the LVDS panel on those machines for
simplicity.

I'm not aware of other contemporary machines besides MacBook Pros
which allow switching the panel at runtime, let alone switch
external ports separately.  Are you at liberty to divulge what
hardware you're working on?  Just curious.

Thanks,

Lukas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
