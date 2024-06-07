Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BFD900CAF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 21:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4587210ECEA;
	Fri,  7 Jun 2024 19:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5Pbezwps";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A27510E100;
 Fri,  7 Jun 2024 19:59:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVnJSUNDODDFXNWqi2QY/KPR3tQpRCmYoftoDgTrqBp2232RA3/z/XkrjHceuZQ1SGBjxmceW2LEQDCXsiVajGfNMfo3zHqKgltgDYqh5aVESzi6T0RosW4jELoY+rXkuHWXIPFatF9hUYnJ7q2gcIXovUruZgPwAZqTA1s4yXYPTfkrKZa6PtU3EjH1Q36RPrUywYcYT1HncxbEBdn6mEwNGA5O9evBiEQUcly8X8a8Pj9eSNzn+u0dLCYtaIhmGJBX6D0+RDxO37FlQBogCu+I88DsrNzkIyGE7iiDRuNytQVtT6A+4ioGIygUFsBNJ1gMhTJuEazdP+t0AUrkeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z82iThTNv9KhUUGwRAoO3PFwU27Vk4RU/UGm7PSqbBY=;
 b=G2CKC26pmmp5By7di1fH8FjiGxmowgR02THcCfhNS45yAgbwuuPuUUToYQ4u+v5N73B49c97a0sSFBF6HjPbh0tSCodF6V3cEMzrWXXiONwj3vqCoAAuLodAx8hd3V7QCyjgzcj4gH/bpbyu2qZNdYGLmGSP3oi4+ZugjIJneYVzXJvDMpMwyCUEj7SzuwXd1iVZhZ3GceNn5M0f4h2O1Zv/MKfHBXQ5Ts4aXEsY/PfEX69ekSoOoDWzRM/UTtEDQ3NyVsxzE42zJlxwoDg85Q4Xuq5ByOa+9M0A7fKb8BNJ0WS/geb6TyqE3pPDOnv9fN9TWdcMgRbbSz8sSC8l6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z82iThTNv9KhUUGwRAoO3PFwU27Vk4RU/UGm7PSqbBY=;
 b=5Pbezwpsex3AIHOEfLx3fs/H7Ma9s8Qjy3bibW8WpVZQ/45GnxGDKtnLP0LKBZXPWj49CV90ZuYC9wSfOMRZXQU9RTINUiQaCdSTDhY4vhNjH6aPnU1vMfQo5auiYIjBbUohaGZ5v1Q9oAHeBH9WmSIHhumYEr3umuHBv2fXMHE=
Received: from MN2PR15CA0051.namprd15.prod.outlook.com (2603:10b6:208:237::20)
 by DM6PR12MB4121.namprd12.prod.outlook.com (2603:10b6:5:220::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 19:59:28 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:208:237:cafe::d3) by MN2PR15CA0051.outlook.office365.com
 (2603:10b6:208:237::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.21 via Frontend
 Transport; Fri, 7 Jun 2024 19:59:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 7 Jun 2024 19:59:27 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 14:59:25 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.11
Date: Fri, 7 Jun 2024 15:58:59 -0400
Message-ID: <20240607195900.902537-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|DM6PR12MB4121:EE_
X-MS-Office365-Filtering-Correlation-Id: 82fc8662-2725-41c6-32a4-08dc872c565d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|376005|82310400017|36860700004; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkdTMGxTcWJzdGdkNTdoRUJOZUJaNEU2bmRPMGFWS2tTVHRWSXduRXlabEUx?=
 =?utf-8?B?Wm9sNHFyb080OEJuWmMzVUxLTlg2YXBVeXNvQXMwdFBoZE5JU0FTTU1Jdjlk?=
 =?utf-8?B?cDBzZ3R1VzNrMnlpcyt6RkxWZjhDWVZPMjk1TCtiRkxteE5GaDlFaXdJZXc0?=
 =?utf-8?B?SFN3c0VUT25lazhJMXNBTmhxaFlJZzl5ZlExZWNzUUZNQW4vSi9hWTNhaTJk?=
 =?utf-8?B?QzZRcFovYUt0aUZBUWpQTE5wc2RiNndFZWpPYzBKTFFSVTVkRXNRWkJTa0xE?=
 =?utf-8?B?Q0tNMGRtWGxnN3VvUUkxQmFlWkI0aTY4ak8xSyswUVdRdlJab2xybzhEN0lr?=
 =?utf-8?B?TzZuRFlaR21KM3NEV2ZZMHB1T2MzUTZGSXJTUzFVSFo1VlVPaUh1VmpLdlVX?=
 =?utf-8?B?SmVHNVFNTXhnbk8rV0d6b2NRN1dub1Y5WENLVjdEc3FvSEYyRXE5ZEJ6QitG?=
 =?utf-8?B?UmNSV1FzVHZ2Zklib1lIRHQwMU5XK1BaVVlNVHIwdDNDNm5iT2pSUTBXQUg0?=
 =?utf-8?B?eVlDOWhNNHc3VHRoZEZTbTZjK2xDeEY0VmhUUGlBcEdiZ1V1ZFlKK1ZnS3Ay?=
 =?utf-8?B?V0FyeVNsOFZJNDhVd01tVjFoU3Qzc1BFUkJZa00zQ240K05qb0g3WHgvSTJY?=
 =?utf-8?B?ekRkMHZiTmpIR3NtKzRqdHBiTk90WmVseG0vaHV6aE5kMjZJUFgyV1dIOHRU?=
 =?utf-8?B?ZUc3UTlQekYwdC8xaVRZYXp3ZVV6dUJzWjNZM0lwTmtFTXptR1BsNEZNaFZL?=
 =?utf-8?B?S0dxaVdWMytPdUpuaC85UnhXYUVkNEV1NlJ4NTZNT0FReStXWGxGNDgwWWtk?=
 =?utf-8?B?VCtvSEVOVmx5NmtCNWs0T2txaXBvU2hwN1FRbEkyTFpGT3VEZkF1SEpzZDFX?=
 =?utf-8?B?aThscnZTVFhpd3N3V21acXBBakhmNnBiTVkwa3E4Y2llN3VkK1djSERpZU8w?=
 =?utf-8?B?THpWZjFqdUNQWW9RS1NNOW0rRlF5RVFNUHQ1bGRtUXRPSk54ZUpkV0NQSEVI?=
 =?utf-8?B?dkNqS2NVcDZlZVVnelVrM25ha0d6TkJlYjhDa0RwRGxwNkpjVW1ncm5rcUtU?=
 =?utf-8?B?S2wvVTVwbXl2QXBoTlJ3R1JvL1RML1lFdlRzMHdBcndLSG92V09vTVJUY0ZN?=
 =?utf-8?B?NTJIOHlOelRJcE1iL3dPaExlTkhFRTZtQWVHLy81WEVUVGF3V2FkV3lHd1Rr?=
 =?utf-8?B?U1dudzRDU2ttL3lUZTZPc2RqODNZQWpXbk5ITE4ycmFnbSsraFp0cytFNzZo?=
 =?utf-8?B?ZlIwQ29HT2tXdDlqZkNJUHlNTDVWSExiNWQ2TzRaVytYMmpLdnpLb2VhVWdu?=
 =?utf-8?B?cjdDeG1IL1FybjdqSVlHOFhLdTQ1OVdRS2E3aUF1VlI1R3BBOEFveW5jdlVX?=
 =?utf-8?B?Ylh6MFhUbjlvTlRaRUhtZkRRakljbVFXQWxJSzY4QnVpZExGQWlMNVBwM2hY?=
 =?utf-8?B?QjBST1I2eXhnc1RRQ3RjVDJCU1lYZXg4TUJoQmpwZGh1bEc0VDFqT3FBeGtZ?=
 =?utf-8?B?V1VBSVhHNG8rT3RQNDdhcitwL1d0Z0VIU0VIY3h4S0lzb3BCT3pwNTIxUW1U?=
 =?utf-8?B?UnB2dldkNEZud1VzVUR1NmlLbFkrOVUvcXdESkNSRXJhVDFSenRqMnh3K3Qy?=
 =?utf-8?B?TUFtZmNHWWYwQ3hSSEgyakt2RysxSCtJOVpmVHVxQkJ5UG0wQ2xIc0J0d2Fy?=
 =?utf-8?B?eEdzRldGV2ZCcm5nWkRyb09SeHlsTnplMlpOWjRNVUdqbG14emowUzA1YlJa?=
 =?utf-8?B?ZjNBSGVSY2tERzl4VHZiSzdya1FTNmxSRHpVOWxDWFpZaWtNd05tYTdnRUV6?=
 =?utf-8?Q?K03ubMpX1+fOE16ODxzkiUjbFF8nZx+2I8KMc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400017)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 19:59:27.5933 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82fc8662-2725-41c6-32a4-08dc872c565d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4121
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

New stuff for 6.11.

The following changes since commit b77bef36015c501f1e0f51db72c55e6dcd8bdd48:

  drm/amd/display: Add some HDCP registers DCN35 list (2024-04-26 17:22:45 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.11-2024-06-07

for you to fetch changes up to b95fa494d6b74c30eeb4a50481aa1041c631754e:

  drm/amdgpu: add RAS is_rma flag (2024-06-05 11:25:14 -0400)

----------------------------------------------------------------
amd-drm-next-6.11-2024-06-07:

amdgpu:
- DCN 4.0.x support
- DCN 3.5 updates
- GC 12.0 support
- DP MST fixes
- Cursor fixes
- MES11 updates
- MMHUB 4.1 support
- DML2 Updates
- DCN 3.1.5 fixes
- IPS fixes
- Various code cleanups
- GMC 12.0 support
- SDMA 7.0 support
- SMU 13 updates
- SR-IOV fixes
- VCN 5.x fixes
- MES12 support
- SMU 14.x updates
- Devcoredump improvements
- Fixes for HDP flush on platforms with >4k pages
- GC 9.4.3 fixes
- RAS ACA updates
- Silence UBSAN flex array warnings
- MMHUB 3.3 updates

amdkfd:
- Contiguous VRAM allocations
- GC 12.0 support
- SDMA 7.0 support
- SR-IOV fixes

radeon:
- Backlight workaround for iMac
- Silence UBSAN flex array warnings

UAPI:
- GFX12 modifier and DCC support
  Proposed Mesa changes:
  https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29510
- KFD GFX ALU exceptions
  Proposed ROCdebugger changes:
  https://github.com/ROCm/ROCdbgapi/commit/08c760622b6601abf906f75abbc5e21d9fd425df
  https://github.com/ROCm/ROCgdb/commit/944fe1c1414a68700414e86e32273b6bfa62ba6f
- KFD Contiguous VRAM allocation flag
  Proposed ROCr/HIP changes:
  https://github.com/ROCm/ROCT-Thunk-Interface/commit/f7b4a269914a3ab4f1e2453c2879adb97b5cc9e5
  https://github.com/ROCm/ROCR-Runtime/pull/214/commits/26e8530d05a775872cb06dde6693db72be0c454a
  https://github.com/ROCm/clr/commit/1d48f2a1ab38b632919c4b7274899b3faf4279ff

----------------------------------------------------------------
Adam Nelson (1):
      drm/amd/display: Fix 3dlut size for Fastloading on DCN401

Agustin Gutierrez (2):
      drm/amd/display: Fix DSC-re-computing
      drm/amd/display: MST DSC check for older devices

Alex Deucher (31):
      drm/amdgpu/mes12: print MES opcodes rather than numbers
      drm/amdgpu/mes12: increase mes submission timeout
      drm/amdgpu/mes12: Use a separate fence per transaction
      drm/amdkfd: don't allow mapping the MMIO HDP page with large pages
      drm/amdgpu: add nbio set_reg_remap helper
      drm/amdgpu: add set_reg_remap callback for NBIO 6.1
      drm/amdgpu: add set_reg_remap callback for NBIO 7.0
      drm/amdgpu: add set_reg_remap callback for NBIO 7.4
      drm/amdgpu: add set_reg_remap callback for NBIO 7.9
      drm/amdgpu: add set_reg_remap callback for NBIO 7.11
      drm/amdgpu: add set_reg_remap callback for NBIO 7.2
      drm/amdgpu: add set_reg_remap callback for NBIO 2.3
      drm/amdgpu: add set_reg_remap callback for NBIO 4.3
      drm/amdgpu: add set_reg_remap callback for NBIO 7.7
      drm/amdgpu: add set_reg_remap callback for NBIF 6.3.1
      drm/amdgpu/soc15: use common nbio callback to set remap offset
      drm/amdgpu/nv: use common nbio callback to set remap offset
      drm/amdgpu/soc21: use common nbio callback to set remap offset
      drm/amdgpu: fix documentation errors in sdma v7.0
      drm/amdgpu: fix documentation errors in gmc v12.0
      drm/amdgpu: Adjust logic in amdgpu_device_partner_bandwidth()
      drm/amdgpu: silence UBSAN warning
      drm/amdgpu: drop MES 10.1 support v3
      Revert "drm/amdkfd: fix gfx_target_version for certain 11.0.3 devices"
      drm/amdkfd: simplify APU VRAM handling
      drm/amdgpu/gfx11: select HDP ref/mask according to gfx ring pipe
      drm/amdgpu/gfx11: handle priority setup for gfx pipe1
      drm/amdgpu/gfx11: enable gfx pipe1 hardware support
      drm/amdgpu/soc24: use common nbio callback to set remap offset
      drm/amdgpu: update gc_12_0_0 headers
      Revert "drm/amdgpu/gfx11: enable gfx pipe1 hardware support"

Alex Hung (20):
      drm/amd/display: Skip accessing array for unknown eng_id
      drm/amd/display: Ensure array index tg_inst won't be -1
      drm/amd/display: Check gpio_id before used as array index
      drm/amd/display: Fix incorrect size calculation for loop
      drm/amd/display: Check index for aux_rd_interval before using
      drm/amd/display: Check num_valid_sets before accessing reader_wm_sets[]
      drm/amd/display: Skip updating link encoder for unknown eng_id
      drm/amd/display: Check msg_id before processing transcation
      drm/amd/display: Check link_index before accessing dc->links[]
      drm/amd/display: Limit clock assignments by size of clk tables
      drm/amd/display: Spinlock before reading event
      drm/amd/display: Limit array index according to architecture
      drm/amd/display: Avoid overflow dc_clk_table->entries by limit to MAX_NUM_DPM_LVL
      drm/amd/display: Skip plane when not found by stream id
      drm/amd/display: Ensure index calculation will not overflow
      drm/amd/display: Assign disp_cfg_index_max when dml21
      drm/amd/display: Fix uninitialized variables in dcn401 and dml21
      Revert "drm/amd/display: Enable SYMCLK gating in DCCG"
      drm/amd/display: Fix incorrect DCN401 comparison
      drm/amd/display: Adjust incorrect indentations and spaces

Alvin Lee (9):
      drm/amd/display: Only program P-State force if pipe config changed
      drm/amd/display: Assign linear_pitch_alignment even for VM
      drm/amd/display: For FPO + Vactive check that all pipes support VA
      Revert "drm/amd/display: Only program P-State force if pipe config changed"
      drm/amd/display: Don't offload flip if not only address update
      drm/amd/display: Fix ODM + underscan case with cursor
      drm/amd/display: Only program P-State force if pipe config changed
      drm/amd/display: Move fpo_in_use to stream_status
      drm/amd/display: Use current_state when checking old_pipe subvp type

Anthony Koo (2):
      drm/amd/display: [FW Promotion] Release 0.0.214.0
      drm/amd/display: [FW Promotion] Release 0.0.216.0

Aric Cyr (5):
      drm/amd/display: 3.2.282
      drm/amd/display: 3.2.283
      drm/amd/display: 3.2.284
      drm/amd/display: 3.2.285
      drm/amd/display: 3.2.286

Arnd Bergmann (4):
      drm/amd/display: dynamically allocate dml2_configuration_options structures
      drm/amd/display: fix graphics_object_id size
      drm/amd/display: avoid large on-stack structures
      drm/amd/display: Move 'struct scaler_data' off stack

Asad Kamal (5):
      drm/amd/amdgpu: Check tbo resource pointer
      drm/amd/pm: Add gpu_metrics_v1_6
      drm/amd/pm: Use gpu_metrics_v1_6 for SMUv13.0.6
      Revert "drm/amd/pm: Use gpu_metrics_v1_6 for SMUv13.0.6"
      Revert "drm/amd/pm: Add gpu_metrics_v1_6"

Aurabindo Pillai (19):
      drm/amd: Add gfx12 swizzle mode defs
      drm/amd: define new gfx12 uapi flags
      drm/amd: GFX12 changes for converting tiling flags to modifiers
      drm/amd: Add DCN401 related register definitions
      drm/amd/display: Add new DCN401 sources
      drm/amd/display: Fix SPL related enum definition used in DCN401
      drm/amd/display: Add gfx12 modifiers
      drm/amd/display: Add DCN401 dependant changes for DMCUB
      drm/amd/display: Add some DCN401 reg name to macro definitions
      drm/amd/display: Add misc DC changes for DCN401
      drm/amd: Enable DCN410 init
      drm/amd:  Override DCN410 IP version
      drm/amd/display: Remove unnecessary HPD entry for DCN401
      drm/amd/display: Use DCN 410 includes for DCN401
      drm/amd/display: Remove incorrect FP context start
      drm/amd/display: Fix null pointer dereference for dcn401
      drm/amd/display: Move some init routines to dm_sw_init()
      drm/amd/display: Add new GPINT command definitions
      drm/amd/display: Enable copying of bounding box data from VBIOS DMUB

Bhuvana Chandra Pinninti (1):
      drm/amd/display: Refactor HUBP into component folder.

Bill Wendling (1):
      drm/radeon: Remove __counted_by from StateArray.states[]

Bob Zhou (2):
      drm/amd/pm: Fix the null pointer dereference for vega10_hwmgr
      drm/amd/pm: add missing error handling in function smu_v13_0_6_allocate_dpm_context

Bruno Rocha Levi (1):
      drivers/gpu: Fix misalignment in comment block

Chris Park (4):
      drm/amd/display: Reduce I2C speed to 95kHz in DCN401
      drm/amd/display: Use the correct TMDS function to avoid DVI issues
      drm/amd/display: Deallocate DML 2.1 Memory Allocation
      drm/amd/display: Support new VA page table block size

Christian König (1):
      drm/amdgpu: once more fix the call oder in amdgpu_ttm_move() v2

Chun-LiangChang (1):
      drm/amd/display: Add params of set_abm_event for VB Scaling

Colin Ian King (2):
      drm/amd/display: Fix spelling various spelling mistakes
      drm/amd/display: Fix a handful of spelling mistakes

Cruise (2):
      drm/amd/display: Disable error correction if it's not supported
      drm/amd/display: Not fallback if link BW is smaller than req BW

Dan Carpenter (3):
      drm/amd/display: re-indent dpp401_dscl_program_isharp()
      drm/amdgpu: Fix signedness bug in sdma_v4_0_process_trap_irq()
      drm/amd/display: re-indent dc_power_down_on_boot()

Daniel Miess (2):
      drm/amd/display: Enable RCO for PHYSYMCLK in DCN35
      drm/amd/display: Enable SYMCLK gating in DCCG

Daniel Sa (1):
      drm/amd/display: Fetch Mall caps from DC

David (Ming Qiang) Wu (7):
      amdgpu/vcn: enable AMD_PG_SUPPORT_VCN
      drm/amdgpu/vcn5: Add VCN5 capabilities
      drm/amdgpu/vcn: remove irq disabling in vcn 5 suspend
      drm/amdgpu/vcn: set VCN5 power gating state to GATE on suspend
      drm/amd/amdgpu: update jpeg 5 capability
      drm/amd/amdgpu: add AMD_PG_SUPPORT_VCN_DPG flag
      drm/amdgpu: drop some kernel messages in VCN code

David Belanger (8):
      drm/amdkfd: Basic SDMA and cache info changes for GFX12.
      drm/amdkfd: Added temporary changes for GFX12.
      drm/amdkfd: Added MQD manager files for GFX12.
      drm/amdkfd: Added device queue manager files for GFX12.
      drm/amdkfd: Added gfx_v12_kfd2kgd interface for GFX12.
      drm/amdkfd: Enable GFX12 trap handler
      drm/amdkfd: Enable atomic support for GFX12
      drm/amdgpu: Fix physical address mask

Dennis Chan (2):
      drm/amd/display: Fix Replay Desync Error Test
      drm/amd/display: Refactor for Replay Link off frame count

Dillon Varone (9):
      drm/amd/display: Refactor input mode programming for DIG FIFO
      drm/amd/display: Reset input mode for DIG on encoder reset
      drm/amd/display: Create dcn401_clk_mgr struct
      drm/amd/display: Refactor dcn401_update_clocks
      drm/amd/display: Modify HPO pixel clock programming to support DPM
      drm/amd/display: Disable DCN401 idle optimizations
      drm/amd/display: Correct display clocks update block sequence
      drm/amd/display: Wait for hardmins to complete on dcn401
      drm/amd/display: Add UCLK p-state support message to dcn401

Dr. David Alan Gilbert (3):
      drm/amdgpu: remove unused struct 'hqd_registers'
      drm/amd/display: remove unused struct 'aux_payloads'
      drm/amd/display: remove unused struct 'dc_reg_sequence'

Duncan Ma (1):
      drm/amd/display: Read default boot options

Eric Huang (3):
      drm/amdkfd: fix NULL ptr for debugfs mqds on GFX v12
      drm/amdgpu: add reset sources in gpu reset context
      drm/amdkfd: add reset cause in gpu pre-reset smi event

Ethan Bitnun (2):
      drm/amd/display: Block FPO According to Luminance Delta
      drm/amd/display: Find max flickerless instant vtotal delta

Fangzhi Zuo (1):
      drm/amd/display: Prevent IPX From Link Detect and Set Mode

Frank Min (7):
      drm/amdgpu: add initial value for gfx12 AGP aperture
      drm/amdgpu: fix mqd corruption for gfx12
      drm/amdgpu/mes: use mc address for wptr in add queue packet
      drm/amdgpu: fix getting vram info for gfx12
      drm/amdgpu: program device_cntl2 through pci cfg space
      drm/amdgpu: Set PTE_IS_PTE bit for gfx12
      drm/amdgpu: Update soc24_enum.h and soc21_enum.h

Friedrich Vock (1):
      drm/amdgpu: Check if NBIO funcs are NULL in amdgpu_device_baco_exit

Gabe Teeger (1):
      drm/amd/display: Atom Integrated System Info v2_2 for DCN35

George Shen (2):
      drm/amd/display: Skip SST ACT polling when sink_count is 0
      drm/amd/display: Check UHBR13.5 cap when determining max link cap

Gui Chengming (1):
      drm/amd/pm: add pstate support for SMU_14_0_2

Harikrishna Revalla (1):
      drm/amd/display: Refactor HUBBUB into component folder for DCN401

Harish Kasiviswanathan (3):
      drm/amdgpu: Add mes_v12_api_def.h for gfx12
      drm/amdkfd: Use dev_error intead of pr_error
      drm/amdkfd: Ensure gpu_id is unique

Harry Wentland (4):
      drm/amd/display: Separate setting and programming of cursor
      drm/amd/display: Set cursor attributes before position
      drm/amd/display: Do cursor programming with rest of pipe
      drm/amd/display: Always use legacy way of setting cursor on DCE

Hawking Zhang (17):
      drm/amdgpu: Add gc v12_0_0 ip headers (v4)
      drm/amdgpu: Add soc24 chip enum definitions (v4)
      drm/amdgpu: Add soc24 common ip block (v2)
      drm/amdgpu: Add mmhub v4_1_0 ip headers (v4)
      drm/amdgpu: Add mmhub v4_1_0 ip block support (v4)
      drm/amdgpu: Add gfx v12 pte/pde format change
      drm/amdgpu: Add gmc v12_0 ip block support (v7)
      drm/amdgpu: Set pte_is_pte flag in gmc v12 gart
      drm/amdgpu: support gfx v12 specific pte/pde fields
      drm/amdgpu: Add sdma v4_4_5 ip block
      drm/amdgpu: Add psp v13_0_14 ip block
      drm/amdgpu: Add smu v13_0_14 ip block
      drm/amdgpu: Add gfx v9_4_4 ip block
      drm/amdgpu: Switch to smuio func to get gpu clk counter
      drm/amdgpu: correct hbm field in boot status
      drm/amdgpu: Estimate RAS reservation when report capacity v2
      drm/amdgpu: Update programming for boot error reporting

Heiner Kallweit (1):
      drm/amd/pm: remove deprecated I2C_CLASS_SPD support from newly added SMU_14_0_2

Hersen Wu (18):
      drm/amd/display: Fix incorrect DSC instance for MST
      drm/amd/display: Add NULL pointer and OVERRUN check within amdgpu_dm irq register
      drm/amd/display: Stop amdgpu_dm initialize when stream nums greater than 6
      drm/amd/display: Stop amdgpu_dm initialize when link nums greater than max_links
      drm/amd/display: Add missing NULL pointer check within dpcd_extend_address_range
      drm/amd/display: Add array index check for hdcp ddc access
      drm/amd/display: Release state memory if amdgpu_dm_create_color_properties fail
      drm/amd/display: Add otg_master NULL check within resource_log_pipe_topology_update
      drm/amd/display: Fix Coverity INTERGER_OVERFLOW within construct_integrated_info
      drm/amd/display: Fix Coverity INTEGER_OVERFLOW within dal_gpio_service_create
      drm/amd/display: Add NULL pointer check for kzalloc
      drm/amd/display: Fix wrong array size dummy_boolean of dml2_core_calcs_mode_support_locals
      drm/amd/display: Release clck_src memory if clk_src_construct fails
      drm/amd/display: Fix Coverity INTEGER_OVERFLOW within decide_fallback_link_setting_max_bw_policy
      drm/amd/display: Skip inactive planes within ModeSupportAndSystemConfiguration
      drm/amd/display: Fix writeback job lock evasion within dm_crtc_high_irq
      drm/amd/display: Fix index may exceed array range within fpu_update_bw_bounding_box
      drm/amd/display: Add NULL check within get_target_mpc_factor

Ilya Bakoulin (4):
      drm/amd/display: Add condition for dp_set_dsc_config call
      drm/amd/display: Fix FEC_READY write on DP LT
      drm/amd/display: Fix write to non-existent reg on DCN401
      drm/amd/display: Add 3DLUT DMA load trigger

Iswara Nagulendran (1):
      drm/amd/display: Restrict multi-disp support for in-game FAMS

Jack Xiao (20):
      drm/amdgpu/mes11: add mes mapping legacy queue support
      drm/amdgpu/mes11: adjust mes initialization sequence
      drm/amdgpu/gfx: enable mes to map legacy queue support
      drm/amdgpu/mes11: increase waiting time for engine ready
      drm/amdgpu/sdma7: set sdma hang watchdog
      drm/amdgpu: Add mes v12_0 ip block support (v4)
      drm/amdgpu: enable mes v12 self test
      drm/amdgpu/mes12: update data cache boundary
      drm/amdgpu/gfx12: recalculate available compute rings to use
      drm/amdgpu/mes: add uni_mes fw loading support
      drm/amdgpu/mes12: add uni_mes fw loading support
      drm/amdgpu/mes12: enable uni_mes fw on mes pipe0
      drm/amdgpu/mes12: add mes mapping legacy queue support
      drm/amdgpu/gfx: enable mes to map legacy queue support
      drm/amdgpu/mes12: add legacy setting hw resource interface
      drm/amdgpu: add module parameter 'amdgpu_uni_mes'
      drm/amdgpu/mes12: disable logging output
      drm/amdgpu/mes11: fix kiq ring ready flag
      drm/amdgpu/mes: fix mes12 to map legacy queue
      drm/amdgpu/mes12: mes hw_fini fix for mode1 reset

Jane Jian (1):
      drm/amdgpu - optimize rlc spm cntl

Jay Cornwall (6):
      drm/amdkfd: Move trap handler coherence flags to preprocessor
      drm/amdkfd: Add gfx12 trap handler support
      drm/amdkfd: Sync trap handler binary with source
      drm/amdkfd: Replace deprecated gfx12 trap handler instructions
      drm/amdkfd: gfx12 context save/restore trap handler fixes
      drm/amdkfd: Handle deallocated VPGRs in gfx11+ trap handler

Jesse Zhang (40):
      drm/amd/pm: fix uninitialized variable warning
      drm/amd/pm: fix uninitialized variable warning
      drm/amd/pm: fix warning using uninitialized value of max_vid_step
      drm/amd/pm: Fix negative array index read
      drm/amd/pm: fix the Out-of-bounds read warning
      drm/amd/pm: enable UMD Pstate profile level for renoir
      drm/amdgpu: Fix the warning division or modulo by zero
      drm/amd/pm: fix get dpm level count for smu13
      drm/amd/pm: fix get dpm level count for yello carp
      drm/amdgpu: fix dereference after null check
      drm/amdgpu: fix the waring dereferencing hive
      drm/amdgpu: clear the warning unsigned compared against 0 for xcp_id
      drm/amd: fix the warning unchecking return vaule for sdma_v7
      drm/amd/pm: check specific index for aldebaran
      drm/amd/pm: check the return of send smc msg for sienna_cichild
      drm/amd/pm: check the return of send smc msg for navi10
      drm/amd/pm: check specific index for smu13
      drm/amd/pm: check the return of send smc msg for smu_v13
      drm/amdgpu: remove structurally dead code for amd_gmc
      drm/amd/pm: remove logically dead code for renoir
      drm/amdgu: remove unused code
      drm/amd/pm: fix enum type compared against 0
      drm/amd/pm: fix enum feature compared against 0
      drm/amdgpu: remove structurally dead code
      drm/amd/pm: remove logically dead code
      drm/amdgpu: the warning dereferencing obj for nbio_v7_4
      drm/amdgpu: fix the warning bad bit shift operation for aca_error_type type
      drm/amd/pm: check negtive return for table entries
      drm/amd/pm: fix unsigned value asic_type compared against
      drm/admgpu: fix dereferencing null pointer context
      drm/amdgpu: fix invadate operation for umsch
      drm/amdgpu: fix invadate operation for pg_flags
      drm/amdgpu: fix dereference null return value for the function amdgpu_vm_pt_parent
      drm/amdgu: fix Unintentional integer overflow for mall size
      drm/amdkfd: remove dead code in the function svm_range_get_pte_flags
      drm/amdkfd: Comment out the unused variable use_static in pm_map_queues_v9
      drm/amdkfd: fix the kdf debugger issue
      drm/amdkfd: remove dead code in kfd_create_vcrat_image_gpu
      drm/amdkfd: remove logically dead code
      drm/amd/pm: remove dead code in si_convert_power_level_to_smc

Jiapeng Chong (4):
      drm/amd/display: Remove duplicate spl/dc_spl_types.h header
      drm/amd/display: Remove duplicate dcn401/dcn401_clk_mgr.h header
      drm/amdgpu: Remove duplicate amdgpu_umsch_mm.h header
      drm/amd/display: clean up some inconsistent indenting

Joan Lee (2):
      drm/amd/display: Enable Replay for DCN315
      drm/amd/display: Add retires when read DPCD

Jonathan Kim (4):
      drm/amdgpu: fix trap enablement for gfx12
      drm/amdkfd: always enable ttmp setup for gfx12
      drm/amdkfd: fix support for trap on wave start and end for gfx12
      drm/amdkfd: enable single alu ops for gfx12

Joshua Aberback (4):
      Revert "drm/amd/display: Fix incorrect pointer assignment"
      drm/amd/display: Disable AC/DC codepath when unnecessary
      drm/amd/display: Fix swapped dimension calculations
      drm/amd/display: workaround for oled eDP not lighting up on DCN401

Kendall Smith (1):
      drm/radeon: initialize backlight for iMac12,2 with Radeon 6750M

Kenneth Feng (22):
      drm/amd/amdgpu: imu fw loading support
      drm/amd/amdgpu: workaround for the imu fw loading
      drm/amd/amdgpu: add cgcg&cgls interface for gfx 12.0
      drm/amd/amdgpu: enable cgcg and cgls
      drm/amd/amdgpu: enable mgcg on gfx 12.0.1
      drm/amd/amdgpu: enable 3D cgcg and 3D cgls
      drm/amd/amdgpu: enable perfcounter mgcg and repeater fgcg
      drm/amd/amdgpu: enable sram fgcg on gc 12.0.1
      drm/amd/amdgpu: enable gfxoff on gc 12.0.1
      drm/amd/amdgpu: enable mmhub and athub cg on gc 12.0.1
      drm/amd/pm: support mode1 reset on smu_v14_0_3
      drm/amd/pm: enable mode1 reset on smu v14.0.2/v14.0.3
      drm/amd/pm: add tool log support on smu v14.0.2/3
      drm/amd/pm: add pp_dpm_dcefclk for smu 14.0.2/3
      drm/amd/pm: disable gpo temporarily
      drm/amd/amdgpu: add module parameter for jpeg
      drm/amd/pm: support pp_dpm_pcie on smu v14.0.2/3
      drm/amd/pm: support mode1 reset on smu v14.0.3
      drm/amd/pm: update driver-if interface
      drm/amd/amdgpu: add thm 14.0.2 header file
      drm/amd/pm: enable thermal alert on smu 14.0.2/3
      drm/amd/pm: workaround to pass jpeg unit test

Lancelot SIX (2):
      drm/amdkfd: Flush the process wq before creating a kfd_process
      drm/amdkfd: save and restore barrier state for gfx12

Lang Yu (2):
      drm/amdkfd: handle duplicate BOs in reserve_bo_and_cond_vms
      drm/amdkfd: Let VRAM allocations go to GTT domain on small APUs

Laurent Morichetti (1):
      drm/amdkfd: enable missed single-step workaround for gfx12

Leo Ma (2):
      drm/amd/display: Fix DC mode screen flickering on DCN321
      drm/amd/display: Fix invalid Copyright notice

Li Ma (2):
      drm/amd/swsmu: update Dpmclocks_t for smu v14.0.1
      drm/amdgpu/atomfirmware: add intergrated info v2.3 table

Lijo Lazar (18):
      drm/amd/amdxcp: Use unique name for partition dev
      Revert "drm/amdkfd: Add partition id field to location_id"
      drm/amd/amdxcp: Fix warnings
      drm/amd/pm: Fix aldebaran pcie speed reporting
      drm/amdgpu: Fix memory range calculation
      drm/amdgpu: Add nps info table to IP discovery
      drm/amdgpu: Use NPS ranges from discovery table
      drm/amd/pm: Add support for DPM policies
      drm/amd/pm: Update PMFW messages for SMUv13.0.6
      drm/amd/pm: Add support to select pstate policy
      drm/amd/pm: Add xgmi plpd policy to pm_policy
      drm/amd/pm: Add xgmi plpd to SMU v13.0.6 pm_policy
      drm/amd/pm: Add xgmi plpd to aldebaran pm_policy
      drm/amd/pm: Add xgmi plpd to arcturus pm_policy
      drm/amd/pm: Remove legacy interface for xgmi plpd
      drm/amd/pm: Remove unused interface to set plpd
      Documentation/amdgpu: Add PM policy documentation
      drm/amdgpu: Add CRC16 selection in config

Likun Gao (37):
      drm/amdgpu/discovery: Add common soc24 ip block
      drm/amdgpu: Add gfxhub v12_0 ip block support (v3)
      drm/amdgpu/discovery: Add gmc v12_0 ip block
      drm/amdgpu: add gfx12 mqd structures
      drm/amdgpu: Add new members for sdma v7_0 fw
      drm/amdgpu: Add sdma fw v3 structure
      drm/amdgpu: Add sdma v7_0 ip block support (v7)
      drm/amdgpu: support SDMA v3 struct fw front door load
      drm/amdgpu: provide more ucode name shown via id
      drm/amdgpu/discovery: add sdma v7_0 ip block
      drm/amdgpu: Add gfx v12_0_0 family id
      drm/amdgpu/discovery: Set GC family for GC 12.0 IP
      drm/amdgpu: add gfx12 clearstate header
      drm/amdgpu: add new TOC structure
      drm/amdgpu: add rlc TOC header file for soc24
      drm/amdgpu: init mes ucode name for gfx v12
      drm/amdgpu: set mes fw address for mes v12
      drm/amdgpu: Add gfx v12_0 ip block support (v6)
      drm/amdgpu: set cp fw address set for gfx v12
      drm/amdgpu: skip imu related function if dpm=0
      drm/amdgpu: support S&R fw load for gfx v12
      drm/amd: Move fw init from sw_init to early_init for imu v12
      drm/amdgpu: set different fw data addr for mec pipe
      drm/amdgpu: use new method to program rlc ram
      drm/amdgpu: fix active rb and cu number for gfx12
      drm/amdgpu: skip dpm check to init imu fw
      drm/amdgpu: init gfxhub setting to align with mmhub
      drm/amdgpu/discovery: add gfx v12_0 ip block
      drm/amdgpu/discovery: add mes v12_0 ip block
      drm/amdgpu: support cg state get for gfx v12
      drm/amdgpu: fix spl component for psp v14
      drm/amdgpu: support imu for gc 12_0_0
      drm/amdgpu: enable gfx cgcg&cgls for gfx v12_0_0
      drm/amdgpu: enable some cg feature for gc 12.0.0
      drm/amdgpu: switch default mes to uni mes
      drm/amd/amdgpu: enable mmhub and athub cg on gc 12.0.0
      drm/amdgpu: enable gfxoff for gc v12.0.0

Lin.Cao (2):
      drm/amdkfd: Check debug trap enable before write dbg_ev_file
      drm/amdgpu: fix failure mapping legacy queue when FLR

Ma Jun (19):
      drm/amdgpu: Fix uninitialized variable warning in amdgpu_afmt_acr
      drm/amdgpu/pm: Check the return value of smum_send_msg_to_smc
      drm/amdgpu/pm: Fix uninitialized variable warning for smu10
      drm/amdgpu/pm: Fix uninitialized variable agc_btc_response
      drm/amdgpu: Fix the uninitialized variable warning
      drm/amdgpu: Fix out-of-bounds write warning
      drm/amdgpu: Fix out-of-bounds read of df_v1_7_channel_number
      drm/amdgpu: Fix uninitialized variable warning in amdgpu_info_ioctl
      drm/amdgpu/pm: Fix the param type of set_power_profile_mode
      drm/amdgpu/pm: Check input value for CUSTOM profile mode setting on legacy SOCs
      drm/amdgpu/pm: Check input value for power profile setting on smu11, smu13 and smu14
      drm/amdgpu/pm: Fix code alignment issue
      drm/amdgpu/pm: Drop redundant setting code for pcie lanes
      drm/amdgpu: Fix null pointer dereference to bo
      drm/amdgpu: Remove dead code in amdgpu_ras_add_mca_err_addr
      drm/amdgpu/pm: Fix the null pointer dereference for smu7
      drm/amdgpu/pm: Drop hard-code value of usTMax
      drm/amdgpu: Fix the null pointer dereference to ras_manager
      drm/amdgpu/pm: Fix the null pointer dereference in apply_state_adjust_rules

Marcelo Mendes Spessoto Junior (1):
      drm/amd/display: fix documentation warnings for mpc.h

Marek Olšák (1):
      drm/amdgpu: define new gfx12 uapi flags

Mario Limonciello (7):
      drm/amd/display: Disable panel replay by default for now
      dm/amd/pm: Fix problems with reboot/shutdown for some SMU 13.0.4/13.0.11 users
      drm/amd/display: Don't register panel_power_savings on OLED panels
      drm/amd/display: Drop pixel_clock_mhz
      drm/amd/display: Pass errors from amdgpu_dm_init() up
      drm/amd/display: Enable colorspace property for MST connectors
      drm/amd: Fix shutdown (again) on some SMU v13.0.4/11 platforms

Meenakshikumar Somasundaram (1):
      drm/amd/display: Allocate zero bw after bw alloc enable

Michael Chen (1):
      drm/amdkfd: Reconcile the definition and use of oem_id in struct kfd_topology_device

Michael Strauss (1):
      drm/amd/display: Add delay to improve LTTPR UHBR interop

Michel Dänzer (1):
      drm/amdgpu: Fix comparison in amdgpu_res_cpu_visible

Mukul Joshi (1):
      drm/amdkfd: Fix CU Masking for GFX 9.4.3

Natanel Roizenman (1):
      drm/amd/display: Add null check in resource_log_pipe_topology_update

Nathan Chancellor (3):
      drm/amd/display: Add frame_warn_flag to dml2_core_shared.o
      drm/amd/display: Fix CFLAGS for dml2_core_dcn4_calcs.o
      drm/amd/display: Avoid -Wenum-float-conversion in add_margin_and_round_to_dfs_grainularity()

Nevenko Stupar (1):
      drm/amd/display: gpuvm handling in DML21

Nicholas Kazlauskas (4):
      drm/amd/display: Force flush after write to IPS driver signals
      drm/amd/display: Add trigger FIFO resync path for DCN35
      drm/amd/display: Notify idle link detection through shared state
      drm/amd/display: Fix idle optimization checks for multi-display and dual eDP

Nicholas Susanto (3):
      drm/amd/display: Enable urgent latency adjustments for DCN35
      drm/amd/display: Fix pipe addition logic in calc_blocks_to_ungate DCN35
      drm/amd/display: Fix DML2 logic to set clk state to min

Peyton Lee (1):
      drm/amdgpu/vpe: fix vpe dpm clk ratio setup failed

Philip Yang (6):
      drm/amdgpu: Support contiguous VRAM allocation
      drm/amdgpu: Handle sg size limit for contiguous allocation
      drm/amdgpu: Evict BOs from same process for contiguous allocation
      drm/amdkfd: Evict BO itself for contiguous allocation
      drm/amdkfd: Bump kfd version for contiguous VRAM allocation
      drm/amdkfd: Remove arbitrary timeout for hmm_range_fault

Pinninti (1):
      drm/amd/display: Refactor HUBP into component folder.

Rajneesh Bhardwaj (1):
      drm/amdgpu: Make CPX mode auto default in NPS4

Ramesh Errabolu (1):
      drm/amd/amdkfd: Fix a resource leak in svm_range_validate_and_map()

Relja Vojvodic (1):
      drm/amd/display: Updated optc401_set_drr to use dcn401 functions

Revalla Hari Krishna (3):
      drm/amd/display: Refactor HUBBUB into component folder
      drm/amd/display: Refactor DCCG into component folder
      drm/amd/display: Refactor DCN401 DCCG into component directory

Rodrigo Siqueira (22):
      drm/amd/display: Update comments in DC
      drm/amd/display: Ensure that dmcub support flag is set for DCN20
      drm/amd/display: Add missing IRQ types
      drm/amd/display: Drop unnecessary semicolon
      drm/amd/display: Replace uint8_t with u8 for dp_hdmi_dongle_signature_str
      drm/amd/display: Improve registers write
      drm/amd/display: Add missing SMU version
      drm/amd/display: Adjust codestyle for dcn31 and hdcp_msg
      drm/amd/display: Add VCO speed parameter for DCN31 FPU
      drm/amd/display: Adjust functions prefix for some of the dcn301 fpu functions
      drm/amd/display: Enable legacy fast update for dcn301
      drm/amd/display: Update some of the dcn303 parameters
      drm/amd/display: Remove legacy code in DC
      drm/amd/display: Add log_color_state callback to multiple DCNs
      drm/amd/display: Handle the case which quad_part is equal 0
      drm/amd/display: Remove unused code for some dc files
      drm/amd/display: Remove USBC check for DCN32
      drm/amd/display: Remove duplicate configuration
      drm/amd/display: Add missing DML2 var helpers
      drm/amd/display: Remove unused code
      drm/amd/display: Update DML2.1 generated code
      drm/amd/display: Add missing registers for DCN401

Roman Li (6):
      drm/amd/display: Re-enable IPS2 for static screen
      drm/amd/display: Add periodic detection for IPS
      drm/amd/display: Clear shared dmub firmware state on init
      drm/amd/display: Add ips status info to debugfs
      drm/amd/display: Remove redundant idle optimization check
      drm/amd/display: Fix POWERPC_64 compilation

Ruijing Dong (1):
      drm/amdgpu/vcn: update vcn5 enc/dec capabilities

Saleemkhan Jamadar (1):
      drm/amdgpu/umsch: add support to capture fw debug log

Samson Tam (5):
      drm/amd/display: Clean-up recout calculation for visual confirm
      drm/amd/display: Add COEF filter types for DCN401
      drm/amd/display: enable EASF support for DCN40
      drm/amd/display: Enable ISHARP support for DCN401
      drm/amd/display: fix YUV video color corruption in DCN401

Shane Xiao (3):
      drm/amdgpu: Update the impelmentation of AMDGPU_PTE_MTYPE_GFX12
      drm/amdgpu: Update the impelmentation of AMDGPU_PTE_MTYPE_NV10
      drm/amdgpu: Update the impelmentation of AMDGPU_PTE_MTYPE_VG10

Shashank Sharma (1):
      drm/amdgpu: fix doorbell regression

Shixiong Ou (1):
      drm/radeon: Delay Connector detecting when HPD singals is unstable

Sonny Jiang (4):
      drm/amdgpu: IB test encode test package change for VCN5
      drm/amdgpu/jpeg5: enable power gating
      drm/amdgpu/vcn5: enable DPG mode support
      drm/amdgpu/jpeg5: enable power gating

Sreeja Golui (1):
      drm/amd/display: Providing a mechanism to have a custom pwm frequency

Sreekant Somasekharan (4):
      drm/amd/amdkfd: Add GFX12 PTE flag to SVM get PTE function
      drm/amdkfd: mark GFX12 system and peer GPU memory mappings as MTYPE_NC
      drm/amdkfd: Check correct memory types for is_system variable
      drm/amdkfd: Add GFX1201 to svm_range_get_pte_flags function

Sridevi (1):
      drm/amd/display: Fix incorrect cursor position for dcn401

Srinivasan Shanmugam (12):
      drm/amd/display: Address kdoc for 'Enable CRTC' in optc401_enable_crtc
      drm/amd/display: Remove redundant NULL check in dce110_set_input_transfer_func
      drm/amd/display: Remove redundant NULL check in dcn10_set_input_transfer_func
      drm/amdgpu: Fix truncation by resizing ucode_prefix in imu_v12_0_init_microcode
      drm/amdgpu: Fix buffer size to prevent truncation in gfx_v12_0_init_microcode
      drm/amdgpu/display: Update kdoc for 'optc35_set_odm_combine'
      drm/amdgpu: Remove duplicate check for *is_queue_unmap in sdma_v7_0_ring_set_wptr
      drm/amdgpu: Fix snprintf usage in amdgpu_gfx_kiq_init_ring
      drm/amd/display: Refactor construct_phy function in dc/link/link_factory.c
      drm/amdgpu/display: Fix null pointer dereference in dc_stream_program_cursor_position
      drm/amdgpu: Fix type mismatch in amdgpu_gfx_kiq_init_ring
      drm/amd/display: Add null checks for 'stream' and 'plane' before dereferencing

Sung Joon Kim (5):
      drm/amd/display: Reuse the modified power sequence
      drm/amd/display: Fix recout calculation for stereo side-by-side
      drm/amd/display: Update dcn351 debug flags and function pointers
      drm/amd/display: Disable seamless boot on 128b/132b encoding
      drm/amd/display: Expand to higher link rates

Sung-huai Wang (1):
      drm/amd/display: Handle HPD_IRQ for internal link

Sunil Khatri (19):
      drm/amdgpu: add function descripion of new functions
      drm/amdgpu: remove ip dump reg_count variable
      drm/amdgpu: add CP headers registers to gfx10 dump
      drm/amdgpu: add se registers to ip dump for gfx10
      drm/amdgpu: rename the ip_dump to ip_dump_core
      drm/amdgpu: Add cp queues support fro gfx10 in ipdump
      drm/amdgpu: add gfx queue support of gfx10 in ipdump
      drm/amdgpu: add prints in IP State dump
      drm/amdgpu: add more device info to the devcoredump
      drm/amdgpu: Add missing offsets in gc_11_0_0_offset.h
      drm/amdgpu: add gfx11 registers support in ipdump
      drm/amdgpu: add print support for gfx11 ipdump
      drm/amdgpu: add cp queue registers for gfx11 ipdump
      drm/amdgpu: add gfx queue support for gfx11 ipdump
      drm/amdgpu: add gfx9 register support in ipdump
      drm/amdgpu: add print support for gfx9 ipdump
      drm/amdgpu: add cp queue registers for gfx9 ipdump
      drm/amdgpu: rename ip_dump_cp_queues to compute queues
      drm/amdgpu: fix comments and error message for ipdump

Swapnil Patel (2):
      drm/amd/display: Add dtbclk access to dcn315
      drm/amd/display: Change ASSR disable sequence

Tao Zhou (3):
      drm/amdgpu: update type of buf size to u32 for eeprom functions
      drm/amdgpu: use u32 for buf size in __amdgpu_eeprom_xfer
      drm/amdgpu: add RAS is_rma flag

Tasos Sahanidis (1):
      drm/amdgpu/pptable: Fix UBSAN array-index-out-of-bounds

Tim Huang (12):
      drm/amdgpu: fix potential resource leak warning
      drm/amdgpu: fix overflowed array index read warning
      drm/amd/pm: fix uninitialized variable warning for smu8_hwmgr
      drm/amd/pm: fix uninitialized variable warning for smu_v13
      drm/amdgpu: fix uninitialized scalar variable warning
      drm/amd/pm: fix uninitialized variable warnings for vega10_hwmgr
      drm/amd/pm: fix uninitialized variable warnings for vangogh_ppt
      drm/amdgpu: fix uninitialized variable warning for sdma_v7
      drm/amdgpu: fix uninitialized variable warning for amdgpu_xgmi
      drm/amdgpu: fix uninitialized variable warning for jpeg_v4
      drm/amdgpu: fix ucode out-of-bounds read warning
      drm/amdgpu: fix mc_data out-of-bounds read warning

Tim Van Patten (1):
      drm/amdgpu: Remove GC HW IP 9.3.0 from noretry=1

Tobias Jakobi (1):
      drm/amd/display: Add MSF panel to DPCD 0x317 patch list

Tom Chung (1):
      drm/amd/display: Add Replay capability and state in debugfs

Tom St Denis (1):
      drm/amd/amdgpu: update GFX12 wave data registers

Tvrtko Ursulin (5):
      drm/amdgpu: Add amdgpu_bo_is_vm_bo helper
      drm/amdgpu: Reduce mem_type to domain double indirection
      drm/amdgpu: Describe all object placements in debugfs
      drm/amdgpu: Fix amdgpu_vm_is_bo_always_valid kerneldoc
      drm/amd/display: Convert some legacy DRM debug macros into appropriate categories

Victor Skvortsov (3):
      drm/amdgpu: Extend KIQ reg polling wait for VF
      drm/amdgpu: Queue KFD reset workitem in VF FED
      drm/amdgpu: Add lock around VF RLCG interface

Victor Zhao (1):
      drm/amd/amdgpu: fix the inst passed to amdgpu_virt_rlcg_reg_rw

Wayne Lin (2):
      drm/amd/display: Remove unnecessary files
      drm/amd/display: Defer handling mst up request in resume

Webb Chen (2):
      drm/amd/display: Keep VBios pixel rate div setting util next mode set
      drm/amd/display: Revert "dc: Keep VBios pixel rate div setting util next mode set"

Wenjing Liu (10):
      drm/amd/display: take ODM slice count into account when deciding DSC slice
      drm/amd/display: use even ODM slice width for two pixels per container
      drm/amd/display: reset DSC clock in post unlock update
      drm/amd/display: Add resource interfaces for get ODM slice rect
      drm/amd/display: Add left edge pixel for YCbCr422/420 + ODM pipe split
      drm/amd/display: Allow higher DSC slice support for small timings on dcn401
      drm/amd/display: Move DSC functions from dc.c to dc_dsc.c
      drm/amd/display: Add missing enable and disable symclk_se functions for dcn401
      drm/amd/display: fix a typo which causes an incorrect ODM combine setup
      drm/amd/display: turn on symclk for dio virtual stream in dpms sequence

Xi Liu (1):
      drm/amd/display: add support for force ODM override

Xiaogang Chen (1):
      drm/kfd: Correct pinned buffer handling at kfd restore and validate process

Yang Wang (13):
      drm/amdgpu: remove unused MCA driver codes
      drm/amdgpu: add amdgpu MCA bank dispatch function support
      drm/amdgpu: add MCA smu cache support
      drm/amdgpu: avoid dump mca bank log muti times during ras ISR
      drm/amdgpu: ignoring unsupported ras blocks when MCA bank dispatches
      drm/amdgpu: fix RAS unload driver issue in SRIOV
      drm/amdgpu: add debug flag to enable RAS ACA
      drm/amdgpu: fix compiler 'side-effect' check issue for RAS_EVENT_LOG()
      drm/amdgpu: change aca bank error lock type to spinlock
      drm/amdgpu: change bank cache lock type to spinlock
      drm/amdgpu: fix ACA no query result after gpu reset
      drm/amdgpu: skip to create ras xxx_err_count node when ACA is enabled
      drm/amdgpu: fix typo in amdgpu_ras_aca_sysfs_read() function

YiPeng Chai (3):
      rm/amdgpu: Remove unused code
      drm/amdgpu: Remove redundant function call
      drm/amdgpu: change log level

Yifan Zhang (2):
      drm/amdgpu: init SAW registers for mmhub v3.3
      drm/amdgpu: disable lane0 L1TLB and enable lane1 L1TLB

Yunxiang Li (4):
      drm/amdgpu: Fix two reset triggered in a row
      drm/amdgpu: Add reset_context flag for host FLR
      drm/amdgpu: Fix amdgpu_device_reset_sriov retry logic
      drm/amdgpu: Move ras resume into SRIOV function

Zhigang Luo (2):
      drm/amdgpu: avoid reading vf2pf info size from FB
      drm/amdgpu: update vf to pf message retry from 2 to 5

shaoyunl (5):
      drm/amdgpu: Enable MES to handle doorbell ring on unmapped queue
      drm/amdgpu: Enable unmapped doorbell handling basic mode on mes 12
      drm/amdgpu: Enable event log on MES 12
      drm/amdgpu: Disable unmapped doorbell handling  basic mode on mes 12
      drm/amdgpu: enable unmapped doorbell handling  basic mode on mes 12

yi-lchen (1):
      drm/amd/display: Keep VBios pixel rate div setting until next mode set

 Documentation/gpu/amdgpu/thermal.rst               |      6 +
 drivers/gpu/drm/amd/acp/include/acp_gfx_if.h       |      2 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |      1 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |     18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |     13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |     35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.h            |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_afmt.c           |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |     13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |     10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c |    377 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |     69 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |      2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |    278 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c            |      3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |      7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c   |     21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    131 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    172 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h      |      5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |     37 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |      3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |     28 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c         |     16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.h         |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c     |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |     71 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |      7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |     84 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |     11 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c            |     12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |     13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |    375 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |     36 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |      8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |      1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |     58 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |      4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |     17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c         |      2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    230 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |     24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |     12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |      3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |     36 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |     14 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |      5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |     74 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |     25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |      4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c  |      4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |     61 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |     37 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |     10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |    119 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.h       |     18 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |      5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |     16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |      2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |     53 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |     38 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |     12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c        |      5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |     13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |     12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |      7 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |      8 +-
 drivers/gpu/drm/amd/amdgpu/clearstate_gfx12.h      |    121 +
 drivers/gpu/drm/amd/amdgpu/df_v1_7.c               |      2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    536 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    382 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   5005 +
 .../drm/amd/amdgpu/{mes_v10_1.h => gfx_v12_0.h}    |      8 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |     40 -
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    248 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |     26 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_0.c          |    501 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_0.h          |     29 +
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |      4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |     17 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |     17 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   1023 +
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.h             |     30 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    126 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |      6 +-
 drivers/gpu/drm/amd/amdgpu/imu_v12_0.c             |    401 +
 drivers/gpu/drm/amd/amdgpu/imu_v12_0.h             |     30 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |      2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |      3 -
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |     38 +-
 .../drm/amd/amdgpu/{mes_v10_1.c => mes_v12_0.c}    |    966 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.h             |     29 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_3.c            |     53 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c          |    654 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.h          |     28 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |      3 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |      5 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c              |      3 +-
 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c           |     29 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |     19 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |     19 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c             |     22 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c             |     14 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |     15 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |     18 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |     22 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c             |     16 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |     24 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |      7 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |     12 +-
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c             |      2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |      2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |      9 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |   1643 +
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.h             |     30 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |     20 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |      4 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |    599 +
 drivers/gpu/drm/amd/amdgpu/soc24.h                 |     30 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |     75 +-
 drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c         |     11 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |     36 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |      9 +-
 drivers/gpu/drm/amd/amdkfd/Makefile                |      2 +
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |   1589 +-
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |    478 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |     12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |      9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.h              |      2 -
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |     19 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h             |      4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |     67 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |      6 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |      2 +
 .../drm/amd/amdkfd/kfd_device_queue_manager_v12.c  |     81 +
 .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c   |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |      2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |      2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c   |    453 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |     14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |      3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |      4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |      8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |     11 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |      8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |     16 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h        |      5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |     36 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |      2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |     77 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |      5 +-
 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c        |      6 +-
 drivers/gpu/drm/amd/display/Kconfig                |      2 +
 drivers/gpu/drm/amd/display/Makefile               |      3 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    639 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |     20 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |     59 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |    169 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |     30 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |     31 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |     25 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |      3 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |     28 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.h  |      1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |     12 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.h   |      2 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |     11 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |      4 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    117 +-
 .../amd/display/dc/bios/command_table_helper2.c    |      1 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |     10 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |     15 +
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |      3 +-
 .../dc/clk_mgr/dcn30/dcn30_smu11_driver_if.h       |      2 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |      8 +
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |     15 +-
 .../dc/clk_mgr/dcn32/dcn32_smu13_driver_if.h       |      2 +-
 .../gpu/drm/amd/display/dc/clk_mgr/dcn401/dalsmc.h |     53 +
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |   1556 +
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.h |    113 +
 .../dc/clk_mgr/dcn401/dcn401_clk_mgr_smu_msg.c     |    313 +
 .../dc/clk_mgr/dcn401/dcn401_clk_mgr_smu_msg.h     |     29 +
 .../dc/clk_mgr/dcn401/dcn401_smu14_driver_if.h     |     66 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |    218 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |     43 +
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |      9 +-
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |      3 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    238 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |     24 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |    380 +-
 drivers/gpu/drm/amd/display/dc/core/dc_vm_helper.c |      1 +
 drivers/gpu/drm/amd/display/dc/dc.h                |     71 +-
 drivers/gpu/drm/amd/display/dc/dc_bios_types.h     |      1 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |    220 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |     29 +-
 drivers/gpu/drm/amd/display/dc/dc_helper.c         |      8 +-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |     47 +-
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |    190 +
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.h  |     22 +
 drivers/gpu/drm/amd/display/dc/dc_state_priv.h     |      4 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |     36 +-
 drivers/gpu/drm/amd/display/dc/dc_stream_priv.h    |     38 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |     80 +-
 drivers/gpu/drm/amd/display/dc/dccg/Makefile       |    103 +
 .../amd/display/dc/{ => dccg}/dcn20/dcn20_dccg.c   |      0
 .../amd/display/dc/{ => dccg}/dcn20/dcn20_dccg.h   |     27 +
 .../amd/display/dc/{ => dccg}/dcn201/dcn201_dccg.c |      0
 .../amd/display/dc/{ => dccg}/dcn201/dcn201_dccg.h |      0
 .../amd/display/dc/{ => dccg}/dcn21/dcn21_dccg.c   |      0
 .../amd/display/dc/{ => dccg}/dcn21/dcn21_dccg.h   |      0
 .../amd/display/dc/{ => dccg}/dcn30/dcn30_dccg.c   |      0
 .../amd/display/dc/{ => dccg}/dcn30/dcn30_dccg.h   |      0
 .../amd/display/dc/{ => dccg}/dcn301/dcn301_dccg.c |      0
 .../amd/display/dc/{ => dccg}/dcn301/dcn301_dccg.h |      0
 .../amd/display/dc/{ => dccg}/dcn302/dcn302_dccg.h |      0
 .../amd/display/dc/{ => dccg}/dcn303/dcn303_dccg.h |      0
 .../amd/display/dc/{ => dccg}/dcn31/dcn31_dccg.c   |      0
 .../amd/display/dc/{ => dccg}/dcn31/dcn31_dccg.h   |      2 +-
 .../amd/display/dc/{ => dccg}/dcn314/dcn314_dccg.c |     12 +-
 .../amd/display/dc/{ => dccg}/dcn314/dcn314_dccg.h |      0
 .../amd/display/dc/{ => dccg}/dcn32/dcn32_dccg.c   |     13 +-
 .../amd/display/dc/{ => dccg}/dcn32/dcn32_dccg.h   |      0
 .../amd/display/dc/{ => dccg}/dcn35/dcn35_dccg.c   |     70 +-
 .../amd/display/dc/{ => dccg}/dcn35/dcn35_dccg.h   |      0
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   |    995 +
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.h   |    217 +
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.h       |     64 +
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |      3 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |    117 +
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.h  |      8 +
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    |     12 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.h    |      4 +
 drivers/gpu/drm/amd/display/dc/dce/dce_opp.c       |      1 -
 .../drm/amd/display/dc/dce/dce_stream_encoder.c    |      1 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c  |     18 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.h  |      2 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |      1 -
 .../display/dc/dce110/dce110_timing_generator.c    |     18 +
 .../display/dc/dce110/dce110_timing_generator.h    |      2 +
 .../display/dc/dce110/dce110_timing_generator_v.c  |      3 +-
 .../display/dc/dce120/dce120_timing_generator.c    |      1 +
 .../amd/display/dc/dce80/dce80_timing_generator.c  |      1 +
 drivers/gpu/drm/amd/display/dc/dcn10/Makefile      |      4 +-
 .../display/dc/dcn10/dcn10_hw_sequencer_debug.c    |      4 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |      7 +
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |      8 +-
 .../drm/amd/display/dc/dcn20/dcn20_link_encoder.h  |      1 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_opp.c   |     25 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_opp.h   |      4 +-
 drivers/gpu/drm/amd/display/dc/dcn201/Makefile     |      9 +-
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_opp.c |      1 +
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_opp.h |      3 +-
 drivers/gpu/drm/amd/display/dc/dcn21/Makefile      |      6 +-
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |      5 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |      2 +-
 drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |      3 +-
 drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |      3 +-
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |     14 +
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.h    |      3 +
 drivers/gpu/drm/amd/display/dc/dcn314/Makefile     |      2 +-
 drivers/gpu/drm/amd/display/dc/dcn32/Makefile      |      3 +-
 .../amd/display/dc/dcn32/dcn32_dio_link_encoder.c  |      3 -
 .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |     40 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |      3 +
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |     15 +-
 drivers/gpu/drm/amd/display/dc/dcn35/Makefile      |      3 +-
 .../display/dc/dcn35/dcn35_dio_stream_encoder.c    |     39 +-
 drivers/gpu/drm/amd/display/dc/dcn401/Makefile     |     11 +
 .../display/dc/dcn401/dcn401_dio_link_encoder.c    |    322 +
 .../display/dc/dcn401/dcn401_dio_link_encoder.h    |    134 +
 .../display/dc/dcn401/dcn401_dio_stream_encoder.c  |    855 +
 .../display/dc/dcn401/dcn401_dio_stream_encoder.h  |    217 +
 drivers/gpu/drm/amd/display/dc/dcn401/dcn401_mpc.c |    653 +
 drivers/gpu/drm/amd/display/dc/dcn401/dcn401_mpc.h |    239 +
 drivers/gpu/drm/amd/display/dc/dm_pp_smu.h         |      3 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |      4 +
 .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |      7 +-
 .../gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.h   |      2 +-
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |      8 +-
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c |      4 +-
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.h |      7 +-
 .../gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.c |     10 +
 .../gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c |     10 +
 .../gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   |     22 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |      3 -
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |     45 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |      2 +-
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |     10 +
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |      4 +-
 .../gpu/drm/amd/display/dc/dml/dcn401/dcn401_fpu.c |    239 +
 .../gpu/drm/amd/display/dc/dml/dcn401/dcn401_fpu.h |     14 +
 .../drm/amd/display/dc/dml/display_mode_structs.h  |      1 +
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.c  |      7 +-
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       |     80 +
 .../drm/amd/display/dc/dml2/display_mode_core.c    |      4 +-
 .../drm/amd/display/dc/dml2/display_mode_core.h    |      2 +
 .../display/dc/dml2/display_mode_core_structs.h    |      1 +
 .../dc/dml2/dml21/dml21_translation_helper.c       |   1168 +
 .../dc/dml2/dml21/dml21_translation_helper.h       |     29 +
 .../drm/amd/display/dc/dml2/dml21/dml21_utils.c    |    534 +
 .../drm/amd/display/dc/dml2/dml21/dml21_utils.h    |     50 +
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |    431 +
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.h  |     68 +
 .../dc/dml2/dml21/inc/bounding_boxes/dcn3_soc_bb.h |    401 +
 .../dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h |    365 +
 .../dc/dml2/dml21/inc/dml2_external_lib_deps.h     |     10 +
 .../drm/amd/display/dc/dml2/dml21/inc/dml_top.h    |     47 +
 .../dc/dml2/dml21/inc/dml_top_dchub_registers.h    |    185 +
 .../dc/dml2/dml21/inc/dml_top_display_cfg_types.h  |    507 +
 .../dc/dml2/dml21/inc/dml_top_policy_types.h       |     14 +
 .../dml2/dml21/inc/dml_top_soc_parameter_types.h   |    196 +
 .../amd/display/dc/dml2/dml21/inc/dml_top_types.h  |    720 +
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c   |    720 +
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.h   |     16 +
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |  12768 ++
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.h     |     39 +
 .../dml2/dml21/src/dml2_core/dml2_core_factory.c   |     38 +
 .../dml2/dml21/src/dml2_core/dml2_core_factory.h   |     14 +
 .../dc/dml2/dml21/src/dml2_core/dml2_core_shared.c |  12391 ++
 .../dc/dml2/dml21/src/dml2_core/dml2_core_shared.h |     38 +
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |   2049 +
 .../dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c   |    714 +
 .../dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.h   |     17 +
 .../dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c   |     51 +
 .../dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.h   |     14 +
 .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.c     |    195 +
 .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.h     |     14 +
 .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c  |     40 +
 .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.h  |     14 +
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c     |    707 +
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.h     |     23 +
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c     |   1250 +
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.h     |     25 +
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |   2095 +
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h  |     27 +
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c  |     86 +
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.h  |     14 +
 .../src/dml2_standalone_libraries/lib_float_math.c |    150 +
 .../src/dml2_standalone_libraries/lib_float_math.h |     26 +
 .../dml21/src/dml2_top/dml2_top_optimization.c     |    309 +
 .../dml21/src/dml2_top/dml2_top_optimization.h     |     34 +
 .../display/dc/dml2/dml21/src/dml2_top/dml_top.c   |    330 +
 .../dc/dml2/dml21/src/dml2_top/dml_top_mcache.c    |    550 +
 .../dc/dml2/dml21/src/dml2_top/dml_top_mcache.h    |     24 +
 .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.c |     32 +
 .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.h |     18 +
 .../dml21/src/inc/dml2_internal_shared_types.h     |    986 +
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |     90 +-
 .../drm/amd/display/dc/dml2/dml2_internal_types.h  |     20 +
 .../amd/display/dc/dml2/dml2_translation_helper.c  |    184 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |     48 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |     19 +
 drivers/gpu/drm/amd/display/dc/dpp/Makefile        |      8 +-
 .../drm/amd/display/dc/dpp/dcn10/CMakeLists.txt    |      6 -
 .../drm/amd/display/dc/dpp/dcn10/dcn10_dpp_cm.c    |      3 +-
 .../drm/amd/display/dc/dpp/dcn20/CMakeLists.txt    |      5 -
 .../gpu/drm/amd/display/dc/dpp/dcn20/dcn20_dpp.c   |     56 +
 .../gpu/drm/amd/display/dc/dpp/dcn20/dcn20_dpp.h   |      9 +-
 .../drm/amd/display/dc/dpp/dcn201/CMakeLists.txt   |      4 -
 .../gpu/drm/amd/display/dc/dpp/dcn201/dcn201_dpp.c |     13 +-
 .../drm/amd/display/dc/dpp/dcn30/CMakeLists.txt    |      5 -
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.h   |      4 +-
 .../drm/amd/display/dc/dpp/dcn32/CMakeLists.txt    |      4 -
 .../gpu/drm/amd/display/dc/dpp/dcn32/dcn32_dpp.c   |     73 +
 .../gpu/drm/amd/display/dc/dpp/dcn32/dcn32_dpp.h   |      8 +
 .../drm/amd/display/dc/dpp/dcn35/CMakeLists.txt    |      4 -
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c |    432 +
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.h |    729 +
 .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c  |    311 +
 .../amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c    |   1219 +
 drivers/gpu/drm/amd/display/dc/dsc/Makefile        |      9 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |     31 +-
 .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.c   |     18 +-
 .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.h   |     14 +-
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c |    418 +
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.h |    337 +
 drivers/gpu/drm/amd/display/dc/dsc/dsc.h           |      1 +
 drivers/gpu/drm/amd/display/dc/gpio/Makefile       |     10 +
 .../amd/display/dc/gpio/dcn21/hw_translate_dcn21.c |      2 +-
 .../amd/display/dc/gpio/dcn401/hw_factory_dcn401.c |    252 +
 .../amd/display/dc/gpio/dcn401/hw_factory_dcn401.h |     11 +
 .../display/dc/gpio/dcn401/hw_translate_dcn401.c   |    335 +
 .../display/dc/gpio/dcn401/hw_translate_dcn401.h   |     13 +
 drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c |     17 +-
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |      4 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |      4 +
 drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c     |     19 +-
 drivers/gpu/drm/amd/display/dc/hubbub/Makefile     |    104 +
 .../display/dc/{ => hubbub}/dcn10/dcn10_hubbub.c   |      2 +-
 .../display/dc/{ => hubbub}/dcn10/dcn10_hubbub.h   |     47 +-
 .../display/dc/{ => hubbub}/dcn20/dcn20_hubbub.c   |     27 +-
 .../display/dc/{ => hubbub}/dcn20/dcn20_hubbub.h   |      2 +-
 .../display/dc/{ => hubbub}/dcn201/dcn201_hubbub.c |      0
 .../display/dc/{ => hubbub}/dcn201/dcn201_hubbub.h |      0
 .../display/dc/{ => hubbub}/dcn21/dcn21_hubbub.c   |      0
 .../display/dc/{ => hubbub}/dcn21/dcn21_hubbub.h   |      0
 .../display/dc/{ => hubbub}/dcn30/dcn30_hubbub.c   |      0
 .../display/dc/{ => hubbub}/dcn30/dcn30_hubbub.h   |      0
 .../display/dc/{ => hubbub}/dcn301/dcn301_hubbub.c |      0
 .../display/dc/{ => hubbub}/dcn301/dcn301_hubbub.h |      0
 .../display/dc/{ => hubbub}/dcn31/dcn31_hubbub.c   |      0
 .../display/dc/{ => hubbub}/dcn31/dcn31_hubbub.h   |      0
 .../display/dc/{ => hubbub}/dcn32/dcn32_hubbub.c   |      2 +-
 .../display/dc/{ => hubbub}/dcn32/dcn32_hubbub.h   |      2 +
 .../display/dc/{ => hubbub}/dcn35/dcn35_hubbub.c   |      0
 .../display/dc/{ => hubbub}/dcn35/dcn35_hubbub.h   |      0
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.c   |    929 +
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.h   |    192 +
 drivers/gpu/drm/amd/display/dc/hubp/Makefile       |     97 +
 .../amd/display/dc/{ => hubp}/dcn10/dcn10_hubp.c   |      0
 .../amd/display/dc/{ => hubp}/dcn10/dcn10_hubp.h   |      0
 .../amd/display/dc/{ => hubp}/dcn20/dcn20_hubp.c   |      0
 .../amd/display/dc/{ => hubp}/dcn20/dcn20_hubp.h   |     35 +-
 .../amd/display/dc/{ => hubp}/dcn201/dcn201_hubp.c |      0
 .../amd/display/dc/{ => hubp}/dcn201/dcn201_hubp.h |      0
 .../amd/display/dc/{ => hubp}/dcn21/dcn21_hubp.c   |      0
 .../amd/display/dc/{ => hubp}/dcn21/dcn21_hubp.h   |      0
 .../amd/display/dc/{ => hubp}/dcn30/dcn30_hubp.c   |      0
 .../amd/display/dc/{ => hubp}/dcn30/dcn30_hubp.h   |      0
 .../amd/display/dc/{ => hubp}/dcn31/dcn31_hubp.c   |      0
 .../amd/display/dc/{ => hubp}/dcn31/dcn31_hubp.h   |      0
 .../amd/display/dc/{ => hubp}/dcn32/dcn32_hubp.c   |      0
 .../amd/display/dc/{ => hubp}/dcn32/dcn32_hubp.h   |      0
 .../amd/display/dc/{ => hubp}/dcn35/dcn35_hubp.c   |      0
 .../amd/display/dc/{ => hubp}/dcn35/dcn35_hubp.h   |      0
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |   1027 +
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h   |    331 +
 drivers/gpu/drm/amd/display/dc/hwss/Makefile       |      9 +-
 .../gpu/drm/amd/display/dc/hwss/dce/dce_hwseq.h    |     24 +
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |     29 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |     13 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |    169 +-
 .../drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c  |      5 +-
 .../gpu/drm/amd/display/dc/hwss/dcn21/dcn21_init.c |      1 +
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |      5 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.h    |      2 +-
 .../gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c |      1 +
 .../drm/amd/display/dc/hwss/dcn301/dcn301_init.c   |      4 +-
 .../gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c |      1 +
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |     32 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.h  |      2 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_init.c   |      3 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |    112 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.h    |      6 +-
 .../gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c |      4 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |     72 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |      2 +
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |      5 +-
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |     12 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   1703 +
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |     81 +
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |    150 +
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.h   |     12 +
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |     26 +
 .../drm/amd/display/dc/hwss/hw_sequencer_private.h |      9 +-
 drivers/gpu/drm/amd/display/dc/inc/clock_source.h  |      1 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |     27 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |      6 +-
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |     55 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |      8 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |     24 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |      4 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |     56 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h  |      9 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |    726 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/opp.h        |      7 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/optc.h       |      4 +-
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |      3 +-
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |      3 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/transform.h  |     28 +-
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |     18 +-
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |      9 +
 .../amd/display/dc/irq/dcn401/irq_service_dcn401.c |    409 +
 .../amd/display/dc/irq/dcn401/irq_service_dcn401.h |     13 +
 drivers/gpu/drm/amd/display/dc/irq_types.h         |      8 +
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |     12 +-
 .../hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c    |      5 +
 .../gpu/drm/amd/display/dc/link/link_detection.c   |      2 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |     66 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |     69 +-
 .../drm/amd/display/dc/link/protocols/link_ddc.c   |      4 -
 .../display/dc/link/protocols/link_dp_capability.c |     30 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |     10 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |     51 +-
 .../amd/display/dc/link/protocols/link_dp_phy.c    |     55 +-
 .../display/dc/link/protocols/link_dp_training.c   |      9 +-
 .../dc/link/protocols/link_dp_training_dpia.c      |     16 -
 .../drm/amd/display/dc/link/protocols/link_dpcd.c  |      1 +
 .../dc/link/protocols/link_edp_panel_control.c     |      3 +
 drivers/gpu/drm/amd/display/dc/optc/Makefile       |      6 +
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c |     50 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h |     10 +-
 .../gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c |     16 +-
 .../gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.h |      3 +-
 .../drm/amd/display/dc/optc/dcn201/dcn201_optc.c   |      7 +-
 .../drm/amd/display/dc/optc/dcn201/dcn201_optc.h   |      3 -
 .../gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c |      9 +-
 .../gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.h |      2 +-
 .../drm/amd/display/dc/optc/dcn301/dcn301_optc.c   |      1 +
 .../gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c |      9 +-
 .../drm/amd/display/dc/optc/dcn314/dcn314_optc.c   |     10 +-
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |     10 +-
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |     11 +-
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.c   |    477 +
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.h   |    167 +
 drivers/gpu/drm/amd/display/dc/os_types.h          |      2 -
 drivers/gpu/drm/amd/display/dc/resource/Makefile   |      8 +
 .../amd/display/dc/resource/dce80/CMakeLists.txt   |      4 -
 .../amd/display/dc/resource/dce80/dce80_resource.c |      1 +
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |     13 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |     12 +-
 .../display/dc/resource/dcn301/dcn301_resource.c   |     20 +-
 .../display/dc/resource/dcn303/dcn303_resource.c   |     11 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |      1 +
 .../display/dc/resource/dcn314/dcn314_resource.c   |      4 +-
 .../display/dc/resource/dcn315/dcn315_resource.c   |     12 +
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |     21 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |     16 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |      1 +
 .../display/dc/resource/dcn351/dcn351_resource.c   |      5 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |   2145 +
 .../display/dc/resource/dcn401/dcn401_resource.h   |    644 +
 drivers/gpu/drm/amd/display/dc/spl/Makefile        |     33 +
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c        |   1458 +
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.h        |     24 +
 .../drm/amd/display/dc/spl/dc_spl_isharp_filters.c |    350 +
 .../drm/amd/display/dc/spl/dc_spl_isharp_filters.h |     17 +
 .../drm/amd/display/dc/spl/dc_spl_scl_filters.c    |   1425 +
 .../drm/amd/display/dc/spl/dc_spl_scl_filters.h    |     59 +
 drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h  |    489 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |     45 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    483 +-
 drivers/gpu/drm/amd/display/dmub/src/Makefile      |      1 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |      5 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c |    603 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.h |    287 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_reg.h    |      1 -
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |     89 +
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     14 +
 drivers/gpu/drm/amd/display/include/dal_types.h    |      1 +
 .../gpu/drm/amd/display/include/grph_object_id.h   |      4 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c    |     28 +-
 .../drm/amd/display/modules/power/power_helpers.c  |      8 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |      2 +
 .../amd/include/asic_reg/dcn/dcn_3_0_0_offset.h    |    108 +
 .../amd/include/asic_reg/dcn/dcn_3_0_0_sh_mask.h   |     56 +
 .../amd/include/asic_reg/dcn/dcn_3_0_2_offset.h    |     90 +
 .../amd/include/asic_reg/dcn/dcn_3_0_2_sh_mask.h   |     44 +
 .../amd/include/asic_reg/dcn/dcn_3_0_3_offset.h    |     16 +
 .../amd/include/asic_reg/dcn/dcn_3_0_3_sh_mask.h   |     16 +
 .../amd/include/asic_reg/dcn/dcn_3_2_0_sh_mask.h   |     28 +
 .../amd/include/asic_reg/dcn/dcn_4_1_0_offset.h    |  16618 ++
 .../amd/include/asic_reg/dcn/dcn_4_1_0_sh_mask.h   | 145742 ++++++++++++++++++
 .../drm/amd/include/asic_reg/gc/gc_11_0_0_offset.h |     10 +
 .../drm/amd/include/asic_reg/gc/gc_12_0_0_offset.h |  11061 ++
 .../amd/include/asic_reg/gc/gc_12_0_0_sh_mask.h    |  40550 +++++
 .../include/asic_reg/mmhub/mmhub_4_1_0_offset.h    |   1341 +
 .../include/asic_reg/mmhub/mmhub_4_1_0_sh_mask.h   |   6943 +
 .../amd/include/asic_reg/thm/thm_14_0_2_offset.h   |    228 +
 .../amd/include/asic_reg/thm/thm_14_0_2_sh_mask.h  |    940 +
 drivers/gpu/drm/amd/include/atomfirmware.h         |     45 +-
 drivers/gpu/drm/amd/include/discovery.h            |     28 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |     17 +
 drivers/gpu/drm/amd/include/mes_api_def.h          |    570 -
 drivers/gpu/drm/amd/include/mes_v12_api_def.h      |    798 +
 drivers/gpu/drm/amd/include/pptable.h              |     91 +-
 drivers/gpu/drm/amd/include/soc21_enum.h           |      2 +-
 drivers/gpu/drm/amd/include/soc24_enum.h           |  21073 +++
 drivers/gpu/drm/amd/include/v12_structs.h          |   1189 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |     33 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    211 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |     10 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_pm.h             |      1 -
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c     |      9 -
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |     12 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |     10 +-
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c    |     21 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c    |      5 +-
 .../amd/pm/powerplay/hwmgr/process_pptables_v1_0.c |      2 -
 .../drm/amd/pm/powerplay/hwmgr/processpptables.c   |      2 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |     37 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |     80 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c    |     29 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |    115 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |     20 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |     31 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/smu10_smumgr.c |      5 +-
 .../drm/amd/pm/powerplay/smumgr/vega10_smumgr.c    |      6 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    137 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |     41 +-
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0.h   |     21 +-
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h |      1 -
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |      3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |      3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |      4 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |     18 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |     69 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |     35 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |      8 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |     14 +
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |     61 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |     63 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |     64 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |      9 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |     46 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   |     30 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |    217 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |      8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |     30 +-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |     71 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |    198 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |     61 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |      2 +
 drivers/gpu/drm/radeon/atombios_encoders.c         |      2 +-
 drivers/gpu/drm/radeon/pptable.h                   |      2 +-
 drivers/gpu/drm/radeon/radeon_connectors.c         |     10 +
 include/uapi/drm/amdgpu_drm.h                      |     16 +-
 include/uapi/drm/drm_fourcc.h                      |     19 +
 include/uapi/linux/kfd_ioctl.h                     |      5 +-
 include/uapi/linux/kfd_sysfs.h                     |     19 +-
 621 files changed, 334778 insertions(+), 4808 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/clearstate_gfx12.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
 rename drivers/gpu/drm/amd/amdgpu/{mes_v10_1.h => gfx_v12_0.h} (87%)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/imu_v12_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/imu_v12_0.h
 rename drivers/gpu/drm/amd/amdgpu/{mes_v10_1.c => mes_v12_0.c} (50%)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v12_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/soc24.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/soc24.h
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v12.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dalsmc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr_smu_msg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr_smu_msg.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_smu14_driver_if.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_spl_translate.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dccg/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ => dccg}/dcn20/dcn20_dccg.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dccg}/dcn20/dcn20_dccg.h (94%)
 rename drivers/gpu/drm/amd/display/dc/{ => dccg}/dcn201/dcn201_dccg.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dccg}/dcn201/dcn201_dccg.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dccg}/dcn21/dcn21_dccg.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dccg}/dcn21/dcn21_dccg.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dccg}/dcn30/dcn30_dccg.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dccg}/dcn30/dcn30_dccg.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dccg}/dcn301/dcn301_dccg.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dccg}/dcn301/dcn301_dccg.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dccg}/dcn302/dcn302_dccg.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dccg}/dcn303/dcn303_dccg.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dccg}/dcn31/dcn31_dccg.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dccg}/dcn31/dcn31_dccg.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => dccg}/dcn314/dcn314_dccg.c (98%)
 rename drivers/gpu/drm/amd/display/dc/{ => dccg}/dcn314/dcn314_dccg.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dccg}/dcn32/dcn32_dccg.c (97%)
 rename drivers/gpu/drm/amd/display/dc/{ => dccg}/dcn32/dcn32_dccg.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dccg}/dcn35/dcn35_dccg.c (92%)
 rename drivers/gpu/drm/amd/display/dc/{ => dccg}/dcn35/dcn35_dccg.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dccg/dcn401/dcn401_dccg.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn401/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn401/dcn401_dio_link_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn401/dcn401_dio_link_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn401/dcn401_dio_stream_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn401/dcn401_dio_stream_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn401/dcn401_mpc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn401/dcn401_mpc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn401/dcn401_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn401/dcn401_fpu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn3_soc_bb.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml2_external_lib_deps.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_dchub_registers.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_policy_types.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_internal_shared_types.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn10/CMakeLists.txt
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn20/CMakeLists.txt
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn201/CMakeLists.txt
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn30/CMakeLists.txt
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn32/CMakeLists.txt
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn35/CMakeLists.txt
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/gpio/dcn401/hw_factory_dcn401.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/gpio/dcn401/hw_factory_dcn401.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/gpio/dcn401/hw_translate_dcn401.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/gpio/dcn401/hw_translate_dcn401.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/hubbub/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ => hubbub}/dcn10/dcn10_hubbub.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubbub}/dcn10/dcn10_hubbub.h (89%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubbub}/dcn20/dcn20_hubbub.c (97%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubbub}/dcn20/dcn20_hubbub.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubbub}/dcn201/dcn201_hubbub.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubbub}/dcn201/dcn201_hubbub.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubbub}/dcn21/dcn21_hubbub.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubbub}/dcn21/dcn21_hubbub.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubbub}/dcn30/dcn30_hubbub.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubbub}/dcn30/dcn30_hubbub.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubbub}/dcn301/dcn301_hubbub.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubbub}/dcn301/dcn301_hubbub.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubbub}/dcn31/dcn31_hubbub.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubbub}/dcn31/dcn31_hubbub.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubbub}/dcn32/dcn32_hubbub.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubbub}/dcn32/dcn32_hubbub.h (98%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubbub}/dcn35/dcn35_hubbub.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubbub}/dcn35/dcn35_hubbub.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/hubp/Makefile
 rename drivers/gpu/drm/amd/display/dc/{ => hubp}/dcn10/dcn10_hubp.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubp}/dcn10/dcn10_hubp.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubp}/dcn20/dcn20_hubp.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubp}/dcn20/dcn20_hubp.h (92%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubp}/dcn201/dcn201_hubp.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubp}/dcn201/dcn201_hubp.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubp}/dcn21/dcn21_hubp.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubp}/dcn21/dcn21_hubp.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubp}/dcn30/dcn30_hubp.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubp}/dcn30/dcn30_hubp.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubp}/dcn31/dcn31_hubp.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubp}/dcn31/dcn31_hubp.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubp}/dcn32/dcn32_hubp.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubp}/dcn32/dcn32_hubp.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubp}/dcn35/dcn35_hubp.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => hubp}/dcn35/dcn35_hubp.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_init.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/resource/dce80/CMakeLists.txt
 create mode 100644 drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_isharp_filters.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_4_1_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_4_1_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_12_0_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/gc/gc_12_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_4_1_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/mmhub/mmhub_4_1_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/thm/thm_14_0_2_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/thm/thm_14_0_2_sh_mask.h
 delete mode 100644 drivers/gpu/drm/amd/include/mes_api_def.h
 create mode 100644 drivers/gpu/drm/amd/include/mes_v12_api_def.h
 create mode 100644 drivers/gpu/drm/amd/include/soc24_enum.h
 create mode 100644 drivers/gpu/drm/amd/include/v12_structs.h
