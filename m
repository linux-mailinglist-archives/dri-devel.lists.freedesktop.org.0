Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921EC949A67
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 23:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4124B10E416;
	Tue,  6 Aug 2024 21:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IRHA8mmp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49AD110E32A;
 Tue,  6 Aug 2024 21:45:07 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-8318b4d9539so344222241.2; 
 Tue, 06 Aug 2024 14:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722980706; x=1723585506; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ExF0I54rVQ6tXCiWTPMayTxL+v0amgllwXMPlStcwYw=;
 b=IRHA8mmphfBAPRa8u+qrigPPJWmLpFqTvLV2QAIecQF7sXGaUqcWnoHke9Wukzz6rS
 HYvd++rVXiuAvn3Fj1MU8cpVGI7+7vdcZnFSCAZxmrexJStBYJTaS8uxJKW7WKs/FJBr
 roX2v3K3qoUfIIt05UizUBbSVOxvnTaAw2p1/Z2Z0WFHZ9WR6E/fWWP1n+98uKjfN4SQ
 lPtIGw2WOR5lcqYGcXYkjpGRuaN6haWIUqwz0Tql8pK0HfP+JbRzaULK92tSJ38lBHKQ
 x6lh9mSQuA89dj/5ofIwJ0NvCsc7VNbB4JjiZlvy13dUf7mznjNAC9yeKa0l+FwanrIw
 flDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722980706; x=1723585506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ExF0I54rVQ6tXCiWTPMayTxL+v0amgllwXMPlStcwYw=;
 b=jNmANlupkeRiKolLNZDgCh4wjiTyv6rAWTz19w2z3fIItHXnvucsEsF0oc191h9tWv
 1XV9r3+cM4LW9JRU1pjK6dbkgnQGmvVAVwqa4kwCgpKfiI59LV69g3jeZk3GgKsV1knP
 yLnmgDqQRfbD4YXV0d3x/04IGB8dOPA11HgY9bfYWb5KUaLr+yHCL0R00DFlJGgZZDFF
 FIfbALYxo9Fa3MNpVN9B8WPGLitPgNt9zuCP4qp45DUBr+Z28jDuq/lzjU18NOG8ItWx
 nF42r3gnpbS5xWk7unQCIDv34JHaDAu/im24hJjUAd8jJZnkj9r1NxxGLr5ivlkiwF1J
 IRRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF0mFDFy5wdH+nMxVLmEovuC5GUVrtGywtjHGI3vLv7S+2xtakKQ2oKNVgBs6sGioebj3YhJz6eZc3hlG6RFkxPrKWoUOIkuLFTnDY9zygIo20Ts14GJr3CrwXdejGjjY57IYYhm8pi3w6aunrMOqe
X-Gm-Message-State: AOJu0Yxa6bc7OoGSv9KXeuc/jNl2N+B01t6IxL1BZUQ7XcGQQh2Jnx6Q
 17u305QEU5nroTigCHRnD5/sUU+jbPT3HOn3qMb3nPLug3vNapWK
X-Google-Smtp-Source: AGHT+IGQSk4H+ekGkXPzhj2MglCcmJb8GS9D3JN1uOWjcxRZMa6l9FsPbXeBM6xvTE4w9nbmcmuNHQ==
X-Received: by 2002:a05:6102:4194:b0:492:a883:e1d with SMTP id
 ada2fe7eead31-4945bde70cemr21425272137.11.1722980705727; 
 Tue, 06 Aug 2024 14:45:05 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb9c7b64b3sm50474396d6.59.2024.08.06.14.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 14:45:05 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 1/4] dt-bindings: display/msm/gmu: Add SDM670 compatible
Date: Tue,  6 Aug 2024 17:44:55 -0400
Message-ID: <20240806214452.16406-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806214452.16406-7-mailingradian@gmail.com>
References: <20240806214452.16406-7-mailingradian@gmail.com>
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

The Snapdragon 670 has a GMU. Add its compatible.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index b1bd372996d5..1c055ba64038 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -91,6 +91,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,adreno-gmu-615.0
               - qcom,adreno-gmu-618.0
               - qcom,adreno-gmu-630.2
     then:
-- 
2.46.0

