Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DA61B8FE0
	for <lists+dri-devel@lfdr.de>; Sun, 26 Apr 2020 14:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B896E2B8;
	Sun, 26 Apr 2020 12:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D998B6E0BA
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Apr 2020 20:39:53 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t14so15786055wrw.12
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Apr 2020 13:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ImHIL2vKfBcIIT6MLP/ljPFS+7iiYKmixfDoPbU1l8g=;
 b=tLdWuHVFK7BH7PjywN96BGzSs07imqLs2JqVhvqLWZctk3p8om15aFXgRWLXYeSZPh
 ypzJ0aq6/FbYtr8m7ahAI6kXToXus/CXumtAg7JlNQdwPmuUtLvMhI61dnGtVXrtiv86
 4ZjlUcCqFBR31TWg8g0n/SUGURK5DTLYR3J0hxIA+H0+LFkpiv3Fgg6qexfrxRrGX28E
 9DVuG4gEouPf1nvXbVH+l3wxkeYRjFv8OYrj592LYwEegdGVk7n7RNwpfTu0cIUePo6u
 61VFYCn9+9oMH1VRFcYJLKB3wMtU0PP1iKDDP5+5chZ0HcJEjTCjf1LoKQek7b/qFbQz
 ol4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ImHIL2vKfBcIIT6MLP/ljPFS+7iiYKmixfDoPbU1l8g=;
 b=tp9lwshwtyl0wnx4m71pt1J5d9vgmrsPsWx6efj/JSvyx9/kbmC4stJsa2UupS/pCl
 hTErTrja42kj00QiIG/ypbXldV65+v8bCGYf2+RSMjwqTW577hHyJEAOjZNKdgIBgG4l
 CWN/sVs58H7ZXsxsAdpPDw1dTfEmclTB5ai+n6mMnxsJ+eb6cCXjUWVyDGHnQnlf9D3X
 4Ensx0upe7J+1VNxrauETTG69VtIC6h6J74hMis5kMljkM+lsW4b5UocpHvrXdx0V6yy
 KtX5nmg5qdtc9ydph5vdJMRwgtM1We96m43Es599ou8+W54ucC8D4pj90oENYK0lNm2p
 7GLA==
X-Gm-Message-State: AGi0Pubyi1tBvCc0fm8Cpeu/xRRMr90DWJ/M18294OlJkwvPzpizZX+7
 pfnHNqX5xbUNS/lSJC0httY=
X-Google-Smtp-Source: APiQypIdXwVl1f4b7mf3LTaDVD8pAVD3aXuxUrJZFC7rD/jlBXlUIePVGB7g7Qv+KKpgO/4nRFXvQQ==
X-Received: by 2002:adf:f651:: with SMTP id x17mr18461448wrp.230.1587847192503; 
 Sat, 25 Apr 2020 13:39:52 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id t67sm9267418wmg.40.2020.04.25.13.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Apr 2020 13:39:51 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jmasson@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH] drm/meson: viu: fix setting the OSD burst length in
 VIU_OSD1_FIFO_CTRL_STAT
Date: Sat, 25 Apr 2020 22:39:41 +0200
Message-Id: <20200425203941.3188000-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 26 Apr 2020 12:35:16 +0000
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The burst length is configured in VIU_OSD1_FIFO_CTRL_STAT[31] and
VIU_OSD1_FIFO_CTRL_STAT[11:10]. The public S905D3 datasheet describes
this as:
- 0x0 = up to 24 per burst
- 0x1 = up to 32 per burst
- 0x2 = up to 48 per burst
- 0x3 = up to 64 per burst
- 0x4 = up to 96 per burst
- 0x5 = up to 128 per burst

The lower two bits map to VIU_OSD1_FIFO_CTRL_STAT[11:10] while the upper
bit maps to VIU_OSD1_FIFO_CTRL_STAT[31].

Replace meson_viu_osd_burst_length_reg() with pre-defined macros which
set these values. meson_viu_osd_burst_length_reg() always returned 0
(for the two used values: 32 and 64 at least) and thus incorrectly set
the burst size to 24.

Fixes: 147ae1cbaa1842 ("drm: meson: viu: use proper macros instead of magic constants")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_registers.h |  6 ++++++
 drivers/gpu/drm/meson/meson_viu.c       | 11 ++---------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/meson/meson_registers.h
index 8ea00546cd4e..049c4bfe2a3a 100644
--- a/drivers/gpu/drm/meson/meson_registers.h
+++ b/drivers/gpu/drm/meson/meson_registers.h
@@ -261,6 +261,12 @@
 #define VIU_OSD_FIFO_DEPTH_VAL(val)      ((val & 0x7f) << 12)
 #define VIU_OSD_WORDS_PER_BURST(words)   (((words & 0x4) >> 1) << 22)
 #define VIU_OSD_FIFO_LIMITS(size)        ((size & 0xf) << 24)
+#define VIU_OSD_BURST_LENGTH_24          (0x0 << 31 | 0x0 << 10)
+#define VIU_OSD_BURST_LENGTH_32          (0x0 << 31 | 0x1 << 10)
+#define VIU_OSD_BURST_LENGTH_48          (0x0 << 31 | 0x2 << 10)
+#define VIU_OSD_BURST_LENGTH_64          (0x0 << 31 | 0x3 << 10)
+#define VIU_OSD_BURST_LENGTH_96          (0x1 << 31 | 0x0 << 10)
+#define VIU_OSD_BURST_LENGTH_128         (0x1 << 31 | 0x1 << 10)
 
 #define VD1_IF0_GEN_REG 0x1a50
 #define VD1_IF0_CANVAS0 0x1a51
diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
index 304f8ff1339c..aede0c67a57f 100644
--- a/drivers/gpu/drm/meson/meson_viu.c
+++ b/drivers/gpu/drm/meson/meson_viu.c
@@ -411,13 +411,6 @@ void meson_viu_gxm_disable_osd1_afbc(struct meson_drm *priv)
 			    priv->io_base + _REG(VIU_MISC_CTRL1));
 }
 
-static inline uint32_t meson_viu_osd_burst_length_reg(uint32_t length)
-{
-	uint32_t val = (((length & 0x80) % 24) / 12);
-
-	return (((val & 0x3) << 10) | (((val & 0x4) >> 2) << 31));
-}
-
 void meson_viu_init(struct meson_drm *priv)
 {
 	uint32_t reg;
@@ -444,9 +437,9 @@ void meson_viu_init(struct meson_drm *priv)
 		VIU_OSD_FIFO_LIMITS(2);      /* fifo_lim: 2*16=32 */
 
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
-		reg |= meson_viu_osd_burst_length_reg(32);
+		reg |= VIU_OSD_BURST_LENGTH_32;
 	else
-		reg |= meson_viu_osd_burst_length_reg(64);
+		reg |= VIU_OSD_BURST_LENGTH_64;
 
 	writel_relaxed(reg, priv->io_base + _REG(VIU_OSD1_FIFO_CTRL_STAT));
 	writel_relaxed(reg, priv->io_base + _REG(VIU_OSD2_FIFO_CTRL_STAT));
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
