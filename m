Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCKmBvt9e2kQFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:34:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C03DFB17F8
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 16:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93AC810E885;
	Thu, 29 Jan 2026 15:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a8jqkeIz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012000.outbound.protection.outlook.com [52.101.43.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4602F10E0A9;
 Thu, 29 Jan 2026 15:34:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpBO/NcH7lUZs9B6geedcTxFDsq9WAw0pza9qD92qpXHL+mknhlJg380e0Jnai23rKsrqCiEHlkp3BWWlPWYwqSqvhmEsV1ZRIf9YJS8KSmWofZPSd5lHKh3ZKD8J7AKYa+51V7s+w5Wjp9ljzE5LLJOMmg1cG6wppv3axOWp4+rqd3mYy58bx73RhxxU+Lw1YH1WqhxWWUs1uIlaK+sDUO93M6I8nf3o26wNzXg/uG2ciseehsdZqQ+86T2SLav//yBCLRhJXU663T0Cg5cKlc3mA0bU9VHMr8W+gdC/O7bHuNCSQD8AXjIZA4+WfJDbk8/qx3tG/BIU8xZropaSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCPRb2qG/90AoLz9MAL48gr592K+YU6ZnJmJyoDy+mo=;
 b=jQRqx0VF2Fd09+53EMRLiottGC+EJ/6+zQxz2zXxT9gP3uKCNjAe++SsZ3W/XlwfBYGINVBfz/714MJGLvHxG21uWqrnEYwMwBejwPtSc/QmNdk6lfaC49SOWGeTGgh3zWr/1LtaIG043zbauwMIfP4cF9O35nCH4TJHGmvnA7/+tGHFYoQVSmgLeH6cPg52g2nTCJCdZU8Tictdn1FYlfIQj5//VMfFCYVFWv+6mJZj+XrCKCcMhFTxmj1gXRyYOJbhAYBaA1KFnSgIdsr5nJzYXXNoOcMmvP+t6jwnF5aJ3cWRiKriQziIUQW7G+DAmL92A87Bpofulk+ENz7rsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCPRb2qG/90AoLz9MAL48gr592K+YU6ZnJmJyoDy+mo=;
 b=a8jqkeIzO/9vFwY72PdCWoJ7v7ttRn81gHgA+GzRdLbZ7Lgp1bR1XpelbVW3FykUZh3xyTcdNYLFadYntN2U8EA5+LuA/h7NjEw9jnd209E/uJMA/zi3kNcYGmupKbHE6MNs7HMtgtKEw3Ubm4lw3l6nbgQN6eGEjLMrPGqCRmQ=
Received: from BL1P223CA0025.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::30)
 by CYYPR12MB8939.namprd12.prod.outlook.com (2603:10b6:930:b8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 15:34:08 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:2c4:cafe::85) by BL1P223CA0025.outlook.office365.com
 (2603:10b6:208:2c4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Thu,
 29 Jan 2026 15:34:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 15:34:08 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 29 Jan 2026 09:34:06 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: 
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Simona Vetter <simona@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 00/12] drm/amdgpu: preparation patchs for the use all SDMA
 instances series
Date: Thu, 29 Jan 2026 16:33:12 +0100
Message-ID: <20260129153336.7473-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|CYYPR12MB8939:EE_
X-MS-Office365-Filtering-Correlation-Id: 928b0069-e84d-4f70-6945-08de5f4bd7f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3diSkF2MENzQ05hNWczYk9SVVgvS3ZhY3lYYWtxZWNETFRRWmFiaXF3Tmlx?=
 =?utf-8?B?ZGZ4d0JONVZMMjBWWkhLVlc1aUJ5MkQydmdzWUVFMytxdVZiRzZ1SGpKaDRW?=
 =?utf-8?B?U1F3ZlhlcEdkaFhlOFBoV0dpbnNVdE0vRnFhKzRoTTNuQjNHLzE5RGZEMEtk?=
 =?utf-8?B?SmxmaXladWhVMUdjd0JUMzBoRUFxaEhwenNqUURpQnJ6aC93clNIZkpLbHBH?=
 =?utf-8?B?d3VPa0xsYlErV0ZHcWlnZ016N3JhUFp6a1N3WklGTk1UOC9sd2tzdGlmc1Jx?=
 =?utf-8?B?bmd2REFuSFhkbXdjNU5EUURyWFlpNk1HMTA0NHZPSGZMR09WKzlXZEdabWpU?=
 =?utf-8?B?ZlJpdUMzcWRab1ZTeXBJVTNpb1hkS2hzRWQ0TDN3Y0dLOUxjK0JwQVhsL2p4?=
 =?utf-8?B?ZGJRY21EQ1FHSmc3aVNmaTRQL3lwNzlrdHpENTdmUU9VRTFxZFZtbVZMa2xq?=
 =?utf-8?B?SjNJK2VTV3NMaks1WU8vRTBZSUJCMzBjL2lYWkw2QmRhZXBQY0Nna3Bsd1By?=
 =?utf-8?B?Wld5MkM2ZjN0cWNVUzBMMFJ6QUdUVlM5aVhVZzVTc090Slk0bk9rN2hmWWdV?=
 =?utf-8?B?QUgxOGJNZU5oeWp6dm01dHdNcDlERkdUTUR1WFU5Vk5vdzRQVmh3d3cyR2Zz?=
 =?utf-8?B?SytLMnEvbWozNDJ3MFYzRXlwRER3bGRxSm0waVFKd040amM3c1hTeXhLSFlp?=
 =?utf-8?B?NE1CQUNSVmtuckZNNWU1TTZwV3h5aHBtTzFja2ZZeUJ6QisvOWV0YVNiaHhN?=
 =?utf-8?B?UzNxMTBnelZrUGlhQ0xoV1R3UmVRL1BWZjJwRjdkVWgyazV6VGpnQjBETHNG?=
 =?utf-8?B?dGdVL1BxWkxROUxkZThzVnRaT1RYZUdBT2hJVlUzdGh0U3RoTUxXNnVad1JE?=
 =?utf-8?B?VktudkN6RktMS29JdGFCUjFBd0FVZGpCaWVMTW9YZ1RMak5FendFSVp3ZzRm?=
 =?utf-8?B?NVZUYUIvNkRXMmpQRDM4dklnNkcrUm1aazBsck1TbC9IZEwwN3lESG9VRnEx?=
 =?utf-8?B?L2J2c1ErdlZFY2thODduMU1Tenk3SWZYaldndGNsTXd6S0xBc3FYRjIrVVVO?=
 =?utf-8?B?Tms3Vk41NEt5WFZ2WnJLSnA4SThJbkErUllSQ2lUMWVmRHNUQWFXekdFMjVC?=
 =?utf-8?B?VkliWURWYkhhbkExOGdFQzRVaG9XN0dTOGx2VTVSOS9rMWVMNlBEQmdJM044?=
 =?utf-8?B?ekNObjJnQVE5K2I4TVB3THBCdTUzQnF0VzFSdFBrcnlwTFNPZThIUWRWbVE2?=
 =?utf-8?B?SE12bXhGQWI5TkJ6aTRKSW9QNFg5Q2F3SGNXVm5uV2VKTG5tYkdVdnc5MmdJ?=
 =?utf-8?B?UlN6UmtVZXF6aDI0b2c1ZmpySUVwSW5xOWVrNkZIV09EakZiTTBUdXkxa2hJ?=
 =?utf-8?B?MEZ5Q2syZlprbC9hRXYrWnRtU1FzSlBSZnJyQlh4ek1iWHpQeldyL2kvRHVv?=
 =?utf-8?B?NEF4RkFmWXQ1V040clVrNThOWTlTTlp4dFVtdGZycS9SNVh3SGpwbkxIMk5j?=
 =?utf-8?B?alJTUjNOa2gzUkMxSW5WTnMvY3d6Zmt3ZkMwQi9sN1BXVEcvOGV0ZHRJN0NT?=
 =?utf-8?B?WHFVamcvNWVsK2ZMYkFzU1JSbnViVW1PenJFS0FFQnp2RXNkMHJlRkN1MVBo?=
 =?utf-8?B?cGxjNzc1ZG1wVWZPcnhaeWhMZDJwWHNnZ2tHTkM2b0lsQlBQL3NLY1hicHhN?=
 =?utf-8?B?UTdFV3NTZ1h3ZWNmTVBWbjI4dmsrYzBmVFRpMzBxbGJSSmZIampTazVQc1pE?=
 =?utf-8?B?b2FXNGJMWU1IbmN6OGxsaHZ2ZG5EeWtKTmg4STBMTEFCcE9YK1lmaU16Vlph?=
 =?utf-8?B?OTZ1SkpkdGZoSEFqNFVWZUJ0MmVVUzNVTnlhaXhhUlhOZGRZODhIeTFKakR6?=
 =?utf-8?B?T0taOHpZbGRGdVp4eDByc2FiQkNyRllkL1VtVFpyWlFtWjJSTktqSkNmaW9s?=
 =?utf-8?B?cUd6YnNSM1NLZmM0WUlUSmVBZU9zN2NoV1RSRGxHSlovbVlGR2pBYm5Ld29k?=
 =?utf-8?B?NEJLSUxFTEplSUJBUmJSUno4cEdFUFRkNVV5WUlFSURRZ1JVVXVtWDVhbUtx?=
 =?utf-8?B?V21wdldIOU51REZxNmRVOFlRMmFSSHdDY1l3K2NQbUF5MWExKytrd0Z0QjVy?=
 =?utf-8?B?NC9xNUY3QnVyTWR2OEtodkt1L2VLcytHaHlGNm1qYVJwYkV5TVpRNHNSUEFZ?=
 =?utf-8?Q?GrU/Rvjn1VZNgLjrVTAViSk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ahe7UpV9Og3e5B7au7hODe61pbfBxSpBLOIDPMMtQfOjGreZfJ55sGbK5lz4wRgIRrXU+ObJHvL8utiqmsBi+dIJwHhtO5czL+krTjQ/S1oiLkU9x5IM+2uwXsj8YEe7IocZIUrXEYcPQie0TL1nfvj23oFftWyRk0IYQkCc6JHKtP9HdGaf2ez9N1ztUXg7zUT9CV9lxzvx6wjtA/MiFnW9zVPCoxhUfZXp9PHC0n6qSd9chzuO8SR+/P5AthIoVuIY5/52Cv2KX8jENLaBWetgXMfytY6hy3Bhc5FvScAAQUSxuM95Zg3jr536+gWOYECBD+P9NenyIz7Z7SidRypWB80LBqXJM4Q09BesHRNA8gRFkTRYereuDG+99eeXpEx8k41x6KHwhe+ffJ98wxF92IgeP1SCMZZnh/utiZjpr2YFdtmfQ5zITbkQXhZk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:34:08.2800 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 928b0069-e84d-4f70-6945-08de5f4bd7f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8939
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C03DFB17F8
X-Rspamd-Action: no action

This series is a subset of the "use all SDMA instances" series.
It starts at the first modified patch and ends at the last patch
before the drm/ttm patch that got merged through drm-misc-next.

The main changes from v6 are:
  * new commit adding amdgpu_gtt_node_to_byte_offset helper
  * variables renaming in commits 5 and 6

v6:
  https://lists.freedesktop.org/archives/amd-gfx/2026-January/137446.html
v3 of the full series:
  https://lists.freedesktop.org/archives/dri-devel/2025-November/537830.html

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
  drm/amdgpu: move sched status check inside
    amdgpu_ttm_set_buffer_funcs_status

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 161 ++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  31 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c       |  18 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  17 ++
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c         |  31 +---
 drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c        |   2 -
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c        |  31 +---
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c        |  31 +---
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  35 +---
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |  35 +---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  31 +---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  31 +---
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |  29 +---
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c        |  29 +---
 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c        |  29 +---
 drivers/gpu/drm/amd/amdgpu/si_dma.c           |  31 +---
 drivers/gpu/drm/amd/amdgpu/vce_v1_0.c         |  33 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  12 +-
 24 files changed, 282 insertions(+), 366 deletions(-)

-- 
2.43.0

