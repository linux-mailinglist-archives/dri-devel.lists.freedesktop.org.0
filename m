Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEBD575DC2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 10:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B38F11BB62;
	Fri, 15 Jul 2022 08:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FD411BB62
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 08:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657874825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PusCGOKcWdo5ysW1y6Id3FPNycuQJ4uUKA4l/F4Og4w=;
 b=jPdEePkwmp7SGUF+8j8dQ87Srl9t9CxE2HFGBPdh7XqigG6tMff8xGIXyQKQhUDZ+DvBWP
 RiD16qwrOr4fldAJAVGU1CSiDDDtc21XlpTKsU7PWGvi1iVICllmY95+Ln+QvcHCjrrHCG
 Vdq29YNqt47T2biMsmUYFbm1fSekkTo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-IDjFBfJbPPaWmZ55tcj2sg-1; Fri, 15 Jul 2022 04:47:04 -0400
X-MC-Unique: IDjFBfJbPPaWmZ55tcj2sg-1
Received: by mail-wm1-f69.google.com with SMTP id
 c126-20020a1c3584000000b003a02fa133ceso1717456wma.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 01:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PusCGOKcWdo5ysW1y6Id3FPNycuQJ4uUKA4l/F4Og4w=;
 b=3F3D4uuR8AOxlsljUss6iPvLPbXMSDtBdR7DZkrxHejtIUpL8nPHtge2x8Cnlw25VH
 DCusEBU8LFY29pfjHCBBhLh9LjD02uREiFFTXSdNULiXWDTG73H6aSykQqQzI8kYQjnp
 slSP5ZVycruXtz+ba6VVWIRCC9tbEwyp8HleyPW2J3XBuK0W3OdMO3B+z598g6LE1Snh
 72flojDt6ECNVLZkzoA+7WdQj4pux9SXW9CYoGm/ouzcUAihHkA7Vpr3z5164Z8PQr+W
 1UuSYUsQN7WrQ0oy39l7Hzp5ZcyIyfgecB4P9WuG/HLsu5Z0T0T+awJc277fbGzkbq3k
 EXNw==
X-Gm-Message-State: AJIora8mfgPZsOU6A9kfuxb3YHc4GAwAfilnonafrSjkVJSNAZ029NPq
 kls7Oxcv/7LcE0Wra3F81svI5hp1isOEZv+OZCaRDgHxvRQYBhRCqu8hOUVwD6AsaP3P3rh37gT
 qfWs2bLrifOdS2Gi9zBzHlphbTfWi
X-Received: by 2002:a05:600c:1d9e:b0:3a2:f365:29ee with SMTP id
 p30-20020a05600c1d9e00b003a2f36529eemr14470308wms.24.1657874818986; 
 Fri, 15 Jul 2022 01:46:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u7++4SW6ly5MZwBHSzTFCbQBJprcLXnGmZOlB79EP8gr8D1zrAOKBJLquWSPVKOhGHhq4heg==
X-Received: by 2002:a05:600c:1d9e:b0:3a2:f365:29ee with SMTP id
 p30-20020a05600c1d9e00b003a2f36529eemr14470297wms.24.1657874818791; 
 Fri, 15 Jul 2022 01:46:58 -0700 (PDT)
Received: from [172.20.10.7] ([90.167.94.22]) by smtp.gmail.com with ESMTPSA id
 l2-20020adff482000000b0021b9585276dsm3368152wro.101.2022.07.15.01.46.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 01:46:58 -0700 (PDT)
Message-ID: <612025e7-106d-683a-8ea4-5edc019ceeb0@redhat.com>
Date: Fri, 15 Jul 2022 10:46:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/2] drm: A couple of fixes for drm_copy_field() helper
 function
To: linux-kernel@vger.kernel.org
References: <20220705100215.572498-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220705100215.572498-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/5/22 12:02, Javier Martinez Canillas wrote:
> Hello,
> 
> Peter Robinson reported me a kernel bug in one of his aarch64 test boards
> and even though I was not able to reproduce it, I think that figured out
> what the problem was. It seems the cause is that a DRM driver doesn't set
> some of the struct drm fields copied to userspace via DRM_IOCTL_VERSION.
> 
> Even though this is a driver bug, we can make drm_copy_field() more robust
> and warn about it instead of leading to an attempt to copy a NULL pointer.
> 
> While looking at this, I also found that a variable in drm_copy_field() is
> not using the correct type. So I included that change in the patch-set too.
> 

Pushed these to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

