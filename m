Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6906993BDE2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 10:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D385F10E1EA;
	Thu, 25 Jul 2024 08:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="FFVJYqwq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5584D10E1EA
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 08:22:43 +0000 (UTC)
Received: from rly05d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly05d.srv.mailcontrol.com (MailControl) with ESMTP id 46P8Mc9a456868;
 Thu, 25 Jul 2024 09:22:38 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly05d.srv.mailcontrol.com (MailControl) id 46P8LuA3440569;
 Thu, 25 Jul 2024 09:21:56 +0100
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp17011019.outbound.protection.outlook.com [40.93.64.19])
 by rly05d-eth0.srv.mailcontrol.com (envelope-sender ttayar@habana.ai)
 (MIMEDefang) with ESMTP id 46P8Lt2v440250
 (TLS bits=256 verify=OK); Thu, 25 Jul 2024 09:21:56 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPCOVCUkJ8ERjMrWINmz3DYGQmhTWLqZnvjbCLcjhzKxt9R9vbe47stX0YwZ7qnYUBgZA/Lk0KR6g6Cq7DzPAk2bFn8B3igKPucsV4rre80JdGFJbjPXzHVD28hGTiZjrRM+0HCGIGi1ZP2YX/X+FK+Gc8i1SPpkCMKlpx2M9mXNSe99CHhBgXqAcgN8E8+dXudMKcANR8HfJ4inM73prI4X2dFSa53wwFEvI4DQIIsf2M9hE20MeOUYgEFOxtI+NuQLxqKfqrKsIb3/b+l1LjdxW+mJNRMHMSPASW15qw8uN8q/PCG9OtIuUircJrUAefXBpVY21NgsNEMPyylyZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeflfbGqcalg/3qVhxAf6fxNQN+/Bogi7iZ4dwRvkjk=;
 b=T//gIuTOieeE+eUBz/n0gmnweGYRQeTpjMeuFLULcVUnB3TJ+F9JlXGjGN+JUsfUV5GIMNymGj5t0BIhNUpubAEFFrTqa4qhdmqBp0ndPbtWv7MO01j/dJTVfgtdtOAt9OH7HSiXbNFCciVB/ABjVpegyx2ceE8SI+gO7u7AjxLk1xPtg7h7YoTyjsccNRDsKuq2OfdVRYXN6URIz+biR6nAd5DkTGPqVtPWm0rkEZXq7subCDfWKROglTG83pJSb6Nj22wUgtfIeegAkgid9FISBR7Gu2zRr/1zXzj8AlQC2V5V/F++ThNOIn9GUgAsePs9/0BBHOXUVrskpz4g1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeflfbGqcalg/3qVhxAf6fxNQN+/Bogi7iZ4dwRvkjk=;
 b=FFVJYqwqTlfpFQkCBm169hrfVvtL+W5mu18BewB4NIsMwGDdymOdtlzT3o2V11KPu3MYf9JfENiMq76Gxs4Hp5s2o/6V8vSBh63yigfeI1S9Ow4g4gSryiC0OAfVlEHQmp4SudQfnC4froFGJK//yBGHjjHZ3+6pxzYTs+ZfNk1q01nbze+WIbYZ+6q7S+A6huZg7C1ua/MHYkWJNWEwXA4qEe2ztHaoKFyHUiAhUaCQYfDDdO/wgsnKS2kTwQ/g+Y3PiaLU4+8161o/cuy7oL9z7l4n4jBY+EvoYFHq0lNYT9esbrrCa++iYrOkac8gHnViNa9eFNajjFoOJ2dBhg==
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com (2603:10a6:10:2d8::6)
 by DB8PR02MB5897.eurprd02.prod.outlook.com (2603:10a6:10:119::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 08:21:52 +0000
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::7e0f:390b:1dd5:b288]) by DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::7e0f:390b:1dd5:b288%5]) with mapi id 15.20.7784.020; Thu, 25 Jul 2024
 08:21:51 +0000
From: Tomer Tayar <ttayar@habana.ai>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [bug report] accel/habanalabs: enforce release order of compute
 device and dma-buf
Thread-Topic: [bug report] accel/habanalabs: enforce release order of compute
 device and dma-buf
Thread-Index: AQHa3ePCzBPurW9hrU27ecwS7+l6/bIHG56A
Date: Thu, 25 Jul 2024 08:21:51 +0000
Message-ID: <cc6716f4-10e0-4f64-b64c-a3e41e1f7113@habana.ai>
References: <71169637-1e35-48d5-ba04-161d30073495@stanley.mountain>
In-Reply-To: <71169637-1e35-48d5-ba04-161d30073495@stanley.mountain>
Accept-Language: en-IL, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR02MB7573:EE_|DB8PR02MB5897:EE_
x-ms-office365-filtering-correlation-id: 63c05321-203b-44ed-9fd5-08dcac82d5f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Um1ycVBBc3pOSUdjNnYyeWErRTNUU1FZam5IUk9HUkIxTHNmNEdrR1MwOC9i?=
 =?utf-8?B?TkI5QkVWSUJLY0UwdDI2VzJhSWpGVmduQU11UUtKbFlqMlVwNFFpaE1zdGcx?=
 =?utf-8?B?bUdURnVKYy93ZUpoRHZZdXVBL3dVcnlZaTB1QjJTclRSVENSVGZ5UWdJUGwr?=
 =?utf-8?B?LzcvZmRqUHNwMzdtTEZEcEp6K0hZa0FVZ2pVbDFEa1lUejkzTmtDMlk4OFlL?=
 =?utf-8?B?NHV6RFFVa3Z3UHNEcm1iVnZEY3gxNnR3eTI0ODNTaExtd2VuZlBUR3MyVTcv?=
 =?utf-8?B?M3dYM09BdGNBZTRySWU3THJ4b0lYQjBHblEwTllqTjRXOUVtbGhtMHZHbGJj?=
 =?utf-8?B?dnkrWEg4OHZoUHFJMjEzcUlaZGdNSFdIbW43RDhDMmd4N0QwQWxxTnJGSkpV?=
 =?utf-8?B?ZUswNFlXZE1QSkUyRXplRkdIenlmVkI2SGttVXU2V1c5TjhHOUc5aVp5RjV4?=
 =?utf-8?B?MkV1UGpNM0hEbTVHaFFQMXh2S0RsR3ZxYUc5N1YzMU1kVlhQVUVDRkQwL1lm?=
 =?utf-8?B?UVp4REVZaFQ3MHBUM05xUE9EV3c2UnpoR200V1hiN0dCZUtEdUVaUWtjM01v?=
 =?utf-8?B?MjBkaTlQS2xYeGMxMXhmdTNJNk5wY1hUN1V6alhKNi9GTEl4ODZPdE0rZEQy?=
 =?utf-8?B?YkwwaFVld04vY05TSXNHKzV6eDhuZEhkSWc1ZGRnNEpEN3g2VTVtUnVDMFQ3?=
 =?utf-8?B?MU1LNHpQelZyd3l6RUFsdHhNWFEwVG4vUEcyZ0IwRGpFNVVWOVBycmZxRnRB?=
 =?utf-8?B?WUZadCtqdGNRblJoeFczYXNkT2Y2YzJKeUhBQkRaUkdiU3hvc2pDb21LLzQr?=
 =?utf-8?B?NHFqL1lobG9BVFEwWFdmYk5pMUdjRk5tWVZTYTM2WjcxS0V5Ry9VY3Vobkxy?=
 =?utf-8?B?UTN1amFkTFR0SXBYcFNXVExTWUU0VkhoRENzd3I4bC9ESS8yeXJ5c3lIVDY5?=
 =?utf-8?B?T1I3SjJEK21ZR2R1Ymd4bWZNWkhaN3dGNGhBaTRqWFQ4WEorbHlvTEZHZ2tq?=
 =?utf-8?B?MkdDZk02cnlxTUZvYWw2LzAvMmZUTEV4MllsYVRFa3craGtCNFV0eU5wQUtT?=
 =?utf-8?B?d1JZaElwWDF0V0QwL01sWU96aTJld0o2Vk1UVXp0Q1RqQ3ZsOCtjTnR5c0hQ?=
 =?utf-8?B?cjBwaXlRNExHZ0R6TDRmMUdpWWZjdGhham5xTTVpZEFMV2VKOWlpOENVSThj?=
 =?utf-8?B?RThUVVJ5WFFnQkNvNDJQQWFtWGRSZHhkaUovWkJySVduVHMzNS8xK01ZRW1B?=
 =?utf-8?B?VW9NVUJsaGxSdkVTb0tiSGE5RTVUTEZMZVcwNENtS0NIcm5YM0RQNC9wMElX?=
 =?utf-8?B?bGw0ZG1FS2hRSEtReG9oTDJ1L2NYSTRYeWw1Z0YveHZsWXUxSi8rOWpXTVVW?=
 =?utf-8?B?Q3N1aDBOWE1wVUdyS2FoV1FSVFdaY0VZcUNXM3EvekNaak8vU2pXMHR1bnpV?=
 =?utf-8?B?V3ZmNGJZM1dNU2VGRE5WckZ0blpJblJBQTNBVnJSdHk3cnBPQURuNkJTRk0v?=
 =?utf-8?B?UC82VUhTYS9KbDM2dkRySnV4L2loK2NwWnZTazI0ZmRVRFBuVUhYWXJpdno2?=
 =?utf-8?B?N3VBUVQxVWJSS29pV1FvdXN0YTdTT0N4MXhwMUtYcG5lcnc2N2RwdmhydHpn?=
 =?utf-8?B?V2Z2NU9DbURiMFNnbmc3dEQvbWFmS3FiZTV1L3NUVmR0d3pvMDI4ZW02WTMv?=
 =?utf-8?B?a3lJdCtHQ1pvMHFpUG5XNHRlczNGRHRxQlBRSGZyV3laNUNzN0VWK3M5amNi?=
 =?utf-8?B?ZjdpODFoc1dOZUhvRERRUEhQMHF0enQwZUZKOW92Nitaa25wdXZxZytPV0g2?=
 =?utf-8?B?SlpVYmxNMTQrTStmNFNEOUE1aEhFOWNUWFFwS2pFVXdkZHFkV21aOGozWVFG?=
 =?utf-8?B?REdCOUFCMDR2VzFzTTdzYmVaeGs5Vm1mTk04MkpRVW40RFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR02MB7573.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akM3SkFveVRlQUN6T21pUXZvN1RZaXdUNTJiUHgzSGJURHBrNXhRTlkvd1c3?=
 =?utf-8?B?MTJzOFVpNys1UmpOQTdtMVZaMkVjVWRwb0dwTGt6YTdZRDRIblFuS0wySjZt?=
 =?utf-8?B?cHcrbkJJUVg0Y2J4Q2lUaW4wNTdPYURoUmVoM3oxd2ZQaFFXR1NsVTFhQ3Z0?=
 =?utf-8?B?blNoNGN2VmhsNTBnRDlwalozVy9hWERNRDM5M242T0Y1aHNvV0VVT3Yrc1A3?=
 =?utf-8?B?R0M3MnlsZmFmMXlTc0lMeW8xaW4ycUhlT1h2QlY4UVc4Z2JMUG02ak8rZFF0?=
 =?utf-8?B?Ry96dHpmbTZ2dmdDQXBQdTVXL0l6REVMelJaREhuNDlOUnAwWDljamRpZ0hk?=
 =?utf-8?B?dmJRbTBwbE5ReGdpSklFNXN5aC9ycXdDU2k5WjlMM1NsZklkMGJQNm5na1c0?=
 =?utf-8?B?TmNsUHpLQnZhVTUvc25LbGMrNG1QQnZqTFdzQkN6L1U0U0wvMno4T2pmNGlp?=
 =?utf-8?B?WGxpMUxOc21zekZSQlY4NTJweFF4T1cyY2NOMXdnem5HY0VtdVdmd2RoRktl?=
 =?utf-8?B?YWVFeGNLL0xwVVpOckRxczdZS1hTcEZOMEsySnVWQzlCRXBaKys0RjE0N1VO?=
 =?utf-8?B?VmZqTjFsMTFVU2pSK1N1WEs3S0FOVjQxOVFIYmhvd2loODcxUkU3Um9ZZzJi?=
 =?utf-8?B?YkxUbTBSRjVkNmprNDJhcy9xa3ZOcWY0QTdBV0tCNnVzSVArV0c1YXhyQVA1?=
 =?utf-8?B?dENrQnEyZVZWM0N6dlJZUFdwTkZkOVJVYXBDZ05QWU12aTIzM2xManFnd21I?=
 =?utf-8?B?WmQ5WjEzWm5hZUVuc1RSRnk3SFR1YzJ3OTNYcnIrZGp4VXB2SHZoV2JINnhE?=
 =?utf-8?B?b2lRWEU0eENOQlorWXBWUVJpSlVSdVlLdTlRQThWNXNXNGNKeXhUTFUyWmwv?=
 =?utf-8?B?TlFySzVGc2xneDJycHdwWFhJUVBPRkhYM2c3VVhQNlJMZklpcmFhTEMrZzNa?=
 =?utf-8?B?YVVXZFNUb21VQU5lVXU2Nmk1MmVndmdmWjVueENSZEpCdDFxQTBtV0JsbG9R?=
 =?utf-8?B?WER4Ylp6RWE1WEpFdnVzcUM4Y1Qvam5ETVJXald0SC81OElRdmZHSi9pMjFm?=
 =?utf-8?B?bXRqa2dsRkZaQVZhMXBneHo4WFcrQXM5Y1VyWDNSU1F3MnhZbm95a2p5WWVu?=
 =?utf-8?B?L1NRdWRiZnVNMVlReU1ibU1xUUJkdlM4UTQ1Z1lNb1VkdCsxa0dab3Izdmov?=
 =?utf-8?B?NGpJekZzSXc4N3U4Tm5QZ2ZFNmtQV29BSTRzb09Gb25ydEM1Rmttbkc2eFRl?=
 =?utf-8?B?RkY3TVZMZ0IxS2FHemIvb2pnMC81TDhubUFiVnd6NU9SMmE4cjRNbGJsT2xh?=
 =?utf-8?B?bUIzMURqTVBIYmQydnpmVlBEU0tnd0pnMWsvaHJ4cjZ4MVVkYzVZR3lJaWd5?=
 =?utf-8?B?QkxJT0thUWpTWVVQWVRKbnhnbXQ5UVlhMHM3UWhGN0NDTU1scVQxbzR4cUFP?=
 =?utf-8?B?blFDaDBERXFUZk1yd1lsT2ZtTlpGcyt5aHVVOTZ0K2FTN0t6ZkIxemMzcnhQ?=
 =?utf-8?B?c2pZZVVTaENZV1BzUDRleUhTZzlDaGhlZkIzTXlsdWFPT0M4MnVRVHdpTncr?=
 =?utf-8?B?Q1VlOG0yeFVUdzBLMnQ2UHBCYnBNN0p4RktXbjRhQ2hqVFp3NElBMWliTHdH?=
 =?utf-8?B?U0Y0UjVTa3N1L010QWd0bThXV01NOGpKYlpvR0FzbVB1TWcxYjk3bzJ6c1ls?=
 =?utf-8?B?cDNTUW5ZbVhCelRuSHh4OVJkcUZNRGMzak1lcm1XQzI4bVREeXY3eUVMdlBi?=
 =?utf-8?B?cWJVTEtPVkJZejJMeTlhYUdSWTJ6aVZvaThERE9peHYzQzRDK3lFZGMxd0cx?=
 =?utf-8?B?cld5a0o4UHJuS0gxN0ZDK1FsV0t0RUJkN2Q2Vkt0Vmw0QnZoN3E2eFIwcGJh?=
 =?utf-8?B?TjVZek1jR3dlcFJTNEVrL0hveFM5aS9tdTlkS0VjZ1FSUkRrQkJnTnNrcmJU?=
 =?utf-8?B?b1lrcURoKzcrYmtzK2tkT21vd0M5VWI0U3FxMjRmYlNxZzVmZ05aK1N4NXpD?=
 =?utf-8?B?dHFOWExqd0lyWE9oaTZKTlBiSzd5K3FzLzRGRjFHRUZEYVZZMS83Y0UvUVRT?=
 =?utf-8?B?czJYWWdEb2E0ZjFaWFJFSmk2bktWaUwyNWtIQ2Y4Y1NycG85aEtmem5XQjVr?=
 =?utf-8?Q?1rYc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <989EA9F0737F5A4BBCBA68B4BEC6EEBA@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: vuW7HFw/4WszUWIPoyHTEtWOF0lVbwzSEEQ8G2/U6dciZbbsOvv/Jirzh14GS305iKDRSE5VrKdw0wjlyYZG7+tyAJG2zp8gOM2YrgiUlc8SH6VVYSaFW3pRXanpbNdnaer9uFF7T1ImQTrqxEj0zrWynIiAQEVqmoBel1sFW3i0VpxYkjM3BAC7GHxs0EmZWlWPB/QeeDP2Uty4CMieh+Kvfrss9hILZ40is7k4Lq+31neAKDJY2smTaQYe45EsZeBGG1PxIIf0bcRaStc5PwkNc42a7pbUWhRpARhYVXRBysKNtk+++8/1qlEplUv8xzFLotg6n/LFqeTYWd4Dwq3GMc3JbjsPJUIREOw/wLZZGp8+al8GrpcRFnojT56/0cb2bMGsvasyK8Ak2vllFZtV1TUJ1ZVDjwh9lLa0BEuLhtLVukYLzDDFwC/PxXCxCPt+LSBq3FWtR6aSbV//EVE5bXnE1e9mQkwbZKSh5sCPu6I5ykBAUDV+fPUOl1AUvtmtD/v72gW59y+j0Mj9F1ul/0Wk3CpV7UFx5Pqp4bnZcbTcuqyWP2KxhQkJZdZSLBMZpyWoQUPFaU+5ra5cJ52AQPPKjmYYfjh138TJ9vng4hxYjMefuzN7IGaq2lDn
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7573.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c05321-203b-44ed-9fd5-08dcac82d5f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2024 08:21:51.4863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ky5nk8vPEl+B9fBv9MQvJOjDHuITnHLYP81a1c5dlgv3fK2WBM/HCI1p2V+pGYuzpngQAAyjZlPdB+ihXJh1aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5897
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcyMTg5NTc1OTpGUEtleTEucHJpdjoytoWdxCrnziC28swAhXFANnNyswqs30atFpwJQhfay9+PK4KVX0bYXxj9qSeM1PWuvC3xb8ldGYlxFqaX/P8tQg16f5t9mBtMRYapRg+jjayQ9gSBtYNRxwNl2xeJEt+G8xUXOZDdLoM23baHJrb2t0WHXJ84k7oyAGJvtvbUExey/2f1itRKn8DtrJvAHTNI2DIXNEdRM4Iph+aciyRFQ206Ft+MoWmDElWWmKrP/Apt0p/IzzATJWX4CnHTDerzeRgS5aikxp5E9ppX4dTHs2iTLi8ufaTWu5sRCRkUXj6+SkPO22lgqKEV0K8mF3LzMrmzrbCWQSpxkRoGhxsE
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.68.1.115
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

T24gMjQvMDcvMjAyNCAxOTowOCwgRGFuIENhcnBlbnRlciB3cm90ZToNCj4gSGVsbG8gVG9tZXIg
VGF5YXIsDQo+DQo+IENvbW1pdCAwOTUyNGViODgyNGUgKCJhY2NlbC9oYWJhbmFsYWJzOiBlbmZv
cmNlIHJlbGVhc2Ugb3JkZXIgb2YNCj4gY29tcHV0ZSBkZXZpY2UgYW5kIGRtYS1idWYiKSBmcm9t
IEphbiAyMiwgMjAyMyAobGludXgtbmV4dCksIGxlYWRzIHRvDQo+IHRoZSBmb2xsb3dpbmcgU21h
dGNoIHN0YXRpYyBjaGVja2VyIHdhcm5pbmc6DQo+DQo+IAlkcml2ZXJzL2FjY2VsL2hhYmFuYWxh
YnMvY29tbW9uL21lbW9yeS5jOjE4NDQgaGxfcmVsZWFzZV9kbWFidWYoKQ0KPiAJZXJyb3I6IGRl
cmVmZXJlbmNpbmcgZnJlZWQgbWVtb3J5ICdjdHgnIChsaW5lIDE4NDEpDQo+DQo+IGRyaXZlcnMv
YWNjZWwvaGFiYW5hbGFicy9jb21tb24vbWVtb3J5LmMNCj4gICAgICAxODI3IHN0YXRpYyB2b2lk
IGhsX3JlbGVhc2VfZG1hYnVmKHN0cnVjdCBkbWFfYnVmICpkbWFidWYpDQo+ICAgICAgMTgyOCB7
DQo+ICAgICAgMTgyOSAgICAgICAgIHN0cnVjdCBobF9kbWFidWZfcHJpdiAqaGxfZG1hYnVmID0g
ZG1hYnVmLT5wcml2Ow0KPiAgICAgIDE4MzAgICAgICAgICBzdHJ1Y3QgaGxfY3R4ICpjdHg7DQo+
ICAgICAgMTgzMQ0KPiAgICAgIDE4MzIgICAgICAgICBpZiAoIWhsX2RtYWJ1ZikNCj4gICAgICAx
ODMzICAgICAgICAgICAgICAgICByZXR1cm47DQo+ICAgICAgMTgzNA0KPiAgICAgIDE4MzUgICAg
ICAgICBjdHggPSBobF9kbWFidWYtPmN0eDsNCj4gICAgICAxODM2DQo+ICAgICAgMTgzNyAgICAg
ICAgIGlmIChobF9kbWFidWYtPm1lbWhhc2hfaG5vZGUpDQo+ICAgICAgMTgzOCAgICAgICAgICAg
ICAgICAgbWVtaGFzaF9ub2RlX2V4cG9ydF9wdXQoY3R4LCBobF9kbWFidWYtPm1lbWhhc2hfaG5v
ZGUpOw0KPiAgICAgIDE4MzkNCj4gICAgICAxODQwICAgICAgICAgYXRvbWljX2RlYygmY3R4LT5o
ZGV2LT5kbWFidWZfZXhwb3J0X2NudCk7DQo+ICAgICAgMTg0MSAgICAgICAgIGhsX2N0eF9wdXQo
Y3R4KTsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl4NCj4gVGhpcyB3aWxsIGZy
ZWUgY3R4IG9uIHRoZSBsYXN0IHJlZmVyZW5jZQ0KPg0KPiAgICAgIDE4NDINCj4gICAgICAxODQz
ICAgICAgICAgLyogUGFpcmVkIHdpdGggZ2V0X2ZpbGUoKSBpbiBleHBvcnRfZG1hYnVmKCkgKi8N
Cj4gLS0+IDE4NDQgICAgICAgICBmcHV0KGN0eC0+aHByaXYtPmZpbGVfcHJpdi0+ZmlscCk7DQo+
ICAgICAgICAgICAgICAgICAgICAgICAgXl5eDQo+IFBvdGVudGlhbCB1c2UgYWZ0ZXIgZnJlZQ0K
DQpUaGFua3MgZm9yIG5vdGlmeWluZyB1cyBhYm91dCB0aGlzIHdhcm5pbmcuDQoNCkFjdHVhbGx5
LCBiZWNhdXNlIG9mIHRoaXMgY29tbWl0LCB0aGUgY2FsbCB0byBobF9jdHhfcHV0KCkgaGVyZSBj
YW5ub3QgDQpiZSBsYXN0Lg0KVGhlIHJlbGVhc2Ugb2YgdGhlIGRldmljZSBmaWxlIGhhcyBhbm90
aGVyIHJlZmVyZW5jZSBkZWNyZW1lbnQgWyANCmhsX2RldmljZV9yZWxlYXNlKCkgLT4gaGxfY3R4
X21ncl9maW5pKCkgXSwgYW5kIHRoaXMgY2hhbmdlIHByZXZlbnRzIA0KdGhhdCByZWxlYXNlIGFz
IGxvbmcgYXMgYSBkbWEtYnVmIG9iamVjdCBpcyBhbGl2ZS4NCg0KSG93ZXZlciwgSSB3aWxsIHJl
dmlzZSB0aGUgZnVuY3Rpb24gdG8gZ2V0IGEgcG9pbnRlciB0byANCidjdHgtPmhwcml2LT5maWxl
X3ByaXYtPmZpbHAnIGJlZm9yZSBjYWxsaW5nIGhsX2N0eF9wdXQoKSwgc28gd2Ugd29uJ3QgDQpo
YXZlIHRoZSB3YXJuaW5nLg0KDQpUaGFua3MsDQpUb21lcg0KDQo+DQo+ICAgICAgMTg0NQ0KPiAg
ICAgIDE4NDYgICAgICAgICBrZnJlZShobF9kbWFidWYpOw0KPiAgICAgIDE4NDcgfQ0KPg0KPiBy
ZWdhcmRzLA0KPiBkYW4gY2FycGVudGVyDQoNCg0K
