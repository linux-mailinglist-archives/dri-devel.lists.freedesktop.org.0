Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B37651E27
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0CA10E0A1;
	Tue, 20 Dec 2022 09:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101BF10E0A1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671530240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zR3NMVKBvjI/Fvz5cz8ZGpP1GVWOvCWnnAnJEkm9Lyc=;
 b=YQbNtg5sHPese9SLj08mepOoq3AFHGy06WCHdzoBVzgqFMyuxCIi07/N8/9nGy2srqPJ3v
 ahbD2tRgem1joVplAUxwW5XBUgU0jy47G1/bfXIxSJIk9NmG9yb4KPKO8MlszQytKK79dm
 tgvxEv256rGNQQyowLmvIV7eII1xI5U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-32-z3Zoeh3hMrag4mP9ThaWLg-1; Tue, 20 Dec 2022 04:57:18 -0500
X-MC-Unique: z3Zoeh3hMrag4mP9ThaWLg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m38-20020a05600c3b2600b003d23f8c6ebdso391734wms.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:57:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zR3NMVKBvjI/Fvz5cz8ZGpP1GVWOvCWnnAnJEkm9Lyc=;
 b=IZNwyZeM/vuU99RY2TF4pyfl6zYDtw5K9aJmjj52t0yv9cKO+F4JGkCKApoQFaOiqx
 iQIW+yu+efZ3dkPj8/V8mqE5vVMP/5Wqotx9nVQFuwpIa1EEs/W2teMR2+8Wrsgdu7dI
 bqLIB0wi2oibnx1nu2R2CCvnaSQKcBHVJJHKgZMQRMgfboe2N7GDuE2seD6osEOF2W46
 T9ELHjjwuaqib7I1Pr95aiSxx7qVdTR8HqNqTJ+KIEICY6lLH+faiuWLc12SpDaDV30q
 iNRHM1WpA/cSdn1XRxV/h4QpWVRWH5nD8OzrfS9vd6z1rrSdUwcrVKqmhSFJbnL9TTCi
 hhBQ==
X-Gm-Message-State: ANoB5pnZHnOvUBAJMPQFU1up7Q0VMZuzRO8/ncelygUU1Y5rGTppwBSf
 elGi8uxRoff9ZNJ+tp4pTKZLr7S9MPKFDnlZKSdxthgmbmxHyCBa0j+obWYxvwaivXtwvCdAyhj
 UTdoxNoDwELSJfDK763puMV34nKCI
X-Received: by 2002:a5d:6890:0:b0:242:661b:a20 with SMTP id
 h16-20020a5d6890000000b00242661b0a20mr35745375wru.20.1671530237828; 
 Tue, 20 Dec 2022 01:57:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6JPMUHl7uM6zh/rUkEAM4pTMPxDqka9Nrm0jCwHQupJ0YXx5LY/m/SdGP2/SdhmzpZ5Bzfxg==
X-Received: by 2002:a5d:6890:0:b0:242:661b:a20 with SMTP id
 h16-20020a5d6890000000b00242661b0a20mr35745363wru.20.1671530237626; 
 Tue, 20 Dec 2022 01:57:17 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c18-20020adfa312000000b00228dbf15072sm12764865wrb.62.2022.12.20.01.57.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:57:17 -0800 (PST)
Message-ID: <6069abcc-d81a-bb94-e603-e93baa64947b@redhat.com>
Date: Tue, 20 Dec 2022 10:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/2] fbdev: Don't return value from struct
 fb_ops.fb_release
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 airlied@gmail.com
References: <20221216174633.1971-1-tzimmermann@suse.de>
 <20221216174633.1971-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221216174633.1971-3-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/16/22 18:46, Thomas Zimmermann wrote:
> Change struct fb_ops.release and its implementations to not return
> a value. Returing an error is not necessary and callers of the
> function ignore it. It is also good practice to make clean-up code
> unable ot fail, as such failure cannot be handled.

typo here "to fail", but I think that you can just fix it when applying.

>
> In several places drivers tested for the correctness of the internal
> reference counting and failed silently if the counter was incorrect.
> This would be an error in the implementation, which would require
> fixing. So change these tests to return no error, but print a warning.
> 
> v2:
> 	* update omapfb2 (kernel test robot)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

