Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A26E56321EF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 13:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71AD610E087;
	Mon, 21 Nov 2022 12:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB91710E087
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 12:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iXcTz8lxYQ7geYhT3TlnQBnOfCxeX1gmPx4WmdhdkQM=; b=on9Wfu7lu6smGVbIGgWohfA/0x
 h8M3nDU26EKRAGGxd5047blCnotXLsXuIfZzxqTq9iym7iQTZOaYEtmLOD3nkJP828UIV7fdtVC1Q
 eQmSzyAGwYHCwYLnsZxQSstgT3CQFprYbbrbDI2UsbpuW0TPDH021boXuegt2JItbojokMJ6bi2dA
 iRxEP5r+xJ4kaB3MiMjXihQup+EjHk1s03qkA38/jxJG0NrAtbfuepqo22gLuxrQ9r+tj8ox72zeX
 uwHh6nWurJVGTY5B9R3VtXBpi1oovk9C/KmuMAO3hpjeD6Yzl2S12V+RuTcFY3Yg0xossZRjngpSu
 G3wGF23A==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=57644)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1ox5u2-0004cF-Db; Mon, 21 Nov 2022 13:27:58 +0100
Message-ID: <86f5b25d-55cc-c759-d9ec-b086d7f05698@tronnes.org>
Date: Mon, 21 Nov 2022 13:27:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/8] drm/mipi-dbi: Convert to shadow-plane helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
 david@lechnology.com, kamlesh.gurudasani@gmail.com, javierm@redhat.com
References: <20221121104532.8301-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221121104532.8301-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 21.11.2022 11.45, skrev Thomas Zimmermann:
> Convert the MIPI-DBI-based drivers to shadow-plane helpers. The
> drivers vmap/vunmap GEM buffer memory during the atomic commit.
> Shadow-plane helpers automate this process.
> 
> Patches 1 to 4 prepare the MIPI code for the change and simplify
> the restof the patchset.
> 
> Patches 5 to 7 rework the vmap code in the MIPI-DBI drivers and add
> shadow-plane helpers. Most of the affected drivers call MIPI-DBI
> helpers and get the update automatically. Only ili9225 and st7586
> require changes to their source code.
> 
> Patch 8 simplifies drm_dev_enter() and _exit(). It's not strictly
> needed, but streamlines the driver code and make sense overall.
> 
> Testing is welcome, as I don't have any hardware to test these
> changes myself.
> 

I can do a test this weekend.

Btw I've converted drm/gud to the shadow plane helper, I just need to
solve an smtp problem[1] so I can send out the patchset.

[1]
https://lore.kernel.org/dri-devel/1bc45775-0667-01f8-36e1-9f65d3081092@tronnes.org/T/#u

Noralf.
