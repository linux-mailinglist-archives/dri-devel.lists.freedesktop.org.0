Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D218FFEDA
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 11:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B10A10EB9F;
	Fri,  7 Jun 2024 09:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="en8/nwlt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599EE10EB9F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 09:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717751353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f3CTBNT0Xu1JLN13w+/lKzc/2DpVCKp8j0Zfan0ONnk=;
 b=en8/nwltvXk9K1wBcAGksvAgjczsmnz31m+RlM+1Xpngd2jblUWtl24BBSnxpd8rznl72N
 mRO5tRGE+sdTJLctVbmbTrBGr7Y12bdit/sbGD8ZiiP8vFx0t6Hy5OYQfif2saU6wdhXaX
 0g0O0kzPZMivcSNntmREb9LoFziJRoQ=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-zlq-GHm8NAGHtxAyvFcamQ-1; Fri, 07 Jun 2024 05:09:09 -0400
X-MC-Unique: zlq-GHm8NAGHtxAyvFcamQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-52bb096e9d8so1321979e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 02:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717751348; x=1718356148;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f3CTBNT0Xu1JLN13w+/lKzc/2DpVCKp8j0Zfan0ONnk=;
 b=DGVqtvv8sVWzw1J4WS8gk7ds7LvTMJo1ls6/LZ20ZobkKckPjXKnHdneohQwqtcCwU
 GTpy0C0HGFq4KVUmGZko/7AZfzFx5NiFYaVDwpAM1JKVXIeZuhphElfs6NYodYjNwFhq
 zN7czQdcBeT/9gSB4m+RUxSpS/l6yXZlJ2DXzf2vXugveWSNN6fBY7XLCiV4wj87e6O7
 vJaykHEMUMhhlkSQUi2FfpKLPqEgjmZhDqDx2t69oE2IINPrRNU8eiP3T8RDXVCkoUF3
 25eGCCZaSJDgwqWkG4hsy0hVnOPNJED21V6qmz9wl7wGjnKGUO0K0lCQvj7svcdd7b54
 3ZxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWGFSI6PLYufn+mU9+SkdXs1dd0yhjUkj9ZygbFnTDLa02/DaXnM+YCIpiwm9IOzn2FDuuVVCpWYyZHO6qIKDKe34aK6w32lcXg5M69fSi
X-Gm-Message-State: AOJu0Yzn9j7vB7e7ckFkG7qg6vrSDHbrI30Wmk7xBHr0dEbZVGFcimfF
 1uKn8fDGkbnWJhRYAh+pM+FctTCz39CcrNr4wyVQiXeinrYtYUPOH2Kvsmao6I0Vd85n77EOjLE
 mSyTEgIubx7WhQ6vtAXG2te7rLsEyM/cderV9znFEE7Tf5rXU32dOm6ZKcJLLzjr0nw==
X-Received: by 2002:a19:9141:0:b0:52b:b19c:306b with SMTP id
 2adb3069b0e04-52bb9fe0af6mr1197500e87.63.1717751348313; 
 Fri, 07 Jun 2024 02:09:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUGm9l35yhBtJygCNvQn+nTx55HKwQoBg+gu308J+L3cefwfNgzptTDE4bXo3bLZB2v8CtaA==
X-Received: by 2002:a19:9141:0:b0:52b:b19c:306b with SMTP id
 2adb3069b0e04-52bb9fe0af6mr1197480e87.63.1717751347794; 
 Fri, 07 Jun 2024 02:09:07 -0700 (PDT)
Received: from localhost ([91.126.32.244]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2a6225sm47016915e9.25.2024.06.07.02.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 02:09:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v2 2/3] drm/panic: Add a set_pixel() callback to
 drm_scanout_buffer
In-Reply-To: <20240603095343.39588-3-jfalempe@redhat.com>
References: <20240603095343.39588-1-jfalempe@redhat.com>
 <20240603095343.39588-3-jfalempe@redhat.com>
Date: Fri, 07 Jun 2024 11:09:06 +0200
Message-ID: <87zfrxjf0t.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jocelyn Falempe <jfalempe@redhat.com> writes:

> This allows drivers to draw the pixel, and handle tiling, or specific
> color formats.
>
> v2:
>  * Use fg_color for blit() functions (Javier Martinez Canillas)
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

