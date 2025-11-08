Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F0AC421A4
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 01:10:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B963210EBCC;
	Sat,  8 Nov 2025 00:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OaR44RBn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011026.outbound.protection.outlook.com [40.107.208.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C45710EBCC;
 Sat,  8 Nov 2025 00:10:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fq+XMWwLEr/vMCazdmHVYp5EUwafb73Y/rZBh/30ZkBJ3XyHaIvIQkjFzlegrAyM5EG83OtshT4ubrFHsMbYLlXjkmBbBNRAWM8iSU1etN1w9yANuhspSXmd6D4FhnJ0oivTdt6j/s5pMgwAxQ3uAeW4z2TkytsWTUHwJspCdXNnHcRMvbjnwSa7UDAQ6/wBRYhckijWotjUsLa32CsEQEjyt53RIv30kUTq81rKILSprElU0Rcx/8TYso+W7JXThq/jbePPTaNF16EHvt1yUZFd0IWqAzwHo+EP7q1D8j8qImoEHY7qTY78dZvd3OH8Ts6GCpZ+WtPgbkZ1H5c99g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0CoCLsJZOlmLgtYq/f8J/GMUEmerNlcoGEmkxVHNjo=;
 b=LixHuXUaOznAJE6Bm9mlGrY7dQGINlaQfAr4iosoeb1MdAKHd1WG7ifTtkVQaaIeSqDcOIhCbinDmakncRvoefoTk3cpgd4NmpooThqzBVx6LPPN1zfhYQ1eFx40qiKYsMEbLZP9pwyRd0K8JGdkV3V5Ug49bGewIIelEw5LTTm6Ys6Vt8KeKbPHJIczWFDOZWIjOb1X7Yk2ELrrLAhW/0Ww8Yskt43iAU96k75sfjKIZK0sG4jmAMGxtAEnVXOKAYNmsykHWGwbLaf3ZA8UQnKWDJeORNud/HPzKwmkveKayYE6d7P6d6IghcSsG5Ez2CjjGrmsNMH8xmbB99IS7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0CoCLsJZOlmLgtYq/f8J/GMUEmerNlcoGEmkxVHNjo=;
 b=OaR44RBnzkMwRssBkj7DTCpB8ZjQ7ant7nQ0o0ZjEhtsT9uyKgthOFzb595legGshkhceWPsLUqEtawg6rSvI/EPEeGDwgCYRmUp2Fh1Dtiri6oX7HSmK2/vIhmARq+Usba0TbbimGqoGZQIImrhDQe3B2BlsniqfN2FMuMnqAX4Y5O6kJTLIrQlZz3D2bzLYy2076u0Pb2JKFJh8Xch0H91CnATEi0nPTIPlr0JBoksCOOyu7W0YjGHRCdzA0QWDh0yM3fWcOvkDRZRIWgZOv0bXOsQ7bq8Yvb1FwT9LDaTWl0we/DG8bcODGKRaARD7jQtubtaOCej3WdTTdsyVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by MN0PR12MB6223.namprd12.prod.outlook.com (2603:10b6:208:3c1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 00:10:16 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 00:10:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 08 Nov 2025 09:10:11 +0900
Message-Id: <DE2VLAQ0JMA6.3AUZKFIZJ8K1W@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "Alexandre Courbot" <gnurou@gmail.com>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v8 16/16] bitfields RANGE doc - not great
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
 <20251108-gsp_boot-v8-16-70b762eedd50@nvidia.com>
In-Reply-To: <20251108-gsp_boot-v8-16-70b762eedd50@nvidia.com>
X-ClientProxiedBy: TY4P301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|MN0PR12MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: 603d7148-44b2-49cb-cd12-08de1e5b310a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnRLc0V2Y1VBQ3o3Mm14YzU4Tk0vbi8vNFRaU3RVQVluSWIrSnZ3UXhKNXUv?=
 =?utf-8?B?WHdkVlZ5aDdCYUZZRnlldVpOYTF3aDBuY09LaEZqNzlnNCtoNXdGRUQwSGxr?=
 =?utf-8?B?R090L0dDZGtiVlk1UWVnaTFLQ2ZjVGxrZkl6V3NPMTZMOGh5Si9Ldk92a3cw?=
 =?utf-8?B?TEc1TjBiZldQdWliNko1K2lpOUdYcU9jT1dnVGx5RHN1RTlucU1PcDFBTTdr?=
 =?utf-8?B?TFVCTkkybXEyeGNrNHd6cWpoS0lBandqVXp0N20vZ2hyM29VQkJrM0hXZERt?=
 =?utf-8?B?bFJCVDg5Z2kvUnZyeXBOZlh0QlJXK05xSVZUT1d0VjRSd3hXN0pydTgxMWla?=
 =?utf-8?B?aDRTOEpSME5idUsvVlowN2RGNFMvbXVwK0NiN1VDSlc3Y0ZqRVhlc3phWjk4?=
 =?utf-8?B?OUU4ZGZRa09HWHdObWhNNnV3STlNVE5Rb3ZJcG1FVVJ1YlBheE5zWnNIdDJk?=
 =?utf-8?B?QTNXNDB5bVJzUk1NWXVKSWExUjR1cDFZUzNnZk1Lem82a3k2akFvQjUyZldi?=
 =?utf-8?B?ZVZVaGxUZVhOU3pIUmNmdjAveXlIS3VxRW13ZWR0V1ovMmRFS2RjTFJQZ2lP?=
 =?utf-8?B?a0dWWFBWU0VFVytyMnIwbklmOU5sQk1MdW5TemhKNVI4OVRycWtCTG04MTNT?=
 =?utf-8?B?YUpWdGZQVmNvak9CMnQ1WFJVck4ydkhTKytFUnpjZEFTajFyanY2VUk4RW1i?=
 =?utf-8?B?RDFha0NvczIzbEpGT2xxK2hiN280YUpkZWZwNHVNQkxmMVFveHYxbFE4Q2Ri?=
 =?utf-8?B?U1lJZWNhWi9GSVlVS0wxMExGcGRHbHJlMVpiWTdEMHhBZzRFbUI1T0ppVjJs?=
 =?utf-8?B?S1RqbXh1bTdxNTJ3RXRvRWRHVGNOaGwxSzBJTFA5bDBkQkJjV0wyd2xkVzh5?=
 =?utf-8?B?WCs5eStzQ3J0UjBZMDNMMHlpUEV6cUhaTjAwTWQvYnVJVXBwb0NvUy94ejZE?=
 =?utf-8?B?RFdwL3ZCYjhOZnB6MFY0eTlVY0xWV0QwdWdvb1NzcWE4UlZNelRVZVYzODUz?=
 =?utf-8?B?aTk2dkxTd09wdHJxWXYwd054M2lNZEtPOXJWSTk1V3c2WFVlNFpCVlRiamdy?=
 =?utf-8?B?RnJVZUhtWHZXaW5VR3g0QkM3dk5PNGYwWTV6ajRCcUFManMwQmloRHBYQ2p6?=
 =?utf-8?B?dEZZTjIyWUgwQkVBNURyMThwczRXZERzR3p5YUVVVmY3NnVuMC9jNFdUZGpX?=
 =?utf-8?B?cTF1ZVp4YnVJMW15OHcxdEwwZGpIU3JKT3l2eTJzUlYycDJlV2pybVdTTW00?=
 =?utf-8?B?N015Tlg5YVVHYnpZMTNURUVTbndlblpzWGp5b2lyZWplQ0JWRFFNbDR1OHMv?=
 =?utf-8?B?NGxVYU1vMnR5MVdBM1VjTHIwRGdzRTdWb1Z0K0dWNklpV0x4U2pGQVdiREc3?=
 =?utf-8?B?VFRxMjdPRzFhTk9xZU40SmpYallEOEFKMlM1OUN0Wi9SRHhiemMrREdkcGJq?=
 =?utf-8?B?MzhUYXM4M3Y2a0NtT3RhNkg4YkR2LzhTVndvUkRBWVlmSE5KcjA3d0s2TVVM?=
 =?utf-8?B?dnplUXhCUk5lRWVYNHpGVlkvWkt4NGVveVVzbHpwNWV2cXhJMFFWZHF2NGJ2?=
 =?utf-8?B?WlhnZzI1MUlCdktqdnhCcUJOclBwT1h5RE0xOWZIS2w1WUZEUnNTcmNkK0lS?=
 =?utf-8?B?akh1Yi83MFEvbmdMZ2JaTlNaQU13cWVOckxDQTBRb3phMGpSSHVTYVVhOWlh?=
 =?utf-8?B?cGdob0I3ZUkwMjFrWkFXYnlvL3VoUXo0YTQ2YzlMMUR3NkhReDlqSlJ1eHVk?=
 =?utf-8?B?NXlSSkRBQ3RtNmFzSjEyNE9RUjQvdnZXZVFCcDlkOFBUSWFCL0gwc0xVZ3lR?=
 =?utf-8?B?eW9DbE1pZ1N6U3dPZmFDRUQzRTVvYVpMa3dKcFRXTUY0bVZ1NUtEMTZ1WndF?=
 =?utf-8?B?NlRLUm9nVEFPMUhNeTdVM3dJUU4rWEFIeXI5OFBjazFYTGRlSjNTcFJ6eUo0?=
 =?utf-8?B?QXYycGNJV01VK3VSejBGYkJXN2E2QmtvSk5qS1JMRFFiWWxNMGNMT0d6ZVAx?=
 =?utf-8?Q?5ypvxNZMKe19gU28qplS/Y7qPz2g0U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0ZQWFhwMFE5QkRVU3JjOURUeTAvWTAybCtoWjRrUlNwSXZUS1grZWlRVExI?=
 =?utf-8?B?S3B6Q0pkTjVKS21RSDU4eC9jNFlkaG8ycWduUlM5TVJlbnh1bzY4U3hXVkQr?=
 =?utf-8?B?M0ZmMU5jcHJpa0NwanVFT0IzZk1NZytMTk1xVVp2VnBkU3lnV2hUOHZpYW1O?=
 =?utf-8?B?b3J5NU5jdU52eEh3RjV4RmxndHBoYzM4TzN4VnJhZUk4bS9pWFlkZEJKc3Ax?=
 =?utf-8?B?SGVOMzVaS2RkcFh3Wi9QN2ZzTVJIeWRTYjJOdGpqaTVvYXEvMm00MjFjL1RJ?=
 =?utf-8?B?bDZJUHNIU1NJUnJ4QUJWby9tamRsWTBvRyszSkUwUWM0T24rSHJFcXVsK21B?=
 =?utf-8?B?WXRrblcvR3c5N2lTK2ZLSGN2SFdta3hxOG5FTlVqNDBvSEZxVkN0NDdlNElp?=
 =?utf-8?B?RW9TdE10NlYzWHRIVklYbTZVSFU2SE4yZ3BFZHl1Uk1pNWdIUkZnOHVYTXhK?=
 =?utf-8?B?NVJDa3RyQWNPY3Q1YW9CM004SVJQRFJBY2RBQlBPbXREdjB0WGwwSHpyKzM0?=
 =?utf-8?B?d3UwUWtRR0cxVmhHUzNJb2NQdElrOVpLTkFHV1kvSjduY29BUWsxVzFuT240?=
 =?utf-8?B?NTNESnVETE9BdXhzSzJvTHVOMURlNWd3TThOeU95ZmJMMm5RcUNJR2YrQnFH?=
 =?utf-8?B?YzNzTjZnL3dsTlpqV1ZWcVdIUWVkMko4Vm9wbmNMYzE4ZDBaaVhuOHdtc3Ev?=
 =?utf-8?B?UTRNWXBDVTB2RjVjTkxvNTdCV2NFUTdwWXY1UDZWMHYxQjRML1BaL3oyTXFz?=
 =?utf-8?B?V3d3VGJFenJxV0l5QzB3RloyeTRNV2hEOE1yV1Bqb1ZwcWFlcEY3Y0NLajRx?=
 =?utf-8?B?MzNxcmNnOWQ5UXRRKzZwWWI4bi9pMDZyenBUdlVoQWlqeVNEY2pKUGF4Mmts?=
 =?utf-8?B?U1d6bnN6aHV2SytyZ0ppQkFhUEVFNTVqTm9CN2p2SWNoVDQ3cS9nYWhmNXBF?=
 =?utf-8?B?L2RRblVvMFFaV3ZXaTgrM3cxeUI0bEF3WmxMZjB0NU04QS80VytLOHlqUS84?=
 =?utf-8?B?NXR3MXlNWU9qMGtDbTRlbkdyMTY2RTZYZkVRWmVVdjZLd2tvdDRuTmo5b01k?=
 =?utf-8?B?WkxUSGxWT0FnK1BIZjBkMnpDOEl5WFBOdUxmSnJTUDFlNk44Z2tLVjIva3NW?=
 =?utf-8?B?Y3ZXU05PcTZ6enk1NGUzaUlKV3FuOExwTlRiUTFNTDMyOWhOUkNVSlA5bDFa?=
 =?utf-8?B?V2NSeU8wbXViL29WWUQ2d0Y5MVRueXl0dGxaa1JtejBpU1l3RFNOYnNmNWJL?=
 =?utf-8?B?VzZmT0dONFlLTWhHZzJVcFZoZlg4S29vY2hVVUloU1FQbUY0bDJZZzhQT2hm?=
 =?utf-8?B?clA0UVFqMWg2RGxFcmlGYXEyVmhuV3NHa1diRXNoNldydGNRTitHVW02VkdK?=
 =?utf-8?B?Vm5pTk4xb3N1b1JTd0pjNnpQUmEySCtHYzZLdWtSQWZGelhJa1hKVTlxTXNo?=
 =?utf-8?B?L0h2dy9MYzROVEpQUXZsekNZNmZ6Vnh4QWovN1N0OEJvZ2VybUlSNWlLdjBL?=
 =?utf-8?B?SmdSWS9rVXdGN3ZmU1lTZmEwZ3g0NFl6aGtMdU5hMWJFdm1IMGR0V1pjZzdT?=
 =?utf-8?B?ZGR4dmRnMGVMSG05cHlpQ001T2lPY0QwcFZsTWZKTEc5cEswZWFCNGJEc0dB?=
 =?utf-8?B?VlFLU1ZyNDEvL1JMYkRvKzJOcmVUa1c2ZDNFRk5QY25BU1N3cGhUcTJLYytU?=
 =?utf-8?B?aHppaUc1aW94ZmhhWEx2eElkb3d5aXRZRlRHTEJ6T0kwMUlGZlNkd0dpOWdN?=
 =?utf-8?B?cndQRkl2UCtmV0taSXJueFR1VlF3djBuaG5rc1liUUhmUVBMUktzaWRHRkNG?=
 =?utf-8?B?WWtTTVVnVER0YlR5TUt3UG0rTXBweWczOVZjTWIwais3Tk9OQm41SWdHYTVI?=
 =?utf-8?B?dTZNbUUyRTZJRzNtSUl6TDFtMmR6Tjk0SnJHTTYwK2gwK01VenZsUE9VK3lQ?=
 =?utf-8?B?UUpOUDJBcWFDd0xHb05mME9yT2krMFNveWVldVptTGRZZ2I5cTFwamcxWDR3?=
 =?utf-8?B?VHFvajRRMCtONlBaQUpjRks2QjM1cy9oNGpyRTV2RGh4RXZMdnRXV1QyYzNM?=
 =?utf-8?B?ODdiU2txU3ptT291bmtKc1lpeXBUdCsvejhxajNUdEhWaVVQRjRlREtzWkhG?=
 =?utf-8?B?UXF6b2dzTHJha0s0WkFldVNBWTRYanZML2dZUWk3MlFPZWVvMS9yL0FoNUIr?=
 =?utf-8?Q?ZkyUh97GoFLI5OIdkZusVZOKdZLkcTSI5S13DdD05ACS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 603d7148-44b2-49cb-cd12-08de1e5b310a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 00:10:16.2358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cfzc0Hs+4LMtjF6oJPldqMbz8PRE9BpYh+gJzG6FoFrABglENF0wbNBco0w4n3lldqaN+0q9vTAHWiwrZuz1wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6223
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

On Sat Nov 8, 2025 at 8:43 AM JST, Alexandre Courbot wrote:
> From: Alexandre Courbot <gnurou@gmail.com>
>
> ---
>  drivers/gpu/nova-core/bitfield.rs | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)

Please ignore this patch that somehow slipped into the wrong branch.
^_^;

