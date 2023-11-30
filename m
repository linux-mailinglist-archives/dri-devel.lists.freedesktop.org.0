Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDD77FEB97
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 10:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC6F10E6C5;
	Thu, 30 Nov 2023 09:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB7910E6C5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 09:13:15 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AU8nCW7008633; Thu, 30 Nov 2023 09:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=XhRiWgm2gs/JPNdMmJZzKsmUQp00+pqrxnqxeb6egnQ=; b=
 UAENXgbyICkfAbrFwjUf6IntLKaqFAhMVssk58Pq9z4AFWnNRYMjCbBAZiDfmd4i
 oi8dYceEgURj7stSV1eRwXKaDxJ/I7ENF1prTIt4xygNCYKK4qSHfCa57Q7mBATD
 uNl8xezgEsxugWxqtRCQzQCaT+qycFW1xNItY0GNkE1E4R2W6yKxr4M7T6DFoCga
 luKvFGvmon7kmsvhCpuzE/1Vn2762+BqhtB+KbnTKTUQiUtC94HSHj4bdGM598/N
 k3WmD6fDDJ7b3qWFvlQIwM2L4noWef0dJpfX0chJ0IrwuQWBS/pPBQl53DjemiLg
 ffSDH2gFjyR+Smujh5q7wQ==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3upgv6r9be-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Nov 2023 09:12:37 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Nov 2023 09:12:37 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.40) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 30 Nov 2023 09:12:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVr62cGFuUyDTPw2oDFpF7nNdce7Sq3uCMG76NC4v+//fRZonEKsJ1Xu9rTwfhaRKzyFi3U++sJk3lCW2wK+G3H9M/4KpfycDyxcKvpVJQbxs21Jbs4RoN1lFgAPW4GvJZRUCvbDdYHfOMuDo/HAForthmpxPJysad6xRnf7bSd1xG7gPg09Aw7DkvWr4udZ5klvyisxF3p1w2KuVBqhrorPH+nhZORXSjOefkhBn0JVMpF5xW2rQFuy0EnPvW8l9UQRaQa3dFKsvj007aSRcLIxIR1/NMc1QYkL2ByjHnJP/0DX3I65icaDDoBEl3q+HVHblH8wy+FKdCnLDglsSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhRiWgm2gs/JPNdMmJZzKsmUQp00+pqrxnqxeb6egnQ=;
 b=cr9RX8Hd9xLfeY6qJdb/8yz7IjCYBAXbfS1NTDML0wFuwGgd3tKMtugpG/oizK2jc/sWIBlydQjOdkbSd2vK0RjXI4JiM7wugRGBPwcZEo9WKLViXvcHCxdWu7OFu74lOcKbh2jdMKVW8eqE4d7dCBV8C+avf92sAsPFbQl+VBKOVQvKRLOQ6tGOtA4QMH2Z6d6xoCNWtM+JKQlxUsnVcZgQD3Cbt4cK4BSoIJzVJtDofw6Dwadnfayns6ml9G8xvZd47KSeNU3IBMW/qEQQnCuiGpy/yf6UXw975J2A4F3QExcnFKEw1KkstJY8kQTRybsnQ5XGzHP2qLjBMf1C2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhRiWgm2gs/JPNdMmJZzKsmUQp00+pqrxnqxeb6egnQ=;
 b=BmF87cPVtgFqewU6plktO6MSpzwwIK9YqgbP9Gk9EjRMcf6ki10Jc1AWfReyFkOop6AXBK5q88ZWPwUIjIIF0fp+k42O4XUEB266cp6ULXeH71pjc9tttxfyo+MIRLoeA/75MAjLKV8imPHuP0cPQ0GizqdXh5oKurs1NQWLyGs=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by LO0P265MB7157.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:31e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 09:12:35 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ca3:d6ce:efeb:31ba]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ca3:d6ce:efeb:31ba%3]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 09:12:35 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>, Sarah Walker
 <Sarah.Walker@imgtec.com>
Subject: Re: [PATCH] drm/imagination: fix off by one in pvr_vm_mips_init()
 error handling
Thread-Topic: [PATCH] drm/imagination: fix off by one in pvr_vm_mips_init()
 error handling
Thread-Index: AQHaI21bAJoV21avGUOTok8pQ9LKxA==
Date: Thu, 30 Nov 2023 09:12:35 +0000
Message-ID: <810cf46c7f4b646ee2979dd29e53362dff7d9881.camel@imgtec.com>
References: <a2d3210b-290f-4397-9c3e-efdcca94d8ac@moroto.mountain>
In-Reply-To: <a2d3210b-290f-4397-9c3e-efdcca94d8ac@moroto.mountain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|LO0P265MB7157:EE_
x-ms-office365-filtering-correlation-id: 2c7ee545-f7d9-4986-7bc0-08dbf1847e1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lfz2NxnLRgVYfauNYB0cEYYJBNzZYHm7f/gCYE9ozbjK0o+paoxguhhZofiKkgO/n5plcwi0caBn7Cii2s3aDiEovVvyLBrBVCKuPKxAEuzTPrKtZ8uSwjrDdATOtVAg06/RHqDTYad51ZjQpbVn89hOjUhCpeCvblPaZylNp2OjUYeCvMTHe4fYUiwDXvTjqZ3YheZwuTbp79OXHtbbjvwK6fBrHYWa0ljDts0ykQyuSLnK6+sgnn3AZqnYzJDVuDEPJf3VGZoaWscM0TEP4rdRZzIto48rG1IZCqZBV1EE6jsXcZ/oJjxYQS3xvxPUPO9xyzflBtuwUJtgne81Ks2CyeKpGAhNTPyKXpjn++xl52ZbTeFN6LhlM3zfcyoFFeCSsdy/tgrr0fjADr8gW5VSc55YMjANtyo0bYOVVfgQWv3J2h+aw0HyqNoGlO1rXFixninrZpQhpfaBm+ctDSarl/VyqVfCX3jDfs+v3apaUQOFSvUaTtvdNZMRPE1mdm4AoIfKAS82j4K0gs/DcY0ND83VJDNEy1JxZ24hvvdUj2tSfKzlMzR3jAalfjHaTcbgqh8kPZmxZLTceRLlnStmxqZBLv/wzu7XbymfhIOs8UtyZcPfndlhSeLXN0JaChWVSpAB5g+5vzSBX4+RpvccZujfXgpNOy6xiNzKcyM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(376002)(346002)(39850400004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(26005)(2616005)(122000001)(6512007)(8676002)(71200400001)(5660300002)(4326008)(8936002)(6506007)(41300700001)(2906002)(110136005)(6486002)(478600001)(4001150100001)(316002)(6636002)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(86362001)(36756003)(38100700002)(202311291699003)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eW9LVlZCQkZwWVp4bVNiWDZhMDhQWmNDdXdqS2tscmRibnVIMHBpL0pzdE42?=
 =?utf-8?B?dDZSMSt3OXhGUXMzQzJRd002VkMvUXdBdVNvSjRDNFBneHNETnB4cU1sOFBQ?=
 =?utf-8?B?dUJpQVpObTh0aVA5KzRwY2lPcHo2TlhXbmY2YjRsYjNQVmh5N2FnK05JQVpH?=
 =?utf-8?B?MXg0UkhUMkZFOG1KWHdBVUFHYTliZE5LL20yWHlyQzN1a2RJMFV6aEdhSlF4?=
 =?utf-8?B?bGloellHc2pEMTVvL1IwL29vdkorL0Z3bnFpWmRMcFBMTVJxZUJUelZlTUQ5?=
 =?utf-8?B?bFpRMmFIdExKb2toN2FuS0sxanArZHpSNjNibklMMm12Z3NubWVUUElHeEdl?=
 =?utf-8?B?Mm9BUEF1Wm84aTN6WVpJSTlNUWV4WVU1WnBiRkNBYlJWa3ErMVdVRHlhdEI0?=
 =?utf-8?B?WVpPY3ZOTWx6UFJqM2MwY0V5ZkxmQ1NiWG1LMDBMWW40TE94eVU1VjlEWFp5?=
 =?utf-8?B?ZENGQjJNVGkwQXRvcUlsYkZXYm1FeDlnVVdTNGZVQzdGZkpQbTY4d2ViYmU5?=
 =?utf-8?B?WXdQRVdjR1llY2ZrYVpCem9BQ3hzZW8rN0VCM0YzNjhES2xiL2wrejFmcWR6?=
 =?utf-8?B?V3NVVjlHMHNjUVg3Vi82YXRPQkljUGtlSHF2OEFTZGdjbHdBZG5Rcml2L0RX?=
 =?utf-8?B?WEwyWUlZZjYvcW12M3QyV2xaQWgyY2VnbXhZYVhKbEJKd3B5NFUrQWZyTFhO?=
 =?utf-8?B?Q05kRTl2UjUydzRsUEZxeHcyV0NLV1JTZitoVVArYlJjL2pTU1hWYUhibGZl?=
 =?utf-8?B?VTB1RnNPOFkxYkZzOXY4bm44OXIzaGV1dWNhNlBaQzU0ZjVmcGNnMFE3QkpI?=
 =?utf-8?B?ck0yOEhOaFdveHNSYk5DRmM4UkJ1aHVqbitLd1A3TkdKcmM4L2dpZzBUcVhR?=
 =?utf-8?B?U0FMTVlGUUF3V2Z4a3hRdysyS2N2d0lLaXdEdDRxQitCOEl5U3lNYWhMUkp2?=
 =?utf-8?B?RFI2dlcvTllLZWEwY3VrNGtPd21sOHZtWUZwcmxqRU13QnRGOHhGZ2tBdllB?=
 =?utf-8?B?c3FuNm5zREtwdFR4STBUSHNZaVN4MDFjZDRQbnRhaHFDeUlRQ2tlaFJxSUZS?=
 =?utf-8?B?eFhCOC9Lamk3OHJhYTYrY1ZIU1V6cHRqdk5ESUw4YUh5S0ZxNXNJM0NtWUw5?=
 =?utf-8?B?VXNvSTJUdXlZbm1udVRHNGpqZWMzeXhpRkZ0TTduMlZvZW03dDArSUt6b1hx?=
 =?utf-8?B?czF5RFpaRTFaUDN4V0ZqYVZCQnhJN0NRYnEwQzQ1Tm9DVVR6SXp2ZDc4MzdJ?=
 =?utf-8?B?c0tLR1VUY3Y0ejNaVU4rYXphL0hwTE1wSnRQUFdPb081N2gxQ05vZHdDOFZF?=
 =?utf-8?B?dU01MG5oMEljTnVHYjhBSFFMbWVQb2xDWEtBbVVqc1o2bVM4YlFUU3k4SzU1?=
 =?utf-8?B?MlZVS0NoWktHVVViL1pvWHl6RlBoRDR1bEpSSzVvZEk5U2UydGVOdFJhaHUy?=
 =?utf-8?B?cTJZdDRZZ1FiZ0tkWnpqa2xkYVhUejNjVFA5TFEwTzdITTZYU3lnU1NQdlhD?=
 =?utf-8?B?MVJIS0RDT1VxSnJSb0ZaYjZNT3FVQnFtMkxIMFhVdjkxb1RxMzkrSGpFZHNx?=
 =?utf-8?B?NC9rWkEreUhwS1BFQ1FmNlVVRzhtcGh1WHdlNE9aNUZOSDBnZEt0anhzMGZW?=
 =?utf-8?B?emQyazJLQU56UDhXZmY0b3o2TXI4TG5VUCtUdk85bmFFTzVjUjJYQVo1Z2J3?=
 =?utf-8?B?Y0prb2QwM3N6TXhqZG5ScW9VbmFNZlZydVFBUkVHYTV2QWZ2RmhyZDc2bWRZ?=
 =?utf-8?B?cERYR2oxdzF6eUo2N2FJUEYvd1dqc01kbXhhUmErWFZqMTJGLysyNTBlN0t1?=
 =?utf-8?B?Qm9rV1MyWEEyVWc0UzJzYk5heTZ2NnZrMDJWSmREbE4yckEza1RoMVNDU3p6?=
 =?utf-8?B?UFRxOE94ZUJkMUZLVzdTWEZrY2hFdW16dlYybFNKdHlnendycm1LTmd0SlVw?=
 =?utf-8?B?cDNGZHp4eXlPWExJU1Mzdy9aWkNIdlJXUGhpVTZ5T21sZklZR1RUeXdhTDFw?=
 =?utf-8?B?Q2Y2M3BPTGtwbEZoS0w1SjEzaklsL3R2eUIyMmg4Q2ZjQTVZWVRNTzRuZ01P?=
 =?utf-8?B?Y3JHcVdHc1c4dVRpWDlNWkl1Sk9Yb0RaS2p4RWZjM0FIbTlzWWJ3UktRWmU2?=
 =?utf-8?B?UjdhYmU5K2V0Zmo5SjVHdTNFTXFSMVV1RENOTzhaRkVEVDNDeXYzMzlKWUtE?=
 =?utf-8?B?bHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <385D7D8C2E36D94FA24AEEB4A23C785E@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7ee545-f7d9-4986-7bc0-08dbf1847e1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 09:12:35.6481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tNrp6IDND4VFzGvgRaj0ZhgSG3d89ZefOsZauU5A+OpQj5QrzI6hDzRY3n+SF4aSf3MHUL9NGNoxtQwz1z0iDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7157
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: R2BBf4fSRDkx8g24kEDqFR2TBOG0A_GO
X-Proofpoint-ORIG-GUID: R2BBf4fSRDkx8g24kEDqFR2TBOG0A_GO
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Matt Coster <Matt.Coster@imgtec.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTExLTMwIGF0IDEwOjI3ICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBJZiB0aGUgY2FsbCB0byB2bWFwKCkgZmFpbHMgdGhlICJwYWdlX25yIiBpcyBvbmUgZWxlbWVu
dCBiZXlvbmQgdGhlIGVuZA0KPiBvZiB0aGUgbWlwc19kYXRhLT5wdF9kbWFfYWRkcltdIGFuZCBt
aXBzX2RhdGEtPnB0X3BhZ2VzW10gYXJyYXlzLg0KPiANCj4gVGhlIHdheSB0aGF0IHRoaXMgaXMg
dHJhZGl0aW9uYWxseSB3cml0dGVuIGlzIHRoYXQgd2UgY2xlYW4gdXAgdGhlDQo+IHBhcnRpYWwg
bG9vcCBpdGVyYXRpb24gYmVmb3JlIHRoZSBnb3RvIGFuZCB0aGVuIHdlIGNhbiBzYXkNCj4gd2hp
bGUgKC0taSA+PSAwKS4gIEF0IHRoYXQgcG9pbnQgd2Uga25vdyB0aGF0IGFsbCB0aGUgZWxlbWVu
dHMgdGh1cw0KPiBmYXIgYXJlIGluaXRpYWxpemVkIHNvIHdlIGRvbid0IG5lZWQgdG8gaGF2ZSBO
VUxMIGNoZWNrcy4NCj4gDQo+IEZpeGVzOiA5MjdmM2UwMjUzYzEgKCJkcm0vaW1hZ2luYXRpb246
IEltcGxlbWVudCBNSVBTIGZpcm13YXJlIHByb2Nlc3NvciBhbmQgTU1VIHN1cHBvcnQiKQ0KPiBT
aWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQGxpbmFyby5vcmc+DQoN
ClJldmlld2VkLWJ5OiBGcmFuayBCaW5ucyA8ZnJhbmsuYmlubnNAaW1ndGVjLmNvbT4NCg0KPiAt
LS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfdm1fbWlwcy5jIHwgMTEgKysr
KystLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92
bV9taXBzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3ZtX21pcHMuYw0KPiBp
bmRleCA3MjY4Y2Y2ZTYzMGIuLjJiYzcxODFhNGMzZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92bV9taXBzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2ltYWdpbmF0aW9uL3B2cl92bV9taXBzLmMNCj4gQEAgLTU3LDYgKzU3LDcgQEAgcHZyX3ZtX21p
cHNfaW5pdChzdHJ1Y3QgcHZyX2RldmljZSAqcHZyX2RldikNCj4gIAkJCQkJCQkgICAgICAgUEFH
RV9TSVpFLCBETUFfVE9fREVWSUNFKTsNCj4gIAkJaWYgKGRtYV9tYXBwaW5nX2Vycm9yKGRldiwg
bWlwc19kYXRhLT5wdF9kbWFfYWRkcltwYWdlX25yXSkpIHsNCj4gIAkJCWVyciA9IC1FTk9NRU07
DQo+ICsJCQlfX2ZyZWVfcGFnZShtaXBzX2RhdGEtPnB0X3BhZ2VzW3BhZ2VfbnJdKTsNCj4gIAkJ
CWdvdG8gZXJyX2ZyZWVfcGFnZXM7DQo+ICAJCX0NCj4gIAl9DQo+IEBAIC03OSwxMyArODAsMTEg
QEAgcHZyX3ZtX21pcHNfaW5pdChzdHJ1Y3QgcHZyX2RldmljZSAqcHZyX2RldikNCj4gIAlyZXR1
cm4gMDsNCj4gIA0KPiAgZXJyX2ZyZWVfcGFnZXM6DQo+IC0JZm9yICg7IHBhZ2VfbnIgPj0gMDsg
cGFnZV9uci0tKSB7DQo+IC0JCWlmIChtaXBzX2RhdGEtPnB0X2RtYV9hZGRyW3BhZ2VfbnJdKQ0K
PiAtCQkJZG1hX3VubWFwX3BhZ2UoZnJvbV9wdnJfZGV2aWNlKHB2cl9kZXYpLT5kZXYsDQo+IC0J
CQkJICAgICAgIG1pcHNfZGF0YS0+cHRfZG1hX2FkZHJbcGFnZV9ucl0sIFBBR0VfU0laRSwgRE1B
X1RPX0RFVklDRSk7DQo+ICsJd2hpbGUgKC0tcGFnZV9uciA+PSAwKSB7DQo+ICsJCWRtYV91bm1h
cF9wYWdlKGZyb21fcHZyX2RldmljZShwdnJfZGV2KS0+ZGV2LA0KPiArCQkJICAgICAgIG1pcHNf
ZGF0YS0+cHRfZG1hX2FkZHJbcGFnZV9ucl0sIFBBR0VfU0laRSwgRE1BX1RPX0RFVklDRSk7DQo+
ICANCj4gLQkJaWYgKG1pcHNfZGF0YS0+cHRfcGFnZXNbcGFnZV9ucl0pDQo+IC0JCQlfX2ZyZWVf
cGFnZShtaXBzX2RhdGEtPnB0X3BhZ2VzW3BhZ2VfbnJdKTsNCj4gKwkJX19mcmVlX3BhZ2UobWlw
c19kYXRhLT5wdF9wYWdlc1twYWdlX25yXSk7DQo+ICAJfQ0KPiAgDQo+ICAJcmV0dXJuIGVycjsN
Cg==
