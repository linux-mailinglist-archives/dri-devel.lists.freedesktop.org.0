Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEwqAMKAqmkMSwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:22:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A249321C616
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53E110E3A8;
	Fri,  6 Mar 2026 07:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SuuI0Nrv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010043.outbound.protection.outlook.com
 [40.93.198.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8697310E397;
 Fri,  6 Mar 2026 07:22:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyIh1M5eBETZGVLuXg5qLGWxolLd2v1I5U4TvQ5D/4mZ4JOBAzOqXU3kEkWaErghBEOJ5enAGVly0smfYzFdMEA6BS+8bhjT84Lxmb1cB8BZWQ5IpmA7DJxWET1RXgdpSAFXLAjiPWB2wB7Kip9vAXkYSr7sY8vs8gRG685t/DIa4EqUKLKd1yP71ashmVCay/R6BIcZkrE348rdl9Orwty1HlkEWvTJwqdxTiAfndldWFb/nyFOYThw5r4m4B/SuPI2iY6VVq5WOUZXreqNu83TE+Yb+1bflwXjPTyYwaTgHg8FpzY+4MOJLLZtERWDZs8obs+Y1nySD1tl1Fb9ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtSI1x+tXgrTn6AxMNX9hjfaFkfZ0bjfJdroggZg+ro=;
 b=DBInOBhai4NqeGqbU8jOiGVYR0hbw/yvYq3P0NbtaAsndeZVn6izGkGDbxq9frkPGuwdQoVQhpEWLMogpevLRmUd4z2uMiyj6Ql3JtGTGvInCodxWlCPOECK2UppklpL0DDsuaBgAE0TaIGI92HaVzt6BKnKrImsN4xB/Rfq/HnutNpSsJg4WVCDpL8+0BE7c+P1YM0ca29CsQt7VmW5qD8NCI+wkEcm/CW9o6g157Tf/+GClGroBrrQ024YsQYTkqTHD8vNcNIEVrTTv85pFmdu7kcGsY1QMBD5t+miRmpKjfpX/9cqgYPQgAlK+3dvvSUScGCiW6yKlCK2Ong1Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtSI1x+tXgrTn6AxMNX9hjfaFkfZ0bjfJdroggZg+ro=;
 b=SuuI0NrvkEaGFv7wJFX+FgfOPbRsp1DrxowYHoB1mT5WbZsTuLeRmOpqyG2o7kzfcWtgQZ8RztXzXedKuTP5vQGhGfgggqk6intEeM15sA8Ne4T7aytuLot7xYFmx18DplYULTIPZAP2jxCN7fB7Nz8aWypEgUBAnVfXRGFYscK6nHAbwwNGfnR4QS4mHKlDCRlfzWo5Xxtq1c8V9qSrbt8LH8A78NaNCIJ8CUYJLRryQ/2ZZM1Uat/CTqM6XJa5+RRUkh37RhEs6GpbNugb8VOSp82RZS7zQW2GzK3HgHpYxspxdS2ugbVMIOnO2yCNFblH6WQzFhP8OJPXpNIqvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CY8PR12MB7340.namprd12.prod.outlook.com (2603:10b6:930:50::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 07:22:34 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 07:22:34 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 06 Mar 2026 16:22:04 +0900
Subject: [PATCH v6 7/9] gpu: nova-core: gsp: add `size` helper to
 `CommandToGsp`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-cmdq-continuation-v6-7-cc7b629200ee@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0138.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::13) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CY8PR12MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f74e43-ed55-4fbe-b603-08de7b512308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: MO1t1Vk29072hk3OSf3wIt1rFuJNcxUDW++QC31D6G9WKGpufOcxp4sQpJ7lT3OZVeLbw0o9rwR0dEUgkNTUQQaCG8ZJ/s3v2EOPN/0Qd1pDn30lB+4xuxo1cR/2gyJp0fPBz0oTl0b/aptozmnss+2xtIw0N2S8vxQJbznzfrZcye2CbzziEOS/hISkAnb9h8oY9ll5KW1SKQXt2kgosr7Xo33CO9HzPi2YU+Ec9cuEsY3VmGHkg/aUNXJUNLiILg2qicawD06WKxPqzFDGBfGUoT0rkjq5qQm8mQWiKQgbrLWba0Ji/H/xvsyM0i9qOWGQsiyaQ1nWF1lBrWVJdCh/6e5riBi83M7OnLSyeOwMNQRfbX3+zZCzcMtQ4bDxRWA2Fg69WYOb+6NFPA7gnnQ/sR7jA6M5qubxq4oDOiOzZJQL84Ncu2uduM3WwWebtSgpwjhJXnZLpOEWvqwmY9mlMMVE0RxSS6u9JFBsbl+89JVXQIz5jmDv5zH3OSfj9MbfzyrXk+5OYG76SMUlXiM9gk8246X81sVcPPxBlxZ66VfU52OqB/JYF/ThKgTN8ddsQ+bOHSVWCrmeNSFfUKO2PErYDDtSkI2ctxJp4ArpG2NmTDf7q9CDWUB1sPAR/fPlcg5P0xioqDmIZDpoF6d+kdw7zEf9SZD3Y4Z7TfYQA1Ss9u1C8pMJahasuLAXq0s8K6eizrY1h46nLKR8l5lIWK0uU2x3E8Mftd9kzeSy/K3wQezzoMPnXDriXdbI3mpxjamRlICkjIYc0MGOjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXNoRkRVMXFlM256anUxNFlGOG1RUzZzcnBSS0Z2VlFUV1JNelMrKzIwLzhK?=
 =?utf-8?B?S3ZOc3MvOW9kcjYyTlMzUWVVMVRIczhKSVdFc3JaYW5CZSs5cWhCU2ZBY1h3?=
 =?utf-8?B?U3R4RlgraWpvcjF6TENNanRETDJIUFU2aWxtS1hNSGFoT1FoZnJHUXZGenFP?=
 =?utf-8?B?Sll2UUp5d1Q2bWx2ajRlZmxpUTB2SmdpVm1SOVowSG94MjAxQ09CMEJRS1hD?=
 =?utf-8?B?YzRtZ0FXU2NhaHhnYmI1VkQ4ZDQyZWFHTTNSUWZGYlpYQ3o5ZmlieTg4SEN2?=
 =?utf-8?B?RWppSS9uOGhoU0VLQXFuZVIvbDFFQkVoVzJ6L2duMU8vckJIZEFzc2NTVUwz?=
 =?utf-8?B?ak1aNytHY1NHMzZRNGJ4aUhVZnJtckhuenlvVFNscFRKdFJVaWxDdTRrTjMx?=
 =?utf-8?B?OHdpRFR5ZTVscStUOER0U3FJV3c1Q2dhalBSRmpPVWlvL09sMCtHbTd1VzRl?=
 =?utf-8?B?Y1lpMjRXMUllUDViYWFnR1E1TDZjcCsyeWZMaFhOcTgxbmhJUXpvVU9pRUsy?=
 =?utf-8?B?eDlxb0kxUFkrMnRMS3pBNDYwV0FsYU9Mc2lGVzM0dDZsWElyclRvREVmaTVl?=
 =?utf-8?B?UjhzcUJkcGVJS1FVNURRa1pNdHRQZXJiYWt1M3VSRmlPQmZWTUVpSFExRHFm?=
 =?utf-8?B?ZUUvcjFla2lRajlZeS8vcFN3TEVnSjIyZkdaZzZ0YXBYZ2hScDRYOVRMTXhm?=
 =?utf-8?B?T3RGTFlWNmt6UmlPbm9tVWJjR09UVGNBaGVFbjF1YkZFVXZudkt2aXZ3OERo?=
 =?utf-8?B?TXRraDN6aDQwTTBoUlBybURLQndVdTJKajEyaDFROTdNbGc0a1BDc2tjc0dk?=
 =?utf-8?B?TkRwTE04RDdBK1l5amJBWFhOd3d3MEtzQVU1enYwNnFyQXB3TGNTTTNYTzZy?=
 =?utf-8?B?cWxWdmNocWVWWEJrOU9FMXZxSXU3cmhDbHZxZ0FmM21GMnNoZGhkWm1JZ09Y?=
 =?utf-8?B?UkpjRUN2V0EzcVNKSkRaUkpYalpNZnhZVDc3TzJzTTNYVzVvWEZveFZ6d2Jz?=
 =?utf-8?B?RTk3ZHVxMW5MdU50NW9ZMXp4emtJS1dRdGpFNnA3SUxxN0RXbjhCUDY1UUVT?=
 =?utf-8?B?K1dCTUI4ZWR6ODgrMUlGSk9nWU5HK0NFVVNIQW55Y1JleEc4QytCVllkcGI2?=
 =?utf-8?B?cHE5UG53TDE2cmVWbEp4ZUpCTWszT3B5bTBRNmZJa05BaXZsMXJrL0hLMDVJ?=
 =?utf-8?B?NE9IK09IKzhRYnQ1Wm5IL0NTVlI2ekxoTTNuYVlsNkluc00vRktpMDhpcmc0?=
 =?utf-8?B?TG1Ed1NBR3ZmTXQvUUdpTGZZdjVOL205bEVFdkNUVThramREdlpRTFZZbGto?=
 =?utf-8?B?UDhQMUlaS0s3VDFyd3Brd25oZmFQdDhCVkRDRHJyR0NHWnBESkNwVCs5c1Rt?=
 =?utf-8?B?cHZYVlRjcXRRNTVENk5qY1pROWJLMWRqS0tmcVFyMENTMzRRU2pDWkxnTW9B?=
 =?utf-8?B?dDd0eEpNcUxnbzJjZU1KWHQ0RnhSVGsxeHpTb3ZLM0hNdXV1dzVPaWdiemlj?=
 =?utf-8?B?enl3SkF4SWgzNFNNYUd4SGEvNDMyS3o5UmpCUHlrTTgzcGhFdGtUQXkyWW91?=
 =?utf-8?B?SU5laUlzTjY0cmIwem9LQ3hzTW9LQms3WHo5SDlOLzB6QXdqdWVBYk8rVU1v?=
 =?utf-8?B?cHV6ZjZtWlVFSVo4VkU2b04xdFVuWlVoeDU5M3J1eURkQ3ZCK2pqKzNhTGFP?=
 =?utf-8?B?aGxoSjQ4bDNtUUszNTd5cEZPRW5SU2o4ZDFWT0pYb2h0R3A1WFdDRUpxRXlE?=
 =?utf-8?B?VVdGWnJmN1dqdXllT1U5TkZPNFBZd0s1S1ZxNlNDUXRWVHZCQi82b2p1YVh4?=
 =?utf-8?B?SXZEUnhqTnBiWnR0Zi9UQi9QZG1selhZMVpVSjlyZjVQcHZuazRwUXlNbWdQ?=
 =?utf-8?B?bFZCUHZVSGUyRzBSb1QvMlNRZXlFWkxEWGlZQ2hOc2xpeEVBMjJsb1JUZEM1?=
 =?utf-8?B?UHYyWmdYZ1VmelI3cVFLT3dPNXBySktuNStzc0VLRU1GZU5reEFaeDBCS2NI?=
 =?utf-8?B?Wi9RLzE3VlRUbW5HeVJwT3lpdUczTW5DTUZNQjRDaDgvQjcrNFRjeWZZNEpx?=
 =?utf-8?B?MUhLYjg2Nkpwc09kT0o5S0R0WWR0UXc5MW9oOGt3UlpuNFRaSW5rcFhDWXVL?=
 =?utf-8?B?bU5QelJHdGxCcERZNG9NM29JeTNMOWJybW5WS2wzTWhGaDQ3eUxFWTdRS3ZY?=
 =?utf-8?B?cWI1Zy9KZDlBd25Md20zRlNJMEhub2Q3UmJoSUQ4bWx1WEQxYlRlYnpveTJG?=
 =?utf-8?B?QzF2M0tFWlhRVWZITS80R2E3TW15dENZeGd3S0lCK2V1ZUtWZ0F2dlhtNnZ6?=
 =?utf-8?B?K2Nhb3Y3QkVUbkNjL05rMWVubWRPVlB4L3A0dG1OOW9tMVVueHdMaElObEhE?=
 =?utf-8?Q?RKMlAl5uO6YDgS045umMHK/j+RWt5sOOe82TOztFwSNQC?=
X-MS-Exchange-AntiSpam-MessageData-1: 8+ytoNtjbgk9LA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f74e43-ed55-4fbe-b603-08de7b512308
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 07:22:34.6046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1y2Lpis0PlcZv1D8XjzyvKvJmW4aptrIHmCYEaZTbxggDTtHUhqHvEO/OJ/ND8rOxB3ANCE1LHHMNDQPc9dJGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7340
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
X-Rspamd-Queue-Id: A249321C616
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
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Action: no action

Add a default method to `CommandToGsp` which computes the size of a
command.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index b41a866e24da..861f5666fe7f 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -94,6 +94,12 @@ fn init_variable_payload(
     ) -> Result {
         Ok(())
     }
+
+    /// Total size of the command (including its variable-length payload) without the
+    /// [`GspMsgElement`] header.
+    fn size(&self) -> usize {
+        size_of::<Self::Command>() + self.variable_payload_len()
+    }
 }
 
 /// Trait representing messages received from the GSP.
@@ -529,10 +535,10 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
     {
-        let command_size = size_of::<M::Command>() + command.variable_payload_len();
+        let size_in_bytes = command.size();
         let dst = self
             .gsp_mem
-            .allocate_command(command_size, Self::ALLOCATE_TIMEOUT)?;
+            .allocate_command(size_in_bytes, Self::ALLOCATE_TIMEOUT)?;
 
         // Extract area for the command itself. The GSP message header and the command header
         // together are guaranteed to fit entirely into a single page, so it's ok to only look
@@ -540,7 +546,7 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;
 
         // Fill the header and command in-place.
-        let msg_element = GspMsgElement::init(self.seq, command_size, M::FUNCTION);
+        let msg_element = GspMsgElement::init(self.seq, size_in_bytes, M::FUNCTION);
         // SAFETY: `msg_header` and `cmd` are valid references, and not touched if the initializer
         // fails.
         unsafe {

-- 
2.53.0

