Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E31DE7FB50E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 09:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D7610E462;
	Tue, 28 Nov 2023 08:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4E610E463
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 08:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FI2ZvN6quGwqt7r0NB7aPQ1cdgNFB/lTj2QjRp07WN8=; b=DSndbvxAggJ2RGGoOUkYP77szq
 9iaWnv33CSut9UZhGXOkVK6jUmmGqYgeQxRWE9+w/9NUZ2Pb1vaoXYMdXmPZ0AtiSGJsjV+mc/OwB
 TIuZSUg2xYrXsEvaUsYi0ii9teCa5mu2FDsOMTsRv0XfZFOF1yx6MElQchmemmXc7RxikEoC1TMbW
 SmEs5x9PYM26Pr4ns+t9Xt0UKPNYU9/Bv77GVbLEMUxt87RLk7kvCrGB2gmA1EoYSLMTr1LGQ5O42
 mLI5G394epEioZ9lZ5vwIiAI3hq0f2ad5paql/NTH/QfdAU1aoUq2KOqZ+uvlSl9/83dnKZbRbtc7
 5BYthvWg==;
Received: from 93.49.60.213.dynamic.reverse-mundo-r.com ([213.60.49.93]
 helo=[192.168.0.100]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r7twB-007xuO-SL; Tue, 28 Nov 2023 09:59:23 +0100
Message-ID: <c702cdbc0004b1c5a92b73192e334db3ecfe3e8a.camel@igalia.com>
Subject: Re: [PATCH v3 00/17] drm/v3d: Introduce CPU jobs
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 28 Nov 2023 09:59:23 +0100
In-Reply-To: <20231127185723.10348-2-mcanal@igalia.com>
References: <20231127185723.10348-2-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ma=C3=ADra,

El lun, 27-11-2023 a las 15:48 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> This patchset implements the basic infrastructure for a new type of
> V3D job, a CPU job. A CPU job is a job that requires CPU
> intervention.
> It would be nice to perform this operations on the kernel space as we
> can attach multiple in/out syncobjs to it.
>=20
> Why we want a CPU job on the kernel?
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> There are some Vulkan commands that cannot be performed by the GPU,
> so
> we implement those as CPU jobs on Mesa. But to synchronize a CPU job
> in the user space, we need to hold part of the command submission
> flow
> in order to correctly synchronize their execution.
>=20
> By moving the CPU job to the kernel, we can make use of the DRM
> schedule queues and all the advantages it brings with it. This way,
> instead of stalling the submission thread, we can use syncobjs to
> synchronize the job, providing a more effective management.
>=20
> About the implementation
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> After we decided that we would like to have a CPU job implementation
> in the kernel, we could think about two possible implementations for
> this job: creating an IOCTL for each type of CPU job or using an user
> extension to provide a polymorphic behavior to a single CPU job
> IOCTL.
> We decided for the latter one.
>=20
> We have different types of CPU jobs (indirect CSD jobs, timestamp
> query jobs, copy query results jobs...) and each of them have a
> common
> infrastructure, but perform different operations. Therefore, by using
> a single IOCTL that is extended by an user extension, we can reuse
> the
> common infrastructure - avoiding code repetition - and yet use the
> user extension ID to identify the type of job and depending on the
> type of job, perform a certain operation.
>=20
> About the patchset
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> This patchset introduces the basic infrastructure of a CPU job with a
> new V3D queue (V3D_CPU) e new tracers. Moreover, it introduces six
> types of CPU jobs: an indirect CSD job, a timestamp query job, a
> reset timestamp queries job, a copy timestamp query results job, a
> reset
> performance queries job, and a copy performance query results job.
>=20
> An indirect CSD job is a job that, when executed in the queue, will
> map the indirect buffer, read the dispatch parameters, and submit a
> regular dispatch. So, the CSD job depends on the CPU job execution.
> We
> attach the wait dependencies to the CPU job and once they are
> satisfied,
> we read the dispatch parameters, rewrite the uniforms (if needed) and
> enable the CSD job execution, which depends on the completion of the
> CPU job.
>=20
> A timestamp query job is a job that calculates the value of the
> timestamp query and updates the availability of the query. In order
> to
> implement this job, we had to change the Mesa implementation of the
> timestamp. Now, the timestamp query value is tracked in a BO, instead
> of using a memory address. Moreover, the timestamp query availability
> is
> tracked with a syncobj, which is signaled when the query is
> available.
>=20
> A reset timestamp queries job is a job that resets the timestamp
> queries by
> zeroing the timestamp BO in the right positions. The right position
> on
> the timestamp BO is found through the offset of the first query.
>=20
> A reset performance queries job is a job that zeros the values of the
> performance monitors associated to that query. Moreover, it resets
> the
> availability syncobj related to that query.
>=20
> A copy query results job is a job that copy the results of a query to
> a
> BO in a given offset with a given stride.
>=20
> The patchset is divided as such:
> =C2=A0* #1 - #4: refactoring operations to prepare for the introduction o=
f
> the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU jo=
b
> =C2=A0* #5: addressing a vulnerability in the multisync extension
> =C2=A0* #6: decouple job allocation from job initiation
> =C2=A0* #7 - #9: introduction of the CPU job
> =C2=A0* #10 - #11: refactoring operations to prepare for the introduction
> of the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 indirect CSD job
> =C2=A0* #12: introduction of the indirect CSD job
> =C2=A0* #13: introduction of the timestamp query job
> =C2=A0* #14: introduction of the reset timestamp queries job
> =C2=A0* #15: introduction of the copy timestamp query results job
> =C2=A0* #16: introduction of the reset performance queries job
> =C2=A0* #17: introduction of the copy performance query results job
>=20
> This patchset has its Mesa counterpart, which is available on [1].
>=20
> Both the kernel and Mesa implementation were tested with
>=20
> =C2=A0* `dEQP-VK.compute.pipeline.indirect_dispatch.*`,
> =C2=A0* `dEQP-VK.pipeline.monolithic.timestamp.*`,
> =C2=A0* `dEQP-VK.synchronization.*`,
> =C2=A0* `dEQP-VK.query_pool.*`
> =C2=A0* and `dEQP-VK.multiview.*`.
>=20
> [1]
> https://gitlab.freedesktop.org/mairacanal/mesa/-/tree/v3dv/v5/cpu-job
>=20
> Changelog
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> v1 -> v2:
> https://lore.kernel.org/dri-devel/20230904175019.1172713-1-mcanal@igalia.=
com/
>=20
> * Rebase on top of drm-misc-next.
> * Add GPU stats to the CPU queue.
>=20
> v2 -> v3:
> https://lore.kernel.org/dri-devel/20231124012548.772095-1-mcanal@igalia.c=
om/
>=20
> * Don't cast struct v3d_*_job to void *, use &job->base (Iago Toral)
> * Completely decouple job allocation from initialization (Iago Toral
> & Melissa Wen)
> * s/externsion/extension (Iago Toral)
> * Declare all CPU job functions as static const outside of the
> function (Iago Toral)
> * Document how many BOs are expected for each CPU job extension (Iago
> Toral)
> * Check if the number of BOs in the IOCTL matches the expectation
> (Iago Toral)
>=20
> Best Regards,
> - Ma=C3=ADra
>=20
> Ma=C3=ADra Canal (11):
> =C2=A0 drm/v3d: Don't allow two multisync extensions in the same job
> =C2=A0 drm/v3d: Decouple job allocation from job initiation
> =C2=A0 drm/v3d: Use v3d_get_extensions() to parse CPU job data
> =C2=A0 drm/v3d: Create tracepoints to track the CPU job
> =C2=A0 drm/v3d: Enable BO mapping
> =C2=A0 drm/v3d: Create a CPU job extension for a indirect CSD job
> =C2=A0 drm/v3d: Create a CPU job extension for the timestamp query job
> =C2=A0 drm/v3d: Create a CPU job extension for the reset timestamp job
> =C2=A0 drm/v3d: Create a CPU job extension to copy timestamp query to a
> buffer
> =C2=A0 drm/v3d: Create a CPU job extension for the reset performance quer=
y
> job
> =C2=A0 drm/v3d: Create a CPU job extension for the copy performance query
> job
>=20
> Melissa Wen (6):
> =C2=A0 drm/v3d: Remove unused function header
> =C2=A0 drm/v3d: Move wait BO ioctl to the v3d_bo file
> =C2=A0 drm/v3d: Detach job submissions IOCTLs to a new specific file
> =C2=A0 drm/v3d: Simplify job refcount handling
> =C2=A0 drm/v3d: Add a CPU job submission
> =C2=A0 drm/v3d: Detach the CSD job BO setup
>=20
> =C2=A0drivers/gpu/drm/v3d/Makefile=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/v3d/v3d_bo.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
51 ++
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.c=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
 4 +
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.h=C2=A0=C2=A0=C2=A0 |=C2=A0 134 ++-
> =C2=A0drivers/gpu/drm/v3d/v3d_gem.c=C2=A0=C2=A0=C2=A0 |=C2=A0 768 -------=
----------
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c=C2=A0 |=C2=A0 315 +++++++
> =C2=A0drivers/gpu/drm/v3d/v3d_submit.c | 1318
> ++++++++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/v3d/v3d_trace.h=C2=A0 |=C2=A0=C2=A0 57 ++
> =C2=A0include/uapi/drm/v3d_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 240 +++++-
> =C2=A09 files changed, 2110 insertions(+), 780 deletions(-)
> =C2=A0create mode 100644 drivers/gpu/drm/v3d/v3d_submit.c
>=20
> --
> 2.42.0

I shared a few minor nits but otherwise I think this looks good. With
those nits fixed the series is:

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

Thanks!
Iago
