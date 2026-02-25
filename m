Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFacBiapnmntWgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 08:47:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DCC193B14
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 08:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E15A10E6C4;
	Wed, 25 Feb 2026 07:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="w42cMHOz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE5D10E6C4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 07:47:44 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fLRWx1V0Bz9v0f;
 Wed, 25 Feb 2026 08:47:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1772005661; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ohTtIs3KiOKY3fntenatP2qpejou263XzYyWPoueg8=;
 b=w42cMHOzcDWTHCv83hsUTdTFLygbvzPm2qzDG+7IEvyMa+v3Bmxtr3+9KXNMWL1MvfwYeq
 Eswn2fko05ROLPfiVFg8WCNUV0NRRMvd+0kIaG2VjQWDHKKsWA/ijux8XPbFSrJ34sKr1g
 lg4buhhyPw8lPjYfW0ibGn1DZe0g+nxZdpSlGdSbwZsuTAoD+dfbil4YQSEx4mtQllv+vt
 YN+00++E6Aksjqct5nuR+AL08YygJPV3dCqAiTPCx3lKUQFAFfiUYi3uVwcVugf63RkU9E
 q1O3oHykJAk0l/GS0ld5F/Lh5GRygmteSGSbwsyRubs4BeJBYq5nPTkmDeDQeA==
Message-ID: <f5c76fe9d70f106f58b9f06f644534c2cead96fd.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Add new KUnit test suite for concurrent job
 submission
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Marco Pagani
 <marco.pagani@linux.dev>,  Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 25 Feb 2026 08:47:35 +0100
In-Reply-To: <e215efdd-c547-4ce4-affe-7198ed37c2a6@ursulin.net>
References: <20260219140711.3296237-1-marco.pagani@linux.dev>
 <e215efdd-c547-4ce4-affe-7198ed37c2a6@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: qzomrqwkp7ukqhn17kpnpt1o4qwwc3e7
X-MBO-RS-ID: fb29562f4c978378f3a
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
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tursulin@ursulin.net,m:marco.pagani@linux.dev,m:matthew.brost@intel.com,m:dakr@kernel.org,m:phasta@kernel.org,m:ckoenig.leichtzumerken@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[ursulin.net,linux.dev,intel.com,kernel.org,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 47DCC193B14
X-Rspamd-Action: no action

On Mon, 2026-02-23 at 16:25 +0000, Tvrtko Ursulin wrote:
>=20
> On 19/02/2026 14:07, Marco Pagani wrote:
> > Add a new test suite to simulate concurrent job submissions to the DRM
> > scheduler. The suite includes two initial test cases: (i) a primary tes=
t
> > case for parallel job submission and (ii) a secondary test case for
> > interleaved job submission and completion. In the first test case, work=
er
> > threads concurrently submit jobs to the scheduler and then the timeline=
 is
> > manually advanced. In the second test case, worker threads periodically
> > submit a sequence of jobs to the mock scheduler. Periods are chosen as
> > harmonic, starting from a base period, to allow interleaving between
> > submission and completion. To avoid impractically large execution times=
,
> > periods are cycled. The timeline is advanced automatically when the job=
s
> > completes. This models how job submission from userspace (in process
> > context) may interleave with job completion (hrtimer callback interrupt
> > context, in the test case) by a physical device.

I still maintain the opinion expressed the last time: that the commit
message should make explicit why the patch / test is added. Which this
doesn't do. It just says: "We add X", but not "Currently, the problem
is that YZ, thus we need X".
(also breaking longer commit messages into paragraphs is nice)

Also see my comments about interleaved submits below.

> >=20
> > Signed-off-by: Marco Pagani <marco.pagani@linux.dev>
> > ---
> > Changes in v1:
> > - Split the original suite into two test cases (Tvrtko Ursulin).
> > - General test refactoring and variable renaming for clarity.
> > - Changed parameters to have a fairer workload distribution.
> > - Improved cleanup logic.
> > - Added kunit_info() prints for tracing workers.
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/tests/tests_basic.c | 338 ++++++++++++=
++++++
> > =C2=A0 1 file changed, 338 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gp=
u/drm/scheduler/tests/tests_basic.c
> > index 82a41a456b0a..391edcbaf43a 100644
> > --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> > +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> > @@ -2,6 +2,8 @@
> > =C2=A0 /* Copyright (c) 2025 Valve Corporation */
> > =C2=A0=20
> > =C2=A0 #include <linux/delay.h>
> > +#include <linux/completion.h>
> > +#include <linux/workqueue.h>
> > =C2=A0=20
> > =C2=A0 #include "sched_tests.h"
> > =C2=A0=20
> > @@ -235,6 +237,341 @@ static void drm_sched_basic_cancel(struct kunit *=
test)
> > =C2=A0=C2=A0	KUNIT_ASSERT_EQ(test, job->hw_fence.error, -ECANCELED);
> > =C2=A0 }
> > =C2=A0=20
> > +struct sched_concurrent_context {
> > +	struct drm_mock_scheduler *sched;
> > +	struct workqueue_struct *sub_wq;
> > +	struct kunit *test;
> > +	struct completion wait_go;
> > +};
> > +
> > +KUNIT_DEFINE_ACTION_WRAPPER(drm_mock_sched_fini_wrap, drm_mock_sched_f=
ini,
> > +			=C2=A0=C2=A0=C2=A0 struct drm_mock_scheduler *);
> > +
> > +KUNIT_DEFINE_ACTION_WRAPPER(drm_mock_sched_entity_free_wrap, drm_mock_=
sched_entity_free,
> > +			=C2=A0=C2=A0=C2=A0 struct drm_mock_sched_entity *);
> > +
> > +static void complete_destroy_workqueue(void *context)
> > +{
> > +	struct sched_concurrent_context *ctx =3D (struct sched_concurrent_con=
text *)context;
> > +
> > +	complete_all(&ctx->wait_go);
> > +

nit: do we need that empty line

> > +	destroy_workqueue(ctx->sub_wq);
> > +}
> > +
> > +static int drm_sched_concurrent_init(struct kunit *test)
> > +{
> > +	struct sched_concurrent_context *ctx;
> > +	int ret;
> > +
> > +	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> > +	KUNIT_ASSERT_NOT_NULL(test, ctx);
> > +
> > +	init_completion(&ctx->wait_go);
> > +
> > +	ctx->sched =3D drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
> > +
> > +	ret =3D kunit_add_action_or_reset(test, drm_mock_sched_fini_wrap, ctx=
->sched);
> > +	KUNIT_ASSERT_EQ(test, ret, 0);
> > +
> > +	/* Use an unbounded workqueue to maximize job submission concurrency =
*/
> > +	ctx->sub_wq =3D alloc_workqueue("drm-sched-submitters-wq", WQ_UNBOUND=
,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WQ_UNBOUND_MAX_ACTIVE);
> > +	KUNIT_ASSERT_NOT_NULL(test, ctx->sub_wq);
> > +
> > +	ret =3D kunit_add_action_or_reset(test, complete_destroy_workqueue, c=
tx);
> > +	KUNIT_ASSERT_EQ(test, ret, 0);
> > +
> > +	ctx->test =3D test;
> > +	test->priv =3D ctx;
> > +
> > +	return 0;
> > +}
> > +
> > +struct drm_sched_parallel_params {
> > +	const char *description;
> > +	unsigned int num_jobs;
> > +	unsigned int num_workers;
> > +};
> > +
> > +static const struct drm_sched_parallel_params drm_sched_parallel_cases=
[] =3D {
> > +	{
> > +		.description =3D "Workers submitting multiple jobs against a single =
entity",
>=20
> Each worker has own entity so the description is a bit confusing.

Do you have a suggestion for a better one?

>=20
> > +		.num_jobs =3D 4,
> > +		.num_workers =3D 16,
> > +	},
> > +};
> > +
> > +static void
> > +drm_sched_parallel_desc(const struct drm_sched_parallel_params *params=
, char *desc)
> > +{
> > +	strscpy(desc, params->description, KUNIT_PARAM_DESC_SIZE);
> > +}
> > +
> > +KUNIT_ARRAY_PARAM(drm_sched_parallel, drm_sched_parallel_cases, drm_sc=
hed_parallel_desc);
> > +
> > +struct parallel_worker {
> > +	struct work_struct work;
> > +	struct sched_concurrent_context *ctx;
> > +	struct drm_mock_sched_entity *entity;
> > +	struct drm_mock_sched_job **jobs;
> > +	unsigned int id;
> > +};
> > +
> > +static void drm_sched_parallel_worker(struct work_struct *work)
> > +{
> > +	const struct drm_sched_parallel_params *params;
> > +	struct sched_concurrent_context *test_ctx;
> > +	struct parallel_worker *worker;
> > +	unsigned int i;
> > +
> > +	worker =3D container_of(work, struct parallel_worker, work);
> > +	test_ctx =3D worker->ctx;
> > +	params =3D test_ctx->test->param_value;
> > +
> > +	wait_for_completion(&test_ctx->wait_go);
> > +
> > +	kunit_info(test_ctx->test, "Parallel worker %u started\n", worker->id=
);
> > +
> > +	for (i =3D 0; i < params->num_jobs; i++)
> > +		drm_mock_sched_job_submit(worker->jobs[i]);
> > +}
> > +
> > +/*
> > + * Spawns workers that submit a sequence of jobs to the mock scheduler=
.
> > + * Once all jobs are submitted, the timeline is manually advanced.
> > + */
> > +static void drm_sched_parallel_submit_test(struct kunit *test)
> > +{
> > +	struct sched_concurrent_context *ctx =3D test->priv;
> > +	const struct drm_sched_parallel_params *params =3D test->param_value;
> > +	struct parallel_worker *workers;
> > +	unsigned int i, j, completed_jobs;
> > +	bool done;
> > +	int ret;
> > +
> > +	workers =3D kunit_kcalloc(test, params->num_workers, sizeof(*workers)=
,
> > +				GFP_KERNEL);
> > +	KUNIT_ASSERT_NOT_NULL(test, workers);
> > +
> > +	/*
> > +	 * Init workers only after all jobs and entities have been successful=
ly
> > +	 * allocated. In this way, the cleanup logic for when an assertion fa=
il
> > +	 * can be simplified.
> > +	 */
> > +	for (i =3D 0; i < params->num_workers; i++) {
> > +		workers[i].id =3D i;
> > +		workers[i].ctx =3D ctx;
> > +		workers[i].entity =3D drm_mock_sched_entity_new(test,
> > +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_NORMAL,
> > +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->sched);
> > +
> > +		ret =3D kunit_add_action_or_reset(test, drm_mock_sched_entity_free_w=
rap,
> > +						workers[i].entity);
> > +		KUNIT_ASSERT_EQ(test, ret, 0);
> > +
> > +		workers[i].jobs =3D kunit_kcalloc(test, params->num_jobs,
> > +						sizeof(*workers[i].jobs), GFP_KERNEL);
> > +		KUNIT_ASSERT_NOT_NULL(test, workers[i].jobs);
> > +
> > +		for (j =3D 0; j < params->num_jobs; j++)
> > +			workers[i].jobs[j] =3D drm_mock_sched_job_new(test,
> > +								=C2=A0=C2=A0=C2=A0 workers[i].entity);

The kernel doesn't strictly require the 80 column limit anymore. In
some cases it can make sense to exceed it a bit to avoid an ugly line
break.

Often one can make code a bit more readable by creating a helper
variable such as

struct xy *pos =3D &workers[i];

You need workers[i] at meany places, so that definitely seems handy.


> > +	}
> > +
> > +	for (i =3D 0; i < params->num_workers; i++) {
> > +		INIT_WORK(&workers[i].work, drm_sched_parallel_worker);
> > +		queue_work(ctx->sub_wq, &workers[i].work);
> > +	}
> > +
> > +	complete_all(&ctx->wait_go);
> > +	flush_workqueue(ctx->sub_wq);
> > +
> > +	for (i =3D 0; i < params->num_workers; i++) {
> > +		for (j =3D 0; j < params->num_jobs; j++) {
> > +			done =3D drm_mock_sched_job_wait_scheduled(workers[i].jobs[j],
> > +								 HZ);

same

> > +			KUNIT_ASSERT_TRUE(test, done);
> > +
> > +			done =3D drm_mock_sched_job_is_finished(workers[i].jobs[j]);
> > +			KUNIT_ASSERT_FALSE(test, done);
>=20
> This second assert does not seem to be bringing much value, but instead=
=20
> makes the reader ask themselves why it is there. Remove it?
>=20
> Hmm in fact this whole loop could be removed. All that it is needed=20
> below is to wait for the last job to be completed.

I suppose it's being tested whether all jobs are finished. That sounds
clean and not harmful to me.

>=20
> > +		}
> > +	}
> > +
> > +	completed_jobs =3D drm_mock_sched_advance(ctx->sched,
> > +						params->num_workers * params->num_jobs);
> > +	KUNIT_ASSERT_EQ(test, completed_jobs, params->num_workers * params->n=
um_jobs);

`params` doesn't change here anymore, so the lengthy multiplication
here, which is needed at two places, can be made a const at the top,
making the code more readable.

> > +
> > +	for (i =3D 0; i < params->num_workers; i++) {
> > +		for (j =3D 0; j < params->num_jobs; j++) {
> > +			done =3D drm_mock_sched_job_is_finished(workers[i].jobs[j]);
> > +			KUNIT_ASSERT_TRUE(test, done);
> > +		}
> > +	}
>=20
> So here, after advancing you just need to wait on the last job to complet=
e.
>=20
> Not a deal breaker to have it verbose but usually the less is better and=
=20
> easier to spot the key thing being tested and what are the functional ste=
ps.

depends a bit on what Marco intended. Looks like "better safe than
sorry" to me?

>=20
> > +}
> > +
> > +struct drm_sched_interleaved_params {
> > +	const char *description;
> > +	unsigned int job_base_period_us;
> > +	unsigned int periods_cycle;
> > +	unsigned int num_jobs;
> > +	unsigned int num_workers;
> > +};
> > +
> > +static const struct drm_sched_interleaved_params drm_sched_interleaved=
_cases[] =3D {
> > +	{
> > +		.description =3D "Workers submitting single jobs against a single en=
tity",
>=20
> As with the parallel description.

I think (see again my comment about the commit message) what the test
wants implement is threaded submission to a entity shared between
threads. That can certainly be made more verbose.

>=20
> > +		.job_base_period_us =3D 100,
> > +		.periods_cycle =3D 10,
> > +		.num_jobs =3D 1,
> > +		.num_workers =3D 32,
> > +	},
> > +	{
> > +		.description =3D "Workers submitting multiple jobs against a single =
entity",
> > +		.job_base_period_us =3D 100,
> > +		.periods_cycle =3D 10,
> > +		.num_jobs =3D 4,
> > +		.num_workers =3D 16,
> > +	},
> > +};
> > +
> > +static void
> > +drm_sched_interleaved_desc(const struct drm_sched_interleaved_params *=
params, char *desc)
> > +{
> > +	strscpy(desc, params->description, KUNIT_PARAM_DESC_SIZE);
> > +}
> > +
> > +KUNIT_ARRAY_PARAM(drm_sched_interleaved, drm_sched_interleaved_cases,
> > +		=C2=A0 drm_sched_interleaved_desc);
> > +
> > +struct interleaved_worker {
> > +	struct work_struct work;
> > +	struct sched_concurrent_context *ctx;
> > +	struct drm_mock_sched_entity *entity;
> > +	struct drm_mock_sched_job **jobs;
> > +	unsigned int id;
> > +	unsigned int period_us;
> > +	unsigned int timeout_us;
> > +};
> > +
> > +static void drm_sched_interleaved_worker(struct work_struct *work)
> > +{
> > +	const struct drm_sched_interleaved_params *params;
> > +	struct sched_concurrent_context *test_ctx;
> > +	struct interleaved_worker *worker;
> > +	unsigned int i;
> > +	bool done;
> > +
> > +	worker =3D container_of(work, struct interleaved_worker, work);
> > +	test_ctx =3D worker->ctx;
> > +	params =3D test_ctx->test->param_value;
> > +
> > +	wait_for_completion(&test_ctx->wait_go);
> > +
> > +	kunit_info(test_ctx->test, "Interleaved worker %u with period %u us s=
tarted\n",
> > +		=C2=A0=C2=A0 worker->id, worker->period_us);
> > +
> > +	/* Release jobs as a periodic sequence */
> > +	for (i =3D 0; i < params->num_jobs; i++) {
> > +		drm_mock_sched_job_set_duration_us(worker->jobs[i], worker->period_u=
s);
> > +		drm_mock_sched_job_submit(worker->jobs[i]);
> > +
> > +		done =3D drm_mock_sched_job_wait_finished(worker->jobs[i],

worker->jobs[i] is used at 3 places and can be made a helper variable.

> > +							usecs_to_jiffies(worker->timeout_us));
> > +		if (!done)
> > +			kunit_info(test_ctx->test, "Job %u of worker %u timedout\n",
> > +				=C2=A0=C2=A0 i, worker->id);
> > +	}
> > +}
> > +
> > +/*
> > + * Spawns workers that submit a periodic sequence of jobs to the mock =
scheduler.
> > + * Uses harmonic periods to allow interleaving and cycles through them=
 to prevent
> > + * excessively large execution times.
> >=20

What are "large execution times", like too large for the test
framework?

> >  Since the scheduler serializes jobs from all
> > + * workers, the timeout is set to the hyperperiod with a 2x safety fac=
tor. Entities
> > + * and jobs are pre-allocated in the main thread to avoid using KUnit =
assertions in
> > + * the workers.
> > + */
> > +static void drm_sched_interleaved_submit_test(struct kunit *test)

It appears to me that this is effectively a separate test, which might
want its own patch. What is the motivation behind adding it?

> > +{
> > +	struct sched_concurrent_context *ctx =3D test->priv;
> > +	const struct drm_sched_interleaved_params *params =3D test->param_val=
ue;
> > +	struct interleaved_worker *workers;
> > +	unsigned int period_max_us, timeout_us;
> > +	unsigned int i, j;
> > +	bool done;
> > +	int ret;
> > +
> > +	workers =3D kunit_kcalloc(test, params->num_workers, sizeof(*workers)=
,
> > +				GFP_KERNEL);
> > +	KUNIT_ASSERT_NOT_NULL(test, workers);
> > +
> > +	period_max_us =3D params->job_base_period_us * (1 << params->periods_=
cycle);
> > +	timeout_us =3D params->num_workers * period_max_us * 2;
> > +
> > +	/*
> > +	 * Init workers only after all jobs and entities have been successful=
ly
> > +	 * allocated. In this way, the cleanup logic for when an assertion fa=
il
> > +	 * can be simplified.
> > +	 */
> > +	for (i =3D 0; i < params->num_workers; i++) {
> > +		workers[i].id =3D i;
> > +		workers[i].ctx =3D ctx;
> > +		workers[i].timeout_us =3D timeout_us;

helper variable for workers[i].


P.


> > +
> > +		if (i % params->periods_cycle =3D=3D 0)
> > +			workers[i].period_us =3D params->job_base_period_us;
> > +		else
> > +			workers[i].period_us =3D workers[i - 1].period_us * 2;
>=20
> Are the two if statements effectively equivalent to:
>=20
> =C2=A0 period_us =3D params->job_base_period_us << (i % params->periods_c=
ycle);
>=20
> ?
>=20
> Also, do you have an idea how to locally calculate a suitable=20
> periods_cycle instead of having to come up with a number in the=20
> drm_sched_interleaved_params array. Just strikes me as hard to know what=
=20
> to put in there if someone would want to add a test.
>=20
> > +
> > +		workers[i].entity =3D drm_mock_sched_entity_new(test,
> > +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_NORMAL,
> > +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->sched);
> > +
> > +		ret =3D kunit_add_action_or_reset(test, drm_mock_sched_entity_free_w=
rap,
> > +						workers[i].entity);
> > +		KUNIT_ASSERT_EQ(test, ret, 0);
> > +
> > +		workers[i].jobs =3D kunit_kcalloc(test, params->num_jobs,
> > +						sizeof(*workers[i].jobs), GFP_KERNEL);
> > +		KUNIT_ASSERT_NOT_NULL(test, workers[i].jobs);
> > +
> > +		for (j =3D 0; j < params->num_jobs; j++) {
> > +			workers[i].jobs[j] =3D drm_mock_sched_job_new(test,
> > +								=C2=A0=C2=A0=C2=A0 workers[i].entity);
> > +			done =3D drm_mock_sched_job_is_finished(workers[i].jobs[j]);
> > +			KUNIT_ASSERT_FALSE(test, done);
>=20
> Same as above, this is asserted by a basic test case so I'd just remove i=
t.
>=20
> > +		}
> > +	}
> > +
> > +	for (i =3D 0; i < params->num_workers; i++) {
> > +		INIT_WORK(&workers[i].work, drm_sched_interleaved_worker);
> > +		queue_work(ctx->sub_wq, &workers[i].work);
> > +	}
> > +
> > +	complete_all(&ctx->wait_go);
> > +	flush_workqueue(ctx->sub_wq);
> > +
> > +	for (i =3D 0; i < params->num_workers; i++) {
> > +		for (j =3D 0; j < params->num_jobs; j++) {
> > +			done =3D drm_mock_sched_job_is_finished(workers[i].jobs[j]);
> > +			KUNIT_ASSERT_TRUE(test, done);
> > +		}
> > +	}
>=20
> Here as well you could wait just for the last job per worker.
>=20
> On the overal submission pattern - Don't you end up with a very uneven=
=20
> activity between the workers? Because the job duration is doubling and=
=20
> workers are single-shot, once the low index workers are done they are
> done, and all that remains are the higher ones, and so the wave of fewer=
=20
> and fewer active workers continues. Low index worker do not end up=20
> racing with the job completions of the high index workers but only=20
> between themselves, and even that with the cycle=3D10 workers=3D16 case i=
s=20
> even more limited.
>=20
> Alternative approach could be to set a per test time budget and just=20
> keep the workers submitting until over. It would be simpler to=20
> understand and there would be more submit/complete overlap.
>=20
> Regards,
>=20
> Tvrtko
>=20
> > +}
> > +
> > +static struct kunit_case drm_sched_concurrent_tests[] =3D {
> > +	KUNIT_CASE_PARAM(drm_sched_parallel_submit_test, drm_sched_parallel_g=
en_params),
> > +	KUNIT_CASE_PARAM(drm_sched_interleaved_submit_test, drm_sched_interle=
aved_gen_params),
> > +	{}
> > +};
> > +
> > +static struct kunit_suite drm_sched_concurrent =3D {
> > +	.name =3D "drm_sched_concurrent_tests",
> > +	.init =3D drm_sched_concurrent_init,
> > +	.test_cases =3D drm_sched_concurrent_tests,
> > +};
> > +
> > =C2=A0 static struct kunit_case drm_sched_cancel_tests[] =3D {
> > =C2=A0=C2=A0	KUNIT_CASE(drm_sched_basic_cancel),
> > =C2=A0=C2=A0	{}
> > @@ -556,6 +893,7 @@ static struct kunit_suite drm_sched_credits =3D {
> > =C2=A0 };
> > =C2=A0=20
> > =C2=A0 kunit_test_suites(&drm_sched_basic,
> > +		=C2=A0 &drm_sched_concurrent,
> > =C2=A0=C2=A0		=C2=A0 &drm_sched_timeout,
> > =C2=A0=C2=A0		=C2=A0 &drm_sched_cancel,
> > =C2=A0=C2=A0		=C2=A0 &drm_sched_priority,
>=20

