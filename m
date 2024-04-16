Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B538A6B01
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485D010F06C;
	Tue, 16 Apr 2024 12:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Uucimjug";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A3D112C31
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713270792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xteOWPcjWbwNGVchkja51XJnWeQI8eB6ajK9N4gBt+o=;
 b=UucimjugR9z9p6iPit+NatbTGKEDiuJM1Pe50qSrmfCjWZWB8fSE6L3zmwXG3xq5e4AMBW
 RDpLeA9zKCOiCnbBUuOd5KYQuaWgrdEOWSX7hgX5Mhsu9OVGel5SDaPTp+dtMWXHdhuxx4
 1K72qyKtxVQCYhMNZecIZ+JTGajOhMY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-Vunk7Y6iOeK_2yWTgLxnvg-1; Tue, 16 Apr 2024 08:33:10 -0400
X-MC-Unique: Vunk7Y6iOeK_2yWTgLxnvg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-417bf71efb4so22960645e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 05:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713270789; x=1713875589;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xteOWPcjWbwNGVchkja51XJnWeQI8eB6ajK9N4gBt+o=;
 b=S3JLQDg1alscl77WD5EE+72Cda6eQivyGSK+okzw9jJk7kb+2uvH5EdH613SOc1B7i
 ZjYsFEbajySWJ3OfuH5WjWE43uebnVG5f2B3x2nYWnrmGAONYxxOX35UuE2Q+2GAUsxH
 maNHuxSDgxoq/Jfc7r1NLaO7RMju+HEWDQbVjLP9aHOXiIDVpKdc90hk/qXUxRiM40eD
 dajqVeG7Tvwj/FeIynSiPICZNqd7rzlHY+s1ePjYRKkPeyUAxeK0+y2O7KAWxhjT8axH
 2u+csXl5eFw3AgvC6DjH0eDJDbnFHT5b5ta0yb8878jHZ0CfbmR+abBuTkNANHgsa4p7
 9DOA==
X-Gm-Message-State: AOJu0YxVpDN9PMRo3JKZQa3knXGzbOvofTyrR9iQfqzUJVtNMvAfv79k
 Sgs8HrrUvT923uxAaW+kBvEwg5pKrf3u28EO1rGT91OfQMCfZzYHNZ5g9KPvlMD2UnYp7PYsYr9
 vQBZt8bk0mb6F7tV6YR1PtN0E29QMcoPVPTxCcZzcN5ykpHUbuZ3MWcatPG1kIplciQ==
X-Received: by 2002:a05:600c:1d22:b0:418:7ec1:7bdb with SMTP id
 l34-20020a05600c1d2200b004187ec17bdbmr2355525wms.5.1713270789554; 
 Tue, 16 Apr 2024 05:33:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6QlHuOYFx5st5AynBIsSw9LG3X1l/uiKueZt8fUqUQ3eyo5dEWcdcofbF7Vx3r0j/oQ4jGg==
X-Received: by 2002:a05:600c:1d22:b0:418:7ec1:7bdb with SMTP id
 l34-20020a05600c1d2200b004187ec17bdbmr2355502wms.5.1713270789093; 
 Tue, 16 Apr 2024 05:33:09 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c468f00b00417da22df18sm19407022wmo.9.2024.04.16.05.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 05:33:08 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Xinliang Liu <xinliang.liu@linaro.org>,
 Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong
 <kong.kongxinwei@hisilicon.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Subject: Re: [PATCH v2 23/43] drm/hisilicon/kirin: Use fbdev-dma
In-Reply-To: <20240410130557.31572-24-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-24-tzimmermann@suse.de>
Date: Tue, 16 Apr 2024 14:33:07 +0200
Message-ID: <87v84h5vy4.fsf@minerva.mail-host-address-is-not-set>
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
> damage handling, which is required by kirin. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Xinliang Liu <xinliang.liu@linaro.org>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Yongqin Liu <yongqin.liu@linaro.org>
> Cc: John Stultz <jstultz@google.com>
> ---
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

