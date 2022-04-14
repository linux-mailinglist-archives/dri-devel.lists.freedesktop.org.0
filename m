Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6982C501DFF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 00:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CCD10E3CC;
	Thu, 14 Apr 2022 22:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF0B10E3AB;
 Thu, 14 Apr 2022 22:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649973992; x=1681509992;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xVp5TAphqYTgZpbaJdav7ZSflN0pUeu1cQ9O+2F3xb8=;
 b=ObhgheizD7sxrohog/qMBJIQtApS5bhqgEqmYf8quzWWGYpTO3ae8Vbw
 xy/1mJ3Uk0jHz+ipXxe+ZVx1SGzd910ex6n+9HfvhAV3qoC5QZgktQF0A
 8CpE+SWBDjHsaYYCvtIhyLfbmKqIU/bgntLmcv5oi6lbEe1tSuTw2xIe8 s=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 14 Apr 2022 15:06:32 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 15:06:31 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Apr 2022 15:06:30 -0700
Received: from [10.110.19.13] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 14 Apr
 2022 15:06:29 -0700
Message-ID: <2039ef97-4fdb-bffe-1e02-18ae79c18be4@quicinc.com>
Date: Thu, 14 Apr 2022 15:06:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm/msm/dp: enhance both connect and disconnect
 pending_timeout handle
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1649280493-4393-1-git-send-email-quic_khsieh@quicinc.com>
 <625ce8a0-4e25-5513-5599-c1cdebf5a3a5@linaro.org>
 <09fd563f-4a2c-f670-51c2-0e5ff023816d@quicinc.com>
 <CAA8EJpqzucFGf8ndDi2LZqtKiOt_w=_h1oPAUNVCdmUyh_3+zA@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpqzucFGf8ndDi2LZqtKiOt_w=_h1oPAUNVCdmUyh_3+zA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 bjorn.andersson@linaro.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/8/2022 4:59 PM, Dmitry Baryshkov wrote:
> On Fri, 8 Apr 2022 at 23:30, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>
>> On 4/8/2022 5:27 AM, Dmitry Baryshkov wrote:
>>> On 07/04/2022 00:28, Kuogee Hsieh wrote:
>>>> dp_hpd_plug_handle() is responsible for setting up main link and send
>>>> uevent to notify user space framework to start video stream. Similarly,
>>>> dp_hdp_unplug_handle is responsible to send uevent to notify user space
>>>> framework to stop video stream and then tear down main link.
>>>> However there are rare cases, such as in the middle of system
>>>> suspending,
>>>> that uevent could not be delivered to user space framework. Therefore
>>>> some kind of recover mechanism armed by timer need to be in place in the
>>>> case of user space framework does not respond to uevent.
>>> Hmm, how does userpsace 'respond' to the uevent? The driver should
>>> send hotplug notifications to userspace, but it must not expect any
>>> particular reaction. The userspace might be as simple, as fbdev
>>> emulation, but the driver still should function correctly.
>> yes, driver is function correctly by setting up main link. but it does
>> not know which resolution to display.
>>
>> It send hotplug notification through uevent to framework after main link
>> is ready.
>>
>> Framework  is responsible to set up MDP timing engine to start video stream.
>>
>>
>> However it does not know which
> It's of no concern to the driver. It is completely the userspace
> problem. After resuming, it should reread available video output
> properties. The display could have been changed while the system is
> suspended.
>  From your description I still do not understand why you need the
> 'recovery' mechanism.

I mean "recovery" means  dp driver may leave stay at link ready 
mistakenly after dongle unplugged due to missing framework action to 
tear down main link so that next dongle plug in will not work.

Currently it was armed with timeout function and it will fired if 
framework did not call msm_dp_display_disable() after 5 second.

Anyway, we think this approach is not good. therefore it is replaced 
with  below patch.

drm/msm/dp: tear down main link at unplug handle immediately


