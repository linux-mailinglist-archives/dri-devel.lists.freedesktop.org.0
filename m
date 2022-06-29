Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FBB55FA40
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 10:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A38010E5A6;
	Wed, 29 Jun 2022 08:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12AA10E45D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 08:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656490859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bPJV1uPaZV9JJhbBrJp826ArqFj4Q0dOTMcobO8NbR8=;
 b=bTfT4BwTUhHjKsnZYXSh5osiP15x8TrNok7Lze+/ZuYwAlgSSLHJmjayhxrdKjOUSTpYgx
 wyb8ukdtI3ZFh/7ZKejx6FPnUlrP4frbBNQIybJtsXGdNVz3f0cv2Y41/abyrDfgUZh0wm
 BQGw/Mxq8JJwCVusZFA5+Z50YKbX5As=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-n_53vZjDNC2kBAzPintW6w-1; Wed, 29 Jun 2022 04:20:58 -0400
X-MC-Unique: n_53vZjDNC2kBAzPintW6w-1
Received: by mail-wr1-f69.google.com with SMTP id
 s14-20020adfa28e000000b0020ac7532f08so2160761wra.15
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 01:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bPJV1uPaZV9JJhbBrJp826ArqFj4Q0dOTMcobO8NbR8=;
 b=0KSgC3MQuyp9PIM1RslLTDHwfLlJlJndxvRGLPfJ9hSbZuFzf4/+GUe2Zj+X59t0ug
 E7IZxsE5UfzNluiRXK4b04a6hzpCwddzH9cDJCxMwLji2TM3N7+bEolPPTSDkzVXJwbY
 3vM0qHeAZpYdm9+qVWCYFxvRWE6efL9vTJQKJzPvdPKG7hUrd4Wvo9MQZusQsYQE+vOn
 xWEGP5g/5TIRUFXD+CwYu2pgJAxC4V4lRZjLFAzNOjlUaph90McfrOkPAHtWYdKQIZ+R
 TK80CAnYi6tQ2CAP5wgBkGx2bw5t8eHFr4OSKL5/P/qy+tO0KHdR+APwW9fTYKmgud/Y
 NkpA==
X-Gm-Message-State: AJIora9y5fe32veIrtspcJAwDsMn/fYCKaJeEsJvprenj1xkOViGGsEM
 81D4lG/7PN5N+GMUeNXkqZ7WqJIRU4Ix96b6dqCld0KVXcrUes+mu2L3N+4cPH+rKXdvWcQoop/
 /leGaKydoQUUWO8mbVUm9Fs19pc37
X-Received: by 2002:a05:600c:5127:b0:397:4862:e474 with SMTP id
 o39-20020a05600c512700b003974862e474mr2361009wms.68.1656490857404; 
 Wed, 29 Jun 2022 01:20:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1shi4ix35sLHrGEKb1EVEpzZ6zezB9IEV96DzmuPKrPxyxIUpeHBq+yzab4VpxhCVtEA3DMUg==
X-Received: by 2002:a05:600c:5127:b0:397:4862:e474 with SMTP id
 o39-20020a05600c512700b003974862e474mr2360986wms.68.1656490857136; 
 Wed, 29 Jun 2022 01:20:57 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b3-20020a5d6343000000b0021a36955493sm15495488wrw.74.2022.06.29.01.20.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 01:20:56 -0700 (PDT)
Message-ID: <d21e22dd-baa4-44c7-348b-e21844215277@redhat.com>
Date: Wed, 29 Jun 2022 10:20:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Annoying AMDGPU boot-time warning due to simplefb / amdgpu
 resource clash
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <CAHk-=wh42rU5mKU6=PCK5tdkYjh7r31dGNmYdHwqpFnRFvVudA@mail.gmail.com>
 <3920df43-37f5-618d-70ba-de34a886e8ab@redhat.com>
 <CAHk-=wjxzafG-=J8oT30s7upn4RhBs6TX-uVFZ5rME+L5_DoJA@mail.gmail.com>
 <561af3c0-c7cf-3580-ce35-320cb13a037c@suse.de>
 <98aab56e-b0a7-1a39-d715-9ad10d7705a0@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <98aab56e-b0a7-1a39-d715-9ad10d7705a0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/28/22 14:41, Jocelyn Falempe wrote:
> On 28/06/2022 10:43, Thomas Zimmermann wrote:

[snip]

>>
>> Unfortunately, this currently only works if a driver is bound to the 
>> platform device. Without simpledrm or simplefb, amdgpu won't find the 
>> platform device to remove.
>>
>> I guess, what happens on your system is that sysfb create a device for 
>> the EFI framebuffer and then amdgpu comes and doesn't find it for 
>> removal. And later you see these warnings because BOOTFB is still around.
>>
>> Javier already provided patches for this scenario, which are in the DRM 
>> tree. From drm-next, please cherry-pick
>>
>>    0949ee75da6c ("firmware: sysfb: Make sysfb_create_simplefb() return a 
>> pdev pointer")
>>
>>    bc824922b264 ("firmware: sysfb: Add sysfb_disable() helper function")
>>
>>    873eb3b11860 ("fbdev: Disable sysfb device registration when removing 
>> conflicting FBs")
>>
>> for testing. With these patches, amdgpu will find the sysfb device and 
>> unregister it.
>>
>> The patches are queued up for the next merge window. If they resolve the 
>> issue, we'll already send with the next round of fixes.
> 
> I was able to reproduce the warning with kernel v5.19-rc4, a radeon GPU 
> and the following config:
>
> CONFIG_SYSFB=y
> CONFIG_SYSFB_SIMPLEFB=y
> # CONFIG_DRM_SIMPLEDRM is not set
> # CONFIG_FB_SIMPLE is not set
>

Yes, and this could happen even if both drivers (e.g: simplefb and amdgpu)
are enabled but built-in. For example, if amdgpu probes before simplefb.

> After applying the 3 patches you mentioned, the issue is resolved. (at 
> least on my setup).
>

Thanks for testing Jocelyn! I've pushed the patches to drm-misc-fixes now.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

