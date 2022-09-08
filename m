Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0250F5B2EA2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 08:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9596910EBCE;
	Fri,  9 Sep 2022 06:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C493810EA00
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 15:51:43 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id c11so22607416wrp.11
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 08:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mathembedded-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=6i8sqpqzLDL8z1p82sBsuGzvlqg3wk/6sNqlm7SzWbg=;
 b=DK493E0OJVGhjk31WkmRNY3zFNxMDxWEfMSC0lGSw1w1dizFuuzBjjOrkF7rP2PDx9
 RR6ksCsR9ELKcDlJ9bqRTW/R8/iTlG0pDRDVQNvc461cv8WvFuPY8BGh59buTt4FiFvq
 Xqhdzhwzqk7VdPJwAEomB+xxG23EW3ztytKgbk4vAp/s/mNVgHBsQRPSM0GKHhoDHfJV
 HCmVcPvJpR7jKM/eDAbR4IdL564/dKG7glZJDiWHSwdw7D722fIilfUHGDz9V1JaQE7e
 2+9nuIYqeVwYD4mcRBCCRlT7z0gkfIrEoCGYedgX0FZM2I4/IjgRkr5QrI3avDqNfzAy
 tATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=6i8sqpqzLDL8z1p82sBsuGzvlqg3wk/6sNqlm7SzWbg=;
 b=QtTKUsACMdUtVY4worrH9bqidMXnxD5SB22+chEbf+89d27Ef5g1NF0CAOlcaHTVyg
 ybqC6bISRYokElkI9WOYJt3fZ/Ze8xLQlD1mkPAARPqZ3OFCvpfusEPO2MrfklwrlQ4D
 s11DiT8Ghl8MxPbKC2FkycXua2kesdwalZDAzVEflpIZxn9eBkJbG45cCUNY0imfrtmE
 c2LEwC4XxLXjmkll1lRipi0u/E31moNEStKpqHLvB+BiQOGrriz/f7p1bosKyhaJi4+k
 rIMtIjRgO34BgZNy9UJzOuMqZ4Xhy+qSFCXQfQEAcY6YjayhXRdQWHhXinnWVmyuoJWB
 HQdw==
X-Gm-Message-State: ACgBeo1TgiItqrfjhPKhEg6sivcwgeh9EBCw6fddmecf0pCzgIEypjdy
 4uJmm50h9RDJ+ip0J/SVfw3Fgx0bgnw8zw==
X-Google-Smtp-Source: AA6agR6bgnsCDBzOYU761DInMQ+pw4wgFXvohbx81dXRkLYwWXpge2AdJmnLw/yJL1zpFeg4JzyppQ==
X-Received: by 2002:adf:e383:0:b0:228:9a53:612b with SMTP id
 e3-20020adfe383000000b002289a53612bmr5696394wrm.651.1662652302327; 
 Thu, 08 Sep 2022 08:51:42 -0700 (PDT)
Received: from opal.home ([2a00:23c6:200d:d301:4971:140c:41b9:e178])
 by smtp.gmail.com with ESMTPSA id
 f6-20020adff586000000b00228c375d81bsm14016761wro.2.2022.09.08.08.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 08:51:41 -0700 (PDT)
From: Stuart Menefy <stuart.menefy@mathembedded.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH] drm/meson: Correct OSD1 global alpha value
Date: Thu,  8 Sep 2022 16:51:03 +0100
Message-Id: <20220908155103.686904-1-stuart.menefy@mathembedded.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 09 Sep 2022 06:19:19 +0000
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
Cc: Stuart Menefy <stuart.menefy@mathembedded.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VIU_OSD1_CTRL_STAT.GLOBAL_ALPHA is a 9 bit field, so the maximum
value is 0x100 not 0xff.

This matches the vendor kernel.

Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
---
 drivers/gpu/drm/meson/meson_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index d5cbc47..45088f0 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -163,7 +163,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 
 	/* Enable OSD and BLK0, set max global alpha */
 	priv->viu.osd1_ctrl_stat = OSD_ENABLE |
-				   (0xFF << OSD_GLOBAL_ALPHA_SHIFT) |
+				   (0x100 << OSD_GLOBAL_ALPHA_SHIFT) |
 				   OSD_BLK0_ENABLE;
 
 	priv->viu.osd1_ctrl_stat2 = readl(priv->io_base +
-- 
2.7.4

