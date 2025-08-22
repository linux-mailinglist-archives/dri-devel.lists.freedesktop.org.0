Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F24B3182F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 14:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735A310EAEE;
	Fri, 22 Aug 2025 12:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MqCSD+td";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFC810EAEA;
 Fri, 22 Aug 2025 12:47:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDrtAh7Q/6o3Uy6hSkyl8No+/106OGu0xQ2Vh5pGs+nMBq+K0Nyh/Lftkg4DG5qmSOOBUCMjPpbuKJpqW9GAb+VUDWpmyUT4pQ+xq3lNnFmsQPGLtAA9E9WoOiSR1zOvBHEC7hTnF42HcMeg2hF4TDtb05Rep/eJ8gdRzWPAvPGild2o079cNRe4EpLiIlVgoir4dQc8LghwKTcWIR04WHtyLkX2VXTkUWjD2lq/Ig+fsxJ2MzZhjwwxxPnwyL2pOQckzkfqljihBiWZm7aHpKRXFdDv2ThPll1xOYTglKALnx4IqZblla0QaO0gKD+N3iKszn6YxuS/cnXXf0PTfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mF3SkFPNUU0SP0soxOub3vY7HiqRtQ7MEVl95/BTIPM=;
 b=jcNhnHOyRtXdPfC5oc7gxgjnjB11xRmWZ/LU2v7g/r99dC8Kql/yghMk+TiX3T5kcKqthDpyA7e7n6gJK+RhcxotIXtqJu/NvgoRejZnr+lJIhAsihU5RVnReqvTaD1mx7w7KLgD1jQTliF2XBFkY9in42SMEC2b1y3rwtj+ftGzR+R7v4YsCItF34xqG6/igIlRDIdjLV0JNzaTtm8TDN2n/t7tmyfy3oA2v2R401+bsfUyMSrAujjsFYknbVVBUx2U3hDkON7IzvRjD7RLlhfKsMLD4if8rWy1Ga29fbwsjF4jOafZZI91vUn6LlUVCz7CeAZKM0+aFlGfvbX2kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mF3SkFPNUU0SP0soxOub3vY7HiqRtQ7MEVl95/BTIPM=;
 b=MqCSD+tdGBfzsjSp+r8sfJMPFs9MJLZplGDt99e6pNwR8L5BxVODYIjaK3c8YtiGUqEsdvAzt+c4suOFQsNGAmxJJd6DRJFZiFYQru4aI+cRsSuketgTzIqF2SibQqtvKa0AbR+BzTJecYgdOmmOdfl/XGdEjqc9wtraKZnBquAx6W6ub8OW1vFCU30s8410A+sDL+NbNdj49sMoN4afqEXlqO3pJXP1QK4sZ1xfdKTRyqapNFYEYP94o1lr8l7CWAwRFNuFJiKF6LkgSg3cQ9Ueoj99wwgcYqJ0JieIBoOuXDHSiP52DcyicMt0dsvYuN2Dj5VCOz3zgj/4Z9FSXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by LV2PR12MB5823.namprd12.prod.outlook.com (2603:10b6:408:178::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 22 Aug
 2025 12:47:40 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%5]) with mapi id 15.20.9031.023; Fri, 22 Aug 2025
 12:47:40 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 22 Aug 2025 21:47:16 +0900
Subject: [PATCH 1/5] rust: transmute: add `from_bytes_copy` method to
 `FromBytes` trait
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-nova_firmware-v1-1-ff5633679460@nvidia.com>
References: <20250822-nova_firmware-v1-0-ff5633679460@nvidia.com>
In-Reply-To: <20250822-nova_firmware-v1-0-ff5633679460@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0037.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::12) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|LV2PR12MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf662d7-74cf-4026-dd70-08dde17a1447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djB1c1hPMTlWbGhSWWtTTlh5bENZZjRuY0RnRXg0L2V1MXhtaTNVZXdORy9j?=
 =?utf-8?B?Tm54Sno2OXBqand4cFNOWjViMWJQTFFnbFhKbWxFQlA5K0l0dUwrUWN5QUZ6?=
 =?utf-8?B?allpZjdLNDlHVkF6bEEwODJqRmI4d1N1c2E4NklwMVhENlJpcDUwWm1UZ2JT?=
 =?utf-8?B?ZmRLTVRqSWh1bGJWMzVqLzNkOFBPWnNpOG1LbjUwUHlKd2piOEFMWUZ6U2F5?=
 =?utf-8?B?cDRKM2lBcmFoOFJYSmpVQ0xGOThmUkxoc0puQzFZUHFKUXNEcVFERXVvOGpG?=
 =?utf-8?B?RjZSb01GUmNhbE5iT3RLazNFcGI5NlZoRG94ZDRycUlFSTQvYnc2QmYrNGdJ?=
 =?utf-8?B?NVV0blRVU0F4Z0N2bk5mbjRXZlpqUjVyUDkxemU2M2JXMlIvWVdOOE9Kb2RJ?=
 =?utf-8?B?RE81OHVOM3RrRU1kVmRSaWtwVzlzWCt2T2xyRE15TS81Z2Y1TEhVVHBiOUlx?=
 =?utf-8?B?dGRnTW5GWDRiZGdQaUJmUDZQUFNuREJTck56Zjd1YVp0blJhS1ppRmN1Z3l6?=
 =?utf-8?B?cFUrRDZiTjNWSU9OZmNlTFAxN0VPOHBPdXUySEV1eDVKMnlzYzd5MmxicFRq?=
 =?utf-8?B?Y0U5NVZHV09xVk9ZMEphSVd3ajVyRnowOXN4K01ZSlYwa1h1RjFkbmcydlBZ?=
 =?utf-8?B?bUs3dFhaLzNKTmZRaUdrbXJzSUJ6VVROaVVBdjgrZ1FPeEp0WkxyV2srV1or?=
 =?utf-8?B?N3AvOVRUMVZFMWJpdnd0SDVYQjBUNkhxZHlxUjQrNjE4TDdCNlphUGRGK1NK?=
 =?utf-8?B?eUt3b2ZqZ3MxejAyOHVuWG9WRGN6RkFIa0N1MUlRVWVzL04xOVFONW1NSG5K?=
 =?utf-8?B?bnZscC9pM3ZRaXR3OHZhUXJxMEhVL1pEejliRnZuU0NlU05LTE5La295eCtY?=
 =?utf-8?B?M3BXTWRzbmhOc0lwdWVWU0JQN3YwVzF5YzM2VTlRNTVjNDlON2lsdGVGT1kz?=
 =?utf-8?B?SWpCeGk0ZHlXajUzV1ZYNE9iV09sWjVxWTFDZkM3R1ArbzR2MFh5b0ptMFZV?=
 =?utf-8?B?dWlmeWlzMEN4YUdMVWxuckgxRmdjRFh4Sm1hdXNKenk3cWNrc003M0NyQ2pU?=
 =?utf-8?B?UWo3eTVHejBXSlFKS2R1NmtUdUNYRlMzL2dXMSt4allJKzhyVmtUODlBVzBi?=
 =?utf-8?B?L1IyZzFxT2FZSjl4TVBqdnJGeTdubHhkcDBpWVNLR1V3L1duYkttVWJybGVu?=
 =?utf-8?B?ZkNucnF2WmZnbUpqekNKUTVia1luaFIyUlY3SU02aHQxTFhIbWozYituR2di?=
 =?utf-8?B?Tlh1WTUxOHNKeTYrWjRzaWg0ZWtxU0lVUHEyQ2RyZXBTZXB4dnYwbmgrOEFV?=
 =?utf-8?B?VWhVaEJ0a3VOOGJ6cWlOSktZcmJzdFdkSFJBeURjcDI2TnE3K1ZiVERHTW9T?=
 =?utf-8?B?R2dkYmZaTlo1SmIwUFQrY2xyQ0pjbXU4dmpscE5aVkVzYnRyUmRZMm9DcDRQ?=
 =?utf-8?B?TTlhQ3VGZ0xDTFJOTUN5MzRSOElhWEUyRmxlVElGNWxIOU5DUHBRZEplbXB1?=
 =?utf-8?B?eDlBd1hPcWhsSXdYOHZpazdUNjJ5NUh5aU9hMmFDL0U5TCtGbTJIS2VCTGRL?=
 =?utf-8?B?OVE4MkRsNVR2M0E3dGFoU0hDRGk5bEF6eHp0SHRQUllVRis0MlRWWmpJMWwy?=
 =?utf-8?B?bGxGTmtyeWM4cGtLZUxpdmlpN2dKNStOSnNVck9OTjZiVlErVVlmWlhSQitM?=
 =?utf-8?B?TW9rdkpUdnA1NnFGdDljM09VUGt5RkJkUjMxYlNneEJnWjhBRHJ6NUtzTkNB?=
 =?utf-8?B?MGRPNUhFVVhtbnBhMkJpVWhORGw5N2hwbTExRnBQNkJodGZSVmlCZnh6c1hU?=
 =?utf-8?B?RCtYbHkrWHJBVHE1ZmpuTm83cThXOVB5ZHVxQUtTY0lyZDBwMStsMmhvK0Uw?=
 =?utf-8?B?TGVqMlEvSFc0T0JZRE9qaks4bW5WVlBUdUhPRGw0bmVjcEU1S2FKbUE3Mzh5?=
 =?utf-8?B?ZTFsdG1pVGx4R0t5dldpZ2dGb014WTlWaDcyeW0vUHhQQnNadzlDd1JqM3lX?=
 =?utf-8?B?TFBTejU1T0R3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUxJV1lTY1BpS1JyUFJDTXZGdjQ0TEcxQ3ZjQmdQNVcra0ZJRlBlTTJEUzkv?=
 =?utf-8?B?bjVNVVZCZWtkaUJ1c3IyeW1Fejc0QTRha3RqVGVwUlRrMWM5UEwwTWtTWit4?=
 =?utf-8?B?UmI0RlJhZzBDK21XMndSRU1vL3loeHZmdWVwaTJieGxiaURHZHRadkZTczBo?=
 =?utf-8?B?RnBBb2JPNXJwYXRUSW5OQjNjOHB1TmRkSGdndDFUYWdVOEVUM3lpeEpMWDZj?=
 =?utf-8?B?bEljSlRhMXhPOE0yazFhU3pnM2Z4L2VpZjFuRUxNLzJ5UUxES21CcDNXd0Jq?=
 =?utf-8?B?U3ZweUl4Tmx5WGMrQmJ2RkJjeVMvYmZ1alJHTWdaOGZOTHpRUjZ4b0VtR1Fw?=
 =?utf-8?B?NXdkcDlUNHVTL2JHbGlBbVEyZXpxc01LbzBnMktSdkFKWU4zaElSdHlvUTRq?=
 =?utf-8?B?eTZTQTJERlVQZEVtck04QkRnSXk0NURiLzZCb2hxZ0FpNnJaRDU0RzNvak1D?=
 =?utf-8?B?MWNzcG1vemhFbFMwYTMyNzR1RUdWTHZuTHdiVGtFNXlaMjl5WHZyZzc5KzN3?=
 =?utf-8?B?ZmRhMitTVmcvcTFtOGg1clJsSHR6eTZIME02alNpN2Yyc0tJKzgvbTAwUGZk?=
 =?utf-8?B?bGNTUXdabUpydkpOWXVUZFdhMGNPdEFIQjdyNjdaNVhhK2lSK1N2TmdXZTNw?=
 =?utf-8?B?a2xJaW5PdmJFajh5TmdwSFFKaGpFaGlHb0lhMTZKT2hSNWJ4NTZVaXlzN2dD?=
 =?utf-8?B?OWRNajFkQUpBK3B5VXZCbDNpZlpjNVIwU1crc2V3UVpIQlZLTTl6UWdGbUxt?=
 =?utf-8?B?YWo2VDJkMmVlcm52Wk04KzZJSnZTVUxzeUJQM0NZOExIUW1NcGtOaGlzYTV2?=
 =?utf-8?B?RE01VWFFTnBycWwvaGJBWkZTQUxSR0ZHN2lGWXpJblJhaEREVFBVSmwzaWRx?=
 =?utf-8?B?eVhtVWZveXArd201QXZrcUY0RDZzbmZuVXJRbWNxTjlPVVRuYnZJMU5hc21x?=
 =?utf-8?B?dEFLQ1c2S3B3YS9CUURGcytVZG1jcVdxUFE2cU1QQzFBeno2cVc2V2R4eklx?=
 =?utf-8?B?dGFCS0F1Rm5ONDErckI4RGFaR1ZPM3NDeVFmbE8ybXlSTWxaUlJjOFE3ZnFi?=
 =?utf-8?B?TEJUTmo1Z21uNEZvYVZTN290ZVFhTUwrKzBMdXRWdnhNUGZESGg4UTA2L1NP?=
 =?utf-8?B?blB2T3hRRms2VVpHN3VzRVNiMDBDRWhzbDBVTEJUQlgxK1lmODlDTmRPaEZR?=
 =?utf-8?B?eEVzajhKbGhIOFFxOUd5U0hSR0tDZzlTVXJuTWE0cjhreG5CemRRUVlocTVT?=
 =?utf-8?B?cVMxV2ZBTGpLYThkU0VHbkxhTm5JRHI2ZFVxU3hYQ1NtMVJUT2U0VVN1WEVx?=
 =?utf-8?B?dDZxeUZSZitXdUlHdDBxMkg0czc2Q1FUeU4zSzUwYmdPNitMK3hoWDhKRVBS?=
 =?utf-8?B?RjVRb2IvY3htbVVwZlpGNUw0WHk2ZEZxcXREaUdhakxYNjRDQ2NQcW4wZVlC?=
 =?utf-8?B?d3ZieDRwNXdLckJtd291Nm43RS9uVUgyajUrK1VHbDhlRGNGcVQrVFZVTXdS?=
 =?utf-8?B?a21UNzdxUTFtbUpUVGNpdFNyWXVaV0pxUXF2YVlzdml4TlhMSUwrNTZnM2Rk?=
 =?utf-8?B?bWdNci9xMmI3V3pBeUhacnNGV3MyMkVycTdXQmtLSGROQkxnWEZHR0VPZXNl?=
 =?utf-8?B?eWtBNnZ0ZEgrd3BZOVR5K3N1RlhDR2RteW9tOHArRHM1bUlVb1paM3puZ3lX?=
 =?utf-8?B?OENTT09mY29aRjRFb1NnaDhmcUpYVmxvZlZQMGd4ZXU1MWtucFcxVXMramxt?=
 =?utf-8?B?Y3MxVlM1bm5jZFZ6c01lMkZ6RSttdjlSSU1HZkROVWhNOEJ6NEd4YTRra1ZE?=
 =?utf-8?B?bUxNZjZXdWJsRXJSTmUzM0ExcUhoUWg2aWh0NGJrUUNLcjZyZUpEVnk5NXhL?=
 =?utf-8?B?bmtjNnFvR2RzeDZpWjYwZUgvK0RnMzVxbzcrYThxSW1Tb05QRE41ald5M3FV?=
 =?utf-8?B?a1dOS1R6Tlk3d0ZFUTN5NU1HRGhzOXlrdTViVXpqNXJUQTQwTDhWcWFTOFgx?=
 =?utf-8?B?RzkxbEE4VW9uUk1aTUhwYmJEa3RLY2k2WnE3RXVrK05tMkRhbnpyY01aUXQ0?=
 =?utf-8?B?WFJIQW9sMWxHUnY1RmFIZVZUUnBzQ2tnNWxwcm1WRVJuSmorSVRFMlhrblhP?=
 =?utf-8?B?QldrYWpNUGlwWWE2UitaQkZCUkxsakg5bENVVWExV3FlUkpkMXJGR1Nvb29w?=
 =?utf-8?Q?dEAWSVVw9f5VWw5/mLg3FGWDBzyrJ10r1akAHQ1nb/x8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf662d7-74cf-4026-dd70-08dde17a1447
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 12:47:40.1562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCjUNyKS1z2HbQVxaEVUjpPygXfxiQ2sRX/dDKDVYNrjlanPeQNh7NWB+jJFSgPyo950CHp/onnLVKZXVe54Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5823
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

`FromBytes::from_bytes` comes with a few practical limitations:

- It requires the bytes slice to have the same alignment as the returned
  type, which might not be guaranteed in the case of a byte stream,
- It returns a reference, requiring the returned type to implement
  `Clone` if one wants to keep the value for longer than the lifetime of
  the slice.

To overcome these when needed, add a `from_bytes_copy` with a default
implementation in the trait. `from_bytes_copy` returns an owned value
that is populated using an unaligned read, removing the lifetime
constraint and making it usable even on non-aligned byte slices.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/transmute.rs | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index cb33417faa01fd2d87770aac1d2a1539a254cbd6..bea6adaa7e89eb50a03ea1caa0870a8e2e12c461 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -61,6 +61,23 @@ fn from_bytes_mut(bytes: &mut [u8]) -> Option<&mut Self>
             None
         }
     }
+
+    /// Creates an owned instance of `Self` by copying `bytes`.
+    ///
+    /// As the data is copied into a properly-aligned location, this method can be used even if
+    /// [`FromBytes::from_bytes`] would return `None` due to incompatible alignment.
+    fn from_bytes_copy(bytes: &[u8]) -> Option<Self>
+    where
+        Self: Sized,
+    {
+        if bytes.len() == size_of::<Self>() {
+            // SAFETY: `bytes` has the same size as `Self`, and per the invariants of `FromBytes`,
+            // any byte sequence is a valid value for `Self`.
+            Some(unsafe { core::ptr::read_unaligned(bytes.as_ptr().cast::<Self>()) })
+        } else {
+            None
+        }
+    }
 }
 
 macro_rules! impl_frombytes {

-- 
2.50.1

