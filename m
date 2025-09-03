Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 008E0B42251
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 15:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227F010E898;
	Wed,  3 Sep 2025 13:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EtV1vxk9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C50010E898;
 Wed,  3 Sep 2025 13:45:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C6C1743A3F;
 Wed,  3 Sep 2025 13:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F58C4CEF0;
 Wed,  3 Sep 2025 13:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756907129;
 bh=6Bp49XvIiL/gpcZUSJHbjfPDkjkxFuVv8aVM1mwkppM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EtV1vxk9Knh7vuhM8x4HkCnMMQg77LBHWAZjfHt0hykdAtk0J7zkljpn1dRo8ALRy
 nJBjQbGoGlt335lc6Yejbwt37hjTv6p8SfDTunaRiW2oQzHQJq0rlhZtQ1LRmN6+mL
 IGnwxZAwUAyqQhCdqcZjg6unlXq+oHZaIHgAwNaLEtGxgemHO0ZOaXw9RabH2oRHjO
 1NAsUX1pvy8xvLLbjRFOhcQ7OcGTcv3rYRTxHcZtSDX9/AS365g+6AYkmZe7Gug6n+
 egQHkiSWI1KySu6kre/fm/A9KyjZ9fyn2Wecsk4AkYcdc4XAKirge13OlUIx7BdFSr
 JLHu0DYRXsxWw==
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-7459de59821so282488a34.1; 
 Wed, 03 Sep 2025 06:45:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWqV+38amf1vKXcMXEyYom7xNRldB86uHcGQhneH2TqzozI63ugagsS0pQvmQNAdilbDkbgYHcujpwZ@lists.freedesktop.org,
 AJvYcCXQuOwJ/bHaLSGhS5krEPvnexjTogNWwPkUQueGkFWyFskESxaGyMpd6oOf8jIW5LOjBGSuNviFdDk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBnjCCwuYd+c3QYSRASKSIKDaBrogBouItl5mcA9nIoQVc8dY1
 FJd2DnQec0g3e+obGIYFvvNLyM5hrDtVHiHsTtg0QE5muMMveLI/D/VlG0xV9xzKtiA/gk8VJzu
 avXKm09SK4JS252eSHCN0d0S+E+n6XOI=
X-Google-Smtp-Source: AGHT+IFj7tJ0lfFEWygwFa+BeDrtHlIidd3MSLvzw4pQoHyU3fN8psDlEaELWcEJ9+cmnisQYq8U5lt0bInRpr2lJAs=
X-Received: by 2002:a05:6830:6682:b0:745:9ba6:d32c with SMTP id
 46e09a7af769-7459ba6d61bmr1062886a34.2.1756907128976; Wed, 03 Sep 2025
 06:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
 <20250903131733.57637-8-zhangzihuan@kylinos.cn>
In-Reply-To: <20250903131733.57637-8-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 3 Sep 2025 15:45:17 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hirWzWZiLbAXPWB58SQv3CAW95iHLnsqs=i2twVCcmwg@mail.gmail.com>
X-Gm-Features: Ac12FXwBQmIxy8zPXuaWqJJ1Bp0qaxbUEME_ozpvMpdmoYPanY06xkhRVAoy8ys
Message-ID: <CAJZ5v0hirWzWZiLbAXPWB58SQv3CAW95iHLnsqs=i2twVCcmwg@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] powercap: dtpm_cpu: Use scope-based cleanup
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

On Wed, Sep 3, 2025 at 3:18=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylinos.cn=
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
>  drivers/powercap/dtpm_cpu.c | 30 +++++++++++-------------------
>  1 file changed, 11 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu.c
> index 99390ec1481f..f76594185fa2 100644
> --- a/drivers/powercap/dtpm_cpu.c
> +++ b/drivers/powercap/dtpm_cpu.c
> @@ -144,19 +144,17 @@ static int update_pd_power_uw(struct dtpm *dtpm)
>  static void pd_release(struct dtpm *dtpm)
>  {
>         struct dtpm_cpu *dtpm_cpu =3D to_dtpm_cpu(dtpm);
> -       struct cpufreq_policy *policy;
>
>         if (freq_qos_request_active(&dtpm_cpu->qos_req))
>                 freq_qos_remove_request(&dtpm_cpu->qos_req);
>
> -       policy =3D cpufreq_cpu_get(dtpm_cpu->cpu);
> -       if (policy) {
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
> +               cpufreq_cpu_get(dtpm_cpu->cpu);
> +
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
> @@ -192,7 +190,6 @@ static int cpuhp_dtpm_cpu_online(unsigned int cpu)
>  static int __dtpm_cpu_setup(int cpu, struct dtpm *parent)
>  {
>         struct dtpm_cpu *dtpm_cpu;
> -       struct cpufreq_policy *policy;
>         struct em_perf_state *table;
>         struct em_perf_domain *pd;
>         char name[CPUFREQ_NAME_LEN];
> @@ -202,21 +199,19 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *p=
arent)
>         if (dtpm_cpu)
>                 return 0;
>
> -       policy =3D cpufreq_cpu_get(cpu);
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
> +               cpufreq_cpu_get(cpu);
> +
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
> @@ -239,7 +234,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *par=
ent)
>         if (ret < 0)
>                 goto out_dtpm_unregister;

So this change kind of goes against another recommendation given in cleanup=
.h:

 * Lastly, given that the benefit of cleanup helpers is removal of
 * "goto", and that the "goto" statement can jump between scopes, the
 * expectation is that usage of "goto" and cleanup helpers is never
 * mixed in the same function. I.e. for a given routine, convert all
 * resources that need a "goto" cleanup to scope-based cleanup, or
 * convert none of them.

>
> -       cpufreq_cpu_put(policy);
>         return 0;
>
>  out_dtpm_unregister:
> @@ -251,8 +245,6 @@ static int __dtpm_cpu_setup(int cpu, struct dtpm *par=
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
