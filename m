Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8028C390A
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 00:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DEB10E1D2;
	Sun, 12 May 2024 22:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CLIOQ/wN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BA510E1D5
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2024 22:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i3tp4S88BS9+8er2YCb9N/IOKidcnTZV2ZIdUw54Gx0=; b=CLIOQ/wNYFJM6iCIr4698F80xx
 2Bh6y6j8U91WUMWaAqM7hwlyVGat0MT2yJU0XhZANAmkvyjW7zp14QYxXv/6DuZu3gEiUYoLcecoE
 IUDdCbb9ITTdo1IY2Ax8LonCdiFlZX+1vmtojtLB1kTHb84LaamkEMq4T43T9B8V92AQuJ6lMuSmT
 6Jt2LKfGtL2j6xWJVeV3d02qumvmU7Bbq9JqhLJkoC5UrdNl3osnBQ7JIAZqqCn825iuNFZiTE6wT
 Gx+OdNvIhr/EbWcFXrBJ6Eq9GoFmAUSFdnif1+RGXkK1VSim92ncQH2eQZhxal5omtMz7KQe1jWpT
 J9IOZpAQ==;
Received: from [191.57.26.163] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s6HfM-006v7c-Vb; Mon, 13 May 2024 00:27:37 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 =?UTF-8?q?Juan=20A=20=2E=20Su=C3=A1rez?= <jasuarez@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v2 6/6] drm/v3d: Deprecate the use of the Performance Counters
 enum
Date: Sun, 12 May 2024 19:23:29 -0300
Message-ID: <20240512222655.2792754-7-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240512222655.2792754-1-mcanal@igalia.com>
References: <20240512222655.2792754-1-mcanal@igalia.com>
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

The Performance Counters enum used to identify the index of each
performance counter and provide the total number of performance
counters (V3D_PERFCNT_NUM). But, this enum is only valid for V3D 4.2,
not for V3D 7.1.

As we implemented a new flexible structure to retrieve performance
counters information, we can deprecate this enum.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
---
 include/uapi/drm/v3d_drm.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index 0860ddb3d0b6..87fc5bb0a61e 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -603,6 +603,16 @@ struct drm_v3d_submit_cpu {
 	__u64 extensions;
 };
 
+/* The performance counters index represented by this enum are deprecated and
+ * must no longer be used. These counters are only valid for V3D 4.2.
+ *
+ * In order to check for performance counter information,
+ * use DRM_IOCTL_V3D_PERFMON_GET_COUNTER.
+ *
+ * Don't use V3D_PERFCNT_NUM to retrieve the maximum number of performance
+ * counters. You should use DRM_IOCTL_V3D_GET_PARAM with the following
+ * parameter: DRM_V3D_PARAM_MAX_PERF_COUNTERS.
+ */
 enum {
 	V3D_PERFCNT_FEP_VALID_PRIMTS_NO_PIXELS,
 	V3D_PERFCNT_FEP_VALID_PRIMS,
-- 
2.44.0

