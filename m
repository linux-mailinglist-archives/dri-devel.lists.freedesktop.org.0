Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED1888C6B7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 16:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65D110EBA9;
	Tue, 26 Mar 2024 15:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="myG6GQ/w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2110.outbound.protection.outlook.com [40.107.243.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A0410F06A;
 Tue, 26 Mar 2024 15:20:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMY6eu42mWt+cXUmAitHvVkFu3kqe96OHS5+v7nP1jew+L+4X5Jlgz2PmEsIZW0DR0Y20+cFPiuE+u7lof4RI5aUMcCm1hhBZSzM8jCH6B+s32sr4JT5UrhIXSugvBfYqbAuVUYF+N1gHRV83lnlKXjucYWbo1U3uGTYf+0G7o6dFofOrgwYKpvwFqkazz8ODolV7JjxYjkDJbGMUqr0rffvvchnDMDA/LYP6IzrINvHTBDURyMFAMU4AU5zukqDbtq8Tvg5n4qlq2H54c8aRkRoKqMquFg3AsR/ZRLFfR+IIbWkjlZlQ31axTwa561idXDjdfBK0tZHXckTzL2BCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcMIuBFQHdoIikNGKO9z+KwsZLYoIsrGi0xg9/qbyhs=;
 b=BRIVux8IuLG4oEg0BaDif/K21xpzeHk6ClNoE4bdSoH0L8FO70rwB39iww8fZUVfF41o9La3HU2wduDAyHZNHopcScHqZQnBtE5kHbr0mnWSsh27VmO8chAyiP8NhIOxErEDE5VvHKgD3iMsM7Z2lrQj6v3fSgLeX23PbHk4IeDSPmHBsQppxa5SEDDhRSUfW5lPTEdDawDqHQ+DQvuAdf3kEWflnzvve7OEosuKiwrAeKidc+ipyeUyyhxeof0i9pAR+v7gMFRBvNSdkNAPxjLhMW1DJNm6jLnq71uEQlOjeA8IBertz+IyvU/lGJf6QeNOaRZbT/LyU9I/+LSxjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcMIuBFQHdoIikNGKO9z+KwsZLYoIsrGi0xg9/qbyhs=;
 b=myG6GQ/wUo3CG1VqRt3PdINGVBMoTQlMEUxrleXkZVOaa6GYw2RhiIf0hBxCJ0U30lIMW82GyiHV1kJRMi1dHAw+S0c4rjTmXGAupy3J5ceFnXLAm6A3zH0n6+6VHAoWBR0ogT5fIJ3TVfN3jZR88w83RAgCC0rabVw9QerMRe678Lq3Ij10IU/Tx4JowhQdN+4OPfzmCXUD0EqunWbjJT3fK4XOqHEDC9uOHhX/m0ql2jYHzupoB5c7UEjMWSR61z9UtjKSuDLMurCA166M8ZR7mklf9yMXMc3/E+qO8FFOp0S+OQxo6DsH05Ni5MAEk+IEro0NzK6c4lbmnl1Lxg==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by SJ1PR12MB6217.namprd12.prod.outlook.com (2603:10b6:a03:458::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 15:20:19 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::5971:c817:90dd:4fe6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::5971:c817:90dd:4fe6%5]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 15:20:19 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "masahiroy@kernel.org" <masahiroy@kernel.org>, "kherbst@redhat.com"
 <kherbst@redhat.com>, "linux-kbuild@vger.kernel.org"
 <linux-kbuild@vger.kernel.org>, "arnd@kernel.org" <arnd@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, "bskeggs@redhat.com"
 <bskeggs@redhat.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "dakr@redhat.com" <dakr@redhat.com>, "nathan@kernel.org" <nathan@kernel.org>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>
CC: "justinstitt@google.com" <justinstitt@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "morbo@google.com" <morbo@google.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "nicolas@fjasle.eu" <nicolas@fjasle.eu>, "ndesaulniers@google.com"
 <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: Re: [PATCH 06/12] nouveau: fix function cast warning
Thread-Topic: [PATCH 06/12] nouveau: fix function cast warning
Thread-Index: AQHaf41OXZXbwmWhTEG3c8WJBT8AdrFKIxsA
Date: Tue, 26 Mar 2024 15:20:18 +0000
Message-ID: <ddd9519fa51f95eb14a6dd3f2a4b7d67ae7e47a9.camel@nvidia.com>
References: <20240326144741.3094687-1-arnd@kernel.org>
 <20240326145140.3257163-5-arnd@kernel.org>
In-Reply-To: <20240326145140.3257163-5-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|SJ1PR12MB6217:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WXvTNdojPygfG6dhpCKwVatP0spNW/wQzo7AnaPae9g7/wWxLKpt4NMYmHcYhq5uqDYh9pAEhnarjfommEAuWHxQpyy4JrDAIscVHwTrrdXWseearDftrqLd5MuVhF1Zl3c/eVOBScjYN74KP9lT5M7FXKzmvXHcaKbAwO9IqQkGtH3msu7Ur2emz2H+tKGTpcph7h+eZ3v3NimY6Us1DbqGFoYqy/PCLyvAo9B3oldCi42krbpsD0xDGcNuz9KSmfw/ofvzZC5emmqSZHtu31VwhRuXzUS99ml8mJxz4Dlb15Rqhk6TAq1EE1XUFzpkTE3LXCfNLdfg0P2Nvkl5EbKfC2R6IMst40BTX99eG6+sEbmi4LbnSt72AaCQj1nWkUU58duw7mbdA6bGuxM8x8UCclQSMbDrUUltE9RonRufj6z0AsVCdfBLHXCZh/jr8GcWOeqWfQaFt8L5eUut6jLupRGe/YoCdm2jLBy1oeKTmCNdNplSiyjjvdwy8F4bFEHFYcTPaJ3QHtZfz8g0yPlINToGr2WYK7JTwPCwyD4GAWp88MvqIuOd59ezLysIfYwQjBwap/G09Zimfq1x2/FmW6NFXdI8FmVOSTNSYKapUApJam/RurO7s83NbTic4UMhhfFLDi7i3YxRGTjpgBMIncBfxFrwRJ5ZULbIfLkywn0YgWPx0a66ruOoyaJVM7vfyhNN1w1vbd3eOSbbwg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(366007)(376005)(1800799015)(921011); DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RnlpMW1laTU1L0hwMWdKbGhIS09yZ283eTVnVkZnZ2RTaTAzUGhYZmNnVHFL?=
 =?utf-8?B?RmUxNWpmSUxiUCtuVTY4VVFwZkU5eG4wZGt6M1lhNjJwWjZZNGlTYnlvT2cz?=
 =?utf-8?B?Ync4ZVlYZElMUFRpUkltcVZsNEs1MlpUeXJhbmMyMC9ZZ2lmZFBMZzlac0Q1?=
 =?utf-8?B?VnZQRVhHV3FDQ1pJWXJod2h3UzBwS3ZabWc5cHNxM0R3WmtrZjVmUlU1TE5a?=
 =?utf-8?B?UlMwZm1ERVVRb1VOUmdPaWttVlYvY3UyNDNyeG0yY1Rxd2lYb05qcUY1dnRh?=
 =?utf-8?B?a2dTRm00TU81UXpmaUJ1RjhlVmdqbnErNXJKYkNjNnJzWGVBT014NGpzaDhv?=
 =?utf-8?B?dUc0bXN0RWtxSTZiaEgvdUdNUEl2NTFXbit5a0FmOG1OUXoxOTVRRmdCQ3BI?=
 =?utf-8?B?bzh1T0pTaWNvK3V2ZFhFZVZOZjhNQUVHcnNxTk9wOExxUWxlVEJKS2ExQVpj?=
 =?utf-8?B?ZmQzY2IzbTduUVRncEFiRjd6Unh5b1B3UVVzTTlnT29qNFN5aG1DeFlZSTZ1?=
 =?utf-8?B?TzlOckVpMWp1UEluditKemhPWVIvSE9uS1NzcWxMYjBkVnN4ZjFWV2FZd29P?=
 =?utf-8?B?UjVFeU9NUENJaXFRY0s0QnQ3WnAreDdYN1ZUc0ZsR1p6WGFVME5uQTlsM1hX?=
 =?utf-8?B?NFpUc1I1RW1VRW42R1hHNG9hUmxvT0tJdmRVbDRENlcrVjAyNHAxKzF6dzZV?=
 =?utf-8?B?SmpDR0F2aVNobjBXbWtzQXJVVDFtVU8zdXp1ZFhHSGpXdTBjM2VQYVYvMnRI?=
 =?utf-8?B?UXZZTzBnRkgvKzAyMFZiTGxyZjMyRXlRUWJ2VzRFV3pqRklzYStqUmxlQ2JD?=
 =?utf-8?B?OEZVZ3k0QlYxMWp3QWMvblFja0J6QWxOQ0MzZ1E0RnlYSE1reU5kVy9GMjM2?=
 =?utf-8?B?ZUIyMGlzMmxodS9HR3J6Vm03cGFUbHBoYUNVWkUxbVREa1VrbXExUktLT09I?=
 =?utf-8?B?cEVmUFdySmRibmE3S3pNWkwzTGNjQWR1aEJnUGF3Q0pzdUhLWlpjall6R29B?=
 =?utf-8?B?R3NDWXIrUmNYa0VWaHhmSWNndWc5TWdEbEltVTJ5Y2l3akZmQzB6RnBJbW1l?=
 =?utf-8?B?NnFucThEZjBEY2xWS0ZvckZneDFhbGRwNzhIRW43aytUaGpIZlZzYUFUTmJm?=
 =?utf-8?B?QU0zZXFRMTF4L1loSUthNWlzUDRBSmVObHdTU0xQcmZhY1ptYy9LdS9tUjNv?=
 =?utf-8?B?Q0YyNmpESXJXRXd4MnB0Q09SRXpzNWpTQ2ZBV1JjKzNxektpaEI3Yzl1cGJv?=
 =?utf-8?B?SGMvYjhPWHNONElub21YdVZ1UG0xMTY3NGIrRzY3YnNObUxCSnFFU0M1WkJQ?=
 =?utf-8?B?R0VIeXlYK0pFdnQrT3MxMng1VWZqcm5hUlhhZFJFSkcxUEZNL1ZLcGdkSjFF?=
 =?utf-8?B?eUdFb0NvcjZQMGthTTRiUGdkd0MvMXVuYjJITmszbENOSGpJTm5HNVVtK0Nn?=
 =?utf-8?B?N2NkQ1VSRTRyOUxQNTFWZWRRdGVCdktaQzQxc1dzSFZMYURzQnNWdTEzZVI0?=
 =?utf-8?B?elR0akJacGEwM0oyRXMvbnNHbWFZT0RoUmFMZXgzRlIxWkRRblNWeElsbFdz?=
 =?utf-8?B?SkJpNmduR1JoTFBxSTJPKy9nTDhyODJMTklXTHZMZlBxNzdqT3kvcXZHdG85?=
 =?utf-8?B?N3hjWWhTZVFZQTJGdmV3RVNpVlJidjVFakV3MmYwZm9qL1VXZEJDNFgxQytr?=
 =?utf-8?B?THduV3pKenRCUGFHbWxiaFYrNnRrR2w2dVN5QWNUVmhKZEo1QkJGdFllL3du?=
 =?utf-8?B?UmlhOVEvcldTVlk2MzQzWDZHWm1tREVteUoxVUVzTmNscUEyN2V6WVlHWUt6?=
 =?utf-8?B?bGhUMW45VlJPSW9YUTJIeXJyUlIwckdMNkRuSU1OWXM4MExENmtWeFlueEdi?=
 =?utf-8?B?WU1nOGRGK0RJRWVnM1hIZ01na01WRlFkQlkvNUxoNklNRmlybEFCdVRTUDR4?=
 =?utf-8?B?MFg1SUVkQXNUU21scTI0VkZGb2tSRlVUdnM0R1EyM0p4QWFwY041cTJzVDdL?=
 =?utf-8?B?czdheEllenQxNktyOE1jVjM0dDFYQmo1MzYxVkp1RUhKdHRuRmZoTE90bU5I?=
 =?utf-8?B?b2VoeGNjRHdYaTBidzdvbCtpK2tUdGwzSVVVT0pxY1NMU3NyN2k0ZlhLSldM?=
 =?utf-8?Q?zd80GzJ3WoZjI1VOxH2/jkDfa?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82F94B90590D284AAD862FADA644723A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 332f3b20-f6fd-4fd2-250e-08dc4da83f38
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2024 15:20:19.0228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6IIxC9PRkQ3cEdj1IS+sgBnDxIprkRT4hjnEEBEl54lyIiKoNrhC/aS9xauaf1fZddTmXnUdzz0tG9UIKSR6pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6217
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

T24gVHVlLCAyMDI0LTAzLTI2IGF0IDE1OjUxICswMTAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOg0K
PiBDYWxsaW5nIGEgZnVuY3Rpb24gdGhyb3VnaCBhbiBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBl
IGNhdXNlcyBicmVha3MNCj4ga2NmaSwgc28gY2xhbmcgd2FybnMgYWJvdXQgdGhlIGFzc2lnbm1l
bnQ6DQo+IA0KDQouLi4NCg0KPiArc3RhdGljIHZvaWQgb2ZfZmluaSh2b2lkICpwKQ0KPiArew0K
PiArwqDCoMKgwqDCoMKgwqByZXR1cm4ga2ZyZWUocCk7DQo+ICt9DQo+ICsNCg0KSSBkb24ndCBr
bm93IGFueXRoaW5nIGFib3V0IGtmY2ksIGJ1dCBzaG91bGRuJ3QgdGhpcyBqdXN0IGJlICJrZnJl
ZShwKSIsDQp3aXRob3V0IHRoZSAicmV0dXJuIj8NCg0K
