Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4681E4D19F0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 15:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8D410E297;
	Tue,  8 Mar 2022 14:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE6710E297
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 14:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646748190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Dzu4ZGhznD+vnjXkLEQx87HJellkHDrk7AUKJZCM5U=;
 b=eSKgwLVRiVps8qF/SJKTsfKfG0iqYDjDe+wt1nTqFvWuEo46x0G+UnxZKBDO0pK1YBjhTh
 UO1CZFv6YVBCfzWv2YeTvNdtPRkq3jZl4QBBYY6zM77GFXPti5vL51czhtEMQo7l2DiMlZ
 ll34TGn3giUVCgZuaK4m44UiLZ1SkVU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-Sa9DJX7cO42CEAS2-x4ODQ-1; Tue, 08 Mar 2022 09:03:09 -0500
X-MC-Unique: Sa9DJX7cO42CEAS2-x4ODQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 l13-20020a7bcf0d000000b0038982c6bf8fso1140461wmg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 06:03:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3Dzu4ZGhznD+vnjXkLEQx87HJellkHDrk7AUKJZCM5U=;
 b=ToHLr2AwQyG+cejpVvpFhVH7KJrq2UaMbp7cGKQwV3N1kQNUf7wl0TD1P9Bag9ncDI
 drmClxIHjdfZuhPUmzSDdQ0KX1jSiZs06Y+3dAHk2JWRUGeb9eeziPTfnZw2h2WZAjL4
 aol/VeCSzMBYorEhwJsXfD2uzolw4lARKwW5sculcYK9FXRSOB8EKnJmYQOOcrQz/3LR
 5nwtLauJgmgcNsMtKB/1DKkAY2BmqYrlDisq8Dd9s8WSlAuz1idIwStHVbMIkH5PtyWh
 oOJzgPqR1h+BO+y6OkajWLEol5ayCf2iyY+wSZB5zUzq0RAokQF616it3mpUTxNch8oW
 dvVQ==
X-Gm-Message-State: AOAM532R2V9NfU69Bst6pZES5ke+i3iq1ILKYY8zPqwQk7dqluKjkaXG
 1T3a5dGZKMXcLmunHR66MyFz9w7oyFX3j7y+IYnkIaERcPL326p3Ks2qcJMLIEgssGC7WBGsBtu
 z5VkgQcdxTLvnBw4BWm2u0G1egTVN
X-Received: by 2002:adf:f3c8:0:b0:1ed:9cd9:5bf with SMTP id
 g8-20020adff3c8000000b001ed9cd905bfmr12659038wrp.380.1646748187864; 
 Tue, 08 Mar 2022 06:03:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxogP0qcX9WvYmcZuOA2yQ1VCsQNTVMYLXKzqTJIVl+GOcCr21I1GVI53FfWHW0LpykdInMXA==
X-Received: by 2002:adf:f3c8:0:b0:1ed:9cd9:5bf with SMTP id
 g8-20020adff3c8000000b001ed9cd905bfmr12658993wrp.380.1646748187327; 
 Tue, 08 Mar 2022 06:03:07 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a5d5091000000b001edb61b2687sm22575314wrt.63.2022.03.08.06.03.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 06:03:06 -0800 (PST)
Message-ID: <20e481be-3f2f-aad2-1b9d-9218320263b0@redhat.com>
Date: Tue, 8 Mar 2022 15:03:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/9] fbdev: Put mmap for deferred I/O into drivers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220303205839.28484-3-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/3/22 21:58, Thomas Zimmermann wrote:
> The fbdev mmap function fb_mmap() unconditionally overrides the
> driver's implementation if deferred I/O has been activated. This
> makes it hard to implement mmap with anything but a vmalloc()'ed
> software buffer. That is specifically a problem for DRM, where
> video memory is maintained by a memory manager.
> 
> Leave the mmap handling to drivers and expect them to call the
> helper for deferred I/O by thmeselves.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[snip]

>  
> +	/*
> +	 * FB deferred I/O want you to handle mmap in your drivers. At a
> +	 * minimum, point struct fb_ops.fb_mmap to fb_deferred_io_mmap().
> +	 */
> +	if (WARN_ON_ONCE(info->fbdefio))
> +		return -ENODEV;
> +

Maybe part of that comment could be printed as a WARN_ON_ONCE() message ?

Regardless, the patch looks good to me:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

