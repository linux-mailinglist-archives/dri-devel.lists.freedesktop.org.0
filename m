Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oApRBMB3pWkNBgYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:42:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54C51D7AD7
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F53E10E495;
	Mon,  2 Mar 2026 11:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="r/hgZQKz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010053.outbound.protection.outlook.com
 [52.101.193.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE1810E495;
 Mon,  2 Mar 2026 11:42:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kl0PjFTNUBtvRY1UmBHQkfkna47F9NFIVmUxaMAmie1NvBxGtcvV+FuMtkNUTnQou8kXFOenhCy5J5AR78M7ltS5+a8KE42TCsIwZ8mbV1tsiSzEuR1VJ9sVfumFL2n81cEekJELTjn182FsNh9kYRGHsQAzEzZOs7mseczu9rHsbiO1yBN7DCrv6AZA0sT86FaevcM1iqx/R2AYxitQExd6RbMwMegh1T8xaxQWV6PDezNeW3EoQntWg7Bzzwk17DuFlTCPb02SPTW3RlQTUnz6Uep0wLbPIEdgkzsNH1eEUzuizSN+H2kh0hDPpDOnfTIouT5/AV+vTbLJZ09m3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlV2elmORmaHKw7bZCVBzJCNQE8R07ffJJ9cr27FbKM=;
 b=VqWK5jle9fRZGo9stWlh1iqRaioSF8qw9WnGlCpk5XBOz3fPckaMT9zcXB84T2IOxbuPU5Ss38C0VYY9/iqBfimC6Rf//uH1Qcs1U6j9MaQ+KbRGdcq5Q8Mlf46aCMMXK2HH6+YWhg9kwaibgXi9XBVXWq/C+gSK1oDcFXR1TTk2q4rrKRdqzSmDtKoQkeiO55iDfRQ0+p1eUu/xr+L7JQ/aKH4MqrVhoIfLuAYsODvamSfA8A0Q55hq7zL0X3N7OXQWvTYIZwrhPdMVtNm6VsfJJav6ysufMvND3OPEBTksy+bsX68LdE6ugXVCXpEJs7di7urRjwDq2QEsgw65YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlV2elmORmaHKw7bZCVBzJCNQE8R07ffJJ9cr27FbKM=;
 b=r/hgZQKznIN8lZBMcxQPOOIs/ZR30zTgg58xfVkBIS8BbwV4Yh3aAOyqe2FBjt4zHO0C8ZrAiO2lVBAHJ6m1D0iXoXfg36iWK9ARn3WhlA7bxWaH1/I2yIABqBxkVAjnj1RvKrbhUFvgcB95OVNV/Hw+RXhyQ6j8SYYBEPv6zUbSqyzpFqhUcw3sAzLdKkp6v2ASCGMwYdFbz4c5YKp3+HEALI3Vmbc3fb16zuueDar4IGEURuIn49h1mSDqhVbzCBeJbb8fQuQTsvTj5K12UcDroC3vPuVOyd1di/yka2Hj5r8/ysET60rEDvAnga/9a/RZdhR3wsfuqmJttOIxHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 11:42:45 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 11:42:45 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Mon, 02 Mar 2026 20:42:25 +0900
Subject: [PATCH v4 1/9] gpu: nova-core: gsp: sort MsgFunction variants
 alphabetically
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-cmdq-continuation-v4-1-c011f15aad58@nvidia.com>
References: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
In-Reply-To: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0045.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::12) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 338d63aa-7595-467e-82a1-08de7850d27e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: AOnE8SNGdEOPssKdYp/NNIZ7KdHWVVFbdhJkyCm8AcWmIjs4kiYplYUinTBEk2vSXL/qiNEMbGTj9ifJOMp6hEbZXgz+XCA6K8jGOKKDGEiDNFoiEj00oazz1wOUx4Sbiu/e6HQDIZqRbiaILkUVYLoWQd1sbBj0eg6vDnYR5spSMIrARvJhvr/9v5w5sTPQfc+fZQXbt50VfkergAkH+bee18W06rhrRM2j73L0iGufAxLdjlyRBaiNHAFMGBl+bM7zYZ6w0aR9GTmheqlTL9KzNq0BxWhg1dW3dzGxnLAYkYduXU/PM1cXBuj5ldIdPKx3zlIFAyrkSKNmUB9pkWP0pWfbo6u/kOOJYgtjh1D37AaDtbjcCzLIBf6Zy/hKFmHSjnsKXhBugr0dZba/dsSKHofgNCrp4vEKuM528HdCadI7s97vNLzdEEK1epxJUwMweh0kQ+5J7HcZ26v32uAX5O3ZA1zxCyRxSjuma+f2Nux5bcJrz31/eXV0Vz4eVPGEZ80UfzdijgGFUl3TfL/ez4//z6s7ZJ5u0gn9QbNKAmKqvULu6T/UQYlFXDECSUyw+3lEO0+tu6jsoTCIV1nJCDU+MqG2UIJSE04In/JYJHpPghjqSMTMOgBIsBwHmP1TRa6/rG5Wv3zu4DGStzkeYLRvQOt/cjvfGW2CYsWSIOLvNyY1qVcpRZjBDSm4nPDbx4vYWeMxpBZIyhT2ts8HuiaUb0OAThQ5YzNV53PKIlnnkqBCK6/VoVxSzJWyPkwmb+NcBi8TG4TwT66YZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3NzamMrQk0wNy81Yjc3bnNCeVduMDgvNURRWEpvZVpFSmN1MktPcUd2a3lR?=
 =?utf-8?B?RTZYbGlwcjdvYjdpNXBRenFZMEtKVDNNRms1RTRIL09sUlhFKzRDYlN1NmY5?=
 =?utf-8?B?Uzk0V09keWxLTUFJQmxyTU5DZWdxWngxT0diU21JcVJkNWl6WC9naEI5WkNK?=
 =?utf-8?B?S3NLdi8ydG1KbXhseGVGZmNGUlVlUG9wWXg4ZUdSQXJUbTJSa3hYekVUUVRN?=
 =?utf-8?B?SCt2a0l4WEU4SnV6MFVLUkN4SFpDMElmNGkxQ2czQnRScXcxTW42WFJSUS9H?=
 =?utf-8?B?eHpJT2huZmp6Q3VGN3lhWDFDc2FtOVZtSlY1cW0xNzlwZERxQzVINVA0Yzlr?=
 =?utf-8?B?UEh5aDdmQ29zZ3hGTkpFMVVQR3lpeHJuUTRzY0xPV2hCRXp0MGROblVFaHp1?=
 =?utf-8?B?RkJFS25nR2tYalVXN3VicGhnTmdidEhwbHArYzY4VHlSWThmTFk1L3R4WjJP?=
 =?utf-8?B?aVNFa3dHYWJGQVd0YUViUlcvSGNOZS95dEpoclZxZEVNOWFFN1NCQkFTL2cv?=
 =?utf-8?B?Skd0KytRa09xWndSeDhzRy9UR1R5dm53clhpWS9PS3BsWUl6ODR4c1pKQzJz?=
 =?utf-8?B?ditxZkNWbFFzaGI3dENhRnJmRDBucDFkbHpDcHZkV3hBSkNJQm9jbFRobmh0?=
 =?utf-8?B?bVk2Zm1vY1ZJNC93a2k5SDdobit3SUEzL2x0ZVNlNEIyU2tCSmhmSHcxTmEy?=
 =?utf-8?B?eEZkU2hkdU5wZ09wYmFnK2hYTmhRMm1aSE1IZHJCS1ZweEhhWVlFZkZWUVN4?=
 =?utf-8?B?RTRoNVBaZ2g2ZTM1QkZwUkxpcmwycnZ2empEYmR4Z0ZsV2Exano1ZFczdGhq?=
 =?utf-8?B?UGprVFZuTks1V2dja0RpQ21jREZ2VWFWQ3pFQXdrMFZIRUtWaEo4TTlNVFJq?=
 =?utf-8?B?UklTRVNZUEh6Mmo3RXJoem92S2xXWEorRmFQMU1ZWXV6WU8vNmluUnlSS0Rw?=
 =?utf-8?B?bnFvWVZTbituOWgwbnJaMkhRYTNHamF3cGpITzBWUFdtaURGVkhEdEM2cHVS?=
 =?utf-8?B?aE02SGxCUUhENDRoVUJOcVQ4RTk3UVM2TUw5TGthUWdRb082YXdORG1VUTlq?=
 =?utf-8?B?ZzhybWViMktiaUlXUHdjdHFGaDlPYlQrYTJndXhnOVdpZVVHMGVueUhCcFlu?=
 =?utf-8?B?aGZDVTJTTll4QWphbXU2bnFVTGszWTRmczJXY2orbTg0TTl4MDdYbDFENHhU?=
 =?utf-8?B?akJXeDhLRGNsMm5sbHNUTG5xL0QyampGcGpjSzREK0x1ZzdMcjFkeTBkSUFq?=
 =?utf-8?B?RHZQL3BDWWxoUDM1OW1BY3A4S1N1RmFPVVFvd3VNTzRLWkVaS0txRHM5TlFV?=
 =?utf-8?B?NmxjazkzVEozR2Z5WmlrL3VTVjlsc0tSZ2lUYjgyWXlPMVV3c1NhWGZBSXQ1?=
 =?utf-8?B?Sm1PcmVrUWhLZkhSTit4VnlNaTczLzZ1Q3ZYdDVGaWVucUdSdHpqcE9UUXhR?=
 =?utf-8?B?TU5FaDNiN25lNWh2cU9FK2g2V0NNREhIUzRXSHZQSEtSOWozb1NYRGw0azU3?=
 =?utf-8?B?dFFjM3luRkxXQlFDSUpLbGtOUEF6bUwwUXBtSzBOSXVUK1RCL2MwTFk0MmtB?=
 =?utf-8?B?bHlJRjNvb1c0U3hhQ250MWxhcG1odWVHWEZZdndmRVpuSWRBVEp2OUd1bjlN?=
 =?utf-8?B?ZFo3OXhrNVcwUGVOczh5emNyeUVIWnR6QlNQS0VrTHBKYWZFT2xkeEEvK2cw?=
 =?utf-8?B?WjBxVVJaN0lmMlJMa0VrdXU4K3dxWXhZcGlxbTdEUzZaYzdFYndvRTNSRWMr?=
 =?utf-8?B?dzl3dGFDVHNHeFMvTm91RXMxcjVuZ3ZQNEoxMjUwZjhQRlhZc1cxVzdqN0tw?=
 =?utf-8?B?WlBIK1VUMmhPZmNBeTA2QTZhS3lubmloUFA5bmtBcFBJSTdRMENIMUg3aTM0?=
 =?utf-8?B?VkVXSnUvc1oyRklFK3JlbVB1L1k1UUI2d2Y3d0NOZlI5c1ExakRJa2J1VVQv?=
 =?utf-8?B?SzhMUzNZOCtDR2ZBbXlvdkRYNEF3ZGZoYjQwc2RWT1R4NWJCaEozSXFUV00x?=
 =?utf-8?B?ZEMrbDJBckN1eGVXelFwM3l1R2RiemZvSDdEYTlydEEzNHc0YjJnQkVTZ2VI?=
 =?utf-8?B?WmFrTHl0SVlGcXZPNGQwcFNzaW45ZnZ0cXV5c2w1VWJuNHJ4bXQ0L1UwaStN?=
 =?utf-8?B?cGRTelJTSTNvN29YSXo1UFNhMUhuakpqL0NBZlN4UkwzU2lHL01BK29VblNM?=
 =?utf-8?B?WHdyRGRQYm9EdFAzTENadFN3cnkrRE5JbHMzSUlSVXZ4SzVFMG94WHlsQmpX?=
 =?utf-8?B?ZUk0Z0FSN0wwT1lwMDdPZzJZdFZuckh2dzNyZjA5d1lOc3g4WWVVeW1ySWFp?=
 =?utf-8?B?UTQxWmQrcUpBTFY5bWRtSmtybHNHUEpMWUhUNEJ6OGJsYW5ablhCTGZxeTg3?=
 =?utf-8?Q?8g0a/PHEgfp0UyWsWdPhh/mjtm+y3yKGU+MrxsdI/uGJi?=
X-MS-Exchange-AntiSpam-MessageData-1: KXCvsmVpJGAswA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 338d63aa-7595-467e-82a1-08de7850d27e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 11:42:45.8809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FWqzbsRr6D9XpvR4Av1XZ13rabi7tjgOAzfwvY9MI0EvBYyi8f2EU9+WL+SY0x7XSdEYgDZAnNcTZVVBONT7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6259
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: A54C51D7AD7
X-Rspamd-Action: no action

There is no particular order required here and keeping them alphabetical
will help preventing future mistakes.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 67 +++++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index f1797e1f0d9d..4b998485360b 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -191,34 +191,34 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
 #[repr(u32)]
 pub(crate) enum MsgFunction {
     // Common function codes
-    Nop = bindings::NV_VGPU_MSG_FUNCTION_NOP,
-    SetGuestSystemInfo = bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO,
-    AllocRoot = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
+    AllocChannelDma = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA,
+    AllocCtxDma = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA,
     AllocDevice = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE,
     AllocMemory = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY,
-    AllocCtxDma = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA,
-    AllocChannelDma = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA,
-    MapMemory = bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY,
-    BindCtxDma = bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
     AllocObject = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT,
+    AllocRoot = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
+    BindCtxDma = bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
     Free = bindings::NV_VGPU_MSG_FUNCTION_FREE,
-    Log = bindings::NV_VGPU_MSG_FUNCTION_LOG,
     GetGspStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO,
-    SetRegistry = bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
-    GspSetSystemInfo = bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO,
+    GetStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
     GspInitPostObjGpu = bindings::NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU,
     GspRmControl = bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
-    GetStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
+    GspSetSystemInfo = bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO,
+    Log = bindings::NV_VGPU_MSG_FUNCTION_LOG,
+    MapMemory = bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY,
+    Nop = bindings::NV_VGPU_MSG_FUNCTION_NOP,
+    SetGuestSystemInfo = bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO,
+    SetRegistry = bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
 
     // Event codes
     GspInitDone = bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
+    GspLockdownNotice = bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
+    GspPostNoCat = bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD,
     GspRunCpuSequencer = bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
-    PostEvent = bindings::NV_VGPU_MSG_EVENT_POST_EVENT,
-    RcTriggered = bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED,
     MmuFaultQueued = bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
     OsErrorLog = bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
-    GspPostNoCat = bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD,
-    GspLockdownNotice = bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
+    PostEvent = bindings::NV_VGPU_MSG_EVENT_POST_EVENT,
+    RcTriggered = bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED,
     UcodeLibOsPrint = bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
 }
 
@@ -227,38 +227,41 @@ impl TryFrom<u32> for MsgFunction {
 
     fn try_from(value: u32) -> Result<MsgFunction> {
         match value {
-            bindings::NV_VGPU_MSG_FUNCTION_NOP => Ok(MsgFunction::Nop),
-            bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO => {
-                Ok(MsgFunction::SetGuestSystemInfo)
-            }
-            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT => Ok(MsgFunction::AllocRoot),
+            // Common function codes
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA => Ok(MsgFunction::AllocChannelDma),
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA => Ok(MsgFunction::AllocCtxDma),
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE => Ok(MsgFunction::AllocDevice),
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY => Ok(MsgFunction::AllocMemory),
-            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA => Ok(MsgFunction::AllocCtxDma),
-            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA => Ok(MsgFunction::AllocChannelDma),
-            bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY => Ok(MsgFunction::MapMemory),
-            bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA => Ok(MsgFunction::BindCtxDma),
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT => Ok(MsgFunction::AllocObject),
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT => Ok(MsgFunction::AllocRoot),
+            bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA => Ok(MsgFunction::BindCtxDma),
             bindings::NV_VGPU_MSG_FUNCTION_FREE => Ok(MsgFunction::Free),
-            bindings::NV_VGPU_MSG_FUNCTION_LOG => Ok(MsgFunction::Log),
             bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO => Ok(MsgFunction::GetGspStaticInfo),
-            bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY => Ok(MsgFunction::SetRegistry),
-            bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO => Ok(MsgFunction::GspSetSystemInfo),
+            bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO => Ok(MsgFunction::GetStaticInfo),
             bindings::NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU => {
                 Ok(MsgFunction::GspInitPostObjGpu)
             }
             bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL => Ok(MsgFunction::GspRmControl),
-            bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO => Ok(MsgFunction::GetStaticInfo),
+            bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO => Ok(MsgFunction::GspSetSystemInfo),
+            bindings::NV_VGPU_MSG_FUNCTION_LOG => Ok(MsgFunction::Log),
+            bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY => Ok(MsgFunction::MapMemory),
+            bindings::NV_VGPU_MSG_FUNCTION_NOP => Ok(MsgFunction::Nop),
+            bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO => {
+                Ok(MsgFunction::SetGuestSystemInfo)
+            }
+            bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY => Ok(MsgFunction::SetRegistry),
+
+            // Event codes
             bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE => Ok(MsgFunction::GspInitDone),
+            bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE => Ok(MsgFunction::GspLockdownNotice),
+            bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD => Ok(MsgFunction::GspPostNoCat),
             bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER => {
                 Ok(MsgFunction::GspRunCpuSequencer)
             }
-            bindings::NV_VGPU_MSG_EVENT_POST_EVENT => Ok(MsgFunction::PostEvent),
-            bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED => Ok(MsgFunction::RcTriggered),
             bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED => Ok(MsgFunction::MmuFaultQueued),
             bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG => Ok(MsgFunction::OsErrorLog),
-            bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD => Ok(MsgFunction::GspPostNoCat),
-            bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE => Ok(MsgFunction::GspLockdownNotice),
+            bindings::NV_VGPU_MSG_EVENT_POST_EVENT => Ok(MsgFunction::PostEvent),
+            bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED => Ok(MsgFunction::RcTriggered),
             bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT => Ok(MsgFunction::UcodeLibOsPrint),
             _ => Err(EINVAL),
         }

-- 
2.53.0

