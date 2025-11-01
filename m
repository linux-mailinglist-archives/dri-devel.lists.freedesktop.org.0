Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0694AC27879
	for <lists+dri-devel@lfdr.de>; Sat, 01 Nov 2025 06:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F8A10E33D;
	Sat,  1 Nov 2025 05:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YAr4r4YE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013022.outbound.protection.outlook.com
 [40.93.201.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F8B10E2FB;
 Sat,  1 Nov 2025 05:19:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EL3E9g1mZVs0N5ksjfvw+w8ywT6k+k93wQ6SJAcU7aimkBjBEWWH7L+jgclR1D4qlBcC5H2bNuL9jKIRJGXe7inqZu4OGGaup0wpMdH1kHYXDWcIMQbsyk1lulqCw7DYX3NAvq2Ee0YgAcKHgQOlKDKURJDkQFZHBTkWqzbI9/KE6+CI4lRXjVUwQEEfwOCbdERhk54pdNVG4p989MDhm+3BxMxXayL5zbSRbn40ZnhY/+dANIfa0Tu6hfA+8cOjblCD8SwOZPH0vDZbiSpnqGW9lJUh7NyvLWQcagSbmFLxFBYi8ANG1uJkHdbX4K1ZkwfdPnYKf9GKxyCokxCuwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvTh3kQ0e1gwN+aQH+M19F2KHXuY0sgLwETChmCitWI=;
 b=q/4I/TpWa5BbaBdv42FlwKPjfvSFe+Ocz6sby1BD9pkiXwbbMknL/+V90R+7pfwAwhP73yjGx83Cb6ktY+CvmnefxbURzI7CgqtL6IcLZaJk2Kvk48TzFo9CAehlwPaS0+im5ntW9RHdhp4VfoGGtRuaYg80CubU1LRmc7I4q/zk7S0zAoQhz84qiAoq9Noi+qrNHYEsUE1dYSp3kCDQl2N80FUhOthU43MSVNUw0ZDDA9kmUvX1PX3xvKBbJwaBOgBeNqQdTFocA+iI9O255DEU+Q1fhlDOiv4GFGwIbtQKYWgYyEvBMxaZQbmi4ExN7xPM31H8/quQdw/GFGPjXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvTh3kQ0e1gwN+aQH+M19F2KHXuY0sgLwETChmCitWI=;
 b=YAr4r4YEX4osBE2uFsFfYbvpwML9+qi36qf73zzOMwC7h6MlzKDDE023+PccuK3TrQgCuSQmtQYJWa9IY2jy1pn9SpYjUuaw+VC5c6EXjinU0NpoVUsLiV0IEcroOVaaZdIwy7kF7uSZ22ZDAeU+xnoxk9ZJ4aOHSkqTKELZxRDySDZP7UQh+aNoFlzjnQElh06p8rddgyKoLDvDfjEAPgWN6XSC/ueO59D7It/W4Hwju1vVxC+N0q63WdpHbaUHZ7eaOnjluWBrUoADmqhSXHt7/YoXF1aRL/cj2soZ8EnciEjRqNXL2uQZAV2L7zxpyCKHQKjlWodD8Qk2zsfdew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8020.namprd12.prod.outlook.com (2603:10b6:8:14f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Sat, 1 Nov
 2025 05:19:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.013; Sat, 1 Nov 2025
 05:19:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 01 Nov 2025 14:19:18 +0900
Message-Id: <DDX3S62U4O46.133LFLRFHMZI3@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, "David Airlie"
 <airlied@gmail.com>
Cc: <acourbot@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Andrea Righi"
 <arighi@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH RFC 3/4] rust: drm: Add DRM buddy allocator bindings
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-4-joelagnelf@nvidia.com>
In-Reply-To: <20251030190613.1224287-4-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0078.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 16248b09-0f21-4b0e-0589-08de19063715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVozTENWVFZRYzEydGpONWhWaStlYWZ2ZklvS2g3ZllSZHU1eTRMWmQvaHNG?=
 =?utf-8?B?VXczR09QRlBUeDl2czh4UDlVem81S25oNXJMYXJlL3VRVDdLSFhoWnpSVkpP?=
 =?utf-8?B?bUs0TjNKbUhZMExTSytQYTBQbUdlUE1wQTdzM1VjNndEd1lOZmFVOXAwWVJE?=
 =?utf-8?B?YkxIRitTQ0tyeEplenZTZzZ4RmwydkVWUHkxZnMxSG1QWldaVFhTc1AzYVBp?=
 =?utf-8?B?bHlYYk9CK3ZDNVcxYm9Rc1BocVZ4NWwraXlrZWYyaWo5b3VjVERRaFcxd05h?=
 =?utf-8?B?MUd3QXlnVFpWRUQwSHFIRE5vK1ZOeDc5RncvdVFkejFCVGN4dWZ4RzMxVmJB?=
 =?utf-8?B?b2JyekxaRUd0cjVqV2JvK0hwR1dTdUhHaFBXQ0lhMWZDSXdheWlVa2ROZDE5?=
 =?utf-8?B?NHlLMkpJbWVrRkl1ZXJzVDFtUkc5V0pEVm9OYlVFL3pUV0NpQ1ZQNDMvdHM3?=
 =?utf-8?B?REZjUStGcW85RUU1dCtXcDd6a01OMDVra0ZpV0IvWUpGRk84dTJQYjQxYmhB?=
 =?utf-8?B?a2JiUU9mVytlRW1pUVAreGNyb290Ujc5Z1pPV2NBZ1BzRFlDcjdEeU1VVzlG?=
 =?utf-8?B?cnJjOUF5Uk95SXBGTE1pQXpTZFlZZWhVTXp0ZE9jUFR0RHlsbCtQMVBoTkRE?=
 =?utf-8?B?L2IxcmdkYm1qbW5sU2hxL2ZNeTkzdUVwSHdLMnZVNFRaV1JpbHRXZDBwSTNj?=
 =?utf-8?B?NzFMbXNxWC9Nd05hU0ZBRGtuNnBNd2xCWG45RUh0SThIclVaUk5VUDk3MXhO?=
 =?utf-8?B?MUxWTWlpWU1CcEl0YUhHQllHK0J2ZGptb200Vzk3em5LT2h3MGt3czA2dmhR?=
 =?utf-8?B?TVZPcU9IbUdWQVQ5THo1cEtuWUpzNHpFaHpsRy8wMVZNVlg3ZDFpZTA0OUNq?=
 =?utf-8?B?T0dyRFZkYXUwZEFaTnM0THFQWHJRR1VpaHlyL1pwM1BQL2tJbVlQRGlMNGdL?=
 =?utf-8?B?U3BFT3Y5b1pIeStzZDZYZ3lGSmkvY3NiNXlvZGZBR0c4UnNuWlRwNW9KYnpK?=
 =?utf-8?B?bEhiR0ZiOFFUTElEZFl3Z1hZaW4zMUIyUTBJbW5hRjVmM2R1a3ExSVhsUU1T?=
 =?utf-8?B?enMwZHByK2NDQXplcTRJWG5KbUlWUWxvOElDY1FKdG5WZndvRUoxWmlOY1lL?=
 =?utf-8?B?QVgyOXFxcXVZRTBFUEdGN1dWVzNlOFREYTMvVWo4UTU5Ty93c0tSQmkvUFcv?=
 =?utf-8?B?WldtU3MvbXNCektPNG5nbjVPRlUyK2RaQTRvY0YwNzJIMGcrNXUxNVZZbnZD?=
 =?utf-8?B?enNtUVBmN3VDakIrRVYwWEd0UFpaQUowVERZbzhDN3dIMHM2YlFJd3FrU2tT?=
 =?utf-8?B?K0hvSEMzOUViTFlnQWI2OHJ3eXl2WG1VOEhKZWxUMjFYUDFTcnFGUGFuZk0r?=
 =?utf-8?B?S25WTVM0Z3RMT2k2eDIwTFJ1cDdHUWRVSFVSbDY3UUhZdk55dS9BckV6WFlG?=
 =?utf-8?B?VTBtOGZVZGhSZXIrSDZxTlI2dUhZMURLa3V5WHAwY0xiS1V0cmZiU09iR2lt?=
 =?utf-8?B?WE0zc2ZKSitTbXV5U0dYTElPQk5jUENVRzRQdDc2N08yVGRMVHVvRmpWMElE?=
 =?utf-8?B?SFRxa1pTMm9aY3JwbzV5eHducFhxRzBlZXMwNmZnWmlHUWpTVjdTc3JVeWRT?=
 =?utf-8?B?b3h0a1Y1eFF5ckZHdHhsTkxVYWxSRmNrcFY1T09ONWhOQ2VOTWlsWTQyZE14?=
 =?utf-8?B?YythblZPcmpJeHpEZ2hOZ0I5ZktDMU51N2t3emNsU0Q1SW1MSmZJRUZJS0Fk?=
 =?utf-8?B?SUFBWkhhV05vWC9Qa2UrYUhMb1dZR3FJUUM2RmhJY3dXa1dqbUwrSlJxY1Zl?=
 =?utf-8?B?SFZaWDlzRXg4eFdWU2VkeWRlcUZzM3B0Wk5XeW5OVzdoYVd5TE93cVVaU2kx?=
 =?utf-8?B?YUtraHMyOHg5KzJiL2V1UmdtZldSeEdEQzBWK0hVMFVNWVZMNkZaUkxzNy8z?=
 =?utf-8?Q?nCtf3296Akj6RHRuTCs0a70ygI4EG+A4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SitSMzBNMWpONHVwQzBRTUt3VHU1SGpJbDRYVnlYK0EwdndaK2YxeDBrd0pE?=
 =?utf-8?B?YW1lYkkwNExPbjhna01CSlJMTWlZanpncmFwYTdzVWJ1ZGtINEJ3RU5aTjB2?=
 =?utf-8?B?UjNlS1RoOVZBRnNsNmdqaDlYUkw0TWE0VmQ2OG9XODkwajBacjJpbVVhd1U2?=
 =?utf-8?B?blNYR1hrUzdaNGRvY1lkbXBvekhmeHg4ZmZJbk1KZFV4M1RBTjlFdTNQSE8r?=
 =?utf-8?B?K1FOR2VvTEVOeWM5aEw0K1A3b3h1MWlLRUhWcTJTajhncnh4VVM1NlJpenR6?=
 =?utf-8?B?ZUV2bk1lVU0zdjNQMXZNRXRBT21wMWxwOUR4dkE0aUFva0kxZWFZcWtCWkdJ?=
 =?utf-8?B?V1hMVE5uUTlDWEdkakZrcklkRWt5TWFyL2JSdTRVL2Z2TktBbWtPT3FwUFZS?=
 =?utf-8?B?Z3I2VDNRZHZEcE9PR2E3UGIyaFFtaVY2U1RxdnZ3TTk2WFVHWFp4ckRrb3hM?=
 =?utf-8?B?Z1ZseWxqa3JlUDA5UGxPdmNrRytGV3hyZGgzdThIbFNuR1FlV2dOcVY2U29U?=
 =?utf-8?B?UzVBN0lVeVNqN09PczRIOTloYklmeDAwTnRNM3FjS1o4SGNJUWV0a0FGVWVt?=
 =?utf-8?B?a0hoM3EvU0VrTGI3Uk5HTnVSWHYvODlXYSt4NDdKaVBPb216d2hLbGQrQzdx?=
 =?utf-8?B?T2gxYUd3c2xYbk1LQkU1bklVYVgzQjk5bktyOW0zcjNFSy9jVE1td2hsQ3Y1?=
 =?utf-8?B?aEtCQzdMTjNhR2Z1SCtZSGRJVXZtV2xtdmdldUpoVFA2SEw1VS85a3pBUit5?=
 =?utf-8?B?SlJweW84cUlNRG5GQUlGNVRHYW92OTUrSlRXTTNRRG1BM042cGs4MVh0RndO?=
 =?utf-8?B?a3pkVTJYbVpmK0p2QWhYd1RUV1BSM2IyQ0JicVRYazJIREFFcmd2bENDV0No?=
 =?utf-8?B?ZVJuQ0hBaTh1OFBKaTRBMGhKZDJkZWNScDBGUHN3MHFlVmhPY3p1UmNuK1VS?=
 =?utf-8?B?SnVFcVVHeWdienpOdkk2Z3VXdlc0ZEpmM2xMcEZYSDBQMTRDeGcveW85Ukd0?=
 =?utf-8?B?NHBRczV1NnBLei8xSCtoVHNXeS9OTFlqUnVvWlYreTc3RzVLQmpFb05rYi9E?=
 =?utf-8?B?R3F3MmFzUCt1RWNKeEZhSFhWcTh3dlYvQlVWWkFMdEMvcFJOcjkzZE9mcDhR?=
 =?utf-8?B?Yi9KakdEblRvOGFPS0JSNWJJTCsvWjZsY2kwbU9zVml1VU43YTVySU1wZ2Zl?=
 =?utf-8?B?V0ZLdm13UDlQa3lQSjErZjdNZXhWN3dTZXVHTWRUYU0zSDRFUnhLY0dmZ2tv?=
 =?utf-8?B?VTJoRFdUZFpuY2dZeGdiM2VPNlNLbFNWdFhHbTRRUUE5aVhtYWpFWnl6Q29P?=
 =?utf-8?B?QXRDZWluMHducnhicjVQWFJhWnRSaW1rVWROcFBoNVpxL25yTVMzWG1ad3Ba?=
 =?utf-8?B?c3ArTlVIMzhOdFFvVThEMFNtRzlsTEZOQ0hLVHdKQ2szM05PVXR1RGJtMUFm?=
 =?utf-8?B?U0thWmZsZ21vS2NwOXU0YkNsM0MwbFZ2YXJNWWUzbFNIT1RSYUNUSmliMXRa?=
 =?utf-8?B?TjZYWGRhVEZFbGptamJYRVk1UFRRZmxwdFhmRWNPNUlrMUNEOFVQNy9wcFN3?=
 =?utf-8?B?QVdXRWZ1M2dEak1qdnhhWXA2d1FWNWt5UmROZ2hZVmpmaVY0WlFSanJwYTFa?=
 =?utf-8?B?LysvWDZRRFI5R204MDAwY0Y2YWJSd3NvNjNKQXY2dU1vYkVMUE92VXZlVjRD?=
 =?utf-8?B?SXJsTkN4Nm5XM0NIVEdDeGNCM2ZsQ09TcW9qR0ExVmgxYnp1YUJKbE5RK0Vr?=
 =?utf-8?B?UDdRSlB1TVhYMmp6azJjL2RicFRNRDc5UW5yeEZDSlorNXlwMEJMazdlMzEv?=
 =?utf-8?B?NHVoOUJyTnpLUjNobG91dy9ZOVlIa3grYnFsNkpkU05FZWM0YlZoZlZiOStJ?=
 =?utf-8?B?Y3lQWjZHTjBlNWxicWFPTDFiR3VxV3ZOR3dmSVVnb3pYUjE2cGs1WUlsaGN3?=
 =?utf-8?B?eVhzSmg5V0xTZERIMGtWTnMzcFMyTkJOWVp6b1kxWFVRbkttT2ZoSjBuYnUx?=
 =?utf-8?B?bnNIbEJ2ZkdzZnFPdDNxNlUzemI3SjFwOVNBcE95MVhubSt4c3lDcGNFTXVp?=
 =?utf-8?B?dDArVllGY0FtdEo0KzZWSHlXM2JtWlBWcW5UQTFzUGNUODNHMC9HOWUwNWd3?=
 =?utf-8?B?SUN3NWF1SnZXSHlieVJoU05FV09FMlFqRm14YWtYcDRlaDA5cU9TdjU1Uk13?=
 =?utf-8?Q?r9CJroFvqDhwGnts6NgSE5NxdjYO2DwMNy8zxCA0VT6q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16248b09-0f21-4b0e-0589-08de19063715
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2025 05:19:21.9365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBqnMeZPuWABI4RU8DNfv0jj+EWqV/WKWy3jiiEQ7NG5HtIFuG+cnhNCJLzl2wvdhoSlmorbfSau9v0gQHUXzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8020
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

On Fri Oct 31, 2025 at 4:06 AM JST, Joel Fernandes wrote:
<snip>
> +    /// Allocate blocks from the buddy allocator.
> +    ///
> +    /// Returns an [`AllocatedBlocks`] structure that owns the allocated=
 blocks and automatically
> +    /// frees them when dropped. Allocation of `list_head` uses the `gfp=
` flags passed.
> +    pub fn alloc_blocks(
> +        &self,
> +        start: usize,
> +        end: usize,
> +        size: usize,
> +        min_block_size: usize,
> +        flags: BuddyFlags,
> +        gfp: Flags,
> +    ) -> Result<AllocatedBlocks<'_>> {

It looks like some of the flags heavily modify the behavior of the
allocator, and make some of the parameters irrelevant (for instance,
IIUC `start` and `end` only make sense if `RANGE_ALLOCATION` is
passed?).

In that case, we should either have several allocation methods, or have
an `AllocationRequest` enum which variants are the allocation type and its
relevant parameters. E.g (very naively):

enum AllocationRange {
    Whole,
    Ranged(Range<u64>),
    ...
}

struct AllocationRequest {
    range: AllocationRange,
    top_down: bool,
    contiguous: bool,
    clear: bool,
}

I.e. use the type system to make sure we can only express things that
make sense, and never pass data that will end up being ignored.

If we do that well, I think we can drop the `BuddyFlags` type
altogether, which is great as it seems to serve several different
purposes.
