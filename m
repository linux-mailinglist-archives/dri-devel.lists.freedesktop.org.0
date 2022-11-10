Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD46E62479B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 17:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D1110E710;
	Thu, 10 Nov 2022 16:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 10 Nov 2022 15:35:48 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F75710E3ED
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 15:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1668094548; x=1699630548;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=DjIZY2wU4yNrdML1Vsml5P+dmdZLfmytCt8eDgtNPzk=;
 b=TZrz05IYwcEGMqJMs/4WqPtN9viaoA5X9Ah2c6m6GgONFCTkouv0zJO9
 dKaD7JNMUIRGSIr/P+BQJ9LFONyVs2JX9SwTNmapFuVgkijsZeyJle0N5
 wqfxxCVfJbAWLbFsqsXJ/2pJvInaVhFbVDdQisCiPXADJ9I4g/oHA/rxx
 78+cUaldHSZwjASXlwRnEo+3yVRxQKlL+HKIc8Pt2EzKCuh4IIiMDBgZG
 IC29U7oi0jZEHPtDHhGj15bYAPQDNR/J9bfL66OopxoBdBzcbeQwGTybR
 R82UgaEXpLLFOggsmxHE2DuKEiEzM/Etsbske2JVUB4ya9NDoBrg//gbx w==;
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="188509339"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Nov 2022 08:28:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 10 Nov 2022 08:28:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 10 Nov 2022 08:28:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTFkBPSg1gWWkdkzTBRDzxA61eTXT4thvtSyj9IBUu4rQIMs+fikGBL2fxyJYBCftdW3Gyrs3slQu7PDcOQ4m7B3TCWsn6dWCOrKdiVtrIz9C2Nfdub/VbWK53eUfMNqhDkxnHYAiAOXagXqAWpI3ycSeo+f5RnHmTE2Zk23Yq/pNMiyOf9TSo+M/K9LZrlejyEVAyb30I0XvQQrzLly8IQDNAUFGmsBgY8g+Hb3CqoYswIouRZEwxkLkYg9UBxx6JA+Wv32o5avpYTKJ/boWngUq0N4KMHmzKCvAXbOqFm2ivRtIcXTd1RwyOpfyQVJVPbKv2uSh8LfsI5gI4TX5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjIZY2wU4yNrdML1Vsml5P+dmdZLfmytCt8eDgtNPzk=;
 b=IMgF9qNh0fz8hTA1irEKzGZd+5Fem7mIoP9Fl4faMBQ86hEDnN0FbLWvZt5vZOCeP28KdVpK6x63G7Iu4kXivKjwuIDkAUItrxUJyOyxQ+6pypI2MrQrJHXfFKbYNF8McWLZgz5dt8cR5ASCjiyPIBonsF8BGi1SZ6mX6p8/PvuWunWqyQ+JQZBLT6Fy8H9X3cCDsU8WAhXsYnotc3404AX0B31l6x+bnLcst2dDD/Y5fxZrHYn4xWbWWGyDr9wUKyh/gKxzpwoisTBlWeDIIKq9CC7xAnbNoBgmv2emmdWn4346Tv93kplNUR0iKLHy5owHltbYrYsc8DXhGxhVmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjIZY2wU4yNrdML1Vsml5P+dmdZLfmytCt8eDgtNPzk=;
 b=sCQ26lWy8xKoqn58h4Vtwy6tn1bTjfE41qDXxhXUZ4zgKNb1ySzoqTWuYm5NI2IzBZPH6NWApw45+RLbs/85oPYu+ccA+EfGeMikdp8lR1aEHterAFqCbofBaTOuhjszs7QaK9oRokGOEDKYnKGI9AFztJXgxPLHVjX4t131MaA=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by SA0PR11MB4560.namprd11.prod.outlook.com (2603:10b6:806:93::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Thu, 10 Nov
 2022 15:28:36 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::51f:528c:5fde:40a2]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::51f:528c:5fde:40a2%3]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 15:28:35 +0000
From: <Claudiu.Beznea@microchip.com>
To: <paul@crapouillou.net>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: Re: [PATCH 08/26] drm: atmel-hlcdc: Remove #ifdef guards for PM
 related functions
Thread-Topic: [PATCH 08/26] drm: atmel-hlcdc: Remove #ifdef guards for PM
 related functions
Thread-Index: AQHY9RkZivKY5n3jSUuhcwLuiROKIQ==
Date: Thu, 10 Nov 2022 15:28:35 +0000
Message-ID: <6bb2ede2-f4ac-acef-d6ff-cb0d567a6d00@microchip.com>
References: <20221107175106.360578-1-paul@crapouillou.net>
 <20221107175106.360578-9-paul@crapouillou.net>
In-Reply-To: <20221107175106.360578-9-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|SA0PR11MB4560:EE_
x-ms-office365-filtering-correlation-id: 5e93727a-f09a-4542-85a9-08dac3303bdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mj/gwkqX8eSdY7zVCYu4u7Blsf7P5q4bzqD9NuJiQA/eS/AfmPGxLiQzsrjfnucXCeg0g24dh5+VLTZUDgiussdTGBYF9Ov4RyoKMwgXOyAvO2Kih+T0l2Iy2fMDQgv8XA5pHWxH2FH4/xJ/uxOZOasqholDmMssHGlW/kF2wyl3cxlOdEFxkekNzUXSa/gGOTBW4G7lF74KRbgLL1S9jOzE7g1vpcEQu+TCi1UrVZMjJ5n/ta6wap+6CAmpFcAf9pS+Zg+RMXHdt9MghBRR7PrZZak8q8oZdBKsvj5/bbBOB6fT/pPIQ8ZWdUipwe+KHaHc8nfDMISK351xmJqmHBO1fc5kryCDEKs7jPT+VxNFoJ/c8/vOnwLfcBoP2aEGijfmJPJ+mfOjl805M6fgg/OZfZQlroPXzn8VX8W68DEBQhRfV/c5e+4s9fnGdTRp8JzFT3cw84WLc0BNPCeUovJE9Xn1dzCaUYokEsdYfUH8gEl7xHFJV4/Um4C3p/qke0DtBrlEzh+0uGBUK41djFC/Nwvo7oBrCYxUQxpkB4HvHKfGtLjQRVTkpM1/jmG3iKF2ueyBcZk8yTFoUh86zBKsiF7nxc+JyHX0LJCTkOiPiTwDeOgwCjVyaI99xENYXsCkfqjmdPvWCXQh9SpfOOPhnNHAApdbTkRVl4WL4HXdVuYPQpDIfkCDr8qMxHV+7cSS14XpTzcI3jJFsV6B/Zjekqrluagfb/xIUlVuHyFUvJpyqjO9JbL0IcQBz41jzSv/kGFUkCFUGsb2so3e123aLhNnILDeZ0NKzxJJ6pwKzoIXaMx8o2Sh8yGhoOFi7ZYQajEh+n3kdoK9YGXq3w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1953.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199015)(31686004)(31696002)(478600001)(6486002)(86362001)(71200400001)(83380400001)(66476007)(7416002)(8936002)(2616005)(91956017)(38070700005)(5660300002)(2906002)(66946007)(66556008)(186003)(6506007)(38100700002)(66446008)(8676002)(36756003)(122000001)(41300700001)(6512007)(53546011)(64756008)(26005)(4326008)(110136005)(316002)(76116006)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blFMemJqRkk0UkpESXNoK3NLdnJldjBnSTRkWHZ0ZnlSeWJYNGc1SERpeDBC?=
 =?utf-8?B?NUUzaWxpc2tOMEpNK3o1R2dBUUJoc2QxOUEvN0UwS0lKZldqWGc1S2dsdGRS?=
 =?utf-8?B?d1RXc2tmKzBBY0lhQWxUSXNjRTdhMEIxamoyc1M0QktJbG45N0lKRStDLzNO?=
 =?utf-8?B?UHBpZ0VLTlR0Y2RESHhyNGhpZlVJejZXeklyTExCb0duVzlBVGovMjR6aW8r?=
 =?utf-8?B?ekdxOVAxMFpacFdoeFBMVGY0R3pOUmxGZFBGYitxWlhYQ3lBOENzb1l1aHJn?=
 =?utf-8?B?WWFQbjdDLzBvK1Bkc1NrSmcydStoSElCaVFLbGo0OW9zNkt2R0p6SlBpYXlM?=
 =?utf-8?B?OXBKOFMwU1N4RTdtMFlYZ3VWTUxHbzVuR0pOMkxaYzBDRUY2U2Q4dmZNWFdn?=
 =?utf-8?B?RmNtZE9hWmQrd1VsdHh0Njd3SVMxWlVpTE5mbXlsejVlNlViaWxZTWE5OXYy?=
 =?utf-8?B?YVRKREkzcVN3bUQ1NTA5K3NqTDZkQ1lOL1k2SzVuNGp5dTJidWt4UC9rb3RT?=
 =?utf-8?B?eHJOcmFhMHgzbHkzMnFxMEx5WDlFZXJTY1dYRHZkWHJHNGQrU0J2MkFVOU9T?=
 =?utf-8?B?RnlYL0NDYnZoTWF5cDY4d0d5aHlrUHpUR0R1encwbEthQlBCWWovajFoVnBa?=
 =?utf-8?B?Ync2QXQyZVZPc1RKd2xnNEw3NlhIRGx0VCtuSFVVSWcyblgvazV2WW5xeWo4?=
 =?utf-8?B?RDAxSU5RTTl0QWRnS2JRTWtzakxYaW9yZHJvS2x0NFNmMHAycDY5aHVqZVpO?=
 =?utf-8?B?SWM1UzdKOVNXWDFHWFc4dU1aV3dEVy9nNFJMR2p1TEI3cmViWmwrS1Zqazlh?=
 =?utf-8?B?cDhVSHQxVE5xckxiWTdCRlFwendJc0w3Z0Zxc2JjelN0MHA2NHhQUEsydCsv?=
 =?utf-8?B?Y0FaaHBMMkFkdlRtaGFOdEQwZGIyTXRLZ0tlZmRGeHRVS0JFZWJRV3RwNVJa?=
 =?utf-8?B?VjFKNlRGVHJyUE5QTGZsK3pheGdlR2hJd2lNZFdKY3BaUXNjMHg0QmJWR0hh?=
 =?utf-8?B?cldmNE5MUDdMTFE0TGxIZjMzMzFLYlc1WEo0NzBKQUFhZjNtRWUvc2ZiWUVu?=
 =?utf-8?B?clZvY1l2T04vMFVCR3JxclR5Q1lhczZHV0o3OUs0RzNCVmpkWDNQSGhCMGY1?=
 =?utf-8?B?SkJKZVF0dVkvbmlGRlIyb3lGVjZmOWNXYXRWUFA3dkt1cHhvQkNEemFGSEND?=
 =?utf-8?B?Mm5yQm9UbHVpelVwVU9COEZaREZ3ZGJDcXlMSnBPSk1vUmQyeHIyTldMN2Vx?=
 =?utf-8?B?U2c1ald5WVBSemI5b0h2cXoyYXNWeFZTbmVGQlhmTHF0bmQ2QmVsWUVYY2J2?=
 =?utf-8?B?ckhDUllSdm92UlJTQ3N0czViNDYxanQ1SkZJcWhmT3ZKM0JUeWlmMGw3WGIr?=
 =?utf-8?B?dlFhaVlGdmtMek9IQmc3bStvN0t4ODlJSmxOQ0tNSUVTcDBUL0tyNXMyTmQ5?=
 =?utf-8?B?RkNlcCs3L3k5emNEbmFxOWh3aStXekZrVEY4Vko1bVU1U0xUbWovYVRoWGtC?=
 =?utf-8?B?WjJBNjFTaXVlOWsyQ3BtWWJ3a0Q5RWoxZkFGTVlUOThERXg0VW9OcnRIZTV5?=
 =?utf-8?B?SldKZFJKOStmUzM4bWJiYlpaK1htMElOSVlsUC9QckczTU84NUZGN25TeThM?=
 =?utf-8?B?VU9FWHQ0d0VFaWphNml2ZlNTb3VMTmNnWGhOTEJtV0hib1JhZVlKRnQ5QVd2?=
 =?utf-8?B?TGR6QXpTUWh1d2FjN0o4d1hGY3FZR1JRTzBvcUs1TTFMblh5MjFoWDA0TmJm?=
 =?utf-8?B?WlRQOEY0L0dibllPWXgyL0tPeDAydldZNUZuanZ0b1FxdDY1TGZBekdXWjdh?=
 =?utf-8?B?bHhCem45M0hPMVpvUlVLU0VFemVqRis2R0lvMGR2cVFOOXlEOFdJZlRLWlUw?=
 =?utf-8?B?M2tFT2xSWWpKR3VNZkN5YTFMRjluM2kyY1VoUHdyeDdydjVwZ201L3FRUTFM?=
 =?utf-8?B?V21TRFJOMi90T005ck41ZUk3NVQzVlVKUmNXenBKS1hod3JKL0NXYWJFditH?=
 =?utf-8?B?RkhuYVBDUklEZzlkK1E1QXFFakpHeHVEOVF1VDVBaWFaSm1jZGN5RzB5TDU5?=
 =?utf-8?B?blg0eWR5Z0F2L21DT09MeWVaWEtnR2w2czlQelpiRDQ4S09jbUw3TThZa1Fa?=
 =?utf-8?B?MWY4cWhnejErMDBHQWZqTTBjS1FNaHNjNjJHcUplZC9WWVE5UE5MUkdmT1Nt?=
 =?utf-8?B?bHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F17590014B82C4D947065763F6F20E1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e93727a-f09a-4542-85a9-08dac3303bdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 15:28:35.5875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z11LOGTVpu4tvIsTs4DxSqC8EpPc7dEdZGAJQlLOQBKgZjxNIGnwmpzL5IsTidhnpb4FPwcKqwF/zJnR7hlH+ur374M3EDMrsvKGcu6O0tE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4560
X-Mailman-Approved-At: Thu, 10 Nov 2022 16:51:48 +0000
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
Cc: alexandre.belloni@bootlin.com, bbrezillon@kernel.org,
 Nicolas.Ferre@microchip.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, sam@ravnborg.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcuMTEuMjAyMiAxOTo1MCwgUGF1bCBDZXJjdWVpbCB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBVc2UgdGhlIERFRklORV9TSU1QTEVfREVWX1BN
X09QUygpIGFuZCBwbV9zbGVlcF9wdHIoKSBtYWNyb3MgdG8gaGFuZGxlDQo+IHRoZSAuc3VzcGVu
ZC8ucmVzdW1lIGNhbGxiYWNrcy4NCj4gDQo+IFRoZXNlIG1hY3JvcyBhbGxvdyB0aGUgc3VzcGVu
ZCBhbmQgcmVzdW1lIGZ1bmN0aW9ucyB0byBiZSBhdXRvbWF0aWNhbGx5DQo+IGRyb3BwZWQgYnkg
dGhlIGNvbXBpbGVyIHdoZW4gQ09ORklHX1NVU1BFTkQgaXMgZGlzYWJsZWQsIHdpdGhvdXQgaGF2
aW5nDQo+IHRvIHVzZSAjaWZkZWYgZ3VhcmRzLg0KPiANCj4gVGhpcyBoYXMgdGhlIGFkdmFudGFn
ZSBvZiBhbHdheXMgY29tcGlsaW5nIHRoZXNlIGZ1bmN0aW9ucyBpbiwNCj4gaW5kZXBlbmRlbnRs
eSBvZiBhbnkgS2NvbmZpZyBvcHRpb24uIFRoYW5rcyB0byB0aGF0LCBidWdzIGFuZCBvdGhlcg0K
PiByZWdyZXNzaW9ucyBhcmUgc3Vic2VxdWVudGx5IGVhc2llciB0byBjYXRjaC4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pg0KPiAtLS0N
Cj4gQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4NCj4gQ2M6IEJvcmlzIEJyZXpp
bGxvbiA8YmJyZXppbGxvbkBrZXJuZWwub3JnPg0KPiBDYzogTmljb2xhcyBGZXJyZSA8bmljb2xh
cy5mZXJyZUBtaWNyb2NoaXAuY29tPg0KPiBDYzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRy
ZS5iZWxsb25pQGJvb3RsaW4uY29tPg0KPiBDYzogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6
bmVhQG1pY3JvY2hpcC5jb20+DQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcNCg0KUmV2aWV3ZWQtYnk6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUBtaWNy
b2NoaXAuY29tPg0KDQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRt
ZWxfaGxjZGNfZGMuYyB8IDkgKysrKy0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19kYy5jIGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhs
Y2RjL2F0bWVsX2hsY2RjX2RjLmMNCj4gaW5kZXggZjdlN2Y0ZTkxOWM3Li4wNTE0NjkzNmNjNzAg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19k
Yy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19kYy5j
DQo+IEBAIC03ODQsNyArNzg0LDYgQEAgc3RhdGljIGludCBhdG1lbF9obGNkY19kY19kcm1fcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgICAgICAgcmV0dXJuIDA7DQo+
ICB9DQo+IA0KPiAtI2lmZGVmIENPTkZJR19QTV9TTEVFUA0KPiAgc3RhdGljIGludCBhdG1lbF9o
bGNkY19kY19kcm1fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICB7DQo+ICAgICAgICAg
c3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gQEAg
LTgxNSwxMCArODE0LDEwIEBAIHN0YXRpYyBpbnQgYXRtZWxfaGxjZGNfZGNfZHJtX3Jlc3VtZShz
dHJ1Y3QgZGV2aWNlICpkZXYpDQo+IA0KPiAgICAgICAgIHJldHVybiBkcm1fYXRvbWljX2hlbHBl
cl9yZXN1bWUoZHJtX2RldiwgZGMtPnN1c3BlbmQuc3RhdGUpOw0KPiAgfQ0KPiAtI2VuZGlmDQo+
IA0KPiAtc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKGF0bWVsX2hsY2RjX2RjX2RybV9wbV9vcHMs
DQo+IC0gICAgICAgICAgICAgICBhdG1lbF9obGNkY19kY19kcm1fc3VzcGVuZCwgYXRtZWxfaGxj
ZGNfZGNfZHJtX3Jlc3VtZSk7DQo+ICtzdGF0aWMgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTKGF0
bWVsX2hsY2RjX2RjX2RybV9wbV9vcHMsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYXRtZWxfaGxjZGNfZGNfZHJtX3N1c3BlbmQsDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYXRtZWxfaGxjZGNfZGNfZHJtX3Jlc3VtZSk7DQo+IA0KPiAgc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQgYXRtZWxfaGxjZGNfZGNfb2ZfbWF0Y2hbXSA9IHsNCj4gICAg
ICAgICB7IC5jb21wYXRpYmxlID0gImF0bWVsLGhsY2RjLWRpc3BsYXktY29udHJvbGxlciIgfSwN
Cj4gQEAgLTgzMCw3ICs4MjksNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBhdG1l
bF9obGNkY19kY19wbGF0Zm9ybV9kcml2ZXIgPSB7DQo+ICAgICAgICAgLnJlbW92ZSA9IGF0bWVs
X2hsY2RjX2RjX2RybV9yZW1vdmUsDQo+ICAgICAgICAgLmRyaXZlciA9IHsNCj4gICAgICAgICAg
ICAgICAgIC5uYW1lICAgPSAiYXRtZWwtaGxjZGMtZGlzcGxheS1jb250cm9sbGVyIiwNCj4gLSAg
ICAgICAgICAgICAgIC5wbSAgICAgPSAmYXRtZWxfaGxjZGNfZGNfZHJtX3BtX29wcywNCj4gKyAg
ICAgICAgICAgICAgIC5wbSAgICAgPSBwbV9zbGVlcF9wdHIoJmF0bWVsX2hsY2RjX2RjX2RybV9w
bV9vcHMpLA0KPiAgICAgICAgICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gYXRtZWxfaGxjZGNf
ZGNfb2ZfbWF0Y2gsDQo+ICAgICAgICAgfSwNCj4gIH07DQo+IC0tDQo+IDIuMzUuMQ0KPiANCg0K
