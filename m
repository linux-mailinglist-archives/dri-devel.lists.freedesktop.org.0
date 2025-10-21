Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE611BF6DB8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 15:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633A810E5F9;
	Tue, 21 Oct 2025 13:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cZOmie8t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010050.outbound.protection.outlook.com [52.101.46.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92BC10E5F4;
 Tue, 21 Oct 2025 13:46:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F1wY/GcVx9RDjA0ju4YAEFXL4gwlx1x6kcp8h4umf9D6mPOvlAiz3+v85csL5NKLbDgIW13vXz6g7ifHTKtb7YEOHg6fMHRzXu/mtytnAvIPGE5eOiMGIfgNe68wNOpBpncmZC7A+cUdopzK/FX4RruE499a9Ki+SE6uVTJAVKjAwr5xgrPxVEatBvFNoAvzemAe8lUcwoC1W3Kbm1Tm9BqFcvkF1K1N8PU7dRTMHX5ynre6ScjZKavK+wiphQRT5XvnYgfsESAOQP/+abYx2kxNklsuubPGUKtCeoiLhNulaziJIZ6FBZGfSoocA/GhU2WzBfBo2Z5mjRx8EruSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=to7udOvavfpslXPixvbyYVKGwrdINxB3QFJU4XXDzzo=;
 b=bCqw7X5K/vigQXGhe9psPecne0m1X+eb4ayzuWJmdrRGczzSbHUrkeVP5lookEjaDCOYMNCx7x99Chh1Pyf9DbJH+MoNVrRka/lEBGvWn5PDWXNYv1/KQVWyI+YYCvSf20rv0fslTjQWa1Vn64oaHgxX2uLMzY5JcH6jKDzrd9USnlhVR0V4K3lIAs9GsHqz19RiWDxSZLTjiDQC86puDm9JCcWdlVU/EAohOPIolbB5BQV63+5driqdOYcTQ9E+4iOYiMdv5TF1a2fffYLgGIaoqY+2NzYVaXwrQoWmyYkSUDPOY/VMb73IRLXOLgp3AVwTu9mrM3DNRIQoqTVl2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=to7udOvavfpslXPixvbyYVKGwrdINxB3QFJU4XXDzzo=;
 b=cZOmie8tZZY8Cmmk7CfvZ5XC/wZEoStuP+UeS+fNUaUm87J/FJ4St7ueZisbcZpa3xE3AiJnDaBxykWFWFYSVpLl9LiQCte2WyyI95aYlxCrPen3jqraQz+J5E2b1VPPjTl8/beLPtFzIV7/v+22zkh0xLkNa1Hn6nUsxs7E/h0Jh489IvquGeh5YL3qy4QFfWZKhOTHSffzNZ2drlP3dLlcgMQ2vCJXHYVRT9qsmz+0CUytEJarcrW6EYA3wmaTlTS70b2P/NPy+evKACDgb0Y/4adGrgYTqN0zITysvclAIo39K2cPMAyMpX4HxjfxTSkwT1KsM+1frwWuOUAi9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by CH3PR12MB8332.namprd12.prod.outlook.com (2603:10b6:610:131::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 13:46:36 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 13:46:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2025 22:46:01 +0900
Message-Id: <DDO1O4XLJVHR.1642YK4GK85CT@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, "Alistair Popple" <apopple@nvidia.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Yury
 Norov" <yury.norov@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v7.1 0/4] bitfield initial refactor within nova-core
 (RESEND)
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251016151323.1201196-1-joelagnelf@nvidia.com>
 <DDLHP1ABV9BA.3V0NXW3RWHGL6@nvidia.com>
 <059912ef-6023-4af4-a8df-f4b34fe98e71@kernel.org>
In-Reply-To: <059912ef-6023-4af4-a8df-f4b34fe98e71@kernel.org>
X-ClientProxiedBy: TYCPR01CA0004.jpnprd01.prod.outlook.com (2603:1096:405::16)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|CH3PR12MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: b77dc1f9-3094-46b4-31a1-08de10a8322e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2FBbTZHVm1sYVJlK0czWjlNV1dpZEdHczJnUE5RRE0xOWNwbWRyZVhway9h?=
 =?utf-8?B?bkV2NEIwVzZvSGdKV25PTFJ1Wlo2NTdCb3ltWlBzS2ZnbjEwai96UUJId3dR?=
 =?utf-8?B?UkxoWjVZM0RlbWY2Kzk0SG5qa20rMkFiR3loNWNnRDhvMGg1eXpaUHdxVDNo?=
 =?utf-8?B?UTFKK3pCNVQvVjBiYzJGREk4RW12QWFDcWZ0clE0WlA3VWRVUjFvcE9sYVR4?=
 =?utf-8?B?UmRUak9rOXpvS2duR0RZakxZTEFrcWJ1anh3MGJvc0lldUNpRjJlQ1NVQmtU?=
 =?utf-8?B?WVNuUlNVdFdwK1JYSVN2QWRMcHJBVUpvUk5nTVpVQmFHeEdUYkZYa3lZbDQ2?=
 =?utf-8?B?SWttcEc2aHM3Y1NNZWVYZzRsOVlSQzBJaFNVZE1KYWNiSUVGaVZHQitPZUQ2?=
 =?utf-8?B?MEpGRTZRVk9DVGZlaXRudDE3dWIrVmVjaVhNMWtaUnJ3T2tVUGswWjZ0RFRF?=
 =?utf-8?B?Z2pJTkZIUUdTSWlzaElaUWpaM2xsSGlSUU9iQi9DT3k1SWUycHR0R1h1cURa?=
 =?utf-8?B?clM1WlZJRHljcmtyb2ZET2w0V0pGRzZHVVBGeHQ0QjZYaUVEWlUzaURtUnNa?=
 =?utf-8?B?R2xzOHlndTBPbWNOOFlub2I5SjNEeEdUR0t6SHUrNUpQNUFhaXlwbjNTY0w4?=
 =?utf-8?B?blRLQmpwTGhDbVQxaEthYXVZTE1pcmZUU2t2T2tTZ253NUNRZWMrSHN5QjZQ?=
 =?utf-8?B?S1A2R2RiUW1OanRaYmFaQXpTL1VZM04wN2pnQnBVR0ZPZ1JxYXZEME5SUHpW?=
 =?utf-8?B?QWxLK1lYaEFMandGVnA0U1lSRDJNcTBGb0QyTzFCM21MK1JnV3l2Q0l3NUhp?=
 =?utf-8?B?dGdlYzVFc28rdHZXb1Z0TXNVdzdQQ1FZUi8wOXdjN1JvRUR6NFRrZWxOR2lS?=
 =?utf-8?B?c2JZalFxV1R0cEZ3NUF4aDV1NHc1UWNUbSt1MmVNVWZGRjc0QnMzN1FaT2FZ?=
 =?utf-8?B?QU5BeHQ0NVJmM0NNandPcVR6UnhXeHJxQ0dhMVAwa1NrWlZmWk1rUWZZaEtT?=
 =?utf-8?B?ZEgva1pMMzgyaGZVdzVUU21aS09GVkxkcFZUeDFkcjlhL1JIaDVHbzkrd1c5?=
 =?utf-8?B?cDR1S2VVTzE3cjBxK0M4QUVORTBTaG1wOEg0QWRtZG9SOTE2WS9aRS9BQm81?=
 =?utf-8?B?dWxVNit5R0lkRHp2aFlVUFhqQ1NRUHhwSzFNTzhVYUwraEdwWUM0cC9CMFRT?=
 =?utf-8?B?S0RVeWV4dzVVTGVhSGFjcGhjSnZuWWJLb04wN3F6S3JDRHUxeXhla1l6R0Rv?=
 =?utf-8?B?TzRXWUgwK0lXK2JLQ04yY1duRTRTK3R4KytlcXVpa01SLytmdElUN3BlYmNh?=
 =?utf-8?B?Z3ZyRjFjSU5DSFRxNExuS3hJSitDejVwcVpndGJUWmJOTWg3azBlQ2JhMy9r?=
 =?utf-8?B?dEtWWU1adDJ4MlJPRGdoa3dVZFlxSVJmc1o4ZDYzRDF3K21jMkZCQkhCdHp0?=
 =?utf-8?B?c2k5MmtaR283dEVnUTRUM2hkdGFnTWFLRXdISVV2NGpPazhkSkhzcXVDdUU2?=
 =?utf-8?B?OWhkWEhxYnNJekx1TzY2SS9RSVdUd2YzaGFIaTNyQ3Z5bi82SUVOMFBpN09F?=
 =?utf-8?B?eFhHL04zM3hFbUlQMGdHQzlPODJ3N0U3MXVxRkFkYVlRTFRrc0ZYU2YvNzB1?=
 =?utf-8?B?UzNJQWlaODl5UDJ2eWZ1ZTk3M2FHK3pmV3Z3U1VJS3hSWFZ3WmNxMnhvQXpG?=
 =?utf-8?B?ZERVVnBKVm4xUkZ6MFZnbm42YlVxbUxpR0VOWkUyU2E4b2QrOVd3OGlwVGtE?=
 =?utf-8?B?YUd6S3QzaUY1NE9qL2lUU3dCR0xSVDRzb1pzZlVaL1VMOFZNM1I4T0RuVFgy?=
 =?utf-8?B?V2R6ZWIyZXVTditoY2VVQWF2V0QrUk9zVThqK2hsc1NNWng2R2pNSG4zeno0?=
 =?utf-8?B?MkdCaFNVSC8zZGlsdnVGak5uMnVvVXVJT0MzRHB5WkZQS2VrZWtuN1lYcWJS?=
 =?utf-8?Q?87idhu5aObKTCZEcUcT/CHTIq77VxFIB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Snh6ZlNBaUlwNWhRNGVYWTRtWU5LOTVQTGk0RVk4S1RDREpNcW9wTGptbU1Q?=
 =?utf-8?B?UlgyWXArdVFMOW1DeW5oZGp5WnNnR1g5Tnh0WVFRSUIzRURmekI3dUhERFM0?=
 =?utf-8?B?emk1YXZuTktOdWttQTF1d21lTVM4dThZWm9abEFBVkFHL2VvNnBhK1FDMklp?=
 =?utf-8?B?MEhwSHhZWGpHRUhhWHBENlFMYkVHekgveTVOZjF1akowbmhKUUxiZ1hPTkNP?=
 =?utf-8?B?NktvcG9ET0xoeGtMSlBQQ3ZnUmsrRjJsMk1BWnBucUNsKzAyMCtMcGtPOVM1?=
 =?utf-8?B?QTBBMzlSc3psWTlMUW9xN3B2OVBNY05xNFdJeUtvQitvbDQ2ZzJyVHJoTFFD?=
 =?utf-8?B?d3YyVHZRYU9IT3Q0TEpQd05IQnFia3hWTFplT1B0bG5sUEdua0Q2SFNvY0Fz?=
 =?utf-8?B?YXhpOTFyQ3Y0WlFxQU9oZFprSVRtSFRWaVNxd3ZBMUhIZlBXcGpwUWdEM0xT?=
 =?utf-8?B?V3YrL2twclV2VDg5RE0zbW90R0srZXFoZWxQYnNqYlFsZDVkdGhmNXNqVEpj?=
 =?utf-8?B?OVFZUXNGcGk3YVhobmwyT2lMSEZlOW1JTUdDdDlHY00yUzJPdlljYndEYys1?=
 =?utf-8?B?czZQREhWWlRxa25NdmFuTDdKTzZ5RXFuQzNHOEZPTW5YbENSQ0lEYm15cUkv?=
 =?utf-8?B?QUkxOXhxODRuL0NkY1dsRUQwSUZQb0dGSi82TXU3NWxIQmFadTlQbUFjZjds?=
 =?utf-8?B?RDhGeTlOS3VlK29uWUViRXhMdzc1eGd3Y254S1BLNVFWN3NGTmtLbW5ha2Jv?=
 =?utf-8?B?UzhrRUdVS2pLVmNsQllmRC9iZjdRUXVudGhOTlBKdlBpb0VHM21hWDk2NUNJ?=
 =?utf-8?B?c2VIMXFmbzkzTTRsUGZmd2l4VFlXTGVyTmE4KzdjVHNoNUlaWDFCMGJ4dTY0?=
 =?utf-8?B?cFlXUitJNHZabHZ1Qkc3UDZZNDJndzJWVVhTTWF2TGVVRjN0VDNZWUxkZUpp?=
 =?utf-8?B?NXR5SDhIVGNqVVRyb1pmUWJUYkxucytmL3E2RE9lR1BRYjVzblhNbnhjZzF3?=
 =?utf-8?B?NmdnemFEY3RVdU5sdUpkZkRJUENXNjBVYTh0WUNpVmxmZmxEdkpaa2EveWZR?=
 =?utf-8?B?TjU2VW9YQzRtc21Wb1ZTR2paNWFySzFIeUtlbm1nYmxXNDd3eDQxR09tU08y?=
 =?utf-8?B?YzJrTnZINWtpT09wazNpcXVvTlhPN0N4WWVrb2Raa215WFY5MW5XM0RIZkdm?=
 =?utf-8?B?R0ZobURzcFdIWElVTGZkTkRiZ0ZPUUxlSTNFSDN6VVFaR3Y4MmZEVEtqWWND?=
 =?utf-8?B?bUhQL216NXJnVWpzNE5tQ2FEUUhONVpCL2NETHdvNE1uZkNQcGVackNJY0pp?=
 =?utf-8?B?UGI0QlRxSkFxTFRBWVhKNEJwVFF0eTQwcE11Q216bzIyZ1RRN1lHOEtXSHZU?=
 =?utf-8?B?ekpZeisyNzFzNzhRdlJ2MlBEMlhib2htZGFMN2pFMHd1bi80ZDlzK1ZNUWlE?=
 =?utf-8?B?a2JIRHFzcVZqU1o0WVArcXNVT0hRZnFYSXR5WnFNUTI4djBURi9VdVI5UG9r?=
 =?utf-8?B?SXpwbmY3SXNqZHVrbUprTDRYS0tKVkZXSEpaZFZaUWZiMFNtQVRTaEEvSHpK?=
 =?utf-8?B?SDBUWmozMC9BclBaVFhtTUM5alRBRmFxMG9HdzhIR01KVU53SVFCZXZNeElS?=
 =?utf-8?B?ZWdqZEZUcWZuVFJ1M1JQZ0JGdWxNN3VRb1hoWnE2WTRTajd6bnhydHJqR096?=
 =?utf-8?B?ZFd4V2thSGtkbHBETXBRaFB0L0pYLzdyaTkrVmt3UFdOZXcxTzBDZVR1em9F?=
 =?utf-8?B?bDZIQWpKcU9hTjIwL0RkWFhLdjFIWHNYRkNab0J5NS84bjR1R1hPSWNHYk5Z?=
 =?utf-8?B?WXNHYzdJOHZSbzNqYmthMllzYlJkcDNkR2dQMG1MNU94WGpVSXgwZGczb2xK?=
 =?utf-8?B?bXZ2VVZ3YjlHQTR5VG1rZG9kclNmajEweWduaEZ5MVZWR2ErOUFnNC9SeHRH?=
 =?utf-8?B?VjZ3WnNJeVZEcDY2VjhjSTlxNkF3T1ZYSy9RWnJoSUNlRlp6NWNWTmx2OEw2?=
 =?utf-8?B?ZDNmUEdtbmphV1gzTXAwK3VBTUNWc1g4aXo2dkN2dCtpeWYrejh1ckhEVVdt?=
 =?utf-8?B?cElZOVZmVlcvVjNzNXRLaDdiMkYvZkJ4Y3pmSnBNSi9Zam5PWlgzcWt1Zi9S?=
 =?utf-8?B?TXVKelVLQUR1azRLOTcyRlVGZGdsZS9EeHBudGdEeTU4RTNaaDE0VnVCWWhX?=
 =?utf-8?Q?u5ahwwpFAaX4hBOGF0zi3ivrQNgysyiI2vCbj/Md7BAB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b77dc1f9-3094-46b4-31a1-08de10a8322e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 13:46:35.4063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXgomwxH5/PX9gBOXkSS5cuaVMY2JjggzttCcfcdRhzPk0ExOdBx7e5iRP95tiQzptnKSpeIBEZM2TwV1z2YPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8332
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

On Tue Oct 21, 2025 at 8:44 AM JST, Danilo Krummrich wrote:
> On 10/18/25 3:41 PM, Alexandre Courbot wrote:
>> On Fri Oct 17, 2025 at 12:13 AM JST, Joel Fernandes wrote:
>>> (Resending due to some commit message mistakes (missing SOB etc). Thank=
s!).
>>>
>>> These patches implement the initial refactoring and few improvements to=
 the
>>> register and bitfield macros. Rebased on drm-rust-next.
>>>
>>> Main difference from the previous series [1] is dropped the moving out =
of
>>> nova-core pending BoundedInt changes:
>>> https://lore.kernel.org/all/20251003154748.1687160-1-joelagnelf@nvidia.=
com/
>>> Other than that, added tags, resolved conflict with kernel::fmt changes=
 and
>>> rebased on drm-rust-next.
>>=20
>> Thanks, this version is looking pretty good, and works as intended.
>>=20
>> I plan on pushing these 4 patches soonish after fixing the line length
>> issues and the other few problems reported by checkpatch.
>>=20
>> Danilo, please let me know if you think this is premature, but imho it
>> is good to set this part in stone to avoid merge conflicts with future
>> patches that will want to modify the register macro.
>
> SGTM, we can keep discussing the hi:lo ascending / descending topic for
> nova-core independently.
>
> However, for the sample code that, eventually, we'll move out of nova-cor=
e, we
> should stick to what's common.
>
> With that,
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Pushed to drm-rust-next after fixing the checkpatch errors and
reordering the sample code in descending order.

... and as dim was pushing, I noticed I forgot to add your Acked-by. >_<
Apologies for that.
