Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF00FC60524
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 13:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF8310E1C1;
	Sat, 15 Nov 2025 12:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CvN7DJd7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012042.outbound.protection.outlook.com [52.101.48.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AD210E02B;
 Sat, 15 Nov 2025 12:37:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9gzb6ej1WaqghQJcUM/0PkJ1157jTjIjxjGHPoGsDs5HUnanbccrL1w4ASRfETSt7hzTyusrrnjD/AqqUUA2L8QHo9JIadn7ynC16OMcKt3SAkViv61qBOo2tL4uQGD1k0cd802om0wUFlHWfKoIvCAmZ4kfkruI9YF/0gblRRsFEc9IUjTwSWlND+fhW58ZA7n6E72usmjL7S7cNVfMkp25lEblDcwniH7Q2OAeIVdbFMGAu3YlANI6Liqi/eO/Ls/9BE4/ONDqySAuU0udkl23CiR/b/jZjjh5LdhLylP+GQlLobpug4JRC+1CU8Naf5FsgU9uCBe+MlfrFrLyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WrP7TRYP0jX1Bmi4OukychMuCoOX0B3FaxnOKFltK0=;
 b=AiHAOs4Z6k5ZZzBh/pVgHg7c6u9XOjpb7Ycw4mXFxnVX/1Cp78p3jAXVQFgYGVxoFmiwL6XW7tNaUTAN3SYm+H7REYsbAKygP9lTUhA0ELFR36udEAyzKp+oV4nh//f4GSuv7nJwtNxtvCA1QqvyFntPO0VYoNAOZybUo7GGqcoual0wu2ce1An54LhwhS+gk8unrvqConZsoJfCW83hrlzzqEJHjCGNTe5bVm4V79olUC3g3401m9HLNNvILOtfoJz3knnV1gqb/uciJZZUkXFEu+QVtNuJOMUW5+/+qDTghbesNHE4Ja+rT6Ls2mGqu55yoFpd5LgO+2z/i+uhyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WrP7TRYP0jX1Bmi4OukychMuCoOX0B3FaxnOKFltK0=;
 b=CvN7DJd73x1WKeNd2dAT3kc8z1/L41muyabZI3khCRaa9YEpy3m/tZNcHgGDGrIMzI9csoRs9otO89GihcxiN+UK+89kVN2cXhw3L9K1JPAbt//F54VX6C1M6UMasI6vRZbj2LXVnIeBp8UyqyHRh0++8nJmdnbtTXlIV4kY9ysplgaZR3BenBfWdX8x1jo6NdCRoXOruQiU5jVus8M3L0MdQ68xJNWJ1yCak2UQUQ75kGmU68Q8SCLzuamSZmKdvSYw1XM/LD2sln752UyGfLQ6cx5oTFRfGjxpAQP6utbZtjtDgRuAfxDTcBys9RmwBTR6jYZ9r9eNeDq8IRLWhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB8466.namprd12.prod.outlook.com (2603:10b6:208:44b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Sat, 15 Nov
 2025 12:37:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 12:37:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Nov 2025 21:37:05 +0900
Message-Id: <DE99UZ5ONZ4G.13Y7574M0YYHU@nvidia.com>
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
Subject: Re: [PATCH v5 08/13] gpu: nova-core: sequencer: Add register opcodes
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Lyude Paul" <lyude@redhat.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114195552.739371-1-joelagnelf@nvidia.com>
 <20251114195552.739371-9-joelagnelf@nvidia.com>
 <8436e9b42b897c044c253e3e99f260b5a62fb0d5.camel@redhat.com>
In-Reply-To: <8436e9b42b897c044c253e3e99f260b5a62fb0d5.camel@redhat.com>
X-ClientProxiedBy: TY4PR01CA0112.jpnprd01.prod.outlook.com
 (2603:1096:405:378::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB8466:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c044451-5b7f-4768-8fdb-08de2443b102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3lGZC9jeGNmNTdhSnYyb0M1WHhXYWdYaFA4S0tFV3pzcTVjbUNKcFNGV0l2?=
 =?utf-8?B?RHpkdTFyWVlTRE5Qa3REeUxlYWtGMGN1aXV6UEplYjRsWW8vTDQwUnRKVjVu?=
 =?utf-8?B?VGVLN3IyQkJRUXBWczdNczV6OW1VeFY0YWpKSXJ5MmZRZm9LVlZaN21JZG1o?=
 =?utf-8?B?dDJUWGx5Qm9RRUJaNUdLaGNpRnBsRTJjNU5vU09aZGRKSFpoS3F6YXZuQ2cr?=
 =?utf-8?B?RjdxZmxBdlNUTmo4eUU0NGFJcUNaKzl3czZEVDdZWVhWaXE5VGNkY3d3TVhP?=
 =?utf-8?B?cjRIRmtEREVxK3YxYU5PVWp5Tkw4SE55RmJBT3Yxb3RVb1J2WEh1K0hFcHdm?=
 =?utf-8?B?M0VxaENWSFhsQUhsQlBEa09JR0ZKQjlkTjdJZnJ0SFNjbjc2WTJCSlIyQXhN?=
 =?utf-8?B?Vk93bHAzS3k4WXUyK0JMbmc0TjJMRnVBSW5GazhjWnpXTTI4WHpaNHkrTWtL?=
 =?utf-8?B?ZjgwMmcvWTZkcys1cndWaXZYNHQyQnh4dm5OL3NTTVZzUFZHWkhKT2NxdFh5?=
 =?utf-8?B?ZUhrWis1V0cxa2Y3ZTdMK3UwYUU3bVhJcXhtMjRNRDQvNGN0RVBCdUkzelgw?=
 =?utf-8?B?d29EZFRGYmNwcTJXYzBEUlc5dHJNL2FKN1g4bnZnV0dNSCtINXJtMmY3WHhS?=
 =?utf-8?B?aGhrUG90Ylg0dEhPNXRIeERuVWN2RkFVN1FTVTJOUHZGVnkyRitKdU9Wdmcz?=
 =?utf-8?B?SkdvVDZxVEdzYitma0hRTUdSRmQ1MFNJRHFwdFQzZGxYMnU0VTl6blJndG5y?=
 =?utf-8?B?RkVuOE1PcmhxaUt6aVNkTkd5V2xIa2tpaVc2VGRsbDJDZGlydCt5a2RVY09o?=
 =?utf-8?B?d1Fpa2FxcXhKSStZNk1Rc09DckhpeGIwWEgwTm82U2NKaEgveHl1U2RtNERL?=
 =?utf-8?B?dTVHbUlYbWhob1FQdmVxZXl0bEh3ZzVZQVVxNlBLK1lQMzh6MnJuNHVFd0tS?=
 =?utf-8?B?MEh2Mko4QTU0RnNua0k4NXJXRUNDZ3VuQVFmS1VSaC96RUdjM21RUWJqUkdM?=
 =?utf-8?B?UXEzaVVmU0hZL1diMXUxSW0rMzRCdWFldUdCcGxSQ09GOEQxK2pkQXhWOFMw?=
 =?utf-8?B?QS9EUmYzUVZtT28xd3NkUWFLckJ1QXp3RnRwZHFleUk4MkxmdC9ZclBsWWJC?=
 =?utf-8?B?bm9TazFad1U5R25TR0JYK1BKemZmYVdxQXY4UWRQODhPbmNTbzRCcnhXTndp?=
 =?utf-8?B?Y1M2Y1oyTXo0RmRJYzRtRzdyVWZYV1VDV1d6aFIyeWthdzJkaHRSVnpXUUk4?=
 =?utf-8?B?VStXSzZadWVFdzM5RU5JVGJtcUR5dG5vSCtrN2xGc0hiMFV0ZlVSV1VTczdr?=
 =?utf-8?B?TzNTbFEzMEJwclh6SFB6a29Ja21zc242Z3NKbVo2a3FYUnpBU1BjU2RqakRh?=
 =?utf-8?B?YkRmNk0zaEVCUHZZWmlWazUwWldiN293a0FxcEx4T0hMZk5CUzJ6OEZHekZp?=
 =?utf-8?B?SXR1NGVYbENTTEFPUlAzeXpVV3RQVUpWZ3ZnWVo5YkFBeG5CcWpmRUsrT1ND?=
 =?utf-8?B?RG01MmtaQlMwRlY2K2RnTU5tY0tFS29oMHB1bnd4Y0NuSFVIcDkzdGZ3SlVr?=
 =?utf-8?B?Skk0ZFpiK21nanhzeVFjRFFwMktSNG8vSmFtRnF3VW5Ra1FjVU15WElVcU8y?=
 =?utf-8?B?Z3VBSXc5VGNtSVdQOC8zK3dvRkZLVzdhdGRCQSt2bk4xaDNXSG5rUUtpQUkw?=
 =?utf-8?B?c3puc2hHWHd2S21sSFNnOTBnd0JuaklMSUJOUGMzT1F1a1YzcnhkSlNZbDh4?=
 =?utf-8?B?c2hHN0NhVDBidnV1TG9sUUc0cUZvczA1RlVjVHpVK2JmbE8vN2t5U1lRdDk3?=
 =?utf-8?B?UE4wZjI3VzNxQXM3ZHFVOVVjdUFyRlhxUWE4aDFnclJuSjRUR2twOWNQWkRq?=
 =?utf-8?B?QWNxTlA3eGMzN3REcVFmTHNWRVR6TlJzK2lBMkQ2UG9NaXlhdzRadnJNZ0xw?=
 =?utf-8?Q?Bw1yLkhysrSAA9R5u7VaXq0JvepU2vDy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGxCZFkvZ0k4bkFUWFA5bUR3OGdUaVQ5V3dyMzFNekZCYVM3emhsWlQ4RUlt?=
 =?utf-8?B?VHdZMkdidDNqQ0w1dTNJaUdrSWFLeUhCWmpxMVY5dXRiZUhybGJSRlBySGg5?=
 =?utf-8?B?d0VTajNUZkRGNUo2QlBucVEvcXo5YmtUVkM3TWhzTnlHRW1jQXZsQWlNK2pu?=
 =?utf-8?B?TVBGUXBZS1hSZVRvQmVZUDJIZlo1cTNLMTNLaUdSMWpQTW5sZ1JtT3B5SS9I?=
 =?utf-8?B?dVNMMHI4Um15Z0p0Uk5PMlFoOHRTVGJXSldOZ0dHUWdFU0tzK3EzMmVIeHRS?=
 =?utf-8?B?T2p0WjhBVEFzTXdGY2E2Nk00M2VPOUpKY3dHdTRUUEU1WGlid1dFa2JrbWRN?=
 =?utf-8?B?Mis1OHlzbUR5QVQrajcvQzBqVmNwMThxSlppa2lBL0lXRE1JbmZ3YzRDMG5G?=
 =?utf-8?B?d2F3RHVjOXJYUmVFRUZzU3E5VWZXN1E0QVZUaEhraVpkeERRZElNSFR6SXlF?=
 =?utf-8?B?UTJ6QmxBY2p0MDh4dDRydmVOYmcvQlp3UXF5dTYrR2JpVElqQnkzMDhhTjBG?=
 =?utf-8?B?VVRKenptcDNObGJMUi9TNUpFT1Uzd2ZLNVVJVmhHMmNnU01ob1cweWVPY1lJ?=
 =?utf-8?B?M3E3cllLaVpqRTNJckIyR3lqSHdwdlJSVGNOUnFWUXkwTFF1YkdYa1BrWFdh?=
 =?utf-8?B?QlVJQW5IRmFCRnVzcEpYeGFrY21kblorWXZ6NTcyc0tUTU83cGRaZ3JLSVVH?=
 =?utf-8?B?MTF3TUMrTHA1aUJsTFl1cEVMM3duNEMyenpKMlhTY2xOM2MrNEJZbFhVVVJv?=
 =?utf-8?B?T1FjaDg0Mk5ROTlPK0FXOG56bzJmUFUrMVdTQVkyVDN6cGxGU2pERXJUd3N6?=
 =?utf-8?B?ZVdjL2lzcTl4YTExaVdLU1ZPOWVLemJFaTJ0UHVDdnVrZzd4aVlCa1FHUzBm?=
 =?utf-8?B?WXdEOVZDdWhydWg5Zkhyam5PRDN3Tk1PRno5aHZLZmJxb0ZYLzNQT2t4MXNy?=
 =?utf-8?B?MHg2eDFqRTRpUTZQQUFRcTR0VGtpdk16bmtjd21XcjZJUXV5dlhDOVlzdmQv?=
 =?utf-8?B?K3B3RXJORFhMZFlDQ0JiZjJPekRkY0dsc004cUJOQXpjYnFDTmFiQ3pHTWtu?=
 =?utf-8?B?UFc4cUxldkNnTlBSVlhQVFVVOXpKQnFybVZhSzdIZ1htVkdqcXVmek1TMzZm?=
 =?utf-8?B?VTFGMzY4cmNuSFU3QVdiV29iTVl3Y0hGM3g0cVJDQnBvbEFHZktqTE1HYU1K?=
 =?utf-8?B?aWg4TXN1ZFlCdFNvMFpwa1BrbWJSR1EvTUxGVWEwVEIzMkdTdnl1aWVLQzZF?=
 =?utf-8?B?aEZoSUxGVkdObXl6UHdoYXl4Q0s0c014YTZlWVMyMWFRUHBmdjNFOUw3R3A1?=
 =?utf-8?B?Y3IvejVyQXR2RjV5QkpoSytDd2pMSVJrVlAvSHdqVktwNW1jVVRlbmlmTWVi?=
 =?utf-8?B?dXluTWM3YldkSjZGTlVETUFTb3lka2V5cFg4ZVd5MDVKYWgzelFNcUNOTU1G?=
 =?utf-8?B?QXVhTkduR2llVHk0Y1hCU0drSDJxN1RaK25jaEJ6TXErRU5aaDJabzdHejEr?=
 =?utf-8?B?YkFRQVJDMEs4eWlTQ0tBd1hGYk5mRi94MDlvY1RYdDB4dk1aYThGeEdMSEx5?=
 =?utf-8?B?S211VnJBcVJLamVNZmNTVzFRc3IweHFxQlJOaG5GYm1qeWNCT0hKU3ROWHh6?=
 =?utf-8?B?LzdVd0NnY3I0dXorOXEvbDlRM0xiVGtub2trUk9QYWV1WVBwakhvOXJXVkgr?=
 =?utf-8?B?Yi9VNUlETEhRUzIxVGgrLysyUXZDRklDSlYyL1BudU1aSERuc3lneUNMQUtj?=
 =?utf-8?B?VzRiNzVZeGNsRVhOMUozWkxWdVJQL0FLWVkwNVcvaWtyblBxWE1RZiszcjVE?=
 =?utf-8?B?UlI1WElBeFpTY3FlNTA4eWJROWF5MEhmLzhmWEEwR3pzSkhrZUhxUDJaOXI4?=
 =?utf-8?B?dDNJYnNWMElKalR0M1FXcmRINGVacW42WHBaQjRqbjRaa1Q5UmxrU1N6T0J6?=
 =?utf-8?B?dG5vZzVQT3ZKRWRNbGVsamRDbUJlcVJiV1lobVh0RmF1YS9oMlVaTkFYS2Jj?=
 =?utf-8?B?dFNpVzY0WE9vTFROMDg0enJUbDl6RWFPUUR4YzRPcVdJOWd2MndDQzFaMmhh?=
 =?utf-8?B?ajQ5Vy92RTFvMEhMUHhIZWwxcEM1YVhDVHp5OXFGbDljLzNHWHdRbG9xKzNE?=
 =?utf-8?B?dVFKaVJhc3ZhSm9BTEZ1eE9XMWNuc2QvQ0xoZVM5Rlo0aFQvTi9hS0MzNjlv?=
 =?utf-8?Q?7C3BXh2UWrPeMBrmrwMr/5xFvO+24ySxmJdkpeor2oW9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c044451-5b7f-4768-8fdb-08de2443b102
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 12:37:09.2180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+eyZuGFstPTc46ZHINmMFvVdlWACPfkd8tbWT4rZLCGvFKrNX4Xhz4kO1g7sJzIYmUQhAMoK/LIUxZp9k383g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8466
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

Hi Lyude,

On Sat Nov 15, 2025 at 6:55 AM JST, Lyude Paul wrote:
> We're very close! I see a few things we still need to fix though
>
> On Fri, 2025-11-14 at 14:55 -0500, Joel Fernandes wrote:
>> ...
>> -impl GspSeqCmdRunner for GspSeqCmd {
>> -    fn run(&self, _seq: &GspSequencer<'_>) -> Result {
>> +impl GspSeqCmdRunner for fw::RegWritePayload {
>> +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
>> +        let addr =3D self.addr() as usize;
>> +        let val =3D self.val();
>> +        let _ =3D sequencer.bar.try_write32(val, addr);
>
> We're still not handling the possible error from try_write32() here
> Also - addr/val seem a bit superfluous

I wonder whether this could be on purpose? As in, the register sequence
might try to write to non-existing registers on some models but this is
not necessarily a fatal error. Still, I can complete initialization even
when handling the error, so let's err on the side or correctness unless
Joel signals that this is indeed what we want (in which case a comment
would ensure there cannot be any confusion as to the purpose).

For now, changed this to:

    let addr =3D usize::from_safe_cast(self.addr());

    sequencer.bar.try_write32(self.val(), addr)
>
>>          Ok(())
>>      }
>>  }
>> =20
>> +impl GspSeqCmdRunner for fw::RegModifyPayload {
>> +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
>> +        let addr =3D self.addr() as usize;
>> +        if let Ok(temp) =3D sequencer.bar.try_read32(addr) {
>> +            let _ =3D sequencer
>> +                .bar
>> +                .try_write32((temp & !self.mask()) | self.val(), addr);
>
> Same here

This is now:

    let addr =3D usize::from_safe_cast(self.addr());

    sequencer.bar.try_read32(addr).and_then(|val| {
        sequencer
            .bar
            .try_write32((val & !self.mask()) | self.val(), addr)
    })

>
>> +        }
>> +        Ok(())
>> +    }
>> +}
>> +
>> +impl GspSeqCmdRunner for fw::RegPollPayload {
>> +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
>> +        let addr =3D self.addr() as usize;
>> +
>> +        // Default timeout to 4 seconds.
>> +        let timeout_us =3D if self.timeout() =3D=3D 0 {
>> +            4_000_000
>> +        } else {
>> +            i64::from(self.timeout())
>> +        };
>> +
>> +        // First read.
>> +        sequencer.bar.try_read32(addr)?;
>> +
>> +        // Poll the requested register with requested timeout.
>> +        read_poll_timeout(
>> +            || sequencer.bar.try_read32(addr),
>> +            |current| (current & self.mask()) =3D=3D self.val(),
>> +            Delta::ZERO,
>> +            Delta::from_micros(timeout_us),
>> +        )
>> +        .map(|_| ())
>> +    }
>> +}
>> +
>> +impl GspSeqCmdRunner for fw::RegStorePayload {
>> +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
>> +        let addr =3D self.addr() as usize;
>> +        let _index =3D self.index();
>> +
>> +        let _val =3D sequencer.bar.try_read32(addr)?;
>> +
>> +        Ok(())
>
> These variables still seem superfluous - we don't use _index at all.
>
> This function should just be rewritten as:
>
>     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
>         sequencer.bar.try_read32(self.addr() as usize)?;

Actually I thought this is also a good opportunity to replace the `as`
with the safer `FromSafeCast` interface we introduced recently precisely
for that (you probably have already noticed from the previous fixes :)).
Only this would look a bit heavy if done inline, so for readability I'll
keep the temporary variable and change this to:

    let addr =3D usize::from_safe_cast(self.addr());

    sequencer.bar.try_read32(addr).map(|_| ())

This makes me wonder about the `index` member of this op - it is not
used at all! Joel, do you know what it is for?

Thanks for spotting these!
