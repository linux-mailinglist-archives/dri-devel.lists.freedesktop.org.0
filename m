Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON2iFfZChWmA+wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 02:25:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0592BF8F3C
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 02:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD5410E218;
	Fri,  6 Feb 2026 01:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U2G6LQy4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013010.outbound.protection.outlook.com
 [40.93.201.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2464410E032;
 Fri,  6 Feb 2026 01:25:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHtfLNmFmMccK+J2p9Qx6nZfjcuVX1gxjHWS5cIT16jfBQMWf8mHT6LBdQeETZ8CsdXn6hc2UTLwOUwwudsyrTZzg+nTjg1m6HqvhUs0BUBTCz5GkWrvsJBVvoUhpQ4vQBFFROKBshNxl66DaR1NKQW+QdZsl3S30FVSQ7uI64f68OhiKY1dhj5eyOt/UX8HdruUrQ/GXBeDQr5twi4MVioj8RMYb16+wGYMsi5f7lBxq8hzeeevyqIC9jBRyQemTTHbC5L0f+0LUycBukPfOPpA4UwADJNbCxjyIeWwCTA2Q2rFyIAnikjH9WodEqX3Kr5iEmc8UmjuR3buAtTfew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqM38XikSAydFqyFbJ/89TJ3HSWKkiA84UXPM635HfU=;
 b=SruMM6ZLiAbwzAxC9SOw+yLP59N+GvmOwAscPFIx0ngCoMrfjTiusEKIN52sFrVbtwWFBnxj7wGKt3QahSxn0bvylgjAJq/NXr3AwLBHN1k7Yv14Up39W3qczHK5HBXm1Z2EZ19FOZJC7J4s6kkDSONtB6AuTjE/H1UV7YjLM1CTr7ZlXwFYxFqhuwojJSnJhhqfw4Q+XalZ0VDsbqqUkymdt0hRwdlPviaDZ4K9ej3/LT+/u6XMAZf+a96FzXXGVipMAOtW2xFJLdPDefcgiwUtkthk+E28kCfxpumfoay1xMLk9E8+zrni1Pbnzhr8TSCtnM4rFuuoJMsOfLwAZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqM38XikSAydFqyFbJ/89TJ3HSWKkiA84UXPM635HfU=;
 b=U2G6LQy40rAnsSctjwdUm1KUdW+Lx4PcHfLNwH7aIVaICtWtLZdg2ZLDqZcyFZzN0hvvyH1I8NJKv1ftUjpUbyTkdOCc/h0GVctLpbFbmJtA/L7gR55435mf4MSBuE1l3TcygKng1O9oXWQ2+avOZO1BdMRDw8zc/VSvBYS6LJs=
Received: from CH5PR04CA0018.namprd04.prod.outlook.com (2603:10b6:610:1f4::29)
 by MW4PR12MB7263.namprd12.prod.outlook.com (2603:10b6:303:226::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 01:24:59 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::15) by CH5PR04CA0018.outlook.office365.com
 (2603:10b6:610:1f4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend
 Transport; Fri, 6 Feb 2026 01:24:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 01:24:58 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Feb
 2026 19:24:57 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 5 Feb 2026 19:24:57 -0600
From: <vitaly.prosyak@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <alexander.deucher@amd.com>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Christian Koenig <christian.koenig@amd.com>
Subject: [PATCH] drm/amd/display: guard NULL manual-trigger callback in cursor
 programming
Date: Thu, 5 Feb 2026 20:24:47 -0500
Message-ID: <20260206012447.105684-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|MW4PR12MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1712b7-1c06-42a7-69bb-08de651e8abc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XLmncyaZNT1OZ4tlKGyIlFeAfDKAig6fcZs7rIctXavSkVJvVlYdF3TmvnZJ?=
 =?us-ascii?Q?k2szlg48caXZInk5oUNFugqds0818EuR+NeOzcCZ15AiyVKW+mv9sgsRb3fQ?=
 =?us-ascii?Q?SPtb+L3+qw7F29Nbc1XftuYKK4EnU12v12DUsivBScQlXSu7W3wDmdRX6AIv?=
 =?us-ascii?Q?FH5EpCJuZE+hUjoTShYIhddZTS1rl5MQ/x5aKMJvIP+n/A/idRqmaHVfLvHh?=
 =?us-ascii?Q?KPErPMzpYLUQ9NrXMati8qMHFywC7h+6uFpDIyjbbi869oa0+kLMa0ymb3i0?=
 =?us-ascii?Q?4To1WAWum0f4VauGkUg9Bwix9qtQ0uKEyzwgSJ5qFLMZED6Jop+U2zglJwO5?=
 =?us-ascii?Q?bu/v5SNACnYnpI2XCntYThpVVm/0//JQOV8Wi8xpTKwVYyXW7YqBQ7iugMsv?=
 =?us-ascii?Q?t+PC0OTClF7XH6JPZFVExYQDW4JnAp1ltUGGW56w8wfYfDaV1QVVp6UBRGws?=
 =?us-ascii?Q?eSkGcn1CyPTbnh6SQ3hKIEKqLoKXdFcvnxxqtEfn4jsl/0T2UXi6Oc0L/cYC?=
 =?us-ascii?Q?or9+T3NBcnbbcsvz3ddgfuXXBKkfdLbewxyVZKsEc6uBbhVq1WNlXMBqGNZt?=
 =?us-ascii?Q?giSXDSxmdvl1MPGcg9MgjM+1w2hH1DmBcw3Dk+VPD5sZy/aw3rX8VteW2MZR?=
 =?us-ascii?Q?zPBJJ7A7kwrxTs9wdX/MzEHkAVfJIHMpKFOXPW2z4pxfZqETXOjtFiTYr4S1?=
 =?us-ascii?Q?qJPXHrLuOEjr+h0qQbwA1P6+PbrSSa29AxjV/zovYaxozmftwqou5jcDjtJ3?=
 =?us-ascii?Q?9OUOEqsVFqZpwYZHXWslv4kpXxovZNo4KMHDW4wfmAw1vQpz66qpkm411TSk?=
 =?us-ascii?Q?ccFdgWkgpy0L+Ox2SvGRKVtDc9buwE8aehbxQx7pE4IJC1aytaZOuzzrBgyo?=
 =?us-ascii?Q?YNyxfP3hCXLZDYSNohCRuLAsclXuTm8s0gKrtaHu4MARTuGwxK3yFRUb+g31?=
 =?us-ascii?Q?atZaqvnZ4fIRTc840QEKHKWT7xwMNBYO9I8WB3AMk8nYuBFfgD2bwWqw99kg?=
 =?us-ascii?Q?Uv6mYBnnefWKDAsPJNsn6UTu9uSc28reXUO6k/nn4HG+hcNDFb5yy5nwtYjV?=
 =?us-ascii?Q?jyvxFyxDwzsH4S7PO26C/5343fMtaWJR2QXBku+U8459wn1bb2xnYwdRJxjK?=
 =?us-ascii?Q?ntgswayPTBsV7pBb/s4CxhQ79tEnpXsReb/1bAJGRU3bTFe7kiKY8cqLRFOw?=
 =?us-ascii?Q?Xc6WwGetrjZaInIu26cjx6Cw9oZxIkZ0cgVt5sjGJl/lY7siA6C2sarOkmzU?=
 =?us-ascii?Q?kjcaZCKa3OfgVN0ESSPpe4HGTZHAF3FOJ+aYfGgqimINd77/wcPI+Bzh35Na?=
 =?us-ascii?Q?MKe7uQHTn8lvRkRHs/Iw6BbiFSFiwCWwqkEkape6r/C8byAgeG7x4xt6Lg9M?=
 =?us-ascii?Q?UCDKs1z9j+j4Xv/uX1MCtQsB5KKlPWwoVjmSp6zEY0gfO/9bGEidFXOAIzk2?=
 =?us-ascii?Q?rMovoUy9RUio5ZNmRHAtStmlpsgeRi4Wn7ekYPCUrUtwFjNG4Q9jeaPduyP4?=
 =?us-ascii?Q?DG97hcer5yjjsSqLiKARgP+fbnsuTl9ltkjX2kbBfWQa6xa9YuHgMnGmhOc6?=
 =?us-ascii?Q?2jUoZ3uiR7FSpzxtmxEYk8BXmv8tOglVr1iSOibEdmxvsoBLjoouqrZEdvl/?=
 =?us-ascii?Q?vJoy9HJthnbnQE4YL+z1wC3cRHA+pUn9t+zJ78C6lOyA?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fl0erm72+hzbO+ONLW3do6Voqiyn9hjI8YGbLwd8He6+stV41qhV5pyS/uqyKuy6xf2I03O5tkWrQtsLMmRTKk9Z89c6io3z4L89M0vIJOP77umyDgDXbhukcUXMYS9NCqewtzYRm68kD0cuk7vwUB4kaEBYfRAKpnyzqv8Icdvx87TXqRJcfQ2xYh+O4N6HcpdIVUPCpAh2k55V5wM9+H188OffaPptjoF0kcr6iVlvK1bh9uUQMcAIWWzBPdTxffXwv0KpzUpRLK0en3JllOeKtqHoL4VkA65LLrl3OSUVjdlDOs0/q9Zw86cyhWVz66aJGELxdAzWy/FO/TbX5tCleGh2nSksn9KfePw7GeJAPzAwXsmjcRHu2MRIQ7dQM3waMuHPH/RGbVSHs3rEoMt8S83MMsvqomSZMa8WquRynJyQKIi/Z5vOquya+JLu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 01:24:58.3431 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1712b7-1c06-42a7-69bb-08de651e8abc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7263
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[vitaly.prosyak@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0592BF8F3C
X-Rspamd-Action: no action

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

KASAN reports a NULL instruction fetch (RIP=3D0x0) from
dc_stream_program_cursor_position():

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  RIP: 0010:0x0
  Call Trace:
    dc_stream_program_cursor_position+0x344/0x920 [amdgpu]
    amdgpu_dm_atomic_commit_tail+...

[  +1.041013] BUG: kernel NULL pointer dereference, address: 00000000000000=
00
[  +0.000027] #PF: supervisor instruction fetch in kernel mode
[  +0.000013] #PF: error_code(0x0010) - not-present page
[  +0.000012] PGD 0 P4D 0
[  +0.000017] Oops: Oops: 0010 [#1] SMP KASAN NOPTI
[  +0.000017] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Tainted: G           =
 E       6.18.0+ #3 PREEMPT(voluntary)
[  +0.000023] Tainted: [E]=3DUNSIGNED_MODULE
[  +0.000010] Hardware name: ASUS System Product Name/ROG STRIX B550-F GAMI=
NG (WI-FI), BIOS 1401 12/03/2020
[  +0.000016] Workqueue: events drm_mode_rmfb_work_fn
[  +0.000022] RIP: 0010:0x0
[  +0.000017] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[  +0.000015] RSP: 0018:ffffc9000017f4c8 EFLAGS: 00010246
[  +0.000016] RAX: 0000000000000000 RBX: ffff88810afdda80 RCX: 1ffff1104570=
00d1
[  +0.000014] RDX: 1ffffffff87b75bd RSI: 0000000000000000 RDI: ffff88810afd=
da80
[  +0.000014] RBP: ffffc9000017f538 R08: 0000000000000000 R09: ffff88822b80=
0690
[  +0.000013] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffffc3db=
ac20
[  +0.000014] R13: 0000000000000000 R14: ffff88811ab80000 R15: dffffc000000=
0000
[  +0.000014] FS:  0000000000000000(0000) GS:ffff888434599000(0000) knlGS:0=
000000000000000
[  +0.000015] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  +0.000013] CR2: ffffffffffffffd6 CR3: 000000010ee88000 CR4: 000000000035=
0ef0
[  +0.000014] Call Trace:
[  +0.000010]  <TASK>
[  +0.000010]  dc_stream_program_cursor_position+0x344/0x920 [amdgpu]
[  +0.001086]  ? __pfx_mutex_lock+0x10/0x10
[  +0.000015]  ? unwind_next_frame+0x18b/0xa70
[  +0.000019]  amdgpu_dm_atomic_commit_tail+0x1124/0xfa20 [amdgpu]
[  +0.001040]  ? ret_from_fork_asm+0x1a/0x30
[  +0.000018]  ? filter_irq_stacks+0x90/0xa0
[  +0.000022]  ? __pfx_amdgpu_dm_atomic_commit_tail+0x10/0x10 [amdgpu]
[  +0.001058]  ? kasan_save_track+0x18/0x70
[  +0.000015]  ? kasan_save_alloc_info+0x37/0x60
[  +0.000015]  ? __kasan_kmalloc+0xc3/0xd0
[  +0.000013]  ? __kmalloc_cache_noprof+0x1aa/0x600
[  +0.000016]  ? drm_atomic_helper_setup_commit+0x788/0x1450
[  +0.000017]  ? drm_atomic_helper_commit+0x7e/0x290
[  +0.000014]  ? drm_atomic_commit+0x205/0x2e0
[  +0.000015]  ? process_one_work+0x629/0xf80
[  +0.000016]  ? worker_thread+0x87f/0x1570
[  +0.000020]  ? srso_return_thunk+0x5/0x5f
[  +0.000014]  ? __kasan_check_write+0x14/0x30
[  +0.000014]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? _raw_spin_lock_irq+0x8a/0xf0
[  +0.000015]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[  +0.000016]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? __kasan_check_write+0x14/0x30
[  +0.000014]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? __wait_for_common+0x204/0x460
[  +0.000015]  ? sched_clock_noinstr+0x9/0x10
[  +0.000014]  ? __pfx_schedule_timeout+0x10/0x10
[  +0.000014]  ? local_clock_noinstr+0xe/0xd0
[  +0.000015]  ? __pfx___wait_for_common+0x10/0x10
[  +0.000014]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? __wait_for_common+0x204/0x460
[  +0.000014]  ? __pfx_schedule_timeout+0x10/0x10
[  +0.000015]  ? __kasan_kmalloc+0xc3/0xd0
[  +0.000015]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? wait_for_completion_timeout+0x1d/0x30
[  +0.000015]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? drm_crtc_commit_wait+0x32/0x180
[  +0.000015]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? drm_atomic_helper_wait_for_dependencies+0x46a/0x800
[  +0.000019]  commit_tail+0x231/0x510
[  +0.000017]  drm_atomic_helper_commit+0x219/0x290
[  +0.000015]  ? __pfx_drm_atomic_helper_commit+0x10/0x10
[  +0.000016]  drm_atomic_commit+0x205/0x2e0
[  +0.000014]  ? __pfx_drm_atomic_commit+0x10/0x10
[  +0.000013]  ? __pfx_drm_connector_free+0x10/0x10
[  +0.000014]  ? __pfx___drm_printfn_info+0x10/0x10
[  +0.000017]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? drm_atomic_set_crtc_for_connector+0x49e/0x660
[  +0.000015]  ? drm_atomic_set_fb_for_plane+0x155/0x290
[  +0.000015]  drm_framebuffer_remove+0xa9b/0x1240
[  +0.000014]  ? finish_task_switch.isra.0+0x15a/0x840
[  +0.000015]  ? __switch_to+0x385/0xda0
[  +0.000015]  ? srso_safe_ret+0x1/0x20
[  +0.000013]  ? __pfx_drm_framebuffer_remove+0x10/0x10
[  +0.000016]  ? kasan_print_address_stack_frame+0x221/0x280
[  +0.000015]  drm_mode_rmfb_work_fn+0x14b/0x240
[  +0.000015]  process_one_work+0x629/0xf80
[  +0.000012]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? __kasan_check_write+0x14/0x30
[  +0.000019]  worker_thread+0x87f/0x1570
[  +0.000013]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[  +0.000014]  ? __pfx_try_to_wake_up+0x10/0x10
[  +0.000017]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? kasan_print_address_stack_frame+0x227/0x280
[  +0.000017]  ? __pfx_worker_thread+0x10/0x10
[  +0.000014]  kthread+0x396/0x830
[  +0.000013]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[  +0.000015]  ? __pfx_kthread+0x10/0x10
[  +0.000012]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? __kasan_check_write+0x14/0x30
[  +0.000014]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? recalc_sigpending+0x180/0x210
[  +0.000015]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? __pfx_kthread+0x10/0x10
[  +0.000014]  ret_from_fork+0x31c/0x3e0
[  +0.000014]  ? __pfx_kthread+0x10/0x10
[  +0.000013]  ret_from_fork_asm+0x1a/0x30
[  +0.000019]  </TASK>
[  +0.000010] Modules linked in: rfcomm(E) cmac(E) algif_hash(E) algif_skci=
pher(E) af_alg(E) snd_seq_dummy(E) snd_hrtimer(E) qrtr(E) xt_MASQUERADE(E) =
nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) xt_mark(E) xt=
_tcpudp(E) nft_compat(E) nf_tables(E) x_tables(E) bnep(E) snd_hda_codec_alc=
882(E) snd_hda_codec_atihdmi(E) snd_hda_codec_realtek_lib(E) snd_hda_codec_=
hdmi(E) snd_hda_codec_generic(E) iwlmvm(E) snd_hda_intel(E) binfmt_misc(E) =
snd_hda_codec(E) snd_hda_core(E) mac80211(E) snd_intel_dspcfg(E) snd_intel_=
sdw_acpi(E) snd_hwdep(E) snd_pcm(E) libarc4(E) snd_seq_midi(E) snd_seq_midi=
_event(E) snd_rawmidi(E) amd_atl(E) intel_rapl_msr(E) snd_seq(E) intel_rapl=
_common(E) iwlwifi(E) jc42(E) snd_seq_device(E) btusb(E) snd_timer(E) btmtk=
(E) btrtl(E) edac_mce_amd(E) eeepc_wmi(E) polyval_clmulni(E) btbcm(E) ghash=
_clmulni_intel(E) asus_wmi(E) ee1004(E) platform_profile(E) btintel(E) snd(=
E) nls_iso8859_1(E) aesni_intel(E) soundcore(E) i2c_piix4(E) cfg80211(E) sp=
arse_keymap(E) wmi_bmof(E) bluetooth(E) k10temp(E) rapl(E)
[  +0.000300]  i2c_smbus(E) ccp(E) joydev(E) input_leds(E) gpio_amdpt(E) ma=
c_hid(E) sch_fq_codel(E) msr(E) parport_pc(E) ppdev(E) lp(E) parport(E) efi=
_pstore(E) nfnetlink(E) dmi_sysfs(E) autofs4(E) cdc_ether(E) usbnet(E) amdg=
pu(E) amdxcp(E) hid_generic(E) i2c_algo_bit(E) drm_ttm_helper(E) ttm(E) drm=
_exec(E) drm_panel_backlight_quirks(E) gpu_sched(E) drm_suballoc_helper(E) =
video(E) drm_buddy(E) usbhid(E) drm_display_helper(E) r8152(E) hid(E) mii(E=
) cec(E) ahci(E) rc_core(E) igc(E) libahci(E) wmi(E)
[  +0.000294] CR2: 0000000000000000
[  +0.000013] ---[ end trace 0000000000000000 ]---

The crash happens when we unconditionally call into the timing generator
manual trigger hook:

  pipe_ctx->stream_res.tg->funcs->program_manual_trigger(...)

On some configurations the timing generator (tg), its funcs table, or the
program_manual_trigger callback can be NULL. Guard all of these before
calling the hook. If the first pipe matching the stream cannot trigger,
keep scanning to find another matching pipe with a valid hook.

Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig  <christian.koenig@amd.com>

Suggested-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/=
drm/amd/display/dc/core/dc_stream.c
index f59020f1a722..ecd08580937d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -522,8 +522,10 @@ bool dc_stream_program_cursor_position(
 			struct pipe_ctx *pipe_ctx =3D &dc->current_state->res_ctx.pipe_ctx[i];
=20
 			/* trigger event on first pipe with current stream */
-			if (stream =3D=3D pipe_ctx->stream) {
-				pipe_ctx->stream_res.tg->funcs->program_manual_trigger(pipe_ctx->strea=
m_res.tg);
+			if (stream =3D=3D pipe_ctx->stream &&
+				pipe_ctx->stream_res.tg->funcs->program_manual_trigger) {
+				pipe_ctx->stream_res.tg->funcs->program_manual_trigger(
+					pipe_ctx->stream_res.tg);
 				break;
 			}
 		}
--=20
2.52.0

