Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00611B3B03E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 03:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7F310E07D;
	Fri, 29 Aug 2025 01:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E0010E07D;
 Fri, 29 Aug 2025 01:09:37 +0000 (UTC)
X-UUID: d185feaa847411f0b29709d653e92f7d-20250829
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:1b41a914-a619-485b-bf0b-20ce62405244, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:e92f79993f0338ccf10768968df3fbd8,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
 -3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d185feaa847411f0b29709d653e92f7d-20250829
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
 (envelope-from <zhangzihuan@kylinos.cn>) (Generic MTA)
 with ESMTP id 459095461; Fri, 29 Aug 2025 09:09:31 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id 048F7E008FA4;
 Fri, 29 Aug 2025 09:09:31 +0800 (CST)
X-ns-mid: postfix-68B0FDCA-85694742
Received: from [172.25.120.24] (unknown [172.25.120.24])
 by mail.kylinos.cn (NSMail) with ESMTPA id 37FF9E008FA2;
 Fri, 29 Aug 2025 09:09:19 +0800 (CST)
Message-ID: <6174bcc8-30f5-479b-bac6-f42eb1232b4d@kylinos.cn>
Date: Fri, 29 Aug 2025 09:09:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/18] ACPI: processor: thermal: Use
 __free(put_cpufreq_policy) for policy reference
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Markus Mayer
 <mmayer@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 zhenglifeng <zhenglifeng1@huawei.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>, Fabio Estevam
 <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Yicong Yang <yangyicong@hisilicon.com>,
 linux-pm@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-4-zhangzihuan@kylinos.cn>
 <CAJZ5v0jA7HjNc6VQWdjuwLnmd751kV01NXC4v8Pyn8h-r70BzQ@mail.gmail.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <CAJZ5v0jA7HjNc6VQWdjuwLnmd751kV01NXC4v8Pyn8h-r70BzQ@mail.gmail.com>
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


=E5=9C=A8 2025/8/28 17:40, Rafael J. Wysocki =E5=86=99=E9=81=93:
> On Wed, Aug 27, 2025 at 4:33=E2=80=AFAM Zihuan Zhang <zhangzihuan@kylin=
os.cn> wrote:
>> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
>> annotation for policy references. This reduces the risk of reference
>> counting mistakes and aligns the code with the latest kernel style.
>>
>> No functional change intended.
>>
>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>> ---
>>   drivers/acpi/processor_thermal.c | 12 +++---------
>>   1 file changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor=
_thermal.c
>> index 1219adb11ab9..f99ed0812934 100644
>> --- a/drivers/acpi/processor_thermal.c
>> +++ b/drivers/acpi/processor_thermal.c
>> @@ -64,17 +64,13 @@ static int phys_package_first_cpu(int cpu)
>>
>>   static int cpu_has_cpufreq(unsigned int cpu)
>>   {
>> -       struct cpufreq_policy *policy;
>> +       struct cpufreq_policy *policy __free(put_cpufreq_policy);
>>
>>          if (!acpi_processor_cpufreq_init)
>>                  return 0;
>>
>>          policy =3D cpufreq_cpu_get(cpu);
>> -       if (policy) {
>> -               cpufreq_cpu_put(policy);
>> -               return 1;
>> -       }
>> -       return 0;
>> +       return !!policy;
> If you want to make this change, please also change the return type of
> the function to bool.
Thanks for pointing this out.
>>   }
>>
>>   static int cpufreq_get_max_state(unsigned int cpu)
>> @@ -95,7 +91,7 @@ static int cpufreq_get_cur_state(unsigned int cpu)
>>
>>   static int cpufreq_set_cur_state(unsigned int cpu, int state)
>>   {
>> -       struct cpufreq_policy *policy;
>> +       struct cpufreq_policy *policy __free(put_cpufreq_policy);
> This isn't correct AFAICS at least formally because the scope of the
> variable is the whole function, so it won't get out of scope at the
> point where you want cpufreq_cpu_put() to be called.
>
> The policy variable should be defined in the block following the "for"
> loop (and actually all of the local variables except for "i" can be
> defined there).


Sorry for the mistake =E2=80=94 I did this correctly in other places, but=
 forgot=20
here.

> Or better still, please move that block to a separate function
> containing all of the requisite local variable definitions and call
> that function for each online CPU.


 =C2=A0In fact, I have realized that we cannot always use __free for clea=
nup=20
directly.

The issue is that the release only happens at the end of the variable=E2=80=
=99s=20
lifetime, while in some cases we want to drop the reference immediately=20
after use.

To address this, I=E2=80=99m considering introducing a helper macro in=20
include/linux/cpufreq.h that would make this more explicit and allow=20
safe cleanup at the right point.


Before moving forward, I=E2=80=99d like to hear your opinion on this appr=
oach:

#define WITH_CPUFREQ_POLICY(cpu) \
for(struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D \
     cpufreq_cpu_get(cpu);;)


Then we can use it for all code :

	WITH_CPUFREQ_POLICY(cpu) {
			if(!policy)
				return XXX; // error handing
		=09
			//code use policy here
		} // equal origin 'cpufreq_cpu_put' here
         ;;
        //left code

>>          struct acpi_processor *pr;
>>          unsigned long max_freq;
>>          int i, ret;
>> @@ -127,8 +123,6 @@ static int cpufreq_set_cur_state(unsigned int cpu,=
 int state)
>>                  max_freq =3D (policy->cpuinfo.max_freq *
>>                              (100 - reduction_step(i) * cpufreq_therma=
l_reduction_pctg)) / 100;
>>
>> -               cpufreq_cpu_put(policy);
>> -
>>                  ret =3D freq_qos_update_request(&pr->thermal_req, max=
_freq);
>>                  if (ret < 0) {
>>                          pr_warn("Failed to update thermal freq constr=
aint: CPU%d (%d)\n",
>> --
