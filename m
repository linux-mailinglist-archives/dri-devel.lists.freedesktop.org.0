Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AEB375B1E
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 21:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45E76EDFB;
	Thu,  6 May 2021 18:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4346ECFE;
 Thu,  6 May 2021 18:57:12 +0000 (UTC)
IronPort-SDR: VwJ5vyUhXuxA6F+EXZZs5BCqxte9/eHkyLkKcEcp+qPFYBWXLm6nP4888vBWVSCnhmqQsp64oT
 BEevCq2T9TaQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196531004"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196531004"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:11 -0700
IronPort-SDR: 3mVkr/XqKzL+f69WEGxPp7szt/eeU1+gNKHhCs2BCzMRuJ457Tba/9DTcrZZGoe48t11azTrrq
 j8txlvMdifHw==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583464"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 35/97] drm/i915/guc: Improve error message for unsolicited
 CT response
Date: Thu,  6 May 2021 12:13:49 -0700
Message-Id: <20210506191451.77768-36-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Improve the error message when a unsolicited CT response is received by
printing fence that couldn't be found, the last fence, and all requests
with a response outstanding.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 217ab3ebd1af..a76603537fa8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -703,12 +703,16 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 		found = true;
 		break;
 	}
-	spin_unlock_irqrestore(&ct->requests.lock, flags);
-
 	if (!found) {
 		CT_ERROR(ct, "Unsolicited response (fence %u)\n", fence);
-		return -ENOKEY;
+		CT_ERROR(ct, "Could not find fence=%u, last_fence=%u\n", fence,
+			 ct->requests.last_fence);
+		list_for_each_entry(req, &ct->requests.pending, link)
+			CT_ERROR(ct, "request %u awaits response\n",
+				 req->fence);
+		err = -ENOKEY;
 	}
+	spin_unlock_irqrestore(&ct->requests.lock, flags);
 
 	if (unlikely(err))
 		return err;
-- 
2.28.0

