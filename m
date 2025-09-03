Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1982FB41CB1
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 13:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606FD10E78A;
	Wed,  3 Sep 2025 11:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fqEv+pAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172F410E780;
 Wed,  3 Sep 2025 11:07:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B10AC44C04;
 Wed,  3 Sep 2025 11:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94FCBC4CEF7;
 Wed,  3 Sep 2025 11:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756897661;
 bh=I5jJC5YsqDheZourzIns4HynVHdhk9fmj1JJIPP/qj8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fqEv+pAyAzyDrwpa5ycGv/vldrUVHpTuiDwGvEU2O6hGAiipiQXkldusw4kvuf6Ta
 cyV691K7HV2CSSp8RoFgEXQf84IwuC16kmYKwmqprM4hACuabw/Z49bNoigh1mbEVi
 lfVSk0I2yERql792+nQOshGycv64BeF9PB3eQ5nWjt+fGlrVe/cR9xNBoxCPamJrks
 yVsq4p2oAGuZ5xkOC8mK0WErUxsBMrB2HOYx2elO7r0rSGI9RKr76w6rqsVHTkCBqv
 Yq7iI8uXw1FkSRxTENbSKEf2moleyaF/1d2WgigF4GfkMeRbER5SxoiWsyCxL1V2R/
 ofS+YYpOUUEJQ==
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-74381e207a0so4580578a34.0; 
 Wed, 03 Sep 2025 04:07:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVUWq9bjPfko0q5rymJKHsLu9FfPYp18/pK1r2wbXPJgYXmSyQP3zqpUNQbAvTaJX2CxI/lVXC48fw2@lists.freedesktop.org,
 AJvYcCXmyiHg174CD879TVuUMarEABTZKvzY8p8xN1OQHpbetph0D13k5hzN5isa5kLCapIHo+Ynup7JVgY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPo0Qabpavn/Qn7hGZEJz+0iF8i1E7CRnjFukBtkw40MFco5h+
 pYd8ORzDoIIWnOiU0R9ZnWlmjwxZ3odY7I6ZMjrkijMCjB+7v4QeBhmFW8d/2j5JE6FJN7sGh7t
 /m+2I7vA8qbFyBvQC+aYTQ1UIbztwd5E=
X-Google-Smtp-Source: AGHT+IFm2i7E3heNFR05VvLVwsYMlRgIplk+0JGJpDoA3hxcK7mnkmts5Dorpw2CJryu3vWJY1lQqzZJZSMnb+GSebY=
X-Received: by 2002:a05:6830:2642:b0:745:508c:455c with SMTP id
 46e09a7af769-74569dc34b9mr7242918a34.8.1756897660735; Wed, 03 Sep 2025
 04:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250901085748.36795-1-zhangzihuan@kylinos.cn>
 <20250901085748.36795-3-zhangzihuan@kylinos.cn>
In-Reply-To: <20250901085748.36795-3-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 3 Sep 2025 13:07:27 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jxHQ3fBk_fSwg7QYsePvUyh=FDteyO+8F8oGfUwX2E9A@mail.gmail.com>
X-Gm-Features: Ac12FXxXhqpwDXjodHxvBBGUiHE126LWfl3UmWuK-7WK82DNR_r2zpKQkeauJig
Message-ID: <CAJZ5v0jxHQ3fBk_fSwg7QYsePvUyh=FDteyO+8F8oGfUwX2E9A@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] ACPI: processor: thermal: Use scope-based
 cleanup helper
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
>  drivers/acpi/processor_thermal.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_th=
ermal.c
> index 1219adb11ab9..3c8b57df9619 100644
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
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpu);
>
>         if (!acpi_processor_cpufreq_init)
>                 return 0;
>
> -       policy =3D cpufreq_cpu_get(cpu);
> -       if (policy) {
> -               cpufreq_cpu_put(policy);
> -               return 1;
> -       }
> -       return 0;
> +       return !!policy;
>  }
>
>  static int cpufreq_get_max_state(unsigned int cpu)
> @@ -95,7 +90,6 @@ static int cpufreq_get_cur_state(unsigned int cpu)
>
>  static int cpufreq_set_cur_state(unsigned int cpu, int state)
>  {
> -       struct cpufreq_policy *policy;
>         struct acpi_processor *pr;
>         unsigned long max_freq;
>         int i, ret;
> @@ -111,6 +105,9 @@ static int cpufreq_set_cur_state(unsigned int cpu, in=
t state)
>          * frequency.
>          */
>         for_each_online_cpu(i) {

I would still prefer the code below to be moved to a separate function
that would be called in each step of the for_each_online_cpu() loop.

> +               struct cpufreq_policy *policy __free(put_cpufreq_policy) =
=3D
> +                       cpufreq_cpu_get(i);
> +
>                 if (topology_physical_package_id(i) !=3D
>                     topology_physical_package_id(cpu))
>                         continue;
> @@ -120,15 +117,12 @@ static int cpufreq_set_cur_state(unsigned int cpu, =
int state)
>                 if (unlikely(!freq_qos_request_active(&pr->thermal_req)))
>                         continue;
>
> -               policy =3D cpufreq_cpu_get(i);
>                 if (!policy)
>                         return -EINVAL;
>
>                 max_freq =3D (policy->cpuinfo.max_freq *
>                             (100 - reduction_step(i) * cpufreq_thermal_re=
duction_pctg)) / 100;
>
> -               cpufreq_cpu_put(policy);
> -
>                 ret =3D freq_qos_update_request(&pr->thermal_req, max_fre=
q);
>                 if (ret < 0) {
>                         pr_warn("Failed to update thermal freq constraint=
: CPU%d (%d)\n",
> --
> 2.25.1
>
>
