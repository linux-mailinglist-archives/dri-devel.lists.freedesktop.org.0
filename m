Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 771CA4FF328
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 11:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354D910FFB3;
	Wed, 13 Apr 2022 09:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F0E10FFB2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 09:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649841374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xTXTo1j2VUzZu94UXW2jvU9sHQZzZe8BCpBqmf/05N4=;
 b=CsYYfNUXLVVfy2hkN1e7Yg6w1SZt1Gvh8ARQ+VNA1W9Qp4C4wOsm7gh9R9fO2FP/r2/f7Y
 Ukp4j3BAcTPt/vxB0ZUBt01CuTWV2hxHMIsxNBbL/egqsNuIdhnb89J4LVp+jMywE3/DRV
 mfPz29snXsa5ipYv7O/NaNA+q66lBdk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-QwSLayXRPjOzcwVp8kokKg-1; Wed, 13 Apr 2022 05:16:11 -0400
X-MC-Unique: QwSLayXRPjOzcwVp8kokKg-1
Received: by mail-wm1-f70.google.com with SMTP id
 r132-20020a1c448a000000b0038eaca2b8c9so203054wma.7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 02:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xTXTo1j2VUzZu94UXW2jvU9sHQZzZe8BCpBqmf/05N4=;
 b=pLrmisfXoAHqlq5dyxXRkDkNKfKscCYZPZV29GsQcdvf6npoHv4+EBsBwFjqgZQn5X
 qrUuXyEUCmf9/V8ANRWTpqtzl0hixR8XH/RpA6lbaCHjY0Woj/1xNFLtR5UwgvIJq9Jr
 76TOP3HZbYwq7Vf17K1mC7wzy3bETryyuNpuNc8wrpdPViaWD+hs/Q25Mvp1TekQU27Q
 spsHQ8XmV6CXJPuO69zELbfFbsluyYNOUAXzRoMLHrBiveXY/6cW3ix4GL44hxHFWxhn
 UvDTIf7+5qD1CxnfQnZ9/Cf1UbRqfaTwLhQkUjliB9VWwxzSaBQxcQ7hNUXBpUlTLw87
 Tc8Q==
X-Gm-Message-State: AOAM531S/5QEipp4OvjMXnqb7gpMo4JyjEcumzHAYY68i4PTChvZbuFl
 u9vlYUTRDCX3HX1Cr/6zXni5CoYe92c+8u20tNOoy5F5AQ+8+ydQj3OzGcwBqpa/QHpDIBj2ZXz
 o5xT/9PKlqLCr2uEOV+FFGsZ8o2hj
X-Received: by 2002:a05:6000:1a87:b0:207:84f5:910c with SMTP id
 f7-20020a0560001a8700b0020784f5910cmr24438302wry.213.1649841370604; 
 Wed, 13 Apr 2022 02:16:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySRabLECdiItraTQv0py5YvPUKpfTU2p6RY/EGuaFBjLkXKvBBb/NmgSnN7ZPDhTTGz+S+cQ==
X-Received: by 2002:a05:6000:1a87:b0:207:84f5:910c with SMTP id
 f7-20020a0560001a8700b0020784f5910cmr24438275wry.213.1649841370344; 
 Wed, 13 Apr 2022 02:16:10 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a5d64e7000000b00204a13925dcsm33593418wri.11.2022.04.13.02.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 02:16:09 -0700 (PDT)
Message-ID: <955400a5-a785-57af-92d4-42710c55ce99@redhat.com>
Date: Wed, 13 Apr 2022 11:16:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] fbcon: Fix delayed takeover locking
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220413082128.348186-1-daniel.vetter@ffwll.ch>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220413082128.348186-1-daniel.vetter@ffwll.ch>
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
Cc: Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Zheyu Ma <zheyuma97@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Nathan Chancellor <nathan@kernel.org>, Claudio Suarez <cssk@net-c.es>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Daniel,

On 4/13/22 10:21, Daniel Vetter wrote:
> I messed up the delayed takover path in the locking conversion in
> 6e7da3af008b ("fbcon: Move console_lock for register/unlink/unregister").
>

Maybe a few more words of what the issue is ? Something like the following:

If CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is enabled, fbcon take-over
doesn't take place when calling fbcon_fb_registered(). Instead, is deferred
using a workqueue and its fbcon_register_existing_fbs() function calls to
fbcon_fb_registered() again for each registered fbcon fb.

This leads to the console_lock tried to be held twice, causing a deadlock.
 
> Fix it by re-extracting the lockless function and using it in the
> delayed takeover path, where we need to hold the lock already to
> iterate over the list of already registered fb. Well the current code
> still is broken in there (since the list is protected by a
> registration_lock, which we can't take here because it nests the other
> way round with console_lock), but in the future this will be a list
> protected by console_lock when this is all sorted out.
> 

[snip]

>  
> -/* called with console_lock held */
>  void fbcon_fb_unbind(struct fb_info *info)
>  {
>  	int i, new_idx = -1;
> @@ -2822,7 +2821,6 @@ void fbcon_fb_unbind(struct fb_info *info)
>  	console_unlock();
>  }
>  
> -/* called with console_lock held */
>  void fbcon_fb_unregistered(struct fb_info *info)
>  {

Removing these comments feels like should be in a separate patch or at least
mention in the patch description that should had been removed in the commit
6e7da3af008b ("fbcon: Move console_lock for register/unlink/unregister"),
that made these functions to be called without the console_lock being held.

The changes themselves look good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

