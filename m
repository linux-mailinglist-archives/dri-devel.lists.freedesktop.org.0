Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4742EC6052D
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 13:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F41910E2A0;
	Sat, 15 Nov 2025 12:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="L3NwxdOS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010048.outbound.protection.outlook.com [52.101.56.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8DA10E29E;
 Sat, 15 Nov 2025 12:38:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2bMujmjoutfuxjrS6p8/LeOQYcHRfzGQm/c/z/lOZzxpHx69vZqvp2teNXJdoJqwQ4Nx5+mIHpJ29J0BxwizWMbOhJ06QqQfu/aIe16UdURcZZ1Hjls/OjzdJZfJAafPwfBCuVH5rvgBx6nTHDT8GZmS8ySfiIH+yq4KGsO5Oi0vekvbQD9il88JmwsmwYC4+Oy/z1e9Mj/wwwkR7u59NZp/tGP2zySnevaGfSjpVg4NEQ81tKiVX+s8REiLceA29lX3yt8iQ/1vK8ls33o7v4PMlh0nH+t/IomC2V1jpYMWHgmMKOr2eBpo3xrLaj2pCT8QeV3GnpoiFSeCe10HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40Z/peEzOOuPbmof/w8O5FEqk9QY8FymouDjJD61Oa8=;
 b=De88cHfGyeSPuW/tTa/oHu217msEmqZoxj5NPh6bqQylwa3fOgsQYZqZqVusY29Lfd3dG7Yxp3+/lw4WzQMrFMa1j52wifbmm7EoJCwk9jFXxSVCro1zYbKm756khRJS/ULXU+m/oq6vZl7U7z9koN+3j+KoFwrcmqlt/bk2rOBkhav8QsgsN9dLh12sH/a9MboJxOr9X4RDSVky8Du8naUFfFkvO1dT1TBvLQQqetdzx8kRk6wRDoMEDvTUNp9sETXMfeuumH4k2RaiuCZa3IeZivAB/pDbdDUx/ElVYgXJZaddF4UjozX9CqDMrVakr4G5hhozfpNhq5SExRUduw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40Z/peEzOOuPbmof/w8O5FEqk9QY8FymouDjJD61Oa8=;
 b=L3NwxdOSJOBJvQ/1SWCQRTtOKByths5oFhatF7vvaupvfcpYKDyOURpZqC6MjC3Y3VOY/8OsVhVLz3jWqyXjpJO1KUqF/BX+BDYUo7pVY0Rm7t01zayX5DjJwXm0MQBthm7EBIP6fi3u7lTkGahIEk8InG1nQRt9d1Zni42C/6RHN2bLts0ZecRDibw1jLokUu9WbDwgwwCRkqLyEgednO4/WjKwh5WujEjeUcadSP1dBfQdJ+yVSkIlNKAhA67obFdh20dvGtRaFSRUERV0Ksni22IfKON+yUuydZVj3L25H88SlROiZNvGDiHbHNUfmOxt1zA94mJFwDAAqG/nWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB8466.namprd12.prod.outlook.com (2603:10b6:208:44b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Sat, 15 Nov
 2025 12:38:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 12:38:20 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Nov 2025 21:38:17 +0900
Message-Id: <DE99VWCDFB64.1CXOJAOU0JC93@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v5 13/13] gpu: nova-core: gsp: Retrieve GSP static info
 to gather GPU information
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114195552.739371-1-joelagnelf@nvidia.com>
 <20251114195552.739371-14-joelagnelf@nvidia.com>
In-Reply-To: <20251114195552.739371-14-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB8466:EE_
X-MS-Office365-Filtering-Correlation-Id: f2d2a711-f462-4c50-76a0-08de2443dbc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFNYTldyUk9oUWpnK0Y1UjVaeU5oSERLZDVpNlQ2dmZsZEhPUTFuWmNFK0RG?=
 =?utf-8?B?VEFZdFFBMk1INUdKTS9jMG9EemhpVGs1dG1mZERsSVppcndnMTI1N3dWS2l5?=
 =?utf-8?B?OUVzQUN4c25hQjZJeGRtMVh2ZEVZcHh6SHNUSm1hWUZFeE9aQzQrZ2djMmFN?=
 =?utf-8?B?NFo0Y014UFQwamZSbnhSV2FwaFhSTEpzN0U1Wm8zSnpLcHliREJCR2NGMVVp?=
 =?utf-8?B?c1RaUHM4dURMUjg1MEJJKzhJWFVJSUZOaGNMT3Rqdk1ZUmdtdjRuaWo4Y3pE?=
 =?utf-8?B?T3o5YVhIMjUwcmNpOHh2ZnBLWnNwek5mTjQ2SWczT0JaRnFBRDRTTEtOQWE1?=
 =?utf-8?B?ZGtLNFZreEZqR3BiWjh6MHhDMk12QklsM3RIRkNQOFZzeDhkbkhMcjM0N1Ni?=
 =?utf-8?B?cHp3ZGErK3I3WmkzODFibmlVeTRrYVJ3eDhPQ05yaWc0eEErcm0wRm5zcmtt?=
 =?utf-8?B?NjNKanNGZDZoOXRsUTNTdzJrS2RFcklQS0luRjJJRVp1ZE9Zd3Z5WWJtQ1NE?=
 =?utf-8?B?aGZGYVhwMW52T29lSEZCZERoODBNdUFsOTdxT0Y0TVdtZS9NVDhKdWVBRWJY?=
 =?utf-8?B?Y0tRWG0rRllhdWVvN29NZkY3SkNrbVNVQ0dQKzNtcCtUQTlXanArMnN5UEVh?=
 =?utf-8?B?b3YxMVY5OWxqQ1NzVXN4c1pSbVNhbW1TcGRhVXB2WXdSempVcTlmRjNjL1Rr?=
 =?utf-8?B?YXB2WjJRUHkvOWNQUThuYnEwb1RrbGMwR0xTYVFkS0JVRHpkdWxsNG1qTTBu?=
 =?utf-8?B?THB3KzE0clZwcUtQcEtaOWw1SUFGbGwxZW9VL2Z4N1N6Q3VwUTZ0Y3hTWGth?=
 =?utf-8?B?V3hDVFJHbzlQRXJYcFRUWFBuNThNdGFMSlBQMWowNnI2RGNwUWVCUXdaVXlX?=
 =?utf-8?B?aUlmRWtzMm83Qkc1TVo4TGpiR2ZWMEJwY3lCT0NDeXhkTXlYc2J5aUgzNDVz?=
 =?utf-8?B?TFlHTHBhaVhUUlZWRWpnYVFDSW5NUGxJN241T3ZqL3p2MEYvK2pQN25CS2Vw?=
 =?utf-8?B?NjY3SVhzSEJjMzkzalRZQ2RhWTFpamZqWnBkM052dnJFWnI3V1VscU54amk5?=
 =?utf-8?B?M0FadEdaNkEzTWVmaS9aaGNidTQ1YkJydDE1ODlYUFF1cUJadXp5TVNyTHFj?=
 =?utf-8?B?MTZUdHZyaHZQV1JDVXNMODJJOVhJQzU3dUFhKysrTzZ2MWlkVjU0RHludzZL?=
 =?utf-8?B?akZjTTc1cnUyZVMyRkloc0QweFdjMW52Zk4yakxncWpISk9HejFIZERtVi81?=
 =?utf-8?B?WFBEVnpsMkZYRis1cU1GUHhGUlc5T2pYWUdKQnQ3eHhHSVgyMmdnT3g2YUsr?=
 =?utf-8?B?eWRrdkpjeEZibS9WUDIwNjF1Z1BlbDlkTWVWby94TXNCQjZ5MWw3NGdETnkr?=
 =?utf-8?B?cHQ4UHRqVUhCRHZaVStOakdYRTYzS3FHS1crNEo4SUM4TXoxYUltN1FCK3hn?=
 =?utf-8?B?UDVZd2s1eThDOHpFVnRCZlcxMUZDN3hxbnVBUUtVZWJpODRIZk1qYThBNnFP?=
 =?utf-8?B?WW9BbFBKUnJVZWIvNFhJNDhLZmpOSmpta3drbzRLRVc1cExjN3JqZ3Z2LzVl?=
 =?utf-8?B?NUtFeVdzTVJscWdBKzFhbXVHODRIQUR3b2dTKzN2cURmdDBTRkFEamRoakNC?=
 =?utf-8?B?Z0lSSHFDSDEyaE1BRWRpOWxUY3VBYy81WFpET0owcnE5MUUzRnpZY21NelFq?=
 =?utf-8?B?Qk1RTnQ3Y0grb0RiNXFmK1VpSkl4MC82cjd2RGM3eENPUXp2Z1BHei9vWmQz?=
 =?utf-8?B?bGlYQXFKMkN0QXhBaU84NGErbjJaN283U0FESkdSMXdMemhCdFV6Y1U4T0Nl?=
 =?utf-8?B?STVob0M2TzRoUVFudUFWMUYzY3BsVzdFZzNjS1VrQlBSWVJUVVdMaFU2Sk5H?=
 =?utf-8?B?dElnUDBUOE01NUpuK2JvMVhPeTBiaWM4Z2dFRytpbllZVWtMQ09jRXZjVnBK?=
 =?utf-8?Q?c02pVzN9nd9nYprzejiYTly5J5rTNy21?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXVuTytGNkE3SitVSmVKcG81L0ZZeDN4YVMxOUlhVUV5M3lYQVFVNXFNQ2tz?=
 =?utf-8?B?T050a0VJSUVBcFl6T3ZvcUx3Slo4NitSVGxGclUyZjJNVmN4Z0hFeUxDV3BY?=
 =?utf-8?B?d1dkNDdEZ3ZldFZGM2VGMnI2YmZBSU5YU21WTWZsM3NmZElEZU1DSHF6WDBL?=
 =?utf-8?B?WldTM3lBWVV0ZGxvbmxHVXQ3SmViV3lXTm5ra3RUY1pDL09QcEZzRzFOU2x4?=
 =?utf-8?B?dm5LeEpXVkg3OEgwb0w2ejZPYUZncklBZHlkL252VTZFenhCY0F3cnFibGFB?=
 =?utf-8?B?OVhwOHZxQi9NTVVpY3NaUXhUbEtabS9zU1ArUTJvS010b2dkM0xzYzNjZXFu?=
 =?utf-8?B?QkNhL0Ntajd3SWtid1VQYXZZS0tIU1dhMDcyd2k1WGhGdWNTRXFGbkNGZHFi?=
 =?utf-8?B?RmZWT1plMjRwSzhWdnhyRzJrYmxiRDJhSS9MQmdIbWJvVzFRYnUyeHVnbUU3?=
 =?utf-8?B?VnA0TGd2cXBHdHhpanY0cDlqK09zTllDeDRXUzl2QnNlWjIwNWlyMTk3em5C?=
 =?utf-8?B?emp3S001eEpOVUxDNmoxenBGTHUyYzBYTkZLVStWbVphUTV4K2g0YmRQOStU?=
 =?utf-8?B?aE9nYlMvNUJ2cTJkSmQzTTI1TDE3SG5zUkRrdmF3dGR6QkdPUVUvb3JEenFL?=
 =?utf-8?B?cmREVG9QajEzRG9OUnNMR0JoemRkU3FmQ1U0eUs3NlVHS3dIVHBRVmc1NXBa?=
 =?utf-8?B?R3pkLytQUVNhNzNUczBZak1FU3R6enY4MzBQNm9aMXRpaWxyTTBhQUlaYlFF?=
 =?utf-8?B?d1VIeUMrMmRuQTRRNko2c1JBUUdNdmtwcmNGZzF0LzdUdUVoZ3ZCQ1M1Ui9k?=
 =?utf-8?B?bEVOMUlNeFY3R0QvRzE1cVBnR1pTd0h3bG9lUFYrTHRUei9Qd3Z0UmF6QnpE?=
 =?utf-8?B?cWVQWXhCay9PcGVaMkxuOEcvdjZJRjEwQkFVR0N3TmVNanVyaUIycEw2d2dy?=
 =?utf-8?B?NWZCRDA5bjczYVV1Z0hTbHVEa0JNTUNjVUtkakRHYzdCait4ZURpTitNVU96?=
 =?utf-8?B?YnU3U3R5ZEtVWEJFOXBLL1gvaTdsSU9DNmpqbXMrM0RIMzJtVHR5WE1BQ05n?=
 =?utf-8?B?UU5yZExSQ0h1UVk0NkVqclc0UkdNdXZwMDBtWEF2LzVGRmoyakthSVFlZ1A5?=
 =?utf-8?B?RE1Fbm01ZUtEelgwL1dMbm5GU2NiMjNzbitjSnltbnBPUXlZYS8vSk4ranY4?=
 =?utf-8?B?QTdRbTBKQnJNNUFCenQ4MXkrT0cvb2wybDNXVmx4ZlhLYXJkcjJ4aXNnWmVl?=
 =?utf-8?B?eHVMNk9RbDVSK2c0VHNWV1Z1eU5yYk4wMHkxMEZBNUhDZTlKd0VRalJQbHRZ?=
 =?utf-8?B?REJiUUplK2lRRTlvQ1V4V3FUK1RRUFFjZEJUSnFjcHY1UnJvRmprdFZTTXVl?=
 =?utf-8?B?NW1BaWcvQW1JYVdqOWdhem9Eam4xZEw0L1orRWZJSHJzRC8wL0wveFlKWUpT?=
 =?utf-8?B?QXFVRU9ycUkzRUdHMVNFU1dVWDlQdzcwOUtwbnR0eXVlKy9qY0MzS0NSVEU4?=
 =?utf-8?B?VEdmVy9WNzV5ZVNzdTRPaVBRem5RZjlqc3MzdVZjUUFwT21QY2xaRUdVU2Np?=
 =?utf-8?B?WEE5Wjg4bUMwQjRwdTNIbkI5MEJNUUh2ZGZ0ZUVuZHI0WnhQTkZIeWxiM3dP?=
 =?utf-8?B?VS81QnhUNVRUK2tLU1AwSFdvRFFQM3ZJUW1EYkt0cmNsZVM3a2p3cFQrVzV4?=
 =?utf-8?B?cmh6WE5SWUlkMWxJSG00SXI5QzRaWDhUMExMWFEyNkQwdU9uWkpZakRwNlBO?=
 =?utf-8?B?TkJsTmp0Y2ltdElJZnZ6TWQ1RkU1bnpzWXBzTE9jNmtSdWJrLzNUd1VIeVI0?=
 =?utf-8?B?OUI4SGYzcVpiRDU5RmxzYlVvWGd6OXBBTlE5R28wdTNUTk85TlovR0dFOWtS?=
 =?utf-8?B?bGI2SXJZaU9vMDFpOStkRCtOL0t5YzByOG9iNnlLWDhSQzlzMlRVaG9oTkJ6?=
 =?utf-8?B?K0ZTRWxXYm9BdWhRWkxrUjVLZzVNTjdxbStTUE8weWNFcDJwQmNZM1NvNmdY?=
 =?utf-8?B?OXFOWm5DTjJsa1hGRXZYWitHd0QzL2d0alVlTzRKZ0dwQUV4Tmh6UFdDRWJo?=
 =?utf-8?B?aUY5cFNNc3RERHlST3hoMWN6T2dsZjJzYldDZm93QVhlTzdrTFZ1NllJK1Jq?=
 =?utf-8?B?Tk9YZGJURjZheG93YUdua2xGQWFiT2R5cHFQeWN1eEkyNExCQTFwSitORzhR?=
 =?utf-8?Q?acoAfdJ3i3i7UtMgpzyP4mBiTN4nXrosNtmtZgd+YHHX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d2a711-f462-4c50-76a0-08de2443dbc9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 12:38:20.3812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjUC39QA/VoxH2IVYoI3wYJmbCcgEI6MuPzMZ0G34HEoxMa5nANIvuTdzt4TjxDVcE6zHONSIV4NoNfhWP4rGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8466
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

This one needed some rework.

On Sat Nov 15, 2025 at 4:55 AM JST, Joel Fernandes wrote:
> From: Alistair Popple <apopple@nvidia.com>
>
> After GSP initialization is complete, retrieve the static configuration
> information from GSP-RM. This information includes GPU name, capabilities=
,
> memory configuration, and other properties. On some GPU variants, it is
> also required to do this for initialization to complete.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/boot.rs             |   7 +
>  drivers/gpu/nova-core/gsp/commands.rs         |  65 +++++++
>  drivers/gpu/nova-core/gsp/fw.rs               |   5 +
>  .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 163 ++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs            |   1 +
>  drivers/gpu/nova-core/util.rs                 |  16 ++
>  6 files changed, 257 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/util.rs
>
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index c0afafbf35f6..42a3abb9243d 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -40,6 +40,7 @@
>          GspFwWprMeta, //
>      },
>      regs,
> +    util, //
>      vbios::Vbios,
>  };
> =20
> @@ -237,6 +238,12 @@ pub(crate) fn boot(
>          GspSequencer::run(&mut self.cmdq, seq_params, Delta::from_secs(1=
0))?;
> =20
>          commands::gsp_init_done(&mut self.cmdq, Delta::from_secs(10))?;
> +        let info =3D commands::get_gsp_info(&mut self.cmdq, bar)?;
> +        dev_info!(
> +            pdev.as_ref(),
> +            "GPU name: {}\n",
> +            util::str_from_null_terminated(&info.gpu_name)
> +        );
> =20
>          Ok(())
>      }
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-cor=
e/gsp/commands.rs
> index 07abfb54f9d7..6cb32e7d3436 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -17,6 +17,7 @@
>  };
> =20
>  use crate::{
> +    driver::Bar0,
>      gsp::{
>          cmdq::{
>              Cmdq,
> @@ -25,12 +26,25 @@
>          },
>          fw::{
>              commands::*,
> +            GspStaticConfigInfo_t,
>              MsgFunction, //
>          },
>      },
>      sbuffer::SBufferIter,
> +    util,
>  };
> =20
> +// SAFETY: Padding is explicit and will not contain uninitialized data.
> +unsafe impl AsBytes for GspStaticConfigInfo_t {}
> +
> +// SAFETY: This struct only contains integer types for which all bit pat=
terns
> +// are valid.
> +unsafe impl FromBytes for GspStaticConfigInfo_t {}
> +
> +pub(crate) struct GspStaticConfigInfo {
> +    pub gpu_name: [u8; 40],

This is probably meant to be `0x40`, as the `gpuNameString` bindings
member this is built from is 64-bytes long. Changing it to be 64-bytes
long.

> +}
> +
>  /// Message type for GSP initialization done notification.
>  struct GspInitDone {}
> =20
> @@ -62,6 +76,57 @@ pub(crate) fn gsp_init_done(cmdq: &mut Cmdq, timeout: =
Delta) -> Result {
>      }
>  }
> =20
> +impl MessageFromGsp for GspStaticConfigInfo {
> +    const FUNCTION: MsgFunction =3D MsgFunction::GetGspStaticInfo;
> +    type InitError =3D Infallible;
> +    type Message =3D GspStaticConfigInfo_t;
> +
> +    fn read(
> +        msg: &Self::Message,
> +        _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
> +    ) -> Result<Self, Self::InitError> {
> +        let gpu_name_str =3D util::str_from_null_terminated(&msg.gpuName=
String);
> +
> +        let mut gpu_name =3D [0u8; 40];
> +        let bytes =3D gpu_name_str.as_bytes();
> +        let copy_len =3D core::cmp::min(bytes.len(), gpu_name.len());
> +        gpu_name[..copy_len].copy_from_slice(&bytes[..copy_len]);
> +        gpu_name[copy_len] =3D b'\0';

We will want to move this into an `impl` block of `fw::commands`, since
`gpuNameString` is supposed to be firmware-specific and thus private.

But actually, do we even need this? When we print the GPU name in
`boot.rs`, we call `util::str_from_null_terminated` again on the bytes
array that we copied from here, but it is guaranteed to succeed if this
call succeeded as well. So I think (and successfully tested that) we can
just expose the raw bytes array as-is here, and extract the name from a
dedicated method.

> +
> +        Ok(GspStaticConfigInfo { gpu_name })
> +    }
> +}
> +
> +// SAFETY: This struct only contains integer types and fixed-size arrays=
 for which
> +// all bit patterns are valid.
> +unsafe impl Zeroable for GspStaticConfigInfo_t {}
> +
> +struct GetGspInfo;
> +
> +impl CommandToGsp for GetGspInfo {
> +    const FUNCTION: MsgFunction =3D MsgFunction::GetGspStaticInfo;
> +    type Command =3D GspStaticConfigInfo_t;
> +    type InitError =3D Infallible;
> +
> +    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> +        init!(GspStaticConfigInfo_t {
> +            ..Zeroable::init_zeroed()
> +        })
> +    }
> +}
> +
> +pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GspSta=
ticConfigInfo> {
> +    cmdq.send_command(bar, GetGspInfo)?;
> +
> +    loop {
> +        match cmdq.receive_msg::<GspStaticConfigInfo>(Delta::from_secs(5=
)) {
> +            Ok(info) =3D> return Ok(info),
> +            Err(ERANGE) =3D> continue,
> +            Err(e) =3D> return Err(e),
> +        }
> +    }
> +}
> +
>  /// The `GspSetSystemInfo` command.
>  pub(crate) struct SetSystemInfo<'a> {
>      pdev: &'a pci::Device<device::Bound>,
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index 0cce54310c35..5b6a906ff5dc 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -882,6 +882,11 @@ pub(crate) fn element_count(&self) -> u32 {
>      }
>  }
> =20
> +pub(crate) use r570_144::{
> +    // GSP static configuration information.
> +    GspStaticConfigInfo_t, //
> +};

I've replaced this with a dedicated wrapping type and supporting code in
`fw::commands`, as is done for the other commands.

<snip>
> diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.r=
s
> new file mode 100644
> index 000000000000..f1a4dea44c10
> --- /dev/null
> +++ b/drivers/gpu/nova-core/util.rs
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/// Converts a null-terminated byte array to a string slice.
> +///
> +/// Returns "invalid" if the bytes are not valid UTF-8 or not null-termi=
nated.
> +pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> &str {
> +    use kernel::str::CStr;
> +
> +    // Find the first null byte, then create a slice that includes it.
> +    bytes
> +        .iter()
> +        .position(|&b| b =3D=3D 0)
> +        .and_then(|null_pos| CStr::from_bytes_with_nul(&bytes[..=3Dnull_=
pos]).ok())
> +        .and_then(|cstr| cstr.to_str().ok())
> +        .unwrap_or("invalid")
> +}

Let's not decide what the behavior on an invalid string is for the
caller, and let's make these cases detectable by returning an `Option`.
The caller can then `unwrap_or` it as it wants.

I'll apply these changes locally before pushing, as they are mostly
about harmonizing with the design of other existing commands and don't
change the behavior in any way.
