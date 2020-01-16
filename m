Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2716A14050D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 09:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD51F6F42C;
	Fri, 17 Jan 2020 08:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 439996EAF5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 15:21:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2136F1396;
 Thu, 16 Jan 2020 07:21:00 -0800 (PST)
Received: from e123648.arm.com (unknown [10.37.12.156])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E3AB3F68E;
 Thu, 16 Jan 2020 07:20:48 -0800 (PST)
From: lukasz.luba@arm.com
To: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH 0/4] Add support for devices in the Energy Model
Date: Thu, 16 Jan 2020 15:20:28 +0000
Message-Id: <20200116152032.11301-1-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 17 Jan 2020 08:13:08 +0000
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, bjorn.andersson@linaro.org, bsegall@google.com,
 Morten.Rasmussen@arm.com, amit.kucheria@verdurent.com,
 vincent.guittot@linaro.org, khilman@kernel.org, daniel.lezcano@linaro.org,
 steven.price@arm.com, cw00.choi@samsung.com, mingo@redhat.com, mgorman@suse.de,
 rui.zhang@intel.com, alyssa.rosenzweig@collabora.com, b.zolnierkie@samsung.com,
 s.hauer@pengutronix.de, rostedt@goodmis.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, Dietmar.Eggemann@arm.com, airlied@linux.ie,
 javi.merino@arm.com, tomeu.vizoso@collabora.com, qperret@google.com,
 sboyd@kernel.org, shawnguo@kernel.org, rjw@rjwysocki.net, agross@kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 ionela.voinescu@arm.com, lukasz.luba@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lukasz Luba <lukasz.luba@arm.com>

Hi all,

This patch set introduces support for devices in the Energy Model (EM) framework.
It will unify the power model for thermal subsystem and make it simpler.
The 1st patch refactors EM framework and adds support for devices. The 2nd patch
changes dev_pm_opp_of_register_em() in OPP/OF which now should take as an
argument struct device pointer. It touches a few trees (OMAP, NXP, mediatek) updating
their CPUfreq drivers to the new interface.
Patch 3 changes thermal devfreq cooling removing old code for calculating local power
table. It simplifies the code and uses EM for requested power calculation.
Last patch 4 is based on 'drm-misc-next' and adds EM to Panfrost driver.

The patch set is based on v5.5-rc6 tag (excluding last patch).

Regards,
Lukasz Luba

Lukasz Luba (4):
  PM / EM: and devices to Energy Model
  OPP: change parameter to device pointer in dev_pm_opp_of_register_em()
  thermal: devfreq_cooling: Refactor code and switch to use Energy Model
  drm/panfrost: Register to the Energy Model with devfreq device

 Documentation/power/energy-model.rst        |  67 ++--
 drivers/cpufreq/cpufreq-dt.c                |   2 +-
 drivers/cpufreq/imx6q-cpufreq.c             |   2 +-
 drivers/cpufreq/mediatek-cpufreq.c          |   2 +-
 drivers/cpufreq/omap-cpufreq.c              |   2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c           |   2 +-
 drivers/cpufreq/scmi-cpufreq.c              |  11 +-
 drivers/cpufreq/scpi-cpufreq.c              |   2 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c |   3 +
 drivers/opp/of.c                            |  43 +--
 drivers/thermal/cpu_cooling.c               |  10 +-
 drivers/thermal/devfreq_cooling.c           | 397 +++++++------------
 include/linux/devfreq_cooling.h             |  17 -
 include/linux/energy_model.h                | 108 ++++--
 include/linux/pm_opp.h                      |  13 +-
 include/trace/events/thermal.h              |  19 +-
 kernel/power/energy_model.c                 | 406 ++++++++++++++++----
 kernel/sched/sched.h                        |   2 +-
 kernel/sched/topology.c                     |   4 +-
 19 files changed, 631 insertions(+), 481 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
