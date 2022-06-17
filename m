Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD6654EED8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 03:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1969010F665;
	Fri, 17 Jun 2022 01:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B861710F665
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 01:36:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6FGFYQLFgouHLY8JQQ0W/f+259jnS7OCnkBFl6moNokYzqfFnmwg841CvaxlXKN1uX2Xfi3OLvtpvh1g+eWz31hPv+B18OUtDWe/ERBdIViPbCCipHY4atw5otOKNbFgKgIacSC1RwVrmopBndWxlQtbK0qohAerivsE4wZO5yfuRFfzFoyM0HkDGqW7aHPnSxIa35dvAZYwU/FaxMsVKnzR3hyU4h03POpWikwm38kgZfQpey2iMcvi5/N/MzBAb22HkwIVBBtYCCGKFiEIKKW+V3tlkObSsW8oK+AT6pxdAfhxmAl/qPCIMitcxHjvlKCdZyb0YZb/JwX0/Fw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2gMc4T5xYSEJRgmx6ph+H6R4jYAUKQky+Hje0RoYiE=;
 b=b/xGt7ilNNB6LMrU/n9DZBzqg8hi+WZ7Mh0XPq/7gHgbHYfjNr6Df4ip9+9qfPRYMsvhBxSh0WAPJubILlwUCDMmPsjChnGC00H9cciqfgZzfrD6kDBKu/CDS3B2XRRXkpf0vNggBhm0CooH517ntL3BxKRdLkOm3L4LcozoMnaeszSas/SQS4qBSpfOpnUohMUuJGbp5ehObj0HuXdjfnXJ/2KLs2ZiP03dJbMexWtqUHoNqQikhhSD9XzbhF+dvtLsPK1+DQ/ePF3+9ZsnpT7iueWtCPLHh+QhlzQlDjkHojckoqC4T2eJzpD/IAmL7nPrYXFzyp1/QkqBauoBNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2gMc4T5xYSEJRgmx6ph+H6R4jYAUKQky+Hje0RoYiE=;
 b=ApJ82ec9ZVVsEJPIpqQGiU9AgW93/wWg582Et8ZdimCgZMziVuPazyZnSQFngaRQkzKp+LGRV7iGxmRbim51RuT1kntcsIezi7Z1FAgtKHCNLByCcCjOAcJPiLpMRK9AUl+E+WoYn0QUOqebqHda+szY5f1ogrdW/JjJuz7DkZM=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by SJ0PR05MB8710.namprd05.prod.outlook.com (2603:10b6:a03:38a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.9; Fri, 17 Jun
 2022 01:35:49 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::14fc:26d8:a523:ce02%3]) with mapi id 15.20.5353.011; Fri, 17 Jun 2022
 01:35:49 +0000
From: Zack Rusin <zackr@vmware.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "javierm@redhat.com" <javierm@redhat.com>
Subject: Re: [PATCH v6 3/5] fbdev: Disable sysfb device registration when
 removing conflicting FBs
Thread-Topic: [PATCH v6 3/5] fbdev: Disable sysfb device registration when
 removing conflicting FBs
Thread-Index: AQHYepvEjLx5F4TpvU6kmXodMqZSca1SeaGAgAAHMACAABLpgIAAFPSAgAARqgCAACWUAA==
Date: Fri, 17 Jun 2022 01:35:49 +0000
Message-ID: <711c88299ef41afd8556132b7c1dcb75ee7e6117.camel@vmware.com>
References: <20220607182338.344270-1-javierm@redhat.com>
 <20220607182338.344270-4-javierm@redhat.com>
 <de83ae8cb6de7ee7c88aa2121513e91bb0a74608.camel@vmware.com>
 <38473dcd-0666-67b9-28bd-afa2d0ce434a@redhat.com>
 <603e3613b9b8ff7815b63f294510d417b5b12937.camel@vmware.com>
 <a633d605-4cb3-2e04-1818-85892cf6f7b0@redhat.com>
 <97565fb5-cf7f-5991-6fb3-db96fe239ee8@redhat.com>
In-Reply-To: <97565fb5-cf7f-5991-6fb3-db96fe239ee8@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6fefa13-d4eb-4991-62ef-08da5001b570
x-ms-traffictypediagnostic: SJ0PR05MB8710:EE_
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <SJ0PR05MB8710FBD4FBF9FCE0A254D7E3CEAF9@SJ0PR05MB8710.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5KPLCvpYRA5fAh0YObPa4tyNDq/W4LOre1z/B94uXtIbSvys5xzIPqJWzKJCYTEujHkUgS+6vX5KqbxiCx18v0EgPlqra1R+/PG3eKzqA0BApPqmuqlI9oNKyi2xV8tyJYo8pi/cuzrTIRMU6vBycT4gyucbcM0chMPVGz2ymHTFh7yC6EdrqCY+aGuEyyTRUvLhmI8NiBIF8o768N6+AFtxplk8R/EbohGmMuBEqD3/a49zjmkFXhCCzELJppa6q3Z9hVk6G4XFNR4HtbiTt7IqNzQrFKt1YooeB2N5Cx8iOvo1bWLZcDD0PoF5hm/Fq6zBggnPubdfu89zg2WGGU4Xw7yGQbwx9ZMUpa8y8fOujwuHh9DCC2bPcdicstA+fZgCz1dL0rvQS2JmR8j1bBZTxSERVBSycIvO3OgJrsm0CE+PinRlcr7GWj+aF2OAjP2w7FM+BnfMNL1+EAK2/uQHPHpTJX63/V6+iA0Tju7eie595++WWm+g4nAwfkq+fHST23huLw7LCjGqCVKMWEQ0sSdo3SKUAie/K3XEDZh3EEe/6WaVygq8lb7Lbx/u7b4hwfqH6rfVyHUlB6KyrmMXNo3/6KzuCLZVcY4yeIXY3pHlbL6os4omCNcD4qM1VvCNy5CMnRdQLHWzor++M6Qe8wqGdipOiZ/hSg/JxMIQmJms0AbrYwN+Ltiv+vuiHn9SdqMgHNgZFdsL7PNXSBk2LG0qGVfjifMp7AkayTLurJKHIVDOCDjhLDAgXlEL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(8676002)(66476007)(66446008)(66556008)(316002)(76116006)(66946007)(186003)(64756008)(4326008)(71200400001)(6486002)(498600001)(54906003)(2616005)(8936002)(91956017)(36756003)(107886003)(4744005)(2906002)(7416002)(5660300002)(122000001)(110136005)(38100700002)(6506007)(53546011)(26005)(6512007)(38070700005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFAyOXRjekk1QzVyU2N1VnpTQi9hN2I4ODBkaFY3RDVFenVOcXlucEpoN3NJ?=
 =?utf-8?B?VWFQQ0piQU0ySExmM2NrL1YyWFZZZUpPWHE0Sm94eXA0SmFGZzB2MWlvSG5Q?=
 =?utf-8?B?MCs0TGR1Zng4cGhuS0pyREhBVTdPOGRGZUFzclBtOTRnd2RqMlBnZkhDeDA0?=
 =?utf-8?B?MEVFS0d5T2k2N2did2plWkErZFJpcHQ5Z2xKY2h5UG1aSmpqc1NBczBZcFMr?=
 =?utf-8?B?cTFaYkpMellidDVUbEtkc1FRUXF0dE1IbDF4M0VyMDZTMXQ1SjIwK2h0TWF6?=
 =?utf-8?B?cmcrTDRacGtmRlhCLzFXcFNEeEVmeXhPZkg0cjZ2YUlnZ0RyVzZ6bGdGUStX?=
 =?utf-8?B?Z3gxL2U0OUM5ajl5VEJva0R4SHYxL0xnNUdPOU1QdmtWM25yazFzdERicWsv?=
 =?utf-8?B?TWUrQlNRdTh5bFVUUllHRVJzY3pmdzRTTVFqT0txYU5idnFwdk0vRGFMRisz?=
 =?utf-8?B?QWxZdVh6c1pFakg4T004aENVVmtLbTBZMlkvYkRNcjlIVUdZUURHUWg1dGRJ?=
 =?utf-8?B?Q2hoTGRYd1VNTlRjb2tWbE1Hb3BWQ2N0aXNEZHJwVmZFSmlQQVltcWpZS3VQ?=
 =?utf-8?B?ZVRBSkhBN2hrbVlZbTFFZEZmNFpPRjgzN2EyWUhCTk5PaituZUVNY1BXKzdZ?=
 =?utf-8?B?RStCNW1SRktEb29Oalh4V0xPVTY1cHA4R0FEQmdwZ1cwcU5RYTc0b2FNQnlo?=
 =?utf-8?B?Qm0xT3d1NVlDZlhyR0s0Q1c4Qy9Oc0VYd2ZzSHdBbityRWNJajRONVVpc2Zk?=
 =?utf-8?B?V2RDZ1hEZ2RmcE40aGdxWXpSMzZjY2ZHRlZsT2JtNkNaeVZ6NDRPRU43YnFa?=
 =?utf-8?B?UTB1dkdLcHJ1bW1haHBNRUh1NktURE42Rk15QlB3S1pZQXlCQU1vRVFXM1Zm?=
 =?utf-8?B?YTBwRUZITk9BdjE1OEFBWjZuY0trTGFMUjNzKzNVaXJmbGVFN3VaQzZWbWlR?=
 =?utf-8?B?ZjU2SGRVcWNYVTBYN2hEU3RxNzdmODA4K0c0c3EwTEVHc010REZFam0rNFpL?=
 =?utf-8?B?LzJxc3FNdzh1bXFvN3A0TjEyWXlzdjh2RUZKYTJyZG13M0V3MTFiTmZaK2dP?=
 =?utf-8?B?WERwdDNaSDVuakZjNnMrYjhRQTd0MHAySU92Q3gwTG9qVmcydTRoYnlxOTQx?=
 =?utf-8?B?Mm1sY1Bvcm9rVnhDRnNjVVl2L3FqQ2NlUEJWdTNoNG1teThSeDQ1NUZ1TDRm?=
 =?utf-8?B?TVI4MXdPUDBDclhOaFZUM2EzU293clpWS1daZXBKRUlRdXF5bngxcCtHL3JF?=
 =?utf-8?B?bWtmVDJueWJSRzV1eFN0bFZLeE9tTGkyc1JVeTEwaGlXaWJrZGtVdzdNVzhQ?=
 =?utf-8?B?UFRoMmxTYVdqNWtESC80cTVuY0xrdUc0WWkzSFZiYUIwYkFmVEMzV2ZncU0v?=
 =?utf-8?B?aGx1M3g2U1JQY1BqRGZwWUErWFg3NnFqYXlSaklRY1htVHlpMDh1SGJsN0RT?=
 =?utf-8?B?dkk2UWFEQis0ejgyQzdUWDNUbGVCb1pSdmN0MDljNXpJK01qc0k4ajROZTEy?=
 =?utf-8?B?SDVjUkhFVXM0OW5NYUhNYVBHandqenBlSXJwdzhNeVBUYjJqUzQ1ekpTRGJr?=
 =?utf-8?B?aU1COUtDZ2lYelFoMjZPVm9NVUZLKzR5bDZ5V2RhWVRoYlhDVFNxbndLdmlQ?=
 =?utf-8?B?UURtQlpQQ0Z5MWM3YmRJM0xFbVRUU1RvOTA2SFpzM3hLQzNOM0JJR3VFeGt2?=
 =?utf-8?B?Ynl4cFU1cG5tbEwwaTJLMW9ITUpwOUd6aE5EU1UrZlJSb1NBM3Nab0NJZlpR?=
 =?utf-8?B?Ni9qdGlrVklXTmwyYWtmeGgvZkxnU2pIcmVBL2VYM3FUb0VLOWV5WVZqTENV?=
 =?utf-8?B?ZG9ZWUJleXF2bHFuL1RsNEhxaCtWUHRNK1NHTTlJVmhpVU9rNzludU9iY3Ba?=
 =?utf-8?B?SWhHOU9MeHB2UUtaVkY5UDJHZ3JiU01FdGlXekprY2huZWV6WTQ0dXBnNGxr?=
 =?utf-8?B?MFZnTzJwcXExS2owazhqekI2clJEOGkxZTdtMC9oelpoWG4wZnJHeVAycVJF?=
 =?utf-8?B?M29GUFBvckladGgwU041SWU4UzBLNTNQSkFxVzFlN01CdGRaV1ZQNVNRK3Fn?=
 =?utf-8?B?bmkvaE1DNHRVeTN1SXhRVTJVRXZtbVJhWWlLRmxIV3g0dktBaVZGbURuVkJP?=
 =?utf-8?B?d2VZZFI3TTROZythUUszWk1FSkp4c0NYMEZ1UVhtSzh3Q3lrb0RWU2FSeFBG?=
 =?utf-8?B?SEtYVGJtN1M5TDdNcjJndkhIaWZSVnhJbk9qZjFuWFBCUk9taHJZZ2hDVys5?=
 =?utf-8?B?d2MzYUwyc3o2VGx0S3ZWbHhZQ3FRZWNyQ3h0Y3JHNExRZExGMW9LV1BOblg0?=
 =?utf-8?B?SFprRWZ6SU5KOFIxU0JQRmpkcmpzWndOdW1YRVl0ZGZkR1BoNU9JUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D474DE127295C848B2EA7F834FB1680A@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fefa13-d4eb-4991-62ef-08da5001b570
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2022 01:35:49.5421 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IhITlYlcGced3axyFSEf3tVssGiU+Z9YhUnVQhabC0xDBIk3bX+xRepq9dFyQ/lPTp4wgK+4KBi9mCyj3zdgNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB8710
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "deller@gmx.de" <deller@gmx.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "lersek@redhat.com" <lersek@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIyLTA2LTE3IGF0IDAxOjIxICswMjAwLCBKYXZpZXIgTWFydGluZXogQ2FuaWxs
YXMgd3JvdGU6DQo+IE9uIDYvMTcvMjIgMDA6MTgsIEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyB3
cm90ZToNCj4gPiBPbiA2LzE2LzIyIDIzOjAzLCBaYWNrIFJ1c2luIHdyb3RlOg0KPiANCj4gW3Nu
aXBdDQo+IA0KPiA+IA0KPiA+IEknbGwgbG9vayBhdCB0aGlzIHRvbW9ycm93IGJ1dCBpbiB0aGUg
bWVhbnRpbWUsIGNvdWxkIHlvdSBwbGVhc2UgbG9vayBpZiB0aGUgZm9sbG93aW5nDQo+ID4gY29t
bWl0cyBvbiB0b3Agb2YgZHJtLW1pc2MtbmV4dCBoZWxwID8NCj4gPiANCj4gPiBkMjU4ZDAwZmI5
YzcgZmJkZXY6IGVmaWZiOiBDbGVhbnVwIGZiX2luZm8gaW4gLmZiX2Rlc3Ryb3kgcmF0aGVyIHRo
YW4gLnJlbW92ZQ0KPiA+IDFiNTg1M2RmYWI3ZiBmYmRldjogZWZpZmI6IEZpeCBhIHVzZS1hZnRl
ci1mcmVlIGR1ZSBlYXJseSBmYl9pbmZvIGNsZWFudXANCj4gPiANCj4gDQo+IFNjcmF0Y2ggdGhh
dC4gSSBzZWUgaW4geW91ciBjb25maWcgbm93IHRoYXQgeW91IGFyZSBub3QgdXNpbmcgZWZpZmIg
YnV0IGluc3RlYWQNCj4gc2ltcGxlZHJtOiBDT05GSUdfRFJNX1NJTVBMRURSTT15LCBDT05GSUdf
U1lTRkJfU0lNUExFRkI9eSBhbmQgQ09ORklHX0RSTV9WTVdHRlguDQo+IA0KPiBTaW5jZSB5b3Ug
bWVudGlvbmVkIGVmaWZiIEkgbWlzdW5kZXJzdG9vZCB0aGF0IHlvdSBhcmUgdXNpbmcgaXQuIEFu
eXdheXMsIGFzDQo+IHNhaWQgSSdsbCBpbnZlc3RpZ2F0ZSB0aGlzIHRvbW9ycm93Lg0KDQpTb3Vu
ZHMgZ29vZC4gTGV0IG1lIGtub3cgaWYgeW91J2QgbGlrZSBtZSB0byB0cnkgaXQgd2l0aG91dCBT
SU1QTEVGQi4NCg0Keg0K
