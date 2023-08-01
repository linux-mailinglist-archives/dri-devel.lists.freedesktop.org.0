Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9975876B74E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 16:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC67510E3FA;
	Tue,  1 Aug 2023 14:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B8210E3FA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 14:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690899858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BAIovuoCF3oprGr2vZBMzoOVIyrwjP2LWaTC1b3o5cs=;
 b=JqbhhFQhlhoASwRvINnLAnNrssiI+18tiC2TBj2MnsNFDGBRHnzvT1e1ZpGTrg09irWmTa
 f5EG85LcXlCFuWoAw/KCi6rSuAohcTjXXnq+ePCD42s64BH1dEYTQnKpNItdZSNwua85LU
 792ba09O5mGf0ctUifgmNMSfUfRK76w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-pGmq_ZvWMJq7kb26A9MN6Q-1; Tue, 01 Aug 2023 10:24:17 -0400
X-MC-Unique: pGmq_ZvWMJq7kb26A9MN6Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fd0fa4d08cso33859015e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 07:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690899856; x=1691504656;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BAIovuoCF3oprGr2vZBMzoOVIyrwjP2LWaTC1b3o5cs=;
 b=BdenO9BiQ4kFVrE5ua4NSgTqlag3XNkmYPNzf8OPgIi5MiqoAUM2E+eH+EMTipKD5V
 2IagP7ffG+NgIICcfnWSd/D27j5GmVZKSO3d8ttYKmsxHrujYa+7kDgk7gjnSHPUvRVl
 L1/dgg3WR6AWZ8qPwPs3eRRjJEq/9xw/+m5jJdPrrssfZH1+ErDmkMu5o7fSrCN1jYMS
 RuBa85W1GuQUk35WleMjjXq7lSe66WU+3+b/L81DmpIEJpfovMgofbNeXd8YlCapcDF1
 0wWJOAoURVSfxmHEjkcFpx+DSQi4KC6crCbLNH1xI5nkpJuZICoyqjLWj9oPNl2LhHSo
 SAqQ==
X-Gm-Message-State: ABy/qLbPqnN8lqlevlTi3n87MP8zKnUCuLcfStmgT+eJsfxtHbahlWFi
 uQC95uPBde7drX+ORXkPmd6YJZeJ5jgjups1ghSPyhAO04QNuQuy0D5JpekrGC4KIjeTiMXOO85
 Qa5XLolUijQ+dDJ1eNhhyXYT9MbI+
X-Received: by 2002:a05:600c:2210:b0:3fe:ad4:27b1 with SMTP id
 z16-20020a05600c221000b003fe0ad427b1mr2499914wml.28.1690899856056; 
 Tue, 01 Aug 2023 07:24:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFlMiB56+a78IMKMZbBGMsdgFi2AsF95jQp/zxcXK+ihlTe0JNLBR8RyBKBcCMa8AbVRUUG2Q==
X-Received: by 2002:a05:600c:2210:b0:3fe:ad4:27b1 with SMTP id
 z16-20020a05600c221000b003fe0ad427b1mr2499898wml.28.1690899855420; 
 Tue, 01 Aug 2023 07:24:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b?
 ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a05600c044f00b003fbb1a9586esm17122533wmb.15.2023.08.01.07.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 07:24:14 -0700 (PDT)
Message-ID: <05fe2668-7b25-7b68-2a8a-61d06a926599@redhat.com>
Date: Tue, 1 Aug 2023 16:24:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Roger Sewell <roger.sewell@cantab.net>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <9c8a0a5f-fd7f-cf6d-7e6e-ca90bdf957c5@suse.de>
 <20230727223438.4658@revelation.broadband>
 <d5156750-34d4-87dc-41ff-f3c3ca1f48c3@suse.de>
 <3ff67cb3-c477-b834-3d6c-4eb99952d59b@redhat.com>
 <20230728131253.5411@revelation.broadband>
 <548751aa-6184-a5b0-2b90-d96ca04a8640@redhat.com>
 <d473e398-37cc-429f-c77a-f3c060d90198@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <d473e398-37cc-429f-c77a-f3c060d90198@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/08/2023 12:25, Thomas Zimmermann wrote:
> Hi
> 
> Am 01.08.23 um 12:11 schrieb Jocelyn Falempe:
>> On 28/07/2023 14:12, Roger Sewell wrote:
>>>
>>> Thomas, Jocelyn,
>>>
>>> JF> I think the culprit is probably this patch:
>>> JF> https://patchwork.freedesktop.org/patch/486242/
>>> JF>
>>> JF> before this patch,
>>> JF> mgag200_simple_display_pipe_mode_valid() always return MODE_OK
>>> JF>
>>> JF> after this patch, it checks the bandwidth limit too.
>>>
>>> It turns out to be more complicated than that - and I still think it is
>>> something to do with how the two functions
>>> mgag200_simple_display_pipe_mode_valid and
>>> mgag200_mode_config_mode_valid are made known to the rest of the drm
>>> system, i.e. which slots in the various function structures they are put
>>> in.
>>>
>>> I attach a contiguous excerpt from /var/log/messages, recording what
>>> happened when I did the following.
>>>
>>> 1. I instrumented the old mgag200 module with printk statements in
>>>     mgag200_simple_display_pipe_mode_valid and mga_vga_mode_valid and
>>>     mga_vga_calculate_mode_bandwidth, and also put in a call to the
>>>     latter in mgag200_simple_display_pipe_mode_valid so that I could see
>>>     what parameters it had been called with. I then rebooted the system,
>>>     getting the messages starting at Jul 28 10:42:45 . As you will see,
>>>     almost every time mgag200_simple_display_pipe_mode_valid is 
>>> called it
>>>     is immediately following a return of MODE_OK from mga_vga_mode_valid
>>>     with the same display parameters - the two exceptions are:
>>>
>>>     a) at line 1156 is when it is called after "fbcon: mgag200drmfb 
>>> (fb0)
>>>        is primary device", and
>>>
>>>     b) with the mode actually being set (1440x900) at line 2681 when it
>>>        of course returns MODE_OK (as that is what it always returns, as
>>>        you say).
>>>
>>> 2. I then switched to the new mgag200 module similarly instrumented, but
>>>     with the unique_rev_id increased by 1 to get sufficient bandwidth to
>>>     make 1440x900 usable. I then rebooted the system, getting the
>>>     messages starting at Jul 28 11:46:53 . Again, almost every time
>>>     mgag200_simple_display_pipe_mode_valid is called it is immediately
>>>     after a return of MODE_OK from mgag200_mode_config_mode_valid, 
>>> and we
>>>     still have exception type (a) at line 5672. However, the exception
>>>     type (b) is no longer present, as at line 6590, on setting the
>>>     1440x900 mode, there is now a call of mgag200_mode_config_mode_valid
>>>     preceding the call of mgag200_simple_display_pipe_mode_valid.
>>>
>>> 3. I then modified that mgag200 module by forcing a return of MODE_OK
>>>     from mgag200_simple_display_pipe_mode_valid and removing the
>>>     increment to unique_rev_id, so that 1440x900 is no longer "valid"
>>>     according to the criteria being used. I rebooted, getting the
>>>     messages starting at Jul 28 12:12:34 . Now at line 11004 we have a
>>>     failure to set mode immediately followed by a return of MODE_BAD, 
>>> not
>>>     from mgag200_simple_display_pipe_mode_valid but from
>>>     mgag200_mode_config_mode_valid.
>>>
>>> Thus between the old mgag200 module and the new one, there is a change
>>> in when the mode_config_mode_valid function gets called - there being
>>> one extra call. So even if one were to revert to
>>> mgag200_simple_display_pipe_mode_valid just always returning MODE_OK it
>>> wouldn't fix the problem.
>>>
>>> At present I don't see how the change of behaviour can be anything other
>>> than to do with the way these function names are passed to the rest of
>>> the drm system (though of course even if that were reverted, the fact
>>> that mgag200_simple_display_pipe_mode_valid now tests bandwidth would
>>> still cause what I want to do to fail).
>>>
>>> Sadly I don't understand how the drm system works, so I'm not sure that
>>> I can shed any more light - but if there are any more experiments that
>>> would help, please do let me know.
>>
>> I think the issue is that in v5.18, the memory check was done on the 
>> connector mode_valid() callback, and in v6.0, it's done in the 
>> mode_config mode_valid() callback.
>>
>> Can you please try the patch attached, I moved the bandwidth check 
>> back to the connector callback.
> 
> It should not make difference. I'd be surprised if it does. And in any 
> case, the bandwidth check belongs in to the mode_config test, as it is a 
> device-wide limit.
> 
It does, and it goes back to the v5.18 behavior, where the "out of spec" 
resolutions are not proposed, but you can still force them from userspace.
Also this claims to be a "bandwidth" limit, but all mgag200 are using 
the PCI bus for the memory clock, so have the same bandwidth. The limit 
is on the pixel clock, which is used only for the VGA DAC, so it's 
probably fine to attach this limit to the VGA connector. Of course 
mgag200 only have VGA connector, so it doesn't matter in practice.


> FYI I intend to close this bug report as INVALID. The hardware and 
> driver work according to the known specs, so there's no bug here.

I still think it's a kernel regression, because a userspace 
configuration that used to work is now broken.

Best regards,

-- 

Jocelyn


> 
> Best regards
> Thomas
> 
>>
>> Best regards,
>>
> 

