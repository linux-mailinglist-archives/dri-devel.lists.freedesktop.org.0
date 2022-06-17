Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CD3550326
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 08:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EF411ABED;
	Sat, 18 Jun 2022 06:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B9210F583
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 23:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1655508570; x=1687044570;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=he36OmG3GhUCkRBBpBgKnt756Nw+Dz8pa+ipwM3gjDQ=;
 b=aNVlOgRxdgwJjBej6anbGl4lmYYZb2x1vV7WFsfn1+JpuUJGvIxgsrqz
 LafThfJr7MH9XjF8/9N9BCUu7mdNL5q05sOst/ZC5gcjWTS4zSDvBYwwF
 nJWYq4Ss9dwBW/ya4W52JO4+h6ws/4/O1yfYy4gRkhzsXKee9njUcr6Vg
 rXzieiWEwChmATqoZcwYO7jtKa9FmnjZuBMf/OIQ5TR4gPtqrrdhomG5e
 OkQyFuQIz8QEOMnaoYK13mDbr0YFBudbBKS6WLSm55GFeJuzgk0c4CaY7
 cQ9HVXRJjwNr/LAtkBHLC6ZMMDZV7uM9AZ/hfXITMM6ItlVwhEiMvgIBk Q==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="168609982"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Jun 2022 16:29:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Jun 2022 16:29:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Jun 2022 16:29:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdKEEI561WzQorz2f0H/I4Nt6E8ROiqil5C2jecCUTkdLIc7KJ0rHWgjSfLCA+kDTDWxTi+FrfPDB2Vt6MEjRTcnUl3/0uYTvddYRyIp0LmKZiK1K1q+WNNdh2Mt3BRSdK8V0WVtKMyy59A/ResxDKa/6fGxdELxb9nilHY6k/kCylvP7iFbP9WJSpr+xn+6fWX57XIVof3+XLdyRG5mqSD86qJ/YQlQRLD36X91NjfX4JiGHbweOThu43zf+Jmi0lmRUjF6Myc84zMMvjOPRyfk21wLooANd5T182V5lLCgj5VGcmpeI8NVp1xAXkzyHs3JOpLL3dUvd8rlAcNtvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=he36OmG3GhUCkRBBpBgKnt756Nw+Dz8pa+ipwM3gjDQ=;
 b=aBcora8DIS5z5yqP9RAW/Zbi0E+eyeGjkusFNLhFonOB3l93U/Tv8u3mnDKfEYQQgWOW4/ttSAaH9NLYe8O9rYWrPZlojCMq49rOh36N9Rgz9prQ6yyfCe/r8D/VG5kumNUVTlH0LPRXzTBhY+liF5xxZmEbZR835UxdnQzwhSWOyGd8QP3iYQa9ZYDSPE4SEqhyNdaBxQGghbW9sSholUh5bod0KB/3O88FtJUtG0XOll6V5z415MPgTn6oIqsPIbsbTwoS7/Z4mV+fU/mimz6Hr4YPKZHItePcFmU+GOXZDu+ZvXqqwXCvYK0lhdcoChMpnJiSSqVqSlbJYSBbcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=he36OmG3GhUCkRBBpBgKnt756Nw+Dz8pa+ipwM3gjDQ=;
 b=dLva0nY1Z6zSpSc8XyEEDssBFeEY3KEZLuS6rhHtP7jmRPyjZNreB2uKT8qooocrzc8+QPPDS0Ng8mQfH/fizSDMUJ5jRbAIIn175CwE4NV2GfPPwUZJo1k1iL1GYj3bC+NI6If9Qy20g3s5rj6FDWfb9nsaBDcLz9O8gik7Gmk=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by DM6PR11MB4377.namprd11.prod.outlook.com (2603:10b6:5:1dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Fri, 17 Jun
 2022 23:29:10 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69%7]) with mapi id 15.20.5353.014; Fri, 17 Jun 2022
 23:29:10 +0000
From: <Conor.Dooley@microchip.com>
To: <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: delete ilitek,ili9341.txt
Thread-Topic: [PATCH] dt-bindings: display: delete ilitek,ili9341.txt
Thread-Index: AQHYgpKDJ/N/WVlrRUGJWE4JcFq48K1UPekAgAABCIA=
Date: Fri, 17 Jun 2022 23:29:10 +0000
Message-ID: <918da781-b7e6-ce95-7c71-a26f054a6b7d@microchip.com>
References: <20220617213706.376730-1-mail@conchuod.ie>
 <20220617232528.GA2628998-robh@kernel.org>
In-Reply-To: <20220617232528.GA2628998-robh@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d9337b8-4f12-4d9b-cc53-08da50b92e4f
x-ms-traffictypediagnostic: DM6PR11MB4377:EE_
x-microsoft-antispam-prvs: <DM6PR11MB4377D4DDFE2743E8168B2F4098AF9@DM6PR11MB4377.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BgRlfjBdm5iA6ZCVHhGqyEanfmhm0OMVeeQkc8IvdR8tcFe8vGRiovafKxARwo3UTXIYGTMmEIke6D6Z44NXht7ICplrHDWsMuJPjKVScXNpHmx483yqiua9TU0onVg/Mr5VCWQoU8N75kcCdxvH2twWONuFCKU9W5N1EX2dpJ9nn7yG2vsuOUWLNNuKUlLrua+9EKC0AD4C+uv0CJUWggDgJKdNZEdWgJ4RydDeVtkkv8AigTPMciJIB/Tclic6pttRIVa3JP49lPxnoHuW6MAPS7DBeZBQehAFObWvARfQ9JjPesR27od/MXHkB1nXG4byscbOPdCrHNOt+QK5d+VRFpI4wMv0IbU/xKgxydoFtcAIkjsruJ+VXVkzXg9w1uxsgwgK1GPm6lvgiA24caXHoAipUIfiqTmyg186+ORSeyKKOciYZZ35mb0EYV+cocs5NarlolWTsQhPztFli/xFSreBh3+osj/QGc+RDL+k3bUftlnR7o2MOh2XMowAXFnOUkXsTSvzbMG9n8Wg/EbdmIRUCUU2xpeM8kH5LBmkzy2Qx8RH9CdpfVYMJbNvMRgoeSGRl7CnPsG9glNf8nk6Gq31JB0pqHUOKLfzMkd2e+1gOPyAvEaQmKFBE6p+pMsvWfGVgMP5b02+Uyv6DXQ/SJQWuIbIL+djYUpf7TbWIYzCjO2Ho5T+OPDpjjTMBWXx+kBLUTs9Jzs8Z3/QKpHozjeIFOAtuOana8PrHro0hr2SqrKS3B5oblK3qnp6uOx71z1KAHsO6koDku5P6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5160.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(5660300002)(31686004)(38100700002)(6506007)(53546011)(83380400001)(54906003)(6486002)(38070700005)(8936002)(316002)(2906002)(66446008)(66476007)(186003)(36756003)(31696002)(64756008)(66556008)(6916009)(107886003)(26005)(6512007)(2616005)(66946007)(86362001)(498600001)(8676002)(76116006)(4326008)(122000001)(91956017)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3VCcFRxajF4cmJQNGdMRkN0bWNobHN1R2U3SmdMTC9PMmxOc3dOeTZveEIx?=
 =?utf-8?B?aDE0QzN0ZGpIWVg3bEgvL0V3UGp5dXhMeTZQVEg4bFRWZDhXMzJGK09EdEhO?=
 =?utf-8?B?NlhRdkNEOFp4T0xSdk9WMWxDWU4wWXhOY3A2aTRFK2JwVFBPLy96UURBT0RM?=
 =?utf-8?B?Q2d6bXdQRmppMjI1Z3JDQ1lzWWlySWliZjhsbEl4ZzNZYmt2bWZ3dlJheS9q?=
 =?utf-8?B?Ny9PWjl0TVdWY1VVejh1YUlTUDRLb0wydjI1VXF2NW0yWEtFcGgzNjhCRUc2?=
 =?utf-8?B?ZEl3OVhRNkxsU3FmY3dmWkJNVTJ0Q0NPa3pvc3F3QmtCSHZiNys1ZkQ5ckNK?=
 =?utf-8?B?N2l2aTQ1ZVhXV3lIdTFIazlBcGJZZzZaWG9iRGYzSDU5emQxTFNuNHJyVk9N?=
 =?utf-8?B?NEhLMHQxZlZrRWRlZ1BHeUo5RTJuZS90MHcvcElZaGhsMUw5cDZwdzlLcmRP?=
 =?utf-8?B?anhORWVkcDZ6S2Rya0xlUEpoL2sxWlRHZUZQU3ZxbnhKbmRacnFBbGZvbmZG?=
 =?utf-8?B?YkZQK2pLMWd3a29oVW82d2FtZ0swU3J0aHVROXE4WmloSitySlZnL2RTN3o3?=
 =?utf-8?B?ZlRvRXZWbmJIQUJpalZ5eTdESXBjQWdHdlBTamZuSW5ZMUNFM05Ja0Fsa1gw?=
 =?utf-8?B?Vmt4d1JWVHVFazRVZDB2T2NuOVpxOUJoMWswazBCV2czRDI4RFQ5b2sydlJO?=
 =?utf-8?B?cDhmc0pPK21MWWNzWmpaN0JpSVlEVy90U1Vha3hvUm1yNDlod1lTUTBLQ2NB?=
 =?utf-8?B?cVdJZzZlTm1lVHFKV3hObitwNnRxMVRDWHJrWFJ0MjROSUhBdmZGcGhkK1Bp?=
 =?utf-8?B?VTRmVmpzZkFxUVNNUmFlWll2YkJTRmU0cG5VeFQvYVA1VGNDeThiakplT050?=
 =?utf-8?B?Mml1TUZOWVJ2OWNUWUtmNno1YzhuN1c4ZUtwVHpUTkpIZjl0Y3Ivem5IM1Fs?=
 =?utf-8?B?TkFaVEE5MHJCNURmZGF4TlcvbmQrSlY3UytVRXRweUhBdFk1Y2ZGOVVEZW9z?=
 =?utf-8?B?SlZ2MjNOTGFnRHc3am5hSmM5T09uK2lKTXlTbjJOM1poeU5UUEhTSnRlWXRX?=
 =?utf-8?B?S3NZT2cxMDUzNFBTcWpoWWdkSEZsWXZVRXpRaXdqZW9haUZFOWExVlpTaEt5?=
 =?utf-8?B?aXgvK1duTTJueUF5TEI1UVh4RGw4bkJYOHU0b1UyWlVLL2pNaVF6Y0kyV0VW?=
 =?utf-8?B?MGZzRkRTU0NRK1VOQjJZMHVCRTZ3bHVoT2J3MnFaUWxSNEdEcGVud29wWE5U?=
 =?utf-8?B?aDhRZ3pSMFVRdjZValdhT2U3SkpXTC9CUUV4ZVlvM0VKaTBIRmtFazh5Q0Zn?=
 =?utf-8?B?SjloaTdkRHVBU1RSZk1HeVJMTnNRaGdrc29QdHgyRmptTkpHbXMwUVFLSWxp?=
 =?utf-8?B?Nnp2V1plMEN4eVROdFNSci9UWFNVcmtWanZoaGFmZ1EzR2JBdlh0N1RnNUQ5?=
 =?utf-8?B?VnVadzQ5N0d5TGdiMEpSQnRXTVpGZHB3aXRxd3QxSU41MUNLanhuT3YzZHRl?=
 =?utf-8?B?MWVCOE85K2piZlRpTjZhTEFDbks1bzBuTW11TDZxRmpueVRVblY1OXRIb29D?=
 =?utf-8?B?SUdQcmNZdWM0aDlId0xqTnF5T0VUeTdtaU8vSFNpMUhydWplenlPL0pjSVBO?=
 =?utf-8?B?MEFoVHp5U0h5emtOZTFScHMxSy9nc3gxejVxSlA1TEozWjhVSGdEdlVjQnBG?=
 =?utf-8?B?dktuUUhQQkQ5bnUyRkhKa3BraCtsZWxuSHpSNjh4UlZRRDVZdjJYR2ZWOGhY?=
 =?utf-8?B?T2dVMzkwNmlNdzhFaEdIUW9TOFR2M2pja1BHbmQ5Z1pjV3lQelAvelA5eHc2?=
 =?utf-8?B?NjhSRkRQTS82TVBodzcvV2ZqOTZYbU5XelNrcWdwSkFOVkFmRUlzYUFBRkJ5?=
 =?utf-8?B?TzBQVFpTN1A4ekUwTzJyK1dZNUtMZmRDQ2tQY0duQjdXNTY1MlpIVFRQWjJp?=
 =?utf-8?B?bktDU3ZzbW51bWFCdGk0YVZiaEwraVJHLzNqd0gzNEJZem9kSW9hcWdxSW9l?=
 =?utf-8?B?RmFBUDh4Q0RpUDg3elg0OXJCRmk3elBsbDhiL0xDZ2xLL1I2NkxEVENGNzZi?=
 =?utf-8?B?THZ3c2NLNFo1aHNXM09RbWxDcDRqSUJ3Q0c1MUlDakdJLzFReUh1ci9qYTBE?=
 =?utf-8?B?OTFRUEZHbHVMSWpCNGVDQ2ltdWkwRm0rMVVEV2JhZkJCVnZzTDljZkZKOG94?=
 =?utf-8?B?MXNlSEdYM1VKWmRzRmRZWTI0a3hYVTdMclRWaXFPZDgyQ3pkNlA5MEwzSXVP?=
 =?utf-8?B?dldFZHdsL1kyUHpiTUlFSUV6b3lmVmZGYXhubXNwVUJoUnM0dHB3bWZJT1N2?=
 =?utf-8?B?bFI2cURlU1lXem5neHlreGI3OXRKaGhZNjE1N09CVitYdUNiZGVvVnNBc0JC?=
 =?utf-8?Q?3Qcl+sJ7FmDpztIE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B307B6CB9BE5A49A8F5F7F26409306F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9337b8-4f12-4d9b-cc53-08da50b92e4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2022 23:29:10.1875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HYxaKYm23byL0taYy7SurrmVummpx8j2g+2VK9oYd1zYove1rqoIo8aglIB4NW8AJFHLp1m7baP0EdJdhfWmIQw74ipAxCMCEbJ7Gi5T0W4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4377
X-Mailman-Approved-At: Sat, 18 Jun 2022 06:16:44 +0000
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Conor.Dooley@microchip.com,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTgvMDYvMjAyMiAwMDoyNSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IE9uIEZyaSwgSnVuIDE3
LCAyMDIyIGF0IDEwOjM3OjA3UE0gKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToNCj4+IEZyb206
IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+Pg0KPj4gaWxpdGVr
LGlsaTkzNDEudHh0IHdhcyByZXBsYWNlZCBieSBpbGl0ZWssaWxpOTM0MS55YW1sIGJ1dCB0aGUg
dHh0DQo+IA0KPiBwYW5lbC9pbGl0ZWssaWxpOTM0MS55YW1sDQoNCipwZmYqLCB5ZS4gU29ycnkg
Zm9yIHNlbmRpbmcgeW91IG9uIHdhbGthYm91dCBmb3IgaXQuDQoNCj4gDQo+PiBiaW5kaW5nIHdh
cyBub3QgZGVsZXRlZC4gRG8gc28uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gIC4uLi9iaW5kaW5ncy9k
aXNwbGF5L2lsaXRlayxpbGk5MzQxLnR4dCAgICAgICB8IDI3IC0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4+ICAxIGZpbGUgY2hhbmdlZCwgMjcgZGVsZXRpb25zKC0pDQo+PiAgZGVsZXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2lsaXRlayxpbGk5
MzQxLnR4dA0KPj4NCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9pbGl0ZWssaWxpOTM0MS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9pbGl0ZWssaWxpOTM0MS50eHQNCj4+IGRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NA0KPj4gaW5kZXggMTY5YjMyZTRlZTRlLi4wMDAwMDAwMDAwMDANCj4+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2lsaXRlayxpbGk5MzQx
LnR4dA0KPj4gKysrIC9kZXYvbnVsbA0KPj4gQEAgLTEsMjcgKzAsMCBAQA0KPj4gLUlsaXRlayBJ
TEk5MzQxIGRpc3BsYXkgcGFuZWxzDQo+PiAtDQo+PiAtVGhpcyBiaW5kaW5nIGlzIGZvciBkaXNw
bGF5IHBhbmVscyB1c2luZyBhbiBJbGl0ZWsgSUxJOTM0MSBjb250cm9sbGVyIGluIFNQSQ0KPj4g
LW1vZGUuDQo+PiAtDQo+PiAtUmVxdWlyZWQgcHJvcGVydGllczoNCj4+IC0tIGNvbXBhdGlibGU6
CSJhZGFmcnVpdCx5eDI0MHF2MjkiLCAiaWxpdGVrLGlsaTkzNDEiDQo+IA0KPiAiYWRhZnJ1aXQs
eXgyNDBxdjI5IiBpcyBub3QgaW4gdGhlIHNjaGVtYS4NCg0KSSB3YXMgcGxhbm5pbmcgdG8gY2hh
bmdlIHRoZSBjb21wYXRpYmxlIGFueXdheSBpbiBteSBvdGhlciBzZXJpZXMsDQpJJ2xsIGFkZCB0
aGlzIGRlbGV0aW9uIHRvIHRoZSBzdGFydCBvZiB0aGF0IG9uZS4NCg0KPiANCj4+IC0tIGRjLWdw
aW9zOglEL0MgcGluDQo+PiAtLSByZXNldC1ncGlvczoJUmVzZXQgcGluDQo+IA0KPiBOZWl0aGVy
IGlzIHRoaXMuIEl0IGlzIGluIHBhbmVsLWNvbW1vbi55YW1sLCBidXQgJ3VuZXZhbHVhdGVkUHJv
cGVydGllcycgDQo+IG5lZWRzIHRvIGJlIHVzZWQgaW5zdGVhZCB0byBhbGxvdyBpdC4gT3IgYWRk
ICdyZXNldC1ncGlvczogdHJ1ZScuDQo+IA0KPj4gLQ0KPj4gLVRoZSBub2RlIGZvciB0aGlzIGRy
aXZlciBtdXN0IGJlIGEgY2hpbGQgbm9kZSBvZiBhIFNQSSBjb250cm9sbGVyLCBoZW5jZQ0KPj4g
LWFsbCBtYW5kYXRvcnkgcHJvcGVydGllcyBkZXNjcmliZWQgaW4gLi4vc3BpL3NwaS1idXMudHh0
IG11c3QgYmUgc3BlY2lmaWVkLg0KPj4gLQ0KPj4gLU9wdGlvbmFsIHByb3BlcnRpZXM6DQo+PiAt
LSByb3RhdGlvbjoJcGFuZWwgcm90YXRpb24gaW4gZGVncmVlcyBjb3VudGVyIGNsb2Nrd2lzZSAo
MCw5MCwxODAsMjcwKQ0KPj4gLS0gYmFja2xpZ2h0OglwaGFuZGxlIG9mIHRoZSBiYWNrbGlnaHQg
ZGV2aWNlIGF0dGFjaGVkIHRvIHRoZSBwYW5lbA0KPj4gLQ0KPj4gLUV4YW1wbGU6DQo+PiAtCWRp
c3BsYXlAMHsNCj4+IC0JCWNvbXBhdGlibGUgPSAiYWRhZnJ1aXQseXgyNDBxdjI5IiwgImlsaXRl
ayxpbGk5MzQxIjsNCj4+IC0JCXJlZyA9IDwwPjsNCj4+IC0JCXNwaS1tYXgtZnJlcXVlbmN5ID0g
PDMyMDAwMDAwPjsNCj4+IC0JCWRjLWdwaW9zID0gPCZncGlvMCA5IEdQSU9fQUNUSVZFX0hJR0g+
Ow0KPj4gLQkJcmVzZXQtZ3Bpb3MgPSA8JmdwaW8wIDggR1BJT19BQ1RJVkVfSElHSD47DQo+PiAt
CQlyb3RhdGlvbiA9IDwyNzA+Ow0KPj4gLQkJYmFja2xpZ2h0ID0gPCZiYWNrbGlnaHQ+Ow0KPj4g
LQl9Ow0KPj4gLS0gDQo+PiAyLjM2LjENCj4+DQo+Pg0K
