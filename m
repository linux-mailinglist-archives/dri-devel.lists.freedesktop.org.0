Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE035154E8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 21:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3264710EF2D;
	Fri, 29 Apr 2022 19:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C591810EF2D
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 19:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651262128; x=1682798128;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L+bB5VG7en+mvHiYzW/hL0EPJC9CFmfyr3aZpk0g7F0=;
 b=fA9tXvinwJV1Uh4H6O1QBlnVnVEwNGvgnLxHWsutMeNZBMXSJvJ2qLAf
 WD8RuP3/950TF4Z1098/XZFmdXRzRKxDXbKqqJ/sCLblGLB2kjtRQnRlb
 KAwoAcg2lQc30fo57O77VWxxVzzqUhMBs0U49cyQ7yFAXtF+KUMiFpVSr E=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 29 Apr 2022 12:55:27 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 12:55:27 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Apr 2022 12:55:26 -0700
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Apr 2022 12:55:25 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm: drm_gem.h: Add explicit includes for DEFINE_DRM_GEM_FOPS
Date: Fri, 29 Apr 2022 13:55:12 -0600
Message-ID: <1651262112-29664-1-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DEFINE_DRM_GEM_FOPS() references drm functions from other headers.  For
example drm_open() is defined in drm_file.h and drm_ioctl() is defined
in drm_ioctl.h.  Since drm_gem.h doesn't include these headers, it
relies on an implicit include from the .c file to have included these
required headers before DEFINE_DRM_GEM_FOPS() gets used.  Relying on
these implicit includes can cause build failures for new code that
doesn't know about these requirements, and can lead to future problems
if the headers ever get restructured as there will be a need to update
every downstream file that includes drm_gem.h.

Lets fix this explicitly including the required headers in drm_gem.h so
that code that includes drm_gem.h does not need to worry about these
implicit dependencies.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 include/drm/drm_gem.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 9d7c61a..1cbe3d8 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -37,6 +37,8 @@
 #include <linux/kref.h>
 #include <linux/dma-resv.h>
 
+#include <drm/drm_file.h>
+#include <drm/drm_ioctl.h>
 #include <drm/drm_vma_manager.h>
 
 struct iosys_map;
-- 
2.7.4

