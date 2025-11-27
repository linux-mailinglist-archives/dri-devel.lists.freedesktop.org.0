Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EFDC8F50F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 16:43:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0971E10E814;
	Thu, 27 Nov 2025 15:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="rJBnWCwd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4121610E815;
 Thu, 27 Nov 2025 15:43:43 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dHLLg5Mnxz9v0b;
 Thu, 27 Nov 2025 16:43:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764258219; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T8BebGp6817BarcOhYkOTFKpNtGZhH0Hzg/x4d8jTPI=;
 b=rJBnWCwdjqhyXax+vj9jEdfvvNHmHBKxf4Vx01UM2VZR/M8uhzUla8075dSW3u3MUThOFq
 UWPLNvuVWnYgUi3hZGxb/HuABbU5m8EYXT11ECG736HnrLFHM9gj58Y2/oMWek3lAugwCc
 UlPh9rJ1VYSTVlC5FfoNsxxDV43GeHaJGexjJpfdR6vz0zxTn096zYv3GisOcvElyWLmZ/
 5xd4OUXnH6yJXZ9MpWXgXBMU6Sy9EMyG7fCbspCKodX1QSuQ/Isi+unePiiija3oVnnr/e
 bpgsIo8xtw8Q2BsyLHjNH7xFDCju7gwS1rE468ebDHd3/vbbZo4wBsxwOz8XRg==
Message-ID: <5c69f4849cb3d9dc087c303a33ba385925e126eb.camel@mailbox.org>
Subject: Re: [PATCH 2/6] amd/amdkfd: Ignore return code of dma_fence_signal()
From: Philipp Stanner <phasta@mailbox.org>
To: "Kuehling, Felix" <felix.kuehling@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, phasta@kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Alex Deucher <alexander.deucher@amd.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,  Matthew Brost
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Date: Thu, 27 Nov 2025 16:43:28 +0100
In-Reply-To: <39263b3b-3574-43ae-aec1-73fe39e29f10@amd.com>
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-4-phasta@kernel.org>
 <cef83fed-5994-4c77-962c-9c7aac9f7306@amd.com>
 <d46f753e660694ab46c65409a5e43f050b7eb2d9.camel@mailbox.org>
 <b1c3dd51-1ba9-4036-b964-8e9f4350bbee@amd.com>
 <39263b3b-3574-43ae-aec1-73fe39e29f10@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: guh68fw61fno75gu3xahdopeu8c9fbtb
X-MBO-RS-ID: ca2c12074ac69eba2f0
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

On Thu, 2025-11-27 at 10:08 -0500, Kuehling, Felix wrote:
> On 2025-11-27 04:55, Christian K=C3=B6nig wrote:
> > On 11/27/25 10:48, Philipp Stanner wrote:
> > >=20

[=E2=80=A6]

> > > The issue now is that dma_fence_signal()'s return code is actually no=
n-
> > > racy, because check + bit-set are protected by lock.
> > >=20
> > > Christian's new spinlock series would add a lock function for fences:
> > > https://lore.kernel.org/dri-devel/20251113145332.16805-5-christian.ko=
enig@amd.com/
> > >=20
> > >=20
> > > So I suppose this should work:
> > >=20
> > > dma_fence_lock_irqsave(ef, flags);
> > > if (dma_fence_test_signaled_flag(ef)) {
> > > 	dma_fence_unlock_irqrestore(ef, flags);
> > > 	return true;
> > > }
> > > dma_fence_signal_locked(ef);
> > > dma_fence_unlock_irqrestore(ef, flags);
> > >=20
> > > return false;
> > >=20
> > >=20
> > > + some cosmetic adjustments for the boolean of course.
> > >=20
> > >=20
> > > Would that fly and be reasonable? @Felix, Christian.
> > I was just about to reply with the same idea when your mail arrived.
>=20
> I agree as well. The important feature is that we need to test and=20
> signal the fence atomically. It may even make sense to add a function
> for that "dma_fence_test_and_signal" that preserves the original=20
> behaviour of dma_fence_signal. ;)

Fine by me if the maintainer agrees

P.
