Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1DF9B5CDB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 08:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6A010E1A5;
	Wed, 30 Oct 2024 07:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OYfELNWO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C7310E1A5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 07:24:19 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2e2fb304e7dso5143880a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 00:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730273058; x=1730877858; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZbT1k0jtYtZoc6ycNC6ItDSMfqtmx2QXiTFNjmf6lrE=;
 b=OYfELNWOd7kh3UMLU5GC1Onf5TXnDd2N5hY93sWGkYdlsIRsyTRQvGSs5f93dLLFzw
 zdXH8hrOy8o1vENY3eFjFGHjYpku2SJJ6fAJOP8+gKb6istcGuYiGBlTITvW3yZSNjPL
 f6IEyD0lToaSPG3nK+3WFQ38r8i47rQI0WHsW1gKJA9MVsKZlT/cnHJ3FwWcMTy6T3GL
 5C47MmzCuEWEsxheBMfDiShbrf7SIxZDkJq602v1OvT5VorTIqxeLUDiKe+4h99Mv6Qt
 lgjbM9Btetah3cAZLwHnJo6/9zPUGQXaUD39pUqNohKY1GJzd1A6F5jBVdaR9DwQ7sM+
 bedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730273058; x=1730877858;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZbT1k0jtYtZoc6ycNC6ItDSMfqtmx2QXiTFNjmf6lrE=;
 b=GgjLXCM4kUvpo2YHNkeUoV84DuS3JBrG/Zght1y1Eg7qsu20OZ7jEBK2S77krFmJ8v
 E79kUFMdqdGz+5yFH4sgu42f1H0uQqyqkaZuLGNl5NUdT0ZqengSRrLo9dMX0O2STj+1
 JMSzIL15wHab7cj8a69h/X8pXXF51Sf6WPZda2s2gUR8TNBtWGs83+rUNZLjIDwa9YIQ
 +fcdVMOwMFj6O91G5xGqfJ3rZPozwz0yHlO1jfXMgmsT7iBgJL7EOSW+GLbOZJcmI6Bd
 k/bO6wfAtLEPFdkhdhgjOfeTlyXLy2z+nktmZh9RoW8FPyk5UL43CTIhmcOJMs82QXwT
 VIyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0m0XXuK5EEjA+UfmoOn5COEf4uigTy/2ZoWxTm5YH8LFqXySKutjvg54qO09xpb/dHI6zVbLskcg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziyV1f5R6evguzBifd2Yj6FKrJ86WgLwHulJtd0/bf8fnVu3bt
 zauqCsZ5U4rr/PlwHrBAUJksKQnZySknr2c+2DfodvOGk1amwDYy
X-Google-Smtp-Source: AGHT+IGM+v6NAXeMP4IkNaKUigE2nCoiG2YAIRRjbeoigodmsy8+M4z+pI/60s/KOdi65Cr7EMZExQ==
X-Received: by 2002:a17:90b:360a:b0:2e2:cef9:4d98 with SMTP id
 98e67ed59e1d1-2e8f10a7281mr14965333a91.25.1730273058404; 
 Wed, 30 Oct 2024 00:24:18 -0700 (PDT)
Received: from [10.3.80.76] ([103.4.221.252]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e92fa76aa6sm935500a91.36.2024.10.30.00.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 00:24:18 -0700 (PDT)
Message-ID: <c389ea3e-70cb-46c5-8cf1-878a99f771ec@gmail.com>
Date: Wed, 30 Oct 2024 12:54:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: leadtek-ltk050h3146w: transition to mipi_dsi
 wrapped functions
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241026035928.183454-1-tejasvipin76@gmail.com>
 <CAD=FV=Vps5vWD72O_kYhuKudduYed41+tZrVRB6x+FiaZrm-EA@mail.gmail.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <CAD=FV=Vps5vWD72O_kYhuKudduYed41+tZrVRB6x+FiaZrm-EA@mail.gmail.com>
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



On 10/29/24 12:24 AM, Doug Anderson wrote:
> Hi,
> 
> On Fri, Oct 25, 2024 at 9:00 PM Tejas Vipin <tejasvipin76@gmail.com> wrote:
>>
>> @@ -418,79 +398,42 @@ static const struct ltk050h3146w_desc ltk050h3146w_data = {
>>                 MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
>>  };
>>
>> -static int ltk050h3146w_a2_select_page(struct ltk050h3146w *ctx, int page)
>> +static void ltk050h3146w_a2_select_page(struct mipi_dsi_multi_context *dsi_ctx, int page)
>>  {
>> -       struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
>> -       u8 d[3] = { 0x98, 0x81, page };
>> +       u8 d[4] = { 0xff, 0x98, 0x81, page };
>>
>> -       return mipi_dsi_dcs_write(dsi, 0xff, d, ARRAY_SIZE(d));
>> +       mipi_dsi_dcs_write_buffer_multi(dsi_ctx, d, ARRAY_SIZE(d));
> 
> FWIW: the above might be slightly better as:
> 
> mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x98, 0x81, page);
> 
> That would make it more documenting that the 0xff is the "cmd", has
> fewer lines of code, and also gets the array marked as "static const"
> which might make the compiler slightly more efficient. ;-)
> 
> Not really a huge deal, though.
>

I did try this initially, but got an error because of page not being a
compile time constant. Not sure how I should handle this.

> Reviewed-by: Douglas Anderson <dianders@chromium.org>

-- 
Tejas Vipin
