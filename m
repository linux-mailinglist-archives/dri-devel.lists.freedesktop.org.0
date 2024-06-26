Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB048917B4E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 10:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4BE10E7D8;
	Wed, 26 Jun 2024 08:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iguId/L7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6242710E7E0;
 Wed, 26 Jun 2024 08:49:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZgpScxtIIrItvPj1PfvNsmPDwr5bexiGicYDHHh/tojV/jbVbYaQ24t9XW8ntBcoWaFdFIY18MNWGcru4q0jjx4/wSHDSoIxUAIavB7O9E7P8qOqLdXgQf0nZE7/H6a/mzJxJYXlg0W2mUTApHKTqoIr7+N0a9EUQc8ZA/zNaSkgEmS+3TRVD0p4CAQd2xvkZO0PToCbTertUx6RJ5AH9WMDwEur3GfNH8ggtJB3Qyrm9uTbsl4HVh4db0gmnbeExl2bXkM52+5en8Pk4P5d8xPb5R9hkRz0CdB+cESVZPaOXrcimbv1ankGQqszXvMSGKsJJvm1CSYLmQIFfUaqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qE4diFddfHTpVaEqoH1lXGgJ59aOWpSaklaEgb8hQAw=;
 b=bUHuLcooL16CwgNFSzR8Av+yivdQb7XtDdEGGHiw1Wvxk976EVc5ISr6Ji0I7Rvmgrrna/fIPOF0SU97sKzcGg3966rToCL6xysC8Bk97qFDat3hX26OOijBdCfQ2eme/xuWyNC5l6RG+mQJLTzh/pLfLjV7OKk2jGYgbBlcZGM7Dd1mdBc2geNA9ZOii+j0CFoJqBfVrAWB0cjp9as06oQd1vbxED2/3MUWWHjjo+azOE6ofCbdVvo6OTKRxI007jZRWDBzj5lAlNRZcWihewHEbYyhsPFwEYPjppioMmKYx425mYgpWg/nF0wgiXfogb5tjnJHokXtWUTlej/TLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qE4diFddfHTpVaEqoH1lXGgJ59aOWpSaklaEgb8hQAw=;
 b=iguId/L7hDeJpLQvtBIgSELuodw/hEbGrXUsdONASqYqIO6tnikUFHwY83QHHD9O+kk/QUGNeiXW+smcFrlAJlLiKBji2/H0eNsz3ZTf7RXilgdPmmjmdc6eURrUHnE38fpH9vAOWlI3vWDObOH+pmtu08P9pMQ74XULuIu1mMM=
Received: from MN2PR08CA0011.namprd08.prod.outlook.com (2603:10b6:208:239::16)
 by MW3PR12MB4460.namprd12.prod.outlook.com (2603:10b6:303:2f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Wed, 26 Jun
 2024 08:49:07 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:239:cafe::50) by MN2PR08CA0011.outlook.office365.com
 (2603:10b6:208:239::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.38 via Frontend
 Transport; Wed, 26 Jun 2024 08:49:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 08:49:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Jun
 2024 03:48:59 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Jun
 2024 03:48:58 -0500
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Jun 2024 03:48:55 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <lyude@redhat.com>, <jani.nikula@intel.com>, <imre.deak@intel.com>,
 <daniel@ffwll.ch>, <Harry.Wentland@amd.com>, <jerry.zuo@amd.com>, Wayne Lin
 <Wayne.Lin@amd.com>
Subject: [PATCH 0/3] Fix mst daisy chain light up issue after resume
Date: Wed, 26 Jun 2024 16:48:22 +0800
Message-ID: <20240626084825.878565-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|MW3PR12MB4460:EE_
X-MS-Office365-Filtering-Correlation-Id: 3542d91d-1549-4a2e-1422-08dc95bcd71c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230038|1800799022|82310400024|36860700011|376012; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+zcYTLeeLpg6ZZLKsHbGeBFGvs8nJAKDACALyTzohC0jrt5Gc2X86MQxShWs?=
 =?us-ascii?Q?DCnewZ/ZsrikMXhr0yYqs4OAg0VxwQsrLIOXv11ZDhyI9uja3EZOusarkSq4?=
 =?us-ascii?Q?yEBlXsMuAKxmp8PLiG8UZz5JDWT/Eh5JLFTqJO00q7VkrWLRP/hGV0EiTZzq?=
 =?us-ascii?Q?3Yz2pQyzWTtC6hCU2u6nWESU9Qk89ZrVNxIAJDPYif4ob2Zr6WEg5tPuGxU2?=
 =?us-ascii?Q?MeRA8CGx9TiuuSJybmCojFdVCeFzojbJL2mQK1k3SA2xRJwRJyxR3Wo+Afe5?=
 =?us-ascii?Q?x3hoqbcKGGIPGAK08gOztwfIDptRPcNlvaXIF8hLb5GrByLMUl35zY3k73iL?=
 =?us-ascii?Q?+ydf3TUCyf5OcY1HaSITf+Z3OeEVvtpkoHtLiI/VM6Jz2uV1W572sEsg4r/p?=
 =?us-ascii?Q?/IRG0j5fszUGvUeYss4AYQKYs5fI/OW9lwkr0874qtQ5dgu+lCSQ+fSiLG0E?=
 =?us-ascii?Q?Mks1NHa69UZxW71q7MmxgUBS0NCfDUH+LFreXd0bLPStkbR1Yea7Jsrla6Yo?=
 =?us-ascii?Q?HyA8JhGpEs9Bt3HEYuSoYE6yv/KnWQ3Myrwy1MsgZtlfdSJqeewJkf31WB4H?=
 =?us-ascii?Q?Kt5JYrnUqDZIxy6qMgb9hL6unckmy7qC8SXrpKj7BwDSBWRVMZjp/alYbShd?=
 =?us-ascii?Q?VW4WLKxVJVYditeIX9U62x4p3GwuO8UiUyEWv9pghxSkUVBXbUlAW3sK4yyg?=
 =?us-ascii?Q?ppcdbTJMAihoEz+DnCXqCcf7zj/IaElTqDpkCcwmIvOktVaHaimXbnU+qxr3?=
 =?us-ascii?Q?rycKEgHBaCW+15QEROr17MB1PD5RVTcT02uuZqxO+mfcSIrV8hKiuEOzs2sR?=
 =?us-ascii?Q?0olUOmJZvbrNRMnRsX2N7SYUxE7cEHKR84KGXwAd9ujgozV1ZIXilVxZ9hEv?=
 =?us-ascii?Q?5CAvdIZmeZCzmMCH+JkDAM8O04SirrS5uCeLEhjzMB09xTEgpgnpG+DYiU2b?=
 =?us-ascii?Q?fsx34zrfWFXdbnk05fGMfmRCLcV04deY1nRfbC3NugXGsGTS3HujWVbJRVmx?=
 =?us-ascii?Q?QB7+0Hzw0buXE337Dau3rrw5UVr+oz7loAOdX0t2F0FAfVX/pO9w/WEDTMFh?=
 =?us-ascii?Q?ToR09b3GBCWPp6FCnzEi+oqeE2GtFo0DmoYxCTB6JFLMBiVo4zdE9mVwQnrD?=
 =?us-ascii?Q?ULf2Y0NFDkzi7XRerRiVE78ntDxuc1a1AS0ZsJi+Jbsl8YOPDpUv/PlYiWPh?=
 =?us-ascii?Q?a2J9BD9tf/m+Mt1Mfq2e6/Uy2Vekz9Ky6RMI3hlBxSvOATSvLoHmZdcybS2N?=
 =?us-ascii?Q?q21dZkSgr0a4rY7cTBaJWHepDKFeu85T8w3HbBXk4jsoWi22t3qv26foRndx?=
 =?us-ascii?Q?qXCHUPppwd/au8KA30yuzgyo7v2uJbeNkxoNf7BaqSPFKzfOPPncoT+9Fzkd?=
 =?us-ascii?Q?adXNGjyMNhPPRXUOxszt9D0UlUUFe/+NYUjptMd7z/3mQdiEyg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230038)(1800799022)(82310400024)(36860700011)(376012); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 08:49:07.4318 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3542d91d-1549-4a2e-1422-08dc95bcd71c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4460
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

Under DP mst daisy chain configuration, unplug one chained monitor
during suspend and then resume, observe left connected monitor not
light up. After analyzing, seems it's due to changing dpcd
DP_MSTM_CTRL value after LT during reume.

We used to defer handling UP request by disabling DP_UP_REQ_EN at the
begining of resume process to avoid some problems. However, it turns
out that it will cause problem on the hub if we change DP_UP_REQ_EN
after LT. This series is trying to solve the problem by another way
that we don't explicitly disable DP_UP_REQ_EN at source side. Instead,
source should ignore the CSN event before source completeting topology
probing during resume.

Wayne Lin (3):
  drm/dp_mst: Fix all mstb marked as not probed after suspend/resume
  drm/dp_mst: Skip CSN if topology probing is not done yet
  drm/amd/display: Solve mst monitors blank out problem after resume

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 ++-
 drivers/gpu/drm/display/drm_dp_mst_topology.c     | 15 +++++++++++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

-- 
2.37.3

