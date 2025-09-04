Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B10B430F1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 06:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FAE910E965;
	Thu,  4 Sep 2025 04:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N5GCX7d3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327F210E964;
 Thu,  4 Sep 2025 04:12:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcaUJ3THfRVDPISUruv4dtLJtFeGupjqyamLdFfR4TLacw6KLudEZzNkHvUYzd0eEz3X2Plc1pwm6YWeqtWVUcXUoIQc4mYSS1Nj2iMZwj72liiDoBOHBP3fFiilRd5FO2K1mUqWTNr9jokKXC5Qt/gscsy3Lh6QBK3q4FD/Jmk/wWM7x5ZW9edyIkmrQssepspNVDDVZRfUYRnP+ysATuCxiyDhdQfGgZtn8EDL9GaiyIPhBFOiM0J+9nW6/L+6eezqCct7drBUzgwKBGcpz434MoJ8PBlU4k+4yEhRioiJI5ctDT37e3T2i80XpDDGy/eZzK3GK+GuTki2TvKCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBTRLzPDlSvqUKhQBiaxMjWs6cdFUP60HdwWHkXXlVY=;
 b=QBY1FtiUFhWFkgmR18aScriSIN/Wl59248KwEbHZIXIO+HxvnWyEuj8yZJXY7YGtgIOyKWNcZ+6Bu+JbqRfb0JE8XaXoGEKQMrI1cDWSFI7Z/bqd6LJorlzf0Nh4zpryvakhy/O49nATdVaZaxtc7LLuo62kp0eU2WghrH8b7BJzuQ6epcB2kDgRKL5pLU8Fac95B24ezcBb6KmIyv6bUNAwDim8nWYa+res+4LZ5Ds1TZfC36qWjgHUkrBzOZn9GIgvXxauBfVlMA6eDClIJJyWyhqjNY6bF1YYl36NjX51WhViBt/fIDrjBSfkbYwfeNO/O3ZYUdwAJQYdjwt3sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBTRLzPDlSvqUKhQBiaxMjWs6cdFUP60HdwWHkXXlVY=;
 b=N5GCX7d306s8ky+tvS9Zi5X9kfUv86YNcYA8pD5llFVxoR5SrG6XkO/bCxB9yUmRB3WxKQ3lhO3NQHyNdsnquS/T0famcoUX5LYtCclmOV5gTEqqinuFnEMK4pDCLyF5GF3wbbG/srWyCbmAciu2p5y+EIR+PH3XBpMXCzTwJYfdLW1y9ueUedvIhFt0xH0e+2rhF5D+/MAfAIjEE99HE1qmXX+aGZjs4zYDUUO0RHMFo+k1VP1y1/VZhDssSf8ctYvdsIYOMoeMOZplErDrOWuhqYOpCTW3JVa5yL/Pt9dgS8H/whzSChBxzPy7/LO/+g2WLh1gnlrl1DOcboPbQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8128.namprd12.prod.outlook.com (2603:10b6:510:294::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 04:12:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Thu, 4 Sep 2025
 04:12:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Sep 2025 13:12:40 +0900
Message-Id: <DCJQ1JPNP66D.237HVGM4L0UPZ@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 05/10] gpu: nova-core: gsp: Add GSP command queue handling
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-6-apopple@nvidia.com>
In-Reply-To: <20250827082015.959430-6-apopple@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: 21910463-0886-4df3-0a94-08ddeb694c1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXYyQ0toOURsdHFpRmZ3RlZTOXBnYjZwYThxODBta1lYUDNjbDUwM1RPZ2hJ?=
 =?utf-8?B?a0tKRlhualZjRzVXR0VTRGFmK053VU1naU41ZENqQ0t2MnZPNytHLzI2Nmt1?=
 =?utf-8?B?Z0xpTG5jU0NuOEJEMFM1Q0JibE5xSjF4azZpZzJhbjg2TlZwTVdTbUtDaHhO?=
 =?utf-8?B?UkJBWVE1N3dKTlBETUt5SFF6SmYrM2JGS3htQkdWME9zMDU3MlZ4RjZCSXAv?=
 =?utf-8?B?QzQrdkw5N3FqeEM1dkEzWkZXZWM1bTJqWStUc1hwNEZOMzZ2TEZTZ0VwOUdN?=
 =?utf-8?B?cDJ2OStXVWs0NHQ5NCs0NlBDam9sTHJwbUFxUE9RMituNVFDcUcvNDZzOUFD?=
 =?utf-8?B?L3NiTDFhSE9SRm44U1FWNUlqS3k1dlBpMzhRcDg3dm02MFdaamVja2Z3dHNB?=
 =?utf-8?B?SVRibC9sdFlVUmU4RUxZYlFuMTczbll0WGJmQkRXT25pTFVRazcrQXhOanlL?=
 =?utf-8?B?ZmVtOGNRNWM5VFFYUWZDakV3T294RVBzdFhEb2p0b2l1Z1NpeG9JYU1aQlEw?=
 =?utf-8?B?Rkc1SEdLcHd4a04rNmtCZUx6OHZaOU14QUN0QlMwOHlIeTNMU0docG9VTUFr?=
 =?utf-8?B?ZkVRVHNuWjVmcXNoVDhrQkVTbnhtczIvUStlVjdrZTFBb1lKR09kQko5NkV5?=
 =?utf-8?B?aUtzMDU2Y08rVDgvbmo2dWVkK1B1OTBKZkhaZ0tibFg4Z0VpTWRWS1RHNW1N?=
 =?utf-8?B?UjFhcTNIWE0weDlRK3lqYk5yWnk0M3JQRTB0MnhHWUhCdE9QQUUwcElwbHdU?=
 =?utf-8?B?ck5WR0VocW4wZlNJdXBRbjdMY2paNjhzZVg5dnRHLzJRWGt6b3p6TmZMVjd3?=
 =?utf-8?B?WUZaVHVFM3ltcWVrQVA1WXFRWWhYV2J2UGdmRFpYVlFQOEQ4aUtjdElQSElM?=
 =?utf-8?B?YW5Yb3NreXRTaGNLSlFsWitXS2FJMDRmMzFFQWh5bkNYNkZJWjBFZldXWWd3?=
 =?utf-8?B?Y1VYOURFZWw1ZjVsRTBZQlpMZGcrbmlyanFPRkU4OVNNa0pFMU1QRDdTYzV2?=
 =?utf-8?B?bzVtb2J1dFcwd0djZldtL2tWTmZXUUJPVWVEenZPVTNxSDFmL01WZ0NMb21D?=
 =?utf-8?B?TFhob2kycm1HYlVSTWpBYjVuSUJUalV4cWdXWVRpOVZMUUxvVjYwemFoWkRr?=
 =?utf-8?B?UlhJWUhndTRnKzh0a1JnWUZMcCsrbG1VeW5US3pOSVBZL3pYc2htUGZPbnk3?=
 =?utf-8?B?SVY5S2dkSktmano5YVlFMTM3eEJCNHo4cFB5czJxdEJVUExzRlNacFpaUDZ4?=
 =?utf-8?B?WDdZZU01ZUNKTTFFT3lBdUNsV21RMFZEbkdsMGVXS2szV24rV2JMTGIrWkZp?=
 =?utf-8?B?RUJrK2NCbEtaQ0hPczRDZ3MwRWlpWlBQT0hOM01YZjBRckpWTklXK1NMQ0ZQ?=
 =?utf-8?B?a2RvMXErS0lEWGhHWUFEcDhjY1ptd0ZLWFJTSEFOdjVWTTdQZjdwRmF2VUYy?=
 =?utf-8?B?VEdiU1d1TFhZTjV1dnhqWStldUljWTVySEE1VFl4UkFCbG56bzQzTzk1NTZj?=
 =?utf-8?B?a3hJZkNUcnlrVyt3RjlraXlKN21iYnFXOHY1RU0wOCtNR3R1ZHVNL09mbm4v?=
 =?utf-8?B?Qm4zcVk0R0FkR3dXcTRYNUM5TjIwOTlQcDdKSmNyRTVLNUZaeGp3dUlXTmdT?=
 =?utf-8?B?M2FrckxnVEZNQ3hOdnE1ZU9DR1VKVVFVak5Rb0xETVlaYW80RTJCdXFoTmVP?=
 =?utf-8?B?MUNpZ2hDZURPRUt1QnJzRyszQjVWaks0alpMVU42WTZlODRvRnlkMFp6Ukkz?=
 =?utf-8?B?bWVqZ3JUZE54SVVtcjVJRXhzM3o3UHFNZC9VTTBrSkNvTVNTZ01WaGdyanJU?=
 =?utf-8?B?OVFXK2g3NnViOXcyeTQrUWQwMlluUU9aYm9QMzlOcGVnMlF1aGxaR1VxUVd2?=
 =?utf-8?B?OWhYYUIxZkdJYkFXRk9rQWE1c0dWcEJEVVNvZG84anB1N1dCSUtpNVlZemc3?=
 =?utf-8?Q?xGaTf9/YN84=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlprRS9WWjYwNUpFRDMwdjJZYTB6cVN2MG9HZnY4RStYeGwwUnVzNk1EMnM1?=
 =?utf-8?B?SDB4YUQwaXJocXp1TUsvTkNobFN0NGJTZHZDWE1OU1BrYW1JMlQrMDdndGZG?=
 =?utf-8?B?Zm5nZUlPZUxNMjZaSnd1ejM4WFIyZUxidTZXc2lkRysybldYWnNFbjFQbDBK?=
 =?utf-8?B?YWYvaTZjRmdrNnBoRWRacURDOFlDMTlNV09GQzlSZzNjd0RxcTlxcjRITnhM?=
 =?utf-8?B?eWxmcE95L3NGSytYSGhiY0twMUlhTVZXTTRpbi9GeE12Nk0xQ3J5ZitENlln?=
 =?utf-8?B?K0dyQ3JmajF2UUZDeVd2d2J3M1JoMDBDM0pWUFZKNEhITGV6VGFPZ3Q0c1I3?=
 =?utf-8?B?YVo0WndDemZlbXprMFdNc0ZMVWNrTGUwbzhYL2k5MEdrdXFrNWc2bWJXQWZ0?=
 =?utf-8?B?amZGdlRjS1grT01KYUE4K3E4cDUra2RmN2NIdU01Mmx5WGZzZ1ByS2c1T3Fj?=
 =?utf-8?B?TGVQSWdYZUd4YVcxbms0MWR5TnJwaEkrbTI2Z3JJZHFwcm9OWkkrVmpsaE13?=
 =?utf-8?B?RWlidDFQK29xSGU3NGVnMmVPeEJMbWtlNVlCRjFEUGpkZzhadDc5UTFUZU9O?=
 =?utf-8?B?ZnJBbllkaW9TaGFLSnFXOVVBZGw0emg0V3VqTUxQUFV2L0pwMWtwQ250bU02?=
 =?utf-8?B?N1dCcnRFZ1YvRlY3V0ZQTEdCQjhjREpZOHhiQ0RqbjRpV3JCZlp4QWlnWDNy?=
 =?utf-8?B?Y2QrL0xHbXBlNUgzWXUyNnd5WHhIR3Q3OGlhUkt6T1RBbi9tREVXQ0IvTzZn?=
 =?utf-8?B?OVlTRXdUYUZUYmtubXJsYTZvbjhZU2VPQk9YZ3E4MHcrL3lUdFhuelYvZ0Y1?=
 =?utf-8?B?QVRpREVnVzdYalhuY2IwQzgwcGRET2V5UHNLQWVBK01kSnlCdXlZY1FjWWdT?=
 =?utf-8?B?a001NHRJZEJGTUdoTmVGbC85anYyZ2UxTXdxUjB4VWdFK25qKzlFM0tNbko1?=
 =?utf-8?B?ZmFlKy8wajR4NDVhNklPRGlocTlDWDBiUDc4ZFIvRUY3Snh6WmxlRGd2Z2ly?=
 =?utf-8?B?bXU2eFFUNloxL3c3YzNKS0FiWjB1RklDSEk4SlQ2MGZIYjRPU3FMdmg0NWhq?=
 =?utf-8?B?dVMwb3REM2FBN2RHdXl4aTJwcUQzR3ljS21mWEhxK0lQNm9GaUlTdDlISVI2?=
 =?utf-8?B?RUR6eitHWlE5TFpnVU1MM3dwbER6SGd5REZIOTd0MXM5L2lBMWJYTDd3alF3?=
 =?utf-8?B?RFQrZDVrRnMxTlpYQncxeFVWUFlocnVlMkxnczBmcVZTWGY3N0xmMDZORFha?=
 =?utf-8?B?Y2FuM1hoajJlNmRBTWpBZFpiNWx5d2RCY0xNWHRkeGI3d2J3c3o1ekFsc3Ro?=
 =?utf-8?B?OXV2eTVwZzJVOC9WRFZMZVppV3dXTnRBckJkOXJqd1pyNVpzaHd4NGkxSTNx?=
 =?utf-8?B?cldRaHhkNWMzL0kwNlF1RmRXK3o2cmlpY2NVRi9iUWpCMkZBczFtOHFMSlJE?=
 =?utf-8?B?cGdnQXpGak0vczNoKzd2dlFhNHplR3drNzAzMGxyR3QzcDBKRFRxOTVqbzUw?=
 =?utf-8?B?RWF3bUg4T3RwNjBudERXdDVNUXBSejFKS2NERnhkUURWbzQ3R2piZkNQSTFY?=
 =?utf-8?B?Mm9CcVBMVTN5ZzE1dkdlaG83NHVzV3YvRkoybzk4ckh4ZHJsRUdmVzd0cW5R?=
 =?utf-8?B?NTBNMlU4UVRWc0k3ajlvS3hVWitmNURXanY0OGJySmNFOUFtWDRWRWRNeUNp?=
 =?utf-8?B?RTMrUGpOMGxQTUlKK1JqOGdDdTZaQ1o4ckxHZVFqdnIvcnlyUXpmRmU4a3Yz?=
 =?utf-8?B?LytZT3U0UkdxcTVPWjBmdDZZbmNyWXJVZTFUTTN3NEhYaGdKVm02b00vS01X?=
 =?utf-8?B?OEExUVJQV1poTUF0TVE5L1ZBWjIvTStyRytMZ0hXdHJRU1lZVUFrOGJVeVRF?=
 =?utf-8?B?Qjl6VEpWaTVDa2NoQ1hPbXl0anVERmEraHFYeGthVXpqUC9vQ2FoeDZhN1gx?=
 =?utf-8?B?TVhGclA3dWQzQmhVVDFhWFEyeWRRTy9kWHlLaGlxQ3VtRGhmbzRmaU9hZ3dZ?=
 =?utf-8?B?SytTZHM1UWJhSml6cDhHYk9BTTNjekE5WlhxY2ZvSW0zQTNRMm5kQkx6Qk9W?=
 =?utf-8?B?dDNMR2FpREtmbjBWZmZnZXA3eWhvTzVRZUNhOS80bWwrZk90SlkxclROSmFv?=
 =?utf-8?B?ME1JWlhESFJjZVlleitxdGVJN0RURlJTbUh0eE5uQTRVcVBxQTUvc2U0b3Uw?=
 =?utf-8?Q?g/N9Mx+gLaTiViyDdhURzis8Dy9UZdBgytpI2XebcQrK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21910463-0886-4df3-0a94-08ddeb694c1f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 04:12:44.7845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gB/FFFpeb2r3QAJ+cPHLLG9z6a4hlt0bjtjpIMDHMQuX69zYDm0Zoej/W4sw7GfKlv07gFPSljmaU5sAfPn6ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8128
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

Hi Alistair,

Making a pass about the bindings only - I will check the command-queue
logic in another one.

On Wed Aug 27, 2025 at 5:20 PM JST, Alistair Popple wrote:
> This commit introduces core infrastructure for handling GSP command and
> message queues in the nova-core driver. The command queue system enables
> bidirectional communication between the host driver and GSP firmware
> through a remote message passing interface.
>
> The interface is based on passing serialised data structures over a ring
> buffer with separate transmit and receive queues. Commands are sent by
> writing to the CPU transmit queue and waiting for completion via the
> receive queue.
>
> To ensure safety mutable or immutable (depending on whether it is a send
> or receive operation) references are taken on the command queue when
> allocating the message to write/read to. This ensures message memory
> remains valid and the command queue can't be mutated whilst an operation
> is in progress.
>
> Currently this is only used by the probe() routine and therefore can
> only used by a single thread of execution. Locking to enable safe access
> from multiple threads will be introduced in a future series when that
> becomes necessary.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp.rs                  |  20 +-
>  drivers/gpu/nova-core/gsp/cmdq.rs             | 695 ++++++++++++++++++
>  drivers/gpu/nova-core/nvfw.rs                 |  31 +
>  .../gpu/nova-core/nvfw/r570_144_bindings.rs   | 268 +++++++
>  drivers/gpu/nova-core/regs.rs                 |   4 +
>  5 files changed, 1012 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/gsp/cmdq.rs
>
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 1f51e354b9569..41a88087d9baa 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
> +use kernel::alloc::flags::GFP_KERNEL;
>  use kernel::bindings;
>  use kernel::device;
>  use kernel::dma::CoherentAllocation;
> @@ -12,6 +13,7 @@
> =20
>  use crate::fb::FbLayout;
>  use crate::firmware::Firmware;
> +use crate::gsp::cmdq::GspCmdq;
>  use crate::nvfw::{
>      GspFwWprMeta, GspFwWprMetaBootInfo, GspFwWprMetaBootResumeInfo, Libo=
sMemoryRegionInitArgument,
>      LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS,
> @@ -19,6 +21,8 @@
>      GSP_FW_WPR_META_REVISION,
>  };
> =20
> +pub(crate) mod cmdq;
> +
>  pub(crate) const GSP_PAGE_SHIFT: usize =3D 12;
>  pub(crate) const GSP_PAGE_SIZE: usize =3D 1 << GSP_PAGE_SHIFT;
>  pub(crate) const GSP_HEAP_ALIGNMENT: Alignment =3D Alignment::new(1 << 2=
0);
> @@ -44,6 +48,7 @@ pub(crate) struct GspMemObjects {
>      pub logintr: CoherentAllocation<u8>,
>      pub logrm: CoherentAllocation<u8>,
>      pub wpr_meta: CoherentAllocation<GspFwWprMeta>,
> +    pub cmdq: GspCmdq,
>  }
> =20
>  pub(crate) fn build_wpr_meta(
> @@ -107,7 +112,7 @@ fn id8(name: &str) -> u64 {
>  }
> =20
>  /// Creates a self-mapping page table for `obj` at its beginning.
> -fn create_pte_array(obj: &mut CoherentAllocation<u8>) {
> +fn create_pte_array<T: AsBytes + FromBytes>(obj: &mut CoherentAllocation=
<T>, skip: usize) {

I'd move this extra argument to the patch that introduced this function,
that way we don't need to update the existing callers in this patch.

>      let num_pages =3D obj.size().div_ceil(GSP_PAGE_SIZE);
>      let handle =3D obj.dma_handle();
> =20
> @@ -119,7 +124,7 @@ fn create_pte_array(obj: &mut CoherentAllocation<u8>)=
 {
>      //  - The allocation size is at least as long as 8 * num_pages as
>      //    GSP_PAGE_SIZE is larger than 8 bytes.
>      let ptes =3D unsafe {
> -        let ptr =3D obj.start_ptr_mut().cast::<u64>().add(1);
> +        let ptr =3D obj.start_ptr_mut().cast::<u64>().add(skip);
>          core::slice::from_raw_parts_mut(ptr, num_pages)
>      };
> =20
> @@ -166,20 +171,23 @@ pub(crate) fn new(
>              GFP_KERNEL | __GFP_ZERO,
>          )?;
>          let mut loginit =3D create_coherent_dma_object::<u8>(dev, "LOGIN=
IT", 0x10000, &mut libos, 0)?;
> -        create_pte_array(&mut loginit);
> +        create_pte_array(&mut loginit, 1);
>          let mut logintr =3D create_coherent_dma_object::<u8>(dev, "LOGIN=
TR", 0x10000, &mut libos, 1)?;
> -        create_pte_array(&mut logintr);
> +        create_pte_array(&mut logintr, 1);
>          let mut logrm =3D create_coherent_dma_object::<u8>(dev, "LOGRM",=
 0x10000, &mut libos, 2)?;
> -        create_pte_array(&mut logrm);
> -
> +        create_pte_array(&mut logrm, 1);
>          let wpr_meta =3D build_wpr_meta(dev, fw, fb_layout)?;
> =20
> +        // Creates its own PTE array
> +        let cmdq =3D GspCmdq::new(dev)?;
> +
>          Ok(GspMemObjects {
>              libos,
>              loginit,
>              logintr,
>              logrm,
>              wpr_meta,
> +            cmdq,
>          })
>      }
> =20
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> new file mode 100644
> index 0000000000000..3f5d31c8e68f2
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -0,0 +1,695 @@
> +// SPDX-License-Identifier: GPL-2.0
> +use core::mem::offset_of;
> +use core::ptr;
> +use core::sync::atomic::{fence, Ordering};
> +
> +use kernel::alloc::flags::GFP_KERNEL;
> +use kernel::device;
> +use kernel::dma::CoherentAllocation;
> +use kernel::prelude::*;
> +use kernel::sync::aref::ARef;
> +use kernel::time::Delta;
> +use kernel::transmute::{AsBytes, FromBytes};
> +use kernel::{dma_read, dma_write};
> +
> +use crate::driver::Bar0;
> +use crate::gsp::create_pte_array;
> +use crate::gsp::{GSP_PAGE_SHIFT, GSP_PAGE_SIZE};
> +use crate::nvfw::{
> +    NV_VGPU_MSG_EVENT_GSP_INIT_DONE, NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTI=
CE,
> +    NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD, NV_VGPU_MSG_EVENT_GSP_RUN_C=
PU_SEQUENCER,
> +    NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED, NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
> +    NV_VGPU_MSG_EVENT_POST_EVENT, NV_VGPU_MSG_EVENT_RC_TRIGGERED,
> +    NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT, NV_VGPU_MSG_FUNCTION_ALLOC_CHAN=
NEL_DMA,
> +    NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA, NV_VGPU_MSG_FUNCTION_ALLOC_DEVIC=
E,
> +    NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY, NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT=
,
> +    NV_VGPU_MSG_FUNCTION_ALLOC_ROOT, NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA, =
NV_VGPU_MSG_FUNCTION_FREE,
> +    NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO, NV_VGPU_MSG_FUNCTION_GET_S=
TATIC_INFO,
> +    NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU, NV_VGPU_MSG_FUNCTION_GSP_=
RM_CONTROL,
> +    NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO, NV_VGPU_MSG_FUNCTION_LOG,
> +    NV_VGPU_MSG_FUNCTION_MAP_MEMORY, NV_VGPU_MSG_FUNCTION_NOP,
> +    NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO, NV_VGPU_MSG_FUNCTION_SET=
_REGISTRY,

We will want to declare these as a set of enums. :) It will make the
import easier (only one type to import), and we can benefit from the
goodies that come with having a dedicated type (more on that below).

> +};
> +use crate::regs::NV_PGSP_QUEUE_HEAD;
> +use crate::sbuffer::SBuffer;
> +use crate::util::wait_on;
> +
> +const GSP_COMMAND_TIMEOUT: i64 =3D 5;
> +
> +pub(crate) trait GspCommandToGsp: Sized {
> +    const FUNCTION: u32;

This then could become the right enum type, constraining the values it
can take.

Let's also add short doccomments for this new trait.

> +}
> +
> +pub(crate) trait GspMessageFromGsp: Sized {
> +    const FUNCTION: u32;

Same here.

> +}
> +
> +// This next section contains constants and structures hand-coded from t=
he GSP
> +// headers We could replace these with bindgen versions, but that's a bi=
t of a
> +// pain because they basically end up pulling in the world (ie. definiti=
ons for
> +// every rpc method). So for now the hand-coded ones are fine. They are =
just
> +// structs so we can easily move to bindgen generated ones if/when we wa=
nt to.
> +
> +// A GSP RPC header
> +#[repr(C)]
> +#[derive(Debug, Clone)]
> +struct GspRpcHeader {
> +    header_version: u32,
> +    signature: u32,
> +    length: u32,
> +    function: u32,
> +    rpc_result: u32,
> +    rpc_result_private: u32,
> +    sequence: u32,
> +    cpu_rm_gfid: u32,
> +}

This is the equivalent of `rpc_message_header_v03_00` in OpenRM. The
fact it is versioned makes me a bit nervous. :) If the layout change
somehow, we are in for a fun night of debugging. This is where having an
opaque abstraction built on top of a bindgen-generated type would be
handy: if the layout changes in an incompatible way, when the
abstraction would break at compile-time.

I've experimented a bit and we can generate this type while avoiding
pulling the world if we just define `rpc_generic_union` to e.g. `u8`.
I'll share how I did this with you.

> +
> +// SAFETY: These structs don't meet the no-padding requirements of AsByt=
es but
> +//         that is not a problem because they are not used outside the k=
ernel.

Doesn't it? I don't see any implicit padding in this struct, it is just
a series of u32s.

> +unsafe impl AsBytes for GspRpcHeader {}
> +
> +// SAFETY: These structs don't meet the no-padding requirements of FromB=
ytes but
> +//         that is not a problem because they are not used outside the k=
ernel.
> +unsafe impl FromBytes for GspRpcHeader {}
> +
> +// A GSP message element header
> +#[repr(C)]
> +#[derive(Debug, Clone)]
> +struct GspMsgHeader {
> +    auth_tag_buffer: [u8; 16],
> +    aad_buffer: [u8; 16],
> +    checksum: u32,
> +    sequence: u32,
> +    elem_count: u32,
> +    pad: u32,
> +}

This one is `GSP_MSG_QUEUE_ELEMENT` in OpenRM - it has a macro and might
be a bit trickier to export, but if we can I think we want to do it
the same reasons as `GspRpcHeader`.

> +
> +// SAFETY: These structs don't meet the no-padding requirements of AsByt=
es but
> +//         that is not a problem because they are not used outside the k=
ernel.
> +unsafe impl AsBytes for GspMsgHeader {}
> +
> +// SAFETY: These structs don't meet the no-padding requirements of FromB=
ytes but
> +//         that is not a problem because they are not used outside the k=
ernel.
> +unsafe impl FromBytes for GspMsgHeader {}
> +
> +// These next two structs come from msgq_priv.h. Hopefully the will neve=
r
> +// need updating once the ABI is stabalised.
> +#[repr(C)]
> +#[derive(Debug)]
> +struct MsgqTxHeader {
> +    version: u32,    // queue version
> +    size: u32,       // bytes, page aligned
> +    msg_size: u32,   // entry size, bytes, must be power-of-2, 16 is min=
imum
> +    msg_count: u32,  // number of entries in queue
> +    write_ptr: u32,  // message id of next slot
> +    flags: u32,      // if set it means "i want to swap RX"
> +    rx_hdr_off: u32, // Offset of msgqRxHeader from start of backing sto=
re
> +    entry_off: u32,  // Offset of entries from start of backing store
> +}

This is OpenRM's `msgqTxHeader`. It's declaration doesn't look too
funny, and the only useful member on the driver side (outside of
construction) is `write_ptr`, so it wraps pretty well into an opaque
type that only exposes a couple of methods to read and set `write_ptr`.

Doing so is valuable for clarity as well as future compatibility, as it
clearly shows in a single page of code how the header is used. Here is
all the code operating on it, in a single block instead of being spread
through this file:

	impl MsgqTxHeader {
			pub(crate) fn new(msgq_size: u32, msg_count: u32, rx_hdr_offset: u32) ->=
 Self {
					Self(bindings::msgqTxHeader {
							version: 0,
							size: msgq_size,
							msgSize: GSP_PAGE_SIZE as u32,
							msgCount: msg_count as u32,
							writePtr: 0,
							flags: 1,
							rxHdrOff: rx_hdr_offset,
							entryOff: GSP_PAGE_SIZE as u32,
					})
			}

			pub(crate) fn write_ptr(&self) -> u32 {
					let ptr =3D (&self.0.writePtr) as *const u32;

					unsafe { ptr.read_volatile() }
			}

			pub(crate) fn set_write_ptr(&mut self, val: u32) {
					let ptr =3D (&mut self.0.writePtr) as *mut u32;

					unsafe { ptr.write_volatile(val) }
			}
	}

> +
> +// SAFETY: These structs don't meet the no-padding requirements of AsByt=
es but
> +//         that is not a problem because they are not used outside the k=
ernel.
> +unsafe impl AsBytes for MsgqTxHeader {}
> +
> +#[repr(C)]
> +#[derive(Debug)]
> +struct MsgqRxHeader {
> +    read_ptr: u32, // message id of last message read
> +}

This is is even simpler than `MsgqTxHeader`, and can be abstracted
equally well.

> +
> +/// Number of GSP pages making the Msgq.
> +const MSGQ_NUM_PAGES: usize =3D 0x3f;
> +
> +#[repr(C, align(0x1000))]
> +#[derive(Debug)]
> +struct MsgqData {
> +    data: [[u8; GSP_PAGE_SIZE]; MSGQ_NUM_PAGES],
> +}
> +
> +// Annoyingly there is no real equivalent of #define so we're forced to =
use a
> +// literal to specify the alignment above. So check that against the act=
ual GSP
> +// page size here.
> +static_assert!(align_of::<MsgqData>() =3D=3D GSP_PAGE_SIZE);
> +
> +// There is no struct defined for this in the open-gpu-kernel-source hea=
ders.
> +// Instead it is defined by code in GspMsgQueuesInit().
> +#[repr(C)]
> +#[derive(Debug)]
> +struct Msgq {
> +    tx: MsgqTxHeader,
> +    rx: MsgqRxHeader,
> +    msgq: MsgqData,
> +}
> +
> +#[repr(C)]
> +#[derive(Debug)]
> +struct GspMem {
> +    ptes: [u8; GSP_PAGE_SIZE],
> +    cpuq: Msgq,
> +    gspq: Msgq,
> +}

... and here is probably where we want to draw the line with generated
bindings. I suspect there are definitions for these types in OpenRM, but
if we generate bindings for them we won't be able to take advantage of
the abstractions we defined before, since bindgen won't know about them.

They also seem very unlikely to change, and we can probably negotiate a
stability guarantee for them.

<snip>
> +fn decode_gsp_function(function: u32) -> &'static str {
> +    match function {
> +        // Common function codes
> +        NV_VGPU_MSG_FUNCTION_NOP =3D> "NOP",
> +        NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO =3D> "SET_GUEST_SYSTE=
M_INFO",
> +        NV_VGPU_MSG_FUNCTION_ALLOC_ROOT =3D> "ALLOC_ROOT",
> +        NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE =3D> "ALLOC_DEVICE",
> +        NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY =3D> "ALLOC_MEMORY",
> +        NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA =3D> "ALLOC_CTX_DMA",
> +        NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA =3D> "ALLOC_CHANNEL_DMA",
> +        NV_VGPU_MSG_FUNCTION_MAP_MEMORY =3D> "MAP_MEMORY",
> +        NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA =3D> "BIND_CTX_DMA",
> +        NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT =3D> "ALLOC_OBJECT",
> +        NV_VGPU_MSG_FUNCTION_FREE =3D> "FREE",
> +        NV_VGPU_MSG_FUNCTION_LOG =3D> "LOG",
> +        NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO =3D> "GET_GSP_STATIC_IN=
FO",
> +        NV_VGPU_MSG_FUNCTION_SET_REGISTRY =3D> "SET_REGISTRY",
> +        NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO =3D> "GSP_SET_SYSTEM_IN=
FO",
> +        NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU =3D> "GSP_INIT_POST_OB=
JGPU",
> +        NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL =3D> "GSP_RM_CONTROL",
> +        NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO =3D> "GET_STATIC_INFO",
> +
> +        // Event codes
> +        NV_VGPU_MSG_EVENT_GSP_INIT_DONE =3D> "INIT_DONE",
> +        NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER =3D> "RUN_CPU_SEQUENCER"=
,
> +        NV_VGPU_MSG_EVENT_POST_EVENT =3D> "POST_EVENT",
> +        NV_VGPU_MSG_EVENT_RC_TRIGGERED =3D> "RC_TRIGGERED",
> +        NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED =3D> "MMU_FAULT_QUEUED",
> +        NV_VGPU_MSG_EVENT_OS_ERROR_LOG =3D> "OS_ERROR_LOG",
> +        NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD =3D> "NOCAT",
> +        NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE =3D> "LOCKDOWN_NOTICE",
> +        NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT =3D> "LIBOS_PRINT",
> +
> +        // Default for unknown codes
> +        _ =3D> "UNKNOWN",
> +    }
> +}

This can probably be implemented as a `as_str` method for the enum types
discussed above.

