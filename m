Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04F8B41EFB
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 14:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C313110E7C9;
	Wed,  3 Sep 2025 12:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YZ+yt8NE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C507F10E7C9;
 Wed,  3 Sep 2025 12:29:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5MawvM6/WY1albIPH2/hxK7leSqpDhYlN/Dwbk55UEm56kz2fpVnoEPhICi70zWQGfuaxmZ8ZBJNMBiQy7HtJ1ooPo06RRatwI7/DJBDq1UeF3y1N1Jrs0XI3ictNtEjQTfspoIHpcW9Y8fRtGSUZTvPNV0GBgZRvOVhhs0Xo9m9x+4g01IsAjxLfANJyciEphCqtkhsPYxWqJZzw9v7XGoIgbFX2jFlLT7aGa7Szwq9jBJVTS9LOxCBTpEDWr1kUfScWCCtRUP8zxuApKmD74SVNfO/1XtvwH1J2HGNy8RW0WB44J4m6W80bvX9WICnMmn95aqdXCbjGdAKCsh2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBDWe0+J78vyzRgqZt8Ta2aWLGXt2xprRr1uK3wR/Bk=;
 b=J7eXQSoI5yNrTWW/FO0Rz5FeTv00BdssbKPn8x2E89gkPKCqZGM2Hx080pN0RJokzyh3hISgf5zFLUFyL0b7d7g8oCf7pExc7D4yPOGYI0NM0Y2gdfaD6oBgxUX6K1l4kZ+GtiBaBJ5LUtEPkT8bmDoNFZzlsG64JciSkTaYgBoGwvg5zFBC3znLmTX7rP9EHS4S3l79RYCYWmea0uDQuIYfnXqfVbj2pLL6m6XYbcKCsEJgKcnZPyk4IU0e0luSzqOm9ucJBFMFTPfCF8gOBChZkSRoemCmOQTjOFuGRzxUw/DS6JrIHJSVMqjyNZnjraTesdOvbBQh1kqSOqcrTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBDWe0+J78vyzRgqZt8Ta2aWLGXt2xprRr1uK3wR/Bk=;
 b=YZ+yt8NE0nk+/zTmQDzpkmvBoXFJTojlYipxaCtRhx7TD6aZS0oMR2JhqZ2qnb3/eLQUVcrm0lQ7dpiHOWSn9yGxA9no3/6DfIeHwEOp1JsykN43L4cB3RTXaP6yoo4ipAWa2ZIhg//TpqDCrbomT0ceQQnsMp9vL432+fQm0lLBk1CrtLBvCvPeFXrpa2lUElZJp6OWEJh5RljR1KT/Z8p9HxzJa1AMgyiWKNUVeAU5Ue6P2+vYnZ1XhoVj6XfbOaTt6vPBGgOX5OFH8E18XjUDFrrIksubuWbKxJw6EQ7YvN1uCDfG2ckxBXmP+brw1/CgiYxIeFGM2shJiabedw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY1PR12MB9584.namprd12.prod.outlook.com (2603:10b6:930:fe::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 12:29:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Wed, 3 Sep 2025
 12:29:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Sep 2025 21:29:51 +0900
Message-Id: <DCJ5ZOH6DO2S.8GGF9FABSVNT@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 02/11] gpu: nova-core: move GSP boot code out of
 `Gpu` constructor
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
 <20250902-nova_firmware-v3-2-56854d9c5398@nvidia.com>
 <DCIKSL18GE9A.2R4BAGR56YVPF@kernel.org>
 <DCIZ5VVLACXO.1L0QTYM5YVRQV@nvidia.com>
 <DCJ0T81CZQ88.6IK6LG0E0R02@kernel.org>
 <DCJ3R8YQUYK1.3K5BCWHMAEOL7@nvidia.com>
 <DCJ46WGRUXR8.1GKGGL2568E1X@kernel.org>
In-Reply-To: <DCJ46WGRUXR8.1GKGGL2568E1X@kernel.org>
X-ClientProxiedBy: TYCPR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:405:3::34) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY1PR12MB9584:EE_
X-MS-Office365-Filtering-Correlation-Id: cba819f0-0796-4501-c013-08ddeae5967e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGZUVnBMUEVHTmlHRityZUJUOEowZDFyb2hVRU1NSEczcFBYZmFzZlFsZ3BE?=
 =?utf-8?B?cCt6SkNOSUJoUEhxZnY1RnlsZVNJQkZZRk5uVDlUbmt5VVdBTklEVFE1Mk9Y?=
 =?utf-8?B?a04yTGVycVhLaUc3NTFSTUtFWThLMUpVbjRlSkVkVFNXZElvekgrdjRWak85?=
 =?utf-8?B?TWRaMGtiV21haGFpSUFXMFdacThCUElvVnN0NnEzYjlFOVVYQzUwMUhnVlFm?=
 =?utf-8?B?VVBzcHBlcXRFdUI3VThCL3RJWGI5NjErSDRnRk9GamJTbWhxY3ZjMkdhemQ1?=
 =?utf-8?B?WWlVK0tWUWU5OU5MSUZXQ2t6OU9YeWRvaVA0WXFsclp2WCtKSVJSckdzSXVy?=
 =?utf-8?B?NTVWdHoyaTE0b0ZhQzdXQSt3VXd4TE53K1c3VjA3cytoRTBHTEx2L3MwVnpR?=
 =?utf-8?B?WElqSHN0R3pZeTNWa3IzMFRWWCtPc1VPcUxlRnRGNXkvbG9tMVBhRVJaVjI3?=
 =?utf-8?B?TUxnOUhHWG9rOGxFM0JqZVROeWpUM2NQZjN0ZTNOUC82dEtFQ3cxdkVrZUl4?=
 =?utf-8?B?Tjd3Y3V6M25XVU1xUW94ZHJrb3EwR1RFMUdvWDB5RWl0UFh6YVVHdG40dmFE?=
 =?utf-8?B?ZkREbHdTcmZhRDYvZFUyaUZReFpXK0F4dkhwUnFka1VmaXdmWU1wM3dldjA4?=
 =?utf-8?B?UGdwS3Z6WFZWZXQrSGJCcEY1ZTJPekt4SlRUbzZmWXc3L1UvdkNNKytybzN4?=
 =?utf-8?B?WFhBTjZ2dURQUWJjZEhpaFFsWStuQmd0SllJRlE0dXVWU1lRNnQ2Sk5sY3Zw?=
 =?utf-8?B?bThydmpGRnRMSllvWk9rUmV1RmxlMFcxcEZLaHA0empGWE42emlLZ1lpMzdW?=
 =?utf-8?B?WFl4NGtzelR5K3piaktWa3pmRlBOS2xrSVRVeEhCaVYvVkN2QUVSblhvWEty?=
 =?utf-8?B?TTVxUzFVaGJGNDhGVGVRNTZFU2JRZS9ZQjhDQUZiMUlwM0RCZnBDZlR4YnFn?=
 =?utf-8?B?L2xWeWZyVFRxRW9EbnlCaUxtcnZzNFhvN1RhcTFlN0tSSGtDNHRTZ0t5WFJM?=
 =?utf-8?B?elBHTlJGa1lsZEpNQWpkSUpUdUFmeXB4Nkw1L1JoWCtWRVpxTjRHUXV1c0ts?=
 =?utf-8?B?VXc0Y2VSSXpRamRqRWVrS2wzcDFVOU9sT2lacjhscHdzN0J2ZGJkUlZLSnFw?=
 =?utf-8?B?bEtxNWtSUFk2dFd5M0RVN3RtY1cyNngwaW9qWGV4ZnRKaE5lUW5jN3ZxWlp5?=
 =?utf-8?B?bHRBNzNRUWlmNDJ6dVNSd1FHUXFmdDZiNjF0MzhqTjh6eUY5UWVDMGR2ajFX?=
 =?utf-8?B?bU43V0hIcnFKYy9LaDQ0dFZQZXcyTnk4Q0hzanhtRzRRZVkrWlB0cGFSV2lt?=
 =?utf-8?B?djFYOEZJZHUrWVNUaWtJY3VJZDBSZGFsTE5pWnRGWDRJYWJObXVNNk9IOWlT?=
 =?utf-8?B?QXEvcmlraFFwYkc0cWVhZGNacDdJZTY5MHZMNnA3cDg1Ynp6MEdQYTRSa3pN?=
 =?utf-8?B?cWRSTFFDOTFMQ3NOTGNadGQ3R1FFZVVNUlZSdFV4MkcybzBaeDgyL2RNaTBU?=
 =?utf-8?B?OWJyZjF5Q3Npc0RKdkxOeStXMlJKbjd2Rk9OZTdUb0VsVXluZFlMazlOREFX?=
 =?utf-8?B?Vy8rVE03K09UeEZ3cFM0WHZhdnJocjEvY1liQWNkM3h4V1ZQQXc4dXpKaDAr?=
 =?utf-8?B?cjZvbDJiQVRtZ1RwSk4yQVF1TXhlT0VhaXJrUzhldGJvQk4xdVRhYi9raUVh?=
 =?utf-8?B?SzJyU01xamg3dlNURjhIei9TRzg2clJwNmdYUVVEaHJLVVYwaVZmTWZ4bUZq?=
 =?utf-8?B?Q3ZEcmdtd0xGSHpGQVdZUFlROGJjTCtCQ05QbkVPY3pOVGo2UC82Z01CNGpD?=
 =?utf-8?B?WS8weUUzcXVNa2VSd0hzbXFONE5jUTNPbEs5OVgrUGREb092VEVDelhWTHB3?=
 =?utf-8?B?VmxyYkQxQk1xangyQ1U4S1V4cGdpRnU3TXptWUVuTFFhTmNXdjFGaW83UXh5?=
 =?utf-8?Q?SZaFDZks9J8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzR1bWFVWmdYUzl6WlZmblBlRFFhMGxGdS92NHU1ZjZXVHpsdXBKZTFVVUtX?=
 =?utf-8?B?NHdQMHFqUTNVNnZMWk9PcFA2ZENnS3hXWnBvMVJoa0hsaHJEYzhUVjB5cDl5?=
 =?utf-8?B?a1cwRU42VjJ2Sjk3YUZxVEZmMGNFTk1xMEFVRHJSYTYrLzJ2R3RFQ1ZkRVlY?=
 =?utf-8?B?eUh6UDhOUCtyOXB4YlRkVXpYa0VxU0IzdDFlNmpMcWVxTUY2VnpqbzdzSjNJ?=
 =?utf-8?B?K3FzeGJHa1RyZGRidnNBYzVLK3lObnlLb0VQdjVGQXdyM2N0Ni9BalFOQlVz?=
 =?utf-8?B?VlhvK21wdFhQaDZpVEZMN1VEK0UvQzBCUWdzWlNBWC85Mm1KdWJ0VDFDTnph?=
 =?utf-8?B?YmhhYU1JcEpTUEIydzI1STg2K0tyTWdPL0pzQkZ4L2pFSlk1M2JCY1ptM0Fz?=
 =?utf-8?B?bHhCZlFsM3BMeU8rT2RGd2lWNWN1MVRRRWliSC9jN3FENEdHbWljWGpzeHFK?=
 =?utf-8?B?K1pOTGgxMzBTd3g0bmtJZ21pUmp3Zm1YMlVkS3ROai9hOXl0VTlpVjhVeHVJ?=
 =?utf-8?B?TXFONzBabmUwZTI4ZVVubFRaTS9FZDB2RVNucVhNdlRnRUEvNVlmSnl5K01x?=
 =?utf-8?B?RTByN2d3Zk93dGwxUVJLRlRmOEsweUZYb0NIczhwcFBveitaM3VZMWZjU2Fq?=
 =?utf-8?B?RU81enVwZm1RL0xJeDNPNW5LMjFpSmtiTGQweUZCTTVtenIyTGxZSjBnYm14?=
 =?utf-8?B?WkRiTWRlZUNXVExTS3B3amEwTkcrbzM1QmpwSElOUFU4eDdOMmJJVXNsMmxw?=
 =?utf-8?B?UnN0b3VucGVHZ2lxL3Vxd0NhSjVia1JjbjRURzVMUndCc2QrYWR1a1FCd0hL?=
 =?utf-8?B?bGJYem1FN0ljU3RobFozNEJUa3kxVEI4VnZCc0NscURBa1BUYUlpSWNwWjNO?=
 =?utf-8?B?dUQ0aCtSUXY2NE9nNHQ0dzEyRWJ5MFEwT2NIUmRhQUdZZlhSZ1pQclNidFlq?=
 =?utf-8?B?NDFaQm54Y0swRkNPN1piU0F1QlRIY1NlVG5lNEhtbzhCK3BvZDAvT0hRaGcz?=
 =?utf-8?B?bEdOV2o1aEFjN25pV2ROVktqVytOVEtiK2dvWGVRclZOV1hlYTd0dmc0OFhX?=
 =?utf-8?B?a2N0MnY1dHZLUzd3dHp5T0VRNlREWFlWRHJJaFFqNkQ2RHZCTHFtQnBJNk9h?=
 =?utf-8?B?KzB3OFFmVWhIcGh0NlVLdjFtSnNTV3FydUZMMGppMjVHVUxSRlI3VnpRSGlO?=
 =?utf-8?B?blRES25XdHdXNXMvWkhXSjMydGt1MktjZTBHQVhaMThHNmVQditYOXBnTzNK?=
 =?utf-8?B?WVZ6UmZodXJCYk5UaDEwUkxUTzZyUkZmQ0hSUWdlN0ZIRW5kR1dSbEt0QW9W?=
 =?utf-8?B?QlJqOXRUbFRVT1NyMzhhZ3hXbzV5SklWNi8zMkhadmw2S2d4a3ZwN3NkTTFu?=
 =?utf-8?B?RlVTai90Mzh6RWVFcVp5bEZJUktPSTlPM1JyTm9WQ25WYVpabHZvcnR1WnU4?=
 =?utf-8?B?dVJSa2Fva3NaZDduNE03ZUpmTENTZ2NIMVRKakJQVUF6SVFGMnpGQXBMWWs4?=
 =?utf-8?B?N1c1a1lzU2xEaGR4cUgzYnhwVSt2T2hmdzgxblNQRDRtb1Bkd1ozaHdSdVJZ?=
 =?utf-8?B?dG5YekZldjRYcHZqM3pnTWZVdUFpblFMYW41a2NiTjFFdmYzSHlURnNsam1v?=
 =?utf-8?B?ZzBOTHU1TFJwZWY0LzJJZkNuVDh3alJTeWZGdkpJcTBpUlNydDR6V3hBN2JY?=
 =?utf-8?B?RmMzVWF2eFkvR3cyczlPNXltSmF0Vy9JbEwrZnJSb1JnbnZCOExaWEYzMnRB?=
 =?utf-8?B?Vm1vWUtnMUJjMS9Ua0Vla3l3MXJKczlOaWIvRzIrWi9nM2lMNFVacDhMdWl5?=
 =?utf-8?B?Y3VXMW9WT0l6MEYyTkMzNGpidTdIbkpuRVNER084YUhEK25RYzZOdjNBc2Ir?=
 =?utf-8?B?YmkvZHU5dTN1L0hBRUN2MmRuMVNtdXhWekdBL2VuYmhZUHJsV0trZXd5VGlX?=
 =?utf-8?B?UTJRbHU2eEhoU1lVQWN2UmZXcklDY0lxbUYxRndIOENwQTBOQUs1YVQ0WGI5?=
 =?utf-8?B?UVNWd2xjWWZjdGJ1VHhQT2FGS1FUQ2M3RVhjWjBma0tiZmhjcWRVTWFOMXgx?=
 =?utf-8?B?SWtZaHZFQWZVdFJ4ZTI4bXFLWGpNTDRRb2dROGFEcmVwWmd0bkhNQjZpUmZa?=
 =?utf-8?B?bDZMSFpCOGFkeHJWdHBGQWpJZ3NPd0xVMEZlOThHR0VBaVFWeTM2QmFPMTV6?=
 =?utf-8?Q?iaNSWL/kUdf7+XB4OgSzfOeVxSejgwKQRAHvUFBSfm9I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cba819f0-0796-4501-c013-08ddeae5967e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 12:29:55.2725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YzZJv+YAvMjd1yyKXyj+r7h3RitFbiog+7DD1+XqSnC07l9OeQl9OYDnOvI4X3gVErSGOwyMsLbNwZFkZAmpqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9584
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

On Wed Sep 3, 2025 at 8:05 PM JST, Danilo Krummrich wrote:
> On Wed Sep 3, 2025 at 12:44 PM CEST, Alexandre Courbot wrote:
>> On Wed Sep 3, 2025 at 5:26 PM JST, Danilo Krummrich wrote:
>>> On Wed Sep 3, 2025 at 9:08 AM CEST, Alexandre Courbot wrote:
>>>> On Wed Sep 3, 2025 at 4:53 AM JST, Danilo Krummrich wrote:
>>>>> On Tue Sep 2, 2025 at 4:31 PM CEST, Alexandre Courbot wrote:
>>>>>> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core=
/driver.rs
>>>>>> index 274989ea1fb4a5e3e6678a08920ddc76d2809ab2..1062014c0a488e959379=
f009c2e8029ffaa1e2f8 100644
>>>>>> --- a/drivers/gpu/nova-core/driver.rs
>>>>>> +++ b/drivers/gpu/nova-core/driver.rs
>>>>>> @@ -6,6 +6,8 @@
>>>>>> =20
>>>>>>  #[pin_data]
>>>>>>  pub(crate) struct NovaCore {
>>>>>> +    // Placeholder for the real `Gsp` object once it is built.
>>>>>> +    pub(crate) gsp: (),
>>>>>>      #[pin]
>>>>>>      pub(crate) gpu: Gpu,
>>>>>>      _reg: auxiliary::Registration,
>>>>>> @@ -40,8 +42,14 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::=
IdInfo) -> Result<Pin<KBox<Self
>>>>>>          )?;
>>>>>> =20
>>>>>>          let this =3D KBox::pin_init(
>>>>>> -            try_pin_init!(Self {
>>>>>> +            try_pin_init!(&this in Self {
>>>>>>                  gpu <- Gpu::new(pdev, bar)?,
>>>>>> +                gsp <- {
>>>>>> +                    // SAFETY: `this.gpu` is initialized to a valid=
 value.
>>>>>> +                    let gpu =3D unsafe { &(*this.as_ptr()).gpu };
>>>>>> +
>>>>>> +                    gpu.start_gsp(pdev)?
>>>>>> +                },
>>>>>
>>>>> Please use pin_chain() [1] for this.
>>>>
>>>> Sorry, but I couldn't figure out how I can use pin_chain here (and
>>>> couldn't find any relevant example in the kernel code either). Can you
>>>> elaborate a bit?
>>>
>>> I thought of just doing the following, which I think should be equivale=
nt (diff
>>> against current nova-next).
>>>
>>> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/dr=
iver.rs
>>> index 274989ea1fb4..6d62867f7503 100644
>>> --- a/drivers/gpu/nova-core/driver.rs
>>> +++ b/drivers/gpu/nova-core/driver.rs
>>> @@ -41,7 +41,9 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdIn=
fo) -> Result<Pin<KBox<Self
>>>
>>>          let this =3D KBox::pin_init(
>>>              try_pin_init!(Self {
>>> -                gpu <- Gpu::new(pdev, bar)?,
>>> +                gpu <- Gpu::new(pdev, bar)?.pin_chain(|gpu| {
>>> +                    gpu.start_gsp(pdev)
>>> +                }),
>>>                  _reg: auxiliary::Registration::new(
>>>                      pdev.as_ref(),
>>>                      c_str!("nova-drm"),
>>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.r=
s
>>> index 8caecaf7dfb4..211bc1a5a5b3 100644
>>> --- a/drivers/gpu/nova-core/gpu.rs
>>> +++ b/drivers/gpu/nova-core/gpu.rs
>>> @@ -266,7 +266,7 @@ fn run_fwsec_frts(
>>>      pub(crate) fn new(
>>>          pdev: &pci::Device<device::Bound>,
>>>          devres_bar: Arc<Devres<Bar0>>,
>>> -    ) -> Result<impl PinInit<Self>> {
>>> +    ) -> Result<impl PinInit<Self, Error>> {
>>>          let bar =3D devres_bar.access(pdev.as_ref())?;
>>>          let spec =3D Spec::new(bar)?;
>>>          let fw =3D Firmware::new(pdev.as_ref(), spec.chipset, FIRMWARE=
_VERSION)?;
>>> @@ -302,11 +302,16 @@ pub(crate) fn new(
>>>
>>>          Self::run_fwsec_frts(pdev.as_ref(), &gsp_falcon, bar, &bios, &=
fb_layout)?;
>>>
>>> -        Ok(pin_init!(Self {
>>> +        Ok(try_pin_init!(Self {
>>>              spec,
>>>              bar: devres_bar,
>>>              fw,
>>>              sysmem_flush,
>>>          }))
>>>      }
>>> +
>>> +    pub(crate) fn start_gsp(&self, _pdev: &pci::Device<device::Core>) =
-> Result {
>>> +        // noop
>>> +        Ok(())
>>> +    }
>>>  }
>>>
>>> But maybe it doesn't capture your intend?
>>
>> The issue is that `start_gsp` returns a value (currently a placeholder
>> `()`, but it will change into a real type) that needs to be stored into
>> the newly-introduced `gsp` member of `NovaCore`. I could not figure how
>> how `pin_chain` could help with this (and this is the same problem for
>> the other `unsafe` statements in `firmware/gsp.rs`).
>
> Ok, I see, I think Benno is already working on a solution to access previ=
ously
> initialized fields from subsequent initializers.
>
> @Benno: What's the status of this? I haven't seen an issue for that in th=
e
> pin-init GitHub repo, should we create one?
>
> However, in this case I'm a bit confused why we want Gsp next to Gpu? Why=
 not
> just make Gsp a member of Gpu then?

To be honest I am not completely sure about the best layout yet and will
need more visibility to understand whether this is optimal. But
considering that we want to run the GSP boot process over a built `Gpu`
instance, we cannot store the result of said process inside `Gpu` unless
we put it inside e.g. an `Option`. But then the variant will always be
`Some` after `probe` returns, and yet we will have to perform a match
every time we want to access it.

The current separation sounds reasonable to me for the time being, with
`Gpu` containing purely hardware resources obtained without help from
user-space, while `Gsp` is the result of running a bunch of firmwares.
An alternative design would be to store `Gpu` inside `Gsp`, but `Gsp`
inside `Gpu` is trickier due to the build order. No matter what we do,
switching the layout later should be trivial if we don't choose the
best one now.

There is also an easy workaround to the sibling initialization issue,
which is to store `Gpu` and `Gsp` behind `Pin<KBox>` - that way we can
initialize both outside `try_pin_init!`, at the cost of two more heap
allocations over the whole lifetime of the device. If we don't have a
proper solution to the problem now, this might be better than using
`unsafe` as a temporary solution.

The same workaround could also be used for to `GspFirmware` and its page
tables - since `GspFirmware` is temporary and can apparently be
discarded after the GSP is booted, this shouldn't be a big issue. This
will allow the driver to probe, and we can add TODO items to fix that
later if a solution is in sight.

>
> I thought the intent was to keep temporary values local to start_gsp() an=
d not
> store them next to Gpu in the same allocation?

It is not visible in the current patchset, but `start_gsp` will
eventually return the runtime data of the GSP - notably its log buffers
and command queue, which are needed to operate it. All the rest (notably
the loaded firmwares) will be local to `start_gsp` and discarded upon
its return.
