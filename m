Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D44B09669
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 23:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC42910E8AA;
	Thu, 17 Jul 2025 21:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4AxlDd89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2076.outbound.protection.outlook.com [40.107.101.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EA910E8A9;
 Thu, 17 Jul 2025 21:38:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDOximkafV5FYMK7Lk6t978ueNcZ72DoiUo4qsBptHf5pPrqBpkP1VurcUQfb25jFfYtnNTAcI7HaZNvzAYaFIoI5fUfUq9cKgpVf7GfdXkh6EX1+NS5b/GJp3MLuVsiOS5zvvfZsA4yQXo5xkHLLbI1eOGleWyyTaLthpIl5i79cyFxkkyqgKcihxLo8deYgDc5jlsliTTE2n7k75YW+pm1Vs6tqam6KF7ngJtn5TpfOwgOKhdt3pajBHwhFZOHqGO47MhphYvDvWUT4qimjVEyKS09/g4ZsPSoE+bITeH1LLNbc3lOt1QjWETxXGmgNHYPaowhla43AApfSayKOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LODB5RGbJGHhT1yxJipPtM8Rn1HIxh4bq5+9oYtmrpA=;
 b=GNae2B0cFJVH/9DtTpm9QfHlF5Coxp1QK8AINgM3dpcbrPuTT9M2v2zMwnrH7Sv1hT62H0S7C2aylCJ3GVVy2NsZK3nFsRdH4DSlSfnHWKKfnKur8ine2Kp5ST4X+7E3UzIeQ8yGVlqJTvyKj1ATQ5jn0PuEenvn1vkim7HOXcnznzOTZ/Z8kNvVCKoC8P/f3yEXsk2yWYsvgffzM4XwGT3Y3T9szJM+jbJD6+6G9NlQF7vlN7GvOCZUNcH16+pRA6hBdYBQVN8oh8p7cDs2RfbltlVYsZtk96ASQbZIUkiQEzUugVEjsrtCj+Ydzsh0St1er+SqR3+zYppqfj41Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LODB5RGbJGHhT1yxJipPtM8Rn1HIxh4bq5+9oYtmrpA=;
 b=4AxlDd89UOSf6PsypAvhp3z+OGjfEUBlID3O44a4GolygBZ8IGb0BLHDUne3MlDLx8Wv+sc37r/+1ZOH3CRE9C8baCUdx9bS2Rv+5hbn+D8/JtH0wiktHMZOmF6LNYrsxa1d6AJxq/wIHe4Jxu7PqQRg1hlWspY0UOnkUqyZhhs=
Received: from BN9PR03CA0335.namprd03.prod.outlook.com (2603:10b6:408:f6::10)
 by LV2PR12MB6015.namprd12.prod.outlook.com (2603:10b6:408:14f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 21:38:41 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:f6:cafe::4e) by BN9PR03CA0335.outlook.office365.com
 (2603:10b6:408:f6::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.32 via Frontend Transport; Thu,
 17 Jul 2025 21:38:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.1 via Frontend Transport; Thu, 17 Jul 2025 21:38:41 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 16:38:39 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.17
Date: Thu, 17 Jul 2025 17:38:25 -0400
Message-ID: <20250717213827.2061581-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|LV2PR12MB6015:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ca16cbb-6c1c-4f02-95f2-08ddc57a4c2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkNXZzRJeWNDZHM5NndTb2dFZTdJbGUweUV0WVpTTDVzT0crWmdLTC8vZi9F?=
 =?utf-8?B?U0hlN25qSDFFMlR5L2xvR205RFRhVG92THV4RkRvSGprM3VFbkgzaUtzVnQ3?=
 =?utf-8?B?Y2NZZzkzQmV2d3FKbzdNOXh3NW8rSTBaTFY5dDM2Yno0ZTRNV0VhNlpUMUN2?=
 =?utf-8?B?M2xiY0JWaWlIL1dYY0FxYWY5aXNjbDZ2RzkwSDEzNGJmRTFVbFZIZnpCamFL?=
 =?utf-8?B?cmhmaTBCNVVXZUhBQ1NWTHBneHNlNEM4QkE3eC83cU1ZaGJwOHdVUk5vZHRZ?=
 =?utf-8?B?RDIzNEliWTJqNTRXaDE2T1N5aTBnbFIvN21zQStDb2VjeW9MMG56NDhJd3gz?=
 =?utf-8?B?ODZJTHo1eVJHUkhwc2VNN1NPY2RaUHliK3B1MTJLYXhYa2NXK3pBVlJJRTM5?=
 =?utf-8?B?a2MxSTJSY0l0STVUWSt6QXhod2kvODduWGRxcVN3QjNlZjhRcnAwMFVTTWFP?=
 =?utf-8?B?cDF4YUlWM3NxZjFvQmJTS205cUJXR2h1RGptWWtFRzY1emhtN210SnA5NFF0?=
 =?utf-8?B?cTZQaEJPNm5pOTRTVk9ad0lnOW1FVXJGSDFXQVdBRUFCbUF3SmRmT1dwUjMw?=
 =?utf-8?B?WW1RbHhtS0VDZnhIMHNUN01RWVpEZHRJYXpmT2VVMEZGb3c1WXVkZjRHTVhu?=
 =?utf-8?B?a0o2UGZqY2V2am8xdGtHby9qckwwMnk2bmxSMTRDakJ1YzZtUk14M1I5NEZh?=
 =?utf-8?B?My9qRkRIQU44Rzg1UjRNOGEyaW95czBvTTRWZTcrejJpSk1xS1IreUp4YTls?=
 =?utf-8?B?OGNTTUhodTFsT3N5NEVsdWR0K0pOWFBaU1hCbmVwLy9DdzNObTNGL29FeE1B?=
 =?utf-8?B?SU1CNVM3cUE0dml6a25LRXBKK05pN2JuUGp6aFNlaUFRZFR3MVoxNTNXbXhY?=
 =?utf-8?B?MEZVRkIveWZncnlLTzVMTDdsdUFRUi9nVzJFOWdlNThBNnJCOFVrQ0V1dG1r?=
 =?utf-8?B?bU9HOU9xdVhnTkxCY09UUVRHSm5jcldaS0JCemVvUzVHY1g2VDhacTYwMmNF?=
 =?utf-8?B?clZyTDB3VGRxTTZ2VkFja3Z2MEhhOERwb0ZIUEhQME9YNzhpd0x1ME80ajUx?=
 =?utf-8?B?U0hhMm5mbDQvcWNhYkVrWVZZRjdGamhnZkIrdnFHUXM1bm5BaCt3OEp3T3lO?=
 =?utf-8?B?a1Q5bEc1b0kwMzZsZm8wMkNJRWRTR1ZJRmVWTlArdWZieEFjdkxqMzhvQ3cv?=
 =?utf-8?B?QUFzL2x0aFZ6RDJaS2NrMU5SN3FIR0liWDJCL0QzQmxLS0FDT2JCdFdxY0dw?=
 =?utf-8?B?ZVpUUmRUL0RWNGtZd1ZCVldJSFFRUWxVQktUSVdXa2VDY2N3QXFjOHRhUmxU?=
 =?utf-8?B?Y0E2dGNtTVl5UHhWODRmRGk5MVJid1d5bFpNMThOL0Z5S3NzUWY0eE40aTdL?=
 =?utf-8?B?bW5hS2FnWmxXTTZVZ2NXRHZjZHpkODJYaG5OemJRclhWNTNSS1gxNHQzaEFH?=
 =?utf-8?B?clNmTEV3aU5kZzJFaFc4R21GSlREdm1Qc2ZuVkIyUjl1a2lSZlBxUzhYSk51?=
 =?utf-8?B?NlR5RW9oMEQyRXhZaEVxNVd1ZzlpVHRNbjd2Uk1uUTZIVU1tL045K0F2Rkts?=
 =?utf-8?B?V3pqY3NLUVphNW9pWCtZcWIrb0UzdVJrZFFEOEZrbFZCWlFmaEI1cVlQTDNT?=
 =?utf-8?B?M1FiODBSWE5vRXdiSXNCUzQ2Ly9NWmxDVzNuOEEveGlocHNkM3hYbnRaYml1?=
 =?utf-8?B?RDZqVDRGbUNRcW9DOWtzNCtFcHcwMGZwM0RmYWg4c1FrWHJQdEZ5QjVDbFdj?=
 =?utf-8?B?eXYyUDFodDg5bUNYYUlPb3hJNzhscUdpbHRWaklselIvSGk2TndTMnl1ejhB?=
 =?utf-8?B?RGhaSXU4SWJ0cGdvN3dIOWlGbnFIK0dPdW5CWXF5RzhwbXllTHF4MGdjdk9I?=
 =?utf-8?B?QnBnQ3g0YmxlWXFVb3lyNG1xdmJRK0R6eG1TcU5IbS81bm9uVnFaVG9VS0o1?=
 =?utf-8?B?UThzS21ydmNUL0ZQRzdlQU8wSXBHSXBQMmRyc2hvY0o4MHNiM0lZUElVSTNR?=
 =?utf-8?B?Vmozd1A1eEl3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 21:38:41.0858 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca16cbb-6c1c-4f02-95f2-08ddc57a4c2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6015
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

One more round of updates for 6.17.

The following changes since commit 7e11e01d1f1d00cb308f9351511e9597a4f70678:

  Merge tag 'amd-drm-next-6.17-2025-07-11' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-07-11 23:55:40 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.17-2025-07-17

for you to fetch changes up to 6ac55eab4fc41e0ea80f9064945e4340f13d8b5c:

  drm/amdgpu: move reset support type checks into the caller (2025-07-17 12:36:56 -0400)

----------------------------------------------------------------
amd-drm-next-6.17-2025-07-17:

amdgpu:
- Partition fixes
- Reset fixes
- RAS fixes
- i2c fix
- MPC updates
- DSC cleanup
- EDID fixes
- Display idle D3 update
- IPS updates
- DMUB updates
- Retimer fix
- Replay fixes
- Fix DC memory leak
- Initial support for smartmux
- DCN 4.0.1 degamma LUT fix
- Per queue reset cleanups
- Track ring state associated with a fence
- SR-IOV fixes
- SMU fixes
- Per queue reset improvements for GC 9+ compute
- Per queue reset improvements for GC 10+ gfx
- Per queue reset improvements for SDMA 5+
- Per queue reset improvements for JPEG 2+
- Per queue reset improvements for VCN 2+
- GC 8 fix
- ISP updates

amdkfd:
- Enable KFD on LoongArch

radeon:
- Drop console lock during suspend/resume

UAPI:
- Add userq slot info to INFO IOCTL
  Used for IGT userq validation tests (https://lists.freedesktop.org/archives/igt-dev/2025-July/093228.html)

----------------------------------------------------------------
Alex Deucher (42):
      drm/amdgpu/gfx9: fix kiq locking in KCQ reset
      drm/amdgpu/gfx9.4.3: fix kiq locking in KCQ reset
      drm/amdgpu/gfx10: fix kiq locking in KCQ reset
      drm/amdgpu/vcn4: add additional ring reset error checking
      drm/amdgpu/vcn4.0.5: add additional ring reset error checking
      drm/amdgpu/vcn5: add additional ring reset error checking
      drm/amdgpu: clean up sdma reset functions
      drm/amdgpu/jpeg2: add additional ring reset error checking
      drm/amdgpu/jpeg3: add additional ring reset error checking
      drm/amdgpu/jpeg4: add additional ring reset error checking
      drm/amdgpu/vcn: don't enable per queue resets on SR-IOV
      drm/amdgpu: clean up jpeg reset functions
      drm/amdgpu: clean up GC reset functions
      drm/amdgpu: track ring state associated with a fence
      drm/amdgpu: make compute timeouts consistent
      drm/amdgpu/jpeg2: re-emit unprocessed state on ring reset
      drm/amdgpu/jpeg2.5: re-emit unprocessed state on ring reset
      drm/amdgpu/jpeg3: re-emit unprocessed state on ring reset
      drm/amdgpu/jpeg4: re-emit unprocessed state on ring reset
      drm/amdgpu/jpeg4.0.3: re-emit unprocessed state on ring reset
      drm/amdgpu/jpeg4.0.5: add queue reset
      drm/amdgpu/jpeg5: add queue reset
      drm/amdgpu/jpeg5.0.1: re-emit unprocessed state on ring reset
      drm/amdgpu/vcn4: re-emit unprocessed state on ring reset
      drm/amdgpu/vcn4.0.3: re-emit unprocessed state on ring reset
      drm/amdgpu/vcn4.0.5: re-emit unprocessed state on ring reset
      drm/amdgpu/vcn5: re-emit unprocessed state on ring reset
      drm/amdgpu/vcn: add a helper framework for engine resets
      drm/amdgpu/vcn2: implement ring reset
      drm/amdgpu/vcn2.5: implement ring reset
      drm/amdgpu/vcn3: implement ring reset
      drm/amdgpu/jpeg: clean up reset type handling
      drm/amdgpu/gfx9: re-emit unprocessed state on kcq reset
      drm/amdgpu/gfx9.4.3: re-emit unprocessed state on kcq reset
      drm/amdgpu/gfx10: re-emit unprocessed state on ring reset
      drm/amdgpu/gfx11: re-emit unprocessed state on ring reset
      drm/amdgpu/gfx12: re-emit unprocessed state on ring reset
      drm/amdgpu/sdma5: re-emit unprocessed state on ring reset
      drm/amdgpu/sdma5.2: re-emit unprocessed state on ring reset
      drm/amdgpu/sdma6: re-emit unprocessed state on ring reset
      drm/amdgpu/sdma7: re-emit unprocessed state on ring reset
      drm/amdgpu: move reset support type checks into the caller

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Add WARN_ON to the resource clear function

Asad Kamal (1):
      drm/amd/pm: Remove unnecessary variable

Aurabindo Pillai (1):
      drm/amd/display: Initial support for SmartMux

Ce Sun (1):
      drm/amdgpu: The interrupt source was not released

Charlene Liu (1):
      drm/amd/display: limit clear_update_flags to dcn32 and above

Christian König (1):
      drm/amdgpu: rework gmc_v9_0_get_coherence_flags v2

Clayton King (1):
      drm/amd/display: Free memory allocation

Dillon Varone (1):
      drm/amd/display: Refactor DSC cap calculations

Dominik Kaszewski (1):
      drm/amd/display: Workaround for stuck I2C arbitrage

Duncan Ma (2):
      drm/amd/display: Notify display idle on D3
      drm/amd/display: Notify DMUB on HW Release

Eeli Haapalainen (1):
      drm/amdgpu/gfx8: reset compute ring wptr on the GPU on resume

Fudongwang (1):
      drm/amd/display: Monitor patch to ignore EDID audio SAB check

Han Gao (1):
      drm/amdkfd: enable kfd on LoongArch systems

Ilya Bakoulin (1):
      drm/amd/display: Add definitions to support DID Type5 descriptors

Ivan Lipski (1):
      drm/amd/display: Revert "Add DPP & HUBP reset if power gate enabled on DCN314"

Jesse Zhang (2):
      drm/amdgpu: Add user queue instance count in HW IP info
      drm/amdgpu: Replace HQD terminology with slots naming

Karthi Kandasamy (1):
      drm/amd/display: Make dcn401_initialize_min_clocks() available to other compilation units

Leo Chen (3):
      drm/amd/display: Adding missing driver code for IPSv2.0
      drm/amd/display: Add static pg implementations for future use
      drm/amd/display: New Behavior for debug option disable_ips_in_vpb

Lijo Lazar (5):
      drm/amdgpu: Use cached partition mode, if valid
      drm/amd/pm: Get max/min frequency on aldebaran VF
      drm/amdgpu: Increase reset counter only on success
      drm/amd/pm: Use cached data for min/max clocks
      drm/amd/pm: Use cached metrics data on SMUv13.0.6

Melissa Wen (1):
      drm/amd/display: Disable CRTC degamma LUT for DCN401

Michael Strauss (1):
      drm/amd/display: Fix FIXED_VS retimer clock gen source override

Ovidiu Bunea (2):
      drm/amd/display: Add support for Panel Replay on DP1 eDP (panel_inst=1)
      drm/amd/display: Add HPO encoder support to Replay

Pratap Nirujogi (2):
      drm/amd/amdgpu: Initialize swnode for ISP MFD device
      drm/amd/amdgpu: Add helper functions for isp buffers

Thomas Zimmermann (2):
      drm/radeon: Do not hold console lock while suspending clients
      drm/radeon: Do not hold console lock during resume

Tony Yi (1):
      drm/amdgpu: Check SQ_CONFIG register support on SRIOV

Umio Yasuno (1):
      drm/amd/pm: fix null pointer access

Yihan Zhu (1):
      drm/amd/display: MPC basic allocation logic and TMZ

ganglxie (2):
      drm/amdgpu: refine eeprom data check
      drm/amdgpu: refine bad page loading when in the same nps mode

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  90 ++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c            | 175 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  20 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  15 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  28 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           | 107 +++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |  20 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  76 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h       |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            |  20 ++-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |   3 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  53 ++----
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  52 ++----
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  51 ++----
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  17 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  29 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   8 +-
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c            |  11 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |  18 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |  16 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |  18 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |  21 ++-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |  25 +--
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |  20 ++-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |  25 ++-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           |  30 +---
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |   3 -
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  17 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  20 ++-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  26 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |  26 +--
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |  26 +++
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  25 +++
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  27 +++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  20 +--
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  16 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |  20 +--
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |  20 +--
 drivers/gpu/drm/amd/amdkfd/Kconfig                 |   2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  11 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |   2 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |   2 +-
 .../gpu/drm/amd/display/dc/clk_mgr/dcn30/dalsmc.h  |   3 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |   4 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30m_clk_mgr.c  |  36 ++++
 .../amd/display/dc/clk_mgr/dcn30/dcn30m_clk_mgr.h  |  31 ++++
 .../dc/clk_mgr/dcn30/dcn30m_clk_mgr_smu_msg.c      | 118 +++++++++++++
 .../dc/clk_mgr/dcn30/dcn30m_clk_mgr_smu_msg.h      |  34 ++++
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |  33 +++-
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.h |   2 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  16 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |  26 +++
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |   2 +
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |  67 +++++++
 drivers/gpu/drm/amd/display/dc/dc.h                |  23 +++
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  75 ++++++--
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   6 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |  11 ++
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   3 +
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c    |  59 ++++++-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |  43 ++++-
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.h   |   2 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        | 192 ++++++++++++++++++---
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c |  24 +--
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.h |   1 -
 drivers/gpu/drm/amd/display/dc/dsc/dsc.h           |   1 +
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |   4 +-
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h   |   2 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  24 +++
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   2 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |  13 ++
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |  37 +---
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.h  |   2 -
 .../drm/amd/display/dc/hwss/dcn314/dcn314_init.c   |   2 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  14 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |   1 +
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |   3 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   3 +
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |  14 ++
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |   2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/pg_cntl.h    |   2 +
 .../hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c    |   2 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |  19 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |   8 +-
 .../display/dc/link/protocols/link_dp_capability.c |  19 ++
 .../dc/link/protocols/link_edp_panel_control.c     |  19 +-
 .../dc/link/protocols/link_edp_panel_control.h     |   1 +
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |   2 +
 .../display/dc/resource/dcn201/dcn201_resource.c   |   2 +
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |   2 +
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |   2 +
 .../display/dc/resource/dcn301/dcn301_resource.c   |   2 +
 .../display/dc/resource/dcn302/dcn302_resource.c   |   2 +
 .../display/dc/resource/dcn303/dcn303_resource.c   |   2 +
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |   2 +
 .../display/dc/resource/dcn314/dcn314_resource.c   |   2 +
 .../display/dc/resource/dcn315/dcn315_resource.c   |   2 +
 .../display/dc/resource/dcn316/dcn316_resource.c   |   2 +
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |   2 +
 .../display/dc/resource/dcn321/dcn321_resource.c   |   2 +
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   2 +
 .../display/dc/resource/dcn351/dcn351_resource.c   |   2 +
 .../amd/display/dc/resource/dcn36/dcn36_resource.c |   2 +
 .../display/dc/resource/dcn401/dcn401_resource.c   |   2 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  36 +++-
 .../drm/amd/display/modules/power/power_helpers.h  |   2 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   5 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  57 +++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |   3 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  40 ++---
 drivers/gpu/drm/radeon/radeon_device.c             |  23 +--
 include/drm/amd/isp.h                              |  51 ++++++
 include/uapi/drm/amdgpu_drm.h                      |   2 +
 128 files changed, 2017 insertions(+), 548 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30m_clk_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30m_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30m_clk_mgr_smu_msg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30m_clk_mgr_smu_msg.h
 create mode 100644 include/drm/amd/isp.h
