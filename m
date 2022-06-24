Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FF155A4D9
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 01:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66FD10E3D2;
	Fri, 24 Jun 2022 23:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F403E10EAC1;
 Fri, 24 Jun 2022 23:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656113463; x=1687649463;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=t6N1OFmumKaMBQGcfxIzZ6KTThBwsauO4zIl/cRMsMs=;
 b=Tw1XTddRITqcZ7etuOXvyYcVmBadi+sE+vuQxm6Dx0jry+w5H4uSwiKo
 LpaIeYqMoD77SCdDGOsmJ5bqaBfsorpRcB7itWbB3rEqZBUaqA/B9JuiV
 2VOjKYcO3FIo+o0WGaLkV7yfBe8/kfdJJgBtrV+ahRyx51cPH1eCg/rjd o=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Jun 2022 16:31:02 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 16:31:01 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 24 Jun 2022 16:31:01 -0700
Received: from [10.110.58.84] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 24 Jun
 2022 16:30:59 -0700
Message-ID: <0ff3d6a3-dc5c-7c77-f8a1-6c4f6c1a3215@quicinc.com>
Date: Fri, 24 Jun 2022 16:30:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of dp
 controller_id at scxxxx_dp_cfg table
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dianders@chromium.org>, <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>, <sean@poorly.run>,
 <vkoul@kernel.org>
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52RW+UFJ=hqMWjwR8qvEbww7QjzPW1nhL3Atd97QXAnYw@mail.gmail.com>
 <007ea4c9-9701-f4ab-3278-5d36bf2018c4@quicinc.com>
 <CAE-0n53kNCK0ajHfY2WQr5HEQZtZSBLnhfbTuZwaUNEOZhsKPg@mail.gmail.com>
 <fa7f8bf1-33cd-5515-0143-6596df2bd740@quicinc.com>
 <CAE-0n51g-EVsC-i9=sJV-ySa8VnE+yT7cg=b-TNMi9+3uBiOVA@mail.gmail.com>
 <326912ff-9771-0711-366d-79acd436908b@quicinc.com>
 <CAE-0n51qrdrFtSr0vRwgYkMgSZfnzQuinaUROQsp30QoDchWQA@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n51qrdrFtSr0vRwgYkMgSZfnzQuinaUROQsp30QoDchWQA@mail.gmail.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/24/2022 4:12 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-06-24 15:53:45)
>> MSM_DP_CONTROLLER_1 need to match to the index = 1 of sc7280_dp_cfg[] <== This is correct
>>
>> The problem is sc7280_dp_cfg[] have two entries since eDP place at index
>> of MSM_DP_CONTROLLER_1.
>>
>> but .num_desc = 1  <== this said only have one entry at sc7280_dp_cfg[]
>> table. Therefore eDP will never be found at for loop  at
>> _dpu_kms_initialize_displayport().
>>
> Yes, but what else does the MSM_DP_CONTROLLER_1 need to match? Because
> the intention of the previous commit was to make it so the order of
> sc7280_dp_cfg couldn't be messed up and not match the
> MSM_DP_CONTROLLER_1 value that lives in sc7280_intf[].


at  _dpu_kms_initialize_displayport()

> -		info.h_tile_instance[0] = i; <== assign i to become dp controller id, "i" is index of scxxxx_dp_cfg[]

This what I mean MSM_DP_CONTROLLER_1 need to match to index = 1 of 
scxxxx_dp_cfg[].

it it is not match, then MSM_DP_CONTROLLER_1 with match to different INTF.


>
>> Sorry, my mistake. it is not in drm_bridge_add.
>>
>> It should be in dpu_encoder_init() of _dpu_kms_initialize_displayport().
>>
>> can you make below changes (patch) to _dpu_kms_initialize_displayport().
>>
> Yes, I've made that change to try to understand the problem. I still
> don't understand, sadly. Does flipping the order of iteration through
> 'priv->dp' somehow mean that the crtc that is assigned to the eDP
> connector is left unchanged? Whereas without registering the eDP encoder
> first means we have to change the crtc for the eDP encoder and that
> can't be done atomically?
