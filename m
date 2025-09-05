Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283BFB453C3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 11:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8056C10EB70;
	Fri,  5 Sep 2025 09:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B0510EB5B;
 Fri,  5 Sep 2025 09:49:58 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cJBPj4s43z6JBLl;
 Fri,  5 Sep 2025 17:48:57 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 172721402E9;
 Fri,  5 Sep 2025 17:49:56 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 5 Sep
 2025 11:49:54 +0200
Date: Fri, 5 Sep 2025 10:49:52 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
CC: "Rafael J . wysocki" <rafael@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko
 Ursulin <tursulin@ursulin.net>, "David Airlie" <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, Eduardo
 Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, Ben Horgan
 <ben.horgan@arm.com>, zhenglifeng <zhenglifeng1@huawei.com>, Zhang Rui
 <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>, Lukasz Luba
 <lukasz.luba@arm.com>, "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>, Fabio Estevam
 <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>, "Sumit Gupta"
 <sumitg@nvidia.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Sudeep
 Holla <sudeep.holla@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
 <linux-pm@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-omap@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 04/10] cpufreq: powernv: Use scope-based cleanup helper
Message-ID: <20250905104952.00002f58@huawei.com>
In-Reply-To: <20250903131733.57637-5-zhangzihuan@kylinos.cn>
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
 <20250903131733.57637-5-zhangzihuan@kylinos.cn>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
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

On Wed,  3 Sep 2025 21:17:27 +0800
Zihuan Zhang <zhangzihuan@kylinos.cn> wrote:

> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
This one is a little more weak wrt to justification.  Kernel style
isn't to use __free() where there isn't a significant benefit.

Up to maintainer of the driver on this one so I'll not offer
a tag.

> ---
>  drivers/cpufreq/powernv-cpufreq.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
> index 7d9a5f656de8..811fdbf398fa 100644
> --- a/drivers/cpufreq/powernv-cpufreq.c
> +++ b/drivers/cpufreq/powernv-cpufreq.c
> @@ -892,15 +892,15 @@ static int powernv_cpufreq_reboot_notifier(struct notifier_block *nb,
>  				unsigned long action, void *unused)
>  {
>  	int cpu;
> -	struct cpufreq_policy *cpu_policy;
>  
>  	rebooting = true;
>  	for_each_online_cpu(cpu) {
> -		cpu_policy = cpufreq_cpu_get(cpu);
> +		struct cpufreq_policy *cpu_policy __free(put_cpufreq_policy) =
> +			cpufreq_cpu_get(cpu);
> +
>  		if (!cpu_policy)
>  			continue;
>  		powernv_cpufreq_target_index(cpu_policy, get_nominal_index());
> -		cpufreq_cpu_put(cpu_policy);
>  	}
>  
>  	return NOTIFY_DONE;
> @@ -913,7 +913,6 @@ static struct notifier_block powernv_cpufreq_reboot_nb = {
>  static void powernv_cpufreq_work_fn(struct work_struct *work)
>  {
>  	struct chip *chip = container_of(work, struct chip, throttle);
> -	struct cpufreq_policy *policy;
>  	unsigned int cpu;
>  	cpumask_t mask;
>  
> @@ -928,14 +927,14 @@ static void powernv_cpufreq_work_fn(struct work_struct *work)
>  	chip->restore = false;
>  	for_each_cpu(cpu, &mask) {
>  		int index;
> +		struct cpufreq_policy *policy __free(put_cpufreq_policy) =
> +			cpufreq_cpu_get(cpu);
>  
> -		policy = cpufreq_cpu_get(cpu);
>  		if (!policy)
>  			continue;
>  		index = cpufreq_table_find_index_c(policy, policy->cur, false);
>  		powernv_cpufreq_target_index(policy, index);
>  		cpumask_andnot(&mask, &mask, policy->cpus);
> -		cpufreq_cpu_put(policy);
>  	}
>  out:
>  	cpus_read_unlock();

