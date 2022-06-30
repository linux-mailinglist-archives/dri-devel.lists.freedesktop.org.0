Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C057562329
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA1B12ABBD;
	Thu, 30 Jun 2022 19:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42F612ABB8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1656617494; x=1688153494;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kDkag0PntXR/C/RzP9V4Kihj0tlSowfhs16lhQGjrEs=;
 b=KGDNd3SUeXvjQL/4Y0m0cjOLgU/uDh5nmNe7s91QZkrpWCjTEU7lfTaR
 +BLiAQKV8KD2Iyd9c9bBxx7chZ3DOhLAIjdGJlnJGxugMS6y9gOCKbpGQ
 7q8HDz3UKdIJShbNpopdxCsRWbMsFDrnXygLJuii3KAA2ILXUhCgncRZx
 7sB/PSIFHWorc8QQ3EncQ2l9ZJrz89G41+WIemcNausdd1u+3zrOkrHmN
 F+3mmBuzi/WW3mc9Xu550MsC1iLbhtxtHYnIMJAIHY4OUaQGgs7inPBgd
 AGDTceiem+bQUSMOhB9Zkv9rXUmJxD0SFnWxqo0IlcYva0d79MHZgNL/V w==;
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; d="scan'208";a="165902969"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Jun 2022 12:31:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 12:31:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 30 Jun 2022 12:31:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oh7l2nNGGRjR+QDS+yUpd1JhvWce4Lgws0DL+E7dmSXIQNrrF9v9C2W16VLKNf5ufeO/2gC1OvfJREJJFeVyahOoJAcNt4I6cI/1WbYYnXK96STldleNq8xvWlziAJTVzIDp+nRqnxxvcndniUFZ3nMXQNfAAFgTSWi9M6yDWLvjSaWeqmTFtFCrjF3Pjogqc/IhPgaeSG6LbxniBGAJe8CfrsGqvn2tTyRhrkJRfpk53M9k6sNMj5/6az3bomkuf15xQ3FyuyVndBWFeBX5Oz14B2HPLzIr4gha8XIfyMvEuL8q+iFsXHttgka3Y1PZLVSnlkh2rjduwu1p/BqodQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDkag0PntXR/C/RzP9V4Kihj0tlSowfhs16lhQGjrEs=;
 b=Kh+trpHv7rOLoNbL49Ad96UZnZVllCVfJCS5tkILtt6/k+16TnsR4HoaNz+yB5NhSEkXDIz9svz5uWMU/Wzr4Cc6+2Dn6YYAmpYrk+st/tdP8D25is9BqMD5HwVfkqds5j22OXN5SGa28sIy9GMcsiBy3vgIxZV/zyp/kgz3nwUNkMLMRcAjEjPH1YtZreahFBrLrAE0id+rnOmAZ8CxvmCii+++G1ZME52o0Eb48QKSPmZfxAZN75VD9IV+awAmYKFu3OlvwYIFPR4ccEzZ7+/q76DTn3/NOGGIUQ/VmFwqP+1Wh7CzgDBmfik1Flzk2EvCD5Pt83Cxy8znf/ylpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDkag0PntXR/C/RzP9V4Kihj0tlSowfhs16lhQGjrEs=;
 b=axYXhzdX8BLW+UkzrHU3MqxuRiy4IfmY7XCUoXAJeMtYQ1XxXpsrc+kWmRUT01qFioMKawyS2QQdnk3Sql/yjSgB7xx+w36PhPLk+f7KvDv8HB2OtXLrIMjnrM7GWL5F/7Epy7ecey5/zOESGMyDyTBp40auK5QHsx/+ZP3KRvc=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB3708.namprd11.prod.outlook.com (2603:10b6:5:146::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 19:31:20 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Thu, 30 Jun 2022
 19:31:20 +0000
From: <Conor.Dooley@microchip.com>
To: <Niklas.Cassel@wdc.com>
Subject: Re: [PATCH v3 13/15] riscv: dts: canaan: fix bus {ranges,reg} warnings
Thread-Topic: [PATCH v3 13/15] riscv: dts: canaan: fix bus {ranges,reg}
 warnings
Thread-Index: AQHYi+h3hoTHjH1NZU+cAhsP+cEeWa1oKv0AgAADh4CAACmcgA==
Date: Thu, 30 Jun 2022 19:31:20 +0000
Message-ID: <026527d3-ef75-92aa-36ab-32da47cca418@microchip.com>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-14-mail@conchuod.ie> <Yr3UKQ/772oFyvc6@x1-carbon>
 <3fec7542-c5f9-8812-732a-d624b0506ca9@microchip.com>
In-Reply-To: <3fec7542-c5f9-8812-732a-d624b0506ca9@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f8bc0e1-7c02-46fc-41a7-08da5acf1c2b
x-ms-traffictypediagnostic: DM6PR11MB3708:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GAi38OHTfyarF3upjWlsko2aDgnygYYE68pq1Fb9EtFTLJBBYspTUrD2/+StcKiur/dx+ZAC3kmSGEKmgdxdekZNy4/ki4UhQkvppYvzsKMRaUnB0GtM4fdBwxZbpzHho1824zKtnc35dOxDlVH2SqTp3g3vLwsKW6MOfIDDi8HH9q3jKhyg0b915qHDt2uRakfucrEMwvzGp0hyB7OwiLywydLHOeaX8pXGwClN1ojlIOSm8PxwVov5EQSSg+onAL+++p9WwWmKv0KH+iq8slKQlXwEqNjVT1sTOMeC4O/wDVJpniTnuKsEoD7Qa1KN/Ws728xMHU0DOIFfkLVPc7ph1gnlEXOpXqOYN4JLZ7AHnnAcv/7D6+0Bwg249iDL6YK2bZnUlrAmT8VVb577wrxF7pF37qzAERDBU5pC13dnPkqAWyq9ZRgeU0OBSOp+QDkNS0CFZ5rthYeAyevYZFHooB2Bg3DJY4BEM33SK3TL1xYBQ3YPgb+LvxzVURCXHBe20hErC8Uhr1xjInWQ98VeyGjl8QmobPm3DhqQ+BpW4qdEhOx5RH4/aHpzOsgoMl0lvesR+FwDM4iwFdwcvO4eraTnla7UPQQ2V7m/ZVPTmG2W7eY6CvOMXXtuKl7GBFpnv4iyQKXwQieS+axrVX9huUzZXwxMxSrGSP8283wbBOd5i93j3Gr5rqzruKZO8uh4B333VSH1aIVxh4O8jDxp1I1agYo52Wc/kTQ9OEhosjzuSI9sl8u5GEQqh46UO2GsxaQU2qwXmyrE1c4OoQETvoTDJ9m35TxSieOpWBRXf2V3229YR3AeUkms9+imzewlFTG2i6Jvn+He6JuMT5HZSistMlWPzorhQz0KOZ1d3tCkZBm1cIxDZ6rcVUv2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(396003)(136003)(39860400002)(376002)(6916009)(186003)(31686004)(38100700002)(2906002)(71200400001)(91956017)(54906003)(316002)(6486002)(36756003)(478600001)(7406005)(7416002)(2616005)(76116006)(6512007)(66446008)(122000001)(64756008)(5660300002)(86362001)(31696002)(8936002)(8676002)(38070700005)(83380400001)(66946007)(4326008)(66476007)(41300700001)(26005)(6506007)(53546011)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVYzZVBJa1pJZlp6VEg0bzRNbWR4azZEa1VSNXpHck9raDVqcW12TzVqZ2hr?=
 =?utf-8?B?dkVWejRLSXhTNWZqRk9yK2p0WjNzV3gydGF3NXdwNTdQMzFMRWQwSzVxWlhT?=
 =?utf-8?B?WkhHaDdWY2R2T2trRFNGaHNHOWU0S0xwMytJK21kVUtyazlCYzdITTBjODFB?=
 =?utf-8?B?SjNlVGUrcitUTVFJR2VETHpldFpQWm9tRHNJemVsckQyQk1iSkdjNXhCcjBR?=
 =?utf-8?B?dzhRMk5lbVNsc2tBL3l2UnJLY0s1TU5BNWlsUEMvQ0l0Ky9rajg5OUZUeHQz?=
 =?utf-8?B?cUdPWW9kRFd3ZE9SRVBVZEp2TGJqRjJpdktRdDNPZy9hNlRER0hlNmg5Y2V0?=
 =?utf-8?B?WVJyWGwrMzROV0crVktXZFFFeXhwUkpQcG4ySE5uMEkwc0pxTHhaQnloWEE4?=
 =?utf-8?B?KytPVmJrUmluU2FxVU4yUVN0azNOMWxzZTlPZGlXSmtRdjBmWDJFY3MrdGh6?=
 =?utf-8?B?Z2xXS3VFK3pXRTZNSi84Z0Noc2ZkQkQxUmEvUy9PaUxXRk5OM2hzc1l6MWlh?=
 =?utf-8?B?bUtseURPU01NYjg4enNvSERoay9rTHU5bHFQSGI1TlRwamgwNjUwY0pKTWVF?=
 =?utf-8?B?TFY0VEVuUUZVd29XbHlXUUgzQTlNYUMrbFpVQTV5em9TdkF6Nmd3MkVleUVQ?=
 =?utf-8?B?d2RPN0s3MVpnby94WVc1ZnRObUdTS3E5SjF4WGdpcXZaU3FPaTVDeHVyRGJn?=
 =?utf-8?B?SWRwMDlFWVAvQk5MWm9yb1hoRWllbDdzMkhYOXh1UjUrV2pZaHRuWnlkUHlS?=
 =?utf-8?B?eFBmRjRXd3VCVk9KRkRIdnRqQmFMYzd3ZUhNczZXNHBURHNKbDEzajhZVjZl?=
 =?utf-8?B?anFqdEhXZEsxNEhLWUF1Y0JjcFhRSmRIcXJvUlVuSThuNzJ5WHRKcnFkLzRO?=
 =?utf-8?B?d0hhem5DRkdOOFlQRTM1bFJLNlpSeU56aFVUWlh5QWVrcXlGSHUvc09EKzBM?=
 =?utf-8?B?cWFad2dHYjhweUphZThtRDV2OVg1VDRLTHAwZ2JJRVBuVEptc1dmTXFWWVR1?=
 =?utf-8?B?YkZvVVh4dThMa2xxMCs5Z1BXZU9OdDE4UStlQXB6U25qTzNDU0dOUFJ6T3Zi?=
 =?utf-8?B?UFlYUC94NUZkVWNOZktUbjRTaHBITkpXQlRDK3VXL3RNcVN0SHlKbVFQejhB?=
 =?utf-8?B?VjZST2xCckZ4UDJ0TE5uWTFXcWNIVjUvd2tXTEVON250V0E4SFpiNnZDa2dp?=
 =?utf-8?B?K0ZpY0kveWFCK3B6aCsrWkU5UnBENlpCUkVMNzVlM0cvQXByTXBhNTN6TVg1?=
 =?utf-8?B?V0JjakMySFphUFFmNURDTmFjNTBtTmF1bnl1MFZrb2NPeWRKc0hKcEI1NnNQ?=
 =?utf-8?B?bFpZWmFwSTdDNzNUUFUrMzBUUWZnNzhDVHIzbGZHV1ZNTklnVVYya2Rabjht?=
 =?utf-8?B?bERwRzNKMm1Za2ZnUTNPcldZdkpPdXhmRVpkVStlYTlOQzlqQWhiTlNicDE4?=
 =?utf-8?B?Ry9sK1FrVTlXMUQ3SisybmR0NkJuTFp1OU13OWFPSHUzQWhnODVxT2M4YS9x?=
 =?utf-8?B?UUNnM3R5QzNnZVloMzhURElEb0tjVXVLelhESFl0b09jQy9pZE1JKzcxaGVC?=
 =?utf-8?B?T1JhN09hMk53bk9ubHdQNkZXZGdrV01ycVdhblJqR29JVkd0aHEzTm1NK3ky?=
 =?utf-8?B?NXZJc0FLdlpWdjJhN2RGTDZWc1ZSVkdpRlZjZDRlT0NnbzhEY0hUYzlaNlNw?=
 =?utf-8?B?L3NsRDgvYzlPNWU4cnpnRXNyOW1qQ21aV0tNN2NNaXMydTNKMmhjdXB6SitN?=
 =?utf-8?B?Kyswbzh5blg1TUQvY2JsVmNzWmdiVUdpNW1hME9VUyt6dzRjQU1kY3NObmNj?=
 =?utf-8?B?aHRhdytjanBxN0JPdGppM1FndTA2Nmk5NXFWczMxMFFwcWlXQUZkb055c3dK?=
 =?utf-8?B?cC9Ia0k4SUh4L2plMk92TnYwL1Y5anM2TkdsN2JMOXZLWm45dXpmMnJZS0pO?=
 =?utf-8?B?Y1IzTkFqWCszK2JRaW9qS0NjT0dVTnFHUnB2bzdoVFhEcGhjVGJkdFo4aCtQ?=
 =?utf-8?B?eGRmblQ1SHZTVVUrZm9XdmtHK3Yyd25LL1lVMjNVSGNvUmZsRFkrNlY3U1M3?=
 =?utf-8?B?Sk9VVjdLOWlyMnNQY2NtbHQrYjZJc0o4YklvdFF6RWpBd0tGOFdqZVBOTTBE?=
 =?utf-8?B?eUFPREFQV252d0JucWRWMis3OFV6RVp3TVRtN3YycVFhM05vWUR2ZEpoV2d0?=
 =?utf-8?B?a3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0339CCE983E86E43A80182C384703A2C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8bc0e1-7c02-46fc-41a7-08da5acf1c2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 19:31:20.3361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q4Valr6G64GePKiFPmh/BygqdqPASjfUFxHwdU104u58SUzQt5VlLhiMMqLbgOv34t7IauW+Ryjwd62sctWqYf/4MAGWwFxcLAQZTDDBcFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3708
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
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
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

T24gMzAvMDYvMjAyMiAxODowMiwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPiANCj4gDQo+IE9uIDMw
LzA2LzIwMjIgMTc6NDksIE5pa2xhcyBDYXNzZWwgd3JvdGU6DQo+PiBPbiBXZWQsIEp1biAyOSwg
MjAyMiBhdCAwNzo0Mzo0MlBNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+Pj4gRnJvbTog
Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+Pg0KPj4+IFRoZSBr
MjEwIGRldmljZXRyZWVzIHdhcm4gYWJvdXQgbWlzc2luZy9lbXB0eSByZWcgYW5kL29yIHJhbmdl
cw0KPj4+IHByb3BlcnRpZXM6DQo+Pj4gYXJjaC9yaXNjdi9ib290L2R0cy9jYW5hYW4vazIxMC5k
dHNpOjQwOC4yMi00NjAuNTogV2FybmluZyAodW5pdF9hZGRyZXNzX3ZzX3JlZyk6IC9zb2MvYnVz
QDUyMDAwMDAwOiBub2RlIGhhcyBhIHVuaXQgbmFtZSwgYnV0IG5vIHJlZyBvciByYW5nZXMgcHJv
cGVydHkNCj4+PiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2NhbmFhbi9rMjEwLmR0c2k6MzUyLjIyLTQw
Ni41OiBXYXJuaW5nIChzaW1wbGVfYnVzX3JlZyk6IC9zb2MvYnVzQDUwNDAwMDAwOiBtaXNzaW5n
IG9yIGVtcHR5IHJlZy9yYW5nZXMgcHJvcGVydHkNCj4+Pg0KPj4+IEFkZCByZWcgYW5kIHJhbmdl
cyBwcm9wZXJ0aWVzIHRoYXQgbmFpdmVseSBjYXAgdGhlIGJ1c2VzIGFmdGVyIHRoZQ0KPj4+IGFs
bG9jYXRpb24gb2YgdGhlaXIgbGFzdCBkZXZpY2VzLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTog
Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+PiAtLS0NCj4+PiAg
YXJjaC9yaXNjdi9ib290L2R0cy9jYW5hYW4vazIxMC5kdHNpIHwgOSArKysrKystLS0NCj4+PiAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2NhbmFhbi9rMjEwLmR0c2kgYi9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL2NhbmFhbi9rMjEwLmR0c2kNCj4+PiBpbmRleCA5NDhkYzIzNWUzOWQu
LjZhMzRkYzRmM2U1MSAxMDA2NDQNCj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2NhbmFh
bi9rMjEwLmR0c2kNCj4+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2NhbmFhbi9rMjEwLmR0
c2kNCj4+PiBAQCAtMTYzLDcgKzE2Myw4IEBAIGFwYjA6IGJ1c0A1MDIwMDAwMCB7DQo+Pj4gIAkJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPj4+ICAJCQkjc2l6ZS1jZWxscyA9IDwxPjsNCj4+PiAg
CQkJY29tcGF0aWJsZSA9ICJzaW1wbGUtcG0tYnVzIjsNCj4+PiAtCQkJcmFuZ2VzOw0KPj4+ICsJ
CQlyZWdzID0gPDB4NTAyMDAwMDAgMHgyMDAwMDA+Ow0KPj4+ICsJCQlyYW5nZXMgPSA8MHg1MDIw
MDAwMCAweDUwMjAwMDAwIDB4MjAwMDAwPjsNCj4+DQo+PiBUaGlzIGxvb2tzIHdyb25nLg0KPj4N
Cj4+IFRoZSBwcm9wZXJ0eSBpcyBjYWxsZWQgInJlZyIgbm90ICJyZWdzIi4NCj4gDQo+IFllYWgu
Li4NCj4gDQo+Pg0KPj4gQW5kIEkgZG9uJ3QgdGhpbmsgdGhhdCB5b3Ugc2hvdWxkIHByb3ZpZGUg
InJlZyIgYXQgYWxsLA0KPj4gc2ltcGx5IHN1cHBseWluZyAicmFuZ2VzIiBzaG91bGQgYmUgc3Vm
ZmljaWVudCwgbm8/DQo+IA0KPiBJIGRvbid0IHJlY2FsbCB3aHkgSSBwdXQgdGhlIHJlZ3MgaW4s
IEknbGwgZHJvcCBpdCBpZg0KPiBwb3NzaWJsZSAmIHJlc3BvbmQgaWYgSSBjYW4ndC4NCj4gSUlS
QywgaXQgZGlkIGFjdHVhbGx5IGNvbXBsYWluLg0KDQpJdCBkb2VzIG5vdCBjb21wbGFpbi4gR29v
ZCBzcG90LCB0aGFua3MuDQpJJ2xsIGRyb3AgInJlZ3MiIGZvciB2NC4NCkNvbm9yLg0KDQo=
