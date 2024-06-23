Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F14913BD9
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 16:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4781610E290;
	Sun, 23 Jun 2024 14:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="iX2kxJdk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A2E10E224
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 14:49:30 +0000 (UTC)
Received: from rly02d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly02d.srv.mailcontrol.com (MailControl) with ESMTP id 45NEnJST450991;
 Sun, 23 Jun 2024 15:49:19 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly02d.srv.mailcontrol.com (MailControl) id 45NEmZEw446317;
 Sun, 23 Jun 2024 15:48:35 +0100
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by rly02d-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45NEmWHL446122
 (TLS bits=256 verify=OK); Sun, 23 Jun 2024 15:48:35 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ob3FpgT0WnSMUasjkpaVMXiqLpuvuhtttDFo28pMJa7VGZgJKG5g6c2GdALqmS5yCv4yGw6sKXtj8RUKSZlUSGjfk5gNQ3aP1gbYOYjtoMI/edX8C5Xew7o8Eci5H6s2c2ibiPaPxriqel6gEhUx/lxFFC9RFq2bn5BT9adrJhX1G1XSAGzJncaccp2yP4+Wo1tWwUpSsIq/9l3q/gZhW//S6U0T6ZoFwPCyTbxFZQl8i+m0VfYXLfXwVBToUbQ7KqGgN27B7v3gx+y8x99JwIlI5+XyqFdG3sOvFxz5tkiGjRGQkoy0YQOH7vngxBV9xvnaNTpdN3yj87BqNNf/Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACCYXkW1SwCHDEDpCmDw+SXLEUir+JMV1cDP3Jx4hK8=;
 b=Ngnh1XMXkzuF3+wgiCeo7joEV9W6QnV4S5T6uqHRtp4p65gaZBMjvkyUjwZqq6M9OspfWkBGhPuSBHmRxXGgqwkN2KSI2goElC44p7DWsoB8EGlv2wWXHMAtT8lbbei55jb0FfC71S0WYIPZJ1ya63SdOwRU0RdzIpw6HMfHartWcC7XydIxkpV3ByRV3GzBIgv1tsm5IIs9fqOrhpE8dHYXAW341lYXFdGIytcGUnEc1Ss7ucQeOVMBbmlM8n8rvjCOhjOoZc/M1xtcyAzziuAfXu7PjVeCgasMCQxKvQQyPLsUuEwV5UL6hKEhNmKIJ8qdoL/fu1Lcw1DntKiMBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACCYXkW1SwCHDEDpCmDw+SXLEUir+JMV1cDP3Jx4hK8=;
 b=iX2kxJdkabTocqpQc6Hqoy8kcPITTRCVsj7A6N1Y3bQXsX/N13WIfivaljR+yiwzOn0IL/dehgzwaEMKY+9O4nmU555hnnqXTgN70IVWWWC/ZFvSlFAGIL4fISJJM7AJYBNz3dO5ZgSrJ0Ac9umzqdOHvgu5zIztY7vHp0MtJTDoIEp3szPwH7zm/aCSWsqeuNzMFb/WF58uzjZMghxMRwH4og22GfICAbz/zYM/nqB/Bbfp5vVVagB7QOM14Ea4vv7ZEWXPc3PdIRJ+fFLfkRJXuohro687c7yeLLiHZNHGslbn5/SHEOshZHMla7aGyeypjhfE8hO6wDVuwJaEEw==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by AS1PR02MB7920.eurprd02.prod.outlook.com (2603:10a6:20b:4a2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Sun, 23 Jun
 2024 14:48:30 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7698.025; Sun, 23 Jun 2024
 14:48:30 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Thread-Topic: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Thread-Index: AQHavWrQgrJbi1vMQEmkq/v8mH9idrHGPFGAgAbik4CAAHs1AIABHDsAgACHbwCAASNEgIAAVhGAgABaOwCABGyqAA==
Date: Sun, 23 Jun 2024 14:48:30 +0000
Message-ID: <5341b031-1e54-4ae1-b0b0-0b9dff622392@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
 <10902044-fb02-4328-bf88-0b386ee51c78@lunn.ch>
 <bddb69c3-511b-4385-a67d-903e910a8b51@habana.ai>
 <621d4891-36d7-48c6-bdd8-2f3ca06a23f6@lunn.ch>
 <45e35940-c8fc-4f6c-8429-e6681a48b889@habana.ai>
 <20240619082104.2dcdcd86@kernel.org>
 <5cb11774-a710-4edc-a55c-c529b0114ca4@habana.ai>
 <20240620065135.116d8edf@kernel.org>
 <9d459e01-6171-4a1a-855c-f56813ea9e0f@lunn.ch>
In-Reply-To: <9d459e01-6171-4a1a-855c-f56813ea9e0f@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|AS1PR02MB7920:EE_
x-ms-office365-filtering-correlation-id: 581ee55f-b573-4b24-648f-08dc93938c81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|41320700010|1800799021|366013|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?YTJ3Q0V1amxuOFd1NUExNGZycXZCb1duL0xOZzBNNmhJMzZyekpZeFIyRTZZ?=
 =?utf-8?B?Q1ZLZTlWSmZsRjdjaDBEano2VFpRNytXSEdwOWxvTklXckxYZFcxclpJQnVk?=
 =?utf-8?B?T29DejJnWERISEJLWDJiQUdLREZqeDl4dlJxTUZOZFE2OWlQa1BzMDB6aUZj?=
 =?utf-8?B?UlA3ZWlGY3c4WGxpWFJtNVJ6aVpyQmVBblJmWjc5VnBrd2hoaHVqMWRDN21j?=
 =?utf-8?B?Q1BHVy9BQm1tc0c1MVFTYTc1dnVydGJUY1JraFpObHU0QkI0Z00xaGt3dTVt?=
 =?utf-8?B?UWM5MStRSjRYQTZXKzVyRS80eWdqVFJRbW54SzRnbTVQblZyMU9IUzVHSFdY?=
 =?utf-8?B?d1Q1QWZ5ZnAxMEZmdGJOSFgrZTRMT0NYR0ZaUjRQWE9LMVVxOE50bHVxbWVE?=
 =?utf-8?B?c3pRdHEraU9EMzF0ZlV2allSM3pRSHEvajNPUE5Hb3NuMjYyZEVHS2hnS2Fm?=
 =?utf-8?B?NWxiY3daRlI2N2RGRjdxMytZK3lOSjgvcTduelp1YlltZWh0YVFQN0VxbW01?=
 =?utf-8?B?a1NtQk13Q0JqVlFqUi8wU3BnaSt1cjVQZEZncmVUSDlyMHNTejQrY2svWFNq?=
 =?utf-8?B?S0JEUmJxdkpMWTZXSzB3TjFGUlNtUm13Z1k1eCtTb3hMMTlYOHdXUmc3NXR6?=
 =?utf-8?B?WnRuZmZEbW9tLzB6WUltVXhuaStobnhSSE14V0crd1pOM0dpUFZod2ZOQnRj?=
 =?utf-8?B?RnZSY1NpY0JyWS9ibS84WHV0c1ltQ09Xc20zalJDZy93RE5wVWxjdTZSVHUv?=
 =?utf-8?B?Y1lINTdrRUM1enZOMW1yV2ZLTnF0blo4Nk1BZ0d1WlFBSElYVDljYTZ2K3pB?=
 =?utf-8?B?UUlySCtpL3dWY0xwaG1sVWVKWXB0WW9iNmVEZ0dtNlBSZzBLdlBNZDNWMTZW?=
 =?utf-8?B?cmp6Nng0REljbFJOM2d2SlNlMzVRTk4vaU01K3JHTDRuUStXU0RtLzVCNG1a?=
 =?utf-8?B?dVQ4WGY2WHh2MmNhT3RCUzN1dnR3KzQ2Q2llVExMMmFucWFlZ21xLzZIZnQ4?=
 =?utf-8?B?amhrVnpyWVNDbU9sTVFuaHhaK21zTlhGTTd6UGJGSFBuVForNytIc2hMcHRH?=
 =?utf-8?B?cUFvejlBbmk2cjZSN1BWUG9tY3NnUWNHZWlKSnQ0SHowZzRVZ21EYjZTN3F4?=
 =?utf-8?B?VnVBL2k5YnNsZjBWS3MrcXExeWNIL1kwSkFJakUvOEFPalRFYTA4ZFpTMVQ2?=
 =?utf-8?B?dUlmcHdWdlFCbzhSblZqdlp5Mk9IUlpCTFcwRFU4OTdDci9MalZWZkJkUW4z?=
 =?utf-8?B?Q01leFlGNlRwN1NxbzdRTlhicGlIaXRxMkpGV1paVmNoV0FoQUNMLzFYbWRj?=
 =?utf-8?B?Z0p6ZkU4K3hVY21Ubk5UWm5paGJyZW96Vno0eXh2VnVtbzljNGxjQUllTU1U?=
 =?utf-8?B?dmhoRHZ5VmFEeXZlWGluR2pwWjhqb0xQVGt2d1JFd211ZStJTVpHa0lyQjFU?=
 =?utf-8?B?NDY1bm9FcDhqL3hvdEVjMnVZek9RS2lwK2R5Wm1wY2dCVU5GK2hEa1E1N2VE?=
 =?utf-8?B?TWVQT0ZEaFJYd0g1T24wVzM4NTFUZTJKdWFCcjhpUWdFajhoUDJ3NThTRWZS?=
 =?utf-8?B?aWxOb0NvMlQ4UjgwT2FBQjBuelBoRElkZXlhUEhXdk8yVGdLNUo5ZXArSnFh?=
 =?utf-8?B?c2FjNkp4Rzc0RkhyS0I3K0hodUVZU25nOEFBK0VnQ1hvTWh3bFFEdjBiS3gv?=
 =?utf-8?B?Ny9rSC80Q0hwQmJEUVJ1VTExeFozVzN1YmJrc0ZmWk5Jd2g5aTZ1L2pFYllo?=
 =?utf-8?Q?b1C7r0n9QRkHdJCdqpfxXIE1ek5cX7NTqurwjDM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(41320700010)(1800799021)(366013)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGZnd3B0RnJTdXRaYmxkUUxEeG0xa0lKM2JXTDIwSDRyTVRQZWFWdkZyVmpi?=
 =?utf-8?B?VkJnNXRVVmNjWXQ3cEl5S3BSVjc0aXl0NG9Vdm00K1h6V2t0L2M3QUEwWGVS?=
 =?utf-8?B?cXlyYmE1WldrUktxNmJ0eUpvWWYxOGlOODhLSHFWZ0NNR21EY3ZlMUN4V2Nx?=
 =?utf-8?B?Q1cxTEJZWEVIZ2hORlNObkhBQ1VZRlo3Q2txWm0vUGU1b0hoVHpXb3BiYzVR?=
 =?utf-8?B?WXJ5R1h3L1FpNURXS0J0Ky9GQVJJRW9nWjYzVlBmSndEWEU4QXo1T1Z4MTVR?=
 =?utf-8?B?U2FhcVF4WEozWVh6UVdwQjVSRGdwSmplNU5IVnE5RVkzUGhSRGZIb0VCU3Fo?=
 =?utf-8?B?Qzl4Q2diZWNFWHpaeWFSVXNJd29pT0I4bnU2Slc1d0lsSFJuS1dDV1ZOMEtK?=
 =?utf-8?B?dTQwUjZldXZ1TGNGektMTm16Z08yL1dsZ1RIRklFSkdqUWhSc1JxbWxEVjVI?=
 =?utf-8?B?RXIrU3RGZFh0cElxL2U0UldyRk9TZW0wY0xJNm9FZTE0NVU3cGhsTVFnL1lF?=
 =?utf-8?B?ekwzWjlWZHFRUU94WHZQSU5hZDNBWmswZWlGZFdtOEtlM3JaMUNGUHp5MEtV?=
 =?utf-8?B?V05kdTQyeEtJeFR2YVV6aG4vOTdmdk5ZdTluVk4zSitZM2pCL2JPNTdUYlFl?=
 =?utf-8?B?c2J6bjY1Vk14SHdrd3MrcENZVWQ0SWRKR3BJQXdJOXY0ajBxeDF5ZDFITkdH?=
 =?utf-8?B?WVJ2cDcvTnZKd29MMnIwY1JTMGJ2TXJweUVBSTh2K0Zud2FNRGw4cnQ2ZUtD?=
 =?utf-8?B?enJ4aEd1Vm9xc2JxOU9pd1lEbUdEMlJuY0VsRVlCZmwwcU1yWVRyaW9YY3hv?=
 =?utf-8?B?aW9jcmNVU0xCeUh6V2ZKNmhkT1FDVE5CYUpJS1Nlbmkyc3VKVHdLUS9YOFUv?=
 =?utf-8?B?TUE4ODFsMUFCYkwramlJWUgzL1BwamVXZ3dneGdoM0lGcDBhMkVzNHVITjI2?=
 =?utf-8?B?NDJsSTUyOHVMRWtIL3FLVWZyZytyeGFIWnViNmJLdFdnU3JSNS9NQ2hnMzZT?=
 =?utf-8?B?SFl0ZUhiRnBkOWpNNjdUQmZBMEh1WTVZYUNYbkU1UFNmSlE0Y1RPUWx0bXRt?=
 =?utf-8?B?NlJyWVVLNExsZmEzSERPOWN6clFZOXZVeEN6amtGVE1uTnVRZW5JSUgzRGVo?=
 =?utf-8?B?YkJEVDdNZ0RnNm12UU53OEZiYmpaZmtDUm5ZN3Z6S0RZTVNlMEt4YUFMdmJH?=
 =?utf-8?B?bDRMVjkrQU5TeWRjRWxwenM0SHdhNHdRWG9BNmhVZFhrSUkwVE9TZ1FMVzNh?=
 =?utf-8?B?TUMraUtoa1hLTk1pS1BqTGxHOUxBNVFUYU1sYUtEbjFhTHEzVFZVM1Z3QTBM?=
 =?utf-8?B?aGIwbnpVTG51YVdsSVEybTFTVWJxTmRYT2FGSElNeE1wRWhGMnppRGVuZ1hu?=
 =?utf-8?B?RFFnQUpEY2lzUUZMNG5hSFpyalF2UWpENWVKcVdqaHdoRlY2czRhcXFaei9D?=
 =?utf-8?B?dC9UL1J0OTYyRlJKV2pVVzU2akxBMkQzWUF4Sm9ZYUwxS2dMazZqcHBwaUt6?=
 =?utf-8?B?aWx3cjl1UFJpR3BKRDhiUUo1bU5PdXk3NnpSTCs1WHBqMk00QUl5bnZKbWd3?=
 =?utf-8?B?VGp5VERQcTR5RWxUUU9YOHBGSzFERUU3NHA5VCs2RnN4c1VBcFUrN1pFZ1lx?=
 =?utf-8?B?V2RSdVN0aVVyZ213TmpHQ1lmWklRN0cxc2h3U0gyOWc1SXpTMUFyVE95cDhn?=
 =?utf-8?B?MlpHTUl3WUlSbEM2NHNBaENwdWJUNm9HU3ZiU2dSeU5hYXRrNkVhNisreHFv?=
 =?utf-8?B?ZjUwUmhLWlE2VEV1MGxYRmhxNjllczV1amE2eTZPYXcyWW9GQUgwYkhoZkZz?=
 =?utf-8?B?N1ZGWmFYbEQva0V4bG0yajZsVkFobmNiNnJ3eVdWVE9nTXVFWlROdzdlS2Rz?=
 =?utf-8?B?by9EMmNzZzdnQTRpcU5RNURuanpXbDRMZHI1bUFWMGNxT2pWVndiMVhGck5z?=
 =?utf-8?B?RFdVbDNsNHpVektkeW9SZ1NWcXN6Y1lvamhjWHg1SklOSzlaZmdhWExJSjB0?=
 =?utf-8?B?Z0JvN0xtN1lwVEN6ayt5MzJnSUM1eXlQYjJvLy9jK25lWEVZZ1dDdk9Bamtj?=
 =?utf-8?B?dGJmamJDdDBNRzdOK1I0TmVUMHdwL3RjK1J3dkJxQWN5Si9uU0lzcFVPVUNR?=
 =?utf-8?Q?FiovpdM7F9mniv0oY+AzKNSk8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B93857FA4BE7E429246990703747FF7@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 8l2Ths9Tv1ePHvksonTZhILzCFsIkEizCx0iKo2A2tixZ6zuOBdPY6hPrumszXhakYwjf5nFy9TkITZ+bRjpN64DbAYo1Kk6kaN37R83tPR5gzLdnZFopoehtksqKD4C0Y61HLTyUIX91ZP/1xUDMlKYbuG84y29vsOuHg96jfT325EqQHmbABkm8w0I+6V6A7qHmwv1jS7G838ywtZtc7hmGsEJKctil1RyAqckWYDmXlSgmWlmMMkOCYK1W+UmV1vRurd3YkBjZtxV3cnDIkDlESfBI4ebKcs5BYf0P8l5niCj6UBEycl6nbrOvgcyPa4f6/XeIYdM+38B4lKM+QceTnGaPyd5f97gok3Jb2ukySNAHiHjaJLJLBmY3x7jNCdQfi+PMI7Z8semF6MN+FsfZAqeR/AzEhm0pjT5dX3MqYVMaX63EmQhvrPYAK3cE28Miz3VXxyRe9mZgeCA3CUmxq1UFDOnsZ+Hn/76A5WXzaiQPtExwD1DgeFQpX9i0tP/M2fPGKEM3NfWZi9HX37KcU9ff1kGY/CbwWflqjYF1PzK6OpbDDeqcBwjmS01stmI/IMGcequjwWKIvG1rcJ5X3icjlf6yg+iIF4iJyY3HswH9RxgbptwPABzKkSJ
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 581ee55f-b573-4b24-648f-08dc93938c81
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2024 14:48:30.6061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RQPENlYnIwbW5jaaewi3164ndOgE4GsEUQQk9Fkkljibmbdq6K7Okei1tNKZP6dSAZJugD4hWJ0cH/0Qj70paw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR02MB7920
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxOTE1NDE2MTpGUEtleTEucHJpdjqCWC1Bd1oOxX5CK6O0NWwxKOr1bd4tQnhX2eq3EAEGB6R0sjLRayxAOuwzESwmnPUIK/yRbhOslZEzG8THn8aWRbMR6qCpBJQn9dXeeDmXrTLc7g1kVFpXZr6Qeyf3w8fhv/9eX4puYeiIHhH6G+R+DXE1b0jKiZTWjOPM2Q0MhsUtIta2Ia7YMOasxlx0iiZC908dX/a2S+9+7Hgcyy+GHnThZ5rmJkMI7ZrPtOizlhLnfkkDcLchkdc4CZbFNsCxpRZvAVtQ7N7JEhRACAdmzzbblMFsvSTBN+5KnZ7sa2+2Lxs2S/lbSHL1Nisxi1U1kNX9PT0UIrU502JzhT/d
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.68.1.112
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

T24gNi8yMC8yNCAyMjoxNCwgQW5kcmV3IEx1bm4gd3JvdGU6DQo+IE9uIFRodSwgSnVuIDIwLCAy
MDI0IGF0IDA2OjUxOjM1QU0gLTA3MDAsIEpha3ViIEtpY2luc2tpIHdyb3RlOg0KPj4gT24gVGh1
LCAyMCBKdW4gMjAyNCAwODo0MzozNCArMDAwMCBPbWVyIFNocGlnZWxtYW4gd3JvdGU6DQo+Pj4+
IFlvdSBzdXBwb3J0IDQwMEcsIHlvdSByZWFsbHkgbmVlZCB0byBnaXZlIHRoZSB1c2VyIHRoZSBh
YmlsaXR5DQo+Pj4+IHRvIGFjY2VzcyBoaWdoZXIgcGFnZXMuICANCj4+Pg0KPj4+IEFjdHVhbGx5
IHRoZSAyMDBHIGFuZCA0MDBHIG1vZGVzIGluIHRoZSBldGh0b29sIGNvZGUgc2hvdWxkIGJlIHJl
bW92ZWQNCj4+PiBmcm9tIHRoaXMgcGF0Y2ggc2V0LiBUaGV5IGFyZSBub3QgcmVsZXZhbnQgZm9y
IEdhdWRpMi4gSSdsbCBmaXggaXQgaW4gdGhlDQo+Pj4gbmV4dCB2ZXJzaW9uLg0KPj4NCj4+IEhv
dyBkbyB5b3VyIGN1c3RvbWVycyAvIHVzZXJzIGNoZWNrIFNGUCBkaWFnbm9zdGljcz8NCj4gIA0K
PiBBbmQgcGVyZm9ybSBmaXJtd2FyZSB1cGdyYWRlIG9mIHRoZSBTRlBzPw0KPiANCj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjQwNjE5MTIxNzI3LjM2NDMxNjEtNy1kYW5pZWxs
ZXJAbnZpZGlhLmNvbS9ULw0KPiANCj4gCUFuZHJldw0KPiANCg0KVmlhIE9BTSBJMkMgTWFzdGVy
Lg0K
