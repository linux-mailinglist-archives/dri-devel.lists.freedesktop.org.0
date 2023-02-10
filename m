Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 300B3691629
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 02:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA0710EC17;
	Fri, 10 Feb 2023 01:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590AD10EC17;
 Fri, 10 Feb 2023 01:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675992089; x=1707528089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ciSXvpWlgnOs/L5NpH9BRu5QQR07nXf7EQ6ovOWBZvo=;
 b=PLeKFZXuZansVpS9mGgEPD4jkVrjAcpMYEgvA8yqhuOeNQ7F8LoKPwsM
 Nx+GeS3f/w0B/P8gLMLZIax+LjlGcmPffwg5gDjt+CRSZoyyM+T8mz6b5
 q8m2ny6jc0odAgq7B0DNgzrWa8dV26iONMHV7s19lZdK0YfmHZNFXRDa+
 +VbHflacNZHx8a338lrQ8QiMj6YEcyZM9/88iwi5fTy/3cB4tws0bnl2e
 JNPGr8krJ8EeaI4psKeX1/73oQpw2EO2n6GZgkDlpRe7qGVB8QES+BpnT
 1siM8/t4YgNSQLNxKvCJCTvkZMVLKWdsn/Vna5a8z0LK2mExtG6un5g9g A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="327997493"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; d="scan'208";a="327997493"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 17:21:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="810615756"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; d="scan'208";a="810615756"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 17:21:28 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC] drm/i915/uapi/huc: two levels of HuC authentication
Date: Thu,  9 Feb 2023 17:28:04 -0800
Message-Id: <20230210012804.2223978-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: Tony Ye <tony.ye@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Ankit Jain <ankit1.jain@intel.com>, dri-devel@lists.freedesktop.org,
 Carl Zhang <carl.zhang@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Starting on DG2, the owner of HuC authentication is the GSC FW. On MTL,
with the GSC moving into the media GT and being loaded by i915, this can
result in a significant delay in HuC readiness on init/resume. To reduce
the impact, the HuC load & authentication has been split in 2 parts:

1) The HuC is loaded via DMA and authenticated by the GuC, like on older
platforms. However, this is now considered a partial authentication and
only allows clear-media workloads.

2) After the GSC FW is loaded, the HuC is re-authenticated with a PXP
command. This is a full authentication and allows all workloads.

This way, only the protected content operations are impacted by the
GSC-introduced delay, which is not an issue because GSC is required
for those anyway.

To report the different steps to userspace, a new value is introduced
for the HuC status ioctl.

RFC: I'm asking for comments ahead of the implementation to make sure
there are no concerns with the proposed interface change. I've kept
value '1' as the "full authentication" mode because that is what it
represents on older platforms. The media driver currently checks for
value != 0, which will keep working for clear-media and allow it to
start submitting without waiting for the GSC auth, while the protected
content side of things will have to adapt to explicitly check for
value == 1 (which will work on existing platforms as well).

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Ankit Jain <ankit1.jain@intel.com>
Cc: Tony Ye <tony.ye@intel.com>
Cc: Carl Zhang <carl.zhang@intel.com>
---
 include/uapi/drm/i915_drm.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 8df261c5ab9b..8a69014f3fd9 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -659,7 +659,8 @@ typedef struct drm_i915_irq_wait {
  * If the IOCTL is successful, the returned parameter will be set to one of the
  * following values:
  *  * 0 if HuC firmware load is not complete,
- *  * 1 if HuC firmware is authenticated and running.
+ *  * 1 if HuC firmware is loaded and fully authenticated,
+ *  * 2 if HuC firmware is loaded and authenticated for clear media only
  */
 #define I915_PARAM_HUC_STATUS		 42
 
-- 
2.37.3

