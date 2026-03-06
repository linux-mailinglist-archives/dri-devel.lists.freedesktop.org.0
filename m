Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEaYLKzQqmkKXgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:03:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E53F2214C2
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:03:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4754510E246;
	Fri,  6 Mar 2026 13:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ccveBowf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B8C10E246
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 13:03:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C8E8960018;
 Fri,  6 Mar 2026 13:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C7DC2BC86;
 Fri,  6 Mar 2026 13:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772802216;
 bh=jRCveaJm52/FekT7y05m+UWvnUqUknrFccZNLmPxkjA=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=ccveBowfAkoZO136ZHs1Qzr0+JeYoISHjwK8gFQu0VFxdBsMncnBNloT3zujjVAGt
 p2gmPbgXFfsNgY9ldau1Pkwx031wNtFm4UbzD1f4zm7N0pYSdjYR947swTnZpTEAEe
 Ji6nc9+GQvygn8eQLn20iJD37ys6NqekArWMRMPkv1Pd+YoM/XroRHws3bdwK4cYg6
 OsuVFK6UsXIw/W8lDicy7wAmKEqL5F2qwqSvLH7ywhf7Xxgwc3r/D4uT9ywIUUWLrF
 ZkXtLtq10gM+pRi5w5Ao0NLo4WLIDUuDvH6b5/GxBbwc3xBJ2wvTrMV5piidtKULm1
 Ibs4vKLViQNQQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 14:03:33 +0100
Message-Id: <DGVPXPMB8JB3.3VWBBX3YOK3G5@kernel.org>
Subject: Re: dma_fence: force users to take the lock manually
Cc: <phasta@kernel.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Tvrtko Ursulin"
 <tvrtko.ursulin@igalia.com>, "dri-devel" <dri-devel@lists.freedesktop.org>
To: "Philipp Stanner" <phasta@mailbox.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <080395923c92ef758ca6062f1e01392186413015.camel@mailbox.org>
 <718ad034-8fc2-4b43-9b04-729c5befc3ca@amd.com>
 <20260305161212.7dfbadbd@fedora>
 <e8b47e9f-f8cd-4be4-953a-931816e5f429@amd.com>
 <20260306104646.36319162@fedora>
 <9718fa34-95f7-4461-9d01-2ad4eed60b14@amd.com>
 <20260306113723.1f13010c@fedora>
 <b5830a15-af9f-47b0-a811-d43c0c3828dd@amd.com>
 <20260306122417.6febebf4@fedora>
 <6246da89fed7669247527fc36bfee5d92ada96e3.camel@mailbox.org>
 <0009b35c-265f-43ff-84bc-39fbf7109a3d@amd.com>
 <87197ff8d812debbd348ccb2befff855b30abb31.camel@mailbox.org>
In-Reply-To: <87197ff8d812debbd348ccb2befff855b30abb31.camel@mailbox.org>
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
X-Rspamd-Queue-Id: 0E53F2214C2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:christian.koenig@amd.com,m:boris.brezillon@collabora.com,m:tvrtko.ursulin@igalia.com,m:phasta@mailbox.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Fri Mar 6, 2026 at 1:36 PM CET, Philipp Stanner wrote:
> On Fri, 2026-03-06 at 13:31 +0100, Christian K=C3=B6nig wrote:
>> All fences must always signal because the HW operation must always compl=
ete
>> or be terminated by a timeout.
>>=20
>> If a fence signals only because it runs out of scope than that means tha=
t you
>> have a huge potential for data corruption and that is even worse than no=
t
>> signaling a fence.

If that happens, it is a functional bug, the potential data corruption is o=
nly
within a separate memory object, e.g. GEM etc., no? I.e. it may fault the G=
PU,
but it does not fault the kernel.

>> In other words not signaling a fence can leave the system in a deadlock
>> state, but signaling it incorrectly usually results in random data
>> corruption.

Well, not signaling it results in a potential deadlock of the whole kernel,
whereas wrongly signaling it is "only" a functional bug.

> It all stands and falls with the question whether a fence can drop by
> accident in Rust, or if it will only ever drop when the hw-ring is
> closed.
>
> What do you believe is the right thing to do when a driver unloads?

The fence has to be signaled -- ideally after shutting down all queues, but=
 it
has to be signaled.

> Ideally we could design it in a way that the driver closes its rings,
> the pending fences drop and get signaled with ECANCELED.
>
> Your concern seems to be a driver by accident droping a fence while the
> hardware is still processing the associated job.

I'm not concerned about the "driver drops fence by accident" case, as it is=
 less
problematic than the "driver forgets to signal the fence" case. One is a lo=
gic
bug, whereas the other can deadlock the kernel, i.e. it is unsafe in terms =
of
Rust.

(Technically, there are subsequent problems to solve, as core::mem::forget(=
) is
safe and would cause the same problem. However, this is not new, it applies=
 to
lock guards in general. We can catch such things with klint though.)

Ultimately, a DMA fence (that has been exposed to the outside world) is
technically equivalent to a lock guard.

> (how's that dangerous, though? Shouldn't parties waiting for the fence
> detect the error? ECANCELED =E2=87=92 you must not access the associated
> memory)
