Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1B3A353E7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 02:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24F510E796;
	Fri, 14 Feb 2025 01:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I0DMnD2I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266AB10E796
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 01:55:07 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6dcdf23b4edso13960636d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 17:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739498106; x=1740102906; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v7hcmi3D52Q8E6QfNbGo+6Scsa2Zp9WSOQdDFyzodKM=;
 b=I0DMnD2IgmgJGyHo3BIl3/iqL4pIQq7K52PRrHRkR9KlYN1K/R0oeQuVJ9HuyZXDyl
 HLyERhL5tA4ZsJDMUwor5x/RU4klFMVYDK7JyTvCTU3DBCS0ZD28ZDT0nAo0Nb57tyHU
 3sqqabBzAO0hUTWlRxaFrC8lUrGM0RfHRNg6y8FFLrdrz/czvp95Jr52RjOpmiJGXYGc
 jd76B5TOPx5c1gRmtv6hQCDQu+jvuvgUYQO+HcGc5H3ktoVIu5wG3IrsXwoS8gG3vlCQ
 cJKc624MDwKuEp10nEKF932JSKYE3PZXni05L9500QQgm2X6pGUdaIPxSJftBzO3x0KT
 S9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739498106; x=1740102906;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v7hcmi3D52Q8E6QfNbGo+6Scsa2Zp9WSOQdDFyzodKM=;
 b=dcSjShkwMFd5a3dqtCfnKEZQUvo2mwY7tEMcBvoBRhnPnQ9zBFT1VagOcydK9zQFNR
 1x+LUJGCzHM3cGvWNn5O27pZL/rI52DSzHiVmRDz/+Y7tfQYOg7PzFolAi2B3A0rAkGM
 ugDe+tqVP/F2Rkrt3Y1CnusjIH768H757xlFoG54/GrUQvt2iDC4IiW4BU6HQwWwQwjy
 WKQlTvETQkQFfFjIAIyXieXQ5QgpAc8HjkuhZVVDZCEDAdA1Bh7uy6mBnYZFz1dTmDmj
 afwTuk+YRqE2KHT5lEgfPrT4kKhzYyb2ANkEQnx820gwVifIS2KwyzJ25XwRdP6YNHpH
 HtUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBUduN/NaHRiGdNnF62JK0au/6KwW2FqT7q1menPgSaq9ZOLWXCYJOozmI7UqWBjcXOZoNhFhrgqE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6fhXApGLF4U+v00XOGKwk/6fD+vhaem842ufmLTNAF1Um9wCg
 rwJVYhfeK++HNyRNtK3Yi7qNlWJScjkrN8rCWpa6hZ4M3DygLkbx
X-Gm-Gg: ASbGncv7EaIWIYQNPFHeOZJdlmpxx6/dz0Ed9uddlC5vsgZKAOyo7Jf92lnuDlBtlHr
 ULItIeybN1ENPcSCZXWWKwRqD2WSj/4RUyNi1kE6p7RcM6lRfCqTIkMWgp/tgxBPbxEbAyeECeA
 ADk+K4Gs4QnqRn7tKQ6F1H6jGfBI4t0omaZqlOkRWSvp8fJdbxpqQvinyO/hubpFuOy+vcXuVfU
 dZeoRI6OzW2tCewWmzIxE9Q59tF2Qxi156CkSDeSHpodJfbKWpmlCLNq07AvWLNVy75Z8soedRT
 A3amzvg+m6BXDTeXKtU/C82wy8K9vZAjCkw7j1fpWiz8ZFQiTX6x
X-Google-Smtp-Source: AGHT+IFKc3TLG8LG8D3zxGwyYTUjO6FC4U/JBOmsUrPI1nqXN6jqDdFrM4DpEVmDCbZNaeOPBA4Kjw==
X-Received: by 2002:ad4:5c46:0:b0:6e6:6686:afcf with SMTP id
 6a1803df08f44-6e66686c9aemr3613236d6.4.1739498105872; 
 Thu, 13 Feb 2025 17:55:05 -0800 (PST)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e65d7a3caesm15936166d6.54.2025.02.13.17.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 17:55:04 -0800 (PST)
Date: Thu, 13 Feb 2025 20:54:59 -0500
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] drm/repaper: fix integer overflows in repeat functions
Message-ID: <ejsf4dwcyg7j4wdpdtbs56lbwokzlq65fxn2gxio4l5xg6di2r@pmnpafv3nwxz>
References: <20250116134801.22067-1-n.zhandarovich@fintech.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116134801.22067-1-n.zhandarovich@fintech.ru>
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

On Thu, Jan 16, 2025 at 05:48:01AM -0800, Nikita Zhandarovich wrote:
> There are conditions, albeit somewhat unlikely, under which right hand
> expressions, calculating the end of time period in functions like
> repaper_frame_fixed_repeat(), may overflow.
> 
> For instance, if 'factor10x' in repaper_get_temperature() is high
> enough (170), as is 'epd->stage_time' in repaper_probe(), then the
> resulting value of 'end' will not fit in unsigned int expression.
> 
> Mitigate this by casting 'epd->factored_stage_time' to wider type before
> any multiplication is done.
> 
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
> 
> Fixes: 3589211e9b03 ("drm/tinydrm: Add RePaper e-ink driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
>  drivers/gpu/drm/tiny/repaper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> index 77944eb17b3c..d76c0e8e05f5 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -456,7 +456,7 @@ static void repaper_frame_fixed_repeat(struct repaper_epd *epd, u8 fixed_value,
>  				       enum repaper_stage stage)
>  {
>  	u64 start = local_clock();
> -	u64 end = start + (epd->factored_stage_time * 1000 * 1000);
> +	u64 end = start + ((u64)epd->factored_stage_time * 1000 * 1000);
>  
>  	do {
>  		repaper_frame_fixed(epd, fixed_value, stage);
> @@ -467,7 +467,7 @@ static void repaper_frame_data_repeat(struct repaper_epd *epd, const u8 *image,
>  				      const u8 *mask, enum repaper_stage stage)
>  {
>  	u64 start = local_clock();
> -	u64 end = start + (epd->factored_stage_time * 1000 * 1000);
> +	u64 end = start + ((u64)epd->factored_stage_time * 1000 * 1000);
>  
>  	do {
>  		repaper_frame_data(epd, image, mask, stage);

It might be best to change the underlying type in the struct instead of
type casting

Best regards,
Alex
