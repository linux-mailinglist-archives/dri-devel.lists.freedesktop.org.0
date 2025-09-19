Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F54FB8B3F1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 22:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390ED10E118;
	Fri, 19 Sep 2025 20:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E/ulTYMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011033.outbound.protection.outlook.com [52.101.57.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E7010E118
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 20:53:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJma8TKpUmN12Amn3aZ3KozYkIgGWNOTCB3LAZ/QEP7wYvYSY6b8bbHOPRfdWX/tt/hK0P6sfYj89BApOzaaw9bCNaKOkPlsXqCbT/ttdfVq+eUsYmyuUttPTJT52N4lQLhiiWsW2Havov8h8IfPC9NVAJYcdQCizQRs4xvGjmjmboL/7VYnoegtdGlx8oNtzRWQrtzW5Ll7l3m30guxGObzhqZ7h2xL7AB9rS+fkm2+Wgv15FcsF9ourQtz9leU5KfaqVR9sigfsTqNx1ALXUprdKeT2s8RQ2S+rumRgZRakcUH9t7HzdD1dYghfWl8xP7yoF+hXLD7A7E5HzH+ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIndlFx9soNLql2Vs2kIyd4NWEY22Grcba9EsiVs3j0=;
 b=D+SQ2blWlx86zj2seeDCA4Mz2PoJ8rWaiqJvOQQsHZyQ2KIUyqk3RdKzvJbBbbwAo6Sw9wgD8Y1NcszM6FgyAmz5WHqrU6kk5vUBQTEDbuYKD7g648o2ROWoipULHIahSv4m2e71TdGuegcON2YwC5xT8NYpZAiT3AVSj6UzRDnMRJ5EmGVs26/U+kBp6A548BgtT5Aar8zTpuyVZ2Z/I2jbe88aDzNUifmBHQiCqV1CBxOnABCfN6f/+ZkbSPFUEND25Z+9iKT+GglN+iAEKnJ8EPpNEMGHPo0ZIti8dX0KHyI/SxXVtMjgyJvIgYFZMAilg8mzewIid/h1P2z02A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIndlFx9soNLql2Vs2kIyd4NWEY22Grcba9EsiVs3j0=;
 b=E/ulTYMW2kZVRwTaoxabXqUUZ+IEdO/7CqIwTcRQ8mDdx3vTCKBrLNUB1Kmc8rkox3agu5K3KCf5wM7yZlaeSbyrwgwf2VkBqNbnB/DRvMtJoDD0TJGTEJJ3EBqJ3sPH0motMvZ/kkc7jqtdnoMfwolWQknrZuYvRe0t00pqJ6wjaEydSJCgvX6UIP0wgjyoox52FgzDeGhsn6KByhIBI92jPVUPDm8RBkz6BbfF8+vB3kKqtIssomIv6BkXL2gXkfvoeJX707rwWETrkVqf/bAnLKVTK7OMxrzUrt9aC2E/7wBSgJ1rQX7xbfeaNnshvy2C9N7DXA6YqFCyMwD15Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA1PR12MB6824.namprd12.prod.outlook.com (2603:10b6:806:25f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 20:53:15 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 20:53:15 +0000
Date: Fri, 19 Sep 2025 16:53:14 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH] rust: io: use const generics for read/write offsets
Message-ID: <20250919205314.GA1884303@joelbox2>
References: <20250918-write-offset-const-v1-1-eb51120d4117@google.com>
 <20250918181357.GA1825487@joelbox2>
 <DCWBCL9U0IY4.NFNUMLRULAWM@kernel.org>
 <752F0825-6F2E-4AC0-BEBD-2E285A521A22@nvidia.com>
 <DCWO3V7WQP0G.127BYBORGE85H@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DCWO3V7WQP0G.127BYBORGE85H@kernel.org>
X-ClientProxiedBy: BN9PR03CA0626.namprd03.prod.outlook.com
 (2603:10b6:408:106::31) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA1PR12MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c08be1-a713-4638-0f8e-08ddf7be8e05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUVmNDV4MDQ3VlRJOXB1OTlwUUNSQ0dnaHQwU0txTVNuUXArcm9WbjVzN2tU?=
 =?utf-8?B?aERxNURrVnJkUFp6RHB3R3pLN3J4Z3g5SUNaT21oaDZFV2FEeGl2T3N2N0Yv?=
 =?utf-8?B?OG9vUWtOQ1YvV0dMN1ErUDdDWUhUa0N3MHRnRjZtQnoraG8vL3lkSXJnNjIx?=
 =?utf-8?B?QWQ5S096ZGxrczhTNnQ1ZVIyNGVSbmEvWGdKNm0zRHhHU0FFTWJ0RzFxdDJh?=
 =?utf-8?B?a3RKZHhJcUJSUC9FRmdSQXk2eVJKdWhrRDdNdWJZVlFtSjBVWXJyWCtnU1pL?=
 =?utf-8?B?OU9ZZWJUUHo4eFdKZys5RmRQRi9sZS9XWGxac3Y5a085SmwvRHRJWW52b2Q5?=
 =?utf-8?B?MmE5NXUzd3dDMWxHWU5nWncyckx6M2YxUk5sUVZLT01mUExGV2ZVcnpNOGdi?=
 =?utf-8?B?d0JzTU1VMUFoSUpadnd0TDd0VS9LTHhDTXQvSGRpR3M4Y3dTVFNMOEhlT0NY?=
 =?utf-8?B?WGxKekZrZDVkdDFwUDhLMFQrTldGV0Q2bWFHUkxTbXJtWXU5THRvMmEybUMw?=
 =?utf-8?B?enhWNUpLSkRkRktpNk8zRnVFODJHQXY5MWJqVk0rTHFvUU9IMitWVUZsNVBZ?=
 =?utf-8?B?ZHJodEEwSGlxWG8rZmlyMloya2FoTDFQZTgzL1B4TEg3SkdqQUYzMnNZN2lB?=
 =?utf-8?B?M1RIZ0dHbGNDb0h1N0lKTyt1OG5VdDh2S1o0NGx6alYrRGF3MzdKYzBZaERt?=
 =?utf-8?B?TmZvVTVpUDRaZzZBT3diVE04VVY0MlU5L3NwdDhMMzRvQzVTRk5FaGM3YnhS?=
 =?utf-8?B?eWp1ZURYR3RPeGJ3ejFJMFNXWWpGK1kwd2prRTNSL3FUT28vNU9pNVRmTjBU?=
 =?utf-8?B?V1BJSFFtd1NrZEQ4VEdYOHNKZmRZajd3akt6TmllVjBwMkdjS1MrYWFXT2dQ?=
 =?utf-8?B?c05NRXdGdG5oNXhReWNOb1IvT0pRaStBUDNXc2tUUDhzWklON2l0czhsakJZ?=
 =?utf-8?B?N2hUMFBUZzMrNFFRRG41aHc1cFkzWmpvOGl6bzFVT3RYL1Zmelp2dGxaMmxB?=
 =?utf-8?B?RThzVlNxeDdWSHhTRXR5UWI3NlBoUWJGSXJQOHVFd0NXQUtGSithK2JtU2FR?=
 =?utf-8?B?Z21uU29zbS9DeGp4dmJWL0EyYldlek1RcjhlbElza0ZiWUN6eExxL2Mxb0Fn?=
 =?utf-8?B?bk9OcTkybi9zK3ZjUSszeU5YM3ZPRTRnZlg5YmY4YW8wQ1BVOFVhOFBlaDBP?=
 =?utf-8?B?UHVaeTY1cjlvc1RQTnF6OUQ5a0ZNU1FuZE1Db2p3R0lnZi9JUEczODBCSlFq?=
 =?utf-8?B?eWdIUG9iM1NmeG5wV2tZMXA0clgvUXduck1EWjRLMXRLTzBRcXM2Yy9maTZ4?=
 =?utf-8?B?MkVKZG9qbXVVZC92VFc0bGo2dTNYL2FNWGtkaGtsVjZ3aXhjUHNnRThUZnJE?=
 =?utf-8?B?SWgrT00ycFdiRHU0b1YvdXhIZGFweFFjTVBobEtvaHZ4RnUwZ1pycDNjRStQ?=
 =?utf-8?B?Y3N3N3Bva2sxWVBVZDZrVjlBV2txRkRtUjRybTZxY1hqc2RQUVhQTFdJMTVY?=
 =?utf-8?B?ZEsyYUZDeFhtWXpiQUJPbG9IZi9nZUtZR1RNOEFGOU5lc3VDS2owRXlxem04?=
 =?utf-8?B?TDRsL3llWlhXMlorQ3EzM2FDeTlRM3pDVFdrbERHeGxuR2JHSVVkM1oxQndV?=
 =?utf-8?B?ckVXQkcrUGpWQXkwUTBzWnFGZTlUQ1V1eFUvTzlWUEYvdXV6dlVMZVhoanZk?=
 =?utf-8?B?clp4UkFmZVliUWxUZVdtNmtNTkc4SDd2cHJpMm1kRXNRR243dzBTZVZuM3BW?=
 =?utf-8?B?UGFpUHRRMWx5MUVqL0o5djZseFB0QkN4SE9zWWZMUGx3TXNYaDEzVWJqWTBV?=
 =?utf-8?B?aGxVWllRc2pjQm5NY0FYa21wT3NHczVhQWY2RUZmcENnVlc5Z3ZKUmJpRkt4?=
 =?utf-8?B?NXRHYUVQNlEzM1lPckZvZ0VmNVQzd3A3a2YrUkowWnNFMCtjbGw3TDdGU3Jy?=
 =?utf-8?Q?oNxpc7NSo0U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGs2NHJLcGwvQXdDWHNyZzNmcWtpS1R6am0wa0xSemk0Q3lNMkVqeDBhWC9J?=
 =?utf-8?B?REdwdmF0dXBpY1JXQlE1eVpFS3NSUW1hQ3M3eitLMTVvdENoeFVPMkp4ditO?=
 =?utf-8?B?Q3BsdkcraFc1N1BjYVM1d0JUelpXQmhTRlI5OFVabDlWTyszL3h3cEI0T00x?=
 =?utf-8?B?V0YrUUJRV242RGJER3I1b2YzZWNsU3BxSU4vWWZnS0RPQWhUVWl2TlR3aERH?=
 =?utf-8?B?NSszVFFBd3NjZVZqRUtubHk0UStPM2xJaU9xVysySnY1a2srZEltNk1TZi9w?=
 =?utf-8?B?bWRnSDBHWFA5WXBkNk9aZlZBSkdYL3ptazJhVTRwVWc1T2J5SnVFRDRHZm9F?=
 =?utf-8?B?am5CSW1CdVJkUDdLWlpmZER6R3Z5ZVZZRTJ6Q3pSczRPbkU0NlIwVmJRMjdE?=
 =?utf-8?B?Q1g1a3ppTEp2dG16NmVZQU5CTUdQcC9tWjQzVFNyY3hRb0dNbkVDM0d5eXE5?=
 =?utf-8?B?VndqMkI2bzdLYlp6K3Nad3lFeVM2VGx3L3cvMy9xTDVIdElQYTZoZ25lcXFr?=
 =?utf-8?B?ejZsSUIreUZXMWhjQjZiTGFjcWIrdnZ5am5nSk9SM2tEdWorMkxRb1gwemRq?=
 =?utf-8?B?REVuV3FUZ1d1THh1NzBpRWsxdzhsWEExNzI4M3o2cFdOaDdiTkQ0UGZGWVZG?=
 =?utf-8?B?cEUrK2dCVkRMWG80NXFaWE1JWGJQTFhRakU5ZE1XVDRKUTlaZ0dpU1pGaUJV?=
 =?utf-8?B?M0x0ZjdYK2VGK2tacVlFaUVHcGQwZ1A4QXRMcGNreld2UlRKblI4UjNxbWE0?=
 =?utf-8?B?elg2Qit0RVBLcTRYYk5XLzh6SzRLTWdtS1l2bDVXZHhRVXdKRSs3RU0yZjRw?=
 =?utf-8?B?aFp6WFBEc3JUNDhOMGQrR3Q0R0hjVDVjK29yQlY0QllkakhLNmVFVnBIMTFi?=
 =?utf-8?B?YWtRZDNLV3NMNXAvMnlDc3hrVEFJVWVKTFBsSHpEY1hYNkN4RktmSERrSEVW?=
 =?utf-8?B?bkZmUndqZTRIRmYvQWFIQUEvU0RMUXdURm9iM1JRUEx3UGhOb0c1OEhmVUJi?=
 =?utf-8?B?bHlWeDVLMTFCdWVHck80YXpESEdvWUxVeHFSQkIzZ0lrYVJjenp0ZXdGZGls?=
 =?utf-8?B?aHRZRVNXQTlqM21IZ0tWQ2Q5LzI3bVN2UHpkaktBekN3UHZFaUZPZ0g3T01v?=
 =?utf-8?B?K3FWZmoyOXpvQXNqMFExdTM5ejE5TlowU1JxQVZ6WGlBbU51cEtheWg3OE9S?=
 =?utf-8?B?T1ZFd1Avdm1aU2N5TXpXMVo0OVZyblEvdkVYaURXTUpzd3B4RGlSMVRKRnZR?=
 =?utf-8?B?RHpXdWRQSm52K3FEK3pKSi9haDdaTC9zemFha3lwV1EvMlA5aXdwQTU4cXJz?=
 =?utf-8?B?ZE5vWDFzWXRwVmdmeFl6VGh0aWp6dmtrYUFacG1MN2FsK3hHbzBFL2p4YTNQ?=
 =?utf-8?B?MTZyV3RPZ1FVdXhtbGhxUkF6aVB2TDkyd3hWVGlGQUlUN3F6TGJxa25uU2w5?=
 =?utf-8?B?TU5nMTQyYmk2L0p4UlZRRXR2U01JWml5N2p6cEdHQVg2L2dVTUdSKy9STUF3?=
 =?utf-8?B?NjllTDVqUVFPb000ZHMzQXBMVUZHQU0xUzNPRFVEbkM4TmlVeS9tbENVeGlq?=
 =?utf-8?B?eUtxd25xRGtWVHBtWkNYNXlNKzA4MnBjd0RQRm5YSldiMDVZSnVzMFExbmYv?=
 =?utf-8?B?NjdlWTNKeEpkakViaDhtMWJFNjd4VzAyeTNma0plNVNaa003OUxLTWErY3Nj?=
 =?utf-8?B?Tzd0MUdzYXhRMFh4U3JCdUZDZHQ5eEJrNEVkUVZnWHgyS1NYeERtL3l5VUNl?=
 =?utf-8?B?cDk4SDEwbDdQUVpkL1F3cUczRUxrU0plUG5QNWRmQ1EyOStkcGh3aWNpdC9L?=
 =?utf-8?B?c3p1KzBKZUE4SkQrc1RQK1o5bUhOam1LaG1SQkxuMzVmUzlRblF2NW41Zm13?=
 =?utf-8?B?Z1Q1UWdQYUFkbnF0RVVVdGY5Z2puRWhPdmRVQmdsajhKbnBuZEFQVmkrYlN4?=
 =?utf-8?B?ck5VcUU4QlJzZTdSWUprcm91M3JyTHhRaDA2c3ZINXFaTE9xUXo2RkFqNlQ1?=
 =?utf-8?B?K2gzVExUMHlPdG9TV01IR2ozeXJlaXBjQ0lQTldxV3FwQll0TFFkdDBieE9v?=
 =?utf-8?B?bFk1eXlyT0pGTmtIYi9pQkZtNVE2OUY0Y2Jxb0tpOHFob2RRcThoTVFmajVt?=
 =?utf-8?Q?XAlCykIWngHh4AN1CCpvpOaEK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c08be1-a713-4638-0f8e-08ddf7be8e05
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 20:53:15.6441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AMbMxyxBMaQyzeCA7MqNK87mTCqiDlylOA59amuOEATKJ2OzBEHvozRws4ZGx5lZjdEzvXFOEEOPCEgaaiV90Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6824
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

On Fri, Sep 19, 2025 at 11:26:19AM +0200, Benno Lossin wrote:
> On Fri Sep 19, 2025 at 9:59 AM CEST, Joel Fernandes wrote:
> > Hello, Danilo,
> >
> >> On Sep 19, 2025, at 1:26 AM, Danilo Krummrich <dakr@kernel.org> wrote:
> >> 
> >> On Thu Sep 18, 2025 at 8:13 PM CEST, Joel Fernandes wrote:
> >>>> On Thu, Sep 18, 2025 at 03:02:11PM +0000, Alice Ryhl wrote:
> >>>> Using build_assert! to assert that offsets are in bounds is really
> >>>> fragile and likely to result in spurious and hard-to-debug build
> >>>> failures. Therefore, build_assert! should be avoided for this case.
> >>>> Thus, update the code to perform the check in const evaluation
> >>>> instead.
> >>> 
> >>> I really don't think this patch is a good idea (and nobody I spoke to
> >>> thinks so). Not only does it mess up the user's caller syntax
> >>> completely, it is also
> >> 
> >> I appreacite you raising the concern,
> >> but I rather have other people speak up
> >> themselves.
> >
> > I did not mean to speak for others, sorry it came across like that
> > (and that is certainly not what I normally do). But I discussed the
> > patch in person since we are at a conference and discussing it in
> > person, and I did not get a lot of consensus on this. That is what I
> > was trying to say. If it was a brilliant or great idea, I would have
> > hoped for at least one person to tell me that this is exactly how we
> > should do it.
> 
> I'm also not really thrilled to see lots more turbofish syntax. However,
> if we can avoid the nasty build_assert errors then in my opinion it's
> better. (yes we do have Gary's cool klint tool to handle them correctly,

Yes, thanks. Also I tried to apply this patch and it doesn't always work
because of array indexing usecase in nova, where we compute the offset based
on a runtime register index  (**/nova-core/**/macros.rs). Here idx is not a
constant:

            /// Read the array register at index `idx` from its address in `io`.
            #[inline(always)]
            pub(crate) fn read<const SIZE: usize, T>(
                io: &T,
                idx: usize,
            ) -> Self where
                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,

In **/ga102.rs, we have the following usage where ucode_idx cannot be const:

regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::read(bar, ucode_idx).data()

So I am afraid this wont work. Also even if it did work, it means now we have
to also put idx as a const generic (turbofish syntax).

thanks,

 - Joel

