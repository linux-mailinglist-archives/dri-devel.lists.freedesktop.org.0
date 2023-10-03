Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AF17B5E97
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 03:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F367310E19A;
	Tue,  3 Oct 2023 01:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B0810E195;
 Tue,  3 Oct 2023 01:21:41 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-41995d42c3bso2951141cf.1; 
 Mon, 02 Oct 2023 18:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696296101; x=1696900901; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3/FjPGL9FZLD3HPQhfLZqhNvGFa7zL77tDFLRHXNnA8=;
 b=IezNSpLR/VbqKIC7xGZaLTtQ5BfPpMb4X7MZ0BR8uSybtzAN9Yc4uS6ym+4KiwHnw1
 7GgM7HEmpAuM1VJePLyftY0FzjYq7PCPezend4P4vBvrONHI2zkAFbNNGgX3zb4k2Vde
 gWqorns7JZC3pQtaBMmyupMq6ynL26CqjfmvwwlPyNkDmfCMvYYouM7hayCoHoYc4wNg
 LEejvsdOLV+zq5zfSs6dn1tDsprqT9glc/LmUkMMvrBTdUy3/Xft9DzspAVzpzLMznii
 wjx8wu8K0jEF7cS1kC3PGJGQi2uj2HhzGuHr+HrZPTRJditE6EoOfBaUBPkDaQndZ2rv
 rFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696296101; x=1696900901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3/FjPGL9FZLD3HPQhfLZqhNvGFa7zL77tDFLRHXNnA8=;
 b=YW3tWrGHXSw7FN04XIcdI1iC3vQPBxjnOuSm5gcSa7xsH8z96vlzFmYsIVbn9tw3A4
 ixVcLsokjh0Q9QDSOPScO8SvhCn891zWJIkaMs1k0eGqLQQLMkWRt7LLvaDKAUunPQkf
 h4CUIl/lJclPhq0MgGkDVsoWPuIH3TK4ahyQ/C4Fj2Mr+hXVhYsAbbWhapBCEVjVT7PI
 KAha8VxPFcwrkbkZc9oEfGBcE7Ncn5uU9UdDj50QSjaZZ1xxGFV8e5vg1teBvuhQRXdn
 wZ+obcXvYx8+uUjC25d+a8wqF/lQhMmd0SJStPExs2Fi4FcP9zwf4KUYt8usGV2k12Aw
 RL/g==
X-Gm-Message-State: AOJu0Yz5Tm90AQ7e8jDbH/1wzk1JKkUazr4cWUhcIYvEG3x44uheqV8K
 RYaEhyyus0XqQ6jLl6s0Z0XBkE2U4K0=
X-Google-Smtp-Source: AGHT+IGUk13Af36ePkPLK8OB/CE3KCsi4/aGMCMeOYFW3yq5+hgdDKY93tE+wZpuDlClyIr32vn6cg==
X-Received: by 2002:a05:622a:1653:b0:418:11c4:bd34 with SMTP id
 y19-20020a05622a165300b0041811c4bd34mr12285402qtj.35.1696296100693; 
 Mon, 02 Oct 2023 18:21:40 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::efbe])
 by smtp.gmail.com with ESMTPSA id
 f15-20020ac8470f000000b00418be3e365fsm71687qtp.1.2023.10.02.18.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 18:21:40 -0700 (PDT)
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
Subject: [PATCH v2 1/6] dt-bindings: display/msm: dsi-controller-main: add
 SDM670 compatible
Date: Mon,  2 Oct 2023 21:21:22 -0400
Message-ID: <20231003012119.857198-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231003012119.857198-9-mailingradian@gmail.com>
References: <20231003012119.857198-9-mailingradian@gmail.com>
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

