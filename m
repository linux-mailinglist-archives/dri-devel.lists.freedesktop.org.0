Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAE386BA64
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 23:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BBE10E19B;
	Wed, 28 Feb 2024 22:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fpZByzHn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E8E10E19B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 22:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709157717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gb42RHaHbvgH6buS2vhwM8dxZVCNDCNpgqpB45gim8I=;
 b=fpZByzHnCH3AtY+wJzULPCkdXof7qZVo+CfmrK96LE6va2qw5Ndcay+jU+twrXlWrw2KIF
 PXuQvsOayf5KLpducYdMuFalRrAlFGF/AuVFH4/2yB+uX9+jtb9MiQsX9o0kt1AdcCYqJj
 sinCRjzTLi8cbKhLaie4IbHRgPKhwtc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-wn1jWWalMSGGK0sZgud_PA-1; Wed, 28 Feb 2024 17:01:55 -0500
X-MC-Unique: wn1jWWalMSGGK0sZgud_PA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-412b7721ad0so1166955e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 14:01:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709157714; x=1709762514;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gb42RHaHbvgH6buS2vhwM8dxZVCNDCNpgqpB45gim8I=;
 b=j2sESdG/w12mo89lsq5hLMikwGvoJCZOMmcfdWe/WLlU+Pefem/aEDCVFQdCXb0Urt
 4/y7B02yxqE+VPbdLx0Ph5Bby/qU4JGo2Mh01Lz95RIDSSKtSu8pREmGD0CmYvLOo2E8
 AJL/tTkhcSq5cOrCb5YQun6AqhL1VvYmZwuhx+he0Ka9IHU14vopNgEiWOgKwN/ylkg/
 u1rC1ui9U3GZHhUCrvB1U8STIGn/Q1VgkfBLIHU2RuwSlbvWzHvXbq9jQqwur5TopmT9
 d1HeXyxKhFByScmyu6QFTyxorKQL3pJTl5wM3kQJEDiTBbr7dRkvd5s85+BTbsrXNF/G
 hTmQ==
X-Gm-Message-State: AOJu0YwrlKVPAxjVLSUT6uNCTsxeoce+9yVu+h5rtv8Q6Nl5kwVYlv6C
 rNe7LAaDH4xRES3oowI26/ZfgIaZgCUCL72ZHU2WBY4aHrntLrHTpRxyRorclkEKQYoJga8U+zN
 FHdUiqnVNMyIVCyVpo86jZgNloStAT6V1VnZapbzrEULFGtTc/WzCu4pCk3LU+Eb2OQ==
X-Received: by 2002:a05:600c:1da2:b0:412:9868:97ed with SMTP id
 p34-20020a05600c1da200b00412986897edmr351062wms.9.1709157714638; 
 Wed, 28 Feb 2024 14:01:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnexliJkq2EDSDzvfJngEL/iGnA4sFkcjtCKKNbI9fBcw6ZnUjpTccYX1RM3sqQbDz3XTJog==
X-Received: by 2002:a05:600c:1da2:b0:412:9868:97ed with SMTP id
 p34-20020a05600c1da200b00412986897edmr351036wms.9.1709157714290; 
 Wed, 28 Feb 2024 14:01:54 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 jz12-20020a05600c580c00b00411a6ce0f99sm112831wmb.24.2024.02.28.14.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 14:01:54 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andrew Halaney <ahalaney@redhat.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Enric Balletbo <eballetb@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Andrew
 Halaney <ahalaney@redhat.com>
Subject: Re: [PATCH] drm/tidss: Use dev_err_probe() over dev_dbg() when
 failing to probe the port
In-Reply-To: <20240228-tidss-dev-err-probe-v1-1-5482252326d3@redhat.com>
References: <20240228-tidss-dev-err-probe-v1-1-5482252326d3@redhat.com>
Date: Wed, 28 Feb 2024 23:01:53 +0100
Message-ID: <8734tcnt7y.fsf@minerva.mail-host-address-is-not-set>
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

Andrew Halaney <ahalaney@redhat.com> writes:

Hello Andrew,

> This gets logged out to /sys/kernel/debug/devices_deferred in the
> -EPROBE_DEFER case and as an error otherwise. The message here provides
> useful information to the user when troubleshooting why their display is
> not working in either case, so let's make it output appropriately.
>
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
> There's definitely more spots in this driver that could be upgraded from
> dev_dbg() to something more appropriate, but this one burned me today so
> I thought I'd send a patch for it specifically before I forget.
> ---

Makes sense to me and I agree that's useful to have that information there.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

