Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4781A4495
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 11:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07CD6EC9E;
	Fri, 10 Apr 2020 09:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 346416EC93
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 08:43:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF19F31B;
 Fri, 10 Apr 2020 01:43:20 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.37.12.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1D9AA3F68F;
 Fri, 10 Apr 2020 01:43:10 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v6 05/10] PM / EM: remove em_register_perf_domain
Date: Fri, 10 Apr 2020 09:42:05 +0100
Message-Id: <20200410084210.24932-6-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200410084210.24932-1-lukasz.luba@arm.com>
References: <20200410084210.24932-1-lukasz.luba@arm.com>
X-Mailman-Approved-At: Fri, 10 Apr 2020 09:45:19 +0000
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
 viresh.kumar@linaro.org, liviu.dudau@arm.com, bjorn.andersson@linaro.org,
 bsegall@google.com, mka@chromium.org, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 daniel.lezcano@linaro.org, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, mgorman@suse.de, rui.zhang@intel.com,
 alyssa.rosenzweig@collabora.com, orjan.eide@arm.com, b.zolnierkie@samsung.com,
 s.hauer@pengutronix.de, rostedt@goodmis.org, matthias.bgg@gmail.com,
 Dietmar.Eggemann@arm.com, airlied@linux.ie, tomeu.vizoso@collabora.com,
 qperret@google.com, sboyd@kernel.org, rdunlap@infradead.org, rjw@rjwysocki.net,
 agross@kernel.org, kernel@pengutronix.de, sudeep.holla@arm.com,
 patrick.bellasi@matbug.net, shawnguo@kernel.org, lukasz.luba@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove old function em_register_perf_domain which is no longer needed.
There is em_dev_register_perf_domain that covers old use cases and new as
well.

Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 include/linux/energy_model.h |  7 -------
 kernel/power/energy_model.c  | 25 -------------------------
 2 files changed, 32 deletions(-)

diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
index f6b8077cc875..73c43e4c8a3b 100644
--- a/include/linux/energy_model.h
+++ b/include/linux/energy_model.h
@@ -78,8 +78,6 @@ struct em_data_callback {
 struct em_perf_domain *em_cpu_get(int cpu);
 struct em_perf_domain *em_pd_get(struct device *dev);
 void em_pd_put(struct device *dev);
-int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
-						struct em_data_callback *cb);
 int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
 				struct em_data_callback *cb, cpumask_t *span);
 void em_dev_unregister_perf_domain(struct device *dev);
@@ -181,11 +179,6 @@ static inline int em_pd_nr_perf_states(struct em_perf_domain *pd)
 struct em_data_callback {};
 #define EM_DATA_CB(_active_power_cb) { }
 
-static inline int em_register_perf_domain(cpumask_t *span,
-			unsigned int nr_states, struct em_data_callback *cb)
-{
-	return -EINVAL;
-}
 static inline
 int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
 				struct em_data_callback *cb, cpumask_t *span)
diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
index 5967a21b56fc..506d3e39b553 100644
--- a/kernel/power/energy_model.c
+++ b/kernel/power/energy_model.c
@@ -500,31 +500,6 @@ static void _em_release(struct kref *ref)
 	kfree(em_dev);
 }
 
-/**
- * em_register_perf_domain() - Register the Energy Model of a performance domain
- * @span	: Mask of CPUs in the performance domain
- * @nr_states	: Number of capacity states to register
- * @cb		: Callback functions providing the data of the Energy Model
- *
- * Create Energy Model tables for a performance domain using the callbacks
- * defined in cb.
- *
- * If multiple clients register the same performance domain, all but the first
- * registration will be ignored.
- *
- * Return 0 on success
- */
-int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
-						struct em_data_callback *cb)
-{
-	struct device *cpu_dev;
-
-	cpu_dev = get_cpu_device(cpumask_first(span));
-
-	return em_dev_register_perf_domain(cpu_dev, nr_states, cb, span);
-}
-EXPORT_SYMBOL_GPL(em_register_perf_domain);
-
 /**
  * em_dev_unregister_perf_domain() - Unregister Energy Model (EM) for a device
  * @dev		: Device for which the EM is registered
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
