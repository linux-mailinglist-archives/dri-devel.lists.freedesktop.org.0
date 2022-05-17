Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC1B52B319
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 09:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AA6113E23;
	Wed, 18 May 2022 07:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2136.outbound.protection.outlook.com [40.107.255.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F8A10E0F7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 14:51:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDkXy6t0MchXRC5keI7w6F9FLn9eH5P9RIIukW9VFHw4syzVLDjDM8iz5HN70I+hdtQJRpzdLfxSsPwRROCi1VqSCpUFU8dj8DD+ot/7EEvayMyJUucgDp4EKxUPjPmzT19XBNysvYB556/+FQu1dUgz4ac78bCAVDV4qCcXSaJe3sOXq+GMIefXC1HvFq2OWReycTW2+l18gxOzdKlD3+7guvFJo8omtHpIqUPyPB8uo1qp+7Ynj9Movp2gfJU1x6s2tLPeUjKqqIDwLbIREyOcg93ZueKdRimYZjY0/kgOAzOeWE2fZkBpr+wOL2hoevFVfaEejlmmhT0gNDQsZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xF6gJBfhZ2TwswQu52ErZ3AXELISFFCOrzWgeaFVfMw=;
 b=LSWkH8PWRnxmN4NcPm3efDSHsQIzJowiwCsHVJVRttEIwKCW45oK/a+rmQzIDabF+qtsy6ppmT4c5CRaVQCtheZZg0MpvlPjuEURQivYTBmVAG4S7e4ibth0v4muAAVcMnFjn59/IreN5yj0NLmSJlLvOLdbfl6h9IvrgQhrDA2tPgtbeFpTvHkCz53n7z+fb0BBBO5Bz/27IyWr3GCee+SlAl/W7UaMp+mSV4qRxVHakeZZKrrwV/WiFRel7qWw+iwYgGoiCzekrqV1AtrUOumE2kBKR7hohTM9P7A+LK2ahyMsLtP2qCrm+GL9wKexSQov69MFm2yvlr1cHstZoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xF6gJBfhZ2TwswQu52ErZ3AXELISFFCOrzWgeaFVfMw=;
 b=PGij1QGkmrHYnZ7Swbpp4MbVSTY2FNTlmZhjEMpAfz0SncpzJpAQ54UO/p238lqSlvqfKdH2lRhLGfpGgy/9CKO9jNNO+HTsSTjzotBh/+IRMcLuJZFRIHnCzej93CDCXgdUsUPMMQ1CqxVRIgfJCPC6ZIuq0UQ+GZBghnPyTDdUfWJ0N3a13Wqf6XXQ0fkZflHJjLR6vGD8+ISxkpbGhv4shLPNWIvwjnACmdxGrfKlZ8K0nIob5JJrkZ+bTy1VKgfs4tJfJdbRVhPNpq2crYhz/QoW2bjskpaGnWdaeEDGKaTpl4169rv/xyaX6JVWEVIEMtkLSsGPXy5rtZ/lEA==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by KL1PR0601MB4002.apcprd06.prod.outlook.com (2603:1096:820:20::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 14:50:55 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::3d31:8c42:b7f1:ece8]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::3d31:8c42:b7f1:ece8%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 14:50:55 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, Felipe Balbi <balbi@kernel.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Li
 Yang <leoyang.li@nxp.com>
Subject: RE: [PATCH v2 2/3] ARM: dts: aspeed: Add USB2.0 device controller node
Thread-Topic: [PATCH v2 2/3] ARM: dts: aspeed: Add USB2.0 device controller
 node
Thread-Index: AQHYacfDGaMXzDQN90y+BFiyb1NEtq0i95eAgAAutxA=
Date: Tue, 17 May 2022 14:50:55 +0000
Message-ID: <HK0PR06MB32027CAC4BEE443F426F587380CE9@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <20220517082558.3534161-1-neal_liu@aspeedtech.com>
 <20220517082558.3534161-3-neal_liu@aspeedtech.com>
 <96973d1d-c52c-d190-6989-3f7996dae70b@linaro.org>
In-Reply-To: <96973d1d-c52c-d190-6989-3f7996dae70b@linaro.org>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd0bee31-6f05-4c05-4136-08da3814a5c3
x-ms-traffictypediagnostic: KL1PR0601MB4002:EE_
x-microsoft-antispam-prvs: <KL1PR0601MB400298149AB93C7FF8F033E180CE9@KL1PR0601MB4002.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 77F9ax/4f9nQMPE+gDSMLCgOP3RyeM3pu/HuCAcEv6yu/4x4i/1veY9akGpDtRm8QfMb79x6If0QHtK6krcaMA1IrEaz8dReVXVU29psVUxlyQI1+2+ezOYnPd5gvhCVUO54NuXoej9jXUBYGgaYvv0KgiBjaD4XjKAT21+Vr/rd6N/AKsDg0nmvoWOLQ+XhIgV92GSfDS5HJHGyWzjftOzD8mHDJk6zGOM1tqCAHY410xhxc7iAEAynbEPei4CE4x9T2JakiOOZJCPpZQ+oQ3AVhrNBzoQ8Iak4E8LE3C6FbImwkQ5Fj+DpIg4UJFkRUzJlVQDF8IeB0wUkRwhvLUZYHEen8emc/C7Nhen8ejmGxkUvXAxhd7x6WhQ0wja9/mOa4Zp7gTdxj6xjjHx76UeiJfILoNGB33je8dek2nP6Rt/FKj4jzvbRdJCdnB35U40+M4iSFkm2q2Lteo+BYWF87OXNsYrQRHxnprXW5eSNuUegXWN+RDSuyd+a4LzSqCCcB6CSdgaFXlH0mGgz77R5eop+k8ZtUYFF05IJVK1wNlyj/UcEDHzWreCuRp3mHM9E7nt1VJKy0WkdO+xvUzJ2cdfML5+WbFXRhBhn+Cc3twxvZkJ7249U4Vx1/HiNRueN0mOdfTBYwY+8z+TOeqt/F7W3atvvYnD304FtGJUIU3CyDBl/zm1u17h2xgJyStTojP4sHtmgAxAgSKjWyqYHa4eDa/YML4wGcc8Vtpc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3202.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(396003)(136003)(376002)(366004)(39850400004)(346002)(66446008)(66556008)(8676002)(64756008)(76116006)(66476007)(4326008)(66946007)(86362001)(38070700005)(26005)(53546011)(71200400001)(8936002)(52536014)(508600001)(110136005)(5660300002)(7416002)(55016003)(33656002)(38100700002)(54906003)(7696005)(186003)(2906002)(83380400001)(921005)(316002)(122000001)(66574015)(41300700001)(6506007)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmJ2UUdjRGpsRHZPNVF5S1NNTzl1RFRwczVHR05kTFpZbDFXL3lZOHd4Uitl?=
 =?utf-8?B?eW9SWU9VeXNVdXowK0ZzbXdUOUV2VHlRS1pSMTFoa0hBRkl2Y0hCZ3ZtS050?=
 =?utf-8?B?bUl5OUlzSi9zYjZjK05RRUN1VGFRb1hOcG9ZL2RQWVhoVS9FNVY4WFZXS0xo?=
 =?utf-8?B?RVAyQW5Iemh3T01NRFFTUk40Z1JSV2lDcXNnZGIyOW4rak9HU0ZhTlFxYnFB?=
 =?utf-8?B?SEJ5WTE3bGtUM1M0blI3NUxmTnE0azNWUkNDdERkZmF5WExwV2lIZExtaUx5?=
 =?utf-8?B?a0IzNlp6RWZFdTRlRyt3RGlKZno4Z2p2TDkvV1VPTWdKMExyVUU4Ni9jNjYw?=
 =?utf-8?B?QmIvYllIK0JVUFZNenN1bTlMdUI4MEVaZ0Z0TkxiUy9pVVBKZTBVVmNvWXZQ?=
 =?utf-8?B?VVppWTkzdi9ZRk1ha2xDbW1sYnEwMUlaMXBxSVc5NEEwSUlRL2l3NGtJT0NK?=
 =?utf-8?B?VGlLQSswMU1ML1lGdjJzYi9LbmFnR29WRnR1ZVRub1ZNK0lKVlhtSjVjQmRo?=
 =?utf-8?B?VDRzcVdWV1VtT2ZEZGRsaWo4OXBGaG50QVMvQ0pxbVRXSUNuU2JqS0hRU3ZN?=
 =?utf-8?B?SDY2UHU2SW1DVTJTbjFneVVkKy9MVEN3VkdjSzlPbFVhTGVzR2VXMVR5YXZH?=
 =?utf-8?B?RlI4MURtcXhNWTdMTndyeHNOblhMOVFLVGNRVGJMcng2SWw2MkEwY292NkpO?=
 =?utf-8?B?ZjhLcTBVYU5HN2QwOC9SeFU0MHJSL056Tkl5M0VveEhVQVNwT2FKVHpjNXV6?=
 =?utf-8?B?YTZ4K1lqVFU0RnBGYTgwa2txSENuQ2tqRHJJUGo5VVlmZUMwMzJJVFVmRCty?=
 =?utf-8?B?aU5wQnVkcmgwQzRPeE9wVjUyWjhPYmxudjRsMndhejdOTGRxVWwrVktlU0Fl?=
 =?utf-8?B?UVo5NVJSckZRbFFGbDArMDdmdmRCRTVQMENyU3UrNzJWVG9ONkEyUy9vanM0?=
 =?utf-8?B?VkN0cTd6SlhLREdKclp5YzJGU2FtQUZ6T0MvVEhnVEtlNjVYdlZlTkN2VHV6?=
 =?utf-8?B?Rk5FTlcybmtpbFJ2VmIwNFdCQ3ZMVUxzYjN1RTBNNkJBbW9STTNjcmxPeTlF?=
 =?utf-8?B?UG80RmIzQUp1cHMzVTRSKzVGWnh2bE5IOW5XNTgwM2FEK3dodUZmalhxQWt2?=
 =?utf-8?B?ZGsrNFJpcWFrdEJwM0c1TlQ1cnZUK3M2R1c5QTVlbzB0UjZIZm5kelVvMFdI?=
 =?utf-8?B?bmFSYzZEa1lmRGxWN2V2dmUxcC9tTVE1bzB2UEFqcklDR1RMWWhabyswZkNU?=
 =?utf-8?B?TjJINTVvb01mTlJKTVN3NUhDZHU4UXM1SUVFQ2U1ZXNpamV2UHpNbDgyOEFE?=
 =?utf-8?B?bW12K3JqOVJIbk5tOWJ3QU05eVAzYXAzNUtrbE0rUzhhQ1oxR1NLWWY3Z0Fs?=
 =?utf-8?B?Rk45SFAyWUNMS3JsZE9FVWVKdEx2RGR1eElLalNTU2dGdGdJL1A3SjFHMisz?=
 =?utf-8?B?STVTYUpuejQvSEdLNHJOVHdKblJabjE2bEpiRjRPSWxEVmhNRUlGTGZoa1di?=
 =?utf-8?B?dVpuTEp5QU16Ujl0NENzaFFLMi9KSnR6Rll5SWwybVFUS3hqQjRZRjhjL1Y0?=
 =?utf-8?B?WDJaYW8xNjNMdUo4TWFwMkZTczZtM2VuQTFxcjRRaXNyU0VmNjZYMHY1UnV0?=
 =?utf-8?B?QTNlMW8xdlZiUG1lMDQ0YTdLUzVydENsa2ZsTEdjVWtwM28wbjBwVThjT0ZP?=
 =?utf-8?B?MXdlMHMxWUNIWjc3em5Zay9KU3B2SmlUOS9za3AwcjF1Wmp0bGlKclNBd0xi?=
 =?utf-8?B?TFZ1UWJSSWthTEJvTnBFbWx0eHFkbnFEcVg2ZHdod1lnMC9obzVpNDlxQmJ4?=
 =?utf-8?B?bjhrRC8vT3kxdjZGVUl0bXkydWZNWmhpNWI5aUxIWDI0cHlvSG4yOTcrUkJm?=
 =?utf-8?B?YnM0K2pqb3pkcldzUjBjQUFNZmRUV2lFVmxzTlpXYk9mN3RqYlNGTis3Rnpr?=
 =?utf-8?B?UWNadzlYOURtSUN0eDNMbjl0UmNRMkEza2oxTGZMZ0lvTElBOGJ1N1krYU1I?=
 =?utf-8?B?MFd1TVlCTkZhUGZaNUhKdWpMVWJBTmxCQnpsZmg3b1M3ZnFtUVowdnUzeEtY?=
 =?utf-8?B?NGI1ZmpsL0w0TjRJVjhSOUNnTDRkSlcxYnkrWFhXYzRjQmh1Q0pxeFBGcm44?=
 =?utf-8?B?MFFVT1o1ZHdtU21aTmlZV2RPSjJFWFBWbWZzeVVZRUhCa0ZyZ0tyRDhoNHh0?=
 =?utf-8?B?WHlveWpsOVVnTTRQTEpaYndhazBHU2ZTZ25QM0dTdnlSeXZodFd0VjJtZE8r?=
 =?utf-8?B?UzRjRHRxVlZTbm51WnZMY01HWTlpaS9VcjNNWW55VUxWUGNxcGh6Y05sdXlR?=
 =?utf-8?B?MXdXc2hQNU00dURDT1hBdDB2anNmZlVVaDE5dDZ5MHhoeGRDUEtzQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0bee31-6f05-4c05-4136-08da3814a5c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 14:50:55.7728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: llTVGPy5tpHueSXmCKpPLWoJ4nSo/551FFDdgJQNQGghuOJTl3ATYO/N58MgAthuPi8Z+L+iIaBwzjUu4Ffm8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4002
X-Mailman-Approved-At: Wed, 18 May 2022 07:13:30 +0000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE1heSAx
NywgMjAyMiA4OjAwIFBNDQo+IFRvOiBOZWFsIExpdSA8bmVhbF9saXVAYXNwZWVkdGVjaC5jb20+
OyBHcmVnIEtyb2FoLUhhcnRtYW4NCj4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPjsgUm9i
IEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZg0KPiBLb3psb3dza2kgPGty
enlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IEpvZWwgU3RhbmxleSA8am9lbEBqbXMu
aWQuYXU+Ow0KPiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1PjsgRmVsaXBlIEJhbGJp
IDxiYWxiaUBrZXJuZWwub3JnPjsgU3VtaXQNCj4gU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJv
Lm9yZz47IENocmlzdGlhbiBLw7ZuaWcNCj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT47IEdl
ZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+Ow0KPiBMaSBZYW5nIDxsZW95
YW5nLmxpQG54cC5jb20+DQo+IENjOiBsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZzsgbGlu
dXgtdXNiQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOw0KPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MiAyLzNdIEFSTTogZHRzOiBhc3BlZWQ6IEFkZCBVU0IyLjAgZGV2
aWNlIGNvbnRyb2xsZXINCj4gbm9kZQ0KPiANCj4gT24gMTcvMDUvMjAyMiAxMDoyNSwgTmVhbCBM
aXUgd3JvdGU6DQo+ID4gQWRkIFVTQjIuMCBkZXZpY2UgY29udHJvbGxlcih1ZGMpIG5vZGUgdG8g
ZGV2aWNlIHRyZWUgZm9yIEFTVDI2MDAuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBOZWFsIExp
dSA8bmVhbF9saXVAYXNwZWVkdGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gIGFyY2gvYXJtL2Jvb3Qv
ZHRzL2FzcGVlZC1nNi5kdHNpIHwgMTAgKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRz
L2FzcGVlZC1nNi5kdHNpDQo+ID4gYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzYuZHRzaQ0K
PiA+IGluZGV4IDNkNWNlOWRhNDJjMy4uNTUxNzMxM2ViMmI1IDEwMDY0NA0KPiA+IC0tLSBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNi5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvYXNwZWVkLWc2LmR0c2kNCj4gPiBAQCAtMjk4LDYgKzI5OCwxNiBAQCB2aHViOiB1c2Itdmh1
YkAxZTZhMDAwMCB7DQo+ID4gIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gIAkJfTsNCj4g
Pg0KPiA+ICsJCXVkYzogdWRjQDFlNmEyMDAwIHsNCj4gDQo+IFRoZSBzYW1lIGFzIERUUyBpbiBi
aW5kaW5ncyAtIGdlbmVyaWMgbm9kZSBuYW1lLCBwbGVhc2UuDQo+IA0KDQpJcyBpdCBwb3NzaWJs
ZSB0byB1c2UgInVkYzogdXNiLXVkY0AxZTZhMjAwMCIgdG8gZGlzdGluZ3Vpc2ggaXQgYmV0d2Vl
biAidmh1YjogdXNiLXZodWJAMWU2YTAwMDAiPw0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEty
enlzenRvZg0K
