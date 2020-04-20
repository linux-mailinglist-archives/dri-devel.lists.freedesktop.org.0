Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A0C1B01DF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 08:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569556E1A5;
	Mon, 20 Apr 2020 06:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B235F6E178
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 06:08:45 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id n24so3547860plp.13
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Apr 2020 23:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SezQvaqjYLbKiOOQWAcX/3BNfbHbuPlMP92AcIlOvpA=;
 b=mh7u/Nzr3V0kjSRxTO0mKkatpJU809OLSLJJlsFt2qqISf72DiGj5xWDQAEvljElfV
 FeYKApqTjmmOh8eLf4oP5EPyFuKRdTWijq0Bt4MVVh7MOdqoryB1MbCic8WbRgfkq6eg
 E9a9BiB+TFtHM9d/GUjKY4K1Jx3aDv8xSb9Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SezQvaqjYLbKiOOQWAcX/3BNfbHbuPlMP92AcIlOvpA=;
 b=Zy52FrPnveA77XIJguOcwz8dvhVe4cw7uvsOPsp7b4mv4wHKWLNlFLxPI9VtgLHAD2
 GbvDh197MiE5tv1VtGxpTHx6aX545RiJAars+ZN6TL8xERZaPJ+Msn2GbN/KcBmMVYY4
 FRzhVnZ80Uyf9iUGuJVEo3ZJxcRLle43WyyN5/LdmKZ5sFT0ht5RrQ8bFcelzuiAqn96
 5GR/HeWWv1mF+h17yrLaGk8jWMXJ+9DZiBbk2kbqakbB4kJC2gR0EqULz/RtmP0Nt71I
 KIlEdDy7FlMSOF0hj8VHERekXxsufdigyJd0mq9+mMJa2SFBtJkRc6dzoBXYFXEl4gDn
 Hqmg==
X-Gm-Message-State: AGi0PuakvgDKM+Jr9tBkqaB0RIsYW4/M3foEcSTiVTymSC0BlECgTwgM
 QnveuRpweow2JFuax03yi9mFOg==
X-Google-Smtp-Source: APiQypJ7/kohKua8cbRIlf5c1h2ySfX9UyLVzIyb/i9csqaqSHKdHfXhwGV1/987z+JuCjIkPug5+Q==
X-Received: by 2002:a17:90a:340c:: with SMTP id
 o12mr20794100pjb.22.1587362925217; 
 Sun, 19 Apr 2020 23:08:45 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a274:40bd:f640:b6c6])
 by smtp.gmail.com with ESMTPSA id t188sm21384pfb.102.2020.04.19.23.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Apr 2020 23:08:44 -0700 (PDT)
From: Anand K Mistry <amistry@chromium.org>
X-Google-Original-From: Anand K Mistry <amistry@google.com>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: stop iterating dma addresses when sg_dma_len()
 == 0
Date: Mon, 20 Apr 2020 16:08:34 +1000
Message-Id: <20200420060834.44461-1-amistry@google.com>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 20 Apr 2020 06:55:01 +0000
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
Cc: matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Anand K Mistry <amistry@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If dma_map_sg() merges pages when creating the mapping, only the first
entries will have a valid sg_dma_address() and sg_dma_len(), followed by
entries with sg_dma_len() == 0.

Signed-off-by: Anand K Mistry <amistry@google.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index b04a3c2b111e09..f8fd8b98c30e3d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -224,6 +224,9 @@ struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 
 	expected = sg_dma_address(sg->sgl);
 	for_each_sg(sg->sgl, s, sg->nents, i) {
+		if (!sg_dma_len(s))
+			break;
+
 		if (sg_dma_address(s) != expected) {
 			DRM_ERROR("sg_table is not contiguous");
 			ret = -EINVAL;
-- 
2.26.1.301.g55bc3eb7cb9-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
