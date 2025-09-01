Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F179B3E955
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 17:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A780C10E4D7;
	Mon,  1 Sep 2025 15:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DFjWhN/j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746E910E4D3;
 Mon,  1 Sep 2025 15:17:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 18DBE450E5;
 Mon,  1 Sep 2025 15:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1DD7C4CEF1;
 Mon,  1 Sep 2025 15:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756739838;
 bh=5weQGGRb22PrjCyP/g4zxlVoFtpKwJSJ+1zX1sG+Ceo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DFjWhN/jsNsqAZvHoveNR+Mgdhf7CMJNAnHMrmN/uF1Ia3yuW4Qod6p05GG8Q9AKP
 fzD+FXwqy0hyFfv298cfv8KssWE1igCMs1gfYHUlIY3Pojgd8hFLbvmVrYD/IBGm5W
 crp3nff/U+EJEAk2gYyeYerz2o55JEjk1N19gxpYnJJbdzMoF5GgV5YSlfB2VkZLOn
 AE3ls2gQNv4xuJLcUc4UhU3gzfCY6dxcTnqht58XOTS5Od2EymDUI7FSQCEQWKtblB
 cWPeRvvs7Bt+yVsA0oc7f1vLNZxvLc+i2XqNWZQlRBoj9cTjxGt1TsYxr/D+RpVS22
 zXj0XkSwv0Msg==
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-30cce86052cso2591330fac.1; 
 Mon, 01 Sep 2025 08:17:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVxzF41bpDMst4EJ2JeS8ydTjKgragrntzcPLfgKcvvppmfLlFcWNfwVXBb5uhi/wAX1Ums9ghBuMJB@lists.freedesktop.org,
 AJvYcCX64lUu1FTwK3Hp4kVaz4fB6JGdA1lfg/icDOXg8AWqWjavHXm72UfvX07paMM1JFuG/aN/WZdVqsw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu2nr54XqAeIl/21oBw9s6qmAvZtC93QGiT49c3Ypq7F7cvn4z
 BHStkC/2UhMUEhk5ZtPFJaDBbJ8RS4ognwtGHY1vYCJuzZRon+6AtOnDe2qg/J1uNjBJmzDDxIX
 ihC4kRb2qpeH9JnGkv7DFZusmtlJWfVA=
X-Google-Smtp-Source: AGHT+IEqozTSDrtoR1W72zJmy9Z1LH1mlLFPdwzpw5V1Yv8IGBwtb8EBAZercDEFewoqAI3YKrAtdKI2Ii3KK+l5mg4=
X-Received: by 2002:a05:6870:9b09:b0:30b:b123:b6c9 with SMTP id
 586e51a60fabf-319630e13fbmr3523480fac.12.1756739836982; Mon, 01 Sep 2025
 08:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250901085748.36795-1-zhangzihuan@kylinos.cn>
 <20250901085748.36795-4-zhangzihuan@kylinos.cn>
In-Reply-To: <20250901085748.36795-4-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 1 Sep 2025 17:17:05 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hu48NrMr6Vkjn_UyHywJMx7F5N6yWf2LiXxykZF79EKA@mail.gmail.com>
X-Gm-Features: Ac12FXy28aQLAZnDRwhZh3hbZ0aFKhCyHW17tDgFwo0nHMN5cP-adgYEeM5GYyY
Message-ID: <CAJZ5v0hu48NrMr6Vkjn_UyHywJMx7F5N6yWf2LiXxykZF79EKA@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] cpufreq: intel_pstate: Use scope-based cleanup
 helper
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Ben Horgan <ben.horgan@arm.com>, 
 zhenglifeng <zhenglifeng1@huawei.com>, Zhang Rui <rui.zhang@intel.com>, 
 Len Brown <lenb@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>, 
 Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>, 
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>, 
 Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Sep 1, 2025 at 10:58=E2=80=AFAM Zihuan Zhang <zhangzihuan@kylinos.c=
n> wrote:
>
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
>
> No functional change intended.
>
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/cpufreq/intel_pstate.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstat=
e.c
> index f366d35c5840..4abc1ef2d2b0 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -1502,9 +1502,8 @@ static void __intel_pstate_update_max_freq(struct c=
pufreq_policy *policy,
>
>  static bool intel_pstate_update_max_freq(struct cpudata *cpudata)
>  {
> -       struct cpufreq_policy *policy __free(put_cpufreq_policy);
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpudata->cpu);
>
> -       policy =3D cpufreq_cpu_get(cpudata->cpu);
>         if (!policy)
>                 return false;

The structure of the code is intentional here and there's no reason to
change it.
