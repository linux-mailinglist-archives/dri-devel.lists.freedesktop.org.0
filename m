Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9813C605942
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 10:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D564410E3D3;
	Thu, 20 Oct 2022 08:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD6A10E3D3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 08:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666252997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=waCjQCfwppA2aPm9Bjke6nadkkOrugb8P9JFyMBn6xs=;
 b=eslB2WOn1EelPP1QkN4npZWD869lEatMAVNmL1xok31t7G5BjwSHyWoPavIE55sp1xyYu7
 MN0U/B7gYnjseOHm1t+8EcyKcJvqKy+gGfLblBccmoeO2wIFsqQuMjJOT3wLfd4BvyfaWK
 Zeo+RkdtLy5xDFj6K/yShMHqC8PtYLY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-299-O1pOZ16BM6yJuRPBSg-1ZA-1; Thu, 20 Oct 2022 04:03:16 -0400
X-MC-Unique: O1pOZ16BM6yJuRPBSg-1ZA-1
Received: by mail-wr1-f70.google.com with SMTP id
 v4-20020adfa1c4000000b002345526fbc6so1028834wrv.8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 01:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=waCjQCfwppA2aPm9Bjke6nadkkOrugb8P9JFyMBn6xs=;
 b=xPNa0Pp9Cw9FpCqgawz9AMzF5ik9e3nxD2oj0AfeDy3yxJdhw0Ho4Dmw6FnF5ACcyc
 yuJLS4AswXOwqTsoEqLh2BaUGp1h5Js3aw35IQtO5sjr8o70VVjcES5YVQv/3R8sDGMa
 D8XQXH6sjWKzFWoTD9u0KHCXCcarBpxnW+Nm1xLtXPmPTqRrITVt7uEsjbkb8yJlPylS
 V+SkEYtBGxHKClBxaZNAWquMfFQ3b7XGNqW/1vuiYFvRXhEfqHrnZeyITv+mNIVAR8b9
 mVJHh9kb0MLkPC/lYUesA468Y4T+JJGioRumy1hx2M5FvbJ57UVkSrW2JiN+jFeJrNXr
 VvLg==
X-Gm-Message-State: ACrzQf1JOhh4npFKJwOVElcswd11UCzU/0T0AiPBFnPftFEM3QaaJzq3
 ZSR858YBzzIgO2yOwpKlfg7BmE+/RmFiFKYyy9FwoEw3aVto1qj9qNgazgGqqjt7LQk+NrHvjlg
 9I6b1XIgPo4TZWGNhD5bYvU3ZGbvN
X-Received: by 2002:a05:6000:381:b0:232:2e1:48e9 with SMTP id
 u1-20020a056000038100b0023202e148e9mr7312415wrf.166.1666252995608; 
 Thu, 20 Oct 2022 01:03:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ulwDJYH7rDLTb3QU26mPIMsuJ5xkAL8KfoFx5HmES2IzbZ5noKDyuYPrthkmLGZhy0jL98A==
X-Received: by 2002:a05:6000:381:b0:232:2e1:48e9 with SMTP id
 u1-20020a056000038100b0023202e148e9mr7312386wrf.166.1666252995383; 
 Thu, 20 Oct 2022 01:03:15 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k2-20020a5d6e82000000b0022ccae2fa62sm15714340wrz.22.2022.10.20.01.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 01:03:15 -0700 (PDT)
Message-ID: <5639218e-bcc8-55b0-ea30-7bf2b26c92b9@redhat.com>
Date: Thu, 20 Oct 2022 10:03:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] drm: tests: Fix a buffer overflow in format_helper_test
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 David Gow <davidgow@google.com>
References: <20221019073239.3779180-1-davidgow@google.com>
 <20221019172919.GA5336@elementary>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221019172919.GA5336@elementary>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Kernel Functional Testing <lkft@linaro.org>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/19/22 19:29, José Expósito wrote:

[...]

>>  drivers/gpu/drm/tests/drm_format_helper_test.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
>> index 8d86c250c2ec..2191e57f2297 100644
>> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
>> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
>> @@ -438,7 +438,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>>  	iosys_map_set_vaddr(&src, xrgb8888);
>>  
>>  	drm_fb_xrgb8888_to_xrgb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
>> -	buf = le32buf_to_cpu(test, buf, TEST_BUF_SIZE);
>> +	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
>>  	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
>>  }
> 
> Thanks a lot for fixing this bug David, I just tested it and
> worked as expected.
>

I've pushed this to drm-misc (drm-misc-fixes) now. Thanks!
 
> Do you think that we should update the other calls to
> le32buf_to_cpu() to follow a similar approach?
>

Feel free to post follow-up patches if you think that other changes are needed.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

