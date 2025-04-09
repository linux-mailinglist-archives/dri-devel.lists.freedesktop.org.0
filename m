Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A608A82548
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 14:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667C910E88D;
	Wed,  9 Apr 2025 12:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="qoq0l8CR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BFC610E886;
 Wed,  9 Apr 2025 12:51:52 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZXjWR652Hz9sn9;
 Wed,  9 Apr 2025 14:51:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1744203109; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1KOsl3bM2Nc82jWkBpwB9pBWedP0INipQprBLc0j5o=;
 b=qoq0l8CRDL+UCLVS3PHrT3P1vR961xDbvNHjxml9bfKWX4A8AKek0gxWwmdmbupugwQeUa
 Or+iNbsFczg2uc1qjLHcrFuRpL+GzZagbMm58iileZJozNcIGY1Wxql/PZKK+5bG8ZsWq2
 2YoNz9CTr+r/TtXKi8y1ULJZxxI6uQrf97iP25KM8X3lfdIHeDBuYN1kXSv4fCXzbScnTT
 yLuadRHPxEojfM+iEAtJ0zGXkOO/SSAIQW6CFfEy729P3TxL/gTXnIHf4mkGow540KskXM
 nrcgR++I+jzbqfsLLSFAJ5yiAQoZy2b6Yx0KmrVsiTq4Af3cCbXv1hYpqyHV5w==
Message-ID: <73d41cd84c73b296789b654e45125bfce88e0dbf.camel@mailbox.org>
Subject: Re: [PATCH 1/2] dma-fence: Rename dma_fence_is_signaled()
From: Philipp Stanner <phasta@mailbox.org>
To: Boris Brezillon <boris.brezillon@collabora.com>, Philipp Stanner
 <phasta@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,  Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Frank Binns
 <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, Qiang Yu
 <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>,  Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>,  Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,  Steven Price
 <steven.price@arm.com>, Dave Airlie <airlied@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>,  Matthew Brost <matthew.brost@intel.com>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,  Melissa Wen
 <mwen@igalia.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Zack
 Rusin <zack.rusin@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Bas Nieuwenhuizen
 <bas@basnieuwenhuizen.nl>,  Yang Wang <kevinyang.wang@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Tim Huang <tim.huang@amd.com>,  Sathishkumar S
 <sathishkumar.sundararaju@amd.com>, Saleemkhan Jamadar
 <saleemkhan.jamadar@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Lijo
 Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, Ma Jun
 <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>, Eric Huang
 <jinhuieric.huang@amd.com>, Asad Kamal <asad.kamal@amd.com>, Srinivasan
 Shanmugam <srinivasan.shanmugam@amd.com>,  Jack Xiao <Jack.Xiao@amd.com>,
 Friedrich Vock <friedrich.vock@gmx.de>, Michel =?ISO-8859-1?Q?D=E4nzer?=
 <mdaenzer@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner
 <tglx@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, Dan
 Carpenter <dan.carpenter@linaro.org>,  linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org,  amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org,  intel-gfx@lists.freedesktop.org,
 lima@lists.freedesktop.org,  linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,  nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev,  spice-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Date: Wed, 09 Apr 2025 14:51:14 +0200
In-Reply-To: <20250409143917.31303d22@collabora.com>
References: <20250409120640.106408-2-phasta@kernel.org>
 <20250409120640.106408-3-phasta@kernel.org>
 <20250409143917.31303d22@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 7iy136p8m6py4oeaepzr7ogfmahipjtt
X-MBO-RS-ID: b1321202fe5ffc9b996
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

On Wed, 2025-04-09 at 14:39 +0200, Boris Brezillon wrote:
> Hi Philipp,
>=20
> On Wed,=C2=A0 9 Apr 2025 14:06:37 +0200
> Philipp Stanner <phasta@kernel.org> wrote:
>=20
> > dma_fence_is_signaled()'s name strongly reads as if this function
> > were
> > intended for checking whether a fence is already signaled. Also the
> > boolean it returns hints at that.
> >=20
> > The function's behavior, however, is more complex: it can check
> > with a
> > driver callback whether the hardware's sequence number indicates
> > that
> > the fence can already be treated as signaled, although the
> > hardware's /
> > driver's interrupt handler has not signaled it yet. If that's the
> > case,
> > the function also signals the fence.
> >=20
> > (Presumably) this has caused a bug in Nouveau (unknown commit),
> > where
> > nouveau_fence_done() uses the function to check a fence, which
> > causes a
> > race.
> >=20
> > Give the function a more obvious name.
>=20
> This is just my personal view on this, but I find the new name just
> as
> confusing as the old one. It sounds like something is checked, but
> it's
> clear what, and then the fence is forcibly signaled like it would be
> if
> you call drm_fence_signal(). Of course, this clarified by the doc,
> but
> given the goal was to make the function name clearly reflect what it
> does, I'm not convinced it's significantly better.
>=20
> Maybe dma_fence_check_hw_state_and_propagate(), though it might be
> too long of name. Oh well, feel free to ignore this comments if a
> majority is fine with the new name.

Yoa, the name isn't perfect (the perfect name describing the whole
behavior would be
dma_fence_check_if_already_signaled_then_check_hardware_state_and_propa
gate() ^^'

My intention here is to have the reader realize "watch out, the fence
might get signaled here!", which is probably the most important event
regarding fences, which can race, invoke the callbacks and so on.

For details readers will then check the documentation.

But I'm of course open to see if there's a majority for this or that
name.

P.


>=20
> Regards,
>=20
> Boris

