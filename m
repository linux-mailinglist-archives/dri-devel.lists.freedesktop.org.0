Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0DACC1F37
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 11:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F7C10E7C6;
	Tue, 16 Dec 2025 10:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gi+aReWP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD12210E6DE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 10:23:10 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id
 ffacd0b85a97d-42fb3801f7eso2231535f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 02:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765880589; x=1766485389; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7WDtCUommDCsmx+U/Szem2TR0e9IxHNpK+A96g18W4A=;
 b=gi+aReWPPAQbV/SRY7Zkp5id8Rb2iOt4U1wNWj63OZtU8yzU1ZtAKJTNPSAalI/M3z
 plC3yuIOYx6/LvGl7lpV9jvMtpzYgm5Rt3ujL03LROX4KV689JKFRTwnNMVlMyRYnz0m
 9n1LwDwXF2cEye99eAiOJ4EMwFMXt3vzsVI3rK+UyDeV2hTTg1UkzNzMIxJ3OOm3jd9d
 CEAwmRtfAylH3uWz8Q2cC7VPMJgC49y0Co2pxBRXVQUd/VBQb6xtSLFwIo46GTWCyRq1
 XsRu63lWsrtqzE/137v746Ej2SuGlG7assH/SYPdA6kk8ynCrWYQbrGIoj7eI1N26Ao9
 v+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765880589; x=1766485389;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7WDtCUommDCsmx+U/Szem2TR0e9IxHNpK+A96g18W4A=;
 b=ql4qkXQWShnp8u0jBKIFp67dz1BVY+rKgG6YpEkmblNG3P/OsJi9932uZwaOnKDFN5
 ePRmUQGrixeZbu8RWyGi4wXucVVcsiOgWkk8IcAGrKZgTDrQF0Wucw+Okuj9KZAVziPX
 meGSbERtxqIx4Y3awpwoZ5uwxtVmYjcl/bcAL2qiEd38dAwtk7v76qRIzVyzByI3CAWn
 qL+uDP2Arn3gMbJLoq+3MAOPzszXWP0weA0Ft4iH5HoAUNKTzBKf/qJ/4pVmYpwDxZEz
 kLPUzrGJLR8lyHqWazbPG/rOdycP4jPziXBE5XKKr3VbYemg4sQ8ogNFfnDoc/72c/5F
 9e+g==
X-Gm-Message-State: AOJu0YxcWmASDvJ7isoIEG3n2zyS02EdNaG/S8GjPExdiBzIX7rf6NTx
 KG+yCZTvnLpaxLbCb5u0uNrqTZvn/hvV6jcd8Pey3LuIVwvgBBbjTz6KDC2I2aZ+eqM=
X-Gm-Gg: AY/fxX4J7jafqcIVwqYjAVlM+evfNXJYU4anUVn4PTeGRS5IBEcI+PszmdXsXaf3Cg2
 VoZSyCLcZM21mTv/ROhK5P4O2oEZgzXsdoMBsZ+SinGH1YP/YVkxnLc2J364O0WDvPYeW401otQ
 Dhmd31dMgKN53INPs8/14GUSjNCYezrk0ly68J1enluZBOIVS7PIwYYnW1JMUpN3G2W+7BliR2N
 90WoEeamMlTbQH2JnwUPP90YVQwBCbP3vsyHfIaCINr8+yole9Vgk9pjNBAjNAKhKRM+qJD8bZ3
 kYniIhXQIi3UpCwxk716u5SoiEJUPl4hU0P+TCcwN6IqzOGxGBZtTUWRMU8btAdKQmOV1geUMn6
 jlUDFlV7l05ro7QRQtLvlHyyplu9UpZCUwtc9OijHrQnN3bZPu4wtjRjNDJYLgYYSC5ArWd8zkb
 BXCu0hCYkqXnaruQnzCTJWQZSjdvZeVbU=
X-Google-Smtp-Source: AGHT+IE5XhIX7FjwoHBOlG97LHD5zlw8YKyqlXpbrt0WFyJR9XjjoioKL0v+cIUn6C9Jtz+qyGN+0Q==
X-Received: by 2002:a05:6000:178e:b0:430:f449:5f09 with SMTP id
 ffacd0b85a97d-430f4495fb4mr10395685f8f.20.1765880588937; 
 Tue, 16 Dec 2025 02:23:08 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f984a268sm14996292f8f.1.2025.12.16.02.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 02:23:08 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <20251110091440.5251-1-clamor95@gmail.com>
References: <20251110091440.5251-1-clamor95@gmail.com>
Subject: Re: (subset) [PATCH v3 0/7 RESEND] Add support for panels found in
 various Tegra devices
Message-Id: <176588058797.2230787.9159942064311142294.b4-ty@linaro.org>
Date: Tue, 16 Dec 2025 11:23:07 +0100
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

On Mon, 10 Nov 2025 11:14:30 +0200, Svyatoslav Ryhel wrote:
> Add support for panels found in various Tegra30 and Tegra114 devices,
> including panels in Tegra Note 7, Surface RT, Surface 2 and Ideapad
> Yoga 11 T30.
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/7] dt-bindings: display: panel: properly document LG LD070WX3 panel
      (no commit info)
[2/7] gpu/drm: panel: add support for LG LD070WX3-SL01 MIPI DSI panel
      (no commit info)
[4/7] dt-bindings: display: panel: document Samsung LTL106AL01 simple panel
      (no commit info)
[5/7] gpu/drm: panel: simple-panel: add Samsung LTL106AL01 LVDS panel support
      (no commit info)
[6/7] dt-bindings: display: panel: document Samsung LTL106HL02 MIPI DSI panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/06fb75e2d12ee2b24129acacace044a0ddd2000d
[7/7] gpu/drm: panel: add Samsung LTL106HL02 MIPI DSI panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ac488854890165b55a973dab7247aa2deea9cc02

-- 
Neil

