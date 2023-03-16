Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 114AE6BCE67
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 12:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C438010ECB3;
	Thu, 16 Mar 2023 11:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A301210ECAB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 11:36:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3290E61FEF;
 Thu, 16 Mar 2023 11:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264CEC433D2;
 Thu, 16 Mar 2023 11:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678966618;
 bh=7aOdl6PJN+BMBBYZ+zVEBlFYgBGsl35q4qFXRtfR2Q0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L+gQA4M1b0slm08L1yVtOFO+G3dfAtuY35lokeR56Rcov0ht1jjVvOgEF9P3A+a/B
 VmbLuPkGLlq5vLPhf1XYl2hCL7EsMgG6HaxRkVWA5kLtCILjpA8nVyWW1qKAh7G0ox
 TZhOgnVt6k1e28f2kIuKiye3dkZI1aM/3iodUbClgadh1FHASVxYjRjqvWJjAIugSL
 oS1RP7TjWdRSoFz2shtt4jzRWjuLzv8tiCmyV1MEOt9QhQlJvWYNuhBHkvkTTu2XnP
 FNnS2YlVM9TPOObr7buICiDPV6oVIAcj4VN2X1HwyDp+q6EnItAC3kt2wHKVQnWEVu
 Yidw7e6dl6H/A==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/10] accel/habanalabs: expose dram reserved size by kmd
Date: Thu, 16 Mar 2023 13:36:40 +0200
Message-Id: <20230316113640.499267-10-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230316113640.499267-1-ogabbay@kernel.org>
References: <20230316113640.499267-1-ogabbay@kernel.org>
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
Cc: Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ofir Bitton <obitton@habana.ai>

We expose this in order for user applications to know how much dram
is reserved for internal use.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs_ioctl.c | 1 +
 include/uapi/drm/habanalabs_accel.h                | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
index 0997ede359d7..81e026066f96 100644
--- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
+++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
@@ -109,6 +109,7 @@ static int hw_ip_info(struct hl_device *hdev, struct hl_info_args *args)
 	hw_ip.security_enabled = prop->fw_security_enabled;
 	hw_ip.revision_id = hdev->pdev->revision;
 	hw_ip.engine_core_interrupt_reg_addr = prop->engine_core_interrupt_reg_addr;
+	hw_ip.reserved_dram_size = dram_kmd_size;
 
 	return copy_to_user(out, &hw_ip,
 		min((size_t) size, sizeof(hw_ip))) ? -EFAULT : 0;
diff --git a/include/uapi/drm/habanalabs_accel.h b/include/uapi/drm/habanalabs_accel.h
index 7d457eb4da74..e43688d30e96 100644
--- a/include/uapi/drm/habanalabs_accel.h
+++ b/include/uapi/drm/habanalabs_accel.h
@@ -888,6 +888,7 @@ enum hl_server_type {
  * @tpc_interrupt_id: interrupt id for TPC to use in order to raise events towards the host.
  * @engine_core_interrupt_reg_addr: interrupt register address for engine core to use
  *                                  in order to raise events toward FW.
+ * @reserved_dram_size: DRAM size reserved for driver and firmware.
  */
 struct hl_info_hw_ip_info {
 	__u64 sram_base_address;
@@ -928,6 +929,7 @@ struct hl_info_hw_ip_info {
 	__u32 reserved8;
 	__u32 reserved9;
 	__u64 engine_core_interrupt_reg_addr;
+	__u64 reserved_dram_size;
 };
 
 struct hl_info_dram_usage {
-- 
2.40.0

