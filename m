Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EEEAAA1C4
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3FB10E561;
	Mon,  5 May 2025 22:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SeGidMev";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A11510E561;
 Mon,  5 May 2025 22:51:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A1F005C5B27;
 Mon,  5 May 2025 22:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4FCC4CEF2;
 Mon,  5 May 2025 22:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485496;
 bh=GWHf4Pepn5XTdcibSCyLKZaFxxZfHpk4fmNob5E8br8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SeGidMevXyZIg+OjgkDu0kfP3xUu/KZsjB0ThEuXdogS0+U2zBZpc13SgVu8U13OV
 l9mGrX0Q8pm+Q3jck9uRDGV4XG2JArVv/tCXzkQU+y933fZgVkvBhntXcTGtmID0eA
 GE2oe0z8TqQDH7tk3AkQssn/F9u69AmHNvpDo7JmPiD/hjvwYfJJx5Zx5SZ6cIHKsw
 Fco/YJKSsLcE9I6YExSeLFt/SBCjbf5q8C8Zpmd68gCymmdKOTnTTB8FlXWfy77RH7
 VXmoScwLjT0LEYW3qCGGIYWMWzCbyslAPlirr32pbpCUc6DFLFk+E0IEr7CZ6HcA+c
 GmuEIU0uwqN5w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xin Wang <x.wang@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Fei Yang <fei.yang@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>,
 Sasha Levin <sashal@kernel.org>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 347/486] drm/xe/debugfs: fixed the return value
 of wedged_mode_set
Date: Mon,  5 May 2025 18:37:03 -0400
Message-Id: <20250505223922.2682012-347-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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

From: Xin Wang <x.wang@intel.com>

[ Upstream commit 6884d2051011f4db9e2f0b85709c79a8ced13bd6 ]

It is generally expected that the write() function should return a
positive value indicating the number of bytes written or a negative
error code if an error occurs. Returning 0 is unusual and can lead
to unexpected behavior.

When the user program writes the same value to wedged_mode twice in
a row, a lockup will occur, because the value expected to be
returned by the write() function inside the program should be equal
to the actual written value instead of 0.

To reproduce the issue:
echo 1 > /sys/kernel/debug/dri/0/wedged_mode
echo 1 > /sys/kernel/debug/dri/0/wedged_mode   <- lockup here

Signed-off-by: Xin Wang <x.wang@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250213223615.2327367-1-x.wang@intel.com
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index fe4319eb13fdf..051a37e477f4c 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -147,7 +147,7 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 		return -EINVAL;
 
 	if (xe->wedged.mode == wedged_mode)
-		return 0;
+		return size;
 
 	xe->wedged.mode = wedged_mode;
 
-- 
2.39.5

