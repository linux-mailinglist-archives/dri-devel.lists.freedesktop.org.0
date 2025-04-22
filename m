Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8960A974A7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 20:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0B910E048;
	Tue, 22 Apr 2025 18:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AENrfvqT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EC110E048;
 Tue, 22 Apr 2025 18:50:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8vKXxTRi6Ol6PBROnmgQicl9PcrikLO8g0oF/Re0DxrSQgMnMTJEcvZ2DkpDqeNABgv6UfSnvyJde7E/0Ltx/DkVS0nVQfCWiPNoIjGq1ry1PIYmDtmAeOY53Cf820a+0nOUQcw8DTPr73HUnNeb2rHQk2EGTN82pnxoHoL9xqgZ3XSNmNSY4RPYfEUY+JCHm1siNVqHJTpvvm6FCo24NDVnHYARzPjHHkV7fTcf+0H/TqXIaVZKfXPaKbk640/nE8/yhAJwV32sLRgpD4U3Jn9UJVi4hd3aok/ViB0WTfUOUOJz27EcqPjXB2fA1kbF7f2+ae0FdOIf/iL1PYFhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUDwaZhurM/p2mH+vOaXBIKHmiwNA+YCrjwHIgZsmnE=;
 b=iexeCCkf5sZhgnH6ZXb9EjD9L6ZudEvsCfiXVyN2IfUs5Uz3BvvAJr6CpTNbR8JogeCDZ9Du51vHx6lAM6Aq0C1qBFjZmGXAibO3HZ7adBpve9w8Ox7Ha4zYD2vQ2UA1vYzJPGp0OsZG2Szk3BaTZ9NCIaYOayNVSsspmwjNae7A16PaoXafawp9BE4OWP4pQGBSRU+/rkOBeyHAcKSlZ1XldFccbzCtUmFyaKaF4jdYQ9/fxey+7L3NcO1dxEZGzmbRE9/ZGhh0U/PY10aK3mRrv37n8hLPERjXgBe/AMNjVtlkFwqEZIlad4tSZvi56SHdhNSvQROGGAOoHai7Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUDwaZhurM/p2mH+vOaXBIKHmiwNA+YCrjwHIgZsmnE=;
 b=AENrfvqT9/xIYst6Fop9x2CX5mLAciXwu1AOXUq9++S1bQSwRHK+Iai/o3k6PGZJOxNmzHFBaWi6zHs5fuUtEy2LTaDRxIkzR2e44NpIgVivt5IBEEpHp4wDAFcj39sPsTOJpCjf4DCPx4kwMvSkIXNjZWimDD0mEG9Hdu2hPp0PygYH+1ZEmWX/+AVy9WW7mPoTSmgtL38oyHyrjcnJq8MoiCuFSWjEv/J0yM2T66Zw5spMwH6N2zyBgaamgF3aSBsnUy0qpBKX/PTfICBr3/lfGDs0s+CfWgKjSOS6GWyN74TOAizOkrdd8+sIzspT7QuxKtD64HrN0Y4705o2oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by LV2PR12MB5727.namprd12.prod.outlook.com (2603:10b6:408:17d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 18:50:28 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%6]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 18:50:28 +0000
Message-ID: <c7c47d24-4a09-4fdc-b356-168dccd06008@nvidia.com>
Date: Tue, 22 Apr 2025 14:50:25 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/16] gpu: nova-core: register sysmem flush page
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-9-ecd1cca23963@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20250420-nova-frts-v1-9-ecd1cca23963@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0974.namprd03.prod.outlook.com
 (2603:10b6:408:109::19) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|LV2PR12MB5727:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ae16e0-0e24-44b7-bae2-08dd81ce8c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGczckQ5eHpub05TNnZEcGNtcEI5WENZdFdadzg0ZjRWeThyd0Z1bDhGM3E4?=
 =?utf-8?B?UE0velZSSnRXeUFaQ0ZoRVA5eDM3OGtaOC9tTTBUU1p2eFdtdHRYLzhsMHJh?=
 =?utf-8?B?NmVOQm5ZTTNmb2hBRm50Y0lIUVVaQVBNRUFtamRZdEU2ZnU3MEFGTUxZYVV2?=
 =?utf-8?B?TEsvTnhxTVdRNUJxdXBMSnhQam8wU1VmQ2RsaVh5N1ErNkVrNUZDbXhNQkY1?=
 =?utf-8?B?MXp1K2lZQ1UxeFB1M3g5OHlNbDRQbjdjYXBtbVI5QUZDcnd2MXFrZStybkp2?=
 =?utf-8?B?aHk3K2M1czhYcDJWRXhWQVVzVnlVY3lEb1lYR0NnWEpzeXM2YklJVnF6L3cv?=
 =?utf-8?B?TjcxaFdKQTRWYXpSWFVjOUNKdGxhcDM1MU9QQjE3ZFVHcTI2V0tuaVZtNHhk?=
 =?utf-8?B?K3padFlsWEREalFTcVAwZ0VTMW1hZmFkdERuZ3RJVjh3QWp3bVorY1BPYUJx?=
 =?utf-8?B?M2wvRDdIdHR0Z0l4L1lVcmlHeC80Q1hhbStMNXRDQm9KNjRFWUdQd0JkTXlV?=
 =?utf-8?B?THV5THVqeDVCNUkreWlUbjJhYi9sTEdLVlR0M0xUZG93MHl5RXNYMEp4MmN3?=
 =?utf-8?B?ZVFaVTRzSDFHelkyektlK3RSK1JETUtDbEVPVWRjWDJYY2p2WXFaanBFL2Nx?=
 =?utf-8?B?S2lrWXhMRlF0N3BmRmR3cGRTS2JrZStvb05icGZPSTNJbWVXdlhMeFhkcUU3?=
 =?utf-8?B?WXpEOERnZFZVS010cS9uSy9OeFJiYUJ4Yko4bFBhTkdvMFI5bHk0TVhmajMz?=
 =?utf-8?B?T1RoTDY5R1d5Z3FFU2E1ZGYwUjBMWHRPdG5zWWxKcjFTNDhMd0xqZ1RQTGdT?=
 =?utf-8?B?RVJVcDVDYjBjdlJpdGhPWFNJYW9NM0M4ZitzaTZJWENOY0FNZ1pxNHVrd253?=
 =?utf-8?B?QnlSekZkdU56K21MZTJOZ29nMEh2TmM2VUJRSmthcGZZbHF2N2hZVnhKc1Ro?=
 =?utf-8?B?ZS9KS3hjbkFMZ0ZRMTBXZFRmSVlpWXcyWlpJYTFReHcvZWxWOHhsNEw3VFNy?=
 =?utf-8?B?NkRhYzRmNHB2WlRka3gwTmxPek95UEJLYkdwQTJZWnQ5bEJnTEp5TExWZGFR?=
 =?utf-8?B?eGRPYWdabE1lQU9XMmN6WEROZTdWQWdwazB6dEVYL0tBTXFzVldmZmZKc0ow?=
 =?utf-8?B?dkk5Wkk4Z3ZPTExmcHhCTXJyamtRS0R0QmRmbG50WUVUNUZzS3ljOFpwQi9y?=
 =?utf-8?B?cHJKK3krVVJVcGtFaVV6QUV6eTdBSmp5ZlJMYjYxeFYzczV3MUlnS3BQNnBB?=
 =?utf-8?B?bklIQ1ZTNDl2bUdIVnZmZ0FZSmNhTU5yS3pSd3kyVXRQaHpHRWpPSzJJWjFs?=
 =?utf-8?B?MGRMMjNDVlMvQlBDaXZkRWNRdXhJSDExT1BWUXN3aDhnSDBGQ1ZKUEZuc0wz?=
 =?utf-8?B?RlZWUWE1L1QwSEc3MWJTcGhMNkhiM3NWR1VnNlJhQ2JpMnNRQmZrWlhqWEpK?=
 =?utf-8?B?K3VOOGdjVEVYeTdvYUE5WFRlVzg3K2dzUG1Ka1Axa2FENzdvcGNDMG82UXJa?=
 =?utf-8?B?VDFCUnVIdHhLa1NjcFYvaFREZ2dkSGlSTnl4L0tLRVA4K1U4T2ZlU1pZSDNm?=
 =?utf-8?B?ZDFRa25yMFFiQkk0bGY3L09mOFNia0w4QTRxMDYwaFVvVkFTUXhWWkZFMG5Q?=
 =?utf-8?B?RzJYdkJ0YUg5azQxaDNFN3AvNmJlN1F5blA4NnBuSmJENXF2d3k2ZVpSc3Va?=
 =?utf-8?B?ZGRVdXBvVEhTcGU1RTBnNTFjNi9pN3Z3MzBzYWlKcDl2aUxEVVEzTHhkRWJo?=
 =?utf-8?B?SW1qc1JydVQyNXBrcEM4Y3BCZEdlNnUzZ1RDSUU0RmhsamtKcElqQTcwZDFI?=
 =?utf-8?B?UEhhNTllS1lYMHk5TEticDc3blY3VFlpMzdOcnpBaG4vM2pydDNkNjI5VXFt?=
 =?utf-8?B?R0hiLytHOHRqR2EybzEvNWtULzRic1N5Yk03Z3Jod09zNi9laU5JanRLSFJv?=
 =?utf-8?B?bzdnbkRDdmc2b04wNkNXUWcrdXhlTndtQVBiQ3pORnlxUXg4aDBYSVppVC85?=
 =?utf-8?B?THNJK1hQdEVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmQ4R05jbHMrWDF4Zm9temthYjh2V0F1ZVprbjBRT0hKcndiSGRLUTZOa085?=
 =?utf-8?B?K1RWSlBSN1NhaWQrQ2hrZEdsWWt4eHNiVE5Ea2VnRCtIY3BESUJtYi9STlAv?=
 =?utf-8?B?TEcrSG5QVFFyZkVwK2tqckp1MHJVTm82LytSZmtxZkZlQythb24xcGkzWVNi?=
 =?utf-8?B?UDltaFZiSnRXa1duellKd25ZQVl5N0lMSlRLdE9TVEJ0ZUtHZEdoa1d3a1ps?=
 =?utf-8?B?Z0M2cjlNNnNQbkxHMzBSamZZencwbU1tV3o1YmQ4TjN2aFUwQnNaL3c4SDdW?=
 =?utf-8?B?SDBGTENRajk4cjBFTXhSMzNpTnFveU96RzA2WU43ZUgyOU04cE9KZ20wSmFG?=
 =?utf-8?B?QlQ1N2FmN0MxbWc4eVY4NjdET1lncDdobm5UdnZlRWhwbDg0WXYxM1lPQmlL?=
 =?utf-8?B?eXcvR3hGREE5MU0rQTVzVnI0R2p6UmNIWnBWb3plOHRxbHEzaTlEWGRnZHZP?=
 =?utf-8?B?M284bW5LeTFEYW5PSU1WQkdKKzF3eTFKVGFHYkFJY3NKUmdray9ENUYzTEox?=
 =?utf-8?B?TTJ6bUNpQzE1ZmlKdDZhQlQzMG1YcUt3Ty92V05FRTRreVdpRjB5QnhSaDd0?=
 =?utf-8?B?eUVRR2dUcVZmUjNaaGRlUmgyMzlScXhUaCtuSFVVd01yekNCVHhoeW5iU0dq?=
 =?utf-8?B?N2Z1Y0VlRG9UVXorNXppekpOVUo4Uys1N21nZXlBU1BXUGcrTjJmMnNrQXN2?=
 =?utf-8?B?aUhOSjNnLzJlWHI2WlEyT0prNXJvTVF5dE11YTVCcHRIL0dLT0w5QWVkWncw?=
 =?utf-8?B?am5TWmZ1azFyWlJpc2pOblZocTNqZEdGNVBBYVp6Q1FJVm9TRzc2REpFSUZw?=
 =?utf-8?B?cCt1dk5uWEZPZ3NDQnlsUE9HbU9td0Z5T0pWUkJQK25nRTUrZ3Q2aTVQVEVj?=
 =?utf-8?B?NE9uZnRiYnZkWFRacEFyWUJyNUtxRDFIR2djRUNJR3BMYWtYTVdqYVFJYThE?=
 =?utf-8?B?bDZtWUV6ZHFOQWVmZUttQjZiRzQ4Y0FmZVkvMUNieDhuRXVhMkQzNUM4WHlX?=
 =?utf-8?B?bzhqWVdQSFpobW1oTlJuTVJrd1NvU21ndTlUUmRaOS9xdVlSS2NwVFIwQUNv?=
 =?utf-8?B?Zys3cmQ5S1ZaQnNIS1EydjRDZXd2SkNROHZqSERhQk1ZZm9NMisxTHRuSWpv?=
 =?utf-8?B?bVBKN0t1d3M5ZHlpQzJ6K1ZYN0lOeFRldUJQbEZ6U2d3K29VZEdlWUpUaHp4?=
 =?utf-8?B?OG5tOXF3bUhuQVEzOEFOOGYyNDJXOWhBbVpaNHJSblA4QnBDVFhXQUNrdGZm?=
 =?utf-8?B?VkR2Zy9BQzJiZHBFM3JISVJMWlFVSGdnT1hMamEyUlZqek81VlRTOE1TSHpO?=
 =?utf-8?B?Wmt1WklTa3lGcEZuTHN2OTBBeDhRdE84R01mdWJ1RlBVYlo2S21YdGFueGc5?=
 =?utf-8?B?WkN3U0lQb0dTN0VnQ0xpL2cvWmFhbXhmekc5Q2lGY0dsYTdpWHg0SUVsNjQr?=
 =?utf-8?B?M1NoOXZXQmMvc1VENDFkbWNUWjd4bGVMV0ZoM0M4b1dKUHgzMi8xYWVyRGoy?=
 =?utf-8?B?YnZSNFRDZ2xpWndsZEpnelJsb0VQMS9wYVBseklDc3Z0QUFPaFk0ZDBpVWMr?=
 =?utf-8?B?RkFKaS9Za0FRSHRxQ3RpZ3FXbFFLZTdqaVVlWlgrbFQwWWE0YVR6QzhLTk4x?=
 =?utf-8?B?U2kxeDJxbUwxNDNKMUVrZXhJUlZQaDVXaXU4K3h3MW1lUjFoNzhmZTRvUlMv?=
 =?utf-8?B?WG9VRHJWdXNna0lyaWxHOUdoV0FwRnowUjRjZVZwZzlFWGJSZFhSLzFvbmcz?=
 =?utf-8?B?bWZITEIxN3BwQVR2bFNBeW8ydkR6TlFENzRvaGR2aFJKblBVK0ZnS2ZPenNk?=
 =?utf-8?B?UUJ6QlJsSTlyV2gweUQ2d1V0dmRvbGpEdExOUDVFMXp6U3M4dm90eFhiT2Fi?=
 =?utf-8?B?SERHay9wRVVPZ3AvRDZrUFJ0Y0p0RkJEWDBFM0pqbFM3TVlhbHFTcHZncmUr?=
 =?utf-8?B?cHVER3V4N1h2SGdQbzQzNVpZaFMxakRaN2c5VHVYYWdsMk1VM3E5RHFOZnRM?=
 =?utf-8?B?Wk54LzhqRm45alliT01tdlVUdHZYeHNJWnBiWTllRXh3N0FhamRYaHVldFI5?=
 =?utf-8?B?OTg3MmZzRC9XOU1VM3FUZWJnd1BZYk9wcU1JanM1cXNIR0hEamVhWDM2bW9u?=
 =?utf-8?Q?WY36cV+hxgpnJnJG+ToK4rgEC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ae16e0-0e24-44b7-bae2-08dd81ce8c88
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 18:50:27.9608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a7W6Y0MvOMEjPMvhPhPnPgxeEghAGnQne6OUCIm7YiC4gukgkK7KKzcFHJHGm+YQ+t08p4NF+oTokPR3RjDXGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5727
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



On 4/20/2025 8:19 AM, Alexandre Courbot wrote:
> A page of system memory is reserved so sysmembar can perform a read on
> it if a system write occurred since the last flush. Do this early as it
> can be required to e.g. reset the GPU falcons.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/dma.rs       | 54 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/gpu.rs       | 53 +++++++++++++++++++++++++++++++++++--
>  drivers/gpu/nova-core/nova_core.rs |  1 +
>  drivers/gpu/nova-core/regs.rs      | 10 +++++++
>  4 files changed, 116 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..a4162bff597132a04e002b2b910a4537bbabc287
> --- /dev/null
> +++ b/drivers/gpu/nova-core/dma.rs
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Simple DMA object wrapper.
> +
> +// To be removed when all code is used.
> +#![allow(dead_code)]
> +
> +use kernel::device;
> +use kernel::dma::CoherentAllocation;
> +use kernel::page::PAGE_SIZE;
> +use kernel::prelude::*;
> +
> +pub(crate) struct DmaObject {
> +    pub dma: CoherentAllocation<u8>,
> +    pub len: usize,
> +    #[allow(dead_code)]
> +    pub name: &'static str,
> +}
> +
> +impl DmaObject {
> +    pub(crate) fn new(
> +        dev: &device::Device<device::Bound>,
> +        len: usize,
> +        name: &'static str,
> +    ) -> Result<Self> {
> +        let len = core::alloc::Layout::from_size_align(len, PAGE_SIZE)
> +            .map_err(|_| EINVAL)?
> +            .pad_to_align()
> +            .size();
> +        let dma = CoherentAllocation::alloc_coherent(dev, len, GFP_KERNEL | __GFP_ZERO)?;
> +
> +        Ok(Self { dma, len, name })
> +    }
> +
> +    pub(crate) fn from_data(
> +        dev: &device::Device<device::Bound>,
> +        data: &[u8],
> +        name: &'static str,
> +    ) -> Result<Self> {
> +        Self::new(dev, data.len(), name).and_then(|mut dma_obj| {
> +            // SAFETY:
> +            // - The copied data fits within the size of the allocated object.
> +            // - We have just created this object and there is no other user at this stage.
> +            unsafe {
> +                core::ptr::copy_nonoverlapping(
> +                    data.as_ptr(),
> +                    dma_obj.dma.start_ptr_mut(),
> +                    data.len(),
> +                );
> +            }
> +            Ok(dma_obj)
> +        })
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 1f7799692a0ab042f2540e01414f5ca347ae9ecc..d43e710cc983d51f053dacbd77cbbfb79fa882c3 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -3,6 +3,7 @@
>  use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
>  
>  use crate::devinit;
> +use crate::dma::DmaObject;
>  use crate::driver::Bar0;
>  use crate::firmware::Firmware;
>  use crate::regs;
> @@ -145,12 +146,30 @@ fn new(bar: &Devres<Bar0>) -> Result<Spec> {
>  }
>  
>  /// Structure holding the resources required to operate the GPU.
> -#[pin_data]
> +#[pin_data(PinnedDrop)]
>  pub(crate) struct Gpu {
>      spec: Spec,
>      /// MMIO mapping of PCI BAR 0
>      bar: Devres<Bar0>,
>      fw: Firmware,

Can add here:
  // System memory page required for sysmembar which is a GPU-initiated hardware
  // memory-barrier operation that flushes all pending GPU-side memory writes
  // that were done through PCIE, to system memory.

Will add to my git tree as well (but feel free to squash as needed).

> +    sysmem_flush: DmaObject,
> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for Gpu {
> +    fn drop(self: Pin<&mut Self>) {
> +        // Unregister the sysmem flush page before we release it.
> +        let _ = with_bar!(&self.bar, |b| {
> +            regs::PfbNisoFlushSysmemAddr::default()
> +                .set_adr_39_08(0)
> +                .write(b);
> +            if self.spec.chipset >= Chipset::GA102 {
> +                regs::PfbNisoFlushSysmemAddrHi::default()
> +                    .set_adr_63_40(0)
> +                    .write(b);
> +            }
> +        });
> +    }
>  }
>  
>  impl Gpu {
> @@ -173,6 +192,36 @@ pub(crate) fn new(
>          devinit::wait_gfw_boot_completion(&bar)
>              .inspect_err(|_| pr_err!("GFW boot did not complete"))?;
>  
> -        Ok(pin_init!(Self { spec, bar, fw }))
> +        // System memory page required for sysmembar to properly flush into system memory.

Can elaborate more here:

  // System memory page required for sysmembar which is a GPU-initiated hardware
  // memory-barrier operation that flushes all GPU-side memory writes that were
  // done through PCIE, to system memory. It is required for Falcon to be reset
  // as the reset operation involves a reset handshake. When the falcon acks the
  // reset, it writes its acknowledgement into system memory, but for this write
  // to be visible to the host, it needs to do sysmembar to flush the write and
  // prevent the driver from timing out.

> +        let sysmem_flush = {
> +            let page = DmaObject::new(
> +                pdev.as_ref(),
> +                kernel::bindings::PAGE_SIZE,
> +                "sysmem flush page",
> +            )?;
> +
> +            // Register the sysmem flush page.
> +            with_bar!(bar, |b| {
> +                let handle = page.dma.dma_handle();
> +
> +                regs::PfbNisoFlushSysmemAddr::default()
> +                    .set_adr_39_08((handle >> 8) as u32)
> +                    .write(b);
> +                if spec.chipset >= Chipset::GA102 {
> +                    regs::PfbNisoFlushSysmemAddrHi::default()
> +                        .set_adr_63_40((handle >> 40) as u32)
> +                        .write(b);
> +                }
> +            })?;
> +
> +            page
> +        };
> +
> +        Ok(pin_init!(Self {
> +            spec,
> +            bar,
> +            fw,
> +            sysmem_flush,
> +        }))
>      }
>  }
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index 878161e060f54da7738c656f6098936a62dcaa93..37c7eb0ea7a926bee4e3c661028847291bf07fa2 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -21,6 +21,7 @@ macro_rules! with_bar {
>  }
>  
>  mod devinit;
> +mod dma;
>  mod driver;
>  mod firmware;
>  mod gpu;
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index fd7096f0ddd4af90114dd1119d9715d2cd3aa2ac..1e24787c4b5f432ac25fe399c8cb38b7350e44ae 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -14,6 +14,16 @@
>      28:20   chipset => try_into Chipset, "chipset model"
>  );
>  
> +/* PFB */

Also can add:

/// These two registers together hold the physical system memory address
/// that is used by the GPU for perform sysmembar operation (see gpu.rs).

> +
> +register!(PfbNisoFlushSysmemAddr@0x00100c10;
> +    31:0    adr_39_08 => as u32
> +);
> +
> +register!(PfbNisoFlushSysmemAddrHi@0x00100c40;
> +    23:0    adr_63_40 => as u32
> +);
> +

Thanks.



