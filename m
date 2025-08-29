Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79103B3B2C7
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 07:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A50710EB3D;
	Fri, 29 Aug 2025 05:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aetfx2Lc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B305110EB3D
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 05:59:48 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7704f3c4708so2117088b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756447188; x=1757051988; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Csp0y2UiuYBIoSGq3QglK9zewj1/hbg1F372AFvl94U=;
 b=aetfx2Lcae0RjD9AqGCJoOWVKrxYLFOToM2qWsADM+rnOAwKalBXtUnObnXg4jEpAq
 4Z4TZz5YSEWiGY7/Mk6sQnnsMZPWL23irFB1iEJmMhkgBpopvzPrnQH8JYwHzfRQyCXn
 pwTnMgO0ME37PDqoDm1Ph29Z405akmizwiKoo0RBK+QwiAXbkV/t8UTUW7QhnLLqsC8d
 DHvSbi6GpZQkdw6WELtVsOMCBbKMuCVxoWYMnxEHTyle9HU3Xv8bvZn5e7yS6KR1uWKT
 D5QDI1dE25Lfa7LVT48Y4sw93h/FwREZunkSXfEnj0xeip0Z6EIT0AWj9dqg2rdY2T0I
 gKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756447188; x=1757051988;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Csp0y2UiuYBIoSGq3QglK9zewj1/hbg1F372AFvl94U=;
 b=MfBelwgaGxNwYCgrPzX/bK96uHdBSelUNSBjxVKq1Wh6JJSmDXiMdw092m5cyZTQSZ
 CFsEcc2dXKbUOPv1rcpyWLF+c6JCAQP+sPXv/V36VY3zTYMxlJ+4Wb7Twpu3v+Y9IPPS
 UGQiDHzmdd5oxSZe8uGjm+ttV25P/y3ao/hjUhLfYHRgjsyGRB0/bai1SzDfmlTLw85n
 1/YTbjCMmCLQ+qbWZyZewgCgEEou0shdbSZ8jw0s7eS9VK5bL0zy9UnWgD/K1Q8GlXIx
 q8ak369IIWhgRm0X7FfGtL1olMKytTqZP5HfvCmaeC0TxoLMgh76T/l9I6zo/ez1x4U/
 AibA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlRTodOoWLNY5Q21QF1dgQXhVCHDvi6uWVYQnhti/dYlHIQ/SiUyNhSsmR793KZd7tl72P33Y6vwU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJRX0xwp9vEygzSGxyrPtSvdicmkwPgzd8ZqTP3Y73eQ2d9nlq
 wW5BYBC3paluT1JlQN2lVpnhlFl37Ib8yUeDPQ/K+8Cly10UsAzQpjEdQvXPuP4HXOs=
X-Gm-Gg: ASbGncvjQFvVRR4ELr+Kc1I+5e/KkIgwSYTin+AyyZyKkCgv+IQWeIVoy7KCYGUxsxl
 u6ZzPjMwHuLwS5IK2XCecfjKmB7licwFXhR5MKrmVvgVkypADqfSnMt/VucGLFhTOo5/SBDpoJv
 Dn4JJkkLb9dfi8V9DfzjtdBhFcAi9nxnAZr+5/paWpSDUNxAkHMBihqKvP4FssDueCOd4ljgQWs
 SjJpvvpISMx5XUxcsii6dadn7iVoO7CZdrOGxiFkgeHeE8/EEcvibnAbJFogplyfiuikThatlIr
 MXKnryLV0Cy+2p/x/JX8YI0zm+6oqtXOU/JhOulpG5viFx6r9UPaHzsCsrW/uiO4LGpU6P9cbca
 3MgC5PDQ+zy0TRDTLgq7nQLSYnWV4F7hMRjk=
X-Google-Smtp-Source: AGHT+IFsar3WOaSA9RKNM7TPFf9gG0iXTxdUF2CW8raU1SyelgEQswrlDbapLb2rA7PUFkb3M17NCQ==
X-Received: by 2002:a05:6a00:10d5:b0:772:2850:783d with SMTP id
 d2e1a72fcca58-772285079c4mr3285667b3a.22.1756447188084; 
 Thu, 28 Aug 2025 22:59:48 -0700 (PDT)
Received: from localhost ([122.172.87.165]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a2b14c1sm1263485b3a.31.2025.08.28.22.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 22:59:47 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:29:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Markus Mayer <mmayer@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 zhenglifeng <zhenglifeng1@huawei.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Zhang Rui <rui.zhang@intel.com>,
 Len Brown <lenb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
 x86@kernel.org, kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/18] cpufreq: brcmstb-avs-cpufreq: Use
 __free(put_cpufreq_policy) for policy reference
Message-ID: <20250829055944.ragfnh62q2cuew3e@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-5-zhangzihuan@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827023202.10310-5-zhangzihuan@kylinos.cn>
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

On 27-08-25, 10:31, Zihuan Zhang wrote:
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/cpufreq/brcmstb-avs-cpufreq.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied. Thanks.

-- 
viresh
