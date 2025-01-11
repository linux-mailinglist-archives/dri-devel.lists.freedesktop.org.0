Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D8EA0A3C9
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2025 14:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B285010E0E7;
	Sat, 11 Jan 2025 13:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U2t0ZZtb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177D410E07E
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2025 13:10:03 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-300479ca5c6so24825001fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2025 05:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736600941; x=1737205741; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Qx1wyBpWYHJu++PDsnhtF5U0w2Z7xCP50OWt1HUfTZY=;
 b=U2t0ZZtbO7+oTua8LjPV/J3cXB8mabvQ0laduRPPGCkg0x5tSIJG8WLz9vgABteA+r
 v54rLbegNTCkK6Esl+LdK3kllNz9XNCLsSiUwDVfbtSvjvMBqpZjBMvNdvx/DTksmr/c
 8CG850XTloR+mHe7D2iBDQgfrA+YGxl/5qFx2GmDh4dTuZo5FOIXsanNl2hR9hEtSIxx
 o8TC0yHnSzPi/9AhYP7wYqWBvZmIruN2IDd2NMT932Y9QtMlk/t8QhtZaHYyFfuP8szs
 PxJZkljU2jSGs7bjpJZYZyP92a4GqrtNMVq9IIw8hj21SNqpfvTcx16k4AjSbYMXS4Yi
 2XXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736600941; x=1737205741;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qx1wyBpWYHJu++PDsnhtF5U0w2Z7xCP50OWt1HUfTZY=;
 b=dNpR1DgfKS+SRGV7xmroHeAeA7Z04VzRFXPBC62KniqlkIj2iApYIl96wApAJqQ/l8
 HvE3sgnktMun75yZKIdmlFASKefSVklbYV6qNAcqv21vZg96y6LZSdoxiK9L4PDUktNL
 MNsNeXZZTc9KLny2xqHkXg5crvD6UOuOGSvIyZCo1TQ+LMEm7xH4nRybeYsOV7aNA8Ma
 Qa3bGr6Ms/p5nu33bxifc9jjVfz+jbhJU72YwcD5Fg7lvjk75iNI/HvQXknTgjCk0pfp
 b1j/Kl2Wxmw/9nTlZeT8paDSEwGqau2k+/pmb0TRdeGX7JxZp6NflO+SSp1X4gaYEB8a
 P/wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzl01oZoFwe5QLYn8w8Wd4a7F9IQc4cSETKLBlRZmxIdoYbJxP7JQo+w6QYqYG5fSEm5k83Q2NEx0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtZFU2/5hbWRb0udJaFEENDozoRjOOBy9G0nYWsZ/aEfgYHDOq
 jjEN7zjaKk5fHasGdr/SpT4IIXnLh0FrEusm1z44HedFXm7PqzgGuba4oOaI/EM=
X-Gm-Gg: ASbGnctYUsJHT7qwj/x43BzPYKCGfgdnCIcEua6L/DeCP3A8sUBTFy0aQznI2d+ZOjg
 wiL+8cmqbUJ5yniVhzAr4bOXnXj+XQfEPcDl6xHu65HRRLO/+9mS91gkJfoMQtadltj2xMzFa1Q
 6m3XRlM0P0OHfF4BS4HQJYwy6nEs2zlUzYNCsplgkZQVHboycIPKEFZ6gfF7ROcLC9ymhauWmJ8
 cBuFY4gAKWKaA8b2URsjCNa6JLuVoEbmzLdCiYK8/yCqIahpLYCjP1CxTkfqQTu5PYHjAqQOezI
 Tn1NR+gffShs4xVF5RIRr+ae
X-Google-Smtp-Source: AGHT+IET3fM2KyzPq5qZrZvi3XK0YobTnnm/AX8Pu0nvU0MJZHQlXUZxi9ueffT+lleeGgmRDlOzLw==
X-Received: by 2002:a2e:be8a:0:b0:302:1b18:2bfa with SMTP id
 38308e7fff4ca-305f45b25e8mr51230021fa.23.1736600941149; 
 Sat, 11 Jan 2025 05:09:01 -0800 (PST)
Received: from [127.0.0.1] (85-76-141-224-nat.elisa-mobile.fi. [85.76.141.224])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff0f9d82sm8254421fa.65.2025.01.11.05.08.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jan 2025 05:08:59 -0800 (PST)
Date: Sat, 11 Jan 2025 15:08:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_4/9=5D_drm/msm/dpu=3A_make_fix=5Fco?=
 =?US-ASCII?Q?re=5Fab=5Fvote_consistent_with_fix=5Fcore=5Fib=5Fvote?=
User-Agent: Thunderbird for Android
In-Reply-To: <a17204c1-6eb5-4ce4-a302-c5f582055037@quicinc.com>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-4-00b248349476@linaro.org>
 <35a22251-c348-4bb7-905c-e24032100a00@quicinc.com>
 <sklr3ryu35xmoejkmbu35d3jxsg2clk3whmzslxtzcbcb3gjy4@bmcivlzkxqa3>
 <a17204c1-6eb5-4ce4-a302-c5f582055037@quicinc.com>
Message-ID: <0B5D10CF-35CE-4CF5-9105-5ACCC04EB94B@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On 11 January 2025 01:49:23 EET, Abhinav Kumar <quic_abhinavk@quicinc=2Ecom=
> wrote:
>
>
>On 1/9/2025 6:02 PM, Dmitry Baryshkov wrote:
>> On Thu, Jan 09, 2025 at 05:40:23PM -0800, Abhinav Kumar wrote:
>>>=20
>>>=20
>>> On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
>>>> The fix_core_ab_vote is an average bandwidth value, used for bandwidt=
h
>>>> overrides in several cases=2E However there is an internal inconsiste=
ncy:
>>>> fix_core_ib_vote is defined in KBps, while fix_core_ab_vote is define=
d
>>>> in Bps=2E
>>>>=20
>>>> Fix that by changing the type of the variable to u32 and using * 1000=
ULL
>>>> multiplier when setting up the dpu_core_perf_params::bw_ctl value=2E
>>>>=20
>>>=20
>>> Actually after looking at this, I have another question=2E
>>>=20
>>> How did you conclude that fix_core_ib_vote is in KBps?
>>>=20
>>> min_dram_ib is in KBps in the catalog but how is fix_core_ib_vote?
>>>=20
>>> It depends on the interpretation perhaps=2E If the debugfs was suppose=
d to
>>> operate under the expectation that the provided value will be pre-mult=
iplied
>>> by 1000 and given then that explains why it was not multiplied again=
=2E
>>>=20
>>> And I cross-checked some of the internal usages of the debugfs, the va=
lues
>>> provided to it were in Bps and not KBps=2E
>>=20
>> Well=2E=2E=2E As you wrote min_dram_ib is in KBps=2E So, by comparing t=
he next
>> two lines, fix_core_ib_vote should also be in kBps, as there is no
>> premultiplier:
>>=20
>>                  perf->max_per_pipe_ib =3D core_perf->fix_core_ib_vote;
>> [=2E=2E=2E]
>>                  perf->max_per_pipe_ib =3D perf_cfg->min_dram_ib;
>>=20
>> And then, as a proof, perf->max_per_pipe_ib is passed to icc_set_bw()
>> without any modifications:
>>=20
>>                  icc_set_bw(kms->path[i], avg_bw, perf=2Emax_per_pipe_i=
b);
>>=20
>
>Understood max_per_pipe_ib=2E But then by the same logic, fix_core_ab_vot=
e is always in Bps and not in KBps because bw_ctl is in Bps=2E
>
>Is it really a discrepancy that fix_core_ib_vote is defined in KBps, whil=
e fix_core_ab_vote is defined in Bps because they are just following the un=
its in which bw_ctl and max_per_pipe_ib were defined in resp=2E

Yes=2E They come in pair, as a part of the user interface=2E If one is in =
Bps and another one in KBps, it is very easy to forget that and misinterpre=
t them or to make a mistake while programming them=2E Not to mention that t=
he threshold files, which are related to AB, are in KBps=2E

>
>>=20
>>>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf=2Ec | 4 ++--
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf=2Eh | 2 +-
>>>>    2 files changed, 3 insertions(+), 3 deletions(-)
>>>>=20
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf=2Ec b/driver=
s/gpu/drm/msm/disp/dpu1/dpu_core_perf=2Ec
>>>> index 7263ab63a692554cd51a7fd91bd6250330179240=2E=2E7cabc8f26908cfd2d=
bbffebd7c70fc37d9159733 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf=2Ec
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf=2Ec
>>>> @@ -125,7 +125,7 @@ static void _dpu_core_perf_calc_crtc(const struct=
 dpu_core_perf *core_perf,
>>>>    		perf->max_per_pipe_ib =3D 0;
>>>>    		perf->core_clk_rate =3D 0;
>>>>    	} else if (core_perf->perf_tune=2Emode =3D=3D DPU_PERF_MODE_FIXED=
) {
>>>> -		perf->bw_ctl =3D core_perf->fix_core_ab_vote;
>>>> +		perf->bw_ctl =3D core_perf->fix_core_ab_vote * 1000ULL;
>>>>    		perf->max_per_pipe_ib =3D core_perf->fix_core_ib_vote;
>>>>    		perf->core_clk_rate =3D core_perf->fix_core_clk_rate;
>>>>    	} else {
>>>> @@ -479,7 +479,7 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dp=
u_kms, struct dentry *parent)
>>>>    			&perf->fix_core_clk_rate);
>>>>    	debugfs_create_u32("fix_core_ib_vote", 0600, entry,
>>>>    			&perf->fix_core_ib_vote);
>>>> -	debugfs_create_u64("fix_core_ab_vote", 0600, entry,
>>>> +	debugfs_create_u32("fix_core_ab_vote", 0600, entry,
>>>>    			&perf->fix_core_ab_vote);
>>>>    	return 0;
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf=2Eh b/driver=
s/gpu/drm/msm/disp/dpu1/dpu_core_perf=2Eh
>>>> index ca4595b4ec217697849af02446b23ed0857a0295=2E=2E5e07119c14c6a9ed3=
413d0eaddbd93df5cc3f79d 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf=2Eh
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf=2Eh
>>>> @@ -51,7 +51,7 @@ struct dpu_core_perf {
>>>>    	u32 enable_bw_release;
>>>>    	u64 fix_core_clk_rate;
>>>>    	u32 fix_core_ib_vote;
>>>> -	u64 fix_core_ab_vote;
>>>> +	u32 fix_core_ab_vote;
>>>>    };
>>>>    int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>>>>=20
>>=20

