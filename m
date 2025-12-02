Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF24C9AD2D
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 10:19:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89DBB10E5A6;
	Tue,  2 Dec 2025 09:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="il/eUsMM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B73710E59E;
 Tue,  2 Dec 2025 09:19:32 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dLFb41cf3z9spF;
 Tue,  2 Dec 2025 10:19:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764667168; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q8Y1OU0Q+Bol5U/MPFfzGP28CcuUiYKdthv47THRxek=;
 b=il/eUsMMmTGh9GD/DnjHcdipYrZx4Bnp/W8SmT4Rhvtieu4WLMXE1QfRoapTjZMjPj7LRI
 o//dVBIiqL677W9dpkG9++H2ZzgSgq2h2nzdvIVmUoQFBcImTdC/IdaqyXM8Y3cdFeU3kN
 4Syh4pa0m6+RY5Imt5wIsyTRyZLDWvTyVS3qgj2Mf0D8EaL2/oFyDiamW9Iqx4LLl7FWf9
 AyGH79vdedTAdp35ypPh/hoj03z/jMSl7PQ4unIaR8UDe18AdJk+ctcnCLzxTRpHe4FIaa
 BorrZ0RWQlO3JziTfJ7cbwRDMw4Ku8uCWL/+APW5Ut2KoA8e93mAwYi3N0KX/A==
Message-ID: <d7956d8e8401f7dd9951d93752a74d2f8f660830.camel@mailbox.org>
Subject: Re: [PATCH v2 2/8] dma-buf/dma-fence: Add dma_fence_check_and_signal()
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Felix Kuehling <Felix.Kuehling@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,  Matthew Brost
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Tue, 02 Dec 2025 10:19:09 +0100
In-Reply-To: <07cd6a0c-9975-48ef-bb2e-5e53a042888e@amd.com>
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-4-phasta@kernel.org>
 <80554ed2-4454-489b-873f-533d68c8d2ae@amd.com>
 <2a9c83b4a428bb3cc993499c39d0da01f9563278.camel@mailbox.org>
 <93a4f4e4-af7a-4c84-a7a2-5db785f2a5a8@amd.com>
 <247185f833edd075cd4aac8c39ac8ae5b5aabe07.camel@mailbox.org>
 <07cd6a0c-9975-48ef-bb2e-5e53a042888e@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 27d8c8638880777556e
X-MBO-RS-META: 33hpokdgbkw758zqyymwdksfr37hc4fg
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

On Mon, 2025-12-01 at 17:08 +0100, Christian K=C3=B6nig wrote:
> On 12/1/25 16:53, Philipp Stanner wrote:
> > On Mon, 2025-12-01 at 16:20 +0100, Christian K=C3=B6nig wrote:
> > > On 12/1/25 14:55, Philipp Stanner wrote:
> > > > On Mon, 2025-12-01 at 14:23 +0100, Christian K=C3=B6nig wrote:
> > > > > On 12/1/25 11:50, Philipp Stanner wrote:
> > > > > > The overwhelming majority of users of dma_fence signaling funct=
ions
> > > > > > don't care about whether the fence had already been signaled by=
 someone
> > > > > >=20
> > > >=20
> >=20
> > [=E2=80=A6]
> >=20
> > > > >=20
> > > > > > +{
> > > > > > +	unsigned long flags;
> > > > > > +	bool ret;
> > > > > > +
> > > > > > +	spin_lock_irqsave(fence->lock, flags);
> > > > > > +	ret =3D dma_fence_check_and_signal_locked(fence);
> > > > > > +	spin_unlock_irqrestore(fence->lock, flags);
> > > > >=20
> > > > > Could this use guard(fence->lock, flags) ?
> > > >=20
> > > > guard? You mean a lockdep guard? Do you have a pointer to someplace=
 in
> > > > dma_fence who does what you mean / want?
> > >=20
> > > E.g. like guard(spinlock_irqsave)(&fence->lock);
> >=20
> >=20
> > Hmm, but why?
> > It's obvious to all readers that I do spin_unlock_irqrestore() here.
> > It's very simple code, lock, 1 line, unlock. What would the guard
> > improve?
>=20
> Well you can save using the local variables.
>=20
> So this:
>=20
> 	unsigned long flags;
> 	bool ret;
>=20
> 	spin_lock_irqsave(fence->lock, flags);
> 	ret =3D dma_fence_check_and_signal_locked(fence);
> 	spin_unlock_irqrestore(fence->lock, flags);
>=20
> 	return ret;
>=20
> Becomes just:
>=20
> 	guard(spinlock_irqsave)(&fence->lock);
> 	return dma_fence_check_and_signal_locked(fence);

Mhm, I guess I agree that __cleanup is a cool new feature that can be
useful at many places. But in this case I think it's actually less
readable and doesn't really give lots of advantages. And don't I have
to use a DEFINE_GUARD or DEFINE_FREE in the first place?

If it's your maintainer preference, I can look into that though..

P.



