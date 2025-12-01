Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1023FC981FD
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 16:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5594610E424;
	Mon,  1 Dec 2025 15:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="sBbSHmzs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B13510E412;
 Mon,  1 Dec 2025 15:53:35 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dKpND1qYnz9sSq;
 Mon,  1 Dec 2025 16:53:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764604412; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eGqYb67ev6KtdX+YTXDxiPnVVJgPnz1zCF5EHXt4hqo=;
 b=sBbSHmzsi3wPuWYFAAsh7dTsB5/2BthPcSteomaBpjOOXqjRl4JVBPb/opZ+0TvekWfWh6
 kkrhVaI5rHlsptkCOOV1cEZ+1Vk+ont6Rbwmv+8a8aCIMhACUF9VPbT2CaCITeqRij/2/r
 oH2zKPUBjgeXVl0q3fmw/SMlM1xCI1nLQuAbHnv2USqCf+waiCIjoR+lAAn7YbTh6E0CON
 /sEKdCwDOW3RiLQr5wGRrqkI2ZosLT1xcI3/LP/R7DrfLIjoeJQ1PveMpvTCwtzC6ZEWew
 MSsck3FBtmzJ65blZyfmgt2caSH/5QIFj8wSQdMiEOTCnuVWVIHlwC/zRTJiWQ==
Message-ID: <247185f833edd075cd4aac8c39ac8ae5b5aabe07.camel@mailbox.org>
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
Date: Mon, 01 Dec 2025 16:53:25 +0100
In-Reply-To: <93a4f4e4-af7a-4c84-a7a2-5db785f2a5a8@amd.com>
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-4-phasta@kernel.org>
 <80554ed2-4454-489b-873f-533d68c8d2ae@amd.com>
 <2a9c83b4a428bb3cc993499c39d0da01f9563278.camel@mailbox.org>
 <93a4f4e4-af7a-4c84-a7a2-5db785f2a5a8@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 1308e1c837b3c1f5430
X-MBO-RS-META: ijujsb3wwab53aghs3jk89kkrxiqj4um
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

On Mon, 2025-12-01 at 16:20 +0100, Christian K=C3=B6nig wrote:
> On 12/1/25 14:55, Philipp Stanner wrote:
> > On Mon, 2025-12-01 at 14:23 +0100, Christian K=C3=B6nig wrote:
> > > On 12/1/25 11:50, Philipp Stanner wrote:
> > > > The overwhelming majority of users of dma_fence signaling functions
> > > > don't care about whether the fence had already been signaled by som=
eone
> > > >=20
> >=20

[=E2=80=A6]

> > >=20
> > > > +{
> > > > +	unsigned long flags;
> > > > +	bool ret;
> > > > +
> > > > +	spin_lock_irqsave(fence->lock, flags);
> > > > +	ret =3D dma_fence_check_and_signal_locked(fence);
> > > > +	spin_unlock_irqrestore(fence->lock, flags);
> > >=20
> > > Could this use guard(fence->lock, flags) ?
> >=20
> > guard? You mean a lockdep guard? Do you have a pointer to someplace in
> > dma_fence who does what you mean / want?
>=20
> E.g. like guard(spinlock_irqsave)(&fence->lock);


Hmm, but why?
It's obvious to all readers that I do spin_unlock_irqrestore() here.
It's very simple code, lock, 1 line, unlock. What would the guard
improve?


P.
