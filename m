Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 343BE6B9792
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 15:19:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CBBE10E17B;
	Tue, 14 Mar 2023 14:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FB410E17B;
 Tue, 14 Mar 2023 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678803557; x=1710339557;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3Epswvez9cgVN38uxL2Pejdg2mq8lRpB57HFYyxwu6o=;
 b=hCEXkojArcJDx5HC8eix4nViAxHrTcETfZDlcRnBK8JUetP+2NXKOR51
 d9W57T+6fsmSeA4RomwDnSv+V98sMWmzORlYGzs9wzpcfjlqjrTJ++6xo
 1Dc9TUpC/ypcQB+WEEzeZgvS+Amy60YYhaE8zPlki9A7gqJkImlCPT/oh
 tc03ZAOuyBdt7g9LSX9NdgJZ+e1j9g80r4Yoa3FOzQ4ae3t1wBnzP77KJ
 7OqI5ayKE/A4IwC5uV9ZKSoL7AAC8T40AuWr8z7TAoCj+/jwJGuVnL/QU
 G3DuUWZVw/qKmtxbENPdjbDMDqSPDlCtBwuv5jOPuD1BRQEpVpWwUMg4p Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="321284626"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="321284626"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 07:19:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="656363184"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="656363184"
Received: from mjtillin-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.236.227])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 07:19:12 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC v4 00/10] DRM scheduling cgroup controller
Date: Tue, 14 Mar 2023 14:18:54 +0000
Message-Id: <20230314141904.1210824-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Rob Clark <robdclark@chromium.org>, Brian Welty <brian.welty@intel.com>,
 Kenny.Ho@amd.com, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zefan Li <lizefan.x@bytedance.com>, Dave Airlie <airlied@redhat.com>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

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

*) Another real world example later in the cover letter.

There should be no conflict with this proposal and any efforts to implement
memory usage based controller. Skeleton DRM cgroup controller is deliberatly
purely a skeleton patch where any further functionality can be added with no
real conflicts. [In fact, perhaps scheduling is even easier to deal with than
memory accounting.]

Structure of the series is as follows:

  1-2) Improve client ownership tracking in DRM core.
    3) Adds a skeleton DRM cgroup controller with no functionality.
  4-7) Laying down some infrastructure to enable the controller.
    8) The controller itself.
 9-10) i915 support for the controller.

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

 * DRM cgroup controller implements the control files, the scanning loop and
   tracks the DRM clients associated with each cgroup. It provides API DRM
   core needs to call to (de)register and migrate clients.
 * DRM core defines two call-backs which the core calls directly: First for
   querying GPU time by a client and second for notifying the client that it
   is over budget. It calls controller API for (de)registering clients and
   migrating then between tasks on file descriptor hand over.
 * Individual drivers implement the above mentiopned callbacks and register
   them with the DRM core.

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

Example usage from within a Linux desktop
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Standard Linux distributions like Ubuntu already uses cgroups heavily for
session management and that could easily be extended with the DRM controller.

After logging into the system graphically we can enable the DRM controller
throughout the cgroups hierarchy:

echo +drm > /sys/fs/cgroup/cgroup.subtree_control
echo +drm > /sys/fs/cgroup/user.slice/cgroup.subtree_control
echo +drm > /sys/fs/cgroup/user.slice/user-$(id -u).slice/cgroup.subtree_control

Next we will open two SSH sessions, just so separate cgroups are handily created
by systemd for this experiment.

Roughly simultaneously we run the following two benchmarks in each session
respectively:

1)
./GpuTest /test=pixmark_julia_fp32 /width=1920 /height=1080 /fullscreen /no_scorebox /benchmark /benchmark_duration_ms=60000

2)
vblank_mode=0 bin/testfw_app --gl_api=desktop_core --width=1920 --height=1080 --fullscreen 1 --gfx=glfw -t gl_manhattan

(The only reason for vsync off here is because I struggled to find an easily
runnable and demanding enough benchmark, or to run on a screen large enough to
make even a simpler ones demanding.)

With this test we get 252fps from GpuTest and 96fps from GfxBenchmark.

Premise here is that one of these GPU intensive benchmarks is intended to be ran
by the user with lower priority. Imagine kicking off some background compute
processing and continuing to use the UI for other tasks. Hence the user will now
re-run the test by first lowering the weight control of the first session (DRM
cgroup):

1)
echo 50 | sudo tee /sys/fs/cgroup/`cut -d':' -f3 /proc/self/cgroup`/drm.weight
./GpuTest /test=pixmark_julia_fp32 /width=1920 /height=1080 /fullscreen /no_scorebox /benchmark /benchmark_duration_ms=60000

2)
vblank_mode=0 bin/testfw_app --gl_api=desktop_core --width=1920 --height=1080 --fullscreen 1 --gfx=glfw -t gl_manhattan

In this case we will see that GpuTest has recorded 208fps (~18% down) and
GfxBenchmark 114fps (18% up), demonstrating that even a very simple approach of
wiring up i915 to the DRM cgroup controller can enable external GPU scheduling
control.

* Note here that default weight is 100, so setting 50 for the background session
  is asking the controller to give it half as much GPU bandwidth.

v2:
 * Prefaced the series with some core DRM work as suggested by Christian.
 * Dropped the priority based controller for now.
 * Dropped the introspection cgroup controller file.
 * Implemented unused budget sharing/propagation.
 * Some small fixes/tweak as per review feedback and in general.

v3:
 * Dropped one upstreamed patch.
 * Logging cleanup (use DRM macros where available).

v4:
 * Dropped the struct pid tracking indirection in favour of tracking individual
   DRM clients directly in the controller. (Michal Koutný)
 * Added boot time param for configuring the scanning period. (Tejun Heo)
 * Improved spreading of unused budget to over budget clients, regardless of
   their location in the tree so that all unused budget can be utilized.
 * Made scanning more robust by not re-starting it on every client de-
   registration and removal. Instead new baseline GPU activity data is simply
   collected on those events and next scan invocation can proceed as scheduled.
 * Dropped the debugging aids from the series.

TODOs/Opens:

 * For now (RFC) I haven't implemented the 2nd suggestion from Tejun of having
   a shadow tree which would only contain groups with DRM clients. (Purpose
   being less nodes to traverse in the scanning loop.)

 * Is the global state passing from can_attach to attach really okay? (I need
   source and destination css.)

Tvrtko Ursulin (10):
  drm: Track clients by tgid and not tid
  drm: Update file owner during use
  cgroup: Add the DRM cgroup controller
  drm/cgroup: Track DRM clients per cgroup
  drm/cgroup: Add ability to query drm cgroup GPU time
  drm/cgroup: Add over budget signalling callback
  drm/cgroup: Only track clients which are providing drm_cgroup_ops
  cgroup/drm: Introduce weight based drm cgroup control
  drm/i915: Wire up with drm controller GPU time query
  drm/i915: Implement cgroup controller over budget throttling

 Documentation/admin-guide/cgroup-v2.rst       |  31 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |   6 +-
 drivers/gpu/drm/drm_auth.c                    |   3 +-
 drivers/gpu/drm/drm_debugfs.c                 |  12 +-
 drivers/gpu/drm/drm_file.c                    |  46 +-
 drivers/gpu/drm/drm_ioctl.c                   |   3 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  38 +-
 drivers/gpu/drm/i915/i915_driver.c            |  11 +
 drivers/gpu/drm/i915/i915_drm_client.c        | 209 ++++++-
 drivers/gpu/drm/i915/i915_drm_client.h        |  13 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c           |   6 +-
 include/drm/drm_drv.h                         |  36 ++
 include/drm/drm_file.h                        |  19 +-
 include/linux/cgroup_drm.h                    |  29 +
 include/linux/cgroup_subsys.h                 |   4 +
 init/Kconfig                                  |   7 +
 kernel/cgroup/Makefile                        |   1 +
 kernel/cgroup/drm.c                           | 568 ++++++++++++++++++
 19 files changed, 1020 insertions(+), 27 deletions(-)
 create mode 100644 include/linux/cgroup_drm.h
 create mode 100644 kernel/cgroup/drm.c

-- 
2.37.2

