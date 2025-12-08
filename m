Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09808CAD289
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 13:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7B510E428;
	Mon,  8 Dec 2025 12:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="KIyrZg9D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6725410E428;
 Mon,  8 Dec 2025 12:35:01 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dQ1ds3yF8z9shn;
 Mon,  8 Dec 2025 13:34:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1765197297; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cil1PvUAdQjigW1xWJM/aHBN7Ji/Jyw7RXVdPDuO+UI=;
 b=KIyrZg9DpcfJxT8JTqo4jwCVTeqxbxSR95D93zN1p6gU0QS8/gZj0rZcEaYbwRhpAU/GRx
 5IvltrpUhIvksgk5OSmjUM9//VJOoC1QNvWLRl5t8GBOl/V+kN+3A/uCGpeZCzTMbQEZic
 nq69D0upWZVdFT7l4rGLztg+zqIRBI4wT5MeLVs/UROm9wbeulaMNgC3MylMKFNfNi3vH2
 XlNWMftcVHvHq0h1Xu9XWFlBCHhC71mAcXat28w+fhtK3zO0nE+UEWHMs1rgqlQRqIb3Zu
 qchC7//TNekehg7YBAVfj2lRpgzlWdewL03TLka/31/81b4Do0Jcs3WXGXx6nw==
Message-ID: <497a945946277cd95ad616af9b64d0c4187bfc74.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
From: Philipp Stanner <phasta@mailbox.org>
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 dakr@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>, Lucas
 Stach <l.stach@pengutronix.de>
Date: Mon, 08 Dec 2025 13:34:53 +0100
In-Reply-To: <21699026216379f294d6597ed6febd187229ffb9.camel@mailbox.org>
References: <20251128182235.47912-1-vitaly.prosyak@amd.com>
 <cdecd1e2-de0d-466f-b98b-927b2f364f79@amd.com>
 <c56ecd19d7ddc1f1ed4e7e9e13388c647de855b1.camel@mailbox.org>
 <49de5988-ea47-4d36-ba25-8773b9e364e2@amd.com>
 <aTMW0UCGQuE+MXLk@lstrano-desk.jf.intel.com>
 <21699026216379f294d6597ed6febd187229ffb9.camel@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 9mct1841n33i194xbusbps8o4ck8anrk
X-MBO-RS-ID: 6df7efb07b3872fc616
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

On Mon, 2025-12-08 at 11:35 +0100, Philipp Stanner wrote:
> On Fri, 2025-12-05 at 09:30 -0800, Matthew Brost wrote:
> > On Fri, Dec 05, 2025 at 11:18:21AM +0100, Christian K=C3=B6nig wrote:
> > > On 12/1/25 10:04, Philipp Stanner wrote:
> > > >=20
>=20
>=20
> >=20

[=E2=80=A6]

> > Are you sure this is happening? It doesn=E2=80=99t seem possible, nor h=
ave I
> > observed it.
>=20
> It's impossible, isn't it?
>=20
> static void drm_sched_job_timedout(struct work_struct *work) { struct drm=
_gpu_scheduler *sched; struct drm_sched_job *job; enum drm_gpu_sched_stat s=
tatus =3D DRM_GPU_SCHED_STAT_RESET; sched =3D container_of(work, struct drm=
_gpu_scheduler, work_tdr.work); /* Protects against concurrent deletion in =
drm_sched_get_finished_job */ spin_lock(&sched->job_list_lock); job =3D lis=
t_first_entry_or_null(&sched->pending_list, struct drm_sched_job, list); if=
 (job) { /* * Remove the bad job so it cannot be freed by a concurrent * &s=
truct drm_sched_backend_ops.free_job. It will be * reinserted after the sch=
eduler's work items have been * cancelled, at which point it's safe. */ lis=
t_del_init(&job->list); spin_unlock(&sched->job_list_lock); status =3D job-=
>sched->ops->timedout_job(job);
>=20

sry guys, seems I really need to switch to Mutt. When I clicked "send"
the formatting definitely was OK, but in my outbox it's now also
broken. No idea why.

Please take a look at drm_sched_job_timedout() in your tree. That's the
code I'm referring to.

P.

