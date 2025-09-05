Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09138B463E5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 21:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F2C10EC39;
	Fri,  5 Sep 2025 19:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G9qmJFw1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C22B10E369;
 Fri,  5 Sep 2025 19:46:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A0F5444F54;
 Fri,  5 Sep 2025 19:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67850C19422;
 Fri,  5 Sep 2025 19:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757101616;
 bh=H8MVjkz4o17difHvr2cD8D+8FZU1fUcKjhpmn4rwijw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G9qmJFw1HIMkEhpfwD6F7o3JbvpRO1V95WZ/oUz3+r2CZmbDws6CbBgur6Wekx+qi
 ldlGPU37Uj/fIsJfq8C0T5mwgtAEI7Vqo36+np24YoWw6Q+UqAD0c8vsYKdD1WmilJ
 I5H7EyGxJaGj6hrAng2kuUlTjEtq88UjwDYdjemQkTgF2roSvOtH1g1Vers9Vmn/8H
 hFTpK0+yBM6BJf93iSTpneRiwZTgqB03L5VCqcDIKq1c7x0wnA4m2OtzWFieeGFXd2
 UYnynJnuCo/OhHIYLgJZetquSD940EGwlIBAqodji7zBapVVl2I0pI39J7QYdGVk0c
 YFNdRZkp+5nBw==
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-61e4c824615so1088341eaf.2; 
 Fri, 05 Sep 2025 12:46:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVTKL6QKHMcbB+/waX4VJeGtZyxqG5HIJwxyPGLUomtXUf66JzzgqknYL8AgELD2N5H+EyZBboeEko=@lists.freedesktop.org,
 AJvYcCWO/7LqXpxd+vDZR+KETYTFafCIsrYtKl9a5WG5oP/hNYbJHJG95rZccpMSJOUIQwV117mi9OYy8Oxq@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxESobZl3195q3FU32RHGKAV0HoSAWbAhiRFl894aU8aMD7JwqK
 7b31JjAuehsl5sGs3YCEJYMqQ35GDWS6Tsq3wb+zk/XXmmDDv2tpJOjkIA2BLjp75nyBS2vaZR+
 pQ5STgNg53jAsWz60Krd0u3eejB0sGCU=
X-Google-Smtp-Source: AGHT+IEKuvslbgpS+jFT9kCZO9ZHrI6mBjYptsMiCaePE1pyVsHfodMLw3nmAqVy7Bw/fuUlRNZZYUO91WEjIayPMsY=
X-Received: by 2002:a05:6820:548:b0:621:71c3:eab8 with SMTP id
 006d021491bc7-62171c3ecffmr1197889eaf.3.1757101615563; Fri, 05 Sep 2025
 12:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn>
 <20250905132413.1376220-7-zhangzihuan@kylinos.cn>
In-Reply-To: <20250905132413.1376220-7-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 5 Sep 2025 21:46:43 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0izu1_xVe_pGeJiXZqEXLxg_o30NkEjMiwzDgeU4mOGmA@mail.gmail.com>
X-Gm-Features: Ac12FXylOWQRbtZy4tXGis9fcvrx9xAWhEYFwKXiKvA-TbpGOjwSaXBXEfvwt6M
Message-ID: <CAJZ5v0izu1_xVe_pGeJiXZqEXLxg_o30NkEjMiwzDgeU4mOGmA@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] PM: EM: Use scope-based cleanup helper
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

On Fri, Sep 5, 2025 at 3:25=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylinos.cn=
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
>  kernel/power/energy_model.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
> index ea7995a25780..5ec63b3e7d85 100644
> --- a/kernel/power/energy_model.c
> +++ b/kernel/power/energy_model.c
> @@ -451,7 +451,6 @@ static void
>  em_cpufreq_update_efficiencies(struct device *dev, struct em_perf_state =
*table)
>  {
>         struct em_perf_domain *pd =3D dev->em_pd;
> -       struct cpufreq_policy *policy;
>         int found =3D 0;
>         int i, cpu;
>
> @@ -465,7 +464,7 @@ em_cpufreq_update_efficiencies(struct device *dev, st=
ruct em_perf_state *table)
>                 return;
>         }
>
> -       policy =3D cpufreq_cpu_get(cpu);
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpu);
>         if (!policy) {
>                 dev_warn(dev, "EM: Access to CPUFreq policy failed\n");
>                 return;
> @@ -479,8 +478,6 @@ em_cpufreq_update_efficiencies(struct device *dev, st=
ruct em_perf_state *table)
>                         found++;
>         }
>
> -       cpufreq_cpu_put(policy);
> -
>         if (!found)
>                 return;
>

The above changes are fine now and can be a separate patch.

> @@ -787,21 +784,19 @@ static void em_check_capacity_update(void)
>
>         /* Check if CPUs capacity has changed than update EM */
>         for_each_possible_cpu(cpu) {

But I'd prefer the code in this loop to be moved into a separate
function, in a separate patch, before the __free()-based
simplification of it.

> -               struct cpufreq_policy *policy;
>                 struct em_perf_domain *pd;
>                 struct device *dev;
>
>                 if (cpumask_test_cpu(cpu, cpu_done_mask))
>                         continue;
>
> -               policy =3D cpufreq_cpu_get(cpu);
> +               struct cpufreq_policy *policy __free(put_cpufreq_policy) =
=3D cpufreq_cpu_get(cpu);
>                 if (!policy) {
>                         pr_debug("Accessing cpu%d policy failed\n", cpu);
>                         schedule_delayed_work(&em_update_work,
>                                               msecs_to_jiffies(1000));
>                         break;
>                 }
> -               cpufreq_cpu_put(policy);
>
>                 dev =3D get_cpu_device(cpu);
>                 pd =3D em_pd_get(dev);
> --
