Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1BF562206
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 20:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8A412A78B;
	Thu, 30 Jun 2022 18:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FEF11BEF6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 18:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1656613818; x=1688149818;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9NbNdS8e+KcugwdL2X7zeBFj3ef4QGXKQb+5QRO88BE=;
 b=M4afjM/7vMAIq39oPDN6Nuxz3RkbZDPlC+tFfNINEeuNvLlynEEpgbHd
 oxZRp4PdMh9FBfGrrRCsCgz9hNVL8+xChxDyMD7N3iIcMEFw+3HqtZ3H9
 WoZZ6/Lk5bfO8Tx3paPhqtLI0XJKC31p4s6EKu9+u6xqlaRJwo95oNNMe
 SF1Bm6lNJAyzTQoZ9iP0HOIRYJTlcfdpLKaC/s76hKUODIdXCpDjb1nZv
 S01oYzSTjxbFpO78ZIFsVhbfHGnEvj/DM7i6e854Ljgu5hWeyWe/ymI/G
 7UkgXQc+CL5+1Mdo1Ij5CMIR+KR7/gvj62h3l4p8pL4xtaPWydjrPolF6 Q==;
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; d="scan'208";a="165884828"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Jun 2022 11:30:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 11:30:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 30 Jun 2022 11:30:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7L1l5lRh/vDfEKIBLs7oouLfghKC1Zzl0fCIIKs2vSVlhNEcEhNtIw8DPoQKzgHGHY/aFz/FGrZIonIhAtSY67MiBvtb1B3sSyy6uZhkwp2uClM+lOkq7PP0ocl7WPpZbL8GxzL216w6ArjUMmE7AKczs0wEJA2QUsyPsYGgCNeMnef5xzcjGDNoU9gDTjUBqOoRtZaBA523JQXUQdb3YGcEqKVB5fRgemq2i0UsHI+Fefhhd3wfRmgNWGh2MwP8Yc0JckLjgZkunYrvYavzi3Ksnw0nXsoHJ/WAeSYLwTjTvzZxTQGWTwA/6t2PwS0O85s/1Xli5DwKsDx72fMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NbNdS8e+KcugwdL2X7zeBFj3ef4QGXKQb+5QRO88BE=;
 b=ZotRLJYe5WLTnNux2QMFHXNUo90l00qP3MSNBzPO2QTHW/odTkrcBdVQzdNbTfD8+41yqAv/QGCwqn+yYQtWsGwsnEgRYQZuauYcZjp2Rw289GX8Y9iWhzrHfSfKRII8ItVVsby4HKK3sBJaRjJ5FvtmCOX4yKycwUAcJEsSLWVLNmoAjrEqAR8csP3OjkHPJw3aRUnKIjx6gJeYuux69zmLgasnmu6nemJNwa/SJIGED1YeYSRsNuerJ/ux/K+EORTQvINmcT5iUZrKNmh4N+ByzLZeUJGu6TmBh3yGscBtoZnxYmAB/Ry1oO2qQZQI3xgOt047X0Mq9R2c1wCzMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NbNdS8e+KcugwdL2X7zeBFj3ef4QGXKQb+5QRO88BE=;
 b=HU1GEVjbyqWr8SBixJz6clOUxFjLJufU2kUOXqw8OK0ZSAhYLL5mNyxpN2Kj14/KUlRYUJIT88fniAT9EluO/RKVm0WtZqH0vz0/Hx2wnEYYUUqJH++oathGGlYPjrkAhf/fnZjKKMppKhBr3V166opqbxSvxWFVned6foNAZnk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN0PR11MB5712.namprd11.prod.outlook.com (2603:10b6:408:160::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 18:30:07 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Thu, 30 Jun 2022
 18:30:07 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <Conor.Dooley@microchip.com>
Subject: Re: [PATCH v3 00/15] Canaan devicetree fixes
Thread-Topic: [PATCH v3 00/15] Canaan devicetree fixes
Thread-Index: AQHYi+hg2HI7nJ4gGEWADL44nKFD2q1oJQgAgAAXtgCAAAIwAIAABacAgAACcQA=
Date: Thu, 30 Jun 2022 18:30:07 +0000
Message-ID: <99425a7b-ba31-c03f-e819-35860a1f0f9e@microchip.com>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <Yr3PKR0Uj1bE5Y6O@x1-carbon> <20220630175318.g2zmu6ek7l5iakve@bogus>
 <d0634053-d882-fcb5-fd56-32dfbcf4d5ba@microchip.com>
 <20220630182122.j7m32mh3xmxwatga@bogus>
In-Reply-To: <20220630182122.j7m32mh3xmxwatga@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 833e5b89-bef8-4b8d-7fcb-08da5ac68ee4
x-ms-traffictypediagnostic: BN0PR11MB5712:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q4qseTUh/AYy82twPQYIC8bRK562Yt04Zr1q17oorNU8ZqAcW9yjVj0oIcBjLOHpjnivKoO+tsGMPi6HfGUjtbWhqtJxXB8rP2NmP4EqlFJ86yeqvxHQJpIlhjhQ39ryR9raIVXCLmyZXJbXmvCk3KXQ+VhMIOl2n+0lAB2UtJBv60NcZVP7BKfbV8D6SB58PZo3zjmZKeS1tBFxwtZ15p/4UhmLAErOOcfifDlwCZJoaxMSj5VbVNxdQ9PW1vl9jOzgMv/aPDo0yDCKn702KaTnjdsHExvQx594fmv4EmU983oi+jjOfl2rRyDx1ZMC2Yhp3f/fWaZkP8MVzMKwq7T8hboN2K9moArIh9r+Fv2pLRqS1T0+yLvzD5JYVe9tQbNpEFTh2vOAOvBFf5HSfbURNMLd3dqFP/uQ36PjcH7bjFczIbxY4X8jrNAnXr8+GkaOPns3tqSG2yAKzVpcljkVBtUGHAh+eJ6He2BuCeD97DsCvzOuzuw/n7YsMLHlyeBtCyw9Z8vo6JvsAEyqjJrFvQmab5GiI7psPZLCrHeXM0IAMEhla59+OIs+s0k8IO5yZtRETBbehL/QuXLWrcTrharCIZ4ZWMWZsCvNEMQmFdarieRWHmx9CuFYS/iBBJ1Rq0lWhviFONReGN8DFwOuvoL65ZTburpx4RI19uE03p1BqBRp7bZWr1hC85qpJTbJBLE+1Sj5oFe9ubUoEHEONbaZ8h9opXztSn7vmy1Nrj9Jy75tA491Lu3Bh4qt974pSUh345pyB1HPtwP4wFo9T5aZbELPIfxtIJ5iO8PIOhzzvlfYpwxZCXL8y4nWLKG9dxYN7csGCTAxYwqMMumjJV+EDhy7HhvVSPRRET65qVIWf8kvyLZ6XDN0cPTE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(376002)(396003)(366004)(346002)(66446008)(66946007)(7416002)(7406005)(4326008)(5660300002)(66476007)(66556008)(8936002)(64756008)(8676002)(26005)(2906002)(76116006)(31696002)(86362001)(38070700005)(38100700002)(83380400001)(6486002)(71200400001)(478600001)(186003)(54906003)(110136005)(41300700001)(316002)(6512007)(122000001)(91956017)(53546011)(2616005)(6506007)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnhkcDNCSVNnUkhYYlRjR29GVjI2ZGVlbTRrajlSSG1zOHhPT1RaWTNicktN?=
 =?utf-8?B?L1orQk4xOEZzQUVxZXB3VFl0WUtlZmtJUHJ3NGJ3cXNRekgxcllvQkkyb0hF?=
 =?utf-8?B?WFFVcHdJallGb2hZN0xrYWpjTnVCKzlqcFRlVFNRaHlkT1Q1VVRENDJ5Ymc3?=
 =?utf-8?B?MktWMVlkbmhPR2l0eGo4QlFKUkIyWE8rYXVSb0FSOE9xMTEwR1VDbXQ1OWJo?=
 =?utf-8?B?Z1psY2wvMGpyOFhqZkVYVzZyWWVRclF6eUFDaFdkdkdaYkE1MTJ3c2dVVTRo?=
 =?utf-8?B?QW9jcVorZWNCZTU0cWNQZTMxaDQrN0M3WlBzdFNRemg5OHp1ZWhWdW9ncklP?=
 =?utf-8?B?bWpMZ25YNnpmbDJrWDA2M2RmdSs4UHM0bFQ0eTFadmhvNnJNcnEvUHl0WEtD?=
 =?utf-8?B?b2syblF3TkFIa3ovWTVaeGRRUlovOGpJTmFwYllhSjF5Q3pHblBKSjdlWFZ2?=
 =?utf-8?B?VktFbmMyZDlDQmQ3eXV4b24wL2hzUTUzYkdLTGxlZ2hwSlF5eE9naGJOSE1V?=
 =?utf-8?B?S2JPRDNWSEpvU1ZRMU81UUwrOENaRGtXV0pTeEFpKzR6R1gvTzQ5SUU0c29M?=
 =?utf-8?B?ejhLa25BalB2T1kzcU41eEZFck91amp2Q3VzbnRuZkltdjRoQmdNVUFLUnpC?=
 =?utf-8?B?OWF1Ykp6T2ltRU5CNkJwaXI1WkhQeTlIMytheURYeUxtZ0NGc0x0d3BYbTAv?=
 =?utf-8?B?NUVlVURQZk1zQ3U1RnhZL0pDbTVZSXRQN0kzS0cxc2hWWCtEcUVZN3pyL3dH?=
 =?utf-8?B?dmh1K1c5WFZrK1JQQTZlQWlnSkZsdmVJWUNST1drVk9xN2JIcVplSHZ3RWRB?=
 =?utf-8?B?b1VJOWZ1WVpOdGVldkVQemszZi9JRE5tZFBKOU5VZkk0dzJablZ6RVBScyto?=
 =?utf-8?B?dHFVNFpCOFZVQldhNVlXZlRmeE1VMEk2S3I3azllYXBJMnRKQmpVME55K0Fw?=
 =?utf-8?B?R296Z3NkdUprcUxGaVhJS1BkaG90ellkYjVzdE1Jb2VCMWo2UjA1VUZpZkQ4?=
 =?utf-8?B?OTJmVXNrYVpUaFR2TGoySTl1MTU0ang1NitqWU9vbnMzZ3hlM0ozTjJOWloz?=
 =?utf-8?B?dTZNVlp0TWxmSEtTOVo5c3ZlekN1cG1HTkx4LzNjeTNIb2YvdEE5aEk0b3hD?=
 =?utf-8?B?YWRIamM5aFRDQWFuMDFkMWdZSTRxeU1MS2NHOTZVUVl4WTFhN041cWQzZ1Y2?=
 =?utf-8?B?VlZWbnc5QVZYeWdKOEo5ZmVvYm5USEZaT1JKZXZmQzMzc3IrVm5YWG82UXNz?=
 =?utf-8?B?dVhja01XZWVQeGNQeWdZOW9wOFo1Y1lNTFF3a0JtbjNTRWxDbDROZUt5SmY5?=
 =?utf-8?B?QlQyM3UxWkFnYzFHUUZxZVJ4YzFpeThNZ2xBNDRDMXU1TkM1aVdSRnUxVWYz?=
 =?utf-8?B?RFpLajdJclVyUmJRNG9WUzBpYmpaWlB4SS9nUkpqMHF2c3J0SXZtdWpmbVZS?=
 =?utf-8?B?V1E3cUY4aHZUU2xwR3R3RUZRalVIVlU5MENYb0l5MnRxaDZETWhHUlFRdUhT?=
 =?utf-8?B?S3VUZktqdlo3dC9XenlNdzNrRWVaZjBKMFJWdWV5cSs3THZaR3RTdEZvcXpM?=
 =?utf-8?B?OU5GU3lRYzZOT2x0ZnpZS0h2dTAva1pyYkVYck1aS1BoSVFGVFZjeTVLOHEr?=
 =?utf-8?B?SWJ1TkpxY2tSUWZoeXo4Vmxhc2dxdm9qb3k2eHBGa0VmaDBJdXduU0lLblR2?=
 =?utf-8?B?TWcvS0wzNVJybmc4TlBzaytpb3hIL0g1Q1MybFYvSTZ0OGdaTlV2MC8zSk16?=
 =?utf-8?B?bDZWM2ZtZUNEMmtvbnh2N1ZlUk56ZmZoL3BENy9xZW1rUmpDWDhHbWwrYzhG?=
 =?utf-8?B?MzRkZ2l4NElxc2QreEd6L3BKNEtNcmhTeWYrWk1nSW1QdXNPUFZuOFQzYjFG?=
 =?utf-8?B?UEpCVEhIcjJ0NU93RmxWSGRWUjdLZHY2N1pPWjlDQ0RnMnlZZGgwcEIza1E3?=
 =?utf-8?B?WUlwVkNYb2ZxcUNja2d2MXh5Q0xJY0x0bEJRMWV0ZlZpNCtwOFR5M2RYS2lx?=
 =?utf-8?B?Nm1QVGJCL3ZtVDVaaHA5OGF2cFlFaU9EcFptZ0VxZjdiQXA3M0RndzJaQkVD?=
 =?utf-8?B?bkh4Nkh2Vy9ZbXd0VWxBYmt0b2krMlMrSUFUTllIVFZIdHYwT0NxNWNkRlJ5?=
 =?utf-8?B?RFVaaTk1WE8zZi9vQVJISm1jNjNEakg2RWljd20xR1ZWZEZ5YjdZWWV0MGJH?=
 =?utf-8?B?VVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <381021914F19C343AB300E3326982C66@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 833e5b89-bef8-4b8d-7fcb-08da5ac68ee4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 18:30:07.3085 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tt4/XtKDFsBdc1in/eBiMe+FkwV7kEiP/M+P0vPqiaZrppZwsZisFel7HfTF5nn/+Arow3paVoIHSEMZ11PnCHRxnUwhP28HuiJJny0Wcuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5712
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
Cc: Niklas.Cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
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

DQoNCk9uIDMwLzA2LzIwMjIgMTk6MjEsIFN1ZGVlcCBIb2xsYSB3cm90ZToNCj4gT24gVGh1LCBK
dW4gMzAsIDIwMjIgYXQgMDY6MDE6MDlQTSArMDAwMCwgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5j
b20gd3JvdGU6DQo+PiBPbiAzMC8wNi8yMDIyIDE4OjUzLCBTdWRlZXAgSG9sbGEgd3JvdGU6DQo+
Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+Pj4NCj4+PiBPbiBUaHUsIEp1
biAzMCwgMjAyMiBhdCAwNDoyODoyNlBNICswMDAwLCBOaWtsYXMgQ2Fzc2VsIHdyb3RlOg0KPj4+
PiBPbiBXZWQsIEp1biAyOSwgMjAyMiBhdCAwNzo0MzoyOVBNICswMTAwLCBDb25vciBEb29sZXkg
d3JvdGU6DQo+Pj4+PiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAu
Y29tPg0KPj4+Pj4NCj4+Pj4+IEhleSBhbGwsDQo+Pj4+PiBUaGlzIHNlcmllcyBzaG91bGQgcmlk
IHVzIG9mIGR0YnNfY2hlY2sgZXJyb3JzIGZvciB0aGUgUklTQy1WIENhbmFhbiBrMjEwDQo+Pj4+
PiBiYXNlZCBib2FyZHMuIFRvIG1ha2Uga2VlcGluZyBpdCB0aGF0IHdheSBhIGxpdHRsZSBlYXNp
ZXIsIEkgY2hhbmdlZCB0aGUNCj4+Pj4+IENhbmFhbiBkZXZpY2V0cmVlIE1ha2VmaWxlIHNvIHRo
YXQgaXQgd291bGQgYnVpbGQgYWxsIG9mIHRoZSBkZXZpY2V0cmVlcw0KPj4+Pj4gaW4gdGhlIGRp
cmVjdG9yeSBpZiBTT0NfQ0FOQUFOLg0KPj4+Pj4NCj4+Pj4+IEkgKkRPIE5PVCogaGF2ZSBhbnkg
Q2FuYWFuIGhhcmR3YXJlIHNvIEkgaGF2ZSBub3QgdGVzdGVkIGFueSBvZiB0aGlzIGluDQo+Pj4+
PiBhY3Rpb24uIFNpbmNlIEkgc2VudCB2MSwgSSB0cmllZCB0byBidXkgc29tZSBzaW5jZSBpdCdz
IGNoZWFwIC0gYnV0IGNvdWxkDQo+Pj4+PiBvdXQgb2YgdGhlIGxpbWl0ZWQgc3RvY2tpc3RzIG5v
bmUgc2VlbWVkIHRvIHdhbnQgdG8gZGVsaXZlciB0byBJcmVsYW5kIDooDQo+Pj4+PiBJIGJhc2Vk
IHRoZSBzZXJpZXMgb24gbmV4dC0yMDIyMDYxNy4NCj4+Pj4+DQo+Pj4+DQo+Pj4+IEkgZmlyc3Qg
dHJpZWQgdG8gYXBwbHkgeW91ciBzZXJpZXMgb24gdG9wIG9mIG5leHQtMjAyMjA2MzAsDQo+Pj4+
IGJ1dCB3YXMgZ3JlZXRlZCBieSBhIGJ1bmNoIG9mIGRpZmZlcmVudCB3YXJuaW5ncyBvbiBib290
LA0KPj4+PiBpbmNsdWRpbmcgZW5kbGVzcyBSQ1Ugc3RhbGwgd2FybmluZ3MuDQo+Pj4+IEhvd2V2
ZXIsIGV2ZW4gd2hlbiBib290aW5nIG5leHQtMjAyMjA2MzAgd2l0aG91dCB5b3VyIHBhdGNoZXMs
DQo+Pj4+IEkgZ290IHRoZSBzYW1lIHdhcm5pbmdzIGFuZCBSQ1Ugc3RhbGwuDQo+Pj4+DQo+Pj4N
Cj4+PiBJcyBpdCBwb3NzaWJsZSB0byBzaGFyZSB0aGUgYm9vdCBsb2dzIHBsZWFzZSA/DQo+Pj4g
Q29ub3IgaXMgaGF2aW5nIGlzc3VlcyB3aXRoIG15IGFyY2hfdG9wb2xvZ3kvY2FjaGVpbmZvIHVw
ZGF0ZXMgaW4gLW5leHQuDQo+Pj4gSSB3b3VsZCBsaWtlIHRvIGtub3cgaWYgeW91ciBpc3N1ZSBp
cyByZWxhdGVkIHRvIHRoYXQgb3Igbm90ID8NCj4+Pg0KPj4+PiBTbyBJIHRlc3RlZCB5b3VyIHNl
cmllcyBvbiB0b3Agb2YgdjUuMTktcmM0ICsNCj4+Pj4gY29tbWl0IDAzOTdkNTBmNGNhZCAoInNw
aTogZHQtYmluZGluZ3M6IE1vdmUgJ3J4LXNhbXBsZS1kZWxheS1ucycgdG8NCj4+Pj4gc3BpLXBl
cmlwaGVyYWwtcHJvcHMueWFtbCIpIGNoZXJyeS1waWNrZWQsDQo+Pj4+IChpbiBvcmRlciB0byBh
dm9pZCBjb25mbGljdHMgd2hlbiBhcHBseWluZyB5b3VyIHNlcmllcywpDQo+Pj4+IGFuZCB0aGUg
Ym9hcmQgd2FzIHdvcmtpbmcgYXMgaW50ZW5kZWQsIG5vIHdhcm5pbmdzIG9yIFJDVSBzdGFsbHMu
DQo+Pj4+DQo+Pj4NCj4+PiBJZiBwb3NzaWJsZSBjYW4geW91IGdpdmUgdGhpcyBicmFuY2hbMV0g
YSB0cnkgd2hlcmUgbXkgY2hhbmdlcyBhcmUgYW5kIGRvZXNuJ3QNCj4+PiBoYXZlIGFueSBvdGhl
ciBjaGFuZ2VzIGZyb20gLW5leHQuIFNvcnJ5IHRvIGJvdGhlciB5b3UuDQo+Pj4NCj4+PiBDb25v
ciBzZWVtIHRvIGhhdmUgaXNzdWUgd2l0aCB0aGlzIGNvbW1pdFsyXSwgc28gaWYgeW91IGdldCBp
c3N1ZXMgdHJ5IHRvDQo+Pj4gY2hlY2sgaWYgWzNdIHdvcmtzLg0KPj4NCj4+IEZXSVcsIG15IHBy
b2JsZW1zIHdpdGggdGhhdCBhcmUgbm90IG9uIGNhbmFhbiBody4NCj4gDQo+IEkgdW5kZXJzdGFu
ZCB0aGF0LCBqdXN0IGhlbHBzIHRvIGVsaW1pbmF0ZSBhbmQgc2VlIHdoYXQgYXJlIHRoZSBwb3Nz
aWJsZQ0KPiBpc3N1ZXMuDQoNCk5vIG5vLCBJIG1lYW50IHRoYXQgZm9yIE5pa2xhcycgYmVuZWZp
dCBub3QgeW91cnMuDQpJIGdldCB3aHkgeW91IHdhbm5hIGtub3cgOikNCg==
