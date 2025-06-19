Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3DFAE0708
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A5810EA48;
	Thu, 19 Jun 2025 13:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gTMlPaG1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2074.outbound.protection.outlook.com [40.107.101.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B037E10EA45;
 Thu, 19 Jun 2025 13:25:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnxUObbgnCD/+LDiqqziTFnk96JOYrdvss6308MwPj1PiRtDN80JDXIHBC8/WoMhXp7Qv3GjK/3GY8n+PjG2X8KM2yX0VUIvd0YmYkXDrbfXWnvmXP1jkFtto5wGVoe7NBAYwM7aTD04hZtY0YQGexA+6WG84H+s1Ll9GB5qD/V+rN04Tn9yt1S3oeBSQU2BpDDvVeaiD/VOQjPW+Clt2sy/XcCoAE1IV5ixqNDZThy9VKcrfmMok+2V5CWoMFKLePNkz4IkPv/IlsXRDkrpH1Y7TFRXagbVGnsGUaVVg5fpJh4u3zUPS23c2JuhfLAW4dLhfqIvKOAHIC7XrwSbog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6yTjpDroaT5nGI0XT2eUccaJm8x7UTxPF6Wr0TULYg=;
 b=FXnpsWxtM8aIfG2sBL63rypduop0GM/SfPaScvi/byj7Ipng7RXFXt2txXu1OQ91rgo5wN79NQK4kIqgQ2yi8j6WZA50mywoUOH+k/6IRmreuJThMfPE/YMxgNBPhi5ar79P/bKXMQTUmTYDnpRUSFGYxrJEZRWa93mUYgbeGUPFQ79W+5tHygkv/Or6k62S7O3yLglZrcPC1NGloWzOo1BRD+ZzSlQGzeb+27cN46us6sfl53W4czGEpQoCaV44ngdyU7OefA6YHcGec7cYlwmEF9uMypvADG30JN3JJ84OiNxq0tKzgd0GS3Iu7Z9tqLuOu3qgTWuMQwlBIP0tKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6yTjpDroaT5nGI0XT2eUccaJm8x7UTxPF6Wr0TULYg=;
 b=gTMlPaG1vXW07XV78MFWBET9SSJqxihbaEJY89IWxnAB8TIGidw8uZly3A5Kw4C+2cVXRnLKk8jKFJBg/OWNrL+7MBgS+iTBog0e16VbNRbhyHkjIzyIfIaR3iVE9+VbvW3ESk+rvXBGnplS+mesYHlKqtinioNCkTgJYdo8u2uKRdEFXep5MwQW4+N0dVhFQPWGpqXPAL2y/5zSpTfqaPAI59Z76Qlbhb7Tb7lQffamc/WKJ4t8XAGCHxEFK81SAoy2GXXDEIRBDvjPIaRJ5NPdjHSL3bhwN1Tp/2mUtuo0MdHwdd8e8T8OIBmPUcK/T1Cqz8XFbnC41x7fv64KUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8122.namprd12.prod.outlook.com (2603:10b6:510:2b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 13:25:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:25:05 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:23:55 +0900
Subject: [PATCH v6 11/24] gpu: nova-core: add helper function to wait on
 condition
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-11-ecf41ef99252@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP301CA0069.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 810aaaa6-5f6c-4c92-b020-08ddaf34b465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016|921020|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUhLZGEyckRMb1pCUkl5dVRwMUR1OG9mQnhUci9kSjRkeTJZR3lYTGFkQkZI?=
 =?utf-8?B?TDlpRmV5K0t6cEdMZ1hLWHBJNjlDVExaam9LbEpYWFB2M2k1R21rTWNkcDF0?=
 =?utf-8?B?YVpXVlk4Q1ZJdWZJZUViNFZGYmFRMmRnbEV0Q3QxaENtRWc1YXBsTHBrYUVa?=
 =?utf-8?B?czUzWXMwY0Y5aExQUHR2a1NTaFdUSS82VEhwL25RV3c1OEJIeU96NWZSeVFs?=
 =?utf-8?B?TkxNbE5uR2xxdVBzcENWRmwxK0l3YVFVZzBsSlB5cUUxeDhvWTEyWVhOMzQ4?=
 =?utf-8?B?eUJGV3cxdCtvWk1ZSXl5eFg0Q0M0TEFDRjFRYmhVYmZPVkZnZjhQZTZZaEtZ?=
 =?utf-8?B?RVBMK1NXaUJPYVJqbENiN2J1cUx4ZFJPUld3WERHdGhxMUlETnJsdkRVdWhX?=
 =?utf-8?B?MzZZZ1JpamdLanFlcTZEK0I3eWJYT09ZWU5HTU42ZklYeldlSjVZMzI1N2Jh?=
 =?utf-8?B?UUV1OVg4YlNDMncxdkd5aUNINGxuNHpoeGc4aTVHTUxXU05ieDl2ejB1QTM5?=
 =?utf-8?B?Uy82OHJBZWE2YmhERlAwVWt2NGtkUERQZUdabDRJaFRJZDN6MXhwVzEvM3NL?=
 =?utf-8?B?T3FuUXl6Wi8xQ1Fqa29lb2JOQ0Q1cFl5d0tPOVc2ODIwTmg5YUVDbTg4M1Jm?=
 =?utf-8?B?bHp1UlpUZVdqbTJsVWpaWHZNYjhwSVpNMDlHeHpaZEhOSXlwbjczRGkvYldP?=
 =?utf-8?B?QlVvVWk2OHJMUnRMUVlXV0dUYmtuY2pWK3ptb0orRkR5NkdVTm8zWStXemw2?=
 =?utf-8?B?Y254YWxvSTk0eVVmVmVaYXVIMVhkNnVvaFE3ZWNlM0h3RTBLanpDcFBWTkJa?=
 =?utf-8?B?WmN2dTZvUEd5MVcvSnhFY3UrYmNHVHFBU21tNGRaWkF2VVRPUHMzR2loQUFz?=
 =?utf-8?B?Q0tiU3hrZ3Mxciswd1RlR29VajJVUnFQVEIxUk9Haml0eTlac1h1QlpuQUFI?=
 =?utf-8?B?Vk1mbkRRQitadVhWeXR3WmVQL0hkV1F5dFN0d1htNzJSL054Zjk0Znhjb2pK?=
 =?utf-8?B?N0RpVjhubUYwTUNIMEgxRGVVcWVFUkFya004K1FBSUd4RFltcTRNYitoaWUx?=
 =?utf-8?B?YnhsOFIwR0F6RndzcWtrMFJQbWYzVHBwSjBXZ0xTYVBPVUZqOUlEejBZQVVQ?=
 =?utf-8?B?ZFRJMlJwL0ROakpneFZ5NkdnSmp3YnBDWHRQMUFYOXJ0REJ3Mlg0OXo0Tm5O?=
 =?utf-8?B?MkVadnhKKzV2UlFoT3hFZzdtd1FGRkM4emkreGFuemJtY3VhaTUra0tvbmpS?=
 =?utf-8?B?MFg5SlV5MlhyeU96Q0Jlclo5MzJKMWdBbVJTRXBZUm4xOWhYRGp3VEZCakVI?=
 =?utf-8?B?UC9oelp3eHRaR3poWjZ6NXVzZUhZYUQ1dEViSkN0dTJJOUEwa25Xc1Rocmo3?=
 =?utf-8?B?R0lXRW5FeFMwcitpQ1V2ZGs3cGRxSUhUbk5Pbk1YMVVNdi82L1BjU296UC92?=
 =?utf-8?B?bzI2dzIyY1JJSFBndGNiaXF0a1V2NDhzajZ4TXczZ1djWmxIQUxMcGFnRlFT?=
 =?utf-8?B?VXJITEUxN3Y3c0RvWjdOdlk0b295QXVDNnlBamRnWFNFODl6NDZDci91MjRi?=
 =?utf-8?B?VGdiODZjRXZ3MCtVKzNuOWxQTFZHeWJxRjRyeU0yZXNRMEYwMG9sb2pvblJW?=
 =?utf-8?B?MmcvMzVQWDkvc1AyNVdRbERxa0tNazdTV3dkVUsveGxJRVJ2RlRDdEpySnYx?=
 =?utf-8?B?UWE4TmJVNHN5djd5VC9wSGkyTTRjUGpRR0EzVnRjaGRZZ2ZtZi94ZEo1VkJ4?=
 =?utf-8?B?bTRJVithMDZlUE9TbWswVUZMVHA2cjB2aWdMUGFreWtzZERDUHRMNEMxRmda?=
 =?utf-8?B?Q2RPSUdMNFAra0p2dTVXY05TblhRQXFwNGI4a2RFUXVVaG1ZbWVZaEJmRDVC?=
 =?utf-8?B?c3psSy9TNnRzVzVsbUZYWFJTZjdQd2J2aUdNcUJHSEhVc1dxSG1iejY4TUY2?=
 =?utf-8?B?bkZ1RmpWZEI0N3podmo5OE5XOXI3U2ZSNnZ4ZzF1OHd1aHJEVmVBeERhTXpT?=
 =?utf-8?B?TVRoUldqM3BBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(921020)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXB4L3dYMlNlVFVpTml0ellWa1Z0eTNjZ0NacTZZLzJ5REJtQUVSVENSQ1hk?=
 =?utf-8?B?Y2FFcDF5VkpOM2ZLV3dqUGxDUEM1L0czU015VURRNWd3cmp6bmlJbkdKVzRj?=
 =?utf-8?B?OG9LUURRRkRkUW1rY1BhdVRzaDNGRllKbHQ2aW9KVUNJcW0wT0xBTDNRK1Qr?=
 =?utf-8?B?aGxLalRkaGI4S0dHUWFCUzhzd0N2V2pNZFpSb2lzZlRTbnZSc0J6Z2pwZG9u?=
 =?utf-8?B?RFBCamU3TXBGWnR6WktwQU1TcEpibHBDaHIxK0NSd1JlR1l0aWdsdHJzTGhl?=
 =?utf-8?B?eVhEbVgzcjNaMHFmWDFwODlMRnJ2ZEdYMzJSQ0NGWkhVejltN2x3Y1FrejZj?=
 =?utf-8?B?c0dENnhlejBCZmEyVTRFVm55MC9kMlc5ajd1Y2Y4aHE1ZHpZeTFaOHNhQWZr?=
 =?utf-8?B?M2dHZFJzWW9jT0YxcGw4QzRnWWVvelNNQzN0azJ4OHRIaWRrb0xiYVlWYi9J?=
 =?utf-8?B?V25wd0krOGo3TVpGZ2h5Zmo2VHlkWmwrSjgwZERBeW9QcTNQL21peFhnN2Rq?=
 =?utf-8?B?RzdiMHpCbmlTN2g4WCtWbzBYQlcvK3lqblUrbHlXcHNydnVQM1MyaC9LTk9S?=
 =?utf-8?B?SHBkdnFrTnFCVnN4TkJYQ2l3Q2xvTTg1R0k1M3RPcys5MmFjZmJ2NU5ZQnk2?=
 =?utf-8?B?VEpiUmdRS2xmL2h5MUVHNTVrcG9uOW02cllMQ2FKd2hnWjRGaHl3MmVJcFFt?=
 =?utf-8?B?L2ZxV1NnSEhzRDduZmVOZVRBUE9Da2xSckN4bHNEYTBSaTJ6UStXWk8vcEM2?=
 =?utf-8?B?YXJ6T3c4ZFRhaDh5SWxNaVNOazZKT0lXWGlkR2Z0SjJCT29LeWozSFJSeitJ?=
 =?utf-8?B?dGJvNFBtK0lPS3BLeEFxeU03S1Zpek1reldselo3bjErZmhKUW9HSTVOajlq?=
 =?utf-8?B?d0xiYkVhZU0wS3V6SmRzVUM0RWF2NytMOWRzUmk2UGNFODhBL0ZZR01pbG1N?=
 =?utf-8?B?RDc2WmRsZk9kVUtxTHphTEtVYjVlSUZzNHVKV3RUb20zcjlFRkJ2NzFJTlh0?=
 =?utf-8?B?UGtsSGY1R0RmNUxSVkVnbnVtbUpYMGFwdE50NTAxOU15dkMzbnJ5QUxldjV1?=
 =?utf-8?B?a2tBb05wZVhuSEpCZkp2eUErUkZBWFZLMU5MQWlGRDd2QWZtOEpPOXpJL3Jh?=
 =?utf-8?B?TVo2RGltYXdQWWg0djdsL0xjT2lQS0NmRkprdGNrZzNaMHp3MlphM1h0U0l2?=
 =?utf-8?B?UnFDSm8yeGtpbHVXQmhoYVhPbnVlS1FiUVRqckNJejRyTURDU0J1dlFaU1lF?=
 =?utf-8?B?clBuQUQyTUxicUJQekZLUmxpOHYvT2hYZFFzRnh4RmhCNVNtRnZHeUVZeUxl?=
 =?utf-8?B?ZTVYampRa0o4bllWY1MyMll6dnkvRDZvMUFJaklFK1dnMS9KM20vb0lFc0l5?=
 =?utf-8?B?YXJvcXBQSm0va1hDbTh5UDE0ODB2UnRaMGZXVWNiMkVNbG44eTVLVGZKNXBI?=
 =?utf-8?B?OTM3QVBTMHZnMGx6N3BOVlRZTmFoQUdJTjNTZk9oM2VFcUZHS0N6MnlrRnVS?=
 =?utf-8?B?eUowSnp5alF6eHd3QSttNENIK3N1TlBxUkFtbXRHTms5eWtOakcwcmZ4Z2d1?=
 =?utf-8?B?T05sZlFrcjhjTEp6czNZVHFlaXdjY0laUWhTbWQvQVhucmFxbE1JeTBvd2hT?=
 =?utf-8?B?aVQvalhrSWYrcVo4aEp1L3p0cnhzSEtGOFJTSGNPdUErNTZIRDZXaHhiSkhM?=
 =?utf-8?B?Smx1M2ZNZDNpdnRsZmlodmdMMGJlMEd1K01teUN5NVh1SjF2MllpUzVFOFJL?=
 =?utf-8?B?WmR1ZjZSN1BsSzN3NWhxYkdJclM5Vzkzc05mWGNZRkF3eER1TlJrK2pWU2VS?=
 =?utf-8?B?Z29DVjg4bjdYaWgxdlRwczF5alA2aXJlNnNYVkpkZHJLNm5sazBIazFYb2hW?=
 =?utf-8?B?dGdVblBWTE0vdUZGaUFmdWhXNC83Mjg0MzJldHpmMTJSeWs0bHJ2TDJzaHha?=
 =?utf-8?B?SzlwZlk3NzltNEdOSHZxWndJMnN1VFpxeHlLRm9UNUJPQVlyNUFxdUhqVjFt?=
 =?utf-8?B?VFg3SmZiYzVhemVHU3dySG9uNHdOVzNzamtFeHNCR2NyS1RrTzJoSUZob1BB?=
 =?utf-8?B?VDdNVkozOS9pVGYybXVYU2JjSWU0eUFMbnpnK3d4RzZUZVB4VEFhMHVwbStX?=
 =?utf-8?B?Y0xKZDl0UUQ1WG1BRDZid0R2cWVVUm5xdldnSGVibldaa21kU3E2UjlDOElY?=
 =?utf-8?Q?NqgIJMNMevv2ZNwUY2+r/YdWn/+kE0jKwEZEnuaQwfDe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 810aaaa6-5f6c-4c92-b020-08ddaf34b465
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:25:05.7508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T28bwDjKjY/DTcoiVYvthSkMsU3NJfJ98P6pUDC2iIPQ+ZoKRhOnFkNUsObzLZenorHjiYdvKnQQBV6ZkIvfOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8122
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

While programming the hardware, we frequently need to busy-wait until
a condition (like a given bit of a register to switch value) happens.

Add a basic `wait_on` helper function to wait on such conditions
expressed as a closure, with a timeout argument.

This is temporary as we will switch to `read_poll_timeout` [1] once it
is available.

[1] https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/util.rs | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index 332a64cfc6a9d7d787fbdc228887c0be53a97160..c50bfa5ab7fe385fae26c8909ae5984b96af618a 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -1,5 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::time::Duration;
+
+use kernel::prelude::*;
+use kernel::time::Instant;
+
 pub(crate) const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; N] {
     let src = s.as_bytes();
     let mut dst = [0; N];
@@ -19,3 +24,27 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
         Err(_) => kernel::build_error!("Bytes are not valid UTF-8."),
     }
 }
+
+/// Wait until `cond` is true or `timeout` elapsed.
+///
+/// When `cond` evaluates to `Some`, its return value is returned.
+///
+/// `Err(ETIMEDOUT)` is returned if `timeout` has been reached without `cond` evaluating to
+/// `Some`.
+///
+/// TODO: replace with `read_poll_timeout` once it is available.
+/// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
+#[expect(dead_code)]
+pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Duration, cond: F) -> Result<R> {
+    let start_time = Instant::now();
+
+    loop {
+        if let Some(ret) = cond() {
+            return Ok(ret);
+        }
+
+        if start_time.elapsed().as_nanos() > timeout.as_nanos() as i64 {
+            return Err(ETIMEDOUT);
+        }
+    }
+}

-- 
2.49.0

