Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031E0B4FEBC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8040010E76F;
	Tue,  9 Sep 2025 14:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZNqy8T87";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F1610E73B;
 Tue,  9 Sep 2025 14:06:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0d35Fio/+nqmyYe4JrkWHfSq0oXdnpSnhtsdLe462a76QgQTM4qSc8ZTNAe27rDhK+EtlexcefyKuqj+VluZLF/VWPkoHfh27ROcSV1b95tpVCnTfb7eDVnCxbBYBsPdWAy9E5C88BbbzthgNxJNtxh678IDTMM16gix6gYwFpQn+7GF0eHxt3zc4tmRYNNv+oQuSBNScyntFN8XjxhbGzqQWDERpaE+gvfbgRiNv07kurbdVNEmoAD3ZWHfBmUis5OxXl+pPjtZsMQftvMJLlq2a6K8Kndlo/czL68g79wL23OhjaBMZOTBs7hjQBtOUqN19jVHSDlccUhLETtaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prtzw5axUtnYpGhZvh5/BmBHtQKw4yRZyQcSds9LZdI=;
 b=uxdxkmBmF+AsCBYO18UXBvKaMPWqcwtr9Q4O23tuf6TZUY9gnnv/Ls+t9IC31DMgCQj82k8qH9w91qGfo3EDmu62l6iFQmA/uojT1CqZibry2s5Nldu3APJ9nQy+YfQKvhJaXQ9dFcgAHPn0drK8jjNPXPvC0stagj23keKyuNch1s1gSYth9ZIIEZJUOHnPvxU7ZfBoW1R2i1XHe6Arv3nlzwqfnDS3pPQDQeKqW7DrH+UJsrkCITXvERhdndUsaHMXyXRifsiYCOVXK49otp/ybcA/w/6AwUqJFzTQpM0buV57FJBLbug7ztL7rEPt+2ClUlB6q155P1WOLp03QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prtzw5axUtnYpGhZvh5/BmBHtQKw4yRZyQcSds9LZdI=;
 b=ZNqy8T871wp4y8O3TySVQ5rX8sbMxVtqmdH4971uBjK8yKsgq2GMOiJ7pTIQ3hPXlIQ9nkRY7D2UyJb/wJsRoiNsxpZVQ3FR7utM/T2lWZtJ6ZzrBWOHlsZ9Dgb/ImIl2CfiDk0V2oZ3hbiZMIH9fulPEsyYZyxD9xztycyZDyKFnGZc4vBpBc39Ej6btNW/UcOTshTqIN/LRS4gkZEccSeJBWyLE9zGvZlbEaheMn78VnxbIefsSvcoP40LkSCHgBF4ZuGvitt1cWKnZuGsyuBdi3nDpIWhvFwxcdbO31HoU+UcGD90vflXt0CATRU+fNvDGbnULzeZGXvrxa2+1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7978.namprd12.prod.outlook.com (2603:10b6:806:34b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 14:06:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 14:06:47 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v4 00/11] gpu: nova-core: process and prepare more
 firmwares to boot GSP
Date: Tue, 09 Sep 2025 23:06:36 +0900
Message-Id: <20250909-nova_firmware-v4-0-4dcb433d5fee@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG00wGgC/3WQ204DIRRFf2XCszSHw2VgYkz/wxhDZ6ASO4xCi
 5qm/y6lD1YbHzfJ2qx9jiS7FFwmQ3ckyZWQwxJrEHcdGV9s3DoappoJAkrQiDQuxT77kOYPmxx
 14P1GGNxYLkll3pLz4bP1PT5dcnLvh1q7vzySjc2Ojss8h/3QOZQaBONWc6XBq94YEHZCjyOzV
 hlldK+EMufq2eVsm8/Q3TcdA5IJANGvOEdphKSM7pacQ1y/uhTdbrWk7QO5njJ0jVQINB5makS
 Nmo2AYz8USc7KLyHvl/TVLlJYc/5nfGEUqPdScV7NhYJ1LGEKdlXntaqC17j6i2PFDZdKoUTvu
 L3B+Q9u4OZ3XnGptBSTGSU3+hd+Op2+AQHWfB7cAQAA
X-Change-ID: 20250822-nova_firmware-e0ffb492ba35
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0273.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: edb2c14c-8af1-4f5d-b49b-08ddefaa1d20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0daRmJyRTlxcXVqNkloRjRjeWU3LzNPWi9GQ00rWmdRY2VqRlJZcHV0QjZ0?=
 =?utf-8?B?Ym5GdGhqTm1tcS95SEw0bk11YUlhUnUwc0lLYjJqWnBOKzgzRTg2VDhOKzZl?=
 =?utf-8?B?UDNJNCttR2VxMzhFc1hYdnZ2MUVGckp2U3d6K0VNKytWV1phK0NNTkpBbnEx?=
 =?utf-8?B?S3hFYWJzbG1mNUJNWVhnL1A1bjFkUEpEdEQyWkNkZUp6K3YxSlVFSW9xNldw?=
 =?utf-8?B?cGFUZnYyVjVPdVVyYW8zb3hyOVQ4SDFGdkw2bHVCRFJ1S3U4b09DTXY2NStn?=
 =?utf-8?B?b0hzcWRxbC9Fbk5TelYxL0p0d3U3RUIvTExuZjQwMHVqYjBURmVMZE1Va29q?=
 =?utf-8?B?UngrMXVFcnRwSHVuakNTOHdJcFBZNGovZXhIVGtLaC9RdFVPZGRYbDRuSXUr?=
 =?utf-8?B?akR5UUl0WUtuVHl5Q0UrM1IxS3FZL3Rpbm9vNXBQUGR5VEhvVWZpdllFa1VU?=
 =?utf-8?B?S0NLZkQzbWtWTFkwY0cxRjRQalVyTWIxMUNTRGcrSEMrbHd0MVRuekJ1OVhW?=
 =?utf-8?B?c3hUQ3ZNbk5mK0R2OVdHRmZNTHhhaUxWdTl0NDc4L2Z1TWZGNEtxWk5UMCth?=
 =?utf-8?B?OVlqMGRYbElwYVdJV0dIMjd3UjR0RkZZanhRZjVLV0NiVnZZMytlWk1kbURV?=
 =?utf-8?B?eEMxRCtKc2w4bkV4QlU4ZU9YV0ZIandWaTVuSUQyaWlZOWY3L0JnWUJHbTBG?=
 =?utf-8?B?RXh0cDdqQUFFUzBQYkd2ZFg1N0RxS2tBUk0rODl6SW1mL3pabEF6TnpMZGNG?=
 =?utf-8?B?aDZIZWZhbk9BbnoyRnprMW92WW9ackhIUVlPQ1A1R3k4YjJuWGt2REFZTkgw?=
 =?utf-8?B?VzgvOWtscmtLMkJjdTNDSnpTMk9XSUkwNVZNZ3hmaHh1NVkvS1ZncTlYZWF3?=
 =?utf-8?B?SGZ3bEJQMHExeFNIeWdxdWFFVGU5SUVXWld4dncyaUpzSHlvN2VBekJLKzl5?=
 =?utf-8?B?YXVjV003aS9KUHdId1AzVGN5bWkvM29BTUlkZWhzZ285Mk5OYzM0RkFwdFJU?=
 =?utf-8?B?ZFNDVjRmZlMrV3k2bHc5MzdQMHNydnBOK3lZY1lWTnlLaWN4UURpTGYyMzBY?=
 =?utf-8?B?UVNGZnVWMlVWdnNVSXIyMkwzN3Ztc2g5THhlWkIzZVE5Nk5Vd1BtQmg5d3g5?=
 =?utf-8?B?RWwyZHFQZFNucUZOeDRiakZlczdSeFc1aEU5Sy9NU2xnMW9idXJ6WFpZcm44?=
 =?utf-8?B?OVhkUGdUajExMzRRRkV0c0JtUHk0S014L2c4UWUrd2xBQ0RXcjQ1QjFYSzBz?=
 =?utf-8?B?RTJUbEVySVFiQzBzQjFlTm5PSUgybmg1REVKNlp4SHNwaGFZUVlSdzRRUFBu?=
 =?utf-8?B?ajhCcW1Fb1dQSG5lWGplN0FHZk9Sc3kzVkwyRjl2RDM0ZldPTkRLYS9IcGky?=
 =?utf-8?B?MUhsdXgwSXptZ3BmcDd3K0JhMmwxWVh0TnJpK0tkd2dPcFhXangrdUF4dnYv?=
 =?utf-8?B?SWFlWGR1dnlNbzRIdURkUFFQQVZaRlZrMVo5L1lrUmlkQmV3eTNidjlUUDAx?=
 =?utf-8?B?N2RtQW9PNmQ3L0NwL1Qzdkl0RUVQb1E2akd6UWs0cU1QdmIxMUphVCt0ZWhJ?=
 =?utf-8?B?YjRtWUw4VHBEUlVCSnN3dkhCSVo3M1pGQlVDZHF6YVZQZkZ2V0pZdHZER3hq?=
 =?utf-8?B?WnVZdi9Zb1RSMEdhQ3QydVJHeWRyb0pTR0VLeTJQWUQvdzVMOUNJNHVDNXRF?=
 =?utf-8?B?TC9VV3EwcVNVSlB6Rmp4YWxrdXBKWlZZTW9Sb09KTHYzaEsySmlZYklzLytI?=
 =?utf-8?B?MDZlZ3NEVmJWRGo4OXlabnh2YlVxOEgrdUFUMWhnYXQrdHRKQndxMnN5eStn?=
 =?utf-8?B?cXBNRUxjQ01DQlZvMlRVRnZtSkxxWjRCT25lZ255c0tNU0ZKQzR4N1lwMEVF?=
 =?utf-8?B?Qm5va1ZkM1NoSkd5MlIrWjBaaGJsQm1wZVYybER1bThXcmpzakt3V21SZDV1?=
 =?utf-8?B?ZXp0U0FJZkdTZHd2MkNEL1JBU1ZSNmtOUm0rVVp2S3NtUnB0VE9mYVhsUFBP?=
 =?utf-8?B?eG5LWjk2djN3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG1xamZtWDJBQ3lxVkpUdGlLcXgzNnFnZkNrUC81emFjenBqdEVyaDA0NGlw?=
 =?utf-8?B?Zlk4a2c5Uk1nclpsYVJzRGFqUVo3KytmZi9pb21keWhZZlZqbHlRWnp2NWdq?=
 =?utf-8?B?d1JxZHNUZTFKaFNUajRPdkNHWFBzWW01S3lVRTVUOStHVzNQa3RiV3FyNW1p?=
 =?utf-8?B?U2gwTlNxUEhHVytpTytyZENQc0tEVUJhenRJNndHOGRQd2MxRjlIYmZScTJH?=
 =?utf-8?B?MGEzYjFiVm5OelhTYUdZdEVvQ3pTaFlJVlpIQWdSbnZFYWNaL3VRWWRSV2JG?=
 =?utf-8?B?T1FxeEk3MjRxOEdaUEFIbVJ1RzhtMUxwWU1ydnMxcGdTbVVBZjJGK3M1L0Jy?=
 =?utf-8?B?S0M1b3JrQlFlbFcza3N5bjhON2V2QUNHd0x6NGx6NWllM05UNUNGYWtVcUJW?=
 =?utf-8?B?MGVHUk1yTkRQWmkySEdYMDFVeWU2Tm15UGhOZGxKdkhkNGYwaEVQNTBxb0lD?=
 =?utf-8?B?TGVyN080QWtDU3YvTzJwTWFmcWw2TW5Yb0RDQkxUZUZZNnptcGlOY3BIZGpU?=
 =?utf-8?B?bU1xTm1aWFh3OFMzY1JaSC9jd1VPTDVsNkUxeUdsNHhDTnhPZy9VT21EeFR0?=
 =?utf-8?B?SUZxQ3IyZDBJSzYwRDl4NHoyL1F3WXFlRjd4NVNFNEVnWHpiem9BeElFYmZz?=
 =?utf-8?B?UC8zNzdXRm1aWXJOeEJaMnFKVktDSmhYbFdFNkhVMU90Q0RnWHJBTXk1cVdh?=
 =?utf-8?B?WTNuNXFMYXFKWjhyUDdIMDMxbnlrMlIxSG9Oc1pGK2pQTlFkc3lZTW9LSG5I?=
 =?utf-8?B?bGIwRzlScFNhbitHY25vYVFjVFdyK1RjcFRBS205Ny9ZZ3RzaUcrd2diV0dz?=
 =?utf-8?B?dkNKNERYMWZWUmJmV09MZnN6MWJJQmNQQUZkV0xmZkxiT2NucUdEUFlwdUlU?=
 =?utf-8?B?Vks2QnJ0a0ZnbUtOaGI4aHNmZGgya3kvR2ZIaDFETjFFZUxCL3F2YmRnWXJi?=
 =?utf-8?B?TzIxd2JHRlBDZ3hnM1RSdGw2SXlnZ2N0VkQ4ZTE0OGgyL0RKdUlhd3I1SGFV?=
 =?utf-8?B?cDRiTjVFWlpORlZ5eFZ5S1N2RnJtRTdSWWZGWVBtVENUZnRkQk04NTFpZnNF?=
 =?utf-8?B?eVByWHdIN3JUaU9JZkYrQjVsQmNXaHVHd3k4ZlRDcFZydDRuaVJwa0tEUFJa?=
 =?utf-8?B?NHRaeUE5czArMmpPaUpkTDJDSnJrcWZRdnhpZmRtMUtPeGsrcDNpOG1IeW9Z?=
 =?utf-8?B?L1BKWG9SSmZTZU80TjRqMjdsZmpBWmhqQU1oejVPR3VRRVNOeWZXWTUzV08w?=
 =?utf-8?B?VXNLS1BVT2RVeVhaR216MnpFL2lYL2R2Qkg0WmlBNzAveUFxUlg5cXhkaURz?=
 =?utf-8?B?RE9VZzJwTjl6dXpHbVFVWHQ1ZlV2Z2wva0lsMlhLK1IvSkFWeDFuRjFJeWpV?=
 =?utf-8?B?Uks1Q2daSCtiZENWN2tQZGVybnZuaDNuVnRIL0MrMEkrdlIxMFVrZGxFNzhv?=
 =?utf-8?B?QVJLSUpsVFhGcXcreHpXS1dvbDFkMzE4UFk4cnVBQnp4N25ZK1FDMmREZ29V?=
 =?utf-8?B?bE1kUmJVRnQ1QTE0QnlyaDdWeVZwWC8rNFdlR285Q1dEUnZxcGtGd1AxTm04?=
 =?utf-8?B?cHpQR1VIYUEzOFlSa01oaVVnem1GeGtWVWtZcExqMjVxb1pORVBObVFKYm1n?=
 =?utf-8?B?empMQ0ovTHV5M041d0VWaHoyY1lEWXFiWnhyNjA1UlJQNDRrYjB1SHlNVThB?=
 =?utf-8?B?bTNMNHhLaDJVVzhVZlphNFdGeUNPcTh6ZFk3WUYyWkJtM05uSjU4VS91SEZ0?=
 =?utf-8?B?UnJQd05vZUc2SzFpK25uYkMrbmNWM2dNYVZhTGFiciszblE2QUVGNXZYRDRp?=
 =?utf-8?B?OUtxdEpVeUdIaVVNVXhWZzlnMFBHKzhhckN3OTVSbHJVdWZGWWxySnpiRjdn?=
 =?utf-8?B?b0xteGdPU0hJV2xDWnRJR1lFTndreit6azYybDZObW4yeGNhSmdjMnpPZEQz?=
 =?utf-8?B?ZG44V1dxVzE5dGdBRVJPdDd5eE10VGMxM2VxeTZ4UldKVFViUjVIWnBYaDhu?=
 =?utf-8?B?Rjl6eWRENW0zaUQwMVhMazVSSEljbkdDWlV3RkRFY0JMdllXZi8zb01OMGVn?=
 =?utf-8?B?eFVib3ZockVHUWlMZy9rZjVUWTBpZTRwWkQ0eHlROHJjODFXa3NBVkVWUGty?=
 =?utf-8?B?SVlwbFlMMElmd05UZG1Xa2RuVkladXlLRGVrSDlXcUhWMTNPWnVxY0Y4T3FP?=
 =?utf-8?Q?T9Tpb+vuJXMDnjNnBqn1LnOplbyjAarBKFZrD7FV36GN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edb2c14c-8af1-4f5d-b49b-08ddefaa1d20
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 14:06:47.2815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZlr0NmmmXyPi146o9bBLPJJlyv/y/RS9ssW4mTCbCsfyupeOEtik5bRBmiqR0LOnTTcRxpPc1+oijOmuo8bOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7978
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

This series makes more progress on the GSP boot process for Ampere GPUs.

At the end of the previous series [1], we were left with a WPR memory
region created by the FRTS firmware, but still far from the GSP running.
This series brings us closer to that goal by preparing 2 new firmware
packages:

* The Booter firmware, which the driver loads and runs on the SEC2
  falcon;
* The GSP bootloader, which is loaded by Booter onto the GSP RISC-V
  core;
* The GSP firmware itself, which is verified and loaded by the GSP
  bootloader.

There 3 firmwares are involved in a rather complex dance that is made
necessary by limitations related to the level of privilege required to
load code onto the GSP (doing so requires a Heavy Secured signed
firmware, which is the role fulfilled by Booter).

The first 5 patches do some cleanup and preparatory work for the
remainder of the series. Notably, the GSP boot is moved to a new method
of `Gpu` to get ready for the additional steps that will be added to it.
We also simplify chipset name generation a bit and move the code
requesting a firmware file into a dedicated function in prevision of the
removal of the `Firmware` structure.

Patch 6 parses the Booter firmware file, queries the hardware for the
right signature to use, and patch it into the firmware blob. This makes
Booter ready to load and run.

Patches 7 and 8 prepare the GSP firmware and its bootloader, and keep
them into a single structure as they are closely related.

Patches 9 and 10 switch to the 570.144 firmware and introduce the layout
for its bindings. The raw bindings are stored in a private module, and
abstracted by the parent module as needed. This allows consumer
modules to access a safer/nicer form of the bindings than the raw one,
and also makes it easier to switch to a different (and potentially
incompatible) firmware version in the future.

570.144 has been picked because it is the latest firmware currently in
linux-firmware, but as development progresses the plan is to switch to a
newer one that is designed with the constraint of upstream in mind. So
support for 570.144 will be dropped in the future. Support for multiple
firmware versions is not considered at the moment: there is no immediate
need for it as the driver is still unstable, and we can think about this
point once we approach stability (and have better visibility about the
shape of the firmware at that point).

The last patch introduces the first bindings and uses them to compute
more framebuffer layout information needed for booting the GSP. A
separate patch series will pick up from there to use this information
and finally run these firmware blobs.

The base of this series is today's drm-rust-next, with a couple more
dependencies required:

- The Alignment series [2],
- The pin-init patch allowing references to previously initialized
  fields [3],
- The following diff to make the aforementioned pin-init patch build:

--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -138,7 +138,6 @@ pub fn new<'a, E>(

         try_pin_init!(&this in Self {
             dev: dev.into(),
-            callback,
             // INVARIANT: `inner` is properly initialized.
             inner <- {
                 // SAFETY: `this` is a valid pointer to uninitialized memory.
@@ -160,6 +159,7 @@ pub fn new<'a, E>(
                     data <- Revocable::new(data),
                 }))
             },
+            callback,
         })
     }

A tree with all these dependencies and the patches of this series is
available at [4].

[1] https://lore.kernel.org/rust-for-linux/20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com/
[2] https://lore.kernel.org/rust-for-linux/20250908-num-v5-0-c0f2f681ea96@nvidia.com/
[3] https://lore.kernel.org/rust-for-linux/20250905140047.3325945-1-lossin@kernel.org/
[4] https://github.com/Gnurou/linux/tree/b4/nova_firmware

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v4:
- Rebase on top of latest Alignment series.
- Make use of pin-init references to initialized fields.
- Remove all uses of `unsafe` except for `FromBytes` and `AsBytes`
  implementations.
- Keep the GSP placeholder inside the `Gpu` struct.
- Move GSP firmware bindings under the `gsp` module.
- Get the firmware-specific information from the bindings instead of a
  HAL.
- Link to v3: https://lore.kernel.org/r/20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com

Changes in v3:
- Move the GSP boot process out of the Gpu constructor.
- Get rid of the `Firmware` struct and discard loaded firmware blobs
  after the GSP is booted.
- Consolidate the GSP firmware, bootloader and signatures into a single
  type.
- Make firmware bindings completely opaque to the driver.
- Improve firmware abstractions related to framebuffer carveout.
- Improve comments and naming throughout the series. (thanks John!)
- Use alias for bindings module in `nvfw` to avoid repeated version
  numbers everywhere. (thanks John!)
- Fix inconsistency in naming of members of Booter header. (thanks
  Timur!)
- Link to v2: https://lore.kernel.org/r/20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com

Changes in v2:
- Add some GSP bindings and use them to compute more FB layout info
  needed to boot GSP,
- Use PinInit in GspFirmware to avoid several heap allocations,
- Rename `bootloader` to `gsp_bootloader` in `Firmware` to avoid
  confusion with the future Turing falcon bootloader,
- Link to v1: https://lore.kernel.org/r/20250822-nova_firmware-v1-0-ff5633679460@nvidia.com

---
Alexandre Courbot (10):
      gpu: nova-core: require `Send` on `FalconEngine` and `FalconHal`
      gpu: nova-core: move GSP boot code to a dedicated method
      gpu: nova-core: add Chipset::name() method
      gpu: nova-core: firmware: move firmware request code into a function
      gpu: nova-core: firmware: add support for common firmware header
      gpu: nova-core: firmware: process Booter and patch its signature
      gpu: nova-core: firmware: process and prepare the GSP firmware
      gpu: nova-core: firmware: process the GSP bootloader
      gpu: nova-core: firmware: use 570.144 firmware
      gpu: nova-core: compute layout of more framebuffer regions required for GSP

Alistair Popple (1):
      gpu: nova-core: Add base files for r570.144 firmware bindings

 Documentation/gpu/nova/core/todo.rst              |  17 -
 drivers/gpu/nova-core/falcon.rs                   |   6 +-
 drivers/gpu/nova-core/falcon/hal.rs               |   2 +-
 drivers/gpu/nova-core/fb.rs                       |  65 +++-
 drivers/gpu/nova-core/firmware.rs                 | 107 ++++--
 drivers/gpu/nova-core/firmware/booter.rs          | 375 ++++++++++++++++++++++
 drivers/gpu/nova-core/firmware/gsp.rs             | 239 ++++++++++++++
 drivers/gpu/nova-core/firmware/riscv.rs           |  89 +++++
 drivers/gpu/nova-core/gpu.rs                      |  93 ++++--
 drivers/gpu/nova-core/gsp.rs                      |  11 +
 drivers/gpu/nova-core/gsp/fw.rs                   | 101 ++++++
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |  28 ++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 126 ++++++++
 drivers/gpu/nova-core/nova_core.rs                |   1 +
 drivers/gpu/nova-core/util.rs                     |  20 --
 15 files changed, 1184 insertions(+), 96 deletions(-)
---
base-commit: e2580413a83680f679904ad2f2c1aa6969876469
change-id: 20250822-nova_firmware-e0ffb492ba35
prerequisite-message-id: <20250905140047.3325945-1-lossin@kernel.org>
prerequisite-patch-id: 32113c3a3ca8ccf16e2ed272303d9abbc4300ae3
prerequisite-change-id: 20250620-num-9420281c02c7:v5
prerequisite-patch-id: 50077433250cad1cf60eb8f85c78e532ac91852e
prerequisite-patch-id: 021a41cd35f09790ec383521ecc9b4c167868732
prerequisite-patch-id: a1ec5698a198d4aad45432b50d42f401e3db6452
prerequisite-patch-id: 8565b054c432bcc9a3a0d0121a934c74ef36d535
prerequisite-patch-id: 19d008deabb88beb441d2398f120ecb426fbdb43
prerequisite-patch-id: 3bc0d2be065a900d224ff8c1bc4450abfe9eb2cc
prerequisite-patch-id: 5b4eb0f71fa2ccf662594819fa79fd932f4f164f
prerequisite-patch-id: 9058ca08cd149444b5f910e4bb4494a890d1a733
prerequisite-patch-id: 8804806f7cc605feddded0804eec8b8362d7b965
prerequisite-patch-id: f999cabde51824432a1bf60817518d1ce189eb76
prerequisite-patch-id: 49e15538e142f2e7dd4f1ba0cf2fd891bd265d36
prerequisite-patch-id: 2ecf9b1e26b5203065bfac4ccf74301b3bb4fbe6
prerequisite-patch-id: 1af6ec7c2ce8503fe476985f59949dcd150ee6bf
prerequisite-patch-id: ac72e72b3affece504bff76b60b88769ff200a2f
prerequisite-patch-id: 7dc0a6da8c9727d27250cf730f8aaf6dd8b3d8c7
prerequisite-patch-id: 31a0a2469de9ac965186098072753dcc749b40fe
prerequisite-patch-id: 7e6d1fc7cf910decf481d135a19b0add38da2b2a
prerequisite-patch-id: c72ab11e9346de71eabfe0e6466636d5ab15a5ba
prerequisite-patch-id: 3f236fdea8c4b33620d0f863fea573b46ab0ded6
prerequisite-patch-id: a8ab42d0c9c3c837bb4cacb02cef585ef163a27e
prerequisite-patch-id: 930a1f26364ed67e0d6b85c96251028fda43c80a
prerequisite-patch-id: f1bc1fd46145a66235ab7475463584e1803882a3
prerequisite-patch-id: 4a2fd7bd8d13dc2feaf68e0dc681546ce2ab3e40
prerequisite-patch-id: 2da333d93c188016ad87c5ae882a4c1f669d3819
prerequisite-patch-id: dd0df8d299dc0615a88cc0019f38bc09cee31ed7
prerequisite-patch-id: 795530b48c8a232f5221846ad96696fe60f24db3
prerequisite-patch-id: 3f1cb6654d6d4281c0fac3310b156a7d3ae9c641
prerequisite-patch-id: a82ca85da78fcd6ecb33de2fbe90a029f6232e50
prerequisite-patch-id: dd4880d4228c175486a7313459a6fba6d8e1f6ed
prerequisite-patch-id: a05c9aacdcd29aa789f755f98dc8bd8588f0393a
prerequisite-patch-id: b0be3d658a177f73a0a666fc4441829445681b2a
prerequisite-patch-id: 0e1b1f9a665317ff569a37df6ff49cd1880b04f8
prerequisite-patch-id: 178b864e6d1b88ee299dcc05d1a7a4c89ec7ed51
prerequisite-patch-id: 8e2eeaa55f11f485bac082243c7d1f3b3d6efe54
prerequisite-patch-id: 62fa6de7d3ae99dc54c092087bd716e6749545fd
prerequisite-patch-id: 3d14d56ca93b0831837aa26b802100a250adeac6
prerequisite-patch-id: 7a12f4b0e7588874ce589b41b70671dc261b9468
prerequisite-patch-id: c44763ec35c4e4431e769df088b98424cbddf7df
prerequisite-patch-id: a9e008c179b1c2fbe76654a191e5018880383d49
prerequisite-patch-id: 1e9ce500ce25188c575be608cd39e15a59836f83
prerequisite-patch-id: 39ca3a210a6c365434924c07a0c98a074eb73b97
prerequisite-patch-id: a747e05834cdb8b8f727e1f7c8b110c636cadab8
prerequisite-patch-id: 24833689bdecd3fc7a604e13bfe203ccd2fca6f0
prerequisite-patch-id: 107d1766d92729e84241f359d4763adb380fb566
prerequisite-patch-id: ac3060c99744a78b608b865d344ef2ef4d929071
prerequisite-patch-id: 1739e6a78e50414134dafb772ca76b7db40900f1

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

