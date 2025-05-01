Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7349CAA5EAF
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A231910E350;
	Thu,  1 May 2025 12:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gUqZN5qH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C785E10E242;
 Thu,  1 May 2025 12:58:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/j6AIvVL4rXXrkNBy77nqcKEoGQADpwz6inEf+7Y/kKg24rRsAUy6SwBH8rYTwCW6YOyJOJta4o0HBbI1HMenBBSh+BzrzAF/AZPZgEw8VNgWpqXuuC75qjqbCDL2SeRkful5wF6A8YNMQe8f0ljm0h5+LxqrYo+FvudWcm6vS3HOzmUSULw/+WEfIOGYI0507dW2yVaMciPo40r6oiZ7vPSOeM1AeEMXbBDs5q1tt7Yf8am//DjdmQ9476MKYXHL9d7IZ/LxnVFwp1cz4ZPyk5xSi1IXDj1P5S9KoGu5YMjJQKTJEacfaag7hGAc67CyF+Jxufk0K7WpKJN2l0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMC/Ug3/54gvSFwv6pLSklvWCTygX+H9XPpD43Q95JI=;
 b=wm97FvKlp1bRXgVCxcdO1se73yVh8exCsHYm8ORRq2JT2Y6RTsjN3USxzz5hhpvQ0JqnVa2RBKSrL8DTgkP7KqkPdG2aZtj5NL33VCHVmk6XxzCjMBnXsNlkVcrIkCidkCAzagN0MK+yvG2qSpa5DBMKmJXNpHZHUjJ0N+Kei3XtP6Nj+QQiRTOlBzxuEoTK98VpeEHWylPzp+To7f6RqZiLY1GYq/bEpqKTp26VlMgwgAYe2TPLAZeiP1yvOKwWpzehZ29Fi5IibpPPTTqo/9DYuEfWPFIys2gHPd5cql3wHBi7ZYXXNYmF1EqelXFwlgj5LX9A4gOGmFk8C7wfXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMC/Ug3/54gvSFwv6pLSklvWCTygX+H9XPpD43Q95JI=;
 b=gUqZN5qHLyeU0C1sJynexgKCGCsetZJNFRKxLv1ShvqvbMonDXhH6yN+rxUbjLeReEcT5IZQlp/vozzAwhjHQ7XiGyjOI0XmrdHPPu/nfycohcCRU8CQD5SsCZPgZnMJ9i52Sw3kH/zsHMG6hShu8PkkBj4DQfwmN91Z8muFa6mF77w3naVi+3KT2aGSxXb1wbUYZQvFXgoetMbFdcPeY5b6JASOcXApAN7jutedwKdsvdSJHK54vo/UACFg26MlYr4nqXb/cgphar2gbm1EOyH2Rce/tfbjP6+/wNsvMfY1kpveL245JKU1pZSOzISQRrXj2E+7INtrBbCtVkmnpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Thu, 1 May
 2025 12:58:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:58:49 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 00/21] nova-core: run FWSEC-FRTS to perform first stage
 of GSP initialization
Date: Thu, 01 May 2025 21:58:18 +0900
Message-Id: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOpvE2gC/02NQQ7CIBBFr9LMWgxMtQZX3sN0gTDYWQgKlWia3
 l2sJrp8Lz/vT5ApMWXYNxMkKpw5hgq4asAOJpxJsKsMKHErN2onQixG+DRmoTvyqLU5EVqo+2s
 iz4+ldew/nOh2r8nxJwfOY0zP5a+ot/2mUf6lixJSkHXKWoOt7tpDKOzYrG28QD/P8wtHLQkAu
 AAAAA==
X-Change-ID: 20250417-nova-frts-96ef299abe2c
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Shirish Baskaran <sbaskaran@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0341.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: b8baa719-27b9-4fc1-a3c9-08dd88afea1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjBjNTEvaHZXSWQ0QzVFODZNa00ySmNuMzVDSlFqWnIzYWxCUkl5eVVicFhK?=
 =?utf-8?B?aXlQRkV4MDZabGU4bksvK2pSWVFPb3R5ZFcweG5lNENzVHBGTENGaWdsRTg3?=
 =?utf-8?B?anBHVHNwQk90aC95bGNOYlJaVjFlcFBqcENxREdONWxSRGtzeklPQ2EzR0Ix?=
 =?utf-8?B?T1NkVUhwV0tteHZjSXJaUDllejAvYmhRSDN5VFlFZG5nWHRHM3dYdGNZRkQw?=
 =?utf-8?B?V3JZQTduRUF6NFVOZ0REOVV4MHpoWERJYXFmVFFoUEYwTndrYlludzFZMjYy?=
 =?utf-8?B?VjhVbWpIT1BpeEt1cExaM05SUjZiQlkzdmlqM3AyR3pwS2ZvcllYeTB6WXJK?=
 =?utf-8?B?bHpJK3diN05WZnphbWY5MDA4a0p4MUxhNW5obFVtdEE0VnNxMmliSXQyQ04w?=
 =?utf-8?B?RjllQUpObkN1ZnNRR2g0SUpTTFREaDczdnZycm91U0dvQ1dGUXd5TDdxM0hX?=
 =?utf-8?B?U0R1eUFYaXRlYXRXMUllblBCK2U4Z2ZaeEdPYVVJbEdsUG9EcldBMVNXUE9B?=
 =?utf-8?B?R3lTZkhwRWM4QWFDTWRpZ0MyR1VYYk0rVEloeUUzTHRiODd6S1NaV3ZQeVYz?=
 =?utf-8?B?ODRoRlJ5UDF0aHBXL3cyWW9ZQ3AxN2pITGMvRkFIUXpvUUdBa0hSK0dCQzhi?=
 =?utf-8?B?amt1eXByb21XeUp2YjRsaUtsWnVTanJjZWFFYXc1dTRaUExibDJyQ1Y1VGU0?=
 =?utf-8?B?Z0RjU2JOcjFsQnpYSmdMTnFOWXRJRXR1a05YeGJDVDFUcUxYY1QzUWxTQnZs?=
 =?utf-8?B?bVJ2VDFYazV0WThINjBRTlBCYlBkRVMxUGRqTmp4NEpRUW4zaWJzQ1dKUkJD?=
 =?utf-8?B?TkJYYm4vR09OdmY3QWx5S295dHVDTmlZWTRrMlhjcXBOY3FDNFJiR2tva2Ju?=
 =?utf-8?B?eFhodUpjckh3UGw2ODl1VVk1RTQ2WEg2MkVtVkR4NDFyOGZCRWlMSm1QS1E1?=
 =?utf-8?B?SEFCbUNocWFGSG9CcE1PZ2x1MGZJaWMvVEZKR1A0RkVHOXBRYlZsb213U2N4?=
 =?utf-8?B?Y3d0ZXcxbENwZlJVU0ZDNDg5ZkJJV1lZWUJPcVlyQWh3VExjcHR0WW1sa0FI?=
 =?utf-8?B?cVdVTEtWNno4TXFGSWpncSt0VFYrMjZFbmFZTlpOSjkyY05WN2dHMWFSOXc0?=
 =?utf-8?B?YzZld0NjUjlmYnFjbDNTMzI1bmlhVTRPOXNYZXZqakpiZ2Vqd3JWM1cxbGtt?=
 =?utf-8?B?UXFZUnA2UjM0RUw5a00wMU9GdS93TGx5TVdzdENsaXBoeEdUQVdpSUh2OU5j?=
 =?utf-8?B?QVMxbEFIK3U1cmI0L29XQTYyVnZhbFpnYSt4QVFObGZxVnN3SnJ6S3l4NWFm?=
 =?utf-8?B?bEJrMGNuZlFnMC9zZHFUK2NwcTF0eTRPTkRvWjNvai93RUhCMmFzRURjUTVu?=
 =?utf-8?B?cFJHT1htNThSOGx1bVZNb005azg0eTNLOWIyWlRRQWI1RzVnM0VML0k4TWJU?=
 =?utf-8?B?M2I3SXFzZG8weVczQ0RqL0pHb2FWd3BBRm1PUzA1V0w3ZVJxbGJpbGh2eVVG?=
 =?utf-8?B?R0hRMmJ3VGdpelpsTWoreTloSTUzZ296cjJvU2hRSHN0S2pjZi9tSnkzRStM?=
 =?utf-8?B?bzd4bkVqNjB4ZC9WblNHanUxRDN4NG0wU3VvYk9JREp1dXpwVW42aCtxK2do?=
 =?utf-8?B?VXpKTUVDaFJZTUhiMmhVaHVLNUFKbG90eGV5L3VvY1RIdGJHNHhLZ0xndDZZ?=
 =?utf-8?B?YU5MbmY0WWlDYThXZUp2UnRJanptYW8wMEVhaGNBRVZPNWNDM0F6ei9IQmdJ?=
 =?utf-8?B?TGF6V2tJdVZqTTg0WHV1U3RBMVpMcFNTZ2VYN3pJUmJXUitobSsxVjNlRkpm?=
 =?utf-8?B?NFdIc2tkVkhYVWpRaG9ZN1h2UmJMNFBUellPUGlieHh5c21CeTJ6c3NrQjQ4?=
 =?utf-8?B?QUNwTXBoQmJCM2FuQnp0dEhyUjRHN1RKLzIyUG5teFU3cjFGaXd3bXNJYWpo?=
 =?utf-8?B?WkhaN3k1eGhMUmtOOHoyaUJqazM2VGtxaUpSR2xWTnF0S0dkNFE0N3M1WHFz?=
 =?utf-8?B?NHdTaUR2WkVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEdvOXd5aTg3WmJTN0l2UFc5bUg0WnFib20reUt5c1l2YTdSa1dwMVJ2VlNo?=
 =?utf-8?B?NVZEQytNTnE3SURuTHcxSWVuNG1wVlBUY1RjRlhXYWc1ZUFJaWVPR0VPbVBz?=
 =?utf-8?B?U3EzRTRlVjQzN2JkWGtNb2xmejl2MTNRbzJKWlZ0Si90VTQvbE9mU0hjd0hX?=
 =?utf-8?B?L1B1am5tZU1ETWx4LzVaUUJZaXNnZnZrMkFzb2xTaVk1UWExaTNxLzgxc3cz?=
 =?utf-8?B?aGM0RHhSK2pubXJLdmNJdjllWlBER1RrMTRIUWkxVGpsbDVEcnNPckFDckcv?=
 =?utf-8?B?ZjNzQ3AxODVtdlVLd0ZuMTJTazRBbU5qejhZOUMzZlc1VkVEZUgwUHJJTzRU?=
 =?utf-8?B?eE80S0Q1THM3VnVrZE0xaVl3UUhvZ1k2ejJhRjZhWmZ3MzZ6akFhbWRLem1R?=
 =?utf-8?B?dEIybkpFY0h4ZGQ0aStzVm9aZG83UnR1eGVyeWdRVTZvT3M2MVB0Q1hjVGI1?=
 =?utf-8?B?R3FIUG5jMG1uZ3VaaFQwSnFKY0lRakpqdVpGaHp4aHgvQm4rbWMwWnozYm1T?=
 =?utf-8?B?ZmhUb1lPNlBEZFh2WGZjWmcwNGUrS0ZKK0RwMzhUaEJZVkZKV1hUNTNqb0Yy?=
 =?utf-8?B?SEZpdGcvV1dmTlUvSEVlYkh3NDZiRy93RVlMYjBXaFVUTTJCR1hOZlI0by9s?=
 =?utf-8?B?UUZEM1JnejI4VU80R3JQRndIeTB0bzh4TVB4VGpJVFliRWVjTW9UcGNBOUZE?=
 =?utf-8?B?cWR6UUVzWFZlSi9IYjVtM2JqMmFtbWVQWHRvZkpCZmZucnVmNm54RkJRckpM?=
 =?utf-8?B?cEhJZCswMnczY25MaWF3VGNqLzNOZ3JrWk5SRERwMk9sNjBNMEI4N0VyQ3lJ?=
 =?utf-8?B?ZCtoMUZxNFlHOGwrRVYvNnVFc29kYUVHUEwvSUdDcU93SmtZTjlpWXlVekk2?=
 =?utf-8?B?dGdwdDFoZkNpaUg4aWVlQlNEcmJzOXA5dW9uZkpBRjVpcFdpNmNHQWpSRUdZ?=
 =?utf-8?B?M2xJMTAzVXRCRnFhMTRrUzdKTi85OTJpUDBoVEZWOHY3VElvNzc0d2ZpZGQ1?=
 =?utf-8?B?dDJlSC9kN3ZMWmYwazhSTXhrdm42Y0hhYjlhdk5CZjlNTGFxNjY5ekN0Sm9H?=
 =?utf-8?B?amtHaEVNNnNBYStVeUloZEt2OElIWTk4N0QrdTBhNWlndG91WTJ4RUJVSWR2?=
 =?utf-8?B?M3VQYW1EZ0N3NVBLVEdZZEhVT01EYTVGbFpDUG9nRUgvSFYyU0NzVGxUT0Zh?=
 =?utf-8?B?QSs0d1pva0FPeXQvQTFCOEFUTnlhVHZraDdIaVpZTmxsUjlXdVI1YVF0QXFP?=
 =?utf-8?B?Ym80MHFBRkNtNFloMlc0bGwyak1QclhIem1QRG0xNk1DU3BFSDJudDNNbDR5?=
 =?utf-8?B?YTFDOVh0ZnF5WUd1VlZ2WnQwbWZGcDZ1ZjhoZG44bXd3YjJMcmZwZFdyMjVH?=
 =?utf-8?B?MjdqYXJzOTJtTG02c3h5cDZwYkNqUFJyRy85bjBXTmgxY29YeWRSWFF2VUtL?=
 =?utf-8?B?Z2ZQT2t3Mi81MlFTanFsZW9hLzlZN1Q2VFVxOWlDb05GekpjQzIrc2dVMzVJ?=
 =?utf-8?B?bGZoOTlFMlgreXpHblpTdnhac0xVRjA2YXRXN2M3UktoOTVqbmtrVzFEa1V2?=
 =?utf-8?B?VmRMUlNPQzRsVUszSEd2Nm4ydWVBbEdTcEVlWHNBVUdwaytRVnN3N2NHcVN6?=
 =?utf-8?B?ZWp5NGovMjVFMHBKaTVzM0NBVEhXVHNBeUVyb0s3UzN2aVpkSW1HbURyNXpw?=
 =?utf-8?B?Wi9TUG1rUUZPUDhKK3o1a05xVHc4bnkxcEZSRVVMY2ZzSzcycXpQTmM0Y2x4?=
 =?utf-8?B?Y1F2RmV5eGlkQ0VLMzhHQkl1T3RPeENMUTJNZzZzQzRGaEtTNnZaU0t0UU5u?=
 =?utf-8?B?ZjcyK2NiYU9DTTBKbWt1MStFNzlpQkdFdGE2YklselhpUG12ejlOc2srZGla?=
 =?utf-8?B?TkNZTUZONllwR2VCdEJNU2JFQTVEMllwWWxqYUdjZExJRzB2UFFLd1FBYVBj?=
 =?utf-8?B?aGtnM0pqZDlOdndpTktoU1lxL1cveUF3SzVsaGRTSzVRWnlUQWQzM1pXcmlR?=
 =?utf-8?B?b1d4VFJodTBhTXdPL2ZmaXFWNGtTdHZzc0krb3ZLOXhZWHhZV0hveG1hcm10?=
 =?utf-8?B?cVdBc2RSWk1qMGZCUlZBZ2gzVWhJTkRldHBjWU1wZW8vYmlZVXNhcTNocjk0?=
 =?utf-8?B?aTV0RDRqVUl0YzA2RHZDeEdhRC82aVVGZlVWdGNwVjhLMWkrUno0Q1hSSVJI?=
 =?utf-8?Q?WGhSmINWGP2uChdLTeSHm3c9wGjYxZukxdkkl8O5nFi9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8baa719-27b9-4fc1-a3c9-08dd88afea1d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:58:49.5666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fY+XZJVKmITew3tUqVzR/CJyxsA4xfVudKSBFjZ74BXAVEdzje3hn6WnGwKY+m9G67BQHUClNgL3wGYcFiqktA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442
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

Hi everyone,

Second revision of this continuation of my previous RFCs [1] to complete
the first step of GSP booting (running the FWSEC-FRTS firmware extracted
from the BIOS) on Ampere devices. Thanks for all the feedback on the
first version.

While this series is still far from bringing the GPU into a state where
it can do anything useful, it sets up the basic layout of the driver
upon which we can build in order to continue with the next steps of GSP
booting, as well as supporting more chipsets.

Upon successful probe, the driver will display the range of the WPR2
region constructed by FWSEC-FRTS:

  [   95.436000] NovaCore 0000:01:00.0: WPR2: 0xffc00000-0xffce0000
  [   95.436002] NovaCore 0000:01:00.0: GPU instance built

This code is based on nova-next with the try_access_with patch [2].

There are bits of documentation still missing, these are addressed by
Joel in his own documentation patch series. I'll also double-check and
send follow-up patches if anything is still missing after that.

I have also tried to look at ways to split the patch adding falcon
support, but couldn't find any that would not be awkward. Starting
review from `falcon.rs` and going down to the HAL should be the logical
order for a smooth review.

[1] https://lore.kernel.org/rust-for-linux/20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com/
[2] https://lore.kernel.org/rust-for-linux/20250411-try_with-v4-0-f470ac79e2e2@nvidia.com/
[3] https://lore.kernel.org/lkml/20250423192857.199712-1-fujita.tomonori@gmail.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Rebased on latest nova-next.
- Fixed all clippy warnings.
- Added `count` and `size` methods to `CoherentAllocation`.
- Added method to obtain a reference to the `Device` from a `Devres`
  (this is super convenient).
- Split `DmaObject` into its own patch and added `Deref` implementation.
- Squashed field names from [3] into "extract FWSEC from BIOS".
- Fixed erroneous use of `ERANGE` error.
- Reworked `register!()` macro towards a more intuitive syntax, moved
  its helper macros into internal rules to avoid polluting the macro
  namespace.
- Renamed all registers to capital snake case to better match OpenRM.
- Removed declarations for registers that are not used yet.
- Added more documentation for items not covered by Joel's documentation
  patches.
- Removed timer device and replaced it with a helper function using
  `Ktime`. This also made [4] unneeded so it is dropped.
- Unregister the sysmem flush page upon device destruction.
- ... probably more that I forgot. >_<
- Link to v1: https://lore.kernel.org/r/20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com

[3] https://lore.kernel.org/all/20250423225405.139613-6-joelagnelf@nvidia.com/
[4] https://lore.kernel.org/lkml/20250420-nova-frts-v1-1-ecd1cca23963@nvidia.com/

---
Alexandre Courbot (19):
      rust: devres: allow to borrow a reference to the resource's Device
      rust: dma: expose the count and size of CoherentAllocation
      gpu: nova-core: derive useful traits for Chipset
      gpu: nova-core: add missing GA100 definition
      gpu: nova-core: take bound device in Gpu::new
      gpu: nova-core: define registers layout using helper macro
      gpu: nova-core: fix layout of NV_PMC_BOOT_0
      gpu: nova-core: introduce helper macro for register access
      gpu: nova-core: move Firmware to firmware module
      rust: make ETIMEDOUT error available
      gpu: nova-core: wait for GFW_BOOT completion
      gpu: nova-core: add DMA object struct
      gpu: nova-core: register sysmem flush page
      gpu: nova-core: add helper function to wait on condition
      gpu: nova-core: add falcon register definitions and base code
      gpu: nova-core: firmware: add ucode descriptor used by FWSEC-FRTS
      gpu: nova-core: compute layout of the FRTS region
      gpu: nova-core: extract FWSEC from BIOS and patch it to run FWSEC-FRTS
      gpu: nova-core: load and run FWSEC-FRTS

Joel Fernandes (2):
      rust: num: Add an upward alignment helper for usize
      nova-core: Add support for VBIOS ucode extraction for boot

 Documentation/gpu/nova/core/todo.rst      |    6 +
 drivers/gpu/nova-core/devinit.rs          |   43 ++
 drivers/gpu/nova-core/dma.rs              |   57 ++
 drivers/gpu/nova-core/driver.rs           |    2 +-
 drivers/gpu/nova-core/falcon.rs           |  543 ++++++++++++++
 drivers/gpu/nova-core/falcon/gsp.rs       |   25 +
 drivers/gpu/nova-core/falcon/hal.rs       |   55 ++
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  115 +++
 drivers/gpu/nova-core/falcon/sec2.rs      |    8 +
 drivers/gpu/nova-core/firmware.rs         |  105 ++-
 drivers/gpu/nova-core/firmware/fwsec.rs   |  360 +++++++++
 drivers/gpu/nova-core/gpu.rs              |  223 ++++--
 drivers/gpu/nova-core/gsp.rs              |    3 +
 drivers/gpu/nova-core/gsp/fb.rs           |  109 +++
 drivers/gpu/nova-core/nova_core.rs        |   23 +
 drivers/gpu/nova-core/regs.rs             |  259 +++++--
 drivers/gpu/nova-core/regs/macros.rs      |  380 ++++++++++
 drivers/gpu/nova-core/util.rs             |   29 +
 drivers/gpu/nova-core/vbios.rs            | 1149 +++++++++++++++++++++++++++++
 rust/kernel/devres.rs                     |    6 +
 rust/kernel/dma.rs                        |   14 +
 rust/kernel/error.rs                      |    1 +
 rust/kernel/lib.rs                        |    1 +
 rust/kernel/num.rs                        |   21 +
 24 files changed, 3445 insertions(+), 92 deletions(-)
---
base-commit: fc55584e00fc8409cbaef4bcd984016dca6f1b6b
change-id: 20250417-nova-frts-96ef299abe2c

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

