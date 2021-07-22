Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BF63D21B7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 12:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969BC6E988;
	Thu, 22 Jul 2021 10:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1606EA2A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 10:05:52 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 m38-20020a05600c3b26b02902161fccabf1so1210506wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 03:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=MKCrubzNw+m5XCWRbANx2rZlu56zV+LIDXTT++NESQM=;
 b=Wy6O1hjTe/a9cJyqEKl9vYGyg14s8SGUxKVW2IiKoYGRNRIzp+mD3aylaNv79++DQn
 f6buNUgUutHExPDHaf//TQ5+IJVRQ1lrtwoL2F+5tI6tiBbrQfUHKvI540GzeDDSpzh9
 R1ir5pbtMLz1mRaAqrNvZSmDg70xayNcoGcFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MKCrubzNw+m5XCWRbANx2rZlu56zV+LIDXTT++NESQM=;
 b=p/Lhx/ASmAPhtq6wEMwn0utAsJ1wBINVPwSj053/5AVxR0ww0LXcAxmC9YjicV4XQC
 NbYFj9nlV+6yAuLNTZUExdk4xvS0wJdJ5hokcKPUGrwThadgQADD4EEhvnGkoxIqRbeI
 fW2EgPH8w5x4g9hSEg0DyWFAixqBgeOsvvfVu4p6CsvvWqXz+V7VnuN8asUsHOrcHgWS
 HfCDc6torFIThbRQhX8Usk7hNVHgQt5YJM8Xa2MYWbfsVOuqz8HkZoQ++7kC1hGy35wy
 rR8k+Oqyk6XfbpJqb7Fgpd/RVZ576KMoKZH7lp5Mb7DwYDyC9bt3e5pdaouWnepaiqCT
 oJEw==
X-Gm-Message-State: AOAM5304Ef5jZYufSb2KD28J2NL7Uxp8/jjKcRl9E9uzOTeaPL/+v8Ox
 g4BYXalyvrwZLqU7Z82Du7/1nA==
X-Google-Smtp-Source: ABdhPJyMwmh9668k66jjJfeAQyN7Nl4NToUgchhmJQXgQZ4rw+D+Q/EaDWNCNuBl5b0Q0tb1Rke28w==
X-Received: by 2002:a7b:c111:: with SMTP id w17mr8353822wmi.163.1626948350810; 
 Thu, 22 Jul 2021 03:05:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i10sm16540576wml.31.2021.07.22.03.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 03:05:50 -0700 (PDT)
Date: Thu, 22 Jul 2021 12:05:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/ttm: Force re-init if
 ttm_global_init() fails
Message-ID: <YPlC/GGI1G9uTiEt@phenom.ffwll.local>
References: <20210721152358.2893314-1-jason@jlekstrand.net>
 <20210721152358.2893314-5-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210721152358.2893314-5-jason@jlekstrand.net>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: intel-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 10:23:56AM -0500, Jason Ekstrand wrote:
> If we have a failure, decrement the reference count so that the next
> call to ttm_global_init() will actually do something instead of assume
> everything is all set up.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Fixes: 62b53b37e4b1 ("drm/ttm: use a static ttm_bo_global instance")
> Reviewed-by: Christian König <christian.koenig@amd.com>

This one is already in drm-misc-fixes.
-Daniel

> ---
>  drivers/gpu/drm/ttm/ttm_device.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 5f31acec3ad76..519deea8e39b7 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -100,6 +100,8 @@ static int ttm_global_init(void)
>  	debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
>  				&glob->bo_count);
>  out:
> +	if (ret)
> +		--ttm_glob_use_count;
>  	mutex_unlock(&ttm_global_mutex);
>  	return ret;
>  }
> -- 
> 2.31.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
