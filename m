Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 573597135CD
	for <lists+dri-devel@lfdr.de>; Sat, 27 May 2023 18:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6812A10E24C;
	Sat, 27 May 2023 16:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::707])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E2B10E24C
 for <dri-devel@lists.freedesktop.org>; Sat, 27 May 2023 16:49:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFllg3E2tDJmW3/aJtJbHBQnjdeecLCdZa3mxsF9aYZvWRhiR6WX0EG3GgYeYSxfItDh9bGkRSi4Qq9LuY2RSjdlM1Vv4JjOKvdQzAixCjVBIcMlFe/EwOVD6o126DxNlWx8fVefNHsap1AFjqLQeYnGhleAyzm1OV+1le+v81RkvFpMaaQo6SRWh/qVzkvYmHEA65XzjqgUqcp9uniLFosuFktoKn4gPSS9myuoI8uNFJO2qKWd9EOo02LEu1De+24fct/gSgw9PQPbDPiyCepcWnXmrWpjmTUvzyhBn2NvrvLi5oP/yyGHfH+nWrU/5ctvmony2PV4x7cuGEBeQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNBEsPkqIhNkPSb8Ja8yDFrG6dwQRX4F0QBif8hmwaE=;
 b=UY3eiBHzGDKgMRX0BRqCiH0B3S15CoWPNo9FGhTOqvRArpG/KaxGobTpJiwHZV71QVoAxEPIloxlw37ypH+ujlIT1mXi1vV48UlkcyAyzaQQnIialoxeALA7roW1fCsKRXBksFnT3tAHt1em+a0DNegvkj0LIpQm+dKveM/h4zLqY07JvI2PKenftSZbcEMZPHvBBhxuqA9n1xbKn61isCjGieDv6Vk4BU+VC2szNOoWmpqtBz45quACmxIi0YMeztCFHqA59YTkbPou0DKn2BYPqhMZkJi1uneZmngqT9JTj93kNcleiTvVrRSDtoLNV7PpgMPY9bJflocgH/BJqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNBEsPkqIhNkPSb8Ja8yDFrG6dwQRX4F0QBif8hmwaE=;
 b=mmdy9AsYlb3Iz/glWd1YhmWHTPohbnax4RaMH1GFhf+bY6gzGhjZx5anQa9ObVuljRwQo9mym/Qy40zoVesw5/QtQ+UhELMmRVGrsjVghwUkOxMmpMqm1/AcEwX25ogJDLfNiP1VbedHhy6/2LtmsxHfB1rEfjpMAB2m31WKaUuNPRiTOqYyPD4rSAanqKiECpFlCt+G1BxS4iJyuEb5jdumbr2MzB0GwrFqzTwTJKDruSRwTRarQ/UuK1e8j0dNTv87xkPzbGsLNUTskd26hwBjNo6Mm+XSmV9KFQ2n8DjrNS5wo+212VW2Jfxvi6a9bVQxnPUYEKQ7OV1e+1VZ2Q==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by PAWPR02MB9104.eurprd02.prod.outlook.com (2603:10a6:102:33c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Sat, 27 May
 2023 16:49:47 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::75e2:1d42:18a6:2354]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::75e2:1d42:18a6:2354%7]) with mapi id 15.20.6433.018; Sat, 27 May 2023
 16:49:47 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Oded Gabbay <ogabbay@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] accel/habanalabs: move ioctl error print to debug
 level
Thread-Topic: [PATCH 4/4] accel/habanalabs: move ioctl error print to debug
 level
Thread-Index: AQHZjKA3CZLHkJSb8kKxYr+3gk50OK9uXTsA
Date: Sat, 27 May 2023 16:49:47 +0000
Message-ID: <daa750fd-a4a8-ba6f-0c81-a0551ecb6aaf@habana.ai>
References: <20230522112548.1577359-1-ogabbay@kernel.org>
 <20230522112548.1577359-4-ogabbay@kernel.org>
In-Reply-To: <20230522112548.1577359-4-ogabbay@kernel.org>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|PAWPR02MB9104:EE_
x-ms-office365-filtering-correlation-id: c8e06748-94ea-42d5-bd30-08db5ed26158
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zRY8Zuof0fk+mkM/AlWFEzo6/3UfZ2vc1h8AA70S18ErJ6YpyHOw/vWY3ghKole3DQoL8VSQ/tBZVOlj51Gdr0czQTVhHF7F6twPfG0z5RIeMTm3WQIRtR0Ytkf1+9aW2jk9HUi/tScGA+VuUW9lABgSMV6raEayYFULT16QZUbiow+iEaXq/5G0k7mAF+hWMr1gzCTejf6WRD2kjFvreTKBnnDbgDCabTnMApMfvHgOOaR+Z5Xuhj1pvaa9S5l1a1FXurwhT2MPbA3mo+tb9bflifDc/2/Y9efbpxEqyu1d+lAcT+NbBEZOY/qIVPbXhHaloYVM57d252ufiiQGg9Wsca7RdDfFN2T1uElnbSBNmuU7a8hYGb9PZiyugPk++onQeDir+zy6vNJ1FWPKW3GCdopuVVBZV8f4XY0XKcmcGyCmcc6aFwX1jAfEVw0ZfjV1FvxIYb4MNBXAO9YEDsc7cnhXBFi4kH+aN+ZfEhf+0oC/Ee5/ZZ6uuIh5kf4vigzDHWekxdNjy7DqbvLEWTN4FhWtuDSGnMtCxqpYX57QYmA6MqK3aME4Ctl1DoxYpPnvJ0342Wc8xEyqIvRnDuS5m/W84MTGrY2QlxQMRkdaAcb1NsDJJIkGcR5AwxedfymzbPJi41SqWHryvV2Lvj6xno3kXxoh4tJRFcyA1YLNM6Aon385u3qYtCUbXXvE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(376002)(39840400004)(451199021)(316002)(5660300002)(71200400001)(6486002)(38100700002)(36756003)(122000001)(82960400001)(8676002)(8936002)(41300700001)(83380400001)(38070700005)(478600001)(186003)(2906002)(31696002)(31686004)(110136005)(2616005)(76116006)(6506007)(86362001)(53546011)(26005)(6512007)(91956017)(66946007)(66446008)(64756008)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3ljOWNNbFdIZU9WM0F0UWFqWklxL3V1Y1RXMG1FVW4zL3Q5RTNSdW5JSmRG?=
 =?utf-8?B?OElXT1o1ZkJ4bDBWbmJDWUJvdENjd2ovTGxUNGg2Q2l2bGRCUEtsd09mc2tY?=
 =?utf-8?B?cTByNkRPRUFIUmNEL2QwUHFUU29HdXdNUG9ucUtnYmh5Wkl6Umk4K2U2c3d6?=
 =?utf-8?B?ZnEwa1lxS1JhcitZR1RSTVBqQm5SbUlpcVJJRUZld2puK0llTXcrQ2RUcGEx?=
 =?utf-8?B?a2dSZS84YkVYS1hjOVZyODVONmo5eGZFSzNHSEM3aGoyTDhOV092S3hKSS8w?=
 =?utf-8?B?bHBqSnNHdHhnbkROSndKS3BvY0xrRTFyYzBZTDRucFpiYXBYSUtYaDNrTElh?=
 =?utf-8?B?ck5oMnFMamZ0WjdyNlArZllUdGw1ZzRPdkNtaitnSEZtUzgxdnVndGF3RGF4?=
 =?utf-8?B?c2RIeDQvUGpGbWJ1Z3ltQTBKZS9nOHpFK0d5S052QVJCWkFzUlZRcHkxUUhH?=
 =?utf-8?B?KzBkSXcyb0lQejQ1WGVSY0J3eGcxYXM4WFYvNGRLdmE2WXN2NVdIQnp6eDJI?=
 =?utf-8?B?UWsrTytYbVBqVktUcEtwOE1ucGxha0hXWjF1eTlsVGNSU1h0dkY2bmp2QWN0?=
 =?utf-8?B?L0o5S2lpN2thcGI4bktPbTU0bk1iWUp1dUk3NEZzU09FYU1DeFlSbnZaZS9i?=
 =?utf-8?B?SlpEekdZVTVES2Z5eUI2dmZvYXliUUtvc20xM1EyZ2l2RU1ZOGcvcUQ5WnlT?=
 =?utf-8?B?U3hiWjgyYWMvUWc4SFoxYzQ2NEJYUXNiRDhVU0szTlBiRnlUeUtYdU42TkVR?=
 =?utf-8?B?Z3FkNmU5RkFENm1BRDF6N1JWTEREb2c2dkRvSlNUTUF0Q0RhbjAzaVZJMklQ?=
 =?utf-8?B?ejhjQllaaFZrNHRpaHBOTk5iVnkzMjRxdXFyaSt3V05PdVNEZEI1QStIa2pa?=
 =?utf-8?B?bXVhYlFDT1NKOWVJTitOSFdGTVdqNEdBaEZCbkZiQjM5TVRCV2Q2VU5rZ1Nj?=
 =?utf-8?B?aThadHRIaGI0SWd1dnZQWFlncXFSRkI2UmcyWENyaC9TYXc4WFRsQVV1NDM0?=
 =?utf-8?B?MlFaZTZ0SEdXRE05a0NvL0l6K0Y3SW9vcnNHYU12dHhPUDJqR1F1U1BkVzRF?=
 =?utf-8?B?dGx6cml4bTl2bWhhWFBkdlYva0x2Q1J2Yk9iK2ZHZjR5cnJHZG5qcGkwNmZz?=
 =?utf-8?B?OHE3QkJrM3A0QzV6NU5zQ2xTTzNVYXZXcUdvRmV0Nm5NRFhtWmdRaDBrRjA2?=
 =?utf-8?B?OHZKU2JsY2lldWw2QmRaNVZ1SXdYbEVkaXY3anJXbVZDd3ViNnlLSVArRkJO?=
 =?utf-8?B?OHd1dFFlaEVZNnh0RTYzNGs0Ym5tM0FNZnNEeTNWcnNBTHVlZDVXZVlaRyt1?=
 =?utf-8?B?RkZwM2c1eUphY0VmUnNBdDREZjViUDBMWG1sczgrN1RrUTdoMVV6aVV5c3cz?=
 =?utf-8?B?Yk1MMEpNL3Y4QlMxR0Q5ck5aSkswaXRJb25OaWRNZHNMOEZUek15QWQ4bVFO?=
 =?utf-8?B?blc5UVdta0FzMEorZUdwcVJoSXBHci9sdnJZZzJreWt4aW5Hd25VaEZpYnJ6?=
 =?utf-8?B?Q3JxbU1tT1NoRWU1b3ZNdnFlc1NIeUc1ckkxa0gzTUtXVkZtZmRpQXJOVFlv?=
 =?utf-8?B?N3EybVp0Um95ZUpzZnRuMlVPc05aOS9xNzNxa3FjWHlMY3p3bnFkYUhNVTJC?=
 =?utf-8?B?REZuSDhMamVKN0RIKzNTTElBVFdLcXpBM0tDR2sxM29WM1Z6QVF6aWR6M1Ra?=
 =?utf-8?B?dGRHeWFEMHFzcHZtRFhDeUtJZXFNMWlvK0lqMWg1YXJmQUF1RTAwMkRsdjR1?=
 =?utf-8?B?MUxobWNmTjB3bWR1UkNGbHdLb2dUU1RzZnhMVXpnUUZyMHVLSXdSVHVCV3Q2?=
 =?utf-8?B?SjJlaEFmQmZBWSs3Q0wwbEhhTzdWWXA2OUs1OGV3UERCcktCZ0JVc3g3Wnc1?=
 =?utf-8?B?UEwyeWxtVlJ2b2NnbTdPT0owR3ZyLzVQMUl0S3JkWjdmNkNTTGNvczBzV2lv?=
 =?utf-8?B?TERNSWhlVlUrN3FUWmdwSm5HeFBhOWw3ci9KSFpocEE0eGV2WXJtNlozN1g3?=
 =?utf-8?B?Mytmb0Q4Q09HekR4NWdGVFVHU3pNTnFudTRQNVJyRGd1cS91SDdqektvb1Vl?=
 =?utf-8?B?aFlqUmlJMHg4dU16bzFCazQ5T1N2YlRxczNsRTB4ckFMY05DVzlIbjVCUWpJ?=
 =?utf-8?Q?Jxwo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74DBF4758F77AC4EB7E9C5D235D6F2F8@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e06748-94ea-42d5-bd30-08db5ed26158
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2023 16:49:47.1816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bJMP8J14qshy6NVGqZao1SRdLR6DRL6qPJxv7OQH4D44xFF7tr0vur0Q9Gzt3KW0S+Py6nOA2dZsqmzGuYQoRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9104
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

T24gMjIvMDUvMjAyMyAxNDoyNSwgT2RlZCBHYWJiYXkgd3JvdGU6DQo+IFdlIGRvbid0IHdhbnQg
dG8gYWxsb3cgdXNlcnMgdG8gc3BhbSB0aGUga2VybmVsIGxvZyBhbmQgc2VuZGluZw0KPiBpb2N0
bHMgd2l0aCBiYWQgb3Bjb2RlcyBpcyBhIHN1cmUgd2F5IHRvIGRvIGl0Lg0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBPZGVkIEdhYmJheSA8b2dhYmJheUBrZXJuZWwub3JnPg0KPiAtLS0NCj4gICBkcml2
ZXJzL2FjY2VsL2hhYmFuYWxhYnMvY29tbW9uL2hhYmFuYWxhYnNfaW9jdGwuYyB8IDYgKysrLS0t
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4N
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9jb21tb24vaGFiYW5hbGFi
c19pb2N0bC5jIGIvZHJpdmVycy9hY2NlbC9oYWJhbmFsYWJzL2NvbW1vbi9oYWJhbmFsYWJzX2lv
Y3RsLmMNCj4gaW5kZXggOWE4YmU5Mzk1ZmIyLi42YTQ1YTkyMzQ0ZTkgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9jb21tb24vaGFiYW5hbGFic19pb2N0bC5jDQo+ICsr
KyBiL2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9jb21tb24vaGFiYW5hbGFic19pb2N0bC5jDQo+
IEBAIC0xMTk1LDcgKzExOTUsNyBAQCBzdGF0aWMgbG9uZyBfaGxfaW9jdGwoc3RydWN0IGZpbGUg
KmZpbGVwLCB1bnNpZ25lZCBpbnQgY21kLCB1bnNpZ25lZCBsb25nIGFyZywNCj4gICANCj4gICBv
dXRfZXJyOg0KPiAgIAlpZiAocmV0Y29kZSkNCj4gLQkJZGV2X2RiZyhkZXYsICJlcnJvciBpbiBp
b2N0bDogcGlkPSVkLCBjbWQ9MHglMDJ4LCBucj0weCUwMnhcbiIsDQo+ICsJCWRldl9kYmdfcmF0
ZWxpbWl0ZWQoZGV2LCAiZXJyb3IgaW4gaW9jdGw6IHBpZD0lZCwgY21kPTB4JTAyeCwgbnI9MHgl
MDJ4XG4iLA0KPiAgIAkJCSAgdGFza19waWRfbnIoY3VycmVudCksIGNtZCwgbnIpOw0KPiAgIA0K
PiAgIAlpZiAoa2RhdGEgIT0gc3RhY2tfa2RhdGEpDQo+IEBAIC0xMjE5LDcgKzEyMTksNyBAQCBs
b25nIGhsX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlcCwgdW5zaWduZWQgaW50IGNtZCwgdW5zaWdu
ZWQgbG9uZyBhcmcpDQo+ICAgCWlmICgobnIgPj0gSExfQ09NTUFORF9TVEFSVCkgJiYgKG5yIDwg
SExfQ09NTUFORF9FTkQpKSB7DQo+ICAgCQlpb2N0bCA9ICZobF9pb2N0bHNbbnJdOw0KPiAgIAl9
IGVsc2Ugew0KPiAtCQlkZXZfZXJyKGhkZXYtPmRldiwgImludmFsaWQgaW9jdGw6IHBpZD0lZCwg
bnI9MHglMDJ4XG4iLA0KPiArCQlkZXZfZGJnX3JhdGVsaW1pdGVkKGhkZXYtPmRldiwgImludmFs
aWQgaW9jdGw6IHBpZD0lZCwgbnI9MHglMDJ4XG4iLA0KPiAgIAkJCXRhc2tfcGlkX25yKGN1cnJl
bnQpLCBucik7DQo+ICAgCQlyZXR1cm4gLUVOT1RUWTsNCj4gICAJfQ0KPiBAQCAtMTI0Miw3ICsx
MjQyLDcgQEAgbG9uZyBobF9pb2N0bF9jb250cm9sKHN0cnVjdCBmaWxlICpmaWxlcCwgdW5zaWdu
ZWQgaW50IGNtZCwgdW5zaWduZWQgbG9uZyBhcmcpDQo+ICAgCWlmIChuciA9PSBfSU9DX05SKEhM
X0lPQ1RMX0lORk8pKSB7DQo+ICAgCQlpb2N0bCA9ICZobF9pb2N0bHNfY29udHJvbFtucl07DQo+
ICAgCX0gZWxzZSB7DQo+IC0JCWRldl9lcnIoaGRldi0+ZGV2X2N0cmwsICJpbnZhbGlkIGlvY3Rs
OiBwaWQ9JWQsIG5yPTB4JTAyeFxuIiwNCj4gKwkJZGV2X2RiZ19yYXRlbGltaXRlZChoZGV2LT5k
ZXZfY3RybCwgImludmFsaWQgaW9jdGw6IHBpZD0lZCwgbnI9MHglMDJ4XG4iLA0KPiAgIAkJCXRh
c2tfcGlkX25yKGN1cnJlbnQpLCBucik7DQo+ICAgCQlyZXR1cm4gLUVOT1RUWTsNCj4gICAJfQ0K
DQpSZXZpZXdlZC1ieTogT2ZpciBCaXR0b248b2JpdHRvbkBoYWJhbmEuYWk+DQoNCg==
