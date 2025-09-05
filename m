Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 895D7B46483
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 22:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A1610E1B5;
	Fri,  5 Sep 2025 20:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uIKc5zt2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E2710E1B5;
 Fri,  5 Sep 2025 20:17:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0BC27602A9;
 Fri,  5 Sep 2025 20:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED8AC4CEFF;
 Fri,  5 Sep 2025 20:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757103458;
 bh=VCWnUGzPf6mLuDmms/YZCG2llaFLvKJwA1gnXCCbRdk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uIKc5zt24/XZwP7JYEqTfBfFRmX6Wk9YHD8HxEi0IvUGCXmYhq0zMpSm8supQ0Fb5
 iJGS/xoCTwpWx6B21zvCyX58JiG6wKZeHnfKV9PrzdFD8g77UCWMhwV/+VxR8kAvlQ
 yPVyT4akXZx6QFmh+sC2ZrMWYx9v4XhPjX4ZqEzVtRypqr58ssUWkgaJb/JjbHDIS4
 Q06psN5PW+ZumYVyodesqKh7Uj5j1bR2yhf3Z/vTbdtMhbmMxPQZsd1C7tcDa8a8kX
 RxRMOqOPKJoPYzcqOhn1uU/Cd9d8rzzAEwXshP6QHtlDLuGvIqnZfJzgThdRl7C/Wq
 nxK2iLAKYjwYQ==
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-61bd4ad64c7so801133eaf.0; 
 Fri, 05 Sep 2025 13:17:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUmzQtB3YhrAl7J+DyruGg1/scbBpkMzpHyC7fC58B/LP6mO33Mex+ywG7/ZOxMDuGdZKJmUXBHXGKw@lists.freedesktop.org,
 AJvYcCWB4qb8Vox29IHq4wU0k68iNVV2ytlUnTUrMNOVgQJ3ox0pUQ8XwU89o48gj2O3NWkEex4gUNJm9AY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx51oCKcht6KN8lThHCR18BmSaw7aiP5YJzuFuMCI0UiREYEagl
 KMnsFfZiRg+WlioRXELeWtiX3j3k8O1FcF5ww2ULIyzmlXPCSC2gHKSUShS/JPPkBfScxaAupcM
 LhWJHmmniwqUCyCm2W6X5lJl4PXtjWCw=
X-Google-Smtp-Source: AGHT+IEfq1HNckIyyDDXquy0XLtyGZg1XWmotG9HdXFUDIR4D+v0h/9IrUo3g6diO4+f6WOXTRuaooZELa2e+VnSV5o=
X-Received: by 2002:a05:6820:809:b0:61f:f932:8d64 with SMTP id
 006d021491bc7-61ff9329264mr2455383eaf.1.1757103457768; Fri, 05 Sep 2025
 13:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn>
 <20250905132413.1376220-3-zhangzihuan@kylinos.cn>
In-Reply-To: <20250905132413.1376220-3-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 5 Sep 2025 22:17:26 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iTdgM5BBi2ysiJxfA2c=MQ0fjLsEvVct9stxomvEe=4Q@mail.gmail.com>
X-Gm-Features: Ac12FXw3PBjsIjj4AtBsEfmKTR7PfZEmevzc6Jwe0zbtA2TuWwqukJr66Nf1sL8
Message-ID: <CAJZ5v0iTdgM5BBi2ysiJxfA2c=MQ0fjLsEvVct9stxomvEe=4Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] ACPI: processor: thermal: Use scope-based cleanup
 helper
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
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

On Fri, Sep 5, 2025 at 3:24=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylinos.cn=
> wrote:
>
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
>
> No functional change intended.
>
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/acpi/processor_thermal.c | 52 +++++++++++++++++---------------
>  1 file changed, 27 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_th=
ermal.c
> index 1219adb11ab9..460713d1414a 100644
> --- a/drivers/acpi/processor_thermal.c
> +++ b/drivers/acpi/processor_thermal.c
> @@ -62,19 +62,14 @@ static int phys_package_first_cpu(int cpu)
>         return 0;
>  }
>
> -static int cpu_has_cpufreq(unsigned int cpu)
> +static bool cpu_has_cpufreq(unsigned int cpu)
>  {
> -       struct cpufreq_policy *policy;
> -
>         if (!acpi_processor_cpufreq_init)
>                 return 0;
>
> -       policy =3D cpufreq_cpu_get(cpu);
> -       if (policy) {
> -               cpufreq_cpu_put(policy);
> -               return 1;
> -       }
> -       return 0;
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpu);
> +
> +       return policy !=3D NULL;
>  }
>
>  static int cpufreq_get_max_state(unsigned int cpu)

The changes above are fine and can be sent as a separate patch.

> @@ -93,12 +88,31 @@ static int cpufreq_get_cur_state(unsigned int cpu)
>         return reduction_step(cpu);
>  }
>
> +static bool cpufreq_update_thermal_limit(unsigned int cpu, struct acpi_p=
rocessor *pr)
> +{
> +       unsigned long max_freq;
> +       int ret;
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpu);
> +
> +       if (!policy)
> +               return false;
> +
> +       max_freq =3D (policy->cpuinfo.max_freq *
> +               (100 - reduction_step(cpu) * cpufreq_thermal_reduction_pc=
tg)) / 100;
> +
> +       ret =3D freq_qos_update_request(&pr->thermal_req, max_freq);
> +       if (ret < 0) {
> +               pr_warn("Failed to update thermal freq constraint: CPU%d =
(%d)\n",
> +         pr->id, ret);
> +       }

But this silently fixes a bug in the original code which needs to be
documented with a Fixes: tag (and it would be better to fix the bug
separately before the using the __free()-based cleanup TBH) and
introduces some whitespace breakage.

> +
> +       return true;
> +}
> +
>  static int cpufreq_set_cur_state(unsigned int cpu, int state)
>  {
> -       struct cpufreq_policy *policy;
>         struct acpi_processor *pr;
> -       unsigned long max_freq;
> -       int i, ret;
> +       int i;
>
>         if (!cpu_has_cpufreq(cpu))
>                 return 0;
> @@ -120,20 +134,8 @@ static int cpufreq_set_cur_state(unsigned int cpu, i=
nt state)
>                 if (unlikely(!freq_qos_request_active(&pr->thermal_req)))
>                         continue;
>
> -               policy =3D cpufreq_cpu_get(i);
> -               if (!policy)
> +               if (!cpufreq_update_thermal_limit(i, pr))
>                         return -EINVAL;
> -
> -               max_freq =3D (policy->cpuinfo.max_freq *
> -                           (100 - reduction_step(i) * cpufreq_thermal_re=
duction_pctg)) / 100;
> -
> -               cpufreq_cpu_put(policy);
> -
> -               ret =3D freq_qos_update_request(&pr->thermal_req, max_fre=
q);
> -               if (ret < 0) {
> -                       pr_warn("Failed to update thermal freq constraint=
: CPU%d (%d)\n",
> -                               pr->id, ret);
> -               }
>         }
>         return 0;
>  }
> --
