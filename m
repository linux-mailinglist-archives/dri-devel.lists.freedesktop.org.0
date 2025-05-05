Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A43AAA185
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CD810E54B;
	Mon,  5 May 2025 22:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aMbHx3Bf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90AFB10E54B;
 Mon,  5 May 2025 22:48:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B991149D63;
 Mon,  5 May 2025 22:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EBDC4CEF1;
 Mon,  5 May 2025 22:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485338;
 bh=481MeWMj+cVJvQa2lmFDWC+y3q6Ng+pvrM0i1634QHw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aMbHx3BfoXcqdmk6hmfbud33gFVjGjKYz2A6pMDiH5Eb2vkFgBfUNJgNYIoM2xIfj
 qAPY1caxYro9dTzypd1zsQqgaPPKB8mrTKizfuMxtGZbQZdtwUKcFiaK6kxu3OLxBy
 DVkPWF2XXmHzXQwovXRLCjj/e0TpH5DxFnkSTKc+qc2w2Zz535yYBngYlqveRSR8UW
 O9Mb4bnkCTYjRB+OdcvUOIN18k/lxG1unrVk+B1vIGZbm5eZdbVvE/nDAMgAbGtx5D
 RnA7N84MlQGAcBMcXhjEC15z7gKaZ3BCVb76izoZ/TjqktqOwk4eHuj4hLbZ8TLEQv
 KPhCY+eKsLaww==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, Sasha Levin <sashal@kernel.org>,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 275/486] drm/xe/oa: Ensure that polled read
 returns latest data
Date: Mon,  5 May 2025 18:35:51 -0400
Message-Id: <20250505223922.2682012-275-sashal@kernel.org>
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

[ Upstream commit 98c9d27ab30aa9c6451d3a34e6e297171f273e51 ]

In polled mode, user calls poll() for read data to be available before
performing a read(). In the duration between these 2 calls, there may be
new data available in the OA buffer. To ensure user reads all available
data, check for latest data in the OA buffer in polled read.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250212010255.1423343-1-umesh.nerlige.ramappa@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_oa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 448766033690c..d306ed0a04434 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -535,6 +535,7 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
 			mutex_unlock(&stream->stream_lock);
 		} while (!offset && !ret);
 	} else {
+		xe_oa_buffer_check_unlocked(stream);
 		mutex_lock(&stream->stream_lock);
 		ret = __xe_oa_read(stream, buf, count, &offset);
 		mutex_unlock(&stream->stream_lock);
-- 
2.39.5

