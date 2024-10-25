Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A5D9B0F39
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 21:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF1F10E09E;
	Fri, 25 Oct 2024 19:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i/hlUxek";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2078.outbound.protection.outlook.com [40.107.95.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E30410EB78;
 Fri, 25 Oct 2024 19:37:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hH6x5W+hVth9DfskMii6dB1kl4Wv95oEBPeGmlAwex4miTq+oorYLFQGYRWIud+OLBzWW+Lfnp/5fuTMbDzu9v0/LoVdeQn+nKOA0ixyPY5/9LzbYBnvj/amWyZWTYf2pcpwyjyZ1uvwtYIaFOuL59m0nYGpMCfXSimxL/72Naa6L7ME4yr32uxfhQJG76oWgtJEzGUhEL07WzMVq0ca+cQ+zFKclmnyXHE7heC2fyHL1qvRsZhN2CL5Pu2izSfieWbXrupwm3EcjAmyfQdHEDDtE6beOCLJGl9CB+s6Rcsz1rB9zfijhau9wrhWaeP0zrfowXgJlbKGVA0u9QGwZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kL405+ZvRI3cX8i3GBvRYw23krVY+8zbaqt0pX2LPNM=;
 b=qdG9+oGelU1qqCJHYpWYH5mjMyWqNYaUH2r3IEfPxaikEMH4cpzx7393QKls20s2+h0MvPNKUFJEGh4L+ULwsuvaCleSw6Mm7x7xmN7kLdhZ8VS5wp3fei1C8fk/P424uAVEq8Sp6H+8vemfkL+OLy8Xgdto/oWJdUwR4SjjJS1nA2grcErBhulMkb62wWx4aToWB5vHToQu+YB4NRsnPGQmMu7H7APqNA4qOEKGO+5IR4LQyklCygde+h1TbmLpICK2gZOdb8XhBBo8PLBNlaIF/fx8xSnUEmYVSvqnX2qkdxrulDnTyYwLFPvOes/mzhJQBeNarrRbId4UDuNk0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kL405+ZvRI3cX8i3GBvRYw23krVY+8zbaqt0pX2LPNM=;
 b=i/hlUxekpEYgq2/Y3IPgm1iEbwRDfVN6L8Fyos+nvyIkaJo77uXXQCRBbpEvBmSMJRlrcwzpUNXJ0SKhYyFPIMDpVeewKUR6BJA1bwF00r51+YJ8M3YjeW5ALCN8CUdz9/7yK2foyWu2bH3ajG8/QncBhY9MGGq8oZODybADjV4=
Received: from BYAPR05CA0039.namprd05.prod.outlook.com (2603:10b6:a03:74::16)
 by IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 19:37:49 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:a03:74:cafe::4a) by BYAPR05CA0039.outlook.office365.com
 (2603:10b6:a03:74::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.8 via Frontend
 Transport; Fri, 25 Oct 2024 19:37:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 19:37:48 +0000
Received: from mkmmarleung05.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 14:37:44 -0500
From: Zaeem Mohamed <zaeem.mohamed@amd.com>
To: <airlied@gmail.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <daniel@ffwll.ch>, <harry.wentland@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <sunpeng.li@amd.com>, <Xinhui.Pan@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Zaeem
 Mohamed" <zaeem.mohamed@amd.com>
Subject: [RFC 0/1] Fail dm_atomic_check if cursor overlay is required at
 MAX_SURFACES
Date: Fri, 25 Oct 2024 15:37:26 -0400
Message-ID: <20241025193727.765195-1-zaeem.mohamed@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|IA0PR12MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: d18b501f-9040-4547-eb14-08dcf52c81b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F83ZSOMm/hyceocooqvkpRUVuydURWSsSJpf+ibcgIOO5fMLBGbBB1wfVjzf?=
 =?us-ascii?Q?AUzqiMoCjjkluctJVSyuzzc1+XA/Xk7pUbdXEHFlogFWCyoSLi0izKOgItHc?=
 =?us-ascii?Q?JvSQeDZ23BersPBJgLnGdIRcyElu8qB63PcgGOTA6CG3djpK8L9JIgUx9qkA?=
 =?us-ascii?Q?xNWvX+oWLZXTnUcOpVTCLzrD/6TYAvOuRaO0fFsD79bmsQyjT/cZvVs7pV6o?=
 =?us-ascii?Q?j02e4ZnjE/b/MYBgDywSCKswH9MMe6xU8umYV5AMJ3g5bBtIs/QXNLgHzKwC?=
 =?us-ascii?Q?ljbU1BGIaXljGQ7NTK33AadAvZl2bxh9ReGUypEfy7s972fa2MBWWqbXY/gN?=
 =?us-ascii?Q?W4JDGO4kxQlaJmbqk8oewSNSE3ZEoXcvlDtABJu3jUMAL2M1/UiEFaZITO7L?=
 =?us-ascii?Q?57llXZz8nBJMkF2AWTHQPUrZvRX7Qt1c0tSF9bHaWRAG5WXmooqm5UgY3hwr?=
 =?us-ascii?Q?7coMhQiKhInErej2TRM0sUcmZbzHH27uPszymKmAOx0x2Ik4eISyUGTDrCpt?=
 =?us-ascii?Q?5olz90nk5mIbRQnzx05ziUMsK3NoflVPp4K3DD/W/bZYki/RQfYzIbHgMtW7?=
 =?us-ascii?Q?/ei+bV68ugRvHFB3+3K0JXEaxnX6v26b6bqGQuAPKnWXY1c+UDcflu4mugFE?=
 =?us-ascii?Q?V9HSZWrhs3HZdsQ+Q1RfZec+yepUGuzkg8VkwBsVnijahUIMOY6brq+wbVqa?=
 =?us-ascii?Q?EV22vDOL2ewbz7M/X49hn4uxFQGlOhasoH0abpHxtfpLyrG0Ve+TifJ5zmT+?=
 =?us-ascii?Q?84OIwyR3X/6b8rx6S4ptvSIfU7kcM0UbESTAuxhIviqiRLDbqSM9osaoKDZE?=
 =?us-ascii?Q?ohqJjAw1t7M71v/jYWBBrMqDVJaIr9jQk0AKlNObrIdwBhwZhjMlRWuuJYA5?=
 =?us-ascii?Q?G9BcnapjarEFPn2FZQFt/vdMDQnv1LcfF0aXB+LfYtKVKsgztVVkNnpRjf+i?=
 =?us-ascii?Q?O5KhoamdCVKdDb0YmjUxBuyk53KFvTDFD4Z4IvTjV6My9Uhzf4RN7Ziqd4Gq?=
 =?us-ascii?Q?aYRDm4KQRgpTOHK5FhgCimhClBRv8yxWTUOk3uNrODOGT5v0RGOoxs7+HGgb?=
 =?us-ascii?Q?nX4teQIeqf5FAzFCdVjEvDziQGUADUCuPTsDvhVMGpiV5QcrKR0hg8OiMuK1?=
 =?us-ascii?Q?Yf+ONg7y8E7M+p4H92BkDQKDHPMUp4gkqSjL8o3Na+GWcljI2ycuxzS9uoHw?=
 =?us-ascii?Q?TGK71a+ag0PjcV4fOPC/X51b+OkR8eADawNxB1wxigzAi32F2EHXgpLeAMEj?=
 =?us-ascii?Q?qlR5BZN0yEkeBU9q7ezLvPGUpgElw2HU7AmvsYCkyOTFs+X/0kXKnLVoefHr?=
 =?us-ascii?Q?lwDTQhgOHAOVaDFxC2JpWn1+fpSL5g0kJVQ/19ovQTvDvWZZueVPGe2YX1nJ?=
 =?us-ascii?Q?ggfB+tkIw5L3aG+drJv1G0xXNxrb9otCZWjUj2pbE57p9Af82Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 19:37:48.1638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d18b501f-9040-4547-eb14-08dcf52c81b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8422
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

Current patch to prevent index-out-of-bounds when cursor plane is
required and plane_count is MAX_SURFACES. This check needs to occur in
dm_atomic_check where failing is safe. Need help with finding a better
location for the bounds check within dm_atomic_commit

Zaeem Mohamed (1):
  SWDEV476969 - dm: Fail dm_atomic_check if cursor overlay is required
    at MAX_SURFACES

 amdgpu_dm/amdgpu_dm.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

-- 
2.34.1

