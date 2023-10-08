Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74337BCAC4
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 02:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E717E10E063;
	Sun,  8 Oct 2023 00:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A1110E063
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Oct 2023 00:49:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id ADFFACE02C4;
 Sun,  8 Oct 2023 00:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF941C433C9;
 Sun,  8 Oct 2023 00:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696726159;
 bh=CcuH1njAq6dkAJa0wVnUYRW2piKEopxux2hQDJOyrMQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AxixlpuH9Di5w8WNvX+43cV9OxBVqIVG60rXZ5oIyGQ4NjBg8Y5uCfLhjQJzFrjVL
 ajZvi6Qm4dOcdugNyYu/mXM4iC2BTYRyQ3POB8JWd+j8ko7BWiubLzbOsyU4BCEiNN
 HFvuN99C/G0a3/kF2SaGMkAtv7ohlW+GO7TfenBO2ewjBuHP7wsOp27aFwgpdzPwAQ
 hmC1Clj8H/DoUEPIXkxpxf3CqGDnw/tixyMi9xgPNA5hBCA7Cm4/civ7S05lDKBSXq
 jvGnbCrnNU1+Nj45ZJhbS7qb3IgVSRIThnk1rU++deSylub8xyHI21B/OtN2H9TfB4
 RD3QfrJGUE/Rw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 14/18] accel/ivpu: Don't flood dmesg with VPU
 ready message
Date: Sat,  7 Oct 2023 20:48:48 -0400
Message-Id: <20231008004853.3767621-14-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008004853.3767621-1-sashal@kernel.org>
References: <20231008004853.3767621-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.6
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
Cc: Sasha Levin <sashal@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 ogabbay@kernel.org, dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

[ Upstream commit 002652555022728c42b5517c6c11265b8c3ab827 ]

Use ivpu_dbg() to print the VPU ready message so it doesn't pollute
the dmesg.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230925121137.872158-3-stanislaw.gruszka@linux.intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/accel/ivpu/ivpu_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 8396db2b52030..09dee5be20700 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -303,7 +303,7 @@ static int ivpu_wait_for_ready(struct ivpu_device *vdev)
 	}
 
 	if (!ret)
-		ivpu_info(vdev, "VPU ready message received successfully\n");
+		ivpu_dbg(vdev, PM, "VPU ready message received successfully\n");
 	else
 		ivpu_hw_diagnose_failure(vdev);
 
-- 
2.40.1

