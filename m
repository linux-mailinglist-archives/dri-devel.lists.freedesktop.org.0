Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B26C14FF9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 14:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADC410E3FC;
	Tue, 28 Oct 2025 13:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NDdLExho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1A510E3FB;
 Tue, 28 Oct 2025 13:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761659813; x=1793195813;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dDVVR8SYyoolEVQoZTXi8NUZUymEyiYHzmsYx/kAFis=;
 b=NDdLExhouQvRocAH0AimCHsVGRPi9mTRSPllgdeYZ09crxVmjXk1W33F
 IxwX88kkNtIxzToXInMWlUp9uF8vVLiroZcktFdiWlGncbkxd17Bb66Uq
 3S0V6rxYst7pem7rHu5LUAlCLgI/Eyc7y1Ku0E5aOa28JH/mh3LDpo8S2
 NqjMD0h9X149ZO/MldQUqboKl5zbFvBZiOdMkeFE0IFzb7RLEi/SEqq/R
 n6KMfla4NGB4P5kjANdJFnUvdnGGXvem+MhbZlmPYdIrZOsaroBVzU39Y
 DVLBD2QfpEtocwpn8Kv4guF309HRLEJQnz3lBBaMxAswzQkOoXSHGvfAV Q==;
X-CSE-ConnectionGUID: lL58ouHzRC2axIzrTWT9wg==
X-CSE-MsgGUID: slxGPACxSgSSNgyFsGLHxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63908526"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63908526"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 06:56:53 -0700
X-CSE-ConnectionGUID: YpCa3ZVMRhWUYdp1/KerpA==
X-CSE-MsgGUID: rJayKFrUTz2cZa1r7W1yhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189406379"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.100])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 06:56:51 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH i-g-t v3] tests/syncobj_timeline: Exercise signaling of
 awaited points
Date: Tue, 28 Oct 2025 14:56:47 +0100
Message-ID: <1838875.VLH7GnMWUR@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <091ded65-cfac-4215-a6aa-a8d7c0fe05af@amd.com>
References: <20251007152315.3403250-2-janusz.krzysztofik@linux.intel.com>
 <091ded65-cfac-4215-a6aa-a8d7c0fe05af@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

On Tuesday, 7 October 2025 17:40:27 CET Christian K=C3=B6nig wrote:
> On 07.10.25 17:14, Janusz Krzysztofik wrote:
> > CI reports kernel soft lockups when running a wait_backward test case of
> > igt@dmabuf@all-tests@dma_fence_chain selftest on less powerful machines.
> > A kernel fix has been developed that has proven to resolve the issue, b=
ut
> > it hasn't been accepted upstream, with a recommendation for dropping th=
at
> > test case as a "nonsense"[1].
> >=20
> > Before we decide to take that path, try to implement the problematic te=
st
> > case in user space as an IGT subtest.  Since no kernel uAPIs have been
> > found that allow strict reimplementation of exact algorithm of the
> > problematic test case, where every link of a dma-fence chain is signaled
> > one by one from a loop running in kernel space, provide two approximate
> > variants, one that signals each fence with an individual system call, a=
nd
> > one that depends on vgem fences being signaled automatically on their
> > consecutive expiry under presumably the same schedule as they were
> > created.
>=20
> VGEM is not much better than sw_sync. You would need to reproduce the iss=
ue=20
an real HW to actually have some issue here.

Reproducing the issue (soft lockups) is not my goal.  My goal is to *avoid*=
=20
those soft lockups while preserving the scope of conformance testing.  If t=
hat=20
can't be achieved by making the scenario of the failing selftest *more=20
realistic* via inserting cond_resched() into the loop, and that test case=20
*must be dropped* from the selftest for that reason, then I'm just trying t=
o=20
re-implement the scenario in user space, as close as possible to the origin=
al=20
one which also didn't use a real HW.

> Signaling fences in reverse is just a completely unrealistic use case.

That's a corner case of random ordering, then possible in real use cases, I=
=20
believe, and it still should be covered with conformance testing.

Either we take this path, or we get back to a discussion on how to avoid so=
ft=20
lockups in the selftest, other than disarming the test case by dropping ste=
ps=20
that contribute to those soft lockups while still being legitimate, even if=
=20
not very typical.

Thanks,
Janusz


>=20
> Regards,
> Christian.
>=20
> >=20
> > For more comprehensive testing, also implement the _forward and _random
> > scenarios from the original selftest, as well as simplified variants th=
at
> > don't enable signaling on each link of the dma-fence chain.
> >=20
> > v3: Skip if CPU is not powerful enough for setting up all timeline poin=
ts
> >     before vgem fences start to expire,
> >   - also skip if CPU is not powerful enough to signal all vgem fences
> >     before they start to expire automatically when signaling manually,
> >   - fail autoexpire variants if vgem fences don't start to expire in 10=
s,
> >   - wait virtually infinitely for last timeline point being signaled, l=
et
> >     igt_runner unlikely kill the test and report timeout if per test
> >     timeout expires first.
> > v2: Fix incorrectly calculated backward ordering of syncobj points,
> >   - replace problematic sw_sync timeline points with vgem object fences,
> >   - drop wait-all subtest variants, those add no value over enable-all,
> >   - to simplify the code, enable signaling of each point, if requested,
> >     right after it is added to the syncobj timeline.
> >=20
> > [1] https://lore.kernel.org/dri-devel/20250814094824.217142-6-janusz.kr=
zysztofik@linux.intel.com/
> >=20
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> >  tests/syncobj_timeline.c | 287 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 287 insertions(+)
> >=20
> > diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
> > index a77896ec1d..7c17c2eacd 100644
> > --- a/tests/syncobj_timeline.c
> > +++ b/tests/syncobj_timeline.c
> > @@ -27,9 +27,14 @@
> >  #include <unistd.h>
> >  #include <time.h>
> >  #include <sys/ioctl.h>
> > +#include <sys/param.h>
> >  #include <pthread.h>
> >  #include <signal.h>
> > +
> > +#include "dmabuf_sync_file.h"
> >  #include "drm.h"
> > +#include "igt_vgem.h"
> > +
> >  /**
> >   * TEST: syncobj timeline
> >   * Description: Tests for the drm timeline sync object API
> > @@ -427,6 +432,42 @@
> >   *
> >   * SUBTEST: wait-zero-handles
> >   * Description: Verifies that waiting on an empty list of syncobj hand=
les=20
is accepted
> > + *
> > + * SUBTEST: stress-wait-last-signal-forward
> > + * Description: Signals each fence of a large timeline while another=20
thread is waiting on that timeline
> > + *
> > + * SUBTEST: stress-wait-last-signal-backward
> > + * Description: Signals each fence of a large timeline in reverse orde=
r=20
while another thread is waiting on that timeline
> > + *
> > + * SUBTEST: stress-wait-last-signal-random
> > + * Description: Signals each fence of a large timeline in random order=
=20
while another thread is waiting on that timeline
> > + *
> > + * SUBTEST: stress-wait-last-signal-all-forward
> > + * Description: Signals all fences of a large timeline while another=20
thread is waiting on that timeline
> > + *
> > + * SUBTEST: stress-wait-last-signal-all-backward
> > + * Description: Signals all fences of a large reverse ordered timeline=
=20
while another thread is waiting on that timeline
> > + *
> > + * SUBTEST: stress-wait-last-signal-all-random
> > + * Description: Signals all fences of a large randomly ordered timelin=
e=20
while another thread is waiting on that timeline
> > + *
> > + * SUBTEST: stress-enable-all-signal-forward
> > + * Description: Signals each fence of a large timeline with signaling=
=20
enabled on each point while another thread is waiting on that timeline
> > + *
> > + * SUBTEST: stress-enable-all-signal-backward
> > + * Description: Signals each fence of a large timeline in reversed ord=
er=20
with signaling enabled on each point while another thread is waiting on tha=
t=20
timeline
> > + *
> > + * SUBTEST: stress-enable-all-signal-random
> > + * Description: Signals each fence of a large timeline in random order=
=20
with signaling enabled on each point while another thread is waiting on tha=
t=20
timeline
> > + *
> > + * SUBTEST: stress-enable-all-signal-all-forward
> > + * Description: Signals all fences of a large timeline with signaling=
=20
enabled on each point while another thread is waiting on that timeline
> > + *
> > + * SUBTEST: stress-enable-all-signal-all-backward
> > + * Description: Signals all fences of a large reversed ordered timelin=
e=20
with signaling enabled on each point while another thread is waiting on tha=
t=20
timeline
> > + *
> > + * SUBTEST: stress-enable-all-signal-all-random
> > + * Description: Signals all fences of a large randomly ordered timelin=
e=20
with signaling enabled on each point while another thread is waiting on tha=
t=20
timeline
> >   */
> > =20
> >  IGT_TEST_DESCRIPTION("Tests for the drm timeline sync object API");
> > @@ -1675,6 +1716,236 @@ test_32bits_limit(int fd)
> >  	close(timeline);
> >  }
> > =20
> > +#define STRESS_FLAGS_ENABLE_ALL		(0x1 << 0)
> > +#define STRESS_FLAGS_SIGNAL_ALL		(STRESS_FLAGS_ENABLE_ALL <<=20
1)
> > +#define STRESS_FLAGS_SIGNAL_BACKWARD	(STRESS_FLAGS_SIGNAL_ALL <<=20
1)
> > +#define STRESS_FLAGS_SIGNAL_RANDOM	(STRESS_FLAGS_SIGNAL_BACKWARD << 1)
> > +
> > +const char *stress_descriptions[] =3D {
> > +	/* stress-wait-last-signal-forward */
> > +	[0] =3D
> > +		"Signals each fence of a large timeline while another=20
thread is waiting on that timeline",
> > +	/* stress-wait-last-signal-backward */
> > +	[STRESS_FLAGS_SIGNAL_BACKWARD] =3D
> > +		"Signals each fence of a large timeline in reverse order=20
while another thread is waiting on that timeline",
> > +	/* stress-wait-last-signal-random */
> > +	[STRESS_FLAGS_SIGNAL_RANDOM] =3D
> > +		"Signals each fence of a large timeline in random order=20
while another thread is waiting on that timeline",
> > +	/* stress-wait-last-signal-all-forward */
> > +	[STRESS_FLAGS_SIGNAL_ALL] =3D
> > +		"Signals all fences of a large timeline while another=20
thread is waiting on that timeline",
> > +	/* stress-wait-last-signal-all-backward */
> > +	[STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =3D
> > +		"Signals all fences of a large reverse ordered timeline=20
while another thread is waiting on that timeline",
> > +	/* stress-wait-last-signal-all-random */
> > +	[STRESS_FLAGS_SIGNAL_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =3D
> > +		"Signals all fences of a large randomly ordered timeline=20
while another thread is waiting on that timeline",
> > +	/* stress-enable-all-signal-forward */
> > +	[STRESS_FLAGS_ENABLE_ALL] =3D
> > +		"Signals each fence of a large timeline with signaling=20
enabled on each point while another thread is waiting on that timeline",
> > +	/* stress-enable-all-signal-backward */
> > +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_BACKWARD] =3D
> > +		"Signals each fence of a large timeline in reversed order=20
with signaling enabled on each point while another thread is waiting on tha=
t=20
timeline",
> > +	/* stress-enable-all-signal-random */
> > +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_RANDOM] =3D
> > +		"Signals each fence of a large timeline in random order=20
with signaling enabled on each point while another thread is waiting on tha=
t=20
timeline",
> > +	/* stress-enable-all-signal-all-forward */
> > +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_ALL] =3D
> > +		"Signals all fences of a large timeline with signaling=20
enabled on each point while another thread is waiting on that timeline",
> > +	/* stress-enable-all-signal-all-backward */
> > +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_ALL |=20
STRESS_FLAGS_SIGNAL_BACKWARD] =3D
> > +		"Signals all fences of a large reversed ordered timeline=20
with signaling enabled on each point while another thread is waiting on tha=
t=20
timeline",
> > +	/* stress-enable-all-signal-all-random */
> > +	[STRESS_FLAGS_ENABLE_ALL | STRESS_FLAGS_SIGNAL_ALL |=20
STRESS_FLAGS_SIGNAL_RANDOM] =3D
> > +		"Signals all fences of a large randomly ordered timeline=20
with signaling enabled on each point while another thread is waiting on tha=
t=20
timeline",
> > +};
> > +
> > +#define TL_LENGTH 4096
> > +
> > +struct stress_timeline {
> > +	int fd;
> > +	int vgem;
> > +	int dmabuf;
> > +	int sync_file;
> > +	uint32_t syncobj;
> > +	uint32_t tmp_syncobj;
> > +	struct vgem_bo *vgem_bos;
> > +	uint32_t *vgem_fences;
> > +	uint64_t *order;
> > +	uint64_t length;
> > +	unsigned int flags;
> > +};
> > +
> > +static void stress_init(int fd, struct stress_timeline **timeline,=20
unsigned int flags)
> > +{
> > +	struct stress_timeline *tl;
> > +	int i, err =3D -ETIME;
> > +	uint64_t point;
> > +
> > +	tl =3D calloc(TL_LENGTH, sizeof(*tl));
> > +	igt_assert(tl);
> > +	*timeline =3D tl;
> > +
> > +	tl->fd =3D fd;
> > +	tl->length =3D TL_LENGTH;
> > +	tl->flags =3D flags;
> > +	tl->dmabuf =3D -1;
> > +	tl->sync_file =3D -1;
> > +
> > +	tl->vgem =3D drm_open_driver(DRIVER_VGEM);
> > +	tl->syncobj =3D syncobj_create(fd, 0);
> > +
> > +	tl->vgem_bos =3D calloc(tl->length, sizeof(*tl->vgem_bos));
> > +	igt_assert(tl->vgem_bos);
> > +	for (i =3D 0; i < tl->length; i++) {
> > +		tl->vgem_bos[i].width =3D 1;
> > +		tl->vgem_bos[i].height =3D 1;
> > +		tl->vgem_bos[i].bpp =3D 4;
> > +	}
> > +
> > +	tl->vgem_fences =3D calloc(tl->length, sizeof(*tl->vgem_fences));
> > +	igt_assert(tl->vgem_fences);
> > +
> > +	tl->order =3D calloc(tl->length, sizeof(*tl->order));
> > +	igt_assert(tl->order);
> > +	for (i =3D 0; i < tl->length; i++)
> > +		tl->order[i] =3D flags & STRESS_FLAGS_SIGNAL_BACKWARD ? tl-
>length - 1 - i : i;
> > +	if (flags & STRESS_FLAGS_SIGNAL_RANDOM)
> > +		igt_permute_array(tl->order, tl->length,=20
igt_exchange_int64);
> > +
> > +	for (i =3D 0; i < tl->length; i++) {
> > +		vgem_create(tl->vgem, &tl->vgem_bos[i]);
> > +		tl->vgem_fences[i] =3D vgem_fence_attach(tl->vgem, &tl-
>vgem_bos[i], 0);
> > +	}
> > +
> > +	for (point =3D 1; point <=3D tl->length; point++) {
> > +		bool busy;
> > +
> > +		i =3D tl->order[point - 1];
> > +		tl->dmabuf =3D prime_handle_to_fd(tl->vgem, tl-
>vgem_bos[i].handle);
> > +		igt_assert_fd(tl->dmabuf);
> > +
> > +		tl->sync_file =3D dmabuf_export_sync_file(tl->dmabuf,=20
DMA_BUF_SYNC_RW);
> > +		igt_assert_fd(tl->sync_file);
> > +		close(tl->dmabuf);
> > +		tl->dmabuf =3D -1;
> > +
> > +		busy =3D sync_file_busy(tl->sync_file);
> > +		if (busy) {
> > +			tl->tmp_syncobj =3D syncobj_create(fd, 0);
> > +			syncobj_import_sync_file(fd, tl->tmp_syncobj,=20
tl->sync_file);
> > +		}
> > +		close(tl->sync_file);
> > +		tl->sync_file =3D -1;
> > +		if (igt_debug_on(!busy)) {
> > +			err =3D 0;
> > +			break;
> > +		}
> > +
> > +		syncobj_binary_to_timeline(fd, tl->syncobj, point, tl-
>tmp_syncobj);
> > +		syncobj_destroy(fd, tl->tmp_syncobj);
> > +		tl->tmp_syncobj =3D 0;
> > +
> > +		if (flags & STRESS_FLAGS_ENABLE_ALL) {
> > +			err =3D syncobj_timeline_wait_err(tl->fd, &tl-
>syncobj, &point,
> > +							1, 0,=20
0);
> > +			if (igt_debug_on(err !=3D -ETIME))
> > +				break;
> > +		}
> > +	}
> > +
> > +	igt_require_f(err =3D=3D -ETIME,
> > +		      "CPU power sufficient for setting up still %ld=20
timeline points before vgem fences start to expire\n",
> > +		      tl->length - point + 1);
> > +}
> > +
> > +static void test_stress_enable_wait_signal(int fd, struct stress_timel=
ine=20
**timeline,
> > +					   unsigned int flags)
> > +{
> > +	struct stress_timeline *tl;
> > +	int64_t dt;
> > +
> > +	stress_init(fd, timeline, flags);
> > +	tl =3D *timeline;
> > +
> > +	if (flags & STRESS_FLAGS_SIGNAL_ALL) {
> > +		/* store current time in case vgem fences already started=20
to expire */
> > +		dt =3D -gettime_ns();
> > +
> > +		/* wait for expiry of the first vgem fence */
> > +		tl->dmabuf =3D prime_handle_to_fd(tl->vgem, tl-
>vgem_bos[0].handle);
> > +		igt_assert_fd(tl->dmabuf);
> > +
> > +		tl->sync_file =3D dmabuf_export_sync_file(tl->dmabuf,=20
DMA_BUF_SYNC_RW);
> > +		igt_assert_fd(tl->sync_file);
> > +
> > +		igt_set_timeout(11, "vgem fence should expire=20
automatically in 10 seconds but it hasn't");
> > +		while (sync_file_busy(tl->sync_file))
> > +			dt =3D -gettime_ns();
> > +		igt_reset_timeout();
> > +	} else {
> > +		int i;
> > +
> > +		dt =3D -gettime_ns();
> > +		for (i =3D 0; i < tl->length; i++) {
> > +			igt_require_f(!__vgem_fence_signal(tl->vgem, tl-
>vgem_fences[i]),
> > +				      "CPU power sufficient for=20
manually signaling still %ld vgem fences before they start to expire=20
automatically\n",
> > +				      tl->length - i);
> > +		}
> > +	}
> > +	/* wait for the last point of the timeline being signaled */
> > +	igt_assert_eq(syncobj_timeline_wait_err(tl->fd, &tl->syncobj, &tl-
>length, 1,
> > +						MAX(600 *=20
NSECS_PER_SEC - dt, gettime_ns()), 0), 0);
> > +	dt +=3D gettime_ns();
> > +
> > +	igt_info("%s: %ld signals in %ld ns\n", __func__, tl->length, dt);
> > +}
> > +
> > +static void stress_cleanup(struct stress_timeline *timeline)
> > +{
> > +	int i;
> > +
> > +	if (!timeline)
> > +		return;
> > +
> > +	if (timeline->order)
> > +		free(timeline->order);
> > +
> > +	if (timeline->sync_file >=3D 0)
> > +		igt_warn_on(close(timeline->sync_file));
> > +
> > +	if (timeline->dmabuf >=3D 0)
> > +		igt_warn_on(close(timeline->dmabuf));
> > +
> > +	if (timeline->vgem_fences) {
> > +		for (i =3D 0; i < timeline->length; i++)
> > +			if (timeline->vgem_fences[i])
> > +			=09
igt_ignore_warn(__vgem_fence_signal(timeline->vgem,
> > +							=09
    timeline->vgem_fences[i]));
> > +
> > +		free(timeline->vgem_fences);
> > +	}
> > +
> > +	if (timeline->vgem_bos) {
> > +		for (i =3D 0; i < timeline->length; i++)
> > +			if (timeline->vgem_bos[i].handle)
> > +				gem_close(timeline->vgem, timeline-
>vgem_bos[i].handle);
> > +
> > +		free(timeline->vgem_bos);
> > +	}
> > +
> > +	if (timeline->vgem >=3D 0)
> > +		igt_warn_on(close(timeline->vgem));
> > +
> > +	if (timeline->tmp_syncobj)
> > +		syncobj_destroy(timeline->fd, timeline->tmp_syncobj);
> > +
> > +	if (timeline->syncobj)
> > +		syncobj_destroy(timeline->fd, timeline->syncobj);
> > +
> > +	free(timeline);
> > +}
> > +
> >  static bool
> >  has_syncobj_timeline_wait(int fd)
> >  {
> > @@ -1934,6 +2205,22 @@ igt_main
> >  	igt_subtest("32bits-limit")
> >  		test_32bits_limit(fd);
> > =20
> > +	for (unsigned int flags =3D 0;
> > +	     flags < (STRESS_FLAGS_SIGNAL_BACKWARD |=20
STRESS_FLAGS_SIGNAL_RANDOM); flags++) {
> > +		struct stress_timeline *timeline =3D NULL;
> > +
> > +		igt_describe(stress_descriptions[flags]);
> > +		igt_subtest_f("stress-%s-signal%s-%s",
> > +			      (flags & STRESS_FLAGS_ENABLE_ALL) ?=20
"enable-all" : "wait-last",
> > +			      (flags & STRESS_FLAGS_SIGNAL_ALL) ? "-all"=20
: "",
> > +			      (flags & STRESS_FLAGS_SIGNAL_RANDOM) ?=20
"random" :
> > +			      (flags & STRESS_FLAGS_SIGNAL_BACKWARD) ?=20
"backward" : "forward")
> > +			test_stress_enable_wait_signal(fd, &timeline,=20
flags);
> > +
> > +		igt_fixture
> > +			stress_cleanup(READ_ONCE(timeline));
> > +	}
> > +
> >  	igt_fixture {
> >  		drm_close_driver(fd);
> >  	}
>=20
>=20




