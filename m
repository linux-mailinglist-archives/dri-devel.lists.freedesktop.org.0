Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COWVLLptd2nCfQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:35:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DF988E43
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B010910E419;
	Mon, 26 Jan 2026 13:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U9mmoOyW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010019.outbound.protection.outlook.com
 [40.93.198.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313F710E419;
 Mon, 26 Jan 2026 13:35:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVHFeI2T5O7N1sIEkY3QhZLQ7h7sgo2+f+nHMhWIOtjPVepnNINuVenLwh7/5fF06EFzCAZ9OZ8WEHbudE+9ta/hfDdbndgt2gVu0l3WMNKsVEAmMB+VCQrqXBCzM2z9bDXOEN8vShO3lsRFPvzKSFrDlVdWEtkkuG4kTYMSDwyjkrF7TGZyNjWCre2gm9KuOc3WcE3jrqjPcEAkLaJA7xtP2Lb1OI2zMMa/klMC7bT3ZXYFw3UuTxPWTHdfBH6FtYxD7T9Sd70Nte/p6V5jgJl2nKmdY/IrHNAZ7XplImUvBLIR/p5eN6SPpgYVvAh7Iqkp+1b7fmtiWmZa1UWoEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnZx5GF0R6otujKurOg/O/JEpCeLBYWvZq0ikMDGZlY=;
 b=yvIX5+iZA3oxtFKmT79QoPO/qRylS4ynmpgM76YHvO4fWLVj8eK20molXLjTCL+6NekJhm9lsHln9k2ci+nMZ9poe0noUCKTAyw6YdufeSQSQmOrDNHdRUHSf+YFB+jZZoCbz/LZ/ItBZh+HVU8f7JF3HviM73jHSg5UMJgWcYHwr9WawKoW5pI3lky1nCqWNUaaWQqid1IhBBxKvZX4Z2+FZkqPkU2w1UOBPHiReE8MdW9dnPXiIlWNVmbqYKRsI3Avfy4Qap/FO0x1/2RioNGeMlODLsw0YG1oKDBHftKPt51z9FA6zkHI49DvmvXVLZgsMvenu7Ax7XrLWLgTZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnZx5GF0R6otujKurOg/O/JEpCeLBYWvZq0ikMDGZlY=;
 b=U9mmoOyWJM2vZ/0X4+4xqGTC3nKJXjfpB8tOql4xJmnDmnx9AGOG0Uzy7un9RtBRpJfE5/TTPtcXf8mSh0NfNSNpclUStQIFpQp3CgwC+F08wEUredDKYZur/oa8IHbQjWLTT1g352V0fgVWZHpdD0mC60AvthuAY+rZ6HzP7/A=
Received: from MW4P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::23)
 by MN2PR12MB4189.namprd12.prod.outlook.com (2603:10b6:208:1d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Mon, 26 Jan
 2026 13:35:43 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:303:80:cafe::eb) by MW4P223CA0018.outlook.office365.com
 (2603:10b6:303:80::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 13:35:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 13:35:42 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 07:35:41 -0600
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 26 Jan 2026 05:35:39 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: 
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Simona Vetter <simona@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 00/11] drm/amdgpu: preparation patchs for the use all SDMA
 instances series
Date: Mon, 26 Jan 2026 14:34:55 +0100
Message-ID: <20260126133518.2486-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|MN2PR12MB4189:EE_
X-MS-Office365-Filtering-Correlation-Id: a4e52943-3f64-4745-4134-08de5cdfcd87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWlkOTdPWWNFZHJ2dHJTenpKNGZwY2ZnYmFQZFc0OW9kM1duWlNvbFJ0NnRY?=
 =?utf-8?B?cjRTOFZaRTZEa1U0SDdGcFB4MG95TytiM2lhc0s5RTF4N0MwalREKzNYVW93?=
 =?utf-8?B?OVpNMnJoK0JIVXRsS2R3WUg2N25QclNWNnpLd3c0OU1PZ2NMTWZEaUpFOXpP?=
 =?utf-8?B?L0JGSk80L29VSTdQamNUSkxBbmdjS0FVbEpEZUpUMkpwWWFidzRhc0RnbTI5?=
 =?utf-8?B?Q1JlN2RuMjlYeDAyYmwwQS9Bb2ZCQWJ0RGl2bE5meEdLNENiVmxzRXhLbHZ2?=
 =?utf-8?B?Vk9CSmpvWVFyQWgzNEErdHlFZmZPYlNBczhsaWFGb3lJV1pTb1pmaktZTThq?=
 =?utf-8?B?ck1zRWRqK0JiUEdUTFRKUXVWMjVJbVYyT1YyUi8yQ0lZc3RMT2kzbFl1c2RD?=
 =?utf-8?B?WEp4cy8zTEZMK2xJY0JndEh1NVJMcHBDcjhnemFxQ2k4a1dXRGJZSjltNTBq?=
 =?utf-8?B?YnQ0eU40djlZbEdCdjhXOXIyaU95bWdEUElISGE0MVlBbEpKSnBERFhHVUdw?=
 =?utf-8?B?YjJPU25jLzJiaVlncndac0laMEZ4dVBxazZOTVJDR1BzdmRVdmFOZXJZczBu?=
 =?utf-8?B?ZlVSWkpGRWYvK25aT3huZFVISDRaM2lRYTZzZ1plb0dOb2I5WDgxZTBWQjdR?=
 =?utf-8?B?WnVZSEIxanJpZlFOVVB6Y3AzZHBEVzJwVWROdVNqTTkyQTdUdjN5SUUvLy9o?=
 =?utf-8?B?U0ZWelgraXpaOHU1akR0TG13VTRuclgxV2gwd0cvQ2dhUWw3bnIzZ3h4UWQ5?=
 =?utf-8?B?bkVRdWpDamY1U1ZZeFFpOTkyeC9Ka3k1UktBRlpTUzdocytpb2F1bjM1ZjJG?=
 =?utf-8?B?UTViR3VMY0p1aWk3TFBhUngyL3NUQ3pPdXgyaEpva3dDOVp6Z0QyL2QxUnNJ?=
 =?utf-8?B?UzJibmJTc2oxOXhmZ0xDOWpQMjdieTFSb3Mzckt4b3hQa0JRdVJST2grYzZC?=
 =?utf-8?B?TFl1UzBJV1lpYk1sQWYxSFpza1RwQlN1OVhUMlYvUjVlalFMaU14ZTlydFFC?=
 =?utf-8?B?UTFDR0dQNnIzWkt5ZVRKUmJFdXZzRkw1b0tWejFCTVhxWHF1UXAxQ0RiOFZB?=
 =?utf-8?B?K0lydVZLaTRLTzRFY0dJdjNpaXAvT09jSUJHOUJvZHI4ZVJtR0tZRnBoV3dZ?=
 =?utf-8?B?dUJvMFZNR0NHb1NTdk5JWTlIWFBkNzJNcC85djJoTUl0Mjg1aVNjUCtLZDRa?=
 =?utf-8?B?WDlzM2I4eVBjOVdxUWszV1kwazVWTE04R253eEpUcm5xNTRvY0NMNXlLeWQy?=
 =?utf-8?B?WVlzYnIxKzVEY3BOdUtjS3BpbHh1ZHZQOFBoMSs3TCt1REZIQjhUL1F4dks5?=
 =?utf-8?B?cDFmbW9PSDZ1bHlpckNSbDRBTCtGYXlob1NvdUk4QXJtS1pKRDdNL0ZiOVFu?=
 =?utf-8?B?WUw2QmVNbldpOEMwSnlQbDhHbnVGaGJicWRhdEZjYTdLZWJnbm1nbUV1bHNs?=
 =?utf-8?B?RE5XUlQ1YlpSY3lCWXUrUDh1UVE5UDdCdEtqWURKL3ViTU5qVFlYNVZDUDVu?=
 =?utf-8?B?Q29ia1A2QzhVa09ORHUxVk96c0Z2RDJsWFZmTFR5dFE2c3ppRk03SG1pV1pa?=
 =?utf-8?B?QXovZE1KVXJSNnhpWjdMN3hFcnpDNHFZRzRsd0xTanR4eUN1Q1JXVkJ6K1pl?=
 =?utf-8?B?RkpPeWd6cWFaWTdlNHZGa3BDWWhKdllFSHFkcVhLYlI5SEhMdlVBak5DQnpW?=
 =?utf-8?B?UkVTNGNlZ2Jyb21aQjMvTTJNU0JTQWE4SVFjTzN1T2s0UEpsbCtuV2g3SVdm?=
 =?utf-8?B?Sys3UTJMYTg0SGMrcnBzMGtzdkVZem9FNXBYL0pCNHFkK0ZyTnBwSm01Kzlw?=
 =?utf-8?B?MWdSRVpFRS9zc2JMazJ2UWwySHpBcld1RGRETC9pMUNOTWJucGV3d1VPdDdF?=
 =?utf-8?B?VThLSCtUTHUxZ0R3emVLcnI4enRZVTNXNUdkTkwrV2MvcHJhU1ZuWlBGL2cr?=
 =?utf-8?B?ekpRUGxHUi9jbnBBd3EyV3BTZzZOVjc0cXVzUG9OQncwWjlFT1NKZVV0Tmlt?=
 =?utf-8?B?NzgyZW1hbENzK3NaU0UrMTROeC9UdE9JNlVYQkJIU0xUY2NsSkdmYnBTaFFp?=
 =?utf-8?B?SVRITWF6OGVqaTVNOTFkVXJER0pSeDhWN3YyRWMyM3N3NFZheEVrN3FyS1JT?=
 =?utf-8?B?MUNQd2lpNlNHRk5lQkluWjY2TVJ0T2hnczJoelZISlN2OVdsWHRCdTVhRzEv?=
 =?utf-8?Q?LW206yPsH+8HaonQ/L3sCBk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:35:42.7513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e52943-3f64-4745-4134-08de5cdfcd87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:url,amd.com:mid,amd.com:dkim];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 64DF988E43
X-Rspamd-Action: no action

This series is a subset of the "use all SDMA instances" series.
It starts at the first modified patch and ends at the last patch
before the drm/ttm patch that got merged through drm-misc-next.

The main changes from v5 are:
  * split "drm/amdgpu: remove AMDGPU_GTT_NUM_TRANSFER_WINDOWS" into
    3 patches: one modifying vce, one dealing with ttm and one removing
    AMDGPU_GTT_NUM_TRANSFER_WINDOWS.
  * dropped "drm/amdgpu: use larger gart window when possible".

v5:
  https://lists.freedesktop.org/archives/amd-gfx/2026-January/137268.html
v3 of the full series:
  https://lists.freedesktop.org/archives/dri-devel/2025-November/537830.html

Pierre-Eric Pelloux-Prayer (11):
  drm/amdgpu: remove gart_window_lock usage from gmc v12_1
  drm/amdgpu: statically assign gart windows to ttm entities
  drm/amdgpu: add amdgpu_ttm_buffer_entity_fini func
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  23 ++-
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
 drivers/gpu/drm/amd/amdgpu/vce_v1_0.c         |  32 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  12 +-
 24 files changed, 274 insertions(+), 365 deletions(-)

-- 
2.43.0

