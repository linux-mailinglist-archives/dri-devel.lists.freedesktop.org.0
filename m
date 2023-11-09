Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D13A7E6478
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 08:39:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3877A10E1CB;
	Thu,  9 Nov 2023 07:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B576510E1C4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 07:38:49 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D9631B87;
 Thu,  9 Nov 2023 08:38:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699515506;
 bh=tErP6ntTDdC0gabpvQZT2twhldOSaERfSjPvzlINOYg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=kR7DvnBnuKYV6zUJN5kbkxd2PFfd4UnaU7zGCrcxZBRaCg7KC648DlNBkSvzqoz3y
 FOxBwhff6kCosGe2U5jZ5RCcY158Yk3tZxNcKjH0s1cCQUNyiJzBP53pKSO46Wlp6R
 wJaujOJ4U6gdcu/vUBhvdNrmX+82QinExMBCKIXc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 09 Nov 2023 09:38:00 +0200
Subject: [PATCH v2 07/11] drm/tidss: Add simple K2G manual reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-tidss-probe-v2-7-ac91b5ea35c0@ideasonboard.com>
References: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
In-Reply-To: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1452;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=tErP6ntTDdC0gabpvQZT2twhldOSaERfSjPvzlINOYg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlTIx/4yyEc0vlhu0LY6PKDBh3YAinZZWmPblHD
 ALXeO8ROGWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUyMfwAKCRD6PaqMvJYe
 9f/lD/46bgpdv2S8ITGIdgfaPkwqsjWoOoC0LAxXSonc5kSzdeRIvr9b3YSLkZGj3SwbZ7M0oa+
 oHtFqztyD/dYGNcQxIdq47NawuCcZjIC0Oxg9owTgfdSPLvJX5sMC/UolVmF9KroPSo/BO9Fh1i
 E4REh0S0d1gvKwRL7Bt9CG4QYvzS/biPAml1S62EUDUalTWU3y1WYGrUbgjdps/HdGpjFHdPIv9
 eWv+etZe9dRkUDBVkx5pLkgT6tEp6X95wurcYPfticPLbvTc70CYepSF2yAgpOH3XgBEy7h7aNh
 3Sk7ZDOsVoYavoI04mQdKguVSdvLFm2fXlpVsq5IMtwy/exdpZLVGFtIxKlJezYv1WHlQvdwKoL
 vLYHMfz5RIJWuv0ebSZ2vGmG7rRUXcG+jFilL2P3HVN5PRYtT47fzeWMeeRgv9mOJAAMJTFjuKE
 ViCUFvElQyiaaTC35VSQclLM/dvv5mLF9QftiYqbOopX00vWwa/HPCVurQ+rDtAdWcL3N2/M1h3
 +GbWNqcX9MhFm9JTN632CxUZ2GDxTyRCrgziQK5QCMhMMwWiuLvQPXlxBP/25daaG7JAtUpZvVG
 fbEOnJEc7sCWzqk0qGutAEGJD1SSW4Takmxye3xd2rlq/iwp0eI9v60xmiwTn9P4I9KoKIUQwC1
 K44aOqsEWDdAF8A==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Francesco Dolcini <francesco@dolcini.it>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

K2G display controller does not support soft reset, but we can do the
most important steps manually: mask the IRQs and disable the VPs.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index c82fd5bc9be4..a5c0b72596e8 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -2702,14 +2702,28 @@ static void dispc_init_errata(struct dispc_device *dispc)
 	}
 }
 
+/*
+ * K2G display controller does not support soft reset, so we do a basic manual
+ * reset here: make sure the IRQs are masked and VPs are disabled.
+ */
+static void dispc_softreset_k2g(struct dispc_device *dispc)
+{
+	dispc_set_irqenable(dispc, 0);
+	dispc_read_and_clear_irqstatus(dispc);
+
+	for (unsigned int vp_idx = 0; vp_idx < dispc->feat->num_vps; ++vp_idx)
+		VP_REG_FLD_MOD(dispc, vp_idx, DISPC_VP_CONTROL, 0, 0, 0);
+}
+
 static int dispc_softreset(struct dispc_device *dispc)
 {
 	u32 val;
 	int ret;
 
-	/* K2G display controller does not support soft reset */
-	if (dispc->feat->subrev == DISPC_K2G)
+	if (dispc->feat->subrev == DISPC_K2G) {
+		dispc_softreset_k2g(dispc);
 		return 0;
+	}
 
 	/* Soft reset */
 	REG_FLD_MOD(dispc, DSS_SYSCONFIG, 1, 1, 1);

-- 
2.34.1

