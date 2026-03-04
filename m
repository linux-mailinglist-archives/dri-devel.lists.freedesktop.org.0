Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cP1JJTuOp2nliAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 02:43:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4671F9996
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 02:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF4110E92E;
	Wed,  4 Mar 2026 01:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FYNJxzXI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010012.outbound.protection.outlook.com [52.101.46.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D756D10E926;
 Wed,  4 Mar 2026 01:43:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPLY6f7aDx4447KscsWMwzYfDMusdUp4SxqMLHYfq5HuWFfbSE+VvVymUQ6ukcWEzSjVZZ1IMaSO5D223srNasRVTD2ZcedHzfDdJvHmYno/EoyXSrSRnfouGurHCzs4HLywMDiBcK2f6h9PDeOHx9uKL+CFIyRNKZbt2Ovber3WPvumIJZDvWDUWwdMV6nyXuKU+FCTZHuQk24BqQx2Xwla+c0CB8wB02FgaUB5FsikkhAJ7+nZc/h9XKtA9dtic7Sfzt8VDsVFGmlngLimqt1zALqoh9nIwJSFQxGRjK6gh5WY+38SCnoqr6ePibPDhEmJ66U2774k0dcQDyLjPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DedK0I1ZCfVF8ktQPAR1XHEkfPGPkuR/RtE4Thh/05o=;
 b=sxJaw9NfyYHn1+KmYF0jwnBrrzxY8F6ZdBr412ujSPqKLUM2papi1Q4Hk8EsrzQaPHJdPHXjWJdk69jBy/msUKpwJD0LVH/gBmVRTH3Mr33+mOCaoJ/jPj8EyQPGqxHeiX6Q72X9nTXGXucpDGK8uQMWdhNeYODTqc0SUgbUesQKZ7s/wo1BRQqC1u0FArHJ8RhK01Iro16JAQU84ASs0Zlg080LIiQh9l1EXyfDMFabO3AWdbWg6zhKX75PFSkqvapwxqhniY1pERWHQQ45xionQfekGn+PLRhhDRytvbxTvtt/KZTXkVIFV3T2mOfyN0EJoHNShUcll9f0yYXVEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DedK0I1ZCfVF8ktQPAR1XHEkfPGPkuR/RtE4Thh/05o=;
 b=FYNJxzXICV9v6qIt46bg8TYT25Ote2Bz9nDpJH4RTOCmbx2obwVuvhgWgnjqBjpqfrf9/9EPR2OBYMZMkOOTCAuHuFBEfat6R1JnP7Y7nVKHWJyp/xhjlaTav00eJEyJkNJLulbEVD39snt88mpPD2AfTx3x7858mXCnhaS4IrjgS0e0alC217vw9soIXwSCOit1Pi1xvMXhLili3O9ebC3SIkIfoykYpk+I744h9RwRiTb5LUM8Zbtke4SIi+WpkfR43wicUiOSJ/imGR1687jPy8EbM/OY6lLu/i47FVh59SPYqX/ThlIjJOagnELYO/WS5WFuO1wMKLKJomXS2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BL3PR12MB6545.namprd12.prod.outlook.com (2603:10b6:208:38c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Wed, 4 Mar
 2026 01:43:17 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:43:17 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 04 Mar 2026 10:42:19 +0900
Subject: [PATCH v5 3/9] rust: add EMSGSIZE error code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-cmdq-continuation-v5-3-3f19d759ed93@nvidia.com>
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
X-ClientProxiedBy: TYCP301CA0068.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::19) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BL3PR12MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e0fdcbe-60b9-4fd0-0d65-08de798f6841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: DZ2otenqxLQTe5hrS5baLB3P610fba7dosPm2BCkc/KQ2Ts/8gmMGy17+K9yQAxoQTBJ3hOlxNi40oYC4Sj4/dFaqvN6hEylp+yj4ZOXh3r6ykgASncWPB/1Aj9askAGa65mD3e6BVmGU5LFlRD24w3ZKFln27Yh/AWoKeKUd6JGEfplpEWuCAJtwE8QzgmkdGfMNfqmJPxdXHLgx13cLtGP0xvadqQGs9oqxStB041EMKRy7lnqKiyd7wEnSl2cofcRg5NJbIWGKff+0EyUGzWupvoD1JSvbevCN8F347SSCq5dWzDpCCmn2mn37C1ZOjRxodSkamSgpHJzj1d+1lkfjwvSgkny0bEcbSm1sDcO2GNI94CTTSMFneutu9w9DAipnci3112JoYV6ReHEVjbbdonGW3fdIDsEOAFhPvsy9wV9Nf2/QSODNJLq8LnK4WpEDQaxT7K+5pbf8eDY6V1/3RqmLP0morvPNBWHRUDWEtCbLHFBmkze4wsLR/7Fw8Hs4cd7RXC0usH5JcPzLEAsCwokx3XDSZy0/Lgds2wPD4iqXUDBBGL0p2fQIco9g5akCTZaoYftBULGHjCIksdu9f7xLpLqj58co5Fqc312vFAiuFmRPEQnv645WDtHgKtSry+T6OTa+blW8IaDmnRzSxUubeT1FwId4mDLxvmZCVS15v1aVhxjcmumiS5IMNETh39iTuOLxaHZqeIaqFbZ5qtLAuEraGhPwL4uONGuZ7kncQnrFmMnoiBwrQwCX92edswW6uSmtbrkiuEVhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlEvRUJhd1lyeDM3VStqd0dqRHlvekR2NVFTUStmdHlQdThxT0NXWGlTb3Nn?=
 =?utf-8?B?YTFrNlVzL2U4SG5OQ29xSHNIU3REZmY1RlhPRWxmVC85YzcrNHpuL1p4Ukpj?=
 =?utf-8?B?NXNXcnBNZG0zVWlSbjF1N0dPeVc2TFlBNkVMZ1ZXWnRVT0t2TkpYbUwyT2FN?=
 =?utf-8?B?dkgxY3l2eHJoYlJ5UzFuRUhhT3NRUmQyaDQzRE0yMVU0TEZoaXE0a08xdk5S?=
 =?utf-8?B?ZEpwaUNERmpNYjVtL1FjRG5CL2M4cXI1Rld1NitHcFVPSkV0Wmd3cndhd3BF?=
 =?utf-8?B?Tnl6R2ozS1VjbWVGRnlYZmgyK2xQOC9oSkV6V1NGVXhZd2FuNDhZTVNRZlho?=
 =?utf-8?B?b05sRklrZVUxZHNKWTlKNlZBVlNEdmYxa2VSeVpmcDk1OE9WM2ZMZnVhYkNm?=
 =?utf-8?B?SkJ4TmRSV09EdHA0SFNSUHdsLzVJdHRFVzhVcmlOV1ZObzJwWjFyVWgrWW41?=
 =?utf-8?B?cUhpWlhWSFRNWVUyRDRWaXpGSlUwOFRTditxTVA3ZWE0MFRhV1JVRzRuam1N?=
 =?utf-8?B?TFN0VlFIQXQxcFRZeXl4dVVxc2JNWTcvTGg1UHhxRWdVQ3Z2bzNMRzUwaUVp?=
 =?utf-8?B?d2Z0WVJsUGp3aG5xbkdEZGRDQThIOXRnTkxRWTZyMEVya2pBVW4yVUdUMTIz?=
 =?utf-8?B?blJBa3Jyb2sydkFBYnJkVWpML1huS3hLc09rQ2Y4T2ZQcWRxbFVHNHpmWWVR?=
 =?utf-8?B?M20xeDl2clJ0ejRxWHl6RHFSSTM1Vlpkbi9MM1JmV2pLV0s4bmVLcFpTMlRx?=
 =?utf-8?B?UkRNQms0cHJSTUJUZ1RNclZIUGx4cVVycWs2akVOU0Q3aURRVUlMS3ZtTHE0?=
 =?utf-8?B?dVkxZ0JTTkRwWk41c0JyVDZMYnNFVzQyb0xwNTR4bllsczJiQXBUNDVyL0M3?=
 =?utf-8?B?RlVNa2NWeE15M3JKQXZCdzMzSXM2UjM1aHE2dTMxS3Zkb3ZhdEEreWZ6NFlk?=
 =?utf-8?B?OS9Memp3MVRiSGlvb0h0YnYzTUhwMUpUVndWc0lleUJqZS9hZmFxeDZQZitl?=
 =?utf-8?B?YndPS2Y3VEYzYVFMQnRlUUJUV29pRVpDajBIdENBVlFZazBYN0JSTm05WHpv?=
 =?utf-8?B?V1JCQkhJeHJrQncrZ1J5OFJYeGIzYUtpbUVraU1lQTVQS3JZSUJXanNBSEtK?=
 =?utf-8?B?MmI4ci9JK0wvbW96REQ5RlFiU3hVV2pSZ1RYTlJlRit3enljanhNQ2xqV05L?=
 =?utf-8?B?N0UvSldPZFFwVW1RRisxYkNzRTJQQ1g4T0xHN29DVWpUMzA5R3ZCTWMxbS80?=
 =?utf-8?B?SXd4K1dySytmM0dqbkF1ODFyK0huT1RXc0NWWVJLNVpTNEdNN20zS0YxZWV3?=
 =?utf-8?B?RjIzQVU4cyt3WVRFdFpHSlZ5YmdUalQrL1hhTWNqclF2UjJUZjAwWDhiN0lH?=
 =?utf-8?B?Mmd6aXliV3ozanZzTnIxeVFJM1pMdnFETVRBSURWd1Y5Z3RZSnZsSkU5a05x?=
 =?utf-8?B?Nkl6dWlMRjlIQmN6a0ZOZkEwOGxrRTRQd0dpbnpNT2VXSVduK2g0TVZXRVdG?=
 =?utf-8?B?NVh1Y3N6a2xiTTVUNCtqNWlZMnpOdFJrVEhtSlpsTGxMNUZjSUhkUEtjT2xj?=
 =?utf-8?B?b3RSMTFVSm83eWxpRFUzNzNTOHEzM21UaUl0ZnlBMHJOcXpRK1Y1L0UwcEhx?=
 =?utf-8?B?ekI4Vk51bHdhTXdPZXZFaEx2T3R3dVFHc0hzbGZZRWFUZXkwVTMzSjlxSm1H?=
 =?utf-8?B?L0lsZnpMOVZKZ25kdmszR2gyd1FoYVdlaHBLOVV0WmlTWlpVTkU1dTBpbGRp?=
 =?utf-8?B?cXRSM0JyUGt5WXpsSmtsWE5VQURybmk3VTIyZjd5enBwekorZGdDbm55eUJt?=
 =?utf-8?B?bFFVVUQ2aStUZnFzTFpzOExFYktGZE11bEV3UUFXc3Bab3VxS3U4aXN1L1Z4?=
 =?utf-8?B?UVdyQXQyZFNVSnFCdG1JYnBrYkZGSDIzTU1SRXZGYVJaYVhzN1lhRDJUMGQr?=
 =?utf-8?B?aCtDRGZraEVkdUJ1ajc1MVRTZ28yb0tFMFRFL1NJanVialZ1UDBVRGtZSVJs?=
 =?utf-8?B?NDBJdnlNUjhCNFRSUXRaa1hCY0QrKzJDVVNOVksrNFRsNGlDbWxYMFlyalRS?=
 =?utf-8?B?YW1CRmxoQ09QTTg2UDFBN2t5dmFZOWNNTzlWM0JrdDlCRzUvTVE0RGpuMG1w?=
 =?utf-8?B?aVd6T3Urd3kwT0FHWU9KaXlzWUVGVnFoSWRzZmU1WTZmMDRWOFpWaFV6cy9Z?=
 =?utf-8?B?aXU1OWtHZHRRWEhnSTZpdXExcGMzYXRUVFMrYnphTnVnWDkvWjlFY2Q1S0lI?=
 =?utf-8?B?VVA3ZklMYXdwVGl0S05KTHBWemVoTDhtUUN2alEyUHNQMUxXbDY3T1BIK0Ns?=
 =?utf-8?B?K0xxM2FpYTdVWXNGUzRBOG9LZVQyU3h4RkR4ZE1SU3JOL2V3dUhxUEVOTDBn?=
 =?utf-8?Q?ZNcdAVZP/AvO+YgZVGS3FSay9goDQ/8Mcbv+EZXZzzoLX?=
X-MS-Exchange-AntiSpam-MessageData-1: mdRfcxRasXIHUw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0fdcbe-60b9-4fd0-0d65-08de798f6841
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 01:43:17.0711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7PzAIKMu+NoXvenalaRSQ9QbIgd3+C95Gm+k415AlnYdPPL/vUfbvpq3BQ4f1IC8/onotd2ZwyyjNJCN5gE3qQ==
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
X-Rspamd-Queue-Id: 0F4671F9996
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

Add the EMSGSIZE error code, which indicates that a message is too
long.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 258b12afdcba..10fcf1f0404d 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -67,6 +67,7 @@ macro_rules! declare_err {
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
     declare_err!(EOVERFLOW, "Value too large for defined data type.");
+    declare_err!(EMSGSIZE, "Message too long.");
     declare_err!(ETIMEDOUT, "Connection timed out.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");

-- 
2.53.0

