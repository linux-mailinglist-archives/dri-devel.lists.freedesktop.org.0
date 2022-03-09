Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA604D2615
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 02:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55B910E1AA;
	Wed,  9 Mar 2022 01:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE48910E1AA
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 01:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646790346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SoSjGNV88MG8vTOWxA+NDnTl5MshzRww6v3Ri4neFBo=;
 b=Di/XAU/7UCbNx3IHpFCjVjoDoTmgv4dgHOUfxBXkuQjEwNKBd5NkYLGR4PrnhWop8XhDAI
 /Z9PaRxAqQ0ebiqZxpNlPNUsocQpJSR37mDFt0shfWH1qrMZitfwRs5TRqT+b1dN3c8YhK
 vkCVircHwImCb5g2Pm58fETWQTyihkw=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-9laYNNW9OpWOzfznWcpKpg-1; Tue, 08 Mar 2022 20:45:45 -0500
X-MC-Unique: 9laYNNW9OpWOzfznWcpKpg-1
Received: by mail-il1-f199.google.com with SMTP id
 y18-20020a927d12000000b002c2e830dc22so429801ilc.20
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 17:45:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=SoSjGNV88MG8vTOWxA+NDnTl5MshzRww6v3Ri4neFBo=;
 b=eXN60/NBkOxOIJzRDgv/iGTKSXiK1TvVBhD4wv0JoWdI6UXQCjmgbQ3Y5Qn4i20l02
 fbYxXDnz3ZbLLQbJI/gB35lHe6g9ySCej1bFMZjxtbQJvJaPfrDVQ5Nn4Lcr2wtV6ILm
 f9hlbksvs5nSNo9fZR5wdDvB4Qek1nvuWHMS2RNTBdEzwuJGC7pQF3tRnK0fDjasqJSq
 AJLHv+1B+Pdh67l5F4++4tfFqmljXZO1SVOXtwJluhi2+deFDbuz4C61U/aTSNjcoPCS
 yAMcTq1/7TyeLhnIwQ9G8HdHWwLaGeYEP6oCKZ7WOKdGZStkloR4KJO1hSXasnXRUI0D
 rgXQ==
X-Gm-Message-State: AOAM531Z4Gcbp37zkzOH7B8D3QxT+BBZKA398l784qXygW0ONy0rgPYh
 y80ADkj8GHV7Jv/OOIuPWV88IkF7uvFO027Sp7jSf3nNdviq6pYytZFiDrf8OmoA2OD4jl26b0S
 MgTRRFallN0TTHZIi1QQpCksZd1kL
X-Received: by 2002:a05:6638:408:b0:313:f2bd:2d2 with SMTP id
 q8-20020a056638040800b00313f2bd02d2mr18041846jap.110.1646790344958; 
 Tue, 08 Mar 2022 17:45:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzS8AzsMXjFYL+igfxZixZE0Qq62nR7+uTTQrLwMYMJvP3DkjKhEFaYhZPtj7W2LUu1X5ok/g==
X-Received: by 2002:a05:6638:408:b0:313:f2bd:2d2 with SMTP id
 q8-20020a056638040800b00313f2bd02d2mr18041820jap.110.1646790344764; 
 Tue, 08 Mar 2022 17:45:44 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 p4-20020a92d284000000b002c64436fa71sm281578ilp.72.2022.03.08.17.45.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 17:45:44 -0800 (PST)
Subject: Re: [PATCH] drm/bridge: anx7625: check the return on anx7625_aux_trans
To: Nick Desaulniers <ndesaulniers@google.com>
References: <20220303201943.501746-1-trix@redhat.com>
 <CAKwvOdnoV_SsFuWWJd4nOOd1vGG6_-gg-KvdOg4_NHuRp7_WfA@mail.gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <5b6a10bd-5650-2924-d1cc-e4664a0e7255@redhat.com>
Date: Tue, 8 Mar 2022 17:45:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAKwvOdnoV_SsFuWWJd4nOOd1vGG6_-gg-KvdOg4_NHuRp7_WfA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: llvm@lists.linux.dev, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, nathan@kernel.org, tzungbi@google.com,
 pihsun@chromium.org, laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, hsinyi@chromium.org, sam@ravnborg.org,
 xji@analogixsemi.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/8/22 2:57 PM, Nick Desaulniers wrote:
> On Thu, Mar 3, 2022 at 12:19 PM <trix@redhat.com> wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> Clang static analysis reports this issue
>> anx7625.c:876:13: warning: The left operand of '&' is
>>    a garbage value
>>    if (!(bcap & 0xOA01)) {
>>          ~~~~ ^
>>
>> bcap is only set by a successful call to
>> anx7625_aux_trans().  So check.
>>
>> Fixes: cd1637c7e480 ("drm/bridge: anx7625: add HDCP support")
> Is this the correct Fixes tag?
yes
> I think it should be
>
> Fixes: adca62ec370c ("drm/bridge: anx7625: Support reading edid
> through aux channel")

This one changes the name of the function

-       anx7625_aux_dpcd_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);
+       anx7625_aux_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);

A return check from the earlier commit, when this block of code came 
into existence, is when it was first needed.

Tom

>
> instead.
>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>   drivers/gpu/drm/bridge/analogix/anx7625.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
>> index 633618bafd75d..f02ac079ed2ec 100644
>> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
>> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
>> @@ -872,7 +872,10 @@ static int anx7625_hdcp_enable(struct anx7625_data *ctx)
>>          }
>>
>>          /* Read downstream capability */
>> -       anx7625_aux_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);
>> +       ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);
>> +       if (ret < 0)
>> +               return ret;
>> +
>>          if (!(bcap & 0x01)) {
>>                  pr_warn("downstream not support HDCP 1.4, cap(%x).\n", bcap);
>>                  return 0;
>> --
>> 2.26.3
>>
>

