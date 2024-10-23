Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7279ACC5D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 16:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3914810E7F0;
	Wed, 23 Oct 2024 14:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HiE4B1JD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA36F10E7EF;
 Wed, 23 Oct 2024 14:31:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D369FA44EA5;
 Wed, 23 Oct 2024 14:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCE6C4CEC6;
 Wed, 23 Oct 2024 14:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729693863;
 bh=jk4gZ318ElIT3NFdJQ1M7kZzjg1NdLC7IU9xiNjjbxs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HiE4B1JDyjn7q0jX1YKQ95GQ2wmMIC2ikObLNKInLb/smdbF3wAwK7fabCrKUnmAV
 0lNQbzTH6J6vI3A8jWjYXwI5c1HHW2oSd5noRPauBJ0YM25bftdO4GSNrisvMvXUDw
 6+7bBwYOChXEaTkzGSjNHp5C4ITv9iA3ABVEZwkki9dWEpwURuHmpWR/Hx+yQ1W4a0
 dSJJjOT4Q0mkYOSFCNJYtnfJMu8I0HxWZ50+mQEypCSm4b+H2HGCoPxtlB3NqB1vN6
 ltsBzpyYxvZ3ai3jFIcctHKRyEhHaBaSUzkszeSvlS9dq35XWvqNoI6+uU4is/ifY7
 PAafT5JZm8zSw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Szymon Morek <szymon.morek@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Sasha Levin <sashal@kernel.org>,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 28/30] drm/xe/query: Increase timestamp width
Date: Wed, 23 Oct 2024 10:29:53 -0400
Message-ID: <20241023143012.2980728-28-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143012.2980728-1-sashal@kernel.org>
References: <20241023143012.2980728-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.5
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

From: Lucas De Marchi <lucas.demarchi@intel.com>

[ Upstream commit 477d665e9b6a1369968383f50c688d56b692a155 ]

Starting with Xe2 the timestamp is a full 64 bit counter, contrary to
the 36 bit that was available before. Although 36 should be sufficient
for any reasonable delta calculation (for Xe2, of about 30min), it's
surprising to userspace to get something truncated. Also if the
timestamp being compared to is coming from the GPU and the application
is not careful enough to apply the width there, a delta calculation
would be wrong.

Extend it to full 64-bits starting with Xe2.

v2: Expand width=64 to media gt, as it's just a wrong tagging in the
spec - empirical tests show it goes beyond 36 bits and match the engines
for the main gt

Bspec: 60411
Cc: Szymon Morek <szymon.morek@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241011035618.1057602-1-lucas.demarchi@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
(cherry picked from commit 9d559cdcb21f42188d4c3ff3b4fe42b240f4af5d)
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_query.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 4e01df6b1b7a1..3a30b12e22521 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -161,7 +161,11 @@ query_engine_cycles(struct xe_device *xe,
 			  cpu_clock);
 
 	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	resp.width = 36;
+
+	if (GRAPHICS_VER(xe) >= 20)
+		resp.width = 64;
+	else
+		resp.width = 36;
 
 	/* Only write to the output fields of user query */
 	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
-- 
2.43.0

