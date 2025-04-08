Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C184A7FCC0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 12:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B3810E1A0;
	Tue,  8 Apr 2025 10:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="a4237Xv2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261CB10E1A0
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 10:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744109306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y5x8ztklRj+hcaxqPRCHP3RYpTBH39TiiFhtTkJ0tSc=;
 b=a4237Xv2NoiNj5oJt9iNm2muNQ+gQoY8GAEuTa/6TZqlqt2Sos77QK8PJ06pzrb++ydKHC
 IUO0uLgKr8Kk4hkTqhNhDfwufP0APnVjOHKdd9eyuHN4bwKo0jBfIS2/3TxCldpfmRl2xI
 IjRE6os8kJstMYBNeWJxO1mGPEZkK/8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-adETgCcxNnWTZl7Gxzt8Bw-1; Tue, 08 Apr 2025 06:48:24 -0400
X-MC-Unique: adETgCcxNnWTZl7Gxzt8Bw-1
X-Mimecast-MFC-AGG-ID: adETgCcxNnWTZl7Gxzt8Bw_1744109303
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43ced8c2eb7so41124205e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 03:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744109303; x=1744714103;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y5x8ztklRj+hcaxqPRCHP3RYpTBH39TiiFhtTkJ0tSc=;
 b=mjDq797uctTbc+Q78xA6iWP+/DRtgFEwLtamEZ41NkJHXqQc3XDDfry20dOng4vQyd
 QN91w1+8L8CEzA5CKF2qGCDUd1FGz2UB5wz7fQwLOnle9vKAY1xEbSFXfQZpr+vj2kql
 O3CbPyzzA8A4BrR9bll4rdDY+Mx+vTFXaslJ8rGEHwaNwuK+RuiLCycFKMZv6BDKZ5Ls
 iwbCiMkuZFnR4x3AV5DYbtr2x4DE7QBehqgocvUHN8337rOQ/+oeThg9aCP7e8rFSd30
 kdFmIapa18wRtJFNElYJsivwR6uC/RTEy+WmDEheqMqbEt/E94ATiMcCKrwFwL5r1krw
 PDKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBJFoClmeWcj0weyAFBZvgqP4P0n2l/pL0mDgoyH/6UAeqgRBmyac02dJDPXZrDJWxTTUcxpKQSFI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyycQdubrBOl8+k0OxTLPAQyP8hjQ/75T0KxndSg/MR6s5Itrqh
 atyMBjq/2Ry8bVKFiYow4rg2T3B5rQM00PIODx1WR3UJlTQUUHPoO8jlSsoJy4/iHmo5amhJeoP
 QIu0eEq3QmZr0igEg4Weli/U1228z0Vy7qRZGtxhGjCzPuMXk7rkekK8OhyouNxNvCg==
X-Gm-Gg: ASbGncvf6CA2lvAxliA+aoYJZ5c9MslaPBptLE8dCLcqeZ4ZOh+88c6raDO8tAA0VOl
 7eo5COauUx0JSPv854qBt/cC3lZWtMzp2lhtIicte+2qzTz1m02GJMTUhaK+8xVTUEioy6Fk/CJ
 bIqcYBf8GZatSDt5fwlyF12vTgbvBvci/LPC4t/7LzbZWm1Yh7XyOMrGhaIqizEig4nNI4vmMP9
 dGmjvRxoSq1R+cjZyqxhy04tZoZnokebCmlOaax8aCydx7/fhdI1O7T1z0oQUSuCl/Mm1428+Bi
 iY4REe/VXTCw2YdOCd1z+/3PZFghl5dWkLsXi/Sl2nADsIhXhy35jtVXSLHEQtTgsrsby17uWQ=
 =
X-Received: by 2002:a05:600c:500a:b0:43b:ce3c:19d0 with SMTP id
 5b1f17b1804b1-43ed0da06f1mr141448615e9.29.1744109303226; 
 Tue, 08 Apr 2025 03:48:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPyvr9IC5YPwrbteXJ5HIsOUrWufQQG1ons9V7EEJ7Y1tjpgMs/bSQiqMrHaDIkzT80gnIxQ==
X-Received: by 2002:a05:600c:500a:b0:43b:ce3c:19d0 with SMTP id
 5b1f17b1804b1-43ed0da06f1mr141448445e9.29.1744109302834; 
 Tue, 08 Apr 2025 03:48:22 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1795db7sm164592015e9.25.2025.04.08.03.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 03:48:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org,
 linux-efi@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drm/sysfb: efidrm: Support module builds
In-Reply-To: <20250408091837.407401-3-tzimmermann@suse.de>
References: <20250408091837.407401-1-tzimmermann@suse.de>
 <20250408091837.407401-3-tzimmermann@suse.de>
Date: Tue, 08 Apr 2025 12:48:21 +0200
Message-ID: <877c3v9bey.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EQ6xdXn8sHnGF-SlZrJrG35HfuxswG6b4mjFY2xgLnE_1744109303
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

> Make CONFIG_DRM_EFIDRM a tristate to enable module builds.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

