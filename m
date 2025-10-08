Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B1BBC3364
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 05:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0735310E744;
	Wed,  8 Oct 2025 03:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ksNwD7im";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012051.outbound.protection.outlook.com [40.107.209.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B3710E742;
 Wed,  8 Oct 2025 03:21:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpSoW49NhE5BgsutgJExTKAsRPZgZ9Cfztn9B9+czssMODZznKAOUt7WZ3Ld0Ssc0WkAkNLheV847VMJZOv683hUaNmSQSrCVsfspoQ5K0CpFwG//YIpxM2kRgIOem0t5N0W9ZiGKKmd35nzI2JnyqOYmmskHbc5Uqsncf9ZopjifNmHxl4jVId37nlmfsP0lSmO4mtHT2smIIBbafAUM6bZXyHMjQ+ZQ7KOOPWLV25qFCd9j5es9UbxQEBa+AXFPU+2auij2fWuzoX5+UZ3B/8ghI6fE3UnTGTohGyXORWq6YkakQMqLZzNe6vancr2eFZqvo4BO2TlazokKJpQUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72Pt5H0borCn9IKy3wrInr0Xa3t2EORBbZTYcn4YZ8o=;
 b=a8BxMv3n1wywuNMJQwaVlGlPhWe5Hb4L6bXnGR/txSpnSe1PY6ztVXjknbp1OxpjQBZKCRsWmLtJ0im/7n6gkKlvugrroG5HjwyXh5aT1bexUJQzsuFDwOJt+UaXbXcLq6gCXa48CeDYPd+2+JM36rMxnvpIs1WkZAawCvLIS7ilB2GtBFcb+EVckSG+5tSjSvYIBb7MtzF0vZwph/wXdn5abQCUsVJOLdIFqq2jXq0yKOEzWyhJlbm8PqiB243oNLURdqWEZtUq2cdoxdC3jR083d53w/Fp8xK82o40X2vrJVXLcQM6/ePAhENCmcXf+PMCTp9+zuZqNN1IeT5Xrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72Pt5H0borCn9IKy3wrInr0Xa3t2EORBbZTYcn4YZ8o=;
 b=ksNwD7imJKqmzU6XOD/N4CR1gdpGeybk7WodFwj10IYdZwktwH+TsUpNEBttkaU/xoZE+cq4dmOl1Q2EzsbtuVQ5aSJhRQS4L55/su0akwTlEHb3K/MQuOc8mdl0O/VT/G//ueaCIXxkz1q/Yy5KUpKf/O6eqHm6Hb35ImgGRRAO1EKhxklYjCMphqxF+y4Mkt0Pox/TZv85/JfMzgX5KBABhGUevJX1UWKPCXLK0ee7ZM5V/d1G6VR4nGmGOS3wJG+5hDK3LbK10gZLgeJmdHlKWISwEIodskTgPZvBuow7M85eX0ocxt8grn2mptFuV88STirhDezdRcvzZgIJXw==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by MW4PR12MB7384.namprd12.prod.outlook.com (2603:10b6:303:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 03:21:11 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 03:21:11 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
CC: "lossin@kernel.org" <lossin@kernel.org>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Hubbard
 <jhubbard@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "lyude@redhat.com" <lyude@redhat.com>
Subject: Re: [PATCH v4 12/13] nova-core: falcon: Add support to write firmware
 version
Thread-Topic: [PATCH v4 12/13] nova-core: falcon: Add support to write
 firmware version
Thread-Index: AQHcN+h2fBc5/2MR+EujnD6o935iIrS3lV2A
Date: Wed, 8 Oct 2025 03:21:10 +0000
Message-ID: <aaf218306186aa8959d8f3971a62afb9f229548b.camel@nvidia.com>
References: <20251008001253.437911-1-apopple@nvidia.com>
 <20251008001253.437911-13-apopple@nvidia.com>
In-Reply-To: <20251008001253.437911-13-apopple@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|MW4PR12MB7384:EE_
x-ms-office365-filtering-correlation-id: 9b6db913-a8a5-4565-6967-08de0619bac4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?L0FDN2R4OEhEeGRXcXZ4RE03T25LN1AzMDVBNEFESGJwR2YyajNpOXgrZUZs?=
 =?utf-8?B?RzdnSHdsV29VYSthRUF0RWVoQzlHaVhMdzZTODQvdHE3MW5kbkU4cks2U2xS?=
 =?utf-8?B?WTI3YWxGeVU2WnYzSVltSVo3dm5taTZvZmVtand0S1pVaTVRcE13Qnk1Zkps?=
 =?utf-8?B?MVM2b01iekFmVjBYS1JXa2I4REpCMzIyUHdvOHpQWDNVZXp1QnVtcTFkL0Vs?=
 =?utf-8?B?b1pyQlJuZkI2MUNJSGUvYmlWcHpOV0p6K1RvMnNFT3RTNjJHZlQrS0VSUytn?=
 =?utf-8?B?NlNwQmoyVDJyRU9CVXFOdXdFK1hzd1ZJWStaVUU5bHZuMUVHWTdwS2R4QThh?=
 =?utf-8?B?Zk05cHlTUkN3TXFEZ0JONkt2V3JzODVja2lpcnRrVGdtSjVjUFF4MmdZRmo1?=
 =?utf-8?B?UTkwWEUvTTYxTGQvRjU1Q2FJc1VtY3pJRnlqc3p5dy9lT1lVSU4xRVI1V0ZD?=
 =?utf-8?B?ZWw1eDNEVjI1T3JBNzl4VEJlWWw0N1M0YXFFMm9vd3I3TEloT0p4M094czl4?=
 =?utf-8?B?bUpwV1QyZFNTOGFyQXplNGh2R1RXY0ZuWUhGcDhJOHRHemdxbGt6dlZYdjFx?=
 =?utf-8?B?ZGx5d2xZRDI4dE8zWHhsVWVWL0pVa1lhVXF5OTFpaGN1dlBUaGNEZ2RUSFNs?=
 =?utf-8?B?NURpcUdVeXpzK1lKamQ0a0tzTDQzWGV4SGN5YmdqeUFsTUIyNEZqVFgyc0RS?=
 =?utf-8?B?SjNoKy9aQVVSQnhNcDAvdlVmV0t3anBlRTZqN3lNQVZsdC9RbUxDL0JkV0dm?=
 =?utf-8?B?cm91Y0pPVkVMOTYybUQrS29mcWhSYUc2OWxOb01XN1hMUUhRa2JKZElSRXVr?=
 =?utf-8?B?cEpZOHUxTHU0ZXpaYjlsTzVXOVhwNGFxSFJUd3RpUmZyZjhHbzdJVVFhREJk?=
 =?utf-8?B?NjcrWmdhYTlwMjAvUkdkRVovVXpzQmxhYThudWFiVUdmUUE3QWNTdkNIMFhW?=
 =?utf-8?B?ZEtBOG9LajZkL2NLdDc3WTJFalI2T1cwQ21XaEcyMDRTUUdpanMzeEFURkNm?=
 =?utf-8?B?UUFKeWwzR0pMOFliMm1hNGpVZzJMS2dGVENxSGVnUVdITDdPOTBYakpLS2h1?=
 =?utf-8?B?a3NtY3NMS0JjbTFnSzdrS3hrNWtJVlU2OE5LREFVeG1ybXpEZGdnMG1TMlZT?=
 =?utf-8?B?NkZhZ1pCMVd4K2RwZmJ6RUJmem01UTdJWXYveGVnVWhTZXExQUlZdUNNbjIy?=
 =?utf-8?B?SFdETDNzVVZlYmU4a3hidTJpcnhHb0lSQWpqdTF1L29aUzRBdmZVdnhuNGZr?=
 =?utf-8?B?QmE5NVpjc0pUTXF5WUd4dE1JYitLaitTQnc2QW5YLzFDcEhvdUdhK0xSOGRU?=
 =?utf-8?B?MEI1a0xyYnJIVjhkY0FzdFdXTWVnbitxZXZveUtEaUdiam1YNnY2VW1Uc0xK?=
 =?utf-8?B?cWtiQ09JM2QyRG0wN0FaVG9mVG01eE9wekVEZHZGbFZrUW1FM0pjeVdpWXpT?=
 =?utf-8?B?WTcxeUFVQWppUkNJUVYzMFAvVVlsQk9WSjVBQXVyNGRpY2JuQXFVYUgyQnRt?=
 =?utf-8?B?MzdOdmtaYXFWaTFZSDNIRStEV0pqL0FlTGtxSThJR0RpcGNSSWJjS1ZGSGQz?=
 =?utf-8?B?NFpFUjNOZDZhY0EyQWtuSkdxM2p4YkVFVUdVQ1pxZy9lQUtrRHdEV09wazhr?=
 =?utf-8?B?Y2dzRnRVeWZRVzgyVlJ5UmY3N2ZIOHFVMlA0V0VTWGh2UThKZkJ6Q3BpR3N0?=
 =?utf-8?B?Vm5HK3hxUElGYlBVbXFIVkw1OWVHVmJpZCt4ZTR2c3F1OTA1cUI0UlYzam8z?=
 =?utf-8?B?OXM3N3pyQVE4SDJKTW1MdGkrcEV1VThIYzdsNGpLQ09heUc5d0xKL0VpTXVm?=
 =?utf-8?B?UmFKQnc4aE85c2NndTlZa3NPU09aN3N1QlBwMC8vWUxpWmFBbEhhOHdtSlYz?=
 =?utf-8?B?Z05hMU55VWVPU0MxMUpVYkJQY2ZUcnNtbVJoWnUxNFF1eXpMb3FpTVdCbmU5?=
 =?utf-8?B?WjBXdUMyR1pYeHJvSk9tbytIZ0tDUzYvemp2T3VKbi9jZmhGOUdmTkFhTzVr?=
 =?utf-8?B?Zzg1c1FqcitzakZIUVFVV01xTXZMSWUyNDIzRytvVEpvU1FVRlZtKy9Ha2dk?=
 =?utf-8?Q?0Sw1zA?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHRjMTRMYlhDL3Bqem9LMGFrbkh5WkdFVXdvTlpycG9OT1MzTGNHbVhHMG8r?=
 =?utf-8?B?ZUlwbWVNVnBsZDZKdTBvaCtIYUtZODNnU29CbGZ1aW95R1diMFNIQkl5NHdl?=
 =?utf-8?B?aVFtY1VUZFcxUUZLeGJNcFdYM1QzeDVjNFdVYXVaUmtIdFBYcnRERUFkd0hj?=
 =?utf-8?B?QWloT0xFZjN1bHI2NCtHRGxBWVFXa2YwZGlUb0hrRjdjMWVOYzdFZW82WDVD?=
 =?utf-8?B?UDRvQU1iK3ZiTm5nRk9uTE1pbXY1aUhudDRaUC9rSmpLK2hhV3FTSG9saGVN?=
 =?utf-8?B?K0lLdUpQbTVSZW92LzBFZmhZbGZFTVdYVTdFbm96R2RRUFVpQlJTS2gxQ3Jy?=
 =?utf-8?B?eTlLbFRtZm1UZDhqVTBxazVFblJOQXpkOW9CNFFtZkppaTVHNnZqRW9iNGta?=
 =?utf-8?B?OW1GZzVRYXNyVnhSdE81dlFKV2JWM1d3WnBOQ01uS1Q5N0txa1FLYythTUFZ?=
 =?utf-8?B?Z1o1V3p4LzhPbDJvcFdqV1lheEIzSGVac3p5endwb2ZjNGV4U05FY2MxdGhj?=
 =?utf-8?B?VXd1azl5TnAwU29LWHZDSmZBeUFBWkhFMng0TkgybWpNckI3THhLMjJCT3Y2?=
 =?utf-8?B?VVFKRTJMd3pJZW4rcUMzdEllaGprWDUrRm9WTTBZWEtheWRpb3Y2SXVpTE8x?=
 =?utf-8?B?ZEx4amNBZXgwUHNPb3VGV0xSRWczcWJNNXgvdFZpTi9WRXRtSVpaOGthUDJQ?=
 =?utf-8?B?amVuNzU5YVluYzRJenJEM3h4dVNVN2FURWJNbjZ5WStTYk12dHVVM1MzUjFQ?=
 =?utf-8?B?a2t1TmZGd2hBMDBvNEVoQTkrd1dGY1Q1R3RlQjh5QVMyc0g4NDd4cjAzRlFC?=
 =?utf-8?B?SEFGYWFscHh6SWJUYnRiQkJqV002Y0xUWUp4RWE0RCs2T2xjMGtmcUFySnY1?=
 =?utf-8?B?VjcrZG5sNkV1UlFUODlWbnptN2czcTRrcktieklNOEc5ZDREdTRkbGgwTUli?=
 =?utf-8?B?Y242NHBsOG5peUNrbnRFU09UMU5hcjJsT0x6VnpxVHFoWS9NMlJiTkhaWWpx?=
 =?utf-8?B?U0tyR29UbUFRK09lMFZpdFIvbEFpcWptMndMM1p1RTNrL040dTJlK1J6L0lE?=
 =?utf-8?B?Ny91dDdBalJobXBIL2FWR3BGRlpLUC80bW5lSWVYdW5TNkJTejYwWkNHc0h0?=
 =?utf-8?B?V1lGYkE3VzhjaVBtQmtLblZQbjFldFF3ZlZTdHlibm1kU0ZVcGVudTIxTy9Y?=
 =?utf-8?B?QklnTVVLNEVudm9DL3dMV1ZFd2ZGVE9BNXF3YlVvTm8xVFYwWHlaaGkwYzA1?=
 =?utf-8?B?aVh1QUFuZHVwMW9YZ0NEYVRIVWtsSGFZVWROaUgyeEJ3cXh0QmtqTG5PTkc4?=
 =?utf-8?B?UER5MW10OGJWdTIzaHMwUzFnMzN0dldqZFAyNit5WU1DTjB1OEd3SnhXYndN?=
 =?utf-8?B?TkRkNzZrUm1nbVdRa2Y3YmpkbDN5MFhFTE1vc2I1Q1dVSmYxa1piV3UwY1B1?=
 =?utf-8?B?VExrSnVXRWFXUlM3TXFBRFFuVFRET1YxcHVHeFhHRzFYNm11T0JUMnhCZUYz?=
 =?utf-8?B?TU5mOGdwK2lHdDdLVVVOS3c3czZKVlNuYVYxWTRxaUdScHBoeUVXM0RMeWJy?=
 =?utf-8?B?MGZYMVhTcUtXSm42NWxaZmhtUk1uOWM5MlNLSm5IaXg5L1owbFIyd1BXSC80?=
 =?utf-8?B?M1Z3MTZ3QXgvRmcxc21RSnF6eXVRWUQ2azRSNGpUbStEOFhoSTNSUk81c1Nz?=
 =?utf-8?B?VGpWQjJoSTY3MkxVcmlwK291STVnZVkvVlpIbS8rVitTWjhNNUxselZuaGI4?=
 =?utf-8?B?bjU5MUZoOGNZMjgxOXoyQlg0R0FhbENGNEcwU3VHcWNjMXkxNjZ0Tmltaktu?=
 =?utf-8?B?dGJaUXBDOHRCaW9XenZOUmNZc253M0tjWVZJZ3ZzUGdXVUZRK2ZWY3ZDOGdk?=
 =?utf-8?B?TkFYYlJtOEVTUEovQ3RKeVZueTIxejMyMGRDdFFTVktKdU5TSExWTndTaGt5?=
 =?utf-8?B?ZWdCb3JieDhkM1JPK0ZrOXUxbFJVYXRiTjVvVkJpdHFZZGRrUVpPWmdNdXlG?=
 =?utf-8?B?cm96S092cEFBd3VIMDAzZFNHV2YwakJheGFMMTZORWdncDJtdHdBejhiN2pn?=
 =?utf-8?B?SG9GQWw1YUZkcWhNOVBSQnY2bkd2SGJyV0lERTMxOTkydDlSS01ROVNnVmg1?=
 =?utf-8?Q?2wYxOJO1aL8UrgzUMFPUyzUra?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4523A29E63C7743B3600CE8C5A4DAA2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b6db913-a8a5-4565-6967-08de0619bac4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2025 03:21:10.9957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iPYWKoB5Lx0jxIknCX0dir5TK9RayriNkNPYiSLL5uSNYAU/5CliHRkRPHsq9I3cP2UMykNLiD/QjZII44XsCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7384
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

T24gV2VkLCAyMDI1LTEwLTA4IGF0IDExOjEyICsxMTAwLCBBbGlzdGFpciBQb3BwbGUgd3JvdGU6
DQo+ICsNCj4gK8KgwqDCoCAvLy8gV3JpdGUgdGhlIGFwcGxpY2F0aW9uIHZlcnNpb24gdG8gdGhl
IE9TIHJlZ2lzdGVyLg0KPiArwqDCoMKgICNbZXhwZWN0KGRlYWRfY29kZSldDQo+ICvCoMKgwqAg
cHViKGNyYXRlKSBmbiB3cml0ZV9vc192ZXJzaW9uKCZzZWxmLCBiYXI6ICZCYXIwLCBhcHBfdmVy
c2lvbjogdTMyKSAtPiBSZXN1bHQ8KCk+IHsNCj4gK8KgwqDCoMKgwqDCoMKgIHJlZ3M6Ok5WX1BG
QUxDT05fRkFMQ09OX09TOjpkZWZhdWx0KCkNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnNl
dF92YWx1ZShhcHBfdmVyc2lvbikNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLndyaXRlKGJh
ciwgJkU6OklEKTsNCj4gK8KgwqDCoMKgwqDCoMKgIE9rKCgpKQ0KPiArwqDCoMKgIH0NCg0KSSBz
aG91bGQgaGF2ZSBub3RpY2VkIHRoaXMgaW4gdjMsIGJ1dCB3aHkgcmV0dXJuIFJlc3VsdCBoZXJl
PyAgVGhpcyBpcyBqdXN0IGxpa2UgaXNfcmlzY3ZfYWN0aXZlDQotLSB0aGlzIGZ1bmN0aW9uIGNh
bm5vdCBmYWlsLg0K
