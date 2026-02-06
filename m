Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFAGNKZAhmmFLQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 20:27:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CD5102B94
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 20:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B469110E8A5;
	Fri,  6 Feb 2026 19:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ftscXkYk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010052.outbound.protection.outlook.com
 [40.93.198.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658658930B;
 Fri,  6 Feb 2026 19:27:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppXjazI1iYAEB/+8kwAEcQWtTJ3W4qALNBqdi967IrPW6vl3arcQYLjxb4WNNIabQAxdGK7xKi/DK6EVtgfcN0iXWxFtDpJg3RFBPfgYmDqwJyYT8JdKlHqRfUL0WAmb0V7fN+rnaBqnR1zxs7j3cHeTLLayKupfTWOXqD+HwsV76Ft8+P2Aekzr1pTWR4KFpY0oV62nj41a7aCh9qGD4y5VPG7gCLB7u4k5lDC7xDbhU5ejkGSeYcKElQQ52u2NxFmX+E2bokyw5Pz31WJPqIu7WrzFs271ZAj16vJsSKsoX4ukyh1CX60NyP6CqDTH0G2NUpZTjRX4+i1COF731A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=au2FjBArAg1mpoSK2CSSVv460Bxm+mH9005aMRasVBY=;
 b=PKte6E/L5vRV2Tf2mjLXEF7ffmHqxjhmVo1PtcMEUndFNrMLsAW29NJl0xYJqTtBw8Q5cHewtNycSUtH0s85aljaJl90yHhpx8XoSTmcdyE9tQUxaFv0Sphd/+UBOBymY/eKxldyc4bW7LLVkDtFRf3SgLg++5FUBglsqIi3a5bNemhgH9I4xuvnuJwcFKtyn8GAPfZ5ILMq2C/htNnWvPevR2igW3O8xxnRJ3Z4bexAEShQBGTDXEvWFp4vLFUGQ6nm0818kQRH3akEDiZAzQUdOj1GAzeudSKadSQ9w8CObkipPtWPfFp9f4z+QhM5KjRDSlPXW4lyLIKNjEDwPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=au2FjBArAg1mpoSK2CSSVv460Bxm+mH9005aMRasVBY=;
 b=ftscXkYkPOZJSqiTEaqhfentXOGq8fLRv4fbIj3QyQZg8LshPlPMB/N01i05zLFgJXxIkewUxFg8b3c6JZx5tZpzRpzfX1edrIxx3l63uorPCj+s9jCkiTD/wn9dPsG87esuMYRTOlOiCyaLs3CL49ztXeDNJsC9/jjaVVLx994=
Received: from MN2PR03CA0020.namprd03.prod.outlook.com (2603:10b6:208:23a::25)
 by DS0PR12MB8044.namprd12.prod.outlook.com (2603:10b6:8:148::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 19:27:15 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:23a:cafe::7f) by MN2PR03CA0020.outlook.office365.com
 (2603:10b6:208:23a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 19:27:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 19:27:14 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 6 Feb
 2026 13:27:14 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Feb
 2026 13:27:14 -0600
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 6 Feb 2026 11:27:13 -0800
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.20
Date: Fri, 6 Feb 2026 14:27:06 -0500
Message-ID: <20260206192706.59396-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: alexander.deucher@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|DS0PR12MB8044:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e1eff3c-36ec-4c40-f3a0-08de65b5bbdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CnC95+5nDuzCuzHXs0mRLfG0Ah1V0bYMeh0Yt3/OVsAPp+UN3F6dloeXFGUY?=
 =?us-ascii?Q?jXX9cyREUPqOL6Tb7IsTNcSu885haKo5zMZ4Qbb/dwIPk9NyZ68Q5UtydwlY?=
 =?us-ascii?Q?b1UCcKINcPc8OMnJSZJoK/53mO481DRqFmnnNsRkEd0qjqokdRGEDmPHiPm7?=
 =?us-ascii?Q?luClOu5/edEAJC4d8CIgpUkSLStc+ojbVRD4qCBlN8pLAYuqOJq6cJcAUaJ8?=
 =?us-ascii?Q?g0P3ESDTQ4pm6KRw0sPOvAs/T/suF0+vCDYMdtBvwZL2xBpvzL5OB8L/uQ2u?=
 =?us-ascii?Q?5xn0p/GAbYefYua91zm/tWSssJPYKKtuUaKEYBaHaCCE3BQ93LyMDx+gxFY6?=
 =?us-ascii?Q?woLWkWLLTi6Xf9qEgimq7szbOqNnS3ZZpiti3JJQfH9aPggSLpqtgBbuDtwV?=
 =?us-ascii?Q?wr01CTa+wNIspfuZbnFl5DMCY85dR40p4E3IwW/Fax6IVUMP4Th61gTDDvdN?=
 =?us-ascii?Q?X2oz/KXfdS0cwZLCWrXfFS5kwapo05TetyX2n9aY7FMhv6RwnuF0lDW4EOHt?=
 =?us-ascii?Q?ZHWDSmVpylqu1mWmRmXwj2Z8CUaX/SPpnEyI5b4pRCVI1CnIAp+fxrLLmlFV?=
 =?us-ascii?Q?vAwxCOol9IBMamtbTsaMlNK7k2r5eBUoy6Q2SnemDTtr9F6j+TBHr+hzbZ8D?=
 =?us-ascii?Q?LP20HN4pGSpFPTpdV9ruNt+NVVtX3CRMJECZf9B7/QWS1xUdzzHiMQaTxHs8?=
 =?us-ascii?Q?sUST2PnpMBQ/zUAJUHxRfzqF6PVtFAqB4SjpjPA5d9qDtbUsL+1RsvBR6EiY?=
 =?us-ascii?Q?M02t8tujKj/e8z5p/ta6mCEn1drnOvB5yMzgqFI2Kw2pqfpurBDNFGoX6pL+?=
 =?us-ascii?Q?r0ggibPHnIIEMsJ1+zghPjrAgMhiPYFtFR/8cO4nEKM2Pf1jq7M6o/ID5GLS?=
 =?us-ascii?Q?DKUWppbL4aBL3hpaIUDKv81io8hEU4EB7gofCaLlu84xeNfVNdSrRSccB1fR?=
 =?us-ascii?Q?ggNd9Wrny4h+y+JwmlsiaxRrtVDPX1OFLzinjvTNLTF81MsiNkseVbL9RqkB?=
 =?us-ascii?Q?2S8cStB2xMEh1xtPNnZVQHIZsyW7yP4wZOu7M/3wQZBR6lYqvEiSoNwE++Rs?=
 =?us-ascii?Q?t3W33un37zuwsFvybgYCNbJrn8lep59eTkfNC7RKBrXCLlDY1RLKShsmP+Lc?=
 =?us-ascii?Q?ldKElKVOoJRjRD1fwfMwhiGdMsPkGrl7RlWSMx7Dj1NrHrnuXXPRWY7ZcJhR?=
 =?us-ascii?Q?+c1XENnup7GMWU0tVl/o2mvrlejhoYYhLMHP4yWKtIR4wgvx8V8+hyHLfIeO?=
 =?us-ascii?Q?d0WPM0/1hJ30yM5NlaGAUZiVYS//yM5EEY+hT6QjzgMUx7gKKCfWyny1mmVx?=
 =?us-ascii?Q?41Qusf5XhY1d6P+TnVr+JbKLgv3G4Z8vygZ1ANVsfjinVxMQEnHtC2H8s6AP?=
 =?us-ascii?Q?W4XfAhPeWeLKYVk+EH/i+Ymrg7CQSXl6au/lPOQvfiz7315zyctdQgYFCf8s?=
 =?us-ascii?Q?zeCxR4g3vO9ZaSxe175/vI7UR6aQz8LEUtX8mRSOHcr0uJRkdI1BfFSA6csI?=
 =?us-ascii?Q?XU3ZW9vkHh9lHRWCMrC2tmu0kcwMhseFpL6khHhGqL2sxyyRS5iJ89bSoDat?=
 =?us-ascii?Q?sF2hJOA8iopxC5QW6Eci+pgKJe5UAqdRLaZ3nsV//z7ua+NHoBsFuHa4KB5h?=
 =?us-ascii?Q?OQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xPXDq8qx/ZcQ+fN8K/T3FBfc823d8nZxz9jWZvpZrJQ8qaBafBCze3FY4XonEIzXQ75DP0yAoGFGSRWZjVVWkj7kSjv3wTmFLta8XpTAHy4hfsZuH18kcjy3CrtmbCe+yk08+vK6NTi0Xjx4gc3Xe3MJBgQ+pqTersnXDrGeX2+jgfd3zoG9GgRQgE995racm9e2tfgQIvd9FC509rmwmADOA9Vcu7VXJGdzTiLqRyBlfeRkPuz4lXptpl2VzNlElkcdfo7+b5mnwFy5zi5vwwR+O+g3ZQuDi89ZtJn+J7kYamGmiDo0xcM0v8/QilocVPv3u4ekCWWT8ken9+c68tGEGke50fGclRXRm2qNEThoGiZvtT9gEVewjJ7F2RqtUT0InX3TzPzBzKIkJzEdmAy3P1mWax611T7YwD11l4g63DSoDkay4jo8N5Zd6fpd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 19:27:14.8262 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1eff3c-36ec-4c40-f3a0-08de65b5bbdf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8044
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 92CD5102B94
X-Rspamd-Action: no action

Hi Dave, Simona,

Fixes for 6.20.

The following changes since commit 3cc9398a9ea69b77de01b370463b706c354e52fb:

  Merge tag 'exynos-drm-next-for-v6.20' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-next (2026-02-02 11:17:12 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.20-2026-02-06

for you to fetch changes up to 5028a24aa89a2c91b44964191ee8184e5f5c8cb2:

  drm/amdgpu: Send applicable RMA CPERs at end of RAS init (2026-02-05 17:28:34 -0500)

----------------------------------------------------------------
amd-drm-next-6.20-2026-02-06:

amdgpu:
- DML 2.1 fixes
- Panel replay fixes
- Display writeback fixes
- MES 11 old firmware compat fix
- DC CRC improvements
- DPIA fixes
- XGMI fixes
- ASPM fix
- SMU feature bit handling fixes
- DC LUT fixes
- RAS fixes
- Misc memory leak in error path fixes
- SDMA queue reset fixes
- PG handling fixes
- 5 level GPUVM page table fix
- SR-IOV fix
- Queue reset fix

amdkfd:
- Fix possible double deletion of validate list
- Event setup fix
- Device disconnect regression fix

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu/sdma5: enable queue resets unconditionally
      drm/amdgpu/sdma5.2: enable queue resets unconditionally
      drm/amdgpu/sdma6: enable queue resets unconditionally
      drm/amdgpu: re-add the bad job to the pending list for ring resets

Alex Hung (1):
      drm/amd/display: Fix writeback on DCN 3.2+

Andrew Martin (1):
      drm/amdgpu: Ignored various return code

Bert Karwatzki (1):
      Revert "drm/amd: Check if ASPM is enabled from PCIe subsystem"

Bhuvanachandra Pinninti (3):
      drm/amd/display: Migrate DCCG register access from hwseq to dccg component.
      drm/amd/display: Migrate DIO registers access from hwseq to dio component.
      drm/amd/display: DIO memory leak fix.

Chenyu Chen (1):
      drm/amd/display: Add CRC 32-bit mode support for DCN3.6+

Dmytro Laktyushkin (1):
      drm/amd/display: Add lpddr5 handling to dml2.1

Fangzhi Zuo (1):
      drm/amd/display: Init DMUB DPIA Only for APU

Harish Kasiviswanathan (1):
      drm/amdgpu: Fix double deletion of validate_list

Ian Chen (1):
      drm/amd/display: Add oem panel config for new features

Jinzhou Su (1):
      drm/amdgpu/psp_v15_0_8: Add get ras capability

Kent Russell (1):
      drm/amdgpu: Send applicable RMA CPERs at end of RAS init

Lijo Lazar (5):
      drm/amd/pm: Use feature bits data structure
      drm/amd/pm: Change get_enabled_mask signature
      drm/amd/pm: Add default feature number definition
      drm/amdgpu: Skip vcn poison irq release on VF
      drm/amd/pm: Remove buffer allocation in SMUv13.0.6

Mario Limonciello (2):
      drm/amd: Set minimum version for set_hw_resource_1 on gfx11 to 0x52
      drm/amd: Fix hang on amdgpu unload by using pci_dev_is_disconnected()

Melissa Wen (4):
      drm/amd/display: fix wrong color value mapping on MCM shaper LUT
      drm/amd/display: extend delta clamping logic to CM3 LUT helper
      drm/amd/display: remove assert around dpp_base replacement
      drm/amd/display: expose plane blend LUT in HW with MCM

Nicholas Carbones (2):
      drm/amd/display: Add Gfx Base Case For Linear Tiling Handling
      drm/amd/display: Add Handling for gfxversion DcGfxBase

Nicholas Kazlauskas (3):
      drm/amd/display: Make DCN35 OTG disable w/a reusable
      drm/amd/display: Make DSC FGCG a DSC block level function
      drm/amd/display: Make some DCN35 DCCG symbols non-static

Peichen Huang (1):
      drm/amd/display: External panel replay fsm control

Perry Yuan (1):
      drm/amdgpu: ensure no_hw_access is visible before MMIO

Philip Yang (1):
      drm/amdgpu: Use 5-level paging if gmc support 57-bit VA

Ray Wu (2):
      drm/amd/display: Fix IGT link training failure on Replay panel
      drm/amd/display: Fix IGT ILR link training failure on Replay panel

Stanley.Yang (2):
      drm/amdgpu: statistic xgmi training error count
      drm/amd/ras: statistic xgmi training error count

Sunday Clement (1):
      drm/amdkfd: Fix out-of-bounds write in kfd_event_page_set()

Sunil Khatri (1):
      drm/amdgpu: clean up the amdgpu_cs_parser_bos

Taimur Hassan (2):
      drm/amd/display: [FW Promotion] Release 0.1.45.0
      drm/amd/display: Promote DC to 3.2.368

Victor Zhao (1):
      drm/amdgpu: avoid sdma ring reset in sriov

Wenjing Liu (1):
      drm/amd/display: Fix a NULL pointer dereference in dcn20_hwseq.c

Yifan Zhang (1):
      drm/amdgpu: Protect GPU register accesses in powergated state in some paths

Zheng Austin (1):
      drm/amd/display: Match expected data types

Zilin Guan (3):
      drm/amdgpu: Fix memory leak in amdgpu_acpi_enumerate_xcc()
      drm/amdgpu: Use kvfree instead of kfree in amdgpu_gmc_get_nps_memranges()
      drm/amdgpu: Fix memory leak in amdgpu_ras_init()

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   | 14 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 16 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |  9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     | 27 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |  3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             | 17 ----
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/psp_v15_0_8.c           | 21 +++++
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             | 15 +---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             | 22 +----
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             | 15 +---
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |  9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |  6 ++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 40 +++++----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  | 15 +++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  | 70 +++++++++++++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_irq_params.h   |  1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  2 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |  2 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.h   |  6 ++
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 24 ++++--
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |  7 ++
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  1 +
 drivers/gpu/drm/amd/display/dc/dc.h                |  3 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       | 15 +++-
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |  3 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |  3 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          | 27 +++++-
 .../gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.c | 54 +++++++++++-
 .../gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.h | 18 +++-
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c | 30 +++----
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.h | 17 ++++
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c |  3 +
 .../drm/amd/display/dc/dce110/dce110_mem_input_v.c |  3 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c | 37 +++++++--
 drivers/gpu/drm/amd/display/dc/dio/Makefile        |  2 +-
 .../gpu/drm/amd/display/dc/dio/dcn10/dcn10_dio.c   | 47 +++++++++++
 .../gpu/drm/amd/display/dc/dio/dcn10/dcn10_dio.h   | 42 ++++++++++
 .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |  1 +
 .../dc/dml2_0/dml21/dml21_translation_helper.c     |  3 +
 .../dml2_0/dml21/inc/dml_top_soc_parameter_types.h |  3 +
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     | 26 ++++--
 .../dc/dml2_0/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c | 59 ++++++++-----
 .../dml21/src/inc/dml2_internal_shared_types.h     |  1 +
 drivers/gpu/drm/amd/display/dc/dsc/dsc.h           |  1 +
 .../drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h |  2 +-
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c |  2 +
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c |  2 +
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c |  2 +
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |  7 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  9 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    | 30 ++-----
 .../drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c  | 10 ++-
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |  9 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    | 18 ++--
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    | 15 ++--
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    | 27 +++---
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    | 13 ++-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  | 25 +++---
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |  2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |  4 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dio.h        | 22 +++++
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |  7 ++
 .../dc/link/protocols/link_dp_panel_replay.c       | 52 ++++++++++++
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h | 19 ++++-
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c | 96 +++++++++++++++++++++-
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.h | 10 +++
 .../dc/resource/dcn32/dcn32_resource_helpers.c     |  3 +-
 .../amd/display/dc/resource/dcn36/dcn36_resource.c | 12 ++-
 .../display/dc/resource/dcn401/dcn401_resource.c   | 46 +++++++++++
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    | 10 +++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 19 +++--
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      | 29 ++++++-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  | 22 ++---
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    | 24 +++---
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    | 27 +++---
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 27 +++---
 drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c     |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   | 29 ++++---
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c | 26 +++---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 23 +++---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  | 20 +++--
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   | 34 ++++----
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c   | 29 ++++---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 54 ++++++------
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 23 +++---
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   | 29 ++++---
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |  2 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   | 33 ++++----
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   | 19 +++--
 drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0.c     |  2 +-
 .../gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_0_ppt.c   | 33 ++++----
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             | 76 ++++++++---------
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |  2 +-
 drivers/gpu/drm/amd/ras/rascore/ras_aca_v1_0.c     |  2 +-
 108 files changed, 1297 insertions(+), 538 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_dio.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_dio.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/hw/dio.h
