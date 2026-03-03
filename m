Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNkmFzsKp2kDcgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:20:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7821F393E
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451A310E849;
	Tue,  3 Mar 2026 16:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YHZIcgIA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012063.outbound.protection.outlook.com [52.101.48.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340E510E845;
 Tue,  3 Mar 2026 16:20:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5Wk6a8sAn8cgprPqI3yRoMV1bRf7RwKSQ7WtJ3S8iEyP51GZEX+XDFNY1gCS5agUO+26b72sJafSAEERiM91FJhwzdy7MO16RHa4SlQPQJpYyIaES7veV3nkIjAoG+p4cGf/7FtmpDpP5rZQyh0Qy1xQ03dPax2dwr7bMIW5sYupP+ZUpzufWVCoBfFovimy6jJeo7TL0KNYptEMGCk0TnFdLS6dDYdxYyZcG0HeoXULaAImoLMTqenadBJjBohIjq/ov2kCaRmpGcG2qq7o+c7R6AvW+IFEVZWtjcGGuqIFB9YbY4uwps0EORtzvHTKbSEqTF2pAxwcSN6dRuucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxLw4OKiqZ6b46fhIuE+QE7luBlDkZu03XbRWVWAkEk=;
 b=E/AqCsh5Buq1F8YpwEZSRQKwwvqWdNl61tsT02a7x12BoOaBZqe832wzzzERTb+u0GLmPhLW+hRluq3mpRNiOTcR7AIj+JsswBVzSnOxhcYlUBOa7+Xg+nrifgdTI2UDzp58GQM4oiXCw/T3M0NERE/EOmKqcrd5G7OHo6oPqdeO2/qukrZg0b5L4s7s6gnSg63uAwxWv1+sdTAae4NpNRgWHftHMMcNegAWcNJw6g3+lTjNi14uM6z2KsPWDY2X2zAvqA1s2+/0lZ3BGxKSaLiTvRhf3AGjUCRxgElE8jPik/5BrZIrdx6/Z9w/qL0zVjY+X4TeKZkudQNx0bsZlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxLw4OKiqZ6b46fhIuE+QE7luBlDkZu03XbRWVWAkEk=;
 b=YHZIcgIA+FCxpDxyBYBn7ZfPfkuAAijKQmAXz+LhiGAxVhRzgmpCeO/YXZC+/U2iXFlKT5qV1EVXUM6OeF+A+/l5NrPpsI7NYP1EvffDRMA//TGnYrPGSFwDLWZ+D7U2qQB6H+Mu/koNnTBXUtvEOur1HZseZe+Rx3imXB7Pfes=
Received: from PH1PEPF000132E4.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::24)
 by IA0PPF6E99B1BC1.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bd1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 3 Mar
 2026 16:19:59 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2a01:111:f403:f90e::3) by PH1PEPF000132E4.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 16:19:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 16:19:58 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 3 Mar 2026 10:19:56 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/6] drm/amdgpu: include ip discovery data in devcoredump
Date: Tue, 3 Mar 2026 17:18:14 +0100
Message-ID: <20260303161824.7765-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|IA0PPF6E99B1BC1:EE_
X-MS-Office365-Filtering-Correlation-Id: f402a263-68e9-4233-2dd3-08de7940b704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: 7Dz2Fycx/bRhs4a8/+OpqWzC0emTs4jOt2F/t+EcKcXA6mwejq35jUs2lQ/L7ospQg9SsNaAUVsfEQzvXpJ+UcmaH78IN9FgC4ICktiFImpaGh2PqgbMO8CirMkzmjjYXapusgqbFX9i5THm7rMrzcM1keXfkwMqoisT6wuWb+hNcbEtpsOL1lR+eUeg4h8LURml8kAFvBbskgdxWBhKfKnKbALN0BPNHmh9Knn62Z5NH4csahy/MzQgYkEXO40kXm+oxeR19U1cNTHlwmQnzbD++gWLsASqMSyJXWUBGqJLIGPItQDA1J0l2Z5dhim8Q0y78N0VsNNNoFP/yxjlHTcDH8iWi0r6MvhCMb/ttwJvokkSqCRHbY55JFkE98mBNPJi3OaFP/31s+Pe/LhG9ArtL6tyotpLEbOZAu3zfMZUBnZfj2tIG8P4L0gx5djtTU4CTFkWcgD5u4jz5r8ak5vayDQNYItEq/G2tSl2VvsrNMdTFIuQfBAc8qLd7MOEIrSq0HIIydKDeR589xxkQa2SRTHd+hS+mjyTAVmVaD/nVFyDpgk8IkBEz012tiW5YSeOBXWy2BOsH7VNmIGMt32kHVSPpJtohf2LWl2tFeBxDVsbEmXsS81TVzz4x+McasfxBJDQH5Vet2HmFdjQ4Ag1rG4r8M4Y9f5g8mU34Cj5MlP0qpjO934g+VknAiHjVo05xjunzlIOgA1kOD18jIBv31m0l8PThwH35hK3DdmRaaFoqsKGv9E+6xL0DcERIffn3TtyR1G8ftA1IGWRAMnfjkPCjjnPvmsPxuHse+jNReovqhyHSA7KkIxfLS8uvq4slBH5TH+wEM8aPoDYxg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sqV4mYkVlUF/EVBFJJqyiKgxGDdUVkMTpnBjVKfHbcK6KPD67Wp1AD+MhiJ/sMORqjL9x17xk3JGrm8n+C8uMUr7NGdaqi+N+cJs+tMBRi0KZzXFqXwix1t8tdINGXnMehRmkAq959hqUdELjTQgIEzZYnMkvlwzhlX6NgBwSBqOUeH8plZsYF23YBAZ7sfuvNW3H4150Hl4S3fcwga1Db1b9Upq1mnWMDwtkKOEmsfkDlIbVn4MhceGAMUj11B9rT9nqtWDImr9cQHi7vjzinRzwCbDEUgsVz9u/mbrDhHe7dZsucy5hRHi0Hd33TMwDd5YJYKqim+3X5j7NHBLP2pabBXGsGQ3JkIp4r/5kUtM1+n0Jr8x/TqGo3exuSlvUHs/4MVCc1gV7w9kwJdMVCiMgJ8kBRdw3+LB0vi4BCm7ji6zLhFRu6M6D4F4sEr7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 16:19:58.7885 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f402a263-68e9-4233-2dd3-08de7940b704
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF6E99B1BC1
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
X-Rspamd-Queue-Id: 0D7821F393E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

This is the best way to describe the GPU to a tool loading
the devcoredump.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 42 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h |  3 ++
 3 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index 0bb430853a9f..42a969512dcc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -262,6 +262,8 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
 		}
 	}
 
+	amdgpu_discovery_dump(coredump->adev, &p);
+
 	/* IP firmware information */
 	drm_printf(&p, "\nIP Firmwares\n");
 	amdgpu_devcoredump_fw_info(coredump->adev, &p);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 41e63c286912..d7325c23fa53 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -1380,6 +1380,48 @@ static void amdgpu_discovery_sysfs_fini(struct amdgpu_device *adev)
 	kobject_put(&ip_top->kobj);
 }
 
+/* devcoredump support */
+void amdgpu_discovery_dump(struct amdgpu_device *adev, struct drm_printer *p)
+{
+	struct ip_discovery_top *ip_top = adev->discovery.ip_top;
+	struct ip_die_entry *ip_die_entry;
+	struct list_head *el_die, *el_hw_id, *el_hw_inst;
+	struct ip_hw_id *hw_id;
+	struct kset *die_kset;
+	struct ip_hw_instance *ip_inst;
+	int i = 0, j;
+
+	die_kset = &ip_top->die_kset;
+
+	drm_printf(p, "\nHW IP Discovery\n");
+	spin_lock(&die_kset->list_lock);
+	list_for_each(el_die, &die_kset->list) {
+		drm_printf(p, "die %d\n", i++);
+		ip_die_entry = to_ip_die_entry(list_to_kobj(el_die));
+
+		list_for_each(el_hw_id, &ip_die_entry->ip_kset.list) {
+			hw_id = to_ip_hw_id(list_to_kobj(el_hw_id));
+			drm_printf(p, "hw_id %d %s\n", hw_id->hw_id, hw_id_names[hw_id->hw_id]);
+
+			list_for_each(el_hw_inst, &hw_id->hw_id_kset.list) {
+				ip_inst = to_ip_hw_instance(list_to_kobj(el_hw_inst));
+				drm_printf(p, "\tinstance %d\n", ip_inst->num_instance);
+				drm_printf(p, "\tmajor %d\n", ip_inst->major);
+				drm_printf(p, "\tminor %d\n", ip_inst->minor);
+				drm_printf(p, "\trevision %d\n", ip_inst->revision);
+				drm_printf(p, "\tharvest 0x%01X\n", ip_inst->harvest);
+				drm_printf(p, "\tnum_base_addresses %d\n",
+					   ip_inst->num_base_addresses);
+				for (j = 0; j < ip_inst->num_base_addresses; j++)
+					drm_printf(p, "\tbase_addr[%d] 0x%08X\n",
+						   j, ip_inst->base_addr[j]);
+			}
+		}
+	}
+	spin_unlock(&die_kset->list_lock);
+}
+
+
 /* ================================================== */
 
 static int amdgpu_discovery_reg_base_init(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h
index 4ce04486cc31..c8242992c912 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h
@@ -30,6 +30,7 @@
 #define DISCOVERY_TMR_OFFSET    (64 << 10)
 
 struct ip_discovery_top;
+struct drm_printer;
 
 struct amdgpu_discovery_info {
 	struct debugfs_blob_wrapper debugfs_blob;
@@ -47,4 +48,6 @@ int amdgpu_discovery_get_nps_info(struct amdgpu_device *adev,
 				  struct amdgpu_gmc_memrange **ranges,
 				  int *range_cnt, bool refresh);
 
+void amdgpu_discovery_dump(struct amdgpu_device *adev, struct drm_printer *p);
+
 #endif /* __AMDGPU_DISCOVERY__ */
-- 
2.43.0

