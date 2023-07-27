Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D4576572C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 17:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5102110E13C;
	Thu, 27 Jul 2023 15:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D9710E13C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 15:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690471018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pp7lX2S4BE1VOAd+Ohe4qOsAj8X9hgCenh8uffGy52U=;
 b=Jkyb2Zbfdmz31mw7R1OZoDzUAeMtT6Y+oO7v3dok5nI9Rs+r5eefqaXr4pfhQUW9Bm8sCY
 z+scWc6DZC0xKIQ/hkx7flxezC5xSqvnW1VCF8t4XfwON8uTAlp8iSD4bHk5ykfJqSYbQ9
 2EyD/McMmOeDIGaUIcXWa3cl8PNcT+8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-sUcA-8NpPZ2dcIydF6V6qg-1; Thu, 27 Jul 2023 11:16:56 -0400
X-MC-Unique: sUcA-8NpPZ2dcIydF6V6qg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3172a94b274so564856f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690471015; x=1691075815;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pp7lX2S4BE1VOAd+Ohe4qOsAj8X9hgCenh8uffGy52U=;
 b=d6osFj9/Hv6y992XD7AXNFR2oGi/pNEZDRMr0gOF7DMbVAAFy/0AON8GMgIGikDu7D
 2CftFVPyjM/Rj2DS9QHiPvxwxoT3qLAJi+HjPEewdAGbwxPmVs0eUSbqoMe6gDFi2Vr0
 iYMWB0Rna4riugyCd+7TgyiwqxU9JuH1CUj3oImLjFu1fAP/5MtXjiqb33kcBvqIGVQA
 1dGdXAaZvY0Gcdt57D0f8E9FrMQuHWqtDiX9Jeum3maxnmaW7LxTDWwFAyUiYmb1WXyT
 uePpEgWUa8Ms3PgAdzosOwRWLOGTAL68o6+MYsUvfmFMSaMY7/aV47LfXwDLCnj7NKtE
 bkMg==
X-Gm-Message-State: ABy/qLYi6861WgoWmLvI8AXjkN5JCV9A4gvF//LzJPdQ2uRC9J1sJe9a
 ORNiLnrYN90j1uw3yHatZ26GRIuY+lqPnI6QrMkGcdWHbzAHBvC9AuG4iPMtid572O2uTBun/R4
 nu0nfOKznZzfTXpYpqBi7aaVbhmkz
X-Received: by 2002:adf:fc05:0:b0:317:5de3:86fb with SMTP id
 i5-20020adffc05000000b003175de386fbmr1932626wrr.10.1690471015016; 
 Thu, 27 Jul 2023 08:16:55 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGFJTm1x26WKX+ZJ5GVgIV/5/cEhdRTj0qRIs77CCN9iPmG4jfZSNpagqJH+qPLWxdEJ7LocQ==
X-Received: by 2002:adf:fc05:0:b0:317:5de3:86fb with SMTP id
 i5-20020adffc05000000b003175de386fbmr1932612wrr.10.1690471014678; 
 Thu, 27 Jul 2023 08:16:54 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h18-20020adff192000000b003113ed02080sm2265368wro.95.2023.07.27.08.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 08:16:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ssd130x: Use shadow-buffer helpers when managing
 plane's state
In-Reply-To: <0ce32153-cfc0-e701-3863-803fcdb897ff@suse.de>
References: <20230727140453.577445-1-javierm@redhat.com>
 <0ce32153-cfc0-e701-3863-803fcdb897ff@suse.de>
Date: Thu, 27 Jul 2023 17:16:53 +0200
Message-ID: <87y1j1tme2.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi Javier
>
> Am 27.07.23 um 16:04 schrieb Javier Martinez Canillas:
>> The commit 45b58669e532 ("drm/ssd130x: Allocate buffer in the plane's
>> .atomic_check() callback") moved the buffers allocation to be done in
>> the primary plane's .atomic_check() callback.
>> 
>> But it missed that since the driver uses a shadow-buffered plane, the
>> __drm_gem_{reset,duplicate,destroy}_shadow_plane() helper functions
>> must be used in the struct drm_plane_funcs handlers.
>> 
>> This was missed because the mentioned commit did not remove the macro
>> DRM_GEM_SHADOW_PLANE_FUNCS, which leads to the custom plane's atomic
>> state management handlers to not be used.
>> 
>> Fixes: 45b58669e532 ("drm/ssd130x: Allocate buffer in the plane's .atomic_check() callback")
>> Reported-by: Arnd Bergmann <arnd@arndb.de>
>
> Reported-by needs to be followed by
>
> Closes: <url>
>
> where <url> would point to Arnd's bug report on dri-devel.
>

Ah, I thought checkpatch complaining about it but since we already add a
Link: with dim, didn't know what to add there. Makes sense to add Arnd's
report indeed.

I can include it when applying instead of posting a v2 if you don't mind.

>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>
> This looks correct now. Thanks for fixing this bug quickly. With the 
> Close added:
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>

Thanks and to you for pointing that out.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

