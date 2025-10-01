Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F75BAF5D7
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 09:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D03610E335;
	Wed,  1 Oct 2025 07:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KJKQ7E5U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3D810E2FC
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 07:14:35 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-46e542196c7so3468045e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 00:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759302874; x=1759907674; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CnrCm82N9RDCdUhU0ThMIOx/wxR6eW+Zxx59nq/+ZhU=;
 b=KJKQ7E5U2GCxlTrjwzBy8FJdV+iV9x/bgaVF8SRzrWdkSNOc66WHiwCR0ZIcrOSu60
 vEjxkV7lm0PMlJZyPBU2FR0lXklTFPiQUxxOMlqsDt0goM51lSbgOidcpu8Tt8uFfcMk
 t8+rJsU+fcxEEDLpyiG5f8c1u/siNFGyxiwVwscdZ06t6sZhh4Hr8dvzzZYKwHqv4GIf
 qNvgUc1s7cBjWb/XArWp/Ksvn9ISLtdxjGcWrk0nST0MQVu6oa+SygPDdDf6thKWss95
 Vu6WLhgNXPU5gSNUOTG5dkwUkeTcLNSuC9U/vTFUX6zCSSGcG10xAgCeiyocUTyNfBW8
 wgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759302874; x=1759907674;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CnrCm82N9RDCdUhU0ThMIOx/wxR6eW+Zxx59nq/+ZhU=;
 b=E9/SF4oZ1Z8qgjXvinZX5XuJZU+7fNIs7GPCCtsLy+9le8h7m1fdwBJbpOSzt5bJRj
 vULLMurJR17nCTpeSBP6kv1Z+gAuITI9TNPRGv4tSX9Aiyl/MNh2RD9m4uJznX5VBbIk
 ZC4ZNMOjsxoj6MQtJ0/GSpvRzQ5FP/r7vZrO/QmB3DEphaQK/dJDwf1aXN05VZgQR5YW
 xDpeax3QZG2zaIboqEnzgMSai8ZnEbWYE6Mbnqyqd7mkxA4foTNf45ECwf+Gv49EMAdM
 O849DVeAVtNTqn3v2w8wQUGeS4gKw+Xz8y0D9dCgXas0U/z0djfcXqw27GiwLWUmH/wr
 xyRA==
X-Gm-Message-State: AOJu0YyDBbKw+IYxh53/WW8kKV3JPI1iN3iS55e46I1vQJwXhgW1LEXk
 F8CQpVliGRVb2iVT8QuqdlXBEaPY+rDgalPFQVvcry3ETXI7nLKSv2VOSEKFGv961HRsGEdRm3R
 sykkw
X-Gm-Gg: ASbGncsGC4gwMS8jRFVeDiCUZ1e9vUvfobKnKKQRnpn1OyuCZHHBNvxYAaK2/cNbd+h
 mFsjwweuXMk+TFCTZHWQ82lHPVsl8kBbUSRYu89JcG6yQ3zk6L51+G08jxPREgQjlan6CBrJt3Z
 C2S6GOK3AV9P3p4o8N5TxB8MXJIt/SARipNG7o0Y73+Jkz+AJAppWUMVKA0YxahvepSRzLaKBM9
 9wDobEt/nZDQ32JjE3qnpeQwq1uB1wD4cbZuZFlc+ZSuJrKEWBCQ9u52f+xJDUurbhJtD1paYsX
 3wIoQsJQD+TJySjSrEANHtENzXHrZJQYs+SlZHN3hyaHlbixgoXbGFJTr92a++lPXxsd8Zt+aM1
 he4js79GzzQwfzFN7127Tmbr/Q1hj7tsITt/Rl/HG8s3Irq57DjOe9H/fs2g34mDAoAI=
X-Google-Smtp-Source: AGHT+IEPMG4C8VjwA3pQsA24NLtsLy61u5i8hAOBeHwnCJP8qh3051WTzyVCw5X1oRCuGh22oxkRXA==
X-Received: by 2002:a05:600c:c117:b0:46e:6339:79c5 with SMTP id
 5b1f17b1804b1-46e63397a8bmr7307155e9.5.1759302873435; 
 Wed, 01 Oct 2025 00:14:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619b7e37sm25185825e9.1.2025.10.01.00.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 00:14:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 David Airlie <airlied@gmail.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20250904205743.186177-1-marek.vasut+renesas@mailbox.org>
References: <20250904205743.186177-1-marek.vasut+renesas@mailbox.org>
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: ili9881c: Document 5"
 Raspberry Pi 720x1280
Message-Id: <175930287261.425863.7680841770624369049.b4-ty@linaro.org>
Date: Wed, 01 Oct 2025 09:14:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Thu, 04 Sep 2025 22:56:56 +0200, Marek Vasut wrote:
> Document the 5" Raspberry Pi 720x1280 DSI panel based on ili9881.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: ili9881c: Document 5" Raspberry Pi 720x1280
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/86769c7df4ce2f58ebe67c08aae3f52090727f7c
[2/2] drm/panel: ilitek-ili9881c: Add configuration for 5" Raspberry Pi 720x1280
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/97f0d2ed0c6849e24c43a1836ab5ac122f80fe9d

-- 
Neil

