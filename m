Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF975168EF
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 01:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C74B10E24D;
	Sun,  1 May 2022 23:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2C210E257;
 Sun,  1 May 2022 23:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651449412; x=1682985412;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HsQ9ozjTEOp0Sbt1jO6CpZWsITv3bwEoubzQaHBRrxo=;
 b=gwK4HiSpoHIsby3ityLiUh0icEysjD3E/1mymh+6VCt3NgN3ndkEFIO1
 AWrdGWOd5iE5Askpz+to9pw3gj9DqJy7qKPV392kkUx3eXOxO3sMiHq0H
 +PQQxvVt5QWDqbaRcKDTEs+AmApwLc+gMvKS2dfkLzdnxvWo5rth7DwaC 8=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 01 May 2022 16:56:51 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2022 16:56:50 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 1 May 2022 16:56:50 -0700
Received: from [10.38.245.205] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 1 May 2022
 16:56:47 -0700
Message-ID: <d6a78564-745c-7301-1b57-efc35757fbfd@quicinc.com>
Date: Sun, 1 May 2022 16:56:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: use RMW cycles in
 dsi_update_dsc_timing
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
 <20220430185807.yn2j2coyc77qzx2o@SoMainline.org>
 <b4a3bfed-a842-b4ee-d9a5-5adf5b59c09b@quicinc.com>
 <20220501200635.ekl3fw47dv2zytt3@SoMainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220501200635.ekl3fw47dv2zytt3@SoMainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
Cc: Sean Paul <sean@poorly.run>, kernel test robot <lkp@intel.com>, David
 Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/1/2022 1:06 PM, Marijn Suijten wrote:
> On 2022-04-30 12:25:57, Abhinav Kumar wrote:
>>
>>
>> On 4/30/2022 11:58 AM, Marijn Suijten wrote:
>>> On 2022-04-30 20:55:33, Dmitry Baryshkov wrote:
>>>> The downstream uses read-modify-write for updating command mode
>>>> compression registers. Let's follow this approach. This also fixes the
>>>> following warning:
>>>>
>>>> drivers/gpu/drm/msm/dsi/dsi_host.c:918:23: warning: variable 'reg_ctrl' set but not used [-Wunused-but-set-variable]
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> I pointed this out in review multiple times, so you'll obviously get my:
>>>
>>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>
>>> (But are you sure there's nothing else to clear in the 1st CTRL
>>> register, only the lowest 16 bits?  That should mean `reg` never
>>> contains anything in 0xffff0000)
>>
>> The top 16 bits contain information for stream 1.
>>
>> Stream 1 is unused. And whatever is the reset value we should retain that.
>>
>> So this patch is correct.
> 
> I was not debating the correctness of this patch, quite the contrary:
> it's already much better than it was before.
> 
> I'm simply asking whether we should prevent `reg` (not `reg_ctrl`!)
> from having anything in the top 16 bits, which would overwrite the reset
> value for stream 1 which you correctly say should be retained as it is.
> It seems unlikely that this happens, but better be safe than sorry?

Wouln't this macro already make sure that 'reg' doesnt have anything in 
the top 16 bits? Its doing a & with 0x00003f00

#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__MASK 
0x00003f00
#define DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__SHIFT   8
static inline uint32_t 
DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(uint32_t val)
{
     return ((val) << 
DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__SHIFT) & 
DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__MASK;
}

Did you have anything else in mind? If so, please suggest.

> 
> Looking at the DSI register definition for DSC [1] again, I wonder if
> there's support for defining a common bitfield layout and reusing it
> thrice: the two channels for CMD mode and a single use for VIDEO.  Don't
> think that'd make the kernel code better though if even possible at all.
> 

We can have a common bitfield layout for the two channels for command mode.

So we can do something like below for common fields:

-static inline uint32_t 
DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(uint32_t val)
+static inline uint32_t 
DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM_DATATYPE(uint32_t val, uint32_t 
stream_id)
  {
-       return ((val) << 
DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__SHIFT) & 
DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__MASK;
+       return ((val) << 
(DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__SHIFT + (stream_id 
* 16)) & DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE__MASK;
  }

Video mode can also use all of these except for WC as that field is not 
present for cmd modes.

This can go as a separate change .

I can push this and perhaps get a Tested-by from Vinod as I dont have a 
setup to re-validate this.

Thanks

Abhinav
> [1]: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14967/diffs
> 
> - Marijn
> 
>>>
>>> However, this seems to indicate that the DSC patch series has been
>>> approved and merged somehow??
>>>
>>>> ---
>>>>
>>>> Changes since v1:
>>>>    - Fix c&p error and apply mask clear to reg_ctrl2 instead of reg_ctrl
>>>>      (Abhinav)
>>>>
>>>> ---
>>>>    drivers/gpu/drm/msm/dsi/dsi_host.c | 5 ++++-
>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> index c983698d1384..a95d5df52653 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> @@ -961,10 +961,13 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>>>>    		reg_ctrl = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
>>>>    		reg_ctrl2 = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
>>>>    
>>>> +		reg_ctrl &= ~0xffff;
>>>>    		reg_ctrl |= reg;
>>>> +
>>>> +		reg_ctrl2 &= ~DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__MASK;
>>>>    		reg_ctrl2 |= DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH(bytes_in_slice);
>>>>    
>>>> -		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);
>>>> +		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
>>>>    		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
>>>>    	} else {
>>>>    		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
>>>> -- 
>>>> 2.35.1
>>>>
