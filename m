Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F849CE10E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 15:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B474E10E2CD;
	Fri, 15 Nov 2024 14:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=maxima.ru header.i=@maxima.ru header.b="Wb87ZJO/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ksmg02.maxima.ru (ksmg02.maxima.ru [81.200.124.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDB610E2CD
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 14:15:22 +0000 (UTC)
Received: from ksmg02.maxima.ru (localhost [127.0.0.1])
 by ksmg02.maxima.ru (Postfix) with ESMTP id 17E2A1E0005;
 Fri, 15 Nov 2024 17:15:18 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg02.maxima.ru 17E2A1E0005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxima.ru; s=sl;
 t=1731680118; bh=nZPWpuA/5JZSHtMUrPOIwDnX0BrrRbE0L8Z5sJogdHw=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=Wb87ZJO/rwT0HuTjLpR9S0II3ZUFqQyQ66WWlm4QtK9GTSWpuPxupgKBW5pPn907m
 xyObQfQ9zOd0bk2kGmF1ocCEBHK4ri5dqItKAU5TrWLC6AmAMbMa3W6IyY5cjxfUJk
 rhXz9dCWscnrHbQ38/kcQ4PpYBCx2Qh1VF2Qb42EwmKZcGnUXojii1RWGKKvUbMvca
 V8OLUKNVZeL1PnTLsrPibdCrVIN+mHIrPi/D+gMylKdthPnPjwg9Xwc66Occ6oqnEf
 61aKqcLzyA3dIoguAcQEgGe7Xz9458kMU3eAYcOPGWKTI/PyVTf6gEGOKsJZzAK2XH
 bXPzobvmyI+Rw==
Received: from ksmg02.maxima.ru (autodiscover.maxima.ru [81.200.124.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.maxima.ru",
 Issuer "GlobalSign GCC R3 DV TLS CA 2020" (verified OK))
 by ksmg02.maxima.ru (Postfix) with ESMTPS;
 Fri, 15 Nov 2024 17:15:17 +0300 (MSK)
Received: from GS-NOTE-190.mt.ru (10.0.246.114) by mmail-p-exch02.mt.ru
 (81.200.124.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.4; Fri, 15 Nov
 2024 17:15:16 +0300
From: Murad Masimov <m.masimov@maxima.ru>
To: Dave Airlie <airlied@redhat.com>
CC: Murad Masimov <m.masimov@maxima.ru>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jocelyn Falempe <jfalempe@redhat.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Mathieu Larouche <mathieu.larouche@matrox.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <lvc-project@linuxtesting.org>
Subject: [PATCH v3] drm/mgag200: Apply upper limit for clock variable
Date: Fri, 15 Nov 2024 17:14:47 +0300
Message-ID: <20241115141449.709-1-m.masimov@maxima.ru>
X-Mailer: git-send-email 2.46.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.246.114]
X-ClientProxiedBy: mt-exch-01.mt.ru (91.220.120.210) To mmail-p-exch02.mt.ru
 (81.200.124.62)
X-KSMG-Rule-ID: 7
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 189206 [Nov 15 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: m.masimov@maxima.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dmarc=none header.from=maxima.ru;
 spf=none smtp.mailfrom=maxima.ru; dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41
 623e98d5198769c015c72f45fabbb9f77bdb702b, {rep_avail},
 {Tracking_from_domain_doesnt_match_to}, ksmg02.maxima.ru:7.1.1;
 81.200.124.62:7.1.2; d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 127.0.0.199:7.1.2;
 maxima.ru:7.1.1, FromAlignment: s, ApMailHostAddress: 81.200.124.62
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/11/15 06:07:00 #26858754
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

Return -EINVAL just after the loop, if m is still 0.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: e829d7ef9f17 ("drm/mgag200: Add support for a new rev of G200e")
Signed-off-by: Murad Masimov <m.masimov@maxima.ru>
---
 drivers/gpu/drm/mgag200/mgag200_g200se.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 7a32d3b1d226..4d65ead63d66 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -249,6 +249,9 @@ static int mgag200_g200se_04_pixpllc_atomic_check(struct drm_crtc *crtc,
 		}
 	}

+	if (m == 0)
+		return -EINVAL;
+
 	fvv = pllreffreq * n / m;
 	fvv = (fvv - 800000) / 50000;
 	if (fvv > 15)
--
2.39.2

