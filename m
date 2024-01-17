Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A0382FEDB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 03:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2302F10E0F2;
	Wed, 17 Jan 2024 02:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78FC10E0F2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 02:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705459020; x=1736995020;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lt8/W1OBYtWQiPI9mF+RYaZ6lXCjYWyn/STitgkGdVs=;
 b=1YqHWSyCp3DlZ2stC2AgT70qz+fAi7YqVbOz6oLRfRM/wYdxdVfCEZ1d
 U+Bwl8S/FlogTfjJBWt+e851SlontCy83h/+H9Qc3BRj4AXqpkofenjK0
 fP/Yq3k0pwP81h/CMgpGDjYoGEuDRt0gPpnbd9Kdo9ff2pYow0/QLzM03
 7NU3nzhipkVl/tE5EiCgMZ24nnDEIL03Y/xDSfDCmIV5aJW0aVRQb18Hi
 mIEREIwSIf7Xo3NdHONVkESyxHCrF2k8Koh5yPXIRorME/19+E4nLCAgR
 GgrGNtM6rst+Y3kZ5kyXUgr0Tb7l44nqLkjmQmeyp1GaddY7uajledc3N g==;
X-CSE-ConnectionGUID: gQsrOVlCSfWmmC+M8kBYAg==
X-CSE-MsgGUID: 0Yg0EluTRQmDMlPak+AKyw==
X-IronPort-AV: E=Sophos;i="6.05,200,1701154800"; d="scan'208";a="14840096"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jan 2024 19:36:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 19:36:37 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 19:36:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpvPg+gghxo+PDovUGO5aZKM5K34ftIPJ9iYLmHyZJG+RaZCj1KjfifnCisn8gCkl9qg8LimRw0sESPnJgD30o+MIz51mOesCKxK9fsW9pMERcsFY+M5hWA1m6fA6MxYgFCLbF4+DddRsVJyYpUOCDRYOOkccRV1N4C9tCR87ZftnAFPMhUtTkiO+osZ5rPj99wpMwzh+JE8ZJfgFEXCkfiCPsfIfl9U9WE8/WOyzBUC7ZHxdmQjbQOHIpS3UEacLmGMbUYDUjuvx2Ngpbv6wBoCtkULmWkByPDtaR1P3rVvfCpiNGaI7c23nAOiAiWBPM3jPFSYUdc66xfwLPXAYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lt8/W1OBYtWQiPI9mF+RYaZ6lXCjYWyn/STitgkGdVs=;
 b=d1RhJI4aL2vZyr4gT2bPQZrrNf78zMA3A3zfXIPd57GuIDI9nr2Onro6IXhzCIS8fskTqDissehwr1BtCITtegWo/rxOb7DMNofqGgjOsl6UK1+skA0bd3ySZrMHruEEtmvKl9uh/AyxyeHCUKt1ZLC1YMN3hrSJOo4wv1QOtivOV9rTxSqmv/R7rpulturaeJORJSRE/e+a8qzM80Bmjfgoi0roUOvuKg4Bpp9JEyYMe3VCZkHN8O23hLguq4tWi/z4fR+oRAJv/IyKspNZ3OrhGxzbbQOiKM3bmF0/IGRlAjt80khhba0OfeX/bmnDwzJI0aZXo5EvRLx0OrSfCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt8/W1OBYtWQiPI9mF+RYaZ6lXCjYWyn/STitgkGdVs=;
 b=3rqbyOkir80FEFSGIg9B/G1eYsBlHzqqc1a3un4wfyRDs9QYzkBxEXDV960vvwS35pYS7wUMivXBQtIek+dzpQ86GzIod2y3LnIwhQl0pFPe7ikX5BO66B9rNvVo8fSEFJB7Q/9Z7Hz/EDn0I7JmjUKZlaH8RnmEGOHSoQUJtTQGpYR41NqL+jsD5P+9XDLpMtCc4wMHJwkm1+6B59hUOVIINFDmOhzRbAnaHdOQlukL0UgaUIw/3F8ZwntqDS+mtZTrLoxT1qdtDdzyOT+sWXKoRJMAbwGjRLIsupffd+QzsXVQfYgD/lkx/hkNmAECbL9PJGaKiusQxn7P9RxiuQ==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by SN7PR11MB6702.namprd11.prod.outlook.com (2603:10b6:806:269::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 02:36:34 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7202.020; Wed, 17 Jan 2024
 02:36:34 +0000
From: <Dharma.B@microchip.com>
To: <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: convert Atmel's HLCDC to DT
 schema
Thread-Topic: [PATCH v2 1/3] dt-bindings: display: convert Atmel's HLCDC to DT
 schema
Thread-Index: AQHaSHCakAdMasJgKUaqbasJdJ7S+LDc2WuAgABxq4A=
Date: Wed, 17 Jan 2024 02:36:34 +0000
Message-ID: <aa43b509-f25a-4ca5-bd1a-a561eb4866ad@microchip.com>
References: <20240116113800.82529-1-dharma.b@microchip.com>
 <20240116113800.82529-2-dharma.b@microchip.com>
 <20240116194943.GA301272-robh@kernel.org>
In-Reply-To: <20240116194943.GA301272-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|SN7PR11MB6702:EE_
x-ms-office365-filtering-correlation-id: 65596dbd-4e9b-4269-55c1-08dc17051eea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lrAT2Bn9G4EDPgUsSy4bxGPNKpq1PYkzAHAcA1t+SyXClhD4GZOTe48n4Ck7h5azrOMEjUGnKEzwAdJnJ3hzcPIg2S1wmOxffv16xYpTHXXnWWKSy/DTIKfzI3nXhKuOpAtNyIVJNnw8ToJ2XDNHMEef2P/oon1CCxFoTPWUeEo+395TQbpBZ58rldUbbQPjriD7bxsp2neVltNVM6tm+5AmDzG0cnbLWL7vmIx1LdHGTcoGf9TxfPMptFCRME69SbI0VIQdzoA9gcoCf0T2ejROlcFUQPRIiv4tnkGgs8aj/lMtmMEtGpUUWydo/2kNmCplBBW4njBxw9T3PHCSsyYa0oATWMeXvPtPzEwAVwnKyhfDxpwUjmHnJxUq1e9Av91xkI7xG+SfBXaEYxfIhVjmUHZoGTQWfD8IaSsBd8/mxCKt7C9h8sdT5o0UDfPU+spJZxiRydZoa0lR+4CfOuqKGVk5wfgpyRAb/CNZ1aayaXqKyN9AnIaUbY6TS++wG4L5/+A0b/FdgdPIModLsAHGqBOJ7Kg4Kvd0apaO4pGc6yXDjDfh9HcQWC4owRlmkuvetiTUB34+j3M36JpqO7mU7BjOIe83nO3e1yti5ZU5WJHcHIY/jTdjbpAHOuBeGjn2COdrIpEfih8cB6Ejh0614usywUJOPzUe437xqu0Sj+zi0fxgKMQrOYr/ln9Pi9l4obWwFe986x+8odQrVA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(346002)(396003)(376002)(230922051799003)(230173577357003)(230273577357003)(1800799012)(64100799003)(451199024)(186009)(31686004)(6506007)(71200400001)(107886003)(53546011)(6512007)(2616005)(26005)(38100700002)(36756003)(86362001)(31696002)(38070700009)(8936002)(2906002)(41300700001)(8676002)(4326008)(966005)(6486002)(122000001)(83380400001)(7416002)(5660300002)(478600001)(316002)(91956017)(76116006)(66946007)(66476007)(66446008)(64756008)(54906003)(66556008)(6916009)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3Fqdk9QSkNqM2JuMGZjcUJYWXlyT2VtN2RlODJ1NmFBTlo3SmJKYmFWMXRu?=
 =?utf-8?B?bFZVQlJZSnZUNWlpL2RVRENlVTZaYWduSFhnRWR4dlE3bFVONm9VUXp1THBY?=
 =?utf-8?B?cGlKNmV2cDJ1MEh0dkxENnlRbzV4aWM0K2phbFdoODV0ekF0enUxRjZGU2g2?=
 =?utf-8?B?dEJ2ZE9JYXNoWGcxTnM2SGhEMGo3cUZaRER0QVI3SFRzSGkrTVNHbXM0dmVj?=
 =?utf-8?B?c1JKNzVORDUzSFB4U0tmTWh2Vmt0VmNQUmFEbEhHY3czUFlRcGtvS2IzUVBZ?=
 =?utf-8?B?bGo2VCsxZEFKK1BQQmNmZVdRbHJLUTNwNlFaUm1VeGEvdklocE15WHlISjF5?=
 =?utf-8?B?S1c0RktQQjhRbGJzQ1JGSUE5NVJpRUp0YjVkSWFVZDgvYUcwRXkwQlNXeC9S?=
 =?utf-8?B?T0VhNlNIdHBiU0lvTlBwWFArbG5ZRDg5c3QwSGNuTzZXRXE1T2U4bUQ5Q3Nr?=
 =?utf-8?B?UStiMlRpb1lxRlJvS1AyLzczdmdUSFlQRzIxR3ZGaFljTTBpeW1vLzM2QTB4?=
 =?utf-8?B?dkNRZDk5QWQzdEtoUWtLTUh3Ry82R2JVaURSaGJxYTBUMjdGc3gvcGE3Um9W?=
 =?utf-8?B?czlBelFTa0U1bUZsSXY5dlB3Z0hFQ2JaL0wxU09CK3RJZVNMMkNqUm9hdEJK?=
 =?utf-8?B?S2Nvak9CZUcvTW1YYUdKUEJYZENrbkY0NFBPeUFxenFrSkxuYmRJSG9UZUtz?=
 =?utf-8?B?czFuSExla2hGTy9MNXlraEw1QjlhMU5VVXhINUNhQjlsTFNiZ1NWWWUxdXo0?=
 =?utf-8?B?UDg4YjJNWmN5SlhnTUgwdDlFZDZETjMyVFNwTWNhMmRWM2VUZTFTczFaaFp1?=
 =?utf-8?B?QlloMWxweHVRQjlabC9OZmt5TVJCMHFiaisrNE5qdWtKNnNIN0pmZlM4eFBN?=
 =?utf-8?B?S0J1d3ZDWUR3V2tqaUErUFAwTGVjaFlkSytIb1hCZGRyNmk0WDFjamUyV2Zn?=
 =?utf-8?B?TjV5TlBLTENFU2pKRzIyL1JoTTJrTDlYTmNkWnlSNlp4T0xHZGUvNDdUV29l?=
 =?utf-8?B?aVk5ckgrY3dlRXlNNXo5dmV1MnZrYTZLcUlhZUFkY2FEZ1FSYzhKQi9melZI?=
 =?utf-8?B?dGIwb2FKOEE0aEZ0NzZDTUFIUTVvMU52em1yaUJMVFlRRDlwZmhyaU05QW1a?=
 =?utf-8?B?aDY5czNZMzV1eU5ZOG9lc2hsYm9sZXJGWkhxU1hleTVjb1pRV3pxYzFFQTVQ?=
 =?utf-8?B?YytxN1dpZjJBZHhtRHFZZUttdW5EdWxIYUtPMWtOajRnMDA2VjMrOFNON1JG?=
 =?utf-8?B?U1ptb3BZTjcxSzM5Mm9HUE1yS2lvS01qQ29RWnY3cVAzQk13U3pYWE5tSDJi?=
 =?utf-8?B?UTF2NGtnOWllSUVTWnBBejRNYWwzZDVFZnBXcDNJY1ZvZDRNQWMzOTdkeG1E?=
 =?utf-8?B?MTcybkZTWGNBR3pkZFZiZGtyQVdqYU40eWNXWUxhKzNCRVJqaXdkdmlQRUdP?=
 =?utf-8?B?dERkQllPYmo4bGRKZkdxbXEvY2hpMXZrUHVxbmU2N0c0SGU0b2p2R1RNOXVC?=
 =?utf-8?B?N3ZkZFVnaktac2drM2V3Y2tzYmxwenFWRXBRK1FqdDlqZWs2L0dGVEk2S2F6?=
 =?utf-8?B?YXR1OU5OT3MxYnpFNkVXeDNCZ1V1WFIwT2VEYzRsRk9DNFpYcHh2UlFhS0pP?=
 =?utf-8?B?ZzIxTkNxbWg1YVNlS3crbTE2TU5PdnVWa2xSeXJkK0ZpcmhaRFNHVmhlYjFX?=
 =?utf-8?B?eHAxdW9USUdnWkY5UWY4NXZxS29MKzBwLzR1NG0zWk5Td0dIcXVQUjNxNXcv?=
 =?utf-8?B?bFNubmFaMTZQQlVUOGtlK08xOUhFb1Y0UlhpdStOUC9OcnJDdEpLSFRrZWdG?=
 =?utf-8?B?ZFl5ejhkUGl3RlV1dEVxY1FCNDNpYlJaWWhza0t0UWlRNlVSV0xjb3d1MFVp?=
 =?utf-8?B?R0grdmhhcmkyTDZZNTVSVllMKzkwMmt2aTAyeXlMVkMydmFUbEVQTmFaeGxk?=
 =?utf-8?B?V0V6ckVVczU0dzBhT3RDRTQ0aFRlVllqeTF1VjlyWU9leUx5RUlRTFBydFBh?=
 =?utf-8?B?RWxWdXlLanlmczIzeTJGMHRxT2Zkc2xaUTBXUEtFdzViUENCTDZrK25Yamcx?=
 =?utf-8?B?S1FVbjcvRjZJcXIrSWJKeDlsRmpPZXZzRU1zZ2lMV2hMdFdSYXZqV2QyOFZZ?=
 =?utf-8?Q?7mGUgQjbGJ/tu3LExLmPrXfOc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBFA6B87522BBF44BD868EC5D745FC92@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65596dbd-4e9b-4269-55c1-08dc17051eea
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2024 02:36:34.0284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xq6Oy48EFzxNDf11EVrDJfPhTBYmPZC3iV0QV0I0JEtiQgMNngOVcfb5qngLVrUFyG4E+UJ8zpX+M9EJQdbOTA==
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
Cc: Linux4Microchip@microchip.com, linux-pwm@vger.kernel.org,
 alexandre.belloni@bootlin.com, dri-devel@lists.freedesktop.org,
 Nicolas.Ferre@microchip.com, Conor.Dooley@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@tuxon.dev, airlied@gmail.com, sam@ravnborg.org, lee@kernel.org,
 u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 conor+dt@kernel.org, tzimmermann@suse.de, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTcvMDEvMjQgMToxOSBhbSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gVHVlLCBKYW4gMTYsIDIwMjQgYXQgMDU6MDc6
NThQTSArMDUzMCwgRGhhcm1hIEJhbGFzdWJpcmFtYW5pIHdyb3RlOg0KPj4gQ29udmVydCB0aGUg
ZXhpc3RpbmcgRFQgYmluZGluZyB0byBEVCBzY2hlbWEgb2YgdGhlIEF0bWVsJ3MgSExDREMgZGlz
cGxheQ0KPj4gY29udHJvbGxlci4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBEaGFybWEgQmFsYXN1
YmlyYW1hbmkgPGRoYXJtYS5iQG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+IGNoYW5nZWxvZw0K
Pj4gdjEgLT4gdjINCj4+IC0gUmVtb3ZlIHRoZSBleHBsaWNpdCBjb3B5cmlnaHRzLg0KPj4gLSBN
b2RpZnkgZmlsZW5hbWUgbGlrZSBjb21wYXRpYmxlLg0KPj4gLSBNb2RpZnkgdGl0bGUgKGRyb3Ag
d29yZHMgbGlrZSBiaW5kaW5nL2RyaXZlcikuDQo+PiAtIE1vZGlmeSBkZXNjcmlwdGlvbiBhY3R1
YWxseSBkZXNjcmliaW5nIHRoZSBoYXJkd2FyZSBhbmQgbm90IHRoZSBkcml2ZXIuDQo+PiAtIFJl
bW92ZSBwaW5jdHJsIHByb3BlcnRpZXMgd2hpY2ggYXJlbid0IHJlcXVpcmVkLg0KPj4gLSBSZWYg
ZW5kcG9pbnQgYW5kIG5vdCBlbmRwb2ludC1iYXNlLg0KPj4gLSBEcm9wIHJlZHVuZGFudCBpbmZv
IGFib3V0IGJ1cy13aWR0aCBkZXNjcmlwdGlvbiBhbmQgYWRkIHJlZiB0byB2aWRlby1pbnRlcmZh
Y2VzLg0KPj4gLSBNb3ZlICdhZGRpdGlvbmFsUHJvcGVydGllcycgYWZ0ZXIgJ1JlcXVpcmVkJy4N
Cj4+IC0gRHJvcCBwYXJlbnQgbm9kZSBhbmQgaXQncyBvdGhlciBzdWItZGV2aWNlIG5vZGUgd2hp
Y2ggYXJlIG5vdCByZWxhdGVkIGhlcmUuDQo+PiAtIEFkZCBjb21wYXRpYmxlIHRvIGV4YW1wbGUg
MiBhbmQgYWRkIGNvbW1lbnRzIHRoYXQgYnVzLXdpZHRoIGlzIHRoZSBkaWZmIGJldHdlZW4gdHdv
IGV4YW1wbGVzLg0KPj4gLS0tDQo+PiAgIC4uLi9hdG1lbC9hdG1lbCxobGNkYy1kaXNwbGF5LWNv
bnRyb2xsZXIueWFtbCB8IDExMCArKysrKysrKysrKysrKysrKysNCj4+ICAgLi4uL2JpbmRpbmdz
L2Rpc3BsYXkvYXRtZWwvaGxjZGMtZGMudHh0ICAgICAgIHwgIDc1IC0tLS0tLS0tLS0tLQ0KPj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDExMCBpbnNlcnRpb25zKCspLCA3NSBkZWxldGlvbnMoLSkNCj4+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L2F0bWVsL2F0bWVsLGhsY2RjLWRpc3BsYXktY29udHJvbGxlci55YW1sDQo+PiAgIGRl
bGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9hdG1lbC9obGNkYy1kYy50eHQNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXRtZWwvYXRtZWwsaGxjZGMtZGlzcGxheS1jb250
cm9sbGVyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9h
dG1lbC9hdG1lbCxobGNkYy1kaXNwbGF5LWNvbnRyb2xsZXIueWFtbA0KPj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZjAyMmMyOTRjZmJjDQo+PiAtLS0gL2Rl
di9udWxsDQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9hdG1lbC9hdG1lbCxobGNkYy1kaXNwbGF5LWNvbnRyb2xsZXIueWFtbA0KPj4gQEAgLTAsMCAr
MSwxMTAgQEANCj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0Qt
Mi1DbGF1c2UpDQo+PiArJVlBTUwgMS4yDQo+PiArLS0tDQo+PiArJGlkOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L2F0bWVsL2F0bWVsLGhsY2RjLWRpc3BsYXktY29udHJv
bGxlci55YW1sIw0KPj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVt
YXMvY29yZS55YW1sIw0KPj4gKw0KPj4gK3RpdGxlOiBBdG1lbCdzIEhpZ2ggTENEIENvbnRyb2xs
ZXIgKEhMQ0RDKQ0KPj4gKw0KPj4gK21haW50YWluZXJzOg0KPj4gKyAgLSBOaWNvbGFzIEZlcnJl
IDxuaWNvbGFzLmZlcnJlQG1pY3JvY2hpcC5jb20+DQo+PiArICAtIEFsZXhhbmRyZSBCZWxsb25p
IDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4NCj4+ICsgIC0gQ2xhdWRpdSBCZXpuZWEg
PGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4+ICsNCj4+ICtkZXNjcmlwdGlvbjogfA0KPj4g
KyAgVGhlIExDRCBDb250cm9sbGVyIChMQ0RDKSBjb25zaXN0cyBvZiBsb2dpYyBmb3IgdHJhbnNm
ZXJyaW5nIExDRCBpbWFnZQ0KPj4gKyAgZGF0YSBmcm9tIGFuIGV4dGVybmFsIGRpc3BsYXkgYnVm
ZmVyIHRvIGEgVEZUIExDRCBwYW5lbC4gVGhlIExDREMgaGFzIG9uZQ0KPj4gKyAgZGlzcGxheSBp
bnB1dCBidWZmZXIgcGVyIGxheWVyIHRoYXQgZmV0Y2hlcyBwaXhlbHMgdGhyb3VnaCB0aGUgc2lu
Z2xlIGJ1cw0KPj4gKyAgaG9zdCBpbnRlcmZhY2UgYW5kIGEgbG9vay11cCB0YWJsZSB0byBhbGxv
dyBwYWxsZXRpemVkIGRpc3BsYXkNCj4+ICsgIGNvbmZpZ3VyYXRpb25zLg0KPj4gKw0KPj4gK3By
b3BlcnRpZXM6DQo+PiArICBjb21wYXRpYmxlOg0KPj4gKyAgICBjb25zdDogYXRtZWwsaGxjZGMt
ZGlzcGxheS1jb250cm9sbGVyDQo+PiArDQo+PiArICAnI2FkZHJlc3MtY2VsbHMnOg0KPj4gKyAg
ICBjb25zdDogMQ0KPj4gKw0KPj4gKyAgJyNzaXplLWNlbGxzJzoNCj4+ICsgICAgY29uc3Q6IDAN
Cj4+ICsNCj4+ICsgIHBvcnRAMDoNCj4+ICsgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMv
JGRlZnMvcG9ydC1iYXNlDQo+PiArICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UNCj4+
ICsgICAgZGVzY3JpcHRpb246DQo+PiArICAgICAgT3V0cHV0IGVuZHBvaW50IG9mIHRoZSBjb250
cm9sbGVyLCBjb25uZWN0aW5nIHRoZSBMQ0QgcGFuZWwgc2lnbmFscy4NCj4+ICsNCj4+ICsgICAg
cHJvcGVydGllczoNCj4+ICsgICAgICAnI2FkZHJlc3MtY2VsbHMnOg0KPj4gKyAgICAgICAgY29u
c3Q6IDENCj4+ICsNCj4+ICsgICAgICAnI3NpemUtY2VsbHMnOg0KPj4gKyAgICAgICAgY29uc3Q6
IDANCj4+ICsNCj4+ICsgICAgICByZWc6DQo+PiArICAgICAgICBtYXhJdGVtczogMQ0KPj4gKw0K
Pj4gKyAgICAgIGVuZHBvaW50Og0KPj4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFt
bCMvJGRlZnMvZW5kcG9pbnQNCj4+ICsgICAgICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFs
c2UNCj4+ICsgICAgICAgIGRlc2NyaXB0aW9uOg0KPj4gKyAgICAgICAgICBFbmRwb2ludCBjb25u
ZWN0aW5nIHRoZSBMQ0QgcGFuZWwgc2lnbmFscy4NCj4+ICsNCj4+ICsgICAgICAgIHByb3BlcnRp
ZXM6DQo+PiArICAgICAgICAgIGJ1cy13aWR0aDoNCj4+ICsgICAgICAgICAgICBkZXNjcmlwdGlv
bjogRW5kcG9pbnQgYnVzIHdpZHRoLg0KPj4gKyAgICAgICAgICAgICRyZWY6IC9zY2hlbWFzL21l
ZGlhL3ZpZGVvLWludGVyZmFjZXMueWFtbCMNCj4+ICsgICAgICAgICAgICBlbnVtOiBbIDEyLCAx
NiwgMTgsIDI0IF0NCj4+ICsNCj4+ICtyZXF1aXJlZDoNCj4+ICsgIC0gJyNhZGRyZXNzLWNlbGxz
Jw0KPj4gKyAgLSAnI3NpemUtY2VsbHMnDQo+PiArICAtIGNvbXBhdGlibGUNCj4+ICsgIC0gcG9y
dEAwDQo+PiArDQo+PiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+PiArDQo+PiArZXhh
bXBsZXM6DQo+PiArICAtIHwNCj4+ICsgICAgLy9FeGFtcGxlIDENCj4+ICsNCj4+ICsgICAgZGlz
cGxheS1jb250cm9sbGVyIHsNCj4+ICsgICAgICBjb21wYXRpYmxlID0gImF0bWVsLGhsY2RjLWRp
c3BsYXktY29udHJvbGxlciI7DQo+PiArICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsN
Cj4+ICsgICAgICBwaW5jdHJsLTAgPSA8JnBpbmN0cmxfbGNkX2Jhc2UgJnBpbmN0cmxfbGNkX3Jn
Yjg4OD47DQo+PiArICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+PiArICAgICAgI3NpemUt
Y2VsbHMgPSA8MD47DQo+PiArDQo+PiArICAgICAgcG9ydEAwIHsNCj4+ICsgICAgICAgICNhZGRy
ZXNzLWNlbGxzID0gPDE+Ow0KPj4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+PiArICAg
ICAgICByZWcgPSA8MD47DQo+PiArDQo+PiArICAgICAgICBobGNkY19wYW5lbF9vdXRwdXQ6IGVu
ZHBvaW50QDAgew0KPj4gKyAgICAgICAgICByZWcgPSA8MD47DQo+PiArICAgICAgICAgIHJlbW90
ZS1lbmRwb2ludCA9IDwmcGFuZWxfaW5wdXQ+Ow0KPj4gKyAgICAgICAgfTsNCj4+ICsgICAgICB9
Ow0KPj4gKyAgICB9Ow0KPj4gKw0KPj4gKyAgLSB8DQo+PiArICAgIC8vRXhhbXBsZSAyIFdpdGgg
YSB2aWRlbyBpbnRlcmZhY2Ugb3ZlcnJpZGUgdG8gZm9yY2UgcmdiNTY1LCBidXMtd2lkdGg9MTYN
Cj4+ICsNCj4+ICsgICAgZGlzcGxheS1jb250cm9sbGVyIHsNCj4+ICsgICAgICBjb21wYXRpYmxl
ID0gImF0bWVsLGhsY2RjLWRpc3BsYXktY29udHJvbGxlciI7DQo+PiArICAgICAgcGluY3RybC1u
YW1lcyA9ICJkZWZhdWx0IjsNCj4+ICsgICAgICBwaW5jdHJsLTAgPSA8JnBpbmN0cmxfbGNkX2Jh
c2UgJnBpbmN0cmxfbGNkX3JnYjU2NT47DQo+PiArICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47
DQo+PiArICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+PiArDQo+PiArICAgICAgcG9ydEAwIHsN
Cj4+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPj4gKyAgICAgICAgI3NpemUtY2Vs
bHMgPSA8MD47DQo+PiArICAgICAgICByZWcgPSA8MD47DQo+PiArICAgICAgICBobGNkY19wYW5l
bF9vdXRwdXQyOiBlbmRwb2ludEAwIHsNCj4+ICsgICAgICAgICAgcmVnID0gPDA+Ow0KPj4gKyAg
ICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JnBhbmVsX2lucHV0PjsNCj4+ICsgICAgICAgICAg
YnVzLXdpZHRoID0gPDE2PjsNCj4+ICsgICAgICAgIH07DQo+PiArICAgICAgfTsNCj4+ICsgICAg
fTsNCj4gDQo+IEp1c3QgMSBleHRyYSBwcm9wZXJ0eSBkb2Vzbid0IGp1c3RpZnkgMiBleGFtcGxl
cy4NCj4gDQo+IEluIGFueSBjYXNlLCBkcm9wIHRoZSBwYXJ0aWFsIGV4YW1wbGVzIGFuZCBqdXN0
IGhhdmUgMSBjb21wbGV0ZSBleGFtcGxlDQo+IGluIHRoZSBNRkQgYmluZGluZyBzY2hlbWEuDQpT
dXJlLCBJIHdpbGwgZHJvcCB0aGUgRXhhbXBsZSAyIGluIHYzLg0KDQotLSANCldpdGggQmVzdCBS
ZWdhcmRzLA0KRGhhcm1hIEIuDQo+IA0KPiBSb2INCg0KDQoNCg==
