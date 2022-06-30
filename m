Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612D8562071
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 18:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4573811313D;
	Thu, 30 Jun 2022 16:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601D411313D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 16:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1656607106; x=1688143106;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tteHrIBCquRH9VAIG4EOyCC8OlEWekNMUvEKBboluEg=;
 b=mHKuMyGIBpvqDV/KXT7aFfzX7SziDRXWFzPmHYMOv6FUSoXwcR8eB9aV
 RKr3oQ0mVwPS7/8lZDhTuUrMnvh60cGpb6aCv+DWpwn9QaXxbe9svjRbD
 vZHFf4fyvytKK1ean8NqHe5YoyRfEAhs1Um7mogt/2buBcduytg6vW5XV
 IGR4EQPZu7jzMAkxu9jZxNkDBbeHovs3O0HweRWQ0VGoaTExrPg/Z3NZF
 sKyaY7yBbHzB1e6eFZP6xfDdG3Kj90BTKd+LjtCbO3hT2PRHqRqV66p6T
 87SJfZlH9t+TCrwxs1nJBfWtDoI9aYPpHQjGnY2qIRvn0tyqqEB5/EvP6 g==;
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; d="scan'208";a="165868327"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Jun 2022 09:38:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 09:38:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 30 Jun 2022 09:38:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hy8rh7QasHptcGqrBhqTEvjp4vWxxCmKX2OpWGZy3taGydk0orgWkc4+Zl656idDCp9UCZ62OUb/68jSvPQbFq78m4PWH0LEW4Pwin5op8GElmffv7Ea65v1t0z5uNZzSFNSgFzD2e8B0XSlRY93CtS/hkSWZpAayNFRZUG1+QwmoG06+IbkvOnC2bdF5m01KLON5Dbv956OuxQjL0EQwtuNAN0bxYhSTNFK4pFdEoI59Hh2DFzeKNcTyniylJbpd2TZuzV+0OhljOvBwHhhi6KxgQA7fKrFDUJWpQfPrAUnxjGDXAIFstHLMmLd/sJ2Zt5KyJvFCzLEYNh9GtlJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tteHrIBCquRH9VAIG4EOyCC8OlEWekNMUvEKBboluEg=;
 b=OLotvzhWQ1HLEPV30GJ2aI07Wr7bKqPaT3nZ/yEVisimoKuuR5YpIsalgSaAjDoDRHgYOQsnWOJKxR0ChfxzXm7+n91+pQKs6FguKmiZlyYEXf44P11uLk92n0dcMnQES8Lekp5Yy5Hg2AMQGh9nZa/+jqWAmPTi3KV9C8DzpUrp+e23rBMi19Wj7b3lhfEXpyuRl/b4IpLe8aa7TBGT9zsXYpj6165SkNhn6Sa1MLwnMUdzaXf6ctWtTRrOoasLC1hbCDrJBDigSXYEsoE3zDwoUMVNSd3OPK8qZjBXXCBxHwdeQcd3A0jxu6BUEtbfhQSkKO6eaUQz9PWxWENezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tteHrIBCquRH9VAIG4EOyCC8OlEWekNMUvEKBboluEg=;
 b=Fhuk67SFr6HrjqBkJ2c3Lj2CqVmjFlYRzyIgpTGoet2xd5+y+l/IgXyMcTjXDfcK9Ryk/slJS+pEaSRZ+pANbEQXk6qhdSR483mPbi4R0Jm3g4uBt/ywQnu7qe0CXI/+YP87NB5Htp13TJIavW8XKt51o7G5AdDAA4iueD0pAa8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB1234.namprd11.prod.outlook.com (2603:10b6:404:47::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 16:38:20 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Thu, 30 Jun 2022
 16:38:20 +0000
From: <Conor.Dooley@microchip.com>
To: <Niklas.Cassel@wdc.com>, <mail@conchuod.ie>
Subject: Re: [PATCH v3 00/15] Canaan devicetree fixes
Thread-Topic: [PATCH v3 00/15] Canaan devicetree fixes
Thread-Index: AQHYi+hg2HI7nJ4gGEWADL44nKFD2q1oJQgAgAACxAA=
Date: Thu, 30 Jun 2022 16:38:20 +0000
Message-ID: <a41eefe4-6152-6894-12ef-91b3cbf55b92@microchip.com>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <Yr3PKR0Uj1bE5Y6O@x1-carbon>
In-Reply-To: <Yr3PKR0Uj1bE5Y6O@x1-carbon>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65cb126f-9694-432e-d859-08da5ab6f13e
x-ms-traffictypediagnostic: BN6PR11MB1234:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WCRp48l9o3w7/GkTqpwZX67MM4ycs//eLx53CYXXyUGK04qWnp0wPw45RCO+jIJV1SY21x/P9DnllrpsK53i6tcdiQ0vTWRtrsu2X0cjaioT/bGWdbPuy70sDUd51eOiPUQ4vNYK9rdoqNFSzsXhpouY1WjkuzUEW7KM9zfihKYBugwT6LlFG2UVOUs0cMyk4uwmJmNdyTpqpz/4N9kjaO8fGcKCxWMofdvEjFG4KdNAbU0qj0t0wzJBNI0EvjuBs00+dPwxp0FABtvkdyZrCz7oyF9QvXnum1nFCgZ9ocQQ4bjisRryR57qwrT2VlUTljC/Ci+vxGu7mMkHhav05/BhlXFMQmrGqYj7zg132SOmoTrIk5sNuGqtn9b+8ocMednOFjWhZLYN0kYzdh6RaoD1jxG/NGjUGAwp8MV9gtAVqLc8I5sv1mo1MS+uDolDGks8Fl/deY9QE9q+PbN+ysqs6Q+J2Gn57KDKkHms9kOyzYh5t3Wr0wSv5Ycm2itj8In+YJJbuIEGalJTaW8ZZ1vaFa9xCVyocFrm1pRshRavQDyS1ptu39BeNVxkHsvrNGt1T/+EVUKQ2xU0Xyaplz7cLfhNltwxiD4FWjIYF36tZ2pRN1ZfHvNDFl3ChzFSgl25F7NZYoY8oUSvE5kiYUwiy03E4kVzOuyscFDSjV19vgKs6aIIlzRTjaL/wpYtKlNzTGNSOHahl96gjJIBWeUgel71XQ5HIVymINw2OCymb3lLfepit/Nvh4BdWJZencQxMt3BvT9aKkeZiuGCRxj+2FbxwBkCnoOmTQaCU3eUSF+VCRf+iKHeh2C2AbypfktEESbeICn28auKXfP6VV3rt4ul6zmHzhSBo3y/fZS2YceMW9Y+mlsUa8DYYyRN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(366004)(346002)(39860400002)(376002)(36756003)(31696002)(86362001)(7416002)(41300700001)(83380400001)(38100700002)(2616005)(6512007)(26005)(53546011)(6506007)(186003)(122000001)(38070700005)(7406005)(66476007)(316002)(64756008)(54906003)(76116006)(4326008)(478600001)(66556008)(8676002)(91956017)(71200400001)(6486002)(66946007)(2906002)(31686004)(5660300002)(8936002)(110136005)(66446008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjFaRmE2SUd4ek5VM0diRGhkaS9Vblo1NkRDdFcvYVZyVnI5eTI4ZDFueTJD?=
 =?utf-8?B?YklXazdFZDMwMWRTaklBY042eERsQ0xwaEhTWXlVdkRsTWsza0txcFVXSTgv?=
 =?utf-8?B?Y1RydGdhTDZtN0xSSVd5eWFTa0szOEZ5dUlHMlBheTk2NXRtRFh1YUFFZ1NC?=
 =?utf-8?B?TXJZODZ2VU4vQkFpOTZ1YUNPQ0kvVW05eWlPMXNkYTI3cXFSU3laem42dzZi?=
 =?utf-8?B?akc2Vk10Qmk2MWV4TVZocjZ4cTBqdGlCSWRzVm5ZRjN1Q2NHV3dRRktHemph?=
 =?utf-8?B?RTNENS82cU01TVo5RTZCRXd6NnM5OUQxRkttMEV2SG14RTI1bG1ydDQ1eEFO?=
 =?utf-8?B?RC9xK3VOb2tpak52ZXErWXYzOWY4TitBMkJOek9XREUwdGs3UHQzbDZxNHJZ?=
 =?utf-8?B?Q0NZN2NjRTNkOUx1alR4MW5VcjFjYzJETUVhbUJmSEJnWjdFdWtnQ2Z1NmNv?=
 =?utf-8?B?dEhDa0tXMTZZaG12Qkk4anVzMlJxZTZTSURDdTNUU0JTKy81cFkxRFlsRGJL?=
 =?utf-8?B?c0tKbEFrNXR2NkRxZmtZbkV3MkdzQWJmNHJoOHVxMUxEMDJsaUlLQkZ4bE9a?=
 =?utf-8?B?SEk5amhNMGNqVkpSYnhzQThRcVp2cHlKTHFkWDdWSmJuZzRWajdwbUxCRGxL?=
 =?utf-8?B?V1htRVVFdjhnSzladGpxOTVrN0MwRlFtUDE1R2Ztck9BNFFMa0FxR0RJTnlZ?=
 =?utf-8?B?V0k4UTNmSDk3V1BSaXFQeUU5em1aMkFPZFhUQ2YxMmFISitnYWpETkxRWHZI?=
 =?utf-8?B?c0R6SnJWRW0zTHF1TmoxS0xwUHdrNzg0UzN2R3ZjQWJ0c3JJeDF2ZzlLM3Ev?=
 =?utf-8?B?SmRDMnRDKzdCRHZLUm0wcmM1VUNOQWtoYlhKaGFSL2J1MUFWcTRiWFUxc2ZD?=
 =?utf-8?B?OUhLVDBWYWVoYkJrSlhOOVBOVWhZdGxQVFptQXd4UkhFdTk5c01lUHRKK3Ry?=
 =?utf-8?B?V2I1U05YZUJUN1g4NWVhV0Z3NHJUbVo0aE9pUEVwMXgrL2k2U0Q0U25WOFBV?=
 =?utf-8?B?c0ZmWXpCcitwWXBOT3JsRWdpcVUxTGFldCtYSTErWWJwM1N4UlZib1lFUlda?=
 =?utf-8?B?R2xBcTRrZ3l0R21mZ0J5eG40bGg5NGNYNk5RR3dwS3U0T0N2YTJkeXoyVHo4?=
 =?utf-8?B?TWVjd1NiU0ZMVjlaM0hhaFViSXhDRlhnWmlzQ3F2SmlzRDdsMENMTUE3MXNp?=
 =?utf-8?B?ZzZvVGRBcktkNGNLUlFGZkVOUHZBUGt4Y2NRc1JKbGtPNkRudXJ6UTJPK0Fi?=
 =?utf-8?B?eFg3b25MQ05Vd200RUE2R2NpWndYUUdUSHZRbXpjK1pZd0JMWURtd01McWFr?=
 =?utf-8?B?K0htVjFUWnJsNnJ5WS9MQU1LelVuV09pdXNOZHdwWElPUEg3WERyRmhNcWpY?=
 =?utf-8?B?SnVsam9aWXowSzVZTXBjQVBmRzlUSkx1R28rWXJFQzM5akEwMWlySTVtUG1T?=
 =?utf-8?B?U2tGQUc0TkgrVVFlSmN4OTdUbXRBcVdjNmJsZVJQWTZQYWdvYzU5eE1waitS?=
 =?utf-8?B?Y3Rjc2VlVmUycEZ3T29mK3Avamk4Ly9SVkwrVUUvYWRmSWdJTTdWMC9tSlhS?=
 =?utf-8?B?L1VkbUwwSW8reTlDOStJMkRRNVF6cTZvOWZWeEdoRVZGeU9MRHAxZEJmMjRI?=
 =?utf-8?B?Q05oK3psdmJaSW1FNlR4NmZLVEJYcTk5ci8vOG5CM2o5a2FSOFNUN0QvVkxN?=
 =?utf-8?B?YVM4SFdrQy9mbWVMMTdMZ2EyMENhMmtMQXA4RVEyWW5JZHFCbUZmV1lPUzdC?=
 =?utf-8?B?MHNNekxCMVRITGd1RzVWVGcvdEJaNTA0dXowN2p4UlNKUkJrc0t4ZlMvK0Iw?=
 =?utf-8?B?b1R1ZG1vUksvK1lBSXcydXJuak16QmNDWGhST0hFSkVYMXdjT2JVQ0pnU0Ew?=
 =?utf-8?B?U0tzaVRtMnp4UkFHdzVGVElJRHNJd0VxOXVFeld6WkFaM3J1TzhhQ1RwZEFr?=
 =?utf-8?B?NnFuUzNMYzJ1endRdVAxL0phK1FIS0ZGZFUxUHlXeXZVMUQ0VE15d0E5YklU?=
 =?utf-8?B?QXp6YitjbW1TS2xnMUNpZXc4Y3Y1L2x0MkFwMGd1dGVhRExrTTV1dTB5T2VL?=
 =?utf-8?B?ZlNYeHdMc1U2Nk9iNFI0VmJQTXg3aUtOWkZzSWJ2aEZoMnlCQlQ3ZjN2aGVr?=
 =?utf-8?B?dzFxT1lkcUFDNXdJTjBVNnlJeVNFY3o3TmozRFNnZEZVLzhaVWdFamwrOW9L?=
 =?utf-8?B?MGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <213C16B5BB266C468CE52E73E50F504C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65cb126f-9694-432e-d859-08da5ab6f13e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 16:38:20.3696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4L9S4tdTl8QTd9GtWlHCzhfPSOc4vLhjBUlrVUv0110LUw67n8ny7vw0AYqgYw1IYKSmi2ym7hYZVMPkkK7K7u3fKzrqs/Ge72lMXUUHqwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1234
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
Cc: alsa-devel@alsa-project.org, airlied@linux.ie, palmer@rivosinc.com,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 sam@ravnborg.org, damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, tglx@linutronix.de,
 dillon.minfei@gmail.com, lgirdwood@gmail.com, fancer.lancer@gmail.com,
 linux-spi@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 palmer@dabbelt.com, dmaengine@vger.kernel.org, masahiroy@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzAvMDYvMjAyMiAxNzoyOCwgTmlrbGFzIENhc3NlbCB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBXZWQsIEp1biAyOSwgMjAyMiBhdCAwNzo0
MzoyOVBNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+PiBGcm9tOiBDb25vciBEb29sZXkg
PGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPj4NCj4+IEhleSBhbGwsDQo+PiBUaGlzIHNl
cmllcyBzaG91bGQgcmlkIHVzIG9mIGR0YnNfY2hlY2sgZXJyb3JzIGZvciB0aGUgUklTQy1WIENh
bmFhbiBrMjEwDQo+PiBiYXNlZCBib2FyZHMuIFRvIG1ha2Uga2VlcGluZyBpdCB0aGF0IHdheSBh
IGxpdHRsZSBlYXNpZXIsIEkgY2hhbmdlZCB0aGUNCj4+IENhbmFhbiBkZXZpY2V0cmVlIE1ha2Vm
aWxlIHNvIHRoYXQgaXQgd291bGQgYnVpbGQgYWxsIG9mIHRoZSBkZXZpY2V0cmVlcw0KPj4gaW4g
dGhlIGRpcmVjdG9yeSBpZiBTT0NfQ0FOQUFOLg0KPj4NCj4+IEkgKkRPIE5PVCogaGF2ZSBhbnkg
Q2FuYWFuIGhhcmR3YXJlIHNvIEkgaGF2ZSBub3QgdGVzdGVkIGFueSBvZiB0aGlzIGluDQo+PiBh
Y3Rpb24uIFNpbmNlIEkgc2VudCB2MSwgSSB0cmllZCB0byBidXkgc29tZSBzaW5jZSBpdCdzIGNo
ZWFwIC0gYnV0IGNvdWxkDQo+PiBvdXQgb2YgdGhlIGxpbWl0ZWQgc3RvY2tpc3RzIG5vbmUgc2Vl
bWVkIHRvIHdhbnQgdG8gZGVsaXZlciB0byBJcmVsYW5kIDooDQo+PiBJIGJhc2VkIHRoZSBzZXJp
ZXMgb24gbmV4dC0yMDIyMDYxNy4NCj4+DQo+IA0KPiBJIGZpcnN0IHRyaWVkIHRvIGFwcGx5IHlv
dXIgc2VyaWVzIG9uIHRvcCBvZiBuZXh0LTIwMjIwNjMwLA0KPiBidXQgd2FzIGdyZWV0ZWQgYnkg
YSBidW5jaCBvZiBkaWZmZXJlbnQgd2FybmluZ3Mgb24gYm9vdCwNCj4gaW5jbHVkaW5nIGVuZGxl
c3MgUkNVIHN0YWxsIHdhcm5pbmdzLg0KPiBIb3dldmVyLCBldmVuIHdoZW4gYm9vdGluZyBuZXh0
LTIwMjIwNjMwIHdpdGhvdXQgeW91ciBwYXRjaGVzLA0KPiBJIGdvdCB0aGUgc2FtZSB3YXJuaW5n
cyBhbmQgUkNVIHN0YWxsLg0KPiANCj4gU28gSSB0ZXN0ZWQgeW91ciBzZXJpZXMgb24gdG9wIG9m
IHY1LjE5LXJjNCArDQo+IGNvbW1pdCAwMzk3ZDUwZjRjYWQgKCJzcGk6IGR0LWJpbmRpbmdzOiBN
b3ZlICdyeC1zYW1wbGUtZGVsYXktbnMnIHRvDQo+IHNwaS1wZXJpcGhlcmFsLXByb3BzLnlhbWwi
KSBjaGVycnktcGlja2VkLA0KPiAoaW4gb3JkZXIgdG8gYXZvaWQgY29uZmxpY3RzIHdoZW4gYXBw
bHlpbmcgeW91ciBzZXJpZXMsKQ0KPiBhbmQgdGhlIGJvYXJkIHdhcyB3b3JraW5nIGFzIGludGVu
ZGVkLCBubyB3YXJuaW5ncyBvciBSQ1Ugc3RhbGxzLg0KPiANCj4gSSB0cmllZCBib3RoIGJvb3Rp
bmcgYm90aCB2aWEgdS1ib290ICh3aXRoIHUtYm9vdHMgRFRCKQ0KPiBhbmQgYm9vdGluZyB0aGUg
a2VybmVsICh3aXRoIGFuIGluaXRyZCkgZGlyZWN0bHkuDQo+IEkgY291bGQgc3VjY2Vzc2Z1bGx5
IHJlYWQgZGF0YSBmcm9tIHRoZSBNTUMgaW4gYm90aCBjYXNlcy4NCj4gDQo+IFRoZXJlZm9yZToN
Cj4gVGVzdGVkLWJ5OiBOaWtsYXMgQ2Fzc2VsIDxuaWtsYXMuY2Fzc2VsQHdkYy5jb20+DQoNClRo
YW5rcyBOaWtsYXMuDQo=
