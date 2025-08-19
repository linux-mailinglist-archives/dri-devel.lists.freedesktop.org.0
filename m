Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 634D6B2BD95
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 11:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBCB510E29B;
	Tue, 19 Aug 2025 09:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QQU0ofnO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F59110E29B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 09:38:40 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3b9e41101d4so2669355f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 02:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755596319; x=1756201119; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=at/5eKe3PrrAbraNpLb6KoExLUDoe69Dgy/Mvb40QeY=;
 b=QQU0ofnOxY7FwNpiWrICv3qTAzjJq9oy1EAt3ZJLT+xBh1XkdcFQ26YGKo/JZcjiDG
 7I/5Bc3LYl1gIazVynkEyayI7liRHFxHkOvohxUBX8sb2DzFv8KoifYB4nRDhdkh+TV9
 8qamydkULTNvYKM9iTioSZahQV55LrCD1nZYAQMbMBpaWjGgj7EENdVwbzbTv7Zn74sZ
 ded9OFYaEtZQJD0DV0676ujBmZY7D8rbIFuqUCfDEuhS+kpIY5iqbr+PBiGTbTJ0DDjB
 c/Z6fxMhOPSdBUmuKU6N2fVQri4uraUQmilpuT8DlW/5s8k2CltRlqYdxqMV/ZbOe96S
 HgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755596319; x=1756201119;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=at/5eKe3PrrAbraNpLb6KoExLUDoe69Dgy/Mvb40QeY=;
 b=GoNGRKrqIQXaJd//VOdhK0fM4yBpTn2vDutqcqpKsgcv9gwB6udV2ooONJ061+3Tey
 B/XeoAzyweD1L+zN2ZzzqgtrRrdZsrSmCZ+AzTSPEOcQV3BQFbWFHQZD/eW2n3x3ZOc2
 QLl6XTn+V2J8+r78PANamNzqw6tED34xXm6To+LkJ2mKhUyiK0ILxTYKfbWCqbM+Wwl/
 dNilP8ABT0Ly6xdf+bXCd4d9hsyH1Xil19/gTQDvcWnAIsI0gCsbxYxnqwO3BLuV/s1K
 cjsJXbKuavLG6SXV3nuGcsDRUxx2lurNrTAV2RW6SxZzWtPElpltCCQ54f0ldX1QwUXZ
 DiMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/Mi5k/JwDF4Nj+w811RVKjujthFk/gFnuHTDStCV5t80zN48B1fMAvMuGoeHfn6h6Jv+9fiCrbM0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpXiAAsMMUFQ5ftZHKNoZOSW4QHAbcC5XTwsw8kWdE5Ru9N6Mo
 NblRdwOsEsdT9YRr1kKUWB9GB+8l2jzjjA4bCDuJ+AqFPYU3xUC5NhE9SxNVKTkvVJE=
X-Gm-Gg: ASbGnctvFZJZg3x4sKdauRUp5zqN4YLzGb4ZStgBI/uD87R9llOXBnS/kipAjIjUALw
 tKofXj9QigxCdEaRHkJcvb5Th4OaYARiAdDcpqPKOr+X5/tQe7rDHkHGma+YgOXVWYYw8cg/syt
 KUbakISEi2OLzr+TmvE3iU8ErPtkGCajUo+aNwN+lnZSKQsjVEnFF/5/1KaU52prd3RvU7+fxSM
 kDyg9/8C91yaL2tIxGaYtEPTc6CWgBLoTyz1A+sxR5AGnAf9edj25UuDzhIr5xWsxRvK6LScPJT
 Mo7FFF4aKNRc3BsNHhb9S5NO+0dNiZih8EYE0KkVSPK5i2nF177sWPXYRh0OJvMOtcXt3VUFG6l
 t3eZ2TTUolnHR3oEQG394Nspi2Qw=
X-Google-Smtp-Source: AGHT+IFkB5hfOSqRO9ucIKbwVALsj+nCtLLW02xqPar2YbcIy4HqcpvqEUmAihdf079LhDp9jt6P0g==
X-Received: by 2002:a05:6000:4028:b0:3b7:7749:aa92 with SMTP id
 ffacd0b85a97d-3c0ed6c4b1cmr1345276f8f.58.1755596319074; 
 Tue, 19 Aug 2025 02:38:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45a1c6bd172sm220059075e9.6.2025.08.19.02.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 02:38:38 -0700 (PDT)
Date: Tue, 19 Aug 2025 12:38:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>, Xaver Hugl <xaver.hugl@kde.org>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/plane: Fix IS_ERR() vs NULL bugs in
 __drm_universal_plane_init()
Message-ID: <6f9fc3889e0c79d7ac2833f3a2a6ff8b047c2b11.1755591666.git.dan.carpenter@linaro.org>
References: <cover.1755591666.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1755591666.git.dan.carpenter@linaro.org>
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

The create_in_format_blob() function returns NULL on error.  It never
returns error pointers.  Update the check to match.

Fixes: 0d6dcd741c26 ("drm/plane: modify create_in_formats to acommodate async")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index beef2a06bc75..2f5a95bc0528 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -483,7 +483,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 	if (format_modifier_count) {
 		blob = create_in_format_blob(dev, plane,
 					     plane->funcs->format_mod_supported);
-		if (!IS_ERR(blob))
+		if (blob)
 			drm_object_attach_property(&plane->base,
 						   config->modifiers_property,
 						   blob->base.id);
@@ -492,7 +492,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 	if (plane->funcs->format_mod_supported_async) {
 		blob = create_in_format_blob(dev, plane,
 					     plane->funcs->format_mod_supported_async);
-		if (!IS_ERR(blob))
+		if (blob)
 			drm_object_attach_property(&plane->base,
 						   config->async_modifiers_property,
 						   blob->base.id);
-- 
2.47.2

