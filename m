Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E08990DD59
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9545A10E7B5;
	Tue, 18 Jun 2024 20:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="h6aSfoKY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506E010E5B5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:30:10 +0000 (UTC)
Received: from rly01d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly01d.srv.mailcontrol.com (MailControl) with ESMTP id 45I7U0Pw202661;
 Tue, 18 Jun 2024 08:30:00 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly01d.srv.mailcontrol.com (MailControl) id 45I7T5HA189093;
 Tue, 18 Jun 2024 08:29:05 +0100
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by rly01d-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45I7T2Yq187787
 (TLS bits=256 verify=OK); Tue, 18 Jun 2024 08:29:05 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pe5pw+HRmG/zaEf0C1Fk2ezIYFTQ2/pukpmJtU3va9Y9L0vOHjmyLPIh1Y9uz+kMncOmwNdZUnwGwQQxzkAciFGKF1a0oF6LNw0HhMxJ8h6WF54ROBG/esEZsbQ4kVRUoalNsIHv6D8Sv6uwtY5+CDSLfsRTdfGII53qaPUS5zDUh5bHuW402hHLwnWr2sYTAli0H1ChCL2skbHrDXJuc0bXCd1wXvL6pXmV+/kuDIBF0F5jMzb+bnXVJd44Jy45Dp5M4v/oz5qemX7nrXA0+gRHcT8DauTi/nN4I5iFx7CXeiEJXlUGeNOdYygFNDpaxOpbp8B9SRgK8G3taCr9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8emV60irwApa7v5EjvYM4a/eN4KTSxbUBSyKfITF6Y=;
 b=fFP8ElkwA1IHPu9RgZX9IMtMxXppr6RIZ6QOaBsqrvwuUzUSQLXsnYIxQKcZpzeNEY3eyt6/Ylis+0Zqhwxda+1jjKegGZTvqwHJUkDP2jvJvRWu7F1UyYrMw2pAhh2R+4BkRr6TXeKbatfBuvOHcPy8w/37FXcA5/IzsnMakzGcAX1M3UOnK36YFI9D/4OEgr2+jjZtyt3J+rsH6YEhtQaglPPoWVBlz3CboHGtc5L0LPAn0h5i8QsNKUOy3tshPbSTrUZoQAXH9glSelBcIKiZRRxeMEXRyaxMKccIgv312cpQkbY1Jdp2JfDUxM8OdTe8ouKj0Rlu87vqY+m78w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8emV60irwApa7v5EjvYM4a/eN4KTSxbUBSyKfITF6Y=;
 b=h6aSfoKYF7iWmJcEDaxVMoYYxo9z5gQeS8/xofh3ll2nNgfW8us1IdB+hVdY4j+Azd1AFpAyQJvL6umFg/7aV+o36OHolyfSzI24UyzEIchiQPAb9ymAXnGuuY3U0/RuMPTHl5dAG/UfExfE/RhqxK9/XqIfM+kodXuJuONkiS9ZFL/+Sdb42Pon/b6LEWG7HwdVZRhcNeDiUdzHcZBvgiaPMO0xWIlRkc7Por3mRHmFR6axIrd94EMdtCxf5gU5K6g7pRjVvcFfxl337LigOlk8KyDDkRD+Wkqomvz/Lcbouf4TieLsZriNN0tRvc6EVfQ2ODTo9hkj02uZMiSMWQ==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by PAVPR02MB9570.eurprd02.prod.outlook.com (2603:10a6:102:304::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 07:28:23 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 07:28:23 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Leon Romanovsky <leon@kernel.org>
CC: Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 01/15] net: hbl_cn: add habanalabs Core Network driver
Thread-Topic: [PATCH 01/15] net: hbl_cn: add habanalabs Core Network driver
Thread-Index: AQHavWrVVuRHPTgJKUqRN0LFtHgrD7HFqK+AgAX3iYCAAD1vAIABSbUA
Date: Tue, 18 Jun 2024 07:28:23 +0000
Message-ID: <405af235-e47e-476d-b3e9-b2b4d2413459@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-2-oshpigelman@habana.ai>
 <a0e8f31e-fa12-4f48-853d-16c78bce1d76@intel.com>
 <83a6029e-1e45-4ce7-99bb-a3643ddbf8ab@habana.ai>
 <20240617114818.GB6805@unreal>
In-Reply-To: <20240617114818.GB6805@unreal>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|PAVPR02MB9570:EE_
x-ms-office365-filtering-correlation-id: fe912ae4-e57a-4190-c07c-08dc8f683c9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|1800799021|41320700010|366013|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?NDB3TFJIQTk5ZHIwbXNZYVlaby92OUpFT2dlNHRMa0dubnlzRmdudnJPeVV5?=
 =?utf-8?B?ZTh3NE5zSS85aXc2cTFsWERwVzdmdlpjRHVpaGh6ZVZZMWZzMFNRU0VLd20z?=
 =?utf-8?B?ei9CQWVYcmFReVFRM2hCeUd2djZpMmRMaGFqWFVSY0x1QWljZ1hkTjJBajN4?=
 =?utf-8?B?R2g3MVY1Tjl5U0s1bzRxMllHd3lFYVZidUxTMitpS1Y4YnJlMjBtSTZmY1pl?=
 =?utf-8?B?L0crbDNsYXZobmVaNkJLNXl2cEkrMzNTVEV5UFpBb09TbDZPWkxjUG91SEZt?=
 =?utf-8?B?Vjc4cG5xVUN3VE9UVHpyeEY3THQzcGdpZFNVakJCS2grR1R1aDh1UUE4Q0pr?=
 =?utf-8?B?Mk1oa09zSDJoMnlSbHQ2bTR1YnVOSExrQS9NdysyYTVONkFvM2RxMlVJb1dw?=
 =?utf-8?B?Qll5R2Z0N05SRjhVQzViL29wTVlHMHFML2lMRWFqeE9sdmVSVG0ydmVFT1Iw?=
 =?utf-8?B?UktleFplYjNrQ0NTaEV0QjREeElLVHFibi93OHlaU3dURi9YbnltdXRQRjRp?=
 =?utf-8?B?VTVTekgxVFp3RFVpeWFUTndEV2lDdDkyclZsc2lJZTFvcStKNXJ5cDRqMHR6?=
 =?utf-8?B?SG9tQ0lLZTFPcVc3Rit5MzZ5ZEtpSUJiTytLTDRNVXh5YlVDb2l4a0h3OHQ4?=
 =?utf-8?B?U3BkK3U5Skx0d01MQllzbjNlTC85K0JxT2NycUQ0YXhhQ3BzU3c1Wk5PQmZ3?=
 =?utf-8?B?MmNWUVkyRG9QQmlmaFk1Mkt2N0FTbHFVeDBETVNaUVNlYy9lSnF2VS9iYkcy?=
 =?utf-8?B?U1lhS0g1cEVSRUdCOXpwYnovajJWejdUcDdiMnRscFFqV2pXbHBaTW8yYVZl?=
 =?utf-8?B?OGFIMDhnU1dXdldKZGJjWkdSemQ2LzRrNnJLcDAyY2tkYUNENngvZ3dRQ2xz?=
 =?utf-8?B?VlAxaHh2Nmk0bEhXSnNrVzU5QzNIV2tJMzh1Sll4cW5vdmZvdUl2SXgzNTNx?=
 =?utf-8?B?UzRtUnpBVWQ4RzRkditPWldMcTNmM1lEeEFEZmEvWXBhWFNUZmJ1ZUUyUklx?=
 =?utf-8?B?cHJiU1MwM0JuYVAvQVU4V29kYWdHMCtsNDVSTlR1cENnNjl5Z2xCSDcvMHpq?=
 =?utf-8?B?OGpJWExHSW4yRmdlSVNDRmFlUXFSUFFEK0hlMkJJRU02d210c1BiV05zZUVR?=
 =?utf-8?B?NWptMkVLT0JDdUVhQW90YkYvdnRtcjk5SEM0ekdHRTRXZU5oMDBra3ZnZ3Vv?=
 =?utf-8?B?Tk5YaERrMzdyMFRYK1J4TGoyclZuZGtGKzIzQTYwQXlLaTV1VTcwcmNMQ2xN?=
 =?utf-8?B?VDA1Z1hWQkdCazZjdDhlVVE1aE1QSE5FQzdLbDBzVnJlMFVlQ01jQjhid3hD?=
 =?utf-8?B?US9rT0pyOU1mbno5QlRxS3Vwa1JqcE1jOXlOcmtSbU9SRDBVbG5neWZaSkxD?=
 =?utf-8?B?YW4zVThSYWRaM1lyaFc1a1RxOTF3Q1FLYjJqN05nTUgrVVhaZnlYUG5nTEo4?=
 =?utf-8?B?VkR1ZFlkRzhHRlBsVnBOeFZDUUhmRmlzaWNEQlQxSVdBaGxka1h1TEZSUHZz?=
 =?utf-8?B?dGRMeW01d3Zsd3lhRXZma094SFd5T04zNmY2TWJ3N2xyRDZ4TDduSHNUWXFu?=
 =?utf-8?B?bFNrOUh6Mk0yZFh6eWJtUGdLWkx3ZmRmRDdVS205blBoR0NHdVlNUnllZXpj?=
 =?utf-8?B?UnhZakVqNGlYYTlmcGU3SnAwaDFuSGs3VEVpdm8zWmNkUlpFbTJsVjdkb2NM?=
 =?utf-8?B?Wjc5bVBVOThVMDRTNGFDKzJack13SCtteXEwTnJCa3M2ekg0ajlVRUc0QlNz?=
 =?utf-8?B?aUlCb0lCQUZxaTZLOE1IanAwZi9WQVh6ZDd6bzc5OXFWTmdzYXpnY1ViZXVX?=
 =?utf-8?Q?1Dx0uPlnfJFXHbtIELg+M0qPMBJkOcL/sNOsQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(41320700010)(366013)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXRrcUxwVnA5SmVoQ1Q3STFVTjdGSjlreXd3MytBV3RUQU9yaEsrc0VLZnh3?=
 =?utf-8?B?cXQ2dld1WmVkWFBkb2dVZUxuT01ianBmQ1dHVHozSmF1K3BiRGNGdGV6UWdO?=
 =?utf-8?B?NDRyM0FYY0x2OHpZQ3JnOG9qb1BXWVMzb3psb2tpMzcxTW9zNnJWOUlxOTBO?=
 =?utf-8?B?cHRBUDloL3p4NzIvMVFQQ3JPSERpbmhkbENSWGdxQmJRVWxmK1JTSUJ0Yjl4?=
 =?utf-8?B?MVFwUklLQVhyb1l2Q2o1SlZKdDdUVkdCM09VeXZFYUNVM2htWVJqdjF0bkd2?=
 =?utf-8?B?ak1DdmgxQldRZ0huYTJTalpWbGVnT3ZNUFg5cHA4bm04NXVvQnVBeEtORk1t?=
 =?utf-8?B?MTJRZnpScjEwd1g4WVBwdStKTWJGZTYxYkJkRXlHQ1psQkhBWmhBUDRtZGk1?=
 =?utf-8?B?eHRkYS9ESDNJaURUci9iR2VMLzJTNjhubVMzdFJycTRydjdTNXdOemlqajR2?=
 =?utf-8?B?MGx1QlhVdmJId1MxNXdSTkNicGtYSVlLOVR4LytvY2ZxbFVsaVI4Z1NKSUhD?=
 =?utf-8?B?UmNYVXF1R3VZNEV0NUhFL1NVQUplS2E5R0krZWx1Vnp1Z3JqRnRWWXdKS0JL?=
 =?utf-8?B?UmhZMHNydzRidFhZSnhDWHpQSWYwWGpMK3pyY0d0VVZ2cUhvRDhFdXM4L3lo?=
 =?utf-8?B?bk9PYjloUisrN2c0VjlwcDZGbWRFQTVHTll3Ky9uUDBaYnpIUzlCM1A5K2Mv?=
 =?utf-8?B?WnJzd2xOUXdwOEQzK2gwNVRjTVZNZ3lHcytWVGt4TVlpbjh3eGZnazhGTlNj?=
 =?utf-8?B?a1hUYkEwK2VsSkZuOWlwRkNLSm00QXo4a0UxbmtSbTZOenMyTGlWTWdsYVZy?=
 =?utf-8?B?aU9ndGlSZ1AySldyYXlMWk92Z3ZkZmk2NXVkWmFpTmVkTUhESWNLUytHdnpl?=
 =?utf-8?B?Y2RpYUlHZEtocFFabGpsMWRMYmg3bnM2Y29INzFQaVZuOVRoU0xqallreW9o?=
 =?utf-8?B?RU1KYVozSTVGNU5xZTJBVkFxUGhOc1kwazg1RHlTZUNadWhzem9tdW5CUUNw?=
 =?utf-8?B?cW1yR1M5VmtldXdNNGV0WWlRKzloTSthUE5yMmtRaDJ0ZlA3M1JWZ04wcHpt?=
 =?utf-8?B?ckNFRDY4eHBXcTVHNWxNNXVHTGh0QnoyVmFZRno5a2JuMzk3VzdPTnRtM3Bh?=
 =?utf-8?B?YThlUGxNeXRNTzBiTjdDMDZTNzlGTkJKckw3dXc1SDhNWTIrZllxcHZ6eWdJ?=
 =?utf-8?B?NmpJbHRUNDY5cUx6MmtiSGZOT3VycGh2MEZZWTZVdTlCVGpNaUhNSjY4Z1NM?=
 =?utf-8?B?M0pEbHp4WklXOFRVdVhBNmFDVThLSjBaZyt5aC9HcVVCUlhMZ1dYVUxqREd3?=
 =?utf-8?B?T1c3bm8rMDgra2NyZmJrUUh6aUluMFA5Ukl5V3pSYlFxQVJhZVF5SHcyVFBy?=
 =?utf-8?B?N2FVTHhqYUR0M01SMUl0MlNoTy8xMTJBakp5cGdGT3B4WXdXNkY3WCtkTFNy?=
 =?utf-8?B?ZHBMd0wrMXMwRzVWdm14aXM2cVZxTW50ZVo5VCt1Sm03TTd2VnZGYm5vc0ho?=
 =?utf-8?B?ZGxHNEhwOXBHbHhuRFNmZU1HSWt4REhsRkFiU2NRWndwNFBKc0E2OFQ0bXBF?=
 =?utf-8?B?UGdiNmVaclM5S1JYQ0dYY3RpN2ozNVVNcXJQZy9IQXU1N3VZbjdqTU1lRlBz?=
 =?utf-8?B?dE1xRStYaVlzNE9OemtVQzVwZTE0VGgwRGY4UmZHMmJnUWVHL3lwK0ZBNTZl?=
 =?utf-8?B?dXpPaS84SnJtL080MEowbFlCbGppUC9KdTRGcENyRUlSbU1FT2FIR3IvcUJh?=
 =?utf-8?B?cHc3SGFvbFFJTUtsY3FuZVBwbmZPZlY0TkFxOWZ6OE8zb3k3L2dNeUMzUi93?=
 =?utf-8?B?Q05teUpDdjJORStQdmY2a3dtcjBkd29TZUs0UmNUaVgzSG9jd29Sck9GTGU0?=
 =?utf-8?B?MUd5bTAyNC8rODNHOExoSEJvNUc4ZXpGRFZwbmp6VjF6bWFsM2x0L250UzMy?=
 =?utf-8?B?SDB6dFJrcXFCZ2FJVUNoV0Z6NGg1OWVSMVpHUlhiaU02d0EzZG84YUltNzRN?=
 =?utf-8?B?bThEN00xMGo3TkExZEQzRU0xMFltZmVVUTQxMVFsaHRxczM0NCtucDZRcHhw?=
 =?utf-8?B?dERCQ296V0RwSlp6d0VETnNZUG5XbitReW5XbEJhdjZGV3hlTUQycWZ5aStZ?=
 =?utf-8?Q?SfDxR1PLi4CoTvKxo9j2t9M8j?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F42CF7A4531164783A6522B221AF58C@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 3ghZ3S5welyCDp+K5lQDd6/KVQtq9oBiJVD3jxT1Qm8/l1yaZOlDcMcsHWgnt42jUVy9BaLOtKgs9LtLCkSFQZRcsK4Y3dlUhtTanSOi4/HdWL1ANepNaKz9NLq6CvT9w9at+jdUKxemnNyKClpA6VRAJXJlXCD9MGbCK/8jICfgnRN9AHTN0oQcxCjrUKbeV3I216uPBo9mWvixngyZxuTrf7x6dczqIfl+T9eCAgm0rgm+zYv1VOzHNJAYSmK8//ZXqAKEAVc71yPLO5HHFeMz9M39ZkEN3Y00kbi8WNgb56XPsxtUFuq1Wy3+le655rmgjXkQLJCyirBKfHXIZV5fJ5Nam+ocy1SL5mg8xNFWeWF4POw3QwVv/fqEBo2MZR34BKVhI+dEOIi7N312WcB4saRvmZQbtnK82qE4uMtiR6ZQcb8nQbeyoA0r58pXuCwvh6PVO6ivQmoLrJl4EgNBa/knP4bpRb/BD0h5C3idnxEDlbLLjRpa/Qd6hQN4Tq/RjS6jNuV/STY4fteXTgulOt5drs52fX9okPMb0sM2YCowLEXr8iuvqXQeEkgxaWJPlbvQIuyiLnVM+9f+E7aNwOWQGNkTGR7Paw3Rlgb3hnaIEeY929xZn+gB5jti
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe912ae4-e57a-4190-c07c-08dc8f683c9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 07:28:23.5456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ynCSlU2NIRfiYiGViJdl++Mk46HFu0cWxYz0d2j2Pdk97iQkrLhDgezGVOfpnXywp0T8g7zP85aUT38KZ7tB9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9570
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxODY5NTgwMjpGUEtleTEucHJpdjpNm5PWkgKTzPaCde75WwN7DWiQ/HqMIzJLNPpRA78g/rwvboh2kVdezHM7W8nzBWuUDiQXe96hZKQNH75OY4lj2r+1FBdxUdyi+QWYQTsEJ4penSKZiuIWIN0bc7P730z++C1MNcNWgbV4pOHQqpsF33isf5qMEVIrssAPMnrwjMWhbohqBenKJ0qq6PmEgU6HVqZadjgkIJvVszkx+wT5HdNQa+Yu1f6cMi4isgqVCbgTWWsOvsYlpLyBV6N6eFJG2Sd1UDPXHgT43mex6LAK18YNuOOnVcKy+lKG5lpmXJY3sPyimE66uLo0VN+j4cxJ8r+AIawdKNgRFjrmQEWf
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.68.1.111
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

T24gNi8xNy8yNCAxNDo0OCwgTGVvbiBSb21hbm92c2t5IHdyb3RlOg0KPiBbU29tZSBwZW9wbGUg
d2hvIHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBsZW9u
QGtlcm5lbC5vcmcuIExlYXJuIHdoeSB0aGlzIGlzIGltcG9ydGFudCBhdCBodHRwczovL2FrYS5t
cy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gT24gTW9uLCBKdW4gMTcs
IDIwMjQgYXQgMDg6MDg6MjZBTSArMDAwMCwgT21lciBTaHBpZ2VsbWFuIHdyb3RlOg0KPj4gT24g
Ni8xMy8yNCAxNjowMSwgUHJ6ZW1layBLaXRzemVsIHdyb3RlOg0KPj4+IFtTb21lIHBlb3BsZSB3
aG8gcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIHByemVt
eXNsYXcua2l0c3plbEBpbnRlbC5jb20uIExlYXJuIHdoeSB0aGlzIGlzIGltcG9ydGFudCBhdCBo
dHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPj4+DQo+Pj4g
T24gNi8xMy8yNCAxMDoyMSwgT21lciBTaHBpZ2VsbWFuIHdyb3RlOg0KPj4+PiBBZGQgdGhlIGhi
bF9jbiBkcml2ZXIgd2hpY2ggd2lsbCBzZXJ2ZSBib3RoIEV0aGVybmV0IGFuZCBJbmZpbmlCYW5k
DQo+Pj4+IGRyaXZlcnMuDQo+Pj4+IGhibF9jbiBpcyB0aGUgbGF5ZXIgd2hpY2ggaXMgdXNlZCBi
eSB0aGUgc2F0ZWxsaXRlIGRyaXZlcnMgZm9yIG1hbnkgc2hhcmVkDQo+Pj4+IG9wZXJhdGlvbnMg
dGhhdCBhcmUgbmVlZGVkIGJ5IGJvdGggRU4gYW5kIElCIHN1YnN5c3RlbXMgbGlrZSBRUHMsIENR
cyBldGMuDQo+Pj4+IFRoZSBDTiBkcml2ZXIgaXMgaW5pdGlhbGl6ZWQgdmlhIGF1eGlsaWFyeSBi
dXMgYnkgdGhlIGhhYmFuYWxhYnMgZHJpdmVyLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBP
bWVyIFNocGlnZWxtYW4gPG9zaHBpZ2VsbWFuQGhhYmFuYS5haT4NCj4+Pj4gQ28tZGV2ZWxvcGVk
LWJ5OiBBYmhpbGFzaCBLIFYgPGt2YWJoaWxhc2hAaGFiYW5hLmFpPg0KPj4+PiBTaWduZWQtb2Zm
LWJ5OiBBYmhpbGFzaCBLIFYgPGt2YWJoaWxhc2hAaGFiYW5hLmFpPg0KPj4+PiBDby1kZXZlbG9w
ZWQtYnk6IEFuZHJleSBBZ3Jhbm92aWNoIDxhYWdyYW5vdmljaEBoYWJhbmEuYWk+DQo+Pj4+IFNp
Z25lZC1vZmYtYnk6IEFuZHJleSBBZ3Jhbm92aWNoIDxhYWdyYW5vdmljaEBoYWJhbmEuYWk+DQo+
Pj4+IENvLWRldmVsb3BlZC1ieTogQmhhcmF0IEphdWhhcmkgPGJqYXVoYXJpQGhhYmFuYS5haT4N
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQmhhcmF0IEphdWhhcmkgPGJqYXVoYXJpQGhhYmFuYS5haT4N
Cj4+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBEYXZpZCBNZXJpaW4gPGRtZXJpaW5AaGFiYW5hLmFpPg0K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBNZXJpaW4gPGRtZXJpaW5AaGFiYW5hLmFpPg0KPj4+
PiBDby1kZXZlbG9wZWQtYnk6IFNhZ2l2IE96ZXJpIDxzb3plcmlAaGFiYW5hLmFpPg0KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBTYWdpdiBPemVyaSA8c296ZXJpQGhhYmFuYS5haT4NCj4+Pj4gQ28tZGV2
ZWxvcGVkLWJ5OiBadmlrYSBZZWh1ZGFpIDx6eWVodWRhaUBoYWJhbmEuYWk+DQo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFp2aWthIFllaHVkYWkgPHp5ZWh1ZGFpQGhhYmFuYS5haT4NCj4+Pj4gLS0tDQo+
Pj4+ICAgLi4uL2RldmljZV9kcml2ZXJzL2V0aGVybmV0L2luZGV4LnJzdCAgICAgICAgIHwgICAg
MSArDQo+Pj4+ICAgLi4uL2RldmljZV9kcml2ZXJzL2V0aGVybmV0L2ludGVsL2hibC5yc3QgICAg
IHwgICA4MiArDQo+Pj4+ICAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAxMSArDQo+Pj4+ICAgZHJpdmVycy9uZXQvZXRoZXJuZXQvaW50ZWwvS2NvbmZp
ZyAgICAgICAgICAgIHwgICAyMCArDQo+Pj4+ICAgZHJpdmVycy9uZXQvZXRoZXJuZXQvaW50ZWwv
TWFrZWZpbGUgICAgICAgICAgIHwgICAgMSArDQo+Pj4+ICAgZHJpdmVycy9uZXQvZXRoZXJuZXQv
aW50ZWwvaGJsX2NuL01ha2VmaWxlICAgIHwgICAgOSArDQo+Pj4+ICAgLi4uL25ldC9ldGhlcm5l
dC9pbnRlbC9oYmxfY24vY29tbW9uL01ha2VmaWxlIHwgICAgMyArDQo+Pj4+ICAgLi4uL25ldC9l
dGhlcm5ldC9pbnRlbC9oYmxfY24vY29tbW9uL2hibF9jbi5jIHwgNTk1NCArKysrKysrKysrKysr
KysrKw0KPj4+PiAgIC4uLi9uZXQvZXRoZXJuZXQvaW50ZWwvaGJsX2NuL2NvbW1vbi9oYmxfY24u
aCB8IDE2MjcgKysrKysNCj4+Pj4gICAuLi4vZXRoZXJuZXQvaW50ZWwvaGJsX2NuL2NvbW1vbi9o
YmxfY25fZHJ2LmMgfCAgMjIwICsNCj4+Pj4gICAuLi4vaW50ZWwvaGJsX2NuL2NvbW1vbi9oYmxf
Y25fbWVtb3J5LmMgICAgICAgfCAgIDQwICsNCj4+Pj4gICAuLi4vZXRoZXJuZXQvaW50ZWwvaGJs
X2NuL2NvbW1vbi9oYmxfY25fcGh5LmMgfCAgIDMzICsNCj4+Pj4gICAuLi4vZXRoZXJuZXQvaW50
ZWwvaGJsX2NuL2NvbW1vbi9oYmxfY25fcXAuYyAgfCAgIDEzICsNCj4+Pj4gICBpbmNsdWRlL2xp
bnV4L2hhYmFuYWxhYnMvY3B1Y3BfaWYuaCAgICAgICAgICAgfCAgMTI1ICstDQo+Pj4+ICAgaW5j
bHVkZS9saW51eC9oYWJhbmFsYWJzL2hsX2Jvb3RfaWYuaCAgICAgICAgIHwgICAgOSArLQ0KPj4+
PiAgIGluY2x1ZGUvbGludXgvbmV0L2ludGVsL2NuLmggICAgICAgICAgICAgICAgICB8ICA0NzQg
KysNCj4+Pj4gICBpbmNsdWRlL2xpbnV4L25ldC9pbnRlbC9jbl9hdXguaCAgICAgICAgICAgICAg
fCAgMjk4ICsNCj4+Pj4gICBpbmNsdWRlL2xpbnV4L25ldC9pbnRlbC9jbmkuaCAgICAgICAgICAg
ICAgICAgfCAgNjM2ICsrDQo+Pj4+ICAgMTggZmlsZXMgY2hhbmdlZCwgOTU0NSBpbnNlcnRpb25z
KCspLCAxMSBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IHRoaXMgaXMgYSB2ZXJ5IGJpZyBwYXRjaCwg
aXQgYXNrcyBmb3IgYSBzcGxpdDsgd2hhdCdzIHdvcnNlLCBpdCdzDQo+Pj4gcHJvcG9ydGlvbmFs
IHRvIHRoZSBzaXplIG9mIHRoaXMgc2VyaWVzOg0KPj4+ICAxNDYgZmlsZXMgY2hhbmdlZCwgMTQ4
NTE0IGluc2VydGlvbnMoKyksIDcwIGRlbGV0aW9ucygtKQ0KPj4+IHdoaWNoIGlzIGp1c3QgdG9v
IGJpZw0KPj4+DQo+Pj4gWy4uLl0NCj4+Pg0KPj4NCj4+IFllYWgsIHdlbGwgSSdtIGxpbWl0ZWQg
dG8gMTUgcGF0Y2hlcyBwZXIgcGF0Y2ggc2V0IGFjY29yZGluZyB0byB0aGUga2VybmVsDQo+PiBk
b2Mgc28gSSBoYWQgdG8gaGF2ZSB0aGlzIGJpZyBwYXRjaC4NCj4+IE91ciBjaGFuZ2VzIGFyZSBj
b250YWluZWQgaW4gNCBkaWZmZXJlbnQgZHJpdmVycyBhbmQgYWxsIG9mIHRoZSBjaGFuZ2VzDQo+
PiBzaG91bGQgYmUgbWVyZ2VkIHRvZ2V0aGVyIHNvIHRoZSBIVyB3aWxsIGJlIG9wZXJhdGlvbmFs
Lg0KPj4gSGVuY2UgSSBoYWQgdG8gc3F1ZWV6ZSBzb21lIGNvZGUgdG8gYSBiaWcgcGF0Y2guDQo+
IA0KPiBTdWJtaXQgeW91ciBjb2RlIGluIG11bHRpcGxlIHN0ZXBzLiBPbmUgZHJpdmVyIGF0IGEg
dGltZS4NCj4gDQo+IFRoYW5rcw0KDQpJIGNhbiBwdXNoIGVhY2ggZHJpdmVyIGF0IGEgdGltZSBi
dXQgaXQgaXMgbWlzc2luZyB0aGUgYmlnIGNvbnRleHQuIEV2ZXJ5DQpzaW5nbGUgZHJpdmVyIGlz
IHVzZWxlc3Mgd2l0aG91dCB0aGUgb3RoZXJzIChvciBhdCBsZWFzdCBhIHN1YnNldCBvZg0KdGhl
bSkuDQpCdXQgSSdsbCBkbyB0aGF0IGFueXdheSBzbyBpdCB3aWxsIGJlIHBvc3NpYmxlIHRvIHJl
dmlldy4NClRoYW5rcy4NCg==
