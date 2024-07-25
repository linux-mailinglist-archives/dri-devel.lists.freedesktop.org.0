Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D2B93C166
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 14:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A39110E782;
	Thu, 25 Jul 2024 12:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="JYutPA46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BA810E782
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 12:03:40 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ef20c3821cso117341fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 05:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721909019; x=1722513819; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DsTtMvPx9ke4/AYf3jkAlNvsesFBPGLQQ11dZfaC+eA=;
 b=JYutPA46Kh4/oRDr1EO87bGv2MlxUXNyUssCwztu8HphgTONhQ7KSMS7HU5ctymMRk
 D+9j5G4maeJ3JocJbpUmn6UXX45Zt0w50ZubIZWp6cwd+IIuSKfh/syfNQUHgtju8YDo
 xUlxM2X7cA8oMcFezZEEKyVlD3FXwi7PTl7lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721909019; x=1722513819;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DsTtMvPx9ke4/AYf3jkAlNvsesFBPGLQQ11dZfaC+eA=;
 b=T9wrWiNHcCb6Snno1kRkCbmuw4sBPXqjXe4zF6aVmRUzlVU8pNGzE9tE//W4mJRRtM
 fS2Iz/f0HjkUGapRMvfsYa+vjURV2rKRO0gaouUROGRp2zogZgXFNEr4HwibANapjFPq
 UZHXgkeAv0oG5ED2h77VO8yCu1HKaPj8pF+DNW6xQBv/SZkQ3AnL8OFhqzjMDQbSOuuO
 GmA8o+0zJgYKoJf2hEscyZuWTsgLal7TiNOe8jLVdm5o23d5nhpgo0gffdeC8jyqqoW2
 Dydk4cqRpAfd+Ux7WjlchZOKmyQdHrVxyv9Lu3T3o1d1unup5IVnxVhtjvYhEFv4uVrT
 6j0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCfAOPpNVe4z5/tt2V6F9h0P9/DPgHxRMfzuR4pLNui7h7Vfe5AfGQPD30WjfHsc3djOcyliETKdkwKcA7OcTErpqjJzqaArmZXNgHeG7g
X-Gm-Message-State: AOJu0YwRz8a2MeaaXCrKB5zfvtbVkx3/uydUYlBT7LkbKZtx8UJA/WtP
 FJJgJLf1UjrsM7gjL/dHfY8oKaO1F73weVjR+hgr6zFCQ5UvBstGNsdcO4zxdvpXpfP1ngVw2k6
 c
X-Google-Smtp-Source: AGHT+IEgJIt3CFKK9VdYaVokSzTg4NP8A6U0R+JqkK+B6CCwPOll7qsM+G826oSdcQ0/p2Xhfm+czg==
X-Received: by 2002:a2e:1f0a:0:b0:2ef:2b1f:180b with SMTP id
 38308e7fff4ca-2f03c7e36efmr8850691fa.8.1721909018505; 
 Thu, 25 Jul 2024 05:03:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac6358fa5esm747202a12.32.2024.07.25.05.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 05:03:38 -0700 (PDT)
Date: Thu, 25 Jul 2024 14:03:36 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/8] drm/loongson: use GEM references instead of TTMs
Message-ID: <ZqI_GHueFiZDAQ4v@phenom.ffwll.local>
References: <20240723121750.2086-1-christian.koenig@amd.com>
 <20240723121750.2086-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240723121750.2086-3-christian.koenig@amd.com>
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

On Tue, Jul 23, 2024 at 02:17:45PM +0200, Christian König wrote:
> Instead of a TTM reference grab a GEM reference whenever necessary.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Cc: Sui Jingfeng <suijingfeng@loongson.cn>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/loongson/lsdc_ttm.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
> index 465f622ac05d..2e42c6970c9f 100644
> --- a/drivers/gpu/drm/loongson/lsdc_ttm.c
> +++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
> @@ -341,16 +341,12 @@ void lsdc_bo_unpin(struct lsdc_bo *lbo)
>  
>  void lsdc_bo_ref(struct lsdc_bo *lbo)
>  {
> -	struct ttm_buffer_object *tbo = &lbo->tbo;
> -
> -	ttm_bo_get(tbo);
> +	drm_gem_object_get(&lbo->tbo.base);
>  }
>  
>  void lsdc_bo_unref(struct lsdc_bo *lbo)
>  {
> -	struct ttm_buffer_object *tbo = &lbo->tbo;
> -
> -	ttm_bo_put(tbo);
> +	drm_gem_object_put(&lbo->tbo.base);
>  }
>  
>  int lsdc_bo_kmap(struct lsdc_bo *lbo)
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
