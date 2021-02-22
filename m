Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB393321BC8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 16:46:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0D36E546;
	Mon, 22 Feb 2021 15:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z11.mailgun.us (z11.mailgun.us [104.130.96.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992D56E546
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 15:45:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614008756; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=asa9kp6uP1fJ1Sa9rpHMwvSsBmLN0SjGdb4bzNCCcf0=;
 b=VnMuLMItA0LzT0BUodeMg0+kDXCfbHfDlKj8OKlk5dAfxIbhl8wogwvouKrkDFFssh6HOYy2
 yel/tA0rvpioN8+BqkgIhUEDLT4246DoqujMN+A/YeWgqh+/RfImpx2vqwXCyoiCuE4Hhoc3
 tnUmum/bquh+1R1OGfFTIMwUJ88=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6033d1ac994664385908dc6d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Feb 2021 15:45:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 49702C43462; Mon, 22 Feb 2021 15:45:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.105] (unknown [117.217.233.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 77F5DC433CA;
 Mon, 22 Feb 2021 15:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 77F5DC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH] drm/msm/a6xx: fix for kernels without CONFIG_NVMEM
To: Rob Clark <robdclark@gmail.com>
References: <20210216200909.19039-1-jonathan@marek.ca>
 <CAF6AEGv53nnzqMgTfSA6t2YpHx1dDW8UqnH9Gw0w3p8bf0mTLw@mail.gmail.com>
 <775436ba-c94a-ab22-d65b-b2391047ec65@codeaurora.org>
 <20210217190820.GA2229@jcrouse1-lnx.qualcomm.com>
 <CAF6AEGsHws23ozeJ8G23LFQ8J=CVVrx5xvkSgBuE_uSwT4YurQ@mail.gmail.com>
 <74d1277e-295f-0996-91c3-05cfce8d3a0e@marek.ca>
 <e4b62857-bd4d-cca6-0d6b-b9cc960b52a2@codeaurora.org>
 <CAF6AEGsWCrkOgMVxnx53k8b_o7xy3KWv9VaNRoY44+4GfXtWdg@mail.gmail.com>
 <757b557a-b5f6-6018-caa4-34bffb1b60b7@codeaurora.org>
 <CAF6AEGv-A5=4z7ZO-SytmivZTfKPYxhAjmRLVsQnrT7_pYCDtQ@mail.gmail.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <0f057c99-ec94-f3e3-796f-b73a609f735d@codeaurora.org>
Date: Mon, 22 Feb 2021 21:15:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAF6AEGv-A5=4z7ZO-SytmivZTfKPYxhAjmRLVsQnrT7_pYCDtQ@mail.gmail.com>
Content-Language: en-US
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/19/2021 9:30 PM, Rob Clark wrote:
> On Fri, Feb 19, 2021 at 2:44 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>>
>> On 2/18/2021 9:41 PM, Rob Clark wrote:
>>> On Thu, Feb 18, 2021 at 4:28 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>>>>
>>>> On 2/18/2021 2:05 AM, Jonathan Marek wrote:
>>>>> On 2/17/21 3:18 PM, Rob Clark wrote:
>>>>>> On Wed, Feb 17, 2021 at 11:08 AM Jordan Crouse
>>>>>> <jcrouse@codeaurora.org> wrote:
>>>>>>>
>>>>>>> On Wed, Feb 17, 2021 at 07:14:16PM +0530, Akhil P Oommen wrote:
>>>>>>>> On 2/17/2021 8:36 AM, Rob Clark wrote:
>>>>>>>>> On Tue, Feb 16, 2021 at 12:10 PM Jonathan Marek <jonathan@marek.ca>
>>>>>>>>> wrote:
>>>>>>>>>>
>>>>>>>>>> Ignore nvmem_cell_get() EOPNOTSUPP error in the same way as a
>>>>>>>>>> ENOENT error,
>>>>>>>>>> to fix the case where the kernel was compiled without CONFIG_NVMEM.
>>>>>>>>>>
>>>>>>>>>> Fixes: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
>>>>>>>>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>>>>>>>>>> ---
>>>>>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
>>>>>>>>>>     1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>>> b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>>> index ba8e9d3cf0fe..7fe5d97606aa 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>>> @@ -1356,10 +1356,10 @@ static int a6xx_set_supported_hw(struct
>>>>>>>>>> device *dev, struct a6xx_gpu *a6xx_gpu,
>>>>>>>>>>
>>>>>>>>>>            cell = nvmem_cell_get(dev, "speed_bin");
>>>>>>>>>>            /*
>>>>>>>>>> -        * -ENOENT means that the platform doesn't support
>>>>>>>>>> speedbin which is
>>>>>>>>>> -        * fine
>>>>>>>>>> +        * -ENOENT means no speed bin in device tree,
>>>>>>>>>> +        * -EOPNOTSUPP means kernel was built without CONFIG_NVMEM
>>>>>>>>>
>>>>>>>>> very minor nit, it would be nice to at least preserve the gist of the
>>>>>>>>> "which is fine" (ie. some variation of "this is an optional thing and
>>>>>>>>> things won't catch fire without it" ;-))
>>>>>>>>>
>>>>>>>>> (which is, I believe, is true, hopefully Akhil could confirm.. if not
>>>>>>>>> we should have a harder dependency on CONFIG_NVMEM..)
>>>>>>>> IIRC, if the gpu opp table in the DT uses the 'opp-supported-hw'
>>>>>>>> property,
>>>>>>>> we will see some error during boot up if we don't call
>>>>>>>> dev_pm_opp_set_supported_hw(). So calling "nvmem_cell_get(dev,
>>>>>>>> "speed_bin")"
>>>>>>>> is a way to test this.
>>>>>>>>
>>>>>>>> If there is no other harm, we can put a hard dependency on
>>>>>>>> CONFIG_NVMEM.
>>>>>>>
>>>>>>> I'm not sure if we want to go this far given the squishiness about
>>>>>>> module
>>>>>>> dependencies. As far as I know we are the only driver that uses this
>>>>>>> seriously
>>>>>>> on QCOM SoCs and this is only needed for certain targets. I don't
>>>>>>> know if we
>>>>>>> want to force every target to build NVMEM and QFPROM on our behalf.
>>>>>>> But maybe
>>>>>>> I'm just saying that because Kconfig dependencies tend to break my
>>>>>>> brain (and
>>>>>>> then Arnd has to send a patch to fix it).
>>>>>>>
>>>>>>
>>>>>> Hmm, good point.. looks like CONFIG_NVMEM itself doesn't have any
>>>>>> other dependencies, so I suppose it wouldn't be the end of the world
>>>>>> to select that.. but I guess we don't want to require QFPROM
>>>>>>
>>>>>> I guess at the end of the day, what is the failure mode if you have a
>>>>>> speed-bin device, but your kernel config misses QFPROM (and possibly
>>>>>> NVMEM)?  If the result is just not having the highest clk rate(s)
>>>>
>>>> Atleast on sc7180's gpu, using an unsupported FMAX breaks gmu. It won't
>>>> be very obvious what went wrong when this happens!
>>>
>>> Ugg, ok..
>>>
>>> I suppose we could select NVMEM, but not QFPROM, and then the case
>>> where QFPROM is not enabled on platforms that have the speed-bin field
>>> in DT will fail gracefully and all other platforms would continue on
>>> happily?
>>>
>>> BR,
>>> -R
>>
>> Sounds good to me.
>>
> 
> You probably should do a quick test with NVMEM enabled but QFPROM
> disabled to confirm my theory, but I *think* that should work
> 
> BR,
> -R
> 

I tried it on an sc7180 device. The suggested combo (CONFIG_NVMEM + no 
CONFIG_QCOM_QFPROM) makes the gpu probe fail with error "failed to read 
speed-bin. Some OPPs may not be supported by hardware". This is good 
enough clue for the developer that he should fix the broken speedbin 
detection.

-Akhil.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
