Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBieDjJBgmlHRQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:40:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799EEDDBB3
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A39010E1B7;
	Tue,  3 Feb 2026 18:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mO8d4Bd3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012062.outbound.protection.outlook.com
 [40.107.200.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF7B10E1B7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 18:40:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbxRhFrTUJ9WK1ym5VSs1+qkycTSHBi63kYBxeqzHDr9ylR5uhWR5cSpRMsE5yPCBCUXZZwN4Ltg7hRZEAZBj34u0Qovw68T+hkg/RdrzYQXziQ0r4A1OKT6UfcR+6pXxf+h+Eopd0exGRisUTD9QJaWlwf9vH8AbYs3lj2WG46T6NNYeM1hmQGUB5FqJEM3H2j4S61tlMb3qATg0rdY63Gq+VNw+hA9CIQCVMPL6ldltr+vMvJhLoLJroUmKwxvjBhwxw2T4cHKYFjZ2sK0kJUiOOqtm6C35NKJD+75qk+4TOplNEc9t0mrhl5qWWsa5IpOm+u2CTjTTD2+Hx/46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNGRCT8pDP24YWKOHNE3cIc4NdPrx6pa3E2YFvXtoKI=;
 b=h1W1ovltcEVTThAYMMVMGHiUADmGxFxCuu/nkvd491lEP2alodI1naQJwYcgc/AVj/chlcbXShUaBAVTaD6sdmqvuPJy0I3PPvA4/d3KrDwl++C7u0iZzHlzx/ILCSsuJvWu1Fsv98XFihaMuXMRFOGae/wgO+HKBkWJVD8LfE5svFi8SfKLu5mzAnUiG5t0uRk3ndJ2jIqmJf8qBblOiwZY/G7Sm5OW+IPwft2Dz52sTmFR/JTwzoeYbO09No4Xkbf/wnq1dAR0ff5JYwHslJExgA4+dtrNTAGFE0Orvh7L42j4qU2u4161NGtyLmJRuVv0lVCxQ/TYP7npDnk69A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNGRCT8pDP24YWKOHNE3cIc4NdPrx6pa3E2YFvXtoKI=;
 b=mO8d4Bd3Tg+Hc8TE/7EN4OAKqidHyvqWgflkFGsuB1fqayOvxcn2aT5pJEc96DZmce0BFfNhnZuu6h2cRaDUDHJXki20SC+EbEZH1BXR43JRnFzfzvs82Le56LrpIAhUb77hWPPLmb4ANa/cNn8yonX4ytWkGsyjK3LHZpXyysY=
Received: from BN9PR03CA0192.namprd03.prod.outlook.com (2603:10b6:408:f9::17)
 by MW4PR12MB5668.namprd12.prod.outlook.com (2603:10b6:303:16b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 18:40:40 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:f9:cafe::77) by BN9PR03CA0192.outlook.office365.com
 (2603:10b6:408:f9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.13 via Frontend Transport; Tue,
 3 Feb 2026 18:40:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Tue, 3 Feb 2026 18:40:40 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 12:40:39 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 10:40:39 -0800
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Feb 2026 12:40:39 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Fix incorrect error code returned for
 failed chain command
Date: Tue, 3 Feb 2026 10:40:37 -0800
Message-ID: <20260203184037.2751889-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|MW4PR12MB5668:EE_
X-MS-Office365-Filtering-Correlation-Id: fbd25d00-2560-4595-9d73-08de6353baef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8Tht1ANNrkqJtslXqbdBbm69Ze1qCvdo7G4UHkSBzeIJZXGNRRjwqh7xTEpc?=
 =?us-ascii?Q?J+By6lRTP3p1e4tLIB7LnqqlNArplTYujtNPF98CndfbccSvOF7OyNp0q+yn?=
 =?us-ascii?Q?CpMBkp5E5FUvxInmr8BWl5C4LVblMFpk+JoyvlLq+LCbRMTOVJZuVLr30Kyv?=
 =?us-ascii?Q?WOiFNkGece0+A2zQqPBHf8StecpAhpnyPFX2vkVRDntRPXcw3l33R/xdfwTr?=
 =?us-ascii?Q?cK8mqXJTxk3ZJPTMOEnTdyn6NBMgVD7aKHpVJpfIdc1kAHJXRxi46J/cP8rk?=
 =?us-ascii?Q?L9UxGXzYOxaIRJKoyGh1EGRDbtFN8l7KwZFmKWa7Uo3NOma4vbVQr57/+hfQ?=
 =?us-ascii?Q?nHmA55XHb/GWg61Egf9nJLWcRQFudVU7l+5Jg+WDKp0vRSnPTebMhaWMEAqA?=
 =?us-ascii?Q?e00kJssN4iU0I0z1KFsxjPEQM07kdget8rR0NbuGf9jRP1+9qirCS/J6Cywq?=
 =?us-ascii?Q?KZxVCzce1bu1phGoa8ejGijLWRd2hHmuegO0FxC28VqVjdqUBU4llh5ZPXNl?=
 =?us-ascii?Q?GlG0de5h7tEPcUqExBiyEpavxlutHRrU8VMEWV9dpQr96U1qaEhNQBiSKzn2?=
 =?us-ascii?Q?8DgilSKJjKcGH0zHpsCaGSjUJ9o84goab7+ddQoVdkPSNzGEaD6jmVflvZzM?=
 =?us-ascii?Q?fF1NgQfHxV0JuAV3rT6mgFC+2QEnIYd3oCnFzZkFnra03AG/efSjYYwl3Xfg?=
 =?us-ascii?Q?U2/8f4FgvIl/SjQ+o3daFeoW5/V/kAWZIAHvnkTxl2lew/Xz0RjO6+HkjhY1?=
 =?us-ascii?Q?6q/YaB36rU4kA1mR16A9oU+rlmrh/ewJbpmhB78GJEkvVYuZpLQq4xdogQJi?=
 =?us-ascii?Q?X1nf1jmVUNfOvzHbmKN7ZAElm2posmQrzHOcjCLR7LFIoUt7zsMMybv1IWMo?=
 =?us-ascii?Q?D3qT4CQ/IFNTCsWv1N044gt1DWw8h5gtKUMVtBEQ84jBHpT5IPeQBoL1mFmc?=
 =?us-ascii?Q?kFzjn3GEqifIA00TqNy+WJiRUC9mpMg0WeetnxF77lhzZH6Hu8HerTAI7J40?=
 =?us-ascii?Q?hfEkWuIVo0dsirbqu1A0JbMh2fPv/fff8UTIYHIrlx2n84VIQu4wPxISCSy5?=
 =?us-ascii?Q?ygGGrDncsRt+lGL1hnkLSPYOYlFwbWMmaZObNwNrrh8YaFnANQW+mw8K5YMo?=
 =?us-ascii?Q?gOtPx9ZRfNv91YEv1k0HQZdCmaG+Dl+5UsE7mNc1vb4OC449VH+JPHL3crJ0?=
 =?us-ascii?Q?/SpnllS17EVrv3IV9hxfMs0//at9rHffLOwyNbZ2Nb7WJqSTT94MoccDXQgy?=
 =?us-ascii?Q?kDUMa3OAEVnaR6y7HIGPp6PKqsjgja0h02SMQ1HqJrdopY6gkdhSe7p7C+/C?=
 =?us-ascii?Q?SjW61+Tj5GrCby8XWp/dTidv029edip32RRkStB8ROOGYISZGxBvTQb1y8in?=
 =?us-ascii?Q?v8DQ+cdi9GR0h9JUec1ASh4Z4qAnbemdhtDCXRcczftNLnyf84c35JbgRIFM?=
 =?us-ascii?Q?LTPa8vBEHApBdaxLJ4MutMpcwo/VCfjy3Ndy9az4ouaRbpFpa/Y73VyO3MFo?=
 =?us-ascii?Q?dJHaVwwLtqhPzbb71V5w5+Mdo7pwkHlNa5LkzrS4dyl2xCVQn4lyvXZd2275?=
 =?us-ascii?Q?q+a147drzc8fzZzsKgUc1XENm5titFpxp5R0nMJ5V89HmRgJ/Lw55STrYEEZ?=
 =?us-ascii?Q?UCkO+q9yxnCPKoqoy/bxtzHjJY4b6LbFGxJt9/Ouggm/b4fQ9khIwoxRDmYt?=
 =?us-ascii?Q?Gju5uQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3wvZryjUHbNH11wEB4vsajGIuIg8ca6swfP5o4gJlANCrlsgQhevld65W4TE52lx7CCQBNvkY7a2I7YblLHHwNmlqj3te2qrjcAiH5ZEme5LG8++5sBn+nWbFKVgxyhOYgPZGWsVcZnPd0d87j8BlHxeAVzSPowvsmLuabWOBB/kqrzscdkQOQv9n7ALyts/R0nDntIfeDjBxRXvZW7scyYgl2B4s2e7JKX4Xd9Rcda8HAZQffwA2mRDwgAQ5DAsnMEXMb1KpIlqw/90OAx61dv9pfGfDyo3BUNSjZtx4ytrI4+U7PLxbmEFj5scrblO0Q+9l+MD8wK2SWbZdxFtQQnqA9FNXqZ8VA5uplO3Mx9wCuftqGDu6sGOnxDqfA8RbqSTmYAb2ljyQ5/U+Myal5nvfYmW6SDgfrLLNXeDanr/pcmcxpgaeXKNHWmcpZhU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 18:40:40.2459 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd25d00-2560-4595-9d73-08de6353baef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5668
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
X-Rspamd-Queue-Id: 799EEDDBB3
X-Rspamd-Action: no action

The driver currently returns an incorrect error code when a chain command
fails. In this case, ERT_CMD_STATE_ERROR is expected to be reported for
failed chain commands.

Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index ad5b5cd0bc81..fe8f9783a73c 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -274,7 +274,7 @@ aie2_sched_cmdlist_resp_handler(void *handle, void __iomem *data, size_t size)
 		ret = -EINVAL;
 		goto out;
 	}
-	amdxdna_cmd_set_state(cmd_abo, fail_cmd_status);
+	amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ERROR);
 
 	if (amdxdna_cmd_get_op(cmd_abo) == ERT_CMD_CHAIN) {
 		struct amdxdna_cmd_chain *cc = amdxdna_cmd_get_payload(cmd_abo, NULL);
-- 
2.34.1

