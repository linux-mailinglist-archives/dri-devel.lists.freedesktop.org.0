Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA2452B323
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 09:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29A8113E1B;
	Wed, 18 May 2022 07:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1206 seconds by postgrey-1.36 at gabe;
 Tue, 17 May 2022 14:07:45 UTC
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ABEA10E08B;
 Tue, 17 May 2022 14:07:44 +0000 (UTC)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L2cmp55gfzGpRD;
 Tue, 17 May 2022 21:44:42 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 17 May 2022 21:47:36 +0800
Received: from huawei.com (10.67.174.33) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 17 May
 2022 21:47:36 +0800
From: "GONG, Ruiqi" <gongruiqi1@huawei.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH -next] drm/i915: fix compilation errors caused by
 `-fsanitize=shift`
Date: Tue, 17 May 2022 21:47:33 +0000
Message-ID: <20220517214733.139446-1-gongruiqi1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.174.33]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 18 May 2022 07:13:30 +0000
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
Cc: Xiu Jianfeng <xiujianfeng@huawei.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wang Weiyang <wangweiyang2@huawei.com>, gongruiqi1@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the compilation errors produced by building recent mainline on x86
with allmodconfig:

(1st type of errors)
  drivers/gpu/drm/i915/display/intel_ddi.c:1916:2: error: case label does not reduce to an integer constant
  case PORT_CLK_SEL_WRPLL1:
  ^~~~

(2nd type of errors)
  ././include/linux/compiler_types.h:352:38: error: call to ‘__compiletime_assert_1360’ declared with attribute error: FIELD_PREP: mask is not constant
    _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                        ^
  ...
  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2316:3: note: in expansion of macro ‘FIELD_PREP’
     FIELD_PREP(GUC_KLV_0_KEY, GUC_CONTEXT_POLICIES_KLV_ID_##id) | \
     ^~~~~~~~~~
  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2323:1: note: in expansion of macro ‘MAKE_CONTEXT_POLICY_ADD’
   MAKE_CONTEXT_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
   ^~~~~~~~~~~~~~~~~~~~~~~

which are all induced by `-fsanitize=shift`.

Signed-off-by: GONG, Ruiqi <gongruiqi1@huawei.com>
---
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h |  2 +-
 .../i915/gt/uc/abi/guc_communication_ctb_abi.h   |  2 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h    |  4 ++--
 .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h    |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h       |  2 +-
 drivers/gpu/drm/i915/i915_reg.h                  | 16 ++++++++--------
 6 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
index be9ac47fa9d0..3ada7358a698 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
@@ -50,7 +50,7 @@
 
 #define HOST2GUC_SELF_CFG_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 3u)
 #define HOST2GUC_SELF_CFG_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
-#define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_KEY		(0xffff << 16)
+#define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_KEY		(0xffffu << 16)
 #define HOST2GUC_SELF_CFG_REQUEST_MSG_1_KLV_LEN		(0xffff << 0)
 #define HOST2GUC_SELF_CFG_REQUEST_MSG_2_VALUE32		GUC_HXG_REQUEST_MSG_n_DATAn
 #define HOST2GUC_SELF_CFG_REQUEST_MSG_3_VALUE64		GUC_HXG_REQUEST_MSG_n_DATAn
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
index c9086a600bce..c97ff7c38576 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
@@ -82,7 +82,7 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
 #define GUC_CTB_HDR_LEN				1u
 #define GUC_CTB_MSG_MIN_LEN			GUC_CTB_HDR_LEN
 #define GUC_CTB_MSG_MAX_LEN			256u
-#define GUC_CTB_MSG_0_FENCE			(0xffff << 16)
+#define GUC_CTB_MSG_0_FENCE			(0xffffu << 16)
 #define GUC_CTB_MSG_0_FORMAT			(0xf << 12)
 #define   GUC_CTB_FORMAT_HXG			0u
 #define GUC_CTB_MSG_0_RESERVED			(0xf << 8)
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
index 4a59478c3b5c..e811896a80a0 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
@@ -29,8 +29,8 @@
  */
 
 #define GUC_KLV_LEN_MIN				1u
-#define GUC_KLV_0_KEY				(0xffff << 16)
-#define GUC_KLV_0_LEN				(0xffff << 0)
+#define GUC_KLV_0_KEY				(0xffffu << 16)
+#define GUC_KLV_0_LEN				(0xffffu << 0)
 #define GUC_KLV_n_VALUE				(0xffffffff << 0)
 
 /**
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
index 29ac823acd4c..901595300f82 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
@@ -40,7 +40,7 @@
  */
 
 #define GUC_HXG_MSG_MIN_LEN			1u
-#define GUC_HXG_MSG_0_ORIGIN			(0x1 << 31)
+#define GUC_HXG_MSG_0_ORIGIN			(0x1u << 31)
 #define   GUC_HXG_ORIGIN_HOST			0u
 #define   GUC_HXG_ORIGIN_GUC			1u
 #define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
index 66027a42cda9..22d2c1836f65 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
@@ -28,7 +28,7 @@
 #define   GS_MIA_HALT_REQUESTED		  (0x02 << GS_MIA_SHIFT)
 #define   GS_MIA_ISR_ENTRY		  (0x04 << GS_MIA_SHIFT)
 #define   GS_AUTH_STATUS_SHIFT		30
-#define   GS_AUTH_STATUS_MASK		  (0x03 << GS_AUTH_STATUS_SHIFT)
+#define   GS_AUTH_STATUS_MASK		  (0x03u << GS_AUTH_STATUS_SHIFT)
 #define   GS_AUTH_STATUS_BAD		  (0x01 << GS_AUTH_STATUS_SHIFT)
 #define   GS_AUTH_STATUS_GOOD		  (0x02 << GS_AUTH_STATUS_SHIFT)
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 9ccb67eec1bd..8c10d66561b0 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7566,19 +7566,19 @@ enum skl_power_gate {
 #define  PORT_CLK_SEL_LCPLL_810		(2 << 29)
 #define  PORT_CLK_SEL_SPLL		(3 << 29)
 #define  PORT_CLK_SEL_WRPLL(pll)	(((pll) + 4) << 29)
-#define  PORT_CLK_SEL_WRPLL1		(4 << 29)
-#define  PORT_CLK_SEL_WRPLL2		(5 << 29)
-#define  PORT_CLK_SEL_NONE		(7 << 29)
+#define  PORT_CLK_SEL_WRPLL1		(4u << 29)
+#define  PORT_CLK_SEL_WRPLL2		(5u << 29)
+#define  PORT_CLK_SEL_NONE		(7u << 29)
 #define  PORT_CLK_SEL_MASK		(7 << 29)
 
 /* On ICL+ this is the same as PORT_CLK_SEL, but all bits change. */
 #define DDI_CLK_SEL(port)		PORT_CLK_SEL(port)
 #define  DDI_CLK_SEL_NONE		(0x0 << 28)
-#define  DDI_CLK_SEL_MG			(0x8 << 28)
-#define  DDI_CLK_SEL_TBT_162		(0xC << 28)
-#define  DDI_CLK_SEL_TBT_270		(0xD << 28)
-#define  DDI_CLK_SEL_TBT_540		(0xE << 28)
-#define  DDI_CLK_SEL_TBT_810		(0xF << 28)
+#define  DDI_CLK_SEL_MG			(0x8u << 28)
+#define  DDI_CLK_SEL_TBT_162		(0xCu << 28)
+#define  DDI_CLK_SEL_TBT_270		(0xDu << 28)
+#define  DDI_CLK_SEL_TBT_540		(0xEu << 28)
+#define  DDI_CLK_SEL_TBT_810		(0xFu << 28)
 #define  DDI_CLK_SEL_MASK		(0xF << 28)
 
 /* Transcoder clock selection */
-- 
2.17.1

