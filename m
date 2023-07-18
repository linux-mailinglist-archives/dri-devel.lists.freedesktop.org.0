Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3B6757A87
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 13:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A1A10E166;
	Tue, 18 Jul 2023 11:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C558710E166
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 11:36:29 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36I802Hn010417; Tue, 18 Jul 2023 12:35:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=VjPw17ABUUV+z1jMGrh2P68uvZeLkhuYZtyq1G87jLM=; b=
 W/LGnVH5S+VgI9cucEx/nNxBYxnlFBChgmBNDj897Oa+S7Clyy63YLTMMuEucIU2
 XO/FtrsTRqcAH9XDyt5AIeYvC+kPzeXaVaSAFpeVzXCjuQAiT+SEcxsdfSSqDV+7
 qXJxy7WBBLU2PM/j4G/ByfIiFKuulNVOk8D6nZrA9Ak2fmLQdz+Ytq26b4oG5fR1
 FNlPdlEmos0Eddjfvdm3AES3qLmbm0JM44/RpJvaiWCrOg0XSpXY5Juqku37DHFh
 tsY12OlshLr5+wnucuFDty3KLKucoXjBSKY2OLXLSrb6Tm9RluT18N3k8dJzL4VN
 fEiIk2h993f+dYp6IT18Mg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3rutcx219c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 18 Jul 2023 12:35:57 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 12:35:57 +0100
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (104.47.20.58) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Tue, 18 Jul 2023 12:35:57 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bM7yxyQiIed7L013q4phnfcyGgFrJpZMBZyP7EktGzI4OhTxCmor80kJwr55MT8/DPIqbVVdC8uPwwP9CvJriViHfgzzLU635fVzA/qInZfut3c53XzOIhowd9KgOtjLoanuNn9OaHyyzCfhyZO1CRDUa4BAUGXpNXQMdLj956yPOe7zRWgX6mUMFcv+mz2/E/yozW4hE+2bDtAsi1IX+N+DhZ8eb90BpY17bS9UNs3xjOxNul+VM5VWtO2BUZzg/08brnT+v0VSaamSL/+5iU0U/rsq0O6wCDOFAfRnzPViAr1teYy41nPGfU46xpBeLT1xFSV9dJ2WwoE9bs9hkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjPw17ABUUV+z1jMGrh2P68uvZeLkhuYZtyq1G87jLM=;
 b=I4tzXNQUjLcRM9ttYHo3zwfENI9Z7Bqi6cnV4WT9GDESy/SfuRiWcMSdGg6PE2i0qJsdr5vFl/5+NXyHK2Fz7ubiklhqoBCMuGSBTJm6TdAVbUCKvrzUPNLZnCfJH7xF3Wn6ZsQaHL51Pwyr6GUMxZl/pdCQDtiHCHF62encJhtK3NR/VhdjAuwtBSnyppY/5KC5IdKsyDji4jVoscZ6uSAI8aI528YpsyBxlqIxkGFWxb3UtRE4oSiooDx6Qa+ndqosfT19YV59IgnuZiKyiyTbSH02kIlo5ixzioNb59h2boEBNua1kRIvjCoZVCKdclb4Pz0/9KqCtr1SUemqsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjPw17ABUUV+z1jMGrh2P68uvZeLkhuYZtyq1G87jLM=;
 b=G2QcJvVFwIedu49/wGOggY4OYgfArWM+DbLcromMFJfdaE9ID3bRbIINojYvYO+UiYKbfrqaNy8NDh++ur2RxR27Wtnm0bdyCyGBNXmMR6lhk00tiY77IBOdcVL1fkYnwvrjRJKfKg72ymcHpWVjY2HBbnzbamf0wnM01LFHsBY=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by LNXP265MB2425.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:130::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 11:35:21 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1871:e3c9:b5a7:a740]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1871:e3c9:b5a7:a740%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 11:32:16 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>, "Sarah
 Walker" <Sarah.Walker@imgtec.com>
Subject: Re: Re: [PATCH v4 02/17] dt-bindings: gpu: Add Imagination
 Technologies PowerVR GPU
Thread-Topic: Re: [PATCH v4 02/17] dt-bindings: gpu: Add Imagination
 Technologies PowerVR GPU
Thread-Index: AQHZuWuBCZHBbFY4BUi2pDr/v9ojZQ==
Date: Tue, 18 Jul 2023 11:32:16 +0000
Message-ID: <6eeccb26e09aad67fb30ffcd523c793a43c79c2a.camel@imgtec.com>
References: <20230714142526.111569-1-sarah.walker@imgtec.com>
 <19a7dae4-a9bd-187f-49f8-fe9c47f44eff@linaro.org>
In-Reply-To: <19a7dae4-a9bd-187f-49f8-fe9c47f44eff@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|LNXP265MB2425:EE_
x-ms-office365-filtering-correlation-id: e7aa6ba9-a0df-428d-61fb-08db8782a390
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fFZsUy/D82xeLFvQE2c6Z7zYn3uOcgqdX5dA5q5MPUDoet93DRx7IOw7I2lIH3idzfCYRNj4BGF9bkqTTIhV2GeqktFyLisEvny75B04SkVJPZoKTfqnjG1VLA60P5aypCOZhBOkSueCp4qrI+Gpvtkm/ocjcXQxrUo6YcDvwSM3sAuqg+4ac5uas9T62FT4sRARhljegaHtsvJhK4RGEUGTO42r+Jl75sxFMIlWpU04cW1v5lfoD5Hr5zivmYoC/dHTtWHDmMj8hH988nSvES24x/UC9MCc+gUfbpoVG6Oerl2MYYx0COUyXNvlr7mJ5oh6pMGEpVQcZTyPUqZFwoSVir+mFWMnhqK/wFe5Q5L0h2Sa7K9PX1VgXNS/QQ75ylDQlsDr9ma8Ko+rXGrmr/8wXXSOwpthjxlV0tdGABsJ0qnYNc8JaqiqGqAZrgZnyEnpb7ElzYs0eaEelTXPGDW8Ly6rH3WSLIS1yKW+c7cYkKKCHTzCxZcoeWDdsMxHopwLLkbV/3ul0RfB+AuWWh5EovsqsSPtkrJJQvazky48rODJ4TcN0x048GALalUBOG1e+6K7FSZL0ElJDtktgqx/jnQR8RWSHspz0QBHnbndBNBfKEaHL8MK6yk4aa2l
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(376002)(39850400004)(346002)(451199021)(6512007)(6506007)(53546011)(26005)(38100700002)(36756003)(110136005)(54906003)(38070700005)(122000001)(5660300002)(8936002)(8676002)(7416002)(2906002)(4326008)(6636002)(316002)(76116006)(64756008)(66446008)(66476007)(66556008)(86362001)(66946007)(41300700001)(6486002)(71200400001)(478600001)(2616005)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3FtZExibVFrNExCZDVhYmQxdWEzT2lrRkJoT2dYUkZhQTlZbGswM09QTVlM?=
 =?utf-8?B?ZzRQZ01WN0JwbGFTN00rWFAwTlUxZkwwSjRDcS82YW55T2RKcjMzZVRBaE52?=
 =?utf-8?B?WGpmSDVnZ3Z5OTFrc3FIMlRBSXYvVHBBcGNIeVZRU1d1T09kSUJvMXNrQ3ll?=
 =?utf-8?B?SUdqOHlHT2pGdDE5c1ZwYUwvK0FtN21RdkxUWnFNcERwSEJlRDFTUFBraEZj?=
 =?utf-8?B?OEJNYnFiQWZIVlpUdHp6aXZZdnpGSG1KUlMvUy82RW44ZjV3TGtCMTFYc1A0?=
 =?utf-8?B?U0pXQ1psRjNhL3QyRUVValVPc3drSFhHRkRaTDRKVE05UGE3NWdRVGxyRDRV?=
 =?utf-8?B?OHFXdmRiWTNIUGFqT2w3S0ZtNkc2MmZjNEJORnBIVExUWnRaei9EZ0l6L1VF?=
 =?utf-8?B?WitFZi9JellqQzR0c09pR3ZXaSs3RWt5am1jV2tDZ24rUkpXendTblcyOFg5?=
 =?utf-8?B?QWRKR3RpNERDSS9CQm9EelJ4YTdLSmEyNkNkMjVPRFdSMUVUcDhhTFdEd21l?=
 =?utf-8?B?S3h6c1ZsR0dsQS9YR1VVTmZUMDZ4SGlWczdXREhmLzAxVGx5WEVmUWZxTzNn?=
 =?utf-8?B?WWdhclpQci91NjhGaUI4b3RrazR4TFNpcUpJanIvdFBsYzU0SHJxN25acnlt?=
 =?utf-8?B?RXR0VEYvbGJjNXlLa0YwR2hlSVBJS1RJdzhQZFBLbVpqVzdNV3F4SGV0WW1U?=
 =?utf-8?B?b1l0SFdyTXhLUkJTWVlyeEZYQ0FKNTJRcVZOQUdWSExVUkVZeUtWQk5yTmxT?=
 =?utf-8?B?TjNKN050UTZ0QmhtaGF2SmYzdndUc0pTTHZFSGhxcUtyT0pOMUNiS09aV1Ji?=
 =?utf-8?B?Z2VkaUovSXZUQ2pTV1dlMHJ5cmdiMENSMWtweCttMERJK2lCWHRDM3UwWGFI?=
 =?utf-8?B?MFlacWZua281V1k5Q3R4c0pMT3RWY0NHS1kyWnlpb2ZMKzJ2UXJxMzJ2RWxQ?=
 =?utf-8?B?WFJqZnROQWVreGpNcU1yWEJOTENqTWlWTjMyaHhqVHVldU9tQnYzeTA3bGRH?=
 =?utf-8?B?Mm9LNkVGd1FYdm1PRm56VEZCSzRMOU1NZzJVS0hVSHhkY28yZTJSQUNjQmlz?=
 =?utf-8?B?SG10WGxYVlRuTitSMDVES0FxdlEwS1p0Mmd5SVkrYTJOYjE0ODk5eHVBYldJ?=
 =?utf-8?B?bmlqODJiL3EyTXdLNzVhUjFNMmh3OHZDQmMrbmNaLzdWOHErT096MUh4eWs3?=
 =?utf-8?B?S2hjU3Q3T3lhdGJYQ1lTb2FxbDIxZE9KclhzeXRqeXlMV2VSbVR6dkRDUnNO?=
 =?utf-8?B?WG52MFErb0RQNUF4Q3ZvVnBidFB0Y0ljMHNBVk1LN1llY21kVGlzY1Fub21h?=
 =?utf-8?B?OU1abWdQRWtlRXBNTllFLzg1ZFVlc0ZwV0dJMTZYYUFXSVhRTnhoWEVzV1E4?=
 =?utf-8?B?WkVrNEYwdDJoSHVhTVhxTnNWWU9xQzVhRExnTDRkbWMwRFBHQXpEcElPNndH?=
 =?utf-8?B?QTJwRGNqTTFJLzhpWU1QcGdOWFUvZWVSb1pQM0xxVW1sL2h6SGxUWlBtWGly?=
 =?utf-8?B?K1U4TUUxQlR6NlI2KytlQWU2YUEybk9rTFlwMDlNOXhlb28yR1g4b2pwWjY1?=
 =?utf-8?B?YWhORzN0eEx2a0hHZEhGeGFLL3Qrc3lrTitueENrRFpzblNWc1JZNmR5R2Zt?=
 =?utf-8?B?dkJ4M1VzRWluZ2NXS3VkaTFnY2k1a2JYTkF6Mk1ZQWNzc243YzFnT1VNSUZy?=
 =?utf-8?B?QklTcEhmRWkvKzVOSDlIYVZWNmZZdWM2L01oV3V2S0ppQjErcXR1VkwvN2Jw?=
 =?utf-8?B?cjF3RTFlMyswVEFxd3A5bE9DZFJVRzNlcnVCYldicFFtVnZlQWdxcEdPRnF5?=
 =?utf-8?B?VG8rTldWOGpDZUdycFdTeWlTbld3Vll2TWxNZHg1dnJTWlFiVk1lcXZXVEpB?=
 =?utf-8?B?RGdIdER2MVAxM1pEZ2VGT1ptdnZOS1ZpbWRGcGlIRS93NDhvdGpiTnBVS1pO?=
 =?utf-8?B?b1MvSVZ0MDdySkhRK25iT1JmRWtJamVqYjNyaDBITFIxeG5DbzRQWkhLSnZ2?=
 =?utf-8?B?a2k3dU45ZlovV3BjMkdEa1NwTkVXY2t6Q2ZZL0ttemU5VkdQRDh1aVF6cEZW?=
 =?utf-8?B?dHBZU0xHeTVUdTlxRzJjdmF3TjdMWmU2Y1BOSkZxNXQ1Y1hjYXg1ZHdmeVgy?=
 =?utf-8?B?VDJ3ZDdvK3Bqd003ZHRzK2NvWjJCOW9ucitBOVROZDRZdktZaFB0R0QxZ0p3?=
 =?utf-8?B?WWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F255F04C39EE148B7D3BF430ED5343F@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e7aa6ba9-a0df-428d-61fb-08db8782a390
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 11:32:16.2216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bqnmYhKu4YXchMxtX09Q6RjLTdt8XNkyfeGqNH1EStM1+azeOGQuxojeTAc7lGmNh8mkh5Xtxegu4uozUCEKyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2425
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: eGI2ODiKPq4O8yTdqLFTZvDqfGII220c
X-Proofpoint-ORIG-GUID: eGI2ODiKPq4O8yTdqLFTZvDqfGII220c
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
 "dakr@redhat.com" <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLA0KDQpPbiBNb24sIDIwMjMtMDctMTcgYXQgMDk6MjkgKzAyMDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDE0LzA3LzIwMjMgMTY6MjUsIFNhcmFoIFdhbGtl
ciB3cm90ZToNCj4gPiBBZGQgdGhlIGRldmljZSB0cmVlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBm
b3IgdGhlIFNlcmllcyBBWEUgR1BVIHVzZWQgaW4NCj4gPiBUSSBBTTYyIFNvQ3MuDQo+ID4gDQo+
IA0KPiAuLi4NCj4gDQo+ID4gKw0KPiA+ICsgIGNsb2NrczoNCj4gPiArICAgIG1pbkl0ZW1zOiAx
DQo+ID4gKyAgICBtYXhJdGVtczogMw0KPiA+ICsNCj4gPiArICBjbG9jay1uYW1lczoNCj4gPiAr
ICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGNvbnN0OiBjb3JlDQo+ID4gKyAgICAgIC0gY29uc3Q6
IG1lbQ0KPiA+ICsgICAgICAtIGNvbnN0OiBzeXMNCj4gPiArICAgIG1pbkl0ZW1zOiAxDQo+IA0K
PiBXaHkgY2xvY2tzIGZvciB0aGlzIGRldmljZSB2YXJ5PyBUaGF0J3MgcmVhbGx5IHVudXN1YWwg
dG8gaGF2ZSBhIFNvQyBJUA0KPiBibG9jayB3aGljaCBjYW4gaGF2ZSBhIGNsb2NrIHBoeXNpY2Fs
bHkgZGlzY29ubmVjdGVkLCBkZXBlbmRpbmcgb24gdGhlDQo+IGJvYXJkIChub3QgU29DISkuDQoN
CkJ5IGRlZmF1bHQsIHRoaXMgR1BVIElQIChTZXJpZXMgQVhFKSBvcGVyYXRlcyBvbiBhIHNpbmds
ZSBjbG9jayAodGhlIGNvcmUNCmNsb2NrKSwgYnV0IHRoZSBTb0MgdmVuZG9yIGNhbiBjaG9vc2Ug
YXQgSVAgaW50ZWdyYXRpb24gdGltZSB0byBydW4gdGhlIG1lbW9yeQ0KYW5kIFNvQyBpbnRlcmZh
Y2VzIG9uIHNlcGFyYXRlIGNsb2NrcyAobWVtIGFuZCBzeXMgY2xvY2tzIHJlc3BlY3RpdmVseSku
IFdlIGFsc28NCmhhdmUgSVAsIHN1Y2ggYXMgdGhlIFNlcmllcyA2WFQsIHRoYXQgcmVxdWlyZXMg
YWxsIDMgY2xvY2tzLg0KDQpTbyB0aGUgc2l0dWF0aW9uIGhlcmUgaXMgdGhhdCBTZXJpZXMgQVhF
IG1heSBoYXZlIDEgb3IgMyBjbG9ja3MsIGJ1dCB0aGUgVEkNCmltcGxlbWVudGF0aW9uIGJlaW5n
IGFkZGVkIG9ubHkgaGFzIDEuDQoNCkkgZ3Vlc3Mgd2UgbmVlZCB0byBhZGQgc29tZXRoaW5nIGxp
a2U6DQoNCiAgYWxsT2Y6DQogICAgLSBpZjoNCiAgICAgICAgcHJvcGVydGllczoNCiAgICAgICAg
ICBjb21wYXRpYmxlOg0KICAgICAgICAgICAgY29udGFpbnM6DQogICAgICAgICAgICAgIGNvbnN0
OiB0aSxhbTYyLWdwdQ0KICAgICAgdGhlbjoNCiAgICAgICAgcHJvcGVydGllczoNCiAgICAgICAg
ICBjbG9ja3M6DQogICAgICAgICAgICBtYXhJdGVtczogMQ0KDQpPciBzaG91bGQgd2UgYmUgZG9p
bmcgc29tZXRoaW5nIGVsc2U/DQoNClRoYW5rcw0KRnJhbmsNCg0KPiANCj4gDQo+IEJlc3QgcmVn
YXJkcywNCj4gS3J6eXN6dG9mDQo+IA0K
