Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0851BA2221C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 17:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3DC10E83F;
	Wed, 29 Jan 2025 16:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NTCbbMp3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF6310E83F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 16:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738169408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kIR36ENGU60LuFgFJsbN3iw30GtNfjYTyr8Iv66sXWE=;
 b=NTCbbMp3oOepJBa/PmEZMoNicv1mllJnD4mIwjTOPMNLpaLgupuWIAOJqVF4Tvxiw6tSqA
 vIYh0CQoIppCvGHupACiSbROL+YVd9D2slMRGaogn5SWoFkp2orlueuLOD4RAXaEhaCBZq
 6TKABdbZpBH67wqzi5RIQz67ukoaESg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-A4dwAR1BOqGy92WL7fInHQ-1; Wed, 29 Jan 2025 11:50:07 -0500
X-MC-Unique: A4dwAR1BOqGy92WL7fInHQ-1
X-Mimecast-MFC-AGG-ID: A4dwAR1BOqGy92WL7fInHQ
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4361fc2b2d6so40304795e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 08:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738169406; x=1738774206;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kIR36ENGU60LuFgFJsbN3iw30GtNfjYTyr8Iv66sXWE=;
 b=c04gsORSVaqv7Fho0W6VxDphn5zXNl7mD9Bip9CFzppbZAPTKBC+IWG41C97QWMK2v
 0Zv8esXCSsYyb/FVrwjGsOlZspnROCJZEqqUIjSlaT/xfFofWO3fgtftDUkpkGKbtUxN
 HwSJ0SUDeij1C8mzn1iSzChf4thzwrOsaG8U+biVqz3yUy4z6Cf+aANumLBO3RYVv/dR
 zB409UxXTB7jWPoyAxhEssdpidXH6Jm3eYejX2M99VDtINn3tY9VEI4Bt35x08V8kUTF
 Hv9EdyHgl7itHbm4Y/utJXnA/rvvnJnYCMxjk+wP9xFoSrvTtPPZYAKFd8/CC91uiBih
 7GmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlw2gfHoxsXZLXyUflJto9GvP99GWI4ualJdNrUjTTUA4SMdGmjxc59/iwDR/vFtJjMkRUrwTc+r4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDMC7cE95QO0yz+1mrPhLWhbJfRoPYNf0vL7/Urfj3rtUt0VXz
 wTC6/ziRYrgVnpiXDYJglv5xqpkX2geSz7EhafLt31r6UktgMY5IUI6YVjXphDi5ctN5ttjtH+t
 xK9bzDGTGjxAOtD9LgRY8MGR3XjqAhZ6bMeYqUPs2G58tja/AXxG8QSycTpN/Ja4VPQ==
X-Gm-Gg: ASbGncuWHvetuZpAn2xODWhclyh75G/NRZJaorCC4EQGaghItmH47WPRRYOKh8FS2Aj
 5V6z4IkLYxlbVcr5+dLYyd/ypif1N43lfOCC8fbOFCKKDJmno6YpheEvjRTQdykRmeEI0pOayHG
 oNjR8t1mIwGivvTG+mh1dzhQHwWAE8MHVk94MI9TMsgE1xFwp971SK1XzlzFBdrcIMDdP3TY6gs
 nEj6xShN71XPCL7fcX2ywH3Ul52i2jC6IOuoX2Z8ZvbppBaWgmrKtctZxKeiabPiPyiWA==
X-Received: by 2002:a5d:4385:0:b0:38a:888c:6786 with SMTP id
 ffacd0b85a97d-38c520babf7mr2389785f8f.52.1738169406341; 
 Wed, 29 Jan 2025 08:50:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzyZbfNeHEEqdBP/FPbqU2nUqTbUVUE0bCsa9+XfxoWf8z7EMd5vNIfqC9EBVK6faAB4GzCg==
X-Received: by 2002:a5d:4385:0:b0:38a:888c:6786 with SMTP id
 ffacd0b85a97d-38c520babf7mr2389769f8f.52.1738169405919; 
 Wed, 29 Jan 2025 08:50:05 -0800 (PST)
Received: from pollux ([2a00:79c0:60c:5a00:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a188673sm17194930f8f.46.2025.01.29.08.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 08:50:05 -0800 (PST)
Date: Wed, 29 Jan 2025 17:50:02 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: phasta@kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Melissa Wen <mwen@igalia.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/sched: Use struct for drm_sched_init() params
Message-ID: <Z5pcOt3oiwnp4lbJ@pollux>
References: <20250128142927.103290-2-phasta@kernel.org>
 <Z5jwD0DxNrMdo-q8@pollux>
 <1a22f1bb0145996cb1159cf3cb8156aec3d5c640.camel@mailbox.org>
MIME-Version: 1.0
In-Reply-To: <1a22f1bb0145996cb1159cf3cb8156aec3d5c640.camel@mailbox.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QHpByPAfsVbbjypljoU0I6FG9n6Ax7oLl4tXC879snI_1738169406
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Wed, Jan 29, 2025 at 04:18:30PM +0100, Philipp Stanner wrote:
> On Tue, 2025-01-28 at 15:56 +0100, Danilo Krummrich wrote:
> > On Tue, Jan 28, 2025 at 03:29:27PM +0100, Philipp Stanner wrote:
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > index 4412f2711fb5..b5aac8eebfdd 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > @@ -404,7 +404,15 @@ nouveau_sched_init(struct nouveau_sched
> > > *sched, struct nouveau_drm *drm,
> > >  {
> > >  	struct drm_gpu_scheduler *drm_sched = &sched->base;
> > >  	struct drm_sched_entity *entity = &sched->entity;
> > > -	const long timeout =
> > > msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
> > > +	const struct drm_sched_init_args args = {
> > > +		.ops = &nouveau_sched_ops,
> > > +		.submit_wq = wq,
> > > +		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
> > > +		.credit_limit = credit_limit,
> > > +		.timeout =
> > > msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS),
> > > +		.name = "nouveau_sched",
> > > +		.dev = drm->dev->dev
> > > +	};
> > >  	int ret;
> > >  
> > >  	if (!wq) {
> > > @@ -416,10 +424,7 @@ nouveau_sched_init(struct nouveau_sched
> > > *sched, struct nouveau_drm *drm,
> > >  		sched->wq = wq;
> 
> Do you want it set here 
> 
> args.submit_wq = wq;
> 
> or below, outside the if-block? Should be the same AFAICS

Yeah, shouldn't make a difference. Personally, I'd prefer to set it once after
the if-block.

> 
> 
> > 
> > This change breaks Nouveau, you need to set args.submit_wq here as
> > well.
> 
> I overlooked the allocation below.
> 
> 
> P.
> 
> > 
> > >  	}
> > >  
> > > -	ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
> > > -			     NOUVEAU_SCHED_PRIORITY_COUNT,
> > > -			     credit_limit, 0, timeout,
> > > -			     NULL, NULL, "nouveau_sched", drm-
> > > >dev->dev);
> > > +	ret = drm_sched_init(drm_sched, &args);
> > >  	if (ret)
> > >  		goto fail_wq;
> > >  

