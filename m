Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEE/J953pWkNBgYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:43:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CDD1D7BA5
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE0D10E4A6;
	Mon,  2 Mar 2026 11:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BuY/KV8+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010070.outbound.protection.outlook.com
 [52.101.193.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B552610E4A6;
 Mon,  2 Mar 2026 11:43:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrEWHAz7zGWXkQO7WH8XApamtn8Wibkp7GElJBT0OnTxbK93eYLrO3bq5pYJ5Q7Zzj2w93VXzNFw43A9bGsLVbIOIR9laSDZKXjnAmTh8c3s9olH6wmFdfiDwMMSI2K0HfA+QBiuGp+U4G/PYydQXdmpN1RFiELmDFBdXFhvmdmEWf2i8pOdBXVQ8KmeSEkzldTxA07MeLHMhVRtbVIgk1zvNKAB5apgqEvNUxSf7h2RBzNn0u2/bQU3/PtevxNjk/pWlVcaER8itC0LwyGCCo/zzX5eKRpfbywLkO/7Xh8GQWHj4/T+nFKpbaNlN1ciEw3LzACoMjLurj+6SOqmfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tV92YUeCIkrvWgY8AcSc8xLDDoAC0FXjSxjzX71Ujz8=;
 b=UDPshQFXn0SsJooqkYzxsNYzXjRtRfYxQEk9CxDXQ5jJ2o1BH1iklP4PhgTUK07E2PpnbVR1rvq0v22y2hwu9ApGXV63OZHo7F0w7thurImFRjEwsFqT7KUT1L1li71MhuKncnZlpg/VZHuWEt3HF70l+nZRi0BD4H9BQg7XCFF2EsqUq08U9m+1wqPD2XBgGeHQIAaFpxkmQMtgwNQ3GPXS6rdDHht7Fv2+mJDpRlj+5e2TguPG2C7zWW3CR8J7ktWukcE6OzLe/+Oyon5JLMZjPFa6FbH/4S8OT35cZV2hZFpx/fW1zbbqQEYQuYH3zt90pFIdHNqUJO90HxbClA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tV92YUeCIkrvWgY8AcSc8xLDDoAC0FXjSxjzX71Ujz8=;
 b=BuY/KV8+hPFrhudYlMeIJpI5lwjzMTlmR8MT01rMaeJcSn17f+33cQVy80JXC8wambAb+JR8wS7ljyzMhJmMIEX+bQ3NK7S1JexogqDKYClStZObIHEb1UzeadWQQaCiCAoLSDyUQgJvODrajEC/wVYXP58W1TzoLpJsmEqJbkwjYZ6gp/hSWmNkoG6f/Bru8Ejbe5FJ5FntR/wgqKFOS4zlt5dQ7bhKPKbfgajucfZNbvRA5Ti7/6u7qXI+oPbxGz/jdohnPbCi8+lQXqjk+W0i4s7X9efihbRR6ZDps0up+3XhlaX9476JEowLAG7qEIbO4nPJ/IFuAF/NmATC2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 11:43:19 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 11:43:19 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Mon, 02 Mar 2026 20:42:33 +0900
Subject: [PATCH v4 9/9] gpu: nova-core: gsp: add tests for continuation records
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-cmdq-continuation-v4-9-c011f15aad58@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0103.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::13) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: deeda591-887c-4e18-1015-08de7850e675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: QMjL7in/1mbj3LCHLWu7cW2eUaeY8PSybjWVjKpBSRpQUu38XcMOgmK2WV9lyOvEM+DYbfo4P2BWZ6OHivDPpAoLqvyqKS2XQa+S5M+4gGUOphpUbnkqIdaPnpZn0FYPbEKT/URkZU6547eVy+Tno+oL8hmwKI1LHs106rDiQQJA7ZIUe+h56OCSYZJw/FO3Xf4B/311MiMRVbfZ6/ZSewm8N3F7Pr8b55XxldGNx02tNXK0iiLf1DFMi7hkqw67L/Bdvk25xKd3hikRCHo+nVvTs6GiqiyFMWesbyzpkA38f2vPw4PHfZGwVK5C1uNrbi76zSJKRK/Tt7yLtHjrCckYtoGyrQA9pb3L7lx5uvKxhPdGCWqmJnwJC8/SEa5a1ExV5tzqrG1yUweWEpmpmmyZzGkE7jPjHzBFGotA+J5RzTLVX1cW1PMWz/rH8RKIiBRxb6csAD1JYO6R5hqoGXrZ2d1KO/ayEGVOPKAXgbbiiNFS8/TpsVU20ch29DqVIsr8kfqymkAMVmDa9qfCh3F3y8WcLVAVy3nBJvxhHJJ4IlUrC/sR+es25xq1fLG14FjmxbKUWQvhdk9j/ZKysG2ukF7G7orORRojx/lMPTXv8w//9+WHi/y/mi4kwWz2emQ3msMTrT5VdySgMUOfg9vxLVneDCpllrjWySRuLIWPanXAW6rNdI2NcpXhrf73MhUfqEaR1BCD2cfnqdQLqFYh8Xbw4HOEZ/1rWjmoMff2PH979t0zdZ2zlRSjEqpTZp/FIN8uRKapU4X+Oy2zAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzA4SXAwRHFwTFJvOWIvODg1V1RucC91MVJUUFcxeDRLVTFmWjJ5VUdvcFVs?=
 =?utf-8?B?aUJ3eUVRaGJvYitXOXdST3dwSEIzSitEU2pEN1UxVExHaDRsMG5sWDZrck5i?=
 =?utf-8?B?cDhGS0lPeGhFRVRoWVRDU2NmczRJWjFTbE82YllYZlp6ditmYlNYTDRCekRN?=
 =?utf-8?B?UjZ1RkZTRlBtSGZsa2VqOWx4amlscFY4K0I4bzY2SEJxU2tGZEJITGlYOFNx?=
 =?utf-8?B?ZE1lejVZNXVhRWtwY01hOEJqSHVMYU53T1lNbStZN0VDOW9YTm5LbmFOc2NN?=
 =?utf-8?B?eGhlZjV1dzdZWnJpdnhlZ3RNRFdGNUphbFdqQ0d4RFkwSXpyWDRRaHpONWxN?=
 =?utf-8?B?MzNzd1MxRXNWajMrUm9vMjFZdXg0bDVmTkpWcGMwSWpMSWwrS0NYeXMxK0NP?=
 =?utf-8?B?YVpKUW1Fa2FCeWZ1ZElGdVYzZnVjZ2RKTGtiTW5ycDcweHorYmRQOTNtZWo2?=
 =?utf-8?B?SVZUZFg2K3RITng5WGJlZm9VdXJLbTR2WUhKUSsrQUk5NjlQVDF2cTVrK1lo?=
 =?utf-8?B?WHlTdFVjMHhQTGplSkNyR095ak9XR2hOd3pKaDJ3bW1kMGMyV2lyVVIvcXFD?=
 =?utf-8?B?Tm4rTjJ1VGtKTmtXUkZ5MGtnQUFKUkRQNURMbDlyUERjV25sZUU3dE1LbERU?=
 =?utf-8?B?ei8xME41NS8xaG5CL2ZnV0RnTDNhTjNIUHI3VXVhQWtlMlRUV3dENmhYWlFH?=
 =?utf-8?B?dFVOWlFiM3lMOUJIRUJFajNOaHRwNW1RQ01McldGdFNaTVJ5dUxKQ0FCMUtj?=
 =?utf-8?B?WVBSRmtsZmRlZjJjSHBVYWdBWmt0NmJoUmFDMklGbVRpRDRFYnVqdzhwQjVW?=
 =?utf-8?B?c2YyUkEvS2lkOWJyY2ZVUmR2cmVwNFVOK1RMVU9aamo4MlJvT1VHOTkyaTR4?=
 =?utf-8?B?d1BqYjNrSXZzS203K0dOM21XenRNUkxWUnlDZ09MSVA4eUhpNy80RWVocVJk?=
 =?utf-8?B?dUJkdmJxWDkyVW5qdkl3UFRlb2RVeUtVZ25QQ29oUWpRRkI0R3ZLQVJXeE5m?=
 =?utf-8?B?MDgwSEVibDduUmpiaHhhcHgrMzlSTDZlYThsdk9UUklBREM3RThsZHVCZHZq?=
 =?utf-8?B?cWs1QVdYVk1uTGpkV2xmY1hRUjlKOGk1amIyYzdZOXN6cE94QjVlNmNPSnZI?=
 =?utf-8?B?T1FLa3JJSGFQeno0QVhqOEhlOXZYRlc4SzQrMGJORTNoTUNwWWtZRVJQTnNx?=
 =?utf-8?B?U1EyZlI0R29NcDh0UnJLd0lYQWR3d3JXSW5nanJCTU1wN0Qwb0pDZWhiNW5h?=
 =?utf-8?B?S2EwOVVZSmw1bUdiN3JxWERjNTFLc3dyU3Z0RUZlSXg5blZpNEt3VlZmSlBs?=
 =?utf-8?B?RTBZUnFLSTA5b2swaWE2dWVDdTJwRGtKQXZIWllIWHJqcDYvM1NSQ1p2Umty?=
 =?utf-8?B?QTkzTTNwOW5hVTdnNnRnSVl2Vmg3enlKOEphNXJDSFJtaG53L0hWU2hyeVlG?=
 =?utf-8?B?T0dSZ1A5ZTNZSlM0RWJ2aUoraW00L0JsTnVJSldtNnd2Qmg1V3cvN1VrSFZp?=
 =?utf-8?B?b294M25XUis2L1Fva2E0Vmt5UXExeWJ1akp0VXNKbW5jSElaTHdKYUdnb09j?=
 =?utf-8?B?TkEwN3NDVEx3Tm5CTVFIUGpoL0hYZXFuTVhIY1BTd3BTRzdFWkJCWktiZWti?=
 =?utf-8?B?eTlwWU80bmtFVDNMSjVPbWVLdmRlN1A3TWdRWGU2YkpyVzRsTTZWbUxxMWRy?=
 =?utf-8?B?SXdrcExWUktZQ1FuZHNMeGI3R3ZxQVBrN2orM1pSaThrZEg5R21BeVNDVUp1?=
 =?utf-8?B?d0FtU0FlZklkNWVIa2M5aGUyNUZpZ3B1ZURYMTlmS0UyZTY2b1R0TW5nZDB6?=
 =?utf-8?B?eTl3SmdpTTNuNU9tWDQ5Ri9OTU5yYWxIdGd1cnRLbGdvYm5YcXNjZjE3bUtZ?=
 =?utf-8?B?Z2tuKzNnVlJ3SmZseDR4RXJyQ2NQNm8wOVFpODBpWUE3SkJ4cDh3NS9PTElY?=
 =?utf-8?B?U2tqV1NpMXc0b012TmxqQ3p6KzJvNXRnTXRETm5MZ1EvT29vanQ3VStGS0RD?=
 =?utf-8?B?Y0VtUzR4dkxkcTBOaVhSSlNld0NQZW8rM1BrTFVqMlN4QW04ZWR3cFVHQXJO?=
 =?utf-8?B?YVVneDhsUUtyVzFnamxJRUMxbXdrcDFjQ1JHanlEQ2FFRzFqTWlKamZSV2ts?=
 =?utf-8?B?Y3VqWTdCd1NJTjh3T3hheGNwS1ptK2pUS01weDBFMXg1L2ZnSm1zQlpsMW5Q?=
 =?utf-8?B?ZzlXZ1MxMWlPYVl6MFQ1KzBURTBOaDM3TUxXdDVyYzQwVlJPb2dYTzJQRFJG?=
 =?utf-8?B?N0ZNQW4xRDJSdDVtT3lGVnZodTA3dEtPcG53aDAvNGlqV3Nwam9qVU9YQ3hs?=
 =?utf-8?B?WTFrYk5DUGhvWW91blB6Z1dXTUVicW1jWHJxSzdjN2xSQjdnTVJtbGYwbzd6?=
 =?utf-8?Q?teddgNhUkZt9XhN2dsOfAQww429feUycZDuqD0kJB24Ii?=
X-MS-Exchange-AntiSpam-MessageData-1: 1V5OXSQfeZKdYA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deeda591-887c-4e18-1015-08de7850e675
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 11:43:19.4833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+/m1KyzSzWMTLGr2Bcoq29I+xBM4njkUb8yiLe1QoHTVm9FQHVtnURm/oUZmXOUJrlbWAp/ipdi3AimFDyf1w==
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 47CDD1D7BA5
X-Rspamd-Action: no action

Add tests for continuation record splitting. They cover boundary
conditions at the split points to make sure the right number of
continuation records are made. They also check that the data
concatenated is correct.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/continuation.rs | 138 ++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/continuation.rs b/drivers/gpu/nova-core/gsp/continuation.rs
index cf6d950a0e3f..6d02334f8266 100644
--- a/drivers/gpu/nova-core/gsp/continuation.rs
+++ b/drivers/gpu/nova-core/gsp/continuation.rs
@@ -165,3 +165,141 @@ fn init_variable_payload(
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

