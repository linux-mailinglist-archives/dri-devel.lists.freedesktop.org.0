Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2629EA9BCCD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 04:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85B010E17E;
	Fri, 25 Apr 2025 02:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lxd7lyF6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6E610E17E;
 Fri, 25 Apr 2025 02:26:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgX+1ZiyMLcgpwLKquW29kWukgLb05q8iA7SHzQcF2WLgyaIKpMcxepniFgJ9NjQaWbKDO2Cn7bYYMJV9b7Xhl74OggD6QevTSpjXB+peSkzm/Q5onjw5o/r0/qpVnMe6bvzcDS9zjVHdkzDGaiVvLqlc8OkFbWxjG04jxQv99NEBb2QKCThyGjkYOPlZ16Jcv6hldid6Gyn33Sb7PJv0pBJIENvH+mf2S1BHfSWtF6US+BHqCgQ0A5yZl44ugCouv6KfuRGTVCVNoWK2lNHLYmqv7pwJd5U9VOfVyZFwuHjkqp6Bdr6P29Yz9jx7QO+7kqc45tCYFL/2aXe6iKDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMvO8FCpN79fQdRxvhCqWKDBlbrNvZrEUpHccEZ7UQQ=;
 b=aObrwB1ndo9d0EN6wSAj+1bNSKmIs+wRyQYVcg0eOhWUd5s4M6YTc6RGPwUQH2AAwOg0MpKDcmBIRW04FcfSDWeuRxeLZMMiZ/1JsFID6oEYlsqZCAFDzQVCaX5wjtAc7fQfmt6RhYBaeFvBN2o3C0wf+5Qh8GrVNJdvlpJhatM18nqY3G2YMYyCpTnm8ruKjEyUmsn843fTgMmRtFc9A0taV9AaG7/EXB6808Rl1bS+H0gYnX5GiguWAxsJGlha1XsDGOsKhCMyts0HNH3mKR84o3ztB4MQWOXTZPNZcrRYT+2298JkcjDroHKY7a0Pi7yG8/9L2MpxNGa1Hdj3ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMvO8FCpN79fQdRxvhCqWKDBlbrNvZrEUpHccEZ7UQQ=;
 b=lxd7lyF60yozZMEow0FxEmI7ZZG9I2wMO3/iKr/DbUAaeyHUi+pahTAK1LLLDza5yBdVHwBC/ZdR4R01xeOW/ZCRs+OJuS+gmkktbjdSuYRfnFVKE6mD1es0tut+7tAVU2L7hqcFi978Msx/uVzZ/dykvkGomoBcVYhegRNpEdR78b/YiWBgorQ9r178IQN1LoVvcffTnhgjWotrgN4CjlNbFvLFRnVtmVlkhEj7xMNG4F09CS22e1Yzilaj8qWXfPBr05pjL6ahHN+gggZV24XJuIGHpwTU/0tpcPWEWVF6Ar920+UlvwX4ea+JWOOZhY6jWWGUldHFMmCZ25eB9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW4PR12MB7384.namprd12.prod.outlook.com (2603:10b6:303:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 02:26:42 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%6]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 02:26:42 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
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
Subject: Re: [13/16] gpu: nova-core: Add support for VBIOS ucode extraction
 for boot
Date: Fri, 25 Apr 2025 02:26:40 -0000
Message-ID: <174554800015.876.6160811355899255959@patchwork.local>
In-Reply-To: <aAqaU-nX0YRKIGyl@pollux>
References: <aAqaU-nX0YRKIGyl@pollux>
Content-Type: text/plain; charset=utf-8
X-ClientProxiedBy: BN9PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:408:f8::34) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW4PR12MB7384:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b43388-0dad-4efd-3aff-08dd83a09daf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2pYM3Q3aXlGTG5VVkZLQkxEQlVLbVhEalhwQmc5VjF0MmUzZjdPUkxEdXkv?=
 =?utf-8?B?Z2hHbkczU1c4T0FNbEEyMlg5RkkrT2RpYlNmdlRvZ0I0dS9kSEFOZ3dmUGk3?=
 =?utf-8?B?YzMxSVNlS0tsMmdkckhiYmdnaUJaeUZyS0Qxa2dZNy9zWUdDWWZmRURGWExW?=
 =?utf-8?B?bkhiRkN3LzlJWU1qUmN2MVk5WjRCOVNMbGVNOWlvNGRzbTNvQTRwamJReG5R?=
 =?utf-8?B?dnVSSzdRejBwMTJ2WmxXakRjWGhQMnBkZjFub2djTUJreU0zMlhDU0xZd2pk?=
 =?utf-8?B?UU1RRDNHRUlIbHBqbHB2NFRDTlZCM0JOTWNsYXhQQ1ZBc3VwejlHTTBERTJp?=
 =?utf-8?B?clZjdlFFUlZELzNjclArNWVoSkZJTVI0V1BrMU83TnNKS1lTazJBdURpK3ho?=
 =?utf-8?B?UWZna1ZYQjE1VU9VTVc1ZHZsZFNLTXd3YkhLQ1lrUFVTRHhGK2RheXFuallH?=
 =?utf-8?B?TU5zM2xhMGM0Z2pyNTB6SmZic0ZvNHhFUlRKWlJyYWIyVERDb0haM2J2eG56?=
 =?utf-8?B?anRHNzFyaTg3dTZ6MkFtQ2J4NlRtK3hMaEJFSnFPWE9CTWt1KythcmlvTkVp?=
 =?utf-8?B?dHBaeHNYSGlvUjZlNHZ0cEhsaHEwRzRYUVRVOUN1bVkrc1JIQjJDMEI5ZHhB?=
 =?utf-8?B?azYvZ3EzLy94SXB1T05EL1pjc054ZXFVWmtEc1p1dnJRTlpFT0NyWTF2RWta?=
 =?utf-8?B?UnR6Y2syL3pWNVFlZWtrVkt0dFNKK21KRVlHY3c3ekFIWUV4T05FYmxoV3pt?=
 =?utf-8?B?SGdlempzbnBrRTBJbWxlTkE5TVRZRVFkMENSYXBlOExYUklIS1h2Z2pHUlUv?=
 =?utf-8?B?Q3htWmtTR2pNL2xFTU82S2Vwa1ZZekhSNzFqNytoSzRIVWRYZU5FUDlaOXhv?=
 =?utf-8?B?YXJBM3F3RFMvVnRYV2wwWXhKQjN1dElsU1c2Si9aMkY0dDFhSkxoSUdKeHFT?=
 =?utf-8?B?SnEvazBPRWRzWXlsL0VFMXlBT0ZPTWlOMkRsZW52eHVpd09jUGpyMGkzdVdN?=
 =?utf-8?B?RXhIUllXekM1OURwQnJXODVWZmFGZk82NktOY1RxS0VmWXFEVk94NG9RcEZr?=
 =?utf-8?B?MWgyNEZoYjlRaG1hRWl4ZWNlUXV1dk5Pa29sQTcrWGFVVG93bExacnp1VHJy?=
 =?utf-8?B?M2NjMGFGOVlSWk1oemlXZm0vZ3VsNkdYY2plZk5keG5HQW9FOVM1a0RkM1dU?=
 =?utf-8?B?VnVXOVB0blJSSE9EODZRditJVWV3L3FvZXp5dThtdk9qVU92dUF3VlhwTklU?=
 =?utf-8?B?UmFLMkoyS29mNmg3YTEvUFZaWm5JaEgyUVRkSEJoU3Rjc3V2cjNBaTFVNGRB?=
 =?utf-8?B?ZnlPL2lpMGZ0d0gvS3krVXVFaHRSN1FFWEhYc2xSejhPdVg3SkpQSVdBWkQ2?=
 =?utf-8?B?b3VpWjBDOG9vNXlhYkNVZ2diQXBzRjVneEwzaytGMXMvTWx3TjZ4SUhFVDZy?=
 =?utf-8?B?dXA2ME96ZzlWbFdiRHJldDZIQ1FKUDA0UlJIVm5hQTdhb2c3d1g0WUxEQ3VR?=
 =?utf-8?B?aDhQN2hFR245WHJzc2Yzb0JMbG1IQnNvNzVrMVA0YjkvdDhWcnZTb05jZm1q?=
 =?utf-8?B?akIzNEZERFBmbko5NUl1RnBka241NmlTU1B2RCtBdUxZY1dmRmVSRXg5MWZn?=
 =?utf-8?B?N3ZxRFZ5WE9zUUZaSTk0SXUyTS9ieWFTWDVFVzhwd2M1d3BJVWpnWlVtOWN1?=
 =?utf-8?B?bmNqVXNwb2Y4aUpEZVJJS3NZWElkd3dLRWZyd2w1emhEMWV1dTVPRXVFWUo3?=
 =?utf-8?B?cFBRZWtIVWVNazhmUjNER1c1R2Vkby9jbVJ1QmJ0aENaSytYbW03NkhtQ052?=
 =?utf-8?B?Mit3OXZXODRQQnYvSU1obU1HbHNDWUYyYUpoOHl1VXZHOEdORVVYcitIRlFL?=
 =?utf-8?B?T2EwMGE2czF4S3NISXhJQlJSZzZ4d3EzZi94K2U1eWtwT2xLU2lkQXFiYTVq?=
 =?utf-8?Q?eOJ0Z+79lIw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUNXd3dmQTVkOVZTV2lWYnp6eDZ0ZDFnTVV0ZXBkcDJWNHg0Z3pOdmdIUU9X?=
 =?utf-8?B?ekVpNXNFTWYvUDNjMWhCei9SbFp6U1FxS1BRRGxLakQ2QjN1N25hOHhMRGJC?=
 =?utf-8?B?bmRrTytCbWtzcFM1NGM0ZU9MV1lZSHFwWitrSm5Jemp6MHJZbno1WWw2WU93?=
 =?utf-8?B?V3NjVEttcC9DK2RUM29BZ2JoNTBmOFppdDVWZmRGQUs5emZUZkd6MnFwUC9i?=
 =?utf-8?B?YVRaZWlhRDFSR2JLd1BvK3BTNzR1WUpuSjRHS2dVdWgrZVVpTjN5Z0ZwY3ZN?=
 =?utf-8?B?U0RxNnBLT3F1U3JUTnBYR0FWWWMxV1g0Z1ZiS2FBdFd2ejJrOTdFbndDZmpt?=
 =?utf-8?B?S0JOais1VmdlRDhqc1ZiV0loSXVFWWt3VjAvaHdER25jemEyNUFaMUFiM0hs?=
 =?utf-8?B?R1RhYUFMU2F6aTk1NzUrWXduQS9xT1dCVDNZSHZiR1lBK2hZZlR3TmJBblk0?=
 =?utf-8?B?WDRaWUova1FRZFJ2TWxSYWltSzFrenJFS284akJvNUpWdWJaZGR1TFYwdElC?=
 =?utf-8?B?ZUN6c0ZpT0VyZnNFcWsvUUFEVjd1VFdxZ25YZ05SLy9DcXcyQ3RhaURteDNO?=
 =?utf-8?B?NUE5UjM1aFpEdkZFMk8zZ2ZmdzZEOUZtd1dKcTE1dDRHcWlJVHBNQ3ZSc1ZG?=
 =?utf-8?B?TFgxdmNnakdJL1lNTGQ5RWZuZE9HSGl0Wnd6M1hrRDNIUFpodTRyN21wTkoy?=
 =?utf-8?B?Rjc4OWVPY3N4NUh0OG9Md2tYZXFsVU92c29tSitQY1E2V3JreGR4dXR5VVY3?=
 =?utf-8?B?dk56bUlFVHgrR1p4U2tTTERJMXpWbjYyL2JNb0lQY3VGSmdNRUtWS0xDcDhz?=
 =?utf-8?B?RlZQWCtkbkhwVnhZSGJKU1U2bVd4VWZRVnE5cFhOUUc5MDFSaVN2ejVna1Vn?=
 =?utf-8?B?dDJaeldjTU1Wc3ZEeHNSYzBzS1lEMWpZd3NaS0hqL05FSTZ4YXlheWllV2d2?=
 =?utf-8?B?WVU5SzRtTEZ3SzVXSWExMitqS1lnSHI1OVhwYUh3UUhYbUh2Sm5rZVRMZ1dS?=
 =?utf-8?B?TTRlRXBOK296YjRUclMyNkw1elJtcjloSTJkUVVCR29BSzFiK2EvbkNoVEdr?=
 =?utf-8?B?RTBmN1JhamNCWkNoWHhOcWh1SzNIblpObExOL1Z2UFFiSm5mZVNjY2tiM3lJ?=
 =?utf-8?B?T3dad3N6M2FwS1RyM3pWbkl5TStXSHlkdTFvQml0cGJhUjhJcEI1Tk1VdXI0?=
 =?utf-8?B?VHhPN3FKSFV5QUxrNGtxMDFqVnJsOXdXRVVYOUNHbWlWNHB6REYxN25weTNX?=
 =?utf-8?B?bjBnYURoL1c4WFNsOWM4bE5FRzg0L2JBVUF2WWJpdzA2WDlUWjgwMFQxbk04?=
 =?utf-8?B?NDJvYmp1V1BZTERwQkVUajNFbC92SDcxSENWNnFhYzNSSms2aTV3bmYrTnBF?=
 =?utf-8?B?elRCc01lMG5vaHY3c2ZSWlJCcGZOUTA2WnIvR0liYlpGeTU4NnF4MEYzdnJU?=
 =?utf-8?B?WG1VaFY3a0dRNVhZVEpkRHc4MVRvbVBSRjB3TzJiY01xTmhjUkNjVGx1Z2dU?=
 =?utf-8?B?VXd3UFpHQU5ZTjFKMmdtb05oYzh5aXllWm84TEpObzcyQjk0bmczVm41eTFG?=
 =?utf-8?B?MUlnT1M0c3MvbmdUa281MEdlcW96ZjFoMjMzNU53bk9uYXJLR2dNTkVacVpJ?=
 =?utf-8?B?SHNpS0V6L1ZUb1JGM2xFSzVxTVMwVnBOcHBHUHk4eUU3UGE0YlZrcXRDc2Nn?=
 =?utf-8?B?SmpKOGp4SzRXZnhuYnI5SktBMnEyOC80cXpoS2VLRWtFYUhpQTNZbTUxK0d6?=
 =?utf-8?B?Mm5jeFg4UHZlcFhnMEFvM0VwUklSL0NNS1RWb1pQYk5xd2Y1dk1jSTAwVVB0?=
 =?utf-8?B?RDJDak92b0RnUDRiYk50ay94VjhLMk5oM01jNlA5UGZvdW9mdG1tbllvWTJH?=
 =?utf-8?B?NEdzQ2xiSDhtaEl1bWFGTVZmVVU2bUYzTm01VU5ETzB3cjNBYy9UNDFWUGtL?=
 =?utf-8?B?M1JDTkxLTmNsdU84TEp6c1MxWjZ0RUhTdFJTa0Mrc3J1NDNoSEZlREx0UEVW?=
 =?utf-8?B?c3NKV3dzcnVDMW9aTUpnQU9uTGUvcWFWNVNzc0pYV1F6SmNFMWt3T09KSm1K?=
 =?utf-8?B?cVBOS3hUancyck93c0liSGFJdDcvOTJITzhINGZxNWd4TUNoTlYrMVB6VHB1?=
 =?utf-8?Q?R8Axy0ZpRtOOXKsVeMjFXeF7o?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b43388-0dad-4efd-3aff-08dd83a09daf
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 02:26:42.1971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BgMqiep7NT6szjuaSfuPT8LnID6UU3e9fM78dTDW1QK/GZ4hfKaja8eOlWvNGLaAWDk037AQxI1ZxbiXgY+hNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7384
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

Hello, Danilo,

On April 24, 2025, 8:08 p.m. UTC   Danilo Krummrich wrote:
> On Thu, Apr 24, 2025 at 02:54:42PM -0400, Joel Fernandes wrote:
> > 
> > 
> > On 4/23/2025 10:06 AM, Danilo Krummrich wrote:
> > [...]
> > >> +
> > >> +    /// Probe for VBIOS extraction
> > >> +    /// Once the VBIOS object is built, bar0 is not read for vbios purposes anymore.
> > >> +    pub(crate) fn probe(bar0: &Devres<Bar0>) -> Result<Self> {
> > > 
> > > Let's not call it probe(), what about VBios::parse(), or simply VBios::new()?
> > > 
> > 
> > Yes, new() is better. I changed it.
> > 
> > >> +        // VBIOS data vector: As BIOS images are scanned, they are added to this vector
> > >> +        // for reference or copying into other data structures. It is the entire
> > >> +        // scanned contents of the VBIOS which progressively extends. It is used
> > >> +        // so that we do not re-read any contents that are already read as we use
> > >> +        // the cumulative length read so far, and re-read any gaps as we extend
> > >> +        // the length
> > >> +        let mut data = KVec::new();
> > >> +
> > >> +        // Loop through all the BiosImage and extract relevant ones and relevant data from them
> > >> +        let mut cur_offset = 0;
> > > 
> > > I suggest to create a new type that contains data and offset and implement
> > > read_bios_image_at_offset() and friends as methods of this type. I think this
> > > would turn out much cleaner.
> > I moved it into struct Vbios {} itself instead of introducing a new type. Is
> > that Ok?
> > 
> > I agree it is cleaner. Please see below link for this particular refactor
> > (moving data) and let me know if it looks Ok to you: http://bit.ly/4lHfDKZ
> 
> I still think a new type would be better, the Option<KVec<u8>> that is only used
> for the construction of the actual type instance is a bit weird. It's basically
> two types in one, which is also why you need two options -- better separate
> them.

Ok, makes sense. Will make this change and see what it
looks like.

thanks,

- Joel


>
