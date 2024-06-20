Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB3E90FF00
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 10:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5270C10E84E;
	Thu, 20 Jun 2024 08:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="fbDq1N1f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8214E10E84E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:36:58 +0000 (UTC)
Received: from rly17d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly17d.srv.mailcontrol.com (MailControl) with ESMTP id 45K8ajrW347925;
 Thu, 20 Jun 2024 09:36:45 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly17d.srv.mailcontrol.com (MailControl) id 45K8afYS347041;
 Thu, 20 Jun 2024 09:36:41 +0100
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02lp2105.outbound.protection.outlook.com [104.47.11.105])
 by rly17d-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45K8afHx346549
 (TLS bits=256 verify=OK); Thu, 20 Jun 2024 09:36:41 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zj5ZWLVv2EYW/ygVnDihu06DU5zIOT9+UIT10Em8MR/pFjBkN54PKvmfl5IGjjsrylkKANsVKvXI4bVl+z00xuVbBqHDv0ZAxme3Sc96sXXCQc944cHC36Rikdn/cb70kUJsYpkXi7NryX50oP4mLkqJbQBXXiWyEruRvylKnR/6mYbbAchlc6pqhEp0zqivSL2nKokaLrqTvf6aFFbGiTdbP/0an/W/RScvo7C1/zKZz6EULZPncODAhg2+qQ5Kd+CJrJwkVOxopNRxjGy0yxTcEwYeMoaD2fKr6Ptf3LKisDfXNqKBagJkfK7e5KO30gjSw8uzMKTnxfod2cQvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hTwZHVIdeBdKxuqCW0GSCup0Ce1Gv4hntF+GmQcsn8=;
 b=UypxYerQ/hvhjfePCfja4skG7XLelyTCY8jRLvFmauETG2Kiw5RzXRltjJnaqq4M5+EZM8qNKblQBCtmHSc5xcWIklhvkC+zwtIvpMFlWghbLR1JYD6cyqWX3c/2yATwCw5cU38/C1NaKypwA5MCkmxidARsn6HBgxshNJhFWYFP9OpgNj9kmI7fINome218BOaYC7W/0Fu698Qe35NgwYhlEOgWXCwz4k/j66gYwRm69Vz2D7ZiAU+O4AmpDYmBgTIt3xaAoeuSCqM0/Odwvjliba3AeR8UfITvJfZTZcfgFq+YKwziOWOnDrq0BXwugYmKMLMqfXDRSJl1B+UM7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hTwZHVIdeBdKxuqCW0GSCup0Ce1Gv4hntF+GmQcsn8=;
 b=fbDq1N1fKziEA0ICeZcidBt1MzzwMQPl4phCrCt4tqbuGAU/vfyFPdBlRS4BKegn9jjSdOkZ+OktPF9IqM4HwYD59ycDqZF1/jJgY04izXnXi/2+ye2+8ODXeDeJhA7cBvh2gDTcKBT1By4d8PZcKaAp9lh503bzBGNfWmkGntqECHFBe9jeEZhWvQBLMyzozkP8c6xMXyav/Q9K03pwOGGw2v/97XlWmKSuTgSlZCopCU+fcFb0f/r4eATw5Vk+nDtA3WXbNzubMA04DYo6cCFk/PSG1/tVwjxegzFgSQ4YTuUqNS3eKdsuSEfrETlfmxu59aMlOW+fduNNCjyk5A==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by GVXPR02MB10619.eurprd02.prod.outlook.com (2603:10a6:150:159::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 08:36:37 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 08:36:37 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Andrew Lunn <andrew@lunn.ch>
CC: Stephen Hemminger <stephen@networkplumber.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Thread-Topic: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Thread-Index: AQHavWrQgrJbi1vMQEmkq/v8mH9idrHH96YAgAX76ACAAU+mAIABG+IA
Date: Thu, 20 Jun 2024 08:36:37 +0000
Message-ID: <8ffec189-d991-4ceb-b2e0-568e67dbb7f5@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
 <20240614171618.3b65b3c9@hermes.local>
 <46806cc6-4008-467e-8ebf-cb70d1b8118c@habana.ai>
 <e45e8d84-ab71-4ac9-8e97-c2ee13629dd6@lunn.ch>
In-Reply-To: <e45e8d84-ab71-4ac9-8e97-c2ee13629dd6@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|GVXPR02MB10619:EE_
x-ms-office365-filtering-correlation-id: cd02434d-9804-499b-da5f-08dc9104197b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|41320700010|1800799021|366013|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?YUtaWEJIZkZFc1VWdzE2K0sxU0RUNjhvUHJTRmNtdEdNR0l1MzdVaWk1VXlv?=
 =?utf-8?B?RU5LNnBLeE52Z0VITUhvRzNZRmFDQitRcGkvbzRmbVpzVEpDQkZzMmJKSS9i?=
 =?utf-8?B?aytqbW1qejh1UGZCSHUxSGJWdkVYUmV5cW1EOVZkMzlPc0QrVi9FaVFFYXRa?=
 =?utf-8?B?cU52UlpRbGVGTk9BMGpuc2xKNFVIYnMrQk9QZVA2cURvTUtVd3Y1ZE1ob3da?=
 =?utf-8?B?V296eVFkNTI1VUZYWXhhZ294bE9OdnVzTnZMYkdNWTJZSUtXRDVVNnI2YzMv?=
 =?utf-8?B?KzZYTUZBTU5CN2sxT2s2Y1p5ZkJ5NVJvTGY4TG5xbFQyQWxTQnZjMXpxWktF?=
 =?utf-8?B?Y1ArVS82QVQwOHNwUWt1TGRTaVZMOHBPUXUwVlhwV2ZoN2hxWHNJbU5UbVRT?=
 =?utf-8?B?NTZPakcxdDRQcjRDVWtEZDc0L2NUODVNRGFKN2ZLOVlpbWpGV0RRQnFES3Ux?=
 =?utf-8?B?aS83LzlUSDBqZ3hwTkNwdzU1endZN3NNN1dmTktnMUw3YzFkQTB2dS9wOEFn?=
 =?utf-8?B?MUpCOUlrajJNVTlsR0kycVBGb1NzNlA1NFBuOHJXYjNzZU5JRi9QTk50MHdH?=
 =?utf-8?B?OVRyaDd5cnlDVUNZQkk5VlE4L29FU28ydWhBQk1odnIzZXZSaDNQWmgvRHVr?=
 =?utf-8?B?ejR3Z0NMQjM1VUo2cllvOXBlK1R6cDVNMWw5MFRDU0R2OEtJbVZoMkl4OWhV?=
 =?utf-8?B?U3M2SUNaa29tSEVsS1ZWaGxiaUc0cWR4L1JGdFRJVXRobHlkeHRqUG1Td3NK?=
 =?utf-8?B?dUFCclM2ZE5hMFR1cFNZUkx2K2JPaUVmZllnSW4yYTd3VVFFRWhQZk0vNWtZ?=
 =?utf-8?B?WkNFWTFVaW53RzZBVDJ3Y0RRN1pCeUhDM2dmUExCRCtHb05MV2ZSQWxMWThR?=
 =?utf-8?B?N1ovMFE2L2V1R0VhRXoxVWphbExCREZ2ZURiWGQzTnU4ei9CWHJGcEVQcXZz?=
 =?utf-8?B?c0dYNVJRekdOU2JjZzFtM21HZkNlR1Rtb0kxajY5T1l2M0lQZytVT3FiSFhj?=
 =?utf-8?B?dXM4aWNPYzJXVGJuRmZtTWlRV0daOEJBMmhBaElSZnpmQTFyR1VVZjk1V1Rq?=
 =?utf-8?B?aGEyZHRiOXp0MlBodXNiREpuMDBaRlBWR3VlV1RZUXZvS1J2UlViSTZEMURw?=
 =?utf-8?B?RG1vT3ZJL2RLWis1dVBnZ040cUJmTXY2Y3EvZWpNbko1ckRtOVVNZFpjc1lU?=
 =?utf-8?B?dmNnME1DbzhNZ3NnOExWdEJITHQwUUtJaWVNMXBCeXAvbUlBckd6RkZ0REE2?=
 =?utf-8?B?eXB6TDB2Um5aVmdNR3BIUmc5QjMwcStDMmI0ZENmUVJlaEdGYzJzYVA3NENa?=
 =?utf-8?B?M2wvU0RKMkVjZnphdXVyd3p2WlBsVnhGSVFxK0IwMjY1eFdaYTQzYVZzWjFM?=
 =?utf-8?B?QzRVZkJOcW9XbjRTYVl0a0ZQZWFiZ1Z5TWRQc3Rxa3ZFeDNjbkZlNFlYWmRX?=
 =?utf-8?B?bXptMWptSUhvMDNnL21vRSs1Z2FYUXVrZHd6WUljYUNGTzYvZHl5cjdXRitB?=
 =?utf-8?B?MjFwZ2VhWE9rVlNQcDdESERlRU1rbHIwQ2lVYkN2cjVoNWtHdWhoaUtQenBp?=
 =?utf-8?B?N1NOcldTRjdreXV5V0JDZjFvTjlQczl2K1JhNkY2a1U0dW9SVU4yYmRUcnVr?=
 =?utf-8?B?SVFKVTQ3a0JlcW9KSGQ3ZE1PaFFoN2dtT0dNWDlReUdQeS9TTE5OVmpoVElE?=
 =?utf-8?B?TVhKNW5tQkpWbWt6Njl6ZitjbCtnUUJ3cURQcWpTc0RvMEJqVU8wMVQxb09K?=
 =?utf-8?B?L2pnS3dncXZEVERTbmp3MHEzSFRxQVJPY292dzdtSTc2eUE2QndFV1ZwbWVF?=
 =?utf-8?Q?8f+l70eDDXEKUxa1r4bE5lWzNNPe99bSa+ZjU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(41320700010)(1800799021)(366013)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1N5c3VEUDBKNjZ0VldVUklPUVN1Z0pvRWp4Y0gvZlRhaUZMNFNuQ2tScCtv?=
 =?utf-8?B?N3hLdURVMFVlcGJ4dUZFTzJhbEpNWjBVT1M5QzlYQUNxK2NCUkRkTzVMOU1l?=
 =?utf-8?B?NkdnOE9aYmhiTUszam9tY1hKNzF2a0ExTk9DVFZRbEUyTEdVSDF6anhTRERG?=
 =?utf-8?B?Ry9KVUU5MlJlRGNVK1BhMDJ5VmFmbEhXRFN3RXdVZm9YbWQ0MCtJeTljWDRK?=
 =?utf-8?B?b3I5RmlJZEJKajRjOENYWDBlMnR3VDJ3Q0hETzhTTUJGY2Ntem9GTElNdkFt?=
 =?utf-8?B?aFJOUGJhbElFV3pGZ3JsdFA5bFRRTGQ5WUZqblY2VlRFTWlYa3JTUG9Fdm5j?=
 =?utf-8?B?Y2ZZbXM3cVZRdWtjaEg3T2drcjl4R014QzJlemFFTmlPSUc4WXB4TkZya0pa?=
 =?utf-8?B?K3hnQjU3L3pqaytjNEpXVmpFV0w5Y0prMXRHeHNvaXdhNDVWWVY3SG83M3hn?=
 =?utf-8?B?TE90WTRrM0xMREVaTm5PdmVCMU1yUTErQ1JiUmw2eFNCTGttbWtqbUo2ZVc1?=
 =?utf-8?B?SjRJeHpUVVIrZ2xuZE51dk5PdjVmN3UyQTU3Y3hRN25DbzZSK3ZsanIrbDVR?=
 =?utf-8?B?OG1jRExTT041YUZDalJWREcvSzNOMUgwMjRQL2YvZzJFbmtjMDFINjlvZzdW?=
 =?utf-8?B?dnVhZXVONGZhUnNZQVhBWHBjS2FoWjBQNXJYdFhLWE5FK3VKUnQ5VHdTT0ZH?=
 =?utf-8?B?MGhhTUVTUDZyQ2ErV2g0OGloUzh3QjdrTE9EU09DYnpzcVh3b3NvemVDNkNT?=
 =?utf-8?B?TXN1c2VtM2pQKzhyYm12Q2VlNmlZYmJCU0RUdDNCYWFjV2dFWUt1V3Y2V0Ur?=
 =?utf-8?B?bitXT3AxL01FVmZvd1ZnN3JtM0phSFlOMFNJU3hPWHE3a2xxTkxhbnhqVUZQ?=
 =?utf-8?B?dDMvV2dTM3k5U1laczRPMThiMmcybjdHRytlSWpxd1U2ZW1KWGNTOTdhQ3RD?=
 =?utf-8?B?c014dHM3b1NMYW12R2hrVDczNnhSbTU3aUNpejI2ckZPMWJOOGIwVHZ3ejZl?=
 =?utf-8?B?QXpWQjNuYjZQd0dVTFplYkgzTk9yYzFKd0dwcVcxSUlXWjBvbE8vVUc0S0NW?=
 =?utf-8?B?NllTOS9samNVdDQ1QkkxNTVQTEl4WE16K1gybUtDeUlFQ1hWVnZNZS93Rk9Y?=
 =?utf-8?B?bXV5Z0VmYUY4SHJQNElrRGlrK255ZjFnTEJGdGVuT0ZmNzJzclFvZ25qRllv?=
 =?utf-8?B?WVpGWUI0MjVRZHJQY1F6aTRNZ3hCN3BkdCtZcHRMZGlRMUpoTDl1R3Z4MTk0?=
 =?utf-8?B?RS9VTDVOVmttZllOKzVVY2NGb01hZWlVZllXL2Z6SkZsaTdhbkwrNjJFRG5G?=
 =?utf-8?B?bHkxaHBTTm9xN1Q3VHFHeFdFNElYZTJLVlB3M0Z5d0ZMVGJoSlAxeElLd0Zn?=
 =?utf-8?B?d1NmbWVJS3p0YkU3Z2hCdVpZYW5Hek5GUXVKSVpSMGNWZlllN1VOd1lQV1Zx?=
 =?utf-8?B?dUFIMDZjcXkzaW5pcmIrbkM2SnQxWnhNbkdqY0xWbndwV3Z4Szl0R1QwVmdJ?=
 =?utf-8?B?aXg0bnphYUFVdXI5U0hPczYrZmJKT3RtNW9Hd09oQTBtdUNhUlJxMks5bTJM?=
 =?utf-8?B?bFZNa3FqdXlCYk42OUdBcWxnYk12cGFzZE5LbUoySElRTTFIbkJyeEhTVEFm?=
 =?utf-8?B?RGtsT05uUFZiN2lBYWZLV051dXAvb2NpZ0ZJWlR0UnlmR3BScS8yQS9odnpM?=
 =?utf-8?B?cDRzT0JUU1VrT1F2Q1BXKzU5WjIxQ29Yc0FlZHgrckhuajlxOWdBM0dHclI0?=
 =?utf-8?B?KzRTeCtRdi9DSWVaNWN4WkxTV1NMOGFCdTlVbUpEUG92K0g0YmhCWnlLNm5T?=
 =?utf-8?B?aEMrTnExT3F6Z05ySVZJWFNSSkUwa3p5aTQvdHZXekJkMWNQaWV4ZWVaM3lQ?=
 =?utf-8?B?ekR4eGwzN3FSTVgra2d2UUZ3RDFoN1VlSmtvdGtPdlVDK1lrZG9ibHE3amFz?=
 =?utf-8?B?UjBDejJUNDNDdWpMZUpQOUhmTGMxc0Vsam5uK3BqM2tTbG51OHR0WWZ1eXdU?=
 =?utf-8?B?RnV2UE5NSnpzRWN1Mm5zNVFDTDZWaGpIWmltMGtlK1RtU3lGS0tKbW53WUY3?=
 =?utf-8?B?b0s2bHBhRms3UjFnemlXVXJURjRQTFpCazdWK2x3V3hQay9TbHhsQzIyeXkr?=
 =?utf-8?Q?jKctUzkXP3en4umFngQnam0dp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1FCE4AD7308219478BF27207F0B6135E@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: gMHUscI5kOhFnwIkcH4nA44Q7aiZIV6VEK3bo0LZPe0dpXSGsIBlaBC1uCrtJTFzkgmiQlUJynuW2wFkH7MEKgu+ieGRF6a6MZidpkh9fAzyTMV2AKCRe303k8bEZhTXusI/LWmw9QwJno+xjCjGTTdJoAVYkHh40bL7x9sAtZTz+PEp5dQydTvUNbTgu7NHfa7MkO3tRoM16S6JsrAkFsehMvXYj3+wii+DuhV6uAKvag4jJ6m3MBBKxbD+MMey6OLImoIfrVGrjb+Wy5j0YGMcO3UW1HIQEob0wsKchwi2yySSp+z1iaXZqaaEpEzEy5mMF5gJNusoI2lJdbL2OrwbLfDlel34uW4pCcr/SVhISFbJ5KlD86vB+E8sb2cScW0mQ6EMXPERTCfeZdCYYgltD6nA/vbESzR5e0YB5Vl6tM0/SM1GZOqYi2v8hOyvPIFwHFDT755qwk5k7z804fFrh730yYM0UPPyEI1d0ndvXe680RVjrEBaAOdVI7/qaf6SRqvHWv8GClOGOjPLgZaYYQoRHOENh/XUybHbAqRgFBRszeJAPvoGZRF4jZzUJ9EbSeWjG/DEkgoyaydLUoABhqCGDxTEVKgh8Yh6Jtt7c+fzQR2yg3JgCWzx46+Y
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd02434d-9804-499b-da5f-08dc9104197b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 08:36:37.3119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: urDwWusTfScPXJTsTxDJJ0ij8cnbyvE/N53BrOpRU4CuciCh2Z3ye5+MCX0xGtPfH2gu8jl1SrsRbH/xYMhXvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB10619
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxODg3MjYwNjpGUEtleTEucHJpdjpHwCpCDYPebOeNBnrx2ezNoYWCZNGSXzN0zuZsYugmwOVdnsGdKwgReaKgArnp7X2nhdK//UU9kl9mp93DcIM/JBQHyBTFys6Lw0uqlBekNp81jg6wQbkGoHLNcY9iOEg1ieWohzWju6roNnd2zO8CAVVzjkRKmRiKAHVPrOfzrFG4ZKRMOmF6zfsEe6DEHKt2gQn+1MTsNxufjjsi5dDDGFMY0HMrvwMYB2Ss3ROz51gkP6TuiL7U41PAiYLmgah7XEI539aBr05AOtIvoiT/zztfRsYkCndUIkRfnr1W/j5lLmTVrmyXUTfpEpFOa7tRJXHlJQ3LdDrugtVh63SL
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.68.1.127
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

T24gNi8xOS8yNCAxODo0MCwgQW5kcmV3IEx1bm4gd3JvdGU6DQo+Pj4gRG9lcyB0aGlzIGRldmlj
ZSByZXF1aXJlIElQdjQ/IFdoYXQgYWJvdXQgdXNlcnMgYW5kIGluZnJhc3RydWN0dXJlcyB0aGF0
IHVzZSBJUHY2IG9ubHk/DQo+Pj4gSVB2NCBpcyBsZWdhY3kgYXQgdGhpcyBwb2ludC4NCj4+DQo+
PiBHYXVkaTIgc3VwcG9ydHMgSVB2NCBvbmx5Lg0KPiANCj4gUmVhbGx5PyBJIGd1ZXNzIHJlYWxs
eSBvbGQgc3R1ZmYsIFNMSVAgZnJvbSAxOTg4IGRvZXMgbm90IHN1cHBvcnQNCj4gSVB2NiwgYnV0
IGkgZG9uJ3QgcmVtZW1iZXIgc2VlaW5nIGFueXRoaW5nIGZyb20gdGhpcyBjZW50dXJ5IHdoaWNo
DQo+IGRvZXMgbm90IHN1cHBvcnQgcGFzc2luZyBJUHY2IGZyYW1lcyBvdmVyIGEgbmV0ZGV2Lg0K
PiANCj4gICAgICBBbmRyZXcNCg0KV2Ugc3VwcG9ydCBJUHY2IGZvciBFVEgsIG5vdCBmb3IgUkRN
QS4gRm9yIFJETUEsIElQdjQgaXMgZ29vZCBlbm91Z2ggZm9yDQpvdXIgdXNlIGNhc2Ugc28gSVB2
NiB3YXMgbm90IHJlcXVpcmVkLiBTdGVwaGVuJ3MgY29tbWVudCB3YXMgYWJvdXQgdGhlDQpjb2Rl
IHdoZXJlIHRoZSBDTiBkcml2ZXIgZmV0Y2hlcyB0aGUgcG9ydCBJUCBmb3IgY29uZmlndXJpbmcg
aXQgdG8gdGhlDQpSRE1BIFFQcy4gSXQgaXMgYW4gUkRNQSBzcGVjaWZpYyBwYXRoLg0K
