Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 555A4C84765
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 11:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EF010E3A7;
	Tue, 25 Nov 2025 10:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoezXV1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A3710E3A7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 10:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764066333; x=1795602333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RcXOZ6f5YvzXegbPptRJBHLwVJRwQC+1Fs2NjEA60CM=;
 b=XoezXV1mBhltD1ngYfcuInN/DLFp5/D/1tCXYp91y+oYwivYoQLq4dJw
 RjYijC7VvVLbVEoz6iZNt5lnxRM6uVET4B7nRANSVmvIUyOu3w6h76bnM
 dxJtBAiyJP5uQPqK92f0cRKqKe7KC+gKCLFjhgbkJqCQVjk/WR8kozE3/
 TCvd81DtbIo7FdpXhs8ROZhi3mhG2P67oA/5nPwSEV6n0zRb8ICNkX8qD
 LE/m8jLjUge99OwgPAZIJJSVghWGZj/rME5mzdeLt0OHk1UxovAbFhJ87
 6vJI3mXxLPvjR5zIdEF+uZgq1LYx6fmnbU3dH+hC4MFxN0gs6wAXNo64W Q==;
X-CSE-ConnectionGUID: QOiZGL/cSBa+nGZ8naECKQ==
X-CSE-MsgGUID: kXn9dJzhSj6asDKx/De8qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66123686"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="66123686"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:25:32 -0800
X-CSE-ConnectionGUID: nXhX/n12QD6QRoQd62jSng==
X-CSE-MsgGUID: 4XRYJlOWTuylXzQXWQ4SLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="197081579"
Received: from jsokolow-alderlakeclientplatform.igk.intel.com ([172.28.176.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:25:29 -0800
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 David Francis <David.Francis@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/1] drm: disallow setting 0 as new handle in
 DRM_IOCTL_GEM_CHANGE_HANDLE
Date: Tue, 25 Nov 2025 11:28:45 +0100
Message-ID: <20251125102847.904357-2-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125102847.904357-1-jan.sokolowski@intel.com>
References: <20251125102847.904357-1-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

drm_file's object_idr uses 1 as base value, which can cause id
mismatch when trying to use DRM_IOCTL_GEM_CHANGE_HANDLE
to change id from 1 to 0.

Disallow 0 as new handle in that ioctl.

Fixes: 53096728b891 ("drm: Add DRM prime interface to reassign GEM handle")
Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: David Francis <David.Francis@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/drm_gem.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 68168d58a7c8..2a49a8e396fa 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -975,6 +975,10 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
 	if (args->handle == args->new_handle)
 		return 0;
 
+	/* As the idr base is 1, trying to set handle 0 will create id mismatch */
+	if (args->new_handle == 0)
+		return 0;
+
 	mutex_lock(&file_priv->prime.lock);
 
 	spin_lock(&file_priv->table_lock);
-- 
2.43.0

