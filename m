Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A43A3F0F0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 10:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9FC10E23B;
	Fri, 21 Feb 2025 09:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="k/9cW5ai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93AD10E23B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 09:51:04 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-38f325ddbc2so1321793f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 01:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1740131463; x=1740736263; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EkBqyj1NJ++IcFdvPYM6tSZ9F5kg9Qwf+D+lXPfSeHQ=;
 b=k/9cW5ai684bD4MHj4P+G7+91mBVUD7sIiI8Oee6oCZjsSYmQb16YW7GdZxSgyktQc
 f2qyn5glt2utWoxQ8GZG7T+k7zdmwWxD0bQRVDSmKMQUmrVa+y7Ln8v/YN2IOQ+T8jB0
 UrN9TxcN/+ng4wkg410lWPkcRsx0RrL6Qn3n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740131463; x=1740736263;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EkBqyj1NJ++IcFdvPYM6tSZ9F5kg9Qwf+D+lXPfSeHQ=;
 b=t3TM41vgywRlJUvC6LGZDeNT0eOydM7xN4tkg425QrWtngmLB9PlTKu9p6Gkpoj625
 ealpWuu9wsgyfXSsoz1friA2hf0Jbj70KE/xPK+y0T9yKz+qPniYzwZK1YCXDr+ECw66
 i2lmmyfxg/rgPIje9xBZlfrY2dPBRMJF53LByqmPKtTdnCEJ5emCpEm+vSq6XNub1k7n
 wzZLs+96W3BIqCLrFUfM8BMzhdXiwkIXulAY4+nKBBG3lla/Oh9btZVLNHHVjVapjsze
 AeGAkV8GSTq7vnT4IOpxS/7zQGuifsBS2SkpQ/wc2QLbJYQvQrA9IoGC9JN3t3KGoZ17
 MShQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy0DcwZCu4gZ5gycjsCqsWbHvcRh9hZovdCbA8QVERa5VKZBrpJT63TnmwBuJjqirbQHZHbJiXNoc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0JH9QCh4gAVcB8l17K8DAV1OcaGL5bwBwREhPb0ofyRcC4SoZ
 wdEzhum6o4LeTb1zRPpQxqGZFxfCefFJZLdnFt8EJLO9GPvPJw+aDzrMNqVnogw=
X-Gm-Gg: ASbGnctjY56WfUSkXKPEuyCv2/SqFCxgRaDbDpweupBHFh3WsjHEuYajkoA5Ym8ggkB
 9m/GIlOt2CUWos5cKOG5Ylp83OXa0bm5wefkm7PoHZ5D7kar4xpGx8iY76RPf6kNjVjVwlNVELh
 AYOq8DzkqJkwWMlseCzoMYnGgc+yUsUJFvHaMPfGQTTiMZuPcp5mkR7+iY7w65B9yXDy4eBVoid
 KepVAyH8QfmxXmqjJM/sOaW5/CgPQjggXRmDqOdvfKmw3nBawAbsJ49elBscUajgqmlAINI3ZCv
 Z6Ed6bP7n3kmGz5ID0mSCsWfocz5lYc4qczGzQ==
X-Google-Smtp-Source: AGHT+IHmq7b1qRekf8aTazizZx9u6TzOuIpZCimXH5wNq+e74czCrxUFI8LledckRXx1iP2HXeSuuw==
X-Received: by 2002:a5d:6c6d:0:b0:38f:4cdc:5d2a with SMTP id
 ffacd0b85a97d-38f70783feamr1553394f8f.4.1740131463231; 
 Fri, 21 Feb 2025 01:51:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b01346d1sm12342375e9.0.2025.02.21.01.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 01:51:02 -0800 (PST)
Date: Fri, 21 Feb 2025 10:51:00 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] drm/atomic-helper: Add a note in
 drm_atomic_helper_reset_crtc() kernel-doc
Message-ID: <Z7hMhEz_hTymarO1@phenom.ffwll.local>
Mail-Followup-To: Herve Codina <herve.codina@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250220140406.593314-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220140406.593314-1-herve.codina@bootlin.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Thu, Feb 20, 2025 at 03:04:06PM +0100, Herve Codina wrote:
> As suggested in [0], add a note indicating that
> drm_atomic_helper_reset_crtc() can be a no-op in some cases.
> 
> [0]:https://lore.kernel.org/all/Z7XfnPGDYspwG42y@phenom.ffwll.local/
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

I'm assuming you or someone else at bootling has commit rights? Otherwise
I guess on Maxime to get that sorted.
-Sima

> ---
>  This patch applies on top of the following commit available in drm-misc
>    ab83b7f6a0c1 ("drm/atomic-helper: Introduce drm_atomic_helper_reset_crtc()")
> 
>  drivers/gpu/drm/drm_atomic_helper.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 0a636c398578..1f93b0a855de 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3371,6 +3371,10 @@ EXPORT_SYMBOL(drm_atomic_helper_disable_all);
>   * This implies a reset of all active components available between the CRTC and
>   * connectors.
>   *
> + * NOTE: This relies on resetting &drm_crtc_state.connectors_changed.
> + * For drivers which optimize out unnecessary modesets this will result in
> + * a no-op commit, achieving nothing.
> + *
>   * Returns:
>   * 0 on success or a negative error code on failure.
>   */
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
