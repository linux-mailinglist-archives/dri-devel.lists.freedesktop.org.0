Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04C7912241
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 12:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8125610F142;
	Fri, 21 Jun 2024 10:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="Y6xo8KHJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945DA10F142
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 10:21:57 +0000 (UTC)
Received: from rly17d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly17d.srv.mailcontrol.com (MailControl) with ESMTP id 45LALk0E303161;
 Fri, 21 Jun 2024 11:21:46 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly17d.srv.mailcontrol.com (MailControl) id 45LAL8BG291330;
 Fri, 21 Jun 2024 11:21:08 +0100
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02lp2104.outbound.protection.outlook.com [104.47.11.104])
 by rly17d-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45LAL53h290041
 (TLS bits=256 verify=OK); Fri, 21 Jun 2024 11:21:08 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fwx4iZvElYAbTV29Mk16gkuDyRKenN9xGyOsTi3+SUlJoxJ+lm//Nez+6t6wQ4W9gJ0fxOG3dlWtwc7MpYvY8GPeYX5De20qYeLGPyKbtwVNVacF8Q4z80E4MXEKs2JJFvAdAX3NDvb6ngrnG36JjrUst9gaFBXMbOQxKfvqPn5rETIOo+B2d/lvuuO4pvYomo2gbRHf2zlpq3L8d3leZ1kNofJ3/AniKi7o5A4pmno2pgCI42bzRXBX76fbDvle89yW0/OJc0RmZAZuEqB6Tu8tEc/hLZ6agwfsh6mKoMV4ZqzckFO47PkPaBoRAmfqpwT4NvXhYPFOc44Erg0w9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpWyBjEC81LZ1FpvEhWXaPzzk0kP4SicChJQGNBm9u0=;
 b=HXjvoKfBZqk65glC4GP4zWLI7CMKYcAnogEttS7uPvFA9FNVqp9wh3rsxepTGMYSJK4eVRRqFX/eLnJ7lvX+5en1LaVtzIOgP4HHYuAbV897qboEL9+y3SWpy65pfvBd8rKQfvd8iX22YOMgvGOPHNDbSOPd31iHiLh6bwUfEd2CW8ZIVJXyocqCW4vPUwtqiMUvHkbVXIjjv4SHW1zHXAwe35Tg3snHxF5SxKOb76PKRH4bOqNqzPdAMgxs7P0mGQVYW2NQvn0dz1vRdnK567tQb6dv+XhI7n3CoiTv3vxs0N+ICDtryOjSLbjhKgxECq5qyz59zZp1nJLqjEfH+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpWyBjEC81LZ1FpvEhWXaPzzk0kP4SicChJQGNBm9u0=;
 b=Y6xo8KHJahVRcwXQzAS2aCgLC9Z+KHi/6WbQbvSCXEbw+HFxbEs4HruTl9jPY48KWoWjr/7ai81wE22xaR8taIrZIYHq7RX69M5Gjx99mC0oypX8jEx7Xlwv6rjF8ImsPE6D19fs+4Zuk0kJB+wtfAO6oLoAiuwpC1IC1N7tfvhlaPHADWyuZQb6VJCKviOPQuP8Gh44QVbctXYXnEtICHf9eSSc2Z7YVh+ckZqTmpSBONOZWmKn3nAg+xbYoD5BzNYUrykhHBTv+k7ER5w6++ETTMpGReTAmCtfDrsVF+lBoKw//kULvc71rkF0AgKVgf0ow/Oq7bjhofiMqOBsBQ==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by PR3PR02MB6394.eurprd02.prod.outlook.com (2603:10a6:102:70::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 10:21:04 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 10:21:04 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Sunil Kovvuri Goutham <sgoutham@marvell.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "ogabbay@kernel.org" <ogabbay@kernel.org>, Zvika Yehudai
 <zyehudai@habana.ai>
Subject: Re: [PATCH 13/15] accel/habanalabs: network scaling support
Thread-Topic: [PATCH 13/15] accel/habanalabs: network scaling support
Thread-Index: AQHavWrRZMzsos32iE+cuLpKEiXBlbHPdaAAgAKY+oA=
Date: Fri, 21 Jun 2024 10:21:04 +0000
Message-ID: <4f139df6-3329-4254-ba92-d4212e28347f@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-14-oshpigelman@habana.ai>
 <BY3PR18MB4737D95E4D629E5B388BEB86C6CF2@BY3PR18MB4737.namprd18.prod.outlook.com>
In-Reply-To: <BY3PR18MB4737D95E4D629E5B388BEB86C6CF2@BY3PR18MB4737.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|PR3PR02MB6394:EE_
x-ms-office365-filtering-correlation-id: 0c11fca8-0bf4-4753-cfec-08dc91dbdb3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|1800799021|366013|41320700010|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?djFTRzNtNjVIQ3A0MlN6Zkc4QWtydlRaUWE1c2hWcWx6LzI0QmcrM01Ld0c2?=
 =?utf-8?B?eVg3TGJiTWJDWWd0M256bXp6ZXVUcWxFTUZncWlWVEVuT0NRWlN3bURCMU1R?=
 =?utf-8?B?VERoNitUZklBb1VmNXkveXh5YVlRU1A0VVN3VFN0Zi9BV0FFb2VEV0pwdFYw?=
 =?utf-8?B?MDEydndwUjhHTnlKQzMvZ0trQ2ZjZWZqTWorSktyemxJWFVJR0ZkaTFCNlVw?=
 =?utf-8?B?Y3NncXhWcEErQ3RUenFGeUVpbWI1Q091M2p1RTh2dFVCeFBEOTJsdTU5eS9s?=
 =?utf-8?B?RWczMkF0R1NuSm81c25PQUVmNitUd3pzbUxqQkRJNURrK2J5eEh2emR6ME9Z?=
 =?utf-8?B?eFlYYTVtWHloOWwwVnpWYXdTVUUydnphN1NtaEpmMEhzSC95V0d4SlZYWDhG?=
 =?utf-8?B?YzRJdXZhNGJ2UGp0SW5RajByWUhJNkNhbm9pam0wSm9oMVNFSEE0MDRLVmdv?=
 =?utf-8?B?UEVGTEVjcmF0Y3U3QktrM2xPaFZaT2NZdkFLYU55R2tYN3RmUFA2K0hONzV3?=
 =?utf-8?B?V0QzSzVZLyt5cUxtSDZiOWk3MC8yVGN5b2ZVUGtCKzYxQWpFQzVtUm84dlRo?=
 =?utf-8?B?MkplTlRwdFo4Nlh6TnBYZkpXSS9yUTNHbStlVmxhT2ZJSTl6Rkh0UlNlWDE5?=
 =?utf-8?B?NFgwWGJWenU5alRKR2dIM3AyNUtWaS84TVMxWkZMbGVyMlVTVEhvZHFVNzJW?=
 =?utf-8?B?YWlFZEJ6dU1NMURsNXBHMWRBdUNVQnpjYkRXaWt0U0RPNC90UkJDUGUveEs3?=
 =?utf-8?B?L2sxeXUzQmY3bG5EQURpL3BaY2xWazU0ZmdFNEtSUkUxUDR4ZnkxRzhOZjNC?=
 =?utf-8?B?a0Q1SkFxc2RvVWFIazE4TUpaWjNxN2RUcEJmOVBWZ1lLakVjV3BCVzhORkFJ?=
 =?utf-8?B?ZzkwZkJ2TFJVU2RibU1tTnE0SU8rdC9QVmxXQU00cnBsY2pSTGQrZ0hENGND?=
 =?utf-8?B?dXBmOHpzMko2OVdaMkVIL2Q4VkpyUk5QNHRsdFRic09uTUZXR0xRL1ArTXVM?=
 =?utf-8?B?emU2MmU1a3FHSTJGYnhhMlIvV244Rm5BLzlWSjNSdUJqTDJmRElFem8rYVkw?=
 =?utf-8?B?Q0RzU2YxMS9VVmJpYkVKSW5GWktzTE1qS3RGWk8vVGMweWpxYmQrSEViakVx?=
 =?utf-8?B?cnErcmFqc3RpbWxLYzJoWEh4Y2dBaC9OSjhlUXNMSjhvRUFwMlVkVTU0eUNr?=
 =?utf-8?B?bkE1YWxtbm90b1NpeGlHMTAvQ0kzTU9HZjA2SWh1TktMNmhPUUhjZjJIc2Q2?=
 =?utf-8?B?WnNGdE9MUTRtMWdBdTJLbkdTK3dTYUlQbm1OV291WjRCUEVLUjlVSHNsdm54?=
 =?utf-8?B?cHllbGxYdnZwNmpsdE01WGZEVXRkS1lwUWg5b0QzSWtXNG43RURMN051VW9R?=
 =?utf-8?B?WFQyd0paVmZYL0NRd1pqcVJvSS92ZlNsMy9YM01sL1Y0L1NYaXN0TDRKZnpq?=
 =?utf-8?B?aHA1NzZPK1lYa3JQK0daSkVEdE5nb3VGYUdEanZ5eThucm9RcHJRRHZNRS9Q?=
 =?utf-8?B?OGRrbHJiNjRJM3Z0RUIvMTVHVG9YWklmUlRZbiszcjdVQjBSUVlBeVU5TVJr?=
 =?utf-8?B?L0VkNzBLWDJQbi9sVWJPTUtRSWc5eGd1YWVQekNIUUJQak0yODhDMmM1L05h?=
 =?utf-8?B?WEd2ekdGU0lGVE0ycUhaOURYY1RBY1B3SzRtUzVHQWZhaTVtMXBBVGJGK1py?=
 =?utf-8?B?TWU0a2Z1UDV3VEltR21zNjl3cm5weHNqMnhZZUhiNjlSSjFFYXFyK3AwLy9r?=
 =?utf-8?B?WXV1d3E4c0x5bzR0SFdSKzkrdW5XVW90dGpBUnRjU1JZUzRaNHZLS2lScDl6?=
 =?utf-8?Q?cX2iizeC+TnhNWC7lOWZpUjXFlTjk/NTao60Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(41320700010)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnhZSFIzaXA1QkwzUG1sWnpXa3l4aS8vOFUwMnl2czZJQU9ocmpKQUZ5SWhI?=
 =?utf-8?B?eldPRDhDZXFMOFhEOTZoamlQbC8zQ3NDcXRIaG5US2tOWFo3R043cFcyUFhH?=
 =?utf-8?B?WllXUjZYcFNROFg4NlZYd3VrMDlRV1o3dnordHhhVnNqZ2EyWHJEaHFuakxB?=
 =?utf-8?B?RFNTMmRMUWpjNmZDZXozUXhZTUpkT3g4Y1VmK2UvcGZmWE1rdmg4S2c3TG0x?=
 =?utf-8?B?YU1kR0dMU3pkS1ZDMkh6MlZDbThheitGbDlJUS9XUmdOekxHa3UxZzR2Mlo2?=
 =?utf-8?B?aU4yVk9VYTl1dzU2Ty9xR3diUmN0dFBVWTkraVIvMHZyQUhhRkNNeWkrSVFZ?=
 =?utf-8?B?ais1emx3eDl3UTVKTS9QSUNSR0d0SUovUXlyRHdvZWxyRTRuUkY2eDYzbjhh?=
 =?utf-8?B?aG1kYzlVWWIyR2R0eUFTSEgvS2gxa2JOdUI5S1lHc0hmT25vOElhM3NUQ1Z1?=
 =?utf-8?B?Z0RxbW9YZ2kveVNzc01FZGNIVmp5V0NCQzRoNjlkMmFDK0ZrYjYvNngzbzVy?=
 =?utf-8?B?QnFtVlVwL2JwMFZkanBWMDlOSkl2R1FLNEdOTmVSaUJxTjdPMGFzYW4yUVp6?=
 =?utf-8?B?ZkdkT2xGMjZpMDdYVVBTajVqMnNHbVFoUWtoMnptQzJuWmxneDhMSFg4UGR6?=
 =?utf-8?B?UUZhMlkwQWdpa3ZMNVRzRWhwakRBWVBhbjRXZUJDd3AyWS90N3pwNlpkam5v?=
 =?utf-8?B?M05VNlNsNUh2VnBkNDZVWjZRRVJvaGwvb0xpYUVRMU9XREhiQm5MalV3U0ZH?=
 =?utf-8?B?eFFXZnJ0TitwQ1NScktOVkppZmVWdUdiK0NtcGh6dEN0Vk96V1ZNM2owcGJP?=
 =?utf-8?B?ZFdETmhlVW9TMm4wZytpQlN1VEtGeFovYnhPZGZ1VjZOemRzSmtjVXNnVTh0?=
 =?utf-8?B?RXFyNW53SDFDMWFrRjJQdHlMbDhBOWY5eEIrNHgwRGk1UzROQWN0K1ViK1Jq?=
 =?utf-8?B?MGhtZWJ4QlpXdDF4bjRIM3hveWdld0VodHhlWHFJTHBCRjlQL0FheDN2dlBN?=
 =?utf-8?B?c3RrZVNCN3NXRWhkMTkzRUgwUG4yRlcrekFHWnhCVTRXc2RTY20rbVhCTCtZ?=
 =?utf-8?B?N2JHaTFSTkpvZkFVVy9PM3ZHaE4wVXpJYWsyT2ZOYkNGZ1RtaEo1VXM0R05V?=
 =?utf-8?B?SzErbG9zVXU1SWRudWxyTkJsTTZnN05ZenFIcVlkZDVDUjI1WDlDVEorb3JD?=
 =?utf-8?B?VzFlSk9Ca2FXZy9qMTdubXVPTHU5ZHFHYkFtbzFBNVJLN0ZUNExLSzUyM3Z3?=
 =?utf-8?B?WS8vUlBkRS92dFh2bkdlTkE0Wmp2MEdHY1BSZHV0TENJcFl3N0pUaVJyclV2?=
 =?utf-8?B?Ulh0V3RqT216ZUtCTGN1dmRkMzEyVXhuRUFlMzFJMkJDdktQcU5ob0lVdTFh?=
 =?utf-8?B?RklpclRzRGJ5Q1k0cVUxSklTQWNad1RNblRieE5KT0VFaExFZnR6OWRtckJo?=
 =?utf-8?B?MjlJNFpxRWwwNy9uVWMyaW9xWEdIdi9MVGhvZzNrbFlVZm1sOXpvRWxjeDRl?=
 =?utf-8?B?ZnlwRDZIYzhwNUVXYUV2YmFJQkpHeFV1aHBvbllvM1hycTJsb2JzRTdJNVBt?=
 =?utf-8?B?S3hPcmpzT3Z4WnVzb2pEL0FJR1NncjF4OXNmUGVnajFQbnVHb0VNRWN2WXBC?=
 =?utf-8?B?UGRUY3QvM2hKTCtvcTFjTmxsTkgyV1hDOGhtSmhuVGtkSExGVmIreXlkUXVy?=
 =?utf-8?B?L3F0SExkRFpMMnQzWG0yMmpQcWlRd2JWcmNsUFU5WjQrMEYxZTNrOWkwWVNz?=
 =?utf-8?B?L1FiQkdNSFI0NTV2dUxESlFZVHJUc2t1NjJqZVYvM1BjOFRVZlp3Zm5UNm5s?=
 =?utf-8?B?V0FpaURwc0t3NWFPeTJkamdrQnhBbzkwUXQzZzA0Yzh4Rm1oc0tia3JvV1lS?=
 =?utf-8?B?SEE4TnROcUtTWUxqakYrMkJ6RVh0czdVeDgxekJVMWlFV0lMZ0E0ZDNheWwz?=
 =?utf-8?B?RlBDcUlyeUpHVXVjamV4VUFMYmVsVmx3NENIM3FZQW9iKzlNU3NpbXBWSGRu?=
 =?utf-8?B?U0hodWRqamtzZ2pJeFEwcEdrMm5JVEZkb3Z5R0RWZDBiM29pYnpMMms2YVcv?=
 =?utf-8?B?NDgxWnNZU3ArTC9mVzBGQVluendxU2tNTENDb0dpaW4xOWlQRmx4S01GS3pF?=
 =?utf-8?Q?tOycuPYVHWZWEFy78G19trw/4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <32051EDE20BF49408411E2CC5F99C5FF@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 5X3tjnO0ghp0fzR9jAu5NoQ2cwJ53NBXsxMnlmf3UUSFAnQpJifDEHtFcK8xILtslqSpV5bNZSC+SMthFjIKvKR2aPCOE90sDccv/GondBtaFKNV6Pg4yii2bpQcDAdG5cJgzmuMueMCmCySK2UtC+IBKXDzPKc2MjZDJt2QmeHXMLkT3kTjOxkJITbcIFw2CcpBNBqJfgg8NVj9Fd/5r2vbDkXLWLcCcC0Fud9SQ+NNXNDHV39ScPYNxXqyErOoRSuF4zRlOmeZ/qkKp7vrHIgLzlE2VcenmOkMZiq4+ziErRx7scGjRzmhdmPjQjLR1R70g6GbLljdukBKi1K09qg9KbsfVqgoqNz0rXxFBqXvzWUujmkzj6u+Wz8Qudiz7WT/dOWI5ELwj+OpSTYMaFrWDP8z7AMV8VVi4c83opr8ugX0m6j3gPawE+uOCRNOPeZzx5jW4NljIDmKIbNo6ob8fl906pzuAWKBzIlSK97yjGtLBTVpGOLqEL0Bc8FfIgoldILZMI5+EB79FW7nuE0PgMNK7auvJMNXktcQeiSsmcullRukbF8DrzDClL5ME9MkJB02mmAPmNGpjM+RDurLaustMOBCgIwewqUHtusHIPKoH8r1LgeczhD6I3ya
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c11fca8-0bf4-4753-cfec-08dc91dbdb3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 10:21:04.1922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qY3QSVKRnl2F7PpfI3FVGFVAgjmCd1Tz62Es5PkdzQ8oPZ5HPd90fJQLPZWZhZubDVFrbSAV/Vx9KRwet6X/fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6394
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxODk2NTMwODpGUEtleTEucHJpdjoFICZ6+bCM1n1SWESuXv3QZqtZaDVrlvxyS6wbYVDDpkb2WpEPFWYhv+NTjgVKSsYegmLBjlxvB7S/2E3CZ4I5O0QGM0YbbtBxHZ3gbo72PdIfO+E/qujLHcVfRj83Eeo3VnmIq/XKqn4P6FXOptQxAg8i2j/WLpU3Xcy9xNFbzjO3hArkQRN9YNAcgexE0/t36waB9m0eeFvIgWhAz71OIbOi734zbtr8+9X9UQ8TNVno58o6EwLDpBQoueH2jvC7O14bQPoDBS7L4kS5+zgmSGup+aYIJgzuLTrE8rMhfO2GUdWk6lxuygYMnfkHmEZb5xs4aBCDTGjvuMUdRZB0
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

T24gNi8xOS8yNCAyMTo0MSwgU3VuaWwgS292dnVyaSBHb3V0aGFtIHdyb3RlOg0KPiBbU29tZSBw
ZW9wbGUgd2hvIHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJv
bSBzZ291dGhhbUBtYXJ2ZWxsLmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0
dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0KPj4NCj4+
IEFkZCBjb21tb24gc3VwcG9ydCBmb3IgQUkgc2NhbGluZyBvdmVyIHRoZSBuZXR3b3JrLiBJbml0
aWFsaXplIHRoZSBoYmxfY24gZHJpdmVyIHZpYQ0KPj4gYXV4aWxpYXJ5IGJ1cyBhbmQgc2VydmUg
YXMgaXRzIGFkYXB0ZXIgZm9yIGFjY2Vzc2luZyB0aGUgZGV2aWNlLg0KPiANCj4gQSAxMjAwIGxp
bmUgcGF0Y2ggZGVzZXJ2ZXMgYSBiaXQgbW9yZSBvZiBpbmZvIGluIHRoZSBjb21taXQgbXNnLg0K
PiBDYW4geW91IHBsZWFzZSBlbGFib3JhdGUgd2hhdCBuZXR3b3JrIHNjYWxpbmcgc3VwcG9ydCBp
cyBiZWluZyBhZGRlZCBpbiB0aGlzIHBhdGNoLg0KPiANCj4gVGhhbmtzLA0KPiBTdW5pbC4NCj4g
DQoNCk9rLCBJJ2xsIGFkZCBtb3JlIGRldGFpbHMgcmVnYXJkaW5nIHdoYXQgZXhhY3RseSBpcyBh
ZGRlZCBpbiB0aGUgbmV4dA0KcGF0Y2ggc2V0IHZlcnNpb24uDQo=
