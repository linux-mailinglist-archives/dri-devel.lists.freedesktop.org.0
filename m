Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F699B3C59B
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 01:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C696510E050;
	Fri, 29 Aug 2025 23:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="T1xMVhio";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2083.outbound.protection.outlook.com [40.107.101.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5951A10E00F;
 Fri, 29 Aug 2025 23:31:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djMNi4b/od/nXjLDtHtd2equpmQFLENk2NTt2lbULybBhnnxXaZ8NVNN3VmYRiapWRfjHH1+/LYv0PhI3NVZxY0Ptd0T6Ok8H4B9XejT9KC45a/g6WldHXg7VQF1gPugiwzPOQwr0LONzwXlLsnqID00U0qSrRYGJnjE2DyrlxlpSXY36cRv9ZDg07Td2aXVF7JPx0c2XOP5mZc+4+xEoakI0U57xt5Rx5VCr49J7OV00wlyXBGiB72/tFQsIWlXfBEsxODVLNfH+Ff9KO3kOjA717xk+2oAYpKSM71NXmFQrxOqLLfC4AYvZqbpOvE8vEzc2Lmj0Y/qFHqEHaJd8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Txo45vvy8ShbFpHkoohM5yVX9KnMdXLr6fDlyfu6B1U=;
 b=RVZH00Np5Qtg7heXp/veGalTMYHShTbGwukM/i3EnietSjD1eobcgU/b9aQmS2mCDUIpHBtYoXqifX5DP1MzS4j5rKJb5OSNfAG42/kwvGqP4Zl18sfFioVnOTvsZbxTW4zDMtQ03uCSCb3lTkTSw+hbrj79xZTJYWKdwbxE43JMS7Amc8e++/wWE5J9vgRQmWLnagHVYey5OEX6C3zHTzqLd7ydFT0EVeMqW2FARXPG7AuE9cFAoM/sza9zSrTPMn6f5VUq793qJkTQ9G2TR1be4T81/rwhsaRToI3AiaSPjiEp6l47KDAEYg0z8keJDa9sueT6gGKMJWTSQZVzUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Txo45vvy8ShbFpHkoohM5yVX9KnMdXLr6fDlyfu6B1U=;
 b=T1xMVhioXZi2oRLwcw/ehvnh9NzcLeFIycuH75bAIlBR/KCTyw1TzhQKV58I7HoUq8jR7E/y6HbDa0ij7tCbg7s73O7XCqeRl1zKanEgJBF7yFRrqKuaJdckh2oVkDgNPcRwrfuiQ0WzP1M4ZIh7ZDIhsz24npbJwI0JpPd6Afoc+EtXSXpLHTgnkSifoKhIXruUSjRmuIlMm4FLrqpiFc3cWytiBuja47ljRK8KNuxmmK0zVZpKGlzq/BSgM/3W/gZWwHjiPJfgq89ySKBdE8MOE8+N3RnDFvSzIIJkNjQW79rd+5OTkZ/NDZ6NAJM9oB9Cy87vJpwKZprV8wUWEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by SA1PR12MB6994.namprd12.prod.outlook.com (2603:10b6:806:24d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 29 Aug
 2025 23:31:01 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.021; Fri, 29 Aug 2025
 23:31:01 +0000
Message-ID: <e091c6c1-98f8-4876-b2f1-c928da7aa7eb@nvidia.com>
Date: Fri, 29 Aug 2025 16:30:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] gpu: nova-core: compute layout of more framebuffer
 regions required for GSP
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-8-93566252fe3a@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250826-nova_firmware-v2-8-93566252fe3a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0123.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::8) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|SA1PR12MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ad246a4-8d82-4a94-25c6-08dde7541d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2w2d3N5R0FqS2hhQ3ZWNmo3QmtzTkh2TC9wVVdRdjltb3hmYkYwMkprUndC?=
 =?utf-8?B?ZktDVTZYRTgzWm53ZDQ3SG1LNWphNGNMUC9HSDd6enFKaXVqTThuL2IzNHgr?=
 =?utf-8?B?YkJYeU9zYXRJZVh6NmRHK2hxb2tsckdTZ0JVS1F3bko0SnI0bDYvd0pTRnc0?=
 =?utf-8?B?Q0NYSmNEU2ZRVEJTU3ZHZWNQem9ZVzlJN0dvb1lQdDFiemtPNkYxN2hlU0lQ?=
 =?utf-8?B?aUwyVmFMYWlKeUdObDFSTGZnRXVCTXh1T01namhqMFljQTQycmZueEUrRXk2?=
 =?utf-8?B?aDBLYzFBQkR4elQvK3A3U2xBT09oUXB1cTJ4WFZPYXgyN0F0Y3Avbm9XNGlC?=
 =?utf-8?B?NVZLN1J5SFRBQUxuR1ZnTjlMenpnY2Y1N3hIU2RWNGM3THVveUd3eXYvWE96?=
 =?utf-8?B?RHZWbmhpZEMvbjRIR2NDb01LZUxlTFViZERaZVZNbC9SZmlrUlpSbm92ZDFY?=
 =?utf-8?B?aVVOZXdwU3dBME1EZFJwcUYrWXNpbjJwRldzMDhoSWVWU3B5RElYdDBiaWdX?=
 =?utf-8?B?VGo0NWgzSEx0dnlkN3c1MUFFMWJMK3ZiWHpoWUl5Z0w5UEZhZUpXY0pXaGdq?=
 =?utf-8?B?Vkt2OXR0bW9XQ2JUMzN2b0FjZVFGOWpTQ2hpSnBwTjNCMXNLVE52d0dCWjlL?=
 =?utf-8?B?N2V0Q0NLbU5ZSk9JOW81b2wwYTFGNm9IY21kK3NLZUpiTGVYc0I1Q09tdnha?=
 =?utf-8?B?RHlROVRiRDdYdjRSM3IwS25KcEZpYmJDcTVkSjNTb2VFSmhaSUNiR2ZJTmNB?=
 =?utf-8?B?NG1zYVltZ1VnUmgvYVFDdXZrbHRNdTh5MnFOS0ZiR01VS2RBa09nZEpZRnB3?=
 =?utf-8?B?Y2xsQUxjNzFGY1FvT0ZhajB6K0hoWkljQllmaEdnQzNJeVhWSzlVcEJheUdJ?=
 =?utf-8?B?RDVYdGRBOWszdUYxdGVWbGg1MVhFbTdnRjFRYVlrYUpMSTFKTi83RVBBMFZH?=
 =?utf-8?B?SDNMV0xTYkhXSm1kQ09lVGMzOWZyckZ0c0t5NlVoY3ZnVHVkLzVjMnlCUmZ1?=
 =?utf-8?B?bW91Si9GWXRiUzlXTUhRUVhhOHRxR2VpK2VldENzZkQxUTlteXNCVnR1WEpy?=
 =?utf-8?B?MnIweGxoS3JLYXdpYkkwakttWEFNa1pGMDlGc0NrTFY0UGZydnlKNE1uTTZ1?=
 =?utf-8?B?K2dpdFNyaGNlWkJiZTluTHdDVXVCOFhiK0hUb0pEY3ZVTnhlanR5dk1wTjZO?=
 =?utf-8?B?S3Z2RElhS2NVM3JYR2ZmQjlDZ0VuYmk3WXQ1bUtIZzBEVmF6VlFZV210WWVC?=
 =?utf-8?B?cTZkWVFSdjFNeFVMTUp1NnVaQWY4VjVqMnFrSGtjajBNb0NWWGozY08yTkpN?=
 =?utf-8?B?WG9OZVBvNk42cVhxZUJqRGpNWGtNTnhDa3ZUODVocS9pOEYzUVc0SXJjUndj?=
 =?utf-8?B?SjNPN0VVaUR6VnNhYThLL1FLL3FTTWhkcjlCNVJlRWVVQ0FPN3dnTHMxUFU4?=
 =?utf-8?B?Qm9ZY1pFdkxWT0Z2ODJjZ2VxMW5hVDNsY0ZpcWF2c1hwZnlDZ3h6NHovTHNY?=
 =?utf-8?B?SWNLYjcyL3RCNTlEK08vY1gyUWFwd0o5UExiQ1hacGFnM1RWeGt3a2dsM2NS?=
 =?utf-8?B?dDVZdUtzZEhhMXgwRUVMNEtwTUN2ajErVkdmV3hQRmtJZzRLVnNsbTFQd1d2?=
 =?utf-8?B?eUJLc1JhazFlQ3VjZGFnS2dtNHN5UFF2aFNiMHZCMm1UaS9qQzR1dklCbG9Q?=
 =?utf-8?B?SE8zVFBwT1pOeFZVZzNPVUNiRnRhMUoyQU9sdzduZTI1b1lVeUFRRG56bnIz?=
 =?utf-8?B?R3BzRkthRlFyWGVGWkMzaGh4TFNGeDB0R0MzelNJMWRsdHg1YW5sYzk5Ykk4?=
 =?utf-8?B?bUFJQXZBbGplRFNWUGlpam9GQU5vaW9HV0lEVi9lWmtwMWVvNE1lbnJqekNJ?=
 =?utf-8?B?bk82emtWdUJyTGd2M0tDZjZjc1JFdzN4MjIyd1VRRjFOVEk3YUl5ZnJEYmlV?=
 =?utf-8?B?L2dpM0xIMmFhdkRkL2ZjZUsyWSs4bVN0VTd5L1QxUDBpNGNDQWlLY2JIY2Va?=
 =?utf-8?B?TTQ5UVozT29nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHV3dTFGV2NZTndqdWphZExWbDVnZUtEeEsxTTZqT2RNMjJJc3dsTU1mWmRE?=
 =?utf-8?B?UVBHVjhqUHY4TU5WcXg1dm16TFNRMmdqdHBSSmtCcnVid0ZLTnlJWDdUZ2ho?=
 =?utf-8?B?czRVWm5vVzRMWmRueUZrSmwxREtBVXFlNUkwRThlWFBYc0Q3ODludGczUHdz?=
 =?utf-8?B?Q00xRUJVdDZQdldoeFlSYlhrNlAwVHNzN1ExQVJDSmFjUE9wUmljUWl5TzB4?=
 =?utf-8?B?Rkw2bExjNHpQM3h3Z3ZpLy9TTVJMVEJ6Nk1OWVN6YkVERXYyT0xBMll4L1pW?=
 =?utf-8?B?dG1ZRG9SbUtHSjBDZThKWi9vdWJVSjVBQmlaUVRyYXM3dU5EdVZXdVY1UXdq?=
 =?utf-8?B?Yml1MTRCWGcyN28rbVZHQVRHZ0tYK0RBQ0xuOW03Y3FkRi85SVRQWDZqVEpC?=
 =?utf-8?B?bzFNOGNaclBISUFhSkhlYkk2Q2V4Wk1uakpBa29kY0lsanl0amhsMENWYlVU?=
 =?utf-8?B?cnZndlZtQmhxb3BQUElJQVgrdFVUM3hqanVDSnBWQmxLNjVXT3J0QkM1Z1Jv?=
 =?utf-8?B?QWhxY3A5ZEcxYzIyelI2bi92NkNZakI4MmtXS2ttWGtOb25Yb0lYNU1RUDlS?=
 =?utf-8?B?bE9oQTRpMTk3QlFzSk1yS0s1U2hMS21sYjg4TzFlZWhNMDVFeHdKeGQ2S1cz?=
 =?utf-8?B?NjlTTStOczFJZEVoVld0blRXOTJKYnIyVFNvalp6dHZMYXNaU2kyYnNiTit6?=
 =?utf-8?B?cWdZL3FwQ29UazZjZEcrb0t4TTgxVDY2ZVBRVnh0a05zUmF4VkJDN203TmhJ?=
 =?utf-8?B?Q1J3RlUvNEJQUHdqOVZCMXBkYVRLVGlmLy9zR0JXVEcvVUYvWWIwVDRwWGx4?=
 =?utf-8?B?UFY1Ukp4Q0htdFYxQnVPcDRUWFZ4SEhjcU1nRTdSQm5Ca3F4Z08vMTluZWVv?=
 =?utf-8?B?d0srTTZCTkU2ZW9YcGhjWnpzUFM3dDNxWFh5UlQwcnkvYnM2WUt4SHNac2M1?=
 =?utf-8?B?NmZ0aHk5ZERzazdvdVlYazkwdlNjd2VwSG02Zk9CUVBqV0xCRVhMYnVNcnNQ?=
 =?utf-8?B?NXkyNFNHWkowanVrUnpMVzNHdy9Uc3RISnl4TUp0TnFNeiswNjVUb05SNEIw?=
 =?utf-8?B?NU5INHM1UnpvZncxL0RWUnZ4M29RZFJUd1JEd1NWS01JMWpnekQ2UlNrUXhu?=
 =?utf-8?B?eGoxN0NNcjBiMkJGaEp2SlFtUHZRN1BHTGUrczQ4QWtGREFPcHl0RndWaDFr?=
 =?utf-8?B?RzhFRjRzMHRnTUxPRzFheForbFFRODYxZ2lQSGtPMVppNXRkamwvMGpwNCt5?=
 =?utf-8?B?bU5lbG1hRWI2SDBCL0doemw0QWpETWJ2MWJiNm1rQ2pUU1dZMlBYVlMxd25D?=
 =?utf-8?B?T3N0ak01aDBuNkREcXdkS0t6OTZUaXNicUZuYVM1M1luYUJXS05hQkNibW42?=
 =?utf-8?B?M1NzeldhMEhHRHluVTJhOXZNWVUwYXhXV1NKY1RmNG9qRjVDT3BpUUZCMTkw?=
 =?utf-8?B?VmFFOENiUzhKb2xpS1BGSWsrVjBNVnZKdHNFM2JadkVLeCsyaUhyYnhYTUor?=
 =?utf-8?B?Yzk0MDZtQktUU2FuaEZhMFYwVFJYUmpRa0lTWmhnRzNndXZIVHRzRis4YnlB?=
 =?utf-8?B?dGU4WlJvZ0l0UTZOMTEwTFU2Lyt4Zk9XM1RRRkQ2eEsra0lUUjFtZzR5T29K?=
 =?utf-8?B?MjVRUXluODhlK1JxemZoU0F0U0RIZ0dDZ2NHaUtvRmRUUzEyS1dOQUlJRW80?=
 =?utf-8?B?Z3F6dGFuYlpTeDhJMjlBSUJlZkJlc0xXRGExR0pFMDNBRFovU000V3hqMy9W?=
 =?utf-8?B?V25lUXVnRE1EbUgvUkU0dHdhVjludkU4Y0ZTdi9BRHFidW5lbTAwSGxBVHhv?=
 =?utf-8?B?Y01YZEwwWndCc1hxb2lMeENadUlXTzBYUmhmTm9mbXJRWVdybnZzUmxZOVRU?=
 =?utf-8?B?cExOcjhLNVYxbmRka0JQTXhueUlSS0EzWTRIYkVhOXd2emVWVTAvclk4VG5E?=
 =?utf-8?B?eERkenFKblZmZHAwRVdxa0t4eVUvVzFKMEZhNzFMOExmZWp2VXdISktYd25Q?=
 =?utf-8?B?SlRvSW5WQmw4YWs0NUxKa2dsdlF4NGNaSDhEVGNFdU05RWFTOENRL240Yk5z?=
 =?utf-8?B?eEJUUzd6VStVMU5vVDZmWEg4VDJQbmdSNEhXYnA5RVE0a20rWUkrTWFJaHZ2?=
 =?utf-8?Q?BXE+DYgNdB/3dGxqjbCYMzOL7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad246a4-8d82-4a94-25c6-08dde7541d64
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 23:31:01.5227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWwbkNIOFh1zLAnvRUL+91EaGoJTx3BsOOpj/+DA2DZt9sjE0o+b6AXPePLa5D+19jbKKXd6WrNj+vPhvJQbeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6994
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

On 8/25/25 9:07 PM, Alexandre Courbot wrote:
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index b0e860498b883815b3861b8717f8ee1832d25440..a3eb063f86b3a06a7ad01e684919115abf5e28da 100644
...
>          let fb = {
> @@ -138,10 +202,54 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
>              frts_base..frts_base + FRTS_SIZE
>          };
>  
> +        let boot = {

A few lines earlier, not shown in these diffs because it's not part of this patch,
there is a closely related TODO item:

            // TODO[NUMM]: replace with `align_down` once it lands.
            let frts_base = (vga_workspace.start & !(FRTS_DOWN_ALIGN - 1)) - FRTS_SIZE;

...which I think could be optionally fixed now, and added to this patch.

Or it could be done later, in a different patch, but it seems convenient
to merge it in as long as we're here, and using .align_down() in this patch.

...
> diff --git a/drivers/gpu/nova-core/nvfw.rs b/drivers/gpu/nova-core/nvfw.rs
> index 7c5baccc34a2387c30e51f93d3ae039b14b6b83a..11a63c3710b1aa1eec78359c15c101bdf2ad99c8 100644
> --- a/drivers/gpu/nova-core/nvfw.rs
> +++ b/drivers/gpu/nova-core/nvfw.rs
> @@ -1,3 +1,42 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
>  mod r570_144;
> +
> +use core::ops::Range;
> +
> +use kernel::sizes::SZ_1M;
> +
> +/// Heap memory requirements and constraints for a given version of the GSP LIBOS.
> +pub(crate) struct LibosParams {
> +    /// The base amount of heap required by the GSP operating system, in bytes.
> +    pub(crate) carveout_size: u64,
> +    /// The minimum and maximum sizes allowed for the GSP FW heap, in bytes.
> +    pub(crate) allowed_heap_size: Range<u64>,
> +}
> +
> +/// Version 2 of the GSP LIBOS (Turing and GA100)
> +pub(crate) const LIBOS2_PARAMS: LibosParams = LibosParams {
> +    carveout_size: r570_144::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2 as u64,
> +    allowed_heap_size: r570_144::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB as u64 * SZ_1M as u64
> +        ..r570_144::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB as u64 * SZ_1M as u64,

We only support one version of the firmware. And in the coming months,
that one version will have a different version number.

Given those constraints, we should simply remove most (all?) of the "r570_144::"
namespace qualifiers in the code, starting here.

That way, we get:

a) A small diff, instead of a huge one, when we update to a new firmware
   version.

b) Shorter, cleaner symbols everywhere: GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB
   instead of r570_144::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB, for example.

> +};
> +
> +/// Version 3 of the GSP LIBOS (GA102+)
> +pub(crate) const LIBOS3_PARAMS: LibosParams = LibosParams {
> +    carveout_size: r570_144::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL as u64,
> +    allowed_heap_size: r570_144::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB as u64
> +        * SZ_1M as u64
> +        ..r570_144::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB as u64 * SZ_1M as u64,
> +};
> +
> +/// Amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to and including
> +/// the first client subdevice allocation) on Turing/Ampere/Ada.
> +pub(crate) use r570_144::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X;
> +/// WPR heap usage of a single client channel allocation.
> +pub(crate) use r570_144::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE;
> +/// Amount of extra WPR heap to reserve per GB of framebuffer memory, in bytes.
> +pub(crate) use r570_144::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB;
> +
> +/// Structure passed to the GSP bootloader, containing the framebuffer layout as well as the DMA
> +/// addresses of the GSP bootloader and firmware.
> +pub(crate) use r570_144::GspFwWprMeta;

thanks,
-- 
John Hubbard

