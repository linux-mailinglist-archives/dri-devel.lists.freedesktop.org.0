Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74939B41D3C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 13:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EEA110E7A6;
	Wed,  3 Sep 2025 11:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZpjrJSUQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DBC10E7A1;
 Wed,  3 Sep 2025 11:43:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7E3FB44C1F;
 Wed,  3 Sep 2025 11:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F11C4CEF7;
 Wed,  3 Sep 2025 11:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756899811;
 bh=vKQkkEhiJ1pWIqj+5+l0nwZXdLd03e23W2MiNNRAENI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZpjrJSUQT1mjo/GMosxVE9BlKGzz1qGPGvR96j4+cgvYWF0u5LAVlwLWXP3ABf9xh
 emKGoXYpzikhccqTWnXBUrcQPaehl9+DjtD8mRrCZAUG0qMfiELP4YWuYF1/F3FhRs
 aW14nUDCO+/AYANfE36disnrS+dbIk61uVm2aK4DwbZr4D6ZklHcUzH8AB5VT4ETkI
 oemvw0KIyTt5h9EWGtcRYHX1XymPMBJ5M8rR/7taIhWazv9RCHjo2E6MQK1ZSFsIft
 KMXYcw8DilfLBcBV9GtUI2eD4qkQH6J3a3mK4SaX7Nes6EUJ273H+CqQgGGZuh4kFd
 y6ffvET3JkSjQ==
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-61e45cdfafeso622488eaf.1; 
 Wed, 03 Sep 2025 04:43:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVP3BTme2M2uZhb0D3CJLF9tl+qXWOe0fadDNKc3G6OBt38PINVO1qwmhYEHocfk1uMs0WqELoi9+Y=@lists.freedesktop.org,
 AJvYcCXKO5Ch/8Nc3m9tW3b7IircoqSExUPKeLx0UqpiWHlld6lQw7hbrROx7DbcNm+YDkXP2IHeZ0uGIrDy@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6MRe77nXVOh90+9CgWYxQm9WAduSAWZP08ACp9yvidkaI8309
 2abJ0Ux33S8Rx8OrGC6z86/vEpxWUqsOSRUhFZ2/EqYsQwl3sXAR3xuuiJQo91+kYDZOTJVN0F8
 e8o1wexAGTHxAeIg//J4d6aTTXy/uOoM=
X-Google-Smtp-Source: AGHT+IFudXZ/fyz4UQ3WH+8GjEXukDIGbLh/LZigzEMBTf0gXA3YZsKNByr0Anw/wDvM05EPCnSrOq7ywW0PFfzffo4=
X-Received: by 2002:a05:6820:1694:b0:619:7d9b:3f0b with SMTP id
 006d021491bc7-61e33740f82mr7219508eaf.5.1756899810069; Wed, 03 Sep 2025
 04:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250901085748.36795-1-zhangzihuan@kylinos.cn>
 <20250901085748.36795-10-zhangzihuan@kylinos.cn>
In-Reply-To: <20250901085748.36795-10-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 3 Sep 2025 13:43:17 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gwpefQt8VJ3XUyFy7u7rFhvPT=sXqG-1gHobw=1NgJpw@mail.gmail.com>
X-Gm-Features: Ac12FXwdhTUIKZ7oynz9F8Wzgqo7R3jPRBfEv1CLslQcvLPWz0YXuuodu9R2gpg
Message-ID: <CAJZ5v0gwpefQt8VJ3XUyFy7u7rFhvPT=sXqG-1gHobw=1NgJpw@mail.gmail.com>
Subject: Re: [PATCH v3 09/12] powercap: dtpm_cpu: Use scope-based cleanup
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
>  drivers/powercap/dtpm_cpu.c | 26 +++++++-------------------
>  1 file changed, 7 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu.c
> index 99390ec1481f..5e18438782f8 100644
> --- a/drivers/powercap/dtpm_cpu.c
> +++ b/drivers/powercap/dtpm_cpu.c
> @@ -144,19 +144,15 @@ static int update_pd_power_uw(struct dtpm *dtpm)
>  static void pd_release(struct dtpm *dtpm)
>  {
>         struct dtpm_cpu *dtpm_cpu =3D to_dtpm_cpu(dtpm);
> -       struct cpufreq_policy *policy;
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(dtpm_cpu->cpu);
>
>         if (freq_qos_request_active(&dtpm_cpu->qos_req))
>                 freq_qos_remove_request(&dtpm_cpu->qos_req);
>
> -       policy =3D cpufreq_cpu_get(dtpm_cpu->cpu);

Since policy is not needed earlier, you may as well declare it here.

> -       if (policy) {
> +       if (policy)
>                 for_each_cpu(dtpm_cpu->cpu, policy->related_cpus)
>                         per_cpu(dtpm_per_cpu, dtpm_cpu->cpu) =3D NULL;
>
> -               cpufreq_cpu_put(policy);
> -       }
> -
>         kfree(dtpm_cpu);
>  }
>
> @@ -192,7 +188,7 @@ static int cpuhp_dtpm_cpu_online(unsigned int cpu)
>  static int __dtpm_cpu_setup(int cpu, struct dtpm *parent)
>  {
>         struct dtpm_cpu *dtpm_cpu;
> -       struct cpufreq_policy *policy;
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpu);
>         struct em_perf_state *table;
>         struct em_perf_domain *pd;
>         char name[CPUFREQ_NAME_LEN];
> @@ -202,21 +198,16 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *p=
arent)
>         if (dtpm_cpu)
>                 return 0;
>
> -       policy =3D cpufreq_cpu_get(cpu);

Ditto.

>         if (!policy)
>                 return 0;
>
>         pd =3D em_cpu_get(cpu);
> -       if (!pd || em_is_artificial(pd)) {
> -               ret =3D -EINVAL;
> -               goto release_policy;
> -       }
> +       if (!pd || em_is_artificial(pd))
> +               return -EINVAL;
>
>         dtpm_cpu =3D kzalloc(sizeof(*dtpm_cpu), GFP_KERNEL);
> -       if (!dtpm_cpu) {
> -               ret =3D -ENOMEM;
> -               goto release_policy;
> -       }
> +       if (!dtpm_cpu)
> +               return -ENOMEM;
>
>         dtpm_init(&dtpm_cpu->dtpm, &dtpm_ops);
>         dtpm_cpu->cpu =3D cpu;
> @@ -239,7 +230,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *par=
ent)
>         if (ret < 0)
>                 goto out_dtpm_unregister;
>
> -       cpufreq_cpu_put(policy);
>         return 0;
>
>  out_dtpm_unregister:
> @@ -251,8 +241,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *par=
ent)
>                 per_cpu(dtpm_per_cpu, cpu) =3D NULL;
>         kfree(dtpm_cpu);
>
> -release_policy:
> -       cpufreq_cpu_put(policy);
>         return ret;
>  }
>
> --
