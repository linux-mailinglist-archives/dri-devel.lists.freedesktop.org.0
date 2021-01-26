Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9196304BB6
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 22:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C8F6E4D4;
	Tue, 26 Jan 2021 21:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99966E441;
 Tue, 26 Jan 2021 21:44:38 +0000 (UTC)
IronPort-SDR: dliIqAcnv56CarRt8oqIDhNWRF4ukNMhxT+z5LCYAFxyTUQeTfaxhehGGD5YT3sH7mq1gbUhg1
 lfPzJG3AdSxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="198770832"
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; d="scan'208";a="198770832"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 13:44:37 -0800
IronPort-SDR: pdeKR/xjdpNl2KwR8XT6CRTsjZqfBTuYkjMrDL/Jrs5DbJUnwWYjD7mizYUvmzpwEqsIk3YlZL
 tKEP+ihW4vJw==
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; d="scan'208";a="362139899"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 26 Jan 2021 13:44:37 -0800
From: Brian Welty <brian.welty@intel.com>
To: Brian Welty <brian.welty@intel.com>, cgroups@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Kenny Ho <Kenny.Ho@amd.com>, amd-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Eero Tamminen <eero.t.tamminen@intel.com>
Subject: [RFC PATCH 6/9] drmcg: Add memory.total file
Date: Tue, 26 Jan 2021 13:46:23 -0800
Message-Id: <20210126214626.16260-7-brian.welty@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210126214626.16260-1-brian.welty@intel.com>
References: <20210126214626.16260-1-brian.welty@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following control is introduced in order to display total memory that
exists for the DRM device. DRM drivers can advertise this value by
writing to drm_device.drmcg_props. This is needed in order to effectively
use the other memory controls.
Normally for system memory this is available to the user using procfs.

   memory.total
      Read-only value, displays total memory for a device, shown
      only in root cgroup.

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 Documentation/admin-guide/cgroup-v2.rst |  4 ++++
 include/drm/drm_cgroup.h                |  2 ++
 kernel/cgroup/drm.c                     | 10 ++++++++++
 3 files changed, 16 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 405912710b3a..ccc25f03a898 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2189,6 +2189,10 @@ MEM controller.  All memory amounts are in bytes.
         DRM device memory.  If memory usage reaches this limit,
         subsequent device memory allocations will fail.
 
+  memory.total
+        Read-only value, displays total memory for a device, shown only in
+        root cgroup.
+
 While some DRM devices may be capable to present multiple memory segments
 to the user, the intent with above controls is to aggregate all user
 allocatable backing store.  Any support for multiple memory segments is
diff --git a/include/drm/drm_cgroup.h b/include/drm/drm_cgroup.h
index 8b4c4e798b11..9ba0e372eeee 100644
--- a/include/drm/drm_cgroup.h
+++ b/include/drm/drm_cgroup.h
@@ -15,11 +15,13 @@ struct drmcg;
  * of storing per device defaults
  */
 struct drmcg_props {
+	u64 memory_total;
 };
 
 enum drmcg_res_type {
 	DRMCG_TYPE_MEM_CURRENT,
 	DRMCG_TYPE_MEM_MAX,
+	DRMCG_TYPE_MEM_TOTAL,
 	__DRMCG_TYPE_LAST,
 };
 
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index bec41f343208..08e75eb67593 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -283,6 +283,10 @@ static int drmcg_seq_show_fn(int id, void *ptr, void *data)
 		else
 			seq_printf(sf, "%ld\n", ddr->memory.max * PAGE_SIZE);
 		break;
+	case DRMCG_TYPE_MEM_TOTAL:
+		seq_printf(sf, "%d:%d %llu\n", DRM_MAJOR, minor->index,
+			   minor->dev->drmcg_props.memory_total);
+		break;
 	default:
 		seq_printf(sf, "%d:%d\n", DRM_MAJOR, minor->index);
 		break;
@@ -374,6 +378,12 @@ struct cftype files[] = {
 		.private = DRMCG_TYPE_MEM_MAX,
 		.flags = CFTYPE_NOT_ON_ROOT
 	},
+	{
+		.name = "memory.total",
+		.seq_show = drmcg_seq_show,
+		.private = DRMCG_TYPE_MEM_TOTAL,
+		.flags = CFTYPE_ONLY_ON_ROOT,
+	},
 	{ }	/* terminate */
 };
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
