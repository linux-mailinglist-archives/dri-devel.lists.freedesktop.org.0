Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C085933B80
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 12:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F151510EA59;
	Wed, 17 Jul 2024 10:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="kinL+bFJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306FD89C28
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 10:51:58 +0000 (UTC)
Received: from rly09d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly09d.srv.mailcontrol.com (MailControl) with ESMTP id 46HApgI0347805;
 Wed, 17 Jul 2024 11:51:42 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly09d.srv.mailcontrol.com (MailControl) id 46HApA7E340349;
 Wed, 17 Jul 2024 11:51:10 +0100
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp17013014.outbound.protection.outlook.com [40.93.64.14])
 by rly09d-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 46HAp7Gj339429
 (TLS bits=256 verify=OK); Wed, 17 Jul 2024 11:51:10 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X07R4JUt6XZ/E/rWblBL0lP1IGcT4NqIK3hPOEyBdV1DrGh8waDCiqJDWnfxhId/XeClkMG+y+M6K0GCZ83JMzaKSQ6Z+U9hFlvkNuVhC35vBRxRMAwRvdFoTbBoFkkV10+FF+ZA/AcDwmzqULWiGLC9qNx1iwGYSBYQ8HVY3Ytx3TupbKRj6FKvzjwgssH3ri895SWg52fqQt8PiPxP0pU2E9mKxgPqBhpFxWGdWUJPb+FjYan4S8WQ3ldfDLKt0YmBuLscXsmksdpYM1dTLrFmIoPt5sewYyylttridDWPijgrlEmOy2c3vFzcbf/2JlcZYabpSk3VLsVhfKE1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uh752Xa4lpTPLRYS8klIwFEbTDCHyTtiI+nNm15ZeCU=;
 b=MiIRvgk1qjehQHk8OjGY5Nps7jn8mTsNND24y7M3DZRdr2CcM0wtI3UuRVE+DnAVulpOvsso1kX7/GMHfbtusmqlN1iWIHtUmta40i8SI/YofXq0aU9FrH/siBNQ+XyEgmVjphZxkECNMB1W0os9a9lSt+bUNcfyHQQ41i9BSUWOdd1dEtruI7PNT1AyL3tgiKqCcSrDkaT+eds4d2crDAv53tZKo4WpnTxhokKW0vLuHyrZ8n3757h1i5HDfvtggs6YkTMpp3SYGUK/b6xcrwSu99I6tgylEc96fNBTiNj9Qjzt7I6UBWUx2AtnuwMQ2oMb+tcjoOlxg3VeCCIRXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uh752Xa4lpTPLRYS8klIwFEbTDCHyTtiI+nNm15ZeCU=;
 b=kinL+bFJ31MJWi7sOn5L6gsclToSellX6vBzQ6VWwBQrIVqpli2t7sZeNMiT0eNGgnVIlvBiW8YEE0gkXu4AUydUWykvDjVtoH/hDYDf4LDwXgjLY2JdnQScgkDfgFRNL5ouZIshOc4FELOFy44x/ppSOcSXkVnoEE6E4kwpUA1WynUGGRWW+HDtyO5I2lFClLC1S0cSBOd+yV+dYBPxf5A2x6v6CBW+wKTFBfWdhV5upRhvHG6lNP3xkQBXl4f861+6sY2qb3fz0IpTmlXPYmyd/nWXblaQ6Ltoj+LTK167gSaLILht5MDNyuOOVNwkTdq03whPrJaJzctrcI2p8Q==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by AS1PR02MB8185.eurprd02.prod.outlook.com (2603:10a6:20b:474::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 10:51:03 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7784.016; Wed, 17 Jul 2024
 10:51:03 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Leon Romanovsky <leon@kernel.org>
CC: Jason Gunthorpe <jgg@ziepe.ca>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Thread-Topic: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Thread-Index: AQHavWrR8RRCkLe4k0COm3YO57oxm7HGEhoAgAYu4QCAABaLgIABDVwAgAAexgCAAVdvAIAAF5aAgA4dOACAFi6SAIAC9PYAgANdG4CAASUGgIAAB5WAgAA2doA=
Date: Wed, 17 Jul 2024 10:51:03 +0000
Message-ID: <2050e95c-4998-4b2e-88e7-5964429818b5@habana.ai>
References: <20240617190429.GB4025@unreal>
 <461bf44e-fd2f-4c8b-bc41-48d48e5a7fcb@habana.ai>
 <20240618125842.GG4025@unreal>
 <b4bda963-7026-4037-83e6-de74728569bd@habana.ai>
 <20240619105219.GO4025@unreal>
 <a5554266-55b7-4e96-b226-b686b8a6af89@habana.ai>
 <20240712130856.GB14050@ziepe.ca>
 <2c767517-e24c-416b-9083-d3a220ffc14c@habana.ai>
 <20240716134013.GF14050@ziepe.ca>
 <ca6c3901-c0c5-4f35-934b-2b4c9f1a61dc@habana.ai>
 <20240717073607.GF5630@unreal>
In-Reply-To: <20240717073607.GF5630@unreal>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|AS1PR02MB8185:EE_
x-ms-office365-filtering-correlation-id: 5c57d028-62fe-4be5-7ea6-08dca64e5a6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?enZYd0VpZ3VuRVpqelpXbEFOaGZiNjgvM1J6ZE1vRjFaMjMzSUVLM1o3OXcv?=
 =?utf-8?B?OW50cXU4SXRoZ3BKaStIWUs2MDMwWmFnVzcvclIvYkhNVDRXL01oOTlwR1lL?=
 =?utf-8?B?Y2x2UWthQ3ZjUEUzYWdmWG9lNFhFZ3ZBWTY2V2U4QjRobmlJT2tkb1hTemlq?=
 =?utf-8?B?V1ZaNHh0YmNDenVJNWt5cGw5VmlRREdGZ1JRWEEvMzdwT0crU2JNckpYTWxE?=
 =?utf-8?B?NHRMMTRhWWcwMklmVHh5U24xRW5CbllKc2srdElLZTdrbHRuVG5LN3Z5U1RL?=
 =?utf-8?B?SERVMU9yZWx2T1N4bEtCZkdXcm16RkZWK1hic0t2WnhOQVBmSzBPYlhQSGwr?=
 =?utf-8?B?cHZkR1hDcHZYM3I2cXhmejhINEZKbEFMTXRJdmRKNkpkdTM2S051Tk16UjhW?=
 =?utf-8?B?R1BOVmJMUHNhK28vSnlEeXlVditFUkI5WVBLR0pJS28vZ0grSWtVNldaYk1x?=
 =?utf-8?B?MEFYK092VDJwUjVKMDRvZnZoejJkQnB1VkJnUDlML1p0YXdEazhncmIrSkFt?=
 =?utf-8?B?MWhQMWVmaEJkODl3RytRVnl4cW5oQnN4RFovMUFUc3RwclhkVDlTcDdobzhh?=
 =?utf-8?B?Tk1iWFpBMzUxb2RhOVV0SjVwdlFtdC9CTWUrNnpNSE1UaUZwQmRLbE1LaXZs?=
 =?utf-8?B?VFhxSk5uWGUzWXdmOTJ5L2IxQkpSdXZHTXJ2NHY0aHYrUDNnRHdMNXNkWUFa?=
 =?utf-8?B?MkVJbzNaVmZiempocytVMGpaK1ZDSXJJekFETWZ6NmRpWkNqN3RJN3ZqZTdH?=
 =?utf-8?B?RURveHpmam52SEtkcTF1STFQblRGY3dFdFFOdDZEWFhONDlqKzhzT0ZYaXlY?=
 =?utf-8?B?U1h5UE9YU3pHK3pSZHpNcGtSV0RXSi9vNERJb1E4ZjNOMGp4Uk9MZ2tDenc2?=
 =?utf-8?B?SlM3KzdGaHcwR2VpbkxJVEk1L0NVcG8vemtTMWtmT28xOFJLMmRnems3SlV2?=
 =?utf-8?B?SDFnZXBvaVMxSFI3Yi9BR3I4M1diUHN5WVl2Ykx0TGVhZXo0blhiYy8zSHZP?=
 =?utf-8?B?ZzB5ZWd4bFRSM0lWVGpZandrWml2ck5MN0lHTDVoZHp1RmhnR29EM08vZG5H?=
 =?utf-8?B?YnV5UHpIMVpvNzYwemVNNExCTDZ4ZW0xTG9EY29jUVErYzRoZ3NuZUtPaldp?=
 =?utf-8?B?VnIvTDhsVCt6STl3cy9DSHhFWHM3dnRMcldtdnBpdGhXaEdyc0NPUXBRVXVV?=
 =?utf-8?B?UEozUkVZRXlGRU1pL0xxYW53VzVyZjJQd0hzVW9haWJpNlUvOWxybmFNcVhu?=
 =?utf-8?B?TFMrd2ZRdGZUMVd3ODArY2JDTVF0Yjd3V0ZMZ1VMcTNSYjFZeGpFUnFpRXlT?=
 =?utf-8?B?c3AyS0NhNklGNXpXOGpXNEpLQWRDOWRuOFQxZnVoS3FySUNUOVplS0VVaUox?=
 =?utf-8?B?Y3VKd1hIN1ZadnhoQUFsdnFPeGJSVGlNVERhVERvQkthQzdEZlhXSDQzS3g0?=
 =?utf-8?B?cmpjd1FNUjdQTlIyZHlSSjRNUk9MbVFIbVdxY0NnUUlZN3psdkVkamFQNHpC?=
 =?utf-8?B?MHdMbTFmZjJURzkxYVRicmg5dHVOWW9OM3Z1WVQxcjNvN1pSeFZ2QnhvUnhC?=
 =?utf-8?B?VFR3N1ByOVF6bWp6OGRhSzczWUZsMEZUZWFwSzBaakhmaURhVmhpRlRMRDdi?=
 =?utf-8?B?NmdxT2E1SXhrWmFaOTVoTVJQNUI3MXhlbTBCdk5VTkszYmFkejhiSHhYcjhh?=
 =?utf-8?B?YlBJWC9LQXR3ZGR6RW10NFE2N2NBYmY0WEt5dis3czdQRE5JTU5MZlBjMFhi?=
 =?utf-8?B?bjF1VEVKWEZQOW5LWldZbGM2RUEvV1JqemViR054VWhNMWZCZzZTbHJ4ZU51?=
 =?utf-8?B?dU5EWkFHVjJ3Q1NyNHZSa1h6d1RwMXJMZUg0eXVnSTlKZzdvdGdEczlmbU1l?=
 =?utf-8?B?NEZXaGVXeEg2OGYzM2N5alN5TGFiMGhSVWhoS2lMUi9sZmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVhHdk9Cd2pWNVo2Tm1yZG90ZWhXblBEMFhLNDlPK3FCU0p2Mi9CeWltYzht?=
 =?utf-8?B?SWRMN2loRnBycmpQSHBqaDV0MXppYnZIQ0FsaDNqZ0JYdTJRT2RWTFA5MU1Z?=
 =?utf-8?B?aFltV1pna1puK3R6Z284THBMTS9MaVpxRlUrTFlrcWVmSFMrd2N0MmpxRXdS?=
 =?utf-8?B?NzVraTZvaWFJNlYyZVZkQjc2S1FibVVFcy9EMml6SjJZSWRRcndyY0FIcmg1?=
 =?utf-8?B?eEQyK3ZXc1N6RFdxZUk3SHNyNExtQWNVT3Jla0RLcjlKYkRaR0FuQU1ZaEV1?=
 =?utf-8?B?Smp4S2hvL1pQbkVmYlA1SzU0WXhUWTBldDI4RGZZTWlFbUV6UmFpSXRtWWNU?=
 =?utf-8?B?TEZWdmVOM1daSlgzdTc3NkIwSFBCWjgzM3hGYzVEbk55U3c0N0VKMFEycXNt?=
 =?utf-8?B?aEJHUU85Tmhwa3R4ajgwM2g1dTVWUWs3ckJKeUo4aVU5YUFmN2Y1c2hCek84?=
 =?utf-8?B?c1BIZ3B3eUdxd1kzYmFYUHFtcVJ3MnR4VjVDd1NQTWdlL3FQOEFTaktnSEFk?=
 =?utf-8?B?ZUwxWGZ5ak9lWnNFWVEvVU5XYzBQWHpwUzlVNGhBbmxnRVJUclNxTzBHMVVx?=
 =?utf-8?B?MllQdytSdDBibEwzTlNMRit4bW8yWk1tdG05bHRvOVFiNytJbSt5MzllRjdK?=
 =?utf-8?B?eHJweEhjYi9TRVVmNHJSQmN6MlhlZDFTekpBOUpuNFVBOFBwYWRJWnNmR0Jm?=
 =?utf-8?B?V2pqZnhIVmEzUU1tck9XSUZ5UDJPSnE0WWV4djJNajAvbmkydVZtSnRjVTRa?=
 =?utf-8?B?SlN1NnA0SzNqU3luR2pyVlcwTXlCZEVBQzN2aDNaQUI5OTAvUXU4V09pU3hJ?=
 =?utf-8?B?Nmdhc0FWNVlDN01SaVdwV09JN2I0aDRVbzJ2KzhYQi9UWUIvUjRhYzQweWVu?=
 =?utf-8?B?d0ZROExUVVdhMnYwTDBqOGs5RUU5bkp0cXpiM0lVOTdOYU0xZ1JKVk1DTmkz?=
 =?utf-8?B?dmNKOXhwaCtjYW5NZjRZVE9WWGVYczFFMG9LTERhUHorbXdUd0luQlhnVy9U?=
 =?utf-8?B?Vm04U0xaQjk0SWR0K2dSSUdYOE85M1BWYlZIQmtlYk44c0FtR0V0UVBqbHVZ?=
 =?utf-8?B?UW9jZzVOSzlGbjRZTkRBL0FzeWt2MUI5SU94VThsQ1lyUzdWS054RTR1NC9M?=
 =?utf-8?B?bTRNMnNNUTV5YXNLNzJqQnRxT29HVWg1VFZoaXFrblhxVk02VzZCMzBhWXlX?=
 =?utf-8?B?dnpFSkRkRkRsUU0vL3gyRHYvZTFSVmpTa0RnVy9FZW14S1RPcGJLMm0yeXEy?=
 =?utf-8?B?YkZMbDNKeHBTd3hYaDlLMmg0YXk2VmtUNFhINVpRR1U0Y1V6SVRxVHk5aFBp?=
 =?utf-8?B?VFoxcmZSOVVTNHdsTHRzOFllWVdFdDcwdkFDbVVTZHBYV3VYbWwzUFNqSU9L?=
 =?utf-8?B?NU1qYXZNVE5rR2pzT3djZW8rWmFRMU1lcFVVejNOb2crZTlqeGFnZ1VlWDl5?=
 =?utf-8?B?dms4K285RjQ5TUpkT1ZIa1V2eEwxeGw1ckhiTDZtMXBnamtFMm1uRnhuTDBK?=
 =?utf-8?B?ZzNWWEFQWXRITEV4bkRjOUgrd0E5cjFaMk9QR080V0Flekx2b3hmL2NUc0tN?=
 =?utf-8?B?dDl1MkNNdjVjWDIzMU5GNTZFYTYxQ1o3aHBPelR5c2hVZDJZZHRndHhWc3dO?=
 =?utf-8?B?YWJ2Nmp0RGtaeXh2azA4REVQb2RQMlIzRmwreFh0c1BBSzlFbUxENFVHQ3hu?=
 =?utf-8?B?ZGt6ZVVTR0FTQk8vRkpEUmZ1Slcrcit1c3Q0V3lxWEk2em1yY0Z5dTAzazVp?=
 =?utf-8?B?cWJ0c3hrWVM4NENISmsyaFZZa0tXWWxEME92VDZPVTdpV0JvdXc5anNralgw?=
 =?utf-8?B?aHlMNTJMQnFCSzlyTTV1aVVERExqZDkvZzRFMWxGczZLZm9mV004TlNRZTJY?=
 =?utf-8?B?QU9pWm5JZCtwdmxvRzcyQVkwNTBoZzlaaVZROThlOWFPN2h4VUtHVTRiTjhE?=
 =?utf-8?B?RythenBhNnV0cTRvSTRDNVUzNE5MQjhTWkdDc0hMZVFWMU9ZblRycmZ3ZFNL?=
 =?utf-8?B?UDIzUzVkRTR0eHdzMVBLM0NTMzNIZzJiTU9JclA1aGIrZjRYVWE0M0puZG0r?=
 =?utf-8?B?T0poWllzdDQxZ3VWaURRZ09hc0pjbDQ4SnlBRXRYWHprZk42R2wxMFhFcTNU?=
 =?utf-8?Q?YM+k67d23jbt4xLJ7sYFfHTRT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CAD9A773C9E8D14DBCC55E9578CFCA47@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: fwZPQLqlZp5nk5YmOBTuweCdhYJNhmL6OTyodrdzPuN4KUbZMv99jR/rE82CQxWlHPrsl0TJtQpYl39q+B4LvVcB0JDRFFkMGuI3u38o8c5BgbGRwOXvdonsplNyWpGiC+SsI30QTYZqvQeqvzLIdh4vwrqD7ualt3aT8GpAOdVraxxqsdZXl7z/9e2jpRN6KZ6UTeVBIJOE+pA57qXhluLjUC4F5zGWPuYYg3CPByjzZzzkGp1jKy1H5dOdVyIf5BP8jnkf5PduOZwbRzHUs9aYM3nSrzHAJO1a9mUN3Mu459ijgFr+K+K0iT7ii0j2oMskQovNgZjPGdClX0GUEtkT9WvBEN2acwAhd7/xYOzh/PL1U5sTd53jV3srIvBFARiDYJN9lm4Zyg/8WHY2ha03mcQAeyJjMcIlRkexlyLQSIxpm1du5Pd33GcncXXZn3gf2mplGpqvG62us7gzZ5cvWzt5fSQWCwd73QNKIq41aiW8vi15KGP6xQLyzF/PdyWKtMtZPdluGQGF9ZNnZKidn7oqFPHxkhP2KETdeWfiCYdnq3hPejLYkkHSxd2tWs+8BDJyAy7iWmi4CaDKLNErgO/La1mKtysI69maJj/Clqsg2FxEmw7Dc19qPmUO
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c57d028-62fe-4be5-7ea6-08dca64e5a6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2024 10:51:03.4139 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: obeoJO3/Nc+FoanJg/1BMFZQuuQg3mw/u+rY+wL9N4NaohOzV0RYQkgbL1FAt7WXL4KGxWkhxbYBVHnFP3e/eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR02MB8185
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcyMTIxMzUwNTpGUEtleTEucHJpdjqjofvIPM94wXBjyatZKskhMJ5Ny6muKse4+/ueSC/DklpqgtBhN+tlNPgYvrI+hFWPkdIhSSziZSdUvihcyVBSWOawRHg8t46o5m8GjW60hEdyzQ+ko4wsaJdfr2bUappAj9hU9X0DY8eGeBFMSFWLeqJu/uHcfJom8AYZ+v1RBSb7gCU2mZUgoU+LKSEKwlCTtqVOi8FlCPnGzjd+kla4qnouUH74a8AlwvJTwHXkAyiczcUw/i1FlD/bNZ+knT79lbFbnStx7pe20X1NnaUtf1pcX/b8avsqgsR+7L+km2vArUacMQfaRI3LSkrK8p/AhoKy0st5pPc1JTF9oIdr
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.68.1.119
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

T24gNy8xNy8yNCAxMDozNiwgTGVvbiBSb21hbm92c2t5IHdyb3RlOg0KPiBPbiBXZWQsIEp1bCAx
NywgMjAyNCBhdCAwNzowODo1OUFNICswMDAwLCBPbWVyIFNocGlnZWxtYW4gd3JvdGU6DQo+PiBP
biA3LzE2LzI0IDE2OjQwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6DQo+Pj4gT24gU3VuLCBKdWwg
MTQsIDIwMjQgYXQgMTA6MTg6MTJBTSArMDAwMCwgT21lciBTaHBpZ2VsbWFuIHdyb3RlOg0KPj4+
PiBPbiA3LzEyLzI0IDE2OjA4LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6DQo+Pj4+PiBbWW91IGRv
bid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIGpnZ0B6aWVwZS5jYS4gTGVhcm4gd2h5IHRoaXMgaXMg
aW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlv
biBdDQo+Pj4+Pg0KPj4+Pj4gT24gRnJpLCBKdW4gMjgsIDIwMjQgYXQgMTA6MjQ6MzJBTSArMDAw
MCwgT21lciBTaHBpZ2VsbWFuIHdyb3RlOg0KPj4+Pj4NCj4+Pj4+PiBXZSBuZWVkIHRoZSBjb3Jl
IGRyaXZlciB0byBhY2Nlc3MgdGhlIElCIGRyaXZlciAoYW5kIHRvIHRoZSBFVEggZHJpdmVyIGFz
DQo+Pj4+Pj4gd2VsbCkuIEFzIHlvdSB3cm90ZSwgd2UgY2FuJ3QgdXNlIGV4cG9ydGVkIHN5bWJv
bHMgZnJvbSBvdXIgSUIgZHJpdmVyIG5vcg0KPj4+Pj4+IHJlbHkgb24gZnVuY3Rpb24gcG9pbnRl
cnMsIGJ1dCB3aGF0IGFib3V0IHByb3ZpZGluZyB0aGUgY29yZSBkcml2ZXIgYW4gb3BzDQo+Pj4+
Pj4gc3RydWN0dXJlPyBtZWFuaW5nIGV4cG9ydGluZyBhIHJlZ2lzdGVyIGZ1bmN0aW9uIGZyb20g
dGhlIGNvcmUgZHJpdmVyIHRoYXQNCj4+Pj4+PiBzaG91bGQgYmUgY2FsbGVkIGJ5IHRoZSBJQiBk
cml2ZXIgZHVyaW5nIGF1eGlsaWFyeSBkZXZpY2UgcHJvYmUuDQo+Pj4+Pj4gU29tZXRoaW5nIGxp
a2U6DQo+Pj4+Pj4NCj4+Pj4+PiBpbnQgaGJsX2NuX3JlZ2lzdGVyX2liX2F1eF9kZXYoc3RydWN0
IGF1eGlsaWFyeV9kZXZpY2UgKmFkZXYsDQo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgaGJsX2liX29wcyAqb3BzKQ0KPj4+Pj4+IHsNCj4+Pj4+PiAuLi4NCj4+Pj4+
PiB9DQo+Pj4+Pj4gRVhQT1JUX1NZTUJPTChoYmxfY25fcmVnaXN0ZXJfaWJfYXV4X2Rldik7DQo+
Pj4+Pg0KPj4+Pj4gRGVmaW5hdGVseSBkbyBub3QgZG8gc29tZSBraW5kIG9mIGRvdWJsZS1yZWdp
c3RlciBsaWtlIHRoaXMuDQo+Pj4+Pg0KPj4+Pj4gVGhlIGF1eGlsaWFyeV9kZXZpY2Ugc2NoZW1l
IGNhbiBhbHJlYWR5IGJlIGV4dGVuZGVkIHRvIHByb3ZpZGUgb3BzIGZvcg0KPj4+Pj4gZWFjaCBz
dWIgZGV2aWNlLg0KPj4+Pj4NCj4+Pj4+IExpa2UNCj4+Pj4+DQo+Pj4+PiBzdHJ1Y3QgaGFiYW5h
X2RyaXZlciB7DQo+Pj4+PiAgICBzdHJ1Y3QgYXV4aWxpYXJ5X2RyaXZlciBiYXNlOw0KPj4+Pj4g
ICAgY29uc3Qgc3RydWN0IGhhYmFuYV9vcHMgKm9wczsNCj4+Pj4+IH07DQo+Pj4+Pg0KPj4+Pj4g
SWYgdGhlIG9wcyBhcmUganVzdGlmaWVkIG9yIG5vdCBpcyBhIGRpZmZlcmVudCBxdWVzdGlvbi4N
Cj4+Pj4+DQo+Pj4+DQo+Pj4+IFdlbGwsIEkgc3VnZ2VzdGVkIHRoaXMgZG91YmxlLXJlZ2lzdGVy
IG9wdGlvbiBiZWNhdXNlIEkgZ290IGEgY29tbWVudCB0aGF0DQo+Pj4+IHRoZSBkZXNpZ24gcGF0
dGVybiBvZiBlbWJlZGRlZCBvcHMgc3RydWN0dXJlIHNob3VsZG4ndCBiZSB1c2VkLg0KPj4+PiBT
byBJJ20gY29uZnVzZWQgbm93Li4uDQo+Pj4NCj4+PiBZZWFoLCBkb24ndCBzdGljayBvcHMgaW4g
cmFuZG9tIHBsYWNlcywgYnV0IHRoZSBkZXZpY2VfZHJpdmVyIGlzIHRoZQ0KPj4+IHJpZ2h0IHBs
YWNlLg0KPj4+DQo+Pg0KPj4gU29ycnksIGxldCBtZSBleHBsYWluIGFnYWluLiBNeSBvcmlnaW5h
bCBjb2RlIGhhcyBhbiBvcHMgc3RydWN0dXJlDQo+PiBleGFjdGx5IGxpa2UgeW91IGFyZSBzdWdn
ZXN0aW5nIG5vdyAoc2VlIHN0cnVjdCBoYmxfYXV4X2RldiBpbiB0aGUgZmlyc3QNCj4+IHBhdGNo
IG9mIHRoZSBzZXJpZXMpLiBCdXQgSSB3YXMgaW5zdHJ1Y3RlZCBub3QgdG8gdXNlIHRoaXMgb3Bz
IHN0cnVjdHVyZQ0KPj4gYW5kIHRvIHJlbHkgb24gZXhwb3J0ZWQgc3ltYm9scyBmb3IgaW50ZXIt
ZHJpdmVyIGNvbW11bmljYXRpb24uDQo+PiBJJ2xsIGJlIGhhcHB5IHRvIHVzZSB0aGlzIG9wcyBz
dHJ1Y3R1cmUgbGlrZSBpbiB5b3VyIGV4YW1wbGUgcmF0aGVyIHRoYW4NCj4+IGNvbnZlcnRpbmcg
bXkgY29kZSB0byB1c2UgZXhwb3J0ZWQgc3ltYm9scy4NCj4+IExlb24gLSBhbSBJIG1pc3Npbmcg
YW55dGhpbmc/IHdoYXQncyB0aGUgdmVyZGljdCBoZXJlPw0KPiANCj4gWW91IGFyZSBtaXNzaW5n
IHRoZSBtYWluIHNlbnRlbmNlIGZyb20gSmFzb24ncyByZXNwb25zZTogICJkb24ndCBzdGljayBv
cHMgaW4gcmFuZG9tIHBsYWNlcyIuDQo+IA0KPiBJdCBpcyBmaW5lIHRvIGhhdmUgb3BzIGluIGRl
dmljZSBkcml2ZXIsIHNvIHRoZSBjb3JlIGRyaXZlciBjYW4gY2FsbCB0aGVtLiBIb3dldmVyLCBp
biB5b3VyDQo+IG9yaWdpbmFsIGNvZGUsIHlvdSBhZGRlZCBvcHMgZXZlcnl3aGVyZS4gSXQgY2F1
c2VkIHRvIHRoZSBuZWVkIHRvIGltcGxlbWVudCBtb2R1bGUgcmVmZXJlbmNlDQo+IGNvdW50aW5n
IGFuZCBjcmF6eSBzdHVmZiBsaWtlIGNhbGxzIHRvIGxvY2sgYW5kIHVubG9jayBmdW5jdGlvbnMg
ZnJvbSB0aGUgYXV4IGRyaXZlciB0byB0aGUgY29yZS4NCj4gDQo+IFZlcmRpY3QgaXMgc3RpbGwg
dGhlIHNhbWUuIENvcmUgZHJpdmVyIHNob3VsZCBwcm92aWRlIEVYUE9SVF9TWU1CT0xzLCBzbyB0
aGUgYXV4IGRyaXZlciBjYW4gY2FsbA0KPiB0aGVtIGRpcmVjdGx5IGFuZCBlbmpveSBmcm9tIHBy
b3BlciBtb2R1bGUgbG9hZGluZyBhbmQgdW5sb2FkaW5nLg0KPiANCj4gVGhlIGF1eCBkcml2ZXIg
Y2FuIGhhdmUgb3BzIGluIHRoZSBkZXZpY2UgZHJpdmVyLCBzbyB0aGUgY29yZSBkcml2ZXIgY2Fu
IGNhbGwgdGhlbSB0byBwZXJmb3JtIHNvbWV0aGluZw0KPiBzcGVjaWZpYyBmb3IgdGhhdCBhdXgg
ZHJpdmVyLg0KPiANCj4gQ2FsbHMgYmV0d2VlbiBhdXggZHJpdmVycyBzaG91bGQgYmUgZG9uZSB2
aWEgdGhlIGNvcmUgZHJpdmVyLg0KPiANCj4gVGhhbmtzDQoNClRoZSBvbmx5IHBsYWNlIHdlIGhh
dmUgYW4gb3BzIHN0cnVjdHVyZSBpcyBpbiB0aGUgZGV2aWNlIGRyaXZlciwNCnNpbWlsYXJseSB0
byBKYXNvbidzIGV4YW1wbGUuIEluIG91ciBjb2RlIGl0IGlzIHN0cnVjdCBoYmxfYXV4X2Rldi4g
V2hhdA0Kb3RoZXIgcmFuZG9tIHBsYWNlcyBkaWQgeW91IHNlZT8NCldlIGhhdmUgc2V2ZXJhbCBh
dXhpbGlhcnkgZGV2aWNlcyBzbyB3ZSBoYXZlIHNldmVyYWwgaW5zdGFuY2VzIG9mIHRoaXMNCnN0
cnVjdHVyZSBidXQgdGhlIGRlZmluaXRpb24gaXMgaW4gYSBzaW5nbGUgcGxhY2UuDQoNClRoZSBt
b2R1bGUgcmVmZXJlbmNlIGNvdW50aW5nIGlzIHVucmVsYXRlZCB0byB0aGUgb3BzIHN0cnVjdHVy
ZSAtIHdlIHVzZWQNCml0IHRvIGJsb2NrIHRoZSBzb24gZHJpdmVyIHJlbW92YWwgd2hpbGUgdGhl
IHBhcmVudCBkcml2ZXIgY2FuIGFjY2VzcyBpdC4NCkV2ZW4gd2l0aCBleHBvcnRlZCBzeW1ib2xz
IHdlIHdvdWxkIHVzZSBpdC4gQW55d2F5LCBpbiB2MiB3ZSdkIGxpa2UgdG8NCmFsbG93IHRoZSBz
b24gZHJpdmVyIHJlbW92YWwgYmVmb3JlIHRoZSBwYXJlbnQgc28gdGhpcyBtb2R1bGUgcmVmZXJl
bmNlDQpjb3VudGluZyB3aWxsIGJlIHJlbW92ZWQuDQoNClRoZSBsb2NrL3VubG9jayBmdW5jdGlv
bnMgYXJlIGFsc28gdW5yZWxhdGVkIHRvIHRoZSBvcHMgc3RydWN0dXJlLCB3ZSB3b3VsZA0KYWRk
IHRoZXNlIGV2ZW4gd2l0aCBleHBvcnRlZCBzeW1ib2xzLiBUaGUgcmVhc29uIGlzIHRoYXQgb3Vy
IE5JQyBkcml2ZXJzDQphcmUgdGhlIHNvbnMvZ3JhbmRzb25zIG9mIGEgY29tcHV0ZSBkZXZpY2Ug
d2hpY2ggY2FuIGVudGVyIGEgcmVzZXQgZmxvdyBhcw0KcGFydCBvZiBhIFREUiBtZWNoYW5pc20u
IER1cmluZyB0aGlzIGZsb3cgd2UgbXVzdCBub3QgYWNjZXNzIHRoZSBIVyBzbyB3ZQ0KbmVlZCB0
byBibG9jayBhIHBhcmFsbGVsIHNvbiBkZXZpY2UgcHJvYmluZy4NCg0KSW4gYWRkaXRpb24sIHdl
IGRvbid0IGhhdmUgYW55IGRpcmVjdCBjb21tdW5pY2F0aW9uIGJldHdlZW4gdGhlIGF1eA0KZHJp
dmVycywgZXZlcnl0aGluZyBpcyBkb25lIHZpYSB0aGUgcGFyZW50IGRyaXZlci4NCg0KR2l2ZW4g
YWxsIG9mIHRoZSBhYm92ZSwgd2hhdCBpcyB0aGUgcHJvYmxlbSB3aXRoIG91ciBjdXJyZW50IGNv
ZGU/IHdlIGRpZA0KZXhhY3RseSB3aGF0IEphc29uIHdyb3RlIGluIGhpcyBleGFtcGxlIC0gaGF2
aW5nIGFuIG9wcyBzdHJ1Y3R1cmUgaW4gdGhlDQpkZXZpY2UgZHJpdmVyIHRvIGFsbG93IGludGVy
LWRyaXZlciBjb21tdW5pY2F0aW9uLg0KVGhlIG9ubHkgaXNzdWUgSSBzZWUgaGVyZSBpcyB0aGUg
cXVlc3Rpb24gaWYgdGhpcyBvcHMgc3RydWN0dXJlIGlzIGZvcg0KdW5pZGlyZWN0aW9uYWwgY29t
bXVuaWNhdGlvbiAobWVhbmluZyBwYXJlbnQgdG8gc29uIG9ubHkpIG9yIGZvcg0KYmlkaXJlY3Rp
b25hbCBjb21tdW5pY2F0aW9uIGJldHdlZW4gdGhlIGRyaXZlcnMgKG1lYW5pbmcgYWxzbyBzb24g
dG8NCnBhcmVudCkuIFRoYXQncyB0aGUgb25seSBwb2ludCB0aGF0IHdhcyBub3QgbWVudGlvbmVk
IGJ5IEphc29uIHdoaWxlIHlvdQ0KYXJlIGNsZWFyIGFib3V0IHRoZSBhbnN3ZXIuDQoNCkFGQUlV
IEVYUE9SVF9TWU1CT0xzIHNob3VsZCBiZSB1c2VkIHRvIGV4cG9zZSBkcml2ZXIgbGV2ZWwgb3Bl
cmF0aW9ucywgbm90DQpvcGVyYXRpb25zIHdoaWNoIGFyZSBkZXZpY2Ugc3BlY2lmaWMgKGFuZCB0
aGF0J3Mgb3VyIGNhc2UpLiBIZW5jZSB3ZSB1c2VkDQp0aGlzIG9wcyBzdHJ1Y3R1cmUgYWxzbyBm
b3Igc29uLXRvLXBhcmVudCBjb21tdW5pY2F0aW9uLCBhbHRob3VnaCB3ZSBjYW4NCnN3aXRjaCB0
aGVtIHdpdGggZXhwb3J0ZWQgc3ltYm9scyBpZiB3ZSBoYXZlIHRvLg0K
