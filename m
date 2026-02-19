Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN3OLjtIl2m2wQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 18:28:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA1C1612FA
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 18:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EAA10E726;
	Thu, 19 Feb 2026 17:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MMSROpL0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010061.outbound.protection.outlook.com [52.101.56.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED3910E724;
 Thu, 19 Feb 2026 17:28:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DP34oSamvAawnpgS8d48OhQ9XHkL0z0aOV5RHvsm861tZ972RlOZTtxBwWgnIejSp/lANpEGx4v7bLSWhhsBt05BkRgExPEhl71Qrc3yXjBGS2TxI/NYxi5ls3WKIG9/jglUli4fFn6BdYvLg7GCcFAIIUWeISDYPYewlTmpuG3hqr2M8exDslZ/uOKEieey2AepaEjmeFmJNy0ml/UJLZe8Jf6rrU071qYEsvvn2syDtoFzAc+yVhTfRL9KJiA/69WsKKTtjZseiWTvCCSTcOEeKjETdjK6IsKKs5+Hs3Ff6T219B8d8bLZv9v3IJcumdYq50IeRCdZgJh2lWd37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHSqjbGWPC2c/GgA4Q47vHIdaMrLnHFEvAh00zctmec=;
 b=OMDOSDl/Dbp5wlqK+NfrAtq6kGFGmeYSwWtemfTzOpAVDyMkiZAeOM/0ttaCo7o9IrsuVSXny5unsZuCOw4q8QzE91pMTUEjU7MGIHjJYoGMftZi7NjkIZCh+f4EtdVorVuEKSwpwNgzx8HUB1VjbEi/BnJH9nDOTG/KS0AKRfA0D5/Gnfs7MttLUnf/Xd1nGwiQt+3wwsfGfuuZeAy8lS0C6nUv7bideotWjBS4zXBourDKWCDoNKWvd8YDghSzVe7QafrxlPYcQP4dWIPknEzt3+rMteorQ2XQwY9jpWlu2N69QOvrwHpvmLLqt6PKI9sYJtXZRK0C+bX6vHcr3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHSqjbGWPC2c/GgA4Q47vHIdaMrLnHFEvAh00zctmec=;
 b=MMSROpL04NykfSaDCdlLbfplC817LdO75WfxLBBdz2BKidQYseothE2qRFu5xFO/3yoB7RvG0wDci/T4U3QKeuAUPA+cqm7CvWKrL7Ng1Heu+4bbIzja7Xa4q4/m6GUBlb37DGtzVR8P3Cesks0llp3iV4y2qkwc6XyKd1SHD+o=
Received: from SJ0P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::14)
 by IA0PPF89A593F05.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bd8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 19 Feb
 2026 17:28:17 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:41b:cafe::c6) by SJ0P220CA0010.outlook.office365.com
 (2603:10b6:a03:41b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Thu,
 19 Feb 2026 17:28:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 17:28:16 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Feb
 2026 11:28:15 -0600
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 19 Feb 2026 11:28:15 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.20
Date: Thu, 19 Feb 2026 12:28:07 -0500
Message-ID: <20260219172807.2451298-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|IA0PPF89A593F05:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f9f66ee-7e49-45db-b3d4-08de6fdc4491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVpDQi9ZaVJ0TUtHUXB3bGdzck5tb3ZUdDR1T0hRSDRPMXdTcE44WkdsdWl0?=
 =?utf-8?B?UDhsNWREckN1LzlBVWQxVGY5NnNuWFJsRUxPbmVxdE1DN0RjcTM5VlZEYnUv?=
 =?utf-8?B?MGFtT2ZYalpMbXZCRCsvYUtTOElQUXg4RTMycjEwNnRDKy82OGxpNUF3L282?=
 =?utf-8?B?MFRyK3YwTEJIbXNvQ1BYbDl1Sm5XV1ZYUFlLUjg2N1Z2VDZFU3FqYlB0NGZy?=
 =?utf-8?B?NkowVVVHUHEyeHRzV25rUHE5Y01TRWExd3lwTkdEMEF5M2FXTzBZTkJadm8z?=
 =?utf-8?B?aFRkcHlKamM3R0pXT3NpWm53RlNnZGVVRlkxY1hDdHZpY2FPVkVUa1A3dmR6?=
 =?utf-8?B?VDNYYlRnN3diMHNpakFCTStXUnMrUzZlN0tOZWVYcWV1M3p2N1BCT1kzd2pJ?=
 =?utf-8?B?RUxhbTNNaFAwS2lwbjEzMjZaeHlsR0twdGpGN05scmhBOWUrcWVnQXdQMis5?=
 =?utf-8?B?ajZ5RHhuK01qYWxzOTNkRitUNUJjSFJPajJPYmV6SXg4V0E3SEMyTEhCV2hH?=
 =?utf-8?B?aEFLbjRkY3g4eVZKa1h3SFUrSjFRR2gxcCthZEZRNDVjVUtHQUkybmgvNlJM?=
 =?utf-8?B?cTIvc25QM2lScUVBY3FsNWNITlArdUlvMDFBb0dCQU5uVDdhZHpJRWprS2xH?=
 =?utf-8?B?aG5wTEw3ckpqT2VHdTFKNVpNNS9TL3FmQ25rOUhBM1U0dzRXdVNTdSt3K3B2?=
 =?utf-8?B?dUlCeUt1eXk0aEMzdGUrZjRaamxxVlVUTjEvMjc5M3BiUkR6d2xjQ0dmQWRY?=
 =?utf-8?B?cFk2bHppQUYxaUEySlF0ZUxHdytQNHMvUmNBT2tSa0JqaWxWaXRzcTZieWMv?=
 =?utf-8?B?UWFrOE9KYlNucm9vWmlRUXprT2N6M0ZGR2VFRlVjOGZORkdlenlod3ZXUkYw?=
 =?utf-8?B?dkRpOFR3SWJRbDE5WXQvbm40dVhJeU8wUHVTdzFTbnFINlp0eklFL3Bsdzhi?=
 =?utf-8?B?MlpSWmF2OXZCYUlmTFJVQ3A4dXhDdUFydTZHeitxczNxcFA5cjhCa2hTaGF1?=
 =?utf-8?B?SXhheEJiaU5yVi9VNktxUlBqLzR5clVZZDNwTHh2YU9Nd2V4Y1RrUEJBRE5i?=
 =?utf-8?B?ZnFXc0kzUHhTaXVxMnp0ZEozdDNhUkpOaFZEakNOdEtoNGhxbkdmN2JRQVY5?=
 =?utf-8?B?elB6NGpWZ3VrcVFDWERDLzlZeEx2dGk3VkNwajlTTHlUOGlVZlBBK25aL0Vm?=
 =?utf-8?B?UVZ6UERCTmxqUU5seUJLNTU1RmcwNnA3aVhvT25nV2NWejJ3NmpnZ3dyMm80?=
 =?utf-8?B?T2lLN1BBV0VkczhaVFJUSEszdC8vODJ2WTI3bjh3eWZpK1dRMVhuNWhmclFr?=
 =?utf-8?B?ZytBeEEydUg1OHZQOTh0YkFMaDdWVUhTRFhUanBkdi9VQnFNdWdtZFlXYXZ5?=
 =?utf-8?B?TnVNYmpiTDM3Ynk4dXJLRllkZVAvSjlpSkRVZFZueXZOTmtBdDZLV3ZBSm4x?=
 =?utf-8?B?ZGk1NFhsd3VhNEg4QzZtcGlVVXBudjFrendFbGkxKzNtd0tKM2FxR01Bb1lB?=
 =?utf-8?B?ZGFTMGFrUGt6TXdWQkFPdzU0NGRsMjk0MDd1dTlySm9BdmFBOHA1dVdHenFK?=
 =?utf-8?B?WittYzR6blhIcGVkVW1lOXlzTU1zenYxYUxWUjFrTEVPT2svUWRhb3N5VGNN?=
 =?utf-8?B?bzUyMVFXV0RvcFBITzlqNTE4aENPOUtQRnBqTFp2ejBJeEZmVUV2cnpMYkpn?=
 =?utf-8?B?andUcDh2eG5lY0NoNEEzU0RjOVBjbDhNUG9ETTFiSFNtSkp0ZnZYUlVjNjcw?=
 =?utf-8?B?bTRzOUtQUzJiY1pneS85VWY0Wjk0WVZLSjA3ZDlVcVRUVktUN2RScm81VEg5?=
 =?utf-8?B?VFVhdFVlT2pqc1Qwb2QvK0UvcEo4OHJqT1Fxc2g4TE04UlNxdUlodGRnQklH?=
 =?utf-8?B?U0IxOERQc0k1Zm1rd3F3eTBKYVJUWVBPelV5TUV5YU5wSEdLYzIrV0IrU1Mx?=
 =?utf-8?B?VkZyYlhBeXd5RVFBOGo2Nld4dWZKQ1JxYUlRN25iSHJWN01zcFpFNkFMUitG?=
 =?utf-8?B?ZjhwN1h6UzVESE5VVzk3VVNqejVnWitEb1NHZGQzemd2bkdpcUM1eSs3cWg0?=
 =?utf-8?B?VXY1bEdtR0JoRVF1RlltdmZ4dndtNXczNmNXV3BDblZpT01oRjJoRnhJUTlu?=
 =?utf-8?B?NnF5QlhkSHVwWnJiZWoxM0JQVUZSRWZ5QmxRQXIvQXZDdWlzaGVOTHY1MXpR?=
 =?utf-8?B?SGc9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NuGlE3zHr4YbeqPLfiSalddhihcDvRNJfst1sdUy2r4qEICQYfInVLr54SqR7ruGYunSyVaCCytylOEZaAW02s2LfGzUmph9dMONuGOnRIA4rzai2E7a6SzOAvWPrNlwvrp96UR08VtbKeqblK8GlZBFNAW8h7juUMqTgZesorJ8LBK50BAH/zEZNrFlYJLTBXTc5EhkBvApL9uMRQ5oK+8CJ1ijdaOAinEqMf+vBNFqESwvsGZXSKOihoQX7Tpvavl8vz6Rg4zlqPMd+wadqFOPqyattkJOHJvj85M+kY0fnd2nQzyiEu85XAQCKVoscb0v8ozrEa+lsEv8IDsutY0GuszK2c38GMNzxIGOUT2TWA1qAInw+slqGFGfVg+3zeLOfZdCJK7v7vO2TGMgHiJ3clt6QcpGKBZlGnkvjN/n/5+/I9lQU1vvcoIff6cP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 17:28:16.5732 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9f66ee-7e49-45db-b3d4-08de6fdc4491
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF89A593F05
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,gitlab.freedesktop.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4DA1C1612FA
X-Rspamd-Action: no action

Hi Dave, Simona,

Fixes for 6.20/7.0.

The following changes since commit 3e2138510b2ad556a12a7b284a025a23992e4aa1:

  Merge tag 'amd-drm-next-6.20-2026-02-13' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2026-02-18 12:37:27 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.20-2026-02-19

for you to fetch changes up to 3ce2ad267079fcdd2c087bbbfb4f91bec527a4d5:

  drm/amd/display: Remove unneeded DAC link encoder register (2026-02-19 12:16:12 -0500)

----------------------------------------------------------------
amd-drm-next-6.20-2026-02-19:

amdgpu:
- Fixes for DC analog support
- DC FAMS fixes
- DML 2.1 fixes
- eDP fixes
- Misc DC fixes
- Fastboot fix
- 3DLUT fixes
- GPUVM fixes
- 64bpp format fix
- XGMI fix
- Fix for MacBooks with switchable gfx

amdkfd:
- Fix piority inversion with MQDs
- NULL check fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: keep vga memory on MacBooks with switchable graphics

Alex Hung (2):
      drm/amd/display: Check return of shaper curve to HW format
      drm/amd/display: Remove conditional for shaper 3DLUT power-on

Andrew Martin (2):
      drm/amdkfd: Disable MQD queue priority
      drm/amdkfd: Check for NULL return values

Bhuvanachandra Pinninti (1):
      drm/amd/display: Migrate DCCG registers access from hwseq to dccg component.

Charlene Liu (2):
      drm/amd/display: Disable SR feature on eDP1 by default
      drm/amd/display: Correct logic check error for fastboot

Christian König (1):
      drm/amdgpu: fix 4-level paging if GMC supports 57-bit VA v2

Dmytro Laktyushkin (1):
      drm/amd/display: Expose functions of other dcn use

Harish Kasiviswanathan (2):
      drm/amdgpu: Set vmid0 PAGE_TABLE_DEPTH for GFX12.1
      drm/amdgpu: Set atomics to true for xgmi

Mario Kleiner (1):
      drm/amd/display: Use same max plane scaling limits for all 64 bpp formats

Muaaz Nisar (1):
      drm/amd/display: Implementing ramless idle mouse trigger

Nicholas Carbones (3):
      Revert "drm/amd/display: Add Handling for gfxversion DcGfxBase"
      Revert "drm/amd/display: Correct hubp GfxVersion verification"
      Revert "drm/amd/display: Add Gfx Base Case For Linear Tiling Handling"

Saidireddy Yenugu (1):
      drm/amd/display: Skip eDP detection when no sink

Samson Tam (1):
      drm/amd/display: Add static keyword for sharpness tables

Timur Kristóf (9):
      drm/amd/display: Use DCE 6 link encoder for DCE 6 analog connectors
      drm/amd/display: Only use analog link encoder with analog engine
      drm/amd/display: Only use analog stream encoder with analog engine
      drm/amd/display: Don't call find_analog_engine() twice
      drm/amd/display: Turn off DAC in DCE link encoder using VBIOS
      drm/amd/display: Initialize DAC in DCE link encoder using VBIOS
      drm/amd/display: Set CRTC source for DAC using registers
      drm/amd/display: Enable DAC in DCE link encoder
      drm/amd/display: Remove unneeded DAC link encoder register

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  7 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            | 10 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |  8 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |  1 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v4_2_0.c          |  5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             | 15 ++++--
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c   |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12_1.c |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  3 --
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  6 ++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 12 ++++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  5 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |  8 +++
 .../gpu/drm/amd/display/dc/bios/command_table.c    |  3 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  5 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |  7 ---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  1 -
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    | 15 ++++++
 drivers/gpu/drm/amd/display/dc/dc.h                |  1 -
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |  3 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |  9 ++++
 .../gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.c | 54 +++++++++++++++++++-
 .../gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.h | 14 +++--
 .../drm/amd/display/dc/dccg/dcn201/dcn201_dccg.c   |  7 ++-
 .../gpu/drm/amd/display/dc/dccg/dcn21/dcn21_dccg.c |  6 ++-
 .../gpu/drm/amd/display/dc/dccg/dcn30/dcn30_dccg.c |  6 ++-
 .../drm/amd/display/dc/dccg/dcn301/dcn301_dccg.c   |  6 ++-
 .../gpu/drm/amd/display/dc/dccg/dcn31/dcn31_dccg.c |  5 ++
 .../drm/amd/display/dc/dccg/dcn314/dcn314_dccg.c   |  7 ++-
 .../gpu/drm/amd/display/dc/dccg/dcn32/dcn32_dccg.c |  5 ++
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c | 11 +++-
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   | 17 +++----
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  | 58 ++++++++++++++++-----
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.h  |  8 ++-
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c |  3 --
 .../drm/amd/display/dc/dce/dce_stream_encoder.c    | 23 +++++++--
 .../drm/amd/display/dc/dce/dce_stream_encoder.h    | 12 ++++-
 .../drm/amd/display/dc/dce110/dce110_mem_input_v.c |  3 --
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |  2 +-
 .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |  1 -
 .../dc/dml2_0/dml21/dml21_translation_helper.c     |  3 --
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.c   | 10 ++--
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.h   | 10 ++++
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c | 33 +++++-------
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c | 26 ++++------
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c | 26 ++++------
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |  7 +--
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  | 59 +++++-----------------
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  5 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    | 29 +++--------
 .../drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c  |  5 +-
 .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |  9 ++--
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |  5 +-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |  5 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    | 11 ++--
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  3 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  5 +-
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |  2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |  4 ++
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |  2 +
 .../gpu/drm/amd/display/dc/link/link_detection.c   |  2 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    | 14 ++++-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |  1 -
 .../gpu/drm/amd/display/dc/mpc/dcn32/dcn32_mpc.c   |  3 +-
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |  6 +--
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.h |  9 ++++
 .../display/dc/resource/dce100/dce100_resource.c   | 16 ++++--
 .../amd/display/dc/resource/dce60/dce60_resource.c | 14 +++--
 .../amd/display/dc/resource/dce80/dce80_resource.c | 11 ++--
 .../dc/resource/dcn32/dcn32_resource_helpers.c     |  3 +-
 .../amd/display/dc/sspl/dc_spl_isharp_filters.c    |  4 +-
 79 files changed, 458 insertions(+), 275 deletions(-)
