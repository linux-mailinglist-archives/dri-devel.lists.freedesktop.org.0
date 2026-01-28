Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA9qL482eml+4gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 17:17:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B2FA561E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 17:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842D710E2CF;
	Wed, 28 Jan 2026 16:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="A0o0F4R9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C2710E2CF
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 16:17:14 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4f1S8j5q5nz9tKs;
 Wed, 28 Jan 2026 17:17:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1769617029; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CSo596uqBiOiCySpIY/QudAnnVaLDbLMxOzpWC62Rcs=;
 b=A0o0F4R96a3fKTZSFrGP5gg6Ad281maFJFtl3yHkgeips03Rqr7U5AodP4gusU+y3ETmP3
 NMIai4po+kiZW80x9VpMMMofuXQAXkn2qBFNT+4WwrMYeXaW6zS9B0klFr6yv4eRa01PW3
 ObgOApVecBaLW3x4OEwiWnY/rP/ykVy0fUJ5c7Cz8BYBkfN3ImKODJ21PLvRv/OcY2vzCl
 e/iUd8uWQY89OtgEaTch0rDmwQcauR5kxO81VlAwL5pq9gTvIvMj+g7mFP8fYMWBcFDkG2
 B6TTTvIdY8QatRZjDDJMKRKR5bedLkIbXt1sHzpz5pByOFckYM652eZc/70haA==
Message-ID: <3cdc7fda0ee4c777d7e20504503522844f0124ea.camel@mailbox.org>
Subject: Re: [RFC PATCH] drm/sched: Add new KUnit test suite for concurrent
 job submission
From: Philipp Stanner <phasta@mailbox.org>
To: Marco Pagani <marco.pagani@linux.dev>, tursulin@ursulin.net
Cc: airlied@gmail.com, ckoenig.leichtzumerken@gmail.com, dakr@kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, marpagan@redhat.com,
 matthew.brost@intel.com,  mripard@kernel.org, phasta@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
Date: Wed, 28 Jan 2026 17:17:02 +0100
In-Reply-To: <90cdb121-7ff2-43a5-9327-2898b5e65609@linux.dev>
References: <79cf2013-da6b-4653-aaa8-3e29a7d1ee3a@ursulin.net>
 <90cdb121-7ff2-43a5-9327-2898b5e65609@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 8cdac362e0f64ce7025
X-MBO-RS-META: fzb5hb6g76h8415x1wmumqbxr99s7gnb
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marco.pagani@linux.dev,m:tursulin@ursulin.net,m:airlied@gmail.com,m:ckoenig.leichtzumerken@gmail.com,m:dakr@kernel.org,m:linux-kernel@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:marpagan@redhat.com,m:matthew.brost@intel.com,m:mripard@kernel.org,m:phasta@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.freedesktop.org,vger.kernel.org,linux.intel.com,redhat.com,intel.com,ffwll.ch,suse.de];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: 14B2FA561E
X-Rspamd-Action: no action

On Wed, 2026-01-28 at 12:39 +0100, Marco Pagani wrote:
>=20
> On 22/01/2026 10:51, Tvrtko Ursulin wrote:
> >=20
> > On 20/01/2026 20:52, Marco Pagani wrote:
> > > Add a new test suite to simulate concurrent job submissions from user=
space.
> > > The suite includes a basic test case where each worker submits a sing=
le
> > > job, and a more advanced case involving the submission of multiple jo=
bs.
> >=20
> > New test coverage is welcome!
>=20
> Hi Tvrtko, Philip, and thank you.
>=20
> > But as Philipp has said some more context would be beneficial. Like are=
=20
> > you trying to hit a bug, or extend later with something which will hit =
a=20
> > bug and then you will propose improvements? Or simply improving the
> > coverage?
>=20
> Sure, I'll extend the commit message to be more descriptive in the next
> version.
> =C2=A0
> > If it is about some race I would maybe consider putting this into a new=
=20
> > tests_races.c. I actually have this file locally and some unfinished=
=20
> > test cases already, although it is unclear when I will be happy with=
=20
> > them to post. But if the test is simply about adding coverage it is fin=
e=20
> > to live in tests_basic.c.
>=20
> The general idea is to extend the suite with some initial tests that stre=
ss
> concurrency to spot race conditions. Having these initial tests grouped t=
ogether
> with future ones in a new tests_races.c file makes perfect sense to me.


I am not so convinced of a separate file.

All the drm_sched tests are there to ensure the soundness and
robustness of the scheduler. How is a race special? What would
tests_basic.c be for =E2=80=93 checking for bugs that are not races? And
races.c would be full of tests that are threaded?
(questions more directed at Tvrtko)

From my POV having this little test in tests_basic.c is perfectly fine.
Having multiple entities per scheduler, associated with multiple task,
*is* basic functionality of the scheduler.


>=20
> > > Signed-off-by: Marco Pagani <marpagan@redhat.com>
> > > ---
> > > =C2=A0 drivers/gpu/drm/scheduler/tests/tests_basic.c | 175 ++++++++++=
++++++++
> > > =C2=A0 1 file changed, 175 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/=
gpu/drm/scheduler/tests/tests_basic.c
> > > index 82a41a456b0a..7c25bcbbe7c9 100644
> > > --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> > > +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> > > @@ -2,6 +2,7 @@
> > > =C2=A0 /* Copyright (c) 2025 Valve Corporation */
> > > =C2=A0=20
> > > =C2=A0 #include <linux/delay.h>
> > > +#include <linux/completion.h>
> > > =C2=A0=20
> > > =C2=A0 #include "sched_tests.h"
> > > =C2=A0=20
> > > @@ -235,6 +236,179 @@ static void drm_sched_basic_cancel(struct kunit=
 *test)
> > > =C2=A0=C2=A0	KUNIT_ASSERT_EQ(test, job->hw_fence.error, -ECANCELED);
> > > =C2=A0 }
> > > =C2=A0=20
> > > +struct sched_concurrent_test_context {
> > > +	struct drm_mock_scheduler *sched;
> > > +	struct workqueue_struct *sub_wq;
> > > +	struct completion wait_go;
> > > +};
> > > +
> > > +KUNIT_DEFINE_ACTION_WRAPPER(destroy_workqueue_wrap, destroy_workqueu=
e,
> > > +			=C2=A0=C2=A0=C2=A0 struct workqueue_struct *);
> > > +
> > > +KUNIT_DEFINE_ACTION_WRAPPER(drm_mock_sched_fini_wrap, drm_mock_sched=
_fini,
> > > +			=C2=A0=C2=A0=C2=A0 struct drm_mock_scheduler *);
> > > +
> > > +KUNIT_DEFINE_ACTION_WRAPPER(drm_mock_sched_entity_free_wrap, drm_moc=
k_sched_entity_free,
> > > +			=C2=A0=C2=A0=C2=A0 struct drm_mock_sched_entity *);
> > > +
> > > +static int drm_sched_concurrent_init(struct kunit *test)
> > > +{
> > > +	struct sched_concurrent_test_context *ctx;
> > > +	int ret;
> > > +
> > > +	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> > > +
> > > +	init_completion(&ctx->wait_go);
> > > +
> > > +	ctx->sched =3D drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
> > > +
> > > +	ret =3D kunit_add_action_or_reset(test, drm_mock_sched_fini_wrap, c=
tx->sched);
> > > +	KUNIT_ASSERT_EQ(test, ret, 0);
> > > +
> > > +	/* Use an unbounded workqueue to maximize job submission concurrenc=
y */
> > > +	ctx->sub_wq =3D alloc_workqueue("drm-sched-submitters-wq", WQ_UNBOU=
ND,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WQ_UNBOUND_MAX_ACTIVE);
> > > +	KUNIT_ASSERT_NOT_NULL(test, ctx->sub_wq);
> > > +
> > > +	ret =3D kunit_add_action_or_reset(test, destroy_workqueue_wrap, ctx=
->sub_wq);
> > > +	KUNIT_ASSERT_EQ(test, ret, 0);
> > > +
> > > +	test->priv =3D ctx;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +struct drm_sched_concurrent_params {
> > > +	const char *description;
> > > +	unsigned int job_base_us;
> > > +	unsigned int num_jobs;
> > > +	unsigned int num_subs;
> > > +};
> > > +
> > > +static const struct drm_sched_concurrent_params drm_sched_concurrent=
_cases[] =3D {
> > > +	{
> > > +		.description =3D "Concurrently submit a single job in a single ent=
ity",
> > > +		.job_base_us =3D 1000,
> > > +		.num_jobs =3D 1,
> > > +		.num_subs =3D 32,
> > > +	},
> >=20
> > Why is submission from a single thread interesting if it is already cov=
ered?
>=20
> These two initial parameter sets cover only concurrent submission:
> multiple submitters, single job / multiple submitters, multiple jobs.
>=20
> > > +	{
> > > +		.description =3D "Concurrently submit multiple jobs in a single en=
tity",
> > > +		.job_base_us =3D 1000,
> > > +		.num_jobs =3D 10,
> > > +		.num_subs =3D 64,
> > > +	},
> > > +};
> > > +
> > > +static void
> > > +drm_sched_concurrent_desc(const struct drm_sched_concurrent_params *=
params, char *desc)
> > > +{
> > > +	strscpy(desc, params->description, KUNIT_PARAM_DESC_SIZE);
> > > +}
> > > +
> > > +KUNIT_ARRAY_PARAM(drm_sched_concurrent, drm_sched_concurrent_cases, =
drm_sched_concurrent_desc);
> > > +
> > > +struct submitter_data {
> > > +	struct work_struct work;
> > > +	struct sched_concurrent_test_context *ctx;
> > > +	struct drm_mock_sched_entity *entity;
> > > +	struct drm_mock_sched_job **jobs;
> > > +	struct kunit *test;
> > > +	unsigned int id;
> > > +	bool timedout;
> > > +};
> > > +
> > > +static void drm_sched_submitter_worker(struct work_struct *work)
> > > +{
> > > +	const struct drm_sched_concurrent_params *params;
> > > +	struct sched_concurrent_test_context *ctx;
> > > +	struct submitter_data *sub_data;
> > > +	unsigned int i, duration_us;
> > > +	unsigned long timeout_jiffies;
> > > +	bool done;
> > > +
> > > +	sub_data =3D container_of(work, struct submitter_data, work);
> > > +	ctx =3D sub_data->ctx;
> > > +	params =3D sub_data->test->param_value;
> > > +
> > > +	wait_for_completion(&ctx->wait_go);
> > > +
> > > +	for (i =3D 0; i < params->num_jobs; i++) {
> > > +		duration_us =3D params->job_base_us + (sub_data->id * 10);
> >=20
> > Why is job duration dependent by the submitter id?
>=20
> Just a simple way to have a deterministic distribution of durations.
> I can change it if it doesn't fit.
>=20
> > Would it be feasiable to not use auto-completing jobs and instead=20
> > advance the timeline manually? Given how the premise of the test seems=
=20
> > to be about concurrent submission it sounds plausible that what happens=
=20
> > after submission maybe isn't very relevant.
>=20
> Good idea! I'll run some experiments and see if it works.
>=20
> > > +		drm_mock_sched_job_set_duration_us(sub_data->jobs[i], duration_us)=
;
> > > +		drm_mock_sched_job_submit(sub_data->jobs[i]);
> >=20
> > On a related note, one interesting thing to add coverage for later is=
=20
> > multi-threaded submit of multiple jobs against a single entity. But it=
=20
> > is not an immediate need. Just mentioning it as something interesting.
>=20
> Currently, the test configures each submitter to submit multiple jobs
> against its own dedicated entity. I considered adding a test case for
> submitting multiple jobs against multiple entities, but I decided to
> leave it for the future.
>=20
> > It would mean open coding drm_mock_sched_job_submit() as=20
> > drm_sched_job_arm() and drm_sched_entity_push_job() and sticking some=
=20
> > delay in between so two threads have the chance to interleave. Mock
> > scheduler does not handle it today, neither does the scheduler itself=
=20
> > who punts responsibility to callers. So adding a test and making the=
=20
> > mock scheduler handle that properly would serve as an example on how=
=20
> > scheduler must be used. Or what can go bad if it isn't.
>=20
> Do you mean having multiple (k)threads submitting against the same entity=
?
> Would that be used to model a multithread application that uses multiple =
queues?

Submitters to entities must always ensure their own synchronization
before pushing to it. And afterwards it's the scheduler's parallelism
that counts.
I don't see how multiple threads on an entity are worthwhile testing.
It's beyond our scope.


Thx.
P.


>=20
> > > +	}
> > > +
> > > +	timeout_jiffies =3D usecs_to_jiffies(params->job_base_us * params->=
num_subs *
> > > +					=C2=A0=C2=A0 params->num_jobs * 10);
> >=20
> > The timeout calculation could use a comment. You are using num_subs * 1=
0=20
> > to match the duratiot_us above being id * 10? With logic of calculating=
=20
> > a pessimistic timeout?
> >=20
> > Have you tried it with qemu to check if it is pessimistic enough?
>=20
> I'll double check on that.
> =C2=A0
> > > +	for (i =3D 0; i < params->num_jobs; i++) {
> > > +		done =3D drm_mock_sched_job_wait_finished(sub_data->jobs[i],
> > > +							timeout_jiffies);
> > > +		if (!done)
> > > +			sub_data->timedout =3D true;
> > > +	}
> >=20
> > Technically you only need to wait on the last job but it is passable=
=20
> > like this too.
> >=20
> > Also, is it important for the worker to wait for completion or the main=
=20
> > thread could simply wait for everything? Maybe that would simplify thin=
gs.
>=20
> I would say they serve different purposes. The completion is used to paus=
e
> all worker threads until they are all created to ensure they start submit=
ting
> jobs together to maximize concurrency.
> =C2=A0
> > Manual timeline advance and this combined would mean the workers only=
=20
> > submit jobs, while the main thread simply does=20
> > drm_mock_sched_advance(sched, num_subs * num_jobs) and waits for last=
=20
> > job from each submitter to finish.
> >=20
> > Again, auto-completion and timeout reporting is something I do not=20
> > immediate see is relevant for multi-threaded submission testing.
> >=20
> > Maybe if you want to test the mock scheduler itself it could be, but=
=20
> > then I would add it as separate entry in drm_sched_concurrent_cases[].=
=20
> > Like maybe have a flag/boolean "auto-complete jobs". So one without and=
=20
> > one with that set.
>=20
> I think it's a good idea and I'll experiment to see if it works.
> =C2=A0
> > Other than that it looks tidy and was easy to follow. Only thing which=
=20
> > slightly got me was the term "subs" since I don't intuitively associate=
=20
> > it with a submitter but, well, a sub entity of some kind. Might be wort=
h=20
> > renaming that to submitter(s), or even dropping the prefix in some case=
s=20
> > might be feasible (like sub(s)_data).
>=20
> Agreed. I'll rename "subs" for better clarity.
>=20
> > Regards,
> >=20
> > Tvrtko
> >=20
>=20
> Cheers,
> Marco

