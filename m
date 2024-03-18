Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1210187EBC7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 16:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E518D10F870;
	Mon, 18 Mar 2024 15:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Kksbwqkz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1DE10ED95
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 15:13:06 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-41460512c25so2742265e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 08:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710774785; x=1711379585; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TrjBOYLuW2abzmfWmezAaX6lixBVWAZVGcjAB2YcmOo=;
 b=KksbwqkzmJHRg64hCzK83/IG6YpGNj+bWYQstBUFiV7+nqb4UbdjeuShsYjZFMNWfa
 l9+5hXok9BG4mYRMcCdwDTkImm1hUUYChV8IKnCo3aWI+ONyfn8WbgvYqDQQWolBojml
 D1N/BGPILNX6HItYJkesU9wf45snOeyACbh7L21JEd2eQITDJGjHgSBBE0xw8BoYoAL/
 5Jn7M+ujbIe/y9vGGcnfkcpEEcGuuQIZh4govqyA5Ri9oYZooTZXug9Ue8gL98Iygrb3
 Z9aQ3Grpw0LhfaXNGN0SZDHpS5ozrAocPpd8rMHB0RfaaH4G4bfiE1ihrVpspqx/WCxO
 bKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710774785; x=1711379585;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TrjBOYLuW2abzmfWmezAaX6lixBVWAZVGcjAB2YcmOo=;
 b=ISBys+opBGzlhQVa7Ls+7jqCVv5XYF2HiegP1V6ro9I7JY2Gz2P4T7PWAarLoNR/BO
 BNvJpknaUtPUX/h0Weay4AAEiE2XX8zU7CQ8H0iKJUN/pbc5sy4P08QJe/QD7GTnyNA6
 Jvp3iK3vPyYjdW6STbPph4uNm10IG7/ZCJmoWCAAgz3UyVNSF6/GgwF8sALhm4rhcsKe
 qOEr4zcG8bTVzOQgV6N595hoakcMdotZwY/hx6GIVdYIQgtRFTNVxY2DOYcA4OZ+dEpq
 P7HBXly53E5kMxfLw/JtqxL5AcyB9MTeY80ztJfO/2gbKw68S2p0Y0i6wObD17Vp6/H4
 +KGQ==
X-Gm-Message-State: AOJu0YwctrsIml1zQlXxU291vOY+Dp/V+T3KzLvigcrGBXjECc1Dx2e/
 ww7DKa1UfEMeSbfAFl6l2KVslwqxna47CudUE0iZbd4p6i5yaxamTWRlUy3ii6M=
X-Google-Smtp-Source: AGHT+IE51HiIuz0F5FFcfWMIT/9a4GoCioqqzjUXf2sOZBq/P4mE3IbkcrLGmlWr0Pafiz2LtW+zjA==
X-Received: by 2002:a05:600c:4ed3:b0:413:f4d1:199e with SMTP id
 g19-20020a05600c4ed300b00413f4d1199emr6895120wmq.31.1710774784691; 
 Mon, 18 Mar 2024 08:13:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c4f4800b00413ea26f942sm17880628wmq.14.2024.03.18.08.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 08:13:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240317155746.23034-1-laurent.pinchart@ideasonboard.com>
References: <20240317155746.23034-1-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/2] drm/panel: Add Startek KD050HDFIA020-C020A support
Message-Id: <171077478395.2130203.2470908227641017506.b4-ty@linaro.org>
Date: Mon, 18 Mar 2024 16:13:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

On Sun, 17 Mar 2024 17:57:44 +0200, Laurent Pinchart wrote:
> This small series adds support for the Startek KD050HDFIA020-C020A panel
> to the ilitek-ili9881c driver. There's not much special here, patch 1/2
> addresses the DT binding and patch 2/2 the driver. Please see individual
> patches for details.
> 
> The series has been tested witha Compulab SB-UCM-iMX8MPLUS carrier
> board.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: ili9881c: Add Startek KD050HDFIA020-C020A support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/77880bd4512e261372dfc3f49a5ed44fde9d3fa5
[2/2] drm/panel: ilitek-ili9881c: Add Startek KD050HDFIA020-C020A support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9fb8aaff8eef56c1822e5267e52d4ab8ebb5b523

-- 
Neil

