Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AF4C1D583
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 22:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D809110E84B;
	Wed, 29 Oct 2025 21:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yu7V2pAN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5632210E84B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 21:05:38 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so2904665e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761771937; x=1762376737; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SvrkZyUCxhzdMhpU1pq4SxDgqcy11RL1R709gVECqkM=;
 b=yu7V2pANScy0pS1Gu2ROgqA3MWuYgH8vH1wbPAqQPWqBv2xIDsgo1Nr3Ihzsx2s/Q+
 5Lx97h/FnReuGlovdE0zyI5GuXM+GTuPKSt8iPvMr4stz0qdVvkZiTgt62HGxPdDKkGO
 As0gYDNFdeaTAo6utKE/Akt/Xf50rcvK9Ly0C3vZtCwBMg7aCcwGeLgi4WU5rhPcvh4J
 rSZbGbI4cKYqNLXcuM2XXGmKWEV7DDVr+//XpbxIIKk5v7dTPI5dSkpsZax/mSWCbSJO
 46gE0ftNJWo7cj5QYdggZUdkZComMbgO20/wWYgG2WPZ2TmfQvczS1t66fsksiO5EnX6
 TJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761771937; x=1762376737;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SvrkZyUCxhzdMhpU1pq4SxDgqcy11RL1R709gVECqkM=;
 b=D9PiR0HeELQMZWzSLgT2e0+k3t9k6z7gdCTkwE+LIm1fPaX5PKcGrENOvfCdSjn0m5
 yfS9F6py4yq8Aa7K6G9XlTERcQqaHLjCs0PL3FhZQko7pAnWzT29FIyU5Fv+fxxJh3Kt
 7i1Zxr8Mp0v987wV4re1CwxNM/Q3qEI2aZdJiQ0njscucHTmsOH4bBlXc4gl7jTj3pNn
 x+7YW+y1G9zfMfIJHyC+TG/7AX0PYsXVHfS3lNiBnZKuwMdu4B3bqJd/lFrLKZHqa0fj
 o8TFI83BUD4pA+cs7VyXbCNSEqbmbgI1vu2RKr36j7P5+gt19zblv7YrSXXH5fy0DfHA
 ReOQ==
X-Gm-Message-State: AOJu0YzpzJWF7WXilGctczzuwVx9rdsqaUyHx+L+O/38Qe08h9sl8a3f
 sZJz9LVTGWlwhWCQkQ/xqtwk8GA0DkWMibcBTRhkYy+x3DqJWGyS0GHhZw60bhPoTU0=
X-Gm-Gg: ASbGncsj3WkfJ6zv/2zNFMRz1QgV53iieBDG6ngzbpsDn6xCJUrJ2dCMVbmW4bpsRsS
 i7LI0Ey+Z004wyBd5zSDTO5F3Ke1Hhl+P1UtD7CgUJzAL9PtFyGrzzcGWLrs1X/rCeqljV8LGV2
 Ze6NTl/YE6cg+faH+sPcaTTQxJhqKxr6B7W+hRNnDfJ4UhWooaGCTc0hHpKv5E/2mZWFFoibnmM
 SSEHDddG5BPiD72bT/k6oOduBd2bKb9OKjfak3zNpgo+qzXs/B9GkylrPbOh6Vyj97LWU/LJpoM
 RAWD3CByy5YW93Ek6APsP26/v4ngaJgzC8isbBQKK8wQ6oXoxXKhM/TRfOmWQ8L6+htltVVcyf9
 qYNViEljMALwFByOz0JWsFyhf9WczqM9hK61KZfJV0aOoUv78EbWAPgsfA0yVg0rSs/WoQOSeVv
 GtG7ccsYVGdutf/V+dTW0e
X-Google-Smtp-Source: AGHT+IGZGXznQ8RiSklRjePtJn+PM8frBta7d71//k3kxFwN4+bLmQC5h4Kb94oQTvwtd4aBrmRTVQ==
X-Received: by 2002:a05:6000:144f:b0:427:cca6:5f4e with SMTP id
 ffacd0b85a97d-429b4ca57f9mr865236f8f.62.1761771936508; 
 Wed, 29 Oct 2025 14:05:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952de971sm27815109f8f.39.2025.10.29.14.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 14:05:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250820-panel-synaptics-tddi-v5-0-d4e3fd4987c6@disroot.org>
References: <20250820-panel-synaptics-tddi-v5-0-d4e3fd4987c6@disroot.org>
Subject: Re: [PATCH v5 0/2] Support for Synaptics TDDI series panels
Message-Id: <176177193567.2073083.15243278794379289189.b4-ty@linaro.org>
Date: Wed, 29 Oct 2025 22:05:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

Hi,

On Wed, 20 Aug 2025 19:54:25 +0530, Kaustabh Chakraborty wrote:
> Synaptics' Touch and Display Driver Integration (TDDI) technology [1]
> employs a single chip for both touchscreen and display capabilities.
> Such designs reportedly help reducing costs and power consumption.
> 
> Although the touchscreens, which are powered by Synaptics'
> Register-Mapped Interface 4 (RMI4) touch protocol via I2C or SPI have
> driver support in the kernel, the MIPI DSI display panels don't.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: document Synaptics TDDI panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5c42579b0705ea372ed7e6f158c880618850b409
[2/2] drm: panel: add support for Synaptics TDDI series DSI panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3eae82503f4fb24e36fc06f6827b8360678c2555

-- 
Neil

