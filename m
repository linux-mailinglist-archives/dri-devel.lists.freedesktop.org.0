Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0F4B5238E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 23:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D16510E144;
	Wed, 10 Sep 2025 21:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qUrck3MP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2049.outbound.protection.outlook.com [40.107.95.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDFD10E144;
 Wed, 10 Sep 2025 21:36:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYUbNvIxyYH1LrHacscw/uR89RJpUfpRiWKRBQL02xxi2UEfYhq+/XWSa/1/am7q4gYIsQuVGyu0qjNTF/BVQhmsE8g0JOEU1/R1dXg74Gjx6ElR/LPZk8Y8Gd8kyEYE3OEI5yYP23K09iqLKz+5IX5PhqBwiDCEsy0J8R3jxjtnwJ4lL7CMmkY2+X5SsG6dh0G8uq8/iKtb80WW95bqnyiDqCNx7obwp+6ZF3aEoYU0UzSV3nTpLIug4b7ujRuPT66dvFSOYz4wIFYnfiIDCqlrXbFHDtSbteu5w2aKHo4cy/i1k3e8h7XK9VhQ0KarVlnU96zfUoIOGga9NPZh0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwfr3gfL1yzw4ZFTtvKcrgtasD6/JDtzAMFbpvmTAAg=;
 b=UCfemZyhGCeWswZMgN8qbvafUamzsULhyPixD5poDVo0qKcq/RZ8zkkXOuIN52S6Ch/+oVwEqyTmxHvkJScgCJDPB2YnV0qC7/efGhYh82Y58MFRs6WVnG9sbr/j3kqo0MypgTM12JAOs71vd8lGKyNjiK1o4HErAD6ISQN9TW2g6LXCq+Ge3a0nzkr4ITvBYLIHQC8YrUgkfzK23wysLiSUmBucZqMNgPtYNKibxQPTVbX396sSiTQNrVF+Quz8qA6zVCbjKL/xiRU3jnUW8wUVn9KNRrJcJdyPnu1PYuhiJCngGOGEznE2FGvEquOGpg1bTrkQKq+PruYoxxYndQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwfr3gfL1yzw4ZFTtvKcrgtasD6/JDtzAMFbpvmTAAg=;
 b=qUrck3MPjugsbpHxmdvDKoYM/VQRtoCppKgybQfxuzuN1eF5DQ4YgFrpq98tDCG+lR1XlBFZh/Ue/skmZYA+6hyYs0mLmX03UFHYnnKmEsZgWhrGP12MR2ElwN1Xf7i4gEhS54eXY+8jn9mqASKyS5pYsBxaHHzKgSE3TaLaXx6mkD2Ubzqxpm4IVTiw3jrw7yEDexP8DSdyFzDmGx3SYS1HM8tWMjq58DLI06sF67/ziPt42kjtCkHK2kVyCwC62bwx9HjQjWjh9SrLfBN5vXfs4Br5kJ5NC5d5KeL/FGq+8u3H/Fwf03zFHvOhn8IdIcyo1+IzsA4UqyVKigxmDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 21:36:18 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 21:36:18 +0000
Message-ID: <18fc743f-0c1b-43b4-a88f-6b0a72b471b2@nvidia.com>
Date: Wed, 10 Sep 2025 14:36:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: Implicit panics
To: Alexandre Courbot <acourbot@nvidia.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-2-93566252fe3a@nvidia.com>
 <9adb92d4-6063-4032-bf76-f98dcfe2c824@nvidia.com>
 <DCD2VJ1WJW2O.VM7E4PD3DFYO@nvidia.com>
 <CANiq72=nGbziZCKt=AneE_vXw76i=+td0dSVfbOJ8kJ9eYHw9w@mail.gmail.com>
 <DCOVRI3TVJBN.3OGDSK8HW74LL@nvidia.com>
 <CANiq72n-q0vdzp=Tb=brue+BMoNYdCTKsqcMYUsvKgvu9ZqGoQ@mail.gmail.com>
 <DCP66O4WE3CE.3P5ZHC9P62LOZ@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DCP66O4WE3CE.3P5ZHC9P62LOZ@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0225.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::20) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DM6PR12MB4435:EE_
X-MS-Office365-Filtering-Correlation-Id: eb178136-25a3-4998-cc3e-08ddf0b213c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0tPR28vZGZMSTZlUjN3TFhLejBMM1JER2JvanZwQWZGTEcycUZPVmdIbWZE?=
 =?utf-8?B?U2ZPV0NtU2Z0MEdOdllTbXYzdVJray9KOGJTZjgzUkVmTkhYLzNVVFlNQnhV?=
 =?utf-8?B?OFQ4cUkwYnJnL0V0eFYvTzFUWWl4NmpqZjBOS3poMlhaeW84dkI4dUpvaUNR?=
 =?utf-8?B?eW9zbEZSZmV3VGNlVGgvWmFLUWtGVkxvakFuOWVKWFd5WW9LZGJJbHdXQm4z?=
 =?utf-8?B?S3hrNm42SVJmcVFuWnR5OU1jcVBvMHZhTDViSEl6dHU1NmZCTlNjMDFFb1hH?=
 =?utf-8?B?T2lOcE9ybUQybGVnTWcwRUM2Y0VhTkI4NUVSOXdVUjdzWjZVWW5PT2FtZHJ4?=
 =?utf-8?B?Q2dzWDArampZcjRlOE1YZTNGVHZ4TTVnRXNscTJhMjJTMHZBdnRJYkhhZHU2?=
 =?utf-8?B?dFNpUTBHRzRQMkR0cU92NEhwelVGOTN5RUJFNnd2c2lZbjRjR0hXdUVBbzZw?=
 =?utf-8?B?dnBBQyttL0ZyUHEzUEFtZG5OMjFGNXBIeVBpOHZsVzdnVmhPT09uRTg1cmxN?=
 =?utf-8?B?K2x5NnVNbG9sVWZJRkt2TmdPVzdsWDJBWlJsbFRSeE50ZnNYbzhsRkxDN0sw?=
 =?utf-8?B?VHJ5NjBxRVRKU2hnQ1RuM2t3UHBzY3NWS3NvdUkrZkpFSllwcy9xbGJ5TEpB?=
 =?utf-8?B?NnoreHdaKzV4Z3BsTEJlRkpaUFNmZ0ZmblJ6NUxSQU1GWnQwZmw1d1ZObFRM?=
 =?utf-8?B?UjNlNCtuOUZGK05rUzIwdmMzUTRaV29HUkgvWXN0b25Kckk0WmpYWnNHcjcx?=
 =?utf-8?B?WVQrVm5aYTNtc01pbGVyakdFbVBSK2txdGo2cFJLclR6ZGNOaVV1akUwV0FZ?=
 =?utf-8?B?RzcrNlB1S090KzNnSTFMVkhZUk8rdnN1STBoU1F5dCtyZFdXeDFlQVZVb1R5?=
 =?utf-8?B?TFVZaUZzN25ZWHhNK0pRYmE0YXFxL0NWUHY2ajR0UTlab3d6REhScUsyeDF2?=
 =?utf-8?B?T2VsUnJ0VU13RS91QzBBQnl5bG5mVEU3cWdTKzFuM3JPMlVzcm9hUEtLbE9F?=
 =?utf-8?B?OGJ3UW5lcUdVMTRHL1p4eXFiU3cyUFZvN0JPM2F3M2k2VzdvNWp1MUh6cmlK?=
 =?utf-8?B?eDRucTZlZzVUem9qWW5IY0o3VXFHNGpidzM0VE50ZUhkRDNKZVFBd2hpUVVX?=
 =?utf-8?B?TGprVWJVSERnNGF6Nk43aG44SUJwdEtSM3BBZHZZNVZHNm1zRzZidzh5UkJC?=
 =?utf-8?B?STlmTFVxdEdmWlRyL3I2a0JGTVU2TE91ZHEvU09UQTd5a3grWHozcjlmSEQ4?=
 =?utf-8?B?YVp0Z1RCY1RDUTVZZEdmcHRwZmVGTU84cituQ2Q3Rm42TVBKRjBIZGRDc1JL?=
 =?utf-8?B?c2gzTjdIQlFtTlViTlUzcHl0WWVrR00vVnFsRXdSUzgxM1JBRENDcnFQTTRs?=
 =?utf-8?B?eTNSWFJHYVFoTzhvOW5IekR2WWIrZU14NVpNamgzcEtsWDBjdGx6eXdiWGdu?=
 =?utf-8?B?UTNDVVNUUkFTbTEycmkrWmg5aFQyR2xvZm0rRDI1NW9MNUJ2L3JBOGRqeXZG?=
 =?utf-8?B?d0RteFJ4dmRtZlVCZGdKc2xLUmR2aFhCdm11bDdPRm9wcnBSYisxMlBzNFZr?=
 =?utf-8?B?MkYzbEQ1YTVpMU12N25PT2dDQmxDNUJsK1VvelFIOTFHaFZxOTNYQ2RTM1RQ?=
 =?utf-8?B?WWszUzZLTDBGZFNDajMxY0ZxTTVJb3V3TnozKzdxcFdNM3k3VmpYZzhmSUYw?=
 =?utf-8?B?MlcraHd1Yk9nSGJXV0dWRExHZm9wQ0tTRjdiNjU0V2hvOFY3dW9jL1ppZm4r?=
 =?utf-8?B?SjMzTUQxbys4eDNMQklKODh5TFJhelZ4anNaTW5aSDVlK2FpV1JZeWFoSndS?=
 =?utf-8?B?Q3d0K3craHI0ZlBIM2NRS0R5V3JqZXZMYWEwQXhUVFNnbTIyWlU3cjlVQlJZ?=
 =?utf-8?B?bGgzSUEyZmlqK094NGVabmduVjR5clRqNjdsSndlM1piUVZYUDJ0S0l2NE8z?=
 =?utf-8?Q?cZIffzY/YMI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzI0Kys1SWc2R2ZqMGw0S2ZqVnAyblArem41QmxiWHpRcyszNmhrbEdUUVRW?=
 =?utf-8?B?c2RsWW9wVGtOT3JsWWxJRGh4OVdjaVl0WEE2S3BXZnR1eVFLd3NWQ3pSL1dz?=
 =?utf-8?B?REdXbCtSREJla0ZhSXBaUU83ajF0RnM4VlZkaFRoeEsxL3llSzltQ0N2OG96?=
 =?utf-8?B?clB0akU0Qi9GeWhNTlFhQzhMOW9Lb0hOWGh5RWNvcXVDU2Z3Z1c4WERMRk8r?=
 =?utf-8?B?RmtDZjFlUGxFSEdXUEFrNWNwNkR2WmV4MVpkTFJ0NUgzUFBTMzhRa1ZaRFhN?=
 =?utf-8?B?ZUZFajRqSUsvWUV6QWppRkJrU2k2WFFKZDBKY3ppWmhEUkRsRHRrcUVodFo4?=
 =?utf-8?B?MjFTY1F4dWJGQ25MYXBlZWhBeHJMc1MwZ2NwQWliTHlxOTRHZWhtUkwxaSsy?=
 =?utf-8?B?dVAyOWN1VThGczVubHphL2tFTDVhSXlVbTJuN0FtRXhtNE04YWd0bjZvTCtJ?=
 =?utf-8?B?MGFxdWtETHFXSElKRG94bEZadmtieWxNM2luYmxqWUcxTTdWQlJySVREeXFH?=
 =?utf-8?B?Z0Z5cW9HR0QzcFhMMCtCb2Vkak85SGZNOHFSSHN0N0NYSFZiM1VJOWlWTU1Q?=
 =?utf-8?B?Mzl0WDBmaWloR1J6NGxQbEdrV012QWdjVXh4NjBhVnZRcDVtSitBdlJiN1cy?=
 =?utf-8?B?MGFxZWRCS0lVMmR6SHZTN1B0VnV4bkc1ZUtMOHIwek12TWQ0eXVYRk1hZWZl?=
 =?utf-8?B?NVNUUVZ3Y29rdzdhRExPZTJ0c3czSkVYQ0JUdjM3NXMvb0hJanluZUVIZ3NP?=
 =?utf-8?B?ekdLUHgyNmVvZlUxL0o0K2NYay9aZHh0anBidDM1c3VQU09hWTdDd3pDTWVi?=
 =?utf-8?B?aG9ld2k5aEVnZ0xiYlhLajd2cGM0aUp1bVU5S0JNRkNCMG5jS291L0c2bS9a?=
 =?utf-8?B?bmMvaTk4VE5qNk9RYnRua3BvNkJNUlc2cUdSRnVUQVVTSDhFVk9TTmRMdUY1?=
 =?utf-8?B?UGEzSmhJUldjdTRUWnlWV0s3SlhZamc4cXNYYkNCaHRYTDVxQ0JhelBNcWYx?=
 =?utf-8?B?anVWVlVQc0NEb2kzcEkrVnhWUi9xaGxhQ25NV09adXRZd2JxTWNVcVExTDVa?=
 =?utf-8?B?K2Y3WDJwMlhmZWZWRktQM3gzQjRPU2tPUWRXcHVyRDZRc1ZEUkNpM1dzTFdD?=
 =?utf-8?B?Rmd3ZkNXUStEcFkvTTd4akFkcnZOcGVnMVBXajZVT1ZQVzJOamg2eVdrRGlH?=
 =?utf-8?B?S2h5SmJENlh5N2hEWGpId3dVeGw4SHF2NzJjRDUwdWtkQ1QxTUxPeVAxZ0U2?=
 =?utf-8?B?ZmMzTWFsWDBTVkh5ZXRxazBIK0oxMHpNN2ZBRW1RSmdJOHdncjVGVTgrTTBo?=
 =?utf-8?B?c1NiK1RPeW9oSEZ5b3NYcDkybnFUOVdTVzRiYk91WDZmWWFvaWxsWmVpRm1Q?=
 =?utf-8?B?OGI2T3d3SVZ1SkhBOGgzWEo5RjVISk8rOFVrMzFFU1ArdXpFcVIzL2ZXVzlH?=
 =?utf-8?B?azUrNkpxZ0toWkxQM1ovNTFRYTZYWStnOXpBUEk1TmxMRTl0Z3NLU1ZnVmFN?=
 =?utf-8?B?dmVFVkovYnBRNVI3Mk1iQ3kyQkxHVWlPNUZ1bldNMXZvRTlIcS9PSk9PSE0y?=
 =?utf-8?B?dXBJSVNPMlVKK3Y1dVUzVGhEeUREcDhmTVJ0N2VScUIzYXcwc0FEYmVqalRj?=
 =?utf-8?B?aVA3U0dGRG9ndmdRK0s2NFU4NmIwWktybjNaRUpFSzlhL05HdmV2WGJiVHZD?=
 =?utf-8?B?UkxMaEM1SHFGcC9pYUoyOVdZcHhTZ09Edm5yREQxTVVscFYxRmc4Ui81Wnlv?=
 =?utf-8?B?ZFNXc3RacGVxV2U5ckQ1RTJlV2FGekFXeFgvaC96RUNkSkw0NG9GWlNzUmQz?=
 =?utf-8?B?ajRRbzhtbTNpalpHV2RGWHI5ZUs5Wi9INkZPNkJqZ2grK3ZqV25EQll0SWZa?=
 =?utf-8?B?cCtKMWVlQjMxbHhpaVJaSkxqZUFKMWNYMFU1T0pSUnRuMHhVWEwzaHE4TnVw?=
 =?utf-8?B?dTVPcTVyeW5kVGNaRytIOHhPWmpQdnRORG94V1V4MmFYbDQzdWd5MVNFRC93?=
 =?utf-8?B?NXNmeVU0ZUlhQXhib0IybW5PMklpbUMxWUMwNEw1RlAzd2pCZSsyZGJoeFp6?=
 =?utf-8?B?b3U4T1VPWmwzUVYzQVNWTVovRzhpSExwTHdSM2RHTDBoVGlxMTZlVkxPNVhm?=
 =?utf-8?B?TUhEU1laTy9vNEovU1JlY1ZNNGl2L1BBdzU5czRXU1RMZ2Jxd1EycVhjTE1p?=
 =?utf-8?B?aEE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb178136-25a3-4998-cc3e-08ddf0b213c2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 21:36:18.4327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVbOVnGBej6QnjlurGb73fPksvpXz6KOznW06CanEyRz3oKjpegiT45GJFwt/V54eEUXo/bl+sWIJV6BF9CZNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435
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

On 9/10/25 6:54 AM, Alexandre Courbot wrote:
> On Wed Sep 10, 2025 at 7:00 PM JST, Miguel Ojeda wrote:
>> On Wed, Sep 10, 2025 at 7:45 AM Alexandre Courbot <acourbot@nvidia.com> wrote:
...> Build errors on such panic sites insertions, with the option to relax
> the rule locally if a justifying SAFETY comment is provided? And as you
> said, what do we do if a panic can be removed through a particular
> optimization - does it become mandatory to build the kernel? Is it
> applicable to all architectures and (in the future) all supported
> compilers?

We have a very solid precedent for that: building the kernel already
requires -O2 optimization for *functional* correctness.

So Rust for Linux certainly can specify a certain set of build
options that are required--including options that are normally
considered optimizations.

thanks,
-- 
John Hubbard

