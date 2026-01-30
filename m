Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNs0LnP5fGmGPgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:33:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30608BDD13
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7877910EA4B;
	Fri, 30 Jan 2026 18:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Nf7aE//q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011056.outbound.protection.outlook.com [52.101.52.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2DE10EA48;
 Fri, 30 Jan 2026 18:33:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mi6ysRMwvRwEu6cPvqq2kY/VnFJ5AWMv6DcAPJmgA3Vg2lYpneYAR7XkGC7ntzIerDm7fMoGA1H0yMYsvrjyIRSwnaw+Br/Gp8AmFpZ24dSZ1YCPk3qhm1e+CvqIRSrkv6BTq1U50hoq5eQbw5Nb3oCZFM2bzRMwME2FczgN5D0Y1xMXUtr8kLXgHbEQ0d7e7T7ZbUjmMak2GYVSD332mMvau8xZsZc97pCrsNdAZNEaKEUcAYT1kT8+sg5wCaK2ZbJwv5+52tt5JuTn37K4Xv8Fxs+Xm0vmJIPyD+uU9D22oeRLpTf0fLvfnj8sE8jC/oIFfEKjZtBt1SY2eK8cZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsbvdayWJ9XXavZmhQwX8mstjz5MHkiczaM40IqqUes=;
 b=aXUi5Iiza43hXqjHmtaVlhyXacWH5vdpvueCR3gpNn1ODrBjxD/kgPyVM9QIcmnzK3elfe6YeLbflSRg2v2qGkB7FwOtvPFgPYjQUhxWWhKa1+3l3gTePB6q7d/h1ZKlzaorrd9cgYI/wvefBOdLNT1F+V8I+nLEspiuvaiBcbpdN48fnlO1mgBK38neFp7e5tDMYIHCST8KW8GdZx6/Y1p2XPLpSMSPL5bcTIzY8FLZcBph6lqtkEwL1S/aAYfZO2UayumoFZQRmaF7QvxIAge9N/7LlMv2KxpJdpM9HlU8tifCUh5mYmSEpksgy9/KJff3qStapR4jKAv4aNXcOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsbvdayWJ9XXavZmhQwX8mstjz5MHkiczaM40IqqUes=;
 b=Nf7aE//q9SYwpqA5g1n458PlBs74/fOW9AkX4F1M8pm2asOJlmBXXjKnhVwZ0gNL8DCV6rZRXFSs07a5ayll4JUmcMwePHHvRZ3MwP4Xr44xu0OSva7/L0q1HZjU7vUR+Vdek/sDaE8sXmL8jiG2hdYTPI9iBqipBsRcG6kYGUI=
Received: from SA0PR11CA0041.namprd11.prod.outlook.com (2603:10b6:806:d0::16)
 by MN0PR12MB5932.namprd12.prod.outlook.com (2603:10b6:208:37f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Fri, 30 Jan
 2026 18:33:16 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:806:d0:cafe::3) by SA0PR11CA0041.outlook.office365.com
 (2603:10b6:806:d0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Fri,
 30 Jan 2026 18:33:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 18:33:15 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 30 Jan
 2026 12:33:13 -0600
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 30 Jan 2026 12:33:13 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.20
Date: Fri, 30 Jan 2026 13:32:57 -0500
Message-ID: <20260130183257.28879-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|MN0PR12MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: bcff6b18-cca6-4522-5103-08de602e0828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bi9TVGNxc3NxcVNhcTBBQkQ5djJWczNiT1c2eFVSN2dtK3BoWk5Yb2pHRk5I?=
 =?utf-8?B?ZVZZTURNVXV2ckFHN3YvMnpqbVkrQjNwUVJrOTlGZWFOWWRUR2psOXpVNEtR?=
 =?utf-8?B?MGkzVGhlTlEzdDZybXVXRDZFWUVMTEpkdnBZZ1BaemprWWpCSGUwTGN3NHRz?=
 =?utf-8?B?ek5iN29nVUNRa2dwZTBNeitObWV2K29BYVA4WC9TT1FWbEJ6WlZFWElwWXJB?=
 =?utf-8?B?Y1l5UkRZdnRQcjlpTlZyenlrNG9Lb0ZnSkZFSmZwM1EvQTVBNTMvc1d3MlZp?=
 =?utf-8?B?aS9LV2oyaWp2bkw4ZU5IWENIbXJidDBEQm9zenN4SWU1a28zY0t6LzluT0hE?=
 =?utf-8?B?bGIvN3NTL1NmOHdxUThFT1NPTEsvM0RyajhYR2JvTEFVYkhTTnJmOEtQRlQy?=
 =?utf-8?B?VE9KOVB1aDY5TkJ6TnBFVXBscS9sNEw5ZHR3bjNxd3B6aDBlUmZVcFRjSWxp?=
 =?utf-8?B?MnYvNk5nTkkweVNkSlJaSk9FNTVnRUQ5Uml4Y1dvQU81SHRMMVZhN01UTHcz?=
 =?utf-8?B?NU4weE43NUpKNktUK3pJK1J3NkVhS0JsdU5OOVdZMVJVU3BGUmcrdWRKQUFB?=
 =?utf-8?B?b0ljbDQ3UUhBU3E5TS91K1ppMkZjOXFGTXA3TEt4MWRpNVo4cDZJL1hieTk2?=
 =?utf-8?B?ZlRqemtKTXNTbUkrYmZJemIrZXFOMXBQeDZuTEppa3Y3N0dBRDIwZk9jUlM4?=
 =?utf-8?B?L0FaVVZ4TDRHeEp1aUpxVFZ2UU9GbVpPL2lKa2wyQmxyaTRqMTdwNzl6NWw3?=
 =?utf-8?B?VFVDREdnVDE4TDBYalo0NXlMeHZrMURJU05zazQ3SWxHUENRSURyZ3lMWUpz?=
 =?utf-8?B?RnQ2VjZtd25BNEJDNUZUSExVUlo1eGNGUkxrY2JQb2xkKytFUU1FMTZuZEpN?=
 =?utf-8?B?T1d4OHhTV2xvZm9qN2d6NVFML05CQ3p0cVVlZ2E5Rm9NV3Y5YlFBc2t5dDVx?=
 =?utf-8?B?aGlTMEhLVGxoeUN5SnZpY0JBeVZmakdRTVFUY1NscWdDOWlJMHRTY0trV3lk?=
 =?utf-8?B?U1ZFbkJkazYyR0RTY2RqUGFYd2xtdHAxMm9lSFdPazdsRGk5WERqNEJqa1Rm?=
 =?utf-8?B?RUJSQzVOV1J0SU9CVVhHV3NpQkF5bVAzVThRaENQSElQSS9SMEFOZnJuY1VM?=
 =?utf-8?B?MEpGNU04NzYzdkxiZmM0YVFtSUtqeWQxNzR2eG9qN3hDVi8xcWhKbkl5WHFq?=
 =?utf-8?B?OVR6QXhLRXZ6Z3o2SGpFcnlUbmUvam9rRjdEV0toWXVVdEFxZ21BeGl3aElm?=
 =?utf-8?B?L0FJbUt0OWNrTjQ1eVhodUdKK3hRejFQaUQ0c3lwVkxzc2ZYVUxBUnl3S1Fm?=
 =?utf-8?B?eG40UGZ4akRMVDBoT1V3Q1BTVUVsQVJOazIxbE5SU2hlNVBnRXFYNjJZTnMw?=
 =?utf-8?B?Nmlxc1B4VXM2V25wYmxTcTRKM1paUzdRRFMvNU9rSkttZ0ROdllqczR5V2Nk?=
 =?utf-8?B?UU5lclpQWkpkSUxEdXNsNVR1UHJBdTJTYmQ2ZkZHdFprSU5qSEMwNGNvUXdu?=
 =?utf-8?B?aDR3SmNQTXcrbHY4cEMzelI0TWtSc1gvSS9sQ3dxVm5ucjNET09lOTJzUmE1?=
 =?utf-8?B?emRyK0VpcjN5eTUwMlBFNzl4bWJuUzRMNTE2L1VCMTlrZGlVOGxjRkc1RFZr?=
 =?utf-8?B?Nk00MFdxdTk2cTdYOVdrZWJMSDA4Y1IwRWs2TW1CaUExSnY0MndXRThoWHB6?=
 =?utf-8?B?ZG1TWXVsRmsyd28zRUhPZ3dDaS9tS1VmL1dBUDZhNWg4T1lsOVVzbC9FUGFD?=
 =?utf-8?B?bDR4Y2x6cjJSS1o3UUYyalM2TFh5UzJSMUdPb2hldHB5NEgrVlRIa2V5K0lF?=
 =?utf-8?B?TUtNKzdzUGxPOU9Vck9UeFFqdDJjUVBYLzF1VWF5d2RKN085aUFOWXRtbVlp?=
 =?utf-8?B?eFNHcDBXUDFFazQ1ZFRqRjd3OW1ST2l2SDRFQ2xaT1lUb0VYUy8wMEFhZ3cw?=
 =?utf-8?B?TnBvVDFuUVB2MmpnZmh2NnZyZWNLd0FwTERlV2pVMXhWQXlueVdFYW96dHVH?=
 =?utf-8?B?MXdQMXpvMk9TcXlRdWJpdU9pcmkwV2lwbk54cjhxckVnWG5YbDBJWmFnYmJI?=
 =?utf-8?B?QTZERUM2bzJpQlBPeHllTUxZczFDWUVuMzE1VTF4SXJCeXZkUWdEK3BaMkJ1?=
 =?utf-8?B?WWJsUHN3YW8wOVRwR2I5L21yT2xCVjhNTkFNTUM3ZW4zQU1CTnJ3KytuSGtK?=
 =?utf-8?B?T1E9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WIWQXrK/jr+/HuVRydYLm9qAddUCIuS5CpAE5eF+NQX5Izd89MJuPqIFys/m0Flmv3gALM/WpfeU+6CH/XPZDcXG7jnXKhCiIymH8RvSu9gnROJ8huS3g0hfgexZ5awquCyTJ71QsDWYg3Uif6QK/XIxSyjdc9H4XDJsv58Ozp1AfGb02Z/ei3cO84SQ4flHF5v8iKWbtGCK6zqt3pwa/x+tetHPT+oxg38n6iBZdkir3AQLCu41weMhaK7pzRZmWXKpwaf6PoJBwf7hbYZO7TzmEWXEu8yApXb50DS327NqP4RMG9tdA3bQBtez+fLcO8LdhHW+RFSftrIB8f5tteTINZYSrtH3rppvUoj+z0vqlRSyT3bMCj3T9bTrtGiNUkovrzb1teXwjvb1xzHx4bt5XrQPTpVdIX+8HrkuM2Lf76lOBJKAcASra337CyQf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:33:15.4439 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcff6b18-cca6-4522-5103-08de602e0828
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5932
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 30608BDD13
X-Rspamd-Action: no action

Hi Dave, Simona,

Fixes for 6.20.

The following changes since commit 504f3cead6b04914c53831f9efce902b8d91c009:

  Merge tag 'amd-drm-next-6.20-2026-01-23' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2026-01-27 11:01:52 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.20-2026-01-30

for you to fetch changes up to 0a6d6ed694d72b66b0ed7a483d5effa01acd3951:

  drm/amdgpu/gfx12: adjust KGQ reset sequence (2026-01-29 12:27:37 -0500)

----------------------------------------------------------------
amd-drm-next-6.20-2026-01-30:

amdgpu:
- Misc cleanups
- SMU 13 fixes
- SMU 14 fixes
- GPUVM fault filter fix
- USB4 fixes
- DC FP guard fixes
- Powergating fix
- JPEG ring reset fix
- RAS fixes
- Xclk fix for soc21 APUs
- Fix COND_EXEC handling for GC 11
- UserQ fixes
- MQD size alignment fixes
- SMU feature interface cleanup
- GC 10-12 KGQ init fixes
- GC 11-12 KGQ reset fixes

amdkfd:
- Fix device snapshot reporting
- GC 12.1 trap handler fixes
- MQD size alignment fixes

----------------------------------------------------------------
Alex Deucher (7):
      drm/amdgpu/soc21: fix xclk for APUs
      drm/amdgpu: Fix cond_exec handling in amdgpu_ib_schedule()
      drm/amdgpu/gfx10: fix wptr reset in KGQ init
      drm/amdgpu/gfx11: fix wptr reset in KGQ init
      drm/amdgpu/gfx12: fix wptr reset in KGQ init
      drm/amdgpu/gfx11: adjust KGQ reset sequence
      drm/amdgpu/gfx12: adjust KGQ reset sequence

Aurabindo Pillai (1):
      drm/amd/display: perform clear update flags for all DCN asics

Bhuvanachandra Pinninti (1):
      drm/amd/display: Migrate HUBBUB register access from hwseq to hubbub component.

Charlene Liu (2):
      drm/amd/display: Enable vstateup hook for DCN401 to be reused
      drm/amd/display: add setup_stereo for dcn4x or later

Jack Chang (1):
      drm/amd/display: Add FR skipping CTS functions

Jay Cornwall (1):
      drm/amdkfd: gfx12.1 trap handler instruction fixup for VOP3PX

Jesse.Zhang (2):
      drm/amdgpu: Fix jpeg ring test order in vcn_v4_0_3
      drm/amdgpu: validate user queue size constraints

Jinzhou Su (1):
      drm/amd/pm: Fix null pointer dereference issue

Jon Doron (1):
      drm/amdgpu: fix NULL pointer dereference in amdgpu_gmc_filter_faults_remove

Jonathan Kim (1):
      drm/amdkfd: add extended capabilities to device snapshot

Kent Russell (1):
      drm/amdgpu: Send RMA CPER at bad page loading

Lang Yu (4):
      drm/amdgpu: Add a helper macro to align mqd size
      drm/amdgpu: Use AMDGPU_MQD_SIZE_ALIGN in KGD
      drm/amdkfd: Adjust parameter of allocate_mqd
      drm/amdkfd: Use AMDGPU_MQD_SIZE_ALIGN in gfx11+ kfd mqd manager

Lijo Lazar (4):
      drm/amd/pm: Add smu feature bits data struct
      drm/amd/pm: Add smu feature interface functions
      drm/amd/pm: Remove unused logic in SMUv14.0.2
      drm/amd/pm: Initialize allowed feature list

Matthew Stewart (1):
      drm/amd/display: Fix GFX12 family constant checks

Michael Strauss (1):
      drm/amd/display: Add debug flag to override min dispclk

Muaaz Nisar (1):
      drm/amd/display: mouse event trigger to boost RR when idle

Shaoyun Liu (1):
      drm/amd/include : Update MES v12 API header - SUSPEND

Taimur Hassan (2):
      drm/amd/display: [FW Promotion] Release 0.1.44.0
      drm/amd/display: Promote DC to 3.2.367

Tvrtko Ursulin (2):
      drm/amdgpu/mes: Remove idr leftovers v2
      drm/amdgpu: Simplify sorting of the bo list

Wayne Lin (2):
      drm/amd/display: Enable bootcrc on FW side
      drm/amd/display: Remove unnecessary DC FP guard

Yang Wang (3):
      drm/amd/pm: fix smu v13 soft clock frequency setting issue
      drm/amd/pm: fix smu v14 soft clock frequency setting issue
      drm/amd/pm: fix race in power state check before mutex lock

Zhongwei (1):
      drm/amd/display: avoid dig reg access timeout on usb4 link training fail

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c        |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  18 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   9 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |  11 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  25 +--
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  25 +--
 drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c             |  27 ++-
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c         |   3 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  18 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  18 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c             |  17 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   8 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |   2 +-
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     | 197 +++++++++++----------
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm |  25 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |   1 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |   9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h       |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |  25 +--
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c   |  13 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12_1.c |  32 +---
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |   3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |  13 ++
 drivers/gpu/drm/amd/display/dc/dc.h                |   3 +-
 .../drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.c |  18 ++
 .../drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.h |   4 +
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   5 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.h    |   2 +
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  16 +-
 .../drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c  |   1 +
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |   1 +
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |   1 +
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |   1 +
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |   2 -
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |   2 -
 .../display/dc/resource/dcn401/dcn401_resource.c   |   2 +-
 .../display/dc/resource/dcn401/dcn401_resource.h   |   2 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  55 +++++-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |   3 +
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |   1 +
 drivers/gpu/drm/amd/include/mes_v12_api_def.h      |   6 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |   7 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  36 ++--
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      | 175 +++++++++++++++++-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   1 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |   1 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  11 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  92 +++++-----
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  89 +++++-----
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |   5 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  11 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   5 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  35 ++--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  12 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  80 ++++-----
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   5 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  50 +-----
 drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c     |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   6 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h        |   2 +-
 include/uapi/linux/kfd_ioctl.h                     |   2 +
 75 files changed, 743 insertions(+), 576 deletions(-)
