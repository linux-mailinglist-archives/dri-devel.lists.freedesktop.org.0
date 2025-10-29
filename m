Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8CAC18EEA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF7D10E725;
	Wed, 29 Oct 2025 08:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OusaaTC7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012064.outbound.protection.outlook.com [52.101.43.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012F410E725;
 Wed, 29 Oct 2025 08:17:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdezl5/Si/aOtMf+MYy+fCSFb9KfGk5yao8lyevG3HHohLaN9p9Ik4ul2lhe968jLY3gUwnFoHRh2WLwTClqs7Un9rg7HNHOBS5vexEQ9d5nU4h7y3ra91EWOFwjhdMnFq3FhBxxWAbtBeSLszuZ5Gm4tN1sSnZ89P7Zy7bvzbkwMFGj9RQhB+03DisAHaZJ8yHBNCQQdKIlxSzigIDtIZCTo2GJxuup76Ub09s3HIvpXwJeHgFqYYZJ98rkPK82U4+5Vy4Mcd1iiFM284olGXFs/GVnhxQRXvM3X+d1B2CQVQ9gUs7u/HieGLf5XPq3VepbTLn2YAYA23KmIk7KMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0qks923OCIoEItw7Vxd1I8bU6ME8YAlGT6MuH433qA=;
 b=kEuv8mwYa5KuOYtvhspw5UR6lGD5i6pDP2DGpHwUGclYCfnUQO73LPYlq8YJToofwSX/9YIvJPaKw6V4RYsdbA/ubKwoc586t0s33cnXglntgUtXyla+SLkaLWekYOhuL8bYGNISKEzuulPOUVkSXRzW+YW/c6DMj8vyJRcbJwWFqPTnYoqvP4sreJi6QtPrHBihdA7D2LiK5J5eVuIMzbdIEw9W9GJapIjmmJVpwi2dkn3ztOMFBnIQyA+FMore8toKdDp3CC7cmN9R6krhGZWqG4TM2Y+fauaRtaLSVpkj/pn8IRJp8mIUroVqwfjiIf/0q/ri4luAuoGgfBAoHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0qks923OCIoEItw7Vxd1I8bU6ME8YAlGT6MuH433qA=;
 b=OusaaTC7RQ0sBtXjjbLFgLGx4PvzgEemmw8IYrDKZkz4IvTlvGou1+q9QIcEOfD4IIAiVn0c2eA8f1ABIaR4OxzEq+AnlVstdHv2MqiuplOPcFFHPxcnf/Eu3PnLsNVNeirEeSRtDO9U6Q5Swzea5IS6JgImCAJvEF6aUm8IBEylDxL+pPWq9ZK6AImuYGmvdXt0Btmr4EYcqlpFs7TJZVOOhxOMFN0dUit8tpnkmbcHP5yGM5vwmq5VyBMltMOVLu9B9XQbbV0yrG3bc0/GJG8zLfcxJkSPaMrXeAEfM8y9MWWACqnCW2KF8kOWwRwkxbEK73PluOl1Ip03eyyPIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 08:17:31 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 08:17:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 17:16:31 +0900
Subject: [PATCH v7 04/14] gpu: nova-core: Create initial Gsp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gsp_boot-v7-4-34227afad347@nvidia.com>
References: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
In-Reply-To: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::14) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SA3PR12MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 166e45ff-9b0e-443d-9299-08de16c39b31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmRETnF6Q2dZZHA0eDlHdmE2YzlkaURZVWhRQitFb2psSUQ2M3BFVjJyRzh1?=
 =?utf-8?B?NDdFN0NjZlB1R2JKcDJKbWVPRTB1aHhkWDZhQUZuSnhiYmJzcG1LcUVWd3hG?=
 =?utf-8?B?eXNwc2J4bUlPT2pGZlBweUVPalJyU0tUMWhpQkFCbXFFbFB4bDIwWkZ2UXkv?=
 =?utf-8?B?RmxOYXVua295bTREVGFWSks3Y3JsSVBScC8yRUdJVDAzZEQwODVXZVB4d1BI?=
 =?utf-8?B?SXFmSXJsMlhqeWc4aFMwalNZSFRwazFGVEI4L3U0SEdRWkluQnEzODN3WTYv?=
 =?utf-8?B?YXd5SE9IMnBNNmhTTnh1ei81ZlJRMytTTEd6c2RxT1VOV2FBQVAwS0JSQ3d6?=
 =?utf-8?B?OXJhWXFvSDdOM2RHRnFJMXAvMVFVdFhJTDVZRDN4eXd6aEhkLzc1N1ZIYXNz?=
 =?utf-8?B?TDBRRDIrcmJ5dEFKQU5JTW9ZNmVmZVJDR2RURkNHNzMyMXJWSERWb2VoZlU1?=
 =?utf-8?B?TC9uZEh3VkVGdEU0aTlvSTB0cnJFc2tXT0ZDbjdvWWVBUVNUTEhpRElNWEtz?=
 =?utf-8?B?S21LYVIxeGUxUklqZWoxN3QybFFmSGpEVUo1TE1GbUZHQm96ZitEcFdTa1ZC?=
 =?utf-8?B?aXFEVVB2L09BQXF5KzdIT3YvSzU4YkxNamp5QlZjSUhqbjdZejZxczQrNmNh?=
 =?utf-8?B?WVU4TnUwd09SWDFITGpRcXRqY2ZHMFRITWI5NGJCQzErcGxuOUdpaUFWR01I?=
 =?utf-8?B?Vnl1NHhhZVdLL05mKzczakFGSFZDU1lZMjNCdEY2Q1hoVUgvb01tZVBiVzZQ?=
 =?utf-8?B?bjQ2YzAxVHNCaUxybHUrYTZjTTZHWnd2L20wb2lFY1FObDI1UVB4a0JWUlRF?=
 =?utf-8?B?UFFuZGpXTTdZeDdoNVgzdkR0OSt5TGJ3d1V5Q1NXYmVJMGJLNldUS2tSb1Bs?=
 =?utf-8?B?Zi80QjVMT3JpcmJOMG44Q2d2RjZQSXpjeDFJSVltZTMxTlZvaWVVamx4cVR1?=
 =?utf-8?B?K2Qza09lU2JZUWRaTWtldTd3ZzlKajY2TGRQQjF2WitnV0x6VVV4dUxkd0lY?=
 =?utf-8?B?RjkxN3pZblpjeXdFVUxjS2hnVVdrc2hNRno3YXMza2o3M1Rhbkd2T2w5RTJ0?=
 =?utf-8?B?WkUvODRHK3UreGs2SmM4MW13bFVXTkJjeXB0bWJrSzVsb1RoMGtLeTZhRGwz?=
 =?utf-8?B?eG51RHd2U0xHZnVoN1daSFBIUlpuemJ1Qnd6TXNmKzlXMlViMlEyK3BpNjdV?=
 =?utf-8?B?M0JUalZGOVBlRm9PditYQlZZMFh5ektBRjVNMFlkNWNoRDdIOHVYODAybHhi?=
 =?utf-8?B?L01Ocm1mWjJqMjE3NE5ocjhhWVBKZ3FZYnpwa1pibVJvNkNnVm01RC8zb1o1?=
 =?utf-8?B?UFozb0RVa3FlSngwdzZBSm1TU1RiU3loWlNyT0hoNk5XdnRiTFRIZitTRnBs?=
 =?utf-8?B?b3VPM1hBV0lna0NXbkNpR3l5cDFKNy8zSHhsRmxzd3Q1dGpWS3lnTHo3aW5q?=
 =?utf-8?B?WjhhdlZ1b2FEajJQTGdKaTVDMHIzL1RnU3JhNVdUdldlMmdDSWVseVM4Nnpl?=
 =?utf-8?B?YnJaeGJjczBIbWJEWjFiekMwWlVSY3hxZUtpM2UyRzJwaEdwV3crTk9RY1RL?=
 =?utf-8?B?OXZyRmU5SDczVDArYzBWb0ZISVFxNC83d05jbjN5a1daRk83anVLR1B6UnFU?=
 =?utf-8?B?WEN0YVZpdG4yQzloUCt4K2YwMzdxVDdJTzRDVFFPYmM5dUJxOUVRQ3c2dzdi?=
 =?utf-8?B?amJLblVxRXBMUXpYQWNqbkpKWkEyNHlQeE9zY2JxNHZQa1lIVEJYeXFpQVBu?=
 =?utf-8?B?WHF6d280aEliZ2ZIcGlvNFU5UEttK1Z4N1NGbk40Yjl2STBzalFKTkRNbmxG?=
 =?utf-8?B?RVhnS2g4MHVrMEdnRWIzV0tTVEUwVDNwQ2c1emliSFdOLzI3dk52dXhNYjlO?=
 =?utf-8?B?Y3J4NjBhbTB1eFFyekp5Q2ZFejJrbk9EVEZOQTJFN2Zhd1NDcXJkV0FuWUJL?=
 =?utf-8?B?UVZoMGRzTFdDaDRvcC95OHZCOS9CQWNxR0ptQm1HN2grdGFPck1qdWRhZFFU?=
 =?utf-8?Q?bAyymTm1+xknx41Otg6ZPj8W7rF9A8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHJZd00rdXA3a2ZVNElaREp2Z0VzQWJFT202dVVDRFh3ZjhxZVZIbHRZSU9K?=
 =?utf-8?B?eXZPU25NR3R6NmNsYzBSRWIwbUdrTW1wbW1xZ3VhbFl2MklyNDhqQ2pYRVk0?=
 =?utf-8?B?SUN3V1NKZTNqZ2grQ09wL0l1QTlVSkN6aEdFQ0lRUkRsQWV0ZGRyVTlmRGEv?=
 =?utf-8?B?ckN0Q3JoZ0JHeUVWL3ZTVG0rbFd3MzNObkdaTVpaTmFiMzlOY2YzRldxRGt4?=
 =?utf-8?B?ZmtGcldodDNNWE56VklkbTBicHZmbWx4ZkVCY0xpOHBUMU5RR1BETUhWMXpE?=
 =?utf-8?B?ZW1vR000L0RhMndiVEV0VmNSM2t6cm12eTBnbk1BTmNIR2VjNXcySTQ3RDZR?=
 =?utf-8?B?aXVRcEdEUDE3YkhxQnVHMy9rQ1g5MmNveGtLVmkyNnZ4RkR0dTFBMnRsRWRy?=
 =?utf-8?B?RXNYMFUycTRYdzF2eEFNVW5ZRXJJckRmT0ozNVNUdHR3NlY4TTAwWk5TMGZZ?=
 =?utf-8?B?eklTQ2U0NVMrVy9sdEpzZ2xtYzIvb0J2M28wZVZoRUVRNVZqTUdhTFZFZ0JZ?=
 =?utf-8?B?WGUxQVdQcFY3dWlkNUtVU1BLczd2c1U1dzA2Zy96Rmg2NDhBWjZkUGt5aVVN?=
 =?utf-8?B?cXBsUUVBdUx2a1dOaS96a2haeE5zeE9GWSs3ME5hTDgzUXhITmJwSHB3QjZj?=
 =?utf-8?B?aThBSVpSNHpwbFRYWDdiVDBmQWFHVTIrdXRNR2dQR0FNTW1Ra2xqSTIzTXBu?=
 =?utf-8?B?ZU1IMGxjczlKUHRzdGIxSUVyU0dFYU9kTGJnYmdUN3VKcjNZNUpkU3JaSnZS?=
 =?utf-8?B?bFQzZ0hxWWFVMFdPbGpTcWQydFVIczhmU0pSNWV3MzBCMURwMU9Xbmo1bVAy?=
 =?utf-8?B?VWcwNWM2THpIeEU2QlhvcXp6cFR2THhlWHc4ZU9RZmE3ZjRabDUzRVJ5UkYv?=
 =?utf-8?B?Y2xXMk54OVdMSjIwcEZIdWZrWWN1NGxnYWl4UHFoeXkxeXloMnk2Vkh6RVcv?=
 =?utf-8?B?ZitNc0JscWs1K0xBbkZ1ZGtqNGFDMVNpankzMGIrU0U0QXlwZGFEVTVQMkJV?=
 =?utf-8?B?aUNjZlFvR2o2S2Q3QUpxN0ZhSm4rdTZhbUYwc2w0NWdOZm5laHJhWmNUaG9v?=
 =?utf-8?B?anV2bTlOajBKOVFMK1BoRlV0bFJ4K3c0SHduOUlFeDJGNlZiY2dQOUc0Tk9l?=
 =?utf-8?B?enJLbUJyM1k0YUNOeTVrK0JvTkV1b2ZJcktFWk9TdVNQSTZsZy9UR2lMVHdv?=
 =?utf-8?B?bnBUcWtGL1FGeTFJclVGcXdVeFMyRStjR2ZHQkxNODFxSUNUVTdTNE1yMFJn?=
 =?utf-8?B?eVd4Z0xHVllaMUpJbUhPVUNKTmw0UmRBZkxqeEgwb1ZqaTBFbWVTVnFQT2hI?=
 =?utf-8?B?amtaaGJWR0NGTWNTVXptdGZibmdYN3Z0ODZ6S1JNUG9ZVkxCNkpwY0lTR0Rz?=
 =?utf-8?B?b21kTURrOVBRQmxxaU5abG1tNWx3cmFtNU40dTZLcGZ2TDJIZFhWMHNzUUlP?=
 =?utf-8?B?bzRJYmw2bzNnYVJHSXJ0Z2NDZnZFazAyRmlSdUJsZlZTdTZxd3FWb292c2JW?=
 =?utf-8?B?SndFeEpvKzVnb003bXcycngrUjE2SG5VSjlOTFpjQUhsRjVuRkpNTXBrMThV?=
 =?utf-8?B?UVJRYzZiWlp6Zkh2QTZNdkdNTW9iSFNLK1VYek1YaytXOUJmR0tORVJRT3k3?=
 =?utf-8?B?Yk9ONlFFL0JHRTE2SndMZWh0WVBORFRtcTBaUWFtMWxTQTcyZTJ6eVM4aXUv?=
 =?utf-8?B?K3RCNktTUnA3UlJEU1dkNHVFZUJHWnRkTDJQVkd6NFBYcmlmVlVkcTBZMzdx?=
 =?utf-8?B?L3hleURvbGsrTXhVYjE2UkdER0hLTUw0MWhFeGF5bkFGTEd6U2FjeDBPakJo?=
 =?utf-8?B?MzgyK3lSZUF2RHlXZ0w4dllsaWZOdFMvL3Zyc3BWZXpQQ0U3RFY0U054WThJ?=
 =?utf-8?B?dXNETFNtSHJiUXhYTzJQU2RPbitUVDBOczdUVy9RSHNibXdEM01tTnVVa2tn?=
 =?utf-8?B?ZHhIUEFBUkEzMk5yczRJendvSFo0eDZ3dzBTbTZSUHhZSDVoR1ByYzRMcHdl?=
 =?utf-8?B?VkZld0g3WVlQRS9GN0dZdzIyMWhQTHdLbTkrekR2dTdCOHNXVEluaExXZHEr?=
 =?utf-8?B?Y0FaOEFwWSttY3pVT2ZXVUI2d3JQWUtIazhSR0lmOS9kM0lPeWk2Y2lrSXhJ?=
 =?utf-8?B?ZEIwa2xCdmlFMzR2YzkwS1lpUmN4Sys1R245cGNEWTBNSzNOUWk3MHZGdjJL?=
 =?utf-8?Q?KASXD6L03FjvNJ+wL4wlJuc9vYAUSkZt2bKbtXOHUUjW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 166e45ff-9b0e-443d-9299-08de16c39b31
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 08:17:31.3658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYz7/GfEDsiFjAKNCCDfOmp88qLaaEscECCgKF2N9QcsESfNwQ8vY0Vp3J0nitsjlXSPop5YR06F9OuXqenRBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8438
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

From: Alistair Popple <apopple@nvidia.com>

The GSP requires several areas of memory to operate. Each of these have
their own simple embedded page tables. Set these up and map them for DMA
to/from GSP using CoherentAllocation's. Return the DMA handle describing
where each of these regions are for future use when booting GSP.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs                      |   2 +-
 drivers/gpu/nova-core/gsp.rs                      | 110 ++++++++++++++++++++--
 drivers/gpu/nova-core/gsp/fw.rs                   |  67 ++++++++++++-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |  19 ++++
 4 files changed, 185 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9d182bffe8b4..50b2751c5438 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -218,7 +218,7 @@ pub(crate) fn new<'a>(
 
             sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
 
-            gsp <- Gsp::new(),
+            gsp <- Gsp::new(pdev)?,
 
             _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 0e698add406f..ac8c2bafe318 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -2,25 +2,119 @@
 
 mod boot;
 
+use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::dma::DmaAddress;
+use kernel::dma_write;
+use kernel::pci;
 use kernel::prelude::*;
-use kernel::ptr::Alignment;
+use kernel::transmute::AsBytes;
 
 mod fw;
 
+use fw::LibosMemoryRegionInitArgument;
+
 pub(crate) use fw::{GspFwWprMeta, LibosParams};
 
+use crate::num;
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
-pub(crate) const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
+
+/// Number of GSP pages to use in a RM log buffer.
+const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
 
 /// GSP runtime data.
-///
-/// This is an empty pinned placeholder for now.
 #[pin_data]
-pub(crate) struct Gsp {}
+pub(crate) struct Gsp {
+    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+    loginit: LogBuffer,
+    logintr: LogBuffer,
+    logrm: LogBuffer,
+}
 
-impl Gsp {
-    pub(crate) fn new() -> impl PinInit<Self> {
-        pin_init!(Self {})
+#[repr(C)]
+struct PteArray<const NUM_ENTRIES: usize>([u64; NUM_ENTRIES]);
+
+/// SAFETY: arrays of `u64` implement `AsBytes` and we are but a wrapper around it.
+unsafe impl<const NUM_ENTRIES: usize> AsBytes for PteArray<NUM_ENTRIES> {}
+
+impl<const NUM_PAGES: usize> PteArray<NUM_PAGES> {
+    fn new(handle: DmaAddress) -> Result<Self> {
+        let mut ptes = [0u64; NUM_PAGES];
+        for (i, pte) in ptes.iter_mut().enumerate() {
+            *pte = handle
+                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
+                .ok_or(EOVERFLOW)?;
+        }
+
+        Ok(Self(ptes))
+    }
+}
+
+/// The logging buffers are byte queues that contain encoded printf-like
+/// messages from GSP-RM.  They need to be decoded by a special application
+/// that can parse the buffers.
+///
+/// The 'loginit' buffer contains logs from early GSP-RM init and
+/// exception dumps.  The 'logrm' buffer contains the subsequent logs. Both are
+/// written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
+///
+/// The physical address map for the log buffer is stored in the buffer
+/// itself, starting with offset 1. Offset 0 contains the "put" pointer (pp).
+/// Initially, pp is equal to 0. If the buffer has valid logging data in it,
+/// then pp points to index into the buffer where the next logging entry will
+/// be written. Therefore, the logging data is valid if:
+///   1 <= pp < sizeof(buffer)/sizeof(u64)
+struct LogBuffer(CoherentAllocation<u8>);
+
+impl LogBuffer {
+    fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
+        const NUM_PAGES: usize = RM_LOG_BUFFER_NUM_PAGES;
+
+        let mut obj = Self(CoherentAllocation::<u8>::alloc_coherent(
+            dev,
+            NUM_PAGES * GSP_PAGE_SIZE,
+            GFP_KERNEL | __GFP_ZERO,
+        )?);
+        let ptes = PteArray::<NUM_PAGES>::new(obj.0.dma_handle())?;
+
+        // SAFETY: `obj` has just been created and we are its sole user.
+        unsafe {
+            // Copy the self-mapping PTE at the expected location.
+            obj.0
+                .as_slice_mut(size_of::<u64>(), size_of_val(&ptes))?
+                .copy_from_slice(ptes.as_bytes())
+        };
+
+        Ok(obj)
+    }
+}
+
+impl Gsp {
+    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self, Error>> {
+        let dev = pdev.as_ref();
+        let libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
+            dev,
+            GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+
+        // Initialise the logging structures. The OpenRM equivalents are in:
+        // _kgspInitLibosLoggingStructures (allocates memory for buffers)
+        // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
+        let loginit = LogBuffer::new(dev)?;
+        dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
+        let logintr = LogBuffer::new(dev)?;
+        dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
+        let logrm = LogBuffer::new(dev)?;
+        dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
+
+        Ok(try_pin_init!(Self {
+            libos,
+            loginit,
+            logintr,
+            logrm,
+        }))
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 4aefb7984f25..dc54c9faea7d 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -7,16 +7,20 @@
 
 use core::ops::Range;
 
-use kernel::ptr::Alignable;
+use kernel::dma::CoherentAllocation;
+use kernel::ptr::{Alignable, Alignment};
 use kernel::sizes::SZ_1M;
+use kernel::transmute::{AsBytes, FromBytes};
 
 use crate::gpu::Chipset;
-use crate::gsp;
 use crate::num::{self, FromSafeCast};
 
 /// Dummy type to group methods related to heap parameters for running the GSP firmware.
 pub(crate) struct GspFwHeapParams(());
 
+/// Minimum required alignment for the GSP heap.
+const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
+
 impl GspFwHeapParams {
     /// Returns the amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to
     /// and including the first client subdevice allocation).
@@ -30,7 +34,7 @@ fn base_rm_size(_chipset: Chipset) -> u64 {
     /// Returns the amount of heap memory required to support a single channel allocation.
     fn client_alloc_size() -> u64 {
         u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
-            .align_up(gsp::GSP_HEAP_ALIGNMENT)
+            .align_up(GSP_HEAP_ALIGNMENT)
             .unwrap_or(u64::MAX)
     }
 
@@ -41,7 +45,7 @@ fn management_overhead(fb_size: u64) -> u64 {
 
         u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
             .saturating_mul(fb_size_gb)
-            .align_up(gsp::GSP_HEAP_ALIGNMENT)
+            .align_up(GSP_HEAP_ALIGNMENT)
             .unwrap_or(u64::MAX)
     }
 }
@@ -104,3 +108,58 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
 /// addresses of the GSP bootloader and firmware.
 #[repr(transparent)]
 pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
+
+/// Struct containing the arguments required to pass a memory buffer to the GSP
+/// for use during initialisation.
+///
+/// The GSP only understands 4K pages (GSP_PAGE_SIZE), so even if the kernel is
+/// configured for a larger page size (e.g. 64K pages), we need to give
+/// the GSP an array of 4K pages. Since we only create physically contiguous
+/// buffers the math to calculate the addresses is simple.
+///
+/// The buffers must be a multiple of GSP_PAGE_SIZE.  GSP-RM also currently
+/// ignores the @kind field for LOGINIT, LOGINTR, and LOGRM, but expects the
+/// buffers to be physically contiguous anyway.
+///
+/// The memory allocated for the arguments must remain until the GSP sends the
+/// init_done RPC.
+#[repr(transparent)]
+pub(crate) struct LibosMemoryRegionInitArgument(bindings::LibosMemoryRegionInitArgument);
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for LibosMemoryRegionInitArgument {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for LibosMemoryRegionInitArgument {}
+
+impl LibosMemoryRegionInitArgument {
+    pub(crate) fn new<A: AsBytes + FromBytes>(
+        name: &'static str,
+        obj: &CoherentAllocation<A>,
+    ) -> Self {
+        /// Generates the `ID8` identifier required for some GSP objects.
+        fn id8(name: &str) -> u64 {
+            let mut bytes = [0u8; core::mem::size_of::<u64>()];
+
+            for (c, b) in name.bytes().rev().zip(&mut bytes) {
+                *b = c;
+            }
+
+            u64::from_ne_bytes(bytes)
+        }
+
+        Self(bindings::LibosMemoryRegionInitArgument {
+            id8: id8(name),
+            pa: obj.dma_handle(),
+            size: num::usize_as_u64(obj.size()),
+            kind: num::u32_into_u8::<
+                { bindings::LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS },
+            >(),
+            loc: num::u32_into_u8::<
+                { bindings::LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM },
+            >(),
+            ..Default::default()
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 0407000cca22..6a14cc324391 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -124,3 +124,22 @@ fn default() -> Self {
         }
     }
 }
+pub type LibosAddress = u64_;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_NONE: LibosMemoryRegionKind = 0;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS: LibosMemoryRegionKind = 1;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_RADIX3: LibosMemoryRegionKind = 2;
+pub type LibosMemoryRegionKind = ffi::c_uint;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_NONE: LibosMemoryRegionLoc = 0;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM: LibosMemoryRegionLoc = 1;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_FB: LibosMemoryRegionLoc = 2;
+pub type LibosMemoryRegionLoc = ffi::c_uint;
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct LibosMemoryRegionInitArgument {
+    pub id8: LibosAddress,
+    pub pa: LibosAddress,
+    pub size: LibosAddress,
+    pub kind: u8_,
+    pub loc: u8_,
+    pub __bindgen_padding_0: [u8; 6usize],
+}

-- 
2.51.0

