Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 509F0566EAD
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 14:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E42D11A359;
	Tue,  5 Jul 2022 12:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CFDD10EDA0
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 12:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1657025453; x=1688561453;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KyU+TVxCEmJC4JoWMbYN8JUevrSyEkXuYgCgnA4znO8=;
 b=bfGBJj4ZBE+NoyUEIXp370fTOJp1v9oDlnFpyNKqPFKLgUfHmGEG6E4t
 Q0iOPylRZRg/S9Yb1xMPhkcW3RFOJF4GSe01xuyn0e4fUmkzuxLHaxFpS
 anJOvJRX2MWF0Ag/5OfIiDKvDSCJu+gst+zaxkurxf7BZVwjmbS49DD4i
 pKv/Zw7Z0DvZ6h0fFAHLDDx/0aK7Ikh6gjaez6Np8VQkkKPXWPXANgUCC
 EDKePlqeJufoP5+UtVYSZ0K26mNWZtTGIuzHXHphpuAABxy3v3qjZOyaq
 uMM62paqTpV5lW1fyvay0Ltgnu9f/xyeCMHeTcew/x54I0E+mzWAcuq2I g==;
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="171082069"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Jul 2022 05:50:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 5 Jul 2022 05:50:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 5 Jul 2022 05:50:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUaSKMqLjcMOsCwYivMpmuprkB/JALiNHRwMcivNHEhKkppmTu/77oTbD/glujIflsYaxsnvrUZztL2bE5cMYB/MxKz/hTCcCzVfM9Pu93VdLyItHcWwqsj/XVRx2W9SHOPEHOL79qyJ1C140HNAblTTvBXPUljZVOL0+A8+v1/N9d5eA+3aCasWbzBdjLl1uvugwqziMrwNhMrUDNfMLaKxi8sXhHMh3rnhs1wfNk0cWdQHQ0v1GXdKN8yyjMy5g5JH3OdNOINLvpOShk72RXi4JGq/aSJjftanIV5eFzy55WSMkEzA8jRUMi0DApcwpS2GFvumikT/6+3tZBwoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyU+TVxCEmJC4JoWMbYN8JUevrSyEkXuYgCgnA4znO8=;
 b=GJ5RwJnYLX0v0XywlbfxdwvvqW2OhcmNq0vYdUffChlZeLMVIS8+pWrDhQVZ1q772de1bNueSL8P9sBOaypWwD7Q7mJRvrUWK+RefaklLJldY2fzegaFWIlUaM83/Rp6Pygqe8N28NR3JusMA62VWlEtavjc4mJOFlNt2+MUTnz0YuW3AOAPqiU8lLHiXIAiS/o+td1iyk1bvuk1YjZcemMbQPrGAswgsVtinItlWGOmUfflMtLFGfPjxL0M21WKKweqdLhHyVrpRJ+4dfJqdOLH3l25P001MgAXji57hNVMUGFr/8XL+C28YHpSmH9zFfYQcTgc7j719SQPD5jgbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyU+TVxCEmJC4JoWMbYN8JUevrSyEkXuYgCgnA4znO8=;
 b=i/CeW5Odms5J9QI4296tgc3YO2Q8m/QwMFCw8QXuyzN4rTVO63eylsv26IK9MkGXo5sTv3d7HbQWJ9US9yl5wXB/psu8f/Anad+RhEobN9nai1H5JeKWCBGzJ85m7XnzGppYvqWpRpTp82j1z/oR9t7TtRocoXCkRGQb2kKC8S4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB3356.namprd11.prod.outlook.com (2603:10b6:5:58::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 12:50:47 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 12:50:47 +0000
From: <Conor.Dooley@microchip.com>
To: <vkoul@kernel.org>, <conor@kernel.org>
Subject: Re: [PATCH v4 04/14] dt-bindings: dma: dw-axi-dmac: extend the number
 of interrupts
Thread-Topic: [PATCH v4 04/14] dt-bindings: dma: dw-axi-dmac: extend the
 number of interrupts
Thread-Index: AQHYjYAsB9J8K4kr7Eu231T8omMXfa1vv16AgAABVYA=
Date: Tue, 5 Jul 2022 12:50:47 +0000
Message-ID: <6feefba9-8807-5f35-35e4-4b0d549c506b@microchip.com>
References: <20220701192300.2293643-1-conor@kernel.org>
 <20220701192300.2293643-5-conor@kernel.org> <YsQyi3Mx99m8fnGu@matsya>
In-Reply-To: <YsQyi3Mx99m8fnGu@matsya>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: afe20792-cdbb-4539-a2f8-08da5e84fb43
x-ms-traffictypediagnostic: DM6PR11MB3356:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KwlmzrYLsbEl03Zz5+hOPx1xLwNZ8tsWyiwCKi9rALKxG8vwLiSlks/aQYqvLkdIFEnKSS+l63Biw1Yp8zXsoUIJaAUZ2iYer0VQlhX3oMi3DDp2yb3FiyBsFQ0i3I4cd8g/PmJSYTgXW/2knA2vMFOu60udNEI1WRqsxFV+T35tmbfMqdBi2ZrkIbOo3dLp54qxdibSrw1gw6Piji+2IjhHkfJGMCywSUvLnJmkINvLo0zmQZaG/VPRsw7DUACNiN0hr7yR3lE7RS6qjS4GJdMjFkmyrzMKa6tkflI7hDnrgwUVgGdGMqPh1ZKQcJ9CdZ8aZ+k1ASGmvDGvETjF7KOk3YG00LZUbFVuRw+J9SCGr187Fib1pN/NZqrWEWekc4MjIUheKAFAMovPghu8rmxRpqghJZoRiDl33YDt5DueQqvelwTcJdROIoyXKeia7BxVKj3AncTltv859pXzOJyMQzoUL8rqhOmSDY3uAcfN7qjMf8UDNpryhVPj013A3vxyP1unD/U7UTPKx2T46NJsdIhJIPVH6HDO08AA12YBN3DmiCYz35gx6iwAT/Ws6QE9JORfBN1hycUhaV9cil5VBlyS1xYfrTvcsN4GHrzyp2W9cvgfg2DqjlHfZxi7tQRZ7HqUKJh+MwNibk20CN0UlUuSQPwMSOmm0f7KlR+oL0qxCsyOJyepeDFjoVV27NasM/CQLPvMdunIGsn2v6fYjF+TeXBQwfbHzreKQpEymoHGPaLG7jcEDxG5Tg4tzYwM4m/x5L3fOD5lPCCtGBS3Tgtakec9g3m50e01tzgCZIkdHuirB5eatOKT6mjWNJmA3aMZDP0xJFnRgvF08RDjIXV52VUGhe+RB9YdfhSoyHXLoF5pkApJnO/vsk5N+X8FQVQTCO7Uaiqad/9sPgV6lVuMhpuvpsQ9lSX3RHll4mLSzFkyOv61VBotVTFg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(39860400002)(396003)(136003)(346002)(38070700005)(2616005)(186003)(122000001)(31686004)(2906002)(8936002)(36756003)(7416002)(5660300002)(66946007)(66556008)(66476007)(66446008)(316002)(54906003)(64756008)(8676002)(478600001)(91956017)(6486002)(966005)(4326008)(76116006)(6506007)(53546011)(41300700001)(26005)(6512007)(38100700002)(110136005)(71200400001)(31696002)(86362001)(83380400001)(43740500002)(45980500001)(15398625002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2d4aTBMNXh4OU43QmlvbzZNbVorZFRPeFp0aitJcE84dG8rRDIwWmtyaldX?=
 =?utf-8?B?aXJRaC9WcTVETVBEWnBxUnFUelRRcVZPT1FDVm5DKzZCN3ZFR3FmSnBkMmp3?=
 =?utf-8?B?SzBxeUZLOEtqSUxXbjBRelRVaWRUTjJXVXdUVU83cFA0eEVrQW1oeThPek5j?=
 =?utf-8?B?R2IwVlB3YUFJb0tBZGFnc1dkV2d1blFnTzBUOVB0UGRSM3R3QzZaM2VBcW5t?=
 =?utf-8?B?Y2dxSXRHeFYwSFBkZ2VKZDE2WkM0UEFWblIxZHhURUJuREFpOHdnSFBibmxE?=
 =?utf-8?B?cGhIQmhNWUVuTFBMODJCWEZXNlRtUzlVd3VZekt3WFE5VnZLMCtMcGpnNHR3?=
 =?utf-8?B?eUVxQW1PNWtjWVViajBIUjg4NWxNSytYUWF0RDYwNXFwN3lCU1RRdHlHOUR6?=
 =?utf-8?B?amxoTUVRT243S0R6aEwzZWVZTTJvVElDMUlONiswOTBwUFloYmg1Rmh4TSs3?=
 =?utf-8?B?T1p5Z1VkcTAvU2x3Q3g1TGhvUlpzbzA1ZWZaeis2MVdVamx1Q1QzVEwzREVi?=
 =?utf-8?B?SEdXZCtuMXdWRGlGUUVVZ3RTamViTmQvejFmRGZQLy9FZDd6Rk9PNnBtbkZC?=
 =?utf-8?B?MGNRSTFGcmdITkw3ZkJyMHBIaXNrZWtBYnY0ZHNnVDU4R3RrUVA5d2dsZ1ZM?=
 =?utf-8?B?VTlOTUI4WEswemYyZ3I0RWV5VVFzSFMvMUpzdEM0YUFkaGcvd2ZqV2xMSE5Y?=
 =?utf-8?B?dTRMdXdUZERnN3hrWGwwQWF6L3VneUJZdTRuN3pEdHBweHhLbkZlKzd4RWFp?=
 =?utf-8?B?NVRtWEZBWGRqb20vcEdyQ29hK0RTeXZhTlNhNmhVWXcrdGp6aHI5dEM4WHg0?=
 =?utf-8?B?M3prN3ZKckNHbGNORUdZdmIvRk9uT2hScjVuODM0RVJIUXdWMmYvN2QzV1ND?=
 =?utf-8?B?cDBRelBIL1RCODBiaEpGdWhYR3E3UkxxRXVTK3pPUDVROEl5cVM3TTdUaDgx?=
 =?utf-8?B?SVpkMEJ1TGsxckNCaTlRUDJuUlV0R056QmcyTmhvYmtSK3pVeXUwU0QrNWVl?=
 =?utf-8?B?dXV4NFh3Y3MyakkveGI4K3A1cS96MEF0TFN0KzVUTTJvY1lmbDJwWTJJZ3Z1?=
 =?utf-8?B?QzYwQ1NWSFVuNXlPcncxaExCaWRIUXRRbmw5bHdzcVVYcUlVTXlvMUFGMVJ0?=
 =?utf-8?B?Y1Z1R1M3QnpXWGZzY0tRa2srZHFuTmZvZEkzNlBwR0lhOHRnNC9IbFIvZXgw?=
 =?utf-8?B?QjR1K0E2MGk0eW5sRWwrd2grWWpyRm90NGg0MHRQRkdrUVo0M0ExTSt2Zzcv?=
 =?utf-8?B?dlBqVFAwUmU3SW9LR0ZlSXMyMnhnNGtuWkdDSXRicWlHbENqZmtFZlNlUHFB?=
 =?utf-8?B?aE96RW1NdmsyV0JXN1BiS1B3L3VjNVVyQ0N5M0pid2YzM2tIcnhONHV6eFB4?=
 =?utf-8?B?a2laUnF5dVVRd0ZTamFuMnZobm1KV1RyQmRBd2lKTERNSFFOU3RhMHU4Smpn?=
 =?utf-8?B?akMvcHVVdkl6dFdTOFNKT3RLRmF3VExpYzAzWDZNclROV01ya1RyVlhpM1RZ?=
 =?utf-8?B?T05YM3R1LzVxdHhGUS9LbjJ2cGRKZVRZYWh6ZnlMTmY0b1RkREROazZrNlRj?=
 =?utf-8?B?eVc5anFpMTB6OHkxYzJ0aCt1QmNXMEwrV0FqcUFNN3lzK21SZ2xiaVFrcks5?=
 =?utf-8?B?MzE3THNKUnBlV1ZRYTZuRnZtaE9CRjRGRkUvd2dUL2lqWGZBTjhMWFNXb1Fv?=
 =?utf-8?B?RGZtUGJ6THY3UXFRcUVFZWNuY2NVZkN6MVdlMC9BcitEOWFJVnROMmNwSkZs?=
 =?utf-8?B?RTArZ1ZGN2NNMWpLZG5pQitTdTZ6TUdmTzZhWkdNenRKK3FDcld2em9tc0NS?=
 =?utf-8?B?dFEydzcvZHZ3Z0dSNU9pbkZsNEowZFZWMU16dkM2aHhNODdJTkd6SnpXck5o?=
 =?utf-8?B?Z0xmYUh5UlJyRGhpaWJ3WGErYVJUbW9yQ0JQT2VxSXlVK1FXM0k2QVArcFoy?=
 =?utf-8?B?UGxpRVJralhPNGFIVmU3U1REdHJyd2U3cmdHVGJJMzROUDJaNWJnbVBMakc0?=
 =?utf-8?B?V1hVaGtXSEk3UzRoQUVMWUNrMlJvVVd2QkFEdkVlNXltVWlOOGE0eG1RenJD?=
 =?utf-8?B?cVo1VGwrVFpCSXdva3lQaThFRnUrckpVaXhLSEh1NTlCektFODhPdXhnaXQ3?=
 =?utf-8?Q?t/yWzPgi4Ea5QUYN+nyD7MePz?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C6A1B5C593A984992891DA09442087C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe20792-cdbb-4539-a2f8-08da5e84fb43
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 12:50:47.0242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4J7HrSeVT+Ig0VzNVr/xICaQLT303u1kqvh9Pzp2RMgPxXF9v+mDTufHQPbH9i4XUB0DEWksWyFzpo1BjD3y4lKY6Oy+y5H5AVurKd+tw4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3356
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
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, Conor.Dooley@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-riscv@lists.infradead.org, sam@ravnborg.org,
 damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com,
 dillon.minfei@gmail.com, lgirdwood@gmail.com, fancer.lancer@gmail.com,
 robh+dt@kernel.org, palmer@dabbelt.com, dmaengine@vger.kernel.org,
 masahiroy@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDUvMDcvMjAyMiAxMzo0NiwgVmlub2QgS291bCB3cm90ZToNCj4gT24gMDEtMDctMjIsIDIw
OjIyLCBDb25vciBEb29sZXkgd3JvdGU6DQo+PiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPg0KPj4NCj4+IFRoZSBDYW5hYW4gazIxMCBhcHBhcmVudGx5IGhh
cyBhIFN5c25vcHN5cyBEZXNpZ253YXJlIEFYSSBETUENCj4+IGNvbnRyb2xsZXIsIGJ1dCBhY2Nv
cmRpbmcgdG8gdGhlIGRvY3VtZW50YXRpb24gJiBkZXZpY2V0cmVlIGl0IGhhcyA2DQo+PiBpbnRl
cnJ1cHRzIHJhdGhlciB0aGFuIHRoZSBzdGFuZGFyZCBvbmUuIFN1cHBvcnQgdGhlIDYgaW50ZXJy
dXB0DQo+PiBjb25maWd1cmF0aW9uIGJ5IHVuY29uZGl0aW9uYWxseSBleHRlbmRpbmcgdGhlIGJp
bmRpbmcgdG8gYSBtYXhpbXVtIG9mDQo+PiA4IHBlci1jaGFubmVsIGludGVycnVwdHMgdGhlcmVi
eSBtYXRjaGluZyB0aGUgbnVtYmVyIG9mIHBvc3NpYmxlDQo+PiBjaGFubmVscy4NCj4+DQo+PiBM
aW5rOiBodHRwczovL2NhbmFhbi1jcmVhdGl2ZS5jb20vd3AtY29udGVudC91cGxvYWRzLzIwMjAv
MDMva2VuZHJ5dGVfc3RhbmRhbG9uZV9wcm9ncmFtbWluZ19ndWlkZV8yMDE5MDMxMTE0NDE1OF9l
bi5wZGYgI1BhZ2UgNTENCj4+IFJldmlld2VkLWJ5OiBTZXJnZSBTZW1pbiA8ZmFuY2VyLmxhbmNl
ckBnbWFpbC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rt
YS9zbnBzLGR3LWF4aS1kbWFjLnlhbWwgICAgICAgICAgfCA3ICsrKysrKy0NCj4+ICAgMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL3NucHMsZHctYXhpLWRt
YWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvc25wcyxkdy1h
eGktZG1hYy55YW1sDQo+PiBpbmRleCA0MzI0YTk0YjI2YjIuLjk4YzJhYjE4ZDA0ZiAxMDA2NDQN
Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvc25wcyxkdy1h
eGktZG1hYy55YW1sDQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZG1hL3NucHMsZHctYXhpLWRtYWMueWFtbA0KPj4gQEAgLTM0LDcgKzM0LDEyIEBAIHByb3BlcnRp
ZXM6DQo+PiAgICAgICAgIC0gY29uc3Q6IGF4aWRtYV9hcGJfcmVncw0KPj4gICANCj4+ICAgICBp
bnRlcnJ1cHRzOg0KPj4gLSAgICBtYXhJdGVtczogMQ0KPj4gKyAgICBkZXNjcmlwdGlvbjogfA0K
PiANCj4gcm9iIGFza2VkIHlvdSB0byBkcm9wIHRoaXMgaW4gbGFzdCBwYXRjaCwgcGxzIGZpeCB0
aGF0IGFuZCBzZW5kIHdpdGggaGlzDQo+IGFjaw0KDQpZZWFoLCBJIHdhcyBhIGJpdCBndW5nLWhv
ICYgc2VudCBiZWZvcmUgdjQgd2l0aCBvdGhlciBmaXhlcyBwcmlvcg0KdG8gaGlzIHJldmlldyBv
ZiB2My4gSSBkaWRuJ3QgaW50ZW50aW9uYWxseSBpZ25vcmUgaGltIDopDQoNCkknbGwgcmVzZW5k
IGxhdGVyIHRvbmlnaHQuDQoNClRoYW5rcywNCkNvbm9yLg0KDQo+IA0KPj4gKyAgICAgIElmIHRo
ZSBJUC1jb3JlIHN5bnRoZXNpcyBwYXJhbWV0ZXIgRE1BWF9JTlRSX0lPX1RZUEUgaXMgc2V0IHRv
IDEsIHRoaXMNCj4+ICsgICAgICB3aWxsIGJlIHBlci1jaGFubmVsIGludGVycnVwdHMuIE90aGVy
d2lzZSwgdGhpcyBpcyBhIHNpbmdsZSBjb21iaW5lZCBJUlENCj4+ICsgICAgICBmb3IgYWxsIGNo
YW5uZWxzLg0KPj4gKyAgICBtaW5JdGVtczogMQ0KPj4gKyAgICBtYXhJdGVtczogOA0KPj4gICAN
Cj4+ICAgICBjbG9ja3M6DQo+PiAgICAgICBpdGVtczoNCj4+IC0tIA0KPj4gMi4zNy4wDQo+IA0K
