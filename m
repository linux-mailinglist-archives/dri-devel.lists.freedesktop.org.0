Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC19A1A0D1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 10:29:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438B510E7A4;
	Thu, 23 Jan 2025 09:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TV0ErsCe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152FF10E164;
 Thu, 23 Jan 2025 09:29:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 32B27A4059A;
 Thu, 23 Jan 2025 09:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281D1C4CED3;
 Thu, 23 Jan 2025 09:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737624576;
 bh=VFSaTc+ZUJdJo937pvPau4ssAcTSLVldlFqrOW1y0T8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TV0ErsCeNxHQ1jafiFOkR7xb4mc2zUxns6zh8w0owyFmIxKNf9maliyX7ku/7vtCi
 7IAUMWG3trF31MQNbqRQmSlLgZPLuVROUricCwuknuB4uomj+9ItCWoPasd1KuU9tl
 mpdPNqzTyr1OVwk2jLEa8ilt8zEIzjt6DufTknWCVz1p7IM+GCcVt1eWcaa8o99Nue
 oMdeQ2uu8LRYTgdQIHwJhkfC64rNfiCAkhNSG9WjDxU01JCFL5jaLrNQfQf30L6QeD
 8eVtgTp8wEWa+PI1QN6UQfQQbAhYVcrBIGuhU1tx0AtlHTpBiAGfeg2Hq32EEPYzUx
 q0mVTarZCdhwQ==
Date: Thu, 23 Jan 2025 10:29:24 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: phasta@kernel.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
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
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
Message-ID: <Z5IL9Ok7f16S9ZoD@pollux.localdomain>
References: <20250122140818.45172-3-phasta@kernel.org>
 <20250122181227.491b7881@collabora.com>
 <af5aac800f7d2153aa3c315584f70c55378c1b2b.camel@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af5aac800f7d2153aa3c315584f70c55378c1b2b.camel@mailbox.org>
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

On Thu, Jan 23, 2025 at 08:33:01AM +0100, Philipp Stanner wrote:
> On Wed, 2025-01-22 at 18:16 +0100, Boris Brezillon wrote:
> > On Wed, 22 Jan 2025 15:08:20 +0100
> > Philipp Stanner <phasta@kernel.org> wrote:
> > 
> > >  int drm_sched_init(struct drm_gpu_scheduler *sched,
> > > -    const struct drm_sched_backend_ops *ops,
> > > -    struct workqueue_struct *submit_wq,
> > > -    u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
> > > -    long timeout, struct workqueue_struct *timeout_wq,
> > > -    atomic_t *score, const char *name, struct device *dev);
> > > + const struct drm_sched_init_params *params);
> > 
> > 
> > Another nit: indenting is messed up here.
> 
> That was done on purpose.

Let's not change this convention, it's used all over the kernel tree, including
the GPU scheduler. People are used to read code that is formatted this way, plus
the attempt of changing it will make code formatting inconsistent.
