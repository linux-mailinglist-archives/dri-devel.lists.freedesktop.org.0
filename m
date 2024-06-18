Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04F790DD64
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DA210E7C8;
	Tue, 18 Jun 2024 20:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="L86Z7Wqa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E6F10E778
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 19:37:54 +0000 (UTC)
Received: from rly05d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly05d.srv.mailcontrol.com (MailControl) with ESMTP id 45IJbib1455892;
 Tue, 18 Jun 2024 20:37:44 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly05d.srv.mailcontrol.com (MailControl) id 45IJbfIR455582;
 Tue, 18 Jun 2024 20:37:41 +0100
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02lp2040.outbound.protection.outlook.com [104.47.11.40])
 by rly05d-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45IJbcHO455300
 (TLS bits=256 verify=OK); Tue, 18 Jun 2024 20:37:41 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXuNjjqRdarPMivbVS+x49JTml7pDaJg+Qy1TYuNYNp+4WcUe7H0ILQbi2Tl0vKJuXMxt6zCG2Y4kUzsnqsvlTrG7Z0rOeQWMbNwCvfSkV12Jr+HSiWILn3LJxz7sJxd4ssVpnlqRCw7BcO7JfHMpclE9DTSz/SnTolVvP5G9apHZmDijS+WIxHU859zQK3xl6fI21tDvNsJXVUXf0Pi/m0VXIOerCgdUe6h+/dGv8LnCzuS1AAqdZholf9iqcKKlb+QkdFgRfHAX+zCk3K7VGvbvJ8jGnKpazn7odwNt6/200nGsyxz40Bf/TQ8147O8JSPyxyW4I1P22FfDrandQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMb5bUHHVoHaYZxfjZSvGeaZFoMZ6pAVdvVtHBhOy9I=;
 b=JAtkrGOteykkUgk9bdmGKsu6uV9zohpVNKMzcCicr5AmjwvI64+B/EL0MSsRzv07c0E7iZHj90JWXg383JzhfM3+2lEE0dXsvOygdepbKoc4s/tKwBFV2zUuwjW7xSZyv6WWwmCuBvz1Ok+soF6N3sFG4cjp2di51aBSzSFiNY05Bq7ozNUZEv9it5uffkzffL6q2EqnauY4ybPyOvPnmf46tKmC/faNInVo8Z2Ys0RBTKGN23zzdz5aWUxvvoCQqmXU8+JG/DyzE+bKlnd1k7WxEE7WHRcPCT6yYBIPy2KPANJ3VAVSDoC7IfSuosS8TsFy+CT1DpDoZmtw7920cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMb5bUHHVoHaYZxfjZSvGeaZFoMZ6pAVdvVtHBhOy9I=;
 b=L86Z7WqaBvnOqVsaIZL/CxR2pJ8gryzAZOUEZO4WlDQaX2rN4Rz8CfFVnssgeTn6ctBAtaYgu+QEU/kCCrOFLOzH7htzrKlr/Kp1i1YIS+TeOQFJtdn5YpLHfFrwfz6J06m5Mt7Sm12RyaoxY5yREUl7h/xDEMaeR5W7GDEcjv6wy7z1v5DtBMzlSyUs71lTyhUrmUtSDPU7ZncAvGhssmkOZ8X5BSvTKWw2zjHkEbNuTK6+NQgdqWpdZabI49be+qoYo5mPkvj7GYZhag2qYkO/o6FFPmhun3dYOGpBCGxN5VVi0B12aqe3NtmnV0cfyPVdGIv7qxxH3fpc+Twedg==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by AM7PR02MB6258.eurprd02.prod.outlook.com (2603:10a6:20b:1b8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 19:37:36 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 19:37:36 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Joe Damato <jdamato@fastly.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Thread-Topic: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Thread-Index: AQHavWrQgrJbi1vMQEmkq/v8mH9idrHH3y6AgAYT7IA=
Date: Tue, 18 Jun 2024 19:37:36 +0000
Message-ID: <16369c7d-af15-4959-9e84-8a495b6b5035@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
 <ZmzIy3c0j8ubspIM@LQ3V64L9R2>
In-Reply-To: <ZmzIy3c0j8ubspIM@LQ3V64L9R2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|AM7PR02MB6258:EE_
x-ms-office365-filtering-correlation-id: b8bb9f3f-96de-480b-604f-08dc8fce1b77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|1800799021|41320700010|366013|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?dVdvSXczMVZwYkNPZGpBdXdlS043Zm9CMzl2d3UyT1ZZNVI5ODZndHR4L2J2?=
 =?utf-8?B?KzVmREY4anhINE9IOTFBRVpVUE9CRW0rUTNLZjRGMlRzUW1IL0NJUWlieHho?=
 =?utf-8?B?OGJLVkVrSnhBR1Y2SVRRUHgzOGoxMlhvV3UxZDBseWJwMmhyZWZkRGVEV1NB?=
 =?utf-8?B?SDdnRXppb01FYVJaMktHaWtLZGhsQmZROTczN3JaUm5reVVraHJyWlJpWkZ6?=
 =?utf-8?B?Y0JCTjRKYVpOVDA0bDJnTUw5TE13V2t2TFFOUUp3WlNPVTMrYkxQRzlYLzhY?=
 =?utf-8?B?ZVc0RHE0OGR0dFh3Vk5OYnNDQzVMcEFZa1NrOXB1elJBbWJHRUtiNVdyNmg0?=
 =?utf-8?B?UG8xaDBqOUdGZ0FybFlLS2xZQXg3YVcweGprQm5aNE0wOEZqRkhMaHNJbmNE?=
 =?utf-8?B?Y2oyZitiRncyaitaeTFzVmgvK2VJWCtsZmw0Wi9BcHJUWHVkTHJ6M1NJNHp5?=
 =?utf-8?B?OUx3dys2amtOSG1YTDh0VVUrOGdGNURpNGNQUEJyYytkOUc1K1NSNitDNEJq?=
 =?utf-8?B?em9FbGZCQ2JOMEdEWmdNM1hjYXF1QmZUL1diN3FFTk9tT0xpOXNYOEp0bkJP?=
 =?utf-8?B?WUpLVmN0dHlrS1ZvVG43TnVzZ25QNSt2VWd0V25makZzWkJqVlZEeUpqQVdi?=
 =?utf-8?B?R01uTC9jMVU2N255RTRXRm9lK1BKQmQ5S3daU2NrNmlid2lXdG1XSW9sSTJR?=
 =?utf-8?B?cFZVTlkxamVJMDF0R2Q0b0NrTlBnWlk0elphVm5iRXFSRnViSHJUTURVRlZo?=
 =?utf-8?B?VHBIMlp6bUhFN0d6TnAreDVVakdPc3FiYzcyVVdyNTZWWmh0V2czUE96L1ZJ?=
 =?utf-8?B?Y05QYUVvYUNabm5DcFVNbVFEY0VEVFV1enRobWthSUxHZzE0UDd0dHFoaHlO?=
 =?utf-8?B?ZmhUTStwRlhvV2FWU0d5d28rNjNOaXlLS3kzTSs3a1NEMFU1OHBNSHJkMlQ3?=
 =?utf-8?B?M3Rva2haWktqTXhEMnJPL2tqckMweno3NG9uQ1UraFJPcGRiOGxURURjQmdL?=
 =?utf-8?B?THdHY2RxSHlQSkNpVVJicHRkK1hnVWwxR0diR2Z5T1NSVzluTmpmY1NuM2cv?=
 =?utf-8?B?by8yZ3FTaHI3WE85UDR6L01nUXM2WXFuQnJhTitqVEthU3ZNa1FyVUlvUFNa?=
 =?utf-8?B?USt2SHBTaUxCZEsrMk51ZENFRXZacFVGdnI3SGhXSDBhcWdHNWJDaktVdXVK?=
 =?utf-8?B?VXY3TGRNbDI2QW90ZW5LV1RjVUdRNHVRcWE4aTJuMFlEdVdXdHgzYUhEVlVO?=
 =?utf-8?B?Z3d1eloya2I5TFE4L3JFNnIzQlVNM1M5MEkxbWE2VUFlTFFFb1U4d291Ukow?=
 =?utf-8?B?aXd4endKWVNBei9Oalp1MTBoNllWaEhpTjJTUzFKcnljN1JaQzgvWjloVU5K?=
 =?utf-8?B?MkJ1T0RPNk5RVkd3dU9DUFk2UnRaYnZIOU04QVI5NDhWNFR4b1RQOVVUQjlU?=
 =?utf-8?B?TmJTSnhnU0R6d2ZtQlZMMXVGSHJqMldYZVVzdGFMWE55cXlWUnVUQnJ6RVJv?=
 =?utf-8?B?UXFFcDBidDRpcDladnZNemp6eWFkQ3JXMnhXSlJoZ2xCa2F2TDhjVll2bnY4?=
 =?utf-8?B?Y2MvTkcvOEZJd1JMMEdhVURQMDlnWnd2NzY4UUgvb1hmWnhud3JGckhjMGMr?=
 =?utf-8?B?UERDN3pxRUUxSEdiU1hjTTdTMUxaYkxzS0h0aGYrVmFtZS9KbUF5MytyRE42?=
 =?utf-8?B?MTdNY1RGUEcxU3oyQmJxTGI2T0RwTVUrMEJEa29FT1d4U1hBYzRsVFoxOWJ6?=
 =?utf-8?B?Uk5pMmFsSGFIU2dlcUVPdklCcUlGc1g5VG12Nng2ZUFTQTA4K1gxWVNyOHhi?=
 =?utf-8?Q?kmf4tQllS6X3z9z2BVZoOyPCobol8OBlDxkjg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(41320700010)(366013)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUN3QUhYNDJoT01YVkRNMlkvYU1ia1BERmlwY2VaL1ltRWFqTEJicjZ6TEdZ?=
 =?utf-8?B?ajhhWlRkRVZnSGMrdGc2YWtaenJNRVg2bG81UGV6S0VtVlNZcG4zOEY3OHlK?=
 =?utf-8?B?Sko1ZzNJbk56YVNKUnl0UTFZOFBlNmZwQ2VJTzJ4Z2dQcUZEMzBqNTVLQ1BU?=
 =?utf-8?B?TlpSYTQ3aGJURmFLV3hiVFVadWFyNkRBN3hqeU5QbUVKODFzT1BqbXQyakJZ?=
 =?utf-8?B?UGoxdG1SUGhUaXdWMlNjcitmOGlUVUZ1ZndZT1Q2TWdwYTZ3ODRSMHVVMDJp?=
 =?utf-8?B?SUtVVGhEbzg2cTVMZ1hrYUE1NFNONFpIVUhlZFZQSzFla0c1SGxCeFRvR1N1?=
 =?utf-8?B?RHk2Snp6TkU0ZHJuNVI0bHVsTjZ6ajFxSmtjUTd2bzQ5RXpicHIvUkRDMUpL?=
 =?utf-8?B?RklCakJsYmNkcWJFKzNEeEVUeUdVdnpyeWllM0xLcTVvYThxa0pJZHYyR0cz?=
 =?utf-8?B?ZFI4MGxPcFNwbUlyZ3ZNMUh3UDd0SHJZbGVPMkRMUzZ2b3BrT011KzMrU0tI?=
 =?utf-8?B?VDliKzl2QjN1bkVSc3A4NXdweHkxSlAwcENyZUhxOEJKaFdCZ3N5Y0RmQ0lJ?=
 =?utf-8?B?RC9VTzJqQW1LQnVXQ3pHRGgwZWc0djc1cFRuL25IbEFzWjN3NXVGKzZXTWdR?=
 =?utf-8?B?UlNTRnkwMmtaTHg1NXc5b0dyRENJY0R3cndFT043dEI0T3NyejhRRlc1YVV3?=
 =?utf-8?B?ZUlSWjFHaStXaUJpUEIxZGd4QWpYRXcvMDlGRjdDdlpBbmJhbUphQXpMRW9h?=
 =?utf-8?B?ZkZnRzNyM2U0TWZDcHorNXVvK0ZGanAzVWpvK1h6MFhuVHJBWWdqU1lCYkpi?=
 =?utf-8?B?MUFlVVNoS3JyRjl0S2ZYaFJ2WnB6M0o5MkUrZG9aR1ZpN0V0M1lpOE1sWkVG?=
 =?utf-8?B?eU96ZjZmQUtKcC9NU2dMK1pCREZZZlhNRVdKekNERCtncERkSm1hL1h6bWs3?=
 =?utf-8?B?TVVzczVDV1NRQURPa09udEN5N1dCSjRFVzRaRlVYak5LTjhCV0QzMXNpR2lC?=
 =?utf-8?B?ZFoyQVIxbkdvNnVZOExKSFBBOWJ6MFFKdlVOTFlJdEkxR2R5bkFtSmUzQTQ3?=
 =?utf-8?B?WHB6eFVSZ1M1TE5hamlZdnljQlNCSVBSUFFqbGhjMi9nWWlyYVd2dDJoWVdl?=
 =?utf-8?B?eHdXdEZMUDZ0emFMZ1QxQW1kd3d3aERNdU1jUHZ4MkJ2T0hNcHlEcU5zY0pr?=
 =?utf-8?B?UzcxbkZpMEI3LzAyNkNSUE9wVityS0RrSEdzbHdYMlptQkw3MFZUMFBkeDZ0?=
 =?utf-8?B?YlIySzBxd1FRaGFJd245ckM3Ym5mQW9wZDJaU0J2NE0xOGVUS24xY0htcW1W?=
 =?utf-8?B?RFp3UzRuc1NtQXJqM3NleFBrT3prMUZPMS9Nb3RiQmN1Tmx0YUNmZzFlZkRG?=
 =?utf-8?B?TEl3dXJzQjU2a2xFeC9wRzZDV2IxL0JSdGtOTUE2V0J5WmZpU21uSFROR0hF?=
 =?utf-8?B?OWtHMEloL3Q0c3Y3QllxK2x6eDV0U1ZReHp5dEEzQ3ZHR2k5eUovUnhCQmtS?=
 =?utf-8?B?Vml4cmJSTTlJaGJkbFgvSDBGMjk2bEM1cFRaVW0vdGF4OVUveVZ6T2hwY2ZF?=
 =?utf-8?B?U1BCTk5jYWg1UTJqMzVBZzRQajZkeXJxclN0d3ZEVHdwTElaUSs5NEhDZWdR?=
 =?utf-8?B?cWZDZzJyQkU0N2MybW4wd3o2VldJdlJ4ZTV5TDdJbmEyRGZhRWpnOS9QUnRt?=
 =?utf-8?B?ZXdQWUt0VklUSWZYSlNYeHlPUE9xN2ZHRWZjL3BHWFhCVFpmTEJpNWd6bHk0?=
 =?utf-8?B?eWJobkZ0bW9Gbm52N0VZMGdJeTRNYmRyYVVUQjJsVEUvdzlHTkIvY0lJVFVi?=
 =?utf-8?B?d2tGVW9ZNkgxeDhDWXY0Q1lnVnprK2M5UytxMVVjUk85eWpPWmNySXk4dWt6?=
 =?utf-8?B?T3llU3V5ZmxoeTc2WDcwdzNzZEFvUVJYaFlzVGRwKzZIeG05bzFwUkgwQXN1?=
 =?utf-8?B?TnVBRmpEQnZ5cEtXUFpzaC9wMDJHVkNVdmgwTThDNkYrbGNRaXRmbjFTOTc2?=
 =?utf-8?B?Y2ZDOXNmdFF3UVY4SEN3TmtxZGozNFlCU0FyZTBuRnZkTE1IQlhJU3Y5SlJy?=
 =?utf-8?B?aGNDSkFnbWo5ZVJneGMzTUU4YmJCR211WS90QlM2YmQrcDhwWUVCWXZkcHNJ?=
 =?utf-8?Q?5tS3dTKAWJ2CYMsfABxi79477?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA34DA124016D546BDE61E14A97F5CB1@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: jv5RhFqFLcCfg7JH95EF2iiVBeXlcGj3uT5CZ/LLV0Tke69F2K2mIttZ/mtgioZzuDQZaskoMUi37PD2KQhja7bZ4wraoiqNE7T8fqMncHMSoERKxoirobjgY83VVe4TMEiN6jdDaud33p1EkGl7sLUysKnEAH6fHpbwyncuh6ZeBEJgE0s3W9XE1UtOlXm8ui2JDWCviMlhUSJWkzwSOHkJnPJVhBraA4n41swZTWs0PlyYtjc6t4DyvOUYOd4PJRViUt8SFVhQnATpjMg4SKHpiPFoTkkDFzxoQ3Jhs8at8+rbARoMGf7ilQ1cBV9wK0fnOEocXv1bm8av24ctxAWBDurRaUL8zBGVYNEEiURhX31Dlw+PlWUYoD28Qp66y5iOWFCST5XJRVrmHzjl6iwv1gV0m0/CH5oEveU1/StLrN8W4iTj5/kAxQOsUFK5Gmwch0NuouPTrnfm5a4CJ2eLvLUyE6liyr4K1qEn8S0hdSspiTS1/xznP2JvqJaqkIYiQCkQcSASMQcLsjJcCpB8Pf7SkkKdujSY1HeCruXHKc94uFRisAVfYiFeMOfRCoU6mmnejH7t1P2+SKihkQLqj3lQH/ZVgPo/kNJt2unH6kqfLnu6GKlWxuNz4ZkY
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8bb9f3f-96de-480b-604f-08dc8fce1b77
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 19:37:36.6331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WPnKQForIN1i94EI5Dp8EhYDIwKG+GDGlb3KohhV//M71WUJiDseI81QMQJnnlvsW/bRVxXkjrLB0hwGIRC3zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6258
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxODczOTQ2NzpGUEtleTEucHJpdjomn5t+WNyeL37frE9zvLmMXlC6Bfh35Oefk04A8FBmXBRlUnctX3DuW/jmzBfZld34nJlkpb7omObOOuNx/IKIUNexdKD0mXNVx9nygXhRD71R27HTjmiEuY9sN7Yixmh3no3YAWfUp0ZKnqufdfw/InmukY2MFYXzTdvLGwROKLs2OAK0+WyFPqhoC+TMb75GpnmkLNWe9HdZxzRyUBEmAHUt1pQz90oOzSFbU/tswI2XK39SIJgGiiEdx2btEbyPtQ+IUdtvk2hMUZ0wqgtS9zke5c6rI2OurjUNUmJ0oVH0HG8Zf2v5nNHzWbCGfmvusg3NsSPhJifa9S05N/v+
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.68.1.115
X-Mailman-Approved-At: Tue, 18 Jun 2024 20:22:03 +0000
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

T24gNi8xNS8yNCAwMTo0OCwgSm9lIERhbWF0byB3cm90ZToNCj4gW1lvdSBkb24ndCBvZnRlbiBn
ZXQgZW1haWwgZnJvbSBqZGFtYXRvQGZhc3RseS5jb20uIExlYXJuIHdoeSB0aGlzIGlzIGltcG9y
dGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0K
PiANCj4gT24gVGh1LCBKdW4gMTMsIDIwMjQgYXQgMTE6MjI6MDJBTSArMDMwMCwgT21lciBTaHBp
Z2VsbWFuIHdyb3RlOg0KPj4gVGhpcyBldGhlcm5ldCBkcml2ZXIgaXMgaW5pdGlhbGl6ZWQgdmlh
IGF1eGlsaWFyeSBidXMgYnkgdGhlIGhibF9jbg0KPj4gZHJpdmVyLg0KPj4gSXQgc2VydmVzIG1h
aW5seSBmb3IgY29udHJvbCBvcGVyYXRpb25zIHRoYXQgYXJlIG5lZWRlZCBmb3IgQUkgc2NhbGlu
Zy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbWVyIFNocGlnZWxtYW4gPG9zaHBpZ2VsbWFuQGhh
YmFuYS5haT4NCj4+IENvLWRldmVsb3BlZC1ieTogQWJoaWxhc2ggSyBWIDxrdmFiaGlsYXNoQGhh
YmFuYS5haT4NCj4+IFNpZ25lZC1vZmYtYnk6IEFiaGlsYXNoIEsgViA8a3ZhYmhpbGFzaEBoYWJh
bmEuYWk+DQo+PiBDby1kZXZlbG9wZWQtYnk6IEFuZHJleSBBZ3Jhbm92aWNoIDxhYWdyYW5vdmlj
aEBoYWJhbmEuYWk+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgQWdyYW5vdmljaCA8YWFncmFu
b3ZpY2hAaGFiYW5hLmFpPg0KPj4gQ28tZGV2ZWxvcGVkLWJ5OiBCaGFyYXQgSmF1aGFyaSA8Ymph
dWhhcmlAaGFiYW5hLmFpPg0KPj4gU2lnbmVkLW9mZi1ieTogQmhhcmF0IEphdWhhcmkgPGJqYXVo
YXJpQGhhYmFuYS5haT4NCj4+IENvLWRldmVsb3BlZC1ieTogRGF2aWQgTWVyaWluIDxkbWVyaWlu
QGhhYmFuYS5haT4NCj4+IFNpZ25lZC1vZmYtYnk6IERhdmlkIE1lcmlpbiA8ZG1lcmlpbkBoYWJh
bmEuYWk+DQo+PiBDby1kZXZlbG9wZWQtYnk6IFNhZ2l2IE96ZXJpIDxzb3plcmlAaGFiYW5hLmFp
Pg0KPj4gU2lnbmVkLW9mZi1ieTogU2FnaXYgT3plcmkgPHNvemVyaUBoYWJhbmEuYWk+DQo+PiBD
by1kZXZlbG9wZWQtYnk6IFp2aWthIFllaHVkYWkgPHp5ZWh1ZGFpQGhhYmFuYS5haT4NCj4+IFNp
Z25lZC1vZmYtYnk6IFp2aWthIFllaHVkYWkgPHp5ZWh1ZGFpQGhhYmFuYS5haT4NCg0KPC4uLj4N
Cg0KPj4gKyAgICAgICAgICAgICBpZiAoaGRldi0+cG9sbF9lbmFibGUpDQo+PiArICAgICAgICAg
ICAgICAgICAgICAgc2tiID0gX19uZXRkZXZfYWxsb2Nfc2tiX2lwX2FsaWduKG5kZXYsIHBrdF9z
aXplLCBHRlBfS0VSTkVMKTsNCj4+ICsgICAgICAgICAgICAgZWxzZQ0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgIHNrYiA9IG5hcGlfYWxsb2Nfc2tiKCZwb3J0LT5uYXBpLCBwa3Rfc2l6ZSk7DQo+
PiArDQo+PiArICAgICAgICAgICAgIGlmICghc2tiKSB7DQo+PiArICAgICAgICAgICAgICAgICAg
ICAgYXRvbWljNjRfaW5jKCZwb3J0LT5uZXRfc3RhdHMucnhfZHJvcHBlZCk7DQo+IA0KPiBJdCBz
ZWVtcyBsaWtlIGJ1ZmZlciBleGhhdXN0aW9uICghc2tiKSB3b3VsZCBiZSByeF9taXNzZWRfZXJy
b3JzPw0KPiANCj4gVGhlIGRvY3VtZW50YXRpb24gaW4gaW5jbHVkZS91YXBpL2xpbnV4L2lmX2xp
bmsuaDoNCj4gDQo+ICAqIEByeF9kcm9wcGVkOiBOdW1iZXIgb2YgcGFja2V0cyByZWNlaXZlZCBi
dXQgbm90IHByb2Nlc3NlZCwNCj4gICogICBlLmcuIGR1ZSB0byBsYWNrIG9mIHJlc291cmNlcyBv
ciB1bnN1cHBvcnRlZCBwcm90b2NvbC4NCj4gICogICBGb3IgaGFyZHdhcmUgaW50ZXJmYWNlcyB0
aGlzIGNvdW50ZXIgbWF5IGluY2x1ZGUgcGFja2V0cyBkaXNjYXJkZWQNCj4gICogICBkdWUgdG8g
TDIgYWRkcmVzcyBmaWx0ZXJpbmcgYnV0IHNob3VsZCBub3QgaW5jbHVkZSBwYWNrZXRzIGRyb3Bw
ZWQNCj4gICogICBieSB0aGUgZGV2aWNlIGR1ZSB0byBidWZmZXIgZXhoYXVzdGlvbiB3aGljaCBh
cmUgY291bnRlZCBzZXBhcmF0ZWx5IGluDQo+ICAqICAgQHJ4X21pc3NlZF9lcnJvcnMgKHNpbmNl
IHByb2NmcyBmb2xkcyB0aG9zZSB0d28gY291bnRlcnMgdG9nZXRoZXIpLg0KPiANCj4gQnV0LCBJ
IGRvbid0IGtub3cgbXVjaCBhYm91dCB5b3VyIGhhcmR3YXJlIHNvIEkgY291bGQgYmUgd3Jvbmcu
DQo+IA0KDQpQZXIgbXkgdW5kZXJzdGFuZGluZyByeF9kcm9wcGVkIHNob3VsZCBiZSB1c2VkIGhl
cmUuIEFjY29yZGluZyB0aGUgZG9jIHlvdQ0KcG9zdGVkLCByeF9kcm9wcGVkIHNob3VsZCBiZSB1
c2VkIGluIGNhc2Ugb2YgZHJvcHBlZCBwYWNrZXRzIGR1ZSB0byBsYWNrDQpvZiByZXNvdXJjZXMs
IHdoaWxlIHJ4X21pc3NlZF9lcnJvcnMgc2hvdWxkIGJlIHVzZWQgZm9yIHBhY2tldHMgdGhhdCB3
ZXJlDQpkcm9wcGVkIGJ5IHRoZSBkZXZpY2UgZHVlIHRvIGJ1ZmZlciBleGhhdXN0aW9uLCBub3Qg
YnkgdGhlIGRyaXZlci4NClBsZWFzZSBjb3JyZWN0IG1lIGlmIEkgbWlzdW5kZXJzdG9vZCBzb21l
dGhpbmcuDQoNCj4+ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4+ICsgICAgICAgICAg
ICAgfQ0KPj4gKw0KPj4gKyAgICAgICAgICAgICBza2JfY29weV90b19saW5lYXJfZGF0YShza2Is
IHBrdF9hZGRyLCBwa3Rfc2l6ZSk7DQo+PiArICAgICAgICAgICAgIHNrYl9wdXQoc2tiLCBwa3Rf
c2l6ZSk7DQo+PiArDQo+PiArICAgICAgICAgICAgIGlmIChpc19wa3Rfc3dhcF9lbmFibGVkKGhk
ZXYpKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGR1bXBfc3dhcF9wa3QocG9ydCwgc2tiKTsN
Cj4+ICsNCj4+ICsgICAgICAgICAgICAgc2tiLT5wcm90b2NvbCA9IGV0aF90eXBlX3RyYW5zKHNr
YiwgbmRldik7DQo+PiArDQo+PiArICAgICAgICAgICAgIC8qIFplcm8gdGhlIHBhY2tldCBidWZm
ZXIgbWVtb3J5IHRvIGF2b2lkIGxlYWsgaW4gY2FzZSBvZiB3cm9uZw0KPj4gKyAgICAgICAgICAg
ICAgKiBzaXplIGlzIHVzZWQgd2hlbiBuZXh0IHBhY2tldCBwb3B1bGF0ZXMgdGhlIHNhbWUgbWVt
b3J5DQo+PiArICAgICAgICAgICAgICAqLw0KPj4gKyAgICAgICAgICAgICBtZW1zZXQocGt0X2Fk
ZHIsIDAsIHBrdF9zaXplKTsNCj4+ICsNCj4+ICsgICAgICAgICAgICAgLyogcG9sbGluZyBpcyBk
b25lIGluIHRocmVhZCBjb250ZXh0IGFuZCBoZW5jZSBCSCBzaG91bGQgYmUgZGlzYWJsZWQgKi8N
Cj4+ICsgICAgICAgICAgICAgaWYgKGhkZXYtPnBvbGxfZW5hYmxlKQ0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgIGxvY2FsX2JoX2Rpc2FibGUoKTsNCj4+ICsNCj4+ICsgICAgICAgICAgICAgcmMg
PSBuZXRpZl9yZWNlaXZlX3NrYihza2IpOw0KPiANCj4gSXMgdGhlcmUgYW55IHJlYXNvbiBpbiBw
YXJ0aWN1bGFyIHRvIGNhbGwgbmV0aWZfcmVjZWl2ZV9za2IgaW5zdGVhZCBvZg0KPiBuYXBpX2dy
b19yZWNlaXZlID8NCj4gDQoNCkFzIHlvdSBjYW4gc2VlLCB3ZSBhbHNvIHN1cHBvcnQgcG9sbGlu
ZyBtb2RlIHdoaWNoIGlzIGEgbm9uLU5BUEkgZmxvdy4NCldlIGNvdWxkIHVzZSBuYXBpX2dyb19y
ZWNlaXZlKCkgZm9yIE5BUEkgZmxvdyBhbmQgbmV0aWZfcmVjZWl2ZV9za2IoKSBmb3INCnBvbGxp
bmcgbW9kZSBidXQgd2UgZG9uJ3Qgc3VwcG9ydCBSWCBjaGVja3N1bSBvZmZsb2FkIGFueXdheS4N
Cg0KPj4gKw0KPj4gKyAgICAgICAgICAgICBpZiAoaGRldi0+cG9sbF9lbmFibGUpDQo+PiArICAg
ICAgICAgICAgICAgICAgICAgbG9jYWxfYmhfZW5hYmxlKCk7DQoNCjwuLi4+DQoNCj4+ICsgICAg
IHBrdF9jb3VudCA9IGhibF9lbl9oYW5kbGVfcngocG9ydCwgYnVkZ2V0KTsNCj4+ICsNCj4+ICsg
ICAgIC8qIElmIGJ1ZGdldCBub3QgZnVsbHkgY29uc3VtZWQsIGV4aXQgdGhlIHBvbGxpbmcgbW9k
ZSAqLw0KPj4gKyAgICAgaWYgKHBrdF9jb3VudCA8IGJ1ZGdldCkgew0KPj4gKyAgICAgICAgICAg
ICBuYXBpX2NvbXBsZXRlX2RvbmUobmFwaSwgcGt0X2NvdW50KTsNCj4gDQo+IEkgYmVsaWV2ZSB0
aGlzIGNvZGUgbWlnaHQgYmUgaW5jb3JyZWN0IGFuZCB0aGF0IGl0IHNob3VsZCBiZToNCj4gDQo+
ICAgaWYgKG5hcGlfY29tcGxldGVfZG9uZShuYXBpLCBwa3RfZG9uZSkpDQo+ICAgICAgaGRldi0+
YXNpY19mdW5jcy5yZWVuYWJsZV9yeF9pcnEocG9ydCk7DQo+DQoNClRoYW5rcywgSSdsbCBhZGQg
dGhlIGNvbmRpdGlvbi4NCg==
