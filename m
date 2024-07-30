Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092079403E6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 03:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1041010E26B;
	Tue, 30 Jul 2024 01:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mVK7VsHq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1864610E183;
 Tue, 30 Jul 2024 01:38:53 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6b7b28442f9so43846046d6.3; 
 Mon, 29 Jul 2024 18:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722303532; x=1722908332; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R5V8v6mJVu45H98XTICckmU1hS1yE/o0aFhw7aKg4Kw=;
 b=mVK7VsHqGqZHiDg4dzGRv2G3oTBlCCZCAxZ1cXD1hQN9ToAIpZSK3+GLMfGPvZne3q
 +h4LnWFx6m+A6I+dwvMa+sjjJTq4OG/g8zplsGBKDpCjJLQiLVSnQMyBwaBhDFu+1WK5
 Am64zgTAdwBmdcvB6TYGbODUa0Mudm572n0iT0ZWaSOOG6KKTVBqg4IuhbvFAm9T96UA
 QMdW/fsGqYyWj3fjJjwffBQ5sRqWL9UqcvN5WcqHJ6QMxxR2X4W7S3M18K4pblubCfQL
 GjsfpAWGndeJg7/gcrG66s3cpTpJmwGlRPjNAOD49j+L8ujetqtzUm6Z4LwIOjpOTMga
 ZDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722303532; x=1722908332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R5V8v6mJVu45H98XTICckmU1hS1yE/o0aFhw7aKg4Kw=;
 b=enaOiup8fdhdoWNt11SPyj+FrbFNuS40ILuK7oKZXM9sziHzuBnkkKk3OEuml55BKD
 7h7gGaRLsu862crKkMZXVaV3SQ8KPkasx+kIBmGN6GdZ/69RVR/8CgbZY7RdofpfEQfn
 zMxHg2ZIzHTSCoXaFJ3nCDc7DhDTAfD4hAzPCd2ViqG+mrl3wq1f0xEod/0W2O4+A5L7
 oJF8YIFV3BJl25ZYWoRlqG+cCM0j9z6dcUyvsn1tqpLHBjza0MXCux8rABIfmozQCINe
 NlIffb45wWzazM7bbCO9fVlBK2NO0OlaujgjfVuvzHY+29WFLdUl/ReNwXuNJQ+LPd8l
 6FKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnojWdzNOnCSKuJJtK3NDFQico05goS2fkfxefVjtMfTG/fdTCrmMYGyZruI/dXRBvFtDFAr3PX5+89oPP8Ud+iqhZN+7HJiigVURGQdFOfxhorknDNjHVporyXLY4et+7qK0TTtFQ8Hmewtlaq2uj
X-Gm-Message-State: AOJu0Yzrn1uK1L2tQC3c4SHPfZCkXU44R3nWZkxwTwpp83HCqpgKiNO+
 Ogv4oOoKkaAAnsqxNizTCqciyw8Vf65bVJnj/tjw1TFkpgVrhCvM
X-Google-Smtp-Source: AGHT+IFAXnDbbOCYtDoXYpx9BApuVpqU8RCmPc/YjsBZVC5fX+KPk+EzHwB2giEEE4IPMKHBD+VtPg==
X-Received: by 2002:a05:6214:2501:b0:6bb:3f69:dd0b with SMTP id
 6a1803df08f44-6bb55a1a621mr139961136d6.18.1722303531781; 
 Mon, 29 Jul 2024 18:38:51 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb5bcffd18sm36115946d6.15.2024.07.29.18.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 18:38:51 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 1/4] dt-bindings: display/msm/gmu: Add SDM670 compatible
Date: Mon, 29 Jul 2024 21:38:46 -0400
Message-ID: <20240730013844.41951-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730013844.41951-6-mailingradian@gmail.com>
References: <20240730013844.41951-6-mailingradian@gmail.com>
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
2.45.2

