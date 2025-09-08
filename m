Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 695B5B482CC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 05:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E90010E3AD;
	Mon,  8 Sep 2025 03:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HyIWzaQp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB2C10E090;
 Mon,  8 Sep 2025 03:12:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnA7GBibdljm86wYjIcAhU7TMn2JyIYZrSasZPuju3hVdkz0/S9h4up+XHS4T3LqjcNYeufeG3V8dhYP4Xyv2Fvp2maOvTr5xp09EDVLiTX7ugFXFZs7NPVlq/qmh00RdO7PUQS3/hDyfAc6uGz3G9j3PxIh1S76znR0gCj8cTtKQcSYl717o3VnU4j5OSuJdPTW8/ZKVATA+GR0lCaNl00yPoyvycbn2AjLFxYlizTbfU+Y486gL/PruJhnhW1v9k2F+sm5yMPRwcbHlE9dhc8gAoJpMAGaa97CeRAXX5XLMLA+0QohWOu3j5XbBy/Dj4s7xK0gKJgFbVng6rcx7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWg81h18GeKKj115LuFYt6rhpSFonz0k5QtZRpAn+2M=;
 b=smI9IZ8blGcExKpkR27Sm+PZlFyP2mFMy+7+I+VDnT8hdFMNWYllsSlYDJtPNUW1M28QCb8efUggOGvWCrsp8gfqiZVBbQOVFsyPmR37YWWOqCbxA2vq7QBBadQIxSbrhOQmVfUF8CPTtSNuuuwbbdqYU8rBDJbVY68906XjnyMtM9WzYcZBrHDBDy0OTv8l5VltpEtf0anIfkCLybVI6Yv7zdXp2BRNE6YHtOZAstHOdY5N+kMvJMGl5hWOQBt9xmMTyCplRHncqTssp4eqUw7zqPwTp4cRjRo74IbIe9+4nYxVuAm+TKXmu/ffwDZCOUzvkBOmKfuaM3MeE+zKPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWg81h18GeKKj115LuFYt6rhpSFonz0k5QtZRpAn+2M=;
 b=HyIWzaQpDhBtv8R3V0U13n/3SY7KzKQo6NveBhWxVZPLhGFUYCQQcAqWLBCXIc/kTcZnzN7lPuyTu1FdvmpS792/cnoSRt7F11DTwVn9BYyd22HWA0j2fX2orumeSoM2tHcS0mfiyEi1z1G8VIlTsyvwAyTjyo2TZyhyCZ7Pz6TYId8nmcOmQrmOEiplxOEUJmsPUqwOlDHg4XOR1Nj3kiNl/nVxzchkz2xL7i9I/REdZtxKpalh8VlKlkT/mvLv+oKGFBbyO9SCoUw+9oKHns3SFa71zebgMTEuxv1gZEK4uneQRI4ceL8LYblNMpiV5pKqfKz3lP527r8skGTagQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8160.namprd12.prod.outlook.com (2603:10b6:a03:4af::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 03:12:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 03:12:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Sep 2025 12:12:20 +0900
Message-Id: <DCN39JCF1DIJ.3JESSN7N9WJBP@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] nova-core: bitstruct: Move bitfield-specific
 code from register! into new macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-2-joelagnelf@nvidia.com>
In-Reply-To: <20250903215428.1296517-2-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0186.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dce6a2c-8433-4a28-339d-08ddee858863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnRDdjVNTjloeUpIdEl0ZUREbHkydEdoN2xpK2pEZGJ2TUJUZ2RJZlpBaVJT?=
 =?utf-8?B?WkVzM01jRGF4Q2M4ZUwxbUg1L0hjd3ZKYjIzcWVGRDQ0UFpnOGY1azR0K2Ex?=
 =?utf-8?B?Q01lVytpK0t2bFhhOEZNb0RJSjVtRlhCcWY5OXg1NHFuR3JuTkNnRVU2azZQ?=
 =?utf-8?B?dzNFYVBycTlINGNrVmZwUUxVL3haOGVrRkpxczZxMXAwZ28xOTNEeDdpSnY1?=
 =?utf-8?B?K1AzUVhwY0EvRFR2V2d0NzVHTHJEUThsdE8rRVZmQ3NwZVE1ckZ2amp0YlJQ?=
 =?utf-8?B?LytaVGdqZkVnZjhiT0RmVmhLTWdGbzZxMk9lY01Da3pIeUNQNDBjQ2ErN0Er?=
 =?utf-8?B?dmJ3L2hGbGdwcFRhNkkvclkzUzQ0dnhZeTZLTDhJQlQ5M3I4SjBvRSs5S3JW?=
 =?utf-8?B?a1FNUHBKS050b1hxcW92dmRvaVppNVA0OUw3d2ZWTk1sbjdVdHg3ekhZMGZW?=
 =?utf-8?B?V1Z0V0FZWlhVWDNQS0VlVHFyaWZRZG8yMHdNNHJVcC84bUJRSWxweGVzSG5j?=
 =?utf-8?B?anJuK0M3Q1ZuQ1M2akZtUWpEZTg3RUoybXJnYXI0VXZYaXpWb1NVQjhEL3N2?=
 =?utf-8?B?YlhDcENkMFJXL0ZDMUkxRHhOQjVvVVRUYlprMFJpR2tQdVRyRnRZSjdtcVgr?=
 =?utf-8?B?bFBHK2NtSTR0U1JESWIzR1JXT2tERDd0V29jeGRPbDd1bG13NFJvNVlCMTlt?=
 =?utf-8?B?S0Y2aHdVa0QrOUQ3ZUVXWG9pYzNVNm91eVFjc092b3lMUjBmbkFpVVZQVFdi?=
 =?utf-8?B?ZWF5SzJndGdNTFVhYmRQR2dxdVQ1ZVRrc0JERFZPakpFbjBHMDVBdzFDVFEy?=
 =?utf-8?B?TGNLbVRFYjNRcnFJU0pBamtLZFd1U1JodDF2M2FwNmEzSm14YmQ2b21zQnVX?=
 =?utf-8?B?enR5SGNFZ2JKN25UVjlrWnZNbXZnTk5PUE5Ea1ZwMkV5Z1hmZzRxQUFsZFR2?=
 =?utf-8?B?Zm9zVGdjbmlqK1d6bUpLc2huWXkvZ1M4UkFtOFhEeEdIWloxVHhyOTFKZ0dO?=
 =?utf-8?B?QlRuZDZwcnJBVWpGYzZ1dDJjTFMyeDBjL1R1MlBRbndMdkFtMERaSVc3bGd2?=
 =?utf-8?B?VUNXRUlkb2dwTldkMVdUL0M2NW4zR0pjY2x2OEtzRjRMczB5VVRueXNFOHlO?=
 =?utf-8?B?cWhsYmtaejdaZy9JeThaUFFLd0l6VDB2Z3Z2MHI0QTVWSVBzUnJUNjI4b0xJ?=
 =?utf-8?B?NHdFbEFRQlEvL3oySGpaNnBLN3RsaG1KekJnR3VJNHhNVWtXUjZYQUhZaHl5?=
 =?utf-8?B?S1c5djhFZWRqRERhNEdYU1oxbGYxcG1NVUNYR2JQaTAyVjUzR3ZBQUlkSEto?=
 =?utf-8?B?RFBSNFZnSDU5U1hKT2Ria1lKeVREYTQ3SkJvbURXS2R4WVNZVzNlQ1FiUFUy?=
 =?utf-8?B?bytUVXZoY0dQdnlaRTBPYUhYQXJsU0NGR0FQR1NvMnl1ODRXZ1Y2Wnp3WVp6?=
 =?utf-8?B?d2NEaWlnVkFralc0WWlsaDYxN1VCTUtQanRqaUZQQURsaUFEa2dSaHlrajJB?=
 =?utf-8?B?ZDJuWHNva2hTMjNieC85SHpBWExCSUhVT1VBWm16bktESE9ybk1WWVB3WVlp?=
 =?utf-8?B?VW1Jb0R1d2lUSlViazJvcGRyU3BpNDZvdkVuckVpalYvNkdrS1dKZmMwSUN3?=
 =?utf-8?B?dUNvK0V4Q3NZdW5UcFk3NG0yYmZrc2h1eWJhSTlXR2l2MDRhMURaWWZMcEZ5?=
 =?utf-8?B?YlJ0bGtLWnoxQWNTYkZSTEFoK0VWRXhWUm1lMUloUUtlS0FRSWx3NTd6cEpI?=
 =?utf-8?B?TDRLaWtpRlVoVHFRRXlzbDl1L1YyQXVvakkwUU45S0V1cWJYNytCYkVkWWJQ?=
 =?utf-8?B?R3pwN2FNaVl2YUFZRHpCRFgwS1dYTkdlSllaMGtmMFFOZWY1TjBHTVRZNU9i?=
 =?utf-8?B?dDIwRkNybHFYcFdYL3cxaEV5MVE0bHZJM0lWWjZQVitoaVZyR2dQMmY0VmJI?=
 =?utf-8?Q?KDaxg35RTPU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzQ2T2hCNllKZFR1SDlWRGlSb0ZqdzBvWlM3ODdmVzFTdVhIYThkeDUyWUI4?=
 =?utf-8?B?UUlTL3ZOOS9uVmRBWC9GdUx2dDhYTEQwMW1ZUTNmU2VKTGJVZzZyOStJQW1z?=
 =?utf-8?B?QlNXTGlLT3YxT0dNTlpSazRVN0lGRGplUG1XQVZKeG5weUs5UHZOQVVQYS8y?=
 =?utf-8?B?SGlqajJzQkI5RG94Q2NqZ0ZZTXBDWm1ROGczeFFPMGNGYktZeXpVKzQ1bzkz?=
 =?utf-8?B?VDdBZ2hlU3lhdFF0QkpCeUh6VFZzYlRIVW9Vc1psV0dqUXplaXIrbEtFZ005?=
 =?utf-8?B?YThUY2xwRkJDRGIyZ0pTbXlGamRSU3lsdnlhNkxVSjhwSGM2UkFEQnFIT0Qx?=
 =?utf-8?B?M0tob0Jkb3hVenV4V3E4bTcrRXpjbkdrU0xoU1JqMjU0MXFOakphQjc5SS9W?=
 =?utf-8?B?dUtIdzRhK2IrbHdNRUpNWlQ3SEZJVm1vSk96bkhWanJiVkEwS0dzL0dlR3lV?=
 =?utf-8?B?Q1Nocll1TTZySzBlMzBVMVFOaHFVbC9RTC9SRHpwd29CZ3BCNWZyK1dkY2xL?=
 =?utf-8?B?RWlHc2hHSU1aNFhTdEgrS0dqTllDbWFGazY5NmZjUTFEZkZXVDN6YkRXUEZV?=
 =?utf-8?B?bTRJWFVlL240eTVpMTViQ2xnajgvRWVzZVR1T3V3VU1YWlU3WHpLa2lMZ3Vq?=
 =?utf-8?B?ZWFYSnNBZVVqUmo3ak1MTElEM2ZOQVBuSDcxMURNZFBCeW5WeitsVlVmYTI1?=
 =?utf-8?B?SCszRXJOT25rWGFWNElCdkZ0YXJhbzZhS1hIS2tiK2pUc2Vra3U3c1VrRlVL?=
 =?utf-8?B?K1pkaE4xbFBwQ2RRME1xNXU5TE9ncmtoRFF1elNaeWplZVUwOHVvdWQ3dzFU?=
 =?utf-8?B?YWZKZ2NiMUIwR0FEUjl1M040d3F6MjZKbGdvUkl4c3BTZTR3Y1kxeHplbjNI?=
 =?utf-8?B?RUplMUVhVi94cCtWYnhmY1FqYnc4U1BINlZpM1lya09OQ2xGL21COVRFTXFp?=
 =?utf-8?B?ZTBKazREaURtdkN0ZnpzMmc0M1hpZ3BML29HTXBhbFI4WnhKZU12ME1BYTRl?=
 =?utf-8?B?YjBiQzlmZzU5bUtKWmZ3ZFpVQ0ErMFQrSjVVVk9KRC9sdWN3elJCaE5QT25Y?=
 =?utf-8?B?Qi9ERWJSTEswcE9mNkY5aW5FWkV3dkpOZEQ1ZUhqUGtha09nY0UxemFXL2Vw?=
 =?utf-8?B?MWVjT3cyN040Zit1dTlZVVRxT3lKNGR4WWFhNEUrVTFjV2N5V0NIRGg5cnc0?=
 =?utf-8?B?bGVFT1g5M2lzdjF2VUJhVG9NVHRwcG1UWmlHR0RlWDRRUzJhRy9hSWRucElN?=
 =?utf-8?B?ZkZnbGVjT3lJL2dFY3k3NmRWVEg1bVB6Ykg2U0d0TW4xSVN2OWc4a0w2cm1K?=
 =?utf-8?B?QWlpWlErUGJWbHROVTdxK2dmUnFjeHQ0LzJKSnRnQi9pTG9weHdLbXRsYkxv?=
 =?utf-8?B?aHlBbVlQVkpjTWFUN0RnV2taNE13RXpac21hZmRpdTd1a3BCUVlJamRwVzNl?=
 =?utf-8?B?ekxGNnVjcnl2WERxZ0F5UlNoTFpDR21QQnM3QnFoeDlod1ZqSGlTY0VVdUVO?=
 =?utf-8?B?SithOFJ6VTdPM2cvSWZwb1QvSVg5bVFiTkE4dVFrblMzR0V0NC8rd0hXQWJn?=
 =?utf-8?B?RXZ4WlR1aXFWVmdxUHhqcUpUZkdzUGMrRm4wa0V2UHAyZkNMcnlUazRBZkRj?=
 =?utf-8?B?V3RzaktLT0MvWHFXamtGNzRNNzYrbmpNUno3Z1hEU1RBb0Z0N0VWNnErR0NQ?=
 =?utf-8?B?MWlDYk5SL1BjeXF5dGNMbDg2ZlU0Q09wbEFLYXVNakFhMW1iUkxyNGJTdDFm?=
 =?utf-8?B?NzlDQkhLZnlOdlZyWGs4U1R5ZjJRYTRJc1lxOXJUbGcrU080bEJiZ2NWbkZ5?=
 =?utf-8?B?T0tGOGhjVFZtWGo0a1ZjTmkvYklkeWRXTEFWd1U1WUNDa1VibTdER2FCQTVu?=
 =?utf-8?B?Q1RIR0V5SW8wdXZhOUxKd0dZVTc2NXNzUDVGQXJvd1JuTlFmMDJtUXh3dDQ1?=
 =?utf-8?B?dlJBRXBLaXpyeHI0OXVxZGtmVmJhalUrNk5sY3dVcmNjSzlucWFnUTExaWZD?=
 =?utf-8?B?emdicUhWaXBnSUZBdVNIMVV5UlNQSERmT1c5aXZKYWdELy9KUUxKWjlPR1A4?=
 =?utf-8?B?NFh4eGswQmRsUm1seWdHWHg4YnExcDNhajFNVnkyWHlrYjU5R21LRzZmaS9j?=
 =?utf-8?B?ZGtra1hYLzB0TlU4NTZkL1NFdWRia2srWlN5bXdIUExCNWtmVzBQbTRvTEFU?=
 =?utf-8?Q?x+jvUTXkXmBX2AB0a/RtQR0VmnsPOBk8b1pslpuWAiZh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dce6a2c-8433-4a28-339d-08ddee858863
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 03:12:25.8404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UMhpIga1antKNiiAd1MaT6Akq719qIQYTeMxQyuMh35ozSRHCRIHfBOKVG/vTaLOwPqdLPJYIYo3mJd3GgVPVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8160
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

On Thu Sep 4, 2025 at 6:54 AM JST, Joel Fernandes wrote:
> The bitfield-specific into new macro. This will be used to define
> structs with bitfields, similar to C language.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/bitstruct.rs   | 271 +++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs   |   3 +
>  drivers/gpu/nova-core/regs/macros.rs | 247 +-----------------------
>  3 files changed, 282 insertions(+), 239 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/bitstruct.rs
>
> diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-core/b=
itstruct.rs
> new file mode 100644
> index 000000000000..1dd9edab7d07
> --- /dev/null
> +++ b/drivers/gpu/nova-core/bitstruct.rs
> @@ -0,0 +1,271 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// bitstruct.rs =E2=80=94 Bitfield library for Rust structures
> +//
> +// A library that provides support for defining bit fields in Rust
> +// structures. Also used from things that need bitfields like register m=
acro.
> +///
> +/// # Syntax
> +///
> +/// ```rust
> +/// bitstruct! {
> +///     struct ControlReg {

The `struct` naming here looks a bit confusing to me - as of this patch,
this is a u32, right? And eventually these types will be limited to primiti=
ve types,
so why not just `ControlReg: u32 {` ?

> +///         3:0       mode        as u8 ?=3D> Mode;
> +///         7:4       state       as u8 =3D> State;
> +///     }
> +/// }
> +/// ```

As this will move to the kernel crate, it is particularly important to
make sure that this example can compile and run - so please provide
simple definitions for `Mode` and `State` to make sure the kunit tests
will pass after patch 4 (in the current state I'm pretty sure they won't).

> +///
> +/// This generates a struct with:
> +/// - Field accessors: `mode()`, `state()`, etc.
> +/// - Field setters: `set_mode()`, `set_state()`, etc. (supports builder=
 pattern).
> +/// - Debug and Default implementations
> +///
> +/// The field setters can be used with the builder pattern, example:
> +/// ControlReg::default().set_mode(mode).set_state(state);
> +///
> +/// Fields are defined as follows:
> +///
> +/// - `as <type>` simply returns the field value casted to <type>, typic=
ally `u32`, `u16`, `u8` or
> +///   `bool`. Note that `bool` fields must have a range of 1 bit.
> +/// - `as <type> =3D> <into_type>` calls `<into_type>`'s `From::<<type>>=
` implementation and returns
> +///   the result.
> +/// - `as <type> ?=3D> <try_into_type>` calls `<try_into_type>`'s `TryFr=
om::<<type>>` implementation
> +///   and returns the result. This is useful with fields for which not a=
ll values are valid.

Can you remove the related documentation from `register!` and replace it
with a sentence like "Please look at the [`bitstruct`] macro for the
complete syntax of fields definitions"? This will ensure we don't have
to update the documentation twice if/when the syntax gets updated.

The rest of the patch is a perfect move (with a few renames) of the
internal rules from one macro to the other, which makes it really easy
to review. Thanks for doing this!
