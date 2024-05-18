Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D2A8C9232
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 22:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA9A10E167;
	Sat, 18 May 2024 20:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="gl2OouVw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664DC10E167
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2024 20:21:58 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1f2f566a7c7so9630695ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2024 13:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716063718; x=1716668518;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YT8k8s66KczJAsNizHEAZ30DCNByiIsnyYkGU9dE27E=;
 b=gl2OouVwqA5JRctsPEcAp230+jOYRPIXlw5YxpjZfZqB0P3cx5/tgXSQY9rLLoaXbJ
 m1BGplhO2/o5Mku0SWDXbZOQthkb6x0ia1Fs2X2j1fNAPvHJPGEXa7FQOsdOvfbPaQFd
 HM6f8hXTVqIHrSdHa2zGAJ4/9DMwNgBhaki8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716063718; x=1716668518;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YT8k8s66KczJAsNizHEAZ30DCNByiIsnyYkGU9dE27E=;
 b=XsQSjz1KpyeWk3K8HmHNuBDZ5GW8p/ol6+kFpR2qcICU4bEKoaRS2chOdnLKXTu22f
 m4ovKw3hG/T9qdTnoDrWx7GFBD9B6o8abKXfUCCpTIlH0kknYYK0mMB8AtwzHGuAgtwj
 +BPsSukqIKnWK4LqVi/erW1UNscW0cD7YsjPliNGAZxNwbALQN19LE9WSHdyXGiUYT+R
 zBQt0tagJpcBnPUQsF8XqRmNfovVvDUcqRUM8rwJcEEUZCqj/yrJskUKg+bNTy6RLcWq
 I1sKAm9UkZiqlIOcs8HqIiPELI7nKOkCxVIrWD44spnr+EY+Yg7Eyfz7EpXtrPBfwm2N
 HyJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUN3QYfaV0y/AObRyawOvIDWXbgI8vDdo+4AbU658LfxvVdQT1iqF/8eVoSbuxCE3pf/QPiyCVfEcdArwy7IIFQ20ckyR7YAKqshk0rtjx
X-Gm-Message-State: AOJu0YxGT+07+MGtYyleoP0cEhNmNTSPy49C0Kit208BSku+Tj/8YaZ2
 eMiZIkvkZX27h6BUSKKOrHwlIwHUmqraypF/Pj01mMunXHMhTCyJttSG7msiwg==
X-Google-Smtp-Source: AGHT+IFRGo/TZiGmDwrA4Giz9YhglZ2J52uHVSyaj/8zAhYj57i0W4kcw475tSgmL53i3sy/nIfz7g==
X-Received: by 2002:a17:902:f705:b0:1ee:b47e:7085 with SMTP id
 d9443c01a7336-1ef43c0c957mr310157785ad.12.1716063717708; 
 Sat, 18 May 2024 13:21:57 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bad61c7sm177715425ad.68.2024.05.18.13.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 13:21:56 -0700 (PDT)
Date: Sat, 18 May 2024 13:21:55 -0700
From: Kees Cook <keescook@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: David Airlie <airlied@gmail.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Danilo Krummrich <dakr@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v2] drm/nouveau/nvif: Avoid build error due to potential
 integer overflows
Message-ID: <202405181321.BE7CB28587@keescook>
References: <20240518182923.1217111-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240518182923.1217111-1-linux@roeck-us.net>
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

On Sat, May 18, 2024 at 11:29:23AM -0700, Guenter Roeck wrote:
> Trying to build parisc:allmodconfig with gcc 12.x or later results
> in the following build error.
> 
> drivers/gpu/drm/nouveau/nvif/object.c: In function 'nvif_object_mthd':
> drivers/gpu/drm/nouveau/nvif/object.c:161:9: error:
> 	'memcpy' accessing 4294967264 or more bytes at offsets 0 and 32 overlaps 6442450881 bytes at offset -2147483617 [-Werror=restrict]
>   161 |         memcpy(data, args->mthd.data, size);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/nouveau/nvif/object.c: In function 'nvif_object_ctor':
> drivers/gpu/drm/nouveau/nvif/object.c:298:17: error:
> 	'memcpy' accessing 4294967240 or more bytes at offsets 0 and 56 overlaps 6442450833 bytes at offset -2147483593 [-Werror=restrict]
>   298 |                 memcpy(data, args->new.data, size);
> 
> gcc assumes that 'sizeof(*args) + size' can overflow, which would result
> in the problem.
> 
> The problem is not new, only it is now no longer a warning but an error
> since W=1 has been enabled for the drm subsystem and since Werror is
> enabled for test builds.
> 
> Rearrange arithmetic and use check_add_overflow() for validating the
> allocation size to avoid the overflow.
> 
> Fixes: a61ddb4393ad ("drm: enable (most) W=1 warnings by default across the subsystem")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Yeah, looks good to me. Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
