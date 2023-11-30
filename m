Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B99E7FF691
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 17:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062A510E730;
	Thu, 30 Nov 2023 16:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D693D10E730
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 16:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tbANAJoTiUvN+GlI20S7XDt8VRVTaCrXmeuL0N4qX9Q=; b=ezrRFKetlFWomf25bngV6xC2sD
 C0fnhQak/ClcH0kXgHkZcFg3AIfodEUHYsuUfzZKBs9W7uly+YaR/xC6qMgcf2oTFxao4UHSV3AWU
 Rm7GY1e+arN7iW+kYd/uM6rRHgeIeZWLa+ZsSttPn3DJB95puIqpOsGC10uVbroAHJwMajT1q1Jb1
 pHhAEaXTke3um3F/OwhFRQH4kuwGSaUZtFpaWbgaCGz3ljIIBsF/MlSDNJVnUEEtHkUvzzDLQxDL1
 709OteA7AUH5KmLshocDBi5q9IJR6fw9PIxR/XDq3x7K0cH/l4QedQxMMa0ZF/0ZnBLJnVW+/rOMH
 JAbaF+TA==;
Received: from [177.34.169.138] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r8k9q-008scY-A7; Thu, 30 Nov 2023 17:44:58 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 00/17] drm/v3d: Introduce CPU jobs
Date: Thu, 30 Nov 2023 13:40:23 -0300
Message-ID: <20231130164420.932823-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset implements the basic infrastructure for a new type of
V3D job, a CPU job. A CPU job is a job that requires CPU intervention.
It would be nice to perform this operations on the kernel space as we
can attach multiple in/out syncobjs to it.

Why we want a CPU job on the kernel?
====================================

There are some Vulkan commands that cannot be performed by the GPU, so
we implement those as CPU jobs on Mesa. But to synchronize a CPU job
in the user space, we need to hold part of the command submission flow
in order to correctly synchronize their execution.

By moving the CPU job to the kernel, we can make use of the DRM
schedule queues and all the advantages it brings with it. This way,
instead of stalling the submission thread, we can use syncobjs to
synchronize the job, providing a more effective management.

About the implementation
========================

After we decided that we would like to have a CPU job implementation
in the kernel, we could think about two possible implementations for
this job: creating an IOCTL for each type of CPU job or using an user
extension to provide a polymorphic behavior to a single CPU job IOCTL.
We decided for the latter one.

We have different types of CPU jobs (indirect CSD jobs, timestamp
query jobs, copy query results jobs...) and each of them have a common
infrastructure, but perform different operations. Therefore, by using
a single IOCTL that is extended by an user extension, we can reuse the
common infrastructure - avoiding code repetition - and yet use the
user extension ID to identify the type of job and depending on the
type of job, perform a certain operation.

About the patchset
==================

This patchset introduces the basic infrastructure of a CPU job with a
new V3D queue (V3D_CPU) e new tracers. Moreover, it introduces six
types of CPU jobs: an indirect CSD job, a timestamp query job, a
reset timestamp queries job, a copy timestamp query results job, a reset
performance queries job, and a copy performance query results job.

An indirect CSD job is a job that, when executed in the queue, will
map the indirect buffer, read the dispatch parameters, and submit a
regular dispatch. So, the CSD job depends on the CPU job execution. We
attach the wait dependencies to the CPU job and once they are satisfied,
we read the dispatch parameters, rewrite the uniforms (if needed) and
enable the CSD job execution, which depends on the completion of the
CPU job.

A timestamp query job is a job that calculates the value of the
timestamp query and updates the availability of the query. In order to
implement this job, we had to change the Mesa implementation of the
timestamp. Now, the timestamp query value is tracked in a BO, instead
of using a memory address. Moreover, the timestamp query availability is
tracked with a syncobj, which is signaled when the query is available.

A reset timestamp queries job is a job that resets the timestamp queries by
zeroing the timestamp BO in the right positions. The right position on
the timestamp BO is found through the offset of the first query.

A reset performance queries job is a job that zeros the values of the
performance monitors associated to that query. Moreover, it resets the
availability syncobj related to that query.

A copy query results job is a job that copy the results of a query to a
BO in a given offset with a given stride.

The patchset is divided as such:
 * #1 - #4: refactoring operations to prepare for the introduction of the
            CPU job
 * #5: addressing a vulnerability in the multisync extension
 * #6: decouple job allocation from job initiation
 * #7 - #9: introduction of the CPU job
 * #10 - #11: refactoring operations to prepare for the introduction of the
              indirect CSD job
 * #12: introduction of the indirect CSD job
 * #13: introduction of the timestamp query job
 * #14: introduction of the reset timestamp queries job
 * #15: introduction of the copy timestamp query results job
 * #16: introduction of the reset performance queries job
 * #17: introduction of the copy performance query results job

This patchset has its Mesa counterpart, which is available on [1].

Both the kernel and Mesa implementation were tested with

 * `dEQP-VK.compute.pipeline.indirect_dispatch.*`,
 * `dEQP-VK.pipeline.monolithic.timestamp.*`,
 * `dEQP-VK.synchronization.*`,
 * `dEQP-VK.query_pool.*`
 * and `dEQP-VK.multiview.*`.

Considering that I already have Iago's R-b, I plan to push this series
to drm-misc-next tomorrow. Let me know if there are any problems.

[1] https://gitlab.freedesktop.org/mairacanal/mesa/-/tree/v3dv/v5/cpu-job

Changelog
=========

v1 -> v2: https://lore.kernel.org/dri-devel/20230904175019.1172713-1-mcanal@igalia.com/

* Rebase on top of drm-misc-next.
* Add GPU stats to the CPU queue.

v2 -> v3: https://lore.kernel.org/dri-devel/20231124012548.772095-1-mcanal@igalia.com/

* Don't cast struct v3d_*_job to void *, use &job->base (Iago Toral)
* Completely decouple job allocation from initialization (Iago Toral & Melissa Wen)
* s/externsion/extension (Iago Toral)
* Declare all CPU job functions as static const outside of the function (Iago Toral)
* Document how many BOs are expected for each CPU job extension (Iago Toral)
* Check if the number of BOs in the IOCTL matches the expectation (Iago Toral)

v3 -> v4: https://lore.kernel.org/dri-devel/20231127185723.10348-2-mcanal@igalia.com/

* Add Iago's Reviewed-by (Iago Toral)
* Rephase documentation (Iago Toral)

Best Regards,
- Maíra

Maíra Canal (11):
  drm/v3d: Don't allow two multisync extensions in the same job
  drm/v3d: Decouple job allocation from job initiation
  drm/v3d: Use v3d_get_extensions() to parse CPU job data
  drm/v3d: Create tracepoints to track the CPU job
  drm/v3d: Enable BO mapping
  drm/v3d: Create a CPU job extension for a indirect CSD job
  drm/v3d: Create a CPU job extension for the timestamp query job
  drm/v3d: Create a CPU job extension for the reset timestamp job
  drm/v3d: Create a CPU job extension to copy timestamp query to a buffer
  drm/v3d: Create a CPU job extension for the reset performance query job
  drm/v3d: Create a CPU job extension for the copy performance query job

Melissa Wen (6):
  drm/v3d: Remove unused function header
  drm/v3d: Move wait BO ioctl to the v3d_bo file
  drm/v3d: Detach job submissions IOCTLs to a new specific file
  drm/v3d: Simplify job refcount handling
  drm/v3d: Add a CPU job submission
  drm/v3d: Detach the CSD job BO setup

 drivers/gpu/drm/v3d/Makefile     |    3 +-
 drivers/gpu/drm/v3d/v3d_bo.c     |   51 ++
 drivers/gpu/drm/v3d/v3d_drv.c    |    4 +
 drivers/gpu/drm/v3d/v3d_drv.h    |  134 ++-
 drivers/gpu/drm/v3d/v3d_gem.c    |  768 -----------------
 drivers/gpu/drm/v3d/v3d_sched.c  |  315 +++++++
 drivers/gpu/drm/v3d/v3d_submit.c | 1318 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_trace.h  |   57 ++
 include/uapi/drm/v3d_drm.h       |  240 +++++-
 9 files changed, 2110 insertions(+), 780 deletions(-)
 create mode 100644 drivers/gpu/drm/v3d/v3d_submit.c

--
2.42.0

