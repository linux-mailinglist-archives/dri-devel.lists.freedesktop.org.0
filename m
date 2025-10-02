Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D81BB2AD6
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 09:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B8510E795;
	Thu,  2 Oct 2025 07:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VZrM9fHT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8295A10E795
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 07:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759389503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=swyZi6awnmO5RiaAnGAjYKHP2JqeK0Fm7ds6C9onHkE=;
 b=VZrM9fHT2+H/3xVgaTf7OGhBjgh4NL6eAHg35tkKSV/eUccwbG2FBnsdpBm4HSg84W0qM4
 bUb9QITWoct14x/c1RmyWjfFg6yIfkcnwpvrU13qQelqrb030elAxelQz85nbLJq+vq+/f
 8tBtxiJfRQrkLO3bdndoCtdnFT/GTpw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-kmmdZ8FSN6aNWwN04vQnSA-1; Thu, 02 Oct 2025 03:18:21 -0400
X-MC-Unique: kmmdZ8FSN6aNWwN04vQnSA-1
X-Mimecast-MFC-AGG-ID: kmmdZ8FSN6aNWwN04vQnSA_1759389500
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-46e36686ca1so11795395e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 00:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759389500; x=1759994300;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=swyZi6awnmO5RiaAnGAjYKHP2JqeK0Fm7ds6C9onHkE=;
 b=MU3i+kqLhWGUMi7NpEAbdGYvyZGtOtbpCjODNKe40Pj0E9wOQUoAoewil3ngystn9y
 ukyCXfxqLL7mvRmrv0W/7DwgY6JsYtj7UVBLf86QxLMFZs2BURNTwAUxWpTNgvKU5pdE
 ioVC3MRHsEhq5fNJ9Kgvh+EZo16bhfMlIkAHQTl75mgd1CWsTaIWC3Fwfn7ALGuYIAkx
 xtAfTNdgOSQQ1aeDHOJbTOBX+dZsRSI/2WyhRc9xZGvZZSkpipNcVT8HssrUN1MCfzLU
 F+G4Ne9k93DRTVjyYr5AKjL3fgSbaV5OqEKtnu7nz7zD1vi74KVS31AZPqBi4B+xkKeM
 5HTg==
X-Gm-Message-State: AOJu0YzaGMactzKyDXJ/9Gt2oelfYbiN+zKuMp3ff7TfRRktOqz06GTE
 8D7CEaqgJ1MPLxLBJlEResCh6G0Xv7qbHvPq6xG03MRNn6Mm7sZKCHYJvJ+A9rmfZSfjV524+Aj
 2bUtUBr8kQQrJX9d5oNt/ixroFiAJrQLF7HnnARlprzcvKb7oYxzf+/LS1qs/WVWfZB7P0g==
X-Gm-Gg: ASbGncvtYxIKr3VVKrGM+2noQEAI9CRFnHh+X0JzhOapCcq5VoIhANMp3LhjPBsOQ5j
 NlZtFg8DVJITdY3Zr4Un5xLbyu0lwOu2U8f9NK5pEvgxljpycT1IT7AMY7GUfClGVibrboScNCD
 6DAIgZvt1TD85IrxHqSD5DI+4sALMGeOacEssjqBUP3WB7J0gdgyy3lJgYa9UErLUvwhPRXzvht
 4U5nqRB57mxBXVB898bHVSE5yESQR/vocohO7tvBr7RgK3JcPcdlhsyrszzclwX3nOpWxdYsrMJ
 mwdHv0T5CO/8mOjE9vgDxjMEIeCq1Q1C+cMQC9SwVffbL3pJvvpWZ/+z4gq2PiwwCQLVqzS+S6F
 g2qwTPyC8gFBZ6qalxxI/4O9aWPOB
X-Received: by 2002:a05:600c:4e8e:b0:45d:d97c:235e with SMTP id
 5b1f17b1804b1-46e6127a1a2mr51951585e9.12.1759389500346; 
 Thu, 02 Oct 2025 00:18:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNHH2bH9y5SpEFzNPxE7t3AzNB2zTXQWFjPSl+9Pu6fOziiwiBNOHN0F39U223H2afps1W7Q==
X-Received: by 2002:a05:600c:4e8e:b0:45d:d97c:235e with SMTP id
 5b1f17b1804b1-46e6127a1a2mr51951285e9.12.1759389499798; 
 Thu, 02 Oct 2025 00:18:19 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8acc4csm2320435f8f.16.2025.10.02.00.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 00:18:19 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Bhanu Seshu Kumar Valluri
 <bhanuseshukumar@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, khalid@kernel.org
Subject: Re: [PATCH] drm/ssd130x: Use kmalloc_array to prevent overflow of
 dynamic size calculation
In-Reply-To: <bfc90c7a-4ade-4bf0-88e3-86697e664e35@suse.de>
References: <20251002013312.67015-1-bhanuseshukumar@gmail.com>
 <bfc90c7a-4ade-4bf0-88e3-86697e664e35@suse.de>
Date: Thu, 02 Oct 2025 09:18:17 +0200
Message-ID: <87zfa94vra.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g24xtiK6bk4vTE06LWalQTrERxpDYVCGcNDdSbYSMX4_1759389500
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Bhanu and Thomas,

> Hi
>
> Am 02.10.25 um 03:33 schrieb Bhanu Seshu Kumar Valluri:
>> Use kmalloc_array to avoid potential overflow during dynamic size calculation
>> inside kmalloc.
>>
>> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
>> ---

The same patch was posted by another developer a couple of weeks ago
and is now queued already in the drm-misc-next branch:

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=940dd88c5f5bdb1f3e19873a856a677ebada63a9

>>   Note:
>>   Patch compiled successfully.
>>   No functionality change is intended.
>>
>>   drivers/gpu/drm/solomon/ssd130x.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
>> index eec43d1a5595..8368f0ffbe1e 100644
>> --- a/drivers/gpu/drm/solomon/ssd130x.c
>> +++ b/drivers/gpu/drm/solomon/ssd130x.c
>> @@ -1498,7 +1498,7 @@ static int ssd130x_crtc_atomic_check(struct drm_crtc *crtc,
>>   	if (ret)
>>   		return ret;
>>   
>> -	ssd130x_state->data_array = kmalloc(ssd130x->width * pages, GFP_KERNEL);
>> +	ssd130x_state->data_array = kmalloc_array(ssd130x->width, pages, GFP_KERNEL);
>
> The first parameter is the number of elements. The second parameter is 
> the size of an individual element. So the arguments should be swapped. 
> Same for the other changes.
>
> I know it's nitpicking, but who knows what it'll be good for. Fun fact 
> is that even kmalloc_array mixes up both parameters internally.
>

You are right. I didn't notice this subtlety when reviewing mentioned
patch that pushed to drm-misc-next.

> Best regards
> Thomas
>
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

