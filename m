Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CDA495453
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 19:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75F510ECF8;
	Thu, 20 Jan 2022 18:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5574410EC67;
 Thu, 20 Jan 2022 18:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642704165; x=1674240165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G0SjvEPz9Yi1Ks09ajSxEJXu0p1pV6Y1ejfsZNZjrl4=;
 b=jF8vBeJNbFnWZvwnmHxKr3miDr8XM9BB879Pjiej3TqNnIL1ql6Hb82r
 vrNWv2wN+PBCU6ZBdpCrGb4USUrJqQe3DtTguM199tjxIIi5U8HAcInCh
 ypf4Vtmr0B4oLKLS91Q0+Kg1lCpBtJI9gzbhpenngHd6R1sToeocg3Cf7
 /nLJ1kA2NC/gkqUFWrYZc5zgumSjhpWpWam/6qbPZh8wyH6IettMpilWm
 ycYPySKpvwzu2YMmVY3wz06GAxrIU5FXOEJEi2orl1p/iqGe2MbhyQuBo
 VW1gWpKzgBchQ0w9dkkUJW2zDiqNSzX38dtpwdiZyHu/oIUwoMFPsrkVC g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245220044"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="245220044"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 10:42:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="626416208"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 10:42:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/i915/guc: Print CT descriptor status in CT debug
 function
Date: Thu, 20 Jan 2022 10:36:55 -0800
Message-Id: <20220120183655.3228-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120183655.3228-1-matthew.brost@intel.com>
References: <20220120183655.3228-1-matthew.brost@intel.com>
MIME-Version: 1.0
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 michal.wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Noticed that the CT descriptor status was not printed in the CT debug
function, add that in.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 948cf31429412..5df2e3413796e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -1219,10 +1219,14 @@ void intel_guc_ct_print_info(struct intel_guc_ct *ct,
 		   ct->ctbs.send.desc->head);
 	drm_printf(p, "Tail: %u\n",
 		   ct->ctbs.send.desc->tail);
+	drm_printf(p, "Status: %u\n",
+		   ct->ctbs.send.desc->status);
 	drm_printf(p, "G2H Space: %u\n",
 		   atomic_read(&ct->ctbs.recv.space) * 4);
 	drm_printf(p, "Head: %u\n",
 		   ct->ctbs.recv.desc->head);
 	drm_printf(p, "Tail: %u\n",
 		   ct->ctbs.recv.desc->tail);
+	drm_printf(p, "Status: %u\n",
+		   ct->ctbs.recv.desc->status);
 }
-- 
2.34.1

