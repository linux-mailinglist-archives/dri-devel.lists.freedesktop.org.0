Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2D856FD72
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 11:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701888A580;
	Mon, 11 Jul 2022 09:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE8C8A477
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 09:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657533344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MA5ZaOhJo92YQ61ncW/UJMh3rFBdjKN5BoWV3QaxZ9c=;
 b=R7Zgxo/GVOxOr10vBJpXDP6HX5fTfL9k/dMon9DSS/aVc4okWD/cvc3KY1qhEtdTP+mQBG
 cjv1GZ6ldkmyYzV7YNBZo4Nik2DatiSocmIIuZ5+CNE2tOGa217zwW6nskj1SZ+xD47Ln8
 uDZ2WDlr39V3iPu8Vg4DOflmQRFe7fo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-EB5cKd_zM6aJ9rHQi5bRgw-1; Mon, 11 Jul 2022 05:55:43 -0400
X-MC-Unique: EB5cKd_zM6aJ9rHQi5bRgw-1
Received: by mail-wm1-f69.google.com with SMTP id
 r186-20020a1c44c3000000b003a2daf644f9so4706053wma.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 02:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MA5ZaOhJo92YQ61ncW/UJMh3rFBdjKN5BoWV3QaxZ9c=;
 b=oeOoR+iuntTfb9yd5W9/Mm+qWJMAgROYA+pzaC76F04QAF5XDJGlbJrGxxnKtLxcOS
 pdWawodDzojAf2AQh3JWtEuLKoE4Ux380Aengzs2zLCcqzFX32HAZ1tWM25R3I963sdc
 NnNvK3VFat4P3PgtT5ldw1yyuSG0dgFlRoWXZQrBNGrBZUM6HjosPIIgZOXR3bf8HQGB
 uhA25xPsohXZeQao+p2v1jvP6hoegY+wCfPOm8H4jJrAKy8p03UUzpNQCLQb5TUqjlxa
 AG5/7454+gBHR1K0P6LB54xQ41pXiPXZtyeWZGI6uLv5meUtJgTpZO96I8dXMjwHeYxe
 qHnQ==
X-Gm-Message-State: AJIora9HWSyTTT+EC0IqSfyYJbCslaYt/tjRn3TRid7CDjfR7wJBXnND
 sBMAaqBVWyUv7jmEU2G0DeDdtH1iGv7dbE1Za/TbAb3G57ceCh9STZJ8GwlqG11kmkHbrsx9mVj
 PkeVIFpPnz5uRAXA4vwvDQBObWBE2
X-Received: by 2002:a05:6000:1789:b0:21d:7699:3322 with SMTP id
 e9-20020a056000178900b0021d76993322mr15306712wrg.121.1657533342353; 
 Mon, 11 Jul 2022 02:55:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sUoQnaxehC5bwBf8TE/c0PA+vwUXBQpfOU8OfFOIGn9eHb6353YMogg5vCqq5MsdafNl8ujA==
X-Received: by 2002:a05:6000:1789:b0:21d:7699:3322 with SMTP id
 e9-20020a056000178900b0021d76993322mr15306691wrg.121.1657533342105; 
 Mon, 11 Jul 2022 02:55:42 -0700 (PDT)
Received: from [172.20.10.7] ([90.167.95.6]) by smtp.gmail.com with ESMTPSA id
 e4-20020a5d5944000000b0021d4aca9d1esm6328286wri.99.2022.07.11.02.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 02:55:41 -0700 (PDT)
Message-ID: <f97ce354-ac15-1455-9593-a93fc09a4605@redhat.com>
Date: Mon, 11 Jul 2022 11:55:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/11] fbdev/vga16fb: Auto-generate module init/exit code
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-4-tzimmermann@suse.de>
 <4eb5b59f-2cce-e9d2-a244-4cbe7686fa47@redhat.com>
 <8f90b0d4-5d8b-b06d-4736-7807e013ee7f@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <8f90b0d4-5d8b-b06d-4736-7807e013ee7f@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/11/22 10:01, Thomas Zimmermann wrote:
> Hi
> 
> Am 08.07.22 um 15:16 schrieb Javier Martinez Canillas:
>> On 7/7/22 17:39, Thomas Zimmermann wrote:
>>> Move vgag16fb's option parsing into the driver's probe function and
>>> generate the rest of the module's init/exit functions from macros.
>>> Keep the options code, although there are no options defined.
>>>
>>
>> Ah, I see now why you wanted to move the check to the probe function. If
>> is to allow this cleanup then discard that comment from previous patch
>> and I'm OK with the move.
>>
>> Maybe you could comment in patch 02/11 commit message that the check is
>> moved to the probe handler to allow this cleanup as a follow-up patch ?
> 
> Sure.
> 
> I mostly wanted to use module_platform_driver(). The options handling is 
> in the way.
>

Yes, I got it when looked at this patch.
 
>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/video/fbdev/vga16fb.c | 35 ++++++++++-------------------------
>>>   1 file changed, 10 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
>>> index f7c1bb018843..e7767ed50c5b 100644
>>> --- a/drivers/video/fbdev/vga16fb.c
>>> +++ b/drivers/video/fbdev/vga16fb.c
>>> @@ -1321,12 +1321,21 @@ static int __init vga16fb_setup(char *options)
>>>   
>>>   static int vga16fb_probe(struct platform_device *dev)
>>>   {
>>> +#ifndef MODULE
>>> +	char *option = NULL;
>>> +#endif
>>>   	struct screen_info *si;
>>>   	struct fb_info *info;
>>>   	struct vga16fb_par *par;
>>>   	int i;
>>>   	int ret = 0;
>>>   
>>> +#ifndef MODULE
>>> +	if (fb_get_options("vga16fb", &option))
>>> +		return -ENODEV;
>>> +	vga16fb_setup(option);
>>> +#endif
>>> +
>>
>> I would just drop these ifdefery and have the option unconditionally.
>> It seems that's what most fbdev drivers do AFAICT.
> 
> Or can we kill it entirely? There are no actual options.
>

That sounds good to me as well.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

