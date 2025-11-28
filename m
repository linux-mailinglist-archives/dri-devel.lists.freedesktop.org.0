Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB636C93356
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 22:49:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95ECC10E94F;
	Fri, 28 Nov 2025 21:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KKfFl4Gm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010057.outbound.protection.outlook.com
 [40.93.198.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE36910E14B;
 Fri, 28 Nov 2025 21:49:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Be6bCVWCsNKo/l1wtEzpWerDaWhY/wEdoTHzSjPXZeTaekiMOLduUTBNbcRQ7QCKf4Bax8VpB+AxYgbuhx3zTbaiL64QTTCMQWK15jvpVygq0uB504JHVWeYRU4nWSIC92JhOGXtf4R9yGjWzVqHaT93fJK6V2XXnteI4DIgenijQAORzi0x0R3IiKyH9aWYUm0bRvEi5H6eRDEZUHqKbHHK+vRx6Lb+McPzXmbNEL57PJLKu4k+QsOfOVIg01H6y4uulLoRtdmOKyrmnuXYTZkck0VtIOEM1TIatbN67NWrq91rJ1lqAHFfitqfmkXADk87C8GlyM6s8J/LlQ05lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PRqLoRYb44hslnXQTmiHn+nb+DtUErQxm92xthowNQ=;
 b=QhlyMWAIjKPFBXZ+zL0u19wLVeqIV88ZRANBrSyqLf/s66zYqQ2c3qg/eTOg80exO9Wfp6c0fSbtTbRCVXaptrIhAOBqwe9gU5iDCydm3S4xjspt13qNRbywNgUjTbQrkM8Ac5tu51aquR+D+DqxDKF6AX9ZAjn3unzyUq5PsOnOu5mS0pI9JqATtANwJ+w8TVZa4YkB4U/Y+0CCthaeT8BtPxl0d+Qb6bbxNb5pWKg+RnveMH1l6jSKMKAxhJxdhP0MViey3eXhYd6PIe5dZxwQJHGcTdRDKeZnhW0JTtgMRAOpL/k6hb92QwmYu78GK7JGI2pEKzCGp2Yi62PW5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PRqLoRYb44hslnXQTmiHn+nb+DtUErQxm92xthowNQ=;
 b=KKfFl4GmpHfDrfhDBhK4yVzoDEcUSMClt6dWtJ3QbkP/4vvV5jgA16+HyO5S8FGcEvQlsfpY6rTKlo4/E4lsDwzJEs3LieqCyLGaKg1hfsIlNAimkZSfHrlphxuZjO2/H8NUMfQfqsvnfr/k1tkw3FXvfX/wQy91hD9g622YZt1HhG02UB9z0fx/opOaS5sAKH0g9udr1oIi6Q4MIA5/0mIMiz+mjyE3uDyMs/zBp4AbbAWF80uSe51M3S9GX4nASVbFi9s2uQgEfaMPm06/Cm3kBU6um55fe6wdT6TBXIEnwQEoH4YfQ4KpaV9Szu8u7fZez3gp4g/sABweXkfYuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by DM3PR12MB9436.namprd12.prod.outlook.com (2603:10b6:8:1af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Fri, 28 Nov
 2025 21:49:48 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 21:49:48 +0000
Message-ID: <7627f224-5fe9-456d-8981-8b3799e332e1@nvidia.com>
Date: Fri, 28 Nov 2025 16:49:43 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked list
 operations
To: Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "simona@ffwll.ch"
 <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "elle@weathered-steel.dev" <elle@weathered-steel.dev>,
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, "phasta@kernel.org" <phasta@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <DEHV08MPF9CH.1GZAWEGC4AVF3@nvidia.com>
 <095D38BD-A8AA-4BC3-8C24-9454964EB8F8@nvidia.com>
 <DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com>
 <F3A7E1BB-883C-4EF4-B245-8E9DD329131F@nvidia.com>
 <03003f10-00c0-44dd-b9df-5763cc1e715f@nvidia.com>
 <7529a7b1-b204-44cb-bb34-57161e6b7b8c@nvidia.com>
 <DEJIUDQ3ZGPA.2UIPTGU4WT7RW@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DEJIUDQ3ZGPA.2UIPTGU4WT7RW@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0250.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::15) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|DM3PR12MB9436:EE_
X-MS-Office365-Filtering-Correlation-Id: c43bde0f-ba99-4e66-b063-08de2ec80d30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T09FUmc0OEdEMTdJNlNNanY3U1ZidHBTSDZGODdJWTM5ZEhDYWtpWTRsdVdH?=
 =?utf-8?B?cGV2ZFZ0aWd4RTdVcEZhQUV1NWpMM1BWREVaVytSOUFhNlRPSlFwbHNxVDcw?=
 =?utf-8?B?bG1zMjJ6NWlUOHlPVmxDWVk1UnFnZitlRzVGN1NYU3BTd3g1Y1ZBZlBQWS9N?=
 =?utf-8?B?bFZhRDJBVDBzVU9uejZPMnM5NDNOUys3RGduYlZvM0pxU1RtMXNMdk9zakFZ?=
 =?utf-8?B?elJaWGs5WTZEczJZR1l3amo5aUZXMndYU00zZklyLzBLNFJ2ODN0MXFrTFg3?=
 =?utf-8?B?UGFzZm5pSVI5Zmt6ajlZMmhTZTd3UkYwSVlUMXY4alJHTEpBOGhQcTd6cloz?=
 =?utf-8?B?MDIvelR1TGxoMEMyL2c5WkRpRnM1WGpnTTlXTTZjK1U3bWJEekNoNzdUSU5X?=
 =?utf-8?B?aGRKaHdINVhzZDZvMmxEMUljdXBpWm1aa1c2bHN4bWxoVy9YRWFuczRWMURU?=
 =?utf-8?B?U2w1VFdQTjdQcXJDZ01tZVRybno5dy9FTTM4a2VUdlpzQ25HSFdHQnFsKzI1?=
 =?utf-8?B?Y2R4Z2lyaGthNWV1cTFaREx4QkdvVC9ZYzcwY21Lcjl2Rmk4YWpnT1JXN1pG?=
 =?utf-8?B?eHVLTm5CTWVtQVZQelJNZ2VyNXRxMG04OFZhNDVWbGh1ZjM3TjlMSzhHMjFp?=
 =?utf-8?B?NnpJaFZlUGVvR2hOdkkvUzF4REF0bWY2ZXVJbW5GTmFpZmZJa1BDL0VrUHE4?=
 =?utf-8?B?SmsrL1cxOGxlQ2dFQkpuN21wR3FBR2ovSUkyRHNWdW1PYlRsbXByRVhYN0Z1?=
 =?utf-8?B?WUUvSHR2elF0TDJnNkcxQW15UlZaZnViK3NITkxYVG5SWmNLOVpSaUQrVFVF?=
 =?utf-8?B?akNNRGo0K2RtQnhBU3JmUGJSL3E1UU9ESlZpT2FVZllWNkxtSmFkTXR0Z1VE?=
 =?utf-8?B?SldUUnpUT1RWVmFlcngyMytlS0xyTzd5S2NPK3NEN1JMUlBjRGtkaHBrdDls?=
 =?utf-8?B?b3FZZmVsVXFsLzJSVXpYaE5tWGtNa2dBRERQb3FxNjJ5N0dIUjdoWk5tQXlY?=
 =?utf-8?B?ZmJ0R3JWUzlZdFlwdkNGN3lyRHd0STF2Y2c4Vm4xOWhxTE9mcXI2U0tDZmlw?=
 =?utf-8?B?R1JRNmVDcWNBQnUzMHorQWUvWUJrM3NPbFVwSkUrQzY2b1BBcThzUExYS1VL?=
 =?utf-8?B?TkhxMzQ3bVpmaVlMSU5COFd5QjIwNHkreHhPOHZ5Um5jSjRISU9NdGt3QU4w?=
 =?utf-8?B?Vy8vWjdjN1BIMUM4UzhDU2p4UkNHbWdWb29ja0pOQzVQNWdXSTlLNElZTmRq?=
 =?utf-8?B?MkRTN1lRTW9adnlFcWRBbVlGOHZMTUdGVXErWnYrUXNEc0VUc1FJQ0UvcEV3?=
 =?utf-8?B?MG9UbFo1emhsZm9YSzdLWWFnb28yMUpKcjNqY0lKUm9Hb3c3bXcvNDFZMzhv?=
 =?utf-8?B?WkwyYnlsS2dUQWNRYXZSZUJ2Sk9TTlZzR1QrMUkySkQ3ZFJVNVRJR3kwaDR0?=
 =?utf-8?B?eHA5OXdpK1NNSkNVR2tSZXZwZHZwOEZUdEZpWm5BeWdneHBHTGhCeE9HY09H?=
 =?utf-8?B?b2pxVlp0RmdsdS9waUN5OVd5bHNSWFpibnMwbVJTdzN2dy9TTGRXRUZYT0Vk?=
 =?utf-8?B?UFZ0amRWTEVtcFZ1enp4UkgxeVVuaDNVNytFS1R5NGEyV3dhVlF2Qkw0c2Nv?=
 =?utf-8?B?WXpVKy94QzRSdDdTWHFaemcxbW40VUxmTzRFREgvMC83WlhMQ1FBNThHMVRR?=
 =?utf-8?B?cC9ReFIvclYvYm5VN1Q1aHI1dUc5UGtYazVVN1N5NWxFWnMxQVErSUN2MFg2?=
 =?utf-8?B?ZUNta1ZaZ0EweFpCb29HTUgxaG1maXVSNkc2eERQcitNa3hSbXlOVWFXbkNi?=
 =?utf-8?B?Y2JGdTZCYzJacXZ4VXhNNTA5ZFpjaWdBOGxEb21id2lycXNnZG9JZ3FReHd5?=
 =?utf-8?B?ZEU4SXZuQUFDWm9Wa2JBOWJXcElRLzdKUm4zbkVjZ1E0SmxhZlI0ZlB3ZlV0?=
 =?utf-8?Q?JNL3uWsPIT0XdnGqm7hwqXXXCWAv7LQJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW9GakFkaUk3V211V1BzN2ZpQjBMN3U2WHVIMXZTRTVKYWNRSU83bFJBdXpX?=
 =?utf-8?B?bkxxbk9qem83RkJwclBMVDhEOHl3cU9nbVNWTE9EbTl2L1d3V1ZmQ2lpclJN?=
 =?utf-8?B?MUovMkZ5R2liUGt1R0lGNVArTG5CMHFzN05Wc29uaWxWcUVkb2dXL3l2THVK?=
 =?utf-8?B?ay84RUFvYjZuTDFiMDlEK2dlWkRtNk9nbGp3VnVmaE91Nks2QXQyWWVmTGpv?=
 =?utf-8?B?Um94SmhlMVpXTnJBYW1KZTMrc1pIQlJMZzVwSGI1WWZ5ZG1zVWlvZ05kb1Qw?=
 =?utf-8?B?emU5VWJTbURqVmxacWxHTXBQdXd4aVJjUFp1TytITVNsbDNpbFUwZi8xN1FK?=
 =?utf-8?B?cFhVNW9JTWs2SWw3SWtmL0tYdFhRQUFVblJaN080cDZsYkNpWXZDNXUxdm5v?=
 =?utf-8?B?M1Y0dTNLN0JQUnR3dW5NQVZxR002Y29kU0dqTkkwZXZHSFM4STlqOWt4ZUNW?=
 =?utf-8?B?S2JvMVV0b045SU5xRHFjSXd1cS9hWGtJaDNQTmFNZXY0Q2hDL0Y0MGFzTDFV?=
 =?utf-8?B?aE1MUy9ubGovckFtemxpU1hnT3NaYXcwK3hMQW9IZnBMdHZoMExhckNtVGVF?=
 =?utf-8?B?dmFDREZhTjNYaWpLVVV5NXpWdC9VZ3dEYm42dXZOZndkZExuNlFlT3pCWU5t?=
 =?utf-8?B?RzRJZXhBalFvUWJhVi9mS2ViYzRIdnFUSE5Sb0xJcXh1NmlqT2FLUWY0R1Nq?=
 =?utf-8?B?MTR2Si9LanludElPMzE3Y2ROVXlDaFF0NnNqK0srcm5MMWloK29LT2tCVXg0?=
 =?utf-8?B?QWFBZ0g4U3c2eHBjUHRiQk1rK09OTTZGekk2a1Z1RkN6MjRVajRkZ1JPLzVq?=
 =?utf-8?B?ZWk3bDErVmFUYm9KT0ptTVlJRENKSGhMM2t6dUxIbW9vSXpyczhOTnppVUw3?=
 =?utf-8?B?amlHV0R3SDNqdEN5YjdFSlBUQlUxc0Y2UWYzNndvV0dZQTBxeDUvMjloVW04?=
 =?utf-8?B?Qlg2SE9sR3VDdlZvUVhsU0pxamduUU9MOWN4bXJqbkI4dytUVW5ZVzA0OEtr?=
 =?utf-8?B?Tmt3QlBqdkVHTDdxOXJ0bUdMUFNBUG9WSW02QlIxNDVIWjlyYmxSQlZHaUlJ?=
 =?utf-8?B?ODBHMkwzeFQya3MyUHVxMVVmRENMU3pxeWJHTVo2OHFQUFZabDl6WGVKZzJ2?=
 =?utf-8?B?MXBaY1dkSlVKRHpUL1YzTmY4WFN1VzZocWlZYlRRQ0VVdXkxbGEzQzYrcFdH?=
 =?utf-8?B?eGh1UVVSY25PVzh1YWtYNWRpeDRZdGswclV5L1JqQjZSeFgzU1hZNFRtc2pQ?=
 =?utf-8?B?YXROVWRGTkNHeTJzWnl0Z1Jrd3V3RnNPMnZzalpMZUx5bERCOXBaVm9SalU5?=
 =?utf-8?B?S3BkdlhqL2NzQzRia0dNci9uamNmRUpxNUd1cGQ4cEF5TTFBWkl5T3EwRXZ2?=
 =?utf-8?B?cis1UTYyMnJxdlhaMkVVMVdKQTRBUUJvNVZRQkVKNXVmd29hR0hFdTZjcFFI?=
 =?utf-8?B?c0Zva2Z2ZmN0RUw2VVJRbXZIeFF6TFU1SEJFN05sZkl3Z210Ymo2RXNOaFJu?=
 =?utf-8?B?dWFOMU1PN21SMlowbkhIb0p4QmxWVVFocHVJZkI0N3pNRVhLQmlxZ0lTdGhR?=
 =?utf-8?B?dEdIVHhpYWJ4QU5RSzh0M3FQNmNuWkQ3c0xsNUhCRXdqek9NblBBM04wZHdh?=
 =?utf-8?B?Yk9hbFhJRkdFZ3c1ZWpKcUJyUDVQL0JJS1VqYmo4UGVkMWdhb3M5RTlvSGhY?=
 =?utf-8?B?ekFxRlNtU09nTEJaV0xzVTB1MTYzYUVIL2NkQXc4cjViTVRBRU9MSTZuQ2VH?=
 =?utf-8?B?aGgxNjFwLytNYmNPN3N6Qjc1T0RmY2pPREFmWEN6NnFEZkpBL0NmSWZyVlhF?=
 =?utf-8?B?REs3VmhJUVRxOEhaYnhib2RtQktpMmUyN244QnBiTGpmcHo3VFZRTlV3Mk9P?=
 =?utf-8?B?MTNLd1pHSFlYdW9paGE2bkxKNGlXS3dhdForN3hVbTV5cXI4a1pjeUVUb3ND?=
 =?utf-8?B?dlNEeFdPbGFkY3RoT2RJYm5LMUN4dnVnTEl4LzZLWitLSEZzbE1JYW1mcGdY?=
 =?utf-8?B?UWdGRGVFYUZYVHk4SXQrZEtlQ25pWlBhdTVyenlRR2c5aGkzUHovYnI1R3Q2?=
 =?utf-8?B?ZXlMU0xiZzlrb2ZSbWI5ZjBaNkhqQkovNW9kT0pCbmZPZk1pWTV6cWJ6VEdB?=
 =?utf-8?Q?ncVTcM86y5zzBoPhCcItiBSvZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c43bde0f-ba99-4e66-b063-08de2ec80d30
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 21:49:48.4070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POYQeS6gvlB1X11ndI0R5KAo/rTQHym7/2QbZSxK/V2Wc0Wj6KjAkZDDCgygyZ6jgSeYM/CzTcdwSQdpGBl+Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9436
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



On 11/27/2025 8:46 AM, Alexandre Courbot wrote:
> On Thu Nov 27, 2025 at 2:10 PM JST, Joel Fernandes wrote:
>>
>>
>> On 11/26/2025 3:57 PM, John Hubbard wrote:
>>>  
>>>> I am torn on this. On the one hand, if someone changes how list_head api works, then the rust side breaks 
>>> OK, this is not going to happen, at list not without a truly epic, long-term
>>> effort, accompanied by *lots* of publicity. The list_head API is just too
>>> foundational to change easily.
>>>
>>> It's been stable since *at least* 2006. The only change since then has been
>>> to add WRITE_ONCE() wrappers to the INIT_LIST_HEAD implementation--and that
>>> is not an API change.
>>>
>>> Anything is possible, but this is sufficiently far out there that it should
>>> not count for much here.
>>>
>>> (though that is easy to flag though via doc tests). On the other hand, we have the function call overhead you pointed and we are dealing with the pointers in rust directly anyway in some cases.
>>>
>>> Whereas this is very significant! We really, really do not want to accept
>>> a performance loss vs. C, without an excellent justification.
>>>
>>> So I think you've made the right decision. The above is just to help
>>> solidify the reasons why.
>>
>> Yeah, these are good points. Thanks John.
> 
> There is also at least one precedent: the Rust `page_align()` does not
> call a C helper that wraps `PAGE_ALIGN()`, it just reimplements it. I
> think `list_head` is a quite similar situation, but ultimately that's
> for the core team to say.

I don't think a one size/rule fits all will apply for this. We need carefully do
it on a case-by-case basis, for example - if we implement list_add directly in
rust, we'd miss out on CONFIG_LIST_HARDENED. So for that, I will still use the
bindings. For INIT_LIST_HEAD and iteration, it should be Ok, though. So I'll add
that directly in Rust without bindings.

Thanks.

