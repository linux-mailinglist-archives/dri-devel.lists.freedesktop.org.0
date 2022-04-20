Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBF6509407
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 01:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C247510F2D3;
	Wed, 20 Apr 2022 23:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0178F10E52A;
 Wed, 20 Apr 2022 23:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650499056; x=1682035056;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tV9q1FcF378yrdx5+hEGskQjYdOotMDfqbP0qjm2Llo=;
 b=M84PGDrYyxK/MuYM0NmLJ5bJb/aoUcCy6EYpKhkrwG1NxUmv3SsC8gDQ
 fKEXgqksn0gORseeAtRzRDgBTPCbb20Pujsi0DYhdra59K/bBJHPAYjb2
 MTOq+vWiZqUdX2/ArZokot0o1oyNbdCWxngjmkPDnyAxzpGCPZZrObOR3 g=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 20 Apr 2022 16:57:35 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 16:57:34 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Apr 2022 16:57:34 -0700
Received: from [10.110.1.198] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 20 Apr
 2022 16:57:33 -0700
Message-ID: <0b92cab4-d46b-a419-43ad-0fa08c8c0e4d@quicinc.com>
Date: Wed, 20 Apr 2022 16:57:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] drm/msm/dp: enhance both connect and disconnect
 pending_timeout handle
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <1649280493-4393-1-git-send-email-quic_khsieh@quicinc.com>
 <625ce8a0-4e25-5513-5599-c1cdebf5a3a5@linaro.org>
 <09fd563f-4a2c-f670-51c2-0e5ff023816d@quicinc.com>
 <CAA8EJpqzucFGf8ndDi2LZqtKiOt_w=_h1oPAUNVCdmUyh_3+zA@mail.gmail.com>
 <2039ef97-4fdb-bffe-1e02-18ae79c18be4@quicinc.com>
 <27bb2732-b322-75b0-3883-773e6eb4b1b9@linaro.org>
 <02d31565-4ae4-a319-30b0-76a6e4917f6f@quicinc.com>
 <CAE-0n51F+S4a2mQoyWa-TpJcd73hstm2Sh1uO+4T_75UaWQASQ@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n51F+S4a2mQoyWa-TpJcd73hstm2Sh1uO+4T_75UaWQASQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/20/2022 3:58 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-04-15 17:06:48)
>> On 4/14/2022 4:34 PM, Dmitry Baryshkov wrote:
>>> I'm not sure how should the driver react if the client doesn't disable
>>> the output, but then the sink gets reattached?
>> I do not know that either.
>>
>> But it should not happen as long as framework response to uevent.
> In talking with seanpaul@ it sounds like we can update the link status
> to BAD with drm_connector_set_link_status_property() and then put it
> back to GOOD when the link is re-established. This way userspace will
> know it needs to retry the modeset. Does that help here?

To setup connection, dp driver have to enable phy and do link training 
then transfer dp controller to video ready state.

After that, dp driver signal framework to set up frame buffer 
fetching/layer mixer and start timing engine at final step to have video 
stream start transmitting to panel.

Do opposite way to tear down connection since dp driver can not reset dp 
controller and disable phy before timing engine has been stopped. 
Otherwise vsync timeout or buffer underrun/overrun may happen.

this means user space framework need to stop timing engine (stop frame 
buffer fetching/layer mixer) first and then stop video ready state of dp 
controller and then disable phy. (note, there may have something else at 
drm stack need to be teared down but i do not know details)

In this case, since framework is not response to uevent to stop timing 
engine,  dp controller still in video ready state and phy still enabled 
even dongle had been removed already.

At this point, I am not sure what dp driver should do if dongle re 
plugged back in.

Tear down dp mainlink while timing engine is still running and re setup 
dp mainlink?

However, I think this scenario most likely will not happen since if 
framework responses uevent to setup connection earlier it should be 
there to response uevent to tear down connection.





