Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58788A29C1D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 22:50:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACC410E19C;
	Wed,  5 Feb 2025 21:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dshMrzj2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58B710E19C;
 Wed,  5 Feb 2025 21:49:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AP0VONquthCHZk8ueIdS/sDQHJ96pdsNqikweL1o6w8eWk0qGsSkDdJnw/iZMD9lOGp1aLEWGjTa3N/Pzwjg/hmMiuT5SsdqWrKcnJZS290xAz0BDWDHbXCMIfK+OtssTOZzJqh4VzdpoLiTNQ26nd5MNc8Nd06ptlf5/v44+B6YI/haYNEyfIxGNX377KDK7yH6FilyTqKwqcy7slDUzhQR1bzM3oR5+g9d4eUFKfMEfhDIXXaJu7WsIv4J/XoMNZKBj6e0EQM6NwiowJPQHbqCzptdsAfPjanmsXVUF8wJpCtt1NXQOOaNEiVir6CvjvsFRux+WGZahnbAM7SbpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+l8q0qAjKYm6gla9AWxk+vJf58/JWyNwKhW/FCIzo0=;
 b=AUzzo9F4j6F6ie0nb3f3Lfm3zCb6vCk7cKeT39GWLGXoYtBncyLO3/efc6SA2UR+hX/KCVupgwP1KUd2EjZf96JrnQMKmv5QKJzuPWq5yRJrPjHIpyis4oUKLrV8qmhmt3O3X+V6a+IOFXxIaF/hTTt8fCjzO7JAXaVZVa5mCw0PjRaDXIkPOkNBvtqNcE0HWzPga7y7OB67sUpWT/T50dWQp6PSnFBx60CM0yyPU+WmCYY2Co2i2KWMogmHmt8cE7YVY29oeig3t/n7jj+4o5IEWuh+6J4y+1lSkMAjPwgOwl13NPWfzbgV+TsrY7bWMrqm6MN8cxBuVi+86SaKVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+l8q0qAjKYm6gla9AWxk+vJf58/JWyNwKhW/FCIzo0=;
 b=dshMrzj2FySEUlyCQAMGkvwibhn5qhbhcQg+Ov4HYI1+vCe/bmBiAZjAEZCOkRdh1vD9WAexMrBdmPpM6YO0drTJhyr0QZMr+R2zuFnNedt27KatsvCRgF0zxtmj/HbYTwTHTlj31w196c9d435qT4bgzgHdiiyoZdygppxz15o=
Received: from SJ0PR03CA0353.namprd03.prod.outlook.com (2603:10b6:a03:39c::28)
 by DS7PR12MB6006.namprd12.prod.outlook.com (2603:10b6:8:7d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 21:49:51 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::2c) by SJ0PR03CA0353.outlook.office365.com
 (2603:10b6:a03:39c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.27 via Frontend Transport; Wed,
 5 Feb 2025 21:49:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Wed, 5 Feb 2025 21:49:50 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 15:49:49 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.14
Date: Wed, 5 Feb 2025 16:49:08 -0500
Message-ID: <20250205214910.3664690-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|DS7PR12MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: ef92a96a-0bab-4cfc-d833-08dd462f0475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|30052699003|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjlkVUE0N3JQUTJ5YWtKRWlKbXg3RWJUbUJEWmtURTRIMzNxOW1rNWVGVDZv?=
 =?utf-8?B?Yzl3aldneE1IM2UxN1IwdTFET3E0cmwwK0ttR3B1STV3NktjSXFFUmpPeHFF?=
 =?utf-8?B?aVVyV3A2NHU1SDlTYjNtQTFEVjJQVjJQMlY0WHVVenlXRmVJSjFMVU9VMFpQ?=
 =?utf-8?B?QTZNb2kyRzRKbEg2c28vbGI1S3VjR0VKZHlyYkQ4TEtrYmxia2RzbTZJcFBE?=
 =?utf-8?B?c3E1Z2drK3NLSGNhVVNsVytKdUFMWTFtVmlvSmVZVjBrZU1neVpEWjVmMUpY?=
 =?utf-8?B?RzRwMkdsWmhkNGRHSEV1c0NLL0pSRVdic01aajlMNXBBNy8yR0JjMTYySzdJ?=
 =?utf-8?B?RGVaSEYrVHpiNldNV1FCb2RabzVJR0RMbmtpUTRpOGZ1bm1TS1ZaclFQVUF1?=
 =?utf-8?B?RDdQc0FuSkpQMU1lOW9OYlF1NE0rVnhCOURKMGtMWTdyQ1VZTk5WMTBScmU0?=
 =?utf-8?B?a1pUalVEbFNwYysraWdXcWdNWnVNM3JzVU96NGZQVjhkZXNXNlh3RURoQXow?=
 =?utf-8?B?blB3QVNEWXFSWGxsdi9CajR1WkxPelFrREJyU1NnbEM0bThaN05XbHJpNXI5?=
 =?utf-8?B?MnFKUUYyYmVZS2tHeG5nZGNScUdlY0pJWkttbHJpR1RwMnp2b1pxclJDZGln?=
 =?utf-8?B?QlFraTlxUlo2Q1pBcVNOUVBVUGhHUTdyUnAwN00yRUVFNWJPajNpMDN1d2J0?=
 =?utf-8?B?bzc1bXpyZjcxYkNHU2dIN3NWaGFSV0RqY1hDTDFSdWRWVHBlL2tvdktMUm5Q?=
 =?utf-8?B?enhJb2FzMU4rbTJkTU1kcFlrazRpcWIyZ3pnaGV2R3JYbDZ5REtndU5FdWpX?=
 =?utf-8?B?eWlpd1ZpRzgzTDlDM1hUVVI1RldMWTcxelpST1RiaURvOC92WjhmNW9vVWZy?=
 =?utf-8?B?R1RRbXc4VmdZSEd0amNhQ3VUUFR1TTV1L0lmcjBLWlRJbXFZQXVrTGdxT0Fu?=
 =?utf-8?B?Q3FiQW5KWlUwQURSaTNaM1lJNm9RY3o0ZitSU1pqbDlBc2tMaVp3Y25xMlhP?=
 =?utf-8?B?bHFRR2x0RlUvd0JuUUVPbWtISVZHT1ZTV002R28vQVFoWlNzMWFaekFWWXJR?=
 =?utf-8?B?TzFBa2lHbzNGZkRQaS9PcG1VZzRWUWE3QWl3Uy9YZ3lqL2FCUDFQUSsydVBu?=
 =?utf-8?B?eTNZYTk0eWhHYm0vbUxNUlBYY1l6RVpybE55MWExVDk3aUpDeTdlUmlCcHlY?=
 =?utf-8?B?TVJCWGc4RG5hcWhmVDFWSmxOZE54bEljczM2UUJjRXk4N2JKQXVxZnBubmVN?=
 =?utf-8?B?TW9uN1NSN1p6ZmhqNC9OcGhNY2pLQ1c0VWErc3Vxbm1RRS96RzVNMnpOYTVU?=
 =?utf-8?B?ODh3RFQ1TnZRR3BtbE9iQ1JlOEZ2NE9NalNSYzNkSTF0U0tzQWQ2UU5HaGcw?=
 =?utf-8?B?NlBDVzRCMUgyRFd0bHp2TFlpR3JYcjdZRmhCNjF1MUxpUFhBOG8xVjM0U0NG?=
 =?utf-8?B?TzJWd3Z5RDg1WGVtajg4Rm1PemFWUHFKQmpieitNYmhBUWwxSElWTnB4YjRv?=
 =?utf-8?B?amVoSUwxank1RWx2bDRpaFJNb1lvU2RhMTI1enA0VzlRNEhjMG0va01jbmp5?=
 =?utf-8?B?VWVUMTRSU0cwWVNqenJaNDNrNCsvVzRrSmxNZUtiL1A5UGRIZHRWVDZEU1hH?=
 =?utf-8?B?ejhtUHJGaVluNTRuRHl3TmY1aHBCNkNDMGhDWEdoWm5OVld5RmozRjBsbGlW?=
 =?utf-8?B?Yk9tYVVBeE4wWFhENDFEakhXNXVIVGxTeGwzcDdHaWV4MVJ0dnpSSXdac2Rj?=
 =?utf-8?B?VWFacjkxNWt5ckFPUXdNMTI0QVNNNkJrRGV0SW5ET1ZIOCtLVVk2Tkh4LzB1?=
 =?utf-8?B?blRhcDdTbjVJcytDY2VMNTFxN2dMUHhCN1RUYktqR1crblB1b0tsNHhMaUJL?=
 =?utf-8?B?d3VTQ3RWNWx0SjRBdjlCVm1GUU5yQktnUmJtNTlIQUxYL2ZsWVBEQXErUW9s?=
 =?utf-8?Q?grvNftYhzFE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(30052699003)(1800799024)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 21:49:50.6998 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef92a96a-0bab-4cfc-d833-08dd462f0475
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6006
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

Fixes for 6.14.

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.14-2025-02-05

for you to fetch changes up to f245b400a223a71d6d5f4c72a2cb9b573a7fc2b6:

  Revert "drm/amd/display: Use HW lock mgr for PSR1" (2025-02-04 17:47:34 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.14-2025-02-05:

amdgpu:
- Add BO metadata flag for DCC
- Fix potential out of bounds access in display
- Seamless boot fix
- CONFIG_FRAME_WARN fix
- PSR1 fix

UAPI:
- Add new tiling flag for DCC write compress disable
  Proposed userspace: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33255

----------------------------------------------------------------
Alex Hung (1):
      drm/amd/display: Fix out-of-bound accesses

Lo-an Chen (1):
      drm/amd/display: Fix seamless boot sequence

Marek Olšák (1):
      drm/amdgpu: add a BO metadata flag to disable write compression for Vulkan

Nathan Chancellor (1):
      drm/amd/display: Respect user's CONFIG_FRAME_WARN more for dml files

Tom Chung (1):
      Revert "drm/amd/display: Use HW lock mgr for PSR1"

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  8 ++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |  2 ++
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |  5 +++--
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  2 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |  3 +--
 drivers/gpu/drm/amd/display/dc/dml/Makefile        | 14 +++++++++-----
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       | 22 +++++++++++++---------
 .../dc/dml2/dml21/dml21_translation_helper.c       |  4 ++--
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  6 +++---
 .../drm/amd/display/dc/hubbub/dcn30/dcn30_hubbub.c |  3 ++-
 .../drm/amd/display/dc/hubbub/dcn31/dcn31_hubbub.c |  3 ++-
 .../drm/amd/display/dc/hubbub/dcn32/dcn32_hubbub.c |  3 ++-
 .../drm/amd/display/dc/hubbub/dcn35/dcn35_hubbub.c |  3 ++-
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c |  2 ++
 .../gpu/drm/amd/display/dc/hubp/dcn32/dcn32_hubp.c |  2 ++
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  3 ++-
 include/uapi/drm/amdgpu_drm.h                      |  9 ++++++++-
 18 files changed, 64 insertions(+), 33 deletions(-)
