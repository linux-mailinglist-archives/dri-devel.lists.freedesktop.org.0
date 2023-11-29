Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAC17FD628
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 13:01:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C7910E1B2;
	Wed, 29 Nov 2023 12:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B75610E1B2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 12:01:38 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AT7fUif007239; Wed, 29 Nov 2023 12:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=cqB3JoYcTSqP6QcWhVn9xqayfef6XZ5u3g+uKkUIcdc=; b=
 Nzs9TahngJxVHFMrS+eoAvQ8L8UYXd2B3O2eg2ws/2O2QuEjyh+i5b30uuUUlZNH
 1xf4Hf6O0W3Wt+ffVBV2J1Y/YodaRnObioFgp/hlEYOlP2pqxjvKIE2/1Cf6bZR7
 DFnWMzjALFbnqRKk09OYdo6sRJmSz7Bjn2CX40e2o7KAPIdJXK46aAPO9GhacNo+
 I8zKGv6eu2KEOwBa410r20FsOOWeSn68VO4Ezu7Now1yCw4iFhQ4OiCOF3O2n1Av
 V9XUf5wxZxHJ8wYroXJ3HKwaxpIFDawgye3ILI0s+qrGWVE2MFUDannD7dH0Xil3
 dOpnZsxHSDZwJMlUBsAyYQ==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3unvk1r9a2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Nov 2023 12:01:23 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 29 Nov 2023 12:01:22 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 29 Nov 2023 12:01:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXvCqGO7hDBXF6klmcjFJYpVPvrLooBt9xxU1Lg8RCv6HsmCqpxTL7AmjJtDRD+WA63pMjqw1KQGJSgYE+x+1NJg6gcDXhOCBQAUCsGMqgOaOl1TxlQbRUtUEoQ+cb++IUMbmzUjip5bAEH6fu1anyR0S37Naddjrsje2p/cs6LO9e/Y1r63gs0DfFSmcTqcXEYx7VQSGjxkgjwazNao6d8SXbj46Tj3JK+NIdY4qllhJWmp0tsfFK0x2x62yNSPvNd9Bs/ye2x247vNQ+VH0apjEqnVmYASuNq3V915J8SbAfSG/6FJOC9Fq+H65VZo6e5KfmUmD2tmz6yuWTaIgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqB3JoYcTSqP6QcWhVn9xqayfef6XZ5u3g+uKkUIcdc=;
 b=hYJQcnwFgR6W2jwEkj6KRR6E3u1s8fyxW3W+ftriqtmMEC6oKASCgP4wqZqpa1yZxpZ/NXFRTuW4/Bn59mdTgrxD/f+s3H35ffZtIelmmu53bm2N42pK29QlP4lrT5nCctqwK4RQUiEdRtCCa40iSCXE/xTC/7/ieE9hukjwN3ZpHYV+jdnQ5pz9WCMoGGC3Z1TI3UJMNRwiIHCQaiBFP8F47m7SAOlmk3XgI23tZeSwt3ldM2FNihMadKCq00DuQzBnqwMoh4ToRwj6jhyY5X7hFPRSMfI4kj4nk/R1Kw4ZjehNNzZjeQRsQvJdqLdtW/WmBlqSrnyGalqk2Uudpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqB3JoYcTSqP6QcWhVn9xqayfef6XZ5u3g+uKkUIcdc=;
 b=TKNhnadLiABDceKJseaZQV982YwaJ4ub5z+tO1pWsL8//S864ppq6+cIIMBYEZoB1Kf+N+8mOyRIoKBoT8GLr9csleHKepcHRidYD49jmLXnhtqUwjqRDuI3W5Em2ZLxn/TT82HqyRwZ98W3O32oKfq3JE8P7RxCvd2O6lrGsvU=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO0P265MB6358.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Wed, 29 Nov
 2023 12:01:20 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 12:01:20 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: Frank Binns <Frank.Binns@imgtec.com>, Matt Coster <Matt.Coster@imgtec.com>,
 "arnd@kernel.org" <arnd@kernel.org>
Subject: Re: [PATCH 2/2] drm/imagination: avoid -Woverflow warning
Thread-Topic: [PATCH 2/2] drm/imagination: avoid -Woverflow warning
Thread-Index: AQHaIrikzvgR69X/lUCB5pDnjiHAwbCRMhYA
Date: Wed, 29 Nov 2023 12:01:20 +0000
Message-ID: <9df9e4f87727399928c068dbbf614c9895ae15f9.camel@imgtec.com>
References: <20231129113825.2961913-1-arnd@kernel.org>
 <20231129113825.2961913-2-arnd@kernel.org>
In-Reply-To: <20231129113825.2961913-2-arnd@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5770:EE_|LO0P265MB6358:EE_
x-ms-office365-filtering-correlation-id: 2811f9d9-8c6e-4ed1-a2ce-08dbf0d2e6b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gmfMiHjh0f+kE5M5TsMB3wZKTgXbwW+o8gDIIE+KC7Nw5WO0aIXeRYFna1rf9IyhEKTbH0pGisz9+BoBWkbByJ+yrmRmOoRNwo5zk+KJaebgNldKuGctfFg+1EIV6+d0IBMkQASuQVjDuE9kzueerSTTctUb9gV+Mjso/sKoek0E2p/OKUrgfnbuGZ4aGsesgjWJJ0OJh9dlHku04YDDxVjC3rbWmuHjOQtuftVCNt6CJ0pepzHZIX81StfKSHEfwRU2U3DTA2oIK3TNg0xuWV7VBJ2Te6T6Qo1Uv43U8rHJcDGKIkOLc8H2PPYt6hXPgaK8uqrjRMvjR6HzY37V3hLhWvaJL/bEmKWAw3TsZRvc76/vS9+oUPIVD77wheme/GA89CwnPpfQTgPC00GWOGIcHGjrBEBinJzgRpe5O7INqzHLZkYrIDDVBqcwCM+XQ5/UajXtUF4w6RZWmsBg35xMxyPBVdePxFMYa5gbPd+ZB8Zt2X95ZPUevqE+ucI06h2zrj/NfQ8+sfcQUYFkseipCwtVx+jk1HXSotPnmcFR8SAA7jCMR0c+vg9CyFXDjz5FNL6hHCA6ekYt72eDWLi1R/0WSrCQD5vyxzxa+RrKrukl1VVTfa7BPuUbhwMqTS1NL/dnAbi4sIJvIFDcHA4QPZw5meTKthfCDqxwxp8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(39850400004)(366004)(396003)(230922051799003)(230273577357003)(230173577357003)(451199024)(64100799003)(186009)(1800799012)(38100700002)(38070700009)(36756003)(122000001)(86362001)(6486002)(41300700001)(6512007)(478600001)(71200400001)(6506007)(4001150100001)(4326008)(8936002)(5660300002)(8676002)(64756008)(54906003)(66446008)(316002)(110136005)(91956017)(66946007)(66556008)(76116006)(66476007)(2906002)(26005)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWhEenQ3T0FtRnErejlNNlJEUjlCOGY3L0lpdXR3RVlSZTdvQ3l0bmJGL0Qv?=
 =?utf-8?B?bkxFZ2E2eWNmRzQ4OWpLMENLemR5aUxlVnNQNWd3WkNBV0pyeGNRZmxoczBE?=
 =?utf-8?B?eTJsVVRtcnVIZ1Bna002TnNMMGpCUldMYnpKZndHY012N0t3eC9VTFZyVTRI?=
 =?utf-8?B?T0gvdzN2N1BxTUxSM1M5dWVBTFlVOWp2TXNjQ0t0UnU3SUo0UjFqaVc2bDRz?=
 =?utf-8?B?TlMrSmdRSTVGam9XY0dnMDNzSmczOGxPVFN2aS9pUFQ3cGhuMEh3RkRiZzU2?=
 =?utf-8?B?T1RBMm9iWEgzWEZMdE16QTVZbi9xbDRhbkFvUjlZRVpjQkw3dGFleS92VWZT?=
 =?utf-8?B?T3RDeTBQYVNWeHY4dDR1WEQ2WEp6OFBwV3ZwekNXQkFvV21YRmJDdkphbmFY?=
 =?utf-8?B?eHM3MXJMNW5RZ2k0Rkd3am1xR1NBV2VCOVRZb1Q5SUtobnhGMVZXTCs4VE5t?=
 =?utf-8?B?cjZuNlFHaERPNlRrMWpmeXhZYXE0dFoyaWx3Qk5oQlpaZ2pVR1B0MHR1T2Rv?=
 =?utf-8?B?cktPMFdEcnJ0K1BaN1JvN1l5K0svZFlpeVVMNVdQY3NUT3MvVm1oOTBjNGND?=
 =?utf-8?B?SXh4L0dqYlU4dlNtcnFDR3o4ZG1oZDZPbm1Md2RvWXF0MWY5TGx4R2pZekNF?=
 =?utf-8?B?QjNNTUhIaXozMHh2YjZxdktrdEpCMzJmNFNFUjUwSU9oQkdUV1pJZk5KZEl6?=
 =?utf-8?B?NGNJcDBtd2RyK2tNNUF1aDQ0WDhOdlFWa1lLT1diWURYR1R4ZDFZMGxac0FR?=
 =?utf-8?B?NDF2bVkrQWpwSzdLeTRmb08xWGRrd0w5aUc1VW9SZFJ2b3VYbTJ0R0VDTER0?=
 =?utf-8?B?WFJ6Y2I2QUkyQmVUTnJpcVViODFMNEFtZnJja2NPVk9VYUVyTnE0bXIzeEdM?=
 =?utf-8?B?Z29QS2RpSkdGZHdnYXRWQ09DbHdvWlJBcDFELzU0S0Z5V0NDdFd0cXEvYjZF?=
 =?utf-8?B?eWd6MVB1MFB1TG1UNjBtUENUZUhjV01vcmJZdE9BTVByT3BFS1g2NGhKVTA2?=
 =?utf-8?B?S28rMjZVa3ZBU0doNVgyYzZja3lSRGRRZVdRQU9sQWxVcXhtM2tYK05EaTB3?=
 =?utf-8?B?RnZTMms0aElrSk1BTHRVbHZTVVFYSjBsVlBRdUhLdWVoYzRLWWMxR2JiRzZ6?=
 =?utf-8?B?ZFpESG5uTWlzTzFyVE1wbzBVdlZwWkRPR0thSUovemswZE9KK1FwWWhROEto?=
 =?utf-8?B?RHluYXNHQW1aSGlkU3NwRWpmS0R6UDJtNFNwOVdtRHF5QWxVcHVCYzNaVnlp?=
 =?utf-8?B?cFZqRk02cFRPRHd6ckRaZlQ4YjZiQm5iVm1nUzNBL1pXbmNZVVNTQlUxZVFF?=
 =?utf-8?B?WFNwdWxRYlEreFB2bGZTem42NWl6bGJMbWh6TnlwTFBVaTE3bHJTQ0ZDR3J4?=
 =?utf-8?B?bDU2YWRybjNQQWMxU3N6M1orNHJkcTY2YTJzeHMybFl0SE5IOUpVMXpnUlpP?=
 =?utf-8?B?cWlFYjZPS2ZiR2NwSGZOdlFEeVFJNXUrVURDY2RvRzBiT2laNXFTMmpMSzFL?=
 =?utf-8?B?MmNQem5DSDdycjY0MXdsd2Q0ZFJ0eUdKQzhGOHNuOTJvYkVJUS85NFUyN1Vm?=
 =?utf-8?B?eTk0dStiRjFXNmN5TFl0T3Q5dnh0S2QwVXFhaldTNFRHL2kzMnJsUkovK2h2?=
 =?utf-8?B?OEEvU3NiNHF2MFBaSVdwbkVwT0ZYZG5EbEhCVHF1UUtFaUE0RjNpVGlRRUxP?=
 =?utf-8?B?S25RQURpQThpa2hYVVpLc3BKbEplM2FQZ3BISytJMGRKK2hIS2FWQkphMlU2?=
 =?utf-8?B?bExWMGtWcXdvY0s0ckFBc3ZnYmN1cEtoK2pYWkJjYlUwdGV2V2hSRWNjYlJU?=
 =?utf-8?B?TkpWZk9rc1pobmhpaWhjQ2piY0NBRTR2b2s3bW4xd1NUaGFJMTJJNDQ3K25U?=
 =?utf-8?B?dWY1OW1pSmpnR1FBekZHVVRheUpac0xpa2kyM2dzcHB5aWRNYWxQYVNWMDBN?=
 =?utf-8?B?aFdwOU51cFAwbHFpcE84dlBjbDNtYWlaZDM4ZXhVanNXQ1JXaWdVcWl6TVQx?=
 =?utf-8?B?TTNwbWdabFJjRlZFelBtaXgxaWtPWVhIRUVOZ3IwN0tsRnFjTThYaitsdGdS?=
 =?utf-8?B?OE55bWFIZG1jQjg1S1pUMmUza1p0aHF0Z2JMTUh5UUFncDhGR1d2Y1BhNTBy?=
 =?utf-8?B?dDhMVHVZN001N3pLM1FPcHVicy9ORVFaT0JQdkpQVHNGNGlJR0lIK3U2QkZy?=
 =?utf-8?B?bWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <61F4FC2F8762FD498E2C977B1912CD0D@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2811f9d9-8c6e-4ed1-a2ce-08dbf0d2e6b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 12:01:20.6756 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KTs2u1/rUi5rGNw2kxbKThTbyTlKsJTW4wx3SrfL0ekEU38+j73Um1Pjgz7Fqeya/0xLIwECQikw5CixjxB3FBDei/YI2XZzPf6crLz/BJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6358
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: n83y4aEpr8DZZbSyLADXAolJUQo-iaYt
X-Proofpoint-GUID: n83y4aEpr8DZZbSyLADXAolJUQo-iaYt
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
Cc: Sarah Walker <Sarah.Walker@imgtec.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gQXJuZCwNCg0KVGhhbmtzIGZvciB0aGUgcGF0Y2guICBJJ20gc2xpZ2h0bHkgY29uY2Vy
bmVkIHRoYXQgd2UndmUgbm90IHNlZW4gdGhpcyB3YXJuaW5nIHdoZW4NCmJ1aWxkaW5nIGhlcmUu
ICBJIGd1ZXNzIHdlIG5lZWQgdG8gY2hlY2sgb3VyIENJIHNldHRpbmdzLi4uDQoNClJldmlld2Vk
LWJ5OiBEb25hbGQgUm9ic29uIDxkb25hbGQucm9ic29uQGltZ3RlYy5jb20+DQoNCk9uIFdlZCwg
MjAyMy0xMS0yOSBhdCAxMjozMyArMDEwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToNCj4gRnJvbTog
QXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCj4gDQo+IFRoZSBhcnJheSBzaXplIGNhbGN1
bGF0aW9uIGluIHB2cl92bV9taXBzX2ZpbmkoKSBhcHBlYXJzIHRvIGJlIGluY29ycmVjdCBiYXNl
ZCBvbg0KPiB0YWtpbmcgdGhlIHNpemUgb2YgdGhlIHBvaW50ZXIgcmF0aGVyIHRoYW4gdGhlIHNp
emUgb2YgdGhlIGFycmF5LCB3aGljaCBtYW5pZmVzdHMNCj4gYXMgYSB3YXJuaW5nIGFib3V0IHNp
Z25lZCBpbnRlZ2VyIG92ZXJmbG93Og0KPiANCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGluY2x1
ZGUvbGludXgva2VybmVsLmg6MTYsDQo+ICAgICAgICAgICAgICAgICAgZnJvbSBkcml2ZXJzL2dw
dS9kcm0vaW1hZ2luYXRpb24vcHZyX3JvZ3VlX2Z3aWYuaDoxMCwNCj4gICAgICAgICAgICAgICAg
ICBmcm9tIGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfY2NiLmg6NywNCj4gICAgICAg
ICAgICAgICAgICBmcm9tIGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZGV2aWNlLmg6
NywNCj4gICAgICAgICAgICAgICAgICBmcm9tIGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9w
dnJfdm1fbWlwcy5jOjQ6DQo+IGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfdm1fbWlw
cy5jOiBJbiBmdW5jdGlvbiAncHZyX3ZtX21pcHNfZmluaSc6DQo+IGluY2x1ZGUvbGludXgvYXJy
YXlfc2l6ZS5oOjExOjI1OiBlcnJvcjogb3ZlcmZsb3cgaW4gY29udmVyc2lvbiBmcm9tICdsb25n
IHVuc2lnbmVkIGludCcgdG8gJ2ludCcgY2hhbmdlcyB2YWx1ZSBmcm9tICcxODQ0Njc0NDA3Mzcw
OTU1MTYxNScgdG8gJy0xJyBbLVdlcnJvcj1vdmVyZmxvd10NCj4gICAgMTEgfCAjZGVmaW5lIEFS
UkFZX1NJWkUoYXJyKSAoc2l6ZW9mKGFycikgLyBzaXplb2YoKGFycilbMF0pICsgX19tdXN0X2Jl
X2FycmF5KGFycikpDQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgXg0KPiBkcml2
ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3ZtX21pcHMuYzoxMDY6MjQ6IG5vdGU6IGluIGV4
cGFuc2lvbiBvZiBtYWNybyAnQVJSQVlfU0laRScNCj4gICAxMDYgfCAgICAgICAgIGZvciAocGFn
ZV9uciA9IEFSUkFZX1NJWkUobWlwc19kYXRhLT5wdF9wYWdlcykgLSAxOyBwYWdlX25yID49IDA7
IHBhZ2VfbnItLSkgew0KPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fg0KPiANCj4gSnVzdCB1c2UgdGhlIG51bWJlciBvZiBhcnJheSBlbGVtZW50cyBkaXJlY3RseSBo
ZXJlLCBhbmQgaW4gdGhlIGNvcnJlc3BvbmRpbmcNCj4gaW5pdCBmdW5jdGlvbiBmb3IgY29uc2lz
dGVuY3kuDQo+IA0KPiBGaXhlczogOTI3ZjNlMDI1M2MxICgiZHJtL2ltYWdpbmF0aW9uOiBJbXBs
ZW1lbnQgTUlQUyBmaXJtd2FyZSBwcm9jZXNzb3IgYW5kIE1NVSBzdXBwb3J0IikNCj4gU2lnbmVk
LW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCj4gLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3ZtX21pcHMuYyB8IDQgKystLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3ZtX21pcHMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pbWFnaW5hdGlvbi9wdnJfdm1fbWlwcy5jDQo+IGluZGV4IDcyNjhjZjZlNjMwYi4uNmMy
ZTRjYzRlNmRiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZy
X3ZtX21pcHMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3ZtX21p
cHMuYw0KPiBAQCAtNDYsNyArNDYsNyBAQCBwdnJfdm1fbWlwc19pbml0KHN0cnVjdCBwdnJfZGV2
aWNlICpwdnJfZGV2KQ0KPiAgCWlmICghbWlwc19kYXRhKQ0KPiAgCQlyZXR1cm4gLUVOT01FTTsN
Cj4gIA0KPiAtCWZvciAocGFnZV9uciA9IDA7IHBhZ2VfbnIgPCBBUlJBWV9TSVpFKG1pcHNfZGF0
YS0+cHRfcGFnZXMpOyBwYWdlX25yKyspIHsNCj4gKwlmb3IgKHBhZ2VfbnIgPSAwOyBwYWdlX25y
IDwgUFZSX01JUFNfUFRfUEFHRV9DT1VOVDsgcGFnZV9ucisrKSB7DQo+ICAJCW1pcHNfZGF0YS0+
cHRfcGFnZXNbcGFnZV9ucl0gPSBhbGxvY19wYWdlKEdGUF9LRVJORUwgfCBfX0dGUF9aRVJPKTsN
Cj4gIAkJaWYgKCFtaXBzX2RhdGEtPnB0X3BhZ2VzW3BhZ2VfbnJdKSB7DQo+ICAJCQllcnIgPSAt
RU5PTUVNOw0KPiBAQCAtMTAzLDcgKzEwMyw3IEBAIHB2cl92bV9taXBzX2Zpbmkoc3RydWN0IHB2
cl9kZXZpY2UgKnB2cl9kZXYpDQo+ICAJaW50IHBhZ2VfbnI7DQo+ICANCj4gIAl2dW5tYXAobWlw
c19kYXRhLT5wdCk7DQo+IC0JZm9yIChwYWdlX25yID0gQVJSQVlfU0laRShtaXBzX2RhdGEtPnB0
X3BhZ2VzKSAtIDE7IHBhZ2VfbnIgPj0gMDsgcGFnZV9uci0tKSB7DQo+ICsJZm9yIChwYWdlX25y
ID0gUFZSX01JUFNfUFRfUEFHRV9DT1VOVCAtIDE7IHBhZ2VfbnIgPj0gMDsgcGFnZV9uci0tKSB7
DQo+ICAJCWRtYV91bm1hcF9wYWdlKGZyb21fcHZyX2RldmljZShwdnJfZGV2KS0+ZGV2LA0KPiAg
CQkJICAgICAgIG1pcHNfZGF0YS0+cHRfZG1hX2FkZHJbcGFnZV9ucl0sIFBBR0VfU0laRSwgRE1B
X1RPX0RFVklDRSk7DQo+ICANCg==
