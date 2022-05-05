Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B28051C63D
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 19:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26B310EF2B;
	Thu,  5 May 2022 17:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C4110EE81;
 Thu,  5 May 2022 17:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651772271; x=1683308271;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZsEQ3nqNWB5H6gVi1BhC0boyEv4/mfx+xbKQnGy/oOM=;
 b=DyUY4BeF4Ldg4FDZkqlhXC1BKL73P/ppqthvw0VIQFS+V5xLeO6ZzBqS
 YEB5/0V+iiPtKqZDmkN+8V+Zz/7Y+hpNMf+uffEVhgIdFY/TY4ttz9JdU
 mNMMxiv/fifS5WPjoLbbbWlwZ+HIAFeWUIocCfhKWy0yzSrzaZ8ilH86c Q=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 05 May 2022 10:37:51 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 10:37:51 -0700
Received: from [10.71.108.57] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 5 May 2022
 10:37:50 -0700
Message-ID: <ea000dc0-c241-351f-c0ca-d41f33998236@quicinc.com>
Date: Thu, 5 May 2022 10:37:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] drm/msm/mdp5: Return error code in mdp5_pipe_release
 when deadlock is detected
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>
References: <20220505015528.344-1-quic_jesszhan@quicinc.com>
 <CAF6AEGt1uFAgAo1+sp7KbamTb4DAn_MU-NR+UvGHLUGfm3oQ=A@mail.gmail.com>
 <CAA8EJpraDRzBevNPC6H9ZAaLAXFq2aOkdoD9NGo-DpgsXoCm=g@mail.gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAA8EJpraDRzBevNPC6H9ZAaLAXFq2aOkdoD9NGo-DpgsXoCm=g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 quic_aravindh@quicinc.com, freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/5/2022 1:48 AM, Dmitry Baryshkov wrote:
> On Thu, 5 May 2022 at 05:06, Rob Clark <robdclark@gmail.com> wrote:
>>
>> On Wed, May 4, 2022 at 6:55 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>>
>>> mdp5_get_global_state runs the risk of hitting a -EDEADLK when acquiring
>>> the modeset lock, but currently mdp5_pipe_release doesn't check for if
>>> an error is returned. Because of this, there is a possibility of
>>> mdp5_pipe_release hitting a NULL dereference error.
>>>
>>> To avoid this, let's have mdp5_pipe_release check if
>>> mdp5_get_global_state returns an error and propogate that error.
>>>
>>> Changes since v1:
>>> - Separated declaration and initialization of *new_state to avoid
>>>    compiler warning
>>> - Fixed some spelling mistakes in commit message
>>>
>>
>> Note that mdp5_mixer_release() needs the same treatment.. one more comment below

Got it, will submit a fix for that.

>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c  | 15 +++++++++++----
>>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h  |  2 +-
>>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 20 ++++++++++++++++----
>>>   3 files changed, 28 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
>>> index ba6695963aa6..97887a2be082 100644
>>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
>>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
>>> @@ -119,18 +119,23 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
>>>          return 0;
>>>   }
>>>
>>> -void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
>>> +int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
>>>   {
>>>          struct msm_drm_private *priv = s->dev->dev_private;
>>>          struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>>>          struct mdp5_global_state *state = mdp5_get_global_state(s);
>>> -       struct mdp5_hw_pipe_state *new_state = &state->hwpipe;
>>> +       struct mdp5_hw_pipe_state *new_state;
>>>
>>>          if (!hwpipe)
>>> -               return;
>>> +               return -EINVAL;
>>
>> At least per the current code, !hwpipe is "normal".. I think that fits
>> the model of things like kfree(NULL), so lets make this just return 0
> 
> Especially since we release the r_hwpipe w/o additional check. And
> r_hwpipe frequently is NULL.

Noted.

Thanks,
Jessica Zhang

> 
>>
>>> +
>>> +       if (IS_ERR(state))
>>> +               return PTR_ERR(state);
>>> +
>>> +       new_state = &state->hwpipe;
>>>
>>>          if (WARN_ON(!new_state->hwpipe_to_plane[hwpipe->idx]))
>>> -               return;
>>> +               return -EINVAL;
>>>
>>>          DBG("%s: release from plane %s", hwpipe->name,
>>>                  new_state->hwpipe_to_plane[hwpipe->idx]->name);
>>> @@ -141,6 +146,8 @@ void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
>>>          }
>>>
>>>          new_state->hwpipe_to_plane[hwpipe->idx] = NULL;
>>> +
>>> +       return 0;
>>>   }
>>>
>>>   void mdp5_pipe_destroy(struct mdp5_hw_pipe *hwpipe)
>>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
>>> index 9b26d0761bd4..cca67938cab2 100644
>>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
>>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
>>> @@ -37,7 +37,7 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
>>>                       uint32_t caps, uint32_t blkcfg,
>>>                       struct mdp5_hw_pipe **hwpipe,
>>>                       struct mdp5_hw_pipe **r_hwpipe);
>>> -void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe);
>>> +int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe);
>>>
>>>   struct mdp5_hw_pipe *mdp5_pipe_init(enum mdp5_pipe pipe,
>>>                  uint32_t reg_offset, uint32_t caps);
>>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
>>> index 228b22830970..979458482841 100644
>>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
>>> @@ -311,12 +311,24 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
>>>                                  mdp5_state->r_hwpipe = NULL;
>>>
>>>
>>> -                       mdp5_pipe_release(state->state, old_hwpipe);
>>> -                       mdp5_pipe_release(state->state, old_right_hwpipe);
>>> +                       ret = mdp5_pipe_release(state->state, old_hwpipe);
>>> +                       if (ret)
>>> +                               return ret;
>>> +
>>> +                       ret = mdp5_pipe_release(state->state, old_right_hwpipe);
>>> +                       if (ret)
>>> +                               return ret;
>>> +
>>>                  }
>>>          } else {
>>> -               mdp5_pipe_release(state->state, mdp5_state->hwpipe);
>>> -               mdp5_pipe_release(state->state, mdp5_state->r_hwpipe);
>>> +               ret = mdp5_pipe_release(state->state, mdp5_state->hwpipe);
>>> +               if (ret)
>>> +                       return ret;
>>> +
>>> +               ret = mdp5_pipe_release(state->state, mdp5_state->r_hwpipe);
>>> +               if (ret)
>>> +                       return ret;
>>> +
>>>                  mdp5_state->hwpipe = mdp5_state->r_hwpipe = NULL;
>>>          }
>>>
>>> --
>>> 2.35.1
>>>
> 
> 
> 
> -- 
> With best wishes
> Dmitry
