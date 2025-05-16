Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 567EDABA4BF
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 22:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F08A10EB64;
	Fri, 16 May 2025 20:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RSMpx59b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B477210EB64;
 Fri, 16 May 2025 20:38:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPYDHfYWY3mKXsbPv6VMJxgQYt8NOh/XxI0PZOMky549EVlGGOMahYSeYx0KgCmY9rypdd4FfXLPJVOO47wT3+AqaeAybFW9Zd5WgP53RLK/Xd1xujKjCCS4qS9xQWUakyg4cqW0jnnLQfOVwRLlsWzjTz/91YM2Mo9NPKMky+wvhEDOoZpdthbZI7LznNfrPvN6OzzcsJ5mjEd+ZZmqBkD/dX7SdFcDw/JCvhtOxwZWENubeOdHjPLEwsJuWXx9cpz30xC/NJZ+MZ2I7kt0soWX1/0yBmV0d23YSpUp46aE9rp1Vv5C4+vfga16e7aFi1j507k6mmVBQjnmjaxgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAuMk7xx3hyTHU68wou1d77o7QSmJO4Z2/V9Ryktf2c=;
 b=N6+z5JSQYycXDFzaW/4NqfJp4/3xS1YmWf8IWSzxKbHT2ImKdkHEHC/KVMW7d16614giDmuRKC3rm9i70r0+9EMUJ4Vnx8flnW/zI/wqLvy9TriWJc8An61FE68f1DuqzCNTFwKEnPuhW+U8U6jX3DSFZFTg8kz7VzgK00fjhgtTw2ZxZAQwvnUU9UcxmmKOLeFDXxmoY2XPaqPnGzTdcWBD6L8L1dvSnqzg0dq580fVdcq2YjY2ElA3B75nkn9ps5UOUW8K+e09LpqcnanR2yljtpQ27j/e3CI07GLZTZHKOR17aGJTyctDbYWTNH+rb7p5DuN0Qs9G5oIB9TriRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAuMk7xx3hyTHU68wou1d77o7QSmJO4Z2/V9Ryktf2c=;
 b=RSMpx59b+CeTGiynQem3WlkRrAQDFaQyVcgQEuEkUFYWtl3AW7VPOvAkGmCb1QySBQMzVpjzm9HHQ2cP1oQRZ9kAUQCM8zOvaDZ0dpXAP/uqf3Us3F8TOFMW9gkc5cm4X4tIooUzhn0OjRu7p5DLtvNKNt5FyuopFXP7CTd0qO1uRWASAgaLXLO5CxrxknX+HxSjDba9m+F8smNmjALztCChEeYUQc/2pFBJvM+jKrsJNYVwPtsLkd6nI+/UB5qykXg6GLGGnAr77Sqt5l2R659i1YYVMVZUswR5rzERG2lvD8tMFD/7NZB5y4riEfFaV6O0ZD2vlCRfdUCZoSodWQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by IA0PR12MB8207.namprd12.prod.outlook.com (2603:10b6:208:401::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 20:38:12 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 20:38:12 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>, "a.hindborg@kernel.org"
 <a.hindborg@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "corbet@lwn.net" <corbet@lwn.net>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "benno.lossin@proton.me" <benno.lossin@proton.me>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Alexandre Courbot
 <acourbot@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>
CC: Shirish Baskaran <sbaskaran@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH v3 16/19] nova-core: Add support for VBIOS ucode
 extraction for boot
Thread-Topic: [PATCH v3 16/19] nova-core: Add support for VBIOS ucode
 extraction for boot
Thread-Index: AQHbv1d4kNTQJm76CEihluB9C1YU07PVxjGA
Date: Fri, 16 May 2025 20:38:12 +0000
Message-ID: <3a32db1ee57f26ed59a69c9aa53f1cfff6f29176.camel@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com>
In-Reply-To: <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|IA0PR12MB8207:EE_
x-ms-office365-filtering-correlation-id: c89122fa-d47f-440a-699d-08dd94b993a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?bFRnN0daZENYbi9lOTRrUWVZeHBlaVBnRE85V3hpUTc3YnFjV1hZbWZwYXRP?=
 =?utf-8?B?bFlpY2srNDhLanFZa2ptV2dmOW5aWGl6Wnl3REx3WWtFcmxtamVpOG1Fa1NQ?=
 =?utf-8?B?dmQ0TGNLajhRcUp6THFEYlhoalpSRXo3MjBaNkUyTFVCbUIvU1Z2dWNTQUlM?=
 =?utf-8?B?b2RWUW5YblZTZ1RVenNWZFVjR3dOQUFLUFpwUi9lMXo4ZUV0OHVBWGVoUjRp?=
 =?utf-8?B?YllyRzFSY0tBYlpyRkRCWm9WM1J0UEYwVEUvT3ZkSFhKZlE3ajB5OEtIZndN?=
 =?utf-8?B?Y3R0WUJBWkg4TmcrWlZsYS9pbUxqaGxPUkJQRGZUMmRYNThUZTQweXRoVzJR?=
 =?utf-8?B?MmpQT0RhSW1SVTlhZzlFaDFLRnNrekhFL0ZjZnVaSEpxZ1FUUURjNmFpdnBu?=
 =?utf-8?B?bVV5RC84MWR5dC9YQkJ2aG04ZmFncU9zRmtZaFRrWXhXZ1VEb0FuTTlJZ0Rn?=
 =?utf-8?B?UmJPQUc2bncxTUp0ZGNOMnBydVNiQU9ReDFRb1JzQXR5Q2Uvck9VSlc5emda?=
 =?utf-8?B?SFZidHRCYkprUk1FdTBnamZuWG1GNm9PQnpDREdEMVRDcnF4Q0JiSFNyUTBu?=
 =?utf-8?B?c3NvOEZIaEEzUEpDNzAwUXl5am1sTlNzR0FIeS9jNUsxbGlRYksrbStISkxN?=
 =?utf-8?B?RVNFb2tvZUx3TEZyT20zeUViMkVBNWFHKzZUeENoUU9POHFPWkRnNHRhWXZo?=
 =?utf-8?B?d29ReENGVUgxK1RkaDVEUXlyU3lCaDlINlpkcVJjVi9BNy9vT3h1L1hZSTJN?=
 =?utf-8?B?VjlWMlE3MnJvL25aMHFsT3orL2g2WnpPMy9PS2pKdFozRGR2RGlIRWwxOFc3?=
 =?utf-8?B?NXBaaE1sZkhWV2c1a0NBMVpnQktEWkFnRDlwald5OWJxRnk0aEs0cDhnZVdV?=
 =?utf-8?B?SW1CcmpZK3NjWmowcmxZY0VTNEkwVVVHbEp2YitGS29OTkFOOTVFRnBBYUVB?=
 =?utf-8?B?Y3VYc0lDb0ZEYnh4RVJ4djFNUy9GNEVUL3dGL28rbnhnZ0hIWWZqcWxWNGlC?=
 =?utf-8?B?Wmg5RGhMVGE4V2MyVGU2bVdCbXRBNHpkdzkzdDBvTW92Tm9WNVlIdllQbW1B?=
 =?utf-8?B?dk1TUEEyRjJ6a2xBSTBKWnlSOUJ4Y0RNZFovOFdxeGlGcGZQY2RDSVFiTlZK?=
 =?utf-8?B?NWQ0OWd6cUliL3BFb3lPRlZSdEl5L2dua1VKT24zSVlvUFA1UmtDNjZqVHBO?=
 =?utf-8?B?dEpQQU52aVljdXZ0NXh6SUJrVGIxRFF6VStEUjcyNU9ydzdXOFlaTWl0UUpH?=
 =?utf-8?B?QWRXR0xib2pNdyt1aXJhTWs2SG5pc2NRRWtNWVZib0prL2xsWVBnUE5PRjhB?=
 =?utf-8?B?YnFTam9UNTU1Y0lCY1p3TkJ0cVlIM05wMTlkdTZlbWxZMUNRU0ZDOGVaK1Q1?=
 =?utf-8?B?dmFjbklQU2VmL21ySmpnQWFianlHa08vSXdYYmQ1TUQ1UVZ0VEpzS1Y1WFB5?=
 =?utf-8?B?Y2QrV1o3ODBnbFJIRDRya3hQb2Jub1FEQm1zcElXNks2ZVBFcEdwVEg1RGx3?=
 =?utf-8?B?Vm5QMW1YQ0s4Sm5JL3B0T3RVZC82SUx6Q00wQzFqV1Q2YnV1N0lrT2ptdUFt?=
 =?utf-8?B?c1J6NGw0Vkx2TGNhaWl5TFNrRjhYdnR1eW5aRkpjZE1nVmhxSUdSRzBYSDVC?=
 =?utf-8?B?QWRCV1F5Q2J0RlI1V096WTJyMmlCcCtVY1pQempQYkpncnVuWEw2SFNMWVN6?=
 =?utf-8?B?SDMySnJSMXRjL041UVViTXNqa1FmWFFndU9Cbm0zM2NQYkduRDhHa3BPR1Fy?=
 =?utf-8?B?a3p6cHlTUmQ2bWRwSjcxMktSUzVBOUtJUmhUR2NJNXdPeUt1MU9Fa3BCWDhC?=
 =?utf-8?B?TzkyMGZkTXNLTyt2SVNVOHFTcnRyWko2UERRUmZMcndTNHRyS3dnQkN6WUJs?=
 =?utf-8?B?RDh6Z01OYVpmaXZveDU3SGdQY3pneTZ0MnBtNVduSTM5eUxRQkUzS2FjQTJ2?=
 =?utf-8?B?Wlg5UW0xRjVYMjNFdHJsRVhKcDVycmpwZnE5WW5PaUcvVno1KzgvQ2VEU2xE?=
 =?utf-8?Q?zBroJM3hDImy7ByFbrEtrxlEWYpt1U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFczYTFuK0h4OE1nYVorUWFyUDliaDh3M2lLYmdZZHo5OGNGay8vdVJnQkxL?=
 =?utf-8?B?d3F0VGlKZTIxYU9nQ0M4eTJBbU55SXVZaDhxekcxUHBsR2ZJTm9WRS9KNjRU?=
 =?utf-8?B?RCt5cWlFTkUyeGVHbWhnUDYzZVhIVHo4TWlQK0ZRM2oxVWJsWGkvUk9LTGVT?=
 =?utf-8?B?RGd1dFk4Q21VVmZ4bVBmWWhPc2FpaFl0QWVocGhIcjNJdDVhQzY2b3VBeitj?=
 =?utf-8?B?SjBoT0RESlcxQ25jVmcveXJ0b082azdwZmRTdFJ2bXlBM2l4Nm5XSXJtMHJo?=
 =?utf-8?B?V3RRR3BvSDZBYkxCakhwOWFwMWhKZFdYOHJsVHR3SS9YMy9DMDh1WWtFd0lt?=
 =?utf-8?B?TW1wQ0Uxd3AxaE5CREVKVjgzZU9FNEROOW9zTEJ1Y1dDa2NGRE9EbW0ydDRK?=
 =?utf-8?B?b2M5U05kZzE1clhMa2hPODdqMlBHOFFQYXFwUm1JMnZSSEhQTjk3N1JPNGtY?=
 =?utf-8?B?UURHdlc5YS82YVZXSUdkSHpuaS9LTVIwZllCS1BSeVFtQTU3Zzl0U0FBZTdo?=
 =?utf-8?B?aGFTV01TcUZORG15VDFZbW8rdHBPVkdDNzZDdy9nOGo4VzRkYlE2aERSVzRx?=
 =?utf-8?B?cEJ3ejAya2xzR0FZcVJyVTdTcVlwVmFaZklGN21GSkhBaWNsdmxCaXFqV2Fq?=
 =?utf-8?B?ZDkyeUxqZ2pHTFpUc2tFSDJuQUM2SWNIZlV2ekg4MDlTU0FUOGRVMStkcFpm?=
 =?utf-8?B?QjJWZ1lsb0hhYnV0aFJGaHV5eTdLU3hDSHp1dUVRR3BMRkxZSE9FK3RHOHI1?=
 =?utf-8?B?UFFqanFaQVhXWGM4TGI1QWdPNWJuYnFHaFBXOFNwaW1RZHI3WXB1WE1tcU9l?=
 =?utf-8?B?a2tlVE9VR21QMmw4b2IyV1poMUhJMlNTcjU4NzdxeW02M24xY0xoOVBWN1JK?=
 =?utf-8?B?N3l2enNveWpWM1VEU2xsaWZvZWRTbHd5VUlaMXU0TlVOY0NkRXFXWU5vOFlq?=
 =?utf-8?B?d0x1YmdsRkw0akdneTlJOHZIbmlOZit1MUF4Mk5jQlY2Rlh2c2FFbmx6ZHhO?=
 =?utf-8?B?aWFJV0txakFoVDR4K3BmblBNS3RoVXBXT3l0SWtPZkUyU21Cd3F4Smw0ZWtk?=
 =?utf-8?B?enMrNGZiR0tKQTRxZnQ1aFlGUkxvQ3prR2JOSGZPaDhicDhMcG51TE5MRFMz?=
 =?utf-8?B?ME0rcE5yMkVpU0pvYU9Lblp4em9BdXZISFpTTm5ZUjA1OWtIWVBuVmZJZTJQ?=
 =?utf-8?B?NDZiK1Y5M2VUak9jcUlZZnJVNldZYVdCRlZZUkNpckZPd2xmTWpaYkhGUzVj?=
 =?utf-8?B?LzhmUTJnU0ZJbmhleVhLSTQ4d085RDk2UGd0UGFtYndsUXRqNkYzUGNhejlR?=
 =?utf-8?B?Q3gxRGxKa1RKM050NWR6ZVNYK1BYdWIwU00wSGRhbGd4by9nMU4yUmgyaENV?=
 =?utf-8?B?UzloVzFJUEhNKzhLNEtwYW9zVldncVNKcjlOQmVlVmdGaEtjN3I1Mm9rQ01Q?=
 =?utf-8?B?bnowSmlQTjVFaUVPZk9wMzdMUm95L09GWkJOYW5MQUxMakYrSUdWWlVUbHFU?=
 =?utf-8?B?bVI2a0sxT3dsNmdlaUtYNXZ2QUMza1BBbEdkS1hPTkp5WjdBSlFLSnorNG1C?=
 =?utf-8?B?VVNZc3ZzeFhCWVN3Y0Vxc2dRdGVxNGZQWWQ3QzRNYWIzYUFqVnEzZmpVOGN6?=
 =?utf-8?B?TFN4K1lMVjNZZWorNURnU0lWcWRjNHpxc3NlWG1hamVodnFiTEF1R3ozWjkx?=
 =?utf-8?B?OGRDWVNXM2x3ZC9zNXhGd3hMcURNWmxJZUdYWVl3TXJqQ3NpV3J3QVdkMm94?=
 =?utf-8?B?SW5CNW83UytqT05TMzVpbjBYVjVBMUZaM3luRFgvVWRUbVN1RTZsUnlsY2x0?=
 =?utf-8?B?NVhqV1hmZGdLYWZjQzg0TjdsMEpwRXZXWWpRa3pZSEg1MlRYNHAzWjQxNHIw?=
 =?utf-8?B?blp5QXYwblBTS09CVjFiV1QwTmVyNXNDdDRmeEdRWjN3MklTWE93SlFMSGNw?=
 =?utf-8?B?WVlvb21GWVRJRVVMK0JHWHcvSGM0Z2hlZzZtYXQ3Z2VQRDlJandaNjZjSnVJ?=
 =?utf-8?B?cDNzNUFneUlTVzUvVzFOYmlmcWJGeElKYWNtM2JRRWpwZWJrVmlDTFM5U0x1?=
 =?utf-8?B?bzVCWFZZL1JEeENOcElGTVg3QkFFcXRaSE03R3Q0bTlTQ1JsU2Z0eW03RGxH?=
 =?utf-8?Q?UmRY8ANyhPYuM9dnItW+Pkijj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <135CA944A48E1547A38C6E4AC70C23C0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c89122fa-d47f-440a-699d-08dd94b993a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 20:38:12.3257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TGI+ZGBOY/Hg2HzFiegcjXzOnrEm9EWY50kkBeRKuTpQIbcEsduwFJMV8e7JYOgmKKB78x28+fYcahqvujV6eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8207
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

T24gV2VkLCAyMDI1LTA1LTA3IGF0IDIyOjUyICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToKPiAraW1wbCBGd1NlY0Jpb3NJbWFnZSB7Cj4gK8KgwqDCoCBmbiBzZXR1cF9mYWxjb25fZGF0
YSgKPiArwqDCoMKgwqDCoMKgwqAgJm11dCBzZWxmLAo+ICvCoMKgwqDCoMKgwqDCoCBwZGV2OiAm
cGNpOjpEZXZpY2UsCj4gK8KgwqDCoMKgwqDCoMKgIHBjaV9hdF9pbWFnZTogJlBjaUF0Qmlvc0lt
YWdlLAo+ICvCoMKgwqDCoMKgwqDCoCBmaXJzdF9md3NlY19pbWFnZTogJkZ3U2VjQmlvc0ltYWdl
LAo+ICvCoMKgwqAgKSAtPiBSZXN1bHQ8KCk+IHsKPiArwqDCoMKgwqDCoMKgwqAgbGV0IG11dCBv
ZmZzZXQgPSBwY2lfYXRfaW1hZ2UuZmFsY29uX2RhdGFfcHRyKHBkZXYpPyBhcyB1c2l6ZTsKPiAr
Cj4gK8KgwqDCoMKgwqDCoMKgIC8vIFRoZSBmYWxjb24gZGF0YSBwb2ludGVyIGFzc3VtZXMgdGhh
dCB0aGUgUGNpQXQgYW5kIEZXU0VDIGltYWdlcwo+ICvCoMKgwqDCoMKgwqDCoCAvLyBhcmUgY29u
dGlndW91cyBpbiBtZW1vcnkuIEhvd2V2ZXIsIHRlc3Rpbmcgc2hvd3MgdGhlIEVGSSBpbWFnZSBz
aXRzIGluCj4gK8KgwqDCoMKgwqDCoMKgIC8vIGJldHdlZW4gdGhlbS4gU28gY2FsY3VsYXRlIHRo
ZSBvZmZzZXQgZnJvbSB0aGUgZW5kIG9mIHRoZSBQY2lBdCBpbWFnZQo+ICvCoMKgwqDCoMKgwqDC
oCAvLyByYXRoZXIgdGhhbiB0aGUgc3RhcnQgb2YgaXQuIENvbXBlbnNhdGUuCj4gK8KgwqDCoMKg
wqDCoMKgIG9mZnNldCAtPSBwY2lfYXRfaW1hZ2UuYmFzZS5kYXRhLmxlbigpOwo+ICsKPiArwqDC
oMKgwqDCoMKgwqAgLy8gVGhlIG9mZnNldCBpcyBub3cgZnJvbSB0aGUgc3RhcnQgb2YgdGhlIGZp
cnN0IEZ3c2VjIGltYWdlLCBob3dldmVyCj4gK8KgwqDCoMKgwqDCoMKgIC8vIHRoZSBvZmZzZXQg
cG9pbnRzIHRvIGEgbG9jYXRpb24gaW4gdGhlIHNlY29uZCBGd3NlYyBpbWFnZS4gU2luY2UKPiAr
wqDCoMKgwqDCoMKgwqAgLy8gdGhlIGZ3c2VjIGltYWdlcyBhcmUgY29udGlndW91cywgc3VidHJh
Y3QgdGhlIGxlbmd0aCBvZiB0aGUgZmlyc3QgRndzZWMKPiArwqDCoMKgwqDCoMKgwqAgLy8gaW1h
Z2UgZnJvbSB0aGUgb2Zmc2V0IHRvIGdldCB0aGUgb2Zmc2V0IHRvIHRoZSBzdGFydCBvZiB0aGUg
c2Vjb25kCj4gK8KgwqDCoMKgwqDCoMKgIC8vIEZ3c2VjIGltYWdlLgo+ICvCoMKgwqDCoMKgwqDC
oCBvZmZzZXQgLT0gZmlyc3RfZndzZWNfaW1hZ2UuYmFzZS5kYXRhLmxlbigpOwo+ICsKPiArwqDC
oMKgwqDCoMKgwqAgc2VsZi5mYWxjb25fZGF0YV9vZmZzZXQgPSBTb21lKG9mZnNldCk7Cj4gKwo+
ICvCoMKgwqDCoMKgwqDCoCAvLyBUaGUgUG11TG9va3VwVGFibGUgc3RhcnRzIGF0IHRoZSBvZmZz
ZXQgb2YgdGhlIGZhbGNvbiBkYXRhIHBvaW50ZXIKPiArwqDCoMKgwqDCoMKgwqAgc2VsZi5wbXVf
bG9va3VwX3RhYmxlID0gU29tZShQbXVMb29rdXBUYWJsZTo6bmV3KCZzZWxmLmJhc2UuZGF0YVtv
ZmZzZXQuLl0pPyk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoCBtYXRjaCBzZWxmCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLnBtdV9sb29rdXBfdGFibGUKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAuYXNfcmVmKCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAub2tfb3IoRUlOVkFMKT8KPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuZmluZF9lbnRyeV9ieV90eXBlKEZBTENPTl9VQ09ERV9F
TlRSWV9BUFBJRF9GV1NFQ19QUk9EKQo+ICvCoMKgwqDCoMKgwqDCoCB7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgT2soZW50cnkpID0+IHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGxldCBtdXQgdWNvZGVfb2Zmc2V0ID0gZW50cnkuZGF0YSBhcyB1c2l6ZTsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVjb2RlX29mZnNldCAtPSBwY2lfYXRfaW1hZ2UuYmFz
ZS5kYXRhLmxlbigpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWNvZGVfb2Zm
c2V0IC09IGZpcnN0X2Z3c2VjX2ltYWdlLmJhc2UuZGF0YS5sZW4oKTsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHNlbGYuZmFsY29uX3Vjb2RlX29mZnNldCA9IFNvbWUodWNvZGVf
b2Zmc2V0KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIGNmZyEoZGVidWdf
YXNzZXJ0aW9ucykgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAv
LyBQcmludCB0aGUgdjNfZGVzYyBoZWFkZXIgZm9yIGRlYnVnZ2luZwo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZXQgdjNfZGVzYyA9IHNlbGYuZndzZWNfaGVhZGVy
KHBkZXYuYXNfcmVmKCkpPzsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcHJfaW5mbyEoIlBtdUxvb2t1cFRhYmxlRW50cnkgdjNfZGVzYzogezojP31cbiIsIHYzX2Rl
c2MpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIH0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBFcnIoZSkgPT4gewo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VyciEoCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBkZXYuYXNfcmVmKCksCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICJQbXVMb29rdXBUYWJsZUVudHJ5IG5vdCBmb3VuZCwgZXJy
b3I6IHs6P31cbiIsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGUK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICk7CgpTaG91bGRuJ3QgeW91IHJldHVy
biBhbiBlcnJvciBoZXJlPwoKSWYgbm90LCB0aGVuIG1heWJlIHRoaXMgc2hvdWxkIHByb2JhYmx5
IGJlIGRldl93YXJuLgoK
