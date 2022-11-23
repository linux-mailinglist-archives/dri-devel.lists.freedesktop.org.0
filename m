Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C866635364
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 09:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290FE10E521;
	Wed, 23 Nov 2022 08:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1642010E521
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 08:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669193756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UGu/XnnhS/ATfPyaxajSn+lj2gjOs1uPrTPnxwIJ1IE=;
 b=ejglCZzYTrcnuwgDuWq/f2XdLGLw/xxkqyHK1oDZcA7HXJXoU4xyqv9K9HQU4TTD/aJnX4
 /HG2kch80lQAUkF9kz5OX/IN0asM46u4w/USFrDsKIfU6+Xwm2NGHSuQwUaKT5OCutLM79
 HFsvWueV7JkSjWpZ1SpwlGV3y9iJXqg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-3-M8WXHrKWPjyJRXwsjVzsug-1; Wed, 23 Nov 2022 03:55:54 -0500
X-MC-Unique: M8WXHrKWPjyJRXwsjVzsug-1
Received: by mail-wm1-f70.google.com with SMTP id
 f1-20020a1cc901000000b003cf703a4f08so571458wmb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 00:55:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UGu/XnnhS/ATfPyaxajSn+lj2gjOs1uPrTPnxwIJ1IE=;
 b=IJ72wYSzjsijU3P/ieN/xbbhkTz8aZYFcb8xTcAZvv+ehrAQFseQehtgaRTmRdYxR8
 fEzCWEg2zgy/KmjudtLtOs9F6UWMe112ufEtJRsZQPLMA1zA4Ym0v/hn9zICg47b2w/D
 GGCqP0lTr7OGj/yD/6hJc5lB6jUpr2yxTt+o9VWKkMzwx+A18TlGy3SoPjFjCUDXjikz
 EtdKc97QIoIg5a/kEZb+GcFB6HC8KypPn40q/iAkpvsHn3TdEm6Q/xCUnEK0QcWLNfqy
 er3DT5s9EXosfimXFNuHSk4V1l9Rw6AJ4THPVoDf65rQaeLtGyZ/FWLOeQzsda80w+h3
 xvkA==
X-Gm-Message-State: ANoB5pkNQIrBBMnxDIQGVDFoKT1+rD7ydinX04PuaTUrI4t9fN41FLPK
 FPImtSEuxIqxLagpzuENrhqtnWmu2MZK4/8RBRTgQjqfoHgd4aPtpc9RzLFj2tS9LBj0CLysOpM
 2YQ7KIQWBGk8io4K2X3y9RZTTugp6
X-Received: by 2002:a5d:6e0e:0:b0:22e:ed53:771c with SMTP id
 h14-20020a5d6e0e000000b0022eed53771cmr17127558wrz.297.1669193753482; 
 Wed, 23 Nov 2022 00:55:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7e2Y/3iFHR1gbkPMZPNiTzpmINtmsuX3o4oVuKVZiPsl9gCKhvj4D/7JeNWx2ud7PsoX/CRA==
X-Received: by 2002:a5d:6e0e:0:b0:22e:ed53:771c with SMTP id
 h14-20020a5d6e0e000000b0022eed53771cmr17127547wrz.297.1669193753304; 
 Wed, 23 Nov 2022 00:55:53 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t187-20020a1c46c4000000b003cfa622a18asm1532441wma.3.2022.11.23.00.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 00:55:52 -0800 (PST)
Message-ID: <8b739642-66c1-41f8-906d-e013c1c1297c@redhat.com>
Date: Wed, 23 Nov 2022 09:55:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 6/6] drm/gud: Use the shadow plane helper
To: noralf@tronnes.org, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@kernel.org, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
 <20221122-gud-shadow-plane-v1-6-9de3afa3383e@tronnes.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221122-gud-shadow-plane-v1-6-9de3afa3383e@tronnes.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/22/22 21:58, Noralf Trønnes via B4 Submission Endpoint wrote:
> From: Noralf Trønnes <noralf@tronnes.org>
> 
> Use the shadow plane helper to take care of preparing the framebuffer for
> CPU access. The synchronous flushing is now done inline without the use of
> a worker. The async path now uses a shadow buffer to hold framebuffer
> changes and it doesn't read the framebuffer behind userspace's back
> anymore.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---

Patch looks good to me. But it would be good if Thomas can double check.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

