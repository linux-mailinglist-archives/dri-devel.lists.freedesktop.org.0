Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CE4625899
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 11:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C4F10E7DC;
	Fri, 11 Nov 2022 10:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B722410E036
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 10:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668163502; x=1699699502;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NfWaMD4eV8PiamFFdwD3K7mPn0VAHcD2e/Fdvlt2DQA=;
 b=EkVUmUSFcRFfnAGEBe1nXgcJU6eqY4Fkz2sFOArNSldnLBsj3VYc+27L
 ViTr/QydrR++pZCqy6TCPFlanEr62lJ+svKqVvZef6zR8yuazDr3d1O/Z
 B6/Qcq9ThJBjxLvDkWWwLWTJDu9Hg63cQRMbdf8dRjjsd8ne1YZaIVONa
 /n3rWwNE/68jqF3L/U7dG7oEQ1G4XOOj7DZnQMz9iTQ5HFunjXfGqY1qE
 HDykGHwQk4Sqy7R59h6ulaUdEg9ocCFe2bBjBtqypHj2VhbSTOqgb3w29
 eQeN6Kqbc3+/FUZ71VyljRbY0nV2wabrAmaSbvO2dN6b7PisA7zsu2nxs A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="299087588"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="299087588"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 02:45:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="670708416"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="670708416"
Received: from eharkin-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.208.27])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 02:45:00 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v2 README 00/13] DRM scheduling cgroup controller
Date: Fri, 11 Nov 2022 10:44:22 +0000
Message-Id: <20221111104435.3152347-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

*** vvv Read this first please vvv ***

I am re-sending this to dri-devel directly, having realized neither v1 or v2
have reached dri-devel due possible SMTP server issues. Other recipients and
lists however did get both v1 in October and v2 two days ago.

Hence this is a re-post for the benefit of dri-devel only. And I do understand
any replies would create a fork where not all lists, recipients would be up to
date with discussions. But I thought dri-devel needed to be made aware of the
proposal, while the SMTP server issues are being investigated.

Full v1, with some follow up discussion, can be found at these links:
https://lists.freedesktop.org/archives/intel-gfx/2022-October/309547.html
https://marc.info/?t=166620059900003&r=1&w=4
https://marc.info/?l=linux-cgroups&m=166620044012970&w=2

v2:
https://lists.freedesktop.org/archives/intel-gfx/2022-November/311844.html
https://marc.info/?l=linux-cgroups&m=166800992215296&w=2
https://marc.info/?l=linux-kernel&m=166800993415302&w=4

*** ^^^ Read this first please ^^^ ***

This series contains a proposal for a DRM scheduling cgroup controller which
implements a weight based hierarchical GPU usage budget based controller
similar in concept to some of the existing controllers.

Motivation mostly comes from my earlier proposal where I identified that GPU
scheduling lags significantly behind what is available for CPU and IO. Whereas
back then I was proposing to somehow tie this with process nice, feedback mostly
was that people wanted cgroups. So here it is - in the world of heterogenous
computing pipelines I think it is time to do something about this gap.

Code is not finished but should survive some light experimenting with. I am
sharing it early since the topic has been controversial in the past. I hope to
demonstrate there are gains to be had in real world usage(*), today, and that
the concepts the proposal relies are well enough established and stable.

*) Specifically under ChromeOS which uses cgroups to control CPU bandwith for
   VMs based on the window focused status. It can be demonstrated how GPU
   scheduling control can easily be integrated into that setup.

There should be no conflict with this proposal and any efforts to implement
memory usage based controller. Skeleton DRM cgroup controller is deliberatly
purely a skeleton patch where any further functionality can be added with no
real conflicts. [In fact, perhaps scheduling is even easier to deal with than
memory accounting.]

Structure of the series is as follows:

  1-3) Improve client ownership tracking in DRM core.
    4) Adds a skeleton DRM cgroup controller with no functionality.
 5-10) Laying down some infrastructure to enable the controller.
   11) The controller itself.
12-13) i915 support for the controller.

The proposals defines a delegation of duties between the tree parties: cgroup
controller, DRM core and individual drivers. Two way communication interfaces
are then defined to enable the delegation to work.

DRM scheduling soft limits
~~~~~~~~~~~~~~~~~~~~~~~~~~

Because of the heterogenous hardware and driver DRM capabilities, soft limits
are implemented as a loose co-operative (bi-directional) interface between the
controller and DRM core.

The controller configures the GPU time allowed per group and periodically scans
the belonging tasks to detect the over budget condition, at which point it
invokes a callback notifying the DRM core of the condition.

DRM core provides an API to query per process GPU utilization and 2nd API to
receive notification from the cgroup controller when the group enters or exits
the over budget condition.

Individual DRM drivers which implement the interface are expected to act on this
in the best-effort manner only. There are no guarantees that the soft limits
will be respected.

DRM scheduling soft limits interface files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  drm.weight
	Standard cgroup weight based control [1, 10000] used to configure the
	relative distributing of GPU time between the sibling groups.

  drm.period_us (Most probably only a debugging aid during RFC phase.)
	An integer representing the period with which the controller should look
	at the GPU usage by the group and potentially send the over/under budget
	signal.
	Value of zero (defaul) disables the soft limit checking.

This builds upon the per client GPU utilisation work which landed recently for a
few drivers. My thinking is that in principle, an intersect of drivers which
support both that and some sort of scheduling control, like  priorities, could
also in theory support this controller.

Another really interesting angle for this controller is that it mimics the same
control menthod used by the CPU scheduler. That is the proportional/weight based
GPU time budgeting. Which makes it easy to configure and does not need a new
mental model.

However, as the introduction mentions, GPUs are much more heterogenous and
therefore the controller uses very "soft" wording as to what it promises. The
general statement is that it can define budgets, notify clients when they are
over them, and let individual drivers implement best effort handling of those
conditions.

Delegation of duties in the implementation goes likes this:

 * DRM cgroup controller implements the control files and the scanning loop.
 * DRM core is required to track all DRM clients belonging to processes so it
   can answer when asked how much GPU time is a process using.
 * DRM core also provides a call back which the controller will call when a
   certain process is over budget.
 * Individual drivers need to implement two similar hooks, but which work for
   a single DRM client. Over budget callback and GPU utilisation query.

What I have demonstrated in practice is that when wired to i915, in a really
primitive way where the over-budget condition simply lowers the scheduling
priority, the concept can be almost equally effective as the static priority
control. I say almost because the design where budget control depends on the
periodic usage scanning has a fundamental delay, so responsiveness will depend
on the scanning period, which may or may not be a problem for a particular use
case.

There are also interesting conversations to be had around mental models for what
is GPU usage as a single number when faced with GPUs which have different
execution engines. To an extent this is similar to the multi-core and cgroup
CPU controller problems, but definitely goes further than that.

I deliberately did not want to include any such complications in the controller
itself and left the individual drivers to handle it. For instance in the i915
over-budget callback it will not do anything unless client's GPU usage is on a
physical engine which is oversubscribed. This enables multiple clients to be
harmlessly over budget, as long as they are not competing for the same GPU
resource.

This much for now, hope some good discussion will follow.

P.S.
A disclaimer of a kind -  I was not familiar with how to implement a cgroup
controller at all when I started this prototype therefore it is quite possible
there are many bugs and misunderstandings on how it should be done.

v2:
 * Prefaced the series with some core DRM work as suggested by Christian.
 * Dropped the priority based controller for now.
 * Dropped the introspection cgroup controller file.
 * Implemented unused budget sharing/propagation.
 * Some small fixes/tweak as per review feedback and in general.

Tvrtko Ursulin (13):
  drm: Replace DRM_DEBUG with drm_dbg_core in file and ioctl handling
  drm: Track clients by tgid and not tid
  drm: Update file owner during use
  cgroup: Add the DRM cgroup controller
  drm/cgroup: Track clients per owning process
  drm/cgroup: Allow safe external access to file_priv
  drm/cgroup: Add ability to query drm cgroup GPU time
  drm/cgroup: Add over budget signalling callback
  drm/cgroup: Only track clients which are providing drm_cgroup_ops
  cgroup/drm: Client exit hook
  cgroup/drm: Introduce weight based drm cgroup control
  drm/i915: Wire up with drm controller GPU time query
  drm/i915: Implement cgroup controller over budget throttling

 Documentation/admin-guide/cgroup-v2.rst       |  37 ++
 drivers/gpu/drm/Kconfig                       |   1 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |   6 +-
 drivers/gpu/drm/drm_auth.c                    |   3 +-
 drivers/gpu/drm/drm_cgroup.c                  | 192 ++++++
 drivers/gpu/drm/drm_debugfs.c                 |  12 +-
 drivers/gpu/drm/drm_file.c                    |  74 ++-
 drivers/gpu/drm/drm_ioc32.c                   |  13 +-
 drivers/gpu/drm/drm_ioctl.c                   |  28 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  37 +-
 drivers/gpu/drm/i915/i915_driver.c            |  11 +
 drivers/gpu/drm/i915/i915_drm_client.c        | 169 +++++-
 drivers/gpu/drm/i915/i915_drm_client.h        |  13 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c           |   6 +-
 include/drm/drm_clients.h                     |  47 ++
 include/drm/drm_drv.h                         |  36 ++
 include/drm/drm_file.h                        |  17 +-
 include/linux/cgroup_drm.h                    |  13 +
 include/linux/cgroup_subsys.h                 |   4 +
 init/Kconfig                                  |   8 +
 kernel/cgroup/Makefile                        |   1 +
 kernel/cgroup/drm.c                           | 572 ++++++++++++++++++
 24 files changed, 1249 insertions(+), 57 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_cgroup.c
 create mode 100644 include/drm/drm_clients.h
 create mode 100644 include/linux/cgroup_drm.h
 create mode 100644 kernel/cgroup/drm.c

-- 
2.34.1

