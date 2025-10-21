Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A90BF7023
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 16:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E99F10E607;
	Tue, 21 Oct 2025 14:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W8axM6ij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FFA10E603
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 14:16:51 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso47695325e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761056210; x=1761661010; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GH+Au8Z65JXGAtAPh2UGeuug8ILOECULe8PKQvQu4p0=;
 b=W8axM6ijTrmfT0GLYuCOMUl7U4PuTQ2x2QfwVez0U1npuDMzsNd77YxR80RUuwdi7h
 4O1XGkOto8Rz1trQXAweN6ddA5Jot41Yy1X1p1DqxF2Y83Bj0QN8w4HULOcJYsUw9Tc6
 2GuM9ceZMBccjqq7dHqxqOEUifZ5HDzrskl3sEbsxQx9H0z0gAlckngGn9Ap5YAOW/24
 FZbH257zmFpfgjEZetcwyssSPLKeR0oOI42hQ/Dnzedwa4CfuF2OzTxsMI+DC4ZZyAGL
 dUlLDYonjFQll/qXe+fQJ+OiawC+NlwMIlIHNgyICQr+e6SR3UQ0TMCOJiES1m7EJMdW
 oW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761056210; x=1761661010;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GH+Au8Z65JXGAtAPh2UGeuug8ILOECULe8PKQvQu4p0=;
 b=b5AF8GsZ7CYBlAeZZkkwBxS54sWqBNXdrtq89uFWUrvR1UNBRb7uJUKZB7jCNgHGbX
 LnJl3nAeVOw7orslESGZu4Y2H/mzfU6M0xG1P+9B5QGwY0j7QEPe4Huri7j34cDfVA6/
 re/x+Aw/5WD7LnFpsEWAAt5wrIvP4RBHef4G1Mu2jyIboDaaHkXxzOvLh+pdJyrqht9/
 UlwqUXcx2F0tQpXN5XW9F/jiRmjnu1Djj/poj5dTegceAvD25la6SwHLBi80EC6ydjHm
 dnvUxgRvO7AY859N06vgWJb2y0Q81I5CqOsP3vpLaHGQsJ3EGq1ODTdax4cxSnlvwhvT
 L+7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUInnIVZs1U0Jgqu4QrExudFiZUwLAjkurbA7J9dqNzuS8NjtPLeAkW7ukjoOvyDFxRwX3PhCRPow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yylr4cQYsgQqnOLTUz0xpEf5OdXH47rCyD5bARFx3xB9Z0dp8ie
 Cgw0MS9DNHubS4ZmBhpudwYtUKftSzRNkb0bcltlzW50OVIoyk3yARuJW78giqZ11y8=
X-Gm-Gg: ASbGncuF0PcQHGvbJxH+Jdwgcp0J6VysHe50iBuK/zXsIZam2DFu3gvtZb+3nnql+Pm
 Ixoj5O1eTJTZlQjjdd963XaogPjC3zMLwNY7GCmlEIXezjo7dmTWosXcbTLDnjPmWO8r3r+eFGY
 JLQ9KmrEhQ1Uq5E5mVXk3SCAAfZQZB4tx5ns7mc9qtaXIjk8Ecrl4NcdCb7kxP9az40VJbxH8pe
 vrWN+/K+8DjwlISDqneuV3SJFlvWgxrbHji3ZebX9RajwtqxKpQqPYbg2srgX6cnMNTLAlHAoJZ
 C+oqGvmcIQ6sRDZq3eaFjZA2IKXdzOjtRu/KR17MUr8UYFd7yOpcEfMBQCvb1IVSUuK2FwL+BTf
 I3G1BciUxyY500wbr4aICL9V3inbYJYZe2tNQGp1DQ8NUKTlS1jkysQrfSUlU6FV/lDnXUl8U
X-Google-Smtp-Source: AGHT+IGlCzAGBWO2jDwO8KOdW9RPFbusOV38zy/UqpC4nz4HnuMn3sNj6s9XMr9He0B2eairZT1Tyw==
X-Received: by 2002:a05:600c:818d:b0:46e:394b:49b7 with SMTP id
 5b1f17b1804b1-4711791fed6mr135325295e9.37.1761056209687; 
 Tue, 21 Oct 2025 07:16:49 -0700 (PDT)
Received: from linaro.org ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f009a9a9sm21138244f8f.29.2025.10.21.07.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 07:16:48 -0700 (PDT)
Date: Tue, 21 Oct 2025 17:16:46 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e78100-t14s: Add audio playback
 over DisplayPort
Message-ID: <honsqyec45rg4yrh3rwjlqlhcqyatbbsvnhamhjdin3tgaggzc@5yrxw5mwhkni>
References: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
 <20251021111050.28554-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021111050.28554-4-krzysztof.kozlowski@linaro.org>
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

On 25-10-21 13:10:52, Krzysztof Kozlowski wrote:
> Add necessary DAI links and DAI name prefixes to enable audio playback
> over USB/DisplayPort and HDMI.  The HDMI port is not yet enabled, but it
> should carry respective DAI name prefix regardless.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
