Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECACB66E5C4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 19:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267E510E5A5;
	Tue, 17 Jan 2023 18:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107CD10E5A5;
 Tue, 17 Jan 2023 18:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b51ukDr3iPypCeFl9HdvTYZ/t6JiuPUE3lDHCi95NPg=; b=d3W+jHYo7BSg2dqCx0zmPVKRXc
 A0ME2GjixH9uBms0IcYd8dCclQZ4dt4ZsNsLSgu5CXX0dp9wGpCC4a5FXh1BsPu4vPUSw8uXrVVLQ
 Duq5UUuXNdkQDgQ38ln138s5kpNSlbqcwyV5GAGdvOESTZ/W490v5EN6e6LLbbH+8vaJ69QwLqJzO
 xnPUMsrKVLlvFinMfwdbgYg0cCt8ccbRkIS7TdOwlBhZFet4yJl/8em4MRXig7rjYZp/Ar79iEoTW
 T0fA+Yfc0rs5lAXrj2HYfrq/WMIkEHkbxYdReCgdwdulcRQJ4303M0thIdgpJgf1TFTv3Amf2ibUE
 EBn76K4Q==;
Received: from [187.56.70.205] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pHqUh-00AqiU-GE; Tue, 17 Jan 2023 19:15:36 +0100
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/amdgpu/vcn: Remove redundant indirect SRAM HW
 model check
Date: Tue, 17 Jan 2023 15:15:24 -0300
Message-Id: <20230117181524.915372-2-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117181524.915372-1-gpiccoli@igalia.com>
References: <20230117181524.915372-1-gpiccoli@igalia.com>
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
Cc: Sonny Jiang <sonny.jiang@amd.com>, kernel@gpiccoli.net, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, Lazar Lijo <Lijo.Lazar@amd.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>, kernel-dev@igalia.com,
 Alex Deucher <Alexander.Deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HW model validation that guards the indirect SRAM checking in the
VCN code path is redundant - there's no model that's not included in the
switch, making it useless in practice [0].

So, let's remove this switch statement for good.

[0] lore.kernel.org/amd-gfx/MN0PR12MB61013D20B8A2263B22AE1BCFE2C19@MN0PR12MB6101.namprd12.prod.outlook.com

Suggested-by: Alex Deucher <Alexander.Deucher@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Cc: James Zhu <James.Zhu@amd.com>
Cc: Lazar Lijo <Lijo.Lazar@amd.com>
Cc: Leo Liu <leo.liu@amd.com>
Cc: Sonny Jiang <sonny.jiang@amd.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---


V3:
* Added Mario's review tag and Alex's suggested tag - thanks
for the reminder Mario!

V2:
* Changed the approach after ML discussion- instead of cleaning up
the switch statement, removed it entirely - special thanks to Alex
and Mario for the feedback!


 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 81 +------------------------
 1 file changed, 3 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index 1b1a3c9e1863..02d428ddf2f8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -110,84 +110,9 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 	for (i = 0; i < adev->vcn.num_vcn_inst; i++)
 		atomic_set(&adev->vcn.inst[i].dpg_enc_submission_cnt, 0);
 
-	switch (adev->ip_versions[UVD_HWIP][0]) {
-	case IP_VERSION(1, 0, 0):
-	case IP_VERSION(1, 0, 1):
-	case IP_VERSION(2, 5, 0):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(2, 2, 0):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(2, 6, 0):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(2, 0, 0):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(2, 0, 2):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(3, 0, 0):
-	case IP_VERSION(3, 0, 64):
-	case IP_VERSION(3, 0, 192):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(3, 0, 2):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(3, 0, 16):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(3, 0, 33):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(3, 1, 1):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(3, 1, 2):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-		    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(4, 0, 0):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-			(adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(4, 0, 2):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-			(adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	case IP_VERSION(4, 0, 4):
-		if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
-			(adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
-			adev->vcn.indirect_sram = true;
-		break;
-	default:
-		return -EINVAL;
-	}
+	if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
+	    (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
+		adev->vcn.indirect_sram = true;
 
 	hdr = (const struct common_firmware_header *)adev->vcn.fw->data;
 	adev->vcn.fw_version = le32_to_cpu(hdr->ucode_version);
-- 
2.39.0

