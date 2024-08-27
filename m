Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF7696158E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 19:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6008989C;
	Tue, 27 Aug 2024 17:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="AjAg6dVs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398448989C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 17:35:25 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4280bca3960so49721265e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 10:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724780123; x=1725384923; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ZZ6Ajj14IHLte0g5ioHFoms2pJpNTRFXHc7NQuqRFQ=;
 b=AjAg6dVsoEUCqIUSbZGfG+zsKkxWtOe1q6xq8erT3pUGlRoa5VZu/4GTAi/GQTj6+C
 nhcu0k116mnYfp6srApwTq9EOKN+Gth8h8M7ucF3YzDcFQ56piAuerjm8TEk//UmQ1Fp
 RuTu4UuR0rXzfCYadSFw1gqhfjDfzh4iiXeUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724780123; x=1725384923;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6ZZ6Ajj14IHLte0g5ioHFoms2pJpNTRFXHc7NQuqRFQ=;
 b=abeNZDAAx30Ht25Y5gL4CoQR5Q2JdUCnYKasiNe7AW2DXOFydEztwXrn+YEsIh9lWd
 2nTFsKM6Z08BuZqQuB0gFGU0mFlO+Af4SCXUD0XoHJGU/LWDcGR2pGhb1cyUUn5UFeUv
 qfdjJpwhUk6+cRmX0q0WT4HOyko3sHNnqrPeWtic+iXI22Nnxyv+kifn8uzRr+LxlNfq
 WNIQtH3zqdxgDqfjpH+QPb2M3UVQMz+Ob5QtsXcy/hfWWgUxUCYO8NnNG3WLqAFw9CZn
 jTFyLKOQWme8CIMplhNGxLrsWzeYtKwtzXsVU7SNS4/YjD7IM3BvTpKkwoP5rjxOaeQD
 dEOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY2HZeNUZTKEM78SFRdEgjAD1JLOijs2x1cthY+ZHHc2tqERQWY22U8+wZXchMvMloetv0kKkuExM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXBo9wx8Ch22awZ9T2h2ePlFfg6mgNsxsgX3hgouDiWlU84zW7
 Nq2THbp67Rs7dmH85Ma4iWhPTtDGyOeJpTVv7z7cCR0VcUiGQJPKgaMdSPdWFVc=
X-Google-Smtp-Source: AGHT+IGi0Fo9OsBSJJC05p6AtEJSAshONRM7u4ZqsPBBDGXSPsJtXdpFBsXO0qz+YxybLrTH6d5U8Q==
X-Received: by 2002:a05:600c:691a:b0:429:a0d:b710 with SMTP id
 5b1f17b1804b1-42b8926b105mr87354665e9.12.1724780123242; 
 Tue, 27 Aug 2024 10:35:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730813c0dcsm13655429f8f.37.2024.08.27.10.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 10:35:22 -0700 (PDT)
Date: Tue, 27 Aug 2024 19:35:20 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sched: Document drm_sched_job_arm()'s effect on fences
Message-ID: <Zs4OWLkl1ZgBL1HU@phenom.ffwll.local>
Mail-Followup-To: Philipp Stanner <pstanner@redhat.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240826093916.29065-2-pstanner@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826093916.29065-2-pstanner@redhat.com>
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

On Mon, Aug 26, 2024 at 11:39:17AM +0200, Philipp Stanner wrote:
> The GPU Scheduler's job initialization is split into two steps,
> drm_sched_job_init() and drm_sched_job_arm(). One reason for this is
> that actually arming a job results in the job's fences getting
> initialized (armed).
> 
> Currently, the documentation does not explicitly state what
> drm_sched_job_arm() does in this regard and which rules the API-User has
> to follow once the function has been called.
> 
> Add a section to drm_sched_job_arm()'s docstring which details the
> function's consequences regarding the job's fences.
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 7e90c9f95611..e563eff4887c 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -831,6 +831,12 @@ EXPORT_SYMBOL(drm_sched_job_init);
>   * Refer to drm_sched_entity_push_job() documentation for locking
>   * considerations.
>   *
> + * drm_sched_job_cleanup() can be used to disarm the job again - but only
> + * _before_ the job's fences have been published. Once a drm_sched_fence was
> + * published, the associated job needs to be submitted to and processed by the
> + * scheduler to avoid potential deadlocks on the DMA fences encapsulated by
> + * drm_sched_fence.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> + *
>   * This can only be called if drm_sched_job_init() succeeded.
>   */
>  void drm_sched_job_arm(struct drm_sched_job *job)
> -- 
> 2.46.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
