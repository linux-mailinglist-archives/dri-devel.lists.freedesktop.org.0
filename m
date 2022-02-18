Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6066C4BC2C4
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 00:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D3C10EA62;
	Fri, 18 Feb 2022 23:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2040.outbound.protection.outlook.com [40.107.100.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B621F10E17B;
 Fri, 18 Feb 2022 23:09:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWD8o8pWpDzeJGaCkZ4+VTeaO0kNg5+6SVFyvR3c89A3dAjdZbMPhw8qnIjnYNZjC+Crt3Y063PyGKsjUraRbYauXIh9fbSKH/2jyH+F09IGRDMPYdBZuRYkFgpZA1G3YsHq9127CU2rIE8+vD9vIvmzo45R6ErtaFATw1H02gCX75DZd3wTHBChX6asO0TEO64S8f4pk7nY9HlgQ94Z/XhQBGyu0d/zyjpgAxqJq223AbQvvbYsOegTGXNWoqNeizs0cS0j8lDoyjZTSbs7NExAp+bAHyCLdAOFlzAwClj6eKAHnle/C5h5LWypq4yzbmgB51QpoRfv7KhIuC+B7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ylcaq/EMeDfYCm4U1cYe9AzZBcigc7FwMqc0lyRPdVc=;
 b=HhaL8qSZS36eyiKIWAYb3N3Elkq0XavprujXC1xjJuyCq/IFi5QWY8wVlj2hSnvSv1llMigufKAfZkf4AgHEFl4v37fXl311CtVwL720yQO0geL764Yvt/+83+sYypdWkeEUSXsWNW0Luoe0hgQ0CNz8dvNttn2mMtSp2MRuj9kKpzGuID3ZWwNR5yovvjvKULYqxRmYbjYBI+dsu3Q/yVYqWCRdwvsc5IbLFkiJf0hegFmjA/jOnDch9ustWmWcgE3I/2HYJxy1FDybVtHyfv7O/mde+Gi6xj0HiHLhG019I+F//mpUs2ZZujQsxkY8/djcLxXuWbtf7VCbppSIsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ylcaq/EMeDfYCm4U1cYe9AzZBcigc7FwMqc0lyRPdVc=;
 b=NvKPC7LIeQtclhvSwri9fyqV7aUZUUItQ0ulxv8YiBo5L+5GpruvadE8GGY4Jvu7sPIsUowomfjUI7GSbZKaegtO3tc/+4yuDaIxOkaC0eUm6CoEK1QtYQPqyfevcCWpKkcpSuz/GeMCD/znMhw+gwxvVdEVKjvPAx8aHiXUVSI=
Received: from DM6PR06CA0097.namprd06.prod.outlook.com (2603:10b6:5:336::30)
 by BY5PR12MB4081.namprd12.prod.outlook.com (2603:10b6:a03:20e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Fri, 18 Feb
 2022 23:09:09 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::c2) by DM6PR06CA0097.outlook.office365.com
 (2603:10b6:5:336::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15 via Frontend
 Transport; Fri, 18 Feb 2022 23:09:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.20 via Frontend Transport; Fri, 18 Feb 2022 23:09:09 +0000
Received: from dayatsin-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 18 Feb
 2022 17:09:08 -0600
From: David Yat Sin <david.yatsin@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: Fix for possible integer overflow
Date: Fri, 18 Feb 2022 18:08:35 -0500
Message-ID: <20220218230835.9914-1-david.yatsin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 251c2559-db2f-4e44-b150-08d9f333ab6a
X-MS-TrafficTypeDiagnostic: BY5PR12MB4081:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4081D1CB835486FB5F0C583B95379@BY5PR12MB4081.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DhTe/zJnzgy/eKzynh6ldJLybs0+w0C3p6UdSes1B2Ba969Vzp8VN4cRwHGs9Tb9x0WtCowM9t3Wv5STu9P0OtPZ6Qkioy5KVZGK9T90amTjTeRJkTmY+H7txscP/DyGvbCQA3BeDTIqDM/+YKhDDeUGdOon9oybtd0c51OhMZzTlDHTp3xircJ4ReOFhXIU5NhbUypllpuSqZ6+MSM9bm9UHd1r49LrPfqso/IzL/UfffZ9EbSzmQ6d352KpRvD9j5ATmw/O3N6SiRyW4eOzpaZmM+MKpTnXtQup/c/b/I639HsFPLf5nUbhf9fXhFFto1Q8isjI1QWE6Q6u5ymX/P/zxGhVBZZL/qUbgJaw5odiUxt6nt7kjJRabQhf8/oK7THu1dSH0BQ5GTZekZ3AGIHGy0Ez8n5CEVeLNzcWYnsSYhindTwuVS5M58N+cJkBj99njWx6DwYuP0T1ddRqCo4AEFxANCMjkriVf5vA2uj65sfAxLx2X+/zD9t3za03WgUiqz4xH2tb06J0j7isRZOjZTbtKEsoVqN/QyeIy/4wVghXbQmHhk8lvCBeVd04/YHh77dzaMK19OEE5qxUqkRptqLpqcv5wXZd7aYPSm1YKdJlS0i26ZhH9Aq+YmE0eH2MCwlenCzsUf3mGAOWll4ew5q/dKOp2k7KfsoEx44w5+9uLjAxB0AI4R9zAdnMtxa7sGy7/E6rT44w65AMQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(40460700003)(86362001)(508600001)(8676002)(4744005)(4326008)(7696005)(16526019)(82310400004)(36860700001)(70586007)(70206006)(26005)(426003)(186003)(47076005)(336012)(356005)(2616005)(8936002)(2906002)(83380400001)(6666004)(54906003)(110136005)(36756003)(81166007)(1076003)(5660300002)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 23:09:09.3476 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 251c2559-db2f-4e44-b150-08d9f333ab6a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4081
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
Cc: Felix.Kuehling@amd.com, David Yat Sin <david.yatsin@amd.com>,
 dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix for possible integer overflow when doing addition.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: David Yat Sin <david.yatsin@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index c3f252fc337b..6eca9509f2e3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -786,7 +786,7 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 	}
 
 	*priv_data_offset += sizeof(*q_data);
-	q_extra_data_size = q_data->ctl_stack_size + q_data->mqd_size;
+	q_extra_data_size = (uint64_t)q_data->ctl_stack_size + q_data->mqd_size;
 
 	if (*priv_data_offset + q_extra_data_size > max_priv_data_size) {
 		ret = -EINVAL;
-- 
2.17.1

