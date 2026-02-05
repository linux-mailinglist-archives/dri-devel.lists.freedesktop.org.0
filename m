Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PbVGnjfhGmi6AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 19:20:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9BDF66B0
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 19:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8D210E949;
	Thu,  5 Feb 2026 18:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="23sp98v2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011046.outbound.protection.outlook.com [52.101.52.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5189310E944;
 Thu,  5 Feb 2026 18:20:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjA481iGTAfGyjEupZGNeDbC1zZ98OFuDP3ftFSKeB5iHKyLJKPVKdIOV3JIWyXNs4i3Y1xtLR10xeCkCk/SLccN7s9mGF9h6FlC3I1iShAI1EZHiUOAbxaSfZWAcDdLUcg3g7WafahmqhSYL92QyaFM0tFk4NU/Pk3s91X8LqAP4cm+2y40JH9HpNw865XJkpRGV/BYhN8w+ueoL16cprFjyrs/ynnxt0wvVxipahmZiEkdUEF3f5SUYS5X7Yx+LaKI6zG6WwmSJEErahZVub3IEumrT1mQwO3R5r/I6P94JsiAogeU6B0Ww01O50WB/iXkOqrIhTi47Lwcb28yPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/skgTGwz7EjK3thKxc2Dv49bUUIAznsjGHSawHSMHYA=;
 b=eEF2k694fdcaQLcME3fhc6tGBhPBpbyxGdwnjCYymYXk/RjE3I52ai1oE826L5Wf4HZqvG4Wslqo7Wx1Sme5HTCg+zNK4qngGab92Do2RCk02gDob2bv3Sxb1W4iSfrUKtkwtFiogzXH3Z+79RXFVpD0UZu9n7r81f+tdEl+rndCJZYeocoZr+gMQGpBXdXw+OOKC9/c7hwuSnMgG+mOio2ZOLYW22TJEou1OzgOtGIPlNBXex4LAZpe+8ISI0WKMIJTd2XFotHZjVYIehaR/dciW97KYPo/ixvCUFKjnDIbL/oiA5WDYeJPziWwNs3bF7rA4z+wJ203fzY9hWddEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/skgTGwz7EjK3thKxc2Dv49bUUIAznsjGHSawHSMHYA=;
 b=23sp98v2yn63tWMfYiVaHc8JSksLOgCg1CMSvcs3UW9CsekK895zoDrJ9dFxyGzq1FeJD4QviAJZXySf1hFhVP3OYstFq2V0w+RlXNsE18s/Mwob7m4YN7EJBoshp95iZvha6kZKnJpfAgoaBKNQDpMdcqRrLP2bh1zWf5VL9WA=
Received: from DM6PR07CA0101.namprd07.prod.outlook.com (2603:10b6:5:337::34)
 by LV2PR12MB5824.namprd12.prod.outlook.com (2603:10b6:408:176::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 18:20:29 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:5:337:cafe::94) by DM6PR07CA0101.outlook.office365.com
 (2603:10b6:5:337::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Thu,
 5 Feb 2026 18:20:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Thu, 5 Feb 2026 18:20:28 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Feb
 2026 12:20:26 -0600
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 5 Feb 2026 10:20:26 -0800
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.19
Date: Thu, 5 Feb 2026 13:20:17 -0500
Message-ID: <20260205182017.2409773-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|LV2PR12MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: 2004b8eb-2c57-4975-7d6f-08de64e33d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D8s5zPdZjGz7dibcjcw/LnrS3hagpFIiapb975+PVBPJJrMdRxys0gxrajT2?=
 =?us-ascii?Q?BuCYSuotG6L7bvXRA9Dd0pgHZUtJTf4j7bgSdcE3ULy8iLK5hXOx8eMdQkhO?=
 =?us-ascii?Q?U/OB/Jp+hZGt9gooAWvYR2136ASLgLhPLZzZp1fqjXV3j5vigSQ39y87/Zb3?=
 =?us-ascii?Q?CbqB3cn8j+89GUUmB9DWZdcpUpMs+UabV5zazE86BPM187zekh6ISqQLE0l8?=
 =?us-ascii?Q?+M7KJcdCKjG9ijE3n7xbpc1XtxkBN6PZVpvUVxZWT7mVj64DWLoh0xcdMURd?=
 =?us-ascii?Q?B4W6l/1PZCVxtpMSZKaFwNKA+EqjNrit9+BuCRYJMQWek4VS9nkdEr1XYYIT?=
 =?us-ascii?Q?RyTlnGqDu4wN7fmV2cS2+aVk3fkDsvp+c4rtnhiTX22jYCUITVhvu/1Zjf0B?=
 =?us-ascii?Q?Ez2EM+migxQhap8RwVN7Uo+mwou3NB5YjdOYnYYFVPIDmjO8DdFDWRRYYCYn?=
 =?us-ascii?Q?QI/EK04s9B6FDDjZTb7OBGTvSsZtGdM8trVUonQMVpW0afLNy4X3fy8QbIBw?=
 =?us-ascii?Q?ktuCOmVwoA99ahsHTGYyG+1q/1WQ8zYtyd8WyH7FCobdZmAKKXxk5uDIttmX?=
 =?us-ascii?Q?I19OJWS2bTqBVWAKndkzpn2Qwe9xLkePblfwYXxd6h+Ez0CLW+OW87zjAhEs?=
 =?us-ascii?Q?LdvucSJaQmyoMEaQKqxiw9B5JAfav7ovu2eeFTlEK9P+jhYDdlVN3uN/U1iI?=
 =?us-ascii?Q?0LS4z39PI0IoRpTkMYawk19qLFAnAgA5n8+klalmIDkZGP5UNilxqt8oxdVo?=
 =?us-ascii?Q?JsqtffRA+Cjk57VqfPsL7Fes7XoJ+gbwyoDOOtthII8Cy4owzYS+OjVfrYEi?=
 =?us-ascii?Q?2NM6JmhapS2jTllzv4f5qJW/Cl5b/3MN5O9iwhXAhiDB6BbUrcQE3hx1gRo2?=
 =?us-ascii?Q?VezEFSEOiFTuXRSsEEQjWrOarHBomJaym2A2Dkf4nyBDWz+lPQcQyGewe8gt?=
 =?us-ascii?Q?/e2g0MUVpmE6jb2n6xLFlFY6Qhvo1z6/tRSOe7D5d1x+EJoD9/0gz1xDOa3H?=
 =?us-ascii?Q?5Vq015WP1+yJBnWM/7IQUGDdOdUpmuUdioDiafNlKttMXk7xPUicIOZg7xjE?=
 =?us-ascii?Q?0ulnQKvmN4eCHwRbRuneeTYu6Cy1AuQpWa60VCHwes2qfbk3PLzdq3ttk4IM?=
 =?us-ascii?Q?GkRFiytbELz59VPSxIxH0A+ySdMKKYxdsKP06WjqAhD+UMOLj01dWwNZYKFT?=
 =?us-ascii?Q?C5mSKiVg/fnB6TdSvYZy4LW7B8JoFBDGxmIz5gAMZSR5MIJ7+AS5C20BAzgW?=
 =?us-ascii?Q?1MbRgapNW+Zvt6i5LJsolvSXONAymS7f2ksl+0OYQ8T2VqoT+xowjobpESLr?=
 =?us-ascii?Q?XQ7tWnl8+TZc2Oc/NUDLEDQJsoZeXsbKF9duURd9KWrT0caqTf7uo2ihiJPL?=
 =?us-ascii?Q?mEcpuaAb0AwzyYq/I2zHdejSvDHLzq2peDk5iayO4S022pPCJk7BOUV5kGDp?=
 =?us-ascii?Q?CjCgVELgrgCSKZ3+ppLhOZ/6RhAx7Ip4Zn9c+PMwr7q82udqWW72pmDralnK?=
 =?us-ascii?Q?1L0iD62bXceG73ggz1pDdwLKy5v1GKFgnml4DY4QRlWqio2/c4WC+Vxypde9?=
 =?us-ascii?Q?bWiRth4F6bt1LcuRnKV6tiD48AH5EbDq3aa+ggZ2SGEMVKmlobHhzRUPJ7Gz?=
 =?us-ascii?Q?/Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Dy6yKjc35b8NLOEi5I+2ntju3wGqavzx9v28g+u9xO9LRhCpfGdiEP4kArmNXoqde3oR4bHxxAzxPNUBRbwiE6mXV+0ceD1ypprxXdRhhlNv8CvIg6sNjx9/Wikn4kgiAV3BNb6oaBy20bRX4uQ2W7vwglNOnkdTmtfdmxDE3+yZiMZjIn8XcYpMpqvNZSO+BOhhAVjytGyZ49xdMZcxqGfJEQdXQqmpUabMZe2c4ge506u33tL/0Xz5WdOKqZI7z4biFtva2YkZ2d1hBN6rl7XtuwSIKLKV5dLQhZ4XHp3kwVRb55Cu3kRV3jUOuVGqIchavsT0vEwU1pk/vKMnyUZR9ktnBfV3jOHhFWqmYS2mjISnQVEg1d0dnZLhccsOQQRhfK2tvKZWEaC6hlASEVZZkrq1g4a47LHpkXg0RBws3dGrwtFAA7sdWF3DNoGp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 18:20:28.3534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2004b8eb-2c57-4975-7d6f-08de64e33d6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5824
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF9BDF66B0
X-Rspamd-Action: no action

Hi Dave, Simona,

Fixes for 6.19.

The following changes since commit 18f7fcd5e69a04df57b563360b88be72471d6b62:

  Linux 6.19-rc8 (2026-02-01 14:01:13 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.19-2026-02-05

for you to fetch changes up to 6b61a54e684006ca0d92d684a1d3c3a00f077d8f:

  drm/amdgpu: Fix double deletion of validate_list (2026-02-03 17:24:21 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.19-2026-02-05:

amdgpu:
- MES 11 old firmware compatibility fix
- ASPM fix
- DC LUT fixes

amdkfd:
- Fix possible double deletion of validate list

----------------------------------------------------------------
Bert Karwatzki (1):
      Revert "drm/amd: Check if ASPM is enabled from PCIe subsystem"

Harish Kasiviswanathan (1):
      drm/amdgpu: Fix double deletion of validate_list

Mario Limonciello (1):
      drm/amd: Set minimum version for set_hw_resource_1 on gfx11 to 0x52

Melissa Wen (3):
      drm/amd/display: fix wrong color value mapping on MCM shaper LUT
      drm/amd/display: extend delta clamping logic to CM3 LUT helper
      drm/amd/display: remove assert around dpp_base replacement

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   | 14 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  3 --
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c | 37 +++++++++++++++++-----
 .../drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h |  2 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |  9 +++---
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    | 18 ++++++-----
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  | 16 ++++++----
 8 files changed, 62 insertions(+), 39 deletions(-)
