Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5163DC05A9A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 12:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C3F10EA5E;
	Fri, 24 Oct 2025 10:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FQ09UUna";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386CE10EA5E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 10:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761302989;
 bh=0xJzT9HOFA/wzQA9PIEVIRkd3/izvnGDUDaNuOAhYnU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FQ09UUnaQFSpk/V8t8j35ER2UrKefovK8sNoJWCvS6uYsz6Skm1EmvT7vUyxeY7YI
 1mI7vvm9vZ8SQt95xIPEBmbTSquqVhjZxAYJmG/FoBHMf9iiM6guG+SweRnu5i2/JX
 rV6evrk8W0nxyB4z3hzTowtUUzXhQF6H+NhLUzdZloAgiW6kucjWa7VNV8/vFhKHMs
 3YPH/tHpQwY9TbDOWadlBpJeByS/3D8IZ48xF1w53QSh76ezSE+2rnuwOVfSF9i2WJ
 KPXLQfmHJJquA0Gz9a2b0DiGncrjF8vKMkYtGoLBEl1iYBkZiiIrMBj3oT/pmJx8JG
 dw6o0nWY2eE5g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3FF2717E127F;
 Fri, 24 Oct 2025 12:49:49 +0200 (CEST)
Date: Fri, 24 Oct 2025 12:49:41 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 03/10] drm/panthor: Introduce framework for
 architecture-specific features
Message-ID: <20251024124941.124a50aa@fedora>
In-Reply-To: <f2a05393-b3d4-47e2-be17-248880d97d49@arm.com>
References: <20251014094337.1009601-1-karunika.choo@arm.com>
 <20251014094337.1009601-4-karunika.choo@arm.com>
 <20251024084327.3332d548@fedora>
 <f2a05393-b3d4-47e2-be17-248880d97d49@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 24 Oct 2025 10:26:16 +0100
Karunika Choo <karunika.choo@arm.com> wrote:

> On 24/10/2025 07:43, Boris Brezillon wrote:
> > On Tue, 14 Oct 2025 10:43:30 +0100
> > Karunika Choo <karunika.choo@arm.com> wrote:
> >  =20
> >> Add a framework to support architecture-specific features. This allows
> >> other parts of the driver to adjust their behaviour based on the featu=
re
> >> bits enabled for a given architecture. =20
> >=20
> > I'm not convinced we need this just yet. AFAICT, the only feature flag
> > being added in this patchset is PANTHOR_HW_FEATURE_PWR_CONTROL, and
> > most of this is abstracted away with function pointers already. The
> > only part that tests this FEATURE_PWR_CONTROL flag is the
> > initialization, which could very much be abstracted away with a
> > function pointer (NULL meaning no PWR block present). There might be
> > other use cases you're planning to use this for, so I'd like to hear
> > about them to make my final opinion on that.
> >  =20
>=20
> I see your point =E2=80=94 the intent here is mainly to have the feature =
flag
> reflect hardware-level changes. In this series, for example, it
> corresponds to the addition of the new PWR_CONTROL block.

Yes, but those are not really optional features. Those are functional
changes that are usually done on major version changes. But let's say
it was something done on a minor version change, it's still something
that I think would be better off abstracted using a vtable of some
sort, and have this vtable forked everytime a version changes requires
something new.

>=20
> Another use case would be arch v11, where a new PRFCNT_FEATURES register
> was introduced. In that case, we might want to adjust the
> counters_per_block [1] value depending on that register=E2=80=99s value.

Again, it looks like a property that can be determined at init time. For
v10 it'd be hardcoded to X, and on v11+, you'd extract that from
PERFCNT_FEATURES. I'm really not a huge fan of this feature flag
pattern because it's very easy to forget to add/propagate one flag when
adding support for new HW/flags. So I'd much rather rely on ">=3D X.Y"
version checks in the init path, and for anything more involved or
happening in some hot path, function based pointer specialization.

>=20
> I would also expect this mechanism to remain useful for future hardware
> revisions, as it provides a clean way to describe architectural
> differences without scattering version-specific checks throughout the
> code, while still being lighter-weight than function pointers.

Well, that's questionable. What I usually see in practice is the
following pattern spreading over the code base:

	if (SUPPORTS(OBSCURE_FEATURE_NAME)) {
		// do stuff that are not obviously related to the
		// feature flag name
	}

whereas, if we're having a model where the specialization is done high
enough, you'd just end up with functions calling more specialized
helpers:

void do_something_for_v12()
{
	hw_block_a_do_y()
	hw_block_b_do_x()
	...
}
