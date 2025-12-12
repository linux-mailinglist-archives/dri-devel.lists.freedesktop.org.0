Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7A0CB82CF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 08:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADA510E170;
	Fri, 12 Dec 2025 07:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nndbHHCE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012040.outbound.protection.outlook.com [52.101.53.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE2110E174;
 Fri, 12 Dec 2025 07:59:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h23KETfSsX1Qa/nAr/wsoWneNY31rxQrn/Wp7z/Qr45D4ACEactH/58/szMi6csGaVoLEBn5LRxa3dYpsX7m2FFaYkgs9B91mvGkrwG2QKdeno/oew35YO7QT4sXzYYCOn+5qsO2yW5VRQCxV3BDVKINy9A9kvgFOhmR3GDgyeyUSDhRVXDU+MWk3hOWjaiPdNJUY2dm60zLiyINiLGOEK/em2VXQhb/h9Mn+c2+x0dp/Uz2g3UI5Gi5+9IReSqhCzzsWoFLHSuECK3rQH0CvMCQB+hFpPcwfpBF8TbJphNaX2+CeKzXuk2tA3Ral8B5a7SBQSUSbNsNo1+4fWLErA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFc+vQtSi+O+/AubQvW80bRJgUuWpAzsZtTQ7dj5VQ8=;
 b=uoXjbXYvAinFIslim1yRMszmkY3Yab+jvaye51JH2BXM52bYDGBm3EPgrIyonzsM1GHzKM9VyhO/NMYJ0XiB1loBQWgMc1rEKn1pJJyMFt/jrPRbF59JLNLxdiXxn67RgK+9dIeVQxWYfmLjxA2iMJBxPYuffbgLfu5nDrkG5R2SmAKEimD9+LYnwXZRxMp87SO9e9dgImNRJe1cgLFpQJfQYrRrUUGgEhNJvKjjbkDaXAMShKvEIXXMIP1xjuA5bQ0/K700lL6FALCGRP6mTjq0vajpcWFdtUuCJeyWSvozEez6k+dcLtWvJrWHxbnb9ugoTWXsNfM0Ze2ZFe3IqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFc+vQtSi+O+/AubQvW80bRJgUuWpAzsZtTQ7dj5VQ8=;
 b=nndbHHCEErInc4B1aK218SExQbuDMDguGgbrK7vaC24Qupgly1idRpik8ummxjL/ivGK/y1ZrJ3IwrJ4tyxMliXmRbNs83luy6KkeSAgpG9niIc5p72LwbYQxV/EmrHiIYjYd0Y4b/Efdj5H/wZwbuiDSTQLrAIWfxMM3HVB7apP4YnOEt1PrPxgAo1cvU1mbxVj02wycGXz/jrAVnH8yfjAxkp9GH4FA0JPIWV9SJqIVoX118fiNptK3nghrlhiSJVtUbBzns/LPqc4PLjFzEOTBE/1bljfSt4oHvpuZdEIRHIFwmN2fLS089XQSx4yb1Sw3dBJANM4j/Qcr2gpLg==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB8878.namprd12.prod.outlook.com (2603:10b6:610:17e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 07:59:01 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 07:59:01 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel
 Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer
 <epeer@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH 2/4] gpu: nova-core: gsp: Fix length of received messages
Thread-Topic: [PATCH 2/4] gpu: nova-core: gsp: Fix length of received messages
Thread-Index: AQHcWveUsuyLFfWLdEG+RWwvvKBbTrUdxGs2
Date: Fri, 12 Dec 2025 07:59:01 +0000
Message-ID: <504C636B-FB96-4B54-B9CD-C506026CCDB1@nvidia.com>
References: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
 <20251122-nova-fixes-v1-2-a91eafeed7b5@nvidia.com>
In-Reply-To: <20251122-nova-fixes-v1-2-a91eafeed7b5@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|CH3PR12MB8878:EE_
x-ms-office365-filtering-correlation-id: 7750749e-eaff-48af-41b8-08de39545024
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?cHZSbzB3N2ZXV3I4Z091UWRkUkQ1Z0RQMHovS29xKzNMUjFVcGpwRlpGWExS?=
 =?utf-8?B?Rms1eUVNSE1WSjNTNElyYVpmU3gxU3JwendmNHM2WTJ3YVJYeGxkTGpvSGRt?=
 =?utf-8?B?MlNBeE9ueXUySnVqbFVNV2UzRWlvZjlGaitWQk9MZExHZzNDTk0yVXdZY0xu?=
 =?utf-8?B?Uzd2dWthc0c1dG4yL3N2L2FkQm5HaThScWpOdldzdzJDbkFIRHhuVXlpVURR?=
 =?utf-8?B?aHpDeFFUVTdMS25qL3laUlBNT2Q1TlhDVTZJOEhDVHlNVDZ3U3FJalpuVmZ2?=
 =?utf-8?B?OGJkQW1ycG53TWNpZURuVGFVUVRUR0FJbkk1OEo4dWp5a3h1dGFZR0NVYTI4?=
 =?utf-8?B?N3NRUHlGM2ZqUDJjN1lRNXNCMm9TUnJkd3hSUjFzVU05RmRvQ1BXTXRwSTNE?=
 =?utf-8?B?TVFyQ0laZmdvRjJJNE1YZU9rMnFaN2YxZzNIY0ZkWHdPeFdVelR6bEJoTEgr?=
 =?utf-8?B?MExPVzdwc2JKckVmc2Y0ZER1OGo3elZNMnVoVDgzSVdpYm5VQWNveHlmSXlu?=
 =?utf-8?B?STQ4bE83Q1pjQmZHWXhKNEZGdW5zaVhPT2NiSnhvbEwzdnpPaEY2RDk5bjli?=
 =?utf-8?B?ay9seDRWKzdmRFEvWjNaR1Ivc2RZbjhEQU5mN3d3ZlZoalQyOGRtTVU1V1V3?=
 =?utf-8?B?VHJ6bjB3K1dmMVNoNXpTMXhWRmpHNm1qdDJzNDNSWVR1N2RCMVVQOCs1bHRo?=
 =?utf-8?B?cG0rbHF0UFhHYkNrZC9BdHV1K3ozTVJXdExVMDNrZUpvQSsrTFgzYjdYcWdP?=
 =?utf-8?B?NjIrRVlYK0RFRmZ4R1QvK3RiaHd0VTV2WC91ak5TeXBhbnNSYVdZL2RRYkRI?=
 =?utf-8?B?OGwwWWxIVk1HZk5BYUtic29lc08rMzR3ZDRNUFdjL1BReXdzT0NWVGorRTR3?=
 =?utf-8?B?ZUlKWmZjekFZZEhmVFlVYndKMytQT1U3My82ZEJFeUJsSTdMaEcxMG0zTzI2?=
 =?utf-8?B?ZnVBKzdnelN2bGlzb2piU2pYdXJFYmdNRU84a1hhdXF6SUpZUS91eTg3a0Zo?=
 =?utf-8?B?WjNoRUFPaXRWZDVqZ0ovVVVVK1VEYlMvMEJrQ1hvVEY3V1JsUmY4OVpDbnli?=
 =?utf-8?B?RFkvblRFTmptSlVUUFN0NWlCMDc2dVBxVWpPQVArdUlYUU9BNWt2ZkNWMmV3?=
 =?utf-8?B?bW1yaEswM2lCblNQUmd3Q2h2a3F1WU1mZWJkeXNzNEZNNzcxM01KOUUxa2NC?=
 =?utf-8?B?enR4VU9wTVczamZnUWRzcFRlSDluRTBBMnFrK2lEVCtoMFNhWU5yVFJpeU1P?=
 =?utf-8?B?ekl1d3BjVmhPL2ZnS2JIUDlOOHQxb3BNVEN1UXVpa0ZobUlTNHIrRGEzaWti?=
 =?utf-8?B?RzQyK2VqUmx3NjdSYWhESnhOckFjQm4rME5SRWZKb0tGZnJxanU2eUNxWHpn?=
 =?utf-8?B?aW5zakkva1ZFRU5aK1hrd3BDQzAvSDlzUC9XVVhmcGZ4K1VZNmpOQlVhYTNF?=
 =?utf-8?B?SHNoZVRXMVVyanQ4UUZxbElqTzdkclR6TDFJYndsVWppZG9FQ1FueWVMOVJF?=
 =?utf-8?B?clVxT2VUYmRFckM5NTdYSUxHNk1OUUZaZFBDVmlMRWFSNFY4SGV4THM4eHow?=
 =?utf-8?B?RWJYT1E3S1JzSkpEb3RnOThlaGdLNWFiY2RvSVI1Nkk3ZUUwb2ZHVEtkSGdO?=
 =?utf-8?B?VkRFQ2hqN1JjOWthS1BDUGdVRERyd1ZMMmZXMWRndytUT2c5R2RVMlp0OWtu?=
 =?utf-8?B?OS9vdFYreVdzOERUYlMwQi9WNS9adFA5VG1pTzlBWXNqd1laaEIvb3Y0RHBk?=
 =?utf-8?B?elRjOTBGVVRvVTNaUlJaQXdZOCtKVmJiaUpqU295UXdMcVVZY1JBd2lEZjhO?=
 =?utf-8?B?bmR2Y2hpcUFlMzRJcStyNCtpNlFTckJNZ2hleFlHNVEwUlRIT2xIcXVQSzV6?=
 =?utf-8?B?aGJVOG8zdms1R1hXdEdTSkxRbUJMaEsrWXZrUDcwdjBhR0hzTU9xZlFmTk9P?=
 =?utf-8?B?WVYvWnY2dDhHQnlZTEUrU1EzRU5uWEdsU2pObythL0VocThvT0FNLzMxYjFr?=
 =?utf-8?B?NlBSYTB6N0dLWmxtMFEzcmZNakxVK1ZJMkJ2NktldllETDF2dXVpVlZBZGxw?=
 =?utf-8?Q?8jUeKb?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzBVWldRWkp6bTRxVWFKNE1DcnlHWUtsTnNXa3dUU0JaN2owUU44Nk5Eeklt?=
 =?utf-8?B?YzljRVdPOGxiYzBOT2RjVkVxYkhkZW5vcitkSlROSmxWM2QveHNyK21VKzEw?=
 =?utf-8?B?c05odE1YWVVvamFqV0Z4TzRZbTMwVmxHMlI4UXZ5UGUxNUNBOWVxdDFBc1pV?=
 =?utf-8?B?RWpmeHFicUJkN0Rja3hPOXp6eGVSSHVhd0R4UVZ1YlpJRHlkamwySGhrL2VO?=
 =?utf-8?B?N2xMdXlsQkFlMjd6WG1GMGUvMjRObXNXQVAreEk3aEh2dnJ2MFRtam9ZREIy?=
 =?utf-8?B?SmdsenYwWGMxMUNsQWNvS2hmdTc5WVlaS0hvSWRUdGpJb0M1WE5ROTFqMjVG?=
 =?utf-8?B?dGRuTzZaL1dENmR2RXA4bFlkRW02NmhXWkdHU0tWdkk2cFhzdHVRaWVXTURk?=
 =?utf-8?B?Qjd6eXpUMEVnMjhwWXVGbVYwL2h4QzNlbFpRb3lxZmR1WWNPWnJTTDBsaW91?=
 =?utf-8?B?L05YaTg0MDN4SUlHeXVYNHFlZXJ0eXZIcktHRml1RXRERjNMeGhaa0FlZlQ4?=
 =?utf-8?B?eWJjUHh6SUZobVdkZ0g4WnU2ZTl5ZFYvcUluR2pZNUhvckRmWTM0WVR5Vm45?=
 =?utf-8?B?SDJ0dGFTRHoycDNZMHUvWUI4aHVrMnVBWjlvOFB5d3M5aHAvZ2VtTENTZW5S?=
 =?utf-8?B?Y1hMcElKVytMaFRNU2p4WTAyYXdVUFVLY1R6ejVtcEUrcnEzRllXSVZBdjhD?=
 =?utf-8?B?Z2FnZzV3Z2ptL3pFdGVqQXY4NUVQMFVhWDVEWGl6amJpcmJOUEI1QXp0d1Fu?=
 =?utf-8?B?OGVpS3hEbkMwcDlwcFdmbzhBSjhVOHVzYi9pcDJmdDJTek9SellHeUR2WEpM?=
 =?utf-8?B?VlJHeFlFY0oxbVBSTmRyVHZETEdJNm1NTEpIQ3N4UXgxWThKWnRNa0JYZjBB?=
 =?utf-8?B?TUh1ZlR1b2UyaHZnZGF6RGVlN1FLVXF1SloxcmtMSmg5TnEycnJsa1l1ZTdw?=
 =?utf-8?B?UWRnMng3Q3FJT28rYWRyTmJKSzBjbngzZVMwOXppNmgrekxJMmdCY2p6Y2Y1?=
 =?utf-8?B?TDF4OHJNWGRRZGxXcCtNZVJKQU5sVm1pOFQyRXZsQ1g5SXF1WklHamE0d0VJ?=
 =?utf-8?B?bVBKa0tpdHE0VFFOSmJ4UGRTOTFUSmYreW9BZzJudzNIN2dxOHlGVjE5LzVH?=
 =?utf-8?B?NVZHQVdhUVJxajlrK3J6QWllbDlDMkd3UUNsVlpSY2lXbmtaWTJIYkZmcHhN?=
 =?utf-8?B?LzFoYlBUKzZ5NWcwSUxGWDVIaVBlck5xK2l2NmZjUjJVQjNoZ01tNm96UWVt?=
 =?utf-8?B?WFZUdDFJYis1QnpNSSsvQ3VyWmlGY3hXVE5pMXpKaHN3dFQvbXB1VkhkRm4r?=
 =?utf-8?B?YkQzTkxMRGZCYjNVVTNYSUJLY0g3VXhEWWQ2U2J0d2lmTi9KL3VhWlNPUkQr?=
 =?utf-8?B?WVYwNnAwUGs3dXByU1F4RTIzWUpsVHBDTXZHSzRtUzBocnZVSFhRNzlGQmFC?=
 =?utf-8?B?T0VmZ2ZrOTFpQnZ4aFZWVG15clZDcW12aEdMQ3dNQkNtREU2ZGgzMERrTjVv?=
 =?utf-8?B?NGkxdnhoRHBIemtKN3JwK1dTZWEvR25sUk13bTIvWmhibENtMWFkeG56S05v?=
 =?utf-8?B?NEl3R1VmTkl0S05NaUY4eHRzaUM0TGNEOFVqS2FPc3QwVm5DaXhKcTEyOEgx?=
 =?utf-8?B?MkpNUkdndXRMMWNKaFZlckNWYTlZbnVUYk9INTZYSXozczdOUGNNRzhFUGpX?=
 =?utf-8?B?dXNtdUhIdXN0U0FBRWdzNWJld2NvZnRkWnU3dHB3cm5DU1l5RmUzU3JBdDBu?=
 =?utf-8?B?TS8zQkxWVzhEL0FuR0FYdjFuNnN2OGpCTktxMTFWSjI1d2RNT0dBK3JyTitp?=
 =?utf-8?B?TitrTklPVXZpdGtCRGV4ai9GU1pDaHVCa0N2blN1NDFWRnUzUmpyMjFDQzVS?=
 =?utf-8?B?UkpWaUpmRDhiZXRwcE94bWlhQmd6WmN5S3ByMTRnM2F2emRQNmh6eDNiSWll?=
 =?utf-8?B?MjQ3eVBMTXpUa3dsUGxobkl0RFdWMTYvVFFzRi9rRThsVXdCWHE4UndBUWhY?=
 =?utf-8?B?VFJJNDNpQmRqdGR3NXNKMjhJd1Q1QTRTZzRQMWhJUHA5MUJOdU83TGdrMWE1?=
 =?utf-8?B?bTlIUkRrRXpVYnpWRXlzTTU5UHEzTzRXN2VzOVhTK09hSndDejh0WHRXV1hE?=
 =?utf-8?Q?2Uioui7iZ/raVIg+SyjJu8vtB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7750749e-eaff-48af-41b8-08de39545024
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 07:59:01.7485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NKjZ5QlksJtwdhqwo8zavY0f6syrSZl1+hVnSjlQDNjB6I97C10NZ1aEmvOb2hsNoFfuxchqtlugZ+NuBEbZXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8878
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

SGkgQWxleCwNCg0KPiBPbiBOb3YgMjIsIDIwMjUsIGF0IDEyOjAw4oCvQU0sIEFsZXhhbmRyZSBD
b3VyYm90IDxhY291cmJvdEBudmlkaWEuY29tPiB3cm90ZToNCj4gDQo+IO+7v1RoZSBzaXplIG9m
IG1lc3NhZ2VzJyBwYXlsb2FkIGlzIG1pc2NhbGN1bGF0ZWQsIGxlYWRpbmcgdG8gZXh0cmEgZGF0
YQ0KPiBwYXNzZWQgdG8gdGhlIG1lc3NhZ2UgaGFuZGxlci4gV2hpbGUgdGhpcyBpcyBub3QgYSBw
cm9ibGVtIHdpdGggb3VyDQo+IGN1cnJlbnQgc2V0IG9mIGNvbW1hbmRzLCBvdGhlcnMgd2l0aCBh
IHZhcmlhYmxlLWxlbmd0aCBwYXlsb2FkIG1heQ0KPiBtaXNiZWhhdmUuIEZpeCB0aGlzLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QG52aWRpYS5jb20+
DQo+IC0tLQ0KPiBkcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZ3NwL2NtZHEucnMgfCAxMSArKysrKysr
LS0tLQ0KPiBkcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZ3NwL2Z3LnJzICAgfCAgMiArLQ0KPiAyIGZp
bGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZ3NwL2NtZHEucnMgYi9kcml2ZXJzL2dwdS9u
b3ZhLWNvcmUvZ3NwL2NtZHEucnMNCj4gaW5kZXggNmY5NDZkMTQ4NjhhLi5kYWI3MzM3N2M1MjYg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L25vdmEtY29yZS9nc3AvY21kcS5ycw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZ3NwL2NtZHEucnMNCj4gQEAgLTU4OCwyMSArNTg4LDI0
IEBAIGZuIHdhaXRfZm9yX21zZygmc2VsZiwgdGltZW91dDogRGVsdGEpIC0+IFJlc3VsdDxHc3BN
ZXNzYWdlPCdfPj4gew0KPiAgICAgICAgICAgICBoZWFkZXIubGVuZ3RoKCksDQo+ICAgICAgICAg
KTsNCj4gDQo+ICsgICAgICAgIC8vIFRoZSBsZW5ndGggb2YgdGhlIG1lc3NhZ2UgdGhhdCBmb2xs
b3dzIHRoZSBoZWFkZXIuDQo+ICsgICAgICAgIGxldCBtc2dfbGVuZ3RoID0gaGVhZGVyLmxlbmd0
aCgpIC0gc2l6ZV9vZjo6PEdzcE1zZ0VsZW1lbnQ+KCk7DQoNCklzIHRoaXMgaW1tdW5lIHRvIHVu
ZGVyIGZsb3cgd2l0aG91dCBvbmUgb2YgdGhlIGNoZWNrZWQgc3VidHJhY3Rpb24gd3JhcHBlcnM/
IEVpdGhlciB3YXksIHdlIHNob3VsZCBub3QgdG9sZXJhdGUgdGhlIHVuZGVyZmxvdyBJIHRoaW5r
LiBXaGljaCBtZWFucyBpdCBjYW4gcGFuaWMgd2hlbiB0aGUgcnVzdCBvdmVyZmxvdyBjaGVja3Mg
YXJlIGVuYWJsZWQuIFNpbmNlIHRoZSBoZWFkZXIgbGVuZ3RoIGNvbWVzIGZyb20gZmlybXdhcmUs
IHRoaXMgY2Fubm90IGJlIGd1YXJhbnRlZWQgdG8gbm90IHVuZGVyZmxvdyBpbiB0aGUgZXZlbnQg
b2YgYSBtYWxmb3JtZWQgbWVzc2FnZS4NCg0KdGhhbmtzLA0KDQogLSBKb2VsDQoNCg0KDQo+ICsN
Cj4gICAgICAgICAvLyBDaGVjayB0aGF0IHRoZSBkcml2ZXIgcmVhZCBhcmVhIGlzIGxhcmdlIGVu
b3VnaCBmb3IgdGhlIG1lc3NhZ2UuDQo+IC0gICAgICAgIGlmIHNsaWNlXzEubGVuKCkgKyBzbGlj
ZV8yLmxlbigpIDwgaGVhZGVyLmxlbmd0aCgpIHsNCj4gKyAgICAgICAgaWYgc2xpY2VfMS5sZW4o
KSArIHNsaWNlXzIubGVuKCkgPCBtc2dfbGVuZ3RoIHsNCj4gICAgICAgICAgICAgcmV0dXJuIEVy
cihFSU8pOw0KPiAgICAgICAgIH0NCj4gDQo+ICAgICAgICAgLy8gQ3V0IHRoZSBtZXNzYWdlIHNs
aWNlcyBkb3duIHRvIHRoZSBhY3R1YWwgbGVuZ3RoIG9mIHRoZSBtZXNzYWdlLg0KPiAtICAgICAg
ICBsZXQgKHNsaWNlXzEsIHNsaWNlXzIpID0gaWYgc2xpY2VfMS5sZW4oKSA+IGhlYWRlci5sZW5n
dGgoKSB7DQo+ICsgICAgICAgIGxldCAoc2xpY2VfMSwgc2xpY2VfMikgPSBpZiBzbGljZV8xLmxl
bigpID4gbXNnX2xlbmd0aCB7DQo+ICAgICAgICAgICAgIC8vIFBBTklDOiB3ZSBjaGVja2VkIGFi
b3ZlIHRoYXQgYHNsaWNlXzFgIGlzIGF0IGxlYXN0IGFzIGxvbmcgYXMgYG1zZ19oZWFkZXIubGVu
Z3RoKClgLg0KPiAtICAgICAgICAgICAgKHNsaWNlXzEuc3BsaXRfYXQoaGVhZGVyLmxlbmd0aCgp
KS4wLCAmc2xpY2VfMlswLi4wXSkNCj4gKyAgICAgICAgICAgIChzbGljZV8xLnNwbGl0X2F0KG1z
Z19sZW5ndGgpLjAsICZzbGljZV8yWzAuLjBdKQ0KPiAgICAgICAgIH0gZWxzZSB7DQo+ICAgICAg
ICAgICAgICgNCj4gICAgICAgICAgICAgICAgIHNsaWNlXzEsDQo+ICAgICAgICAgICAgICAgICAv
LyBQQU5JQzogd2UgY2hlY2tlZCBhYm92ZSB0aGF0IGBzbGljZV8xLmxlbigpICsgc2xpY2VfMi5s
ZW4oKWAgaXMgYXQgbGVhc3QgYXMNCj4gICAgICAgICAgICAgICAgIC8vIGxhcmdlIGFzIGBtc2df
aGVhZGVyLmxlbmd0aCgpYC4NCj4gLSAgICAgICAgICAgICAgICBzbGljZV8yLnNwbGl0X2F0KGhl
YWRlci5sZW5ndGgoKSAtIHNsaWNlXzEubGVuKCkpLjAsDQo+ICsgICAgICAgICAgICAgICAgc2xp
Y2VfMi5zcGxpdF9hdChtc2dfbGVuZ3RoIC0gc2xpY2VfMS5sZW4oKSkuMCwNCj4gICAgICAgICAg
ICAgKQ0KPiAgICAgICAgIH07DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvbm92YS1j
b3JlL2dzcC9mdy5ycyBiL2RyaXZlcnMvZ3B1L25vdmEtY29yZS9nc3AvZncucnMNCj4gaW5kZXgg
YWJmZmQ2YmVlYzY1Li43ZmNiYTVhZmIwYTMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L25v
dmEtY29yZS9nc3AvZncucnMNCj4gKysrIGIvZHJpdmVycy9ncHUvbm92YS1jb3JlL2dzcC9mdy5y
cw0KPiBAQCAtODUzLDcgKzg1Myw3IEBAIHB1YihjcmF0ZSkgZm4gc2V0X2NoZWNrc3VtKCZtdXQg
c2VsZiwgY2hlY2tzdW06IHUzMikgew0KPiAgICAgICAgIHNlbGYuaW5uZXIuY2hlY2tTdW0gPSBj
aGVja3N1bTsNCj4gICAgIH0NCj4gDQo+IC0gICAgLy8vIFJldHVybnMgdGhlIHRvdGFsIGxlbmd0
aCBvZiB0aGUgbWVzc2FnZS4NCj4gKyAgICAvLy8gUmV0dXJucyB0aGUgdG90YWwgbGVuZ3RoIG9m
IHRoZSBtZXNzYWdlLCBtZXNzYWdlIGFuZCBSUEMgaGVhZGVycyBpbmNsdWRlZC4NCj4gICAgIHB1
YihjcmF0ZSkgZm4gbGVuZ3RoKCZzZWxmKSAtPiB1c2l6ZSB7DQo+ICAgICAgICAgLy8gYHJwYy5s
ZW5ndGhgIGluY2x1ZGVzIHRoZSBsZW5ndGggb2YgdGhlIEdzcFJwY0hlYWRlciBidXQgbm90IHRo
ZSBtZXNzYWdlIGhlYWRlci4NCj4gICAgICAgICBzaXplX29mOjo8U2VsZj4oKSAtIHNpemVfb2Y6
OjxiaW5kaW5nczo6cnBjX21lc3NhZ2VfaGVhZGVyX3Y+KCkNCj4gDQo+IC0tDQo+IDIuNTEuMg0K
PiANCg==
