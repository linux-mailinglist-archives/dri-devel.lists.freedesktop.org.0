Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1096B90DD46
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6711110E79B;
	Tue, 18 Jun 2024 20:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="LtBkZXKc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E0310E5BD
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:52:14 +0000 (UTC)
Received: from rly13d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly13d.srv.mailcontrol.com (MailControl) with ESMTP id 45I7q81a395859;
 Tue, 18 Jun 2024 08:52:08 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly13d.srv.mailcontrol.com (MailControl) id 45I7pW8s383101;
 Tue, 18 Jun 2024 08:51:32 +0100
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 by rly13d-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45I7pTVD382144
 (TLS bits=256 verify=OK); Tue, 18 Jun 2024 08:51:32 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMgUtoRfkEW115QJCr9S3n438Np3RzcxQQMeI4qFZejOtpZltN1iQRqq0fN3lyhLuwZfgWRDrjak9ERoPU6XpJHY0HzNJndrVNc063xHXHRspiEPeCkL8N0mcfUm2GzBfGdXrdHmIL1rD6LlCtlQsY8HJyRdadeKbO+J8hzleyTF74PrjPzFl0gx4Q5WlGt/171WAP/gpqEriSzjoQO91ZrsLj+lTZdaupikxtIHr2sWJmGHyWwN7J+yfLpckvM1q/Y2BLqdq1jGlE7BsHvpIzps2R95ZHezJXvVqwu1C6HuTUmVbx6/JV6KNeGk4JkmOkyzTHa+tDgWABrx+fnnxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQ0z3Y/4p/4gxnYMM9XCBFoknIODTdsjx969vhlMcQo=;
 b=KSjpa/f6VCX69jQ7jV1ktU1TT4voONMNJxuJPEtRCBIj002drf/UklEugcemplgUmXONempwtY6dXZZEpBlf7H7Ntj87j+6Q3irqjX6uPkEMoqHZpdiFPHkTHxw7eMpeFNU5+gGUdF/8cqKfsAh3KBjZB9m5dvObWD3xaS+Bjozh0Bnrz1v/eZSoiC+vIElZA6MN9G3k/IBrMH14G8E+GKBF8Fv3cCKtsm3ad0VF/xKhXyAXjuGsV61OqtEBV3VozZcJihmcriY/tEb0PbTMttrGZqPSLRZbzXAfZ3GPC3KZbr++eTXHgzLFCvbJjJPnGNWSsCeCEcycl++qfkPSbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQ0z3Y/4p/4gxnYMM9XCBFoknIODTdsjx969vhlMcQo=;
 b=LtBkZXKcr0d3/qXvAetfw+izM6aI00wno6AhFFOcJL7Xo+bSHeX6W44Kul+3nPLfLKRGuSPg/3elj1HUUfijD5WrOEZ6QSPiD324GhCePWJXXVXp7mCP5/0HueQcQDP2NVM31F/UhEp8GE7tkaWkmK6DkzlwgnCwUW30qlWjGrarKpQ41g/DRhHhB0yHFM56CqDN9SQn4hszfHbJPX64b71vC0xQdNEe8ZOuj1Nt+NQZc8dya0WmF+y0QG+UJHXv9UuQx3lsV+eTJ/ceOymVkuerFsW5tB74o7L9wrDVHLDasAkSG/OOCX0UFO6uedm0Ts/bi4t9GvDm1bA90GK8KA==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by PAWPR02MB9150.eurprd02.prod.outlook.com (2603:10a6:102:33e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 07:51:28 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 07:51:27 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Andrew Lunn <andrew@lunn.ch>, Markus Elfring <Markus.Elfring@web.de>
CC: Abhilash K V <kvabhilash@habana.ai>, Andrey Agranovich
 <aagranovich@habana.ai>, Bharat Jauhari <bjauhari@habana.ai>, David Meriin
 <dmeriin@habana.ai>, Sagiv Ozeri <sozeri@habana.ai>, Zvika Yehudai
 <zyehudai@habana.ai>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/15] net: hbl_cn: add habanalabs Core Network driver
Thread-Topic: [PATCH 01/15] net: hbl_cn: add habanalabs Core Network driver
Thread-Index: AQHavWrVVuRHPTgJKUqRN0LFtHgrD7HMBB2AgAAPxQCAARntgA==
Date: Tue, 18 Jun 2024 07:51:27 +0000
Message-ID: <5881b5fd-743d-4310-9b9b-521054e2eb8a@habana.ai>
References: <20240613082208.1439968-2-oshpigelman@habana.ai>
 <9d13548f-7707-4741-9824-390146462db0@web.de>
 <f2ddbeaa-e053-467f-96d2-699999d72aba@lunn.ch>
In-Reply-To: <f2ddbeaa-e053-467f-96d2-699999d72aba@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|PAWPR02MB9150:EE_
x-ms-office365-filtering-correlation-id: 405b819d-68e1-4561-004e-08dc8f6b75b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|1800799021|41320700010|366013|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?c2tJZUU3UEpWUk9QZlY3SndXaEY0ZERQaFQ3QmdXektqTWRoMjlveW9aWTBa?=
 =?utf-8?B?Ykl1WFVyK085Y203VTg3QXhKVmM0ZXUrbnYvbXZEMktUczl6MUloaFg5eHM5?=
 =?utf-8?B?YlovRFRwR3JuaHRoS2FieFFxS3ZiVFpDbkQvSkRrb2tCalB2SmVVOVJOajNL?=
 =?utf-8?B?MjZ4M09HT2tQdmYxU3VwWGp3VTlMdG5tSUlUTmRvNnpFbTJDd2dmWjYrYW1q?=
 =?utf-8?B?TlBrSWc2R3krOUNqMWk2VVdqRHI5UllyTG8wRE5wVXFxcHZzd1greFB6TDhl?=
 =?utf-8?B?dksyYnZlWDhlQmVwM3JsQ0pjb2dxRk9Md2xqYmhXOGNlTFFZSXlsUklkak5D?=
 =?utf-8?B?dkJxaVpwMGRSQm1HMjJrV3VJQVJpZ2dERWUzNGlyanZmOWNnYXdhV0M2aGx4?=
 =?utf-8?B?RHBSUGMrRUdjU1dpWmVHVlFTV3YzSVhka1pGN09DVTkvdXBLWlhYbG1YOXA1?=
 =?utf-8?B?NVdMS2dYbSs3TUZhSU5rODU4R05tbFRFemhDVGxjeFlZOFZiVUdVRzcrM2p2?=
 =?utf-8?B?WDFVT1p1TnBJZFJGRlk2S1RkZFRRcUhXWXMvaWxsTXMzekFQZGJiL1BsNnNB?=
 =?utf-8?B?YzVjZ1FDYWRhajI1Yy8xQjdDcHlUdC80dmNYRlVBQ1dqYmV5dTM5b0ZKVGNw?=
 =?utf-8?B?a1pWeDRIYUo5Q0M3ZkNLMEg1MS9sWjRCMGhQSlkzb1UySEs1MDFGVEFqQm5H?=
 =?utf-8?B?bG1mQXRmcGdRNFZ6bkdlcWFPSXR2UUhZNGx0VFk1YUdXdkpEWlF6b2VTMkZo?=
 =?utf-8?B?R1dienB6UkpiSytodlpXaWgreHJQMXE2Y05tOGdMTjNwV1drK3dFS3ZYSThO?=
 =?utf-8?B?eFV1WUxmbHcxZG83MWk5TGVwYlZNZFlVS3pkRzJXemp3eVRaaThab2U3clgz?=
 =?utf-8?B?VXlWOHZnU3huR2JsN0ZKV1FYRWZnRmZJdHhQVGxRd2JQa2RuNisrSDF6b3gx?=
 =?utf-8?B?clg2b2ZwZjI4K2h3ZHpNQmJNUExwUVViSnVoQnl6UzVTdDV3UDI4MDBlb0V1?=
 =?utf-8?B?Ry9XZ1pHN0wxbERQZkhGSytMVjZJV0dIbTZleG5nNWZTZUNXWms0L1BOOXMx?=
 =?utf-8?B?TFA5dmRuRFpTSnhKNTBWOWRVbktMMEVkMWE2aklyTmtBSjRtU1k1TjlEU0Jj?=
 =?utf-8?B?MDFYVHpVSm1tZHN2b2dGeWw3ZC8rWTY4cEtJVzZlN1VKWGgzVkMwNnNxbE5m?=
 =?utf-8?B?SDA4dGo5TzIyN2ozc2VRelZ1SW85K2NEZ3gvM09XNkFMeThJZlcrRHB0Wlg4?=
 =?utf-8?B?eUIvYS83M1FwNU15dk5sODlDeXlsZ0p3NS82NzlVMHdKeElsUEdvOGttQnRp?=
 =?utf-8?B?c3E4bkc5SDRlUm05OHpObFhpUzVTVnA0bjNFUUdEVG9qLy95RVJrcU51eDFo?=
 =?utf-8?B?YTl1U1ZrYU00WWI4dUYxT25uR1J0ZkRHYkZFS2tPSjdqU1RHSFZsR3NsWEZI?=
 =?utf-8?B?dFZUbEpUa1JIS1dMczRZZkVIZktRMTdta3dXcXErM1BabTdzNy84VSszamJR?=
 =?utf-8?B?RkE2R1Y5cmY5eEFWcFdtYXRsRi9jdDlxSGlML3JyTk9BSmtMU1JJOHBCZ0h5?=
 =?utf-8?B?YWFqUjlvVW1GMDRQbHFlVmhIRTJMRExqcWNES0JuQlBQYkxMMnJFd2dYci81?=
 =?utf-8?B?ZTdsTC9vVzhMRTIzL3RkTXBuWDNDb3JBajJhVXY5VmlUOHBrRU14VG9Yekdu?=
 =?utf-8?B?SmNLc3NwclhLckhYVDlKUmhYTFcrUTBTREhmQ2IxeDF5UkcraFVaVVlZaVBC?=
 =?utf-8?Q?iMZy6mhCE2pNf0a8NpP12NwMabdqQ2l4gnlOf2A?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(41320700010)(366013)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVVDWUlOSXVjQVZYcU1lMU4xeVBwSXVienYvTlVDVjNFYXdwTW9OaFBTeHRr?=
 =?utf-8?B?SWFMNU9PVFd0S25DTFMyTXdjVld6UHNQUy85cEhqdlkvL1U0U2M0TE1QOUhj?=
 =?utf-8?B?REpIQzZFaUw0UENnK2pXLytRUkhQa0JxdTZtckpKd0ZRZDZJR0ZPTjhTc1VU?=
 =?utf-8?B?cWR1R3V3YkdvRFFIZ2RuN2pSQWRrUUJpT0FGNitYOFYzbFY2K1ByajZNbzRS?=
 =?utf-8?B?UEcweFhZcmp2QlErWnhpbzA3U2FmTzNFU3lnS1hTSUpZcjJXN3d5NGhRRDY0?=
 =?utf-8?B?SnhJVEtjekI2dHU5dzlDSXFsc1hseVZwckRtbElPZk82Zi9SQXliODhwdGlv?=
 =?utf-8?B?S09wOTVCRHlPOHhEVHZkS0U3LzhaNlFsTjFTRFVBRXJwbXpxbUY5bVFJQmFy?=
 =?utf-8?B?c3k0VWNnVjg3a1k1M2QxWDI2SVlqV2lCdHRLMEYrSlIvV3EyZHk5ZFV3UGd5?=
 =?utf-8?B?S1ZRRjR6ZzNkNXlHNzdVSytPcnIxU0llczA2TUZHVXg2akVDSjhtR0xyS0lM?=
 =?utf-8?B?RzNXakM5b2hqc0tGL2RsN1JhT0t2UHpDclhBOW9pZ0dlTkkrK2VWQXZYTkxq?=
 =?utf-8?B?RXhkTDR6ZkVuTzRpcHVIRUU5NDY0UmRBelcrZ1dxNWI4OGhkS3NMSktPVHQy?=
 =?utf-8?B?RU9mR0RLQ25qQkhLL3ZOZlUrUTFnVTdNbnhkL3lmd09ZZktZY1FMNWw5eHN6?=
 =?utf-8?B?VS9hR25GOUF2ckpIZFB2Q2xZUjVCazExbDY0VDJNSzJBZmZ6VVE3Tm5iRzFv?=
 =?utf-8?B?UkpjTG1tWkR1MWpJaXZrUTNkTHpHcHQzTXQ4MU1YbTQvek1mSHYrSjNRNGRO?=
 =?utf-8?B?QWR1d0E0alNOcWdKQnpsTG05blUxaS9qWVZUeURUdjdDdUhWR0hEZ01WcUtu?=
 =?utf-8?B?VmpaVzRvTHprRkxjZjFUQ1BBK0ZrODZFSTdCTDNrQlVpbVZabXVQZGpuaVVo?=
 =?utf-8?B?Z1hLSmpzTjA3UmpReHRnQ2t0c05ZdkVxaytUMEJCK3FsTk9iZmdibTQrTGlh?=
 =?utf-8?B?QS91S2h2dkRKVCtHSzZ3MzVTR2J5SHdWbmErYUtuNFJWdDZXbkZQLyt1OFBI?=
 =?utf-8?B?eTd5YkFLU0p3T1RiWlJ4M1hYcXcxUXdaYktUVkl3aHoyZWxSaWFNRjBvSmly?=
 =?utf-8?B?RDE2cjdzOTdBY0lBTVcxdjQrYk9zdk91aGp1UTZjNDNob3FZdGpMOGNMd01l?=
 =?utf-8?B?M1JZbWx4UWk4cXVXaEZyUEJZeGN4eEpyYlFWN0RqTkpnYmxzcGIrZjZIT2cr?=
 =?utf-8?B?b2F6MFpKd3FwUjZUV29rSko2ejc0VGk1THk5SzBMN0JnK1EzdTVuRS8wdWxj?=
 =?utf-8?B?SDNjTHJ6R1QvbkR2UkNDMWRrWXJmT2JBVE8vRUtxeHZnNmZ2L25ZR1U5aHUr?=
 =?utf-8?B?c1JGbXlMcEpDNitoMW9DT2EvZTVKT1U2VWdzOENSRytuSjZlaXplNVF1NTBu?=
 =?utf-8?B?MjFEem1vdWZlT0ptUkJIL2wyWW9wMmNpak9sRjhUa1l4dXlydDU3bUJzdmpa?=
 =?utf-8?B?Q3B5YWFHRlR5cjgyTG1YVlcvMEt5MStZYVJkVHYrOHEwNVd5bFBSVGs3b1kz?=
 =?utf-8?B?YUZhbmpnaG9kTkp5L3ZwRFB6UTYrVm5JVms1elhNK2VWNlZBL3Z5Z29USlVj?=
 =?utf-8?B?Z0pvZDhwZmNoZVFtRElTR2dhUjFsOUo5RXVxU09SZkdvQk1PVTdKRHh2Yjl6?=
 =?utf-8?B?aW8rK3FGZ1pQV3F2ZDQ5WjFrM1RLOUxOWjRSemRieThnZHZVY0tnaDVOa2dB?=
 =?utf-8?B?Q0o3T0taM2Rka3JWMzYrZm15MTF5WWVYKzhIZzFZWkZHMmZoVFpadjU3RWl2?=
 =?utf-8?B?aDRsWDgxNnhMMlIrUTZNU3JHZklJOEtvRUlnM01HZGk1QWM4MjFESjRjY0RS?=
 =?utf-8?B?dHIvUmZ2clhpckd3RHo1Z3BuNkd6SHlnS1ZGSlVjbitxN3dSZlR6UThsTmp1?=
 =?utf-8?B?akNXVWc5R1hjSHJRK2xnL0NWSmVxUVhBc1lQek16c05sM3VvUVc4cDlvR3Nt?=
 =?utf-8?B?NXJxaTNwemcvZnRNL1lDR284aWc0Qk0zOFBIUzJOT2tMQXlVOHg4MXpXL0ZU?=
 =?utf-8?B?VmdJNFdQZkdXRmk2QVhoNVlwVysrTnprUHVSTjFUOHdjZElyR2hBY0RRR0N2?=
 =?utf-8?Q?9BDYxUzh2zKLZfRcGVlxvD/2I?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A71B9A15D659CF409907A4D1DD8992EB@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: FvAhwr93ewipmdQKtPwkrktDZ1vMyW1Z8pcS7DRrRZrrbTGdy5cNBX1k43DZHkyooXtsQF2CCClo95LoJy5LQ71FP7n58fVc4IvITkBKnkquxfxq8AcSAXVlR35+5wJR71bHOom8tBFdghFy9puKO/kE1RoChjGpHnAbIHSW5R/rgV8eANWl6njEwM192AB/Roa9fi/GyQqk0Vx5iG3kRkcRiQ0utWiEJKbcyvJVJ0PEkjfUrgc1d6qPvhAU0GAPnbJjB5+ov9c1F772MReT1A7AZIvkj6G+LNSqoJAlxOLxbZbRgwTnXt2VBMnwSorDVu+ef5plsi3xTMoYr6QqS7TM6+W5vQWds1qFICvptS3uf4qaJ2b7eqNTC8Cowk4RORkJ9xnxmMLVKQK786nhVrwHVmz4TGWyO/ZfwYiN/wzDTZtcqxQaVozH0Vc+s31U+wG5OHL+0zJd3z2wusoSLxOLu7qB5jhqjN/0apj/62fA3t+zOdK5IjYGtcLQHPXEwWQ4INQNIkiGV7kKe8B+fvoQlufhol01wjgpc9D6YgiMO6N39aJDkWGTlGDTadQ44K0b3BCKqgRJfxbkZbEwDekZw3Wr6QYdUNoWl7mqvE5sODCxrd1rYT0l5+90+7t2
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 405b819d-68e1-4561-004e-08dc8f6b75b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 07:51:27.8751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JGH4rrIZp9reU6fbsW2gmmhnhudkYacS2ivegaqBTP5bGicQrHUuiLygFVNptWv46Be4lzp1xANiHXNJAm3vhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9150
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxODY5NzEzMTpGUEtleTEucHJpdjp6C74jxVQbyqUPXNYxR7K5rhw+I4S0OmBdCVvArnMBeBPmGCuDPuhyiBCPlhqYh90UIYD2TcTl0nrjr12gp/KTkTwVs6tiehSzZQkwlmjGpqHSB3d6pxgKiCo7sUMEEO4FRLSMCTYIMCZ7IAPzZeycrdsXyu1MYI97HIVLez+xPgtKv4olkv5DM2btbg3e9VxrjGF4TTWnbQFylVBxgRzjXI+aSI4j+i6B4/Q+/27iZWbsSiwlDydykTE4jTz5hHW3kLCVx7Z/A+GwFL04yzljHcJUXVUA2GtdRtLVF+Ruwa8sOAYV60KjhJiKLjtAptOGOkxckUZhhwrm+6bp3jD2
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.68.1.123
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

T24gNi8xNy8yNCAxODowMiwgQW5kcmV3IEx1bm4gd3JvdGU6DQo+IFtTb21lIHBlb3BsZSB3aG8g
cmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIGFuZHJld0Bs
dW5uLmNoLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVh
cm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4NCj4gT24gTW9uLCBKdW4gMTcsIDIwMjQg
YXQgMDQ6MDU6NTdQTSArMDIwMCwgTWFya3VzIEVsZnJpbmcgd3JvdGU6DQo+PiDigKYNCj4+PiAr
KysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9pbnRlbC9oYmxfY24vY29tbW9uL2hibF9jbi5jDQo+
Pj4gQEAgLTAsMCArMSw1OTU0IEBADQo+PiDigKYNCj4+PiAraW50IGhibF9jbl9yZWFkX3NwbXVf
Y291bnRlcnMoc3RydWN0IGhibF9jbl9wb3J0ICpjbl9wb3J0LCB1NjQgb3V0X2RhdGFbXSwgdTMy
ICpudW1fb3V0X2RhdGEpDQo+Pj4gK3sNCj4+IOKApg0KPj4+ICsgICBtdXRleF9sb2NrKCZjbl9w
b3J0LT5jbnRfbG9jayk7DQo+Pj4gKyAgIHJjID0gcG9ydF9mdW5jcy0+c3BtdV9zYW1wbGUoY25f
cG9ydCwgKm51bV9vdXRfZGF0YSwgb3V0X2RhdGEpOw0KPj4+ICsgICBtdXRleF91bmxvY2soJmNu
X3BvcnQtPmNudF9sb2NrKTsNCj4+PiArDQo+Pj4gKyAgIHJldHVybiByYzsNCj4+PiArfQ0KPj4g
4oCmDQo+Pg0KPj4gV291bGQgeW91IGJlY29tZSBpbnRlcmVzdGVkIHRvIGFwcGx5IGEgc3RhdGVt
ZW50IGxpa2Ug4oCcZ3VhcmQobXV0ZXgpKCZjbl9wb3J0LT5jbnRfbG9jayk74oCdPw0KPj4gaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTAtcmM0L3NvdXJjZS9pbmNsdWRlL2xp
bnV4L211dGV4LmgjTDE5Ng0KPg0KPiBIaSBNYXJrdXMNCj4NCj4gV2UgZGVjaWRlZCBmb3IgbmV0
ZGV2IHRoYXQgZ3VhcmQoKSB3YXMgdG9vIG1hZ2ljYWwsIGF0IGxlYXN0IGZvciB0aGUNCj4gbW9t
ZW50LiBMZXRzIHdhaXQgYSBmZXcgeWVhcnMgdG8gc2VlIGhvdyBpdCBwYW5zIG91dC4gc2NvcGVk
X2d1YXJkKCkNCj4gaXMgaG93ZXZlciBPLksuDQo+DQo+ICAgIEFuZHJldw0KDQpUaGFua3MgZm9y
IHRoZSByZWZlcmVuY2UuDQpJIGRvbid0IHNlZSBhbnkgb3RoZXIgRXRoZXJuZXQgZHJpdmVyIHRo
YXQgdXNlcyB0aGVzZSBzbyBsZXQgbWUgZmlyc3QNCmhhbmRsZSB0aGUgbmVjZXNzYXJ5IGNoYW5n
ZXMgYW5kIGxhdGVyIG9uIEknbGwgY2hlY2sgb3B0aW9uYWwNCmVuaGFuY2VtZW50cy4NCkJ1dCB5
ZWFoLCB3ZSBhcmUgYWx3YXlzIG9wZW4gdG8gaW1wcm92ZSB0aGUgY29kZS4NCg==
