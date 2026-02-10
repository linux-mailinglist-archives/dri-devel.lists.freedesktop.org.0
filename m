Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKpkKS+Ei2neVAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 20:17:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E2411E911
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 20:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B601D10E3B0;
	Tue, 10 Feb 2026 19:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uvstinj/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013014.outbound.protection.outlook.com
 [40.93.201.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F95310E3B0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 19:16:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXI0wFyPgJ2n+n95eF+tH4hy10Inyr6PSf0Fij2mfjyLyHLqdIcJYemZgEL4MpSKfI5Hqbo2ENwizDcsuBhdMTREtARSqNfCQR/L9nmS7OnzfR5R7LF7YbZrVSZccCo2C3OKbcCDgCL9ZRxNxC49Gqq8nRcDQNhRi/RaNYY6NZt6w0svYcvyl7idLIvY8pJZFgKXEgVAiQX3yxtzfLNQQ5ATuE9kxp6UdaYO8M7QgQGEr/oLRI7UlEOP1SHPCg2T/EPFYmEPNo031Rw11vfKYBv0GaGFtUbI1BlBNhOQTo6eaAOpUc79S2kcAW7QWb9BBhnW1gzxFjoGCf5INJtVFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNT9QtCdhNSePpiRGOOrsGMNZqqkz6KPMDUxwz4aIYA=;
 b=fyVeXV9lATiIHxBaoyI3HXcKdYEOWCnVcoHR9jo3jchmyR1lpjsSFaDj4oQFcQbSJNizvb1mxfegK5g8eZdgS244EiNsv8FwxpF34SFJQFF2laGrIw0V997cD6xrU+skOGfC3XXkdUuzbEyyFz73UkQLEiu/RZj0f17IEWzI/3QhyQnCwihdeMWrdhV+9EYOd6gBLsdj4tE4y4M/baNbpsCO0NmeXKn5Q1tqtV0MuI2EXAycEcC0HRxIjB1wMl7Jvb7Zr58qIlCs9iAaMJ+V9OwCLNaSunuSMsCWZZLUf6d8WWh4mFxnzUUOVXJFm36o/CQOkvfPwvwT8NrbHs7YPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNT9QtCdhNSePpiRGOOrsGMNZqqkz6KPMDUxwz4aIYA=;
 b=uvstinj/0yQ0+Cx4TWi6iZsAbLm9RRAdPx2k0UACMEnY0kKco9t+sWapBlkVNNohcGIJJqtl1rB1ZaNWe9HaJqdI9Z6xj4ffcrCWr6phaqHiYx7OUnDEgqGPKrFA3BTOWrQv9dtbRucAGX/b83McChkKguuMt52XFpYQvy8GeKU=
Received: from BY3PR05CA0001.namprd05.prod.outlook.com (2603:10b6:a03:254::6)
 by DS0PR12MB9421.namprd12.prod.outlook.com (2603:10b6:8:1a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 19:16:54 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::c5) by BY3PR05CA0001.outlook.office365.com
 (2603:10b6:a03:254::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.6 via Frontend Transport; Tue,
 10 Feb 2026 19:16:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 19:16:53 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 13:16:53 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 10 Feb 2026 13:16:52 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Fix suspend failure after enabling turbo
 mode
Date: Tue, 10 Feb 2026 11:16:52 -0800
Message-ID: <20260210191652.312000-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|DS0PR12MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: 3230faef-3ad3-4c47-1b35-08de68d8f35c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O3EgbkuTCTQZi3fMqK/XExgCQ75mlhjTXmUVx2AQHlIHMvCySZyw49HQB0ic?=
 =?us-ascii?Q?SfrWGxwzuedoLaqHwMh8S6GW98sQs0e6CF14j4WekwnF3bNBwv9BmpTqG3eO?=
 =?us-ascii?Q?Bboi4sBEBAQumg6KaBb0R3rgxq/AixgFPOF4oheYL1vlidjY4w1t3ISF/F9E?=
 =?us-ascii?Q?GVHCfaCplV1Uae2S55SYgB+uhK/etZSwPqdutCXuDgtA/VmhwYIcqbF2nTxC?=
 =?us-ascii?Q?Eb++cJANJHTUNmNxa+F5NEHsJ7mtgfUvmUrGPONWulxesCMrvMzp94NjCMrB?=
 =?us-ascii?Q?kiphwR42chicNkavsOx+xLLAqJe8DiEan5i0Qf/hpRMHTYLbHQFLGI4gYwkm?=
 =?us-ascii?Q?6O14MGaMVTEtJOs9tApW1m7vG7QyQNlOtrpcRDKoFu/C8AivE6aY1TLUzcN/?=
 =?us-ascii?Q?lJ6HxDq2xr49rNXsQW4vOMkHOtNSZpABKPeaOLFi+tstei17TOC9WckEmtRR?=
 =?us-ascii?Q?LZv5++Uu4j8i1aM8dPiwtx/0MWs+hGB4FNSwt402rLC2PwSuyJKoK56s33u/?=
 =?us-ascii?Q?4iTEE288Jiws9+ohauA+T4/7fA7W5JDmLaD/EB5no/1j8jkRKnL3slmvHIf0?=
 =?us-ascii?Q?33uV4S6cSprLIMLOO5/1NX521qBcCU5jPpiNq/h3t+HV37ifuebR/FS8QmI3?=
 =?us-ascii?Q?itDE74HRoe985SeBqVvqrZgU9aBPvZdO92H+hSQuGG6YaagMjaX1hjTKb6ee?=
 =?us-ascii?Q?6WPP7UqJaCO1GiocZ4iTG20qVwMrXlz56ZZ7l9mPDYCZlWNYYvYgD7OSvuuw?=
 =?us-ascii?Q?oK5kIdwOcs/R680/mvJ+DPzukT8FWU1y+QPm2nfHHTAzmBVX7VLQiva2jziL?=
 =?us-ascii?Q?MkXHfVwBMul5qaLBQGqDjULZIvQ1XT81RyzG91KK3WztyxFRHhmVf4YIexVG?=
 =?us-ascii?Q?XgRx5890Fxq2zRYO52N62dt+AX2rUFF+Lja3v+XyhLanQ0Rh78twPR9vJ0+5?=
 =?us-ascii?Q?zCzzUjsyM485evuzANJel5hx/ehGHxoE9gHVqVFqDTjIqef1sMX0SA6nVWdr?=
 =?us-ascii?Q?6Pg50yqfe/JUF4dpFK0Pk0cRDNc1MZyzzPFhU/rD7vWrDRF4mh4fjLKuEn8W?=
 =?us-ascii?Q?I9vOpvwZn1x8ImP+yQ3vV4IfuMF0MLtxUXFdDh1z2MTCxs10nmLWqN/dz2+r?=
 =?us-ascii?Q?wa++4h7/RG/BRciXAvk6kJCGHVUdFCf4KSfxFIm4vQW4a/zNuiMHJROVg4Fi?=
 =?us-ascii?Q?mRP06wyAmRYv8QyiubqDw0jrXSWYWdRrJpLzkMGVTd+XYoNid0FUvp1+wyFY?=
 =?us-ascii?Q?nIu4F5IV6IT2pGpkO6EA7n1AOEAXJotvGqEgaK3zQQlUi7FDThGVsc7axvbE?=
 =?us-ascii?Q?sSU0MlNHEiXbd0ZicytMa6nOeRP/Kk9ZBawd4ZxrhVphyEzCrg0aNJ52SQTU?=
 =?us-ascii?Q?zkcYM8z9+VjcCl7cB4sCfq0MpHK7/p1fZaTUhMWEEMWIkV5RHXwvE9xZyx+F?=
 =?us-ascii?Q?y7R76k5JJFxrGtf13K2noFwLThw2YKtyIcPKFMrjvi5mo+Ir9yPuu7EvSJMB?=
 =?us-ascii?Q?jM82VTIKrwucQiz7pCpes0vlMdoT4ezf3o0iqmTkrnZfi7jvPNctdyiKIcrJ?=
 =?us-ascii?Q?7sp57yXjz0PMHTmNHZL5N8a6Qt5sg0e4TDRRFqWQyKS8tYY5CzoHv6gV3JGb?=
 =?us-ascii?Q?n8ee+AZkBQ2Sm+5gpda1bEFISlQ/DodbfBEjV772BIUYqlMK4yg8knXt/69A?=
 =?us-ascii?Q?zOsa7Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vfLoVrTlv6a+P7ew73ImbwVAh848QAwYBJPQaqoXwGPdG2IXTABOBEdy8FFvg+4KMQciSUq3UqKGvCk7AvunFnh9hCHlk/cHY6a1Eyfc/3wY3aTaYtemsimvTjL4Z+Zb9k4vX7mP3xC5w0HK8A2TG5cBUjaJDWwrMLpOGb1alffrpPy24JA+OVT+Xm9pvDrPgMUcoOONmlyEpE3RCaMxDUG/lV995Ta9nbzikg2CpaGgP0J3TaSDglTEcvnrBLXwJX2ehi8xUnfzA3fR5bsWeuf0Ht6s82LbIzq2h2o4VcCtxAG13Dz2m5GjRSy+e0lCSbw+t5jLo0a1H10EGyn6oqSED/U4GV3/V6AaSf6SB4CQe5mO2rIW2tcOIdp4ZXsgAbzGLvBpScdqLS5Kzex/N5vDs6g8t3TypZ2vP98S1jgjLqiqzvNvuu4PuviWufo4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 19:16:53.7215 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3230faef-3ad3-4c47-1b35-08de68d8f35c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9421
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:lizhi.hou@amd.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 26E2411E911
X-Rspamd-Action: no action

Enabling turbo mode disables hardware clock gating. Suspend requires
hardware clock gating to be re-enabled, otherwise suspend will fail.
Fix this by calling aie2_runtime_cfg() from aie2_hw_stop() to
re-enable clock gating during suspend. Also ensure that firmware is
initialized in aie2_hw_start() before modifying clock-gating
settings during resume.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_pci.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 5b326e4610e6..0d41a6764892 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -323,6 +323,7 @@ static void aie2_hw_stop(struct amdxdna_dev *xdna)
 		return;
 	}
 
+	aie2_runtime_cfg(ndev, AIE2_RT_CFG_CLK_GATING, NULL);
 	aie2_mgmt_fw_fini(ndev);
 	xdna_mailbox_stop_channel(ndev->mgmt_chann);
 	xdna_mailbox_destroy_channel(ndev->mgmt_chann);
@@ -406,15 +407,15 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
 		goto stop_psp;
 	}
 
-	ret = aie2_pm_init(ndev);
+	ret = aie2_mgmt_fw_init(ndev);
 	if (ret) {
-		XDNA_ERR(xdna, "failed to init pm, ret %d", ret);
+		XDNA_ERR(xdna, "initial mgmt firmware failed, ret %d", ret);
 		goto destroy_mgmt_chann;
 	}
 
-	ret = aie2_mgmt_fw_init(ndev);
+	ret = aie2_pm_init(ndev);
 	if (ret) {
-		XDNA_ERR(xdna, "initial mgmt firmware failed, ret %d", ret);
+		XDNA_ERR(xdna, "failed to init pm, ret %d", ret);
 		goto destroy_mgmt_chann;
 	}
 
-- 
2.34.1

