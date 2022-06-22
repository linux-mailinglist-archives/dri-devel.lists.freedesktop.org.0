Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4697B5552A8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 19:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2CD10E0A3;
	Wed, 22 Jun 2022 17:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E6910E2C7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 17:42:00 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id j21so15922624lfe.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 10:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Md1LFFMVf3qzgQl06XYv2bG2aVcmSQ0Imz09zcqF9fE=;
 b=BKHdplf9Z9UYjFpu0usV1HiUVRkZrmz6azNJU7EC0MviAcfmO/rMhk1qqtXUmZJ5IL
 hdjnrvu84pvYn8IVuFvN1f4Br15iQ7froaX8gqPoFdJDxRn39/uc+pt0KXQRc8y1FrBg
 7EYrgyuwW8eOEro4h+ZrqssVv+yMUnSl+U3TCAOvcTUWCU6PSfwFGIYzyi7iTHrPtu6t
 qrjTm1Tsh/UsLuBTseWzt9aDUuks/Uc0JnM87Dyj8KP4mtTPfMSI6m5c4AV94mb0BAJt
 xCeq/L2uxpIE785DkcbrummXJZ/HiWvDS0uc47Bs/8zviuoh9zGldNWQclHF1KwDInbN
 6MyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Md1LFFMVf3qzgQl06XYv2bG2aVcmSQ0Imz09zcqF9fE=;
 b=CXM0CSkmEmwKTfq9mFz5y43d0Atd9QpbEwtU+v4nuefOe5yXQBRAvsuhJDEDu25pgR
 xkIEsQanistQ0HYDVK4RtoYXJPSuVGMoGnh72bo4DEnZ0fz28x0weZzcPSJjCZXr6pli
 zYY1woQCC+7YohJkoEx8gyKvf1qaS29aCOsZK43gUYyutqRmsX6p2T0eU5hGxyyrLq6k
 NBmvfuVX9KR8I+4F+SLIRVpgZzj9ef8YY1LUEZJPKVYLZ+Zhj6ZpW/hXaeo6hZugyN2J
 Op2l4J1NU2/LQMiHcc0cVe1+s1HmFzEvdP3LA5Oo3lcM7CK16f2QyuAJah0wO+WAtuYL
 shkQ==
X-Gm-Message-State: AJIora8r+aT3xXvIUj58S+3e6rrofiLj8bZpbaGIgL/uIrzxIq8fUGSg
 JzJfwM9awE4n+7Cla541Bx9AOg==
X-Google-Smtp-Source: AGRyM1t7MP6/Z+Yz4nicI0Mu0cth9yPiwZA7MruELCF+kKK//sFOF/JfUauGdWLSIkbgxgAVQEmhvw==
X-Received: by 2002:ac2:5cc6:0:b0:47f:7a4b:9db8 with SMTP id
 f6-20020ac25cc6000000b0047f7a4b9db8mr2803564lfq.592.1655919719106; 
 Wed, 22 Jun 2022 10:41:59 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a2e99c3000000b0025574e803fasm2511387ljj.18.2022.06.22.10.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 10:41:58 -0700 (PDT)
Message-ID: <8394943c-8d51-df67-1603-6f37ac26a730@linaro.org>
Date: Wed, 22 Jun 2022 20:41:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/msm/dpu: Increment vsync_cnt before waking up
 userspace
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220622023855.2970913-1-swboyd@chromium.org>
 <b133b67f-0d99-af6b-94a5-d5ff4b5752f1@quicinc.com>
 <CAF6AEGuL0+3162jGb2YLsYoW-fmNsARuKcvE-+d5hRkCiicp4g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGuL0+3162jGb2YLsYoW-fmNsARuKcvE-+d5hRkCiicp4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Sean Paul <sean@poorly.run>, patches@lists.linux.dev,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Yacoub <markyacoub@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/06/2022 20:33, Rob Clark wrote:
> On Wed, Jun 22, 2022 at 10:24 AM Abhinav Kumar
> <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 6/21/2022 7:38 PM, Stephen Boyd wrote:
>>> The 'vsync_cnt' is used to count the number of frames for a crtc.
>>> Unfortunately, we increment the count after waking up userspace via
>>> dpu_crtc_vblank_callback() calling drm_crtc_handle_vblank().
>>> drm_crtc_handle_vblank() wakes up userspace processes that have called
>>> drm_wait_vblank_ioctl(), and if that ioctl is expecting the count to
>>> increase it won't.
>>>
>>> Increment the count before calling into the drm APIs so that we don't
>>> have to worry about ordering the increment with anything else in drm.
>>> This fixes a software video decode test that fails to see frame counts
>>> increase on Trogdor boards.
>>>
>>> Cc: Mark Yacoub <markyacoub@chromium.org>
>>> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> Fixes: 885455d6bf82 ("drm/msm: Change dpu_crtc_get_vblank_counter to use vsync count.")
>>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>>
>> This is right, we should increment before drm_crtc_handle_vblank() as
>> that will query the vblank counter. This also matches what we do
>> downstream, hence
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> One small nit though, shouldnt the fixes tag be
>>
>> 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> 
> *Kinda*.. but the sw vblank counter wasn't used for reporting frame nr
> to userspace until 885455d6bf82.  You could possibly list both,
> perhaps, but 885455d6bf82 is the important one for folks backporting
> to stable kernels to be aware of

I'd agree, the original Fixes tag seems good to me.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
