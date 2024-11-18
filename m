Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CCB9D1BFC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B026F10E595;
	Mon, 18 Nov 2024 23:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOkQS1C5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CE010E582;
 Mon, 18 Nov 2024 23:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973048; x=1763509048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bj9M7C0DQr35+AV9jiUejnxNFjJG4cp8nso19AZvrOQ=;
 b=bOkQS1C5M+HtDzSp9JwtUaRFdZKNndqUYWvM88Aigmq637pUOINKxWTY
 Ne3vkv3KkUjZ9azWAp46ukWnkKZSVvfkZlxF9MYTYJB8BaQkgDPe6NWnv
 dPSCD6m+Nx+F7r+ngUQCNcgYJSvak/1Od3MYlcy7O+pFeuXy2W6P7i1Lk
 bMDtnjSVJEnBoY5zVaAuNsq7tIrKIWRuOScFXZDiFwGINb0AtnHcNKmFS
 RABPRfoIaLdCTv0Onsciv6fU1NOawjhEX1VjX8OrGIBt148Yfphgz28D8
 Xt35OueJ1I4NK2KV3/rOSzT2cN6YRCNnyYQ64SPazQT/E5GBUbSUQWoYn A==;
X-CSE-ConnectionGUID: 29zr3746SfyMXGyHThNdCQ==
X-CSE-MsgGUID: uyI2M4uIQiyx3XGdnhEbUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878970"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878970"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:28 -0800
X-CSE-ConnectionGUID: mgNJIdMKS2aiUJA+oBaMNQ==
X-CSE-MsgGUID: /DNBMEWITjSdVBd8qs2IFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521741"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 19/29] drm/xe: Do not allow usermap exec queues in exec
 IOCTL
Date: Mon, 18 Nov 2024 15:37:47 -0800
Message-Id: <20241118233757.2374041-20-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233757.2374041-1-matthew.brost@intel.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
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

Not supported at the moment, may need something in the no doorbells
available.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 31cca938956f..898e4718d639 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -132,7 +132,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (XE_IOCTL_DBG(xe, !q))
 		return -ENOENT;
 
-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM)) {
+	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM ||
+			 xe_exec_queue_is_usermap(q))) {
 		err = -EINVAL;
 		goto err_exec_queue;
 	}
-- 
2.34.1

