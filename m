Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5CD940BCD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 10:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E9310E26A;
	Tue, 30 Jul 2024 08:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="RyabuVsT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F4E10E26A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 08:38:41 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4281da2cdaeso1254455e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 01:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1722328720; x=1722933520; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rLSHeAzxwq9Akqi4K9srtQYuVjFjLR4YzmJwGGEqqlE=;
 b=RyabuVsT5r4D9AJvEZG2IURoo8mmgONxQJHwsi/n4+ZbggTZzMNSTgVQdqwVQHMyqI
 wf29M7YRF2I8kAFO2BwTsyRAmgydC+Ipn7G2WOmRmkjaM7oiTd1Eh8cpP4XDhS/bjub+
 mVr9DIJ/X+rJuOsn7F9kVMJKYh+eEjVn1tcWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722328720; x=1722933520;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rLSHeAzxwq9Akqi4K9srtQYuVjFjLR4YzmJwGGEqqlE=;
 b=d4Bl4hSkCXz+L7aeiOCOONlVcQpUfA6chockJ7hopnAj6hYRGODJAwVYFzRvDpExjd
 sl1Pvm/UIX+7v6CTZTrAz3gHRobhx1uMygOgO8zEBrZCaj30FBN45hw2oOHg2kbiW2hR
 jQLHjCxdCLh0zVUnQdeQGMeYk47yoSGxdllVO9dVoJymFwnH2e5D2gCm32Kj1zHo/Zl8
 Z5zsqqZbvf1S1Wo9bdkGEa3cWF//j+BCfKzIMn4zSvPYdrjSEwWWY7TXHFrHeriAFbdO
 XUp2mJQanQ+QEDy4kVy/le45/1TlsrI1MVJkiBS8Zg1Xu+qTA5fEg1Gjd0WJ04xL2HKB
 SWrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFFXWpOCpNHt50SY8BrZ6OB5EVabNSVsqQm8WPBoJU66I/FTGFKCJh3d9pHentFkSZb3QMOCRcAuE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz27mUjoQoLBhJQWQ7EQWgJof0ZtMm+I4EWtoAI7GK6uX4hVYLy
 8IKdsNupZu7JU/kuFYleThI16Qyro+d3xz3MhKifDy8XX3y4jSHIeolza4UzJd0=
X-Google-Smtp-Source: AGHT+IEHxwvRRVdvTsna5pPYQlLBDyGEKWP6n2hUjZSj5fgD4PVWENljhOK87uALcOP5pl95OHCF7Q==
X-Received: by 2002:a05:600c:1c99:b0:427:9f6c:e4bc with SMTP id
 5b1f17b1804b1-4280570b81emr71159635e9.5.1722328719721; 
 Tue, 30 Jul 2024 01:38:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4281c701619sm72813255e9.36.2024.07.30.01.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 01:38:39 -0700 (PDT)
Date: Tue, 30 Jul 2024 10:38:37 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: oushixiong1025@163.com
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: Re: [PATCH] drm: Add the missing symbol '.'
Message-ID: <ZqimjZT2KAClX7tx@phenom.ffwll.local>
Mail-Followup-To: oushixiong1025@163.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20240729065756.123788-1-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729065756.123788-1-oushixiong1025@163.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Mon, Jul 29, 2024 at 02:57:56PM +0800, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
> 
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>

Applied to drm-misc-next, thanks for your patch.
-Sima

> ---
>  drivers/gpu/drm/drm_probe_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index bb49d552e671..285290067056 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -888,7 +888,7 @@ EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
>   * disabled. Polling is re-enabled by calling drm_kms_helper_poll_enable().
>   *
>   * If however, the polling was never initialized, this call will trigger a
> - * warning and return
> + * warning and return.
>   *
>   * Note that calls to enable and disable polling must be strictly ordered, which
>   * is automatically the case when they're only call from suspend/resume
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
