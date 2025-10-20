Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5800FBF28A4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 18:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED72F10E484;
	Mon, 20 Oct 2025 16:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mt8x8Koh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F81F10E484;
 Mon, 20 Oct 2025 16:53:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 480FA6209F;
 Mon, 20 Oct 2025 16:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942E3C4CEFE;
 Mon, 20 Oct 2025 16:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760979210;
 bh=NTNN3wwtEyiPMnu+I2XHXc/XM3jyZiRd3TIIAscmDFQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mt8x8Koh/LvecZ6pnOUPt7IVv3IL40j30WXV7SP6/ghDJV3c8dBhgB8HqwLEemZZ9
 G9DaMzfwssu2jnbRLmqgnH5+EslhalUMZ6jx3l/qN42h7hBmEx/e+Q7vHLh5/hhpad
 UVhbfHzzW0DqboYrjnGxjLYzLWTqQiR777Ua+fO5Faju2UDIFBnFuDZHjDgGM/urnY
 4S47ToqU6dsHIRRqD50hCt8YU1W2NlRBQQFNSGrxEk8gMV31pu86xYRee6hpbkV1FC
 Ld+Qd8YKK3uOEurY7T5K06i5y9RsX94mex4zXwh8b0BUuxGHPbjDMnIkNlZEpT6rxp
 ahO/lWoU/BrKw==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, dakr@kernel.org, gregkh@linuxfoundation.org,
 lenb@kernel.org, pavel@kernel.org, rafael@kernel.org, simona@ffwll.ch
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Mario Limonciello <superm1@kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: [RFC 1/3] PM: Mark device as suspended if it failed to resume
Date: Mon, 20 Oct 2025 11:50:47 -0500
Message-ID: <20251020165317.3992933-2-superm1@kernel.org>
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

If a device failed to resume the PM core treats it as though it
succeeded.  This could cause state machine problems.

Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/base/power/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index e83503bdc1fdb..bf9c3d79c455f 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -1104,6 +1104,9 @@ static void device_resume(struct device *dev, pm_message_t state, bool async)
 	device_unlock(dev);
 	dpm_watchdog_clear(&wd);
 
+	if (error)
+		dev->power.is_suspended = true;
+
  Complete:
 	complete_all(&dev->power.completion);
 
-- 
2.43.0

