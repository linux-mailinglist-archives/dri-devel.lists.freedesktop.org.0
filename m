Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 016B548CD82
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 22:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA5210E5F6;
	Wed, 12 Jan 2022 21:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Wed, 12 Jan 2022 16:17:07 UTC
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com
 [216.71.140.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB01110E2CB;
 Wed, 12 Jan 2022 16:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qccesdkim1; t=1642004227; x=1642609027;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UIKHCDBMuWnUkKCl9PNaNtJHE+OyIdxYGIqTJsja2Ok=;
 b=fYUQ+aBZO74LzMDHeI8SHzjTe7GwhWlSrYBzMjQ3YAKFJSfwZ5Rkv1x0
 34l0NNCBdQxTGUja9+MG/HR8SsxFlaaZ0q3Ehw08+aCtCwlDMlQScjS+o
 3b5qMEaRMXYRYW6Uy9Is2MLIkvRhHlHM0yR3muKGbvg+RTAlvJ+V4YOKb Q=;
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 16:09:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1JazjCnl0vRwwdzaY721+4Y91wmgVLD87MAeYYBR4Hg2TSvvR+p9JcM4zzjvptDZjsqiV8YD+4h3Il7t5SZ6xrLhruHjQsmPdcrRueb+nsluZvje4w++/hnMHVXDqu6w+TQCg3Rm+CXahYCxo3CPqDk4RG7sZmpOJMWdo2HX6kEkGtyislq/fEBs7SZMfn+9eukdkH0C4EKtuuS5tmc4Vr4sQxDS6o06Vu1RFO2jDi7HdBoY+JUwsVclsrpDXZ3VnfzytJTQhO2u8Uvhfywvcu2D2O//eUoI+2PRewLQCP8Y3p0xAT64sD0TnEookGnLzthrMAv2518MeDYnuWcZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIKHCDBMuWnUkKCl9PNaNtJHE+OyIdxYGIqTJsja2Ok=;
 b=MgDSkFVvNKgsq7ESoP5zi0V4FKmaS/cLZ24GbgUAy7wo/OV8oNbt8pE7TdChSft3wfmXOoR0nPlOvv3CIpjZ/Vui8J/1P9UraruNXjv6OV8NwRknneDvj9GCXz1JOmrT3UmPCmGPIeKjmaqjPkPjSGah2ym1gRiNPslAQNFM7xYYXR6wlQoNjkMPmEIJ+MljIvwQQkLrOatHN+rig2nfWRw1QqNdlpFklvQiVplnS4OrgkYU9c1R9CPpJjIHmLkKUFe0vFAl4drjSanvRkEB1HH5KPni8lquX/4NLOOIf92ssLuyxsDxoOKfRIn1+tp6urVzPwlz0P27lNHTgLeT/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from MW2PR02MB3820.namprd02.prod.outlook.com (2603:10b6:907:c::16)
 by CO6PR02MB7587.namprd02.prod.outlook.com (2603:10b6:303:ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Wed, 12 Jan
 2022 16:09:50 +0000
Received: from MW2PR02MB3820.namprd02.prod.outlook.com
 ([fe80::d941:6af6:1ee:d00f]) by MW2PR02MB3820.namprd02.prod.outlook.com
 ([fe80::d941:6af6:1ee:d00f%5]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 16:09:50 +0000
From: Rajeev Nandan <RAJEEVNY@qti.qualcomm.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, quic_rajeevny
 <quic_rajeevny@quicinc.com>
Subject: RE: [v2 2/3] drm/msm/dsi: Add dsi phy tuning configuration support
Thread-Topic: [v2 2/3] drm/msm/dsi: Add dsi phy tuning configuration support
Thread-Index: AQHYBiFyuvcnl+olxE6SmJwn9wyQIaxcS+KAgAM29OA=
Date: Wed, 12 Jan 2022 16:09:49 +0000
Message-ID: <MW2PR02MB3820E98516A4F484A3ECF25FEA529@MW2PR02MB3820.namprd02.prod.outlook.com>
References: <1641819337-17037-1-git-send-email-quic_rajeevny@quicinc.com>
 <1641819337-17037-3-git-send-email-quic_rajeevny@quicinc.com>
 <CAA8EJpr_iEvv3oM-KteT7or3HyMk45Z8mzWyKwZ=rnASm-hNXA@mail.gmail.com>
In-Reply-To: <CAA8EJpr_iEvv3oM-KteT7or3HyMk45Z8mzWyKwZ=rnASm-hNXA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77be1327-3dc8-4e32-549a-08d9d5e5f605
x-ms-traffictypediagnostic: CO6PR02MB7587:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <CO6PR02MB7587EE4022A5DC372DA1A096EA529@CO6PR02MB7587.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jssHEEYt3wnAxi2SDR7OYYjfKcYJR5DyMjAvf1b3Yqvs9HWEnU72lp7coX/O4krT58WtsSYgladuop8FSI6Z/5F6SzEK4Yg0iYyq6zmTM/ugiH+36KRQuZP4ZFf/ir4el5jzR4ewHDmib6IkdgUY/fbizHjqZ08yHz5UpUk5vo9qKUEGWvWac5DiKHKsWzYQpSMd4QuEwZZgnqPwNFXkyYQzOjlXjALVHcjkylWDx3ugZ8A/vF8FcGRIEQl/cq3L4M7uB/xc5+I/miBOgV4EBstP8JKNz3tCnowq8Z1vleo9bxvGgEePoq1Jg35touM62oGWdDo/O7GS16yUNZgxU4lOdQ6tVFwZKQc1KUDnjiFd2njRGiG3ezUFDmNAs0i5YHFpZ0HNxEXaZKtzZob0PbEfYtdzQ9mekdOtpxi6Eu34AEhpnVVkOaTa9pJ8XcR9H6lQUTkdpjGguz0GJj18sW6+I4Qa9nZmLyUU/vCN/h8lFITmyCiaFGiw8Eq44Dvsv7xzdvZ7pk4FW0aXmdxpz7Tvnr02R9JRkwkR4UCB+R13BfH8EWoqkTQwaNChVAI+pcGrWkWcAG0A2JEPyjm7Q+/j0PAhCS+Z2+StwhNr9gxR2uCQrc0CDaJErP2LjVLe+3KP7aNxjlNSniff7sAOWzuize4x13o7hm5CsHpLgy2SSijnr5n14tfpEid643mS2yaqWzGuxqJQj4d22OE5sA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR02MB3820.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(9686003)(38100700002)(83380400001)(2906002)(38070700005)(4326008)(122000001)(33656002)(8936002)(5660300002)(52536014)(110136005)(508600001)(54906003)(7696005)(66556008)(26005)(76116006)(55016003)(6506007)(86362001)(66476007)(66946007)(316002)(64756008)(7416002)(186003)(71200400001)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGpMVFVBY1hMZXo0Y2FNaEQwUTd0ckN0eHc3S0NxTVpKR01aWjljaTczd3BX?=
 =?utf-8?B?UldLcitsbSszdWRhSXJhU3hLR1ZUNmZyUG5LZm9TSS9vbElrd1BKdXNlb0RP?=
 =?utf-8?B?K0M2bEJzdDZXaVl2NGZ1cFR4QWtnb09rZUdvVG9Rb3c1bWlOd0NTTi80cUtB?=
 =?utf-8?B?eENvK1IxMzFYbVFMbHFhMUZKQWZaQk1jZmNNb0pqSGtON0h4Qzl5d3RqbDhq?=
 =?utf-8?B?TmxWWmlpcVpMbFQ1Y2VQckN4RC9JR080L0Y3ODBEUEk0YlpaTW9rLzFWVTNU?=
 =?utf-8?B?dkliN1IzUGpsQkRYYXpXdFJEU04ydlFtbjNGNDJCTitlVFVOalhhcVFMMHBQ?=
 =?utf-8?B?Z2EyeWdKS1d2VzBrbThNVHNqajJ3SnVEWjVYeXRoTlNoWVVzSHE0TE1ESmhZ?=
 =?utf-8?B?bFV4UEkyc2xjNHBkQlF5LzFGTzVUcE16WlJ5QkVBYlhmcjA1TzVJWFVHWGUr?=
 =?utf-8?B?aXhiQm44cVBxRmxPaDN2RGV4bEExbzBpT3JtRXIxM1FUZWxjeXNoZHlianhI?=
 =?utf-8?B?L0xiMDEwN0xLUlAzalhvc0YrRXdFdWpRbEZKM1UyaUdzL29LbnBVcjVCUUgx?=
 =?utf-8?B?OVo4NUVTYzRWemNYRzJCWjd2TnZCWlN3WmtORjgzVXRNbzdqRCtBNVBEcEE3?=
 =?utf-8?B?Mnk3b1hseVUzMlBSVWtKZnptRnJOQnRuUDVHZkhNM3hVT1FiY2UrS1BXcTBn?=
 =?utf-8?B?RnF0ejJLdkZlaFZqaW5yTVZ2d3hWdGlTcktNWEhoWVRFWHJtQWErUzRsVWZ6?=
 =?utf-8?B?cXU1SERvYWZwbHhoU2RtWEtxdFRJZ2RTR0RGRThQMW5GNjVIbVB3ellhb2JW?=
 =?utf-8?B?OTdtL3ZvZmZRRUwzM0dONW0yU2ZPS3l3QkRYcWh4QXU3RWV5OVdrUlg2Q0V0?=
 =?utf-8?B?WWZHOW9jbHIyRFhXY1F3c0NRVVVsVGVnUUNKc1NLQXNsOWhkRXVnT3RNT1lB?=
 =?utf-8?B?NXpuWTZPdjdhRnFhZkhjTFZDZDdWRnBOcytINElZa01abGNSSUpWT2EvcTVj?=
 =?utf-8?B?WWVqbjdyZ2FMV3BneldGVFdpck1wU2NsbnB4ZGRNbFVsWC80R1dJanhsVS9L?=
 =?utf-8?B?Zm9FTnlFM2ZSN0l1TWh4a1AwWWMwNXhoTHRUYVhscEwrK2xZZksrUUh0QWNm?=
 =?utf-8?B?a0JjQ0xBRjFtYTRpLzErdVBxaXlVa2FmVFFpakZMU2NGaHQxcFZZUW1oTEw2?=
 =?utf-8?B?T2RJRXIvUTZsK2paUGdwakpHcC9QU3V6VlFoTVFwd2FFTmQyMFBka2xmSG9E?=
 =?utf-8?B?OTJ5R2pUMEVZRWE0ZnptWnlxWVVwQ2xyYW1ISEMwZFZjZTZpWWVXNkZzYWIy?=
 =?utf-8?B?bW4wdng3OGlqSm53MVZ4MDJYTExSMUJLOFJBMk1CTWQrN2hKMVBIWE1YZXVF?=
 =?utf-8?B?WnRkUlFRY3E1M2xBZlYzNVNGSDFNYVBGY1oraGFZZEtaMmJqTENvblFHVDRP?=
 =?utf-8?B?K2pYRXNLdnl6QldwVEo4VXhiWUZBTVV6Z3RmUFhEV1dCbU1CSk9oNDRWL3Nj?=
 =?utf-8?B?Uk5ybEg1T3Mrdmx5czBWQXdCY0NoRThoVWo0UEsyRFVreW9FZVhFY2oyN0lJ?=
 =?utf-8?B?QlJPQlZwOEZXUjRSL3Zka3ovRW9WUll0ZnpvVXc5Smw3SDh4dlhTeG9SQ2dD?=
 =?utf-8?B?cTBjTHMxbWFiTDdDbG05clI5dHJ2VXhWcjdNSEUyTGYwRk1uRVNoa2V2VkdS?=
 =?utf-8?B?YmJpeFd1cWs4Q2thK2FiMUlxbVEza2dLME9kM2tsK3A0cWhuU0c3RzJ5Ymsz?=
 =?utf-8?B?dWZYaldIT0pzaXNVRldDTU9aRFBMckdUMU9IMUdjajlOamViUGlvNnRwZVUr?=
 =?utf-8?B?Z09YVHJFOGl6aG42QUZuRUFPa3VyeURUUzZqVjcwUnlTbXoyTklQaXZ4YTRQ?=
 =?utf-8?B?bHdtVE9EVnhDRzNZcUwxQXozdVJFdFdQaFBiUVNhQjBiZ0oxdC9vanppR2lU?=
 =?utf-8?B?V0l0VWd6VDBERStTVTlBZU9TeDlqODBFODViSzhXdkdzUVBFOVBYdUU1V0o4?=
 =?utf-8?B?TE9qRWhWckVRMTFCWXN1eDBJeGt5dk5rVDE2cVFtRWN4M3MvckZiSlhrL3ZE?=
 =?utf-8?B?RklrajRUVDNleUx3a01GemV4UGxKUFUvdzhFOUZ4ZEhOdEVpcml6MEJEdXYv?=
 =?utf-8?B?S1NlMHgzLzZ5NHVHUG9TY0VkY3A2cXlRU01qblBaWXNVd2Rvc2ZrREV6MWJR?=
 =?utf-8?B?SmsxQmNZTmx2bDRZU0ludzhIVDNFVHZ2dzlWTkZHVWFOSjZNU0Zvd3g5R3kv?=
 =?utf-8?B?YWl0S1FVSDF3VUZUaE01Ti9TeURnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR02MB3820.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77be1327-3dc8-4e32-549a-08d9d5e5f605
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2022 16:09:49.9844 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RRaRBMIz1oZnTcuSnM5rlkoz3Kqyf4Me1DChS/firbXCCXQ75DU8TAViYmo128G8TFQ7B1SbCMm+aBKgsBbXhRgnLnYe5ScYKC3DTgch6c4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7587
X-Mailman-Approved-At: Wed, 12 Jan 2022 21:16:00 +0000
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "jonathan@marek.ca" <jonathan@marek.ca>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 quic_mkrishn <quic_mkrishn@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "sean@poorly.run" <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LA0KDQo+ID4NCj4gPiArICAgICAgIGlmIChwaHktPmNmZy0+b3BzLnR1bmluZ19j
ZmdfaW5pdCkNCj4gPiArICAgICAgICAgICAgICAgcGh5LT5jZmctPm9wcy50dW5pbmdfY2ZnX2lu
aXQocGh5KTsNCj4gDQo+IFBsZWFzZSByZW5hbWUgdG8gcGFyc2VfZHRfcHJvcGVydGllcygpIG9y
IHNvbWV0aGluZyBsaWtlIHRoYXQuDQpTdXJlLiBJIGRpZG4ndCB1bmRlcnN0YW5kIHlvdXIgY29t
bWVudCBpbiB2MSB0byB1c2UgY29uZmlnX2R0KCkgaG9vay4gSSB0aGluaywgbm93IEkgdW5kZXJz
dG9vZC4NClRoaXMgZnVuY3Rpb24gY2FuIGJlIHVzZWQgdG8gcGFyc2UgUEhZIHZlcnNpb24gKG5t
KSBzcGVjaWZpYyBEVCBwcm9wZXJ0aWVzLCBjdXJyZW50bHkgd2Ugd2lsbCBiZSB1c2luZyBpdCBm
b3IgUEhZIHR1bmluZyBwYXJhbWV0ZXJzLCBhbmQgbGF0ZXIgc29tZSBvdGhlciBwcm9wZXJ0aWVz
IGNhbiBiZSBhZGRlZC4NCkkgd2lsbCB1c2UgcGFyc2VfZHRfcHJvcGVydGllcygpIGluIG5leHQg
cG9zdC4gUGxlYXNlIGNvcnJlY3QgbWUgaWYgSSBzdGlsbCBkaWRuJ3QgZ2V0IGl0Lg0KDQo+IA0K
PiA+ICsNCj4gPiAgICAgICAgIHJldCA9IGRzaV9waHlfcmVndWxhdG9yX2luaXQocGh5KTsNCj4g
PiAgICAgICAgIGlmIChyZXQpDQo+ID4gICAgICAgICAgICAgICAgIGdvdG8gZmFpbDsNCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuaA0KPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuaA0KPiA+IGluZGV4IGI5MTMwM2Eu
LmI1NTlhMmIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2Rz
aV9waHkuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmgN
Cj4gPiBAQCAtMjUsNiArMjUsNyBAQCBzdHJ1Y3QgbXNtX2RzaV9waHlfb3BzIHsNCj4gPiAgICAg
ICAgIHZvaWQgKCpzYXZlX3BsbF9zdGF0ZSkoc3RydWN0IG1zbV9kc2lfcGh5ICpwaHkpOw0KPiA+
ICAgICAgICAgaW50ICgqcmVzdG9yZV9wbGxfc3RhdGUpKHN0cnVjdCBtc21fZHNpX3BoeSAqcGh5
KTsNCj4gPiAgICAgICAgIGJvb2wgKCpzZXRfY29udGludW91c19jbG9jaykoc3RydWN0IG1zbV9k
c2lfcGh5ICpwaHksIGJvb2wNCj4gPiBlbmFibGUpOw0KPiA+ICsgICAgICAgdm9pZCAoKnR1bmlu
Z19jZmdfaW5pdCkoc3RydWN0IG1zbV9kc2lfcGh5ICpwaHkpOw0KPiA+ICB9Ow0KPiA+DQo+ID4g
IHN0cnVjdCBtc21fZHNpX3BoeV9jZmcgew0KPiA+IEBAIC04MSw2ICs4MiwyMCBAQCBzdHJ1Y3Qg
bXNtX2RzaV9kcGh5X3RpbWluZyB7DQo+ID4gICNkZWZpbmUgRFNJX1BJWEVMX1BMTF9DTEsgICAg
ICAgICAgICAgIDENCj4gPiAgI2RlZmluZSBOVU1fUFJPVklERURfQ0xLUyAgICAgICAgICAgICAg
Mg0KPiA+DQo+ID4gKyNkZWZpbmUgRFNJX0xBTkVfTUFYICAgICAgICAgICAgICAgICAgIDUNCj4g
PiArDQo+ID4gKy8qKg0KPiA+ICsgKiBzdHJ1Y3QgbXNtX2RzaV9waHlfdHVuaW5nX2NmZyAtIEhv
bGRzIFBIWSB0dW5pbmcgY29uZmlnIHBhcmFtZXRlcnMuDQo+ID4gKyAqIEByZXNjb2RlX29mZnNl
dF90b3A6IE9mZnNldCBmb3IgcHVsbC11cCBsZWdzIHJlc2NvZGUuDQo+ID4gKyAqIEByZXNjb2Rl
X29mZnNldF9ib3Q6IE9mZnNldCBmb3IgcHVsbC1kb3duIGxlZ3MgcmVzY29kZS4NCj4gPiArICog
QHZyZWdfY3RybDogdnJlZyBjdHJsIHRvIGRyaXZlIExETyBsZXZlbCAgKi8gc3RydWN0DQo+ID4g
K21zbV9kc2lfcGh5X3R1bmluZ19jZmcgew0KPiA+ICsgICAgICAgdTggcmVzY29kZV9vZmZzZXRf
dG9wW0RTSV9MQU5FX01BWF07DQo+ID4gKyAgICAgICB1OCByZXNjb2RlX29mZnNldF9ib3RbRFNJ
X0xBTkVfTUFYXTsNCj4gPiArICAgICAgIHU4IHZyZWdfY3RybDsNCj4gPiArfTsNCj4gDQo+IEhv
dyBnZW5lcmljIGlzIHRoaXM/IEluIG90aGVyIHdvcmRzLCB5b3UgYXJlIGFkZGluZyBhIHN0cnVj
dCB3aXRoIHRoZSBnZW5lcmljDQo+IG5hbWUgdG8gdGhlIGdlbmVyaWMgc3RydWN0dXJlLiBJJ2Qg
ZXhwZWN0IHRoYXQgaXQgd291bGQgYmUgY29tbW9uIHRvIHNldmVyYWwNCj4gUEhZIGdlbmVyYXRp
b25zLg0KDQpUaGUgMTBubSBpcyBQSFkgdjMueCwgYW5kIHRoZSBQSFkgdHVuaW5nIHJlZ2lzdGVy
IGNvbmZpZ3VyYXRpb24gaXMgc2FtZSBhY3Jvc3MgRFNJIFBIWSB2My54IGRldmljZXMuDQpTaW1p
bGFybHkgdGhlIFBIWSB2NC54IGRldmljZXMgaGF2ZSBzYW1lIHJlZ2lzdGVyIGNvbmZpZ3VyYXRp
b24gdG8gYWRqdXN0IFBIWSB0dW5pbmcgcGFyYW1ldGVycy4NCg0KVGhlIHY0LnggaGFzIGZldyBj
aGFuZ2VzIGFzIGNvbXBhcmVkIHRvIHYzLnggOg0KLSByZXNjb2RlX29mZnNldF90b3A6DQogIElu
IHY0LngsIHRoZSB2YWx1ZSBpcyBub3QgcGVyIGxhbmUsIHJlZ2lzdGVyIGlzIG1vdmVkIGZyb20g
UEhZX0xOXyBibG9jayB0byBQSFlfQ01OXyBibG9jay4gT25lIHZhbHVlIG5lZWRlZCB0byBjb25m
aWd1cmUgYWxsIHRoZSBsYW5lcy4NCiAgV2hlcmVhcyBpbiB2My54LCBjb25maWd1cmF0aW9uIGZv
ciBlYWNoIGxhbmUgY2FuIGJlIGRpZmZlcmVudC4NCiAgSW4gY2FzZSBvZiB2NC54LCB3ZSBjYW4g
dXNlIHJlc2NvZGVfb2Zmc2V0X3RvcFswXSBhbmQgaWdub3JlIHJlc3QgdmFsdWVzLg0KDQotIHJl
c2NvZGVfb2Zmc2V0X2JvdDoNCiAgIHNhbWUgYXMgcmVzY29kZV9vZmZzZXRfdG9wIGNvbW1lbnRz
IGdpdmVuIGFib3ZlLg0KDQotIHZyZWdfY3RybDoNCiAgIHY0LnggaGFzIHR3byByZWdpc3RlcnMg
dG8gYWRqdXN0IGRyaXZlIGxldmVsLCBSRUdfRFNJXzdubV9QSFlfQ01OX1ZSRUdfQ1RSTF8wIGFu
ZCBSRUdfRFNJXzdubV9QSFlfQ01OX1ZSRUdfQ1RSTF8xDQogICBUaGUgZmlyc3Qgb25lIGlzIHRo
ZSBzYW1lIGZvciB2MyBhbmQgdjQsIG9ubHkgbmFtZSBpcyBjaGFuZ2VkIChfMCBzdWZmaXgpDQog
ICBUaGUgc2Vjb25kIG9uZSBSRUdfRFNJXzdubV9QSFlfQ01OX1ZSRUdfQ1RSTF8xIGlzIGFkZGVk
IHRvIGFkanVzdCBtaWQtbGV2ZWwgYW1wbGl0dWRlcyAoQy1QSFkgbW9kZSBvbmx5KQ0KICAgV2Ug
Y2FuIGFkZCBhIG5ldyBtZW1iZXIgdnJlZ19jdHJsXzEgaW4gdGhlICJzdHJ1Y3QgbXNtX2RzaV9w
aHlfdHVuaW5nX2NmZyIgd2hpbGUgYWRkaW5nIFBIWSB0dW5pbmcgc3VwcG9ydCBmb3IgVjQueA0K
DQpBcGFydCBmcm9tIHRoZSBleGlzdGluZyBtZW1iZXJzLCB0aGUgdjQueCBoYXMgYSBmZXcgbW9y
ZSByZWdpc3RlciBjb25maWcgb3B0aW9ucyBmb3IgZHJpdmUgc3RyZW5ndGggYWRqdXN0bWVudCBh
bmQgRGUtZW1waGFzaXMuDQpXZSBjYW4gYWRkIG5ldyBtZW1iZXJzIHRvIGFkZHJlc3MgdGhlbSBm
b3IgdjQueCBQSFkgdHVuaW5nLg0KDQpUaGUgUEhZIHY0LnggaXMgdGhlIGxhdGVzdCBQSFkgdmVy
c2lvbiwgYW5kIG1vc3Qgb2YgdGhlIG5ldyBkZXZpY2VzIGFyZSBjb21pbmcgd2l0aCB2NC54LiBT
bywgSSBjYW4gc2F5IHRoYXQgdGhlIHN0cnVjdHVyZSBtZW1iZXIgaXMgZ29pbmcgdG8gcmVtYWlu
IHRoZSBzYW1lIGZvciBzb21lIHRpbWUuDQooVGhpbmdzIG1heS9tYXkgbm90IGNoYW5nZSBpbiB2
NSwgYnV0IEkgbmV2ZXIgaGVhcmQgb2YgaXQgY29taW5nKQ0KDQpUaGFua3MsDQpSYWplZXYNCj4g
DQo+ID4gKw0KPiA+ICBzdHJ1Y3QgbXNtX2RzaV9waHkgew0KPiA+ICAgICAgICAgc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldjsNCj4gPiAgICAgICAgIHZvaWQgX19pb21lbSAqYmFzZTsNCj4g
PiBAQCAtOTgsNiArMTEzLDcgQEAgc3RydWN0IG1zbV9kc2lfcGh5IHsNCj4gPg0KPiA+ICAgICAg
ICAgc3RydWN0IG1zbV9kc2lfZHBoeV90aW1pbmcgdGltaW5nOw0KPiA+ICAgICAgICAgY29uc3Qg
c3RydWN0IG1zbV9kc2lfcGh5X2NmZyAqY2ZnOw0KPiA+ICsgICAgICAgc3RydWN0IG1zbV9kc2lf
cGh5X3R1bmluZ19jZmcgdHVuaW5nX2NmZzsNCj4gPg0KPiA+ICAgICAgICAgZW51bSBtc21fZHNp
X3BoeV91c2VjYXNlIHVzZWNhc2U7DQo+ID4gICAgICAgICBib29sIHJlZ3VsYXRvcl9sZG9fbW9k
ZTsNCj4gPiAtLQ0KPiA+IDIuNy40DQo+ID4NCj4gDQo+IA0KPiAtLQ0KPiBXaXRoIGJlc3Qgd2lz
aGVzDQo+IERtaXRyeQ0K
