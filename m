Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F14FF757AF2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 13:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648D910E320;
	Tue, 18 Jul 2023 11:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BBE10E320
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 11:53:39 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36I6qbsL004219; Tue, 18 Jul 2023 12:53:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=1wttVJSG+0FFUavdBY6tlCC52VvLIh7h2ayQ//JrtZQ=; b=
 K/w3rVHkxFPJ6BL3VUNbOS7KGYQzFdhq3y3uMxtGfWPfXhyXcFVOJIyLA8FiWRza
 3Gr7RHWVf/V0rCHSPot32YaWdTaYhJsxg3m972IeQGXE2LQ3E6B7W/X0hpDxSesi
 8BpWexa2VIcI/QgYpl0D81WeivVYHV1Cii1goCtchnyV293xgCaf5Eprhpbvhhlo
 LyCdE6XjrtN7jvHd4+yer85ZLXiQ4Ir9wL0snePchZPLBlspk7lcc6hEi4sp7y/M
 NuzBLpClwrUHjsZyCwcAOmXd9VKSjcuHV9i5vVZtoRRSqbC0d57aq4OV6KrbHKPI
 ArRWv8EalrUQ2zngwaMhHA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3rutdrt28p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 18 Jul 2023 12:53:22 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 12:53:21 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.53) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Tue, 18 Jul 2023 12:53:21 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqyEylGGsNQnRGGSk0hKSSP1BXqfq7EFf6huiz7Q4M1oyRC01tW95/T+Hh1bEATRFsP0EBqIKMxV5+rJ33QPBDwI4F18/ykfUJAkpxLOdxpwowlJrjFIEpjpVSrmmV7/mBMb2+HTdn6Fr5SyEg0J3WfkkgNLV3FL/vrasTu8eoGGkU/HbeFmVHJUNODhJRwStx7pnb/DIhHjkbNTwmx6fjvZblsN5VG+clcmBnaUp0U/HflUKrRmoRDesP5CU07tvcFpcBl4NZfLCpbuP0dmXzw1Tgxkrxmsht5tShh8HFg6y/060QVF6ZiSUmJxUHRRUDga8lmJE1LG37twdOiPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wttVJSG+0FFUavdBY6tlCC52VvLIh7h2ayQ//JrtZQ=;
 b=m9wfz8es+CNe7c5lPhLPlmhMu5/OjHucakwlpbbNZnq2MKSOb7zdKJ0THsrItvP5PD0pYmK/7TpamPpoZdggIN7g0JDHZzjD3WlVk9kyWgbo28Laki2dCLu6gldEPUZ4riTygCYTGBL/GBIdzpY3SXbJT57wxvxtiOBOtVt8a3XHPxZNviAVkkPei5rUOzJxXYOC/OSWOANEfyRYLOKMCiWIGsty2LwJYYAd04bTejmBtQ2Pb43mZSkf6B1SK4zoPRpXStbrd/2PvHkHCW/3D9pmPJOfM8QasQdF0+dgWXwkkhS/qUxiHts88M+5Ci61gRcBMc3930bXFffKJRyhxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wttVJSG+0FFUavdBY6tlCC52VvLIh7h2ayQ//JrtZQ=;
 b=cuFWArURMVyxLH5jJZL0Ivfr6dJONM6Le/7kqF5ja+PGJWmN2KCUgVPTnn0lurbtvK6JuMDGS2gztTHBGTul3gs2hIcnZ/HdW/XrGUKQeQHX77qQ3V8kF4n37+NnSoyZG4qksolrJxrjKdIsuS3ir0fFw+09RIBsveBsbdEuV1o=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWXP265MB5323.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1bc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 11:53:08 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1871:e3c9:b5a7:a740]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1871:e3c9:b5a7:a740%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 11:52:49 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Sarah Walker" <Sarah.Walker@imgtec.com>,
 "krzk@kernel.org" <krzk@kernel.org>
Subject: Re: [PATCH v4 17/17] arm64: dts: ti: k3-am62-main: Add GPU device
 node [DO NOT MERGE]
Thread-Topic: [PATCH v4 17/17] arm64: dts: ti: k3-am62-main: Add GPU device
 node [DO NOT MERGE]
Thread-Index: AQHZtl/GetvnNok9UUiN8VrdGYJPPa+/EvwAgABdAgA=
Date: Tue, 18 Jul 2023 11:52:49 +0000
Message-ID: <badd58d7db5f7fcc8a0182cb870f25ec47d7e9e6.camel@imgtec.com>
References: <20230714143033.112624-1-sarah.walker@imgtec.com>
 <de9ebb36-d0e9-3ec1-92ff-d9b3d4b2fedc@kernel.org>
In-Reply-To: <de9ebb36-d0e9-3ec1-92ff-d9b3d4b2fedc@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWXP265MB5323:EE_
x-ms-office365-filtering-correlation-id: 29f1f267-5cc9-4e29-50f7-08db87858280
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fpMQgw9dUtB6VzPwGLP5mxQuFKlJ/WvVj+OIqkc9G57RD4TYJCpmyb6PlXNC45/mL/KFi5gzkzMz2thDR/xMhhWf+11L+XIpsM7UjxGxIaq0PRRibucrJNCanBdQOyV/DM15rWjoY0loALLfiIyP6vtS6Wjc3l2rz8IG4dBuIV0ukmgIZlX4F6H3Hj1JdQ6UxV7bWsCX2cWrNuKlHNIu0ugTG+x1mH8vJVUC6AoW1qDCI6qJAg+lyxghwE3aTzlgMMaWAYDX9Z3W8mR+zatZvMt/3FImYQ7YiCFRIO72IpxfGN825M77XX84OHFgmIqGLpDOkABKrMzGgdnJi1jbWEZQgBYS3RqRYttWFLEJo695hyYvIyFBXq2P1tDzR1cLP9sF9k4hk4rNOMllI/Pkt7ZdnvoWZ5lfb+i+rdbmz2u9ZJ3bsxAEX/eEr6GSd0PiP4VB0QEbINP8YsXzVr4IpGRcBNBRhC7tKC4Zqs5uHYh4ETvoQ6LVDUdztz0PFX/RDvrcNLvz+Jd6ayaAH99h1EwK4M4IqJz6KdSqswd3X/aITyJdXqU6AJupspfhidvo4arbXwMpYBEiSyN9uZtIKr5PE0nGIWLUJ46MkOOlsQA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39850400004)(136003)(396003)(366004)(346002)(451199021)(8936002)(8676002)(41300700001)(66476007)(66556008)(64756008)(66446008)(66946007)(966005)(6512007)(6486002)(316002)(76116006)(4326008)(5660300002)(7416002)(110136005)(54906003)(122000001)(71200400001)(36756003)(2906002)(478600001)(83380400001)(26005)(53546011)(6506007)(38070700005)(2616005)(38100700002)(86362001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V20rcHFoTHBGN1lDUFI3Tm1EdC9Sa0RlVk5kbjhRZmVzTldzemR3OC94bXJI?=
 =?utf-8?B?enR3dGhzUnVjcXEyMjZwRFBYbXFRaFppand4ZU0yUWFUVmVoQlRRVEFKTG9L?=
 =?utf-8?B?QmFFOG1acnBtQUdRL3VoMDAxQjVOYThtYytxOUxEV2xpblBRQWVzRGtGclBq?=
 =?utf-8?B?c3FNdkVhQ1hXcG9uUHRxV0cyTi84bTZ0czJ1L1F3YUQzc3FBNGFKZkN5eHZH?=
 =?utf-8?B?YUd4WXc1dTZsM09QSWxrVGc0VUdOckFVMTdYcCtkTCtqYVczd2tHLzdjbFdU?=
 =?utf-8?B?NW5ObjZhOFpmMUpVa3pHWTdRTW5EWTNJdnJNVFdvUGx5Y1lmU21GUERPRW9L?=
 =?utf-8?B?UC84ZFFVK0FuM05JMERWdTdPem40empUZDJpMHJGaitpY09FNnBiSmxwdDBH?=
 =?utf-8?B?YUtMRGhrUjhDNWdmb0tSam8wNHBaQ2g4ZkNBWkJtbDZST3d0MEVac0VxUFJH?=
 =?utf-8?B?dUhISGRzRFRqNVpFSTBBYXFVeXRiNEdUdU5uMWZwQXRUV2xXd1lWUVk0YnBH?=
 =?utf-8?B?UU45VTNrbVNabnhHWXFZMDlIVmRIUGpJZUVoTkZtaDk5YnRHbDd1UkczQ2Fk?=
 =?utf-8?B?SmFoRTZCNHlzT0lNSFBBSmhGREIwRmNjeXFQL2tFeUY1V0NFOG1YczBrYkRo?=
 =?utf-8?B?aitnMW9oUnJUTURQQTJHdVczQXR4c3ozeFl6T3dPR0NyeEdscldKYWVQb3M1?=
 =?utf-8?B?WUVrbVRzR3BEb0hvdGdzeDBLUW9Rd2xIKzA1dHNYMitXTWtDMXVqZTBLMTBC?=
 =?utf-8?B?V0orR2xMdWpUR3JpcW1qcFhFbVhDWTN4bVd3RmRET25RK2NvTkx0TzhLV0Za?=
 =?utf-8?B?TktXb1I1MFkxdEhhNW53dlk3TTBXWVNoY3l4Y0twZnZ6anowbmdidnhHVVFJ?=
 =?utf-8?B?MVZNNzZHVTBzOVJUeHFQUXBoRHoreDJqaEFhNndDR1dvbG5aYTVpc1VtNzRq?=
 =?utf-8?B?YmpBbzVmQ0NHSlNXZEhBbW9nSkxzbDllSGN0TEZkanJ1MUNHb0ovd3o1amFv?=
 =?utf-8?B?ejVIb0UwRVMyUU1Yc2M4WHdvN2JxclZ5cS9WUm9rY1kzY21lS0ZmZzFubysr?=
 =?utf-8?B?SnVQRE1aWGJxaEJ0QTMzVXlMUEVuV1NNOXR2QlRaamRYdjlyYk96UGgyTzFh?=
 =?utf-8?B?UHlWRHVSd2MvY21QVVNlM0xTejZFNE03U251WWZldTdXMDhnUUJVOE12YlVz?=
 =?utf-8?B?all4UWZKbnJMTWZaa05rMG9iN2xoZVNKTE1PRHlYdW9VbEN2NE91eXNFVUNL?=
 =?utf-8?B?bUpsYW0yKzA1ZFVGOVN6cWZXMTVNSmhrYTNGa0U1aGtiT3Q2MU9uUnpIa0ZU?=
 =?utf-8?B?S3RqZHdDU1BTRE0zM0pGdVd1dmQwQnF4TjNJY3NSanlsRTh6L0czZ3NvRmFr?=
 =?utf-8?B?Q1VURVhtQ2Z1V0JpWGVSWFpPSEFqMGUwMjAzREMwRTl6eGJ2bDVKSnZ2cDVi?=
 =?utf-8?B?Vk16U0Nmb0VwRElyOE50bzZhTjdQRlFMcUc1T0dsaFM0WjZPd2prL2Y5RWhT?=
 =?utf-8?B?Z0pmcmJPOWU3alkyZXFxSWM3SGNLU1ZsZ2d6VHAvcy8zOHh5cXZ3OVNnaTgz?=
 =?utf-8?B?YSt2V25GaHVpUG50UWc2a1dUSys5UnFmQ2xvWi9ueGpROWxtREdiQTJVMG5l?=
 =?utf-8?B?S3RqbE1aRkp4TW9TTi9Ja0VPaG40enpWYTZjdTVyUEJnQVpZbE53YmZKWTRv?=
 =?utf-8?B?cDlTQWZaZ2M3OHo0dk1Zb0k3dHFaM0dzTEFZZExxMElMSm91VStBdHV1OVJa?=
 =?utf-8?B?VndVN1lBb2p0YzVNdDJaMUhMWnlZanUvTGljQ2t3V2pSbUxhaHFHYUVBdk5G?=
 =?utf-8?B?KzV6eU1ZemZNNU9sbTRaYVNlOS9ObUdFcGFOenBUbTZLRGtYZ0E3TWtPNHlH?=
 =?utf-8?B?L0R5MUtsSmhpRk5IZldBWnh3WGtQTVJoWU5GYk9acFluTHJuYUNEVWgrOHBJ?=
 =?utf-8?B?RW15SXl2UU10WEgyWkpVVlNmWko2V2grVi9FbFkxdjA5OHpRT0FyL3BGZ3Q4?=
 =?utf-8?B?SGJYWC9QYlZFY29MelNiVlVJdEVBNmNGNko5ZnlueDBJM09zdVQrSG0vTStT?=
 =?utf-8?B?bFBGdDlHbFFqdjNFNERycDlydSs1citjSzBsL3dsZzFOdW1lcFlTQnJHNkhE?=
 =?utf-8?B?akt2WHJYbUhNcndPQTJudWJsUS9XdDRmVEw4YjUxQkhpRDM5dzkzVWd6Z1Ft?=
 =?utf-8?B?bGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2BFCEBAE6FC4FA4D82332018AF485CD0@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f1f267-5cc9-4e29-50f7-08db87858280
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 11:52:49.2902 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NqtB3O92XPPSw36LuDtzkISbfWudGEH/eKw8Sf0aiyKUqZU0v5aXcz7qZd4RtQQbrRR9LeWL86dR87u1Zkgj2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5323
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: 2X15p3E5qja1mpCmkGnUtAWahWIBgk1U
X-Proofpoint-ORIG-GUID: 2X15p3E5qja1mpCmkGnUtAWahWIBgk1U
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
 "hns@goldelico.com" <hns@goldelico.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>, "afd@ti.com" <afd@ti.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLA0KDQpPbiBUdWUsIDIwMjMtMDctMTggYXQgMDg6MTkgKzAyMDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDE0LzA3LzIwMjMgMTY6MzAsIFNhcmFoIFdhbGtl
ciB3cm90ZToNCj4gPiBBZGQgdGhlIFNlcmllcyBBWEUgR1BVIG5vZGUgdG8gdGhlIEFNNjIgZGV2
aWNlIHRyZWUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogU2FyYWggV2Fsa2VyIDxzYXJhaC53
YWxrZXJAaW1ndGVjLmNvbT4NCj4gPiAtLS0NCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy90aS9r
My1hbTYyLW1haW4uZHRzaSB8IDEzICsrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDEzIGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290
L2R0cy90aS9rMy1hbTYyLW1haW4uZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvdGkvazMtYW02
Mi1tYWluLmR0c2kNCj4gPiBpbmRleCBiM2U0ODU3YmJiZTQuLmFkMTM0MTRhY2YxOCAxMDA2NDQN
Cj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3RpL2szLWFtNjItbWFpbi5kdHNpDQo+ID4g
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy90aS9rMy1hbTYyLW1haW4uZHRzaQ0KPiA+IEBAIC04
OTIsNCArODkyLDE3IEBAIG1jYXNwMjogYXVkaW8tY29udHJvbGxlckAyYjIwMDAwIHsNCj4gPiAg
CQlwb3dlci1kb21haW5zID0gPCZrM19wZHMgMTkyIFRJX1NDSV9QRF9FWENMVVNJVkU+Ow0KPiA+
ICAJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gIAl9Ow0KPiA+ICsNCj4gPiArICAgICAgICBn
cHU6IGdwdUBmZDAwMDAwIHsNCj4gPiArICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGks
YW02Mi1ncHUiLCAiaW1nLHBvd2VydnItc2VyaWVzYXhlIjsNCj4gPiArICAgICAgICAgICAgICAg
IHJlZyA9IDwwIDB4MGZkMDAwMDAgMCAweDIwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgIHBv
d2VyLWRvbWFpbnMgPSA8JmszX3BkcyAxODcgVElfU0NJX1BEX0VYQ0xVU0lWRT47DQo+ID4gKyAg
ICAgICAgICAgICAgICBjbG9ja3MgPSA8JmszX2Nsa3MgMTg3IDA+Ow0KPiA+ICsgICAgICAgICAg
ICAgICAgY2xvY2stbmFtZXMgPSAiY29yZSI7DQo+ID4gKyAgICAgICAgICAgICAgICBpbnRlcnJ1
cHRzID0gPEdJQ19TUEkgODYgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gKyAgICAgICAgICAg
ICAgICBpbnRlcnJ1cHQtbmFtZXMgPSAiZ3B1IjsNCj4gPiArICAgICAgICAgICAgICAgICNjb29s
aW5nLWNlbGxzID0gPDI+Ow0KPiA+ICsgICAgICAgICAgICAgICAgI2Nvb2xpbmctbWluLWxldmVs
ID0gPDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgI2Nvb2xpbmctbWF4LWxldmVsID0gPDM+Ow0K
PiANCj4gSXQgZG9lcyBub3QgbG9vayBsaWtlIHlvdSB0ZXN0ZWQgdGhlIERUUyBhZ2FpbnN0IGJp
bmRpbmdzLiBQbGVhc2UgcnVuDQo+IGBtYWtlIGR0YnNfY2hlY2tgIChzZWUNCj4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dyaXRpbmctc2NoZW1hLnJzdCBvcg0KPiBodHRwczov
L3d3dy5saW5hcm8ub3JnL2Jsb2cvdGlwcy1hbmQtdHJpY2tzLWZvci12YWxpZGF0aW5nLWRldmlj
ZXRyZWUtc291cmNlcy13aXRoLXRoZS1kZXZpY2V0cmVlLXNjaGVtYS8NCj4gZm9yIGluc3RydWN0
aW9ucykuDQoNClRoYW5rIHlvdSBmb3IgdGhlIHRpcC4gSSdsbCBoYXZlIGEgcmVhZCB0aHJvdWdo
Lg0KDQpGcmFuaw0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCg==
