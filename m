Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE70C81C640
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 09:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3ECC10E766;
	Fri, 22 Dec 2023 08:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0217610E766
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 08:10:35 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40d3ae326f6so15678045e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 00:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703232634; x=1703837434; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lM68vCaPXNUUDycrx+XvGL33ppz+BtAdK19lvJ8+7sw=;
 b=iLZLEzQLxIBEafKC1wu382UcRPt1umNETTAPGPt1T8P17EmI16v65Pr8FQPTEznIBS
 EVkjCYGGJEN8wgJM0S9OpTXhQWDP6PL639IF8sqjR7XZ8e2hBnMADBpDOS00BV3dvtOL
 WrHhTPF4xUVY1AVfQRKz2Uc+KdQQnMNRKhn/T9YR7FIwQrDAwuOGt6ks0W2wzBswoJW2
 kOVXBaEoe/p1Q3YPx/2C13P0s5FvXrIa1lTRIzUac2Jqh3Rqxk+6PXunSivJLTDnbOXp
 vY6+uj0RYz+OkvfS9TvhLMJWNSP7hbgolxPYlsPJvDZYxWBnDRgbnynhzspWUDNA6Dy8
 FeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703232634; x=1703837434;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lM68vCaPXNUUDycrx+XvGL33ppz+BtAdK19lvJ8+7sw=;
 b=Fjy1SUokni8VAicxRVi4guyymlCE5QLSR2YPsRrT+mBVvjTHiyKOIb8j2xsUGwzk6V
 wOVuVYQpXSpZCZW1xpXFNNTgPi5ziQNsy4Zq8w6EZy7VXfeea9/FmBJY3aM17a3i6ln9
 YUQDh2cAVRTt+VGy6iBNqAYvci3gaJiq4e225NMEga/wW6NsLOHy6gQoGCEdtpYhNd7Z
 VTyBjLyN2rjiztg+8w3DD+VtMG4+f8Qxn1Et9iBSZiQrrOV/gGcEyegr30Wt1Y5MIWQp
 Pit8QtgftEleTOaWmBTnmJe4o+1L4YXuxZKwRjyf5NzL6ixYhUQfibMZFHwnbZUiGL2k
 dJHA==
X-Gm-Message-State: AOJu0Yw4PlqKWRZ2wO3mRN+NVXYXlF65Gt++qoz0bZsmz4mBnrGIq+ch
 wQANubFqFneowwjCqeUDiwSGqx9st2iwfw==
X-Google-Smtp-Source: AGHT+IEXWH54whXuzJ+v2aRaRnfaeKABy4t4cZ8sKiFBmqzByppB9AgX/JMhJXGJHk1onMtQ80/7DA==
X-Received: by 2002:a05:600c:6010:b0:40d:4a25:ee0e with SMTP id
 az16-20020a05600c601000b0040d4a25ee0emr16278wmb.11.1703232634442; 
 Fri, 22 Dec 2023 00:10:34 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c001100b0040d44dcf233sm1527024wmc.12.2023.12.22.00.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 00:10:34 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20231221124339.420119-1-raphael.gallais-pou@foss.st.com>
References: <20231221124339.420119-1-raphael.gallais-pou@foss.st.com>
Subject: Re: (subset) [PATCH RESEND v1 0/8] Introduce STM32 LVDS driver
Message-Id: <170323263335.3968091.3418124758627043970.b4-ty@linaro.org>
Date: Fri, 22 Dec 2023 09:10:33 +0100
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 21 Dec 2023 13:43:31 +0100, Raphael Gallais-Pou wrote:
> This serie introduces a new DRM bridge driver for STM32MP257 platforms
> based on Arm Cortex-35. It also adds an instance in the device-tree and
> handle the inclusion of the driver within the DRM framework. First patch
> adds a new panel compatible in the panel-lvds driver, which is used by
> default on the STM32MP257.
> 
> Raphael Gallais-Pou (7):
>   dt-bindings: panel: lvds: Append edt,etml0700z9ndha in panel-lvds
>   dt-bindings: display: add dt-bindings for STM32 LVDS device
>   drm/stm: lvds: add new STM32 LVDS Display Interface Transmitter driver
>   drm/stm: ltdc: add lvds pixel clock
>   arm64: dts: st: add ltdc support on stm32mp251
>   arm64: dts: st: add lvds support on stm32mp253
>   arm64: dts: st: add display support on stm32mp257f-ev
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/8] dt-bindings: panel: lvds: Append edt,etml0700z9ndha in panel-lvds
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=021a81e7ac8f579b049e5bc76efabd9e67bd627c

-- 
Neil

