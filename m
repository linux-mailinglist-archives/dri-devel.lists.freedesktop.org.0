Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F7F258E3F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 14:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA336E445;
	Tue,  1 Sep 2020 12:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E6F6E426;
 Tue,  1 Sep 2020 12:32:35 +0000 (UTC)
IronPort-SDR: Q7QA00jr2u5lGYaqqescYIgAJDCgfoYtJF64+dP4RqL+klwFxti6Imbj0QQl+nEBUxCyQVu+zx
 dEwSk8JgVRZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="158157457"
X-IronPort-AV: E=Sophos;i="5.76,379,1592895600"; d="scan'208";a="158157457"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 05:32:32 -0700
IronPort-SDR: csHmgCL3y2+/hiPxTON1Cf0koylB6CGy43LyI/w5dY+Re4g1LqLlmfXQp4qUVWiVXe/KYkBqMQ
 c2B0GcQf9KZg==
X-IronPort-AV: E=Sophos;i="5.76,379,1592895600"; d="scan'208";a="325326231"
Received: from kgeneral-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.251.95.121])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 05:32:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/dp: start using more of the extended receiver caps
Date: Tue,  1 Sep 2020 15:32:26 +0300
Message-Id: <20200901123226.4177-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: jani.nikula@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the future, we'll be needing more of the extended receiver capability
field starting at DPCD address 0x2200. (Specifically, we'll need main
link channel coding cap for DP 2.0.) Start using it now to not miss out
later on.

Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

I guess this can be merged after the topic branch to drm-misc-next or
so, but I'd prefer to have this fairly early on to catch any potential
issues.
---
 drivers/gpu/drm/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 1e7c638873c8..3a3c238452df 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -436,7 +436,7 @@ static u8 drm_dp_downstream_port_count(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
 					  u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
-	u8 dpcd_ext[6];
+	u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
 	int ret;
 
 	/*
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
