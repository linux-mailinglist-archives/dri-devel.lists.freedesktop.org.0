Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C843C85A356
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 13:31:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7235D10E3C5;
	Mon, 19 Feb 2024 12:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LhBGA0v1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA4E10E3BC
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 12:30:56 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-51181d8f52fso5451411e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 04:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708345854; x=1708950654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=InV03Ory8WK5p4H1r4kGN4/4DZ3sZm57s/DE6ff4jSU=;
 b=LhBGA0v1bsngbclPwoiKYNjOqR6o5gIFcOevoUQSljtd1W6679QzRn+R+LIql4WTPb
 dqmmUaJCmNLR38KS/2Mtzox6uMfAsyFrXCBr3rnwz2L4drV/yaSn1yhxx0+cosuqQ6Qk
 7JaLwEZz364dCyLTs/W7tkzzZV82TfwcFsOGyTkdrDkA2VTmAyV2LZMKSbzdRUPIjIxQ
 fErW2fXDdOGPQ+DKKulw7eyWggJUmnEpkeTCQTtrcsqLuX42nfb2cCdgwdzn/IeFz92I
 mlp2phgJKlArDVQERflWN4otTj/8QuOB8XDbspZY+jXuwJ+HVzLnALeY6KxM6I7qGp2N
 fLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708345854; x=1708950654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=InV03Ory8WK5p4H1r4kGN4/4DZ3sZm57s/DE6ff4jSU=;
 b=W7FetkuCaZeOOy7MSZy10UOvLpZxY2VkdMjZtvhah36ZzEigU70TAhGwRhmhWDlhcr
 SW9+mxRCsj4RaRtJryxxtzKrqfrmzXIvBeOtQr1QNKLpFbrRyLQRKj+H1vH5q+Q30MqZ
 QXVk9zYiI119cd2Wh+9zDj3MyOcrchL/5JgDVlrhTwLRKiQWLycl3ixaH2oJN4X/zuyA
 EVN26QO/crqp7D0O9YbmoN8TTzOTWTm3iFAQkk1WWH65+rgg0IHP4q94uiQN6YONNiLH
 zwNiFQzkQJiEgBbZsH1qSfO2whcYRLtAWso/1/tR1oxdM3ictMyRJlqW/lZoTuywpfj0
 ZjUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWax1Wtgo6ygqTN6VQ+Pe0UAL0s364XVauuU2hJ7f3tA86AZt/m7i/7PpjcsuNz6vaTZEy5qAe/OA/0gacwnZg//+YWrvzgulsYuxTEd0H1
X-Gm-Message-State: AOJu0YysrSnnAv/9U+uy7ib5j/sJqYPI+X5Be43ECxzf2Qzi6vm1qCd5
 o6GG/zbM3tMm5mw+Sh3z7zoQdi5UgA5wPCTZ890tF2Y1uxKv7Je7M0YvQ5VTiKWuH8wMjT1/6Cn
 H
X-Google-Smtp-Source: AGHT+IEcY4yQmQxAJ4WiHYNwm13YvwEPV231BSoILkJGjdFG/MMBbHe/M71wgEdW0/b/Egu1Mq4h0g==
X-Received: by 2002:a05:6512:3ba8:b0:512:a743:3ce3 with SMTP id
 g40-20020a0565123ba800b00512a7433ce3mr4488709lfv.23.1708345854485; 
 Mon, 19 Feb 2024 04:30:54 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:30:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: msm: sm8650-mdss: Add missing
 explicit "additionalProperties"
Date: Mon, 19 Feb 2024 14:30:43 +0200
Message-Id: <170834569504.2610898.11072295234530995616.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240202222338.1652333-1-robh@kernel.org>
References: <20240202222338.1652333-1-robh@kernel.org>
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


On Fri, 02 Feb 2024 16:23:37 -0600, Rob Herring wrote:
> In order to check schemas for missing additionalProperties or
> unevaluatedProperties, cases allowing extra properties must be explicit.
> 
> 

Applied, thanks!

[1/1] dt-bindings: display: msm: sm8650-mdss: Add missing explicit "additionalProperties"
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4825b207002a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
