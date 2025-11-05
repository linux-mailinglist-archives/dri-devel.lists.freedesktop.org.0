Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6711C356C5
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 12:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E38710E708;
	Wed,  5 Nov 2025 11:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qlzokf4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012039.outbound.protection.outlook.com [52.101.43.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4BB10E708;
 Wed,  5 Nov 2025 11:44:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEPv7BKx/tU7KX9Q608XHe6bfs0SXbh5ZIIibxVQoQ7YowMFo5awfiPI6r9tFYEFdmam8kpUvq/AbrRxYeqA+pfNf8rlasndLbmyj3aJWKyqCPqqGGkMR3CgRJJJFC1GUEOYROPClfmoVvtE4XlCQ2+lYkglKh0xggOza0PQAXxgbzcR5SzgriNhUirjSHfoWHZx/qMFCM9+5cvNwemnjKsZzw0b8dd3R9mp3ZLqFJ44jEEABhgapeBoJ81uFuesOON5jKctCUpC8pZ8PhgbS/DZeBShWMEVPKNGiReW3Tp41Y7CNBzlGtV5y7cWDlDbQ7lZosDoMmbdSvxKuhSb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nn9LtkKJZtSPSV41vVkkONR3Iqax0AnhhwWXV+7GsBw=;
 b=qwE+vDamdUf7fe7U1/nim1hlxoPY0/vWZ7Ao8BZQibuE0fEJFLczbCilVl6OERABIskt5bzPxLHF7C747aln3TYVeuqHSD8FML1ETsqeehP9Vq6chhH0J8w3NxdgohrZuI2P3e/jSX2DOBITsdGm0/MYDamO1l37z01L7o0CpwHL3P9hW89Q9HD0jDK1WtfJOGLQOmPczx+BfRt5JBHu1BjczHdh7uaySXvr6S+fvr92YafzbSUq5vPgOtUrEtR129w80hjOHyqGVKkGTXOFuVdcHpk/+mVcZYVj6kaayE2HAYwdN0tWAz0cKwCRiJs80K81YEiSgSoWpGg/rvyeag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nn9LtkKJZtSPSV41vVkkONR3Iqax0AnhhwWXV+7GsBw=;
 b=Qlzokf4J4bsa0bPA+N3Gr3FmBUES8u2h9l8yYcb1mpaSfIfL0nnOervGzUPSErB2evX3hkEL9Lk2lJjWruKiAzyVZ3Lav1Yi2UXR88hdjSyWMYX8eTsPagbgeUjVRk2knCEt+B0hohwxK6VEYYHezrbG9K2comMW2B18VjrQBAsIfeK8uN3ENP68qkqmEOidWfJwI9r6QXY2+N72iZL0KcQJo1Yo50A4uiG+FY525IG60S9UKg+Xc7fCxd+gKzSBiw3wjxVAMAqeKBdxq+uIw0oH/Q1q2SWSXrKH6WX+Oxo58LAgXOJYNu173wcnYxV52D4iN6Ssd7rRcv3y+tU8iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by PH7PR12MB8427.namprd12.prod.outlook.com (2603:10b6:510:242::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 11:44:07 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 11:44:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Nov 2025 20:44:04 +0900
Message-Id: <DE0QGXOEPA7E.22KWRNULPUQ72@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 0/5] gpu: nova-core: leverage FromBytes for VBIOS
 structures
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
In-Reply-To: <20251029-nova-vbios-frombytes-v1-0-ac441ebc1de3@nvidia.com>
X-ClientProxiedBy: TYCP301CA0040.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::12) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|PH7PR12MB8427:EE_
X-MS-Office365-Filtering-Correlation-Id: f3431210-e0ac-4c2b-ae35-08de1c60a0a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTVqQkMxLzVvQkhrTk1SckpKdDNoa0lVSkdsZ3JuV0J2MDd2cFE1WVVmQXdi?=
 =?utf-8?B?U2UwUDVnOUVPLzJTZ0xTb3VNS1ozNmRxVGZvaTBWeEtNc3B1a1pCRDlKSy9v?=
 =?utf-8?B?bzFDaGxPazVRV2l6dnArZkhINDlMTGFHRWtSbW9EY1YzcDl0d1pVMERRUkxm?=
 =?utf-8?B?dG1jSnExbFZyZXZBS1p3MDNYT0RnZmsvMkhCQVhISWw1dFVSd1VOTFVuNWR5?=
 =?utf-8?B?TlNHRFFVRFhvM2ZNdkJyUTRrSDB3ek1MQlpKOXE2VVpxVklnNDFPRWZIUGZa?=
 =?utf-8?B?NXdOTk5UVXV4UzVHNHd0cW1ZK1JjbC9HUFBRQjJjdCtBa1RjTE95ZFltUi8y?=
 =?utf-8?B?R0ovVTVGR1d6d29iMWNiWmkxT3BnaWc1MFYyRWJnbERwaDE3SHRIR0gyUmVY?=
 =?utf-8?B?SXdNSlFUSStMdWhWMVhSNVVrdFBnei9OMVA2WjhFQ0JrNmJCVkRTVG0vc2VD?=
 =?utf-8?B?R1loeThxZkpSRENzOHhXMjNIOVpLUUc3dkszZHNJWFdKbzdEYjR2MDd5UTVF?=
 =?utf-8?B?TG9KZ0U1QzN2MldzVG5tMTFRa3RyZWpiN1NKRUZaOFhjalFoUmlHVEpOZjhw?=
 =?utf-8?B?WGNYcWpkcGpyMmZ6QlZNRWp1MU5tWmlNS21tamxCeWpRUjRlQkVXVlFoalNo?=
 =?utf-8?B?MVduUXh5R1lCWVBHU2pzMFgrb2ZhdDROU3llKzcyd282Ukk5enZYc3pXbEVs?=
 =?utf-8?B?bDQ0OWhyS0NNZzYzU2VlVndoY0tnWElVa2VMeXlvQU5LMitFZE83SXFBNGpz?=
 =?utf-8?B?OW83MU9ST2pPM2d0VG1kdEU5bGx3V3ZlQlJZK1pzR01pY3VwcUxSU3JBSTNM?=
 =?utf-8?B?Z1BMVDNnUStvWWluZkxxRE80NGRDTlRpbDVaVEE0QktGSkpzTGVxQmFBUzA4?=
 =?utf-8?B?TWNTL1MzMmxyMVRZcCtZWVYrNXVzd002bTI5ODN5QmVrREZ0QVJxZ2pLNXIv?=
 =?utf-8?B?YzkxZS9NcWkwNEh0akc3UjRvQWREU05RQlRlTnBYWkpmdGw4WFd3ZXdrZUVR?=
 =?utf-8?B?SzNXM2hBNlRtYU9oQ3R0bzdUV2Ftakk1dzR3U3BQaUtzb0cwTVZZVjZhVHdN?=
 =?utf-8?B?clR3MERNZlVldHo0eGdKbTBPakd6S2R0Kzd3aVlNWEtiWXNKRjJ2ZnllOU9l?=
 =?utf-8?B?Q29JNXhaeEY3NjU2eVkzSUx2anBVNXdJekhjNGRhbFNQWEs5VTZGbVZra0RO?=
 =?utf-8?B?NDI1a05wZzRMUHJ0MHFNZEVGaWVERzlaN0F0Mkk3T2JXaXpPR2I3RVlaaGdF?=
 =?utf-8?B?MUd6Sk5jWFFzZmdBUzhoWXhZS0M4b0s1Q2dtdWk1WXU1WVRYRG8wOFRFdjBu?=
 =?utf-8?B?VXZFTmhIMXJHbDRoQjRhY2s1aU5oMjd4bHJoOGg5bUFMK01kZ2ZtWHI1dGZB?=
 =?utf-8?B?c3VXN2N2UmdxdlVSNEVNdlJRaVVXWlVNY0FtdEJhMnNTZkU0SDhHRm5MMnkx?=
 =?utf-8?B?bDZjSzVnaW04eGFqb09QcEFHS1Z3bnU4bEx4NlRxQkJrUnZFSlFCSU8ya01k?=
 =?utf-8?B?dFEyKy94SVd2NVBMYk80Ykc0UzN4aGF0MzlYbWQycDFGL21hZ2l3SzRIZ204?=
 =?utf-8?B?cWwrbmhrQzZkY3JPZWg2a2xqT3JMQ3A0OHJyWWtkUHNHK2xzR3k4K09vSkhw?=
 =?utf-8?B?UVVGWEJPVzUyZS9STVpCTGpia2xzY1YvMFpDOE9mYXJ1WDR4OEVUTVI2d01C?=
 =?utf-8?B?R1MyNzdnZ1VVa2xUbFJwcUVXTStvOHM2WndHdStVb2RvL3gxV1ZTRnMvUFl3?=
 =?utf-8?B?aUROcDVsWW9ldWpPU1kzamozQnN2ZGZtVWI4cE9sMVFmRk4wU2gvQlYxZG1K?=
 =?utf-8?B?bVl0MVdqMHgzdzZuaEo1eDVxNHI5bVhqZDdHdDl5Mi9PUHFUWHpsK0dSaUgw?=
 =?utf-8?B?RjUzM09VSFAwWmVselYya1IrTjNjOHgyZkVDc0s5enlNLzlSdjN2b2srRFdV?=
 =?utf-8?B?Y0NDUEpWTW02aWxYc3VPWGp5aWo4UUVTcmVmbTBuOUdXWDNwcDBBdmxZTjZ3?=
 =?utf-8?B?aU1LTTNqYjhCUktGaXNRVDVtbVU4aWEvYWt3Y1BXSVlFMjEzZXVFVjVqSEdZ?=
 =?utf-8?Q?HofsSQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZW9wenpBMjZaR0k0Q1ZBU203WUdTd3hxamZ3TXBtWEVZNjhZVWhSOFlsd0FI?=
 =?utf-8?B?R2NLN2phS29Ealh6MzVtZ0lhbys5SnJOdDNNVUhNNVpnTmhmUnBJZiswRUhZ?=
 =?utf-8?B?VTdVR1lDVFJoZVpHejR5VHl1WkoxUTMxN2ZMRDN1U0lrYXZRVkJIWVU0WVJp?=
 =?utf-8?B?MHlpZ2ordzZTK2xsOWVsQ1lESDZTUytXVXk5SWdWalF5c2RUZk53UWMzQU1k?=
 =?utf-8?B?Ky9GYlRwT1l6YjBHMk44U2dGZGpmd0szempCYnYzSTBHcW8rWjQ2aFYxc3Jn?=
 =?utf-8?B?NENlZUJmTFRuOEFkbDhTMlpueHZyZVdRVGYwaEw5SzMwb09uNEllai85TmNL?=
 =?utf-8?B?OGx2U05DaWZDY0d3UGMxaFZKYlJMK0hlUWErMUozRTRraTgyaU5qakVsQlhv?=
 =?utf-8?B?K3JwbnU2bE4xTmxRaUJ0SDliYkMxREp4dnBMYXBnbjRLRnhoUytHUUJMZG1P?=
 =?utf-8?B?MDVBSVg2bWdHYVZHeEF4czJMMHllT3pWNXprc0JwTFMyZjhwSlpLeStnd3lK?=
 =?utf-8?B?SlNIZEdYR3gwdk1zTUtwNDVqVHU2dmdCcm1GNjBlQWxZZFdTY3lxQVhZUnFr?=
 =?utf-8?B?WUFmNktnb1VMRE5qQ2ZtYXpGSStMbHhtN3RQa2cyR3ZKbk5DZm42WkQyMGxh?=
 =?utf-8?B?dml5TDRTU3ZpeGt1UlowT1lham9XQ01TMGJacXVieXdEaTJiZVhDaEhVY2Vl?=
 =?utf-8?B?bzN6MnpYcEg2dWNUcUl0YmljVC92ZnMwZ1NwRHM5aEFHOCtXbU56SnY1RWZ0?=
 =?utf-8?B?MWpwLzV6Z3NpVmFoS3Y5aVlXWWRFand1ZzIybjc2VGkwWlJKVWJmYTEyUlFJ?=
 =?utf-8?B?UGlLRlpxQmZyRi9lTEZ2dlRnS2VKcUxZRkZBTWtFNlVnSUhBV0FlN1FBTW5C?=
 =?utf-8?B?SktzbGt6bTNqb3J5aXlSZTl4ODErb0hGdGo2WSt6cjlhQWxLSDZQM1hKNkRP?=
 =?utf-8?B?anZQWjlXUFJxYlJNVmlpRTdCNXg2dHE5WHkrOXNQNVp6M0Mwc3lyNWpnRmZF?=
 =?utf-8?B?RUlEOGp3c25OYzRoYTBJQ0VDSE9vT3RkTEVOSU1tZ2kzQTFQby9veWRqejhU?=
 =?utf-8?B?ZU03cDFVTjUraEZRU2FGUUtJdDRlajVmNnZINkVqQy9mYmlqenpJazFwMlFk?=
 =?utf-8?B?S3QwRFh2bVFnYUhaQ0xTb2xoRk5VcnlVVytJdS9zcDVvaTV6TEYzMDNVdWd5?=
 =?utf-8?B?bXVEdms3RjBmdnBlVkViU0t3dXNyc0NUSmJ4VjduRm9aRWI1MFdQZ202UXcw?=
 =?utf-8?B?WkFmQkRYaEpIaWxyWThydkJXanhsc0NPc0Z4S2l3Ly9McDBBdWp1QXA3ZGhW?=
 =?utf-8?B?dzFTNThXRFNyVFJEd3RLUjgzRUZYd2k0YVJyRUZxZ1NDdzhtRkJLNVdsdFdT?=
 =?utf-8?B?K3UxTkQrMmVKRmhaTzhwK0lvdGpKLy9IcXRZV1dNa3Qvd29sdjF6MDZOdnJ1?=
 =?utf-8?B?d3dJZ1gwWVdaVG5LZGpXSUlQNTJtK0JieFR4cGM3NUNjQ1ZPRmZiWis4MzhK?=
 =?utf-8?B?WEQwRnE2Z0hQUUNHR3ZMMEsrV1FYUDkxb3dNdm5tUjZWblYyU0cvK0dJZE1B?=
 =?utf-8?B?RnZoMFgvL0hIOHhJZk5PeXh1emcybDVCR1ZLQTViUTh2NVByWGlpYlBnN1pN?=
 =?utf-8?B?N3NnL3RJbis5TEJjM040N29ib1FpTllHOGNZWmhoV1JBb2RwZzgxU1NDWnpT?=
 =?utf-8?B?K1dzcmNleGR3R2ZLRWd2MXdHMHN2MnAwcWpYQWhXaTBVdyt6MVo3VElkTmRZ?=
 =?utf-8?B?RUdVZEdVdXg2UTFqUGhWS2dMVjNMQUNyU0JPMk01bzIvTVZPdEw3NGRzblN4?=
 =?utf-8?B?R0pLNTBCb1ViNEJFcDE3RkxiZmlXQU42cWt4bEZ0U3lQY0pUbUtDQ1VXNVdK?=
 =?utf-8?B?NUJ2dVF4WkJJdWwxWisrZVJCN0doem9MSjBYUTY4UVE4T0ZGVjVEQnRWZUVL?=
 =?utf-8?B?WE1aOTFYWk11QkVNS2RnSjhSdTNVeWM4SWFJN1l5c3JLMElOdTNrTm0xallh?=
 =?utf-8?B?ZkFtTGdZMTVrOE4wc2tGajBFYXZ0SlNjVGt6Nlo4c1N6SDd0V3N5Q3NiOERI?=
 =?utf-8?B?Rit6cWpyQ2RLQTZYZG1raTYvNytoZTNOM0MrK2tUbTRXaURwaUVpbnhQSzZk?=
 =?utf-8?B?V1BleTBxSVhad0l6OFU0ZlZGclIyQVU1QjFpSk56SW9zVUJwTmVaLy9NMitP?=
 =?utf-8?Q?VWQnGECxzz9mG8brgOSe4SvDz6lSTqckqhDDTw5gARzj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3431210-e0ac-4c2b-ae35-08de1c60a0a1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 11:44:07.4620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WL4R7k2aaqesbOo+KnDyiQKIQ9gpDXypHzGSS8TwUBvjDrJDOu/LVvUYI4pFtA/Qwb/CH4O5pHpf3LCctx+eRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8427
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

On Wed Oct 29, 2025 at 12:07 AM JST, Alexandre Courbot wrote:
> This series spawns from the discussion in [1], where it was noticed that
> several structures of the VBIOS could just be read using `FromBytes`
> instead of being built manually.
>
> While implementing it, I also noticed that we were repeating the
> following pattern quite a bit in the code:
>
>     slice
>         .get(..size_of::<TargetType>())
>         .and_then(TargetType::from_bytes_copy)
>
> ... which begs for dedicated methods doing this in the `FromBytes`
> trait. This is what the first patch does, taking inspiration from a
> similar feature in the `zerocopy` crate.
>
> The remaining patches leverage these new methods to simplify the VBIOS
> code a bit, accordingly.
>
> If patch 1 is deemed a valid idea, I hope we can merge it into the DRM
> tree along with the rest of this series.
>
> The base for this work is `drm-rust-next`, with [2] applied.
>
> [1] https://lore.kernel.org/rust-for-linux/DDTRW1P2I4PB.10ZTZDY95JBC5@nvi=
dia.com/
> [2] https://lore.kernel.org/rust-for-linux/20251026-nova-as-v1-1-60c78726=
462d@nvidia.com/
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Pushed to drm-rust-next, thanks for the reviews!
