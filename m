Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46800738F5C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 20:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A5010E11C;
	Wed, 21 Jun 2023 18:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DADC10E11C;
 Wed, 21 Jun 2023 18:59:45 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 35LI5Pc4030092; Wed, 21 Jun 2023 19:58:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=c+unvZ78NviTBfQDtOV5DGx7i8RFaJZ3Cns9GhyfhWs=; b=
 TAW+HBbhPHS2UhRbjbPC1HvB7kvf1kHxF1mCxXRBAUtIvDrcNkkNfB61twqv7fWP
 RXaxvNjjQF0Q0wucr5+vfquNIp77qJhXGO2oLOpB32yzJY6cecRmpevap9WYzZNC
 SNdbUrNBswSTfPkjAs1n8/B7KCW01kwrFpTIjAykK5uacwoVH/Sqvq37n1JL1nAB
 82XS0NZIXfi+kHEjeNRNgFCmNxSp1OG1Q0y+JjXU0/oMvJPOmTSknmyulsIN8VUw
 h82olfEjnjErRMhe+JG4DduvfMsSm4Xh4ETNY1rTmqc22ECLMkA02BCY9QyC4eeZ
 QWyiw+k5zTloi0WwOvwt5Q==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3r94wvkcde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 21 Jun 2023 19:58:05 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 21 Jun 2023 19:58:04 +0100
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (104.47.20.52) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Wed, 21 Jun 2023 19:58:04 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doyI/WkHOCXQeiX8tlOyBFjXsZ4WYAWDCowoHaiYQTDi33NSg2FkHO3VIJQ7hKJ85/co8ko/IQNY1SHhCKwL1WVfHo2LRucAOGb0cN4sCW9sOuR3uszlQZasl2gZfcqxWKwh9C5DuZg03kou39xeJ0/ajirVPgoLfF/Ymab+AJLJ4fUpqAuK9fj8oLXBPXNGusqFaEAS0MYs7tTznK+UrRXkZWs8icqmfgSRBZbU4k4AVO/yrDHu7ORyWKq3wZt3DC5P0MpqD3H+zWFIwfRs2DgeRo+9uhbwQbB0TtJCvQSckx2YunHoHGha5RvycxXX1zhhHEEInJwSKkXCYbXhlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+unvZ78NviTBfQDtOV5DGx7i8RFaJZ3Cns9GhyfhWs=;
 b=iN6/LZypcifmYCh8xnBwf59s5ECkxb4jAWKszfDbr3ytu7GfNYPpuUuVSC3zph8j4QNaXYRs5lc0doqZK+NuzL3W4mKZHT7DIZL0G7JkdQ47nKvtdS+hg87CYcB8dd94Yzj9Bg1UqaTVkaqoy7echAMTeSxVIngZFcw8SCkRS34oIEUa7ViFX36/5WZfqjH7+cwXZJHmd9DqMuMXdaGXHA2G7TeUfYPAatjpLwVq0gnXvHWzeUPfgZlv7uOO0XQRrV6rG0cl2iPH58nFC/VIG0N7dvizfwXCuwXBQBDoc1jw0z1MXc3Lx6j+JDCdCv+YE788aOi3rAi1AyK423kQBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+unvZ78NviTBfQDtOV5DGx7i8RFaJZ3Cns9GhyfhWs=;
 b=nimBDdWe1hEFFxUR7NXWeJsOLHRrYwP3hQJ6rExLs75gMHcGghqIJNkUWaEEAHpSNIVIEOptngz5z81qa2ONH1D9mZ2yZJSjWS2eSzUjFBV85hIrCQsB1yhqJ2w7OeiL7CnjRYvFylpxcaqZrOUn1/Gj5m/mruiDV+XySuTksec=
Received: from LO0P265MB5761.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:262::5)
 by CWLP265MB7005.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ff::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 21 Jun
 2023 18:58:03 +0000
Received: from LO0P265MB5761.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3316:2a92:40cb:f29f]) by LO0P265MB5761.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3316:2a92:40cb:f29f%4]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 18:58:03 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: "corbet@lwn.net" <corbet@lwn.net>, "jason@jlekstrand.net"
 <jason@jlekstrand.net>, "willy@infradead.org" <willy@infradead.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "bagasdotme@gmail.com" <bagasdotme@gmail.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "matthew.brost@intel.com"
 <matthew.brost@intel.com>, "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "dakr@redhat.com" <dakr@redhat.com>, "ogabbay@kernel.org"
 <ogabbay@kernel.org>, "boris.brezillon@collabora.com"
 <boris.brezillon@collabora.com>, "Liam.Howlett@oracle.com"
 <Liam.Howlett@oracle.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "alexdeucher@gmail.com" <alexdeucher@gmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>
Subject: Re: [PATCH drm-next v5 03/14] drm: manager to keep track of GPUs VA
 mappings
Thread-Topic: [PATCH drm-next v5 03/14] drm: manager to keep track of GPUs VA
 mappings
Thread-Index: AQHZpHJO7RHG4V8Z+U68Vi6r5l+lZQ==
Date: Wed, 21 Jun 2023 18:58:02 +0000
Message-ID: <63eee0a1883669bc992ef0b75ff204f890d70cc7.camel@imgtec.com>
References: <20230620004217.4700-1-dakr@redhat.com>
 <20230620004217.4700-4-dakr@redhat.com>
In-Reply-To: <20230620004217.4700-4-dakr@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB5761:EE_|CWLP265MB7005:EE_
x-ms-office365-filtering-correlation-id: f781b9fd-fd26-4cff-6b3e-08db728970bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lo2WMWmc42bRb0dvqm9GNNIFw1BFryFsM7Q6e93ECsbUt2Fp/Wznsgw7dmpK/pUYmc0l+kXtgB6hl4sr4FNws0SxhZAp68a0m3BPXY5/yY7+mb88U4IX+Zp/c3i9XCGEsmXh0b4DvXGAKhyj5c+KY54UWzOXtaLpPAAvTRmbFsh00AH2aXpLLwdaAYwIynLxtuDFTJVS+ei4LSnObrR449CRv2Ncrzl3WdQYV49LdapiDLnNAGdXG2dlYixSz6NxKQk0iT+J4Z7SICkSGHFWpUctTf68abQVv+hczsL+XUt2gu883+KpO66nnebRiW8pvzgnjWO951axNlMUDvXP8PEJaY/TDSvN2jxowUb+Fi+C572LVn2u12M566xqOg2DacJoD56Vh8BVLR7feM3EDYJ0U0jUDl+OSR996/HOIfsMmqvkNazhDnXcypBiBcDoiYqKKDXmheDc8x0+B70iV1MG/zoaLfdiUMjm6V9/YpNW+2AiEQlFtYiFIf+8PHqC7Lq6fdGO9PRATQDj0k0suX2uNfOWZlJMxvlUQCeIfzvMKrTXx08NvMPf3p2pa5gzqnPUCaTE+W70JuBU+/zImFFrpG3q2+CAatdUp5+xzP0Uf/fA3avpzzJyVoowZU66SK6T8JiO0sPUqtno5RcHsQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO0P265MB5761.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(39850400004)(376002)(396003)(366004)(136003)(346002)(451199021)(54906003)(110136005)(38070700005)(41300700001)(5660300002)(316002)(8676002)(8936002)(38100700002)(122000001)(921005)(4326008)(64756008)(66446008)(66476007)(66556008)(7416002)(66946007)(36756003)(76116006)(478600001)(71200400001)(6486002)(2906002)(2616005)(83380400001)(26005)(6512007)(6506007)(86362001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VnRpUy8rWG03aWxWNGJnOGtXYis3STh3UmZDZXJ1bjRKSndNd09TcStwNHpw?=
 =?utf-8?B?ZXFWRkdXcTgvSXJpTFB3N1dZOGV0NElnaERMZVUwQXVrcXBmQ20wNUtHSUpR?=
 =?utf-8?B?WVJLK1JvbjZYcWR2L0Fyb08ranhXY3pBUUIxVng4dVdyQkl4RjhKRzZudXFM?=
 =?utf-8?B?T1pPTXp0aVB0RUVuZGhqZjUxdXNpNDhZZHFXZExXSmxvK3VsYzFpUFhaZVRM?=
 =?utf-8?B?aUJaMXlJK2svY0ErdE15TkhXeVBOcjd6d0pJUVhYdHAxVEFGNUppSlNZVWdS?=
 =?utf-8?B?WDJYQUxOVml2U2pKQ25uSWRoUnpTZVpxZTNWczFEYWFHaTFxTmdldzNneFdz?=
 =?utf-8?B?SEE4ZkZBZFdSbGlpb09GcDdkUTlKb3BJK01JczZwb2d1b1Z2OHFDNmw4cHFF?=
 =?utf-8?B?MU9tRzF3OWRWc21mQ3p0QkVwNjBQWmR1YThOMHFSSlVhS29GT3pUbWVQTkVp?=
 =?utf-8?B?NHlxMDBaQzkvYXBMRTZtMWo5TFpJTCtCayt3blJ5MFI2dTFFQkowZ2JkYW1s?=
 =?utf-8?B?aUpJWVdORjdsSGtiRUZKSnpOVk1HelBkSkpFQnNqam1YTlp5TnkvazJaYTky?=
 =?utf-8?B?UkpQc1JJZUVraW1rUEZTcnhYa2hJcGw5Vlprc2J1aGVKUWNwZnlEeXJDdmJ3?=
 =?utf-8?B?QVRMMnVIU25rTkM2TU56UGxKZGMzYzE1SW1VL0hiV3N2bmJmbVMyVEIzT1pN?=
 =?utf-8?B?TSsvczhoSHRHQWcweVovZmFiQ3h0YVY2aEE5eS8zSUVBejRtVVIvdThNS283?=
 =?utf-8?B?SnZGUUk5bVVGREtTMTlMdHFBNVZOMmdsdFVtSlBwWFhhTDU2bWoxQktVeW8w?=
 =?utf-8?B?K1luVktQYmd3VWNQamQwZ3VzMnp2a2thbkpLM29tUDB0ZjBDeXkxdE5xc1R1?=
 =?utf-8?B?djRKNUQzNGYxV1BnUXRjZVNOaytVNS93VWJZNjJEd0ZhMkJ4V3Avdjlva21E?=
 =?utf-8?B?ZzF5NHpGMWU0eVRPOTVKYUM4VTVEWnF0S2VxWkxYMnA4YlVxcCtOY3FOdjR2?=
 =?utf-8?B?VDF4dzNoRWJtUTlzTXFZSjhvUzlUY0pJN1ZZNkg2R3VhSERDTDdwOWJpZ3NT?=
 =?utf-8?B?MnIrY3BlZ2J1VC9YYU04UHdCMkRKL1lLT0dkdjZXdzk0YTlqZzRzMzV2U3p4?=
 =?utf-8?B?YThsSWI0TGVvQnkxeVBqMVlaTnpZaEZEWm0zc3ZNUW54YklFZEFBM1Y5b3R3?=
 =?utf-8?B?aGdzdnliamUrNHZlblpQUW1USklmcHVYRXViZTQvQjA0dmFJaUJDNnd4ejR2?=
 =?utf-8?B?djZuU3RUSHN0T1NRQnhqV3pMR1pkMU9JQjRZU0NYN2drNnNWdEVNYm1PQWlk?=
 =?utf-8?B?aWZYOUZRSSs0eGkxenBKekg5VEs4ZnlwM1JCYkVtVHNwMVhPcThTZEpRWTVa?=
 =?utf-8?B?OEZPR25aMFMyTkRXOUpPOGowTFB5RnVwM0NxMUIwSFk0MEVEbUdUM1UxTzFi?=
 =?utf-8?B?dTdKSXV2T3lJRkdvOHVkQ0tzQURkSTlySjNoMGgwczVYRU13TlVxVEhoNm9I?=
 =?utf-8?B?Ni9QNWxhQjkyK3JIWEJ6eitoait5R1RzdGE3MFEzQStBeVp1cU41UXZhdkI4?=
 =?utf-8?B?VDd5c0Q2Z3pyR1lpVjN0Vnlhb0lNOXpLSzNlT2h1SWNDb0FuQ3ozQ0sxOTFi?=
 =?utf-8?B?djhZeVFKZVZDL0FaQjRJNGRVR3Rwbk14Z2NndzhZaVU4Z0pGcDFWOHlueG5j?=
 =?utf-8?B?WkVhamM1SG1BT3VwU3lZM0haOTZQYnovbktPQ0lxU2NwWWN5d2tJNGhPUzBD?=
 =?utf-8?B?RnFGVWpuSlpKODVhK3pYTVRtMEUyN0FCK0JwbGR2R1diU3N1WlJMN21NQ3Rp?=
 =?utf-8?B?R1VJTllZY2NrcGJPbW5hYm5zMU1VY2JhU0t6Yng1eU51UFhuc2dyRkJhNXdl?=
 =?utf-8?B?VGhsYXg1MzQyYWdvVFdxeE14cEh4dC9IdTczSGZMZ2tHTFlvWnFkb0trOGZS?=
 =?utf-8?B?dW04RG1DYk9HVTF2YnQyc2xXWXhGUS9qQTlLQXBIcldDRDN6SDBacmVYTzJy?=
 =?utf-8?B?N1JxSjN2ZTJwS3dDNDNqTWVXUFpYcXFrRWVQemtEZkVEdFc0aGQweTczdXpS?=
 =?utf-8?B?TDZkMG5weUFhSHV0VGZwZTF3U1c4am9OaVI3eU82R2dZckhtS004aTZOcGlQ?=
 =?utf-8?B?ZS93Rit1ZUdSRlVpTkNFNGROTkxIOVZvMWZDcDNMcU5KeWwwbG9QcUx6bzJI?=
 =?utf-8?B?M3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <20C21A8610AFB6469E0A2179D0D2B0FF@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB5761.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f781b9fd-fd26-4cff-6b3e-08db728970bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2023 18:58:03.0140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q3ucppfFgoc3Kf6bgt9ZHtQiA16WsXlOAJ01JMbm1hENnW2e1yHuo+WLXCIJ6RG+iaHKZJbg92INxJnt3KPrDIVU7LFuC3BuSJ/zi1ylJEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7005
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: sY4SUkOHDzqZsuBtnHltohEs0mlD-sZO
X-Proofpoint-ORIG-GUID: sY4SUkOHDzqZsuBtnHltohEs0mlD-sZO
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
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "airlied@redhat.com" <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWxvLA0KT25lIGNvbW1lbnQgYmVsb3csIGJ1dCBvdGhlcndpc2UgaXQgbG9va3MgZ3Jl
YXQuICBUaGFua3MgZm9yIGFkZGluZyB0aGUgZXhhbXBsZSENClRoYW5rcywNCkRvbmFsZA0KDQpP
biBUdWUsIDIwMjMtMDYtMjAgYXQgMDI6NDIgKzAyMDAsIERhbmlsbyBLcnVtbXJpY2ggd3JvdGU6
DQo+IA0KPiArLyoqDQo+ICsgKiBET0M6IE92ZXJ2aWV3DQo+ICsgKg0KPiArICogVGhlIERSTSBH
UFUgVkEgTWFuYWdlciwgcmVwcmVzZW50ZWQgYnkgc3RydWN0IGRybV9ncHV2YV9tYW5hZ2VyIGtl
ZXBzIHRyYWNrDQo+ICsgKiBvZiBhIEdQVSdzIHZpcnR1YWwgYWRkcmVzcyAoVkEpIHNwYWNlIGFu
ZCBtYW5hZ2VzIHRoZSBjb3JyZXNwb25kaW5nIHZpcnR1YWwNCj4gKyAqIG1hcHBpbmdzIHJlcHJl
c2VudGVkIGJ5ICZkcm1fZ3B1dmEgb2JqZWN0cy4gSXQgYWxzbyBrZWVwcyB0cmFjayBvZiB0aGUN
Cj4gKyAqIG1hcHBpbmcncyBiYWNraW5nICZkcm1fZ2VtX29iamVjdCBidWZmZXJzLg0KPiArICoN
Cj4gKyAqICZkcm1fZ2VtX29iamVjdCBidWZmZXJzIG1haW50YWluIGEgbGlzdCBvZiAmZHJtX2dw
dXZhIG9iamVjdHMgcmVwcmVzZW50aW5nDQo+ICsgKiBhbGwgZXhpc3RlbnQgR1BVIFZBIG1hcHBp
bmdzIHVzaW5nIHRoaXMgJmRybV9nZW1fb2JqZWN0IGFzIGJhY2tpbmcgYnVmZmVyLg0KPiArICoN
Cj4gKyAqIEdQVSBWQXMgY2FuIGJlIGZsYWdnZWQgYXMgc3BhcnNlLCBzdWNoIHRoYXQgZHJpdmVy
cyBtYXkgdXNlIEdQVSBWQXMgdG8gYWxzbw0KPiArICoga2VlcCB0cmFjayBvZiBzcGFyc2UgUFRF
cyBpbiBvcmRlciB0byBzdXBwb3J0IFZ1bGthbiAnU3BhcnNlIFJlc291cmNlcycuDQo+ICsgKg0K
PiArICogVGhlIEdQVSBWQSBtYW5hZ2VyIGludGVybmFsbHkgdXNlcyBhICZtYXBsZV90cmVlIHRv
IG1hbmFnZSB0aGUNCj4gKyAqICZkcm1fZ3B1dmEgbWFwcGluZ3Mgd2l0aGluIGEgR1BVJ3Mgdmly
dHVhbCBhZGRyZXNzIHNwYWNlLg0KPiArICoNCj4gKyAqIFRoZSAmZHJtX2dwdXZhX21hbmFnZXIg
Y29udGFpbnMgYSBzcGVjaWFsICZkcm1fZ3B1dmEgcmVwcmVzZW50aW5nIHRoZQ0KPiArICogcG9y
dGlvbiBvZiBWQSBzcGFjZSByZXNlcnZlZCBieSB0aGUga2VybmVsLiBUaGlzIG5vZGUgaXMgaW5p
dGlhbGl6ZWQgdG9nZXRoZXINCj4gKyAqIHdpdGggdGhlIEdQVSBWQSBtYW5hZ2VyIGluc3RhbmNl
IGFuZCByZW1vdmVkIHdoZW4gdGhlIEdQVSBWQSBtYW5hZ2VyIGlzDQo+ICsgKiBkZXN0cm95ZWQu
DQo+ICsgKg0KPiArICogSW4gYSB0eXBpY2FsIGFwcGxpY2F0aW9uIGRyaXZlcnMgd291bGQgZW1i
ZWQgc3RydWN0IGRybV9ncHV2YV9tYW5hZ2VyIGFuZA0KPiArICogc3RydWN0IGRybV9ncHV2YSB3
aXRoaW4gdGhlaXIgb3duIGRyaXZlciBzcGVjaWZpYyBzdHJ1Y3R1cmVzLCB0aGVyZSB3b24ndCBi
ZQ0KPiArICogYW55IG1lbW9yeSBhbGxvY2F0aW9ucyBvZiBpdCdzIG93biBub3IgbWVtb3J5IGFs
bG9jYXRpb25zIG9mICZkcm1fZ3B1dmENCj4gKyAqIGVudHJpZXMuDQo+ICsgKg0KPiArICogSG93
ZXZlciwgdGhlICZkcm1fZ3B1dmFfbWFuYWdlciBuZWVkcyB0byBhbGxvY2F0ZSBub2RlcyBmb3Ig
aXQncyBpbnRlcm5hbA0KPiArICogdHJlZSBzdHJ1Y3R1cmVzIHdoZW4gJmRybV9ncHV2YSBlbnRy
aWVzIGFyZSBpbnNlcnRlZC4gSW4gb3JkZXIgdG8gc3VwcG9ydA0KPiArICogaW5zZXJ0aW5nICZk
cm1fZ3B1dmEgZW50cmllcyBmcm9tIGRtYS1mZW5jZSBzaWduYWxsaW5nIGNyaXRpY2FsIHNlY3Rp
b25zIHRoZQ0KPiArICogJmRybV9ncHV2YV9tYW5hZ2VyIHByb3ZpZGVzIHN0cnVjdCBkcm1fZ3B1
dmFfcHJlYWxsb2MuIERyaXZlcnMgbWF5IGNyZWF0ZQ0KPiArICogcHJlLWFsbG9jYXRlZCBub2Rl
cyB3aGljaCBkcm1fZ3B1dmFfcHJlYWxsb2NfY3JlYXRlKCkgYW5kIHN1YnNlcXVlbnRseSBpbnNl
cnQNCj4gKyAqIGEgbmV3ICZkcm1fZ3B1dmEgZW50cnkgd2l0aCBkcm1fZ3B1dmFfaW5zZXJ0X3By
ZWFsbG9jKCkuDQoNCkkgdGhpbmsgaXQgbWlnaHQgYmUgd29ydGggbW92aW5nIG9yIHJlcGVhdGlu
ZyB0aGlzIHBhcmFncmFwaCB0byAnU3BsaXQgYW5kIE1lcmdlJw0Kd2hlcmUgSSd2ZSBhZGRlZCB0
aGUgb3RoZXIgY29tbWVudCBiZWxvdy4gIEkgdGhpbmsgdGhlc2UgZnVuY3Rpb25zIGFyZSBvbmx5
IHVzZWQNCnRvIHNldCB1cCBmb3IgZHJtX2dwdXZhX3NtX21hcCgpLiAgUGxlYXNlIGlnbm9yZSBt
ZSBpZiBJJ20gd3JvbmcuDQoNCj4gKyAqLw0KPiArDQo+ICsvKioNCj4gKyAqIERPQzogU3BsaXQg
YW5kIE1lcmdlDQo+ICsgKg0KPiArICogQmVzaWRlcyBpdCdzIGNhcGFiaWxpdHkgdG8gbWFuYWdl
IGFuZCByZXByZXNlbnQgYSBHUFUgVkEgc3BhY2UsIHRoZQ0KPiArICogJmRybV9ncHV2YV9tYW5h
Z2VyIGFsc28gcHJvdmlkZXMgZnVuY3Rpb25zIHRvIGxldCB0aGUgJmRybV9ncHV2YV9tYW5hZ2Vy
DQo+ICsgKiBjYWxjdWxhdGUgYSBzZXF1ZW5jZSBvZiBvcGVyYXRpb25zIHRvIHNhdGlzZnkgYSBn
aXZlbiBtYXAgb3IgdW5tYXAgcmVxdWVzdC4NCj4gKyAqDQo+ICsgKiBUaGVyZWZvcmUgdGhlIERS
TSBHUFUgVkEgbWFuYWdlciBwcm92aWRlcyBhbiBhbGdvcml0aG0gaW1wbGVtZW50aW5nIHNwbGl0
dGluZw0KPiArICogYW5kIG1lcmdpbmcgb2YgZXhpc3RlbnQgR1BVIFZBIG1hcHBpbmdzIHdpdGgg
dGhlIG9uZXMgdGhhdCBhcmUgcmVxdWVzdGVkIHRvDQo+ICsgKiBiZSBtYXBwZWQgb3IgdW5tYXBw
ZWQuIFRoaXMgZmVhdHVyZSBpcyByZXF1aXJlZCBieSB0aGUgVnVsa2FuIEFQSSB0bw0KPiArICog
aW1wbGVtZW50IFZ1bGthbiAnU3BhcnNlIE1lbW9yeSBCaW5kaW5ncycgLSBkcml2ZXJzIFVBUElz
IG9mdGVuIHJlZmVyIHRvIHRoaXMNCj4gKyAqIGFzIFZNIEJJTkQuDQo+ICsgKg0KPiArICogRHJp
dmVycyBjYW4gY2FsbCBkcm1fZ3B1dmFfc21fbWFwKCkgdG8gcmVjZWl2ZSBhIHNlcXVlbmNlIG9m
IGNhbGxiYWNrcw0KPiArICogY29udGFpbmluZyBtYXAsIHVubWFwIGFuZCByZW1hcCBvcGVyYXRp
b25zIGZvciBhIGdpdmVuIG5ld2x5IHJlcXVlc3RlZA0KPiArICogbWFwcGluZy4gVGhlIHNlcXVl
bmNlIG9mIGNhbGxiYWNrcyByZXByZXNlbnRzIHRoZSBzZXQgb2Ygb3BlcmF0aW9ucyB0bw0KPiAr
ICogZXhlY3V0ZSBpbiBvcmRlciB0byBpbnRlZ3JhdGUgdGhlIG5ldyBtYXBwaW5nIGNsZWFubHkg
aW50byB0aGUgY3VycmVudCBzdGF0ZQ0KPiArICogb2YgdGhlIEdQVSBWQSBzcGFjZS4NCg0KSGVy
ZQ0KDQo+ICsgKg0KPiArICogRGVwZW5kaW5nIG9uIGhvdyB0aGUgbmV3IEdQVSBWQSBtYXBwaW5n
IGludGVyc2VjdHMgd2l0aCB0aGUgZXhpc3RlbnQgbWFwcGluZ3MNCj4gKyAqIG9mIHRoZSBHUFUg
VkEgc3BhY2UgdGhlICZkcm1fZ3B1dmFfZm5fb3BzIGNhbGxiYWNrcyBjb250YWluIGFuIGFyYml0
cmFyeQ0KPiArICogYW1vdW50IG9mIHVubWFwIG9wZXJhdGlvbnMsIGEgbWF4aW11bSBvZiB0d28g
cmVtYXAgb3BlcmF0aW9ucyBhbmQgYSBzaW5nbGUNCj4gKyAqIG1hcCBvcGVyYXRpb24uIFRoZSBj
YWxsZXIgbWlnaHQgcmVjZWl2ZSBubyBjYWxsYmFjayBhdCBhbGwgaWYgbm8gb3BlcmF0aW9uIGlz
DQo+ICsgKiByZXF1aXJlZCwgZS5nLiBpZiB0aGUgcmVxdWVzdGVkIG1hcHBpbmcgYWxyZWFkeSBl
eGlzdHMgaW4gdGhlIGV4YWN0IHNhbWUgd2F5Lg0KPiANCg==
