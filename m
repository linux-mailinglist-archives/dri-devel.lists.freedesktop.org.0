Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A884AB7E32D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE36F10E43F;
	Wed, 17 Sep 2025 09:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YVJLy9px";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C7810E644
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 09:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758099976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s42YcCZtqG5U4tPE6MzbcLPNCyA0Lf5G1D7xBLSScnU=;
 b=YVJLy9px9ZohCMwTroFa8tsiymyIasllX5G0CEtHRdptSQUFRR/PMyWBTi+Bwl5DYRPaTc
 /Rf0El6Zli8J5QDrmNZhzjPjcZ5V0rJGF9G5K6mepoC7Eww0jwV4SKNi9DPh8maQ0YuG9X
 6fZefso3//cLQYixsCSkGNzHDuY3u5c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-cfRjRA2yMcCXcvLWoquz2A-1; Wed, 17 Sep 2025 05:06:15 -0400
X-MC-Unique: cfRjRA2yMcCXcvLWoquz2A-1
X-Mimecast-MFC-AGG-ID: cfRjRA2yMcCXcvLWoquz2A_1758099974
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45f2f15003aso19763495e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 02:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758099974; x=1758704774;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s42YcCZtqG5U4tPE6MzbcLPNCyA0Lf5G1D7xBLSScnU=;
 b=b+xQouPzvXDjX0r00W6g9sFVZr9i9480TaCCKkths4d5s0d4LtxZsKyI98bQNYhtki
 dOQHls3O14+ih4ToHjQpoBPo4QjHLEYO/FwVh0mZl86K4Fy47YoH7HJFd23rcq3eoBEp
 WbiAYGyPwaCnpok/v5bhu++DzYsN1vuRbF6v2AtHnNt8Auq+9wk8KYutbjRC5KMoon3I
 hVg//qGCOWL1+4u3EPfWCFxxqenn4LyR66q7cYrPAyUPd5I8x6VZF9J8MYoPSqGMsou+
 yWOIL2Oy41RAyfyAgkrQlUGBGS1+42R1AoaXxItG97skc96EGB9jyebqCC9Gs4JXo8nq
 LWFQ==
X-Gm-Message-State: AOJu0YzbOMFHi/iYKreZrXvOINVWiJkWsMfAu3WTuXta2YBz86h84eBK
 FVFmdSC30G6s3PHL1Q3XoYszCtvgGffAvtIQaykmG29eq1YaVf/AEp2JIErbMxss3W0QQcVObru
 rlCwE9puLo7noCMo30PysNQReG5omgwpgVeEbfQkoyOiPiHE8YE3zz8tvBiNQLFHeZn5C7w==
X-Gm-Gg: ASbGncvSZ6JeY0cHDpQirwz0wK6W8mgVP1GexIxkHI5K1nQUU8Y8W1ed+lSWMqPLGQI
 hFwLoAhkV9//WNfnEaYBsXsPg+FN85yd5G1x/bghI36xlJWGOVWGjWrOOe4MjO6CPq89c7dy0d8
 PUntWzhmfU2QePGSxACvQXe2vOpeGmsVmBdwIMFSULz82jw6qfQb0UtErZLUdbD3z7ossSKe0fw
 dUHo8KJA8iK2bKIOoDCqmNHiMJxCH5yrqZq/My9RkJiLhsJXWDt7egK7Zr/ea6+XRgbPlxR++xh
 bFPBcYJ9rALaTNFRUS56+mSj/7jOo5rg2rTdAkTQjIy7Em1011c7eWe/2x9izaMX4Lbz7qsB1iH
 IWTpASUpT/al9pUdHmEx1cQ==
X-Received: by 2002:a05:600c:46c6:b0:45f:31d8:4977 with SMTP id
 5b1f17b1804b1-4620683f20bmr14655465e9.30.1758099974026; 
 Wed, 17 Sep 2025 02:06:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcyoriy+uMOj9MXtJ6yzyrRmGbnqpV4ucQ0xz+kHdj29UO15ZM66mcByWkYZMl93uD4Cj9Gg==
X-Received: by 2002:a05:600c:46c6:b0:45f:31d8:4977 with SMTP id
 5b1f17b1804b1-4620683f20bmr14654525e9.30.1758099973064; 
 Wed, 17 Sep 2025 02:06:13 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-460942b6c3csm23049745e9.1.2025.09.17.02.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 02:06:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Iker
 Pedrosa <ikerpedrosam@gmail.com>
Subject: Re: [PATCH 1/5] drm/solomon: Move calls to drm_gem_fb_end_cpu*()
In-Reply-To: <20250912-improve-ssd130x-v1-1-bc9389ed299e@gmail.com>
References: <20250912-improve-ssd130x-v1-0-bc9389ed299e@gmail.com>
 <20250912-improve-ssd130x-v1-1-bc9389ed299e@gmail.com>
Date: Wed, 17 Sep 2025 11:06:11 +0200
Message-ID: <874it1phx8.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QYTxAPdayQZpl_7af5t4SfQhMGvLwZwa5wBxbYitfQ4_1758099974
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

Thanks for your patch.

> Calls to drm_gem_fb_end_cpu*() should be between the calls to
> drm_dev*(), and not hidden inside some other function. This way the
> critical section code is visible at a glance, keeping it short and
> improving maintainability.
>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  drivers/gpu/drm/solomon/ssd130x.c | 33 +++++++++++++++------------------
>  1 file changed, 15 insertions(+), 18 deletions(-)
>

[...]

> @@ -1232,6 +1214,9 @@ static void ssd130x_primary_plane_atomic_update(struct drm_plane *plane,
>  	if (!drm_dev_enter(drm, &idx))
>  		return;
>  
> +	if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE))
> +		return;
> +

In this error path you should call drm_dev_exit(). The convention in the
kernel usually is to have a goto label for this, e.g.:

       if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE))
              goto out_drm_dev_exit;

>  	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
>  	drm_atomic_for_each_plane_damage(&iter, &damage) {
>  		dst_clip = plane_state->dst;
> @@ -1245,6 +1230,8 @@ static void ssd130x_primary_plane_atomic_update(struct drm_plane *plane,
>  				     &shadow_plane_state->fmtcnv_state);
>  	}
>  
> +	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> +

and then here before the call you could have the label.

out_drm_dev_exit:

>  	drm_dev_exit(idx);

Same comments for the other places where you are adding the
drm_gem_fb_end_cpu*() calls next to the drm_dev*() ones.

After the mentioned changes:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

