Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A32DA55307
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 18:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5C710EA38;
	Thu,  6 Mar 2025 17:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FMkhwe0H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335D910EA38
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 17:26:47 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-223a7065ff8so22182285ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 09:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741282007; x=1741886807; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uUVuOcA7Xkw74Zp9Xpn/wz9xV/4PaE7REr6k2Oyker4=;
 b=FMkhwe0HaFkM24oH2I/Y9qJY0XPaiSsrjqtGuiG8GkKA34wvCCAkxevSUrVyOZ1ZW/
 LScoBw7mlztKAkBNHqyZDr2L+6BjkJdh2lG5IhcbXtYII3h7p9CQ6d56lcpaUgmcY5u4
 SJAyqBY7ls2WKa5AObryP3R4lyz2EurMfNoZcl14DOgpeKjCTeDENEsNO0L3enMybtqI
 ODMge7HmMAhbvGYqAFOLsXAeemX99Rr0qkBG2g94Yy1zvS4l4zg5bKFWoZRRlgbmRTh5
 R/vPE5pmUlF5GzKvbFgMwy/i54CVk6yOyvif0UQfjl1c7MYJnYUpDCmXYjYNqPP89K+5
 iA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741282007; x=1741886807;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uUVuOcA7Xkw74Zp9Xpn/wz9xV/4PaE7REr6k2Oyker4=;
 b=j0Yl6Xxzr0G40w9BXhz0N9JH5CF3zJNa5uCoZTI72O1wJ+HvPGlq9V/3tA7hPEwB1U
 P0w4br+dl0hsRE6MDGnyRxuHJyImVhIsJLdTEelGjLD89MCCzoMfRZMKnjjgFT8evZCn
 kv0DpnKAFiIFyAuKRn6YMiQIx6f/Az25keRAA7wv8ctEGLayQa+KTBqRsSeJoq9IUjUB
 6YO9kaRDj0aKbRxvbBAW2pj4Bg7KYWTQGjcEbepVy5AVmv7CoXhyosGz2WBCUb3lJeto
 kp7dqylhiXjgueKvbr4t8w9oWs/mNYt3HmZeSjY+7UOYEh8ra5s8DZEbuOHiYi9m/AuI
 5PUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2h3M8R1rcG2Zb7frSToBZj2ICm3oksKCYV/Hh+GEN1RVapG/jy+G5MYl/FpwwzReYK+KEcBQl0Ok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEMwUoR+T4RbdnAScgWaLLR8PbnFnA/fZD2ltJB1hWvaEQDZ75
 1Noj4GVLMGKZKcbOoy6K+gk/tbHbTBM1SRq5d5xAcBv/vQNrAm8+
X-Gm-Gg: ASbGncvKJLcJEErPXSoE0dNZkz17dy971ppO7NPlyfvG8SPiJDslHnj2Rjzn1qK2jU/
 KcFGcS0FDVWkdHvBYcHBgETrT0d0wJcG/k+C0QRTKFuIMLLgV2wz1go79AkILH7zPw/MBTfP6/A
 IywxGFhft5xzCGofRsW8XAS4EuTiPYwmK/1fwljL/ze4YoLQcdzfjP9TGpEUoKj2UhyMmetv0Cz
 c2Fa31cdBQDTcumaeDjHY5uVCcdLi8RdaQ5VTSWTnvELf9zCo1z1v7PcJPmoimIWeWGeDBi7NK+
 G7dKQlSHv0L8hqxcnfFb8cebgkrd7oT3ep4yGXeYKsigN4mb
X-Google-Smtp-Source: AGHT+IFKdP0qD7QXqNn7oGh20oobzZkggOG/O0IBDwU5pBdo9xJWaSDjC24OS3qtDcYgOWvBmDUaUw==
X-Received: by 2002:a17:903:8c6:b0:220:be86:a421 with SMTP id
 d9443c01a7336-22428ab798fmr1452305ad.38.1741282006768; 
 Thu, 06 Mar 2025 09:26:46 -0800 (PST)
Received: from [10.3.72.248] ([59.152.80.69]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22410aa543asm14920025ad.228.2025.03.06.09.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 09:26:46 -0800 (PST)
Message-ID: <cec91b2e-d639-4d9e-ae85-33d27f634800@gmail.com>
Date: Thu, 6 Mar 2025 22:56:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel/synaptics-r63353: Use _multi variants
To: Anusha Srivatsa <asrivats@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>
References: <20250305-mipi-synaptic-1-v1-1-92017cd19ef6@redhat.com>
 <20250306-clever-lime-tanuki-e2fc43@houat>
 <CAN9Xe3SDyC47HWww1eH63aZOiM-WF9BGxztM3yh9bf6ORuY7VA@mail.gmail.com>
 <CAA8EJpqBy22eWZjccT5_UM2PQGjiG4ZEfrb6S_1tP1w962rd8w@mail.gmail.com>
 <CAN9Xe3QQLze9ZBbWG=KLYHzaFLZsmhah6GrYKmKMCd62rYP=OQ@mail.gmail.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <CAN9Xe3QQLze9ZBbWG=KLYHzaFLZsmhah6GrYKmKMCd62rYP=OQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 3/6/25 9:03 PM, Anusha Srivatsa wrote:
> On Thu, Mar 6, 2025 at 11:29 AM Dmitry Baryshkov <
> dmitry.baryshkov@linaro.org> wrote:
> 
>> On Thu, 6 Mar 2025 at 17:10, Anusha Srivatsa <asrivats@redhat.com> wrote:
>>>
>>>
>>>
>>> On Thu, Mar 6, 2025 at 4:31 AM Maxime Ripard <mripard@kernel.org> wrote:
>>>>
>>>> Hi Anusha,
>>>>
>>>> On Wed, Mar 05, 2025 at 07:01:41PM -0500, Anusha Srivatsa wrote:
>>>>> Move away from using deprecated API and use _multi
>>>>> variants if available. Use mipi_dsi_msleep()
>>>>> and mipi_dsi_usleep_range() instead of msleep()
>>>>> and usleep_range() respectively.
>>>>>
>>>>> Used Coccinelle to find the multiple occurences.
>>>>> SmPl patch:
>>>>> @rule@
>>>>> identifier dsi_var;
>>>>> identifier r;
>>>>> identifier func;
>>>>> type t;
>>>>> position p;
>>>>> expression dsi_device;
>>>>> expression list es;
>>>>> @@
>>>>> t func(...) {
>>>>> ...
>>>>> struct mipi_dsi_device *dsi_var = dsi_device;
>>>>> +struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi_var };
>>>>> <+...
>>>>> (
>>>>> -mipi_dsi_dcs_write_seq(dsi_var,es)@p;
>>>>> +mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
>>>>> |
>>>>> -mipi_dsi_generic_write_seq(dsi_var,es)@p;
>>>>> +mipi_dsi_generic_write_seq_multi(&dsi_ctx,es);
>>>>> |
>>>>> -mipi_dsi_generic_write(dsi_var,es)@p;
>>>>> +mipi_dsi_generic_write_multi(&dsi_ctx,es);
>>>>> |
>>>>> -r = mipi_dsi_dcs_nop(dsi_var)@p;
>>>>> +mipi_dsi_dcs_nop_multi(&dsi_ctx);
>>>>> |
>>>>> ....rest of API
>>>>> ..
>>>>> )
>>>>> -if(r < 0) {
>>>>> -...
>>>>> -}
>>>>> ...+>
>>>>
>>>> The point of sending a single patch was to review the coccinelle script,
>>>> so you must put the entire script you used here.
>>>>
>>>
>>> I was actually thinking of sending patches per driver this time around
>> since Tejas also seems to be looking into similar parts....Thoughts?
>>
>> Have you discussed it with Tejas? What is his next target?
>>
>> I was hoping he will have some feedback on this patch and we could take it
> from there.....
> It *should* be okay for me to send all changes in a single series...
> 
> Anusha
>

There's 5 more panels that use dcs/generic write_seq(). Maybe I could
work on those (himax-hx8394, samsung-sofef00, samsung-s6d7aa0,
boe-bf060y8m-aj0, jdi-lpm102a188a) while you work on transitioning the
rest of the panels (excluding these) that use other functions in the 
old API? When either of us finishes before the other we could have 
another discussion about splitting work if necessary. I'm open to other
suggestions too.

>>>>> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
>>>>
>>>> That hasn't been my email address for 6 years :)
>>>>
>>> My bad. Will change this.
>>
>>
>>
>> --
>> With best wishes
>> Dmitry
>>
>>
> 

-- 
Tejas Vipin
