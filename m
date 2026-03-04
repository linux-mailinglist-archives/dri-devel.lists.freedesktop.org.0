Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFMtFTiOp2nliAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 02:43:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 069A11F997F
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 02:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31AFE10E928;
	Wed,  4 Mar 2026 01:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="m+Wl6JLK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011031.outbound.protection.outlook.com [52.101.52.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8BE10E928;
 Wed,  4 Mar 2026 01:43:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjJsyOdT8goSz46FsIngKwAwaSdX8fvWnpmWduez/ht2NCai0belImbZwDq3GhzQ8kQzL2k+o8CgktgZUsHuX06kqvGL+WQ75ey5bFOVsmRyIpx5Dta7QBcBke03SxXfzzVfZth39Pef7n834laP8tsyhA38U4bZvU5lqrsPcnD7peyI0Dz6EBHsU612lBARtAk6lYKJ1M6eXijikNdFa3lkHQMlTBLg5zD/GofBIBdtwtpjx5qXLHcibBk2yt0hGDZfU3xTrsnlcAE5zjxQuiXyEN7TSrm/Ek2k+6/DmZi8cLU71ZdGg1jjXsd1eeO1txRzkizUk7xjoGL52ksNiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xw59uP2gjxtmGwJk8EshlwYjcGZFwfuRkk0BPIdljP8=;
 b=O8+u5NpmEv5uAK4tQMKMeFUXerWu9dMmT5smChJQBZQDv/Ha64nfztZiLH4jhCT7r0xJZEyBbcL6qIDomcEe8BDmWI63yQbtbJsS/lkwNDzItegSnIpJmVGX1HN4C6owbREBrMqBnH84IrxrEWuFh+Qc98Uo0S9v71gw32iH+L9eglbo4OMhFJG170bHRwHZbkNsGaKY92zCxexwUGjUJ5EWHoxYXIgf6YjurBUqElsQfif+Ri3pt88KD1S/V65ywDdlt5H6yQpbDG+Ept5gypESVi2Un3Uk9uRfU0jbPsj+tKTMHXHOGnDI2wcpFQhXfBkyR1pbUcv6mcQATddIbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xw59uP2gjxtmGwJk8EshlwYjcGZFwfuRkk0BPIdljP8=;
 b=m+Wl6JLK5rwuvsvN/okWUJkZSQ0QiJMX/1IyPcV0l6UNes5hgOkC72El8wXotZnDJQZv5hCOEpqG67eJ/u1YZ4a5M2h4XPfg3jhW4mAFqrHEHLPo1VGbQ5cqdly0M8kDSCcHc6AO4Jwb4/zHLDt3B1fK+niGfcu1BBm4REonY04njoh3z1a2Y1lHF7bKzyMUNs5XXJAjbv8o6IhDTS6iHqYyIQLvQ8m21yBTJqqECXNyYT7Aug5OZHN28YTs1zm9rzSWfxOf43Xr7Vtr8X+XftOhJlUzlSn24lx/L3dJFnY+WVugVJ2XqVEH22QsVZffv3pXb71bl50brHg2V1YN9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BL3PR12MB6545.namprd12.prod.outlook.com (2603:10b6:208:38c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Wed, 4 Mar
 2026 01:43:13 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:43:13 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 04 Mar 2026 10:42:18 +0900
Subject: [PATCH v5 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-cmdq-continuation-v5-2-3f19d759ed93@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0062.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::17) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BL3PR12MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: f7809269-1e0b-4d6d-f6a5-08de798f65e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: vVDFySWbMn0q0bK+qKofKC3umSudQCflKPoQMsLMsl+IdAcRaf5sBR7UbEdfnflaofUVm0WuvYEzfzMv26zldFW8VwWg414mjIELosUyOh9Uf7ovp4i79HoFCPQh/e85UM3PZvfJw/XtX2cSd+A0OfYE0atFHJNjKL0vhnO+JUzIStFdlgPat4NS8MKiBXykwWFioJyNDtzX7fKFtq/1VQYGliB1pny7UpC37o/nrbi7xu7hyJhhOFxUKv6BKp7u2pOZFq4aNVhdFZXtjDaomCipBEkRom/4HG7kvOBHeAufuhAS6mXrIAj3o9WPVxI3oiEA+N38eqYAQlzfuY2zKfES5Es0DJGJEV1jQQYP0E0n5MiwRbQzE8wC6wsfYJBK1GOIbAI2HXvFJW/SDreERWgC1i+32aOkVNxKD+lQIkFFXM5N7qX+RWbEJ0kixlRqkR/7Zw9cBM1xlZIFmTavH6GxxGwRbTlTV3NDz1RD9B7BbQ7FmmAD0W/kzQ4iu+HRPK3QDSDrwIN9TfO0MYzTtvX9oopo5Xa7pGTsAxnhxJe5gc47tDEe7hY1lSZOoU0NO/e+TNK3ZeQ7lXpEFYeniB4c3pRn/NkC+F+X9YtH4RyodGpt4GNzvCXlSj32Yr2megeDrwYv1g4I1/491z2Xh/APbaVwObGN/PQiCzJHKkXMls13+2f/pPlYRBtBy9wPrzoZeuFmi22MHCzorFU6hSCjiGnraRMI0K99xgfwkHPF/SRamvoZZUFQByGty2Gfx+tmhzR3/rMHsCZqcI4diw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXdiTGh0Q2lYOFp1OXp2U3JHNll4KzdqSU1OUi9zeWFFclZ4VjNQa05NNk9r?=
 =?utf-8?B?Q1h0QTZ1MVZ2OEtHYTBnMU8vbXB2ZzNKNGQ0VXliMVNnRkVVcU40MkVqWXl1?=
 =?utf-8?B?WXlTZW1oZk5iVW5PRjNvT1B5aUhDTzByR3pjbEdPUmFRejRkbENSeGMzT0pn?=
 =?utf-8?B?VUZyTDh2NTEvTmVIZXk2bW93ZDhqL0pPV05zZ1ZuNDJ4S2taQjVCWEFRZmx5?=
 =?utf-8?B?OFJOYWVsMGE0SGRlNHI4dFFtUVRKYXlyc0FPZHZNNDBQaE00U09VWVlQd0pv?=
 =?utf-8?B?SVE3ODMrQlZCdy82VlBwTnY0VXVWTTNRQkcwWDBmV3ArSHRrYzhxOXc1Sjg4?=
 =?utf-8?B?NkdlSDN2Z0ovTkFKamN6WHBHMUU0WmdoUHBPZ0xQaUs0dVhuY1FpQlVFYW5H?=
 =?utf-8?B?ZFFLZ2dSVnpxb2hqYU1BUkNJVmc5SDk3cHRZbC90bmxZRE5INHdadWVnZGFC?=
 =?utf-8?B?aDFaa3VxQy83dXdIdFZRTXJlamllV0VCazk1cW9raVZHNTdtZDEvRG1pbXNw?=
 =?utf-8?B?bGxpbEs4TFY4UVpmaWF2U0pVenpGMzNOcDJHa1FCRnZKK2J3b2hndVlwUlBs?=
 =?utf-8?B?ekRGUjFDeThPMWtzLy9ETVVTMG1BTGlXL3o4VWNPUmZHQ1RuekhrejJ5cFNj?=
 =?utf-8?B?NUY5R0FVQktjS1Z2blZHU3VmSVdVdU1jMFpSeVM4aEd0bVFESmNLWCtnSnYy?=
 =?utf-8?B?cFBrbFFnSnZMc0RCb2JtcDhudXRxYStDaDZGUkxSUXk0bmI1T3pKWHJvWUNL?=
 =?utf-8?B?L3ZaenFzdmtNb0g0VTZVMkIzM1k1Q01iYnR1K293WDNEQThGOEdBTmxnc0ZL?=
 =?utf-8?B?aENPMjd2NTZ4aG9kTUlXaDluUTlRTlJDZXcyTk1nMVRYRlpsTE1WUHI1Y0VF?=
 =?utf-8?B?eEhGU3hmQ0ZSc2JSTHQvUkx5aEsrVTE5Mm54R240QVN0S2NacDNJOG44OHJH?=
 =?utf-8?B?ZlA4dTJaKzFhblRFTEhTRS9uK2IxNWtCTWlReWQ1VU1VbW1oVW5YWHowek0x?=
 =?utf-8?B?bm55dmR5TllRdFd1SVF1cGJlaVZ5MkJob2x5Z3YxbGdUZmlJb2lvZzRndDNk?=
 =?utf-8?B?cC9wYm40VTNla0ZqTStMOTU3enlJMThDY2dGc2dHZzVjUVlZczVYVVczWlli?=
 =?utf-8?B?RlJKMXJlWTJiR0FVRnFNeU92OGNsY3cxYzExSHhFcXltRVE2dkVJYm5JTnZF?=
 =?utf-8?B?Q25aM0tFU3dpUEFCTk1MUUYzMzFuaWNDeWtwR2tzNnN6bmdXS1ROUW94SkZl?=
 =?utf-8?B?cjYzS3ArVzlGM3RQTlpZK1F3Q0NLQ1JnbDU3T2xFcSt2Q3dYTk1jQ2gvcjN3?=
 =?utf-8?B?Z29QZ2RnZFNqeks5UmZadU9wdDBJa2ttcEprYzJpUitzdnM4V0ZaNUJJa09a?=
 =?utf-8?B?S3pTd2VtZHJkZW8zZGtQa0JSV0c0MUJQbWZWR0hSOGdBaWF0cVltVVVlN2NH?=
 =?utf-8?B?WGJYYlFVVkQxbGIzWjQ2eUVmWCt4blZJK2NJTTltVFFtK1pmV2h4VEtwNjBs?=
 =?utf-8?B?dE91d1dwc0d5eU1PUnd5S2J4bGRtMndMUHQrUVc2eTYxOU5Gak5lUnVVdlV4?=
 =?utf-8?B?WmJaclhOL0Jwc1dVTzNDcFVTUmtkVnJCc2pxVTRyUUV5bHpmYW43QXlObHBB?=
 =?utf-8?B?MVB6VXh0QURwTWRaWHkyQnE2U0kwS1NjQUxVWlpaVXdUZnR2QVU2dkZtaTRp?=
 =?utf-8?B?eExSclRmNzRFdUt4VzQ3UXdwM1lsaGhQZXBZVEQ2T0t3R1J5RkNuSzRVdmhk?=
 =?utf-8?B?Q3B2T2F3R1Q5QWRpeElqMGhudDEvLysveG93WkVOdjVDNGN2dW5XaURORWRv?=
 =?utf-8?B?TDNXUTl0NFV1WVltTmpEeEJ6enE5QlFUNzJGM3BnRU9XdGZndnN6Q1p6K0xj?=
 =?utf-8?B?eFNLeVlaMHExN2xWaXBicElEQTN5UXh0Wm83dUtIM3E2QkttTjY3UHRiOWVV?=
 =?utf-8?B?TW1hYzBSVUdYOUZOSW5rNGh1MmkxcndXSWYvc2ZqeWd5NWhSNjZJZjNrVXRK?=
 =?utf-8?B?M0dXZ0dMM3FCUWNEL1pucCtDWlZVR1V4S1ZHNUdLWlh0V0NjanlteVZVMi8z?=
 =?utf-8?B?K0pVUm5oRlg5YkJ2ODdsejJwK05BVVR4akdXUHBKeW5jYlovaEx3dWp4TFBa?=
 =?utf-8?B?QitUODliWkNuY3hNbGRyeFNvVnd0MGZPd2VQamlFOTlIcWY3citFdTZyNTdH?=
 =?utf-8?B?MFhqdStmUEp3RDRnL0dWeUJlUkRPL2NROEI5U1Z0OENack5VMVp4R3JFWDBi?=
 =?utf-8?B?a1lTL3U1ZnEvQ1U5RTUxNXkza1l5Z1FLRlo0VmdZOFlSUmxnRHVzTGpHRkgy?=
 =?utf-8?B?czZ6UUVJTVlUM05xdHRNUHFKaUNDM0lzMEhUeGFYaVV4Y3g3dVBIZW12Z3U5?=
 =?utf-8?Q?eQAXbeniouGYO3EWB0P11H4Tm8P7S7P7X8LUUBN3tQQdR?=
X-MS-Exchange-AntiSpam-MessageData-1: qLrTLZWi+Z2BUw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7809269-1e0b-4d6d-f6a5-08de798f65e3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 01:43:13.0903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMWUqAtyB+bR7nFy1nezjN15zGaCti+03iFW5QJaYd2KSQrnA+/JjBy5xlV0T+BScpjqSIBHWlcuWscOHq+5Nw==
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
X-Rspamd-Queue-Id: 069A11F997F
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

Add a timeout to `allocate_command` which waits for space on the GSP
command queue. It uses a similar timeout to nouveau.

This lets `send_command` wait for space to free up in the command queue.
This is required to support continuation records which can fill up the
queue.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 42 ++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 87dbbd6d1be9..5cb845bae123 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -250,6 +250,19 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         }
     }
 
+    /// Returns the size of the region of the CPU message queue that the driver is currently allowed
+    /// to write to, in bytes.
+    fn driver_write_area_size(&self) -> usize {
+        let tx = self.cpu_write_ptr();
+        let rx = self.gsp_read_ptr();
+
+        // `rx` and `tx` are both in `0..MSGQ_NUM_PAGES` per the invariants of `gsp_read_ptr` and
+        // `cpu_write_ptr`. The minimum value case is where `rx == 0` and `tx == MSGQ_NUM_PAGES -
+        // 1`, which gives `0 + MSGQ_NUM_PAGES - (MSGQ_NUM_PAGES - 1) - 1 == 0`.
+        let slots = (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES;
+        num::u32_as_usize(slots) * GSP_PAGE_SIZE
+    }
+
     /// Returns the region of the GSP message queue that the driver is currently allowed to read
     /// from.
     ///
@@ -281,15 +294,22 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
     }
 
     /// Allocates a region on the command queue that is large enough to send a command of `size`
-    /// bytes.
+    /// bytes, waiting for space to become available based on the provided timeout.
     ///
     /// This returns a [`GspCommand`] ready to be written to by the caller.
     ///
     /// # Errors
     ///
-    /// - `EAGAIN` if the driver area is too small to hold the requested command.
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the command header is not properly aligned.
-    fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
+    fn allocate_command(&mut self, size: usize, timeout: Delta) -> Result<GspCommand<'_>> {
+        read_poll_timeout(
+            || Ok(self.driver_write_area_size()),
+            |available_bytes| *available_bytes >= size_of::<GspMsgElement>() + size,
+            Delta::ZERO,
+            timeout,
+        )?;
+
         // Get the current writable area as an array of bytes.
         let (slice_1, slice_2) = {
             let (slice_1, slice_2) = self.driver_write_area();
@@ -298,13 +318,6 @@ fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
             (slice_1.as_flattened_mut(), slice_2.as_flattened_mut())
         };
 
-        // If the GSP is still processing previous messages the shared region
-        // may be full in which case we will have to retry once the GSP has
-        // processed the existing commands.
-        if size_of::<GspMsgElement>() + size > slice_1.len() + slice_2.len() {
-            return Err(EAGAIN);
-        }
-
         // Extract area for the `GspMsgElement`.
         let (header, slice_1) = GspMsgElement::from_bytes_mut_prefix(slice_1).ok_or(EIO)?;
 
@@ -462,6 +475,9 @@ impl Cmdq {
     /// Number of page table entries for the GSP shared region.
     pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
 
+    /// Timeout for waiting for space on the command queue.
+    const ALLOCATE_TIMEOUT: Delta = Delta::from_secs(1);
+
     /// Creates a new command queue for `dev`.
     pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
         let gsp_mem = DmaGspMem::new(dev)?;
@@ -497,7 +513,7 @@ fn notify_gsp(bar: &Bar0) {
     ///
     /// # Errors
     ///
-    /// - `EAGAIN` if there was not enough space in the command queue to send the command.
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the variable payload requested by the command has not been entirely
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
@@ -509,7 +525,9 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         Error: From<M::InitError>,
     {
         let command_size = size_of::<M::Command>() + command.variable_payload_len();
-        let dst = self.gsp_mem.allocate_command(command_size)?;
+        let dst = self
+            .gsp_mem
+            .allocate_command(command_size, Self::ALLOCATE_TIMEOUT)?;
 
         // Extract area for the command itself.
         let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;

-- 
2.53.0

