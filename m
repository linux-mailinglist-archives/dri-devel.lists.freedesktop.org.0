Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E133B85C51D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 20:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FA810E53E;
	Tue, 20 Feb 2024 19:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cqGZ5Jcg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2068.outbound.protection.outlook.com [40.107.100.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9CA10E53E;
 Tue, 20 Feb 2024 19:45:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/3LQUlNUGmyFs/9Zbfsge6kygBJLAjJXskylONHoZCg76nXymaFqTtAQo5BC7RuAE7XmLDaFG6Th4ne/XjSJyZkwgGauv7SCREZ04obO/bBULSfBqM7d4VD3NrO1spLJiy2OmrzQuyJlP8UGGwmVBrSEeqOEEK+LR1D7BHjPTmhunqdHFtsmYUQnvH4OKa8/Uqk3jS0WzqGOhaJgP99iAoodA5/uzjJfNFOiLZUTNPH9+OX5dOYDDTt8Pp5jNkY2GkYmptn0MSfEvHJILPFLGjPe+VWsCk6X59UU35E4fIM6iLZGoI/lsEDTxoBWFJE0SO43CPzF5zBRg8VLwpRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BmxqqS/qYzIeryGvMCLcM3BJ5emaLaFYSGKdnItvec=;
 b=gt6pj8CwzGgpAolswmbdrKGTcWvE3sgNEh224wvkU0N8idIfEjIc3uUAuATSlo3bnZmJVEuUmSpk6cbO+9X2qKljfHGV5h+pAtFu3WYvZyqB+2QWU8JRYE639AaGQesRfrlViz3TLMM9RNMFY6eQIvnJX8pkoE/VENsyP3n/nb3z5KcGRvz0ifbuOdmY/qAHE1aP6ajgYBlEN5bI/bs1qTZ6NeqQ8dcq+kgulWbrd9VjpIYTW0iUztZCOSr5gsDMw+Tp3ivnWod9oH0kLXVTnS+YqNEN48H2gHCTo6Bs+KPGkoi6xFn6u7cf3bmTX4Yy8iM5xCiwZBsG79gN6p2Ibg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BmxqqS/qYzIeryGvMCLcM3BJ5emaLaFYSGKdnItvec=;
 b=cqGZ5Jcg0EcCewDG8zxwsPzx+QqjQCLNZ8TjbpdAm8+q/zdYDrkp85wmNjDsR56iihCsudVFoF803raNG8diocKU6uaHq304ysfNiP4N7swS+G85IjbKXrNMRH4FySdBV/kHD+7nX+s5fT4DepOdKoIiZX9xir7+yXBevHRM98rRrDfXljoxI1XfErf4O3f4yWH/Th9b7zzP8C2w3q7RUrcYfzTx1U7Ix+voosC7C/EY8Bnd1HS15z++cyD//EIFEB2XM9+HkNuq6YxgjgEn/DtpBU7RWToAiRapnEdT8A07AjSItPK0s0l6FZJLV35MT1B5Zb/vEGqRGjV8UGpLhQ==
Received: from SJ2PR12MB8782.namprd12.prod.outlook.com (2603:10b6:a03:4d0::21)
 by MW6PR12MB8705.namprd12.prod.outlook.com (2603:10b6:303:24c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Tue, 20 Feb
 2024 19:45:29 +0000
Received: from SJ2PR12MB8782.namprd12.prod.outlook.com
 ([fe80::df23:2eb6:6485:e434]) by SJ2PR12MB8782.namprd12.prod.outlook.com
 ([fe80::df23:2eb6:6485:e434%4]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 19:45:29 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@redhat.com" <dakr@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kherbst@redhat.com" <kherbst@redhat.com>, "lyude@redhat.com"
 <lyude@redhat.com>, "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau: don't fini scheduler if not initialized
Thread-Topic: [PATCH 1/2] drm/nouveau: don't fini scheduler if not initialized
Thread-Index: AQHaVWujZdZ67CmKRUWEtG0ranjbRrD3S7cAgBNKHoCABux9AIACPYwA
Date: Tue, 20 Feb 2024 19:45:29 +0000
Message-ID: <2ac14f50f2286f2b440e3a124eb1763e91d513de.camel@nvidia.com>
References: <20240202000606.3526-1-dakr@redhat.com>
 <eeecdd4b5daff8a831b6f11671a2205504e5173a.camel@nvidia.com>
 <0cabb3e4e1f00dd0b0b3328a4da9bc8fa3ba6929.camel@nvidia.com>
 <01ff9bf5-0206-4d5c-b799-6213529fc26b@redhat.com>
In-Reply-To: <01ff9bf5-0206-4d5c-b799-6213529fc26b@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB8782:EE_|MW6PR12MB8705:EE_
x-ms-office365-filtering-correlation-id: 6df65b75-edd2-4762-e6e7-08dc324c7dfd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZMo/l1Dkf6Bk2TH1Z/uBm42pRBk0S9HTVwt7F+gCi03ztEx46io3vhibxsVnKNC9MEgzKWt4iVM5ZOQcp8fyqOJQjQh9XyYL6GlZTajBeNlrjMgRKlKO0n+x0ENySIZKaoSSAzdju74TytSsx3ie1QJ3kjHe4hF5DBN0gM5i3neqGSiuZYKiGdfddEXJ0TxJzIluPCCd0fjisr70ZcjB4Hr+MkbYt+I6goeXwJIGqBQJ3nuRR6ON3DQY5Z92i9rn/KD5tHpmkXF5RnlesD32KS2y2TJtauo8uVfxXwyCJcGY5i6Uz4PHC3d9PQ9tvFjNc5IE0kHQygziQtj/z7F+L+DJsHwIEpfX5NCkjgUPL7lxcsSo7fc7hLhFccPtbo8PDoDEoDCB0KJIdOQ51t75sX+d+F5MNwwP3yfdlUOc4rd4WONbtJhuF1txQsqtD/nTniCVHmitxsvI9BneVJ0LA9UwXkMLUQ/f2Zujp26gzML3e3wVhc+76Pww8fs0FCu79m4JAUhhQO2gJIM+/wLXbnwe8v0eF8pyA2b+KO0d9XofodTBfho6EZSr2IiVUhd+CC5/FmKBbuzAHOEMeofGNZWL8e2IFh8UZhyt0H22iVk6Nb3uKzoqbujw+5M7c5pS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8782.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzBQVkg3NTVpODR6ZUp1MGYxT3RuaUlLU2pURTdhMkhuZDBkRkxJcllqWmpW?=
 =?utf-8?B?UVB4a3g3alNSbGJYMHhaeDdkeFlERGc3TUQwQnJYbjhTV05sRitIcHFSc3Jq?=
 =?utf-8?B?dWY5SVI1czhMSEs0VWhKbG5aK2VlRWwwZW81bFBCQ2VPNUxSZWIzZzZhb0Jt?=
 =?utf-8?B?Q3JScmhYWEFtN2dybHBFUWh4c0F1S3BmUkZoS3VJNENDYnJkbjNLbHo4Q0RI?=
 =?utf-8?B?SERxSDNCNGM4TmpTa2JhYmFVMTRaVEh3OFBCUzhnZ3Q1RTZvYnh2S2pHUWoz?=
 =?utf-8?B?UCtTSk9sT04vK1RITUVSNXFNWGJNODM2NFluQTFwdnN1dGZyaTk3bVI3cURm?=
 =?utf-8?B?MlBPQWdQK3M4RVE1UHdCK3I5UzlhOWp0TnFpc2RjOFJGU0pHUURLeDRNTG5K?=
 =?utf-8?B?UlRIMG5mbi9PNHRObU5OWmVCNDJoRGExR3FwOEVUMzBVRndBdXg5TEY1SkxI?=
 =?utf-8?B?WUZLVkI3eVhIcExnL1V3MFlrVmY0b0ZMSG9DcDkydzJ4TEV1MXdpZGxyNWxD?=
 =?utf-8?B?QlNYRlcvRzRzMUdhV210QWJHM2tOQUk4UG5SS2lXcmo3SDY0ckV6a0FOUUNP?=
 =?utf-8?B?SFhURDE4MHF4Q3ZuZUpJeUJmNUhRQm1ualQ3OE9xUXpCYy9ZaUVwcE9WL1By?=
 =?utf-8?B?YytVWXpueHpxSTViam9jYkdnNEhrcklBdWt1YlpTSmtwaVhEdytabzE5ZVlk?=
 =?utf-8?B?Q0RtejJxTXZTMFBRL0VMZ1FuTjU3Vk1ESXZIUzQ2bGROUXY2M2lIMmozL2hR?=
 =?utf-8?B?dDFYQ3hPV0FkMzF0SUVzWDlkc21nai8zODVQYXdsNkVkR3hZUmloVGh4amRI?=
 =?utf-8?B?ZmtUTml6STZ6RUdiRVBaVTl1RkZyR2RVOXdEdFEvWlpKYnpGWEZ1UEFNcjJH?=
 =?utf-8?B?R1R3Y2ZkNys2cHovd2dqbndxcEg4UXlTZHRnWXpmOGtZMUVTWHdKdnRLeTA5?=
 =?utf-8?B?c2prMnE3aUN0dFNUd2U1dUVTeXBEakw1bWR3UzV1eE1IVGgvUmRXaHFpcDdv?=
 =?utf-8?B?VkVVaTFhSThlaVQ3d1Rab0pRb1RFVDVMa1REQkd0QUJoMTRYZ3lXWlQvK1pK?=
 =?utf-8?B?ZnI4dVREL056cTFQQW8wc0FlZ05OVi9TRHdFWXBkMDc0THluYTE0czljeWly?=
 =?utf-8?B?TTF5dmwxWFF1UmlyL2ZSaXQyMHVxWDJKT3dsTHA3Ui9oeVJPSXRicnZtYmpK?=
 =?utf-8?B?RitjRHJaTWE3SjR0Sk5uYXlCQVk4OTVXZ1ByMmpCOEg1bzJSZ3U1VkZQY1k2?=
 =?utf-8?B?TmxzSWtmZ3l3SnVFR2RkNTVDS1V4MkN6a3VpYk9VczdNRHNIWkZOMHNkYmNV?=
 =?utf-8?B?ODh1aldsMmFyc1dVVHRZRWtWTm9MMHBDeCttZ3BHalZTN0dRK1BxQThUOFY1?=
 =?utf-8?B?UmhvZjRrUDAvSjl2TmwxdmRKdWxpWXRNcnJTTDhXcUdaUFA4MzdmODNBOWZZ?=
 =?utf-8?B?WDlaVExRRnRzMlQvcTg4MmI0dmdaemlNejJzSXJuRExia016SzJ4dVQ4ZEt0?=
 =?utf-8?B?cEMyZ2c3SFpmZXdlSGRRdmlSZFBvTjQrY3hyWTh2TGV0WldaSHFxM3dhOHQ4?=
 =?utf-8?B?Q2pOU1JTRXFPb0tvTXVOYysrYm14Sm1WbGYyWUZ3OGtrakd3dkRXREE2Tkdn?=
 =?utf-8?B?WnJnRlp4V0hmZ0Fzd0NQajYxR2tsOE5kSzFpbkR0VmlVN0ZNTDZCcEIyRHhz?=
 =?utf-8?B?TGcrMU5uSmQ3TVkrUkxXL2J1ZVNiSjVlM2FEcmdkV0E2NXlPRU1vTENpREdM?=
 =?utf-8?B?RldCUTl0RXVjTENDMFRUSGRxekNhUmZPWCtkbzFjdEhyWCt0MHhlTnZQOTIx?=
 =?utf-8?B?MTdYYnl4ZDd0UEppSXJKZHZ0bUl6L1BNQisybmsxSXFTckNUMGYwem1qeWZP?=
 =?utf-8?B?OWUrRG0zVkI1QVAxK2doQ08xV2N4OWFKcTVibkNKUWlwZlZjVFUybkNZbjBv?=
 =?utf-8?B?YTZ6TTJZKzFHQ2xOcXlXSU5QeHlyUmg5ckhKMmV0N0lHSHpmZXAxY2lzd3Ja?=
 =?utf-8?B?clFoNFp5YzBoUGNid0d1QjBmTmQxbTY3R0hlTHFITnN4K3k5YU5nSlFoenFn?=
 =?utf-8?B?SE92K00xMzB4azUrN2hUTC9HYUdFTXJXVlVtNmRvYk1xeXU5eWxMT25PSnpy?=
 =?utf-8?Q?wly78zQzPMjJ4dYkDS7a4yYKg?=
Content-Type: multipart/alternative;
 boundary="_000_2ac14f50f2286f2b440e3a124eb1763e91d513decamelnvidiacom_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df65b75-edd2-4762-e6e7-08dc324c7dfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 19:45:29.2317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z7762ieSPZU5wo3n0EHsTzXxTd3rCbtKRC+F/bzITIQiTnwBsSLgA0Q0imbn8nf0BfDUcWrlHWmQ7t6u2hkfUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8705
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

--_000_2ac14f50f2286f2b440e3a124eb1763e91d513decamelnvidiacom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI0LTAyLTE5IGF0IDEwOjMyICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KDQpMb29rcyBsaWtlIEkgc3Bva2UgdG9vIHNvb24sIEkganVzdCBoaXQgdGhlIHByb2JsZW0g
d2l0aCB0aGUgZHJtLW5leHQgdHJlZS4NCg0KDQpEaWQgeW91IGFwcGx5IHRoZSBwYXRjaCB0byBk
cm0tbmV4dD8NCg0KVWdoLCB5b3UncmUgcmlnaHQuICBJIGRvbid0IGhvdyBJIGdvdCBjb25mdXNl
ZCwgYnV0IEkgY291bGQgaGF2ZSBzd29ybiB0aGF0IEkgc2F3IHlvdXIgdHdvIHBhdGNoZXMgaW4g
ZHJtLW5leHQsIGJ1dCB0aGV5IGFyZSBub3QgdGhlcmUuDQoNClNvcnJ5IGZvciB0aGUgbm9pc2Uu
DQo=

--_000_2ac14f50f2286f2b440e3a124eb1763e91d513decamelnvidiacom_
Content-Type: text/html; charset="utf-8"
Content-ID: <7431EE185E647447A26A507CA7FA9195@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj5PbiBNb24s
IDIwMjQtMDItMTkgYXQgMTA6MzIgKzAxMDAsIERhbmlsbyBLcnVtbXJpY2ggd3JvdGU6PC9kaXY+
DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7IGJvcmRl
ci1sZWZ0OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPGJsb2NrcXVvdGUg
dHlwZT0iY2l0ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4OyBib3JkZXItbGVmdDoycHggIzcy
OWZjZiBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxwcmU+TG9va3MgbGlrZSBJIHNwb2tlIHRv
byBzb29uLCBJIGp1c3QgaGl0IHRoZSBwcm9ibGVtIHdpdGggdGhlIGRybS1uZXh0IHRyZWUuPC9w
cmU+DQo8L2Jsb2NrcXVvdGU+DQo8cHJlPjxicj48L3ByZT4NCjxwcmU+RGlkIHlvdSBhcHBseSB0
aGUgcGF0Y2ggdG8gZHJtLW5leHQ/PC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8ZGl2Pjxicj4NCjwv
ZGl2Pg0KPGRpdj5VZ2gsIHlvdSdyZSByaWdodC4gJm5ic3A7SSBkb24ndCBob3cgSSBnb3QgY29u
ZnVzZWQsIGJ1dCBJIGNvdWxkIGhhdmUgc3dvcm4gdGhhdCBJIHNhdyB5b3VyIHR3byBwYXRjaGVz
IGluIGRybS1uZXh0LCBidXQgdGhleSBhcmUgbm90IHRoZXJlLjwvZGl2Pg0KPGRpdj48YnI+DQo8
L2Rpdj4NCjxkaXY+U29ycnkgZm9yIHRoZSBub2lzZS48L2Rpdj4NCjxkaXY+PHNwYW4+PC9zcGFu
PjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_2ac14f50f2286f2b440e3a124eb1763e91d513decamelnvidiacom_--
