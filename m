Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D51D87A43FD
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 10:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290BB10E19D;
	Mon, 18 Sep 2023 08:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A07C10E19D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 08:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695024628; x=1726560628;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=nzvv6eDUMuWEVi9A5kctA5+LBLiff1ltxVOjQscs/XM=;
 b=AeJUesqPUvyew1vBIkkIburP6BnZUNqWtQFngTPU12rBaCQyhdGsQZjd
 6ZS6uj+96NUnKUaSfTPsZ6OqAAx+6CD8+82zF0+iHosYtNN8j8o/HrNBG
 Ayk1XUo4BB2QKOPY5TXKV1AVduDIaa4dohh5p09G0K3UKoBMNXJwQtg9x
 ye5Nd2ktF1UGyVkrz3IC26aMi1z/cJNlFU8IlMtcYmlOMj5jK8wsyMYpy
 k5qSYuuD00TqLg2XmzzUzVo/Fe5kI4x6C1V/90+jino6Lj2NOLBcFulNS
 gubJpHdSKQAttlYg/zWCV4xDHxqYEPXJqOPi0o8u9AIzU1e5/zRYNrowF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="410550866"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="410550866"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 01:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="695442273"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="695442273"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
 by orsmga003.jf.intel.com with ESMTP; 18 Sep 2023 01:10:19 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: rafael@kernel.org, len.brown@intel.com, pavel@ucw.cz,
 Jonathan.Cameron@huawei.com, paul@crapouillou.net,
 andriy.shevchenko@linux.intel.com, lars@metafoo.de, rmfrfs@gmail.com,
 jean-baptiste.maneyrol@tdk.com, lee@kernel.org,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com
Subject: [PATCH for-next v2 01/10] PM: Introduce export macros for _SIMPLE_
 variants of _PM_OPS()
Date: Mon, 18 Sep 2023 13:39:42 +0530
Message-Id: <20230918080951.3615-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230918080951.3615-1-raag.jadav@intel.com>
References: <20230918080951.3615-1-raag.jadav@intel.com>
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
Cc: linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 patches@opensource.cirrus.com, mallikarjunappa.sangannavar@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bala.senthil@intel.com, Raag Jadav <raag.jadav@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce a new set of export macros for _SIMPLE_ variants of _PM_OPS(),
which export dev_pm_ops symbol only in case CONFIG_PM_SLEEP=y and discard
it otherwise.

Fixes: 34e1ed189fab ("PM: Improve EXPORT_*_DEV_PM_OPS macros")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 include/linux/pm.h | 43 +++++++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/include/linux/pm.h b/include/linux/pm.h
index 1400c37b29c7..6e7ab6950ad1 100644
--- a/include/linux/pm.h
+++ b/include/linux/pm.h
@@ -374,24 +374,39 @@ const struct dev_pm_ops name = { \
 	RUNTIME_PM_OPS(runtime_suspend_fn, runtime_resume_fn, idle_fn) \
 }
 
-#ifdef CONFIG_PM
-#define _EXPORT_DEV_PM_OPS(name, license, ns)				\
+#define _EXPORT_PM_OPS(name, license, ns)				\
 	const struct dev_pm_ops name;					\
 	__EXPORT_SYMBOL(name, license, ns);				\
 	const struct dev_pm_ops name
-#define EXPORT_PM_FN_GPL(name)		EXPORT_SYMBOL_GPL(name)
-#define EXPORT_PM_FN_NS_GPL(name, ns)	EXPORT_SYMBOL_NS_GPL(name, ns)
-#else
-#define _EXPORT_DEV_PM_OPS(name, license, ns)				\
+
+#define _PM_OPS(name, license, ns)					\
 	static __maybe_unused const struct dev_pm_ops __static_##name
+
+#ifdef CONFIG_PM
+#define _EXPORT_RUNTIME_PM_OPS(name, license, ns)	_EXPORT_PM_OPS(name, license, ns)
+#define EXPORT_PM_FN_GPL(name)				EXPORT_SYMBOL_GPL(name)
+#define EXPORT_PM_FN_NS_GPL(name, ns)			EXPORT_SYMBOL_NS_GPL(name, ns)
+#else
+#define _EXPORT_RUNTIME_PM_OPS(name, license, ns)	_PM_OPS(name, license, ns)
 #define EXPORT_PM_FN_GPL(name)
 #define EXPORT_PM_FN_NS_GPL(name, ns)
 #endif
 
-#define EXPORT_DEV_PM_OPS(name) _EXPORT_DEV_PM_OPS(name, "", "")
-#define EXPORT_GPL_DEV_PM_OPS(name) _EXPORT_DEV_PM_OPS(name, "GPL", "")
-#define EXPORT_NS_DEV_PM_OPS(name, ns) _EXPORT_DEV_PM_OPS(name, "", #ns)
-#define EXPORT_NS_GPL_DEV_PM_OPS(name, ns) _EXPORT_DEV_PM_OPS(name, "GPL", #ns)
+#ifdef CONFIG_PM_SLEEP
+#define _EXPORT_SIMPLE_PM_OPS(name, license, ns)	_EXPORT_PM_OPS(name, license, ns)
+#else
+#define _EXPORT_SIMPLE_PM_OPS(name, license, ns)	_PM_OPS(name, license, ns)
+#endif
+
+#define EXPORT_DEV_PM_OPS(name)				_EXPORT_RUNTIME_PM_OPS(name, "", "")
+#define EXPORT_GPL_DEV_PM_OPS(name)			_EXPORT_RUNTIME_PM_OPS(name, "GPL", "")
+#define EXPORT_NS_DEV_PM_OPS(name, ns)			_EXPORT_RUNTIME_PM_OPS(name, "", #ns)
+#define EXPORT_NS_GPL_DEV_PM_OPS(name, ns)		_EXPORT_RUNTIME_PM_OPS(name, "GPL", #ns)
+
+#define EXPORT_SIMPLE_PM_OPS(name)			_EXPORT_SIMPLE_PM_OPS(name, "", "")
+#define EXPORT_GPL_SIMPLE_PM_OPS(name)			_EXPORT_SIMPLE_PM_OPS(name, "GPL", "")
+#define EXPORT_NS_SIMPLE_PM_OPS(name, ns)		_EXPORT_SIMPLE_PM_OPS(name, "", #ns)
+#define EXPORT_NS_GPL_SIMPLE_PM_OPS(name, ns)		_EXPORT_SIMPLE_PM_OPS(name, "GPL", #ns)
 
 /*
  * Use this if you want to use the same suspend and resume callbacks for suspend
@@ -404,19 +419,19 @@ const struct dev_pm_ops name = { \
 	_DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL)
 
 #define EXPORT_SIMPLE_DEV_PM_OPS(name, suspend_fn, resume_fn) \
-	EXPORT_DEV_PM_OPS(name) = { \
+	EXPORT_SIMPLE_PM_OPS(name) = { \
 		SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
 	}
 #define EXPORT_GPL_SIMPLE_DEV_PM_OPS(name, suspend_fn, resume_fn) \
-	EXPORT_GPL_DEV_PM_OPS(name) = { \
+	EXPORT_GPL_SIMPLE_PM_OPS(name) = { \
 		SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
 	}
 #define EXPORT_NS_SIMPLE_DEV_PM_OPS(name, suspend_fn, resume_fn, ns)	\
-	EXPORT_NS_DEV_PM_OPS(name, ns) = { \
+	EXPORT_NS_SIMPLE_PM_OPS(name, ns) = { \
 		SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
 	}
 #define EXPORT_NS_GPL_SIMPLE_DEV_PM_OPS(name, suspend_fn, resume_fn, ns)	\
-	EXPORT_NS_GPL_DEV_PM_OPS(name, ns) = { \
+	EXPORT_NS_GPL_SIMPLE_PM_OPS(name, ns) = { \
 		SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
 	}
 
-- 
2.17.1

