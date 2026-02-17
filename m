Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDp3DyNClGm3BgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 11:25:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CB614AD36
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 11:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960AE10E4C8;
	Tue, 17 Feb 2026 10:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ZJmOsiFU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2705210E4CB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 10:25:34 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fFbPk6CrVz9tPF;
 Tue, 17 Feb 2026 11:25:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1771323930; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MYALA9bthKUi4cPtiQOjwnebj6XDjFjmpqTthtqZB7c=;
 b=ZJmOsiFUUuUcKJWu7XTcLVMCspZe7khN5E18Tt6tUvyHF1BFVK+TPY1vukxkMjoIMMP4y4
 tiArVxMqeM0MQ4HV+rpUj7Ku7Tvb/TkuyWsZ1r681svBMlI6M+0YZ6oIq9K6iXc1yDBB6K
 3QG9knlpiLMYPnJYKAnfeqSuNhR/oNYji337S40/Eajfwsvdvws81S47A7O+h3BT6hkdvL
 t52++fSaCnMWZLqf+PonEsczLzPi25ZJS0Z9aBdn9HISg79B/SWLzk7GjXNfS+3tH/5wRD
 KJkM6MKkleUKZu0bGiOVhCZ0mYi9Wns5E8Bq3vbFCiSTSDYlC6wHmU/+fjJUhg==
Message-ID: <414b00dcb19c772d9a616a5aed10a5ac59dc830b.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Remove racy hack from drm_sched_fini()
From: Philipp Stanner <phasta@mailbox.org>
To: Philipp Stanner <phasta@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 17 Feb 2026 11:25:27 +0100
In-Reply-To: <20260108083019.63532-2-phasta@kernel.org>
References: <20260108083019.63532-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: f2e2e50f84b4298189a
X-MBO-RS-META: c6mw8tb49tnn91cd395r5gtf5ya1h9rw
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
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:matthew.brost@intel.com,m:dakr@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:linux-kernel@vger.kernel.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:mid,mailbox.org:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[mailbox.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Queue-Id: C4CB614AD36
X-Rspamd-Action: no action

On Thu, 2026-01-08 at 09:30 +0100, Philipp Stanner wrote:
> drm_sched_fini() contained a hack to work around a race in amdgpu.
> According to AMD, the hack should not be necessary anymore. In case
> there should have been undetected users,
>=20
> commit 975ca62a014c ("drm/sched: Add warning for removing hack in drm_sch=
ed_fini()")
>=20
> had added a warning one release cycle ago.
>=20
> Thus, it can be derived that the hack can be savely removed by now.
>=20
> Remove the hack.
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> As hinted at in the commit, I want to cozyly queue this one up for the
> next merge window, since we're printing that warning since last merge
> window already.
>=20
> If someone has concerns I'm also happy to delay this patch for a few
> more releases.
> ---

Any objections by anyone?

Can I get an RB?


P.

> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 38 +----------------------=
---
> =C2=A01 file changed, 1 insertion(+), 37 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 1d4f1b822e7b..381c1694a12e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1416,48 +1416,12 @@ static void drm_sched_cancel_remaining_jobs(struc=
t drm_gpu_scheduler *sched)
> =C2=A0 */
> =C2=A0void drm_sched_fini(struct drm_gpu_scheduler *sched)
> =C2=A0{
> -	struct drm_sched_entity *s_entity;
> =C2=A0	int i;
> =C2=A0
> =C2=A0	drm_sched_wqueue_stop(sched);
> =C2=A0
> -	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> -		struct drm_sched_rq *rq =3D sched->sched_rq[i];
> -
> -		spin_lock(&rq->lock);
> -		list_for_each_entry(s_entity, &rq->entities, list) {
> -			/*
> -			 * Prevents reinsertion and marks job_queue as idle,
> -			 * it will be removed from the rq in drm_sched_entity_fini()
> -			 * eventually
> -			 *
> -			 * FIXME:
> -			 * This lacks the proper spin_lock(&s_entity->lock) and
> -			 * is, therefore, a race condition. Most notably, it
> -			 * can race with drm_sched_entity_push_job(). The lock
> -			 * cannot be taken here, however, because this would
> -			 * lead to lock inversion -> deadlock.
> -			 *
> -			 * The best solution probably is to enforce the life
> -			 * time rule of all entities having to be torn down
> -			 * before their scheduler. Then, however, locking could
> -			 * be dropped alltogether from this function.
> -			 *
> -			 * For now, this remains a potential race in all
> -			 * drivers that keep entities alive for longer than
> -			 * the scheduler.
> -			 *
> -			 * The READ_ONCE() is there to make the lockless read
> -			 * (warning about the lockless write below) slightly
> -			 * less broken...
> -			 */
> -			if (!READ_ONCE(s_entity->stopped))
> -				dev_warn(sched->dev, "Tearing down scheduler with active entities!\n=
");
> -			s_entity->stopped =3D true;
> -		}
> -		spin_unlock(&rq->lock);
> +	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++)
> =C2=A0		kfree(sched->sched_rq[i]);
> -	}
> =C2=A0
> =C2=A0	/* Wakeup everyone stuck in drm_sched_entity_flush for this schedu=
ler */
> =C2=A0	wake_up_all(&sched->job_scheduled);

