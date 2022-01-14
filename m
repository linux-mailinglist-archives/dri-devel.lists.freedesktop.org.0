Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A2548EB31
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 15:05:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5353510E432;
	Fri, 14 Jan 2022 14:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205F110E432
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 14:05:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsVpXShyi10dFPPHpdrBSY4q73iiCuEXvNsuP12kifEYMia2z8sfMP5s7S2d4qk9Kvi6hNcnfr14VBkTmR+Cp/D6CzF5G/sTVbDK4Ona+bk1QPwxoH+yWxZqTygM7Y42K7ZyL/qMp8+jfCYCO/B+ivPLCAlL6RnjV+zE8ioqcadvrZnS7JYyJ5b5QV5+/nFNBjmRf2VE2TSq1pAu26+NmmhG79+5mYvHliJlPQVsh50tsfcDC4V1x9PfkKqU5LrgdBYu7dLdv2rjfwyr84FzjLHoTP8jf/dgp9XD6GaeYUCCqjV4iev7cV83iCyG6QmW3WKS2QNxbcq/SB2htSS8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yhFqkDVyYn8ijREihad3dEzJtL7rpGT/UB7MLybgHM=;
 b=eKjCcgv7/F4IpA5iS/8fCjUMMGgUsTLv0c4tD079aRKSPpxxskUUPcgfrrNkibLsgIOAl7yuDTXyFbNiRiUw481ihNzdqbKu2wa7Ei7gowdRiLqmropxq2jtbPPinpp7wIjMH2mUPo3k0SA+P0T6hPgMBoF8QFcRGKMz/peIS0sWNOl9kwepqR0UupGnrGnA2LymGb/2DPlKFPVR+GPRRKwWNCEMy/H2EcpWRFU6tfzX4lsM/JYn764X7vVfFMbzNdYbjqUKiL6TmE5utATORniXHFT1DvnSAo/LR4gYk4z64bHnMvNmOVfudhemGEPm8aUl++9hK++ikblYi3PHjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yhFqkDVyYn8ijREihad3dEzJtL7rpGT/UB7MLybgHM=;
 b=VATNCtQlLntmk54Joqu9puppD9mfE9xszvD3Q5q3QA/+ZuW55JaDafJ/AwZVLqxGaoJtP9o6cEb5tJhsN7jCC3paFWt7f1vrrEPB7qPJI/XTgdabUx6siraXQvBDIasXLsFUAZbugQDOLCboClerR8LUAxeUQKRJ4YPYtTSdHKe491ZS0Ai3C2II/IIquAD73FasAWz28lpcgj7e9SaH25b0RATdizo7NboCKUUEdKId7RvBJT/mkQ3ABKHB3YaN2dQkFnt6ZWCq2kgelY+mTxsbOuwRSJXr6m2zCTq16ssA3QqOExWoX1cFx0KdgtKdcKqtYOuhwnqHBzAde/ueMQ==
Received: from MW4PR04CA0239.namprd04.prod.outlook.com (2603:10b6:303:87::34)
 by DM6PR12MB2825.namprd12.prod.outlook.com (2603:10b6:5:75::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 14:04:58 +0000
Received: from CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::9b) by MW4PR04CA0239.outlook.office365.com
 (2603:10b6:303:87::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Fri, 14 Jan 2022 14:04:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT021.mail.protection.outlook.com (10.13.175.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4888.9 via Frontend Transport; Fri, 14 Jan 2022 14:04:57 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Fri, 14 Jan 2022 14:04:57 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 14 Jan
 2022 14:04:57 +0000
Received: from moonraker.nvidia.com (10.127.8.11) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Fri, 14 Jan 2022 14:04:56 +0000
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen
 <mperttunen@nvidia.com>
Subject: [PATCH] gpu: host1x: Show all allocated syncpts via debugfs
Date: Fri, 14 Jan 2022 14:04:53 +0000
Message-ID: <20220114140453.83863-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df42773c-d0d1-4c2c-4571-08d9d766d92b
X-MS-TrafficTypeDiagnostic: DM6PR12MB2825:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB2825E452EAC2CDEC74351390D9549@DM6PR12MB2825.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QgmWUAdBDqXnsCSsPSrD0yC9zHV0M9o2vKdtxqf7MHUEtNRaW8SX+XjHgJYF3sCIBWUGYfZU1p6oz3umUVNNvnXCfcQT9Bch1RTYwq5GjzMQmmrCfGwjwpqXawAKYqFd0A4C9T6r6LleLEAlChoV1pi8YedRxglyZXm/PkEmaqpjY1kD/exWPRQRAOfYqKO8zaTKpztSHmlVLtquWOvx2hn2MukN3wliL4LKVR/LTSxb32qAZOV88+McLc9Se5V6aRMQHN76uO+RIkJB8ShCCjrOJQEzuFfq6Io7sqdZXlx9FkTCNFlcRfXwhu0DBgHv6YAZvkxs0zEGz88OZjmFgifpWBK3zC/AKu/dBWo2GNdqdfYgT791yQ/uyFJxEINXoMIpyyFzU055KxmQjAHa5w57in3WBWHt82ayhJKEIIXKyr7Zzy4fbvuErdxv0L3ImlFIUmcEsgyDa/Ouatd4bw7VP9MpR3zJq0ufhzgkmREBusgNZkw6xSn7u15lqYB8AeotfAoqTxvVEb09IdIMdaLx4U3jVwcvtYbsXWqe6LyDzmddKS7vQZ9FhhWHbWcuEA/7YQOW1Kwjh3G4uHAoE4fYNBN0pGG0BwIdVViI7/ABveyjQg/gGD8Bdj9brn+a0+VPaHax739jvBpFh6vnpPBgAORpEU7HmdgRo0+RxrDL4rHqCouKA+HmD9sQqX64uNIfB0CzSPQ8uIokcSM7oEFVyJNcn4ooQKpVpJJXEUoZ5FAmzoI2t45GFdmtuLfZWsnkO3Oz6fu+LRdf0ipssN+OtIRIBoSox1UOZ72vVInwWZoospjYt1p9E3fsOeB/71Vv5EVx/AIQjb1LPAaSZpJui0CKxng8PxE9bzHi0uE=
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(426003)(86362001)(2616005)(6666004)(36756003)(186003)(316002)(1076003)(6636002)(7696005)(356005)(107886003)(54906003)(40460700001)(83380400001)(110136005)(36860700001)(336012)(26005)(47076005)(4326008)(81166007)(8676002)(82310400004)(5660300002)(2906002)(70586007)(70206006)(8936002)(508600001)(32563001)(36900700001)(357404004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 14:04:57.8669 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df42773c-d0d1-4c2c-4571-08d9d766d92b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2825
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Jon
 Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the host1x syncpts status is dumped via the debugfs, syncpts that
have been allocated but not yet used are not shown and so currently it
is not possible to see all the allocated syncpts. Update the path for
dumping the syncpt status via the debugfs to show all allocated syncpts
even if they have not been used yet. Note that when the syncpt status
is dumped by the kernel itself for debugging only the active syncpt are
shown.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/gpu/host1x/debug.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
index 18d9c8d206e3..34c2e36d09e9 100644
--- a/drivers/gpu/host1x/debug.c
+++ b/drivers/gpu/host1x/debug.c
@@ -75,7 +75,7 @@ static int show_channel(struct host1x_channel *ch, void *data, bool show_fifo)
 	return 0;
 }
 
-static void show_syncpts(struct host1x *m, struct output *o)
+static void show_syncpts(struct host1x *m, struct output *o, bool show_all)
 {
 	struct list_head *pos;
 	unsigned int i;
@@ -97,7 +97,10 @@ static void show_syncpts(struct host1x *m, struct output *o)
 			waiters++;
 		spin_unlock(&m->syncpt[i].intr.lock);
 
-		if (!min && !max && !waiters)
+		if (!kref_read(&m->syncpt[i].ref))
+			continue;
+
+		if (!show_all && !min && !max && !waiters)
 			continue;
 
 		host1x_debug_output(o,
@@ -124,7 +127,7 @@ static void show_all(struct host1x *m, struct output *o, bool show_fifo)
 	unsigned int i;
 
 	host1x_hw_show_mlocks(m, o);
-	show_syncpts(m, o);
+	show_syncpts(m, o, true);
 	host1x_debug_output(o, "---- channels ----\n");
 
 	for (i = 0; i < m->info->nb_channels; ++i) {
@@ -241,5 +244,5 @@ void host1x_debug_dump_syncpts(struct host1x *host1x)
 		.fn = write_to_printk
 	};
 
-	show_syncpts(host1x, &o);
+	show_syncpts(host1x, &o, false);
 }
-- 
2.25.1

