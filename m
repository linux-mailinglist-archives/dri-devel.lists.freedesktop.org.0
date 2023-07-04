Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C789E74750E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 17:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC3810E1B1;
	Tue,  4 Jul 2023 15:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DBE10E16B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 15:13:53 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 364CdfOU015320; Tue, 4 Jul 2023 16:13:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=hlgBuKhpctUvj082CndocEoJd4llkzwEN4XKRs7zCso=; b=
 FTDP1MHrrakEVibQyPkbu2F4QCJ9LzxiZJwhHJjSn58P98bIBA4sSVIaw3qa5BnJ
 J4ljpBvgkifg+DQcJxdjnNtLVllHqZzg9lIatEyPQA/K5AXBfTKpVynyXQ6S4f8C
 /CcFnAy9F/nqqT+4KvlQjcQJRotCn8t1VKFHD9/21jObcvKgfx7sGzbZhVADcE3w
 RGGiI/M9hrQIag9dfj/kXqHjtlHE+OLZ1v3pL10YjJpUsrd6ReHsRYnSXY7c0yAb
 FMxeburXZgV8VjnW+tZBasyb7cp3B6LP5sb3eq6bAq2Tli0dipELK3JyPysnZgs7
 aiNhqo16RD3wKL5l5oKJtA==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3rjc7ujeng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 04 Jul 2023 16:13:37 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 16:13:36 +0100
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (104.47.20.55) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Tue, 4 Jul 2023 16:13:36 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNjZH0pdqwAQFvbOsBUQzR9fNxa49p2EjKEK4UU/3AvcJBHrdxGuO0bwy3jVd+D89fyMX/c0bDkgYmdjyHI4ukupySvULHkBcxJCn1pWgplqWb7d15BHu7nEKsgRD3YF+fzEo4WNLN7/sAXMKj48mLJbD45fYOZCelAa34GaL+0LitWwHFhhnFp5Zav/7GraN+kJvk232kTlPnoQnMjWAoLibvwItN5jkd58Bq74Eakb+7BlinYMLNGAL6vyWQdWl0qtDrbMhhoNjejzo4V4elfyzoXPkKmNWqwY89H/n61wBwFOHbHck365QQO6YJb40s9M+ecZG0RTz+4UYKAaqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlgBuKhpctUvj082CndocEoJd4llkzwEN4XKRs7zCso=;
 b=Jr/KK9wpg4mfsbIwhTLi8+taap0Nq4wgMMHaPbzUzlTv2+cdAvBEDpK9VasxAUb7A6efnwcBvti9BzCA5cpp0Dor/YnMIYpDYsVGEp3RnKqpK5nFCcdBZAV2A+5Qd31+pRQDTn3Crb6YW7YmQnHMLb19LeTnq7kfHhRMg2eSNngLAP3L6Xjw7NJLqYmqTfhOEtd4OkAiXBXKJVuviQIY9YvbMHyN3xrliMBq6+OphF5EPxUvfU9/n19B9yYfYb0Czy7UmLlepw6fuMEgJAdkNPpgLPD93ieYvcJtLMPQ6/HE55UZ9+GV5jC/M8Mvt1DJD1rsb1j7oGGecsopafCBCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlgBuKhpctUvj082CndocEoJd4llkzwEN4XKRs7zCso=;
 b=H0jbZ7vrG8jjTiYVh+ptt+CoS3cjRt5PQKv7OO8CUzcKhV7wphQMiWt6TzEVVbi+rXXI7R2yo3CHxOQq2Cul6AvGMMQUf6W6xT1DT/THVcYh8nEqdaefZJD3Deu+UjILMsYC5/5z5kfDGtD5G2eDDcgfeWowZnbs+GvFpQbPdBw=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWLP265MB6516.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1da::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 15:13:35 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d3b4:38d6:d07b:2c1c]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d3b4:38d6:d07b:2c1c%3]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 15:13:35 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: Sarah Walker <Sarah.Walker@imgtec.com>, "linus.walleij@linaro.org"
 <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Thread-Topic: [PATCH v3 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Thread-Index: AQHZngYUJoX1+qc/Fkehz30lNP0fw6+NZcQAgBxyYgA=
Date: Tue, 4 Jul 2023 15:13:35 +0000
Message-ID: <8011c1ac0ddaab3d96df9e81da9e41cbf5022a6b.camel@imgtec.com>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-3-sarah.walker@imgtec.com>
 <CACRpkdaDkchJkP0MOOBWPtaBhfvR0OUEjkHAHgY0sv8T+SDdiQ@mail.gmail.com>
In-Reply-To: <CACRpkdaDkchJkP0MOOBWPtaBhfvR0OUEjkHAHgY0sv8T+SDdiQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWLP265MB6516:EE_
x-ms-office365-filtering-correlation-id: d7080093-e1a0-458f-f14b-08db7ca13cbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: he5G53gXscPeD8tZaTjfzay/TBgtlMtBcUSHog1+5W4MLdJjipOuPzJ9vMpNdnHfT7+rN7L4WlYO4NuNCnZqN0PQ3I8MfP20ftAwKTB7bXEDpRM8GMdlMGK3ufEQASTRvZUa3sNJuszxl4nFZa/exvHpPStEiMSRwKvBYvyP5mc4y0GvkraVjCL8wInwn5AIi9Cz53JMAZoFtTJANddhyrR/yPY8CONq0H5heoFPlW6lfNs+XDbO984WQjOrAhf5gUf9LI4g9KAm7yrvzjq+wBJhI8aE5inEvDtA4xJpIGMeq1Qv0P64d0wlA1pFQ0nBpgmR/kj6Wljx3zAskh2RbyuBhvXHEPC9ABFrmhmjx3TLcy3uATzPd65Q0RO1A3NO6AyynhQJPW4SVADRD7VUsQ9UZZDKwP6Y3SpxGPCDY4OPPxHq/dAPsoxwUWjBLd2dqVeBbyUL8CL4sJW9icMgXIRKly8jydemkMG7Br0cpU2GeCUO2ATkV6rj8tClkvItKZnYdz+ckbiZFDU2a8QLUiLF4HcwtPWovXBr8vaWOh6xIYwKsxUrmS7Cg7YYENagksbnOIJ4jYjpLzdz71eqTIN/87Gfm9VMwOx/YMg4WlBlADuRsAciH4J6Wg5bId/EfxjqlxvcfC/js9x5UXl6WA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39850400004)(396003)(376002)(136003)(346002)(451199021)(38070700005)(2906002)(41300700001)(8676002)(5660300002)(8936002)(7416002)(36756003)(86362001)(186003)(2616005)(26005)(478600001)(6512007)(966005)(6506007)(71200400001)(6486002)(53546011)(76116006)(122000001)(316002)(66446008)(66476007)(4326008)(64756008)(66556008)(66946007)(54906003)(38100700002)(110136005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emh6VTJmOW1ZWW1UVHJBS1Nmd2dtVlZhZGFQc0Q4N1hvQUZGQW5pR2k4VnVa?=
 =?utf-8?B?RmsyMitlU0pmZGlzZGZkK0RaUnFhLzBLeFRCWXg0VjQwVXdndTJLdEZXK29y?=
 =?utf-8?B?VUpPdmZ5STdNNnR3QUJkaDllUlBnbDhlV1lGVWNrMlFOSmpVWXhzRlROeWRC?=
 =?utf-8?B?U09sS3RQZmdSL3JNdnE1STkzK3hNOHp3SlBuRG9QQnJNRVY5LzBpU3g1amFy?=
 =?utf-8?B?SDZGUnEyRmtGMEtQRU1qa1dpejVPS1d4UWRscXpaWktjd1BFa0hFSVQ0Ni9v?=
 =?utf-8?B?VVlnYWdSdGQ0ZEhGb0dQKzNxRUZpZDJNTXFYOERWa2lxSWt0WkRZelVIekJB?=
 =?utf-8?B?a2NTN1JRU05rNXlXVTl4KzJVNy9UVW9GeElFR1YwUER1WjIyM0ZKanNIQVpl?=
 =?utf-8?B?R01rMXc4Q3IveEw4YmNaMUhXZVRsa2JWZkZLMjRsYmMySnBvWHA3ZG50R0to?=
 =?utf-8?B?QTg0akg1QXRYT1d6emZpSUZSd2MxRmxjRXkxRGJUUVVVZ0ErUFZLZU00SkxP?=
 =?utf-8?B?Yy9WNDVJTjhJM2ZnRnA3VTVKRzYybjIzbjV3cGFwMGxpWU9wN3FEZUNLeUFy?=
 =?utf-8?B?d283Y1pmdHVtSEo0V0c0VlNhaDEyQlQ4L0JBY1VwUHRNM05tNjZSQmRkbjB1?=
 =?utf-8?B?ZUFmS04zSk1Eb1dmcTNoNjFhTitWOFZTNDFoVTRwRDhHdVFnSHhYVTNWWUls?=
 =?utf-8?B?MFJtazU3TkphTlNZMG5kZjFnWVRxdlROOCs2M3BsRkhKY0FqSDNwcGZVSTMz?=
 =?utf-8?B?RW50K01ndCt5WktNaUlOaVl2amdrb29ydVNhbFVkakVaODFKSXltUTJ3M0Vz?=
 =?utf-8?B?WWd1cHJKWjFOTXo2NGN5TjQvcjRURXl0ZmlaUTVVNUp2RXNHRlBVK01HVEpP?=
 =?utf-8?B?Ym9tQ0JwSnJ3MEFKcWdodXlGMnhrU1VlbHh3SHVkbzJTbEJNTmMrdTN5WXZi?=
 =?utf-8?B?Wlp5WXZNK1RuQzFuSzZCNGdrMUdxOTdydzFTNk0xd3lvTTB2TG5SVDdBU0di?=
 =?utf-8?B?L2dYVjc4YlFPb2VMUzdJWnVKWmJzVWtsSEplbXVuVGNVN055SEMzWTZUY2pw?=
 =?utf-8?B?RWRwY1ZDQkwxRHdvUlFPTm5rS082cHNCRjdLMXZMd3E0M3lSZGl5UTVXN0lX?=
 =?utf-8?B?WEJ2c2VNRnY3SHVPejUxMkl3WUY3elJCYWFLYnNYdmVqOE52U1lWaTMxcGhY?=
 =?utf-8?B?a1pDdWN0bTFxaXRlWm55VVJpcTgwU2ZxV3l2UFhjZ2RvTDFpWmdHV2hZSUg1?=
 =?utf-8?B?dTBERVhsUzZ4T1dyZlB0ajI0ZGI3YWZabWVBdlBPaEhleU82ODNqb0xubFJZ?=
 =?utf-8?B?R2hLTk51KzdpY0k1anU1RWtOa2kvSnp4aE9oK0lveGRzbkF3bk85ZzA1eDlU?=
 =?utf-8?B?Rm82ejJNTTVjSGl3dnVqbUtxa1JoUEZWbldMclNhZ1drNmFxVHpuNVFONFc3?=
 =?utf-8?B?WTVmVTRJMmNpcTlVcUNUWGNzMnl3MXdWWGp6am9OOEVyWUxLYWJYWG5BOTc1?=
 =?utf-8?B?VlE3QVE4aWJNUVE5QWxXbXV0ZFc4d0ZKNCtBdklGbFhBLzBBQXgzYlA0cHVN?=
 =?utf-8?B?STZ5S3VRcFRhZVRUejhJMEROOEZTMmRIYllwc20wSWovYytzNFpKbWJrTWFz?=
 =?utf-8?B?UVVGTkpaSlhpUXJpNzV2bHZIcUlEa05OODJaS1orbTJnZ0hScG9CcEtuNTJY?=
 =?utf-8?B?Qk1lVWRwN2ZqYUxFRkw1eDFCTjlZNDdJaVQ0b3RCVElvRUZqZDBJUmJqZDUx?=
 =?utf-8?B?cHNvRTF2ampjVVk3cTY2ekw3dTdmSVB2TXJnbWZ6Z04yeFFRSUNTT3YrOFFD?=
 =?utf-8?B?bndPdFhrRzhiV1plV3crMVlQaklKNWhMK0ZpMDVvb1Q1SEQ1K0JTcWs4ZkZh?=
 =?utf-8?B?OG53aHZYUlJObUJlMGNzMGc0bzFJc0RVcVQ3anFGSUxVYlpZRzZ3SDdGckl0?=
 =?utf-8?B?SnlHQTdVUDJhYVV5Z2hObEhsTzRoSHZqUjN0MW1ITFVwdGJmelBJaER1S002?=
 =?utf-8?B?SHNkeHIvakxUYk9tOG9xZW9BOVdZRXJ3STNMOTZrOEpoTmN3WjQvRGZxcEl6?=
 =?utf-8?B?TnRFMndpbGxzY0lzOHlxT2ZrRDNzclBKbHdqZkFnTkVkeVFGeE9xQk5JK1ZS?=
 =?utf-8?B?aGtGcGlsNm1JU1BZUkNURmNhVXExRzVjR3NGaWdlUzVmdHdEc3FrWkhSTXlB?=
 =?utf-8?B?N1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A83AE1B23D3024CA8C461C51A17CF92@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d7080093-e1a0-458f-f14b-08db7ca13cbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 15:13:35.3593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pTXFeJeMpe/T4WECQBT62yLEko1zr27cyMZnna+5tUowZPBjyW450F9dBRlqgsy0kF78tyr1lYgGPM7ZPs3xnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6516
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: E0h2bF8NpYzNizi3WIMbvMcMD7qLnQRR
X-Proofpoint-ORIG-GUID: E0h2bF8NpYzNizi3WIMbvMcMD7qLnQRR
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGludXMsDQoNCk9uIEZyaSwgMjAyMy0wNi0xNiBhdCAxNDo0OCArMDIwMCwgTGludXMgV2Fs
bGVpaiB3cm90ZToNCj4gSGkgU2FyYWgsDQo+IA0KPiB0aGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+
IA0KPiBPbiBUdWUsIEp1biAxMywgMjAyMyBhdCA1OjIw4oCvUE0gU2FyYWggV2Fsa2VyIDxzYXJh
aC53YWxrZXJAaW1ndGVjLmNvbT4gd3JvdGU6DQo+IA0KPiA+IEFkZCB0aGUgZGV2aWNlIHRyZWUg
YmluZGluZyBkb2N1bWVudGF0aW9uIGZvciB0aGUgU2VyaWVzIEFYRSBHUFUgdXNlZCBpbg0KPiA+
IFRJIEFNNjIgU29Dcy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYXJhaCBXYWxrZXIgPHNh
cmFoLndhbGtlckBpbWd0ZWMuY29tPg0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGli
bGU6DQo+ID4gKyAgICBvbmVPZjoNCj4gPiArICAgICAgLSBpdGVtczoNCj4gPiArICAgICAgICAg
IC0gZW51bToNCj4gPiArICAgICAgICAgICAgICAtIHRpLGFtNjItZ3B1DQo+ID4gKyAgICAgICAg
ICAtIGNvbnN0OiBpbWcscG93ZXJ2ci1zZXJpZXNheGUNCj4gDQo+IEkgZG9uJ3Qgc2VlIHdoeSB5
b3UgbmVlZCB0byByZXN0cmljdCB0aGUgYmluZGluZ3MgdG8ganVzdCB0aGUgc3R1ZmYNCj4geW91
IGhhcHBlbiB0bw0KPiBiZSB3cml0aW5nIExpbnV4IGRyaXZlcnMgZm9yIHJpZ2h0IG5vdy4NCj4g
DQo+IEFkZCBhbGwgb2YgdGhlbSENCg0KVGhlIG1haW4gdGhpbmtpbmcgaGVyZSB3YXMgdG8gc3Rh
cnQgb2ZmIHdpdGggYSBzaW5nbGUgc2ltcGxlIGNhc2UgKFRJIEFNNjIpIHRvDQpzdXBwb3J0IHRo
ZSBpbml0aWFsIGRyaXZlciB1cHN0cmVhbWluZyByYXRoZXIgdGhhbiB0cnlpbmcgdG8gY292ZXIg
dG9vIG1hbnkNCnRoaW5ncyBhdCBvbmNlLiBUaGlzIGNhbiB0aGVuIGJlIGJ1aWx0IHVwb24gZm9y
IG90aGVyIEdQVXMuIFNvLCBmb3IgZXhhbXBsZSwgd2UNCmNhbiBleHRlbmQgdGhlIGJpbmRpbmdz
IHRvIGFkZCBhIHNlY29uZCBwb3dlciBkb21haW4gZm9yIHRob3NlIHRoYXQgbmVlZCBpdCwNCnN1
Y2ggYXMgdGhlIEdQVSBpbiB0aGUgTWVkaWF0ZWsgTVQ4MTczLiBUaGUgYmVuZWZpdCBvZiB0aGlz
IGFwcHJvYWNoIGlzIHRoYXQgdGhlDQpiaW5kaW5ncywgZHRzIGFuZCBjb2RlIGNoYW5nZXMgY2Fu
IGFsbCBiZSByZXZpZXdlZCB0b2dldGhlciBzbyB0aGF0IGFsbCB0aGUNCmNvbnRleHQgaXMgcHJl
c2VudC4NCg0KPiANCj4gVGhlcmUgaXMgdGhpcyBvdXQtb2YtdHJlZSBiaW5kaW5nOg0KPiBodHRw
czovL2dpdGh1Yi5jb20vb3BlbnB2cnNneC1kZXZncm91cC9saW51eF9vcGVucHZyc2d4L2NvbW1p
dC8wZGRkMzA4YTc4OTI2NzgyYjhhNzJmNzVjNzRiOTE0MTdjZWI5Nzc5DQo+IA0KPiBXaXRoIHRo
ZXNlIHR3byBvbiB0b3A6DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVucHZyc2d4LWRldmdyb3Vw
L2xpbnV4X29wZW5wdnJzZ3gvY29tbWl0LzA1MzM0NmUxOTMzOTMyODE1MDY2ZjE2ZWJmNmU2YmRh
NDVkNjc1NDgNCj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5wdnJzZ3gtZGV2Z3JvdXAvbGludXhf
b3BlbnB2cnNneC9jb21taXQvMWNiNjJjNGNkY2FkMDk2ZDQzOGVlN2QxZDUxZjYwMDE5OThhY2Vl
Mw0KPiANCj4gVGhleSBhcmUgaW5kZWVkIG91dC1vZi10cmVlLCBidXQgSC4gTmlrb2xhdXMgaXMg
YSB3ZWxsLWtub3duIGFuZCByZXNwZWN0ZWQNCj4gY29udHJpYnV0b3IgdG8gdGhlIGtlcm5lbCwg
YW5kIEknbSBwcmV0dHkgc3VyZSBoZSB3b3VsZCBiZSBjb250cmlidXRpbmcNCj4gdGhlc2UgdXBz
dHJlYW0gaWYgaGUgaGFkIHRoZSB0aW1lIGFuZCBpbmNlbnRpdmUuDQo+IA0KPiBUbyBtZSBpdCBz
ZWVtcyBtdWNoIG1vcmUgbGlrZSB5b3Ugc2hvdWxkIHRhbGsgdG8gTmlrb2xhdXMgYWJvdXQgc3Vi
bWl0dGluZw0KPiB0aGVzZSBwYXRjaGVzIGluaXRpYWxseSwgYW5kIHRoZW4gYWRkIFJvZ3VlIHN1
cHBvcnQgd2l0aCBwYXRjaGVzIG9uIHRvcCBvZiBpdC4NCj4gSXQgY291bGQgYmUgYSBuaWNlIHNl
cmllcyB3aXRoIGp1c3QgRFQgYmluZGluZ3MuDQo+IA0KPiBJIHNlZSB0aGF0IHlvdXIgYmluZGlu
ZyB1c2VzIGEgcG93ZXIgZG9tYWluIHJhdGhlciB0aGFuIGEgcmVndWxhdG9yDQo+IChzZ3gtc3Vw
cGx5KSBmb3IgcG93ZXIgYW5kIHRoYXQgaXMgcHJvYmFibHkgYSBiZXR0ZXIgYXBwcm9hY2ggYnV0
IG90aGVyDQo+IHRoYW4gdGhhdCB0aGUgb3BlbnB2cnNneCBiaW5kaW5nIGxvb2tzIG1vcmUgY29t
cGxldGUgYW5kIHRvIHRoZSBwb2ludD8NCj4gDQo+IEl0IHdpbGwgYWxzbyBoZWxwIHRoZW0gdG8g
Z2V0IHRoZXNlIGJpbmRpbmdzIHNldHRsZWQgc28gdGhleSBjYW4gbWVyZ2UgYWxsDQo+IG9mIHRo
ZSBEVFMgcGF0Y2hlcyBhZGRpbmcgdGhlIFNHWCBibG9jayB0byBtaXNjIHBsYXRmb3JtcyBpbiB0
aGUNCj4ga2VybmVsIHVwc3RyZWFtIHNvIHRoZXkgY2FuIGZvY3VzIHRoZWlyIHdvcmsgb24gdGhl
IGFjdHVhbCBkcml2ZXIuDQo+IA0KPiBXaGVuIEkgbG9vayBhdCB0aGUgUG93ZXJWUiB3aWtpcGVk
aWEgcGFnZToNCj4gaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvUG93ZXJWUg0KPiB0aGVy
ZSBpcyBubyBjb3JyZXNwb25kZW5jZSBiZXR3ZWVuIHRoZSBwcm9kdWN0IG5hbWVzIHRoZXJlIGFu
ZA0KPiAiaW1nLHBvd2VydnItc2VyaWVzYXhlIiBhcyB1c2VkIGhlcmUuDQo+IA0KPiBJIHRoaW5r
IHlvdSBuZWVkIHRvIGV4cGxhaW4gaWYgdGhlc2UgYXJlIGludGVybmFsIHByb2R1Y3QgbmFtZXMg
b3Igd2hhdA0KPiBpcyBnb2luZyBvbiwgYW5kIHdoYXQgdGhlIHJlbGF0aW9uc2hpcCBpcyB0byB0
aGUgbWFya2V0aW5nIG5hbWVzLCBpdCBjb3VsZA0KPiBiZSBwYXJ0IG9mIHRoZSBkZXNjcmlwdGlv
biBzaW1wbHksIHNvIHRoYXQgcGVvcGxlIGtub3cgd2hhdCBzdHJpbmcgdG8gdXNlDQo+IHNvbWV3
aGF0IGludHVpdGl2ZWx5LiBNYXliZSBhbGwgdGhlIHN0cmluZ3MgaW4gdGhlIG91dC1vZi10cmVl
IGRvY3VtZW50YXRpb24NCj4gYXJlIGp1c3Qgd3JvbmcgYmVjYXVzZSBpbnRlcm5hbCBjb2RlIG5h
bWVzIG5lZWQgdG8gYmUgdXNlZD8NCg0KSXQncyBiZWVuIHF1aXRlIHNvbWUgdGltZSBzaW5jZSB3
ZSBvcmlnaW5hbGx5IHdyb3RlIHRoZXNlIGJpbmRpbmdzLCBzbyB3ZSdsbA0KbmVlZCB0byBnbyBi
YWNrIGFuZCBjaGVjayB3aHkgd2Ugc2V0dGxlZCBvbiAicG93ZXJ2ci1zZXJpZXNheGUiLCBidXQg
SSBzdXNwZWN0DQppdCB3YXMganVzdCBhIGNhc2Ugb2YgdXMgbm9ybWFsaXNpbmcgdGhlIG5hbWlu
ZyBhY3Jvc3MgZGlmZmVyZW50IHNlcmllcy4NCg0KVGhhbmtzDQpGcmFuaw0KDQo+IA0KPiBZb3Vy
cywNCj4gTGludXMgV2FsbGVpag0K
