Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFoCElCdp2nTigAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 03:47:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D291FA020
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 03:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144D310E946;
	Wed,  4 Mar 2026 02:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="r52es7LY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010060.outbound.protection.outlook.com [52.101.56.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D0110E0D3;
 Wed,  4 Mar 2026 02:47:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JeftWD+KwTlFM3hwTnRAHA57j4qJrWG7X9SkH8EtZZZd2PBAyclC7ehzAaR+RiW9iX/ECuH/McOkj+qh4kVk7vcsj/QpBjDekOlmebtHz4OPCVmRulP2lEpAc1CemD6G9ASPJaUpGdNMAKodrBzdcMnD49qwNOzIq16vbrdDdNKc6wzGx7+CpD17DRa5WbAPcV5PqyOyPzO9kxDNIMGXKGSiFfdsNOFkFs5klgSw47IMRJqwfqWxjW2FLPKbbFPSoPNoo/sZzlI2zevnOGvZoW+Pzwcyp3ER1o6VJ/MOsjqjblPcxqE5k3M4Zs31r7KkuJWqRlaqrINkZw3OlUSQuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G41l9H8siiDcMWJXq2NBgNgtTx5VUhviqOjGRbG+334=;
 b=pPyPXvodVS946GplC51K5JEjIT4xFtyiICzROgxgOVd+qvvKb2griuYQbVmzTWlnFSzUig05lmD5SbXubNiygkvK0ftD0kW2jkNdEWKfI8SqfuX6vpILwnzFEuNrCMCxoajGsBUuwf1i9b053tXIFVvx59jdxjmeUX9vb1IgeMcLdsDITMQbVNM/rwn8+FH9R60LH1qHf9c1bOkAsyXBMwoT+5Bg/FwkidSKc29MRVubK5OQF9dEQHP+swlzwa0/cx0fK1s+5LkhhMPuaxPvrOS9wXBtp8fpGVR/s/8D9o4WLvYUnIlR7QXDyVoyZno/1Zj3TxooNl0uDFo4GfHuJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G41l9H8siiDcMWJXq2NBgNgtTx5VUhviqOjGRbG+334=;
 b=r52es7LY/UFgomUGjG8pdkP0oUW7ZhL20QgsppeExBUd/UCJNZ8gf+MdoXmiW62/EOUm48gghUYMusGGuTQxuTJ58PU11H9GCntk4wu2lnoQRjsoK/2yTA50LjaRlzRnsR5YHq/9L0f7nW423+qbnsFXAXhRGJYkfUWTH+Fg5jzX5tI+vop1m2LVaXHbYd54RTH7Y4w0OFXA+x63f94zXBSv5RtJksg99m6sK9I5DfNApoFcBauBkfJoZbNlRTYqvwrDv1F48nBMFNH/1K4bLKdAAdrJ1afalBY2etCNK54TDgtOB6+grIwSVZtPoOsgOb5EqUa/s1ULV4J1RfdrEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH1PR12MB9574.namprd12.prod.outlook.com (2603:10b6:610:2ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Wed, 4 Mar
 2026 02:47:27 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 02:47:27 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 04 Mar 2026 11:46:37 +0900
Subject: [PATCH v3 2/5] gpu: nova-core: gsp: add `RECEIVE_TIMEOUT` constant
 for command queue
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-cmdq-locking-v3-2-a6314b708850@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0321.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::14) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH1PR12MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a6e395-0edd-4da8-44e5-08de79985b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: YW51JaGkOVjLi1RcZX7NVHUxp42zXLafTnyLLeaS8wf+jgY3PwTcL4pK3gxnbJfmpboIfkMy8Soy6+xR2R6teEnz3J47mq/owFqQqM76pOoO8uAzlQFOWIEMzsJzae+TLOgq0DXig6cRkBaVLCmdTE+suEfWtRhxAdfASUbnPBWZ/kZJZMrscg9rXcqYsmVCcN/bdrDU2M1LTO0a4m/Ot/aNyhGuPIOWfa8BK3xRVcIwy/OW3+07MT8IPsxv9CmJWhwDuC+seulyF817LGBCTM2MRpSWkzrtu5AjE2RwsNlAsNum3vfUpZpUieC16Aeibv/UWwTrm3WolKCLTM6UXINjrIBtnt5j+bsPaUj+4xvS+a6/8yGpeQuNGahDZwWktoa589pVO6q/IAvaaQzO5SxCPTWqzM8DMpZ419FUCHJY2Sdxgit/P2PD/SxQA2atgze28vpBYeA0YcNmBvPb4J8XKO5YEISw227ZsI8hVkN/rzihIUBgu1A5MaPcRYdXDFz61PvQcnMHemi1MJpVftYNKLyU1lUXoZK0vBvOpa4CfPzYASfe5qCH6QJlBAWtZSMFiVpISxzakLfHmRlyInOSMio+VUoE3L9bv0jC8altW6tYoAdOeLSvQZQGhq4i9+Ug2GjAKPzwAd+kLcmmpWUw2cfeiGUDhP/68r95Rlz0Y0hTkf9EIZMs28tumsSCG6QSagSWHSp/+0cb89MO+yIYVIIrmg9OT+f69DyX4v0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHdyUEF5c2RodFIyU25ISzlDVlMyM2IxUTVtbGhrdGduZEFoTUJVWThWd0t5?=
 =?utf-8?B?Z2NaWjd5Zml1VlltQk1NUlpOYkJieHdhQ0pncGp5U1lURURybXNlaGRzSmJ1?=
 =?utf-8?B?TjhOMXJkNFN0RGg3bXpUcTkrKzFhb3RCdDNJTklWeDQyY2h5L2lCZk55M1lR?=
 =?utf-8?B?ZWhQd01CczJVVmZTVWNEa2NrQ3h4WEY5VW8wMmp3NWxOVm9TNUJTc1BkVmI4?=
 =?utf-8?B?NzJoRTV6dHpBY1RPMzBYRGhFdjYzcWQ4ZHk3U3AydW5KTWFlMlZQb1ErOXJQ?=
 =?utf-8?B?Y3kzZVQwMkc5dTBhYWV0QTN3VTdoMk5tRlBIYXZNL3kvVU5TTWhQZFJSRWVZ?=
 =?utf-8?B?NTF1ZzNNMEVPY25xMzRFbUFZVGd3VWx1MHJ4cHd3UHA3cC9QZmVzaTVKN1pl?=
 =?utf-8?B?MGYyZkFCTTZWd0poR2xyZUlqdmNlMmRzejhiVzk5cnE3QUF6QWx5Vy94d1lB?=
 =?utf-8?B?R0Y0WFpXMmtwUDZFSk55Uk1GeHNIZGdwSm9iWVh3ZkpHNkdYRTR2QkJWL2FC?=
 =?utf-8?B?UVMrcFdHTEZYa0tMWWtEOE53d1lXeWh6Z2hXVzlLbGwxRnFJYkdFTnNsNlZB?=
 =?utf-8?B?MGF5a2p3V0oycm9OWERYQTg2M2t5a25yVWRLelZaeW1sOFJpdnZHYmZMalcw?=
 =?utf-8?B?dkk5WUE1b2pYeFZpTFJRdldiaDRwSEI2Mlk3UFg2dC8vamVzQXpZVWZPdjhB?=
 =?utf-8?B?Z3B6YjNnSWI0YkkvU3g0WFp4T1A0L1RHSzM0TGVCcnluT2RpZWVtL1ord0Fa?=
 =?utf-8?B?MUhWVUJqejBxRFpwVGVndkRUdXBXVUdjT0tlakdjN2doRUtkMTdGeU9OdmtH?=
 =?utf-8?B?YkpKSTlESmE1YXAvc21LcWI3MzMxOXB3N3A5YzZIemVBMGlVekQ2dGNIV2tK?=
 =?utf-8?B?c1lTODJTVzhvNFBQdURYRURyQVQ4b3dvUlpvUlRnZDAxUmFnNDRhdVJHNDlI?=
 =?utf-8?B?Zzh1cU1HSmxHNVgyYjA4V2RJWlU4S0phUmM3RjRCUENyMWNhMWtXUUowQXRQ?=
 =?utf-8?B?RjliMUJscTVNS2FKaXBoMWZBRU9XaklDc2dUeWNEQ3lpKyt4Q1lEVUR3dU1x?=
 =?utf-8?B?aGFNM0FDTWMxbGJjRS9QbzlXQnp1YUpzRkdkUCtRWVBxZHVWWlNhSkUrTm5V?=
 =?utf-8?B?SWtYdkZPYnJ2WS9McVFpZnIzQnVXa01RSWUwaEJjVk1vS3A0aVlKaFhkSm9k?=
 =?utf-8?B?dXl3NXhOejU0eGY2c1JraW0vZm92N1licXFWc3h5VjVMU2U5NjY1K3g3N20v?=
 =?utf-8?B?azAwN0ZGSkU1b2daNzN4U2JSQng5NVZJdE15eldKdWFwWldJNlZqT254SmZk?=
 =?utf-8?B?ZWlrVnVNczdJOFVkK0ErMFpFT3pOaE5hUnNRYWdtcnVGR2g2dDZ6WUV2bTRn?=
 =?utf-8?B?NytpVWJ4TkllVm55NkJFMXFVSWVKZU1kdDZMU1NwSVJTQWlySDdKcVg3eTBS?=
 =?utf-8?B?RWE0V0lFYWEvSGQyaFRJZjUwTzFMSUlCanFSY1U3VzUwbWZVZ3I2Z1pEUXhG?=
 =?utf-8?B?d215VU5mVDQzdHVXNzFBN0orY0FvNDFxMFYwK0JMbTZvUHRRaFdjU01ZU2Fk?=
 =?utf-8?B?dVhqTkVYQm00Wmxreno0ZzN2TmQ4LzBQWnlLbzJRZXExUy9GNFNPcmVNd1By?=
 =?utf-8?B?QU1pUkRpUC9DN1ZoY1VRNHZlTElqV2FPcW5kK1dXNWtnRGljdkxmSHBrYmxU?=
 =?utf-8?B?dWxtSlJhUmNLUVFHUEw3MW1QTWVHZzNSWlRYTDRDSzRBTDJJb1NZZlROaXk3?=
 =?utf-8?B?eSt3V250dE1HeFFsSlpzMndLMHFzTTNaUmhLUXJqd2hKT3I1Y1F3WUE2a3B4?=
 =?utf-8?B?Zk1ta0lBaGlPcXZJUTgxM3hJTVNiZldSeW5yOGNzdGphM1IwNmx1bVlzMitE?=
 =?utf-8?B?TnBNSVpCZkVoRkRYSEV0NmlPN3lRcGJDVE52TDVVNUVjOE13elV0SGtGaDR0?=
 =?utf-8?B?L3ZwVXBwYzV4bTF2REZSb3FxWDh2dGlsbWVsU2tEdGdYbmVObm41Zm5IbzlU?=
 =?utf-8?B?ZUlyTFovbVJJSDdNTVFiNDVOcUZOdHNPMFNoRHErSWpVZDYzUUlPU1Y1VlZK?=
 =?utf-8?B?KzBVd1EwbW1jbVRRL3ZzeHdCd3diVVJKaEM1c0JSM01sck9DV2ZPQkRXckNn?=
 =?utf-8?B?MnA0RytmMFczdXUrUVVHUjltbEJJcHpxU0ZxMTNVTG1UZnQ5Yk9iMmZSdW96?=
 =?utf-8?B?NTljL3dQVWNQaER5NmdCMnh1V00xbEE3Y3NwbkE2bGFTK21OeG9nQWlYSjln?=
 =?utf-8?B?QmxOaVZZdXN5Q1VsM05hdUs3MlpONTF3QUdhbXpickFGeEtJa1VrODNjTmpG?=
 =?utf-8?B?cmNMbkpuNGVMMVBMbVoyekRUa05DY0RTU25GQmRGbnd4UVpPdjMwRk81N2xO?=
 =?utf-8?Q?Ak6eQT0wac8tbnFhmmRY1JjFHCPziUeyyiDw3XrAfzi8P?=
X-MS-Exchange-AntiSpam-MessageData-1: Wkf5KlSRxFLoUA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a6e395-0edd-4da8-44e5-08de79985b7c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 02:47:21.1075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGKXl9MgZde4XGM1p+kWHsXNiP+/ymtSx7aVllAyn2y8uK3bSglfX5cISlzeEEK5eCjXo3pu8+F7duAJJI8U1Q==
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
X-Rspamd-Queue-Id: F0D291FA020
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

Remove magic numbers and add a default timeout for callers to use.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs      | 3 +++
 drivers/gpu/nova-core/gsp/commands.rs  | 5 ++---
 drivers/gpu/nova-core/gsp/sequencer.rs | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 4829830b6921..0192c85ddd75 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -496,6 +496,9 @@ impl Cmdq {
     /// Timeout for waiting for space on the command queue.
     const ALLOCATE_TIMEOUT: Delta = Delta::from_secs(1);
 
+    /// Default timeout for receiving a message from the GSP.
+    pub(super) const RECEIVE_TIMEOUT: Delta = Delta::from_secs(10);
+
     /// Creates a new command queue for `dev`.
     pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
         let gsp_mem = DmaGspMem::new(dev)?;
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 8f270eca33be..88df117ba575 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -11,7 +11,6 @@
     device,
     pci,
     prelude::*,
-    time::Delta,
     transmute::{
         AsBytes,
         FromBytes, //
@@ -165,7 +164,7 @@ fn read(
 /// Waits for GSP initialization to complete.
 pub(crate) fn wait_gsp_init_done(cmdq: &mut Cmdq) -> Result {
     loop {
-        match cmdq.receive_msg::<GspInitDone>(Delta::from_secs(10)) {
+        match cmdq.receive_msg::<GspInitDone>(Cmdq::RECEIVE_TIMEOUT) {
             Ok(_) => break Ok(()),
             Err(ERANGE) => continue,
             Err(e) => break Err(e),
@@ -235,7 +234,7 @@ pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GetGspStaticIn
     cmdq.send_command(bar, GetGspStaticInfo)?;
 
     loop {
-        match cmdq.receive_msg::<GetGspStaticInfoReply>(Delta::from_secs(5)) {
+        match cmdq.receive_msg::<GetGspStaticInfoReply>(Cmdq::RECEIVE_TIMEOUT) {
             Ok(info) => return Ok(info),
             Err(ERANGE) => continue,
             Err(e) => return Err(e),
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 0cfbedc47fcf..ce2b3bb05d22 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -358,7 +358,7 @@ pub(crate) struct GspSequencerParams<'a> {
 impl<'a> GspSequencer<'a> {
     pub(crate) fn run(cmdq: &mut Cmdq, params: GspSequencerParams<'a>) -> Result {
         let seq_info = loop {
-            match cmdq.receive_msg::<GspSequence>(Delta::from_secs(10)) {
+            match cmdq.receive_msg::<GspSequence>(Cmdq::RECEIVE_TIMEOUT) {
                 Ok(seq_info) => break seq_info,
                 Err(ERANGE) => continue,
                 Err(e) => return Err(e),

-- 
2.53.0

