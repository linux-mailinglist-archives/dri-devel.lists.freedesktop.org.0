Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DBEA6A0D3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 08:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C3410E5A2;
	Thu, 20 Mar 2025 07:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AnuH8ztO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD38110E5A2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 07:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742457193;
 bh=VhbF6ZtYEqGBOiwoaOVEj9aGmLZOUW++9yFtPjjR3sY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AnuH8ztOU+Us9eO+xpcEWA9p8bFnMWhaomhHGRwL+utffwumwSh/s/c8nuUBpIA4g
 iChtv0F7s1GW2i3pmdkMwW8dbInDBvm88xPFa0ROl4Tcgv2ZsGLEHGSCoYwIwhweRj
 qJjUs6eRriOyVlAzWc+H5rJW5rXFnN4GR6PApaGGANtRROusEdN8/bPDlL/W6nhIR7
 eEIiC2Fk2zwIV3d53lsDyiqf0M8K3xukUKA4+BUUy3m+uOxqSeNGFXIltYrTn35tuF
 zaEjKzheK3fXJlbeEEH1r94xjMUWiHFheO3nW/oLCqeuuryHfYmF+OeZtICe4xzh0A
 XozbA05VQTFvQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B6D317E0147;
 Thu, 20 Mar 2025 08:53:12 +0100 (CET)
Date: Thu, 20 Mar 2025 08:53:03 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Adrian Larumbe <adrian.larumbe@collabora.com>
Cc: Ashley Smith <ashley.smith@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Heiko Stuebner
 <heiko@sntech.de>, kernel@collabora.com, Daniel Stone
 <daniels@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panthor: Make the timeout per-queue instead of
 per-job
Message-ID: <20250320085303.71803639@collabora.com>
In-Reply-To: <7xwg4gflszioaqizpu5k22ulswlninpkuiyptfalscgic2aqsu@w23h66cahlrz>
References: <20250310133050.280614-1-ashley.smith@collabora.com>
 <7xwg4gflszioaqizpu5k22ulswlninpkuiyptfalscgic2aqsu@w23h66cahlrz>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Wed, 19 Mar 2025 19:51:47 +0000
Adrian Larumbe <adrian.larumbe@collabora.com> wrote:

> On 10.03.2025 13:30, Ashley Smith wrote:
> > The timeout logic provided by drm_sched leads to races when we try
> > to suspend it while the drm_sched workqueue queues more jobs. Let's
> > overhaul the timeout handling in panthor to have our own delayed work
> > that's resumed/suspended when a group is resumed/suspended. When an
> > actual timeout occurs, we call drm_sched_fault() to report it
> > through drm_sched, still. But otherwise, the drm_sched timeout is
> > disabled (set to MAX_SCHEDULE_TIMEOUT), which leaves us in control of
> > how we protect modifications on the timer.
> >
> > One issue seems to be when we call drm_sched_suspend_timeout() from
> > both queue_run_job() and tick_work() which could lead to races due to
> > drm_sched_suspend_timeout() not having a lock. Another issue seems to
> > be in queue_run_job() if the group is not scheduled, we suspend the
> > timeout again which undoes what drm_sched_job_begin() did when calling
> > drm_sched_start_timeout(). So the timeout does not reset when a job
> > is finished.
> >
> > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Tested-by: Daniel Stone <daniels@collabora.com>
> > Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> > Signed-off-by: Ashley Smith <ashley.smith@collabora.com> =20
>=20
> Reviewed-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
>=20
> > ---
> >  drivers/gpu/drm/panthor/panthor_sched.c | 233 +++++++++++++++++-------
> >  1 file changed, 167 insertions(+), 66 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/=
panthor/panthor_sched.c
> > index 4d31d1967716..5f02d2ec28f9 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -360,17 +360,20 @@ struct panthor_queue {
> >  	/** @entity: DRM scheduling entity used for this queue. */
> >  	struct drm_sched_entity entity;
> >
> > -	/**
> > -	 * @remaining_time: Time remaining before the job timeout expires.
> > -	 *
> > -	 * The job timeout is suspended when the queue is not scheduled by the
> > -	 * FW. Every time we suspend the timer, we need to save the remaining
> > -	 * time so we can restore it later on.
> > -	 */
> > -	unsigned long remaining_time;
> > +	/** @timeout: Queue timeout related fields. */
> > +	struct {
> > +		/** @timeout.work: Work executed when a queue timeout occurs. */
> > +		struct delayed_work work; =20
>=20
> Nit: Maybe for the sake of sticking to the convention of naming already
> existing delayed_work structs in a way that reflects their goal, call
> this one 'timeout_work'.

It's already under the timeout struct, and naming it timeout_work would
be redundant IMHO (timeout.timeout_work vs timeout.work).

