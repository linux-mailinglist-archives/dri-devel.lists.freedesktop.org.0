Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6BA7D9E15
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 18:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8214810E03A;
	Fri, 27 Oct 2023 16:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030E610E03A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 16:36:44 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 15C31D0C5D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 16:20:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1842C0008;
 Fri, 27 Oct 2023 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1698423627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8Kj0cN1kj65aZZUZpY6yYDFL0q7mBqd1I9VG/9dVXk0=;
 b=QOnplgG6ovOhYJ4+Kr5yYUHoKizAisJKIBzxnyKlNRqMtlF04NJPMxky88A9/X2XjxsF47
 XTVw0X0tTO+KUm7V8K/HdMBJQkGgUD/KifDkTIM2belWyrZ5y5hC1ctQ0Ui601fwcvs/HQ
 HlVkKuzHZgA0zWiBEnEfPSpVRAuQLtJ0rKYBTg4nEZJPw5uZTM/uh14xoETwvtvqB2P7YX
 8J55+TlK8XlzVQFTjEZ68QbGTbnpl7a53Zoh8vMdzLOfmK+U2+mdkyisq3Xp/rYDIipJ7U
 EkQux4V6vubnLgcuJ6lGMBMcKY7unbeaVGCvKI3ezmFCDwymhY7o1TkRuRtFbQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: [RFC PATCH] drm/imx: ipuv3-plane: Allow preventing sequential DMA
 bursts
Date: Fri, 27 Oct 2023 18:20:25 +0200
Message-Id: <20231027162025.363036-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sequential DMA bursts improve NIC/RAM usage thanks to the basic NIC
hardware optimizations available when performing in-order sequential
accesses. This can be further enforced with the IPU DMA locking
mechanism which basically prevents any other IP to access the
interconnect for a longer time while performing up to 8 sequential DMA
bursts. The drawback is a lower availability for short time periods and
delayed accesses which may cause problem with latency-sensible systems
(typically, the network might suffer from high drop rates). This is even
more visible with larger displays requiring even more RAM bandwidth.

Issues have been observed on IMX6Q. The setup featured a 60Hz 1024x768
LVDS display just showing a static picture (thus no CPU usage, only
background DMA bringing the picture to the display engine). When
performing full speed iperf3 uplink tests with the FEC, almost no drop
was observed, whereas the drop would raise above 50% when limiting the
bandwidth to 1Mb/s (on a 100Mb/s link). The exact same test with the
display pipeline disabled would show little to no drop. The LP-DDR3 chip
on the module would allow up to ~53MiB each 1/60th of a second, and the
display pipeline consume approximately ~10MiB of this bandwidth, and
thus be active 20% of the time on each time slot.

One particular feature of the IPU DMA controller (IDMAC) is the ability
to serialize DMA bursts and to lock further interconnect accesses when
doing so. Experimentally, disabling the locking lead to a drop rate from
50% down to 10%. A few more % could be earned by setting the burst
number to 1. It seems this huge difference could be explained by a
possible hardware conflict between the locking feature and some QoS
logic. Indeed, on IMX6Q, the NIC-301 manages priorities and by default
will elect ENET's requests (priority 2) above IPU's requests (priority
0). But the QoS seems to only be valid above a certain threshold, which
is: 4 consequent DMA bursts in the case of the IPU. It was indeed
observed that tweaking the number of bursts to be lowered from 8 to 4
would lead to a significant increase in the Ethernet transfers
stability. IOW, it looks like when the display pipeline performs DMA
transfers, incoming DMA requests from other master devices on the
interconnect are delayed too much (or canceled).

I have no clue to explain why on the Ethernet MAC side some uDMA
transfers would never reach completion, especially without notification
nor any error. All uplink transfers are properly queued at the FEC level
and more importantly, the corresponding interrupts are fired upon
"proper transmission" and report no error whatsoever (note: there is no
actual way to know the uDMA internal controller could not fetch the
data, only MAC errors could be reported at this stage).

As a solution, we might want to prevent these DMA bursts from being
queued together. Maybe the IMX6Q is primarily used for its graphics
capabilities, but when the network (and other RAM consuming subsystem)
also matter, it may be relevant to apply this workaround in order to
help them fetching from RAM more reliably.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Hello,

This really is an RFC as the bug was also observed on v6.5 but the fix
proposed here was written and tested on a v4.14 kernel. I want to
discuss the approach and ideally get some feedback from imx6 experts who
know the SoC internals before publishing a clean series. There is a lot
of guessing in this workaround, besides the experimental measures I
managed to do. I would be glad if someone could sched any light or
involve knowledgeable people in this conversation.

The initial report was there and mainly focused on the network
subsystem:
https://lore.kernel.org/netdev/18b72fdb-d24a-a416-ffab-3a15b281a6e0@katalix.com/T/#md265d6da81b8fb6b85e3adbb399bcda79dfc761c
In this thread I made wrong observations because for speeding up my test
cycles, I dropped the support for: DRM, SND, USB as these subsystems
seemed totally irrelevant. It actually had a strong impact.

In the end, I really think there is something wrong with the locking of
IPU DMA bursts when mixed with the QoS of the NIC.

Any comments welcome!
[I know this deserves a DT binding entry, but we are not there yet]

Thanks,
Miquèl

 drivers/gpu/drm/imx/ipuv3-plane.c | 27 ++++++++++++++++++++++++---
 drivers/gpu/drm/imx/ipuv3-plane.h |  1 +
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index cf98596c7ce1..0492df96ac3e 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -496,8 +496,8 @@ static int ipu_chan_assign_axi_id(int ipu_chan)
 	}
 }
 
-static void ipu_calculate_bursts(u32 width, u32 cpp, u32 stride,
-				 u8 *burstsize, u8 *num_bursts)
+static void ipu_calculate_bursts(struct ipu_plane *ipu_plane, u32 width, u32 cpp,
+				 u32 stride, u8 *burstsize, u8 *num_bursts)
 {
 	const unsigned int width_bytes = width * cpp;
 	unsigned int npb, bursts;
@@ -509,6 +509,11 @@ static void ipu_calculate_bursts(u32 width, u32 cpp, u32 stride,
 	}
 	*burstsize = npb;
 
+	if (ipu_plane->no_sequential_dma_bursts) {
+		*num_bursts = 1;
+		return;
+	}
+
 	/* Maximum number of consecutive bursts without overshooting stride */
 	for (bursts = 8; bursts > 1; bursts /= 2) {
 		if (round_up(width_bytes, npb * cpp * bursts) <= stride)
@@ -608,7 +613,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 	width = drm_rect_width(&state->src) >> 16;
 	height = drm_rect_height(&state->src) >> 16;
 	info = drm_format_info(fb->format->format);
-	ipu_calculate_bursts(width, info->cpp[0], fb->pitches[0],
+	ipu_calculate_bursts(ipu_plane, width, info->cpp[0], fb->pitches[0],
 			     &burstsize, &num_bursts);
 
 	ipu_cpmem_zero(ipu_plane->ipu_ch);
@@ -730,6 +735,7 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 				 enum drm_plane_type type)
 {
 	struct ipu_plane *ipu_plane;
+	struct device_node *dn;
 	int ret;
 
 	DRM_DEBUG_KMS("channel %d, dp flow %d, possible_crtcs=0x%x\n",
@@ -745,6 +751,21 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 	ipu_plane->dma = dma;
 	ipu_plane->dp_flow = dp;
 
+	/*
+	 * Sequential DMA bursts improve NIC/RAM usage thanks to the basic NIC
+	 * hardware optimizations available when performing in-order sequential
+	 * accesses. This can be further enforced with the IPU DMA locking
+	 * mechanism which basically prevents any other IP to access the
+	 * interconnect for a longer time while performing up to 8 sequential
+	 * DMA bursts. The drawback is a lower availability for short time
+	 * periods and delayed accesses which may cause problem with
+	 * latency-sensible systems (typically, the network might suffer from
+	 * high drop rates). This is even more visible with larger displays
+	 * requiring even more RAM bandwidth.
+	 */
+	dn = of_find_compatible_node(NULL, NULL, "fsl,imx6q-ipu");
+	ipu_plane->no_sequential_dma_bursts = of_property_read_bool(dn, "no-sequential-dma-bursts");
+
 	ret = drm_universal_plane_init(dev, &ipu_plane->base, possible_crtcs,
 				       &ipu_plane_funcs, ipu_plane_formats,
 				       ARRAY_SIZE(ipu_plane_formats),
diff --git a/drivers/gpu/drm/imx/ipuv3-plane.h b/drivers/gpu/drm/imx/ipuv3-plane.h
index e563ea17a827..743e92d5a940 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.h
+++ b/drivers/gpu/drm/imx/ipuv3-plane.h
@@ -25,6 +25,7 @@ struct ipu_plane {
 
 	int			dma;
 	int			dp_flow;
+	bool			no_sequential_dma_bursts;
 
 	bool			disabling;
 };
-- 
2.34.1

