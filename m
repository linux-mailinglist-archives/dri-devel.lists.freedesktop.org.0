Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 036989EAB91
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 10:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EC310E11F;
	Tue, 10 Dec 2024 09:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="U3ZZiiLr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E9910E11F;
 Tue, 10 Dec 2024 09:13:45 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA87Tt5012016;
 Tue, 10 Dec 2024 09:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 srQZWeMlx+pakwxWjuiOgz/E3BSN2yj3M1WFaurbpwU=; b=U3ZZiiLrX6dXd5P+
 9aJ/Yi4+e1nXDiTcSo+a2EGg900t1bYjGxEVQfnnDMZtxShfIXZSuyJD5jkikHoB
 jE7/TgvV+UOR6mljDK2uW8lhqqDRDmdSAgtTZfO1lTuKKWqIpHE/AkG8TnGchi7Y
 c4B4ap021yLmXEryvW1pNV0QEFi5u7+uyOseABdnfZBmxU/ymCprpXC/HhwU/N4o
 jyp3MBvoolHq2eS5iuTkvndd84IoDoBfViATjL/DpyFL6pNDt3PgIUhsH2o23Vpw
 ZAEWBvIwGmgzxW00rNmfFVQRaRzixMdq9HidwksEOy0bcWtgsV69J671Zn0N9bRU
 gq1VVQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdxxfre7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2024 09:13:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA9Db4e025176
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2024 09:13:37 GMT
Received: from [10.216.3.14] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 01:13:32 -0800
Message-ID: <eb467542-af20-4327-b4ea-c7eba56431ab@quicinc.com>
Date: Tue, 10 Dec 2024 14:43:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
To: Rob Clark <robdclark@gmail.com>, <devicetree@vger.kernel.org>
CC: Pavan Kondeti <quic_pkondeti@quicinc.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Elliot Berman
 <quic_eberman@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <CAF6AEGtKfWOGpd1gMfJ96BjCqwERZzBVmj5GzmjKxw8_vmSrJg@mail.gmail.com>
 <f4813046-5952-4d16-bae6-37303f22ad1a@quicinc.com>
 <CAF6AEGvBU8mB5HHNK4nP5h9ouKfLNhCMFgF+PhrC77ZMfSOTkQ@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAF6AEGvBU8mB5HHNK4nP5h9ouKfLNhCMFgF+PhrC77ZMfSOTkQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: G2x57hF0pEkvWqm6_9ajq9VNxgD2j6Wr
X-Proofpoint-GUID: G2x57hF0pEkvWqm6_9ajq9VNxgD2j6Wr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100068
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

On 12/10/2024 3:26 AM, Rob Clark wrote:
> On Mon, Dec 9, 2024 at 12:52 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>
>> On 12/10/2024 1:24 AM, Rob Clark wrote:
>>> On Mon, Dec 9, 2024 at 12:20 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>
>>>> When kernel is booted in EL2, SECVID registers are accessible to the
>>>> KMD. So we can use that to switch GPU's secure mode to avoid dependency
>>>> on Zap firmware. Also, we can't load a secure firmware without a
>>>> hypervisor that supports it.
>>>
>>> Shouldn't we do this based on whether zap node is in dtb (and not disabled)?
>>
>> This is better, isn't it? Otherwise, multiple overlays should be
>> maintained for each soc/board since EL2 can be toggled from bootloader.
>> And this feature is likely going to be more widely available.
> 
> I guess the first question is what the dt should look like.  I think
> it makes sense to not have a zap node when booting in EL2 (or at least
> disabling it) because that describes the hw+fw situation.  And in any
> case, so far it seems like we often need unrelated changes[1].  But
> maybe others have differing opinions.
> 
> And depending on how much cooperation we get from the bootloader, it
> could be that our hand is forced.  I figured I should at least point
> out how we currently handle this.

At the moment, the bootloader we use on sa8775p doesn't have overlay
support. So I felt we could free GPU from that requirement and get it
enabled independently. At least to get the basic things working *out of
the box*. We have Display, GPU and Guest VM working with no extra changes.

> 
> A further point, I suppose it is in theory possible that a device
> could have no secure playback support, despite booting in EL1?  So
> tying this to EL2 seems a bit contrived.
> 

That is correct. But not sure how widely that configuration would be
used practically. OTOH, Kernel running at EL2 in qcom chipsets is going
to be more wider in usage. This is showing up as a common requirement
for non-handset chipsets, especially IoT. So a special case here in our
driver doesn't seem bad to me. Let software work out of the box, instead
of "disable GPU by default". ;)

-Akhil.

> BR,
> -R
> 
> [1] https://github.com/TravMurav/slbounce/blob/main/dtbo/x1e-el2.dtso
> 
>> -Akhil.
>>
>>>
>>> slbounce applies some dtb overlays to disable the zap node when
>>> booting in EL2 (and make some other changes due to kernel being in
>>> control of the pci smmuv3, or something along those lines).
>>>
>>> BR,
>>> -R
>>>
>>>>
>>>> Tested following configurations on sa8775p chipset (Adreno 663 gpu):
>>>>
>>>> 1. Gunyah (No KVM) - Loads zap shader based on DT
>>>> 2. KVM in VHE - Skips zap shader load and programs SECVID register
>>>> 3. KVM in nVHE - Loads zap shader based on DT
>>>> 4. Kernel in EL2 with CONFIG_KVM=n - Skips zap shader load and
>>>>         programs SECVID register
>>>>
>>>> For (1) and (3) configuration, this patch doesn't have any impact.
>>>> Driver loads secure firmware based on other existing hints.
>>>>
>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>> ---
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 82 +++++++++++++++++++++++------------
>>>>  1 file changed, 54 insertions(+), 28 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> index 019610341df1..9dcaa8472430 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -14,6 +14,10 @@
>>>>  #include <linux/pm_domain.h>
>>>>  #include <linux/soc/qcom/llcc-qcom.h>
>>>>
>>>> +#ifdef CONFIG_ARM64
>>>> +#include <asm/virt.h>
>>>> +#endif
>>>> +
>>>>  #define GPU_PAS_ID 13
>>>>
>>>>  static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
>>>> @@ -998,6 +1002,54 @@ static int a6xx_zap_shader_init(struct msm_gpu *gpu)
>>>>         return ret;
>>>>  }
>>>>
>>>> +static int a6xx_switch_secure_mode(struct msm_gpu *gpu)
>>>> +{
>>>> +       int ret;
>>>> +
>>>> +#ifdef CONFIG_ARM64
>>>> +       /*
>>>> +        * We can access SECVID_TRUST_CNTL register when kernel is booted in EL2 mode. So, use it
>>>> +        * to switch the secure mode to avoid the dependency on zap shader.
>>>> +        */
>>>> +       if (is_kernel_in_hyp_mode())
>>>> +               goto direct_switch;
>>>> +#endif
>>>> +
>>>> +       /*
>>>> +        * Try to load a zap shader into the secure world. If successful
>>>> +        * we can use the CP to switch out of secure mode. If not then we
>>>> +        * have no resource but to try to switch ourselves out manually. If we
>>>> +        * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL register will
>>>> +        * be blocked and a permissions violation will soon follow.
>>>> +        */
>>>> +       ret = a6xx_zap_shader_init(gpu);
>>>> +       if (ret == -ENODEV) {
>>>> +               /*
>>>> +                * This device does not use zap shader (but print a warning
>>>> +                * just in case someone got their dt wrong.. hopefully they
>>>> +                * have a debug UART to realize the error of their ways...
>>>> +                * if you mess this up you are about to crash horribly)
>>>> +                */
>>>> +               dev_warn_once(gpu->dev->dev,
>>>> +                       "Zap shader not enabled - using SECVID_TRUST_CNTL instead\n");
>>>> +               goto direct_switch;
>>>> +       } else if (ret)
>>>> +               return ret;
>>>> +
>>>> +       OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
>>>> +       OUT_RING(gpu->rb[0], 0x00000000);
>>>> +
>>>> +       a6xx_flush(gpu, gpu->rb[0]);
>>>> +       if (!a6xx_idle(gpu, gpu->rb[0]))
>>>> +               return -EINVAL;
>>>> +
>>>> +       return 0;
>>>> +
>>>> +direct_switch:
>>>> +       gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
>>>> +       return 0;
>>>> +}
>>>> +
>>>>  #define A6XX_INT_MASK (A6XX_RBBM_INT_0_MASK_CP_AHB_ERROR | \
>>>>                        A6XX_RBBM_INT_0_MASK_RBBM_ATB_ASYNCFIFO_OVERFLOW | \
>>>>                        A6XX_RBBM_INT_0_MASK_CP_HW_ERROR | \
>>>> @@ -1341,35 +1393,9 @@ static int hw_init(struct msm_gpu *gpu)
>>>>         if (ret)
>>>>                 goto out;
>>>>
>>>> -       /*
>>>> -        * Try to load a zap shader into the secure world. If successful
>>>> -        * we can use the CP to switch out of secure mode. If not then we
>>>> -        * have no resource but to try to switch ourselves out manually. If we
>>>> -        * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL register will
>>>> -        * be blocked and a permissions violation will soon follow.
>>>> -        */
>>>> -       ret = a6xx_zap_shader_init(gpu);
>>>> -       if (!ret) {
>>>> -               OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
>>>> -               OUT_RING(gpu->rb[0], 0x00000000);
>>>> -
>>>> -               a6xx_flush(gpu, gpu->rb[0]);
>>>> -               if (!a6xx_idle(gpu, gpu->rb[0]))
>>>> -                       return -EINVAL;
>>>> -       } else if (ret == -ENODEV) {
>>>> -               /*
>>>> -                * This device does not use zap shader (but print a warning
>>>> -                * just in case someone got their dt wrong.. hopefully they
>>>> -                * have a debug UART to realize the error of their ways...
>>>> -                * if you mess this up you are about to crash horribly)
>>>> -                */
>>>> -               dev_warn_once(gpu->dev->dev,
>>>> -                       "Zap shader not enabled - using SECVID_TRUST_CNTL instead\n");
>>>> -               gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
>>>> -               ret = 0;
>>>> -       } else {
>>>> +       ret = a6xx_switch_secure_mode(gpu);
>>>> +       if (!ret)
>>>>                 return ret;
>>>> -       }
>>>>
>>>>  out:
>>>>         if (adreno_has_gmu_wrapper(adreno_gpu))
>>>>
>>>> ---
>>>> base-commit: f4a867a46862c1743501bbe8c813238456ec8699
>>>> change-id: 20241120-drm-msm-kvm-support-cd6e6744ced6
>>>>
>>>> Best regards,
>>>> --
>>>> Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>>
>>

