Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5106E5199E8
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B17110F763;
	Wed,  4 May 2022 08:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D19910F766
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651653283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=if3uv1JcdUh98ACrRo4ZvJgdrj3l4HR7vDdntef3MiY=;
 b=hfckusm0m3BJNS5hlzZ2ZaMqtq/RuUvqNyFrj2TmTI/5QnPiu6OkbrKmccUtxRrANIkJ/n
 4eCBod5SAmd5aqx1M70ll/ZbovXXO4g4Ym1lYSVLHi/wHzpSxcmMVS6a+t6Qv5/8yqX0mg
 PzIkdBw28BFqUOBfsiSDGQiQNlsfxNo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-rJE0MvEdOxGKm1eNyhUA4A-1; Wed, 04 May 2022 04:34:42 -0400
X-MC-Unique: rJE0MvEdOxGKm1eNyhUA4A-1
Received: by mail-wr1-f71.google.com with SMTP id
 m8-20020adfc588000000b0020c4edd8a57so140369wrg.10
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 01:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=if3uv1JcdUh98ACrRo4ZvJgdrj3l4HR7vDdntef3MiY=;
 b=y7dGdYWsqt/kAP12Bw7Ujp5jqhhHxkTRvdVDpN30NlszX44uuy8GH7knC5KY9WpUbR
 ad1+nqc8VC9EIXHFQmroMsNW6VdfBUer+f9KoxsEU/YZUidB1qJhFnLjn5sXFjg8ctOn
 tj8yGUvfPalKVC5VhBacmOfV7P21+1oEKKY/e2E6wWiD0hODKuf+rHRoXmCVw9EgDh8F
 TRvvwH5D7fAOtpNkxmE3PXGwJ31HwiIbNJQ3F/edDteyULBHHGNRPwdoBOx1UPEttNxm
 rxeOvQ1NDDtJdDODf6ZWthJxOFGe1Ns8xF31Vp6qfXgY44bCteDn+dRiZVutnKDfRYW0
 ARew==
X-Gm-Message-State: AOAM533HaC18ImHOuOBD0YoTyFGplgUBB8l63tRaOyUInPm93usFzfzl
 rl2mb01nhyCfZD0VNUGBsShnoJ7MOB/5PoQYE8OPRUGWNtqxWigTbPZbhfWXkNazGME+f4Pjybj
 XcO4ys2ruF9BcMU4+PUO8KxbkVLVZ
X-Received: by 2002:a05:600c:4ed3:b0:394:20e7:bb86 with SMTP id
 g19-20020a05600c4ed300b0039420e7bb86mr6555292wmq.169.1651653281544; 
 Wed, 04 May 2022 01:34:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAZVwBp/nDI1nIpeJGb6Pci/26KKoAcohnWXc6tvbHvFBQaP3kohFTAC4NC7vLVQIejL3L9A==
X-Received: by 2002:a05:600c:4ed3:b0:394:20e7:bb86 with SMTP id
 g19-20020a05600c4ed300b0039420e7bb86mr6555283wmq.169.1651653281303; 
 Wed, 04 May 2022 01:34:41 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h19-20020a1ccc13000000b003942a244ed7sm3318494wmb.28.2022.05.04.01.34.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 01:34:41 -0700 (PDT)
Message-ID: <b9aebad9-30df-2906-d935-0483a5429a1a@redhat.com>
Date: Wed, 4 May 2022 10:34:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/todo: Add entry for using kunit in the subsystem
To: Maxime Ripard <maxime@cerno.tech>
References: <20220504080212.713275-1-javierm@redhat.com>
 <20220504081030.ky57nenipnif5r2e@houat>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220504081030.ky57nenipnif5r2e@houat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maxime,

Thanks for your feedback.

On 5/4/22 10:10, Maxime Ripard wrote:
> Hi,
> 
> On Wed, May 04, 2022 at 10:02:12AM +0200, Javier Martinez Canillas wrote:
>> The Kernel Unit Testing (KUnit) framework provides a common framework for
>> unit tests within the Linux kernel. Having a test suite would allow to
>> identify regressions earlier.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>
>>  Documentation/gpu/todo.rst | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
>> index 127e76ee0b2d..10bfb50908d1 100644
>> --- a/Documentation/gpu/todo.rst
>> +++ b/Documentation/gpu/todo.rst
>> @@ -603,6 +603,20 @@ Level: Advanced
>>  Better Testing
>>  ==============
>>  
>> +Add unit tests using the Kernel Unit Testing (KUnit) framework
>> +--------------------------------------------------------------
>> +
>> +The `KUnit <https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html>`_
>> +provides a common framework for unit tests within the Linux kernel. Having a
>> +test suite would allow to identify regressions earlier.
>> +
>> +A good candidate for the first unit tests are the format-conversion helpers in
>> +``drm_format_helper.c``.
>> +
>> +Contact: Javier Martinez Canillas <javierm@redhat.com>
>> +
>> +Level: Intermediate
> 
> Kunit is fairly easy to grasp if you have some knowledge of other unit
> testing frameworks already (pytest, cmocka, etc.)
>

Yes, I didn't set to intermediate due kunit but rather due the format
conversions, since the functions are not easy to read and understand.

And the person writing the unit tests will have to get familiar with
the different formats to verify that conversions are done correctly.
 
> Another good candidate would be to convert (some ?) selftests to kunit.
> I'm not sure the others, but at least test-drm_cmdline_parser should be
> fairly easy to convert.
>

Indeed. Maybe I would add it as a separate entr though, as a follow-up.
 
> Maxime

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

