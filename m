Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B18CD7632
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 23:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372AA10E036;
	Mon, 22 Dec 2025 22:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j+3n0IcO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A18D10E036
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 22:57:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C7E15436FE;
 Mon, 22 Dec 2025 22:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514A6C4CEF1;
 Mon, 22 Dec 2025 22:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766444240;
 bh=3+5GeS8/OYU69k/uHui0TVDmtpR9iplT3VIctDIIIxQ=;
 h=From:To:Cc:Subject:Date:From;
 b=j+3n0IcO31KBuV9byyn8tf4tROU6MFboyNWJw7b5Mb45mT4jodFt5QtVfZa7r2H6/
 6lleKgy0fp2cVIYBlEUtNC7Wu/TT/hJnPIti7+BwscJy/g+xJ1y1l+t9AZA9zn57Wz
 VRr4knOEcJFxi2r1MoKyCh7Oh4iBSeZEF4KAE+YUvPBmOhfKKULyuKbDMV1BR4xiIF
 SlylHh8dDf0oNVdxvd6Byce5WjnDhEaqaRuYloTN4cFc54PNu1A9wuZpcjrympUQwO
 VO4zYfBLcz8OWer3RmBqjgnTkSPmxrXFV6IVnk88PoCoFweF9buPaPPckZ0u01l4NL
 jgcLx3K6bkiLw==
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 James Clark <james.clark@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 01/11] tools headers: Sync UAPI drm/drm.h with kernel sources
Date: Mon, 22 Dec 2025 14:57:06 -0800
Message-ID: <20251222225716.3565649-1-namhyung@kernel.org>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
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

To pick up changes from:

  179ab8e7d7b378f1 ("drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE")

This should be used to beautify DRM syscall arguments and it addresses
these tools/perf build warnings:

  Warning: Kernel ABI header differences:
    diff -u tools/include/uapi/drm/drm.h include/uapi/drm/drm.h

Please see tools/include/README.kernel-copies.

Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 tools/include/uapi/drm/drm.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/include/uapi/drm/drm.h b/tools/include/uapi/drm/drm.h
index 3cd5cf15e3c9ce22..27cc159c1d275c7a 100644
--- a/tools/include/uapi/drm/drm.h
+++ b/tools/include/uapi/drm/drm.h
@@ -906,6 +906,21 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
 
+/**
+ * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
+ *
+ * If set to 1 the DRM core will allow setting the COLOR_PIPELINE
+ * property on a &drm_plane, as well as drm_colorop properties.
+ *
+ * Setting of these plane properties will be rejected when this client
+ * cap is set:
+ * - COLOR_ENCODING
+ * - COLOR_RANGE
+ *
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ */
+#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
-- 
2.52.0.351.gbe84eed79e-goog

