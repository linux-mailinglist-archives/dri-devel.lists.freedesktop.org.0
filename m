Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFCFA33127
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 21:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BB210E2A3;
	Wed, 12 Feb 2025 20:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LKAUqkVQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606D910E2A3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 20:59:32 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-308ec50eb3dso1695531fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 12:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739393970; x=1739998770; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kAeorjfeT+F7+M8JM4C+sVVtADje7c1d5OIpx9HNApo=;
 b=LKAUqkVQjR0St5hJ5kYmQ0GKwKA+OpT4gL0dDzOFjPyQOQgm4QRx1tQ3wkRr+1ZgKy
 Jwr3ktTkaYRTvM/F+CJ2WVNXFe7AL2hG63Es42Fk9OUbA3aiICpMGqNWEPZN4W/0dmHS
 CxlK4cIch7XRPUe1hDF1uZBwLV6E3Het9gfsGqJqBncBwNF4w4Aw8m6kznzH+FiWkgwW
 2QHobCRaowKg2e09frFOxR1Zm6l62Lz2lK8RO2WGaOWDE1+M9V20Db5CrmxN+9bdglTf
 /fArGhc/Ve6OUkcvNaoBVxxxbnK8vIvlsG53I6C8DuQSlq73KCIP4wXpbyvlITnbQv4u
 nuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739393970; x=1739998770;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kAeorjfeT+F7+M8JM4C+sVVtADje7c1d5OIpx9HNApo=;
 b=YQpfnTGqwFMGSFbnD3DQ6J7RV1UllpCBTVHKc3j8STJorHLF6zy2zq9lOYLDM95zLo
 nxviq/nFS0GYDQT1Z9BgjVMsvpa5yPfTpR7poRz7pknN+UKM/+kNTys8TQvcEo6blHlk
 hHLjdxb3JzH8+fqf6llq2RZwrGSffJjoCOpoMy3nHUVXDWnmNrE0hWfDij9V0PgMFfIT
 DKRlgEMn0lgVNYwAfWbZogeI37rB1+kdu3virGIEA3mxHL9jgEZWTLNbmh6gUM43rS7I
 UIAebKkoUWQm3c/SQ2hIoOrwnVpfzNq9Ki3YyGPht3tfDzbpzFCOfToFcm7VI8epRDRU
 izJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1Uj76kIHrVFN7J7GBdtpga1YMQ6Hw+JL2QsKb7K5Bjfs9ytL7OuFMtPpfolyaWz0Q3EIBkdTOBoE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5pjFmugnQOxXH1VeZ9n5QZlgJv5X5qU9WLFzrwKuQzFFAljhY
 LlnFw1nzgfklS/w76TA6AirMALtLUPGR12VxQT66G18Tyk0KnMPGQY0X1Jt91fw=
X-Gm-Gg: ASbGncu/CvjMv+8+pKl/J+8ByzoX42TJR91oB8eKD9mZ/FNSLL0GXqvjWY968Y9w0dB
 ix1XI70JgHMTszhPGyIS7bzpaXifaa3+wKW92qPAjYDFppO3CgfZmKHz6jXvJH7WnJuPmukNEoW
 wdhin1KkhmpLxuZBlwWOly+FoWpe7gc42AGndNZw/icHZi0SpcoKDFnhDN5YYZD1QOUfcixDdDH
 4ByWpIC8QLuSjIGRYX0WYef9ppij5Ia8ee9jOchkxQ4T8EiJkhp1owoxPEFcxXRqdcryMP0UXyd
 7HtEdqhewKSzk5McvgLEJb5xySV7t5wQqDmTgF1J9kx3kkAdB1UMFqsX0UW6BsnJ1wInDCY=
X-Google-Smtp-Source: AGHT+IGChs7eHa5zRInuSJK19SwStAtnpkYkKhpcmEqmNGCW83MiqEgl21ooIzHv9HbzfRFXz88PHA==
X-Received: by 2002:a2e:a58a:0:b0:308:fd11:7705 with SMTP id
 38308e7fff4ca-3090363079amr18485971fa.2.1739393970449; 
 Wed, 12 Feb 2025 12:59:30 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-308e5ece169sm13217001fa.32.2025.02.12.12.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 12:59:29 -0800 (PST)
Date: Wed, 12 Feb 2025 22:59:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm: writeback: Fix use after free in
 drm_writeback_connector_cleanup()
Message-ID: <bzcdg7wclj4moorz6f2hqkoycl6z7vqzsonok6h7s4wc3pfeo5@whduc52pided>
References: <78abd541-71e9-4b3b-a05d-2c7caf8d5b2f@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78abd541-71e9-4b3b-a05d-2c7caf8d5b2f@stanley.mountain>
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

On Wed, Feb 12, 2025 at 06:23:48PM +0300, Dan Carpenter wrote:
> The drm_writeback_cleanup_job() function frees "pos" so call
> list_del(&pos->list_entry) first to avoid a use after free.
> 
> Fixes: 1914ba2b91ea ("drm: writeback: Create drmm variants for drm_writeback_connector initialization")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/drm_writeback.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
