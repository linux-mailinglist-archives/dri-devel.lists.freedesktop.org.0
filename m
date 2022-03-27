Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 028154E8A01
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 22:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E3010E36F;
	Sun, 27 Mar 2022 20:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8300910E30C
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 20:26:57 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id a11so10787859qtb.12
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 13:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=62kxbYjOC1Pdkwa5wMmdd0cCG7qP5qnu3ZqUiccwe3s=;
 b=I4aBTTyRTAaQtbpu3CS7l6DyrNP/QDmYqsRB8mfAv60faqVosTuBA1upMbJW6HkIFR
 Dm5BDU2Mt5jjrtSGH5UlYB6xEBkLChnrFaCcbUEnbLdNeUh1EK0YtnfTRqRPubZS3zwk
 mZWH7wUVW68Ibp56kJHs93vIOGwxa8Q+60MvuyQfWGp/GyAk2WYOkvoLvSJ0Yawo6+gQ
 fYgZIi2ThISR0qY9CyKM+P4sFEzDtXHRRJjUtSHn6eGJ+lu4Xd3EzVfbJ8QnWUWVfDlV
 fnmQQ89SmLmJKGEtYJwdUYXLI2RFJEDSPe20yHqD6D84crtbeW2G+mLf/6HRSE/XHktk
 4P3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=62kxbYjOC1Pdkwa5wMmdd0cCG7qP5qnu3ZqUiccwe3s=;
 b=gTIiPkKM992AnxcArC1F09PAVGcL7EIBTr6QC5KX0wEo9HGOZl6fsUVeRVG/Ij06Ta
 E/cgH1qcMVYI2rcOKaH6gCFANbyW+B0TepRduTaxSAkRYsKTqLBm3dy5Ts39MHyrQ7at
 MOwiQBgig/oXoflcc0kbYwqQShOyhMYHA3MHUgtdM5nehQds+JYiCNis9zyA2hj3+x9n
 xjE25+WCbzD7s5CZOD7Utf0BL0utWtaO83kmvA4AHzX9djWy9MsnBs9RbGpGgCfgd0s8
 +ApSKq00GDwttXo8+Xxe3/BXTxvfffaI6KAkRyO6+BigW2Ps1KuP3CIc6l9Wc/BEcDbU
 l0mw==
X-Gm-Message-State: AOAM530DRBd0IovOIaDqMzB/Ab1gEIvY8hoGk7zBH5wHVH/eM61jR2wY
 SteSHsBWkiDeq+AzCjFx/3Btkg==
X-Google-Smtp-Source: ABdhPJymGP+Mt3YGnp132pzn5uj/TtJMZRnQG1AYdly2XyTwO8FzqRoyNP23Ypr628vkqlXl/FFP4A==
X-Received: by 2002:ac8:5b86:0:b0:2e2:72c:9e06 with SMTP id
 a6-20020ac85b86000000b002e2072c9e06mr18354799qta.113.1648412816673; 
 Sun, 27 Mar 2022 13:26:56 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable134.222-177-173.mc.videotron.ca. [173.177.222.134])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05620a108900b0067b13036bd5sm6720386qkk.52.2022.03.27.13.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 13:26:56 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 1/4] drm/msm/adreno: move a6xx CP_PROTECT macros to common code
Date: Sun, 27 Mar 2022 16:25:54 -0400
Message-Id: <20220327202643.4053-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20220327202643.4053-1-jonathan@marek.ca>
References: <20220327202643.4053-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Yangtao Li <tiny.windzz@gmail.com>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Dmitry Osipenko <digetx@gmail.com>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These will be used by a7xx, so move them to common code. A6XX_ prefix is
kept because the generic ADRENO_ is already in use.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h   | 17 -----------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  6 ++++++
 2 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 86e0a7c3fe6df..d117c1589f2af 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -36,23 +36,6 @@ struct a6xx_gpu {
 
 #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
 
-/*
- * Given a register and a count, return a value to program into
- * REG_CP_PROTECT_REG(n) - this will block both reads and writes for _len
- * registers starting at _reg.
- */
-#define A6XX_PROTECT_NORDWR(_reg, _len) \
-	((1 << 31) | \
-	(((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
-
-/*
- * Same as above, but allow reads over the range. For areas of mixed use (such
- * as performance counters) this allows us to protect a much larger range with a
- * single register
- */
-#define A6XX_PROTECT_RDONLY(_reg, _len) \
-	((((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
-
 static inline bool a6xx_has_gbif(struct adreno_gpu *gpu)
 {
 	if(adreno_is_a630(gpu))
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 0490c5fbb7803..55c5433a4ea18 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -416,6 +416,10 @@ static inline uint32_t get_wptr(struct msm_ringbuffer *ring)
 	((1 << 30) | (1 << 29) | \
 	((ilog2((_len)) & 0x1F) << 24) | (((_reg) << 2) & 0xFFFFF))
 
+#define A6XX_PROTECT_NORDWR(_reg, _len) \
+	((1 << 31) | \
+	(((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
+
 /*
  * Same as above, but allow reads over the range. For areas of mixed use (such
  * as performance counters) this allows us to protect a much larger range with a
@@ -425,6 +429,8 @@ static inline uint32_t get_wptr(struct msm_ringbuffer *ring)
 	((1 << 29) \
 	((ilog2((_len)) & 0x1F) << 24) | (((_reg) << 2) & 0xFFFFF))
 
+#define A6XX_PROTECT_RDONLY(_reg, _len) \
+	((((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
 
 #define gpu_poll_timeout(gpu, addr, val, cond, interval, timeout) \
 	readl_poll_timeout((gpu)->mmio + ((addr) << 2), val, cond, \
-- 
2.26.1

