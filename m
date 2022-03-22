Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0064E3EA3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 13:40:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7CC10E406;
	Tue, 22 Mar 2022 12:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4709310E33F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 12:40:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcDmFRKL5nKpfp2my86p4EdGlbTlPoLRlw8VcI2F9zGus+m0I9HLOT2pnSb5dOxR/HCkYqEzCEL77EOD6N0JyVmRKJ1J7xRxc9w5M2BkvMFoZ8Z2pUaCrMAzumYw+xTyeZiK4BecG2y1UB1eduJb8aX5M/iHGwngE1uB3CsAPvEz6zl55ZlIGjo4o2rfNlKKsc7q2xnwelR4eYJGvK0B0EwKm2BZHWPus3X/1y9DxSigPiW0hpGDvP0INhsPmewM3baq6Ampa61xKx4zsHrHKHkaOJwu9tTXu8f/t0a5WZ/EIoEYtwCPTt0DS2hDY+WKhemj98tV+lnQUqqkOiRhvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TAU28AkIWcIunfeBoLNlGOjPkNc3kjwAhRxby6vMPg=;
 b=eLLwXNI28xnX/g1pJSAXkzIsCFWlXxD9sxMHPIw/tolLd0R/dBRrkwkTRIb6N37B6wLKHlrWWWh7RvjhoHchYbWAEH/7yl07vOo3BhuweoBobagGm7Rj05kznsyIDf1rxFkZrl7AhLoXJqsPWQNC1tiRz3kt+1ZdZKIlED48t+0ajEnuOpw88dgb7w2OJQV08INGDyLRlhm0myK/DbDGvO9WMBMS+beRZeUNag9fq5BK9CzR4S+WiEY64GRsn41NYQFJl/ZJA6jsQ2sNg6xKHmoxA/CRyYQyLg3hhSCB3/WgmZe3ygxbeDlF1V6jHVeYgeX1+1UGOe5VIvuO7Sabag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TAU28AkIWcIunfeBoLNlGOjPkNc3kjwAhRxby6vMPg=;
 b=BlhWk4p6Al+7Fhq4r1+9BuEJYtndY8NZCvQ3HvNfiuTQXYwkrcmy7n8sPBOVIEaegnPAQAY5n37Az39Mb83kOBh6r5Wo309Ne5xJY1Ee5kX7BgYtEsy34pyzY04hrvLyF1sAfkXeH+1pAnq+U12DH5aSLUdLPuqFUGry4uVOm7I=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MW4PR05MB8732.namprd05.prod.outlook.com (2603:10b6:303:12b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.8; Tue, 22 Mar
 2022 12:40:43 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::c029:c5b4:6e3c:e8c]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::c029:c5b4:6e3c:e8c%7]) with mapi id 15.20.5102.016; Tue, 22 Mar 2022
 12:40:43 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 07/23] drm/vmwgfx: stop using dma_resv_excl_fence
Thread-Topic: [PATCH 07/23] drm/vmwgfx: stop using dma_resv_excl_fence
Thread-Index: AQHYPSvVm4xK1+FNQUqjAPC0WhA6C6zJ3j8AgAAC5QCAABCBAIABDLQAgABbZAA=
Date: Tue, 22 Mar 2022 12:40:43 +0000
Message-ID: <9d3ad2b93be2953048b572301de0ea0859dc7ff9.camel@vmware.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-7-christian.koenig@amd.com>
 <91bd73763a87c3311d8cc4878589f80a712c4574.camel@vmware.com>
 <ce7aef7c-01e8-d0d3-ca20-e0682400ecfd@amd.com>
 <a4e761e3145685953c2246cd6ac60b1da521b756.camel@vmware.com>
 <83e6554b-10f4-6fbb-3cb5-4e08ae52e0a7@amd.com>
In-Reply-To: <83e6554b-10f4-6fbb-3cb5-4e08ae52e0a7@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6ecd01c-148a-4b92-7a3e-08da0c012e4b
x-ms-traffictypediagnostic: MW4PR05MB8732:EE_
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <MW4PR05MB8732EC58F983C01D924085EDCE179@MW4PR05MB8732.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bnuh82oyFTJvka63XJBfvexErDvmqV0vGl9UmReJNQdIhscmB+ZRIpfzhcgYybnJ6h2ouIfbE4ka4DXqTouH3jNB3mdAn/ZTqACJRzVC95T6M57m//mw5FVRxYIRP/0ttOuKj7gFJkfUKDX4hg5Dvg1YHQtz5qrVxWbByq86MihcZnfeLkdrWBGN+Am++Zu4TmdXOFgxNEfv/WTRkG0DAIYYf5yPE7wjt4sWFh+hzgYjoqb2ltqnZJLecl9+BPvIc7CSzkPqAmTwbYa+5yzJn2AqXVr3CMavhigynFtyNH8ezAYDF9g9EVRyLVdoIZsG3qrZt16ppOFnQWHjSEg/iFl6DvZmULB0rEcu+DAQv0THvHDGrFrWEF8K0A6YuWE1hQ41/MizwHWtOTA0tdSm7hiPc1M2ZFoJpPu0EdvgZ2CSbA1DeakiNz0Kw5depdUuCjOycyG9QRDlL5yeMFPtUdhGepwzVJaCX87t0wSZS3/xHHwRtbdY2HXxL+O8V+f0tEkxrwh8bV4UOD50S4ifBWeaNngysjUZDdWO2zxgifBSWgo3P5uGfYlhY1KH5KYQnNVJJgqsRSvybUVWhDfHsJiRYB1upKAiDKOo6P53CnvEmyXwNW3CPR2ExreqT7FasypsZc46mjA3dMj/dhG0mGDB0BmyeIE38TrPKSnLHbKX/S+IAufYY8wF13UYwcK+6s9fnqijnYf/TE16/ODy6g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(8936002)(66574015)(5660300002)(83380400001)(36756003)(6512007)(71200400001)(2906002)(86362001)(6506007)(64756008)(76116006)(66946007)(4326008)(66476007)(66556008)(66446008)(8676002)(110136005)(26005)(122000001)(186003)(508600001)(38100700002)(6486002)(107886003)(38070700005)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkM4WVE3cUo5Q0VOK2t1RjFCVVorQllFUExTaTRQNDA0amYxTmQyWXFyY3E4?=
 =?utf-8?B?K0JJN0RGVEtDblQ4elpIYzUyaS9qZWp2LzhRNTBEZHpZeUpRNUY0WFZOSG8y?=
 =?utf-8?B?Q00vNXhocWNJWVNVb0NjaUxrT25pay9JbVV4RTdpSG9HVE5kMVNHQVovMGNE?=
 =?utf-8?B?UDQzRWU0cWRZWkk1ckxtZG8yRkphS0gxcTRFK243aUc3cmlhNkVvalVTeU1z?=
 =?utf-8?B?L1ZCVUk0cnBBdW5WYnVLZEJXT3pvQjNCUWluR1I3cmpiZlUxdEtZWTBFdUQ3?=
 =?utf-8?B?NmRaOHJjS1RHdHlqRFhFTEFaY29lSmMzbGcxOFZjS0I0WVJydHN0Z2VMR2h3?=
 =?utf-8?B?K0ZMVXN2dFh2V2d1dmVuMnI1QkxiTUwxRUQ4bFdkanZiTWlwYzdMWnB1RUdW?=
 =?utf-8?B?d1o2K0FIazhSNUk4TnZkWm1DNlVGeUtsUm5ZeFFVV2JlYTh4bUQyRGQzb2Vl?=
 =?utf-8?B?UkVTRmYwZ2YyRzIyRmMrTlgyUjlPcGwwUDlBRWtwUVptVkVmdzV0TGN3KzR0?=
 =?utf-8?B?M1F3VW9CVUJRcVRpeUdtYWdIUENIOU9jVDFqL2ZPQllOV1Bxa29vRWVZTU5y?=
 =?utf-8?B?akt1S29FYmF6anZCVnRCcnJSZ3oyMXY4bUd5ZTdjcVFZdjdnWGJWOHRnTkV1?=
 =?utf-8?B?MG1DS01TQ2ZyUnJaZmNpKzVqZmlFckNYN21USmo0RWQ5aVpmMmlzREFDUE1h?=
 =?utf-8?B?cE5QK3d6RWkzaTdMNkE2c1dieitITVFOSXIrLzNWUWZVU2N5bGc4b2VISHlp?=
 =?utf-8?B?dUtYaEZBU1kzM3dERmNZOGR4cTMyUW52Vm52QVVsakU3bEpxZldoaU1VK1pw?=
 =?utf-8?B?OE1MSzFRWXQ4WTh5L05qZkp6MlpXVjRrdWhITUNMMjJsZXFQVVdoTDhIVnpk?=
 =?utf-8?B?ZnJXVXpJeGdOeDhXaDdIWFlkTEhLbytTcWFaMnl5am5OMVgrUitQeVJ2RVBw?=
 =?utf-8?B?anpVSDE2RU1mQm5zOW16cDFsT3RUdjRGRlJhYWplVWV1Z0ZsbE5DeFNxNEpa?=
 =?utf-8?B?RzdaQnRaaDgyeVlZRnk4SnRvUFNxTktLTlRJNGVIbnpCUHcvMmRvd2VPNGpi?=
 =?utf-8?B?UkZ4SEdPbmxTdG1PNlk0c2daVFcxVkdSV3ptR0RpbHBJL3lmR2hlWStXVlMy?=
 =?utf-8?B?OExuVmRCLzVOK3JJMGZiUjFUbEJCbmRqL05MbzcvQVY2Y0J1blZheE92WjZG?=
 =?utf-8?B?SkxUM2RnNGpUdjd1a1V1cXc2bGQ3VWYxMTlWTFk5RDU4Vkc5eTNOTVJuMTBM?=
 =?utf-8?B?U3cyZktBYy9TdC9FaUJLWE0ycVFnbjkvOHBjRDlqbVVacUNRMktScjR4b04x?=
 =?utf-8?B?N1YxN1dDN1NDbVI4c1AvSnlkMUdYSGJ6N2FXa0JuV2QzL2cxUTB6ZThTbjV3?=
 =?utf-8?B?b3YyaSthcXlSU1lidnBlQ2hTbWVWQUl4eGpheS9ZWHpGK2RSNlN2WjlLNHFk?=
 =?utf-8?B?WEcwejZHaGdoN0xEZUdWK2xBa05pOHJnM3pPdHJzYzlwVmJDL0t4MUlrZ1lt?=
 =?utf-8?B?OHEySnBCaGNzSmdrOTVodTFGMXZyUWRNUncxN0E2QWhHMXUrdkR1WkI2Q0po?=
 =?utf-8?B?VUIxWVpzTDdiZGExYlN6eTdxR3hST29rM2VCTkVGNHcxQjlMVlRXcGp5V0s3?=
 =?utf-8?B?eDYwRm5DdzdCSWdURUtGZmtjRkM2dDB4UjdDSXZoNFllcWFEckduYjBLWjVo?=
 =?utf-8?B?ZjVKd3VRNVVOcFBsbE00ZGgrT3RLUVVCSDN0T0F1cUNYSnJONTZLZ1IzUXRK?=
 =?utf-8?B?MHRnellOdGRlZ3dTQ21LZGFOWlY5dFhJQmxQUnFYUENsWVJFSkQwYXRiSmhL?=
 =?utf-8?B?aWpXQW1MYVRnRWd6UXFZWkoxWFJwM0FGYWRmU0ROZXJYZUdudTVlWTgyaEE2?=
 =?utf-8?B?bVc4ZjFHU2c3bFZzb2NDK2FiVzZWSERhanQveXcwQnduajl1Ryt4bzUwaGtN?=
 =?utf-8?Q?eQYY72wLhvlGTK7c5VbRaUe5e57iA1ee?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E1CB016DB963B409D448D12CAEEE1D7@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ecd01c-148a-4b92-7a3e-08da0c012e4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2022 12:40:43.6608 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QmQOn2opcI5PqDWra7Vegu2/ayIxXDKxnJaQPyUIIT61Xjuyne+SWu0BxCYEXM8CI6Etmm07a2rmaWugw1fR0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR05MB8732
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
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIyLTAzLTIyIGF0IDA4OjEzICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiBBbSAyMS4wMy4yMiB1bSAxNjoxMSBzY2hyaWViIFphY2sgUnVzaW46DQo+ID4gT24gTW9u
LCAyMDIyLTAzLTIxIGF0IDE1OjEyICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPiA+
ID4gQW0gMjEuMDMuMjIgdW0gMTU6MDIgc2NocmllYiBaYWNrIFJ1c2luOg0KPiA+ID4gPiBPbiBN
b24sIDIwMjItMDMtMjEgYXQgMTQ6NTggKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+
ID4gPiA+ID4g4pqgIEV4dGVybmFsIEVtYWlsOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBv
dXRzaWRlIG9mIHRoZQ0KPiA+ID4gPiA+IG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzDQo+ID4gPiA+ID4geW91DQo+ID4gPiA+ID4gcmVj
b2duaXplIHRoZSBzZW5kZXIuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gSW5zdGVhZCB1c2UgdGhl
IG5ldyBkbWFfcmVzdl9nZXRfc2luZ2xldG9uIGZ1bmN0aW9uLg0KPiA+ID4gPiA+IA0KPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4NCj4gPiA+ID4gPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBmZndsbC5jaD4NCj4gPiA+ID4gPiBDYzogVk13YXJlIEdyYXBoaWNzIDxsaW51eC1ncmFwaGlj
cy1tYWludGFpbmVyQHZtd2FyZS5jb20+DQo+ID4gPiA+ID4gQ2M6IFphY2sgUnVzaW4gPHphY2ty
QHZtd2FyZS5jb20+DQo+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gwqDCoCBkcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9yZXNvdXJjZS5jIHwgNiArKysrLS0NCj4gPiA+ID4gPiDCoMKgIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3Jl
c291cmNlLmMNCj4gPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3Jlc291
cmNlLmMNCj4gPiA+ID4gPiBpbmRleCA3MDg4OTliYTIxMDIuLjM2YzNiNWRiN2U2OSAxMDA2NDQN
Cj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9yZXNvdXJjZS5j
DQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfcmVzb3VyY2Uu
Yw0KPiA+ID4gPiA+IEBAIC0xMTY1LDggKzExNjUsMTAgQEAgaW50IHZtd19yZXNvdXJjZXNfY2xl
YW4oc3RydWN0DQo+ID4gPiA+ID4gdm13X2J1ZmZlcl9vYmplY3QgKnZibywgcGdvZmZfdCBzdGFy
dCwNCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZtd19ib19m
ZW5jZV9zaW5nbGUoYm8sIE5VTEwpOw0KPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKGJvLT5tb3ZpbmcpDQo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3B1dChiby0+bW92aW5n
KTsNCj4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiby0+bW92aW5nID0g
ZG1hX2ZlbmNlX2dldA0KPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAoZG1hX3Jlc3ZfZXhjbF9mZW5jZShiby0+YmFzZS5yZXN2KSk7DQo+ID4g
PiA+ID4gKw0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIFRPRE86
IFRoaXMgaXMgYWN0dWFsbHkgYSBtZW1vcnkgbWFuYWdlbWVudA0KPiA+ID4gPiA+IGRlcGVuZGVu
Y3kgKi8NCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZG1h
X3Jlc3ZfZ2V0X3NpbmdsZXRvbihiby0+YmFzZS5yZXN2LA0KPiA+ID4gPiA+IGZhbHNlLA0KPiA+
ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZiby0+bW92aW5nKTsNCj4g
PiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4gPiA+ID4gPiAtLQ0KPiA+ID4gPiA+IDIuMjUuMQ0K
PiA+ID4gPiA+IA0KPiA+ID4gPiBTb3JyeSwgSSBoYXZlbid0IGhhZCB0aGUgdGltZSB0byBnbyBv
dmVyIHRoZSBlbnRpcmUgc2VyaWVzLCB0aGUNCj4gPiA+ID4gcGF0Y2gNCj4gPiA+ID4gbG9va3Mg
Z29vZCwgYnV0IHdoYXQncyB0aGUgbWVtb3J5IG1hbmFnZW1lbnQgZGVwZW5kZW5jeSB0aGUNCj4g
PiA+ID4gdG9kbw0KPiA+ID4gPiBtZW50aW9ucz8NCj4gPiA+IFByZXZpb3VzbHkgdGhlIGZ1bmN0
aW9uIGluc3RhbGxlZCBvbmx5IHRoZSBleGNsdXNpdmUgZmVuY2UgYXMNCj4gPiA+IG1vdmluZw0K
PiA+ID4gZmVuY2UgaW50byB0aGUgQk8uDQo+ID4gPiBOb3cgaXQgZ3JhYnMgYWxsIGZlbmNlcyBh
bmQgaW5zdGFsbHMgdGhlbSBhcyBtb3ZpbmcgZmVuY2UgaW50bw0KPiA+ID4gdGhlDQo+ID4gPiBC
Ty4NCj4gPiA+IA0KPiA+ID4gQnV0IHdoYXQgd2UgcmVhbGx5IG5lZWQgaXMgdHJhY2tpbmcgaWYg
YSBmZW5jZSBpbiB0aGUgcmVzZXJ2YXRpb24NCj4gPiA+IG9iamVjdA0KPiA+ID4gaXMgYSBrZXJu
ZWwgbWVtb3J5IG1hbmFnZW1lbnQgZGVwZW5kZW5jeSBvciBub3QuDQo+ID4gPiANCj4gPiA+IFBh
dGNoICMxOSBhZGRzIHRoYXQgYW5kIHBhdGNoICMyMyB0aGVuIGZpbmFsbHkgZ2V0cyByaWQgb2Yg
dGhlDQo+ID4gPiB3aG9sZQ0KPiA+ID4gYm8tPm1vdmluZyBoYW5kbGluZyBoZXJlIGJlY2F1c2Ug
aXQgYmVjb21lcyBjb21wbGV0ZWx5DQo+ID4gPiB1bm5lY2Vzc2FyeS4NCj4gPiA+IA0KPiA+ID4g
SSBjYW4gZHJvcCB0aGUgY29tbWVudCBpZiB5b3Ugd2FudCBvciBqdXN0IG5vdGUgdGhhdCBpdCBp
cyBvbmx5DQo+ID4gPiB0ZW1wb3JhcnkgdW50aWwgdGhlIGZvbGxvdyB1cCBwYXRjaGVzIGFyZSBt
ZXJnZWQuDQo+ID4gQWgsIHllcywgaWYgeW91IGNvdWxkIHJlbW92ZSBpdCB0aGF0J2QgYmUgZ3Jl
YXQuIFRoZSBwYXRjaCB3aWxsDQo+ID4gbmV2ZXINCj4gPiBiZSBiYWNrcG9ydGVkIGFueXdoZXJl
IHdpdGhvdXQgdGhlIHJlc3Qgb2YgdGhlIHNlcmllcywgc28gaXQNCj4gPiBzaG91bGRuJ3QNCj4g
PiBiZSBhIHByb2JsZW0uDQo+IA0KPiBTdXJlLCBjYW4gSSB0aGVuIGhhdmUgeW91ciByYiBmb3Ig
dGhpcyBvbmU/DQoNClllcywgb2YgY291cnNlLiBUaGFua3MhDQpSZXZpZXdlZC1ieTogWmFjayBS
dXNpbiA8emFja3JAdm13YXJlLmNvbT4NCg==
