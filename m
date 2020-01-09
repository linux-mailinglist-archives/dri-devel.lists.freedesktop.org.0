Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD39B135FBF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529866E92B;
	Thu,  9 Jan 2020 17:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416026E3A4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 07:29:08 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id ay11so2185191plb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2020 23:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eb7+4YTwZPIai1tsUX2MFyulW3TpuQQ3q3lzwkxFRow=;
 b=ej7W8jgc7Qi2towEQUvPZ+HLF2Kev1VG8RzMxUS5owrJ4eTxi+Kf8XMBBX1iBsQitC
 eMtse3kYPa4wXtk2TSBcfd623EMdWEZsk9Axr5HnIgKhJq6g/bsv/a13TdoLdyZ/A65g
 p27LdFxT3wMG4atcUFXFjF4Wx7gKd7Yo4MlIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eb7+4YTwZPIai1tsUX2MFyulW3TpuQQ3q3lzwkxFRow=;
 b=jDyeOjeRfy98a29hkShS2dvkTj4XVthh+D4k6YaB9rIAIDEu4bgA7T48zB31kqlYyH
 1GsjCnO4HN7zdgj87pvbby/78X1Ssg+BqoXOu1F/N98ZDTGN7XCaKn+RqTNiCWAypdBT
 54Z7JXhrtH1dx3HNLfs8NMa86TxpztoD86sPJ5f6Buh3B0U8GrX84BGcQARCUCIm2WNm
 NfrZDcUniKuuLOBPaSJ3i5Wa4RiNKQQYAKZLQa7ceFZSD5e8ubFC0KzeR+lspw33JqL+
 WI+8X6tG/HcDudEELuFy3qZjMxodW8Wc/V4pzavCMphpVyue5KxZsHIpG8cTTGaeO5Xy
 JBkA==
X-Gm-Message-State: APjAAAVlN4vzJ/EteC/BzSQ1xFjqJ37BE96V2RCJ5a5FYCPf3nABOPnl
 aBEO77RFx3NakBgtx7KkX/Kmaw==
X-Google-Smtp-Source: APXvYqxyorOub/tc3oX4xjM6D+1C5Oaw62atk5hhMqHpFC6EWGkz1ky0e/G5dlHrY0x2U1r+CwOnrQ==
X-Received: by 2002:a17:90a:9284:: with SMTP id
 n4mr3519891pjo.84.1578554947811; 
 Wed, 08 Jan 2020 23:29:07 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id p16sm6485810pfq.184.2020.01.08.23.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 23:29:07 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH] drm/mediatek: check for comp->funcs
Date: Thu,  9 Jan 2020 15:29:00 +0800
Message-Id: <20200109072900.17988-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There might be some comp that doesn't have funcs, eg. hdmi-connector.
Check for comp->funcs otherwise there will be NULL pointer dereference
crash.

Fixes: bd3de8cd782b ("drm/mediatek: Add gamma property according to hardware capability")
Fixes: 7395eab077f9 ("drm/mediatek: Add ctm property support")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
This patch is based on mediatek's drm branch:
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.6

After
https://patchwork.freedesktop.org/patch/344477/?series=63328&rev=59,
there will also be funcs for hdmi-connector.
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index fb142fcfc353..7b392d6c71cc 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -808,11 +808,13 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 
 		mtk_crtc->ddp_comp[i] = comp;
 
-		if (comp->funcs->ctm_set)
-			has_ctm = true;
+		if (comp->funcs) {
+			if (comp->funcs->ctm_set)
+				has_ctm = true;
 
-		if (comp->funcs->gamma_set)
-			gamma_lut_size = MTK_LUT_SIZE;
+			if (comp->funcs->gamma_set)
+				gamma_lut_size = MTK_LUT_SIZE;
+		}
 	}
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
-- 
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
