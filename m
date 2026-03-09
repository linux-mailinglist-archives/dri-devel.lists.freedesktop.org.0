Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIm+KqmSrml0GQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:28:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8F423626D
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588FF10E4C6;
	Mon,  9 Mar 2026 09:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AylozAGT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8830710E4C3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 09:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773048487; x=1804584487;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tMJ8YyM4FKrrTQW6FdpVZ4xA6D8X7PouVqOFMWYS9lc=;
 b=AylozAGTyJob9lKyp2f4bVaRxdMXBoH0FqyUh902Jt2DZlWrTrtuarUO
 AIftfoB6znrvO9+lACN5VWsRZyY8eTmwsSf2SUhHg9usxXBPTb3AiwnYN
 M91/tRHsp4LhZ4vTzKv7Fs5ZTWU91Q7SDkSkD+l8icat2fWXipHOx3AbJ
 jxEym3L8kfntelLUEM/+L6ksarusjlB5F47kkip0+9UYvI5FcmvpXyhFL
 e0eTAZdeIkCRRuUSCwtHD66FSeGWL28NxskEp8U93QDcW4sFqsMk9k4rN
 q9u6JkAPPqcZZhIJy0iEWMlfXMZr0eD8aL3KoCDoipwdRopXPAJEfa5PU Q==;
X-CSE-ConnectionGUID: oncOxUCtRha+nAL7UV2vfQ==
X-CSE-MsgGUID: v5c/3+ZGSam8d6der38jjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74111883"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="74111883"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:28:07 -0700
X-CSE-ConnectionGUID: NCrmYgh0Rn2EzfddZ+7V7A==
X-CSE-MsgGUID: zkdkyj5ZSBeXgZIBgyQOVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="218837556"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:28:04 -0700
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 andrzej.kacprowski@linux.intel.com, tzimmermann@suse.de,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Test for imported buffers with
 drm_gem_is_imported()
Date: Mon,  9 Mar 2026 10:27:55 +0100
Message-ID: <20260309092755.3165130-1-karol.wachowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 5A8F423626D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,linux.intel.com,amd.com,suse.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[karol.wachowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,intel.com:email]
X-Rspamd-Action: no action

Instead of testing import_attach for imported GEM buffers, invoke
drm_gem_is_imported() to do the test. The test itself does not change.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 98b9ce26962b..8009965286e0 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -48,7 +48,7 @@ static struct sg_table *ivpu_bo_map_attachment(struct ivpu_device *vdev, struct
 {
 	struct sg_table *sgt;
 
-	drm_WARN_ON(&vdev->drm, !bo->base.base.import_attach);
+	drm_WARN_ON(&vdev->drm, !drm_gem_is_imported(&bo->base.base));
 
 	ivpu_bo_lock(bo);
 
@@ -157,7 +157,7 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
 	}
 
 	if (bo->base.sgt) {
-		if (bo->base.base.import_attach) {
+		if (drm_gem_is_imported(&bo->base.base)) {
 			dma_buf_unmap_attachment(bo->base.base.import_attach,
 						 bo->base.sgt, DMA_BIDIRECTIONAL);
 		} else {
-- 
2.43.0

