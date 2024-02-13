Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622788536E1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 18:10:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA8110E8A9;
	Tue, 13 Feb 2024 17:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pb02ZQBI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2081.outbound.protection.outlook.com [40.107.100.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEAE10E859;
 Tue, 13 Feb 2024 17:10:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHcwY+o5T6EHcMRkwFNjGBOBJdGtMC3nFQsQzOT4yU5+AXmPErQyLj/B8O6/zpKrNbZJpmh8la5ZMH4KmlW54lOFznt3TQObEQ8Tz3ApVgamDVUQs9bPyW6sQwLnA2QPIffEWh1kV18ye9uhQ/smJDDLj24c7xcVBZUGg+mb99d49zMDu4jP6Hh48AAldGCl2gXXZKTxThaFY7GY6pDDd5CZe9dcdpH2hFUn4YyuCVNdypmnt+fnm13cROnS/f15TBrJJ/kbiSQNdkbX1ayFRzZFfvJKrqcVoQxQCd9XB/m0qzFhesLSqduvqzydV7HvuIXfS6vidvHJOBMznktd/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqZyxUI6yBXW5ahZ7fPh6V4HWYvC9w2DOCurEgGYUpI=;
 b=QGjenVi6aayItzhE6+mjH86K+KfoY2m3RKCY1aQnPwkfrnWSRWY7zKi8CFwTLK88eqFUamPk98ccjMVM4hS0JVUn13943kYzExzSUjVupJIm15J70Gro+HnjHIEoL04HCH0gEQ/wNYRVbaFO9bW81uZQ7yzbSuy6hafFIwDfvgXAv5aSN3JTWw1y3PA/DKHEYt5K5wEnc8ma+8smH2XHU2k4Ra5lqgofBzCV6nY49XVd0dk3EVA6kXd5hmdHbG7MIMZY3s/UaKjqezv6TvqY1bdS19GulZRvS84ewjOULHPP4yiY9PU1B2I/Az+FkETlMMZ9C7C/rb/mQ8CgvLpidQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqZyxUI6yBXW5ahZ7fPh6V4HWYvC9w2DOCurEgGYUpI=;
 b=pb02ZQBIIWG9NJU+bf8k7mDBaVtWve8i7kgYxPqIbpjCYrxhLNVagJP3RYx4mktIQFbCzjFGQRCmPDPVWo66OVRW3zD9nioz2+6yOeXL2u2Bw084rf53AcpjN/APR3oZDFCRod2HF5m6NAA1kikMK7lYBQjb4+FDdN/xTL/EsHH0nN/zPM10MbrueKPGvQ4TRsubtxKUbG1P/Ncpmamk0bLNQqjjUCVLYJrc7/9d3/NiC9CrDcGdqg3gyePmH1Z+hRoTLLyke9FvquPqGBQvfCzb9HhbwMMuEH//gUWi9kRlYmSgjuXgMILvz2VZF+4tnQOIM0dLAwh1sH7JB2uuWQ==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by BL3PR12MB6449.namprd12.prod.outlook.com (2603:10b6:208:3b8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Tue, 13 Feb
 2024 17:10:31 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::a969:afd:ee0a:796b]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::a969:afd:ee0a:796b%7]) with mapi id 15.20.7292.018; Tue, 13 Feb 2024
 17:10:30 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@redhat.com" <dakr@redhat.com>
CC: "airlied@redhat.com" <airlied@redhat.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] [v3] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Thread-Topic: [PATCH 2/2] [v3] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Thread-Index: AQHaXfi0C1yXUD8KJkWmK69z9IKf+LEIf5kAgAADjQA=
Date: Tue, 13 Feb 2024 17:10:30 +0000
Message-ID: <42cbb398d41273d8f743fff24015bbd0e535b151.camel@nvidia.com>
References: <20240212211548.1094496-1-ttabi@nvidia.com>
 <20240212211548.1094496-3-ttabi@nvidia.com>
 <62204be5-9367-4e52-9d25-be9c99a1a856@redhat.com>
In-Reply-To: <62204be5-9367-4e52-9d25-be9c99a1a856@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|BL3PR12MB6449:EE_
x-ms-office365-filtering-correlation-id: 86d024b7-b0d5-4983-a40a-08dc2cb6aed4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kPjjqvpN3h9WUhyhElo9zkrSjwIQBKgqVhm5D/TRldxy8wZ/RpjDquJTpNCKomkRksMpOKNpzBl4S4FDIDvlzKIORrhLGDFxoobhQIZncO1B5KuXARHlzVnvun31o495HdB4g0s3Z5ijJRKZvqKuQTLossprlCK7jXje8ln+vIa1Le78M7a3ASu1RPGHzoHhiUmfKXp+KL5P+yfPEHurTithGaqvtVpYAEZIO5mmmezmax6+KfKBMEXQO8DZQSwFTFuUuFxLVtLLAJDiDsXh/4h1rkn9JDKA9xgMIK/42qchM4uSZvkIMWAo0sv3oUulG7pS7I8uV21P/6iqsHr06AHJ4OG2Xj4b7wudyJBS5o2S/RtV1HDaln3x5Ud1AjIyQ5uWePkmLwVxhAMCl5ppGzWATqqRkiCqioj5ocQrWPy9Uiw0lW+pPdYm9m/FYhOTNqrEstJnQ3StNsRsr2Ac36xHuTQxiifFOR+g6PNCy/c5lbSxC1HgjyMMnZbsyaRGfczxUmFFqA6bABjdcwU9AbRg7gO02z6hN9XscE6dr74eauVtDpw8gGVqpwhPBP/QCS8DJ7xh6H9gonPf8Z1JovC9m2SnZRw/twVj0oTNxySesJN1yGKwzirEX1qa77hz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(2906002)(122000001)(64756008)(5660300002)(38100700002)(6916009)(86362001)(2616005)(6506007)(71200400001)(6512007)(38070700009)(26005)(66946007)(36756003)(54906003)(316002)(76116006)(66476007)(66446008)(66556008)(8676002)(4326008)(8936002)(6486002)(478600001)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blF4cnIwaG1RV2RrRnF3UUluS3FKUTdHTC9mMmJrTjVtTVB6b2w5VTRWWXVB?=
 =?utf-8?B?dkFqR3k5bUZ4enk3NGpzYzhjQXZRWWdERnlCN1BtcWdDMHVON1NoRGFVN000?=
 =?utf-8?B?bUdiNTdOUitIOFU2bDJNNXhoeWY3R1U4YTczclFPKzJhSGxoUW1qYkhXeC9L?=
 =?utf-8?B?U3RreHVsdFQxd2FyNk5vK05WaFFNWVhTeW5hNXFMQ21ncjJVWHlIQnlCS0g4?=
 =?utf-8?B?SHVpUDNiaUp2RjRMd2QyalVXaDNoYlM0TG14NHZoNVJabU5aQzRzYzBUZ1I3?=
 =?utf-8?B?SEx3K3BUVDFyQ3pCSWp1V2pCc05DR0JVU2JacXJCYWNpckhpSlBjTjlhZCto?=
 =?utf-8?B?R2dBZDAvUEJuWVl1cTBWZUZ6cktGTzRwaFl4VHk3ejV2VG5iWU1pUnI2YkpW?=
 =?utf-8?B?Q2RMWEhIeWFqdGU2bHMzWU9DeHpPZTNJa1hRWnRUdVRWYVNxcm1wOXhjL2o3?=
 =?utf-8?B?TzFQek8xZzZTN0pqR2RIQ0l5VXIzMS9lQXlzekNDUjhOUU9KMkEreGwyU1Jw?=
 =?utf-8?B?QVM3bWJiOEtqc0dsWTFOVGJzR2YzUFBDY0FUekN1QXNlWkxVVFRBeU90UzRw?=
 =?utf-8?B?V2ZEaGVQY0tjL3BGZmxWOHFvTmFJUFUvR1FJYUhmV2x1QUk2aWlHMTdRUFZz?=
 =?utf-8?B?SEQ1NU1WRXkzNkRSYW9ta3N1MHlvdXJCb1ZDeXB5b1FYajY0YVl0VXQ0Nm9o?=
 =?utf-8?B?WkJMbU9pcVFiTUt5UGJRYk56NWgrdm9EeElFTC9Yd1BlMlNCaXAxZFNyeE5S?=
 =?utf-8?B?QWl1M3lGNkMxa3hUM3NNWFc1TU42dTc0NFgyYVEreDdlcHNObU5IaS9wRXZX?=
 =?utf-8?B?a2NVZmlhbG83MmZXMG9RMWJLeTVJWFZwdHB1NU52MUQra3FSZGQ1VGtIdG9U?=
 =?utf-8?B?dzVUWGQ5b09LbEc5SnUweS9wSExLTHdhWTVKL1R4aTVXWHJGWjR0SmJodEdt?=
 =?utf-8?B?QXpsbi9taStRSHluS1JjMnVnWnphaTZlbjdEaFBuUDNKWmpERFBwa0pQYURH?=
 =?utf-8?B?ZjdNQW1PTitxcnVGeEpNV0hpa1ZJdk0xcSsyV3kreWVqYW1tUFgwblBBZDNW?=
 =?utf-8?B?bm9Sd2l2K1RUWmhGMTVKbWFJUDZSV25QKzB5ZVM1MHdHSDd2TFJFK25iRFYy?=
 =?utf-8?B?eTBYYkljK3RHOG81eGd4ejhheituOG1Nei9DWTQ0Q0N6Y3F1MWJZODR0b0Fp?=
 =?utf-8?B?bG9FMkVoZ2pIWGY3aG01a1NSV2xHQ1AzS0ZlenRmWGlnNm4vTDUrWmNEL25h?=
 =?utf-8?B?L3RhS1RmS2ZpQU9VcnlFZmgxeFZGNG1pOUdMS0R0M0Vod044WUUzcG1vb2lp?=
 =?utf-8?B?VFJnZUNoc1NaUGZqT1FUWksxbHp0R0Npd2lnRU5oVitPRVkvWVkxNzRlTyt5?=
 =?utf-8?B?SUJwbDFJamlUN0c2NTB5U1ZQcjliS0p5OURQL2ljNkNaZFJ5VllnUWw1bVNr?=
 =?utf-8?B?Vmk5Mml5a1RLWVAyY2VDUWFQNDhPVjBLZjRTdkdRYUQ2blduUFZ5czQ5bWhT?=
 =?utf-8?B?R3JrMHk1dW5SbzFYWTc4bWp3SHpSSmtIS1JjUWpvRENuS1Nqbkx0dEk5aXp4?=
 =?utf-8?B?aWhMdWhwU3Z0Nk5pUXpvNjAxcnVodGFkMHhOOGNwVmhHWmc1N3VyaktsUjl3?=
 =?utf-8?B?MkhtdGFvTjBzazNIV3ZIU3lpNksyV1g0cXpkWlJLbWloNHkvblZxWEJLTWVG?=
 =?utf-8?B?WEFGbWlZSWhOZFk5Y0hMbzBreS90THp6RHB2Q2t5NzdtL1hnU2kwbDFMajZP?=
 =?utf-8?B?Y00wUVdCTUFtb3BTMlZINkZLUTUzM05NVnRhWnBadWFQMDdLd3llbVhHaFpa?=
 =?utf-8?B?SExaeWNId1Z4c0JYc2laMDdFc3U2S1ZlTXF5Y3FycnUyQ0dzdUF1NngrWDI0?=
 =?utf-8?B?R092TDFnV1N6MDliVUtpcGZUL05RTW5TS2hKQ3h2NG1Sbmd2T0tXYzAzK0Rn?=
 =?utf-8?B?VTFRZ0NHaUxzelFpUnMrZkY1Sk9ZTDdOYkIxREVWVFRzSkxTRmxmSUJWWWtr?=
 =?utf-8?B?azZLSnJ4dElSVHdqa1ZrbFNQVmUvdTIzMnJwL1A0UHhaMXYrdTh4N2hzOUZU?=
 =?utf-8?B?YTlEcThoNkJwM05kUUVHNnh0RlpKRnZhUWZSY3l2NHJEdnAzcFpOazZzcEEv?=
 =?utf-8?Q?Zyj2fiZ2s5f9tI9aGb8YKWxJE?=
Content-Type: multipart/alternative;
 boundary="_000_42cbb398d41273d8f743fff24015bbd0e535b151camelnvidiacom_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d024b7-b0d5-4983-a40a-08dc2cb6aed4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2024 17:10:30.8403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HMCIMeyxL4SGzLO8vrQ2s4/DdJC5+0ZriEedqS74+jIwobS9+YGFFwfBRd3ntEw1JxjvLIWTUMaLdDV1Ow960A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6449
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

--_000_42cbb398d41273d8f743fff24015bbd0e535b151camelnvidiacom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI0LTAyLTEzIGF0IDE3OjU3ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KDQorICAgICAgIHN0cnVjdCBkZWJ1Z2ZzX2Jsb2Jfd3JhcHBlciBibG9iX2luaXQ7DQoNCisg
ICAgICAgc3RydWN0IGRlYnVnZnNfYmxvYl93cmFwcGVyIGJsb2JfaW50cjsNCg0KKyAgICAgICBz
dHJ1Y3QgZGVidWdmc19ibG9iX3dyYXBwZXIgYmxvYl9ybTsNCg0KKyAgICAgICBzdHJ1Y3QgZGVi
dWdmc19ibG9iX3dyYXBwZXIgYmxvYl9wbXU7DQoNCisgICAgICAgc3RydWN0IGRlbnRyeSAqZGVi
dWdmc19sb2dnaW5nX2RpcjsNCg0KDQpJIHRoaW5rIHdlIHNob3VsZCBub3QgY3JlYXRlIHRob3Nl
IGZyb20gd2l0aGluIHRoZSBudmttIGxheWVyLCBidXQgcmF0aGVyIHBhc3MNCg0KdGhlbSBkb3du
IHRocm91Z2ggbnZrbV9kZXZpY2VfcGNpX25ldygpLg0KDQpTaG91bGQgdGhleSBiZSBjcmVhdGVk
IGluIG52a21fZGV2aWNlX3BjaV9uZXcoKSBhbHNvLCBldmVuIHRob3VnaCB3ZSBoYXZlIG5vIGlk
ZWEgd2hldGhlciBHU1AgaXMgaW52b2x2ZWQgYXQgdGhhdCBwb2ludD8NCg0KDQoNCkxpZmVjeWNs
ZSB3aXNlIEkgdGhpbmsgd2Ugc2hvdWxkIGVuc3VyZSB0aGF0IHJlbW92aW5nIHRoZSBOb3V2ZWF1
IGtlcm5lbCBtb2R1bGUNCg0KYWxzbyBjbGVhbnMgdXAgdGhvc2UgYnVmZmVycy4gRXZlbiB0aG91
Z2gga2VlcC1nc3AtbG9nZ2luZyBpcyBjb25zaWRlcmVkIHVuc2FmZSwNCg0Kd2Ugc2hvdWxkbid0
IGxlYWsgbWVtb3J5Lg0KDQpJIGFncmVlLCBidXQgdGhlbiB0aGVyZSBuZWVkcyB0byBiZSBzb21l
IHdheSB0byBrZWVwIHRoZXNlIGRlYnVnZnMgZW50cmllcyB1bnRpbCB0aGUgZHJpdmVyIHVubG9h
ZHMuICBJIGRvbid0IGtub3cgaG93IHRvIGRvIHRoYXQgd2l0aG91dCBjcmVhdGluZyBzb21lIHVn
bHkgZ2xvYmFsIHZhcmlhYmxlcy4NCg0KDQoNCkZvciBpbnN0YW5jZSwgY2FuIHdlIGFsbG9jYXRl
IGNvcnJlc3BvbmRpbmcgYnVmZmVycyBpbiB0aGUgZHJpdmVyIGxheWVyLCBjb3B5DQoNCnRoaW5n
cyBvdmVyIGFuZCBrZWVwIHRob3NlIGJ1ZmZlcnMgdW50aWwgbm91dmVhdV9kcm1fZXhpdCgpPyBU
aGlzIHdvdWxkIGFsc28NCg0KYXZvaWQgZXhwb3NpbmcgdGhvc2UgRE1BIGJ1ZmZlcnMgdmlhIGRl
YnVnZnMuDQoNClRoZSB3aG9sZSBwb2ludCBiZWhpbmQgdGhpcyBwYXRjaCBpcyB0byBleHBvc2Ug
dGhlIGJ1ZmZlcnMgdmlhIGRlYnVnZnMuICBIb3cgZWxzZSBzaG91bGQgdGhleSBiZSBleHBvc2Vk
Pw0KDQo=

--_000_42cbb398d41273d8f743fff24015bbd0e535b151camelnvidiacom_
Content-Type: text/html; charset="utf-8"
Content-ID: <E3BE048DEA72134D8B20381CDB8CC184@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj5PbiBUdWUs
IDIwMjQtMDItMTMgYXQgMTc6NTcgKzAxMDAsIERhbmlsbyBLcnVtbXJpY2ggd3JvdGU6PC9kaXY+
DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7IGJvcmRl
ci1sZWZ0OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPGJsb2NrcXVvdGUg
dHlwZT0iY2l0ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4OyBib3JkZXItbGVmdDoycHggIzcy
OWZjZiBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxwcmU+KwlzdHJ1Y3QgZGVidWdmc19ibG9i
X3dyYXBwZXIgYmxvYl9pbml0OzwvcHJlPg0KPHByZT4rCXN0cnVjdCBkZWJ1Z2ZzX2Jsb2Jfd3Jh
cHBlciBibG9iX2ludHI7PC9wcmU+DQo8cHJlPisJc3RydWN0IGRlYnVnZnNfYmxvYl93cmFwcGVy
IGJsb2Jfcm07PC9wcmU+DQo8cHJlPisJc3RydWN0IGRlYnVnZnNfYmxvYl93cmFwcGVyIGJsb2Jf
cG11OzwvcHJlPg0KPHByZT4rCXN0cnVjdCBkZW50cnkgKmRlYnVnZnNfbG9nZ2luZ19kaXI7PC9w
cmU+DQo8L2Jsb2NrcXVvdGU+DQo8cHJlPjxicj48L3ByZT4NCjxwcmU+SSB0aGluayB3ZSBzaG91
bGQgbm90IGNyZWF0ZSB0aG9zZSBmcm9tIHdpdGhpbiB0aGUgbnZrbSBsYXllciwgYnV0IHJhdGhl
ciBwYXNzPC9wcmU+DQo8cHJlPnRoZW0gZG93biB0aHJvdWdoIG52a21fZGV2aWNlX3BjaV9uZXco
KS48L3ByZT4NCjwvYmxvY2txdW90ZT4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PlNob3VsZCB0
aGV5IGJlIGNyZWF0ZWQgaW4gbnZrbV9kZXZpY2VfcGNpX25ldygpIGFsc28sIGV2ZW4gdGhvdWdo
IHdlIGhhdmUgbm8gaWRlYSB3aGV0aGVyIEdTUCBpcyBpbnZvbHZlZCBhdCB0aGF0IHBvaW50Pzwv
ZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIHN0eWxlPSJt
YXJnaW46MCAwIDAgLjhleDsgYm9yZGVyLWxlZnQ6MnB4ICM3MjlmY2Ygc29saWQ7cGFkZGluZy1s
ZWZ0OjFleCI+DQo8cHJlPjxicj48L3ByZT4NCjxwcmU+TGlmZWN5Y2xlIHdpc2UgSSB0aGluayB3
ZSBzaG91bGQgZW5zdXJlIHRoYXQgcmVtb3ZpbmcgdGhlIE5vdXZlYXUga2VybmVsIG1vZHVsZTwv
cHJlPg0KPHByZT5hbHNvIGNsZWFucyB1cCB0aG9zZSBidWZmZXJzLiBFdmVuIHRob3VnaCBrZWVw
LWdzcC1sb2dnaW5nIGlzIGNvbnNpZGVyZWQgdW5zYWZlLDwvcHJlPg0KPHByZT53ZSBzaG91bGRu
J3QgbGVhayBtZW1vcnkuPC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0K
PGRpdj5JIGFncmVlLCBidXQgdGhlbiB0aGVyZSBuZWVkcyB0byBiZSBzb21lIHdheSB0byBrZWVw
IHRoZXNlIGRlYnVnZnMgZW50cmllcyB1bnRpbCB0aGUgZHJpdmVyIHVubG9hZHMuICZuYnNwO0kg
ZG9uJ3Qga25vdyBob3cgdG8gZG8gdGhhdCB3aXRob3V0IGNyZWF0aW5nIHNvbWUgdWdseSBnbG9i
YWwgdmFyaWFibGVzLjwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9
ImNpdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDsgYm9yZGVyLWxlZnQ6MnB4ICM3MjlmY2Yg
c29saWQ7cGFkZGluZy1sZWZ0OjFleCI+DQo8cHJlPjxicj48L3ByZT4NCjxwcmU+Rm9yIGluc3Rh
bmNlLCBjYW4gd2UgYWxsb2NhdGUgY29ycmVzcG9uZGluZyBidWZmZXJzIGluIHRoZSBkcml2ZXIg
bGF5ZXIsIGNvcHk8L3ByZT4NCjxwcmU+dGhpbmdzIG92ZXIgYW5kIGtlZXAgdGhvc2UgYnVmZmVy
cyB1bnRpbCBub3V2ZWF1X2RybV9leGl0KCk/IFRoaXMgd291bGQgYWxzbzwvcHJlPg0KPHByZT5h
dm9pZCBleHBvc2luZyB0aG9zZSBETUEgYnVmZmVycyB2aWEgZGVidWdmcy48L3ByZT4NCjwvYmxv
Y2txdW90ZT4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PlRoZSB3aG9sZSBwb2ludCBiZWhpbmQg
dGhpcyBwYXRjaCBpcyB0byBleHBvc2UgdGhlIGJ1ZmZlcnMgdmlhIGRlYnVnZnMuICZuYnNwO0hv
dyBlbHNlIHNob3VsZCB0aGV5IGJlIGV4cG9zZWQ/PC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0K
PGRpdj48c3Bhbj48L3NwYW4+PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_42cbb398d41273d8f743fff24015bbd0e535b151camelnvidiacom_--
