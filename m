Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFC77D9828
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 14:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F2910E999;
	Fri, 27 Oct 2023 12:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2065.outbound.protection.outlook.com [40.107.20.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA4E10E999
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 12:30:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dADfza7UzDvZpyDXfcSgmzZyuAz2zTuA8EtOmKrpHmnnGn1aBDftHsa/S2Q9VJ42GSu0/Ivp6e2DH0yWNdl/gT8EJM+GR0TswaFijKlXvi6ZLt/jdKzRqPh1BikYzDnIfO7X/4z/G0Yw6NN4c/+pBmyT82Vf6n05dk4AL81oXoMXzZu52QA2OkgSj0VNcBrnkpGGbwkcDVqwTBz7iDNx5t3E2SQnJA3Ai0+mI/9zoxsshvk+q50qumTw56SocJ3I4E1E6F1Expwv62JDQAoaPxsV4/4XOlpbyKuGPMoNC6EbmPTuXNQeGEyoSPjHH4aBAPWh5agP79W5Chq9THmWuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vf/hFbWsp9b4fq/RDb9H+U9cBrJGw1HaJJeuto3Joy4=;
 b=OU0COf5ukde/P2Y7LESP5ZShRz32PUm0XNfDB/qyPi20FbjcNZE7jaDW1De4QbOzwj3U998M7cgK7MhHQHDV8Z5uh1BrSQaox8XtLXguP7WchmN33V/fewsu4LxG3KJvswmmsJ6pvO1WLQgU0pAMfM4huPn2tmFL/LCatlOMUm1uMarlYoDa38XvbE0ljmVIwnKKLR0mVViO1U3LKmWB12mLnheR1N16znajZr2C/NXIlo/mm2v5gZvakfIWhIbmzhJcQs+KUAV2LDZd6BtxXFkg4NN7xkId5N4ZYwU5T74gWLrUWcs2msz+rW89vPaDwflKCFPLuXK7Au8AdlscQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vf/hFbWsp9b4fq/RDb9H+U9cBrJGw1HaJJeuto3Joy4=;
 b=DVNWcjB2YCIeobpek+CT+ZdtDJK94DsBX0RzAnYW8D98qKcAphE8TsWCctIrRxq15JVVzssHh/KFCKN1CgsvGOtjRAvYD9iyIhyXGc5Sk8CNOnwiAeHjM106eshfm+ZxWSTCmtJK2Axusj7qFucG69uMW8FMsuzkrpDdMsDNgSmsJ/BXsGKP+c1L0y7Lm85Ec/p4tV3n+eBuGQbR69wzngmNRinI6zSfbRjGJJGWUbAs3IWFE20NWY11ugfixVfKFR7Hqfm/sNEXDhq4GxH+WqGhyXnZbjGmUPCsmBkPG1uAyofMOC7QWsYLaX5U2707GOhwm0evOgOBD76zDHRk+g==
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:423::12)
 by GV1PR10MB6196.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:93::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Fri, 27 Oct
 2023 12:30:44 +0000
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b6c1:537a:e6c2:8a25]) by DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b6c1:537a:e6c2:8a25%4]) with mapi id 15.20.6907.032; Fri, 27 Oct 2023
 12:30:44 +0000
From: "Jonas Mark (BT-FS/ENG1-GRB)" <Mark.Jonas@de.bosch.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: drm/panel: panel-simple power-off sequencing
Thread-Topic: drm/panel: panel-simple power-off sequencing
Thread-Index: AdoIGZn+78j/WD9uTEuaO26ZQdjdBAAPsJUAAB5CrBA=
Date: Fri, 27 Oct 2023 12:30:44 +0000
Message-ID: <DU0PR10MB707649F0596653D2B16D6AB9ADDCA@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
References: <DU0PR10MB7076C5C33C4F3E9097E372E7ADDDA@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
 <CAD=FV=XafnQy0Tg_pSvarNmsFX-mkFq0abYipkAm+28wr+byrw@mail.gmail.com>
In-Reply-To: <CAD=FV=XafnQy0Tg_pSvarNmsFX-mkFq0abYipkAm+28wr+byrw@mail.gmail.com>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR10MB7076:EE_|GV1PR10MB6196:EE_
x-ms-office365-filtering-correlation-id: f81c186e-ce65-4f0d-066b-08dbd6e88a1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hvHk/oTUrdfXZ54LNvKzJ6EQy6y5EAoqto1hyQK5uPjGffrtVaSiazkbuJ/vtVIpiJuHHSESggQMnDxmcs2rJvDY3q8KmVwevHJ8McZQQHRYOD3F+Bi1ctuGQD4H5NNkjtkLgQyNNdF6B5NEcgGSlm6QsDJcWMyT66dNu0bwSxPUcuwFkXvrTZV5T1fRsQ3wtO7JumijvJNK+6UOTzoCCvB3ANvvzPhNXHQDxqXVbr400JPJP2bw9swj4VLUSuqN8zMCbwM2RmTTNRAJZUQBQMuKBm3yuucZwAVH9A6HIY4BtmslX1ozy61FgXzMNpvU2yFLe+rTqq8KSEv9M+clcMDiuGsinDRebPBbkTUHkfgrYKN7CwQFbpkXC+7cOtbXK5v8g0MiNYSqqyeVswzjx1pFBaUD1sE04FCGoZYtgA2ny8kMiVFYMan5GdsFBUwNVvZreXnYWAIegQ88+ELXdsnXsfUl6Zkvxndruct9fu5uUYaL9QEoM2ef+XgDItK1fa0QhcVxPDPd1PkcH2Q7k71Fy5YSGrj/BhhUgJ+nnoR87Dhz0wiwF74JfpTwXW/swQKXS9KEf2gPOgUR6wpTplhH5EVtq56mK32ck4dGgAgEKqIde31HADNZs+nnoh0i
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(396003)(366004)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(55016003)(82960400001)(33656002)(86362001)(41300700001)(4326008)(83380400001)(2906002)(26005)(316002)(8936002)(6506007)(478600001)(53546011)(9686003)(71200400001)(7696005)(52536014)(6916009)(54906003)(66946007)(66556008)(66446008)(66476007)(64756008)(5660300002)(122000001)(8676002)(76116006)(38100700002)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjVaVDFEc3lMdlBRUzJ2eWlmcFBxQjFQS1crUlVtU2lUQ0pRZzlyendtcFRp?=
 =?utf-8?B?OVJJVkl5MEpyb0ZnZUhISlo0ZzBGOWxLWFUwWFJOMmZGK3lLU1dxb2RxRFNl?=
 =?utf-8?B?REVBWlpvZVF6OFBxK1Raemp0MkFwNmVkcmIzYXQ0aVNSTFI4MG45ZEdrd2hB?=
 =?utf-8?B?L0VxbENnS2Q1dUZDWktyUjNMTEUxQlpDeXNPejM0VmJlcXlKNlVvUmthTXI4?=
 =?utf-8?B?Vk82a2dCall4MTBJWlgwb2Rrbytra1h2Z1ExTWMwOTVVTk5EenFaeW8yK3F0?=
 =?utf-8?B?T0kyVndTOHVxKy9sZU5EQ0x5cTRLQjBCbWkyaGhtckFBZ0VLTVRNdVlhR0VE?=
 =?utf-8?B?VXhPRWM1QW5kYklLS0ZDRVd4MUI5ZnpHbXlmWTJuWk9EVDd2Z2xBckg1Zkd6?=
 =?utf-8?B?TFhKREhoOEdmN3VhbGltYldsRFZkbFZndEdudlc2d0pLZEIweEJsbVY3eTlh?=
 =?utf-8?B?aldHWEN0QWxGLytzVzF4Q05RdDFUVTVhUlliYXRsK21CVkhPM3lCNFZONGxZ?=
 =?utf-8?B?cHZ1bU1IazQ4RXlmK1dIbFdZaXRZbDVCdDFPQ3VlR05hYUwvZ0ZIRVAwUjJv?=
 =?utf-8?B?VGNsQzRXQ1crYW14N2srODZDVEtueFBRdjhHN2lZSkgrWHVXTnRjK29kVzJn?=
 =?utf-8?B?b0V2bkVqUFVCTEc5QTE4RjlOVkpITklyK3MyUlJnR1V6MlNkdEVxbk1BMk1T?=
 =?utf-8?B?Vk1YT1N2UlFjNHpyUHVBS3pKeExKV2lTVmVHdUF5bk5kRU9DUmRmUDdnM2Fn?=
 =?utf-8?B?bDh4U3ltR252L012cXd0U1h2VWhjdTJtQjkyc3lJbzFFUUtBSFJxU2YvR3ow?=
 =?utf-8?B?bHUwWWRLSGgxcm00VnBxUG1ObHJvZVQzeEg0TGhjRnp4N3BTZnNZQys1eU9i?=
 =?utf-8?B?K1dXYUtpUk82TW4xRHpOWXdOOTYxVkV6ejk2L09LOWVDRXhoYkt6QXk4UVFM?=
 =?utf-8?B?VFIvajd1TEJJUkNKTVIvcFB0M1lmdUpjZnlKMG9ONVpMMVd0SllPREIrKzM4?=
 =?utf-8?B?UGcrY29scm9PajhhakxubHVBeVFZbnBIYXdnM1BIbzBVQ3dUL2Z3ZFFTSmE1?=
 =?utf-8?B?ZmRLUHdzeHRQWmN0dTRwOW83ajJibDZVemxDS2VyMkFTNStlQi91Y2ErQzYx?=
 =?utf-8?B?dkYyamtzWUZnYmJseTRhaUREUHVsRGxpK2xzc28xWlhuVVEwU3Y0ZVAwQVQ0?=
 =?utf-8?B?NWt5K2UraTc0WWdMM09ETXJpWTEzcTB5NTZhZDBhQTJqYjdsb3VJa0Npak1a?=
 =?utf-8?B?WW5MNmMzWEFVRXVWekQrUVAydXZ0UnlFY2V1ejlGZlkycGdYYURSaFNxWUlH?=
 =?utf-8?B?RHo0Vms1NS85bzR4K29DejJZUmpJazVZZ0NMWjZYYnA3dWw0bDlkTlU2dVdn?=
 =?utf-8?B?V2R1WlgrYUs4Y2JPR0d3ekpoWS9BNllnSUE5NDlnaitvTVkzeUdEZGFuUUtM?=
 =?utf-8?B?bDRQSnZuMWJiNXp6aHdDdVZIOVo5TSs3a3VHdzlMMHBWcERncnBHSnI2Um5r?=
 =?utf-8?B?SW5KbmpzZjMxOTNVeUNCOVdMWHFLUXEwRVpHcTFZMTlNSnVUK3ROZDFWNFBR?=
 =?utf-8?B?bkxLK3dMNkpZZDNUOElGOCtUWEZXcVo4c3NVMHhaUDNFTUQxaCsxOERhWVJY?=
 =?utf-8?B?dUo3SytXNWZWbmFtNU9mWkwwTlRUaTErU3A0UjhMbnZLUFJIcFY3cGRjOWNq?=
 =?utf-8?B?aTJreWtWQTl3RlIxb3RJTUlPNFhXSzVTZFZWN2tmSnpQa21CZnR1Uk9JRStp?=
 =?utf-8?B?cDRLRGhCUDI1QTc3VkUxY0RrT1VDVmc0VVVpYVFqbVlkK1plSjZoOUFXRjh6?=
 =?utf-8?B?OS9LRVIvd056RDZVRDRLNWcrSFM1NldwTS9DdTVobXMyaGdIOXhhUEZZeHlH?=
 =?utf-8?B?MHFoQXVjNURBSjdPSjZnMHEzbXkzMW1FSXU2NkhZSjBDc2dwUGkxMUNBVlFp?=
 =?utf-8?B?NTlCVHZwcWo0UThLdEx4N2JkVDJIc3lDaGlwd0RKZFhWVzQ2VDNMQktFZURQ?=
 =?utf-8?B?Z0hDd0NnN3JYTmlVQ2pGQmg3eTltcE1ibHBLR250a3ZVazh3eGJPQjNVTjI2?=
 =?utf-8?B?cHlFL3Y4Y3ArSU4vTVlDbWlpejdFSXFic3kvMUNaMWlSemRiZndmRUJid3J0?=
 =?utf-8?Q?erBk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f81c186e-ce65-4f0d-066b-08dbd6e88a1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 12:30:44.0713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +SU69U0t9usH7WC+Fpt9qeYyvCdyBGqZqqEMH2PPD0fxXr9NyY/dlIWepOtbRvuFz55Alg+vor4ohUT8JynjpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6196
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
Cc: Mark Jonas <toertel@gmail.com>, David Airlie <airlied@linux.ie>,
 "Jonas Mark \(BT-FS/ENG1-GRB\)" <Mark.Jonas@de.bosch.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "Simoes Ricardo \(BT-FS/ENG1.1-Ovr\)" <Ricardo.Simoes@pt.bosch.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG91ZywNCg0KTWFueSB0aGFua3MgZm9yIHlvdXIgcmVwbHkuDQoNCj4gSGksDQo+IA0KPiBP
biBUaHUsIE9jdCAyNiwgMjAyMyBhdCA3OjM34oCvQU0gSm9uYXMgTWFyayAoQlQtRlMvRU5HMS1H
UkIpDQo+IDxNYXJrLkpvbmFzQGRlLmJvc2NoLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSwNCj4g
Pg0KPiA+IFdlIGhhdmUgYSBwYXJhbGxlbCBMQ0QgcGFuZWwgd2hpY2ggaXMgZHJpdmVuIGJ5IHBh
bmVsL3BhbmVsLXNpbXBsZS4NCj4gVGhlIHBvd2VyLW9mZiBzZXF1ZW5jZSBzcGVjaWZpZWQgaW4g
dGhlIGRhdGFzaGVldCByZXF1aXJlcyB0aGF0IHRoZQ0KPiBlbmFibGUtZ3BpbyBtdXN0IGJlIGRl
YXNzZXJ0ZWQgZm9yIGEgbnVtYmVyIG9mIFZTWU5DIGN5Y2xlcyBiZWZvcmUNCj4gc2h1dHRpbmcg
ZG93biBhbGwgb3RoZXIgY29udHJvbCBzaWduYWxzLiBTZWUgdGhlIGRpYWdyYW0gYmVsb3c6DQo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgX18gIF9fICBfXyAgX18gIF9fIENMSywgVlNZTkMs
IERFLCBIU1lOQzoNCj4gPiBfXz48X18+PF9fPjxfXz48X19cX19fX19fX19fX19fX19fX19fX19f
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgX19fX19fDQo+ID4gZW5hYmxlLWdwaW8gICAg
ICAgICAgOiAgICAgICAgXF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+DQo+
ID4gU28gZmFyLCBpbiBrZXJuZWwgNS40IHdlIHJlbGllZCBvbiB0aGUgdW5wcmVwYXJlIGRlbGF5
IHRpbWUgZm9yDQo+IG1ha2luZw0KPiA+IHN1cmUgdGhhdCB0aGUgZW5hYmxlLWdwaW8gdGltaW5n
IHJlcXVpcmVtZW50cyBhcmUgZnVsZmlsbGVkLiBUaGF0DQo+IGlzLA0KPiA+IHRoZQ0KPiA+IHBh
bmVsX3NpbXBsZV91bnByZXBhcmUoKSB3b3VsZDoNCj4gPg0KPiA+IDEuIERlYXNzZXJ0IHRoZSBl
bmFibGUtZ3Bpbw0KPiA+IDIuIFN3aXRjaCBvZmYgdGhlIHZvbHRhZ2UgcmVndWxhdG9yDQo+ID4g
My4gV2FpdCBkaXNwbGF5X2Rlc2MuZGVsYXkudW5wcmVwYXJlIG1pbGxpc2Vjb25kcw0KPiA+DQo+
ID4gQWZ0ZXJ3YXJkcyB0aGUgSVBVIHdhcyBzaHV0ZG93biwgYW5kIGFsbCB0aGUgY29udHJvbCBz
aWduYWxzDQo+IHN0b3BwZWQuDQo+ID4NCj4gPiBCdXQgd2l0aCB0aGUgYmVsb3cgY29tbWl0czoN
Cj4gPg0KPiA+ICAtIDMyMzViMGYyMGEwYTQxMzVlOTA1M2YxMTc0ZDA5NmVmZjE2NmQwZmINCj4g
PiAgICAiZHJtL3BhbmVsOiBwYW5lbC1zaW1wbGU6IFVzZSBydW50aW1lIHBtIHRvIGF2b2lkIGV4
Y2Vzc2l2ZQ0KPiB1bnByZXBhcmUgLyBwcmVwYXJlIg0KPiA+ICAtIGU1ZTMwZGZjZjNkYjE1MzQw
MTljNDBkOTRlZDU4ZmQyODY5ZjkzNTkNCj4gPiAgICAiZHJtOiBwYW5lbDogc2ltcGxlOiBEZWZl
ciB1bnByZXBhcmUgZGVsYXkgdGlsbCBuZXh0IHByZXBhcmUgdG8NCj4gc2hvcnRlbiBpdCINCj4g
Pg0KPiA+IFRoZSBlbmFibGUtZ3BpbyBpcyBub3cgZGVhc3NlcnRlZCBpbiBwYW5lbF9zaW1wbGVf
c3VzcGVuZCgpLCB3aGljaA0KPiBpcyBjYWxsZWQgc29tZSB0aW1lIGFmdGVyIHRoZSBkaXNhYmxl
bWVudCBvZiBjb250cm9sIHNpZ25hbHMgYXJlDQo+IHN0b3BwZWQ6DQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgX18gIF9fICBfXyAgX18gIF9fIENMSywgVlNZTkMsIERFLCBIU1lOQzoNCj4g
PiBfXz48X18+PF9fPjxfXz48X19cX19fX19fX19fX19fX19fX19fX19fDQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBlbmFibGUtZ3Bp
byAgICAgICAgICA6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFxfX19fX19fX19fX19fDQo+
ID4NCj4gPiBXaXRoIHRoZSBsYXRlc3QgcGFuZWwtc2ltcGxlLCBpcyB0aGVyZSBhIHdheSB3aGlj
aCBhbGxvd3MgdXMgdG8NCj4gZGVhc3NlcnQgZW5hYmxlLWdwaW8gYmVmb3JlIHRoZSBjb250cm9s
IHNpZ25hbHMgc3RvcD8NCj4gDQo+IEFzIEkgdW5kZXJzdG9vZCBpdCwgdGhlICJ1bnByZXBhcmUi
IHRpbWUgd2FzIG9yaWdpbmFsbHkgaW50ZW5kZWQgdG8NCj4gbWVldCBtaW5pbXVtIHBvd2VyIG9m
ZiB0aW1pbmdzIGFuZCB0aGF0J3MgaG93IEkgYWx3YXlzIHNhdyBpdCB1c2VkLA0KPiBidXQgaXQg
ZG9lc24ndCB0b3RhbGx5IHN1cnByaXNlIG1lIHRoYXQgdGhlcmUgd2FzIHNvbWVvbmUgcmVseWlu
ZyBvbg0KPiB0aGUgb2xkIGJlaGF2aW9yLiBJIHBlcnNvbmFsbHkgd291bGRuJ3Qgb2JqZWN0IHRv
IGFkZGluZyBhbm90aGVyIGZpZWxkDQo+IHRvIHBhbmVsLXNpbXBsZSB0aGF0IGFsbG93ZWQgeW91
IHRvIGdldCB0aGUgZGVsYXkgeW91IG5lZWRlZCBhbmQgdGhlbg0KPiBjaGFuZ2UgeW91ciBwYW5l
bCBkZXRhaWxzIHRvIHVzZSB0aGF0IG5ldyBmaWVsZCBpbnN0ZWFkIG9mIHRoZQ0KPiAidW5wcmVw
YXJlIiBtaWxsaXNlY29uZHMuIC4uLm9yIHlvdSBjb3VsZCByZW5hbWUgdGhlIGN1cnJlbnQNCj4g
InVucHJlcGFyZSIgZGVsYXkgdG8gc29tZXRoaW5nIGxpa2UgIm1pbl9wb3dlcm9mZiIgYW5kIHRo
ZW4gcmUtDQo+IGludHJvZHVjZSBhbiAidW5wcmVwYXJlIiBkZWxheSB0aGF0IGRvZXMgd2hhdCB5
b3Ugd2FudC4NCj4gDQo+IE9oISAuLi5idXQgZXZlbiB0aGlzIHdvbid0IF9yZWFsbHlfIGRvIHdo
YXQgeW91IHdhbnQsIHJpZ2h0PyBUaGUNCj4gYmlnZ2VyIGlzc3VlIGhlcmUgaXMgdGhhdCBwYW5l
bC1zaW1wbGUgaXMgdXNpbmcgYXV0by1zdXNwZW5kIG5vdyBhbmQNCj4gdGh1cyB0aGUgZW5hYmxl
IGxpbmUgY2FuIGdvIG9mZiBtdWNoLCBtdWNoIGxhdGVyLg0KDQpZZXMsIGV4YWN0bHkuDQoNCj4g
V2hhdCBpdCBraW5kLW9mIHNvdW5kcyBsaWtlIGlzIHRoYXQgeW91IHdhbnQgdGhlICJlbmFibGUi
IEdQSU8gdG8gYmUNCj4gY29udHJvbGxlZCBieSB0aGUgImVuYWJsZSIgYW5kICJkaXNhYmxlIiBm
dW5jdGlvbnMgb2YgcGFuZWwtc2ltcGxlLg0KPiBUaGVuIHlvdSBjb3VsZCB1c2UgdGhlICJkaXNh
YmxlIiBkZWxheSwgcmlnaHQ/DQoNClRoZSBkaXNhYmxlIGRlbGF5IGFsb25lIGRvZXMgbm90IGhl
bHAuIFdlIGFyZSBvbiBhbiBpLk1YNiB3aXRoIGENCnBhcmFsbGVsIGRpc3BsYXkgYW5kIHRodXMg
ZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmMsDQppbXhfcGRfYnJpZGdlX2Rpc2FibGUoKSBzaW1w
bHkgY2FsbHMNCg0KCWRybV9wYW5lbF9kaXNhYmxlKGlteHBkLT5wYW5lbCk7DQoJZHJtX3BhbmVs
X3VucHJlcGFyZShpbXhwZC0+cGFuZWwpOw0KDQp3aGljaCB3aWxsIHRoZW4gY2FsbCB0aGUgbWF0
Y2hpbmcgcGFuZWwtc2ltcGxlIGZ1bmN0aW9ucy4gVGh1cywgdGhpcw0Kd291bGQgb25seSBkZWxh
eSBjYWxsaW5nIHBhbmVsX3NpbXBsZV91bnByZXBhcmUoKS4gV2UgZGlkIG5vdCBzZWUgYW55DQpv
dGhlciBleHBsb2l0YWJsZSBzaWRlIGVmZmVjdHMuDQoNCj4gSSB0aGluayBJJ3ZlIGxvb2tlZCBh
dCB0aGlzIGV4YWN0IGNhc2UgYmVmb3JlIGFuZCB0aGVuIHJlYWxpemVkIHRoYXQNCj4gdGhlcmUn
cyBhIGJldHRlciBzb2x1dGlvbi4gQXQgbGVhc3QgaW4gYWxsIGNhc2VzIEkgbG9va2VkIGF0IHRo
ZQ0KPiAiZW5hYmxlLWdwaW8iIHlvdSdyZSB0YWxraW5nIGFib3V0IHdhcyBhY3R1YWxseSBiZXR0
ZXIgbW9kZWxlZCBhcyBhDQo+IF9iYWNrbGlnaHRfIGVuYWJsZSBHUElPLiBUaGUgImJhY2tsaWdo
dCIgaXMgdHVybmVkIG9mZiBiZWZvcmUgcGFuZWwtDQo+IHNpbXBsZSdzIGRpc2FibGUoKSBmdW5j
dGlvbiBpcyBjYWxsZWQgKHNlZSBkcm1fcGFuZWxfZGlzYWJsZSgpLg0KPiBTbyBpZiB5b3UgbW92
ZSB0aGUgR1BJTyB0byB0aGUgYmFja2xpZ2h0IGFuZCBhZGQgYSAiZGlzYWJsZSIgZGVsYXkNCj4g
dGhlbiB5b3UncmUgYWxsIHNldC4NCj4gDQo+IERvZXMgdGhhdCB3b3JrIGZvciB5b3U/IERvZXMg
aXQgbWFrZSBzZW5zZSBmb3IgdGhpcyBHUElPIHRvIGJlIG1vZGVsZWQNCj4gYXMgYSBiYWNrbGln
aHQgR1BJTz8NCg0KSW4gY29tYmluYXRpb24gd2l0aCBzZXR0aW5nIHRoZSAiZGlzYWJsZSIgZGVs
YXkgdGhpcyB3b3JrcyAqLiBZZXQsIGl0DQpmZWVscyB3cm9uZy4NCg0KKjogYmFja2xpZ2h0LXB3
bSBvbmx5IGFjY2VwdHMgb25lIEdQSU8gYnV0IHRoYXQgY2FuIGJlIGVhc2lseSByZXNvbHZlZC4N
Cg0KSXQgZmVlbHMgd3JvbmcgdGhhdCB0aGUgYmFja2xpZ2h0IGRyaXZlciB0YWtlcyBvdmVyIHBh
cnQgb2YgdGhlIHBhbmVsDQpjb250cm9sLiBPbiB0b3AsIGl0IHN0aWxsIG5lZWRzIGNvb3BlcmF0
aW9uIG9mIHRoZSBwYW5lbCBkcml2ZXIgZm9yIHRoZQ0KcHJvcGVyIHRpbWluZy4gTGFzdGx5LCBp
dCByZWxpZXMgb24gdGhlIGN1cnJlbnQgYmVoYXZpb3Igb2YgZHJtLXBhbmVsDQp0aGF0IHRoZSBw
YW5lbCBkcml2ZXIgaXMgcHJlcGFyZWQvIGVuYWJsZWQgZmlyc3QgYW5kIHRoZW4gdGhlIGJhY2ts
aWdodA0KaXMgc3dpdGNoZWQgb247IGFuZCB0aGUgb3RoZXIgd2F5IGFyb3VuZCBhdCBwb3dlciBv
ZmYuDQoNCldlIHRoaW5rIHRoYXQgYWN0dWFsbHkgbW9yZSBwYW5lbHMgaW4gcHJvZHVjdHMgYXJl
IGFmZmVjdGVkOiBXZSBoYXZlDQp0aHJlZSBwYW5lbHMgZnJvbSB0aHJlZSBkaWZmZXJlbnQgdmVu
ZG9ycyAoU2hhcnAsIFBvd2VydGlwLCBhbmQgVGlhbm1hKQ0KYW5kIG9ubHkgb25lIGlzIHZpc3Vh
bGx5IGFmZmVjdGVkLiBZZXQsIGFsbCBvZiB0aGVtIHNwZWNpZnkgYSBudW1iZXIgb2YNCnZzeW5j
cyBhZnRlciBkZS1hc3NlcnRpbmcgdGhlIGVuYWJsZSBHUElPLg0KDQpUaGFuayB5b3UgZm9yIHlv
dXIgcmVwbHksDQpNYXJrDQo=
