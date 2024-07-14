Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE0C930987
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jul 2024 12:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA1010E00B;
	Sun, 14 Jul 2024 10:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="M8/4VWUp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-b.mailcontrol.com (mail-04-b.mailcontrol.com
 [85.115.56.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CA410E00B
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2024 10:19:04 +0000 (UTC)
Received: from rly15b.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly15b.srv.mailcontrol.com (MailControl) with ESMTP id 46EAIj2f113932;
 Sun, 14 Jul 2024 11:18:45 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly15b.srv.mailcontrol.com (MailControl) id 46EAIHce110446;
 Sun, 14 Jul 2024 11:18:17 +0100
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp17011020.outbound.protection.outlook.com [40.93.64.20])
 by rly15b-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 46EAIEUI109849
 (TLS bits=256 verify=OK); Sun, 14 Jul 2024 11:18:17 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xloK62ZyLS/uo/oiBzWrIUkZ/E2RsB6ozQ9eFR9hFM9jef16ZdZcyQiM6rAACRqxtLqd8ZjiWB5MSWRX3x8AaZg/RZDFSDeCKOG8GGhgOL3jSc5MAT281Cvwx5RqBZypU2udRErHCyns1AJ5swooK1aOcpwL2saE0lT20atYzLOqysYUShlnlSNvmGpJ+Nf7qK6ap3hcJUIswnkR5u7+96tjodIJc7KpOsAeWWL3kVAmmS0+BLAulPBQn4vypQYY2MrrHY9cHGqYp9X+1ZxSMXWlCjDPm7xafoyzkMb9x/N9NPyn/M8AxBq8yJgKVysvb5caZ/jzazRCi9hGLZeuCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJL44o8rUvOPqwId4WvwA9NClYhHZciWABWrv4pzvRg=;
 b=WuzWDRzRSCDv/nCtUuEYvkpWEQRMYSoyxhpq8N5KcVmP5wyf5cngaHSL56rW0IW0cLHT9JRQEZjAk1wby4BUypNDPwbYf4jZw3Xk7dT7fVFLqNaB5ZUvtr9/sAZSDK3m9bzbuqTFDyFx13v7dAHqhrgDNMdSjsIC5clnI6HrxdbH+l4BYVw9c/2MAsEfqRovBC17BmF3UhWIhX+ISnyC7NZ3ga3u5wMul+x4vTfa3iM6kW9onBAnOZBSvyt7gvB7uAb3hmHVrq7sE07poDTtzbv+BHWAwW+PcCGDIiXhg6hLcOqjfb9QEQq9PMBXQkYMsNwdeqXEAP4IWSJOAhliRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJL44o8rUvOPqwId4WvwA9NClYhHZciWABWrv4pzvRg=;
 b=M8/4VWUpVz7IXsTPxIXrNTNstr9zYcag0vOXVEbDTLcbNk/OL4f17ALs7DZJ5PeBywmTnxtt6Jd6HosKV9j105Xt72vajk4wTn6PGqzUBiIe/pqyL0XZaoqeH8AWcXZ4s7dtIlGTwkUApoPsigUfQzr712RVkSXWN8/qzFItJ8d1VJkShPOuU4i0SKDrOjIUXsKo/avrDTtpMKShx3tTG7vB5r+R/Rsas0NGKfraobUAnjNXhnA82PLuYYwVC+UX+hxJgkVzsPrxxzx0DRDv/dyEp05N6DYYZo2MEtJJZgmG0NLtVV4Yp8mhU/bi9TyTla/BTKeyt8cm0kmq6PBHkQ==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by AS8PR02MB10244.eurprd02.prod.outlook.com (2603:10a6:20b:628::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Sun, 14 Jul
 2024 10:18:12 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7762.025; Sun, 14 Jul 2024
 10:18:12 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Leon Romanovsky <leon@kernel.org>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Thread-Topic: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Thread-Index: AQHavWrR8RRCkLe4k0COm3YO57oxm7HGEhoAgAYu4QCAABaLgIABDVwAgAAexgCAAVdvAIAAF5aAgA4dOACAFi6SAIAC9PYA
Date: Sun, 14 Jul 2024 10:18:12 +0000
Message-ID: <2c767517-e24c-416b-9083-d3a220ffc14c@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-12-oshpigelman@habana.ai>
 <20240613191828.GJ4966@unreal>
 <fbb34afa-8a38-4124-9384-9b858ce2c4e5@habana.ai>
 <20240617190429.GB4025@unreal>
 <461bf44e-fd2f-4c8b-bc41-48d48e5a7fcb@habana.ai>
 <20240618125842.GG4025@unreal>
 <b4bda963-7026-4037-83e6-de74728569bd@habana.ai>
 <20240619105219.GO4025@unreal>
 <a5554266-55b7-4e96-b226-b686b8a6af89@habana.ai>
 <20240712130856.GB14050@ziepe.ca>
In-Reply-To: <20240712130856.GB14050@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|AS8PR02MB10244:EE_
x-ms-office365-filtering-correlation-id: f8db5672-b8a4-4fda-b42b-08dca3ee4462
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U2lnVVkwTFNEa0FNZXJOTXExa2tVTWdIeWdFTmZoeTVrazF4T2oxVGJ3WU5u?=
 =?utf-8?B?L2Zoa0hiNTZVOVdrYkN3YnF5YTJubXJYeWtGdFpuTVB3aDMxdTlOS2w5U3F2?=
 =?utf-8?B?c09FSXhmZ05sbGZ6d3pRV2pMVGR6QkJWVFRsVWZQM2U5ZEpzS3dCMHRzajNM?=
 =?utf-8?B?b0ZkMGFKVkVFRUd0WlBULzhvamZ1cWNIeG5jNjlMRmN0VlZ6U2N2ZHFoWVpz?=
 =?utf-8?B?czNMSllmd3Z0YWxtUE1pUTBYWFBzOUxKVVFxNU15cjlRd2FvcWFtUWdmWjIz?=
 =?utf-8?B?UEs3bU1vVys5L1J5U2t6bTF1cEZWRUNMbjMwcy91aEx0ei84VGVuOVlqZm9E?=
 =?utf-8?B?UW4xTkc4L2xuRVc3dzQ1Rm5rVzBMeTltZXBDNVZZdFdHck8xUUNSZzlqQ0xu?=
 =?utf-8?B?S3M2MWZQT09LV0NVY1g2cXBmVkZCTEZuZ0RaRURSQXdGUFU5cUYrc1JvRTd6?=
 =?utf-8?B?cFN1NUZtYnAwbXZWYTF4eG5nMkNxa3VBZ3RYaW5EdjVzVU9ZQ0tRWVNzek13?=
 =?utf-8?B?Z2xSV2NvM2VEczhiTXhCb0xidllId1pDaXlrYXRRVUlpSDhEeFN2UTdZZ1hx?=
 =?utf-8?B?YWNPa2NqcTdRRjRrdVgwNW5JWDdwbWNyeEpQVHdIQW1rVUp2V2x3QXNGMkZD?=
 =?utf-8?B?NWptR1VGTEl2d29Rd3NtVGtSbGFiaWJUSHYxaHFsRUZtRFRwTnZWUXVmYWFa?=
 =?utf-8?B?VGNzbXE3cVZzcjVacFY0R0tjZnpTdHlzcTVwS2tBeWpxeEZDb1NMVDdhazcv?=
 =?utf-8?B?YVFmUlJvM3FieFMxR25uaEUvWmJWeUNQdzNDbXlqNndmeW5aNXJKdzNoNGd5?=
 =?utf-8?B?LzVzZTRxdlc4bElPL3kwMGIxb0QvZE8za1lxUGsxWHQ3aGZFeVpuUkwzbnBj?=
 =?utf-8?B?MWdPbW1IRFU4cHFqY1l1enlwVC9qQzRQYmYxcTBTcG8vTjd0VTU3dDd1L1gx?=
 =?utf-8?B?N1NvWkhZcGhYNnFNcElPdXZSb01BdUwyNHNUZkM4R3VER1ExZGgwbW10NEt0?=
 =?utf-8?B?RVdubEhZYUtXRUZrQlFiekI0NDJVRjVMb28rTGxXN1h2Tzh6MlhMbGhBSGZm?=
 =?utf-8?B?TkZnUFNIUlAwU0Jxa2JvaC9FUjRNWlFsNVROSmRxNUdNWDYzRWxFK0toemRC?=
 =?utf-8?B?N01YVlYwSEdXNVMvMUpGZFVIcDBSSG5QZENtZ2RENU9Gb1VEQkUvc3pSU1ZM?=
 =?utf-8?B?U3laeHRPSUJZZXdOeENNR0lTSkl3eEZzd3kxbnlybndPakV1VEV3MWlNeW1v?=
 =?utf-8?B?SUc0OER3RGxrVThjK0FVMzBRWkY2Yy9JODdRbm5rRVFncldtRU1oQUwwL3Fm?=
 =?utf-8?B?alV0Nlk3U0I4Yk9wSW41QngzSXBJdU1pQVpDZVA4UWxNUWhmZE41Q3NmQWFY?=
 =?utf-8?B?d1ZiVzNKM1E4aGc3VjhDQnlaeUwyOHdSWmhEOWdpMWdQQ0k2ODdoVkVZeXN3?=
 =?utf-8?B?aWVmZEpNaGdmS3JIYWhqcVRWeGkrcGx4WHJsZ0V1Sm1CUUNSYzNjYWZGWng4?=
 =?utf-8?B?WGtRQUIxenljeEpWOSsrajNpcG02NjNXdENvODZ1bmduc1F5VlZpQ3JnNEN6?=
 =?utf-8?B?cmRWOGVmM1MxYlpIM05zeUM1Q3BUTDBKMkpHc2s0WC9YSjNTZzhHalc4UUNk?=
 =?utf-8?B?enFVWXBFcE5jNVFnOWhCOUgvWm1PNndUVjlkNk9ubzVTelZJYlRqVTBSM0R4?=
 =?utf-8?B?alVLd2xmRlE1RjJYWm4xNDZrdkxscTZDTzEyVDVoV3p0ci85RTlTOUtzcDMx?=
 =?utf-8?B?UXR1TGNra0t6a1dTNUl6WXc0OXduYXJHTGVpb2FFOW84L0NnVE1Da2srdDVp?=
 =?utf-8?B?NVd4UDVrMUQ2VFQxUDJ0ejN3TmlNdkpqemVoVW00Y1IzU1ZZWEJtMXJCcUpC?=
 =?utf-8?B?UjkrTUk4Y01NQVRkMDczVkc0S2dQdkIzNXNYOGlxUDEwNGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzJaUDFlaVlJRjBEZnVValdnWUtqa0o0SjZJaVltYUcxZzBoS3NGMm5lV1FP?=
 =?utf-8?B?OTdNdFZRTnBpWjNWNVVkOGtKcG0wNHhGbFNpVU1zUm14YkZTemJZVmYySE1l?=
 =?utf-8?B?NE5zOXRUMUF6clp0SXluVUFHc1U3OXRWcE5oNEpZdUFXNS8ySHJsTGlSU1NC?=
 =?utf-8?B?SjhyVXJaWkh1TDdoaXIyVmtiaE51WVV3bWhkK09aeHZVTDlaZWN0VXdFeTV0?=
 =?utf-8?B?MGNGRXhoZTlwM2x5TUg1QTUzU0lwV2RTNTNzd3ZRT3l1RHlGUlZHWjJFaHhx?=
 =?utf-8?B?RVlKdmZiQnh5K2RsWmRmQzdnSytTRFBWeXc0aEk2dTRkclNiZ1JKdnZ1S0JW?=
 =?utf-8?B?Q09FenZtclV1MzRkUjUzTUZTYTNKUk1LYVlzaG9Cb0V6ZnZDSTdPNTEzMnho?=
 =?utf-8?B?MXJKTFJpU0tHQXFaajIyTTYybmVBWElZa3hzMnd4ZGhqb1o2SmxjcTR3L2lF?=
 =?utf-8?B?NUdoNjVtNXh0VUtTSUFkZTZOdmtsc2lLOENUSVdQVFFVazBxR0REcEd4aUl0?=
 =?utf-8?B?MHYrdGRIWlhkL2tZQUxzMEMvdU81eDM4VlN6TWRGSEx4S3VIV2NLWnA2MVFJ?=
 =?utf-8?B?STh1eDFaS04vUWZvTjV6NVhTdnIvYjNBZFFJYVduZ0VlZzZJWG4rWHdvSG43?=
 =?utf-8?B?bjRzRTJQVWVDZG9kQy9TclVQVXlFK3l0QW0zOWFGRDBUVGhGSWRuOFRXUEJW?=
 =?utf-8?B?cHp3UTBWTDFVYzFIVWNjOGJwT3lwT2xQTDRYT0FwT0JXUzRRL3kzanVxVW50?=
 =?utf-8?B?bmRzM1F1T1pGTVk3QTZjREpUSXBhcDc4cU1tWkZTWjUrUEVwMTkvVEppemgz?=
 =?utf-8?B?dHA1bFdBZjJwWlJUMkhqazJGTFNPbTB1N1ZuTWRLMnpoU3VnNXFqOEY1Z3ZE?=
 =?utf-8?B?bG9sUWczdGhQVGJESjFlYUtXc29iUXhpWmpXQzZiMGV1L21HMDMvUzBLVFlS?=
 =?utf-8?B?aTV5T3poajJONkkwbjhJTGNRUXpLeEY0ZnBMYmwzVUY4VWtJMW16V3ZjV1JX?=
 =?utf-8?B?WmtmcFFldVY3U3BBOEdjdHNZc2NzTUU5YzZZclJ6RHR6VXNKRnlIV2xOOTRk?=
 =?utf-8?B?dFpkZ0p1dmVFbTlGS0M2RlhnVENBRzZyek8xNWFDVUdyV2hxUVVzNFpXWnFh?=
 =?utf-8?B?TWs0R2o3N3N1bk1NZ255Q3JVUkRic2Q5MEFySXRqVFVaR2w1M1gyM3RndkJB?=
 =?utf-8?B?eDZ0ZEwydWdQbTk0bFd4N2I4MW1jeG50S0piSHZWNXQ0cWR0aThPQjZTQ0Zh?=
 =?utf-8?B?Y29GSEtrWW1PNE42WlhsODF3OWxrN3NjclBMQ2tYdHZPT0VRWnhFTEh3V0ZI?=
 =?utf-8?B?bmpYVWhDeHVScHdjbkdhYkpnQXZkTHQxeEVnVXJSUDlhYnMzRGNtclZJS3lB?=
 =?utf-8?B?RGx6S0RpbEM3RDI5bkFMcytRaXJKM3JBM2UzZy9aZGZkMGUzV2lQaENaQThj?=
 =?utf-8?B?eWZDOWZGZlI4a1lUYU54allOQTJlQ3FVVWlkNFdFQ1RYRGJyRzhObWdhUHd4?=
 =?utf-8?B?NXA1WmtDd0hqMzNxSHdLNWlPS1NpVkROMVBGNHQ2SCtiWUsxOXVEOERmR0tr?=
 =?utf-8?B?Tllqa0JvdWVFNXlvY29qakZoa0VicVo4SlI5N1BMWlNMYmhNdi9Fc01nZFNs?=
 =?utf-8?B?eTlNbXlCSWlOeE84cEhIQklmNzVpSGhqU3dPT3RRMTJMcUFXUmxGY2xSN2k5?=
 =?utf-8?B?L1ZHb1dFYWwyV3hZM1gweGNNNk8wV2dEcU5CQ3l5NWpSakxUOEh3cVZydjFy?=
 =?utf-8?B?aEZWckpKc1d4T2xHV3lFM21sUTNEeXNoRTRhZlM0ODQ5Y2U3bXhTdlcxdzBq?=
 =?utf-8?B?SmV1Q3VNbkpBRmdCY0hyMjRRNXZLc1RBRVF4RTU5ZW02YVN3NGRUWHY3d09r?=
 =?utf-8?B?akZraHQ4eko1VlBETlFJdjE1ZkVtN0gvWS9nNFZkaE9RNDZOSy90TXNHUFhT?=
 =?utf-8?B?ZDZocm9pcVFORVljK2d5bzdhdVMxVEpmSGo1RUVIem1DRGpMUVUrOWVRVi9M?=
 =?utf-8?B?OHRLeDV6NUd6d3FhQkJWdGtYRHB6TzVrdDAwUHFwQjR5MkcxK0FJRzJXa2tJ?=
 =?utf-8?B?RXhDTW9mb3M3NFVyMFVoM2t6TlN3WGtieXdkUUZCQnZWMUc2dHBQT0V1ZnZr?=
 =?utf-8?Q?UEMYucMbTn9HMdzsYSEo5QG/a?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <225FBC4EAEFFFC489D475AA26BA5AEF3@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: DAUCWaP80/f6fb3rAuteGjTPn5A3n9FpM1/CLkdGY7ZohVRGyl2kn3wt3gWv8jzQDg2eiGQvBJO05S8taUvFC0qUKXSKtuYoVmw2dIqtmOYlZnmobEnshj1NGyCudHnJ1OiTkIufVrQtKin4V2SMIZCsYFTflFGh9YUJ00mFdBaDTsLGv03UbR3wDDuGtgE/Y28AmpmBxoktD+QiYcnsrk9NOZmkT4YRZiwh6wV0Lg18SUAnqIXtWFRw/qwO8FTaq6+irpVs+5deMAnynIwHHv5DugUrhG/qYuOsBNxNE+uHSMfASYzAAfuC3nq6Ix6gXyvHNPrqgvpWx/Y7+ndL6Odb6+41Obf1rS3rG/UjMb7SmvhNNUgMiGgD5Fwu5nxe8W6CzBayo7/JAPr2bKFPFPf7AdCuhb016vJBNsPzAPVQpkwBJn25/oNfErD3DCFHZKROAHwBbvrcpxAcxoahXIvICqGYF7KGGJ1tvT3ZYbw3v58s3O/NJeCS8XzKj5VeRqlHf5QwGUuC1KsrUmET3RfPCZLHZ8e+0EAmncKynho863mBadNdKBmqM3nHpa5Ki+TdEj2GzyplBklsY20etiU3vPYfm6kuZtgxApUonpPUx+EeUSnqijemV8blVsuD
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8db5672-b8a4-4fda-b42b-08dca3ee4462
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2024 10:18:12.4173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TSlR1QxOCwFA8Fi674dEX1e5KmsBB8ruBHAuwpu5Ll39ditpgNqhB2Fx+4/IytjP8lklydXoA+po3ITt5TESgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB10244
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcyMDk1MjMyODpGUEtleTEucHJpdjpjVffgAdFECUVq7O83USx7MZhgi61FebK1QkNUwnDxOtinF4wkKN8VvYEl8mNLevtjaQSaNaXJ9rh5bbys3KArzWxtbcf8jxhq17+9aPOXsBO1gTshULwCnE3nuYzLwhbEntFKrZqhk1gqxxrbRBvfDpKusyooImkfRzeOgqDyrfgmxdMohdhF7fl0L8xoDJ09z+l4paKLq21IWuTC8VQQDkD73p2Nfx+O/z/gcoUfGlXCYVtF7nuadfEvEoX9ZXoDgs50HARGyJfJAJLlgkwKWW7vqzEsMEnKTBQ44VdUtHj49dSU67elekGY0HIcNvLhrd5f3K1qt05C6rH/hXZf
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.66.1.125
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

T24gNy8xMi8yNCAxNjowOCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOg0KPiBbWW91IGRvbid0IG9m
dGVuIGdldCBlbWFpbCBmcm9tIGpnZ0B6aWVwZS5jYS4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0
YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+
IA0KPiBPbiBGcmksIEp1biAyOCwgMjAyNCBhdCAxMDoyNDozMkFNICswMDAwLCBPbWVyIFNocGln
ZWxtYW4gd3JvdGU6DQo+IA0KPj4gV2UgbmVlZCB0aGUgY29yZSBkcml2ZXIgdG8gYWNjZXNzIHRo
ZSBJQiBkcml2ZXIgKGFuZCB0byB0aGUgRVRIIGRyaXZlciBhcw0KPj4gd2VsbCkuIEFzIHlvdSB3
cm90ZSwgd2UgY2FuJ3QgdXNlIGV4cG9ydGVkIHN5bWJvbHMgZnJvbSBvdXIgSUIgZHJpdmVyIG5v
cg0KPj4gcmVseSBvbiBmdW5jdGlvbiBwb2ludGVycywgYnV0IHdoYXQgYWJvdXQgcHJvdmlkaW5n
IHRoZSBjb3JlIGRyaXZlciBhbiBvcHMNCj4+IHN0cnVjdHVyZT8gbWVhbmluZyBleHBvcnRpbmcg
YSByZWdpc3RlciBmdW5jdGlvbiBmcm9tIHRoZSBjb3JlIGRyaXZlciB0aGF0DQo+PiBzaG91bGQg
YmUgY2FsbGVkIGJ5IHRoZSBJQiBkcml2ZXIgZHVyaW5nIGF1eGlsaWFyeSBkZXZpY2UgcHJvYmUu
DQo+PiBTb21ldGhpbmcgbGlrZToNCj4+DQo+PiBpbnQgaGJsX2NuX3JlZ2lzdGVyX2liX2F1eF9k
ZXYoc3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgKmFkZXYsDQo+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBoYmxfaWJfb3BzICpvcHMpDQo+PiB7DQo+PiAuLi4NCj4+IH0NCj4+
IEVYUE9SVF9TWU1CT0woaGJsX2NuX3JlZ2lzdGVyX2liX2F1eF9kZXYpOw0KPiANCj4gRGVmaW5h
dGVseSBkbyBub3QgZG8gc29tZSBraW5kIG9mIGRvdWJsZS1yZWdpc3RlciBsaWtlIHRoaXMuDQo+
IA0KPiBUaGUgYXV4aWxpYXJ5X2RldmljZSBzY2hlbWUgY2FuIGFscmVhZHkgYmUgZXh0ZW5kZWQg
dG8gcHJvdmlkZSBvcHMgZm9yDQo+IGVhY2ggc3ViIGRldmljZS4NCj4gDQo+IExpa2UNCj4gDQo+
IHN0cnVjdCBoYWJhbmFfZHJpdmVyIHsNCj4gICAgc3RydWN0IGF1eGlsaWFyeV9kcml2ZXIgYmFz
ZTsNCj4gICAgY29uc3Qgc3RydWN0IGhhYmFuYV9vcHMgKm9wczsNCj4gfTsNCj4gDQo+IElmIHRo
ZSBvcHMgYXJlIGp1c3RpZmllZCBvciBub3QgaXMgYSBkaWZmZXJlbnQgcXVlc3Rpb24uDQo+IA0K
DQpXZWxsLCBJIHN1Z2dlc3RlZCB0aGlzIGRvdWJsZS1yZWdpc3RlciBvcHRpb24gYmVjYXVzZSBJ
IGdvdCBhIGNvbW1lbnQgdGhhdA0KdGhlIGRlc2lnbiBwYXR0ZXJuIG9mIGVtYmVkZGVkIG9wcyBz
dHJ1Y3R1cmUgc2hvdWxkbid0IGJlIHVzZWQuDQpTbyBJJ20gY29uZnVzZWQgbm93Li4uDQoNCj4+
IG1vZHVsZSByZWZlcmVuY2UgY291bnRlci4gQnV0IHdlIGFsc28gZ2V0IHRoZSBhYmlsaXR5IHRv
IGFjY2VzcyB0aGUgSUINCj4+IGRyaXZlciBmcm9tIHRoZSBjb3JlIGRyaXZlciAodG8gcmVwb3J0
IGEgSFcgZXJyb3IgZm9yIGV4YW1wbGUpLg0KPiANCj4gUmVwb3J0IGEgSFcgZXJyb3Igc2VlbXMg
cmVhc29uYWJsZSB0byBtZQ0KPiANCj4gT3RoZXIgZHJpdmVyIGhhdmUgdXNlZCBub3RpZmllciBj
aGFpbnMgZm9yIHRoaXMga2luZCBvZiBzdHVmZiB0aG91Z2guDQo+IA0KPiBKYXNvbg0KDQpJJ2xs
IGxvb2sgaW50byB0aGUgb3B0aW9uIG9mIHVzaW5nIG5vdGlmaWVyIGNoYWlucyBpbiB0aGlzIGNh
c2UsIGFsdGhvdWdoDQphcyBJIHNhdyBpdCwgdGhlIG5vdGlmaWVyIGNoYWlucyBhcmUgbW9yZSBz
dWl0YWJsZSBmb3IgYnJvYWRjYXN0IHVwZGF0ZXMNCndoZXJlIHRoZSB1cGRhdGVyIGlzIG5vdCBu
ZWNlc3NhcmlseSBhd2FyZSBvZiB0aGUgaWRlbnRpdHkgbm9yIHRoZSBudW1iZXINCm9mIHRoZSBz
dWJzY3JpYmVycy4gSXQgbG9va3Mga2luZCBvZiBvdmVya2lsbCBmb3Igb3VyIGVycm9yIHJlcG9y
dGluZyBjYXNlDQp3aGljaCBpcyBzaW1wbGVyLg0K
