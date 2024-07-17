Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD29933796
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 09:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1145910E970;
	Wed, 17 Jul 2024 07:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="adjMm2Rk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E44510E970
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 07:09:49 +0000 (UTC)
Received: from rly07b.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly07b.srv.mailcontrol.com (MailControl) with ESMTP id 46H79OcD452747;
 Wed, 17 Jul 2024 08:09:24 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly07b.srv.mailcontrol.com (MailControl) id 46H79B38446720;
 Wed, 17 Jul 2024 08:09:11 +0100
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp17013009.outbound.protection.outlook.com [40.93.64.9])
 by rly07b-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 46H792HL444260
 (TLS bits=256 verify=OK); Wed, 17 Jul 2024 08:09:11 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8aaTV2O9Ln42cb+5w3/PUJhpExdOcroWc64uOjCepwclopS2woL6dVx+LWmp34L/pq96rLa/lHureU3vaz/IXoj1iml0liwjXurXFYLS98qMEMPMEWWnQaucCPEP1SbsXbDF5t2JHDXEURizqmOz7+KX18EWsFPaNbIZoLyt18nHGHY5lG+fX6/ceDiZGJmHJzS8FXfUFvl2CfZN6ighUi52Wdtkj5V1yJlsfBKsXn7g4H9Qof5DxW7dPfyejDm7oIh5Te3z+1sOBfei7Zz7EVUqyZsq+OXlKGztZsYrq/EnNV+ZuTkvPRgA5b51OLPJGQ6FKn38FxkbbYr8gQSWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6Qnc2Cj3zjW4tKOvy0lNtou5kiKBhn3bVJuYQkv6KE=;
 b=Z3FD8z26W9Ect8DDsC078xRTkdqZ9aKdT+fBK1BB8Rb7AMwSg68CLgJMJICIrsjs93ADO5JWZOW+9SjUDidPwgZYZgBz/BuNlpztVU4q4sGygQrhsIRhA4MBpX7WdW/v2L35JVpWDBMY1tSyWSoi0bPG3Mmh1Get8iYsbSZePYHL6kI2jccuHlcGV3vpqD1S2mWo7wZLk58DU5U856fSL0hJ5wSp1XtzfQ/Wo2rsGWL/etbumCBo9XVsLnWkRs2GexQleXCsCyyDLCxDHx3WPGpUGkl594U6tMmqXQo+3A31JZTEdFdhT6r1p3reu7VP205pGxsJpToCJA0s8qz5iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6Qnc2Cj3zjW4tKOvy0lNtou5kiKBhn3bVJuYQkv6KE=;
 b=adjMm2Rk/9V9uXaFjmAi8IpCzcW5F+rh3m3IbYP8+6tGuNmWHOQ3P4jRTOWt28z81eej5e2KX9shBL59IpMqLSgwKHT+Q2Z7vO+BeFYE5Q7UNBaj6dWoY+KmuBoJ+EYU3cxN+7nm3cmvfMn3Jkk6pjYPjVzyqNsec9jPT43mvrjNHnu9o7XxvTFWOIVvMoF0UGjUdje7ZmFOaUSweyC/zPB1FrXO+5sp1sqNq7zoua291TeHftiA9ODQRZYjbss7AzOFMx2AnX8BA0flv+pAOV4vjY0TUzfRV85uuTtOkLwbwLgmCA2j4kFrZw4+k4aAnsEaeJLiLsCQxWgdpbRGuw==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by AS4PR02MB8504.eurprd02.prod.outlook.com (2603:10a6:20b:583::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Wed, 17 Jul
 2024 07:09:00 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7784.016; Wed, 17 Jul 2024
 07:08:59 +0000
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
Thread-Index: AQHavWrR8RRCkLe4k0COm3YO57oxm7HGEhoAgAYu4QCAABaLgIABDVwAgAAexgCAAVdvAIAAF5aAgA4dOACAFi6SAIAC9PYAgANdG4CAASUGgA==
Date: Wed, 17 Jul 2024 07:08:59 +0000
Message-ID: <ca6c3901-c0c5-4f35-934b-2b4c9f1a61dc@habana.ai>
References: <20240613191828.GJ4966@unreal>
 <fbb34afa-8a38-4124-9384-9b858ce2c4e5@habana.ai>
 <20240617190429.GB4025@unreal>
 <461bf44e-fd2f-4c8b-bc41-48d48e5a7fcb@habana.ai>
 <20240618125842.GG4025@unreal>
 <b4bda963-7026-4037-83e6-de74728569bd@habana.ai>
 <20240619105219.GO4025@unreal>
 <a5554266-55b7-4e96-b226-b686b8a6af89@habana.ai>
 <20240712130856.GB14050@ziepe.ca>
 <2c767517-e24c-416b-9083-d3a220ffc14c@habana.ai>
 <20240716134013.GF14050@ziepe.ca>
In-Reply-To: <20240716134013.GF14050@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|AS4PR02MB8504:EE_
x-ms-office365-filtering-correlation-id: c4857735-a7ac-47e8-bd22-08dca62f54f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UUNJL2lrbWxRMVliMlN0Qk1LNitLUU9aTHVseitjM1NOdFNIb3BkemRFaVZJ?=
 =?utf-8?B?OUl1dzlQcU53aDdrVWJvTUNmU2RUVEhKVlpQWVlHTTV5aGJTQW9wSVR6YWtE?=
 =?utf-8?B?QWNIS1BZSEJKYlVRL2JWMk5GV2U5ZkVhZlJaWm0yVjNucTBqczlhRTlJcmQr?=
 =?utf-8?B?V0YrVGY0TXB3VXdTblQ0L1NLRDM1MGp2aVppOHJYcStPRVFjQ1FtQ0JNUWRn?=
 =?utf-8?B?ZitKR3hWZjlOS2ZCeEVodjAwM1dNZFBjbEdaN0JjVHdEUTJzb1E5bXE4akRY?=
 =?utf-8?B?RE9rcFpmYlFCbmRUbW5Sa3QvcGR2Nng5alpuMnlSWnl6VG9nY3REbEtGZjZu?=
 =?utf-8?B?ZnJBYWxXU25Ldzl5Yy82Y0l6eXlBZERZeWRsR3QwZkdGNlJ0Vmk5WWwvMkdV?=
 =?utf-8?B?c3ZHdnljbm5TamdNc0E3dVlOYjh2OXdMZ3grZ2dKMkhCK1NDNHFDL3pYTHhF?=
 =?utf-8?B?cUlwUUdiZndPemNmL1hGaUJJaVM4SlN3N1Q2eU9QMTNpalJ3cGxMQktjQi9I?=
 =?utf-8?B?T0tneTNVdEhGTlpqVG40WFZvWHpKc1lZRkswZWNDRkdsSUVFdWxCbW9pbENJ?=
 =?utf-8?B?YnErZkhjSFlXcGdyYjJTNkE2c05Ja2FZd1V4MWJ3eFdNNnBPY2tSSWp2aWdr?=
 =?utf-8?B?TVpTNUVTWnRqWnRac3hkWGpzN1dZQUtNcGxHVXFXckwwdGJyMGF5T1VlTkZK?=
 =?utf-8?B?UFhzeitzdjFINFozTVVMTEVhbUhKZnJLUVhCeEZieitrVWIrdllSK2RZYzVS?=
 =?utf-8?B?SFcweTE2R1cvTDBPWGxDeHRCd0Y2U0pHM0NxOW5uanpZTnlMM2pSc0huTlFI?=
 =?utf-8?B?dVFXdlF0WUpteEc1c3VaQi9rSHRlUFVzNDBkWDhPeWVlRXBmcEpaUmk5SW1n?=
 =?utf-8?B?eTNjUS9mRzQ2cGNFU0xLdkRFL3pjekpmSXNlbXJMUGcwU0h1MmUyVzlZYUNS?=
 =?utf-8?B?S3crMHdBMkNWQ3U2am5CcUFQZXpQZjVROSt4RHhnWmE0Qjh6dWFWeDNXRUdz?=
 =?utf-8?B?Y3kwUUpuQ3ZSSU9wOE5pQk5MQnNLRjZXaURlbFNGb216WGJhYjdoanVnZURj?=
 =?utf-8?B?Tnd6SVFmdGdkZjBDQ05hMnAwRm1tVk5CQk5qNXpiSHBvNjEyYWFWU2tveEdC?=
 =?utf-8?B?cWRLWlh3cnVTeUNwS3BGV3VJZnVGN2pENUZyUzErL3I4TE9PZVpnRW42OFdX?=
 =?utf-8?B?YUdrc2FuUXFnZ0NMVDlrYy9CcENiSmxQM2pycFA1QTl6aXdXT2Q4ZkNVTEhu?=
 =?utf-8?B?S1U1SlZZYVhhOWpvbmxMNUZpdTFvUU0rUEpQZUNUWmVaYUVhYzBmYnBFbTdU?=
 =?utf-8?B?Q25yUW5pVDR1ZGtPelFmNEFFUE5NaXYvdEVwWmdncEZzbVp2dVZqN1JiY2pF?=
 =?utf-8?B?YklnaW93enBmNW9DYy9Nb1NSM292QnMyV1JVU1FoQjRPZENyWEZrTzl2c0Ro?=
 =?utf-8?B?dlVIQllkeStiMVJnVmFCNGlkcGphV3VlU2VvcDh4U21MYlRVRkI0SXgxSVdN?=
 =?utf-8?B?N0ptck5uajdqNkY5NDNyekZyWmpGZXNSMStQUDZtTEsxL2ttL0l1bUY2NVFH?=
 =?utf-8?B?cDJzUjgrcHlVdDZUalNNNEQrMnM3U2JFRFRQVW5IelA0Q0d6ZWh4NC9IcldG?=
 =?utf-8?B?ZjRNZ2ZBazdYRWN6Y2J2bkJsdkwwQ0M4NHNpVm9rTTFkV0pMc3MwT3V1Um5l?=
 =?utf-8?B?a1FDZktxSlkrMUs1WDBFbnZZQ2E4L2w3dGV5emxhd0RtWmRQT1RhaTZYeUxJ?=
 =?utf-8?B?Y2VBcGp0dE9Gck1JU3ZRUS8wVHBtNVVhUVQxbHNiRDFIQ1pXTVhxZ2d6SEpL?=
 =?utf-8?B?SG9NVU9WWkFBbkc4V1VDN3RUcWlOV2QwSk50ZzBoRGwyM0NWTkFtR1M4UFZn?=
 =?utf-8?B?RlZaQTZQVStLcWVBRm8zSlM4cTdRS0ZPaXJ2YU5QZ1h0SHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dE0rdThaWGFBNUZtaGpjVHVWUVRHZUlQMHdhYnFKeEVOc3dvdjQ2RlFNcVFs?=
 =?utf-8?B?OWVYamlnVzFHMFo4TzM0SFlPMVc3elJaQUl4SmZTSWFPazNncnJGL1F1bnlT?=
 =?utf-8?B?OVI4MlFpaTMvN0ZwZHNENFQvc3BXaDhjSXJkZG9SOW1LaVc3MWNVc2FIc1Nx?=
 =?utf-8?B?TXRrWlVIY1NlUmJHTDhGaDhRVkM5b0h5UXVBR3RxZ2hCZTZjZ2ZRTWhLUjlM?=
 =?utf-8?B?dWdnY1JHSW5YeWUzUlhBRTN1bU9NMlU1UTYzQUhaWjY0Zlk5VndHMW9Wd3ZR?=
 =?utf-8?B?VVpsQUtmbDF0ZldYcnNnSTlqOVk4eFkzTWVrcjU3ZFJDZXB1eFVyR3RrMmZs?=
 =?utf-8?B?NjdENnBudTB0NXBOSmlGa3FRTGpoUkhZRzFVVHRFQ3ZZQ0dLVmJBaGdGTnBj?=
 =?utf-8?B?MGJFSGxyaVNXQlZaV0locU0yVzZEcDdJWEU1UEF3OXljR01TSlhrcVJod0sw?=
 =?utf-8?B?RE1DUUxIUXR0SXdKcS9lWmQ0eUhzN0dETmlpZTRPbncrS2ViSUNHTC93Yys5?=
 =?utf-8?B?UGFLQWNTM09sVE5ienZuZm5NQnRJa2o5emdwU3JsMTlNb3A5bmczWXpaSGE0?=
 =?utf-8?B?cmxkbmNidWpSUVl0SHBFVU5XMm5SOUFpZWg2WGwzL2J1VjVodlEzZnZ1ZGlX?=
 =?utf-8?B?eTFsbXpldHk1QitmN1V1YXZCbHJqcWNmQ1liYWtucHBrRFY5UmxUOGZ6VTdF?=
 =?utf-8?B?d3d4WlFVSE9uQk8wdjBvTTlraThaalpKQ2FKblBsQkdOdG5FYXp1TGhUK1R0?=
 =?utf-8?B?VlZ4dGNjbFEwUTRSRHRYRDVxSFU4KzJVOVJveVN3WDlkN2lrTTBhcURLQWts?=
 =?utf-8?B?L1J1VzZUcHVJc2NwTEt3TmtQVXowM1V5ZFB5R2NaNCtHQ2tCK21pWFd5Yitx?=
 =?utf-8?B?THd1UXMyTGdIdnprdS9zVXgvVDBRckQ3RmRBYlIzZTV5Vnl5dHpJaWNiODYx?=
 =?utf-8?B?RGZRdnNFWlhEV1VNR2hMODFiSHpndFJVb3Z0ZVpJYnphVThiWmw4WjFTWFNK?=
 =?utf-8?B?ZHBQWG1ybWY4Y3hMQ3hFZ2ZDUmZqdUJTUHo0OVNNZmxrWndPcW5COXdwOGo4?=
 =?utf-8?B?VDJhS3dISmd3aVFPL2xiVlN3bFM3MWUrMEdtRzJhNE9uc3N5T3NveEVYb1M2?=
 =?utf-8?B?aTNPRGU5MERnR3VFWmZwdnBsYXJxcHB3b3cwUXJJNkxiZXNqS29nb0x2U213?=
 =?utf-8?B?Z1NoQk51bGRBYjBZWFhuNnJoOXNVUklCREVGWVVzN0NBWXB6V3N6MDYxOEh1?=
 =?utf-8?B?TkhHblhYbVJOOFF1VWtOTjFsUktUNFFWMUpnUlkvSFB1Qmpab1gyZGlxL1VU?=
 =?utf-8?B?SnBEanNiWmx6c2g2YkhiTlBIZEUwaHZ6M3lNMmdmL2RhTlFUZ0FwVFRIMTFp?=
 =?utf-8?B?VHZldkJKVEhjWmVBVCt2WVlYc1ZpTzV2UEF0R21FR3QxODVmTmlyTDRrS0Ja?=
 =?utf-8?B?R0hEbWM1VFU2eVhIODFIeHY1ZkpWZTVsV0hpa05KaVlKTjJtMW5MTGtSR1FB?=
 =?utf-8?B?N0tRUWFobDMya1ppK1lBajZUVDczdUJIWUxhdi8wU2tCVEdLaTR3SkFpcVpZ?=
 =?utf-8?B?dTc5Wm03Ti9vZlBMczBZcmpzeUpHNWNkWnRybmYrMFZZVzRFbkU3RXgrU216?=
 =?utf-8?B?WXlEbTlvU0VoR1k4Z3AxQi9rQ21YRjF0SXFXYlJ5djlOeUk5Q1hreUxILy8z?=
 =?utf-8?B?WEpJaG05Zmw2S0xVSkdhdGozWmltTWdpbU0wMEVJdGVBTE1VWVNTaTltc0dj?=
 =?utf-8?B?NXRMaFNKbkdJcER4dXl3OFVIak1nakZ3VlgzbUUzTTd3K0ovYk5kdlB1Yzdr?=
 =?utf-8?B?WnFYZHBYbi9xclNtQXd6ZmxaZVJjdWxNc25PbHlUaTNhbTV4TzM0VXQ3Y1pN?=
 =?utf-8?B?WGtZUlBjS3c5dHdLOWRzN2NQRnc0Y2dwRm5OYXNoYjN5M1BNOEhZMEtFR01s?=
 =?utf-8?B?SEhMOGxrd1RpNjc3WUVucUpiNnUyT1drTnpLNllIN05wQksxMGNjUTRZTGRt?=
 =?utf-8?B?Uzh3N240aVcrS0FRVlpmOTVNOVFkMm4wM2pIeFJONUljeVBPUm4xcWdTbExr?=
 =?utf-8?B?bW1PcWVJcUFNMXFXQWx1bmhERkRkZEwwYWdsMmFOU2t6OGgwYVd0S0Ewdkw4?=
 =?utf-8?Q?vKUGr8onJcMLlzhBwpN1MHp1O?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BED8416E97E7E44286BEB39E2534EA96@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ItPUGvWLOr89TVYlz3RvyV9xNaM35fQnrOx9M7GI38oZT1Pbtb+I7Kl/H9cVoMxlnOEUpgZKsdW2/Hjcl+/Ln14yBIOC8ZtZknnIcZOGYggxf58KqRHNlPaiV/U0JMFOXvs6aITi1Nu3k8JgmIlxO4QujINFLfSNkg+avVqZFCl39o6+A5uNoQ1igf/piF5YnqDVb4romCIdTH2S46g+uRUaGddZC2vdBrAj5i4t51m930MUF9Wc9l93qXBYpHdI4eqwUT58JaTNxWfH/+m6cpxiWCXv8ka0RNAPOkKUFXaBIpMaCKrujB9WtqR//upRyBDlyyMbNyo29uSb4On914qfrvJ4d2c/IFqf7YpxkwU7atyFc3R0NlCWwDHd20FtBDoWJlFJgb8D2wZMGWpVfbRYcFATzMeAzvdAiyZ8k5XDpRbbvmYMsOSXtzMwCxCqkCbJ10FF1S723uSSBJwUxw47x9POb7OcxZeuDLiNhfGZIFUPsBARXk9g/8AWQbo/U7U4+C7d1Y1LV9WyZ4qI4xQbPy2CNYK612srKUVk7loe7ZI9OmBUNJWNgdw6abmKxA1Qc+yZANDSDQmEfc4NLLb6nj/SoUsu1jFOh4jURodxbi9ACQh2061eHlSRUNcw
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4857735-a7ac-47e8-bd22-08dca62f54f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2024 07:08:59.8533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u77xNWPkX96Qu8SMJU+UmR8w4r+xKgUd2BmAZ1kv+oNO4YvhpfhMcoQ5AYsmYjJiUF7uQl6yydVwDfTC+pU8Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8504
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcyMTIwMDE2NzpGUEtleTEucHJpdjpkcQrJ5xNBqS/I1PI2bJjffCs+KUm3aFEyYZFnU4xINnkQLhNvz/mQ4W00gm5/iGl/g7qrZ9i/maYoOiTaPVWjIv+BLGK5Z5eWMkNpZSeQMnddPPaIYKr3anZPqSoAJoHd0ftJ0RCmLtWDiBjcDHFo3jmXYHMG4G6a03LIx46ih73tBffiSsDxflPaF4Quf4pAFPObsWTiPgYoghhDO4ZSa5Z3OTAEZqKOPZn5qNMrSgqoU4bT3zk/GCDUjXkiOSuG7yWXE66Dom3Us5hLJ3Xl3IUNCduStZ/TDkBo2r+8PuzOKU4WNKBZ/h/9HbxzfViR1Outodfrn600Kf58NV2h
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.66.1.117
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

T24gNy8xNi8yNCAxNjo0MCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOg0KPiBPbiBTdW4sIEp1bCAx
NCwgMjAyNCBhdCAxMDoxODoxMkFNICswMDAwLCBPbWVyIFNocGlnZWxtYW4gd3JvdGU6DQo+PiBP
biA3LzEyLzI0IDE2OjA4LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6DQo+Pj4gW1lvdSBkb24ndCBv
ZnRlbiBnZXQgZW1haWwgZnJvbSBqZ2dAemllcGUuY2EuIExlYXJuIHdoeSB0aGlzIGlzIGltcG9y
dGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0K
Pj4+DQo+Pj4gT24gRnJpLCBKdW4gMjgsIDIwMjQgYXQgMTA6MjQ6MzJBTSArMDAwMCwgT21lciBT
aHBpZ2VsbWFuIHdyb3RlOg0KPj4+DQo+Pj4+IFdlIG5lZWQgdGhlIGNvcmUgZHJpdmVyIHRvIGFj
Y2VzcyB0aGUgSUIgZHJpdmVyIChhbmQgdG8gdGhlIEVUSCBkcml2ZXIgYXMNCj4+Pj4gd2VsbCku
IEFzIHlvdSB3cm90ZSwgd2UgY2FuJ3QgdXNlIGV4cG9ydGVkIHN5bWJvbHMgZnJvbSBvdXIgSUIg
ZHJpdmVyIG5vcg0KPj4+PiByZWx5IG9uIGZ1bmN0aW9uIHBvaW50ZXJzLCBidXQgd2hhdCBhYm91
dCBwcm92aWRpbmcgdGhlIGNvcmUgZHJpdmVyIGFuIG9wcw0KPj4+PiBzdHJ1Y3R1cmU/IG1lYW5p
bmcgZXhwb3J0aW5nIGEgcmVnaXN0ZXIgZnVuY3Rpb24gZnJvbSB0aGUgY29yZSBkcml2ZXIgdGhh
dA0KPj4+PiBzaG91bGQgYmUgY2FsbGVkIGJ5IHRoZSBJQiBkcml2ZXIgZHVyaW5nIGF1eGlsaWFy
eSBkZXZpY2UgcHJvYmUuDQo+Pj4+IFNvbWV0aGluZyBsaWtlOg0KPj4+Pg0KPj4+PiBpbnQgaGJs
X2NuX3JlZ2lzdGVyX2liX2F1eF9kZXYoc3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgKmFkZXYsDQo+
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGhibF9pYl9vcHMgKm9wcykN
Cj4+Pj4gew0KPj4+PiAuLi4NCj4+Pj4gfQ0KPj4+PiBFWFBPUlRfU1lNQk9MKGhibF9jbl9yZWdp
c3Rlcl9pYl9hdXhfZGV2KTsNCj4+Pg0KPj4+IERlZmluYXRlbHkgZG8gbm90IGRvIHNvbWUga2lu
ZCBvZiBkb3VibGUtcmVnaXN0ZXIgbGlrZSB0aGlzLg0KPj4+DQo+Pj4gVGhlIGF1eGlsaWFyeV9k
ZXZpY2Ugc2NoZW1lIGNhbiBhbHJlYWR5IGJlIGV4dGVuZGVkIHRvIHByb3ZpZGUgb3BzIGZvcg0K
Pj4+IGVhY2ggc3ViIGRldmljZS4NCj4+Pg0KPj4+IExpa2UNCj4+Pg0KPj4+IHN0cnVjdCBoYWJh
bmFfZHJpdmVyIHsNCj4+PiAgICBzdHJ1Y3QgYXV4aWxpYXJ5X2RyaXZlciBiYXNlOw0KPj4+ICAg
IGNvbnN0IHN0cnVjdCBoYWJhbmFfb3BzICpvcHM7DQo+Pj4gfTsNCj4+Pg0KPj4+IElmIHRoZSBv
cHMgYXJlIGp1c3RpZmllZCBvciBub3QgaXMgYSBkaWZmZXJlbnQgcXVlc3Rpb24uDQo+Pj4NCj4+
DQo+PiBXZWxsLCBJIHN1Z2dlc3RlZCB0aGlzIGRvdWJsZS1yZWdpc3RlciBvcHRpb24gYmVjYXVz
ZSBJIGdvdCBhIGNvbW1lbnQgdGhhdA0KPj4gdGhlIGRlc2lnbiBwYXR0ZXJuIG9mIGVtYmVkZGVk
IG9wcyBzdHJ1Y3R1cmUgc2hvdWxkbid0IGJlIHVzZWQuDQo+PiBTbyBJJ20gY29uZnVzZWQgbm93
Li4uDQo+IA0KPiBZZWFoLCBkb24ndCBzdGljayBvcHMgaW4gcmFuZG9tIHBsYWNlcywgYnV0IHRo
ZSBkZXZpY2VfZHJpdmVyIGlzIHRoZQ0KPiByaWdodCBwbGFjZS4NCj4gDQoNClNvcnJ5LCBsZXQg
bWUgZXhwbGFpbiBhZ2Fpbi4gTXkgb3JpZ2luYWwgY29kZSBoYXMgYW4gb3BzIHN0cnVjdHVyZQ0K
ZXhhY3RseSBsaWtlIHlvdSBhcmUgc3VnZ2VzdGluZyBub3cgKHNlZSBzdHJ1Y3QgaGJsX2F1eF9k
ZXYgaW4gdGhlIGZpcnN0DQpwYXRjaCBvZiB0aGUgc2VyaWVzKS4gQnV0IEkgd2FzIGluc3RydWN0
ZWQgbm90IHRvIHVzZSB0aGlzIG9wcyBzdHJ1Y3R1cmUNCmFuZCB0byByZWx5IG9uIGV4cG9ydGVk
IHN5bWJvbHMgZm9yIGludGVyLWRyaXZlciBjb21tdW5pY2F0aW9uLg0KSSdsbCBiZSBoYXBweSB0
byB1c2UgdGhpcyBvcHMgc3RydWN0dXJlIGxpa2UgaW4geW91ciBleGFtcGxlIHJhdGhlciB0aGFu
DQpjb252ZXJ0aW5nIG15IGNvZGUgdG8gdXNlIGV4cG9ydGVkIHN5bWJvbHMuDQpMZW9uIC0gYW0g
SSBtaXNzaW5nIGFueXRoaW5nPyB3aGF0J3MgdGhlIHZlcmRpY3QgaGVyZT8NCg==
