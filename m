Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9BEC47089
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:52:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737A110E3C2;
	Mon, 10 Nov 2025 13:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kEwfuwmQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013031.outbound.protection.outlook.com
 [40.107.201.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385E110E3C1;
 Mon, 10 Nov 2025 13:52:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PT+bXKAvT6TrQhaE/oauihW59bASt/GJqptMAhVbWMnkM7AMyPzmwe0dBwvQZ1V4arsNHltki6yoOr5kGh9t1TbPsaR8J5nnRRpKo3mRqPAzboveeot3/jh727rvmRwGQKQFzhlvHL/7ko/0ava9yxdU/BsAamUiPpG9iKgSOsRdw1abL2yUSZb0XNjL6Uds+SnvruoZ50aZ5eLhTAFM0dLvTzE2arezk3DNO22GhUUuj2ntVHk9hJrVtr6YMlqi/dHqAy0GNyswCp4zpWH5WAAPtd43sPB2thH0/njdX0zguhSVfX/uu6klQrmOS4nQg39kONJdCZrnTvi7Q5j8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a53tQx9AQY2kf966R+FfkXrbvlyaU3429gt/F11F8HQ=;
 b=hxGZq6bQcOEmqEtrXD9SnDDIkk9TtdNX6DB9s4EHGv9KcKYk3anGgJWYr4ECiSpCZ6ANJ3Cv8GpCqPKHZk4hSBjieER3ii1FqjP36hjOAAqdVp7bDCGrwRX/Zg6NvwJFNy/fWaws97v7c0bVvaen/pp5btQ3uCHZxBRKpGwpafCOwxrJcE50VCjHmYRIzjO/gNSltTzSPgvjyop/Yff7TvK9n+HCnW7gzdY4iMlc30wwJ/cr/+VcPbawCMWybIbbicMbCwuBLeqdaxB4jsslNipnRHMBHjN2+p0xvyMoj2pBwz8Mo6aoq9K4GDhvy8EFcF+PeytSo0S7iicyroqvQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a53tQx9AQY2kf966R+FfkXrbvlyaU3429gt/F11F8HQ=;
 b=kEwfuwmQPvkuM3NlgtH/xJCYjtzuz1vejNvZnSZ90QTftcqNBl2jC9rnh3X8AyBkXwydrDW5ZJU7zFBVmk16WOpBheGri+sLGFjJDPVo34lzIFtZVxYrqHgu4lztr6zfpdQVIJAkNerqkkC0JRFmBQ2Gtz0VbHEVXh96PAgsHIWT1pbQeIHvoA5nTTgkHIIbbc9Tm1jZ+W+ukgCYllOmgekZUKPNB0qa9o7/ZYGsJG9Qb0+F/8S0hWpag3FFj1/xM8LT4ZHI2PbVNc8QB/+6/sMVcY46jvWzI4OnCqbsKTvcx1MruymCkG1znoDTajzfxedS4fV03L1djUKjTWrTrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7728.namprd12.prod.outlook.com (2603:10b6:8:13a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:52:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:52:47 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Nov 2025 22:52:43 +0900
Message-Id: <DE52C66F2TU3.1SL57EIBN2X78@nvidia.com>
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
 <joel@joelfernandes.org>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 13/12] nova-core: sequencer: Refactor run() to handle
 unknown messages
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <20251104232626.2277008-1-joelagnelf@nvidia.com>
In-Reply-To: <20251104232626.2277008-1-joelagnelf@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0096.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca4ffab-56de-426e-2e49-08de20606e52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2FOWEpPTlhrM1piYk5POUsyYk9OeXhaYnVHK250YkJwazcrUjd0SWEyUklJ?=
 =?utf-8?B?alNXaUI2LzZPMUFjN0pVVVhEcFo5ZUMwMVpJb1hCUlo5R3JIU1AwbWhlWmJ6?=
 =?utf-8?B?aEdzL215OGpQWjlkYTR6QWZNMHdCR3BwM21BckpzUlNDTWQ0UTE5aHRLSDlu?=
 =?utf-8?B?dFdXL2ZEa0I4K1pDMVRFV1RWalNFZnRKMkY4a2Nhb1FQQTF5YUZGQlhIMnBB?=
 =?utf-8?B?Vm1Wbnlkenlkb1RaT0dkVkM5NWYvOHQ0ZXB4Q0kySG1rSmMvaU5rNnlKTi9D?=
 =?utf-8?B?ZTN4S3BTeXJMS1VUaktSQjhYSmJITFpobUdMNGhiUkhlZnh4azdnczRYUW5M?=
 =?utf-8?B?SlJaS0dQNHFqRTFDRFlKNEJoRGw5eHdxODQwMm9nRW5iM0xTY2FKaklSZ0Zo?=
 =?utf-8?B?RUs2czZXRnRpWU9UVnN3YXg0K1JGb0Uwdk9NalhKTDNFUGFBbFJHZ3NhZU5C?=
 =?utf-8?B?WHhRSnMyNlNOTGhQYXZOQ01VNVU5NTV6OHdIUU5Qa1lWRHFYQmxuV2pNblVx?=
 =?utf-8?B?UFdGT1FkNXlCUTNVYlNlZ3BRNi9QTmZDS1NtR3prNzh6dlBWQ3p3M21iTm44?=
 =?utf-8?B?NnpZbGpJbUU2OStxOEg2cENEc09QUFN3ak5VbnRWaXdLWTR1a2d1MU1oRTly?=
 =?utf-8?B?OThUZ2dhUjlBdEdoMkVKVEF5NTVFVkFDaXlTSGJTMDRjRXJsZk55aDVkbXF4?=
 =?utf-8?B?Y0cwbFhnd0RhN20zcW9RZWk4b1ZOTGgrNGNaenBjc2ptdWo1SFNZenRDUDdO?=
 =?utf-8?B?dmVUbmd6MjJmZVJORE8yc1FXTUoyaDNwdUFpMFJVS2xyeWY0U0ZaUmhtN0Rh?=
 =?utf-8?B?ODk2YmFmcXVNSWtZSjBCRUxlUytRWlQzOUxzdEgyZUVSdGdIUlpBcG1nR1Jl?=
 =?utf-8?B?aDV5T3VrWmVXajlYZEZZbTRiNHIySWtrRU5lTVNkNUttYW5uWk8xZzl2M3Fi?=
 =?utf-8?B?Znc3M0dsOWF3VEVyUFg4MkhNN3A2TmV2YUJLVDE1Nm1lN0thdFpPaFJuclBQ?=
 =?utf-8?B?NXZpaWxld1QzUmdadEFON3d0MGh5ZG5LbG13T0lmTjdTSDBuN2ppajIvWDFQ?=
 =?utf-8?B?b0JKSzlYMnFXb2NwOU05ZTA2MHFpbzlwWEtXY2JNb29Ib3p0MXZmd2RnU2Ex?=
 =?utf-8?B?Tk1pUlJReE5CQWlFcXVxem9BOFVmNzQ3SWpzUXMyZ3NRSUk4MHMzai81VU1i?=
 =?utf-8?B?TjQ2Q083cjIrOWZONUlaMVRVcjIyaXM5c0JsREZMTG43bVdUejRDNHB6ditM?=
 =?utf-8?B?cklkTUFwa3ozMHZuVStlL1hkVndHYmZ2VmtodXRtelRjN2JsbTRXVTJjaXNp?=
 =?utf-8?B?QkxISTNTaHl4U3pFL0ZnTmV4SWtqWVNrQVpTblZCT3kwOUVuNk1iaXB1Undp?=
 =?utf-8?B?RXJmQWtNSWIyOExqSUNIVElEd04zM2hRNmU2MVQ2UmtvZ3Z4ZmF4Q2JabXJW?=
 =?utf-8?B?dHBqUklqY3A5SU9GNjZGajMvU0liYnFseFZtS28vYXYrTzBmVWdnOFlObURG?=
 =?utf-8?B?L1hYMVdtc3F2V0YwNTZvZWVUY29xcldaZVZNemRYSEdiazJKVk8vMHBoRGlY?=
 =?utf-8?B?UGxWNncyR0VhMGV3OEI0WDBPSVJTSW00TVJFNTczOVYvY2VPVzRtbHNHUHpF?=
 =?utf-8?B?dDNHOFlMSXBtRERRRE0wYTd6aFhQaFVTMngvM0c1bGZTYkQwNEhTQVFwT0ZS?=
 =?utf-8?B?b3k0ZUZla0F6NnRrTEN4L05XSi8vaWczOEVldkFHcFZtdHVIWnNCdXlQQjlU?=
 =?utf-8?B?elhDaCt5VWJzTmxBekxMLytrbkg2dW53UWp0VEh6USt1aHA1MUhKYUhLTnRU?=
 =?utf-8?B?Slo5TUpWdmlQckpBVUZUMmwyd0xxYVFpclJwRnFzUDlESm5ONjZOQzdONGkr?=
 =?utf-8?B?bkhuRC91ZVpqV0JEWEx2Q1hhRnBHeUsxbTdWSW5EWE5JMzhKMTV5cFFGRFFV?=
 =?utf-8?Q?UhT7p/OxjQFCQD3NTMxXyK8TBeih3EXp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFR2S1oyZHVKUDlpeTlEaU9ZbGlxQk12NGhLL2lUOFNxRVRkU1BLNXRVQWdp?=
 =?utf-8?B?aEVHdjBGVUlnaVZ2WUladXVVU2tuS1NLRjVVU1pLMW9sQkN0V0pSN0pZekxR?=
 =?utf-8?B?OUE3ZWNOVVNzL1NMNHM2a2Foa3A1bHJmemlzdWNXRE1GcmhSUFpIZHF1d1Bm?=
 =?utf-8?B?aEdlaTdFSkkxdVd2ZXVuMGpGdEJUNUNRQ1Bhby9GSklHWTdoTkZaQXJMc3h3?=
 =?utf-8?B?ZG9IbldNM3JTdVV4anVZc1U3SElleC9aR3Jzak0wMGIyQ2ZueTdkcG10ZDVE?=
 =?utf-8?B?R3BQeDlnVFV6enpXZDQrL3Ftd1RpSmpCdTVMNEY4ajQ1V3FiSkRJUnVJZURL?=
 =?utf-8?B?OTVIcSsxcXliS0o2YnFSdDY5S0VuZS9tWXRBYnFBWm1iK3NvaEs3WEEzMm1k?=
 =?utf-8?B?Z2U5dmM1OHladDVDZ0Zib1lZMTBMU3hBeFlPVFJobmY4eUlTcnJQQVE3aUZh?=
 =?utf-8?B?M05rRDRPUzJGa2VTM2lqdlpnVWdnc1EzYVlKNlhpRXpKbmM4c3JHUGlKbVZN?=
 =?utf-8?B?dTdvREFQd2tiQmZGVVZNVmYyUGIrSndnaitESnlhcWNZRkxmb1hHMFhGdGNK?=
 =?utf-8?B?VytFYWx5L0FPVlNscE42eVU0Wlp3UldWUEFkWk9PU1o3cDlhdEIyRHphdFFo?=
 =?utf-8?B?Y0ROeTZVeDRWOUovTExXSHNrY0o0ZHN0eDUvc3VOZFEzSTFWdGRib0M0ZGpX?=
 =?utf-8?B?OFFmbWZtNDlvN2J0TWFsbHZ2RHhuY2ptN0tNdjRzRHg2ZVRreEUxbTlNUWJu?=
 =?utf-8?B?bUd5dnlJMGZBZ3JtWFllZzQwMjlkdkErOExtNzR2MWNsQWF4U3BxSGhoeTNE?=
 =?utf-8?B?Y2dUZDVBUWRGdllsMGFNdE9XQlNuNlp3SkRMWUtpZkJFeXpxYjVHQjZ2d3lN?=
 =?utf-8?B?VUloTnlYTVJpMzNtUklsYUh4UHNHdmliNmRUMGpZOEs1VzdPOGQ2Qlp6c1VW?=
 =?utf-8?B?WVRMWFVWN0o3dVRTZXhaQ1lCcUxjcCtvUFM5bVlVQktFeUZ4S2d6aG05NC90?=
 =?utf-8?B?K0M5eW5GMld4RDhDQUJlVWkxamx6RzN2VmNMcnlPSXhYM3M0WVBCalJ5NGIy?=
 =?utf-8?B?cSsvWjI2a2pNK3RSVFJkN3VhaWoxUW5PT0lRc2hBRnRTTkltUjlyVGFvMXRp?=
 =?utf-8?B?OU5xcEFwRDZHcGZkc1loMi9ySUpvbWl3UEhHTHJDaVZBNXZwdnVNVDZYZndQ?=
 =?utf-8?B?cldrcU9sYlRKUXlvM1FBZWdVc3ZVSWFlZGZMVW1UQzRJdUgyMWFFKzlZem9n?=
 =?utf-8?B?NytkbTNGWmE2MlNXek43OHhyc1FlVE9OUXMvcDY1cFFEeDBLR1F3WnhSMVM3?=
 =?utf-8?B?MlBXMkV6OU5oK0hpR2lNVU5IL2lSSGxKN2xiRTI3YnJxV2Q4US81MEJoaFF4?=
 =?utf-8?B?TFFuU05WMjJqUmNnTXovUjN0VmpmYlI0cm5zQjZ3OUpVL290MHpsNTVZMFBK?=
 =?utf-8?B?ejNpUjk0aGdmbGJxTmYwcU9aMHZKZnFXSUFhVktNcWtLUUZkaG9sNWVUbmo4?=
 =?utf-8?B?ak1QUDlrZUw4L2FJOUw1akIwM0wrTVJ6aUFCNjBTQmF3Nm9Hdk5ibitocFJu?=
 =?utf-8?B?MFArRlVkcFhCcUN1aFdZS2UvZGVjbU9iTkh5ay9uc3hVYkd3VVFpSnlqSXA2?=
 =?utf-8?B?NzlCeTRnU0Y0djJDYm56LzlWclBUSGxocnhIdnRRUzVoeHI1emt0RGlSeVM0?=
 =?utf-8?B?TFNsem9iVVRKZk16WFJjdkZtRVlhbkxrQ0ZIczdmNkRSWDArT0ZhMHZRZW9t?=
 =?utf-8?B?ZVMrVXBGS0ZDUkRiVWJmeitKNTZsR2xDV2d1ckZGb1hlZ1djcGhodFM1MXBR?=
 =?utf-8?B?TDBqSFFEY3I2a2JPT0g2ei9hazZnRHlXME5SQTB2cC9XejRCVm5ZQm1oejcx?=
 =?utf-8?B?TWI3RHREeHNaM0JRc2M2NmFpZ2pNSmMvdytFYzZrY0VlS2s2cVBBK2NwVU9a?=
 =?utf-8?B?YzR6aGpCSkdWenZ4d2IvYUlncHdQd210UVFURTU3ZXhtQ0FSbFhlZERKNGJC?=
 =?utf-8?B?RjdhcTJrWTI4VTZpRUo2ZHczaFVjZUxKNnVmYmJBaUNLV0JRNkFFaGJWL01H?=
 =?utf-8?B?Y1RaYkpvUlcycWRDdURPbHlUSTJxTWpzQkFYRlpXOE9OWEluZTIvR0x2MjF6?=
 =?utf-8?B?anFuTXd4a0tZTDZKU2cycnRGZkwxU2VPc3hJZjBGVUhJdGxseG9lcGV2cVpx?=
 =?utf-8?Q?tFHsQF8NIje3F/vnYu0HQKUd7IE4+Hr40iDWyNvFHXf6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca4ffab-56de-426e-2e49-08de20606e52
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:52:47.4772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+UyP/9DJgYunKDCpvevBEn5KWtJVAnkTr40dv9/4rpW1IrQxvk2StzzqYNt5bNMIkI0GdcD1LMi5oRrCuoKDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7728
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

Hi Joel,

On Wed Nov 5, 2025 at 8:26 AM JST, Joel Fernandes wrote:
> Refactor GspSequencer::run() to follow the same pattern as gsp_init_done(=
)
> by wrapping message reception in a loop that ignores unknown messages
> (ERANGE errors).

Can you squash this code into the appropriate patch when you respin the
series?

>
> Suggested-by: Timur Tabi <ttabi@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
> Additional patch to cure probe issue on Timur's GA102 (which happens to r=
eceive
> too many NOCAT records).
>
>  drivers/gpu/nova-core/gsp/sequencer.rs | 86 +++++++++++++++-----------
>  1 file changed, 49 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-co=
re/gsp/sequencer.rs
> index ecc80f668dc8..b98e5146abd8 100644
> --- a/drivers/gpu/nova-core/gsp/sequencer.rs
> +++ b/drivers/gpu/nova-core/gsp/sequencer.rs
> @@ -35,8 +35,8 @@ impl MessageFromGsp for fw::rpc_run_cpu_sequencer_v17_0=
0 {
> =20
>  const CMD_SIZE: usize =3D size_of::<fw::GSP_SEQUENCER_BUFFER_CMD>();
> =20
> -struct GspSequencerInfo<'a> {
> -    info: &'a fw::rpc_run_cpu_sequencer_v17_00,
> +struct GspSequencerInfo {
> +    cmd_index: u32,
>      cmd_data: KVec<u8>,
>  }
> =20
> @@ -125,7 +125,7 @@ pub(crate) fn size_bytes(&self) -> usize {
>  }
> =20
>  pub(crate) struct GspSequencer<'a> {
> -    seq_info: GspSequencerInfo<'a>,
> +    seq_info: GspSequencerInfo,

I've looked at how `GspSequencere`, `GspSequencerParams` and
`GspSequencerInfo` interact after this patch, and I think we can
simplify the design a bit (based on the v9 of the GSP boot series).

`GspSequencerInfo` is actually the sequence (so we should name it
`GspSequence`?) we want to run. As such, it can be created by
implementing the `MessageFromGsp` trait, and received directly from
`boot.rs` by moving the loop at the beginning of `GspSequencer::run` to
`boot.rs`. This allows to remove the `cmdq` argument from the `run`
method, which looked a bit out of place.

In its place, we can pass the sequence to `run`. It doesn't need to be
stored in the `GspSequencer` struct, as we can just implement `Iterator`
on it and read its commands from `run` directly. Once you remove it from
`GspSequencer`, something interesting happens: `GspSequencer` and
`GspSequencerParams` are now exactly the same! So we can remove the
params, simply build the sequencer using a regular constructor, and call
`run` on it with the sequence.

