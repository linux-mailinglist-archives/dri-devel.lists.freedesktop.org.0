Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOXWGk/Qe2m0IgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 22:25:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F844B4984
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 22:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A8A10E8DF;
	Thu, 29 Jan 2026 21:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="II3QlTUn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012037.outbound.protection.outlook.com [52.101.48.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A56810E274;
 Thu, 29 Jan 2026 21:25:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lp+8JGuKG5k8FO6uRo5gJi2+8vls7rIWBIQaZbcSOOj1Na13bCakavYhoUkqaAA5szw7OgXpdw3DN3/JqESXdYBnaJzdm6Knxh8jaOnwdtzUvifjYEjMGKEphROS3sCY1G6gIKcNojq/2H6smrjb4Mr3iZlV30uNQ9LLz/RR5wzMLAfP+cgUb88AcQ790rL4KAxLD+A8LEXOTrktds0bbklcQ9lSX7zthYPZzd/VUuGWH239V3d0hPD5lUaonKJOz11B1/NE2F8KdI3GWICi2gKalD1UQImO0PsRitk4DeItb68arsVpZ0HHzJhqHfrnK0x5a16S0vvNiQdiIO2t1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSaCTl977yOFqJzueF9J2P1YHlPTKhJEzz2MsBdPUJU=;
 b=uIA8cENdmz0QggUxxSxrSmiei2wxY8/Q91aKxRShzKhRSwPe5ozIOXNzUgfvMU5Y2wLgiBtAhaazRkwwitZObU1eo0N1yz9tVLEr2UkTkbiZQBM6bkipnVVzd/92k8koRChIsExHni/pCLWAnqd5NY8YQoTYjp4YiEGOK3QqB0wdI9Z12+k2pFBEpN/hZbdNeVG6r1c0ROdPdH91x58kJPBV5uzlxemEcJb7WY02JUMzJ3CbVtPBnoBCV3VQgqcxnicncgv4zwWxGRT7H2eXd3V+xGsgA3rHOWw9bI62DB6vNs/hdZLNrGNQtviRBSbr7lypF2WVZ8zixMrgzqhxOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSaCTl977yOFqJzueF9J2P1YHlPTKhJEzz2MsBdPUJU=;
 b=II3QlTUnp5w6KHe/a+OL9FfPBLfwcgcEHb94zUAn5ntCg8mEZew3nQ7d2337j9OQoR8xOxdoF/vna6IUSLBGfRne/gH8Kj5QBdw94Rwb0/C2EukjTUkCXzgDALKOF9Jol4KVDwOLoy8BnAqWR+9pPfYUXHerddg57KqnGs9ay4o=
Received: from BL1PR13CA0088.namprd13.prod.outlook.com (2603:10b6:208:2b8::33)
 by SN7PR12MB7273.namprd12.prod.outlook.com (2603:10b6:806:2ac::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 21:25:27 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:208:2b8:cafe::fe) by BL1PR13CA0088.outlook.office365.com
 (2603:10b6:208:2b8::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.4 via Frontend Transport; Thu,
 29 Jan 2026 21:25:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 21:25:27 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 29 Jan
 2026 15:25:26 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Jan
 2026 15:25:26 -0600
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 29 Jan 2026 13:25:26 -0800
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.19
Date: Thu, 29 Jan 2026 16:25:18 -0500
Message-ID: <20260129212518.22274-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: alexander.deucher@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|SN7PR12MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 8beecfbc-bb38-4f34-2552-08de5f7cebf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjBCQVpxZEg4V2EyMU1OOXp5M3RwMEhHemFIODVHYmZwY1VkMEVZbXk5UzVW?=
 =?utf-8?B?NFVTdXhGMzNZRFVYRGVFSVNpOUhNZWtJd2dUMGxSTERsbEwvc0FZN01WMFRF?=
 =?utf-8?B?QXV1TEVyZXRlOGkwU29IUGZ5a2FEOXVuVGFjREFidWJMMTNTdEZpc0RrSDZV?=
 =?utf-8?B?VCtsQkcwVDdRbVQwMHlkSjBqd292emlSU1ZuZEVpaUxuK04wM0JaSnlUUTIw?=
 =?utf-8?B?OWtTclZiaTd6TXJCT3Bva2lmRE9EcVo3blJ6ZXQzQ1NtR3ZWc0Y3M1B0L3lk?=
 =?utf-8?B?SjI0WFdjY2pnbEVSUm8yeTFjU3kxMU1rZ3pXTWQ3d1daR0pZZGtpTlJKcUc4?=
 =?utf-8?B?VG5tNEZZbmhSNXhnczJMbTBMMFA4S0t5MjRLUzZRWVVjMG91dTVtTFlMd29Z?=
 =?utf-8?B?SkxGS0N5NUVmbnNoZFl3QVlzcC9WOWZhTTE2dXF6ZlhnQ0tLS1J0RWZwMzVV?=
 =?utf-8?B?SEUvSS9JNE11aXZoZjVYNFpmR09VTks1cmFyUzI2UXRPODFsUEtnTitZR2g0?=
 =?utf-8?B?TUlVRGxLMWlmYjQrWk9yY01iemgza3kyZjU1WTh3NThmNUl2UmxJcUJWQ2Er?=
 =?utf-8?B?aVBXN3AzWE1FcFBCc21jZTdhSGhtRHJwL0RQM01pdC9jZ1hOWTM1a0U5eXJN?=
 =?utf-8?B?NE1VYWl2bVFQaGNDQWdKYTZMZ1dIQXY3ckUzN2U1Y3ZIemF2S2JyUlVLZUhW?=
 =?utf-8?B?TFdKeGFHUTRlR21qUVJ3SE5pTGRseGFFMDBIUXcvTzYrbS84SVFmTWRGMm9I?=
 =?utf-8?B?QzNzVGJSejlzSmNWK2QvUFgwVlhEU0JrQzRmOTR3SUtyeTFrV29kTjh0aldF?=
 =?utf-8?B?T0t3Z1JuNDhkdWE1WkcyWll2UUl5a29scU9tcGlTczVmY2laL3NKRm5rTWhI?=
 =?utf-8?B?VXFucTN1ckdWTXhGYnI2MjBQSm1qdkJGdjZJY2JLbkZZM0YzbmhJUnl1TVFN?=
 =?utf-8?B?NEg2LzRBUkx5NU81M2VUWFZES2RNQVNjd2ZHRzhqYXVGcU1rclEzdVQwMUh3?=
 =?utf-8?B?M1FqZW50QkxCRHdwRTdZRUg0VSt4SnNsWWtVNXZqZFV2YWVpZVRPV0lQQTR2?=
 =?utf-8?B?WktIQjFGdGpEQ2xSdFlsY01pcWtUd0J3YW52d2FPeDE5djZZWm5wL3ArdkJV?=
 =?utf-8?B?UGNmYXBrTHpWeGN5dkJHalFiREFWSGpEVml1UXV4OU5hOXRPWlp6SG96MVZv?=
 =?utf-8?B?WXJVR1dCNHRLZ0JCY2RBd3Yra0cwc3NuM0JYeEV2anFYeTE4dzR2WTIyaS9D?=
 =?utf-8?B?VGhhT09vS3NxS09CZ2tHcGtBQXhOcGthNmNIcXB1d210cCs2ZWtpVmllYlZN?=
 =?utf-8?B?aHZmVjFrV1I1QjQ2ZEIzM3lUOGRCbEdFakU2aWNpQ1VBQUpvYllPSmlEaTVS?=
 =?utf-8?B?VW9ncEtweEtVS2JEcTU1ZzhsRU5zYk4rSis0YWV2eGdRdnhYQkJPOGsrdTZs?=
 =?utf-8?B?N2ZXdEMzU0R3Y0hQU01qSmFyRVgrVlhhYzNrM2pzQkNKUm5IamlKMjVzVjRG?=
 =?utf-8?B?UFM4clM0dmVLNnFrQVJ2QndzZkJzY2FNMk1PMEFTWHh5cHAxVUhPekJGZlNV?=
 =?utf-8?B?emlZaU0xQVE3Y1puMTZNSmI3VERKMDU4ekZ5VDRmUlBIbGtDdXQyTlUrSFcx?=
 =?utf-8?B?cVVERlVvYTRQdjBnR24welVIeGtaMU5TREZCbEpRSEFSemV2QXhJMzRucFNC?=
 =?utf-8?B?YWR0Q2FCTzg2bDV4M1NKMjV3NlBpMUI0SExrVzB3bm83U1IwT2NzUmQ5Q1d3?=
 =?utf-8?B?bUFEV2RidThjNUg3Rm1majZZQzZqRXNxZWVRWldtcndLSWt2NHUrVzlieGVo?=
 =?utf-8?B?NFp4bGVzaUtTK0JMU2ZIdHFldDVPOXRiY2k2WUtKVVRHMkdidURUbnpvVW1L?=
 =?utf-8?B?cXJYSFBNeVU5TkZJRm04OWpmOTFtbVZ1MDBPdW9rWENkMlY3WWdnY1Jpc29H?=
 =?utf-8?B?K3ZSWDAxTS9mcldvaXdna1ppQ3d5RjR5TENtbzd3cktpTi9ETERERDNkc3Zj?=
 =?utf-8?B?SVR4U3dIUzB6SVZlTnROUWhSOVNhTkt3RWRGMk91ZllFRXZwdDZhVFg2NVBV?=
 =?utf-8?B?RzBJSXlqbVUvUzFsaGVOWVRRVDVyNWxObXMxRFVDY3NaNGl4Sy9ORjcxTkFv?=
 =?utf-8?B?dEJiZXQ2b3pISUhDSWNVMGN2bHJTL3Btd3hIWFd5dkE0SXdJR3B3RHJ6T01a?=
 =?utf-8?B?Vnc9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Lnc2u8ZaeDR1rxOpQ0mq9VH0X393SMmMq/+BJWOPrDJydXTzeUc5Gcs7587qyFvvWtyRL9ARJiQ+StGZ7VYeTITXZhlQNBSHiSPtI8uCrW8JomlehpJxuSCCv5V5Vm1FcAtvLgjL6kdk02uJlOIz+HIQ72JvhHtj/GSerPvp+4k58G7PbkaD6zdxcf9GQa6utsg76kGTDCZmdN7KyT2jl9srEkMZWMlji2fNNGBvQhU8gMgZ7RRjek9AaaarIyZioan4SZo14JZIk3rI9An+CevFjn3Ro1C5qh7AB4Ax9dHoPvz++aMR++60e1p9pDxm+YBGyTXEFWlwLlvKnQ5BbD4hPsUKT2GmGRzQq9RgunBqHO9amGiuSDMQmxtPvYwkoRl3nLeU2g5oNpriH+05bpsUFFW39tGU0S2p3iFRHQugEXWGcuGh1nnIZ/oU88ET
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 21:25:27.1862 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8beecfbc-bb38-4f34-2552-08de5f7cebf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7273
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1F844B4984
X-Rspamd-Action: no action

Hi Dave, Simona,

Fixes for 6.19.

The following changes since commit 63804fed149a6750ffd28610c5c1c98cce6bd377:

  Linux 6.19-rc7 (2026-01-25 14:11:24 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.19-2026-01-29

for you to fetch changes up to dfd64f6e8cd7b59238cdaf8af7a55711f13a89db:

  drm/amdgpu/gfx12: adjust KGQ reset sequence (2026-01-29 12:39:21 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.19-2026-01-29:

amdgpu:
- SMU 13 fixes
- SMU 14 fixes
- GPUVM fault filter fix
- Powergating fix
- HDMI debounce fix
- Xclk fix for soc21 APUs
- Fix COND_EXEC handling for GC 11
- GC 10-12 KGQ init fixes
- GC 11-12 KGQ reset fixes

----------------------------------------------------------------
Alex Deucher (7):
      drm/amdgpu/soc21: fix xclk for APUs
      drm/amdgpu: Fix cond_exec handling in amdgpu_ib_schedule()
      drm/amdgpu/gfx10: fix wptr reset in KGQ init
      drm/amdgpu/gfx11: fix wptr reset in KGQ init
      drm/amdgpu/gfx12: fix wptr reset in KGQ init
      drm/amdgpu/gfx11: adjust KGQ reset sequence
      drm/amdgpu/gfx12: adjust KGQ reset sequence

Ivan Lipski (1):
      drm/amd/display: Clear HDMI HPD pending work only if it is enabled

Jon Doron (1):
      drm/amdgpu: fix NULL pointer dereference in amdgpu_gmc_filter_faults_remove

Yang Wang (3):
      drm/amd/pm: fix smu v13 soft clock frequency setting issue
      drm/amd/pm: fix smu v14 soft clock frequency setting issue
      drm/amd/pm: fix race in power state check before mutex lock

 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c           |  7 ++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c            |  5 +++--
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c            | 25 +++++++++++++----------
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c            | 25 +++++++++++++----------
 drivers/gpu/drm/amd/amdgpu/soc21.c                |  8 +++++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++++----
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c               |  7 ++++---
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h      |  1 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h      |  1 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |  1 +
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c    |  1 +
 12 files changed, 59 insertions(+), 34 deletions(-)
