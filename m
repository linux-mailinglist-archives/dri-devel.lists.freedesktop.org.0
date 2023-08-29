Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C61B78CEAB
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 23:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E0810E497;
	Tue, 29 Aug 2023 21:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E26710E497
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 21:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693343792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MsrqElhKNPNFgbdwVrAQrRLanlnRhnvN8+BVbNKQ4M0=;
 b=IG5K4M/LAMhcd9MOQf8SyGeowDmBqHjtasgoOuNji3J2XR78K6uRkNfkAWGQsCX9wfChl+
 mnZU7wsiq+BgR+Z/6rb4cEmV7VFQWkm0UYj3JPmCNcrZGfYOdkQ+NjlbDBPes9w6r/OIAR
 zphTD22BBbGQrW5RYunIh0kKBx4Xf9A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-NP8z8QNUNnaVcCK0uh1PAQ-1; Tue, 29 Aug 2023 17:16:28 -0400
X-MC-Unique: NP8z8QNUNnaVcCK0uh1PAQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f41a04a297so32626125e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 14:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693343787; x=1693948587;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MsrqElhKNPNFgbdwVrAQrRLanlnRhnvN8+BVbNKQ4M0=;
 b=Sj0LcqcHIUUxD0wLG1/HuW7OiK33hxKtAfIOWTYwymR3/0L3gL3yzJpVAaPj4JcJ/t
 9wGCFZXagd/3ujggM8/J9CWwaEJBgeWZyVQCaJHxHPj4Jn7hDWmVxvz2MgGzFM4mFONX
 4MTfp7Mlpy3B4qLHaHvAC82bVQflH4AARHXIXxsk/MsDHsBm3JWGxILiOKv5jiaRbCy/
 VuOlms+OQoFRDyKjfJsp7XrvHro9yy9x53ogaGBj1xcuDM/ehbIuAIjRr62qfPcJEbde
 YyvTLKRkVsTakDBwvmuBrgEiV1bv4enig7jj+wSZn6wHxa6MseMM5hRU1r04nDksjVTH
 s2vQ==
X-Gm-Message-State: AOJu0Yya2PthUGg9N3YSbuPo28R05spvvijDYTzKUqOmWbbCjo8KSDmH
 hYUyefY4zPnm3Tq3Lfy0zFSTmMey7aCFyqSKoeHcH3iyYupV+mD/R2xIDzpYVzuiQ/tpL13Z1Hr
 j5FfZ5EIxYW/9ecZu0i8Y/H9MYOyi
X-Received: by 2002:a05:600c:218f:b0:401:b204:3b85 with SMTP id
 e15-20020a05600c218f00b00401b2043b85mr308612wme.36.1693343787056; 
 Tue, 29 Aug 2023 14:16:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8Aqi5DaDFyulOBCrzSHSRQGwWVva7rQc36ObDSjCjpkMfHtbpiF/HJdWZ2OqD3Gc072E03A==
X-Received: by 2002:a05:600c:218f:b0:401:b204:3b85 with SMTP id
 e15-20020a05600c218f00b00401b2043b85mr308599wme.36.1693343786711; 
 Tue, 29 Aug 2023 14:16:26 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r19-20020a05600c299300b003fe539b83f2sm79038wmd.42.2023.08.29.14.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 14:16:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 3/8] drm/ssd130x: Use bool for ssd130x_deviceinfo flags
In-Reply-To: <87wmxeteyk.fsf@minerva.mail-host-address-is-not-set>
References: <cover.1692888745.git.geert@linux-m68k.org>
 <285005ff361969eff001386c5f97990f0e703838.1692888745.git.geert@linux-m68k.org>
 <87wmxeteyk.fsf@minerva.mail-host-address-is-not-set>
Date: Tue, 29 Aug 2023 23:16:25 +0200
Message-ID: <874jkhczx2.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>
>> The .need_pwm and .need_chargepump fields in struct ssd130x_deviceinfo
>> are flags that can have only two possible values: 0 and 1.
>> Reduce kernel size by changing their types from int to bool.
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> ---
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>

Tested-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

