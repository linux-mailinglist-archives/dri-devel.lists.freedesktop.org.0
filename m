Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOh6HAeEhWmqCwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:02:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C98FA880
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696DC10E34E;
	Fri,  6 Feb 2026 06:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MQXchYar";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010005.outbound.protection.outlook.com [52.101.85.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B1010E34E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 06:02:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9dl9rBjdaK2mpzBX02IyJksjcIuqFFasLdhrfq2CZ+/HZIHmQgtp8EOXZL3pdgOrRgo98Y6UtjjbvvlsgXPEbatpvUrVi4lz6hcuFFySMbZoELqO+Rn7jHrUkg2/hHEpBw04HCh72Ii98Q5uF1C76pyimuYeUDsc/ggpL7u3wNURKqiIBCfe0JyGh42mD+ia/tpi4/WFKJL8Z2fK9iSNDe7LoLA5wmq//epR0q5yTn7sVkkGmXp/xqJWo8rprvPBawxGb2LUc9IRGqd6s2VKCZdMLVCmOGKDdUo71vSMZNvKMgD4ZM04o85X+2YtfOplN+KQt5CLwEIAQUvyqEJzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stBSNm05RdOdJOLG2p2giSFasCDpi2Hq1ZNe6lWwLsU=;
 b=OQyDyS5xOIPIDaB4mQkRQfCjKLkmaCOTA3odNEBPUvuNe2T7vdyjn15Tb9D2UM+lWoqhW2pvcJrJi1UvBu9wviJn5AHiOlaFS3DDnygkpj1pnlQPXL+TBPzspdsI2YxeFYjuzA7D9hxe2Ky0Q8y2050HQWYPQ5z5w/inVkNmqtvGaNsBB7MLXglDJkUmkiRn+Ki2NlPhrYtWPomNaVGoDQOkZkEqpXyyqGQ95803HTzSBRLl3OxynFOIaQrt5BAyOl2f1ce35B7t/Gs/dI0smPI+QA7mqIHMYrG7tH/VJgynslKAJGhx2N8KCeqHghT+6zbssxo8h6kmD5qBz9afJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stBSNm05RdOdJOLG2p2giSFasCDpi2Hq1ZNe6lWwLsU=;
 b=MQXchYar/EpLLmupe1PgMkvHLS/RxsNVIAiCCVyc0AXEMbMLf9tCEv/MZfBW5vHdDkAjze0NMcnaNLeyf6DMC4CqXc34lbv65vPiNCaNMMahv1iOZ+VvPd3ILYcaScD9bq0zjyiTC1oUQhGWC8GBHT7Qlf30epfYa6Fum5Oph24=
Received: from SJ0PR13CA0072.namprd13.prod.outlook.com (2603:10b6:a03:2c4::17)
 by MN2PR12MB4304.namprd12.prod.outlook.com (2603:10b6:208:1d0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 06:02:40 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::1b) by SJ0PR13CA0072.outlook.office365.com
 (2603:10b6:a03:2c4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 06:02:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 06:02:39 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 00:02:39 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 00:02:39 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 5 Feb 2026 22:02:38 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Remove buffer size check when creating
 command BO
Date: Thu, 5 Feb 2026 22:02:37 -0800
Message-ID: <20260206060237.4050492-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|MN2PR12MB4304:EE_
X-MS-Office365-Filtering-Correlation-Id: 49874451-ae79-48b8-5f98-08de654555c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F77EN0j73UXH3wP8MlHmSV3OjMytoaVw6OsM58epRbUO4qsi6MgDCU0sC5P+?=
 =?us-ascii?Q?ZQyg1ZNeNmQGH1rA0waCnaS0NGni8KBizTCFimUqImVMF3aOWEAdK2rK2iOH?=
 =?us-ascii?Q?+t8NijbQ3YUFNxgGoKJTFSgX0h1GClSiwAFfc76q4URWNz51gV5R6n2bSGZh?=
 =?us-ascii?Q?sDeDaiMAZQvpbwltNcbXlO1zGVZhttrU3X4cnvQhOEtyIOu96a5WV2La41on?=
 =?us-ascii?Q?It0HksHKOg8Wvd7qS/rAIAWs6H1CgEagwr3rb2R9byymAJuaDrgYF9sfLEaG?=
 =?us-ascii?Q?sdP93yr8ABHyE7i/ykl+fJw8eIwimL8wBDXnLVSk3fM5KFUlHG95whKjhZiD?=
 =?us-ascii?Q?3yXGwKHvgMWzDaZ7wSG9crDeMuuWJMauWdLaGajnZGPWrBT5vxkRCm+mjzJc?=
 =?us-ascii?Q?1IXLbFsA9gh4ijJuD05w3d7/AxgFkgRQ+rh/iDzF4ZxABxVM0VDmbH/GYipz?=
 =?us-ascii?Q?W62QlCg27N9sktIOfVEA0ywDGiWuyOMpIqJQGW81nl1ZFK2CJJjyTvp4ck2n?=
 =?us-ascii?Q?xp8X/ETvxSOOLn3VdB1vGOV1m23ijm/IFJ8cDdquUDlEBLlpjVRGjmFdlnrT?=
 =?us-ascii?Q?jWgqnEHVX8US9qVlP7kOpbUSURwmqTXIzSPH4BO6RzJeZ3MFOUAxMzheqvrr?=
 =?us-ascii?Q?CcPvtOLSmomkBZygwyG1Xi4oDtRrASwfODRnYhJHcJXQcqfWs/Zy/9iKUg9t?=
 =?us-ascii?Q?7Ux0Mym/MzqiGs/dFhfqqFIe+fRwfkiQm5QbITWRJR/ST9e8kH4kCEdELHJs?=
 =?us-ascii?Q?DL1TvH6pXEsYuBxHH/8DEQmU0vH4O0p+0soFRYTAb2ec5DRSy/4GqoKZruky?=
 =?us-ascii?Q?y+RHroTTlUMernuuD0dksG1Kwtxc0XGyEYoOmDWgmKxmqdTNYinIJDxa60w0?=
 =?us-ascii?Q?KRzIB/XrTXfsP5UgHupnnRJoOZidZ5u04rHUTDN0aZxAtGmj5H2SZkAmX5cc?=
 =?us-ascii?Q?o1BpuQsjguzn5FzwZFMCcaaBd/pazX8ZQ/MN4dVYfcwTEkJIOfuUuztOifw5?=
 =?us-ascii?Q?9mFHKyBC0KhIRuyKRKDFxTHpmOCB0eELzZFBkFVdEKQ4zfgNKqPeWihZcxs/?=
 =?us-ascii?Q?C82/ZnlMZdok7pE/pDR8pURD7gV63A0OTCb5Jc/XmgD22yYHj4FDvU+8SA0i?=
 =?us-ascii?Q?pMUJwnwASXN9fR1W39J+mOmghnYFr/gLRWvQqDNogXM+2pJkLl/aSKLjHzBQ?=
 =?us-ascii?Q?yg8kBFbzDwwleB/r5yFR85sflGuQWeLOUeWWmgV+RITCelAb3A216nfsV/Xa?=
 =?us-ascii?Q?8Vv/5IhfQCT5gZ3aSIVg9RT96CqcjNqGLBJLhDBnhp3nPK40xI85hMIjLBX6?=
 =?us-ascii?Q?wenYyh7UUgUW11a99DWwWpY8j5EKsfVyu8vSl7Jjtfh6ioaTg0DmFA0v+pU2?=
 =?us-ascii?Q?eDJoZpoiFaqQupg6tabtej0e/vUxS7bEeFPsi3UwEA99YdthmDK1UFz7l3WP?=
 =?us-ascii?Q?kL+iuJtvpgzvE1QbARfgV3GVW9JMhsHtFMzncq2YaD+wWJHAzU3d8njAYJCl?=
 =?us-ascii?Q?pWeqUSZ1Oz+TNjcCz7CIxerL0u2TYCetjcREkrhMj0/GhFolEYPLg/tALvDY?=
 =?us-ascii?Q?J0xNuQpDubh0xXk1X96RVysaxkGM127ih18ibZFNOYvRuBDPLfy0PEeRAtgr?=
 =?us-ascii?Q?Y/pPsOl3PEMhEDe4XBmr/+B0UMQyZvmmLYEsEP1JEoGPjLmSCFjxyqaUgKpc?=
 =?us-ascii?Q?yEmoUQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 63ajv71YCt1fud6udIjaRiqHsEzK4FZ9APHJCLjAs/DPVEeb21YiZkMX+TTo9FR1jIdU7pkAhFNA6j3IDdDwbpk7T/BbHwudlSnTWx/qnG63Cxny5fPxAlPMuduPA8xAP80FskOuftlpizxcWmRPdSGRcwjI/fZ/oa1Mzm/m0AS3HtzW4yvufhCHB8V3GpKc280uwb0juD56qxc7u9R5q+yHfU//ApQvfjSYaqBvuOorck8Z0DIrlQwlUmqpdEnb6vRSI0CC/8EQbzOq5YMjyHtHv7l0Bs/BRgptMKKr3qjwjuRtxKy1cwV4EibOBzg0yMmHFz8Nqc1yLYza6EHp3hZr69i8vVRzmO4Eupe6W7eIE1nnLDnFu3/xN7MDIBuK01zPxaZAo6QvXTmuJ3cqLY/yOpQpFc1wYm3ZXyQkRHKU5+lJOXGMYhb6xrwaYfr0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 06:02:39.8788 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49874451-ae79-48b8-5f98-08de654555c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:lizhi.hou@amd.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D2C98FA880
X-Rspamd-Action: no action

Large command buffers may be used, and they do not always need to be
mapped or accessed by the driver. Performing a size check at command BO
creation time unnecessarily rejects valid use cases.

Remove the buffer size check from command BO creation, and defer vmap
and size validation to the paths where the driver actually needs to map
and access the command buffer.

Fixes: ac49797c1815 ("accel/amdxdna: Add GEM buffer object management")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/amdxdna_gem.c | 38 ++++++++++++++---------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index dfa916eeb2d9..56341b7668b1 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -21,8 +21,6 @@
 #include "amdxdna_pci_drv.h"
 #include "amdxdna_ubuf.h"
 
-#define XDNA_MAX_CMD_BO_SIZE	SZ_32K
-
 MODULE_IMPORT_NS("DMA_BUF");
 
 static int
@@ -746,12 +744,6 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
 {
 	struct amdxdna_dev *xdna = to_xdna_dev(dev);
 	struct amdxdna_gem_obj *abo;
-	int ret;
-
-	if (args->size > XDNA_MAX_CMD_BO_SIZE) {
-		XDNA_ERR(xdna, "Command bo size 0x%llx too large", args->size);
-		return ERR_PTR(-EINVAL);
-	}
 
 	if (args->size < sizeof(struct amdxdna_cmd)) {
 		XDNA_DBG(xdna, "Command BO size 0x%llx too small", args->size);
@@ -765,17 +757,7 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
 	abo->type = AMDXDNA_BO_CMD;
 	abo->client = filp->driver_priv;
 
-	ret = amdxdna_gem_obj_vmap(abo, &abo->mem.kva);
-	if (ret) {
-		XDNA_ERR(xdna, "Vmap cmd bo failed, ret %d", ret);
-		goto release_obj;
-	}
-
 	return abo;
-
-release_obj:
-	drm_gem_object_put(to_gobj(abo));
-	return ERR_PTR(ret);
 }
 
 int amdxdna_drm_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
@@ -872,6 +854,7 @@ struct amdxdna_gem_obj *amdxdna_gem_get_obj(struct amdxdna_client *client,
 	struct amdxdna_dev *xdna = client->xdna;
 	struct amdxdna_gem_obj *abo;
 	struct drm_gem_object *gobj;
+	int ret;
 
 	gobj = drm_gem_object_lookup(client->filp, bo_hdl);
 	if (!gobj) {
@@ -880,9 +863,26 @@ struct amdxdna_gem_obj *amdxdna_gem_get_obj(struct amdxdna_client *client,
 	}
 
 	abo = to_xdna_obj(gobj);
-	if (bo_type == AMDXDNA_BO_INVALID || abo->type == bo_type)
+	if (bo_type != AMDXDNA_BO_INVALID && abo->type != bo_type)
+		goto put_obj;
+
+	if (bo_type != AMDXDNA_BO_CMD || abo->mem.kva)
 		return abo;
 
+	if (abo->mem.size > SZ_32K) {
+		XDNA_ERR(xdna, "Cmd bo is too big %ld", abo->mem.size);
+		goto put_obj;
+	}
+
+	ret = amdxdna_gem_obj_vmap(abo, &abo->mem.kva);
+	if (ret) {
+		XDNA_ERR(xdna, "Vmap cmd bo failed, ret %d", ret);
+		goto put_obj;
+	}
+
+	return abo;
+
+put_obj:
 	drm_gem_object_put(gobj);
 	return NULL;
 }
-- 
2.34.1

