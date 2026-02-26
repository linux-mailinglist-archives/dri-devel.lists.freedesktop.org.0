Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBtOBcsyoGmLgAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:47:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671971A54EC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:47:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507E310E8F9;
	Thu, 26 Feb 2026 11:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cONv0/ls";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3769910E905;
 Thu, 26 Feb 2026 11:47:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONEHh54Cifcu7kTM2j1WaGhqC1hAzEANMeegQVG01kMwSvOX2m3XOwUiR9PotBpCvmeCNfEOYucmTgpl++8j13wqt8KvXlg5SV35UK7ak/TSeJ/cRu8O0U2E3fpFAabvA4uShieiZcdWrJ8DCi0irb+E3NZE4TIopAQRL89Du+FXubH5e9oKdt4GGXNO85X2aZE7IBPY6isXvUDlNsk6ciTYTTYjEb8jz/eITBdTI684KEidjXKn8f1DGXRFsmQ6YVfVgxNM9uc2KH5hJ/vbyHd/r/fGnrKfBI+1kQok09DCQQAy/0Ex3EKWd1hz+XOW18YHL3QB6hQOKVWBNNxuwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqqMof2duYqqHENJt6n289KYKJ+n1ZwiwKXxOsdEXd8=;
 b=AArRVj2HvGJbQSzJSpvUe3qCoZzGJe+jf+PZ0DXCUjnRwfczJrhcbvuLfbkRgerN8+Zixu/F3CcCZ7l2fQxFjCdHFi/xZuV1iFL+auyLPdRH0EA8gxNukt1vbNMntwuQXVowgZ1Y9ABtCGl2Itgezj9v4Dj8ZxzSyPhNGKDeqd3CVOyOqobXMdPLi4rci8OE6TaweiN0n5Hlaj5LMFZnBemXNFwDk+LTNuzFcPn8ymtYHHnJIZCuwc6GLS6cbABJEMovjEZAsFjry1C3WBRAwnrGna+Wc2pBaZ4MrOuJSpbUwxFwTK0I5GQgIKhBV7Zg5WLuTMfgvVed23FKlORHaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqqMof2duYqqHENJt6n289KYKJ+n1ZwiwKXxOsdEXd8=;
 b=cONv0/lsKYqXWc22PhOfdMcwOci8sl9pvqkh2Tq+ZyKizPhA7+GYuyc5bwc7GwogSX5RxzkBHLzcuv3WrsakLRFD12Neg+rRTodyVsb2Q3YYJLC+rvVxu2cnoi1G9kv4N4G3FCvAWMziqvndnBfejP0hNJunvjAeispRi4xfk3Ub63tvgjRq/7SW0rxzLp70iGhextbMJFWmg11vqIQ61fEWgaWzFL2dPdWWzs2r30S4y8b+ENaJuPsG6IDTFfKn84ISOGRjGwMVW1341IoKIdADlttev22yevJZ27EihaMWPmPBkHRHNV7+yYEU9mjvMnhhjYXdq2fhmMjSk/v3hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Thu, 26 Feb
 2026 11:47:13 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 11:47:13 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 26 Feb 2026 20:45:40 +0900
Subject: [PATCH v3 8/9] gpu: nova-core: gsp: support large RPCs via
 continuation record
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-cmdq-continuation-v3-8-572ab9916766@nvidia.com>
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
X-ClientProxiedBy: TYWP286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::13) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dade729-5f34-4549-c659-08de752cc822
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: UOrjHZ/vx7sX4KVyuGo8dLFzHmpicRn9YxUGJMDKJnucWM5jqJKcioQIxuRGaWRC8Q6XnnEJ3UJ2znIwqadOgNcZ2MQHflWaXNNFgyJPWzVK+YCZH3pA5k/oB8I/W1FBVX+SayemoxY0tjxjm07XzFxBDjpdK2TIDd60ztYW32JdUWefvUK5CCZ+uxebLL3gupMy1v7LQtHuOeZHS3HMvBeILoxFh1yGSs422/nYzr/O/8V3Fkrtq0/2g2whKEvPy5+nvd8BVOMWsOuzLiv8IP14+uIrOLF6Xzdh1ISg81UQTZaXRYlCbcm1dFukFQN+oyol8x26kRxDk3ta9zVcoHvjWa/pgoTER5plJDJovYVLFcUzBDWylsna8vgNUjpQ4nWFCQOxwtnCyQH+0To6IDJe4SIY2CuBLsq6NiNoIDXpiZtKas7cbcmfUJ/tm2jVGpbU3xXod7lRdP7MNxoSD8c9gnoRcWBVANynx0K5E0DlZc3FYkdllDmdc21+BUdyWvfpFuFvaS9Wom+29IkeL5tA7YUtXJT68UxpihPruMKzzikYbjez1oiP90qYu4E4bwZzC3oC7ctqX+ThkFGD6nlrgWhXAggp18IR6S5/MBXj5rKV7icqJDs5S3umJkktqKejMjKdvuKHBSMPiN1GsiMKxgwym6NCBfoJah8Xr7hGqw3DLrtDDau4yUJfMz4T0RqsPj8ixk+s1uOQ/ab6ssEdyVv5TNVzXjJJ83+RdCAW62KIYe8aF3TegZiwhz2cSHGEpU/MInfskOtxkj/LnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1BhUW1EOEpUS1lNSGZOUW52TnNoRkg4OS9ORmsyaGJkYzF2NE5JclAzWXp4?=
 =?utf-8?B?MmhEckdWZnZKS1JJWXlXUEY4K05ZY3diMnVSNlRKOUZuRVo3eVNOR2wvSlhV?=
 =?utf-8?B?QnRWVzZLbHZCZWlwSEN3RjdVaUp6Nm41VE0zRlk3RGQvbWEzUmxFaGhHSTVR?=
 =?utf-8?B?RDQxUGFuT2QvSkNsOWhyMU5ta0J1dkcvN21RUUtKOTRwbHVSaXBENGRJS1RQ?=
 =?utf-8?B?dWdzdUU2dkZYcFptWHFkMm5OTFlPYjVYcjhjNTNMYnl3Q3phM3RqWXRaZVBi?=
 =?utf-8?B?Z0VnekZ3cHowNFhCZmpHc3NsN0s2cDI0cW5xU0xVU0dKYUFwQ3liWUZReUZv?=
 =?utf-8?B?ZTFiREo0cXZNM3hxZzNOK041U0U5VXRvazBrcTNiTVMrM0NqNXlMd1RiY09C?=
 =?utf-8?B?WVNwOEVpOFRrNWt0M3VvekN4N3QzdnVlcDlLTGR0cXYwMHlLME5CamZwTFlK?=
 =?utf-8?B?S0Z6MDlyUmN2QlJoTTl3TElRQkFnY0FkTlVUajk3WE9pMTVIanRLY0VmRXBi?=
 =?utf-8?B?eDFNdTZsZlVHUUZPenVBb050QTRwbDhKUlBOQUpydkJYbVV5dGZ6dUx5Y0pQ?=
 =?utf-8?B?OEdrVWM2dXNHcE4xcTR6TnlwbWVQQW8xNWpGV3cxcFZsb2dpZEoxQ1d1UmpS?=
 =?utf-8?B?ODBpa0lEcFVOQnAzcHIxZVN4STJKbEhjT1ZZTXBBVkVaYmJEK1p6RFNML29K?=
 =?utf-8?B?QXk0TkJ1Rk1mMjc4TVFtUnA5S1VOcHdESzZWcnNyL0tPK2t4ZEFjSG9KQ0Q1?=
 =?utf-8?B?VU9GUXRmTHpwR0VvVC8vRmZvNlF1dDZUM3BneVZXOW9nYkp5dlpGYTA3bklr?=
 =?utf-8?B?Y1JXaVdEVVF6VjRJVjExbitiUVZZSURRdTgvb2xYN0xGbDBmZU1YMEx2WDFh?=
 =?utf-8?B?NHk0dERoNHptSmNHNHI4cFFEOVhCNmh6ZWZYRXNtWk9HaDFsRmRETzFaOW4v?=
 =?utf-8?B?Y25pN3doMFRjTGpQMThOTTZnaFBXRS9mV2RDcXhuQ0pXT1pQNFRtVzhFSnZv?=
 =?utf-8?B?b2UzL1V5VXIrWmQ1aWQxcTFRYkE4SzZRc1QrV1NTaTAvK0NjQ3dNZkdSdGY1?=
 =?utf-8?B?SVJtSklXWGhGVzlCRU5IeXE1VzZRK0trMFZVbmFpVTdPalFuakd6ejhWT3cv?=
 =?utf-8?B?aXA5OXJtMXBVMmRORHBvb2lJZG9VZWZRcnpnYTV4Sk5zZFgrbHllSlNIbDUz?=
 =?utf-8?B?dENxTDBFSXN0L0prc2JVZW11cHBhK3FocG1FdzUrWHRRM1JPbmM0Ym5hUWtr?=
 =?utf-8?B?cUFwbHo3SEJLSUtrMkRCN05QSGJab3ROVmsyMEV6eXp2eEhUUjFDSG5qMHpJ?=
 =?utf-8?B?N2t0WEMwKzd1TTVhVENqNzFKdEVJbmsxUkh0UkN4QThxTmxCUThpaFdLS3hX?=
 =?utf-8?B?dmtrTkF4VzA3T1RhZEZhQ0U4cVNGZkhuQmhtVE5wWC82VThOUzR1dDRzQVpO?=
 =?utf-8?B?TXA1di94dGtwbHB0T3M1eGpveUtMcEQvUkxXYXpUcEhQa3FucUJxY0xaajg5?=
 =?utf-8?B?QUFtdVJYTTdsYVNhM0RKV3ZQU2dVa013VndIWDZGem9iM0RacEJtMHY3eHNE?=
 =?utf-8?B?TkhxdVFWWnBWNzBhVUJ4WmdrMjErM1hSZUxybjFrV1N4SXdPazVWc2xZV1RY?=
 =?utf-8?B?WlFLSEloM3pVSjVsVFhsRStXL1VBbU1nTHRDem44YlRkYUZLSjBkWTBXbHk4?=
 =?utf-8?B?bzYybmFJQllkMHJNRTU2eDlySWRtbWUxZ2ZmWEtNTnlES0x4cGNjcHIvY1p1?=
 =?utf-8?B?UG9XWXdTYXdSZ2ZyYS9nQnNWUTQ5ZnBwNWVCVlBEMFo3WThlem1kNUtZYUVM?=
 =?utf-8?B?U2VxN1p6Vit5eUp2RmJRNFhKd3I0M0RrWjM1Z1lyMmgwTG1QZ1cyL2ZlZWlU?=
 =?utf-8?B?SmJSWWVhd1VMVVNJQzBIQ1pJeDgrNlB4dWYzdFBoZ2pwQTBjd29BaW9PMkkw?=
 =?utf-8?B?UjYzamV3allya0xBTURHOVgvTlFJL3B0Wk5RWWJUZUpKcnp5UVRHM3dDRzBn?=
 =?utf-8?B?OGVoNS9kR1BWR091NzhxK004N0hld3FWS01PYzl0R3l5ZlY2dVJFcW5NcDhq?=
 =?utf-8?B?bnI5azY4KzBqY0VxUUJZbElDaDZCTXJQN0NBdjF6NmpyaUtPMkNIVzNZVFZr?=
 =?utf-8?B?K3pNL2VJSzJiTGVQL1E2clUrQUVUYzF6M0FyTWxWOElYNHRYeGVWK0NjT3ZD?=
 =?utf-8?B?ZldRdXIrejNHMjNyQm55YUJUZTR4VTB6ZXNzRlI2Z2pZOHU0UlpNTlI4OG5V?=
 =?utf-8?B?KzJ6dGV4RE5hbzB2OVVvd0p1OWZMcmQ2WGpNTThVWWlwci9QNHdhZEdjLzFC?=
 =?utf-8?B?SlBJU1lITTFKMTZpTmlaRHFVN2I1ajRQVDV2V3Y3TXM1NHhwRjVqR0hmd3hY?=
 =?utf-8?Q?fcndBckQQC0li67z++SjqVvWYvH4X+ItPMIoDypOV4Uvb?=
X-MS-Exchange-AntiSpam-MessageData-1: gYYSb/7v3jhu7Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dade729-5f34-4549-c659-08de752cc822
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:47:13.1934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CzxWu3zJxXjgLhR6a/oW1Pbqi1NVCf1F7hZNcKc1MrupRb7qnlKABQ4qXFlJArPPFpt2HOtWoR1AmpPRuQp1RA==
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,self.data:url]
X-Rspamd-Queue-Id: 671971A54EC
X-Rspamd-Action: no action

Splits large RPCs if necessary and sends the remaining parts using
continuation records. RPCs that do not need continuation records
continue to write directly into the command buffer. Ones that do write
into a staging buffer first, so there is one copy.

Continuation record for receive is not necessary to support at the
moment because those replies do not need to be read and are currently
drained by retrying `receive_msg` on ERANGE.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs     |  43 +++++++++-
 drivers/gpu/nova-core/gsp/commands.rs | 144 +++++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw.rs       |   4 +
 3 files changed, 187 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 4a663a5b3437..d68b93ddf7cc 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -28,6 +28,10 @@
 use crate::{
     driver::Bar0,
     gsp::{
+        commands::{
+            ContinuationRecord,
+            SplitState, //
+        },
         fw::{
             GspMsgElement,
             MsgFunction,
@@ -452,7 +456,7 @@ struct GspMessage<'a> {
 
 /// Computes the total size of the command (including its variable-length payload) without the
 /// [`GspMsgElement`] header.
-fn command_size<M>(command: &M) -> usize
+pub(crate) fn command_size<M>(command: &M) -> usize
 where
     M: CommandToGsp,
 {
@@ -520,7 +524,7 @@ fn notify_gsp(bar: &Bar0) {
             .write(bar);
     }
 
-    /// Sends `command` to the GSP.
+    /// Sends `command` to the GSP, without splitting it.
     ///
     /// # Errors
     ///
@@ -529,7 +533,7 @@ fn notify_gsp(bar: &Bar0) {
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     where
         M: CommandToGsp,
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
@@ -588,6 +592,39 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         Ok(())
     }
 
+    /// Sends `command` to the GSP.
+    ///
+    /// The command may be split into multiple messages if it is large.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command initializers are propagated as-is.
+    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    where
+        M: CommandToGsp,
+        Error: From<M::InitError>,
+    {
+        let mut state = SplitState::new(&command)?;
+
+        self.send_single_command(bar, state.command(command))?;
+
+        while let Some(continuation) = state.next_continuation_record() {
+            dev_dbg!(
+                &self.dev,
+                "GSP RPC: send continuation: size=0x{:x}\n",
+                command_size(&continuation),
+            );
+            // Turbofish needed because the compiler cannot infer M here.
+            self.send_single_command::<ContinuationRecord<'_>>(bar, continuation)?;
+        }
+
+        Ok(())
+    }
+
     /// Wait for a message to become available on the message queue.
     ///
     /// This works purely at the transport layer and does not interpret or validate the message
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 8f270eca33be..6ffd0b9cbf05 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -4,6 +4,7 @@
     array,
     convert::Infallible,
     ffi::FromBytesUntilNulError,
+    marker::PhantomData,
     str::Utf8Error, //
 };
 
@@ -22,13 +23,16 @@
     driver::Bar0,
     gsp::{
         cmdq::{
+            command_size,
             Cmdq,
             CommandToGsp,
             MessageFromGsp, //
         },
         fw::{
             commands::*,
-            MsgFunction, //
+            GspMsgElement,
+            MsgFunction,
+            GSP_MSG_QUEUE_ELEMENT_SIZE_MAX, //
         },
     },
     sbuffer::SBufferIter,
@@ -242,3 +246,141 @@ pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GetGspStaticIn
         }
     }
 }
+
+/// The `ContinuationRecord` command.
+pub(crate) struct ContinuationRecord<'a> {
+    data: &'a [u8],
+}
+
+impl<'a> ContinuationRecord<'a> {
+    /// Creates a new `ContinuationRecord` command with the given data.
+    pub(crate) fn new(data: &'a [u8]) -> Self {
+        Self { data }
+    }
+}
+
+impl<'a> CommandToGsp for ContinuationRecord<'a> {
+    const FUNCTION: MsgFunction = MsgFunction::ContinuationRecord;
+    type Command = ();
+    type InitError = Infallible;
+
+    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+        <()>::init_zeroed()
+    }
+
+    fn variable_payload_len(&self) -> usize {
+        self.data.len()
+    }
+
+    fn init_variable_payload(
+        &self,
+        dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+    ) -> Result {
+        dst.write_all(self.data)
+    }
+}
+
+/// Wrapper that splits a command across continuation records if needed.
+pub(crate) struct SplitState<C: CommandToGsp> {
+    state: Option<(KVVec<u8>, usize)>,
+    _phantom: PhantomData<C>,
+}
+
+impl<C: CommandToGsp> SplitState<C> {
+    /// Maximum command size that fits in a single queue element.
+    const MAX_CMD_SIZE: usize = GSP_MSG_QUEUE_ELEMENT_SIZE_MAX - size_of::<GspMsgElement>();
+
+    /// Maximum size of the variable payload that can be sent in the main command.
+    const MAX_FIRST_PAYLOAD_SIZE: usize = Self::MAX_CMD_SIZE - size_of::<C::Command>();
+
+    /// Creates a new `SplitState` for the given command.
+    ///
+    /// If the command is too large, it will be split into a main command and some number of
+    /// continuation records.
+    pub(crate) fn new(inner: &C) -> Result<Self> {
+        if command_size(inner) > Self::MAX_CMD_SIZE {
+            let mut staging =
+                KVVec::<u8>::from_elem(0u8, inner.variable_payload_len(), GFP_KERNEL)?;
+            let mut sbuffer = SBufferIter::new_writer([staging.as_mut_slice(), &mut []]);
+            inner.init_variable_payload(&mut sbuffer)?;
+            if !sbuffer.is_empty() {
+                return Err(EIO);
+            }
+            drop(sbuffer);
+
+            Ok(Self {
+                state: Some((staging, Self::MAX_FIRST_PAYLOAD_SIZE)),
+                _phantom: PhantomData,
+            })
+        } else {
+            Ok(Self {
+                state: None,
+                _phantom: PhantomData,
+            })
+        }
+    }
+
+    /// Returns the main command.
+    pub(crate) fn command(&self, inner: C) -> SplitCommand<'_, C> {
+        if let Some((staging, _)) = &self.state {
+            SplitCommand::Split(inner, staging)
+        } else {
+            SplitCommand::Single(inner)
+        }
+    }
+
+    /// Returns the next continuation record, or `None` if there are no more.
+    pub(crate) fn next_continuation_record(&mut self) -> Option<ContinuationRecord<'_>> {
+        let (staging, offset) = self.state.as_mut()?;
+
+        let remaining = staging.len() - *offset;
+        if remaining > 0 {
+            let chunk_size = remaining.min(Self::MAX_CMD_SIZE);
+            let record = ContinuationRecord::new(&staging[*offset..(*offset + chunk_size)]);
+            *offset += chunk_size;
+            Some(record)
+        } else {
+            None
+        }
+    }
+}
+
+/// Wrapper enum that represents either a single command or a split command with its staging buffer.
+pub(crate) enum SplitCommand<'a, C: CommandToGsp> {
+    /// A command that fits in a single queue element.
+    Single(C),
+    /// A command split across continuation records, with its full payload in a staging buffer.
+    Split(C, &'a [u8]),
+}
+
+impl<'a, C: CommandToGsp> CommandToGsp for SplitCommand<'a, C> {
+    const FUNCTION: MsgFunction = C::FUNCTION;
+    type Command = C::Command;
+    type InitError = C::InitError;
+
+    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+        match self {
+            SplitCommand::Single(cmd) => cmd.init(),
+            SplitCommand::Split(cmd, _) => cmd.init(),
+        }
+    }
+
+    fn variable_payload_len(&self) -> usize {
+        match self {
+            SplitCommand::Single(cmd) => cmd.variable_payload_len(),
+            SplitCommand::Split(_, _) => SplitState::<C>::MAX_FIRST_PAYLOAD_SIZE,
+        }
+    }
+
+    fn init_variable_payload(
+        &self,
+        dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+    ) -> Result {
+        match self {
+            SplitCommand::Single(cmd) => cmd.init_variable_payload(dst),
+            SplitCommand::Split(_, staging) => {
+                dst.write_all(&staging[..self.variable_payload_len()])
+            }
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 6005362450cb..25fca1f6db2c 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -202,6 +202,7 @@ pub(crate) enum MsgFunction {
     AllocObject = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT,
     AllocRoot = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
     BindCtxDma = bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
+    ContinuationRecord = bindings::NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD,
     Free = bindings::NV_VGPU_MSG_FUNCTION_FREE,
     GetGspStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO,
     GetStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
@@ -239,6 +240,9 @@ fn try_from(value: u32) -> Result<MsgFunction> {
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT => Ok(MsgFunction::AllocObject),
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT => Ok(MsgFunction::AllocRoot),
             bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA => Ok(MsgFunction::BindCtxDma),
+            bindings::NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD => {
+                Ok(MsgFunction::ContinuationRecord)
+            }
             bindings::NV_VGPU_MSG_FUNCTION_FREE => Ok(MsgFunction::Free),
             bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO => Ok(MsgFunction::GetGspStaticInfo),
             bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO => Ok(MsgFunction::GetStaticInfo),

-- 
2.53.0

