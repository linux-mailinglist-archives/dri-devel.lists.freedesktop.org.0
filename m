Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5E0A21861
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 08:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8D610E752;
	Wed, 29 Jan 2025 07:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cHFMtaPw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469D010E093;
 Wed, 29 Jan 2025 07:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738137395;
 bh=19sEJS+53AlbqeBhPbuS7SYhGlp/8T6jB4GpD7XiRY8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cHFMtaPwEtJJohVUPCH6Et+AIUsnVFlO6ztoiormkpgexr6boLAcTU1pvnfAUwksC
 YJNapUOtdv/TN0Pmsfw1w37033fOk93jrclbjHUibfryhHaypdKHisEwsXlZo3vjV9
 96tuBqGkeBnhZ6JVqSRYOJqQeWowDfpPqLvpcyHKFwuhFGCgO6pSHTi0Al1yDmWrD1
 CD55jozrm4o+D54LPa/j9JC63LKGtSxhEFzZh4YeNpu3usGnEfAC5S2N3p2GuGtkGT
 tYGRVinZcMFrGtxM0vcsozFAwmtA1IfRtZk0w1MAyUNi5n8X67s+oFh5+sWT4VQ/Gw
 N9Dfq08lCF3OQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3433F17E0848;
 Wed, 29 Jan 2025 08:56:34 +0100 (CET)
Date: Wed, 29 Jan 2025 08:56:25 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Philipp Stanner <phasta@kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu
 <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>, Melissa Wen
 <mwen@igalia.com>, =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li
 <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/sched: Use struct for drm_sched_init() params
Message-ID: <20250129085625.502ab114@collabora.com>
In-Reply-To: <CAH9NwWeTVv3kABmADJD8mNcE1Psq2ToLfzjO4HzbSfJ4+gkxDw@mail.gmail.com>
References: <20250128142927.103290-2-phasta@kernel.org>
 <CAH9NwWeTVv3kABmADJD8mNcE1Psq2ToLfzjO4HzbSfJ4+gkxDw@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 28 Jan 2025 22:49:47 +0100
Christian Gmeiner <christian.gmeiner@gmail.com> wrote:

> >  int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> >  {
> > -       int ret;
> > +       const struct drm_sched_init_args args = {  
> 
> Why not declare it as static const struct drm_sched_init_args args = { ?

Because some bits in there are not static, in this particular case,
gpu->dev is not static for instance.

> This question applies to all similar occurrences in the patch.
> 
> > +               .ops = &etnaviv_sched_ops,
> > +               .num_rqs = DRM_SCHED_PRIORITY_COUNT,
> > +               .credit_limit = etnaviv_hw_jobs_limit,
> > +               .hang_limit = etnaviv_job_hang_limit,
> > +               .timeout = msecs_to_jiffies(500),
> > +               .name = dev_name(gpu->dev),
> > +               .dev = gpu->dev
> > +       };
> >
> > -       ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
> > -                            DRM_SCHED_PRIORITY_COUNT,
> > -                            etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
> > -                            msecs_to_jiffies(500), NULL, NULL,
> > -                            dev_name(gpu->dev), gpu->dev);
> > -       if (ret)
> > -               return ret;
> > -
> > -       return 0;
> > +       return drm_sched_init(&gpu->sched, &args);
> >  }
