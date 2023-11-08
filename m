Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 675397E4DA4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 01:00:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D758810E6CC;
	Wed,  8 Nov 2023 00:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F051810E6C2;
 Wed,  8 Nov 2023 00:00:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FC2oIw8Yz9OwjNgEL8aFENjFOc+oqjYJnsi3c3WalzmggP4oUM1wWy+frD4A5fDKWXIIBAdqgI+NS101Mu+IFraBCVhd26hNSCPYeoMQGqlvH3Hpm1X3PghgO2b8V9gs2drNhghZqJmzmL7qByBkFge7hKt4iCICb3K9vMBfjFtFJLIpq3mIKknuTV8qLVQdoGaNiAx66Nq9Gt4h3cbiH3Sxfj08JuhS3E84paAjB4GTjhlsJM3fP7vdvb2/U45SDhRTIITGQmk5Y5Ah9l/THZk69yCNG2nxt5pVZFTEoIt2Ra3EXbkcvvno6Q+eQOmLb2pgkC0ottQIm56fyCqVeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0e0g3i4cjWAPJIbOHdxpIayfmC2I66P/Df808Pw4YM=;
 b=LuvVqyjXruhQtFprl0v4hUG4mJGGuAKAsyUH06PqAt/yHcj3ZhSvie5q0u8W8NM/Xrx3wdpyyjSh7B7lBQQMPyLKEA0Csc1YM+isIjFTsOK4nFABCvXDg4n15iMtiFAXce2Df20Jv1Dxy4o6vfKUbCDJUzi+QA4TCsYUxSordcB16l2Paz5Wxo8Y1tVkzPJPP/GDQjQD2E2tGS+Yj49BA9dNr+W2AWupLz3b5KxAB5NHEpMqGUhhz+cZmonF1miVDchbo25wudut/Yh7hep7Zh8M21haL1cs1v5y1+Y38ELcNO7z9Wu/DJBxJeyd4Cpxd9WHIVgljrNN/WPJjlA4JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0e0g3i4cjWAPJIbOHdxpIayfmC2I66P/Df808Pw4YM=;
 b=PhEyYXrglCrmxSeoYDeEXLFcMUjPD5ms9f2vY5dv3hR7zw3cQ46ZHW5POzUj6IkeZAxXdeyWF8XS9GnuaDapYlGinVGpmKNLdUY6SGBdTKecJzUSfc8qcd5PDvFVLhZPJ+Q8wKkijKcitC7RS2g2tCMlZUX7Ft3hJ5X4v1+6BK0X8MoLyehhZAp533nfbGwGHfqBUgY0Hsdp7UgcSrrbH/pYfp/ljmRDVzqge3Oeny3oERJ3gWJjvx6A94SUa/gq5cTjtdCY3rBdFLU2W53tWewr2fJaE+R4iaxnRMS+F6L3sphN45QOaB++ee9s1KFbxTwGw9V99xinKrMKMBCZpw==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by CH2PR12MB4167.namprd12.prod.outlook.com (2603:10b6:610:7a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 00:00:15 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%7]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 00:00:15 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "airlied@redhat.com" <airlied@redhat.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "me@dakr.org" <me@dakr.org>
Subject: Re: [Nouveau] [PATCH] nouveau/gsp: fix UBSAN array bounds warning in
 PACKED_REGISTRY_TABLE
Thread-Topic: [Nouveau] [PATCH] nouveau/gsp: fix UBSAN array bounds warning in
 PACKED_REGISTRY_TABLE
Thread-Index: AQHaEdTQHf5llqm/9kyYeml7BAMiM7Bvh2AAgAACEIA=
Date: Wed, 8 Nov 2023 00:00:15 +0000
Message-ID: <5905396653318954faeddcd8356f25644cccbb55.camel@nvidia.com>
References: <20231107234726.854248-1-ttabi@nvidia.com>
 <04fd39a8-174d-44e7-a910-5e808d8563b5@dakr.org>
In-Reply-To: <04fd39a8-174d-44e7-a910-5e808d8563b5@dakr.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|CH2PR12MB4167:EE_
x-ms-office365-filtering-correlation-id: 51c98506-8908-44f0-1e9f-08dbdfedb01a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jVP3XpLzdX3gUyEC228OVzH64MpbOhyVWD3ouoo6+u4LhgYWKnMdK8HzyN9FaAU+d5VH/WgxRwffF8yaM8woIahdI8ruf6Vz3B90NfbzDzWU8BrTyMa3N6q2//JtzeLIot89AYY1FjubdKd4V5dS7arEDF+NrhIn1Idaeoh9YamMtfwCv9CYvIBQIKw5MWP6sUyZVauaWFn7pNM56HkX/MSHDeqMpuqck0sPJip9CZLu8jfMXzKEgj8UfkKFH5ithLF3Npcvc+wO6nLG2I8Bm8Z27TcV0ZkdByTkEt+l/5aevnTZ8jYu62OcSitRbYtrC68lQ9wp5mCj/Uz4gpcdkk9xMg2254pHJix+wKDrTR/zLN5gX8b3v6aZrB7XDytMXvhva4mKtGejXzGC9kxdNKVdaMiDCWktBnyKyUFxhakpu9Y6a7tdNfGR6snHaQ0QOhWKik2MTm0rsSxFQuW1pho0EmB1+xFMQSmS6/CeQkko6boJ+acJoDYBwykNMgxHnciNoUC6q9tDrJ1vcPW3J7aipUacaGQsHz5O4MIkaYZ6EUdym7Nv1G6//5pQfSzrqomEbKlUOlrME5sctjNQpDrwon8XgdWT3/llJ2zusSY5hmIvpSokTXvvbFe0n+0u
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(366004)(376002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(4744005)(2906002)(122000001)(41300700001)(8936002)(5660300002)(38070700009)(36756003)(8676002)(86362001)(2616005)(478600001)(26005)(6486002)(71200400001)(53546011)(6512007)(6506007)(38100700002)(110136005)(76116006)(66946007)(66556008)(66446008)(66476007)(64756008)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDZhSm9XaEVpN0pqdmY1QUV3ZW1rMStqVy9WZ2czeko0UmdUOTAwMkdzSDlH?=
 =?utf-8?B?b2dkNW8rVTVpTlUxa0dHWE9CaFJpd1U2MU1PbEFuTS9CNk16aHRzd1kwZVp6?=
 =?utf-8?B?UlMwS240S1ZRbThIYmFpTG00R1VkY2l5OVN2SFQ3NHU2eHJMc3doSkFOREEz?=
 =?utf-8?B?OEdldGV4VStLSHhtai9Pck9RTGtSMVFUbDVubUozUXFmbWhRVGVESUx1SGFC?=
 =?utf-8?B?Zlc1YnNmMVNTZWJ1Z2VwMGhoSE5jTEVsN2hRSWNZSWlKY1htTXVDTEVxVUZQ?=
 =?utf-8?B?RFVlTmIrVDlUcmhvenJTWFprV1hRc00vL0NCeUxkSndFQ2RyRVl0S0xCbTI1?=
 =?utf-8?B?Ny9tamhWNlZ4b3E5Q282YkxHY1gyZG00L2szQ2NVakRJOFpCVjFSQTJEb25J?=
 =?utf-8?B?NWh1dVFEb0Z2bnplY3k4VUg4S0hicTR1NmdrRWVNaXJVSzhFSFZ3Q3hPZ0VG?=
 =?utf-8?B?dDNjMFFpUFEvRW8zSFRrbmpwVURmZUdyUHc0NFZtclVsRzdGVG44MGpwZWo3?=
 =?utf-8?B?NHBmcTZzZ1E1OXpaQWtEZXhhNllBQ3ZNeUFMYyt1c01aWlY2YU1ZN3Z5OWtT?=
 =?utf-8?B?OE1udmQveDgrRkVZci9FYWFRYWlLSjdWeDZvYmJOSnNtckU4d1NYT2ppQVRG?=
 =?utf-8?B?SmdSamM5WDJsTENMcUczYTFGTHJvbzUyY21iUmgxclNqZSt2aEdHU3lteXBz?=
 =?utf-8?B?bldGUmNUUDJyMytLUEtUbHRFRDNPQkVpNUZwWmxON21rTnBnbVlqdks2Qk9W?=
 =?utf-8?B?a0xLWHVaLy9hdXFseCt0VTY4MjlYL1ltMGpYSUUvekI5MTBFOVZkcWpmT2hE?=
 =?utf-8?B?L2ZoblE3TFI3TGZWaUdNTFNFektkdHkyOU9NbzdOWStYMmZjcUpVVkJyaWd0?=
 =?utf-8?B?RG8vNDhBL2dydnI5bnkyaVQyYjBFZkp5eEFkWDNqdEwvRzZaenhDZDlVL3dZ?=
 =?utf-8?B?bjVGVnF6YnM1bG9CVVhxcmE0ekhVQXljSE1heFFJaUlEYVdWV0FLZElLenhn?=
 =?utf-8?B?aHlKRktWUmlIem1tUkl0bzZ5ZHBOS2IwcTV6azhyUzhpNUtQN0tyeTJrVVRs?=
 =?utf-8?B?Rm5POXI2UC9lekRjMWZtYVpzb0Jiak9iQ2RYN1BEcE9NaUpXVGZ1YmVuNW9O?=
 =?utf-8?B?VXA4aWhLZkNEL0hqd3BRT2NuMDNJZGNvSGlwOEtYNTVOZzZJaTBRcFlDNElE?=
 =?utf-8?B?OG02clVpdnJtVnkwckVDazl3a3pueW5acG1aVTVUNWlZbWluNExLV3ZPL2RK?=
 =?utf-8?B?WEltd1BtM3BMbjRZc0ZmWmxoV0hRL2x6NjVMMXpmTzd0eFZnNXZhM0ErQXha?=
 =?utf-8?B?VVlFdlFYVjV6UGExVFFhNWU4SjQ3RllPWFVTVk83L1BZWHY5bHhFUXlVQUtO?=
 =?utf-8?B?SmNHbFlybytrUGU5d3IrNzJvT053aFNjbTdiRTlUUjZ1b0g4d3Y4M09ZbTl6?=
 =?utf-8?B?TWpQNVhXZHVGS1FrcFV4TkNEdFVldUpTeFdLdEZCVnlnYkZCRDM0cXpJTkc3?=
 =?utf-8?B?NDdhcG81Zm5sb254TldFMFFIY05YVzhRczdnODdUZmY3aWdHV25GVUxib2o2?=
 =?utf-8?B?MnpYTHV2Nk5CSHNSckpBS0FIRm5NcTg2OWFXQmxJNkZ1RjlWV3lTOE9RYWVB?=
 =?utf-8?B?RjM0aWlpeC95RnVtQ1pzUFNNVmtFYnNhdjNGUi9JK3JiQW5GSjIxb1o4OTJa?=
 =?utf-8?B?a290NjhySzNjb0NGYnRHRi9uc0hUbWpLVHhZakxEV1RMUzk0WTUzcDFuOXlF?=
 =?utf-8?B?KzZ5OVJlejBDUVpCSGh3R1kvTWRMNkpMTU8xNnNkOElYTFhQZWs3NGdiaEE0?=
 =?utf-8?B?ZG02NHYrTFZhMklzVWJjSThVeDYwZTVLNlM0dmw4MmwxQWpZbnUrd0VEZGRE?=
 =?utf-8?B?RGtDVDlkOUE2KzcyMlU0ZExNbjNGb3YzYUJKZjE2Y0JVWUxtb2NUQ3ozWTd5?=
 =?utf-8?B?ZFFlbEVLaFdPYWREQXVVNEx2aFVzTTNEelRXWDE0eGorNjFjRHl5YTRUWDFL?=
 =?utf-8?B?NFNkczczREdabWt4MnE5T003QjhHRFhyMjNDQXNpcmVva2NlWGxuOEZVTWN1?=
 =?utf-8?B?K0pyTGJrbnFiRzFhYXNYWTJ6VVpHR24vdDNtNnRjTEk0M1BzcXJDSkUyK28y?=
 =?utf-8?Q?bM3b0YpLyJHUntn2AtTRLMg+K?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9EC0C16402B917489BF5FCFBF9B9CD9E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c98506-8908-44f0-1e9f-08dbdfedb01a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 00:00:15.7245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hxQGEPYdPmDWG0aU63pSavCBsYRrQg/Ri+KUWL0aKe8qnroGDFUhZdA9uGc9rM63ZYWj0tk1MIOEeeF4ii4jow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4167
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

T24gV2VkLCAyMDIzLTExLTA4IGF0IDAwOjUyICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiBPbiAxMS84LzIzIDAwOjQ3LCBUaW11ciBUYWJpIHdyb3RlOg0KPiA+IENoYW5nZSBQQUNL
RURfUkVHSVNUUllfVEFCTEUgc28gdGhhdCBpdHMgbGFzdCBtZW1iZXIgaXMgYSB2YXJpYWJsZS0N
Cj4gPiBsZW5ndGgNCj4gPiBhcnJheSBpbnN0ZWFkIG9mIGEgemVyby1sZW5ndGggYXJyYXkuwqAg
VUJTQU4gdHJlYXRzIHplcm8tbGVuZ3RoIGFycmF5cw0KPiA+IGxpdGVyYWxseSBhbmQgd2FybnMg
aWYgdGhleSBhcmUgZGVyZWZlcmVuY2VkLsKgIENoYW5naW5nIHRoZSAiWzBdIiB0bw0KPiA+ICJb
XSINCj4gPiB0ZWxscyB0aGUgY29tcGlsZXIgdGhhdCB0aGUgYXJyYXkgaXMgdmFyaWFibGUtbGVu
Z3RoLg0KPiANCj4gRG8geW91IGFsc28gaW50ZW5kIHRvIGZpeCB0aGlzIHVwc3RyZWFtPyAoQW5k
IHdpdGggdXBzdHJlYW0gSSBtZWFuIHRoZQ0KPiBvcGVuLWdwdS1rZXJuZWwtbW9kdWxlcyBpbiB0
aGlzIGNhc2UuKQ0KDQpIbW1tLCBJIGhhZG4ndCB0aG91Z2h0IGFib3V0IHRoYXQuICBJIHdvdWxk
IG5lZWQgdG8gcmVwcm8gKG9yIHNlZSBhIHJlcHJvKQ0Kd2l0aCBPcGVuUk0gdG8ganVzdGlmeSBj
aGFuZ2luZyBpdC4gIE9wZW5STSBkb2Vzbid0IGJ1aWxkIHRoZSByZWdpc3RyeSB0aGUNCndheSBO
b3V2ZWF1IGRvZXMuDQoNCg0K
