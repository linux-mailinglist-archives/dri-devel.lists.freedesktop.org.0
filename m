Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B37B82FEE7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 03:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B255B10E336;
	Wed, 17 Jan 2024 02:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCB110E336
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 02:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705459165; x=1736995165;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fgFTxLd0zWHJzMdaS3ZiiHxFkb2ZdMOMnYwkTeGApjk=;
 b=r/aBD0uw03fg6fvJCCEA8eXnQ/hIvqHZGALOmUh4hmR/F9xwDqyIbeML
 gqgg+G7xAAZfC7CSv5YB741jafZvRoZ+gHZ+Jxbth1flvbLrsq+EdM0UK
 NgYNxMnD+GHt9jtza5ZH7VwG7nFJ6hr+hRnutNziopVoa3bkJglg/OZnX
 8HfZmF4FvHTlxPMr5+hnrjvC62wYDpNlUrRGW6CMx/KONC7V93kliUO0T
 quUYxnKizSn6TvMtoG7XmOYHpMgKK8s//4FbnsXyEzpsC7iCFG20nGKSC
 VlFye0kqw1FEuvhHbRdvAx9TCA6OoclwGyPOoHXhKfvf3jTb9/lECzK9A Q==;
X-CSE-ConnectionGUID: X2Ks7hO1TLSmO4wGNjtYrA==
X-CSE-MsgGUID: wJ86siYaR02cYtT4RHeVwA==
X-IronPort-AV: E=Sophos;i="6.05,200,1701154800"; d="scan'208";a="16049366"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jan 2024 19:39:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 19:38:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 19:38:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ET4Ik+jA0p0QHFTkBzn60Xgo2WoRRzF1osRLvhuHdZXyBjcpVwbO35pzq1ESUgXlmTwz5zBuCz957AfSNbAm7fqmNcznP9/AUhIVsWjnLyjiACePuUyM4bzsLyyhkJceGfZbGE7wAOcxBOPSFfjDIXX+nHOtzMyozv6FM/qt3rsxGzvJqgo2pLvHBHGDujdbpicb7ywlgfMYg83ESXSBrAJbZ0B1g5OYFG03bnbQqWnaCzrm8sdYsurZQWWsVbWavw5+nAGlxPYBcL3pFv9/iHNfQTQQ/QAS4TmTGDHU52R7BG4wK6/bYIRUUEo0lvacU4L2Jw4XcSRHfWGihDccgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgFTxLd0zWHJzMdaS3ZiiHxFkb2ZdMOMnYwkTeGApjk=;
 b=IOD6uhAXA9Yq/yktnQkyv6T3lWAAMO09jBlaP3H13KsiL1lH3BPCNuHRwuie6clXnJDqMdhtH56zT5kEK0opSwYS2sVV1HSmhb4e+Wnnbz1oPmJrPsNYec1dHG2Y83RZea8XpTPB5S3gPqdl21ET+j4f3hnRyVoeyRH9Im4ojbG7k+51CQerr12Bm1SA5NaYahJlQkOmxtVYFGpYlduzYM8hacgVgnJUzxgH/Og1uWcYOO6oReCa2aD3bghEXqd+mXHBT4xfc/ICVJRG9F0SVBbmzo2okrrH6Lmg+jTQZ9JUbF4cwaptLoTytOgsR+a2SdoZRTKQGxGDLAywpgq1vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgFTxLd0zWHJzMdaS3ZiiHxFkb2ZdMOMnYwkTeGApjk=;
 b=tf9NAVH+3hoCinnyFjzdLzdktw3N6LB/TYu30XxmG4Itl62b4g9AcHAIM15tDBb0QFY7MXYvMXrm+TSkenKyoDqo3GRQoTKyW9d6k5GTwD1ef8Ecj49/uEavNsQpnx6NIifkNl3htsSu+ho8sO/wNRqj0dM3ULKBQsIEcRAEvx56+9q9jR6epnnR5nqiwJ5koIxGwyx5i9DzS6ee9eixher/du8fLk2AE90samPQhq0+zgiaB4RCrRy2ViA57kTofhQeCD1Op/rApHw7IWSK7LvakDGjDYkLhgk+g2J86L7GZ6+jNupcKlK/ANe73wYmfRHPrDTtf5IdmRkxMluk2g==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by SN7PR11MB6702.namprd11.prod.outlook.com (2603:10b6:806:269::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 02:38:47 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7202.020; Wed, 17 Jan 2024
 02:38:47 +0000
From: <Dharma.B@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <Conor.Dooley@microchip.com>,
 <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <lee@kernel.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <linux-pwm@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: convert Atmel's HLCDC to DT
 schema
Thread-Topic: [PATCH v2 1/3] dt-bindings: display: convert Atmel's HLCDC to DT
 schema
Thread-Index: AQHaSHCakAdMasJgKUaqbasJdJ7S+LDc6PSAgABiwAA=
Date: Wed, 17 Jan 2024 02:38:46 +0000
Message-ID: <8dc46781-9ae9-4bc8-83f9-ef56743b8d01@microchip.com>
References: <20240116113800.82529-1-dharma.b@microchip.com>
 <20240116113800.82529-2-dharma.b@microchip.com>
 <d90d035b-c63b-4bb2-a84b-9627fca10eee@linaro.org>
In-Reply-To: <d90d035b-c63b-4bb2-a84b-9627fca10eee@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|SN7PR11MB6702:EE_
x-ms-office365-filtering-correlation-id: d2e4aa44-6ccf-45fd-14bc-08dc17056e2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +LHFNCilmTMau/LPpO7WsQFc2adG7rDJ6LBMuKwpHli697jzbYu8+RWP3wMgaiwN3G1utcZeSQ88k7ScCsDoxTXbVnKX97ivePs2fhAXIhmZ8yBDipvs9UpJWu9wqJzA13jplrpSZZBC65l8e5/B7M1Fo8+zQ7VhRBVT+b4MzQkTcGb8Ul89KZb09KU+bujHmUeZAFUoBxCMeFN5JF0EmWKvx5QZXGNRJIcFsL8Ph0eo4xtdGkiIXjfQsnuqsCTgyHV7G8T/+ZXwShE9V4dVhB1GonYtCpDMt3DYx6rt1F4a3TCugoSf8/s/DjXDV/OmjzjT4QMTfZ1o5ORmR5gKYr4mgcEOk7rNJgFS8hCL/RTPU7baKeqW/mFyR50DLorrsN1iUMXwn8W8gD/fC0oxuv68qEoVOFbbb96j+QQFfREhiUGWLYcTxCy6eFamnonhhs+8os/eCcPb8PotkV1N+P79E07hR/Cv1B3w4J7zLJKCOHwruJHuWhjO546qcYTEmUoXJPIe4+yU2CAeh+uKOnMtkpO2W49KARlAGBilBkyldMyPfeej44szGynj69Li4UazXPNYayfOgBK+dDHPt3+4xT9DpnZD1eIq4o189Jb9JSF9FRUmFJf+xW6dPvcYq1XqNHpGkp36fS226w53zZEgxUp6yow/UnM8xUku8FKreCQjpsagV88NAKnuBPhC8Tn/z1jpZyMu7DyAqCfa1g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(346002)(396003)(376002)(230922051799003)(230173577357003)(230273577357003)(1800799012)(64100799003)(451199024)(186009)(31686004)(6506007)(71200400001)(107886003)(53546011)(6512007)(2616005)(26005)(38100700002)(36756003)(86362001)(31696002)(38070700009)(8936002)(2906002)(41300700001)(8676002)(4326008)(6486002)(122000001)(7416002)(5660300002)(921011)(478600001)(316002)(110136005)(91956017)(76116006)(66946007)(66476007)(66446008)(64756008)(66556008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGpiTFN0NmZsKzdBeUhLVjVnbDdUd25USmQ5MFFUNndwQXBBQ3pFemN1TVFa?=
 =?utf-8?B?ejV1M2czV1JicHVYY1QyR3Bwek4rcEhkQ0NlU3VtV1EvWTJhclI5THZJSU5o?=
 =?utf-8?B?WGJiV3BMVVc4WUhMRXd0UERyLzY1UzNMN0Qrd3VCbS9CS0gwT3lzdENzOCtK?=
 =?utf-8?B?VmNqQ203ZU9nT2IzUXNnRFZBYVQrVGJRWTVCQWFXMVRXUldkdTJzalFndzhy?=
 =?utf-8?B?bU0yaUZSS3E1em5DYWVSZDc5eFZoNTh4bFdIc0xnUHN1YUJ2OHRkUFFXdE5S?=
 =?utf-8?B?dHdOZXljK1ZwZXUrU0VRTXJKWXA2VDZ4L2dBRlVtb3FyanpDbklBaXhQK3Az?=
 =?utf-8?B?WHd2b0xKRzl2VWZraTFmLzl4c2lETEMwOGordUdzZmxvQ09ScnhSWFFXYUlo?=
 =?utf-8?B?YW9oMFZKeEJOKzFpYXkrUHlONG50N2Rnd0pLUm5nNW5NTXhwV2llYitZVFZ1?=
 =?utf-8?B?QkRIMjAweVVBKzJ2VllwdG1IVW05MzQrcVJzQVUyRy9RUG10djIzZWM3T1lQ?=
 =?utf-8?B?enRpQW5Cb2dXWU1kYmhnSkQ3d2U3S2FoTnNsMHBPNUxSUGJoWjYvVEJRUTVO?=
 =?utf-8?B?TFNiT0N2SXJ1V2hFVmxqRWJ4OUZldlhpbWttZWlYay9GOTBXYjJZbnFKdWNT?=
 =?utf-8?B?NEFFZFkwUUkvU0xHNElSSDRjZTZNb21rTG1hMW5JMUVuUHU1Z0JWeUd6bmxu?=
 =?utf-8?B?TEkxeURZQ0pVMFFhMGpjamxXSTI0dHM4UjkxVmNVNmE1eWpZZHdyemFnaU0w?=
 =?utf-8?B?b2paNlIvb003Z3JPWTBGM1lHQ09zK2dNT0FoN2U5ZnlnTVRQTG9rNytVbTlp?=
 =?utf-8?B?VC9wMzNWQmFJbWZQRGp0eEVjYjR4elM2eUk0ZlFyclFqM0p2NlNzdVBNaUtB?=
 =?utf-8?B?RUR1elprYVZ2R0d0Y0J3dlN4V1NRQ1dnZ2ttN0VZMkh3a0hrY1BqbDA4M1FV?=
 =?utf-8?B?Y2VFMVptaStyTzNZUlNvcWd4MU9qbFo2QUZrT1pVZkJQaUliVGZqRlZNY2ZF?=
 =?utf-8?B?SzZQZnpueGdVQlFaazZTTVNWMmt6aUtRSGVVVVRXcXpPMXFmTkxWa3p2cytP?=
 =?utf-8?B?RFVtb0N3Tm01QjNGdjdZVEUwQ3EvTEhzYTh2T2V6aXRDeWwrcnNua2xGRVU5?=
 =?utf-8?B?cnVteHhkTUhVbGtZc1pLVW1sVmlOakVldDRqVHFqWURtck10TTdiZkFDUzBa?=
 =?utf-8?B?alhFT2NtZXB2eEN2NXVkM3l2LzlOVVZTQnpsNTloaW41SDFNcmxFU0hxd2o4?=
 =?utf-8?B?bUhXblhJbG1uRmExaUlOYUlxUDBXWCtWOHVIMEQ1MEtmMWJiaG1vMERPVm1U?=
 =?utf-8?B?WDlGaEtQM1NBcFE1Vi9JaHJ1eVpSNmFabzNMaUN0MjZYYmgvMVZLaHVkUkhV?=
 =?utf-8?B?Y1hLU3JCQ2dwRkZ4MkM4aGJKSTJqd1FkRG1qRHlkZkErOUY5dGhpVU9vR2Nr?=
 =?utf-8?B?ZEFHOU4wTEprSXNYdFhXYjNVMmxFMWdxNkdGaERLU2RpOEVqMUVDT0M3VjVO?=
 =?utf-8?B?TVJqejJXaVlaa2RnT1lsVDE4bStGVE1pRGNCbmRVS2ZNOUx1cDd2MXNqYklu?=
 =?utf-8?B?NHBjT0dMTGJ4WHFlcmVjNnFWOVpCY1JFVys5Wmw5NHQrYkxxVWI2aTYvcWNK?=
 =?utf-8?B?cEQydTJaUlhvVlA0L3VJWWFWNnVDb3ZCUlYxRW1MOVJDL2p1cHZlUjJhMStY?=
 =?utf-8?B?UU1lc21LV000VjQ5ZWltQy9ET2oyZ1YwQWdHZzZYdW9BY1ZoOXQxWU9NV1d0?=
 =?utf-8?B?RHU0UE5jSHRZbVJXUmhpTWl1dzV3M0dqRTBCUmpGajFmd2ZUMlEyZHgzRDZG?=
 =?utf-8?B?SUdKL0g2ZWxoei9aMk5UOEthL2hUc3A3cVZoM0hGVEZuSDdCNjRkd0laUElu?=
 =?utf-8?B?WlZ5M3UwRWNwK2I0SjdXVUxtdGpNSVhNbDhJUWNWT1RXUDJjWDhHZENmaTFF?=
 =?utf-8?B?UUF6NXdXZ2JJZGxkYkdGZldWM2g2SXhjSFBNTHIxdXBQcnBkYlNBUlJpemRL?=
 =?utf-8?B?TFV5WlUxZ0lLL0VlRXlQdHVCZkx1cEd2VFlkejdBNkFJOU54Zmo4Q3laWWRD?=
 =?utf-8?B?QThjUDVqb1NIWmhobE41S1lGR0ZQUnR5U3pSaS9JdlF0MXY4azM2RVd5Vm5X?=
 =?utf-8?Q?06AJJ3nmi3Il1isJbs0TCXj2x?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B680B03C8808204B9C54AE6137D54006@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e4aa44-6ccf-45fd-14bc-08dc17056e2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2024 02:38:47.0031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YLvLrrFx8395m+BRwI4LM2HfJ7jZ/Ic4kQpl6B5p0tJizznBG/7fLeyv0IQYKtwNVLbmtm/BU0yN1CTdtIuqjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6702
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
Cc: Linux4Microchip@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTcvMDEvMjQgMjoxNSBhbSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAxNi8wMS8yMDI0IDEyOjM3LCBE
aGFybWEgQmFsYXN1YmlyYW1hbmkgd3JvdGU6DQo+PiBDb252ZXJ0IHRoZSBleGlzdGluZyBEVCBi
aW5kaW5nIHRvIERUIHNjaGVtYSBvZiB0aGUgQXRtZWwncyBITENEQyBkaXNwbGF5DQo+PiBjb250
cm9sbGVyLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IERoYXJtYSBCYWxhc3ViaXJhbWFuaSA8ZGhh
cm1hLmJAbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gY2hhbmdlbG9nDQo+PiB2MSAtPiB2Mg0K
Pj4gLSBSZW1vdmUgdGhlIGV4cGxpY2l0IGNvcHlyaWdodHMuDQo+PiAtIE1vZGlmeSBmaWxlbmFt
ZSBsaWtlIGNvbXBhdGlibGUuDQo+PiAtIE1vZGlmeSB0aXRsZSAoZHJvcCB3b3JkcyBsaWtlIGJp
bmRpbmcvZHJpdmVyKS4NCj4+IC0gTW9kaWZ5IGRlc2NyaXB0aW9uIGFjdHVhbGx5IGRlc2NyaWJp
bmcgdGhlIGhhcmR3YXJlIGFuZCBub3QgdGhlIGRyaXZlci4NCj4+IC0gUmVtb3ZlIHBpbmN0cmwg
cHJvcGVydGllcyB3aGljaCBhcmVuJ3QgcmVxdWlyZWQuDQo+PiAtIFJlZiBlbmRwb2ludCBhbmQg
bm90IGVuZHBvaW50LWJhc2UuDQo+PiAtIERyb3AgcmVkdW5kYW50IGluZm8gYWJvdXQgYnVzLXdp
ZHRoIGRlc2NyaXB0aW9uIGFuZCBhZGQgcmVmIHRvIHZpZGVvLWludGVyZmFjZXMuDQo+PiAtIE1v
dmUgJ2FkZGl0aW9uYWxQcm9wZXJ0aWVzJyBhZnRlciAnUmVxdWlyZWQnLg0KPj4gLSBEcm9wIHBh
cmVudCBub2RlIGFuZCBpdCdzIG90aGVyIHN1Yi1kZXZpY2Ugbm9kZSB3aGljaCBhcmUgbm90IHJl
bGF0ZWQgaGVyZS4NCj4+IC0gQWRkIGNvbXBhdGlibGUgdG8gZXhhbXBsZSAyIGFuZCBhZGQgY29t
bWVudHMgdGhhdCBidXMtd2lkdGggaXMgdGhlIGRpZmYgYmV0d2VlbiB0d28gZXhhbXBsZXMuDQo+
PiAtLS0NCj4gDQo+IFBsZWFzZSByZXNwb25kIHRvIHJldmlldyBjb21tZW50cyBhbmQgYWNrbm93
bGVkZ2UgeW91IGltcGxlbWVudCBlYWNoIG9mDQo+IHRoZW0uIEkgZG9uJ3QgdGhpbmsgeW91IGRp
ZCBoZXJlIGV2ZXJ5dGhpbmcgSSBwb2ludGVkIG91dC4gVGhlIG5leHQNCj4gcGF0Y2ggZm9yIHN1
cmUgbWlzc2VzIHRoaW5ncy4NCk15IGFwb2xvZ2llcywgSSB3aWxsIGVuc3VyZSB0aGF0IEkgYWRk
cmVzcyBhbGwgdGhlIHJldmlldyBjb21tZW50cyBpbiB2My4NCg0KLS0gDQpXaXRoIEJlc3QgUmVn
YXJkcywNCkRoYXJtYSBCLg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQoN
Cg0K
