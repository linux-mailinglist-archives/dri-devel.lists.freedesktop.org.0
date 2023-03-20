Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 615E16C196A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 16:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9949910E2BD;
	Mon, 20 Mar 2023 15:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2124.outbound.protection.outlook.com [40.107.22.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8051010E2BD
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 15:33:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlzkCHi6O/Dewl/jyLtB4979QqYOArx4TmEN3NRy3fGMeO0kBEl/Y6Z3yszjyfelexpo/g3j2pNkJimVunjHT1rjinA/yKvCW9oqSuBjKU3Lbefex//2N7vSC5t4M2/mzuaGGre/5chb1AMwpZCZnkGvnN1byBYogx+zr11j/1nTgZTNw5cZ7oQhuyBKtvwO5gPEsaTHmo9n9OGRKVMoeQWsrnN3Q8bYNu2M3+dL6bL7/tF/ssWL6nCGWB+Y27db40bTt5w4v5IEA8cEm8mVfqTv3WWIwav7M/cPvwRGQOg/LsxkVyVcsj/VdRMo+aXeYQMmv55AQFW462ozGMZvtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cx3lY+IK6ZAIUVJMSkqqzlIvFdasQ5/R54iJCrZTY18=;
 b=l5Oi/9i57O78sj2ZDQLmDI6CCA2cb4i1yEwdWzHQPSF9ViMLG3srBWW1KPfyvRuBXrD18YtWwp3/5lv1eDxEmc/n1WdJAF4RR0h5eVhWVQdJnC+emH6DV5a/x+HVwDpH2GLLM/PUHfVgf1WSefxMSYIuZqC7O4pQQBkUFFexZdP6/SEoh6srbhJOczKd8lgIk3idwmr5aIc2YdS6d7uz/pvFGWS3lykO7ZmKSt/k9L8QZv9+/A4+IyT+DbbGPZwjPBiuu6wYR8Z4cojHCAirKTStjO8LJSUGRS+24+dn0MdJuxIKndfj4m//BjNTz0eeOaeC79XfdEvwpLU3HNPeDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cx3lY+IK6ZAIUVJMSkqqzlIvFdasQ5/R54iJCrZTY18=;
 b=Tf0HvVM176r5rRpBMBiayiILNiXfLQzbIdUwy7qhkJx1NnFivqnAB/ThB3fv0UckCh2cSCA2tIAIzLuvUit2nZAIU3FRJXn1XqXyvt88sAKMbfsGoSNteSKjVLbcVEiwLG6/5bZ7mwiY1rOVu4R/EqFM7ijJge06dd0IOSV2+znyNmCgdg8fBxrWzbs+bg/rs2s1Vl+TrHUKCGEz8XVszTFmKFWlqdyJsA2IPg5W2c9Mfi/ZAzG7s72DxNxlfB75yj1t8zrApfT/IPYgBaq8tHoNXnpwx6GxUiTixXd8EmJcjBVTdm9HmD9n5GmtmQqpPhRtwi45d5wnC+AqbYY4uA==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by DBAPR02MB5976.eurprd02.prod.outlook.com (2603:10a6:10:187::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 15:33:22 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::e0f2:c1f2:4da0:b37a]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::e0f2:c1f2:4da0:b37a%4]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 15:33:22 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Oded Gabbay <ogabbay@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 07/10] accel/habanalabs: fix field names in
 hl_info_hw_ip_info
Thread-Topic: [PATCH 07/10] accel/habanalabs: fix field names in
 hl_info_hw_ip_info
Thread-Index: AQHZV/unWfycxsr1zUWZiBybC/4idK8D0opg
Date: Mon, 20 Mar 2023 15:33:22 +0000
Message-ID: <DB9PR02MB6619DA480A6A50982DA119E9BC809@DB9PR02MB6619.eurprd02.prod.outlook.com>
References: <20230316113640.499267-1-ogabbay@kernel.org>
 <20230316113640.499267-7-ogabbay@kernel.org>
In-Reply-To: <20230316113640.499267-7-ogabbay@kernel.org>
Accept-Language: he-IL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|DBAPR02MB5976:EE_
x-ms-office365-filtering-correlation-id: 5f80f5be-a0fa-4525-7fda-08db295870c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TD8vsdOd6ERzee4gp7w99a35U7jCzmcuEVZJ8MWbvSmJk01lTeSIDwuxQDGLULZH94tR5buOttxBqffKC7cTq8Tvjqt9rEFexO6tfqR8zgscRIdma4WATrwRjqfVx0m0ANRMvWiGTUG4gAaNSDSN5CTdvlQeqVZJZIpVtzVBZSICfXjji2jwoR1U/3JdqSJasSnKNqlkUUegoyZNsJ5DcGLKMGWlYeq3e7Ejw5FoEHMqyIyI/SQZWR8q2NWADMTpHKzzUgk0KA/hjVx+m0RzHqKOhalS+BKEOm6ZnMNdA5E9/kf15JQ8X0ijPEZhbe9aRVmcvdKMuPb+3j4/cs6ETJP7YTAsdDM0IVh8SgCCJ8NFhHLrkeq6fHdLcEsSg553UQBM+I5cYDN9mDnbYOU0C43Q99C6opSjoicFKlA+Q+neuWmAQVcly+cCxPskhLyGkWWmSFN30lVO18wgO7Vu3nB+36yP+O9YjhtJAKDB5kgyWoOm/94hFYf/4JBEJXyUqxstbKrrhBbSXib7pogU7A5hr8pwItwa2gKCXWB7F9SA6ic9hx9WcscfMC7cIOSAyWAP7QGHJyb52nWTK2jNsFccjdS06aWhvF45K/wZOhj6zBVrayJQtKJKrsidAgUYJL92a3E82fsd/Z8o54YgTcH518cKtvFpAvI3yCUdNWRN1iJxASZMSurXdUcY4oc/PNC6flUEgn/8mgbmE3hDCw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(136003)(39840400004)(346002)(366004)(451199018)(316002)(38100700002)(71200400001)(7696005)(110136005)(33656002)(76116006)(55016003)(66446008)(66476007)(66946007)(41300700001)(66556008)(8936002)(8676002)(64756008)(52536014)(5660300002)(2906002)(478600001)(86362001)(83380400001)(122000001)(82960400001)(38070700005)(53546011)(186003)(9686003)(26005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmpBZDAxRy8wbE1rQ3Q2b2o4UFJZelMzcUphVUpjbCsrZHd6QWlYK1F3TGZC?=
 =?utf-8?B?eFdBWEoxbTJvSWVKVkZvMFBPMHgvc2Nlb2VqVEZFNE9IYXg0bGR6bkVpZm4z?=
 =?utf-8?B?NG14VERjVmhCSTRaMmN5QkIzcFV4Y2tFSTR1MHNYZkZUWk5UWXdIVnBGN3BE?=
 =?utf-8?B?REZibHBINFhueUNGVlJiMUt1WXF4aTVjVHNxNVNyUlNzU3hrTUN1RXhMeHpx?=
 =?utf-8?B?cGVCdlFnODhDT0h6alFPU1BuSnFKZlZ5VERBYzAwdEh3ZUphNG9XMWxaZjNK?=
 =?utf-8?B?V2pDV3FLNndHUlNOSWVDREt6RmloNzczMmZVb0pWNjVzaGJaMU84STRVcU1k?=
 =?utf-8?B?MENiTnZSaXNETnVaT0FncmdCUGVGTkVNVHVweEVFRGNvQWNTYjE1ekVsMmpP?=
 =?utf-8?B?Vy9rNmM1cmRLQjRiTE5abEVTTDVQWHc3SUNnNDdCWkM1NU1FSXA3Z1Jlc0xH?=
 =?utf-8?B?ckk1OHRJa3pIZ3Q1WFhuOEQrVkFqTWI2SStCKzYrekx6WXdPQ0RQNHVSUkd4?=
 =?utf-8?B?MVM3UGxmZjRWQVRzRVB0Z2dHS1FFS2dTQ1U2NHQwYkRzcFEyREtIMk5tV3Fq?=
 =?utf-8?B?MlJYMEt4eENUMUpGTy9YblQ3RXpLbUo2eVp0aUVuN3V0NWQ3RVBMa3VFaThm?=
 =?utf-8?B?Y0VOanVnZnlXZHRzSUxaTWl0OFdqdjBFQTROMkNaN3lqQVhJazdZNnpSdnpn?=
 =?utf-8?B?Z1VnN1B2V0hqZVFkanJxanZURTdsM1ZUbWFRby9JU2NybzlBMWxrdGRJV2Nh?=
 =?utf-8?B?TldWQVhJa2FxZ2E3K2grcG1MMUhkSnRrWUFFcUIwOXRUa2RDLzRXeVBrd1dV?=
 =?utf-8?B?NFdNenFGckQ4bzZPcW1hTVhDaWNuc2Z5R3BDbDJhQkV3ampiQUhLS2xwaTR1?=
 =?utf-8?B?Q3h0a3VsNUIzSTUvUnp5eEtFbjRFQmREcGNiNitmMEtwUUdjZmpjRkFJdVhI?=
 =?utf-8?B?aDI0VERLekZiRDA1TzhYTzNSQldvMWJXc0RyQmVmU2RKSlkyekJjTnBCNnM5?=
 =?utf-8?B?ZVJEY0EyeVRQVVpwK0x0Z2FreTRzNTlPZnR6dmVGcjRQSER4N3Y4SklGeG45?=
 =?utf-8?B?eHNyMWFzYUtWcXJYemFFVUI5dTVuYnduSUsxQ2dvNzQwZTNBb0Jnd0cwdDBO?=
 =?utf-8?B?azloTXR4STBVV1cwR2tSR3d0N1lTdHZaaFA0THp4bnhwbERNZmFEck9FVlNR?=
 =?utf-8?B?YUlZb3owajZWUjJYVmJhNUhvdCsrZ0xxL0VFLzhESE16V21KdlVGOUdBM0o5?=
 =?utf-8?B?cVVKTFZqZ2R1czcwa0x3cU5LN01LRHdNMDJ5akhpU3EvbGo2WG15R0MrREU3?=
 =?utf-8?B?Uk5ZTmF6azl3V0QrR1hlVGlGWkV6TlIwUGFqZ05URnA0UlZTVUZ4bmQzZ0Y0?=
 =?utf-8?B?RzdXR2duSnQ5cW5HSXptQ3NqOTNzYyttNU5nNVRybXJJazFRUVNoTUwrdjY3?=
 =?utf-8?B?bTVmYUp4SmVMa3FnK2hjakVTT2tiNUhrSWpabysyb1Z1VFpUbmFwRkZLbjhy?=
 =?utf-8?B?K1JrYzRSNTgyN29KVUNnalFxU25Zc1BPTUp4bXhiblNzN2RZQkRpMXFQcDJp?=
 =?utf-8?B?bEV5d2ovaUtIM0gxYnlhV3lFY3RaeXl0ZGR3Q2hnSVZnUTVUd0Vya3NXTkFV?=
 =?utf-8?B?NHpWLzBITDMydzFhZ1RWVkIwbGtPaWY5dDRjcXpPUWVGZk1HQnRCL200aWtD?=
 =?utf-8?B?TjRhY3djeUsvY0hjRWl3N29keGZ4c29sRmlqREpYTThYaFJ4WFArdGt2MUFl?=
 =?utf-8?B?MDVlRmN5QVZoWWdEcTVHNEc4K2QrVkhTZTVlMSt1M0NSUHhFT1B6RUdoSE9t?=
 =?utf-8?B?NDZ4bmxPRTlTa0pEdDdqaDJmdEVnOS9saEx0eGptRGtnbVdvT2J3eWdwMDIz?=
 =?utf-8?B?QnIzZHlTZWxqZzhCMVNFdEY1NkJuaCtQcE5vUkpQQTh6SlJndk0wa3VEaWJj?=
 =?utf-8?B?aXdIVm4rdXdZSHFHaTFrNWlJMkRCZ0VDUFlMbVVkcFdUTHJKS2Vpck5OZk92?=
 =?utf-8?B?TXdvUkF2Y0R5aU5xcTZiejQzZjZ4QXFOWW5Dem9YKzNmSFdVaUNvMk9lbUJL?=
 =?utf-8?B?TXRuVS92bXR6SHBlbmNzOUFBQTBPaVdWTmJZdFEvZVZ0RFNTMVlnbXJvVXVV?=
 =?utf-8?Q?gN/0vKS1cRVWBzPVgYyv54K46?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f80f5be-a0fa-4525-7fda-08db295870c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2023 15:33:22.8269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K2kqxkS0HzmvbQxxRvXVc6HBhzvqJwgp9in1j5BYrCqJp49aG+R2mL8AX5FU2C6fEFJ4qA/3h5JuOIVxUqfXzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB5976
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

T24gMTYvMDMvMjAyMyAxMzozNiwgT2RlZCBHYWJiYXkgd3JvdGU6DQo+IERvbid0IHVzZSBwYWRY
IGZvciBhY3R1YWwgcmVzZXJ2ZWRYIGZpZWxkcy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogT2RlZCBH
YWJiYXkgPG9nYWJiYXlAa2VybmVsLm9yZz4NCj4gLS0tDQo+ICBpbmNsdWRlL3VhcGkvZHJtL2hh
YmFuYWxhYnNfYWNjZWwuaCB8IDEzICsrKysrKystLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L3VhcGkvZHJtL2hhYmFuYWxhYnNfYWNjZWwuaCBiL2luY2x1ZGUvdWFwaS9kcm0vaGFiYW5hbGFi
c19hY2NlbC5oDQo+IGluZGV4IDdjYTBlZjgwMmZkMS4uN2Q0NTdlYjRkYTc0IDEwMDY0NA0KPiAt
LS0gYS9pbmNsdWRlL3VhcGkvZHJtL2hhYmFuYWxhYnNfYWNjZWwuaA0KPiArKysgYi9pbmNsdWRl
L3VhcGkvZHJtL2hhYmFuYWxhYnNfYWNjZWwuaA0KPiBAQCAtOTE1LDE3ICs5MTUsMTggQEAgc3Ry
dWN0IGhsX2luZm9faHdfaXBfaW5mbyB7DQo+ICAJX191NjQgZHJhbV9wYWdlX3NpemU7DQo+ICAJ
X191MzIgZWRtYV9lbmFibGVkX21hc2s7DQo+ICAJX191MTYgbnVtYmVyX29mX3VzZXJfaW50ZXJy
dXB0czsNCj4gLQlfX3UxNiBwYWQyOw0KPiAtCV9fdTY0IHJlc2VydmVkNDsNCj4gKwlfX3U4IHJl
c2VydmVkMTsNCj4gKwlfX3U4IHJlc2VydmVkMjsNCj4gKwlfX3U2NCByZXNlcnZlZDM7DQo+ICAJ
X191NjQgZGV2aWNlX21lbV9hbGxvY19kZWZhdWx0X3BhZ2Vfc2l6ZTsNCj4gKwlfX3U2NCByZXNl
cnZlZDQ7DQo+ICAJX191NjQgcmVzZXJ2ZWQ1Ow0KPiAtCV9fdTY0IHJlc2VydmVkNjsNCj4gLQlf
X3UzMiByZXNlcnZlZDc7DQo+IC0JX191OCByZXNlcnZlZDg7DQo+ICsJX191MzIgcmVzZXJ2ZWQ2
Ow0KPiArCV9fdTggcmVzZXJ2ZWQ3Ow0KPiAgCV9fdTggcmV2aXNpb25faWQ7DQo+ICAJX191MTYg
dHBjX2ludGVycnVwdF9pZDsNCj4gKwlfX3UzMiByZXNlcnZlZDg7DQo+ICAJX191MzIgcmVzZXJ2
ZWQ5Ow0KPiAtCV9fdTggcGFkM1s0XTsNCj4gIAlfX3U2NCBlbmdpbmVfY29yZV9pbnRlcnJ1cHRf
cmVnX2FkZHI7DQo+ICB9Ow0KPiAgDQpSZXZpZXdlZC1ieTogT2ZpciBCaXR0b24gPG9iaXR0b25A
aGFiYW5hLmFpPg0K
