Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA79867A89
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 16:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0805610E782;
	Mon, 26 Feb 2024 15:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WbEaNCZy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27FA10E780
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 15:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708962188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Uxw+sQNakqQLPRpTomhLcxrX+5PbOLt6iGYhmbbhYA=;
 b=WbEaNCZyB6yRjQ8V9HB3BtJgdE2wghp5TZaRxwAPZitcr2m7lJj9uq059qPnU+Nc5yMfEe
 8jAbcEJINmZ+nlSLK+z6dXKwmFmb99pFvvXTKFDbrBr1/A9VTT3q9II0zovkAhCoA1FbTn
 x3Q8R/UJqnAlUC/IuYt6fMgepzDbDMc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-HRNmuWEaPXOaxLbDcHt-CQ-1; Mon, 26 Feb 2024 10:43:07 -0500
X-MC-Unique: HRNmuWEaPXOaxLbDcHt-CQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-412a927a7abso2015875e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 07:43:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708962186; x=1709566986;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Uxw+sQNakqQLPRpTomhLcxrX+5PbOLt6iGYhmbbhYA=;
 b=kV3DxeFKTxoGZyNdH0UjDoQVXEEpmgT4fZ2kkYLV8QmY5S7nkVZ1pO3c77MV7LyI2C
 35artOqSKew5zL1mWKkGDThvfJCTAE8rx35xV4RMHYhuVg3PPCgvxiojURibjrhF4rnn
 WZFpvqUWPa7GxC/ZKZ/+v/BwI8qf3xw/dmsMnPpRamn9jFqRQuekcHH6pbrGJ3Nil75i
 xhHVSdZiv/VB3ZI+XDxh6IE0eHKUO3Hm11uTvBrkrbqQ3Gohsozv2j7N/32CaZejyysb
 wdJqWtXpCfXOw6TgE69r1ekTHeKUkerleQdo5X3j/Rwy6t2DGoExV0e53IaI27rrYc7D
 zX+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVTWHcjL00sw1N5WvARKzxE7vdi5BPbCuVbhcSv0m6dA7a9aPP2aO0oGn/t3xlyihivRYvwulOhmGXlHANKQDiIe0Tly9dklW1UufukYMn
X-Gm-Message-State: AOJu0YyafHNT2MeRLCnZSButjy7sifebB+fEZ2wI9G7EbQXGJrvbd+zF
 tf//V52CWcCPXbqFg7pPXO2azLJjJ0eOBXvYGTJZbB61ZcdhEnLmgphZiksrGogDqkxAumkVNKu
 bpSKJoIwKwIOzNmnf7b9wW3l99aGs5mvGv8D7LHe/Gciwk8QRskuS3U3ZO0XFardgWQ==
X-Received: by 2002:a05:600c:1da3:b0:412:a9f2:74dd with SMTP id
 p35-20020a05600c1da300b00412a9f274ddmr65648wms.38.1708962186157; 
 Mon, 26 Feb 2024 07:43:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1aXK/z2uOoyiMFTIsyuIfp+MdLZrkGeZzOXvlLof74+2bwDWNC7CQmOUNemBtXtz9+VrAFg==
X-Received: by 2002:a05:600c:1da3:b0:412:a9f2:74dd with SMTP id
 p35-20020a05600c1da300b00412a9f274ddmr65635wms.38.1708962185811; 
 Mon, 26 Feb 2024 07:43:05 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y1-20020a05600c20c100b00411a595d56bsm8476006wmm.14.2024.02.26.07.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 07:43:05 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: Daniel Stone <daniels@collabora.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update drm.git URL
In-Reply-To: <20240226152123.131406-1-mripard@kernel.org>
References: <20240226152123.131406-1-mripard@kernel.org>
Date: Mon, 26 Feb 2024 16:43:04 +0100
Message-ID: <871q8zp6yf.fsf@minerva.mail-host-address-is-not-set>
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

Maxime Ripard <mripard@kernel.org> writes:

Hello Maxime,

> Now that the main DRM tree has moved to Gitlab, adjust the MAINTAINERS
> git trees to reflect the location change.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Are you planning to post another patch to change the entries that point to
the git://anongit.freedesktop.org/drm/drm-misc tree ?

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

