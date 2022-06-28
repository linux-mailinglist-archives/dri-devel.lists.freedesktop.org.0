Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C4355BEBB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 08:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BB511A3AA;
	Tue, 28 Jun 2022 06:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C35A11A3C7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 06:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1656397584; x=1687933584;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=hwPfXGKmIjP7VMNBQPuMD6gbM2ZFED0kaYvQrO6d+E8=;
 b=jR9mnHu6ngkik1/n4IaxuMCVWQXJucUqK6ftEVpnuoifxDxwv4BXY/mO
 OCVwHytVW2IVH1cJ8TH/MSukAuEzYwTaN8m16Lzj8rbBuczoxFUwK8FF/
 yIorDqy2Zhv+4t+3KRFQIEk04fds2xcrQCufQFPG3Lj90dOk6FNc381qA
 oQqYY7a0DW7BwEq6Hv7h4VXY0OVRCiucmgzBkI5SAiSEa2DwqltaI9iZd
 M8odf3gZKV/ec0ODOHjac4qAX5ro82lggOFoRT2xUFzg104HskiQ39thT
 kWW22G3WZXJ7Y1VFkiOl1W2InhOP7g9rvsSy1xYT5x8KxuYdE8LxteZj2 g==;
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="179789138"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jun 2022 23:26:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 27 Jun 2022 23:26:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 27 Jun 2022 23:26:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b77VodfbBCaGVgmIBEOL0f0WIBbfgpAuEjSYqu5E8XkG+/Nh3KQxJMuC5c1MdVtPoV96XkGEkRIHj6nZEZSPmgl+hJc/+Jq2yXK5EbjVTGzI5mOM0dVjfcMrxah9fm4h3eFc6yEOTO1SZquplg3pGwKX9dbtVxEIxakYXJdTEFCYdhN1BIRZ3aQ/du0buAQ5aCI0or+JCJAq3/jBblGdS7hq9082Quz2UMp5q8eG6mhgNrzHEmg6Hx6O6y+s143jqsUOOZoH8VVufKLwigOTKTwfABgeJDaAabEfmsqx9OO0E86p6oG04STZw4s2BcHPZU4F9F9NU56gpZFHoaEG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwPfXGKmIjP7VMNBQPuMD6gbM2ZFED0kaYvQrO6d+E8=;
 b=OBxR/T7c8aDaCthHEyfzKUhIW9YJwx266q97Tbf6T6BAU+yiY2TthY2qTV6icjsMerSUAqs95w1IRBx8ylnnJ9KomsQwULQxXBszgrSqszSqIBnaASNU6lZ0+WM8ptTJumqMn3Bka3Nz5YenG07MGYys7Nao/1j02xwVgKztO1IUop9+vN4fzlo40uE8Rg+MJ5xaTH3EeMpVACD/dAMVwn9J64OLxbZ1iTLAdhPclqUH+DE5/He/+VB6piSLsaBwmp8Y0jmbM4nLi50eLVhAd2AspVwZnUFCKnCZB9PIbx6e4nGCKPg0uIOmAmaa2QVOzndw/gJT26y8edXvnqFc2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwPfXGKmIjP7VMNBQPuMD6gbM2ZFED0kaYvQrO6d+E8=;
 b=Kk0FuDW/bMiqiZlF3XDT4byjJyJRfoTRatD6PjSRaNviwOpHbBJONVF53gzfTJfNL2QoHtcV6mEnbtPcc9iQv6SrgcwEP6Zvo5mk1vsFLcqF+MZyX4cTKKktch6r4/KZmaUZAEk9M5HdGBfMRYWTLxr3iTOKmgCxZDipmCatoWo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4047.namprd11.prod.outlook.com (2603:10b6:208:13a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 06:26:20 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 06:26:20 +0000
From: <Conor.Dooley@microchip.com>
To: <robh@kernel.org>, <mail@conchuod.ie>
Subject: Re: [PATCH 02/14] dt-bindings: display: panel: allow ilitek,ili9341
 in isolation
Thread-Topic: [PATCH 02/14] dt-bindings: display: panel: allow ilitek, ili9341
 in isolation
Thread-Index: AQHYgw+DiUijTE2HSUacpO42kUV7xa1j8eIAgAB37IA=
Date: Tue, 28 Jun 2022 06:26:20 +0000
Message-ID: <aeab5065-394a-7c39-c848-eb97e36186c6@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-3-mail@conchuod.ie>
 <20220627231700.GA3144115-robh@kernel.org>
In-Reply-To: <20220627231700.GA3144115-robh@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f015c1c8-96e7-40eb-bdaa-08da58cf1d6f
x-ms-traffictypediagnostic: MN2PR11MB4047:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GSSZV6EwrGYle0bM/wmXweUj8oMPwHWfuSz+wo0W5X+AwmVPPhmkhNZMBDZl9FXDIPa1ZJvS1qM6DydhRjsZYsyANCK98kI20hlMhofVVPIZrs/Z/x4n9VpipyVxtf6EBZO8FycSnppISMxDXNGn0xSRF4fSpj1Sw6Cem/lM5eZG9kA81tJJ1/faqFK7WWfFi7zLuFBgXX9jxZtBWNa/hVUN5zAXWDvdIpXv0ZqRpuK+/WmC0wgcQyeC+YKcFL2Belyes6kgn3p4S0tgrmhyVnK3pX7jZ+DZQafvIACIt6SquFw+uwwn0Fkr0XIgzmw7I3hIo5HT7IW0/uSVu+QoWbGZuGpouth0QzFROEyCRTQe5tJyugFS/ysNa2fZhctGYcDZRR8bKy/iusxTaPF5d06hmZ6LnHWbwzKydJkFHdEAgjNe/bdqOSU3Va+rfIfE5LMM8qBeuCYplusOeF/dn/m323Qq6LMOaspylPG/V2izKJ5FJ9WpBCWBZTAURAazFtYNHqgIuXBVaQUPFTwyAkTTsxksmRF97SuSn0JkyCQFMie5jhoY2yh5vgBdpoRLYMkHm/2+kA97e1lCUZWHLImrh0gxH7mlcJRbpZ7RHJXef3rdw7uZN6yiMolY3R2Z686qmg2/vHd1exdDt9laYDpD7i9H/ZJLad6PhgyRYxz2W+6OKwCGMzBW6r6sduvGaaj2A6HW9uh+7dEIj9Zh7+3Wnval/4OlXD3MSXgGD3/Rt+LynaLjmb9FDTo3GE5McooaUHH0NSThr5ZEhoBR6XBsSjVLEeLRui7ho6zIJSF38NN2wWPVgsBqmnj4IsB0iCCo5j7ETHGZRFiCPgp+2sI9TWoNmGfQNlSuq7D7a3w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(136003)(396003)(366004)(39860400002)(478600001)(71200400001)(2616005)(6486002)(7406005)(31686004)(31696002)(41300700001)(91956017)(186003)(316002)(86362001)(38070700005)(54906003)(2906002)(66556008)(53546011)(38100700002)(64756008)(66446008)(122000001)(8676002)(4326008)(83380400001)(6512007)(6506007)(66946007)(26005)(8936002)(76116006)(110136005)(7416002)(66476007)(5660300002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1lXWFBjNzBGY3UvVWRNMVduUVd4TTJTS1hnUUlkRmJocHlybWlxVTB0KzJL?=
 =?utf-8?B?aW1jc2RHZUt0d0RKR0pxS21rRVZNR3Fib0o4SlQ5TXJUMkR4RU5KTFFxR1ZC?=
 =?utf-8?B?a3dmY1pGK0dqVDV4NUErQWVGaWVjbGIvSS9hd2xlNDdVY0U1OVI5L1lna2Vi?=
 =?utf-8?B?N2EzeEpheW1QUG96VUtENlBNcnJDT2VXQnZOeFlWaFo4elljWDJ5VnN0ditZ?=
 =?utf-8?B?QzRFWXJRMzZqQlpSdG5PcHJpdmRXNy9xT3pFcSt5Q2drQmhqZGtZWmhjazl1?=
 =?utf-8?B?WnVMa3duK2pNYlNCVDlJMDVHOU5VWXRmbDUzWHlhNm54d0pnVGhhVzdYc2Z3?=
 =?utf-8?B?TEU0bjcvaVlEVE4yVUQ2ZHdXOFNoRDB6TnQ0WDRUeDdHUFg0WjlFdTIrdmt3?=
 =?utf-8?B?SXJNQnl5aTFidXpWWm9ua2tLUmRYcHdpN0FvR25sRXR5WWVFNXB5WnVpMFpQ?=
 =?utf-8?B?NmM5bkFwNDF1anhEWW4wZmNlazgreEQwaElpY3ZNQ3I1dUh0enRmd21CTXFz?=
 =?utf-8?B?cHVSSFlKUksxdmtIK1g3d2VmRTB2OE1RVXJEeWdDSm8xV1hJcEZ2WjJlNU1I?=
 =?utf-8?B?MmpqZ3hTTzZ0bFpBVXgrL3BNc1hzdndNQ2ROTkpadGFVMWJhRnpmZGc2Zy94?=
 =?utf-8?B?VGJHcjZvZEQvVjRVQmFXcmVBSW1lVEpHMGw3YmpiVS9xVFpSY2VXVHNUTHdC?=
 =?utf-8?B?VVZJc3ZTYjlPSU1LYUFlRFhyMXMyTktyYk50U3dEenM0bXo0c0xKWThncUhm?=
 =?utf-8?B?RTVldThNVlRPOEtkN2JIbXpWaEkyUVVYODNhQVZ5c2VIRldzb0FXMS9zOGJa?=
 =?utf-8?B?M1FnRmlLMVhDN0FBMHViQmYvOFhSTlIxdnRNaWt4MTZVbVZ0WUN5R0F6REkw?=
 =?utf-8?B?M3k0QnZuRTUwVEoxdC9peEFESENIek93QzF0elpBV3c5U2d3Q0tHajN5SWRY?=
 =?utf-8?B?YVJOZ2cxQ1ZKKzJLVG9udUE1a3c1WjJ5cjFEc3cweWlTNS9YcGpNeUJYY1Ro?=
 =?utf-8?B?dVpoQmR2U0cvZTY1b3NBd1VUTXJiNExuOFNoMnNZOU5Md2YyV2d1ZjRlVEVX?=
 =?utf-8?B?WGY2RGsxbW8wbWcvYVJQL3l0dUE3OGhkWXRBcUdGNWVUaDRlRTBoM3NIYmtK?=
 =?utf-8?B?NVVrcCtMKzFEWWVIcGdPM0tWV2dLbXpOaEZURW1ZS1RlWmZrYTZFYTNEOWps?=
 =?utf-8?B?cGlQejVGT1c1Y3ErN3FVZ25IT3ZtZ1V0OS9zYUUvUlA4WjFDbC9ibVhtd0hJ?=
 =?utf-8?B?U25GSmVDQjJ2YUc5V01SNTlQQWhua05zTmVjNXV0bVlpTGYzZVI4NE5ndXA3?=
 =?utf-8?B?aU9lYjEwRXRJMW1kaDBjSXBpdkdPT1V6NnBJZG1zUE5LaU5tL25MMGY3b2dI?=
 =?utf-8?B?NWZQMEtDSnE1T1lnQjFJWW0xZ0p0cDVqYWZKcThPcWtBb25HbUJhTWloYVVP?=
 =?utf-8?B?djR4RzMraWtzTWxlb2JjbjZHSnZKUUlWY2tnT29jcWR6TzNMUWhlcncvWTl1?=
 =?utf-8?B?alhISnhCdGMxWklqNFVmdnA3TEpvN2hLUWhBN3paaU9NN1VFZitLQkRrZ2E3?=
 =?utf-8?B?aVJINllrLzg3V01GSjkvMm0wNkg0QmF4ZWxNN3ZyeWZOKzdmVlNEZ2o5Rlgv?=
 =?utf-8?B?OFNWNys2aUpzUXNyYjNaMmJ2cHlBZFFGWGE2Yzhtd2taS2wrWDRSNjJjS0ha?=
 =?utf-8?B?MUhpZVFKVHYxZTZXSDBjN3BuWkVnMVFXRW53L0ZFWVlNYU1wQng1WnB2ZVFp?=
 =?utf-8?B?OGMrbHhKdFBIbEZtbGtqckVuejM4ZW5HMVVVa25McUJjbDk1VW01c2RPRXFL?=
 =?utf-8?B?bDJqRjExREZOd3BYcUEzb296WHBNeGpQQXJFMWdiRnp5VEs1ZXYxYndPQ3FT?=
 =?utf-8?B?blAwWnVaUStXSUhMZEcxRE9vWkR5Q0ZhL0ZFQWZkS3F3L2NRRzQ2NXByUWlH?=
 =?utf-8?B?YTB6WWxpNGhxZVdvWVhnbHpkZWhUK09PSHA5eFdsbHpPVTFHa3BldHhXalZt?=
 =?utf-8?B?WGVHR2hYSUtjV3ZLRkxWTC9xMXlDWklJb24wZmcrcVBzb08vZGd0Tk5tR3FQ?=
 =?utf-8?B?SDNNaEVveHVIN2NEVDFMSEF3ZVF5Zkk4SlNlelZld1ZJeGV0bnJlQW5KckhD?=
 =?utf-8?Q?Am+optQP8e5qV8W73L+PwlZ8o?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94A71C5AFA68CC46B1E6B51E8141AC8F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f015c1c8-96e7-40eb-bdaa-08da58cf1d6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 06:26:20.1214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yKkwf2M0gU5HLnatzBrF1wLFUbKuMae8Nh1US1ekaKrCMmPTOAgrkMcki2m5+jBUyF0jueISAZ2FZ7kvxs6icLfi8hO13IX3uhX3rV7Bvwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4047
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
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 jee.heng.sia@intel.com, krzysztof.kozlowski+dt@linaro.org,
 linux-riscv@lists.infradead.org, sam@ravnborg.org,
 damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, tglx@linutronix.de,
 dillon.minfei@gmail.com, lgirdwood@gmail.com, fancer.lancer@gmail.com,
 linux-spi@vger.kernel.org, vkoul@kernel.org, palmer@dabbelt.com,
 dmaengine@vger.kernel.org, masahiroy@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjgvMDYvMjAyMiAwMDoxNywgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gU2F0LCBKdW4gMTgsIDIwMjIgYXQgMDE6MzA6
MjRQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPj4gRnJvbTogQ29ub3IgRG9vbGV5IDxj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+DQo+PiBUaGUgZHQtYmluZGluZyBmb3IgdGhl
IGlsaXRlayxpbGk5MzQxIGRvZXMgbm90IGFsbG93IGl0IHRvIGJlIHVzZWQgYXMgYQ0KPj4gY29t
cGF0aWJsZSBpbiBpc29sYXRpb24uIFRoaXMgZ2VuZXJhdGVzIGEgd2FybmluZyBmb3IgdGhlIENh
bmFhbiBrZDIzMw0KPj4gZGV2aWNldHJlZToNCj4+IGFyY2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFu
L2NhbmFhbl9rZDIzMy5kdGI6IHBhbmVsQDA6IGNvbXBhdGlibGU6MDogJ2lsaXRlayxpbGk5MzQx
JyBpcyBub3Qgb25lIG9mIFsnc3Qsc2YtdGMyNDB0LTkzNzAtdCddDQo+PiAgICAgICAgICBGcm9t
IHNjaGVtYTogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
aWxpdGVrLGlsaTkzNDEueWFtbA0KPj4gYXJjaC9yaXNjdi9ib290L2R0cy9jYW5hYW4vY2FuYWFu
X2tkMjMzLmR0YjogcGFuZWxAMDogY29tcGF0aWJsZTogWydpbGl0ZWssaWxpOTM0MSddIGlzIHRv
byBzaG9ydA0KPj4gICAgICAgICAgRnJvbSBzY2hlbWE6IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2lsaXRlayxpbGk5MzQxLnlhbWwNCj4+IEFsbG93IGls
aXRlayxpbGk5MzQxIHRvIGJlIHNlbGVjdGVkIGluIGlzb2xhdGlvbi4NCj4gDQo+IEp1c3QgYmVj
YXVzZSB5b3UgZ2V0IGEgd2FybmluZyBkb2Vzbid0IG1lYW4gaXQgaXMgcmlnaHQuIGlsaTkzNDEg
aXMgYQ0KPiBwYW5lbCBkcml2ZXIgSUMsIG5vdCBhIGNvbXBsZXRlIHBhbmVsLiBJdCBuZWVkcyBh
IG1vcmUgc3BlY2lmaWMNCj4gY29tcGF0aWJsZS4NCg0KcGZmLCBtYWtlcyBzZW5zZS4gSSdsbCBj
b25qdXJlIG9uZSB1cC4NClRoYW5rcywNCkNvbm9yLg0KDQo=
