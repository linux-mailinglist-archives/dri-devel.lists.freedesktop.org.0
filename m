Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3D055B816
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 09:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F131125EF;
	Mon, 27 Jun 2022 07:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FBA1125EF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 07:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1656313587; x=1687849587;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uxK79LnZN7wg1S/baveMCEqckMl0me1kjXQnBFyz830=;
 b=OjnIP6fjVZzYQWIcc//QghqcXRXnVw+XH2WHmT+d1C0TnsxngByK6JKC
 3JVjDPjMD7zRuu2ID9vC1VYS6BySNw93BO3vxvUguIhy3vHcRpNcvWQXW
 XRkaNNhsk3cqHoigAI+mE+t86zY6IXFQOM3PTJxSJ5zJQ9x+DOYmQX9ED
 OWvOCn3RCmlEgxIQt0g7IYF748gg0DXGePgyq+bHNRlBvwleCiDt+w5+5
 ytDWpQkQXnyduV/0GWXvMKSv7iPH6slRSbsIfHhiNOCtGa28Dfm+xzQ98
 phHLpLhfzFah9HvDPzaqXgzhkHGQqxgTJ/5K3LntgoBg+9jTW6/UwTh3N w==;
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; d="scan'208";a="165187226"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jun 2022 00:06:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 27 Jun 2022 00:06:16 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 27 Jun 2022 00:06:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tr1I/Kq+yd2OVHNAKE6h/Joueirld+XygMV7EUBFGCXZv4z7KhWNHZio+PNTDzL/dbUDgFPq7Tb8zimFRB0cgAhpq1CrRgqWXFgP+y8YLEmkrmNZrxIsqJ28BTQfTJmG6XXc0oUdF97dFKDfleGIfsEm3Kbl0Vdiye7LP7vgTTEqnMyqtK3RsITRUc78tlnD9qBB2KfpGIsGJforW3ABUBJ+x+mEl3RKSn+cy/OBr0JKAP/UNl0+32n+DyObvjVdLzPbYrS1/6EbeGrnYWR5O6bBJU03lDmb16RpgsSil8oKOjYrGmnmmkosRxYsRTem+dDC7TSzjw5mO8mN96uQmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxK79LnZN7wg1S/baveMCEqckMl0me1kjXQnBFyz830=;
 b=oVP43OdT+CSIzCR5binRicu0GGzwv6TmZALBfgKxT4Gm/VkPMZkUZk0NOCViK69Fn/QBosOf/MavFxUsLEaXq5iWqKHLuDxxumMsJVINBZp1jEq7O6jfK+bXAPXnRwBPPq1rAKyBAvbTJaezehzcJt5SiOu1L5QWKmAhFC/AhTrxAcyAym7t8FEJWsGXNTGZzbGBMdtPrRMwh7vpB+wIN9OlpU9sjE5BXAkuD5X0WCcl7ZBA4WTfyJJxiZb6gnnJF2ODY/FzI+bW/mOvIRQ59FfebmR2jxUwpZO5vtxTRfz0NX9+rDEnkq1DK8XEEs7L4iuF280FZ+/zFdn2wnJ5SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxK79LnZN7wg1S/baveMCEqckMl0me1kjXQnBFyz830=;
 b=O5xFFhoZ4K1k/lLmARK0JmhZSEqR5M5TD1aYPoF7jxY8xvvVBo0oPXst4JqzHUQwmWSjzarERvmwayPXXB1gx+/ypbLTVXGoyHgJOqVVnEC8FIqrJp9UtRwea9yll3NpkVK59Si1VToHmyUOlhFLoscBDIqEPeo+l+PoX4vlvPk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN7PR11MB2723.namprd11.prod.outlook.com (2603:10b6:406:b9::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 07:06:10 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 07:06:10 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <Conor.Dooley@microchip.com>,
 <damien.lemoal@opensource.wdc.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Thread-Topic: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Thread-Index: AQHYgw905RVeuSLdkUCudsZPOTg0Ga1XZVUAgAAEPQCAAAjWAIACL32AgAk9twCAAAL9AA==
Date: Mon, 27 Jun 2022 07:06:09 +0000
Message-ID: <b8dce80e-2753-497e-1dd3-3eb0d248b74e@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-8-mail@conchuod.ie>
 <9cd60b3b-44fe-62ac-9874-80ae2223d078@opensource.wdc.com>
 <e1fbf363-d057-1000-a846-3df524801f15@microchip.com>
 <891cf74c-ac0a-b380-1d5f-dd7ce5aeda9d@opensource.wdc.com>
 <6c9de242-6ccf-49a2-8422-e6949c5169ff@microchip.com>
 <70cd0066-9aa7-ca41-ad61-898d491328aa@linaro.org>
In-Reply-To: <70cd0066-9aa7-ca41-ad61-898d491328aa@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: feab9995-0017-48b0-0cbc-08da580b8375
x-ms-traffictypediagnostic: BN7PR11MB2723:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +8sUvYL7spsTFkcUYIOKRDYRR5hbI7JKrkUvraFRcnrge31OTxiEIDDPKG8Bj+PoVHAtZdBKbPG72i03sj44DORT2X6niPzgs2i5DcpOX4M0FPo3F4JsroAHBBjeIwOdDbMc7KT8Y/fLQM0LgIFlpDzwnwFXItNvlaBaVGa/I2XrwEKr3RKxuCMFJOma1vwIiauBJfrdldsWfOEGGgLAlF8GON4RNeFcc//6bRDsSTEdf8hCixQ9z34m7bwdKjh1am+hIzwnXGLOkvpVV2c6iIQpyZd5ux97TX6UIuvEzXP/DYIjN3du4CwYbLlCUUCeMDj7CZZr/XPHcnI57x+bAkymv5BQGj342sew0KrEBAyWQwlSuOF4C+UsqJ+hahnb66wfMDv6aPvxMG58J8yI1yVSdxl5GrYiLYfce8zgaH4oLC66J3Y5tHuflfPy3Je8I3ixELDY5+ZqEQ4r6dTjCAOocKzkQH9PCVeOoVqbUbSHbi+CDUdr5dezCe/h/AwByeoMkLxmByyt86cQdK5YwoRsP3buw6drztuIOres087p61G1mVRj/Wxgc3wk2ngiwIfQAmDbW/TSTvTN6JOEKcqev42n+Xf8ruPBczgF8avZLBy0KTMm4YLUttsOdjO6j82f4HkEpqX1PTBdLzF4xXwrVHIlwy4Boc8GCnSmce0fMRR5lcA0cPc2p+CB0h/9LSd1BDr010Rq/jqcG+b6X6aGtJbLVBh4PT/RiO/E1EQyj7nHaG9CfDYo+V6w88K7Jci6wPtF7Nl6DiGQMK6g5pkWRvFbiDXqVcqx4NewJRD40LHOoH1P07pHv5ufiEwKty1PKA+RaobLnbgn1Tj24BoLIrshzUnV0jSFSJjFJP3FvTsQnivL6FT51jNNgoqXD92t+qUD5n+vtIr7Opga/Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(136003)(396003)(39860400002)(346002)(366004)(2616005)(110136005)(36756003)(41300700001)(38100700002)(5660300002)(966005)(31686004)(7416002)(66476007)(7406005)(54906003)(186003)(316002)(2906002)(38070700005)(53546011)(71200400001)(6512007)(83380400001)(31696002)(76116006)(26005)(8676002)(86362001)(91956017)(6506007)(4326008)(8936002)(6486002)(66556008)(478600001)(64756008)(66446008)(66946007)(122000001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzRIWEQvRWlnYi9jRGhqRE1rMTBGNDY5eDBJMXc4K0Z2QXZaTTM4Qkx2SUgx?=
 =?utf-8?B?bElMaHRyZ2trRzJUb1hxOGpYdzZiK1FFMFB6b0ZubjQ3VjVQRnUyS1B4cGpa?=
 =?utf-8?B?b1MwODFuK01hc1k2ZllVUjJOVDVub0hjeXVTMUUxcHhicG9DajlVZDBCbjFT?=
 =?utf-8?B?SURtQ29wRitHQ3JFV0pFaUVwNkRxVERpL0M3RUJHNERoSUluejBBcnl2UGxF?=
 =?utf-8?B?OFd1MHNGek0zRkxVQXMxQ2NGKzAraXlEb28yMFNUaXIwTHNCbDNORzVQTE01?=
 =?utf-8?B?Nm95S0NZMHRYNWZqUE1rVE9nZXBLU2R6c1FOeGhRdXlQSVdHcEVQN3NMWWV2?=
 =?utf-8?B?V1AzaFBOaHAwZEJCOGxHSThsbGVxdVNjQjV6bkYrYzlQU3h2RzYxSTFLZC94?=
 =?utf-8?B?YmhkOEYycHYyeEdsMmNpRFZCakx0dHRmUTVKTGpQZVgzL2JqTERhNXJaMzBy?=
 =?utf-8?B?TTgzZEpjS2JFUWJTODVERHVqMjNtN2Vwci9pdVFJZ29BYkVrSDNNalR6SXBs?=
 =?utf-8?B?alMvTTFLMjQvM1kzMWduL0pvVjRDREo2YnVDYjZqTDc0ZUhOa1Q1NVMybktu?=
 =?utf-8?B?b0EwbzFvLzNaZ0puM3VqMDY0Y2FWTWJ0ZUxheW1WOFBmZFNFR2V1QlBsYStZ?=
 =?utf-8?B?amdvNTVvRzlVMGMvWDFvTlRLZ0Z1cEdQbE10dTk2czBNSzZpUUhwWk1YZjhV?=
 =?utf-8?B?QzErNmdVdDliUUt5YWJCUUFGeWdOOUsxRlJyTmdKRWM4N00rdm1aaVF1Zy8z?=
 =?utf-8?B?cjREOUIrZEcwT1NLTEI2R1I5S1lVNlIvKzAvSFloSEFtdnNLWFVSQXZnU3Bk?=
 =?utf-8?B?cXRQalRQUm1yMG1DM25zL09hN3p0bVBzbmsvWUxWN0xHUkNrT1NQNkZFczgr?=
 =?utf-8?B?WFFBTFpTU3NEMEI2djAvMnFyWTRvTnIrT3RnOGZmNHpOK3AxMHN3WmxZQVRC?=
 =?utf-8?B?TWFNZUNLNlRMQmhub1daNTRXMnZJTW9jdE15d0dGMFBibUdsK3ZiUS84SWU1?=
 =?utf-8?B?RTlETXJYZFY5Q0FVT2x4c1llR0FudVpGZ2JVVkVDTVFrN1Azc09leXUvWkQz?=
 =?utf-8?B?bzJWSlRSRjRTb0Z4M1lkZ3pSRGR4RmNLV0Q3c252OXVRbG80dlRYZUJDbXNa?=
 =?utf-8?B?dnBqU1licHlEMGgxeXN4QSsxcHVzNDJuVTRqVGNDZTdhOTlIRUxkQUUxQzlH?=
 =?utf-8?B?NVdsTkxxaWpEeG5kRStFV2JlZklnbFZ1c2x6ZENvVTdTT242SFdPQ1MyMGNu?=
 =?utf-8?B?VnorZDZZVGc5b2MvbUxoenFiNmdIL29zSElJaURYTjdLem94VHlOYWFGeG9y?=
 =?utf-8?B?UFBRK0xQYnZJVC8xdzBXOVo0MXQvcXVsSUhhODNjK0VyNzNwb0Nxam5FaG5D?=
 =?utf-8?B?a05Sa0tsa0JmdkEyeExieU5hTGZpNDV4dVY3OSthYW5ncnJOZTcwVHl5SVk2?=
 =?utf-8?B?SUcrNlF4dnIzQXpZeWZDc1pEYlo5NkhYWENQZHFOOGZvTkxLekhzeS9tcGI1?=
 =?utf-8?B?dlRBVU1EM1A0ZUh6YkdBT2VIT3VsczBSNHU1QlBibHBpU00xcWNIeWpQVFRx?=
 =?utf-8?B?dno4NFpxMXA1VkdtMDUvSFNGSW9qeFZKcllhWlhiYzlGTE5TYnVaK2hzRG1F?=
 =?utf-8?B?SzZ3TElxeUZvZWdOTlFnZ1JyUVFSYzlmM1ZwWndoQkVJM1RNUzVXeWtyMVRK?=
 =?utf-8?B?ZVFCUmtjazNnZmNtSzQ1WjNuclhlQ3dsaElTclgyYmZtekY2UFVBZUVoNGM0?=
 =?utf-8?B?N3BZb0NLZlpMVDh5aTl3cVlCRitoNkFUQW53RTIxUXpKUSs1aDhGMmhveXc4?=
 =?utf-8?B?enZlWnM1c2UvNW9OcUkrSXVveVFmbWNKakI5VWtMakNkWCsvS3BhUUlLUnZz?=
 =?utf-8?B?Uy9HUERkaFM4M3VUSGxXYUpXNllYeElvUndmbWR1NlRUdGxIMWhvN05rbVpW?=
 =?utf-8?B?ZFp1c3VaSmM1eWdYNEhaLzBQRUg4ZDZaUFhUUGVjRlFmb09pUm9HS09wRi9U?=
 =?utf-8?B?cnFnQ0R2eFJoMG5jVXJIaEUrdHpQK2FreEZIUlFPb2Q1K3lZcmpnL2p0RFVo?=
 =?utf-8?B?Z0V2MTNTQVhXWE1CVVVKZFMvVldOZUovU1VLUzNicWtRcjcrUkRVVU1qQmZx?=
 =?utf-8?Q?CK0un4016SF8tzO+YYhbFg0ad?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDF377D72449B04BBD60C243D66D4C89@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feab9995-0017-48b0-0cbc-08da580b8375
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 07:06:09.9405 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +axRISy0WtIM8hntN5rtT/WFEjP0sxbVm0rcfNPlbP4MnKGuZrJuFS+O8XR8Ayl8tef+LClmXfjNmrTmgEQ3aJ8bvBkpL0d5rghaONXzj/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2723
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
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, jee.heng.sia@intel.com,
 linux-riscv@lists.infradead.org, sam@ravnborg.org, masahiroy@kernel.org,
 daniel.lezcano@linaro.org, joabreu@synopsys.com, geert@linux-m68k.org,
 Eugeniy.Paltsev@synopsys.com, devicetree@vger.kernel.org,
 aou@eecs.berkeley.edu, broonie@kernel.org, palmer@rivosinc.com,
 paul.walmsley@sifive.com, tglx@linutronix.de, dillon.minfei@gmail.com,
 lgirdwood@gmail.com, fancer.lancer@gmail.com, linux-spi@vger.kernel.org,
 vkoul@kernel.org, palmer@dabbelt.com, dmaengine@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDI3LzA2LzIwMjIgMDc6NTUsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9u
IDIxLzA2LzIwMjIgMTE6NDksIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4g
T24gMjAvMDYvMjAyMiAwMToyNSwgRGFtaWVuIExlIE1vYWwgd3JvdGU6DQo+Pj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+Pj4NCj4+PiBPbiA2LzIwLzIyIDA4OjU0LCBDb25v
ci5Eb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+Pj4gT24gMjAvMDYvMjAyMiAwMDozOCwg
RGFtaWVuIExlIE1vYWwgd3JvdGU6DQo+Pj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNr
IGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlz
IHNhZmUNCj4+Pj4+DQo+Pj4+PiBPbiA2LzE4LzIyIDIxOjMwLCBDb25vciBEb29sZXkgd3JvdGU6
DQo+Pj4+Pj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4N
Cj4+Pj4+Pg0KPj4+Pj4+IFRoZSBrMjEwIG1lbW9yeSBub2RlIGhhcyBhIGNvbXBhdGlibGUgc3Ry
aW5nIHRoYXQgZG9lcyBub3QgbWF0Y2ggd2l0aA0KPj4+Pj4+IGFueSBkcml2ZXIgb3IgZHQtYmlu
ZGluZyAmIGhhcyBzZXZlcmFsIG5vbiBzdGFuZGFyZCBwcm9wZXJ0aWVzLg0KPj4+Pj4+IFJlcGxh
Y2UgdGhlIHJlZyBuYW1lcyB3aXRoIGEgY29tbWVudCBhbmQgZGVsZXRlIHRoZSByZXN0Lg0KPj4+
Pj4+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiAtLS0NCj4+Pj4+PiAgICBhcmNoL3Jpc2N2
L2Jvb3QvZHRzL2NhbmFhbi9rMjEwLmR0c2kgfCA2IC0tLS0tLQ0KPj4+Pj4+ICAgIDEgZmlsZSBj
aGFuZ2VkLCA2IGRlbGV0aW9ucygtKQ0KPj4+Pj4+DQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvYm9vdC9kdHMvY2FuYWFuL2syMTAuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvY2Fu
YWFuL2syMTAuZHRzaQ0KPj4+Pj4+IGluZGV4IDQ0ZDMzODUxNDc2MS4uMjg3ZWE2ZWViZTQ3IDEw
MDY0NA0KPj4+Pj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFuL2syMTAuZHRzaQ0K
Pj4+Pj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFuL2syMTAuZHRzaQ0KPj4+Pj4+
IEBAIC02OSwxNSArNjksOSBAQCBjcHUxX2ludGM6IGludGVycnVwdC1jb250cm9sbGVyIHsNCj4+
Pj4+Pg0KPj4+Pj4+ICAgICAgICAgc3JhbTogbWVtb3J5QDgwMDAwMDAwIHsNCj4+Pj4+PiAgICAg
ICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsNCj4+Pj4+PiAtICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAiY2FuYWFuLGsyMTAtc3JhbSI7DQo+Pj4+Pj4gICAgICAgICAgICAgICAg
IHJlZyA9IDwweDgwMDAwMDAwIDB4NDAwMDAwPiwNCj4+Pj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgPDB4ODA0MDAwMDAgMHgyMDAwMDA+LA0KPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICA8
MHg4MDYwMDAwMCAweDIwMDAwMD47DQo+Pj4+Pj4gLSAgICAgICAgICAgICByZWctbmFtZXMgPSAi
c3JhbTAiLCAic3JhbTEiLCAiYWlzcmFtIjsNCj4+Pj4+PiAtICAgICAgICAgICAgIGNsb2NrcyA9
IDwmc3lzY2xrIEsyMTBfQ0xLX1NSQU0wPiwNCj4+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAg
IDwmc3lzY2xrIEsyMTBfQ0xLX1NSQU0xPiwNCj4+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAg
IDwmc3lzY2xrIEsyMTBfQ0xLX0FJPjsNCj4+Pj4+PiAtICAgICAgICAgICAgIGNsb2NrLW5hbWVz
ID0gInNyYW0wIiwgInNyYW0xIiwgImFpc3JhbSI7DQo+Pj4+Pj4gICAgICAgICB9Ow0KPj4+Pj4N
Cj4+Pj4+IFRoZXNlIGFyZSB1c2VkIGJ5IHUtYm9vdCB0byBzZXR1cCB0aGUgbWVtb3J5IGNsb2Nr
cyBhbmQgaW5pdGlhbGl6ZSB0aGUNCj4+Pj4+IGFpc3JhbS4gU3VyZSB0aGUga2VybmVsIGFjdHVh
bGx5IGRvZXMgbm90IHVzZSB0aGlzLCBidXQgdG8gYmUgaW4gc3luYyB3aXRoDQo+Pj4+PiB1LWJv
b3QgRFQsIEkgd291bGQgcHJlZmVyIGtlZXBpbmcgdGhpcyBhcyBpcy4gUmlnaHQgbm93LCB1LWJv
b3QgKmFuZCogdGhlDQo+Pj4+PiBrZXJuZWwgd29yayBmaW5lIHdpdGggYm90aCB1LWJvb3QgaW50
ZXJuYWwgRFQgYW5kIHRoZSBrZXJuZWwgRFQuDQo+Pj4+DQo+Pj4+IFJpZ2h0LCBidXQgdW5mb3J0
dW5hdGVseSB0aGF0IGRlc2lyZSBhbG9uZSBkb2Vzbid0IGRvIGFueXRoaW5nIGFib3V0DQo+Pj4+
IHRoZSBkdGJzX2NoZWNrIGNvbXBsYWludHMuDQo+Pj4+DQo+Pj4+IEkgZ3Vlc3MgdGhlIGFsdGVy
bmF0aXZlIGFwcHJvYWNoIG9mIGFjdHVhbGx5IGRvY3VtZW50aW5nIHRoZSBjb21wYXRpYmxlDQo+
Pj4+IHdvdWxkIGJlIG1vcmUgcGFsYXRhYmxlPw0KPj4+DQo+Pj4gWWVzLCBJIHRoaW5rIHNvLiBU
aGF0IHdvdWxkIGFsbG93IGtlZXBpbmcgdGhlIGZpZWxkcyB3aXRob3V0IHRoZSBEVEIgYnVpbGQN
Cj4+PiB3YXJuaW5ncy4NCj4+DQo+PiBIbW0gbG9va3MgbGlrZSB0aGF0IGFwcHJvYWNoIGNvbnRy
YWRpY3RzIHRoZSBkdC1zY2hlbWE7DQo+PiBodHRwczovL2dpdGh1Yi5jb20vZGV2aWNldHJlZS1v
cmcvZHQtc2NoZW1hL2Jsb2IvbWFpbi9kdHNjaGVtYS9zY2hlbWFzL21lbW9yeS55YW1sDQo+Pg0K
Pj4gQFJvYixLcnp5c3p0b2Ygd2hhdCBpcyBvbmUgbWVhbnQgdG8gZG8gaGVyZT8NCj4gDQo+IFdo
eSBkbyB5b3UgdGhpbmsgaXQgY29udHJhZGljdCBiaW5kaW5ncz8gQmluZGluZ3MgZm9yIG1lbW9y
eSBhbGxvdw0KDQpCZWNhdXNlIHdoZW4gSSB0cmllZCB0byB3cml0ZSB0aGUgYmluZGluZywgdGhl
IG1lbW9yeSBub2RlIGNvbXBsYWluZWQNCmFib3V0IHRoZSBjbG9jayBwcm9wZXJ0aWVzIGV0YyBh
bmQgcmVmZXJlbmNlZCB0aGUgZHQtc2NoZW1hICh3aGljaA0KZm9yIG1lbW9yeUBmb28gbm9kZXMg
aGFzIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZS4NCg0KPiBhZGRpdGlvbmFsIHByb3BlcnRp
ZXMsIHNvIHlvdSBqdXN0IG5lZWQgdG8gY3JlYXRlIGJpbmRpbmcgZm9yIHRoaXMgb25lLg0KPiBB
bmQgbWFrZSBpdCBhIGNvcnJlY3QgYmluZGluZywgSU9XLCBiZSBzdXJlIHRoYXQgdGhlc2UgY2xv
Y2tzIGFyZSByZWFsIGV0Yy4NCj4gDQo+IEFsdGhvdWdoIHVzdWFsbHkgd2UgaGFkIHNlcGFyYXRl
IGJpbmRpbmdzIChhbmQgZGV2aWNlIGRyaXZlcnMpIGZvcg0KPiBtZW1vcnkgY29udHJvbGxlcnMs
IGluc3RlYWQgb2YgaW5jbHVkaW5nIHRoZW0gaW4gdGhlICJtZW1vcnkiIG5vZGUuDQoNCkkgZ3Vl
c3MgY2hhbmdpbmcgdG8gdGhhdCBmb3JtYXQgd291bGQgcHJvYmFibHkgcmVxdWlyZSBzb21lIGNo
YW5nZXMgb24NCnRoZSBVLUJvb3Qgc2lkZSBvZiB0aGluZ3MuIFRha2luZyAiY2FseGVkYSxoYi1k
ZHItY3RybCIgYXMgYW4gZXhhbXBsZSwNCmxvb2tzIGxpa2UgdGhlIGNsb2NrcyBldGMgZ28gaW4g
YSBjb250cm9sbGVyIG5vZGUsIHdoaWNoIHNlZW1zIGxpa2UgYQ0KImJldHRlciIgd2F5IG9mIGRv
aW5nIGl0IC0gYnV0IHdvdWxkIGJyZWFrIGV4aXN0aW5nIGR0cyBpbiBVLUJvb3QNCndpdGhvdXQg
Y2hhbmdlcyB0byBoYW5kbGUgYm90aCBtZXRob2RzIHRoZXJlLg0KDQpUaGFua3MsDQpDb25vci4N
Cg==
