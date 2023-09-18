Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B56557A4605
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826EE10E247;
	Mon, 18 Sep 2023 09:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0950310E247
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695029562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q7qrwVvMDp31iIKnPY847V/Wv7JXOSGTGg3AgrFPMus=;
 b=DyIQx2JJt9G5dg9PMqUHb2Mj39/j42ozi2gnC/lQGQLK/kkN1Wvlo6oobEBR18sw3Me6QJ
 HkRxzZVbJ4KgoXjsF1/6RsJR3n/908Qb+ZafondoWJOlwseO+rqOm6JodWSG6RBrbRBd+Q
 1qHub0jOqNCFvIADVmVczErcJZ/aWoY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-imPoB-GMPwaqHR1WONpDyQ-1; Mon, 18 Sep 2023 05:32:38 -0400
X-MC-Unique: imPoB-GMPwaqHR1WONpDyQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-31aef4011cfso2873301f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 02:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695029557; x=1695634357;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q7qrwVvMDp31iIKnPY847V/Wv7JXOSGTGg3AgrFPMus=;
 b=N4zG1BVuXOQwM/s3ngzXz71dbGI0nArHAjn3+f49bj6OfRHLJqlO5qyFv9/dTuM49n
 Pj9Ut/m4mjypt6N34p2nU42ecmUzxoK2WNqoTP9XYC3WOF1irLLb6Nm8Q0S9TJE+r6Q5
 Zja7cs3m5I8BLlQwirIPSqkdbn6/x4kl97do/WK2rbLxx9mjRONKYvhFahqt5R7wMyvv
 jet8uY5SPejuddeg0jJ5W/f69wP/Ok03EBQaSJUT+NMeuI+95DF/ETWCkUR0vth9Hl95
 vhNSBs+EQ6Yj+s3K5Hfx6CP/z0NgnpjiNPQd14Wp5yPR6dF58sRN41IeTXyfmX8QSHBt
 IZwA==
X-Gm-Message-State: AOJu0Yz9UZIOuFTCCKscDEwK/rEubCEV2vkEGbdR/2jjPaX33Lf6hrUg
 Q1v4EDHifuTrEdUWotLyr7TuGFOA7+Wp9teUv8e3KBf/oeP3DIH95XjjbTMpgim0QD5CN/g3oY7
 MewN9jYcUTAFp26fAQSLZdw5NjXlJ
X-Received: by 2002:adf:ee03:0:b0:317:727f:3bc7 with SMTP id
 y3-20020adfee03000000b00317727f3bc7mr7100106wrn.17.1695029557659; 
 Mon, 18 Sep 2023 02:32:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0zgUdXgJ3XD5v1cI4BnbP5e02Ff8uwLpBrq7ZmgD/ZJrj3YHpEdEsDKx1mgfV8C5axhRdDw==
X-Received: by 2002:adf:ee03:0:b0:317:727f:3bc7 with SMTP id
 y3-20020adfee03000000b00317727f3bc7mr7100093wrn.17.1695029557362; 
 Mon, 18 Sep 2023 02:32:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 e17-20020adffc51000000b0031435731dfasm11985309wrs.35.2023.09.18.02.32.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Sep 2023 02:32:36 -0700 (PDT)
Message-ID: <0a6f869c-3c0c-8c7c-ca09-b885d9b5bafe@redhat.com>
Date: Mon, 18 Sep 2023 11:32:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC][PATCH v2 0/2] drm/panic: Add a drm panic handler
To: nerdopolis <bluescreen_avenger@verizon.net>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com
References: <20230915083307.1185571-1-jfalempe@redhat.com>
 <6657118.e9J7NaK4W3@nerdopolis2>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <6657118.e9J7NaK4W3@nerdopolis2>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/09/2023 15:09, nerdopolis wrote:
> On Friday, September 15, 2023 4:28:20 AM EDT Jocelyn Falempe wrote:
>> This introduces a new drm panic handler, which displays a message when a panic occurs.
>> So when fbcon is disabled, you can still see a kernel panic.
>>
>> This is one of the missing feature, when disabling VT/fbcon in the kernel:
>> https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
>> Fbcon can be replaced by a userspace kms console, but the panic screen must be done in the kernel.
>>
>> This is a proof of concept, and works only with simpledrm, using a new get_scanout_buffer() api
>>
>> To test it, make sure you're using the simpledrm driver, and trigger a panic:
>> echo c > /proc/sysrq-trigger
>>
> This seems to work pretty good! With this one, I don't need to have Weston (or another display server) running for it to work this time.
> The panic reason works, which is pretty sweet.

Thanks for testing, that's really appreciated.
> 
> FYI: I do get a hunk that fails to apply in simpledrm_remove in drivers/gpu/drm/tiny/simpledrm.c
> Seems to be a change in a recentish commit
> https://github.com/torvalds/linux/commit/84e6da7ad5537826343636b846530ec2167d4a19

Thanks for the head-up, when doing this RFC, I'm based on latest 
released version v6.5, to avoid having to rebase too often.
When it's closer to merging, I will rebase to drm-misc-next.

Best regards,

-- 

Jocelyn

