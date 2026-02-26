Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFhzMrsyoGmLgAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:47:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B55E1A54A6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A8810E90A;
	Thu, 26 Feb 2026 11:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rGz21nvy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012039.outbound.protection.outlook.com [52.101.53.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B52D10E8EE;
 Thu, 26 Feb 2026 11:47:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVu+ce1MLTVZ3zX3GLQQ/oWtRzW1mGXNRm73vO7xzG2qJpGQS7VvzBoFOp6/YWYOx6ovVWaER3DryAlPELAWs8CEMEHsEZQIZc8bIz2/W4s1R9Ds54frgnquWhOK/KguNq2qkM3VN5wM3nd3duBSNGRKW7nFM0Wpx4TTXXrs4OHFQrM5VhnUrfGQDL0hcjRVU4GdTo0SzxoN3zUYD7sRVAesBeLWcfrSf/BWGr4WnkXmmY9+TdEYKEOravjV1IZZ2RmoH3UkFcTjOs0b0wMmZUBj6BRLAewKlw3Yp2O9RCZn8vJUMjxWafN7QxgJepFYWKRcEpCT7M9fdae4H6EWOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VJnWXJm+yI8tbDkM2y/urrRT6WlSvBHufQjqJ8uwzA=;
 b=YxWC/oWySZ+RRP0Y+vke8SG71P8igJdmCDEQCVv62Jta/FVhgzI8ieDD2qh2n3ogFDdOzNkEx2xax94CS4I42+8xmn0DKyEUz+H92XG01ikSIHzveJbD3rw58/Ac4y7wCrXabAy5pAMsQ1kuRAdHMN59eRzZKfrDzJDnJWROVB+qb9Aprtceln5ctUoDzjDolOw+Py3C+dmWOQ54ADM01h1YG+8E4YfHIvVe4L4E3doLtf4Sze84zWUS4sBF4AVGuvnSNhPCd4BfpjU2MHvEkHKdN8zxRljVAkgK9vSMZXgOYiYLeswqwHcUgp+CnVedGKZ6Er/hDbKtgYym1r9Scw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VJnWXJm+yI8tbDkM2y/urrRT6WlSvBHufQjqJ8uwzA=;
 b=rGz21nvyId453vnOck0rBSd8YDD/Yxm8F1AbfX2zoa/2yxreAY6kReLH2k/9yKDXoML0sQOfXZmTh7OsvEg3JJXzANUt3X5PrG5P8inihTMsn8vYZRMLdyRtZf0LtMGZKgtpUcVV4G2hXiKAYs6IRHDl2aFPMr8ChEu7kA9c2FgnoQomMlBm7w/QEz6LChJB8hTdSLEwXGefaB2aLjeOw7Xsw51OYLxH8ERDQnfmq3TmzSGsGWhEQxn8xZHWYOeauKG24lTLJBpBaRaAbY5Bv6H38OZdcsgzv5rYSm5rtikyPtPeBwwIkCJrrbSfRLDhT+sbFfaxA/VKpxwjfDwOwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Thu, 26 Feb
 2026 11:46:56 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 11:46:56 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 26 Feb 2026 20:45:36 +0900
Subject: [PATCH v3 4/9] gpu: nova-core: gsp: add checking oversized
 commands
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-cmdq-continuation-v3-4-572ab9916766@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0058.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::16) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: c4b8eaaa-cf10-4ecf-1f5d-08de752cbe70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: LSsFJL9TkQize6gP1KaZiqhbUG+p3z+T5G8Hb3y3Jytu3QackpjKzr5U41L6XLpRaybyQsIcUs85AOUEt4SS1TwEYXh1ZXJypSf9gTc06uZ9tn1Y99Juj4X9Bp0KkCoWDiUdp4qMS4ilJ0nh1dMeukvK6QszT9gU/HSUn3jd8WaxgeTys+AUS/yWmH8sJnppF8Y0OztEL8+4Dht/ej9ktXk8PyV8CdZMmmRspjRAjbWYW2M8+vZlYUA2RqUZSFDE7N4fXH/BspGxxvgYe+zIEQdeRL9GkZHNGK3C+WXjrA7dfcfEuuowG4XB1pQWegjDiy5TwwRK6BXA9ovTHLvILmLlkhAfTP/CAk4FiTPx4NSTC0Nd9IH8EhUjnu0tJlvH3ojBt8L6sFnnYOCUaui9wotaFAjNphjL320I0ZPWVuthXtzULizawiwJLwYs+62ph4oQPNQ3oDl8cCIWhPQC/UrLByFzVCf2NQ3oTd0UpoJnxC0snFeaVOcHj4EkeMyEU1lThSnlKMQoiy8tbTaylCP2JGwxcMjy1MQeRgeMddqF7Yp5K2uprj4bl1iY/UkaenagyWYusIkg4D6Ed3Gy6tuPwCghGxtlEkEjct/DDzJtFx4KlQlOjVn8l2eG21ixM9iZ4k0oDo8M9BD4l1tCCECa/0AYuXEXhkpitutmEYIfNvNL3Icz7vZsYotXM5T0GSaWtBh4czAKJ1atwgshYY5lxUxSceW9bHqjMwqEfL4bPisCgS4aYwkvFruvLbQbVpBV/3MQ/l8TR5ky1pAotQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE5LTEpHdHhRQ01sR3pkR1ZBVHZNeG5jbTRTY1E5UWI0M1B5RkRLcE1RbWxY?=
 =?utf-8?B?S2ZpSW1qMXZJZGJRTGpvV0JZMzNnVk1lRlJpVGpEWkE5OXExb1JjeXZjMndI?=
 =?utf-8?B?Tzk1ZDh6Z3lUYjAyV3lESzQ1cUJJalJNWkMxM2FCQ1FyQjRqbjQ0bzhrbFBZ?=
 =?utf-8?B?dEpweThwVlZpak84RlhndDhHbmZlQ1o5MmJ0YTQvd29FMnNUSzFob3ZHSFdW?=
 =?utf-8?B?bGlVQVRuVlJiSG1TNXpkaXBzM3lqZ0JiUXpreVRNcERvM3UwTnFQaTFyU29C?=
 =?utf-8?B?WGtYclp1akRtZDE3NTh6QURUZHpwTVVHY0xVQkhOTFAvcU1aSlV3bnVSMC9J?=
 =?utf-8?B?ZHQ3cmRFcFRKN3pZb0E4c1J5V3hnbWRaZGhyOVFBaTBKaFFOYmpDRTIvdmZr?=
 =?utf-8?B?eVYvbHFNVEFja3g0ZUlFalROMk9HeCt3djJ1a3V3aFFmeTUzTFJwUnk2bHFj?=
 =?utf-8?B?S1VpYVo1bWNNb1BzRTlwNWcrMmdkVGZGc01yOU9qNStnMWpGS2JsT002Q2cy?=
 =?utf-8?B?UjB2UWZaeFhoK083K1pySFNvU0lLcFc5WTl2V0xYYTBmSjA2bkdYU1pDVlA4?=
 =?utf-8?B?QU8xeGJCNnpBNVh1cFdxOVhxZmk3NDVwUDhCQXVKejgxRjJ1M0tWaHhMOU9l?=
 =?utf-8?B?cnNYalZtK2Z0RmlEYUI0R29Rc0Y4d2V4UzRpTEVReU5vM2Y0M3pRcUpOMnJz?=
 =?utf-8?B?U2JaV2J3bW5rV2lQNzZ1MS9qaUMwVXpnem1JeTZINDZzRGV1TE01aHZpa2Zr?=
 =?utf-8?B?Nkp6UEZoMFF6NWczMnpLTXA4RFdueXBrcFdaU1l1a2JFWERBTkNTdEx2dlp5?=
 =?utf-8?B?WjNndkc0dTMwa1AreWpxMmxoVnFwS0EzYWxNUUp6VURzOXJrZWZnTmM4eW9F?=
 =?utf-8?B?a3hPL3FRVElManFvOThCaFdDRGVNWW9FelhXSklaNFQ4YWJxdWg0MDFYTEFm?=
 =?utf-8?B?T2tuOVByMSttbEJMMDFxdGJGWUJPRVpObzZRNnFnU0xMaTN2cmJCczgrcXVa?=
 =?utf-8?B?aFc3ZzY2MUJGclhvYWg0U3djVUY3SUIxK01jcUNZeFhlSWtqT20yTG9GUjRy?=
 =?utf-8?B?T1F2bGQ0MlorZFhXRzVwYWZ3S0NZTzZNeGZwYzZidWNYU0NyWURJTGk3RzBv?=
 =?utf-8?B?bjIybDFhQmFKVDNiSjVoZDRWS2M1UE1ER25ES1Zkck93SUVEdG1ua3A1Mzkv?=
 =?utf-8?B?am90ZVltbmZsTGpOTng1R0NqdG1naWdwYmlsNTRHMVNKSXI1aE00ckQ3d3gr?=
 =?utf-8?B?aXE5UHp1ZWNmMWRweGlKWGRCWnNPYkpYVjVtUHNWczR4YmhpeVY3Z1VGekI1?=
 =?utf-8?B?dStNVjZ6UTBjbTl6Zk1YYWxuTENKWWp4RWEycjl3aG5hUHZMbjU4c1IreUZn?=
 =?utf-8?B?U3lmcmJNU1NrWSt4bnArV0RLaVhQdk1scWJnV2UyMXgzckpCNFdncUdUdVhS?=
 =?utf-8?B?a0NFQS8xck1IVHdLME9pdDJCSWtKWFcyWUtDT2l0eWtudGNKdXVtMnZGcXV1?=
 =?utf-8?B?RVg4WWRiTU0vdEhDS3NZYlZ3MVhMMy80UnRpZ1F3N0IrOE1CNkRDTmtPQkl0?=
 =?utf-8?B?WlN0OHQ1bFNPQjViTkpuaGpQY0ZVVDhydit4MEljRmEveU5ubHlPZGZXZGFZ?=
 =?utf-8?B?TmRHVS9KL0ltWXdTOFVvVXB3Nk5mSEpOcERFdXRqK2lDSUdoSnpLejhuNGtz?=
 =?utf-8?B?WG9EZjQyMDJCUGlVZVFhOVNGb0dIVUFoZnZUbjlsY3ZNdXl6OXZkY1NQWDAv?=
 =?utf-8?B?eGxpVFpuV3puQmRRdDA2d21vNXlIdXNUYmVMVWo2djYrTU44VkNMYXZyVkhp?=
 =?utf-8?B?ZE9VZkFYTldnYndTc0x5N3FZemloaGw3L1AxNldFb25zaEd0aXlPckUySzdG?=
 =?utf-8?B?TUkyek9SQitvR1NERnR1OW0rbkV3dlozc2NXY09HWlptZHVGMlVEZ1cyODZL?=
 =?utf-8?B?TDhiMzNmU2ZydnFOOStQNml2QTFWd1QyckpDYVdqb2lwRk9NYytLSEN1R2ZJ?=
 =?utf-8?B?UjArWHRlQnAxWGl3QlFBYzZEZFluMUFsVkhRQ2ZFMGpjb00yYXJsaEdPTXYz?=
 =?utf-8?B?engxOXE3REdxa25GOUkweDhPeDA5dzBod0NEQkg4d0tMTkEwbWFVNGpRZWVS?=
 =?utf-8?B?dlNYZ3VKa1NpQmJpMWgwSVVHcnhLK0tlMTJHSzFidWI2bEdZcmhFcWM4SURD?=
 =?utf-8?B?TXdhbTN3N2QxS3FKZTR3R1A4RHlqWi82L0VuTzVaWEIwRDBXellMeXBoTHBM?=
 =?utf-8?B?dVRFcDN4VU8yZURTS0FpOHF1TTlSQWxOOHo4aTRkbngyeEdteVV3YUNHb3By?=
 =?utf-8?B?WUszL0pmMEJFc3NCbEZYYmY0R2M2QUw5SzdBdHpOcWFUS2QzSm8rdm9TQVFO?=
 =?utf-8?Q?zXglkBRTIcC3SeLYTxGry9A0ciTBM5n+x1kr8D4ngMSss?=
X-MS-Exchange-AntiSpam-MessageData-1: uj6vhyXcqDh0ew==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b8eaaa-cf10-4ecf-1f5d-08de752cbe70
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:46:56.8105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sWxA1XpODw4X8FHuRiKvGQq76DQ0CitvNJx3HrG8RYkGDg+JJi2luMUw+Lx/d6X10K+lnrWd0Vgm1R0fYCqzg==
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
X-Rspamd-Queue-Id: 7B55E1A54A6
X-Rspamd-Action: no action

The limit is 16 pages for a single command sent to the GSP. Return an
error if `allocate_command` is called with a too large size.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs                 | 7 ++++++-
 drivers/gpu/nova-core/gsp/fw.rs                   | 4 ++++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 1 +
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index efbbc89f4d8a..3c2652be74bf 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -32,7 +32,8 @@
             GspMsgElement,
             MsgFunction,
             MsgqRxHeader,
-            MsgqTxHeader, //
+            MsgqTxHeader,
+            GSP_MSG_QUEUE_ELEMENT_SIZE_MAX, //
         },
         PteArray,
         GSP_PAGE_SHIFT,
@@ -300,9 +301,13 @@ fn driver_write_area_size(&self) -> usize {
     ///
     /// # Errors
     ///
+    /// - `EMSGSIZE` if the command is larger than [`GSP_MSG_QUEUE_ELEMENT_SIZE_MAX`].
     /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the command header is not properly aligned.
     fn allocate_command(&mut self, size: usize, timeout: Delta) -> Result<GspCommand<'_>> {
+        if size_of::<GspMsgElement>() + size > GSP_MSG_QUEUE_ELEMENT_SIZE_MAX {
+            return Err(EMSGSIZE);
+        }
         read_poll_timeout(
             || Ok(self.driver_write_area_size()),
             |available_bytes| *available_bytes >= size_of::<GspMsgElement>() + size,
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 4b998485360b..6005362450cb 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -39,6 +39,10 @@
     },
 };
 
+/// Maximum size of a single GSP message queue element in bytes.
+pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize =
+    num::u32_as_usize(bindings::GSP_MSG_QUEUE_ELEMENT_SIZE_MAX);
+
 /// Empty type to group methods related to heap parameters for running the GSP firmware.
 enum GspFwHeapParams {}
 
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 6d25fe0bffa9..334e8be5fde8 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -43,6 +43,7 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub const GSP_FW_WPR_META_REVISION: u32 = 1;
 pub const GSP_FW_WPR_META_MAGIC: i64 = -2577556379034558285;
 pub const REGISTRY_TABLE_ENTRY_TYPE_DWORD: u32 = 1;
+pub const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: u32 = 65536;
 pub type __u8 = ffi::c_uchar;
 pub type __u16 = ffi::c_ushort;
 pub type __u32 = ffi::c_uint;

-- 
2.53.0

