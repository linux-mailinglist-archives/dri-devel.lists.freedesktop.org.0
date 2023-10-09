Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4327BEF2B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 01:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CE310E157;
	Mon,  9 Oct 2023 23:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3F410E0D7;
 Mon,  9 Oct 2023 23:34:02 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-77433e7a876so335398885a.3; 
 Mon, 09 Oct 2023 16:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696894441; x=1697499241; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3/FjPGL9FZLD3HPQhfLZqhNvGFa7zL77tDFLRHXNnA8=;
 b=K1qY3BZ82nNPJaCzvG3jqg70bgNin7KsMvZtYoMHoEN+aB21CRGB26R8p0ZVKzZthU
 FcOUabRJAlcmd1zVRjcZD1dw1jQgySCG8G+tEqhqN+Jarrsk6OE2lWFCdo1nqgBtigYY
 rymWjhSB54U0OVVZx84fKoeefHsW65MNBjIpISafAgEqKGumMgxMnD0wmDtYZTSRzfV+
 2eQS4ypi9g4FcWKDy8vcwWCPBP/c+Q6qkeW3MJB8Gm3Y3ps4YXVO8trTaDH4FNO1Mg4t
 /oX/0iYJfitjdDUlZ0TExwttxQ4L/ToTtDjORXhpbdGqJMjeAuj5vCK3QySUayi/iX41
 eh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696894441; x=1697499241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3/FjPGL9FZLD3HPQhfLZqhNvGFa7zL77tDFLRHXNnA8=;
 b=Zo0cyo7cwkfpcXyynZqKBp57WPFy4hDzDuCH6xClTHP5XXptnaCr0HgIOG8OrPXa4M
 RAa9tjYAE4anJRJPGtg+kIgnZ76AT7AZ7TkXE1biLQsjMrCdQeSzi96fpFN8eV6D25zs
 Qa22EUE49MbJnb6be6va0gJZUneNhI47mRO9uDH9TTppxAt+Bn8G2zaZBJGQCfh6LJ77
 B/xdREJ5N6IIsXPbaoNU4T4rZNALhxXCHuojgpXphpCLjHmAYYVkepIJWHzrqc4egYyn
 53dmNcHBL0rflA+Eoxby1poTtazxc1tR1iJb7eIY/1/YZ1ogpUJCNjKmU4FUvEzHY9Na
 Dt/g==
X-Gm-Message-State: AOJu0YyWATpvE3yDoiipf7lO8rTMdbD5IHsGxeVsXd2S6HO8RbcOEEew
 fbLW/D1n9zYX+/P8+oau0uM=
X-Google-Smtp-Source: AGHT+IG6BjRJbCm0Sewo/jxXjinU+q5QQp1XciLBTnEAbkm31qvhNlKnd6xUDDPQGtJ35BU9VjPT4w==
X-Received: by 2002:a05:620a:4312:b0:775:a534:c010 with SMTP id
 u18-20020a05620a431200b00775a534c010mr18904176qko.57.1696894441162; 
 Mon, 09 Oct 2023 16:34:01 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::1d3d])
 by smtp.gmail.com with ESMTPSA id
 ow10-20020a05620a820a00b0076f35d17d06sm3878553qkn.69.2023.10.09.16.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 16:34:00 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Ryan McCann <quic_rmccann@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Liu Shixin <liushixin2@huawei.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/6] dt-bindings: display/msm: dsi-controller-main: add
 SDM670 compatible
Date: Mon,  9 Oct 2023 19:33:39 -0400
Message-ID: <20231009233337.485054-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009233337.485054-8-mailingradian@gmail.com>
References: <20231009233337.485054-8-mailingradian@gmail.com>
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
Cc: Richard Acayan <mailingradian@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SDM670 has DSI ports. Add the compatible for the controller.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index c6dbab65d5f7..887c7dcaf438 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -25,6 +25,7 @@ properties:
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
+              - qcom,sdm670-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6125-dsi-ctrl
-- 
2.42.0

