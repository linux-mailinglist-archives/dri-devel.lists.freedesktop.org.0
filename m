Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC27A3A8AC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 21:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E9210E754;
	Tue, 18 Feb 2025 20:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ib1GBplw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0971E10E122;
 Tue, 18 Feb 2025 20:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739910268; x=1771446268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w48Vj/xXdRRKDK7S0uyfSciQMTM5hICF6ShJAQc5FEk=;
 b=ib1GBplwLfjqCHfWT667CjrUyLz8TAKaRkhVSJ09JZHSi6izW+omT0D/
 +ARsggqlDuoSOqUOQva/tdz4j7IES7YJWU0Roy+s8FdhRebATcYqjXkFw
 SdCXPahEMagzyjy4MV1/LIZIdsCq2F1iJFGeY6jipFBwyl2cCTJiB/2CY
 +XwqorGvJh7awqR83FZiyf4JcwTB3MSHNN+QyX1xCx8jH9PJ4plX+WAXJ
 msS5ddvpMQiyXfLdmcs20XbayGfQTGD62PjOWz3Yjyn2mpH7+b4PH798x
 AvmQ9orlPzvNqBVEkh6ewVgbvv6WtYjaKhyoNc2ff4kGYUB3ZqiThnYEg w==;
X-CSE-ConnectionGUID: WEZeV/0vQWm//qLEVwghhw==
X-CSE-MsgGUID: x2Pbbl90QeGZvfdR/jg3/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40836885"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40836885"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:24:28 -0800
X-CSE-ConnectionGUID: IoksRSojRAK7c8hLVud+xQ==
X-CSE-MsgGUID: MOAQc19BQGuDpNNt6c25Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114431709"
Received: from dut4066lnl.fm.intel.com ([10.105.8.64])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:24:28 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, tvrtko.ursulin@linux.intel.com,
 lucas.demarch@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch
Subject: [PATCH v2 1/6] drm/xe/xe_exec_queue: Add ID param to exec queue struct
Date: Tue, 18 Feb 2025 20:24:21 +0000
Message-ID: <20250218202426.103151-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218202426.103151-1-jonathan.cavitt@intel.com>
References: <20250218202426.103151-1-jonathan.cavitt@intel.com>
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

Add the exec queue id to the exec queue struct.  This is useful for
performing a reverse lookup into the xef->exec_queue xarray.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6051db78d706..a02e62465e01 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -711,6 +711,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (err)
 		goto kill_exec_queue;
 
+	q->id = id;
 	args->exec_queue_id = id;
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 6eb7ff091534..088d838218e9 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -55,6 +55,8 @@ struct xe_exec_queue {
 	struct xe_vm *vm;
 	/** @class: class of this exec queue */
 	enum xe_engine_class class;
+	/** @id: exec queue ID as reported during create ioctl */
+	u32 id;
 	/**
 	 * @logical_mask: logical mask of where job submitted to exec queue can run
 	 */
-- 
2.43.0

