Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4B4B4590C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 15:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5613E10E300;
	Fri,  5 Sep 2025 13:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YDLPRfxE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE3E10E300;
 Fri,  5 Sep 2025 13:32:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5284C44CB7;
 Fri,  5 Sep 2025 13:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114C8C4CEFB;
 Fri,  5 Sep 2025 13:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757079131;
 bh=8jAcdpkwkSpwOdJxvwA2Vj7xEHXguZJ+MKwk0qNCAa4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YDLPRfxE+TA2Q55nxy+S45umyans+pDRvwbObVt0bW3hJ3GKjbxPrVlX07NomP+MM
 gilJHDzfgmGFOcAFu0+loSilTzpkeDO9g9x8k2BAevsNOqWlkswrDpHfRJW58By2gZ
 h5T2iOat+XnnhSD9UwBeQ3xYHCYi7jaP+GtkcpXBdqab/ccFdCeVstKHtgcieR/3QH
 +KRTayLgDC1M/LhwjwPtXIccD6HoAsAvaea3u1dA7qTzCEzjxT3V+HO3EHQdCVNDFU
 /St9BM0FbaHx4JdEUTHAM1R9DDj8M5cKZD+5HIpQks7AUiitM6xvVlMUYXsHzcS8lI
 bWTNhY8srV4ig==
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-746d3fd3a04so1376746a34.1; 
 Fri, 05 Sep 2025 06:32:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU2Vh3Pvo2T1l28mnE0xnGqeYkIee4VZ3pqroT7e869/jT+aM7CqFi5Bcq5TsPaP/XYoduaGNyDRbxs@lists.freedesktop.org,
 AJvYcCWyLNSbSp0Bkp+qkQoDmEtPdEMgRgojhgjKZO0uzCl2qjUWUuBcUB+eRiqh6pzXnVd+7K+rmZGCVmY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ70mq1P5mpvelXVInwT+kBH9ew7hHKpFoNl1e9GF1/Q69vGLi
 VesLBKcITd4yB5CYZymwcbBt3aJQIGaslPQLdLc5b0MDrPqYU44fgC53iyUsMMa33W3NJQLVH+S
 IxHRHom9/qUXZwt20KRuVhMCXn0REetM=
X-Google-Smtp-Source: AGHT+IFnE56n2ZWY3m6GFquWJS3R+4zyRWG4mn/x7Tvk/fQPvR7/F7IjMN/5eFQpLDwVxaDdPh5JX7KANJsrFqH4mJc=
X-Received: by 2002:a05:6830:378e:b0:741:a5f0:bc82 with SMTP id
 46e09a7af769-74569e53d0dmr13231613a34.17.1757079130135; Fri, 05 Sep 2025
 06:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn>
 <20250905132413.1376220-4-zhangzihuan@kylinos.cn>
In-Reply-To: <20250905132413.1376220-4-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 5 Sep 2025 15:31:58 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jdJZ2upvE4KzDnc59KpMX+oqYbq=ZW=SXfwvjBctMj3Q@mail.gmail.com>
X-Gm-Features: Ac12FXwR6ToJkYo5xTTss3xr-Ox8ITso59X_uvklZva98cFgnVHnG6meS0I7mt8
Message-ID: <CAJZ5v0jdJZ2upvE4KzDnc59KpMX+oqYbq=ZW=SXfwvjBctMj3Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] cpufreq: intel_pstate: Use scope-based cleanup
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
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

No, sorry.  I've already said that this isn't going to work:

https://lore.kernel.org/linux-pm/CAJZ5v0gN1T5woSF0tO=3DTbAh+2-sWzxFjWyDbB7w=
G2TFCOU01iQ@mail.gmail.com/

so why are you resending it?

And making changes to it in the process without saying what they are?

Please stop adding confusion.

> ---
>  drivers/cpufreq/intel_pstate.c | 59 +++++++++++++++++++---------------
>  1 file changed, 33 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstat=
e.c
> index f366d35c5840..0b54e08f9447 100644
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
>
> @@ -1695,41 +1694,49 @@ static ssize_t store_no_turbo(struct kobject *a, =
struct kobj_attribute *b,
>         return count;
>  }
>
> -static void update_qos_request(enum freq_qos_req_type type)
> +static bool intel_pstate_cpufreq_update_limits(int cpu, enum freq_qos_re=
q_type type)
>  {
>         struct freq_qos_request *req;
> -       struct cpufreq_policy *policy;
> -       int i;
> +       unsigned int freq, perf_pct;
> +       struct cpudata *data =3D all_cpu_data[cpu];
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpu);
>
> -       for_each_possible_cpu(i) {
> -               struct cpudata *cpu =3D all_cpu_data[i];
> -               unsigned int freq, perf_pct;
> +       if (!policy)
> +               return false;
>
> -               policy =3D cpufreq_cpu_get(i);
> -               if (!policy)
> -                       continue;
> +       req =3D policy->driver_data;
>
> -               req =3D policy->driver_data;
> -               cpufreq_cpu_put(policy);
> +       if (!req)
> +               return false;
>
> -               if (!req)
> -                       continue;
> +       if (hwp_active)
> +               intel_pstate_get_hwp_cap(data);
>
> -               if (hwp_active)
> -                       intel_pstate_get_hwp_cap(cpu);
> +       if (type =3D=3D FREQ_QOS_MIN) {
> +               perf_pct =3D global.min_perf_pct;
> +       } else {
> +               req++;
> +               perf_pct =3D global.max_perf_pct;
> +       }
>
> -               if (type =3D=3D FREQ_QOS_MIN) {
> -                       perf_pct =3D global.min_perf_pct;
> -               } else {
> -                       req++;
> -                       perf_pct =3D global.max_perf_pct;
> -               }
> +       freq =3D DIV_ROUND_UP(data->pstate.turbo_freq * perf_pct, 100);
>
> -               freq =3D DIV_ROUND_UP(cpu->pstate.turbo_freq * perf_pct, =
100);
> +       if (freq_qos_update_request(req, freq) < 0)
> +               pr_warn("Failed to update freq constraint: CPU%d\n", cpu)=
;
>
> -               if (freq_qos_update_request(req, freq) < 0)
> -                       pr_warn("Failed to update freq constraint: CPU%d\=
n", i);
> +       return true;
> +}
> +
> +
> +static void update_qos_request(enum freq_qos_req_type type)
> +{
> +       int i;
> +
> +       for_each_possible_cpu(i) {
> +               if (!intel_pstate_cpufreq_update_limits(i, type))
> +                       continue;
>         }
> +
>  }
>
>  static ssize_t store_max_perf_pct(struct kobject *a, struct kobj_attribu=
te *b,
> --
> 2.25.1
>
>
