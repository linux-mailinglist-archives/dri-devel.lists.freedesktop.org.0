Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E153C0D680
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858EC10E45E;
	Mon, 27 Oct 2025 12:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jvFqw7/n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013037.outbound.protection.outlook.com
 [40.93.201.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1309710E45C;
 Mon, 27 Oct 2025 12:08:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOxmJDzCKdKKwELd/vJahZtEyuyp8Qwr11YANXyPqFzES1Eh+ZddIxUePJ4htFWqdVEblH2t0DCo381jxUzLs6pA0B6xGyQYATXfE/93JZTWVsoAw7m3kYVx8Pb3AAOQ5thAioiio7yx9AyEnZ4M3P895+GfzoRl++11fEjoZV8STVDHloeVE/jSnyrrJxPznOo7lMMkbzWlg23QO9sxtYikl8RsZmAwdAQrh+cTmadMzFJFD7o7GcLjUpCa7EJ5HyY9MHxZuJM4a0eYL38nWGQ+WcWV7hpzPpaVFX+iu0sXEKJowJu5FwIR5NGOYqegpKTttZY3NBoX2RiQpe7KBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfxyqGBEEdatBmlShOme9X98voz60HBAjAHzYXs/W1Y=;
 b=CXUvzymm2ZWIc/eTUZw8I7FP+IJgvcoQEKdMKFKgmrXco7v+Ci21rBA1eB4VPOa6ziuNY4udP7ysmIzr0TzYEGHE6QLuydZvCtrqLwtK5iCpukeooANM7lQUJrQnkR9mCcP+9L/T3sG/0nyOEt8fBwEn6iNrudUbVFmXR+oaG6YHYTOLj+4Wdx/uWjIsWuyO3VqN7fKCS8VERuVdihJUJ4QhSNuNfDUgW4Hl0vA+SZ18MJUG27sydTBc/SWC9nk+s5WG5GtCmQyZNZDIE8byq/lGlBLIQpW6Ow/AlaifzhgKQGuGB2QwEY3mtdC4Bv4TdMAfIjooe9rFMhLRTRkmeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfxyqGBEEdatBmlShOme9X98voz60HBAjAHzYXs/W1Y=;
 b=jvFqw7/nNETMKyP6sYa4ToQaacPRPPplAhYSgWxeHrT1ldKUKgU9oA37Lg5Ayzfi77X8Dh1VHfxliXPzn9JzKE3LSeuKItpRwgjWj3UYcrE3S/em0Y4V4k0TNQOq12W+Wiflmd4j4lk6ZBwJzssgxip7GgB4fz4UXXdiEpmEk7LftKKUoyEnGoqQQiyPj/NnRDQb2IYIWl+3Qlm2p+7n1nZOjcE3hqVn2hp39Q/zyL1naEe7cXg3R3WC+K9Wwivq0k3Fr+Cj2wmyP0Lax8vjlfiCjvMm6N3USByuUirRx6j6eHpyY36Eol3J/2TaaAS9QUJagZy0BLlU78lFRdsl4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6602.namprd12.prod.outlook.com (2603:10b6:208:3a2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 12:08:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 12:08:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 21:08:44 +0900
Message-Id: <DDT3CXES4BXF.2YWJLBR0XDAUP@nvidia.com>
Subject: Re: [PATCH 5/7] gpu: nova-core: add extra conversion functions and
 traits
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
 <20251026-nova-as-v1-5-60c78726462d@nvidia.com>
 <cb1026f8-5bf3-418d-bbd5-50c0b63de0db@kernel.org>
In-Reply-To: <cb1026f8-5bf3-418d-bbd5-50c0b63de0db@kernel.org>
X-ClientProxiedBy: TYCPR01CA0059.jpnprd01.prod.outlook.com
 (2603:1096:405:2::23) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: f09c4508-bafd-4010-0141-08de155195b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MW10N004NG1KdEZmQVkyZlg3Y0N2WDV1U1FLWG5JRmpiNVU4L1V1Nm5NQWg3?=
 =?utf-8?B?bDZleEVhVkVhSlowYU1WeTJROGRYd3o2UjJ5K0RjaENJZW5JMDJ4WDhVQXh0?=
 =?utf-8?B?MTlrUmF6Y3p4YkphK0k2U2J6UHJ4bWNvTWpsWkdTUVRNRVBRaXR3c1VxU3RN?=
 =?utf-8?B?M0t0VERGVi8wNG1IWDNyT2RxcDJ6b0VJVmk2dDV1T1AxbEJ0am5uY09sd3RR?=
 =?utf-8?B?czFKQmRqRWxsT2IwNXZBK3A4VGpNc0VjNmo2d0tuai9LWWNyYUNtaXdCZVBG?=
 =?utf-8?B?VkFoakk0MnJ1enc4WlFFQXU1NnRKazNDYnM1aXNRcTIyNjI1MUs2RjVTazhl?=
 =?utf-8?B?RVRvc1BUdFIzY3h5ZlVNRmxEZmJhZ3FnRGE5SGRXdEtNdXhRb2pFRXpuR0NL?=
 =?utf-8?B?WEkxTEJiTEQxeDhxZm1DL1EwL2VhdUdCOHUwZko2TVNYNXFSclRNZnRYbVdG?=
 =?utf-8?B?UGNJTysvRU03cDU3TG9Rb0puR21zM0FOTll3Z01tbkJMd0luZDVkRkVyYjlL?=
 =?utf-8?B?OEs3ZGFZMCsvVTBSR2xVa1dQaHdWTzZnakoveDRUZmd0V1N4MGQ3bjg5SG1B?=
 =?utf-8?B?ek51eEp4SzRhOHhoV2RRUnlZT0tMRzVPcFFaS3Vzb2llZmFQMFJRQk5yYUFG?=
 =?utf-8?B?RkM2U2w5Z1FTQTcwNTUvbDg3cGpUR3h0UkdmSHhrMzRybGpMRm5rYzd3Q0FN?=
 =?utf-8?B?ZlFGbkNsdmVucGNCamEyeDg3d2dSTzdRY202ckRtaHRCaTJyY3NFaUJGQkU0?=
 =?utf-8?B?dE52LzErMi9GZEg3T2x5RWpYL3RCbjJUU1J3UjNOUXFyZXh5cmJKSHczSFVC?=
 =?utf-8?B?VGRwMGxheUt5K2N2VGxUQi9MUGtpRkZ4bTV3T2JEUUdXSDZpRXVMMm04M21I?=
 =?utf-8?B?aGRpR3JaL0Q4eEsvT1BUd2lUZEhsYmV4aHRjVGE4YTdCQTdPM0E5SmVOTVRN?=
 =?utf-8?B?UXJ5T2E3cUpVOURPUG11RHRaVklIOEswQ3Rqc0dBUmx4V2ZMYmdyNlZEZDFS?=
 =?utf-8?B?WVA0a3FodVhRMVRqcExnTDlLc2QzdVlvWWdZbDJJVDkyVVJaM1EwTDRHWW4x?=
 =?utf-8?B?VXAwTzdmRjdsenpieWp1cGJNL3N1MW9RYThZUEFpY1Nscks5VEFlMC9pSnZT?=
 =?utf-8?B?TlBwL1FjQ2RVam4yMmxqTEhkd2IvZE1UM3V3QUlGSDhOMUtXQzJzY3RjTWcr?=
 =?utf-8?B?Q1hmV04vL1h0WGtnYlRweTZ6NnRlbjRHaTd1Z1AvaGd2NUpJMFYzbWJvWXA4?=
 =?utf-8?B?dkFEb0VzTGZTamYyaFI4Q3JJUUN1UE85dHFTZEVWTkNGUVhmSGw3WjI1eXVn?=
 =?utf-8?B?NXc2K2czNm9uK3pyU0FrT2gzRUdDcDFjTWxrOFgwVGJWOHQ3YmYyK3BzWi90?=
 =?utf-8?B?YmJsZ1pBMTlJYittOGg0OFpnVjNkWU1iTUh2MDBwaHc4WTdVUVZQaXZlMlBW?=
 =?utf-8?B?cTh6b3NGd0JWaVd6Qk83SGdmOEJsOHhKcDk4eFRmc05aRHgzWWVFRVo3dksz?=
 =?utf-8?B?ajFuaHJVcjNTcTBSbzlmN3FmOWJmcThmc2lOY0hnNjNVeGpTTlU1Sks5WUZL?=
 =?utf-8?B?UmFiZEVBWkI5UEprVEdHZ0ZsUjdVd0p2YnluWFY1UHZJZmIyMkZ5T3duYTF5?=
 =?utf-8?B?OEpSV2hvanlBS2kxTkpMOXFBL3dpSC9OWUNvL3ZFU1o5MXVYQmZvalR0Qlky?=
 =?utf-8?B?ZDZ3bVAwbzlod1NZVTJCMnR1T1ZzenFVeG1ld3Y0OVJMVDhxdlJEL3RvU3dD?=
 =?utf-8?B?R2Qxd1pIQUpUVVRUcDVUa0R2TTZlVUp6SUVGTTg0WXg3SUxRYUtkZ2ZZczlX?=
 =?utf-8?B?N2lyM0pZd0gwZjBic0gvd2ZwWkVNUUdNeGRWaXc3dHQrZG5NR05rNXMzWjFV?=
 =?utf-8?B?bWhnZGtZRGF0SlJVd01YUWFNcS9MOUhSVjhRWHJpUG5qU3VKY3RrRDAvNDZw?=
 =?utf-8?Q?sAkLoChKBOx+2Hu1ZT6V6kWyl+KLRiHe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2ZhN1llVlNpVkNDQW80ZG1STG9CaVU3bG9pc3BrSmxSK0hlSDJMNG8zZWxu?=
 =?utf-8?B?RGNiaXhqcXZ2U1RSaWdjdnNpZ01PNm1tVWdLSW9hRGlnREZ4YThnZ3hlWkZQ?=
 =?utf-8?B?VGZka2NUMWJVK05uVVRxdkdxSTlzWTZ2R0Nhc2NodDVYRUtVWFpsNkI3Ymh5?=
 =?utf-8?B?UHkvUnJodThNalIwWllFSlNqbnVVeTRIV2xJRjE4Z0F5T0l5K3JSbmdoQzhL?=
 =?utf-8?B?b251eXZEdGphcXB6TUR3U3NnYms1cEVqYVRTMEpvZ05qMjNFM1R5ZzVmaXVC?=
 =?utf-8?B?L2xiRzRjdkVPaVNqT3ZWNVVHSVAxajVwLzc1cUxDZ21CbjZlK0hCT0l1R1lM?=
 =?utf-8?B?MmN4S1h4ZHc0T3BMVnFSSU9McGVpUWZnMk5iRU9lcHdrZ0s3T3VkdldxeEpY?=
 =?utf-8?B?R2YzZVhlUkNIdExTbFdrL3BjejhUeitRTU5ZQjMrQ0QvbVdXd04yaWlIM0li?=
 =?utf-8?B?VkJUZy82SytybGRzSE5CTWZyeWhWQjM2czBiMUk3M21WRDRNdTVwSVNxbk1s?=
 =?utf-8?B?T2FlSGZoYktsWVZBNFF3YzZOQXhwM1IwSEhsM0xIUlhmR1VrcjNyTXFDRm1B?=
 =?utf-8?B?SC9FbGhDU1pZaElZZVlsYkpadStwUUg0UDZ1U2ZZN2JjdXcwYUNqeWp0WExS?=
 =?utf-8?B?ZkI1bVpzdXl6RU1mRHl6MjRXeTVPMFV0SzNSSVBrdGVUZjVqdEovNXB4eUJn?=
 =?utf-8?B?cGhrVy9STmhERFNaRkJYWko4YTFDeVNrbitvbmNhbWVxbTU0eHY2dzU5RmRI?=
 =?utf-8?B?eFNEdjViY1J0a3BDUnZtcGpIblFSZWwrU3IrbGVScFh2Vk9LQlBqWWx0UzNG?=
 =?utf-8?B?ODRxNncrVzNvQ3JJc3E4bnptV2p1MEhPY2ZNZGJBVC9jQmRZVVdwdUpTeDV4?=
 =?utf-8?B?R1FzQjVuQ0JrZjhQd3AzRFpxYTUzcmNMR2VJRTBFM3FWcXQ5RVNYeVByRURa?=
 =?utf-8?B?S3BGVkxWSktLTTVLN2lmaVdwdTdCUmRuTUxXQjdYUVMzWCtzd2dFd3E5MTNt?=
 =?utf-8?B?Tm9uY0dxNlNDMFFWY2poZndyN1hkRkpDNCtzYzZFRXJUcVJoWk9USTkyd2pU?=
 =?utf-8?B?K3Z2eHJ4WFFNYUZyVWdET3ZqOWZ1NmVKaFlvaWdBcm4wd2hZRlpNTkNHUWRV?=
 =?utf-8?B?NHpDVnd0Ym1lbEplRGF5TkxIWFg1UVRrVU9rbm90cmtKMWhFT2YwZDJaV3Rn?=
 =?utf-8?B?TnEyZ0c2eHVUT1FhL1VGWjhhVHZTNzVURW9ZUDVTOHVwRE92TVZZU2ZkcFBH?=
 =?utf-8?B?QnQ3blo1U0hRbnhvSHp4SEQzd2lHUWIvcm9KUnROZWdBWGdRYzUvajZwTS8z?=
 =?utf-8?B?bGFHY21uaWhFL3BKUDBUbXFzVHo0RXdLQlcxMnhpQWdVSjhmam5IbGhGeFFh?=
 =?utf-8?B?d3M2TUtmeG1XYnExQkFLNVByVmYvQ1p6ZUw1QTBIMldRWURLZnkvbHV1c2xv?=
 =?utf-8?B?NTdIOXVtQzh2UG8xVXJtdFViMFB3ekptVlM1T3JyVURKcGw0cnFlaVZIU1hT?=
 =?utf-8?B?alBOc1RYdXdJL2RsRzBHR3JvaG1iQ2RDNkdKckNjSTZtSlZPdnp0WHJPVUp1?=
 =?utf-8?B?ZjZBdTFxSEJzOXpkUk9mS0VGTzZ2SzVocGRnU2huZzh0eVd2STR0VzJrbWN0?=
 =?utf-8?B?eTZReWZpR1lWbkRkMVl4KzFBOEk2Wk1SR0pBWC82VGpxUEM2Yk1wMjFTQXhn?=
 =?utf-8?B?RnpVL3I1M2x1TXBpRHFRejh6dE0rYmdpMXc5STN6MkJPaS9OZEZRb21nSWwx?=
 =?utf-8?B?bmx3WEszQURaVEVFUTAydjJIN2UxSTNDZi9lUFI1WDJJMnNTalpLUDVSN21Z?=
 =?utf-8?B?aC80dlhxd01BMTBvWVBHQ3g0bDcvRzl1Zm1meEgzakZHVmJwU0hLbXIzTVU4?=
 =?utf-8?B?dEprYnE2LytJeTBHbm14c1NTTXhlTTAzWk5zRnFnL1A0a1lOU1Vya2dmeU4x?=
 =?utf-8?B?ZkpXL3cxTXlnYy9wTE0ydHhoSFI1dDVTOVlYbVB1Y0hCK3plMzF3SDhXT1Rv?=
 =?utf-8?B?amlrSmxLV1ZYd0VReGdOTlFqRzAydmlYU0l1eXBTeE9xbEMxMWNrZUQ5ejdy?=
 =?utf-8?B?L1ZURjhUQUpMdjlrZTZXNUdZeURSMlZ0T201SlNvZ2xJdlY2bGtiaEFBY1dF?=
 =?utf-8?B?a3ZtZlcvVHZYRExsVGJYQWxkaFBIREhyZTVNdnRXSUdJNEx5VjFSd05MMDhU?=
 =?utf-8?Q?d70yuTTTs6PFaCXWB0QWn4F+UHm2kMJo9TDGpV+bqlQV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f09c4508-bafd-4010-0141-08de155195b8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 12:08:48.3751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jd6GC2+Cs9n41eX0WqYt3HijShAypEsATRjTaO1ADVYC5jgr0TZKNagEf8gvY2havqVylnDGL/beDDqBw53Bgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6602
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

On Mon Oct 27, 2025 at 12:40 AM JST, Danilo Krummrich wrote:
> On 10/26/25 3:39 PM, Alexandre Courbot wrote:
>> +#[cfg(CONFIG_32BIT)]
>> +/// Infallibly converts a `usize` to `u32` on 32-bit platforms.
>> +///
>> +/// This conversion is always lossless on 32-bit platforms, where a `us=
ize` is the same size as a
>> +/// `u32`.
>> +///
>> +/// Prefer this over the `as` keyword to ensure no lossy conversions ar=
e performed.
>> +///
>> +/// This is for use from a `const` context. For non `const` use, prefer=
 the [`FromAs`] and
>> +/// [`IntoAs`] traits.
>> +pub(crate) const fn usize_as_u32(value: usize) -> u32 {
>> +    kernel::static_assert!(size_of::<u32>() >=3D size_of::<usize>());
>> +
>> +    value as u32
>> +}
>
> Given that nova-core depends on CONFIG_64BIT, I assume you added this pre=
dicting
> that we'll move this to the kernel crate.

That's correct.

>
> For core code (and maybe other drivers) I think we also want the same thi=
ng for
> signed types, but I think it's also fine to add them when moving things i=
nto the
> kernel crate.

We'll definitely want this. Nova-core does not use require signed types,
which is why I omitted them for now - and also so save some labor as we
are still discussing the fitness of this design.
