Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A437D9144
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 10:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA7710E13F;
	Fri, 27 Oct 2023 08:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F401F10E0D3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 08:22:41 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 31DB666072FC;
 Fri, 27 Oct 2023 09:22:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698394960;
 bh=CXETlEvRgv2L/Tp9RviTmDGHkICt3aBol0oF6zd6BP8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DbIm5g5z5kdA/lxGLKSTtYN8atKFb3s6GvXKvWp31LXIGGMxVkwafkeOzVCBVV2XZ
 9oZ9XHtzzb5BP5N9KcGnQBKbS0fnJJjtirdkZKwzuJxaxNCZll3l9NKmV+WJ8eRULr
 Mwshdi3fJfxoihUmqPOXefJWMmuQSnM+2TzuoYXFfEhBc/OqbxuwmKzmRgQfp5qfgD
 oPocHKWLgZEKfTj9N9l56y+/J+VhkJJGLkcoA0phToE5mXJOPFCEFnW4TEWVnMXbnX
 9ICnUbxxX6bou82iTnR2AWbb2iCQJMWnNEpcDn+4YIiGRglrxTb32RomCRX3zdatXP
 /aFE+Q1mIB7qQ==
Date: Fri, 27 Oct 2023 10:22:37 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
Message-ID: <20231027102237.0cdb85af@collabora.com>
In-Reply-To: <98988459-25a8-4ee0-89d4-cb816cbc5bef@amd.com>
References: <20231026161431.5934-1-dakr@redhat.com>
 <0bc79ae3-04fe-4e85-9fd0-e8b281148390@amd.com>
 <20231027093238.2ff8172e@collabora.com>
 <ff389793-1226-49fd-b599-07dbda0b97be@amd.com>
 <20231027093943.3f0ae992@collabora.com>
 <98988459-25a8-4ee0-89d4-cb816cbc5bef@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: matthew.brost@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net, luben.tuikov@amd.com,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Oct 2023 09:44:13 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 27.10.23 um 09:39 schrieb Boris Brezillon:
> > On Fri, 27 Oct 2023 09:35:01 +0200
> > Christian K=C3=B6nig<christian.koenig@amd.com>  wrote:
> > =20
> >> Am 27.10.23 um 09:32 schrieb Boris Brezillon: =20
> >>> On Fri, 27 Oct 2023 09:22:12 +0200
> >>> Christian K=C3=B6nig<christian.koenig@amd.com>  wrote:
> >>>    =20
> >>>>> +
> >>>>> +	/**
> >>>>> +	 * @update_job_credits: Called once the scheduler is considering =
this
> >>>>> +	 * job for execution.
> >>>>> +	 *
> >>>>> +	 * Drivers may use this to update the job's submission credits, w=
hich is
> >>>>> +	 * useful to e.g. deduct the number of native fences which have b=
een
> >>>>> +	 * signaled meanwhile.
> >>>>> +	 *
> >>>>> +	 * The callback must either return the new number of submission c=
redits
> >>>>> +	 * for the given job, or zero if no update is required.
> >>>>> +	 *
> >>>>> +	 * This callback is optional.
> >>>>> +	 */
> >>>>> +	u32 (*update_job_credits)(struct drm_sched_job *sched_job); =20
> >>>> Why do we need an extra callback for this?
> >>>>
> >>>> Just document that prepare_job() is allowed to reduce the number of
> >>>> credits the job might need.
> >>> ->prepare_job() is called only once if the returned fence is NULL, bu=
t =20
> >>> we need this credit-update to happen every time a job is considered f=
or
> >>> execution by the scheduler. =20
> >> But the job is only considered for execution once. How do you see that
> >> this is called multiple times? =20
> > Nope, it's not. If drm_sched_can_queue() returns false, the scheduler
> > will go look for another entity that has a job ready for execution, and
> > get back to this entity later, and test drm_sched_can_queue() again.
> > Basically, any time drm_sched_can_queue() is called, the job credits
> > update should happen, so we have an accurate view of how many credits
> > this job needs. =20
>=20
> Well, that is the handling which I already rejected because it creates=20
> unfairness between processes. When you consider the credits needed=20
> *before* scheduling jobs with a lower credit count are always preferred=20
> over jobs with a higher credit count.

My bad, it doesn't pick another entity when an entity with a
ready job that doesn't fit the queue is found, it just bails out from
drm_sched_rq_select_entity_rr() and returns NULL (AKA: no ready entity
found). But we still want to update the job credits before checking if
the job fits or not (next time this entity is tested).

> What you can do is to look at the credits of a job *after* it was picked=
=20
> up for scheduling so that you can scheduler more jobs.

Sure, but then you might further delay your job if something made it
smaller (ie. native fences got signaled) between ->prepare_job() and
drm_sched_can_queue(). And any new drm_sched_can_queue() test would
just see the old credits value.

Out of curiosity, what are you worried about with this optional
->update_job_credits() call in the drm_sched_can_queue() path? Is the
if (sched->update_job_credits) overhead considered too high for drivers
that don't need it?
