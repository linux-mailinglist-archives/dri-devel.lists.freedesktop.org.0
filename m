Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F488022E4
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 12:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E5A10E286;
	Sun,  3 Dec 2023 11:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E2310E27A
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 11:26:42 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50bf26f8988so401248e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 03:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602801; x=1702207601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sbKwG3bsiy6N+N1DD1CLsj/Q/q+O1WSIDYwjhlWFEhk=;
 b=jwgbVMZ5gaPYy1xopiwBW9jBimttqEGbmhdvqGNC/XVMh1I9fy5azI12UIi3X5izUw
 II87jG2VHFuz3aqOSqw2vwI/vXj+kGjzxotY9FELcrMsFQ4/CBHlNjg9u+rwhoh92sXE
 tJlwXplrvd2SvlbC5KkRy1/GKlxlUNPgA4LsG3MOXoXW2h/dKdZw/egmEWkYLS8EPrtA
 EKC+iZIQnNEVHqr01kU3p1GKu/O+SuZMTDpDU7t0bvgSw+QW7l+FA92Eyk4+l/+LBwWB
 pEGjCoQpdCk9JIPx1UZwwWdG7qkiga0pN+XHHIW3y3fUYJX8ISgHit9Ipznahz2ZYX9Y
 OclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602801; x=1702207601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sbKwG3bsiy6N+N1DD1CLsj/Q/q+O1WSIDYwjhlWFEhk=;
 b=ATwT3wfgi1tVb4D7j/SDx7urS6henAHHzYfoqIYtE4g2wrlKqI0fB3OvhAIY4ENIv8
 cVd/bg4z/8JtmPnViOFtvfl/HPB/H0TXQlwQza76UuZZzxks9K4CeS7Q1lqOO4LutU8s
 s7HTr9HBpb1yfLR4SxGXxM+/Vsk4pF/Hl9IivQ6lOd1+H5L3uj4kxLcdqEbP3HhENGQl
 udK8mrabj5LhIXwJxB9n+88skb1vufBFmzEtxaSTsyeQPdAyRw9kXQnZz3dzIOUJ/UnZ
 MEa/q+GmGDwP29j9COLeOk2qoiwyMVEKJeg37THs369gerzgKJ+TThgYOkIgv5WGp/52
 VQ/w==
X-Gm-Message-State: AOJu0Yw4T0lZJ1Kll8DIM7bcOqzv9b+4ugY2wsw9MeOUrJIBEiial2an
 u79XlM2dXAKHDLGAdErb+7SNHw==
X-Google-Smtp-Source: AGHT+IHXObFn5iWeVaQxMjM8NCWQ1Rahby/WyhApUWMTJIT7Qf7SFVR14cwLp/UcG7bQecH6ZqyZlg==
X-Received: by 2002:a19:8c48:0:b0:50b:d764:9691 with SMTP id
 i8-20020a198c48000000b0050bd7649691mr1631354lfj.117.1701602800856; 
 Sun, 03 Dec 2023 03:26:40 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:26:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,
 sm8250-mdss: add DisplayPort controller node
Date: Sun,  3 Dec 2023 14:26:25 +0300
Message-Id: <170160265545.1305159.1208126196892932328.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231107103600.27424-1-krzysztof.kozlowski@linaro.org>
References: <20231107103600.27424-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Tue, 07 Nov 2023 11:36:00 +0100, Krzysztof Kozlowski wrote:
> Document the DisplayPort controller node in MDSS binding, already used
> in DTS:
> 
>   sm8250-xiaomi-elish-boe.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('displayport-controller@ae90000' was unexpected)
> 
> 

Applied, thanks!

[1/1] dt-bindings: display/msm: qcom,sm8250-mdss: add DisplayPort controller node
      https://gitlab.freedesktop.org/lumag/msm/-/commit/52e36770b174

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
