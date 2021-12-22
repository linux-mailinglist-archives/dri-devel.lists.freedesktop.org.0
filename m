Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6E047CAAD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 02:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F81A10E13E;
	Wed, 22 Dec 2021 01:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2133.outbound.protection.outlook.com [40.107.255.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D9910E13E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 01:19:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iknDC5omN0M+lOzHib/TjOVUJUO2zxOj4izpP3oCzMs6hdpTTBTHyP361he9aBLNKg54xekaUPl7jh8iX9yls5ydRRNX3Z4JjlVz7pnu562LCXw/LtU1M86XBNz5yrUxeltQmc5F/4pGd5PE+k5NHjuxeDKBQsePVjlNolUh/VyNDp7sCDJ8cWA+VnnoX+0VZ8+dqOrBblF6lVQEwsOuMHQDhv+c5l2703BiX1f9Kz2GNScWxRWqZinvyS0Fd030LYANxdVTsysl3QNZ6yJ4gAIHBnE3jqaSZ2JThKo/P1bThN7Omg5hVLtaGEK5QlDFmlsDiSXY8ztRDZ0NzwFhYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4XBQVJAjL68dTfsytJvnomAzQtFSfmvubaNjgkfmMA=;
 b=ZM5swvIosLRL9J/c6l9zGVHWYg5B2CwXgrAjh9m/4D5HRKhmTMmQGVuDVIw02EY2/c3d2e8YoLdPyDlLQP0Lgz+wyNdtsTcKonaABB5r1saCiSLCWw4X1vQoGWfDpBbAaHwwITzKmAAZW4TnHJyqjIOJBGFpwW1FPSHVW3b7H54bGJGSwhFM4DJIeNRt8wfEgCO7Ko3EJSDjeHVyMIoPyOQnC7/LbmW0ScTHfOwU6agQIbVLBZxNOX50Y/m9uMZsI2x+SO3MC9WPVP6Cm06pgx7geoua4QW8f2fqL+/96HyH8HQM3hjhfmsfymZRdS4K2+ixQTJkk6C4ZaniyKH2rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4XBQVJAjL68dTfsytJvnomAzQtFSfmvubaNjgkfmMA=;
 b=btxD5w7beceeVRTO4M3TdQNDfGbQDnhtCq/uqI4RVK5jd+AXZynayhuB7jQzXk74TEB4zh6FGIGSVOXMvcm/OcU4zTKJhXdrz9TUnVGRNd0A/egiJ/T+iBlQ4x4tuS12gDrlvAvgRYHd4ILEH4OQIgUV8ro4YBrKzQQqT9S+eI6p28SbpKOO5DdvAFfruWImCzkA6naWSDdQ/5fBP5lJN8fKcbTSm26cjp2hvGSAWhweKdwQrdzyq5rcQSeZad6COnyEGr4EijhnuJKtCAnTpnhP7nSJgCWRuAPmT8zzj1LlDxJjvsSNuE/TROtGOFn8MhCjHjsi2VcDZEs21Fod7Q==
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com (2603:1096:202:34::18)
 by HK0PR06MB2322.apcprd06.prod.outlook.com (2603:1096:203:41::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17; Wed, 22 Dec
 2021 01:19:32 +0000
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::6913:5fd5:84b0:1d4]) by HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::6913:5fd5:84b0:1d4%7]) with mapi id 15.20.4801.023; Wed, 22 Dec 2021
 01:19:32 +0000
From: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>
To: Dave Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: RE: [PATCH] drm/ast: Support 1600x900 with 108MHz PCLK
Thread-Topic: [PATCH] drm/ast: Support 1600x900 with 108MHz PCLK
Thread-Index: AQHWrpA6yNnPEioaU0WRvjwcdGRPAqm0fokAgouPhQCAADVDoA==
Date: Wed, 22 Dec 2021 01:19:32 +0000
Message-ID: <HK2PR06MB33009293FAA7E83C2679F44F8C7D9@HK2PR06MB3300.apcprd06.prod.outlook.com>
References: <20201030074212.22401-1-kuohsiang_chou@aspeedtech.com>
 <b24ec0fd-9010-ef6c-ea86-c4455f86a977@suse.de>
 <CAPM=9tymNcdq+midqxNJL3Tfhb_yKrE2sa65hZ1zWSnmhWnGVA@mail.gmail.com>
In-Reply-To: <CAPM=9tymNcdq+midqxNJL3Tfhb_yKrE2sa65hZ1zWSnmhWnGVA@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0aa0504-0e4c-4b45-5d4e-08d9c4e91c03
x-ms-traffictypediagnostic: HK0PR06MB2322:EE_
x-microsoft-antispam-prvs: <HK0PR06MB232215D5CF01E3AFE8A2EF578C7D9@HK0PR06MB2322.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:486;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pqfKU3R90Z/SL2js4ETPP3u1j4r1fyoLzWu2SdcQyTK7X8hd+JZeSH4sXYa6dHvq3OBDgyTLsFfHdrfB4JC0iLbBVhDJakZsCjLzCFwDjBrjZxd2kHv4y5ADGiXzbnU4TsjoKOuZFsaiQnBTGqMbuMPfuLc/vEQG11eXxQQV40wBn8V9Bqm5xavfLtvkcHFkb83byuWnwCvSlv96wQXchdRPnHNAwYAgxw9oBBHYqV9IYCh/GKnN7VtbHOmyOkil01DvtLMWgo4TuqDva3iNDU2RTRTg2iq7AkUJTvkUW72oaOEy55lJkfLdput4nxu6d9iXc4sYXJjASq/U16/oyKDJJwcmOiqph0ylMtzPzK9rlWazjIwjAFP+DTY8I7qVNyGDlviAp0bS1m6+fCrz2ubdbkNoII3xRtbuzYD1pbbHK3Mapr73C9B+cxME+8mvM0eGLLOM23EOXgJ6QlhMFMSpYDDIKiieMN7pndLzSaPE5Ma93GrGroTixw+TQyk9bK83Gat0TZLIp+B4Pdo+avrLAQcuE9mNdeGjw9E4N0NMuVcICmuUqoGsC1xSfzIZH3mAYhNxc3TDcT7ePXJWLcoU7k9h3gecM7ETJYrRrpjx8m9WBlTIiiiKFpVusAdiU+Jv4JA/ITWjIPzKS/oBcwQ8d4ItrlK/UC9Npfto0H8nWZp8LOnn5HQTWBxL9O8FvE0iyFe/x8PgezIkQkquAg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3300.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(376002)(346002)(136003)(396003)(366004)(316002)(508600001)(38100700002)(86362001)(9686003)(7696005)(52536014)(83380400001)(4326008)(186003)(38070700005)(26005)(33656002)(66446008)(53546011)(2906002)(71200400001)(5660300002)(64756008)(122000001)(55016003)(110136005)(76116006)(54906003)(6506007)(66476007)(66946007)(66556008)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VnBVOFdaRU15NWJIanRremRhM2ZnM0JnTlZoTHB5NzVHYld3M2tRYXFDTVAy?=
 =?utf-8?B?RGp3MTMrUGRsc2ZEVVVRK0JjYXRObWIwazNOZitlWDgzc2pKNG0xcVlWVUJZ?=
 =?utf-8?B?bUtBRE5ENUR6cS9RMmJjME1LTG5qZ1JKSXNWSFJEWVBFTG94SDhyYy9jZGtJ?=
 =?utf-8?B?dzMrMlFSK0dHTXdJVk1yQi9yYlROOGdKT0dqTjJCR3lSaDRhV3BWeEpNNGN5?=
 =?utf-8?B?ZGdxUmtuZklBSWxHWExwMFJnbmkwbkE0SWQwTDBXNm9OR2RjYmNNSGVYbVJP?=
 =?utf-8?B?ZDBYeUNzNG9aZ2l2MmJGSm4yZWFuWUlaVGtFdTJTRGNreVlRcnphSzMzdGc1?=
 =?utf-8?B?cjVpNFdxZGg5dGFQSWlabmJ3OTBON3RvSDBkbVZUbjV2TkJrRy84OFNVL2dR?=
 =?utf-8?B?d3gwZnIwQWVYNzlxZVd6enlUSlYvdW9TN0dLWXdzenNwWGRtQnNlUDljME9R?=
 =?utf-8?B?M3ZvcmhtWlRSSUVIVkdvaGh1a1dZemthMUpQTCtydGN4VThlNjRiS01UaWk5?=
 =?utf-8?B?ZlV2emdzKytmTXM3V3gvZFdyOHVXQmdFd3VzNWFwU0J0TEYwM0l4NnMwRERo?=
 =?utf-8?B?QnlGWURVcTZmY3d3YjY4eFB6S21kSEVhczNaQ2p3TFZEUnJseEUvZFFZRTFw?=
 =?utf-8?B?NmY4OU1lNnIrTVowaWpuR1hXbm1jL0x3S1U1UVA5b0EwSzFWbTIrVmhwa3Ba?=
 =?utf-8?B?RUVtYlVjcVJhbDhQdnJGc3VKbWNBVXhsV0xMTFY1TlRjQkVSVE5NRlFmcUFO?=
 =?utf-8?B?WmtadXAxVGZkdDltQmNKSFNqdmY2V3puV3l3NlV1VUZaQmpscllCb1d6VkMx?=
 =?utf-8?B?VUxuNEtCbkZnc1hBWlFWTzhqYy93ZnMwS1hESXdySFJObExHNG9GRnRkSDdK?=
 =?utf-8?B?MHZWUFlnRVdiaXJFRTYyN04rd3AxZWp2bmFNZmdDOGRIVTIrdUx4VmpsNS93?=
 =?utf-8?B?Y1ZkdmJHNDk0MlZUMlViSnhQa1JPTXN2QVZCallSSTVMRWJSRHBwTlF3eHJP?=
 =?utf-8?B?aDlFQ2pZclFDdDY2Z0lWeThKdzg3SnRRR1FDL0VYajR1S01sdE1YdzRmWnlj?=
 =?utf-8?B?dGRLSzhFUWc5TUkwNnJSdWRaZndYOFJ5cmt4Y2ZGekVueldUMFRveHZWYkZW?=
 =?utf-8?B?QmxiZDBzNzJTVnZPTDhxS0JOZmpPZENQTjdKT043VVRmcTkzTXVSU25rL3Yr?=
 =?utf-8?B?b0lCUW9TbzR0K0FuUHN2b0MzT0NrVFIzclpnVXJVcFU1aVBVVmFzSUVFcjJj?=
 =?utf-8?B?UVkwNFpvNGMwcHVDNzY0MWxxSjREemlIM0t5VEpRcFlnbkpJeTk3OUQ3Q0RX?=
 =?utf-8?B?MDhWYVhWTzFoN0NsLzVyMkxpYTkrQUFBK3BFRWpUazl4dXdlKzhzdEhocjBk?=
 =?utf-8?B?TU14YUZtNGVJNlkzclF3Z0VFQ1FBdTFSdC9XbWtKNzBnTWMyd2crZVpkYWFN?=
 =?utf-8?B?ZFhha1BOZmQrUmlqbDk0bTllU0tiZTZCdHFnd0F5cTMwTkxuS0VRRGpmbDNN?=
 =?utf-8?B?SnI4dW9BM2VySWx0RDlXVm45SWV4VHQvWnQyNEVpMWJnczZFaW5adlNhR1Vw?=
 =?utf-8?B?N3JBTXhWM3l4MWNleGMrbHBQa2x5ZmlBdVE4aDUzYU9yQlhDUGNSUkpjeVQv?=
 =?utf-8?B?YVpJbHc4d2lhS08rQ3NXdWJ5L2M5U2xlcExzZ2NSTkNxelZhaHU3TW9PeTQr?=
 =?utf-8?B?VjRWNEYyQXRxb1VRcVRLQWJwa1VSOEd1QkdoV1hBdm1EeDBhVDAxb0VjVUI1?=
 =?utf-8?B?VDNCOTRzY3h1V1c1bXNuYW1xRFBXT2lPTmlxVEhYL2lEYmdraWNlSzFSOE1a?=
 =?utf-8?B?UEVSVnVTSkRDejZTSU9wa1FTZTJqM0xremVGQ2RvNEd2eS9maisvdnllaWlZ?=
 =?utf-8?B?SnRGVUIzY1ZhWk8wcklHZE5uNmR0YzFoZHpVcGcvZXFhbXpPOGRMV2RmSGRi?=
 =?utf-8?B?blgrUWpKaWNnUG1WK2RlKzZyZmFaNS93aU8zZnM3VWtWbGJMTEczZWVpbWVV?=
 =?utf-8?B?amN0aVRQUVV1ZW5qbEFwMXQwVkJ2QU9FNjJvWkM4cTVjdEtHYTQyM1lxd1hv?=
 =?utf-8?B?eGt0bmJ4WVUrUTN3eElLT01INjFyUTExU1hyU1IxS1pSdVkwRU0yeHhDaGtV?=
 =?utf-8?B?ZFE0RTJ3QnZFcnd0NmNaQXVyUDZyWngrTjg1cENIVnlOM2NzSUlzNlRFeEFU?=
 =?utf-8?B?Z1JPRHpRdjMxWlFJc3FFNlBoUG5CeHl4aDJhT2I0MURqdTFOeTkxeXE1MDVt?=
 =?utf-8?B?N2RncjBKaGhJV0ZXWlFWL0JWMzBnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3300.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0aa0504-0e4c-4b45-5d4e-08d9c4e91c03
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 01:19:32.5261 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AEa50GmrnolLxulJsMhNbqNkoCAi113gRNgy0D6tOz8bCKSf3/eOK1yw0+IpNuP5HItx0A6HtaIxoDzhJ45ePeu4LYcd2zmwwXXQmIa3d4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2322
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
Cc: Egbert Eich <eich@suse.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Tommy Huang <tommy_huang@aspeedtech.com>,
 Jenmin Yuan <jenmin_yuan@aspeedtech.com>, Dave Airlie <airlied@redhat.com>,
 Arc Sung <arc_sung@aspeedtech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IERhdmUgQWlybGllIFttYWls
dG86YWlybGllZEBnbWFpbC5jb21dIA0KU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAyMiwgMjAy
MSA1OjU2IEFNDQpUbzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoN
ClN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hc3Q6IFN1cHBvcnQgMTYwMHg5MDAgd2l0aCAxMDhN
SHogUENMSw0KDQpPbiBNb24sIDIgTm92IDIwMjAgYXQgMTc6NTcsIFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4NCj4gSGkNCj4NCj4gQW0gMzAuMTAuMjAg
dW0gMDg6NDIgc2NocmllYiBLdW9Ic2lhbmcgQ2hvdToNCj4gPiBbTmV3XSBDcmVhdGUgdGhlIHNl
dHRpbmcgZm9yIDE2MDB4OTAwIEA2MEh6IHJlZnJlc2ggcmF0ZQ0KPiA+ICAgICAgIGJ5IDEwOE1I
eiBwaXhlbC1jbG9jay4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEt1b0hzaWFuZyBDaG91IDxr
dW9oc2lhbmdfY2hvdUBhc3BlZWR0ZWNoLmNvbT4NCj4NCj4gQWNrZWQtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPg0KPiBJJ2xsIGFkZCB5b3VyIHBhdGNoIHRv
IGRybS1taXNjLW5leHQuDQo+DQo+IEFzIFNhbSBtZW50aW9uZWQsIHlvdSBzaG91bGQgdXNlIHNj
cmlwdHMvZ2V0X21haW50YWluZXJzLnBsIHRvIA0KPiByZXRyaWV2ZSB0aGUgcmVsZXZhbnQgcGVv
cGxlLiBUaGVzZSBpbmNsdWRlIHRob3NlIGluIE1BSU5UQUlORVJTLCBidXQgDQo+IGFsc28gZGV2
ZWxvcGVycyB0aGF0IGhhdmUgcHJldmlvdXNseSB3b3JrZWQgb24gdGhlIGNvZGUuDQoNCldlIGFy
ZSBzZWVpbmcgYSBwb3NzaWJsZSByZXBvcnQgb2YgYSByZWdyZXNzaW9uIG9uIGFuIGFzdDI2MDAg
c2VydmVyIHdpdGggdGhpcyBwYXRjaC4NCg0KSSBoYXZlbid0IGFzY2VydGFpbmVkIHRoYXQgcmV2
ZXJ0aW5nIGl0IGZpeGVzIGl0IGZvciB0aGUgY3VzdG9tZXIgeWV0LCBidXQgdGhpcyBpcyBhIGhl
YWRzIHVwIGluIGNhc2UgYW55b25lIGVsc2UgaGFzIHNlZW4gaXNzdWVzLg0KDQpIaSBEYXZlLA0K
DQpZZXMsIHlvdSdyZSByaWdodCwgVGhlIHBhdGNoIG5lZWRzIHRvIGJlIHJlbW92ZWQuIFRoZSBw
YXRjaCBvY2N1cnMgaW5jb3JyZWN0IHRpbWluZyBvbiBDUlQgYW5kIEFTVERQIHdoZW4gMTYwMHg5
MDAgYXJlIHNlbGVjdGVkLg0KU28sIGRvIEkgbmVlZCB0byBjb21taXQgYSBuZXcgcGF0Y2ggdG8g
cmVtb3ZlL3JldmVydCBpdCBmcm9tIGRybS9hc3Q/IA0KDQpSZWdhcmRzLA0KCUt1by1Ic2lhbmcg
Q2hvdQ0KDQpEYXZlLg0K
