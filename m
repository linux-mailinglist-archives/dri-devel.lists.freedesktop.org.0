Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B625BA3D4D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 15:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C7F10E073;
	Fri, 26 Sep 2025 13:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GgcilBPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B9810E0C7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 13:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758892521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W6gloL9plQf6RtxB5L806/XSaHmhkeCLtVCZieySzvw=;
 b=GgcilBPLALLg+6tVnVFOmME89hcztavtd1tyymFdaiEylJ+3NQu4tSyDPWBwC2XL6XjE4o
 TG0Nypg+m/114Isp+9E629mhw/iyHB7rmhgbbJKX5M/ldgSepiFBYHybOiK5mfUSMsFgnf
 33lRDcGIyqWA6IlqYzw9GHaEaJbV8U4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-v3FO34r8MWiiDEUnKEDa7g-1; Fri, 26 Sep 2025 09:15:19 -0400
X-MC-Unique: v3FO34r8MWiiDEUnKEDa7g-1
X-Mimecast-MFC-AGG-ID: v3FO34r8MWiiDEUnKEDa7g_1758892518
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3e997eb7232so905196f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 06:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758892518; x=1759497318;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W6gloL9plQf6RtxB5L806/XSaHmhkeCLtVCZieySzvw=;
 b=MTEJzeiYSURAOP0SQa0GE1aazmcLRvYiGDwS0mSaGL4QSZZnq2cenGupqITzxMLhrQ
 Y01GJelM0J/S9chuclVDe5I/jE4XJ6/1WuyOD5G6iDf2IpxmEArMLlfosU8BsuoVRJNW
 3VEQG/+eDjEoj6o1cPR0B984zYP5jvmHfuDb9KhPRFDALK9XjjmULo6DwwV18pmegbmz
 rPOke1g6qBm1+FbBfqXpYM9D+PICGwbtg4ESq4D0feNhkYvMIrxACLN2K1T4NBZ5kQq6
 utk791DqyGXwCgLR88w9lE8GH0Vqbaq5Y1i2PHSBxBowlH6YWvgzybPYeiVopI9LHhVJ
 3lIQ==
X-Gm-Message-State: AOJu0YyFIbXSg05BjWFDTR2MzI9EYAUC8xwoLBUcX0VfyhdRBrQvKpbI
 tHZyVv+ubTOSkfO++rXcilblOx8RyMEl0NqALIfIoAOeRlFkYDIjlbcHo4RpqKA2F2n6JoUlsdl
 rQOCRNX1mkk/rbjtfp/DgNpAA7MTz4iTRdy5B0dXhxqFF00LUundOdpKUFdQYOPUWAzlUvA==
X-Gm-Gg: ASbGncud2wf4pMTSyzcwAEzumDr/F1QqTCr9VVR4orLPKEjWgYIpJrh0mj+c0k4Z0qT
 3KngAD2Ekk1Q+MWzDsGZQySJoowSqARcaR24at5oN87LS3gR8+3Q2PuOr7WeIbCIgY+kPzCgEVa
 oreJjrBAgiFnBTDD9pDNgDfUikjwhIe8PfV7sQFArgAXu6GJ2C+SWUh5mPR7J/CtSKmYP8R4poY
 u41GhXXTHW8NL01fGmoDBNr6A8kA8NHMr5vDtSjEi2cmPo4Wyg84FOD6r5lhFspemA1CLaDw8w3
 ujt7ILZs6UF6ij9DqeqY4QPIfU1erjTE1ZP0Wr8ypOgOY0cc6Vxca12OChcYt1Js0w==
X-Received: by 2002:a05:6000:1acb:b0:3e3:24c3:6d71 with SMTP id
 ffacd0b85a97d-40e447772b6mr6450701f8f.1.1758892517669; 
 Fri, 26 Sep 2025 06:15:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgdQJaXU6qBeKy575PXxNR5wMjBV00QJq4HVM+OcRu1Z+hB4Jn+gkEnlY2TUSw3YCIQLZKVw==
X-Received: by 2002:a05:6000:1acb:b0:3e3:24c3:6d71 with SMTP id
 ffacd0b85a97d-40e447772b6mr6450663f8f.1.1758892517117; 
 Fri, 26 Sep 2025 06:15:17 -0700 (PDT)
Received: from localhost ([90.160.50.24]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb89fb264sm7307121f8f.20.2025.09.26.06.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 06:15:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Iker
 Pedrosa <ikerpedrosam@gmail.com>
Subject: Re: [PATCH v2 0/5] drm/solomon: Code improvements and DRM helper
 adoption
In-Reply-To: <20250920-improve-ssd130x-v2-0-77721e87ae08@gmail.com>
References: <20250920-improve-ssd130x-v2-0-77721e87ae08@gmail.com>
Date: Fri, 26 Sep 2025 15:15:13 +0200
Message-ID: <87zfah8ie6.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tGB55T1pDdkpzUak4QXz43Ilh4MBZ5pb5cHvbGPaGLE_1758892518
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

Iker Pedrosa <ikerpedrosam@gmail.com> writes:

Hello Iker,

> This patch series improves the Solomon SSD130x DRM driver by adopting
> existing DRM helpers, improving code clarity, and following kernel
> coding standards.
>
> * Patch #1 moves DRM GEM framebuffer CPU access calls to make critical
>   sections more visible and maintainable.
> * Patch #2 replaces WARN_ON with drm_WARN_ON_ONCE to prevent log spam.
> * Patch #3 adopts drm_crtc_helper_mode_valid_fixed() for mode
>   validation.
> * Patch #4 adopts drm_connector_helper_get_modes_fixed() for mode
>   management.
> * Patch #5 enforces one assignment per line per kernel coding style.
>
> These improvements reduce code duplication by leveraging existing DRM
> infrastructure and enhance code readability without changing
> functionality.
>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
> Changes in v2:
> - Use a goto label to ensure drm_dev_exit() is called in the error path
>   of drm_gem_fb_begin_cpu_access().
> - Link to v1: https://lore.kernel.org/r/20250912-improve-ssd130x-v1-0-bc9389ed299e@gmail.com
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

