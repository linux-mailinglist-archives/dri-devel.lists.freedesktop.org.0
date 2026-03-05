Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Dg8BghBqWkZ3gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:38:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AED420D8C2
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C4F10EB8D;
	Thu,  5 Mar 2026 08:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ups+boPH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38ECD10EB8D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 08:38:27 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fRNGm4XrCz9vHN;
 Thu,  5 Mar 2026 09:38:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1772699904; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RDdj3abi2vMGKdWjSOIxxSAL5D4KNz7XiIk0sO3UJ0o=;
 b=ups+boPHjHQ2P/4dIdpcVSQmrelz+aRL8XaXz56odHOk3J90+6cRU43ZLLgg/8CYdfMIF0
 pqUeaCBY20QTEjUrTz58i73NfHxtVzzULWeU9baBhT9GJrxvVq03vMDOHVzitEXgEUXTX4
 M+6pEFG8yShRUs6OOYev9l+pLYooZT1/9/hlghkbJFv6vqUQPzzZBNTNHbhL20SmSXcdc6
 T8AM3m1cEJr4XeeirK1OwLaipkKSu1XHvaYkHyNjTwgxNer7ll68N1XUv0UhwpGXdBDtKw
 f3V6D4lue/OlFJDd7qeCT/b8tm63qWcfuZ695qO0iZjJ4pqLaapRa7Zd+J2Dmw==
Message-ID: <fa4a9c55792b0e79d94faa82085b693aa7feb989.camel@mailbox.org>
Subject: Re: drm_sched run_job and scheduling latency
From: Philipp Stanner <phasta@mailbox.org>
To: Boris Brezillon <boris.brezillon@collabora.com>, Matthew Brost
 <matthew.brost@intel.com>
Cc: Chia-I Wu <olvaffe@gmail.com>, ML dri-devel
 <dri-devel@lists.freedesktop.org>, intel-xe@lists.freedesktop.org, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo
 Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Thomas
 =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>,  open list <linux-kernel@vger.kernel.org>,
 tj@kernel.org
Date: Thu, 05 Mar 2026 09:38:16 +0100
In-Reply-To: <20260305092711.20069ca1@fedora>
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <aajkqXZDGUFPlq1o@lstrano-desk.jf.intel.com>
 <20260305092711.20069ca1@fedora>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 88a6adfc76d4be2c1c4
X-MBO-RS-META: y1d3c39qqy3z9obp43rittpxs8bgscsg
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
X-Rspamd-Queue-Id: 7AED420D8C2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:matthew.brost@intel.com,m:olvaffe@gmail.com,m:intel-xe@lists.freedesktop.org,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:phasta@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:linux-kernel@vger.kernel.org,m:tj@kernel.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,arm.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,intel.com,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Action: no action

On Thu, 2026-03-05 at 09:27 +0100, Boris Brezillon wrote:
> Hi Matthew,
>=20
> On Wed, 4 Mar 2026 18:04:25 -0800
> Matthew Brost <matthew.brost@intel.com> wrote:
>=20
> > On Wed, Mar 04, 2026 at 02:51:39PM -0800, Chia-I Wu wrote:
> > > Hi,
> > >=20
> > > Our system compositor (surfaceflinger on android) submits gpu jobs
> > > from a SCHED_FIFO thread to an RT gpu queue. However, because
> > > workqueue threads are SCHED_NORMAL, the scheduling latency from submi=
t
> > > to run_job can sometimes cause frame misses. We are seeing this on
> > > panthor and xe, but the issue should be common to all drm_sched users=
.
> > > =C2=A0=20
> >=20
> > I'm going to assume that since this is a compositor, you do not pass
> > input dependencies to the page-flip job. Is that correct?
> >=20
> > If so, I believe we could fairly easily build an opt-in DRM sched path
> > that directly calls run_job in the exec IOCTL context (I assume this is
> > SCHED_FIFO) if the job has no dependencies.
>=20
> I guess by ::run_job() you mean something slightly more involved that
> checks if:
>=20
> - other jobs are pending
> - enough credits (AKA ringbuf space) is available
> - and probably other stuff I forgot about
>=20
> >=20
> > This would likely break some of Xe=E2=80=99s submission-backend assumpt=
ions
> > around mutual exclusion and ordering based on the workqueue, but that
> > seems workable. I don=E2=80=99t know how the Panthor code is structured=
 or
> > whether they have similar issues.
>=20
> Honestly, I'm not thrilled by this fast-path/call-run_job-directly idea
> you're describing. There's just so many things we can forget that would
> lead to races/ordering issues that will end up being hard to trigger and
> debug.
>=20

+1

I'm not thrilled either. More like the opposite of thrilled actually.

Even if we could get that to work. This is more of a maintainability
issue.

The scheduler is full of insane performance hacks for this or that
driver. Lockless accesses, a special lockless queue only used by that
one party in the kernel (a lockless queue which is nowadays, after N
reworks, being used with a lock. Ah well).

In the past discussions Danilo and I made it clear that more major
features in _new_ patch series aimed at getting merged into drm/sched
must be preceded by cleanup work to address some of the scheduler's
major problems.

That's especially true if it's features aimed at performance buffs.



P.
