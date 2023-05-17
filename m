Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F5B707056
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 20:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FD410E42C;
	Wed, 17 May 2023 18:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2138.outbound.protection.outlook.com [40.107.6.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F2F10E42C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 18:01:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zl1jj1CIIs0z/Byz1qFy68hC7OGhEE71R+pWh+YHbD5TTnbeY+RKeNEIIOLsJ0bQ7SWwXWNGv+W8QhGpnq4EbeMWsycX6EgNqoREyZofCGPqz/EcgAdc8cb/uIVXy46Pvo26mVUu8vwsx49vf3qvB4VH1TjJSvAfGYELUGRngESGG7Yg9t3meFRX0YjuAEJ+Et6MntH81cMVtoxrfnOp8a7IcqysIH6hMolaM3vhAahuufDzVUR+xb0nyKRW6E4WBhQvF2aRJbRK+yatoVjL+t/8MBSs6NREpsIaIp8ajvOIVfbJNRzPDfS8L5o0VnwFFvitNoOEIYINUu6HWtP5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCdKt15RvcNVf1i6o00qdyrhlPyBZXtkbPUPVu5tkU8=;
 b=L7C57zNvagLQkfAkT7zqwrs50DMTIb1dL8ZxKdhDxdyZ8K1HyWbMLM//87UZtbcOP2+j4LueNRpsruQramXQr/tNr6LYeIoNVUOtiqMIBuLuOIf4FBRuWboK3Syfo/TiRUKh9Ijw9M/nshrXgB1E0yuJGFjqEHHstPkts18OcVaWoTuUAwcolNIm2Q81JXrxNSllhp4QRtnx5s7doFfGH/Sdy0Lspp2EV8cQUxgfK2FImDJ6CfWdKSQrZRqR/m9G8EWIAReWviziC8TAhcAyQ9Twki34hIlJ5VZM8Fd5K6hvoewHXM6EHpZZnCHUWYlGPpDdBlJEPrS75AMizzWUnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCdKt15RvcNVf1i6o00qdyrhlPyBZXtkbPUPVu5tkU8=;
 b=p1KCwMoW10KfCXWDziN+Pnmh4jdHi4zRL7arY8V9gcUkzsQM5OssCy3AnmPhU7VlbIDJdHXIbwL8VLhEuvpltBCB250BYOU2V+ODEImFz0c0JwwdZfdPUUKNPzBSlHJrW5F0Gj9q+Px6ifbIrUwZ06pwnKboV7RY4aIkzK7cAe8JzLNGXiUBXKeahaGeOFOoK/QrrLfVN8sscpPI3xds1bhGXnWxc02nm8B1jP3xkcF4Gf2oxyZaR3gk0zkzmhvUycmNXY4F9HT176iMrktb5UwCkqQhaLhpZCVXL6bKbuax+3BpCMW036JrvjnzqhTuszWp6+KUyHma+XPKNv/G5Q==
Received: from AM9PR02MB6611.eurprd02.prod.outlook.com (2603:10a6:20b:2c9::22)
 by VI1PR02MB5805.eurprd02.prod.outlook.com (2603:10a6:803:133::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.34; Wed, 17 May
 2023 18:01:32 +0000
Received: from AM9PR02MB6611.eurprd02.prod.outlook.com
 ([fe80::f438:b108:b9b8:5e34]) by AM9PR02MB6611.eurprd02.prod.outlook.com
 ([fe80::f438:b108:b9b8:5e34%7]) with mapi id 15.20.6411.017; Wed, 17 May 2023
 18:01:31 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Oded Gabbay <ogabbay@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 05/12] accel/habanalabs: print max timeout value on CS
 stuck
Thread-Topic: [PATCH 05/12] accel/habanalabs: print max timeout value on CS
 stuck
Thread-Index: AQHZh9kg0E4PBc0eiEStqLOsAr1WoK9ew4WA
Date: Wed, 17 May 2023 18:01:31 +0000
Message-ID: <047a27b0-f0aa-646a-74da-16b1e4090381@habana.ai>
References: <20230516093030.1220526-1-ogabbay@kernel.org>
 <20230516093030.1220526-5-ogabbay@kernel.org>
In-Reply-To: <20230516093030.1220526-5-ogabbay@kernel.org>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR02MB6611:EE_|VI1PR02MB5805:EE_
x-ms-office365-filtering-correlation-id: 573a807a-ed08-4d11-68b0-08db5700bed6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JhSRldrq/1zo0hy+dF1UVp+zYUXdib0lw6N5sFcEhZrXJ+zP3oM/F1QUGDANhVdxrcYeWWkIlQmkccQizo3NCXtB9NtVOzCY4Ne+i7hIlYUJ7Pb7Ajqi/LA5QMQ76G+NBh7rNbfWIUBXp3HKizUcRuErYGuLuou2ZivLFPmDRLwsC69s8pLi40BTIBh/JXQ/R5LEcKfuxHxzB3HRxN5Qwol7cbbQoP+kbwx9StzGNmSo6IwUyDLUY5ts8NA2f6MO3zQ+b7bjrCsHsGx/ad58Oxye/swpZhextRaZUnOl1pSuxKR0dt5CHwKhAXTCWiTCkV7ZOykkrq6Rpnm28Hx/naKrIEdf2ZmEctEVNcbHo50xL1g0TYmCk+TJD7OoE6qpwMwsF937z45Eha2fgucv5rMBkTEuXpCoZNiNcu1YcSmg7vc3s+b+1MQH4Ietpnx6q9jPenzBqTUQOUDti2j687k6llEoaqiOQYndB1YFTmRXScHCV2Ifemz1nAM5rH+SNpDKB85J+u6WKy6Nq4SsjTVYSoFePXZDuMpnm+s/MbszJ4sBEN1+h1agJqXqm4LJKHhOYp4hB6BRA0xT6yskGKTUe4nZRuEy1KvhEyJIKuMljkzC1KJNkfFzBHTsFfOnTAibZAMVFiU/jywbC3n+iQTr8/kBHXrKzWKdIodX3HxHMXH0Ijm0dZWioVORQ2Td
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR02MB6611.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(366004)(346002)(39840400004)(451199021)(82960400001)(6486002)(38070700005)(186003)(26005)(53546011)(83380400001)(2616005)(6506007)(6512007)(36756003)(38100700002)(86362001)(31696002)(122000001)(71200400001)(31686004)(64756008)(66476007)(76116006)(66946007)(66446008)(66556008)(8936002)(8676002)(316002)(5660300002)(91956017)(41300700001)(2906002)(110136005)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDBhb1BKTGNMRkhKMzlXKzlGRXZLdmZnNE1lbXRucVQ2YnVLbWRmYXZDSlBR?=
 =?utf-8?B?czFsUjhnWGdLQzVyNUZHWGxTL3Q1VUZFRSsyT25uU2U3OWlBVTdPd05aeFZB?=
 =?utf-8?B?YzQ2WWx0Y0NRSW91azlqN0JBWXVKUkpjWkVsV0VMZ0dsMEVQOU1rUno0VWcw?=
 =?utf-8?B?dmlBNE5TRGFGNk5qdDYyOFVDMzEwTlJlVDdxL0xabVJkWjV3YTVUZmpXeVJI?=
 =?utf-8?B?bkExeG1WdzZYa1ZLVVhhYnYyV3hlc3JGeU1hSUJtRmhXTjBxTGFQRDRPaktM?=
 =?utf-8?B?SlQyQVVsWDBYMFlwU05TZUNFOGRxUEViUnBzb28rRVdXb0hyUlVrQllqRVVU?=
 =?utf-8?B?bTBSY0RDckZzbGpzeHByWDE2TzJxblZueVRSeFZ3MUJrZTE2Tnd5aUtqZE9N?=
 =?utf-8?B?U0llbzVmZkltSXdaKzZDMFdpWjhkdkRXZG9GREk0cGVGSGtmc0VVaGtuMENo?=
 =?utf-8?B?L3ducVBDcGtTazlrK2JQUjRXVFlrSTFzQnBLMVVicHczQlZZUU56OWlObkpk?=
 =?utf-8?B?RDI3ZjJPbkxsTXhjOHZEOEJXeUc5dktZcSt0RG9NSXkvZG1OL040aGRZVVZm?=
 =?utf-8?B?dExRQkNKRU5JTlVFcUFXQ2tWaWN1aUNLRmNkUzF5SklCZGZtbGhRdUhaQmFH?=
 =?utf-8?B?K1BzNGJQRk03UVJqVytpVHdhL1J1RWRIMlYxS245SFpsS2ErZDA3VUtIT3F1?=
 =?utf-8?B?Slc5cXFEQ0o0djMvOFBNemM4SXA1cWdjMmRyaE4xWDMwUzAxMHhYdXZSMTUx?=
 =?utf-8?B?cllyU2Vjb2xPempZa1ZQZHJOQm9BbGdIczN0V201VzhZa1lhQ2c0TTNvZjNL?=
 =?utf-8?B?YU5EVlhSa3hsenFCQk9LZ2R3Qk0yWnhVVjMwN0c0dFJkUEdIZzkxNnpCN1J5?=
 =?utf-8?B?amEzaEEySFZPZCtsOUJJMFYxdXc4VU0xZEZSMzR5YkhKSUdDNkIwMjBLSklj?=
 =?utf-8?B?NmtxZUhCR21ZalRvNjd4dTlrbk0xc2Z3MU1KRnBCQVl1K3BKYWM2Y1BrRnNw?=
 =?utf-8?B?N01wRXgwWUNkRFdsVm1pVjdKK2FFUStSMGNHMVhXMGdsNDBEdGM2QmxzRHk0?=
 =?utf-8?B?RG1kUWZCR1dsVDIwNHhnbXFrdHUzU1E5ZVQ4dXZTZytpTVYyZ0RBeTc1ZDV0?=
 =?utf-8?B?amRnMWVTWUZwd0tvbDA0emZOTzNHQUdSRXAvOFFtaVMzblkxY2d5WGlxYUVp?=
 =?utf-8?B?dmpDaFVZd29GdWsrMUF1QWd2YnhUSzY4QURxRjJPaXZBTlBQTTdXdDFoKzU2?=
 =?utf-8?B?MjAxSTdIWWJoR09XTmZjajRJMnJsaGROSXV3R1c3SHJzbllxdU9MQXBKUU0r?=
 =?utf-8?B?SzVDSTNaWW9vdVdTOTF0OGZiSW1nS0Y3YVdxRlprTGFUcjYyNTkvVGY3N0JM?=
 =?utf-8?B?aU4wZ2FBd09FYWNQc3JoZVpQUHdsK0ZxWkZMY1FqZ0NuZHBUd29yWGpGc0pX?=
 =?utf-8?B?TU55SEpXck85YWFGcGV5TXZtT3R2dnpTWGNaQm1lRzB6RTRGZTJzdWxzazVR?=
 =?utf-8?B?MDB5cVdkWU1OMHRpbzBneWU0U0l3WXpnd1FKUzNaVkljczNtRlhMZFlwVysz?=
 =?utf-8?B?TERTa3p2NWUrc2MrVVFPNjc4dThVSGdaaGtwMkIvODR3dDQrVnJISWJYWU9M?=
 =?utf-8?B?TG16Z3NwZ3huNENFWnFnaDR0NTJoVlVhWmNyMjEzaU5MbUVnN2NIam1zdUd5?=
 =?utf-8?B?amVrYlp2bHhWc3k4UHJuN0dyUEt5K0lWK2l4U1NjOTg5N0x3a2VVRk1ldFNF?=
 =?utf-8?B?azlGUmZuTFBVMjR4aDAzbHJqUnNldzN1TlNRT09VUnNTZ0d5ODNnRU4zVllq?=
 =?utf-8?B?eHk3dW5HMmJ5ejRsaDMzSkEvd0laOXJYSmZIR2o4ZTRBcnd0S3NpK0krNldj?=
 =?utf-8?B?S0FhVmN4dDhHTmRxVlY2b1ZTZGJvU0pNM3JSRFNoNHVNZXUrVk40Y2MrRTFO?=
 =?utf-8?B?ZVhBZHhZQWhuZEFiSVdQazA1WjJCbjFJL1kvNTEyVHg4M0VWK0tiNEtWVGhU?=
 =?utf-8?B?bXhEZ2ZTaDJudFliNUp4c1ZoZ0kycXROUFVVUGdMVVFhUlVJeExKMkNnMVFh?=
 =?utf-8?B?UTg0NVJmdkk2d3VITHRPVHB5dURHTThvZEZNSEw5VDJFeFFQQTFEUGwzdExS?=
 =?utf-8?Q?larQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31954BC07290A24D8CF050BC4710F325@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR02MB6611.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 573a807a-ed08-4d11-68b0-08db5700bed6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2023 18:01:31.6097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZqLkY4StlAOhDyWVOHOAYekvElmnT6FE9gIwUZtC8pQl0FUVr3z1hpZpPe6fRk8zi7pg5UaBbE4uSo24jNUoOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5805
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTYvMDUvMjAyMyAxMjozMCwgT2RlZCBHYWJiYXkgd3JvdGU6DQo+IElmIGEgd29ya2xvYWQg
Z290IHN0dWNrLCB3ZSBwcmludCBhbiBlcnJvciB0byB0aGUga2VybmVsIGxvZyBhYm91dCBpdC4N
Cj4gQWRkIHRvIHRoYXQgcHJpbnQgdGhlIGNvbmZpZ3VyZWQgbWF4IHRpbWVvdXQgdmFsdWUsIGFz
IHRoYXQgdmFsdWUgaXMNCj4gbm90IGZpeGVkIGJldHdlZW4gQVNJQ3MgYW5kIGluIGFkZGl0aW9u
IGl0IGNhbiBiZSBjb25maWd1cmVkIHVzaW5nDQo+IGEga2VybmVsIG1vZHVsZSBwYXJhbWV0ZXIu
DQo+DQo+IFNpZ25lZC1vZmYtYnk6IE9kZWQgR2FiYmF5IDxvZ2FiYmF5QGtlcm5lbC5vcmc+DQo+
IC0tLQ0KPiAgIC4uLi9oYWJhbmFsYWJzL2NvbW1vbi9jb21tYW5kX3N1Ym1pc3Npb24uYyAgICB8
IDI2ICsrKysrKysrKysrLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9u
cygrKSwgMTEgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjY2VsL2hh
YmFuYWxhYnMvY29tbW9uL2NvbW1hbmRfc3VibWlzc2lvbi5jIGIvZHJpdmVycy9hY2NlbC9oYWJh
bmFsYWJzL2NvbW1vbi9jb21tYW5kX3N1Ym1pc3Npb24uYw0KPiBpbmRleCBjY2Y2OGY0ODI5NDgu
LjRlYzI4YWYzZWQ3OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9hY2NlbC9oYWJhbmFsYWJzL2Nv
bW1vbi9jb21tYW5kX3N1Ym1pc3Npb24uYw0KPiArKysgYi9kcml2ZXJzL2FjY2VsL2hhYmFuYWxh
YnMvY29tbW9uL2NvbW1hbmRfc3VibWlzc2lvbi5jDQo+IEBAIC04MDQsMTIgKzgwNCwxNCBAQCBz
dGF0aWMgdm9pZCBjc19kb19yZWxlYXNlKHN0cnVjdCBrcmVmICpyZWYpDQo+ICAgDQo+ICAgc3Rh
dGljIHZvaWQgY3NfdGltZWRvdXQoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiAgIHsNCj4g
KwlzdHJ1Y3QgaGxfY3MgKmNzID0gY29udGFpbmVyX29mKHdvcmssIHN0cnVjdCBobF9jcywgd29y
a190ZHIud29yayk7DQo+ICsJYm9vbCBza2lwX3Jlc2V0X29uX3RpbWVvdXQsIGRldmljZV9yZXNl
dCA9IGZhbHNlOw0KPiAgIAlzdHJ1Y3QgaGxfZGV2aWNlICpoZGV2Ow0KPiAgIAl1NjQgZXZlbnRf
bWFzayA9IDB4MDsNCj4gKwl1aW50IHRpbWVvdXRfc2VjOw0KPiAgIAlpbnQgcmM7DQo+IC0Jc3Ry
dWN0IGhsX2NzICpjcyA9IGNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3QgaGxfY3MsDQo+IC0JCQkJ
CQkgd29ya190ZHIud29yayk7DQo+IC0JYm9vbCBza2lwX3Jlc2V0X29uX3RpbWVvdXQgPSBjcy0+
c2tpcF9yZXNldF9vbl90aW1lb3V0LCBkZXZpY2VfcmVzZXQgPSBmYWxzZTsNCj4gKw0KPiArCXNr
aXBfcmVzZXRfb25fdGltZW91dCA9IGNzLT5za2lwX3Jlc2V0X29uX3RpbWVvdXQ7DQo+ICAgDQo+
ICAgCXJjID0gY3NfZ2V0X3VubGVzc196ZXJvKGNzKTsNCj4gICAJaWYgKCFyYykNCj4gQEAgLTg0
MCwyOSArODQyLDMxIEBAIHN0YXRpYyB2b2lkIGNzX3RpbWVkb3V0KHN0cnVjdCB3b3JrX3N0cnVj
dCAqd29yaykNCj4gICAJCWV2ZW50X21hc2sgfD0gSExfTk9USUZJRVJfRVZFTlRfQ1NfVElNRU9V
VDsNCj4gICAJfQ0KPiAgIA0KPiArCXRpbWVvdXRfc2VjID0gamlmZmllc190b19tc2VjcyhoZGV2
LT50aW1lb3V0X2ppZmZpZXMpIC8gMTAwMDsNCj4gKw0KPiAgIAlzd2l0Y2ggKGNzLT50eXBlKSB7
DQo+ICAgCWNhc2UgQ1NfVFlQRV9TSUdOQUw6DQo+ICAgCQlkZXZfZXJyKGhkZXYtPmRldiwNCj4g
LQkJCSJTaWduYWwgY29tbWFuZCBzdWJtaXNzaW9uICVsbHUgaGFzIG5vdCBmaW5pc2hlZCBpbiB0
aW1lIVxuIiwNCj4gLQkJCWNzLT5zZXF1ZW5jZSk7DQo+ICsJCQkiU2lnbmFsIGNvbW1hbmQgc3Vi
bWlzc2lvbiAlbGx1IGhhcyBub3QgZmluaXNoZWQgaW4gJXUgc2Vjb25kcyFcbiIsDQo+ICsJCQlj
cy0+c2VxdWVuY2UsIHRpbWVvdXRfc2VjKTsNCj4gICAJCWJyZWFrOw0KPiAgIA0KPiAgIAljYXNl
IENTX1RZUEVfV0FJVDoNCj4gICAJCWRldl9lcnIoaGRldi0+ZGV2LA0KPiAtCQkJIldhaXQgY29t
bWFuZCBzdWJtaXNzaW9uICVsbHUgaGFzIG5vdCBmaW5pc2hlZCBpbiB0aW1lIVxuIiwNCj4gLQkJ
CWNzLT5zZXF1ZW5jZSk7DQo+ICsJCQkiV2FpdCBjb21tYW5kIHN1Ym1pc3Npb24gJWxsdSBoYXMg
bm90IGZpbmlzaGVkIGluICV1IHNlY29uZHMhXG4iLA0KPiArCQkJY3MtPnNlcXVlbmNlLCB0aW1l
b3V0X3NlYyk7DQo+ICAgCQlicmVhazsNCj4gICANCj4gICAJY2FzZSBDU19UWVBFX0NPTExFQ1RJ
VkVfV0FJVDoNCj4gICAJCWRldl9lcnIoaGRldi0+ZGV2LA0KPiAtCQkJIkNvbGxlY3RpdmUgV2Fp
dCBjb21tYW5kIHN1Ym1pc3Npb24gJWxsdSBoYXMgbm90IGZpbmlzaGVkIGluIHRpbWUhXG4iLA0K
PiAtCQkJY3MtPnNlcXVlbmNlKTsNCj4gKwkJCSJDb2xsZWN0aXZlIFdhaXQgY29tbWFuZCBzdWJt
aXNzaW9uICVsbHUgaGFzIG5vdCBmaW5pc2hlZCBpbiAldSBzZWNvbmRzIVxuIiwNCj4gKwkJCWNz
LT5zZXF1ZW5jZSwgdGltZW91dF9zZWMpOw0KPiAgIAkJYnJlYWs7DQo+ICAgDQo+ICAgCWRlZmF1
bHQ6DQo+ICAgCQlkZXZfZXJyKGhkZXYtPmRldiwNCj4gLQkJCSJDb21tYW5kIHN1Ym1pc3Npb24g
JWxsdSBoYXMgbm90IGZpbmlzaGVkIGluIHRpbWUhXG4iLA0KPiAtCQkJY3MtPnNlcXVlbmNlKTsN
Cj4gKwkJCSJDb21tYW5kIHN1Ym1pc3Npb24gJWxsdSBoYXMgbm90IGZpbmlzaGVkIGluICV1IHNl
Y29uZHMhXG4iLA0KPiArCQkJY3MtPnNlcXVlbmNlLCB0aW1lb3V0X3NlYyk7DQo+ICAgCQlicmVh
azsNCj4gICAJfQ0KPiAgIA0KDQpSZXZpZXdlZC1ieTogT2ZpciBCaXR0b248b2JpdHRvbkBoYWJh
bmEuYWk+DQoNCg==
