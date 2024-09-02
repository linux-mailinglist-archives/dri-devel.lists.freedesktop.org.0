Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEB096875A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 14:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484F310E2D2;
	Mon,  2 Sep 2024 12:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Nn3SE+ri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A37110E2CE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 12:16:30 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42bbc70caa4so25008695e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 05:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725279389; x=1725884189; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iW5O5C0awdIBKb5cbn/kzMv+6c/M8FaosrKU7cFNrF0=;
 b=Nn3SE+ri5h8l0XihaBQY1QAMhkn2tpjOdwB+aogR2WXkoWPMGKJrFh8UugPT6mLqvT
 oPwdSouvhFR+jpFqZQbwvBxM+gGKhAStaDTNOwSVZVDNnmvdhsm8n7ebWKQKPkmQdK+e
 stufDBwFHbHWhYL9jMpm9vpC8FSPSeLXDCTHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725279389; x=1725884189;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iW5O5C0awdIBKb5cbn/kzMv+6c/M8FaosrKU7cFNrF0=;
 b=rFVy2xT8OATKI6YSLpe3t0Chqh1k9TCHT8MW+N73PNwnPHQOkFlxHswMfSENdXtxqi
 O7aIDkdFSTXyPADcBGgT9oRMc4onEklZXm1y1+OVOzl+LIgPc050MPbqLvnWksAL8xv7
 qJByHoauWbc+e1sax2JsB33waQXbBWgOl/lT25grgmRGpDTzb0eHzbi+kbUVgRr4fhAu
 jlYJJQ4Hd5ap4wwLj9XYYrxBZfZdzB48YKSJgs9wX35k+Uij3ZbyzmfBSL3cr4J1rhpv
 5w7kBb7GIhX21Q5TqrjDjwyFmcEW780NIyvFiqR80cMV7Ynb3LHpTyppN//XFTrOZPl+
 tAJw==
X-Gm-Message-State: AOJu0YzrASPSvfc1HAhEqP41Xk7XCMRHtEH+vPfvT4AMQXOJHp+1boH0
 e8kn1Jm9ZqqNskWlmu+zSX7qBCZsXWx7BWhp9GN3aO8VI44/9jqtkvWAJwk3bg8=
X-Google-Smtp-Source: AGHT+IHjcmTNQrAoUOABHQIWx8e27SyccH5A+A1gF9wZjoikbwQIsfi/J1cVd5lEv7W15ot7GwJ0Vw==
X-Received: by 2002:a05:600c:4fd3:b0:426:5416:67de with SMTP id
 5b1f17b1804b1-42bb01e57d2mr84257905e9.30.1725279388659; 
 Mon, 02 Sep 2024 05:16:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c71140bbsm4045487f8f.110.2024.09.02.05.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 05:16:28 -0700 (PDT)
Date: Mon, 2 Sep 2024 14:16:26 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Fix merge fails related to display runtime PM
Message-ID: <ZtWsmvIIus-Cl3lT@phenom.ffwll.local>
References: <20240902112002.489225-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902112002.489225-1-maarten.lankhorst@linux.intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Mon, Sep 02, 2024 at 01:20:02PM +0200, Maarten Lankhorst wrote:
> The most recent merge commits introduced some fails to drm/drm-next,
> I've noticed these when looking at the xe patches.
> 
> Solve it!
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

I dropped the first hunk, since that was broken in drm-tip too. So
separate bugfix that should go in with proper review and Fixes: tag and
all that imo.

Otherwise with this drm-next now matches what was in drm-tip.

Thanks for the quick fix!

Cheers, Sima
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 2 --
>  drivers/gpu/drm/xe/xe_pm.c              | 4 +---
>  2 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 78a884ddd499a..710b1e2170c13 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -341,8 +341,6 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>  
>  	xe_display_flush_cleanup_work(xe);
>  
> -	xe_display_flush_cleanup_work(xe);
> -
>  	intel_dp_mst_suspend(xe);
>  
>  	intel_hpd_cancel_work(xe);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 2e2accd76fb2b..39e0a8774a104 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -392,8 +392,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	xe_display_pm_runtime_suspend(xe);
>  
>  	if (xe->d3cold.allowed) {
> -		xe_display_pm_suspend(xe, true);
> -
>  		err = xe_bo_evict_all(xe);
>  		if (err)
>  			goto out;
> @@ -411,7 +409,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  		xe_display_pm_suspend_late(xe);
>  out:
>  	if (err)
> -		xe_display_pm_resume(xe, true);
> +		xe_display_pm_runtime_resume(xe);
>  	xe_rpm_lockmap_release(xe);
>  	xe_pm_write_callback_task(xe, NULL);
>  	return err;
> -- 
> 2.45.2
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
