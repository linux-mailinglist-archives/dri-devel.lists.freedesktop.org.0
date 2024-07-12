Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B8492F33B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 02:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB2F10E08C;
	Fri, 12 Jul 2024 00:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hwKe4gIE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7B910E07E;
 Fri, 12 Jul 2024 00:56:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idN20hkfbCzPFBxSCR/BVu44YMjVJxQNsbzpviAjJA7a+abc0lXUtfZDH1pmBbgXoMDOYcARE1HazhXmfQ3+yqJ05+0TS3Zq+nHMYIz1N0BKEBHcLOy8XVouG4hBJPzCOZJWtjNFtiM6Jb53g7XH6ujQvCcnglP2jxbBEYlpVRNZz67lnKRMzNwTR662IQDV+D4eQm/7mBTY8LBPUvdXS8PngNtV1jD8qpPl62GmPtI519avmVUsDJZvOhmEHTYz/VgmN3SjGWON7KcmJlsW6KPKf1jqUSfWszYRmWLI6qImoJQ+Qbd86TX4F9Q5CB1z5j8Wwx/QOvnYw+A2eEIY7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YyeFAfleneR2COcT8Io4FnpHjOXZJeLHp33xk4vxtU=;
 b=mqj24xFH1DPA2lZcdsze2gqSEKHbQEemuMPE2cf/CsLPXOoVMbfdihC6eBpn3zsSFZncSADH7GmQbY2TAJO9BHb6k+s3p+wLvdcx7exq2+aEj0tKOfA3IGtBs8QIJsHkwNsEUeR5B2nXVl7RVrttOcNMMuQ7jj+sRiqAI7f1pyOhzgmv/K17vvKguGl9i9ZO3xkCLHhmpDrz0RW5Ah8pQBlUDbLQEb3+8ufZNvtrtdXSCkAYJJU+FcqD7SXGUWNZv3GK3zh0jFRnVtp85j0fmZ6t2wZEj1qlFuk5Injnhv26JxWgrtHmX7dt0wo++iSQcVUu3myaJrzZWv3qYoUVVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YyeFAfleneR2COcT8Io4FnpHjOXZJeLHp33xk4vxtU=;
 b=hwKe4gIEn13yD+X9m8+ncBZe1swF9LCrKxLshZyiz9bzFl68FsNmtuga+FJaDaexPpCp5N6u0EjSjxicKuujAZ09+LYsqr9Tp0jflZTEn7MxnsGK2cMUcfUK+YlUGV+99P8ggFSR4fk5bTLIme0ZMN3jXxszwi8D9gziCHYNMTU=
Received: from BYAPR06CA0004.namprd06.prod.outlook.com (2603:10b6:a03:d4::17)
 by DM4PR12MB5986.namprd12.prod.outlook.com (2603:10b6:8:69::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Fri, 12 Jul
 2024 00:56:01 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::57) by BYAPR06CA0004.outlook.office365.com
 (2603:10b6:a03:d4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23 via Frontend
 Transport; Fri, 12 Jul 2024 00:56:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Fri, 12 Jul 2024 00:56:00 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 19:55:57 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.10
Date: Thu, 11 Jul 2024 20:55:33 -0400
Message-ID: <20240712005534.803064-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|DM4PR12MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: 85919b04-5555-4e95-3d42-08dca20d6601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3VmaFJlWlNJRFV6ZGlTbkYzS0NBQVEvVm50TTE0WjEzUWc1bVE3UThnUFg4?=
 =?utf-8?B?bW8yejZ2MHF6YXQrRXpnNWtsZmhpeU9ERE1SN1BUNStDdDAzUjA2bW5jcEhJ?=
 =?utf-8?B?enRBMGVEU0t1RzN5ZnVvM0ZHK0NEZzA2bklJRnYyRDBNNFloL0puQVhZVldO?=
 =?utf-8?B?Nm05ZHkvV0hXdmhIaSt0TDZGNWM0SHN3WjhsOHRSQVNnSy84WFBnNHJjZmZD?=
 =?utf-8?B?VDZLYUtmVWNhWkY1M3VEczZUWU9jRVFhSjhIN01nN2hadFpaa2RQM0NxbVRQ?=
 =?utf-8?B?cDJEWHppRFZYQ2RzcnliZWxNcUgraERUcEhCY2FrdjFYNGhqdTJyK3BJanZM?=
 =?utf-8?B?a050YXV0WE9wN1ZKN0VWKysvZ1ZKOHZoZ21yK1IrZWo4MWhYTW9Jb1JLV2ZJ?=
 =?utf-8?B?Sk5HVlNVMjVPMDNVWGtlQlFzNXlINFhZd1J4cjFVMGkvR1JQcDRrNGdFdGk1?=
 =?utf-8?B?VHNlcXIrckN1Y2pRUEhqWmpFMHN0S3VmRWp5SnF0cEdIWVlCc2dKWGZDa0tV?=
 =?utf-8?B?cmF6SlphRjdrTVNBNGxsTXJUUlE3a0dEKzZOY0VVQlhsQUkwSlN3MTh4Qkdu?=
 =?utf-8?B?TlVsRkRvQSsxeGVxYTBlOVJ0L2g5Z3d3cW9tN3R6VFpMWklJMG9xc3FuNkxv?=
 =?utf-8?B?dThuM3Z1bnhOWVFJNVVIQlJoSkJDa3d5UkE4d0NxdFdYOEsxQTROQWVnbnpQ?=
 =?utf-8?B?aHE4QmpBd3Y2d29GajZBM2hsbXZmd0FzNFJna0dUZmtVdSsrTUloWmhNZ0VF?=
 =?utf-8?B?L0c0czJlR2FKM1NVZVU3SUMyUEdISklYdjFWZzdYZlFqTElIREFnK0JzaGc0?=
 =?utf-8?B?UzhoSTBQRkZsYU4zaTdpMUJ2bityNUE4RXM1WmpaTVhhN1VGL0JFeEEwZU80?=
 =?utf-8?B?ZW5kejZpdFUyRHJoVnpMckpXVE1jR2RCQ0UyUFNwOGsrMUFVSGdMR05HK2JL?=
 =?utf-8?B?cDV1dU03MEpQUkNRd3BhWUwzaWEzR3Z3dHFvZER0Y2Nwc0JQYmZIcVZUU3pl?=
 =?utf-8?B?YnVLZUhsRmpaVXcrNVRxajNYV3RyOGM1ODIzQ01NblJtS3dock1tMnM3YUd4?=
 =?utf-8?B?MklZUmJsL1I4TW9hTW85QytKdlZESGFwd1BYamZzYjR3T2hBb0JNZmZGVmov?=
 =?utf-8?B?YjdNOGdKU3Q1N3BsUmJUOVRVWVZQbytLRUlXMmJQTW15M0xQM1JJb1lZNlJD?=
 =?utf-8?B?Y3lXKzc2OGJ6RnBOV09ad0R4MTFFVzdDamFuUS83UE4yRitiL1EvdnNuYWRW?=
 =?utf-8?B?L29mQTdxbUt6enZRdUg0MW1jaFpUbnlpcFhWdmlwL0hVc0crbklURVYzTGRk?=
 =?utf-8?B?QmRXdW9yOVNZcExYa2VrRHp3dEZ3YjRTR1hJWU1tWkxBVkpxRGNBbTV0Rlc5?=
 =?utf-8?B?WlhMN1JHa1pZelZReEYybWJiWW1TMEU1MThYbUhVdEhnSWI0SEorMURZbElu?=
 =?utf-8?B?R2VLZktTNDZsMy8yZ0VoQW1INXBvQnBGN3pTRFhQSjlkWHduR0FpUjRRMTlw?=
 =?utf-8?B?L2xKUVBGdTZ4aWhia1dFYnQxUVJTUTY2RFhCRkZMN1NqQzVOSGpHVEk1Rzh0?=
 =?utf-8?B?TWpxUVFGOGR3TXNDRTZsL0NZZHlwanB4SXhBVUU3a05MN1FQQTBqR2w1VEtN?=
 =?utf-8?B?R2lUM0JVTSsyUTBvN2RicjJVUktUbm1qaHFGV0RQYWNwTmdiQjA1TFhzSEVO?=
 =?utf-8?B?QlV1eFdIc2xuMU1IT3ZCejZTeEVSYWRNRnNlODJkeGJScFNFcWdrcFpqeHl6?=
 =?utf-8?B?Z3orZXZnU3lybmVXYi9BNExHZ2hndFM0Mk9BTnMxRUcvVmRVZThqK1VQMnRW?=
 =?utf-8?B?d2htOXUrZlBvenU2ekVHeGtLVGp3ZklMaHNhUXErcEhOQ1AvQVZ2RmROWjlD?=
 =?utf-8?Q?0keU66KS2iqKk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 00:56:00.7993 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85919b04-5555-4e95-3d42-08dca20d6601
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5986
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

Hi Dave, Sima,

Fixes for 6.10.

The following changes since commit 256abd8e550ce977b728be79a74e1729438b4948:

  Linux 6.10-rc7 (2024-07-07 14:23:46 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.10-2024-07-11

for you to fetch changes up to dc1000bf463d1d89f66d6b5369cf76603f32c4d3:

  Revert "drm/amd/display: Reset freesync config before update new state" (2024-07-11 20:48:42 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.10-2024-07-11:

amdgpu:
- PSR-SU fix
- Reseved VMID fix

----------------------------------------------------------------
Christian König (1):
      drm/amdgpu: reject gang submit on reserved VMIDs

Leo Li (1):
      Revert "drm/amd/display: Reset freesync config before update new state"

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c            | 15 +++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c           | 15 ++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h           |  1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 -
 4 files changed, 30 insertions(+), 2 deletions(-)
