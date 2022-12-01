Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 025C463EB4B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC8610E55E;
	Thu,  1 Dec 2022 08:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFFB10E55E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 08:40:37 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p0f7Q-0006Cj-DI; Thu, 01 Dec 2022 09:40:32 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p0f7O-001WLa-S2; Thu, 01 Dec 2022 09:40:31 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p0f7O-0001gk-Mi; Thu, 01 Dec 2022 09:40:30 +0100
Message-ID: <d5d5ef3c8e4a1ca075ced3af4eeab1da8d86c338.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: print MMU exception cause
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org, 
 Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 01 Dec 2022 09:40:30 +0100
In-Reply-To: <20221130185303.2025810-1-l.stach@pengutronix.de>
References: <20221130185303.2025810-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mi, 2022-11-30 at 19:53 +0100, Lucas Stach wrote:
From: Christian Gmeiner <christian.gmeiner@gmail.com>

The MMU tells us the fault status. While the raw register value is
already printed, it's a bit more user friendly to translate the
fault reasons into human readable format.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
I've rewritten parts of the patch to properly cover multiple
MMUs and squashed the reason into the existing message. Christian,
please tell me if you are fine with having your name attached to
this patch.
---
=C2=A0drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 22 +++++++++++++++++++---
=C2=A01 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnavi=
v/etnaviv_gpu.c
index 37018bc55810..f79203b774d9 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1426,6 +1426,15 @@ static void sync_point_worker(struct work_struct *wo=
rk)
=C2=A0

=C2=A0static void dump_mmu_fault(struct etnaviv_gpu *gpu)
=C2=A0{
+	static const char *fault_reasons[] =3D {
+		"slave not present",
+		"page not present",
+		"write violation",
+		"out of bounds",
+		"read security violation",
+		"write security violation",
+	};
+
=C2=A0	u32 status_reg, status;
=C2=A0	int i;
=C2=A0

@@ -1438,18 +1447,25 @@ static void dump_mmu_fault(struct etnaviv_gpu *gpu)
=C2=A0	dev_err_ratelimited(gpu->dev, "MMU fault status 0x%08x\n", status);
=C2=A0

=C2=A0	for (i =3D 0; i < 4; i++) {
+		const char *reason =3D "unknown";
=C2=A0		u32 address_reg;
+		u32 mmu_status;
=C2=A0

-		if (!(status & (VIVS_MMUv2_STATUS_EXCEPTION0__MASK << (i * 4))))
+		mmu_status =3D (status >> (i * 4)) & VIVS_MMUv2_STATUS_EXCEPTION0__MASK;

VIVS_MMUv2_STATUS_EXCEPTION0__MASK is 0x3 ...

+		if (!mmu_status)
=C2=A0			continue;
=C2=A0

+		if ((mmu_status - 1) < ARRAY_SIZE(fault_reasons))
+			reason =3D fault_reasons[mmu_status - 1];

... so (mmu_status - 1) can be 2 at most. This leaves me wondering how
"out of bounds" and the "security violation" errors can be reached. I
think this requires the exception bitfield masks to be extended to 0x7.

regards
Philipp
