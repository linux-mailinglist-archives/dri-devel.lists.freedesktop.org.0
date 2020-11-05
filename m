Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FEE2A916B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFE86EE10;
	Fri,  6 Nov 2020 08:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 350 seconds by postgrey-1.36 at gabe;
 Thu, 05 Nov 2020 17:21:05 UTC
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D0D6E044
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 17:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604596864;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=I3jp2DXngOUd771qBmgMPjOf9JRw6NMTj1GnaaPguow=;
 b=XZgf9DPLnxRpEE78zwjpnmyyelGBMOjtAoMacdPAl7an3fRPGxH0b5kxozWy2JpSZc
 /s5W2qbPUZyQElX2ZdZ1y48Ys81BSo1tqhuX7kcTbtfHbRiguEIJJYtRj6E0LCO5+2gW
 ktaLLVLHiuHXQP+1hz3enWJjf2hKk6Q9r4WDnJ675Fjbcc6N4HDyqvuvVQWVBC67sUKU
 4sVDr7nGLFvXJhltERi++cUkFNLHkd1bN8Ai8IRrcsTRQf3vNZ1QG5TTtnERJCeS1meg
 MIIliGtcLHWgut6DyQt18FRfnNHAP8flSdO1YEGEu0NH594QBRi6ZmnPGV+b8jw1Nohn
 PgSg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSfXA0MwM0="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.3.2 DYNA|AUTH)
 with ESMTPSA id L07f74wA5HF10Yf
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 5 Nov 2020 18:15:01 +0100 (CET)
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and
 drm_panel
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20201105120333.947408-1-tomi.valkeinen@ti.com>
Date: Thu, 5 Nov 2020 18:15:00 +0100
Message-Id: <61C04176-4654-4D2D-A55B-31FBB6D2E5AA@goldelico.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

> Am 05.11.2020 um 13:02 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
> 
> Hi,
> 
> This is third version of the series sent by Sebastian in February:
> 
> https://www.spinics.net/lists/linux-omap/msg153465.html
> 
> I took the patches from his git tree, and rebased on 5.10-rc2. There
> were some conflicts and compilation errors, and one bug that made dsi to
> not work (videomode variable was not initialized to 0).
> 
> I then fixed the few checkpatch and sparse issues. Overall, Sebastian's
> patches are pretty much as they were previously. I did drop Laurent's
> reviewed-bys, as it's been a long time since the previous series, and
> the patches are not identical anyway.
> 
> The topmost 5 patches are new ones, cleanups enabled by the DSI
> conversion. They could be handled separately, but it's such a nice
> cleanup, and I've been waiting for years to get this done, so here they
> are. That said, there are still a _lot_ of cleanups to do.
> 
> Almost all of the patches are omapdrm changes. The two non-omapdrm
> changes are:
> - After converting panel-dsi-cm to common DRM panel model, it is moved
>  to drm's panel directory.
> - Add MIPI_DSI_MODE_ULPS_IDLE flag
> 
> I have tested these with OMAP4 SDP, AM5 EVM and OMAP4 Panda. SDP has
> command mode panel, and I don't have any videomode panels.
> 
> Sebastian, I hope you're ok with all this? I did send you an email, but
> didn't get a reply yet, so I thought to just proceed. If you want to
> handle this in some other way, or don't want your
> authorship/signed-off-by in some of the commits, just tell.

That all is great.
I was able to apply the patch set cleanly and compile.

Next, I migrated my long waiting mipi_dsi/drm_panel driver conversion for
the panel of the Pyra handheld (omap 5 based) to compile on 5.10-rc2. And
I followed the latest existing panel-orisetech-otm8009a.c which uses a
similar video mode controller and mipi-dsi.

That one seems to be used by arch/arm/boot/dts/stm32f469-disco.dts.

Unfortunately my panel driver is not even loaded by drm/omap so I can't
debug. Does this set of drm/omap drivers need a modification of the device
tree? If yes, which one?

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
