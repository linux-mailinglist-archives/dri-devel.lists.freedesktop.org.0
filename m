Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 104AF52C935
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 03:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9D210EA89;
	Thu, 19 May 2022 01:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A715B10E23F;
 Thu, 19 May 2022 01:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652923618; x=1684459618;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=djUsSThGWl8Oji0llWp8FRTEvQJkz4qmxWCclOn2LyI=;
 b=hKoUZatZo5ok1dE7enPsKRJc0RvyRJUy43Q2XcBbir+JpmrlM5LY3gws
 Q7kjt4exHZzVYbSEqz6NlAnR+LjYSN50/YqIwIt/i53tSF9Vv42ZKXRAH
 0cP32fB+t8wP2jJvf1eFdoER2/C6ULGATSK5d1D3yjI51i1CjkttHdBfq U=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 18 May 2022 18:26:58 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 18:26:56 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 18 May 2022 18:26:57 -0700
Received: from [10.111.161.138] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 18 May
 2022 18:26:55 -0700
Message-ID: <ef406fb0-f83e-81ef-071c-d92f7c16c1dd@quicinc.com>
Date: Wed, 18 May 2022 18:26:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: handle pm_runtime_get_sync()
 errors in bind path
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <freedreno@lists.freedesktop.org>
References: <20220518223407.26147-1-quic_abhinavk@quicinc.com>
 <CAE-0n53Cffs82nQC3_2QADbvQm0f_7tX+NPac8rvJULYE10GvA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n53Cffs82nQC3_2QADbvQm0f_7tX+NPac8rvJULYE10GvA@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/18/2022 5:40 PM, Stephen Boyd wrote:
> Quoting Abhinav Kumar (2022-05-18 15:34:07)
>> If there are errors while trying to enable the pm in the
>> bind path, it will lead to unclocked access of hw revision
>> register thereby crashing the device.
>>
>> This will not address why the pm_runtime_get_sync() fails
>> but at the very least we should be able to prevent the
>> crash by handling the error and bailing out earlier.
>>
>> changes in v2:
>>          - use pm_runtime_resume_and_get() instead of
>>            pm_runtime_get_sync()
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
> 
> Any Fixes tag? When did pm errors start happening in the bind path?
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

This error got exposed with PANEL_EDP=m and DRM_MSM=y. We were not 
testing this combination previously. This combination causes "clk stuck 
at OFF" from the pm_runtime_get_sync() path which means we shouldnt 
proceed with the next register access since it failed.

We are still debugging the root-cause of why "clk stuck at OFF" error is 
present, this is just resolving the crash.

Fixes : 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
