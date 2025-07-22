Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3387B0D9D1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 14:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9323E10E674;
	Tue, 22 Jul 2025 12:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LDqY5Rqa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B969510E674;
 Tue, 22 Jul 2025 12:38:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ekw7rxGDnMtAO1RJgI8f2G23CtxKElq4FnCOE/53GbCLYA7aAKNDSgfJOt/SzAIUjJpNe/2qlDALSzd3HNyNlWlw2vGiygOahrezuMbSVmpbrghvF2b7r0ZrUHY+BstLKolk/c0UOGKFgAfHW0FcSqegIVlNasCy1w9CLlX4Nr4R50EU9LVUfC6OyuI7nStLmkGUcvHAxaQsI8kUgXR44lMwlvqAVN32fRTrbqMsGrS1I/dzMtx77TqSeTN49YgvyBhjzr4WVcN4jVg2dBQbmcGhIwDdEBSqLOpObFG+kBQnfSBU6CI8q8DuR0zKRR0sUDEMt8Sx/5T2yhoK4elJNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fz3A5y0tEAd/KXpCG8fnQ48uXo6ojUbBAIlWqnbnMas=;
 b=sg+UAygoEDkubvUluzCSc7DpROStpLrvF9Fgi77ukx5XWNzvTIf609WehSi166WG6O/OfuE0Uwsx3StopnjepDdpvsGIe/0wI6XbRHvL9qCSKgV7TgydFSFu1G3vMc/8RxIqqazUQutvYu9ewXCNWehNe/0dI5S0rZAtCTZquzACShDH+hY77vjT6FjW9GIidSID14cgODofMxJ8RfgoT5NRCBunnxzWQecJmJ20NUoqy7325RUZ6Vqw1qaavd4/3m0Kmh6FH/kBcOD3qoShWqFnQfkvandt0AB8mAc/PtW52dzUO7zHvQzApEGmWfdRyze6qICCWmYdhFqPNyW/QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fz3A5y0tEAd/KXpCG8fnQ48uXo6ojUbBAIlWqnbnMas=;
 b=LDqY5Rqa0zMiB1h8GEAL6m2V4cWTcrgtfWHiWxgEfBEvURiQhyxIRhTrunHle3hppkYL7sdaeD/NO6gPFCEFVhO6XKxtg4zgohitvsCUAnn1VqGS2LNrJyyboxNQWBcOLB/sCN7mK2rqhczU+Eetvgr0EH9mym2RNMTH8nqOZf51ed2GGKne8p3ZnTzeZmOI5GPfYMoopEiTtKNK0i3b5XQa2gnaOmikNarRtMqcM/f7KNQYCYU4oW0dXHeQ+agRnRRFPrMNqTGgLtjBIeaXKOA+IuHZ5W5Wbwu5T+rpuKZImqhM0iIUJ3b7BFWEYq7PD/EZfQZKbyeJHxM6YHGzog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6463.namprd12.prod.outlook.com (2603:10b6:8:c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 12:38:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Tue, 22 Jul 2025
 12:38:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Jul 2025 21:38:17 +0900
Message-Id: <DBIL8PE070LS.2W4KNXL5H4JS9@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Beata Michalska"
 <beata.michalska@arm.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 02/19] gpu: nova-core: register: fix typo
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Boqun Feng" <boqun.feng@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-2-7b6a762aa1cd@nvidia.com>
 <aHqa3HVUjIC7zHAr@tardis.local>
In-Reply-To: <aHqa3HVUjIC7zHAr@tardis.local>
X-ClientProxiedBy: TY4PR01CA0022.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: 6549b182-70bb-4e47-5dbb-08ddc91ca423
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTdHM3RzOURiYXdvSjF3WDdlWUZMWDdvbmIxdXdzd3BvYkxMRThJMFY1MVhq?=
 =?utf-8?B?bERUbHA1MG9IUmhEMjVpM3FyTlBvbDVKYVJUa3gwTGVuc3h4cUdBbmhHZXBM?=
 =?utf-8?B?Y1dPeFpCVEYvODd2blVJb3dwSzdyQUVmWER1VHcxKzlsMXJqSmdENFVGeGMw?=
 =?utf-8?B?K1pKSSt4YWo5ZXF4QnhJWG9TaVFJM0NYeXRzd2dJa0wyUkxVVnIrTkJxNVN6?=
 =?utf-8?B?R1ZmWmhFTEVHMkdJSU1pcjdWbm5LQ0tvMXV2TFFpWHEvMGN4MVFDSzI3WHc4?=
 =?utf-8?B?R0Erdm5JTkZZOGhPTWJtWTRnRHV1NzhYSmpJdlhBNk96dUF4bzVITUNEcVpa?=
 =?utf-8?B?TUo3MDMrbTB1U1JZVXdZMlgvbXA1MnBYVmJTaWdsVG11WjdJaW9UaTBwYXgx?=
 =?utf-8?B?aHA4NjJ0dlJPZkFtZiszWDBvT0Y5eW9Ddzh5bWc5WDhWQjQwZ1Fyd3BIVEVG?=
 =?utf-8?B?YlcwWHNlRHJldHJtR0xFeEw4R0p5cUYrRnZKajJFYm16bSttUEUwcUhJY1px?=
 =?utf-8?B?eVZPbmd2dmR3QUduQWxGeGdjVnJ0MGdyS3VuRm9nZWVkYlBZcjUwdG9DdE54?=
 =?utf-8?B?dFV5Q2tQTnY1bTVVcllGZjhCOFpFdFZwTTlCNFdDcUphdmhjTFNsSXhjMlVR?=
 =?utf-8?B?Zm1CVnp1cllEVUVLWHIwZEVxOEZGVHVWOGZNNlFJMVdqaTZTR0R6VmN3T1BT?=
 =?utf-8?B?RkVuMC9ybXlwMExsZ01RK1V5ZFFibFZieHB1ZjZZZDROeDlYVmwyYVhQUVBP?=
 =?utf-8?B?aXFIYXowSTZZYXIxb0d3K3p6MW5iN0k2a2hHSHZXU2J6TVdJODRlSW9qU21n?=
 =?utf-8?B?TnhmZzZUQnlENFU1SHJHUkZuaHo2K0lEV2VKNSt6bG9BS2FWTEJUc3JoK2M5?=
 =?utf-8?B?VDZQQjdyZ0tCUnc3L0YySWdjUFhFMHorWk9PR0J5d010SVpsNmFwMHZEcjJw?=
 =?utf-8?B?Y1N2amxFcEl1c1lpMUtSYXJXYU00bis3TUVuSFBjZmVhNytucXpzUlJCZ0ZK?=
 =?utf-8?B?VVh3dlROaHVUcGJYZlhmTUdWczBBR3VTMmwzbWFyaEZHamJRc1I2czEyMUZB?=
 =?utf-8?B?ZUVNbmNkZ29na0VJQlB6eU01dmNZL0NVdHNVVVVhQmllcE45N29jZjEzMktr?=
 =?utf-8?B?clhPbHJkWitZTEZLK2pwRkYrUmt5QVIrRmIzYmV6a1U2WFpEN1Ezbk90TGlx?=
 =?utf-8?B?YnQyZTNJMTYvazdiQ2NUL1FSVEhpdmZIeHI0REo5UWJXREEwWnRGVkRhTk5T?=
 =?utf-8?B?T1Vhdm5NbXMzOVRQVHZGR1JyKzVrY0V2RnlraGVtNnVJcmdmRzZOdkRwYTEv?=
 =?utf-8?B?VXNZVC8zUjVIWTRVdkYwNS9Zd3ZtWStGRWFYRDdBYWQreFdkSEMyNkZrNjlL?=
 =?utf-8?B?SmlrUHdOYkRMQWxJUWlsa1VPa2VQRktKTSs4SFIwalFGWkxYdkJ3S1Z1RGkx?=
 =?utf-8?B?SFRWR0lDSVdhRGR1OU05WW83c29sanJpTWI5cGtxNlI2ZlR2enNXYkJwbXA2?=
 =?utf-8?B?dzFqQjJ2K0ozUGIzV0E3Q0liWXpwNzdFRUU0Mkx5Z0xybjBvNTBVTzVUYnN2?=
 =?utf-8?B?MjYrQVB0R08xd3pUWEplNlFCTnFxek45MlJhZ0paWkdFalVtcEN0V040WC83?=
 =?utf-8?B?cWxHdGRURXZWN05tSWJmZ2JKQ3N6MzNJQVFtWG1tMFFmRm5RbXJ6NjRZMExM?=
 =?utf-8?B?aW9pejBhMTQwOWNQTW11aW5MQjRaMU5HYUJGNm00OWpOTEk5ZncvUWFCME9Q?=
 =?utf-8?B?QVgrbThMbjRjV0pyeG9uVzEzd0tHb01meVRaNHFPYkRkeGpuZncvVU0rTHg3?=
 =?utf-8?B?eWdHRDRVVW1TYVlhdUJWclZKVGpnUnVyREJHNDl2RTBDWmxyY21PNk8wU1Zh?=
 =?utf-8?B?RVI1QzVHVkVjTWpmTkVLY0ZJcERSVnJkMXUxSDNkU0FtSWcyU05hcFB3eXZB?=
 =?utf-8?Q?44cxQfhHwoo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWRTR2dHY244Nys2bmk0ZUczUUM5cmNmRUVOSlBDdDNVeGs1dVBPYXZIYytp?=
 =?utf-8?B?ZGw2SVdrWGNjUGFmM2JsdjF1NVN2cWZEaWpiQmFSZ1F6NFFkMHJWMmIwa2g3?=
 =?utf-8?B?d0ZubEMzYW8vaUlHeXVFb05YbCtkS0M0UDJQODFKWHU3K0FtL2J3MmR2K3dH?=
 =?utf-8?B?RXNWem5XejFoZ1Y4SHFHNjNNRmluL3NVKytFOG1BWUxaWkdhRFFMMjZzRXRi?=
 =?utf-8?B?cktZMERzdURjRFY3c1FNNXJNNlN5ekI5cUNQZzBGYTZTc1krRVdOcVA5K1Zy?=
 =?utf-8?B?WTdzTnF6dE1GYWx5anBkR0Yyd0x1VWNOK05NakcvdVJsNDVna0JVRmloeXFq?=
 =?utf-8?B?cW5EREsxNnFUQ1Q5Nko0VTdwc2xWSERCYzRja3NoOXVSOVUxRlpYWkNhNk9K?=
 =?utf-8?B?blZENEtQUzI2bW1QYVdCV204dTBBUEZZTlV0K2JuSWxERktQRmRDVm43WDlj?=
 =?utf-8?B?UnVXSjNRQ1hXZ1N2L3IzUkZwL01vUVVpQTZIQUhKYVFrRG91Si9ES3dybHVP?=
 =?utf-8?B?azcyYzBVV2d0djZwcFNBaEJmck9oMlNjM1EyWVVhWlk1WEhzL2RzME9UVDVh?=
 =?utf-8?B?WHlDWTdLRzFxMVZLbzJ6MW1DVklRZU5SdlE1dEwxd1JUZEZuc3ZuN3U5TC9s?=
 =?utf-8?B?ekNxU3Y2RURxVDBZM3U3NWhDcUpsYWxHU3pDaStvcSt6bmV2RVpCeUNjNk5Y?=
 =?utf-8?B?UXJGd0NpclZKcEtXZlMzTm5RL1BIYzg3R0ptOWloenVJdGp2NXQxek5vSGxE?=
 =?utf-8?B?T2d6TjZmamtBMVc4R2J4ZWwrc29HMzZxRzQ3RVRRTi9laW5WSndTakw2cklj?=
 =?utf-8?B?QlduY1FzeThpVFRYM3J5YnUrL2F3eC8xemRGR0F3SG1vRzBFVWxZMzFIOXZD?=
 =?utf-8?B?Z0dNQnJvODBWOVREUStiM0RtWFp3dkg1T3dPRDJmcEVCYzVuWUhCbEg4dW5F?=
 =?utf-8?B?S25ydmFac0xhaEVtVGRDRUhqSFNMckQ5ZW5tcVdrbHU5ZG1SN3dtOG9rV1ZX?=
 =?utf-8?B?UmJsUEQrVHZXNGVnRlI4Tzg3WStqWmRXVkd5UHhVTzNmRWxSbzZpcmhNZ1ds?=
 =?utf-8?B?TXBzZk1OM29JbUQzeVY4UXdtRVNRcG1KRWoyVWN4bHhrQlRJVmlBQS9KdTBL?=
 =?utf-8?B?SXJQQzk0d3NLSk1oTUU3Y05Jb0ZZUTZaUUxrUllKTkJwd2VTVnZja293YTBU?=
 =?utf-8?B?dHVGSUtMZkl6b3FMaTZpdU1vbWJjanVUWGVTdDhqa1E5RUpZOFVPaVRYNUwr?=
 =?utf-8?B?TGU2WVNxNno4d2FWdzJXYlFLTVJJMzlGN0RETW00cjhZT1VtdUZEY0JmMUd1?=
 =?utf-8?B?dW1tQlVmQjhFeGRPUFl1Tkl6U2J6SU4zMlduUVBWU3pWREVDUFpCMWl0eW9q?=
 =?utf-8?B?a1FMQnIxQ2V1UHZqN1laTVJITkxhUDE5ODZmL1BBZnA3U2NWSDhzOFVDRFZC?=
 =?utf-8?B?d2xRWWdJUElYbGxvQTZCbnZ6b000c1hqQlFuV3hINXViVmFacEczTUtYMk93?=
 =?utf-8?B?cDl0bWFzLzlQVHpkNHpjUHBDT3I4Szg2UmtMT0pmR0RXTDlPRFJ5VkdmRU55?=
 =?utf-8?B?cmI4SXMwUTlQSTY3MVdyWUVpVWpLRWJVWHY3WU16djZMMzBwQWlybEVtNjVz?=
 =?utf-8?B?ZEdKTFBxNXFRZTlTb2NSam1GVHVXeVB5QXVTWnBNR1N5T1RZTGNrQXlUdzA2?=
 =?utf-8?B?YXZ1Q2NBTENtVGxXTWgyTjR0NkxJU0lGZTVoRFdGR0I5bWN2Z2doOWJpS1M5?=
 =?utf-8?B?dkhJR3ZWS2g5QkhrT3hoVTlGMGZKbXNYdmcvZ3JmOHNZa0xyeGNMbnUrVWh6?=
 =?utf-8?B?RVo3TWoxanYxakhpRkFlNXloR0hlRW42WHdZWTNYSHpyYTNNRmxwODVjVkUw?=
 =?utf-8?B?emk3b214aHovbTM3MXY1RDQremFkenJRZVd5cDAyT2YySEpub1RZNmpMc0t4?=
 =?utf-8?B?VVZXL21XK0NyTzZzTm5IOGwvMFhRMVlKUkNQNXRBZXlna09XRjZLbURVbmcy?=
 =?utf-8?B?OFhWL1pQSDFiK2RrUTR4TVJjc0NjalRxL1gyRGFoajVCU0xtZ0Z0LzA5ZUlq?=
 =?utf-8?B?cmNISDlJMHRHdmtyUVRZdjFQWG9nWFY5cXgwZzBEYzVXR2lTb2tvM3FuejBk?=
 =?utf-8?B?OGx5dys4UW5FcG9kOXBIb2dDNVdJTUlSeXFEcW5HZGg1WXFMUk83QW5vbVlJ?=
 =?utf-8?Q?vnbqkTFSTucPctVz/AlhA0NkCXdqwPAag7e+6+ozXcE5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6549b182-70bb-4e47-5dbb-08ddc91ca423
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:38:21.0247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftN5mfsP7/y6zGbHEc0P0yHS7lK9rVmplvmdZ9pKhIEB0js9LseQZCmLXd98cYnB9dHRf054oXu8ZT5q6HfzVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6463
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

On Sat Jul 19, 2025 at 4:05 AM JST, Boqun Feng wrote:
> On Fri, Jul 18, 2025 at 04:26:07PM +0900, Alexandre Courbot wrote:
>> A space was missing between arguments in this invocation.
>>=20
>
> It's obvious up to driver and Nova folks, but I feel this commit better
> folded into another patch or we make the title a bit more clear, say:
>
> gpu: nova-core: register: add the missing space in register!()
>
> Otherwise my fear is we're going to end up with a few "fix typo" commits
> in the future.

Yeah, I was really on the fence about just slipping that one under
another patch, but unfortunately I could not find any that touched that
particular line. Agreed the title could be better though.

