Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7210EA19F01
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 08:33:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020E410E777;
	Thu, 23 Jan 2025 07:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="lyW10yfs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF0F10E777
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 07:33:16 +0000 (UTC)
Received: from smtp1.mailbox.org (unknown [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Ydt2x1QV9z9sWp;
 Thu, 23 Jan 2025 08:33:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1737617593; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pafGZP171TKVXmmTNtfdIkH/JLfRofR6L9YfhmD45jE=;
 b=lyW10yfsdoKC9khVw9jNmQQjpXd/IpvM0GENMUQG4ShV8XOOqjm/LPE0R7H2th4muEIaww
 WjWGoh0BAWCFJX9B1qk8du3Kt58QKRUC0Ge1iJGXX7tDbaRkH3zzd1MyOqNFUNE4LWtTnA
 ZHxS83eGnU7TcUn45ektfe2nG2rLtuoSRq3Z3UwhPFP4g9edzj2p7EtYo96EGGNiALZVWP
 c9S2JgPiw/mfMODTFYK5JEz9pj8xFBlTNA+rQvHuuNZjMKghxgF7TAx8WQAiasC8dCWHJE
 a5A29twSa5ZfOqnphJ+ERRMcVAtkimJEY1P1GJC5V+sjGzEqGq0UxhYyBuaG5Q==
Message-ID: <af5aac800f7d2153aa3c315584f70c55378c1b2b.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
From: Philipp Stanner <phasta@mailbox.org>
To: Boris Brezillon <boris.brezillon@collabora.com>, Philipp Stanner
 <phasta@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>,  Christian Gmeiner
 <christian.gmeiner@gmail.com>, Frank Binns <frank.binns@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>,  Rob
 Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>,  Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>, 
 =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>,  Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>, 
 Yunxiang Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org,  lima@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,  freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org,  intel-xe@lists.freedesktop.org
Date: Thu, 23 Jan 2025 08:33:01 +0100
In-Reply-To: <20250122181227.491b7881@collabora.com>
References: <20250122140818.45172-3-phasta@kernel.org>
 <20250122181227.491b7881@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 8a70febfe27100aa303
X-MBO-RS-META: sw7fmubqh1x18f97mnek9yippijrrm9p
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2025-01-22 at 18:16 +0100, Boris Brezillon wrote:
> On Wed, 22 Jan 2025 15:08:20 +0100
> Philipp Stanner <phasta@kernel.org> wrote:
>=20
> > =C2=A0int drm_sched_init(struct drm_gpu_scheduler *sched,
> > - =C2=A0=C2=A0 const struct drm_sched_backend_ops *ops,
> > - =C2=A0=C2=A0 struct workqueue_struct *submit_wq,
> > - =C2=A0=C2=A0 u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
> > - =C2=A0=C2=A0 long timeout, struct workqueue_struct *timeout_wq,
> > - =C2=A0=C2=A0 atomic_t *score, const char *name, struct device *dev);
> > + const struct drm_sched_init_params *params);
>=20
>=20
> Another nit: indenting is messed up here.

That was done on purpose.

I never got why so many like to intend to the opening brackets,
because:
   1. The kernel coding guide line does not demand it
   2. It mixes tabs with spaces
   3. It doesn't create an identical level of intendation
   4. It wastes huge amount of space and does not solve the problem of
      long names, but might even make it worse:
      https://elixir.bootlin.com/linux/v6.13-
      rc3/source/drivers/gpu/drm/scheduler/sched_main.c#L1296
