Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCFE5620C1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 19:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B067113F3D;
	Thu, 30 Jun 2022 17:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD62113EE5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 17:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1656608558; x=1688144558;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xNrB28RICp2Z2t5+/ekANsFdoKpgnGoTmVfZ/qzlIFs=;
 b=PxjgQCteVOSH0RTLRwa6jgKetA7p+tOCeMWmEd91pohq7wGRY8HbS725
 /ZxXaCrYm5mHjNjo8UE4kYsyufDKUdrWuusy9DfNQxxC1qT79Pys6yJlX
 dbevHf07/7z87lGh6TISA/eMmaVkfMiEq5OUfQ93gZgapnxc08Px5jYVN
 UnyFMmUptFZ1mPWC6R4LO5B/mn+rYm0jvIsaw2z10JeZKyrRIHkqmBmVa
 9GfMyWNJ2G713tpulSomgf/5KdSiD4gubvjPfSpf1A5yyB2/f0OWVMgEX
 jYXsI2j4iDVYVJvsPS5qoLrb/OhkNMRyo40CihC4SjGClHzyVeSmKMEiD Q==;
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; d="scan'208";a="102516870"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Jun 2022 10:02:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 10:02:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 30 Jun 2022 10:02:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QudkIMIqs2W39bXHgir7DhFsSFrjtzT6g1r1lruFFFQzkFoQikhiS67bg2K4ce/pBpFuWR++ZgQOz0sLlIXwyH2mW9R/F1oxwEGVkTKXiVRaEXJjTCwpUBooHUdOhNzCoGzo0iSy5RkumOU7cX8VnleW5TAAQRHp/TLDN6zsVTwsVaRJXfC6A1XBjBZOCS8dgtJGuPKbdV7hV26VY85Zopij5eA2pBV8htZ+9uEWOzbLZV+WRFSOYmZCmVQOm2qIaiMu70tWi+GKqpeHvbf7yN3ljAoEsUlEm2FV5qGFk6rPzAJodky/+71zO9AWi0kTgh0yXAxhMRfAtOdm2UzHew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNrB28RICp2Z2t5+/ekANsFdoKpgnGoTmVfZ/qzlIFs=;
 b=iLz0JU57rST0dmuiV10lJlr/kFid1fqYD5dxatj2W8x53D3vkob/JZHk7hOOcWGePeWzusus+Lq1VzuX3NfHAv4drVvMzj0g9ktvi8fLODMQhTeySA2h9e/V3xQJbX2HM1LKQQG2MfyKj1Zn/x5RZK+Og2Zp2Dgm+zDPmo3Pe1qauSAn7lPaiim90Om8yHw2y+aycaFmoUrmqGVATid14q64RUCrcgW1LgQqDu94B5wUJ6SPd2b/l7b/F/MvcUmD92nIQLlEB3rbjpinpEdI4uK7qQDxrkGA+YFudIxt6jQmQqeO2AINy1IFtVMJkqd08Bbh6MIj/wjMddV1OKPQ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNrB28RICp2Z2t5+/ekANsFdoKpgnGoTmVfZ/qzlIFs=;
 b=LEnISbamkbASX5HpoCaAGr13UDY4jSyLUZq/2AH2/ap5yxUOyarkktTWoawkcpyk628+yWp0YHBKz4eRbtpTiZ7O3k34O+UL5EIFp2LvpOW1OAYLclxMbPXZ/tVA6tpUBh1twpvy+RnzDBx5+vTv/xHTM6dCT25HAI12UvsL96g=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB5040.namprd11.prod.outlook.com (2603:10b6:a03:2d6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 17:02:24 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Thu, 30 Jun 2022
 17:02:24 +0000
From: <Conor.Dooley@microchip.com>
To: <Niklas.Cassel@wdc.com>
Subject: Re: [PATCH v3 13/15] riscv: dts: canaan: fix bus {ranges,reg} warnings
Thread-Topic: [PATCH v3 13/15] riscv: dts: canaan: fix bus {ranges,reg}
 warnings
Thread-Index: AQHYi+h3hoTHjH1NZU+cAhsP+cEeWa1oKv0AgAADh4A=
Date: Thu, 30 Jun 2022 17:02:24 +0000
Message-ID: <3fec7542-c5f9-8812-732a-d624b0506ca9@microchip.com>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-14-mail@conchuod.ie> <Yr3UKQ/772oFyvc6@x1-carbon>
In-Reply-To: <Yr3UKQ/772oFyvc6@x1-carbon>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab803a41-4411-49a7-0d8e-08da5aba4dfc
x-ms-traffictypediagnostic: SJ0PR11MB5040:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tm/nQrSR04eoTKd6k0l0nQWydS85h8G6L4tkdZ1Vsuqim/HQA7epZgXE4ljHqqZBSlrft8fp4owLczqHq2UxDIANvihJ1TImHIwe6XsmoaGkkMYnerOZYh+yAg6truN90NliK+A2TO4udqyC+hJsAow5zXY502SE+OZ1/eEP8gCUtFaLIKJYlwHB5ulN0I2eWw1FzxuUiu4w94SiiEPjs0tiSJBsy+8m+nX3P7vgK0EvCjsKZAzRfP5gp73j/fGOArUcLetuh6hPCClh9IW7bOrE2Qg8jqr0Uy725gO3wW5ocEmw0EsTuIPLhdv2jdXxFZlB4guWxHjxKD/MsJao9tC6hVjlLe66A9yVd+RhX+sy1de9OVQeKtUV71VT1xE1xi76KBSwsHsL/LENXYhPLKfQK2c0MboZiBdfqn5LeA77ar2kkrVc+3sH/rqnrtE4Sz7yebVzRHxXTdanQLvBQtKNtIDEQma5fopchQwv0H/ylV4iqpV9Ax4zph3LOCVzlcogK2FdNbe4LGL6Auhqwly66SttKELX3Yj7o0BZVetNeIhTlte0TV0uHasf5OxdMQsy/Hih+6azDlfJu0Pck/k04J1iru3EoGHmeZhXGy4xZseruvhJmUhRGJ3IQl9ldhTz8tFbW31156VKyu5oA0aNbuGzlj7ll8HDHq9f0LusEeecBg59X6sMwqOnrDdIQ/Pq/cseikf48/dXIKbhrGm5B6MdV+1UNGxlkc6upHSSudbmhP8775jQxQSGDoEyieoxWKvDZFJnAy2G6ZXvAU3DWnLwEWt1H0abfi1eodCYkWDYj5WDZQP/Ry47SBXeBZuvPkZjmV/xkByZloJ4KtgwCVQeLTGvZMdU17WhdeXN1bPNxpy4LgFCALO3f5CB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(376002)(366004)(136003)(39860400002)(5660300002)(38070700005)(6506007)(53546011)(83380400001)(86362001)(54906003)(122000001)(91956017)(316002)(66556008)(6916009)(66946007)(8936002)(66476007)(478600001)(31686004)(76116006)(36756003)(6512007)(31696002)(7406005)(6486002)(2906002)(8676002)(64756008)(38100700002)(2616005)(26005)(4326008)(41300700001)(186003)(7416002)(66446008)(71200400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WE5LRUNoeUhqczc5MWpHc21VbjVXMTFLT081QzJ1TWE4b1Y1c1VjV2xVZ09m?=
 =?utf-8?B?enFEUWE0dUxiaStMUkk1MUxtY0NRS3ZlRzBxZFc0QVEzeERpQjJUdHRjS25K?=
 =?utf-8?B?K2h0SUI4UmtVdVNURnlKT08zSjl4SlduUktBd0F6SGl1R3kzQzdQdnZOREhY?=
 =?utf-8?B?NTZucG1IeXY2dmR6Q2NyNTl1UkNtVlppZGZ4NzNtTXFqRW5kQzhBTmJLQnYr?=
 =?utf-8?B?MWNvTWhkNUpROHdtcDFCNW1BRElFdHVIc2l2K3JGdFk4eUFhdWtUSS8wMExq?=
 =?utf-8?B?T0JkQUh1d3BWNDdHQUhxQ3NUT3RZdHVRWjI3NkZvRGlubnAyMWdad0kyeEs3?=
 =?utf-8?B?TUlZQkhOMHdXMWF5VWc4ZWxyTitjbkovdjA1TjRXM1phbnF4U3JOSmVkUU9H?=
 =?utf-8?B?UDZVa1UyY3lLYk4xUzJMNmVpRDFJeGVEUGpvWjhhMmpIYitNbG9jLzV5Mkh2?=
 =?utf-8?B?SnNhcnR2RUN4WjVjSXpnQ2dQSUxRVTRrWFRpT2dhbVB3NXlTbkgxY2FQOVVL?=
 =?utf-8?B?am5GQVhPb1FpbDlXTnZJSmI3Q292cWZ6L3hPakovZks3VnpzVEVSbExOcU1m?=
 =?utf-8?B?U0FyOTBFQUwvbWlNUXNxbHdVN2FCT2JhSzI2Q25wS3dXZnJRZnorTGluVlNz?=
 =?utf-8?B?aGxSWWJCNEtyTWdOQjZQTFFMY0VBQXBFRTJvN0dySkpGVlB3QStuV3V5TEFM?=
 =?utf-8?B?cDdOK1luTXJtNzFwOCtFTDhOTFFaUFZEVVhoTGtLd1Q5MEo3Z29lc1ptalJE?=
 =?utf-8?B?aGphSksweEhiWFNmOVM1R2xlL3ZGd0Z2QWEvempJQVIwcUVydlR1cEIrTmp4?=
 =?utf-8?B?bHlHMXBvd2N0SHpWMjBBS0VRSDNFcFhpdVZXSlRxL0pRb1lpbnlVVHJWN3lz?=
 =?utf-8?B?TWZQWkt6NDVSVnQ2TEVYcTZsUzQvT2dDdHNjNVQzbzlEZnFsTmc3NytITzF5?=
 =?utf-8?B?NFJveVkwUE5xajNGbUZtVWdnaXoxbjYrSkw2YjVZTmNsdUFXZytQbXF6T0tM?=
 =?utf-8?B?UzdHV2duTGV2eW9pb1pucStNQzdPQjg2b1lLUkF2TXF1ZzExYmdxQVgwWmxt?=
 =?utf-8?B?dmdWaW9LVlN5V0laU2lBL0tmT2hmbkJjc1AvbWhuZEI2bVh1dmRHQnJ1ck0x?=
 =?utf-8?B?L2hoNlI3SEFZTnorNE5ZS1dmaTQ5YlhvbmxqL3l5a3ptVTRkL1h0eStTZmRz?=
 =?utf-8?B?MlhEcnF5V1pRc1AreDFkWTIzaWRnd2c5bnh6d3dKYmpBTWVJMXhldEhQRnc3?=
 =?utf-8?B?QWxibWwzdE5uY3BuZmtFcUpMRHVTTEhUbEZJNlJFU3pUbU9iWU1aZnl3dThm?=
 =?utf-8?B?WG1Vd2REbkRZOHh0Wm85TVRVL21DVEo1eUdET1dKamlJWnFEY0swWG1VdVRN?=
 =?utf-8?B?d2pWcmVpUlJ1QjZqbW9MM05jZVlQenZEajlhd2lJcDNMTkJJckxKd3lqSUlN?=
 =?utf-8?B?anRhbnlZeGJsajRaZDh6cGY2NWRWc1dXM3Q3YS9XMFFJT1VmWmU1N05mc1hP?=
 =?utf-8?B?bVhkNW5vS2k2QWJaZGJrTWpzbUVYOUxacDRsTmZjUThyekVIbEJaVlJCN1U4?=
 =?utf-8?B?c0QrY2xsbFN6WmgwYlhLZ2l6dVpXeWt0c003YXR4cWVlQ3BjUXhtQ3gzZHFh?=
 =?utf-8?B?OEJ0TWgxaHNtU1ZTRW5ZRjhmTDRVSFJUWXQwQjUyMHJ5bEFiMW5HblhaWkp3?=
 =?utf-8?B?V0Rhb25GaUUwRndvSlVDOUluWEdmUU9rcEpwZW5wWFhsOFludU5MNXdCMXJV?=
 =?utf-8?B?UlNtTGtqWTNTNnpYNElYRW9NUW8rYWg4MkY2eFJWWEpNMlFZY3l6R1dBT2Ur?=
 =?utf-8?B?WVJCeFcyYkR5Y0dINGRpczd5dTlWWld0RE85Y0VMT2cyYmxld2xtaTJNQVoz?=
 =?utf-8?B?NlQvVkRnRCtSZ1VuTWJqeDRtRSsvaVM4WDFiTUYyZUVBTnhXTGFvbmRnRjU4?=
 =?utf-8?B?WEhvb3FxdjVrYnl0TVJacjJvamZVbjV5S1lkUTBsRmtsNDNyaHl0SjBFU2h0?=
 =?utf-8?B?aGZMbGZ5WTJURllyRmFIRW5saVpBYUJUajhzaHUyQ1FYYkhaUzJpYTBZU3pR?=
 =?utf-8?B?b0I0dUQ5bHFHbEkyYkZ6aEdIV0dQNXB6SlVDT3JjSDJ0Y2FaaTBPRlBiMzkr?=
 =?utf-8?B?a01veHhFVGs3eWYwYVYySTFRVUpTY0FjZWo5V0VlTUZuRzlwVVJjZzhrbUFp?=
 =?utf-8?B?UUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B091F2015A2D874E8F23D71B3B5ADE31@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab803a41-4411-49a7-0d8e-08da5aba4dfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 17:02:24.4971 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lr3cgq/GRRAk7eik52W2ynw40t7T5VfHuo8SjksXNTtSTPMb1OaC112jPwoykypwPhEmdYBOqX3fA2QpQqviQbp4mTM8s1FeZV7kT9Idw3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5040
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
 linux-kernel@vger.kernel.org, Conor.Dooley@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-riscv@lists.infradead.org, sam@ravnborg.org,
 damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, tglx@linutronix.de,
 dillon.minfei@gmail.com, lgirdwood@gmail.com, fancer.lancer@gmail.com,
 linux-spi@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 palmer@dabbelt.com, dmaengine@vger.kernel.org, masahiroy@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDMwLzA2LzIwMjIgMTc6NDksIE5pa2xhcyBDYXNzZWwgd3JvdGU6DQo+IE9uIFdlZCwg
SnVuIDI5LCAyMDIyIGF0IDA3OjQzOjQyUE0gKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToNCj4+
IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+Pg0KPj4g
VGhlIGsyMTAgZGV2aWNldHJlZXMgd2FybiBhYm91dCBtaXNzaW5nL2VtcHR5IHJlZyBhbmQvb3Ig
cmFuZ2VzDQo+PiBwcm9wZXJ0aWVzOg0KPj4gYXJjaC9yaXNjdi9ib290L2R0cy9jYW5hYW4vazIx
MC5kdHNpOjQwOC4yMi00NjAuNTogV2FybmluZyAodW5pdF9hZGRyZXNzX3ZzX3JlZyk6IC9zb2Mv
YnVzQDUyMDAwMDAwOiBub2RlIGhhcyBhIHVuaXQgbmFtZSwgYnV0IG5vIHJlZyBvciByYW5nZXMg
cHJvcGVydHkNCj4+IGFyY2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFuL2syMTAuZHRzaTozNTIuMjIt
NDA2LjU6IFdhcm5pbmcgKHNpbXBsZV9idXNfcmVnKTogL3NvYy9idXNANTA0MDAwMDA6IG1pc3Np
bmcgb3IgZW1wdHkgcmVnL3JhbmdlcyBwcm9wZXJ0eQ0KPj4NCj4+IEFkZCByZWcgYW5kIHJhbmdl
cyBwcm9wZXJ0aWVzIHRoYXQgbmFpdmVseSBjYXAgdGhlIGJ1c2VzIGFmdGVyIHRoZQ0KPj4gYWxs
b2NhdGlvbiBvZiB0aGVpciBsYXN0IGRldmljZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ29u
b3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gIGFyY2gv
cmlzY3YvYm9vdC9kdHMvY2FuYWFuL2syMTAuZHRzaSB8IDkgKysrKysrLS0tDQo+PiAgMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9jYW5hYW4vazIxMC5kdHNpIGIvYXJjaC9yaXNjdi9i
b290L2R0cy9jYW5hYW4vazIxMC5kdHNpDQo+PiBpbmRleCA5NDhkYzIzNWUzOWQuLjZhMzRkYzRm
M2U1MSAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFuL2syMTAuZHRz
aQ0KPj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9jYW5hYW4vazIxMC5kdHNpDQo+PiBAQCAt
MTYzLDcgKzE2Myw4IEBAIGFwYjA6IGJ1c0A1MDIwMDAwMCB7DQo+PiAgCQkJI2FkZHJlc3MtY2Vs
bHMgPSA8MT47DQo+PiAgCQkJI3NpemUtY2VsbHMgPSA8MT47DQo+PiAgCQkJY29tcGF0aWJsZSA9
ICJzaW1wbGUtcG0tYnVzIjsNCj4+IC0JCQlyYW5nZXM7DQo+PiArCQkJcmVncyA9IDwweDUwMjAw
MDAwIDB4MjAwMDAwPjsNCj4+ICsJCQlyYW5nZXMgPSA8MHg1MDIwMDAwMCAweDUwMjAwMDAwIDB4
MjAwMDAwPjsNCj4gDQo+IFRoaXMgbG9va3Mgd3JvbmcuDQo+IA0KPiBUaGUgcHJvcGVydHkgaXMg
Y2FsbGVkICJyZWciIG5vdCAicmVncyIuDQoNClllYWguLi4NCg0KPiANCj4gQW5kIEkgZG9uJ3Qg
dGhpbmsgdGhhdCB5b3Ugc2hvdWxkIHByb3ZpZGUgInJlZyIgYXQgYWxsLA0KPiBzaW1wbHkgc3Vw
cGx5aW5nICJyYW5nZXMiIHNob3VsZCBiZSBzdWZmaWNpZW50LCBubz8NCg0KSSBkb24ndCByZWNh
bGwgd2h5IEkgcHV0IHRoZSByZWdzIGluLCBJJ2xsIGRyb3AgaXQgaWYNCnBvc3NpYmxlICYgcmVz
cG9uZCBpZiBJIGNhbid0Lg0KSUlSQywgaXQgZGlkIGFjdHVhbGx5IGNvbXBsYWluLg0KDQo+IA0K
PiANCj4gS2luZCByZWdhcmRzLA0KPiBOaWtsYXMNCj4gDQo+PiAgCQkJY2xvY2tzID0gPCZzeXNj
bGsgSzIxMF9DTEtfQVBCMD47DQo+PiAgDQo+PiAgCQkJZ3BpbzE6IGdwaW9ANTAyMDAwMDAgew0K
Pj4gQEAgLTM4Miw3ICszODMsOCBAQCBhcGIxOiBidXNANTA0MDAwMDAgew0KPj4gIAkJCSNhZGRy
ZXNzLWNlbGxzID0gPDE+Ow0KPj4gIAkJCSNzaXplLWNlbGxzID0gPDE+Ow0KPj4gIAkJCWNvbXBh
dGlibGUgPSAic2ltcGxlLXBtLWJ1cyI7DQo+PiAtCQkJcmFuZ2VzOw0KPj4gKwkJCXJlZ3MgPSA8
MHg1MDQwMDAwMCAweDQwMTAwPjsNCj4+ICsJCQlyYW5nZXMgPSA8MHg1MDQwMDAwMCAweDUwNDAw
MDAwIDB4NDAxMDA+Ow0KPj4gIAkJCWNsb2NrcyA9IDwmc3lzY2xrIEsyMTBfQ0xLX0FQQjE+Ow0K
Pj4gIA0KPj4gIAkJCXdkdDA6IHdhdGNoZG9nQDUwNDAwMDAwIHsNCj4+IEBAIC00MzcsNyArNDM5
LDggQEAgYXBiMjogYnVzQDUyMDAwMDAwIHsNCj4+ICAJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsN
Cj4+ICAJCQkjc2l6ZS1jZWxscyA9IDwxPjsNCj4+ICAJCQljb21wYXRpYmxlID0gInNpbXBsZS1w
bS1idXMiOw0KPj4gLQkJCXJhbmdlczsNCj4+ICsJCQlyZWdzID0gPDB4NTIwMDAwMDAgMHgyMDAw
MjAwPjsNCj4+ICsJCQlyYW5nZXMgPSA8MHg1MjAwMDAwMCAweDUyMDAwMDAwIDB4MjAwMDIwMD47
DQo+PiAgCQkJY2xvY2tzID0gPCZzeXNjbGsgSzIxMF9DTEtfQVBCMj47DQo+PiAgDQo+PiAgCQkJ
c3BpMDogc3BpQDUyMDAwMDAwIHsNCj4+IC0tIA0KPj4gMi4zNi4xDQo=
