Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB6755EA1F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 18:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDB910E669;
	Tue, 28 Jun 2022 16:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33BA10E6F3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 16:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1656434965; x=1687970965;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3rDgFgKLtMHPMMvyxnTIdBimOxAossFHYs7VCarnKLU=;
 b=aj9BRe1uMqp1bneGIjKavhGDm8PMKKK5svEKFnnMvQOxYPALVFk8vpbG
 OEushZ2kXc4BSNo/DhxulrIcaJM9EOgsPuJB8vTqKtNi4yTm0EY3/mvvh
 tgyHw+2XTKEF+m+wkwvNg8qTLGf4oVl5H1IDNzQ0B8+/+R4DFyhDuKpaM
 5A2Jmh5EU8Y3rT+6H4cjgskwKjhx6pq7yVbe9oiMHXBeEL4YPKor5mYKG
 EIl79wBaPAI12GdXOgwVNLKk8+30l+2C5JDL8is6MAMWD81R3PZ4Y3n3m
 Lo3jyGTqp/3A02m3h9ysz1UZkWSJ2M/bP1Nmtz/vTLrSzTPIHaSE+Hhv9 w==;
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; d="scan'208";a="102133121"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jun 2022 09:49:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 28 Jun 2022 09:49:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 28 Jun 2022 09:49:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2ALpRW7SOxcc6IysRLvoCHAffv88A+PjT8frphQp2q8/UohSegti7wsTrVo4LAiqq2NyIz/QIW1+1ZI/q2sDEb9tKEaQvmvim1+lKNobTm4zxOWz9XiEKmgJT6i2nZNDhqguH7bqcaT/rFvjutRD9yq4CwUqWIGylPSqwQH+8c1fkzaVS44nW3Ps2qo0/bOpNeS3Q3JAld6CJ1SM05JGaI/upSB15Z438ZKKdx7NJUSj0cl0L13nhDbkeFSahWM1bDyrwDetdZ0KdwSKcG379b1tzS31a42zbdx62H80iK1bjniRegQOz+NblM+BDvNfasX4YExpKg80Etx4bwPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rDgFgKLtMHPMMvyxnTIdBimOxAossFHYs7VCarnKLU=;
 b=NdIWRelxJRkFwnm+OWBjKQvwfab4GGwUToNmi1CbNT5lUjm+a2RkulzxKl3MkPfuRfNBIAs0iyv5Fv8+YfL/fbceDhNiLZoer1nluTD6BBhHf91Gm+NZQgKytx0R/BBJoQrvx4wAH8n3EqBhbWCujhzWiRPyupH8q+WpbMyKKLpuzXoakg8YeL50K6iqsh9HidXUFJMQkXvYpjFrds2n+rcRWjR3FW0FjVbuKfG88cuMRZTP/2laq7YHmr68zCbuCAfhibOAELYF3Obubc4AkDI+1Na1+N2X/7ODF09jb7Leb32qK5keUcoUrin0Gp8Zzd5zBgZr8PrGK7WK6kDIog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rDgFgKLtMHPMMvyxnTIdBimOxAossFHYs7VCarnKLU=;
 b=jIWJiiUYE+z+4xH0mGqELTmIGG0HCz+LoDpNLD+F/tlrjHpLJCF/cI2DN5M16oFr7gmXUr204xPB1Mzccn9EE9rwXJKdlKytYdw0/UsHWPcWenarbVXSdZwHksoE+YNM7zhLK5PcTAhQa85Es6jvQFNUmncTHQyuX9QUAgmt6Qs=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN8PR11MB3812.namprd11.prod.outlook.com (2603:10b6:408:90::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Tue, 28 Jun
 2022 16:49:13 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Tue, 28 Jun 2022
 16:49:13 +0000
From: <Conor.Dooley@microchip.com>
To: <heiko@sntech.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <thierry.reding@gmail.com>, <sam@ravnborg.org>,
 <Eugeniy.Paltsev@synopsys.com>, <vkoul@kernel.org>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <fancer.lancer@gmail.com>, <daniel.lezcano@linaro.org>, 
 <palmer@dabbelt.com>, <palmer@rivosinc.com>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 01/16] dt-bindings: display: convert ilitek, ili9341.txt
 to dt-schema
Thread-Topic: [PATCH v2 01/16] dt-bindings: display: convert
 ilitek,ili9341.txt to dt-schema
Thread-Index: AQHYil3ibHuSTxs0yUmS4PM6+tqhF61k6wEAgAAA+gCAAB1FAA==
Date: Tue, 28 Jun 2022 16:49:13 +0000
Message-ID: <66f41fc5-9d9a-6c45-b0db-de33cc2b4051@microchip.com>
References: <20220627194003.2395484-1-mail@conchuod.ie>
 <20220627194003.2395484-2-mail@conchuod.ie> <3361801.QJadu78ljV@diego>
 <22692709.6Emhk5qWAg@diego>
In-Reply-To: <22692709.6Emhk5qWAg@diego>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d6cbb7e-4c7b-4c21-41be-08da5926218d
x-ms-traffictypediagnostic: BN8PR11MB3812:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4/cLCctQF+h7Fh3MD4NDHkQB+scuHeD+mRmFdMTc/vfJw2QbJKbOQpftKDsGqIe+FW4Wa6AcQ+ZVq+POYDmXz0O+bvFMEV2ww8SjDVhz6XbQRFvAX2NYu0RWrwQI/rRwNjVeQdSUwRhRnUyewISFiBzdTyDW5aYXeh8t5u86YILQB6YKHdbQiMgsNU/Ioz1cvCsq607e5kcrGSyI1wcD63g8cvNMRZwbCFnNdSCeFWfr64CVPRZZKbNXOVZxyb9OPItoLzp37vOmYLw+yZyp8sJxrdF+hu11JRHj13xGhOIj6Td9cwk18t6KnjSTXdDOFq9qFFJULspKBgyy2X4Rif/+FyqiL8v5K8VT3aFFOKxMmZ9yps1dQu/tkVaNUoeNzHULcruAjH5RSoIupNO2wdAdGbm9qwgqbzbZl7MVGee5Q8sbEI5S+NjUwkvg14GbCCiBY1gE8kb1KcZhmqteUdWY4URoww7SEYTko2ygx3qqHmKtQ23JVRzmYLbnOPtsuBJ7EccJA4Bw0KnEXnkPV5SoKpx9/jDGMBhJpmpmQbWioax2KF4Oyt4u2eGCzW7jPzlGCYGaxq12c5CEfMPtkHSBBIlSKLtBZ/0HddLUt8nafiwerV4ABf2ZFiLYpz/mkPBF4Up5n/M2VQpyuDdUfwj/ilKhYstw6dvQg/2ZUzLT250rH+z5YpPGWkZXbneOa5//quRy45Qb0TnfwWFF59e/SBpHLiP8WEY2Qb3WbXdDlfIoKXlmaBUYTDpHvBuSEzPeiQABMrvmn+o/eJGSfYhpDgIY13U/Infb7QJ5EqkA/3rqEC1zf1Svz8Pvw50c1T13hJFcdnFu04vIvC/R8dQ3QYMAamWQjXpyKPEcVE3nci8zXuxsx8pCzA97RznmiyI1Yj01qqDToynUYm3Ksw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(376002)(136003)(39860400002)(396003)(64756008)(91956017)(4326008)(76116006)(66556008)(66476007)(8936002)(66946007)(8676002)(83380400001)(6486002)(2906002)(66574015)(7416002)(38070700005)(478600001)(966005)(7406005)(5660300002)(66446008)(71200400001)(26005)(186003)(38100700002)(110136005)(6512007)(54906003)(31686004)(316002)(36756003)(31696002)(53546011)(2616005)(921005)(122000001)(86362001)(6506007)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzVzSGd3VUFZWUI5STV2Yk4zc0k4cXFPSVF4NHhPeHNyQmk2M09zaUp2Y2xs?=
 =?utf-8?B?ZDEzLzVhNTlnVjQvcDMybHp4Wi90dmEwRzB4cXBxZkwwSWJGNWRGZUdwSUsw?=
 =?utf-8?B?UE9KVC90NnNtcVB4RnlMd3hCdTRzU3ljRDNmRldJQThiS1RoNzVGc1lZb3RT?=
 =?utf-8?B?M0FFU29QZ3kvTVFIV3lPaVM1RFVld3UvVE9CaFZCWkREWXJpZTZDOTZoQUZI?=
 =?utf-8?B?amFFblBMd2N1MmVldGJhekFVTEt1WW42R0o3Nm16Q3FLMGN6VkdXeVR4bXFZ?=
 =?utf-8?B?RnNZZVp6WkRubmc3UEN6dDgzdzNkQk43RGJBWGx6UkJVbXpXaTZzSTZBaFQ5?=
 =?utf-8?B?Y2hZYjRLU3BjUWdCM1RBVzVFc1cvT2htbThqelQ2MXVGam1RVWs5azZpNDZk?=
 =?utf-8?B?SjhXS3hKYTVwZmQvaldPdzE5eGJOeGRITkR5eXQ4Z3ZmVmN2b0pUNXBJeXlr?=
 =?utf-8?B?MGJ4R3p3SXN2ZTM3bzk4L0xhcnlVTUdJZkgwQWZibzczVGRNSWZIQlB0RHB5?=
 =?utf-8?B?NGIwTkJPd21mNUc1YXR4ZkN5RjUwbVZIK2NtSmdmMU1nTTV4THo3STduT1BT?=
 =?utf-8?B?VFg4K0JtSldCSlczRXdTOG02TysyWjAyL0drNE9TTC9GUnJCYnhyejFwZEY2?=
 =?utf-8?B?N1RmOE9nVWdXSzNsdThwVU9YTGpCcWZ4T3VnVkJET3RlcjN5ZUZRRFQ4cTBs?=
 =?utf-8?B?Y05EL3ZxUEVGMVl3UlZMbUMvbkhjbVJ1eHNZQ1J5QUYrWFJsWjIrYklxL3h1?=
 =?utf-8?B?WWdTbUkyNDRlcURtUmhQUTl5TEdSRjV2UDNMb0wrQkh4V3dIR3g4azlUZmk3?=
 =?utf-8?B?Q0Z5dUtFMEtod0JkY0tiQ0liWStGcFRKR1VLM3N3Wlk3eXJUZWZOL1RUaHoy?=
 =?utf-8?B?N2N1emdRbmxQaVZGTWFYSEZjaVVVeHU0VDVQbjNKQlF4N3YxZXlBRWZSU21Z?=
 =?utf-8?B?QTV0czM3Tmg1aW4yeERmdG1wNEw2QlFDOXpzUFVucm1yV3FLdDBKYzgyQ2hu?=
 =?utf-8?B?YXhqdER6OGpLWFAzcUVnZTVxUUZsdytsRnVTYWR1eHZVRjhoc05BYmpvRHh6?=
 =?utf-8?B?amVyVjd2clowdmUwcHo1cE43ejlnUklCdzJBcVhBVHZXZW45OTIxNkU0c29M?=
 =?utf-8?B?Y3QzTjN6YWhiaHdUV1hUWWtUcjlQTU1ycHI4cVREdExYUE52cVhZMnlzbm9Z?=
 =?utf-8?B?aDRlNWt5MkQvRUlTT3ZXdkxaMTYvVU53YkowK0ZTMUNEeGF0YWdKSkZRRnE3?=
 =?utf-8?B?ck1lUE11UG83VUIrejV4Q0Y2MnBaaWRMUjBiaHNzdVgzeGJIOTRYbWkzUkNY?=
 =?utf-8?B?NFMrRXcvNlVEVzJuSno4cm95RERWWVUxbkNvRENyWGRSZjJqWXBEWnQ1MGVq?=
 =?utf-8?B?R3FrNHBuMFFyMzRrV0FkUllzcnFRTlhxa3lRdHJlSFRyR29vcFNMZVE2WHdn?=
 =?utf-8?B?b1JsbU5TUDVOKzY3WHBPQlJRVEtueFBLNE11UDZQNFZEYlhwTVZreklUbWxx?=
 =?utf-8?B?Y3RjQnpRcXZNK0lxWlNFNHhLcjU3b01NYkdnRHRNd2F0M21idDAvOFFlQjF1?=
 =?utf-8?B?MHhiMnZLaEpzN3ExUG41TXd6TmlOODNVbmJMRFNQWUV0dW0vK3dnM2lYMmo2?=
 =?utf-8?B?aHM0dXhrUkM4bFNQOHhDYjMzc21CbWxVSHFjd2NydkhxdElMbkVMTGRsbmhT?=
 =?utf-8?B?ODRjd0VRbnd5TFFtK29BVjRlU1orMUFTWHRhUWp4dWJzWDYxWS8xYTM5cjNp?=
 =?utf-8?B?d1ZVVVgyelZCYjRTZzc4bVlGMWpiQU9JWHVGdlBNTldmUFBQcWMvUlZIU05T?=
 =?utf-8?B?WUhOQ3B1RHFSdlhDb1FuNFVuckI3NFZMUGViRllPeDNYTVJMMHNsdjAvQUpI?=
 =?utf-8?B?ay9uWjVzYmlnTWRiTlRTSlBPTWZKcUFaaXZrM2R5QmpOa3FudzR5SVIzTnJu?=
 =?utf-8?B?SXlkTHprd1lEaC9iSlZ5SEZJNjhYYWd1TFcvWDY3SklScjRJcXZzMThZRVZv?=
 =?utf-8?B?NVJMZHJGbFRHMG1pdGZXejBKNndicEo3akFnTmZaMW9qK3daZU1HbnQ2dkNU?=
 =?utf-8?B?R3VxNXFwanJoU3JwbDdzVTg3SEoxN0ZabmdRTmVzUnliYzVZN1Z3SUFkblZi?=
 =?utf-8?B?eS83MkdsellFRHpaRnpBZElPeitsS1F6RzVOWVZFcFNzUTNtTElTa0x1cjJD?=
 =?utf-8?B?SFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E98215D7D9721449AD24F7F52AC96A4E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6cbb7e-4c7b-4c21-41be-08da5926218d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 16:49:13.2568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P/nk2+hEap5XS/p3DVSGF2QW+oDUejezAyIgSou/408Q2M2nmn31f+hCZk0CpMxIUDtZ6aiSZqJcDw/rbeUeSV2fb3PsbCYDsRsvG5iJdiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3812
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
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org, damien.lemoal@opensource.wdc.com,
 linux-kernel@vger.kernel.org, jee.heng.sia@intel.com,
 linux-spi@vger.kernel.org, mail@conchuod.ie, joabreu@synopsys.com,
 geert@linux-m68k.org, dri-devel@lists.freedesktop.org,
 paul.walmsley@sifive.com, dmaengine@vger.kernel.org, tglx@linutronix.de,
 dillon.minfei@gmail.com, masahiroy@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjgvMDYvMjAyMiAxNjowNCwgSGVpa28gU3TDvGJuZXIgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gQW0gRGllbnN0YWcsIDI4LiBKdW5pIDIwMjIs
IDE3OjAwOjU2IENFU1Qgc2NocmllYiBIZWlrbyBTdMO8Ym5lcjoNCj4+IEhpIENvbm9yLA0KPj4N
Cj4+IEFtIE1vbnRhZywgMjcuIEp1bmkgMjAyMiwgMjE6Mzk6NDkgQ0VTVCBzY2hyaWViIENvbm9y
IERvb2xleToNCj4+PiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAu
Y29tPg0KPj4+DQo+Pj4gQSBkdC1zY2hlbWEgYmluZGluZyBmb3IgdGhlIElsaXRlayBpbGk5MzQx
IHdhcyBjcmVhdGVkIGFzDQo+Pj4gcGFuZWwvaWxpdGVrLGlsaTkzNDEueWFtbCBidXQgdGhlIHR4
dCBiaW5kaW5nIHdhcyBpZ25vcmVkIGluIHRoZQ0KPj4+IHByb2Nlc3MuIE1vdmUgdGhlIHJlbWFp
bmluZyBpdGVtcyBpbiB0aGUgdHh0IGJpbmRpbmcgdG8gdGhlIHlhbWwgb25lICYNCj4+PiBkZWxl
dGUgaXQuDQo+Pj4NCj4+PiBUaGUgZXhhbXBsZSBpbiB0aGUgdHh0IGJpbmRpbmcgaGFzIGEgc3Bp
LW1heC1mcmVxdWVuY3kgd2hpY2ggZGlzYWdyZWVzDQo+Pj4gd2l0aCB0aGUgeWFtbCByZXBsYWNl
bWVudCAoYW5kIGl0cyBvd24gZG9jdW1lbnRhdGlvbikgc28gY2hhbmdlIHRoYXQgdG8NCj4+PiBj
b25mb3JtIHdpdGggdGhlIGJpbmRpbmcuIFRoZXJlIGFyZSBubyB1c2VycyBpbiB0cmVlIG9mIHRo
ZSBBZGFmcnVpdA0KPj4+IHl4MjQwcXYyOSB0byBjaGVjayBhZ2FpbnN0Lg0KPj4+DQo+Pj4gTGlu
azogaHR0cHM6Ly9jZG4tbGVhcm4uYWRhZnJ1aXQuY29tL2Fzc2V0cy9hc3NldHMvMDAwLzA0Ni84
Nzkvb3JpZ2luYWwvU1BFQy1ZWDI0MFFWMjktVF9SZXYuQV9fMV8ucGRmDQo+Pj4gU2lnbmVkLW9m
Zi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+DQo+PiBp
biB5b3VyIHYxIHlvdSBhbHJlYWR5IGdvdCBhIFswXQ0KPj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+PiBmb3IgdGhpcyBwYXRjaA0KPj4NCj4+IExvb2tpbmcg
YXQgdGhlIGRpZmZzdGF0LCB3aGljaCBkaWRuJ3QgY2hhbmdlLCB5b3Ugc2hvdWxkDQo+PiBpbmNs
dWRlIHN1Y2ggdGFncyBpbiBmb2xsb3d1cCByZXZpc2lvbnMsIHRvIHByZXZlbnQNCj4+IHJldmll
d2VycyBmcm9tIGRvdWJsZSBlZmZvcnRzLg0KPiANCj4gYW5kIG5vdyBJIHNlZSB0aGF0IHRoZSBy
ZXZpZXcgYWN0dWFsbHkgaGFwcGVuZWQgX2FmdGVyXyB2MiB3YXMgc2VuZCA7LSkNCg0KOykgeW91
IGhhZCBtZSBzY3JhdGNoaW5nIG15IGhlYWQgZm9yIGEgbW9tZW50IQ0KDQo+IA0KPiANCj4+IFsw
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjIwNjI3MjMyMDU0LkdBMzE1NTY2OC1yb2Jo
QGtlcm5lbC5vcmcNCj4+DQo+Pj4gLS0tDQo+Pj4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2lsaXRl
ayxpbGk5MzQxLnR4dCAgICAgICB8IDI3IC0tLS0tLS0tLS0tDQo+Pj4gIC4uLi9kaXNwbGF5L3Bh
bmVsL2lsaXRlayxpbGk5MzQxLnlhbWwgICAgICAgICB8IDQ4ICsrKysrKysrKysrKystLS0tLS0N
Cj4+PiAgMiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCA0MSBkZWxldGlvbnMoLSkN
Cj4+PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2lsaXRlayxpbGk5MzQxLnR4dA0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2lsaXRlayxpbGk5MzQxLnR4dCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2lsaXRlayxpbGk5MzQx
LnR4dA0KPj4+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NA0KPj4+IGluZGV4IDE2OWIzMmU0ZWU0
ZS4uMDAwMDAwMDAwMDAwDQo+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvaWxpdGVrLGlsaTkzNDEudHh0DQo+Pj4gKysrIC9kZXYvbnVsbA0KPj4+IEBA
IC0xLDI3ICswLDAgQEANCj4+PiAtSWxpdGVrIElMSTkzNDEgZGlzcGxheSBwYW5lbHMNCj4+PiAt
DQo+Pj4gLVRoaXMgYmluZGluZyBpcyBmb3IgZGlzcGxheSBwYW5lbHMgdXNpbmcgYW4gSWxpdGVr
IElMSTkzNDEgY29udHJvbGxlciBpbiBTUEkNCj4+PiAtbW9kZS4NCj4+PiAtDQo+Pj4gLVJlcXVp
cmVkIHByb3BlcnRpZXM6DQo+Pj4gLS0gY29tcGF0aWJsZTogICAgICAiYWRhZnJ1aXQseXgyNDBx
djI5IiwgImlsaXRlayxpbGk5MzQxIg0KPj4+IC0tIGRjLWdwaW9zOiAgICAgICAgRC9DIHBpbg0K
Pj4+IC0tIHJlc2V0LWdwaW9zOiAgICAgUmVzZXQgcGluDQo+Pj4gLQ0KPj4+IC1UaGUgbm9kZSBm
b3IgdGhpcyBkcml2ZXIgbXVzdCBiZSBhIGNoaWxkIG5vZGUgb2YgYSBTUEkgY29udHJvbGxlciwg
aGVuY2UNCj4+PiAtYWxsIG1hbmRhdG9yeSBwcm9wZXJ0aWVzIGRlc2NyaWJlZCBpbiAuLi9zcGkv
c3BpLWJ1cy50eHQgbXVzdCBiZSBzcGVjaWZpZWQuDQo+Pj4gLQ0KPj4+IC1PcHRpb25hbCBwcm9w
ZXJ0aWVzOg0KPj4+IC0tIHJvdGF0aW9uOiAgICAgICAgcGFuZWwgcm90YXRpb24gaW4gZGVncmVl
cyBjb3VudGVyIGNsb2Nrd2lzZSAoMCw5MCwxODAsMjcwKQ0KPj4+IC0tIGJhY2tsaWdodDogICAg
ICAgcGhhbmRsZSBvZiB0aGUgYmFja2xpZ2h0IGRldmljZSBhdHRhY2hlZCB0byB0aGUgcGFuZWwN
Cj4+PiAtDQo+Pj4gLUV4YW1wbGU6DQo+Pj4gLSAgIGRpc3BsYXlAMHsNCj4+PiAtICAgICAgICAg
ICBjb21wYXRpYmxlID0gImFkYWZydWl0LHl4MjQwcXYyOSIsICJpbGl0ZWssaWxpOTM0MSI7DQo+
Pj4gLSAgICAgICAgICAgcmVnID0gPDA+Ow0KPj4+IC0gICAgICAgICAgIHNwaS1tYXgtZnJlcXVl
bmN5ID0gPDMyMDAwMDAwPjsNCj4+PiAtICAgICAgICAgICBkYy1ncGlvcyA9IDwmZ3BpbzAgOSBH
UElPX0FDVElWRV9ISUdIPjsNCj4+PiAtICAgICAgICAgICByZXNldC1ncGlvcyA9IDwmZ3BpbzAg
OCBHUElPX0FDVElWRV9ISUdIPjsNCj4+PiAtICAgICAgICAgICByb3RhdGlvbiA9IDwyNzA+Ow0K
Pj4+IC0gICAgICAgICAgIGJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsNCj4+PiAtICAgfTsNCj4+
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvaWxpdGVrLGlsaTkzNDEueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL2lsaXRlayxpbGk5MzQxLnlhbWwNCj4+PiBpbmRleCA2MDU4OTQ4
YTk3NjQuLjk0Y2E5Mjg3ODQzNCAxMDA2NDQNCj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9pbGl0ZWssaWxpOTM0MS55YW1sDQo+Pj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvaWxpdGVr
LGlsaTkzNDEueWFtbA0KPj4+IEBAIC0yMyw2ICsyMyw3IEBAIHByb3BlcnRpZXM6DQo+Pj4gICAg
ICAgIC0gZW51bToNCj4+PiAgICAgICAgICAgICMgaWxpOTM0MSAyNDAqMzIwIENvbG9yIG9uIHN0
bTMyZjQyOS1kaXNjbyBib2FyZA0KPj4+ICAgICAgICAgICAgLSBzdCxzZi10YzI0MHQtOTM3MC10
DQo+Pj4gKyAgICAgICAgICAtIGFkYWZydWl0LHl4MjQwcXYyOQ0KPj4+ICAgICAgICAtIGNvbnN0
OiBpbGl0ZWssaWxpOTM0MQ0KPj4+DQo+Pj4gICAgcmVnOiB0cnVlDQo+Pj4gQEAgLTQ3LDMxICs0
OCw1MCBAQCBwcm9wZXJ0aWVzOg0KPj4+ICAgIHZkZGktbGVkLXN1cHBseToNCj4+PiAgICAgIGRl
c2NyaXB0aW9uOiBWb2x0YWdlIHN1cHBseSBmb3IgdGhlIExFRCBkcml2ZXIgKDEuNjUgLi4gMy4z
IFYpDQo+Pj4NCj4+PiAtYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+Pj4gK3VuZXZhbHVh
dGVkUHJvcGVydGllczogZmFsc2UNCj4+Pg0KPj4+ICByZXF1aXJlZDoNCj4+PiAgICAtIGNvbXBh
dGlibGUNCj4+PiAgICAtIHJlZw0KPj4+ICAgIC0gZGMtZ3Bpb3MNCj4+PiAtICAtIHBvcnQNCj4+
PiArDQo+Pj4gK2lmOg0KPj4+ICsgIHByb3BlcnRpZXM6DQo+Pj4gKyAgICBjb21wYXRpYmxlOg0K
Pj4+ICsgICAgICBjb250YWluczoNCj4+PiArICAgICAgICBlbnVtOg0KPj4+ICsgICAgICAgICAg
LSBzdCxzZi10YzI0MHQtOTM3MC10DQo+Pj4gK3RoZW46DQo+Pj4gKyAgcmVxdWlyZWQ6DQo+Pj4g
KyAgICAtIHBvcnQNCj4+Pg0KPj4+ICBleGFtcGxlczoNCj4+PiAgICAtIHwrDQo+Pj4gKyAgICAj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+DQo+Pj4gICAgICBzcGkgew0KPj4+ICAg
ICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPj4+ICAgICAgICAgICNzaXplLWNlbGxzID0g
PDA+Ow0KPj4+ICAgICAgICAgIHBhbmVsOiBkaXNwbGF5QDAgew0KPj4+IC0gICAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAic3Qsc2YtdGMyNDB0LTkzNzAtdCIsDQo+Pj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJpbGl0ZWssaWxpOTM0MSI7DQo+Pj4gLSAgICAgICAgICAgICAg
ICAgcmVnID0gPDA+Ow0KPj4+IC0gICAgICAgICAgICAgICAgIHNwaS0zd2lyZTsNCj4+PiAtICAg
ICAgICAgICAgICAgICBzcGktbWF4LWZyZXF1ZW5jeSA9IDwxMDAwMDAwMD47DQo+Pj4gLSAgICAg
ICAgICAgICAgICAgZGMtZ3Bpb3MgPSA8JmdwaW9kIDEzIDA+Ow0KPj4+IC0gICAgICAgICAgICAg
ICAgIHBvcnQgew0KPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgcGFuZWxfaW46IGVuZHBv
aW50IHsNCj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0g
PCZkaXNwbGF5X291dD47DQo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICB9Ow0KPj4+IC0gICAg
ICAgICAgICAgICAgIH07DQo+Pj4gLSAgICAgICAgICAgICB9Ow0KPj4+ICsgICAgICAgICAgICBj
b21wYXRpYmxlID0gInN0LHNmLXRjMjQwdC05MzcwLXQiLA0KPj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgImlsaXRlayxpbGk5MzQxIjsNCj4+PiArICAgICAgICAgICAgcmVnID0gPDA+Ow0K
Pj4+ICsgICAgICAgICAgICBzcGktM3dpcmU7DQo+Pj4gKyAgICAgICAgICAgIHNwaS1tYXgtZnJl
cXVlbmN5ID0gPDEwMDAwMDAwPjsNCj4+PiArICAgICAgICAgICAgZGMtZ3Bpb3MgPSA8JmdwaW9k
IDEzIDA+Ow0KPj4+ICsgICAgICAgICAgICBwb3J0IHsNCj4+PiArICAgICAgICAgICAgICAgIHBh
bmVsX2luOiBlbmRwb2ludCB7DQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBv
aW50ID0gPCZkaXNwbGF5X291dD47DQo+Pj4gKyAgICAgICAgICAgICAgICB9Ow0KPj4+ICsgICAg
ICAgICAgICB9Ow0KPj4+ICsgICAgICAgIH07DQo+Pj4gKyAgICAgICAgZGlzcGxheUAxew0KPj4+
ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gImFkYWZydWl0LHl4MjQwcXYyOSIsICJpbGl0ZWss
aWxpOTM0MSI7DQo+Pj4gKyAgICAgICAgICAgIHJlZyA9IDwxPjsNCj4+PiArICAgICAgICAgICAg
c3BpLW1heC1mcmVxdWVuY3kgPSA8MTAwMDAwMDA+Ow0KPj4+ICsgICAgICAgICAgICBkYy1ncGlv
cyA9IDwmZ3BpbzAgOSBHUElPX0FDVElWRV9ISUdIPjsNCj4+PiArICAgICAgICAgICAgcmVzZXQt
Z3Bpb3MgPSA8JmdwaW8wIDggR1BJT19BQ1RJVkVfSElHSD47DQo+Pj4gKyAgICAgICAgICAgIHJv
dGF0aW9uID0gPDI3MD47DQo+Pj4gKyAgICAgICAgICAgIGJhY2tsaWdodCA9IDwmYmFja2xpZ2h0
PjsNCj4+PiAgICAgICAgICB9Ow0KPj4+ICsgICAgfTsNCj4+PiAgLi4uDQo+Pj4NCj4+DQo+Pg0K
PiANCj4gDQo+IA0KPiANCg0K
