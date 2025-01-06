Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3919FA020FD
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 09:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A1510E5C9;
	Mon,  6 Jan 2025 08:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yr/XKmJw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122E710E5A1;
 Mon,  6 Jan 2025 07:28:16 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2166f1e589cso244332045ad.3; 
 Sun, 05 Jan 2025 23:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736148436; x=1736753236; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/7jfOL71tWUOGGkzKVgkd6UKk+XBmLOvILDBWl4XWBQ=;
 b=Yr/XKmJwbUJYzIR22IsP6fNyyPC8uF4GAn6mhrh8w8iNJ6HDVchDYAODXyEQZfikhB
 NpCLS81dCe1UrIFbJIolv8suv3mZdd6ygBlQb/eiv8hZolvuTl8vYYsfaaIOJPFlheOC
 Oga2bxd7Zcwmg/5v2NE74fAANhuMaRev9ME7xrsknbw5TznpYjfapA39n1b4lzf5ORbt
 Maw3B6jR2dUtR/GN1NVzXrJK0XUEoYGUSz0KDGFw8C3JeMQAIH+3yhFHcKVAiTVjw2ed
 um+aTRE5k8eMX+U0AhRvXsw0ml+8o4aRak6ayTMPkw2zowtgcZK6SEgcPJi6uXtZfxWm
 6Zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736148436; x=1736753236;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/7jfOL71tWUOGGkzKVgkd6UKk+XBmLOvILDBWl4XWBQ=;
 b=LXzRjg0j/tpskyi+xIUtkcnNMAIUz1o8zX5WONuzrVkeDd4Um9dsZR7NKgqkHAwwpW
 bLmYIZawin0RwgRVwYgCuWWaWYg3xwLVe5MbsPiz6On7X3UT3CvT5i9/Xost9zeeevkq
 duCvCfA5Rg049XyzfSKCuQTjdhZq6tsUGztaN8ZQslb5bIbAMFWLIPK0NSEAHAubSm6n
 uRCEnZoeKmjmUbTsKNbnpVK03g+VfxGrsQFWxQh7D2pZCrXgQuWP5wLnasPx5Bfqe4B8
 lUL14r/uqGFK7chqAT+7JyZKsaqBP1JGrIYE+tr7xR0U9ZZncPIPJZhMzcUbjmjKl6Q5
 tyMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlAfAcajizGldLTDhY8rVtf3zLzW5pfrHYuzbx9cRun5VWH/AZNAdaQHTwr+XoEpBLZVM+ZbauTGCgJzVXtA==@lists.freedesktop.org,
 AJvYcCV59r73wOGWasnkCnH0hg+ZrxmJnGI8nNKaxdOZl05Ny8xdsl/7nP5goE1aOE8sLyWIcDSCGFBL3p2H@lists.freedesktop.org,
 AJvYcCVQ+NhRyEyXxJFCWOly1WpdqJgb2077ND1CcmFsj3wCIDSEmOfunLdbpQcQelqkgpLHnXPRlFVpSpg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaMMf8s/MTNJUY9eJYelBIYPS7k4p35g6WlM5J5DW4ebxTv8eh
 0tLXPz3H+ZI4xyWUYX3IzuWt+oLSuyN0pDnPnCM7DR0zLtFnc5II
X-Gm-Gg: ASbGncu9WFn0PzxxQbJlG10aLlVs6xaft7Ru+kHKDUr18kQM7c3o/5kgpCHOs4qSNyM
 5vOQLk4kCYolv9H6623hTflSMbqiEpwo6NY3vjoUaumPJNgo+pnlvsIn86h0gkOhxu86Vx3esjR
 qa3PVcZkBY0Ca6NljXytffEKePpNS0Ahgn9NnUCxXPGEqy6HjdNcBxAD9FKld9Z4aUSvnENJvJ6
 wuyScvIt2dVtFM+YgwDwSqDs+00/FAKv4lrDsosE0uaS/Rnlz79VP0weEnbaKhcJalR/2h+0NCj
 Or60V5y+nNVrDQ==
X-Google-Smtp-Source: AGHT+IHBSDftZTnXKI/z/DRL650EUOhPG++z/tC+faGjJGBEXnvi9lBhkiv7aWrmSZbPH+T6Qdco7A==
X-Received: by 2002:a05:6a00:124a:b0:725:f282:1f04 with SMTP id
 d2e1a72fcca58-72abde846e5mr80960187b3a.18.1736148435657; 
 Sun, 05 Jan 2025 23:27:15 -0800 (PST)
Received: from localhost (softbank060124177046.bbtec.net. [60.124.177.46])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad815796sm31704909b3a.28.2025.01.05.23.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 23:27:15 -0800 (PST)
Date: Mon, 6 Jan 2025 16:27:11 +0900
From: Zhenyu Wang <zhenyuw.linux@gmail.com>
To: linux@treblig.org
Cc: zhi.wang.linux@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] drm/i915/gvt: Deadcoding
Message-ID: <Z3uFz2hiYH5z1qVn@dell-wzy>
References: <20241222002043.173080-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222002043.173080-1-linux@treblig.org>
X-Mailman-Approved-At: Mon, 06 Jan 2025 08:39:56 +0000
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

On Sun, Dec 22, 2024 at 12:20:40AM +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> Remove a bunch of long unused functions from
> the gvt code.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> 
> Dr. David Alan Gilbert (3):
>   drm/i915/gvt: Remove intel_gvt_ggtt_h2g<->index
>   drm/i915/gvt: Remove unused intel_vgpu_decode_sprite_plane
>   drm/i915/gvt: Remove unused intel_gvt_in_force_nonpriv_whitelist
>

All three cleanups are fine with me.

Reviewed-by: Zhenyu Wang <zhenyuw.linux@gmail.com>

>  drivers/gpu/drm/i915/gvt/fb_decoder.c | 117 --------------------------
>  drivers/gpu/drm/i915/gvt/fb_decoder.h |   2 -
>  drivers/gpu/drm/i915/gvt/gtt.c        |  66 ---------------
>  drivers/gpu/drm/i915/gvt/gvt.h        |   6 --
>  drivers/gpu/drm/i915/gvt/handlers.c   |  17 ----
>  drivers/gpu/drm/i915/gvt/mmio.h       |   3 -
>  6 files changed, 211 deletions(-)
> 
> -- 
> 2.47.1
> 
