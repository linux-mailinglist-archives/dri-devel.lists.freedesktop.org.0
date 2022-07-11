Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 323E956FF76
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 12:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955E88DB33;
	Mon, 11 Jul 2022 10:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C478DB33
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 10:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657536640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fJygbU8DB1FiBG5kEv9BqrgeJXrXPjMOQW0TEO91yo8=;
 b=PQQwDvheedgholVZZTuChmWdkdevqtmMD6/AAwrnRKhaFEzjbkw1JgACfaUPU8lPmJjEUo
 dAr9P9GGGJ/GkEaw4BPn7ZPIpsrCJN2uF0EsgWgIl/41UXb7D+yrDkkdSySF0F2tGXf2SE
 xhxnEq3YpoEXzZuyZM8j199j94uy58g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-X9fnyEIuNa6TLB2KOHVH9w-1; Mon, 11 Jul 2022 06:50:38 -0400
X-MC-Unique: X9fnyEIuNa6TLB2KOHVH9w-1
Received: by mail-wm1-f69.google.com with SMTP id
 c17-20020a7bc011000000b003a2bfaf8d3dso2594376wmb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 03:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fJygbU8DB1FiBG5kEv9BqrgeJXrXPjMOQW0TEO91yo8=;
 b=Fkthij1/zRVQCYGltrb1r47H0to35ejO5apsQwHXKeyzi6LpspVM14DK3QV3CNHoGe
 N3WNAnAFfaBQ0eNHC9GH8I45ZEisZ2CVyKV8nJyiNe7wimpMQwiPmyE0jaDlGCfngSBW
 0X9lr0KPy0SwFjqLHqiLdxFycjUy5hEX+d1cnrhx0vdBF6RYTEdAVDAX84N9ZlAX/Dzx
 0rSVyR/SlGKDNTJkNIvwfzEgcfFgHgx0wGg8mW0+CU6uKQS6NS5oC3lJL7JTbQH+kvV5
 G6lieLAvNH6AaRtDF7A+ucbZxgnBosdI0u5m/OLOedbJPTL+bmo14jL5Or0BJtZZT9ur
 EUEw==
X-Gm-Message-State: AJIora/iOqAbxPfDaEH7vZosDt73FvAVKw0LpLw9k5vfLzOs1Ugm17WN
 Sl22Kl3NuHUpXJjnvIJY/VOGRRmltT9JJxtJ+QgA2HfoVwEJQILa67uffDtQJvOo3RatBXbR+nJ
 sFwKwPJ19GGXLgct/CTmwVXzuEcN5
X-Received: by 2002:a5d:6e03:0:b0:20f:ca43:badc with SMTP id
 h3-20020a5d6e03000000b0020fca43badcmr15688993wrz.547.1657536637586; 
 Mon, 11 Jul 2022 03:50:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sqrhuJBI2xK3PCG7LV6zpLGuGhwp9soZtin6v+gEj3U32QOjYtCPeSaN3ySxWPQEOj9vpEqQ==
X-Received: by 2002:a5d:6e03:0:b0:20f:ca43:badc with SMTP id
 h3-20020a5d6e03000000b0020fca43badcmr15688976wrz.547.1657536637359; 
 Mon, 11 Jul 2022 03:50:37 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c1c8500b003a047f64496sm6509025wms.7.2022.07.11.03.50.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 03:50:36 -0700 (PDT)
Message-ID: <b499ad15-e681-1f2c-dc11-2d94c1066ecd@redhat.com>
Date: Mon, 11 Jul 2022 12:50:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/11] fbdev/vga16fb: Create EGA/VGA devices in sysfb code
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-3-tzimmermann@suse.de>
 <fec8dcc1-c490-3bb6-2d2f-805d690d3f95@redhat.com>
 <95302954-76bc-3da6-70ad-25a8a22a37f0@suse.de>
 <253d0bea-f197-4208-b5e6-39c22ab91833@redhat.com>
 <fafde6fb-17ee-1c18-9e5f-96e60a08d98e@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <fafde6fb-17ee-1c18-9e5f-96e60a08d98e@suse.de>
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

On 7/11/22 12:42, Thomas Zimmermann wrote:
> Hi Javier

[...]

>> That's why I think that "vga-framebuffer" as driver name would be misleading.
>> Specially since it would also bind to the "ega-framebuffer" platform device.
> 
> I messed up device and driver name, such that misunderstood your remark.
> 
> As we use the id_table field for matching devices, the driver name 
> doesn't matter. [1] So let's keep the driver name as vga16fb. The change 
> above must have been left over from an earlier prototype patch, I guess.
> 

Agreed. The driver name is used as the last resort to match a device
only if there isn't any device ID table (ACPI, OF, platform, etc) but
that's discouraged. Specially when the same driver supports different
devices as it's the case for this driver.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

