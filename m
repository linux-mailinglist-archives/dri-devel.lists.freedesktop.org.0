Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BE7892D60
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9DD10E2C4;
	Sat, 30 Mar 2024 20:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PIb3417Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D168910E2C4
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:57:31 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-33d90dfe73cso1484192f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711832250; x=1712437050; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T4h+mExzuExAFnvHSQe+SRMmh7AbxjHaFk8xtImqtg8=;
 b=PIb3417Y2VQIqu+W9EEjCDBA9JkpaejmosayRYs4C8ie3FXMG8FwGTPKtD5L9UhDDF
 jFA8zyKc2+AHyXNafLGbxnVQ+ex8AOxgTHKiX28ICDXNUsDg9vLHLDxj9W7NKdO9YPOT
 /2nufp1X8fadGI1tNyYQCemZ2qUPlAflmoGhqJqemA1hKkGTwsi8TYkEca76lFvGbX7W
 Wdt/EryKKnOATOhqNbS90zLOs1r2ZrNjuOMYUCIgX5n6uZMlZK//lOO3EdsQ7xclGdUu
 Q9Tcrj0QGALIos9HbpnGVvHmKNQVsd4ptrgnVOjm4weQVv9iN5dAbuZyiRa2qaJHd5s7
 zG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711832250; x=1712437050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T4h+mExzuExAFnvHSQe+SRMmh7AbxjHaFk8xtImqtg8=;
 b=B+AXmYshAEyv1w2Y/BD+vciSRPvy7citMxpUJ6gnSQWSxYX4OdMFcOk+/fMlIBUPpE
 cNX67MTsDXVBnhWsWz93zz2pz+0zPKMII0nSgM1EH+w/AfXny2ojWa4LMBqNDj4VgzpP
 W1H+ZXvxa8iir6Zh7yZMgRhvicXoiT7o0dBES6WrLHtaJ/V4v56bzdJ63/9eLwCpPqi7
 AHhW8aXtkYcoDDNLAKMddMweOxqsOQYiekG35Z+5sm2g3w2yLvgkNPXmL/8SgpC9Q7ej
 JR9MQMtqcN9XGUNLYi66ZP2ZdLd21xeBu7KNo+Ha0YeeqxTNej79BqN4YWxmSrvXsU1b
 gtrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRkImYK5O1Ca54jX8/okfDiCCe2+iWSKmr6M9PfklQFuXiigloIaXcb1f6JPwUf3Gw+GSv59shEcRkxccPbbbYJFiItgaYCeBW/921Gyf1
X-Gm-Message-State: AOJu0Yx9wnFVUxKCtKMm4vRsdmhgsjkno66LhcdedIHfbQku9nbe5t8u
 lLqV37y9m7drO8vCjnzknclv5tZgfprSRiRgjTQkELBhBHaNIHO0cmF+m+UkxPZMbuyzdeQtqgy
 w
X-Google-Smtp-Source: AGHT+IHrRVqigNTr3fU8x+o74S1SpMr+gA+rosmq6f26SYPprbSWdW+W/87/gdT0ZbaSY2Zb70cL7Q==
X-Received: by 2002:a5d:5408:0:b0:33e:c0f0:c159 with SMTP id
 g8-20020a5d5408000000b0033ec0f0c159mr6926742wrv.10.1711832249963; 
 Sat, 30 Mar 2024 13:57:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b004154e48bcdesm6295786wmq.14.2024.03.30.13.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:57:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 6/6] drm/sti: hqvdp: drop driver owner assignment
Date: Sat, 30 Mar 2024 21:57:22 +0100
Message-Id: <20240330205722.93801-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240330205722.93801-1-krzysztof.kozlowski@linaro.org>
References: <20240330203831.87003-1-krzysztof.kozlowski@linaro.org>
 <20240330205722.93801-1-krzysztof.kozlowski@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/sti/sti_hqvdp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 0fb48ac044d8..acbf70b95aeb 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -1414,7 +1414,6 @@ MODULE_DEVICE_TABLE(of, hqvdp_of_match);
 struct platform_driver sti_hqvdp_driver = {
 	.driver = {
 		.name = "sti-hqvdp",
-		.owner = THIS_MODULE,
 		.of_match_table = hqvdp_of_match,
 	},
 	.probe = sti_hqvdp_probe,
-- 
2.34.1

