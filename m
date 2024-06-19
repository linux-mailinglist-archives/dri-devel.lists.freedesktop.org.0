Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7498290E728
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 11:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBEB10EB77;
	Wed, 19 Jun 2024 09:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="gkAlCX3n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3B410EB77
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 09:40:03 +0000 (UTC)
Received: from rly11d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly11d.srv.mailcontrol.com (MailControl) with ESMTP id 45J9dtvM129325;
 Wed, 19 Jun 2024 10:39:55 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly11d.srv.mailcontrol.com (MailControl) id 45J9d7iQ118904;
 Wed, 19 Jun 2024 10:39:07 +0100
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by rly11d-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45J9d52G118124
 (TLS bits=256 verify=OK); Wed, 19 Jun 2024 10:39:07 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJ4JzYVRoxF8HNj9V8S9L8qs1zOVoJs90nlbfYL4Ctz037NFRg+8vvgFQR4AF40kj6OYSIjqyKOTrTXc2AWtz6Cin8YCuqZppaXJZ6jUANrnvXwUwPs8jNPSLxAn0lfdmH925nLoPOZk3fo/xU19UThOy/rIHJ3NYPN7RoCTjHSR+4Wbezxq99hy5VDyczCBXJYPaLo69cto0lQroG6DbcTpnkygLx1N0MsG5/1BG4sZhNGrV4QS0QX0CF/eahkKHS6IK0JjMwK8kkP+k2FghPWHzmaFwmq5hUNgygrTKZrxlhgQAi3hW84MRspBYGAjciyilji/RtnodD5nFiDZqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Emb6eyThU6fknUnnWLwrfyS03g15tIG//2sIS0OfNig=;
 b=gvFlG9eAz+pT75CnZDee2W345B8cU7QS+KtD8UehOKVpSqVpxwkdlirjsu7ldM6i7fMEnNcL1ify5OhdA1Cb81W+1TwiyUa4Sc2wJJkWH6+/pEnAOWmCK9wilT3n+xGTDyaaPP5VbyWfjHr71BOhVj8yy7ydpXUtDMbd2tUJh0lj1qBqfZVVpeYEXacH6Ri1ju73V0TzQ7PerUQBqr3K0kU+Vjyt+4Hs4UE2H7Z1akzxAV1eXW3+M3RlRtRY64ahqzsO+yZvlleo9QnIVsDBSCTNBwfbJPEESqDlNd4ndyjVFLrBeU5erFr0hGdheMzwgm3v0E3M2zpI1KArTOTTUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Emb6eyThU6fknUnnWLwrfyS03g15tIG//2sIS0OfNig=;
 b=gkAlCX3naGOQyyjyGalDHZXE4CcGtzpfVNCpCEsBCULnr2X71sr5saLLIWI5jdRuoK3VAeq0gqhc+whn9tlBjCHYs7OVjUsn2uq9qkbFfTITrFOPyNHLAI+8vKKirw3mQm8pmJLPrXAcNoMYU9v9kqAec2VO3mKKGsUpPpPWLgkMI+AJGi/MAF63QzIocmSLIzZVHXq1gPYFqneGZOeqCB1MJL73BZNZaxHeqa/4z7fSVK4iGKAkbrL47kWr9Nek9A0fG2W/EYKoVhw0HgXYcd04mP/jDfgwZvUM/3auptUDG4kh/LhpVMC9TKNWaWXvBPqh73XyFKGLEZipXagx9w==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by PA4PR02MB8171.eurprd02.prod.outlook.com (2603:10a6:102:260::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Wed, 19 Jun
 2024 09:39:03 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 09:39:03 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Thread-Topic: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Thread-Index: AQHavWrR8RRCkLe4k0COm3YO57oxm7HMB2AAgALW0wA=
Date: Wed, 19 Jun 2024 09:39:03 +0000
Message-ID: <f3d447b1-0a0f-4e42-bb89-a263b1466872@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-12-oshpigelman@habana.ai>
 <20240617141738.GB791043@ziepe.ca>
In-Reply-To: <20240617141738.GB791043@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|PA4PR02MB8171:EE_
x-ms-office365-filtering-correlation-id: 49da2f3d-4029-405f-864f-08dc9043a7de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|1800799021|366013|41320700010|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?VHdsL1MxZkJnVGtIb0lPdDB6ZkxzNHBSQTdqWnZSeHpRWDN3VlhUdEMybndi?=
 =?utf-8?B?cGVxRzdlTEZsV3lJSEJVZjRzWEM1QW1SSmNOZ0YwTG5XRHVpVUNTVGwvdFFF?=
 =?utf-8?B?WmM1anVxQTdkUnZXNkFxRWZiWklBWFdwTXBlZmY2TGJCYnlTWjIwRzFOdHBH?=
 =?utf-8?B?dStuT3ZXT3ZPd2FPVVEvNjI3a21hc3N5M3hXcHBJNXF3amhZbHZHQzZ1UWpy?=
 =?utf-8?B?SHI0RXRZVDdaNnI1aXBqb3ltOW9oSFdGaEp4RkJPK3AvT1VqME9xaGdHUzhP?=
 =?utf-8?B?c1JVNWY2ZWVibEtVdjJydUcwRVhkRkt3cXFKVG9pL0NoREowWGV4c0J3L3Zn?=
 =?utf-8?B?aGp2bEgxOXFQblNPcDgyVS9WcTg3R3NhcUlsYlFMWnpqUElDdDBHT2czRTNs?=
 =?utf-8?B?YXAzbHBLQWxhb2tJdm1PdHpBU0c2Z1dBcFhMWkVYY05pM0YrRFZWWEJVT0Fl?=
 =?utf-8?B?ZFQxdTk5S1ZOSHZkVzdHdloxZ1NTTDQ4VGJvTGtFTk5ENHYzclVEVWhuaSsw?=
 =?utf-8?B?bWxnRXR1Y0NxQkRyeGxydUM5MXE5REVBQjRDNGdXdVBzeEFycmF4OUg0Nndl?=
 =?utf-8?B?QjdtK2J6c3NnbUlsUzlrZm1oUEpOVXlvRS9NNEpSWkV1eGR2cXAxdENjZ2Jq?=
 =?utf-8?B?SDdwNUxxWVQzQ2EvVnE4bUo1MS9SQ0VHWGd6ekZlSm13VnN1aTllTTlkN2VT?=
 =?utf-8?B?clU1bDRjWktSS05VUkVuVFhKNjR3dXdubEJCTVphRGk4RC9kRjAxcjZWVGUy?=
 =?utf-8?B?TFgvYmwyblVESUJKQlZjcDBidVUzNTBUbjI4bzhEYnRYdS9jbGhnb0RaKzV5?=
 =?utf-8?B?eE9jRE1GeWU0SjhEeDYrdDE3MUh3Z1EvZ2gxVk8ycU9RWHBpeVRiN2U0SGsy?=
 =?utf-8?B?YU5aVHQ3amh5aFN5WGpBOVpXT3Q3RlM4OGc0VDd2eURNYjc1YWFKeFRDNUpz?=
 =?utf-8?B?d254eFg4bThldElJQ1VyRWhSVW12aGlqei8xbzArWkd6d1dpZktjS2g4bU9O?=
 =?utf-8?B?UjI5aUFkWnBidUxGQ1VFbUxwdGgwVytnb3FkVFM1UUR4cGV3aEVHdXh4QzhD?=
 =?utf-8?B?NU5uMXlETUk0b05VZnBGWDRiRTVGeGdla2RJSWtQckRHS0MvZVc4K3FtU3Fl?=
 =?utf-8?B?ODlmK1NHaUVPaVJyZllJTWc5cThVTU1CMUFGd1hiVC9aTzl1ZURsdWpRWEc1?=
 =?utf-8?B?ZGFscHAxRlI5WlgzQ0pUR3N5UnZ6RWpVdTlTblpTUmdJN2ZoQWZscTY4NXlK?=
 =?utf-8?B?dlBSUkVBYklVQ1VaUW9MK1dSMjdkYThaRkJycWkwVndlMHZJc2R4YW5IY2tP?=
 =?utf-8?B?anlwdzBRNnhaM0tyS1A3ejMvTytmMVN1VU1KZWEzOXhoODlOS1J6NW1TZGU0?=
 =?utf-8?B?NGNrc3d4akNoYkU1TkRtK2hETUlrVmZiamk2QjNqNWU2WVBnKzNsWHlJTEVX?=
 =?utf-8?B?bk1yNURUN05ZaGJiT214bElGQlZZM0F2cVVML25oNjBIcGlZVGNaNm50UC83?=
 =?utf-8?B?a2pJSXpCWk9UUnd2SlhFeUhQd29lZGVQbHFmNy80WG5abHFOampQdXgydS90?=
 =?utf-8?B?LzBGRU54K2NvNHU2dnJxN2ZvbkR2ZjRsN1hYNE9nOWRnRy8vSmpuR3k0WWhu?=
 =?utf-8?B?Rk9qZjBtUythZ0lZZG14U3BuT0dIeVlyOS9pYW1hemxZZWZVUUpEQ3ZMenNL?=
 =?utf-8?B?cVVpOE40UnZLYlVWOXQ1VzRmNjJUd3VVcmx0b1Z0cmZlZy9TbzJIdkxQcWRS?=
 =?utf-8?B?R3grSDhhWVJ6bFIvQTZyME1lYW1yYURMbFpBNUZjOGhxcXRxQUJocGZFQ1Vr?=
 =?utf-8?Q?8BU/MfvCTB8i+xwn/GGuKBdFWnnrfxDu7YPjM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(41320700010)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TDQxcXQ5UjhHVVdjY1ZpMUFRMHM5VVpsZUZUMmtkejNiUGtBTnNrd04rTEhG?=
 =?utf-8?B?M0xFclhudG9IQS9RY1paVTBLbkNjSnZ2Njc5MTNzV0ZWdE1oWmVPOGNMY1I3?=
 =?utf-8?B?c21BR0FJbGRkaUNZcUJlRXlIM2c4YjlzdldYa2U5NUdsZlg2blpkdUJzNWtr?=
 =?utf-8?B?MGJDRTVycHJ1b1F3Z0x4bGxDcE91MmplK2Zya0cwWjVpd1VtQWJMbnlBc010?=
 =?utf-8?B?VlFPSktXNXZUcjBSTFBGYXlTRDdxeHFNWlBWSmttVkE3OTZjWkRiVWp1TmRw?=
 =?utf-8?B?VTEvTDd3SVJRVGdjSVFjYTdUNnhiNVZmd2hkSUxVc0hqRE9PMHNJbkhQcU5U?=
 =?utf-8?B?aUo0Z0dYTldlVDRocGc2L2djWEltakNBMW1nTk1VOFNydGdpYTh6Q0VNdDJt?=
 =?utf-8?B?U1lMYitHR1JIajh4MzNhTXhNM0NlRUhhc3c5dzU1S2QzZHNmTnN0NmIzK0hq?=
 =?utf-8?B?d2o1blRQdEgxUzlNWklobTFFcGUrMk10VGMxNXZtWE85WGpBdFFEcnRDNHZj?=
 =?utf-8?B?dDBIYUhLOFNhWmFRYmxBdUZURWVXNWpMVDlVQUY3OWJQcHhwaDJPQzNjNVln?=
 =?utf-8?B?cWJJWUs2aXJndGpreElNQWZtRWFJSS83dHRzUTdHa3lyODJaL2dsRkFEY3cv?=
 =?utf-8?B?R2NtdGZxZUNFdkxJNkJJNU9Hc0RlQm1NbkVnRzFJcWpEWmlPeUVzcEtyS2xU?=
 =?utf-8?B?VTdHdE5wNEhIaWNBL2N2UmlZR0NpRFQ5dHpoM3hCcWVIa3hqQzJnZTduRUdi?=
 =?utf-8?B?K3FLV3FvQUdGYkNydXZ1SjUxaVprVWtlOWdDd1lSZnRJNG9TZnV5bU1Lbk0r?=
 =?utf-8?B?OTlHZDNZem1sU0M0UzZObStRNU5vM2lYWTRXcndxQll2d0l6K1VrU0ZrSGdV?=
 =?utf-8?B?djZOa1Rwcy9rYWhWNzVYQjhTTjlGMTlMbEpqVEFBM2Z5L2VwVHgrMlZpYklp?=
 =?utf-8?B?N2tvUGt1TGMyUEFKc2hyTityNTJGOTZQOHQvZmZ0dHgxaUFMS3Z0SVJxOGg4?=
 =?utf-8?B?SDRhZ0ZoVit3a0czOWZqOWpscXVPK3htU0ZJYm5jYU95VFVzb05uRW96bTRQ?=
 =?utf-8?B?aUdNQ1o5L3VkWkREblAzelhieWxJUTZJdFJJTXRjTG80aS9ESWwzRHduTWZN?=
 =?utf-8?B?TllENGo2Sll2bmZWc2dVNlVwSGRFVTZOTURkN1Y3Tm5sT1Zhajg3YTZCY1hN?=
 =?utf-8?B?M25MY0g3R2pVMDBodWxab0xzbjZDRlFwYTZFdjVBUkRsSnZRby92cm9VVG5r?=
 =?utf-8?B?S3VlNUdGQ2dRZFlvK25WQ0M0R1pacWZ3MjVZVDczOHd5b2tKK1dHaDkvMVN6?=
 =?utf-8?B?MzlCcmh3bDJkSm1MeXBtbEoyZGJ5NWpRbkc2QUF3VUM0NWRmaE5iQlI0MTl3?=
 =?utf-8?B?QU5wUzYyOTlRb2U2MFFtUGttOXdra0hLRm9TTUt2Rk1aSWVMWlZ1ekpuS0dr?=
 =?utf-8?B?OHlXV3FJMWliRDJSTm5pOWVVK1Nqelk4UFRUSGQwQmJYTTcydERrMWx1djhq?=
 =?utf-8?B?SVhOZm9Edkt4Sm82ekdNSHFuMmwzTit1bm5WbXdjSFo5MDh2R2c1UW90cHJM?=
 =?utf-8?B?MHhNUHNobTdiVEpxNGdGbFYvaU9BWEpSM1JrcmJkcjJXUzJQZjFVNmNDbkh6?=
 =?utf-8?B?V1R0eFRpNHo4b1E1SHUwSVdiak01TU8vMWVWbXZGZXIzTG53T1JvNWlBSm01?=
 =?utf-8?B?NnZIN1JSK0paSndWWm1TVE8zT1hWUW52S2tkQmU4b0o2RE53MXBOTWJxNE9J?=
 =?utf-8?B?SGgyK1RuN0EzR3ZiUjNsMmZnVzBIU3lYYzZBWVVIMEFxL3A5c0dFSEdqNzVH?=
 =?utf-8?B?MU9QSWlZU2l3c0srQmhObVI2WDVuekM0b210anR4QXByL3BqUXlSZFJneFhi?=
 =?utf-8?B?aHY5NHBVQ1R5akNWc0U0Nm1NKzhpZWluS1hJRHF4ejNWUVJoZW4rSFE3d204?=
 =?utf-8?B?czVjQmRNdlRYRENUcGZUbmZRR3hUUWpobHVlRk1KanlwQjkrblJHWTJXS01l?=
 =?utf-8?B?U1NrS2ZmeExkRGVVYk5tWHp4NnFhTzZXQkxqOXoyN2NrU0JmNnkvUzBnUDJW?=
 =?utf-8?B?c2MwTi9ldXNMZTR0UGVHeU1CMjYrd2xPWCtuREJXTGRFTTZnRFRoTXJaOWF1?=
 =?utf-8?Q?QLHz5LlC8iKMe+KUY0OJXeXW9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A04230EE72ADE42B0E7AEC4518A8A6B@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: odEZqYU1QD7QPDY6qCTHDYp65lp/FH8VqxYuecCafi8BbIPTuDWzHmfA2IFYdKiO4lPWlLrTLeLBxHcLTlebW+HwjwcDYdB9YksVpfZHZGKAlW9L4iKeGcryO5TT6algePF4etQNfw8YcORLm6LwtGB28Cc0nhI8jgw/NYWDubxVZ+ZofFOnj3lAcsWoUrWGNV4DR/8UZMAEs0/zQgxrEiqzN3gDQ6YOR3KZlmsp24uPPiFdQPrPiHWVlgkPB6bjRykrWzH6HEUSQP8+x5xIu3B7bg1bimDhTjHEgopDH7Yx2xB2VbCuXgPyDpIcLWhBVmWeYgAoO4y+SMJvwXzLxBvjNEn3B50et+TTAweGlfOaFJTnY6s2o/pXAegMJkpOsofGRz62yrLEftUTxFJbmQKcWz1I2RWZjIvixrjNByeE1zcYniCeuINTdKfbDexZX1YTsPBRdO76P9QFzOMl9StNDekTHlPnnKEmStJfosqKTXwLl77SQ76xnEooWVqF3dznTJUCl/0EkfvL5DjzmyoHypbowaQmUkleYK6Cw5bbtS8Yf+qrtaH2LJ7nnqIWmX6uqvroIRaVyNNRxv4h7GhGXfIfuCA6MyqK70vxzBrMSWq660sGfJ5iyd/yIroz
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49da2f3d-4029-405f-864f-08dc9043a7de
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2024 09:39:03.3113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f2FJGNzgqeQZjWO7PVzRCuNXN79L8SgDDOm7Tp+TGviRGzxQU5Nuhay0A0xzTacnxrr7CZ8sWoeFq4fhZAJs+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB8171
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxODc4OTk5ODpGUEtleTEucHJpdjqWMq30IDtFRspgncM88NLmEqQLoq/16hOHcqTAZEbpql/zyRQEaxSLkR06awbGepC9xd/2Ku8cIxCt1LcWiEHTw7BTqdWm2GZC1CncKuwuADwv6l3xael3X2JJhXb4jInZvFHUS1T3ykp5PQrikjdJhohjoYqVN7sh1oS/iNtXxOSqr1NcorfbyICYEP0prveP0rfpZXXHb6d21Bm4QDKbQaCe+o0uJNT/Jj77j0Pn/+a9UwgSrk/wsqgbLO+7Un/Bv6lsxRSX1hB+pXBSEUYpOQATVuWYne7VV7gLS59ydWqqQEX8gPZtdfrk4kBN270eUv8ampgRezirVBo7gKtq
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.68.1.121
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

T24gNi8xNy8yNCAxNzoxNywgSmFzb24gR3VudGhvcnBlIHdyb3RlOg0KPiBbWW91IGRvbid0IG9m
dGVuIGdldCBlbWFpbCBmcm9tIGpnZ0B6aWVwZS5jYS4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0
YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+
IA0KPiBPbiBUaHUsIEp1biAxMywgMjAyNCBhdCAxMToyMjowNEFNICswMzAwLCBPbWVyIFNocGln
ZWxtYW4gd3JvdGU6DQo+PiBBZGQgYW4gUkRNQSBkcml2ZXIgb2YgR2F1ZGkgQVNJQ3MgZmFtaWx5
IGZvciBBSSBzY2FsaW5nLg0KPj4gVGhlIGRyaXZlciBpdHNlbGYgaXMgYWdub3N0aWMgdG8gdGhl
IEFTSUMgaW4gYWN0aW9uLCBpdCBvcGVyYXRlcyBhY2NvcmRpbmcNCj4+IHRvIHRoZSBjYXBhYmls
aXRpZXMgdGhhdCB3ZXJlIHBhc3NlZCBvbiBkZXZpY2UgaW5pdGlhbGl6YXRpb24uDQo+PiBUaGUg
ZGV2aWNlIGlzIGluaXRpYWxpemVkIGJ5IHRoZSBoYmxfY24gZHJpdmVyIHZpYSBhdXhpbGlhcnkg
YnVzLg0KPj4gVGhlIGRyaXZlciBhbHNvIHN1cHBvcnRzIFFQIHJlc291cmNlIHRyYWNraW5nIGFu
ZCBwb3J0L2RldmljZSBIVyBjb3VudGVycy4NCj4gDQo+IEknbSBnbGFkIHRvIGZpbmFsbHkgc2Vl
IHRoaXMsIEkndmUgYmVlbiB0YWxraW5nIHRvIGhhYmFuYSBmb2xrcyBhIGxvbmcNCj4gdGltZSBu
b3cgdG8gZ2V0IHRoaXMgd29ya2VkIG91dCENCj4gDQo+IFRoaXMgd2lsbCBuZWVkIHRvIGJlIHNw
bGl0IHVwIG1vcmUsIGxpa2Ugb3RoZXJzIGhhdmUgc2FpZC4gSSdkIHBvc3QNCj4gdGhlIFJETUEg
c2VyaWVzIGFzc3VtaW5nIHRoYXQgdGhlIGJhc2ljIGV0aGVybmV0IGRyaXZlciBpcyBtZXJnZWQu
IFlvdQ0KPiBkb24ndCBuZWVkIHRvIGNvbWJpbmUgYmFzaWMgZXRoZXJuZXQgd2l0aCByZG1hIGlu
IHRoZSBzYW1lIHNlcmllcy4NCj4gDQo+IEphc29uDQoNClllYWgsIEknbGwgcHVzaCBvbmUgZHJp
dmVyIGF0IGEgdGltZSBpbiBtdWx0aXBsZSBwYXRjaCBzZXRzIHdpdGggc21hbGxlcg0KcGF0Y2hl
cy4NCkl0J3MganVzdCB0aGF0IGFsbCB0aGUgNCBkcml2ZXJzIGFyZSBvcGVyYXRpbmcgdG9nZXRo
ZXIsIHRoZXkgYXJlIG5vdA0Kb3BlcmF0aW9uYWwgc2VwYXJhdGVseS4gVGhhdCdzIHdoeSBJIHRo
b3VnaHQgaXQgd2lsbCBnaXZlIG1vcmUgY29udGV4dCB0bw0Kc2VlIHRoZSBlbnRpcmUgcGljdHVy
ZSB3aGVuIHJldmlld2luZy4NCg==
