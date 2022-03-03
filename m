Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F21344CC809
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 22:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C13F10EDFF;
	Thu,  3 Mar 2022 21:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A5510EDEA;
 Thu,  3 Mar 2022 21:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646342944; x=1677878944;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ckxo5KMFl5D59oj/82MB4tIlU7merfl+4EsTXJtn2dk=;
 b=PAMd/qcQA45B1ldzLbFUwN3oDaltgxzYsLKy2LqWfTts9v07wImMHuGk
 yTnohnqH9hlTU1f8SnP6mejrPHsGfh0O4cUpQF/qPtsW7CkTp1/jAXIIj
 e+DoF2bUHqYkmZs6tqm/OgeHPEYtAb1BiLiyS/eD149nbGQM2gwDK1+kB A=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 03 Mar 2022 13:29:03 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 13:29:03 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 3 Mar 2022 13:29:02 -0800
Received: from [10.110.60.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Thu, 3 Mar 2022
 13:29:02 -0800
Message-ID: <5a66e759-260a-a742-cb71-a523f7711682@quicinc.com>
Date: Thu, 3 Mar 2022 13:29:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 0/4] drm/msm/dpu: clearly document INTF_DP vs INTF_EDP
 difference
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/21/2022 10:22 PM, Dmitry Baryshkov wrote:
> Recent dicussion on the mailing list [1], [2] outlined a need to document
> which intf type is used for DP and which one is used for eDP interfaces.
> 
> This series implements my proposal [3]:
> 
> - Keep INTF_EDP reserved for 8x74/8x84
> - Use INTF_DP for all contemporary DP and eDP ports
> - Documet this in dpu_hw_mdss.h
> - Remove INTF_EDP usage in dpu1 driver.
> 
> Main reasons behind this proposal:
> - It's not always possible to separate eDP and DP. For example INTF_5 on
>    sc7280 is connected to combo eDP/DP PHY.
> - Using INTF_EDP would require us to split too many pieces, ending up
>    with a singnificant amount of code duplication...
> - ... for nothing. From the DPU point of view there is no difference
>    between DP and eDP interfaces as found on current SoC generations.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/0dac8ffa-89a6-d972-bdc1-3f7755c5169d@linaro.org/
> [2]: https://lore.kernel.org/linux-arm-msm/be397e2e-05ab-5c18-8e2d-16c443f0a6d1@quicinc.com/
> [3]: https://lore.kernel.org/linux-arm-msm/e2fab93e-82a6-4837-4ee5-ee1b16caa84d@linaro.org/
> 

I have notified the team about the change and we have discussed the 
potential implications of this with both upstream and downstream drivers 
in mind. Overall, even though some members wanted to retain INTF_eDP for 
clarity, some members were fine removing its usage.

Going with the majority and I have checked all the changes in this series,

Hence:


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

For the entire series.



> Dmitry Baryshkov (4):
>    drm/msm/dpu: document INTF_EDP/INTF_DP difference
>    drm/msm/dpu: drop INTF_TYPE_MAX symbol
>    drm/msm/dpu: drop obsolete INTF_EDP comment
>    drm/msm/dpu: drop INTF_EDP from interface type conditions
> 
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 +-------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  9 ++++++++-
>   3 files changed, 10 insertions(+), 15 deletions(-)
> 
