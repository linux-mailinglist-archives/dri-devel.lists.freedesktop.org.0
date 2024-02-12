Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 184D2851F04
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 22:04:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F5810E00E;
	Mon, 12 Feb 2024 21:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jvlPhP6f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100A010E00D;
 Mon, 12 Feb 2024 21:04:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qb5kZtyQMPNXjxzES5qlilXUKabffLIzrgwBhGw5nkt/+xb78yclBPGiD1sB5vcop4T624fx7B14UZq9E0jxLJwqvAvV4ua4IzuC+L8TLB8nS5f/rpUl3AD+wfW1gYJDN2CSk3UBF3GmKwtRcF8eDuM2pns4+BpLvsPaQ59dRiq/Ea3vwzDoMpkm5tME4tSXt4ICRcl0B5bSHGOJRTfCma68a1LMVYo/0sRPmPYSwwvmRM5CVEEuQDSpV/QVAhhMV2RiSsu74RnTHK5uKuIAnV5J0pZJcUXoiNMvDNSfFANxXds7rMXrFtn536metTl/DNZMHNky75tyT+Oe7Jwd+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYqQVMgOIW9zUllg74H1o31HO9Pjr6X39FuuGEUKJF0=;
 b=ZREH8si/L/8XCpOPsMfpTp1pnpaYO1G0vipJfMPKAYiA61trHgOEaG7ZLZoqMZN/BODpL1JAhaTvF7XHH6IiDlfT1PRt0YXjXWDg8MeSMnTOfB2a4F8FuLal790eimYslD8kp2FxiVfzLYYG1k/VEX1MESMXQIPjrrVuHrgoPtD11X+czU/rBfORWD9Qc6cHICZQV5EVHAUkd4KqllNjync8EwvJJ/IPj2r5jrXc0N5cM5qySlojeygc67G60aGW2yywjSIk50TjdHQqTiqJ8B9//57YizStf+FUJBse1BhaT/tQIE12/2tldCNkoXz1H02fS/LoaXFoyl6abfU2cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYqQVMgOIW9zUllg74H1o31HO9Pjr6X39FuuGEUKJF0=;
 b=jvlPhP6fFFQvmkmOrS4Oimbr/oWejRJmKlloxZ8VoT6eLB3lrbLD+AwEXa0mcDhRAUcBbQSYIPweaHhK2NOlrNtWeJQoyHIHA1tbtYMoKdKtOoWtg4eT9zhMjXBir+nlf7OkDXEuJXn8PfuykGO2PeAuAmxXBcMLF8v/vIx3Vvk=
Received: from CH0PR04CA0073.namprd04.prod.outlook.com (2603:10b6:610:74::18)
 by DS0PR12MB7677.namprd12.prod.outlook.com (2603:10b6:8:136::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.21; Mon, 12 Feb
 2024 21:04:44 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::fd) by CH0PR04CA0073.outlook.office365.com
 (2603:10b6:610:74::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38 via Frontend
 Transport; Mon, 12 Feb 2024 21:04:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 21:04:43 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 12 Feb
 2024 15:04:42 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <tvrtko.ursulin@linux.intel.com>, <daniel@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 0/6 V4] fdinfo shared stats
Date: Mon, 12 Feb 2024 16:04:22 -0500
Message-ID: <20240212210428.851952-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|DS0PR12MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d48f21f-f31f-4ec9-5367-08dc2c0e3c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZSTjmkKnAGZ1o/3gZzSq5N9Szu9/XkvWQvTtIj8gD9Gaqb7g606X1YD8Avt/Cr6ZAvVrJsLW0S3MJlAaDYyteuZCm6nrl3pXG48eNv2/r44CdEumprGIv2CAnQt7EXJNbL6dwjojZ0cKMiCE8AmDszu2IBU6WvelqfV+KMTh0McQWX5TB0oEuLbIdcWXqaDsitHm51Bpfb44NEL9cxDH9e9g8j4/MDlqY1tWZQ8/W1RwJsgkT1YC+Rx6mJw2QTeXSTjmwAEP0ETgIGeppJ3QUzN89ymsmjnRgfniW7AkWPfbq8+CjclsCM5SKjW/PHiCFl+Vu3O0AzMHsThq1R2MRr75oXeui6zk6t8Er8/r8YtqReJWC4bLZKUyHbEHzNYY0P4c3Yfi/QvsSJ+PCoh7wo//Lj/V1KIjGB2Juc63DO4qjnAvmewpsVIhr8uFPkYdxnpCj8KmPZT1gO721007RdLsM72q12dBPgxhBhuaoKVb3TXjxfzlccQfQ4NmH3EzS5a4kvEbIKyxJ38N2iZmWNTAa73Me/KAUadJ2adj4ctBZQBFN7blIPBeOTgSk561p8pyJqUqgJQqAwv+fv4P1Oj4G1qEr6m0ExAu8N7SPu0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(230922051799003)(1800799012)(186009)(64100799003)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(86362001)(81166007)(82740400003)(356005)(41300700001)(2906002)(316002)(478600001)(16526019)(7696005)(83380400001)(26005)(1076003)(2616005)(6666004)(336012)(426003)(5660300002)(36756003)(8676002)(70586007)(8936002)(4326008)(110136005)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 21:04:43.5874 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d48f21f-f31f-4ec9-5367-08dc2c0e3c88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7677
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

We had a request to add shared buffer stats to fdinfo for amdgpu and
while implementing that, Christian mentioned that just looking at
the GEM handle count doesn't take into account buffers shared with other
subsystems like V4L or RDMA.  Those subsystems don't use GEM, so it
doesn't really matter from a GPU top perspective, but it's more
correct if you actually want to see shared buffers.

After further discussions, add a helper and update all fdinfo
implementations to use that helper for consistency.

v4: switch drm_gem_object_is_shared_for_memory_stats() to an inline function

Alex Deucher (6):
  Documentation/gpu: Update documentation on drm-shared-*
  drm: add drm_gem_object_is_shared_for_memory_stats() helper
  drm: update drm_show_memory_stats() for dma-bufs
  drm/amdgpu: add shared fdinfo stats
  drm/i915: Update shared stats to use the new gem helper
  drm/xe: Update shared stats to use the new gem helper

 Documentation/gpu/drm-usage-stats.rst      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 +++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  6 ++++++
 drivers/gpu/drm/drm_file.c                 |  2 +-
 drivers/gpu/drm/i915/i915_drm_client.c     |  2 +-
 drivers/gpu/drm/xe/xe_drm_client.c         |  2 +-
 include/drm/drm_gem.h                      | 13 +++++++++++++
 8 files changed, 38 insertions(+), 4 deletions(-)

-- 
2.42.0

