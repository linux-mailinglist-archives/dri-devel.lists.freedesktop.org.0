Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC6oKvaAqmkHSwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:23:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2874521C655
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:23:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFE110E398;
	Fri,  6 Mar 2026 07:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rn0vShzA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012022.outbound.protection.outlook.com [52.101.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E65A10E3B4;
 Fri,  6 Mar 2026 07:23:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C476F/FUHdLUnekRYZYRZ5vWUsjNH2mYP6JHsQJnDrw/EFMzuVenXhEaYp4KC54GXvDesDjys8o7NH1mK4PqKZqM1YIPerC/XLIaro7IJd+dNBMnEQI5Xom9Zhr3tJV0bVdxk0QiL0v5+8Q3bZRCdUULVtQuW3hQ6biDIQXtJBaE9kKLJ5CDa6sj6RGcxFhqXzWaHeLp1PUif9dus0iMVRdJZ9odBQrqxRHHVwPvZtbCEsMUA42vgbTGvH5xpbr1P5bKhjQFLjmZc+os/udLldsOp30sTT9KZhgazxh+rs0SB4KjmGfWHsOy1CnRtQyCHyHBo3VHMYFRNChZlwG1UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1KVY7qcxbc+Kqw3oDNpVcn+Wcf/mXSmiLOKD/C/lhI=;
 b=TP2uDAp4iXJ5BtYPAl9+q9cnUd6WT0RsmiI4XDbviU6DdQ11gu1kWj9j/5E/svjdkQr8gYMw26kV+nqYnj3CfGTBS0JxO64a+9cO4XZWyxFNN+uKg5nnHPdXRKAVZcUzu9FrkTvwD0Im//IZ7X3gLlqx/YbOnUmvJOs0gI1nWma9+jmcCEdk+BgfueGJH1yboCxKDPwE9bdFWPMta3oHz3x+QfIDwf4Em6n6NsWHV68wwst+zEsPQjrXDn6szym0T2C7Agniz4glfk757Y5CFF6TXfdUmaj9ncLDYDOS0if/6/ONJUGn++fCyt7+pGkj/h3Nd88Uc6Ytqcaqapcj5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1KVY7qcxbc+Kqw3oDNpVcn+Wcf/mXSmiLOKD/C/lhI=;
 b=Rn0vShzA7w3xiATcbzbLV8j/HsrxIwFlj/3zM4k268jfmSFnsLuPWLpbjovmBlwleD858ReJiZIcx9mySuo/ma+Oyfs/rtdyCrBGsWbuZBPAAHRTXbBfse79ZmovbcJGGOsXq/KRMmvTQX6gQ4uUzs+qYuaQXxRP87/YuU9hQFVqJ3fK+9L/Z95Iv8HLWy6ektNpMyWnA5gKu17ZVwWDtvO7oRdlbMfTpfMynrIRJox4rA2a90niZxu6VcdEyK1iRMDUP7W+ivGENBLAQcxVGRO16WH6P4nISY1p+tgki8j92YI8aA0yzbz8hl1/fbNaN1pswFP/eb6NLXhmKlW0HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA3PR12MB7951.namprd12.prod.outlook.com (2603:10b6:806:318::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 07:22:22 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 07:22:22 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 06 Mar 2026 16:22:01 +0900
Subject: [PATCH v6 4/9] gpu: nova-core: gsp: add checking oversized
 commands
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-cmdq-continuation-v6-4-cc7b629200ee@nvidia.com>
References: <20260306-cmdq-continuation-v6-0-cc7b629200ee@nvidia.com>
In-Reply-To: <20260306-cmdq-continuation-v6-0-cc7b629200ee@nvidia.com>
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
X-ClientProxiedBy: TYWP286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::20) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA3PR12MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: d3265141-4ec2-42c2-3225-08de7b511c17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: 6PEs4enP30zK8NJW9qLIR8PWd9Ugw55+TAWfDsEg/N+XqhRcLb/RBfX4SPbjcjN4z77A3vz9pfKFVky4EfxhHUQYJGjymeEDnTRR/lPs9wX1Nx6PKA5IdgpeYloOBbCS62H9PamAIrcBRrhKH3hsvQ4RCP2NbSzpWUejMHQzT5yEB//xF3aq8Rm3pak2eJIAW7K28TAPkRk8BoSmSu0vWHt+Ss1otOQrfiqYkAAarJ8BG42Dx6FqV/Y+OZeumrLFuw7Du6gdDgDJwl84Y6627ZRww5E70smzheIOK1c8GQqvpSo4qiXmCppP4GgCCwGWXS4Yp+2H8MWNOSUAtJZaijQmrF0ZldAnqFqMlBxN+FwpPomDIT38yYGyuzVeqz/ksFwwpsM2vL/e1l0COdJgZp5w8R5eVej0uTCuJS2KKudiFlnO0K375s2KWUlO8bxsuK+9fWjl44sCq3hULVeWO1ZB+rKpZ+Mpuuf1sRy5VpZL6YQJEy7Hjkll3kdSrzSAbjTnABBTSO/tORURVzi64whPp6L8YQVoIJggh68SS2/mNVHbtpAdbsb40d5gly6jnfp/BQPn0vF8RKipzs/zjkrPu7lQazqhF+mJpczmli88MawinnqoCLafxw7tPRS9FyaICl+R4E/cK83EfXvrP9vugTAldgaojdbun7OWAj+bS+TaO0zCnt0hZ3XUTaC2iq8WgGREgEfk/zi3w1ZwImyYw8Xkk6HAwRPaROyClnJeBpu+Fl+ySaEAIodj3Kw1MB7xCQx9Lk2IzAS+qWxMHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDBramdaKzgzc2RLaWU4aDVFaE5uZzNnS1FmeHZPYWtiZWRpcHVtUjVmWkRy?=
 =?utf-8?B?bUhJcW1uK0o2M21zVVRsL3lDYk5pTzl6RUlGV21ucXlxWFpTemh3Zi9GWEFk?=
 =?utf-8?B?VnlvcjRGS0dwMk82VTRLQnVIOFpYK2R2VmpyOC96bm45MEFpaDBwczUzeDhy?=
 =?utf-8?B?dFZLdlcvSUlVVjZBK1pNQXl6aVQ2QnBZZ3V1RlJEeFYwVnFOaXpFQkRSUGEr?=
 =?utf-8?B?VC9YYlNrOHBhWUpEUTc4RXNtb2dhdG1XK2hBeW4xNHAyS0VpV2pqdnNxSWcx?=
 =?utf-8?B?bDM4VXlPREdHdmVTQlZ6bWd4aUg1LytxQU8zZEl2YVpCM1M5V1l1K3lYam43?=
 =?utf-8?B?VDB1L244OHppdGRNZHFGSGdxNWU2OVhUQVREQ2phZW9xYVlYVGpHd1Q0aWdL?=
 =?utf-8?B?UkRkOU82N2F2cHpIWXhBUzdFSVlWU0tMVGFXUGpBR1gzby8vU0R4M3lldURt?=
 =?utf-8?B?a0FYSUhMVGRPVHNhSnRJcE5hZ3daaEJWb2lpMHBwYVdreFZVbjNBdkZVQ05U?=
 =?utf-8?B?NUFjZXAxVVNzN0NXZmI3bGgwbkNNcTdOR2J1R2dzM3pKYlFzUDFKNUlHOVhX?=
 =?utf-8?B?RTRnQkZIbWpOSzJXYVB2UE9hdnE5RGNPblpXZ0o0N0oxZitRQThwVjhhR2JN?=
 =?utf-8?B?Mjd5eWNMZ3RMUnBhbDhnK1E5V2FORlZMU2VtcUIvM01IWlRsaU9yK1VhUlNS?=
 =?utf-8?B?OVUyQUh3SFFCNC9GNHQrUXBhc1JIMnFjeHErcmphZTd2UElraTc4OUk1QXJ3?=
 =?utf-8?B?Z1hHWnRkeTMrWnV0cExwS1FuNTF3K0xseGdYcHB5Y2NxNFllamtOM3h3N3dx?=
 =?utf-8?B?bWRNTWpYZ0FKdXlXYVdZNFpvZll3VkQ2SzNXdVZGZUhqblNtYXZsOGZNenJK?=
 =?utf-8?B?U1FTZWl2VnZScm55UFdqd3V4ZFVpUi9Rcm1zZXA3dGJRellJVXQwa050UVp3?=
 =?utf-8?B?OWd4Q01tUWh3U3FwMVREZ1F4WnRNaGR5VWZDWjhxNmNLYXFNOERlZ0g2U1Q2?=
 =?utf-8?B?aUl3MGVPN21pVHpUc2JQQnY1N2I0TVp3RXcrRTVjZ2NMLzhOZ0JXWUtoRGFz?=
 =?utf-8?B?dnV6a2EzRWFLWjJKSWJIaWJhN0RuU0orR3FLZFk2bTRLNUhYQ1prRDlZa3JB?=
 =?utf-8?B?dW0xcVlVUkJiYTFnM2VNeUR3c3JMRE9jTjNrY0RUb3FSTGZOOTU4TlMvbnBB?=
 =?utf-8?B?cVJhOXovQytWUEsrVWJ2cXp0M04ybWU2Nk5rMkZEY01aSndVRElYemswM1kx?=
 =?utf-8?B?WDM4YkQxcHV0TlRLV0cyeFRGcGhRZjVQNnlKdjNoMlA1aUxjNHd0SHZEZ2NK?=
 =?utf-8?B?QWRQWDNJSm9UbWxLNjY1WEpTUDRhcGNCRGZQZFkzVmNrZEo0S1h4bEYwNktQ?=
 =?utf-8?B?QzJyekJSS0cvNEdyZmw0V3FBMVlNa2RQYTh1aDdhSkN0SWRPUjM1dk9ETGRh?=
 =?utf-8?B?K1pHL2ZuN0o0WHR0V0ZsSWhxYUthcnQ2OFdoRWdXaHBHQVZFTmtaZjR2RDdE?=
 =?utf-8?B?cmozRmlVeXc5OHVEVUYrR2U5dUl6U25mVWx5OFZkUnJXOFpIaC9aZ0VSczRG?=
 =?utf-8?B?M2p3YWZUV2FuSDlTeFVtbmViRklXUHNzNE4zTDcwYmxPNFhmME13V2daWHQr?=
 =?utf-8?B?bEdiVzl5bXZ0V25UNmdEQ29QNEp1eHpsWWxNSEgrdUVyeHFiVlF4RFVjZHlH?=
 =?utf-8?B?V1lrRFFOS0pVekVaR2RPQ1gxMkJWYjdDRE54emYzNlRETkhYajFUMFZGRFdP?=
 =?utf-8?B?RERXZkZrRE0wZE9IY3RhYW1kQ2h0U1VKa0hPSEZ3YlpBQ1dhQ1k1VktTUzlz?=
 =?utf-8?B?YVZpTnd4elRGUlZOOXhWVTM4NS8zeG9wVzkzTTVkbW4rZWVOS1FhanErZHNI?=
 =?utf-8?B?Z01uSERGY3lZelloWUhaS2I5dy9rZHVOaHRVYW90TnBOd2xMbFpJNzdkbFg5?=
 =?utf-8?B?VUo2MWRtS0Z3UU9GNHdoYWNVVnNHNXRvOEI0eGZ3RVQ5MHliT3ZxUXB1MHll?=
 =?utf-8?B?aW5GcU5tc0ZTV2hLMlYweHZpN3JQVlQ0YUFBQWpvMGh4VWJrbWcvRmxyZFk5?=
 =?utf-8?B?KzhjcDlmWmM1MFJVSjU3bmNrMzB3b1ZIb3dZM0Y2bEhmbG9oNU1HM3RCWHRw?=
 =?utf-8?B?TVdrbndhZld5ZjB4VTVTRUNobkVQa2Z6REl4QmNRL0VlSkd0QXFZTXhPSkZK?=
 =?utf-8?B?ajM5QTJDK1RJeVFncUdwUnVBcExZYWhRZHRsUGV5ODVCNzlOY0VmZDRLUGp3?=
 =?utf-8?B?cHpkVE85NWRNeFByS3dJaFZJWnc2U3NBWTVFWnFORzJzMzJDRFBCZHpRdEFm?=
 =?utf-8?B?cjcwdkhIb2cxQU9jaGR5Mzhka2l0R1kxVGxEcEJveDM4dFUvS1lmeXQ4ejR2?=
 =?utf-8?Q?T5LmJQbONJcf4T2oKsIUyOh27RD/J8licslZLUWaLDJns?=
X-MS-Exchange-AntiSpam-MessageData-1: AYa44RxKckJCvA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3265141-4ec2-42c2-3225-08de7b511c17
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 07:22:22.8447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6RM7uAuvOHK3mQ6qNl9XEUaFWn/jvV4l+pAXkeLLzzOCXRSl24JwLpvFEei9gGrdCgmR5PrMyWgOlkPiP8VCQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7951
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
X-Rspamd-Queue-Id: 2874521C655
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
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
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
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
index 12849bc057f2..8b970523d789 100644
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

