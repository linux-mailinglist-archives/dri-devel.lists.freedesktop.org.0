Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F99B355E9
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 09:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DE710E5E6;
	Tue, 26 Aug 2025 07:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8750A10E036;
 Tue, 26 Aug 2025 00:32:47 +0000 (UTC)
X-UUID: 2d68e01a821411f0b29709d653e92f7d-20250826
X-CID-CACHE: Type:Local,Time:202508260830+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:7270a5f9-40e3-4977-a28e-c6ba5a72d0d7, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:73c0f838f0cb681a0e66fa356d1f9674,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
 -3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2d68e01a821411f0b29709d653e92f7d-20250826
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
 (envelope-from <zhangzihuan@kylinos.cn>) (Generic MTA)
 with ESMTP id 1699495493; Tue, 26 Aug 2025 08:32:42 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id DEE60E008FA2;
 Tue, 26 Aug 2025 08:32:40 +0800 (CST)
X-ns-mid: postfix-68AD00A8-3459444
Received: from [172.25.120.24] (unknown [172.25.120.24])
 by mail.kylinos.cn (NSMail) with ESMTPA id 3F6F9E008FA2;
 Tue, 26 Aug 2025 08:32:33 +0800 (CST)
Message-ID: <e91bec22-3e7a-4092-b44b-6a8946e6dea4@kylinos.cn>
Date: Tue, 26 Aug 2025 08:32:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] cpufreq: use __free() for all cpufreq_cpu_get()
 references
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
References: <20250825092833.42441-1-zhangzihuan@kylinos.cn>
 <CAJZ5v0g7rJn=z5p4DuJJoPpZrR5ismYftpDWp5X=z74DqaGYBQ@mail.gmail.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <CAJZ5v0g7rJn=z5p4DuJJoPpZrR5ismYftpDWp5X=z74DqaGYBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 26 Aug 2025 07:42:42 +0000
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


=E5=9C=A8 2025/8/25 22:13, Rafael J. Wysocki =E5=86=99=E9=81=93:
> On Mon, Aug 25, 2025 at 11:29=E2=80=AFAM Zihuan Zhang <zhangzihuan@kyli=
nos.cn> wrote:
>> This patch replaces all remaining uses of cpufreq_cpu_get() with
>> the __free(cpufreq_cpu_put) annotation.
>>
>> Motivation:
>> - Ensures automatic cleanup of policy references when they go out of s=
cope,
>>    reducing the risk of forgetting to call cpufreq_cpu_put() on early =
return
>>    or error paths.
>> - Brings the code in line with the latest kernel coding style and best
>>    practices for managing reference-counted objects.
>> - No functional changes are introduced; behavior remains the same,
>>    but reference counting is now safer and easier to maintain.
>>
>> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
>> ---
>>   arch/arm64/kernel/topology.c                  |  9 +++----
>>   arch/x86/kvm/x86.c                            | 10 ++++----
>>   drivers/acpi/processor_thermal.c              | 13 ++++------
>>   drivers/cpufreq/brcmstb-avs-cpufreq.c         |  4 +---
>>   drivers/cpufreq/cppc_cpufreq.c                |  4 +---
>>   drivers/cpufreq/intel_pstate.c                |  3 +--
>>   drivers/cpufreq/longhaul.c                    |  3 +--
>>   drivers/cpufreq/mediatek-cpufreq.c            |  6 ++---
>>   drivers/cpufreq/powernv-cpufreq.c             |  6 ++---
>>   drivers/cpufreq/s5pv210-cpufreq.c             |  3 +--
>>   drivers/cpufreq/tegra186-cpufreq.c            |  3 +--
>>   drivers/devfreq/governor_passive.c            | 19 ++++-----------
>>   drivers/gpu/drm/i915/gt/intel_llc.c           |  3 +--
>>   drivers/macintosh/windfarm_cpufreq_clamp.c    |  4 +---
>>   drivers/powercap/dtpm_cpu.c                   | 24 ++++++-----------=
--
>>   drivers/thermal/imx_thermal.c                 |  7 ++----
>>   .../ti-soc-thermal/ti-thermal-common.c        |  5 +---
>>   kernel/power/energy_model.c                   |  7 ++----
>>   18 files changed, 40 insertions(+), 93 deletions(-)
> This changes different pieces of code maintained by different people
> and the changes are not interdependent AFAICS, so better send it as a
> series of separate patches.
>
> Thanks!

Thanks for the suggestion.

I agree, splitting it into a series will make the review much clearer.

