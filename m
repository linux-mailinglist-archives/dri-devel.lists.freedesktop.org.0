Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDB3B28E7B
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 16:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7040E10E396;
	Sat, 16 Aug 2025 14:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bLDxozzk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C50D10E383
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 14:37:03 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-333f8dd3620so20775551fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 07:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755355022; x=1755959822; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rcnY7bKyH0HRgtUBQ1xnHjEnIRmtANVbkGy9/T4atBM=;
 b=bLDxozzklfn/Sq3RpyAv8C4E0PPJ3dDU5kq7h9LGEIJiiyXgC3uu0ZMC7BhCYRUwi3
 ICw9EtBURMf/nTE0MHX1qYnkttggGcvaCt7KHNECqLbRcibU/wjAotvVnw+ibI0Sm3wK
 6s+GeM5xfbBMtpNyRH9IGj/rRd9VKhlVCMseAKRoSrS6ASNyeBA0C5CkGWX85/5AjC8F
 Pd+YZcFbhL2Vc0kl4nx2pi8SVrOczbRw5SctUJqx22s7PF6cdZ2eDNrQa0hvxCT+M+4H
 FWQPkPoeOhFq0Jv1MZwH5J48m7LaaeXdVDFNR777I4LXXgIvICojr1fHKoo/Y4TncuD6
 MWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755355022; x=1755959822;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rcnY7bKyH0HRgtUBQ1xnHjEnIRmtANVbkGy9/T4atBM=;
 b=pOT0XGhHcYsPEPxkdf3k1mRlxvomVaFGS4G1AW3UfkngrLIvRaRv/P1y1JBXDA7g0a
 h/U5dPJFOWsPFNda+5arASkjMVpPLXn5/pU9WO5uuh8KIxF4VcBR1cb+1FkZ5m5iHUYb
 rlfaNYb2t+XMs0dOPFRE2nPFy4ctdokWnEBQwBkN5IWItRmvG4urafcXlqVSjI/FvQEB
 o0KhWb925nNuK8hAgy0Yp5iTuAGzuErpcF67/NnWbL94QJ48F+Cfe0nzIRDblRcPmA4K
 Fm5hJiRpxlN7o4W/BCvLEUdQPjnsODrlrHFxsaHIkuL96WVWBGvRnrfmxUgV+cZcBk8E
 fETg==
X-Gm-Message-State: AOJu0YwVcKhu52Zj9NORu/UtVxKFuLoj9fdZFuW0yOBwBve6i3Ufwz37
 5q1AvnbZFRumS87Nh6krvUXN3XJh+M6Bsk64Ax/RN6Mwm2MFFMS47fOl
X-Gm-Gg: ASbGncup7j92AmSJtTqnhDe7XTxyPbrbZ3XjX3gd1eZy02tY1mCCYnCAPUlIPwFQ5cN
 hn6uqEyoXH/I3t5W57AlpvJoIA77Z1AMzn1hEwDzwEbtiUUDzyspBABryiMflCkHVvgKqGITss/
 G3podssjKwII+eqk9DsL2F2WkEsZIhqvBRronBorMqEWzyc0L7h1sx5SQWrF8XXTv+mI1QEza2W
 moEtt4slxVvuOluJ1OC6cpEq0PLH//kMYu4KtJuDe1PTwqj9lmi4v/e+QWgx+dGWPER85CM7L10
 guKVdztCdMl0cUFcrIyixdYqwgrENyJ1v3TomWqQhiiWjCOTlDZenZKnzYUY69pTVKB0pzKyZN6
 ZVH2lYqixbGvPmkrs09zTcnDo/7r4yrjMelsk96gp7epRqlJNV6jBeWAWMbI6LQ==
X-Google-Smtp-Source: AGHT+IE4k/iMe+Rm9RA0iN191EI9xn/ofj5LgLs+Sdk7/lrkrwQ3CSU1gIuS9Ybyz5OPre4cVGIQ4Q==
X-Received: by 2002:a2e:a588:0:b0:332:51ee:237d with SMTP id
 38308e7fff4ca-33409841f80mr13479911fa.12.1755355021589; 
 Sat, 16 Aug 2025 07:37:01 -0700 (PDT)
Received: from [192.168.2.19] (109-252-159-193.dynamic.spd-mgts.ru.
 [109.252.159.193]) by smtp.googlemail.com with ESMTPSA id
 38308e7fff4ca-3340a604c1dsm10279661fa.43.2025.08.16.07.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Aug 2025 07:37:01 -0700 (PDT)
Message-ID: <83755868-09b3-4bd1-8b40-0a4b9f497d2f@gmail.com>
Date: Sat, 16 Aug 2025 17:36:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] gpu/drm: host1x: mipi: add Tegra20/Tegra30 MIPI
 calibration logic
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250717142139.57621-1-clamor95@gmail.com>
 <20250717142139.57621-4-clamor95@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20250717142139.57621-4-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

17.07.2025 17:21, Svyatoslav Ryhel пишет:
> @@ -525,6 +599,14 @@ static int tegra_mipi_probe(struct platform_device *pdev)
>  		return PTR_ERR(mipi->clk);
>  	}
>  
> +	if (mipi->soc->dsi_v0) {
> +		mipi->csi_clk = devm_clk_get_prepared(&pdev->dev, "csi");
> +		if (IS_ERR(mipi->csi_clk)) {

Doesn't look like the clock needs to be prepared. Normally, you would
need to have clock prepared if clock is enabled/disabled from a context
that can't sleep, like under spinlock or in IRQ handler. AFAICT, this
not the case here.

