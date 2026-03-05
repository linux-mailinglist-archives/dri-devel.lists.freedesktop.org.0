Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COJfAW8+qWnK3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:27:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7048D20D6ED
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667DA10EB87;
	Thu,  5 Mar 2026 08:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nJLzLHw1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86DD10E227;
 Thu,  5 Mar 2026 08:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772699241;
 bh=wdy+45/+98DzSnSHEtf+B8EmJV5BgovmQCivj3OhJFU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nJLzLHw1jEYx2P+BFQ9XHS/ybyjpbkvbkHTEms6P5mLwHvpMHMf1EoVt/qDK/n7aL
 Yhg5XqgTl47KJvbZBF3UIPIiKNDcLsK0YvD/k4Zq0mIvvBl9iiI+PPdws4L0MCNABp
 aTWXLvYspAFJHA26gw2UuIiQTWlpGB+7FpTlXW4Sk9t9IxQJYRtxKD+5uIA8bcq2LO
 VkERXGkH0gtx5TjSNkznbu20blKXJzjwFJBFJXCLZ1usDN6cuPOEuEGp121evZVjNc
 SWkt7h8jAL7sPEpkt2F9Ms+RhZxVROVJSXLOlgRGBdfuTJolZwVgcHUFxKQGqnfLOG
 8dqX0Yc2FUibQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AA08917E0454;
 Thu,  5 Mar 2026 09:27:20 +0100 (CET)
Date: Thu, 5 Mar 2026 09:27:11 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Chia-I Wu <olvaffe@gmail.com>, ML dri-devel
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, Steven
 Price <steven.price@arm.com>, "Liviu Dudau" <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich
 <dakr@kernel.org>, "Philipp Stanner" <phasta@kernel.org>, Christian
 =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>, Thomas
 =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, open list <linux-kernel@vger.kernel.org>,
 <tj@kernel.org>
Subject: Re: drm_sched run_job and scheduling latency
Message-ID: <20260305092711.20069ca1@fedora>
In-Reply-To: <aajkqXZDGUFPlq1o@lstrano-desk.jf.intel.com>
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <aajkqXZDGUFPlq1o@lstrano-desk.jf.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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
X-Rspamd-Queue-Id: 7048D20D6ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,arm.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,intel.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email,collabora.com:dkim]
X-Rspamd-Action: no action

Hi Matthew,

On Wed, 4 Mar 2026 18:04:25 -0800
Matthew Brost <matthew.brost@intel.com> wrote:

> On Wed, Mar 04, 2026 at 02:51:39PM -0800, Chia-I Wu wrote:
> > Hi,
> >=20
> > Our system compositor (surfaceflinger on android) submits gpu jobs
> > from a SCHED_FIFO thread to an RT gpu queue. However, because
> > workqueue threads are SCHED_NORMAL, the scheduling latency from submit
> > to run_job can sometimes cause frame misses. We are seeing this on
> > panthor and xe, but the issue should be common to all drm_sched users.
> >  =20
>=20
> I'm going to assume that since this is a compositor, you do not pass
> input dependencies to the page-flip job. Is that correct?
>=20
> If so, I believe we could fairly easily build an opt-in DRM sched path
> that directly calls run_job in the exec IOCTL context (I assume this is
> SCHED_FIFO) if the job has no dependencies.

I guess by ::run_job() you mean something slightly more involved that
checks if:

- other jobs are pending
- enough credits (AKA ringbuf space) is available
- and probably other stuff I forgot about

>=20
> This would likely break some of Xe=E2=80=99s submission-backend assumptio=
ns
> around mutual exclusion and ordering based on the workqueue, but that
> seems workable. I don=E2=80=99t know how the Panthor code is structured or
> whether they have similar issues.

Honestly, I'm not thrilled by this fast-path/call-run_job-directly idea
you're describing. There's just so many things we can forget that would
lead to races/ordering issues that will end up being hard to trigger and
debug. Besides, it doesn't solve the problem where your gfx pipeline is
fully stuffed and the kernel has to dequeue things asynchronously. I do
believe we want RT-prio support in that case too.

>=20
> I can try to hack together a quick PoC to see what this would look like
> and give you something to test.
>=20
> > Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and won't
> > meet future android requirements). It seems either workqueue needs to
> > gain RT support, or drm_sched needs to support kthread_worker. =20
>=20
> +Tejun to see if RT workqueue is in the plans.

Dunno how feasible that is, but that would be my preferred option.

>=20
> >=20
> > I know drm_sched switched from kthread_worker to workqueue for better
> > scaling when xe was introduced. But if drm_sched can support either
> > workqueue or kthread_worker during drm_sched_init, drivers can
> > selectively use kthread_worker only for RT gpu queues. And because
> > drivers require CAP_SYS_NICE for RT gpu queues, this should not cause
> > scaling issues.
> >  =20
>=20
> I don=E2=80=99t think having two paths will ever be acceptable, nor do I =
think
> supporting a kthread would be all that easy. For example, in Xe we queue
> additional work items outside of the scheduler on the queue for ordering
> reasons =E2=80=94 we=E2=80=99d have to move all of that code down into DR=
M sched or
> completely redesign our submission model to avoid this. I=E2=80=99m not s=
ure if
> other drivers also do this, but it is allowed.

Panthor doesn't rely on the serialization provided by the single-thread
workqueue, Panfrost might rely on it though (I don't remember). I agree
that maintaining a thread and workqueue based scheduling is not ideal
though.

>=20
> > Thoughts? Or perhaps this becomes less of an issue if all drm_sched
> > users have concrete plans for userspace submissions.. =20
>=20
> Maybe some day....

I've yet to see a solution where no dma_fence-based signalization is
involved in graphics workloads though (IIRC, Arm's solution still
needs the kernel for that). Until that happens, we'll still need the
kernel to signal fences asynchronously when the job is done, which I
suspect will cause the same kind of latency issue...

Regards,

Boris
