Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264E937F081
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 02:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6656E5CD;
	Thu, 13 May 2021 00:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38016E5CD
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 00:39:06 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id g13so18667703qts.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 17:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Suj7rUF8MJYpSENOVcgNKkIQ7HdP/cqmF4RJs83xUg=;
 b=Ok4b06fm240rt6q8SJwuDlWX3p0+7j3KUQCdoVM61MLZizJKrH3WzYjt2R8/VHvuHd
 nlwYxjoVLi7VSPzGhiBjj9Ha4Hzv6Uo+Pn62IGsq/M+YOZ+gKmWIsPSO7Aitg0gN3/Dx
 zOAcsoAv8bo8pcDo+Y6KUR43zefAjHUfQdHktVOHb+916Dxmo2JHKI8lUwEop6tI806V
 KHffv1x5FOG5QrIEeBdhKrq30VOi7LpDmA7oFXZRBDDZD3IqKueXGVVFto0nqfeurDM/
 kulCd2rG9bue1lCuX3n4+ow6bDIKfsBLLLnw0X0dScRtw074SOK18O4AlF3R6EOTrR61
 EQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Suj7rUF8MJYpSENOVcgNKkIQ7HdP/cqmF4RJs83xUg=;
 b=ZTgKPLMddNmwnNWCPkahFacQRhnZ2N4gabvITOPoFaJZoi9iN/81Pa2XTlz7v9LJ9I
 U1nSDs1e6Rv2k2Bw3tr5DEPgb1W3Rr0pxP+APaiZO6nPnUsVnx79ITS80/df6LJhqQGr
 ElF6ai8i3cQ5LStjlNeFyeXC5F+RQMU0W/2mnowFQUcQpybIU3x7PPDh1RVNl4XZ53Iw
 BnqpSEGq9l4iFc1dBQebpnv0y0I0xO9xCsJ0shzLc1/NHB01WSjbSbcozTYxKbGOCSAB
 ZYgWEdn+LntCO2JwMrTwfnjbbsF6a5yCKqJhCNIHPLomJqW948X8lfDri962RMvhKLjM
 E/Yg==
X-Gm-Message-State: AOAM531uwAwipCHa9Yk9CiYc6bWp6HiejQVC/wNhVTLdpheFwayJUUib
 1t3jJgvFg3G+tTih5uqnLrxudg==
X-Google-Smtp-Source: ABdhPJxTw1P3oaoCV0WfoXRiB/+wKSwQTK+iAtqp6IJbfH0cUqEkpY2KsJRruijFgA1FamuFr24gBQ==
X-Received: by 2002:a05:622a:154:: with SMTP id
 v20mr4064234qtw.91.1620866346172; 
 Wed, 12 May 2021 17:39:06 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id w16sm1204201qts.70.2021.05.12.17.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 17:39:05 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 2/5] drm/msm/a6xx: avoid shadow NULL reference in failure path
Date: Wed, 12 May 2021 20:37:46 -0400
Message-Id: <20210513003811.29578-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210513003811.29578-1-jonathan@marek.ca>
References: <20210513003811.29578-1-jonathan@marek.ca>
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a6xx_hw_init() fails before creating the shadow_bo, the a6xx_pm_suspend
code referencing it will crash. Change the condition to one that avoids
this problem (note: creation of shadow_bo is behind this same condition)

Fixes: e8b0b994c3a5 ("drm/msm/a6xx: Clear shadow on suspend")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 727d111a413f..01bd31b3c504 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1211,7 +1211,7 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
-	if (adreno_gpu->base.hw_apriv || a6xx_gpu->has_whereami)
+	if (a6xx_gpu->shadow_bo)
 		for (i = 0; i < gpu->nr_rings; i++)
 			a6xx_gpu->shadow[i] = 0;
 
-- 
2.26.1

