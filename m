Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66F642FC4E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 21:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EDC89D39;
	Fri, 15 Oct 2021 19:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 365 seconds by postgrey-1.36 at gabe;
 Fri, 15 Oct 2021 19:40:27 UTC
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAEB89D39
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 19:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1634326827; x=1665862827;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=G3CergfSL80+EprYcKGxfPUrJsbcAnhbDOz2wsIr4UA=;
 b=kRVSRXV4NWKFsQH09SKnkl//Likx+4lj+HBBotm+GGAl2MTTXa4TbIPF
 Z5MaTZJfdet90FBpqxSP82jER9GHq7AQrLWzuss2jwm/AoeaU8FBmt6vY
 ny/onrqGI+8WCbM4xvG0FkVfBIGLlQOGEFcQ8Sy+ZY1J1yhAGcEIpP5qW g=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Oct 2021 12:34:22 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 12:34:21 -0700
Received: from [10.110.46.218] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Fri, 15 Oct 2021
 12:34:21 -0700
Message-ID: <1f3f3047-327e-15dd-3179-d012edfc1865@quicinc.com>
Date: Fri, 15 Oct 2021 12:34:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0
Subject: Re: [bug report] drm/msm: dsi: Handle dual-channel for 6G as well
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jessica Zhang
 <jesszhan@codeaurora.org>
CC: Dan Carpenter <dan.carpenter@oracle.com>, Sean Paul
 <seanpaul@chromium.org>, "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <linux-arm-msm@vger.kernel.org>, "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <dri-devel@lists.freedesktop.org>
References: <20211001123115.GE2283@kili>
 <144b8ba5-82db-fc90-1d0f-5a8e2ce45c90@codeaurora.org>
 <CAA8EJpoDfWRT48J=G5-VQcHC6Zg8D-0VujjnjQyvHD0PQ=SoKQ@mail.gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAA8EJpoDfWRT48J=G5-VQcHC6Zg8D-0VujjnjQyvHD0PQ=SoKQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
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

Hey Dmitry,

On 10/15/2021 11:24 AM, Dmitry Baryshkov wrote:
> On Fri, 15 Oct 2021 at 04:43, Jessica Zhang <jesszhan@codeaurora.org> wrote:
>> Hey Dan,
>>
>> On 10/1/2021 5:31 AM, Dan Carpenter wrote:
>>> Hello Sean Paul,
>>>
>>> The patch a6bcddbc2ee1: "drm/msm: dsi: Handle dual-channel for 6G as
>>> well" from Jul 25, 2018, leads to the following
>>> Smatch static checker warning:
>>>
>>>        drivers/gpu/drm/msm/dsi/dsi_host.c:729 dsi_calc_clk_rate_6g()
>>>        warn: wrong type for 'msm_host->esc_clk_rate' (should be 'ulong')
>>>
>>> drivers/gpu/drm/msm/dsi/dsi_host.c
>>>       721 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>       722 {
>>>       723         if (!msm_host->mode) {
>>>       724                 pr_err("%s: mode not set\n", __func__);
>>>       725                 return -EINVAL;
>>>       726         }
>>>       727
>>>       728         dsi_calc_pclk(msm_host, is_bonded_dsi);
>>> --> 729         msm_host->esc_clk_rate = clk_get_rate(msm_host->esc_clk);
>>>                   ^^^^^^^^^^^^^^^^^^^^^^
>>> I don't know why Smatch is suddenly warning about ancient msm code, but
>>> clock rates should be unsigned long.  (I don't remember why).
>>>
>>>       730         return 0;
>>>       731 }
>> I'm unable to recreate the warning with Smatch. After running
>> build_kernel_data.sh, I ran `<path to smatch>/smatch_scripts/kchecker
>> drivers/gpu/drm/msm/dsi/dsi_host.c` and got the following output:
>>
>> CHECK scripts/mod/empty.c
>> CALL scripts/checksyscalls.sh
>> CALL scripts/atomic/check-atomics.sh
>> CHECK arch/arm64/kernel/vdso/vgettimeofday.c
>> CC drivers/gpu/drm/msm/dsi/dsi_host.o
>> CHECK drivers/gpu/drm/msm/dsi/dsi_host.c
>> drivers/gpu/drm/msm/dsi/dsi_host.c:2380 msm_dsi_host_power_on() warn:
>> missing error code 'ret'
>>
>> Is there a specific .config you're using (that's not the default
>> mainline defconfig)? If so, can you please share it?
> Are you running your checks with ARM32 or ARM64 in mind?
> Note, esc_clk_rate is u32, while clk_get_rate()'s returns unsigned long.
> It would make sense to change all three clocks rates in msm_dsi_host
> struct (and several places where they are used) to unsigned long.

Thanks for the response. I'm aware of what's causing this issue and how 
to fix it, but I want to also be able to recreate the warning locally 
with Smatch.

Thanks,

Jessica Zhang

>> Thanks,
>>
>> Jessica Zhang
>>
>>> regards,
>>> dan carpenter
>
>
