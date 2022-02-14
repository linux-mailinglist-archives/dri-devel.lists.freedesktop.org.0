Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0FC4B3EF4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 02:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20DE10E1CC;
	Mon, 14 Feb 2022 01:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300137.outbound.protection.outlook.com [40.107.130.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EAA10E1CC;
 Mon, 14 Feb 2022 01:41:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cByJnK2R0KIDD7t2qwUlZD3akT/PyWr/bEQUMhWOwtYczsZbQGtitGNFX//sFSeX1a5gfxdbLpsYTHJd9tsVvftpoTYMITrQ9rRLOYHpySVixTDEfRbb2MNm1LK/oluAdBjIp5RUlOoSYZd/V92QnULLc7mlqj25IjflNAV31MeDOcpGz6sUrasNsNxe7sU7btb260dVnWmrl/KtzevZHqHnasjK2wHc6NUCj5ZXI6dlQ8WctidawQCWE8yako+/Hhy9Au93I4YjiqBAntRYxidToKPH18UU4Myzt8AadrSewab/O17pkgHxxBgXmNchx8YjtK2mF7rOMp9MwrKNqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWsgorvkriMC4IBobVyClEuihyZfprg5Hjjrgj1aERo=;
 b=BJhP7er1O/jbZmv6ON4rot5exV6vcnYzRiVUPrAWNyfSP4JqaS6HhJDJ/1DlsbSIkcqX1CSkj/9OejtnRUjP1bj5pGbzKOjraZdZfScY3OkG2vFE8GXmt+LvgytsRshYudxzvBMSwCd0qkVSZo5CSWWl14XLH3RXgOXkWGCEGTISOYdbTXfvVi4zDo7DgJtPzOQFNrajapNXNWkBnO9aEuM4kJXaWsNMagJykyJyjc1qWRXB8X7G27HSYH6b125HPXk+lDNjZwXHbxvBLXd4ugSdslU4XF0xivRK5IOszYCqvpHetfwGe8i5uJX2nhkWiCDhD4M//txueLhZv8vSmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWsgorvkriMC4IBobVyClEuihyZfprg5Hjjrgj1aERo=;
 b=UeDTi0zuOUmr9Pid30vIe6C8hCWfkRXGYnEiQ6LhWigLRwvjnZ5RwF0j5DhsI5srVRvWy9pKid7ijyAne95WYKI39KyUngU7q0dndaFcrrpGcup4qLKC1q+ksmU5naMkUJ2GXeC5vU0r7gvQlAt7XZfVtiUx42LDpFAse5CKK6A=
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by TYAPR06MB2094.apcprd06.prod.outlook.com (2603:1096:404:20::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 01:41:50 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.014; Mon, 14 Feb 2022
 01:41:49 +0000
From: =?utf-8?B?546L5pOO?= <wangqing@vivo.com>
To: Theodore Ts'o <tytso@mit.edu>
Subject: RE: [PATCH V2 00/13] use time_is_xxx() instead of jiffies judgment
Thread-Topic: [PATCH V2 00/13] use time_is_xxx() instead of jiffies judgment
Thread-Index: AQHYHu9qiPwDdlFSYEaDYTiIhZy3uayQIm6AgAImXJI=
Date: Mon, 14 Feb 2022 01:41:48 +0000
Message-ID: <SL2PR06MB308222AB00048FDE424524EABD339@SL2PR06MB3082.apcprd06.prod.outlook.com>
References: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
 <AC2AdwCTE8eh*443p3QtSarp.9.1644684463005.Hmail.wangqing@vivo.com.@PFlnZmtnMG42UnZ2SllNSmFAbWl0LmVkdT4=>
In-Reply-To: <AC2AdwCTE8eh*443p3QtSarp.9.1644684463005.Hmail.wangqing@vivo.com.@PFlnZmtnMG42UnZ2SllNSmFAbWl0LmVkdT4=>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 7bc8dbe4-fcbe-1b44-0918-3ec81ee5fc0a
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ab30851-031f-469f-73b5-08d9ef5b2afa
x-ms-traffictypediagnostic: TYAPR06MB2094:EE_
x-microsoft-antispam-prvs: <TYAPR06MB2094CADEBE0B9CDAB3ECF323BD339@TYAPR06MB2094.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PoQok9Mu3ZF5QO0IncVJflif2uy9diA524kPlDSLHY4UBs37e6JGiHkASFwIG+4yflYdZDqKgeWKeCYB5/Sbo32xdJcxsLyQ/+diycx6UprHMN0GVTLNQKoNW0v31rQHBp+1wnsHABWy51mcsQCAEVXtJ9ZEvXJVMu8MuZsbAU5tmZSMaxqF+8mSi+I4FD5uLIDv3TRe1qjuVPgIP2qTgJUPOaX1eoAvuBIn2y6zUMqMd/iyV2mgzBYPXMaJnOq+lnMd2D6lC/wDwrqZfZOvqsqsD/HyqwiVItBCTOonUeoinlpGPlRgF5Yon2yVaTf3I6qEDtgRKDDyTGx1BRID+Z3HechR68/SJbfFBWHZ3N+rEm59C2CBX7yAjzi1gp6jcfZHjKMqfIyokwvMQYnx22lA01R/AjbyxACX/Vh8uJXZBLdj4KLBn/dUIdnVl4NeEpujW80I19/Z2vpRIcxK4wcfU5uHYU/kD6kPgFTHaheNXHNrKltgMvqvwCArlDlN6Z0udpAEEJAjfTbODfYGN/zKMtn7TlR3VQCtcP0oN7QKXuD4eTy3IESB3FwXpSAnD5PPp+bag17YYRetFZpDxcEfSqEtDnYCeSdk0asfM96eC1an000kBwvsUpGkJ+u/4bK/gEW8lYFEK8lvRmI8u7AP439gqA5wcToYSWOR0LEDd6S7wSJjPXJuNRQcmv67qM0vj81Rspl+cs+8ReRhO5pmjS7z7PGWWgItqnMwFJ8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(66946007)(6916009)(52536014)(71200400001)(6506007)(5660300002)(66446008)(54906003)(86362001)(9686003)(316002)(55016003)(91956017)(66476007)(33656002)(66556008)(4326008)(64756008)(8676002)(76116006)(7696005)(38100700002)(2906002)(508600001)(38070700005)(7406005)(26005)(186003)(4744005)(7416002)(85182001)(122000001)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODRtSGRHcm8xbmh6VWlHS09HZ2JBWkFYVlFvNnBTNFJwaEZjQkhYVUpLZFpq?=
 =?utf-8?B?QS9jSTZRbDhzdjJoNmpwdFByT0hMcVN6aTZSazROcGhpVmlsTTBoUnZxdGJT?=
 =?utf-8?B?MHUxQU5maGVZQmovMmhLdnBWZitJVDlnVEhoaThxWGJNODBWRlEvQjRyNENK?=
 =?utf-8?B?REtlRStNOHhuTjIxeFVJTEcwVW9IRWx4cEJBM05vSlViWTgvUENLakxKM2Jk?=
 =?utf-8?B?OURpV254c2ZiRGw2UC9PUEU0REYzbFJ5MEoxdnl6K0REanh5aVMrY3U1Ymlp?=
 =?utf-8?B?Q3RxL2w1Zm53S3RuV05Zem1sa0Y4K253dldUWnk4ekY2aWU5MDBsQ09qblpq?=
 =?utf-8?B?am1EUU5qcEtubDM2T2p2UVFGWDduVXdVeU1jeVVrazc1SE5yeFN6Q3VObjRa?=
 =?utf-8?B?bjA1UFZBUHFDd3A2dGVaaDVta2dmUVR0aXNnQ2dESWt4UHluQVdIR28wYjh3?=
 =?utf-8?B?eHRzeFhyN1hlVkp3UURXVUp5ZU5XckxNQWUrVmxrVTdtc1dqU3FzQ2dUbTlu?=
 =?utf-8?B?WnpDUWxjQzdHRkIvVGJ3NWV6MGI3MnEwSkVIL0xvT3BTS0g5a09FRkswNnhp?=
 =?utf-8?B?Ukg5dUV2UDdxTm83Q2JVSlprOTEzU2tFbFBqdDMwTU0vSm44eW9FdWdiRkhR?=
 =?utf-8?B?LzNNV2Qyd3RkS29ONkdLRlRiUnJaYW5UTXlmb3ZUL000aXFrYkkraGFjR05O?=
 =?utf-8?B?cEV6MmxyM1JRalZGYUxKcHBqeittZ3Z3TWZVQzg4TFRwVWk5czMwS0JITFdz?=
 =?utf-8?B?QWlNZ2IwT09ROHhkbmNkbFNXOCtHcXNwbHNsajVaZ00wT2FvTWlBNCtYb1dE?=
 =?utf-8?B?QXJqemdOQVY2Vm5LajY1Vi9nM0VVUVZoNDMzMlJla2grZkJIVVFVclFIdmJz?=
 =?utf-8?B?Nm1QZGY4a0FUeXh0N013cWk3eVlHd21VdFRQNDl3a2N3NWJFRXVzbm5qaDRz?=
 =?utf-8?B?a1JkNUx0MC9nMzJHbTNoSmJMdW9udmZyQU5RSDdPMzdTdFV6Q3Q2czcvMTAv?=
 =?utf-8?B?cjhFenFMWjEyaFpQcHlIS016RWUvaWZDTVpLSzA1TnFieSs1dW9lUkV6UkxD?=
 =?utf-8?B?SERZZnF6NlZMWURyank2TnJvNnFCOGJNRlludFh3Q3lOcHZ1QSsyc01VaUI4?=
 =?utf-8?B?MDhBQjNMUjJLZFVVd0ZBRzEyWGlaYjZ0YndDY1NTRU5aZkpUOVhBNHdNVWp2?=
 =?utf-8?B?NXJXVDZSY21hcUZ3cVBlcTZPM0wxakI3TmVXVDdDZGt2NDlaZ2VsSVREaWJQ?=
 =?utf-8?B?Y0tHZzBzZGQyaFhtZFRRanBQV1Ixa0h1SXBUb01NWEhTekViSFM3cVNzZ00x?=
 =?utf-8?B?WUF5QXNUZ3NNRmYzakNDNkVORGluVGJENzBKOUcvajZxbGdTUHo2T2NrT3Z3?=
 =?utf-8?B?Wk0xWmhsdWluamJ0dHNRRElzZjM3WmprdS9LMm4xY3k0NGdzWHFGL2pyZnpp?=
 =?utf-8?B?WEtjcE96U09SSncvREhsaVVmVysxNDY0Qy9JTnZsc3BBY1l0cGFBYjVkRm5i?=
 =?utf-8?B?SnBHWmVwM0hzc2ZEeUZNcXJyZVJNc0NzcSt0TS9HdXlGTWpWbllYNlZJeXAz?=
 =?utf-8?B?cU5uVWdjUWVCOUg4TkFuZTRxY2RJL0k5clNiYU83NWNpS0s4Z3ZmSU9WWmpp?=
 =?utf-8?B?N2FNVWtWSjRlUHF3OStWUUVITnFGd1FtL1ZCRTdHU0lPRFRpbGJaQ2NkdXJF?=
 =?utf-8?B?T3A0dVE1ZU8wRVNWU3YxWktlVS9qdFFSTHRWMmp3YmVVNytrSDMvUUYvSm1j?=
 =?utf-8?B?NVBobGtVdlFJNHUwLzhGbGdGRHZuOGtWVnFTU2tqVEhiUEJjd0xEc01MZVgz?=
 =?utf-8?B?VXpzQldneDB4NHRIcUsvVkpPVzJBU3loVFpuTG0va09WZ1BDZFVzSnpKZVdJ?=
 =?utf-8?B?MExSYnJ5UnEwSEo5TUpJTHVhaVd2aEF5bVJNN2lkL2xUWkZOdG4zbUo0UWtD?=
 =?utf-8?B?VlJrTVVveE1UL2ZqTFA1R29sWFFuY0tDa1hvRFpJbHJuQVFYWXYzbGxtRENX?=
 =?utf-8?B?UTNTYXhnakxrOC9UaW15UXI1RER6UVlkeWNLRzJ6K2FFREljR0d1RVJKN3l1?=
 =?utf-8?B?T3hzOTZtMkhpeE5wc2tIczlWWThHTHp2aFRoRndzeWwrUHhzNWpqcEJpVzFu?=
 =?utf-8?B?MGhPRkJPeFZrZDRkNWNzTW1Rakg3Y3h2V0ZOa1RxL25HN3BFRlpZVTNNRzhF?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab30851-031f-469f-73b5-08d9ef5b2afa
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 01:41:48.3161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fYwai20+OBS3ibqU/l+iaNIA5hOEXoZPBj1zj3uSvEsBIMpWKxEJan80CVtyXohqi7yQF6XOy3ruUEsVXAclRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR06MB2094
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
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mike Snitzer <snitzer@redhat.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Alasdair Kergon <agk@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Jiri Kosina <jikos@kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Stephen Boyd <sboyd@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

wqAKPj5PbiBUaHUsIEZlYiAxMCwgMjAyMiBhdCAwNjozMDoyM1BNIC0wODAwLCBRaW5nIFdhbmcg
d3JvdGU6Cj4+IEZyb206IFdhbmcgUWluZyA8d2FuZ3FpbmdAdml2by5jb20+Cj4+IAo+PiBJdCBp
cyBiZXR0ZXIgdG8gdXNlIHRpbWVfaXNfeHh4KCkgZGlyZWN0bHkgaW5zdGVhZCBvZiBqaWZmaWVz
IGp1ZGdtZW50Cj4+IGZvciB1bmRlcnN0YW5kaW5nLgo+Cj5IaSBXYW5nLAo+Cj4ianVkZ2VtZW50
IiBkb2Vzbid0IHJlYWxseSBtYWtlIHNlbnNlIGFzIGEgZGVzY3JpcHRpb24gdG8gYW4gRW5nbGlz
aAo+c3BlYWtlci7CoCBUaGUgZm9sbG93aW5nIGEgY29tbWl0IGRlc3JpcHRpb24gKGZvciBhbGwg
b2YgdGhlc2Ugc2VyaWVzKQo+aXMgcHJvYmFibHkgZ29pbmcgdG8gYmUgYSBiaXQgbW9yZSB1bmRl
cnN0YWJsZToKPgo+VXNlIHRoZSBoZWxwZXIgZnVuY3Rpb24gdGltZV9pc197YmVmb3JlLGFmdGVy
fV9qaWZmaWVzKCkgdG8gaW1wcm92ZQo+Y29kZSByZWFkYWJpbGl0eS4KPgo+Q2hlZXJzLAo+Cj7C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIFRlZAoKSSBzZWUsIGl0IHdpbGwg
YmUgY29ycmVjdGVkIGluIFYzLgpJJ2xsIHdhaXQgYSBmZXcgZGF5cyBpZiB0aGVyZSBhcmUgYW55
IG90aGVyIGRpc2FncmVlbWVudHMuCgpUaGFua3MsClFpbmc=
