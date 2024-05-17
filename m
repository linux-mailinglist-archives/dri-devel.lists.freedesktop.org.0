Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E86F48C816E
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 09:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE2A10EDF4;
	Fri, 17 May 2024 07:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NGCYptKW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF1810EDF4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 07:29:35 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5238b5c080cso2063334e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 00:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715930973; x=1716535773; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=imQAT6qjO1VyC/YpAVCntCAOLNh9l2hiqOqHZIoiwR4=;
 b=NGCYptKWNKp5u5hpRF6C5Cnr/QEkMUlPpjHVpmCxwyQlcfhxgaR55+f+20IB/6hlHJ
 bDbnWJ8Rcy4a+M4SRUe9yPgRcpqTDd5/TsN8BANaKp3tv6nZTSjl8xYVlA4YFOGrNFnR
 Or3P+Ma32DF3Q0EMcZBVaoDaAe9EzJy3KG6OoM4VNl7BxMrutla0ZLd7U5ZeJvAOeUSQ
 32Bo49HeGfOfkafRgq1yF+eGmS0cS//W29bBH8qp8pntAYtyHTib8J5rOJr0M/CpAR/q
 MSPCAQJb4ZkNWcZhALmlhQ2kgEmQACtP4mL4EKJsZ0XXHea/2pNv+0d/7D3wySHdaHMP
 5a3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715930973; x=1716535773;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=imQAT6qjO1VyC/YpAVCntCAOLNh9l2hiqOqHZIoiwR4=;
 b=jVbHyevDEPVwHzn7uV4qZuCGvJjC0fMGpZEJBI8IBKifxJ8ErpqzExSBbB7GTXYs/l
 t3iefMFIoIBBWBBquTxkbvjAIRwuNriQfAdynm7u/bK1jga6uxEFlCQVcOTvpDIhiOCb
 HMjmjg51NgeW8v52rfNgKFbSxzrJOiZlQqQfU7cFH8sN3gDweuzBgO886I6MpjYc37dz
 uVgI9lH5abE53j1rtxDMrHORwTZkizVY/Pvx2eaP0qCEXH0F6UfCaasTtt4f4JVCpxme
 9K+IKTbfhfgXTFfyEm/F9gpH11ylw8lGPlLnDheVhNBxpCfCcR7XzUUV0FZHqdUxLwg8
 6lBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL463vOB0JzEQSSEdpDpLhQjuwkvGGrCaPUmptxy061cU2O7wJHJx8iK8O6s2ePUoUjVcP1AzHToB+ZQuT1haububwTAOLUX5S58uKgbZs
X-Gm-Message-State: AOJu0YxhpqCOUA5frCKKLGdcppYZ9OCxA8VZJLlSpfxmmeDIk517gnyE
 J1CIRd3jrEZTcxpZXvp2CPdocZpN/PsUNHzrbHeovFWi7357DuCCA0qh7CsoBkU=
X-Google-Smtp-Source: AGHT+IFyQ5ay96Dby18r95inH3bMvJiGqJAHZgvPjwtCGLk0VqOAEXXOxTRWJUnG0hL9xFNx69TaoQ==
X-Received: by 2002:ac2:5331:0:b0:523:96ad:51a8 with SMTP id
 2adb3069b0e04-52396ad5348mr4580667e87.7.1715930973181; 
 Fri, 17 May 2024 00:29:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502e5e0b0esm20746461f8f.26.2024.05.17.00.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 00:29:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: sam@ravnborg.org, daniel@ffwll.ch, dianders@chromium.org, 
 linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, airlied@gmail.com, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 xuxinxiong@huaqin.corp-partner.google.com
In-Reply-To: <20240516072039.1287065-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240516072039.1287065-1-yangcong5@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v8 0/6] Break out as separate driver and add BOE
 nv110wum-l60 IVO t109nw41 MIPI-DSI panel
Message-Id: <171593097231.261191.14625926975541986060.b4-ty@linaro.org>
Date: Fri, 17 May 2024 09:29:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Thu, 16 May 2024 15:20:33 +0800, Cong Yang wrote:
> Discussion with Doug and Linus in V1, we need a
> separate driver to enable the hx83102 controller.
> 
> So this series this series mainly Break out as separate driver
> for Starry-himax83102-j02 panels from boe tv101wum driver.
> 
> Then add BOE nv110wum-l60 and IVO t109nw41 in himax-hx83102 driver.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/6] dt-bindings: display: panel: Add himax hx83102 panel bindings
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/eba54e9c4483b585f6e2b9dd2472eb110417331b
[2/6] drm/panel: himax-hx83102: Break out as separate driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0ef94554dc40fbdb7e57ff90cd1e7fa71e1e89fd
[3/6] dt-bindings: display: panel: Add compatible for BOE nv110wum-l60
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4fd07f679bebc432c72fc2c5cea23e39098e00c2
[4/6] drm/panel: himax-hx83102: Support for BOE nv110wum-l60 MIPI-DSI panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1173db117634b42383cf5d397ddfd4d4860ae20b
[5/6] dt-bindings: display: panel: Add compatible for IVO t109nw41
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4020c15c0fcac8d66818dceae7f39736cf9f16b0
[6/6] drm/panel: himax-hx83102: Support for IVO t109nw41 MIPI-DSI panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3179338750d83877bbc491493032bdf192266ad9

-- 
Neil

