Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E5F640629
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 12:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8661F10E6DD;
	Fri,  2 Dec 2022 11:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3596610E6DF;
 Fri,  2 Dec 2022 11:52:45 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id v8so6191633edi.3;
 Fri, 02 Dec 2022 03:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NbApf1anPXhkyL1eMhU3x4CauZkX++vBii8PykYLja0=;
 b=Zaz1ET+G1SWchZ+VgoJoMcRplKphEziazSa2ThOiA/jFoSYOSbYC/0JWmbk7indYGE
 ZNKMyOgAmUOqNDEv9TUk/yPiJfFZkIKOcnLiuk7lFX+eXBoL6pMBgUrEf3KpCCqeJ/qo
 5exqrQ1zKJlL05VIAa7DhkMb1bOyy9MePplKkiSQQh12oUA/OthYWtBMqG8Y/Fm2BMyi
 WlMKCLlUyCo+9gj9XV4nNWp1GoeRH4V3xkcy4dssda4Ap2EKC4gQoaH6o6deopLDVDPl
 2YjPZ0RBftgHbuCkasZZbFvPihe9aeRTPIU1M+nLd/Ccoj7JLw1YSDnIs/jDREcL/5yG
 siUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NbApf1anPXhkyL1eMhU3x4CauZkX++vBii8PykYLja0=;
 b=0dcELoobyXxqB2dlNk6Y+PKkXBrxRycJA4CSPo3mVjDleB2L0gCub3FEA1flQyYFyT
 2WneypTHk+wEkmFfV5jLXv6ogt9nMp1V/viZl69/yiYStqtJDFCHJWp/8EMhyvP9P/R1
 FLOCmDy/2urC7BagNTOnFoyBumltnklwzVDS0Sj/zq2x0U75bPTVFcGC13dHjTmhntxH
 I/PkNP/bZuBPqDHPPGT2Cu4SuJIz2eg2I2SHoybUvcWJXoVjGnkk1b0eV9lff+FuWXvB
 72fxEvCGuGiMthVpdrMR4HqCVJyesBReth0TXYQDGwX8+abdRF+mkHN+dLhl1HmF7G0+
 +fMA==
X-Gm-Message-State: ANoB5plNnS5fl3aADSxBlHOaKITXDxzaYmHettKQQJvkXI7ffYGhkH2a
 EcF7rTve3yiFsKBWyp8HQ88=
X-Google-Smtp-Source: AA0mqf5u8WJUjMkgmdOQWN0p+3lPuMNPUEsyeQq7hpK3juNAdPo9O2CUMmzQw/QKtlOmoJlwzM+H5w==
X-Received: by 2002:a05:6402:2404:b0:467:67e1:ca61 with SMTP id
 t4-20020a056402240400b0046767e1ca61mr12816866eda.27.1669981963506; 
 Fri, 02 Dec 2022 03:52:43 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
 by smtp.gmail.com with ESMTPSA id
 ha7-20020a170906a88700b007c0bb571da5sm1206762ejb.41.2022.12.02.03.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 03:52:43 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Subject: [PATCH v6 6/8] drm/etnaviv: Warn when probing on NPUs
Date: Fri,  2 Dec 2022 12:52:18 +0100
Message-Id: <20221202115223.39051-7-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
References: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, italonicola@collabora.com,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Userspace is still not making full use of the hardware, so we don't know
yet if changes to the UAPI won't be needed. Warn about it.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 37018bc55810..3cbc82bbf8d4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -765,6 +765,10 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 		goto fail;
 	}
 
+	if (gpu->identity.nn_core_count > 0)
+		dev_warn(gpu->dev, "etnaviv has been instantiated on a NPU, "
+                                   "for which the UAPI is still experimental\n");
+
 	/* Exclude VG cores with FE2.0 */
 	if (gpu->identity.features & chipFeatures_PIPE_VG &&
 	    gpu->identity.features & chipFeatures_FE20) {
-- 
2.38.1

