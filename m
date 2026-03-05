Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNTBOKhYqWkh5wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:19:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F09320F965
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:19:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FEE10E23A;
	Thu,  5 Mar 2026 10:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VKUaFtXX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC90510E23A;
 Thu,  5 Mar 2026 10:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772705956;
 bh=87X4PiGJ5ih9WdnSJcid1yjqnmVMdmlUK2MEPbibgvE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VKUaFtXXVrrwlPGBVqqaGWRGji0CNlj8/X8hRPymCr+b2+rWAx19zS/2ady9Faetz
 +JgrgCM6Hfz7JGOPT5O6479t9V8gDCorQP88x+brcrCJMUrBsOBLNZX8DTcIKWr/jx
 lXwAmWAhfj6nXdaqWmGgTLAf42W5jb61VztIVXTvk3aCD43oaa1RBn1FKYDpmJlQGn
 3L9mYt6EopMzBEooPlPmd+8Vx86qD/Pdlu7SKkT3h2UH4k7urEDDV9W12OsJAAKM0n
 YiohxIIjkjxjjLKzG4Y73g86PcVhe6/BzwZbCwaUx+niU8a3D1piuKbAxvz3h4ocUe
 7zMWCvDGBw+ew==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B3DB217E026C;
 Thu,  5 Mar 2026 11:19:15 +0100 (CET)
Date: Thu, 5 Mar 2026 11:19:13 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: <phasta@kernel.org>, Chia-I Wu <olvaffe@gmail.com>, ML dri-devel
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, Steven
 Price <steven.price@arm.com>, "Liviu Dudau" <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich
 <dakr@kernel.org>, Christian =?UTF-8?B?S8O2bmln?=
 <ckoenig.leichtzumerken@gmail.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, <tj@kernel.org>
Subject: Re: drm_sched run_job and scheduling latency
Message-ID: <20260305111913.68fe93e7@fedora>
In-Reply-To: <aalIbgi71svPQs3Z@lstrano-desk.jf.intel.com>
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <aajkqXZDGUFPlq1o@lstrano-desk.jf.intel.com>
 <20260305092711.20069ca1@fedora>
 <fa4a9c55792b0e79d94faa82085b693aa7feb989.camel@mailbox.org>
 <aalIbgi71svPQs3Z@lstrano-desk.jf.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Queue-Id: 7F09320F965
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
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lists.freedesktop.org,arm.com,linux.intel.com,suse.de,ffwll.ch,intel.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Thu, 5 Mar 2026 01:10:06 -0800
Matthew Brost <matthew.brost@intel.com> wrote:

> I can't say I agree with either of you here.
> 
> In about an hour, I seemingly have a bypass path working in DRM sched +
> Xe, and my diff is:
> 
> 108 insertions(+), 31 deletions(-)

First of all, I'm not blindly rejecting the approach, see how I said
"I'm not thrilled" not "No way!". So yeah, if you have something to
propose, feel free to post the diff here or as an RFC on the ML.

Secondly, I keep thinking the fast-path approach doesn't quite fix
the problem at hand where we actually want queuing/dequeuing operations
to match the priority of the HW/FW context, because if your HW context
is high prio but you're struggling to fill the HW queue, it's not truly
high prio. Note that it's problem that was made more evident with FW
scheduling (and the 1:1 entity:sched association), before that we just
had one thread that was dequeuing from entities and pushing to HW
queues based on entities priorities, so priority was somehow better
enforced.

So yeah, even ignoring the discrepancy that might emerge from this new
fast-path-run_job (and the potential maintenance burden we mentioned),
saying "you'll get proper queueing/dequeuing priority enforcement only
if you have no deps, and the pipeline is not full" is kinda limited
IMHO. I'd rather we think about a solution that solves the entire
problem, which both the kthread_work[er] and workqueue(RT) proposals
do.
