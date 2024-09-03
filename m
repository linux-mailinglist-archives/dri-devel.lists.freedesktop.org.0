Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2028969A6E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 12:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE14B10E3CE;
	Tue,  3 Sep 2024 10:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Y5Eh1R5n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C1510E3CE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 10:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725360126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6lwmVfPx2sszsBri4TFoZL/uMUGIYxHzznRQSGZUMD4=;
 b=Y5Eh1R5nmsBJnrLN5glqpjT6FDg1jkPOTBlGqr98uWX38Ll2zoyRmAFOdG0hvhyLP2i7CG
 lF26Gi8HCIezZ03HY0JGReTZq2mz/a8/JG1/jszY99VEMKwGSVF9Po03QxpPkb3l7oY2Wx
 hWiiNxKvzhxxddOfOy1Qvk7k/oQ7bLM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-wgCzH9ICPMGZLjWl0bUmdQ-1; Tue, 03 Sep 2024 06:42:03 -0400
X-MC-Unique: wgCzH9ICPMGZLjWl0bUmdQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-37188f68116so3450700f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 03:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725360122; x=1725964922;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6lwmVfPx2sszsBri4TFoZL/uMUGIYxHzznRQSGZUMD4=;
 b=Fib/COvfltuChtcdemV7J5ypAsk4dPj/m4yi8nK7iwHVwe+ItnebkEuPcbvY1SKOVI
 SMNBNVryxUKIAI1fw1G4e0pknoTBbMWBV3QMbRd02rDzPwScvli8ZmdTxtuzdvTRp/Z7
 YDfgmHp+nZOjOqK12wunLEURNkU2MypM5vy8i3ZLqOT7MXBUOSXrBGQb9Hc+otyxCDCc
 6uP+4NBtdhfV5bMWLztRp9WsmYEiwF8Zq6M2nzuHd8vEsykrVb8mWlWO2P5cr5wAH83Y
 r0sFmk7MiR63M5E1D6lVi4LN1CBRD7TaD+FKQHDfCSyoETwlZfT8QHhQmRTdM+Bsmbr2
 weaA==
X-Gm-Message-State: AOJu0YxTbuCkOEVUkzMnyOiJtqWtM1aUYpz29uUeE7yvVcrjIuKIZgQa
 absqQntVDFEloGj4/uKyizsRMOn/s6883gh/rg5aVxyiB++FwcKwB3sgi5QFD6rt0rtxCZfp+q4
 qb5D+GcYSAz7jEGg+/7Sqf9lQLBRFo/vFb/SqpAP/lkWu6A5cVVOjsL0Pu6T4YYoOUH9tDl2szQ
 ==
X-Received: by 2002:a05:6000:18a7:b0:376:7a68:bc42 with SMTP id
 ffacd0b85a97d-3767a68c23dmr1148278f8f.27.1725360122016; 
 Tue, 03 Sep 2024 03:42:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn4YS9bNBLLWoNJTDrRNeKzv2DqbtrI+GY2Fyjm7bbAi6bx9DMubdkqlGYZw08xR/rtbBxWw==
X-Received: by 2002:a05:6000:18a7:b0:376:7a68:bc42 with SMTP id
 ffacd0b85a97d-3767a68c23dmr1148260f8f.27.1725360121455; 
 Tue, 03 Sep 2024 03:42:01 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df0a0asm167347215e9.13.2024.09.03.03.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 03:42:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 03/81] drm/fbdev: Add memory-agnostic fbdev client
In-Reply-To: <20240830084456.77630-4-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-4-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 12:42:00 +0200
Message-ID: <87jzftggsn.fsf@minerva.mail-host-address-is-not-set>
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

> Add an fbdev client that can work with any memory manager. The
> client implementation is the same as existing code in fbdev-dma or
> fbdev-shmem.
>
> Provide struct drm_driver.fbdev_probe for the new client to allocate
> the surface GEM buffer. The new callback replaces fb_probe of struct
> drm_fb_helper_funcs, which does the same.
>
> To use the new client, DRM drivers set fbdev_probe in their struct
> drm_driver instance and call drm_fbdev_client_setup(). Probing and
> creating the fbdev surface buffer is now independent from the other
> operations in struct drm_fb_helper. For the pixel format, the fbdev
> client either uses a specified format, the value in preferred_depth
> or 32-bit RGB.
>
> v2:
> - test for struct drm_fb_helper.funcs for NULL (Sui)
> - respect struct drm_mode_config.preferred_depth for default format
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

