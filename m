Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A9BB94342
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 06:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B06410E07D;
	Tue, 23 Sep 2025 04:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QLmXGGk9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010030.outbound.protection.outlook.com [52.101.46.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B4910E02E;
 Tue, 23 Sep 2025 04:23:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gyffy6rl63ithef7PkBX7Nrjf2aRyd0rjvVbHNWXlzTdxodGlabZfSRy67WPsqebRSONUtjNv1DVUKCduyxXrOyOXUFTEnHslzEnu2aIQgyqdT5pGOeczaL0UpCq5HwZBTvRM34GJjLVeuDOZYNnv9BxvLz4l61bmoaTd0R/kJU3s6KCbq3uPLAtTByiJY1z45kN4pawbKTAGuqmkN8/PDvX725t+hEt0Izz9g6LmSV7EVwCHAxyCDITXgMmOT4Awt5/Kr54skvcV+3T+FjrGhpfegndvlVfmo+xESNu4VluZQafLWmHzt3n6oP/pCjqZMpHpiPmUBfb0m09e5+bug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcAnmdrpr3ednq9qdMgRuQ7I+/3j8yVHBKXf0Qf9nNg=;
 b=bdomanw5QSCLa/HqgbAS38NwBh8I9Ge2kIbexq6JhBBw4OLcpg8frN+wP9x3NFVkVhHJhmy8SPdEGv5IJ/NdAmFIKg4mt54m2sN/FxQEFZP7o2GcdYJNKTh2vQpfbSjGzXzCr7uXpFBJ9VEsV0E5//iYOMMSEsE35sLW4nn4sd7rEWJYOocbtBy/c8/ZBvHExHHpj3hxcSUBZETqtmXv0lW8BG4Tqb1uBFghEEuvU+NjuE7mLbx3ECnlhtooH0HDzk4JHcdwHwFm39S56Rj9s/jtZSl/REzbn6qnzhqQoFm+x4w3vAV2mmQBmuU8yESJfUR8nWGwcpzUPCn/j4NjcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcAnmdrpr3ednq9qdMgRuQ7I+/3j8yVHBKXf0Qf9nNg=;
 b=QLmXGGk9nzfRFu+kBOkIHeQJSa6e0pFJee7DaxUr0CTaPov+MIlkpguc9htVn07FdYN0ziaW2sED/V2sdeIp6l4y/iZtlsEnVN4pRWDQqPYmA+7FH59s05WByR7qdPmnaiTw9Z9fzH75WscTBVxS9pnvFgMya357Cy5pmoinOqIWhGq5f2VZQusgxvlbXyujEspaHER+SFT60UK1B18FadIuS+NMHWrVZv3YqIqN6eiQH4mZiagfKHLpQ6E1jzJYBjm/8p5Fdc9hbMD6qMk+sqNmID4dU2LBr1dNAuZerooqmUiN5iYub20GnXYoSq4G3k9R1I7HjC2dEpyi44CKRQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DS0PR12MB8785.namprd12.prod.outlook.com (2603:10b6:8:14c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 04:23:05 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 04:23:05 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, John Hubbard
 <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
CC: "lossin@kernel.org" <lossin@kernel.org>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "mripard@kernel.org" <mripard@kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>, Joel
 Fernandes <joelagnelf@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>
Subject: Re: [PATCH v2 08/10] nova-core: falcon: Add support to check if
 RISC-V is active
Thread-Topic: [PATCH v2 08/10] nova-core: falcon: Add support to check if
 RISC-V is active
Thread-Index: AQHcK7RuFuxZ8CZ67ESqg+gi8zK57bSfkmOAgABjBACAADazgA==
Date: Tue, 23 Sep 2025 04:23:05 +0000
Message-ID: <80d69f5f58431f82f806599c620d31bd704b5b5d.camel@nvidia.com>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-9-apopple@nvidia.com>
 <38bbcbbb7bdf88f3a06ed9925d4fa058d6352d51.camel@nvidia.com>
 <be96c39c-4ac5-4a4c-b5fc-6b1c1026db30@nvidia.com>
In-Reply-To: <be96c39c-4ac5-4a4c-b5fc-6b1c1026db30@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DS0PR12MB8785:EE_
x-ms-office365-filtering-correlation-id: c43c858a-5f62-4a66-c886-08ddfa58e4b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?M3hlQzVNM0ZhVEFqb3JCOUw2ZklhanVVeWZINEp1aG5DY3psNDhwNCtlVnoy?=
 =?utf-8?B?eU51UEdOQWtwMHBWT2JJaUR6VlVmSXViek8wNEl5VFZQSFQ4YXJSRXNQaXBQ?=
 =?utf-8?B?V1ErRTZ4TWVxbndkc2Flek9IdjQzUkYxdHdLWlg1SDRBUHVBeUN6U1loVUhH?=
 =?utf-8?B?aE1TV3hJQUdSUllYZXNHMS9TdnpSYjNPTGgyWTdPUGh4MFNvY3hxVU9ick1W?=
 =?utf-8?B?enNhNVFQY3VEeWU2YWVlV0dvTDVIaEh2RlFuU0U4SUFvUFo1SFVLTG9KaWNI?=
 =?utf-8?B?TzJuNng4SkdzS0t1d3VTaGV5OWVDQm5ZYkVDWWd1R1lYd3psUTNuUzdhcFEw?=
 =?utf-8?B?OHBSekFHOE1PZ1lVcmRtZ21rSDUyaTVXWFVHdldDd0lPRERSSGRHVUNzelo2?=
 =?utf-8?B?bWdhVm1UdG5rMC93Q1dmUWE5YkVwQk1RZ2pYeUw0ZEN1bHBRT1Z4cVhNUDEz?=
 =?utf-8?B?ck5McFowZmJMSC9mYkM4bHZyMEdjUGUxYVVOVmpEL01oQS9tOGs2cE1BOEFF?=
 =?utf-8?B?bmZzc3NqOWFOa2pKTFNPeDYxQ09VclJQUFFMTi92dUN5MlBWQWdIK3h6VExs?=
 =?utf-8?B?S1dZb0lGWDE2ZHovc2lzZk1VZDlCL0NOSW82SlBISTJoN0NGa2RxTnB6d1BN?=
 =?utf-8?B?a0tkRitvS3ZwV0RvdFpYNFBpbEhXWlU1QnNQN1drOFEyT1pITURkR0dYdm1O?=
 =?utf-8?B?M1YyL3lzNTFKNFo2UGtWN0ZWdktEL0taWTFNcWFBa1dYSFRXMTIzMVo4Z2dr?=
 =?utf-8?B?RHIwdHFwZ3NmZm5yOXRWN2c4a3RudVBmMlRWN0Z1TXZTbllIZURvTU5VRTQ3?=
 =?utf-8?B?cGpib21MZXZXcEJZd1pnQjdUdWtIZHorNmdwdmJXdXc3Wi80ZzZ5SE16UUhR?=
 =?utf-8?B?aTE5bE5BRTY1aFE3M24rMTRzUU9jVk1NK2N6NE1nQXplSnJEazRYR1hqSWJ0?=
 =?utf-8?B?SE8xSjZSYUhrSndVZng5YVNhSXp3d3dxTlRPVGwyaUJ4Y29jVXAwWFFHS05S?=
 =?utf-8?B?Y29nbWRtZEJudUJUdkplUU4yd1NrUjZYVmZua3dZNGZGRittOW1HSU8vQ0pK?=
 =?utf-8?B?K1BhR25hbjQrMVNDNHR2cmw5VnJOV1o5b3dSRnN2L0kyUmNRQkFmWEF0Mk5O?=
 =?utf-8?B?T2h5TU11Nk1RcXRCY3k0VkJlMXhoTHdabGxCTjY1cDdoV0xFWFhZTzJyckpz?=
 =?utf-8?B?cFNmZmg3bGFTWUMxbTNrak80d1l1TDV3dCttTnpDZ1pDRVBvT0ZVbUllRXpE?=
 =?utf-8?B?Q0VnSmFLb3YyaG0xNlZlYndZOEVmaENWQVB2MEF3ZXNuM0tpYTRxek9TTkFK?=
 =?utf-8?B?Vm96NVV0MS9ZT3owakZMQ1lkT1QxYnFobnZWWXpDU1VmeEhJUjB6aGFXbFJp?=
 =?utf-8?B?SnYxNGxkRDBEclVmSnZrVUpRRU40NlZOcnBTNzlQQ3FWQ0pGRWd2TElRMjFN?=
 =?utf-8?B?YmpMRXVIQ3h0RlpqaWRVUzRBM1g1aEtGUDRxclRFWGw4dzFoeW0zNXpQMzVo?=
 =?utf-8?B?dlljdXFzYlRPa05zaGVvVmhSNFd2ZEVqanlXemJyVVd1U2lDbWxnS2VFWDNU?=
 =?utf-8?B?ZHVvVDBFQlpoRFB6akxQaCtOK0t6L1IwWHNiVSswbEdpSWtGdTVvRWtFckNn?=
 =?utf-8?B?WGtsR29ETU4rSkNJYkVvZGVjOU9XbWhaMXptQkg5dWIvS0lXZ2RTb1lVQ2h0?=
 =?utf-8?B?NktXWmxaa1dDWlVZVkwzcXg4T0QvdVNGR3RRa0VtMEk2dzY3VEl6WDgvQ2NM?=
 =?utf-8?B?MzMxY2FLVWtBTWJEMFpVUnNsSUtKL3FJdjVhb3k5UkJzcFE3eUxrRjBKWjF2?=
 =?utf-8?B?MG5mRjd1WDluTitreEJXUDVHOUgySGtOd2dzSnphdjY4ZGlUK0NWZmZjb1k0?=
 =?utf-8?B?enVMWlhJOXhxd1V0S0RVNkZOaDd5SHFHbEFzMms0TTcyQU95UWRBL1lDTXl4?=
 =?utf-8?B?V09ZRUFva0tQdGlNVkNaNUxOMUFCYlZYSmVzVG5ud2VmeHRLTTdhRG94Y3lV?=
 =?utf-8?Q?bsjMZ3I0G9plk5g7L/LHWWpSQE5LYA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVhSd3I3bUhIajZxeVZISVpIaDZUd05ONlM3R3RpQ3ZRZG1GcG03QzlMSlo0?=
 =?utf-8?B?TWx2Y2Z2cGhOUXB1QXhQTDZZcUNPU2lMOFN5QTk0SnY1T0ZVNm9mNk9oQ0JS?=
 =?utf-8?B?VzZ5bmh6UDI1QmFnbU15SklmeEJubEhFTFNaY3hGS1NEbkh2dkZOWkpqL1dn?=
 =?utf-8?B?SmtoT3BUeUc1Y3N6bmNFTVVINlM0TjYyNzRFOGpkNnpFcklrZVAxanJlRVUy?=
 =?utf-8?B?WmszcTNQZVZiV3kyWEhhQ244U1ZxRGgyV3YzT2xpUFdKckFlUGtLMGVIU0gz?=
 =?utf-8?B?WFNDLzBDQnJxb1NNMy9aMU9pL2FpYWpuQXd0UC80d3dEQ3BnNDhyMWp6cnIw?=
 =?utf-8?B?MmZFZ0g0bWxOSC9yaHUzT1BSRktoRUdxL2dZSURjOTFJaVh6eFZ4RlZlMnFH?=
 =?utf-8?B?ZlA2aWpHWmVWZHZCQW1XZmpMVGtJODM1Yzk3aXVGSlNrdlhWd2M4MUdNU3Ar?=
 =?utf-8?B?RjcwYWJ6QTdrVWFZU21lSkk3OXB0cGU2UzR1eWhYWlJ2UXduNjFKbTRDOUN4?=
 =?utf-8?B?bjFXMTlpN1lTQU04b29JS2tHUGVoK1UxMzhveExQSkZHTVRlSFI4cCtxS1JL?=
 =?utf-8?B?Y1dmc1Q0b1JyRnc4eGxET0pya1VnUisxcFlXZGFzZkprajgyMlVuQTVEbE1W?=
 =?utf-8?B?WXZqaklBZFlPNVR0akNqWXhOcmhqcXRiU2ltQ0ErTzBoSVpLZWpRdnNFcTda?=
 =?utf-8?B?OHNYdFRneUxsSGJUMXVaYWN3Z0lINU52SkFTMFR6K2p2dklJVEdLbklLNHF5?=
 =?utf-8?B?SHV2OWdIdU83Um9BQXRVSlNrWk4va2ZERXcrbUVkSnEzMUdmTXJnbkRtS1hE?=
 =?utf-8?B?R0N2Q1V3SnZteTZsS2F2VTNvZGFiZld0MHRkTTkzWFY1R2JRa1A5bWxDeWZ2?=
 =?utf-8?B?NmsvZGJ6bzlYRU9MUHRnZnF5NXJYQzZJQnhkUzV4N0liL1dGV3dnSU84V2xr?=
 =?utf-8?B?Nm5zRnllQUZtTGVhNFBxdzU4VWMwbjJEbXE0eW40dDkxQUduWE1QWEhlb252?=
 =?utf-8?B?d01COGlZVmVhdkIzTGVMTlBjVUlwWGZhQUVaSTBodHgrQmMrdTI3SUMvMnhl?=
 =?utf-8?B?M1A5MjhZd1BYdk1EWUdFNVBtQlZ0Q2ZXRFRTclpYMHRQNHRnR1dmUDBFT1Fq?=
 =?utf-8?B?dkRXZ0pUVmZhYnJWTktwY2VIQUcvWW9PUDZ3VHUxMWpPRm9WZlE5MGxobENC?=
 =?utf-8?B?Tk00SmVpT05QY1VMcTVJSnVQNzM0dGhhUnRyaEk3OHlESjJwd0RCZUxNOUxT?=
 =?utf-8?B?eUZlaGNRTkZWWVZQVExrdEtQZjM3THF6VXZlYXFtWkoyaitCaVpWOGcvU1NO?=
 =?utf-8?B?L0YzVmVVY1dtbGlaRFhLSktyTytDTE12M2I2bnNJOUFBMnhTLzN0WVpOem50?=
 =?utf-8?B?eHMyTEFxQVFSUXhValBKZ3Z1b3R6d0ZIWENzUTUvRFVLNG9hbWM4VHg1Ulo0?=
 =?utf-8?B?ai9nekc2ckZtZmlldjJNSVR2QVV5T3BTTVIzRXFpb2JBK1V1VTM1eHBPdEdn?=
 =?utf-8?B?am8yZStWcytMNDA3QXEyWDVUVlNwSDc5TWM0TG9wSVByd2RBUWV0R1EvTTFU?=
 =?utf-8?B?eGdJRDR3MTRRTmJLZXg4RHZtMk5aWk9NQ0hXNlpzOXRFaDIwOWViaEx0RTd2?=
 =?utf-8?B?NGpTbnVQakJmbjgwb25TNU5lS3MxR1FLMHNRc1M3MFRsWFE1TXVhd25SWW03?=
 =?utf-8?B?SHpqMFljSWR1dlRZT24wMzNYVTlQTC9VQXVRTDcyazFyZlpOZTgzOHJFTWZN?=
 =?utf-8?B?Vlhqbm5WTTRwY0N2aVJvT0hEQ2J0cUdlTHBmbmNaTmJUQkZzY1BYc0hSTUpT?=
 =?utf-8?B?SzMvVkpYZEU5MmRBbEVTT2MvRnF6c0VxTmw1dUxwenZhL0oxa2ovV3RyWEFt?=
 =?utf-8?B?TXZlaWI3Und2d1BkY2NxR3NTd3FTL1BGSmRWM2ZPYTlwbk5BTU95VlpTMG5D?=
 =?utf-8?B?YnBIUWlRSHpocFNaNkxtK1dTTWdndFdkMExKL3lZU1F2aS9vbXQwRngvcnFj?=
 =?utf-8?B?YkpZYnNHdmE0YThHQkkyb2kvVWJ5RlBkWnBzVlZ2N2tEeXZCcTZvZi90bndL?=
 =?utf-8?B?R0dVenJrL3FTalFPVERlUTJ5QnFvdHJNS1hwdThPRlcwWmRueVpLNkRjVXZE?=
 =?utf-8?Q?66Z+jPQTLydJVWWS2fAwjR9II?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F5E7028CC5E3345A9F514E1DAD1A535@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c43c858a-5f62-4a66-c886-08ddfa58e4b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 04:23:05.6881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OSyBqbQQXB2gceS0AvFxWeJOmSOLKzsXaGN1uod56isIuHIqDXMP0NbjwXao/1J6zbJ5Tr9lJbwdWe3PHub0XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8785
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

T24gTW9uLCAyMDI1LTA5LTIyIGF0IDE4OjA3IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IEluIHRoZSBzcGlyaXQgb2YgdGhlIGN1cnJlbnQgInNvdWwiIG9mIHBhdGNoc2V0cywgd2hpY2gg
aXMgImdldA0KPiBHUFUgZmlybXdhcmUgcnVubmluZyBvbiBBbXBlcmUvQWRhIiksIEkgdGhpbmsg
bGV0J3MgZGVmZXIgdGhlIEhBTHMNCj4gdW50aWwgdGhlIGZpcnN0IHBhdGNoc2V0IHRoYXQgbmVl
ZHMgdGhlbS4NCg0KRmFpciBlbm91Z2gsIGJ1dCBtYXliZSB0aGlzIHBhdGNoc2V0IHNob3VsZCBt
YWtlIGl0IGNsZWFyIHRoYXQgaXQgdXNlcyBBbXBlcmUtc3BlY2lmaWMNCnJlZ2lzdGVycz8gIEFs
bCBvZiB0aGUgcGF0Y2hlcyBoYXZlIGRlc2NyaXB0aW9ucyB0aGF0IGltcGx5IHRoYXQgdGhleSBz
dXBwb3J0IGFsbCBHU1AtY2FwYWJsZQ0KR1BVcy4NCg==
