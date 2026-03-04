Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Cb5oKkedp2nTigAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 03:47:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 139391F9FCE
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 03:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11CC10E92A;
	Wed,  4 Mar 2026 02:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qqp2Ixve";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010060.outbound.protection.outlook.com [52.101.56.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9FD10E0D3;
 Wed,  4 Mar 2026 02:47:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3XqesqPfCBAjDPKtWQDPPqSvJJQI5Zmht69r87gzbJz6yMKtQbefFDtz6HhSuXK7kwqBrroAf2pnZfFCQoMTKqM1s5rzazQnAAswqEdUcyHjPFyjTnFYylkkoDusgpS8MDmmvkStL62DBOwAOC7/+M6v8q6uDBmYwUlFfsoi2xpzbGobrGrFoNxj0eHVsHMlUazoogmlXzLlMyAVaTV+ubsgijiPmdzKk23EK0aWz091fAz2C5XkgNFJGL/JhAV1+ocXSwfhMcdvWnXQvP87B5Hsf48aEVR5XnlkTd+OI8hbt8lmfAVmSNYG8sRwNCawDKvSi5oXSAi7LdUp7hVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Mmxnl06EMHWsoVOsp2XrB07xa20Pn8JwbQk0AYBRC8=;
 b=r6SF3Ur6cuheGbMlM7S4z4e5DBEO73g9GAeXTM6DW+KItT57MwrpjR5qWUczPtYlhdEWgcaeNe5xlLYCfHxX18BVsNy+sFesuRuQpjhhnsrgpH9Dy4Fn8j5YY96otCwztVCkIlBzCtdM1YBzcV1r4ffpplsCn0mqfJVFm6wR/7Skr8qic92SC8JRNL//9K1A+ohdNkuyjmIEVw8p2AnflyFs08Y26QnY1y5UMLqE4lyEEQ2dya2a0Vj4/4QAF7vNhLVDKcHbziwgZw05zO+WGlUUq+csyPmQbm4jtZP9mjGdb8Ms5G+gJaogwpSA727PSFRbmUmE7QOkQ43XwMrTrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Mmxnl06EMHWsoVOsp2XrB07xa20Pn8JwbQk0AYBRC8=;
 b=Qqp2Ixve1CFdJdFrsVM3D+8Clz1tjnl8bnbWEUSWCJlle9HPdIKtKhHCxTAymEGkada3DsU5Ftf3oGpJtGglJubevJo9LHx05ifSxgm8vJDZDUyZuvAzhXBpLQVtE3AxDl2ltc3QHYf7hrK7KFhYkmVC5NH+XiJRtnO3g+rMHB2dMX1fT4NCMjiwXA6cy7EG2q7KkCf6/LfRG5Cnt0g4GSztRYHlQUXP/DmkWXm2DqTcyP7jMOT9L6jCsRCsR8uNbVl3N0k4+qp5dHhw8xkFwQj1xtCkV96+xYR8w9jV9g6tOhbRJzCl4mSq7jM90mYfUpytI1BRbBlrpaL5z2I/cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH1PR12MB9574.namprd12.prod.outlook.com (2603:10b6:610:2ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Wed, 4 Mar
 2026 02:47:26 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 02:47:26 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 04 Mar 2026 11:46:36 +0900
Subject: [PATCH v3 1/5] gpu: nova-core: gsp: fix stale doc comments on
 command queue methods
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-cmdq-locking-v3-1-a6314b708850@nvidia.com>
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
In-Reply-To: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
 Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0329.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::13) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH1PR12MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: 32ba0e82-1381-45cd-29ab-08de799858f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: fW8TVgRh1HIVPkpUDGI5leLp5oBnWoPyNRxFIWliZ7gIvgxO7JGAffcLhSN9bkU6ZnhoLKs1iCXT47W6Z2Hyag9YPvQIWh3A9ZpQ+gUpGFzRjVBQ735tgM7k6P/9NRT6oDpR7M7gKH8+0gJcnL+Fq6hASHC7yFdgS/CqjqIyKRbNVnUdIxy7jCBA/BNLkD2GcK6agzV8ICXSKy3qo+nR2q+WENzqnrBhJVww2t39u3DvsvNoGQ/Kf/YEEXc0hNZlX4D590jdHomQiE1+mR0b5JF2sQ8iqFL8WlILLGzwj8eyQ28BS5M9yxXghmrH8LYwUTTuEtmiL9XKJNLeWe4tuL+Fg5DhMB81Up1T5F7cjhdAnkT0WOCoQB2qRyBmeoDFi/4U5qAgVbMFtmdVP8jr6aTATYiX0PdatBIIY0/R1+LnluNLHqzvV8oaJyurBQQnqRZSoOzTFqVvOwSDe/54kVMbu9TpDQIdY8pWQ/nLadBrnwoFExAPZRFrypp4//kTOSorf9VlG38sffm9ngyCsncsiBRvTME/FITHD3sMZj1yP9ottZ6fveuulR6HEX9Xfe3tgp30xCYhNhCfUL97+I0ytSVmtQZnc2yPcEcluj8BdouxJ3XexOdz5kZ59EQrQanSiHVegZ96CYHcMUBR2LA0/ds/ctsGCvov0eMdPxcA5pRIgRl0woJxu5HsAoOHTw4xy10LKKlq45eGvxd4UjjR5alzgSFz6dpG+oIu9dI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFhZTTRhQ2JUekN6TE90eG9ONW93TzNOQW0zMXFOalJGOGRWRGlrVXUzMjV2?=
 =?utf-8?B?UW4rQXRaWjczaFhJc3JVc1dkemJyNGZwa1E4Y0dTSFpBK0NlVU51bU1JTXhD?=
 =?utf-8?B?RHM3N2lkcWJMakRNaFJWTG0xQ0UrY0s1WEhvN1Q3bzFmc3BHM1NEQ3huY2NK?=
 =?utf-8?B?UXVDRVFTa1Nmb2Y5d3Z5TXdMdnoxU1ArK0tXTDR0SDVjb3RtM1hhTURFQmxJ?=
 =?utf-8?B?UWFrTUFlOUphS1JRM1pUaldnUVFvR25qVE9oVUJMdk1TUkp6Y240S2wxdjdn?=
 =?utf-8?B?QjBKUUZDSnd3ZVBvS0p1NFVEMnllRStwM2VrMjE1YUU0Rnk4NEpaWnFtWmo3?=
 =?utf-8?B?Zm5XZ2I0Z2dqM1hYY1B4YkJORFVxMGhoenBzZ3NLMEpDODNnQUpzb3h3aHNO?=
 =?utf-8?B?OUhBQU1CNWY5TVpQWTk0MDdGV0pyczNnT083VExWSU1INGdPWkdlUGYxVmxY?=
 =?utf-8?B?Q0htMUZ3NGJZZ3VlUTNUTVB5UW03eUtqbHlWQWZWbFY2UUFVWnlQV1lZTnJx?=
 =?utf-8?B?dFBmZjRscHc0ck5VS2hvOUNTT3RmZ1BBTFBSVjZ3VXQzQkZMU3lGM0JSUVhT?=
 =?utf-8?B?Z1NldUF3S2czSmpUWWVyZ3dTQVNaTk9PSG1oOWxyM21mQms5SnhMc1RJNEds?=
 =?utf-8?B?anNJcUJJWnViNzM3TnkvTnNyY0FINFlCdXNLbzVSS3BlTUZPMjRLRm1sSlNC?=
 =?utf-8?B?bW1oSTFHQzZTMGZMbyszQWJqWWJmUCtGSzU3VFI5bHV3bmVCbTQyUWRpTzVo?=
 =?utf-8?B?ckJwMC82V0k5dEdqTC9xaWFUU2FVWVN1VUQ2dnFrcXBZNXdOVWQ4M2JBN1hC?=
 =?utf-8?B?dTk4WU1aY3lxNUpudTcweXBqWThSYzJFQllZTHJKTlNSVjM2dzFSUkVVbUpS?=
 =?utf-8?B?eUU4cGtTaUowWFg0bkNxYkRpNGV5MDE4WWhaTnlSdDFsaHhCRnl4NDc5SDJT?=
 =?utf-8?B?a2twTDd3ekd6REduYktxRTZsaEFlOHc4dzBHWXowaFB2ZXdhUmgwNEE2bkVh?=
 =?utf-8?B?WTRQTDBvaFZhdU92cy80eEY1N3c0MTMyeWg0ZlZjZ2ZIZVNNWG5QL2VDY2Rs?=
 =?utf-8?B?VEJHc0FsT0diRng1TVZZSVRtaGNSek9ZVFdNZVVBSXk5dlpIREFmM3pFVWhX?=
 =?utf-8?B?WHozUHBlRlNadWlHcE1rdndSazJ4RXhLS2UrYnpoOTZaMmpPU3dQUnNUdjJz?=
 =?utf-8?B?bHVmTHByUzZPZ2h5Um1mK3pwN1hhNzd6MkJTUVRHazg1Ni9NY0tJOGxseGN6?=
 =?utf-8?B?WmFyQ0M5S0dGMlN2NDFINE1mby9GQ212WlFkSGRiYm8xcGtpWkg0RzBVVXJX?=
 =?utf-8?B?Z1Z2MGFHZy8xTVFTTmtyRVhmeGl3SEpscmY0MVZZdFVjb2pHR3l1bmNvRVR0?=
 =?utf-8?B?YVhoQXYzQ0cyNm1udlNQbTlnUTYyTjJlYW9mODIrRU4wZ1V6VXhZUmFMY1Rp?=
 =?utf-8?B?K0cxUUxmWG1sN0RjcTA4c2NmeG0xcG9mSFpUMll0VTRHdnhwSkpIcFpEdEZs?=
 =?utf-8?B?UmtEOUhTSnB1ZWFOd3RrY0VXV0QwWWtrbS9QN1ZMVTdaU0RNUTVtSm5UMURh?=
 =?utf-8?B?MnVCOXdZeVQrRmwxd3c5UDFuTVRnNDZobVdwc0pKT25VMDh3Z2xZQnAyR3dr?=
 =?utf-8?B?RUpKRWpNL3dwbEl4Kzh4UVM0YjR4a2p2NGE0TW1EbGREblJ4M3JvbUZKSnJ6?=
 =?utf-8?B?Y0d0OWVHOTc3NkRGWlVYbElYTi9NVU1HN2FMenhuUU9QQUJVUzljZk96d3Rp?=
 =?utf-8?B?K1pHZUpYVllKc2o5Z3FhS3FQcHYvK084NjlJdTF2VCtsaG9qK2ZwQjZYb2pM?=
 =?utf-8?B?bjQxKzBmWW9rZTZzL0lrNEVNTkdrT3FldmhMYkNBNHpKbzdEWGEwU1Y3cGFa?=
 =?utf-8?B?b042UVpHaTh2Vm94R1BYcmpXRFZXMzBIczJidFpZbE9QbWdHditJQ3JVRzhv?=
 =?utf-8?B?dHEwaDBrcCtmVDZha3VxSWQ0UFhOTkZrbWtleVdWVWxMdjg3bXJIYXJIdnZi?=
 =?utf-8?B?Q1ExTUt1ajVkTXhKR1dzTGhlcG43ZXdqb1Q5OGhJdjlPdEVWa3BhYndPRDhk?=
 =?utf-8?B?aWVxNjYvSEpmZUZlUHl5QmoxQTQzcWlNOCtmSlg3RXpHMDRqa0R6Y3EzbXYx?=
 =?utf-8?B?UXl2UUdOWVhuR1E0UTAwL3hUbjBVT3cwWDFRYTk4bWltVE1UMUtiL0g4ZlZ5?=
 =?utf-8?B?cEsxd0VVMUs4MHpqRnpYT1g3OWtvaU50WmhpYUFtVitxR3hVaG15U3BvblV2?=
 =?utf-8?B?Vyt4anJnbEVPTExtN0Q1S1ZMMitYVVp0dXgwbHYrUGhDSkNSSS90VHlMdGtp?=
 =?utf-8?B?R1BzbWNMM29iVEx6b1V4aTZ0a1BSTE9xVWg3bW1pT2RXWXExZkpGS2JuVFNH?=
 =?utf-8?Q?H4OClAs422sRlxqKeqQtn4STPt1crL5aah7zlonZVhaa5?=
X-MS-Exchange-AntiSpam-MessageData-1: jqH2DtnFoxGM4A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ba0e82-1381-45cd-29ab-08de799858f3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 02:47:16.9305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylIbdOFw7XWVJf4DWjhbRps0I6bzDiROdHMwPElizzJp46z4ZuJGHeVXzIYlvpmOLgxm2PDCVpYraDYhpBE13A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9574
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
X-Rspamd-Queue-Id: 139391F9FCE
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
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Action: no action

Fix some inaccuracies / old doc comments.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 492e9489e808..4829830b6921 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -531,6 +531,7 @@ fn notify_gsp(bar: &Bar0) {
     ///
     /// # Errors
     ///
+    /// - `EMSGSIZE` if the command exceeds the maximum queue element size.
     /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the variable payload requested by the command has not been entirely
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
@@ -711,22 +712,20 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
 
     /// Receive a message from the GSP.
     ///
-    /// `init` is a closure tasked with processing the message. It receives a reference to the
-    /// message in the message queue, and a [`SBufferIter`] pointing to its variable-length
-    /// payload, if any.
+    /// The expected message type is specified using the `M` generic parameter. If the pending
+    /// message has a different function code, `ERANGE` is returned and the message is consumed.
     ///
-    /// The expected message is specified using the `M` generic parameter. If the pending message
-    /// is different, `EAGAIN` is returned and the unexpected message is dropped.
-    ///
-    /// This design is by no means final, but it is simple and will let us go through GSP
-    /// initialization.
+    /// The read pointer is always advanced past the message, regardless of whether it matched.
     ///
     /// # Errors
     ///
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
     /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
     ///   message queue.
-    /// - `EINVAL` if the function of the message was unrecognized.
+    /// - `EINVAL` if the function code of the message was not recognized.
+    /// - `ERANGE` if the message had a recognized but non-matching function code.
+    ///
+    /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
     pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
     where
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.

-- 
2.53.0

