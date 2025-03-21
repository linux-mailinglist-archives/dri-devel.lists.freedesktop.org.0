Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D2CA6B5FE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 09:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCFD10E129;
	Fri, 21 Mar 2025 08:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="lglERMLY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2C710E129;
 Fri, 21 Mar 2025 08:20:12 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ZJwNl6NsPz9s01;
 Fri, 21 Mar 2025 09:20:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1742545207; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oyYjdGGRzlCcQkWUZiH4uZGdGt1yFcspRATdfLaayM8=;
 b=lglERMLYka0HtJ01JR3ErNWMeqe9J8V484eBch6W/Z6Emdw0FCxhOSBlQCStb5jmW1Cb4P
 9YL38hNzEzCS7eYSqiD28pm/bdYfsU6wa7W4Jx6rg2y7gLwMaoHMrfOPkX+t+rEmfyuD7W
 s1Mvouk1jCBbPbtmvF2J1oPSWldJ3u7E6YwwWyt0BDSmJpEX4BAyeoZ+S1gl8ZcBTsbKyD
 H0HGk341WdY+W/RXx62ejcOkD6VGOU3BPLkrYDx5aZ7OXl5jAs7+q9OZ1vLla06JWRlgA3
 I06m1y7+S+KAHs9iPOwET1xGyMvUEsIRyfuixAA6NVztMEmhNlCAQkuhqP2sww==
Message-ID: <773a6105e1b448ecb2be8b2c80bb63c0e08f52d2.camel@mailbox.org>
Subject: Re: [PATCH 1/2] drm/sched: add drm_sched_prealloc_dependency_slots
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@kernel.org, dri-devel@lists.freedesktop.org, dakr@kernel.org, 
 amd-gfx@lists.freedesktop.org
Date: Fri, 21 Mar 2025 09:20:04 +0100
In-Reply-To: <860fb3b6-0f18-49c4-b464-5c8c8995e6bd@igalia.com>
References: <20250318120313.19099-1-christian.koenig@amd.com>
 <20250318120313.19099-2-christian.koenig@amd.com>
 <769f6c5788eff9459414b8ce0b056989e29773af.camel@mailbox.org>
 <48f07793-0fd4-4cdd-8568-3bd2ff63bb6a@gmail.com>
 <860fb3b6-0f18-49c4-b464-5c8c8995e6bd@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: qy7cap3s8zg1d9g8qy4kir1jf5gkubjs
X-MBO-RS-ID: 5a39719af3035e82328
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

On Thu, 2025-03-20 at 11:49 +0000, Tvrtko Ursulin wrote:
>=20
> On 19/03/2025 11:23, Christian K=C3=B6nig wrote:
> > > > + *
> > > > + * Return:
> > > > + * 0 on success, or an error on failing to expand the array.
> > > > + */
> > > > +int drm_sched_job_prealloc_dependency_slots(struct
> > > > drm_sched_job
> > > > *job,
> > > > +					=C2=A0=C2=A0=C2=A0 unsigned int
> > > > num_deps)
> > > > +{
> > > > +	struct dma_fence *fence;
> > > > +	u32 id =3D 0;
> > > > +	int ret;
> > > > +
> > > > +	while (num_deps--) {
> > > > +		fence =3D dma_fence_get_stub();
> > > > +		ret =3D xa_alloc(&job->dependencies, &id, fence,
> > > > xa_limit_32b,
> > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL);
> > > So this would fill the xarr with already signaled fences which
> > > then
> > > later will be replaced with unsignaled fences?
> >=20
> > Yes, exactly that's the idea.
> >=20
> > > Help me out here: would it also work to add NULL instead of that
> > > stub-
> > > fence?
> >=20
> > Good question, idk. That's an implementation detail of the xarray.
> >=20
> > Tvrtko also correctly pointed out that it is most likely a bad idea
> > to=20
> > use dma_fence_is_signaled() in the critical code path.
> >=20
> > I will try to dig through the xarray behavior up and update the
> > patch if=20
> > possible.
>=20
> I think NULL on its own is not possible, but the two low bits are=20
> available for pointer tagging, or designating pointers vs integers,=20
> which looks like it could work. Something like storing=20
> xa_tag_pointer(NULL, 1) to reserved slots and at lookup time they
> would=20
> be detected with "xa_pointer_tag(fence) & 1".

Almost!

they would be detected with a super-readable

#define DRM_SCHED_XARR_TAG_RESERVED_ENTRY 1

or maybe =E2=80=A6UNUSED_ENTRY?

^_^

P.


>=20
> Regards,
>=20
> Tvrtko
>=20

