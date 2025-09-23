Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EACB93C95
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 03:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B4810E08F;
	Tue, 23 Sep 2025 01:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KP/HyCKl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012014.outbound.protection.outlook.com [52.101.43.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9242710E08F;
 Tue, 23 Sep 2025 01:07:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RT4as51lHwJOjsXsrrXQqfxSNq/pM+z1yk+xe0CAUd/QcJWhFfghKTyEOSBEtz0rjYqW82WzlKM/uWxb7ILc3K3BRqzLwxkOj5MXz6oppuUbNW+/VJYE6XgWl5gBi9gxAhRqdr2h/gexPRBfHG1Gb92taHdEbBqyJMhmYp5JOWZtyaZwSUgEZO9fzvvrhNq5X0RFKE9+DSEGQRj7jfHL1zdE2NgWDxxSSLPv7iMKZXJcbLP9SvX8BXtI5MknppKm/IBnrpJ+1ZxhJ4bOlSrzlSz8vfuBOxwk2mj/+1WnUxkKPpdtDQgFqWMyCdBADqxGetOaA6CtKZkh9Cmben3PUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFqVfvuMIVTD6EOenxbIgfN/tvId5690+vLfqY+nbS0=;
 b=birbhArYPVjU6wFTwjaHQ/9xt1biInrMgkM5dAa4bBD3G60FdD+r3kXgbpFTYQ/8Pc5a7rQkKTjEHUDieqyF7AtVY0RnaT0b233SIsOcEVg/MvTuZymN1AZ60CP5RFJjyC+2NsWdVW/o2pwhU3Kk18MJ3EHBIM7Kv5FkiLHKU08wC8S96hXFMTK8wwFJt4S/C6bDfI9sEmBUSCdRVixfFM7YlbO+chZUmwscPBaHv/+RoKktycx+viDitu202PhvMzou3O/O99fm3xRwoNctrIqt101vv79VbNJCwYgnIbbVt5Slv5Cjoul5+BG2qbpEdZ5THrByL64Lpl8k0RrAig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFqVfvuMIVTD6EOenxbIgfN/tvId5690+vLfqY+nbS0=;
 b=KP/HyCKlT0Qk2nTql993lXePJyEo0Q/hmXwiA7iG2N2CxabFApzjSOTAHSLtkgB6fTn9Ro8g6ii1VpC0oZFtqlOE+7A1qwdpFqWt/R8ORKltJQRDVmGu4qtl9DPCtDERzfa605FR2WFPfk27PSV4eOkghUW8YGzCSRZdSM8/W5NtpByC+1p8R/bLfNtydWtz2HpKblNW1gtfzn8DzVLZYE3Je7NgKhoVE8EkW4KSyrp4ntiYkX/90m9JbhuBM/6Gif+iXtmv3r6wKb2xrvOWYH17JpSvp04ks8l/TKP4hQAvSL9QBTXsAC50/fT4FrvPxGZJeTbPoezOexs4+CYuUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DS0PR12MB8441.namprd12.prod.outlook.com (2603:10b6:8:123::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 01:07:38 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 01:07:37 +0000
Message-ID: <be96c39c-4ac5-4a4c-b5fc-6b1c1026db30@nvidia.com>
Date: Mon, 22 Sep 2025 18:07:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/10] nova-core: falcon: Add support to check if
 RISC-V is active
To: Timur Tabi <ttabi@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Cc: "lossin@kernel.org" <lossin@kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "tmgross@umich.edu" <tmgross@umich.edu>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-9-apopple@nvidia.com>
 <38bbcbbb7bdf88f3a06ed9925d4fa058d6352d51.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <38bbcbbb7bdf88f3a06ed9925d4fa058d6352d51.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0018.namprd08.prod.outlook.com
 (2603:10b6:a03:100::31) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DS0PR12MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c6ef8b5-6081-490f-ffa3-08ddfa3d963e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0MxQmdyb0VZbFBHWWRjMFd4REVVbElKMjZUM0ZlckM1bXJKZ3FENXI0SklB?=
 =?utf-8?B?V1FIUU1FM1RwaU04YStvUWhBcXBWMHBIRGlCS0pjWnJjb3hpZlNwU045UDNV?=
 =?utf-8?B?TllGM1hzNjBjYUZBRmNSZXhnOENSbk56TUc3Vk9aMjhCY2V5cjF6bXM1RlVj?=
 =?utf-8?B?akdVY3RRODlsTXFKbGJOV0dzSkRSTVBEck5rVEZ2SUwrWjF0eEg3Ti9tUllC?=
 =?utf-8?B?Wi9CcUJyV0t3SkxyTkRHRFpXMVdha2E3a3hQZFlwWXVrcDhIOXNTemdaVkly?=
 =?utf-8?B?RWRpb1RiWkdhRUUwbFJ0QnVvc09SUGlZaFZxOFB0dkxKMkF0UlZTQWwyTnpC?=
 =?utf-8?B?L0lXbmVxaXh1RzNPTkkvd1RwQnMyVlZhMjkwQkNTemRTMlBMK1oxZFlJanMy?=
 =?utf-8?B?cFFZTFZHQkw1Y0wzZ2tTb1FydUdla3lFNmJkTXNmM1Fwc2dKcXgrdytMMys5?=
 =?utf-8?B?SEErM3o0OUtyNWNpb2o0dDJjK2ZiRmoyK1d4REJxUnZFZFlzTEp3WThEU3Vx?=
 =?utf-8?B?RmFzQzlUWVBOanR3bzZ3bkprUUtVc09aOWRtYzh0aVRQRXRhN0x4V2xQRHcw?=
 =?utf-8?B?T1RaZnBYREVFT0pHRkxDQ1l0ZWthV0owNFlyTDdRVUJIN2d2SjA0TmRGbGFj?=
 =?utf-8?B?c01OZFJoSTdMUnNQZDIyR3BjMnpsRTErUUFtcFNzNElRWFo4elAwbFJTQzl1?=
 =?utf-8?B?NWdzajJkZFdkbGhlQ2lJRGhIV2JpZVY3OHRMV2JaajlaWU5mR0txaytvSWdP?=
 =?utf-8?B?dUpabjNzdThacURsaFRWc2pVZE1OS2h6bkVob2N0Z3piQTdGKzNoNUJRcnpD?=
 =?utf-8?B?TERtU256NVBpcnNmZlVTcWxkOEZwSW9QUitnOXYzVnduZUdKK2toYXE3N25L?=
 =?utf-8?B?V2dSUDVoa0hKU1B4RWVzcFU4djZmMzFhTTIrT0k4MEtnNkpOR2hJcDBWemQr?=
 =?utf-8?B?REoyajgvRnZkUDhzSkxQMThGK0pJZ0E1bFFVZWhsSWtuYW5wZXoxeUNWenFJ?=
 =?utf-8?B?blZnTk5tbjFOeFBuZzZlVi9pVHkrb3ordWZmSWpPOWZhd1BSOUNTa3ZsSEg3?=
 =?utf-8?B?enVrYU4vems1QlpCVkt1NFNKNHkrRnB6aWx6UVJWQmRIbjc2blhCeWM4VmJ1?=
 =?utf-8?B?T3lYU1JwQ1VtS2lVaGRFajZzcnhBZW5DUGRqcjAyRjJUZ2MxTURUR0dVbTEx?=
 =?utf-8?B?SC95UGtpOVdFbzFiV2RneHk0L2xwL0NRZFhweDFjbkgvQXh5R3ZZYXNzQkUr?=
 =?utf-8?B?b3l4OENMc01KVS9FaG1XWlNSM2Z6bmFjdHhhTjJma1F5eWhnTVJsekU4Q2NW?=
 =?utf-8?B?alV6R3pHQUxSR2IzQnpjV0NRN09kaHVUbDA1MVpoaC9JeFZFZlNoT2tYaWl1?=
 =?utf-8?B?UklBM1dzSS80RDJ2NTVteEdlNGZURDdLa2RpdzRhNmJMZlE0WkVOZHh1bUtw?=
 =?utf-8?B?KytuRW1tcDRmOW9RYkNENzNvOXIxSjBpSzZRbUU3d01aSHZzTnVVejBaWE1l?=
 =?utf-8?B?Y3VOS2taMi85ekEyY1AvWFVpUHZLTXg4MGRqT0FzbUJ6TlExYnNPa201RDZq?=
 =?utf-8?B?amtyY0NPdXRTcXlVNFhaK0lsb2c0dEhZam5UMGVubHl4dFJTd3d5Mk5CNWJD?=
 =?utf-8?B?a1dMRkY1MlBaamZGOG1LZGwzVUY2anZpSGJONXg4ZUxGcXpzK2JJeDl6R0xs?=
 =?utf-8?B?Ni9sVENDMVhHbmZFUjljVjR0d0FabVAxUWo2VU1zdDg4TTlkUTlVVGZKQlRX?=
 =?utf-8?B?VEdTbzNMNnVPSWFNaWdzY2hSRmYwTmtlYXhyTmQwSSsxa29Ec3NOS0JZUlRH?=
 =?utf-8?B?MHFvRnlrUlFqSmo5YnNYUTJlOFpraFZ0aE1LSEJiZGZwNUhUVlBxNGswRTR2?=
 =?utf-8?B?WDNGV0ZlaUlWQjBwTHJwMmJTOTkrYldPMkxrZWhlY2wxUkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlN4by9UYUtYY0lHc0JZcGxEdEZob3NNcXVSRU1tZTlnZmJnR28xdUhIb0M1?=
 =?utf-8?B?YjQ2YTZlSkZzVmtNUHZTSmtuUEZsSm9hV0hHWTBsUnRzTHBtR0YzaWk5cFFX?=
 =?utf-8?B?TkJBLzRjWmZwVlB0dDU0a2NwK1gzSXBJcUUxd1RhQVZZNURITTNFcmd6K3d2?=
 =?utf-8?B?ZVZYQnFvZThyaGVmbEJjVGEvazNIYkh3dnBNQkpRQ25rUFBsUEU0TUV5K243?=
 =?utf-8?B?TWlnMTRXTXRIL2lSM3Rya29PNUpYUVg1UGkrVjUxMUdnWTAweGhxcWk3YWRQ?=
 =?utf-8?B?TTJMQ1lJdFNkVFVDeEtWaEVSMHN5ZmJsMkZrWWJyTnhsTHMxQkNndll6RVJw?=
 =?utf-8?B?NzJBdlpiWUdic0tKdnRUOUlyWS9ZSEM4TWdXZTlNbXJ3b1ZiUzgyUDZPTEdC?=
 =?utf-8?B?MUU0WDZja0JnYlNwVXhob3JPRUNGd2lJamNiazY3NGFSbUtqeEZSalNmRDBi?=
 =?utf-8?B?VE5BSEF1S3J6QXM2RlZaYytlZ0R4U1IvWlBUOXZLQi9oY0NwS3ZtdVlFbnpN?=
 =?utf-8?B?ZTZYaFNJNEQrN3J1OVl3WVJZeURUZEE0eWZpN29WZ1drMzdBNFNaNUZuMCta?=
 =?utf-8?B?RU9va3IvREo0NGxsS0h3NUwrRytkZFg4RGphbDFoVDN4U1Frb09BN0J6ZWlK?=
 =?utf-8?B?Ykg0bVFmeUY1RzVkUjVhZVJnb3djbXBzaEtRR2RnRkQ4QTM0TnBPMHFnTUJl?=
 =?utf-8?B?YzVBQmRLSGFRLzBaTnFBak10QkdEUzFleDBTOC9YVUdpeGNERlVTWVF3TUFm?=
 =?utf-8?B?QndMejFodW9sRmVmcmd5RjBRVmhTRS85S0cxTUlSa0x3aTNKSW5wcjlsczhs?=
 =?utf-8?B?dWcvcmVzdk1UN3hrK01sNWRFTFo4blppUmlBSHZZNVZpcHFzKzJBUnp4TnVi?=
 =?utf-8?B?a0lYUEFyTUN0TndIbTVTNlMzWDlKeEtXN0orQUhISWdPTnNKRDF0ckNLbCt1?=
 =?utf-8?B?VjdpKzhUa2l3Q1JENHVsNTkybVYyYWRZZFR6V3ZIVlhhaFFYYk5ud0RZaHdy?=
 =?utf-8?B?MmJiUU05eEh6dlgvVVBPejdxZjhMZjM0eUtrc2FrRkxBbE1XeVJiUDlNMngw?=
 =?utf-8?B?d2dDWkVuWGY3NVRpUWNwUkUyTjYzMThBRm5CWGJlNkxxL3ZTc29CZjFvRHJv?=
 =?utf-8?B?cmN6bTNuak55VytpQXZmTElSZ01sVWdSeERBTmhxMlBDazZGUkFFc3hNVHZn?=
 =?utf-8?B?UjMwMXpPazFvdGFVMStnQmlKcURxNndtTXhER2daTGdqdjc5Z2JZNFh0TUFX?=
 =?utf-8?B?UmZ6aDMzR0xHZHIwMy94d3cySEsxTERJQ0ZyZkx2cXJOK2RocUNnNUNhbzdF?=
 =?utf-8?B?S3lNQ2hMSDkzYjFaeWJ5cmdqb2xlbXJ3cENEVVF5VFZNMS9TaVJiZHlXWUJl?=
 =?utf-8?B?ck54cHlPUy80ZVltclFNU2o3d2t4MzRuclpqZ3BxMmw5dDRLUXhXeEtCRmMv?=
 =?utf-8?B?QWtBbS9PUENacVQ3eE1FTCt1VXh3bFFvV3RXaGd2NjZ3bHBPUkgzTU5EU0NQ?=
 =?utf-8?B?N1NBR2xsa3YybnZxUWw3TnpaajlPek1PWWdSNWlQdElaWWh5TUp5Tkp6UkVB?=
 =?utf-8?B?TnRWY0tFNHBNNXNBM3NJanRnSXpLL01FbGRtT3ZaUlE2a0lXeks5YmxkdVZK?=
 =?utf-8?B?SGI2ZmJxaHRMa05yeUZQRDVxdDRhNVc2eGZ3TFpQZVQrUlg3anVXS01QRVIx?=
 =?utf-8?B?eUc2YXA5eWdvUUVFdSsyQWNJTHd3Ynd2aUJIOTF0aytTcXg4Y0F4V041RmU5?=
 =?utf-8?B?V2w1UUFaQUN2SlhEZmFqMHlVdmF0VmhIOEcvWTQzMnlSbDhZRlJMUGNsRnho?=
 =?utf-8?B?bXoxazlHNHV1RzdBVGtuWVZOVmVoanBRMUw3YXFIbUFWRU9MaHE3eThyRVJl?=
 =?utf-8?B?a0RDWWhtc3FXUUVtNW9FeXpvT3BoWHY5cnRIa1U3OERuMVhaSEwyQkttT0M4?=
 =?utf-8?B?RjNsWEtKbUw5Rmk1RGhUaWNCVStjMXRmMzVYZWc3VzE3YVpJanhqbTNKS285?=
 =?utf-8?B?ZFNXdEZXR1RqSHVIcjB6Uzh0cnkveWpuSDBLSy9qcW5YdWkwZ1lTRzd0eEpO?=
 =?utf-8?B?Wm93bVhCdml4M0x3WWxlMU9iTDhXYVd2NzczMzdTaStKTFIvb2FpSU5Cekgx?=
 =?utf-8?Q?s8XEA69Ml2fM83UgV4PeWH2Nq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6ef8b5-6081-490f-ffa3-08ddfa3d963e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 01:07:37.8537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orOyfF5EGxwGc/x+1EBmZZoHyb8DJfrF16BUlTuBWRvW17R8OKiPQ8c84jv1m5WePaJ5FBGXtT0Qadip30D16Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8441
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

On 9/22/25 12:12 PM, Timur Tabi wrote:
> On Mon, 2025-09-22 at 21:30 +1000, Alistair Popple wrote:
>> +
>> +    /// Check if the RISC-V core is active.
>> +    ///
>> +    /// Returns `true` if the RISC-V core is active, `false` otherwise.
>> +    #[expect(unused)]
>> +    pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> Result<bool> {
>> +        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
>> +        Ok(cpuctl.active_stat())
>> +    }
> 
> This should be part of the HAL, because a different register is used on Turing.
> 
> You can leave it here if you want, and I'll move into a HAL when I post Turing support.  Your
> choice.

Yes, it's similar to the DMA mask patch in that regard (Hopper/Blackwell needs
a different value).

In the spirit of the current "soul" of patchsets, which is "get
GPU firmware running on Ampere/Ada"), I think let's defer the HALs
until the first patchset that needs them.

thanks,
-- 
John Hubbard

