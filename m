Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6198D572044
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 18:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E9995289;
	Tue, 12 Jul 2022 16:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D3695289
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 16:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1657641898; x=1689177898;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Wz662R5HEZqKGe6OTUxiaiQCuczgWJsYw1kfbeYrjBM=;
 b=iErUSBQK5OZy6u+wuVbFORoUyq5tSZo6LpAPIuMSLvNpa8LzWpOVq4mF
 gVY4OboJGpddik6LLqsykQNBdaxtq3/QNMaMjwO5K/y3ULYDaPE7orAX0
 vHEdMWGHjkFiaeSNpRQ7gGckA3+wE0tEtpbTIoD/ikvTc9F8l420deIbT
 CFhTn42PQJKqfHORiT+Oe3WAVK9Y7HPklYC/J25tmV3O7SRDkno2tDGfV
 k0oisnoDOJRkJWGeGV8s9v58XVG4F7+i5JgBqKAKu2l/sH6NnpRamTgwA
 8GdIrSo9qp8TZeQLb0DF/5oJ+oCdXYEW8228HJaZIQL9wCIjGV27ya5MS Q==;
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="167484393"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Jul 2022 09:04:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 12 Jul 2022 09:04:57 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 12 Jul 2022 09:04:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjbAZ8WJ3EAVhjNbpTaXnzfLPUJYAqXvOkxnh7sUi8l+4YOeDjnOS6rHEvv2Sg9+wTjpj+zof+UBbQh8kn2mz7GsI0+zavyZ6kpwneMfW7HETCxbb11/I+qfaZY50xSY3i9MxAQ1bzTpRuYHsuHHz86WX4bMKdaGf9TNAUhNzrzFkRUwSIYv++5mo/9aIb4p2CM4aNhtcdEaDctq8n3Pe3XAXG6Xvl3Fga1Q1Rn++kzkD/G3PCPrs+VxqazBdaNqDGZXzf8DtyPvY9s6gkXiOzt1XaCzweTFsuajWBr5UvVVVaJGQSkWx+xS8tpknSrMuehi9x4Dc4ISxEKr3l6RyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wz662R5HEZqKGe6OTUxiaiQCuczgWJsYw1kfbeYrjBM=;
 b=kImbh0w8vTo8xeqdRixZJ8CIYgAw1bXJ2ffSUS2Y7pen9FbetaCIqPquZ3Z6k3L1Jora2uDr01DwZPXZDEHURtrCmXQsqAPoxwUhEsgqVbqmhd4BUsWaxY8Is0Bk3GWjJviXzbMKBQR0HIkFi25230E4BLRdZ+lm3WF26vCtv5mOJ37ks7DutyjGQMnBixmtBlpAYXgCgcg719I6DbUJ+cveFc0vSgWFggnRCdsaLZ6CjlsTEPh025NWbpRZYLjptNNH1khuIaMkAM3zMv8r5AR1NkvttfTRDIghhj2IL+yjkhxdTxo9bqmD+j/yYgGtPsXzQGW4pdq6FKw2kf98lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wz662R5HEZqKGe6OTUxiaiQCuczgWJsYw1kfbeYrjBM=;
 b=EolufdnZjJhFqKGFzRvcdGy9uEd7SRi2Xt1N44WA2KbPBonXVWY08oFjNvYaCX9wu9IE/+JAigCVdkWoERPCOrrrExcBO9ZAvqYAIazf1SCXIHs0tQltRVmmu+wP3qtLU2aP0cizT0VLQfWq9oPp1CgGY8s2tiKWOhdGcnH9HQc=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB5919.namprd11.prod.outlook.com (2603:10b6:a03:42d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Tue, 12 Jul
 2022 16:04:55 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 16:04:55 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@rivosinc.com>, <krzysztof.kozlowski@linaro.org>,
 <Conor.Dooley@microchip.com>, <damien.lemoal@opensource.wdc.com>
Subject: Re: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan k210
 sram controller
Thread-Topic: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan
 k210 sram controller
Thread-Index: AQHYkLmpMN95aImTj0GtIyfn+RYzcq14CA+AgAA9+YCAAqfOAIAAAWoAgAABjYA=
Date: Tue, 12 Jul 2022 16:04:55 +0000
Message-ID: <1f63684c-c549-a726-b046-1197ef94d540@microchip.com>
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <20220705215213.1802496-5-mail@conchuod.ie>
 <a516943f-3dac-70a0-3ebd-9f53fd307f25@microchip.com>
 <b8b015f0-d16f-8528-719a-1a3f74d9f176@opensource.wdc.com>
 <969567fa-77ec-48da-ef63-c5d18de4b213@microchip.com>
 <eeed43cf-7bd6-9d77-9e1f-e018a236a058@linaro.org>
In-Reply-To: <eeed43cf-7bd6-9d77-9e1f-e018a236a058@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 033f8771-fd20-4d93-1d76-08da6420434b
x-ms-traffictypediagnostic: SJ0PR11MB5919:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HG7SxSa9CiV4f4mUkfg8DU2Gh4uqFQ2335rK7KcVGxybsBgxXpTrsatv0tESwQEFJEIrSk5/RiCXC4nwlFwi2c6GEPZzkLRW9XBKFS9T0lGBLekyGR3E9EiiWQYC0XhPOqbC2oITSP3AXsSJaqK+nUjcXPzvqFQAiAaioSI7mi8O32Ss/YWg8XxeyMdqZNFIhhEf/MawnjVpepfTVQYnxXN5R6g46JrfwaDDszxJcChcrvsEXn6x+6JFcMJ3QFKBBO1s3iUZdj/4WI2EXOf4HqM6VG0jTEPS12aTIn3IxmV1R3bZoZ+zTMDAj4V4UnRdklRqB+oRvmIHCHEAWUHcUCjjv1e6+VEx0ZyL05tvZh+ewmdp/bCw1LaX1K2sNyl5uns6cTgyd9nFE1qfFx5qd6BjRuNdnQGV7aK3CAlnHFCUoqlgdbCoYe6lzR00tfrreaOiI8IMHwAK7CCnD9ZprfBidJK+2/cTnGo0g3h8VNzNLnRw+/hOHE6w7bGByRFfvlB/Zol30UNdzFc2ZqdXPlLhxuFeItoj5hj/PrbmMp9OJQUEU3pVE0DKz1AfqQ4wZkAYpOYkE7DULka0g8l8MbA3xmZbglwtWNerA9ZmY65qMmFcCVwVCbGvF22WYSnaw3YzGNEztkF8SQ2yZ4OyFAcZnze9bhcUHL2Ixz/QmBtOIqb415oZLw37l+g2zq7SgQJkTQ1vR07pdauxtduTaEAcXfWv8MCwVDVZmEh8Wnlti17XIJXA5UUdjglc6BqTvoOiGJKu7zyv67Zm17BkB3Bi3Hxa4fN8IVkg8hD7lYqac5M8zlsXv/GPU31ZQpynfd5JWzOzezIXld4yhbZupvILngApDQ9rurLdZDJhzdKqpffsC9E+/00l440W5j9i
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(366004)(396003)(346002)(376002)(31686004)(36756003)(6486002)(41300700001)(316002)(2906002)(38100700002)(7416002)(83380400001)(8936002)(122000001)(5660300002)(6506007)(53546011)(186003)(86362001)(31696002)(66556008)(76116006)(6512007)(91956017)(38070700005)(66946007)(110136005)(4326008)(2616005)(26005)(64756008)(66446008)(71200400001)(54906003)(66476007)(478600001)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TG5tZWxvcGljZ3UrS21TaFB3R2puc0RsQzJweG1lSGJTVVcvc2RNQVF4Yzcw?=
 =?utf-8?B?Q2F6WDJnWjBuWlRXdVJZc05Zd2FYb090Vks4NGdNWGlSV1o0OFFwOGhQT0NH?=
 =?utf-8?B?WThjaHBqZXZHWVpSWlBBMjF4Q2hHQThGUHNPVlFBVm9CMERpQjl3UDdmbUpa?=
 =?utf-8?B?aHBMTGNjTWJTZGw5TG54K3lqeS9YSWZCbDMwVGhDMDVJZDhOUHZSR2NZT2ZL?=
 =?utf-8?B?SUN5NlViL3hKNmNVdXdJVm85YldHVGkxYXBHNGtDamVUcFc4L1BWTCtvT2la?=
 =?utf-8?B?Vnh2djlGRDVvc0NVRTNabytYWXR1ak5MTU50cWRDUTYwdVlzNU4xc0I2OStl?=
 =?utf-8?B?aUxwWU5xbzVkbVcvS2NyZ3E2MDBFSXEwSVYyWENud0g0dm1Mb0ZtN3hYVHBP?=
 =?utf-8?B?Tko4TnRMZmtmbisxUWFsdUNUbDQxK1ZIQjF5Tk81SUdFZ3BwNiswS1piME5q?=
 =?utf-8?B?Q1c3ZUlrUncvSDZ6MVpFK3JJd3lqVkNUaEZrYzJ4R05qS082ZHhMM2VOM0xN?=
 =?utf-8?B?UnRBMGFSaXR5MXVXQU1OR05lL0g4bGpLQUs2TFNQMmtoV3JwbHN1TVJMTVZS?=
 =?utf-8?B?a0JIQ2h6U2RWcVZFMW5HY3VFRmdvT01hMndWQWxFUWxVUDRGVzlnSjNtMVdV?=
 =?utf-8?B?NVh5aDhiRyttR3BxcU9VNkZmSXNwcUNqL21iNUNoUk9CRVRoamgxRUlwOWpn?=
 =?utf-8?B?aThoWjFHcWFWa2J2aHNKaEtwdk04THJOV0lHOU9rYUZZZk1lbERuTEFxSzIz?=
 =?utf-8?B?NDEvUEM2c1JHbHM5RFdNVHIya1JrRnBTRUJPeURWWldFWXZLYUovYVY4YTZ0?=
 =?utf-8?B?d25aNU4zM1hqVHVyVk1LdzJZKzkrMGd5NkMwclBpODd6amltZHZUVDFpSE5q?=
 =?utf-8?B?WmorczVPdWpFTExUbVoxMmtFZlVNOVFSdmoveGJKbzFmNU1DTHF1eHdiUVIw?=
 =?utf-8?B?SUNEL0UwNGNLWktqZXBZUEN5Y2U1VDBUSDR5bSt3ZFJJOVprN01PT2dyNjc0?=
 =?utf-8?B?eG9aZ0VFUmlrZTRLOFNmNll4S2ptdXpyWVZMSWNBTjBtekczQTRaTEhKRUdE?=
 =?utf-8?B?d3c3ampDbzVmQlkzUW9yTU5YMjUvNUZOd2tkTzV1YnRrYXBCSm1GZVJCc2wv?=
 =?utf-8?B?YzdRc2VTTGtnV1BybDBBQTRKblR5VnhzZGFWVkRJdTIwdENpRUVvVk0xZ1Vm?=
 =?utf-8?B?S3I2Z3pYSDJiTXdNaFZOdFJrQ1JDNlZyazFUT3ZTOVc0Y0dvM09oN2h4TUtY?=
 =?utf-8?B?SW9zUnRGZVdvTkNjUVBFdEdSWUZMNXpvMWNIMkM4QUdRUzdZTjEvSEJhZzlq?=
 =?utf-8?B?M28wUFExeGlrcXRoZHdqaTVIVER4OGdJQ3VlUTEwNkU2RWxXMEMzZ28yUFln?=
 =?utf-8?B?QUlVWGEwRnBudkorRnp1TTJPU2dZaWNtbjZCMVVnZ09NY2lzSUlKK0lualo3?=
 =?utf-8?B?L3FCOHc5cDhXM1l5OFRWcUkybGZqLzhWK2IxSHl0WnoxWko4NHVPQUZTQndL?=
 =?utf-8?B?SFJmWjVqbWVlQU11dXFTZlZZSG5SbVBvUlZXVXZmWXBjcjYxM2hpRmNRVGpp?=
 =?utf-8?B?V3Viekpvb3dDYWFLbEZoZzdMb0tyN0w2Z2VBZkhabDVqcHhEdm10U0hsR0Zr?=
 =?utf-8?B?a1ZGSUV5Y2ljekFYNVI0V0RiYVpZWVhjeUN0elFFWjI4WHZrTXdjWWsyR1Fo?=
 =?utf-8?B?Uy9qTDN4K0k0aENlOGpEQ0RabUZsVVRuQlg2VlJNc3FISEdkQWsySGNUWjk3?=
 =?utf-8?B?eVZkMmNqR1BYRFJicmtNeVZrOUswNGtnd1NnZFRQaitxd0xPN2lUU0cwV0d6?=
 =?utf-8?B?NmhwMDRwZElKN3F0Z2xKRzhZMmt1enh6dFRWRCswMkJSYnhyUUVEUFM3STNy?=
 =?utf-8?B?dHVEMTU1U3FBU1JNT2NrRUJWYURZZy9hRDhwNGgyMms0R0kzb1NFSmZRaHIw?=
 =?utf-8?B?UjVsekw2aVRueXRHdmNPMURxVHdWN2dLb0dzYlhBRjU1enZkWVExRE5oTEJY?=
 =?utf-8?B?aWFyNTREbkEwNUM0aTVISnU3RGlIZ0djaEVwdXpFUE9SeGFCajBvSU9hZTZQ?=
 =?utf-8?B?STluNkU2ZHg4eHhha1NjZG43QnhNelpIVlo3UHplaWxkdFV5Mk5zelZnREMy?=
 =?utf-8?B?dVQyeUJKRkVLRmx0SDdleU9mMDltVFV3UG82OWFFNnV1bGxaTVJhUStzMkJW?=
 =?utf-8?B?bGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5980F53000E9B4CA864EA343D6E92B0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 033f8771-fd20-4d93-1d76-08da6420434b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2022 16:04:55.6605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 90av5G4+HGlxxy4uWYsyMybaTCs4Htu1dEWA2TLxhXHE2FEhRaZXSAH1dyYcgXrIDKgf7qaxrQOmfdlVoXBpIsjj4Xzo3f49zpd6QpQauf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5919
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
Cc: thierry.reding@gmail.com, niklas.cassel@wdc.com, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org, airlied@linux.ie, Eugeniy.Paltsev@synopsys.com,
 masahiroy@kernel.org, daniel.lezcano@linaro.org, dillon.minfei@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 vkoul@kernel.org, robh+dt@kernel.org, palmer@dabbelt.com,
 fancer.lancer@gmail.com, paul.walmsley@sifive.com, dmaengine@vger.kernel.org,
 geert@linux-m68k.org, linux-riscv@lists.infradead.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvMDcvMjAyMiAxNjo1OSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gMTIv
MDcvMjAyMiAxNzo1NCwgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBPbiAx
MS8wNy8yMDIyIDAwOjIxLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToNCj4+PiBPbiA3LzExLzIyIDA0
OjM5LCBDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+Pj4gRGFtaWVuLCBLcnp5
c3p0b2YsDQo+Pj4+DQo+Pj4+IEkga25vdyB0aGlzIHBhcnRpY3VsYXIgdmVyc2lvbiBoYXMgbm90
IGJlZW4gcG9zdGVkIGZvciBhbGwgdGhhdA0KPj4+PiBsb25nLCBidXQgdGhpcyBiaW5kaW5nIGlz
IChmdW5jdGlvbmFsbHkpIHVuY2hhbmdlZCBmb3IgYSBmZXcNCj4+Pj4gdmVyc2lvbnMgbm93LiBB
cmUgeW91IGhhcHB5IHdpdGggdGhpcyBhcHByb2FjaCBEYW1pZW4/DQo+Pj4+IFUtQm9vdCBvbmx5
IGNhcmVzIGFib3V0IHRoZSBjb21wYXRpYmxlICYgdGhlIGNsb2NrcyBwcm9wZXJ0eSwNCj4+Pj4g
bm90IHRoZSByZWdzIGV0Yy4NCj4+Pj4NCj4+Pj4gSSAobGF6aWx5KSB0ZXN0ZWQgaXQgaW4gVS1C
b290IHdpdGggdGhlIGZvbGxvd2luZyBkaWZmOg0KPj4+DQo+Pj4gSWYgYm90aCB0aGUga2VybmVs
IGFuZCB1LWJvb3Qgc3RpbGwgd29yayBhcyBleHBlY3RlZCB3aXRoIHRoaXMgY2hhbmdlLCBJDQo+
Pj4gYW0gT0sgd2l0aCBpdC4NCj4+DQo+PiBJdCdzIGFsbCB5b3VycyBzbyBLcnp5c3p0b2YgOikN
Cj4gDQo+IEl0J3MgdG9vIGxhdGUgaW4gdGhlIGN5Y2xlIGZvciBtZSB0byBwaWNrIGl0IHVwLiBJ
ZiB5b3UgaGF2ZSBhbHRlcm5hdGUNCj4gdHJlZSB0byB0YWtlIGl0IHRocm91Z2gsIGdvIGFoZWFk
IHdpdGg6DQo+IA0KPiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9m
Lmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiANCj4gT3RoZXJ3aXNlLCBJJ2xsIHRha2UgaXQgYWZ0
ZXIgdGhlIG1lcmdlIHdpbmRvdyBvZiB2NS4yMCwgc28gaW4gfjEgbW9udGgNCj4gYWNjb3JkaW5n
IHRvIGNyeXN0YWwgYmFsbC4NCg0KDQpDb29sLCB0aGFua3MgS3J6eXN6dG9mLiBJIGtub3cgaXQg
aXMgbGF0ZSBpbiB0aGUgZ2FtZSBmb3IgdjUuMjAuDQpQYXJ0IG9mIG1lIGlzIGhvcGluZyB0aGF0
IFBhbG1lciBjYW4gdGFrZSBpdCB3aXRoIHRoZSBkdHMgcGF0Y2hlcywNCmdvaW5nIHRvIGJ1bXAg
YWxsIHRoZSBvdXRzdGFuZGluZyAmIHJldmlld2VkIHJpc2N2IGR0cyBwYXRjaGVzIHdoZW4NCkkg
c2VuZCBteSBQUiB0aGlzIHdlZWtlbmQuDQoNCklmIG5vdCwgSSdsbCByZW1pbmQgeW91IGluIGEg
bW9udGguIFRoYW5rcywNCkNvbm9yLg0K
