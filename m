Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFfDGOFvjGlmngAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 13:02:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF6A1240D0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 13:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A2610E04C;
	Wed, 11 Feb 2026 12:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rke7Uqjb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD8110E04C;
 Wed, 11 Feb 2026 12:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770811351; x=1802347351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ICp1Wbk/vqTW08lQDuqrjDhgeA/Oyzt07UaYdtQ/Bmg=;
 b=Rke7UqjbrBCHNcUXHPEaTGcOdU/jMr8rhgKVx0SCINL2DBOi5dq05WfX
 pVceBhyKpIOIH9b5wZlwUOtxxh1mRWFAywtz6/Sl+feCAt+SThVS6X+61
 xZ15CLtSJlmgEAo8CzPehpbYhnIgq9YBumgPi9Zo8pxlnC5br/edutEC3
 CFeETgcfY09Fzbn0682b9HI4yfBXpHSqq7CaZ3S+L6nD9WiZVgEgnO5uM
 IEyDjsZphGcCeH0w5eLF45uUQ2jKALq/mJ2zM8Z5OtnTN6Uu9s5OiQH9C
 Zrbs/+xtmhv6Wx5aqsLCvNZkxX3QJbR8+uaqzEmHET/4Vka7VrVVmjTdp A==;
X-CSE-ConnectionGUID: gzKFPpidTqy2jmpWMN2XtA==
X-CSE-MsgGUID: kM9ZrvhTR46YcCCn4es0Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71854627"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71854627"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 04:01:49 -0800
X-CSE-ConnectionGUID: TxSRGyQLQByo/nfX4Jkm8w==
X-CSE-MsgGUID: NF8lgwnxQx6jvjTvXqeqqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="235210710"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 11 Feb 2026 04:01:45 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Cc: andrealmeid@igalia.com, christian.koenig@amd.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, mripard@kernel.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 1/4] drm: Add DRM_WEDGE_RECOVERY_COLD_RESET for critical error
Date: Wed, 11 Feb 2026 17:29:48 +0530
Message-ID: <20260211115946.2014051-7-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211115946.2014051-6-mallesh.koujalagi@intel.com>
References: <20260211115946.2014051-6-mallesh.koujalagi@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[igalia.com,amd.com,gmail.com,ffwll.ch,kernel.org,intel.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mallesh.koujalagi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RSPAMD_EMAILBL_FAIL(0.00)[mallesh.koujalagi.intel.com:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3BF6A1240D0
X-Rspamd-Action: no action

Introduce DRM_WEDGE_RECOVERY_COLD_RESET (BIT(4)) recovery method to
handle critical errors requiring complete device power cycling.

This method addresses scenarios where recovery mechanisms
(driver reload, PCIe reset, etc.) are insufficient to restore
device functionality. When set, it indicates to userspace that
only a full cold reset can recover the device from its current error
state. The cold reset method serves as a last resort for critical
errors.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 2 ++
 include/drm/drm_device.h  | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 2915118436ce..48d269d470a3 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -534,6 +534,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
 		return "bus-reset";
 	case DRM_WEDGE_RECOVERY_VENDOR:
 		return "vendor-specific";
+	case DRM_WEDGE_RECOVERY_COLD_RESET:
+		return "cold-reset";
 	default:
 		return NULL;
 	}
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index bc78fb77cc27..3e386eb42023 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -37,6 +37,7 @@ struct pci_controller;
 #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
 #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
 #define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
+#define DRM_WEDGE_RECOVERY_COLD_RESET	BIT(4)	/* full device cold reset */
 
 /**
  * struct drm_wedge_task_info - information about the guilty task of a wedge dev
-- 
2.34.1

