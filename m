Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NdmKoqxc2liyAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 18:36:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A84F79145
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 18:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA58D10EB84;
	Fri, 23 Jan 2026 17:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gfcCwSFS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011043.outbound.protection.outlook.com [52.101.62.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43D610EB79;
 Fri, 23 Jan 2026 17:36:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGbAB/u/qC03ZVQLk0zc2l7krGpo3pvI/OvL3f4xW7K9CjBjrdKdSmCxwY9mblWPYrfT5oAD77nZQ1Wx8wCGZM9aimN/u1cA9NGqD2hr6SkzM50xxdJeIoUqKzJGUGoZZAlTMKdMYVjUZDAkwg3FGQcFFwpx6yGmBE16KV+q6NPbbkaS68vnhi6IO7QxPCmTM6bx5zzBxlXQPy+Pw4V0X6uyTqEC222wwz8fUAYMGyxtYiPXoK/nRoj9v3SD7HrvLMLFp2OYCsO2qb+J5+nTLqLmE6ROk9yNGtMNa4A96ueUrS2HiuTQ5avNT4gFx5nC0pw9oTKM5blUZtB19ZpEIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjxmKxaCkuIPD5bbXgb+n5reVDops8AhF00bJxWZvrk=;
 b=mAbjSJ2FNnPVbJMgTFXYw+UuITHhNOexDwMiP1TEd89wlfci3vPtC8zPGNRyQHiKsi1Fvh9GdVckaWnOsZDwMA3FZpOURqvx5D4PXwZOwbCTMhEFmYEXRq9+NZSkYG59/VO5wDzrqWB4vNSA2lDogP7yl3y5FJ71Wvb9A3Lr0i8F8/L3/lqtV168zgDfUuQCYdgezlwJ/nV94DMhvWJH9tcr1C038xiTEJtfNO3ksrnD6zXOp2Dc91YZuYjhYg6sxT+u2MP3mnEyUO8LDylS9I5ScSLeee0k1gJAZ3nX6Y2hTD8/69PbgqEeBkoVqObHsbhqvTuNb31/DA1I9oEzRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjxmKxaCkuIPD5bbXgb+n5reVDops8AhF00bJxWZvrk=;
 b=gfcCwSFSVwhRhA4MbKfmWih2fqAjDT0dKHWVpIrXL3TOjcYGi3nl2NWQBpquHZA+um/NpFoLP4k8pjwjRc+GqblKBthtKl2tpN1WIzNVuyFqFRWVox06nfHM20Xj4VvhcklOtgwcys5WOUEwISKo5SBfCm8bem4FAwUD07f+U08=
Received: from DM6PR06CA0091.namprd06.prod.outlook.com (2603:10b6:5:336::24)
 by SJ2PR12MB8652.namprd12.prod.outlook.com (2603:10b6:a03:53a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 17:35:59 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:5:336:cafe::f) by DM6PR06CA0091.outlook.office365.com
 (2603:10b6:5:336::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 17:35:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 17:35:57 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 23 Jan
 2026 11:35:55 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Jan
 2026 11:35:55 -0600
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 23 Jan 2026 11:35:54 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.20
Date: Fri, 23 Jan 2026 12:35:36 -0500
Message-ID: <20260123173537.17221-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: alexander.deucher@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|SJ2PR12MB8652:EE_
X-MS-Office365-Filtering-Correlation-Id: 812f1ca1-21d9-47ba-1ccd-08de5aa5dde6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rm92WFlzbWJlSk03OHdsMEtmdE9XcVhWbTFXUHQ2K2tjUG9IYUlnajVXc3dT?=
 =?utf-8?B?MW0vSzAxYmE2VWZ4VHlMRWV4anYwQkxMaHJPanBNTUMyYlFBZVR1aGJweit6?=
 =?utf-8?B?Q0MvQTNWYmlFQVk0V3dSSmpBWHJLMjZGUGN4WnVxcXFmMWd4T1hmNlBxWldN?=
 =?utf-8?B?Z0t6bFBGZFRId3ZNNHl6MWwzbXN0dk5RUS91Q0RxYkh5d1FubWZtVkhWQmg4?=
 =?utf-8?B?bDdXM2p1N1RzdkJ4L1hvSythRVBNMlFzVEVIYkZ5MFV1V3pHZFBocWt6Wm1n?=
 =?utf-8?B?bG9XYS9CNkZ4Vit4dUQ5SmxsWlhYUDhabGY5VjZUNnlwaWV0bmdhWkxCRmx6?=
 =?utf-8?B?TkkzbkZxUG12eVpOeGlYNWhxMVo2QTRPRW9YV0FMbWhrMEVVbURrTS9vbW90?=
 =?utf-8?B?NTFxZmt6WUN3MldZRERoc1l2SUt4bVF0dkkxeHlPSVg2WGlaOHQzVnc4V1BY?=
 =?utf-8?B?Uk1qdTExeFAxV1U5bWpCd3gxaktZZFprWGlEM3RWVXBCM1VNUCtCSnVwL3hh?=
 =?utf-8?B?aUpWeU1PNWg2ZXBubkM5VG9DSUh6bkRtbmZWWVBXd01EZ3didzkzR0Z0VllG?=
 =?utf-8?B?ZldTNTJNUzc2T3d6cWgzQzU2MzU4QkltM0N4M1RKQWxKUlVVMnNzSnlEYko3?=
 =?utf-8?B?RzV6bnd1Tk1FTDIxQWE0QXUrNTc2QlpzV0dOV0NpYVJMNHIxZXhmT2FQQ2tw?=
 =?utf-8?B?ZU1DYVRHVUpLZzg2K2dXOGwrZTEyNXdmOHJpWWc2bEt0RXpRazk4dzI1amk2?=
 =?utf-8?B?dXd0ZnA5ZldxMG9VUXFyTi8weitIVW5uY1ArM2k3bnkvemg1Q1VlWExuaTg0?=
 =?utf-8?B?MkVhdnNkOTk3ZW9JdmdQNXhmd09sTWtoYVpKc21DSGJ0WEFvWUtodFlMMStE?=
 =?utf-8?B?UXJEcW0zdVBldDBqUDlRd1VJeTVaVnRMSll6cUNLak91TFhPQmo2YkhOb2tY?=
 =?utf-8?B?VkJYUndDNVJKdXk3Yi91cVNITVRKK28xcWtmT25FNUlwdi9OMzdjUjVJTUJz?=
 =?utf-8?B?N3BOWEc4bHk5Ym15eXl2cVEzNThyQmZMZUdPekJaVnlEd1VwWkdmc1BSSk9L?=
 =?utf-8?B?UmMweERUT1JKbktVZ1k1NWRrbFA0Q3lIbHNHOFhJYUd5UDFFZ3hoTzJkamxZ?=
 =?utf-8?B?cFZYbEhxQjRBd2NNdWRMOEVBcTlXbkp2aDFZbkxrSUJVa0g0VEUyWUZzc0FN?=
 =?utf-8?B?YTFram5Md2JTcnVQTmV2aDJkdXR3UklTZXd1MW5GL0RZcFc1YjVJd3A5UlJP?=
 =?utf-8?B?MEIyMWpUTTluYU9jSHJ0N3gwSUp3WERWeHN0MG82cHNSa3NlY2FENXJxWWxE?=
 =?utf-8?B?K2QzdzNXVU5ZMmE0Q012MkEzS1JHV253R2xNalpnTUZXaWJ2NDN6SzQ0dVFj?=
 =?utf-8?B?SFUwTnRNbkZaczBFK0VoY04xc2NSWDg2WWJieWQxZjNnV0duYTVKR2Q1Y2lR?=
 =?utf-8?B?V3RhbmhUQUt1MVlXckNBRUdBTDU1aWNNbW52bmpVOGNxamp0a2NwakoyRDh3?=
 =?utf-8?B?WXdYRXVYRFI5RlZFOHFBNnVvREhzWFBBMmw4OEJqWWpMWk10dDdhWU82R0Fx?=
 =?utf-8?B?RXhyRVVRT1dBZ0VtTkE4ZWY5Tm94NFk3R2lFeERjamdXREVkck1zeWFXRGpj?=
 =?utf-8?B?Y3ZMdDFsdzNSdUVvYzJQQUdITDVMWHA2S0tUd3FwaVFWM2YzdFlrVUFjM0Y4?=
 =?utf-8?B?UW1EMEl3UXN6bmhOUWYwaVBkajFCUkU2YStRM1Q4VjNMVHgrQUVmK1JsN0N6?=
 =?utf-8?B?M3BHRzF4Y0xoRTBEZGYySTNxcnh5QWhFdDdJSmRURnNaZU5GYnloSFdUNHRJ?=
 =?utf-8?B?Q3VMTlVFVFFmUFlLYkROY1E4M0c5L2tzMThhMmdISUVVbnZYWkUrdkhNdXo3?=
 =?utf-8?B?d1pMWEdMOGNDclV0amZHNTI3OHlzSFMwUFBBZGpXczB1WWxFRGJoQTlRc0tn?=
 =?utf-8?B?WFlKdjNvQms0eWZncU5QOXBWVEoyUmlNMGtmck1CdlBLN1JyaVRuRmdveDN3?=
 =?utf-8?B?cURSQXY3dVdBV0cweXlMcC9aNS9aS0hqaW1tL2VhN0ZDeFU5RGRSNGdvNTBj?=
 =?utf-8?B?SFlEKzhSWFArdkJxMVdWVzVpcE9uYWtRc01DSkszT0pYODcxdUNZdlI5a1ZC?=
 =?utf-8?B?QXkwRE0yYjlkSVFnODdMczlvT0hvNkRKWE1BMmNiU2JoT1UzbnNNaEpaZkpl?=
 =?utf-8?B?bFE9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 17:35:57.1354 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 812f1ca1-21d9-47ba-1ccd-08de5aa5dde6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8652
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4A84F79145
X-Rspamd-Action: no action

Hi Dave, Simona,

Fixes for 6.20.

The following changes since commit d62dec8c70934c428f80889c49e09a9d1d93c126:

  Merge tag 'mediatek-drm-next-20260117' of https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux into drm-next (2026-01-19 15:38:43 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.20-2026-01-23

for you to fetch changes up to 1412482b714358ffa30d38fd3dd0b05795163648:

  Revert "drm/amd/display: pause the workload setting in dm" (2026-01-22 11:46:58 -0500)

----------------------------------------------------------------
amd-drm-next-6.20-2026-01-23:

amdgpu:
- GC 12 fix
- UserQ fixes
- Misc error path fixes
- IP discovery fixes
- Misc cleanups
- HDMI fixes
- Documentation update
- Panel replay fixes
- Panel type handling fixes
- DCN 3.1.x fixes
- DC analog display fix
- SMU 6 fixes
- VCN 4.0.3 queue reset fix
- VCN 5.0.1 queue reset fix
- GPUVM TLB flush fix
- RAS fixes
- DC idle optimization fix

amdkfd:
- MQD fix for GC 9.4.3 and 9.5
- GC 11 cooperative launch fix
- GC 12.1 trap handler fixes
- Misc cleanups

radeon:
- Use drm_* logging helpers for VCE

----------------------------------------------------------------
Alex Deucher (6):
      drm/amdgpu/jpeg4.0.3: remove redundant sr-iov check
      drm/amdgpu: fix error handling in ib_schedule()
      drm/amdgpu: add new job ids
      drm/amdgpu: fix type for wptr in ring backup
      drm/amdgpu: rename amdgpu_fence_driver_guilty_force_completion()
      Revert "drm/amd/display: pause the workload setting in dm"

Alex Hung (3):
      drm/amd/display: Check NULL before accessing a variable
      drm/amd/display: Initialize a default to phyd32clk
      drm/amd/display: Remove coverity comments and fix spaces

Charlene Liu (1):
      drm/amd/display: Remove unused code

Gangliang Xie (1):
      drm/amdgpu: mark invalid records with U64_MAX

Ivan Lipski (1):
      drm/amd/display: Clear HDMI HPD pending work only if it is enabled

Jay Cornwall (4):
      drm/amdkfd: Sync trap handler binary with source
      drm/amdkfd: Fix scalar load ordering in gfx12.1 trap handler
      drm/amdkfd: gfx12.1 cluster barrier context save workaround
      drm/amdkfd: gfx12.1 trap handler support for expert scheduling mode

Jesse.Zhang (4):
      drm/amd/amdgpu: Add independent hang detect work for user queue fence
      drm/amdgpu/vcn4.0.3: implement DPG pause mode handling for VCN 4.0.3
      drm/amdgpu/vcn4.0.3: rework reset handling
      drm/amdgpu/vcn5.0.1: rework reset handling

Jiqian Chen (1):
      drm/amdgpu: free hw_vm_fence when fail in amdgpu_job_alloc

Jonathan Kim (1):
      drm/amdkfd: fix gfx11 restrictions on debugging cooperative launch

Lancelot Six (1):
      drm/amdkfd: Do not include VGPR MSBs in saved PC during save

Lijo Lazar (2):
      drm/amd/pm: Fix unneeded semicolon warning
      drm/amdgpu: Avoid excessive dmesg log

Likun Gao (1):
      drm/amdgpu: remove frame cntl for gfx v12

Mario Limonciello (1):
      drm/amd: Update IP versions for Gorgon Point products

Mario Limonciello (AMD) (1):
      drm/amd/display: Detect panel type from VSDB

Mukesh Ogare (1):
      drm/radeon: convert VCE logging to drm_* helpers

Nicholas Kazlauskas (2):
      drm/amd/display: Ensure link output is disabled in backend reset for PLL_ON
      drm/amd/display: Add DMU crash recovery callback to DM

Ovidiu Bunea (1):
      drm/amd/display: Disable FEC when powering down encoders

Peichen Huang (1):
      drm/amd/display: panel inst for monitors

Perry Yuan (1):
      drm/amdgpu: Improve IP discovery checksum failure logging

Philip Yang (1):
      drm/amdkfd: Move gfx9.4.3 and gfx 9.5 MQD to HBM

Ray Wu (1):
      drm/amd/display: Add IPS residency info to debugfs

Runrun Liu (1):
      drm/amd/display: fix misspelling of "minimum" in dc_dsc.c

Taimur Hassan (1):
      drm/amd/display: Promote DC to 3.2.366

Timur Kristóf (7):
      drm/amd/display: Only poll analog connectors
      drm/amd/pm: Fix si_dpm mmCG_THERMAL_INT setting
      drm/amd/pm: Don't clear SI SMC table when setting power limit
      drm/amd/pm: Workaround SI powertune issue on Radeon 430 (v2)
      drm/amd/pm: Return -EOPNOTSUPP when can't read power limit
      drm/amd/pm: Correct comment above power2_cap attributes
      drm/amdgpu: Fix validating flush_gpu_tlb_pasid()

Wang, Sung-huai (2):
      drm/amd/display: Revert "init dispclk from bootup clock for DCN314"
      drm/amd/display: Revert "init dispclk from bootup clock for DCN315"

Wenjing Liu (1):
      drm/amd/display: update memory QoS measurement interface

Yury Norov (1):
      drm/amdkfd: simplify svm_range_unmap_from_gpus()

 Documentation/gpu/amdgpu/apu-asic-info-table.csv   |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   31 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |   70 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |    1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   12 -
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |   11 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           |   11 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  134 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            |   93 +-
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     | 1435 ++++++++++----------
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm |   76 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h             |    3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   23 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |    5 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   25 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   11 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   11 -
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   71 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    6 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |   10 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |  133 +-
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.h |    5 -
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |   90 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.h |    1 -
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   22 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    5 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   35 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    7 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |    1 +
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |    2 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   24 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |    2 -
 .../gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c |    1 -
 .../drm/amd/display/dc/hwss/dcn301/dcn301_init.c   |    1 -
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |   16 +-
 .../gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c |    1 -
 .../drm/amd/display/dc/hwss/dcn314/dcn314_init.c   |    1 -
 .../gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c |    1 -
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |    1 -
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |    1 -
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |    2 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |    1 -
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |   38 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    8 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   28 +-
 .../dc/link/protocols/link_dp_panel_replay.c       |   32 +-
 .../dc/link/protocols/link_edp_panel_control.c     |   15 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   11 +-
 .../drm/amd/display/modules/power/power_helpers.c  |    5 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    2 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |   31 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |    2 +-
 drivers/gpu/drm/radeon/radeon_vce.c                |    5 +-
 65 files changed, 1434 insertions(+), 1188 deletions(-)
