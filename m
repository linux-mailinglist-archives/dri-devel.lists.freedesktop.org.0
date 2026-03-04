Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPzfCU+Op2nliAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 02:43:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2711F99ED
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 02:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81A910E91F;
	Wed,  4 Mar 2026 01:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gjy1/P8q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010042.outbound.protection.outlook.com
 [52.101.193.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5D710E91F;
 Wed,  4 Mar 2026 01:43:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IvopTLrFWnOLKAWwQSHMsUhAYh9WJHDOFtohGvYspL1c0kkZasXKrsZmf93YQ68fiipc3vGN4VwkQrrz1hXhtajEl+ut1ByiHQAJTlmYfSnW/ejTfJgD3QfLmHDEpJnPbejRODBIJdKwmdigDwoEcw6ZBWqA2c9GAp2iNq1ppOeolK+b24haCWTy9PeVxZ8gYsvRUepNOFUepDk1BkCeSGcm+nafFEWmmTpkRNYqjJ1hmt7dP2EEB7A/vqJjx7gch0Yq64kqEPqh3XRN20BVuFOw/T2zBf6s/aULXNZ3R0EY+Zx+/RrVyUb5ZFY3q/ylKwo50IP/6w4DM0dhrDpolw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09JJKqFn9GOscOUnlICYC29ywGwotSq5qtDvDNXBUa8=;
 b=VC/XNfb8tF6ChZBR58Ip+2amoADQXV5DqrQ1EjJKl9/2GGf0IVPxCJHCxqDUsv1v6vSXvhNx/hi2W5x9imROK2DIo9m8JzhphbMNqCd35BsJp5rvD+WiMWdybHjB4DrRRwAT+Lf+2JBHefOrlE2JzFE1JnlTqGve3smRtivGg0uyNwV7RBX9kEHGYrcgy3EsIANW7bla6oiCrEcemmzhPU7ppmy76FkJKI7qKU92gHgjnlTMFlYwF9hzFaQIOMLReyjqJaP4JXI72dfeRtDBMvY2H0jF0XbC5UhzpMBK6AZU5yoDSv1e5/65RhvOuZ3wdnWy26634DI78FSsACfkhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09JJKqFn9GOscOUnlICYC29ywGwotSq5qtDvDNXBUa8=;
 b=Gjy1/P8qmoa1SVVRyEPxVePkvobo11c/E7CHKBjbKkdATWrHwNvN2Zg6yqx1F8PuQ6hJQpVt4Cntxp8bFWNqiNivCnj8KvxwEfdKz3LApCB2Ts5TJLt6tDhDewrdWGgr/SGyaf4bTwLrYPeraz721wyzH3Bjg8r684fLhgNLoqSQGr86qDqbNsteOCWmvCsfUmk5Ut1oyHGhwfBE5SdnsctKYT95ztLM4uWeIp7f+pJtkshzOKOHtNSEabbIPRp3iniObeqK8+T4AFPzX3eK1kpXxSEa7wbqEYsAaBrsqKU7um9dHHnOVDCOjedhFuuE0wK9HPc9wC1hM80rf4bFpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BL3PR12MB6545.namprd12.prod.outlook.com (2603:10b6:208:38c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Wed, 4 Mar
 2026 01:43:36 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:43:36 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 04 Mar 2026 10:42:24 +0900
Subject: [PATCH v5 8/9] gpu: nova-core: gsp: support large RPCs via
 continuation record
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-cmdq-continuation-v5-8-3f19d759ed93@nvidia.com>
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
X-ClientProxiedBy: DM6PR07CA0128.namprd07.prod.outlook.com
 (2603:10b6:5:330::20) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BL3PR12MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 463fa7ce-9fa5-48b7-be25-08de798f737c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: DYXgVrHwyX/ZgGMKYEILDMy5ijQdFYtW/vpcKIIXVgJokjCJrTlMn/MrF33+42W1AXwVVDHmMHZqvE+cdwOaPT+ErG3+Chw50YDREby3v93YpwccMsDIOF8KVhRIzPEptDQzUnNuEqTcgNaj/SBWxx0qVzmqOOpZbLELI1z1IHDaaaTk/RVaFKINKT5ZVx+bntZ5yEeuZfE14FXb+NY3sHvaERlujJqhj1RluAZJvYTeOBRbe9gXCyuZahQD6y0SrloP8VJkfWRG+4eehnFxG3ulB+OYHK9/kWueGmkfia3bCfTeyGQ2SD8nL0QlVwsk3mxsUCsNSmw+iq/mVMBN/9Ydate1vypNhmID2iqPbJ/IS0BKNoLx6HAZpUC5TRKwZFynim+Gx1CpGf9efN6WCiXBgM1RTqDx2PncmXaHcD0J+Y+24nSPRBiSNyzJtTBRRyrsn+h3qePf645oylWrq+bculVuHklHIJ8kac6D0+5AQUV4O1RJS3/iKuI8X2I7/xeMTMKIIHEnvblb7AX/Sdv3MnYY000UFZaox8pz7ES/IzcaQw/PtqrKJTBdCC+Er/G86BcOfP8yd0NVUS7YsrUOCm/n2jMgnfVp3fWASQ1g2ldXTn/xAabQLQxmo5g2Ls51V8UaUe2IF5ZXLSnuKY5IWkSyWurTj/WdVOU7SN+9hjSEZMwZuRBaASuEbX95OAXjEN145uGiP6a/cYEKhDV2FnPuchTeDUeed8sY7oV8juTLb5V0r8HVNhuhgNAjkbxQV9C51zy71M0qWU+4rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXhKMm5aQzFQK1ozRllKT2JsM3M5N2VpWC9vQzZTVVkyNEs2UkRyZWNlMVBa?=
 =?utf-8?B?Sk5mbTZEdG9oQytnUFFyU3RxNjQyZ0R3eG9hWFFwajAzYUdPQ2o5ZW9WVlZV?=
 =?utf-8?B?WlhtVjJRalF3S3lPWTBZSzQzcDZpZ3JyeDVtN1BSNzlQOHFwUkZYY09LZ0NR?=
 =?utf-8?B?ckdOZlJRVkljNlgyTjNCY3FSa3JDZzhlSXdhZzdqZngvbnVTYTFUOW5oNGUr?=
 =?utf-8?B?dkxxaktPQ3JhN1hJM2RMU1RQYmVIMEU3Zk1HNXIxUDI1U1dqNUkxRUxRbjRE?=
 =?utf-8?B?aVp1Ri83VlViTXBKc3hrYTR3T09GSUpXUGhIZkJMWlRPMUtPSlFZSk1LMk1R?=
 =?utf-8?B?V2NrdHZLaUVnMTNORjBYRzNIUVVVVXU2cFZVQnY2d2hSTGRuN1U1Tm5lZi9V?=
 =?utf-8?B?S2o2Njc1NFN5Q0lzUWRHK3Y0VENiVmFVM3hDQVEyMWR6RkZSb3M0bmxFeGhZ?=
 =?utf-8?B?b2xXV0hrRDQ0UDllcjFSMUY3N3g4KytWU21lcFJaZlpHdlN4d0RCaE9SSFRw?=
 =?utf-8?B?aWFUaVlzUENZd0lmbjlKRHptOXA1clFZcGJXVHVmTnlmeXZvUnBHZWZRZVc2?=
 =?utf-8?B?S1k5dEFET0NMWmVWNmo4K0ZFOVUxV0VQdXZXQ3ZYZ3BvdGhhcTdLVUFOUXd2?=
 =?utf-8?B?aWJmWklFVURERDc0RGJTbTdrOHFtWXZ4ZktnWGNCZnlpKzUwbVR4bnhNNzdB?=
 =?utf-8?B?cHRLYUw0OTJmVUhXbTJxeWNkQjhjdTdKTWpBdm94cnNsRHZNWFM0TlpHTVFQ?=
 =?utf-8?B?dUg3M3NGMEZESUllWW11eXlydmo3WW9RaTA3M0RNREc3K3hqczZpNnhCQ3lM?=
 =?utf-8?B?aXArVGZEcjdQNU1sM0xZWXM3SmVYWlIybUtVUVdkVUJlL24xckRER0JVeG1q?=
 =?utf-8?B?eEhuTG5WU245MHZldnorM3IvVHBYZnJqb0tGT3VJVzV5dTJadnFEWHNBSmRT?=
 =?utf-8?B?UUlYOGkvbEVGbUVzNGpVRU9WRFJheUk4ZDExMTN6dm9RaWhwNU14MkNrby9l?=
 =?utf-8?B?RmVnZEJXYnJ0MmlDZHJDQUh3RlI1dHdSYnBpaVZlS0gxcnlLSlVMTWxZSVJH?=
 =?utf-8?B?YnY5NkJydjVhSUo4ZmliVjgrU1BiajlsVm1BZkI2VjJDSHQyT2srNXVNT2Zl?=
 =?utf-8?B?R2NzdDg3aVZqRDRIV3czVGsxZERmT3hjNnJhekVpY2V0UnN5N2ZsWVZUemly?=
 =?utf-8?B?UUJ5clpjZ3RtQSt6cmFiVDZRSXNvdE13M2h2cVMvQjREZW8xS2dOY096Tkdz?=
 =?utf-8?B?YTZKK0hzaTUvV2dod3hSYXR1WHhYdk1seWswOTV3dXVUcmVkT3NsdUtDaCtu?=
 =?utf-8?B?MS9SQ0dBblZhNks3S2FhaERBdWdFeE1NK2owSWhvbGZuV2hwTzhDR1h1K09V?=
 =?utf-8?B?Sk5iM3BSem5TNnY2SjNmQXJJZThTRmxMT2Y3cDhyM3h6WkhlMEpvTkZwbVh3?=
 =?utf-8?B?Q0liRCtkUUZUZjBHRjFGblRHQVkwUkVuN1NUNC9oampyRG9ISkZwd0lHdzA2?=
 =?utf-8?B?QlhOSHc3eU9aTkNNUG9kSEdoeTBWZUx0OGRuQnk4T0NpV3EybURib2syRFZj?=
 =?utf-8?B?Uy9FME56bkQxYW5SRkNSUkpmdi9lN2pIdGNNNUd0VTZmZzhRZ1B4QmRDOXg1?=
 =?utf-8?B?TnUrdURpTDdUOWo5NStYdWd6VzY5Tkx0OGoyaEExbGkrWWltT3c0Mk9Meitz?=
 =?utf-8?B?a1pDMHhqeW5ycE1URnc0TGFDdzlqL2x5SUNldXF6cjlEVGJzL0tqdVlNTnlF?=
 =?utf-8?B?Yk9jclo2YzZIY0h2ZDNGT3l6MlBnekl6aGdZM2VTOTdsdXMwQ3NhR1FXQ09Y?=
 =?utf-8?B?R05CMzN6eWl2bTFIR1A1M0VyTGN6Z2wvdlBPallzTzkxcFhvKzBUUkYrelJF?=
 =?utf-8?B?cTdpYVE5OXR6YThnSi9NTWZGZWlKeHdZeDdBZTFRT2k1aTVGSkp1SjRjVW16?=
 =?utf-8?B?Z01LWWwyaGlydFJRWmNTU2k5cDgyRHVQQ09PYitZamM1SzhlbTdGWlNESkNM?=
 =?utf-8?B?Q01mNmE1QlAyNHRDQW14Sk5GaFJSbU0xKy9iamh0TUxwTkgzSGIzdnpKbFRs?=
 =?utf-8?B?L2p0OHlyN3pMQjhLaUxsTXVKdVJFcUNmc2kwNG1DVXFSTk43b1RJQWVXVVp0?=
 =?utf-8?B?eS82OXlKL1lFMjNVZnZZZW94NEJzOUw3cFp4SDJhSWVROHozMjVWSm5zYkVl?=
 =?utf-8?B?NHg1ODYwNjUrNFJSbm95Wm9oNGVhdkQwcU9sTTZyZmp2a0MzancwbnNuVnZa?=
 =?utf-8?B?NC9qaHdxc29LVWxYcVM1RlZmaXAvUTVmaDJCZDJpM3dUdUVCVWJxd0E2Y21D?=
 =?utf-8?B?d3E0dXpja3VOc09GYTIyN2gxRk9QakY3bVplUGpGa2g0MHUyV1FJOGhFSTda?=
 =?utf-8?Q?/GEQQkeQO55RUXdwwIoRm891naNgQJlrOIjLSXNJdoIhY?=
X-MS-Exchange-AntiSpam-MessageData-1: z0zKFTp42qgFlw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 463fa7ce-9fa5-48b7-be25-08de798f737c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 01:43:36.0700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOBR9Rr66D9w3mCCkM3f6aboTnVK6msR3Ls+UssV7cBl0Q5JZLyN/y8F23QmmdmOj3t0N4gQAS1pXgJ9+fK4aA==
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
X-Rspamd-Queue-Id: 8E2711F99ED
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

Splits large RPCs if necessary and sends the remaining parts using
continuation records. RPCs that do not need continuation records
continue to write directly into the command buffer. Ones that do write
into a staging buffer first, so there is one copy.

Continuation record for receive is not necessary to support at the
moment because those replies do not need to be read and are currently
drained by retrying `receive_msg` on `ERANGE`.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs              |  42 ++++++-
 drivers/gpu/nova-core/gsp/cmdq/continuation.rs | 163 +++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs                |   4 +
 3 files changed, 207 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 3424be4e15f8..492e9489e808 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+mod continuation;
+
 use core::{
     mem,
     sync::atomic::{
@@ -25,6 +27,11 @@
     },
 };
 
+use continuation::{
+    ContinuationRecord,
+    SplitState, //
+};
+
 use crate::{
     driver::Bar0,
     gsp::{
@@ -520,7 +527,7 @@ fn notify_gsp(bar: &Bar0) {
             .write(bar);
     }
 
-    /// Sends `command` to the GSP.
+    /// Sends `command` to the GSP, without splitting it.
     ///
     /// # Errors
     ///
@@ -529,7 +536,7 @@ fn notify_gsp(bar: &Bar0) {
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     where
         M: CommandToGsp,
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
@@ -588,6 +595,37 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
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
+        match SplitState::new(command)? {
+            SplitState::Single(command) => self.send_single_command(bar, command),
+            SplitState::Split(command, mut continuations) => {
+                self.send_single_command(bar, command)?;
+
+                while let Some(continuation) = continuations.next() {
+                    // Turbofish needed because the compiler cannot infer M here.
+                    self.send_single_command::<ContinuationRecord<'_>>(bar, continuation)?;
+                }
+
+                Ok(())
+            }
+        }
+    }
+
     /// Wait for a message to become available on the message queue.
     ///
     /// This works purely at the transport layer and does not interpret or validate the message
diff --git a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
new file mode 100644
index 000000000000..3b83cdcbb39e
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for splitting large GSP commands across continuation records.
+
+use core::convert::Infallible;
+
+use kernel::prelude::*;
+
+use super::CommandToGsp;
+
+use crate::{
+    gsp::fw::{
+        GspMsgElement,
+        MsgFunction,
+        GSP_MSG_QUEUE_ELEMENT_SIZE_MAX, //
+    },
+    sbuffer::SBufferIter,
+};
+
+/// Maximum command size that fits in a single queue element.
+const MAX_CMD_SIZE: usize = GSP_MSG_QUEUE_ELEMENT_SIZE_MAX - size_of::<GspMsgElement>();
+
+/// Acts as an iterator over the continuation records for a split command.
+pub(super) struct ContinuationRecords {
+    payload: KVVec<u8>,
+    offset: usize,
+}
+
+impl ContinuationRecords {
+    /// Creates a new iterator over continuation records for the given payload.
+    fn new(payload: KVVec<u8>) -> Self {
+        Self { payload, offset: 0 }
+    }
+
+    /// Returns the next continuation record, or [`None`] if there are no more.
+    pub(super) fn next(&mut self) -> Option<ContinuationRecord<'_>> {
+        let remaining = self.payload.len() - self.offset;
+
+        if remaining > 0 {
+            let chunk_size = remaining.min(MAX_CMD_SIZE);
+            let record =
+                ContinuationRecord::new(&self.payload[self.offset..(self.offset + chunk_size)]);
+            self.offset += chunk_size;
+            Some(record)
+        } else {
+            None
+        }
+    }
+}
+
+/// The [`ContinuationRecord`] command.
+pub(super) struct ContinuationRecord<'a> {
+    data: &'a [u8],
+}
+
+impl<'a> ContinuationRecord<'a> {
+    /// Creates a new [`ContinuationRecord`] command with the given data.
+    fn new(data: &'a [u8]) -> Self {
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
+/// Whether a command needs to be split across continuation records or not.
+pub(super) enum SplitState<C: CommandToGsp> {
+    /// A command that fits in a single queue element.
+    Single(C),
+    /// A command split across continuation records.
+    Split(SplitCommand<C>, ContinuationRecords),
+}
+
+impl<C: CommandToGsp> SplitState<C> {
+    /// Maximum variable payload size that fits in the first command alongside the command header.
+    const MAX_FIRST_PAYLOAD: usize = MAX_CMD_SIZE - size_of::<C::Command>();
+
+    /// Creates a new [`SplitState`] for the given command.
+    ///
+    /// If the command is too large, it will be split into a main command and some number of
+    /// continuation records.
+    pub(super) fn new(command: C) -> Result<Self> {
+        let payload_len = command.variable_payload_len();
+
+        if command.size_in_bytes() > MAX_CMD_SIZE {
+            let mut command_payload =
+                KVVec::<u8>::from_elem(0u8, payload_len.min(Self::MAX_FIRST_PAYLOAD), GFP_KERNEL)?;
+            let mut continuation_payload =
+                KVVec::<u8>::from_elem(0u8, payload_len - command_payload.len(), GFP_KERNEL)?;
+            let mut sbuffer = SBufferIter::new_writer([
+                command_payload.as_mut_slice(),
+                continuation_payload.as_mut_slice(),
+            ]);
+
+            command.init_variable_payload(&mut sbuffer)?;
+            if !sbuffer.is_empty() {
+                return Err(EIO);
+            }
+            drop(sbuffer);
+
+            Ok(Self::Split(
+                SplitCommand::new(command, command_payload),
+                ContinuationRecords::new(continuation_payload),
+            ))
+        } else {
+            Ok(Self::Single(command))
+        }
+    }
+}
+
+/// A command that has been truncated to maximum accepted length of the command queue.
+///
+/// The remainder of its payload is expected to be sent using [`ContinuationRecords`].
+pub(super) struct SplitCommand<C: CommandToGsp> {
+    command: C,
+    payload: KVVec<u8>,
+}
+
+impl<C: CommandToGsp> SplitCommand<C> {
+    /// Creates a new [`SplitCommand`] wrapping `command` with the given truncated payload.
+    fn new(command: C, payload: KVVec<u8>) -> Self {
+        Self { command, payload }
+    }
+}
+
+impl<C: CommandToGsp> CommandToGsp for SplitCommand<C> {
+    const FUNCTION: MsgFunction = C::FUNCTION;
+    type Command = C::Command;
+    type InitError = C::InitError;
+
+    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+        self.command.init()
+    }
+
+    fn variable_payload_len(&self) -> usize {
+        self.payload.len()
+    }
+
+    fn init_variable_payload(
+        &self,
+        dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+    ) -> Result {
+        dst.write_all(&self.payload)
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

