Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84722729BB2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 15:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1813D10E037;
	Fri,  9 Jun 2023 13:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2126.outbound.protection.outlook.com [40.107.104.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DDD10E037
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 13:37:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fn6umusNfgauDOnOBusESZrD0NT2eJb5cg9HyyUEDAFHsJ/PldcWiVacY0zNGiig21TyLc4pVBd50LW1NAmTre4oxh1D4ssMBN/eC7mH62n1oGdW/mfIMAPc79HX5eTCRPtITteDGI5Yw8bOtEYpbhGbK/Pc+Yup9/ZtplCNt64qLzgqM71U6BGWIvkO8FUV83rCdC+nVPLcNLhAsdlvhvV1f2WJRu7B+VHbOIaGr1OnvxkXrRftNMYDr4MtD6UuMNEaBbShqII7gQGLCv17DNw+vn2oVGIlHT4joPE+I71mjpjDnIiVT4QG17co1CSV2ulg5C71k7l8J9r9/eB+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9muQsvMZZ8Ouo6IKnwCyN8HwUqv/hXXj5EW/vkwaq0=;
 b=MoEYSVxFhaW/k56BnL7Cc9nAKH79MMrNcxtNQE4++4jqM+72I4aJlxXXSxaLtTm0CAc8ozyueeg1sSr+EfqvKQZRVnhIbRf+SyUHgPm1x2+xOb+8pY6Yajdq6Z3SV7ND8PxozKfsjNLJ3wVJvgRM1QbSStM7Ye4WNFgKT7pVQbdtL1s1+7oSIDigAUrW8FYFSo2fpPc5LT4VXabYrHBEu/u9lQbUutBdgYNmgMEgHYtX8U7gWoxlRxYF+YvWJeVPgxZsbmZyMAaS6FpqDt+jPwU7qD9or58ZSv6oUP5BBDYv9QDdBoaZdLRGLQhj1FVDQ+yycHeQnZuixZzIwLxw9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9muQsvMZZ8Ouo6IKnwCyN8HwUqv/hXXj5EW/vkwaq0=;
 b=ooLqyvYBGLGoFw26vu/yCwNO5fv+W5BsADavQFkUoiphb7M3PD0gJzUTgFhh96pLt24iQvHlaXAwfdXVILaFrhm68llkfCIKqeqy6k6G+UJ8oylHcDpoXaJSVvVKiu6BFwHpmiCcorpr4ELbRR9Qihc4wv+PF9CPB6y94Nd7eUiC/xkUVe93xLSfrp+UrgulQO/ibaXHFY+dE1DQK0viYNw1Yq87u8PnJcjNBG58mNENtvmWu0V02mjC7HHJUbCDUeS5bqnsG4RBcfsvA6GXHGah3QqJ5hvOZD362V8dE9bgSEI3Vh6hmCXHR0jWGFHHaY2jDfNvGJ8QjHBuxtkXJg==
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com (2603:10a6:10:2d8::6)
 by AM7PR02MB6324.eurprd02.prod.outlook.com (2603:10a6:20b:1bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 13:37:39 +0000
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::f04b:e404:488b:2352]) by DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::f04b:e404:488b:2352%7]) with mapi id 15.20.6455.039; Fri, 9 Jun 2023
 13:37:39 +0000
From: Tomer Tayar <ttayar@habana.ai>
To: Arnd Bergmann <arnd@kernel.org>, Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH] accel/habanalabs: add more debugfs stub helpers
Thread-Topic: [PATCH] accel/habanalabs: add more debugfs stub helpers
Thread-Index: AQHZmsrdhRP7Ov+8dUeEuqVMN+BLXK+CeYYA
Date: Fri, 9 Jun 2023 13:37:38 +0000
Message-ID: <b3a3e2f8-51d8-f8ce-95ce-1180f80cc2d2@habana.ai>
References: <20230609120636.3969045-1-arnd@kernel.org>
In-Reply-To: <20230609120636.3969045-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR02MB7573:EE_|AM7PR02MB6324:EE_
x-ms-office365-filtering-correlation-id: 6affc0e5-fc0b-4c43-fc77-08db68eeb152
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4MpNQOr6i/3dgXbOC0J96mJ+tl6PDxGQeDi+96OBrMtMDDNRytSWXd8ry7xdJOIS32heI+wIvQBBS+qYkZP/H5ZZvDDYuMjisCyYbkqjhPXkg0g5RmfzL5AzQpeKTEmMxTZ90NPKFfFVeYpb69x4Y6qBimq0Wdir/WX58hh8Hdiu+HPC3X/HR27zltw+x/ylvLQTpjOcw1LL18scqIzTAPBIzyquAmHSS7XhMRSeuuNAVG6RG5WCgE0aa8NF5yYjWHHslKtXnjX4IkHQBHHqAi01SgvS9x2MWYVfyJnGJlXBcA7Zm2IDmhHuXrl1F6pyfFB1bvsaYXljXlxhiebTrqlAfuc/5rGwVA/vFW2zXIWyWy+YjgZi2cPSDXpetFMUoYkPfFywpaU3wRh286QIk6ovnnUjOqWF1EUCc7XjWGHSXt3B/cKJpvlntkPKo24eiKq5JE2DUnwMqTs5bfMBjy4f5oKbbhQvKVrsPAhRhCnj9oKNgv4YpMzT4PO4nzBQyHqXi8g3n/yWCLgDuUwln7CokhCTuXUd6n7CouOjEBNxN8vj8EviqVPX1nh1Wnnu/IUE7ERua+aVfHy6IvUK8kXB2asiuUsswmTaW7UJZjYAcPK7eU3G18t2DK9Q/Hl8mpkkNHymt3J/4/XQlxN26BpnSxVZEd9dMDhlHCY8h31YPkXvld8keC94i8xOLWvK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR02MB7573.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39840400004)(376002)(136003)(346002)(396003)(451199021)(478600001)(6506007)(6512007)(26005)(31686004)(54906003)(110136005)(186003)(82960400001)(2906002)(2616005)(38070700005)(41300700001)(71200400001)(122000001)(64756008)(66946007)(66476007)(66556008)(66446008)(91956017)(76116006)(38100700002)(4326008)(53546011)(5660300002)(31696002)(316002)(36756003)(8936002)(8676002)(86362001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFJWWHNQbmp4Q1JCK1hSV004aStpUWI1SzE3U05ldFpocjhvYk0xRmdOekdp?=
 =?utf-8?B?c3QwQ0EyOHVUN2JPamR4MHBNbFQ4V083MnR1RVl6cjNNVkZiZkdIZG9qWHk0?=
 =?utf-8?B?UG5hVXJCNjlleE03L1VhZVRGQmZQdEgvYWg1ajZ1RXpWTTd5L0pRVDhnbVlC?=
 =?utf-8?B?WTdpc0tFSDg3UkVTZC9tUVJyd2hKY2pHdnBzNTZ5RkkzUzZFd0JDSEZQUE9q?=
 =?utf-8?B?ejNlekJYdFJIQ2FRMktRcHlSL0dnRndKQStyTXU0UURTQXZzZjRVam1oM0xo?=
 =?utf-8?B?Wkhoc2x1YU5xNlllRVJONHBIWkg4ZCtRSDFTb1F4bnFlMFMyQmNUMDlxQzda?=
 =?utf-8?B?cE1uWDVjNWdiOS91dVlja1R5VVQ0aStzQ1FsaTBQVWhRRnpPZkpXd3k1eU4r?=
 =?utf-8?B?cWltQ1pPR0VkdFVZcFYycENtaCtINWdOdmZyZlB3bXJuOGJHcHF1ZUlmM3di?=
 =?utf-8?B?SmdnMVdld2s3eW5jRHlySmtHSDhHTmtPeDgrZjFzaElnZWsvZGZTOUxPR0Vq?=
 =?utf-8?B?dVVjK2FSUGVDdG5xMmRvN2NleUVKNkI3c09jaGtselVGVjV3VXdZeGw0SWNM?=
 =?utf-8?B?YzRPd2ttQXZDSHdBZ3NWYWNldS9UaXMyb2srNTBqN0pGaGhPZjg0Nkg2dzBq?=
 =?utf-8?B?TGI5ekJxcHVSTVhlRExSWTYxWnJTbmFoSFdQUjB2MkcyY1l4T3JTQWhDZ055?=
 =?utf-8?B?ZDMrM2p5c29jakIxY0o5TlBSakcyRnBNK1lSWmhtK1YvNC8wV1NBemdhaFRO?=
 =?utf-8?B?YmdDZDZSRTJhcXZ2MzkzQzZrakt4cEEraTBjTnRlc2hxZGsvYTZtRDZlaGI3?=
 =?utf-8?B?OXFJVndxMEQwakVHKy9nTkRSWm1MN2x1ZDlUL1ZtSnNYd0ZlaXBrclB0eDAr?=
 =?utf-8?B?SUZSWEVHRldIV1BSemRKUHRkVVI5aFcyWk9ndmEvWS96eThuY29pWG80a1JZ?=
 =?utf-8?B?R3BnQmhWdmw5ZnlQOTR3cWUzT2tRWEJoQnI3VVl6MHEwZEw3d0oxQjdmMmh2?=
 =?utf-8?B?cDZqa1lSSjdOaytVVHJuSzNkNmQ2RkhtQlM3UFoxNDY3eTdsT1dJNWZFNFBh?=
 =?utf-8?B?OVUyczllTjRoZEVoeGpQKys0Z3dIMEo1U2NMdWM0VDhzWnI5cG9HU0VOUnJZ?=
 =?utf-8?B?SHJXMktXM1ViMTZ3Z3loT0J3NThYbHNJL09XZEFPSkdoVVpTaGtoaVJQNTlP?=
 =?utf-8?B?aVVad2Z4WmJtTWVEMDJ3S2xPSjl5RWFsVWU2d3Avb0NWcXJKQXN3NXM0ayts?=
 =?utf-8?B?Y2w1Um04NUYvbnhMd25PTjQ5TU83Q1g0WEdycHc3a0dhR1ZKOTF3TlVaVDFq?=
 =?utf-8?B?ZEdibkdHc1ZuaXpickdheEprZmdMbFRuajJ4V2FYcWdDam9MTkJmYThYYWtH?=
 =?utf-8?B?dnVLL3lwVVl4QkhqdUE3SlNJRStxVjFoMTZLRjFuYnZYS2ZEcmFhTllydGVz?=
 =?utf-8?B?V0R5S0tuUjhWa3luRlJnOWlBMkx1Nm1UejdoR2w0YUhaZkNtNThudVpJM3Ns?=
 =?utf-8?B?UkZUSm04VzFpNSs2YThLSzBRN0VHUkp4TyswaFFPM2oyVS91TXZlTzFkMEp2?=
 =?utf-8?B?NFQzUjJDRm1xSU00dzZnMzhuTllvQXpBZDA1MnFpS29oMEl5TEVqbW4vMDdP?=
 =?utf-8?B?RGNidDk3aGdTTkpTZjAzWmlNdUtxaWFtcFRHRk05aDdYWjkrQWtTZlV1aEx2?=
 =?utf-8?B?QTJLbVFqWitSaFJKcUVyMTh4aTlGNC9yOVZHN0xaRlpoQ2kwNVBuVXhVUU1n?=
 =?utf-8?B?WFpNa05qL0N6NHJjMTB6YnVJRmNHYWVGVVUzczAzRVJSM3FGM1Y3Ritma25x?=
 =?utf-8?B?ZS9PWUNOOTBGTXJxeEZsek9xSXJ6d0lsK2x4dEd3a3FOZG1EZ3VNRk5kd1Bo?=
 =?utf-8?B?dkNtUkZ4TENleVJGUVhMcExFKzB1QnRNL2JuYjJOMHBtUUgzaG9yejFlbTF4?=
 =?utf-8?B?czdPbTZ4UkR2Y0gxdHpHYXVvckYyMkxkdng3M1JZZ2xGdnc0OXd2YnV0cHli?=
 =?utf-8?B?eTBGN2ZFSkRaSnVIWXhENnlmSFg5VktvRzdzdzlVUVQrK1lVQzdsL2Q5VVJT?=
 =?utf-8?B?UEZLeC9TS1ZNYi9SNkVhWThnS3VoeE9HRmo2Si9KQ3hZL1NNTUYrTC9GYzl0?=
 =?utf-8?Q?g5zg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91632F005801B84FB53EF8A447A4E7EC@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7573.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6affc0e5-fc0b-4c43-fc77-08db68eeb152
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 13:37:38.9480 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gSWD3bTKSyuZGodQ8Mon6YpS1JXWEMBKEf4jHQp05cuaxpD+OID8V5X+zbui8bZyhMiEICmW7tkzvYjfc5Y19Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6324
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
Cc: Ohad Sharabi <osharabi@habana.ai>, Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dafna Hirschfeld <dhirschfeld@habana.ai>, Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDkvMDYvMjAyMyAxNTowNiwgQXJuZCBCZXJnbWFubiB3cm90ZToNCj4gRnJvbTogQXJuZCBC
ZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCj4NCj4gVHdvIGZ1bmN0aW9ucyBnb3QgYWRkZWQgd2l0
aCBub3JtYWwgcHJvdG90eXBlcyBmb3IgZGVidWdmcywgYnV0IG5vdA0KPiBhbHRlcm5hdGl2ZSB3
aGVuIGJ1aWxkaW5nIHdpdGhvdXQgaXQ6DQo+DQo+IGRyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9j
b21tb24vZGV2aWNlLmM6IEluIGZ1bmN0aW9uICdobF9kZXZpY2VfaW5pdCc6DQo+IGRyaXZlcnMv
YWNjZWwvaGFiYW5hbGFicy9jb21tb24vZGV2aWNlLmM6MjE3NzoxNDogZXJyb3I6IGltcGxpY2l0
IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdobF9kZWJ1Z2ZzX2RldmljZV9pbml0JzsgZGlkIHlv
dSBtZWFuICdobF9kZWJ1Z2ZzX2luaXQnPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNs
YXJhdGlvbl0NCj4gZHJpdmVycy9hY2NlbC9oYWJhbmFsYWJzL2NvbW1vbi9kZXZpY2UuYzoyMzA1
Ojk6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnaGxfZGVidWdmc19k
ZXZpY2VfZmluaSc7IGRpZCB5b3UgbWVhbiAnaGxfZGVidWdmc19yZW1vdmVfZmlsZSc/IFstV2Vy
cm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KPg0KPiBBZGQgc3R1YnMgZm9yIHRo
ZXNlIGFzIHdlbGwuDQo+DQo+IEZpeGVzOiA1NTMzMTFmYzdiNzZlICgiYWNjZWwvaGFiYW5hbGFi
czogZXhwb3NlIGRlYnVnZnMgZmlsZXMgbGF0ZXIiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KDQpUaGFua3MsDQpSZXZpZXdlZC1ieTogVG9tZXIgVGF5
YXIgPHR0YXlhckBoYWJhbmEuYWk+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9hY2NlbC9oYWJhbmFs
YWJzL2NvbW1vbi9oYWJhbmFsYWJzLmggfCA5ICsrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNjZWwvaGFiYW5h
bGFicy9jb21tb24vaGFiYW5hbGFicy5oIGIvZHJpdmVycy9hY2NlbC9oYWJhbmFsYWJzL2NvbW1v
bi9oYWJhbmFsYWJzLmgNCj4gaW5kZXggZDkyYmEyZTMwZTMxMC4uMmYwMjdkNWE4MjA2NCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9hY2NlbC9oYWJhbmFsYWJzL2NvbW1vbi9oYWJhbmFsYWJzLmgN
Cj4gKysrIGIvZHJpdmVycy9hY2NlbC9oYWJhbmFsYWJzL2NvbW1vbi9oYWJhbmFsYWJzLmgNCj4g
QEAgLTM5ODAsNiArMzk4MCwxNSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaGxfZGVidWdmc19maW5p
KHZvaWQpDQo+ICAgew0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBpbmxpbmUgaW50IGhsX2RlYnVn
ZnNfZGV2aWNlX2luaXQoc3RydWN0IGhsX2RldmljZSAqaGRldikNCj4gK3sNCj4gKwlyZXR1cm4g
MDsNCj4gK30NCj4gKw0KPiArc3RhdGljIGlubGluZSB2b2lkIGhsX2RlYnVnZnNfZGV2aWNlX2Zp
bmkoc3RydWN0IGhsX2RldmljZSAqaGRldikNCj4gK3sNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBp
bmxpbmUgdm9pZCBobF9kZWJ1Z2ZzX2FkZF9kZXZpY2Uoc3RydWN0IGhsX2RldmljZSAqaGRldikN
Cj4gICB7DQo+ICAgfQ0KDQoNCg==
