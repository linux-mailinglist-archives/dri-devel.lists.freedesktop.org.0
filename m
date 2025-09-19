Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3942B8B171
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 21:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31E710EA8B;
	Fri, 19 Sep 2025 19:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Po7gYQxF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011042.outbound.protection.outlook.com [52.101.52.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B74210EA8A;
 Fri, 19 Sep 2025 19:34:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuYk1VIdi5hdovTP5Y46QQFaEfw/ljQyAkG6UtZrQTDKDS/EJfT79rwWBpKWuH8tKdc3wLvPOgkeqdoPBJT4pj2q3k71phrJpCRLC+COXR4acshU3m8lfyYTWClDApgaUnTxYylKA9uoBrxU0yN0RUucorA4n31sk9pCg8i2Tb9h0T/Zhr05p/ZN1G7wdq1OCB8GF3L2nMNyHcDvXjjMY5XcBfLdHJ6mKY5uU5UZMwM/hcepvfKBys+ACh7LBjjl9yg1/FxeB8eBnGlldQgl5yjVjUirrb+Te0MS9KmiD12BZLtCjzqb5dx+4qczApvm6gdBteT3QooutuTSd1Db9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+TEqlY5uKqoC7PcceBu/LNANKlNyc40aRLHwH6rNb0=;
 b=WKSKhHkofMn0duvtO9wim1qrfxk7LjGwpecEgFgQDr0G8OTDxoH8iHeQsgPQc+qGeHG6ErrRUahgz2ThfmIDLNYzmcAjv87g9LY5mSaRBtbXq2pMjM4EtMwgXHvVI5dm6UrtAYEpPquVey4rHgfVbWjCKPz5md1ce8kOPxUnLptqG14PmAF0k21biWZhBAE1bGFk00Nblag4T8wXrtes74dYYcMFFBI3eUXDo+unDPgEXkMGy2Auk3UvVYrZPUojGP7Y7dHQtr35RpBip/ffqZvU2eIJeGKjN40kHxVSCBNFXmYHJD9fRSsaDS6Tmt3sUqaJGFD22eHOrwC0dyjJuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+TEqlY5uKqoC7PcceBu/LNANKlNyc40aRLHwH6rNb0=;
 b=Po7gYQxFvhTEyJ2qZvpof8FUL2jZ8h0B5SvpJKLAeAD05RCL8waYVITQoMwsoVul/66ZmkMpjTXgKC2LJLS9AqRFjxLRTglpcmgz66KHqZrboelpfUEjLSq9x/km/DXmSA1HNbCJhoXmWN+FKOEQb5JzuY9BvQLsT40EhmUSU/k=
Received: from SA1PR04CA0020.namprd04.prod.outlook.com (2603:10b6:806:2ce::29)
 by DM4PR12MB6541.namprd12.prod.outlook.com (2603:10b6:8:88::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 19:34:10 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:806:2ce:cafe::c4) by SA1PR04CA0020.outlook.office365.com
 (2603:10b6:806:2ce::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.17 via Frontend Transport; Fri,
 19 Sep 2025 19:34:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Fri, 19 Sep 2025 19:34:09 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Sep
 2025 12:34:08 -0700
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.18
Date: Fri, 19 Sep 2025 15:33:53 -0400
Message-ID: <20250919193354.2989255-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|DM4PR12MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee4c78a-2458-47ad-1d6f-08ddf7b38166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjNsUUpWaFZQbXdPd0hydnJ4Smd4RnN5bjQrUUtnZHRoRXROVW5vVG1kYmdH?=
 =?utf-8?B?ajZJVjNGT2k3Y2NSQTNYUFpxQ1FId3ViZ0g0eUNQVnBld1BHWllJZlJiNDAw?=
 =?utf-8?B?WXhuYWgzTGJtakdCZmtpV3hDTFJXYlBNQkhLeFo1VUlTWktIcEwyYWVSZG4r?=
 =?utf-8?B?RWtNdzVkTzRUV0lZN3VFTVVvaUQ0MjdCNG1kU3RDYUtFNjZ0UFVqdWxLV0Mx?=
 =?utf-8?B?anYwVEpLU0JVWGlHVWhsejdLdUpZeHJhWmVzZ1B2OTdNaGxVMUJkblVCN2w2?=
 =?utf-8?B?MDh6TUhEZ1hvUlJ6cWtPanlrMk5JSGhIUEFqV3BnMklLVW5KcHFDRzJvb2V0?=
 =?utf-8?B?WUMyOVNLUzNrMFFrSnd4cVNqWCtYRDIvS3c2TU1qQS9tV05QcHpiZkp4a3dP?=
 =?utf-8?B?SjAyT0xVeVZqQnZjUzJ0TmhPVlFueWEzMFBEbFFNNDBucTRsZ3Zwc2diT0Yv?=
 =?utf-8?B?aEtRejJiWk8vT1ZWR21DNlUwUk1WamUyR0w0cDI3ZVBZSWpML2JIcFVFeUVJ?=
 =?utf-8?B?MEI0UDhXa3AwbmNvUWhZSW1NRDJ2S1hKVFhqMy9vZmd0bC9XMGtLR1FmM2l6?=
 =?utf-8?B?VnFCR1Z3aHcwSm96ZHR4anhPYlNJTHJIZmNqQkZKTHNtbktmWkhYNk9zaVVj?=
 =?utf-8?B?MzV4RFJxSnBrbW93aStJVUZzd1AvdW9HMjM3eDliT3FJK1VBekwwbTN2ZU5J?=
 =?utf-8?B?YzJ3cERuOVZwSm1yN1d4bkxhTEVMSmNqQWpaNnQ4R2hpeGJjckt2QjZKbWxB?=
 =?utf-8?B?SloyM3NFQUtEMmxsL2Yyb252UjV6SkF0SnFzdzJLK2d6YWYxdFhYeGoxaVFm?=
 =?utf-8?B?NFBLTFlzUFJhR1BGSTRTaVd4V2NSZ0QrUGpjMHg3RGFpd1Jqa2tVNHREOEhQ?=
 =?utf-8?B?cHVSb2lDNjR1N0hQU0p0UFZvSUx5QVBvd2krTHNneVV6Rlo5a2l1cEM0YkY1?=
 =?utf-8?B?ZnBFMjk0R1ZBcVF0U0ZQNWlRUmZnSmZyNGNTY3FJL2FpcWQ4MEx1WnV5MUZk?=
 =?utf-8?B?VzZSUGMreU9wVEkySVVTSUk5QVhvd0JzbHgrc204UEUvU0ZKY1pydUNxVUxE?=
 =?utf-8?B?UG5OTXdNd2FVeFNUQ2c0U2ZmcVFtdmVTQzRjU21yMms1UENQL0Rhc3NkRGFm?=
 =?utf-8?B?YXo4am0rTTFnd0syVWdadlhiM2Q3bjRVSk9iQlBzSFBZQUNmVm8yU1FjVHhZ?=
 =?utf-8?B?eUZsZ3kxV2tWM1IzKzRKcE05K1BwanZLNkRoN1V2UWpzZmxycmM1WEhDekNy?=
 =?utf-8?B?K3ZQdW1qc0NQR3JDTjdLYUpzaTRIbVlYWW5ja3ZWRFM2MnBKL2plVjZXOFht?=
 =?utf-8?B?c3o3SXFFRHdPWURDalZCTE5MQXV1UDhrR3Z3VndrQk1nbGQ0bnI3dmsySGhq?=
 =?utf-8?B?dHl6S3lvZ2pIUzZvWmNSNzBadlZ6dXY0aHZpYm5XK3E3ZFprZmIxT1pubTJl?=
 =?utf-8?B?dEtyWjNpdjUrZzFpaDRGMFkxN1VpMWNCY25zZWxGbTJOeVpnOXRCanR4UXAx?=
 =?utf-8?B?dWFzQUVDU2xLVWgySEdlM1p2Zi94aGtzZG16WUR6Nld6SlVzb1VCb241YXhw?=
 =?utf-8?B?NFJ4bUp6TjdHNkROeis5WXhEWHVaRWtmOGZ6eVdHeUJpU01BdEsvL3lyNG1N?=
 =?utf-8?B?YkhCUlovZnlHdjJVZnd0aHlleTlUUWt0TkR4R3FVZkYzOVlWaXlLZFh3cm5V?=
 =?utf-8?B?eXByV0g1M04zWEdLQXhrbTFqN1lhK2VOa0ZHSVBCUlI2V3hiWnB1VGp2ZnFJ?=
 =?utf-8?B?MVltdVNZL2Y3UXBEbnQ0elF0N2NDeWtqZjhxMldnemxxcXFJbEh3WDlNczY4?=
 =?utf-8?B?RzVYY0RYa2NwTHdyTnE1SWNyRmVpanhuMGRrMHRvQUV5VFJSdUJFVE9kcUNl?=
 =?utf-8?B?WTZ1dU1kV09VK3czTDU1ZUJpRjVCU3VpWkVCY1lsVnFsTmJkUEYrbDZnWEtx?=
 =?utf-8?B?ckZNWXNEOW9OU2ZHMFR1dUJLbTdyWnQxR3RmUWRkdFFaUXlQRi9FSVN4aHNi?=
 =?utf-8?B?M05iUW1jNmlRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 19:34:09.8032 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee4c78a-2458-47ad-1d6f-08ddf7b38166
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6541
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

Updates for 6.18.

The following changes since commit 2fd653b9bb5aacec5d4c421ab290905898fe85a2:

  drm/amd/display: Drop dm_prepare_suspend() and dm_complete() (2025-09-05 17:38:42 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.18-2025-09-19

for you to fetch changes up to a490c8d77d500b5981e739be3d59c60cfe382536:

  drm/amd/display: Only restore backlight after amdgpu_dm_init or dm_resume (2025-09-18 16:59:34 -0400)

----------------------------------------------------------------
amd-drm-next-6.18-2025-09-19:

amdgpu:
- Fence drv clean up fix
- DPC fixes
- Misc display fixes
- Support the MMIO remap page as a ttm pool
- JPEG parser updates
- UserQ updates
- VCN ctx handling fixes
- Documentation updates
- Misc cleanups
- SMU 13.0.x updates
- SI DPM updates
- GC 11.x cleaner shader updates
- DMCUB updates
- DML fixes
- Improve fallback handling for pixel encoding
- VCN reset improvements
- DCE6 DC updates
- DSC fixes
- Use devm for i2c buses
- GPUVM locking updates
- GPUVM documentation improvements
- Drop non-DC DCE11 code
- S0ix fixes
- Backlight fix
- SR-IOV fixes

amdkfd:
- SVM updates

----------------------------------------------------------------
Alex Deucher (6):
      drm/amdgpu: fix a memory leak in fence cleanup when unloading
      drm/amd/display: use udelay rather than fsleep
      drm/amdgpu: remove non-DC DCE 11 code
      drm/amdkfd: add proper handling for S0ix
      drm/amdgpu/userq: Optimize S0ix handling
      drm/amdgpu: suspend KFD and KGD user queues for S0ix

Asad Kamal (7):
      drm/amd/pm: Allow to set power cap in vf mode
      drm/amd/pm: Rename amdgpu_hwmon_get_sensor_generic
      drm/amd/pm: Update pmfw headers for smu_v13_0_12
      drm/amd/pm: Allow system metrics table in 1vf mode
      drm/amd/pm: Add sysfs node for node power
      drm/amd/pm: Fetch npm data from system metrics table
      drm/amd/pm: Enable npm metrics data

Ausef Yousof (1):
      drm/amd/display: fix dml ms order of operations

Charlene Liu (1):
      drm/amd/display: limit one non-related log to dGPU

Christian König (7):
      drm/amdgpu: add AMDGPU_IDS_FLAGS_GANG_SUBMIT
      drm/amdgpu: revert "Implement new dummy vram manager"
      drm/amdgpu: reject gang submissions under SRIOV
      drm/amdgpu: fix userq VM validation v4
      drm/amdgpu: remove check for BO reservation add assert instead
      drm/amdgpu: re-order and document VM code
      drm/amdgpu: revert to old status lock handling v3

David Rosca (2):
      drm/amdgpu/vcn4: Fix IB parsing with multiple engine info packages
      drm/amdgpu/vcn: Allow limiting ctx to instance 0 for AV1 at any time

Dmytro Laktyushkin (1):
      drm/amd/display: prepare dml 2.1 for new asic

Guangshuo Li (1):
      drm/amdgpu/atom: Check kcalloc() for WS buffer in amdgpu_atom_execute_table_locked()

Hawking Zhang (1):
      Revert "drm/amdgpu: Allocate psp fw private buffer in vram"

Ivan Lipski (1):
      drm/amd/display: Allow RX6xxx & RX7700 to invoke amdgpu_irq_get/put

James Flowers (1):
      drm/amd/display: Use kmalloc_array() instead of kmalloc()

James Zhu (2):
      Revert "drm/amdkfd: return migration pages from copy function"
      drm/amdkfd: add function svm_migrate_successful_pages

Jesse.Zhang (2):
      drm/amdgpu: adjust MES API used for suspend and resume
      drm/amdgpu: Switch user queues to use preempt/restore for eviction

Joe.Wang (1):
      drm/amdgpu: Fix PRT flag for gfx12

John Olender (1):
      drm/amdgpu: Fix NULL ptr deref in amdgpu_device_cache_switch_state()

Lijo Lazar (4):
      drm/amdgpu: Release hive reference properly
      drm/amdgpu: Read memory vendor information
      drm/amdgpu: Add generic capability class
      drm/amdgpu: Add virtual device capabilities

Mario Limonciello (5):
      Documentation/amdgpu: Add Ryzen AI 330 series processor
      drm/amd: Duplicate DC_FEATURE_MASK and DC_DEBUG_MASK enum values into kdoc
      drm/amd/display: Set up pixel encoding for YCBCR422
      drm/amd/display: Add fallback path for YCBCR422
      drm/amd: Only restore cached manual clock settings in restore if OD enabled

Mario Limonciello (AMD) (2):
      drm/amd: Avoid evicting resources at S5
      drm/amd: Drop unnecessary calls to smu_dpm_set_vpe_enable()

Martin Leung (1):
      Revert "drm/amd/display: Reduce Stack Usage by moving 'audio_output' into 'stream_res' v4"

Matthew Schwartz (1):
      drm/amd/display: Only restore backlight after amdgpu_dm_init or dm_resume

Nicholas Kazlauskas (1):
      drm/amd/display: Fix DMCUB loading sequence for DCN3.2

Pratap Nirujogi (1):
      drm/amd/amdgpu: Declare isp firmware binary file

Prike Liang (4):
      drm/amdgpu: validate userq input args
      drm/amdgpu: clean up the amdgpu_userq_active()
      drm/amdgpu: validate userq hw unmap status for destroying userq
      drm/amdgpu: validate userq buffer virtual address and size

Ray Wu (1):
      drm/amd/display: Remove duplicated code

Relja Vojvodic (1):
      drm/amd/display: Add DSC padding for OVT Support

Rodrigo Siqueira (17):
      drm/amdgpu/vcn: Document IRQ per-instance irq behavior for VCN 4.0.3
      drm/amdgpu/vcn: Change amdgpu_vcn_sw_fini return to void
      drm/amdgpu: Remove volatile from CSB functions
      drm/amdgpu: Remove volatile from RLC files
      drm/amdgpu: Remove volatile from ring manipulation
      drm/amdgpu: Remove volatile from amdgpu and amdgpu_ih headers
      drm/amdgpu: Remove volatile references from VCN
      drm/amd/display: Use devm_i2c_add_adapter to simplify i2c cleanup logic
      drm/amdgpu/amdgpu_i2c: Use devm_i2c_add_adapter instead of i2c_add_adapter
      drm/amdgpu: Use devm_i2c_add_adapter() in SMU V11
      drm/amd/pm: Use devm_i2c_add_adapter() in the i2c init
      drm/amd/pm: Use devm_i2c_add_adapter() in the Arcturus smu
      drm/amd/pm: Use devm_i2c_add_adapter() in the Navi10 smu
      drm/amd/pm: Use devm_i2c_add_adapter() in the Sienna smu
      drm/amd/pm: Use devm_i2c_add_adapter() in the V13 smu
      drm/amd/pm: Use devm_i2c_add_adapter() in the V13_0_6 smu
      drm/amd/pm: Use devm_i2c_add_adapter() in the V14_0_2 smu

Sathishkumar S (1):
      drm/amdgpu/jpeg: Move parse_cs to amdgpu_jpeg.c

Shaoyun Liu (1):
      drm/amd/amdgpu: Fix the mes version that support inv_tlbs

Srinivasan Shanmugam (8):
      drm/ttm: Bump TTM_NUM_MEM_TYPES to 9 (Prep for AMDGPU_PL_MMIO_REMAP)
      drm/amdgpu/uapi: Introduce AMDGPU_GEM_DOMAIN_MMIO_REMAP
      drm/amdgpu/ttm: Add New AMDGPU_PL_MMIO_REMAP Placement
      drm/amdgpu: Wire up MMIO_REMAP placement and User-visible strings
      drm/amdgpu: Implement TTM handling for MMIO_REMAP placement
      drm/amdgpu/ttm: Initialize AMDGPU_PL_MMIO_REMAP Heap
      drm/amdgpu/ttm: Allocate/Free 4K MMIO_REMAP Singleton
      drm/amdgpu/gfx11: Add Cleaner Shader Support for GFX11.0.1/11.0.4 GPUs

Stanley.Yang (1):
      drm/amdgpu: wait pmfw polling mca bank info done

Sunil Khatri (1):
      drm/amdgpu: add missing comment for the new argument

Taimur Hassan (1):
      drm/amd/display: Promote DC to 3.2.350

Thorsten Blum (2):
      drm/amdkfd: Replace kzalloc + copy_from_user with memdup_user
      drm/amdgpu: Replace kzalloc + copy_from_user with memdup_user

Timur Kristóf (9):
      drm/amd/display: Add pixel_clock to amd_pp_display_configuration
      drm/amd/pm: Use pm_display_cfg in legacy DPM (v2)
      drm/amd/pm: Remove unneeded legacy DPM related code.
      drm/amdgpu: Fix allocating extra dwords for rings (v2)
      drm/amd/display: Fix DVI-D/HDMI adapters
      drm/amd/display: Keep PLL0 running on DCE 6.0 and 6.4
      drm/amd/display: Disable fastboot on DCE 6 too
      drm/amd/display: Disable VRR on DCE 6
      drm/amd/display: Don't use non-registered VUPDATE on DCE 6

Tvrtko Ursulin (4):
      drm/amdgpu: Use vmemdup_array_user in amdgpu_bo_create_list_entry_array
      drm/amdgpu: Use memdup_array_user in amdgpu_cs_wait_fences_ioctl
      drm/amdgpu: Use (v)memdup_array_user in amdgpu_cs_pass1
      drm/amdgpu: Use memset32 for ring clearing

Wesley Chalmers (1):
      drm/amd/display: Rename header file link.h to link_service.h

Xi Ruoyao (1):
      drm/amd/display/dml2: Guard dml21_map_dc_state_into_dml_display_cfg with DC_FP_START

Xiang Liu (2):
      drm/amdgpu: Introduce VF critical region check for RAS poison injection
      drm/amdgpu: Check VF critical region before RAS poison injection

Yang Wang (5):
      drm/amd/pm: make smu_set_temp_funcs() smu specific for smu v13.0.6
      drm/amd/pm: unified smu feature cap interface
      drm/amd/pm: unified smu feature cap for link reset
      drm/amd/pm: unified smu feature cap for sdma reset
      drm/amd/pm: unified smu feature cap for vcn reset

Zhikai Zhai (1):
      drm/amd/display: Modify the link training policy

 Documentation/gpu/amdgpu/apu-asic-info-table.csv   |    1 +
 Documentation/gpu/amdgpu/driver-core.rst           |    2 +-
 drivers/gpu/drm/amd/amdgpu/Makefile                |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c        |   41 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   54 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   37 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c         |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c            |   18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h             |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |   65 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |   10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   13 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c         |   20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   15 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h     |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   30 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  102 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |  353 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_utils.h          |   91 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   55 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |    8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |    8 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  205 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   47 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c          |    4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   61 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |    5 +
 drivers/gpu/drm/amd/amdgpu/atom.c                  |    4 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             | 3817 --------------------
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.h             |   32 -
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   20 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |    7 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |    5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |    3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    8 +
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c            |    2 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |   58 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.h             |    6 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |    2 +-
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c         |   95 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |   14 +
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |    2 +
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c         |    5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |    6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |   14 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |   14 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   28 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   87 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |   25 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |   14 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |   17 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |   21 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |    7 -
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   36 +
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  127 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  144 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    8 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   16 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |    4 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c   |    1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |    2 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    2 +-
 .../amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c |    2 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |    2 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |    2 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |    2 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |    2 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |    2 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |    2 +-
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |    2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |    6 +-
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |    2 +-
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |    3 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   37 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |    2 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    2 +-
 drivers/gpu/drm/amd/display/dc/dc_helper.c         |    5 +
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |    2 +-
 .../display/dc/dio/dcn10/dcn10_stream_encoder.c    |    2 +-
 .../display/dc/dio/dcn20/dcn20_stream_encoder.c    |    2 +-
 .../display/dc/dio/dcn31/dcn31_dio_link_encoder.c  |    2 +-
 .../dc/dio/dcn314/dcn314_dio_stream_encoder.c      |    2 +-
 .../dc/dio/dcn32/dcn32_dio_stream_encoder.c        |    2 +-
 .../dc/dio/dcn35/dcn35_dio_stream_encoder.c        |    2 +-
 .../dc/dio/dcn401/dcn401_dio_stream_encoder.c      |    2 +-
 drivers/gpu/drm/amd/display/dc/dm_services.h       |    2 +
 drivers/gpu/drm/amd/display/dc/dm_services_types.h |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |    3 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |    2 +-
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c |    2 +-
 .../drm/amd/display/dc/dml2/display_mode_core.c    |    2 +-
 .../dc/dml2/dml21/dml21_translation_helper.c       |   41 +-
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |    4 +
 .../amd/display/dc/dml2/dml21/inc/dml_top_types.h  |    6 +-
 .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.c   |    3 +-
 drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c     |    2 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   40 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |    2 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |    4 +-
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |    2 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |    2 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |    2 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |    2 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |    4 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |    2 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   11 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   15 +-
 .../amd/display/dc/inc/{link.h => link_service.h}  |    6 +-
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |    1 +
 .../amd/display/dc/link/accessories/link_dp_cts.c  |   13 +-
 .../amd/display/dc/link/accessories/link_dp_cts.h  |    2 +-
 .../display/dc/link/accessories/link_dp_trace.h    |    2 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.h   |    2 +-
 .../link/hwss/link_hwss_dio_fixed_vs_pe_retimer.h  |    2 +-
 .../amd/display/dc/link/hwss/link_hwss_hpo_dp.h    |    2 +-
 .../hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.h    |    2 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   |    4 +
 .../gpu/drm/amd/display/dc/link/link_detection.h   |    2 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |    2 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.h    |    2 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.h |    2 +-
 .../gpu/drm/amd/display/dc/link/link_resource.h    |    2 +-
 .../gpu/drm/amd/display/dc/link/link_validation.h  |    2 +-
 .../drm/amd/display/dc/link/protocols/link_ddc.h   |    2 +-
 .../display/dc/link/protocols/link_dp_capability.h |    2 +-
 .../amd/display/dc/link/protocols/link_dp_dpia.h   |    2 +-
 .../display/dc/link/protocols/link_dp_dpia_bw.h    |    2 +-
 .../dc/link/protocols/link_dp_irq_handler.h        |    2 +-
 .../amd/display/dc/link/protocols/link_dp_phy.h    |    2 +-
 .../display/dc/link/protocols/link_dp_training.c   |    9 +
 .../display/dc/link/protocols/link_dp_training.h   |    2 +-
 .../drm/amd/display/dc/link/protocols/link_dpcd.h  |    2 +-
 .../dc/link/protocols/link_edp_panel_control.h     |    2 +-
 .../drm/amd/display/dc/link/protocols/link_hpd.h   |    2 +-
 .../display/dc/resource/dce120/dce120_resource.c   |    2 +-
 .../amd/display/dc/resource/dce60/dce60_resource.c |   11 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |    2 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |    2 +-
 .../display/dc/resource/dcn302/dcn302_resource.c   |    3 +-
 .../display/dc/resource/dcn303/dcn303_resource.c   |    2 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |    5 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.h |    3 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |    4 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |    2 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |    5 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |    5 +-
 .../amd/display/dc/resource/dcn36/dcn36_resource.c |    5 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |    5 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |   53 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.h  |    8 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |   98 +-
 drivers/gpu/drm/amd/include/dm_pp_interface.h      |    1 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |    4 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c       |   87 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  234 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    4 -
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm_internal.h   |    6 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |    4 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c     |    8 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |   65 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   11 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   55 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   28 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_12_pmfw.h   |   12 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   19 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   19 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   19 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   15 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   19 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |   49 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   70 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |    6 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |   19 +-
 include/drm/ttm/ttm_resource.h                     |    2 +-
 include/uapi/drm/amdgpu_drm.h                      |   17 +-
 206 files changed, 2133 insertions(+), 5236 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_utils.h
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/dce_v11_0.h
 rename drivers/gpu/drm/amd/display/dc/inc/{link.h => link_service.h} (98%)
