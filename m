Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63103B49776
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 19:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF62610E596;
	Mon,  8 Sep 2025 17:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uQ55R3nr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9804310E596;
 Mon,  8 Sep 2025 17:44:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 25DF444A9C;
 Mon,  8 Sep 2025 17:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0365EC4CEF9;
 Mon,  8 Sep 2025 17:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757353454;
 bh=pxv4SKGaeo+/iwpYsHET1lGXi6vy1Me0WnNKi9ZjTC0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uQ55R3nryISj4fR5HBA0VoKRZaL0v3af3ouPwi2RYm+lkfp+cjWrR+LX97PQ39TS1
 clH9A7/msCwa+hxqIXvZap62ixLxWNUKGlyOeLuJV8znNAyQIIIlIRl7QdF9UFedNx
 /zzbC62VRoizSlgV9RXiMFblpCIyIdzz5InicZSgkGQa5gJNSmQ9JPTCCTrMF1450E
 WqwqOE5QYrbszoHVL/c8r7aVLjzlTVX8pWSgdStRA2xntbvfP1x7rQyr+rD6fhFc0o
 J+VT7dY5asCWkyo9eFP04FfqRkHLvlAbHP3e4Euy0HrUB7bOv1NGBWr90PGQZVedzN
 8WpYZnTJv15ew==
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-621706e28faso570728eaf.2; 
 Mon, 08 Sep 2025 10:44:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVMSYKqjp5auoSnwvRNuqi3HxoOAkdGJ4anpe9F5x4o2yKzLox4PQHQyzOe1KjpwD5zqXKoUXh+EVVQ@lists.freedesktop.org,
 AJvYcCVnrZSE1apJteJS1Qc8DhIj58pkFV5nDVROpIMhBACnxTrsDk3RFa3dJgvtMc1SROBI1g247b7XllY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh+Q+r891fUwVk1NEBWxDe85jaZh/9n9iDu5jlXWm5qix5zTqR
 UOhls9yErjqTctISuEgB1l8V5Yp9G0LW2kyxs/ote9gKeTTwwqBVKsh7LrMSa9oksGO1BG67O6n
 F8MWQ908+MUI7/icLk8+YFGqnyX2eImQ=
X-Google-Smtp-Source: AGHT+IEmLNooDlmw6mUZRYEbyTwg6KsbFI0N3/Ra3KC+hBAS5x57Hk+ruqmJHv0ou2jqI/XILrzNZEQVMGT+C7Z3Oeg=
X-Received: by 2002:a05:6808:198f:b0:439:b82f:ce with SMTP id
 5614622812f47-43b29b4d9d1mr3597972b6e.31.1757353453065; Mon, 08 Sep 2025
 10:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn>
 <20250905132413.1376220-3-zhangzihuan@kylinos.cn>
 <CAJZ5v0iTdgM5BBi2ysiJxfA2c=MQ0fjLsEvVct9stxomvEe=4Q@mail.gmail.com>
 <6683fb5a-64f4-433e-a22b-153b01dfa572@kylinos.cn>
In-Reply-To: <6683fb5a-64f4-433e-a22b-153b01dfa572@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 8 Sep 2025 19:44:01 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h9pYXi4Op4zAA+Q7QZz5gkJg+83eKUCqM-YKh76CVLKg@mail.gmail.com>
X-Gm-Features: Ac12FXxUqqlT9sudI62ao99U1pS-dgaUtp-l-yYYj3dQjoUJWeYTt-vc3mF_8T8
Message-ID: <CAJZ5v0h9pYXi4Op4zAA+Q7QZz5gkJg+83eKUCqM-YKh76CVLKg@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] ACPI: processor: thermal: Use scope-based cleanup
 helper
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
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

On Mon, Sep 8, 2025 at 11:16=E2=80=AFAM Zihuan Zhang <zhangzihuan@kylinos.c=
n> wrote:
>
>
> =E5=9C=A8 2025/9/6 04:17, Rafael J. Wysocki =E5=86=99=E9=81=93:
> > On Fri, Sep 5, 2025 at 3:24=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylino=
s.cn> wrote:
> >> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> >> annotation for policy references. This reduces the risk of reference
> >> counting mistakes and aligns the code with the latest kernel style.
> >>
> >> No functional change intended.
> >>
> >> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> >> ---
> >>   drivers/acpi/processor_thermal.c | 52 +++++++++++++++++-------------=
--
> >>   1 file changed, 27 insertions(+), 25 deletions(-)
> >>
> >> diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor=
_thermal.c
> >> index 1219adb11ab9..460713d1414a 100644
> >> --- a/drivers/acpi/processor_thermal.c
> >> +++ b/drivers/acpi/processor_thermal.c
> >> @@ -62,19 +62,14 @@ static int phys_package_first_cpu(int cpu)
> >>          return 0;
> >>   }
> >>
> >> -static int cpu_has_cpufreq(unsigned int cpu)
> >> +static bool cpu_has_cpufreq(unsigned int cpu)
> >>   {
> >> -       struct cpufreq_policy *policy;
> >> -
> >>          if (!acpi_processor_cpufreq_init)
> >>                  return 0;
> >>
> >> -       policy =3D cpufreq_cpu_get(cpu);
> >> -       if (policy) {
> >> -               cpufreq_cpu_put(policy);
> >> -               return 1;
> >> -       }
> >> -       return 0;
> >> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D c=
pufreq_cpu_get(cpu);
> >> +
> >> +       return policy !=3D NULL;
> >>   }
> >>
> >>   static int cpufreq_get_max_state(unsigned int cpu)
> > The changes above are fine and can be sent as a separate patch.
> >
> >> @@ -93,12 +88,31 @@ static int cpufreq_get_cur_state(unsigned int cpu)
> >>          return reduction_step(cpu);
> >>   }
> >>
> >> +static bool cpufreq_update_thermal_limit(unsigned int cpu, struct acp=
i_processor *pr)
> >> +{
> >> +       unsigned long max_freq;
> >> +       int ret;
> >> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D c=
pufreq_cpu_get(cpu);
> >> +
> >> +       if (!policy)
> >> +               return false;
> >> +
> >> +       max_freq =3D (policy->cpuinfo.max_freq *
> >> +               (100 - reduction_step(cpu) * cpufreq_thermal_reduction=
_pctg)) / 100;
> >> +
> >> +       ret =3D freq_qos_update_request(&pr->thermal_req, max_freq);
> >> +       if (ret < 0) {
> >> +               pr_warn("Failed to update thermal freq constraint: CPU=
%d (%d)\n",
> >> +         pr->id, ret);
> >> +       }
> > But this silently fixes a bug in the original code which needs to be
> > documented with a Fixes: tag (and it would be better to fix the bug
> > separately before the using the __free()-based cleanup TBH) and
> > introduces some whitespace breakage.
>
> Thanks!
>
>   I=E2=80=99ll follow your advice and handle the Fixes tag and whitespace=
 issues.

Actually, no need to resend.

The current code is correct as it registers and unregisters the freq
QoS request from cpufreq policy notifiers, so the policy is guaranteed
to be there when cpufreq_set_cur_state() runs.
