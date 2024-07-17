Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D242933AC3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 12:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED2C10EA4B;
	Wed, 17 Jul 2024 10:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YZhPCmxV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD9710EA4B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 10:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721210748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9XVOmJ5qZrjBzzyMjCpJUJSvkbzb7dNjfwAsLgNQSeI=;
 b=YZhPCmxVkaZPA9d1QmzjwrMSp+ztj1g3W5H3/0wtGjhGunTnEcc0mO9EOwfHB9UqaUNQEf
 ekgOs4i1RsHF/r+l/1Usp6QE2cermosMvoR2BejBypmIwegnkzRzqNKBYamODrlZKu2MDB
 +TnLAbxoZEdAo7riFKUrJ507sc8sK/s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-FrwbF-CmP7SMn0lVcNuSPw-1; Wed, 17 Jul 2024 06:05:46 -0400
X-MC-Unique: FrwbF-CmP7SMn0lVcNuSPw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3683165c576so489264f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 03:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721210744; x=1721815544;
 h=mime-version:message-id:date:references:in-reply-to:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9XVOmJ5qZrjBzzyMjCpJUJSvkbzb7dNjfwAsLgNQSeI=;
 b=e2Z1kAETlKio6SZHCIzActlWcMOh2q5KmUBbtyvjxf5Pb3OpZDiQQFSAJvto/nbQ5D
 PWk2sTgrKFBrblHgo962D4GpnAnfevoAhF4xiHnS4tnKYPy6zbiUkozUsKJolQSL3zCv
 b+IH7tDpKZOL6LGO9UtWrO5QtGHUUyMiKUeZuiKNa7SOmJP+cjtw+xbHIvpxjL0Haax6
 W1S8wGD75zkYohpNbGhVWUi/Bn35Xw4llg36VX8BtOWAUsoaG/nesDuaGS1iRQWwZw1L
 c9QQT15WZs51piPziEPvzaHiEcv9st/i4y4GPltiVu+i5eeUp3DXWhm7h2lCMCnI3Ia7
 0MVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzZmwVL8KOPGtfLsnY62SADQAZFUQrPR4POQXKVrc+9acwgTVxXLgFD63lErCAFOsiiGLsN/vBTk0Z5jj1oUzEkq70SIS4hIG8gkx8kv9V
X-Gm-Message-State: AOJu0YxUdlzWZ8+AD3s8hl3k43254oPGX7WEVodh6OWGLIXwS56hnwVP
 5AoSrMOvpXje8fLqICvzcaY+GQaNrITMDZTH74DTGOZ4bItut8SwEWslCGE3v1gCUefQzFL+C+M
 HUBuRbU6XRYRchREGJZHiAGpamcdEjXm89reoTt8AusUpI82pC1m9nQWLxEXWw9ev/Q==
X-Received: by 2002:a05:6000:184a:b0:367:f054:620a with SMTP id
 ffacd0b85a97d-3683164e06bmr1376770f8f.30.1721210743914; 
 Wed, 17 Jul 2024 03:05:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFyrK5oxCiDB6/FrZj9Bduj3f7Nd98eJNJ/eqEUmn3jqfve7vxK7uYWjf+/MzztI+lNDC9JQ==
X-Received: by 2002:a05:6000:184a:b0:367:f054:620a with SMTP id
 ffacd0b85a97d-3683164e06bmr1376729f8f.30.1721210743535; 
 Wed, 17 Jul 2024 03:05:43 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dafbe7csm11270820f8f.83.2024.07.17.03.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 03:05:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>, "Jiri Slaby
 (SUSE)" <jirislaby@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/panic: Add drm_panic_is_enabled()
In-Reply-To: <20240717090102.968152-2-jfalempe@redhat.com>
References: <20240717090102.968152-1-jfalempe@redhat.com>
 <20240717090102.968152-2-jfalempe@redhat.com>
Date: Wed, 17 Jul 2024 12:05:42 +0200
Message-ID: <8734o85o5l.fsf@minerva.mail-host-address-is-not-set>
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

Jocelyn Falempe <jfalempe@redhat.com> writes:

Hello Jocelyn,

> It allows to check if the drm device supports drm_panic.
> Prepare the work to have better integration with fbcon and vtconsole.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_panic.c | 20 ++++++++++++++++++++
>  include/drm/drm_panic.h     |  2 ++
>  2 files changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 948aed00595e..d9a25c2d0a65 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -703,6 +703,26 @@ static void debugfs_register_plane(struct drm_plane *plane, int index)
>  static void debugfs_register_plane(struct drm_plane *plane, int index) {}
>  #endif /* CONFIG_DRM_PANIC_DEBUG */
>  
> +/**
> + * drm_panic_is_enabled
> + * @dev: the drm device that may supports drm_panic
> + *
> + * returns true if the drm device supports drm_panic
> + */
> +bool drm_panic_is_enabled(struct drm_device *dev)
> +{
> +	struct drm_plane *plane;
> +
> +	if (!dev->mode_config.num_total_plane)
> +		return false;
> +
> +	drm_for_each_plane(plane, dev)
> +		if (plane->helper_private && plane->helper_private->get_scanout_buffer)
> +			return true;
> +	return false;
> +}
> +EXPORT_SYMBOL(drm_panic_is_enabled);
> +

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

