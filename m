Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D82490FC37
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 07:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B1710E02E;
	Thu, 20 Jun 2024 05:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="C7hLEIQp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F61E10E02E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 05:38:21 +0000 (UTC)
Received: from rly12b.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly12b.srv.mailcontrol.com (MailControl) with ESMTP id 45K5c1SW072492;
 Thu, 20 Jun 2024 06:38:01 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly12b.srv.mailcontrol.com (MailControl) id 45K5bUq4069052;
 Thu, 20 Jun 2024 06:37:30 +0100
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by rly12b-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45K5bQ6N068717
 (TLS bits=256 verify=OK); Thu, 20 Jun 2024 06:37:30 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EoaEDShKoZWaLrr6MdAFWNE4b4GEeGIZMNe9m/yL9YQsICm4N7Gnrb9BvwSs8JMom0Tp4YnH4cL+wFaOhgyRU4+hzyqByVtazggfYD84jSx687/20MoaYrBRadwOyJn/vjTFnZwauXTjeI3tkhioCCnChXvVam8wm6cLyYbuj/XQ0Buxb3D6gA8UxrXtXWHvRewpeCGwVd1lqkRQvsFsM1W9yNHUEQ96DxEpZvotdmZj59M3oqOfYO6mlsKtjmUZdkF1V9ehF4Z224mMxP8kjT65TC4I+pkx8EAJvF3PPkfVvo15/e2hqt8K4VcJiZlTU51A/gYoSfrIlOp0qwjlUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZp8GsIWmqrqkwBWUKG5J83MyW111BgUzA4SkrATAWo=;
 b=YV5R9DzB5DAiXPP44Lpp4suJwZ+C6E2wHJGTZgoAkNlqXUKdfh2wZnnSltKZxUfIM/BPCPdNuML1mmXkRD3O333od/Y9EfaAtQs9/PKxq3VlN1B9udJ5pV4IdivhaeEvzy9LiqxHDDreGVTupyFgfaNSjjwLUUXApqxgAYBIz7GwrldI7oeGIAWBAx1b5CrLTBOzhe1Ahm2oc8QRtAm3OYeuPp/Ej1IYooYWENZ4PDnviK4S3To7cVF8f9EnMTvn5oRtSccCl4uJwgbWe8jRtNSvGBPS+uteIlRonUiyufTsUC4zxGUAXQxR21c0vlsxFdKimoJGb5VWRMWAZJa36A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZp8GsIWmqrqkwBWUKG5J83MyW111BgUzA4SkrATAWo=;
 b=C7hLEIQpNx9p7B/aYHD+tAddU8rt8soZ8IClht+qib32WOB/B6w0XGVFpFMFb6AQQNUhKfzVv/q/HjiRiNgmdgq7fkgXte3WofSfgpHR4R7Qq25hUZrQ/Oz2siZRAqXR5aNu+bM7L1eSgclHtQ/74jN27rm/XQfzdKJzc/wytrIZkhVMVgEyJG6wT2wIYKEtDSz96yYdOm9dcb82KH45pQ24sedr4SayIMTUEJkovhn/55dHMtE7q0ibOl+5mxN+XQXvcRY0fTXLt/K5QNJ8phf0C8akuk8O+5LSck5/O4AE4qa9vHA6pCeoQQYQahGEXMBELTHts1HDP7XsK11HKg==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by DBBPR02MB10484.eurprd02.prod.outlook.com (2603:10a6:10:536::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 05:37:24 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 05:37:24 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Jiri Pirko <jiri@resnulli.us>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 00/15] Introduce HabanaLabs network drivers
Thread-Topic: [PATCH 00/15] Introduce HabanaLabs network drivers
Thread-Index: AQHavWrOHdFR+8fSVk+C2dO8fV1D97HPUfIAgADbEoA=
Date: Thu, 20 Jun 2024 05:37:24 +0000
Message-ID: <51444704-76fb-4755-9382-79900bcfa6fc@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <ZnMITvpbjHR3cHGY@nanopsycho.orion>
In-Reply-To: <ZnMITvpbjHR3cHGY@nanopsycho.orion>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|DBBPR02MB10484:EE_
x-ms-office365-filtering-correlation-id: 34d3cf03-10a5-438b-f23a-08dc90eb103f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|1800799021|366013|41320700010|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?VDg0Ky9COG95enRTSjRIS0QzSXV3bWgwOVRNak4ybjFEWUpOMlE1SmkrNUhM?=
 =?utf-8?B?UUpENHE2UURyUER1UWp5aDArVjBld3lGOElTNUROeXBRQVRYMTlJZWVJVVRS?=
 =?utf-8?B?Y3UzOTB2MndzTTNSQUhLQXd2TGVoWnp2ZXdDRUI0amQ1a3FINy9SbDJKN3hI?=
 =?utf-8?B?aS83YndlNTd4ek5JMjFQWkQrMTc3TEpWaGRkeTFNMTNCeHR2L25Ga2V5OGk2?=
 =?utf-8?B?d094YnY2K2FQTmhuQkRhUnlZZEtRVUV1Zmhyb1o0VVRBYTV4V1lLNmxMWmhT?=
 =?utf-8?B?L0dyUCs5SWRLOXNubTJyS2pKdW5iWWo3eHBBTjA1YURCc2dwOHNKOFExdVN5?=
 =?utf-8?B?TW1yS2FEQVp4RTJ2aG5WUlp1TEpTL21wVGtvUjZIbEN0aHp2dDdHZ25MWjlv?=
 =?utf-8?B?REppOElqb2VlbE5GWTQwNWhiRmpxdGVycUpKQWNSb0JKZ0JCeXVyWTdUZUJx?=
 =?utf-8?B?ZkRCT1hucTA2WlFXN1A2bStQRHFwWTFJMytlK1RMcE1RTE5paTdKaWpRNmEw?=
 =?utf-8?B?UURGdnN4ZnAyOGlVdm85cFlGWjMyLy85RkVubmlndFBXM3NIMGRqU2w3TWNz?=
 =?utf-8?B?bHpaZnIrUTZJUHNSSGIrWS8xQ1ZwNWU2YVFnUE5kVUZlRDMybUwweW9ZcWpa?=
 =?utf-8?B?ZUdmTDUxV3ZpZ3JrdDc5NDVjbFNyNEx4MEZ3cVNFR2hOOFAxUFFEZGVpZW9W?=
 =?utf-8?B?SHFLbWhZc2E3aG5MVWZUT3pVQUlLcnhEUitIR2FPZSs0dTk2ZDVxN29lMWpS?=
 =?utf-8?B?WXI5NEE1dGNkVjVweGtDSjg0RDBsNWN2RmNmMmF4eGVsVHhwYXBETGljaDM1?=
 =?utf-8?B?Ykdxalhnd1FWUW1SRkF4SFNYUEtkcHBvR1lhOW52WHVuc2ZmRklYYUNkT1RL?=
 =?utf-8?B?YmJJMmZmYlEvV2Jva0hid3FUdThpb3dxc0t5VHAxdU9qNTJDVk02Qlo2Skt4?=
 =?utf-8?B?R2JHamMwZG5abXZDOE5YNUVWbmdEL2FEYlI4ZSs0TGtYQ2w0ZW9KMjBZeDhQ?=
 =?utf-8?B?K2wrcmZLbGcxUXBxL3k0bkRBdWQvMDhyMFlJb1VJektacHBYNlU5bVkyTjRN?=
 =?utf-8?B?ZUFxRWhpYkcyVUNDUy9aOEQvLzEyUFVDaGIremVrYXdjQUFyZXA4QnJDYWtX?=
 =?utf-8?B?c3I0Wm1lWUFMWUZLM0E4UG8xcGZwQ1J3dVJ1bzR5ajNYK2luY09pb08rWTFB?=
 =?utf-8?B?bFNpWGwvaitYNENWdjVuVk1RSGI2N2pJQVBCcUcvTVNtY0hMRWNaZTR4QmxY?=
 =?utf-8?B?K21TTFhRemFYSzc4bTZUUTJySmFBSythYTBlekcyRFZvQk14ZkdWNHltdXZR?=
 =?utf-8?B?SmM3eXFHREs3ZktoM1ZXenVMMS8vem5KUEJUdlVUMUlZUnhoTWpqY2UvdDZH?=
 =?utf-8?B?S0Z1aHdBNEIzZVIvVVZ6VkZZNHZ6R0xSRXc5S1NydmNSSTFXdU5BVThROG1i?=
 =?utf-8?B?c2NSYmxPb2lRcVJ0QVB6L2tmNXFBLzc0ZU5GUDRja1Q5WWRZZmY0R0NPMUpO?=
 =?utf-8?B?anYwS2dCQ3FrUG5qUEQ2dzI5RGczVEYyUVhJdjBWZXFRNUlGSFNHOTY1ZGt2?=
 =?utf-8?B?dmNlcVFFa3pETnBUdHQ5c28vRUxQZWR0c1doSjRncVQvRnVORkg2TDVlMzZi?=
 =?utf-8?B?WitBMDhtYnBkWVB3YkF5NTlPYkZKa2pIYm0rU0diaTRMbFdNQUEzaThRaGRX?=
 =?utf-8?B?VklxVWJUYjc0dXRxYk83SUJTODRDVi85NUV6L3d4R1JLTFg1a1R6K3VpMHV3?=
 =?utf-8?B?MC9XTlRzeHRWbGZkWFFXb1pLeXVYTmJFWlI0a0NVblkzYU90bFNGaFptNXEw?=
 =?utf-8?Q?BroAP/4laJw437FMhIqchtcoYUuLx96boALsg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(41320700010)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1F5bFovd1IrdEE4MVRqdnNTMVphNjV3c0hsRFdDTDEwS2tOTmZRamdhb2s3?=
 =?utf-8?B?NTAxY2x3dDQ3V0VEdFhLeGpDaEZZc0dXMG4zQlgvVFg3SS9ad3Q0U2dYaFpB?=
 =?utf-8?B?dFZNelF6cDE3R1lwb2VnWXQ3NlNTTkVhdnVJbU8vRCtRK0RTTlhLTzZJczdl?=
 =?utf-8?B?V3I3UGE4dGQ0OHoyYkUyVVJLeW5PaC8vZklGU2lwdGRTSnp6U0JVbC9WZ21j?=
 =?utf-8?B?bFJQWGx1c1AvTGNuTWM2bHUvR0Y4aGxYd29jYk5rVVdvTzBxSFZBNkhqVEdo?=
 =?utf-8?B?YU9vd3lkWUZlbHUrdEd5MTNZNzdzM1JzZnZNdkF1UXNleUJlRDdKNVV1enh2?=
 =?utf-8?B?ZlIvV1p0RmpRSVdtV0dMbnVjU2JWNnlHa1h2T0JvOEl6YUE4SWc2VXhzUWM1?=
 =?utf-8?B?WDMzSGxoVWUwRWVnbzhYeENsY0I3RWpLOWoxRjk1bjZHZXVzQnJ6dk83TDRK?=
 =?utf-8?B?MVM4TncyL21xLy8wbUhmNDBscklYa3E0MFZsM1ZySTZuNDhWVmNoY2VBeUdQ?=
 =?utf-8?B?bjM3a29PU1p4dnNwOWdUYjdOOVFwNTBtMXNlVW9LQ0Y2OEFMYzh5Qm1OYWl3?=
 =?utf-8?B?VWhQQVdJakxwN2ZNZ0NyRTF4Tmp1ODAyQTFqbGZJdmh5RXdJMHhmS3d6OHBS?=
 =?utf-8?B?Y3VuMmxBekNkSlREL3NLbnlxLzRWZXIvUTZqRkx2RkFYQ05QS0laRHVKR0VK?=
 =?utf-8?B?RWlKeGNNS1lZamRDQXdTaDMrUVVVRU1YeEkyczAzaHVJY1V0U0hOKzNEdFNY?=
 =?utf-8?B?TWdBdk9iTzJ0NG9BSktUdHBzbzhYR3Z2SllUeDVTK2dlTDhpWVU5c1RGTWY1?=
 =?utf-8?B?WTJ2dTloSzJpTytWQ2pMQ3luNlIrQVQ3QTlqNitzMERZYVdxMmVPV3N1ZFZ0?=
 =?utf-8?B?ZVJqWE51ZDFmeGkzS0M2VU1rc2ZkbVl6TjVKdVB5dGEvclJqMzZ6dTVkaENo?=
 =?utf-8?B?VGo1cFRib2VkT0txUnRWdDQzVHNkVlZmSWRTYXgyY3lrY3g4ZWJVQ0ZuNU12?=
 =?utf-8?B?SW5aWFdtaG1TNU0reVlvZDZyMFlXdkptdzgycFpFakdCSUNDbG9jditVMU1V?=
 =?utf-8?B?dHlQNjN6OWFFd3BrVWxpSGVvUW9qZGR4WEhwcXBERk1FNjNodnNOLzkxTmRQ?=
 =?utf-8?B?N2RoWFk5d2wvOUNMQURxNHBYeVVxeENxOU9RZHdSMC9tQXVMcVdDcnZhRzZu?=
 =?utf-8?B?azBWVDNRU0FURnJmeDIrMk5HSW44MHZiS2ZuZkhIZCtTY0U0Z1NYNnBzdXNU?=
 =?utf-8?B?bm1OY04rRTJ6ZjhuZW1wODZQZXRtK25GMDBVQXM1ZnBQZ1NJUEhqcm5kZlNo?=
 =?utf-8?B?Smc3MkJKZXF3SUNXNGlrU3JSZ3pFZDg2OHRqZUlFdlN0bUs1RTJ0M0lGMzBR?=
 =?utf-8?B?eHhEM25kMXB6ZHpSenlCWHBrK0ZTREdsV1J3Y1VHU1FVbU82Q01vb1JlUnlt?=
 =?utf-8?B?c3pGNDJ0SmwzNEppUnd4YXJzRUhhZWorSTdoRGowVHZJM29ESlFwei9senA2?=
 =?utf-8?B?VnI3alJSWkhRaUVGdmxsNFV3cXVCc1pScGFWMUhFYU5uREE5ai9meXBqeHUr?=
 =?utf-8?B?bUozeXE2clRvNlNWWGVGRkNzaHIrMnhHalJrcnhTd0EvNG9xRmhTbkVUSkh6?=
 =?utf-8?B?ZFcrUk5xdUZ5c3RxVER1a0FtRjVoZnBQMk8wMWx2TmtwMDczeERMeXRuRW5t?=
 =?utf-8?B?SGI5d3A1ZGRmRWh0RE5sZWhyN1FpUkFWUnkyT2lVVzN6SWJWUGV0cEpGMFIw?=
 =?utf-8?B?K3E1SVZ1TmJ1N2E4THUxY2dUVkd2MHRNcG4zN2plWFQxSTAxa1dRMk1wdjNy?=
 =?utf-8?B?K2g2QzNoUnRWWVg1dkdWU2hHRzZaQVVGZmZvVG92c0VWV0RXTFBrMGxPWEJJ?=
 =?utf-8?B?TWs2VEFvRS8vMXA4MTk3bGNhSEo3VFVSb1BiR0R1alR0V1ZzWU1JelRGTVN4?=
 =?utf-8?B?QmZSR2hWWHVndUJJY211cEFWdUpzbytxWDd5azFMa01raExnRjJiMFNpaHFr?=
 =?utf-8?B?cUdjQmxVaXJNaW1ObXFtS1hYamM3WDFROHp6M0FPdjJ6cFQ1bnU4alhpUG1r?=
 =?utf-8?B?YUpKUE82YkZwMUJpaHpuSzFaUkpEcDNuMzRicUprSGVpdno2aXg2VTNuVFZY?=
 =?utf-8?Q?yi23hQ/UKiwb6IXdTwB/M9iNy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E305D0FE866A548B6F5B858D8B5E75F@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +5JzyQ7PRq4/CZRSDHj1Nzx3+3KI16czX+3fMlv0IQwtvQsKH515gpeTemh6LBj9d262DQxSCOEhMWw6GV6hcDyablx7Nzw17/5IZeGOrmwTO/8PGodezvPKEvAYTXkIaxPVGTKRXzeq8cWgPsM+wQWrDKN9H3VXzjcyg6yZZxS8piAiTFDhzmtjiBt4JVmRAO8+4se5yJCTynYHN9vYoq//9TvqVQn1H1lTCnFF2DWz9O+9iTs4dPN06H2HtNqUA/t/wJZR0WRkqSxeNXe+3+0iUJoj7uBHVZIAx69L9Fmy9E5SDJuUuJGD4/xyNIa9IKC8nLEjZ4WFV1e0U4vNWgJ8Erw76fofhHsi1/4iXuRL9qkOUSJo+28kKySQMcwUx/7VsOMgozqKZE3cyaFbP4Bsr93aqVpuxBWPFosklQYm73zRLbB2bQwQ+OYtZYPBynBafm50ONPSG41Q/rUQRpy7BDHnHz8cEYd2YouUdR7zG6MsjAfy/d3MDkR3+saeMjNhO+L91oKfM07lq/JXo/aXC3aXCjZHrTDdrGHNzd/UQ5BVwezyOV2eTNW+wu597jrdXvBzc1D4sy7KXqwg3U28tON2fgEM+RKFNl0hq82t2dXhD5gnv9Tg0qGvhk9r
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d3cf03-10a5-438b-f23a-08dc90eb103f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 05:37:24.3812 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7IscZc5F1TDDr3ku6j2ZooDkn1Am5oIlYoNjM6gDFG31i0HvfzqymleORJNYSaSrvYkc/8xsVkFSBE0+a+j0tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10484
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxODg2MTg4MzpGUEtleTEucHJpdjrYXyK5JBkcor6MEP+i1C5o9GdhelwgieUH4fud7G3CX3vfOdWIyTC6UEIuCCV6rRrr2QClsd8QeP/i6Uh7WGOKldBbJSEZBzDn5DBNiXTlbdbzw65O1GYlpMyecP67Md4YcnQHNHHUbjhJpgVv6+eD7M5ZZ05E/WTlUN7I8+u8kMVPeHYHbqLO6HMcCAij9Y1b0mgqHRh1oxN3x7S8AmDM19BNWK3iSl6r953Xr6KFDU/BF5dbACh8qonaZArJtfNmyOtryWjfOpViNwhx/l6QjGt1PdfJeivCBptyR8VS+EvCYw9hHFVIqSYsrZoxNe+6gbpaQP+NmyZey7HK6uVJ
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.66.1.122
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

T24gNi8xOS8yNCAxOTozMywgSmlyaSBQaXJrbyB3cm90ZToNCj4gW1lvdSBkb24ndCBvZnRlbiBn
ZXQgZW1haWwgZnJvbSBqaXJpQHJlc251bGxpLnVzLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRh
bnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4g
DQo+IFRodSwgSnVuIDEzLCAyMDI0IGF0IDEwOjIxOjUzQU0gQ0VTVCwgb3NocGlnZWxtYW5AaGFi
YW5hLmFpIHdyb3RlOg0KPj4gVGhpcyBwYXRjaCBzZXQgaW1wbGVtZW50cyB0aGUgSGFiYW5hTGFi
cyBuZXR3b3JrIGRyaXZlcnMgZm9yIEdhdWRpMiBBU0lDDQo+PiB3aGljaCBpcyBkZXNpZ25lZCBm
b3Igc2NhbGluZyBvZiBBSSBuZXVyYWwgbmV0d29ya3MgdHJhaW5pbmcuDQo+PiBUaGUgcGF0Y2gg
c2V0IGluY2x1ZGVzIHRoZSBjb21tb24gY29kZSB3aGljaCBpcyBzaGFyZWQgYnkgYWxsIEdhdWRp
IEFTSUNzDQo+PiBhbmQgdGhlIEdhdWRpMiBBU0lDIHNwZWNpZmljIGNvZGUuIE5ld2VyIEFTSUNz
IGNvZGUgd2lsbCBiZSBmb2xsb3dlZC4NCj4+IEFsbCBvZiB0aGVzZSBuZXR3b3JrIGRyaXZlcnMg
YXJlIG1vZGVsZWQgYXMgYW4gYXV4aWxpYXJ5IGRldmljZXMgdG8gdGhlDQo+PiBwYXJlbnQgZHJp
dmVyLg0KPj4NCj4+IFRoZSBuZXdseSBhZGRlZCBkcml2ZXJzIGFyZSBDb3JlIE5ldHdvcmsgKENO
KSwgRXRoZXJuZXQgYW5kIEluZmluaUJhbmQuDQo+PiBBbGwgb2YgdGhlc2UgZHJpdmVycyBhcmUg
YmFzZWQgb24gdGhlIGV4aXN0aW5nIGhhYmFuYWxhYnMgZHJpdmVyIHdoaWNoDQo+PiBzZXJ2ZXMg
YXMgdGhlIGNvbXB1dGUgZHJpdmVyIGFuZCB0aGUgZW50aXJlIHBsYXRmb3JtLg0KPj4gVGhlIGhh
YmFuYWxhYnMgZHJpdmVyIHByb2JlcyB0aGUgbmV0d29yayBkcml2ZXJzIHdoaWNoIGNvbmZpZ3Vy
ZSB0aGUNCj4+IHJlbGV2YW50IE5JQyBIVyBvZiB0aGUgZGV2aWNlLiBJbiBhZGRpdGlvbiwgaXQg
Y29udGludW91c2x5IGNvbW11bmljYXRlcw0KPj4gd2l0aCB0aGUgQ04gZHJpdmVyIGZvciBwcm92
aWRpbmcgc29tZSBzZXJ2aWNlcyB3aGljaCBhcmUgbm90IE5JQyBzcGVjaWZpYw0KPj4gZS5nLiBQ
Q0ksIE1NVSwgRlcgY29tbXVuaWNhdGlvbiBldGMuDQo+Pg0KPj4gU2VlIHRoZSBkcml2ZXJzIHNj
aGVtZSBhdDoNCj4+IERvY3VtZW50YXRpb24vbmV0d29ya2luZy9kZXZpY2VfZHJpdmVycy9ldGhl
cm5ldC9pbnRlbC9oYmwucnN0DQo+Pg0KPj4gVGhlIENOIGRyaXZlciBpcyBib3RoIGEgcGFyZW50
IGFuZCBhIHNvbiBkcml2ZXIuIEl0IHNlcnZlcyBhcyB0aGUgY29tbW9uDQo+PiBsYXllciBvZiBt
YW55IHNoYXJlZCBvcGVyYXRpb25zIHRoYXQgYXJlIHJlcXVpcmVkIGJ5IGJvdGggRU4gYW5kIElC
DQo+PiBkcml2ZXJzLg0KPj4NCj4+IFRoZSBHYXVkaTIgTklDIEhXIGlzIGNvbXBvc2VkIG9mIDQ4
IHBoeXNpY2FsIGxhbmVzLCA1NkdicHMgZWFjaC4gRWFjaCBwYWlyDQo+PiBvZiBsYW5lcyByZXBy
ZXNlbnQgYSAxMDBHYnBzIGxvZ2ljYWwgcG9ydC4NCj4gDQo+IFdoYXQgZG8geW91IG1lYW4gYnkg
ImxvZ2ljYWwgcG9ydCI/IElzIGl0IGEgc2VwYXJhdGUgbmV0ZGV2aWNlLiBTbyB5b3UNCj4gaGF2
ZSAyNCBuZXRkZXZpY2VzIHZpc2libGUgb24gdGhlIHN5c3RlbT8gSG93IHRoZSBwaHlzaWNhbCBw
b3J0L3BvcnRzDQo+IGxvb2sgbGlrZT8gSG93IGRvIHlvdSBtb2RlbCB0aGF0IGluIGRldmxpbms/
IERvIHlvdSBzdXBwb3J0IHBvcnQNCj4gc3BsaXR0aW5nPw0KPiANCg0KSSBmaXJzdCBkZXNjcmli
ZWQgb3VyIEhXLiBJdCBpcyBjb21wb3NlZCBvZiA0OCBwaHlzaWNhbCBsYW5lcy4gQnV0IGVhY2gN
Cm5ldGRldmljZSAobWVhbmluZyBhICJsb2dpY2FsIHBvcnQiKSBpcyBtYXBwZWQgdG8gYSBwYWly
IG9mIHRoZXNlLCBzbyB3ZQ0KZW5kIHVwIHdpdGggMjQgbmV0ZGV2aWNlcyB2aXNpYmxlIG9uIHRo
ZSBzeXN0ZW0uDQpUZWNobmljYWxseSB3ZSBjb3VsZCB3b3JrIGluIGEgbW9kZSB3aGVyZSB3ZSBo
YXZlIDQ4IG5ldGRldmljZXMgdmlzaWJsZSBvbg0KdGhlIHN5c3RlbSBhbmQgZWFjaCBuZXRkZXZp
Y2UgaXMgbWFwcGVkIHRvIGEgc2luZ2xlIHBoeXNpY2FsIGxhbmUsIGJ1dCB3ZQ0KaGF2ZSBubyB1
c2UgY2FzZSBmb3IgdGhhdC4NCldlIGFyZSBub3QgaW50ZXJhZ3RlZCB0byBkZXZsaW5rLCB3ZSBk
aWRuJ3QgZmluZCBhIG5lZWQgZm9yIHRoYXQgaW4gb3VyDQp1c2UgY2FzZXMuDQo=
