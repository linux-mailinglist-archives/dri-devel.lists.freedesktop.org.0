Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4936AA7A16
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 21:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4783610E1C4;
	Fri,  2 May 2025 19:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="n6RIVZK1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787B410E1B1;
 Fri,  2 May 2025 19:13:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XA7fCKcqJkKOYkCoznTLJvLNjrjyMgxyLDk0YjG9QiSqeyu+rklsBUDnN6vudpT4ABz7mtcJff/cX3G0vBlfl4YzvLzFLURu8M3BrKlRP7lL2e5JDdbpLDjYF0nDLNCXy7dKVSA0aPNHivmLGC5tZTmFw0Myjkha+ljO4p6/2vG3zMDXh2cmAYrTR4hOP2j4Q7kGdFlWhrkqF96B4JaRd/S8258bgZS1EEs5khZMdUh8kN541L1tlPmCWmII0jAGzylfGUY9nfCvaPU/Di/uMJDIa9Kvv3QcZ8k44RKphUxXxT5GoYXIl6R0JTHXjDIkoczyUvOmBB9hLNDszAPADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kh7RjFsfR1u9BuCiF4r92hQyXRTmcRZKcdHV1UAu6W4=;
 b=FsnFz5NjJHsu5EzLkd+9qNq3+HxJDE8Ik7FesmBt7jRhvIJzYd9NUZSNEewl4Z93Oyvj1e5+jxgWkvIsP6wcxtKEn+r66WUXVtEvyZI1n92mm0J9HbZ1bN6MSlN7x53BBcgYKv1TALnWPeGWeRnTo0PVssnusI2DgrtyfURmeVmHwqnY2IbKDz/5P8HMJNhA7CRVqQumVmNrXJnEKpucfIp2brRN6ysAAWWbqOuupoY2unbhCV0JgvFyl8uYGMtYyOqbrByyJJiWPxykIrISanaIyPFha33GgSP1J0prM2DzKc5HQnts9K1xLUmDCMQ5vET/wLfhCbp1NguXZwBAKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kh7RjFsfR1u9BuCiF4r92hQyXRTmcRZKcdHV1UAu6W4=;
 b=n6RIVZK1HfUAuiAybp7azsNo3orgEp0aNlbEJk/XcC1Eh/pvUaQ8OpPYblwgfy8M9WSixK/T9whAswXyw2dkcd4HMTIspsqHO3cUHnjv2tsRZCrcUhiIDuzeJ8twMcKT/O1Skah+ToP8V0ynxWzdTVxGG8nKAPQgU4oV/PC6FaI=
Received: from BN9PR03CA0297.namprd03.prod.outlook.com (2603:10b6:408:f5::32)
 by DS7PR12MB5887.namprd12.prod.outlook.com (2603:10b6:8:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.22; Fri, 2 May 2025 19:13:23 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:408:f5:cafe::d4) by BN9PR03CA0297.outlook.office365.com
 (2603:10b6:408:f5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.42 via Frontend Transport; Fri,
 2 May 2025 19:13:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 19:13:23 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 14:13:22 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.16
Date: Fri, 2 May 2025 15:13:04 -0400
Message-ID: <20250502191304.891852-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|DS7PR12MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: 731b1ce9-c8dc-4b50-d104-08dd89ad688b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWZwKzNGN2JMRFk4REVwV3ZBb1hPMno2MXNIUllIZG5BSGl2OWRVR09IcnJh?=
 =?utf-8?B?K1FQSUxEb3huN0txL1JpQy9ybWh4U0d1aXhNZ0hTQlBiZlRTZlhWMW5UVi9r?=
 =?utf-8?B?d1p4VVdCK0Vaa2dINFNQbnFkbEFxQk5rRnZWRmRiNVVkV2JPRXBBdC9kK0pF?=
 =?utf-8?B?ZUNPTHp4Z0wydndwRFZVUEVGZ2Y1UHN0TFRudElOVzlrMUZwM3J5N3diaWhk?=
 =?utf-8?B?dmpBVllxVnh2VHYyak1ib1dSRElxWFE5elFoK0tySlljUEpOaXdSMlAzTzdZ?=
 =?utf-8?B?UDE0R0RkRTFrcGF1U0hKNEdVTnJRN2s1a2FkZkJPZnZpTUZmUTQ5Y0cwN2V5?=
 =?utf-8?B?Vkk5MnhNbktZamxlM0hQUDJmOWk5c1pFMlhwR2UzRHY4YW9zOVJ1RGt6YVBB?=
 =?utf-8?B?dmRNaVNlWDlrazREdjBJWXdLK3NKVG53OC9qb1kvQXBYSHZPNFBlZndQWHMr?=
 =?utf-8?B?UmszM0Z1cC9KTkQ3Mkp1ejQ3Wno5QW9qQTJGQlZDcXZlcXlHK3FtYXhIMEQ1?=
 =?utf-8?B?QnR2RHRxQjUxUXBzdkdxcEYxd0lOY204ZkJWNkszRWpNQW9UQ2NnYWVHajN1?=
 =?utf-8?B?QWFUWUdUUHg5clloZTBLR0VZOGhIekYwWHR0UTZWc2FuREMrd2pPbFdydVEy?=
 =?utf-8?B?UjYxZUJLS2FJOWlrald3RXMwczlLRzQzbCt4THh1clFpQ0ZwNUp1QlJVcG5o?=
 =?utf-8?B?aXJWVXY1OGx4SHhJQXhJb3VuTHVXNmxFN3cvcGs3UnE3T2RaSi9KWHNzWGRZ?=
 =?utf-8?B?MWlFZHFKdDcvanNjdDgyMGpHTm1VTXB6VWRoRVpDN3ErVnZVWW44NU1mVWln?=
 =?utf-8?B?WlV1OWk3ZjN4MTRwYit4OVdjRHUvMGgzZWVnQWNIYWpjYWhyVHlmaHRSQk5Q?=
 =?utf-8?B?Y05mWEJjeWI4eFM3NThGcGVmN3NYOUpsUnBQRnZ6V3VWdUp0WjZ4UW5VMzZt?=
 =?utf-8?B?aTkvRzk2bkdwR3pTUmRZYU1hdnp4QVJrTHlwb1hqbHovay9qanoxcnV6ajdT?=
 =?utf-8?B?cUlZaVhjMGZUaDNPSkFVK0JxTTZINzRpNDl5RFhoM1VEbDJ0bTltTnNzcnJG?=
 =?utf-8?B?cUFFZ3ZwTk52N2dSbXBFZWRNcjgybGwxY25wUHNBT2k2OE9Wc2xCMmFwd1Ax?=
 =?utf-8?B?NjFJTUVrbDNKZ0gyZ2xDVy9RdFA0K2hkbHo2S0RVdmZSQW9kQ0JjK1Fobnox?=
 =?utf-8?B?bFhIL1o1QlF2R2J5bys4bUpGcFNQditObWpPcWhCNHJJNHFoRGlpMkhhM0N1?=
 =?utf-8?B?aHhxZi9lREZtK1p4dVJXdEpENnltY3N0MDVBODFMckk1d2Y2K3ZoNktNZWpU?=
 =?utf-8?B?UG1JQWFDaDhQbGV0RkMzZHRHVndmMlFkUUo2ZDRhcW02MkpsYnN0NW9TOGdT?=
 =?utf-8?B?VkNpNnpja1NiaFFiOTFKdmg5Qm13bHA4MmpUSExYTHlKSlA2eHZVTG5IcUVD?=
 =?utf-8?B?eWwxemJZZ09hKzdUNTY4WUdkclhaYkN2NFlWVlpuQ2dEdnl3SHpMZnd3YlZi?=
 =?utf-8?B?Y2xBb2hXQWs2V1RlTkUwUU5KRmJBR2lPWnE0a2N1RjR2UmdRSUZxa3BMK2Mr?=
 =?utf-8?B?M0lpY25XL3VmNC8rSUxVai9DK00zSC9rTHhFRVZsWmlpT2Y0TjdveUF2enNM?=
 =?utf-8?B?SWYzT3dwVTBoQVBtZGEySUt6a3BYRHNaU2ZjcThpUWhjT090eWgzRXpEbWx1?=
 =?utf-8?B?YnVoZE1TaHRpUVU1a1FmR3lEb2QxVjl6NDRjZXRtYjgvRm5GaWZ3cmYxbk5k?=
 =?utf-8?B?UXA1cUdJM2toS0dwOFM5dXdOUkhmazg3L0I3anYyS0c1bDBVNXRtQlIzdzBt?=
 =?utf-8?B?WnVPczBiZDdobkxtU0FUTWdYZzNacVR1UjFWODlsM2d6WVY3cGQwVVVZSEhM?=
 =?utf-8?B?QzZYRFZKSHFMOWMzWDRjdFNxTkNGZnFpZ2lBdCs1SllTU0toVHFZL3F1WXJj?=
 =?utf-8?B?eFEvcFlMU2lyUVMwZWJiRXlPT1FWTkh1aVY0OEtNMjNCejFDNGltdFo5ZytK?=
 =?utf-8?B?UmJtZkRSMmpBPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 19:13:23.2397 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 731b1ce9-c8dc-4b50-d104-08dd89ad688b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5887
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

New stuff for 6.16.  Lots of new stuff.  The main one is user queues for gfx
11 and 12.

The following changes since commit dce8bd9137b88735dd0efc4e2693213d98c15913:

  drm/amdgpu/gfx12: fix num_mec (2025-03-26 17:47:18 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.16-2025-05-02

for you to fetch changes up to da072da2c8ca3e886133c5826a3f802f3d816708:

  drm/amd/display: Rename program_timing function for better debugging (2025-04-30 18:18:59 -0400)

----------------------------------------------------------------
amd-drm-next-6.16-2025-05-02:

amdgpu:
- MES fixes
- GTT fixes
- dma-buf fixes
- DC FPU fixes
- eDP fixes
- DSC fixes
- APU watermark fixes
- PCI DPC support for XGMI hives
- Misc SI cleanups
- Misc CIK cleanups
- Add resizable bar debugging parameter
- Misc code cleanups
- Cleaner shader support for GC 10.3.x
- Misc gfx code cleanups
- CSIB fixes and cleanups
- Documentation updates
- SMU 13.0.x updates
- DRM_* to drm_* output conversions
- DML 2.1 updates
- Replay fixes
- DCN 4.x updates
- Reset fixes
- VCN 4.0.5 fixes
- RAS updates
- Brighness curve updates
- DCN 3.5 updates
- devcoredump updates
- Workload profile power management fixes
- Decouple ASPM from pcie dpm logic
- Initial support for user mode queues for GFX, compute, and SDMA
  This is currently hidden behind a module parameter for testing
- Suspend fixes
- VCN 4.0.3 reset support
- Cleaner shader support for GC 11.5.x
- SDMA 4.4.2 soft reset support
- HDP flush cleanups
- Cleaner shader support for GC 9.0
- NBIO 7.9 updates
- Display reset fixes
- ACPI EDID fixes
- SubVP fixes

amdkfd:
- Reset fixes
- Drop support for GC 9.4.3 rev0 early bring up silicon
- SMI events for process start and end
- SDMA fixes
- PASID updates

radeon:
- Misc cleanups

UAPI:
- Initial support for user mode queues for GC 11 and 12 dGPUs (IGT, Mesa, and libdrm support)
  IGT:
  https://patchwork.freedesktop.org/series/148464/
  https://patchwork.freedesktop.org/series/147860/
  https://patchwork.freedesktop.org/series/147450/
  https://patchwork.freedesktop.org/series/146929/
  https://patchwork.freedesktop.org/series/143586/
  libdrm:
  https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/412
  mesa:
  https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29010
  https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32700
  https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33661
  https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34370
  https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34493

----------------------------------------------------------------
Alex Deucher (109):
      drm/amdgpu/mes11: optimize MES pipe FW version fetching
      drm/amdgpu: add rebar parameter
      drm/amdgpu: add initial documentation for debugfs files
      drm/amdgpu: drop some dead code
      drm/amdgpu/gfx: make amdgpu_gfx_me_queue_to_bit() static
      drm/amdgpu/gfx: decouple the number of kgqs from the hw
      drm/amdgpu/gfx: assign the actual me0 queues per pipe
      drm/amdgpu/gfx6: fix CSIB handling
      drm/amdgpu/gfx7: fix CSIB handling
      drm/amdgpu/gfx8: fix CSIB handling
      drm/amdgpu/gfx9: fix CSIB handling
      drm/amdgpu/gfx10: fix CSIB handling
      drm/amdgpu/gfx11: fix CSIB handling
      drm/amdgpu/gfx9: dump full CP packet header FIFOs
      drm/amdgpu/gfx9.4.3: dump full CP packet header FIFOs
      drm/amdgpu/gfx10: dump full CP packet header FIFOs
      drm/amdgpu/gfx11: dump full CP packet header FIFOs
      drm/amdgpu/gfx12: dump full CP packet header FIFOs
      drm/amdgpu/pm: add workload profile pause helper
      drm/amdgpu/pm/swsmu: implement pause workload profile
      drm/amdgpu: cancel gfx idle work in device suspend for s0ix
      drm/amdgpu/mes12: optimize MES pipe FW version fetching
      Documentation: update KIQ documentation
      Documenation: fix typo in debugfs.rst
      drm/amdgpu: UAPI for user queue management
      drm/amdgpu: add some additional members to amdgpu_mqd_prop
      drm/amdgpu/gfx11: update mqd init for UQ
      drm/amdgpu/gfx12: update mqd init for UQ
      drm/amdgpu/sdma6: update mqd init for UQ
      drm/amdgpu/sdma7: update mqd init for UQ
      drm/amdgpu/uq: remove gfx11 specifics from UQ setup
      drm/amdgpu/uq: make MES UQ setup generic
      drm/amdgpu/userq: fix hardcoded uq functions
      drm/amdgpu/userq: handle runtime pm
      drm/amdgpu: return an error in the userq IOCTL when DRM_AMDGPU_NAVI3X_USERQ=n
      drm/amdgpu/Kconfig: fix wording of DRM_AMDGPU_NAVI3X_USERQ
      drm/amdgpu/gfx11: fix config guard
      drm/amdgpu: add userq firmware version checks
      drm/amdgpu/userq: remove BROKEN from config
      drm/amdgpu/userq: move the header to amdgpu directory
      drm/amdgpu: validate user queue parameters
      drm/amdgpu/mes: remove unused functions
      drm/amdgpu: remove is_mes_queue flag
      drm/amdgpu/mes: centralize gfx_hqd mask management
      drm/amdgpu/mes: warn on unexpected pipe numbers
      drm/amdgpu/gfx11: clean up and consolidate sw_init
      drm/amdgpu/gfx12: split userq setup to a separate switch
      drm/amdgpu: add UAPI to query if user queues are supported
      drm/amdgpu: bump version for user queue IP support query
      drm/amdgpu: store userq_managers in a list in adev
      drm/amdgpu/userq: prevent runtime pm when userqs are active
      drm/amdgpu: add parameter to disable kernel queues
      drm/amdgpu: add ring flag for no user submissions
      drm/amdgpu/gfx: add generic handling for disable_kq
      drm/amdgpu/mes: update hqd masks when disable_kq is set
      drm/amdgpu/mes: make more vmids available when disable_kq=1
      drm/amdgpu/gfx11: add support for disable_kq
      drm/amdgpu/gfx12: add support for disable_kq
      drm/amdgpu/sdma: add flag for tracking disable_kq
      drm/amdgpu/sdma6: add support for disable_kq
      drm/amdgpu/sdma7: add support for disable_kq
      drm/amdgpu/mes11: use the device value for enforce isolation
      drm/amdgpu/mes12: use the device value for enforce isolation
      drm/amdgpu: adjust enforce_isolation handling
      drm/amd/display/dml2: use vzalloc rather than kzalloc
      drm/amdgpu/userq/mes: remove unused header
      drm/amdgpu/userq: rename suspend/resume callbacks
      drm/amdgpu/userq: rework front end call sequence
      drm/amdgpu/userq: move some code around
      drm/amdgpu/userq: properly clean up userq fence driver on failure
      drm/amdgpu/userq: add suspend and resume helpers
      drm/amdgpu/userq: handle system suspend and resume
      drm/amdgpu: don't swallow errors in amdgpu_userqueue_resume_all()
      drm/amdgpu/userq: move runpm handling into core userq code
      drm/amdgpu/gfx11: properly reference EOP interrupts for userqs
      drm/amdgpu/gfx12: properly reference EOP interrupts for userqs
      drm/amdgpu/sdma6: properly reference trap interrupts for userqs
      drm/amdgpu/sdma7: properly reference trap interrupts for userqs
      drm/amdgpu/userq: rework driver parameter
      drm/amdgpu/userq: track the xcp_id associated with the queue
      drm/amdgpu/userq: add helpers to start/stop scheduling
      drm/amdgpu: rename enforce isolation variables
      drm/amdgpu/userq: integrate with enforce isolation
      drm/amdgpu: convert userq UAPI _pad to flags
      drm/amdgpu/userq: add UAPI for setting queue priority
      drm/amdgpu/mes11: add conversion for priority levels
      drm/amdgpu/mes12: add conversion for priority levels
      drm/amdgpu/userq: add priorty to user queue structure
      drm/amdgpu/userq/mes: handle user queue priority
      drm/amdgpu/userq: enable support for queue priorities
      drm/amdgpu/userq: add UAPI for setting up secure queues
      drm/amdgpu: add tmz queue parameter to mqd props
      drm/amdgpu/gfx11: add support for TMZ queues to mqd_init
      drm/amdgpu/gfx12: add support for TMZ queues to mqd_init
      drm/amdgpu/userq/mes: pass the secure flag to mqd init
      drm/amdgpu/userq: enable support for secure queues
      drm/amdgpu/userq: add a helper to check which IPs are enabled
      drm/amdgpu/userq: optimize enforce isolation and s/r
      drm/amdgpu: switch from queue_active to queue state
      drm/amdgpu/userq: unmap queues amdgpu_userq_mgr_fini()
      drm/amdgpu/userq: move waiting for last fence before umap
      drm/amdgpu/userq: rename eviction helpers
      drm/amdgpu/userq: use consistent function naming
      drm/amdgpu/userq: take the userq_mgr lock in suspend/resume
      drm/amdgpu/userq: take the userq_mgr lock in enforce isolation
      drm/amdgpu/mes: remove more unused functions
      drm/amdgpu/mes: consolidate on a single mes reset callback
      drm/amdgpu/mes: use correct MES pipe for resets
      drm/amdgpu: properly handle GC vs MM in amdgpu_vmid_mgr_init()

Alexandre Demers (35):
      drm/amdgpu: use gmc_v7_0_is_idle() since it is available under GMC7
      drm/amdgpu: use cik_sdma_is_idle() in CIK SDMA
      drm/amdgpu: small cleanup to CIK SDMA
      drm/amdgpu: move X_GB_ADDR_CONFIG_GOLDEN in GFX7
      drm/radeon: fix MAX_POWER_SHIFT value
      drm/amdgpu: move GFX6 defines into gfx_v6_0.c
      drm/amdgpu: wire up defines, shifts and masks through SI code
      drm/amdgpu: use proper defines, shifts and masks in DCE6 code
      drm/amdgpu: remove PACKET3 duplicated defines from si_enums.h
      drm/amdgpu: move si_ih.c away from sid.h defines
      drm/amdgpu: use GRPH_SECONDARY_SURFACE_ADDRESS_MASK with GRPH_SECONDARY_SURFACE_ADDRESS in DCE6
      drm/amdgpu: move DCE6 away from sid.h and si_enums.h defines
      drm/amdgpu: add missing DMA defines, shifts and masks
      drm/amdgpu: add missing GFX6 defines
      drm/amdgpu: make GFX6 easier to read
      drm/amdgpu: move si_dma.c away from sid.h and si_enums.h
      drm/amdgpu: keep removing sid.h dependency from si_dma.c
      drm/amdgpu: cleanup DCE6 a bit more
      drm/amdgpu: continue cleaning up sid.h and si_enums.h
      drm/amdgpu: add missing SMU6 defines, shifts and masks
      drm/pm/legacy-dpm: move SI away from sid.h and si_enums.h
      drm/amdgpu: move si.c away from sid.h
      drm/amdgpu: huge sid.h cleanup, drop substituted defines.
      drm/amdgpu: fix typos in DCEs
      drm/amdgpu: use "irq" in place of "interrupt" in DCE6/8 as in DCE10/11
      drm/amd/display/dc: reclassify DCE6 resources and hw sequencer
      drm/amdgpu: fill in gmc_v6_0_set_clockgating_state()
      drm/amdgpu: still cleanup sid.h
      drm/amdgpu: rename function to follow naming convention in dce110
      drm/amdgpu: add missing parameter name in dce110_clk_src_construct() declaration
      drm/amdgpu: fix typo in atombios.h
      drm/radeon: fix typo in atombios.h
      drm/amdgpu: fix duplicated value setting in dce100_resource_construct()
      drm/amdgpu: fix typo in bios_parser.c
      drm/amdgpu: add missing DCE6 to dce_version_to_string()

Amaranath Somalapuram (1):
      drm/amdgpu: fix IGT CI regression with eviction fence

Amber Lin (1):
      drm/amdkfd: Set SDMA_RLCx_IB_CNTL/SWITCH_INSIDE_IB

Ananta Srikar (1):
      drm/amd/amdgpu: Fix typo

Andres Urian Florez (1):
      drm/amdgpu: Replace deprecated function strcpy() with strscpy()

Andrey Vatoropin (1):
      drm/amd/display: Remove the redundant NULL check

Antonio Fernando Silva e Cruz Filho (1):
      drm/amd/display: Rename program_timing function for better debugging

Apurv Mishra (1):
      drm/amdkfd: Drop workaround for GC v9.4.3 revID 0

Aric Cyr (3):
      drm/amd/display: Create a temporary scratch dc_link
      drm/amd/display: DC v3.2.326
      drm/amd/display: Promote DAL to 3.2.327

Arunpravin Paneer Selvam (23):
      drm/amdgpu: Implement a new userqueue fence driver
      drm/amdgpu: Add mqd support for the fence address
      drm/amdgpu: screen freeze and userq driver crash
      drm/amdgpu: UAPI headers for userqueue Secure semaphore
      drm/amdgpu: Implement userqueue signal/wait IOCTL
      drm/amdgpu: Add wait IOCTL timeline syncobj support
      drm/amdgpu: Enable userq fence interrupt support
      drm/amdgpu: Remove the MES self test
      drm/amdgpu: Few optimization and fixes for userq fence driver
      drm/amdgpu: Add the missing error handling for xa_store() call
      drm/amdgpu: add vm root BO lock before accessing the vm
      drm/amdgpu: Add separate array of read and write for BO handles
      drm/amdgpu: Add gpu_addr support to seq64 allocation
      drm/amdgpu: add userq specific kernel config for fence ioctls
      drm/amdgpu: Modify userq signal/wait struct field names
      drm/amdgpu: enable userqueue secure sem for GFX 12
      drm/amdgpu: Add mqd for userq compute queue
      drm/amdgpu: Fix NULL ptr dereference issue for non userq fences
      drm/amdgpu: Fix the use-after-free issue in wait IOCTL
      drm/amdgpu: Apply sign extension to seq64
      drm/amdgpu: Fix out-of-bounds issue in user fence
      drm/amdgpu: Modify the seq64 VM cache policy
      drm/amdgpu: Add queue id support to the user queue wait IOCTL

Arvind Yadav (11):
      drm/amdgpu: enable SDMA usermode queues
      drm/amdgpu: fix MES GFX mask
      drm/amdgpu: update userqueue BOs and PDs
      drm/amdgpu: Add input fence to sync bo map/unmap
      drm/amdgpu: Fix Illegal opcode in command stream Error
      drm/amdgpu: Fix display freeze lockup error
      drm/amdgpu: fix the memleak caused by fence not released
      drm/amdgpu: Fix display freezing issue when resizing apps
      drm/amdgpu/gfx11: Add fw minimum version check for usermode queue
      drm/amdgpu/gfx12: Add fw minimum version check for usermode queue
      drm/amdgpu: remove DRM_AMDGPU_NAVI3X_USERQ config for UQ

Asad Kamal (12):
      drm/amd/pm: Expose smu_v13_0_6 caps
      drm/amd/pm: Use gpu_metrics_v1_8 for smu_v13_0_6
      drm/amd/pm: Use gpu_metrics_v1_8 for smu_v13_0_12
      drm/amd/pm: Enable host limit metrics support
      drm/amd/pm: Enable host limit metrics support
      drm/amd/pm: Add ip version check for smu_v13_0_12 functions
      drm/amd/pm: Update pmfw headers for smu_v_13_0_6
      drm/amd/pn: Fetch static metrics table
      drm/amd/pm: Use common function to fetch static metrics table
      drm/amd/pm: Fill static metrics data
      drm/amd/pm: Add voltage caps for smu_v13_0_6
      drm/amd/pm: Add board voltage node to hwmon

Aurabindo Pillai (7):
      drm/amd/display: convert DRM_ERROR to drm_err in hpd_rx_irq_create_workqueue()
      drm/amd/display: use drm_err in hpd rx offload
      drm/amd/display: use drm_err in create_validate_stream_for_sink()
      drm/amd/display: convert more DRM_ERROR to drm_err
      drm/amd/display: use drm_info instead of DRM_INFO
      drm/amd/display: use drm_warn instead of DRM_WARN
      drm/amd/display: downgrade HDMI infoframe error to one time warning

Ausef Yousof (2):
      drm/amd/display: wait for updates to latch before locking
      drm/amd/display: dont disable dtb as dto src during dpms off

Austin Zheng (3):
      drm/amd/display: DML21 Reintegration
      drm/amd/display: Set ODM Factor Based On DML Architecture
      drm/amd/display: Move Mode Support Prefetch Checks To Its Own Function

Bagas Sanjaya (1):
      drm/amdgpu/userq: fix user_queue parameters list

Boyuan Zhang (1):
      drm/amdgpu: enable FW workaround for VCN 4_0_5

Candice Li (1):
      drm/amdgpu: Set RAS EEPROM table version to v3 for umc v12_5

Ce Sun (5):
      drm/amd/pm: Add link reset for SMU 13.0.6
      drm/amdgpu: refactor amdgpu_device_gpu_recover
      drm/amdgpu: Multi-GPU DPC recovery support
      drm/amdgpu/vcn: during dpc recovery will corrupt VCPU buffer
      drm/amdgpu: Replace tmp_adev with hive in amdgpu_pci_slot_reset

Charlene Liu (3):
      drm/amd/display: fix zero value for APU watermark_c
      drm/amd/display: turn off eDP lcdvdd and backlight if not required
      drm/amd/display: Revert "not disable dtb as dto src at dpms off"

Charles Han (2):
      Documentation: Remove repeated word in docs
      drm/amd/pp: Fix potential NULL pointer dereference in atomctrl_initialize_mc_reg_table

Chris Bainbridge (1):
      drm/amd/display: Fix slab-use-after-free in hdcp

Chris Park (1):
      drm/amd/display: Implement HDMI Read Request

Christian König (5):
      drm/amdgpu: immediately use GTT for new allocations
      drm/amdgpu: allow pinning DMA-bufs into VRAM if all importers can do P2P
      drm/amdgpu: Modify the MES process va end limit
      drm/amdgpu: fix call to amdgpu_eviction_fence_detach
      drm/amdgpu: use a dummy owner for sysfs triggered cleaner shaders v4

Chun-Liang Chang (1):
      drm/amd/display: Add Read Histogram command header

ChunTao Tso (1):
      drm/amd/display: Add a Panel Replay config option

Colin Ian King (1):
      drm/amdgpu: Fix spelling mistake "rounter" -> "router"

Cruise (1):
      drm/amd/display: Remove BW Allocation from DPIA notification

Dan Carpenter (4):
      drm/amdgpu: Fix double free in amdgpu_userq_fence_driver_alloc()
      drm/amdgpu: Clean up error handling in amdgpu_userq_fence_driver_alloc()
      drm/amdgpu/userq: Call unreserve on error in amdgpu_userq_fence_read_wptr()
      drm/amdgpu/userq: remove unnecessary NULL check

David Rosca (1):
      drm/amdgpu: Add back JPEG to video caps for carrizo and newer

Denis Arefev (1):
      drm/amd/pm/smu11: Prevent division by zero

Dillon Varone (6):
      drm/amd/display: Consider downspread against max clocks in DML2.1
      drm/amd/display: Add Support for reg inbox0 for host->DMUB CMDs
      drm/amd/display: Fix VUpdate offset calculations for dcn401
      Revert "drm/amd/display: Fix VUpdate offset calculations for dcn401"
      drm/amd/display: Fix Vertical Interrupt definitions for dcn32, dcn401
      drm/amd/display: Refactor SubVP cursor limiting logic

Dominik Kaszewski (2):
      drm/amdgpu: Fix typo in DC_DEBUG_MASK kernel-doc
      drm/amd/display: HDCP Locality check using DMUB Fused IO

Dr. David Alan Gilbert (3):
      drm/radeon/radeon_audio: Remove unused r600_hdmi_audio_workaround
      drm/radeon: Remove unused radeon_fence_wait_any
      drm/amd/display: Remove unused *vbios_smu_set_dprefclk

Ellen Pan (1):
      drm/amdgpu: Direct ret in ras_reset_err_cnt on VF

Emily Deng (2):
      drm/amdkfd: sriov doesn't support per queue reset
      drm/amdgpu: Clear overflow for SRIOV

Eric Huang (4):
      drm/amdkfd: add smi events for process start and end
      drm/amdkfd: fix NULL check mistake for process smi event
      drm/amdkfd: fix a bug of smi event for superuser
      drm/amdkfd: add pasid debugfs entries

Fangzhi Zuo (1):
      drm/amd/display: Do Not Consider DSC if Valid Config Not Found

Felix Kuehling (4):
      drm/amdgpu: Use allowed_domains for pinning dmabufs
      drm/amdgpu: Don't pin VRAM without DMABUF_MOVE_NOTIFY
      drm/amdgpu: Allow P2P access through XGMI
      drm/amdgpu: Fail DMABUF map of XGMI-accessible memory

Flora Cui (1):
      drm/amdgpu/ip_discovery: add missing ip_discovery fw

George Shen (1):
      drm/amd/display: Use 16ms AUX read interval for LTTPR with old sinks

Gergo Koteles (1):
      drm/amd/display: do not copy invalid CRTC timing info

Huacai Chen (3):
      drm/amd/display: Protect FPU in dml21_copy()
      drm/amd/display: Protect FPU in dml2_init()/dml21_init()
      drm/amd/display: Protect FPU in dml2_validate()/dml21_validate()

Jack Chang (1):
      drm/amd/display: Move desync error counter operation up.

James Flowers (1):
      drm/amd/display: removed unused function

Jay Cornwall (1):
      drm/amdgpu: Increase KIQ invalidate_tlbs timeout

Jesse Zhang (1):
      drm/amd/amdgpu: Fix out of bounds warning in amdgpu_hw_ip_info

Jesse.Zhang (1):
      drm/amdgpu: Fix API status offset for MES queue reset

Jesse.zhang@amd.com (10):
      drm/amdgpu: Enable per-queue reset for SDMA v4.4.2 on IP v9.5.0
      drm/amdgpu: Add the new sdma function pointers for amdgpu_sdma.h
      drm/amdgpu/sdma_v4: Register the new sdma function pointers
      drm/amdgpu: switch amdgpu_sdma_reset_engine to use the new sdma function pointers
      drm/amdgpu: Implement SDMA soft reset directly for v5.x
      drm/amdgpu/: drm/amdgpu: Register the new sdma function pointers for sdma_v5_0
      drm/amdgpu: Register the new sdma function pointers for sdma_v5_2
      drm/amdgpu: optimize queue reset and stop logic for sdma_v5_0
      drm/amdgpu: optimize queue reset and stop logic for sdma_v5_2
      drm/amdgpu:remove old sdma reset callback mechanism

JinZe.Xu (1):
      drm/amd/display: Use sync version of indirect register access.

Jonathan Kim (1):
      drm/amdkfd: limit sdma queue reset caps flagging for gfx9

Joshua Aberback (1):
      drm/amd/display: Use meaningful size for block_sequence array

Kees Cook (1):
      drm/amdgpu/atom: Work around vbios NULL offset false positive

Kenneth Feng (3):
      drm/amd/display: pause the workload setting in dm
      drm/amd/amdgpu: decouple ASPM with pcie dpm
      drm/amd/amdgpu: disable ASPM in some situations

Kevin Gao (1):
      drm/amd/display: Correct SSC enable detection for DCN351

Leo Li (1):
      drm/amd/display: Default IPS to RCG_IN_ACTIVE_IPS2_IN_OFF

Leo Zeng (2):
      drm/amd/display: Add override for visual confirm
      drm/amd/display: Get visual confirm color for stream

Lijo Lazar (13):
      drm/amdkfd: Use dev_* instead of pr_* for messages
      drm/amdgpu: Add basic validation for RAS header
      drm/amdgpu: Fix xgmi v6.4.1 link status reporting
      drm/amdgpu: Reset RAS table if header is invalid
      drm/amdgpu: Use generic hdp flush function
      drm/amdgpu: Use the right function for hdp flush
      drm/amdgpu: Disallow partition query during reset
      drm/amd/pm: Reset SMU v13.0.x custom settings
      drm/amdgpu: Fix offset for HDP remap in nbio v7.11
      drm/amdgpu: Fix query order of XGMI v6.4.1 status
      drm/amdgpu: Print bootloader status for long waits
      drm/amd/pm: Fix comment style
      drm/amdgpu: Fix comment style

Maarten Lankhorst (1):
      drm/amdgpu: Add cgroups implementation

Mario Limonciello (11):
      drm/amd/display: Add HP Probook 445 and 465 to the quirk list for eDP on DP1
      drm/amd/display: Add HP Elitebook 645 to the quirk list for eDP on DP1
      drm/amd/display: Optimize custom brightness curve
      drm/amd/display: Adjust all dev_*() messages to drm_*()
      drm/amd/display: Move PSR support message into amdgpu_dm
      drm/amd/display: Remove double checks for `debug.enable_mem_low_power.bits.cm`
      drm/amd: Forbid suspending into non-default suspend states
      Documentation/amdgpu: Add Ryzen AI 350 series processors
      drm/amd/display: Avoid divide by zero by initializing dummy pitch to 1
      drm/amd/display: Fix ACPI edid parsing on some Lenovo systems
      Documentation/amdgpu: Add Ryzen AI Max 300 series processor

Masha Grinman (1):
      drm/amdgpu: Move read of snoop register from guest to host

Matthew Auld (1):
      drm/amdgpu/dma_buf: fix page_link check

Meenakshikumar Somasundaram (1):
      drm/amd/display: Fix pixel rate divider policy for 1 pixel per cycle config

Nicholas Susanto (1):
      drm/amd/display: Enable urgent latency adjustment on DCN35

Paul Hsieh (1):
      drm/amd/display: Skip to enable dsc if it has been off

Prike Liang (7):
      drm/amdgpu/gfx11: Implement the GFX11 KGQ pipe reset
      drm/amdgpu/gfx11: Implement the GFX11 KCQ pipe reset
      drm/amdgpu/gfx12: Implement the gfx12 kgq pipe reset
      drm/amdgpu: remove the duplicated mes queue active state setting
      drm/amdgpu/gfx12: Implement the GFX12 KCQ pipe reset
      drm/amdgpu: add the evf attached gem obj resv dump
      drm/amdgpu: set the evf name to identify the userq case

Robin Chen (1):
      drm/amd/display: Enable Replay Low Hz feature flag

Rodrigo Siqueira (15):
      Documentation/gpu: Add new acronyms
      Documentation/gpu: Change index order to show driver core first
      Documentation/gpu: Create a documentation entry just for hardware info
      Documentation/gpu: Add explanation about AMD Pipes and Queues
      Documentation/gpu: Create a GC entry in the amdgpu documentation
      Documentation/gpu: Add an intro about MES
      drm/amdgpu/gfx: Introduce helpers handling CSB manipulation
      drm/amdgpu/gfx: Use CSB helpers in gfx_v11_0_get_csb_buffer
      drm/amdgpu/gfx: Use CSB helpers in gfx_v10_0_get_csb_buffer
      drm/amdgpu/gfx: Use CSB helpers in gfx_v9_0_get_csb_buffer
      drm/amdgpu/gfx: Use CSB helpers in gfx_v8_0_get_csb_buffer
      drm/amdgpu/gfx: Use CSB helpers in gfx_v7_0_get_csb_buffer
      drm/amdgpu/gfx: Fix gfx_v7_0_get_csb_buffer to use rb_config
      drm/amdgpu/gfx: Use CSB helpers in gfx_v6_0_get_csb_buffer
      drm/amdgpu: Add documentation associated with CSB

Roman Li (4):
      drm/amd/display: Add htmldocs description for fused_io interface
      drm/amd/display: Fix gpu reset in multidisplay config
      drm/amd/display: Force full update in gpu reset
      drm/amd/display: enable phy-ssc reduction by default

Ruili Ji (3):
      drm/amd/pm: implement dpm vcn reset function
      amd/amdgpu: Init vcn hardware per instance for vcn 4.0.3
      amd/amdgpu: Implement VCN queue reset for vcn 4.0.3

Saleemkhan Jamadar (4):
      drm/amd/display: add proper error message for vblank init
      drm/amd/display: add proper error message for vblank init
      drm/amdgpu: map doorbell for the requested userq
      drm/amdgpu: add db size and offset range for VCN and VPE

Sathishkumar S (1):
      drm/amdgpu: Enable doorbell for JPEG5_0_1

Shane Xiao (1):
      drm/amdkfd: Add rec SDMA engines support with limited XGMI

Shashank Sharma (24):
      drm/amdgpu: add usermode queue base code
      drm/amdgpu: add new IOCTL for usermode queue
      drm/amdgpu: add helpers to create userqueue object
      drm/amdgpu: create MES-V11 usermode queue for GFX
      drm/amdgpu: create context space for usermode queue
      drm/amdgpu: map usermode queue into MES
      drm/amdgpu: map wptr BO into GART
      drm/amdgpu: generate doorbell index for userqueue
      drm/amdgpu: cleanup leftover queues
      drm/amdgpu: enable GFX-V11 userqueue support
      drm/amdgpu: enable compute/gfx usermode queue
      drm/amdgpu: add kernel config for gfx-userqueue
      Revert "drm/amdgpu: don't allow userspace to create a doorbell BO"
      drm/amdgpu: fix userqueue UAPI comments
      drm/amdgpu: bypass SRIOV check for shadow size info
      drm/amdgpu: add get_gfx_shadow_info callback for gfx12
      drm/amdgpu: add new AMDGPU_INFO subquery for userq objects
      drm/amdgpu: add gfx eviction fence helpers
      drm/amdgpu: add userqueue suspend/resume functions
      drm/amdgpu: suspend gfx userqueues
      drm/amdgpu: resume gfx userqueues
      drm/amdgpu: handle eviction fence race
      drm/amdgpu: simplify eviction fence suspend/resume
      drm/amdgpu: enable eviction fence

Sherry Wang (1):
      drm/amd/display: rename IPS2 entry/exit message

Shiwu Zhang (1):
      drm/amdgpu: Update vcn doorbell range in NBIO 7.9

Somalapuram Amaranath (1):
      drm/amdgpu: enable userqueue support for GFX12

Sonny Jiang (1):
      drm/amdgpu: Add DPG pause for VCN v5.0.1

Srinivasan Shanmugam (8):
      drm/amdgpu/gfx10: Add Cleaner Shader Support for GFX10.3.x GPUs
      drm/amdgpu/gfx11: Add Cleaner Shader Support for GFX11.5.2/11.5.3 GPUs
      drm/amdgpu: Add PACKET3_RUN_CLEANER_SHADER_9_0 for Cleaner Shader execution
      drm/amdgpu: Enhance Cleaner Shader Handling in GFX v9.0 Architecture v2
      drm/amdgpu: Refine Cleaner Shader MEC firmware version for GFX10.1.x GPUs
      drm/amd/display: Add NULL pointer checks in dm_force_atomic_commit()
      drm/amd/display: Fix NULL pointer dereferences in dm_update_crtc_state() v2
      drm/amd/display: Fix NULL pointer dereference for program_lut_mode in dcn401_populate_mcm_luts

Sunil Khatri (5):
      drm/amdgpu: Fix the comment to avoid warning
      drm/amdgpu: add the argument description for gpu_addr
      drm/amdgpu/userq: add context and seqno of the fence
      drm/radeon: fix the warning for radeon_cs_parser_fini
      drm/amdgpu: update fence ptr with context:seqno

Taimur Hassan (3):
      drm/amd/display: [FW Promotion] Release 0.1.5.0
      drm/amd/display: Promote DC to 3.2.328
      drm/amd/display: Promote DC to 3.2.329

Tao Zhou (1):
      drm/amdgpu: add loop bits for NPS2 page retirement

Tom Chung (1):
      drm/amd/display: Do not enable Replay and PSR while VRR is on in amdgpu_dm_commit_planes()

TungYu Lu (1):
      drm/amd/display: Correct prefetch calculation

Victor Skvortsov (3):
      drm/amdgpu: Add indirect L1_TLB_CNTL reg programming for VFs
      drm/amdgpu: Fix CPER error handling on VFs
      drm/amdgpu: Disable ACA on VFs

Wentao Liang (1):
      drm/amd/display: Add error check for avi and vendor infoframe setup function

Xiang Liu (1):
      drm/amdgpu: Print kernel message when error logged by scrub

Yifan Zha (1):
      drm/amdgpu: refine MES register print for devices of hive

Yihan Zhu (2):
      drm/amd/display: DCN32 null data check
      drm/amd/display: DCN42 RMCM and MCM 3DLUT support

Yiling Chen (1):
      drm/amd/display: To apply the adjusted DP ref clock for DP devices

ZhenGuo Yin (1):
      drm/amdgpu: fix warning of drm_mm_clean

 .../gpu/amdgpu/amd-hardware-list-info.rst          |   23 +
 Documentation/gpu/amdgpu/amdgpu-glossary.rst       |   42 +
 Documentation/gpu/amdgpu/apu-asic-info-table.csv   |    2 +
 Documentation/gpu/amdgpu/debugfs.rst               |  210 +
 Documentation/gpu/amdgpu/debugging.rst             |    7 +
 Documentation/gpu/amdgpu/display/dc-debug.rst      |    2 +-
 Documentation/gpu/amdgpu/driver-core.rst           |   81 +-
 Documentation/gpu/amdgpu/driver-misc.rst           |   17 -
 Documentation/gpu/amdgpu/gc/index.rst              |   52 +
 Documentation/gpu/amdgpu/gc/mes.rst                |   38 +
 Documentation/gpu/amdgpu/index.rst                 |    5 +-
 .../gpu/amdgpu/pipe_and_queue_abstraction.svg      | 1279 ++++++
 drivers/gpu/drm/amd/amdgpu/Makefile                |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   50 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c            |  109 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  499 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   72 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  109 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c |  236 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h |   69 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  178 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  192 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   62 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c            |   21 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h            |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |   14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h             |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   81 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            | 1106 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   68 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  112 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h            |   14 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |  108 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |   18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c          |   25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.h          |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |  916 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |  133 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |  960 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h    |   76 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   24 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |    9 +-
 drivers/gpu/drm/amd/amdgpu/atom.c                  |    1 +
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |   18 +-
 drivers/gpu/drm/amd/amdgpu/cikd.h                  |    3 -
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |    7 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |  206 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |   16 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  147 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  739 +++-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  622 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |   46 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   60 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   36 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  171 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |   52 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   10 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   10 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   46 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |    9 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   16 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |   13 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c              |   13 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c              |   13 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v7_0.c              |   13 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |    6 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c         |  355 ++
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.h         |   30 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   78 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |   92 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   66 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |    8 +-
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   53 +-
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |   36 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  271 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  204 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  140 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |  221 +-
 drivers/gpu/drm/amd/amdgpu/si.c                    |  413 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |  116 +-
 drivers/gpu/drm/amd/amdgpu/si_enums.h              |  234 +-
 drivers/gpu/drm/amd/amdgpu/si_ih.c                 |   17 +-
 drivers/gpu/drm/amd/amdgpu/sid.h                   | 1555 +------
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    5 +
 drivers/gpu/drm/amd/amdgpu/soc15d.h                |    5 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |   10 +
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.h             |    2 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |   83 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |    4 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |   58 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                    |    7 +
 drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c           |   76 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |    5 -
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c   |  142 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |   92 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |  142 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |    4 +
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |   11 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    5 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |    7 +
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c             |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |   24 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h        |    1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   50 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  614 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   25 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   17 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   75 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   15 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   17 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |    4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |    8 -
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   |    4 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |   41 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |    4 +-
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c       |   14 -
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.h       |    1 -
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        |   14 -
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h        |    1 -
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c |   29 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn351_clk_mgr.c  |    1 +
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |    8 +-
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c   |    6 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  141 +-
 drivers/gpu/drm/amd/display/dc/core/dc_debug.c     |    2 +
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |    4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   48 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |   96 +
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   70 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  346 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  185 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |    2 +-
 drivers/gpu/drm/amd/display/dc/dc_fused_io.c       |  144 +
 drivers/gpu/drm/amd/display/dc/dc_fused_io.h       |   31 +
 drivers/gpu/drm/amd/display/dc/dc_helper.c         |    8 +-
 drivers/gpu/drm/amd/display/dc/dc_state_priv.h     |   20 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   11 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   17 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |    9 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.h  |    2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c      |    2 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c  |    3 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |   19 +-
 drivers/gpu/drm/amd/display/dc/dce60/Makefile      |    3 +-
 .../amd/display/dc/dce80/dce80_timing_generator.c  |    4 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |    8 +
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |    1 +
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |    1 +
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |    1 +
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |    1 +
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |    4 +-
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       |    3 -
 .../dc/dml2/dml21/dml21_translation_helper.c       |   12 +-
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |   28 +-
 .../drm/amd/display/dc/dml2/dml21/inc/dml_top.h    |    1 +
 .../dc/dml2/dml21/inc/dml_top_dchub_registers.h    |    2 +
 .../dc/dml2/dml21/inc/dml_top_display_cfg_types.h  |    3 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c   |   10 +-
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     | 4330 ++++++++++----------
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |    2 +
 .../dc/dml2/dml21/src/dml2_core/dml2_core_utils.c  |  134 +-
 .../dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c   |    4 +
 .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.c     |    4 +
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |    8 +-
 .../dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c    |    2 +-
 .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.c |   31 -
 .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.h |   77 +-
 .../dml21/src/inc/dml2_internal_shared_types.h     |    6 +
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |   24 +-
 .../amd/display/dc/dml2/dml2_translation_helper.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |   20 +-
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c   |    9 +-
 drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c |   14 +
 drivers/gpu/drm/amd/display/dc/hwss/Makefile       |   26 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |    8 +-
 .../dce60/dce60_hwseq.c}                           |    2 +-
 .../dce60/dce60_hwseq.h}                           |    0
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  123 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.h    |    7 +
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |    2 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |   14 +
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |    4 +-
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |    2 +
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |    4 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  354 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |    8 +
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |    8 +-
 .../drm/amd/display/dc/hwss/hw_sequencer_private.h |    2 +
 drivers/gpu/drm/amd/display/dc/inc/core_status.h   |    3 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   13 +-
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |    3 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |   46 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/optc.h       |    1 +
 drivers/gpu/drm/amd/display/dc/inc/reg_helper.h    |    4 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |    2 -
 .../amd/display/dc/irq/dcn32/irq_service_dcn32.c   |   61 +-
 .../amd/display/dc/irq/dcn401/irq_service_dcn401.c |   60 +-
 drivers/gpu/drm/amd/display/dc/irq_types.h         |   16 +
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |    6 +-
 .../amd/display/dc/link/protocols/link_dp_dpia.c   |    1 +
 .../dc/link/protocols/link_dp_irq_handler.c        |    7 +-
 .../dc/link/protocols/link_dp_training_8b_10b.c    |   54 +-
 .../dc/link/protocols/link_edp_panel_control.c     |   13 +-
 .../gpu/drm/amd/display/dc/mpc/dcn32/dcn32_mpc.c   |  380 +-
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c |   11 -
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h |   14 -
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |    1 +
 drivers/gpu/drm/amd/display/dc/resource/Makefile   |   26 +-
 .../display/dc/resource/dce100/dce100_resource.c   |    6 +-
 .../display/dc/resource/dce110/dce110_resource.c   |    4 +-
 .../display/dc/resource/dce112/dce112_resource.c   |    4 +-
 .../display/dc/resource/dce112/dce112_resource.h   |    2 +-
 .../dc/{ => resource}/dce60/dce60_resource.c       |    6 +-
 .../dc/{ => resource}/dce60/dce60_resource.h       |    0
 .../amd/display/dc/resource/dce80/dce80_resource.c |    4 +-
 .../amd/display/dc/resource/dcn10/dcn10_resource.c |    5 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |    6 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.h |    2 +-
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |    6 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |    6 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.h |    2 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |    4 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.h |    2 +-
 .../display/dc/resource/dcn314/dcn314_resource.c   |    4 +-
 .../display/dc/resource/dcn314/dcn314_resource.h   |    2 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |   65 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.h |    6 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |    3 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |    6 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |    6 +-
 .../amd/display/dc/resource/dcn36/dcn36_resource.c |    6 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |   49 +-
 .../display/dc/resource/dcn401/dcn401_resource.h   |    2 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |  138 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   69 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c |  121 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.h |    4 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |  297 +-
 .../gpu/drm/amd/display/dmub/src/dmub_srv_stat.c   |   21 +-
 .../amd/display/include/gpio_service_interface.h   |    3 +
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h    |    1 +
 .../drm/amd/display/modules/hdcp/hdcp2_execution.c |   53 +-
 .../amd/display/modules/hdcp/hdcp2_transition.c    |   48 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c    |   73 +
 drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |   38 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |    2 +-
 .../drm/amd/include/asic_reg/dce/dce_6_0_sh_mask.h |    2 +
 .../gpu/drm/amd/include/asic_reg/gca/gfx_6_0_d.h   |    2 +
 .../gpu/drm/amd/include/asic_reg/oss/oss_1_0_d.h   |   23 +-
 .../drm/amd/include/asic_reg/oss/oss_1_0_sh_mask.h |   41 +
 .../gpu/drm/amd/include/asic_reg/smu/smu_6_0_d.h   |   44 +
 .../drm/amd/include/asic_reg/smu/smu_6_0_sh_mask.h |  188 +-
 drivers/gpu/drm/amd/include/atombios.h             |    2 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |    2 +
 drivers/gpu/drm/amd/include/v11_structs.h          |    8 +-
 drivers/gpu/drm/amd/include/v12_structs.h          |    8 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |   62 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   34 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    5 +
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |  358 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c         |   42 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c    |    8 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   70 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   30 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |    7 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |    4 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |    1 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    2 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |    2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   13 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   10 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |   38 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  155 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |   21 +
 drivers/gpu/drm/radeon/atombios.h                  |    3 +-
 drivers/gpu/drm/radeon/r600_hdmi.c                 |   22 -
 drivers/gpu/drm/radeon/radeon.h                    |    3 -
 drivers/gpu/drm/radeon/radeon_asic.h               |    1 -
 drivers/gpu/drm/radeon/radeon_cs.c                 |    1 -
 drivers/gpu/drm/radeon/radeon_fence.c              |   42 -
 drivers/gpu/drm/radeon/sid.h                       |    2 +-
 include/uapi/drm/amdgpu_drm.h                      |  316 ++
 include/uapi/linux/kfd_ioctl.h                     |    5 +
 312 files changed, 15561 insertions(+), 9356 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/amd-hardware-list-info.rst
 create mode 100644 Documentation/gpu/amdgpu/debugfs.rst
 create mode 100644 Documentation/gpu/amdgpu/gc/index.rst
 create mode 100644 Documentation/gpu/amdgpu/gc/mes.rst
 create mode 100644 Documentation/gpu/amdgpu/pipe_and_queue_abstraction.svg
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mes_userqueue.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_fused_io.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_fused_io.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.c
 rename drivers/gpu/drm/amd/display/dc/{dce60/dce60_hw_sequencer.c => hwss/dce60/dce60_hwseq.c} (99%)
 rename drivers/gpu/drm/amd/display/dc/{dce60/dce60_hw_sequencer.h => hwss/dce60/dce60_hwseq.h} (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dce60/dce60_resource.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => resource}/dce60/dce60_resource.h (100%)
