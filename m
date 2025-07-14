Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F618B044C9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 17:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB5A10E601;
	Mon, 14 Jul 2025 15:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QIbI0RF7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B09D10E5DB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752508453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fafrMpU6qWwGQeEh/ZULn8SQLSmZiDDyM4ZSSsSMLQM=;
 b=QIbI0RF7lZzJuh0eeRAhbFsxj1/QOGG584fSaCI6ljjdbsS1GHnIv1NKHCiAyYbsaZ3goZ
 NH5HvgfmYWOfu8ZhC4fRKh6wjtn6RSg7XyqYtvx1V+AY+a7MeNssYba5QbmdkzwZXn0dCF
 tu5bL0lir2XJSladuEEdchhMzyT1pOU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-ZlXbaC64O4CNNfqDAQ1rnQ-1; Mon, 14 Jul 2025 11:54:11 -0400
X-MC-Unique: ZlXbaC64O4CNNfqDAQ1rnQ-1
X-Mimecast-MFC-AGG-ID: ZlXbaC64O4CNNfqDAQ1rnQ_1752508451
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4560f28b2b1so6165195e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 08:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752508450; x=1753113250;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fafrMpU6qWwGQeEh/ZULn8SQLSmZiDDyM4ZSSsSMLQM=;
 b=q+tUS6fR4NHtjKDaECdg2oK+SkIUkYSGLae03TIY6TRxytxd+u46qghbznK96i3iSt
 6Kxnh2HuSiQXrCNBlifg2SEQiLs9tYC0WHA6Ctomj6UH6AUXf0z2k9Kzs25SNiBQxpoe
 2wmeUbXOrJKei0KNc8KGOObUFcUHu6dVd7Cae69dcHzdBjHvTMi9DGE/NXcTH9ACj1pL
 QvCvHSnNKmE3vDARe3NzcbOxUuYuqtzt/LVVbW413HThkmL9HpwOsqLB0nXh0OOyXYk+
 Jh0zUYFmLt2pxM6DpTeCgtGDcazhieNw2Fl8dx5v4iabUHsG0UktnDvgtWzxFUBHZDIl
 NFmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuiNt+FQ+gDqmM8q967305D3eMHwLmec/g7vCCw4hkXFzX8cSQZTfiV8r6Afzdg7SthOhNlPr1eiY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5YXcQt7W/YtTGQD6j8mcjGpyq2t+7TiZ0YA21wpCsxjWNgW1c
 mGrBTxPnui0SZwD3zxa0cPjBYMjpDfB8QGbcgJFjPMRrUqGI9acMyJH2vLfsiK7JmsPBO4GOHN9
 leO3RPPMnShXZShDfwu6ZHgkMv61zHQGS/eHpDNgNuqU/hRoPv+Hstcm9nJu0Ydf+2vRuLw==
X-Gm-Gg: ASbGncsPmwgc1hAMG3/Dvkg7aAVa4yAReTkPAn3yl7jk+RkALTn9lbZ/YI51mpQCW57
 UvgLwoMRZQ/VNuZ36Lo7JuMvNcMVGjxErCUbV4FbrtIDlyp8O2cojIa4GZYqxyFClRO0+ykMvLz
 kn9tv8BbgFYoGmRU/7M8HVbNAXimF0UMHh+1UFBitPMBcwkdHLUFX/4z16o4ik6yDJhOmowTKWI
 OJEdBfnN02WoNmPrAUwnWFEMRTDdoFNCrtM9MMblpvY2To1QC3BZwDHYDFJlAUBlEvzbX2NlpxL
 q0T7di47HxkM5tZJzljDNYXBFGQirQAkEmUSWE0vsN0Qf1kG1XGXEVhVV1uo8rJOqA==
X-Received: by 2002:a05:600c:4e03:b0:456:2142:7fa6 with SMTP id
 5b1f17b1804b1-45621428198mr29093865e9.12.1752508450417; 
 Mon, 14 Jul 2025 08:54:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCHe6mq8+XZn09BZU3bdrlf7cL8nFRYa64ZMeYLY281d4Q1xY8HGui6z7vV3S6rkcrDKdxyw==
X-Received: by 2002:a05:600c:4e03:b0:456:2142:7fa6 with SMTP id
 5b1f17b1804b1-45621428198mr29093445e9.12.1752508449939; 
 Mon, 14 Jul 2025 08:54:09 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560ddf5e0esm70962005e9.18.2025.07.14.08.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 08:54:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-kernel@vger.kernel.org, ipedrosa@redhat.com, David Airlie
 <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/5] drm/sitronix/st7571-i2c: Fix encoder callbacks
 function names
In-Reply-To: <aHTy3tbDKA0QVqBt@gmail.com>
References: <20250714104421.323753-1-javierm@redhat.com>
 <20250714104421.323753-2-javierm@redhat.com> <aHTy3tbDKA0QVqBt@gmail.com>
Date: Mon, 14 Jul 2025 17:54:07 +0200
Message-ID: <877c0a22g0.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: poZmWdlzos6KRZf2cApiLG3bKAcs6ZGSysZ7jc6_qlo_1752508451
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

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

Hello Marcus,

> On Mon, Jul 14, 2025 at 12:44:00PM +0200, Javier Martinez Canillas wrote:
>> It seems the driver took some inspiration from ssd130x and some of the
>> functions (encoder callbacks) were not renamed to use a st7571_ prefix.
>
> Outch, shame on me.

On the contrary, I'm glad to know that the ssd130x driver was useful :)

>> 
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>

Thanks for your review!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

