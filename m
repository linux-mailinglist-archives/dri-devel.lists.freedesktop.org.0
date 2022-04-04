Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B34F84F18DB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 17:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3B510E0A6;
	Mon,  4 Apr 2022 15:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED2110E0A6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 15:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649087479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ztkMzR6AFKFUbWj3TFBCPhwIkZT9lK3mwv6qAxrBqJQ=;
 b=JBDUJ1GxCHT9QCr1f/s65/VverP7Qll7hY9l5L2xvyGPwopde+Bx/0mU720r9AKap2Yay3
 5MJbEwLxhZny7LkwBR6otjVP6GFO4j5oB0IdvqAkIgqdK4wWY9wVYykMW9WljiQvEWq3R8
 z34xRJK+pMmEfKqkzfXjE54R2Zx4L/g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-87qo77jROkmt6osAk0yvYg-1; Mon, 04 Apr 2022 11:51:18 -0400
X-MC-Unique: 87qo77jROkmt6osAk0yvYg-1
Received: by mail-wm1-f69.google.com with SMTP id
 189-20020a1c02c6000000b0038e6c4c6472so2896734wmc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 08:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ztkMzR6AFKFUbWj3TFBCPhwIkZT9lK3mwv6qAxrBqJQ=;
 b=NE3lN4bClL5ToCvpILLqsuSLBqRnFN7c7w32TWOI+p/WHQ3f2NC00iCBt0tIBMs2mc
 eQNeqKEkToP2QYui0aNX9LNXSPUgEymZXhlsSkY4vfj0GtixYzlIbZcUkfDIc514592w
 b8nCXJIVFf9hNbTyGrgdW5wMu9VFBR2LPLwmT1eqxYn9Vl7KA1yTE6gfTIAEi3IPObcL
 barcKY2bEacndGW1WocK7ahdgNkvQDaapWyavmsMLxr/Db4D+KTk5vhEIswDRlv+d2uf
 WwMwYrjlE6pvhGvZIfGXXcKqkCGeb1oSR72dDnoIZNODB7X4SfAfvDHJ1+oRP7NDVGLX
 TKbQ==
X-Gm-Message-State: AOAM5310jWxUIuvdSamJM/PljykeYcl38NGHVakN7HzfLV4w5SXtGYZU
 9/aqmrfdws1VZ84/LNKucnF2Bsp25f91payAZGPf+8DcL2FXNjnYgPdV8rrnBbvjAYxkQL8Sqdg
 fmIANRVl4migGfyHeCU409rjqwbnO
X-Received: by 2002:a1c:7204:0:b0:38e:70f4:edf1 with SMTP id
 n4-20020a1c7204000000b0038e70f4edf1mr171676wmc.18.1649087476771; 
 Mon, 04 Apr 2022 08:51:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqPFQoBH+n99pHf4G9kdT6j9HVXw0NXVS9LNUOgzNhNzUFeYqWv2Xi/awInhum+eCt95wBfA==
X-Received: by 2002:a1c:7204:0:b0:38e:70f4:edf1 with SMTP id
 n4-20020a1c7204000000b0038e70f4edf1mr171657wmc.18.1649087476512; 
 Mon, 04 Apr 2022 08:51:16 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 w12-20020adf8bcc000000b002060e3da33fsm4500411wra.66.2022.04.04.08.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 08:51:15 -0700 (PDT)
Message-ID: <bf917bf0-a380-6689-95cd-77ff0317f578@redhat.com>
Date: Mon, 4 Apr 2022 17:51:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] drm/format_helper: fix a kernel-doc typo
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20220403232902.1753-1-rdunlap@infradead.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220403232902.1753-1-rdunlap@infradead.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Randy,

On 4/4/22 01:29, Randy Dunlap wrote:
> It looks like the incorrect name of a function parameter was used
> in the kernel-doc notation, so just change it to the function's
> parameter name to quell the kernel-doc warning.
> 
> drivers/gpu/drm/drm_format_helper.c:640: warning: Function parameter or member 'vaddr' not described in 'drm_fb_xrgb8888_to_mono_reversed'
> drivers/gpu/drm/drm_format_helper.c:640: warning: Excess function parameter 'src' description in 'drm_fb_xrgb8888_to_mono_reversed'
> 
> Fixes: bcf8b616deb8 ("drm/format-helper: Add drm_fb_xrgb8888_to_mono_reversed()")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> CC: Maxime Ripard <mripard@kernel.org>
> CC: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_format_helper.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Thanks for the patch.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

