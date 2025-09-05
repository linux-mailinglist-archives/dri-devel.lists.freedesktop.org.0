Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0509AB4505F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 09:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB0F10EB36;
	Fri,  5 Sep 2025 07:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5894910EB36;
 Fri,  5 Sep 2025 07:54:33 +0000 (UTC)
X-UUID: 8b7cd9b08a2d11f0b29709d653e92f7d-20250905
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:b8911e54-e0aa-40d7-9e56-019791a9cc88, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:1038342e134dfa48eabc61cf9e37c597,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
 -3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8b7cd9b08a2d11f0b29709d653e92f7d-20250905
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
 (envelope-from <zhangzihuan@kylinos.cn>) (Generic MTA)
 with ESMTP id 1912680162; Fri, 05 Sep 2025 15:54:26 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id 49564E008FA7;
 Fri,  5 Sep 2025 15:54:26 +0800 (CST)
X-ns-mid: postfix-68BA9732-140429547
Received: from [172.25.120.24] (unknown [172.25.120.24])
 by mail.kylinos.cn (NSMail) with ESMTPA id 33213E008FA4;
 Fri,  5 Sep 2025 15:54:22 +0800 (CST)
Message-ID: <2ccca29e-4d5f-44fa-bfc8-d77c659bc9f3@kylinos.cn>
Date: Fri, 5 Sep 2025 15:54:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/10] thermal/drivers/ti-soc-thermal: Use scope-based
 cleanup helper
To: Andreas Kemnade <andreas@kemnade.info>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Alim Akhtar
 <alim.akhtar@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Ben Horgan <ben.horgan@arm.com>, zhenglifeng <zhenglifeng1@huawei.com>,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>, Fabio Estevam
 <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
 linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
 <20250903131733.57637-10-zhangzihuan@kylinos.cn>
 <20250905085726.2bc6fcb4@akair>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <20250905085726.2bc6fcb4@akair>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


=E5=9C=A8 2025/9/5 14:57, Andreas Kemnade =E5=86=99=E9=81=93:
> Am Wed,  3 Sep 2025 21:17:32 +0800
> schrieb Zihuan Zhang <zhangzihuan@kylinos.cn>:
>
>> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
>> annotation for policy references. This reduces the risk of reference
>> counting mistakes and aligns the code with the latest kernel style.
>>
>> No functional change intended.
>>
>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>> ---
>>   drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 13 ++++--------=
-
>>   1 file changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/driv=
ers/thermal/ti-soc-thermal/ti-thermal-common.c
>> index 0cf0826b805a..37d06468913a 100644
>> --- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
>> +++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
>> @@ -27,7 +27,6 @@
>>  =20
>>   /* common data structures */
>>   struct ti_thermal_data {
>> -	struct cpufreq_policy *policy;
>>   	struct thermal_zone_device *ti_thermal;
>>   	struct thermal_zone_device *pcb_tz;
>>   	struct thermal_cooling_device *cool_dev;
>> @@ -218,6 +217,7 @@ int ti_thermal_register_cpu_cooling(struct ti_band=
gap *bgp, int id)
>>   {
>>   	struct ti_thermal_data *data;
>>   	struct device_node *np =3D bgp->dev->of_node;
>> +	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq=
_cpu_get(0);
>>  =20
> this looks as it changes the lifecycle from the device lifetime to just
> this function...


I thought policy was only used in this function, so I moved it here.

Thanks for clarifying the lifecycle issue.

>>   	/*
>>   	 * We are assuming here that if one deploys the zone
>> @@ -234,19 +234,17 @@ int ti_thermal_register_cpu_cooling(struct ti_ba=
ndgap *bgp, int id)
>>   	if (!data)
>>   		return -EINVAL;
>>  =20
>> -	data->policy =3D cpufreq_cpu_get(0);
>> -	if (!data->policy) {
>> +	if (!policy) {
>>   		pr_debug("%s: CPUFreq policy not found\n", __func__);
>>   		return -EPROBE_DEFER;
>>   	}
>>  =20
>>   	/* Register cooling device */
>> -	data->cool_dev =3D cpufreq_cooling_register(data->policy);
>> +	data->cool_dev =3D cpufreq_cooling_register(policy);
> and it is passed on to something living beyond this function. I see no
> _get(policy) in cpufreq_cooling_register().
> Am I missing something?

This indeed causes a problem.

Sure,=C2=A0 I will drop the patchset.

Thanks!

> Regards,
> Andreas
