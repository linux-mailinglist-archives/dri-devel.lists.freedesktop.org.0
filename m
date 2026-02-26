Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKNYDq4yoGmLgAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:46:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 831EE1A5452
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EC210E03F;
	Thu, 26 Feb 2026 11:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="W0WlGLnZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012057.outbound.protection.outlook.com [52.101.48.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8159A10E03F;
 Thu, 26 Feb 2026 11:46:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3thY2IvxYcUMpRKEBszyL6RFiYR7EUf0w96Du5arlPCoJufOX+xl92UOoSkxpJZ4DxZquY5HDcNeSYp75hxSlZ8/WoKXjDTxJRARAG6fTA34Hr5OBiFLDWq9cTWroGeAXPS/R8e0uZOIt5itwASPFIrtbx/gJlNXWm9twX/Mci+EzoTKy8L2FcfO7PVsMHSnjmuMOPvrFq3GWvoFIc4a+9JrZqdUFPdPFovvvly+fdYmZRnuyIBtCpxkSsZzqqaFHrsybRGCkll5POYCfKv5C2PgZ9/9FBEOOfWzFBT/z19DNf9H6BvaMDhRwrQeqnBR34UljNZKMg59DBjEvx9VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMY96A6F1tDZHE8RLTFE5p2zhP7cdjqBaEcDOhHlkgQ=;
 b=uPqfRohpQuTfd/apkhvjOeEYBh3ZURDCfs/ovUElZa/RA0IbBH4Mc6e0lRaJcIr45qG1lbN5yUr0TrSWQEJ1dBQvOQKuusXkHiO0n0fBn4g+d6cJO73ADzsmumh6oQl8qf9ADvZSDMXiCIUD/oMFW8qrvwf5M2LC6Ubem4Nn0RUkr0HXyHXdW+Uy0pNthiLR7E3/tecZ6VuTbBPOF54k+HvY5ULlIki9GPc1iLFhajH+hVKqgViV6C9DfEVA7bfPYctSbmU5qs/5pw/R29hi33SKve7hpgnQSSC3CKmI6Kyb0mF4mQvjV1dXOUU49fWZDd2GCFXn7hWHouUQ/h1wUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMY96A6F1tDZHE8RLTFE5p2zhP7cdjqBaEcDOhHlkgQ=;
 b=W0WlGLnZQwQT8qTPtFuwCYwKF1N0BewQ4XrsQrqjxAg2c5CUpwRbBGoB7y7SAggIcZ9eLSRXGmFYfcav9aQ1j4FSUKi9caQedsvp1PioE8Wp4rF5mj0uetOLYPkS0f2J9rFgb4k2LNCJ4EiHIBBQHKUcztaXHSscdQRLwX1LrYN1O4/b93fO+HSQMnSNiqeJu7DnAFL+rHZRvfB+4UYP4AmHCTR2nNQwVB5RVujhTj6Ntxie0x9LGyjLqldkgnCH5FLgx9jm1gcSyXEHlo7pAJKCJUfUpEluXSi3NNxNrFckbBAfLlIijc9qA+k/Q4sr0ckX5N41tWTRVKrPq0z+fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Thu, 26 Feb
 2026 11:46:40 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 11:46:40 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH v3 0/9] gpu: nova-core: gsp: add continuation record
 support
Date: Thu, 26 Feb 2026 20:45:32 +0900
Message-Id: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OTW7DIBAF4KtYrEsFw48hq96jygLD0LCwnQBBq
 SLfvdTetFKWbzTzzXuSgjlhIafhSTK2VNK69CDeBuIvbvlCmkLPBBhoBkxQP4cb9etS03J3tW/
 TydoogrJae0H63TVjTI/d/DwfOePt3ul6DMnkCnZjnlM9DdJJGxEECjVO0hipUPCI1oNxhoFnS
 irDrSG/1iWVuubvvW7jO3Y04/CiWeOU0VGw0QYMSqH+WFoKyb333zvX4C9hXxHQCUAzjZorJXT
 8R2zb9gPSagN/QgEAAA==
X-Change-ID: 20260203-cmdq-continuation-b99f3d5966c3
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
X-ClientProxiedBy: TYCPR01CA0063.jpnprd01.prod.outlook.com
 (2603:1096:405:2::27) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: b2746439-ec04-46d5-c145-08de752cb481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: 2nTGyCC946eyMinC2B5yEgtJQOKRNvVL7+XjI82HZzzixiX8oVxD7Qz0XDSq0piTd/7Wz6r/3XLcsrFtpB0Fq7jBDRccUWKavXjsmWdvdmUKn6y+vil5H2dR0BkRZMRpFrrTRS8yMHUfDRY2XUss7ADidwmWtVGIBUZKHPNLGLTEDzCOKkFY72tcZeHHFa+ZU5nHOX0Jx3kK0e+OG26zed04Ll9t7QClKa3hdzitjyzQo4WLa0bTD5Fxlwci4mTeRzyGhORaS5Ax+hmZMqJWNgvmFx5ffEHlLsubr+jo2VOCeELXsU8LxeJcmORTQ1ZOGNg5YHlW7d0IkOZ1oJuxJXo5ZRYMkIXynUy9ODdEG+xT2agm7spQJQJei4VmllseFX/h8+2eAfamumbUPwtbvWSD/GiFU9OC7uNxiMvlxyxLaaoEoM2hWgFMSaW0Yu1L9Afneh713eQ+CUNYfY4AHbhWMPvmX2pAcHAyQrJuw1NuIQKnrcQrvEOL7EX1ooPRAjzalEdS3m1B156y/UbzIpBIg3XvnQIlis79KlZ7tWqLhXVRd5zl8snf03Gkaz7/EDehFRL2BshHDPeG0I7YDjFIlQZ6KeHZ3Cv1pHRaeZctsudGbe1cwdHRuKjX2YEQ2jEfoX4V1IDoYUiAepfQ/kmP3sofIpUCt05vjcJfuM0J0/BDjhLfxPrLZdDTme11++UEtSWxDu42CWmNcCNdlb9lMWIGkBBWMuf526Qa/RPwT61yYpHGpUhW5OO4Bh0ealzue3prYGCLRqGwyGOYRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3J2cC9obi9ZMjg0bUNRT2J3T1JIb0JoN2hFaHExU3FKUUtBVHlrUUU0MzVs?=
 =?utf-8?B?RTNES3F5YWcwa2RsOEpwK1p5Q1dnTVdvamNNeHNLUjNuUmNkbnVCVjJnMlBm?=
 =?utf-8?B?eWNxZG5hZE0xY05EbEJlZjlDY3NlSHh5dnpxUHBHcHB0S0tMbkV5bGQrSFNO?=
 =?utf-8?B?dVFkWDFNcFdMRmk2SEhISVJQRFUzdW1YYWg2N3ArTmp2S3VYTlNNamdJZmlL?=
 =?utf-8?B?SjJUMmZQUzk0OWJvTnFnZmI0OW5qVkc0VUIzemErSUpadXVKTmhTeCtRVmNz?=
 =?utf-8?B?ODFyNHI3VjNUcjFHRlVJZlF4YXFwNUN6UG9uNFBtU2djaXJsZTdDZm4zbmty?=
 =?utf-8?B?OE9sQ21weksyZzJsR3FJSHg0MGlQeitTdjByQnE0S2llYTFEKzY4YkJtTHA4?=
 =?utf-8?B?bVQreXprdzlXU2ZFT0RPMGUxY3dNRzI4Q295OHRId3FnZVJpTE1RT0MyQ25O?=
 =?utf-8?B?eXo2YXdPdGtrUzIybGRZd0V4Y2F6d3VPQTR2eFROTEV4a3orSHEydXk1Ry9D?=
 =?utf-8?B?dGVTd0V3bzZHVjBQTitZYmFMMEY2TDlYNlZZci9DQUZ2a3AzS0ZPV3llMzJZ?=
 =?utf-8?B?UjBuZUNGVzVlby96KzJaejR6NGNsQUxBMkdzY1ozdFc5bWhVYkpyUUdtdW1Y?=
 =?utf-8?B?aExqUytZclY4OG9YazZYN3JKZnJlQmVkR3RveXhCbVpWR3g1SnJzcGtjMmg0?=
 =?utf-8?B?V1hvZmxtUTM5RTNRZHBheWhUOW9UUUcvck1NWlpxdVAvNlQ1ejRzempubms1?=
 =?utf-8?B?dU12VW9vaG0zTm1QLzRsRG95RjBCczJlZ1V3TEZDcENlbWxhMFFYYytYZEoy?=
 =?utf-8?B?QXR4VXBYYkxxaHVHNFFhVWFmY3ovSXJMVHByaXBJZ2ROZ0VveE1qd3F4eHUw?=
 =?utf-8?B?OStqQmFFMHFFSUlPc1FDN3hGQ2ZIaUpNb3lZc0Y5S0FselZRZ0g5MVB5TUI5?=
 =?utf-8?B?Z01QazcwcTI0ckFSWHRFclJYRytYVURlN0pBejRyQk1sUGU5VmEwYUlXZmZk?=
 =?utf-8?B?ejBzazVKdVI3b09NV0dNR3BkQ3VxSTJhZHpuQXF6OGEySTFlTk5XQWpOSDFy?=
 =?utf-8?B?cEZ5QVdoRGJibWYzT2RUV0RZWGxBRDc5MlNDcmFxVUhlR0kydmtxSnFjTjVH?=
 =?utf-8?B?Y3Fwci9tTGdjaTFrRXJCQjBqNzdTc2dpdzJNWGI1SlVqQmI4Q1NUaU9nbjRi?=
 =?utf-8?B?cmtMRjlaZm1PY0U4VDg2R1Jvam5MWHV0NFpLYTc5eXM2cE9OallSeFhWbnBy?=
 =?utf-8?B?eGFIamhsNFd4a09WZ0p6eFYySWtFTm5PbTFJK2FWaG9GajBXMXRiSkJIV2s3?=
 =?utf-8?B?YXlNemd6d3VNcWdiRC9tL2RtWFRwcEpyQmlhd0JtUkhtWWJjclpabnN6aHNm?=
 =?utf-8?B?SzBDei8raWUzL0dnd3M4elc0MGZoZElwK3FRclVmcU5qc01wZWdsVlliR1k2?=
 =?utf-8?B?ODYwQVZaeWdzRzJNTTlmYkhPSHF2TzFINi9nQXhROGFvb0w0WUNuc3VMdGQr?=
 =?utf-8?B?akZ6TjFrWU5yUE4xOEgvT0JGOWJrUHRCMWpvZlNmRk1HTXFPSXRHbE1LZUdI?=
 =?utf-8?B?Y0lZNU1ENUZrSXlPcDZkOEZibi9rVFVKTmI3LytPcHRYcmRUajhoUXdGTy9n?=
 =?utf-8?B?ZTRDRlBwWnVES3FUOTdBaTFYeGdLTDV0YnBaN3F2QzBQZks5SjFOQlIvVnB1?=
 =?utf-8?B?NkJiTmR1QXVkOGhFa3IvbHcySDhMMklDb3BmcDcwZHhnNnI2TkMzU3dqdFk4?=
 =?utf-8?B?ZG5GOFJ0VCtwVjFiRkZ6djBuZTl4T3BESmRTOUpCdVNhSFpiUXhPNHpEaFBq?=
 =?utf-8?B?dnpPbGowV1J2RWkxSndRTGR1U1YwZWZsL3ptMnNTemVHSDEwa05WUWR6UThG?=
 =?utf-8?B?MVpsNEVwOWJqdjNzc0owUUx0OFQ4MUY0YTdqQnVkb2g0OEg0OGpyNVhidVpy?=
 =?utf-8?B?cHZPZ01hM1h5MmtISWhVdy9NSkhzUSs2TTJUR2NoRkdtT0hhdW9VWXJKY09H?=
 =?utf-8?B?OU80YUZCdmRvSElubzdTOFlWY3k1Zkx1MjV3K2IxOFZUKzYrYkREMHJUSmIx?=
 =?utf-8?B?UmFNSFRmbGN1UThwTVFUS2hVemxqNVI3QlZDNWR6b3RrZkVmV2NLaFJyaUlE?=
 =?utf-8?B?SFZaWS9VVERSc2hxVmhKaHVuY2E0SVhoOVJ4L1F2UmJ4c2hPODFRZit3OXZ4?=
 =?utf-8?B?UlhmZHA1TGNHSzMxMm1jOWdmYXYveWNzUnZjVkJOdWFDQ1N5cUUyUUdORUh1?=
 =?utf-8?B?QnR3aFlmbk85MElVZlVaS2RxYythQkV2amVtRHM4SnRoRUxYU1RxZWxHbGdC?=
 =?utf-8?B?ck9IcUd2aDRMcnc0azlEU05WUHlmaDVLVG9oY1JNU2l6RS9sOXV1cEVnM3BX?=
 =?utf-8?Q?yQkESZ6KjvetL/bNOiMxDlGSZOhL9Y9prIHppk3hRSAzn?=
X-MS-Exchange-AntiSpam-MessageData-1: EJ92YT9jjf2NMQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2746439-ec04-46d5-c145-08de752cb481
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:46:40.2265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmHPlI3H6D/crYZOVaL+PbQu3Pst4y+u4R7sVGU7UMZn3GJF9Q80xNqnEumTxa4wijljzaK3Qri1nakjACEW6Q==
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
X-Rspamd-Queue-Id: 831EE1A5452
X-Rspamd-Action: no action

GSP commands over 16 pages need to be sent using "continuation records"
which essentially means splitting the payload over multiple commands.

This series adds a command type `ContinuationRecord` which just writes
its header and whatever payload it is given. It also adds types
`SplitState` and `SplitCommand` which support splitting a large RPC
into smaller ones while transparently letting regular sized RPCs be sent
without extra copies.

The send pathway uses `SplitState` to send all commands, but if
the command fits into 16 pages, it still writes directly into the
command queue. If it is larger than 16 pages and needs continuation
records, it writes into a staging buffer, so there is one copy.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
Changes in v3:
- Rebased onto drm-rust-next
- Added some doc comments
- Reworded command_size doc comment
- Link to v2: https://lore.kernel.org/r/20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com

Changes in v2:
- Added doccoments
- Renamed driver_bytes_available_to_write to driver_write_area_size
- allocate_command_with_timeout merged allocate_command with timeout parameter
- Replaced hardcoded GSP_PAGE_SIZE * 16 with bindings
- Changed oversized command error from EIO to EMSGSIZE
- Added EMSGSIZE to kernel/error.rs
- Split WrappingCommand functionality into SplitState + SplitCommand enum
- Made max_size a const (MAX_CMD_SIZE)
- Removed send_continuation_record + added comment for type inference
- send_single_command now consumes the command
- Extracted command_size + used in SplitState 
- Link to v1: https://lore.kernel.org/r/20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com

---
Eliot Courtney (9):
      gpu: nova-core: gsp: sort MsgFunction variants alphabetically
      gpu: nova-core: gsp: add mechanism to wait for space on command queue
      rust: add EMSGSIZE error code
      gpu: nova-core: gsp: add checking oversized commands
      gpu: nova-core: gsp: clarify invariant on command queue
      gpu: nova-core: gsp: unconditionally call variable payload handling
      gpu: nova-core: gsp: add command_size helper
      gpu: nova-core: gsp: support large RPCs via continuation record
      gpu: nova-core: gsp: add tests for SplitState

 drivers/gpu/nova-core/gsp/cmdq.rs                 | 116 +++++++---
 drivers/gpu/nova-core/gsp/commands.rs             | 258 +++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw.rs                   |  75 ++++---
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |   1 +
 rust/kernel/error.rs                              |   1 +
 5 files changed, 393 insertions(+), 58 deletions(-)
---
base-commit: 4a49fe23e357b48845e31fe9c28a802c05458198
change-id: 20260203-cmdq-continuation-b99f3d5966c3

Best regards,
-- 
Eliot Courtney <ecourtney@nvidia.com>

