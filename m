Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D82A55335
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 18:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535CD10E09A;
	Thu,  6 Mar 2025 17:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jy0RXJDS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1ECF10E09A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 17:38:24 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-22337bc9ac3so20815945ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 09:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741282704; x=1741887504; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vOLh9gzLLTnBkEL+yV1uI1454538r2FfTEhP5HmpB1o=;
 b=Jy0RXJDSgSDWdMDEs6QYbXhzoJBSkMl5htkww6v9ChhO7uNqDpb4KnF9qabwdOu/Fa
 vphKzAIBYQKkI08RhB9NF+W9wXH+m4ep7mWVHwwWTBg9jt7m+g5h8i7Ea2y3Xd/gx+fM
 GHTrPbKWj7Wxg6QHAvC2C7hDqu64Whsmwga9w11gK5BS8ProFu+ndsOwHoPYSntJr6gv
 5AYK3pdS/LB4MBcp8mLNgeUp/eSBvbojMtvAYAdzqJLY0nQQ5s92gNN9XGiqYe8zDJCd
 p8MKOUU3gt2oV2XFwPm/3DM1Yr3OdO75W1ogMJAdWTl5ufhRsJOzXgC2y7v9BwGYyR8v
 oeeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741282704; x=1741887504;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vOLh9gzLLTnBkEL+yV1uI1454538r2FfTEhP5HmpB1o=;
 b=G+d3YNjLAdXIbV1C0okWQmcR5mq7xKWHdsHv/z/lj3LPKdbm8TQluL+5rWrYbTyu1z
 nirBIuOPbtu9IMbGxh5nMc53ZVDNdAfyW8e2bngiRMB7L8Eo6HMz7ZY7GsVh1SOcwJyt
 WliXCBDy6mlmlOsOTpKjXK+A5KJAz0bmU6H5JqAnVed964c3Mn6DNGXP/rLvs9zqyBxu
 2bMb+2ZBDjeR2aCiERWYUwCfzjRcwegY7HDeBIF0kvDxum1rVPbXKV4pBzGt+g5wSQQ5
 i/Jf+dp/TDHkcCPo62h/zbJfI2BILOr1wdwYpTRGWDtiI792TdoC3i9Dobzghp7dJoeh
 dr0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCO3P8j2d5X0y1AFa/rGXY7nw++lD6q06ejPE19xDOmp9E/RTodYBvUNNhAyvqnG29vSUB3PyjHQk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyz1BITZPVV7f3yfs+9aK589G/LWC7M0M97P/S42kJUNyBgC7fI
 tmHxzCLkRp0m35P5ZmseKJWHTk106HEiJZ07mZUcjPJTyrm5/ITC
X-Gm-Gg: ASbGncuLzUAfXb7IGMZS2wcnkO0gyyEX/9G9C/Sd/7ihmmqSUTnwAvWfp86ifElUiwD
 GXe2ijXEIAJYj1viNKCmlGRCMusq2g6uU2+pOzT7dAk8ypGR2gNrv4xnSAkBp9hbpDyYSIO0m1q
 ekbtpOGt00+ryP8jLM+zZpodxM7vqqiCnn3La7EUukiv16M0D/W5wngXb457C4GjmWRP5QEVWUy
 BH9VrKEZZ9iHIPX41P0T3pEkJjazzwIjS/Qx/4fre4o5P6cPnpRHU5TOoVNGPS0Fs13je4ITmbE
 1uiZd74vsn5fIqHaSxXdtgHEnLAPVtczcvB99nmGUqvWGQ65
X-Google-Smtp-Source: AGHT+IE9qyV8d9/1YplE6bXK6QT01t3t9rgog6hxOfOk/24ZIViC5gY/auBymcqgFNZlpeaHkchN8g==
X-Received: by 2002:a05:6a00:1819:b0:736:53ce:a32c with SMTP id
 d2e1a72fcca58-736aaac644bmr192705b3a.17.1741282704310; 
 Thu, 06 Mar 2025 09:38:24 -0800 (PST)
Received: from [10.3.72.248] ([59.152.80.69]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7369844cfd8sm1636038b3a.83.2025.03.06.09.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 09:38:24 -0800 (PST)
Message-ID: <0d473dc1-cbbe-4a1e-933a-938438db24f5@gmail.com>
Date: Thu, 6 Mar 2025 23:08:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: novatek-nt36523: transition to mipi_dsi
 wrapped functions
To: Doug Anderson <dianders@chromium.org>, neil.armstrong@linaro.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lujianhua000@gmail.com, quic_jesszhan@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Anusha Srivatsa <asrivats@redhat.com>
References: <20250306134350.139792-1-tejasvipin76@gmail.com>
 <ca5b0825-a485-4bec-bd93-b57a8d7ced99@linaro.org>
 <CAD=FV=VoW-Zm5wY6Y9sr=GqnvfMP4urGw_zW8NJRHpdC4=rHXQ@mail.gmail.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <CAD=FV=VoW-Zm5wY6Y9sr=GqnvfMP4urGw_zW8NJRHpdC4=rHXQ@mail.gmail.com>
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



On 3/6/25 10:58 PM, Doug Anderson wrote:
> Hi,
> 
> On Thu, Mar 6, 2025 at 6:05 AM <neil.armstrong@linaro.org> wrote:
>>
>> On 06/03/2025 14:43, Tejas Vipin wrote:
>>> Changes the novatek-nt36523 panel to use multi style functions for
>>> improved error handling.
>>>
>>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
>>> ---
>>>   drivers/gpu/drm/panel/panel-novatek-nt36523.c | 1683 ++++++++---------
>>>   1 file changed, 823 insertions(+), 860 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
>>> index 04f1d2676c78..922a225f6258 100644
>>> --- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
>>> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
>>> @@ -23,10 +23,12 @@
>>>
>>>   #define DSI_NUM_MIN 1
>>>
>>> -#define mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, cmd, seq...)        \
>>> -             do {                                                 \
>>> -                     mipi_dsi_dcs_write_seq(dsi0, cmd, seq);      \
>>> -                     mipi_dsi_dcs_write_seq(dsi1, cmd, seq);      \
>>> +#define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, cmd, seq...)      \
>>> +             do {                                                            \
>>> +                     mipi_dsi_dcs_write_seq_multi(&dsi_ctx0, cmd, seq);      \
>>> +                     dsi_ctx1.accum_err = dsi_ctx0.accum_err;                \
>>> +                     mipi_dsi_dcs_write_seq_multi(&dsi_ctx1, cmd, seq);      \
>>> +                     dsi_ctx0.accum_err = dsi_ctx1.accum_err;                \
>>
>> Just thinking out loud, but can't we do :
>>
>> struct mipi_dsi_multi_context dsi_ctx = { .dsi = NULL };
>>
>> #define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, cmd, seq...)      \
>>                 do {
>>                         dsi_ctx.dsi = dsi0;                                     \
>>                         mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, seq);       \
>>                         dsi_ctx.dsi = dsi1;                                     \
>>                         mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, seq);       \
>>
>> ?
>>
>> So we have a single accum_err.
> 
> Even though the code you used was what I suggested in IRC, I like
> Neil's suggestion better here. What do you think?

I like Dmitry's suggestion [1]. If we went ahead with this we'd also
only need to equate the accum_err for the few msleep calls. Since it
does change the behavior, I'd like to hear another opinion on it before
I go ahead with it.

[1]: https://lore.kernel.org/all/p2esqngynwfrshz5rqfnmx6qgwf4dclpkb3mphwg2vavx2jbcg@clqoy5tjh7bb/

> 
> Other than that, it looks good to me.
> 
> -Doug

-- 
Tejas Vipin
