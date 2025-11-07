Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05650C407EA
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 16:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6337310E0D2;
	Fri,  7 Nov 2025 15:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="izPKtuvZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010029.outbound.protection.outlook.com [52.101.61.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4670410E0D2;
 Fri,  7 Nov 2025 15:00:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQKPFWJnUDXn7CQqwAYKoS2CHxF4rjd2RKgJydvEzZL7CoIZlWSp1n3IE+xPVLQl8v13DBpVQjJoT7JZ8UqkBDR99WyyW1kgT5YG9czj8v36o5OlAKp68APjQrFTMEsXN/oUpQX0PJM0c09xDYGltEbe3QIYaQNWTw5Vo7PTiQO7FRKDwrhnRFhA5ePmSoCH9teiDHQwWxde5ccBQqU1tVWSAYjWJLseCzoTDmeQEkAVrlpFtTOg+yL24lfhB/4+d+P9fv6UCO9bbrqXBdKea8g1sJ1wpfb871HqcyKV6KKB2/lYCASpuOHjjTr/1ddqq/SGYmUR84awyCdv49kCuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/+0kflFQbCsCgS4euyjj71tI0MoWuPnubIpNU87lO0=;
 b=zW0l1MB7N9uRksq/m5EtH2QtxJvgzhmUX7aguT3q+f2tlVLOQFTt5dSRD0YGHjk9U9bQPqbgbSOAmW1EmTLFzyRmZYJa06TniPNos0x5/i6B0BgDQORXFgM1msXRZKztk51pJS73mT37W9HcuyyYYP11CDtu7TEOJcDCUFWF4dAwIzhBEVlLoXYb/7KyhA9IEBh1ZYI5k0vnCUfAadYeJN3ZRSqRecpOVQA/EadtpsIK825E1BsJnIYTEAsfXlIy7/L5axMtnKMN76IhtEUbveyI6C8VdV0wHRlTt1n0+5swlOLqUiAbd0/oDKvUGVs5Q9S9KLthEmT4Sgr442NduQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/+0kflFQbCsCgS4euyjj71tI0MoWuPnubIpNU87lO0=;
 b=izPKtuvZo1u/XjBVPOIpSWfm8lTRf2gj9mC+e7eyuqFVn+6NPHR6Fw7JiLdO1M1SsFxgtPFvJB5ptChZDfN2A51MxX+6Wx9yc0Hh9siO7FJ40L0Y5+2q+CfgiNjqenbPkUqfGOf2f8hW3xvx3NbX6+YGPY68B5EAiA484gislxI=
Received: from CH5P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::29)
 by SJ5PPF4D350AC80.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::993) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Fri, 7 Nov
 2025 15:00:02 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::c3) by CH5P220CA0006.outlook.office365.com
 (2603:10b6:610:1ef::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.13 via Frontend Transport; Fri,
 7 Nov 2025 14:59:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 15:00:01 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 7 Nov
 2025 07:00:00 -0800
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.19
Date: Fri, 7 Nov 2025 09:59:37 -0500
Message-ID: <20251107145938.26669-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|SJ5PPF4D350AC80:EE_
X-MS-Office365-Filtering-Correlation-Id: bc9b6772-79c1-44ec-2065-08de1e0e5378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjczQ2tvazhzVWV5VnhjZzBBNG9Md1ZQNGFtb2l3V1M5WmNiOTVTbWtHZ1pn?=
 =?utf-8?B?V2ZsN2NJRW1BSDlKUzEwV2lZU2MxWUVUdW04cS8rY0VmR3ZhbUo3bkdVQ2ZZ?=
 =?utf-8?B?cVZOeXhONTlhZjlTY3NObVY1SU1VQmJ4bWJnSUFrenBtWDhBZVR0ckkySUVI?=
 =?utf-8?B?NGt0dUxDaU1iSUlNaE9SMVA2dElacGFESitSQThtT3UwVkZKNFAvK2Zhb3c5?=
 =?utf-8?B?MjNJemg5VWVNTTBic09SUDZ6bzRhV042TUlKUTNuODBTT2JRcXpBNnNBRWxL?=
 =?utf-8?B?K0swWDNQVXZCTEJFT1l2RWJCMDdkNEZMeHpOR0lHVWlYUlg2MTdqNEY0MlM5?=
 =?utf-8?B?ckpJUWVad1RISDBFWTNHMkFIUUc1R3JncXhZNGduNVlVWG5QNWUwUG9RRk5s?=
 =?utf-8?B?OER2VElDTXg4WE5Qc3E2dlhjdGFEd2wzM3NMQkp5TzJySXJkbDY4T2s0dy9v?=
 =?utf-8?B?NWZld05xQ2daalR4THdOQUVkZXY4dUtJNjVaKzFKbVRabEdKdlVadmFRSDJx?=
 =?utf-8?B?cnBUMmk2OTFBZyt1Ui9GbDl5QXpYcmREWTdTaGtuTTZKYXNiRU1zWE9oMU5U?=
 =?utf-8?B?c012Uy9Renl3SUVZc1pvTU8zRk94OWZ4NytNUDdObmFmN1NOY1hIdS9ydTlP?=
 =?utf-8?B?MmV2USs2c1dBR3pIck9OM29jZ3hZb040dDFhdjhyTnRrZXhtcVNObFk1ZEo4?=
 =?utf-8?B?NmEyNWJmMDBqU2pzV1FSeHJCZ1J0bmVaZDRDUWVCMThBdjAvdG5ESCsyRDBS?=
 =?utf-8?B?cGNYZnlwSHBnTjlFUWNKeEZMMzBjQml6YmlhNDJLWThheEcveXBOQTBlWFJp?=
 =?utf-8?B?eE5aM0UyT05XWnd4YXRuc1pBQ3U2a1htbEMrR3VzMU83eWRZZUoyTjlacVZ0?=
 =?utf-8?B?RmdUT0ZuaHJWWnlXdTFhVHJwTm1wMkVkdTJ6SWZWSVZVOHpZRXpDWTcrTldr?=
 =?utf-8?B?VnNVN1Rvb3h2K0pwVTdnUmlvS2kyZDRjUTczbWl0VFBpTkJDSENkcG80cnRP?=
 =?utf-8?B?eURkdmN0cHh4cFNkQ240T2l4dmR3YzQ2UlJieEcxVlQvN1BYQWNMa1FUUWtZ?=
 =?utf-8?B?QnppSE5OdmJmaGtXL3YrekNnUjBrSSs5YzR0bjVzcWlibEdTSmZCOTFwbHNG?=
 =?utf-8?B?TzVDNTVCdk5MVTh3ejNGM2FKelJXWG5nUHNVak1iZHBPVlFFVnZrTlZhaDJC?=
 =?utf-8?B?bURRRWJacmZoRFBnR3hYR2orZTdZMlp5bUZYNEhZQldnakdqOEJCQ2N5TEUz?=
 =?utf-8?B?Z3lqdS8wUjBjQ05PTVhzZjBucnhpMUxQdm0vczc0VXJmUkZtVlYrcjJ4MFc4?=
 =?utf-8?B?MmxFNVp6VG1tYzU0Qit4cVN0RWtDTnZXdGVqd3pXMkZvRisyQk9oVCtwK3VT?=
 =?utf-8?B?a0hqb3VOMXV0STlVMXZtS1ZNOWJsZmJTR2RueEZuU25BaUx4MVIxdXlsZXFr?=
 =?utf-8?B?Y25RSk5jWGZlMk9oTGhtVWUxaFBjdndkTFhFSU91czRvOVBzbzJVOW4xM3E0?=
 =?utf-8?B?NlJCV29mS2xhLytRUy9XOVFjNWFOUXdzMHAvRVU1eWJsdUduMWYzRDFPTG0r?=
 =?utf-8?B?QmsrdWppSzBzaE0vV2lOaldLNzRjWUgyOHY0N21lUFdkRW5nVmdsNE1tVkZZ?=
 =?utf-8?B?L1pxdnpZNHVCaEQ4MlNiRkkzUmQ5bXIzL0loSFZWNzNoNDZ6cVNEdkl6S1VP?=
 =?utf-8?B?aGFKbHVMaEc3RXdFVE12WFUxSlovV2NHeGRCRTEyR1FzWGhjc2F3QkE2Z2w2?=
 =?utf-8?B?d2d5WmhTdlNRdENZY29Tcmk5R3lyTjZmVmdQS0V6ZG5Zd2VPWGx0Q3JRN2dZ?=
 =?utf-8?B?NkdjYUlHM0pUbzBEN2FwUWMvSEdPSmdVcHZHWWNNSUg3MUFqbTVHMERwOW91?=
 =?utf-8?B?M1A2U2xFb2dtcFFOVVJQbm4zZFNqOXArbFN5NEgwbWlRbUpSZzVKQ1FvNEJN?=
 =?utf-8?B?L1FrSW5uS0UrakdPaEVFWlpNZk9XTVd6UmpqaFd6THp6bHp4L1hwUkZ0OVBE?=
 =?utf-8?Q?D3juCgfzUx/frE8vZ0hlzjaERMxi4E=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 15:00:01.1397 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9b6772-79c1-44ec-2065-08de1e0e5378
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4D350AC80
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

More new stuff for 6.19.  Mario is working on the cleanup and documentation
for the ABM KMS property from last week.  That should be ready in the next week
or so.

The following changes since commit f67d54e96bc9e4e20a927868f02c2e9d1aa09751:

  Merge tag 'amd-drm-next-6.19-2025-10-29' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-10-31 22:08:24 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.19-2025-11-07

for you to fetch changes up to 2e640e8e7b9e9fc0f42c1e15ea0e02d00916ad57:

  drm/amd/pm: Update default power1_cap (2025-11-06 10:02:19 -0500)

----------------------------------------------------------------
amd-drm-next-6.19-2025-11-07:

amdgpu:
- Misc fixes
- HMM cleanup
- HDP flush rework
- RAS updates
- SMU 13.x updates
- SI DPM cleanup
- Suspend rework
- UQ reset support
- Replay/PSR fixes
- HDCP updates
- DC PMO fixes
- DC pstate fixes
- DCN4 fixes
- GPUVM fixes
- SMU 13 parition metrics
- Fix possible fence leak in job cleanup
- Hibernation fix
- MST fix

amdkfd:
- HMM cleanup
- Process cleanup fix

----------------------------------------------------------------
Ahmad Rehman (1):
      drm/amdkfd: Do not wait for queue op response during reset

Alex Deucher (5):
      drm/amdgpu: set default gfx reset masks for gfx6-8
      drm/amdgpu: move reset debug disable handling
      drm/amdgpu: Drop PMFW RLC notifier from amdgpu_device_suspend()
      drm/amdgpu/smu: Handle S0ix for vangogh
      drm/amdgpu: fix possible fence leaks from job structure

Alex Hung (1):
      drm/amd/display: Fix black screen with HDMI outputs

Alvin Lee (1):
      drm/amd/display: Increase IB mem size

Andrew Mazour (1):
      drm/amd/display: Extend inbox0 lock to run Replay/PSR

Asad Kamal (3):
      drm/amdgpu: Update invalidate and flush hdp function
      drm/amdgpu: Remove invalidate and flush hdp macros
      drm/amd/pm: Update default power1_cap

Austin Zheng (5):
      drm/amd/display: Add pte_buffer_mode and force_one_row_for_frame in dchub reg
      drm/amd/display: Remove old PMO options
      drm/amd/display: Update P-state naming for clarity.
      drm/amd/display: Refactor VActive implementation
      drm/amd/display: Add Pstate viewport reduction

Christian König (1):
      drm/amdgpu: grab a BO reference in vm_lock_done_list.

David (Ming Qiang) Wu (1):
      drm/amdgpu/userq: need to unref bo

Dillon Varone (1):
      drm/amd/display: Revert DCN4 max buffered cursor size to 64

Gangliang Xie (10):
      drm/amd/pm: add new message definitions for pmfw eeprom interface
      drm/amd/pm: implement ras_smu_drv interface for smu v13.0.12
      drm/amd/pm: add smu ras driver framework
      drm/amdgpu: add function to check if pmfw eeprom is supported
      drm/amdgpu: add wrapper functions for pmfw eeprom interface
      drm/amdgpu: adapt reset function for pmfw eeprom
      drm/amdgpu: add initialization function for pmfw eeprom
      drm/amdgpu: add check function for pmfw eeprom
      drm/amd/pm: check pmfw eeprom feature bit
      drm/amdgpu: initialize max record count after table reset

Harry Wentland (1):
      drm/amd/display: Fix null pointer on analog detection

Jesse.Zhang (1):
      drm/amdgpu: Implement user queue reset functionality

Jiapeng Chong (3):
      drm/amd/display: remove unneeded semicolon
      drm/amd/display: remove unneeded semicolon
      drm/amd/display: remove unneeded semicolon

Joshua Aberback (1):
      drm/amd/display: Persist stream refcount through restore

Lijo Lazar (7):
      drm/amd/pm: Add helper functions for gpu metrics
      drm/amd/pm: Use gpu metrics 1.9 for SMUv13.0.6
      drm/amd/pm: Use gpu metrics 1.9 for SMUv13.0.12
      drm/amd/pm: Add schema v1.1 for parition metrics
      drm/amd/pm: Update SMUv13.0.6 partition metrics
      drm/amd/pm: Update SMUv13.0.12 partition metrics
      drm/amdgpu: Fix wait after reset sequence in S3

Lukas Bulwahn (1):
      MAINTAINERS: adjust file entry in AMD DISPLAY CORE - DML

Mario Limonciello (1):
      drm/amd: Fix suspend failure with secure display TA

Mario Limonciello (AMD) (4):
      drm/amd: Add an unwind for failures in amdgpu_device_ip_suspend_phase1()
      drm/amd: Add an unwind for failures in amdgpu_device_ip_suspend_phase2()
      drm/amd: Unwind for failed device suspend
      drm/amd/display: Don't stretch non-native images by default in eDP

Philip Yang (2):
      drm/amdkfd: Don't clear PT after process killed
      Revert "drm/amdkfd: Improve signal event slow path"

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: lock bo before calling amdgpu_vm_bo_update_shared

Rong Zhang (1):
      drm/amd/display: Fix NULL deref in debugfs odm_combine_segments

Samuel Zhang (1):
      drm/amdgpu: fix gpu page fault after hibernation on PF passthrough

Sunday Clement (1):
      drm/amdkfd: Fix Unchecked Return Values

Sunil Khatri (3):
      drm/amdkfd: clean up the code to free hmm_range
      drm/amdgpu: caller should make sure not to double free
      drm/amdgpu: validate the bo from done list for NULL

Taimur Hassan (2):
      drm/amd/display: [FW Promotion] Release 0.1.34.0
      drm/amd/display: Promote DC to 3.2.357

Tao Zhou (4):
      drm/amdgpu: make MCA IPID parse global
      drm/amdgpu: add ras_eeprom_read_idx interface
      drm/amdgpu: support to load RAS bad pages from PMFW
      drm/amdgpu: skip writing eeprom when PMFW manages RAS data

Timur Kristóf (1):
      drm/amd/pm/si: Delete unused structs and fields

Wayne Lin (1):
      drm/amd/display: Enable mst when it's detected but yet to be initialized

Wenjing Liu (1):
      drm/amd/display: fw locality check refactors

Xiang Liu (5):
      drm/amd/ras: Add CPER ring read for uniras
      drm/amd/ras: Update IPID value for bad page threshold CPER
      drm/amd/ras: Correct info field of bad page threshold exceed CPER
      drm/amd/ras: Use correct severity for BP threshold exceed event
      drm/amd/ras: Fix format truncation

Yang Wang (2):
      drm/amd/pm: fix the issue of size calculation error for smu 13.0.6
      drm/amd/pm: fix missing device_attr cleanup in amdgpu_pm_sysfs_init()

YiPeng Chai (9):
      drm/amd/ras: Fix the error of undefined reference to `__udivdi3'
      drm/amdgpu: Fix error injection parameter error
      drm/amd/ras: Increase ras switch control range
      drm/amdgpu: Add ras ip block name
      drm/amd/ras: Add ras support for nbio v7_9_1
      drm/amd/ras: Add ras support for umc v12_5_0
      drm/amdgpu: suspend ras module before gpu reset
      drm/amd/ras: ras supports i2c eeprom for mp1 v13_0_12
      drm/amd/ras: Fix the issue of incorrect function call

 MAINTAINERS                                        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 139 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c            |  16 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h            |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |  19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  48 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |  35 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     | 368 ++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |  30 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  62 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          | 216 +++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  10 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |   5 +
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   5 +
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   5 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  10 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |  26 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |   8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |   8 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |  14 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  12 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |  11 -
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  10 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  16 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |  18 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   4 +
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |   5 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |  52 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.h  |   2 +
 .../dc/dml2_0/dml21/inc/dml_top_dchub_registers.h  |   2 +
 .../dml2_0/dml21/inc/dml_top_display_cfg_types.h   |  14 +-
 .../dml2_0/dml21/inc/dml_top_soc_parameter_types.h |   6 +-
 .../display/dc/dml2_0/dml21/inc/dml_top_types.h    |  10 +-
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |  39 +-
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |  34 +-
 .../dml2_0/dml21/src/dml2_core/dml2_core_utils.c   |   2 +
 .../dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c       |  20 +-
 .../dml21/src/inc/dml2_internal_shared_types.h     |  42 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |   1 +
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |   5 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |   2 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    | 439 ++++++++++++++--
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   2 +-
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h    |   1 +
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |  68 +--
 .../amd/display/modules/hdcp/hdcp2_transition.c    |  61 +--
 .../gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c    |   2 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_log.c    |   2 +
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |  10 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   6 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  25 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   4 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |   3 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |  10 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.h         | 557 ---------------------
 .../gpu/drm/amd/pm/powerplay/smumgr/smu10_smumgr.c |   4 +-
 .../drm/amd/pm/powerplay/smumgr/vega10_smumgr.c    |   4 +-
 .../drm/amd/pm/powerplay/smumgr/vega12_smumgr.c    |   4 +-
 .../drm/amd/pm/powerplay/smumgr/vega20_smumgr.c    |   8 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  17 +
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   7 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_pmfw.h   |   2 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_ppsmc.h  |  16 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |  12 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   3 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  | 239 ++++++---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 214 ++++----
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   | 161 +++++-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |  67 +++
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |   1 +
 .../drm/amd/ras/ras_mgr/amdgpu_ras_eeprom_i2c.c    |   1 +
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c   |  57 ++-
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h   |   5 +
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.c   |  64 +++
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_process.h   |   4 +
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_sys.c   |   6 +
 drivers/gpu/drm/amd/ras/rascore/ras.h              |   2 +
 drivers/gpu/drm/amd/ras/rascore/ras_cper.c         |  19 +-
 drivers/gpu/drm/amd/ras/rascore/ras_log_ring.c     |   9 +-
 drivers/gpu/drm/amd/ras/rascore/ras_nbio.c         |   1 +
 drivers/gpu/drm/amd/ras/rascore/ras_process.c      |   7 +
 drivers/gpu/drm/amd/ras/rascore/ras_umc.c          |   1 +
 106 files changed, 2438 insertions(+), 1134 deletions(-)
