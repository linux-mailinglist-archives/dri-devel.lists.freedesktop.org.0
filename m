Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DF2AD71D8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 15:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C96E10E396;
	Thu, 12 Jun 2025 13:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EFYEw8Mi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F182410E3E4;
 Thu, 12 Jun 2025 13:27:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cv3dthQn4HI4EHS05XIFnxXyA3makI5pA0IY6GqznR5Iwuln8fuwbwC2cbldXS01l2j/OCYA0sXOW21UdOPHmpxbm2yzHqLXIUsdvDuZ/z0xHpjtDZJ6bnqA2dbo6YvEfJcIXq9tBosSF5W7QogidIV/eGvypnPX7zWR/adfRNeHm9HnMYhf5IDmcUKIGrdtiqPFzfwUS4cUMQLlXVc5TToMLt8CzLBDfLJrc43sMZcb3Caj+29fGvrMDQFsHW/ZOjKiwelfx6wbyR84/GSvjSpXMY2JQte00oySeNev7bYOs5RcS87+yVg+t+hoiPTWKC1gnizWSiLxyaa3a+NvPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VPAvhiIkV0jkG6liVl8GmsavWeXYFmVGvwWUA+Gx9Q=;
 b=dfkyw5RIRASQQgjNSAvKxndQsEnwiEBst8EjkJ3RxyX6BEVSQQ2z6C67V3roYL1gVHCsjY6zj9t6DtSIxeWI+j9PCdfR6jB43z5xbAKWJ9FRURrqaN0armPF4u/W9i3t5kzRbiICqECT/G/QcjR6MOp75p6UDxv9oU0zdOCy/8dKVUbREOQEw08F7hyb+ZIk0wtFCBLX9y4xxQ0zMGye6rxOiluce1h5Ae3/IqaHQNkw1pIOPnsqryb3BOIieb7bzM5S/7KMV3UePNU9JejUulmoiKSiJZCRt23WL3V/1jG5HVdQU+wqK0Pj6N2G+qy4W4yPBGlEFB1ywNUv7IwcVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VPAvhiIkV0jkG6liVl8GmsavWeXYFmVGvwWUA+Gx9Q=;
 b=EFYEw8MiYqMI0lWHkDLJkf4DEVZIkxcJ5vqoqLhccanwdsZ32bsrJvTwL8NsSj5+C3y0EKnil5mRVscehSxypAOQtPXpXivz0d6QiXLU6cuDggtZkYfhXOJK7hANIIMIXDnXf2YzI/Q3cF19426DqzHpNtPBSpU+lpWJ7/cY8sLAaZKOk1Y/+n6s+WfQNS65UkgJTDgu6Gi51MkzR9tCtiaibSoEysHaYQm+tCS+9Zuhr8UQyeSLOUzfgl+DNV43Fh6ATZhJc3BGdncJrvhdbxZJqxWeJArXbNGB/wI4BNr6AsjuUNaJOXkJQVqzV4f/l9SYKjCI9WQvgYe05tcBGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB7101.namprd12.prod.outlook.com (2603:10b6:806:29d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 12 Jun
 2025 13:27:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 13:27:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 22:27:35 +0900
Message-Id: <DAKL8NQBUGH5.Y8YJIAYDWL3F@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Benno Lossin"
 <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 04/20] rust: add new `num` module with useful integer
 operations
From: "Alexandre Courbot" <acourbot@nvidia.com>
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
 <DAKL0KOWUB1G.1DSJPRWFYC43O@nvidia.com>
In-Reply-To: <DAKL0KOWUB1G.1DSJPRWFYC43O@nvidia.com>
X-ClientProxiedBy: TYAPR01CA0011.jpnprd01.prod.outlook.com (2603:1096:404::23)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: fee79c6f-c705-4710-2126-08dda9b4e6bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHJwOWp4S0RtYUx5elpqYlZ4YWhRQ1lFKzlZSUlKYSt5NHJJTFlmWjJLM0ti?=
 =?utf-8?B?RnV2THJ5RGFQYkdBSjJGc1NyTWFrb3ZOZzJYT1NOOUtmTmxsclFzV0krekgw?=
 =?utf-8?B?bzkxRFpxTkxJMFdlSk00VDJYeWIzMnF2eWlpbGJ1ZE1wOTd0OTFmWGMxdHQy?=
 =?utf-8?B?emR6WHdzaVZZVVhzRDVzdmlYWE94aW16cEVWYkNDVHg1anRJcWRpc1BiS0hH?=
 =?utf-8?B?S0t3V3RySnJ4Wmc2S3FkTzJDNzhWanl5S21WenFlclBBRUNNVUN2bktBRWli?=
 =?utf-8?B?Mng1T1EvL0ZNVjRJdWsrS0N2Tks2U2xHOEJyNjA1Y2VlQy9RcDF4azRVMVJN?=
 =?utf-8?B?YndTd2U2d0tPb0JCbDg5blovYXZONk5uTzZBWWk2eFJYZTFvUlhnWG5Qc2pi?=
 =?utf-8?B?K1NOVWdkc2dmbHkvT3lkRGdmYzZmZVJHMDFtQXRJTFZSekhUTnQvN0dmaVJo?=
 =?utf-8?B?eldvNjAwTitUcmtrTitqKzM1Z1NleFRjMnpPR29Bb1p4M3d2S1FjcGtpbHFk?=
 =?utf-8?B?MkoyWWp5MUVUK1ZqN3NQOXhpZytGMTc4L1RIaW9XRndXQjFDUjRqS0ZXWTdu?=
 =?utf-8?B?NVRsNlVaS0ZCVHNjaGdENVpEVUVYcWxoZHRxN0dmaFFZdUQ3Ym5xV0I3Q2Rk?=
 =?utf-8?B?OWJCd2NOcWYreVVOblp6ME5ZZDg2cnEwOFV1aFhJWXZHbklwNEs3R016b1B6?=
 =?utf-8?B?L2Vub0FOS0RiR0dieFVxV0VFcGRVR2YvaGM5TjZRcVVnNXJ1Ni9rdVFWMDE5?=
 =?utf-8?B?WXJ5MmRhSHpxRktTUXJmTzlRVTkrdnpSUzVjVGlaeHQycEw1b1Q4L0xxZWt1?=
 =?utf-8?B?T0xMNHJjQ1hLbTVTMURaMXFBdEFmYnRVWVBsS3ZBanJTWVVnNEphRzZxNVVV?=
 =?utf-8?B?VnBiTmJvQjdkN1R5S0xoeTFhbk1lUXlWWG9SU2ZCcGxuQWhlZlh4SDdQTG9G?=
 =?utf-8?B?aFVIQitPclpVWTYwRUgvWFpib3pSUXY0Qm0zZjRkS2N2Zi9qYURseTh2aEhY?=
 =?utf-8?B?Q1E4Ym1SODZVOTVqVjBZaHpPQXNCRDVUQ2VCcExZdXQ3ZFVBZDlRTTh1ZEx1?=
 =?utf-8?B?T1NjSmkveWg2MnhMMkZFMnFpZ3lSTFBZNHg0US9xV0JPbkxycHhRWlZsY1JZ?=
 =?utf-8?B?SmxENnN0d2xoa2pqbjg5Y2FaQW5QZC9USG9BZDg2NmFlQTllNTRYN2NkcFl4?=
 =?utf-8?B?a2ZVUFdvUWduR2JtMGxpdi96bWdpVmIycVhzekJsWXRqWGtlcWs4c3RPYjNt?=
 =?utf-8?B?WDVUT0NjSCtRSVh2V2RSd0tMTDIzMUNOand4NENXTGhDeURnajduTi83N2Va?=
 =?utf-8?B?VlFEenlaamlPNldTTXdValFIWHd0aTdOVjJDYVMrcFlPSE9VWGI2RzNMRkZY?=
 =?utf-8?B?aVR0WjNJMVBVTVdNRmJoRW1IVS9aUUlqTE1nSmM4bXJzeFdSRHRYV2hGWXRt?=
 =?utf-8?B?Qkk1amNIS1d1OHM3ZDc2MGZYSWZmeDVSNGY3ME1IK1BIbDJkV0s2TEp6d2N2?=
 =?utf-8?B?M2NOdWRMWFNhcW5ZcUtCQk5kcVg1ekFTUzRKQ0NGM3c1ZE9VcGwvczByQjdL?=
 =?utf-8?B?a1VTakp3SGlLa0NkYzNOWlN2N2FXTHR1WmxkMk9lZUpRTUdSWU5kWXloVytH?=
 =?utf-8?B?YlNMaDF2eGtaenNldSt0bUt4Yit2VlRBWEFpaUMzdm9zTXZCdDY3QldLYUxD?=
 =?utf-8?B?TlB3ZW40VFZ2M3VZeHNtclB6NkNweW9FTmV1dWFzS1ZEUUpUNVFvYys5RURH?=
 =?utf-8?B?RXZEZGFPZytqYkZ4Ulh2K1VPbEFpeWZ0SzhwYmJ0WEl0cDc3MjFiQ2hqZFVw?=
 =?utf-8?B?aHVXOXhQK2VGOXE4ZUdNRWM1WTR5U0pTb2g2d3MrSy83YkVmNzU5dHNmTmcx?=
 =?utf-8?B?c1YwMG4ydDlYZllxSkZzSkRXRWI3ZTBLYWswS2hnZURGWUlFN1pnWjE3N1hi?=
 =?utf-8?B?bDBwZEw0N2dCa2h1SU04QmU5MG1JSzJWNFJGTFNCYU9mVzAxMzNibExvOXRm?=
 =?utf-8?B?aGJGK2cwYldBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2RnamJSRUlyVllBZjArcWxyQlROYlRUYm15azBFaGpIWkhWUjZpb21PSDZY?=
 =?utf-8?B?RnVaNmNTdXpUWjZuYnJJU3luSEZ4MVZNeHN6UlB3UUVEOENSV3lXM2hrdGd3?=
 =?utf-8?B?VERGNDZ6UnhxU0NJbGdubWtpbjFDWVkxNmJYZXQyVlI2QW5JSi9IV1JmL1I5?=
 =?utf-8?B?Mm90c0tRQmtkTWpNYVprUm9Ua2R4dVEzbGNJL3RmbkFBR2w1OWFIbGY3c3BC?=
 =?utf-8?B?K3FxNlk4RmEzSmpPNTJDYVhaRWNBVHlFNWx5eGw2NS9ZbWh6aUdjY0c2TnJD?=
 =?utf-8?B?Rk5Bd3RwT3hpUnNmY0hHWk81cTQxczE1SmRaWC9Gdmc2Wm0vWGlORVFGT0xt?=
 =?utf-8?B?WVdtTlU2T0dlLzZwMHk1a3VOeFNLR2RXMWdUQ0dyTE1naitZY3JCREQyOFJR?=
 =?utf-8?B?dHJ4Vk9ROEI3UWl1ZitDZERHK1RNNlQxa2VNTlN6UFgvQ3hyTlk5aHNXaVZp?=
 =?utf-8?B?dFhPcXU5TXZKa3dZd084d3Q0NFVTaW00dDh2VXdxZFkrUjFIbUs2Ym8xZmRJ?=
 =?utf-8?B?ZUlBUlpxdVhabDJLbDhoYk91S3EzM0ZvNEFkOU82THRWR28wdmk3cDhtZm51?=
 =?utf-8?B?VWY5K0Z5QTgzRFlBRUdzZnhnR3FPMnRiUk12UTFwS3ZzNGNHL0hudFlLVmVo?=
 =?utf-8?B?UjB2QUMveGxIb3FFL3pJZjZ3R3Q1WFdocVZ4dmR0QmRib0lGS1dwRW90dlJP?=
 =?utf-8?B?bEhDVkVSYW9zazVrYVVWZHg0cHI0c0pobHFRZmhmcC9hYUVjYVRxNm9GcTVM?=
 =?utf-8?B?cmFoNnZ0WXgvbVo4OThyMzlqYVNoUGhmd0VnQW4vSi9IaGJUUEhINklKaXY5?=
 =?utf-8?B?Uk43V0JlN0EzTDd1eEdwMWlLSEZ6bWFGL2U1bmVzTFhtV2trNzczSmY0M29P?=
 =?utf-8?B?c01pa0F0NzVOUEZPWkI3YThuV3BiTkw4YXVaSGJ0VE80ZVhqSS9TU0ZWdTNH?=
 =?utf-8?B?QzNXcTRGNWhrOEJYU3hDVllpS09oSC9pY1ZMemg4ZWpSdFZ0a1EyYUIzVmg4?=
 =?utf-8?B?akJXVnpGK2d5SDYyNUtyNlhwZkZrRENUYTlJWHBWbGFRSWdsWHJuQnJoVXNo?=
 =?utf-8?B?ZHpyZ01SSkRXczBsdHd0V3Z3SDVGL0lvdUlRRm44N09uczZxSjFwWmVZMGJS?=
 =?utf-8?B?Z01GR2lBR2ZUdlRhZEhyb1EvVTFsWko3SmYvanpSdTlRUi9zUlQ4Y1pOckNW?=
 =?utf-8?B?YzFkZTJYMUQ2eTdLRnRxdnNDeGxvNDNGdmc4VjNPM1l2UXhzRXd0UER6TzlL?=
 =?utf-8?B?alBrcnlBdHZRZU1wa1JDQlk1MUNNRlJCcUJ1ZUxoaElQK0Y4L1pCQWQ3MnRE?=
 =?utf-8?B?eXJCZW9ySkxTVVpFajZMcmJQZ0lReWtKTkVoQ1dCaW9IMUI4VjgxUnY0aVFh?=
 =?utf-8?B?Q3NkeTFrVlJ5bWIycTZDSzIyNi92aGVIeTVtOVkzZTZaT3FxenZ3ZkVuUGJa?=
 =?utf-8?B?Zy8weWltTHBGT3MrTUUrb2owWEdwdFJ5c2xpajhWdVovV2YvbHc5cStGekFh?=
 =?utf-8?B?M0w5K0JLZ1RmWjViOUIrL1psVGczeXJ1aDAzREkxMEJHOVVQU3AxaFZtZm9k?=
 =?utf-8?B?N3VXTGhaclRhWEQvcjBleE9LcVF2K3k3ZlpDY2Zka29RTEFIMWtML1ROSzR4?=
 =?utf-8?B?cVZXVVNNSGdtSjRqRU1FdnVvTEo0RnZpY0xheVZZZHVqMVlJaUhVRzVEd1pD?=
 =?utf-8?B?ZklOK0lYeWoraVBWd2lPVkgxc3dGT1oveFoyczlvRDRXZGs1bkhtdjhoNUVa?=
 =?utf-8?B?UVA2MTlUKzB6c3RmTktGZndjazVPZElFOTh3T1ByVmtHZXM1QkVPNXJaak1U?=
 =?utf-8?B?eDJpU0tTd1M3TnlGLzQ5WnVEY3oxRmtwSnU2UEV2ZGpBTFpDYzFURHVWWTF0?=
 =?utf-8?B?R2cvNXdjVlQ0S3ZjSDhEN0U3MTZqOFhieEVrU2RxbjRrL20veHRiOVlDWjNM?=
 =?utf-8?B?VEh6c1ZrZm9zRm9GRTFzeXJ1ZE9OcjV5cnpvOXIxNmkzMmFDaXJIbk1JVWtq?=
 =?utf-8?B?dnI0WHIzMmNrdEh1SW8vWW1yUHJHQ2FxVVVpNzlLbVhBVDdvL0JhTHNDclhB?=
 =?utf-8?B?WnpLR043Vll5dTV6U3pKYzVybGtkUGVjVGROWEFNOEFOL3JWcjd2alNNSWdv?=
 =?utf-8?B?R2o1cVVGM3FBZHVxU3BTRy9LUHBweTEwMlY3TjE3Y1J6elVRcWRZZnNPeWxV?=
 =?utf-8?Q?wvqz0U40yk47/67SPzF5sAbC1PMPFHXz+qFdUis0+ovn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee79c6f-c705-4710-2126-08dda9b4e6bf
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 13:27:39.1833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14DK0mrDDPTWzIfrEQgpjUJ3fXMJzMPhl9qp0ILYy1HTYfc1Tz1ZJ/lYWjjjOyy7dlbIXGaE+aEi3NueGDDclw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7101
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

On Thu Jun 12, 2025 at 10:17 PM JST, Alexandre Courbot wrote:
> On Wed Jun 4, 2025 at 4:18 PM JST, Benno Lossin wrote:
>> On Wed Jun 4, 2025 at 2:05 AM CEST, Alexandre Courbot wrote:
>>> On Wed Jun 4, 2025 at 8:02 AM JST, Benno Lossin wrote:
>>>> On Mon Jun 2, 2025 at 3:09 PM CEST, Alexandre Courbot wrote:
>>>>> On Thu May 29, 2025 at 4:27 PM JST, Benno Lossin wrote:
>>>>>> On Thu May 29, 2025 at 3:18 AM CEST, Alexandre Courbot wrote:
>>>>>>> On Thu May 29, 2025 at 5:17 AM JST, Benno Lossin wrote:
>>>>>>>> On Wed May 21, 2025 at 8:44 AM CEST, Alexandre Courbot wrote:
>>>>>>>>> +    /// Align `self` up to `alignment`.
>>>>>>>>> +    ///
>>>>>>>>> +    /// `alignment` must be a power of 2 for accurate results.
>>>>>>>>> +    ///
>>>>>>>>> +    /// Wraps around to `0` if the requested alignment pushes th=
e result above the type's limits.
>>>>>>>>> +    ///
>>>>>>>>> +    /// # Examples
>>>>>>>>> +    ///
>>>>>>>>> +    /// ```
>>>>>>>>> +    /// use kernel::num::NumExt;
>>>>>>>>> +    ///
>>>>>>>>> +    /// assert_eq!(0x4fffu32.align_up(0x1000), 0x5000);
>>>>>>>>> +    /// assert_eq!(0x4000u32.align_up(0x1000), 0x4000);
>>>>>>>>> +    /// assert_eq!(0x0u32.align_up(0x1000), 0x0);
>>>>>>>>> +    /// assert_eq!(0xffffu16.align_up(0x100), 0x0);
>>>>>>>>> +    /// assert_eq!(0x4fffu32.align_up(0x0), 0x0);
>>>>>>>>> +    /// ```
>>>>>>>>> +    fn align_up(self, alignment: Self) -> Self;
>>>>>>>>
>>>>>>>> Isn't this `next_multiple_of` [1] (it also allows non power of 2
>>>>>>>> inputs).
>>>>>>>>
>>>>>>>> [1]: https://doc.rust-lang.org/std/primitive.u32.html#method.next_=
multiple_of
>>>>>>>
>>>>>>> It is, however the fact that `next_multiple_of` works with non powe=
rs of
>>>>>>> two also means it needs to perform a modulo operation. That operati=
on
>>>>>>> might well be optimized away by the compiler, but ACAICT we have no=
 way
>>>>>>> of proving it will always be the case, hence the always-optimal
>>>>>>> implementation here.
>>>>>>
>>>>>> When you use a power of 2 constant, then I'm very sure that it will =
get
>>>>>> optimized [1]. Even with non-powers of 2, you don't get a division [=
2].
>>>>>> If you find some code that is not optimized, then sure add a custom
>>>>>> function.
>>>>>>
>>>>>> [1]: https://godbolt.org/z/57M9e36T3
>>>>>> [2]: https://godbolt.org/z/9P4P8zExh
>>>>>
>>>>> That's impressive and would definitely work well with a constant. But
>>>>> when the value is not known at compile-time, the division does occur
>>>>> unfortunately: https://godbolt.org/z/WK1bPMeEx
>>>>>
>>>>> So I think we will still need a kernel-optimized version of these
>>>>> alignment functions.
>>>>
>>>> Hmm what exactly is the use-case for a variable align amount? Could yo=
u
>>>> store it in const generics?
>>>
>>> Say you have an IOMMU with support for different pages sizes, the size
>>> of a particular page can be decided at runtime.
>>>
>>>>
>>>> If not, there are also these two variants that are more efficient:
>>>>
>>>> * option: https://godbolt.org/z/ecnb19zaM
>>>> * unsafe: https://godbolt.org/z/EqTaGov71
>>>>
>>>> So if the compiler can infer it from context it still optimizes it :)
>>>
>>> I think the `Option` (and subsequent `unwrap`) is something we want to
>>> avoid on such a common operation.
>>
>> Makes sense.
>>
>>>> But yeah to be extra sure, you need your version. By the way, what
>>>> happens if `align` is not a power of 2 in your version?
>>>
>>> It will just return `(self + (self - 1)) & (alignment - 1)`, which will
>>> likely be a value you don't want.
>>
>> So wouldn't it be better to make users validate that they gave a
>> power-of-2 alignment?
>>
>>> So yes, for this particular operation we would prefer to only use power=
s
>>> of 2 as inputs - if we can ensure that then it solves most of our
>>> problems (can use `next_multiple_of`, no `Option`, etc).
>>>
>>> Maybe we can introduce a new integer type that, similarly to `NonZero`,
>>> guarantees that the value it stores is a power of 2? Users with const
>>> values (90+% of uses) won't see any difference, and if working with a
>>> runtime-generated value we will want to validate it anyway...
>>
>> I like this idea. But it will mean that we have to have a custom
>> function that is either standalone and const or in an extension trait :(
>> But for this one we can use the name `align_up` :)
>>
>> Here is a cool idea for the implementation: https://godbolt.org/z/x6navM=
5WK
>
> Yeah that's close to what I had in mind.

... with one difference though: I would like to avoid the use of
`unsafe` for something so basic, so the implementation is close to the C
one (using masks and logical operations). I think it's a great
demonstration of the compiler's abilities that we can generate an
always-optimized version of `next_multiple_of`, but for our use-case it
feels like jumping through hoops just to show that we can jump through
these hoops. I'll reconsider if there is pushback on v5 though. :)
