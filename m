Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB8A69C035
	for <lists+dri-devel@lfdr.de>; Sun, 19 Feb 2023 13:43:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A6710E140;
	Sun, 19 Feb 2023 12:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaf::70e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0EE10E140
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Feb 2023 12:42:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuWXB8jIpLVOinYDoL69Vm7LbNW4HF7iBWBafRYDPe2U+QqXTUQDIMv2zoZURMPLCmxlp55Q3Lqxw2A2WtdSFiDbO8VHJ1Ap8O7TiHWx4lTtX9B96roYQ0cjekdv8Uw93bZe+n0hlVMxhR1ZVHfCFVGrLhrD/jx0Qa7wIcHaFMGyAwEcnOJdDQGBcZl0Z+60+ISyqb/rWNHrEF6DB9wQ4tS5ZxEbSyaVp8tyBPyZwxl3CWAhZmeDGftkbe6IO4MPQMOJzgG8zkMaBlVJnlpSUOlyNFTiDfJqbbTuj1C+jNcY+Y1sW+VftzIdXGihqZKGjknWtN+zRubuNcUx2vsKPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAR2pMAlwYw3bE4yhi63vhmKco+dZb8/UaJjHw4fYoI=;
 b=ZaVQGs6ImDZaeS8xELsTIq3AVex3DnQm/XC22k/s+XEUpAcZhjLX1la+9WOKj5uL/wISVPeJjkNAqwE//xnwHVrQXVWe8yKCVwj6N/6EbvL4bzYrvAKnQSCpcjoH/PpN1osEYGPqiuzXoUtU58nmLNWONyyV3vJQiG2m2WoOqTm7oEXkTwQcfCwiUpFuYOKOkWzKJ2Tdz2ghUI+8u+NMuCdAlE6OcS4tseZhMlrQ5fgwQdLODg1Ur7QiWlchWep1oXuA5UQH0QJN2OQpm48/CUCEM9wua1Q+SlMNzSs5FTigEYjufgfU7GrG8DOS95bXTr0OHoG4RLhZvUIZKWOWnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAR2pMAlwYw3bE4yhi63vhmKco+dZb8/UaJjHw4fYoI=;
 b=OBGI4aeagVL77oaPcm+ehak9pe9xDMy17+VsRK3qPIdb3A7d+8nM1GRM7siI03QmXvG6tI+eBJ1FWWgn9iFDrCP+IcUoR6rFwQ+S777mTU0ss6+hq4zhcSG4u9HmJ+kjyi7jQ3MdGHLPuOkMU7T6AvehapRXPKaBvAE0EMxcAwuAZ4tzVbghX8XRf+GecNVZlLsgb/fZXeGtpSPR7Vx51zKtbDXUq0x4wJ2rmlG9Zkj7/Mhv4VlbXMGUIqrEQYWOaXCimxLNXrWjGrd2nPbjNnOyM23URHaY205EMd8opmLWDtJLRdKFg5KRdG+yYf1BuNmN0YcgFUGAYcRzRIJaOg==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by PAVPR02MB9770.eurprd02.prod.outlook.com (2603:10a6:102:314::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.18; Sun, 19 Feb
 2023 12:42:54 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::e0f2:c1f2:4da0:b37a]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::e0f2:c1f2:4da0:b37a%3]) with mapi id 15.20.6111.018; Sun, 19 Feb 2023
 12:42:54 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Oded Gabbay
 <ogabbay@kernel.org>
Subject: RE: [PATCH 19/27] habanalabs: capture interrupt timestamp in handler
Thread-Topic: [PATCH 19/27] habanalabs: capture interrupt timestamp in handler
Thread-Index: AQHZPyL1v0Aefj9XXECYGL9kSuxxu67RqpWAgASN44A=
Date: Sun, 19 Feb 2023 12:42:53 +0000
Message-ID: <DB9PR02MB661983DF0216D3932747A7E1BCA79@DB9PR02MB6619.eurprd02.prod.outlook.com>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
 <20230212204454.2938561-19-ogabbay@kernel.org>
 <20230216143909.GH2849548@linux.intel.com>
In-Reply-To: <20230216143909.GH2849548@linux.intel.com>
Accept-Language: he-IL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|PAVPR02MB9770:EE_
x-ms-office365-filtering-correlation-id: cd24ca7d-7ac0-4b88-15b1-08db1276d1be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8plBSBZCNu9l5HvysPqlpmTHGfMol12wJvCzOnzVADlmJvQiU4kd4r26Ki55giMyHvRNx2g/4na/efAc+XQViNzn6jHnxXuFFLJ9nxYmGt1heGr6/XIjdBScw+QSHdTi+fKZ30Lo3AbR2cyS6LlVl78Qmcy+lMPL8Pzu4aQgNYTlhcK8TxNuEkaYmiH36koUiGx7iOp4FPS+5I5aNmIgJL+x4qvIJtNPlilreRkO4C9z4ng4puqoodX+nhW0BBQxwzYBnxl+RUOTe+HLPl5D3ayd5xN9jfMozGZlatCm+/Uv0ClbUmkqkyu9eKoteofd4lbBV77RuHvfHV0FfbldJNhi7MvJ0Ir5odPvtDFrH6LbjGHC1Ahyaho2331tNY/2XzFkDQ/0bEJubFR9vKmDs+qadihoAVxJBuTpyVkIG+ckKVhmDNO4M3kFhD+b8ySmuO1Z5guFSloJput+odrWfGlJg2sE4oAb0xNqp/tlmZbFvQ2FsjhhJqBAzGGrVH6wK1W5KSoLbMRksLDNVSxWgUC4/pTQa3gYBDj11MO7qiMQiiFnDfh+GTSUr1TaXeWI2GIgT1tRzxfI67Ic31ojAu9UTj6jtnYJ0Tm/Zgnoqw50agQl8NlI1YAmrWVqcqGn/pJGZXmL3MQv+3FsJ0rK+KZC505lthNqjlyCk9Opfg9EgqLctgmpdqNR4tL1ff8d+VtXHrwVYnXQKrLW168YPQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(376002)(39840400004)(136003)(396003)(451199018)(26005)(9686003)(186003)(53546011)(478600001)(83380400001)(7696005)(6506007)(71200400001)(316002)(110136005)(4326008)(2906002)(8936002)(64756008)(66446008)(66556008)(66476007)(66946007)(8676002)(41300700001)(38100700002)(76116006)(52536014)(122000001)(82960400001)(4744005)(5660300002)(33656002)(86362001)(38070700005)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVZvdVBJeTBBZHUybVJmVXJieGhHV21vKzlTN0VsUkxlY1pJaEk3TXZWcTdx?=
 =?utf-8?B?UVp6dnVOK3d5dmQwNlBqVHBFT016R2U1UkRvdjBMT0xlVHRyUnlGemZCVXRT?=
 =?utf-8?B?TDNiaks1SFA5dVJWeEdiU2s0MXZZQVFLSERTWnRTOVdjUEcvSW5hZ3Rxa2ps?=
 =?utf-8?B?Mm1ScnU5M0RSSWVlQUhvNVNGdElHdWo1aDFlUXRtUjN4RE11d1ROM21NNitG?=
 =?utf-8?B?bHRaTFhQM1BCY2p3Mm83NFNjalBSSS95UEptcVVrL3ZWU0lCUVJ4clptTXI4?=
 =?utf-8?B?K1ZVSFlIbHd2Vy9qUndHSi9VdGU2eFRjaHR0SzhrdDJQM2VaZUhDdENoQWpT?=
 =?utf-8?B?alBpc2Z4RjRlZTBBR2l0ZWFIRENLRlYwejVjS29GSlhoQytCZERDWnNpRm9v?=
 =?utf-8?B?aFFQdmM1aXdZNHFIdXJ3N2k1aE9pQStWM2dIb3hjVFZFYmVMYTVxcTRWVHNk?=
 =?utf-8?B?VGtoVDNmeWd4dmRob1NrRm1tRDA4a2tRMXRUYStpdlYrRnNiUmpOc1FhQkZu?=
 =?utf-8?B?elM3K1VLU3hUOXN0RmdObEtoZXNVM3k0SWRUS3ZpTFRDWjV5TTJ3RUJCRXFO?=
 =?utf-8?B?S3VybXZHcGw1MGVFY3U5bitabmFhdnBPVGk3TzhWbVdVbTNCRFJVVmJnV1Rx?=
 =?utf-8?B?T3B1YXJTbXprYkpxcERKVEl0MFIwZElnY05oRU1yTnJTV3k0SGxMM28wOFRU?=
 =?utf-8?B?dlViZXZ0VjdaMWlzZnBpL05RM29EN1JFYytvTkgzVHJpSEdhb0VJMFJDWHBy?=
 =?utf-8?B?d0RoQ3c0VjdkK20yYnMrbG9PRFhLS1AzVSt2UlZLekRXRFNteERaeVcrYStV?=
 =?utf-8?B?TEVncXJyTGZpMnlYdWVhRXFRWEptY0tsaXFSL3h5dDl2T3V2Z0lwaU5iOWNJ?=
 =?utf-8?B?b2NtaUx3WEZUVlE0aGxDYWJ3MG5sMndnRjRzYzVWZ2tsZTJCcVJibCtEVURn?=
 =?utf-8?B?N3FkZkpsTGNqMkFQWmJXYTJ1YW9yNHlPR2taellrYzBDWnpFTFBUSVhZZlFH?=
 =?utf-8?B?UUVxc0xJQWgwdFpmaUxKVm82UFBLd2pGYktGdzhCL1JQWndJQ052cFVOemdo?=
 =?utf-8?B?NzZ6QkFERmxkNUl2clNHZnR1akVxY1ZMUm9tZGdVbUNRM3hBQXIzd21mT0JM?=
 =?utf-8?B?djBuUnRPN3E2STRtckZyQkh5ZG92Y1NzaElvcDFoMHU2N3VieGVSSjByUEJl?=
 =?utf-8?B?OFN6OHRwaDVicjEzNWgrOG5lM2U0K0w4MkNvRjRwU1VJTWQ0NmcrNjQ0cnA1?=
 =?utf-8?B?V1NtYk1kZVJQNmtKZkhWdVNUZnFpUzJINS9JZFBpaGIrSUtSMzhyaEIyMms1?=
 =?utf-8?B?T0RMK1JVMERVQk9EbVdpRDNOMkhwS1ZvVDZsdS91UjJNUWZ3aWtkbEMvM3lP?=
 =?utf-8?B?bDVGc0h1N1B3WDhnS1RJUWo3YjhUcGpNREM2V3NOcFBIRFVZUGZwSERrMTZk?=
 =?utf-8?B?N3kwdTFjQW1OZlJlMnhwY21aK09iUkNwUGROc01hd05BMS9GeFp4c1BHbmNF?=
 =?utf-8?B?M2ZYeUZLNWtZaUNUQjlsZlJlNExhNzBxbEtGcGxLUVpTbWN5aEE5aWlVaGEy?=
 =?utf-8?B?ZWZpenR2djA1b3dGSFY3cEw0UzE0WnRJdXBOTWs4UHdkUEo0K2FsdXNQR2Vo?=
 =?utf-8?B?bElZOGt2ZklyQmdHc3lmUnZhKy9CdUdLVElPcmRoSXpwSy9ydjlKQXc0aDQ5?=
 =?utf-8?B?VWtGR0UxK25tc2JnVGFLUk5zSE5rZ2NFSlE0VmdSamxZcHZOTDl5QlVxTXYz?=
 =?utf-8?B?c3hudWN1enp1U253QS8wMUY3K3I1eCs2b1RNNURHZWxKR2VleGZ3QUU1M0Nu?=
 =?utf-8?B?cXQ1UEEzMHdsVWlsckNPaEM4VkgzREZNbkJkUU94a0JJTjJqR3VoR0pnWmtP?=
 =?utf-8?B?bGhZRnNGbjdYV2daTml0bEoxTVpKQlpLbUZqeDRuUUZrTGoveUpzWis0aDgz?=
 =?utf-8?B?aGhZcW8rK1hPbzhpeXlzVXN0dGloUVUrNG1iOEtmOEdBc1I1SjJjRmRYbGhC?=
 =?utf-8?B?cVBnNlVBcTd1cExIT241SWtZdFV1YmNEWkFZckNNUzM3REYwOEhjbEtTSVl6?=
 =?utf-8?B?TlIvWUR5ZldpTXB1R3Rvd1Bac2ROOWlhcWN3YkRsL0lkcnZwYVRQZ25WeDRm?=
 =?utf-8?Q?q550=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd24ca7d-7ac0-4b88-15b1-08db1276d1be
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2023 12:42:53.6768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1bcyVVYAiCyuKIEgJXHu9nLt1jC5FXle+wnzUcq5Es/zZc3j7YFhecXHpYw2Sc1S/jEALLnTTPlninrvAvxZNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9770
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBGZWIgMTYsIDIwMjMgMTY6MzkgUE0sIFN0YW5pc2xhdyBHcnVzemthIDxzdGFuaXNs
YXcuZ3J1c3prYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KPiBPbiBTdW4sIEZlYiAxMiwgMjAy
MyBhdCAxMDo0NDo0NlBNICswMjAwLCBPZGVkIEdhYmJheSB3cm90ZToNCj4gPiBGcm9tOiBPZmly
IEJpdHRvbiA8b2JpdHRvbkBoYWJhbmEuYWk+DQo+ID4NCj4gPiBJbiBvcmRlciBmb3IgaW50ZXJy
dXB0IHRpbWVzdGFtcCB0byBiZSBtb3JlIGFjY3VyYXRlIHdlIHNob3VsZCBjYXB0dXJlDQo+ID4g
aXQgZHVyaW5nIHRoZSBpbnRlcnJ1cHQgaGFuZGxpbmcgcmF0aGVyIHRoYW4gaW4gdGhyZWFkZWQg
aXJxIGNvbnRleHQuDQo+IA0KPiBXaHkgdGhpcyBpcyBpbXBvcnRhbnQgdG8gaGF2ZSB0aGlzIHRp
bWVzdGFtcCBtb3JlIGFjY3VyYXRlID8NCg0KSSBhZ3JlZSB0aGF0IHRoZSB0aW1lIGRpZmYgYmV0
d2VlbiB0YWtpbmcgdGhlIHRpbWVzdGFtcCBpbiB0aGUgaW50ZXJydXB0IGhhbmRsZXIgdnMgdGFr
aW5nIGl0IGluIHRoZQ0KdGhyZWFkZWQgaXJxIGNvbnRleHQgaXMgbmVnbGlnaWJsZS4NCg0KSGF2
aW5nIHNhaWQgdGhhdCBpdCBpcyBzdGlsbCBpbXBvcnRhbnQgYXMgd2Ugd291bGQgbGlrZSB0byBo
YXZlIHRoZSBzYW1lIHRpbWVzdGFtcCBmb3IgZXZlbnRzIHRoYXQgZmluaXNoZWQgdG9nZXRoZXIs
DQpyYXRoZXIgdGhhbiBoYXZpbmcgZGlmZmVyZW50IHRpbWVzdGFtcHMgd2hlbiB3ZSBwcm9jZXNz
IHRoZSBldmVudHMgaW4gdGhlIHRocmVhZGVkIGlycSBoYW5kbGVyLg0KDQo+IFdoYXQgYWN0dWFs
bHkgJ21vcmUgYWNjdXJhdGUnIG1lYW4gaW4gdGhpcyBjb250ZXh0ID8NCj4gDQo+IFJlZ2FyZHMN
Cj4gU3RhbmlzbGF3DQoNCkJ5ICdtb3JlIGFjY3VyYXRlJyB3ZSBtZWFuIGNsb3Nlc3QgdG8gdGhl
IE1TSVggaW50ZXJydXB0Lg0KDQpPZmlyLg0KDQo=
