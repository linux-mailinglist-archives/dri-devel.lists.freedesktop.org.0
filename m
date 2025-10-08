Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E53BC35B2
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 06:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571C910E750;
	Wed,  8 Oct 2025 04:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nn/4N5wH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012025.outbound.protection.outlook.com [52.101.48.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2521010E74E;
 Wed,  8 Oct 2025 04:57:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/MLSRmeRVMCZjGCcY9owemXlErOEsAsdyWB5yhkMA7UuNPAoGVzRpJvHMc05AWtLbGyr3IoCJfrrbyT4XIRfg3il30iJkzIiSXLJqhI4+ejowz6jyITbhiK98M+6uwNuq2B6RWUhygtNxfc35qfKwSZeFFUjIj8kPlbla1lJfsT0VwVoVC4lo0VGmfhSp0D3duSqQtpQ4gi6eeqTsImYGZ9WsokBF5jur2gowbiWwEgpQkvRP/eS3Wzxn7vAD2xgMxt2aOxbrNmI0vjiKAkX06v8wuV+Gqe2vD/vNcCxf1mhzhk6ARy9dyB2BiJwuUvzIN/JaDLTBjk/teTldXjeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLyU0tNHw8s7H9F/6F2wfUFnwDhEZHdpmTRkRhtMmbM=;
 b=e3OaGBiTKOL0IAbdQ3hg0QzwaNipJ4ryUTNQ6/0tkeYxp4+QUqvzRak2etkMnqXbk2mf4xrftUaqfdFHJckujNddiqHUajuT6yqxQoNFfnychNF7JmwJyQrGvfU64pgAUvAcD1ka3yGXu0VtAIIN8Dg9sGJgU/s/nP1xF0I9mFr/GWLEV+yk3rdiv2L1qExSjKvx2KKqsJjEczJwn2UT/tVrn6yhH/Ei+mhSiulgcBOSzC5b+KMfjeGrtzVIHbRKv8ZVTHxl8DomTy5AwpGd2jhOYkq1Z8LIRfcJ0Jn5qLGxIbqCsbKVWeLU4pgMXzTfRluA0sy+vMufURM33Irydw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLyU0tNHw8s7H9F/6F2wfUFnwDhEZHdpmTRkRhtMmbM=;
 b=Nn/4N5wHJ3RdfMRUVuFh3ahD0OG3AwY2eWMTT/k3Bg2Z6dsActEJzRX0aoqU01MTJo2iMhoyzOq9mMOrqouH5XdRiejMOtgpHUs9GZr8Q0j5O852TMAsfzG1q7Fxli9H9oHkb51PdV4CcBWvQuIerOObgFKkrinUn7MiOfUEIdR5B72xuqhOPcCFWJUl9BEhpDVeXtZadJn+4n0DtlWmQSkwAZ70ajdsSjeTAC1rI8x+YLkD0+rBgo0EU4psBhzuVH147BN7oTIDgBw6i42FQ2ljD1aTXyQYJe0CoZx20SAJrjfDebYy7fuz4S/pH9TnfgbfPOJf/6Ps4tY7pvWsgg==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB9191.namprd12.prod.outlook.com (2603:10b6:a03:55a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 04:56:56 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 04:56:56 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "lossin@kernel.org" <lossin@kernel.org>, "ojeda@kernel.org"
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
 "aliceryhl@google.com" <aliceryhl@google.com>, "gary@garyguo.net"
 <gary@garyguo.net>, "lyude@redhat.com" <lyude@redhat.com>
Subject: Re: [PATCH v4 12/13] nova-core: falcon: Add support to write firmware
 version
Thread-Topic: [PATCH v4 12/13] nova-core: falcon: Add support to write
 firmware version
Thread-Index: AQHcN+h2TYtDg/9gF0G9fWmuV06iR7S3lV4AgAAawqE=
Date: Wed, 8 Oct 2025 04:56:56 +0000
Message-ID: <2002AEC7-A3B6-4E77-BDCF-B21E9D7EA0CD@nvidia.com>
References: <20251008001253.437911-1-apopple@nvidia.com>
 <20251008001253.437911-13-apopple@nvidia.com>
 <aaf218306186aa8959d8f3971a62afb9f229548b.camel@nvidia.com>
In-Reply-To: <aaf218306186aa8959d8f3971a62afb9f229548b.camel@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|SJ2PR12MB9191:EE_
x-ms-office365-filtering-correlation-id: d759a62f-e1bc-47cd-0ef7-08de06271b2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?Zm5XcTJFM3gyODJvM0l0bXFwRkxYOVpJZlg0WEM4YUhMOTZTRGFjV29lZFNo?=
 =?utf-8?B?SkQ0RFlaSlAzREcycnlwYWU4clVodE80eDBPNTVuYTVqekRzUkQ1b1JxRW9V?=
 =?utf-8?B?bEVvT1pmMlRpaDE3SzBRL2xIdGZnR2dSNVZhQWlnN2JMYmxZUVdFZXVCSVRT?=
 =?utf-8?B?aENRMkFYaGlESVZpZCs0STJSWXErRGtMWnZVOVhPU2hxbTlNMm9mY0JQUFZR?=
 =?utf-8?B?NjdLeXE0WDV5S2NZa05XaGtmdkM1UnF1NU9MNTN5dEpYbE1DQXVJOHVyaTRZ?=
 =?utf-8?B?YXIzSXpFeEpDN0hRK015LzFHNjdSRkNkd28wYnRlb2FiSFR6MXVKaEpreGFL?=
 =?utf-8?B?WXUxc2trbW45aG9jc1RDaG14M0I5MzFTTEtodWpZRXc4NnIySHFsa05iVi9C?=
 =?utf-8?B?K1dSMitQcjRmTUJwdGt5UEh2YUNJWXZsUmJ3bXIvNFhCQzZubzNUQmsvUlcx?=
 =?utf-8?B?UmN6N0NYcDMyU1dlSXZIUVVCSVBvRFNPblNMOXg4TWk2UEplczdlUkQ2d3lv?=
 =?utf-8?B?bTBuaXRJeElKT1UwQmtEVEQwSHk1a1dsWWp1NXZTQVZXUGNXSWwxdVE4dm1m?=
 =?utf-8?B?Mi9uMXZJSjZPZmt6enRXSTJ4UEhLdENPcm9WVUJBd05aVnIxbVk4cUN3b0lh?=
 =?utf-8?B?aU9xTytsNmUzS1JxemI2Y2ZHVDJwSm0xMS9kM2xySnROajJGNFNFRTNjYlc3?=
 =?utf-8?B?OUFXRmZJVE5NenJiTU94dnJPUEJjaVBrb1gyTXFlYmJ4RUxzeS9KOEZUcVJP?=
 =?utf-8?B?Q2dKSWJnRzZHVnk2bWt5cG9UZkllclNFZjBMaVhwejNoeE15N2x1N0IrYzBI?=
 =?utf-8?B?a2o5a0tLY25lU0hIa1E5cWlyak5xRzlHYzFTUFVGd0NWL0VFYjJ4eHZDTzVn?=
 =?utf-8?B?MVVjYVdMOHp3RWNCVWFoVi95ZVhTY2t3THVjemdQZFZPMFREbVdJejNjM3FI?=
 =?utf-8?B?WDJLUXNjOXFFaHBDV0tFRWowRTdwdi95dGIrNXBaeUsycE1aUnBBeGhwWHBs?=
 =?utf-8?B?TmtCdlZqVVNIYkthbDhIUTBzT2ZVS1VpOHRZV0RCSktTZ3R0Z01lbkl4bTl6?=
 =?utf-8?B?S0Y5TUxUTk5yS05XcElRNVFEcEYrZTFRZDZPQ2psR0FtYVladG9KMm83OHV1?=
 =?utf-8?B?cW1zTzFveVlFdEpGallTOXQrT0VSOEZGaHQxZTJqc2ZEMjRxcUYvcU1PSFFJ?=
 =?utf-8?B?S2NkOVh3T0trZEQxSzBGM1poWGR2TStCZGFEVHJZT2JHVTZENlBLakFmMWNR?=
 =?utf-8?B?YmZ4bzlMcW1vdHBTS28vMldneUpTWXdpbXBsY2pETmN6NDNCcVpYbEhHZWJq?=
 =?utf-8?B?ckc1QXF4NzVuOU5lYk9KUWlsLy83VC9EdkJWa2UwTnl3dGFqd2k5NDVmaTBQ?=
 =?utf-8?B?aEZjQzUrY3R2Z2xQajlIL0R4MmpRUS9uWlJlL0xkS1UrY1diYUhZYXRadmhS?=
 =?utf-8?B?Mml0bXRvVHA5S1MvK0hwYkdFd2VzWHFlclEzTXJod2wxQzRyTXZGaDd1a1JP?=
 =?utf-8?B?RUFxak5ycjJoU1lrN0xTTUhmNktYSmJjdnR6OFpWaGtFa3pidkhnZ2JxM1B4?=
 =?utf-8?B?T204Tlc4UE1yWVpxdzBhVnBsQm1MUy81TzNVS1dQR1lFNzF5c3Qwck53WmhM?=
 =?utf-8?B?bVVOcmpMVGxOYWlKV1I1MENpVEJCa3dZMDlWR2RvdlpnL2syR3VvZHp2eGE5?=
 =?utf-8?B?MzA2RWpzZzN3aWRuVzl5d1ZOWjRrSVpienU1RmhFdXJlNUxzQnVxZURNdXNK?=
 =?utf-8?B?aWExdUovNHRKaTZkVWYxYUpnbXpFUE0vNHZYVXBUUG5JOUxOcjBEVmNvbDFX?=
 =?utf-8?B?ZFFWTzl3Tmw5akNVd3c4L05FNEpDWWpsT2J3U25QMHJhcmNmcHltTExrT0dk?=
 =?utf-8?B?VjVyaFQyb0FOelJqbmtmNFhFd2ZBYlZmUFlFSlRkcDlIOWdVZUxVZTBSM2xS?=
 =?utf-8?B?MkI4cURxMnZNU3dwZllIRjRjUkJOd214Q25hZ1FuU3BhZnVPK3hqVnZDRFlj?=
 =?utf-8?B?TmxpUThOQkhZVXBJQm5qODgrYmhPYzI1THp0UTd5TmlCVkx0UXBTcG9XWUNq?=
 =?utf-8?Q?/0Ee2K?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enVHa3F2SDROM1JZOWxzRkE1cVBlY2F1V1JpVEFSc0ttNUF3YVRFVmpqWG1n?=
 =?utf-8?B?SlMwb1Zha0loZjFjeE1UdmtjRXlTNGRlNGNVeGJyTWpSMzkvZFYvWnlEUVB4?=
 =?utf-8?B?WTFHNWhZTHltRUZmTWpqRHNSWi9PRkZoL3pMYWd1NFcxYmVoc0xyd3ZqQy9q?=
 =?utf-8?B?TU9sS2F3UEdFallYQkdES2hrL0JmaFdzdE04ajRjMnMrSXdyVkVmcStNbUky?=
 =?utf-8?B?cUs5OWNERDFUOWxDWUdlOVZrTEJ2NXl0U1FSNk45SEhxRXBpUmZZZDlkbnJD?=
 =?utf-8?B?aEVFMEVrYzhROGlQUkhJbG5JRnB4Rm42bWdvbmNKeWE2dlRzdm9VdkpLZm41?=
 =?utf-8?B?VmhNYkpJN05pYzVDaUlMMG5BcWJBYi8xakF5LzhDNDBjQnlvVkNLREhMMkps?=
 =?utf-8?B?Zm1oNExYdmU1NGpieEdKY2V4T1M1S3VHdEZ1dlI4bjZnMlZlWmpvSFJaTFZv?=
 =?utf-8?B?ZG5VMFF0TFZzNFZaTUlxT1A3VGlIbmttMlUvdkVHdm8vdDVUS05DclhLaFB6?=
 =?utf-8?B?NTJaNklTV3UxRWRXMU1JbkdkQmdVaDVvK3lxOFFQdDZNZG54c2ZUNmVBdURE?=
 =?utf-8?B?N0psanZPOUZlR1VCRFhhQk4vc1lHOGJrclRIYWxjWVdRUmUrZHVWUjFJMVVQ?=
 =?utf-8?B?YlN3Q1V1Y0xaSHdvdWdYRTk4OWowTU5NSlppNjVrNTIzS0dWUUJpbXlvWkNt?=
 =?utf-8?B?YklkU21sZk9IVGw3dDYvUk5DUXZlNW1OOWc5eFhVamM0bDFSa1RwQzRNam5h?=
 =?utf-8?B?bFFrOVIyQ0FnRmhvRDdDK0pxL3dMUDg0Y2pkT0NBUGhxL2NVQjJtUmZGUTBa?=
 =?utf-8?B?RkNuQ1FkbFczVGRqWWRzQnVGR0hXelRsVEZaY0p4U1lhenUyZTArYlNNR0Jj?=
 =?utf-8?B?TWl6eXpMZXI2YnFmb0dJcGNTdWV6TW0zbnRObnk3QldMeVlBN25TblBpN1pS?=
 =?utf-8?B?M0NyTnAxOTk3YklnU0pzcDdkTWU2YWpuRzVHVzN5QjZzV1BHL1ZFckNxZHFM?=
 =?utf-8?B?TU5qUHFCQW1UTHFlanpITzVvTHRTdUFtUHREM0hmOGtXanhDd1F6bHR0WVRu?=
 =?utf-8?B?enA0M3JpR285WWNlQjVQdHQ2eW50RHpRWDA5OXBYS1plM21jckpYOFRjVGlV?=
 =?utf-8?B?M1JLbUNNTS9TZVhmSVVqMHlzKzdxK2RYdDdEQVdLbVpDK0M4YjhUT0cxZkc2?=
 =?utf-8?B?R1dYUk9STWFpcVhHSDJvN3c4OFB5V2x2RWtDSHF6Z2pEYWVzV2pjTGsxVHB0?=
 =?utf-8?B?ZXQ5aFhKN3VqdUwrTVUxcE1CSjROb3k4UThVejZBTzdKOFM0QlRGRm53V2Za?=
 =?utf-8?B?eUh2NkRqRUZnZFlrcmxlWS9CSVVWeVIyZlVQY2JHei9UUWMyOVVzMGFtczdu?=
 =?utf-8?B?NG5iUjcwK002aWFIRjdtQ2dxd1p0MVZjdzJLY0tUSHdRc05lT0drQ1JJOHcw?=
 =?utf-8?B?VWZqbVRYTkdjYmthY3ArZWl6WW8zbzNIWEhqYjF3UzdnbE1HVVVMRnAzamRE?=
 =?utf-8?B?UU1xSy94U216YTFLS0ZUUTc5cEdjMjMyMzU5NUE5NzUyMFdVZG9tdWZ3blUy?=
 =?utf-8?B?cGVTaVhEUzVua3Z6ZHMreTFKTVdUSEJWYzJueVJpR01zM0lkcmZ2SHhiQjh6?=
 =?utf-8?B?TllCeXd4MGpLZFRSZFVHOFFKUGd3UEh3UlNZSVVUMFZMWnNEdnM0R0RWVDNj?=
 =?utf-8?B?QXlxVi9FcjR1R3kwdXZYZ1M3TEZzTGtNQUVkZTZCS1dBdGx6SlNwaWNuaHlv?=
 =?utf-8?B?d1hSOFo4Mlo5cU1XODNWcVhlQkJwU2dYUUdlYjdId2dyYnM0SFFTWWE5SzJx?=
 =?utf-8?B?aUJmOEpiQ2sxZmQwV3JwQUtYcG5zY2c1eVBOVnZTN2I1VzFoMjJucWd1bWMw?=
 =?utf-8?B?ZFdsekNWT0NTZm05SGxmZEFCaFFLZkxFY3lqQmRmUVp4N3ZXcjdQUUxldUJC?=
 =?utf-8?B?ck1ZdGFxbEJVUFdkWXloMXQ3cmdoOTZRYkY1TDkrdElQM2FNc2VnZ3lIZ0p1?=
 =?utf-8?B?NDE3QnhNT21tSXg1cE1BcEJxSzFCZTQzem4vbFlTZUdmUGNFNTlkNjAzTE9w?=
 =?utf-8?B?OE9pN29wUDlROUlDUVp1ejkyM3h5ZVlNbWZFTk1FRVp1WGJ6d3pLdFVCYlhP?=
 =?utf-8?Q?h6nfpxg3+ilJoqdBdQgz2pY2s?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d759a62f-e1bc-47cd-0ef7-08de06271b2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2025 04:56:56.2644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P3LbF59w0NZsaWjyBxrzXdfvoIDiwBu0gF4U/okXczWlcCtVTkBgKVkbzEdByNdW9d9fF1/ZG+SGk391VbMrUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9191
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

DQoNCj4gT24gT2N0IDcsIDIwMjUsIGF0IDExOjIx4oCvUE0sIFRpbXVyIFRhYmkgPHR0YWJpQG52
aWRpYS5jb20+IHdyb3RlOg0KPiANCj4g77u/T24gV2VkLCAyMDI1LTEwLTA4IGF0IDExOjEyICsx
MTAwLCBBbGlzdGFpciBQb3BwbGUgd3JvdGU6DQo+PiArDQo+PiArICAgIC8vLyBXcml0ZSB0aGUg
YXBwbGljYXRpb24gdmVyc2lvbiB0byB0aGUgT1MgcmVnaXN0ZXIuDQo+PiArICAgICNbZXhwZWN0
KGRlYWRfY29kZSldDQo+PiArICAgIHB1YihjcmF0ZSkgZm4gd3JpdGVfb3NfdmVyc2lvbigmc2Vs
ZiwgYmFyOiAmQmFyMCwgYXBwX3ZlcnNpb246IHUzMikgLT4gUmVzdWx0PCgpPiB7DQo+PiArICAg
ICAgICByZWdzOjpOVl9QRkFMQ09OX0ZBTENPTl9PUzo6ZGVmYXVsdCgpDQo+PiArICAgICAgICAg
ICAgLnNldF92YWx1ZShhcHBfdmVyc2lvbikNCj4+ICsgICAgICAgICAgICAud3JpdGUoYmFyLCAm
RTo6SUQpOw0KPj4gKyAgICAgICAgT2soKCkpDQo+PiArICAgIH0NCj4gDQo+IEkgc2hvdWxkIGhh
dmUgbm90aWNlZCB0aGlzIGluIHYzLCBidXQgd2h5IHJldHVybiBSZXN1bHQgaGVyZT8gIFRoaXMg
aXMganVzdCBsaWtlIGlzX3Jpc2N2X2FjdGl2ZQ0KPiAtLSB0aGlzIGZ1bmN0aW9uIGNhbm5vdCBm
YWlsLg0KDQpBY2suIExldCB1cyBmaXguIElJUkMsIGl0IGlzIGEgcmVtbmFudCBmcm9tIGEgdGlt
ZSB3aGVuIHRoZSBmdW5jdGlvbiBjb3VsZCBmYWlsLg0KDQpJIGNhbiBzdWJtaXQgYSBmaXh1cCB0
byBzcXVhc2ggaWYgdGhlcmUgYXJlIG5vIG90aGVyIGNoYW5nZXMgdG8gdGhlIHNlcmllcy4NCg0K
VGhhbmtzLg==
