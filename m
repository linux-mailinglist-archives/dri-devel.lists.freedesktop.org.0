Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444D1AAE14B
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DE610E7C7;
	Wed,  7 May 2025 13:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fa3KGcXL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63C310E0FE;
 Wed,  7 May 2025 13:52:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQWHKwEM98OCqkQzx7iU8Dsxu0Jt0R2akcuCYuXlBQLmrKCcn5eXvu8f3IixLqNoq6CNrb5tNf93RkJZelObWN1CQFLyXPQxpxaCiYXqQCYVQPwrDcEGSy6rIKD5AtjqNzlyFCqw7O4I547YLN5BiiX5Al1/ptqJ4yA0WRBPXZ3qBG+x0cXI9iT0FuCpmOwik+JrHJrBEITXf/7r64tYoFiiJGYuV2B7MSiQFpTtc2tWRTMRFXec3IUbW87sleN+D1LpjqvwfSACBGEoyCnEwCTHTv3SEjV+t3sESYs2XfsiFY2gnB1Jy8lEKoQt2F+SChYXAJTqr8ZdZgWNfUZF1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDSo59IzNRWHur41WY3MmrutaWcQUB0WKDrFypUNdL0=;
 b=DrSQ9WMaoU4y1hyrixxx54NicLQMb2B7Taf54Z+IuS6w/5gK8Q6ynQdabU/9yxXQxQBWibM/h0AgnYJaf2JFtvNdGTPFupPcghwNw+hHdvdXkt7YLKhIb6Yacwt6+SQXdgSmU9OpKEMHu3lUBwjetG+hiPP4C18Jtlo3Z/oVo90TDP8qAXA5qvMwvab34sY3TC/XUr2VLs5VzqTJuuObJTY9O5EKU5i/jX6VtRxXFuNkr2jk1tvaTgF1Xe1eN1wh1U3B0gJqBFudkSkAPGJ+hFl7H1MwzdZTjDQHg7DPhDZbYnQzz+REriurD7kT5worGrF5vdInL97hWRCFrbaJ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDSo59IzNRWHur41WY3MmrutaWcQUB0WKDrFypUNdL0=;
 b=fa3KGcXLtaR1Un7qmZwUpMFg7pUVBBWYBgeQTgiPXD5YVT4GxPKyLuM0e/bhxo27xVnYYQxpxQQeOJHAZfg5PwvuTOmc4ERFIb3zJVvg9t9YG04QThEMqua6jvqtu1Bhihm+NBvatgL2m7jnktgretvhq0bXH/FRiLcSB8yYZX6wuQEkyDSJzbCgeYYQni1F7IQzdIFyzWw3nWS6x2SR2jphbD5x4RFU66B6YeT8m0powT/epK1u59IiljSXbbRDzSlBT+j7M/ezeMxIjpuWYdx7lzas898lbx0QpV6cZSsJMjJTvMts4ncAvd6LR/SfKcoEd6g0EfR1KP6i7WUhTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 13:52:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:52:42 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 00/19] nova-core: run FWSEC-FRTS to perform first stage
 of GSP initialization
Date: Wed, 07 May 2025 22:52:27 +0900
Message-Id: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJtlG2gC/1WNQQ6CMBBFr0K6tqadAk1deQ/jopRBZmHRFhsN4
 e4WNBGX72fem4lFDISRHYqJBUwUafAZ1K5grrf+gpzazAwEVKKUmvshWd6FMXJTYwfG2AbBsXx
 /C9jRc22dzh8OeH/k5Pgbe4rjEF7rvySX9ZsGsUknyQVH10rnLChTq6NP1JLdu+HKlkyCn1oJu
 VUhq01ppdJSV0rpP3We5zcKeJ3x8wAAAA==
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
X-ClientProxiedBy: TYCP286CA0349.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 581eef4c-f8ba-4797-e7b2-08dd8d6e6ffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXNjcHA4bk5QUGNZWXIzZk55QUQrM09wY1JyZ3ovYnR2Si85cUF1dVpGNHo0?=
 =?utf-8?B?RkFaYUlwc0dFVnkySzhrOC8yT3ZRc2VMdUV1NVV2Z0lkNlFoS1R4TkVERm1t?=
 =?utf-8?B?OWEvYTZ1aEhCY2lyRVhwOGdvRFJoQ01RaWdoZnpLaUNHVkY4UEJmSm1nWTM2?=
 =?utf-8?B?TzhCSFY5VDdEVUFMQ0J6eE4zUE9rUEhGRFFoeWZhT2FTWW9tOU9idWNtdmYx?=
 =?utf-8?B?USttYVRPaERRMndPNUlJN3BYU1ZCZ2pmZDlaMlFYQ3dzS1Y4TmJxa1BFZUhV?=
 =?utf-8?B?ZDBnWmI5eForWHlvaXhET0JJeDNWUU01TGFJQVp4YUtGaDhITE5yZ3lHamhs?=
 =?utf-8?B?aVA1c3Y5c3c0LzMzS3dWRHRvRk5PUmpTZk1WSHFsb1RxalZZTmRzVnVIaDZL?=
 =?utf-8?B?dWlIU1ZTQjV2M2x4WmRCTTF2UlMrNWZPaldtbktoRDArZk5Ec2FObEc2TXo3?=
 =?utf-8?B?aTI0WEN3dDgyOUxCMnVJcWxyRWpXNSs5N3NtUmtHdGdTT09LK1k3VG9IQ3Zo?=
 =?utf-8?B?QWdYenNJRnNwTWNZYVpMbTJZSEJMRWtpbUhYMm9ydDlQQ3JJaXZWUDdLcnZU?=
 =?utf-8?B?ZVoydHc1Mm5FMW9VQ2JCU3l2R1R1TkhTOTl1em5BcXpYN2l5WGlQNVRNRU1C?=
 =?utf-8?B?dEJZZ0MzaG16WGJ5dTNPZXU5ZXczNVJYK0FocHFIMWhKWi9FamNUTXFLcW94?=
 =?utf-8?B?TDI4alIxTEFFR0VwM3BTenJJc3UvYW1mRm01OUxaNitDUTBaQXNxWVBGNTcz?=
 =?utf-8?B?TURFdDJTRzY3eU9vYUl4VWdJdTZqQ2pXNnhwK0FxalZGQXFtNUlCMmVZcVNv?=
 =?utf-8?B?QkpEczdHbmhTRk1SV2c4SGFwS3lUZUFadWRqTnZidHQvd1JOSklKTitubE1U?=
 =?utf-8?B?Tk0yQTRxN3YzWEtENnA2cGZmd2hOVWtSMk53WEIzelU2NlE3cmtXK2hDb01L?=
 =?utf-8?B?QWlwckVrNGxEemFpTENmdFhJZjhVZk12dEYxTVVuNzU3RE4xUC96Qkp0ZDRp?=
 =?utf-8?B?V3Zsa09NZ0JGc256TytSQk9KSHd0KzhhL0dTWlBLMjhpUzluQ2RudTBQSnQ0?=
 =?utf-8?B?Qy80T3QySThJYk1XQnFwbmI3N2xVdEJnQUVGNjQ5MEg4N1RHOW0zajg2TUJw?=
 =?utf-8?B?Z01LbW5WNUdLQncyTGpKamszU1g1YmZWV3piSTNWcmw5b1RYc21vQ28xbzlP?=
 =?utf-8?B?dEZVZ2ZPNHV1NFJPTHhDZGF2b3AxRzRZelVwVDcxR2gxREpwREdpS3M5MGtl?=
 =?utf-8?B?OXhOVVQ4RHhzTWlycUhidFdKRklVbUFUTTEvL1NXQnZtYzhzdk1tem5NMHJp?=
 =?utf-8?B?WktkUHhQZStLckxtQVgvVk9HeFE5N0VKNU1iU21kdGFHcnJCbVhIZytCdjNG?=
 =?utf-8?B?Y2pqajFzenYwQWdONDhmUUl4N1dwd3VJSGxRK0IwcXZpek85QWVOUFRmUGRQ?=
 =?utf-8?B?ZzZrSFAzRURlM1Z5aFExdDJ2QkhMUFErWFQ4V2hvbkllSFJHUkdBcUlLRzYv?=
 =?utf-8?B?cTF5bzdISHBZMnZuWHNUb3NPYk02elpPWEFjaEExVlpReStxNm41ZHBjSTE2?=
 =?utf-8?B?cHZnRzVSVnY0b0R0aVZZOWdqR3FIVkpVUzR3TEFBZ0psRzZ1MDNFZkdyaDBN?=
 =?utf-8?B?SGlsVGJ6akE1VkVlMGNRTEhnR2hKbXkvcGltZXU0Z1k5UFV6b1EvaitWODJV?=
 =?utf-8?B?OVE1OTFySDZwWFM0aTI5eUNJVkdTcEZLa1JKR1Rnd3VGKzFtVTNmMFk3MW92?=
 =?utf-8?B?NDVJVW0xU0VHclowWlJvR01EdGpHcTdPa1N0dVByS1dUYWJNcGtpclUxdzNH?=
 =?utf-8?B?a0psVUV4MGJHaVp6NkovUnVHWDJMQVB1UkZra3I4RHFDZVJwaGpxSzY2NHNo?=
 =?utf-8?B?ZDFpTVBrejF6TGFMQVZNaGtXeUV6RWRnR1Z5VnE3TGVkN0FFcXE3RFhuQ2tP?=
 =?utf-8?B?NWF0ZjFmMFdhTjZwK2dHSkp4RjlNWjRQSFRUOVVKWUh1MHYxUjdDMmpoVCti?=
 =?utf-8?Q?T3XKsw07K/SQ/DtQdsTPmaTcE4FlIA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEV4a21iNUhodWxOTjRPampWVDFaK05CUXErUlBaS2NiL2ZkcjRkQXpnSjZY?=
 =?utf-8?B?OEs5YnNncjJ0c2duWU5Ic1dZdWQ4dGV3MXE5bVVadktjbUxRR0F5UUZvZFRm?=
 =?utf-8?B?aW9DakdXRlNDTDRYWTgva1JNd3pWcjIzZ25pTCtoNkx6elB4TmdERFBRTVBm?=
 =?utf-8?B?dzJoU3ZxNGtIbXEyeHNjYUFPMnBHTEFZb0hENnA3d2lMWjhtdlNJeDJyVnl2?=
 =?utf-8?B?dWlKNlhvL1ZCQW52QTQ5dWpSWVorbjYxbldHTGZlbzM3NHh1cE9MMFFkeVNs?=
 =?utf-8?B?UE5yNlROWlQyQzFMaE5CbElLeG9YdUc5dzhYQVpCVFc5TVB6UVg5M0Zsclg1?=
 =?utf-8?B?amtYOUd0SHRGemd0VWdPMHNPb2YvaTFSdjVMNnQ4b0w4dDl0bW1uV2t0SnJY?=
 =?utf-8?B?V0RwWWxTMFl4Smh6bXY3RHhMbzJJY1pFRVBOTUl2cjZwZ2hRZm1VcUJoSERn?=
 =?utf-8?B?OFV6VExyaUNHTGhjbit4Mlk5c2E5QVcxTlcwcW83NmlJWk1Nb2RaWGZXTmhv?=
 =?utf-8?B?c2EyaS9QN3plOHFJQTgwWFZ0T3pPUlZPbCtaQXRvVG4wbEhmUkozK29TV1Nj?=
 =?utf-8?B?bklQSmhicXZtYktLWWpwaWgzeU9pVlFrZWFYMEswMS9BcEdzTmpGNk5ibWho?=
 =?utf-8?B?elUzU1pqbmY1cmZVcm5tTnNMc0RUbm96ZFoyQm5MSkV5T1JaNHBxSTk5Ty9Y?=
 =?utf-8?B?anIxN0NuK3V1L1RQeWZGc0xMVG1UWXNtOTJvdUxybnhrSzZkSlhFeHdpRnd3?=
 =?utf-8?B?WHFzbnVsbXp1WkJNS3BsNjJLb2F4WUdBZFlGWDJRTmFERDlFREVuR0Z0RUg1?=
 =?utf-8?B?WGhDL1Zic01KVEQ2VWNpMkQxd2xCK3k0cXA4T1ZDdUE4ZFR3bW5mSElZblIw?=
 =?utf-8?B?N282aVVqUXZ6VTVZVGlEYVpGbExmS1ZSV3k0Z2pUZm83UzJDRmdZSXpuYkZ6?=
 =?utf-8?B?ckdsaHdMUFZYNEthZGF6SkpQNWxjdGJ6Y1k2ZzZvbk4ySmphZzltdWNqT0hk?=
 =?utf-8?B?SlRObW91cCticVJCK2Q3RkxkQTVyYUZQNlN3RG1rVDd5V2h4SjN6NW42a3hB?=
 =?utf-8?B?c3JSUU0vOFJJcXZya2lLYzU2ME93OVRQTFZMZFJIKzNqOSsxQ3hYQmlLRVhn?=
 =?utf-8?B?NlZmVlo3TldrbllqbnN1L1lXTDduREVyMjN0emd0SEMvc2phaCs4dUhOa3Zr?=
 =?utf-8?B?ZkFHR3lRMVNFQi93dDVSVDFNM0FLRmNzeWVXZ0V3TmJ1YlNDOXMrczhJRm9C?=
 =?utf-8?B?blpML3ZRZW9Pc0xSc0lreGhPR2MzU0F6bWpoOFBVSGNXSzY2NWpxbVkxeEdn?=
 =?utf-8?B?QzJxWUIzM2wzL3JQS0dNZkhiT0RQQ0dPRitlY1ZGeVRLUWhSSDJKOHZ2ME9L?=
 =?utf-8?B?cWEvdFRDMW01WG9QNnphTW9CYjNaeUJKRnQ1QjF1WjBNaG5rMWFSZ24vWGxU?=
 =?utf-8?B?OWhFOW03TGlGSi9aY0hKS2J4OVVUTGIwTzdoWjZZZDh1aHlYM3QwTjQ0SlNY?=
 =?utf-8?B?Mks0Y2ZYNWMxYUgrbHZkM0kwNlhCSCtHTGVQd3I2ZThoR1ZiSjVMR0dHUUxi?=
 =?utf-8?B?VWJSVlhJMEx0YXY2dlVXYVBtS1RRUWdRUnY4TjNKZ1NTK0Rvbk9iaG1jRHN3?=
 =?utf-8?B?MUtwdHpoclU3MTdzOHhQV2x2RXVuZjBNcCtuTDcwVUVVdVFhSlpRTGRwYVpr?=
 =?utf-8?B?aWhDZDBCWkNRcGwxSU9TZ2M3TDZ4akVnNzN2QmFKSS9YV1NxYmo2TjNKWHpR?=
 =?utf-8?B?dk9CVk5SQ29HR0FpY2xuenJ1WC8raE5sNmo2bExiRjFuREF0bVN0cE85YmxT?=
 =?utf-8?B?VVI2Y2lkaFVEaVAyM09QRWt4eFkxTklGM2Q3V3ZzS3ltTVBkajR3ZzdwMEpu?=
 =?utf-8?B?MDN6N09BZEZqcDhmbDFwZkJvYURQUCtEaHJHZG9ZQURJTVJzZGh3ZDRlZDU4?=
 =?utf-8?B?UFNpaGpiQjF3T3hoNEFJNWVwM0xzZkQ0elJBbGVhMlA4LzcwQmdxUzJuK3ZK?=
 =?utf-8?B?dE5iVnNvT2xmNHlqeEVvMGhQbTl4R01rUVMvTmJkVTIxckVydnIwTkg3Qk9m?=
 =?utf-8?B?amRBTnU4UW12R2NRNWd1c3FrcDF0a243enJIcWJwT2lxU3JvR0JCaGxnVkNW?=
 =?utf-8?B?Lzl2YWV2TnhFS0R0YmR5cmVpU01SMmRUTjRoVjgzWFFVSnVvWVJiQ2o0ZkVW?=
 =?utf-8?Q?hxt5ejN0T1+W1eVC4B7m7kqQEsupN5CaPFtUuIl9Ibfd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 581eef4c-f8ba-4797-e7b2-08dd8d6e6ffe
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:52:42.4182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6eakS7rggWMPZBw+wJcBzUsS7h6ZkOdZbaG2CPFuIP9nk6+xlC4MFWb+Gs/xFGbH0qfSBk2FcMAN7CPomHNyaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761
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

I have respinned this series due to the introduction of
`Devres::access()` in nova-next - this addition seriously simplifies the
way we access the BAR and justifies sending a new version, although
there are also more minor changes.

While this series is still far from bringing the GPU into a state where
it can do anything useful, it sets up the basic layout of the driver
upon which we can build in order to continue with the next steps of GSP
booting, as well as supporting more chipsets.

Upon successful probe, the driver will display the range of the WPR2
region constructed by FWSEC-FRTS:

  [   95.436000] NovaCore 0000:01:00.0: WPR2: 0xffc00000-0xffce0000
  [   95.436002] NovaCore 0000:01:00.0: GPU instance built

This code is based on nova-next.

There are bits of documentation still missing, these are addressed by
Joel in his own documentation patch series [1]. I'll also double-check
and send follow-up patches if anything is still missing after that.

I have also tried to look at ways to split the patch adding falcon
support, but couldn't find any that would not be awkward. Starting
review from `falcon.rs` and going down to the HAL should be the logical
order for a smooth review.

[1] https://lore.kernel.org/rust-for-linux/20250503040802.1411285-1-joelagnelf@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v3:
- Rebased on top of latest nova-next.
- Use the new Devres::access() and remove the now unneeded with_bar!()
  macro.
- Dropped `rust: devres: allow to borrow a reference to the resource's
  Device` as it is not needed anymore.
- Fixed more erroneous uses of `ERANGE` error.
- Optimized alignment computations of the FB layout a bit.
- Link to v2: https://lore.kernel.org/r/20250501-nova-frts-v2-0-b4a137175337@nvidia.com

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
Alexandre Courbot (17):
      rust: dma: expose the count and size of CoherentAllocation
      gpu: nova-core: derive useful traits for Chipset
      gpu: nova-core: add missing GA100 definition
      gpu: nova-core: take bound device in Gpu::new
      gpu: nova-core: define registers layout using helper macro
      gpu: nova-core: fix layout of NV_PMC_BOOT_0
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
 drivers/gpu/nova-core/devinit.rs          |   38 +
 drivers/gpu/nova-core/dma.rs              |   57 ++
 drivers/gpu/nova-core/driver.rs           |    2 +-
 drivers/gpu/nova-core/falcon.rs           |  537 ++++++++++++++
 drivers/gpu/nova-core/falcon/gsp.rs       |   22 +
 drivers/gpu/nova-core/falcon/hal.rs       |   56 ++
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  120 +++
 drivers/gpu/nova-core/falcon/sec2.rs      |    8 +
 drivers/gpu/nova-core/firmware.rs         |  105 ++-
 drivers/gpu/nova-core/firmware/fwsec.rs   |  359 +++++++++
 drivers/gpu/nova-core/gpu.rs              |  223 ++++--
 drivers/gpu/nova-core/gsp.rs              |    3 +
 drivers/gpu/nova-core/gsp/fb.rs           |  108 +++
 drivers/gpu/nova-core/nova_core.rs        |    5 +
 drivers/gpu/nova-core/regs.rs             |  259 +++++--
 drivers/gpu/nova-core/regs/macros.rs      |  380 ++++++++++
 drivers/gpu/nova-core/util.rs             |   29 +
 drivers/gpu/nova-core/vbios.rs            | 1144 +++++++++++++++++++++++++++++
 rust/kernel/dma.rs                        |   14 +
 rust/kernel/error.rs                      |    1 +
 rust/kernel/lib.rs                        |    1 +
 rust/kernel/num.rs                        |   44 ++
 23 files changed, 3427 insertions(+), 94 deletions(-)
---
base-commit: b75a99e1077b12c5631fef7ac36970a89f6021f7
change-id: 20250417-nova-frts-96ef299abe2c

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

