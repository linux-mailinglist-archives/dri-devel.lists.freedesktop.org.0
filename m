Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2654F4579
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 00:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E695B10EF33;
	Tue,  5 Apr 2022 22:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1468910EF33
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 22:47:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfFoeAWi2sDx2zlIi4MrQ+YjcvXwHWHYFihhYrQVSQT39J18nAILsSZX3U5UTSSP0Hl0uQw7ds6vy1hwJ2dQNdq1C43DqsPFxTyLHo5aq8Pf9ZWhFpxu2zfANF36DzyyQ2mmkbClHcdawm9h9L7Z65tAGHr3hqPouKWXL8qSG9k9nyve9U0jsaYjA8H8LGi2A3YrxZwYI9+ORLfaInZP5pda1tYY2eytEHqZkZK3OvLybwbE9wCtBr+P+M6N80zdE0SZw6ia6TShgrCBePPAU0+WZiGBJdrSoiV9+f7eIsJ9Q7ZWp0zTapq6Iz5SRjkkxDua9ayxJLEG6g8sSbS0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGYb7HmvaPZfh8TSlTV2Hz0Ky5YHmeDB2tVdU5PuM0o=;
 b=WOzh/wUMyFXpquQ4xXLnPo008NzTYIalW508X5kvYLDbWzkaMWYtTeYTWHwCQ1YUJTQeu/WQvvWW7h5mB9kCkXo7qMP/mOOJECjA3MtluEnAHLndD+pDdrJZ+bsYXBAkgNSjAoCLAlZkj35zTl/+QBXlnMOj/DpvR9Zj/P18Z68f9k3VhTUl/VHCtq4SFyoDYxZCUE5qb0j4wEF7QuDWaGDlAIVATo3igTW/UIpv8qF7hS/n7Y1FP7psXWCyIZ5p+2T+YJorfGDBMa1Gqr6rsKeJYLw3HVvbW9C8j6BCD/vM+kwtmgQmIdZm5SIlhXPjOr4+IQeGc+9ingnbxMrErA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGYb7HmvaPZfh8TSlTV2Hz0Ky5YHmeDB2tVdU5PuM0o=;
 b=2RMiuJTUDiskPU1UglodeF36LxSOwXJfnfGxnCU+Vn6VJwoPGwkBK/TuUekQXa23BAhLiD8eUvy/pQQnoOZ2s5ncb6et58KIkPmsV1AZv+oOdY4lEY1C7XIjOvJr9+eDAlSjd3zcrnDTpRba+h5/YhFPf5XCT0bvAwtcOrL+EWA=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by DM5PR05MB3196.namprd05.prod.outlook.com (2603:10b6:3:cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Tue, 5 Apr
 2022 22:47:52 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::c0e9:29ea:8618:834c]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::c0e9:29ea:8618:834c%3]) with mapi id 15.20.5144.016; Tue, 5 Apr 2022
 22:47:52 +0000
From: Zack Rusin <zackr@vmware.com>
To: "michel.daenzer@mailbox.org" <michel.daenzer@mailbox.org>
Subject: Re: [PATCH] drm/atomic: Convert a warning to dbg atomic printk
Thread-Topic: [PATCH] drm/atomic: Convert a warning to dbg atomic printk
Thread-Index: AQHYSFDL1w9LOO3EfUqTzTYgFMJQ1azhj04AgABebIA=
Date: Tue, 5 Apr 2022 22:47:52 +0000
Message-ID: <5752c3fd9f901a722e3ea9210127118ed22c97b4.camel@vmware.com>
References: <20220404182115.18849-1-zack@kde.org>
 <4f5cd810-39e1-1c1f-4dd0-480fd6689d5c@mailbox.org>
In-Reply-To: <4f5cd810-39e1-1c1f-4dd0-480fd6689d5c@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3d7e838-6225-42ff-2e11-08da1756512a
x-ms-traffictypediagnostic: DM5PR05MB3196:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <DM5PR05MB31961C490DEF023B95F7DDA5CEE49@DM5PR05MB3196.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 32vhTY2RCO/72Fghh43mWjy2SaNZTFmwpZr6h07bR8XzUMIUCyUf2DaJDIoXCb44JttkI4RM3SXMCUaYpzWzTsMYbLVnuPSJON6qHEfhlnQmS6imq9foROUSS05APSgUEPsArQbOS59ryo144aM1td7Af3G1+/s8ZtxM7UJMcy/84hHI93drko4auEeAg8LRpcD6VnIvImAB8Zm6Sc1pru4rAkNXcLNahdly0QJ47CJc2K4rkSeGbVraHlxor0sjrwat9baFVz3dYR5e0Ye1DevE/FI9XRAwor2OEX8DKH3dl26HB3LwQCfeCyup6DoZRo4Eu4z76GrfL13OhPiINh+NrmQZyvZCLg7tkAIoLhk/Hu0SQb0qzzV8yP1mkGVG9bjFIRZ6wgdX+eudfVZHBOXVFe/8WfGSkf5L4HjTLC0txckykNo80bw5G4kHlDqTU2EPGafm9QD+SEQdg/d6uUKrMWxVH3cQ6zbYVtRWtb8ssnBYL2l0UVfj3FGBw763NJQxf93euB9UQHVyM9gSMZl9Yn+MlYuNviXknbZmzF4aSKFRGsG78pCeIWzpMBKzIzFTdIyq6osMP8y7jT9YMXkCvntuN4CXnDHYzSOzVJdgv/CektSSuhFs8AlU0InsvOu3xoUGA/JfUOVpBV4fKsSwa8RJ6+PPK3mWpxhr2oga6geP1N+CH7jc2+GtRQH4LcI7bHnBraQFfiF2+hA3oA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66446008)(66476007)(66556008)(66946007)(76116006)(54906003)(6916009)(64756008)(86362001)(316002)(122000001)(6486002)(508600001)(38100700002)(5660300002)(8936002)(26005)(53546011)(2906002)(186003)(83380400001)(36756003)(71200400001)(4326008)(38070700005)(8676002)(6512007)(2616005)(66574015)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXRDSGdkMWQxS1FiekZIcHZrc09YOG80QkRSek5NTXl4NG53SVRIREFDNGtp?=
 =?utf-8?B?MWZjdGFyMUN5ZnRxWVA1MCsyK0xyMFc0djF4ZWZhZVlVbGdBMm5YZkZLSzRi?=
 =?utf-8?B?ZkVvZTBMWVRmSWVNT04xVXJhenZ0Sm9kNjRsLzN4MlV5aDZQejZleVBHUVF2?=
 =?utf-8?B?YWZKK2lDV0dhczhUY21ZN0tUUW1wTWFmMXUyVVdXUzFZUHFmMEZiVlpQZXBh?=
 =?utf-8?B?N2l5NXRtU3ZtZ2hKMmE0RFNGeEM1eEZaZklSNWxDdXZ5NnAvc0Q0cmpoamxW?=
 =?utf-8?B?L3BXNHFHdmNKSlR3bzdFSFkwcURWOFZPQVFkTVd5cVNsamJnZ1F6ajl3dzhH?=
 =?utf-8?B?b0x2THBOenR5MVRNQ0Q1S1dzTHozWWVkdURDL2RsMlBDeDVrTUhYWU1aTWdL?=
 =?utf-8?B?ak16RHZacU1KU3JnMy9COC9JZm5BbFY0a0wyMys2RHhnQUw5WEFPbGR6L2NE?=
 =?utf-8?B?M2pObTNjTG5zV2l6ZUY4NTR2OVdNNDRrR0RFT2RteVJkbmMreXFCUCtwK3lT?=
 =?utf-8?B?YVFJVlNsNzlMd0hscUFNNWR4a1c5KzF4M1dsWVBDSjZkRG9qbFhFaUZ1MHNl?=
 =?utf-8?B?L0ZqZExoeG9BMXlrREp0ZDlvWTM1aVl0bkE2bFIwaXUzbUdDNitTT1NWNFU2?=
 =?utf-8?B?R3Y3WTZ3RUVhVmg4SiszbWV6bnJyakRFdEdJOHcwY1RWUjhNaGVCdXhKcVln?=
 =?utf-8?B?MlNMYVZLUml0QjgwNkdqVkpDUkNDUTBaaFhSSGNJajZvTFc5RGZOcUYzemwy?=
 =?utf-8?B?ZDVJN1IrendmeERnR3JwR0VKN3IwRytDSStOM1hjdW5PVS9zNnNncERrY1FV?=
 =?utf-8?B?OG1XL21GSzNSdFY2ay9PVUZtbmV0R0hLZk96TXdjU1hydlBwc0FJRlBRQVNX?=
 =?utf-8?B?dklFeDh0T0g0V2ZsZzBTLzV6VG8yYUdrSHlBL3VmZWN6RlAzUXd1dFNqSHNi?=
 =?utf-8?B?RkdQZUJ2TFdXcWhVQm5VTFJvTzRTQUZxTTRtdDZML3J4Y3BZYXVnLzhCa0sz?=
 =?utf-8?B?Z1ZRVEs5R2E0WlNqRW1xYzhCRXF5NC8zbVNFNzJCRklzcXBqZFQ0THB4bHJ0?=
 =?utf-8?B?aENCMEJlUGdKSFVHdHAwK3Y0RVJXRzBaSmVubWdSeHFCT3NTaDJ3dHUvS2t6?=
 =?utf-8?B?Wjg3ZW5zMFNsd0hBM0Z1KzJKUVFNOU12NW5vcjlOeTRzVERaNVhoRjRsZms3?=
 =?utf-8?B?cWVCNm5LQlZsWXJaUWk0Qm1zNzhEa3Nwc0M4SVVKcHlnbm8wakUraW1wUW1p?=
 =?utf-8?B?aklqeHRHYmxCNU9zK2N1TkhnaXM3WTNjZTdMOWpVMmhnbHR4VHJmRE16Ymdk?=
 =?utf-8?B?SEozSktGbS9UV1h1YU9Xa1h5T0dnT0hyc1RLU29mWHRkSmN1MGVYWTdPR081?=
 =?utf-8?B?TVZSbkovSHUzUGRxWm5BZ0huSjB1ZVl0SHl0aTE2WFo4cjhtSExxNTM0MkJv?=
 =?utf-8?B?RyszVzFCQjVHRmp1MWwybGE4aWprSjRxK3VsMzJGWisvK045SWNIKzRkWUhP?=
 =?utf-8?B?Q0pkWnF5anUyenRaNTF6UmdwMmxpU0EvKzlzMytUMmlUU24zelptV0NWTmZy?=
 =?utf-8?B?TnlFb3hJZTdxM3BCNUVkMFdXeTg2Z3ZkbWZVZnFnZVBLaEw2RjI4TTFJUDI3?=
 =?utf-8?B?N1Q4Y0IzN0M4Tm5hdkVqOHdWZWxTbGV2STFQODBCY0E4cmRzUmtVVlIwa3VC?=
 =?utf-8?B?L0ZKUVpNc1VxYjZGUExmZUhBeTB1M3o3S2RUekdvdVg0SDVhRXk4UTN3Q05U?=
 =?utf-8?B?YzB6WjhiTXVqeHV4YkNreWl0aFp6S2VyT09ITnd3TkpiZTJDcG0xdzZYbk1I?=
 =?utf-8?B?K3d5cDhnMVI4d2pLMGNzVjlIekJ5QmF3UHhhaVVDQ0lGME9zUEMxc2N1ZHVT?=
 =?utf-8?B?TWlabVdSVDJZOVFQNGw2TTNCaTVBNUpoeTJmWGY0K2hNZENxWFVoYnJZMC9y?=
 =?utf-8?B?dFpXREE5cGhTZ0E4bXIrK3dpK0pDaVFBSTErMGhsYzQrcStYcUZXa3ZGWno2?=
 =?utf-8?B?SmFDTVhTZkVDdDFVNXRITld2M0prWXJ4TU5WcnhKMS9yTWNLYlQ1d1Q3Nk91?=
 =?utf-8?B?cktqTklCdGNITkN5cWpkc0IvYWZEOXQ0MGF2dGtWblVYZ1dkdS9kdFltVWlW?=
 =?utf-8?B?elRXWEx5YWRiUmd5VnQ3TmpndHpRdml2eVRRTEdieUF5L005TFFTYUZyVWhG?=
 =?utf-8?B?SW54MzJYampKakpiRHZjcHpKTVpDKzJ2Z0l4YzdUclNQR2R2c0p3aDE5VGlI?=
 =?utf-8?B?RVZuai9ucjdKWVg2MjNqYlp6R2M5Unpyd2JGUXVIUUI2c1YyOEdXSVAxZUJn?=
 =?utf-8?B?RjFKQlk3ZU9waGVXVDZpamtna1RPMlhhd055Zm95U1BqUVJZcTNOUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63B1E2634326A7498FAFE23EF5AAD836@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d7e838-6225-42ff-2e11-08da1756512a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2022 22:47:52.1910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jQ5ZiXL87SF2l5m3LR5BAFdqSa9Ty5nQVkGiCjHUQuPHotEL9hmWEntusXSMwo2lUwkWakuU+vEThZVS71aFSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR05MB3196
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, Martin Krastev <krastevm@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIyLTA0LTA1IGF0IDE5OjA5ICswMjAwLCBNaWNoZWwgRMOkbnplciB3cm90ZToN
Cj4g4pqgIEV4dGVybmFsIEVtYWlsDQo+IA0KPiBPbiAyMDIyLTA0LTA0IDIwOjIxLCBaYWNrIFJ1
c2luIHdyb3RlOg0KPiA+IEZyb206IFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5jb20+DQo+ID4g
DQo+ID4gQnkgZGVmYXVsdCBlYWNoIGZsaXAgdGltZXMgb3V0IGFmdGVyIDAuMSBzZWMNCj4gDQo+
IDEwICogSFogaXMgMTAgc2Vjb25kcywgbm90IDAuMS4NCg0KWWVhLCBzb3JyeSwgdGhpcyBlbnRp
cmUgY29tbWl0IG1lc3NhZ2UgaXMgbm90IGNvcnJlY3QuIEkndmUgc2VudCBvdXQgYQ0KdmVyeSBv
bGQgZGlmZiB3aXRoIGEgbG9nIHRoZSBiZXN0IEkgY291bGQgcmVtZW1iZXIuIEkgcmVjYWxsIG91
cg0KY29udmVyc2F0aW9uIG5vdyBhbmQgaWlyYyB3ZSBzYWlkIHRoYXQgbWF5YmUgYW4gaW50ZXJm
YWNlIHRocm91Z2ggZHJtDQphdG9taWMgY29kZSB0byBlbmFibGUvZGlzYWJsZSB0aGlzIGVycm9y
IGlzIHRoZSB3YXkgdG8gZ28gYnV0IGFmdGVyDQpsb29raW5nIGF0IHRoaXMgYWdhaW4gSSdtIG5v
dCBzdXJlLiBNb3JlIGJlbG93Lg0KDQo+ID4gYW5kIGEgd2FybmluZyBhYm91dCB0aGUgdGltZSBv
dXQgaXMgYWRkZWQgdG8gdGhlIGtlcm5lbCBsb2cuIFRoZQ0KPiA+IHdhcm5pbmcgaXMNCj4gPiBo
YXJtbGVzcyBiZWNhdXNlIHRoZXJlJ3MgYW5vdGhlciBmbGlwIGNvbWluZyByaWdodCBhZnRlciBi
dXQgaXQgY2FuDQo+ID4gcXVpY2tseSBmaWxsIHVwDQo+ID4gdGhlIGxvZywgZS5nLiBtaXNzaW5n
IDIgZmxpcHMgZXZlcnkgc2Vjb25kIG92ZXIgYSAyNCBob3VyIHNwYW4gd2lsbA0KPiA+IGFkZCBh
Ym91dCAxNzIgdGhvdXNhbmQgbGluZXMgdG8gdGhlIGxvZy4NCj4gDQo+IEFzIHdlIGRpc2N1c3Nl
ZCBiZWZvcmUsIHdoaWxlIHRoaXMgbWlnaHQgYmUgdHJ1ZSBmb3IgdGhlIHZtd2dmeCBkcml2ZXIs
DQo+IGZvciBvdGhlciBkcml2ZXJzIHRoaXMgbWVzc2FnZSBpbmRpY2F0ZXMgdGhhdCBlaXRoZXIg
dGhlIEdQVSBodW5nLCBvcg0KPiBzb21ldGhpbmcgZWxzZSB3ZW50IHdyb25nIHNwZWN0YWN1bGFy
bHkuIEFzIHN1Y2gsIEkgdGhpbmsgd2UgZG8gd2FudCB0bw0KPiBzZWUgdGhlc2UgbWVzc2FnZXMg
YnkgZGVmYXVsdCBmb3Igb3RoZXIgZHJpdmVycyBhdCBsZWFzdC4NCg0KSSdtIG5vdCBnb2luZyB0
byBhcmd1ZSBmb3Igb3IgYWdhaW5zdCB0aGF0IGJ1dCBJIGFtIGN1cmlvdXMgd2hhdCdzIHRoZQ0K
cG9pbnQgb2YgdGhlIG1lc3NhZ2UuIFRoZSBtZXNzYWdlIGlzIGJhc2ljYWxseSBzYXlpbmcgInNv
bWV0aGluZyBjb3VsZA0KcG9zc2libHkgaGF2ZSB3ZW50IHZlcnkgd3JvbmciLiBPSywgd2hhdCdz
IG5leHQ/IEVzcGVjaWFsbHkgaWYgdGhlcmUncw0Kbm8gdmlzaWJsZSBwcm9ibGVtcyBhbmQgaXQn
cyBub3QgcmVwcm9kdWNpYmxlLiBFdmVuIGlmIGl0IHdvdWxkIGJlDQpyZXByb2R1Y2libGUgdGhl
cmUncyBub3RoaW5nIGFjdGlvbmFibGUgZnJvbSB0aGUgbWVzc2FnZSBpdHNlbGYuIElmIHRoZQ0K
c3lzdGVtIGhhcyBubyBvdXRwdXQgY29ubmVjdGVkIGFuZCBubyB1c2VycyBhcmUgY3VycmVudGx5
IGxvZ2dlZCBpbiBhbmQNCndlIG1pc3NlZCBhIGZsaXAsIGRvZXMgaXQgbWF0dGVyPw0KDQo+IEkg
c3VzcGVjdCB0aGlzIGp1c3QgcGFwZXJzIG92ZXIgdGhlIHJlYWwgaXNzdWUgZXZlbiB3aXRoIHZt
d2dmeCB0aG91Z2guDQoNClRoaXMgZ29lcyBiYWNrIHRvIHRoZSBhYm92ZS4gSSB0aGluayB5b3Us
IG1lIGFuZCBEYXZlIGxvb2tlZCBhdCB0aGUNCmxvZ3MgZnJvbSB0aG9zZSBidWdzIGFuZCBub25l
IG9mIHVzIHNlZW0gdG8ga25vdyB3aGF0IGRvIGRvIGFib3V0IGl0Lg0KTGFja2luZyBzb21lIG90
aGVyIGVycm9yIG1lc3NhZ2VzIHRoZXJlIHNlZW1zIHRvIGJlIG5vdGhpbmcgdGhpcyBlcnJvcg0K
YWRkcyB3aXRoIHZtd2dmeCBvciB3aXRob3V0ICh3ZSBoYXZlIGJlZW4gYWRkaW5nIG1vcmUgbG9n
Z2luZyB0byB2bXdnZngNCnNvIGhvcGVmdWxseSB3aXRoIG5ld2VyIGtlcm5lbHMgd2UgY291bGQg
Z2V0IHNvbWUgYWN0aW9uYWJsZSBlcnJvcnMgYnV0DQp0aGF0J3Mgb3J0aG9nb25hbCB0byB0aGlz
KS4NCg0Keg0KDQo=
