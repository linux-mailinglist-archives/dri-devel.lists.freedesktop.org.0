Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B3C55BEC2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 08:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3407311A50E;
	Tue, 28 Jun 2022 06:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA70B11A572
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 06:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1656397847; x=1687933847;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/5XHY9K4lbYzXiNjL4hQ814bQqdvbFHGIqkYf9O+BDY=;
 b=EFdpSF0VaR6iVIVYGXgGVp/idVXr33ZoXbUymSXRbYdRI8XfCUQ/jJSC
 BeaQBjPZuLKDEcy5m8+8YOz7ruc0Sv/+Vxbd1fp15rWAMbHpd1TJQvirc
 ADDk3i5Rb5518cqDtEdVcOxQNP56RdWyOBlvmV+59v3g8fRn6W6zM/UCA
 XguZIe4TbBcS1RU6kf/awPd//2z/jFfTT58vnGnZBdB2rIxY2RGM4oWG3
 rq9aOWiBIwECpxgpcnOuQ6bp4UtwfVaOiolaQbWYDiWHe+ipLwPbOnucd
 THHTO3w7z+QvwcJm8bEQedfKHWD1+NB/GfNSdLwWTDrIoVhs7p4onM/Ls Q==;
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="102029594"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jun 2022 23:30:45 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 27 Jun 2022 23:30:45 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 27 Jun 2022 23:30:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2Wvv6F5BFHd2924qcGBeSo56yLmCMz15QCkfc7syIigEEUehSZ6cKYQikHjt/cmP6bF6s8jBJOzgbMeIkk1BWA9drZ1HGA9lZjyE9lYPobGp/HPso5mEhVODyaotT0g8RAHR1E/j2O/q7ZgSabj5652gDinjo3DhHY3t7+KzoFwEOifW5mM/J4PtWGhogp3m9gPsXJQjn97zy8vDKh3A6twNjSQK98z++OH0B4pT2AyAqN3Sq9nZbiEvH3X8BUdBE0IpSG+MXTkiUhRt1xJuBgpOL/MtOtIB4at8nuT2p615gxupIe3Kvc8yatg+s83OIZI+UcHnd3qsYTDm0YxzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5XHY9K4lbYzXiNjL4hQ814bQqdvbFHGIqkYf9O+BDY=;
 b=DnlzqLItgS6FcuXy9JWXyq4uF7/5XuiLSAVVNut5mKq3nY+fFBCFFbG1VHv7eMufAvmCQXq95T1i6NXbzZtAXCV3drfl18hCUJnGKWeYfO0HES5gGUKZTOhlbitLkSV2W+/P/MA8YD0lIuU/C8yA8vOmbl6EGzzMfLEDyPIyY+V+89XZkTXX38hCKO5ob0HiFNEgqJiM0592f+CNlAqxh0wJ+7lBs6ma7sNM//tiiXbZAUEMWRKUxxBc/SS4ymSLNYzkFaJrd/GoYHWHTn3swcg5LU0be+k+bYWlivMuuI7xJMsWmyLXhxYtU44eaiSwdug32mIvDMkER3IBdLrZ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5XHY9K4lbYzXiNjL4hQ814bQqdvbFHGIqkYf9O+BDY=;
 b=Ez165tZAXH1FDvJL3GtkVonSwrjTJhia+6bQy++gt26aQ7mlxpEaejJYw8GX43e3rg811ef3MM8rA937TCgMOp4lMi6VTYVKZDVzAm2dPKT7GqnYBn2MauzUmpZlEqvzPgVlAUfIn8xe3qcwCFUbO4856qOjDHajXtH/pQiRnHo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4047.namprd11.prod.outlook.com (2603:10b6:208:13a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 06:30:40 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 06:30:40 +0000
From: <Conor.Dooley@microchip.com>
To: <robh@kernel.org>, <mail@conchuod.ie>
Subject: Re: [PATCH 04/14] dt-bindings: dma: add Canaan k210 to Synopsys
 DesignWare DMA
Thread-Topic: [PATCH 04/14] dt-bindings: dma: add Canaan k210 to Synopsys
 DesignWare DMA
Thread-Index: AQHYgw9+LDzD+WbZ2Eu77tOt94oRs61j9VOAgAB1sYA=
Date: Tue, 28 Jun 2022 06:30:40 +0000
Message-ID: <40d76866-34e3-baef-c3fe-8836cd2430f6@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-5-mail@conchuod.ie>
 <20220627232919.GA3158390-robh@kernel.org>
In-Reply-To: <20220627232919.GA3158390-robh@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d0de0da-5dcb-4e68-993f-08da58cfb869
x-ms-traffictypediagnostic: MN2PR11MB4047:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hHiakVJV6unwx07bC+iy9KowBPt/FOGvj1vmZDUBwYo4ryGARvKVkXOTxYI7wklJGlCQBnRm3n4wOxfBdtF20Jfob0uUqeusIXoRndMdiGoMe7KG2bh0p6V771VKnRp8sMUncZxqbfMs1AmnuDqRyWbIWEkttiaoee8V5PtrzGqLPSa+H6XH+xtA8qgbTvoov/BFPUrrWjsLJidD8kBEdMsz+whv/c4KddX/Y7APzAEvYH+BhPZduFlmkT+BH5cUqPQsCIhYxvnnybyKw7NoikhLeDXNiqX0EX7EnBgTeFkvC2ZS4OUnGvPTZ1Wi0e5jDGZZkYIpDi6x/5mVioIAqWyE0W/BrSlkQB8lsPqH3pMOXKDe3tzEVZ71GduA/vZOUz6LxWNmuJAxX/zDFOn5CPZKoNFoVXMlTv4cqu8LpWtnIFbC9HB0CE66f/JGO8T0bWgOaHXOVseT1RfRIoY4eS8niMyP2TRCs1Yp5xPoUvBB49ljSp4hY0/KiiRoCg99lb21+J+m+XM/Huso2xg2BH/JaIgs7/JqXrPaKXUfeUcHm2PWiomjOkDSB3YSFvjDVX6G9/u4030+i3vvsoQ7KlUFjGKypI5RsxHJgYjRTkPKLcH7Nl4WE9fAEuZFgGxFDX2Wv8k6U1LhJjJy6lHWPKYPJ2gnjfQdWJ8HiSKH3LU/9bUZ3jaQT5m78pa6H88Vua7lFPdAMFJe7XKp9eWBY2fyEJ3Xw3iBtOwKauy28+xTM51+mQu/+x8be6iWE9gmCOePDq5kt1v8DPRzHSLT47y7nlAehqfeu7lsF63kgq44I95/N642TarDH6VU9OXHvCfm4R5bVaXzeBmX57xClRuhP+gQemNvBk3nkA8CuCpcR3F6KPq4fCfxIkMYmjDLsjwCcqukkCKDz7aNyn5HFlGdiHQwyckVhZxyRXCAtSE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(136003)(396003)(366004)(39860400002)(966005)(478600001)(71200400001)(2616005)(6486002)(7406005)(31686004)(31696002)(41300700001)(91956017)(186003)(316002)(86362001)(38070700005)(54906003)(2906002)(66556008)(53546011)(38100700002)(64756008)(66446008)(122000001)(8676002)(4326008)(83380400001)(6512007)(6506007)(66946007)(26005)(8936002)(76116006)(110136005)(7416002)(66476007)(5660300002)(36756003)(43740500002)(45980500001)(15398625002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUJrSmozQlhIV1ZqdjlBY3MyZ1d1WHc0QjVUQmVsZDBMcW95U0RVTE5qUW9z?=
 =?utf-8?B?aW53ckJaNU1LMGJWTHh0VFJoc0tMTUNRejI4S2NrTnVwNGtvU29RNVZIZU9C?=
 =?utf-8?B?TE1DZkIvdTZ6dGdza2k2ZXhhaFgvdzRhOHNHOFJRT2swQjRuNDZjRlNwb3A2?=
 =?utf-8?B?ditjQTkycWFwLzFvWkU5UER5R2RBRFNPbEpSdkhxVnBkcVcwa0dodVcyWkFy?=
 =?utf-8?B?NzB6MzdtL1hnTFBCaUJmbFF4VjVJSGpaS05RNVpZZ1l0QXg5Z0pkb1ZadVNH?=
 =?utf-8?B?Y2tDSFpQVW1VZDhORmozL1YxYjgzeTA4RmxmeFhISTVJV284RkJDd3lrWWg0?=
 =?utf-8?B?L0pObStlVmZKNS95Ym5EVnE3ZzZvcngrZUJvZTRySFM4aitBMWVMQ20xZExo?=
 =?utf-8?B?d0ZocGhyeUdkcXJDeS9iempISklqa1kxNFZvZGdZekdJTGNON2ZKcEdFT05k?=
 =?utf-8?B?RmV1MldIMkdBTWtzcy80b0Y5NTI1TG1jWU9DMm1jNFlFZjJNdy8yeFoyY1h0?=
 =?utf-8?B?YVk2MmhQWUUxdVdWZDBxOXJBTHg5dlZabTBkZ1VOS0NQeDJDT1N1U1d4UHdj?=
 =?utf-8?B?cDVrUHBISnlMTHU1bTNzSjJhVXEvY1pGQkRNdTdwblFJQnd2TlVkeUxGWnR1?=
 =?utf-8?B?SGdDT05ZTWw0T3QrekFQRFBzN3ovVkFvNk4vQVRxeU1uNERLZGd5N2JidDQw?=
 =?utf-8?B?N2tLc3hBMlNRd1VBMFVjUHNiVlVoaEtsSGhid2FOaVNkTWFIRDVLOVFUM1FY?=
 =?utf-8?B?ZFpZNExVcVV2YVl3OTJ3ajhEbzhaMmxQNHlBU1l6VnFhTnNZcE9uUllBdmJM?=
 =?utf-8?B?QWRHVVV1SVVmWm9lb3ZEQ1BkOEhUZUMwTDhyOEFLWkZnYXY2UXJZMnhRNzBi?=
 =?utf-8?B?bW82UkxrL2JVMTg5UmNYYThra3N3NWJ2K1hlUm1QdHNuRDJZa2FZS281bTdY?=
 =?utf-8?B?WXRxcXRYSUNEYUFOTkdubUI4d0JPLzNLbVNzbDREaFl6Z3diclVYZnBHTWpn?=
 =?utf-8?B?MkxiblRSRzJ0Z3dpdGRzTGI0YThVUi9LaTJMSVN4OFFMMDAySmFxWGxHaFZC?=
 =?utf-8?B?UlovRmppSFhmd1habFJWV3REM2JBMHZuc3VGaHlBNS92TW54NzlvbEwxS0Vs?=
 =?utf-8?B?YmE3ZmxDWndjYXVXVUh6bm12ckRhbFBRSGg4bk9GOTZxRTBDWmlNNzRhWFg3?=
 =?utf-8?B?RERENGVhZ21FVlRhSGlnYmtWTDNQS0tyS3FsZzJXdUtvNllYS2lSWGprQnEv?=
 =?utf-8?B?eFlMWnpRVWVTYUpNWk5nZWZ6dHplRDlqVzc4ZzdrM1VtdXdJa29IeG5oZTBB?=
 =?utf-8?B?QksxSlpjU2dHZmY0Tk9CRGQrWnhrL1BNNk5YNTdnMU9xdFphUlkwdmN4dS83?=
 =?utf-8?B?eC9ub2dpbWdFL1luMUVUZU0rTy94U3JySVhzR2NyTjd5RUVpc29URENLRE5i?=
 =?utf-8?B?dW1aYk81SWtFeCt5WTd3UWNrS1dTU2RxTDMxTGpJZGxaTlJOMlBHSHRzWSt0?=
 =?utf-8?B?R3o2eThELy92TUIvNUw1VGFjSmpwdmxmMmk2ZWJiTllDbjU3Nk8wcitYV0ZQ?=
 =?utf-8?B?Mmk2WTNtQ21zWXR5ZDFnSHpvay9TcSt6ajM5bGFkTXpDclU5MEhMYmtRSFhB?=
 =?utf-8?B?cHFjSVdMak1ia0xEcURzTUtweG9MV0JtaSsxSUQ4MzMvZkpFMzk1dmxsS0RB?=
 =?utf-8?B?OGdodTZiMFlnN0lwWXVHYmloVW9CMUlwWnJYa1ZhQjBBMjg2TkpHdlhaam80?=
 =?utf-8?B?WVl1Q3JNdzFRb2VoRVhtQjdvc090WlJEWXhtb2NMbHE4cTlDV2JyT0EydTVI?=
 =?utf-8?B?cEIvdG1UNVd6QnZEZksrMjcwSmZscmp4VkhxckhHSlVsN016QTBVcHEwblhs?=
 =?utf-8?B?WHdlSkVFUVQvTXlZYlFJOG9NR3c2VDhwVGV6K25nSCs5ZXAzeHhqdmhEcmhR?=
 =?utf-8?B?QUQvbkV2ZGJRZjZ3Z3BvNE1GSkh4RTM4RDNYb3lYY2ZlZTB1UGIvT2MzMXI0?=
 =?utf-8?B?RGJEazc5ZTgwKzZoQzhIWmxma0N4RVNlbXFRdG9EdUVaQzZXdTNmenJJeUNr?=
 =?utf-8?B?MXc1WEpuSlBRVG5LbkhPRDFoamRHRE56WVo3SEh3NGp5aytZc2VJR3VuY2Nu?=
 =?utf-8?Q?yBDEBE4/L9qevxht5VAMZtWeu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9FDC44A3C4FA6488D0F3F11FE471592@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0de0da-5dcb-4e68-993f-08da58cfb869
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 06:30:40.1124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: frhMo0g9GYOA9TjBFz/KEtZ77XmoHOCEkJaejj+UZWZMxt391PpTLCyEWjCo2wylpCSWsqvY1cjGXHQRavgzpPa70w0cu7fGhvc52hVUzUc=
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

T24gMjgvMDYvMjAyMiAwMDoyOSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gU2F0LCBKdW4gMTgsIDIwMjIgYXQgMDE6MzA6
MjZQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPj4gRnJvbTogQ29ub3IgRG9vbGV5IDxj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+DQo+PiBUaGUgQ2FuYWFuIGsyMTAgYXBwYXJl
bnRseSBoYXMgYSBTeXNub3BzeXMgRGVzaWdud2FyZSBBWEkgRE1BDQo+PiBjb250cm9sbGVyLCBi
dXQgYWNjb3JkaW5nIHRvIHRoZSBkb2N1bWVudGF0aW9uICYgZGV2aWNldHJlZSBpdCBoYXMgNg0K
Pj4gaW50ZXJydXB0cyByYXRoZXIgdGhhbiB0aGUgc3RhbmRhcmQgb25lLiBBZGQgYSBjdXN0b20g
Y29tcGF0aWJsZSB0aGF0DQo+PiBzdXBwb3J0cyB0aGUgNiBpbnRlcnJ1cHQgY29uZmlndXJhdGlv
biB3aGljaCBmYWxscyBiYWNrIHRvIHRoZSBzdGFuZGFyZA0KPj4gYmluZGluZyB3aGljaCBpcyBj
dXJyZW50bHkgdGhlIG9uZSBpbiB1c2UgaW4gdGhlIGRldmljZXRyZWUgZW50cnkuDQo+IA0KPiBC
dXQgaXQgd29ya3Mgd2l0aCBvbmx5IDEgaW50ZXJydXB0Pw0KDQpTZWVtaW5nbHkuLi4NCg0KPiAN
Cj4+DQo+PiBMaW5rOiBodHRwczovL2NhbmFhbi1jcmVhdGl2ZS5jb20vd3AtY29udGVudC91cGxv
YWRzLzIwMjAvMDMva2VuZHJ5dGVfc3RhbmRhbG9uZV9wcm9ncmFtbWluZ19ndWlkZV8yMDE5MDMx
MTE0NDE1OF9lbi5wZGYgI1BhZ2UgNTgNCj4+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+ICAgLi4uL2JpbmRpbmdzL2Rt
YS9zbnBzLGR3LWF4aS1kbWFjLnlhbWwgICAgICAgIHwgMzUgKysrKysrKysrKysrKystLS0tLQ0K
Pj4gICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4+
DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9z
bnBzLGR3LWF4aS1kbWFjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZG1hL3NucHMsZHctYXhpLWRtYWMueWFtbA0KPj4gaW5kZXggNDMyNGE5NGIyNmIyLi5iYzg1NTk4
MTUxZWYgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZG1hL3NucHMsZHctYXhpLWRtYWMueWFtbA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2RtYS9zbnBzLGR3LWF4aS1kbWFjLnlhbWwNCj4+IEBAIC0xOCw5ICsxOCwx
MyBAQCBhbGxPZjoNCj4+DQo+PiAgIHByb3BlcnRpZXM6DQo+PiAgICAgY29tcGF0aWJsZToNCj4+
IC0gICAgZW51bToNCj4+IC0gICAgICAtIHNucHMsYXhpLWRtYS0xLjAxYQ0KPj4gLSAgICAgIC0g
aW50ZWwsa21iLWF4aS1kbWENCj4+ICsgICAgb25lT2Y6DQo+PiArICAgICAgLSBpdGVtczoNCj4+
ICsgICAgICAgICAgLSBjb25zdDogY2FuYWFuLGsyMTAtYXhpLWRtYQ0KPj4gKyAgICAgICAgICAt
IGNvbnN0OiBzbnBzLGF4aS1kbWEtMS4wMWENCj4gDQo+IEkgd291bGQgZHJvcCB0aGlzIGRlcGVu
ZGluZyBvbiB5b3VyIG5lZWQgZm9yIGNvbXBhdGliaWxpdHkuIEFyZSB5b3Ugc3VyZQ0KPiBvbiB0
aGUgSVAgdmVyc2lvbj8gSXQncyBub3QgcmVhbGx5IGNvbXBhdGlibGUgaWYgdGhlIG51bWJlciBv
Zg0KPiBpbnRlcnJ1cHRzIGlzIGRpZmZlcmVudC4NCg0KVGhhdCdzIHdoYXQgaXQgaGFzIGJlZW4g
dXNpbmcgdW50aWwgbm93LiBBbSBJIHN1cmU/IE5vLg0KRG8gSSBoYXZlIGRvY3MgdG8gZ28gY2hl
Y2sgYWdhaW5zdD8gVW5mb3J0dW5hdGVseSwgYWxzbyBuby4NCkRvZXMgaXQgbm90IHF1YWxpZnkg
YXMgYSBmYWxsYmFjayBjb21wYXRpYmxlIGlmIGl0IHN1cHBvcnRzDQphIHN1YnNldCBvZiB3aGF0
IHRoZSBoYXJkd2FyZSBkb2VzPw0KDQo+IA0KPj4gKyAgICAgIC0gZW51bToNCj4+ICsgICAgICAg
ICAgLSBzbnBzLGF4aS1kbWEtMS4wMWENCj4+ICsgICAgICAgICAgLSBpbnRlbCxrbWItYXhpLWRt
YQ0KPj4NCj4+ICAgICByZWc6DQo+PiAgICAgICBtaW5JdGVtczogMQ0KPj4gQEAgLTMzLDkgKzM3
LDYgQEAgcHJvcGVydGllczoNCj4+ICAgICAgICAgLSBjb25zdDogYXhpZG1hX2N0cmxfcmVncw0K
Pj4gICAgICAgICAtIGNvbnN0OiBheGlkbWFfYXBiX3JlZ3MNCj4+DQo+PiAtICBpbnRlcnJ1cHRz
Og0KPj4gLSAgICBtYXhJdGVtczogMQ0KPj4gLQ0KPj4gICAgIGNsb2NrczoNCj4+ICAgICAgIGl0
ZW1zOg0KPj4gICAgICAgICAtIGRlc2NyaXB0aW9uOiBCdXMgQ2xvY2sNCj4+IEBAIC05Miw2ICs5
MywyMiBAQCBwcm9wZXJ0aWVzOg0KPj4gICAgICAgbWluaW11bTogMQ0KPj4gICAgICAgbWF4aW11
bTogMjU2DQo+Pg0KPj4gK2lmOg0KPj4gKyAgcHJvcGVydGllczoNCj4+ICsgICAgY29tcGF0aWJs
ZToNCj4+ICsgICAgICBjb250YWluczoNCj4+ICsgICAgICAgIGNvbnN0OiBjYW5hYW4sazIxMC1h
eGktZG1hDQo+PiArDQo+PiArdGhlbjoNCj4+ICsgIHByb3BlcnRpZXM6DQo+PiArICAgIGludGVy
cnVwdHM6DQo+PiArICAgICAgbWF4SXRlbXM6IDYNCj4+ICsNCj4+ICtlbHNlOg0KPj4gKyAgcHJv
cGVydGllczoNCj4+ICsgICAgaW50ZXJydXB0czoNCj4+ICsgICAgICBtYXhJdGVtczogMQ0KPj4g
Kw0KPj4gICByZXF1aXJlZDoNCj4+ICAgICAtIGNvbXBhdGlibGUNCj4+ICAgICAtIHJlZw0KPj4g
QEAgLTEwNSw3ICsxMjIsNyBAQCByZXF1aXJlZDoNCj4+ICAgICAtIHNucHMscHJpb3JpdHkNCj4+
ICAgICAtIHNucHMsYmxvY2stc2l6ZQ0KPj4NCj4+IC1hZGRpdGlvbmFsUHJvcGVydGllczogZmFs
c2UNCj4+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+Pg0KPj4gICBleGFtcGxlczoN
Cj4+ICAgICAtIHwNCj4+IEBAIC0xMTMsMTIgKzEzMCwxMiBAQCBleGFtcGxlczoNCj4+ICAgICAg
ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+DQo+PiAg
ICAgICAgLyogZXhhbXBsZSB3aXRoIHNucHMsZHctYXhpLWRtYWMgKi8NCj4+ICAgICAgICBkbWFj
OiBkbWEtY29udHJvbGxlckA4MDAwMCB7DQo+PiAtICAgICAgICAgY29tcGF0aWJsZSA9ICJzbnBz
LGF4aS1kbWEtMS4wMWEiOw0KPj4gKyAgICAgICAgIGNvbXBhdGlibGUgPSAiY2FuYWFuLGsyMTAt
YXhpLWRtYSIsICJzbnBzLGF4aS1kbWEtMS4wMWEiOw0KPj4gICAgICAgICAgICByZWcgPSA8MHg4
MDAwMCAweDQwMD47DQo+PiAgICAgICAgICAgIGNsb2NrcyA9IDwmY29yZV9jbGs+LCA8JmNmZ3Jf
Y2xrPjsNCj4+ICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiY29yZS1jbGsiLCAiY2Znci1jbGsi
Ow0KPj4gICAgICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZpbnRjPjsNCj4+IC0gICAgICAg
ICBpbnRlcnJ1cHRzID0gPDI3PjsNCj4+ICsgICAgICAgICBpbnRlcnJ1cHRzID0gPDI3PiwgPDI4
PiwgPDI5PiwgPDMwPiwgPDMxPiwgPDMyPjsNCj4gDQo+IERvZXMgdGhlIGV4YW1wbGUgcmVhbGx5
IG5lZWQgY2hhbmdpbmc/IFRoZSBvbGQgb25lIHdhcyBjb3JyZWN0LCByaWdodD8NCg0KOmZhY2Vw
YWxtOiwgY29tbWl0dGVkIG15IGR0X2JpbmRpbmdfY2hlY2sgdGVzdA0KVGhhbmtzIFJvYiwNCkNv
bm9yLg0KDQo+IA0KPj4gICAgICAgICAgICAjZG1hLWNlbGxzID0gPDE+Ow0KPj4gICAgICAgICAg
ICBkbWEtY2hhbm5lbHMgPSA8ND47DQo+PiAgICAgICAgICAgIHNucHMsZG1hLW1hc3RlcnMgPSA8
Mj47DQo+PiAtLQ0KPj4gMi4zNi4xDQo+Pg0KPj4NCg0K
