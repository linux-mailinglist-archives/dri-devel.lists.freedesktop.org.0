Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 972E588FDD1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 12:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D6C10F542;
	Thu, 28 Mar 2024 11:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FDxHyKfw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B7B10F53C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 11:12:20 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-6e704078860so776171b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 04:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711624340; x=1712229140; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tLELEYK3dmk1bj+WVnvKaUvN2XnDOjot5qdxPMzZado=;
 b=FDxHyKfwuikr1UpbLBlcCO8UuVDgQZ/uU5HQDQ8mXO2qc5Z6vuKyWQUSh5fosID5ai
 Qektw47ZSd2vYo52cpXtm26/0nyYpgtDamZ8LWDqJ1w29zKW5i22wnJjjregTPLje8xk
 r2vzf1I2Crgp29M1L5snf9e5tj9g0RIuCAx6ouMfXc64EqiUjsMCs0lrJ+f43AuHOco5
 Ub4ukSBvKMyOKQpOe8M1UUss/cE249bu5k/UYDzH6V4cbr8tD+g24/R5PMoIpIUPwlZb
 686Hi68Nn2DbZextJ/1ors/vQ6BhwvPi793W3YxXGDRwrcAMSwuGUEYaq6vpmEZxLsbd
 6VlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711624340; x=1712229140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tLELEYK3dmk1bj+WVnvKaUvN2XnDOjot5qdxPMzZado=;
 b=LijdxhIOioTc9QYEdOAdtP6czNFhlwjSY7aSVcSpfjCkZGt2XqEqcqn+e9nN9SPiGT
 6gvwTbFRnsYjJCUWsAvBQy4YT47t3GU1VJhyT10574OyPfYaaHp0hiZjRzDNW3qiojCS
 5QvZHZcZ4fGdLm+PxVRvEWd3H0Ya47osCM4Oo1y/QBI+AoeA11rlCPnHrIdIbQ9WOTn3
 5deCBAyADiDwX0tWOr0zoK44S89L8Inh8W5tSYui0YxYmskmqwVEA2ue2UhywAt1tb0l
 MmBj2ZrzxklImio7d/h7ERljaGQlzvc7z74psGQ1pn2GpFC0uBrLdFiykVXFK8sbhzia
 RBQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPB0dYQ661LUqVLewb1EznSWZYn/UR3w9T6e12y9PQgn0srPmI/Ck/rzFXxl4VvyLVAAQcv1SAHrr+XJpZgBTijPm+ZlhM30dx8N9zNt+L
X-Gm-Message-State: AOJu0YxmJeXVp0eGg5xfeHWDCBRjOREPohLSuWCejxqrZRk/Va8+p7mT
 v+0KIMbQx5U26FI5d8y4FVOOYnRAx2KSMDqolV+AUwXb+yUmUw9N+RIY/W+5KzM=
X-Google-Smtp-Source: AGHT+IFLXKC5s6Z3XmJzfcHVzUC7h1Aa6EP8dyjaeT/CBWRnkZMa+UqmlnyIhHgHNoCLgPYqi6OHpg==
X-Received: by 2002:a05:6a00:18a2:b0:6ea:baed:a15c with SMTP id
 x34-20020a056a0018a200b006eabaeda15cmr3091585pfh.4.1711624339083; 
 Thu, 28 Mar 2024 04:12:19 -0700 (PDT)
Received: from niej-think.bbrouter ([112.65.12.82])
 by smtp.gmail.com with ESMTPSA id
 k7-20020aa792c7000000b006eab9ef5d4esm1114607pfa.50.2024.03.28.04.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 04:12:18 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
To: neil.armstrong@linaro.org,
	dmitry.baryshkov@linaro.org
Cc: sam@ravnborg.org, airlied@gmail.com, daniel@ffwll.ch,
 quic_parellan@quicinc.com, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 marijn.suijten@somainline.org, sean@poorly.run,
 Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 2/3] dt-bindings: display: panel: visionox,
 vtdr6130: Add mode property
Date: Thu, 28 Mar 2024 19:11:57 +0800
Message-Id: <20240328111158.2074351-2-jun.nie@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328111158.2074351-1-jun.nie@linaro.org>
References: <20240328111158.2074351-1-jun.nie@linaro.org>
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

Add DSI mode property and compression mode property

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../bindings/display/panel/visionox,vtdr6130.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
index d5a8295106c1..36ae94fa96ec 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
@@ -26,6 +26,14 @@ properties:
   port: true
   reset-gpios: true
 
+  enforce-cmd-mode:
+    type: boolean
+    description: Set DSI as command mode. Video mode by default.
+
+  enable-dsc:
+    type: boolean
+    description: Enable display stream compression
+
 additionalProperties: false
 
 required:
-- 
2.34.1

