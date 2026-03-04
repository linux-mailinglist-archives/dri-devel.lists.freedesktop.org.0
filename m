Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCInBhWlqGkYwQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 22:33:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C45420801E
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 22:33:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605C410EABC;
	Wed,  4 Mar 2026 21:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LLerdNq+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012046.outbound.protection.outlook.com [52.101.48.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FA510EABA;
 Wed,  4 Mar 2026 21:33:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twrafSOLoLzCwttPq7f4z8bfmDnWWLYFUV9l6d77Spzm1r0/kM/QHTbW6t6YVyg1iSzoxBBeoeDeUdYlz3ZupUkHsviqRPqgkPiFwqTE4ThIbmjcQiVgbtYhv4ZtbBJzKIOCiki/Y9I6M7e5na2VdS2XiGsVHAsuSlURuj3vK/6ex2lDI5sp5NfEwrGErNlC7FDj9J2SLzg0rwLTkUI8VMVEDTSpDvLncP1DR23Pl4yvVLJHdI5rR9gIFJ7SRD+M5PaR7olg2ZVRu5PK8TwgUGWxV53WzJ+CNi9UT2Rkt/FToYZM7akfc+rXnmAm3MbYIqcl8ujCmqSoJTTDvkpc0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oL66so0vKgWcqKric+D5yM/lCpK6bY+9OiyribSsKU4=;
 b=EjFtXJkUQSl2B3mznfGLP8qksmyH+C9cbiWoGuh4akwN1fNUnLhuozqh3ySqY0UhRlFNoISZvbTN6nWq8U+hocFhz/t2M2fPksQ8ANCQMY2ubKlsAu8Ddl14Oeh0ETUI0L/3C/2FEgahlhgeTRV/ee1Vj4Fyi7/etG2i7VIsMYzR4+Tzmzof5h9u4rJk98wFIhU/rJDqByE0TMw8oGTOasnS4mGMUry50n5srX60Drd4rYVdMN24nBcUb/sqhAEmjVc5BXXR1FF7aSPA0+DugxhokDqyxwztpDpx0wfKo5GzA/dTdrgCJlGj5K/c6OSWkKMn0YznrjMHqQQbzx+ghQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oL66so0vKgWcqKric+D5yM/lCpK6bY+9OiyribSsKU4=;
 b=LLerdNq+GLlqNIHPG5B2zunsov794sfSPRvkSkBbJzW2C4ot0FnXbuy2axKL+qWFuG1RRvUTYm5ABB7VabQ+7pYopzvjjD+94AcflyGSThQI3EV5pXSWK3xWFALbBjOBfgSkHbPxFpQcwNkyJH++JbTqihn2b7dWH5CEST84PT0=
Received: from BL0PR05CA0019.namprd05.prod.outlook.com (2603:10b6:208:91::29)
 by CYYPR12MB8963.namprd12.prod.outlook.com (2603:10b6:930:c3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 21:32:49 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::fd) by BL0PR05CA0019.outlook.office365.com
 (2603:10b6:208:91::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.13 via Frontend Transport; Wed,
 4 Mar 2026 21:32:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 21:32:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 4 Mar
 2026 15:32:48 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Mar
 2026 15:32:47 -0600
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Mar 2026 15:32:47 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-7.1
Date: Wed, 4 Mar 2026 16:32:33 -0500
Message-ID: <20260304213233.1938311-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: alexander.deucher@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|CYYPR12MB8963:EE_
X-MS-Office365-Filtering-Correlation-Id: f78005a2-3e64-4cd9-bdcc-08de7a359548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|1800799024|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: hnJgx092vy8MYP6HSpT2oMqYGFCJIOyeqbex2UqTipP6ign2STRPjj5ub2IZm9TsIswfzKNmQ59y3IDSFBLBWUxhpIrINcuGZe+tKBVyYqMrXlmhGzzxfAGpaYDelrIY9/Ly0l5RwUWuXsjzW8w+0otRN3Cz9iVNB/8PomuXtDIUgaoxGl5hffCrQb4CVlQHyRoSKKIKs6vdAlqfLaYWAz/emdEer2chbLbVLX3cxbIjNagq6oOZw+d8pO9B28DOKf9/X8Q3SfqFDVXE5QPwa/UxpAinYVVu5tY4qx2k6OoqzxuCUd7cbk2ichfG0+tO7NF+cw8yuNjIJ4PNRHsPUNva3QqOF8Vwb+F5+h8Ck34C9cLbpLqG+9vzbmMRU0YPPx2olpYjSRVdS0HJT7xbomPifJHk/WDnUMthvJFgHXs32A6WQsoFdovEUyEyaXTp1iHymkbW76Pc2wh9zIsLwjeJYuSprGOCbTs0/0ZcIHXAixVxzMmCC4U2KxaTSM21ZIu00EyoZgJ9UKxBLMQplc2LjpQihOmY9ZgwFVnDJeMyaJqFMix28CRg7ggn4RC8KKKcfBrNr6muRgQYQUygH8X+F6B6F8S0X3LakRWbferTERemRLQDljiB0e/JFlc7hIHWiaycxtMnRNxg1y3V5z1VbchHRUgkl/3fu1oyNr64Td1YtO0Bm/6KwTP2B0QE/VRIHgyoKeJbiK5kp63iL8dEFHacNXTQ+KgVk+fDxYY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Byj3KT+hIr6Eh58CPyVzrMbCouOd1fxsSx9SZui66O7geR9I3P68wLLQM34/clrktIfil6QrUs2JYBlEMMvGZGnrSL24G7P0MMFzYYXmFcgQLGBOYwCEobA6PzYfoux0JTm2SW4AuWLXuyiVX5TKaa1f8H08UyFSwWDQPRChIm1Bzie9ccqCxm/2wh9zR4MMN7rUm4aLP/+VD6n0Ou4P2SAJ/zCWCFN5I/LseMQem8fFvGCbvzHAvE9hlyFY6EkLaWweWjxYCfdOXgylpGzzDyQIQX9M7LWi++GiR3QevzzOG1vTkOvWB0Ahwl5GQUvZUS7NNzuf5kqN2bQdj6REsoL25UhipLdK4+Z1zKf/GtzhjTs3M+XADjsiDyPi7bdfnHw38UsYAoi6jzGU/F1Px10ao1a0yuoPoUrnwDQdMi8Mj+qaOUYfhNDMm9XtmSZK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 21:32:48.9193 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f78005a2-3e64-4cd9-bdcc-08de7a359548
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8963
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
X-Rspamd-Queue-Id: 7C45420801E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:mid,gitlab.freedesktop.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Hi Dave, Simona,

New stuff for 7.1.

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-7.1-2026-03-04

for you to fetch changes up to c5d8df53b620eb094855a2bd88be89c4bdf7a031:

  drm/amdgpu: Fix mutex handling in amdgpu_benchmark_do_move() v3 (2026-03-04 11:50:56 -0500)

----------------------------------------------------------------
amd-drm-next-7.1-2026-03-04:

amdgpu:
- FAMS2 updates
- Refactor DC I2C
- Rework ttm handling to allow for multiple engines
- UserQ updates
- Ring reset improvements
- DC DCE 6.x cleanups
- DC support for NUTMEG and TRAVIS DP bridges
- Enable DC by default on CIK APUs
- Add DCN 4.2 support
- IPS fixes
- Overlay fixes for DCN4
- SDMA Limit updates
- Misc fixes
- RAS updates
- Register access callback rework
- GC 12.1 updates

amdkfd:
- Misc cleanups

UAPI:
- UserQ fence IOCTL parameter size fixes.  The change is backwards compatible on LE, but not BE.
  UserQs are still not considered stable and are disabled by default.

----------------------------------------------------------------
Alex Deucher (12):
      drm/amdgpu: don't call drm_sched_stop/start() in asic reset
      drm/amdgpu: remove some retired module parameters
      drm/amdgpu: add a helper to calculate ring distance
      drm/amdgpu: reorder IB schedule sequence
      drm/amdgpu: rework ring reset backup and reemit v9
      drm/amdgpu/sdma4.0: adjust SDMA limits
      drm/amdgpu/sdma4.4: adjust SDMA limits
      drm/amdgpu/sdma5.2: adjust SDMA limits
      drm/amdgpu/sdma6.0: adjust SDMA limits
      drm/amdgpu/sdma7.0: adjust SDMA limits
      drm/amdgpu/sdma7.1: adjust SDMA limits
      drm/amdkfd: fix CWSR trap handler

Alex Hung (5):
      drm/amd/display: Use mpc.preblend flag to indicate 3D LUT
      drm/amd/display: Enable DEGAMMA and reject COLOR_PIPELINE+DEGAMMA_LUT
      drm/amd/display: Remove redundant initializers
      drm/amd/display: Remove always-false branches
      drm/amd/display: Prevent integer overflow when mhz to khz

Alysa Liu (1):
      drm/amdgpu: Fix use-after-free race in VM acquire

Andrew Martin (1):
      drm/amdkfd: Removed commented line for MQD queue priority

Asad Kamal (1):
      drm/amd/pm: Avoid overflow when sorting pp_feature list

Aurabindo Pillai (1):
      drm/amd/display: Add atomfirmware cap for DP++ Type2

Bart Van Assche (2):
      drm/amdgpu: Unlock a mutex before destroying it
      drm/amdgpu: Fix locking bugs in error paths

Charlene Liu (1):
      drm/amd/display: Fix dcn401_optimize_bandwidth

Clay King (1):
      drm/amd/display: Silence unused variable warning

Colin Ian King (1):
      drm/amd/display: remove extra ; from statement, remove extra tabs

Cruise Hung (1):
      drm/amd/display: Fix DPIA number and driver ID field issue

Dillon Varone (2):
      drm/amd/display: Refactor fams2 calculations
      drm/amd/display: Fallback to boot snapshot for dispclk

Dmytro Laktyushkin (1):
      drm/amd/display: Add gpuvm and hvm params to dml21

Dominik Kaszewski (2):
      drm/amd/display: Refactor and fix link_dpms I2C
      drm/amd/display: Refactor and fix link_dpms info

Gaghik Khachatrian (1):
      drm/amd/display: Silence type mismatch warning

Gangliang Xie (13):
      drm/amd/pm: add pmfw eeprom messages into uniras interface
      drm/amd/pm: add feature query interface for uniras
      drm/amd/ras: add pmfw eeprom smu interfaces
      drm/amd/ras: add uniras smu feature flag init func
      drm/amd/ras: add wrapper funcs for pmfw eeprom
      drm/amd/ras: Add table reset func for pmfw eeprom
      drm/amd/ras: add check safety watermark func for pmfw eeprom
      drm/amd/ras: add append func for pmfw eeprom
      drm/amd/ras: add read func for pmfw eeprom
      drm/amd/ras: adapt page retirement process for pmfw eeprom
      drm/amd/ras: add initialization func for pmfw eeprom
      drm/amd/ras: add check func for pmfw eeprom
      drm/amd/ras: adapt sync info func for pmfw eeprom

Ivan Lipski (2):
      drm/amd/display: Fix cursor pos at overlay plane edges on DCN4
      drm/amd/display: Initialize replay_state to PR_STATE_INVALID

Jesse.Zhang (4):
      drm/amdgpu: add mqd_update callback to AMDGPU user queue interface
      drm/amdgpu: Add CU mask support for MQD properties
      drm/amdgpu/gfx11: add CU mask support for compute MQD initialization
      drm/amdgpu/gfx12: add CU mask support for compute MQD initialization

Jinzhou Su (5):
      drm/amd/ras: Add address check structure
      drm/amd/ras: Add convert retired address structure
      drm/amd/ras: Handle address check in SR-IOV guest
      drm/amd/ras: Add function to convert retired address
      drm/amd/ras: Handle check address validity in SR-IOV

Kees Cook (1):
      drm/amd/ras: Fix type size of remainder argument

Lijo Lazar (18):
      drm/amdgpu: Print full vbios info
      drm/amdgpu: Fix error handling in slot reset
      drm/amdgpu: Move register access functions
      drm/amdgpu: Add smc method to register block
      drm/amdgpu: Add uvd indirect to register block
      drm/amdgpu: Add didt method to register block
      drm/amdgpu: Add gc cac method to register block
      drm/amdgpu: Add se cac method to register block
      drm/amdgpu: Add audio method to register block
      drm/amdgpu: Add pciep method to register block
      drm/amdgpu: Add pcie indirect to register block
      drm/amdgpu: Add pcie ext access to register block
      drm/amdgpu: Add pcie64 indirect to register block
      drm/amdgpu: Add pcie64 extended to register block
      drm/amdgpu: Move pcie lock to register block
      drm/amdgpu: Add smn callbacks to register block
      drm/amdgpu: Use get_smn_base in aqua_vanjaram
      drm/amd/pm: Add pm firmware info to dmesg log

Mario Limonciello (1):
      drm/amd: Disable MES LR compute W/A

Muaaz Nisar (1):
      drm/amd/display: Add Visual Confirm Support for Testing

Natalie Vock (1):
      drm/amd/display: Use GFP_ATOMIC in dc_create_stream_for_sink

Ovidiu Bunea (2):
      drm/amd/display: Exit IPS w/ DC helper for all dc_set_power_state cases
      drm/amd/display: Add missing clock types & fix formatting

Philip Yang (1):
      drm/amdgpu: GFX12.1 scratch memory limit up to 57-bit

Pierre-Eric Pelloux-Prayer (12):
      drm/amdgpu: remove gart_window_lock usage from gmc v12_1
      drm/amdgpu: statically assign gart windows to ttm entities
      drm/amdgpu: add amdgpu_ttm_buffer_entity_fini func
      drm/amdgpu: add amdgpu_gtt_node_to_byte_offset helper
      amdgpu/vce: use amdgpu_gtt_mgr_alloc_entries
      amdgpu/ttm: use amdgpu_gtt_mgr_alloc_entries
      amdgpu/gtt: remove AMDGPU_GTT_NUM_TRANSFER_WINDOWS
      drm/amdgpu: add missing lock in amdgpu_benchmark_do_move
      drm/amdgpu: check entity lock is held in amdgpu_ttm_job_submit
      drm/amdgpu: double AMDGPU_GTT_MAX_TRANSFER_SIZE
      drm/amdgpu: introduce amdgpu_sdma_set_vm_pte_scheds
      drm/amdgpu: move sched status check inside amdgpu_ttm_set_buffer_funcs_status

Roman Li (8):
      drm/amd/display: Add dcn42 version identifiers
      drm/amd/display: Add dcn42 register headers
      drm/amd/display: Add dcn42 DC resources
      drm/amd/display: Add DMUB support for dcn42
      drm/amd/display: Enable dcn42 DMUB
      drm/amd/display: Enable dcn42 DC
      drm/amd/display: Enable dcn42 in DM
      drm/amdgpu/discovery: Enable DM for DCN42

Simon Louis (1):
      drm/amdgpu: Add xgmi link status for VFs

Srinivasan Shanmugam (5):
      drm/amdgpu: Make amdgpu_fence_emit() non-failing v2
      drm/amdgpu: Make amdgpu_vm_flush() non-failing in submission path
      drm/amd/display: Fix kdoc formatting in dcn42_hwseq.c
      drm/amdgpu: Drop redundant syncobj handle limit checks in userq ioctls
      drm/amdgpu: Fix mutex handling in amdgpu_benchmark_do_move() v3

Sunil Khatri (6):
      drm/amdgpu: add upper bound check on user inputs in signal ioctl
      drm/amdgpu: add upper bound check on user inputs in wait ioctl
      drm/amdgpu/userq: change queue id type to u32 from int
      drm/amdgpu: update type for num_syncobj_handles in drm_amdgpu_userq_signal
      drm/amdgpu: update type for num_syncobj_handles in drm_amdgpu_userq_wait
      drm/amdgpu/userq: refcount userqueues to avoid any race conditions

Taimur Hassan (4):
      drm/amd/display: Promote DC to 3.2.370
      drm/amd/display: [FW Promotion] Release 0.1.48.0
      drm/amd/display: Promote DC to 3.2.371
      drm/amd/display: Promote DC to 3.2.372

Tao Zhou (3):
      drm/amdgpu: compatible with specific RAS old eeprom format
      drm/amdgpu: clear related counter after RAS eeprom reset
      drm/amd/ras: make MCA IPID parse global

Timur Kristóf (16):
      drm/amd/display: Use dce_audio_create for DCE 6
      drm/amd/display: Delete unused dce_clk_mgr.c
      drm/amd/display: Remove unused dce60_clk_mgr register definitions
      drm/amd/display: Handle DCE 6 in dce_clk_mgr.c
      drm/amd/display: Handle DCE 6 in dce110_register_irq_handlers
      drm/amd/display: Add color depth helper function to BIOS parser
      drm/amd/display: Refactor DAC load detection, move to HWSS
      drm/amd/display: Implement BIOS parser external encoder control
      drm/amd/display: Implement DDC probe over AUX channel
      drm/amd/display: Add ability for HWSS to prepare the DDC before use
      drm/amd/display: Use preferred DP link rate if specified
      drm/amd/display: Add DCE HWSS support for external DP bridge encoders
      drm/amd/display: Link detection for external DP bridge encoders
      drm/amd/display: Use external DP bridge encoders
      drm/amd/display: Implement DAC load detection on external DP bridge encoders
      drm/amdgpu: Use DC by default on CIK APUs

Tvrtko Ursulin (11):
      drm/amdgpu: Remove a few holes from struct amdgpu_ctx
      drm/amdgpu: Remove duplicate struct member
      drm/amdgpu/userq: Use memdup_array_user in amdgpu_userq_wait_ioctl
      drm/amdgpu/userq: Use memdup_array_user in amdgpu_userq_signal_ioctl
      drm/amdgpu/userq: Fix reference leak in amdgpu_userq_wait_ioctl
      drm/amdgpu/userq: Do not allow userspace to trivially triger kernel warnings
      drm/amdgpu/userq: Consolidate wait ioctl exit path
      drm/amdgpu/userq: Use drm_gem_objects_lookup in amdgpu_userq_signal_ioctl
      drm/amdgpu/userq: Use drm_gem_objects_lookup in amdgpu_userq_wait_ioctl
      drm/amdgpu: Reject impossible entities early
      drm/amdgpu: Remove redundant missing hw ip handling

Yang Wang (1):
      drm/amd/pm: remove invalid gpu_metrics.energy_accumulator on smu v13.0.x

YiPeng Chai (2):
      drm/amd/ras: use dedicated memory as vf ras command buffer
      drm/amdgpu: Fix static assertion failure issue

Yujie Liu (3):
      drm/amdgpu: fix kernel-doc warning for amdgpu_ttm_alloc_mmio_remap_bo()
      drm/amd/ras: fix kernel-doc warning for ras_eeprom_append()
      drm/amd/pm: fix kernel-doc warning for smu_msg_v1_send_msg()

sguttula (3):
      drm/amdgpu/vcn5: Add SMU dpm interface type
      drm/amdgpu: Enable DPG support for VCN5
      drm/amdgpu/psp: Use Indirect access address for GFX to PSP mailbox

 drivers/gpu/drm/amd/amdgpu/Makefile                |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   154 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c      |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |     7 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |     9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h            |    13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |     8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   831 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |     1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    20 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |   116 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |    49 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |     2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |    56 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |     6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c         |    12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    50 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |     3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c     |   959 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.h     |   163 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |    46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    42 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   157 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |    31 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |   116 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |     6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |   234 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |    18 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h            |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    45 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |     2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |    15 +-
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |    25 +-
 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |    21 +-
 drivers/gpu/drm/amd/amdgpu/atom.c                  |    28 +-
 drivers/gpu/drm/amd/amdgpu/cik.c                   |    52 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c              |    31 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |    12 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |    12 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |    12 +-
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c               |    20 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    33 +
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |    33 +
 drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |    10 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c             |     2 -
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |     5 -
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |     5 -
 drivers/gpu/drm/amd/amdgpu/nv.c                    |    32 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |     2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v15_0.c             |    20 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |    31 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |    31 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |    54 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |    39 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    31 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    35 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |    33 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |    33 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c             |    33 +-
 drivers/gpu/drm/amd/amdgpu/si.c                    |    66 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c                |    31 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    68 +-
 drivers/gpu/drm/amd/amdgpu/soc15.h                 |     1 -
 drivers/gpu/drm/amd/amdgpu/soc15_common.h          |    31 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    36 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c                 |    18 +-
 drivers/gpu/drm/amd/amdgpu/soc_v1_0.c              |    26 +-
 drivers/gpu/drm/amd/amdgpu/vce_v1_0.c              |    33 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |     4 +
 drivers/gpu/drm/amd/amdgpu/vi.c                    |    76 +-
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm |     3 -
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |    35 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |    12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |     1 -
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |     1 -
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |     1 -
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c   |     1 -
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12_1.c |     1 -
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |     1 -
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |     1 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   219 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |     6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c  |     3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |    16 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |     9 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |    11 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |    46 +-
 .../gpu/drm/amd/display/dc/bios/command_table.c    |   124 +-
 .../amd/display/dc/bios/command_table_helper2.c    |     1 +
 drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |    23 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    14 +-
 .../amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c    |    64 +-
 .../amd/display/dc/clk_mgr/dce60/dce60_clk_mgr.c   |   166 -
 .../drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c   |    14 +-
 .../amd/display/dc/clk_mgr/dcn42/dcn42_clk_mgr.c   |  1152 +
 .../amd/display/dc/clk_mgr/dcn42/dcn42_clk_mgr.h   |    79 +
 .../drm/amd/display/dc/clk_mgr/dcn42/dcn42_smu.c   |   431 +
 .../drm/amd/display/dc/clk_mgr/dcn42/dcn42_smu.h   |   190 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   157 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |    60 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |     7 +
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |     4 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    17 +-
 drivers/gpu/drm/amd/display/dc/dc_bios_types.h     |     6 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |     4 +-
 drivers/gpu/drm/amd/display/dc/dc_helper.c         |     2 +
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |    73 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |     6 +-
 drivers/gpu/drm/amd/display/dc/dccg/Makefile       |    11 +-
 .../gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.h |    15 +-
 .../gpu/drm/amd/display/dc/dccg/dcn42/dcn42_dccg.c |   278 +
 .../gpu/drm/amd/display/dc/dccg/dcn42/dcn42_dccg.h |   263 +
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.h       |    60 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |   131 -
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.h     |     9 -
 drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c   |   966 -
 drivers/gpu/drm/amd/display/dc/dio/Makefile        |    11 +-
 .../display/dc/dio/dcn10/dcn10_stream_encoder.h    |    10 +-
 .../display/dc/dio/dcn42/dcn42_dio_link_encoder.c  |   205 +
 .../display/dc/dio/dcn42/dcn42_dio_link_encoder.h  |   140 +
 .../dc/dio/dcn42/dcn42_dio_stream_encoder.c        |   522 +
 .../dc/dio/dcn42/dcn42_dio_stream_encoder.h        |   206 +
 .../dc/dml2_0/dml21/dml21_translation_helper.c     |     8 +-
 .../drm/amd/display/dc/dml2_0/dml21/dml21_utils.c  |   205 +-
 .../drm/amd/display/dc/dml2_0/dml21/dml21_utils.h  |     1 +
 .../dml2_0/dml21/inc/dml_top_soc_parameter_types.h |     2 +
 .../amd/display/dc/dml2_0/dml2_dc_resource_mgmt.c  |     6 +-
 .../gpu/drm/amd/display/dc/dml2_0/dml2_wrapper.h   |     1 +
 drivers/gpu/drm/amd/display/dc/dpp/Makefile        |    10 +-
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.h |     5 +-
 .../gpu/drm/amd/display/dc/dpp/dcn42/dcn42_dpp.c   |   333 +
 .../gpu/drm/amd/display/dc/dpp/dcn42/dcn42_dpp.h   |   469 +
 drivers/gpu/drm/amd/display/dc/gpio/Makefile       |    13 +-
 .../amd/display/dc/gpio/dcn42/hw_factory_dcn42.c   |   254 +
 .../amd/display/dc/gpio/dcn42/hw_factory_dcn42.h   |    31 +
 .../amd/display/dc/gpio/dcn42/hw_translate_dcn42.c |   205 +
 .../amd/display/dc/gpio/dcn42/hw_translate_dcn42.h |    36 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c   |     4 +
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c |     4 +
 drivers/gpu/drm/amd/display/dc/hpo/Makefile        |    11 +-
 .../dc/hpo/dcn31/dcn31_hpo_dp_stream_encoder.h     |    10 +-
 .../dc/hpo/dcn42/dcn42_hpo_dp_link_encoder.c       |    93 +
 .../dc/hpo/dcn42/dcn42_hpo_dp_link_encoder.h       |    17 +
 drivers/gpu/drm/amd/display/dc/hubbub/Makefile     |    10 +-
 .../drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.h |     6 +-
 .../drm/amd/display/dc/hubbub/dcn42/dcn42_hubbub.c |   539 +
 .../drm/amd/display/dc/hubbub/dcn42/dcn42_hubbub.h |   268 +
 drivers/gpu/drm/amd/display/dc/hubp/Makefile       |    10 +-
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.h |     8 +-
 .../gpu/drm/amd/display/dc/hubp/dcn42/dcn42_hubp.c |   643 +
 .../gpu/drm/amd/display/dc/hubp/dcn42/dcn42_hubp.h |    79 +
 drivers/gpu/drm/amd/display/dc/hwss/Makefile       |    12 +-
 .../gpu/drm/amd/display/dc/hwss/dce/dce_hwseq.h    |    13 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |    66 +
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |    29 +-
 .../drm/amd/display/dc/hwss/dcn42/dcn42_hwseq.c    |  1472 +
 .../drm/amd/display/dc/hwss/dcn42/dcn42_hwseq.h    |    53 +
 .../gpu/drm/amd/display/dc/hwss/dcn42/dcn42_init.c |   167 +
 .../gpu/drm/amd/display/dc/hwss/dcn42/dcn42_init.h |    11 +
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |    23 +-
 .../drm/amd/display/dc/hwss/hw_sequencer_private.h |     5 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |    24 +-
 .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |    63 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |    10 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |    20 +-
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |     4 +-
 drivers/gpu/drm/amd/display/dc/irq/Makefile        |     9 +
 .../amd/display/dc/irq/dcn42/irq_service_dcn42.c   |   412 +
 .../amd/display/dc/irq/dcn42/irq_service_dcn42.h   |    15 +
 .../gpu/drm/amd/display/dc/link/link_detection.c   |    58 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   640 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |    29 +-
 .../display/dc/link/protocols/link_dp_capability.c |     2 +
 .../amd/display/dc/link/protocols/link_dp_dpia.c   |     2 +-
 .../dc/link/protocols/link_dp_panel_replay.c       |     2 +-
 .../dc/link/protocols/link_edp_panel_control.c     |     8 +-
 drivers/gpu/drm/amd/display/dc/mmhubbub/Makefile   |    10 +-
 .../amd/display/dc/mmhubbub/dcn42/dcn42_mmhubbub.c |    25 +
 .../amd/display/dc/mmhubbub/dcn42/dcn42_mmhubbub.h |    13 +
 drivers/gpu/drm/amd/display/dc/mpc/Makefile        |    10 +-
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c |    13 +-
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h |    10 +-
 .../gpu/drm/amd/display/dc/mpc/dcn42/dcn42_mpc.c   |  1121 +
 .../gpu/drm/amd/display/dc/mpc/dcn42/dcn42_mpc.h   |  1006 +
 drivers/gpu/drm/amd/display/dc/optc/Makefile       |    10 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h |    20 +-
 .../gpu/drm/amd/display/dc/optc/dcn42/dcn42_optc.c |   198 +
 .../gpu/drm/amd/display/dc/optc/dcn42/dcn42_optc.h |   211 +
 drivers/gpu/drm/amd/display/dc/pg/Makefile         |    10 +-
 .../drm/amd/display/dc/pg/dcn42/dcn42_pg_cntl.c    |   648 +
 .../drm/amd/display/dc/pg/dcn42/dcn42_pg_cntl.h    |   175 +
 drivers/gpu/drm/amd/display/dc/resource/Makefile   |    18 +
 .../amd/display/dc/resource/dce60/dce60_resource.c |     2 +-
 .../amd/display/dc/resource/dcn42/dcn42_resource.c |  2337 +
 .../amd/display/dc/resource/dcn42/dcn42_resource.h |   588 +
 .../display/dc/resource/dcn42/dcn42_resource_fpu.c |    47 +
 .../dcn42/dcn42_resource_fpu.h}                    |    17 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |     5 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |    54 +
 drivers/gpu/drm/amd/display/dmub/src/Makefile      |     3 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn42.c  |   752 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn42.h  |   171 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |    64 +-
 .../drm/amd/display/include/bios_parser_types.h    |     2 +
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |     1 +
 drivers/gpu/drm/amd/display/include/dal_types.h    |     1 +
 .../amd/include/asic_reg/dcn/dcn_4_2_0_offset.h    | 17872 +++++
 .../amd/include/asic_reg/dcn/dcn_4_2_0_sh_mask.h   | 67277 +++++++++++++++++++
 .../amd/include/asic_reg/dpcs/dpcs_4_0_0_offset.h  |   142 +
 .../amd/include/asic_reg/dpcs/dpcs_4_0_0_sh_mask.h |   688 +
 .../drm/amd/include/asic_reg/mp/mp_15_0_0_offset.h |    18 +
 drivers/gpu/drm/amd/include/atomfirmware.h         |     1 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |     2 +
 drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c         |    16 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    12 +
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |     2 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |     7 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |     8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |    11 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |     3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |     4 +-
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c   |     3 +
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mp1_v13_0.c |    46 +
 drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_sys.c   |     3 +-
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_virt_ras_cmd.c  |   167 +-
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_virt_ras_cmd.h  |    14 +-
 drivers/gpu/drm/amd/ras/rascore/Makefile           |     3 +-
 drivers/gpu/drm/amd/ras/rascore/ras.h              |    30 +
 drivers/gpu/drm/amd/ras/rascore/ras_aca.c          |    31 +-
 drivers/gpu/drm/amd/ras/rascore/ras_cmd.c          |     9 +-
 drivers/gpu/drm/amd/ras/rascore/ras_cmd.h          |    29 +
 drivers/gpu/drm/amd/ras/rascore/ras_core.c         |    41 +-
 drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c       |     4 +-
 drivers/gpu/drm/amd/ras/rascore/ras_eeprom.h       |     7 -
 drivers/gpu/drm/amd/ras/rascore/ras_eeprom_fw.c    |   520 +
 drivers/gpu/drm/amd/ras/rascore/ras_eeprom_fw.h    |    87 +
 drivers/gpu/drm/amd/ras/rascore/ras_umc.c          |    37 +-
 drivers/gpu/drm/amd/ras/rascore/ras_umc.h          |     2 +
 drivers/gpu/drm/amd/ras/rascore/ras_umc_v12_0.c    |    19 +-
 include/uapi/drm/amdgpu_drm.h                      |     7 +-
 245 files changed, 106761 insertions(+), 4384 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dce60/dce60_clk_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn42/dcn42_clk_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn42/dcn42_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn42/dcn42_smu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn42/dcn42_smu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dccg/dcn42/dcn42_dccg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dccg/dcn42/dcn42_dccg.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dio/dcn42/dcn42_dio_link_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dio/dcn42/dcn42_dio_link_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dio/dcn42/dcn42_dio_stream_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dio/dcn42/dcn42_dio_stream_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn42/dcn42_dpp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dpp/dcn42/dcn42_dpp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/gpio/dcn42/hw_factory_dcn42.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/gpio/dcn42/hw_factory_dcn42.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/gpio/dcn42/hw_translate_dcn42.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/gpio/dcn42/hw_translate_dcn42.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/hpo/dcn42/dcn42_hpo_dp_link_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/hpo/dcn42/dcn42_hpo_dp_link_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/hubbub/dcn42/dcn42_hubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/hubbub/dcn42/dcn42_hubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/hubp/dcn42/dcn42_hubp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/hubp/dcn42/dcn42_hubp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn42/dcn42_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn42/dcn42_hwseq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn42/dcn42_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/hwss/dcn42/dcn42_init.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn42/irq_service_dcn42.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn42/irq_service_dcn42.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/mmhubbub/dcn42/dcn42_mmhubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/mmhubbub/dcn42/dcn42_mmhubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/mpc/dcn42/dcn42_mpc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/mpc/dcn42/dcn42_mpc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/optc/dcn42/dcn42_optc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/optc/dcn42/dcn42_optc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/pg/dcn42/dcn42_pg_cntl.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/pg/dcn42/dcn42_pg_cntl.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/resource/dcn42/dcn42_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/resource/dcn42/dcn42_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/resource/dcn42/dcn42_resource_fpu.c
 rename drivers/gpu/drm/amd/display/dc/{clk_mgr/dce60/dce60_clk_mgr.h => resource/dcn42/dcn42_resource_fpu.h} (78%)
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn42.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn42.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_4_2_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dcn/dcn_4_2_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_0_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/dpcs/dpcs_4_0_0_sh_mask.h
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_eeprom_fw.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_eeprom_fw.h
