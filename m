Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86762B394AC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 09:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A5910E650;
	Thu, 28 Aug 2025 07:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="k75Br01P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F5A10E650;
 Thu, 28 Aug 2025 07:08:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kH5/WBbw8HUJOCgnXGVZTcHeVkg9dwJYnVedaLLtd2cLsb/XHZzprKoxg9lPaTo4fjljH5pmBHPbK+qK9lK5L70l03D8P00sWLuV3aw71hfxTIQ0pelPVp5vQymhiFvXuLjwgSn0a0UETIqRHED1gdEh6butbLLtjmT4EgZRqF8du98HWmdzAqeHh+icRTl2Xe8xxbJeMQl4hJ0B/ugCFH4bz2nzmpt+0CZK65Ukl2J5etQ18DtLj9A61OBlC7xAW5z3KxImoWPL/AeCRJdHtsR+pS9arS+tOjAlrKT/vu/xZvI/kDkAKXrGaChVIWlg7ryg9w85XfPUqvNizIS7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qtzbal4fOIER9YPHikOPiYQ+1nw8swuUyoVQ+DPKWIM=;
 b=jacIIhryeRcwP9EHoF2S7SaFSLvCVD1AQqDZAzbfhL7zPBh6QdiZU8OI1ksNueZusxtCqP6iW8jq9ouXhUBcjxu+h5xHiQO++xWqn8nFImNhN1bgz7FjQIxnXl7zUpBm1g0Cd5O5HcmReUmwOElThpAm0Ox9m6AD0oaeAnhD0ijN6k2trRRyvgNzUjWoxx+LPxOM4kShQ18QOaCiJDfKYixhWil4qy4vuBzGDivsLTeA8s29gj+GDj6fGHHMN27eQIeuemywlcOyQkLqIz1Va5+2Gk2VIkxeZXqV3ASMR9Pa8Mp61ePuCq/rGCjA4UTWCw2sCZt/VbMlrVUykBFdiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qtzbal4fOIER9YPHikOPiYQ+1nw8swuUyoVQ+DPKWIM=;
 b=k75Br01P5EIB0IukUcu9nuHa/OzTqddTEojB9EVNKzqlt911NmNMTo7mn8bplqh6Ac84/oxV8LrIga2zKETNE0eQCYvRN7XIgHvbW4RG1sxiTxidkYMIpuuLU4cM/P0XRK3Lzl7qCOekDYBrFag/mQ8Ue70i7d6KUEzilNy5Mc2swAhxQiwV5ZoDQj19IgIvqYcRepdygjK4Ccg/hj7jf7YjBW6H79qGckGnX5StaUIdFlRDlhNov9cbLxnxNpTeh1jqbRJegbkUaOQpgaJBJ/DI2sy+MmCtqZO8bDbomwFuoa8T84yP82X8tsJHbNP1mpoEgbPtLOYTAHoKlzWROQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BN7PPF915F74166.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Thu, 28 Aug
 2025 07:08:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 07:08:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Aug 2025 16:08:29 +0900
Message-Id: <DCDVECIAW1NI.2J8SHDVJLY7V5@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/8] gpu: nova-core: firmware: add support for common
 firmware header
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-2-93566252fe3a@nvidia.com>
 <9adb92d4-6063-4032-bf76-f98dcfe2c824@nvidia.com>
 <DCD2VJ1WJW2O.VM7E4PD3DFYO@nvidia.com>
 <2532f8a1-83ba-4f72-aae7-9d810eda417a@nvidia.com>
In-Reply-To: <2532f8a1-83ba-4f72-aae7-9d810eda417a@nvidia.com>
X-ClientProxiedBy: TYCP286CA0202.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BN7PPF915F74166:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eac0ab6-463b-4d5e-6880-08dde601b278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkEzbHZNTmxZMnF2dmplWUVhaVRIakRLd21IeVVibnhMejdqaXQzTE8vYjBw?=
 =?utf-8?B?NlZHZ28wS1BzVUh5UVIxNXBpQWpFQnh1VFcxWm05ZWEvRkpOZmVETlUySTkz?=
 =?utf-8?B?bUxXbDI2OHpxZ2hIMmZpZkZuVXVZL1pMUk43YUkvcHZiWGJrSjFCNDlNcmp3?=
 =?utf-8?B?YWlodGxXVzVLS3huSFVSSTU2ZTRzNUJjRkJIY0VGQld4NGpKV0pxZkF1MVRG?=
 =?utf-8?B?NVk0ZnMzQS9nRzJENkNDV2srYzZCVEZrbWR6Y1o5dnpiWXVWN0xCbVZZS2Rq?=
 =?utf-8?B?MHpLZy9BQmczZHYxZjc3RlF2WXZ0N1NmQmNSd0wrbVdESlpqNFovaytZeElP?=
 =?utf-8?B?bFBtcVBjME9WNUV6TVBSeUFqT3Z0K09yUHVOcjZQWExUMmUwNDhFZStlRENX?=
 =?utf-8?B?OUdiS0VJOTllSUNZQ1dMeWlDaC80aXRtWnF2ZWtKaEQ0T2sxeEIrSGtZbVUz?=
 =?utf-8?B?bkVYM0pFRFY5TDluQWJEdGdkSVErbXgwTE8yY2lrbit4K0ZtQlY5SXFSOHpF?=
 =?utf-8?B?NmV2WVBrMlgvNE9uLzU2M09lb3NIdmZnVVVLL1RpZ0RJSVkvYklpR25Jejlj?=
 =?utf-8?B?NHVVOWp5ajRvdU9rRGVobVFvUkRQMkNRYVpnK0szU1RLOEgxSXllNEVwTnU1?=
 =?utf-8?B?VFljSUtydzNJYWQ0S3IyRmFrSTI1ZDNsRmJHK1BOUnVJeDZ4SWF1RW5JZUNJ?=
 =?utf-8?B?aG0xU1JHZDJpcmJtTjZyWVBDWTV0N2g4SUM4SHBQNHhrZXBqU1EzcnlWWjh0?=
 =?utf-8?B?dktqQ2V5MEx4TmtHZ0x6ZTlkc1k5NHFMbURGZjdpNGx6M0RIN1pmczZBNE1y?=
 =?utf-8?B?dnh6eTArKzNmUUQ2MEJBSWpCTzNvSTRCQWlRaVRiYXM1ZDVqN3FQcFc5NS9z?=
 =?utf-8?B?VEZWQWxMRzVmVjlKZnA2akE1Uk4xRWpwTkNFbHpmL1hadkF6czdOYTJkeXkr?=
 =?utf-8?B?Uit2dTB5Z0NxMEFEV0tWbStWRnVZK2N0RmpmVE5XUk1YRFI1NmFKaDFIMDlC?=
 =?utf-8?B?alhvdE90Z01ocytIOWU4NHhmK2J5ZzBnaDRNTld6TmRhUzAvSHhkUzVGNHlX?=
 =?utf-8?B?VDNVdHdjaDRJOWk1bjB3bWx1TmNWK3Y0UjVCK1NkNGdQMUxKMTA1WkZTZ244?=
 =?utf-8?B?dzdqeUtvRVVXRjFiamVuSGpYS29lQ3NBdUFBS1VoQlA2YWxpS3V0VXFhbkht?=
 =?utf-8?B?VWJEL3A3N0JqZ0F2aVZEd2ljdlJmSnNEdFcxd3hoV05XOERsSWJDN1lsbkN3?=
 =?utf-8?B?bXdWYjN4elc0N05SRHVmQ2l1N3RWdERYMlliUXNCbloxMXNMbG9WRWdTK05l?=
 =?utf-8?B?ZC96RnZVNDRsLzA4THZVQ0pobkEzTGtsdEdDOWlpa0JWTlBlV2lzQ2xIeGRT?=
 =?utf-8?B?Y3FaUkUzNnNjMmhFODI5eEo4N1BhL3NKVThUTWt5UlFKOUZacENuR0dZbmtD?=
 =?utf-8?B?YnhyN1I0bE5PSklibG9hVUZsUDBXbTJ3OFZ0NVVvRmk4ME5BNzYwQ043K3NW?=
 =?utf-8?B?ei9JaU0xb3Nydk5YRzJFNlRrYmJkRFVINFRSb3N5K1JOZnNmT1MyTkk2QXA4?=
 =?utf-8?B?c0t4VGtCdTI1bm5vY3FnUW05UXZyMllRTFIzbXRQY2p2aWV6anBZRVE1cldN?=
 =?utf-8?B?b1k1emlkWGN0VUxPaDNHa25ORldIMlNMMk9pUmNZYWZmT2xlUEoxcmpjcWJh?=
 =?utf-8?B?ZDh3OUdQcEU3TDhFVGxIbTQ0UDNUOUdsWUZmbkxJdjJYK3dCWkFkNWk1UENh?=
 =?utf-8?B?WVYvRFY1SlhRdUljV3dBa29lR2NQaklyQlFXZFcrZkZsQXE5UXE5KzM2Tmp4?=
 =?utf-8?B?eHU4SUpuQ3plU3l4M2dhVXFZYlNCcm5YU21mSlNCR3hrU3BZUkU0UHJUVGs1?=
 =?utf-8?B?YWNOaEVjVFNyK0laNUNHaGxDNndTSmJwdk5Kc0RMa1Y2dnFoMEwyOGxvTk9O?=
 =?utf-8?B?dld6M0lZTUpYUWx3N2w3cVBqbm1PbEY5enQ5cDdpVjJPcWdud29yRFFzZ2g2?=
 =?utf-8?B?ZWVWWk1NbW13PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eENHN1dGV1MvYUxMTWRRNjVVYmY1R2YwNjgreHAvdWVjYnVlQ2lkcGVuTFFF?=
 =?utf-8?B?aCtiSndhUzFXY3l6Q2kxc1l6OTJqU3lZM0U0U2hiZE95cVZYcFdtSzJZcTkz?=
 =?utf-8?B?cmk4L0x2QXJucG1MdXJNZmVIUnYwK2ZqbnFBdGp5RVo5Rk9EM0xIeVZFZW1k?=
 =?utf-8?B?MTkyRjBsU1J6UkdxbXFDRG9QL2ZTcHNsU3lYRjMrQlVGUWFrODNaVFY0dmlX?=
 =?utf-8?B?bStEM0FrVWhndUZ3RStJVk5kTlNKcmpNa253VUpmNC9CYnpBWC94RkN3SGZU?=
 =?utf-8?B?M2xiNWtrcFUvQkMyOE5TRXM3a1gyYURmM1IxaWxEZ3hzbFFXLzJsMGJ5N240?=
 =?utf-8?B?TnRXNjZuT216UGRML3JrWmRvRDJzSDJxSStZS3lHbWk2aXFtdWY4V3dBZ3Zt?=
 =?utf-8?B?YVc0ZlR5RXdtdjFRa0dDQmJhMzFBSXIrQ3UzVlh4QmpnQVNVU2hJbHdrVGZ6?=
 =?utf-8?B?b1hpV3ppTk0xUEZTTkhKR3NBbjFjc1pxZHA2TXVoZC8xM3RMbFE3NlZWaEdY?=
 =?utf-8?B?WVpaOU5Zc3NuVFJFaHkxNzYvQ0NrRHhtdUhBbWhlbnZIdklBcG82WURuSmwy?=
 =?utf-8?B?dnV6cnpZYUlkVWNwTTdFSng3SFhGcmNpaUpEOTZIYWR6bFh5SXVNNFc0QUFB?=
 =?utf-8?B?clFGdWJrNDRNd3pSUGtZYjhjdHZkU09pUTMyVEt0bWFPVTEyWjRHaWtybXQz?=
 =?utf-8?B?SWxjYmI2eXZWNW9lNE9YbDE5T1lYUm91c01HVmpVQStrR1p3YUxWSHZKbkJN?=
 =?utf-8?B?WHVKNUg4eWoxSzltc1hHWCtxcUZIS2ViK1N0WEY2OThTNUVIaCtSdUM0YUJk?=
 =?utf-8?B?SmJOZVlVenlQOXRKNGZIU3kvb0R1eHBSbTNuK3Z4dVQxZFlDdU1TMS8xQXlz?=
 =?utf-8?B?bVVIdU5jMzlGVWpsZTJOZVJnM05Mbnk5WmJuL0VqU21SRXYwTTJHSkIvcG1q?=
 =?utf-8?B?OHM0c3J1cXY5SDcyNC9vTDN1SDhVRHIwQ2w4M3J3dFVyUmtBczN1K0pLSWZ3?=
 =?utf-8?B?ZnpMUlFKdE9EbHNtam10S1IzT0FRcFVlTWd4ZmltUC8vOTJGM29LcFUyZ1pI?=
 =?utf-8?B?MUg3U2JyU25ic0tpQjZDb0dHdHA4dzdaUHJpOUk5UU5ZVG9qUjhzTDdWamtD?=
 =?utf-8?B?dk1TY2c0ZXVYeU9SZjZ4aGR6WkRmVkRmVkhXRjJ6cTErRjVadklDUnNsWW1r?=
 =?utf-8?B?T3B0bUd0S1FOemxLbFNMNE5hWkl2K2l6UG9VUU9mU3Z2ZnFKMlJwU2gva0tv?=
 =?utf-8?B?RlRLZW1BS2FIMm5BbWhOY2o4Y0piZTFTOEFkbXB6RWU2dTVNQnEyWjZsbVdG?=
 =?utf-8?B?UGlkOEVoSktIdS9qVWZ5WTBseFNzdW5UTWVhMlpSMmRqS3hpMXFhNkhHNjRM?=
 =?utf-8?B?UHN4YnErS2F5RS8yWUtJU0l6TE1sd3ZaaFBlYTNIREYxaXFiWWxuN3Y1VW5Q?=
 =?utf-8?B?WWs3T3gwN1VDOGFIMHFURG1aV1hqb0h6RnM5c2d4YktGeVRUMHNQaTU1bVRF?=
 =?utf-8?B?aU9GZmVxUDBGajN1WFFqbTVsT0Mvd1Jub1p4bVFxcVFZSWhCQXRoRER4MzFJ?=
 =?utf-8?B?S2JBMk0xTFBzRlY0RXJMMEw3Y29hSnF2Nm9jUXlRanZXZ3NieWdEZERFMmFY?=
 =?utf-8?B?bnljRGZKSHB4L2NjcWoyazArd2VZd0FEY1ZEQ3VlOU5EMVVJY2QyZWt3UTJG?=
 =?utf-8?B?RThpWUdFU1J0WWZjWFErbzJHVVhOWE9nWkl4bjgrcUcrMlBSYTFiVFNOd2Qx?=
 =?utf-8?B?bW9LZlo2Y0dVZzhnWGJGWUxnbnhlSG5WRGZZeS9ISkRZZ2ZHN1lyWTYzb0ZB?=
 =?utf-8?B?dm5BSHpkNk9TaXJmMkJKTm9hU1RBYklYb1NPM1haVkgxcmNnTTdHMzJOZ3hT?=
 =?utf-8?B?NWVmbGxxWlZ5R3FGUkFFZnZPNE1mTTIvcmlMeVRVYm5WK3lKUVhNenZZTThz?=
 =?utf-8?B?NU55YkdSbXVDcFRsT01nYVVCT2J4Um96UG11emVRK2d6Q2h5T1E2OE1oTnpW?=
 =?utf-8?B?QThJaEd1NWMvTnV5Tm9lNXVnU0FObTI5M2dGa21iRnY4QndIeGM5WU1ESHZ4?=
 =?utf-8?B?MUMvY09pbFlpNzdMUmw5djFabjFJcnJvNHEwNGU2bU15MDliMFpFSHJDdjJh?=
 =?utf-8?B?OVZWTFpYd3JESnhMOTlKNzdNaVRjZEJObFZ3NDY1Y2dCbWUwbXJOSW1pZE1U?=
 =?utf-8?Q?kGpM8a1Dmh1a+4ll3F0DynxMHbd/1jj5PK7CmPz0LCEK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eac0ab6-463b-4d5e-6880-08dde601b278
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 07:08:33.1195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVWvbHgqnzWlim6BHUGC47qWyqtrK3nEKMCS5RLDR2K6+J/V5Z01szN0mHl+JTP6Iw9OmfgQFs1VUxKRjgbFWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF915F74166
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

On Thu Aug 28, 2025 at 6:50 AM JST, John Hubbard wrote:
> On 8/27/25 1:47 AM, Alexandre Courbot wrote:
>> On Wed Aug 27, 2025 at 10:34 AM JST, John Hubbard wrote:
>> <snip>
>>>> +    /// Returns the data payload of the firmware, or `None` if the da=
ta range is out of bounds of
>>>> +    /// the firmware image.
>>>> +    fn data(&self) -> Option<&[u8]> {
>>>> +        let fw_start =3D self.hdr.data_offset as usize;
>>>> +        let fw_size =3D self.hdr.data_size as usize;
>>>> +
>>>> +        self.fw.get(fw_start..fw_start + fw_size)
>>>
>>> This worries me a bit, because we never checked that these bounds
>>> are reasonable: within the range of the firmware, and not overflowing
>>> (.checked_add() for example), that sort of thing.
>>>
>>> Thoughts?
>>=20
>> `get` returns `None` if the requested slice is out of bounds, so there
>> should be no risk of panicking here.
>
> I was wondering about the bounds themselves, though. Couldn't they
> be wrong? (Do we care?)

Not sure what you mean by wrong bounds here? Do you mean what if the
header data is incorrect?
