Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA48A9B90E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 22:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD8010E02A;
	Thu, 24 Apr 2025 20:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VdEpEVIK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F20A10E02A;
 Thu, 24 Apr 2025 20:22:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWuwRNkvyAgidhbEedD7Kw7KOeWVs+28Wg+platN5nYMHSSbZCwQMqXUxs9N0fo8FrTrOPaiZmQV/8nZ2zD2b1IcL0oJusrm0SAktqDtTd3xIx5ohsRlP95ok6EIjYorWZjQt63yGzqJRfF7HpnT5Qu5Php/blYGJpzUquHRZ54DGwWqMuru2HcL+xvdJUHRpXtvlEIxwb2dvOB+mIyQj/FJhaoYZcZv9grYzBE0KUsw2sLQUR8QjW1TeQxUMpGm7axTpXKckfpIXVMAivLiTeSEU0+RN+2opU71NdCSOTLqdRkmlDJD7sqFxCG+9URFKamI4k9oQKiheCZezqdFOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rbh/k+l2WscQat/XMYxtHhv0ilU//rB2LJnOc2BNRs0=;
 b=QDqlz6q0jjrkWg8G0mx3n5CaI4qQ/tS+Ck+Z1alvM0Zq/TwkBI+fad86RlhDWi+yxsrYlG34wp3vbRBnmjAtpV7qe3gU0owslegGG8YeqqDbgb/tadgGKJq6zk7i1mkLtrlGiW7+nLeSJS6KUY5b7ktkU/7XPJFpsHJ/n87aByZRQHnWV//AMSgPcGcCToS7LeupALkpQcWV60lpoYeKBu3Cu+A3RSsWsh9rItfViWeKEU/i7kzqCLdWFn9TY/15pDm0NKAnnjZMO6HylZydvZ02sQBKyfa0jguykybiSZZ88JjzA/sE9Uf1tWYIrXoJNWsaZ4GIHodJ92KCRV6DTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rbh/k+l2WscQat/XMYxtHhv0ilU//rB2LJnOc2BNRs0=;
 b=VdEpEVIKUC6OJIvyswm0WI+E9QOuRB0GuHB6DQWOy3Ut/t9mQ8My2E37d1XkpmoWaf+dCRrUbNu7RvvV/yL/ae1X/Vwr2IXhtKKWwdyW3EsEe+yt4wxP06GOuuYfAyKo9IIoVYcsY9DGDHHp1rQMuCNxBGdGLWGIcPts6SYACf6uEjJHw9TSGIqTyLjItCto/DzI5ZHG5ZIGttDhFEF2F8AWOTWgjyfo5H8+W4l4Ci1fgkULsSAeQ4UMCwXT7TcTHQcMVv/HQ26R95hEFWobtljBgz09vpXlATPbDX7uPWmXluqbNVGsweFygTo4VcveqXr4lgY+IIqRxDnI6O0M6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8044.namprd12.prod.outlook.com (2603:10b6:8:148::14)
 by CH3PR12MB7739.namprd12.prod.outlook.com (2603:10b6:610:151::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Thu, 24 Apr
 2025 20:22:47 +0000
Received: from DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::f250:7fd7:ce23:a0fb]) by DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::f250:7fd7:ce23:a0fb%6]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 20:22:47 +0000
Message-ID: <aa540122-6a6a-4fd0-9005-5a4061f8eb6f@nvidia.com>
Date: Thu, 24 Apr 2025 16:22:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/16] gpu: nova-core: Add support for VBIOS ucode
 extraction for boot
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-13-ecd1cca23963@nvidia.com> <aAjz2CYTsAhidiEU@pollux>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aAjz2CYTsAhidiEU@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:408:10b::16) To DS0PR12MB8044.namprd12.prod.outlook.com
 (2603:10b6:8:148::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8044:EE_|CH3PR12MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: bb88fc99-63e2-43e1-8d67-08dd836dc72c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2pkQk1ITERFb3ZEaUltbHJ3NmRvREY0UC96eVlhK0VBazg0RkwxM2pLaE9k?=
 =?utf-8?B?RVlsdGhDcFRZSDRxMFQ4cXNRaVVYMThGU0xOY1ZnNmJ4SUpUdi8zbXZqdTRS?=
 =?utf-8?B?dStUcWtJNW9RdFh6M3BTUk03ekNSY0xUN2xWa0Ywd3U2eEdtLzVTUS80T25W?=
 =?utf-8?B?ZytQYVNsM0xyVGU1dFFBTW5sU2FhRldFSklpSVhrZlhnMGpKTEU4SGlTVlh4?=
 =?utf-8?B?ZVU5b0U5a0dPNm00Tm4xSVlYaWs3YnhVVWpuYytMR2xNdlhkTVMxRHEzR3Rp?=
 =?utf-8?B?dGtaQkpEajF3YmZHb21pWksveS9pZjVCVXpYV2laTzIrV0dGMjVTeExpYlZ6?=
 =?utf-8?B?UUlXaGQyeExSWFQyN1lNZE92S1BUOWF5YXNIS2E3NjhzSmhyTUFmVm9IUmRF?=
 =?utf-8?B?elM0WGRZZzFYNm5sbHAwb0RGNDdlR2pqZnRxTWk2cEVVVmZ5VzEwN2lSOFV6?=
 =?utf-8?B?Y3RWTGFUU1VlRjZtL3hJck51VE0wa2s1VGlBMDZMYTNJVUhUZTZYN1d0dU9j?=
 =?utf-8?B?WWZoSDIzK0c0K0pEWXFoeERFWUN0b3o0SWJvd3FyTU1UZmRDVHEwMkFkSnFm?=
 =?utf-8?B?SnZjK3dnWTFyRXVlOFUvZVhrczlYYnVzTlRrd1FPT2tGaDZtanZJYUtxUUVG?=
 =?utf-8?B?YUlTdVpjclhYVVB1TzIxV0ZOa0VTUGxXSlIwbkJocldxbnZnT0F2cVNpSzI2?=
 =?utf-8?B?ckZoeHVwdG9rNkw3WUZlT2V1QVdxajRPRlMzdFJTb2hQMVFTVXhPOUdHc01v?=
 =?utf-8?B?VzNEa0w0Y0Zab3FmWU1NMWc5YzFOWTk3V0NOOW9lMXlxdUJqckdUT2hEanVX?=
 =?utf-8?B?QUxWUG92YnRnY3hTU0xCQXFhZUEzdXJpNFZPTEp0QzR2Tkc0WktjZGpvWC92?=
 =?utf-8?B?WURsZXRzaUd4RkhKSXVuWlBDU2xUdzlwS2ZZT1hhVHJSVnJGZWdOYVl2bURB?=
 =?utf-8?B?WnJub3pvMGl6ZU50YWFSemJQU3V5MHQ4M1RFUm42WHZXUE5jZ0g3T1ROZ0Jx?=
 =?utf-8?B?a1NCT3JTbmRiVDE5eEtYK2NRbUtrRFFUNDl6ZVMxRWNIUUtGMkVLSVc4NFVD?=
 =?utf-8?B?REFZOWp5ZHRudXBtR29Jb3Y2ak16SWFEdjNnQkZJT1VNc09XaDU1cmE0L2Nj?=
 =?utf-8?B?UUNNNkZhZVZHcitOS0dSU2xiaFZhSW1yRU5ieXlQQVY3ZUlqNFVGcXZpaDRH?=
 =?utf-8?B?bUUvMkNLbkRZRXdTaG9jL0RVdE9lVnhjZzlVbUN3L0VzZG5lVXJIdjdUUjFG?=
 =?utf-8?B?NWdyOFllZDRJVjB0S0NzOWJGMG1kVXEzZFJWcERWNU9yZ2FSRGZ0Yk51b2Nh?=
 =?utf-8?B?YXB2V0pYN2YzY1RROTlVd0MxYnNyczVtN1NXTUpwWktCWDVoRlJHMzBkL1BW?=
 =?utf-8?B?MTRqc2IxSHBsOG5hc25tTExNcEhIY3ZoZ1YxOEJNdzZJbk9HVTdySStEVUwx?=
 =?utf-8?B?WCtiRDE1R2dhQWtIMXpxYmZKVEZZK2pYU2RTUVB6d3Njd1Y5YkxpL2Jub3pK?=
 =?utf-8?B?WW4yaTg2d0RQSk13MjBjRjFZOGZyRFRYck9BaUUzck5XbHkxM1RXSlJvN0NH?=
 =?utf-8?B?YmpJbnhiSmNVLy8rellzejZyRkwwSlp4N3drMVUvUEp3aGFPTjR1VFg0OHhs?=
 =?utf-8?B?cGNxT2FwcncwNjQ3bjUwOG5jbnpFVkVpcjJ1ejdUQVdpajlyRE41ek1nN3Jw?=
 =?utf-8?B?dDdNOTJJRndyWmhocnNHdXJZK3U2ZVFISENrRzA3U0xQcXh2UXlXemtVVVZO?=
 =?utf-8?B?MXNRTGI1cnpjak04Z0VKMEJpSnluWjNBRVREVVBjNjQxRVpjeEhubHhWekZu?=
 =?utf-8?B?UGxqVVgxYndHSXFSaXAyOVpjR3B4bTZJaFBDa1pGeG40V3V4b0xYdHlWVG05?=
 =?utf-8?B?VkVwR3lLSW45TFdZUUhPMjlRN29uTVBGT29qa0ZuV3Y1UWcyQUMvdituZXpL?=
 =?utf-8?Q?3ZS77bF8dmU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB8044.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGFtU1NTcWhVZ1lPTnpBWUtXT2xCSHpxUlJtUXB6U081OFlXNUV1Rlk2d3A5?=
 =?utf-8?B?NkFvL1MweGJOVUtTRE9ycW1YK1VkWVJCbnIyTTYyZzlReFB3M3pCVS9qdTV6?=
 =?utf-8?B?MGpHQTNVa1dISWs3WWo2K095ZW5PZUk0VmxBOGNNWUtGcjVORzhha0hsREE2?=
 =?utf-8?B?U3hEeGljU2dxSDFtTTlCaUJHTkFpSURHbS9NdktkUnM2V2g4cnNrR2gvdzJv?=
 =?utf-8?B?MGtFMmtrbTdETUVlb2xXRkREUElVS1dEMjBidzIxVHM2L1pSZmUzRnRCU01i?=
 =?utf-8?B?NE5XR0hBc2hQUGFBeThWT0Vyc21wSkNld09NaW1QU000VkRlVDB0VktBS093?=
 =?utf-8?B?Q2pTWjhqT1p4L2ZBcFZvcUZuQjhXMnJ0K29hUkFaeW4xWFY5elpjbEFYQ2N6?=
 =?utf-8?B?R1VtSVQ5R2pqNk5PNnZka1Z3Y1NVNTNwenZBdnFkd2xkaUkydUl4S3R5SFd6?=
 =?utf-8?B?S0M1Tkd6NnIzZGJaUVlCZEFTUzFkUWxidkJnWXFXL3I0UitsbFJpZlVGQlNy?=
 =?utf-8?B?bUNiZE5RRFcraW5Tci9QNjlRbjNrMG00cTkvclBEZVQ2TUJqQnpJK1huR05w?=
 =?utf-8?B?cy9Dbm8rVjJobDFLN0dLSTlseExrVUxERE5JS3hzeXF2OEVLdUZIb3cxL3Y5?=
 =?utf-8?B?alROU1R2SmdocUJRdHdaRmdTRjdET2JzRzRHQjNvZ282aXNkYVlLOFhFTkpL?=
 =?utf-8?B?M2MyVlNlVXFJVWQ4OG5wRmo3eVU2ZjEyYVFGUzZMQjR3VGpqTWl3VVJpSDAy?=
 =?utf-8?B?bnBYaUg2NERrcDlIWjVVZmtSKytNRUQvaUtKMmJUYVJWb0plVXRjcHR1eGlW?=
 =?utf-8?B?YngxYUxqVFdkbndxM0NadDJIR05tNDVQeXVBWDRjTGNicnkwRFpRTThuMDVI?=
 =?utf-8?B?b0VLWXRaZXhtd3oydEVwb05KUVdzeTdSK1JXeTdCSUZTN1d6bHB1UW94NXpG?=
 =?utf-8?B?SXFDN2xLd21kQWt1TjF3V3c1cEFoNGFCYlFFbFRCL3g2UmF3c3BEOHFKYStz?=
 =?utf-8?B?dUhlMTVySGFrTVhXdCtObnc4RE5GUFlTQzFqa0IzeGNHd3R2MnJrb1dTZFJ6?=
 =?utf-8?B?bXpEN240TmFWOUxleC9zbnY3OGlWT2RrQTVlSVlTR0FBaS9jWE1uOUVhZVpy?=
 =?utf-8?B?b0svUkFER3hZWVFaWjUvNmVXcUgza3V6a1NKMXZNTmNpWTROUkFuLzVXVXZk?=
 =?utf-8?B?c1hvaFNOdzRtdUEzWU0rZnlGSVMySWJESWFQako3cGUvKzNyRU9xazBMVlA3?=
 =?utf-8?B?UVEzenpYSDVBQjBWS25nUlFDMjMzT0xORmNDNFRXVkpyTlR5RWxYVUh5dGVC?=
 =?utf-8?B?SnVGSUVSVTJPWDV4Vy9QMHAyWmVTK251cTRtR0p6eG5tV29jdC9WT1RpQzlL?=
 =?utf-8?B?VkpwZFhIMjQrQTZGOU85VVlJTXJxN1JOWFFXU2JJNDA4VVEwQ04rYVF1TTJ1?=
 =?utf-8?B?V0R0SW9oWitPcklXdWV0a0FXdW95UTBqTzlFZGZ3aWlkZnNtK1NrSDdSbXNv?=
 =?utf-8?B?aGxCL3ZqTnI1WmNMaGhaYjJxZmUwcHlFdklxSHlaMkFuWENKWFBNcTFEdUpv?=
 =?utf-8?B?ODd5M0Z3QXdQSjF0Nlc0eFBTTWNGV1ZJYUx5QmFmT3lpSDlVQ0hxR3F4cWgw?=
 =?utf-8?B?TWc3SUJvaTJGQitMZkJBbEpieHArem5MeWN2aS9VVEI5ZXVjSEM2UGN5YVg5?=
 =?utf-8?B?bmdaK3hrWENScjVJa1BBV1ZycWFsNlBPbllQWTZ1WHZZZ1JNSUQ4d1h3bEYy?=
 =?utf-8?B?Vi82VWFsRHppZFhDZXcwQWU0TWJ4a2pzVEZWZnVqUmZweEFMSjdtSEZIKzR0?=
 =?utf-8?B?UEdsa1J5eFdWNWJyZzBTNWY1UEFCbHhLeEw0ZFVlRHdFZE55MnRMdm5zMnFH?=
 =?utf-8?B?K3owWkdEU3NQMVhJaEFseldVV1o0UGtuMEhrQWhldEYyQitvVDlXVTBCRlBr?=
 =?utf-8?B?bWZiRllRVjRhNU1FUnhnbWNhSHhydVczVFRJRVJ1WXJXY0pzZ0JGUFlnOGlO?=
 =?utf-8?B?dDhCOWtoKzhqbEE4ZzlWZDlTUTdDdys2R3UxQ3ZOUko0QllrWTB5K3dFM0F2?=
 =?utf-8?B?bEkyeko4aEI4bHErM2pmTU0yT3dVWkc3QUN0UnA0cVh4NnUzaEw1ZEJ0NFg0?=
 =?utf-8?Q?jL6PFtsmO0qyIQNq+J56Ze+v1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb88fc99-63e2-43e1-8d67-08dd836dc72c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8044.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 20:22:47.4698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0BdCoxlChsI6o941JfElWSu0Wz8IArKI8TnEnIsjetPTgJokzBIPyKpoJ10zVJlPZZ4w7eRnwEfuOi5P8tB7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7739
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



On 4/23/2025 10:06 AM, Danilo Krummrich wrote:
> On Sun, Apr 20, 2025 at 09:19:45PM +0900, Alexandre Courbot wrote:
>> From: Joel Fernandes <joelagnelf@nvidia.com>
>>
>> Add support for navigating and setting up vBIOS ucode data required for
>> GSP to boot. The main data extracted from the vBIOS is the FWSEC-FRTS
>> firmware which runs on the GSP processor. This firmware runs in high
>> secure mode, and sets up the WPR2 (Write protected region) before the
>> Booter runs on the SEC2 processor.
>>
>> Also add log messages to show the BIOS images.
>>
>> [102141.013287] NovaCore: Found BIOS image at offset 0x0, size: 0xfe00, type: PciAt
>> [102141.080692] NovaCore: Found BIOS image at offset 0xfe00, size: 0x14800, type: Efi
>> [102141.098443] NovaCore: Found BIOS image at offset 0x24600, size: 0x5600, type: FwSec
>> [102141.415095] NovaCore: Found BIOS image at offset 0x29c00, size: 0x60800, type: FwSec
>>
>> Tested on my Ampere GA102 and boot is successful.
>>
>> [applied changes by Alex Courbot for fwsec signatures]
>> [applied feedback from Alex Courbot and Timur Tabi]
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/firmware.rs  |    2 -
>>  drivers/gpu/nova-core/gpu.rs       |    5 +
>>  drivers/gpu/nova-core/nova_core.rs |    1 +
>>  drivers/gpu/nova-core/vbios.rs     | 1103 ++++++++++++++++++++++++++++++++++++
>>  4 files changed, 1109 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
>> index 4ef5ba934b9d255635aa9a902e1d3a732d6e5568..58c0513d49e9a0cef36917c8e2b25c414f6fc596 100644
>> --- a/drivers/gpu/nova-core/firmware.rs
>> +++ b/drivers/gpu/nova-core/firmware.rs
>> @@ -44,7 +44,6 @@ pub(crate) fn new(
>>  }
>>  
>>  /// Structure used to describe some firmwares, notable fwsec-frts.
>> -#[allow(dead_code)]
>>  #[repr(C)]
>>  #[derive(Debug, Clone)]
>>  pub(crate) struct FalconUCodeDescV3 {
>> @@ -64,7 +63,6 @@ pub(crate) struct FalconUCodeDescV3 {
>>      _reserved: u16,
>>  }
>>  
>> -#[allow(dead_code)]
>>  impl FalconUCodeDescV3 {
>>      pub(crate) fn size(&self) -> usize {
>>          ((self.hdr & 0xffff0000) >> 16) as usize
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index ec4c648c6e8b4aa7d06c627ed59c0e66a08c679e..2344dfc69fe4246644437d70572680a4450b5bd7 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -11,6 +11,7 @@
>>  use crate::regs;
>>  use crate::timer::Timer;
>>  use crate::util;
>> +use crate::vbios::Vbios;
>>  use core::fmt;
>>  
>>  macro_rules! define_chipset {
>> @@ -157,6 +158,7 @@ pub(crate) struct Gpu {
>>      fw: Firmware,
>>      sysmem_flush: DmaObject,
>>      timer: Timer,
>> +    bios: Vbios,
>>  }
>>  
>>  #[pinned_drop]
>> @@ -237,12 +239,15 @@ pub(crate) fn new(
>>  
>>          let _sec2_falcon = Sec2Falcon::new(pdev, spec.chipset, &bar, true)?;
>>  
>> +        let bios = Vbios::probe(&bar)?;
>> +
>>          Ok(pin_init!(Self {
>>              spec,
>>              bar,
>>              fw,
>>              sysmem_flush,
>>              timer,
>> +            bios,
>>          }))
>>      }
>>  }
>> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
>> index 4dde8004d24882c60669b5acd6af9d6988c66a9c..2858f4a0dc35eb9d6547d5cbd81de44c8fc47bae 100644
>> --- a/drivers/gpu/nova-core/nova_core.rs
>> +++ b/drivers/gpu/nova-core/nova_core.rs
>> @@ -29,6 +29,7 @@ macro_rules! with_bar {
>>  mod regs;
>>  mod timer;
>>  mod util;
>> +mod vbios;
>>  
>>  kernel::module_pci_driver! {
>>      type: driver::NovaCore,
>> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..534107b708cab0eb8d0accf7daa5718edf030358
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/vbios.rs
>> @@ -0,0 +1,1103 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +// To be removed when all code is used.
>> +#![allow(dead_code)]
> 
> Please not, use 'expect' and and only where needed. If it would be too much,
> it's probably a good indicator that we want to reduce the size of the patch for
> now.

Done.

[..]

>> +
>> +        // loop till break
> 
> This comment seems unnecessary, better explain what we loop over and why.

Done.

>> +        loop {
>> +            // Try to parse a BIOS image at the current offset
>> +            // This will now check for all valid ROM signatures (0xAA55, 0xBB77, 0x4E56)
>> +            let image_size =
>> +                Self::read_bios_image_at_offset(bar0, &mut data, cur_offset, BIOS_READ_AHEAD_SIZE)
>> +                    .and_then(|image| image.image_size_bytes())
>> +                    .inspect_err(|e| {
>> +                        pr_err!(
>> +                            "Failed to parse initial BIOS image headers at offset {:#x}: {:?}\n",
>> +                            cur_offset,
>> +                            e
>> +                        );
>> +                    })?;
>> +
>> +            // Create a new BiosImage with the full image data
>> +            let full_image =
>> +                Self::read_bios_image_at_offset(bar0, &mut data, cur_offset, image_size)
>> +                    .inspect_err(|e| {
>> +                        pr_err!(
>> +                            "Failed to parse full BIOS image at offset {:#x}: {:?}\n",
>> +                            cur_offset,
>> +                            e
>> +                        );
>> +                    })?;
>> +
>> +            // Determine the image type
>> +            let image_type = full_image.image_type_str();
>> +
>> +            pr_info!(
> 
> I think this should be a debug print.

Done.

Will continue looking into the feedback on the rest of the items and reply. Thanks!

 - Joel

