Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHfwN7EyoGmLgAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:46:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0BD1A5468
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DC410E8F4;
	Thu, 26 Feb 2026 11:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="U85loN84";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012070.outbound.protection.outlook.com [52.101.48.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDB910E03F;
 Thu, 26 Feb 2026 11:46:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1+rfEAaSjL//SOyE5C/kDYd047uUdEIIcwBBn1Rr0zEUNTDsMSNgCUCvlwrXev82VaSxHCfVz1oW6/+ClJtGmk4PyN4sOF1kPpoAnBYX1oVp00kv2TxpfDm4sdTDQCUs2B9qiVDvZgRn3i5BRtGzPwCkGHJI40nQH7iX7RblccIaPdp3uxRQ0O/nIGrvymdP4s96A1lcG/dHs4oG0i50THqdRDLSOs7LSiJoalyj09VkjXVztamlPbTUT66QAPr4chQtZIvouTFCyoKzRY2vNpfZeYSk0JTYIKvsDuHwHiEuQ3WbNfZa8wCbdU7iRJNstupMyYg1hpqXmtDSxJOSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlV2elmORmaHKw7bZCVBzJCNQE8R07ffJJ9cr27FbKM=;
 b=gipHNlUYHg9aWKJ6pOrsomZAy0mEvwWcmL9yxCAyXA8LF7utMCpZk7BjpD+Rb/YP1w6vd55KZeG4P+q534vENJ5uQdDcCpnuW7B7rpDYSf1OBvS2vG171xuxx/UvWfdSIHWX28rfbhYgBSX04C/0eV/Bi3RP9A30CnAl9PjVS+matlEBZK3A1PyW0eSZDmSls6e4oCRVla8frloc4hD6s90nDdkdnlDASTWgaZxw2gvuUYQM47e2p1pSc9BOh7RXRraSlZgVQpZXA5WxPkprmhUapgXKDLvwE+z5GRwSJByI0H52ar4nE0CsIZ0/sqbCBrjrutNhmq/8aJDy5diW8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlV2elmORmaHKw7bZCVBzJCNQE8R07ffJJ9cr27FbKM=;
 b=U85loN84xByGcRuF4r21iG/Uo8lN9GKXKGP4M6KbTG/NMYGxQxusuH4QnLPA2ZhctWK/Rc9XDLCNKwXgHI1pCalvkFfux4ZGdE8Evapd88y4e/WOA2OmO4JkNkuVqwoEb1GlDaCDSIzMRnAieJsVNh8x2h/DyXikL5kNG+jOG/bIAKhHx6nlVizUX0DvpNBJ82ZMjIPv+CwORUIzDq+H8Vw/XTXQo60uvAYBL3sIqM21wsoHfFHCRukIFnd0wdEsPO8qdOvL8FeQAJi9OA8DvAGcst+uI6fY4sNieTqY3oBixtIqEAoQ1ZHHu/ymKA4jaf0YiEW7JQnJK+VE1H10ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Thu, 26 Feb
 2026 11:46:46 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 11:46:45 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 26 Feb 2026 20:45:33 +0900
Subject: [PATCH v3 1/9] gpu: nova-core: gsp: sort MsgFunction variants
 alphabetically
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-cmdq-continuation-v3-1-572ab9916766@nvidia.com>
References: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
In-Reply-To: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0059.jpnprd01.prod.outlook.com
 (2603:1096:405:2::23) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 689c7b0e-3830-47d0-aeae-08de752cb775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: GQHFo21pQshG0734nlKa1dGdZj2uXsbMteb4PgWJnE+oW0DcwndP1ZkPtPk55+FwArHOOKPx+EDuSMisqVfFFJVv3gn0Imz8aRPi0KNMHI5mFFTRDHDOXRuSo2Z6VTRBExm/QOoaYvWFwJnu4PE0h+BYQcG6hmUrIwMnxuNhxscACtucJs0qz5eOkTeWW/qMvzmAW9x1nq1tIUVc6t57UjY7F8N3MFVP/m4ToteYnQW5TxnZZokAeB0Mz9LV9Et29AEUl6cDefMM4W5TYA8ZRzNeP93KtS7fGBgSsM+8voJ5b0J1uPb9DwCwRJF+vXaRZ4ASxdH+1+0nrj69GPCC5gXNnSaTQ5OiWIvfgmxqzJRHXeSdGoUnwOlXOz25QJ0gguvZJDI0EXonVMVm5W4tCFlJPyWcQat8fgID/wkqR+kvaBQiJeFr2V8ObS76E7MMqnEhWdAJh9Ompzfnt/h9gYYo2f9d9dabDst46jK7rkg0e8N6Ksk70wDldpNWcfBXMg1nJV0ZW7TrxHHXTIiu9XFNIbJB4rhYaEKyG7x6IVsyn7zRljnXPR5Qlk5auGFIsy9omp2oyB8tVuUBvC/AMx9XGy1fxjhTaKGywj9fChQI836H4aj1C7MEa/VknFY463F/Coz0bwjVFI1VR8T4DN5hJB5bwZQGGcPKwliTzk+vm/9umnR/Z2jkme9b4cDxDp2IYOq1AWBCwe6JYA/H8UbaMAZBYR41MEVVsNuKiNRrl11KAKxZn/94k5xxQhFvnhqE4mNUVtR7HU64Tmaoww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEVRZ0k4bkE2SktBejhKOEF0OWNZNnhtMDFVOXVZTnFYcW5iM1V2T3czRmVv?=
 =?utf-8?B?NEdxU0xhbFdlU0kyQk11UHdyY1R1Z0VQZXh6dzl5enNCazA2elc2Y1JvVUxI?=
 =?utf-8?B?OWczRlJYUTFwUXJaZytLeXVFV3FRbmx6VFZ2R1BkWmsxdXk2R3h4QjJsUjVq?=
 =?utf-8?B?UkJiOXVOeDhZZGszVm9kRG02L0NmY1lwYWRlSEpBbE1vc3hzd3RwblJ3UTh0?=
 =?utf-8?B?VEhXRi84a1Z3U21mT0lyd1hsQnovUjQvRVU1RWVZVEdKazA4N2hhRWpHSjFx?=
 =?utf-8?B?M3RTS3FVRFkvVDNNQ0VCT1dHc1hRd2RrTTJGbkZVbDVxRG80MjFnN2lXeGVo?=
 =?utf-8?B?ZUdlSVViSzI5UURyd1BqeWx3cnVFMnFMcytRbTNQY0ZaWjNWbmMxZndSbnlB?=
 =?utf-8?B?ZTMyZjUwVkJZVndQWnhwUE82eStEYU0yVmQrcTNuMWliTnJNa1NsdThDd0Nw?=
 =?utf-8?B?TkVhU24zTnNFZVQ2MkZmdW95cFlnd0JZWXJyUVNhekkvQWdzWHpkcHYxbTQ4?=
 =?utf-8?B?VEIwQ0Vra0RCSTZZbCtNMU1jQ3g5RDhNeXdtTXVkN29EM2pPWHF3NklHZVBx?=
 =?utf-8?B?Wlp2cGFQOXJScVlXaEd3OEFvU2duaHordnlqUEViT1FZcVVlSllsRVF3NXho?=
 =?utf-8?B?OUNjQTFITjVMRDUvWU1MRkdhSFdTKy9MS3hPY3ZXSzM0ajQ5VVFMMzV4UFg5?=
 =?utf-8?B?RUVoY2FMa1hMYmJMYmNTYUNsYjBSTE83MTF1Y29GWDlITElQWW9jRUphd01Z?=
 =?utf-8?B?NDdJMEFhYitQNXlpSHpiMGc3d2VpUVRRK05lWFcxZm9FRDBoTDNJbWphMFFL?=
 =?utf-8?B?RFl2Vmo0UytKWUhuaEI5VDM1ZGdRWXhnVEtGSDVVM3dmQ015SUJKNll0M296?=
 =?utf-8?B?OStIckVUaTFxdmkzZTByUTFwdStNcVZuSGJWL0lQQjJCZWtuM1lrUk9UOXBt?=
 =?utf-8?B?U3Z2bzIrcUIrclUzMHpTenhYMDd0d0VENk03ZHBnTnZQY01YR0JJem9ITjJ4?=
 =?utf-8?B?U29CZGpHaWVrcXBVRnBNOVliQUNyWGdqL3hFeEFyeXphRlBkZm1oeloySkJv?=
 =?utf-8?B?WmlBTGFMN2ZGb3hKZmtFYjdobTd0UTNXcFlIL3RXdlErRzZBaFZFS2Y4dkxo?=
 =?utf-8?B?SHJOVS9kL2FaWENwdTFranh3bGtPd1JDa2k5VXJvWmNtOWthZVF3Q1ZsRU94?=
 =?utf-8?B?QUlUbXQvNDliQkxjdmtiZHVhWDRuVUJRaG0wYm5vSzVEcEMxcDFkVllTaXcw?=
 =?utf-8?B?Y0JTVHdFaUN3QWxqZFpQR0ZUU1V2Z25KR0VxNXQ0QzdpRWt5eGtYTjZFVUxQ?=
 =?utf-8?B?ei9SZExtZStzcEZZdCtrR0JDTzBJNlBCUkFpanVNQ0xjUmRlRTVhL2hxaGlx?=
 =?utf-8?B?NUdBWjVQYmtxcWVJaTU4OHRUcnI3ajJqdmFma1FoRDJVQXJnaE54cS9aWExH?=
 =?utf-8?B?eDZJVW8vQzVRNXFJaHRGQ2hQR2xyNTN2ZTdqb25ESVZSRDJnVllwc0t0Wk9w?=
 =?utf-8?B?SVpUd2cxTlE1TU5tU2lMZENRU3Bzb2QvSll5bnhaN0E1bUNmYmZwN3R4dUJx?=
 =?utf-8?B?T09Kb01OMC9UaFEwUHlFWmh5aC93cVFPUWJReVVlMHIvQVRQbTlUamtlL1FO?=
 =?utf-8?B?d2lXWXNiaTdmUHVKbXJPRWFXOFFVQmxkekZPbDVFQ2pLRTczZWpDUXFkVGc5?=
 =?utf-8?B?NXZ2K1ZKSEswOHl3b3FVbHUxSVdWcTRkZEJwV1dGazkvVlZoejI0WnZpUFIw?=
 =?utf-8?B?ZEZQZ0t6czJERnhCc3BkTytEUWd5bk5PN1hTY1ZjSTBrMVZJQmhMSlF2d1BG?=
 =?utf-8?B?WnhzUCtlNXBNTy92SlBuV2kwT1p2Ni9nUWxObE5tR3NiQ3VETHdxMnU1ZXJO?=
 =?utf-8?B?QzdTWFErcjMycVpmY1BrQTVsM1hWVCt6RUdhc0tNT1JQalRDNnM2TnNpV3oz?=
 =?utf-8?B?TWFYTGd2T2g2NU9INTRIdDZlOCtWSitZZWRyQmxlTUZLaUlEU2FvTFMrd0s1?=
 =?utf-8?B?TkRrYW1velgrZ1VVV1VOeVpwM0RFMW43ZHN2RkxuKzc0RjRMYTBOcDZJbHBt?=
 =?utf-8?B?T2l0MTdNeEhrQ1cyZGdUVmpsSVJIV0dWNDRuLytPeXArZUFpUHo5SHBxMHJC?=
 =?utf-8?B?dFAwa3hHZzRGTUpib1kzdy83NGl6T29Pc2tXMWZNaXlWMEJONERnUThmaFNZ?=
 =?utf-8?B?aG1RbFVNa1pSYWxXSlZ6eFdWMjlvTTBjQ3B0U2kyd3FKeUtkcEwzS25IbnRG?=
 =?utf-8?B?WG9OaWZ5OVJDU3RhS0VpakdadGhRazJqblU3bUU3SXhBbVY0bVNoWHVreU5F?=
 =?utf-8?B?U1U1V1hmNzlSNFErY2ZIMDFzUStnN3NOVXhYOWxlRUViRVcvaEd1SlExWVpr?=
 =?utf-8?Q?YQc3DB/pXQwxOp/2QzDGOdGkXJvkzKKv2vy4lUX/0khzC?=
X-MS-Exchange-AntiSpam-MessageData-1: gYbAKjn63EcjIg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 689c7b0e-3830-47d0-aeae-08de752cb775
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:46:45.2806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3BTa4qSKEpUolk5/ObjxwegslvCIjGd3l9eqrYGV/SR6k7zTGUNtbC4fBtNLrH3HaDswzQvQtlteIajFpjY16w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7112
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
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 7A0BD1A5468
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

