Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD1D7AE7A9
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 10:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F8C10E36C;
	Tue, 26 Sep 2023 08:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F55710E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 08:14:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id DB8C2B80FA0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 08:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16E6C433C7;
 Tue, 26 Sep 2023 08:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695716038;
 bh=b8JoGCZ+fQG0J2KkZ2rDS/O6LpZsi2zykWH7oEBRPBE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ptVd18rGlQAYTKLFtC6pJ2PZYZfFkDljPqar5Q8wDm1xaHdb4LGw1+j/EnIz7dmjy
 u2+AyooLP7Ueuhn5Aoz4j39MXqD0YNcO8IiMz9ooX45Mg63AC6+wuqDzTkfPYCIfrE
 DorC5K4wxftri4ejIhqGdI9fq0X293HgrKms+XSeTDFUv2yeAFMgV9vEXhB1GVIHD9
 3UWJ/g/MdRYEOf/zL7FyJm0Z1XcNk2cf1lhUE6ERkvV/bwvel0N/F/iynbaSRjSV5p
 +017iPhZvgp2AG+N9MNPdw0/wLmVsmwSKs+ZfhKmE+R3G+1ARJ1r0SxpmITRN0j16t
 Tfpkog9lby6Sg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] accel/habanalabs: remove leftover code
Date: Tue, 26 Sep 2023 11:13:43 +0300
Message-Id: <20230926081345.240927-7-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926081345.240927-1-ogabbay@kernel.org>
References: <20230926081345.240927-1-ogabbay@kernel.org>
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

This code was added as part of a bigger feature which was never
upstreamed, so remove this code.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/command_submission.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index e5ca490b7fca..4f7b70d9754c 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -1751,16 +1751,11 @@ static int hl_cs_ctx_switch(struct hl_fpriv *hpriv, union hl_cs_args *args,
 		/* Need to wait for restore completion before execution phase */
 		if (num_chunks) {
 			enum hl_cs_wait_status status;
-wait_again:
+
 			ret = _hl_cs_wait_ioctl(hdev, ctx,
 					jiffies_to_usecs(hdev->timeout_jiffies),
 					*cs_seq, &status, NULL);
 			if (ret) {
-				if (ret == -ERESTARTSYS) {
-					usleep_range(100, 200);
-					goto wait_again;
-				}
-
 				dev_err(hdev->dev,
 					"Restore CS for context %d failed to complete %d\n",
 					ctx->asid, ret);
-- 
2.34.1

