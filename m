Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6B2A47834
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 09:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9572E10EA60;
	Thu, 27 Feb 2025 08:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FeKW+wcq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194D910EA60
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 08:50:17 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4399d14334aso6198355e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 00:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740646215; x=1741251015; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4fVljM5lUPad0aLITzXtfYe1Ln/EMXDK6r/779wBRag=;
 b=FeKW+wcq9nOaHEwhWVCCS3sSFmmM6xwo3ufwnEbnM8WzfL7rj/4x6XNrft/zTbaRpj
 P/XgCI16Iyv2eshe4ciIVAug4EQrUQF4wG7y/BYhAub8CYqG+ZdKXXimhFdik/NUlzPT
 +gAojx6lqS80EZsywn5pjkQiESX9BH/EvbCb2Msho1Og9ZB1WmWY6/OaLoJML7tSD1DR
 4ECTmwnV3MFMuRcgvelclkTua6Bn4TlWsCr4KPYUXpwDYRflyZbBCIFLK6VERMBMP3VW
 u4S63ZG0ENeNqc69OtvO3/QU4t3BhCDFyemyaTow6xIQZeu09SdS9Ctq+A0p/kNTwx9z
 8Z5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740646215; x=1741251015;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4fVljM5lUPad0aLITzXtfYe1Ln/EMXDK6r/779wBRag=;
 b=Q93R7NynBmjO+vMWkmi1IUCoIDvfoIu6FoTz+Ny7SKPIJuGZQGv5NYJSHbvszni6+v
 BKL0uI/YPQJD6Tvzn1cLEcrd6mADwGIk+UiTuxO1UGsQnbU6YqaO1K4iWSKswNKdpmgz
 Vpu00+HIphmMBkaACxdNXxLhPnX4pApc9GKLJfFeo9St+O0WAb3U+p0xBpwkMPOI+hag
 dITfXiXTAQSUkOvLZ4uRaE+740oZ5taLSF1ve4j9KWod+IJ12Q0qM96u/hFQtRR//wm2
 GEYhHGjnhJjQdo+DEAWLtExg75JAg8UedfGYsotAdMzTLWTo8IRJkHsO459TBV3jktqd
 PP1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF1t/2d9guDsKJEVdA74j6HSeRQUOkzQEzz2JEpakKjO9NPcChlpCugNxvIyVtiUUJEYa/d5WGud8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweFG3zF6YRPvwcXC+dR2pb3DI4XR3anYTMdRQ0XZ655vUc8Sm5
 gJVCNF9LXs1gkngg4dmyjKhF+XQ0anU3NblCRBee7NzSgHxgZORN0S5o8E/uAYo=
X-Gm-Gg: ASbGncve++rj+o9VadEbBIs5gXZdXxsxhsblXbEMPz3VX1Y65c6HnY0iqemLJng8KCM
 uYCblelYPFuUbYFLwqZebyEXflqGQ2rkKLZaSTSguopUx73WMVmqQK3aKLJlJ+kNUOXsJBJ7LG9
 8lEvgmavcVT70vCzoTfzkfQ64tXO1nV/5DBlRmlMZMcKCIZbumFTf+zKblzZT7quqBDtoyLqaG+
 ej8/F2F2h5mQoGP8q294yll0l+MVZSpzRLABc0qKhvbbfKes46Cmi9VoabNrprxJKc0IlMVHhEe
 k4S8/TG1cdwM8ilvH6OLlg+tIevdZj9/yvNflCN6VeL2FUE=
X-Google-Smtp-Source: AGHT+IHgJ7gnu7GiG/3pZ0CxcgYJtAbBL49zZDDh7KkKOwpZMMmtSzQZz3LVjqc8sD0Hf7mvNSwo3Q==
X-Received: by 2002:a05:600c:3149:b0:439:608b:c4ad with SMTP id
 5b1f17b1804b1-43ab8fd04eamr52036575e9.3.1740646215468; 
 Thu, 27 Feb 2025 00:50:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba57145esm46894535e9.30.2025.02.27.00.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 00:50:15 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250225-raydium-rm67200-v3-0-d9e1010dd8ab@kernel.org>
References: <20250225-raydium-rm67200-v3-0-d9e1010dd8ab@kernel.org>
Subject: Re: [PATCH v3 0/2] Rockchip W552793DBA-V10 panel support
Message-Id: <174064621466.3904283.4217314365714846185.b4-ty@linaro.org>
Date: Thu, 27 Feb 2025 09:50:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 25 Feb 2025 17:07:58 +0100, Sebastian Reichel wrote:
> This has been tested in combination with the series from Heiko Stübner
> enabling DSI support for the RK3588 [0] (DSI controller support has been
> merged already, only the PHY support is missing) on the RK3588 EVB1.
> 
> [0] https://lore.kernel.org/linux-rockchip/20241203164934.1500616-1-heiko@sntech.de/
> 
> Changes since PATCHv2:
>  * https://lore.kernel.org/r/20250207-raydium-rm67200-v2-0-1fdc927aae82@kernel.org
>  * replace upper case hex with lower case
>  * rework final sleep in enable and disable callbacks
>  * return drm_connector_helper_get_modes_fixed result in get_modes callback
> Changes since PATCHv1:
>  * https://lore.kernel.org/all/20241210164333.121253-1-sebastian.reichel@collabora.com/
>  * move additionalProperties below required in the DT binding
>  * collect Reviewed-by from Krzysztof Kozlowski, Andy Yan and Jessica Zhang
>  * improve Kconfig help text
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add Raydium RM67200
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1e432a419047094cf2ee0325d4530ddde537f974
[2/2] drm/panel: add Raydium RM67200 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a50ae1a2fdc71985e9bea25d1b509ce5e2b224c9

-- 
Neil

