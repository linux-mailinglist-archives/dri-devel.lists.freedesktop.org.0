Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JiDA11hjGmWlwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 12:00:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2D4123B2F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 12:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F79710E01F;
	Wed, 11 Feb 2026 11:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eB51r3si";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874E710E01F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 11:00:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3321243AA0;
 Wed, 11 Feb 2026 11:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3785C4CEF7;
 Wed, 11 Feb 2026 11:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770807635;
 bh=RiqFFN9Tr/evnRpNR/pIaWzHOD53Xki7Iw8z1m2Fs24=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=eB51r3sioEZUO7pAEypGJodRsEl9vJSz63bQBDGLvzLfZtBzbm+bzKuBkBgseHyaX
 5UhCEVLynZhEfSp3/QnPRXl1+FEWNHxyZ9C/vCMq49EDG9pgsfRkd1fdjtkgJzFYXM
 Urfgk/vs95z4Xh1C+E0tK5UcBi+1J1BhpW1K/NZc8A33Kff7eW2FGH+qB+EZc/b0gC
 dL6HFfuWvOvyf2vWwvmZPhvVifarh31i7yx2zUjJEszR4s+7SibsyduZLSoLIxTlJ0
 bsN90H1Dz++C+8RSVSXL+PQmpR6c7OCi4F06JMHrPh0IjhX3d63vJFm0gxlIodCPZq
 Jmv1/AfiveyZA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 12:00:30 +0100
Message-Id: <DGC2WYUT80B4.3D4QKYP8FVVQJ@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Philipp Stanner" <phasta@mailbox.org>,
 <phasta@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Gary Guo" <gary@garyguo.net>, "Benno Lossin"
 <lossin@kernel.org>, "Daniel Almeida" <daniel.almeida@collabora.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
References: <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <DGB7RWKMPJQZ.2PHB127O6MVVN@kernel.org>
 <4e84306c-5cec-4048-a7eb-a364788baa89@amd.com>
 <aYsZHhX2IVO2kOSm@google.com> <DGC1KP1DT6YV.3LQWZXMA22L5A@kernel.org>
 <20260211112049.089b2656@fedora>
In-Reply-To: <20260211112049.089b2656@fedora>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[google.com,amd.com,mailbox.org,kernel.org,gmail.com,ffwll.ch,garyguo.net,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org,intel.com,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:christian.koenig@amd.com,m:phasta@mailbox.org,m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:boris.brezillon@collabora.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RSPAMD_EMAILBL_FAIL(0.00)[dakr.kernel.org:query timed out];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:url]
X-Rspamd-Queue-Id: AD2D4123B2F
X-Rspamd-Action: no action

On Wed Feb 11, 2026 at 11:20 AM CET, Boris Brezillon wrote:
> On Wed, 11 Feb 2026 10:57:27 +0100
> "Danilo Krummrich" <dakr@kernel.org> wrote:
>
>> (Cc: Xe maintainers)
>>=20
>> On Tue Feb 10, 2026 at 12:40 PM CET, Alice Ryhl wrote:
>> > On Tue, Feb 10, 2026 at 11:46:44AM +0100, Christian K=C3=B6nig wrote: =
=20
>> >> On 2/10/26 11:36, Danilo Krummrich wrote: =20
>> >> > On Tue Feb 10, 2026 at 11:15 AM CET, Alice Ryhl wrote: =20
>> >> >> One way you can see this is by looking at what we require of the
>> >> >> workqueue. For all this to work, it's pretty important that we nev=
er
>> >> >> schedule anything on the workqueue that's not signalling safe, sin=
ce
>> >> >> otherwise you could have a deadlock where the workqueue is execute=
s some
>> >> >> random job calling kmalloc(GFP_KERNEL) and then blocks on our fenc=
e,
>> >> >> meaning that the VM_BIND job never gets scheduled since the workqu=
eue
>> >> >> is never freed up. Deadlock. =20
>> >> >=20
>> >> > Yes, I also pointed this out multiple times in the past in the cont=
ext of C GPU
>> >> > scheduler discussions. It really depends on the workqueue and how i=
t is used.
>> >> >=20
>> >> > In the C GPU scheduler the driver can pass its own workqueue to the=
 scheduler,
>> >> > which means that the driver has to ensure that at least one out of =
the
>> >> > wq->max_active works is free for the scheduler to make progress on =
the
>> >> > scheduler's run and free job work.
>> >> >=20
>> >> > Or in other words, there must be no more than wq->max_active - 1 wo=
rks that
>> >> > execute code violating the DMA fence signalling rules. =20
>> >
>> > Ouch, is that really the best way to do that? Why not two workqueues? =
=20
>>=20
>> Most drivers making use of this re-use the same workqueue for multiple G=
PU
>> scheduler instances in firmware scheduling mode (i.e. 1:1 relationship b=
etween
>> scheduler and entity). This is equivalent to the JobQ use-case.
>>=20
>> Note that we will have one JobQ instance per userspace queue, so sharing=
 the
>> workqueue between JobQ instances can make sense.
>
> Definitely, but I think that's orthogonal to allowing this common
> workqueue to be used for work items that don't comply with the
> dma-fence signalling rules, isn't it?

Yes and no. If we allow passing around shared WQs without a corresponding t=
ype
abstraction we open the door for drivers to abuse it the schedule their own
work.

I.e. sharing a workqueue between JobQs is fine, but we have to ensure they =
can't
be used for anything else.

>> Besides that, IIRC Xe was re-using the workqueue for something else, but=
 that
>> doesn't seem to be the case anymore. I can only find [1], which more see=
ms like
>> some custom GPU scheduler extention [2] to me...
>
> Yep, I think it can be the problematic case. It doesn't mean we can't
> schedule work items that don't signal fences, but I think it'd be
> simpler if we were forcing those to follow the same rules (no blocking
> alloc, no locks taken that are also taken in other paths were blocking
> allocs happen, etc) regardless of this wq->max_active value.
>
>>=20
>> [1] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/gpu/drm/xe/x=
e_gpu_scheduler.c#L40
>> [2] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/gpu/drm/xe/x=
e_gpu_scheduler_types.h#L28

