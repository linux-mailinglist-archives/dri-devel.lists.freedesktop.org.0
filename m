Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OH/VHXaPcmmdmAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 21:58:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AF56D93C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 21:58:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EE310EAB7;
	Thu, 22 Jan 2026 20:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="du/7N9NH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011064.outbound.protection.outlook.com
 [40.93.194.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4490F10EAB7;
 Thu, 22 Jan 2026 20:58:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SY+Kq9jPpCIkggHebvGXYH7NyF3cRtZ4mPgpQuFAyknq+4zRuSdj/snfIWw5WB91LeNeFUcJdiF/0rmwC7l6IqTOukDMC/vJn6ahDJkdAyrT9dO59fyh0dbJUgRO1+AHPaTIDew7UZosSnpE7uWxAHHNzWxMg1mcB+FOpM6PJ3FqxX4WCY/AZbEwEjwlIX/hE7erGQmkFJxC572fXjAdlCg12bKo+te8IvbSXKRBIzFfnrXNXW4DSgCwjfAmDcs9ETfd5o+4wqKJ6F6m1KnY3jwo3BcLM/x5f0VIYU75007Za5AbY5ZhWJq5aEKS966DAq7VAzpCzXe/ADT4+41F4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mM4ltvfbzrVv1hkSX1FHin3KXDVZYDCpWtWaK5xww7U=;
 b=EGvNcapEMN/hHMkzSX3hhShCfhwZWKPF/0oN9+iURLr0gNbzIJMReYP02JpjUuHiBzgarbvMA1OGpW22CcqKI8RIpCv3F00E4EZpnfci9nrAUTR0udguhzh+JWjpq6eGPX5+LRq9NE+w9WEDnlkYUFxnFIa0G7gN1v/6HmX+/6fXsCr/vAVAmWXpG9MOPdBRvfe3P53eLJJBZC13rsBZnIEBg+fYjPmXYMhgpcXpOzQqpugZi7I9K3eNNxp5HF9aRjlFbJicdE5lVyUWJMsPuU5tVdh+pVlM9kK0kVI99EEYd5fPhlpRMpVlKUzRn1nYCPIIIJTchG6eWTfTlu9LHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mM4ltvfbzrVv1hkSX1FHin3KXDVZYDCpWtWaK5xww7U=;
 b=du/7N9NHeaGIyosIlfUVRPdyM+oyqqa+pC5F/KuUzxWpw4VQfsx/wvK8gKGaL/U0DfcayE6xiOKM/uxOodSKGGCN2/JFrqhhIfCsl+lvUaYdH4gCmaR8HZ+Jr2a5NyQGvnnitGkXbuEB5iUYQ6xOyfR14VKT2e7TGkFGAhkuFa4=
Received: from PH7PR10CA0004.namprd10.prod.outlook.com (2603:10b6:510:23d::22)
 by SA5PPFB2BF91BC0.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8de) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 20:58:20 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::80) by PH7PR10CA0004.outlook.office365.com
 (2603:10b6:510:23d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 20:58:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 20:58:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 22 Jan
 2026 14:43:15 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 Jan
 2026 14:43:14 -0600
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 22 Jan 2026 12:43:14 -0800
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.19
Date: Thu, 22 Jan 2026 15:43:06 -0500
Message-ID: <20260122204308.946339-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: alexander.deucher@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|SA5PPFB2BF91BC0:EE_
X-MS-Office365-Filtering-Correlation-Id: 412f8b3d-180c-4158-751b-08de59f8f8f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cktWOVlHS0lYZGl1UWx0ejBZcFdGTlhXaEpuSFpQU2lJclVmRHBsQjR1dElh?=
 =?utf-8?B?UXBGRjVIUDI2dkFTNXRFcFlUYlIydkRRRUxwZ0xvZHV0TE02UjM1a0QvUDRB?=
 =?utf-8?B?RmkxUjZGTHBENjBjU213OFZxZC9pb2ZqNENvUmxMQkxQYXVNRng5RFRQRXpq?=
 =?utf-8?B?TGxOaVFNdVdFOHE0dmQ5ZnRWQ1Njakt0VURkenV3eGMvd1BvT0RHK3ZXcmNl?=
 =?utf-8?B?NWtqdEUxTXRoUTkvOUFRTmpCc1BTRXNsMk9zWlQwTzJqd1JXM0p4NEtxVzdT?=
 =?utf-8?B?VzdHZktVcjNVN0xHaGM1dXFOV3JOZXB5WkZPazhQbE9DTVRXMTJNN1NpSzQz?=
 =?utf-8?B?WHIyWFJzMy9hT0pzQnJUM0hhRE5QZnQ3Zk4vMTJYZnJCcERwT2wzVkJ2QWxk?=
 =?utf-8?B?MUpzY0MvMHdiZkk5akNpZUFrUXZkaXloSzA1WTE5eHJ1b2pjTXhqdnhsSCtZ?=
 =?utf-8?B?YWZFVFRBM20vVVVBY3d1TG8wSnhsa1RuR2FlOUYrUUE0bkZwRktzdkE0dWdC?=
 =?utf-8?B?NFd1VmJuTUYyNU9VZ0JLU054TUVic2o0VmVuWUJkVURLcEJyYmQzeUtlaFFI?=
 =?utf-8?B?bW9uUzhLREdKZVNYKzZDUEJ5RU04RWVXUHlLSVZJdmszbGVIamhWREJLRU16?=
 =?utf-8?B?QkRBVHhMamkvNE92T1VVc1ZzbmxGZXNXQk9vbm41enF1c0R5TzVLbGhKcFNp?=
 =?utf-8?B?MVZzbG1paHRkcW9kK2Z4MzJUdi8zL0l5bmVlUlcxNk9teVN2Z3dVN2hGOG15?=
 =?utf-8?B?NTJsWWd0Ti9QeVdEc2RybW9iaHVLeTVCR3lXSUg3K29PYWs1MnhoazNtQlJt?=
 =?utf-8?B?cFI5c1FyZENiRUE2aFV4QXh1VGVuMU84dExHVGNrYlJFZ1FqZDV2UUFXUTBy?=
 =?utf-8?B?cW45bkFHaXNZdDRiUWVJZ2dVajIxRVAxMUZGZkY0aDBMSzBCaFV5Rk9mZjky?=
 =?utf-8?B?MUx3blk1eEtIcGYvdXM5RWJreEpiZ3Q1cjNoaXZwVGFJSnBFeE1SemFqbmov?=
 =?utf-8?B?aG94aTR6aW9WeXdQcFp5cWZNQzltdEhXQ1Q2cVk0eVplOE5EbmpueDJxNTRN?=
 =?utf-8?B?eUtBUHZhUm9rSlJFTVlFRVJqejd5Zmk5c3RSZWxXQ3k2MFVPcUUyNC9MTEx6?=
 =?utf-8?B?OTV6V1YwN0x6UE1PY0xlenhHRzhuQkZuZGo2TVVyQXBtVHJabzc5QVhTR1Jn?=
 =?utf-8?B?c3RDU3N2TzlGeHgvV0gxZno2bXlCWDMyUURBdVhpVWZxYTJiMWMxQzN5NnFU?=
 =?utf-8?B?b2gxN2krNG85bTZ4WDZ1K096bndFYkp6aTVzZzduci9jdFFUYVdTWmUwTm1B?=
 =?utf-8?B?Q2JZb2NXZ09PTXkvd3RRNksyZVgvTFVxUkFiMkxUZldmWU84aGhlMlRlbU9S?=
 =?utf-8?B?MXZiSTZlTU1admFrT0ZqbGFhM3lMNXp0ZTkrS3RDNU1FeDFlczFxbzg2MVIx?=
 =?utf-8?B?bVgxaVVlY203WVFFdU1ua2o3akJVNm5neE5kMEJDWk04a1RhUFJHUzNYMFY2?=
 =?utf-8?B?amxyRkI1SEFRNWlPWStrTm9XWkVDb3lxdWY3eUppbTd1QklVLzRINlIwRUpY?=
 =?utf-8?B?bzEvWEE3WG9CTkJNcDVSVDhxcEp6ZGxyNmtmRUhLditnK1VmTkRLZDVDZy9Z?=
 =?utf-8?B?UGE3ckZZSUNVRHpMc2VBZStVMFhxY3crRUp1WUlpNnlzMlVoMy9KZXFlcG5k?=
 =?utf-8?B?RWN5SFhqQmFrR3B0T0FLczZ5Ynd1enJ5eWFQQUw0MWUybG9OUjNJL1IyQlll?=
 =?utf-8?B?RFpla2gvQkVwTHp2bUsyTURSUXRGemt0U2c2c09GdU4yYllqWFFrYXZuekQ3?=
 =?utf-8?B?ZmhLUk1vTHFuZC9TQzQ2OHgxSkYxeFBiNXZVSjNPS1lBekZ4dDY5SGJCUzVV?=
 =?utf-8?B?V1Z3Rndzc3VId3hOSFJiaWhCeC9oMitKbjhjdGJyZnBZTWlQdDlZQ1pxL1B3?=
 =?utf-8?B?cytyRjdIa2QzNXRMbDdRcm9FajNZSy94M0ZuTTNMeTltY3pjMlMvYVlHWGFw?=
 =?utf-8?B?M0JmMDFrTGJOWFA1eEg5SlQ1RTJQc0xmWVg2Z3FnK0NjRWJVWVQ0OG1VK3Rp?=
 =?utf-8?B?eVEwKzZGalkyNkhGYmo4aXVLYTUwN3dEQy95ZC9CZVlDc1d5ZUtoMjRIaTFS?=
 =?utf-8?B?Ym90Sy9hSWFYam51WDhLaGJUSmF1TFNjTmdHdzdjQ25OQVN3b0laZFloc0xV?=
 =?utf-8?B?OGc9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 20:58:19.6395 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 412f8b3d-180c-4158-751b-08de59f8f8f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFB2BF91BC0
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
X-Rspamd-Queue-Id: B6AF56D93C
X-Rspamd-Action: no action

Hi Dave, Simona,

Fixes for 6.19.

The following changes since commit 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7:

  Linux 6.19-rc6 (2026-01-18 15:42:45 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.19-2026-01-22

for you to fetch changes up to f377ea0561c9576cdb7e3890bcf6b8168d455464:

  Revert "drm/amd/display: pause the workload setting in dm" (2026-01-22 12:10:44 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.19-2026-01-22:

amdgpu:
- GC 12 fix
- Misc error path fixes
- DC analog fix
- SMU 6 fixes
- TLB flush fix
- DC idle optimization fix

amdkfd:
- GC 11 cooperative launch fix

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: fix error handling in ib_schedule()
      drm/amdgpu: fix type for wptr in ring backup
      Revert "drm/amd/display: pause the workload setting in dm"

Jiqian Chen (1):
      drm/amdgpu: free hw_vm_fence when fail in amdgpu_job_alloc

Jonathan Kim (1):
      drm/amdkfd: fix gfx11 restrictions on debugging cooperative launch

Likun Gao (1):
      drm/amdgpu: remove frame cntl for gfx v12

Timur Kristóf (5):
      drm/amd/display: Only poll analog connectors
      drm/amd/pm: Fix si_dpm mmCG_THERMAL_INT setting
      drm/amd/pm: Don't clear SI SMC table when setting power limit
      drm/amd/pm: Workaround SI powertune issue on Radeon 430 (v2)
      drm/amdgpu: Fix validating flush_gpu_tlb_pasid()

 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  6 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  7 +++--
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             | 12 ---------
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h             |  3 +--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 11 --------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  | 10 +++++--
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         | 31 +++++++++++-----------
 9 files changed, 36 insertions(+), 48 deletions(-)
