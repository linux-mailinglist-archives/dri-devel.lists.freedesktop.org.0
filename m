Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPbSFFKOp2lKiQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 02:43:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E365D1F99FC
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 02:43:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC6910E924;
	Wed,  4 Mar 2026 01:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="k0JGR3kn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010064.outbound.protection.outlook.com
 [40.93.198.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC26E10E924;
 Wed,  4 Mar 2026 01:43:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQAwXkqpCIMsijuHVU0VtukjDjVoTNy15pz/PHOpuDC54df1mvQK0RSON1lWK4FBan3oeicRxoEDeTF2X36q1urFtKPUryQVzIRno5YjJS0saK8yRz9CdHVPlku78LB3qmgLKqto3tMx4x9J/FjQhT5mVrvpp/uu1aBdXZt+n0p7g0AXnH6huV/sr0zc7Mb2BviAhNQYMwwc6QvCcP2bibtkU9niQvB8L3h2bUkG8x3rm1fwhrZPgT750hUjNDf/N1phALO0x1xyvtw7QSUR8DLiPC90ab9m3voL8oLAn/8IVdjGHTgjL+Qpu/yV31CmMEe8o5II0s2p83CpC8nsiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfcJ3SoPLLFwbXaQENIHCmodEq9HIjms3RY1APWFLZY=;
 b=hqw44iW9d29bHwkEJVKwrshkm8XOeBhn5xbwoqYdVh1+oCr4i9kWUpjew27gsQK223gW2vNcER7te8vWhlNnEKmHNGYGvtlDJ2nabIRKpU0d2aO/NEC/yscxQvJawlc9AA0+QFZz5ALud8asANe5yHs909vqotz3qEGaA7yILIXsnwTPinCVZ44UBgY9GmbAAsnQuX7Eg7wOSt07/NpEMcMPiR2B+rCnlq04s+on551Yoa8+c+MIe9amC1a+L/vrUUk68ZbGBs+sy/Ya6tVlRp/L7q+7NgirI1DWNu743g8190DKOn0VJGWI00A5T6ayX8BAFsHLcWf2aHi5g6OAgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfcJ3SoPLLFwbXaQENIHCmodEq9HIjms3RY1APWFLZY=;
 b=k0JGR3knmBnn4sYulBea+q3poP23Qpo4NPftZOqDoQMWPoUFxu5KpJdtCzcXIwfn7JqPDGUT6b0pXZvI0ghk0GxhAIa2iY5NhzzZdkPaHSAiZUxPK06hHbsJpFqr1aB8zp0VikG/pOdCtNzagrR/P4OC51cpLKMrIrVmziiS5vyw4jX/wl7ZVJoiNKnyh91L5a067pSco/e+XU5Jm479cSF3aTs0YJtAQfrFQ07r4HR2oZtlWYwMsrbZAdu7w9G2lHpiLhIrFMjSgWgW38N6nOgHU7up0OQ+WOwPz/pFJYjxA/GBnFneJCGUxc1ja8QnDDFviuSTmYse2vegmXoR5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BL3PR12MB6545.namprd12.prod.outlook.com (2603:10b6:208:38c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Wed, 4 Mar
 2026 01:43:39 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:43:39 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 04 Mar 2026 10:42:25 +0900
Subject: [PATCH v5 9/9] gpu: nova-core: gsp: add tests for continuation records
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-cmdq-continuation-v5-9-3f19d759ed93@nvidia.com>
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
In-Reply-To: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0322.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::11) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BL3PR12MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 84891953-ef3c-4b33-1260-08de798f75c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: YBcv+LRHDaAqOykzk/65PI/YS65CoG5ILMP0fVuDcwNasI1mpSc22zUz5CaxYgownaLQReMRGy0k1e+/wYxhjNEdSu+sHwQPXsWKZ/vaN14ejf8KdAV5O5psNJDdUiX6YAmtdwdnUmyv12ETk2W6V0y8ipFFQHbTxc9EWUlv6FgsfQ11isPb0kYEI+aWQxExWl9mK523R+R+i5o9/axNc126KUnZaygACsaeBFM3x9WHBijxZvALBgfSP+Jzsn5IVRJp02/ztSA19l4ZfLMWj2UxPnT59jqDFPJb9/4pxI1RZdN4DKTIeRV/tVV1vn8ekCJceG/7T7uxVPb5vvz/Z0oeAuqNzRyDivWrYg4qNCgeIEdyZNmsOWyNZsuSgdXaVnOYrha9K3HvwnHvXF0guDbFMzNdJxGf7HexiQ+scYIF7T4DImKcX1K6OEsnCuG2MoZVIJb5ZrfCrxwB+++vihjo59c1pECYShogpF/5ZmnifW9t3uFpBEhLp83K8s9/KnP/3fnFs8CJu/Jz9tVaFu8noXXt9DgR0K7jI/9+iLctQPtLV89PZEKrBR80LQQrch2rTiTY2HVhomZPE+wK2teTJ/crXL0vDwgDUkeSjs/ijqPD68FGL1kEuI/y/tKsjqGN/K9qTZesh3XGBPsUxivs+EWpLR+nAQU1Zh9j1Q8/mGGQ92pIR/D6qFZBWFyuWh11/5XVZ46TkaF97IEVGsPfLoL+Q+kDnXsEUwC6XLDtbZqqAWE1kxntTFVm2hHxwZjb0xrP+yfhHRY9FXHD0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzU2UkROdjFqSVZVeWhFcU5YVEFGSTZWOWV5M1VFVGs5R2pIQ2NXTFRGdmJk?=
 =?utf-8?B?UlRXUDZCTVFaalFydCt5WjdDU2pIcWNoNzBTZnBKL0hGeDBlYmJ2SDYrYTFw?=
 =?utf-8?B?MW5rLzhOWjVwM21VVTcwbTVSdG1adGxEaGhDRnlmZWl4L0ZDQ3JtaVRwWWxj?=
 =?utf-8?B?aW5SeHRCMHRYemtNWS93T3NUU1Z6ZTY2R2RwMTJrZ0p6Z1BFWTUyTmFCWFFM?=
 =?utf-8?B?RytpaTJ1YUEyY0dncFo0UWdFeUNvSEdxTU45NEtUWEhWQ0JobUhhSmZoR2Qv?=
 =?utf-8?B?L09IRzY1NC9adXV5ZnRxcVByUElac3Q0dFNWS29ldFpkSkMxQ3Fkbk1mL0ZM?=
 =?utf-8?B?R0FQNXRqVHVCaWsxUHlBN2pCNGIrZnJUQytTQStRN0pHRnp1VXFWbWx0ajIv?=
 =?utf-8?B?aE14TWtaN3VnMS93emNjZnBVQXVza2RKSHVaSGJXU3VnRW9qMCtJSlQ3SEFa?=
 =?utf-8?B?ZlV0bGJITjA3RmdybVUrNnBJeHpaNnc0b0pMcWNqVUxUYmFrM2k4dEJJcG96?=
 =?utf-8?B?d2NEQ1ZuMStQRS9aOWpWclF0REd3MjgxL3ZKZmg5SVJiUkFyL0RGeGpYL3VH?=
 =?utf-8?B?TVUzam9CbEphMFBiaW9nVzB4ckpnK1AvekVzdVQ0Wkt5UEFHRVBpVEdSNDVt?=
 =?utf-8?B?dVliaktMaDdBUlBLcWRoS0sxZ0xoU2p6QzIrWWtoNnp5VndlMnd2YW9lMUNa?=
 =?utf-8?B?ZDBjaTVGc1Q0WW5XNEhjTHdtR09seVcwcmlZcWRiR05tQ2Y4V3FIYktQTUtB?=
 =?utf-8?B?WEZkMTh0cWMvN3Z5UzFsVmJUMWs0aHpxcE8rdzZ4bUFTaHlianZlTlNadkU2?=
 =?utf-8?B?WFdSUk5kMzVKdExNV0hvWHVCUUh4ZnVZMjR5cnJ6eEYzUWR2SEZUbWh2aG5O?=
 =?utf-8?B?RHNiTldxa20vK2FjV3doS3RTc0Q4MVFEUnVjdzJDNVZ6d0pnUklVTWdQMzl2?=
 =?utf-8?B?ZVFkZStPQi8xdU9OVTRoRmJzSzVuTThCWGxhVEp5dTlrQjRYTGQzRUR5czdQ?=
 =?utf-8?B?RUdNVjFYUXlHdjljNmlGVVZYNStRQUZZWm82M2FDMElQUU1KMlJ3R1phamhi?=
 =?utf-8?B?ZUxjWVd1MTNDNEVJa0gyU1FGSWt2OHNpWWx0eks1cXliZVMwaUhjOS83ZmRQ?=
 =?utf-8?B?SHoySXI1UWtRaWxGU1pvcTNWcHl0QjF2SWFmdmhpN3VqendLZjF1WnVEMkpD?=
 =?utf-8?B?YVVMbXJud1c2QnZRUEgvOXg0b09ZanRhWjN5c29WVm91NFpZVmFrdjNGdTNl?=
 =?utf-8?B?U2x6S0dyN0Z2K0oveFIzN2MxL09FeVRXRzhBeEtIdXdOR1RUNHNLSEtoOUM1?=
 =?utf-8?B?ZW5LZkRyTHB5dkFPWlF5blRrRE5OMFBsN3JFS1pyTjd6MW1CcmtCcnBwQXp0?=
 =?utf-8?B?bmJsczZORW1Jc0lraEhkZmg2OXNDbi90aERSTVhmUFFiNnlySzFSV1o3TTBC?=
 =?utf-8?B?Rm1RWUJqOXZQQzhPSkJOV3FsbHVWVDBBdjZTams4bWR0RVF4Z1ZZK3lhYnVY?=
 =?utf-8?B?YUlFeDJXaFpJd0ZueHowY092aTc2d0hOcC93K01ncTlrQUVJS05XWDh2QkFT?=
 =?utf-8?B?TkhhS3g2Y3ZKK0lYNGIxMWpTdkVjVEZDOWpENmNSNjJQcXNHdTE3SUNIUWZM?=
 =?utf-8?B?TXA3Y0ZpTHdyY0Z4MnBlNWNjQyt4aXpKeTFZVHE3dlNINHVtRE1LSjNDQW9Y?=
 =?utf-8?B?MGg2c1czQkpDNHZ5WldZZExQRzQyeVlWczB5NkdFVXN6MEt3UFB3MGxsU1hC?=
 =?utf-8?B?TWs5aW1YdDlkR2Y3OVdBZHY3cTNGRkZiS3FHM3ZZWGloWkFHTTgydUREMkx3?=
 =?utf-8?B?SDFEYU5vSDk3ekk1VFhnd0xmM2JnOXA4Q0lsa2FtcDRiOHNwT0gvM2lnOWVT?=
 =?utf-8?B?M1ovcjNPRUJ6SEJUMEFBdU5qclJpV3pIMmdxSXJoZXFLaTNsWnBjcFp6cTNK?=
 =?utf-8?B?Zi9UdlprdXRTVzBLYkNOdEtNUjNLVmdtVHUvaUgwdTBiYWkzcy9KaDVmekJM?=
 =?utf-8?B?Z3g4NXJRVVNqWkVieTJ6cVNZa2RNUDRNdVllelVHUUxDcHMvUGV0amxCcjFr?=
 =?utf-8?B?VTVOZWFwWXNOZ3dOeVFiSkhmbmhmTGQ3YjdMeTlSSzNsOGhrWWhQdjR6WTR5?=
 =?utf-8?B?dkxyZkZydmp5WFJJdzl1RkNDc3VBSEc1bTI5cXBkSHhNY3RkQzhnMjdUaEpP?=
 =?utf-8?B?QmFTT3lkRVZZS3NQelNHaE10dXVNVTJGNnFSKy93SGl6cFZjTEJ4MDk3bGJr?=
 =?utf-8?B?ZXQxU2FKRy9OSWxuZUJ3NU50MnV0TlhtT3J1YlZIbFl0aDRYUmJwV01VZm11?=
 =?utf-8?B?UHpyYmp0VjlhaFdYdVNERUlWMldUUUo3RUxUdHdKUk5oUWEySWtkUVVVc1di?=
 =?utf-8?Q?cNriLrM8TadH/pF16Dj16flUiWyTBdu68DN+aieR/2Vcj?=
X-MS-Exchange-AntiSpam-MessageData-1: ngpfuDswn3bohw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84891953-ef3c-4b33-1260-08de798f75c6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 01:43:39.7758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sw4RmSAvl7LxHrLPVzR/vMs0rB5mj3lrF6yOXM3HKGp/HJzQ9m9qmr9md7Rt2TqmI2DeaQk7+2U4VbsF1jqvmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6545
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
X-Rspamd-Queue-Id: E365D1F99FC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Action: no action

Add tests for continuation record splitting. They cover boundary
conditions at the split points to make sure the right number of
continuation records are made. They also check that the data
concatenated is correct.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq/continuation.rs | 138 +++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
index 3b83cdcbb39e..637942917237 100644
--- a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
@@ -161,3 +161,141 @@ fn init_variable_payload(
         dst.write_all(&self.payload)
     }
 }
+
+#[kunit_tests(nova_core_gsp_continuation)]
+mod tests {
+    use super::*;
+
+    use kernel::transmute::{
+        AsBytes,
+        FromBytes, //
+    };
+
+    /// Non-zero-sized command header for testing.
+    #[repr(C)]
+    #[derive(Clone, Copy, Zeroable)]
+    struct TestHeader([u8; 64]);
+
+    // SAFETY: `TestHeader` is a plain array of bytes for which all bit patterns are valid.
+    unsafe impl FromBytes for TestHeader {}
+
+    // SAFETY: `TestHeader` is a plain array of bytes for which all bit patterns are valid.
+    unsafe impl AsBytes for TestHeader {}
+
+    struct TestPayload {
+        data: KVVec<u8>,
+    }
+
+    impl TestPayload {
+        fn generate_pattern(len: usize) -> Result<KVVec<u8>> {
+            let mut data = KVVec::with_capacity(len, GFP_KERNEL)?;
+            for i in 0..len {
+                // Mix in higher bits so the pattern does not repeat every 256 bytes.
+                data.push((i ^ (i >> 8)) as u8, GFP_KERNEL)?;
+            }
+            Ok(data)
+        }
+
+        fn new(len: usize) -> Result<Self> {
+            Ok(Self {
+                data: Self::generate_pattern(len)?,
+            })
+        }
+    }
+
+    impl CommandToGsp for TestPayload {
+        const FUNCTION: MsgFunction = MsgFunction::Nop;
+        type Command = TestHeader;
+        type InitError = Infallible;
+
+        fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+            TestHeader::init_zeroed()
+        }
+
+        fn variable_payload_len(&self) -> usize {
+            self.data.len()
+        }
+
+        fn init_variable_payload(
+            &self,
+            dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+        ) -> Result {
+            dst.write_all(self.data.as_slice())
+        }
+    }
+
+    /// Maximum variable payload size that fits in the first command alongside the header.
+    const MAX_FIRST_PAYLOAD: usize = SplitState::<TestPayload>::MAX_FIRST_PAYLOAD;
+
+    fn read_payload(cmd: impl CommandToGsp) -> Result<KVVec<u8>> {
+        let len = cmd.variable_payload_len();
+        let mut buf = KVVec::from_elem(0u8, len, GFP_KERNEL)?;
+        let mut sbuf = SBufferIter::new_writer([buf.as_mut_slice(), &mut []]);
+        cmd.init_variable_payload(&mut sbuf)?;
+        drop(sbuf);
+        Ok(buf)
+    }
+
+    struct SplitTest {
+        payload_size: usize,
+        num_continuations: usize,
+    }
+
+    fn check_split(t: SplitTest) -> Result {
+        let payload = TestPayload::new(t.payload_size)?;
+        let mut num_continuations = 0;
+
+        let buf = match SplitState::new(payload)? {
+            SplitState::Single(cmd) => read_payload(cmd)?,
+            SplitState::Split(cmd, mut continuations) => {
+                let mut buf = read_payload(cmd)?;
+                assert!(size_of::<TestHeader>() + buf.len() <= MAX_CMD_SIZE);
+
+                while let Some(cont) = continuations.next() {
+                    let payload = read_payload(cont)?;
+                    assert!(payload.len() <= MAX_CMD_SIZE);
+                    buf.extend_from_slice(&payload, GFP_KERNEL)?;
+                    num_continuations += 1;
+                }
+
+                buf
+            }
+        };
+
+        assert_eq!(num_continuations, t.num_continuations);
+        assert_eq!(
+            buf.as_slice(),
+            TestPayload::generate_pattern(t.payload_size)?.as_slice()
+        );
+        Ok(())
+    }
+
+    #[test]
+    fn split_command() -> Result {
+        check_split(SplitTest {
+            payload_size: 0,
+            num_continuations: 0,
+        })?;
+        check_split(SplitTest {
+            payload_size: MAX_FIRST_PAYLOAD,
+            num_continuations: 0,
+        })?;
+        check_split(SplitTest {
+            payload_size: MAX_FIRST_PAYLOAD + 1,
+            num_continuations: 1,
+        })?;
+        check_split(SplitTest {
+            payload_size: MAX_FIRST_PAYLOAD + MAX_CMD_SIZE,
+            num_continuations: 1,
+        })?;
+        check_split(SplitTest {
+            payload_size: MAX_FIRST_PAYLOAD + MAX_CMD_SIZE + 1,
+            num_continuations: 2,
+        })?;
+        check_split(SplitTest {
+            payload_size: MAX_FIRST_PAYLOAD + MAX_CMD_SIZE * 3 + MAX_CMD_SIZE / 2,
+            num_continuations: 4,
+        })?;
+        Ok(())
+    }
+}

-- 
2.53.0

