Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70490A42C8A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 20:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C3610E4E2;
	Mon, 24 Feb 2025 19:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mt-integration.ru header.i=@mt-integration.ru header.b="duLD4bry";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 308 seconds by postgrey-1.36 at gabe;
 Mon, 24 Feb 2025 18:11:23 UTC
Received: from ksmg02.maxima.ru (ksmg02.maxima.ru [81.200.124.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D62D10E495
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 18:11:23 +0000 (UTC)
Received: from ksmg02.maxima.ru (localhost [127.0.0.1])
 by ksmg02.maxima.ru (Postfix) with ESMTP id CD7021E0002;
 Mon, 24 Feb 2025 21:06:04 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg02.maxima.ru CD7021E0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt-integration.ru;
 s=sl; t=1740420364; bh=kjFoRlvCs05WvCXviC7CcZDDhmBmJ1uIW5ZI9DussEs=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=duLD4bryRA1C1k2NJjIQey5GN+1ZIgq6g03bnXoZKiOVwMJ12R1cJEtCjBMGlrAEa
 BEl0Q25EGhfY7+kgkFzL7DQHW4vYhdT7gkN/inVs30owGzGk5gHhxpjTcB1lMLORNQ
 SEod26p/pNAuGnW/zxdNA5BQkgPgBOyhZn4Kkw53mVfT1bISTNOzqbTda+s1+i14QI
 XyB5+JENuTdXgXQZ/9Z1fJ2A09cWcmcWlQlW8jeX/3GDCqANhaY1o9zmUWINJ+QbHN
 dgiqnPavhg/87dlAy45qyBZwUahjYLMxYiniJ2JBjDPQc+wsdDadfK3BBWuoE8+Mpx
 nRHuzVU+UaaBQ==
Received: from ksmg02.maxima.ru (mail.maxima.ru [81.200.124.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.maxima.ru",
 Issuer "GlobalSign GCC R3 DV TLS CA 2020" (verified OK))
 by ksmg02.maxima.ru (Postfix) with ESMTPS;
 Mon, 24 Feb 2025 21:06:04 +0300 (MSK)
Received: from GS-NOTE-190.mt.ru (10.0.246.182) by mmail-p-exch02.mt.ru
 (81.200.124.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.4; Mon, 24 Feb
 2025 21:06:02 +0300
From: Murad Masimov <m.masimov@mt-integration.ru>
To: Dave Airlie <airlied@redhat.com>
CC: Murad Masimov <m.masimov@mt-integration.ru>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jocelyn Falempe <jfalempe@redhat.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Mathieu Larouche <mathieu.larouche@matrox.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <lvc-project@linuxtesting.org>
Subject: [PATCH v4] drm/mgag200: Apply upper limit for clock variable
Date: Mon, 24 Feb 2025 21:04:38 +0300
Message-ID: <20250224180442.675-1-m.masimov@mt-integration.ru>
X-Mailer: git-send-email 2.46.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.246.182]
X-ClientProxiedBy: mt-exch-01.mt.ru (91.220.120.210) To mmail-p-exch02.mt.ru
 (81.200.124.62)
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dmarc=none header.from=mt-integration.ru;
 spf=none smtp.mailfrom=mt-integration.ru; dkim=none
X-KSMG-AntiSpam-Envelope-From: m.masimov@mt-integration.ru
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51
 68896fb0083a027476849bf400a331a2d5d94398, {rep_avail},
 {Tracking_from_domain_doesnt_match_to}, mt-integration.ru:7.1.1;
 ksmg02.maxima.ru:7.1.1; 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 81.200.124.62:7.1.2, FromAlignment: s, ApMailHostAddress: 81.200.124.62
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 191247 [Feb 24 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310,
 bases: 2025/02/24 12:27:00 #27432361
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 7
X-Mailman-Approved-At: Mon, 24 Feb 2025 19:16:43 +0000
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

Fixes: 877507bb954e ("drm/mgag200: Provide per-device callbacks for PIXPLLC")
Signed-off-by: Murad Masimov <m.masimov@mt-integration.ru>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
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

