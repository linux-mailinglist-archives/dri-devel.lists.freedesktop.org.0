Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E631AAFD731
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 21:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFE710E1BB;
	Tue,  8 Jul 2025 19:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vemxqw1u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2069.outbound.protection.outlook.com [40.107.96.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B9B10E1BB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 19:38:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcTMGW8qW7n33hF5abed3P1jkeeW72BWTX8N62wcHeTnixCFnVXVoguW2mmUaMTiMb/rmqeTNw2ue5uh/3L1+OemC2SPoRlyYnP0oyFM5P6yuLU5qfSZpy1mPcfzYiddHsA8L2DSzyCuR/KbS1iAgsjUOLEEOKiVcbn3N3rQnf0mVDUZVPAB5Jwa5+pWhsOp3GuIV25S9qX/Dyk325Tzw3V3U5XsK6ZcuNyJxh752jGLm24nW+m23eE6eCWcVIe+UMpfwzyDQ4nivpjxDsnxyAWURZKwByB5h+7hMVOvf8LolxHHuJ8yMK0/T1iimG6mD72aQzeQWqTioTxCgtGb+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bc/25gpQUpJrxVJJ39caHTRQrq7m4n36gkB6CTSqvKU=;
 b=jzGOl5UL/nlev/I9J1HGMBvllIgv+TPX+YZejwQQeEsJnROQTgKQYPg1Dzad6BN0wGmGzQ0v7J8VA2EPwh1l24U+/LCIcWzzR101M5ye8E81lXsy27tLrBQmWMWUkOa26E7liWu15b2UVqFg2aUsTZA9Ksh3Kuzzjj/PDgh4lQdpSWosbpc0SSx/yXTjW1s9a0YRmG+PA5INFNAzGiQpwSltFrkI2HP0miBKtdcAiwx9yZ8JZTiM/olfQvndNtl993DebwtIe8JnkZM+LtQrpFQP2i6pRR1WUu6ldAWG8Jxj/YOZjGfMo06niRi6d0nh8+kRDwlA7R+gnX8lkMq9bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bc/25gpQUpJrxVJJ39caHTRQrq7m4n36gkB6CTSqvKU=;
 b=vemxqw1uL2hnfvsvuk5rK36enhCQ639wA5vYF6pVaoxmWIFnyrXuakCp41biLvqfDSgH0ceLJQf/0YaZZpOE26oZXtTblj7jf3gtn7l9clTfQvshuwXjPWsRwG1Ey2al9hY+Vr602lxfModUtW3WnMmEzTfHp4i1whoLx5robVg=
Received: from SA9PR13CA0025.namprd13.prod.outlook.com (2603:10b6:806:21::30)
 by PH7PR12MB5997.namprd12.prod.outlook.com (2603:10b6:510:1d9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Tue, 8 Jul
 2025 19:38:33 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:21:cafe::de) by SA9PR13CA0025.outlook.office365.com
 (2603:10b6:806:21::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 19:38:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 19:38:32 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 14:38:31 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
Subject: drm: Add CHANGE_HANDLE ioctl for drm gem 
Date: Tue, 8 Jul 2025 15:38:08 -0400
Message-ID: <20250708193809.403141-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|PH7PR12MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: 79a3bc2a-e216-485e-8942-08ddbe5705cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ucxlbiou0ADwO0dN5vmZdRua5cu6mrs4khwpPDCJMIoAfySuNKJZTmW18Cwz?=
 =?us-ascii?Q?w92e1opW3OmH5tXy7ZBmyx0t63XjWBhAds0yW1Lnh9WJp2B5VU1RELvhLCo+?=
 =?us-ascii?Q?r8e4iYd/gqEVgY2viWRXpvmHw8BkfNBo0NQ536hoB/OixTJSSxKQozZSkw7b?=
 =?us-ascii?Q?i7AOBogHS3Vk/E042FosJypTtZdio7lNAqo8a8qo6wa6zGi2TI0wtejcbMCB?=
 =?us-ascii?Q?g0Ix/jNpx3k3A3d/q82HUatzJDCnay/+OvgKObtp1GmKdbuUBBA0zdQkR5rh?=
 =?us-ascii?Q?cKYAU+8hsvLXwzjD4MzaAgRabXAYJeUv3mGAuAqw48wtz+0Esf4M5Gor1guG?=
 =?us-ascii?Q?hXc5qD8EBGxXJb2T2bTbE3e97dMe3xgSOxx4loFm37dCxxQBzZKMoScc/U+b?=
 =?us-ascii?Q?v2ZPF3reQSH/yQ7V1nsHlXcKG6xLH1nR8Rzel2uGsAJfIZHsuYs6vnwzWW5s?=
 =?us-ascii?Q?99CKPqP6doS4j4cGf8wVGGPrtzc6G504CO942j45ZVNC48k6/ldJpvOzY1ws?=
 =?us-ascii?Q?N8wJVKPeuAn8TJVrlNx8JV5ed8HiwCSBsZJazQUVfh0ekcbeM/wtQ98xZrl/?=
 =?us-ascii?Q?XBGmXTsa0SglAe8W+GQVPwXSKBlLRV4T28PudhOzS+Wn5QGwRWpBifVLBIxj?=
 =?us-ascii?Q?r35c3SDbQhx9e0RArritX3v9O3FXYUaF7JlgFG8DwSel0KIhVWf0ZZV3zMND?=
 =?us-ascii?Q?WACAUrEMTSPAGgBVuHP0CznLohDwWLN/covBiElYJRyFGjz3Zv8zks+M6te5?=
 =?us-ascii?Q?eK4NTBClapffUu2mLi8XIuRMy1VOQBawE7g0FYsfPFIP7pR61jJZA9qPiata?=
 =?us-ascii?Q?4Ip7MrPf/Ytlj8DeBt0nkGs9rN/og6jnY8l/A0J3gbqxy9YLsl668zVT/o93?=
 =?us-ascii?Q?GCG56ZNE8jKCpI+QYKbT1JsAeZcTYuG/sDvI0D6EbMbm8MbyVnErY7Mk8jq1?=
 =?us-ascii?Q?8ytAlzL4D8CPsrItR67aJq3aHdTBRls2TvbjR1r06LHIiLwTlkKHm4mC6J9B?=
 =?us-ascii?Q?ijGyoMX9Vo6NvodTf7edLUjfilfoxnXYTD9IhpKrt0LzTCYP4f31w5Cxa/fx?=
 =?us-ascii?Q?aeb31TzHuBY0g+m4OqS6joRoTrNSzhWB2ywOjtoa/GayZ4Gc9x2qDCiVwSPj?=
 =?us-ascii?Q?MAtwY4EKNXAMGfcoYg5Lf1h1/ZEkAQUAPV7MzTGPD4+LAhi6MVyfKoj1yGfs?=
 =?us-ascii?Q?fodwCbNBw1f3nNGiq7DM1v+CrmQpLmlqxo5ja0lWbNyLKAG9gcn0VbI35E2s?=
 =?us-ascii?Q?GRgYWUXzPZwV/GvA9dW9CQPsmr/OvMP0c6xRCTB9V+23EbOMdlVTayReZ8sd?=
 =?us-ascii?Q?7DFzREs04ShlFmk32LsRYbMJM+46RmL171+Sxot1GdQpZRj88j2ylf3JhW78?=
 =?us-ascii?Q?1Qq2FfMol9PzvQGJMljWQ0LkgzzDDKO3Uuog5EjADhEG4QxLnjzn9PwMZNV2?=
 =?us-ascii?Q?TZiJCE6Zo4tkx4YodcqQIZQy0/WZ/+zsp8tiKo2kDKujTWhKEBkveptE6zd4?=
 =?us-ascii?Q?zvoOk2eB7u+5sFfX6NqW53pKBKxkdLoy6F0H?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 19:38:32.3881 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a3bc2a-e216-485e-8942-08ddbe5705cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5997
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

This patch adds an ioctl to reassign the gem handle of a bo.
It was formerly the first patch of my CRIU with dmabuf patchset.

Would it be possible to merge this on its own? Internal deadlines
would prefer this to be in the next kernel release if possible.

The CRIU patches that are the current use case for this can be
found at https://github.com/checkpoint-restore/criu/pull/2613


