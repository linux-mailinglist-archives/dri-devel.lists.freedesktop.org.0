Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE058792D8B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 20:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D6010E316;
	Tue,  5 Sep 2023 18:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D48510E1A7;
 Tue,  5 Sep 2023 18:45:46 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 69C5266071F8;
 Tue,  5 Sep 2023 19:45:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693939544;
 bh=40cxse3JQ9cf/lsBsQtEwOdtU5azU2vw7zoB5H2GdF8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U4d860lZYNiD+uQ8PYYCwqyD/zDNxDDoQ0nDrUu6G9IPoMKqJv/w0xhHnn9o6E6FS
 fEBvzZNPX63Fj8NAYMM2W5e1lne8Wf9EexMYLOGpVmaYuYv0hgkX8teD4bZgrS/iyv
 64cIa0uZYV+84JB5wwK7y+LL7C1hV4WT2ee/41Uyzh3hdg5jDrCwhbaldfA33z/+XP
 JQ0bIfhLJOdV5gwSNXv2/kqJxCHH+Z/pLOFBnH9YAom5aB0i11qLux0FvJHqoJahXQ
 DSUbjOKV4TXe00lnjrFtfnGAPHBTZLv72n7aR/WraPtJ5w3tF/zxJSLpsbgj/0e9oM
 GlwImsrKAX+Og==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
Subject: [PATCH v3 1/8] drm/panfrost: Add cycle count GPU register definitions
Date: Tue,  5 Sep 2023 19:45:17 +0100
Message-ID: <20230905184533.959171-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230905184533.959171-1-adrian.larumbe@collabora.com>
References: <20230905184533.959171-1-adrian.larumbe@collabora.com>
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
Cc: linux-arm-msm@vger.kernel.org, adrian.larumbe@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 healych@amazon.com, Boris Brezillon <boris.brezillon@collabora.com>,
 kernel@collabora.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These GPU registers will be used when programming the cycle counter, which
we need for providing accurate fdinfo drm-cycles values to user space.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_regs.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index 919f44ac853d..55ec807550b3 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -46,6 +46,8 @@
 #define   GPU_CMD_SOFT_RESET		0x01
 #define   GPU_CMD_PERFCNT_CLEAR		0x03
 #define   GPU_CMD_PERFCNT_SAMPLE	0x04
+#define   GPU_CMD_CYCLE_COUNT_START	0x05
+#define   GPU_CMD_CYCLE_COUNT_STOP	0x06
 #define   GPU_CMD_CLEAN_CACHES		0x07
 #define   GPU_CMD_CLEAN_INV_CACHES	0x08
 #define GPU_STATUS			0x34
@@ -73,6 +75,9 @@
 #define GPU_PRFCNT_TILER_EN		0x74
 #define GPU_PRFCNT_MMU_L2_EN		0x7c
 
+#define GPU_CYCLE_COUNT_LO		0x90
+#define GPU_CYCLE_COUNT_HI		0x94
+
 #define GPU_THREAD_MAX_THREADS		0x0A0	/* (RO) Maximum number of threads per core */
 #define GPU_THREAD_MAX_WORKGROUP_SIZE	0x0A4	/* (RO) Maximum workgroup size */
 #define GPU_THREAD_MAX_BARRIER_SIZE	0x0A8	/* (RO) Maximum threads waiting at a barrier */
-- 
2.42.0

