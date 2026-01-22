Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xpNTMzfOcWnSMQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 08:13:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D5C626CC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 08:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BE210E1F3;
	Thu, 22 Jan 2026 07:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="RhxFCv6A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0688610E290
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 07:13:53 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dxXNY07pZz9vKm;
 Thu, 22 Jan 2026 08:13:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1769066029; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aDXkrkSTMN5tqBX4sIhOs7JhMsMImp2LrDhselW0VbA=;
 b=RhxFCv6AlBKuiW4seyhAN2OQfsvMosY7elx6k5p0fTQ4TtyagMZK3BD6fzRsHYcA5AUxmD
 SEPPQVb0GVwRosiu2wBFr3Qlo38s7yb3HQgE1AThfzBbyvlEFz6XU7PP2kyTr+/8VWjB5c
 /wRVHhSBLgDY0+OEXblKbUJ4rh9/KgVbX67UZ/065Ne/l5QbbbjaIGuHhxkb91URToTmpA
 2h2J0yLoRXe1OQ3daV+Eh2tYs1SSZrUt32gTI0if2js+wtuvXJ+SXhEdAcNvBbb4z/jJJT
 OU8eWduRw950EMUJTQ3saHmRqGzflL73GHsdMd+tbAX76AOQtOe0wUHSNjXIRg==
Message-ID: <ac46f464eb4a2625596081e1923b01b69f9d43b1.camel@mailbox.org>
Subject: Re: [RFC PATCH] drm/sched: Add new KUnit test suite for concurrent
 job submission
From: Philipp Stanner <phasta@mailbox.org>
To: Marco Pagani <marpagan@redhat.com>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich <dakr@kernel.org>, Philipp
 Stanner <phasta@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Tvrtko
 Ursulin <tvrtko.ursulin@igalia.com>
Date: Thu, 22 Jan 2026 08:13:41 +0100
In-Reply-To: <20260120205236.322086-1-marpagan@redhat.com>
References: <20260120205236.322086-1-marpagan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 1nr44wexkmtj3dsnjfgunodi7txxqytm
X-MBO-RS-ID: 572f7511cb09b0f50cf
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:marpagan@redhat.com,m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:tvrtko.ursulin@igalia.com,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,intel.com,kernel.org,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 24D5C626CC
X-Rspamd-Action: no action

On Tue, 2026-01-20 at 21:52 +0100, Marco Pagani wrote:
> Add a new test suite to simulate concurrent job submissions from userspac=
e.
> The suite includes a basic test case where each worker submits a single
> job, and a more advanced case involving the submission of multiple jobs.

Hi & thx for the patch!

I think the commit message could detail a bit the motivation behind
this test, which seems to be that we currently don't really test real
threaded submission.

The general idea seems desirable to me. Since this was sent as an RFC,
I won't do a detailed review yet.

I would, however, like Tvrtko (+Cc) to take a brief look if he's got
the time to see whether he also agrees with the general idea behind the
patch.


Thx
Philipp

>=20
> Signed-off-by: Marco Pagani <marpagan@redhat.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/tests/tests_basic.c | 175 +++++++++++++++=
+++
> =C2=A01 file changed, 175 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/=
drm/scheduler/tests/tests_basic.c
> index 82a41a456b0a..7c25bcbbe7c9 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> @@ -2,6 +2,7 @@
> =C2=A0/* Copyright (c) 2025 Valve Corporation */
> =C2=A0
> =C2=A0#include <linux/delay.h>
> +#include <linux/completion.h>
> =C2=A0
> =C2=A0#include "sched_tests.h"
> =C2=A0
> @@ -235,6 +236,179 @@ static void drm_sched_basic_cancel(struct kunit *te=
st)
> =C2=A0	KUNIT_ASSERT_EQ(test, job->hw_fence.error, -ECANCELED);
> =C2=A0}
> =C2=A0
> +struct sched_concurrent_test_context {
> +	struct drm_mock_scheduler *sched;
> +	struct workqueue_struct *sub_wq;
> +	struct completion wait_go;
> +};
> +
> +KUNIT_DEFINE_ACTION_WRAPPER(destroy_workqueue_wrap, destroy_workqueue,
> +			=C2=A0=C2=A0=C2=A0 struct workqueue_struct *);
> +
> +KUNIT_DEFINE_ACTION_WRAPPER(drm_mock_sched_fini_wrap, drm_mock_sched_fin=
i,
> +			=C2=A0=C2=A0=C2=A0 struct drm_mock_scheduler *);
> +
> +KUNIT_DEFINE_ACTION_WRAPPER(drm_mock_sched_entity_free_wrap, drm_mock_sc=
hed_entity_free,
> +			=C2=A0=C2=A0=C2=A0 struct drm_mock_sched_entity *);
> +
> +static int drm_sched_concurrent_init(struct kunit *test)
> +{
> +	struct sched_concurrent_test_context *ctx;
> +	int ret;
> +
> +	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> +
> +	init_completion(&ctx->wait_go);
> +
> +	ctx->sched =3D drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
> +
> +	ret =3D kunit_add_action_or_reset(test, drm_mock_sched_fini_wrap, ctx->=
sched);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	/* Use an unbounded workqueue to maximize job submission concurrency */
> +	ctx->sub_wq =3D alloc_workqueue("drm-sched-submitters-wq", WQ_UNBOUND,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WQ_UNBOUND_MAX_ACTIVE);
> +	KUNIT_ASSERT_NOT_NULL(test, ctx->sub_wq);
> +
> +	ret =3D kunit_add_action_or_reset(test, destroy_workqueue_wrap, ctx->su=
b_wq);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	test->priv =3D ctx;
> +
> +	return 0;
> +}
> +
> +struct drm_sched_concurrent_params {
> +	const char *description;
> +	unsigned int job_base_us;
> +	unsigned int num_jobs;
> +	unsigned int num_subs;
> +};
> +
> +static const struct drm_sched_concurrent_params drm_sched_concurrent_cas=
es[] =3D {
> +	{
> +		.description =3D "Concurrently submit a single job in a single entity"=
,
> +		.job_base_us =3D 1000,
> +		.num_jobs =3D 1,
> +		.num_subs =3D 32,
> +	},
> +	{
> +		.description =3D "Concurrently submit multiple jobs in a single entity=
",
> +		.job_base_us =3D 1000,
> +		.num_jobs =3D 10,
> +		.num_subs =3D 64,
> +	},
> +};
> +
> +static void
> +drm_sched_concurrent_desc(const struct drm_sched_concurrent_params *para=
ms, char *desc)
> +{
> +	strscpy(desc, params->description, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(drm_sched_concurrent, drm_sched_concurrent_cases, drm_=
sched_concurrent_desc);
> +
> +struct submitter_data {
> +	struct work_struct work;
> +	struct sched_concurrent_test_context *ctx;
> +	struct drm_mock_sched_entity *entity;
> +	struct drm_mock_sched_job **jobs;
> +	struct kunit *test;
> +	unsigned int id;
> +	bool timedout;
> +};
> +
> +static void drm_sched_submitter_worker(struct work_struct *work)
> +{
> +	const struct drm_sched_concurrent_params *params;
> +	struct sched_concurrent_test_context *ctx;
> +	struct submitter_data *sub_data;
> +	unsigned int i, duration_us;
> +	unsigned long timeout_jiffies;
> +	bool done;
> +
> +	sub_data =3D container_of(work, struct submitter_data, work);
> +	ctx =3D sub_data->ctx;
> +	params =3D sub_data->test->param_value;
> +
> +	wait_for_completion(&ctx->wait_go);
> +
> +	for (i =3D 0; i < params->num_jobs; i++) {
> +		duration_us =3D params->job_base_us + (sub_data->id * 10);
> +		drm_mock_sched_job_set_duration_us(sub_data->jobs[i], duration_us);
> +		drm_mock_sched_job_submit(sub_data->jobs[i]);
> +	}
> +
> +	timeout_jiffies =3D usecs_to_jiffies(params->job_base_us * params->num_=
subs *
> +					=C2=A0=C2=A0 params->num_jobs * 10);
> +	for (i =3D 0; i < params->num_jobs; i++) {
> +		done =3D drm_mock_sched_job_wait_finished(sub_data->jobs[i],
> +							timeout_jiffies);
> +		if (!done)
> +			sub_data->timedout =3D true;
> +	}
> +}
> +
> +static void drm_sched_concurrent_submit_test(struct kunit *test)
> +{
> +	struct sched_concurrent_test_context *ctx =3D test->priv;
> +	const struct drm_sched_concurrent_params *params =3D test->param_value;
> +	struct submitter_data *subs_data;
> +	unsigned int i, j;
> +	int ret;
> +
> +	subs_data =3D kunit_kcalloc(test, params->num_subs, sizeof(*subs_data),
> +				=C2=A0 GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, subs_data);
> +
> +	/*
> +	 * Pre-allocate entities and jobs in the main thread to avoid KUnit
> +	 * assertions in submitters threads
> +	 */
> +	for (i =3D 0; i < params->num_subs; i++) {
> +		subs_data[i].id =3D i;
> +		subs_data[i].ctx =3D ctx;
> +		subs_data[i].test =3D test;
> +		subs_data[i].timedout =3D false;
> +		subs_data[i].entity =3D drm_mock_sched_entity_new(test,
> +								DRM_SCHED_PRIORITY_NORMAL,
> +								ctx->sched);
> +
> +		ret =3D kunit_add_action_or_reset(test, drm_mock_sched_entity_free_wra=
p,
> +						subs_data[i].entity);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		subs_data[i].jobs =3D kunit_kcalloc(test, params->num_jobs,
> +						=C2=A0 sizeof(*subs_data[i].jobs), GFP_KERNEL);
> +		KUNIT_ASSERT_NOT_NULL(test, subs_data[i].jobs);
> +
> +		for (j =3D 0; j < params->num_jobs; j++)
> +			subs_data[i].jobs[j] =3D drm_mock_sched_job_new(test,
> +								=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 subs_data[i].entity);
> +
> +		INIT_WORK(&subs_data[i].work, drm_sched_submitter_worker);
> +		queue_work(ctx->sub_wq, &subs_data[i].work);
> +	}
> +
> +	complete_all(&ctx->wait_go);
> +	flush_workqueue(ctx->sub_wq);
> +
> +	for (i =3D 0; i < params->num_subs; i++)
> +		KUNIT_ASSERT_FALSE_MSG(test, subs_data[i].timedout,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Job submitter worker %u timedo=
ut", i);
> +}
> +
> +static struct kunit_case drm_sched_concurrent_tests[] =3D {
> +	KUNIT_CASE_PARAM(drm_sched_concurrent_submit_test, drm_sched_concurrent=
_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite drm_sched_concurrent =3D {
> +	.name =3D "drm_sched_concurrent_tests",
> +	.init =3D drm_sched_concurrent_init,
> +	.test_cases =3D drm_sched_concurrent_tests,
> +};
> +
> =C2=A0static struct kunit_case drm_sched_cancel_tests[] =3D {
> =C2=A0	KUNIT_CASE(drm_sched_basic_cancel),
> =C2=A0	{}
> @@ -556,6 +730,7 @@ static struct kunit_suite drm_sched_credits =3D {
> =C2=A0};
> =C2=A0
> =C2=A0kunit_test_suites(&drm_sched_basic,
> +		=C2=A0 &drm_sched_concurrent,
> =C2=A0		=C2=A0 &drm_sched_timeout,
> =C2=A0		=C2=A0 &drm_sched_cancel,
> =C2=A0		=C2=A0 &drm_sched_priority,

