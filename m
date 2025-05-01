Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E4AA5ED4
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C4310E84F;
	Thu,  1 May 2025 12:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PM9mD3it";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A88610E853;
 Thu,  1 May 2025 12:59:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFC6dxSg+2O6eA8WQVMixe9pKQxTsr06IJseYglhdkNq+4eAiFnEK5eKdObuCLdGpHTUziHR7Rs1IxLYmC9p9pf2VPL53a0JF31LZfQLsc/P0+WJLOrGs0oERk1hucoENyhPCaX4Xg0yO6Vl+oRq1bZcxj3Xtepu5ai2PyGtLKGE3EkaeQuufXqi8OZtownKDADBDQHhRXquMN1jjFehaYFcJllfWS2HX6N1T3MLJUhlnQiRkUmq8r6xuSAAiEnMavSZt7Xy/XinVHOP1YfGw55RPPxc/h5oyNPxcE/2Uga/f2s8hgaitdBgm/9utKEFHzTL1lGKEpVr/PZAR7vQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNe1eG/UDCoJfhHQgczXk0h/qIrCF5U8YolVwgx3mT4=;
 b=DEoAg/pAAc8o8pRFpIc8qIla/6hKlF4/kMmnBncZ5vqysCt/Ycky0+ilfBXj1JQAGVeaq85GmMa7BOAxupYzYgG0dbK3F2vOMJigVyQabYCM8dXgvGLjECuKAvrFo++O6WDRMA5CgEtxu07hwCRf/ufenBdMzg72tHMAkzyAKc6R/1XKpV99ZThZiWg+YBzyRVl1ZFWCT1RnKmZXPZ9qwFQ1gJgqC8Pg7rXYapp854wWFhKyKsUeoTGXuTg2VkPqOXD7E+rZmFndO2cwNQ8BB0UM360x1xJv6T1dWoKF4hQIOAxHRdXCQrnPAHr7lZDM7ZDiDiP6BszCHiP2Lb0y6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNe1eG/UDCoJfhHQgczXk0h/qIrCF5U8YolVwgx3mT4=;
 b=PM9mD3it9kfMaJ0VON+2MhGHmfZWA6IgMugI0ns88JXXh/qLkujWG6Nh9MQLw2GpLRclFuNmSNszjOyYC71FnleIoeclR8svQ6lXk+AaE5Ym3ldMzRfjBQEIbCerCB4wcdWSD7TfuZK0NYLvDYvkYJrh7ulq9lm4278k64DpoPR82xl5E/No966om/55Rsq/BVNL+mMW/T8R4JUH4DaMg7xiXe/TiKU8dsJAhRSjpwmbVnAKF6DcvunDLml3tFWUiLEZ9D0+aMXwrtrddRP8o4hiDd5K37I3SSflsXl3zZseSa40OxUwyguQjGNP1GgXf2pfZJYytrE2mwEbSrUlJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB5919.namprd12.prod.outlook.com (2603:10b6:408:173::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 1 May
 2025 12:59:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:59:46 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:35 +0900
Subject: [PATCH v2 17/21] rust: num: Add an upward alignment helper for usize
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-17-b4a137175337@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
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
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0195.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: 127d071e-070e-4dde-9c49-08dd88b00c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3hjZ2VOV3RGdmdIQWczMlJpcUpMYnorbU9qeUk1VHJybExBMVlrMHY0V3FY?=
 =?utf-8?B?WUlyMEorOFhNb0xKY1JoTkM3UE8zZFUrNlg4bHlvYzVRa2dWcFQ5Y3pwVjgz?=
 =?utf-8?B?RjdaSnVwMVA4Z1IyVng4N0UzYXhMV0NvK2FvdEl2SzRxOWhRUEZLNzlCVHl3?=
 =?utf-8?B?a2lCYWsrcTlzRzZzT0QxWVNJQnZNTVVvVlJhdE9ta1NjNlBRUmRkdjUwWkN1?=
 =?utf-8?B?Y2ZPNzZJWFlTM3hiejhYdlBDRDkyQjl0Q3lQaXBhaXNkc0ZPWHFSVDVQMU5X?=
 =?utf-8?B?aVhhSTVwbEpORTR5MEFoNWpNVjk5K0JBZXkwVWlNOFhjYjhYYTZzMTdjMnMv?=
 =?utf-8?B?YjNVVGgwNnIzOHlYZVhQTmdYaFF6dGE0dE1LaEU4QWhkTVJFQlBaUk1BZVMy?=
 =?utf-8?B?d3hrclFBb25sOWhNTG1Jangvckx5d1U3ZEZ5T29aRXhVSXV0bDM4T2o4L3Ns?=
 =?utf-8?B?Wm0rTFJYQTRhNUpLQlhLM3h5Q2dNRnc5MGxtMk1yc1hVRFVVRnF1QTZwM28r?=
 =?utf-8?B?b1A2cEg1clNwY1FIV0tkaTVJUkJPRWdBNEYzU1JxMmt3RzhiMmtrT2pObkNh?=
 =?utf-8?B?YnlPbFJZVlY5K2h4NkUrYk9ydDFmVFhZY2VmbjluUUlRNGhVTTViUmVaOTc1?=
 =?utf-8?B?NUpFSFIyVWZwalZXSDZBK3l6UmZYZ1FxMTYvWklhR2Z5QUlkM3ZsZjZVNTU5?=
 =?utf-8?B?YVpOZ3lkRkQ5dFBjZFdxYnpsYndMOFI0Z3AvN1lQV3NGK2pSaFJWRkkrZDRQ?=
 =?utf-8?B?eGlwSkFaU3I3Skx0YjdsbytNWk8xbXdSaGpDVGpMN3V4Y2FzOFVjTFFaL2Zj?=
 =?utf-8?B?MU1EMDBDOWMwWm42d3M1dXZPd0lBUmlVMHYyYUxwWS90eXpsTit6UllVZ3Bj?=
 =?utf-8?B?VDUrRkZLbmtQbTBEYkxPRkI5TDJ1bUZjNXpZVU9QQ2pueHREc21TUmpJVHJ1?=
 =?utf-8?B?QWs4cS9SYkQzdWY4OWJtRFpGaWNESmtHZ1V5cWkwRnJTMGJyU1BON20vc3lU?=
 =?utf-8?B?RHhMYVM0a1NEcXVnVlFkMUZJOTJxdmZpTTRIdGRqTVpLakVTUkdxWTF0QnRQ?=
 =?utf-8?B?RGhNTG9IWDZUZUgzZ2RyQVV4OW1VZWZ5R0xQNTE4N09RRWFtaW1OeWIrajdW?=
 =?utf-8?B?SDlBWmd1ci9nc2ExWmlaUzI0UGxsZnRvbzA1bDhQUHo0U0hqSEtDejZNMGJa?=
 =?utf-8?B?UXhQMS85RnpMQkVJRTdIcmtWZ3RJTE5Xb0JJbGZYS3ZSbEdpc3hjTFUrWm9D?=
 =?utf-8?B?eUxyNjdBN3BOeGsrZldSWVpKS1BFVzFFdEsrTnpJVU5XNzgwejBCTGx1bjVQ?=
 =?utf-8?B?SVNUWVEvc1lDd3hLTjNwcEJqektkbDlPN1JTWTVwYVZ1eFMxQmVsYUNOOTdy?=
 =?utf-8?B?dWhvNWRiZUpvejRzNmtRNUo1VE8vZHlpeEJ5ekMrNndyZllNRDRlakRIcWJ2?=
 =?utf-8?B?UHViQ3JoTVZwcXo4QzdXZnNlZFBVQngxYWg0YnlZZWt4ZE5WWVFRZ05lcllH?=
 =?utf-8?B?Sm0xTVJyYkpHRUVXSzd6MTBkTUg1WkN1dTFWZFd4OWx5WDVvS0xqNmNCSGg2?=
 =?utf-8?B?d1RBSDdIYlF3S09RSGtCcWRVUjl0dUd0ODVSSnRCUWM5R2xzRDVsRXBMYUhz?=
 =?utf-8?B?Z1FuMnlPbDc4TERuUWF2NXFJVUUrdXdHZUk3cU0raFJTU2xCS0lkNWM5aGFL?=
 =?utf-8?B?ZGFLVSsxL1V3VFFpU21jMHBPZEc5ZDFXU2xWMWk4TUZCeEw4bzlFZGNGRThZ?=
 =?utf-8?B?ZllxL0JaUzZmT3cxdmZzcjZETXVaUzdYOUlEMzVDNFJmT3MyRDNFeFdFTTJ3?=
 =?utf-8?B?RmpOYnltYjc3ejJuY3BIQzl0Q085RGR2akp3ZW1HMmYrTkZvU0xGUFJubnZp?=
 =?utf-8?B?SE9EV1dhY3ZuMllNaVcyVi95NG8zWE1YL3l0OHNqZDFlY2s3WVR6SXVQUkE1?=
 =?utf-8?B?QnZYTFZoT2NKOXBhWVIwb052ZlljRlQ5YWZsejlZVnVuZEM3WWl0Y05JeWhR?=
 =?utf-8?B?TFpXZHFmYWl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHZGYXJRYlJrVVVkNHFCZTZLczhOM2Fla2wwdWJ0bERzbGVSUGVxWTBOakhj?=
 =?utf-8?B?amo5L2NvR3FBMUdLL1R3S2Y1OHlrSitNUmhrcDZCRUgzS0pGMUVzbXRmSWEv?=
 =?utf-8?B?ZTFBK0VNNHd0Q1BBS2s2SHJKa21ESHNiTEx2dUZvNXNZc1pSRUdPZUt5TDVp?=
 =?utf-8?B?aCtja200WExlTzg4MEptblRaSGtHWDNOY3dUTmR6WlRXdVhqaG1hQ2FOYll0?=
 =?utf-8?B?UUdPL1BkTHl4RElHd09sWDZhU3lDWE52TkRPbUQyVDBBNzQ4VGttZlpxbDI4?=
 =?utf-8?B?SzFndmJVbFJ1OWhQOHVYYnFYUmFJUVdUeVhZUFpYQ2hnYUI5eDN6OVF6N2NX?=
 =?utf-8?B?V3A3a3FTRFFDaWxtMUJhb2VxaVdiVS9VcVJvbElXWVpSMS9LOE1wcFlrM05L?=
 =?utf-8?B?TkNzZTNpZEZHaytLUVZMZ014Nk5RNU5GNzNLMmZ6aWozQTVEazIzSlNycVVF?=
 =?utf-8?B?R1NORjhCRFhTbFA5NjhETjcyeGhIVUd5WlRxUEx3STU5dVFmM1gxc3BQUEpQ?=
 =?utf-8?B?V0NsaXg4dHFvcEJHQWFzRGdxVmREc2U1QzhmeDd1TndqMm5DdzhyR1NCMk9W?=
 =?utf-8?B?b3RmeFA4Zk40N2szdDJ6MlFsbXB5T05wMVlKSnpMaFBUQkhwdDRlLyttVmp5?=
 =?utf-8?B?QjJ1QnJkWjhEMzVrWkVEbjl2eUxaQjRhN1d3Znh5ekNQRmFlcS84SjcvVkwv?=
 =?utf-8?B?NVBrUGdQTUIwajJsbVpzWUJTK1VWS2J1SlM0QWxFM0RwL0kzWjVwbVdCWnF2?=
 =?utf-8?B?b2M2bTBic2JtcjBacEloM0U3RWN2bFAzTU42VmVpWG1MTEtkRURUTTk1WWZh?=
 =?utf-8?B?cnRrRkxXSkZKelRMck8rYkNMUW1vWEdQYVppM3JJcXpIWGhVUDIwclZoYzBX?=
 =?utf-8?B?Y2ZWQ2RCVzZldHcrOHFKWVBLYUx6Zi9ibkVZODVGSENOOElHUkc2T0t2L1hq?=
 =?utf-8?B?eVFWaHF2TjI2bGZMbUhMOWdOVGNEZm04MXNmUUJNUXdNcEE4alcrdDc5Qklo?=
 =?utf-8?B?c3p6VUpFQllzTlZGVzdmWTMyY24rck5SRy9HR2QyRENUcnlycGZMR3RtZ01Q?=
 =?utf-8?B?bWZhSGUyOVFXWnA4RG8ybG80NVk1b210aE9HUnVPWjY5RktLeG9YMXBTa0c0?=
 =?utf-8?B?cUM2K0NCdVRiLzBvL211YU8xU1NoV3Vsc3pSRUJKdmE2aE42aVRlMEZ4VVM0?=
 =?utf-8?B?TkNIUnBhT0pOcm9Zd3dZSmZVWm8ySHVKaXhlZ1ZYWkJQZEY2M0V0QnByOVBp?=
 =?utf-8?B?UmZIUUcrak9qUlRYRTdiazhqb2hEbmlzb3pCY1d1WmhxaUp1ZDI4M3hYaDdo?=
 =?utf-8?B?cjhXM29oMG40a0NqeFd6d0NUSHljTkh5dzFZMVpjVUJpYlorb29rZmtVYmRZ?=
 =?utf-8?B?T3A1ampldFlMYzExZmRHVVhDckM4ak8xWUFuK1p2OFZ0U055UWoyYk9TK1Z6?=
 =?utf-8?B?VDJsaE84TnlYa0lidmlOSzZSSnBwa1JNQ0UxektiT2N5UURuSHFTcEtIZGVF?=
 =?utf-8?B?ZHVNWVZxakNpTTdOUHJuZ1FKdCtaTFkrSW9aUmJKVnVPSzhxNFkzM05jMk1s?=
 =?utf-8?B?VDJvZEZWUkdhOWpqM3RyUnNqOHFVWmh3cWxOKzIwajJXY2RRRHloc3lybUN2?=
 =?utf-8?B?OEVCL1o5RVJ5RzIxQmJwUm9YNU9TRTFpZFJVVnk3OVVaY29nVUxzM2MzQ0JE?=
 =?utf-8?B?T3JPdzZvUUdYcHpCVlFkdXZ5eG9OZ0FBNzBKSGt3cVVHbC91WDM0SU9Oc0dS?=
 =?utf-8?B?NC9NWWdsRHFrdXVtamlIaWxvOFB5Q0FDWlpiSGl2T2RiZmlVM0FUK1hMUG9q?=
 =?utf-8?B?WGkwM1hqK0szQXlSc0l5eStzMFdEc0xLSnV2aHowL3dDWWpYU2FJM0N0ZUU1?=
 =?utf-8?B?ZElQSmFrSUtiU2FmMjFNaHo1dzVnU01XRVZTZXFBR00zYlZPVGdCaDliNlVh?=
 =?utf-8?B?R0JvaE5FLzUxVlExclFLVTMrYkJtMk14S3c0aFZ5VVVzMkNkVnBTcDkxdWF1?=
 =?utf-8?B?bkpldG9ITXJPOGtTQjVLK2VFeW1pTkQ5NmVCRDA5dW8rVEZGa2s5ZHcxV1Vn?=
 =?utf-8?B?cGE1YVB4anU4dnZyVWp6NlNseXFJOWZlVnZDMlR3Ry9OblRjYzRMdHB2VUo2?=
 =?utf-8?B?K2pSUjZsK2pNbEJZbnZ1S0NmdG5SZkRHOE9rZTV4L09PNG10TFF5dDlBNFNJ?=
 =?utf-8?Q?SBD0p75jxLJrVz3I+cdEpTdiO/OOITj9hBKnRhgzvAKi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 127d071e-070e-4dde-9c49-08dd88b00c53
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:59:46.0931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnGi/dsFJt8pmkblw1JRNLSyy7ix4FG3DScjTWBc3BqMoGFPvfULD7MUEQiT2V3o1lXP8mh7aMqIuHxXvK2Kfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5919
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

From: Joel Fernandes <joelagnelf@nvidia.com>

This will be used in the nova-core driver where we need to upward-align
the image size to get to the next image in the VBIOS ROM.

[acourbot@nvidia.com: handled conflicts due to removal of patch creating
num.rs]

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/lib.rs |  1 +
 rust/kernel/num.rs | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index ab0286857061d2de1be0279cbd2cd3490e5a48c3..be75b196aa7a29cf3eed7c902ed8fb98689bbb50 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -67,6 +67,7 @@
 pub mod miscdevice;
 #[cfg(CONFIG_NET)]
 pub mod net;
+pub mod num;
 pub mod of;
 pub mod page;
 #[cfg(CONFIG_PCI)]
diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
new file mode 100644
index 0000000000000000000000000000000000000000..953c6ab012601efb3c9387b4b299e22233670c4b
--- /dev/null
+++ b/rust/kernel/num.rs
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Numerical and binary utilities for primitive types.
+
+/// A trait providing alignment operations for `usize`.
+pub trait UsizeAlign {
+    /// Aligns `self` upwards to the nearest multiple of `align`.
+    fn align_up(self, align: usize) -> usize;
+}
+
+impl UsizeAlign for usize {
+    fn align_up(mut self, align: usize) -> usize {
+        self = (self + align - 1) & !(align - 1);
+        self
+    }
+}
+
+/// Aligns `val` upwards to the nearest multiple of `align`.
+pub const fn usize_align_up(val: usize, align: usize) -> usize {
+    (val + align - 1) & !(align - 1)
+}

-- 
2.49.0

