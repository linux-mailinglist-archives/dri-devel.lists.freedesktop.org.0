Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKniLMHqjGmtvAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 21:46:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0151E12784A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 21:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A8110E646;
	Wed, 11 Feb 2026 20:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YxbDF3ax";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012054.outbound.protection.outlook.com
 [40.93.195.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232BE10E646
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 20:46:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e00aaJr9pL9XSs68mtEXrkLAZ2OppCMqMK5PKsKCJ/T1pgdRM6TQJWOzShPDSA2CumUgwe1Cd3t4PSMtApMYo0MPKUf/A/QXZh+sBJyhh0sR0A3oLXnAy3yLjmA0a1Q87pP116jxy5L129SKE+0LkY5jgCNwxXQtfWmGp/GoXGTy8PP5rW17fHZUZlYqsKlHx+/UYHzaqd0GyPa31EHxe2svUkMQ+uHYws7J0R6TwpPokQ4L4cWz7tIvRs9aqEQ4GNfr4GvCWSWFULrHxIGvCz3fvo9Ky2AX5yVJmCnmFRnpEgZtgnFl0GfOEF3Tih3JfxKKYkbG1XPFZvrdX/catg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnvrOa+KVUxwevA63c2Sph7JuCtzae09I6uYWME8aug=;
 b=IW7wWyxBh2t/7RJxFkC0L5omN6An0NEBdbAdM2NbO17q5WkE38EDJmbjUwBIc09Uh91uQwKMw1Z9c+VkzjsWZjkOPO+vaxEUHQLRiNLhP+DywSqGfbMKZZ4Zm6cy/0BsAJLN8DheFwrttuVm2GvFUbQb4l2tJh3f0C3fc+QWTWMp2E8lVTBRHzHkBaNOnibuFWgufRXaGnxgbp3yzNZ9P4jlIbdE1lq9CkSHwuk/c8hQO9sJEm2mGiGX1/Kv5eYMZ1jVuj77SSsv4zbHWPmNfIdu0PByTc3m+TtJjv27/qMjdSTulaxqJnkc32aq+W1IpczTvbNHS91pkK0EVu/mcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnvrOa+KVUxwevA63c2Sph7JuCtzae09I6uYWME8aug=;
 b=YxbDF3axbIIWi+MgpknoWiVgZ3mCx8jmsJcBfsNHbv2rcgQZYiRK98ra6SuExWpH8l3SI28vDPVU5H36/WLNe/5kvzB4SAp7Xfbh7eXphh8tM56YcQrcFGmandVuEl8ut6XDLVrfEOB23UPWhLo6zKeYOzCDhwax6qYmTZE2FY8=
Received: from BY3PR05CA0059.namprd05.prod.outlook.com (2603:10b6:a03:39b::34)
 by SJ5PPF1C7838BF6.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::98d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 20:46:48 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:39b:cafe::35) by BY3PR05CA0059.outlook.office365.com
 (2603:10b6:a03:39b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 20:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 20:46:47 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Feb
 2026 14:46:47 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 11 Feb 2026 14:46:46 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V2] accel/amdxdna: Fix dead lock for suspend and resume
Date: Wed, 11 Feb 2026 12:46:44 -0800
Message-ID: <20260211204644.722758-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|SJ5PPF1C7838BF6:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e9a2526-42e8-4c13-3440-08de69aeacfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y5PaOsw2q+Ua7tpInVrygNNvy1K4WW09dMPErdQ9kt241MWBOd4fNaZe312k?=
 =?us-ascii?Q?wNGUMHaRNlWJ3JnE4uH4ofhPgbr5T8jgmA7fn2VjP8aSVGGAgUIn3sr6yLiT?=
 =?us-ascii?Q?qAV3oKT5GiXLhsyIyvar1vTry4VBNpn8Qf6OMRrfaQeDNKGv59NNUOPJWaNP?=
 =?us-ascii?Q?ywTxxszd+Jb8i5Nxx1pxOus6id0raMMsQkP4KgcD+ZNjDxMf1GJuuFJT+JGt?=
 =?us-ascii?Q?rlxmSkMKFKbtPgXUjxUuM9trvJWwVwJSQZrhkifd7MiX/fN4iNduEty8GFNg?=
 =?us-ascii?Q?9wW8QCQPcvMIXu1tYLAzdqKJ6RFhfRutUkOjnfJS3JSZncf5yBgFQHOZF9H/?=
 =?us-ascii?Q?2l9G+o3tTLp9zEhGyWZAgBFVLA19r9ZIyQyjLKIOAT6MEiiXQxvyr6CxBjrN?=
 =?us-ascii?Q?/zdbcankV0VCYW/WIbXrbEokBgIrMzj0WQIIqZNq97mWFpEkVqxeOT4W4BT0?=
 =?us-ascii?Q?3fSQ9zBin/2N3lNjLK6LZ738NdYNfKkrCmnKJojairTB4/VxvtWnz9OjTZgV?=
 =?us-ascii?Q?JCrw33LkQiDAkF69y4y3VTn4BaZSSL507iRPNQsYxhWuIWN+KzfRxpt2y9SY?=
 =?us-ascii?Q?lV769H2O+IcY5NXk7hupINr44PS2yNydhj8Jeqzg92x+6NvPEXPlm5LKu5xm?=
 =?us-ascii?Q?JRxnPw1jJ5tE8yvM/edZd0sBXxPNthCsIdbo4L61HfJUPYvAVtVNZWApbXby?=
 =?us-ascii?Q?YU0NZyNOFU8vFFVG8oPY06hvwyKLNrL2J+zw7S1zAWQtTOgu2ohxPfqrnw2l?=
 =?us-ascii?Q?D+vmPYj15Sw7hBot6W4+35qndxh0SmFOKsImrWmoDtirzcIPgoq6Nfwc/1bw?=
 =?us-ascii?Q?oUwQ6+dLuaBz22oFZzhttl2iOpsokBKDmOQcUy41jZJIje+o6omWmWwZGSFq?=
 =?us-ascii?Q?ZM7sID5p7Ooj+bbP+wvp9FRXmOpocikGmq9YChqJp4GK7pmZlFa5Xm1uGTUK?=
 =?us-ascii?Q?OEXA2n0xtKcxK5MBZ9rmyFB/MIncskdWwAyAqXtC+ycEQxF+X7tec8o6PjUc?=
 =?us-ascii?Q?A3JERqa/ye7Nfy68aWnFatbhj54kFPhlMOZ4vW9B9A8fAKZ5tr/wdD5XmMrk?=
 =?us-ascii?Q?z1pO7qtajgcAajny4fgO1jnxK9CPXADAD68eIq/idGStoSkMHs57qpAxmy8X?=
 =?us-ascii?Q?+CDA4+2bRKIU7qO9TRdDvm8IQmydW2D4fpx614deipsdLrDsbxJ2Z/U2qjdc?=
 =?us-ascii?Q?uthHksZrrcgnSb1biDqVc+Fzes0YIf7uycIpE6b5Z4s4iyH0NeRJ61q6K8Jg?=
 =?us-ascii?Q?mWlowe8WVFLIv0FGuY6fqA25e5FCsMANQqyZBrAcMruk0GFKO7Lq5sXbRoAe?=
 =?us-ascii?Q?drhK86x6Um/0hKF7MQGEPZikqCnSzVYgNrZQEqXqWcnHaOt9mVkxyYJajcoR?=
 =?us-ascii?Q?Nn0xfM2P0eLLEvFGfc1UDeKDY94KwA4T76P7m+wlcMTiM/VwLV1nOmOQJowj?=
 =?us-ascii?Q?bUEvce0DcL853CSWITkSXsZPGfE0rigBfsZOPUtS35B1+gTZHuoHTOXIZDRC?=
 =?us-ascii?Q?NAhXAH92L0Xbf5p5K7GkMKWyylXbTGKm0aSDUI+WI19K6tSBZGn3BNDLz74K?=
 =?us-ascii?Q?B+aouvOfyQ1VAjS3o5H+apk0NKvOG5Zm+CJfx0emUo11mf6ZudXXDA/uFG4c?=
 =?us-ascii?Q?vhOV/4qKrczHi6uJaONJYjuR8RsboqKjXFO6fnlSPWOmgCzyN5dWmH3hqc1W?=
 =?us-ascii?Q?E9XrBw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jJW0O7MXjiqLf3qbuZVxoPokbzbdPqFac1vMfO6kJsEPPEtjTxKFmrNf7bnG5tdss4fnepjUULMHAkCYolWUGo+Wz/5lNDdNfwMzmTDTwS8DRWRWLrw8bcnTp3Db3nE0tu0lCm3dKZAhGVzAOf2QRlwGXACdbX3qAI98TE7ZDRFUeg2P6GVZFkgxZmaMjZsAzJ8MiTN3vg3HvyvZPBw7rmo0DbAlmqxP11CiqkuJ1jXCs87GUFUQwypKtZt/sfcf2Uf52cSsnO1MOjhJ4YrVUyLFt8Ed3z7KdUHKWtPA659LH6rAn+dMAgth1ZHKbp5o7U6eUBoQq0scGOFE8pKbLXBcYciIziYYtTVnheTIuDJ3VOvZE4UPVtwE+kJXKslMwiGA0XsjHGY6ydBcEvdvcrYf7SPN8UyyzG1Um4+ZBu5ZVQtonZ8y/jhQIMuLAsNE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 20:46:47.9593 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9a2526-42e8-4c13-3440-08de69aeacfd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1C7838BF6
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0151E12784A
X-Rspamd-Action: no action

When an application issues a query IOCTL while auto suspend is running,
a deadlock can occur. The query path holds dev_lock and then calls
pm_runtime_resume_and_get(), which waits for the ongoing suspend to
complete. Meanwhile, the suspend callback attempts to acquire dev_lock
and blocks, resulting in a deadlock.

Fix this by releasing dev_lock before calling pm_runtime_resume_and_get()
and reacquiring it after the call completes. Also acquire dev_lock in the
resume callback to keep the locking consistent.

Fixes: 063db451832b ("accel/amdxdna: Enhance runtime power management")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c    |  4 ++--
 drivers/accel/amdxdna/aie2_pci.c    |  7 +++----
 drivers/accel/amdxdna/aie2_pm.c     |  2 +-
 drivers/accel/amdxdna/amdxdna_ctx.c | 19 +++++++------------
 drivers/accel/amdxdna/amdxdna_pm.c  |  2 ++
 drivers/accel/amdxdna/amdxdna_pm.h  | 11 +++++++++++
 6 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 37d05f2e986f..58e146172b61 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -629,7 +629,7 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 		goto free_entity;
 	}
 
-	ret = amdxdna_pm_resume_get(xdna);
+	ret = amdxdna_pm_resume_get_locked(xdna);
 	if (ret)
 		goto free_col_list;
 
@@ -760,7 +760,7 @@ static int aie2_hwctx_cu_config(struct amdxdna_hwctx *hwctx, void *buf, u32 size
 	if (!hwctx->cus)
 		return -ENOMEM;
 
-	ret = amdxdna_pm_resume_get(xdna);
+	ret = amdxdna_pm_resume_get_locked(xdna);
 	if (ret)
 		goto free_cus;
 
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index f70ccf0f3c01..5b326e4610e6 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -451,7 +451,6 @@ static int aie2_hw_suspend(struct amdxdna_dev *xdna)
 {
 	struct amdxdna_client *client;
 
-	guard(mutex)(&xdna->dev_lock);
 	list_for_each_entry(client, &xdna->client_list, node)
 		aie2_hwctx_suspend(client);
 
@@ -951,7 +950,7 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
 	if (!drm_dev_enter(&xdna->ddev, &idx))
 		return -ENODEV;
 
-	ret = amdxdna_pm_resume_get(xdna);
+	ret = amdxdna_pm_resume_get_locked(xdna);
 	if (ret)
 		goto dev_exit;
 
@@ -1044,7 +1043,7 @@ static int aie2_get_array(struct amdxdna_client *client,
 	if (!drm_dev_enter(&xdna->ddev, &idx))
 		return -ENODEV;
 
-	ret = amdxdna_pm_resume_get(xdna);
+	ret = amdxdna_pm_resume_get_locked(xdna);
 	if (ret)
 		goto dev_exit;
 
@@ -1134,7 +1133,7 @@ static int aie2_set_state(struct amdxdna_client *client,
 	if (!drm_dev_enter(&xdna->ddev, &idx))
 		return -ENODEV;
 
-	ret = amdxdna_pm_resume_get(xdna);
+	ret = amdxdna_pm_resume_get_locked(xdna);
 	if (ret)
 		goto dev_exit;
 
diff --git a/drivers/accel/amdxdna/aie2_pm.c b/drivers/accel/amdxdna/aie2_pm.c
index 579b8be13b18..29bd4403a94d 100644
--- a/drivers/accel/amdxdna/aie2_pm.c
+++ b/drivers/accel/amdxdna/aie2_pm.c
@@ -31,7 +31,7 @@ int aie2_pm_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
 {
 	int ret;
 
-	ret = amdxdna_pm_resume_get(ndev->xdna);
+	ret = amdxdna_pm_resume_get_locked(ndev->xdna);
 	if (ret)
 		return ret;
 
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index d17aef89a0ad..db3aa26fb55f 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -266,9 +266,9 @@ int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
 	struct amdxdna_drm_config_hwctx *args = data;
 	struct amdxdna_dev *xdna = to_xdna_dev(dev);
 	struct amdxdna_hwctx *hwctx;
-	int ret, idx;
 	u32 buf_size;
 	void *buf;
+	int ret;
 	u64 val;
 
 	if (XDNA_MBZ_DBG(xdna, &args->pad, sizeof(args->pad)))
@@ -310,20 +310,17 @@ int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
 		return -EINVAL;
 	}
 
-	mutex_lock(&xdna->dev_lock);
-	idx = srcu_read_lock(&client->hwctx_srcu);
+	guard(mutex)(&xdna->dev_lock);
 	hwctx = xa_load(&client->hwctx_xa, args->handle);
 	if (!hwctx) {
 		XDNA_DBG(xdna, "PID %d failed to get hwctx %d", client->pid, args->handle);
 		ret = -EINVAL;
-		goto unlock_srcu;
+		goto free_buf;
 	}
 
 	ret = xdna->dev_info->ops->hwctx_config(hwctx, args->param_type, val, buf, buf_size);
 
-unlock_srcu:
-	srcu_read_unlock(&client->hwctx_srcu, idx);
-	mutex_unlock(&xdna->dev_lock);
+free_buf:
 	kfree(buf);
 	return ret;
 }
@@ -334,7 +331,7 @@ int amdxdna_hwctx_sync_debug_bo(struct amdxdna_client *client, u32 debug_bo_hdl)
 	struct amdxdna_hwctx *hwctx;
 	struct amdxdna_gem_obj *abo;
 	struct drm_gem_object *gobj;
-	int ret, idx;
+	int ret;
 
 	if (!xdna->dev_info->ops->hwctx_sync_debug_bo)
 		return -EOPNOTSUPP;
@@ -345,17 +342,15 @@ int amdxdna_hwctx_sync_debug_bo(struct amdxdna_client *client, u32 debug_bo_hdl)
 
 	abo = to_xdna_obj(gobj);
 	guard(mutex)(&xdna->dev_lock);
-	idx = srcu_read_lock(&client->hwctx_srcu);
 	hwctx = xa_load(&client->hwctx_xa, abo->assigned_hwctx);
 	if (!hwctx) {
 		ret = -EINVAL;
-		goto unlock_srcu;
+		goto put_obj;
 	}
 
 	ret = xdna->dev_info->ops->hwctx_sync_debug_bo(hwctx, debug_bo_hdl);
 
-unlock_srcu:
-	srcu_read_unlock(&client->hwctx_srcu, idx);
+put_obj:
 	drm_gem_object_put(gobj);
 	return ret;
 }
diff --git a/drivers/accel/amdxdna/amdxdna_pm.c b/drivers/accel/amdxdna/amdxdna_pm.c
index d024d480521c..b1fafddd7ad5 100644
--- a/drivers/accel/amdxdna/amdxdna_pm.c
+++ b/drivers/accel/amdxdna/amdxdna_pm.c
@@ -16,6 +16,7 @@ int amdxdna_pm_suspend(struct device *dev)
 	struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
 	int ret = -EOPNOTSUPP;
 
+	guard(mutex)(&xdna->dev_lock);
 	if (xdna->dev_info->ops->suspend)
 		ret = xdna->dev_info->ops->suspend(xdna);
 
@@ -28,6 +29,7 @@ int amdxdna_pm_resume(struct device *dev)
 	struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
 	int ret = -EOPNOTSUPP;
 
+	guard(mutex)(&xdna->dev_lock);
 	if (xdna->dev_info->ops->resume)
 		ret = xdna->dev_info->ops->resume(xdna);
 
diff --git a/drivers/accel/amdxdna/amdxdna_pm.h b/drivers/accel/amdxdna/amdxdna_pm.h
index 77b2d6e45570..3d26b973e0e3 100644
--- a/drivers/accel/amdxdna/amdxdna_pm.h
+++ b/drivers/accel/amdxdna/amdxdna_pm.h
@@ -15,4 +15,15 @@ void amdxdna_pm_suspend_put(struct amdxdna_dev *xdna);
 void amdxdna_pm_init(struct amdxdna_dev *xdna);
 void amdxdna_pm_fini(struct amdxdna_dev *xdna);
 
+static inline int amdxdna_pm_resume_get_locked(struct amdxdna_dev *xdna)
+{
+	int ret;
+
+	mutex_unlock(&xdna->dev_lock);
+	ret = amdxdna_pm_resume_get(xdna);
+	mutex_lock(&xdna->dev_lock);
+
+	return ret;
+}
+
 #endif /* _AMDXDNA_PM_H_ */
-- 
2.34.1

