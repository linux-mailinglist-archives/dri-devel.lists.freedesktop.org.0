Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 626A2975901
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 19:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AAB10E088;
	Wed, 11 Sep 2024 17:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jzR6ZXlr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A42F10E088;
 Wed, 11 Sep 2024 17:05:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksvR1kC5V9rL8hiBM42ndjA1jOAxOOv/ShrXJfEiR5apUv0KBPOaF3yCx9i3dkl0rx5rcraVICX7qVONWLABQZgH5HW1rr9SazQR/jSvZoiOM1UTHqLBqtEPCq4cTffHLLYhCW/3Y89ad3aHfpt7wFkB+hi69Tc+OZBIWUXB5alPvs1qZRi41DqtVmIbJMWf+D8aiLyQ2VTWtmp8HFQsmazvqMsKcAtOp7ni38DZN4No5Uer4NFy3Qvcr3uC0iVjQYXXQSnCuBSgs6NwBkLXfHCfKhVcrqVOtdh5kVyHWbHgaHH1PADRYku+/PFDxAN4CHvwHy5WY/O75EDpO7ZT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8g9XxKGgM+CoKoRwaG+goA3L+tFB4dkA9W+x637q20=;
 b=AgaynaCtp91bmLFvls1gdu29hNNqcfwzUb4XA5jCW7GtwWXcKYUUCXqns5W8l8KcX2zrAyUqKG30uTX8culWCVdYs9jc5PjBl+V6D80Ncf15V2Tw2Nx+ZzGWunlF8p+0/NqplvO5nhUIZ94zOwilGAxfHsXgYZbcDBSdLzCSEN90bISFv4Upc4YUhHxJvDdppK7vPuI0yEgaWZyICdLz7F7pAAsX0snPONNNb7ij9Sc3CuIHTBF/4b5sLEvEwqLkKFUGdhWRiba09uocqwDE4c/W3jbwwF4nfg11Fe4m6864SZqMlvgcR0EFH+KOvrkeg/iZwVNhRkc/bjYBBNNl+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8g9XxKGgM+CoKoRwaG+goA3L+tFB4dkA9W+x637q20=;
 b=jzR6ZXlr+kgpxD/wrSCoR3ocX5V7ibTVEUpB1W8WpDbaGeenrthKXXTKo1/w94Pc7eCB4kN9nfCRRENqXj7y+kXQnFr7brDAqjg8q8G5IeXgyrFK0Ll1qjJtA3N+sIoAo57Ao638SZWXHu09Ee9p1oq274y9nG2/LBiyqVqc60Y=
Received: from SJ0PR13CA0172.namprd13.prod.outlook.com (2603:10b6:a03:2c7::27)
 by MW3PR12MB4459.namprd12.prod.outlook.com (2603:10b6:303:56::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 17:05:46 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::db) by SJ0PR13CA0172.outlook.office365.com
 (2603:10b6:a03:2c7::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23 via Frontend
 Transport; Wed, 11 Sep 2024 17:05:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 17:05:46 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 12:05:44 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.11
Date: Wed, 11 Sep 2024 13:05:28 -0400
Message-ID: <20240911170528.838655-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|MW3PR12MB4459:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b06083b-d414-4652-57b1-08dcd283fa6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IFgP8BUwGPZY4tvE2XmwYs4PiIQDgy6ytrNy+fKgdNWTWo+5OY2yJmjh1P8D?=
 =?us-ascii?Q?exb3CrD9Idir+Vb6prOcxVadL15rcx5aAHNQjoiZmazza57CDFQgCennhohb?=
 =?us-ascii?Q?enpqYtXb6i9O06XtvKlS5IuxhFbKsKOLRgtX8hAhy9BuzhFQ6IMpnDvfkuPb?=
 =?us-ascii?Q?nyGkl0ANuxCDXO4bKe1NfdsGcS3EKjORwrgTHsrKgQdN787b17ai/hKC3ML/?=
 =?us-ascii?Q?g8ltY5FmKP87jv9Ja5DjmwjfHJYJ5jBzKNcDK/JfVvWXxgwIYT0vX794ST0T?=
 =?us-ascii?Q?b2Ff1pbInDoEOHOYrKfgmp48z6uEqVzOOIiXEkkFAfXOF0orf1HFwkysoiqw?=
 =?us-ascii?Q?ao75cEZ3H2bFaJ+4eUiIUUXu2O+oK5JW9877JPCLL1gImqk63Bv+KoUDN84p?=
 =?us-ascii?Q?HVeHGQniMIH+2HmKKQL148yb1MVfEVigT1g9n7w3rwAhMt5xTkIpDW5r9QT1?=
 =?us-ascii?Q?n/dTxCzUMB3tIg5e5Py3K9JI4p97pen7XlkU3DtkH/WEmdj7X/pLTeS+rUr2?=
 =?us-ascii?Q?0YpnwhJ5D3UXj5qI5dDrHej61CbTURJSGvmneBsbACvl023w3sZVAaoY5+Kf?=
 =?us-ascii?Q?BMGmUsYjbGRbxPB+gP/9KvAYigNwxcjyjBdesrtwNzk7igjkauY1L3J/yQKL?=
 =?us-ascii?Q?Gnw4KBTXYCNGl+fatv6X19lNUjOMQu/uLvpON2gs6DMtcj6DSM8GBcpIxhGp?=
 =?us-ascii?Q?0EcTFMUTodo37nEqLDuG7Zup6VVcBG84tnnU4iE3p9RvAd1I7Fg/FtO9UKYs?=
 =?us-ascii?Q?VFHNXhL7rjEVUuskY/Ph0DK8lv7/a49bGeMJngUCOgYThSNXF8HVJ4hZQI7j?=
 =?us-ascii?Q?fVlTVBnUsAJumMHGqbMZEhWh09yrM8ocplg364ob131pMHz/9k6Fq5Y8LKGu?=
 =?us-ascii?Q?VHk5nkguVuRJRwHFWzmDsWNJ5keoCyTGgYlXo9lN/te+fls0qr+mJCgIhHrO?=
 =?us-ascii?Q?asjChGqM8euKfm4jCmyDNlV5i8MXzC2GN19WTfsFi63l5NznS4H5cCW7ddkk?=
 =?us-ascii?Q?U/I+42lTreN42eZMjolD6Xqp+JSFuI4FPmXi6rQ/YzgKStRfE2pthGk769Ga?=
 =?us-ascii?Q?mg1WeqxVx0A5MTWfwfs7eIeoVNBAy5D8ia5Md+cnyC/T+6D34MmLyCA3pGjd?=
 =?us-ascii?Q?c0Y6BTMU1BEK8KRzPVXA13KokqhKo78Tebc4ZZserj4aHKUc6Ukfhvcev2EA?=
 =?us-ascii?Q?wUKts0pavwJ8FhegkwNovMO3Yq+gOfmbXCggMYiyUoylbRCRZ11ALKTn4UW+?=
 =?us-ascii?Q?zvx1PU5vSOHL8vCNPhA6NTRrC2XBQFavNdpN9afg1DVJBdSnIPIhZ2R18Piq?=
 =?us-ascii?Q?2kKtYzYb4IfVBP/idO0czQ33jyb0rwu2/fE0DPqrNgKzv2ectSNAm1h6cg52?=
 =?us-ascii?Q?Ql4oDgGkFimdec967Qf+zWbesjviriECkIhOgeE9tRW6cyqevQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 17:05:46.2158 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b06083b-d414-4652-57b1-08dcd283fa6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4459
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

Hi Dave, Simona,

Fixes for 6.11.

The following changes since commit 141bb6bc73cf45e8b742d6fafa6734b6d5f82b77:

  Merge tag 'amd-drm-fixes-6.11-2024-09-05' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2024-09-06 11:31:02 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.11-2024-09-11

for you to fetch changes up to 2a2a865aee43dd6f1ddbb0581c2a2cc205beb768:

  drm/amd/display: Add all planes on CRTC to state for overlay cursor (2024-09-11 10:40:52 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.11-2024-09-11:

amdgpu:
- Avoid races between set_drr() functions and dc_state_destruct()
- Fix regerssion related to zpos
- Fix regression related to overlay cursor
- SMU 14.x updates
- JPEG fixes
- Silence an UBSAN warning

amdkfd:
- Fetch cacheline size from IP discovery

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/atomfirmware: Silence UBSAN warning

David (Ming Qiang) Wu (2):
      drm/amd/amdgpu: apply command submission parser for JPEG v2+
      drm/amd/amdgpu: apply command submission parser for JPEG v1

David Belanger (1):
      drm/amdkfd: Add cache line size info

Kenneth Feng (2):
      drm/amd/pm: update the features set on smu v14.0.2/3
      drm/amd/pm: fix the pp_dpm_pcie issue on smu v14.0.2/3

Leo Li (2):
      drm/amd/display: Do not reset planes based on crtc zpos_changed
      drm/amd/display: Add all planes on CRTC to state for overlay cursor

Tobias Jakobi (2):
      drm/amd/display: Avoid race between dcn10_set_drr() and dc_state_destruct()
      drm/amd/display: Avoid race between dcn35_set_drr() and dc_state_destruct()

 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             | 76 +++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.h             | 11 ++++
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             | 63 +++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.h             |  6 ++
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |  2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.h             |  1 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           | 57 +---------------
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h           |  7 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |  1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |  3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |  8 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 13 +++-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    | 20 +++---
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    | 20 +++---
 drivers/gpu/drm/amd/include/atomfirmware.h         |  4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       | 11 +++-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   | 12 ++++
 19 files changed, 231 insertions(+), 86 deletions(-)
