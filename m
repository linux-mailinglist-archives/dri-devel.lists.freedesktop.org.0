Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EDAAAD978
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 10:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBCC10E762;
	Wed,  7 May 2025 08:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BVWPEPzy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D6F10E762
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 08:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746605047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1L9rKyoo5gafZgxfVF9TUdVkYjAT0uCnIxL4ynrWXso=;
 b=BVWPEPzyeoIFjXbkH067CNb9ncRLfGXpnqZcxH3n1t4JTWuad0J27q34eQdvBamtjjmegp
 GOfNvjozZOVVW78+QoChXSehtR0zynxjLr0/tZ6eyP4sfcghdK1cOE7U0aKNWbjuoQLkVd
 sEVdYn9pnxBYDKbJnt8YFph5oWhWqSs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-UDENzQYlPsSbXoXg3ZGkOA-1; Wed, 07 May 2025 04:04:06 -0400
X-MC-Unique: UDENzQYlPsSbXoXg3ZGkOA-1
X-Mimecast-MFC-AGG-ID: UDENzQYlPsSbXoXg3ZGkOA_1746605045
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43ced8c2eb7so50665065e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 01:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746605045; x=1747209845;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1L9rKyoo5gafZgxfVF9TUdVkYjAT0uCnIxL4ynrWXso=;
 b=ira1KlYayLh7aLKKJWrBj7ZZcMZYZ3nAjAZ70IvPihA2Bkw4IMN7BADIe3QfWfFw1I
 3OcBk++KODrEBNuufAjCNqu6QHBjyvJX9JPdWgE/xzkPaG8qblsKJnUHXnt33MKGwt1Y
 cF+RuGyedU/cIAbtDvZu1zfWiUG9RAea4Lz6DvuiJd6CrRpdCHccT1SqwcYAXOxO0uHf
 2lU4nWJWbTsQa3cPMX4Tc0OcKN3UE1bKKUGA07TJUY8Wd/J8EbB0XHo5zOP2559pR09t
 CdiZwpySkzB4dj+fEkzuj1AGCvDwUkFA9dhHQKbLn8jlaCiUil2dBkNgOINdg0dma/f3
 UFUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5F4hm3QUB8QtG08YZNR1x8h4iJ2lSQMZZ9SXOEsRVnmjui+VuM1rh0QFaAWWc6jOQdx0SATJBsgk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzyo/2TpR98ubG9vNRExYmb3gTEWYpnI/iJu+tXdmB14UmC0OiO
 y23gK6bUV/wO1pDT4Z7zlmslnTU3CxorJF6563XGRTNq7nCQEzRMbetBlgUbzfvCN8NwTqQWx60
 dLgjLB3N0seA0K3D97T4OfXYUf13rxMdXkCPjxFUVuFdESA3uAYY63Y7PlCboxV79SQ==
X-Gm-Gg: ASbGncvX37JJUVnCC/QgMY/I51AYcr7VL5HquXH4VY9QA5BbzxuHP9GA9Hz8qgScBmM
 EB89E9leC1CoAXFSV7pgDQHhotSAzGH+yxlfzpTCpm6ZgMpDsIbH3T9OUFhLtIMEtCZkvkv9My6
 jtUuZqDgVeC8oEftx/DalWNt43YqC4rcrAVpIf464w6gPgsn1dvElq46CtpukuZDf0KZlxBk5bF
 GCdaV2wtb77pBocvM8T448LVHXiOmKtjB74g/W29jnpSiO3+Ga3LpY6tXlSxJ0TKvMXUOEZ/bVD
 opyLhkmRIUtqtQQTUYN5TzAmJd7QDetdTjfJjiqxxFP4z/8JPtLgYxmOPmWKT4RIsQr28A==
X-Received: by 2002:a05:600c:5295:b0:441:b076:fcdf with SMTP id
 5b1f17b1804b1-441d44b5e6emr16208285e9.8.1746605045112; 
 Wed, 07 May 2025 01:04:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4wUqpShq9lUTv4LL8emvVajX8S6/zH0VVVy1lkz3Elvmc01LNJD4SZDrIMl3WfO7xuH02lQ==
X-Received: by 2002:a05:600c:5295:b0:441:b076:fcdf with SMTP id
 5b1f17b1804b1-441d44b5e6emr16208005e9.8.1746605044738; 
 Wed, 07 May 2025 01:04:04 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441d43d07fbsm21881185e9.10.2025.05.07.01.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 01:04:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v2] MAINTAINERS: Add entries for drm_panic,
 drm_panic_qr_code and drm_log
In-Reply-To: <20250507075529.263355-1-jfalempe@redhat.com>
References: <20250507075529.263355-1-jfalempe@redhat.com>
Date: Wed, 07 May 2025 10:04:02 +0200
Message-ID: <877c2s26fh.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fmsHIYn3YkN_CSSjVdV-lGKY6hf56eP2RdIAZBJjI14_1746605045
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

Hello Jocelyn,

> Add myself and Javier as maintainer for drm_panic, drm_panic_qr_code
> and drm_log.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

