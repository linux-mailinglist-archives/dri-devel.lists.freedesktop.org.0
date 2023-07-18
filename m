Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AF2757AA8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 13:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C7C10E334;
	Tue, 18 Jul 2023 11:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F8010E313
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 11:41:22 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36I7AXPw012253; Tue, 18 Jul 2023 12:40:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=COGYAEiy5KlBJ1K9xplFAxTr1WT9FiXQIaEVTt275Jc=; b=
 NHpT1pUCICEteSm9Z1wZ1LXx1O98MtLAqHztcGOKqMGx66BQofj1o5XjTaVXAES8
 vWYAOWBfbiHGT+i/A+sBgWHEcCxiR5qYOuMTL9wJjFkX7vvGVIYZe6Bum9ce58BW
 9YJTrK4wcxL4NMj0/1l9tjkMZhbhOh1j+jkJwtXqZm8Yq80U6P7SzNzXRkyJRGIG
 mfrgYhQtXXaMBnx4AF7S9+WKt2NJ51is4F/U9QsM2P8eA0gNVLBX14HNcWso3OPS
 jshDOEsjkEPiVXxnB+szxfwYD9JChxRFYEU5IXr6jkJXozi4Ngcr3iLW+6rmyu3Q
 FsW+rWSPmc8sLrO4PQBJ3g==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3rutcx21c9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 18 Jul 2023 12:40:57 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 12:40:56 +0100
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.41) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Tue, 18 Jul 2023 12:40:56 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCzzsYzDN6kQVUlTCiZ0sqysQcxfwSA5DN8Dt+3CL6zihRwEEotLGxPYsy6GcPJX37GbN9iY2NhgVYu8RtErB+P8YVT8GN2xTMCgyks8p0L8JpOS23a8YysyYfOA7ljjM+S9CHLiqc1s//aZ6/9kuxdXJsnbfXlPco/9tfkD1CmLD3lRA8Q+sY94XTbzRDSJSgGpiDRwCFsK6OCU378df/OZAUTH5eodzjRa6aFdKdUP5zh3IFwfN+25SMglIn2WitQ+Hbwi73JtJH2YMDDxhTl6/bswbsXKfDwFFjyw377nXuwPgTgKdWzKsL5SQU6n2R+HXxvsLdIS3HPptocFlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COGYAEiy5KlBJ1K9xplFAxTr1WT9FiXQIaEVTt275Jc=;
 b=NEsAaqr4YWTUmQGboJGIg79qUY+EvNlyvzumMGSjBcIHfbvopOob9FlxoAXoj4zWkX/XUSV2aTP6LwLFs4e5FQmQ0j5nsE6ANhMD9VbUlv7chqSNt/+UoYP/g/PsaG5ol7SehBK+7v2+6fKYW/lhJ7IyDOeg8LbcexBMJRAutS0dNG69dVRq498sYy4MlMJrWcb7HnyUlBhZVVA9IgeADXaw+CMw4MHa0R/BEo10LtEhOFAGOekBTHp+TCu685nWR46RpfiZjPQECgTOaT/9PkIkIcvh5SKWdYmxkgYDDp0HnZ1FmrPRnH/3rys36114BpBSlyHqYoVCEMYGlvknrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COGYAEiy5KlBJ1K9xplFAxTr1WT9FiXQIaEVTt275Jc=;
 b=V7jwAAslHJeL41+toFw5olGZYwCH43zfG/nAR7Vmd/tgOKrKAi2tiLUYB/zjW1gSIDzrLFfLu9T4D57xm/ooVUUruscbXdg5YR/QilTxKXvFyNe1ucQkYYME19jFmTAtaiX74QQOKefYFeLOGruduRxcF7AZ+JZ6F0xXCEFn9LI=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWXP265MB2294.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:7e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 11:40:16 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1871:e3c9:b5a7:a740]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1871:e3c9:b5a7:a740%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 11:36:11 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "conor@kernel.org" <conor@kernel.org>, "krzysztof.kozlowski@linaro.org"
 <krzysztof.kozlowski@linaro.org>, Sarah Walker <Sarah.Walker@imgtec.com>
Subject: Re: Re: [PATCH v4 02/17] dt-bindings: gpu: Add Imagination
 Technologies PowerVR GPU
Thread-Topic: Re: [PATCH v4 02/17] dt-bindings: gpu: Add Imagination
 Technologies PowerVR GPU
Thread-Index: AQHZuWwIYls3+v6T3kuC6Zq260c8bg==
Date: Tue, 18 Jul 2023 11:36:03 +0000
Message-ID: <1cb4f6b57f0826377f0aef85a8abcf0b5f51c07c.camel@imgtec.com>
References: <20230714142526.111569-1-sarah.walker@imgtec.com>
 <20230715-paramount-straining-6a486f8af20d@spud>
 <a86f6359706485cf595889a07e513e2b9fd6d71b.camel@imgtec.com>
 <4131759e-9474-48f6-cc05-67b6d4b6559b@linaro.org>
In-Reply-To: <4131759e-9474-48f6-cc05-67b6d4b6559b@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWXP265MB2294:EE_
x-ms-office365-filtering-correlation-id: a2584507-031c-42b1-0284-08db87833007
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZWQlmkS+TmysH0Eg6N03cD9yACijTJulQaaKQvhTmvzNAVtfoK6qOqiwbGu7rDYalhyCeakvFb/p2QqKRBFVdXUOdSDzZ+ML95CmkmvsYIdHPodjDCuvavIS55V2tkAiLUbhVUetFU3pXOx9wj9SeOPpqiRYwT2xXw/orfIyUM2wibk7wKPmacxwk/fY69QhVC8ymAQKLsb0sfiTQHnj2SFhs9oNqN3tVCX9bN1wyHykyg2I+3/0180onsl+4AtNk4QXmrUcKzH9WamXGz3t7LTIxt98bl4LIQfys5zUfUEPwxzV7lAdUZfV3gJpzLGaC36MkZL7Nin8e0e8dr/Z3BV+K9dRcfufMF0BslWVUl7HkaVH161Lakrl6yzsJpGsBVEouQoTR9F5LXLLl+We6ilWmauINxlSKw2ff1ed1Af+pe0MlftaiqnIUmYkmW2SrD1xuz+Azq1UaxZdT870tlAgrQznzfDESqSnKTpU3bTsoUfujiZ0rPgsC5b/ZbhLsrb3f3eOP1zGRypc5aaEKo00Bb72VgukCjucHD6lapUd4PQvYDksjLGUQJyWr54RBHtM+0ITh0mhkqKgAJ8Mv3i2AiJ3tFvdanXpd8cr0tpCtaai2gYHPrW8VG9kldix
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39850400004)(366004)(376002)(346002)(136003)(451199021)(6512007)(53546011)(6506007)(36756003)(38100700002)(110136005)(54906003)(122000001)(5660300002)(8676002)(7416002)(8936002)(38070700005)(4744005)(4326008)(6636002)(86362001)(2906002)(316002)(76116006)(64756008)(66446008)(66476007)(66556008)(41300700001)(66946007)(6486002)(26005)(6666004)(71200400001)(478600001)(2616005)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3lmQ2srN1BxN2htU1pxQlh0Ym84alg2S0hHRldIdUJmaDgwWnBiaFB5Yld6?=
 =?utf-8?B?K0xDK2Nadkl6Mkd3SW85R3c1TVpiN0lDYk1qZ1dxWnNzQ1BtQjVJZkozYmFx?=
 =?utf-8?B?alRTaWFxMzdFNUJCTTJjU0lvVGY2dng5YWl3ZkJJRHBUSnB3Tk9FYzRja2Nr?=
 =?utf-8?B?YzM5Y3hoeGljNTZVQVU0QUd0eTBWVm9oRnJ2UjlPTXBZL21XRk1nMmlsV0dq?=
 =?utf-8?B?d1JjZ2ZERG1GSjRZUFowbTVkZm9GVDAxRS9xdnA4U0JObzJoRlN4ZFlpSTgx?=
 =?utf-8?B?Q2NDMHB4a0t5RlVtRURWREw1dENnQ2c4aHpYeERVckxyTUxlbktsTXpsRFZT?=
 =?utf-8?B?ekkyWjJ1dTdvTzhQMlZyTVZQTGRoTWtlRUFEWkM3ZHV5UmRBVnFMTVJlZS9N?=
 =?utf-8?B?QjNpU0Q4MytYSjZSMG12WS9yeHVHdjFnTWptUFp5aTBVZ2JKOTdnOVRRMHA0?=
 =?utf-8?B?cDJOcXNBQ2tUYVVKL2VySGlnZVFOS1o5SWNtVDFLREk5YjRvSTlXVHFLY1FR?=
 =?utf-8?B?Y3NETEVUVjZwU2tGS0twQ3dkVGNPSmM4djRmRzhISFJqT2ROdDhTZSswTklQ?=
 =?utf-8?B?ZWRLb003endMR3RDeTFoS1huQnBsNG9FU0lndmhzY0xwdmFDUFhOczFxM1Av?=
 =?utf-8?B?WTBueXJhTlpTbUxZb01QazBub2VVbzBGMTU4TGpDODN1bWZuTTRmVTZLUHk4?=
 =?utf-8?B?ZEpyYXRVbUZCN1EvL0E0YW1jekpUSVA1TXFDbWZ3TXQ4bzRGcUhEM3FhYncr?=
 =?utf-8?B?T1VIK0dhNytLemptbXBQWGI3S1BzcUxSOVlndXNwSVNVNmo4VllTczFtS2hq?=
 =?utf-8?B?bVJUQTU1bmlldkJnV01rRnpCcXQyYnhpSnY0Qi9vWkdGTi96SVZWWkYwaWdL?=
 =?utf-8?B?QjRhdndsRi9ueXhVaVV6d2pIVzA4YTdSRXJMRlUzK0xiZjlmNmNTU1pReVRh?=
 =?utf-8?B?aXJzWHdnaTJIUURqRGhHQUdVbnU1NkowaHovVm5NTVF5UFN3cFBuSElKejV1?=
 =?utf-8?B?R05xTUVSa1ljYkpsV0daMy96dzVzUjBWRGF1TlN1aVhmSHBDRjZNandJOVdU?=
 =?utf-8?B?WEdtSUlSekk4SnltZjZaWTdoa2kzdkQrMmFhVy84Sm5zMUpidnJRUkpQVzhl?=
 =?utf-8?B?VmZjOEZSU0hYMFhnWTRVUnRVVjdyd0xQa25zR2xYbFltTVNRWWxIc1liTktW?=
 =?utf-8?B?TmNvQVFLSllaL05xWjZVWlhJTVpUblVsbXBYMHlKRmRKYjBqQzk2VDRIakR1?=
 =?utf-8?B?dDVnRS9XZFhTTGtlVS9kK05CcnNPQ3A3dGdDQ0hVdjVCZzJwUUVUNVQvK3g1?=
 =?utf-8?B?a200VitpZ0FFR25XcjRCbUwxSU1adncxeVJJS1pUYXNqd3QwZWNidE8wSFNY?=
 =?utf-8?B?VDg0VXI4azF2Q2cvaEY0OVA5RHloWHVENDdhV2plNk82bWY2dFd1WWdlWGM3?=
 =?utf-8?B?eCs5SWJTT0NRekdlODVmdTJoUVF6akJOMHVtMGtiKzEyQkZSS0wrckNWMmlv?=
 =?utf-8?B?eFdkNzVoSXZqQVgxOW5wQ2c5cDBpVnF1eDZvaFp6SHNxRE9uK3V0WEdLcVJa?=
 =?utf-8?B?cFBITW9nZUpuZno2aVpMMHRpQlN2Vi9xTjNZeklQVlVoNWhsY3o4TEZ5b0sy?=
 =?utf-8?B?MWQ5NTNwZFkzRm9MaTc4UHdOdUs3aFFLSEJPYWt2UEpKS0VQMGFrejNDZnpC?=
 =?utf-8?B?ZEwyRURHSUsvcUFRNmJoNmMzb0Q3blY2RzgveXlITHY1NU4wNDJaWCtWMzFz?=
 =?utf-8?B?eU1ZbU5CTWVQMmJMOW9pZXFXdGJpb2c0NlluYzBYVXNCTk1URkViYllUelFF?=
 =?utf-8?B?QW5KRmlZSE5Gd3VEMlFBTXlTLzkzQnh5VTF6QVExUzI3ZzdONUREeUtqSTlr?=
 =?utf-8?B?RUl2eGdxaWRUYUV2WXhsRXQ5R2E3djVWbUZKNzdMNlhpbldWdXJkY05vQ0Qz?=
 =?utf-8?B?a2QyeWpVSU5pUXdpODJFanloWTlOTmRRQUtRSHVlUHNHRitGdDVTRnJzZ2pR?=
 =?utf-8?B?ejV6cGlzaWpBNDAwNEZSZ2d2dkFEK2l5Nm9WK2dvUnM1MldRR0VYQk1vbG1s?=
 =?utf-8?B?TjZsb3NTdVJWSXlIejRDZE5ld2hhTVZ3QnhHcEQ5N1oxcmZXdE92ZUNmREhr?=
 =?utf-8?B?NFRDb3B1aEZPRVd4WmVhWS96RXUvc1dxa1NxdTdBY3hWMHhyTUVlYkI0MEU2?=
 =?utf-8?B?cUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C8C674933BDED48BA830098BC1C65D4@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a2584507-031c-42b1-0284-08db87833007
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 11:36:03.9853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zKQHUHFghbKhzPHwXxK3BGoYyzzUsvAqAyUMHk9cbe2gudRawxbeNWLWwD0RTp6Non9sFyfPePKziUZav9K9Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2294
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: z1dOZjqWtyJyL737MPBnNVzL26_kz23d
X-Proofpoint-ORIG-GUID: z1dOZjqWtyJyL737MPBnNVzL26_kz23d
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "hns@goldelico.com" <hns@goldelico.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>, "afd@ti.com" <afd@ti.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>,
 Donald Robson <Donald.Robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLA0KDQpPbiBUdWUsIDIwMjMtMDctMTggYXQgMTM6MTAgKzAyMDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDE4LzA3LzIwMjMgMTM6MDgsIEZyYW5rIEJpbm5z
IHdyb3RlOg0KPiA+ID4gQW5kIHRoaXMNCj4gPiA+IGl0ZW1zOg0KPiA+ID4gICAtIGNvbnN0OiBn
cHUNCj4gPiA+IGNhbiBqdXN0IGJlDQo+ID4gPiBjb25zdDogZ3B1DQo+ID4gPiANCj4gPiA+IEFs
dGhvdWdoLCBpZiB0aGVyZSBpcyBvbmx5IG9uZSBpbnRlcnJ1cHQgdGhpcyBpcyBwcm9iYWJseSBu
b3QNCj4gPiA+IHBhcnRpY3VsYXJseSBoZWxwZnVsLiBBcmUgdGhlcmUgb3RoZXIgaW1wbGVtZW50
YXRpb25zIG9mIHRoaXMgSVAgdGhhdA0KPiA+ID4gaGF2ZSBtb3JlIGludGVycnVwdHM/DQo+ID4g
DQo+ID4gTm8sIGFsbCBvdXIgY3VycmVudCBHUFVzIGp1c3QgaGF2ZSBhIHNpbmdsZSBpbnRlcnJ1
cHQuIEkgYXNzdW1lIGl0J3MgbW9yZSBmdXR1cmUNCj4gPiBwcm9vZiB0byBrZWVwIHRoZSBuYW1l
IGluIGNhc2UgdGhhdCBldmVyIGNoYW5nZXM/IA0KPiANCj4gV2h5IGRvIHlvdSBuZWVkIG5hbWUg
aW4gdGhlIGZpcnN0IHBsYWNlPyBJZiB0aGVyZSBpcyBzaW5nbGUgZW50cnksIHRoZQ0KPiBuYW1l
IGlzIHBvaW50bGVzcywgZXNwZWNpYWxseSBpZiBpdCByZXBlYXRzIHRoZSBuYW1lIG9mIHRoZSBJ
UCBibG9jay4NCj4gDQo+ID4gQXMgaW4sIGJ5IGhhdmluZyB0aGUgbmFtZSBub3cNCj4gPiB3ZSBj
YW4gbWFrZSBpdCBhIHJlcXVpcmVkIHByb3BlcnR5LCB3aGljaCBJIGd1ZXNzIHdlIHdvbid0IGJl
IGFibGUgdG8gZG8gYXQgc29tZQ0KPiA+IGxhdGVyIHBvaW50Lg0KPiANCj4gV2h5IGV2ZW4gbWFr
aW5nIGl0IHJlcXVpcmVkPw0KDQpJdCBzZWVtcyBuaWNlciB0byBsb29rIHVwIGEgcmVzb3VyY2Ug
aW4gdGhlIGRyaXZlciBiYXNlZCBvbiBhIG5hbWUgcmF0aGVyIHRoYW4NCmFuIGluZGV4LiBIYXBw
eSB0byBkcm9wIGl0IHRob3VnaC4NCg0KVGhhbmtzDQpGcmFuaw0KDQo+IA0KPiBCZXN0IHJlZ2Fy
ZHMsDQo+IEtyenlzenRvZg0KPiANCg==
