Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD427EF53D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 16:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A4210E1A2;
	Fri, 17 Nov 2023 15:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A2E10E1A2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 15:26:38 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 029BFC9278
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 15:16:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94C6FE0006;
 Fri, 17 Nov 2023 15:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1700234197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sJQBG43bQrP554t2PJ3qwTvdnf3PtCccwjfaVeBIENE=;
 b=WYNTwdS1gHvgvG56Vc13WobR/YpXUqXSwaG87zF1l6LNxcGP0/9ZkVCSPyF0n3YcABUv6h
 AvwTGXzcGZL+PK+9fc+MX9qpjAK7bf9h57NOivtjBun0jv13hnVFq3/m8gPsmgNDB8lJM6
 Wa0EPAItCAP67Yf1Nr/+jonGIPBs1Rylq8ACeC3HIfkwo4mEMZecFexQQrcNfZCtaS9lS7
 Purdu7wE/BPo+Eah7Z9VvQZI5sO8Yfu3yNs/DgA0pb1rHTyTDd1Y2Xrj3l75a13zIBq7cK
 u0INf9rQoR0Wb5fnUuiQQFu+e6thhtKkM5AG2RHe7lEu1qW+a+W04IafktaofQ==
Date: Fri, 17 Nov 2023 16:16:34 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [RFC PATCH] drm/imx: ipuv3-plane: Allow preventing sequential
 DMA bursts
Message-ID: <20231117161634.4c388cac@xps-13>
In-Reply-To: <20231027162025.363036-1-miquel.raynal@bootlin.com>
References: <20231027162025.363036-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

miquel.raynal@bootlin.com wrote on Fri, 27 Oct 2023 18:20:25 +0200:

> Sequential DMA bursts improve NIC/RAM usage thanks to the basic NIC
> hardware optimizations available when performing in-order sequential
> accesses. This can be further enforced with the IPU DMA locking
> mechanism which basically prevents any other IP to access the
> interconnect for a longer time while performing up to 8 sequential DMA
> bursts. The drawback is a lower availability for short time periods and
> delayed accesses which may cause problem with latency-sensible systems
> (typically, the network might suffer from high drop rates). This is even
> more visible with larger displays requiring even more RAM bandwidth.
>=20
> Issues have been observed on IMX6Q. The setup featured a 60Hz 1024x768
> LVDS display just showing a static picture (thus no CPU usage, only
> background DMA bringing the picture to the display engine). When
> performing full speed iperf3 uplink tests with the FEC, almost no drop
> was observed, whereas the drop would raise above 50% when limiting the
> bandwidth to 1Mb/s (on a 100Mb/s link). The exact same test with the
> display pipeline disabled would show little to no drop. The LP-DDR3 chip
> on the module would allow up to ~53MiB each 1/60th of a second, and the
> display pipeline consume approximately ~10MiB of this bandwidth, and
> thus be active 20% of the time on each time slot.
>=20
> One particular feature of the IPU DMA controller (IDMAC) is the ability
> to serialize DMA bursts and to lock further interconnect accesses when
> doing so. Experimentally, disabling the locking lead to a drop rate from
> 50% down to 10%. A few more % could be earned by setting the burst
> number to 1. It seems this huge difference could be explained by a
> possible hardware conflict between the locking feature and some QoS
> logic. Indeed, on IMX6Q, the NIC-301 manages priorities and by default
> will elect ENET's requests (priority 2) above IPU's requests (priority
> 0). But the QoS seems to only be valid above a certain threshold, which
> is: 4 consequent DMA bursts in the case of the IPU. It was indeed
> observed that tweaking the number of bursts to be lowered from 8 to 4
> would lead to a significant increase in the Ethernet transfers
> stability. IOW, it looks like when the display pipeline performs DMA
> transfers, incoming DMA requests from other master devices on the
> interconnect are delayed too much (or canceled).
>=20
> I have no clue to explain why on the Ethernet MAC side some uDMA
> transfers would never reach completion, especially without notification
> nor any error. All uplink transfers are properly queued at the FEC level
> and more importantly, the corresponding interrupts are fired upon
> "proper transmission" and report no error whatsoever (note: there is no
> actual way to know the uDMA internal controller could not fetch the
> data, only MAC errors could be reported at this stage).
>=20
> As a solution, we might want to prevent these DMA bursts from being
> queued together. Maybe the IMX6Q is primarily used for its graphics
> capabilities, but when the network (and other RAM consuming subsystem)
> also matter, it may be relevant to apply this workaround in order to
> help them fetching from RAM more reliably.
>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>=20
> Hello,
>=20
> This really is an RFC as the bug was also observed on v6.5 but the fix
> proposed here was written and tested on a v4.14 kernel. I want to
> discuss the approach and ideally get some feedback from imx6 experts who
> know the SoC internals before publishing a clean series. There is a lot
> of guessing in this workaround, besides the experimental measures I
> managed to do. I would be glad if someone could sched any light or
> involve knowledgeable people in this conversation.
>=20
> The initial report was there and mainly focused on the network
> subsystem:
> https://lore.kernel.org/netdev/18b72fdb-d24a-a416-ffab-3a15b281a6e0@katal=
ix.com/T/#md265d6da81b8fb6b85e3adbb399bcda79dfc761c
> In this thread I made wrong observations because for speeding up my test
> cycles, I dropped the support for: DRM, SND, USB as these subsystems
> seemed totally irrelevant. It actually had a strong impact.
>=20
> In the end, I really think there is something wrong with the locking of
> IPU DMA bursts when mixed with the QoS of the NIC.

Further investigation lead to the DDR configuration itself. The
system worked perfectly besides the Ethernet drop rate which was
abnormally high and it turns out, just changing a bit in the DDR reset
pad configuration fixed it. I cannot explain exactly what was the root
cause but it is possible that the DDR was in a relatively unstable
state due to the power-on/reset procedure not being followed correctly
due to the incomplete pad configuration.

Here is the U-Boot thread I've started:=20
https://lore.kernel.org/u-boot/20231117150044.1792080-1-miquel.raynal@bootl=
in.com/

Thanks,
Miqu=C3=A8l
