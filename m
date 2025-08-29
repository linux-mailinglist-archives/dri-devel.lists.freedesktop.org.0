Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 257DBB3B332
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 08:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5934F10EB44;
	Fri, 29 Aug 2025 06:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="g1w/PdQF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D03A10EB44
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 06:18:15 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-771eecebb09so2370514b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 23:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756448295; x=1757053095; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fyIWN60k8dYCbXXXMxmihVbQlVwII/BvZdY4wtkRha8=;
 b=g1w/PdQFbyJmXcK4pRhII3ecsSNPPRGMXJ328oXAB7dbtEIcbLMGEiF1o6mUnLuZd5
 SQ/8p0s/lbo7iL5bu3VdUttGneOGDMDYUsA6Qu9ifyHNJ+wgh2vwwmtzl0cYSJO/6oYt
 tQ3z7WzcIToYqa92RfIrBwaoL8RD95jbvt91VPqJXja/psLFK1VhaDuFDtmDmzgmsQg9
 mpf7jr5M+SONzE5Udlo8/ChuLas/ivn3TR8NYt4q1hNSW6LRJuUtUywftcVY0Z/rowyw
 otiySiQs2J2d6j1CQnVq++tf6uYrPibQj9x7YZbRXQrh7spMzazrCaO/lJ9cByszQThI
 XzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756448295; x=1757053095;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fyIWN60k8dYCbXXXMxmihVbQlVwII/BvZdY4wtkRha8=;
 b=oAbv+hvYQVTUxP0gVRs9UX6BGwMf4DnuhRqD70k6KaqQZE/oYnS2k8/SXmwjHOloqV
 /yiuB2QWP8hkTI5f7p3DJQvwaQBnrkjTJ8bK/v+IYxvWO61AAT0uMBqPJxPPAuYYCmeH
 Xk3Vei7cPpi7Eweh8/wxCXlJDFIr5RMgEXpavVC5v8w5OEooqtC4LeSoPfk1vYKoy+gI
 s4tAznlplxkSCcacpf/z/DRprMS+IIMHGR12taoXmGpkYLczLd2bPOFsDCCTySnSwZ6l
 0NF+nEqGp90R3eAjRw4tHk1lYfs3dBb0fOoBasHgvuYGWgS9h0lbIQlCEFd6uVDBmtld
 rnHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRIoNUGULEDGqPGLrcM9V22MOl3YDqxcW1DRzinhXQoBMNAFge8ynJOapI9u2niGZBPg9JvxAujC8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBsmuprVm19nygwJhfJDb4nm2zfnAdA1cYnZ7Zsg9ECz9cmA4V
 fUqvT0nuDWQIPfo3cpIChInOQnVR5KTBQeSp9q6XEqgIwEwsYgKItrXgl+6yPJ7kWdY=
X-Gm-Gg: ASbGncuwsnTx3Lj9/gNOiQIFuUpkiCjLsw3J6AIxMzzsNDIhEkD0mi9k5pnLf0R8y/T
 /lyPmUxbrRvxUkFbLuz2+8M0wGme011nXjAjXJArF3vwWkQfnbczTRV9wGrYdNSmBqReeYZZaR5
 09Rd2tmteuAipeB/L38BJDjWR235q6GyxHwZ3sOa2g7jLaUomLrP/CTgXHhZ9+3iRbNsVhv6tw8
 bphLn/juA9TAjur6u5LyQTWEYBXKc2OdG7BdSY1mC+ytvBgjBV9wDKVn1NkdTWp/fAgKmcdVmVH
 1K9OIhzhEydNqCeNnGxlaSpsdeJMEaqwtY2GNK+qw2s2Q4L2gfw71g6Qu6+XvZFj+OnwfoN/qd8
 jJe4gvgCZH13cdmM3yf5dMLhWOCTEqhzQJsA=
X-Google-Smtp-Source: AGHT+IEdwrBA8fEPouruiBjmjO1y+VLHrsJ6SO97Twxy5LbO1fb87iKCtpWKSDsewOGX8ikCQhJ2gQ==
X-Received: by 2002:a05:6a00:3907:b0:749:472:d3a7 with SMTP id
 d2e1a72fcca58-7702faaf2acmr35042659b3a.18.1756448295215; 
 Thu, 28 Aug 2025 23:18:15 -0700 (PDT)
Received: from localhost ([122.172.87.165]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a4e1b21sm1307488b3a.69.2025.08.28.23.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 23:18:14 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:48:12 +0530
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
Subject: Re: [PATCH v2 08/18] cpufreq: mediatek: Use
 __free(put_cpufreq_policy) for policy reference
Message-ID: <20250829061812.fziokvashujzbtth@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-9-zhangzihuan@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827023202.10310-9-zhangzihuan@kylinos.cn>
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
>  drivers/cpufreq/mediatek-cpufreq.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index f3f02c4b6888..1fae060e16d9 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -320,7 +320,7 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
>  	struct dev_pm_opp *new_opp;
>  	struct mtk_cpu_dvfs_info *info;
>  	unsigned long freq, volt;
> -	struct cpufreq_policy *policy;
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  	int ret = 0;
>  
>  	info = container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
> @@ -354,11 +354,9 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
>  
>  			dev_pm_opp_put(new_opp);
>  			policy = cpufreq_cpu_get(info->opp_cpu);
> -			if (policy) {
> +			if (policy)
>  				cpufreq_driver_target(policy, freq / 1000,
>  						      CPUFREQ_RELATION_L);
> -				cpufreq_cpu_put(policy);
> -			}
>  		}
>  	}

Merged with:

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 1fae060e16d9..fae062a6431f 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -320,7 +320,6 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
        struct dev_pm_opp *new_opp;
        struct mtk_cpu_dvfs_info *info;
        unsigned long freq, volt;
-       struct cpufreq_policy *policy __free(put_cpufreq_policy);
        int ret = 0;

        info = container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
@@ -353,7 +352,9 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
                        }

                        dev_pm_opp_put(new_opp);
-                       policy = cpufreq_cpu_get(info->opp_cpu);
+
+                       struct cpufreq_policy *policy __free(put_cpufreq_policy)
+                               = cpufreq_cpu_get(info->opp_cpu);
                        if (policy)
                                cpufreq_driver_target(policy, freq / 1000,
                                                      CPUFREQ_RELATION_L);

-- 
viresh
