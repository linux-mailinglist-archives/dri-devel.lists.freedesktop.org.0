Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC79DA97AEA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 01:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3337110E132;
	Tue, 22 Apr 2025 23:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gXOcHwUB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B7E10E132
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 23:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745363295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oHDUzgNIkIt52yZH28h239nYED9JWjDSUxQimRHnhyo=;
 b=gXOcHwUBI12hKU+I1WVQ6Z9opNpYJnxkirO4g6vT4zOwNcrc2Ici06tk/tMtjTjIFJBrCq
 FcPiG6+zAdRj4VmQdvHCq5+8Rx6XwMoAuzH2AK8okLeU2CpLYTmksajh0QmUpp639ZujT+
 It+s9fZY1nWnHLY7+ow3mi93M7xEGpE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556--LK9-bwwP3yjsmr0hbS6hw-1; Tue, 22 Apr 2025 19:08:14 -0400
X-MC-Unique: -LK9-bwwP3yjsmr0hbS6hw-1
X-Mimecast-MFC-AGG-ID: -LK9-bwwP3yjsmr0hbS6hw_1745363293
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-39c2da64df9so2582963f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 16:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745363293; x=1745968093;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oHDUzgNIkIt52yZH28h239nYED9JWjDSUxQimRHnhyo=;
 b=Ex/JuEs9cPqTdlg/5aNxdq1OHkOgvm3wKahbFwF9hRIAZv6vIis2PQ/6/5yYZzM+6E
 JAyTbF5FkoFIpL7MZTIiBieaS6MeVBA+K9kig9n1iHZbq6c02gF9/5I/VH1yBVopU64w
 SALkvuTVYSySsa9noCLqNk1zgILsJWVb68GIcDlXaVDH2++2mUL8QThzpqQKqq51sePD
 BLTIGGTazmGRchIZuO20Yn1SE5E5Z1dE2GhF2s85RULfM4iLRUIwtjiCk8WpxNI3bAft
 pbcreijCcyOMx6+pPV1+Zti6bQXsJmmCDA2E+EFwjxJU88uC+PHZfEi2nC1YaBtVaEgQ
 DdqA==
X-Gm-Message-State: AOJu0YyvIjHqE+vCUhdfgCDuEz2NcmCZjK56aqrvTQhvAk/Uiwvj78US
 Du1NAPeV+C4VU9Aw5vzV5lmf8cCFCD7nYllPCnnujIL849ChIThlV2VJRwtW1sZXbe7r0o/SEik
 ts++uLjhb8khDCj6xyGIKERE7yvIF+2sakKw62wP3nqvvfDHaUD9LPyDM9HVCc6UHmw==
X-Gm-Gg: ASbGncsd0W4vMmdtuCnHixCd8b463Wc9PrpSLvBl98xVOMo35eSjSPOCThl1RBgl4ZK
 UFuWoVe8+D9kFAzwC/Xp8E0/6nXBB4qV0ipaaAVzwj30VbBHoNpbeMrTHjfuKYhSclxRYlAoZ2c
 CzRJJEJEXO+sywktnEvWemEuSdA6ZhIhbBsq5m65//p3snmXZzqZxOONRgHSYzELWSHEUdGZ08h
 DNWGrMGkHtwlArvLzkI6l4lWAbsW3y6Wj1itJPyn8TzpneuWcM6sOfHPCsCtRWUa6Dw/X2BO9V9
 qQOHcSyEylJiya8yzjULhSuC1Ad1VGm8HlrMUFdrMVgbXx7wpdNbtflz3FYMWvOTcukAjA==
X-Received: by 2002:a05:6000:401e:b0:391:3f4f:a172 with SMTP id
 ffacd0b85a97d-39efbb02156mr12229448f8f.49.1745363292892; 
 Tue, 22 Apr 2025 16:08:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8TR1dgi0jfTyn+XkCD1/F2vnpkNNPRVQ8DBT1e3D7cQcfX9kUyX5kJoKFqBRRqD5LJn9IAQ==
X-Received: by 2002:a05:6000:401e:b0:391:3f4f:a172 with SMTP id
 ffacd0b85a97d-39efbb02156mr12229433f8f.49.1745363292560; 
 Tue, 22 Apr 2025 16:08:12 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa43bf2csm16808121f8f.51.2025.04.22.16.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 16:08:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Thomas Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v4 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
In-Reply-To: <20250415-st7571-v4-2-8b5c9be8bae7@gmail.com>
References: <20250415-st7571-v4-0-8b5c9be8bae7@gmail.com>
 <20250415-st7571-v4-2-8b5c9be8bae7@gmail.com>
Date: Wed, 23 Apr 2025 01:08:11 +0200
Message-ID: <871ptjbxr8.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wiW5-Djd7NM6yqqgU0Nl0PIUKe4DzIoZ7uiiYF1g_Nw_1745363293
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

> Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
> The controller has a SPI, I2C and 8bit parallel interface, this
> driver is for the I2C interface only.
>
> Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

[...]

> +#define ST7571_SET_COLUMN_LSB(c)		(0x00 | ((c) & 0xf))
> +#define ST7571_SET_COLUMN_MSB(c)		(0x10 | ((c) >> 4))
> +#define ST7571_SET_COM0_LSB(x)			((x) & 0x7f)
> +#define ST7571_SET_COM0_MSB			(0x44)
> +#define ST7571_SET_COM_SCAN_DIR(d)		(0xc0 | (((d) << 3) & 0x8))

You could also use the GENMASK() and FIELD_PREP() macros for these, e.g:

#define ST7571_SET_COLUMN_LSB(c)		(0x00 | FIELD_PREP(GENMASK(3, 0), (c)))
#define ST7571_SET_COLUMN_MSB(c)		(0x10 | FIELD_PREP(GENMASK(3, 0), (c) >> 4))
#define ST7571_SET_COM0_LSB(x)			(FIELD_PREP(GENMASK(6, 0), (x)))
#define ST7571_SET_COM0_MSB			(0x44)
#define ST7571_SET_COM_SCAN_DIR(d)		(0xc0 | FIELD_PREP(GENMASK(3, 3), (d)))

[...]

Maybe a comment here that this function only exists due regmap expecting
both a .write and .read handler even for devices that are write only, e.g:

/* The st7571 driver does not read registers but regmap expects a .read */
> +static int st7571_regmap_read(void *context, const void *reg_buf,
> +			       size_t reg_size, void *val_buf, size_t val_size)
> +{
> +	return -EOPNOTSUPP;
> +}
> +

[...]

> +static int st7571_fb_update_rect_grayscale(struct drm_framebuffer *fb, struct drm_rect *rect)
> +{

[...]

> +	for (int y = rect->y1; y < rect->y2; y += ST7571_PAGE_HEIGHT) {
> +		for (int x = x1; x < x2; x++)
> +			row[x] = st7571_transform_xy(st7571->hwbuf, x, y);
> +
> +		st7571_set_position(st7571, rect->x1, y);
> +
> +		/* TODO: Investige why we can't write multiple bytes at once */
> +		for (int x = x1; x < x2; x++) {
> +			regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
> +
> +			/* Write monochrome formats twice */

Why this is needed ?

> +			if (format == DRM_FORMAT_R1 || format == DRM_FORMAT_XRGB8888)
> +				regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
> +		}
> +	}
> +
> +	return 0;
> +}
> +

The driver looks great to me now, thanks a lot for taking my comments into account!

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

