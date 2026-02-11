Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIGaMJFSjGmukgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 10:57:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9291230E8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 10:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1655210E09C;
	Wed, 11 Feb 2026 09:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XKSVyD/j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBEA510E09C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 09:57:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7829042157;
 Wed, 11 Feb 2026 09:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2DFC4CEF7;
 Wed, 11 Feb 2026 09:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770803852;
 bh=UBgpfxg902aoW870xOV+hwMSmO6DTVJ0XdLPOKLXDEE=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=XKSVyD/jlYxSyAQQzxg1VhCxqYxs5R8DWrjW6PuzuHgwsyIL5jkhYBWeslmI2ADd/
 W1H7v3WlAWtJkzuDW/rkx0gDmgDrs/60iNj2RT+NxSJgFdyfALPuIfNmQp/vqvHg3O
 UWlnIrGYGT8pF3dstbMEl7KUtUxNAPVeWGMTvlJbHkph3bRZdisiib50vmNWrbCBRO
 tg7JvovCdnXUx9VFpEJnUPOKHZ6kGhP0A8vQhGFItgHyjECu5hCJ2S6erOwpzhwPFU
 ywvoPweKt4AigCHFJoit0Um08k9aVjd8yEBQYxBL4sIMBEsTghGr0AKJzDwPeRihBA
 OzeluWTW09t+Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 10:57:27 +0100
Message-Id: <DGC1KP1DT6YV.3LQWZXMA22L5A@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Cc: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, "Philipp Stanner"
 <phasta@mailbox.org>, <phasta@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Gary Guo"
 <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <lucas.demarchi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <DGB7RWKMPJQZ.2PHB127O6MVVN@kernel.org>
 <4e84306c-5cec-4048-a7eb-a364788baa89@amd.com>
 <aYsZHhX2IVO2kOSm@google.com>
In-Reply-To: <aYsZHhX2IVO2kOSm@google.com>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:boris.brezillon@collabora.com,m:phasta@mailbox.org,m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:aliceryhl@google.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,collabora.com,mailbox.org,kernel.org,gmail.com,ffwll.ch,garyguo.net,nvidia.com,vger.kernel.org,lists.freedesktop.org,intel.com,linux.intel.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1C9291230E8
X-Rspamd-Action: no action

(Cc: Xe maintainers)

On Tue Feb 10, 2026 at 12:40 PM CET, Alice Ryhl wrote:
> On Tue, Feb 10, 2026 at 11:46:44AM +0100, Christian K=C3=B6nig wrote:
>> On 2/10/26 11:36, Danilo Krummrich wrote:
>> > On Tue Feb 10, 2026 at 11:15 AM CET, Alice Ryhl wrote:
>> >> One way you can see this is by looking at what we require of the
>> >> workqueue. For all this to work, it's pretty important that we never
>> >> schedule anything on the workqueue that's not signalling safe, since
>> >> otherwise you could have a deadlock where the workqueue is executes s=
ome
>> >> random job calling kmalloc(GFP_KERNEL) and then blocks on our fence,
>> >> meaning that the VM_BIND job never gets scheduled since the workqueue
>> >> is never freed up. Deadlock.
>> >=20
>> > Yes, I also pointed this out multiple times in the past in the context=
 of C GPU
>> > scheduler discussions. It really depends on the workqueue and how it i=
s used.
>> >=20
>> > In the C GPU scheduler the driver can pass its own workqueue to the sc=
heduler,
>> > which means that the driver has to ensure that at least one out of the
>> > wq->max_active works is free for the scheduler to make progress on the
>> > scheduler's run and free job work.
>> >=20
>> > Or in other words, there must be no more than wq->max_active - 1 works=
 that
>> > execute code violating the DMA fence signalling rules.
>
> Ouch, is that really the best way to do that? Why not two workqueues?

Most drivers making use of this re-use the same workqueue for multiple GPU
scheduler instances in firmware scheduling mode (i.e. 1:1 relationship betw=
een
scheduler and entity). This is equivalent to the JobQ use-case.

Note that we will have one JobQ instance per userspace queue, so sharing th=
e
workqueue between JobQ instances can make sense.

Besides that, IIRC Xe was re-using the workqueue for something else, but th=
at
doesn't seem to be the case anymore. I can only find [1], which more seems =
like
some custom GPU scheduler extention [2] to me...

[1] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/gpu/drm/xe/xe_g=
pu_scheduler.c#L40
[2] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/gpu/drm/xe/xe_g=
pu_scheduler_types.h#L28
