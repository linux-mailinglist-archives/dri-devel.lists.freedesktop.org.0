Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1073340ECA
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 21:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2E26E961;
	Thu, 18 Mar 2021 20:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1F96E96B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 20:05:39 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id 15so9162017ljj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 13:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q6PUygLd2CXnygyW6bbcAwIFdQAJc7wY0uz9i6YRMS0=;
 b=DtivWm1nvHqukfWwBGl4J3c0hQqnc0JsIjWj5R0TYAwuPrZoYwFZcc2a0V1GLyZI9P
 Qh5P9znKxGvJTkdApwli9nR+ug98QG8eP/eNKE9TaLYtCAGn79L/alcPpfGcOIAj8Crx
 79Dcwiu3WFQW5rnu8dx7q744DpDahY0qUXCs7Kcx5HcL/W+ABMMD2i9s3UOB6Xu8jTRA
 S5Z2u018BC7V6DuT7aeDGIqijVge8vwhtluFerJYq3AKTNA44TR28hkgJc20+R4dwDOK
 l1lNl+jnxO/Y4pOhBw6vZzHSiUvYyqiG9OAi6YQpw0wPFP0kYQWRSwIrRDGPjSN5O8a5
 c9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q6PUygLd2CXnygyW6bbcAwIFdQAJc7wY0uz9i6YRMS0=;
 b=jwr6ze1p6Nw/wH0Nn+0mI5pWTA14jqc6wv8z7x2qNMAVbBF0rBkT+nKLq+NPFfVDwx
 NE0k3/55Fb5tOKiMNqSf7UTy7YvooJjOrUrNAUOt89iHC8iUpkKIpakcFNr3XyPyPG2t
 zmbVYps3p+LGjHkiGwvIA3FJ+QHvAt9o9kCVz52wZWnGheWXw3te+uoaSBJq57IdIgSL
 +2YOQvYZBCvM/r5o5eOKzjuex7BtK6C02EAmV4xV/wOcKaCAy4cSQuUvMpSAOiUF6Wzj
 vGJoBvl6bb6o0WhZUkRuXgbsV9qAZV1kjit5Ichyq/TlSMwriD7xeN+cwORfIUyCWvfg
 Wv4Q==
X-Gm-Message-State: AOAM530qoYq9Yq0goNlm9+vGcJE7HfFsvY3Jtbzz7xxSx4qGyQxcWciM
 8cikwT2pqaFWTNlMpouEa6/QxA==
X-Google-Smtp-Source: ABdhPJxcOJr/aMUfBKt/Y/rK28TCbP0BBmj4XsdjXBJTN8Si5Ans5n49zdCt4gfieQeUk+b0F5JSLA==
X-Received: by 2002:a2e:88d6:: with SMTP id a22mr6523479ljk.289.1616097937524; 
 Thu, 18 Mar 2021 13:05:37 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q17sm346659lfm.168.2021.03.18.13.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 13:05:37 -0700 (PDT)
Subject: Re: [PATCH] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
To: Rob Clark <robdclark@gmail.com>
References: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org>
 <CAF6AEGsN4s_wF0kHx4Y=vMM3AMTCewE4oiBdaxguVAku_nkODw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <b0f44785-b56b-5451-9e7a-e75821d34563@linaro.org>
Date: Thu, 18 Mar 2021 23:05:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAF6AEGsN4s_wF0kHx4Y=vMM3AMTCewE4oiBdaxguVAku_nkODw@mail.gmail.com>
Content-Language: en-GB
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/03/2021 19:25, Rob Clark wrote:
> On Mon, Mar 1, 2021 at 1:41 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> if GPU components have failed to bind, shutdown callback would fail with
>> the following backtrace. Add safeguard check to stop that oops from
>> happening and allow the board to reboot.

[skipped]

>> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
>> index 6a326761dc4a..2fd0cf6421ad 100644
>> --- a/drivers/gpu/drm/msm/msm_atomic.c
>> +++ b/drivers/gpu/drm/msm/msm_atomic.c
>> @@ -207,7 +207,12 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>>          struct msm_kms *kms = priv->kms;
>>          struct drm_crtc *async_crtc = NULL;
>>          unsigned crtc_mask = get_crtc_mask(state);
>> -       bool async = kms->funcs->vsync_time &&
>> +       bool async;
>> +
>> +       if (!kms)
>> +               return;
> 
> I think we could instead just check for null priv->kms in
> msm_pdev_shutdown() and not call drm_atomic_helper_shutdown()?


Good idea. Sending v2.

> 
> BR,
> -R
> 
>> +
>> +       async = kms->funcs->vsync_time &&
>>                          can_do_async(state, &async_crtc);
>>
>>          trace_msm_atomic_commit_tail_start(async, crtc_mask);
>> --
>> 2.30.1
>>


-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
