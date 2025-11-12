Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F41C54787
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 21:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408E910E1D9;
	Wed, 12 Nov 2025 20:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pRkh/wJ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010039.outbound.protection.outlook.com [52.101.85.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A991D10E127;
 Wed, 12 Nov 2025 20:35:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eco607NMGgTkw05UFnYqTSKtW9XHAOq7gUBH1YK8cJtR//xRNZ1tT33CZYYM15x8DUAKcSsEBROJSIs+rpdJD9Xoa3gholFWPXs4o2GvLYuwQOzRC9omYbkEohjBfTkFqoyQzBamwgSFJJsN3xAmP4CFlV5AApG2uKpl+AXk9WQW5CEtaJEVGzXQHO8G95c1uFoLf/7jdxv+ueRHOgAeJGwEOz2qQlgcMASkDsWfwoyuiAm+JFiZtb908/hMwLBN0VycM7Zs6ngO3VjfslbhSAuKS3G3rJXzv3gV8j6oYjHHT/Us5arHFhBeJePIDEJmvfb7iT2RJYq3xoOk5/8gXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nVM5Zn5jxm6M4t8dPE8rgbH0wl1VTOhLWMEm3gyPT4=;
 b=SOKXwMmRpCRLxmhwXy1VSkcIC3OVpNtkNoIFsPrxmy1u/ilcsg05mliTr5v1mTxukHn0u55FcgxrmrgqU2iYliCx0fm4eQrEVKioxCsLv2dLprihm+b4w356Jsbolkc/E9p15snDzwy0FYbLDkZiObdUA9kh9UjT6jRCdt5wBWlK4SsgaES3EC4B3MHXlSNsZ/WXLgUY7Sw0dmbTt961fI6ZffRS+BsXL+UWd+/eSodjIIF/cz1lt4KoBaX5U81JMNj1YDRciwos3b40FoVqO3nYc3TaaIxwe6zNrXg+bIJ7TiyQVSZMGScMY6j5lOGhI3S4JRYOgGd2WOsnnhJBiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nVM5Zn5jxm6M4t8dPE8rgbH0wl1VTOhLWMEm3gyPT4=;
 b=pRkh/wJ6+gGo+VOOj0zmd0Su3YvJYQagwW6gQNZggLarpgYlSgOc2GoCJj2woAbnLg9nS251jUDySitWul5Wp2zEhbkRVp54RVuch7ljfu9jxasKuMqc+tdQ7j8mkIbT9mbjw7DFv8wv9HGeJrP9k1aqFl0X42Dhb+k8P381pnP57qD/lFH+Kns/nmSaQ3B/ZE3cxW6KldGFwd86Ho55BmV5RmmJsxIf1Sd/mFpr1L3h0AiHrpSIDLeBmQuUvLwA55RuUURqv2tLRxgCmOnAP0WJFf15Nh3bAMeXLoWvawUB+trNSJDW8V6OSZhfrErBfFHWgU1oj8g2fW4F9TQJyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by DS7PR12MB6261.namprd12.prod.outlook.com (2603:10b6:8:97::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 20:35:18 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 20:35:17 +0000
Message-ID: <fab924f0-dbbc-453f-bd8e-0abe8d0bbc3e@nvidia.com>
Date: Wed, 12 Nov 2025 15:35:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/14] gpu: nova-core: gsp: Retrieve GSP static info to
 gather GPU information
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <20251106231153.2925637-1-joelagnelf@nvidia.com>
 <20251106231153.2925637-15-joelagnelf@nvidia.com>
 <970fd472a5284fd5b8416bed6a24e722f9a96a74.camel@redhat.com>
 <f36dc492-507b-489c-8609-6a760526a371@nvidia.com>
Content-Language: en-US
In-Reply-To: <f36dc492-507b-489c-8609-6a760526a371@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|DS7PR12MB6261:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ffc9ed3-774c-44b2-6635-08de222afdac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGVoYUNtRklkSlJ1cjVVV1hRL3U2OW91b0RvTnVzcUJiZmhmcFJkSzFmQ29T?=
 =?utf-8?B?TXp0YndHb3daWEZxc3hkU2pGb0ZpTGxzR0xuWXlKNFdvcHRRVWpMeGZKMDlZ?=
 =?utf-8?B?M1B1YktNMVNNcXI4b3dadThHQmtFTkJmcFM1YWlML29mVGU1UUljMHRtMEtT?=
 =?utf-8?B?UEM4TzZoTmpjU3NvYmJHSTNXbnM3WnB2b0pwK0JPdTVlMGlwbXZEUVFEQ2pK?=
 =?utf-8?B?cDR2eWFFVHNLVGZORDIrbmF2STU0NVdVdE4vdUwzZEJrYjVCNTUzSXZqZFd0?=
 =?utf-8?B?dUFXTWRXcVlzVXFtOGo3eHYyN1ZTWXRhQTBiTzg4My95aDRWQTBKeE1aUVR3?=
 =?utf-8?B?WGV4OVh6ZEo1MGdETG9JUDRIYTkxdjZZVVkxdVp3bTJ0LzdPZkxwSkxsNVl1?=
 =?utf-8?B?U1BtVlhjWjRyTS9abVMya0hrMGszOWFGbVNFc2ZsaHBiVUg2WkVmSVJrLzJZ?=
 =?utf-8?B?WitLU3Rlb2tZVXBZM2lzRDdEMFFSRXIyS1YxVWoxMm9YNHNLSDBrcGZtdVUz?=
 =?utf-8?B?RDBkY1VhV1M5WjVOb0JhaFNMZGwvRzhnSDE1S3JmaDJTK25mTVo2QmtHYm83?=
 =?utf-8?B?R0gwaTljNVY2VFlybmRmMUgveTNtNEFpYVAxT0FCUnZ1SHljMlJBSFEwODNL?=
 =?utf-8?B?NFBrQ1l5Q09TcitJVHRmbEE0ZGRMRVVTYVlvS3AyTGRjRTg4Y2RZUjl1MlBo?=
 =?utf-8?B?NFh6bmVZLzZFQ2M4N3hxbm9VK1FkYXp1Qi92RXpDWXJRSjFiandlb1poYWY3?=
 =?utf-8?B?VE1WOFBKbEg1dXNuSnpkVUFpbWNaV09SSEo0bnVneGFlS1ptVDgxUThYQUtP?=
 =?utf-8?B?bG9iWUdVNWhKUERYNUcxVlBPd3c0VjV6aHQ2Tk9VK2Z1bGJVb2V4UEpBT3pu?=
 =?utf-8?B?WENXN0VhbGVva1FBRXRmQ3Nqck9MRTdjSElsN2VkbE1QRzRhQTVqcGNUQ1pO?=
 =?utf-8?B?bEV5NHFqZkVGRjZSZm9LQ0dTamJkbmhxSU15MnhBV1I1eDFZUlYxMktocnpG?=
 =?utf-8?B?a09kaEJuRkNNRmZSRzlvUjUzblRad3hONHpPNVljbml5clcvejE1Y09DNTJ2?=
 =?utf-8?B?TDFlL0FnVlZWSE9kVTU3QTA2Ykl2WXoxZW5JUGtTRitUOVRaWVBpeFA0VHJJ?=
 =?utf-8?B?a1ZsT0I1K3k4dUsrSlZJOGlab1loZXZVcXoveUFveW9ZRDl0dEtldmx5eUtJ?=
 =?utf-8?B?ZWxQeVJVM3dFaFl5VzZQbGp2elZEVmFNNUpyZ3VudVVUdWtJc2ljQ3pLYlg0?=
 =?utf-8?B?U0loa1F2UHBRaHNUa21GUENMM0RPcXczYk84MndIZ2g1TzFIdkNuNFBvMjE4?=
 =?utf-8?B?MTlPc2ZSZThtbXdKdVBkRjFVRXVodmFxY2VJNm1WNzduZHQzZndtdEtZc21J?=
 =?utf-8?B?b0dVNm51Q0ZLOU8wN3p1UmtTS3l6b1FSOE0rZEpEZFE0OUJvTW15RzZ1Nlls?=
 =?utf-8?B?d0twd1ZqVXNKS1pEUXYxUGJ1clFoclBrOGtGYzFNcHIwVjFjVkF4N2lzb1M1?=
 =?utf-8?B?S21IUndqeGFpbzc2b09CUk9peVEvZTFGa2JUdDlkMUZ0d05xcFkzVE9LdjRW?=
 =?utf-8?B?MUJ6amZ1Z1hkOE42NmtZcURRT09wQWRpZ1o4bEs1YXFUcjRzNDd2N1FDRHMv?=
 =?utf-8?B?SWZOYzJUQTcyam1hc3UwWWVvNy9BNWRaY051K2gvVDJKOE11YnUxNEtGeEI4?=
 =?utf-8?B?TEgzSHBVOEVIV2hVVExWNWc3eDRDR0FPNll5UzZoYkZueUhvdWowNm9Jb3Aw?=
 =?utf-8?B?TUlTaGVYQTdzZ0NubDVudFJZaUpnZjh0cnBpalJ3WW1uZXZUM3ZYdk9rNG1T?=
 =?utf-8?B?aTgwVDJRQXNXZE5FRk5QeUgzSFlENG5oSDNzcDV6WlFwc3FCMnhzc1h6Mmpv?=
 =?utf-8?B?a2lFZnNXT3FycmFWWk1PRDMxTEhLNjgvUDRTQk9NcEJCQ3Uwek5zT2tPaHdv?=
 =?utf-8?Q?unWP+Y7Ttg1Sjtmv+R5xD3aeA/Qg2jRX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGZSNnZrMmMrVmcyQ3NCOXFQTnRvNE1wMkdmd09kNUpzSFVxa1lvYU5xNGZL?=
 =?utf-8?B?b1F4VWZ0dU1xSHpBK3JXVlREVjFadTNYMXNsbjRqdGM3UnNQR2g4VUIvWURZ?=
 =?utf-8?B?Z0c2QTBGa3NodC9hamhGSW9TQUNGNnRYRFZLdXBlY1FXUitlRHo2aEp2UEhE?=
 =?utf-8?B?WDNHTGJoZXBpbzV2QzZRODlEMTJDNTdJWmJ6SnpBVHFPZFZIQmEwTGo1bHZZ?=
 =?utf-8?B?cDQrS0I0ZTJ6MG9QcU50N2laV0k1YWhWeklISzkvTTdteVdWT05tcHE0eVNn?=
 =?utf-8?B?ZFhUN0Q2Y0w1Z1E2S2xwQU5ZQ3dudWFaNFBkM0tWOHRrSEtlNEZ1dkVHdlY5?=
 =?utf-8?B?bDhsd25JMHRuendXbmFJMnphSTNXbVVoZ2VSUDRoQnArVDYvVjlPSU9GTk4w?=
 =?utf-8?B?TUtjVHBKUi9VWkY3VEVaeXBXNERnRDZwZUxiOGJwbU9ZdkgzVDFCQkFzN013?=
 =?utf-8?B?dzhVTmMvbGJYY2dTcjNuNTZzeHdBNmY5QWVEdVhTcmhIanpGd1NrcjRNUU1a?=
 =?utf-8?B?REdYU0lPQ1NybllkZndEZ0ltaTFRT3hHN2VMbnJSY3IyTE5rMmpJem5sTUpD?=
 =?utf-8?B?Q3lGVVJhVWo1clNHNmJoSzZDMGsyRGg1UkkyRTI0eGlJeWJWTTc5MXp3K1Ns?=
 =?utf-8?B?RmZJRlVFaHZhbVA0UE1jZWlYZGg0M256UXpmTCs0a1JxMTg3NlhYQzdDcDla?=
 =?utf-8?B?WXFWUXNUc3hYa3NkdlVNOXlTMi85R1lmY3U1T1ZGTGxYTXg5eFMyM29JSDcv?=
 =?utf-8?B?ejdhc0ZhS25TRWN3ZmlMM1NmZHAvb3VLVTl6T2xZSDM5aEFWcTBqZkdzWXFx?=
 =?utf-8?B?bHZ6K0E3V1crc0FYREc4blZ3WUwxVTNGZFlJNVdNQjQzeEE5Q2RNbmVFOE9J?=
 =?utf-8?B?SmFERWdtUTdReklTRmxJeUl4eEhQaUcwTm84aVI0cW8vdmc4RnE2THY1emlX?=
 =?utf-8?B?S3BDN2VwRmh2ZWdNODc5ckRkNzFBMERoREYxbEVRaXZ4MER3a3FkZDZad2JG?=
 =?utf-8?B?SzFnY2xqR29jSk1PdG9FR2FzZmhBNTZGZ1FWdzkrM2RaWVl0MklpUk9pZXZK?=
 =?utf-8?B?VC9vdE9ia1pQN0V0YUJNQTJ1TkdJV1VUeEN1ZW5QQUZkTU5Fekx5ZW0vWXpN?=
 =?utf-8?B?V2hsTThEenJ2V0grWUowbmdKMHVpR2xIdFF6Rzl2QUdpVzJ2Z0YzOWY4aEZs?=
 =?utf-8?B?QmVuSk5HUWlqZDRLaWEyZnlENzlXaERyUWczWkdtdlRGb0xoK2VNVmJ4NnVU?=
 =?utf-8?B?M1ZVdnRvdDFGYmo4TGRYWGZIQXloWnNFbnIxbTFjZXNWaExMbE43WVFYYUg2?=
 =?utf-8?B?QVNnZlZhSVZVbUhlRFIrRUp5OHl3Y2ZhbEYvS3VCKzJDR3dTRU1LekUvdFBY?=
 =?utf-8?B?VGg2RXhZMVFWRmhraVFMVVhZYk41akF4ZG1XQTRxWFp1dEZxdndLeWJxRU5B?=
 =?utf-8?B?YktZbkdhaFoyRDNVaUk1ZE5Ub0FiMEZ5WDZVU1ZjdDlWdGFrOGRvYnlOeDhi?=
 =?utf-8?B?SVdkcUlCNHY5N1pEWVE2UE9RaWJnSGtyZEl0dnZlcjIrRXRCMngyVFAxN2kx?=
 =?utf-8?B?VXovMUptM3k0NitHK0h6Vk9tRGFpTE9SbE0vaGtNSnpia0RqYzR1UmxzajN1?=
 =?utf-8?B?b205eFJaWjliYVRqUjMrMVpvQmUrRG82NmZLQlBSQzk4ck85V2MwczdmUHJt?=
 =?utf-8?B?Lyt4Um9UVzREOG1IWU01TE1oRVl2QkhsWHVqdGlhYk1tRXJqZDZBK2g2Y2g2?=
 =?utf-8?B?eDE5VmJLMjdBN3NmK0U3NW9LME9rMldHMEdHS2cxNklsaXFOTTZkdUUyamIw?=
 =?utf-8?B?d1U5ZlBkdHl6R0JSMHVoWE96ZjdRb0dsRUFKTXdGTzRaVHVVSkpqdFFZRThO?=
 =?utf-8?B?NHExeDVxSURTb2JmNXNMZitmUEVwMWVzZERIRzI3bUpkaG1tM0VMUmw3RjN1?=
 =?utf-8?B?YkIrYVRKeDZNY0RYQ2xpeUNBYnZaRlFOUy95Tk5tdE5uS3V6QnNBU0ZGVzhi?=
 =?utf-8?B?cGlHRGRRNU84Z2VvVkoxL05vY2VkOGpNTjkzZllyRlU3RHhKcnVSdlJ3UEhP?=
 =?utf-8?B?YlRBTUl3Z3UybFFEZHVNUm9iQU1RQSttaFRmcXduZHhaT01TWVpaN0hReGtW?=
 =?utf-8?B?VUphR2Fpc2RGemdML0Q5eUFJd1pXYnJEQmtjMTRkR1JpNDAwYTEwcWdwdHEr?=
 =?utf-8?B?dWc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffc9ed3-774c-44b2-6635-08de222afdac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 20:35:17.5636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gE+KFGWgQ1BtD2ZDARwlMX8rq3GS/QXJ4unLGxrneSdW+Cpo8oefGN5CyM05djylrqL75996UHwe8rPw0zUgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6261
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



On 11/12/2025 3:22 PM, Joel Fernandes wrote:
> On 11/11/2025 5:02 PM, Lyude Paul wrote:
> [...]
> 
>>> +#[repr(C)]
>>> +#[derive(Debug, Copy, Clone)]
>>> +pub struct GspStaticConfigInfo_t {
>>> +    pub grCapsBits: [u8_; 23usize],
>>> +    pub gidInfo: NV2080_CTRL_GPU_GET_GID_INFO_PARAMS,
>>> +    pub SKUInfo: NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS,
>>> +    pub fbRegionInfoParams: NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS,
>>> +    pub sriovCaps: NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS,
>>> +    pub sriovMaxGfid: u32_,
>>> +    pub engineCaps: [u32_; 3usize],
>>> +    pub poisonFuseEnabled: u8_,
>>> +    pub fb_length: u64_,
>>> +    pub fbio_mask: u64_,
>>> +    pub fb_bus_width: u32_,
>>> +    pub fb_ram_type: u32_,
>>> +    pub fbp_mask: u64_,
>>> +    pub l2_cache_size: u32_,
>>> +    pub gpuNameString: [u8_; 64usize],
>>> +    pub gpuShortNameString: [u8_; 64usize],
> 
> [...]
> 
>>> +mod util;
>>>  mod vbios;
>>>  
>>>  pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
>>> diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
>>> new file mode 100644
>>> index 000000000000..f1a4dea44c10
>>> --- /dev/null
>>> +++ b/drivers/gpu/nova-core/util.rs
>>> @@ -0,0 +1,16 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +/// Converts a null-terminated byte array to a string slice.
>>> +///
>>> +/// Returns "invalid" if the bytes are not valid UTF-8 or not null-terminated.
>>> +pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> &str {
>>> +    use kernel::str::CStr;
>>> +
>>> +    // Find the first null byte, then create a slice that includes it.
>>> +    bytes
>>> +        .iter()
>>> +        .position(|&b| b == 0)
>>> +        .and_then(|null_pos| CStr::from_bytes_with_nul(&bytes[..=null_pos]).ok())
>>> +        .and_then(|cstr| cstr.to_str().ok())
>>> +        .unwrap_or("invalid")
>>
>> I feel like I'm missing something obvious here so excuse me if I am. But if
>> CStr::from_bytes_with_nul is already scanning the string for a NULL byte, why
>> do we need to do iter().position(|&b| b == 0)?
> 
> It is because the .get() above could potentially return an entire buffer with
> no-null termintaor, as unlikely as that might be. In this case the
> `.unwrap_or(msg.gpuNameString.len() - 1),` bit will execute returning 63 as the
> length of the buffer space is 64 bytes. `CStr::from_bytes_with_nul()` will then
> separately look for the NULL and fail into returning "invalid" as the string.
> 
> So mainly, the redundant `.position()` call is it is to handle the failure case.

Sorry clarifying my answer as I was referring to the other snippet. The real
reason is from_bytes_with_nul(bytes: &[u8]) requires the slice to be exactly the
length of the string plus one byte for NULL. You can't pass it a long slice and
have interior NULLs.

This is also mentioned here:

    /// The provided slice must be `NUL`-terminated, does not contain any
    /// interior `NUL` bytes.
    pub const fn from_bytes_with_nul(bytes: &[u8]) -> Result<&Self..

It is possible that callers pass buffers with interior NULLs, these come from
the firmware. So str_from_null_terminated has to find the NULL position first.

Does that answer your question?

Thanks.

