Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0496E76E127
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 09:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCB410E59C;
	Thu,  3 Aug 2023 07:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD10310E023
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 10:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1690973250; x=1722509250;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=P2yAgLZr2I1MmPHW8iOXRsUoSWWPluCwChvFb4TjnKE=;
 b=EmGRIlBlcLm7wuPWJ1kEtXp0oFrk3IL3qY7SBWTouIcekCNGCQs3rVIr
 V+id1twOxzwW263dVRdoKYLnoeQHK8Co9khmAREaGYaC2AQTEMhp6i8HY
 hj86sLM5hCkikSnef985Agl8B5DhfmIWEnAlmhoQbEx6X/W7+RXlxh766
 QYMg0LrxG2o21RQNpI7kYiuglSyo0X/1TtmabrJS2iAMGXnvpue+kkp2u
 wkNoTYh8I15EbYm1d/wTr9lNESoJJMCeCJXnr2zgFeS9y/Tmtq7b0L05p
 CsjhpAoP2YXDkfP/wQLHerr8V8Gz93KWtM5hv/5JdsxkSDGVkTkU+st2H Q==;
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="226713028"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Aug 2023 03:47:29 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 2 Aug 2023 03:47:30 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 2 Aug 2023 03:47:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNCMuj1HaB1r1KTKLRrtlqPlPcGdhJT6R7+bmqV54l1NyAnCPV2w0QgcCmA57BTVqoCVO2HdnBg9RphrosWCx3A19A/R25EVxpZ0OOs3GQjzX5Sbrq+FeiXL/LSH7sf/YcbpqSvuJrv0QJuu/qzxLh5CdXp9GXzLydxYmyZh019921A7mSq/b3Hq1xCeOgd8XBSZMB1F9iCySnL2ySgiLJpgKJF7V3ksZIe3C2dMoGjTH2QoOrO627QbdROIu5saiHLsXsYIED8xfEI1qwp+V8XgIWqsjB1fLk3a5OMKZMBpfttX8gy7qJ9j1/0okmZf0fiGy+jt1HHG4jXlMVwL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2yAgLZr2I1MmPHW8iOXRsUoSWWPluCwChvFb4TjnKE=;
 b=k+S9NDOWfiXDKS+zpiLgKARVVKts1j4+Rs6wyfZ4zVScFWrvn7upevksK/llK2sJEwGjefdwJ9rCf87iqozs3/o1H918Zz++OuzzGu5r56NvF4J8n3OSzOZb1llJ1TX/B1qz7AQylj1qa9Jh/MGTk7fTPlokcAJhY85JpOtiqL7dBgX9mo0LQe+rsqZuNrdwDv+jeCQ13yZ0bEUTWOSVymI6O7Xm2OH1EggVwH3Rb6qSmFcw3c+FaAP/6fYhz0VXJAuR8m73x8LE1xmm2JDk/EnLHFEFUZwJI7j2eKHKYTofN7Z7ZsV9+DuTuhxsX5/di0bVBw6qcoL7D1EqKz6zIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2yAgLZr2I1MmPHW8iOXRsUoSWWPluCwChvFb4TjnKE=;
 b=gJ9bNAYM6jWeFBFfKiXRi/dfzVUFVmJ85OQX2JDeS9kqiVW7kUzaYIth/c5MVAmqFRudmmZsaMRodr7dcmYvI/8unLllW/8+vZ8Pr8Q5u4dyrmQEIW0NvfaVuWkudnoktBtUYYpIrgH2EMR56HMhLxOMQN4MplJiN8aSWBdk7Og=
Received: from DM6PR11MB4185.namprd11.prod.outlook.com (2603:10b6:5:195::29)
 by SN7PR11MB7974.namprd11.prod.outlook.com (2603:10b6:806:2e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Wed, 2 Aug
 2023 10:47:27 +0000
Received: from DM6PR11MB4185.namprd11.prod.outlook.com
 ([fe80::591f:32f4:3319:e1f8]) by DM6PR11MB4185.namprd11.prod.outlook.com
 ([fe80::591f:32f4:3319:e1f8%7]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 10:47:27 +0000
From: <Hari.PrasathGE@microchip.com>
To: <Manikandan.M@microchip.com>, <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <Claudiu.Beznea@microchip.com>, <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 7/9] drm: atmel-hlcdc: add DPI mode support for XLCDC
Thread-Topic: [PATCH v2 7/9] drm: atmel-hlcdc: add DPI mode support for XLCDC
Thread-Index: AQHZtGqTqCumk6PnLEW703hMRO0Te6/W9KAA
Date: Wed, 2 Aug 2023 10:47:26 +0000
Message-ID: <988bc82a-2bdb-daa7-1ea9-1e8a3c3de0bd@microchip.com>
References: <20230712024017.218921-1-manikandan.m@microchip.com>
 <20230712024017.218921-8-manikandan.m@microchip.com>
In-Reply-To: <20230712024017.218921-8-manikandan.m@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4185:EE_|SN7PR11MB7974:EE_
x-ms-office365-filtering-correlation-id: 62335b41-3b70-41d6-42fb-08db9345dcc9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9mq0/lTJDxaHkH/5axoTrwqmaa0c4cZ2Z+cLhX0a0PAqsH4mKr45Uhc9dp4QywNXzOdzMxLkOrKTL5HbypW5tW11xQGtjzmqxnCO+ztcTg1AVeYyp1gfy+Rb3qGsqHM+VSFiJV0ys7o+dX9jl5ZNEHVdpkY0AWuDlBa6t0x4npoaZQ9WAfP+2c6iobbWalBQHcYPVCFg0xU+P51mJvLk5htSM1SwkSGvGyiGkmBJJPnbh34nXmPcchLbMfAGamckTn13WrKnWWdPiHgkI9EvzyQ8M5wQ55WUkYVEmZeI9Je7eh+IJ3QYzyZkHmyV5LLNaS7OeIOYSmCv3gG3tlfGhnWuOOSnn84BS5zqlExJaWb0Kkq5p60DRQBP8wuzzSnWfAvXQvY8ceNSnKyHU+4J4PmcRpDtaZ1SuD8H7baTp+SgdVbrjpaeHxpj7Y5ooqjaOJ71Q17dqvdwUAVpK8gugIZpULh5gPwX0mc5WZFFz+fXXp5jcMJ95u5Zwcr9s4CM/TngVDe+OMeYAiS5ueE+TnGnItAH5ZOTIoSAKP1wE7M5PTuQTee7B2WBPCe2/ueJBsmnnFFKiRuztxnwrjNukCq0gswdA/zFE0GQsqA4CK4h9M6aXuA9mM/ObIykoWnxc9yCqMiUF1e7blXiUbvMrg2/+ZwQ1hR9wtiaB4YX54c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(136003)(376002)(396003)(366004)(451199021)(8676002)(122000001)(8936002)(31696002)(38100700002)(86362001)(107886003)(921005)(26005)(41300700001)(38070700005)(2616005)(83380400001)(2906002)(36756003)(6506007)(53546011)(186003)(5660300002)(4326008)(66476007)(66556008)(66446008)(64756008)(66946007)(76116006)(7416002)(6512007)(31686004)(71200400001)(91956017)(54906003)(110136005)(478600001)(6486002)(316002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0t4TDA5TXpHem5TR2ZzdWpEK1hRdUtjLzhDemdHVXowWUhlRTl0dTcvZzh1?=
 =?utf-8?B?cHhOZFkvYWtEN2ZvV1BHTFMzK1VvQXRpRTVYNUxSamdyYi9EelVpVVZzSHhh?=
 =?utf-8?B?aGxYcFpURjFtUDgyaEduZXFjWi9vOW0ra2pBa0MxdFo3KzAzSGM0WVJyMTVm?=
 =?utf-8?B?Y1FrY01xenhxNkwzYWg1cnZRYVNNaGRMbFNLM2licW1ka2l3bnM0OHg1UVlS?=
 =?utf-8?B?UURkTkFsbHM2WEZmd2JEVnc4MFBjTE45eHl6a29SQzZVS2ZJNy9WTFgvc2FM?=
 =?utf-8?B?NnpPc01JMEFLQjhBMmsvUE5icEs3Yko2dERuZFk3cmhRVVpsVHRxeGl0YjFG?=
 =?utf-8?B?V0dxUmhHNFFiWnJRTVBuU1FiL3Y3UFo2K3QwbjVUS2UyRDJ2cDlvOEFrWVQw?=
 =?utf-8?B?WUJ4dGZUM2VTOWtCek5yT2IrY0owRmhwbFV6TFRxOVF4MXVlZklRbDhYSkFI?=
 =?utf-8?B?R2JyRHpWZjZ4bVRXTCtYMm9ML3BlQkdoNE9yT1hpcEJWeitxb0xQTFh6ZDBo?=
 =?utf-8?B?SGptc1RpYy8rSWVzbFhMaUpEbkp5V0F2WVFFWENuZlN2ZzVrUENsOGRtUjlZ?=
 =?utf-8?B?TkVrVHlZTEZpTDRUaDFuU24yd2g5bXlsd3VFQ1JDWmhxYTZzOFFYdmxkV2V2?=
 =?utf-8?B?NlJvYXY4aFl1VEsxRUlZMkk2dGtXdSs0Tk93S2xYZXlFODdNcFVicGpLTC9l?=
 =?utf-8?B?UFBBN0d3dHNsUDBRbE5nZzhVbFNhajc2VjRGRWhDY0IwclJPKzVSelhINFBp?=
 =?utf-8?B?OE4vbkJFQkwxQTM3Rm5pSXFBUWxuK3VyYUpLWGRTcHNRUkFuMU5XeWJ0TXVD?=
 =?utf-8?B?Z2RYWlpHLzNwOXZmbEhVUmI2amRrZk1uZDFaZ3hzbTRHVENicEVMZ0xhalo3?=
 =?utf-8?B?SzYyb2xqalVJb1REdVFIRUdxc2pmYTJVRGI5S0NkaHZHNHZod2xQbGIrdnVH?=
 =?utf-8?B?K05xQUFsc3JZdXRhWkdyQXFEd2RTMFRpaGJoY21RNjQ5aDNjRzJ3RU9nN2Z4?=
 =?utf-8?B?M3p1VzZrL05FMVhVWjdMSEMxTi9wek9EWm1OajlFOVl0WnFldWJxbzZabjd5?=
 =?utf-8?B?SnFoUHBPZEtuRkFUTWo3dUpHREk1OFFhb2JtSEk3c0t0VnhMejFaQTQ3cERU?=
 =?utf-8?B?aFNkMVFXZEFSRlY3Z2tRSVkxWENERXMyL0QyMndhOUpwZHl2Zks0Z1hMdEVS?=
 =?utf-8?B?SFdvdWcvMHo3NnpSbitrb3RKREhodjI5MzdLNStMMVhxb3JaRGlPeitFUmZy?=
 =?utf-8?B?eW05U1pKSy82MU54Mm5kR0U5RXFCL2pRVHNZZ3pmVHYvWFlHNVpzRHJvRVBC?=
 =?utf-8?B?cXZEanVXb3Mza0JHbjNMVExLQVR1R05ZaWJvTzVzQjlCdFZxS3Z4ZmU2b1Fi?=
 =?utf-8?B?N25PdkIraUVWVVhCZDcvTUloVW45WXVaWU5UbERwUG10ZWFWVkVTMmRLT2FZ?=
 =?utf-8?B?SGFMQVNCcmRpVDVOcmlyeXZxY1p5VURRbXp2ZU5NUllkZ0RNeFlJUWpobG9M?=
 =?utf-8?B?c1luYndjNnVPaGV2WjNHbW9GVVpSS2pzVTVMZE9vT3J5N0hyVk8rb2xoQXJB?=
 =?utf-8?B?VkF2b2FGWGx3Sk5xb3hhMXp0RjhvWExwSWZYNTZqTGFIeWIyVXFXbzh0OUNZ?=
 =?utf-8?B?NHZaNTVmMWZMT1NzUFFqcVZmRlNkOTA5UXJzUmUzd21YSndCbVhzZmh3TkNi?=
 =?utf-8?B?T3pxQ0hneE5jbTZ5ZjJ6M2ZYemlpdkI3S3NHbmZHU2lqOVN0VFJmRVh4U2pP?=
 =?utf-8?B?dFQyU2RiMmMzbDN4UGlkZW41K3VhbmZuZ0d1ZjUyMmV2VkhBck9IOVNTZ1l3?=
 =?utf-8?B?TStoUUNzZVcyZ1FIdW5CK3pGbGZCUE9ZaUdjMUFoS2xaWG13RW1ENnlBMmZq?=
 =?utf-8?B?cTU1SHhlcmVUM0J2KzhYa2c3TXJZWVNldUN2VmZ2Smk2UVpUWTZFNCtVRUtN?=
 =?utf-8?B?ZHZUcEd2WWx5UnBRdGpzQnNsaHRRRCt6U2Q3d09UeWpNUEdWVytyZi9aMnRv?=
 =?utf-8?B?a0lsNGExV0RCRU5zbU9xVmFEN0ozRkpQamVTU2I3UVV4dkQyRG5rUjVpY09H?=
 =?utf-8?B?WmJ1TU9WOXdDSzFaQU5VK1hmeU12RjRpY2hLQ0d6OGNzK21PM1N2N2dSWWx1?=
 =?utf-8?B?TUR4cVpPZnV2SDFsVHUxMEdsbXEzcFpGRWR6L3RtQTA2VEIzdlBZZVg1T0w1?=
 =?utf-8?B?S0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <87F0DE1AB5080C41A4791BAAF3AAE1B3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62335b41-3b70-41d6-42fb-08db9345dcc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 10:47:26.9088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 40g5198/DQvaC9GGOku8I3u1a9wNVHYqWRzi4SXirXYCRVYQv00R000irrxtw0lYWh3wxjzwfxsseN7oUQY8aGsUBgofa7OHEumdVqWzIpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7974
X-Mailman-Approved-At: Thu, 03 Aug 2023 07:21:52 +0000
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com, Dharma.B@microchip.com,
 Durai.ManickamKR@microchip.com, Varshini.Rajendran@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDEyLzA3LzIzIDg6MTAgYW0sIE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIHdyb3RlOg0K
PiBBZGQgc3VwcG9ydCBmb3IgRGlzcGxheSBQaXhlbCBJbnRlcmZhY2UgKERQSSkgQ29tcGF0aWJs
ZSBNb2RlDQo+IHN1cHBvcnQgaW4gYXRtZWwtaGxjZGMgZHJpdmVyIGZvciBYTENEQyBJUCBhbG9u
ZyB3aXRoIGxlZ2FjeQ0KPiBwaXhlbCBtYXBwaW5nLkRQSSBtb2RlIEJJVCBpcyBjb25maWd1cmVk
IGluIExDRENfQ0ZHNSByZWdpc3Rlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hbmlrYW5kYW4g
TXVyYWxpZGhhcmFuIDxtYW5pa2FuZGFuLm1AbWljcm9jaGlwLmNvbT4NCj4gW2R1cmFpLm1hbmlj
a2Fta3JAbWljcm9jaGlwLmNvbTogdXBkYXRlIERQSSBtb2RlIGJpdCB1c2luZyBpc194bGNkYyBm
bGFnXQ0KPiBTaWduZWQtb2ZmLWJ5OiBEdXJhaSBNYW5pY2thbSBLUiA8ZHVyYWkubWFuaWNrYW1r
ckBtaWNyb2NoaXAuY29tPg0KPiAtLS0NCj4gICAuLi4vZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1l
bF9obGNkY19jcnRjLmMgICAgfCAyMiArKysrKysrKysrKysrKysrLS0tDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2NydGMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19jcnRjLmMNCj4gaW5kZXggMjdmODZj
ZWE4YmZmLi5jMGExZDJkMzFlZDIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hdG1l
bC1obGNkYy9hdG1lbF9obGNkY19jcnRjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2F0bWVs
LWhsY2RjL2F0bWVsX2hsY2RjX2NydGMuYw0KPiBAQCAtMzAsMTAgKzMwLDEyIEBADQo+ICAgICoN
Cj4gICAgKiBAYmFzZTogYmFzZSBDUlRDIHN0YXRlDQo+ICAgICogQG91dHB1dF9tb2RlOiBSR0JY
WFggb3V0cHV0IG1vZGUNCj4gKyAqIEBkcGk6IG91dHB1dCBEUEkgbW9kZQ0KPiAgICAqLw0KPiAg
IHN0cnVjdCBhdG1lbF9obGNkY19jcnRjX3N0YXRlIHsNCj4gICAJc3RydWN0IGRybV9jcnRjX3N0
YXRlIGJhc2U7DQo+ICAgCXVuc2lnbmVkIGludCBvdXRwdXRfbW9kZTsNCj4gKwlib29sIGRwaTsN
Cj4gICB9Ow0KPiAgIA0KPiAgIHN0YXRpYyBpbmxpbmUgc3RydWN0IGF0bWVsX2hsY2RjX2NydGNf
c3RhdGUgKg0KPiBAQCAtMTM4LDYgKzE0MCw4IEBAIHN0YXRpYyB2b2lkIGF0bWVsX2hsY2RjX2Ny
dGNfbW9kZV9zZXRfbm9mYihzdHJ1Y3QgZHJtX2NydGMgKmMpDQo+ICAgDQo+ICAgCXN0YXRlID0g
ZHJtX2NydGNfc3RhdGVfdG9fYXRtZWxfaGxjZGNfY3J0Y19zdGF0ZShjLT5zdGF0ZSk7DQo+ICAg
CWNmZyA9IHN0YXRlLT5vdXRwdXRfbW9kZSA8PCA4Ow0KPiArCWlmIChjcnRjLT5kYy0+ZGVzYy0+
aXNfeGxjZGMpDQoNCnNhdmUgdGhlIHZhbHVlIGluIGEgbG9jYWwgdmFyaWFibGUgYW5kIHVzZSBp
dCBhdCBhbGwgcGxhY2VzIGluIHRoZSBmdW5jdGlvbi4NCg0KPiArCQljZmcgfD0gc3RhdGUtPmRw
aSA8PCAxMTsNCj4gICANCj4gICAJaWYgKCFjcnRjLT5kYy0+ZGVzYy0+aXNfeGxjZGMgJiYgKGFk
ai0+ZmxhZ3MgJiBEUk1fTU9ERV9GTEFHX05WU1lOQykpDQo+ICAgCQljZmcgfD0gQVRNRUxfSExD
RENfVlNQT0w7DQo+IEBAIC0xNTAsNyArMTU0LDkgQEAgc3RhdGljIHZvaWQgYXRtZWxfaGxjZGNf
Y3J0Y19tb2RlX3NldF9ub2ZiKHN0cnVjdCBkcm1fY3J0YyAqYykNCj4gICAJCQkgICBBVE1FTF9I
TENEQ19WU1BETFlTIHwgQVRNRUxfSExDRENfVlNQRExZRSB8DQo+ICAgCQkJICAgQVRNRUxfSExD
RENfRElTUFBPTCB8IEFUTUVMX0hMQ0RDX0RJU1BETFkgfA0KPiAgIAkJCSAgIEFUTUVMX0hMQ0RD
X1ZTUFNVIHwgQVRNRUxfSExDRENfVlNQSE8gfA0KPiAtCQkJICAgQVRNRUxfSExDRENfR1VBUkRU
SU1FX01BU0sgfCBBVE1FTF9ITENEQ19NT0RFX01BU0ssDQo+ICsJCQkgICBBVE1FTF9ITENEQ19H
VUFSRFRJTUVfTUFTSyB8DQo+ICsJCQkgICAoY3J0Yy0+ZGMtPmRlc2MtPmlzX3hsY2RjID8gQVRN
RUxfWExDRENfTU9ERV9NQVNLIHwNCj4gKwkJCSAgIEFUTUVMX1hMQ0RDX0RQSSA6IEFUTUVMX0hM
Q0RDX01PREVfTUFTSyksDQo+ICAgCQkJICAgY2ZnKTsNCj4gICANCj4gICAJY2xrX2Rpc2FibGVf
dW5wcmVwYXJlKGNydGMtPmRjLT5obGNkYy0+c3lzX2Nsayk7DQo+IEBAIC0zNDgsNyArMzU0LDE1
IEBAIHN0YXRpYyBpbnQgYXRtZWxfaGxjZGNfY3J0Y19zZWxlY3Rfb3V0cHV0X21vZGUoc3RydWN0
IGRybV9jcnRjX3N0YXRlICpzdGF0ZSkNCj4gICANCj4gICAJaHN0YXRlID0gZHJtX2NydGNfc3Rh
dGVfdG9fYXRtZWxfaGxjZGNfY3J0Y19zdGF0ZShzdGF0ZSk7DQo+ICAgCWhzdGF0ZS0+b3V0cHV0
X21vZGUgPSBmbHMob3V0cHV0X2ZtdHMpIC0gMTsNCj4gLQ0KPiArCWlmIChjcnRjLT5kYy0+ZGVz
Yy0+aXNfeGxjZGMpIHsNCj4gKwkJLyogY2hlY2sgaWYgTUlQSSBEUEkgYml0IG5lZWRzIHRvIGJl
IHNldCAqLw0KPiArCQlpZiAoZmxzKG91dHB1dF9mbXRzKSA+IDMpIHsNCj4gKwkJCWhzdGF0ZS0+
b3V0cHV0X21vZGUgLT0gNDsNCj4gKwkJCWhzdGF0ZS0+ZHBpID0gdHJ1ZTsNCj4gKwkJfSBlbHNl
IHsNCj4gKwkJCWhzdGF0ZS0+ZHBpID0gZmFsc2U7DQo+ICsJCX0NCj4gKwl9DQo+ICAgCXJldHVy
biAwOw0KPiAgIH0NCj4gICANCj4gQEAgLTQ1Miw3ICs0NjYsNyBAQCBzdGF0aWMgc3RydWN0IGRy
bV9jcnRjX3N0YXRlICoNCj4gICBhdG1lbF9obGNkY19jcnRjX2R1cGxpY2F0ZV9zdGF0ZShzdHJ1
Y3QgZHJtX2NydGMgKmNydGMpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgYXRtZWxfaGxjZGNfY3J0Y19z
dGF0ZSAqc3RhdGUsICpjdXI7DQo+IC0NCj4gKwlzdHJ1Y3QgYXRtZWxfaGxjZGNfY3J0YyAqYyA9
IGRybV9jcnRjX3RvX2F0bWVsX2hsY2RjX2NydGMoY3J0Yyk7DQo+ICAgCWlmIChXQVJOX09OKCFj
cnRjLT5zdGF0ZSkpDQo+ICAgCQlyZXR1cm4gTlVMTDsNCj4gICANCj4gQEAgLTQ2Myw2ICs0Nzcs
OCBAQCBhdG1lbF9obGNkY19jcnRjX2R1cGxpY2F0ZV9zdGF0ZShzdHJ1Y3QgZHJtX2NydGMgKmNy
dGMpDQo+ICAgDQo+ICAgCWN1ciA9IGRybV9jcnRjX3N0YXRlX3RvX2F0bWVsX2hsY2RjX2NydGNf
c3RhdGUoY3J0Yy0+c3RhdGUpOw0KPiAgIAlzdGF0ZS0+b3V0cHV0X21vZGUgPSBjdXItPm91dHB1
dF9tb2RlOw0KPiArCWlmIChjLT5kYy0+ZGVzYy0+aXNfeGxjZGMpDQo+ICsJCXN0YXRlLT5kcGkg
PSBjdXItPmRwaTsNCj4gICANCj4gICAJcmV0dXJuICZzdGF0ZS0+YmFzZTsNCj4gICB9DQo=
