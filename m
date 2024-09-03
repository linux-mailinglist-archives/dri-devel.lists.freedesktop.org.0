Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4B296A732
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 21:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB2010E004;
	Tue,  3 Sep 2024 19:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="P7Opjt2/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F70710E004
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 19:17:18 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-374bd0da617so2283752f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 12:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725391036; x=1725995836; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R6T06AftA0wCiWbApedCP3Ro7VogxMzOphjJxhAWhZw=;
 b=P7Opjt2/7VJ+ObW5C0fQ7hBtSVhkYqu5OxUJUtnN4l9icE9Yp7ZPaOhhuihkIm5K+w
 +aHY77XMGhNxCk4rmA1tvx5ylu3hVW01wShTq5kiu/bk5LEim9to5Xl2cpCNItcaYQDG
 WxXdYURBi7ZoY2aM06DorcrHOnKnfdgIsRvDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725391036; x=1725995836;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R6T06AftA0wCiWbApedCP3Ro7VogxMzOphjJxhAWhZw=;
 b=ocTYFn7pb4VXpCpICpRXYjQf+C0wMDXHL3FLOo37bw+fngf8sXHHDEh6mNyUS7gORB
 nGgTA4IDOTIgGMZz5Y2Wpt1ulBRM48abpLjB0JcRdi+cAEZofMtxFy5vlcmZSpNAFojw
 IdTmWAwpaifNuD2rADYe1/8ip5sTTOPKK2W+dUhF1+TaFmSOodwmMhv4jg3HX2OdvK53
 09TxYdcOlmb4fdbtJwj5tWTANDomvsMMoO1gKB2Cy28yu9RlqPIEuvULMleBwxNGqIe5
 EfLNoA46532SvA1Op4wAtXBQfQKLKJvRiR3cap3EhezZA3/S8b9nTGoElK67IRrQ9eFB
 qIJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqlEBz7VMvs+ynA0x3bONJOy+2Vt50zGDLX+BhU27PYnIkPA4O9Ip0YegBELfomPa51VXdGKSEydQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnZsOpm1PX+6cOrRJYfzzm6Xk1SOFfJtWMYp+5nls6xlEOgF9G
 XQJ/x+GTXesOPjTpcQPQL7nVHXbFOwV5DKhjFiXzSelcLVIkHLcIQA0COpgOmO4=
X-Google-Smtp-Source: AGHT+IEPVItEQiRYwvZ1W4Ri9nvG8UkJy35F6F5lNQFlIfpgGofSxQlP2yheVMZ/924fh+cyMdLjWg==
X-Received: by 2002:a5d:55ca:0:b0:371:a60e:a821 with SMTP id
 ffacd0b85a97d-374bcfe5e16mr7048146f8f.38.1725391036300; 
 Tue, 03 Sep 2024 12:17:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df936dsm179511405e9.28.2024.09.03.12.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 12:17:15 -0700 (PDT)
Date: Tue, 3 Sep 2024 21:17:13 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Mihail Atanassov <mihail.atanassov@arm.com>
Cc: linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Steven Price <steven.price@arm.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Shashank Sharma <shashank.sharma@amd.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Akash Goel <akash.goel@arm.com>
Subject: Re: [PATCH 6/8] drm/panthor: Implement XGS queues
Message-ID: <ZtdguY2gELaMWuxk@phenom.ffwll.local>
Mail-Followup-To: Mihail Atanassov <mihail.atanassov@arm.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>,
 Akash Goel <akash.goel@arm.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
 <20240828172605.19176-7-mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828172605.19176-7-mihail.atanassov@arm.com>
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

On Wed, Aug 28, 2024 at 06:26:02PM +0100, Mihail Atanassov wrote:
> +int panthor_xgs_queue_create(struct panthor_file *pfile, u32 vm_id,
> +			     int eventfd_sync_update, u32 *handle)
> +{
> +	struct panthor_device *ptdev = pfile->ptdev;
> +	struct panthor_xgs_queue_pool *xgs_queue_pool = pfile->xgs_queues;
> +	struct panthor_xgs_queue *queue;
> +	struct drm_gpu_scheduler *drm_sched;
> +	int ret;
> +	int qid;
> +
> +	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
> +	if (!queue)
> +		return -ENOMEM;
> +
> +	kref_init(&queue->refcount);
> +	INIT_LIST_HEAD(&queue->fence_ctx.in_flight_jobs);
> +	INIT_WORK(&queue->release_work, xgs_queue_release_work);
> +	queue->ptdev = ptdev;
> +
> +	ret = drmm_mutex_init(&ptdev->base, &queue->lock);

This is guaranteed buggy, because you kzalloc queue, with it's own
refcount, but then tie the mutex cleanup to the entirely different
lifetime of the drm_device.

Just spotted this while reading around.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
