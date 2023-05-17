Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB62B707063
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 20:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC50110E452;
	Wed, 17 May 2023 18:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on071d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::71d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B94710E452
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 18:03:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/CbdiblOXpbBMdF22TidU4xwC5a+cTDvgu8wyoDYVgfSVuKLUr7TbT2lxZGO6cqk1umK9n6guBoup+6q7k3knBNogdSNmMs/ECrUSyoV1/P/6fsvFafqYPp/bzVID3Gjt3bk7Z9cUdnGbfTC+1l8IKuvbHjrO9ffTIoCmdDJDe1oBOxhFY/Cj2Ek6t7iW8+3w98O6NCwvV5NIFQjZfCZRYJpaVxRjwWaYP0b5/FH4rS6Q/CZ1hpFvawCRRlRUgycvbYV8K0s0uGg0iA644hVtZfKuOcZnC6bmBKSmMN1IH3FLpy+5No+m22A2yGhI8U896knRYmeqg5P40xbENghw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNfg9s2BBPd6+sn10XDNzYIGwaBYhPqnWPoA/RNr/BA=;
 b=T1376+NdITOur6oD+4rUTu9+tX+B8CmK40gCq2zdXTx05J5rpUEVyqGcQwNHwrNvgKIvHcofS9daHvr4ISLruPkPHO3/MPxYn/Gp2oty31b7JyaitVZbBoLmup/FLFMZgFIJbhBuaXs51sxVROUnGTUYxH/XbDmJNKYcPRvAfINKdPKkSQ6g2BeIsgrgyr5F1gY9FBYXQRQfysYyQHYvMCW9uXCAscgjLwp53ISGjhqAY9r57tN0qx/QvqD4VXkLrlg6KriYKlwN5cxtG5EamoY6+tUVp3qQ6zshu19mGaFSk2KtGSfEpbk/pE1r5ztgvusJ3NbKTVY21aEqeJ0uWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNfg9s2BBPd6+sn10XDNzYIGwaBYhPqnWPoA/RNr/BA=;
 b=VAqNiZa1c/zhlsCfgsOkMUcyQTXZ/IXMhN6bYoSZonGyfOeqXPO/0mSsmvD6MqfEY1G3x3BJXszHX+cO9Wv+DIEYbVtl6QufayBvfcKJ+RR2zvEZxTjHFsQBqRJvCZZ3rnhARpP1pnRIubXHUFB/usJdcY+rf0gGwuA0y3QhQpSA1m/itwRpwL/Ffbz2lroJxubQhqr4T2Df770agoUTGalx3Wm8wnL+JAe/hHUA6/lpeuQ9SxrqECTplFLz8JotBmhUeUkc+VjitYdPbdG8AUAc1kho1woF5E8P8eyzGCcRz1wAWB7T99NlJP9FhosWaYS+uJM+Kt6RXmcYAh6QfQ==
Received: from AM9PR02MB6611.eurprd02.prod.outlook.com (2603:10a6:20b:2c9::22)
 by VI1PR02MB5805.eurprd02.prod.outlook.com (2603:10a6:803:133::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.34; Wed, 17 May
 2023 18:03:56 +0000
Received: from AM9PR02MB6611.eurprd02.prod.outlook.com
 ([fe80::f438:b108:b9b8:5e34]) by AM9PR02MB6611.eurprd02.prod.outlook.com
 ([fe80::f438:b108:b9b8:5e34%7]) with mapi id 15.20.6411.017; Wed, 17 May 2023
 18:03:56 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Oded Gabbay <ogabbay@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 02/12] accel/habanalabs: set unused bit as reserved
Thread-Topic: [PATCH 02/12] accel/habanalabs: set unused bit as reserved
Thread-Index: AQHZh9kZVuCPa2NRiEeo4acccHBdna9exDIA
Date: Wed, 17 May 2023 18:03:56 +0000
Message-ID: <3a87a1a1-b344-73aa-5156-e26a70b6b38d@habana.ai>
References: <20230516093030.1220526-1-ogabbay@kernel.org>
 <20230516093030.1220526-2-ogabbay@kernel.org>
In-Reply-To: <20230516093030.1220526-2-ogabbay@kernel.org>
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
x-ms-office365-filtering-correlation-id: f6b1132a-8e48-4c2f-f142-08db57011533
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OSfuMiHJbNclcm68q49fPCEkSqtgDgmj1h0I1VlRaYc2hkS4fu/hoPITVhDMSkeT/EJbZ9tZO4vimVJ6jHnhXkvJe9xV3oZtyoq1yrJjTWYK1izyR2QjzggljqGTMUWHNgZ15zeeLLH3z2hSS4zGs6xXwGrxJFB0rLOgYKCv9DE+aEo+S9SNd4Pd//VvgRkW2ytXDhYG88h8CSEZyPZ4V6sDrSixWjnYeuEC80QXiaYLSUw+fQ13bFfmD8zeODPc2aycYgN351naYYK7DpSF6Qhz+lpp6RFNZ380jM+0w9DLijyRPHZhqMc5+jriCGS5N8uU0wpx/7P4arVpGb9G+q1vsM7xbe2hKeCojK3QvPNWzZ6YG6shPqzRkx++diUT84WEkYwNZc9tn2n9qZGsBVcXyL8/TqyLg2IjBSAnpL1jrzCIBvL+ghMuDpDjGV5IRemOHn33aKU3PDx2lomhcLO1zIwYc8xmDkdXoPbVFlStCxmFaFCqjVmIiodUkJEDa6oEESuaOV1VyGebe8NVX6/O7rbDv/nEksNPwOudXdNtHSGe75kaDbbSXwz7KxdPViCU3/d1tVW7dKivMt5qEFrPGcQ9d880L/g7rulsAn9JiIwI1Arfdp8ILyYlRTLJY2S+zH9HJJXa9ebk67za4ymxOnnYpA1qjRCzsoxB3NVURO3elU9sBd5tfIg50guW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR02MB6611.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(366004)(346002)(39840400004)(451199021)(82960400001)(6486002)(38070700005)(186003)(26005)(53546011)(83380400001)(2616005)(6506007)(6512007)(36756003)(38100700002)(86362001)(31696002)(122000001)(71200400001)(31686004)(64756008)(66476007)(76116006)(66946007)(66446008)(66556008)(8936002)(8676002)(316002)(5660300002)(91956017)(41300700001)(2906002)(110136005)(4744005)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alh0Sm1RdE1ZVFVaTzFiVEFsTkI5eFduWGZpSUlhNVNKOFJYVVd2cWNHcXFv?=
 =?utf-8?B?dE1YR2plMUtycjk2bXpnMUIvRllIMnA3dVFQYjNEUlRuWEU3YkdMWmdzYjBX?=
 =?utf-8?B?SFo2OEZyMVFDMGlYclIxTmlMTUZLSWtVaW55RkU4YWRKVmN5QXVac0dHNWpk?=
 =?utf-8?B?WkI4WjZLWmQzYURRVEpySW5vN0puTmQ1bzlvbHcreHRNZm96UlR0LzNwekx4?=
 =?utf-8?B?dDNSazVDMGlscnkvMkdsM1VMNmx6bm5VRThsRlBXci91aHhxSlJwUlZKTEc5?=
 =?utf-8?B?cFI5T3lnY1U1MTBSb20zMWNSYzY3SGhEWjJDd3cxN1VRVE9zR01jRWFUcEpz?=
 =?utf-8?B?NDZPQlFPdUYxbkJNYUtuc2pnNGUyRzdNcVExZXEwZWlKYWR1MHE4eURCbkVC?=
 =?utf-8?B?ZHdGUGlzVDUvcXNKNHprenc2MHQzTjBBcDYrSENXRHJsejhwaUNEbHFYaEdX?=
 =?utf-8?B?aVhRN0FldUEweUJ4YWx2Z0hGajgrcXgxWENpaTNkQVhTOFV2bi80V1FlMmRN?=
 =?utf-8?B?TlJlOExHbmRQZkJKVE1Gdkk2azBjUThVVTlJMS9jS2tCbFlDRG90MHRxQnFo?=
 =?utf-8?B?YzVmOHUwSmlpa0lUT2QydGxoS1hYMnQ1eVNmcnNQcTg4by8yL3o0MlNXaUtv?=
 =?utf-8?B?cndZWUpyTXlkWXZZeDhONnhobkJNSytYZ2JIYlVWWStIWnE5d1d6NzJ6cThj?=
 =?utf-8?B?bW9LR0J0NE9lbjNJOXRYSmhSaGc5eS9URWl2RGxTeDlwSFQ4UW1TUmsvbzU3?=
 =?utf-8?B?cTRGNVpCVkhsZUplSWNWbVEzOGViTVhmSTU1Q0lyeS9zZTNpV0kxOEl0MjJy?=
 =?utf-8?B?cHBBaU9hTXlWOTlsdzRyNlZDYlA5Z1RHMG9WM0xSeitrbjVxdjFMd2E4ZG9a?=
 =?utf-8?B?dXFRRVVTbTVWdzFDNkNDUytJTmFoZjNhL0p4bzBwV0svZzVnTjYyQ3gyVTcv?=
 =?utf-8?B?RHpNdUFXMkNyNHlMS2xnaUw0VTR4RmVtQmZaUnZudTlPUkdOR1N6dFU0NGJa?=
 =?utf-8?B?UXN0ZWxJenNPUDZMU3krbytlT29vc1M5OXhxTDNIMUo2R29CTGg4YWVuVjVo?=
 =?utf-8?B?NlRsNDJpdExuYWUvTXJoUVY0VThIRTcvRjhWYm1Sa1VXY1pjUVpwNnhJN2xB?=
 =?utf-8?B?ajJxZmZjeHpJRFlXdkFOYkxyQ2VtNGtuUmMraWJ0Z1p0ZmlJcWZwVkpyS3dQ?=
 =?utf-8?B?THJPL1czZjZZWUpvQ2FXVDloK0tKd2NBOThzMHB3cXVjd0xqUlAzMjQzMjBw?=
 =?utf-8?B?bTI2RkhjeUpyVzMzeFRZcktLY1poVGROL21odjFnaDFzNG1GV2xjYVFsKzJl?=
 =?utf-8?B?UEYra0VGcGNDYjlla0RtZ2xvNXo3NEhQQ2M1b0YyUmkrOGIzcTVINjJ6MGQy?=
 =?utf-8?B?R24zOU1ISSsvcTkzenVmbWlUcHdySGpOQUJFMUZBdVFuQjhCV005ZW85Szdo?=
 =?utf-8?B?Z255Y1o5bVVxeC9Ia0srWDhhY2JLbjM0T1FGT3dIM055SEMwNnZ0V0w1MlFp?=
 =?utf-8?B?NFVXUVRUanlqUHhheU94SGZRMlpFckJZblc0dnRqbS9BTEZoYU1GZFBtaW5K?=
 =?utf-8?B?WTVvZDlLRllaSkJ2S0pqTTRaZStjNnNVcEJXa0dRMGNGQTR2RDhENzBzeUlF?=
 =?utf-8?B?R25haFhTUW5kWlFmNlR2T0o5MVhIWit4VHBsaDIwQy9vZWp3Y09BNVNOQWxt?=
 =?utf-8?B?U3NPL0luR0hEM2luaVlncS9PQThreVVnNUFLMExPRDBuZVp4ZHduVUlqZWZC?=
 =?utf-8?B?YStCK3VzaFQ5VXdFeUpMRTZpTjk5VkVHL2NubmU4Ykp1Q21CU2JaZFd3MTZO?=
 =?utf-8?B?a0xWRitXTEh6RkxWSnN3RTBMWllzVmUwVEVLNEx3Wmg1cWZycUhvM3c4Zko4?=
 =?utf-8?B?OWljZTZuUk9HZy8rbDNuV05tb0JpNWsvYTZGaWVqQ0xKZkRoRzVoMWtUMTMw?=
 =?utf-8?B?akVMNGo0RWYwY2dSSEFKbVJNUmRvM1JTL1JwdldOcFZaTlJWekY0eEdmYVE3?=
 =?utf-8?B?MVhjRFcwWTM4Ymp5N3dzRTFzYzJjdTJOeEg4SG1JUEkrZmQ3Q2FyTUVycnZu?=
 =?utf-8?B?b1lNRjRLaW9ZYnpFVURFUDN3bmlHNXBaWVZvTktUNWxYUUZZblZHWVNPYnln?=
 =?utf-8?Q?zZM8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <52C657D6A28FEB469305F66D1DE7CB80@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR02MB6611.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b1132a-8e48-4c2f-f142-08db57011533
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2023 18:03:56.5115 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fD1KIfYQqZG3rjzOCLXHxS+51wvFmjRVKRC3NLMtYaq4EWF1aPtAThkDDihLYwVJ8HtFqBVVGexmFC2S01FqMg==
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

T24gMTYvMDUvMjAyMyAxMjozMCwgT2RlZCBHYWJiYXkgd3JvdGU6DQo+IEdldCBsYXRlc3QgZi93
IGdhdWRpMiBpbnRlcmZhY2UgZmlsZSB3aGljaCBtYXJrcyB1bnVzZWQNCj4gYmlzdF9uZWVkX2lh
dHVfY29uZmlnIGJpdCBpbiBjb2xkX3JzdF9kYXRhIHN0cnVjdHVyZSBhcyByZXNlcnZlZCBiaXQu
DQo+DQo+IFNpZ25lZC1vZmYtYnk6IE9kZWQgR2FiYmF5IDxvZ2FiYmF5QGtlcm5lbC5vcmc+DQo+
IC0tLQ0KPiAgIGRyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9pbmNsdWRlL2dhdWRpMi9nYXVkaTJf
ZndfaWYuaCB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9pbmNs
dWRlL2dhdWRpMi9nYXVkaTJfZndfaWYuaCBiL2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9pbmNs
dWRlL2dhdWRpMi9nYXVkaTJfZndfaWYuaA0KPiBpbmRleCA4NTIyZjI0ZGVhYzAuLjE4Y2ExNDdi
MWM4NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9hY2NlbC9oYWJhbmFsYWJzL2luY2x1ZGUvZ2F1
ZGkyL2dhdWRpMl9md19pZi5oDQo+ICsrKyBiL2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9pbmNs
dWRlL2dhdWRpMi9nYXVkaTJfZndfaWYuaA0KPiBAQCAtNjIsNyArNjIsNyBAQCBzdHJ1Y3QgZ2F1
ZGkyX2NvbGRfcnN0X2RhdGEgew0KPiAgIAkJCXUzMiBmYWtlX3NlY3VyaXR5X2VuYWJsZSA6IDE7
DQo+ICAgCQkJdTMyIGZha2Vfc2lnX3ZhbGlkYXRpb25fZW4gOiAxOw0KPiAgIAkJCXUzMiBiaXN0
X3NraXBfZW5hYmxlIDogMTsNCj4gLQkJCXUzMiBiaXN0X25lZWRfaWF0dV9jb25maWcgOiAxOw0K
PiArCQkJdTMyIHJlc2VydmVkMSA6IDE7DQo+ICAgCQkJdTMyIGZha2VfYmlzX2NvbXBsaWFudCA6
IDE7DQo+ICAgCQkJdTMyIHdkX3JzdF9jYXVzZV9hcm0gOiAxOw0KPiAgIAkJCXUzMiB3ZF9yc3Rf
Y2F1c2VfYXJjcGlkIDogMTsNCg0KUmV2aWV3ZWQtYnk6IE9maXIgQml0dG9uIDxvYml0dG9uQGhh
YmFuYS5haT4NCg0K
