Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A65F0B390EB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 03:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1EE10E041;
	Thu, 28 Aug 2025 01:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54ABA10E041;
 Thu, 28 Aug 2025 01:18:22 +0000 (UTC)
X-UUID: defba74c83ac11f0b29709d653e92f7d-20250828
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:d59eea18-fcea-466b-bc2a-36f0e350243f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:c6f976e3b311506ba46223fffa6aeed1,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
 -3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: defba74c83ac11f0b29709d653e92f7d-20250828
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
 (envelope-from <zhangzihuan@kylinos.cn>) (Generic MTA)
 with ESMTP id 1952038486; Thu, 28 Aug 2025 09:18:14 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id D2552E008FAE;
 Thu, 28 Aug 2025 09:18:13 +0800 (CST)
X-ns-mid: postfix-68AFAE55-102998148
Received: from [172.25.120.24] (unknown [172.25.120.24])
 by mail.kylinos.cn (NSMail) with ESMTPA id A869CE008FAB;
 Thu, 28 Aug 2025 09:18:00 +0800 (CST)
Message-ID: <874d821e-8ea3-40ac-921b-c19bb380a456@kylinos.cn>
Date: Thu, 28 Aug 2025 09:17:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/18] KVM: x86: Use __free(put_cpufreq_policy) for
 policy reference
To: Sean Christopherson <seanjc@google.com>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
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
 <20250827023202.10310-3-zhangzihuan@kylinos.cn> <aK8Sd30K64mbN1Nt@google.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <aK8Sd30K64mbN1Nt@google.com>
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

Hi,

=E5=9C=A8 2025/8/27 22:13, Sean Christopherson =E5=86=99=E9=81=93:
> On Wed, Aug 27, 2025, Zihuan Zhang wrote:
>> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
>> annotation for policy references. This reduces the risk of reference
>> counting mistakes and aligns the code with the latest kernel style.
>>
>> No functional change intended.
>>
>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>> ---
>>   arch/x86/kvm/x86.c | 10 ++++------
>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>> index a1c49bc681c4..2a825f4ec701 100644
>> --- a/arch/x86/kvm/x86.c
>> +++ b/arch/x86/kvm/x86.c
>> @@ -9492,16 +9492,14 @@ static void kvm_timer_init(void)
>>   		max_tsc_khz =3D tsc_khz;
>>  =20
>>   		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
>> -			struct cpufreq_policy *policy;
>> +			struct cpufreq_policy *policy __free(put_cpufreq_policy);
>>   			int cpu;
>>  =20
>>   			cpu =3D get_cpu();
>>   			policy =3D cpufreq_cpu_get(cpu);
>> -			if (policy) {
>> -				if (policy->cpuinfo.max_freq)
>> -					max_tsc_khz =3D policy->cpuinfo.max_freq;
>> -				cpufreq_cpu_put(policy);
>> -			}
>> +			if (policy && policy->cpuinfo.max_freq)
>> +				max_tsc_khz =3D policy->cpuinfo.max_freq;
>> +
>>   			put_cpu();
> Hmm, this is technically buggy.  __free() won't invoke put_cpufreq_poli=
cy() until
> policy goes out of scope, and so using __free() means the code is effec=
tively:
>
> 		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
> 			struct cpufreq_policy *policy;
> 			int cpu;
>
> 			cpu =3D get_cpu();
> 			policy =3D cpufreq_cpu_get(cpu);
> 			if (policy && policy->cpuinfo.max_freq)
> 				max_tsc_khz =3D policy->cpuinfo.max_freq;
> 			put_cpu();
>
> 			if (policy)
> 				cpufreq_cpu_put(policy);
> 		}
>
> That's "fine" because the policy isn't truly referenced after preemptio=
n is
> disabled, the lifecycle of the policy doesn't rely on preemption being =
disabled,
> and KVM doesn't actually care which CPU is used to get the max frequenc=
y, i.e.
> this would technically be "fine" too:
>
> 		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
> 			struct cpufreq_policy *policy;
> 			int cpu;
>
> 			cpu =3D get_cpu();
> 			policy =3D cpufreq_cpu_get(cpu);
> 			put_cpu();
>
> 			if (policy && policy->cpuinfo.max_freq)
> 				max_tsc_khz =3D policy->cpuinfo.max_freq;
>
> 			if (policy)
> 				cpufreq_cpu_put(policy);
> 		}
>
> But given that the code we have today is perfectly readable, I don't se=
e any
> reason to switch to __free() given that's it's technically flawed.  So =
I'm very
> strongly inclined to skip this patch and keep things as-is.


Yes, this will indeed change the execution order.
Can you accept that? Personally, I don=E2=80=99t think it=E2=80=99s ideal=
 either.

		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
  			int cpu;
			cpu =3D get_cpu();
			{
				struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_=
cpu_get(cpu);
				if (policy && policy->cpuinfo.max_freq)
					max_tsc_khz =3D policy->cpuinfo.max_freq;
			}
			put_cpu();

 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 }

Other places may also have the same issue,

maybe we should consider introducing a macro to handle this properly,
so that initialization and cleanup are well defined without changing
the existing order unexpected.

like this:

#define WITH_CPUFREQ_POLICY(cpu) {\

for(struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D  \
			cpufreq_cpu_get(cpu);			\
			policy;)

Then Use it:

		if (IS_ENABLED(CONFIG_CPU_FREQ)) {
  			int cpu;
			cpu =3D get_cpu();
			WITH_CPUFREQ_POLICY(cpu){
				if (policy->cpuinfo.max_freq)
					max_tsc_khz =3D policy->cpuinfo.max_freq;
			}
			put_cpu();

 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 }

