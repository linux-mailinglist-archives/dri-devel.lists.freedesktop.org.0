Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD486A3692
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0542010E1F7;
	Mon, 27 Feb 2023 02:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF05010E1B6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 02:02:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 92AC2B80CAB;
 Mon, 27 Feb 2023 02:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC92C4339E;
 Mon, 27 Feb 2023 02:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463355;
 bh=Ewv5WwPQXNomcPfjqEAlk2GqZYo6lwOY7Yo9cJrazj0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f+HV99uLuQtHfiKdR0rWSrf+ONx/3avDbfppCeNNOagAs098vGIXsp4SVZU2PfTFN
 ehdGg6mPIdj0kIZCwBx2k+43TAgB3cY4Q0TqHMRqNfU/bYFG3nt6J9bpgO/SIY5zQN
 sgwYVNQ7aJ8weupMbptx3xpsVN3G9RRxaH9waXwbQW4N6GGdIoZwhLRAEaKxHlh9y2
 ffcZWSvFu7dQ0wBcOTI7m7PYTpWDgsXbc2m52ehxQA84OeAlUVQ/W0ptMv6hEFPcgP
 /PITut+Z3JRb2Y/eSqR9A1X45jQrzDmlZ9i+2yDn6l8hjNbF2BcBECp39DeFXkm/+l
 Q1lwxUY/lGHoA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 27/60] drm/drm_print: correct format problem
Date: Sun, 26 Feb 2023 21:00:12 -0500
Message-Id: <20230227020045.1045105-27-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020045.1045105-1-sashal@kernel.org>
References: <20230227020045.1045105-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wayne Lin <Wayne.Lin@amd.com>

[ Upstream commit d987150b539271b0394f24c1c648d2846662adb4 ]

[why & how]
__drm_dbg() parameter set format is wrong and not aligned with the
format under CONFIG_DRM_USE_DYNAMIC_DEBUG is on. Fix it.

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/drm/drm_print.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index a44fb7ef257f6..094ded23534c7 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -521,7 +521,7 @@ __printf(1, 2)
 void __drm_err(const char *format, ...);
 
 #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
-#define __drm_dbg(fmt, ...)		___drm_dbg(NULL, fmt, ##__VA_ARGS__)
+#define __drm_dbg(cat, fmt, ...)		___drm_dbg(NULL, cat, fmt, ##__VA_ARGS__)
 #else
 #define __drm_dbg(cat, fmt, ...)					\
 	_dynamic_func_call_cls(cat, fmt, ___drm_dbg,			\
-- 
2.39.0

