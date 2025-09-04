Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211BEB434BF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 09:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E97410E236;
	Thu,  4 Sep 2025 07:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBBB10E236;
 Thu,  4 Sep 2025 07:56:24 +0000 (UTC)
X-UUID: a2cd01a4896411f0b29709d653e92f7d-20250904
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:b7ccec76-f4fe-45e8-bab3-dc73c52616ae, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:0d8ddf5d75b8f48b58bb293ff09316f9,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
 -3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a2cd01a4896411f0b29709d653e92f7d-20250904
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
 (envelope-from <zhangzihuan@kylinos.cn>) (Generic MTA)
 with ESMTP id 582611713; Thu, 04 Sep 2025 15:56:16 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id 86A2BE008FA5;
 Thu,  4 Sep 2025 15:56:16 +0800 (CST)
X-ns-mid: postfix-68B94620-384750805
Received: from [172.25.120.24] (unknown [172.25.120.24])
 by mail.kylinos.cn (NSMail) with ESMTPA id 1766FE008FA2;
 Thu,  4 Sep 2025 15:56:08 +0800 (CST)
Message-ID: <861a6077-a7da-4899-b971-a003d6e2290e@kylinos.cn>
Date: Thu, 4 Sep 2025 15:56:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/10] PM: EM: Use scope-based cleanup helper
To: Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
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
 <20250903131733.57637-11-zhangzihuan@kylinos.cn>
 <34b5e01e-2f4a-4d57-93ca-ab4549681b17@kernel.org>
 <CAJZ5v0hisM6vfdNXaY7qCGtcMb1FENGxiBb=E=tkqDbRyjs=bA@mail.gmail.com>
 <037855bf-c878-4794-b145-266a36302fc3@kernel.org>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <037855bf-c878-4794-b145-266a36302fc3@kernel.org>
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


=E5=9C=A8 2025/9/3 21:43, Krzysztof Kozlowski =E5=86=99=E9=81=93:
> On 03/09/2025 15:41, Rafael J. Wysocki wrote:
>>>>   em_cpufreq_update_efficiencies(struct device *dev, struct em_perf_=
state *table)
>>>>   {
>>>>        struct em_perf_domain *pd =3D dev->em_pd;
>>>> -     struct cpufreq_policy *policy;
>>>> +     struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D N=
ULL;
>>> This is not really correct coding style. Please read how to use
>>> cleanup.h expressed in that header. You should have here proper
>>> constructor or this should be moved. Or this should not be __free()..=
.
>> I gather that this is what you mean (quoted verbatim from cleanup.h)
>>
>>   * Given that the "__free(...) =3D NULL" pattern for variables define=
d at
>>   * the top of the function poses this potential interdependency probl=
em
>>   * the recommendation is to always define and assign variables in one
>>   * statement and not group variable definitions at the top of the
>>   * function when __free() is used.
>>
>> and thanks for pointing this out!
>
> ... and the only exception would be if there is no single constructor,
> but multiple (in if() block). That's not the case here, I think.
>
> Best regards,
> Krzysztof


Sorry, I didn=E2=80=99t fully understand this earlier. In v3 I split the
definition and assignment mainly because the CPU value was obtained
later, so I thought I couldn=E2=80=99t initialize it in one go at the top=
 of
the function. Honestly, it was also for =E2=80=9Cprettier=E2=80=9D style.

After looking at the code Rafael just committed, I realized I can
simply define and assign the variable later in one line, without
needing to separate them. I=E2=80=99ll fix this in the next version.

Thanks for pointing it out!


