Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A841A921D8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 17:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80FE10EB53;
	Thu, 17 Apr 2025 15:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H8jCLoQg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A65F10EB53
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 15:43:16 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-39ee57c0b8cso965972f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 08:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744904595; x=1745509395; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nS+iMVPzLszyvK1ef5pz0a8ecHJhiCbYxQ8pLZG1LMM=;
 b=H8jCLoQgMgZaomvXtvlGYaE/O0j03dM7M4GMlAelBeFRg3qn1RWR/fsIoD53UbLOIa
 X7E15k+uI6/rRA7vGd38NER/JwS2lk+mX+Ynk5tig+wvSa2mCwVB7+zOkBO+0XAGF/h6
 iknkLhmQ8BrCliNwmAWv8sk2ILO+dMXCtosSIHdAas25Axdc+Y2467NbIL+KNu2xMbfG
 eAcNNOnIL/CCRPvXQl6FDILk10Eq/n7/H6o3VW3URg1VHc2y/4efqthoaiqUy87fgj7N
 bglt7M9+ibKrMs226kvVGtDUTi/DCig3fAv4T5GN7HXlrqaAoEeeHeDIPlXtmNRnl6/h
 b+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744904595; x=1745509395;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nS+iMVPzLszyvK1ef5pz0a8ecHJhiCbYxQ8pLZG1LMM=;
 b=p0lvAoIWJGqyYTNV7P0Bxf0ZeqVzQH8PUdq6Nk3t8/jRbMrHl/Vfkon8CXb4wc+vMx
 3bu6OTQAEqZQ6ZP3egZIFdZhHcV+aPgQEAjufxoW1SKqCxfHgTfVblvUSqGo2ZPOuHEz
 9dryU9EnZPIlNkeadBEEeuyQqaPTTErG0jx1ETazNtWGeYUSejXlOQWGTEvW1qPy2br6
 4xQb2TqemvHwXgBjgreJhlQM1CXPvhemjeUPcUQHCLICBwkgs3ePYuqzQRWBA3kZRD1d
 DRWz6oLWo7VucaHmQh9n1ur25lKiVwUr1XkDzLyrZS07CJagggN//+r1hTko9okOR3AO
 tjIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW/VUn2uf3e8AN/64sOm5PDolVijnDzTeUpVDQhK4DsUkEhk+L6zD+oUl2kdruUiJSlDXEMqjkpWo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyd5mkpPdy7wkmc0JtUklTRfahJlWgvfXEA/0JLndjn5m7sEhGi
 +a+U14SamxFodKIylYH/+c5cUjeeqBHCA2Q1K9rJIWyUjBpHxFgPpBmkTOh981U=
X-Gm-Gg: ASbGnctSPFOKrS/IayjKNWnj8j421jkgFonUXpTGXe4JPYsEPvckW6gIgT6hx8kfsTv
 a5kds3M8oC19/CC00bE39Ppf24U23pnBasBN/cKgiI0IsDNpZx7iGomJhDNnJ0hM2WL2nMLtQSt
 z0zj+xzuWdi/+ieT1Tugz9/5EPyfkuuuOT3ntuH0C+UDQiMW/HUDTNQR5g1J7OpJkvZVQCbedyZ
 eYyGRqnFqkEr8qjTvGP0ZDWuPBxStDTqpzv9WmBZh1SAOiImp96vD88e33P/oczMHNjTEOlJI4K
 KhDuRyK5YzYEPzVH4oT+kaXN26aiQeG1H6eMdfsVaMZ9fEU5edBcnn8UrZgpvg==
X-Google-Smtp-Source: AGHT+IGryh9t6uhy66lrT8gQ3EODPyMha/2rPVIOWr8w58yUILTFXYIOWehquSJJiWUu1ku4BKDX9w==
X-Received: by 2002:a05:6000:2505:b0:39a:c9fe:f069 with SMTP id
 ffacd0b85a97d-39ee5b373d3mr5516764f8f.30.1744904594884; 
 Thu, 17 Apr 2025 08:43:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf44577dsm20773640f8f.94.2025.04.17.08.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 08:43:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, pablo.sun@mediatek.com, 
 christophe.jaillet@wanadoo.fr
In-Reply-To: <20250414082918.30298-1-angelogioacchino.delregno@collabora.com>
References: <20250414082918.30298-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 0/3] Add driver for Himax HX8279 DriverIC panels
Message-Id: <174490459408.1152288.4538582198698733279.b4-ty@linaro.org>
Date: Thu, 17 Apr 2025 17:43:14 +0200
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

On Mon, 14 Apr 2025 10:29:15 +0200, AngeloGioacchino Del Regno wrote:
> Changes in v4:
>  - Changed hx8279_set_page() and all other utilities to void (Neil)
>  - Changed hx8279_{on,prepare,unprepare}() to return dsi_ctx.accum_err (Neil)
>  - Switched to devm_drm_panel_alloc() as suggested (Neil)
> 
> Changes in v3:
>  - Added support for setting digital gamma parameters and validity check
>  - Added support for setting analog gamma parameters
>  - Changed gout_{l,r} to a structure and added a description
>  - Fixed DSI LPM/HS setting in prepare/unprepare callbacks
>  - Remove forced panel off in probe function as that was simply
>    useless
>  - Renamed function hx8279_check_config to hx8279_check_params
>    as that is actually checking multiple parameters and not just
>    basic DDIC configuration
>  - Moved the GMUX and GOA validation to their own functions to
>    improve readability
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: vendor-prefixes: Add Shenzhen Aoly Technology Co., Ltd.
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a1958a56e52c87aea94c5cb0c08fe61ede929e7c
[2/3] dt-bindings: display: panel: Add Himax HX8279/HX8279-D DDIC panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a424c93db7ea8ffd18c6c170501bb898abf05932
[3/3] drm: panel: Add driver for Himax HX8279 DDIC panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/38d42c261389985e8dd4739dbd97e2dc855e8dd0

-- 
Neil

