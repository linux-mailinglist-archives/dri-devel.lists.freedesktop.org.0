Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7CF9C42B0
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 17:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874A088FF9;
	Mon, 11 Nov 2024 16:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=maxima.ru header.i=@maxima.ru header.b="MrdOOnJX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ksmg02.maxima.ru (ksmg02.maxima.ru [81.200.124.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052A988FF9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 16:34:01 +0000 (UTC)
Received: from ksmg02.maxima.ru (localhost [127.0.0.1])
 by ksmg02.maxima.ru (Postfix) with ESMTP id B33671E0003;
 Mon, 11 Nov 2024 19:33:59 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg02.maxima.ru B33671E0003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxima.ru; s=sl;
 t=1731342839; bh=e2562SIQvLHnyfeL1tvjYy46Uc1ATcYhf55JZtX+YWY=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=MrdOOnJXwUnpfAU8e+Q8uZGg8vAtpKIMmb+tV4LTUbRir5gdH9N86VC3uBcSXt/bC
 NhIKNmBBwh5d1qOWLmGnFHJmDa0JY7weCbCFTDx5bO66xnnAF+vmtd5p0ZuOSiIDvH
 6X4ULrCz1gketdhao4fdqi79xpNzJXrtEAHx9xI/STQC/Bf/wKr/hbkKZELullXpyL
 ZFkw51Dyxf9UjWyswurvEmb3Ir6JnCO8xsmF/jnnNpv/1Rco+rUbyFFrReLFrbe2U8
 5Qe9r9yZBhFon/sFSy7/iuNdcGf40OeaRGups7VO2g1r48/s/rW0SSteEmBGx0d8QF
 ty/FV2+bNqKTg==
Received: from ksmg02.maxima.ru (autodiscover.maxima.ru [81.200.124.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.maxima.ru",
 Issuer "GlobalSign GCC R3 DV TLS CA 2020" (verified OK))
 by ksmg02.maxima.ru (Postfix) with ESMTPS;
 Mon, 11 Nov 2024 19:33:59 +0300 (MSK)
Received: from GS-NOTE-190.mt.ru (10.0.247.169) by mmail-p-exch02.mt.ru
 (81.200.124.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.4; Mon, 11 Nov
 2024 19:33:56 +0300
From: Murad Masimov <m.masimov@maxima.ru>
To: Dave Airlie <airlied@redhat.com>
CC: Murad Masimov <m.masimov@maxima.ru>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jocelyn Falempe <jfalempe@redhat.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH v2] drm/mgag200: Apply upper limit for clock variable
Date: Mon, 11 Nov 2024 19:33:00 +0300
Message-ID: <20241111163306.860-1-m.masimov@maxima.ru>
X-Mailer: git-send-email 2.46.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.247.169]
X-ClientProxiedBy: mt-exch-01.mt.ru (91.220.120.210) To mmail-p-exch02.mt.ru
 (81.200.124.62)
X-KSMG-Rule-ID: 7
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 189089 [Nov 11 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: m.masimov@maxima.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dmarc=none header.from=maxima.ru;
 spf=none smtp.mailfrom=maxima.ru; dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41
 623e98d5198769c015c72f45fabbb9f77bdb702b, {rep_avail},
 {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2; maxima.ru:7.1.1;
 81.200.124.62:7.1.2; d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 ksmg02.maxima.ru:7.1.1, FromAlignment: s, ApMailHostAddress: 81.200.124.62
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/11/11 06:58:00 #26843820
X-KSMG-AntiVirus-Status: Clean, skipped
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the value of the clock variable is higher than 800000, the value of the
variable m, which is used as a divisor, will remain zero, because
(clock * testp) will be higher than vcomax in every loop iteration, which
leads to skipping every iteration and leaving variable m unmodified.

Clamp value of the clock variable between the lower and the upper limits.
It should be correct, since there is already a similar lower limit check.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: e829d7ef9f17 ("drm/mgag200: Add support for a new rev of G200e")
Signed-off-by: Murad Masimov <m.masimov@maxima.ru>
---
 drivers/gpu/drm/mgag200/mgag200_g200se.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 7a32d3b1d226..4934c27b084e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -216,8 +216,7 @@ static int mgag200_g200se_04_pixpllc_atomic_check(struct drm_crtc *crtc,
 	m = n = p = s = 0;
 	delta = 0xffffffff;

-	if (clock < 25000)
-		clock = 25000;
+	clock = clamp(clock, 25000L, 800000L);
 	clock = clock * 2;

 	/* Permited delta is 0.5% as VESA Specification */
--
2.39.2

