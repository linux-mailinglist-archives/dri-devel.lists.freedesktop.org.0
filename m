Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25574C8E8D5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 14:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA47510E093;
	Thu, 27 Nov 2025 13:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="egRjxhSX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013038.outbound.protection.outlook.com
 [40.93.196.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8ADE10E093;
 Thu, 27 Nov 2025 13:46:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ud1yYDlLywXJyy5Ziu5G0npETZpO0fWrGVjvmEFki1l9sM3rURvpczBhd/ST5sDN0jaGjfKX+0rrRutI/nq/PdJkhGMT8webvbD3omwt7b+lzU4k5yFFi1NawUk92skoeue1Rmw/VLF16DFWB8nkSQuCEG3AYEYi8eQGeR2Fb2fMAFiP5hS6PPEEq71xo9laY6JiH7dlGYyRxb3BtB9tSNzO2s2faioNDQpqmA9EmeNb4qqUvCt++rOddOA6Yy6UwObLGS/DCuZd8KBAbRB1lw+OFvYAh4lnlGSjX9XjH2lRP4e9xy1MrgWbbZ+dMiOgAY8Gpe3Us7H/PCBR30P1Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5grx7rK5N6yuHGIkYZSh5Ww7O8jZP6rM+LIStgPT9M=;
 b=NBOubOIHLVdxTCvJAhJ2vomTtO+36yUjY9fRsOgrzsq2Vb5cjfqsKZXMv34+G3C7UZ/5jCOzETznTkcMuEAbcFOtbAsnxJUCeL2TMWQsE1wvYisNg0bbGUBkPO+NIfjKIxPnGY/g3TBNGE7ySy/U2uN13LI5PdGWJ5NyPwx9FoiJh3VCO85alBeMmLxQ2sET4SuoT2hZErqsNS07L5PaNFA2T4tx1J3TZ2eZNEBq9p8wibeWw5qqFskGXZhSSWeFxftaD8XVKeQcpMiBRCMKfpyjeSqhBpcagRtJGDh+AkH7a05NlWlLUHOhefyYsggH9I9MBaYNpt6YALtGpdO0UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5grx7rK5N6yuHGIkYZSh5Ww7O8jZP6rM+LIStgPT9M=;
 b=egRjxhSXlakA6j4HcvGjyi1gL4c9/qOLtixM8zskCF2vo+1JnenLMJfshzKjg1Y3VMgaarF7NiWX0Dj6d2zA++LsGeakM4uC+jMZXAvsRVF9erOfImBtVMxq3JumzHQmqmvKFy+tU0H1PL5BDqE+hi7CIrzkRp1gexCRsx5OYGT811I0REYj+wYGmXfQp2VMFXCkEe6GNOG/QUXQbMw5a3w83mIcVebO0ShmYaH0+dCX5g/nav62Ie5bVlkShrrC8TtEQK4YJHzEzJJV/QZNlAKaGL2HR7E1OqgxAEt2akWd1akx4ndHvMw6r1Qe/7033BxrAdjtzjGVNvgZVyI+lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by DM6PR12MB4300.namprd12.prod.outlook.com (2603:10b6:5:21a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Thu, 27 Nov
 2025 13:46:11 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 13:46:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Nov 2025 22:46:08 +0900
Message-Id: <DEJIUDQ3ZGPA.2UIPTGU4WT7RW@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "Alistair Popple" <apopple@nvidia.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "alex.gaynor@gmail.com"
 <alex.gaynor@gmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "aliceryhl@google.com"
 <aliceryhl@google.com>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, "Timur
 Tabi" <ttabi@nvidia.com>, "joel@joelfernandes.org"
 <joel@joelfernandes.org>, "elle@weathered-steel.dev"
 <elle@weathered-steel.dev>, "daniel.almeida@collabora.com"
 <daniel.almeida@collabora.com>, "Andrea Righi" <arighi@nvidia.com>,
 "phasta@kernel.org" <phasta@kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked
 list operations
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <DEHV08MPF9CH.1GZAWEGC4AVF3@nvidia.com>
 <095D38BD-A8AA-4BC3-8C24-9454964EB8F8@nvidia.com>
 <DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com>
 <F3A7E1BB-883C-4EF4-B245-8E9DD329131F@nvidia.com>
 <03003f10-00c0-44dd-b9df-5763cc1e715f@nvidia.com>
 <7529a7b1-b204-44cb-bb34-57161e6b7b8c@nvidia.com>
In-Reply-To: <7529a7b1-b204-44cb-bb34-57161e6b7b8c@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0082.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::10) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|DM6PR12MB4300:EE_
X-MS-Office365-Filtering-Correlation-Id: 18bdbf93-9007-4d17-7821-08de2dbb5356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|7416014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzdCYzNZalc3STBlM2dZRldSdmZlVU1DRGhtUjZUK3Ezcm5GdE40RnA3QXUy?=
 =?utf-8?B?M2FoUGlESGNzdzl0SEt5Sm0zSHhwN003UG9GdW1FQ2hEWWtZTmxmREgrd1Br?=
 =?utf-8?B?a2VBRjV5bWYvZmlnZXozdTg1T2ttOHJCeFlvTUk2N0RmWjAxajE5cnR4REpQ?=
 =?utf-8?B?VlVZVVArOWNGWGt0elJ0L3NJd3RGU0tnUXJNZ09NdG12VWlmYmZhaXM4c1p1?=
 =?utf-8?B?VTNheFAwRE1rK2ExdElDMloyb0ZlcklQTzRQcjFvamtUOWlpd21kQkxVOHpk?=
 =?utf-8?B?SmdXWnJIYk9nZkNNdUZkNlU3Uk9xTGpBaG1VNXBjRTVNMll2ODJIWVNmUnhU?=
 =?utf-8?B?UWRaUmpTN3ZFNU5WWENjSVFpb3g2MzAzTXN2SjVieXJQcGNlOHFLdU1yNHlY?=
 =?utf-8?B?YUJZZHRORXdUTGZBR21YaW9Vc2NDNGkybVFBTEJKWTN1eXNwRDJndC9xdEVF?=
 =?utf-8?B?d0t5VlJUNWNWd1dhTXViODJtNUl5QnhJZ1RKYlMxSk55dW1vY0NSOHBnaml2?=
 =?utf-8?B?eHJoNVhuZlk2ZEtvT1ZpN0VPa3NlL2VGbHlHMUhvYm5lOWUzVm4zSmRtT0sr?=
 =?utf-8?B?bm9JajN1OFdKcHk4YmRMS2VXMHEzOGpDY0x2cTE3SmVjaGVTYS9YYVVScTRu?=
 =?utf-8?B?NEVvUVRUcnVvaGZ3NzJLQmEyUmtad2QwNXc2a1gwQ3I5TFQ4eFhHUWZBNnJB?=
 =?utf-8?B?ODlETTFjd0VhOUI1bWtZQVFZWGNDQnkydGxaNEdpc1ZSSzV5UUdPN0R2bEw0?=
 =?utf-8?B?YmJub3MvK001cUJ4K3hUQXh4bXM1QVVWWWNkdDF0T1FQa2gyRkhFNDN5NElp?=
 =?utf-8?B?eDduOTlESG1MUHc3WWVrVGE5Q0FwTGNpMEdWakpxVGRxOXFPdC9SK2twdWdj?=
 =?utf-8?B?cmZPdVg0WHJ3akpvcU1laytVeFpyaVdOWWtWanpXU0U0VzNKK3BQMFl4NHpn?=
 =?utf-8?B?WnVHcENqd2RtZ3AvSTJma2xKOStaM3A4NE84U1haWUlSdDc2azJpS0ZWZGRQ?=
 =?utf-8?B?UnpQQWJudnRhWTZxKzk2L1NyMFUwaFpYRmpUcHVFMGNUeGR0ZVIvS21Pcmda?=
 =?utf-8?B?aTQxR1Y3WTNlMVJ6NnVhY2xvMGdsWFdoTnlZNUEybzhOZkRtZWh1UFBOOGo2?=
 =?utf-8?B?Uk5CSGlrd0NaNlpjNVlZbjNCNlh1bmUyK21qeWlERHd0TGtJZUVoV1JEOTEz?=
 =?utf-8?B?VVVsTkQ4Q0h2WVRIZzRvZVRJVU9hSTBIMTJjWDN0QTd2TS9OZGptWkdWY3ZN?=
 =?utf-8?B?Vlg5K2QxOTA4aUtjdWx6WkgzVWFXT3orQkpHZEVTYmJLdENQRmxQcGszOWRQ?=
 =?utf-8?B?TkFzTGw1WGswZlo5ai9jQ0JsaUdycGpLOW1HYWtUWXRZdVM3bUJIc3dRWmVy?=
 =?utf-8?B?Q0lsTzN5Tmx0akIyVE5oMU04cDN1NXlwMkliZDluOEl5K1QzQm9Nd2Q0eFVQ?=
 =?utf-8?B?cmUwZDNBVXl6emdOMHEwdVk2aDhyU3VJMXpkUTRoT25QakNkOHdDQTEva01K?=
 =?utf-8?B?VkQwbFUzSGwzZytZWjM0bGNXVWJmRnZ5TXBOcG1mdS9xRFZ0SDZ5dVdKcmtD?=
 =?utf-8?B?b1krRC9oSVpzc3hCTWd3T0w4Y1M0amoyRUpUeHI4MXdWM09qalIzdFVYLzJX?=
 =?utf-8?B?bWZpeVRzc0V1bHBRWDZpaVIxM0EzZHluZi92ekh0Y0pXQUFqKy94cUkzc0JP?=
 =?utf-8?B?bEJqL1VVVkpBWWRYeGZzdHh5b3FGOVZZOXk4TXExT2dnYlY0Q29TOXZHTVRU?=
 =?utf-8?B?LzR4MVVxNkFxOThMaWQ3Y2dmQzJVdjhDS1pCaFdqVVhEUktoKzZHUTVVNFBG?=
 =?utf-8?B?UnkrZEh6MnNEYmJ4K0VzZ2U5UWgxUHFhTlFNVDViOUpvSnJURzdXOWtEWU1y?=
 =?utf-8?B?TEdWWWV2QWQxZDdTeU0wNTFvWm9rM3pLVFFMSi92cmZ0N3Yxc25XdFNIZVJ4?=
 =?utf-8?Q?8WgcZED84dqd0eYGtECwuu9R6FQC4cl3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDF6VExqdmtJY3p3ZWdnYXgxOXZwem9Wbld3U2dMeEtPTnMrKzVOMTJlZnlu?=
 =?utf-8?B?TWZyNUc1d3BqZXZxMFRldFprQTd3Nm8rbHpKenVLNUxqWE8zT0pEcXltWXEz?=
 =?utf-8?B?QmZlN3NIN3g2QnlPY0p0UWlrTm83OENNb09YQnZYcGcxak5vcmJFa1RBYjBs?=
 =?utf-8?B?RVBzemp3czBpNUZKMTI0SGdkaW9jdllRVXBnVXBDR1o3bk5WRWNGMURDS2R2?=
 =?utf-8?B?ZmdHL0s3SGhpaUx6UTRHVnpvRWRyejFqanJGZkUvQTdlanMzVDIxYkpwL1pz?=
 =?utf-8?B?eXUvVWlJMlQzLzBFUUNxUmhhVHp1K3JXcjF2Sk1PUFJhSngvUVBSSDZpcjdL?=
 =?utf-8?B?VHhqNXhVVUU3RmtVaEpYK2EvVmNFdUZBRTBvSUpLdjFvZW40YzdKWWZsUzMy?=
 =?utf-8?B?dm5kUTk0Sy9WdmNWMk9aaVVGMytDN1dpSjJxQzljN3NPVXV5MkxCUVhQa0RJ?=
 =?utf-8?B?WjRWS1p2VWFtQVkxbDNRQS9nWDBjcVRRbFordnA4ZDdHQUk3TFY0bzd3U201?=
 =?utf-8?B?SFFCdmhETVVVOWYrZlpZU3dFVHY0MW92UFo4bWtoYmdWNkxOd0s3UnRqYklz?=
 =?utf-8?B?V1l5VGNRTGcvczR6SjdTbDZveUFvK29UNE9hQXowUGJEZ3NJdkJRNjVkcWp2?=
 =?utf-8?B?OEJEanhwWXkvN3l2ek1BUSt2T2xYZDBLcFFXWTNzMmt4ejhUOXN4elBJYlJv?=
 =?utf-8?B?cXRwbWE4RHFHekh3T3k2TG1DT2VVSlROOURxUkVXWC9maHY4K25idVUvNjZT?=
 =?utf-8?B?cUJUQk1OYWhtV2ZNeFdqc3R1VGRiendITWlYbTZKb0IxbVlSZXhreTVQQTRY?=
 =?utf-8?B?RE1rOFZWRG5zV0J2d2ZOeDJtSlp1MU1Cc1NZOWs5YUoycXVWQzdwRFA3dWFP?=
 =?utf-8?B?TTcyZG1BZEFleVRKaEwzbGhEUWptaVZyWml2WEdJaG1EeDdWRUZSWi90eVFv?=
 =?utf-8?B?ZmlWMnROd2d6VitHVlFsY3E2RVNXYlozT3ZOOUIxTXJHWk9LeXhmMmJZOU1x?=
 =?utf-8?B?Njd4WEdyWU9zLy8reXM1U1dVejlNbC9FYzhHQTNTSjhNTFRTQVVSNUxFRWZ5?=
 =?utf-8?B?WTRLTHVXdDNXTFBqWE9yTi9GUEp1ZnFmSzNDWmR2UG9JNThuV2lwMVRuMEFO?=
 =?utf-8?B?OTBRN1BISERrWS9SMEpjTkthWkYrbTRuQ2hJL2xUVWpNa2MrRG9KQ05WZ1BL?=
 =?utf-8?B?QUJETnI0eEdIbU5GN3RLVmx5WVBDZEJJc0hLNUQ1Q2xSU3BPamhKWFZ6YzR4?=
 =?utf-8?B?cVpIRGh0VTViaHZjQ1NuK050MHQ3UnFPZVNjcVp0VGtrUU1GWEp4MlVOakFF?=
 =?utf-8?B?K1ZyMGlXSVF4Q2VGQ2V1M3RNZlNnN0JKTjdmUTVkOTNEdVQ4OGR3UEI5U2g3?=
 =?utf-8?B?QThJeERYNzJ5RkVmdDhsamppN2o4NVpyZ1JLeElkTWR2OFdDVGR4NGY3bDQ4?=
 =?utf-8?B?MFdVbWdwTDFRL284Q1hUNEcrQ1k5UVFIdHB0eTRCQ3RpNTNITUltSkliVUpa?=
 =?utf-8?B?RUtuOUJ4VUdHTnJVN2FVbmV4NWtkYXVLOTF5T2xac3Jtd2wrNXpHdjBIWEc3?=
 =?utf-8?B?aDIxd200WG9VMFhpenFPSEtpU09BVEVnR1p5di9USTQwSWFNanAyWHFseUM3?=
 =?utf-8?B?TzdibkMySForTnhsWmpHMldRUWhEOTZ4emRFdHJWYlZ1NkxqTjg3V2xpQ1dt?=
 =?utf-8?B?cDI2aVptK3A0TDg3RGdMWXBLZi8vVnF1cWdINjdjNXRkZ2p6b2M2OGJIcDVk?=
 =?utf-8?B?ZGQydlRmbnYwYUFoY1ZONGN3ZXlKazJSdldtckg2Njk1bllTSGZFY1JuM0cv?=
 =?utf-8?B?UEVNclgwSkVMNDVGNmMrYStsZWpUcjdidXJtQ3Jjd0VrZzBUM2pkeGJaS1U1?=
 =?utf-8?B?NUFJYzNjSFM3QlRNeEt3eklwUVNrYXlwOVNWaGxTdU9FTlV3cC96Wm1tSCtT?=
 =?utf-8?B?TUY2RnZIc3BjcVRqT3FUbDhxV1A4dllhYlBRWklSWHdnOXNIemI4UFRDUGtB?=
 =?utf-8?B?ODk4K1NtMExaWEtHK3F3NFU4VEFrUEZJMzNKTjFuc1FhcUN4R0dlZmYxckxO?=
 =?utf-8?B?N2N4Szc2WFpGSVV0UDE3bnlEbVhnd0NCNlB1bStIM3c5cjJiaGZMcGozWXJV?=
 =?utf-8?B?Q0xSWlJsVlNQR3ZoQzcvM1NBM0c4b3kyN3pIa2xMYjQ2Z2NrQ2krRURUSmNN?=
 =?utf-8?Q?eGkXKBAxAQMF5hSnJEaEwBVXYk6DCldj3FNCjgFF8REa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bdbf93-9007-4d17-7821-08de2dbb5356
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 13:46:11.5616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5vpM1YYV7UJKjdZFks/K40T1N/USppnw5U7k+qO3bnX8ygSBEbMzd/RcKI6lrDHzXJKe+14foQQGnSlGTcF6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4300
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

On Thu Nov 27, 2025 at 2:10 PM JST, Joel Fernandes wrote:
>
>
> On 11/26/2025 3:57 PM, John Hubbard wrote:
>> =20
>>> I am torn on this. On the one hand, if someone changes how list_head ap=
i works, then the rust side breaks=20
>> OK, this is not going to happen, at list not without a truly epic, long-=
term
>> effort, accompanied by *lots* of publicity. The list_head API is just to=
o
>> foundational to change easily.
>>=20
>> It's been stable since *at least* 2006. The only change since then has b=
een
>> to add WRITE_ONCE() wrappers to the INIT_LIST_HEAD implementation--and t=
hat
>> is not an API change.
>>=20
>> Anything is possible, but this is sufficiently far out there that it sho=
uld
>> not count for much here.
>>=20
>> (though that is easy to flag though via doc tests). On the other hand, w=
e have the function call overhead you pointed and we are dealing with the p=
ointers in rust directly anyway in some cases.
>>=20
>> Whereas this is very significant! We really, really do not want to accep=
t
>> a performance loss vs. C, without an excellent justification.
>>=20
>> So I think you've made the right decision. The above is just to help
>> solidify the reasons why.
>
> Yeah, these are good points. Thanks John.

There is also at least one precedent: the Rust `page_align()` does not
call a C helper that wraps `PAGE_ALIGN()`, it just reimplements it. I
think `list_head` is a quite similar situation, but ultimately that's
for the core team to say.
