Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPPeCDuEhWmqCwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:03:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E8AFA89D
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E3610E35F;
	Fri,  6 Feb 2026 06:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eVgdk2L1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011005.outbound.protection.outlook.com [40.107.208.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8498E10E35F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 06:03:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LmUOT/u+D6mB1VW39MrAwolSye3p05+gx5kcBex700SYZeHHGBp8F6EEb0AV/3bcqSWWpqsOm/mnGXtxvB7lW7XvBz+zrqLjC/4/gtdP3YxkDzj6M9J9SKyAPMu05nQ/REr1VYv6eP9REBejxDTSHuIq93owGLCGOV9Qp/aryaKphYJr03iEdiinRXXbxZUnmZLgRF9kR+zd2USYnCUMgvKw+Q0DdAIx0cejwGi9RvVvUz470btvY9eKKkTUxd2luaEJe4wDqy4yUjqbTfzxhX0jKA8U+s0KnHVG4z0lXSrVMMdxKPr3aZSCmBxs0qG/tYAzXRqMsZaQ57ZnvAC6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxGpOL5ETgFmMREocoawkzOkj7JN34zdhg2pExGG0hY=;
 b=uURK/R8qszOapTYYJ2NZjMowJ675UFaLd0cXf36UG2t3gg2jfMH2FjnA2R+xTc0HhFi3SQtbsmdsYicsQM45w1gu+Z/4jJEhqLk3FgZJLDFJsenk0HGOUGODBGxy8KQ7+37bFeEn2GloTmZDjX554br/9e+iEsJGcjONtQiPP6NfB7Gda7lpsrwCVNrOQ1+j08T9ZjP4mqDXJsdTXXHdL2DZh9cpACWL4OuXzXEXv8b/PcHkTVB6X5Zg9NTFiM9WEArOenD9SCPzpjPv+9yqdsW9xSksepVDP4pYjATfZ/A7NnHwXpr2p8NG+98oMOe6S28HANzZlrpi9MWVUQtWiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxGpOL5ETgFmMREocoawkzOkj7JN34zdhg2pExGG0hY=;
 b=eVgdk2L1te4Znyl0xHsD3IdyWZluKcoQftSUMhy4y3s9rEC+wm2yH0lUCTpQj4ewBxV1kXwnnbEjekz+Ng+shTiiCbTnyH8FA3o5I87lvaQ9s+dHA7Wbg+7Yq1J15wmvA4qNvKxF/7lcQhIJOqnAwF45Dt6rLCJcgKKddCyzVN4=
Received: from BYAPR06CA0023.namprd06.prod.outlook.com (2603:10b6:a03:d4::36)
 by MN0PR12MB5739.namprd12.prod.outlook.com (2603:10b6:208:372::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 06:03:30 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:d4:cafe::d) by BYAPR06CA0023.outlook.office365.com
 (2603:10b6:a03:d4::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Fri,
 6 Feb 2026 06:03:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 06:03:30 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 00:03:12 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Feb
 2026 22:03:12 -0800
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 5 Feb 2026 22:03:11 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Fix crash when destroying a suspended
 hardware context
Date: Thu, 5 Feb 2026 22:03:06 -0800
Message-ID: <20260206060306.4050531-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|MN0PR12MB5739:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de555ec-4ecc-4dd3-cc46-08de654573ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UktgcEJTuTP63apnnD7igTzp1+47TFauXDfI1Dt7Ga8nJiFU1nKA19MmE/QU?=
 =?us-ascii?Q?+qebD8hKFl58Kt5WNkZLZtg8v12fIy3+nF70nIYTVzTHO0oeOM4nv55wf8WY?=
 =?us-ascii?Q?1gd4TOUW70FM1nMz1ae2ZVKlQSo0zc3jQ7QpjFt8kz2CYr21Guzj7fpC4JAG?=
 =?us-ascii?Q?/NYw6I8zRkvOADb/BsfSPAMbn/e6KEYER8yjrCCRCcFjb6VjAyhKRlmhhSAf?=
 =?us-ascii?Q?djkX1D5WMpnK+yj7R7ZSZPweHSTHhvj8eF3GbV1o0mSL7NW/MiMHowLvKImj?=
 =?us-ascii?Q?OormkUc1uq3ym/VQQuV4z9Z4wpHqBoKwy2Vn+6xQwvYJxUR5EhAdcm4mBoK5?=
 =?us-ascii?Q?f60mm8AYmREC7DxvfaAzhYZQW44w6tM9cDc5QIBCBYO9OiHn5jCdOgaOHAIx?=
 =?us-ascii?Q?18BYfMqyjPeuygKfRklDlU4X1HphnMDKDNP7wPu0cj65zv/lk9REmygeURcX?=
 =?us-ascii?Q?xx8KMfh8TRLQaH9/o/xE0dXwwzakUqwAP/glhPQ3S7gzeG5fg+XmhINtae9k?=
 =?us-ascii?Q?yOhNcHBnBmLZrqhaLV05ewpbU9NvVTugRJ1v5vTMMGr995IquSNoQ7inAUYk?=
 =?us-ascii?Q?zv8SwklTkQJUsSKKXgep80agWPrvjeU6pDudBDh1TNVgZ9+2jeJhKo82+STQ?=
 =?us-ascii?Q?Fhr9iFvfDfGpfUmf+gd134YyrEIU5jZn+q/9yWOvpVh0LXuN9uJaNoHHNium?=
 =?us-ascii?Q?eezUgOq5uzZJk7KRgU5P0xFN2z2RsiFg25YtbnJ29+u2gw6BTSjNUuUduk2O?=
 =?us-ascii?Q?cc/sXDQxnT8IK/Ihe/XEnfiSMEW3fIP3C6ladtidHfT43y0nhBfNE8yecs/n?=
 =?us-ascii?Q?GsucOJyZLbcGTEM0JUIkOc1gi946iFJGJSrSUOOl8oL+DHIFwWa4IN2drstb?=
 =?us-ascii?Q?+dQ3Yd16WX2nReQGkOgnEw7aSfziNbquoGXOkhG22U+J9AfdOCq31dPiMLVQ?=
 =?us-ascii?Q?qYskHWmQ3OF4qTjull3PnxmIv0qM6IzOXxxs4NVyP36PHbVVuqENGWCQ4WdE?=
 =?us-ascii?Q?eGMEmdwVIscQJ0B/YlMELyhtPnKeE7add3VwloMgRrHcqF5brffg7M/lBbiE?=
 =?us-ascii?Q?02ozkG33vvSVhQ+kWLLqLz9bhNAQQ2D1LLFMfdCV2GcPf0rCDWX9shxpIkD+?=
 =?us-ascii?Q?1JaW9mtLmZzy0wz+bQdycVu8UySMMG3sRgJwvK9vg6Wwx9qswvVqJyKsJd7G?=
 =?us-ascii?Q?jmZIu1UneVFOQPS6MrhdeKT/HN+hgK3NvYRMOM6yRIb+lGjzgk23Zyb+qkav?=
 =?us-ascii?Q?6VVzSjjk78N1xyk0Z80ikRY+rxcWSPy9eOxdW4k1pu5SjXmqKA4KDAk7b5Ld?=
 =?us-ascii?Q?BCB259gOoUVtmJJOasch9yu/RTH5R78SqnrzAINLKSIM2lSBz7yOXoD+q6qJ?=
 =?us-ascii?Q?ru2WTvPG+GvwgR7ZsQyN+gf/Qzi82OZFv2c3TwJfCK0Lil4D/nI2wJhrWuq3?=
 =?us-ascii?Q?I3okznup5nhpv2RTDSHHz3MFiU6/gmtC+4ZJ2KS9HZfbIEuqw4Dwn7vxcEqs?=
 =?us-ascii?Q?rtwpoinbM/oody8dKTaFMsgZAEPbQqWW7g2tk4ay2dEOZNfE2S8/6iPSqEY+?=
 =?us-ascii?Q?Sd+g7bcN9rWf1XOOKPQ2egntCPmth0/XWjk1w94fW2kmJjTEPG3B6GsVPp7S?=
 =?us-ascii?Q?eWXAs+yG3M0qQAV531/ChHN8r2/bWz4uRjpjuBw4M48J45SP9MKrXxwh4kvF?=
 =?us-ascii?Q?9RQbUQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: J6dtuI9GEI6V2YmAQxJvno34fWC+yHLwxgTUhYdBRiFZ1DRaqUv5reruwbsw7F4KsVdghoKsngWERmfbkvdkcAYL4A2t1olDPpErx2HEGaejp720d9wFHhVDENRwzWq2HSWmRuybHx1voqYZKhRYwdzyrpRNqqMWoQjBYZSbcO4t9cN75vzGzoyRiqC62rVsyEb00Jk5Vs1bI/SIVDXMYZ2yfp88iMoYi/FICTYlu8npLkRUNObhBdcu+Wxcgdvk6JHwFKfI28i2PvQ6TW87A+VsQEHgF8jNNni/EWAnPE9Q9o8EAaYy9FTodTIh2rx8jlqtDczdrQi3Q3phsxutNNbkqwxavjhpOHwyjlwEhEm+FTcAn8ztjEywe1r1kCs+oXMa3sktlotp9zDortqlkMv3dJrK5VzMxed6gYVKeIphi5NBfhu2wgdkT4EmIvKJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 06:03:30.5146 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de555ec-4ecc-4dd3-cc46-08de654573ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5739
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
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
X-Rspamd-Queue-Id: 91E8AFA89D
X-Rspamd-Action: no action

If userspace issues an ioctl to destroy a hardware context that has
already been automatically suspended, the driver may crash because the
mailbox channel pointer is NULL for the suspended context.

Fix this by checking the mailbox channel pointer in aie2_destroy_context()
before accessing it.

Fixes: 97f27573837e ("accel/amdxdna: Fix potential NULL pointer dereference in context cleanup")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_message.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 7d7dcfeaf794..ab1178850c47 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -318,6 +318,9 @@ int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwc
 	struct amdxdna_dev *xdna = ndev->xdna;
 	int ret;
 
+	if (!hwctx->priv->mbox_chann)
+		return 0;
+
 	xdna_mailbox_stop_channel(hwctx->priv->mbox_chann);
 	ret = aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
 	xdna_mailbox_destroy_channel(hwctx->priv->mbox_chann);
-- 
2.34.1

