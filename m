Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIKqHnB7cmmklQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 20:33:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943386D0D8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 20:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2830D10EA63;
	Thu, 22 Jan 2026 19:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="CVvVnjMx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO3P265CU004.outbound.protection.outlook.com
 (mail-uksouthazon11020120.outbound.protection.outlook.com [52.101.196.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579CF10EA63
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 19:32:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkhTo00lNEvnOFEpWq9QHWB0JXVrH+npk+LGi6AfSLDw6Rbym8Ovq0Gf4kaFEM2GF0flRMlpLSBBhrdpRffUCfu2LScipcJ9j8XjJrljHDIdqPabX7YNWdAZ8q9NJZhQ/wXC035OU0TMTXRNZNNv9w1WN8BX7RDYSzvlSVGufXRNf+l9eA6Ew2qVkl3grtUca1X0jaxUDtRyqqpMjxKeLpK0Gf2dOqwAbNT+wxoebHvhtofcipbrItkBMljLwoi8QW8ZG34lRfwOsUu1nrwxp0zmJRgeouvNnxlI1qBv50XJlf2zCTk8ksDcof7YEDNsyQQiRiF5VaQaRt4F0wb7YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4wRm0kWwlDs5h4iiuG2fcCtlwLTPXn1GHP119sR3fY=;
 b=ahrREKTWlYAfvJOtXK9LyymlWt2b07kOeFMjxI0yWQWkK/ouV7ZMwJmnIoupyvF6DgTqQaz7AxdMm5ZLTkwQoPsDR7yZ6NNMnTcJKKjU4JztWGFD64bQx4b99NgkHFr4dsOrbnlRr/j67eK/kSjknDu2SFMRQI9uyE3KE1uPNRVVhRaNVGIIGsnMvdiFoBajeDRjILhYNydQ+sOvpFyb4u4XG78z4bbKSrEqS4XPveji3NbiuL+uDzV0DtFsCgCX7LzjjzsGxv+nVanGyva/zjyyNulOSY6t5oOYHqNDUYAQ/n87tCkBzNHpM8N7OjrAnqVxGX6c0gBaoE+wn4iU4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4wRm0kWwlDs5h4iiuG2fcCtlwLTPXn1GHP119sR3fY=;
 b=CVvVnjMxhmnYUbFnlroGM7i9xT3HCpqpb3dOzpIctDBfJkYkoR6vy8vAJ7GVVxR/YP37AlJgX2Qt/wuqaCBi26far3nBLu00TP3Yo0BcNRufcZ0k+s30mhNmHlWuygW5TshezMCZKzx91s+2n7SZyijx4+o+iYgGomlc80tm9xI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB1800.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:30::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Thu, 22 Jan
 2026 19:32:56 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Thu, 22 Jan 2026
 19:32:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 19:32:55 +0000
Message-Id: <DFVDAEMXT9LT.YCUH2BB8FV7C@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Deborah Brouwer"
 <deborah.brouwer@collabora.com>
Cc: <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <daniel.almeida@collabora.com>, <boris.brezillon@collabora.com>,
 <broonie@kernel.org>, <dakr@kernel.org>, <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <aXHi2jJNptrgUqyj@google.com>
In-Reply-To: <aXHi2jJNptrgUqyj@google.com>
X-ClientProxiedBy: LO4P265CA0134.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB1800:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f70db3b-b4e6-4b89-bbeb-08de59ed0ad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXNQbzlOUXJkMWJxd1BZaDhzTkVSSmxXSHlKUkZwOWNwWitFSXI2Z0tDRytZ?=
 =?utf-8?B?d0pBd3h4YW5MMkVYMUtXWE9YWjVBK0JYMmVMc2hvUWlpcTZNakJ3WXFuOTRx?=
 =?utf-8?B?d3VTejRKM0dZeWhKM3hZNzZ3VE1MejI0RTI1dUdhYjdnaUVSaHhwaFk2NUUr?=
 =?utf-8?B?aEpPTDBMa0ppU1FEa09zcU9UYm40NVlYZDBOU0I4VDRpSUNROGdMR1NQSERx?=
 =?utf-8?B?SmtwQzE1dnJjNTdMd0FaOWtGT2tHeEdTTlIyM1E4WWdBbzdpbEYxTXhVakts?=
 =?utf-8?B?VUFzLzNmZjYwcmp5VjJLNXVnQVZrRytIQSsyL0lhNG1wQ1dMZUR1ZXZqOGxB?=
 =?utf-8?B?cW5EL2wvZTAxOHpuUE5ZczdacWZVbkNYWjN2K1YweHdNU1ZNUmN5T3Jlc0lU?=
 =?utf-8?B?YnJubks0TkpQRi9BM2RycEQxc2ZGZnVmOXR6RmtTQkdPUUFXODEzdmJQY0VH?=
 =?utf-8?B?RzVvZ2ZiaHNiT3hRcUp0L2loQ3Btai9PdjdNYTNmMldmN01NSkY5c21ycGs3?=
 =?utf-8?B?Wm9DZXIxWHhsYVdIK3hlTlF6K2lUT25GajA3YmxQekxsWG5lQkpjVjBCUkpr?=
 =?utf-8?B?NHp3dUNCL1k5aWl6amJqTjBRamhBSlI2akxhdWoyb3diQmNEelFqMFZuSktl?=
 =?utf-8?B?bG9FZ3JOTE9henR0RnFOcHRKeTB1L0c5RElWKzFNVWZFM3FUSUpBbFRqcEZv?=
 =?utf-8?B?TmZiSkhkTXltNW15cnhXU1NyVHlGcVRhUi81NjdSbktVU2hVWUFURHdQbHNw?=
 =?utf-8?B?eW83OEhjZEkrcG9veFBSdEo4Q29kajNtZnVrY0VpM3dWTGxxUW10RS9HcGY3?=
 =?utf-8?B?eEhxc1N1REFjY2p5cGZwVWI3aVNWeWMvSnFMbDY1NG9mdXU5S0k4Y1AzRjll?=
 =?utf-8?B?K0Y2NzlpQVlsa2tPektSVGdZbXhEY1l5VzRQZlJjc0Y2Q2xSOFBHRUJKL3hX?=
 =?utf-8?B?QWs2WUFoR01jcXJIUEJFcW03U1AzaGJFV2hqNERtZEp5bWZ4THV6OFEwQm9V?=
 =?utf-8?B?THpzaHhKMEM2K21BdjkyN2owSzJPQVRRNEZMUGN6VzRyRjA0cy9mdU4rOUty?=
 =?utf-8?B?RDFIOGk5Wm5nUDZLM09aZkNkaWZWaGQ0TElvTWw0VHVyb0MvaGRiTDBMcy9u?=
 =?utf-8?B?V3p5dmNjbTNlQ0tTQXRXK09iTXhOTW1wSmFHeEhzSWorcmthQnNLcVhVSjBH?=
 =?utf-8?B?Q2Z5WVE2OGNSYXByUkdLS1M5RDFqVWN2MFppRytDTUVOaHg3RmdJK0krcmtM?=
 =?utf-8?B?Z3FoTTFDSWg3QU9GVHJQUnR6QkwxS2dIZ3JTbU1ZbWhObDZlRDEwV3hsbkRC?=
 =?utf-8?B?WWdjRE0xZGJVUzc2OFR4ak1qN2kzTFN4SjJ3Qm94WUp6NFk1U2srMHN1bGFx?=
 =?utf-8?B?a2sycHZTK0dJSWFKWWJ3eFJKenNYUmxHeWJCRlZaVVpMdjF3N3hyNkFNbzJ6?=
 =?utf-8?B?NmxHT0RRbVd0RGNYUnNrd0hiRXM1VEZzTmxhK0dnaUF3U3dZNHNEV2k5cllN?=
 =?utf-8?B?bGdyWmZObGtjWHlnWHl6ZWFkcGs0RkdYQjc0SG5HUUp0dlZwUnBXZmwyVDNv?=
 =?utf-8?B?b1EzUFVuN1hLbzI0di9EbVFmN2NqQUZ3dmMvWTMyNU9XTjlXeVBVYzhKSjE4?=
 =?utf-8?B?VFJNRUlLOFdMVXRmT1lxU2N0a0VKUmlud083YmdrL3NEbklxNjlZdXYzSnM5?=
 =?utf-8?B?K2JGd2FMMlZHMU5YYW16Sk5aU2RSYURuY214WXhCbkE0Zkxvaklwc0N6MDdW?=
 =?utf-8?B?ODJqbk9tSWRzLy9Hem5BdmhVM3E5QWhaSkFTY2tDdFh1L1JKNSt3emxFUHg4?=
 =?utf-8?B?UkU5eFhMMHk4NjI3MHpQTTVqL0dtYjdHN3VuenZQYkZaa0hxdUJoekU3SFM4?=
 =?utf-8?B?bWVqWnA5SlVtOGxqMmNvUjZBMXY0MklxS0FpRGFWalE0eE5Ob2xza1p4RGV0?=
 =?utf-8?B?MGE5a0FyY1ZoU1J2eVZucWJXS3grc3hYdytOWFpRZUtsSUJ5YmFjWmVtSTdu?=
 =?utf-8?B?Qy8wUVFmQUFWZkR0TmVEWFI0ZWw0RTZtbXR1SGpIb1Yxa1VCODduQzZteG1s?=
 =?utf-8?B?TnFtNVFUS04rSGpWZTZYemYrNmNhTG9sT0wwVWo5TGZzZFNUYkRKK25IVExJ?=
 =?utf-8?Q?zbRw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVRqUmE2YzJMQVUyVU8wKzcyR2dEVGJqMGQrbDZxNUp6VzFPa0tFV09HSWRy?=
 =?utf-8?B?WWFudk1IWnhjWW5SY3JkaW5PV3htdHBGSm94b0dFaXAwSXFKV0FIOW5FQ3Er?=
 =?utf-8?B?TVlsTXc1OGtLUmx4QXFUOVlMTlZ5L0RUNGpVMzc5YXdYWGpLOVY0bjJ4cW4v?=
 =?utf-8?B?SCthbmpOVmNvT2xGRVR1VXExWnF0L1dUaFo5OFczSDZaUVhOajBDTU1SdUVm?=
 =?utf-8?B?eFFjZE5KV3NDOEkyaHFHOUJSbkNlL29UNUZlZ2pIT1RFd1o3MVVjb1hHK1dO?=
 =?utf-8?B?TmEvSVcwNUxkSXFEZUU3ZDBab2F0ZFJHU25VdXVuTHV2QWdnSXJrVk9SeEpL?=
 =?utf-8?B?cG9yYjg0R2taL3djSHhwRGRHbWp5c2Q0MmRwNFhaZWhHQ2RJNDRSQ2xTbFFL?=
 =?utf-8?B?RnhvNUVsV0RPcndpWGlGaUpsY1NlNVA4S2dlY1NjQUZvS0JuZ1YvK1cvVm5q?=
 =?utf-8?B?OURyZnhEVmx3YSt1RXFiVnU1VHpEcjllSGV6ZTY3cTJiVkZNUTVoWHhrQlFB?=
 =?utf-8?B?MkVsdHNQOWhhclM3N3BkZFhDRGYzSENoczFlSlBaTGRPQ1hYQXM2SjFNZUE4?=
 =?utf-8?B?QlhVVjRySFdmVTRnQU5CUjNBVE9Ob1BMS28zR0hiV3lxR1FPRUNtVzQwcG1L?=
 =?utf-8?B?Ym9MRGNaT2I0ZDNSd21TVDB4bzN2UXV4REtzOG5qYWJJeGp2eTlNaWlKa0NI?=
 =?utf-8?B?Syt5emVnc3ZHeTJWeXkyeFllaCtJS3Z1NVpBeWRsYTJvK1NiOGdBYzJFU2hu?=
 =?utf-8?B?SW9BVGU4ano5SEZraG0wTWo1eVpJWnp3cEtDckIxMitRRGNMSEgwMmZleUJG?=
 =?utf-8?B?dy8ycE5mN0c4MEF6cnNqc2o1Y2t3SXZRdzBkK0hNRU9ad2d1OXVWeU5FVlJs?=
 =?utf-8?B?dDh5MW5rZUx3SnJ2SU5HZVFZRHgrNDRtWi8wWGdJdTlaaGNnQWZkSEZMN1BF?=
 =?utf-8?B?VUtsbzQrKzcrcVRhb2FQNm5QV2ZFeVdENFVacElCbzJPUGJFNVBwN1dGMCtD?=
 =?utf-8?B?Nnd1bHAwU2R5aW54WEU1SU80bGNJTGxBZWZXUndHcjlTQ1RjZjBnNDFkM0kx?=
 =?utf-8?B?emYrSFROTTdFcHhtbDZra244RVZjQ0d2SGRtb3RwMlNwWmQ3WW5HTFEzNnZj?=
 =?utf-8?B?QWJUTVNUbUt3U0d5Vm05MXhzb3NIK1dKTkwyRWdMWW9tU0l0UWo2Tmhudzln?=
 =?utf-8?B?MTRvOUYwd1k3MVZuT3gzV0ZldUpsZk5PY3hadFlmRVhuVFFrd0FLaW16YkFE?=
 =?utf-8?B?MGpjREltUnJHYmxpZHNoZGJLK0JWbENUeWJzYTZBZE02ajFXUUF0dXErd2Ew?=
 =?utf-8?B?OXRUdEQ2NUptQXRLdGdUYUM3SHJxMjRxaEV3RnFDNnlhZDVqcGlJTDBNa1JB?=
 =?utf-8?B?d3JIRUNQaHBQcmRnZ1IxOFNic216enZFVG5zbEVYZSt1ZzA5STdVWmhEQ3o2?=
 =?utf-8?B?dXRRZUlERWpBTm9LSkh6N0djdGJNaXErR0U1NzZhZW1HdGZUUzlFSTMvZVJR?=
 =?utf-8?B?VFRDNDF3OUgyRHMvclRJejViRy9LZ0dCdFdXZEdNemJZNzMyZ2Y5OE1ZaXpi?=
 =?utf-8?B?VVpURHBaelg3bEs3OWhPc2p6TFhWRWxCRHE3Rmxia2lvZmd4MFExQ3pjWVpP?=
 =?utf-8?B?WUFKTnJFV2E1VFRDbXV3aWJzWFdEc3FFWHlyMURrRkpTZStvSDVHem9YNUIz?=
 =?utf-8?B?Qkp4THBJUVZsK3pBWVdBdVVxVlI1b2E0WTNVRzVQcmZiRzIyWTVnSFUzSWxo?=
 =?utf-8?B?T2tIdGFRdVo5RjQ0Y2FRemo0a3dvZnVuY1VGWGxPTVRpRmpUZE5na3RRVG9V?=
 =?utf-8?B?K01tbnhsOG9CcnBSdEtsQjZhTUhkNmhKOUU3Q0FhOUk2WUNURi82NW1KUlJq?=
 =?utf-8?B?aDRQRG5MSFpnOWxIV3d2VEVvNTh2TE5rSEVnYTZudFVsUFpha2xlYityVGdr?=
 =?utf-8?B?WmdaZjEwRExkMUVCWFJNL251QVVSRXI4RFlBQ25lRjRQTVc3WUpIQzVCMzVK?=
 =?utf-8?B?TVlvbXR0SVNTeWVoU0MyUFdXOHJtVms5UVYrMmcvN0dVWlA5TjV3SlcyOENo?=
 =?utf-8?B?Z3ozZzNMNTY2dUhtN015aHYrQUhpYllYWG5hNjl0U3VQR3dGVjRFcUV4WWVD?=
 =?utf-8?B?RWcydkd3K21Rb3ozUlJseDRzYkJqelk1ekFiNDRtUDlBQ25IVWhIMnVLb0RF?=
 =?utf-8?B?anE2NWVWcjQyZmh2eUpvWFl5YnEzd0IycTRmeVBZUXFrdDRxaXR2Z3pYanJt?=
 =?utf-8?B?SndncDQzaS91K0h1dzVyUG9pTkZXNmovRHpWa3drU0o5WEgydmx2UzQvbmpt?=
 =?utf-8?B?elo3a1ovRTBONlAzeC9jeWJuRlU1cWFmV0VSb1ZScFByNUxwL3ViQkcrRUJp?=
 =?utf-8?Q?JcqiKDgT9XlovWgNebj+GniXOC4GGSmzavLWq?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f70db3b-b4e6-4b89-bbeb-08de59ed0ad2
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 19:32:55.8096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2/lAJ88gTcj+3qr21PSHaL7Zh9NwGtIS1aymlaZH8hjxdHnHgpZ7IS1FU2XUD7H/785mKyYnBJ9hnPFwxEDSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1800
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,collabora.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:broonie@kernel.org,m:dakr@kernel.org,m:miguel.ojeda.sandonis@gmail.com,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.431];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email]
X-Rspamd-Queue-Id: 943386D0D8
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 8:42 AM GMT, Alice Ryhl wrote:
> On Wed, Jan 21, 2026 at 04:37:46PM -0800, Deborah Brouwer wrote:
>> Currently these warnings, as errors, are preventing Tyr driver
>> from building:
>>=20
>> error: field `device` is never read
>>   --> drivers/gpu/drm/tyr/driver.rs:37:5
>>    |
>> 36 | pub(crate) struct TyrDriver {
>>    |                   --------- field in this struct
>> 37 |     device: ARef<TyrDevice>,
>>    |     ^^^^^^
>>    |
>>    =3D note: `-D dead-code` implied by `-D warnings`
>>    =3D help: to override `-D warnings` add `#[allow(dead_code)]`
>>=20
>> error: fields `mali` and `sram` are never read
>>    --> drivers/gpu/drm/tyr/driver.rs:196:5
>>     |
>> 195 | struct Regulators {
>>     |        ---------- fields in this struct
>> 196 |     mali: Regulator<regulator::Enabled>,
>>     |     ^^^^
>> 197 |     sram: Regulator<regulator::Enabled>,
>>     |     ^^^^
>>=20
>> error: aborting due to 2 previous errors
>>=20
>> Suppress these errors so that the Tyr driver will build.
>>=20
>> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
>
> I still don't understand why I couldn't reproduce it myself, but
> assuming it's not just an 1.80.0 issue, below is my review:
>
>>  drivers/gpu/drm/tyr/driver.rs | 3 +++
>>  1 file changed, 3 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.=
rs
>> index 2a45d0288825..04c865cb4397 100644
>> --- a/drivers/gpu/drm/tyr/driver.rs
>> +++ b/drivers/gpu/drm/tyr/driver.rs
>> @@ -34,6 +34,7 @@
>> =20
>>  #[pin_data(PinnedDrop)]
>>  pub(crate) struct TyrDriver {
>> +    #[allow(dead_code)]
>>      device: ARef<TyrDevice>,
>
> Let's use #[expect(dead_code)] so we remember to remove this when a user
> is added.
>
>>  }
>> =20
>> @@ -193,6 +194,8 @@ struct Clocks {
>> =20
>>  #[pin_data]
>>  struct Regulators {
>> +    #[allow(dead_code)]
>>      mali: Regulator<regulator::Enabled>,
>> +    #[allow(dead_code)]
>>      sram: Regulator<regulator::Enabled>,
>
> I don't think we intend to ever use these fields - they exist only for
> their destructor. In that case, please prefix them with an underscore
> instead:
>
> #[pin_data]
> struct Regulators {
>     _mali: Regulator<regulator::Enabled>,
>     _sram: Regulator<regulator::Enabled>,
> }

I wonder if it makes sense to request a feature to mute `dead_code` lint on
certain types which we know are there to represent a registration or resour=
ce
enablement.

Currently rustc's dead_code lint has a builtin exception for `PhantomData`,=
 but
I think a lot other types should have the same treatment, this can be usefu=
l
even for other core types, e.g `PhantomPinned`.

Best,
Gary

