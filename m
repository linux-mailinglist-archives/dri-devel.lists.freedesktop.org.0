Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CB2ABEC2F
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453B610E636;
	Wed, 21 May 2025 06:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oVsH6OTc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DF610E66D;
 Wed, 21 May 2025 06:45:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOZVlOWZdAwYZ8ko/t/YK/XUpxG5oclumLGlPrjbSIcS2nAB89nfGpdORAfVNsuGF+EJ9LCWDEUsVfUw1M98omYLHc4ry4pfnfqKvMtsFgbWGR2KQf5PnjRxzoX4jEhYSRvBHc28o1Ua0okf1upkpfLOjpnOdjLW7HTScu3HdMi1NYgMXt8Xia4J7FyD7MF0GXlEgrjoeWIkre2AOHfBrQ1lBhIT3tUPMNlVYxo//pR1hN//Bcbrc2KQ2upAnXjpeDHVUjcYnXoLuYh7oiliovNREbg2/Dx+vm8/ynB+AqQlX2CdqlE6Cj60oV6Nooqh8Hg1sDfCrzFvcI3ydlduSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5TSKiZ+e0hZvvQ4ZeEE0AKMCI85vtA07oIWe5udJyo=;
 b=rmTZiIT/YxEwU+rbRhN4XyFn68OLLd9TA7M52XAESlwuRUAESaQeAOCns6AtpqZ3FbgdNCE5ay5kyys/QoN25JuyYPZgW1dcxa9LlJ2hzB8iK4BEWoAtDM7ciMxEQDuYNMgJ/3u1xEx4mGxfo3uezW1NYfHyDdfaWQvu3hx7+gjS8S5RXLbkPw9YMkFdjSq9P+Iq85pyI9Ow8tOdvUosITk3zIFMGyxMn3W7Zpl21ZogPTkWU+oR1Gyz7juwGy7nkPagegMT4iCRPFAs2m/y09Uh7L8/HWSi3XyJHw6dMAPNwYoRLkVkSt3cXZOovXXZKLefidukAMwjd1a58jb7pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5TSKiZ+e0hZvvQ4ZeEE0AKMCI85vtA07oIWe5udJyo=;
 b=oVsH6OTcZiadlaI0Z82z2iZURvXMxW/lJooSNq4OFeD7SLWXxiVgZBW/ktAAKsl8wHMqM2DlKdCH8aSqmgDWD9s0ChxHVvCENnG4eLu312RblaCjICabtfPGB6uVREyJROiq5viKMEkahBvfktUkV2RUaxAHix4rG3kve1eQ/mvD53P9ztu7ENEatqukhfQTP3lbDugpArz76ZCRViEdC8JLvuBZT0tpg1tRB17Mo+AixYDG8QMFDwLI1UFquKG1FG4UTTSkJSQpn93Uztz+5ZHH3ik/50+D1NLg6W+l1i2dYYFx7x0nUaqG6e9ensg4iKuszlc/GMI8GoZ/4hJxeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 06:45:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:45:43 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 May 2025 15:45:06 +0900
Subject: [PATCH v4 11/20] gpu: nova-core: wait for GFW_BOOT completion
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-nova-frts-v4-11-05dfd4f39479@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::9) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aae18f8-4a63-4ae3-b573-08dd98331b2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzZ3VnZjM05SRlh5aWpLSE1Rc3B4L1BvVHhxaUJwblc0UFlCSlZlV0czK2h4?=
 =?utf-8?B?aENIVkNMM1RUTldZSWdrK2lOVVRRRjRtZ1AzN3ZkbnVhU3JIcFFrY3hvdVFX?=
 =?utf-8?B?NjNJams1NDAzMHA3bllERFl1MXpzOVRIQjVncmZ1Z2pMZStSUUtPdmxXVHRl?=
 =?utf-8?B?bVZmeS8vWGJUVlZNNjd5Z2NaVlhvVkJQMHJqYkp0WXFzMzN3dy9RY0RYSmMr?=
 =?utf-8?B?UzFOdDhCbG1MbDRYbHhnR0dRb1YyZldsUGlJZ3RYaU9rNDB2bXhYMlRqY2VE?=
 =?utf-8?B?Rk1qZVEvQUs2TlpPVlpDcDRDc3pTcEorWURiQUIvOEdlc0F2bEhla1ZDL2J5?=
 =?utf-8?B?WG9YQVlvaEhCVVJlelRKK29acVN4ZFZNV045cU1idnFxVkl2QnY5R2lYdG9T?=
 =?utf-8?B?aVE1K1huNzJkZEdPWTFxWWFoM2QxeWh2cndncTRqbjhpaUJIUk1lM0UyU2pu?=
 =?utf-8?B?UDZlTG1mbnFnVFhEdGZ6UGI1MkhZdFc3RWJJWWpLdWRqVy9uZ056Sm1zN1Jr?=
 =?utf-8?B?ZExCeUNaMVFXSnlNUGdZWktHa3R2VHdYc0cyMXZPaEZCOG1GTTFtSlBkVzJQ?=
 =?utf-8?B?aHlRb2dUbHkyK3JELzFSY0FDYUpTNHZIUnlKN2JLMkpRUktMZElRQk5pUGEw?=
 =?utf-8?B?aXF5dURzdjN2bzVVLzk4eTRmM1pQMFM0clhEOEdSeitSVzlFVEY5dS9td1lX?=
 =?utf-8?B?V3JhZE8ySmZMa0hPNzlvZTBtbFBvNmJiRUZqdXFZSnF6VENicTgzNEdHS3p2?=
 =?utf-8?B?MkNSdldWbjlZU1pSbnVMSUJ6d0FtbVVSR0w3TmhITUFrZVc4d082QzNhSGJ5?=
 =?utf-8?B?RGU5YmNBRWJGTjFyYk9LakdRbmptWjJDdFRhRUdSTFk2YXU1a2NiWFRxejlG?=
 =?utf-8?B?MlI3d3loUVZDWDNZa29JS1dENlJXWkxMYXI0MjNRbXV4VUt1K1NVWStrKzlT?=
 =?utf-8?B?ZGp0ZkUvUGIrVVY4WDhDcFFYN3Q5aFp6dWZiOHNvL29UUXNwWnVvTTNvQlZM?=
 =?utf-8?B?bVdLK3IyNjZXempQMVlOZ3RHS2RJWFF1Ky9NbkgvbG9CZmp0dFI3L1k4ZlFQ?=
 =?utf-8?B?ek1TVTNmcEEyK1IxRVk2dnc5aE1Rb0lJamg0SHlsaU9Gak5DMFZJUGcvWitG?=
 =?utf-8?B?bForNmNwMzZPSTBDOUtpNVlLVjI2cm0yNVNnMnVGdlNPQWRQU1VaQ3FUNFVz?=
 =?utf-8?B?L1dZQ2pFVk41WlNwV2Z0Z0FYU21iVjM5VzhURk1ST2ZybkpzUkd5ZkdkQVEv?=
 =?utf-8?B?OXVrZFFYVEg2cVVGS2d0TVNzTDFGd2h2cEZsb3o1RTBJZnFzSlprYmNvSHlE?=
 =?utf-8?B?MHUrZjhJbFpOaEx3MFhheHl4ZW5FbVdDOXN5cGFQZXdVOTVUR0FNWFJ2M2U3?=
 =?utf-8?B?N3VPT3lYbitJV0t2WkpvUm1aMnIwaXd1ZEtZblN3emdnWHRqUVhNTWQ0VWlM?=
 =?utf-8?B?bVNMclJsQ2ZPSTJFL3JoNkhVV0x3VUhadEljMHJGa1FhS1ExeFpxZnF3d3k3?=
 =?utf-8?B?NEczQ3lKT1pKNUpnaVREcDJ5MkZiOGJ5SVJ5SENaNzR4azNLaytFL09qMFAw?=
 =?utf-8?B?OEs5SkM4WkRZL0VYYXNEOHhZQlV5eXc0aTErM21iSS90UG0vbVFYekpTL1JW?=
 =?utf-8?B?NmpLUkl4SW12a1owTmxDeVlHVWtRTFlFVEprSzdhZU1xR0l0WnBtRm9BM0Qy?=
 =?utf-8?B?clRaSUZseExkWWNUaS91cHpXM1ZCUlc2L2dybFlpQ0dUZ0h2NnpuR3JXcXQ0?=
 =?utf-8?B?OEVBbWFGTUcxUUp3dGp5RzdmTjNpbFprZW9pemJMY3hVSU1MaGdhRVU3bDZj?=
 =?utf-8?B?eUY0eVdVQWZqU1h0UlRrV3k3OVlMczYva2xYS05lRndXcmNXcmx5dlcyY1Ro?=
 =?utf-8?B?M1BkVCtlNHpIL05YU3hOWHV3TkhVQmc0eXNRQy9QdGVEaVAyU1JWVWdJY2Y4?=
 =?utf-8?B?Zlc3Y1JhTXIyZ1E1dUo3SHJCRlExaWIyakNmQTJQNnc1QUN1UE85STFGVHFT?=
 =?utf-8?B?ZlZsaUQ5UnpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2E1cXZJOHRYMXllK1VNa0c2TUFtTjg2UzRWNWdqZG9FWWU0UExsZXhyaHMr?=
 =?utf-8?B?WE84V3FaNlBxOURZbktTTVRwaWNIb2tLQU5mS2dKUmFhcDhlbnpSdGFKN29w?=
 =?utf-8?B?SXAxRVlGTGozL2xWWTRETm1hQVJBOGwwa1NvaS9WY2lzdFYwN3g2NVNuRmlT?=
 =?utf-8?B?a3M0MXRLbXJRaFBaTHc4TXhmWmFiTE0vRnJyaTRuMUs5ekxQVHRmNzM3Y3Ur?=
 =?utf-8?B?a0gzdlhNQzdjeU9tOFJ5dlMzSEp6a0tRaFBSbmRrYy9nUnN6WjhjZndmZ2RB?=
 =?utf-8?B?WXd1NWg4aFlZbHByQ0hLZUlROTRvYjNGR1pGU3krRHBWdktMRE1kckNLckVC?=
 =?utf-8?B?bHpVaXJQV0t1VGlRbVJjcTI3cmRJcUZ4SGkwYWhNd21qOGhFaERlQ25yMWt6?=
 =?utf-8?B?MGlkYjAzeVVDODhycHVXWXJFVEp1WFkrVjhWblVVdmFYOVM2YW5nQVVBZVRU?=
 =?utf-8?B?Tml4NnRNSEJFQ1FBOUdXcG10VTVlQ2w4OWxnZUJadjFxTHBMTnErS24vYWc1?=
 =?utf-8?B?QkhaUmg5QXVwMUgvZk8rMjdrRWZTcjBma3lkV1NZNGhYaFBhVVlqeDd4SHNy?=
 =?utf-8?B?eHBtcXNCdmV5bi94eFgxeUVMbWM3cWdpZ09MNUZocnVpVmEwNHBOdEZkcDgz?=
 =?utf-8?B?ZHlUaDlUSThiOW1jaEhJNFkvdE1ETklqV0RQVmRWSkkzVE8ycE43ekF0a0RZ?=
 =?utf-8?B?eHhzVnNIY3lmZVFKeGZNQ2ZIbHNQRng4WWcrd1grV25FdUhGSVJ3bEp6NllD?=
 =?utf-8?B?UWsxRmxpc2R5MFV6bk8xWG55V2d6Nm0wSzdFYzJnZzNpNkhwUzZuaVdSN21D?=
 =?utf-8?B?RURYSEFlS2VCbnlOeHdHWXQ1azNsMEZISW1QMS96WlNmUkx5bHBJRVhra0lK?=
 =?utf-8?B?aFJWYzM0SDliZlBFcUVyZFVKU2tzazFpZlo4WkRmWjdDSkZtOWVtYVZCQmMv?=
 =?utf-8?B?UVVhT0ZmcWZRZFRBNnJqTkxBQWJzd0J0YnRLczBEMmV0U0lJblQ2SXQrWk9L?=
 =?utf-8?B?U0E4WUVMaGhKVUlNZG5hWm04eEoxTmZrNkxlR3pTblV4a3V4Q2k4azgzWHgw?=
 =?utf-8?B?Kzk2bzFJRFV1dyswVW85amloekZjYVlBNUx2WHRneTFPbFhvN2ZFZldzYW1h?=
 =?utf-8?B?cFJ1eStaRkRRNC9GSnBhOXppdGpXRjFkY2pna1FMeG91Q29wYi83TjU4ZVpT?=
 =?utf-8?B?c0pHMVNPc3Rjc05vYmtqTHVFMTR1Rzdkd1JQaHhUTUxSVFNEbCtXbzVleTdX?=
 =?utf-8?B?NjB2Ynd6WGtmdDQvNHB6Q1orV0lJRldkb3phdkZqSHc1UG41aWVmd1Nqc09Q?=
 =?utf-8?B?OVpyeXlqL094TENrblptVGpMUTliaVNvd2hLU29YNlRuZ1hSejU1Rk96NFBj?=
 =?utf-8?B?RFBzekRpeDhjWVQya1ZlRUZucTdFNEMxMVJtM2lCZmdBcHJEQTB5bFU0cDNw?=
 =?utf-8?B?TVhkQVI3bmdKTjBHRk50aU9HajFOOXFFWGtrZzh3eXg2eHB2Y3VzSE5hLzgy?=
 =?utf-8?B?UUJHbTdNRkFRTVFXQXZGLzFzUTlQVWJYaHB6VVVlL0M1L3IyWUMrS3g1dWc1?=
 =?utf-8?B?dWdxOEZTdkFPS1M1RWVyMWxEQms4K0IyWEQ5VTQzcEdUdnUya2pUOGxsdW5j?=
 =?utf-8?B?Z2swT3kxcFNuRm9Jdko0WEdmcy9IK1hlbXJaV1pJdlBiZWxEYWorUG5zbDhW?=
 =?utf-8?B?NXR1SERyTGkzTHVxZ2hWZmQrbys5TC9YQk8ydHYxZnpQd0NoUC9JTmVMVm9H?=
 =?utf-8?B?bmpRNUJ6alRGRS9MMS8wT2VOSGdjMHJpMkRiMmtJdkJvU1loTHpVeWJVRW9a?=
 =?utf-8?B?cWtDMlpUbzl3ODI2a3BqNVNmZVpTMERQWEE5MVl2cXArRmhnV2NVR1cxYjk1?=
 =?utf-8?B?SG02U0ZhOEU4dWEvRStrVlF2OG5WcjV2a2dsMHhmZTZRRTVnYzJCT2ZlSkJP?=
 =?utf-8?B?NnhWZW9BK1o4eEhGaTNYdGN0WFZJSENnaU1SK2ZHeitSSGJUejlGMkd2TXVK?=
 =?utf-8?B?aWZJdUdtQWhPcGNYa29OTFlhcGlWTVJzWW8rbXBwOVlXTlJES3RNeEpvN3pJ?=
 =?utf-8?B?UzNJUTNISU1URHBYZ1FPK1JwNG95dGU5bjFUK3l1TFNEdGdkYVBsa3FnbEx6?=
 =?utf-8?B?WTZGTU5lTUpTVXRYdmxkK3lLV0ZkV29WWnZFTGJSbkMwbGhZSjBXSXJmQ2hk?=
 =?utf-8?Q?pNHl9kKpyItgQ/ptGjIDuAJNvW8kpM2trFhp54RN4geb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aae18f8-4a63-4ae3-b573-08dd98331b2d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:45:42.9816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3mPHJMTf/d+BpL/HjRkpJONUssXSD4bP5Iq3DIspOOhGjWbybJ0YWNXXgqy9/ciqhRCR3S8IW2d5kInVH3fpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

Upon reset, the GPU executes the GFW (GPU Firmware) in order to
initialize its base parameters such as clocks. The driver must ensure
that this step is completed before using the hardware.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gfw.rs       | 37 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs       |  5 +++++
 drivers/gpu/nova-core/nova_core.rs |  1 +
 drivers/gpu/nova-core/regs.rs      | 25 +++++++++++++++++++++++++
 drivers/gpu/nova-core/util.rs      |  1 -
 5 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gfw.rs b/drivers/gpu/nova-core/gfw.rs
new file mode 100644
index 0000000000000000000000000000000000000000..11ad480e1da826555e264101ef56ff0f69db8f95
--- /dev/null
+++ b/drivers/gpu/nova-core/gfw.rs
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GPU Firmware (GFW) support.
+//!
+//! Upon reset, the GPU runs some firmware code from the BIOS to setup its core parameters. Most of
+//! the GPU is considered unusable until this step is completed, so we must wait on it before
+//! performing driver initialization.
+
+use core::time::Duration;
+
+use kernel::bindings;
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::regs;
+use crate::util;
+
+/// Wait until GFW (GPU Firmware) completes, or a 4 seconds timeout elapses.
+pub(crate) fn wait_gfw_boot_completion(bar: &Bar0) -> Result<()> {
+    util::wait_on(Duration::from_secs(4), || {
+        // Check that FWSEC has lowered its protection level before reading the GFW_BOOT
+        // status.
+        let gfw_booted = regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK::read(bar)
+            .read_protection_level0()
+            && regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT::read(bar).completed();
+
+        if gfw_booted {
+            Some(())
+        } else {
+            // Avoid busy-looping.
+            // SAFETY: msleep should be safe to call with any parameter.
+            unsafe { bindings::msleep(1) };
+
+            None
+        }
+    })
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 99c6796e73e924cb5fd2b6f49d84589c1ce5f627..50417f608dc7b445958ae43444a13c7593204fcf 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -4,6 +4,7 @@
 
 use crate::driver::Bar0;
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
+use crate::gfw;
 use crate::regs;
 use crate::util;
 use core::fmt;
@@ -182,6 +183,10 @@ pub(crate) fn new(
             spec.revision
         );
 
+        // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
+        gfw::wait_gfw_boot_completion(bar)
+            .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
+
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 618632f0abcc8f5ef6945a04fc084acc4ecbf20b..c3fde3e132ea658888851137ab47fcb7b3637577 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -4,6 +4,7 @@
 
 mod driver;
 mod firmware;
+mod gfw;
 mod gpu;
 mod regs;
 mod util;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 5a12732303066f78b8ec5745096cef632ff3bfba..cba442da51181971f209b338249307c11ac481e3 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -37,3 +37,28 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
             .and_then(Chipset::try_from)
     }
 }
+
+/* PGC6 */
+
+register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {
+    0:0     read_protection_level0 as bool, "Set after FWSEC lowers its protection level";
+});
+
+// TODO: This is an array of registers.
+register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05 @ 0x00118234 {
+    31:0    value as u32;
+});
+
+register!(
+    NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT => NV_PGC6_AON_SECURE_SCRATCH_GROUP_05,
+    "Scratch group 05 register 0 used as GFW boot progress indicator" {
+        7:0    progress as u8, "Progress of GFW boot (0xff means completed)";
+    }
+);
+
+impl NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT {
+    /// Returns `true` if GFW boot is completed.
+    pub(crate) fn completed(self) -> bool {
+        self.progress() == 0xff
+    }
+}
diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index afb525228431a2645afe7bb34988e9537757b1d7..81fcfff1f6f437d2f6a2130ce2249fbf4c1501be 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -34,7 +34,6 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
 ///
 /// TODO: replace with `read_poll_timeout` once it is available.
 /// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
-#[expect(dead_code)]
 pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Duration, cond: F) -> Result<R> {
     let start_time = Ktime::ktime_get();
 

-- 
2.49.0

