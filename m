Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EB4BA9A9A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 16:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4A810E444;
	Mon, 29 Sep 2025 14:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HjBCEbOu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012029.outbound.protection.outlook.com [40.107.209.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477C510E445;
 Mon, 29 Sep 2025 14:45:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcnTZ+mz9pdMTPistakyIsAnZnUnntiIXVKcRm84aEALAqN/nopkoSJD/SUBZqCFNjd0ff/9oH/HEMmSH6BeBpA+ivZeMXYqgsh5BwLCXRhDt5H2ImKxSNqHRAa04RxDFPW7q2c5rm6W6UbVyDKUEXcO9uVVuVK4/0TF6kOBr/685u3PokMWSg0u+Wf/scVaBz/INlINxfOkAlG2nBD5PToksOpXD1fcQoamTN++macsef0w8HTC4PojoiEjI3IZ7q7I+4hr/Ta57TUyXq07ZG4rUi0NcGpjDfdM2bphMU4NR3SPnRyDbQnPN+bepPYyu2ZHJtaE4N4SPqfCh3x0Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cj2wbTvjRSUfO8pxaHqqDul3JLBwHPCc7O/sTJzBNDY=;
 b=S1Lj4Kxz1UydMrzwCFgQ/Qi9jiJtBoGJeqnBP5mDbJOhp49Av82GaB6DMNoqSlmgfaIQscS3sq8ASfnOd+iXDySh0ubH0wWOwLWGHYrx6sHMoRDgTGLypNC+tDWcNLvDb9ieTVBgjqre+sr/DC/w+Ru38T8rWdODhCa6M+QbjeUSiJwavziOI6ZOrjn3uo0FicMUyqLgKnUCk2ALA4ntrX6pSmOECx66a3mLoTvlYTDt0wS7XsFVwJAHLtBWz5LAOatFZbM7x0Xlti5ngfiKn2qdyWJezAJwzhe00y4K/oWJ8otOcJuYXoIDlca00CtaRhS096o/IqNSiCSKGwnQhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cj2wbTvjRSUfO8pxaHqqDul3JLBwHPCc7O/sTJzBNDY=;
 b=HjBCEbOu2EW5xx8p5U1vdIXqbzgom80xUtXppbIKB8Vqp+nkBX8dK9gaQggFRW5xx7p6PW7FAY8U0oSZe5Rq39KMHPgTv74B/r2lseTgAFdYocmNBMWwKHZNaBCdEsTgR4qG6mdXPwqdNYMX4cd6vYoiuSYmM7YbwVZwbKEqlepDZcOu7jTN1/cWA4eO/g3m68uwDAzpSHm3dVPBYPaIb5GVNMcXVPO49uWxsi2l18+94LE00++QXkklhC+pkrgvKBJgJexPR+Xvv215DnuBOz7vswBdH8aS1ifxd9iDs/f6GeMeK7DM/7nX2BCK2Kgdtu5rsDgx77TPSOy0zGHQNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH0PR12MB8508.namprd12.prod.outlook.com (2603:10b6:610:18c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 14:45:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 14:45:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 23:45:38 +0900
Message-Id: <DD5D5SRBMW4P.3JJPQVDF5BZLU@nvidia.com>
Subject: Re: [PATCH v2 05/10] gpu: nova-core: gsp: Add GSP command queue
 handling
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-6-apopple@nvidia.com>
 <DD2GCDGQ7Q4W.1CSFYSETFSN5H@nvidia.com>
 <7brvf66smc3ltqrw7tm7smth6wnefeqykdm2n4qahi5xnr6d5o@4l5xfdbznlp3>
 <DD5CXDR294YD.2RL474PWBDWTV@nvidia.com>
 <CANiq72k3qkj1HxjnCoknAdWhdM7O1ZBkZDqBsVS7vxYH-tRCWg@mail.gmail.com>
In-Reply-To: <CANiq72k3qkj1HxjnCoknAdWhdM7O1ZBkZDqBsVS7vxYH-tRCWg@mail.gmail.com>
X-ClientProxiedBy: TYWPR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::21) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH0PR12MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b925be4-29d5-42e9-915b-08ddff66dce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2gvZVEvdDRncDlFeFhaVXp1Mmd5K3ZLY3BjUXR0WEYrY1Z3dVhvY0xDaHMr?=
 =?utf-8?B?My9sdzRXSVlRL3ZyMXkrNTlXaUVVcVhEMTkvNHRpbmVXaHFtVkhjSHBZblVZ?=
 =?utf-8?B?amxYVGpUc1FqdzVxZ3JETkR6UjJCc0FkV0IzaFZ0N0cvVklRM0c1aVRnajRJ?=
 =?utf-8?B?bDNURW9LWFhDNE9ocTVTanoza0daamxZcWE2M0kyMzRkYmlocG9EMnhzZDRM?=
 =?utf-8?B?NFFzQUhMWSs1OVd6OWhzVi84QVVPZnlqRy84T3RNRVkrVFhXTGtUbEZHcTBW?=
 =?utf-8?B?V2Q1L1NzVzNsWE56TFVqbi84LzFna3J6TlMwTEhiZVRsRXVxVjVSdmVyUm42?=
 =?utf-8?B?SHNRMGRwMWl1WCtXb1d1SExNY0hBb2hXS3RyQ2xRSERPRk51ZnFETFQyWnUw?=
 =?utf-8?B?T2xPaU00bE0rdmtmc2UyWXBlOTJhRE9heWg4czZvQ051VHB1S3VrTUY3ck5B?=
 =?utf-8?B?U1I1bE1vUzJPcFI4QW5RSXNiZytSYTl0dUdjSFNSWlg0Y1JUNVMzYUk3L2Yv?=
 =?utf-8?B?dGJlNWZ1K0tYNDF2ODZUUms2VU5aNEFXNUxpZmNhZ3pudXJ4T2ducHFrQ01z?=
 =?utf-8?B?Snh0TmxVWlFJYXdGVnJjZk1rTWlWWWlSUjQzd1JiTHFRak9MS2JmOHdQalg0?=
 =?utf-8?B?UjZNUUlSdEVuTVhnRlpwaWVKUFlKcUROUTB3Wm5zMTkyZ29qeHhEdTBvRzkx?=
 =?utf-8?B?UDdPWVZVTnpQMlkyRVk2d2lOakVIYUpLMFh2Tm5CZHE1bjRrVWkxYTlnVGlR?=
 =?utf-8?B?M1VEZ01VbGU3NDN1NktOdFgyTW1NcHcxcEZ2dGlVeEtxV2FyTkRNclhpM1Vy?=
 =?utf-8?B?WGFnRWNQRU1XLzVGWEJSZmh1enFLdmh5akpiZnVGV1JQOXRvZmhTK3c2L3hP?=
 =?utf-8?B?RjNZRFJuUzIwVzVuM2RRZHBFVzdWcCtkeGFDSUZpZHBNNTdxQ09WZ2xwK3pp?=
 =?utf-8?B?d0wzYVlybjJFcnJBTHlrMEpsUWNZMkVzZ0NuUnlhY3F3ZUhIZld6TlRRSWxr?=
 =?utf-8?B?RGl5WHJpcmhLTnJ6S3lzNDdoNGxTVmRRL01ZQXg0THF6dnVEdXBUZVdUWGNT?=
 =?utf-8?B?bTZSRUZ4ay83bk5Ndm5zaWtwWk1wR0FmTE00YmlycjhsUVAvRFZxRkZRVlJa?=
 =?utf-8?B?WW9kUU95NEw4b2dRN2M2MDhDNFhScXBpNnE3bkpQYjQxZlAwSmZhSTMzcHpF?=
 =?utf-8?B?QVVjcmltekNoMDVHOUFDbVgxSlpUb1diYWdiSHJuOGp3cW5tcnQxZkE5SU0r?=
 =?utf-8?B?c0hrVGJZMS9GT2NjUDlPMWRGL08wVE9TNlNvZ2NJRE9ITExtVWhjOUJmbXUx?=
 =?utf-8?B?SEhCU1BnaEFXRDZHb1NtOHdaVkwyNFQwL3R0VVZISFZoYkpHdHBYVXdaeXVC?=
 =?utf-8?B?cWl6bTBZS1ByR0NsN0xQeFRnSkFBVDhxakFHNFp1ZlE0RytIUGV0bldHbVQ2?=
 =?utf-8?B?bGtqYzdoeEp2QUpNV1JCc1lyM0picGVXUGRNUGVlNTR0L1V2S3M4VkgyQ2hO?=
 =?utf-8?B?YXdlREt4VklKR1FVQW9QVkMvRFZJWVNsVFN1NzdKWVRwUGlIci93ai83WFRx?=
 =?utf-8?B?dGpZcVhtU2taNkJpSk5RMjRtaWxEUWVrbTZZeGpQWjZBOGJ4Ui9QVUY4YXVw?=
 =?utf-8?B?Q09KQk9DUmd1dWlESlFZSG9obmRMeHhsRXJabHkxWnhrY3F1bjg5cGlVUGd3?=
 =?utf-8?B?aU1GNkZWSHFNaHhPdGtHbEJmdjJLS2ZPdDVJZDBncnlqKzl6dDdEUVRvUjBX?=
 =?utf-8?B?dFVXa1JqTHVKSklJNWZFWktpUVRUaVhEOFQrOWR0aEQ2akZjR2c0TzQ2VGoy?=
 =?utf-8?B?YjdXOEp4cTEwelNYTjNNS2U2Z3FOR1BFZHRqMUcxM2dIQjBKOW51aXVweDZy?=
 =?utf-8?B?RlRyaGw0TDVkQ2NldzlXKzg1cTJOM3V0eFJUK2YwVWpRdWtmTTIvUmVuREdQ?=
 =?utf-8?Q?eeCMhyCXRAnNdbyaLYxySE5cxDiPa80+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVBOVmxXUmxQWWt5SGZ2RVhUY0d4Mmo0b3dmSEpnK0UvYTBXVEtoVUV0ZC84?=
 =?utf-8?B?K25XUW1xV2dwVWxYSUU0d0xEYS9mWmg5blhiZEROd1NKOFkrWGo3NEFvZUF4?=
 =?utf-8?B?eVdOSnlVd0luZU0xUUpKa0FHdy94U2owR1BJd21Dd2VWdWx5K1pkZE1scGw3?=
 =?utf-8?B?RFQwUmQxMUVseXEwZ1FDMnpQelcyVjcvSlRaV2ZCNXFUeVJSNGF4S0ZLTVo5?=
 =?utf-8?B?MlVBRWRyMzcySll6TnFlVENUcFVJN1pGMlhUcmtDdGRZTXJHMUU1Nkg3RnNU?=
 =?utf-8?B?RzJ6alZMRTFhSEhVSzVrRHdWOWFDM3JRYlpuSXdjUDc4RUpjeGtzb1ZzdGxj?=
 =?utf-8?B?cGEwYUxrRnFNZlV4WmJnNnZYL2VQY01RaDZUVkZ1bnhVQ09CMmRKaVZTU0R2?=
 =?utf-8?B?VTN4RGd4T3pPZGdkeVlVNWFUTVF3dlVNaW1wR25uSVNIdzh2bXdpekR6UFJv?=
 =?utf-8?B?VUVoTFZnbWJ4aGgyd0ZxTmpSS3laQUtsdmlOYjVjcVhiZThTMWVOMEJQVHdC?=
 =?utf-8?B?bUpNRDRZOXdqTE03OUlhb3lpRDlKM2RMVlFlVDlXVGVpa0xPa2NEdXVhaDZK?=
 =?utf-8?B?MTU3em02cGM3WWlwSzBRMnppYlhocGpaNWFLQ0RPUVQ1NDVKOFhZOVVVbExB?=
 =?utf-8?B?TlpiQ2NLdmkyVWpXSjVWVm56ajR6bisvZVBlSGJrNFlLeGRraFRueFBwRThT?=
 =?utf-8?B?QkpNa2ZRN0wwQlFudGRLOURGVnJoeXkzUnRIVW5CY3NGWEl5QnlNZkw3b3Zv?=
 =?utf-8?B?bUNlQXpURzEyVGQzTm9JcmVVcFl6THlFbjh4TWlLTWNNc2plVnJYK1JNRmN1?=
 =?utf-8?B?Q3J2SWFUQmE4RU1wbkExbjhhS2FINzNkdGYrcnJ6RXE3SlpVVk13WVZFaXkz?=
 =?utf-8?B?dFFJNXNZK20rd1BrMWppY1U5LzdJLzl2YThteTAxNHdieGNqWG15c0w3SjMy?=
 =?utf-8?B?ZjhORDZ1NW5mS0Y3L2crb21VMXN6YVpQaUFleVZGcURaS2d3eVhIWGw1eXFH?=
 =?utf-8?B?c3AyUjFtL2FlQ0d2TG1zR1VkRmM5dFg0dk5UK0UyVWJYZ1p5RGdsK01nM0l5?=
 =?utf-8?B?UXIxM2wwZkdXd1lmTXc3bkNOU2o0b0hqQ1dVWk4zSUUwWEJYZDY1UUljb09n?=
 =?utf-8?B?cFJZeXVoZmFEVGZQQ1p2M0JsdUFKcXlhQlpSVnFwdzhmT0F0dS9YSlVlMVBI?=
 =?utf-8?B?WWZpcTNUalRBcm1DSkJjUmhicFNSdS9YK3k5Zll4eFIzY2N6NDkyb3p2MUox?=
 =?utf-8?B?SFlvT0FYbkZFVEJ4ZTErTzkxL2VWUHBleHJRSTR4bHJGZGNmR2ozaTh5Tmgr?=
 =?utf-8?B?SjBKaElmSXFUa2N0d3lXVlg1L2RaQW9lMUxyVytnMGYrZzNpTnl0bHI5aVV3?=
 =?utf-8?B?QXRSYUFUa3VGWUJEREVNYnFDcStmRXFCdSsrbC9sS2w3c0gxSmNUQjRoOHB3?=
 =?utf-8?B?dG82cE5SS1VqTmpTZExnNWhtRWdDalQxMitBSmRPbFVwSDBlYUdqVFJ5OThu?=
 =?utf-8?B?bDJXcHduVGpYZ1Rkb285elp3S0dXSWVEU0JTWUJIY0ZqT2R0WlpucTAycnpY?=
 =?utf-8?B?ekExRHlJWWRUMys3YTlFbmpNVm1ZdkIxa0pzSzhXQ2VtbWtKMDFRWG93U2Zi?=
 =?utf-8?B?cmwrR1VmVHpxSGNvcEdRWHN4dlVwODRjM25nNVhvSkhIQTc0SFREb0dLdVRS?=
 =?utf-8?B?QzhETkJMSVo0N3NybHNWWlVQYjRzK1N3SC9NdmRGMkhNNVdKYStvS2d1NUJp?=
 =?utf-8?B?UW45TUVoN3ZDclYyOWZhTE05UklkaitMWXA3UXJqVjRWQUFRcWdVZmNTS2FK?=
 =?utf-8?B?S0s3MEZ0V2wzUE9BNk1VVkVhQnhZeEc2Y1FKWnVGa1lHeVQyVW02Z29OaHI0?=
 =?utf-8?B?a1pSNXc2aVdYcVMzdExEbVYzc3VzMlhjdVdNTU5mbkR4UGNHZWdKa045ajRX?=
 =?utf-8?B?VnlmdkJvejIzZHBQU2srUVRXanlpUDlwT0hRbXdVOVhack8xMFY2djZoZmFi?=
 =?utf-8?B?bGNqcGhXY2lndW5kSFIwUENoUytxMk9pdkdUVC9UUVE3Q0xiRlhDbmVLcDNS?=
 =?utf-8?B?N2VtSE9WWWVwa2l4VW1HbjNucTF0UXgxd002SnJBaG52cGp1MzlXNkF1NDhL?=
 =?utf-8?B?Yy9EaWR4czNDRzlIY1V4ODgwbi9QTVRIRXhWQkNuWWtGY2hVS3JlUTFLTlRq?=
 =?utf-8?Q?krvyIGSCw6TsTAgXXh9UgL6Rn4cWx1oW9Ssd2AIH0IWx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b925be4-29d5-42e9-915b-08ddff66dce9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 14:45:41.5942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfCAtV0vPwhWXmBI7bn7pgwSauK7PH0LUkeslMNKzK9z1bQC5jufUkZyF4lM1vCzgJHfNb0orzoyyRw3qihkTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8508
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

On Mon Sep 29, 2025 at 11:38 PM JST, Miguel Ojeda wrote:
> On Mon, Sep 29, 2025 at 4:34=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> I think you will also need to explicitly enable the feature somewhere -
>> for the kernel crate it is in `rust/kernel/lib.rs`, but Nova being a
>> different crate I am not sure where we are supposed to do it...
>
> `rust_allowed_features` in `scripts/Makefile.build`.

Ah, that's where it was! Thanks a lot!
