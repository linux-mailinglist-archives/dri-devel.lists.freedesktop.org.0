Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54731B7CBFF
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FA810E42A;
	Wed, 17 Sep 2025 07:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Gvh838r/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F089510E42A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 07:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758095637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=foovB08AZH9s58DNDobltjb2AVhU22+gGg46TRKbNww=;
 b=Gvh838r/KX+N4JXVXmzWxN7bwrU2lG5xmeWtpHkozxGPCRnAUi7mPAY5O9jIQgeE2+rbCL
 noUnHg4bDBcVCSQaWsHBpOQM3YWPs6fB/hxxCH0+7+ZErGdJqlj7mtrTjC7uCupbsvhg74
 6HV51BQn+MNEGGiNRUIvF1GPGnkxTDQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-gi73xpjtMkmUoWnBTvyQ5A-1; Wed, 17 Sep 2025 03:53:55 -0400
X-MC-Unique: gi73xpjtMkmUoWnBTvyQ5A-1
X-Mimecast-MFC-AGG-ID: gi73xpjtMkmUoWnBTvyQ5A_1758095635
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45cb612d362so39471205e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 00:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758095634; x=1758700434;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=foovB08AZH9s58DNDobltjb2AVhU22+gGg46TRKbNww=;
 b=PnIzQ7CrKvdP3scb7ToQu/6/tItO8n1Q14sVlNth6NCPoTi3TxEzLu1gdvY2dir20N
 9mV6mOVMmOXqNGM+vLHqoR7TbJLDPeOyo7K9SdXy4BcFx6/nf4SvNobX4go/xnhI/uEo
 M8Cfqcp1vcYYV4+U7RXFKbTTAgsSbQSe0bFH8iCs8O0sUppmYxzeW4KEMFGmWsCymyrT
 RL+2TGnnt+5Jd8yvRQQw7KTeIU/qqlR3T81AI2mkbnp9QFor4QU2A6oALdsPAa/YVML7
 BA+vs1Ryt7XPN8MTyPQggPPaJ5Pc8pPHLCgAf4cfNxrghtmWjPjsEaekM+OCXl27CvoQ
 uZag==
X-Gm-Message-State: AOJu0YzMfOkuIxasSSxT9krp9Hp2GffLLJRCY4OyNyZNriKD2cvpU8kJ
 K/PPgmUfu5G0U/TrHjnLbfwRc590W4SjmVh09PAt6jzxo3Xrcz1/RtAYKyDW5FGDWurIhGAi27o
 tfpHKCVgcIamUz+KZZzDS0wS3i8Bi9DgunGwv9+1QKs/1WRDptUvM95rcJIHQhVA1hr2Lyg==
X-Gm-Gg: ASbGncuqwLPIY8q3+1ZRdjrqk1OjKr3MdKoYhmciREUmjGhb5/uWvkovDYSHskO4UoF
 p95dY6JNUrEvNw9dRm8IHnZnCKVFS/TVDyjQte9XwXYKNDbSNVwOLqPqqOW6J4nJyN+vUeO+zJe
 ZYwBLzoEzYxjpjtOIdtkmTdJ3Kr7db2whXe8WjXPgl8Mv1T3GItFnQqSnk7NSB0YxuElUljBYDF
 UVChYeiTSMyKSa0YN/UI5TnwOj+bGy9rVOzmIHhsPIeQENs4vOOb6n2qMDjVZFu5rbdlcOLhSWo
 oEWPjCQwd30kBQrpVoGkb7GgyokgTsvkLqHB49K3H311ieNPIBK/fgJOvVT9zVHsQzTv+HIPN8/
 H78srulyKqL5d+K7elSCFLQ==
X-Received: by 2002:a05:600c:4f94:b0:45b:74fc:d6ec with SMTP id
 5b1f17b1804b1-46201f8a4c4mr11481875e9.8.1758095634523; 
 Wed, 17 Sep 2025 00:53:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPHrSBouv4ER+kvvVPReKbt4nibwhGmkMOBAJxceAuxxGGacODXtgmWTIFInQrJF7Z7x6Q4A==
X-Received: by 2002:a05:600c:4f94:b0:45b:74fc:d6ec with SMTP id
 5b1f17b1804b1-46201f8a4c4mr11481455e9.8.1758095633997; 
 Wed, 17 Sep 2025 00:53:53 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46137930274sm25072265e9.6.2025.09.17.00.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 00:53:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/3] drm/sysfb: Add custom plane state
In-Reply-To: <20250908122240.740033-2-tzimmermann@suse.de>
References: <20250908122240.740033-1-tzimmermann@suse.de>
 <20250908122240.740033-2-tzimmermann@suse.de>
Date: Wed, 17 Sep 2025 09:53:51 +0200
Message-ID: <87cy7ppl9s.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8Bwu_-USSYilPgGxIW737KdbsDSqNlAUWo3WZqFU2y0_1758095635
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

Hello Thomas,

> The plane-state type struct drm_sysfb_plane_state will store the
> helper for blitting to the scanout buffer.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Looks good to me. I've just a minor comment, but feel free to ignore it.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

> +
> +struct drm_plane_state *drm_sysfb_plane_atomic_duplicate_state(struct drm_plane *plane)
> +{
> +	struct drm_device *dev = plane->dev;
> +	struct drm_plane_state *plane_state = plane->state;
> +	struct drm_sysfb_plane_state *new_sysfb_plane_state;

IMO the code is easier to read if you add an additonal variable, e.g:

        struct drm_shadow_plane_state *new_shadow_plane_state;
> +
> +	if (drm_WARN_ON(dev, !plane_state))
> +		return NULL;
> +
> +	new_sysfb_plane_state = kzalloc(sizeof(*new_sysfb_plane_state), GFP_KERNEL);
> +	if (!new_sysfb_plane_state)
> +		return NULL;
> +
> +	sysfb_plane_state = to_drm_sysfb_plane_state(plane_state);
        new_shadow_plane_state = &new_sysfb_plane_state->base;

	__drm_gem_duplicate_shadow_plane_state(plane, new_shadow_plane_state);

        return &new_shadow_plane_state->base;

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

