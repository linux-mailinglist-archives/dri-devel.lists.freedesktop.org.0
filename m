Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIalD4B+l2kOzQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 22:20:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80419162B67
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 22:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D806E10E06B;
	Thu, 19 Feb 2026 21:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4Wsyd4r5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010032.outbound.protection.outlook.com
 [40.93.198.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BE910E06B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 21:19:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCWVXiJv39fLgeppTsjTauGFt13Tw7/R/q4/6z1E/tuC0pwQXwEfR8TEEJJMtIcufwTWbBQw+D1KNrPkIUY5iYsVrqg/t7klnB7suQkZc3mS1uNvykNdjDxc+TOpj5gaB/D+CesZXcDfKeY2KRESYV7HA8hH3C0F/EJ25Q2eTe6nMmVl65OxDInCzdO/irjyLMxuimDsyBTX3tCA1Pk+2rU90uFIsTeaJNlNPxEK7oElcVS9EiMbEuN3qS69hDg0LSKazOljcZM3oJbswJTBgrGx2SKoLR4TBi7Yj93h8uZcBS0VleV+/8gmGXw3lySn70Wy2YcDJuL0Et+uITYRFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUc7zGpIy5zXbrLsPuWC5nPZeQIRnafVE4NTIbrGKEE=;
 b=F1ul32jdk/JCEIPsyPGqndtj52/2s+B0e/6IEOQi52GIGvrplSXv2+SfYodQXB7oYnPp/BovU72ziUJDelgnHlKf2Zw2b3L6XXQybNIVlZK9FgMnGlW+VncOoT+yLVFaY526/hniuNw8Spfn8PqzcxdIbGGby4Fv4fngwv2zrBO5yLgMHJZ9DAF6Sj11V+8YhChqepjOU8OBkGoPGuKCB2xRNSO7rwOBHEIKSIOKz/t6Izmf8H5v2Rrvcg9H/o0JVph77+cSYvKSe8w6yH4EA9paZOFn80IJBSTIzSkmdywZma/WFwPlf0I77EbDEfbUGxYh9SHta8MEqgijhQiCoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUc7zGpIy5zXbrLsPuWC5nPZeQIRnafVE4NTIbrGKEE=;
 b=4Wsyd4r5QTbwbpGp8Qv/KCiClXNKQZkmAOnksC43VeJr91xdA+QsV2r2WztSZEE3UrZenZnZ8xfYP1NznDzqOo+cY0BnvUkCCMXKKdOWpNKV/3xmfRRoMLdOgOOyT34QSWUU0R5C+OEXQXvcy8MweUuECE10W1qZAvlClx2YsWI=
Received: from SA9P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::15)
 by SJ0PR12MB8616.namprd12.prod.outlook.com (2603:10b6:a03:485::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 21:19:50 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:26:cafe::a6) by SA9P223CA0010.outlook.office365.com
 (2603:10b6:806:26::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Thu,
 19 Feb 2026 21:19:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 21:19:49 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Feb
 2026 15:19:48 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 19 Feb 2026 15:19:48 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Validate command buffer payload count
Date: Thu, 19 Feb 2026 13:19:46 -0800
Message-ID: <20260219211946.1920485-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|SJ0PR12MB8616:EE_
X-MS-Office365-Filtering-Correlation-Id: c6916155-52e8-42f8-2c77-08de6ffc9d53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fuT5gdMX3ra2iyRHmic8aqRkrXjrDm2EXiNAX7bIx/6tUNnlYATczHRWF16d?=
 =?us-ascii?Q?14XhMdyJrwv+KMR6TV2QUzZ03iSRUj35twpECTZgc06ydED8JNSiuUqmm7Ki?=
 =?us-ascii?Q?tDSLTs3JJs+4fpZ37IcwiHuT2+Kntnh4AJjZST/uxZ3vyF3oVx9V2ioqMO/M?=
 =?us-ascii?Q?fdev17dzs+GlePDEvMBNXAdXNLMnjG7jaufA0HKuwDwed3yoFIMDkAxHF2du?=
 =?us-ascii?Q?ZjxzO5DFOWgyc9/rTVOOt9yNqbGez/K5egUQ+4lz7DxOMIgWnJexvydwXl/n?=
 =?us-ascii?Q?5+TD7N3ntdgXM3fzekGb6j+VP2eQHBRoLU8Ipf+LyhR3GfgvoVBD5uyUi3Yc?=
 =?us-ascii?Q?CrU0Ypyvcak1I/8mXLUlHjEs8tSIoLA1mCcJq6qvorVmvRF3gjUoEDtA8cMM?=
 =?us-ascii?Q?0P6c30Aw+QfUhP/c3mbFodDAOJODYVDJWJik9A35uphBjKRFPyTUbhruXKAw?=
 =?us-ascii?Q?gagW7x+7VobC5djMEgpUMhtHfTK+/DAf4zHc5worYe4ngvCtVgOTd6yBHv5J?=
 =?us-ascii?Q?5tlwhEOXMlDDZ2hTNK7fQqi/wChZEA9Y7xltoQ68/MYRUbkKjmgwo6yHgVbu?=
 =?us-ascii?Q?VGLHm4InNHHY97Bx1M6AqB3r03pRARewkKbaWbxtYolI7ZjoWrclbcQ7YQq5?=
 =?us-ascii?Q?ihAuyxGnMSuP0QY7zQ1VD2ZaLTEhgmexIwOP8lX5MHuI+ys+h6Qu5tGSqzKl?=
 =?us-ascii?Q?sQEVf0cJRsMK7oUEQDc/Rc7zKaOswNF5foNOLaNAn+SFOjWcH/E4NL9TZ8VG?=
 =?us-ascii?Q?4mGtvWWp5/u8DErkLtq7zSeyeue7XIHRkQe2D6conCIKaZX7GWJuSZApsfRp?=
 =?us-ascii?Q?TVZaReYXSUTW8xpAT4q3RExO5O74gJgs+4epnHAHRMBQo7KjQBcX5w5ufRsC?=
 =?us-ascii?Q?ueTLZTBp1zNx+P/hy6WMsLaUXNmiX014+uiuaxORTMEfXBEbp/B8tNOHAEOk?=
 =?us-ascii?Q?5/wgt9Rm/gTPvGzrXU9Rl2nUmE33PjC1gUq7Z6EbhdFbw2BJOlkxZejkxl/X?=
 =?us-ascii?Q?zye41O21Iygn/f/CRMA1pczXb1X4sIVHA20nX+68kDmoqplBU/buGP/OClc9?=
 =?us-ascii?Q?MrZswqPwAHqfDzTMKTj5TPw+JenMc7zAN4amelhMSdotS1Y5DCkbO9FlY93D?=
 =?us-ascii?Q?4b1tUytxsmq03H2MeNjP/sYgs7RBQash4N3ofsoPmsAX3ZLfp/XZQsPu7Lce?=
 =?us-ascii?Q?JZ09opE5g8j7+6IwdkukRKBUf8YzbxcBhdGp0lG0L1LQWXum31pnaj/PJMlA?=
 =?us-ascii?Q?gAgYugqTcJCAG2ku/bSEk+bZf+orotjMlth61NDyPmBs0ID9f2BMGAM8XhAF?=
 =?us-ascii?Q?z+TeGy+FalfwoZxHfEkIhVVuBddWr1E9iBbK8Ub2XGE58zKsByPnbQAmTgOy?=
 =?us-ascii?Q?N0JFFOkguR9FpFu7eIyArFhGGpjIWnclg3HmFTtCy8ldNR3jvuYUkaLCpunk?=
 =?us-ascii?Q?4RKg6S/tXEuyF8+Dsx76jDgK9QfrUI/QUPPmHuOhflrqFVacG7tsaoh+odae?=
 =?us-ascii?Q?8RN62dCYyfaA9Yci+ZMWN3gA645hXivDB5bPkg3EbJJofxwBsB4koAr1fTzq?=
 =?us-ascii?Q?u05hZj2aQp2dSiBBtMWtPWGjWue0jH+OB+khEjTq2bu95t2/XjnATZsfyB2u?=
 =?us-ascii?Q?J0Kq3hodFDYHTa4Uvygrol8vtHMnF9Xni1oYzSNSOPnQlqK3lgb/3dHhqDMP?=
 =?us-ascii?Q?3WdOcg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LmhINTvd9DJ4kqLfTaDvWDUqtQ6tx91SRYo7Ik7OBhZWHR6Y9bqepvKJFaMzlCOh/KV7xn4cvIGWOGkr9PJo/2jwIOpH/jbaqv2JUm1GxO74Bqra1D/bSyoiR0CE4hWTZGj8IxPB/P/goDskdRR+tovaIBCoBZuB6b3mBf/qzVt9gsz0dBc6Juf4EMTZMxeCy+iIpgCp7oKw5YhyrgeAfCiU3C4QGMTpHpMuBMA8bRO7iXt9MAh1bq91nKL4dd4G8EI6MNM5pA/eAhL6GERAAfk0rym8/zYOViQpcqWYoCqzlXb5Xk7LvOkXHDYH4mmqbR98U/TW0KWUJV65uF7qRWtfWQX91nbu3P8q8vAQr+BsBF9zpkbpV6S7VOAJFjnCm9ZvLkZjwe3yiueAGGmYA41LE92aucodN5S6yOeGiaSMq1n/pUIL9bifTVWOYdC8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 21:19:49.4802 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6916155-52e8-42f8-2c77-08de6ffc9d53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8616
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 80419162B67
X-Rspamd-Action: no action

The count field in the command header is used to determine the valid
payload size. Verify that the valid payload does not exceed the remaining
buffer space.

Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/amdxdna_ctx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index d17aef89a0ad..cf4d3af67bf7 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -104,7 +104,10 @@ void *amdxdna_cmd_get_payload(struct amdxdna_gem_obj *abo, u32 *size)
 
 	if (size) {
 		count = FIELD_GET(AMDXDNA_CMD_COUNT, cmd->header);
-		if (unlikely(count <= num_masks)) {
+		if (unlikely(count <= num_masks ||
+			     count * sizeof(u32) +
+			     offsetof(struct amdxdna_cmd, data[0]) >
+			     abo->mem.size)) {
 			*size = 0;
 			return NULL;
 		}
-- 
2.34.1

