Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3A1BF28AA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 18:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E899910E487;
	Mon, 20 Oct 2025 16:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P5BPbzKT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7D810E484;
 Mon, 20 Oct 2025 16:53:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A49F948DBA;
 Mon, 20 Oct 2025 16:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3310AC4CEF9;
 Mon, 20 Oct 2025 16:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760979212;
 bh=1jA9mRZr/xXEpElZQP1h8QlFxHjPmdmKv3OcE+yAbS8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P5BPbzKTtdf8ltLd6vsPjendOtYpNv+2vNL8tpUuiAQ2F9BC1wrODA+g3tHEXFL7o
 XZ/tNKlvuqT+oivt+AUdp20dy0keXGArHwGWArXYFXX1pKajk5d81YuDZLSxMjOrzb
 Wxc2iC5CyPuXFp87jMmSPRVsPvGf6FiX6LZ40G92jToZmid6VuJkGshE3SvpLRitM2
 t8vIcP8WI5zFNJQxrcrvWBR46sY7FRLYFuk2CbR8Lxq8W9lwwBkCIUAa0hNsiDR3fZ
 Xh+/AChcJGP4yfGKD5DyyWO++kuVXoICFPUeyjvJeBeWjLwunAlmnbZnLzpKgyGFWO
 Uii3XVoKhx7Zw==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, dakr@kernel.org, gregkh@linuxfoundation.org,
 lenb@kernel.org, pavel@kernel.org, rafael@kernel.org, simona@ffwll.ch
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Mario Limonciello <superm1@kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: [RFC 2/3] PM: Don't pass up device_resume() -EBUSY errors
Date: Mon, 20 Oct 2025 11:50:48 -0500
Message-ID: <20251020165317.3992933-3-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251020165317.3992933-1-superm1@kernel.org>
References: <20251020165317.3992933-1-superm1@kernel.org>
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

From: Mario Limonciello <mario.limonciello@amd.com>

If a device resume returns -EBUSY the device resume sequence has
been skipped. Don't show errors for this or pass it up to async
resume.  If resume is run again in another stage the device should
try again.

Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/base/power/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index bf9c3d79c455f..f6bc7ef9a8371 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -1112,7 +1112,9 @@ static void device_resume(struct device *dev, pm_message_t state, bool async)
 
 	TRACE_RESUME(error);
 
-	if (error) {
+	if (error == -EBUSY)
+		pm_dev_dbg(dev, state, async ? " async" : "");
+	else if (error) {
 		WRITE_ONCE(async_error, error);
 		dpm_save_failed_dev(dev_name(dev));
 		pm_dev_err(dev, state, async ? " async" : "", error);
-- 
2.43.0

