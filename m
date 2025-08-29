Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CEEB3B2E2
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 08:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09DA10EB40;
	Fri, 29 Aug 2025 06:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l/nC3x0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9801C10EB40
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 06:04:31 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-323266d6f57so1878336a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 23:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756447471; x=1757052271; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KKw32u8ZnOL0uI6AwPEDfGz9pjVdeOgj9SolEPmlghw=;
 b=l/nC3x0P4MI0wOVNDxtTeFYlDT8eeVZ6NFQq5VrYecu95huXhqx/rishef2NNon1qB
 xRTrM7DOa9xcuZk5TrZnFcpujBUB29Cv6C0EUYuZn2kp/yNpWkASMdJNpaOmvU6HnP0n
 iltTOpN4AOu9qF9ko3MwX/7cqmv1q+EZVZBBa0OifNti49sf0WWNdf4UYvpB9FlMEWva
 W4oRu4TuCLl4cWUSeDlKt8ENS5vDFu517E7fJlfaG5hgybMqP/uMeO3lgFsnqBGLAYWd
 87B2aBZVXd6PwhCZw0wEwOh13XhRbbSov4mO186tDyF5Hm3cdSjmJuYzhYbqClRoSfqJ
 T+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756447471; x=1757052271;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KKw32u8ZnOL0uI6AwPEDfGz9pjVdeOgj9SolEPmlghw=;
 b=WYDM/lYpxG785/bMb+r1suTQ06IOFmdgAaPTcqlZwEtCwuXceKyEQ9DrUApUr961+o
 eviBkjsVjjzD+TfXInGu+XK3ADpK8mDblY9sNctJX3mp4HJocqiFnlCIefQuqSM+KbhZ
 +SeTUJxXm8R3VGXAfza4FNTxm0dtVgQJvfrMsomR1IZ8KteC4NE4yo7BL9wH/iRWu8q7
 BngjQm6TIrx8vZ3txB3l23EANzS76GtbdNmwW7ZnIBNTCsQAxuBSlkPslxQcFOMkxKtL
 KsmCt9y/Elg7pdFR0sNz0CfmEl4iQw18sCUx/BE6EI+zPOyYVfjLar/psvn7rVBmqZQn
 Pb3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCOlG2jRJ65dmkrFBNEsQP1aPVDhPOk+6HdsVR9orhHPJtz7jkP78hOgKMSA1Wc6C0P2vFw3jue54=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjWZMQyav9ZdoaH8qMvvybKQIHAQq4wvT01Nkv6yvp0SB/fc2W
 pD43cy9HWSL1jTXZ/h0BdvUQODU5N90adrIedisHAxjChqF3s9ndXQeA+ri7fnmrGPE=
X-Gm-Gg: ASbGncu3xdOEpuuFa6prQNeIlB12EqDIP5LMr4VgKAChZvm6RfUi6xIr+Vg9vPLRXda
 FAWQqq6e1eNju5bt1lupFhqZ+oi0igloK+BvS4IJz4COsCfm0UkKymk3ZqH8/adXOdT0oWijQYG
 +rRV3KeDploLHWj18I3VQn01k+xTBiK0Cw60AvXiSkT3JAf5/BKhDhd2oCAb0qRpeDcc7VJ301y
 HPxuz2V9QOnP1B2fVK0CZ5NBm2umRARAIRni4QnqaEyfNcqLLvpjYNydObKhi6SSNhbNyWNJtYt
 lyZ5RF7tdq4c85sLR8u3p8Zy2JHfi+0s1PwtCiLWMvfD3GETGVlww60pOWCgn+VKJImYCIFxudR
 XYGJMjpjdIeVfqMpx1kYWN1G/
X-Google-Smtp-Source: AGHT+IHJm0ouStNvxO+mrh5P3XbGCZbjhM83KCGZEDW+lDzAXYoH2OUF1pt2Xet0QmziR4vBgyThHQ==
X-Received: by 2002:a17:90b:4ec7:b0:31f:42e8:a896 with SMTP id
 98e67ed59e1d1-32518b8233amr31504637a91.34.1756447471082; 
 Thu, 28 Aug 2025 23:04:31 -0700 (PDT)
Received: from localhost ([122.172.87.165]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3276f57ab9esm7074127a91.4.2025.08.28.23.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 23:04:30 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:34:28 +0530
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
Subject: Re: [PATCH v2 05/18] cpufreq: CPPC: Use __free(put_cpufreq_policy)
 for policy reference
Message-ID: <20250829060428.aoo4wlp67celupv5@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-6-zhangzihuan@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827023202.10310-6-zhangzihuan@kylinos.cn>
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
>  drivers/cpufreq/cppc_cpufreq.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied. Thanks.

-- 
viresh
