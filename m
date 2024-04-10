Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AD689EC87
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 09:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB9D10FDCC;
	Wed, 10 Apr 2024 07:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PgmHqNlG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A039410FDCC
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 07:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712734996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qv6viAru0kAaAT0WAJpNQSSb6YOF6I39/+pSNoyB75Y=;
 b=PgmHqNlGJdvXtCvwH5e1XkXPpCAht92g738/ThLYSdKaIVGb3Y9mB2/qEoBhqQfVLKP7Js
 9/Q5AnmLDkl4JrJcWDhZCnFYFX+Rn0NYFGhb/cl4F4TvGpPRV2h9nEP4vTm5xKjgw5XLAF
 E3sdVYcgffv22+pHYKzXSN2SavOYCZ0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-Y3aTHhX7OnShu8w8W54E8g-1; Wed, 10 Apr 2024 03:43:15 -0400
X-MC-Unique: Y3aTHhX7OnShu8w8W54E8g-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-416612274e7so13665535e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 00:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712734994; x=1713339794;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qv6viAru0kAaAT0WAJpNQSSb6YOF6I39/+pSNoyB75Y=;
 b=KqtRPV8v9mVIl+/BSESp7QCXZxil9JfG2NaKDZHTb45CzRiX0xhjF/DjkodwDvI6sF
 tmjeP3ySoEDZA1Rwl29zmcfhSYrV6XUE2T9nvcAexW300bAm0ww35ZkQElQZp8Y5YipQ
 H3+BfZwpoLjPDUSG0P47ItQrmQS2gE/tYTDOXIn2WXXyrIGYg+Mbz9inMLMSMJlL7Bch
 QZtKn8UwtAQ1Ke3DThyeYzFTV7DLwR9fq5+SsvVvok2Oy2Yi8fsrNXllXIsLlBHYNxCB
 d/YmxVa9reHKT7eaQrNXOuudOeLzniwQYaV8p2xIfD1AS8T+NhfLR43ceSbUJCwMHseY
 rERQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpZbCyL05YKLPsBe8ucGA3JdpQO2rllyHTyz4r867aobFQUVrJ8dygaGfkEi2GGpooXWCSQ6McpThChHtQX8FBEkPsCAQdxbhKX3bwvg2P
X-Gm-Message-State: AOJu0Yy6fIPbhOf7DZcW1iBVkgwTkoBd5sjP97+XGiJd6zbBJDH4zM2K
 NkQYaztdl1IN8QChSPUDasYqH4Ko8zIXzAcRLdukyF8IwyZ/ZB+7ojxspy2lcXyvHNiaO5FU4um
 BakLb39A9fTDz++aI47ClaiQVf+TwGYYJiCbS5rXbLwtmQ6TwNb9y0tS8iR/eDSiZSQ==
X-Received: by 2002:a05:600c:458d:b0:415:45ba:bf5d with SMTP id
 r13-20020a05600c458d00b0041545babf5dmr1350483wmo.7.1712734993776; 
 Wed, 10 Apr 2024 00:43:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUtVhjvTcwh6MgPZCE9ftn2snYGy6xr5dVZaewUpm0bBxfWXGZgKP+rRyR8miwrsdnDhBMMw==
X-Received: by 2002:a05:600c:458d:b0:415:45ba:bf5d with SMTP id
 r13-20020a05600c458d00b0041545babf5dmr1350469wmo.7.1712734993365; 
 Wed, 10 Apr 2024 00:43:13 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c4f8300b0041627ab1554sm1430993wmq.22.2024.04.10.00.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 00:43:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: Re: [PATCH] drm: remove unused header gma_drm.h
In-Reply-To: <20240408104230.3191827-1-jani.nikula@intel.com>
References: <20240408104230.3191827-1-jani.nikula@intel.com>
Date: Wed, 10 Apr 2024 09:43:12 +0200
Message-ID: <87bk6hr7cf.fsf@minerva.mail-host-address-is-not-set>
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

Jani Nikula <jani.nikula@intel.com> writes:

> gma_drm.h has become an empty, unused header. Remove.
>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

