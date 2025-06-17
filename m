Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A30C5ADDC9C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 21:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531EC10E0E8;
	Tue, 17 Jun 2025 19:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1gtsUM4H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E9C10E0E8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 19:45:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4DU2EbxO+RM7uW4fJUwy0M6njZFEYM8anuTVkz1CdHPqIae4D0zDceDr55h8COjZWr9WQTNk/8yTENMVlsLTO6cj7M8JeV4oRCfSeokEGiB1owoT02gotFugGLfdmGbnG0zMlSggXfARpKerLiQ04pm0Cwxqb3GCZbU4wCGkF+CJl0wtJ2ifsmsOzNssXon+BN0gJVsZSDVg6UO+rE0fClSUW+mC+bASYz5F903kLn9ZnHzdfrJ+kEUQdSgAVILJIn1TXj7uUzUmm5+3iAQ1x9MWdxZsUbl5HtfVWVaymZ/Y9Ec8q0dRO+5xz4WQNTO/JqOxDg3i//ZeSNk5sjmog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=drHeIBQ2KxLgnqEgN2TWEyAF9K1tD8c5kSMw4GesanE=;
 b=pr3Ya4vBeSBvAMAkQg6+dhx4zl+2WOXTqPRSuBY/MdqvvsWR66Vjll/ALqXKfarsr9lIeUy241q1fl7vfSxZfasr9keXZtffpY2yNxc2wG/ZUhyfvD0VxOkgyBZ6zVGxLwZUXfVjUzswhyEl3FEXriZKhoIzmUi2rJqED8lxcYX+/ME7GVUxP/N1dn85FVtIZTMz+DsGODQkfMg4+z31WdhXsLonjB7FGnFZdJhsPU+1f72Beafp/iwqAC8rgD7nE7m0ZJAQMo1hxntRE36iJRHztj5/TJVmAYxKCgqnjLUGThizISR5xUtDJd+QGqGvKDhO2+axYMzhI5QaJVVwBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drHeIBQ2KxLgnqEgN2TWEyAF9K1tD8c5kSMw4GesanE=;
 b=1gtsUM4H/cj34lM2j3UF03W5vDCdBmO5b4tKPiR5u06MDy04hCBRxCzoayu0LOPE5b0FgM68a49H233FZVI8sv2g3GbuAfsAMGNn+jtlz2Qqnr0WhEIg2SbOfcE8gcWW6x+LHhvLp4lxKFPu+ohbRu2iVlA12KdyFQuFzv7z1mM=
Received: from CH0PR07CA0001.namprd07.prod.outlook.com (2603:10b6:610:32::6)
 by DM6PR12MB4331.namprd12.prod.outlook.com (2603:10b6:5:21a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 19:45:53 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:32:cafe::51) by CH0PR07CA0001.outlook.office365.com
 (2603:10b6:610:32::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Tue,
 17 Jun 2025 19:45:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 19:45:53 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 14:45:51 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
Subject: [PATCH v7] Add CRIU support for amdgpu dmabuf
Date: Tue, 17 Jun 2025 15:45:32 -0400
Message-ID: <20250617194536.538681-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|DM6PR12MB4331:EE_
X-MS-Office365-Filtering-Correlation-Id: 156c2366-c3ee-4cb9-f5de-08ddadd791c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1bBP4nZKXj7HUqkUZe3vdcqtGgyzPI8bsUN17rLaDWR8SZZhb3xYSlWg/SYR?=
 =?us-ascii?Q?0cVH45mVJWlIWIC9K7/qzQuJv+W91jqm1ivDKvxDlg0mQvnTGLvr+2CmXN07?=
 =?us-ascii?Q?IDZtBTd93mGHTdgrCxKc7RzzSOkQz52ONa7a3wowRVbyKPFv7OlTGhfTXcaE?=
 =?us-ascii?Q?zM82kEZo7naP8zYBd05WZdhc6bBq/QVvTtzCua00Tk/gI7o09aBUkRIG+Gwk?=
 =?us-ascii?Q?pROL7LZhNfm9qLtd5pE4aeCm90MgYkKGcr+WGHk7O0gpT8UL8LP17/wLa4i5?=
 =?us-ascii?Q?Q6ZpDhVCOAXmF8lMWVYPSOScy57DWqjh4J0460V1EGtwdyLBK1jVQteGv/zg?=
 =?us-ascii?Q?uTEAxXHwiZBxptfhUWIHf37CN7saO8oYYqFcoE1uLGDovV1W3Y63hSMt9gri?=
 =?us-ascii?Q?QNOjn2PJ6CMwZTKTHSICKum4cStPMHR66+Vnb/ybpuTsOi6t0hO3Nq4Al669?=
 =?us-ascii?Q?N6cf0NgXxNPZ2EYuQyS5nkVgEle0Cr6OVxehTP8rbTy+wp6yo9qmRfX4Rx0d?=
 =?us-ascii?Q?tgoDUMmcSX9vCrJUB2RVRFaiZ7pddS+3eP2USgg0OXmEJ+w9OQ27D5RXnos+?=
 =?us-ascii?Q?vSTEtBkgqoqSFRGTz9B/3XTnVFgqvEKML2lhNGTfgmOiibcQ+Ed7ldub4ALJ?=
 =?us-ascii?Q?f+82Tcz+J9llORXDJTZ0rw0DFEjnCE+L9Qfo5p4yER7Ptg+WpCwEhxdmag3b?=
 =?us-ascii?Q?qI8082pFP6m/6CWljXiV+mHIHH2NFUUeVICso0qqAA9gGrhB0jZptJBZpGOi?=
 =?us-ascii?Q?AePFMgtWyAg+B/hU/ukFGPjBbC4uXjHGw9Yqf8Phmswc1AXrkFqvfd/i8C+Y?=
 =?us-ascii?Q?qNOenRFxRJ7cWfZGV8u9XOlN1mmmBKBSxhpFRghz4+40XUbJg4dpy35iBqkh?=
 =?us-ascii?Q?MzlZuOBBDUpJUVl5Ws8hW83CbLDALpy4hFLOKSLYQjs+an8JWJ3qqyasxmta?=
 =?us-ascii?Q?5JwMAsUDQlJdRblCytHgoEQC3Faw4OK1ijD1AnsoAph9MbxTGq0yMCeQ37NG?=
 =?us-ascii?Q?5ytHgL4QjEKaslSkJSFcI0OkSsqR4qGtMly9Myp0xKi+H3Rw5sXcyddldMLc?=
 =?us-ascii?Q?x+4vPE15jDbcR8KjO9Z416Fme6VedREFHDjiQVZf5RvUmLfyBnsA6EpBZS8Y?=
 =?us-ascii?Q?rMH9gkSzK4o62C0HSBGPWG6mfNUgrX7Hyow5xNTTUWHB0IUDTWIvrhlMrIHX?=
 =?us-ascii?Q?MV0PQI5/vlxlF9EJTRx1wtQC7Tq/7F+syaCGqhaprCB+D4PcdCuYH07vbk4R?=
 =?us-ascii?Q?6fbaOknBOqSVjyc2OM4ldW4FS1GRilE7MBKbylD9jXH6v+vgch7iS1YKn1lm?=
 =?us-ascii?Q?/uclkt87qq1L1ZaP4eM+NHE+L2W6R3aAZR/fwcl89XjYhIHky5APKbGg82ga?=
 =?us-ascii?Q?izVuebg+77G1/AxGm4azVvNmfZx4WbGMK7k9YS/q9Ufi2nqgyeNjl+a3W15a?=
 =?us-ascii?Q?86YhKijnmf9hFLsB6dbTASoqfgeI6sf+AFlJcXE2wCup/chH9PlV8QiOQXPt?=
 =?us-ascii?Q?4A24rHtiN4gVR3mORyqhA80hX7XeVlL0vymM?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 19:45:53.0165 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 156c2366-c3ee-4cb9-f5de-08ddadd791c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4331
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

This patch series adds support for CRIU checkpointing of processes that
share memory with the amdgpu dmabuf interface.

This v7 splits the bo and mapping info patches and uses the valid and
invalid lists instead of the rb tree.

A single macro that iterates over both lists is in the works.


