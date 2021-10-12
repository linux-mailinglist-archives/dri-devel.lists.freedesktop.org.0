Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DF342AAE0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 19:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCD86E84E;
	Tue, 12 Oct 2021 17:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3796E84E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 17:34:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gI89aUFFKKPbIMtAjA0Q28m1PZFDsVg4WTHSJWkKUM62Tzb3mA9OC9KDS9baGY49eRDv86D0LHfsG6wJGgiBDIYf93ncyuCCbaQ3SJmJbnY5QskmIIGloYkI4hY3/vSR1Ilg61XO+O2hctOjdYBnwNOZ1qDnb2w1u42LZ9vthvpiGwPWxKAAUVokl70zVsqKQO5+1YZQDNe+nVf++Vk3JX5lrYkLEAFka/5miwu7WkinfprcqhEAzi2F5n4lz3w5cP42QKzSipyV7TJjIIhaEnBzKQBnRAliFYVUxPFCCOdMueKXnw7OCSLw6Suz7pbGLVrO1LIxVqjwC0Gg5qMaWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VHVBRMNnwD2RHuF6QkzgEisnlP7xgDmLNcHddrhEqg=;
 b=NcMrDxPUboLItX0AWZRUgan464LQNGuijyR/FyqMy9NbdmvSPZ3NlX8+A4piaGAgpTlPum8wVcv8DCRnGqEVwCLnpbC84LlksegEx5wV0Sd32kBDquRMQ7syxSakvHMGff0aiji51+9ERz4NJc9FWZnScWFNl7Yu/aOKfH29aHJAHDALMl1bv9WKqeR3Q6ld8+BRu+toYnB6vYBr8x5pbB7UA2kp9R6/Zh/LwCOa/IxPELFKKhN0UNFJd0qX2ZQo3iUAXUC3em8nuCL/CVC+vzuLX+geTaq9YppfSWNgX09hcTh/+rw3U+Ry/z25UZfj7082hDRIRT9rHSdCL82Ifw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VHVBRMNnwD2RHuF6QkzgEisnlP7xgDmLNcHddrhEqg=;
 b=HkiGl96yfPi6YPWc5QT1mOvSIP5UfByfDh/uqiFv4C3hsxdJnDZE0we3zaLaOJCDcyP15X/sGmxScvuT7f9q68IlpcT5S1Ax77qwMpKtclgRn4y/MxesyowuGjZGwDST2SHz+g1WsoNKVsodbCGDiTsvrKTZEYpnQeDBQgtGsaE=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6207.namprd05.prod.outlook.com (2603:10b6:208:c1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.13; Tue, 12 Oct
 2021 17:34:50 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::611d:3cfb:e99a:b768]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::611d:3cfb:e99a:b768%7]) with mapi id 15.20.4608.014; Tue, 12 Oct 2021
 17:34:50 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 0/5] drm/vmwgfx: Support module unload and hotunplug
Thread-Topic: [PATCH 0/5] drm/vmwgfx: Support module unload and hotunplug
Thread-Index: AQHXvGph9gw8C8/5FkWZqC6NMx9TmqvJjTwAgAADZACAAAlcAIAD3geAgAA/YgCAAVXUgIAAC9UAgACNBoA=
Date: Tue, 12 Oct 2021 17:34:50 +0000
Message-ID: <cbfa8b5a879975e45d490b009d17e5b229cf3de4.camel@vmware.com>
References: <20211008173146.645127-1-zackr@vmware.com>
 <7abe3906a814e40786da5cd5d45a7b826e262d8e.camel@linux.intel.com>
 <dbfb505f1034a2d725d76e30a26d2da0a850dd41.camel@vmware.com>
 <96a89fdb5a10141e87d7283720b4088461db722b.camel@linux.intel.com>
 <232f45e9-8748-1243-09bf-56763e6668b3@amd.com>
 <4041c72ff1d3d149437cedbcf3c598ae2238519d.camel@linux.intel.com>
 <1b80b739-3d7e-1228-03d5-eba11f58dbe0@amd.com>
 <02f01e6df6c1a55e7444926d06cc0239001bfd91.camel@linux.intel.com>
In-Reply-To: <02f01e6df6c1a55e7444926d06cc0239001bfd91.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.0-1 
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19e13d7b-58e9-46b5-4053-08d98da6983c
x-ms-traffictypediagnostic: MN2PR05MB6207:
x-microsoft-antispam-prvs: <MN2PR05MB620701A73BEB8878459DD290CEB69@MN2PR05MB6207.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kQ1eU65zKgPKGsZJKKg9g6tiSRuZCsO4FtUkDUeAT3Dd8Uejbzpb2cE5Rhigx67HTpTwI9rTmMhmTm49HB3H7xwhhpa4jSusYGCBfR7ArcyiRYKYxzQahRpS+MqmSkVaROuquEqB7Xe1vFF4/nOav45riZILVD61dU3lBeKSZJom9vl0hhqjd1PVkQuobEOLGEQuKKOswHRkoOBV33yXJf9h1wG3gLpGGNe3kJd4kbEOdNZS4A3qP5iX82mdfPU+wqcEzAM0UQlMzPVo3eEW+0mYWJkiES6mJNhVRJX+0Vh7pF3KEk+c3jGiYTFXdgxo6ud4HZaIpticsSEpLetOaJTGvBrILcILmMfcbgBAkuR2RYkktmH4aOL6A0fvNHKgnZ3zuAUZ6WUVQKYEPyO+JSPKKSSFU56sZOoXTMNy++5AKegJta433Tpwq4kp88pr1n9zhdbusKAK8gozvQIoe2Rj54cX4hKrqRIjgI+vvNHHkdSGEGBNPI4JFywdmmB/FR+/eSNd918h1MzUYeShMrONR0gw0pIRW/hsZHdscR9kmjV7uPIII4PRN5oKYkOKYGasVQwab+TsxPHWpl0U8H8NVHvOBdh5IqnAY9L6A7WhftYeH7Hb5c+fX4nlVSMYdW3puSk2kuXPDIB2nO87w8TEyVTmAU4AFBHiJx0D8KPXC29xqLqxsXxB/2hGxwcGL5dut0Nm+fMTrxtvKCC7XA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(91956017)(66574015)(83380400001)(26005)(66476007)(316002)(38070700005)(6486002)(64756008)(5660300002)(66556008)(2616005)(6506007)(66946007)(122000001)(110136005)(8676002)(66446008)(71200400001)(86362001)(36756003)(4001150100001)(508600001)(38100700002)(186003)(6512007)(2906002)(76116006)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVM5aUtHdkhiNGJiNTJIYkxjY0xrdkc2Sm1LZms3Q002UGRkd3BpeUQ3b0w3?=
 =?utf-8?B?Z1JuSU95WUdoNTRIbllQMUUwb1lLZDEwbnZ2ZXpvKzdFSVdrLzBFbHErcVZY?=
 =?utf-8?B?R01IUCt2eEtSUEZhbTB6ck9SS2IvN05Td01SZ25PZWQ1Q1E4WmoydG9xRUdR?=
 =?utf-8?B?ODFVUzhSUW5EMUE1TU4yamtaUDZqTFZZRmFUcWNXcFhURDBkY1ZJV0lCQ1BW?=
 =?utf-8?B?TDk0QnQzUnFtbkUrZkFKQWZJL1pUakRjMzRXZk00YnljTExicXpsb1BRY2Rx?=
 =?utf-8?B?YUxlK2pqN0YwNEJwdEs3eGFtRy93bWxSZDRqZC9iSkR2Zlh4UXp1NzlQcXV4?=
 =?utf-8?B?S1UvdEYxR2JDbmpQTEJEb1N3NlhSeGdWcU5YVjVZWlhJOWRieDE3MWZaaXY1?=
 =?utf-8?B?ckkxT0x2QTZocWhQMjFVY1RSWUpGbCt6LzdFUEV6Z0lDTEo3aEZzM1UxL1Q0?=
 =?utf-8?B?MXpkWDdKNHFPeGErWVpnNjNOeHlEWStlcWpmNG00RkszOEdFc3JMdm8vcDIy?=
 =?utf-8?B?UFl6KzR3TGNHLzg5bFYwb2QwVWxvR1Myd3NvQUhQSjkzQitMVnZheFZkcVdy?=
 =?utf-8?B?MkEraE12d1ZGZkdFeStrQ0FxbmI2cnRtcVhmbzV6cTVob1ZYNG0rSXphWGUv?=
 =?utf-8?B?enY4N0pVOUpsWmVybDRLTUtCcGRhRWxLQXNrY1Y3VVZkSWZIeXpwdnlhTFQz?=
 =?utf-8?B?endBYWVjQnhoSFE0MGtGR3o2S29BUDNseDFxbFpEdm1vQ2lJbXh6VlEvbXVN?=
 =?utf-8?B?QWRJcm9aZTlmUW9qdS94Q3hqK0xxMU1McGtMVFc1NUJXcG00YmZxTERZVGth?=
 =?utf-8?B?TVpUdVI2TjY5Y3o1ajFFd3dLazNudm9nLzdzNU5SN2xTMkZod1BWcWxuQmc2?=
 =?utf-8?B?ZnpVUDZGR3dEOWNEeFNVSXhIUVdueVdOK1hWc2JVVEtHbmxZSlZnS0RvcGJT?=
 =?utf-8?B?NnBNMUp6QWxGbUt5RE9wbFd6SklXeWtid3dMU2lzWG82UDRXdDdVN2JmM3hj?=
 =?utf-8?B?M2Rjamg1YmNlWXZVSE1tb0hOenN0N1J0Q05QaUZMTGFuOUlMMzhUVCs2Q1M2?=
 =?utf-8?B?NzRuS0w0eUJEbWdRTW15b0JZbDhReXlIR2VjckNZUTNvSzdFM1J4VXg1Q3V3?=
 =?utf-8?B?MTZiODdzR09VOG9ueUJ5TWJTVlFHZGdEN1V3VnM3cVMyQm5XcVdaU09wa0xJ?=
 =?utf-8?B?dFZJNkl6MDVwS201bFVEcytUTEo3MjJITjY0bXhFQzR4SlpUVFVHL3c3WlZ6?=
 =?utf-8?B?Q0RKbWhzQWtUZFZ5M2VnZ3BwcUlhakhvT1pPQi9pWHNjcnNBQUVmbVQ0a1Ux?=
 =?utf-8?B?NkxnSDVPVjlNWXB0aUx0dFZDZWJjT2F1c0ZUeDByeUlUNDJDQnF4eGdtTUlI?=
 =?utf-8?B?M1RrQWNqaitDVk9Kb3RnTzBtZFBIaVVpNDR4S2RteHVyN0JYWjdkUXFEVXpz?=
 =?utf-8?B?ZW5idVpvMjZGdXZnUm5NSTU4ZTNEekFpcnJRV0RVbGJxcW5DaCticHZyVW80?=
 =?utf-8?B?R0pCdUFIdUw3bnJ0ekFRL3dUTFZsb3NLcUhmLzF4dXZnd3U3dllqU1RiN3B2?=
 =?utf-8?B?c3BPcFBvbEUwdmZtRDkrKzljYU50VDBWRXNCbVpyWC9zV2NOOWd6UGQyV3FZ?=
 =?utf-8?B?L2l4anVwK25ZU3JpNkV2R0FPMW5wdzZnUnBUWG9xSHJCVGFZR0VtaC9tNEhE?=
 =?utf-8?B?SmJ4SmdkNWc2bWc4WG5kZ2s2M2tDbXE4TUJ4R2N6cjJ5ZHcxMmsvRlhwTUox?=
 =?utf-8?Q?Gsc8Xtg0KL7MzgLciQIcWUIO5zxEs2h78DPfvnw?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <95C5D5F1B20F0D429B32CE5EA0120391@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e13d7b-58e9-46b5-4053-08d98da6983c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 17:34:50.6869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ARDfNJu9cjTv97YhgNctq5UMQ7Nh2slDp2ulzKBQJlXU07CXsB5QvBH2/h/hQOOtm997VhUleuCtmY0q6qeBdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6207
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

T24gVHVlLCAyMDIxLTEwLTEyIGF0IDExOjEwICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToNCj4gT24gVHVlLCAyMDIxLTEwLTEyIGF0IDEwOjI3ICswMjAwLCBDaHJpc3RpYW4gS8O2bmln
IHdyb3RlOg0KPiA+IEFtIDExLjEwLjIxIHVtIDE0OjA0IHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLD
tm06DQo+ID4gDQo+ID4gPiA+IA0KPiANCj4gPiA+IFNvIG5vdyBpZiB0aGlzIGlzIGdvaW5nIHRv
IGJlIGNoYW5nZWQsIEkgdGhpbmsgd2UgbmVlZCB0bw0KPiA+ID4gdW5kZXJzdGFuZA0KPiA+ID4g
d2h5IGFuZCB0aGluayB0aGlzIHRocm91Z2ggcmVhbGx5IHRob3JvdWdobHk6DQo+ID4gPiANCj4g
PiA+ICogV2hhdCBpcyBub3Qgd29ya2luZyBhbmQgd2h5ICh0aGUgdGVhcmRvd24gc2VlbXMgdG8g
YmUgYSB0cml2aWFsDQo+ID4gPiBmaXgpLg0KPiA+ID4gKiBIb3cgZGlkIHdlIGVuZCB1cCBoZXJl
LA0KPiA+ID4gKiBXaGF0J3MgdGhlIGNvc3Qgb2YgZml4aW5nIHRoYXQgdXAgY29tcGFyZWQgdG8g
cmVmYWN0b3JpbmcgdGhlDQo+ID4gPiBkcml2ZXJzDQo+ID4gPiB0aGF0IHJlbHkgb24gYmluZGFi
bGUgc3lzdGVtIG1lbW9yeSwNCj4gPiA+ICogV2hhdCdzIHRoZSBqdXN0aWZpY2F0aW9uIG9mIGEg
c3lzdGVtIHR5cGUgYXQgYWxsIGlmIGl0J3Mgbm90DQo+ID4gPiBHUFUtDQo+ID4gPiBiaW5kYWJs
ZSwgbWVhbmluZyBpdCdzIGJhc2ljYWxseSBlcXVpdmFsZW50IHRvIHN3YXBwZWQtb3V0IHNobWVt
DQo+ID4gPiB3aXRoDQo+ID4gPiB0aGUgZXhjZXB0aW9uIHRoYXQgaXQncyBtYXBwYWJsZT8NCj4g
PiANCj4gPiBXZWxsLCBvbmNlIG1vcmUgdGhhdCBpc24ndCBjb3JyZWN0LiBUaGlzIGlzIG5vdGhp
bmcgbmV3IGFuZCBhcyBmYXINCj4gPiBhcw0KPiA+IEkgDQo+ID4ga25vdyB0aGF0IGJlaGF2aW9y
IGV4aXN0aW5nIGFzIGxvbmcgYXMgVFRNIGV4aXN0ZWQuDQo+IA0KPiBJJ20gbm90IHN1cmUgd2hh
dHMgaW5jb3JyZWN0PyBJJ20gdHJ5aW5nIHRvIGV4cGxhaW4gd2hhdCB0aGUgaW5pdGlhbA0KPiBk
ZXNpZ24gd2FzLCBhbmQgaXQgbWF5IG9mIGNvdXJzZSBoYXZlIGJlZW4gYmFkIGFuZCB0aGUgb25l
IHlvdQ0KPiBwcm9wb3NlDQo+IGEgYmV0dGVyIG9uZSBhbmQgaWYgcmVxdWlyZWQgd2UgY2VydGFp
bmx5IG5lZWQgdG8gZml4IGk5MTUgdG8gYWxpZ24NCj4gd2l0aCBhIG5ldyBvbmUuDQo+IA0KPiBX
aGF0IHdvcnJpZXMgbWUgdGhvdWdoLCB0aGF0IGlmIHlvdSBwZXJjZWl2ZSB0aGUgZGVzaWduIGRp
ZmZlcmVudGx5DQo+IGFuZA0KPiBjaGFuZ2UgdGhpbmdzIGluIFRUTSBhY2NvcmRpbmcgdG8gdGhh
dCBwZXJjZXB0aW9uIHRoYXQgYnJlYWtzIGRyaXZlcnMNCj4gdGhhdCByZWx5IG9uIHRoZSBpbml0
aWFsIGRlc2lnbiBhbmQgdGhlbiBmb3JjZSBkcml2ZXJzIHRvIGNoYW5nZQ0KPiBjbGFpbWluZyB0
aGV5IGFyZSBpbmNvcnJlY3Qgd2l0aG91dCBhIHRob3JvdWdoIGRpc2N1c3Npb24gb24gZHJpLQ0K
PiBkZXZlbCwNCj4gdGhhdCdzIElNSE8gbm90IGdvb2QuDQoNCldlIHNob3VsZCBwcm9iYWJseSBk
byB0aGF0IGluIGEgc2VwZXJhdGUgdGhyZWFkIHNvIHRoYXQgdGhpcywNCmZ1bmRhbWV0YWxseSBp
bXBvcnRhbnQsIGRpc2N1c3Npb24gaXMgZWFzaWVyIHRvIGZpbmQgYW5kIHJlZmVyZW5jZSBpbg0K
dGhlIGZ1dHVyZS4gSXQgbG9va3MgbGlrZSB3ZSdyZSBzZXR0bGluZyBvbiBhIGRlY2lzaW9uIGhl
cmUgc28gSSdkDQphcHByZWNpYXRlIGFuIEFja2VkLWJ5IGZvciB0aGUgcGF0Y2ggNC81IGp1c3Qg
c28gaXQgZG9lc24ndCBsb29rIGxpa2UgSQ0Kd2FzIG1ha2luZyB0aGluZ3MgdXAgdG8gc29tZW9u
ZSBsb29raW5nIGF0IGdpdCBoaXN0b3J5IGluIHRoZSBmdXR1cmUuDQoNCkl0IHNlZW1zIHRoYXQg
aW4gZ2VuZXJhbCBUVE0gd2FzIGRlc2lnbmVkIHRvIGJlIGFibGUgdG8gaGFuZGxlIGFuDQphbWF6
aW5nIG51bWJlciBvZiBzcGVjaWFsL2Nvcm5lciBjYXNlcyBhdCBhIGNvc3Qgb2YgY29tcGxleGl0
eSB3aGljaA0KbWVhbnQgdGhhdCBvdmVyIHRoZSB5ZWFycyB2ZXJ5IGZldyBwZW9wbGUgdW5kZXJz
dG9vZCBpdCBhbmQgdGhlIGNvZGUNCmhhbmRsaW5nIHRob3NlIGNhc2VzIHNvbWV0aW1lcyBicm9r
ZS4gSXQgc291bmRzIGxpa2UgQ2hyaXN0aWFuIGlzIG5vdw0KdHJ5aW5nIHRvIHJlaWduIGl0IGlu
IGFuZCBtYWtlIHRoZSBjb2RlIGEgbG90IG1vcmUgZm9jdXNlZC4NCg0KV29ya2luZyBvbiBvdGhl
ciBPUydlcyBmb3IgdGhlIGxhc3QgZmV3IHllYXJzLCBjZXJ0YWlubHkgbWFkZSBtZQ0KYXBwcmVj
aWF0ZSBzaW1wbGUgZnJhbWV3b3JrcyB0aGF0IG1vdmUgY29tcGxleGl0eSB0b3dhcmRzIGRyaXZl
cnMgdGhhdA0KYWN0dWFsbHkgbmVlZCB0aGVtLCBlLmcuIGl0J3Mgb2YgY291cnNlIGFuZWNkb3Rh
bCBidXQgSSBmb3VuZCB3ZGRtIGdwdQ0KdmlydHVhbCBhZGRyZXNzaW5nIG1vZGVscyAoaW9tbXUv
Z3B1bW11KSBhIGxvdCBlYXNpZXIgdG8gZ3Jvay4NCg0KT24gdGhlIGZsaXAgc2lkZSB0aGF0IGRv
ZXMgbWVhbiB0aGF0IHZtd2dmeCBhbmQgaTkxNSBuZWVkIHRvIHJlZG8gc29tZQ0KY29kZS4gRm9y
IHZtd2dmeCBpdCdzIHByb2JhYmx5IGEgbmV0IHBvc2l0aXZlIGFueXdheSBhcyB3ZSd2ZSBiZWVu
DQp1c2luZyBUVE0gZm9yLCB3aGF0IGlzIHJlYWxseSBub3dhZGF5cywgYW4gaW50ZWdyYXRlZCBH
UFUgc28gbWF5YmUgaXQncw0KdGltZSBmb3IgdXMgdG8gdGhpbmsgYWJvdXQgdHJhbnNpdGlvbiB0
byBnZW0uDQoNCnoNCg0K
