Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 553F2832190
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 23:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6762510E754;
	Thu, 18 Jan 2024 22:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2056.outbound.protection.outlook.com [40.107.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6203A10E754;
 Thu, 18 Jan 2024 22:31:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gv3HyM/MtBDR/nysvHvvotE1zw/S5hTHj50OzFZZRKMWNuwtelcC6KllEv1hoEQfKXB2BIzcgzqU6+8rxhdwEbin8mzLbeu1C19o1OM+jaogCTGcYbA9ej0t90r4L4v20OlVRpHb551lgxvOBddtqw5iO8KQUCBR/OFg8bwbSeGQAVHtoR29DFMHOupdQAwGPC74wVz3tNVE3tAg2hkLuwZXvqhvWh3L4aASRSUjcFzZ59x8bGHLLlemgHmdY3E7dbFm52cDguq7OUKhi96Rn58cf9Kp7iTqlCZGgJFAhu2vVyMg5oEG7ZDKpL+iaPkNpkYR5YuN5FAkXAwBD2UzNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPDg+3bp/WsviDoctHvXTVnzh6f8T5rB66AbEyW8LF0=;
 b=YmL7HVdaNQJwssigJuhdUm2AugFCstT6r7mTwKw7X68tdlbHNdtS+sb6qnf8disgbNbnxvd8A1h4V4pjWk06kHVYByTualuUISmwd8SaM+2NPdXwrRrQQRi717eeV04RcVam/DFQ7qhjWpmSfJZi0Oi3S2E9uN2kV1J3zM5DNrl+UTOmIj5s3aV/2Nj9m69rIfM4KYWcDw4uAUcfIhOnbUmC1L8mjBfkiRXpcEBRwjUoHcC/GVsvSZQGUBk/MdPikezTZcXA+lupor4BjZ6eJn4ujX3XoczuxJNmyfZhfWM7OvA+DT5Y99qsbOfcxLTYVpi2yOCV2C5YqyAKAxQgXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPDg+3bp/WsviDoctHvXTVnzh6f8T5rB66AbEyW8LF0=;
 b=GsRhNjeCEcRCVddQ3Zckgc+MqSRvicL+8A2v5cVQxiRu84T4Mvm39Hd71sTgfOOCW2G6n4ay5GPtowyIgcxzkhK1tQAdqvXIKkz7LG5TlRCbYYLj6yqNRfJM1TdwsqR2EGfVfU7QKLZMNLogW3ZS9k8hqpXoSbkSfaS389PzjG4=
Received: from DM6PR02CA0044.namprd02.prod.outlook.com (2603:10b6:5:177::21)
 by CY8PR12MB7753.namprd12.prod.outlook.com (2603:10b6:930:93::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 22:31:45 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:177:cafe::35) by DM6PR02CA0044.outlook.office365.com
 (2603:10b6:5:177::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24 via Frontend
 Transport; Thu, 18 Jan 2024 22:31:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Thu, 18 Jan 2024 22:31:43 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 18 Jan
 2024 16:31:42 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.8
Date: Thu, 18 Jan 2024 17:31:27 -0500
Message-ID: <20240118223127.4904-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|CY8PR12MB7753:EE_
X-MS-Office365-Filtering-Correlation-Id: 6421945f-8972-4872-7f85-08dc18753fac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jiRIhYO4a/vlLwIBHIjnvZoFYrUbGlK7i6jXFCkFvXZhsWMAbc7W3WnFl41DcWvgY0hi3UhdufOTXy2tW3a86U9HxAesD4E4Bv9hJdZe+tZdlM9aX1xmy/0OESgTLpjNdZh0oZp9fBCMxaXmXCs9Fm3DzihFN8ggWgceuPTk5cueoB34E1nn/ATT6Wk3/vWQ6Nj3+5shxmlEcYG6yKWdHU+BbVlcjLiM0aUi+uoS44jjjlUPT+PDx0LdPSHjpagrChU8QBmn7uhNZ9UPTwFFqBSPWVuN6X6qDJTOfc9bbvE8Pcz28vp+6UPDV/Ya36jZbgjqO4fCSMT3s0mh52RNKVHFZZCEwTRT5yQg9/oIeYrIe9AZeyTyqgckqIwlLzFpwNUyIo8gy9jCI6cmbZLiMJEDB8NNIpIIKyAHQX8BslMrFDHmIPp07rx2+E7q6H4ffYFyZ1fRAnmoIKvqGj59MKgV0Z7f9vw44b0+QRqiROiGC/gDUF53Ews4lnlmnxVqGm577KTxqFO429y6bwmLppvvOLQfP30PU62kyrG4asVbhZs8H/8DYjhrf3AQocT3eo+iq1HEFzVWapX7o6zxLw+mhjNYQuZedKrtLaTjU+7DCOWs/05qf8ADmrDap6BW1bNBGJnaW5HkIHCErQz7dNZSffhTjLIkz31e5LJvs2jJUcUj+08gUEzyPAKlnFrDJ9uMr255rdIhtm2AXqgoRnGCwRBVab48ayJUTpJOa9yLRXWyaLS6CbQU56rBvURG71CdaAuiuA3ua++b/2c6rRBPIC/XK1djvGv6aVI4Ino=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(39860400002)(346002)(376002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(451199024)(82310400011)(1800799012)(186009)(36840700001)(40470700004)(46966006)(70206006)(83380400001)(110136005)(70586007)(316002)(2906002)(36756003)(36860700001)(8936002)(8676002)(4326008)(86362001)(5660300002)(41300700001)(47076005)(82740400003)(40480700001)(966005)(40460700003)(356005)(81166007)(1076003)(26005)(16526019)(478600001)(426003)(336012)(66574015)(7696005)(2616005)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 22:31:43.7339 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6421945f-8972-4872-7f85-08dc18753fac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7753
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Sima,

New fixes for 6.8, on top of the fixes I sent last week and fixed up on Monday.

The following changes since commit d7643fe6fb76edb1f2f1497bf5e8b8f4774b5129:

  drm/amd/display: Avoid enum conversion warning (2024-01-15 18:35:07 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.8-2024-01-18

for you to fetch changes up to aa0901a9008eeb2710292aff94e615adf7884d5f:

  drm/amdgpu: Enable GFXOFF for Compute on GFX11 (2024-01-18 16:45:19 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.8-2024-01-18:

amdgpu:
- DSC fixes
- DC resource pool fixes
- OTG fix
- DML2 fixes
- Aux fix
- GFX10 RLC firmware handling fix
- Revert a broken workaround for SMU 13.0.2
- DC writeback fix
- Enable gfxoff when ROCm apps are active on gfx11 with the proper FW version

amdkfd:
- Fix dma-buf exports using GEM handles

----------------------------------------------------------------
Charlene Liu (1):
      drm/amd/display: Add logging resource checks

Christian König (1):
      drm/amdgpu: revert "Adjust removal control flow for smu v13_0_2"

Christophe JAILLET (1):
      drm/amd/display: Fix a switch statement in populate_dml_output_cfg_from_stream_state()

Dillon Varone (1):
      drm/amd/display: Init link enc resources in dc_state only if res_pool presents

Flora Cui (1):
      drm/amdkfd: init drm_client with funcs hook

Ilya Bakoulin (1):
      drm/amd/display: Clear OPTC mem select on disable

Ma Jun (1):
      drm/amdgpu: Fix the null pointer when load rlc firmware

Nicholas Kazlauskas (1):
      drm/amd/display: Port DENTIST hang and TDR fixes to OTG disable W/A

Ori Messinger (1):
      drm/amdgpu: Enable GFXOFF for Compute on GFX11

Ovidiu Bunea (1):
      drm/amd/display: Fix DML2 watermark calculation

Srinivasan Shanmugam (2):
      drm/amd/display: Fix late derefrence 'dsc' check in 'link_set_dsc_pps_packet()'
      drm/amd/display: Drop 'acrtc' and add 'new_crtc_state' NULL check for writeback requests.

Wayne Lin (1):
      drm/amd/display: Align the returned error code with legacy DP

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         | 11 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 32 +---------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 32 ----------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |  1 -
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             | 15 ++++------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  6 ++--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  5 ++++
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c | 21 ++++++--------
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  4 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  4 +++
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |  8 ++++--
 .../drm/amd/display/dc/dml2/display_mode_core.c    | 14 +++++-----
 .../amd/display/dc/dml2/dml2_translation_helper.c  |  2 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |  8 ++++--
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |  3 ++
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |  3 ++
 17 files changed, 62 insertions(+), 108 deletions(-)
