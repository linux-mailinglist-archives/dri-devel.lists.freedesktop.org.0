Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBr4NO2gj2kuSAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 23:08:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8828E139BAF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 23:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D348010E841;
	Fri, 13 Feb 2026 22:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4yl93Rkz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011010.outbound.protection.outlook.com [40.107.208.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AEE10E83D;
 Fri, 13 Feb 2026 22:08:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cu1m8zFMjZoqtgxqg9WbaCCb27XV3Yp42zwxUYugL4XFUPFU++rkoSk/YinUwzEhQ4U/kWORYZKrkWFbESkatePYNL82RITfCffrKBE0wqo0iWFqIox/Se++ktab6XeWJRERSp3bsjOtolHOAF8YpTk92joj8sO023mhfVHuGuaP9j83mTDhdAZEtGRgYeLrHPjelX3v/d/edgqCbdOhFwJFD7QkyG/8aFdnk6WYUc5KcP6xLaSbGpv1aoEhHYiCfTpO2MReO2BexQGy+UNydcHNQCXy2dw14mqafQUHj7q/yMLbOO7q2i36IcIxzS8zKkEV0qZnEE5SMyIJqqEFsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3nV4peZQZu/DYQ2xpWD1eYivXoiYQjko+bwQ40X3fQ=;
 b=N7+0Tg8y3w5gd1GaCDLyluRTpP5FU4oDrrQzyTJqiTZrRtOXbBzKYrgI+c8z9aK/iY87AO597xQRiEsts0bmNZplnHpVsp5SRuUhOmRuLxBvQ1aqeO/T411IQUxmdjcTwmAgDwAEV0be6vXCvRLT15A1/LfFOFIjCtrS+WND9Y/sRSvhX2NU9stJSQ4uxHDGZ/dYk5CMkvrohSSiCyP+6cqgx/gnQoUP+J/Dl/d53QIWuLWMNxjyZWhAgg8bpVFnaTB1tpd7CFFeHju4p+C1G64eLsoUIT0J2B2yjtx6B80M8886HOl3caV/qM95BLt7wwTJ8YZ5ctzD1SpoPCQ/Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3nV4peZQZu/DYQ2xpWD1eYivXoiYQjko+bwQ40X3fQ=;
 b=4yl93RkzGORq3Fr5jgZ0FIv6v3AczEfaX2r4SNmojo+qI6lFmFoolOwTQXZNIJNdAWkEVdTf89xj36EaEBc1EI6J1Hm7T9NsGwCjN6v/SodXJN/Xu93/cSykFVvxTA17U7wyu5Sgtwf39oRsmE/Ih5ffm2gzCctkTpMxaDd0EFY=
Received: from BYAPR02CA0048.namprd02.prod.outlook.com (2603:10b6:a03:54::25)
 by DS7PR12MB8370.namprd12.prod.outlook.com (2603:10b6:8:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 22:08:37 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::d8) by BYAPR02CA0048.outlook.office365.com
 (2603:10b6:a03:54::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.13 via Frontend Transport; Fri,
 13 Feb 2026 22:08:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 22:08:36 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 16:08:36 -0600
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 13 Feb 2026 16:08:36 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.20/7.0
Date: Fri, 13 Feb 2026 17:08:25 -0500
Message-ID: <20260213220825.1454189-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|DS7PR12MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: 486a816f-f970-45ba-f4f2-08de6b4c6fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjU0cE1IYjBTUTFDaUJPR2tST0tXWGhSOUtoOFpBcGM0UlZ0cUVNMi95TC91?=
 =?utf-8?B?dDN6bVpqdnZHblJIZnoxUzVJZW1xMFpqT0ZiMXVzZGxtc0JOa1M2eFVoaUNi?=
 =?utf-8?B?MCs4UW5rRFlnOUU5bGl0T0VlSVFlZWxLejI3enZkT1o1ZllZUWtqTkhaZE9w?=
 =?utf-8?B?ajZWcXNNeFBKelUvRDMxSnVleXpCQjhDYzdRVDVTc2EydFpSVGZLMWVzU21J?=
 =?utf-8?B?b0U2bUFXOW9XLzZnMnNrdnk0QndyTEVQTXBHRXM5Z0p5WU9PcTViUGMxeG12?=
 =?utf-8?B?RzhqUHlIbEV2MURtbnZvbFVpcGx5YVZWN2ozaEVpUHEvd00veUNsVmErYU12?=
 =?utf-8?B?bm1rVEZFVVFZcThiQnZQUDlCYjAra0RRTGNva2VZd3l0TjQ1YjE3UzRuMHZM?=
 =?utf-8?B?ekQzNUd2VU83ZlVXYVZXRDRoZ0kvZG13YmRlZHlMRldUYitjVHA1VERFd05V?=
 =?utf-8?B?N3pPOFNVWjZUMG5NUUhCL2hMbGJtZ2ZtZjlYZ2ZDa1ppNjhkTklPR1BmbHhv?=
 =?utf-8?B?TE10a1g5UmtIdXdwTHIxNlZZbVNiS2RxdHRRc3p3VDNBd1FWM3NySC9Wd2Jn?=
 =?utf-8?B?NlMwQzZhaXh2MlpCSnJQUUhqNWU3NVBWRk96c2l1bUxoNVJ6aEtpalp5WG1s?=
 =?utf-8?B?QlJhVnFvSmcySy9walFPeTVpbThoM1FSTzltaTV1S0oyQjhjS2ZscHFQTmFL?=
 =?utf-8?B?UWdWYjVxME83ZHlVejhWVVVDYUZYeU4yUVRuY0ZqNHVuQUdHSnN4QWZPeUNI?=
 =?utf-8?B?Tk1IUng1dTVsMjZRNXExNDFIWUp6QWdNWW1jZDEwU3VEVnQ0UHAvTHlsTXNI?=
 =?utf-8?B?elJ3eGd1OE5UT1BFSEkraXp4S0pBV3lGblA0aHpCRDRiTU9MR1hTMm5jZ2RE?=
 =?utf-8?B?Y2s1dTY4NEsxQU1IUFV2a1ZmY1ZEZDlteG4yOEpDSmZKSjlLNFZoNmh3bmtK?=
 =?utf-8?B?MDBoZU93bkZhMTVPR1MzUTYrQm1nNFYyNE1LZk1EL2k0Z1FwOGp6c1poNFN1?=
 =?utf-8?B?QkVBaU93T2FrSTlzSnRIczV5bTdUZzdLSnV0VlVPeVhiR0ZpZWRsWWV0QVZa?=
 =?utf-8?B?M202TjFPTFlObHFlNUE4ZlRWR0JiQzBUdFZmN25VbDBGTC85TFpHQVRwU1VT?=
 =?utf-8?B?MHMyR2RjYVd5UldCQWREdGY1OGhUeThBUzRKTHBoTTUyMlhGSGJDVEV6cXB5?=
 =?utf-8?B?TFB3anBGcnVpUzJBLy9qbDc4dVk0amtEMkY1Rld5OVk2MGpDcEhXa3NxVHJ3?=
 =?utf-8?B?QnlsZG9UMmk0Y3pIMUlqd1JiTW14S0dOcUtvdFI2YzB3MWZxa1hOaUIrbndl?=
 =?utf-8?B?aTVmN254K3M2YWVzUzI4THNUMFdJdHlXUkd6Mm4yOFRvNnhsdFE5bC81VUdE?=
 =?utf-8?B?NE40STdHT2NRMnlNd0drZ1BMZnd5clNrZTdnekNQa2pRdzcxazA5VmsyZDQw?=
 =?utf-8?B?eTh3MlVsek42bjlqMi9HeFdqcnBNbktTTEVWMjJwek1Ball4Qk0rL1FzRjNp?=
 =?utf-8?B?ZkY0R2ZlUTYvSnhiOUx4S0RMMmxLMDRta2NRSHF6TjdPcHdNLzhHOEttVHpZ?=
 =?utf-8?B?YXpORUtLS054U1JJYmJDK1FCNVVlQ01OSjJnR0VRVUlsNkZIU0pZSG00ZTcw?=
 =?utf-8?B?UVl3OHRLd3FxTUoxclFLdHU2aVlxamJ0VUJVM1pyTTBBbStDeFdxamU0Smxm?=
 =?utf-8?B?azdQVWVURzNZYi9KMVYzeXR4Rkh0d1lqZVFXeTNvQlNLeE8ybmliYjhKS0pF?=
 =?utf-8?B?RnBMcWtWakRkRlNKYUl5RWpqcnpjZlpGWVR0YUxBMDVDdG8zbUt0Sml4ZlZK?=
 =?utf-8?B?RE9NQ2V4aitHN3NhaXAybXJTbDlibGpHMFZjbktjKzVOWENQTVJnZW9Xamgw?=
 =?utf-8?B?dTM1ekg0cDlZQmtiNk5sMFY5ZnM0WU1MNXMwQ3FFRlFCZXRUbHNNWnFPRXB6?=
 =?utf-8?B?ZGg2cGx2K29EcGtyV2lqY0tUUm11RXdCOVE3cVVIenFPZ2t0R0gyT3Nlbjdr?=
 =?utf-8?B?WlgxSkZBRUxTamYwNExnRWdEUW1TL3Fuc0V2LzJBaGVnZnRwY0xpU1llcXUv?=
 =?utf-8?B?b0JwRmpLOC9KSVUxRTh3cjM0NGVyZHlZbkNNbURiUm91YTltTmt6bTFpOGYx?=
 =?utf-8?B?RkhxSzdBaWIrbGswY2VXOWx3ZWc4YWpONWE4QlpnQ0JqT0pJbGxiNnFYb3l6?=
 =?utf-8?B?OGc9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FXngSNUUQTXhyyOZw5bUuCIlCpLsqFE+cEbyMLNESJirDjLQCrUdvEGdP2sr+I/E2pQQU2zXJC0KCUeatJVGBBsyoz4LK0K+hU6SYG+JapgM6L3kspoWBN1Gzi5a+m2EC7V93xvYva1YPAv7thyLYOzAder7ZchA+UAIjSJrSqZZQ2TjzEEvkSsShsta4NoM3Rloc0xtBpyS/bx0o+BfTcQ+jYV19BZ6r8UeyvogCjfKnTJs01yJuYR4+y/St+8OgLQgwTccRopWy4HnstuLpVpj2REVAUvqEPcNi+TlVlPI/rFjlpTGIbC4+W7ou7zz/6Jcaq5IRqkOJ8/M3HAFr0Dd+vQt3Y02ui8eTdTZkIEa2pJSvXB/6Y7n65bY6uKvpxr516dRSHGGeI9RalcAr3GUZrE1Wep4EPjdkxtq2Pnf/VVRmK+NQ1R0xkbnCtOC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 22:08:36.9556 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 486a816f-f970-45ba-f4f2-08de6b4c6fcd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8370
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 8828E139BAF
X-Rspamd-Action: no action

Hi Dave, Simona,

Fixes for 6.20/7.0.  A bit bigger due to some fixes for new IPs that landed
earlier this cycle.

The following changes since commit 5028a24aa89a2c91b44964191ee8184e5f5c8cb2:

  drm/amdgpu: Send applicable RMA CPERs at end of RAS init (2026-02-05 17:28:34 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.20-2026-02-13

for you to fetch changes up to fd1fa48b935f22c7d99713bf33846e14a6bb6ab9:

  drm/amdgpu: lock both VM and BO in amdgpu_gem_object_open (2026-02-12 15:24:59 -0500)

----------------------------------------------------------------
amd-drm-next-6.20-2026-02-13:

amdgpu:
- SMU 13.x fixes
- DC resume lag fix
- MPO fixes
- DCN 3.6 fix
- VSDB fixes
- HWSS clean up
- Replay fixes
- DCE cursor fixes
- DCN 3.5 SR DDR5 latency fixes
- HPD fixes
- Error path unwind fixes
- SMU13/14 mode1 reset fixes
- PSP 15 updates
- SMU 15 updates
- RAS fixes
- Sync fix in amdgpu_dma_buf_move_notify()
- HAINAN fix
- PSP 13.x fix
- GPUVM locking fix

amdkfd:
- APU GTT as VRAM fix

radeon:
- HAINAN fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: set family for GC 11.5.4

Alex Hung (1):
      drm/amd/display: Fix the incorrect type in dml_print

Asad Kamal (2):
      drm/amd/pm: Add acc counter & fw timestamp to xcp metrics
      drm/amd/pm: Use U64 for accumulation counter

Bhuvanachandra Pinninti (1):
      drm/amd/display: Refactor virtual directory reorganize encoder and hwss files.

Ce Sun (1):
      drm/amdgpu: Adjust usleep_range in fence wait

Christian König (1):
      drm/amdgpu: lock both VM and BO in amdgpu_gem_object_open

Clay King (1):
      drm/amd/display: bypass post csc for additional color spaces in dal

Gangliang Xie (1):
      drm/amdgpu: return when ras table checksum is error

Kenneth Feng (2):
      drm/amd/pm: use debug port for mode1 reset request on smu 13&14
      drm/amd/pm: send unload command to smu during modprobe -r amdgpu

Leo Li (1):
      drm/amd/display: Increase DCN35 SR enter/exit latency

Leon Huang (1):
      drm/amd/display: Check frame skip capability in Sink side

Lijo Lazar (1):
      drm/amdgpu: Move xgmi status to interface header

Mangesh Gadre (1):
      drm/amdgpu:Add psp v13_0_15 ip block

Muaaz Nisar (1):
      Revert "drm/amd/display: mouse event trigger to boost RR when idle"

Nicholas Carbones (2):
      drm/amd/display: Correct hubp GfxVersion verification
      drm/amd/display: Revert "Migrate DCCG register access from hwseq to dccg component."

Peichen Huang (1):
      drm/amd/display: use enum value for panel replay setting

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: fix sync handling in amdgpu_dma_buf_move_notify

Pratik Vishwakarma (12):
      drm/amdgpu: Load TA ucode for PSP 15_0_0
      drm/amd/swsmu: Add new param regs for SMU15
      drm/amdgpu: Add support for update_table for SMU15
      drm/admgpu: Update metrics_table for SMU15
      drm/amdgpu: Fix set_default_dpm_tables
      drm/amdgpu: Fix is_dpm_running
      drm/amdgpu: Drop unsupported function
      drm/amd: Drop MALL
      drm/amdgpu: enable mode2 reset for SMU IP v15.0.0
      drm/amd: Add CG/PG flags for GC 11.5.4
      drm/amd/smu: Fix User mode stable P-states SMU15
      drm/amd/swsmu: Move IP specific functions

Ray Wu (1):
      drm/amd/display: Parse all extension blocks for VSDB

Roman Li (1):
      drm/amd/display: Make GPIO HPD path conditional

Siwei He (1):
      drm/amdkfd: Fix APU to use GTT, not VRAM for MQD

Srinivasan Shanmugam (4):
      drm/amd/display: Fix dc_link NULL handling in HPD init
      drm/amdgpu: Fix missing unwind in amdgpu_ib_schedule() error path
      drm/amdkfd: Fix watch_id bounds checking in debug address watch v2
      drm/amd/display: Fix out-of-bounds stream encoder index v3

Taimur Hassan (2):
      drm/amd/display: [FW Promotion] Release 0.1.46.0
      drm/amd/display: Promote DC to 3.2.369

Timur Kristóf (1):
      drm/amd/display: Reject cursor plane on DCE when scaled differently than primary

Tom Chung (1):
      drm/amd/display: Fix system resume lag issue

Vitaly Prosyak (1):
      drm/amd/display: guard NULL manual-trigger callback in cursor programming

Wayne Lin (1):
      drm/amd/display: Avoid updating surface with the same surface under MPO

Yang Wang (1):
      drm/amd/pm: use sysfs_streq for string matching in amdgpu_pm

YiLing Chen (1):
      drm/amd/display: set enable_legacy_fast_update to false for DCN36

decce6 (2):
      drm/radeon: Add HAINAN clock adjustment
      drm/amdgpu: Add HAINAN clock adjustment

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  19 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  22 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  10 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   6 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  15 +-
 drivers/gpu/drm/amd/amdgpu/psp_v15_0.c             |   4 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   3 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |  24 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |  20 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   3 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  27 +++-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |   9 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |   2 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  16 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |  13 --
 drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
 .../gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.c |  54 +------
 .../gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.h |  18 +--
 drivers/gpu/drm/amd/display/dc/dio/Makefile        |   9 ++
 .../dc/{ => dio}/virtual/virtual_link_encoder.c    |   2 -
 .../dc/{ => dio}/virtual/virtual_link_encoder.h    |   0
 .../dc/{ => dio}/virtual/virtual_stream_encoder.c  |   1 -
 .../dc/{ => dio}/virtual/virtual_stream_encoder.h  |   0
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |   4 +-
 .../drm/amd/display/dc/dml2_0/display_mode_util.c  |   2 +-
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c   |  21 ++-
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.h   |   4 +
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c |   6 +-
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c |  35 +++--
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c |  28 ++--
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c |  28 ++--
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   5 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  29 +++-
 .../drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c  |   5 +-
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |   9 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |   5 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |   5 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |   5 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |   3 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   5 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |   4 -
 drivers/gpu/drm/amd/display/dc/link/Makefile       |   3 +-
 .../hwss/link_hwss_virtual.c}                      |   2 +-
 .../hwss/link_hwss_virtual.h}                      |   6 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |   8 +-
 .../dc/link/protocols/link_dp_panel_replay.c       |  14 +-
 .../drm/amd/display/dc/link/protocols/link_hpd.c   |   9 +-
 .../display/dc/resource/dce100/dce100_resource.c   |   2 +-
 .../display/dc/resource/dce120/dce120_resource.c   |   2 +-
 .../amd/display/dc/resource/dcn10/dcn10_resource.c |   2 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |   2 +-
 .../display/dc/resource/dcn201/dcn201_resource.c   |   2 +-
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |   2 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |   2 +-
 .../display/dc/resource/dcn301/dcn301_resource.c   |   2 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |   2 +-
 .../display/dc/resource/dcn314/dcn314_resource.c   |   2 +-
 .../display/dc/resource/dcn315/dcn315_resource.c   |  10 +-
 .../display/dc/resource/dcn316/dcn316_resource.c   |  10 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |  10 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |  10 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |  10 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |  10 +-
 .../amd/display/dc/resource/dcn36/dcn36_resource.c |   4 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |   2 +-
 drivers/gpu/drm/amd/display/dc/virtual/Makefile    |  30 ----
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  15 ++
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   5 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  29 ++--
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |   5 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   7 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   1 -
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v15_0.h       |   2 -
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  23 +--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |   3 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   2 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |   8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  45 +++++-
 drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c     |   8 -
 .../gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_0_ppt.c   | 165 +++++++++++++++++----
 drivers/gpu/drm/radeon/si_dpm.c                    |   5 +
 include/uapi/drm/amdgpu_drm.h                      |   1 +
 91 files changed, 612 insertions(+), 390 deletions(-)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/virtual/virtual_link_encoder.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/virtual/virtual_link_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/virtual/virtual_stream_encoder.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{ => dio}/virtual/virtual_stream_encoder.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{virtual/virtual_link_hwss.c => link/hwss/link_hwss_virtual.c} (98%)
 rename drivers/gpu/drm/amd/display/dc/{virtual/virtual_link_hwss.h => link/hwss/link_hwss_virtual.h} (92%)
 delete mode 100644 drivers/gpu/drm/amd/display/dc/virtual/Makefile
