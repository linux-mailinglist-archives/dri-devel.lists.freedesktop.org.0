Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A92F47327CF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 08:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7D510E5A1;
	Fri, 16 Jun 2023 06:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA49A10E5A1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 06:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1686897893; x=1718433893;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=H+RRc0G3jNT93DKLjh1xvamHp9X2az0qUMH2dzCogFE=;
 b=IfAOjpgltaezGNzS/jRhmFDruzbDsx59daPcsgOmIwgydsYXSjFzw4X5
 76ha3HOBvUY1GWvpeSFxrvi8OCiGm7fPQXME/a44mUIyn59wFtECN/3sJ
 jWwivFkRb46/cb6LaYqxNRh2+Cdnwe3Vuw51zw0pbAJOLZtkSWH7cgPKK
 8ZBQVSIV8cPi18WiiMsoxKiiF2EjTYsMvr4zU5kJzaoga+8PlAktODr6v
 g7VTIVoj7xDMpn3fyOGmNTHXrFFneDlW+1AAZDBvLTSEfCsa86QHR7kcP
 oyIrZgkGstOkVnNBplHrRC+BAZBZruwnGHLw8Huh8mTb0crZBtAiAtdWj Q==;
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; d="scan'208";a="218196357"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Jun 2023 23:44:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 15 Jun 2023 23:44:50 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 15 Jun 2023 23:44:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOQzatPnFohZhKV1fJdFqJfUv/VtYoVOkCcnvkpdZFhdS7tHFmn+k3BbV1WqXG1FutRzun5ez6OPnvdCghkp6Fz0AINr58vNHoGuG+gUvp6gsPdPjioQEMU3kqQa/7XU+08QS/XL9q786Tnwyd7nRfWFtS7D8A6pspymWK31PVcJvW/Y3E9KsbuJJOgwsUIfnyd7ixT8wPOicAGa8Z0e3NlTwteaMXdEzlAx438kVSckFwlKNm6YeE8AOcN2UULh8NTRhnySHzGeWi7/uh1DYGd+dlcgKiiJmAGWSmGPrpu+9lwd6KCYzKycwre1yoVC5VXbEnes3j+OnUQ/18xgEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+RRc0G3jNT93DKLjh1xvamHp9X2az0qUMH2dzCogFE=;
 b=Z4Xr9nThbWP7bzC7bmw4HClUSH4zSG7VhERgEV5jJVamuoYbffgh9gBEgA70PM0ZOfnxXGWzD6tMKdsB90UglI+pBNx3yj1tcHtSVGzsU+sBCx4TKLKlxaIyiLzCMqKO0c03TnsEH0h3Znjb/m2EUTlaHQcy1pDUgT1Bioe0IXOCE7dRvN/wQolWmt9EcpG5UCzn9MH5OxhrO8zFG6StW3dDGR8lcwPCK2NS7Ke4Lwl3ZHqYgYfEjW/wdt7YwYGHkOnhbECKRdkcXP3xJw+7DU+Crso5Uo1PQC4M/ytr+yFQAq93cHMHK2EJniMb8S1G8YY0uuqj4/7pDHiTKhQWaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+RRc0G3jNT93DKLjh1xvamHp9X2az0qUMH2dzCogFE=;
 b=nHjo96f7TpJBL8hh30u2KyJIx4BliWE6j64DU/yRFud0ts3HBn+nkREFyKjJVnxHRiKqINI6jON9j2RX1peR8Y7lDh3t9gnvjr4VJD/QDsD4nMyyNK3j+qf7CQoNesQS4s9gpE/9Og5rzKRj9o6drxQJlehN0JtWZ8zZbbwGTHE=
Received: from IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19)
 by SA3PR11MB7612.namprd11.prod.outlook.com (2603:10b6:806:31b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 06:44:48 +0000
Received: from IA1PR11MB6193.namprd11.prod.outlook.com
 ([fe80::fae1:9490:ead6:1009]) by IA1PR11MB6193.namprd11.prod.outlook.com
 ([fe80::fae1:9490:ead6:1009%4]) with mapi id 15.20.6500.029; Fri, 16 Jun 2023
 06:44:48 +0000
From: <Manikandan.M@microchip.com>
To: <Nicolas.Ferre@microchip.com>, <conor@kernel.org>,
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/9] dt-bindings: mfd: Add bindings for SAM9X7 LCD
 controller
Thread-Topic: [PATCH 1/9] dt-bindings: mfd: Add bindings for SAM9X7 LCD
 controller
Thread-Index: AQHZncV3ordx/PO3iU6nscrl1YKhkq+JCwKAgAABLICAAVS0AIACn6iA
Date: Fri, 16 Jun 2023 06:44:48 +0000
Message-ID: <3a3f4463-981a-e8d8-8ec4-06f2abfa3b4d@microchip.com>
References: <20230613070426.467389-1-manikandan.m@microchip.com>
 <20230613070426.467389-2-manikandan.m@microchip.com>
 <a0b059d1-df4d-10ce-fb7c-7acea0a20793@linaro.org>
 <20230613-slider-coherent-d508d67afc91@spud>
 <423eef3c-54f0-5c88-9bc9-82c0198b6da6@microchip.com>
In-Reply-To: <423eef3c-54f0-5c88-9bc9-82c0198b6da6@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6193:EE_|SA3PR11MB7612:EE_
x-ms-office365-filtering-correlation-id: f5bbfdc0-3fea-415b-71ac-08db6e352de1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VpAlcQSgp7FXw58zwS31XNpSZ1m7CxzbuahBvX3uciHBe3vs0bDPQW5SqzMJ9pIw9R/Mxhb0uhVdbyDqi4Bodmr3f/jkkYJxfR/AKs62Fs7VGhjoXZur6Fgcj8vF8Ty16soHZjRel05nA/aOaXXzJ0LfCxj/ueBMmUsSWwmlqL1oVplL4d74sCrQKFxHsoTtsQTggST7lnw7qpq9B6rxhnC3MTZu6aiAHxri1+yhvmQN5iZEjiqBdCNctOxkZV3dop+sWb9ZsJ5aiyeImCUtsyfz/FYPvcqGRCWoH/MWg4pweo+CD2h+A23D3Fu6XHjh3EMf6yAmYKHsjQs7DUHH5gJ8I/UO2iL83r9wI1+V87YMoAYPBd3MCzn4lG4dVEolDb+0MyfMJkQkh3Laun4X9LGqSRvIT7xBO54OmyVTaq85cVwTZ2taOOAxmnz7MiVnXQbbaHgY7X+oYS+Oej6hiRkVDwZt7NtxEApMjs2bR7QxwTEsx/m1OmakOEEfb5UYm74LGcGv0CWJEPrcNr0T2pEg4NZKPsbVoD9vba80W0ntFYH5KVfzW48Ikbl9fqVtWXzz+C66DpXSuTiDelJBIyjyTPD88Xj0aFMl2zPSqEQd6NZsmt854WD84pTY6Gs7iAwqijIwvBP0qq82C83u1A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6193.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199021)(53546011)(6506007)(6512007)(107886003)(26005)(36756003)(478600001)(186003)(966005)(71200400001)(6486002)(2906002)(316002)(41300700001)(38070700005)(86362001)(31696002)(5660300002)(31686004)(122000001)(8676002)(8936002)(7416002)(38100700002)(110136005)(54906003)(2616005)(66446008)(66476007)(66946007)(4326008)(66556008)(64756008)(76116006)(91956017)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3BPSGt5a25tMUw4RFhjREFzTHdZR09yNlNZbmZUUEtQTnV3SVJyalFkL0Nn?=
 =?utf-8?B?OThoVEwyT2lyTGFmUjRYK3FhSmc0c2REVFZhbERJRittdlprYVlaWE93Rm1v?=
 =?utf-8?B?WXhaRklxb0sxY1RaMDFyWW10c1JJUDBPNzdyVGtidU1oYnpTZGpkQzJEdjUz?=
 =?utf-8?B?KzVmd2VoTE1SQ1BNZE1rVmR5NHlCVUxuZ1pSNkVOa0t5QTRzRk9UR016RUhw?=
 =?utf-8?B?Q3dZeE5OK1EyUklVaE9hRldhNklzNU51enNsSC9kSW5FRDdMWHpySGVYanFV?=
 =?utf-8?B?MXlVVFVXaC9IYzFQRG5DRWF5OVFjMDdBOTZMZ2U3UFJCYjFkNXZpb0FNSXEy?=
 =?utf-8?B?ZUozQkZGKzJQNjZuZnE2U1pieFVGc0lCMjYwNGt5c09lRXkxcy9qVzlkQzdZ?=
 =?utf-8?B?c2FMU0FyZ0hjR0hZUHhwbmxKbGpOak9XYlczbEpETThyU2V6R3hWaU00WUg0?=
 =?utf-8?B?V2YrcnovNkNZK3I1R1hmRFN3MUhHZW14TjFNWW5iamJ5eU5DVFlMNHNaVVY0?=
 =?utf-8?B?Z3JITzdhZzViZHJoekh3bWFqL0duV3lhZE9qRG0zbnhLcytrUjgwOFFmZ2Jw?=
 =?utf-8?B?Q0xrbHVvYkxkbDJ5RmNNODIvemN2eTJOdDBJR29pUnBtbUMvcThxSmNIa0lY?=
 =?utf-8?B?dXBVRzRBd1dvN2E5YloxakRRRURaQy9ldmZUVjJIdSsrSUFxTVpDTEVqNU9U?=
 =?utf-8?B?MjRkQjdpVjdUSnNyRG9SVkc1TW5LUlloNjdDT1o3OXFHNVAvYTZKNHBDTThQ?=
 =?utf-8?B?Rkw2ZTdqbVhZcVFmVW9KSFJvSTFOVTIyWlZzRUc5OCtBZ2FMVlRrU1ZCZ3dn?=
 =?utf-8?B?alJNVHhYRFNVTXhWbHYrUFl5T1BiMFY4WjNaeTJTSHF5SjFYbWx3VDRBcHlB?=
 =?utf-8?B?eWJyQXVwQ0hTeU9ycmFvZjBpUnpHMW9ndlJMNmdOQ29nZVBMUklCOTNDWC9M?=
 =?utf-8?B?WmV5SWdRanc0TnRHMkxteG52N1hoZFo3UDR2ZGh2czFyREpIaXFqVjJDMHp0?=
 =?utf-8?B?RmJFNUdKb0txekdWakVCNHAzQUtMbk04RTVoWVB1YXc1U3Q0RkNUU1dBaFd2?=
 =?utf-8?B?eUZ5NlVSQzQzbjk3MjJxVWJKK0liTlgvaDBpWEdENE14aVFWYUU4aHJLdWNq?=
 =?utf-8?B?bDNKNjVIeGk0MkR6ZVVaNWRXN3cvZ1Z4YXAvUlQ1ODFncGdJYkRQVmVlVDFZ?=
 =?utf-8?B?THFyOGpnRUI5cmhRTkZxbUY2M3JNcS85TFVLaVNKL29BNDh4TlZ6QXpLeG5U?=
 =?utf-8?B?MVVCR25SQkgyVk1reXZybUY4OWJWdnlCYmRENTBNdUxuQTduRXFDVlVRcE1z?=
 =?utf-8?B?VXlwZzZSWkVacklTOFh5NTY5TkFmdDVxTWpKVGJnU0NRb2MyeURxRll5Nm1q?=
 =?utf-8?B?ODUrZUxDeGxKbVlwQlcyZGprVzc2WU9YREg0L2hBTHFNaHpDVC9UU2dOaXZE?=
 =?utf-8?B?RkNqUjh2UEZNbHVMdTlCaVNhL2ZCY01CcGFGWWJQakJjakUwQ2tuTnZrTlVE?=
 =?utf-8?B?Z1VyVFc4czZ1ZmVOMDlPelpnZU0xMW9FL2VhM081bXBZSCtRQ2MwaldiRGVS?=
 =?utf-8?B?UzdLZFJWT1ZPcWFJczV4V21wbDhTdjdadHhPNktSZWh3RWpyS0RZRzhrSXdJ?=
 =?utf-8?B?alZmZmVwbTd4MldRbUFhS3FLeFp4RUNDRFBzajYzbkt0eWhpbDh5M2VRYWxt?=
 =?utf-8?B?WGZkREtsa01ZSFcvVFhZU2x4TTBOVll1QTRGdGF5WFhjUmhxSTlHcmxGYVVE?=
 =?utf-8?B?RFZTb0dIZ2lpT25XUVAzQzUwaTdCZ2dHaDFSLzFZTExKd2NheDNNbmkrblF3?=
 =?utf-8?B?bjY3SFk5ZTNVVlI0QXoyVzVOQnlDRmRveE9YTjIvY2lQQjZFOVBBQWFRNjVS?=
 =?utf-8?B?TlV1NDlBc2JaaTNuM3pzSlJ2eFl0V2R3d3JMZHBmTWNnbVZtT3hjcjRzRGIr?=
 =?utf-8?B?UjFEUU9EME4wM2lnemx4VmN0eTk3NWEvRkNSeU1hQzlsZnlwekhWTklSWmov?=
 =?utf-8?B?WEhuRVlxbnpEL1g3UnByb1pwRjB6RHRDUHNHa1RHNW9CcG9xdEozekVFblFW?=
 =?utf-8?B?WDg0YkRYVVNlMG9IVGNqazM1c3lXQllabld0bWJreDhyWUFZUG9rUHVZR3U1?=
 =?utf-8?Q?FI2TbU0LeSX7q7ZDMBk4Hq6U8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BDC663A87827C4B85A54F427ABE96CE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6193.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5bbfdc0-3fea-415b-71ac-08db6e352de1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2023 06:44:48.5095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: whK3V/YVvEy35r4chsiWq8yhXme0CoN2tSaguOT42e/b0WVyPF9LVcyFD2uRe51UyN7kbzwlgYK/XAhjM+vw6CzizIIaiVvLjFr385P4HL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7612
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
Cc: Nayabbasha.Sayed@microchip.com, devicetree@vger.kernel.org,
 alexandre.belloni@bootlin.com, bbrezillon@kernel.org,
 Balamanikandan.Gunasundar@microchip.com, lee@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Varshini.Rajendran@microchip.com, Dharma.B@microchip.com, robh+dt@kernel.org,
 Durai.ManickamKR@microchip.com, krzysztof.kozlowski+dt@linaro.org,
 Hari.PrasathGE@microchip.com, Balakrishnan.S@microchip.com, sam@ravnborg.org,
 Claudiu.Beznea@microchip.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQvMDYvMjMgMjA6MTAsIE5pY29sYXMgRmVycmUgd3JvdGU6DQo+IE9uIDEzLzA2LzIwMjMg
YXQgMjA6MjEsIENvbm9yIERvb2xleSB3cm90ZToNCj4+IE9uIFR1ZSwgSnVuIDEzLCAyMDIzIGF0
IDA4OjE3OjEzUE0gKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+Pj4gT24gMTMv
MDYvMjAyMyAwOTowNCwgTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gd3JvdGU6DQo+Pj4+IEFkZCBu
ZXcgY29tcGF0aWJsZSBzdHJpbmcgZm9yIHRoZSBYTENEIGNvbnRyb2xsZXIgb24gU0FNOVg3IFNv
Qy4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogTWFuaWthbmRhbiBNdXJhbGlkaGFyYW48bWFu
aWthbmRhbi5tQG1pY3JvY2hpcC5jb20+DQo+Pj4+IC0tLQ0KPj4+PiDCoCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2F0bWVsLWhsY2RjLnR4dCB8IDEgKw0KPj4+PiDCoCAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvYXRtZWwtaGxjZGMudHh0IA0KPj4+
PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvYXRtZWwtaGxjZGMudHh0
DQo+Pj4+IGluZGV4IDVmODg4MGNjNzU3ZS4uN2M3N2I2YmY0YWRiIDEwMDY0NA0KPj4+PiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2F0bWVsLWhsY2RjLnR4dA0K
Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2F0bWVsLWhs
Y2RjLnR4dA0KPj4+PiBAQCAtOCw2ICs4LDcgQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCj4+Pj4g
wqDCoMKgwqAgImF0bWVsLHNhbWE1ZDMtaGxjZGMiDQo+Pj4+IMKgwqDCoMKgICJhdG1lbCxzYW1h
NWQ0LWhsY2RjIg0KPj4+PiDCoMKgwqDCoCAibWljcm9jaGlwLHNhbTl4NjAtaGxjZGMiDQo+Pj4+
ICvCoMKgICJtaWNyb2NoaXAsc2FtOXg3LXhsY2RjIg0KPj4+IEdvb2dsZSBzYXlzIHNhbTl4NyBp
cyBhIHNlcmllcywgbm90IGEgU29DLiBQbGVhc2UgYWRkIGNvbXBhdGlibGVzIGZvcg0KPj4+IHNw
ZWNpZmljIFNvQ3MsIG5vdCBmb3Igc2VyaWVzLg0KPj4gV2UgaGFkIHRoaXMgb25lIGEgZmV3IHdl
ZWtzIGFnbywgc2VlDQo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvYWRkNWU0OWUtODQx
Ni1iYTlmLTgxOWEtZGE5NDQ5MzhjMDVmQG1pY3JvY2hpcC5jb20vDQo+PiBhbmQgaXRzIHBhcmVu
dHMuIE91dGNvbWUgb2YgdGhhdCBzZWVtZWQgdG8gYmUgdGhhdCB1c2luZyAic2FtOXg3IiB3YXMg
DQo+PiBmaW5lLg0KPiANCj4gQW5kIGl0J3Mgd2hlcmUgaXQgYmVnaW5zIHRvIGJlIGZ1bm55LCBh
cyB0aGUgTENEIGlzIHByZWNpc2VseSBvbmUgYXNwZWN0IA0KPiB3aGVyZSB3ZSBkaWZmZXJlbnRp
YXRlIGJldHdlZW4gc2FtOXg3NSwgc2FtOXg3MiBhbmQgc2FtOXg3MC4uLg0KPiBTbyBwbGVhc2Ug
TWFuaWthbmRhbiBzb3J0IHRoaXMgb3V0IGlmIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGVzZSBjaGlw
cyANCj4gd2lsbCBiZSBiZXR0ZXIgaGFuZGxlZCB3aXRoIGRpZmZlcmVudCBjb21wYXRpYmlsaXR5
IHN0cmluZywgaW4gDQo+IHBhcnRpY3VsYXIgYWJvdXQgLy8sIExWRFMgYW5kIE1JUEktRFNJIHZh
cmlhbnRzIQ0KWWVzIFN1cmUsIEkgd2lsbCByZXBsYWNlIHRoZSBjb21wYXRpYmxlIGFzIHMvc2Ft
OXg3L3NhbTl4NzUvZyB0byBoYW5kbGUgDQp0aGUgZGlmZmVyZW50IHZhcmlhbnRzIG9mIHNhbTl4
NyBiZXR0ZXIuDQo+IA0KPiBSZWdhcmRzLA0KPiAgwqAgTmljb2xhcw0KPiANCg0KLS0gDQpUaGFu
a3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFuIE0uDQoNCg==
