Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271AD54F7D0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 14:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC7010F8F4;
	Fri, 17 Jun 2022 12:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239A710FD9F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 12:49:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzX3QPUFvrgaUCyHIUkuywbTs0k8bV2wHcOuWd/HcrGwUEXhn86OlLDBXveZ4QkOqOcG91fnepSsvSURCRcbK62+2mWcEvqBMAwla4yuhzdKuz4oN12ac/xwXgIDqLkDA4tTG1ioDNLJkJB28FujcJOyHyuft2P3HKP8T51alFvCen4XnUj6gb9CzDm0R+NdL6FG8cHVIFpfYG1mn0d3A7CaCpPenvkfwLsKpKuIAuQOWuzr2SRy89SyakqqH6hT6B/GHuBVQ3ywJxC4tnyWHFJFTVrxToLJHMAbmow1jpneDtzDeePC9FGUt5B0lZzdNVGuVWBtbgppFvSc0g9EsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJecs8ZIvmLuXP3x9QWjnH2WM5nUmgFK02z+i5xdj1c=;
 b=MZcqjoYsT72exF/pm3hzuhY3Aao7cliz8MDUFWQDF7187Aiefvk87JyJIHAXDKwWGTn+xWnedl/Z1HnL1sFPZ0jksczLu0t7WkmZHG4Eho4mOPJmf5GlmX4zMkreZze1bFLQSnp+llDo3RHjQl8DsnH2gtvVX95HBdG7kXu5K5QiESB0pVgamc9Ge+6GLcyLVvB1ImREVouNlje1ztqa3MuICS3vD/LdEdJ4ekGiBt3iw2LAbfeo2FFqWbW/ELlhA1PrEwnGCNVF8kBI1tvNVgYC8ue3+m58w6NbBOATARpk+62B1hAdNGFydTjj9cviyg9pBwKHIUfQMyJYmmdvJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJecs8ZIvmLuXP3x9QWjnH2WM5nUmgFK02z+i5xdj1c=;
 b=RHn/WrM8kgsl1+ofIagziuW3MGlhjaOnoO3lsgZfmvHtveUMflJzaNO1pUPmd81V0Oaef9aUFuKoKnbdnAgktpnnF7jENV6G8UjieqaIFX2ilb8RNe997Sfvn8ezb4VnPVMzkPEsYoMPnNV2S+wSPLN//I0kVOvcpvlExAyQ+hA=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by SA1PR05MB7902.namprd05.prod.outlook.com (2603:10b6:806:1a8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.6; Fri, 17 Jun
 2022 12:49:35 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02%3]) with mapi id 15.20.5373.010; Fri, 17 Jun 2022
 12:49:35 +0000
From: Zack Rusin <zackr@vmware.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "airlied@linux.ie"
 <airlied@linux.ie>, "javierm@redhat.com" <javierm@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/aperture: Run fbdev removal before internal helpers
Thread-Topic: [PATCH] drm/aperture: Run fbdev removal before internal helpers
Thread-Index: AQHYgkNBlO+0tUtHqEaE/sMNMPARc61Thz6AgAADO4CAAAJkAA==
Date: Fri, 17 Jun 2022 12:49:35 +0000
Message-ID: <9f549ac66a8ac6b606d994c9992a01aff98bd25c.camel@vmware.com>
References: <20220617121027.30273-1-tzimmermann@suse.de>
 <47b627e1-5c87-f092-3ce8-a078898d0eb2@redhat.com>
 <6f4dce03-b65a-c5cf-059f-392a06d37ec3@suse.de>
In-Reply-To: <6f4dce03-b65a-c5cf-059f-392a06d37ec3@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d6e61d8-3e17-4611-74a9-08da505fd54c
x-ms-traffictypediagnostic: SA1PR05MB7902:EE_
x-microsoft-antispam-prvs: <SA1PR05MB7902478EFE2844C1B26054FCCEAF9@SA1PR05MB7902.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SdfwvRrDCOE8aZrjKkV9m2i3R1b6R+LgW42dErAbHVl1SjxCERfb5gXSQ2Bxd2WV4azKpQ+7I09AFKphfdnaOy2Lj3TVCTwwvH77mmpCSoruFZC1+8lYlVHVoPXftXFZ0Uas4VNXUNh6JNIOU4Sf4q4f8dqzCtQn5gYEG64HoAzDDc8x3I9/0iA/hoiYlcIc3hUgT5Bbj5MPBQzttPE3n0qgkNcat0SPbzUmdcSdKMi8jmdR7S1DEMDjIGbmImr8vdywiTVFKDisIz4rXeOVadIlJg9Lrlc1BuhPQ0+Xawue5JBd9Lejs3zyy4dYku0PuQFV9hYKiH2fRvQmk4R0WuYn2hiQN7gbjcAGGBOBVd37xAKlHwnWtJKtZLSFHm2TiEMSbo0z8AU3uW/gF24MaA0G6cR57QeZHVHaq7MosY+fAqbRX9AMaifVHFG5YILQt4d2uTw9GeGyp08jdtlDP8hzSvp/3Bkzm1kmIdw4tnqhWRT+y/tICqySDjnF6pUEWKpRYlLnIgpDtBjY+7fsu6tOZM93CWy/D3Ylp/4Xe4J2iRpgulUjQB9p1kuWMR+DweVNQz3mKMlKcZ5jDbnB+xnsjE0KMhrUE8iLDCg4ugue1g66QERatijjQjjizEyCo4DQkfydGM7mFOtcgTvuAi4hTCkX62kKoOe/1rjFcLMFkb6JtADUhioo0qOJukNrSXKMNQdnXFNZ7jzyyPR6tg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(122000001)(54906003)(5660300002)(110136005)(8936002)(316002)(6506007)(83380400001)(6512007)(26005)(53546011)(498600001)(186003)(2906002)(66946007)(71200400001)(36756003)(76116006)(7416002)(66476007)(6486002)(66446008)(4326008)(64756008)(66556008)(8676002)(91956017)(2616005)(86362001)(38070700005)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ry9TcnZxN0N4eDMrckx0dHM0UXF0UlZVSE5kRFAzckExT1JjblZ1SjVCNFRD?=
 =?utf-8?B?eGMwMlJPbTVpclZ3QWxlNzdhbTQyL0Q2akRWYk5lQnk3VDFIWTNFazVrVnNo?=
 =?utf-8?B?KzZHUmlJazhjdGRxbzhndWxFVzJMMnhMcWpVaEpUano4QTBkYmZVNFIydnN2?=
 =?utf-8?B?SDZZK2N0VStpdTJzd1R2V2hCbTEyUDhwYjl5ektXK2VoU1VWaGVkVXRwcDJV?=
 =?utf-8?B?Q0hLY2EzcldnK3JrL1JYLzc5TTFZS0Ric0dzNGZUMmZFNVN4RmtKZVJiRkJP?=
 =?utf-8?B?ZFRVWGdNQjByNkJlaUJneFJaU2ZJSlFTY2V1c21KZU9iMGRKd20zQ3JRbldY?=
 =?utf-8?B?dlpNL0tMUGdtYjltU25tYWQvQml6bXVQU0pxaXIvZGtxc0dpaTNvdzV2Q284?=
 =?utf-8?B?Z0lwTlF5M3dxS0J1WnpyMCtobWk0dm9VMTV1T0NNTTdPMm84TDNiTzdEUEpI?=
 =?utf-8?B?VW5ta2IwdDdpMG1VWDVtdkhhdnhRQjJ4dC96OXp6Nm5rWHlSZDVYa2x1anZW?=
 =?utf-8?B?QkpOdGRsVkFaMlVFZEZuWkZJRWVkcVUzbmdyZk10ZlhKbWQ1YVpVaWpRbjhT?=
 =?utf-8?B?YlcrSEswaldFUkIxSzZEbC9LMFlTWWxuck9OMWwwWE1tSlFUZWxLazZ1dkw2?=
 =?utf-8?B?eWNSdE1lWmkzYk0ydm5TelBSblF4b2dWTVEySUdycFFSOFRKME1GaVlKcTJt?=
 =?utf-8?B?Z0drUGZvanRSSHJHdmtGSGNuaCtKTEV0RUZ1alEyK0wwSDFyTVJOYis0WEtp?=
 =?utf-8?B?OHJjZVNXUWltcFpYaWtqWklwTkU3ZEJRMkxOVWdDLzlQSkVTTm05Mi9Sek9Y?=
 =?utf-8?B?RVhEemJBcVVxWEhNS21wM3NLMzlCbjJYVDhLWDREYTJsNXBVL3VnL0JqNDdX?=
 =?utf-8?B?anhpYUhWWkNOK25FNWhtMUVSeDE5cVJyekVmSG0xSS90MVo0M0N3YkRzNGZy?=
 =?utf-8?B?cG05RlNhWXU4NkZZVEJaUzBVaXJ1blJuempTZHZiSlRWL1ZHMkV0c2pCaUli?=
 =?utf-8?B?SWtFdXl1bFU5U2ZPa2JFenZ5cHh1eHdsU3Yva25uaG03ZnR1UXdUd01LUEUr?=
 =?utf-8?B?UVNHell4RjRMNmVNVkVEVEwzMU1DenkvWXg1RzY4OEc4OEVkVkFjRmhndTMy?=
 =?utf-8?B?TmtaYjI2KzN3b3RrUXdtZFhHai9zRXlGM2JSQ1J1eUFmT3Jwancya05CU2xZ?=
 =?utf-8?B?d2l4cWJRc2RUSm0rSWRmT0ZGa3FBanQxR0k3VUVXOUgvS3JFSWdsVkZpU1hG?=
 =?utf-8?B?cWxhb1JSbGt5cG5NOEJOUjA5VlN4dTMrSDZWOVJBUnVNcEFzbU5ZSkh5Vm5t?=
 =?utf-8?B?OXFqQUp1NTV2d0xtUnBOeUhwUEhEWWtoc2oxSUR4cG5VUzk2dGlKUEhRNVRS?=
 =?utf-8?B?OEZ1THRFVWlvQWxUVEZoTTI4b3ZhN2dEOXZmSHh6R1E5VlJGYTljdkhvNVZs?=
 =?utf-8?B?aXVRRVh0a0pjL3pmTzBzOG9KUmNXTlBXRzRZRlc1ajV0TEVZUGRCY24rZ1FU?=
 =?utf-8?B?aVZtRytBTk1JVHVqOCtPc2psZ2RZYW1xeWk0OGRjaDA1RTNkMmVTN0pwSnNE?=
 =?utf-8?B?TmZKaTlVdEpDekpXWHZqVlpFWkRvekRLUGZsMWtUMkZsMkJIWllmRG10dzBa?=
 =?utf-8?B?R09YSi8zNFdHS2MvYWQ0SmFjZWxjVDVpdXlTaWU2UUIyK3A5amY3cUdsUWVT?=
 =?utf-8?B?MlkySHRoSTJ5UTFDQUppV1dYSG5GYWpQL1RSdzJzT2tkcGlIa0FabjN5dStZ?=
 =?utf-8?B?M25CSGdVSVBIWWVMdTA3NmlsZEhtd1JJVGthaDJGOWptTW9nQXE0RE5HYlVQ?=
 =?utf-8?B?dGhKZEMvQVh0QjVCYWFjM3R0S0lVZGVBTWV6VEYwMkYwSGZ2UFZmSEZkczA2?=
 =?utf-8?B?ekpEejdMNlNkOUhZZDNFaWsyNnJDS0ljdGVQOUhrS2Rad3IrT0t2ZFVGTk9a?=
 =?utf-8?B?d3lVZUQwd1d3bWV0WEVMQVd4bWllQjZyNTVXMlduZFVFa1VpQmw5QTF4TC9n?=
 =?utf-8?B?cVVmckwwd0RyRjFockNNc2k0Y0pGZ01vdnNlTmFpOC90RFRIR3VJKzg4eEE4?=
 =?utf-8?B?NTRGYmZrY1VoaUtvWXlRTHo1ZFhSRzVoOVJWbFJjanZwajVSZ3pmdUlKOGdr?=
 =?utf-8?B?aXdnOWpreHR0U1BlWnBvQjJTN0xXM3dndnZ1WWpRK0ttdDhOTlpXTWhLVEM5?=
 =?utf-8?B?REtjU2JKbXlOQmlrWkNpb1FWNnh0REt5OFBEckRHdTVLVWZaREVoNTh2dmNS?=
 =?utf-8?B?d0RXMkxieTBkMG91ZDRJQzhYWUh4OFFITEdKUmU3WHU2S0FBbVU2alVnL3RN?=
 =?utf-8?B?RkdwQnlJMHJhNm4rTGo1Si80Z3VORWtpMzU0ZVM2WlJsZk1kL2EzUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <40C2FD0C09111B4E9231C2C7F76D6AF4@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6e61d8-3e17-4611-74a9-08da505fd54c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2022 12:49:35.6394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GnP8r3ABa0W8vqlEvGOCGAsHQeedEXfPQysEZxPSJC9w7TdSNj/IntVT/mEWMlW6FKhwuJ+twl+V4dezHjfymw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR05MB7902
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "deller@gmx.de" <deller@gmx.de>,
 "deng.changcheng@zte.com.cn" <deng.changcheng@zte.com.cn>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "thunder.leizhen@huawei.com" <thunder.leizhen@huawei.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIyLTA2LTE3IGF0IDE0OjQxICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gSGkNCj4gDQo+IEFtIDE3LjA2LjIyIHVtIDE0OjI5IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiA+IFthZGRpbmcgWmFjayBhbmQgQWxleCB0byBDYyBsaXN0XQ0KPiA+
IA0KPiA+IEhlbGxvIFRob21hcywNCj4gPiANCj4gPiBUaGFua3MgYSBsb3QgZm9yIHRyYWNraW5n
IHRoaXMgZG93biBhbmQgZmlndXJpbmcgb3V0IHRoZSByb290IGNhdXNlIQ0KPiA+IA0KPiA+IE9u
IDYvMTcvMjIgMTQ6MTAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPiA+ID4gQWx3YXlzIHJ1
biBmYmRldiByZW1vdmFsIGZpcnN0IHRvIHJlbW92ZSBzaW1wbGVkcm0gdmlhDQo+ID4gPiBzeXNm
Yl9kaXNhYmxlKCkuIFRoaXMgY2xlYXJzIHRoZSBpbnRlcm5hbCBzdGF0ZS4gVGhlIGxhdGVyIGNh
bGwNCj4gPiA+IHRvIGRybV9hcGVydHVyZV9kZXRhY2hfZHJpdmVycygpIHRoZW4gZG9lcyBub3Ro
aW5nLiBPdGhlcndpc2UsDQo+ID4gPiB3aXRoIGRybV9hcGVydHVyZV9kZXRhY2hfZHJpdmVycygp
IHJ1bm5pbmcgZmlyc3QsIHRoZSBjYWxsIHRvDQo+ID4gPiBzeXNmYl9kaXNhYmxlKCkgdXNlcyBp
bmNvbnNpc3RlbnQgc3RhdGUuDQo+ID4gPiANCj4gPiA+IEV4YW1wbGUgYmFja3RyYWNlIHNob3cg
YmVsb3c6DQo+ID4gPiANCj4gPiA+IFsgICAxMS42NjM0MjJdID09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ID4gWyAg
IDExLjY2MzQyNl0gQlVHOiBLQVNBTjogdXNlLWFmdGVyLWZyZWUgaW4gZGV2aWNlX2RlbCsweDc5
LzB4NWYwDQo+ID4gPiBbICAgMTEuNjYzNDM1XSBSZWFkIG9mIHNpemUgOCBhdCBhZGRyIGZmZmY4
ODgxMDgxODUwNTAgYnkgdGFzayBzeXN0ZW1kLXVkZXZkLzMxMQ0KPiA+ID4gWyAgIDExLjY2MzQ0
MF0gQ1BVOiAwIFBJRDogMzExIENvbW06IHN5c3RlbWQtdWRldmQgVGFpbnRlZDogRyAgICAgICAg
ICAgIEUgICAgIDUNCj4gPiA+IAkuMTkuMC1yYzItMS1kZWZhdWx0KyAjMTY4OQ0KPiA+ID4gWyAg
IDExLjY2MzQ0NV0gSGFyZHdhcmUgbmFtZTogSFAgUHJvTGlhbnQgREwxMjAgRzcsIEJJT1MgSjAx
IDA0LzIxLzIwMTENCj4gPiA+IFsgICAxMS42NjM0NDddIENhbGwgVHJhY2U6DQo+ID4gPiBbICAg
MTEuNjYzNDQ5XSAgPFRBU0s+DQo+ID4gPiBbICAgMTEuNjYzNDUxXSAgPyBkZXZpY2VfZGVsKzB4
NzkvMHg1ZjANCj4gPiA+IFsgICAxMS42NjM0NTZdICBkdW1wX3N0YWNrX2x2bCsweDViLzB4NzMN
Cj4gPiA+IFsgICAxMS42NjM0NjJdICBwcmludF9hZGRyZXNzX2Rlc2NyaXB0aW9uLmNvbnN0cHJv
cC4wKzB4MWYvMHgxYjANCj4gPiA+IFsgICAxMS42NjM0NjhdICA/IGRldmljZV9kZWwrMHg3OS8w
eDVmMA0KPiA+ID4gWyAgIDExLjY2MzQ3MV0gID8gZGV2aWNlX2RlbCsweDc5LzB4NWYwDQo+ID4g
PiBbICAgMTEuNjYzNDc1XSAgcHJpbnRfcmVwb3J0LmNvbGQrMHgzYy8weDIxYw0KPiA+ID4gWyAg
IDExLjY2MzQ4MV0gID8gbG9ja19hY3F1aXJlZCsweDg3LzB4MWUwDQo+ID4gPiBbICAgMTEuNjYz
NDg0XSAgPyBsb2NrX2FjcXVpcmVkKzB4ODcvMHgxZTANCj4gPiA+IFsgICAxMS42NjM0ODldICA/
IGRldmljZV9kZWwrMHg3OS8weDVmMA0KPiA+ID4gWyAgIDExLjY2MzQ5Ml0gIGthc2FuX3JlcG9y
dCsweGJmLzB4ZjANCj4gPiA+IFsgICAxMS42NjM0OThdICA/IGRldmljZV9kZWwrMHg3OS8weDVm
MA0KPiA+ID4gWyAgIDExLjY2MzUwM10gIGRldmljZV9kZWwrMHg3OS8weDVmMA0KPiA+ID4gWyAg
IDExLjY2MzUwOV0gID8gZGV2aWNlX3JlbW92ZV9hdHRycysweDE3MC8weDE3MA0KPiA+ID4gWyAg
IDExLjY2MzUxNF0gID8gbG9ja19pc19oZWxkX3R5cGUrMHhlOC8weDE0MA0KPiA+ID4gWyAgIDEx
LjY2MzUyM10gIHBsYXRmb3JtX2RldmljZV9kZWwucGFydC4wKzB4MTkvMHhlMA0KPiA+ID4gWyAg
IDExLjY2MzUzMF0gIHBsYXRmb3JtX2RldmljZV91bnJlZ2lzdGVyKzB4MWMvMHgzMA0KPiA+ID4g
WyAgIDExLjY2MzUzNV0gIHN5c2ZiX2Rpc2FibGUrMHgyZC8weDcwDQo+ID4gPiBbICAgMTEuNjYz
NTQwXSAgcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVycysweDFjLzB4ZjANCj4gPiA+IFsg
ICAxMS42NjM1NDZdICByZW1vdmVfY29uZmxpY3RpbmdfcGNpX2ZyYW1lYnVmZmVycysweDEzMC8w
eDFhMA0KPiA+ID4gWyAgIDExLjY2MzU1NF0gIGRybV9hcGVydHVyZV9yZW1vdmVfY29uZmxpY3Rp
bmdfcGNpX2ZyYW1lYnVmZmVycysweDg2LzB4YjANCj4gPiA+IFsgICAxMS42NjM1NjFdICA/IG1n
YWcyMDBfcGNpX3JlbW92ZSsweDMwLzB4MzAgW21nYWcyMDBdDQo+ID4gPiBbICAgMTEuNjYzNTc4
XSAgbWdhZzIwMF9wY2lfcHJvYmUrMHgyZC8weDE0MCBbbWdhZzIwMF0NCj4gPiA+IA0KPiA+IA0K
PiA+IE1heWJlIGluY2x1ZGUgYSBSZXBvcnRlZC1ieTogWmFjayBSdXNpbiA8emFja3JAdm13YXJl
LmNvbT4gPyBzaW5jZQ0KPiA+IHRoaXMgc2VlbXMgdG8gYmUgdGhlIGV4YWN0IHNhbWUgaXNzdWUg
dGhhdCBoZSByZXBvcnRlZCB5ZXN0ZXJkYXkuDQo+IA0KPiBJJ2xsIGRvLg0KPiANCj4gPiANCj4g
PiBQYXRjaCBsb29rcyBnb29kIHRvIG1lIGFuZCB0aGlzIHNlZW1zIHRvIGJlIHRoZSBjb3JyZWN0
IGZpeCBJTU8uDQo+ID4gVGhhdCB3YXkgd2Ugd29uJ3QgcmUtaW50cm9kdWNlIHRoZSBpc3N1ZSB0
aGF0IHdhcyBmaXhlZCBieSB0aGUNCj4gPiBzeXNmYl91bnJlZ2lzdGVyKCkgZnVuY3Rpb24sIHRo
YXQgaXMgdG8gcmVtb3ZlIGEgcGRldiBldmVuIGlmIHdhc24ndA0KPiA+IGJvdW5kIHRvIGEgZHJp
dmVyIHRvIHByZXZlbnQgYSBsYXRlIHNpbXBsZWRybSByZWdpc3RyYXRpb24gdG8gbWF0Y2guDQo+
ID4gDQo+ID4gUmV2aWV3ZWQtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUBy
ZWRoYXQuY29tPg0KPiANCj4gVGhhbmtzIQ0KPiANCj4gPiANCj4gPiBJIHdvbmRlciB3aGF0J3Mg
dGhlIGJlc3Qgd2F5IHRvIGNvb3JkaW5hdGUgd2l0aCBBbGV4IHRvIG1lcmdlIHRoaXMNCj4gPiBm
aXggYW5kIHlvdXIgcGF0Y2ggdGhhdCBtb3ZlcyB0aGUgYXBlcnR1cmUgY29kZSBvdXQgb2YgRFJN
LCBzaW5jZQ0KPiA+IGFzIGZhciBhcyBJIGNhbiB0ZWxsIGJvdGggc2hvdWxkIHRhcmdldCB0aGUg
djUuMjAgcmVsZWFzZS4NCj4gDQo+IElmIG5vdGhpbmcgZWxzZSBjb21lcyBpbiwgSSdsbCBtZXJn
ZSB0aGlzIHBhdGNoIG9uIE1vbmRheSBhbmQgc2VuZCBBbGV4IA0KPiBhbiB1cGRhdGVkIHZlcnNp
b24gb2YgdGhlIHZmaW8gcGF0Y2guDQoNClRoYW5rcyBUaG9tYXMuIEkganVzdCB0ZXN0ZWQgaXQg
b24gb3VyIGFybTY0IGNvbmZpZ3MgYW5kIGl0IGZpeGVzIHRoZSBjcmFzaCBvbiBib290DQp3ZSd2
ZSBiZWVuIHNlZWluZyBhbmQgZ2V0cyB0aGVtIHJ1bm5pbmcgYWdhaW4uDQoNClJldmlld2VkLWJ5
OiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPg0KDQp6DQo=
