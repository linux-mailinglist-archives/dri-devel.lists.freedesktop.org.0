Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3255BB453BA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 11:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091CB10E2C9;
	Fri,  5 Sep 2025 09:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="maFSgfUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5397510E2C9;
 Fri,  5 Sep 2025 09:48:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E6FB544D62;
 Fri,  5 Sep 2025 09:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C623AC113CF;
 Fri,  5 Sep 2025 09:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757065716;
 bh=60j1mYXfx8imU4XQiFjnOOvCwt0U79tykqDPzODIpZo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=maFSgfUyMQwnqV1XKC3DkrSxo3c4Gr1bocEJUa0cLC/fCnWL7VKM4c2Bo9v1SmE4u
 yVQjdnUaUzl/q7oOdXDTBWOziVgkW3OUauQ8yDbUzkhD+Ea/pnt8pUGe+qn8Hxy6DP
 errowBQd2WgD8DTePq4VnEhBOJnbeJmsXbrCagkdiWyhFzq39BzhmUenO0511YEV7n
 jg+iBtIvamrBFBb9f8DY9bEXpN3pl+sA7SKU5wB9iLK+S2xWlmrKw+vsNDCdZOVn3Y
 RFDI8L2baCVkbbjmpaN5vYKIn9ynTjCxTDJPLLx6OTo4NvTKH9jSoNhMTydU60UEnS
 1fR3EU3FDmD7Q==
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-61e536ada47so689746eaf.1; 
 Fri, 05 Sep 2025 02:48:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWoq4SO9OPrw5v4EX6TqlvgGEa5Yinu3Xik6mZGIehsxDgqGQTwWDMyUPsVXTT+t8mKa0YkPXez50g=@lists.freedesktop.org,
 AJvYcCX4bTuPxWEWXCgf0ZF3Fos/eKl4Y1tBg8qBLmrpsCxPIRTDsVWTYtDffQMCeZIVL7EgBjdVZ3d/PbGe@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQE6TmFAXsL0ZmYpDLlSuuCESRTK30z6uG5gn6QegFeanVBp2N
 slGWqRS60geT/K9nNwINXJEA82ub/3feH/1/Merli1UI6IkkoSMHSdOZ5MQtXWq4rL/sRgR8LmY
 /VC7jYTNCag3M3ba/W+5QzVml4/CkZec=
X-Google-Smtp-Source: AGHT+IHkVwjUQLo7sTj2SxSH10cahTF1EYNw9jM6xcyVmF8yMApnd+1WPw0MFaTQWrdPzjCgm5hFMvaNgP7dcxRbczQ=
X-Received: by 2002:a05:6820:1b96:b0:61e:154c:5b01 with SMTP id
 006d021491bc7-61e3374776emr14360839eaf.6.1757065715741; Fri, 05 Sep 2025
 02:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
 <20250903131733.57637-4-zhangzihuan@kylinos.cn>
In-Reply-To: <20250903131733.57637-4-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 5 Sep 2025 11:48:22 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gN1T5woSF0tO=TbAh+2-sWzxFjWyDbB7wG2TFCOU01iQ@mail.gmail.com>
X-Gm-Features: Ac12FXwjp9ef-jXM-6Nr2o91cs1h2j3e0FpihiJghXWzXAbogv1aACVXGXzJKyM
Message-ID: <CAJZ5v0gN1T5woSF0tO=TbAh+2-sWzxFjWyDbB7wG2TFCOU01iQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] cpufreq: intel_pstate: Use scope-based cleanup
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
>  drivers/cpufreq/intel_pstate.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstat=
e.c
> index f366d35c5840..925efb1e65be 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -1209,6 +1209,17 @@ static bool hybrid_clear_max_perf_cpu(void)
>         return ret;
>  }
>
> +static struct freq_qos_request *intel_pstate_cpufreq_get_req(int cpu)
> +{
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
> +               cpufreq_cpu_get(cpu);
> +
> +       if (!policy)
> +               return NULL;
> +
> +       return policy->driver_data;
> +}
> +
>  static void __intel_pstate_get_hwp_cap(struct cpudata *cpu)
>  {
>         u64 cap;
> @@ -1698,19 +1709,13 @@ static ssize_t store_no_turbo(struct kobject *a, =
struct kobj_attribute *b,
>  static void update_qos_request(enum freq_qos_req_type type)
>  {
>         struct freq_qos_request *req;
> -       struct cpufreq_policy *policy;
>         int i;
>
>         for_each_possible_cpu(i) {
>                 struct cpudata *cpu =3D all_cpu_data[i];
>                 unsigned int freq, perf_pct;
>
> -               policy =3D cpufreq_cpu_get(i);
> -               if (!policy)
> -                       continue;
> -
> -               req =3D policy->driver_data;
> -               cpufreq_cpu_put(policy);
> +               req =3D intel_pstate_cpufreq_get_req(i);
>
>                 if (!req)
>                         continue;
> --

This change would have been fine if the modified code had been
correct.  Unfortunately, this is not the case because below req is
passed to freq_qos_update_request() which accesses the policy object
indirectly through it, so the policy object should be
reference-counted until freq_qos_update_request() completes.

I will send a fix for this shortly (it is better to fix it before
rearranging the code to allow the fix to be backported more easily)
along with my version of the change in question.

Thanks!
