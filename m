Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93115582320
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 11:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F072C3B5C;
	Wed, 27 Jul 2022 09:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3890C99107
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 09:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658914235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WnlbuoDO11+s0PkrtymLUg/RTeerO1YGjIAWzaLsXI8=;
 b=X+HjE5/5U5dFNSc/6+m12PsonTOslOScuaRhKjoGhswBkHnwcEQq2RmhHXUYZCrJUYDa67
 Y/LULsgoXK9IOVh7nXEnMbbWQ84ni1AXkNDdzs9vZ3103wpx83aedcnMoQDBMsVos6CiBZ
 qKDIvbx3TTMP0gz69c2Vq/ajyHWh85c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-zr3hvvjvNOqNJKNBzLc4JQ-1; Wed, 27 Jul 2022 05:30:34 -0400
X-MC-Unique: zr3hvvjvNOqNJKNBzLc4JQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 h18-20020adfaa92000000b0021ec200d50fso488628wrc.14
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 02:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WnlbuoDO11+s0PkrtymLUg/RTeerO1YGjIAWzaLsXI8=;
 b=mY+HdjjAY7kSNplE5NgiYL8yxVNMYPp6Sb0VBzlGVnXkV7LBsNHIKePv1GLS88OJR4
 FiwKqtpIDbvEl1+KOdMY7G0CvtkoZ9vjbn4DDuNPFrwKovozprsic15xkh9rruAIxgP3
 gM6fVq7TIhAvq3sNPePivoxgGdYHxnwAQh7K/+FC3kLzg4ojftD3KhZCeT/HIm6J3HiJ
 w/gnQK0qbZV8YiMNrYAxz0YMc946vzlQ0aTXoEUe/E5oRn3TEThIgT1x3Flhb7pIQAPO
 0VTD0/YXIDJSntowwuNiaYH/1WRC5dGt4AHh3gYXVB4xNgugYf1U26w2jvzKPLJV72Xl
 lEQw==
X-Gm-Message-State: AJIora9iylxktTeyeQVht22KQLj5gyXVtZrDcyVUWmeLtUdynSgoozGw
 j82scMb9fe1LMcTCjI7ZXtDwuhax9cyWxBKfcehZzymbMLj+mE2w/gqd1zvvD669jkjuwzd5jig
 FjFCyLtpOvOZcGRI9PC5SKTYQn0M8
X-Received: by 2002:a05:600c:41c6:b0:3a3:4cab:74c1 with SMTP id
 t6-20020a05600c41c600b003a34cab74c1mr2242280wmh.175.1658914233593; 
 Wed, 27 Jul 2022 02:30:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uXQimwmNj3iiuQIjR5+7GqsX0PKlNmy42WJ5vwSnDC//JqOwhL7VkEb/l38nriYGA+tApYpA==
X-Received: by 2002:a05:600c:41c6:b0:3a3:4cab:74c1 with SMTP id
 t6-20020a05600c41c600b003a34cab74c1mr2242250wmh.175.1658914233261; 
 Wed, 27 Jul 2022 02:30:33 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w6-20020adfec46000000b0021ed0202015sm1037150wrn.10.2022.07.27.02.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 02:30:32 -0700 (PDT)
Message-ID: <123b9590-8a5d-70b3-b27b-59e71d4cf6da@redhat.com>
Date: Wed, 27 Jul 2022 11:30:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 02/10] drm/simpledrm: Inline device-init helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-3-tzimmermann@suse.de>
 <be24a47c-c41a-411a-da63-c699b53cb459@redhat.com>
 <314820f8-3609-9182-97eb-ee30e240d114@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <314820f8-3609-9182-97eb-ee30e240d114@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 7/27/22 09:50, Thomas Zimmermann wrote:
> Hi
> 
> Am 25.07.22 um 17:01 schrieb Javier Martinez Canillas:
>> Hello Thomas,
>>
>> On 7/20/22 16:27, Thomas Zimmermann wrote:
>>> Inline the helpers for initializing the hardware FB, the memory
>>> management and the modesetting into the device-creation function.
>>> No functional changes.
>>>
>>
>> Could you please elaborate in the commit message why this change is
>> desirable?  Without this additional context, this feels like going
>> backwards, since you are dropping few helpers that have quite self
>> contained code and making simpledrm_device_create() much larger.
> 
> To clarify: I want to make the init code more easy to follow. These old 
> init functions still had to be called in the right order as each > possibly depends on settings from the others. It also feels like it's 
> easier to extract common code for ofdrm. And the pipeline is static, so 
> it doesn't require complex chains of helper calls. Having everything in 
> one helper seems beneficial. (It's a trade-off, I know.)
>

I see. That makes sense to me. Could you please add the explanation to
the commit message ? And feel free to add my Acked-by for this one too.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

