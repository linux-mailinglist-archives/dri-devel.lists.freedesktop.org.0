Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D013499618E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 09:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B83A10E679;
	Wed,  9 Oct 2024 07:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bCqh4eYp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC88C10E678
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 07:56:01 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-37d375ecc5eso810075f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 00:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728460560; x=1729065360; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kSaBQTwpbtH+HEoeG6aWs5SQkV2mkK2VyYp6aMnW+RU=;
 b=bCqh4eYprHFeL9gpQn5BYLM6/TQ9xIyjU+LtQj8LlXjt1DP5mn0eawE8doFXNjQGsn
 XR0CvY2o2PguMZuEgbKikeIVe5pt8aeiQL0XyaLEQALldlCbMlsmhBluFcBJAqNik1ng
 992VhKtK2sVWBErqhkYD7rNoIgr1GDjxdxjOPFx1OEP6UANLYvzPC5RBZ/GZAzVsW3TL
 zefce+M1xo5al6yoFR2kIbspnRPnpj3HwqRb9ZNDI6A/sWMJWdTrcdLcpAXStnRAmmoe
 gHbQfUAh6H1ZVs5l8O7m44MbXy1qhXza23XBdegCcz1l07xxsk2p0hri2NFs9Bgv3Nix
 6dWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728460560; x=1729065360;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kSaBQTwpbtH+HEoeG6aWs5SQkV2mkK2VyYp6aMnW+RU=;
 b=SOa/hJ8NycRwZ56a9F+ED2VEyF6evmZeS2Tyo1pvAKl7ulNWRqhKDgL0QsnOsW3H7r
 Z/RJTlt4VqB5wRcWm2hfa9A+p9AcDxMPp+mJ9Jm5lP8XfMNbpTobjjSn++zwUuybSPJR
 qGmisulSe9i7evt1Ffm3IGWYCtpT1HLWgLX2KrDNzLer+Gvyd4Y7rGo+KcvZG+TeiBeb
 5WIA9zOH5rbC62buFViN+JkYI+KLIDI8kgwQC5Q7MSrBOJBmxOjiQpOx49BlhRmmxMI6
 V/1Ika1DXTFditEArDlScE2EcUFMW/yYDV4SL5955iQZs0jd3VkB7hSlA12O5KBkVs2u
 hXDQ==
X-Gm-Message-State: AOJu0YwbCD3hcs0TEHO0ZLThBbjYYvjRe/SYNQECYuiUDFw2aJRzkeNQ
 1NunXRV1+mbSanhrUlrJM49r7siIrLYtyiAcpb1ZqcK1hIEpDR7wbHJRlXBwHVA=
X-Google-Smtp-Source: AGHT+IGSigrWTTSN1cAc9Xn4YgEo4/oML0zlBirtbYoucTX71ox0dbj6ACRlaaqX4L1F0DLeTvJfNA==
X-Received: by 2002:a5d:591b:0:b0:37d:4e5:bac7 with SMTP id
 ffacd0b85a97d-37d3a9b837cmr929787f8f.11.1728460559968; 
 Wed, 09 Oct 2024 00:55:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d16972fd9sm9660342f8f.104.2024.10.09.00.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 00:55:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20241006-starqltechn_integration_upstream-v6-0-8336b9cd6c34@gmail.com>
References: <20241006-starqltechn_integration_upstream-v6-0-8336b9cd6c34@gmail.com>
Subject: Re: [PATCH v6 0/3] Add Samsung S6E3HA8 panel driver
Message-Id: <172846055878.3028267.15021754681839590280.b4-ty@linaro.org>
Date: Wed, 09 Oct 2024 09:55:58 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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

On Sun, 06 Oct 2024 21:18:18 +0300, Dzmitry Sankouski wrote:
> The s6e3ha8 is a 1440x2960 DPI AMOLED display panel from Samsung Mobile
>   Displays (SMD)
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] drm/mipi-dsi: add mipi_dsi_compression_mode_multi
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/975bdea8c470cf10637c58129edaae731fec9e93
[2/3] dt-bindings: panel: add Samsung s6e3ha8
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d891e79861cd2b424e3bd19d3301f35be13bf118
[3/3] drm/panel: Add support for S6E3HA8 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/779679d3c1640d8f45c75b1e15831180ab2712e2

-- 
Neil

