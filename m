Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4199082FEA5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 02:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6AA10E0E6;
	Wed, 17 Jan 2024 01:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0651A10E0E6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 01:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705456751; x=1736992751;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=wsdIZbySY+/VSG/fSp2WZ7ilCo90MKWCZ4H9SNR3SWc=;
 b=VAlo6J6cejxIIG7+mVZDB8RlPsnzkvJA1yNErivX5P6WBP9MIbvsV/Ac
 qnhK7bkWEzZ7k7dlbIDib2RHg/TSu8StdQz8yemlZepByrRYLpt/pSy1l
 b/yTZdA5dO5eQzmZ24zv0wRueGAa6HC8EZ5/u5G/cx/zGCzYf8jq8KCHb
 ntcWaYvZatAFdy5ER5xicxo8CxCpTQfdIZUyM3oKZHuyT7Q0XCXFWfcyn
 tRPoZfLg+E5KfniPb+5IIsw9KoGpe/Wm/gOrKdLK5Q/gSLnNkLUDiX1tf
 vyoi1XsVMYVa7W9ymw63tUHG5p3fkUNLIWlnQi3EY1XbZB7uxh3cjhF6Y A==;
X-CSE-ConnectionGUID: xp8LFIU1SR2ShkfkwRnsBA==
X-CSE-MsgGUID: UBeZXfmPQNmTnrr0ebwXtA==
X-IronPort-AV: E=Sophos;i="6.05,200,1701154800"; d="scan'208";a="15311139"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jan 2024 18:58:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 18:58:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 18:58:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ioNbnUyBbv/3r2KU6Aa2LvUlfrz3QZGe4CSDOYEfv18aZf74Z64eR29w+14cBB6YUNKA4M06Hu5AJVIPEhq8wQP4d5GNdItQJbhnyolE2OwH/5PcKEAj3gv8ebIy5dz0w0PhI6B+hX/Bh6HOiTSqsWeeEUg0lAtkg3hBp1XcLS9E2ubDTmwckYNvofMmduyTj3PUoPUdJaOUh31fdD/7s3GPBQ19M9AAL8wI4fUNmUOyDJw/6D5wsnVAsdSeJuH1HBlpXnOgmPAuJRYJbWB38FGzlIQXQCejjccjNIVrCW8yVCcOMWUsidmh1PpWCIlFVmyrSfC5UzQrCBKa1YM4BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsdIZbySY+/VSG/fSp2WZ7ilCo90MKWCZ4H9SNR3SWc=;
 b=lPSV7AhwUq3ZJkL8z3oIIxzBbrfI5WMNCv9HASpVTrcCFukXvC4+/a9w1eox4r1z9ja+8DxiDsMo7GOGYIFBSbCwKxPiHsylHTllqd+tRQdN7t/rPwwQqGkT7M65/CQV8ucJmqJ8XjRLX9NbD8zlMWKZfaRuQ8YN2yx1EvYK3ucUbcbC1IKI6XrOu5uAI+wCaCQINWKRxP41lvfbaZ/HNb+xmjdZ7SK3QXxin5CBinV7QkIj4Dw19AIxtx0fs8Vv49dk+59dhFmUOjnBOZWBfSTiUm5pjVZgFrx72RpqBZ0huxrVFr8iD2VvgR6HKLH8WNnrj0JIqQ7bGVRKEzmKdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsdIZbySY+/VSG/fSp2WZ7ilCo90MKWCZ4H9SNR3SWc=;
 b=2YXRu23P2m6cWI3w3A0cmUaozR2kMyeV0WVgBel7T4YBQosv7i6kkbrWlZhoV9Qjm4ZS/8K9RNCt6NN+WyQaGRmEiHuMmWMOMlkAP+mBWrdpGREineKAWK12r/gAMrMiMyvMfL11o+TziYX9TftJm3MqQgUdF45Ka+0RnuKz4dG5mfdtEughu22Egsq6r1V/8vKVPpBlbQ2HQpf5jFlY4PqUA4nl091MooR+LZT3VP7VVBdNQNBG+Nwobr11+OwgGp5BULFvgiYhjiEfOhIi9lpSsFjYn9ExIrkktzpJDCqSaQ86u5CV7Q3+UyyWvcPMY+wIGlWL4M4xgVXrUKfGQw==
Received: from BL3PR11MB6436.namprd11.prod.outlook.com (2603:10b6:208:3bc::11)
 by CH3PR11MB8435.namprd11.prod.outlook.com (2603:10b6:610:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 01:58:49 +0000
Received: from BL3PR11MB6436.namprd11.prod.outlook.com
 ([fe80::96fe:b914:e84a:73fc]) by BL3PR11MB6436.namprd11.prod.outlook.com
 ([fe80::96fe:b914:e84a:73fc%6]) with mapi id 15.20.7181.027; Wed, 17 Jan 2024
 01:58:48 +0000
From: <Dharma.B@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <sam@ravnborg.org>,
 <bbrezillon@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <lee@kernel.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <linux-pwm@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: convert Atmel's HLCDC to DT
 schema
Thread-Topic: [PATCH 1/3] dt-bindings: display: convert Atmel's HLCDC to DT
 schema
Thread-Index: AQHaQ6+BkMWRIT/cyky30UWqcbtbOLDS21GAgApuuwA=
Date: Wed, 17 Jan 2024 01:58:48 +0000
Message-ID: <beb0a83b-06f3-44c8-9b55-2903021e9d83@microchip.com>
References: <20240110102535.246177-1-dharma.b@microchip.com>
 <20240110102535.246177-2-dharma.b@microchip.com>
 <7110b0a8-5b0c-4817-9432-26528bbbb5a9@linaro.org>
In-Reply-To: <7110b0a8-5b0c-4817-9432-26528bbbb5a9@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6436:EE_|CH3PR11MB8435:EE_
x-ms-office365-filtering-correlation-id: a70f7937-9310-4ee3-472b-08dc16ffd8b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yZaVmL81YogaJu3YNxkodoBuhUTavSnm6B3cQt6rOtawhzDgbCeLHVHJqEEc5jkcBMKcMcNh7+tptFkcc/Wyk27kpg2gf+acGPXxehI558/+Aiomo7wZU0s26l6oMZQwsrkk47MqGKJEb/VyER7kTqjRnqmC2NEcsIfvBFtDU6gy3VdVjxNkM6xIBIFYgO59NGkNnyXo75rx2sOI71V5ZGeR5MMaW1L2NNO0ciTwo6jCnapCLEYjvNaPNy2x0OLigmb/8PZa9e4l3W+2qKY67VDVN4Mcu3aa/MS0bx/Qz2MZNBtIoJhxBvKILMgVxmWWoGUIzHMd8iVQV8ZmDNl6xbi4F5GJexw/aecxtOy3211eAfTcp1nbUR48aQzs7/wHb8XsP+whVbL5aI0VDlWcwPH3vJZLiPtLiunKuMB4OkLCyTjbR3ndeM5mCZexK3IPuI3PHzElwYeNx+NXnL5Zot3UadEZzxrrJ5CczC+0Kf3btNetwD0A7JcJbNbRhj28df0wJpYJmK639JMSLuW8lB7gq+tkPS2/IzPkvmTp4OO/h2/aZV9AMP75adE5MV96eeKDwGQOUt3c2YrTNVmusfx4LL4lto+tAxIQKIlR5wGPnYyibcdlcBvSOn/LZ8zVnnEzOf1wqAqbYSMeiiGBZqXUiFkPY31VXeu6J3STqIrdAT6PZdKrMZzVqLKRdNwnPJ4fkE9kUVqjI4AKHk646gAgAFkSCyK4f/IYKVwhcow=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6436.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(39860400002)(346002)(230273577357003)(230173577357003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(5660300002)(2906002)(7416002)(8676002)(31686004)(8936002)(91956017)(110136005)(66946007)(316002)(76116006)(64756008)(66446008)(66476007)(66556008)(478600001)(2616005)(6506007)(6486002)(966005)(71200400001)(6512007)(53546011)(83380400001)(921011)(26005)(41300700001)(38070700009)(122000001)(86362001)(31696002)(36756003)(38100700002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aktZSlVteTl0ZkhVaStMSVRLNUxJOTYwTmpsbVpOMUszZFRUKzFBZ2N5eDdX?=
 =?utf-8?B?dG1KTFdkNWlmOHFucVREY0hoNmFkalpYbnBXY0dyVC81WWVaYkt5WnAwOGJF?=
 =?utf-8?B?SDF5UU4vSmxvajdhb1c1T1U2S25IVDhJeXlXQzY1ZHpxR2MvVXBkSXNIY3dR?=
 =?utf-8?B?aWFXYnh5eEhoWTVvMEh4MlNIcmxmSGVNcHF0b2JxeUt1OWh6U1NvVFpza1lM?=
 =?utf-8?B?VEIzcWxFeHNxbU9rYkZiKzBPd3BFZ2ZvbXBoZEhmVThyT2cxNDVoS1REMVRr?=
 =?utf-8?B?SW8yU3p3a3gvNDhsd2NwbUIrS21tOGFzZDd2V0VsbUhCVE05VDNHUkRKL3Jl?=
 =?utf-8?B?byt3cHQ3VVNVUk53SjJ6ZXpzR2t1WVRHN09JUnZIOFYraS80blVjWVk5ckda?=
 =?utf-8?B?MkdRalNLb2w5UGREc2toM0pKUHFodXk3TGxoajROM3h6WCttYkxYNVNoMzlK?=
 =?utf-8?B?TXRycmZTVENDR21kUFoxWlBDb3krN1pocVNsT2pyVWNHV0pSTlZRWVNRVE1L?=
 =?utf-8?B?OWgwZEtJaVVvVldQMXhGWk8yNVpPck9IRWptTzFSWk1zVEQzTmJIUGkwWmFD?=
 =?utf-8?B?eHNwdGd3cC9TQmszWFoxMmh4VWlGekgrRjladkR2WDVOaWZWQU1WMTg4YzlC?=
 =?utf-8?B?RFUyeDZYQkVldkFlcGlaeVlHQnp2MXpyQlphbnJPZndNeUxxM3BmQUJrQUxu?=
 =?utf-8?B?T21BK3MzbGJBN0xHWTZXVDNhc21lYkJFVXdUTDZKS0Nub0lRMHlCZ2hBSUNH?=
 =?utf-8?B?cmlZckovTDhjSDlyTXdSUUFCeTEwTGdmQmxaOFlXZWdrWENGRHBFMUlmQ0Ji?=
 =?utf-8?B?d3BnaDFOTG0zbllFZ3NwY1IyZllyUXJQZVE4eE5QVVo2SHJGRTVoOFA5ci9U?=
 =?utf-8?B?Zmg1TWwxSis0WXRxeSs0a01KSVBsVzFDVEQvdTR1TVZzd25oL1ZlUVZzWXNC?=
 =?utf-8?B?K25mMmo3UFJuNHB4dkpvdkFhT2g2MmNJdzBMVVMzSzkxMGF0N044NzVHV2VC?=
 =?utf-8?B?S01PSXdxMWN2SlViNnd0ZzQ4UXdpdFJSNGlXdG5Nd3pycXZCY1hxVHV0RnY1?=
 =?utf-8?B?ZjJwLzdyYjg5U1hNaEQrSVRrYWw5VjNNdUViQlpGTjBKS01KKy93NDFtMEdU?=
 =?utf-8?B?WlZpTWlSaWxUS0FtOTUyOWthN3VUdmNZbFh4b212citDaURKVDVhQ1lXL0tQ?=
 =?utf-8?B?cERNS0lzcG03RjlCMkdnTVZMbUV4UWpUWUpvQUZiNTdzVHphLy9Sdm04eDJm?=
 =?utf-8?B?VG5pejBmT3lPNU02U3lobWZ4d0h0QTFlZTlRc1NycXNVQk9mZVhQb3JRSzBF?=
 =?utf-8?B?cWZ0QmNBTTRmbU96SXgydXk5YnBsajJJWVVwODlZZkkzWFgzMjd2c1pibDJu?=
 =?utf-8?B?RmkyeG4vNi9vKzN1b3RHYlNwWDNoWGswbEhXUlVzaUJCeElrWE51VDVZajJ6?=
 =?utf-8?B?NGNtT3UyWGhac1cvNVp2cmxlUUVSMmF2azQ1OVNWb0VuOHI5YkV3Smo5R3F5?=
 =?utf-8?B?VkNjaEEzcWY2UWtvdysvTUg2MFRHMkJVY1BPa0o0VE1YNVgrT0F6UTR2QWFL?=
 =?utf-8?B?NHN4UTdpT1NmS1MxK0VldXAyZEVnQk5DT1hNdlpxZE04dSsyVWcyTWNKL00z?=
 =?utf-8?B?aTJXNnpYZXF5aEJUTDJVTitZNXFobHEzeUNENjJnRWJQRXhkaDY4V0ZleHM1?=
 =?utf-8?B?cXlZZkJiK3p2NUJtTkhNVDNTYzMrd3ZLOUJpb3ZxL0ZqVGNIUEhZbTV0MU9j?=
 =?utf-8?B?Vk9SeXRabHJTL0hNdWtoWHppVnpVMWhIVmhTNDBIL1pEMlI0YnlCZ0JseGFm?=
 =?utf-8?B?RDZvZVIyZVo4SFFvNHhHRDVobWp5cExmR0I0YlBuWUhob0s5d1NDcFVwbW9T?=
 =?utf-8?B?NE43MEtvNklTZ3NtdmxIUHJMc05Ed1V4cHBEUUVNalFIUEROME5Fb3pvd281?=
 =?utf-8?B?cXdWUTF0MlNXQ3NmemhFeko2a0p1b01ja1c2QWkxdFAveWlxVnZmVitBTGZo?=
 =?utf-8?B?WUF4Wm5MNjh0dzRuOUVWMlFQOHE1TkJjVnowNHRoR09mb1FDT3lHa1ZYeVds?=
 =?utf-8?B?T3RSMnE1Z3lsNHFtYzlxWXdFclZUcUFMY1IyWDhtOVQ0Tloza1VTa0RwYjJa?=
 =?utf-8?Q?Z62BbZyUOPNGIIOfBs8KbrNPv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F89FDC2130EFC408FFCB710CEDCE70C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6436.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a70f7937-9310-4ee3-472b-08dc16ffd8b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2024 01:58:48.7712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dpF+KDGdIRZDkBGgMw7CLuoBQA3TxNm4lbMzfmgyjVEzm5nEGiqck6hMq9UVkPFMAueYpGBBBhcboogps2HHkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8435
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

SGkgS3J6eXN6dG9mLA0KDQpPbiAxMC8wMS8yNCA0OjA5IHBtLCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDEw
LzAxLzIwMjQgMTE6MjUsIERoYXJtYSBCYWxhc3ViaXJhbWFuaSB3cm90ZToNCj4+IENvbnZlcnQg
dGhlIGV4aXN0aW5nIERUIGJpbmRpbmcgdG8gRFQgc2NoZW1hIG9mIHRoZSBBdG1lbCdzIEhMQ0RD
IGRpc3BsYXkNCj4+IGNvbnRyb2xsZXIuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogRGhhcm1hIEJh
bGFzdWJpcmFtYW5pIDxkaGFybWEuYkBtaWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+PiAgIC4uLi9k
aXNwbGF5L2F0bWVsL2F0bWVsLGhsY2RjLWRjLnlhbWwgICAgICAgICB8IDEzMyArKysrKysrKysr
KysrKysrKysNCj4+ICAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYXRtZWwvaGxjZGMtZGMudHh0ICAg
ICAgIHwgIDc1IC0tLS0tLS0tLS0NCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMzMgaW5zZXJ0aW9u
cygrKSwgNzUgZGVsZXRpb25zKC0pDQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hdG1lbC9hdG1lbCxobGNkYy1kYy55YW1s
DQo+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9hdG1lbC9obGNkYy1kYy50eHQNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXRtZWwvYXRtZWwsaGxjZGMtZGMu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2F0bWVsL2F0
bWVsLGhsY2RjLWRjLnlhbWwNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAw
MDAwMDAwMDAuLjQ5ZWYyODY0NmM0OA0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXRtZWwvYXRtZWwsaGxjZGMtZGMu
eWFtbA0KPj4gQEAgLTAsMCArMSwxMzMgQEANCj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpDQo+PiArIyBDb3B5cmlnaHQgKEMpIDIwMjQgTWlj
cm9jaGlwIFRlY2hub2xvZ3ksIEluYy4gYW5kIGl0cyBzdWJzaWRpYXJpZXMNCj4gDQo+IFdoYXQg
YWJvdXQgb3JpZ2luYWwgY29weXJpZ2h0cyBmcm9tIFRYVCBmaWxlPyBBbHRob3VnaCBjb252ZXJz
aW9uIGlzDQo+IHF1aXRlIGluZGVwZW5kZW50LCBJIGNvdWxkIGltYWdpbmUgc29tZSBsYXd5ZXIg
d291bGQgY2FsbCBpdCBhDQo+IGRlcml2YXRpdmUgd29yayBvZiBvcmlnaW5hbCBUWFQuDQo+IA0K
PiBJZiB5b3UgZGVjaWRlIHRvIGFkZCBleHBsaWNpdCBjb3B5cmlnaHRzICh3aGljaCBhbnl3YXkg
SSBkbyBub3QNCj4gdW5kZXJzdGFuZCB3aHkpLCB0aGVuIHBsZWFzZSBtYWtlIGl0IHNpZ25lZCBv
ZmYgYnkgc29tZSBvZiB5b3VyIGxhd3llcnMNCj4gdG8gYmUgc3VyZSB0aGF0IHlvdSByZWFsbHkg
Y2xhaW0gdGhhdCwgaW4gcmVzcGVjdCBvZiBvdGhlciBwZW9wbGUNCj4gY29weXJpZ2h0cy4NCkkg
b21pdHRlZCBpdCBpbiB2MiwgYnV0IGdpdmVuIHRoZSBhcHByb3ZhbCBmcm9tIENvbm9yIGFuZCBB
bGV4YW5kcmUgdG8gDQppbmNsdWRlIHRoZSBjb3B5cmlnaHRzLCBJIHdpbGwgcmVpbnRyb2R1Y2Ug
aXQgaW4gdjMuDQo+IA0KPj4gKyVZQU1MIDEuMg0KPj4gKy0tLQ0KPj4gKyRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9hdG1lbC9hdG1lbCxobGNkYy1kYy55YW1sIw0K
PiANCj4gRmlsZW5hbWUgbGlrZSBjb21wYXRpYmxlDQpJIG1vZGlmaWVkIGl0IGluIHYyLg0KPiAN
Cj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCMNCj4+ICsNCj4+ICt0aXRsZTogQXRtZWwncyBITENEQyAoSGlnaCBMQ0QgQ29udHJvbGxlcikg
RFJNIGRyaXZlcg0KPiANCj4gRHJpdmVyIGFzIExpbnV4IGRyaXZlcj8gTm90IHN1aXRhYmxlIGZv
ciBiaW5kaW5ncywgc28gcGxlYXNlIGRyb3AuDQpEb25lLg0KPiANCj4+ICsNCj4+ICttYWludGFp
bmVyczoNCj4+ICsgIC0gTmljb2xhcyBGZXJyZSA8bmljb2xhcy5mZXJyZUBtaWNyb2NoaXAuY29t
Pg0KPj4gKyAgLSBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5j
b20+DQo+PiArICAtIENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+
PiArDQo+PiArZGVzY3JpcHRpb246IHwNCj4+ICsgIERldmljZS1UcmVlIGJpbmRpbmdzIGZvciBB
dG1lbCdzIEhMQ0RDIERSTSBkcml2ZXIuIFRoZSBBdG1lbCBITENEQyBEaXNwbGF5DQo+IA0KPiBE
cm9wIGVudGlyZSBmaXJzdCBzZW50ZW5jZSBhbmQgaW5zdGVhZCBkZXNjcmliZSBoYXJkd2FyZS4N
CkRvbmUuDQo+IA0KPj4gKyAgQ29udHJvbGxlciBpcyBhIHN1YmRldmljZSBvZiB0aGUgSExDREMg
TUZEIGRldmljZS4NCj4+ICsgICMgU2VlIC4uLy4uL21mZC9hdG1lbCxobGNkYy55YW1sIGZvciBt
b3JlIGRldGFpbHMuDQo+IA0KPiBGdWxsIHBhdGhzIHBsZWFzZS4NCkNvbnNpZGVyaW5nIHRoYXQg
dGhlIE1GRCdzIFlBTUwgY29tZXMgYWZ0ZXIgdGhpcyBwYXRjaCwgSSBoYXZlIGRlY2lkZWQgDQp0
byByZW1vdmUgaXQgaGVyZS4NCj4gDQo+PiArDQo+PiArcHJvcGVydGllczoNCj4+ICsgIGNvbXBh
dGlibGU6DQo+PiArICAgIGNvbnN0OiBhdG1lbCxobGNkYy1kaXNwbGF5LWNvbnRyb2xsZXINCj4+
ICsNCj4+ICsgIHBpbmN0cmwtbmFtZXM6DQo+PiArICAgIGNvbnN0OiBkZWZhdWx0DQo+PiArDQo+
PiArICBwaW5jdHJsLTA6IHRydWUNCj4gDQo+IFdoeSBkbyB5b3UgbmVlZCB0aGVzZSB0d28/IEFy
ZSB0aGV5IHJlYWxseSByZXF1aXJlZD8NCk5vLCBJIHJlbW92ZWQgaXQgaW4gdjIuDQo+IA0KPj4g
Kw0KPj4gKyAgJyNhZGRyZXNzLWNlbGxzJzoNCj4+ICsgICAgY29uc3Q6IDENCj4+ICsNCj4+ICsg
ICcjc2l6ZS1jZWxscyc6DQo+PiArICAgIGNvbnN0OiAwDQo+PiArDQo+PiArICBwb3J0QDA6DQo+
PiArICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjLyRkZWZzL3BvcnQtYmFzZQ0KPj4gKyAg
ICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+PiArICAgIGRlc2NyaXB0aW9uOg0KPj4g
KyAgICAgIE91dHB1dCBlbmRwb2ludCBvZiB0aGUgY29udHJvbGxlciwgY29ubmVjdGluZyB0aGUg
TENEIHBhbmVsIHNpZ25hbHMuDQo+PiArDQo+PiArICAgIHByb3BlcnRpZXM6DQo+PiArICAgICAg
JyNhZGRyZXNzLWNlbGxzJzoNCj4+ICsgICAgICAgIGNvbnN0OiAxDQo+PiArDQo+PiArICAgICAg
JyNzaXplLWNlbGxzJzoNCj4+ICsgICAgICAgIGNvbnN0OiAwDQo+PiArDQo+PiArICAgICAgcmVn
Og0KPj4gKyAgICAgICAgbWF4SXRlbXM6IDENCj4+ICsNCj4+ICsgICAgICBlbmRwb2ludDoNCj4+
ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjLyRkZWZzL2VuZHBvaW50LWJhc2UN
Cj4gDQo+IEhtLCB3aHkgZG8geW91IHJlZmVyZW5jZSBlbmRwb2ludC1iYXNlPyBUaGlzIGxvb2tz
IG9kZGx5IGRpZmZlcmVudCB0aGFuDQo+IGFsbCBvdGhlciBiaW5kaW5ncyBmb3Igc3VjaCBkZXZp
Y2VzLCBzbyBwbGVhc2UgZXhwbGFpbiB3aHkuDQpNeSBhcG9sb2dpZXMsIGl0IHNob3VsZCBiZSAn
JHJlZjogL3NjaGVtYXMvbWVkaWEvdmlkZW8taW50ZXJmYWNlcy55YW1sIycgDQpJIHdpbGwgY29y
cmVjdCB0aGlzIGluIHYzLg0KPiANCj4+ICsgICAgICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczog
ZmFsc2UNCj4+ICsgICAgICAgIGRlc2NyaXB0aW9uOg0KPj4gKyAgICAgICAgICBFbmRwb2ludCBj
b25uZWN0aW5nIHRoZSBMQ0QgcGFuZWwgc2lnbmFscy4NCj4+ICsNCj4+ICsgICAgICAgIHByb3Bl
cnRpZXM6DQo+PiArICAgICAgICAgIGJ1cy13aWR0aDoNCj4+ICsgICAgICAgICAgICBkZXNjcmlw
dGlvbjogfA0KPj4gKyAgICAgICAgICAgICAgQW55IGVuZHBvaW50IGdyYW5kY2hpbGQgbm9kZSBt
YXkgc3BlY2lmeSBhIGRlc2lyZWQgdmlkZW8gaW50ZXJmYWNlIGFjY29yZGluZyB0bw0KPj4gKyAg
ICAgICAgICAgICAgLi4vLi4vbWVkaWEvdmlkZW8taW50ZXJmYWNlcy55YW1sLCBzcGVjaWZpY2Fs
bHkgImJ1cy13aWR0aCIgd2hvc2UgcmVjb2duaXplZA0KPiANCj4gRHJvcCByZWR1bmRhbnQgaW5m
b3JtYXRpb24uIERvbid0IHlvdSBtaXNzIHNvbWUgJHJlZj8NClN1cmUsIEkgd2lsbCBkcm9wIHRo
ZSBkZXNjcmlwdGlvbiBpbiB2My4NCj4gDQo+IA0KPj4gKyAgICAgICAgICAgICAgdmFsdWVzIGFy
ZSA8MTI+LCA8MTY+LCA8MTg+IGFuZCA8MjQ+LCBhbmQgb3ZlcnJpZGUgYW55IG91dHB1dCBtb2Rl
IHNlbGVjdGlvbg0KPj4gKyAgICAgICAgICAgICAgaGV1cmlzdGljLCBmb3JjaW5nICJyZ2I0NDQi
LCJyZ2I1NjUiLCAicmdiNjY2IiBhbmQgInJnYjg4OCIgcmVzcGVjdGl2ZWx5Lg0KPj4gKyAgICAg
ICAgICAgIGVudW06IFsgMTIsIDE2LCAxOCwgMjQgXQ0KPj4gKw0KPj4gK2FkZGl0aW9uYWxQcm9w
ZXJ0aWVzOiBmYWxzZQ0KPiANCj4gVGhpcyBnb2VzIGFmdGVyIHJlcXVpcmVkOg0KRG9uZS4NCj4g
DQo+PiArDQo+PiArcmVxdWlyZWQ6DQo+PiArICAtICcjYWRkcmVzcy1jZWxscycNCj4+ICsgIC0g
JyNzaXplLWNlbGxzJw0KPj4gKyAgLSBjb21wYXRpYmxlDQo+PiArICAtIHBpbmN0cmwtbmFtZXMN
Cj4+ICsgIC0gcGluY3RybC0wDQo+PiArICAtIHBvcnRAMA0KPj4gKw0KPj4gK2V4YW1wbGVzOg0K
Pj4gKyAgLSB8DQo+PiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9hdDkxLmg+DQo+
PiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9kbWEvYXQ5MS5oPg0KPj4gKyAgICAjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPg0KPj4gKyAgICAv
L0V4YW1wbGUgMQ0KPiANCj4gRHJvcA0KU3VyZS4NCj4gDQo+PiArICAgIGhsY2RjOiBobGNkY0Bm
MDAzMDAwMCB7DQo+IA0KPiBOb2RlIG5hbWVzIHNob3VsZCBiZSBnZW5lcmljLiBTZWUgYWxzbyBh
biBleHBsYW5hdGlvbiBhbmQgbGlzdCBvZg0KPiBleGFtcGxlcyAobm90IGV4aGF1c3RpdmUpIGlu
IERUIHNwZWNpZmljYXRpb246DQo+IGh0dHBzOi8vZGV2aWNldHJlZS1zcGVjaWZpY2F0aW9uLnJl
YWR0aGVkb2NzLmlvL2VuL2xhdGVzdC9jaGFwdGVyMi1kZXZpY2V0cmVlLWJhc2ljcy5odG1sI2dl
bmVyaWMtbmFtZXMtcmVjb21tZW5kYXRpb24NCj4gDQo+IA0KPj4gKyAgICAgIGNvbXBhdGlibGUg
PSAiYXRtZWwsc2FtYTVkMy1obGNkYyI7DQo+PiArICAgICAgcmVnID0gPDB4ZjAwMzAwMDAgMHgy
MDAwPjsNCj4+ICsgICAgICBpbnRlcnJ1cHRzID0gPDM2IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47
DQo+PiArICAgICAgY2xvY2tzID0gPCZsY2RjX2Nsaz4sIDwmbGNkY2s+LCA8JmNsazMyaz47DQo+
PiArICAgICAgY2xvY2stbmFtZXMgPSAicGVyaXBoX2NsayIsInN5c19jbGsiLCAic2xvd19jbGsi
Ow0KPiANCj4gVGhpcyBwYXJ0IGRvZXMgbm90IGxvb2sgcmVsYXRlZC4uLiBJZiB0aGlzIGlzIHBh
cnQgb2Ygb3RoZXIgZGV2aWNlLA0KPiB1c3VhbGx5IGl0IGlzIGVub3VnaCB0byBoYXZlIGp1c3Qg
b25lIGNvbXBsZXRlIGV4YW1wbGUuDQpTdXJlLCBJIHdpbGwgaGF2ZSBvbmUgY29tcGxldGUgZXhh
bXBsZSBpbiBtZmQgYmluZGluZyBhbmQgZHJvcCB0aGUgb3RoZXIgDQpleGFtcGxlIGhlcmUuDQo+
IA0KPiBBbHNvLCBmaXggY29kaW5nIHN0eWxlIC0gc3BhY2UgYWZ0ZXIgLA0KU3VyZS4NCj4gDQo+
PiArDQo+PiArICAgICAgaGxjZGMtZGlzcGxheS1jb250cm9sbGVyIHsNCj4+ICsgICAgICAgIGNv
bXBhdGlibGUgPSAiYXRtZWwsaGxjZGMtZGlzcGxheS1jb250cm9sbGVyIjsNCj4+ICsgICAgICAg
IHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+PiArICAgICAgICBwaW5jdHJsLTAgPSA8JnBp
bmN0cmxfbGNkX2Jhc2UgJnBpbmN0cmxfbGNkX3JnYjg4OD47DQo+PiArICAgICAgICAjYWRkcmVz
cy1jZWxscyA9IDwxPjsNCj4+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPj4gKw0KPj4g
KyAgICAgICAgcG9ydEAwIHsNCj4+ICsgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+
PiArICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPj4gKyAgICAgICAgICByZWcgPSA8MD47
DQo+PiArDQo+PiArICAgICAgICAgIGhsY2RjX3BhbmVsX291dHB1dDogZW5kcG9pbnRAMCB7DQo+
PiArICAgICAgICAgICAgcmVnID0gPDA+Ow0KPj4gKyAgICAgICAgICAgIHJlbW90ZS1lbmRwb2lu
dCA9IDwmcGFuZWxfaW5wdXQ+Ow0KPj4gKyAgICAgICAgICB9Ow0KPj4gKyAgICAgICAgfTsNCj4+
ICsgICAgICB9Ow0KPj4gKw0KPj4gKyAgICAgIGhsY2RjX3B3bTogaGxjZGMtcHdtIHsNCj4+ICsg
ICAgICAgIGNvbXBhdGlibGUgPSAiYXRtZWwsaGxjZGMtcHdtIjsNCj4gDQo+IEhvdyBpcyB0aGlz
IHJlbGF0ZWQ/DQpOb3QgcmVsYXRlZCBoZXJlLCB0aGFua3MsIHJlbW92ZWQgaXQgaW4gdjIuDQo+
IA0KPj4gKyAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4+ICsgICAgICAgIHBp
bmN0cmwtMCA9IDwmcGluY3RybF9sY2RfcHdtPjsNCj4+ICsgICAgICAgICNwd20tY2VsbHMgPSA8
Mz47DQo+PiArICAgICAgfTsNCj4+ICsgICAgfTsNCj4+ICsgIC0gfA0KPj4gKyAgICAvL0V4YW1w
bGUgMiBXaXRoIGEgdmlkZW8gaW50ZXJmYWNlIG92ZXJyaWRlIHRvIGZvcmNlIHJnYjU2NQ0KPj4g
KyAgICBobGNkYy1kaXNwbGF5LWNvbnRyb2xsZXIgew0KPj4gKyAgICAgIHBpbmN0cmwtbmFtZXMg
PSAiZGVmYXVsdCI7DQo+PiArICAgICAgcGluY3RybC0wID0gPCZwaW5jdHJsX2xjZF9iYXNlICZw
aW5jdHJsX2xjZF9yZ2I1NjU+Ow0KPiANCj4gQW5kIGhvdyBpcyB0aGlzPyBXaGVyZSBpcyB0aGUg
Y29tcGF0aWJsZT8gTWF5YmUganVzdCBkcm9wIHNlY29uZA0KPiBleGFtcGxlLCB3aGF0IGFyZSB0
aGUgZGlmZmVyZW5jZXM/DQpidXMtd2lkdGggaXMgdGhlIG9ubHkgcHJvcGVydHkgdGhhdCBpcyBk
aWZmZXJlbnQgYmV0d2VlbiB0aGUgZXhhbXBsZXMsIEkgDQp3aWxsIGRyb3AgdGhlIGV4YW1wbGUg
MiBpbiB2My4NCj4gDQo+IEFyZSB5b3Ugc3VyZSB5b3VyIE1pY3JvY2hpcCBmb2xrcyByZXZpZXdl
ZCBpdCBiZWZvcmU/DQpJIGFja25vd2xlZGdlIG15IG92ZXJzaWdodDsgSSBzaG91bGQgaGF2ZSBz
b3VnaHQgdGhlaXIgcmV2aWV3IA0KYmVmb3JlaGFuZC4gSSBhcHByZWNpYXRlIHlvdXIgdW5kZXJz
dGFuZGluZy4NCg0KLS0gDQpXaXRoIEJlc3QgUmVnYXJkcywNCkRoYXJtYSBCLg0KPiANCj4gQmVz
dCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQoNCg0KDQo=
