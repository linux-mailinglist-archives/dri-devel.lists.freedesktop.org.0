Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31225CADF21
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 18:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8A010E09E;
	Mon,  8 Dec 2025 17:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CbCpJZlt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013042.outbound.protection.outlook.com
 [40.93.201.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9825D10E00F;
 Mon,  8 Dec 2025 17:55:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKTKqMah+Hx/hXsu+BmB1PqNKfl9yL4NypxPtKvzIUn03iJaHQ77XUEWwtPkA8WtAVynHMPU+ydkyJVGNfJul4DmPivzgo2wEdKRAEOERN+qq4hzbgGKsV2VcLilNWkJGhEFyaCFL4inNNOdQMT+vatBMBF1PT6TyO8o3NPBqIgnCNjwZy6y5sZagVFFxkGDBk8BnOP1avJ74mDn0+LNo3UgHnlL2PBd4P3ZLewjMIGew8MzDQQfK4GfMcPoZKWI6djGRSdN/+ig3GhN1Nyjd9XlnRqRXfdwUKAfyVtESedbc0GYUEdvAn5uruEjfJwUsZ26ImXyHTy15Dg1Kkzhwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+o4/abznZRjHSQT9KLD+2JqBla9ZsIzTvhAQ31p/gQ=;
 b=G284AzhHFol9699I5ndVLLPJcttt5YMkUTitDmEemcYBFv+62W8QrjnH9f0fChg6kIUUUIa6nekKRrsw8ELZIJ+1HMc910qsUiiV/OJEixRvnxu4aLy8jnfa/AL+3QyLpEakQ83jf5vyJFIzAUZiw7EBkPheoQhp4aGxl/DvZBcKV73UXEAz9IFcv6bpELTkutzZdjepxyD+T6dBUYDWKfXlP7j+jxt1IEGu7E12qekEjip/MmZ/fx54B9CYDCV/q+73AZXpzMUq4TH11bRPMbQgjLMUHtqKxe3jVD0RTZpf+fvJYWy2lkyvMNzV8cTyYez3RY1v84V8MHzDMOeZnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+o4/abznZRjHSQT9KLD+2JqBla9ZsIzTvhAQ31p/gQ=;
 b=CbCpJZlt5Vuc031x5Mio75zgzkUYX+5QAfLJI52hXZ8+wx+TLSW/qeW3gKxh7O9fpi05pg3Yc6EkMYHNFtzcdCa3sGs6YvZQRnqy6cFvwJjuAQBoP8uN2s7JN8yEDQy5KOP1j0K2+TmritX+fZ7JESZdvbtovl9aqmFeP0Yox+94R+RktQ0lw4SqDhh25ZAXltge/ZUWfiWYAvY+c2XmFnn/fsohsZ9c2I8gdv7C1f6/TbeONZQDMYo/e42mh9+0YX8RKUTd/Zl08u2A22t3fBCs9VdZz6xfBVdFzRMpMIVTCBXDMVHdQzf/5f66skDoXl3vzLZBSpowQTmY8m+m1g==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by SJ0PR12MB6687.namprd12.prod.outlook.com (2603:10b6:a03:47a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 17:55:17 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 17:55:17 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "airlied@gmail.com" <airlied@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>, Joel
 Fernandes <joelagnelf@nvidia.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 7/9] gpu: nova-core: firmware: fwsec: do not require bound
 device when unneeded
Thread-Topic: [PATCH 7/9] gpu: nova-core: firmware: fwsec: do not require
 bound device when unneeded
Thread-Index: AQHcaCTjMdk6RduOCU+8MVUXcvlSA7UX7C4AgAAJYQCAABHFAA==
Date: Mon, 8 Dec 2025 17:55:17 +0000
Message-ID: <2c383dec07d33a58d4fbcf1c99013a59ce488b4d.camel@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
 <20251208-nova-misc-v1-7-a3ce01376169@nvidia.com>
 <6da7ff0ff31c1f4250b8d6cd1b535bd69322d0c9.camel@nvidia.com>
 <835a223c-e738-4804-b7db-2b24ad37410b@nvidia.com>
In-Reply-To: <835a223c-e738-4804-b7db-2b24ad37410b@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|SJ0PR12MB6687:EE_
x-ms-office365-filtering-correlation-id: f31669fb-2b04-434c-b7cb-08de3682f270
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Z2FuQ1dGRVliVFRETCt6eHdYR3R1YWJ2R3hTRUJUd0lOQTFYODVsd1pkU1F1?=
 =?utf-8?B?UGpPQzlhTDQ1bnhraDJnZHJ2S1FkRE42UXJRNG9aQURKMkZzSTRaS0o0OGM5?=
 =?utf-8?B?UUxldlBwaGZnVTNLbFdVc25DMU9qcmwyYW5FMFZZbE5UTzN2a0dvek5lcTFs?=
 =?utf-8?B?V3NQekRwQkJzek4zbFdad3JRVWovUk4yMUc0MTFZbXUvTTdHd3prUmlLVUo4?=
 =?utf-8?B?NEZKZEw3ampmNTdZSjVHSmRUc1dHSGVjYTdtV05JZldnV1ZmTmdpbkl4Ynhu?=
 =?utf-8?B?NlVOY2Y0b0RLcXlvV0V2VjNJdHVDd2J5czRqT2RmOExkdlpkdGV3YTlLY2t5?=
 =?utf-8?B?TlVhZFJwTUVzeEJ1QW0vY1pzL3VJSFo5K0JjUUc3dSs3Y0NxL1prU0pTaHQy?=
 =?utf-8?B?WU9aR016Unl4UnorZmFGQVd1Ykg5bFI2TWhObTNvOGF1QS9KVXFjMC9wZmNt?=
 =?utf-8?B?NU9OYmh6RGN2czE3bDZjV0NKS0tDNmovci9tV3IzQ3M1VEIzc05tY2tYbGRu?=
 =?utf-8?B?R2plalBUSDlvR1JBTkxuMlU3bzlJczkxYW1CUXhUS3RZWXE0RU9MRXFxb0xO?=
 =?utf-8?B?b0NCM1AyZGRsM3N2RHVOS05RdDZpaFFzNWNQMHRjYld3MmhMWHA1SEc1MGMv?=
 =?utf-8?B?anNvSnVzVG1WY3NRS2xJYTJReTJpRTQ2Vkxib3FIWktwOU44b01lcmMzVk1V?=
 =?utf-8?B?MlpCdk1BVXNzd3BERFp4OWtWOHQvM3RicDloRWE0MjA1SklGYTY4NWYwK2Fj?=
 =?utf-8?B?ZzJWcHRHSnp1R0xqWW12bExpYlVCVTRqakN0ODBZSWFMVnFNa0dkQXBIN0g0?=
 =?utf-8?B?cU1SSXFEN0txcVpIbllmb2hoYXBiNmc0Y2daWkt1WGdOMFg2cGVHMDV6MGNH?=
 =?utf-8?B?ZGFUTUlsbC9FVTBlYVFRcVYwcmZXbUsycjJ0NC9hcGNmbUVEVEE4TnZLNjYv?=
 =?utf-8?B?cGhtZVVOZGxWa1pXdGw3WGFuRHdZZnRTS1hVTjlxeXRnYnZoUXlpVExGcEE3?=
 =?utf-8?B?RDNUamMrazlKQzhjVmpvOUx1R2FXQU96NVVNOExiNUNYc1JzTkVUejU0eEFh?=
 =?utf-8?B?OFVuTXEyckR6VmFYOE9Jb3BBbEg0UXpLN3Z1dUF6cGxmMG5OaXJ1Nkx3YklT?=
 =?utf-8?B?SVZWVG1tNVozVjJrcDdHLzFQVUJFRHJoYVZYOXJzZDVsRWNRek42L1RTd3Z6?=
 =?utf-8?B?N2VuRmJvaFpNK1lWYm9aRS9ib3Nyb0h0TTJuMGZ2a1o0bE93cHVGRFpsOE8v?=
 =?utf-8?B?bmxIRGFHNXg1eDg3UEY0RGM0Vjc1WDJTY0ZWN0J0djlGS2ZLMGNheXhHL2xy?=
 =?utf-8?B?U2REUFB1SmxoRTZ4dkh2Ri9FK3ppTGVGREVEaVhCd2xlRE8rQm4wN3ZoTGND?=
 =?utf-8?B?Y2tYZVJtR29YcHZ4L2hmL3ZKMjY5WExLS3hjMVhRYXEzL0dtMU43K001dks1?=
 =?utf-8?B?WEZ2TnE4bldJZ2JMOGlMRmZoVkVnUXkrVTIrUkkwVjMyUk1hRnVYQnRSQWo4?=
 =?utf-8?B?S2Njam9JQW02L3p4YmpFWTNxRHNWUGVKSllVUkF3cXY2NWJ1SitleFZuU01k?=
 =?utf-8?B?QTJuUVYxQ2ZzWDNSY242dk12L29pNW5SMmxrbStXdm4zL3paS0tFZXNxZ0pn?=
 =?utf-8?B?aDJieFFtRlFFN1dKSG5QYi85V0IzbGtBVjl5bDV3Z3ROc3V2Q1VUVS9HWEVV?=
 =?utf-8?B?TGxIbWhtbXVmOWxCWVJ5TE5QeDFWVDFaVFlYR2xVOHorL2E2SmUvTE53Tk9r?=
 =?utf-8?B?WU00NVgzaHR3Mk1UaUVsRG12a0pzdHFFNFFsYnN6M2RwZzRxZEc4NTFDci9B?=
 =?utf-8?B?V0g3T1dDMzUvZWRCZnN6Sm1MSDZ1MTVFRW1zb2NMbTdIM2pTK1dmbnl5T3Ft?=
 =?utf-8?B?bEs3UUxYQklMT3hGUTh1WmlEZkpYT3NBZWk5cmVORmNkQ0svTDVBSTBIZWZW?=
 =?utf-8?B?V3BpZDlORENQaW1kYnFUbFJ3cEpLMDdtZGVmS3pyaDQ3MVlhc3g3T0o1U0Vv?=
 =?utf-8?B?UFp1cDNTRnV1YVJSekkxdWJMRmVrQzhmT24rZzk2eGNlTVdOR0w0c0tLU2NY?=
 =?utf-8?Q?Ys7ss9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3pvTWZTS2lrRW5ULy9zc0hWUnZSSXhRcVNIZFNoWjFJWTU2WVVUWEl3K1cy?=
 =?utf-8?B?ejcvV090T2x2Wm5FRmdtNDAzNWhnWk1mOC9yVjBaWDJoV0l5RzRFdjh4cEVu?=
 =?utf-8?B?SWlGK29qd0xNZHpkUExMYU8xbWRjbTRoVzNtemdsWWpPY0RKL3E3aFdxdEE0?=
 =?utf-8?B?VHZqQVpjVlExTnpxZ2oxUWJRbUd1TDZSdWZpT29WSFVqWUZXL1E1Q1JiemZK?=
 =?utf-8?B?L0MyQ2svejRZQ0MxSWNZRzVTSlJHNHJiVUtWaHpPR0pFUFVrNmU2eFdUTjd4?=
 =?utf-8?B?NXZWQ3NtK2JkcXZFcUtsVHVYNkJ1T2pSdDRKMnAvV0FLcWxYZkkwdnFwbjNH?=
 =?utf-8?B?UmYyNEp1YldUM0FUZi9KQTZsbFBvcG1UVTRGMWZZSnIwVHNiYU5lUTcyL0N5?=
 =?utf-8?B?S3JWRHZBdkZuOHdmYnV6WmgxdTV6NFA4YWxzOUVTTDc0WStQazh2aGNIVlRQ?=
 =?utf-8?B?dU41MUxrdUdld1UwdWZTM251cTFUSHRiQWRZbTVmdFNNbE1SS2ZsR1JqSE5z?=
 =?utf-8?B?NVM0VDdxaC9hZ0RGNWkwTnlyYmZEZzd5V1ErN3N3Q1ZiU0FjVWZsZ0VYckEy?=
 =?utf-8?B?WjVTNVdVVXR3R2YzVnZXcFpmWm5SR3ZZd1FOa0JIR3hFbzQ0OWVwTDUyelQv?=
 =?utf-8?B?WVdMbEpYajRha3owZ25mWEhNTDZLeHIwc0lXL1E1VktNeWZxbFA0d29ZRUQ1?=
 =?utf-8?B?Z2t0YjlCV0FpVHV3REQvRUhuZStSUXVteWFkMUZpYUtycFA5YWlrdUZtZE84?=
 =?utf-8?B?UnhqMTh2bTlkeTAwelllNGNDZjZZcDZJU0ZVelFnTHlNTEhiMXJ6RnRkWlF2?=
 =?utf-8?B?SXBYanYzeDg0bTgzUnZIV01lRmlreUUzRlY0WExJQytEYjBuKzJPSlNIbUtL?=
 =?utf-8?B?bGxNQ251RVdtMXEzUEEzdDQ0WlY2Qjg0d3lTOW9xU3ZmSEJESG0renBpdEJa?=
 =?utf-8?B?U2U5dHlreGxsMlBLc1VSYngwc2tHYm43cXJJOVhiRWo2RWtWNXhWUjcwYnNn?=
 =?utf-8?B?T0ZaWk5kS3BKZDZEeWhOangzMmo3WVZLY2ZrQ0FGS1lOMXlTSUJiK0oveEwr?=
 =?utf-8?B?NXBwMnpLWjVVQkg4MEltdFVCNDkzRStJaGZMWGlGNVNubDVvdXNxNkIwLzM0?=
 =?utf-8?B?WDZXd25MTlFNdW94bC9jY2lxNHI3a3N0WWoxQmRUV2NIaW8vU1pLcjZhVTJp?=
 =?utf-8?B?eFBGSmRRUzZCZ0MxZ0VFK052ZUtyR01Ka3U1M2RrcnZnclFBUmZiajhrazBB?=
 =?utf-8?B?a3hENlpXbE53ZzZLc2hPOFJxRFROT21seGJEVVE4K1VYRzQ0endwTERXNWtE?=
 =?utf-8?B?aHQ0aDBiMkNJUG5DMEZ3ZXlQMUhORWR3ZWQ5Nk5xOG42OXZWc2E5T2ZSSTU2?=
 =?utf-8?B?MktzbTJsNnJDbTRRdG9ISHEvZlJUNElkMmp4WWhqOXJwUFU3eHdDMDV6ZnNJ?=
 =?utf-8?B?YWxpNjBTMmozMDNtQ1NSdmNzclpIRjAxd1pDV29zQ1B3dEVmaFVEQXp1ck9Y?=
 =?utf-8?B?UFZFMStWV29rbzMxcnRhUUZYVUIzb3dub0NVUEw2cEVVZEJldnp1MzhnY2k3?=
 =?utf-8?B?Sm91UUdidGxDUE5zam9RUHk4em1qL2RiV3IwQnFzM04wcDZBQ3Ara2RSNEcr?=
 =?utf-8?B?YkdzUy9IR3hmdnlGNE1DQlBJVHlrM1BjZUR0RTNOMFlxelFybjcyUzV4Y2xF?=
 =?utf-8?B?a2taVEk3RURubmlYUm1lK0FlcFM3Ukg4RDV4L0p6dEtjZ0U4UnBRSnpXdXBE?=
 =?utf-8?B?dXd1Y01jdklzWXlHVDZmeUkyRlF1Zk05TUp4OWEwZk1MbjY4Njh0OGMrdVBt?=
 =?utf-8?B?V2tvZHZIR2REdFMxdTlrNmtVSW5kL3RQMlNKR2JQc0lUSlpMVnFkekhralBC?=
 =?utf-8?B?Y2J2TDFpaXBkeUtwTFRUNGpqUlpwcmlSMWkwZ1duamMzZ1NnRnBUWWhGVjhN?=
 =?utf-8?B?NkpuNGxqdzJjNHJ1YWUyT3NzWXRNWi84aGxxdUhuMW9seFlNZnh6cWNhcHdN?=
 =?utf-8?B?WmMwUU05dTRTSGlKZ0FWMmJxeEF5TjIwS1JaaklZd01sdnBJUHVBQ1dCM2tz?=
 =?utf-8?B?QWl0QUNmODhKOG95SnRia0llRE5qc2IxcjBVcE4yT1BRTEQ2RlhVc3ZOMm5F?=
 =?utf-8?Q?ZIh5TU4ZoKWikRS9ol5gtC1Pu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3931ADD6F15494ABD64D53F74C484DA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f31669fb-2b04-434c-b7cb-08de3682f270
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 17:55:17.4131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g2AAOxVwIdRmcwwg9rcR6xEe464xLxS4KqNUQ93wX7vCwdeAC81c5FONmJ2qNEpAZvAosbxVlOX3KW2mEaWIvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6687
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

T24gTW9uLCAyMDI1LTEyLTA4IGF0IDA4OjUxIC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IEl0IGlzIGEgbGl0dGxlIGp1bXB5LCBhcyB5b3UgY2FuIHNlZSBhYm92ZSwgYnV0IGl0IGRvZXMg
aGF2ZQ0KPiB0aGUgbmljZSBwcm9wZXJ0eSBvZiBhdm9pZGluZyBmb3JtYXR0aW5nIGRpc2N1c3Np
b25zLCANCg0KQXBwYXJlbnRseSBub3QuDQoNCj4gc2luY2UNCj4gdGhlcmUgaXMgb25seSBvbmUg
d2F5IGZvciB0aGluZ3MgdG8gZW5kIHVwLg0KDQpUaGF0J3Mgbm90IG15IG9ic2VydmF0aW9uLiAg
TGlrZSBJIHNhaWQsIGl0IGFwcGVhcnMgdG8gb3NjaWxsYXRlLg0K
