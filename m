Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6B7AD7177
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 15:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F5610E173;
	Thu, 12 Jun 2025 13:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tqyo5ocX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15E910E173;
 Thu, 12 Jun 2025 13:17:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4JUU7o5NkXNr0IKT+iOsKITGAY1XHuZg2qnUmNk3F2ljJRfaqRzjBmhGaRzJPeOf82yn8dNOcNP7kjIfrttOYzjD0jWMFPwqP5X26tnU+U/7NGF1LMStmB/TxVJDKpbhyzgUf+/+eQP4QIgsaFzy3XJBfNHDYbjFF6KeC7BztzH3sEN94H6h5Rrq0UjUIfWAkxBRupP4qg8YT43GVeUtHBn2Ybze+oy8nUp62eKk0H80t5GSEvEab+eHdRPMCksnwIhfKZY735Lm47liYhRjriaCbFmmWT7F8KxgyDMsxzYJB1kDBfZ6T5LeI8LNSVS+Zp9VnbSL+34woMDjIs6ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fcm/YWa50LLuqeX3NojHdhKZHzebGUk68NUc0XhMyQ=;
 b=BqUzZ7IoWWpEpg8IGvQnnMxboW5ce2CuJPHJywOAj6i9MOjBW91aKNx8s02AFnjO26LeaWB6RYhRwdUca4KUFo0nObeYkRIfIdoBDptDpkRdp700GKtiQrs/P5WAwgRy+z2MS3fHIfvZuunDwT8CLB3Vz9iLAdh+DEIrTyfL6b5kollmZhjq3P61wcn4zs6AHq67PEkbBcd3Lu7zyvR33M4lk0cEw8QRZonUup3gmNOBR+bMsE6swl3gAO4UqhSHm4seXTKwAP3aW9pHV7JqnGppLal5/ZFfZxSbujHc0jAsRwPVy1PW62ik65+3S9rD4WNuXtb/DSY+3Y9I+etROA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fcm/YWa50LLuqeX3NojHdhKZHzebGUk68NUc0XhMyQ=;
 b=tqyo5ocXOhbnz5zEGOaQiXpjizgBX9aiPVpuuqnWKeITLGsIfIPUQJda6xlmPQ9+1y3PK+tA+jHVoWMp40rkZmTYrr3zeXYsiCkbaQAbQo+gjK9684OXJiJBlvBr1pbjixdi+Zmqq9T6gaKuafEMgQvKdqOgk+U0IV/9Q7H9nq6mS6MCuMEewj/0Q5JjWFc+yHzCwua1Dgzbun5SbKYLxAkn3KSwM0VK1tUCQBJwoTjbin6LXsp2bFCS6Sh2TDFj2rsnGOV+cab0ec053e7ArXVUGAUDhN0VZYt57IQDNiyvGXFaQFj85KHhhFfF8GN6V63FTZ99ekcKOwNiaUnZ1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW3PR12MB4460.namprd12.prod.outlook.com (2603:10b6:303:2f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 13:17:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 13:17:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 22:17:01 +0900
Message-Id: <DAKL0KOWUB1G.1DSJPRWFYC43O@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 04/20] rust: add new `num` module with useful integer
 operations
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Benno Lossin" <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
 <DA82KFLNAOG7.R7YT4BHCLNZQ@kernel.org>
 <DA88YHU4AZT7.B8JGZHW9P9L9@nvidia.com>
 <DA8GTD7LT7KO.1A3LBQGEQTCEW@kernel.org>
 <DAC2L6ZKR6U2.WOMERUJIOENK@nvidia.com>
 <DAD9TNUBUGPN.1ED519FYR29U4@kernel.org>
 <DADB6892Z31G.12LB1BVSGTEAQ@nvidia.com>
 <DADKDQ1KGJJP.3T20P9V1D2PO1@kernel.org>
In-Reply-To: <DADKDQ1KGJJP.3T20P9V1D2PO1@kernel.org>
X-ClientProxiedBy: TYAPR01CA0224.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW3PR12MB4460:EE_
X-MS-Office365-Filtering-Correlation-Id: 42b90022-1f3e-4da6-2f07-08dda9b36cdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDRTRUUybUdSVDNjaW4zSHZJZFBwc1g2QmVLaThGMVh2OWhZa2JwMmh3OFlk?=
 =?utf-8?B?MjhKbEFTM1RzTko5Yk1xdGtma0dNR1BnOFVoQmM0c3JIczNFa1ArN3Byc29h?=
 =?utf-8?B?NW90eURDM3c2cHlTb1l2MXhkSis5KzJQNG1INVQxU1QzWXNOZDk3aWx2S3lI?=
 =?utf-8?B?cnFrV01hRGJSMXdqK2NSRmp5ckp1Q2ZmY2xMUE1tV2hHVHVJSU0vTElzMVRy?=
 =?utf-8?B?U2QxcXltS1NtcVJBS2RhY2V0Mjd2K1kvY1Nlc0R1QU5YYk0wNmlOaVptQjBr?=
 =?utf-8?B?SVBLdnpITDJwYnpNQ0VHTmd3eEI2UVYzSFVuQnh4RnlCbVRuUkdkVG1DeGND?=
 =?utf-8?B?eEdiL0dQTTk3N1VpR1dwK0dPSThidm52MEljVHU3ZHRxbG11RW13U20wdnJw?=
 =?utf-8?B?bzJLR0tLaUtqSURnVnBlbkEzeDh0cm1HSWh4UFZISStHdzluK3o3UGQ4S0lP?=
 =?utf-8?B?MjU4KytZdjJVc3JoYzVKbWtsa3JySUNLbGIzMFQ3QmZzTnh1aytHckRydXhR?=
 =?utf-8?B?ek5iMm5Ddk9GcThqZDNYQVBCNWFpN2h4b1RoOU5oN3RGTnR5cXJHaGJzU1Yw?=
 =?utf-8?B?bGhscHd3UzRKNnVNS2hYdkhJYjZhbEtFNHJ4Z1A3Vzg4TVY3ckdHQ0NIQkhk?=
 =?utf-8?B?UzNwKzQvOEczOENCSUFjQ1UvUTV1VnNSM3htZHpQNVJyMlJERUVrSklESHda?=
 =?utf-8?B?b1J2RGo4bFI0dWpyQTYwLzMzeTRjYlJNL2pvb2VPMEVyd2ZZK3Z5a3FOaHJT?=
 =?utf-8?B?S1U2UUhvaWlYTU9XVTdhNmQwOFhIVlczTzJJSHdpaEtkNEFPa3JBWjVSN250?=
 =?utf-8?B?eGFIaEJwankxcXBvLzdYS3pSRytxdW96ejJoZjA2OTRqbWUrczAwdmZNaTRu?=
 =?utf-8?B?S2dYTjFuY1I5bSt4TnIvWjlrbjkxWnhHa3VkeXUwNDcyN2E1Vk1jbEVTWFBw?=
 =?utf-8?B?TFZnTjhRYVdiTFJZbTF6OHFiRlRRa1hlQ2Fra1RjbmJUNnp2R2kyYVp3U1Iv?=
 =?utf-8?B?WHV4QzBpYzRiWWxGaUdoRVRmcGkySG1qdlRlZWtGcy83WXF5VzkxNzFteWM1?=
 =?utf-8?B?blZBUk9KT3kxQ003dmNReU5hRXJEbTdyNVRqTk0wSW44SWpaZ2VRSFFDR2N5?=
 =?utf-8?B?RVRzYkRoZDd1M0ZwcFptRGMvTnlLR1dSeXhJL3ZQaWVkSHl0em8xQytuTEM0?=
 =?utf-8?B?WURiUHhtS2h4aVBJd0hDRlhpamxlazcxR0puNVlQVFM0NXNCVk1kZTdBd2xz?=
 =?utf-8?B?WkxSZG1CcVpXTkFBVy9CeklKV1BHdnI4UzhvVGVwNjlqTVpEVCtsbjE1c2c3?=
 =?utf-8?B?SlptZ2hOTkdsTzA4cGluZ3grOGhueTZJQm40MTVvaWNzT21pQ1d1b2ZjbU5t?=
 =?utf-8?B?ejBkV3ZFTUZVQmFiVGZWcU1tUHVadzNwdmRpUmR3STFGUG1naUJXRm5Wekg3?=
 =?utf-8?B?K1VHUTkxMmxkMVVFS2k5aGh3UkpNVE4yR3NoUStsUW43WFlrZHhGem5ZOWtB?=
 =?utf-8?B?c2hDS2hCMGlWTkQ3VzVmMUgwQVA3VDhPNDRvQ045Z2c2UDBJbEZIMWlCa005?=
 =?utf-8?B?bCtwMkZscm8za1F2MlBra3lKOWlPTEdXeWs2c1B0WTBKbGNNV2JjUW5lcFNB?=
 =?utf-8?B?R3poakxKa2Rrb2VqeVgvcGk1RU5UWUJYekdGbGtlaUQrNG5TRk0rQlNLV1F0?=
 =?utf-8?B?VzB2c1E2YUUxMEdUeVZyMUVtUHNyNDdVL2pSQmhPVzMzVTkzRkhoclFQS0s3?=
 =?utf-8?B?OWhsbnVLYllqd0s4dDBPcWlYaTNJVkxLbnl6aTczYTdtQTVneFV1S05MWU4v?=
 =?utf-8?B?anFKaVBocVk5d21RS0dwYXFWWmgvd01XdEhFcGdMY3pxaXdYQ0h5UzFqZGVo?=
 =?utf-8?B?S2xvSEZWVFh4UnZGNnZNRENHUWtKaFlMV3RLOC9pYm5Lb3R1Wm12RkFhMWVi?=
 =?utf-8?B?SXFtTUJnYllXSzFSN3J5ZDY0Q1lnOURLZHZVL0FWNi9KT0hSN1JpQkJZd1Ev?=
 =?utf-8?B?RDg3bWRpWXJ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzdrdC9aS2h0YXhBb2VILzlqN3VUTG9hT1FNVkVpVkpraENjOFRCbGJhNjhE?=
 =?utf-8?B?dHVGRFRwTXJFQm1MdFRRdFVtRDZRaE5QRi9FL1pzejk1S09vNHJQVUFGYTNS?=
 =?utf-8?B?K2drdUdBTXo2ZGtGbFBIS0p0YVBaaWIwVXJvUTVOTE82cVBXQ3pUN1k3TEQy?=
 =?utf-8?B?L3BQK1RUaGZZaVFObW55ajJMd1RaOTIxVGpha3A3Qi9oTDRWdlgwUzBYZVZs?=
 =?utf-8?B?MlZ1SFlhVFk0c0s1ZmVLWEhIOWlVWExYQ2MzeTlacmFxd0owMTRLTTdJRXF1?=
 =?utf-8?B?cFcxZ1NYWmkwNDIvcTczUFR3M1lTb3A1dVkzRS9Qd1dXVGhjdm9MUWtBTUFt?=
 =?utf-8?B?QjVFNG1vKzBuYkNBNk10dlZhSzRiL2RTcWlrZTlwTW1RQzZNbTkvS2F2Q1g0?=
 =?utf-8?B?dmhPRFlEbExPNWF4UXo5Qi9XRE1NNkh2Q2dkbFJTOVN6Q1pVQ0ZEc24wSGV1?=
 =?utf-8?B?aHZiTWpMZDV4eEp0N2c4bm5tTUpWWDZFeURMOThqOExlcXBPOGN1MUtiYVlw?=
 =?utf-8?B?bU5MNGVDRmg5RkNoWmlVTS8wc25qZ1VjWDV4emNKMTN2RVB1MmJTOFlCWEpR?=
 =?utf-8?B?dDRUeWRiVmFSdmw5WnNBaExMMWppSCsrRTJ6UVg0N29RRnY1d3p3TVZBUzhW?=
 =?utf-8?B?WW9NNDRRYVhpVWVRbjJWYUc2Q0tURVhPQ1prUU9QVFVDNko3MTVzQ09VRkhO?=
 =?utf-8?B?Y2hMdit3T2Fkb1o0bzlYeVBIUitMT3lxV0h2eFZFSktSQ1JsSGR0REVUclo5?=
 =?utf-8?B?alAwREVibXJia0JUOVQxK21mTHFNekVuT1BTNWg2Zml4czdwSURZa0tGZVk0?=
 =?utf-8?B?RU1ZK0RsaU9mSkgzaGdsTVFER1lzS2cwbC9LVWJZTVZlbTFpWnkyTVRHa1Ex?=
 =?utf-8?B?RlZqQ2o4aVAvd0xwY0pDN1REWTlXUXB3bUpYOExPRmFmVWhnOXpLZ0pVMG5a?=
 =?utf-8?B?QmZqMXZlRyswRTdIVnR2Uy8rRXVWeWp5V3RGYlp6dDd0cUVldHFLTnd2ZXp2?=
 =?utf-8?B?enlzdUt1aGtYQSt6WDFvc2JtZ3RKSnV5SnNMcVFKTWdKRGNycFNEa2VjTU03?=
 =?utf-8?B?bHI0YkFUbkp2Y3AvY01lbHNGbzBEMFBQcDM0c2d4K2hkYlpvREswMWNPN20z?=
 =?utf-8?B?TGVWNFdzaWhGWndEUExlRTlDK2t1cUIxa1Vsb0ZNM1NuN01mclpQdWNxZXZV?=
 =?utf-8?B?R05ERk1FMkVvNnBIcXlnOFJ0SUdBNHFaa2IwREZQbHEwMVNYbFl3WVl3OUph?=
 =?utf-8?B?VjlHNCt6ZE50WXQ0R21VK1FBNlJDL2V4Ny84UEo0cGVwVTVXVlprYWMycUtP?=
 =?utf-8?B?L2QyNTBtS2tKbUxQUTFGUVc2YkY1UWc4ZDJhWXRreUhDSjc2Q2F1akNJTnpy?=
 =?utf-8?B?S1VhWUkzenNseUJoa25jVWJBcitBeVpCTTdjYkh4TlZMSnpuandOM1NrOCty?=
 =?utf-8?B?d0xTemJidjdkOHc0cURIMklueXNFRkJmWG54S1dEMEYvSm9MYUdYNGFGYUJW?=
 =?utf-8?B?cHhoMkZTbGgya0FRNU1udnJNc2dJeXJKZ2VVOE40Z25qMjErK21DTEpIUFFr?=
 =?utf-8?B?bUR2VzNXaUtYaWtCcmkwUnorNEtrdHIrM2ZrRFdpRUw3c0tRalUxcHFZcGRw?=
 =?utf-8?B?dnpsOVNzYmxJU0l4ejU2WlE5TGdwOFR6cjVmT1hkVjc3RithTWdxTFFiMkdB?=
 =?utf-8?B?U2Y3eU1DZEpMeldoV2R3T05PS2FsT2JJNHgyWmJMUnovLzh3WDd5di9BZ2pz?=
 =?utf-8?B?eC9OUmpabCtBM2JKSTl5MjZwdDQ2YU12YzVnYjgyTzJDMUVJdWpFK0JFbUFG?=
 =?utf-8?B?YVY2ajR1aUg0Q29MVEY0ZmV2ZllnODNac3lRZXdDZUxjanYvMURqSXEvcnNn?=
 =?utf-8?B?MVZ3Qy8xTmp4WVlNdmpPQjBRd3VzTXBSaVpnM2dHdXdYWlhwWVhBL0tZZzhl?=
 =?utf-8?B?U1didmNhYlpLREkxOVVCVlM5TW5pSlFPNVdBR1RUV0pTeEVBa1M2RjlKQ2FZ?=
 =?utf-8?B?a3BKU1NkQlRWNTQra2xGNEZhMFFGcnhxanhHYXBZRUZMZHlGZ3k0aHlTbVFX?=
 =?utf-8?B?bUhhbGN4bmw1blZlUE5tc2EzY3l3OUNrUk1NU0Rnc1F6YTlMQWtOSE5WU2JY?=
 =?utf-8?B?RHlqZWlIUEF4OU0rbXg1WHdraHphWnRIbFY4WDQybytqb21DNlRLb2dBT0Zt?=
 =?utf-8?Q?Wdiklg+f1VXPa4fbNCj/AHxGFtjnUuMyjPsw8nNo3REH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b90022-1f3e-4da6-2f07-08dda9b36cdd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 13:17:04.9243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Q2lfSBcQTtBmkNk0tgtDgeTdqWv1i7duStT/tuaGPzSNDqtXVtiTqoBEfZMWXjghAkvo1gwqGv/TtufkZmWhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4460
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

On Wed Jun 4, 2025 at 4:18 PM JST, Benno Lossin wrote:
> On Wed Jun 4, 2025 at 2:05 AM CEST, Alexandre Courbot wrote:
>> On Wed Jun 4, 2025 at 8:02 AM JST, Benno Lossin wrote:
>>> On Mon Jun 2, 2025 at 3:09 PM CEST, Alexandre Courbot wrote:
>>>> On Thu May 29, 2025 at 4:27 PM JST, Benno Lossin wrote:
>>>>> On Thu May 29, 2025 at 3:18 AM CEST, Alexandre Courbot wrote:
>>>>>> On Thu May 29, 2025 at 5:17 AM JST, Benno Lossin wrote:
>>>>>>> On Wed May 21, 2025 at 8:44 AM CEST, Alexandre Courbot wrote:
>>>>>>>> +    /// Align `self` up to `alignment`.
>>>>>>>> +    ///
>>>>>>>> +    /// `alignment` must be a power of 2 for accurate results.
>>>>>>>> +    ///
>>>>>>>> +    /// Wraps around to `0` if the requested alignment pushes the=
 result above the type's limits.
>>>>>>>> +    ///
>>>>>>>> +    /// # Examples
>>>>>>>> +    ///
>>>>>>>> +    /// ```
>>>>>>>> +    /// use kernel::num::NumExt;
>>>>>>>> +    ///
>>>>>>>> +    /// assert_eq!(0x4fffu32.align_up(0x1000), 0x5000);
>>>>>>>> +    /// assert_eq!(0x4000u32.align_up(0x1000), 0x4000);
>>>>>>>> +    /// assert_eq!(0x0u32.align_up(0x1000), 0x0);
>>>>>>>> +    /// assert_eq!(0xffffu16.align_up(0x100), 0x0);
>>>>>>>> +    /// assert_eq!(0x4fffu32.align_up(0x0), 0x0);
>>>>>>>> +    /// ```
>>>>>>>> +    fn align_up(self, alignment: Self) -> Self;
>>>>>>>
>>>>>>> Isn't this `next_multiple_of` [1] (it also allows non power of 2
>>>>>>> inputs).
>>>>>>>
>>>>>>> [1]: https://doc.rust-lang.org/std/primitive.u32.html#method.next_m=
ultiple_of
>>>>>>
>>>>>> It is, however the fact that `next_multiple_of` works with non power=
s of
>>>>>> two also means it needs to perform a modulo operation. That operatio=
n
>>>>>> might well be optimized away by the compiler, but ACAICT we have no =
way
>>>>>> of proving it will always be the case, hence the always-optimal
>>>>>> implementation here.
>>>>>
>>>>> When you use a power of 2 constant, then I'm very sure that it will g=
et
>>>>> optimized [1]. Even with non-powers of 2, you don't get a division [2=
].
>>>>> If you find some code that is not optimized, then sure add a custom
>>>>> function.
>>>>>
>>>>> [1]: https://godbolt.org/z/57M9e36T3
>>>>> [2]: https://godbolt.org/z/9P4P8zExh
>>>>
>>>> That's impressive and would definitely work well with a constant. But
>>>> when the value is not known at compile-time, the division does occur
>>>> unfortunately: https://godbolt.org/z/WK1bPMeEx
>>>>
>>>> So I think we will still need a kernel-optimized version of these
>>>> alignment functions.
>>>
>>> Hmm what exactly is the use-case for a variable align amount? Could you
>>> store it in const generics?
>>
>> Say you have an IOMMU with support for different pages sizes, the size
>> of a particular page can be decided at runtime.
>>
>>>
>>> If not, there are also these two variants that are more efficient:
>>>
>>> * option: https://godbolt.org/z/ecnb19zaM
>>> * unsafe: https://godbolt.org/z/EqTaGov71
>>>
>>> So if the compiler can infer it from context it still optimizes it :)
>>
>> I think the `Option` (and subsequent `unwrap`) is something we want to
>> avoid on such a common operation.
>
> Makes sense.
>
>>> But yeah to be extra sure, you need your version. By the way, what
>>> happens if `align` is not a power of 2 in your version?
>>
>> It will just return `(self + (self - 1)) & (alignment - 1)`, which will
>> likely be a value you don't want.
>
> So wouldn't it be better to make users validate that they gave a
> power-of-2 alignment?
>
>> So yes, for this particular operation we would prefer to only use powers
>> of 2 as inputs - if we can ensure that then it solves most of our
>> problems (can use `next_multiple_of`, no `Option`, etc).
>>
>> Maybe we can introduce a new integer type that, similarly to `NonZero`,
>> guarantees that the value it stores is a power of 2? Users with const
>> values (90+% of uses) won't see any difference, and if working with a
>> runtime-generated value we will want to validate it anyway...
>
> I like this idea. But it will mean that we have to have a custom
> function that is either standalone and const or in an extension trait :(
> But for this one we can use the name `align_up` :)
>
> Here is a cool idea for the implementation: https://godbolt.org/z/x6navM5=
WK

Yeah that's close to what I had in mind. Actually, we can also define
`align_up` and `align_down` within this new type, and these methods can
now be const since they are not implemented via a trait!
