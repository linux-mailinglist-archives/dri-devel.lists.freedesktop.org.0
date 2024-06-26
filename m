Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B162917D7B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 12:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1463310E0A1;
	Wed, 26 Jun 2024 10:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="E14ZbrFb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B0110E0A1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 10:14:28 +0000 (UTC)
Received: from rly47b.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly47b.srv.mailcontrol.com (MailControl) with ESMTP id 45QAED2n008608;
 Wed, 26 Jun 2024 11:14:13 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly47b.srv.mailcontrol.com (MailControl) id 45QADdYm195409;
 Wed, 26 Jun 2024 11:13:39 +0100
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by rly47b-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45QADcNd195335
 (TLS bits=256 verify=OK); Wed, 26 Jun 2024 11:13:39 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5FmmrFR4h7uGTlY8yWTZUnPA5Bl7ujpeH9v+23lQ+9nCKc1azq1rYYqQqU1MBETk6NkEsuJT9oALDrQnMygjPxb1DnYloXn6ei3GxVuQJckU2x1tLQhbPIKzo88pg/VZc3uv44hQOnyDoo6uinSp/VOJMuORStk8cJfRHkSF+4J7T5cdwbEkGvYkKEKAUy4CtArMh3UiX+8CDLDrnpzqodAxkU7mLmKNqUPpfu6gIU3g2BUHmibidD1Z9D/2gQGpHXJGDhXygzFMjEwMzQHKn0r8EFh9tkRcAlrKQvwDfxq6CdjvDs6i850RNVJSQ+wFEGIC59PngF2l/4SFKP1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdB8J+tso5eUUMMUDt6kIDVfSe6I3PIEPgXWuNyhHJU=;
 b=R2q7Jrl7BAAL2oxD29EqQ8NFGTKJdWryfXHBPezDPrmMh3biKNGXDaHxOGLhP7ChxxT/XigkV5bB8jfd5W2bOIoRyA69ZYDkALDSTrOkGfbfe8lXyyfyy5sRqY4h0dtmcjue1axEsKMUaP7Wuegt+AEcjqvz/9seiNiESEmipAP8DuZzK3U520SXEIZMU/bxkOONgZUvMi65il4xhoVn5ytTJ1VTpajbddOYlSQWoSgcLJcf0pWGxjqSaa+Kz5Us0OMmryS+n+0S/HWB5+mVlsfIfy4FF0BtIVwhwMkCQ4rMRsQJv2xswtpAztFqaPp9bZn6Y6eOLzquW++yBXrh3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdB8J+tso5eUUMMUDt6kIDVfSe6I3PIEPgXWuNyhHJU=;
 b=E14ZbrFbtX1i6FU2SoyLsqN80EdLxrRrh4h7evyH8zD9RPpQgIeuYK6fmX/z83HeXfqSaxgkYpnt917ryFlh+Ju/wIWJGpmF5DGJUvxJMFGNfwCHFMQj3BzbA60tLcg0Bw0+ybw2KCZZO/E+iPWzAQ7nN8cu9iUydHhxfMcAaEjlWLy1znE3aa3SuvgM3uNIpueQhvdvZjEz+ioJ8PdftK91vYWkc5v1agqnU0NQTdkv8TlRo42Ra5Os/MY9Kals7Aa+eMa8JYhGw3DXzsBzk+h4c4djnbngdKRppDLLziUBU+77bEeCxkpqUjkCsfMiIiAbr/sfWCE63tUle8ZYsw==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by DB9PR02MB7913.eurprd02.prod.outlook.com (2603:10a6:10:33e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 10:13:35 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 10:13:34 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Andrew Lunn <andrew@lunn.ch>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Thread-Topic: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Thread-Index: AQHavWrQgrJbi1vMQEmkq/v8mH9idrHGPFGAgAbik4CAAHs1AIABHDsAgACWKwCABaQfgIAAjKwAgARq4QA=
Date: Wed, 26 Jun 2024 10:13:34 +0000
Message-ID: <96677540-c288-43f6-9a47-1db79a0880eb@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
 <10902044-fb02-4328-bf88-0b386ee51c78@lunn.ch>
 <bddb69c3-511b-4385-a67d-903e910a8b51@habana.ai>
 <621d4891-36d7-48c6-bdd8-2f3ca06a23f6@lunn.ch>
 <45e35940-c8fc-4f6c-8429-e6681a48b889@habana.ai>
 <2c66dc75-b321-4980-955f-7fdcd902b578@lunn.ch>
 <8a534044-ab84-4722-b4e9-4390c2cc6471@habana.ai>
 <f45a71f9-640e-473a-9b80-90a50b087474@lunn.ch>
In-Reply-To: <f45a71f9-640e-473a-9b80-90a50b087474@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|DB9PR02MB7913:EE_
x-ms-office365-filtering-correlation-id: 83e5bf08-d095-4b64-4b7a-08dc95c8a376
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230038|41320700011|366014|1800799022|38070700016; 
x-microsoft-antispam-message-info: =?utf-8?B?cWtRdnZ1b2twYy81d21ZdE5ZUS9OLzZRQk92MjE3M0wzYS9iUDdJbDk5TjBC?=
 =?utf-8?B?cVNOYzZ4T3ovdGhoMHFFcjNWUWhkbHRPdVA1ZjBJeWNOaWNvZnBYMnowbFFi?=
 =?utf-8?B?QjhBc1NBdms2R0laMUFGZzFzTUc0ZDNucFNhWFBTRWwwMm9xVzJtdEJFL0la?=
 =?utf-8?B?K01UZkVaRWwyaWt6YjFYTFhZWk1sWFB0eWcxeEVNTFJqbTlVeVRFcjZPNTB4?=
 =?utf-8?B?MndxOVd4UlZQZFZLTGxSbXpCektzZ0xOdVdEbHM0UmJDdENwZTAzU3JNcSsv?=
 =?utf-8?B?WDljdk41WTFVQUZ5RkJyT050ZFdlbjVWUVovbUgxcFloMGcwNVc5Q3J6NkpP?=
 =?utf-8?B?dkFPdXVjM00wcHB1bDZOK3ErTWdzUnc1RmcxU05tS25IRWZpeTZmSU92c2RR?=
 =?utf-8?B?eEhaeTNtak5BNktabXdYY3JjSnBMVU9iNXR5amQ0RXRxdDZia3Q2aDcvdGY3?=
 =?utf-8?B?cXlDS042NU1uQys5dVZRaU5zWTFZVUlRSWZVc29IYlltWk1sQWVFZFVpOXRZ?=
 =?utf-8?B?U3VUSnE2T0dZdmFuYnI4NkM1V2lUWWJNNzNLdUY2eEYyZ3B5SEI5YXQ0RHY2?=
 =?utf-8?B?UVNyUzlLMk05UnJFeXA3bm5TUXdXd1RzZGhYUE5Ha0tXZGM4RXBFV0w2aGN0?=
 =?utf-8?B?RFFHak1TNklEY2dMOTJTSWtPQis2Tm5pWnBhbmhTdjdrN1o3cVV5OXIvU1Rx?=
 =?utf-8?B?VTMwQ0d1bjRrYkJUMzJSZEZmeE5LQ3h2RTZtYkVVZDFlYVladm92KzBWa0hF?=
 =?utf-8?B?VXU2YUcxTDZ6czljMmVjd2dkcHgvMWhLN2NuVXNiVzczdENUc09LcnB2eU1w?=
 =?utf-8?B?aUhIZlBGZFNqajRZMlpWN3I0Q2RqV08yVVBVREpYT1Q5SzlJRnhDMGY0ODZ1?=
 =?utf-8?B?MWQ2K3hhRHZtQVlKZHNCQ1VpcFR1U2dLL3ZNdWY4eVlzZTVZaTJpTDZIbCtK?=
 =?utf-8?B?VnhQbnptRDJJc1RteENsYVlYMDZwenVVbEp5Q2FTK1p5VjFvdWJ3Mm82aHJH?=
 =?utf-8?B?aEI1OEpaODFpM241MVJoUUFUVWtvc1ZQWVo3ZDVVL0Rtdmh1YUZybkE0cm1Q?=
 =?utf-8?B?RnIweHZsOVFKRUd1aWJ4WWR4N1l2VnBNcGVZdGMwRk9IR2VPK1VBN2NaZERB?=
 =?utf-8?B?V095T0VFQlJ2eUp0UWh6RW9BTnhIckg4WHRRbURnR1c0dnN2TFVtZW10VzZU?=
 =?utf-8?B?cU55NkZQNHVqRkZmL3dHN3NYeFBaMjkzdDBCNzllMVpkb0RvS3U4UExPTk5R?=
 =?utf-8?B?QXJldmFyODBYWnFtR1J6dlNnYkRIN0NmOHhpa2VmNUhha2dnL3hoWTFLaDht?=
 =?utf-8?B?R09Calh5ejJSTjB3OUJBbjRZVlc1cWdYaWtRZlRTaDFFWTdXZDZkaTdHYXB5?=
 =?utf-8?B?NmV0YmUxNDI4RTJqQTk4Z0RtRFRuWXpDbXhuTHpXQWZSSThFMlp6SkZkem13?=
 =?utf-8?B?aHRKOVp6Nkw4eTUzYURMRWo3WjRzRk5mWll3dXhpSExBY0dwMnpCS2hFT1Br?=
 =?utf-8?B?UkE4Z0pqRHlIZzNZYkR2QlBtaVE3b1I5aHAvcm9LZi9FSVhmS3pSZ3hURVRT?=
 =?utf-8?B?TjFPVjYvQ2FtRjJFYytLMThmbndaOUJXWTFpTnU1TjJlazdOVlZCRC9BaUxz?=
 =?utf-8?B?TkdpUmxiSUxkZkEzek1tZ0NNd2NMeXlzMURpb3A1bGZhOUtMc3g4Qm9qaWVS?=
 =?utf-8?B?R2ZranBURmFQVEsvMHNYWGhHa1dpcThILzdJUGY3c1ZIT0hLcHMxR0E3ZGxk?=
 =?utf-8?B?c1crOGJ6S2xVRmxrSjZPN3FDSlJodkYvdU5ybGp5aE52aHBwUCt6eEZmZGU3?=
 =?utf-8?B?OUp3RXNkYUFFTzBXUk5LYXVPQ3dRQlhLRVJKNTRJOVJWOTd5eC83R0RIWHlO?=
 =?utf-8?B?VVBlS29CU2d2cm5jbndTMm5KSkhMY2FUeXhocW54d0gveWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(41320700011)(366014)(1800799022)(38070700016); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFJ6MlQweEhDYkxSOEZjQVMwVVRBWUtEdUc2czlWY3FscEFOQ2ZGMmt2c0Nk?=
 =?utf-8?B?MkVPOXltQzJ6L2Q0MFU4S2FUT3k1c1NueUdLVjRaUFBZUURPNEx5WjU1ZXV5?=
 =?utf-8?B?WVdhclp6aUNOcUdmbmZJWU91dVZ1VHRaaCtjdFIrMURoV1ZYM3k1UDN2SE02?=
 =?utf-8?B?WFpEV0QwQVpRMlRyd213cjNTZHEyVjZjbHNINkVzaEloYklLKzNBTUJOUDYv?=
 =?utf-8?B?cVRGTHlmQUc0VDZOc3IxZEc5WTJIQnRTTlJBSU1neVpvcDlJVWg0VVZVSEMv?=
 =?utf-8?B?RmdGemxmVGtTdURBMkNNY1YyZTBpMnhZNFpWL0o2WFZBK3haK1dxQlFJaDkv?=
 =?utf-8?B?OEJtTm9TUmQxbjh0Zi8vaGVCL1hNSTNSTTBoOERGekhLRUh2eE1naHpVN0wy?=
 =?utf-8?B?UGJBaUtBcHdQTXhQT2w4aUJFRFZKQS9sV09IOGxyS2dmU2FxSjhHWFNWVWtt?=
 =?utf-8?B?ZnhRbnViN2N4M1R0YTdXeklDNlpnZUVJSnFRZ25ZTXpmNkVZbHNPaDJ4SDVS?=
 =?utf-8?B?SXZSRHJxUHpRQXFleklFVXZOdFdIZXVvTW1WdW4yejdXOVhDSnlJUitUUXE4?=
 =?utf-8?B?YjhGL01SdzRNdGxHcnNlZU1lakRKb1hIME91ZG1EYlZaejNUL0xscXNndmRh?=
 =?utf-8?B?QmJnbElvNHpob1NDV3pZdUkwUmxwU3cwVk9VbTZXSjMxQklqN0ZlRUtxZWVp?=
 =?utf-8?B?SHhpRFU0ZVZFT3F1OHRMS0NDZVJSdEs0dVg2RStGQk1PekdvRWY0MXpHZVJP?=
 =?utf-8?B?N3JEQld6OWdMOHlVSnNBeEx0Vk54SEVLSHJzUlU5aGxtRWU4K29Jd0ZvVys1?=
 =?utf-8?B?NGc0ZG1vZy95VEJaSkRBeWE3bEVHazlYOENGTlpxbzREQjRQUW5qTU8xRE9a?=
 =?utf-8?B?STRNZll4TEZISklSUW9JaHpHT2ZoVG5qRVJKb2dRTTk0RUFDaHNXUXdOSlJl?=
 =?utf-8?B?VnJQQnZzbUtTZXlJc2hvNWorMVFLWGFRSUdVRTBUdDEza2lhdmRyS2JKT1Z2?=
 =?utf-8?B?RVZ6MmVpZmhiRGhva3V4Z2pDR0ZjWEpwMW45dHBGQlEyWW91aXYxb1E5ZURQ?=
 =?utf-8?B?UXlqRHJzLzRVWG1NeEJ0Ky9vN1hIVWRsQUhtZHg5TVZCRm5ZOFBXOHBXQWJT?=
 =?utf-8?B?ZXV2YW5QcXNDRlovaFpyZ1QrQlEzZ0daT0RMcmtXMkx2S3RZM1J3MFYzLzV2?=
 =?utf-8?B?RDJobkd0Kyt1cWJZaHV0ZWxydHA2eU5ZR3ZaRGR6OEJ0RjNVQm1FYnhRZHcz?=
 =?utf-8?B?VlZwKzJpbzFYZlh3S1hsbGh1RVRKUE5vT3VBYzh5RFpYRWwxSFRTWWkrZzAx?=
 =?utf-8?B?eE9HVUZISnN2R2FPb04rRXRtOXczN0pmKzJ3QUlrV0V6MEJXOFc2WWkzemZD?=
 =?utf-8?B?S1E2ZGZGeXQxWTk3M3hTQ3lrb1d5SmtFZ3F4SmJMMjZPcWljWnhqWkhZazhJ?=
 =?utf-8?B?bVR6dTBMSFpHdll0SWI0V1ZqZkxzbW5QQTRwOHl6ZWVaWkJYTjhabzBLK0ZZ?=
 =?utf-8?B?YlRzWlc4NkdCM1JnalJrOWpVNEErVVpsQlBzYlQ1dTYzQlV3RWtSQkFYdWNS?=
 =?utf-8?B?bGpTOUFPWlVMSjJhWlRzd0puajd2NzM2UThNUXN2bWF6Y1E4TW9zamczZDJC?=
 =?utf-8?B?d2QzeHl5a3FTdjRGZkt2TlNPSjRMNE50eTVZY0RrMEZZdTBRVXNRa0xwQVJy?=
 =?utf-8?B?N24yM3lrREhFakZ5bGRxWms0Ry9ERy91bUNyem93MlFJRHJFQnpmaW5OSnhZ?=
 =?utf-8?B?UHRyUXZBVTNMKzdjM2RSVTNydTlrVGF6SXg5aW1SZUZLZUFHSVFCQ2NwZmNV?=
 =?utf-8?B?RHF5bXRoZldwRGhRWmlkUldadWE5b2NaUG13TWtYQU1VbkRCWWsyYTVYelc3?=
 =?utf-8?B?TTJHWitjYTE3MnIwM3JVL0ZGK3dDMmVhaDRyd1FKSm51UWQ5eXZoUU56Nmk0?=
 =?utf-8?B?eHZMbU0rY2dQV1YwRjZvMFdkRGpEVjJOV2JhVUpQWVBLZ2lQR0pQWHo5dnV0?=
 =?utf-8?B?ZW9zQmZleW1mbEtNSFV1cWxXcG1yaGZiYVlVdFZHQ0d6dnhNUU41Ylc4MGFM?=
 =?utf-8?B?Vk9qRTNmdDVHQUoyVksycDdxZHdRbUx0ZERYSFZNd05qYTQ1L0RzeWhPcDZE?=
 =?utf-8?Q?xzs/MfN+osg0aDhjLp7nwXU+K?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6A373C9F348F84AAC8DCFA5891DEE3F@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 94vXH0PqG+GDB/PnIfugFtcPTgdLm+VC+MMkDzhTKibwSLjuENbsR/aW84U9ERoVvYSt1eOJVV2l14331RGve9fUub+I4Woh1AscKYUyxf/btPxgzry+2kxkaiwxnlyR4aIqqQH4jIt+N0RysxxzqsB4FpsnRzf7mUTae9SwX36NRo0Cc4EvbNvOG1Zh+QHhI9yQgZ8T+vRARPRQaAcCMMup7LUsRn4rtY0xj2t6qFgXhjlW0TTK5crXTOl4Fb7IupzHGNGzjdbaS2cRp8FY8QAjxG4Ekck5JurCp2kawP/sUU0o4jILcVgiUX8PkRlUS90ZowAhmH6wV0cY+ITtm2wODP26NHMyZA7fBldKAZ+SudJ9crp8ratL8QQzfOusR8Yif5RVZpaDMTO2JZRSiFG9WlCLloNknx6wKQUejWZ9VjKAReUu0OoqVt77godK5UwZBVKyHvs7+UfQuhFKNUPTq84d5cr/VIWOniDSfHKrTeUTl7yM+2G5/Se91SxLwiq7w9RudejmDXoy3tSAlggRtK636EfP58BQK//2GnQvY4pumfGO/KRgjXTXhM9ImBu87fpgc5xD0GFaPRP0YB9Zo/EE85x3Zr+6b0WMnpjTFTK2n42LjOF6rWhOqDYQ
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e5bf08-d095-4b64-4b7a-08dc95c8a376
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 10:13:34.7954 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G3G2rPocaa2SizJVesfo10XxmPODsvwJLtHep9xMJz8/zY/2QRzzhn2SWHtRMQ2wjajWodFuBqzmHOcKhBKgtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7913
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxOTM5Njg1MzpGUEtleTEucHJpdjrG9JH6LQxRZi+sDB3XaTAh4M1WSxr8TOplO6u3gmYEgsyH39krqlddDQlWj04rVZBFAvwLjJSTNWQNNjeszWxCd51UG14Nr9Hp1Db3Kv/lUJf2wSsfWpsdXZ5crVSnqXI0OvEWPiaPY2VHj2JEEeB5gnbU2zoTIa9YK59MJCGM0vghDzaH/j34zqhM1J8WTASzJbPFwiZBZsVvEy7thPp0f/AMTQBIf8yH/ATm6DGqEX+KjLfNnQwBEu7wNyd6YZ/2eefb3x6Mk8mpBqgSb/2oDvygfHNGDQezU1onTJKgwDhLgGAw03dt3U1VQVgZa/4/ezbq38A5vgFlJolJ9OpS
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.66.1.157
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

T24gNi8yMy8yNCAxNzo0NiwgQW5kcmV3IEx1bm4gd3JvdGU6DQo+Pj4gQnV0IHdoYXQgYWJvdXQg
d2hlbiB0aGUgc3lzdGVtIGlzIHVuZGVyIG1lbW9yeSBwcmVzc3VyZT8gWW91IHNheSBpdA0KPj4+
IGFsbG9jYXRlcyBtZW1vcnkuIFdoYXQgaGFwcGVucyBpZiB0aG9zZSBhbGxvY2F0aW9ucyBmYWls
LiBEb2VzDQo+Pj4gY2hhbmdpbmcgdGhlIE1UVSB0YWtlIG1lIGZyb20gYSB3b3JraW5nIHN5c3Rl
bSB0byBhIGRlYWQgc3lzdGVtPyBJdCBpcw0KPj4+IGdvb2QgcHJhY3RpY2UgdG8gbm90IGtpbGwg
YSB3b3JraW5nIHN5c3RlbSB1bmRlciBzaXR1YXRpb25zIGxpa2UNCj4+PiBtZW1vcnkgcHJlc3N1
cmUuIFlvdSB0cnkgdG8gZmlyc3QgYWxsb2NhdGUgdGhlIG1lbW9yeSB5b3UgbmVlZCB0bw0KPj4+
IGhhbmRsZSB0aGUgbmV3IE1UVSwgYW5kIG9ubHkgaWYgc3VjY2Vzc2Z1bCBkbyB5b3UgZnJlZSBl
eGlzdGluZyBtZW1vcnkNCj4+PiB5b3Ugbm8gbG9uZ2VyIG5lZWQuIFRoYXQgbWVhbnMgaWYgeW91
IGNhbm5vdCBhbGxvY2F0ZSB0aGUgbmVlZGVkDQo+Pj4gbWVtb3J5LCB5b3Ugc3RpbGwgaGF2ZSB0
aGUgb2xkIG1lbW9yeSwgeW91IGNhbiBrZWVwIHRoZSBvbGQgTVRVIGFuZA0KPj4+IHJldHVybiAt
RU5PTUVNLCBhbmQgdGhlIHN5c3RlbSBrZWVwcyBydW5uaW5nLg0KPj4+DQo+Pg0KPj4gVGhhdCdz
IGEgZ29vZCBvcHRpbWl6YXRpb24gZm9yIHRoZXNlIGtpbmQgb2Ygb24tdGhlLWZseSBjb25maWd1
cmF0aW9ucyBidXQNCj4+IGFzIHlvdSB3cm90ZSBiZWZvcmUsIGNoYW5naW5nIGFuIE1UVSB2YWx1
ZSBpcyBub3QgYSBob3QgcGF0aCBzbyBvdXQgb2YNCj4+IGNvc3QtYmVuZWZpdCBjb25zaWRlcmF0
aW9ucyB3ZSBkaWRuJ3QgZmluZCBpdCBtYW5kYXRvcnkgdG8gb3B0aW1pemUgdGhpcw0KPj4gZmxv
dy4NCj4gDQo+IEkgd291bGQgbm90IGNhbGwgdGhpcyBhbiBvcHRpbWl6YXRpb24uIEFuZCBpdCBp
cyBub3QganVzdCBhYm91dA0KPiBjaGFuZ2luZyB0aGUgTVRVLiBldGh0b29sIHNldF9yaW5ncGFy
YW0oKSBpcyBhbHNvIGxpa2VseSB0byBydW4gaW50bw0KPiB0aGlzIHByb2JsZW0sIGFuZCBhbnkg
b3RoZXIgY29uZmlndXJhdGlvbiB3aGljaCByZXF1aXJlcyByZWFsbG9jYXRpbmcNCj4gdGhlIHJp
bmdzLg0KPiANCj4gVGhpcyBpcyBzb21ldGhpbmcgZWxzZSB3aGljaCBjb21lcyB1cCBldmVyeSBm
ZXcgbW9udGhzIG9uIHRoZSBsaXN0LA0KPiBhbmQgZHJpdmVycyB3cml0ZXJzIHdobyBtb25pdG9y
IHRoZSBsaXN0IHdpbGwgd3JpdGUgdGhlaXIgZHJpdmVycyB0aGF0DQo+IHdoeSwgbm90ICdvcHRp
bWlzZScgaXQgbGF0ZXIuDQo+IA0KDQpBY3R1YWxseSBJIHdhcyB3cm9uZywgd2UgZG9uJ3QgYWxs
b2NhdGUgbWVtb3J5IGluIHRoaXMgcG9ydCByZXNldCBmbG93LCB3ZQ0Kb25seSByZXNldCB0aGUg
cmluZ3MuIEJ1dCBJIGdldCB5b3VyIHBvaW50LCBpdCBtYWtlcyBzZW5zZS4NCg0KPj4gSSBnZXQg
eW91ciBwb2ludCBidXQgc3RpbGwgaXQgd2lsbCBiZSBnb29kIGlmIGl0IHdvdWxkIGJlIGRvY3Vt
ZW50ZWQNCj4+IHNvbWV3aGVyZSBJTUhPLg0KPiANCj4gS2VybmVsIGRvY3VtZW50YXRpb24gaXMg
cG9vciwgYWdyZWVkLiBCdXQga2VybmVsIHBvbGljeSBpcyBhbHNvDQo+IHNvbWV3aGF0IGZsdWlk
LCBiZXN0IHByYWN0aWNlcyBjaGFuZ2UsIGFuZCBhbnkgZGV2ZWxvcGVycyBjYW4NCj4gaW5mbHVl
bmNlIHRoYXQgcG9saWN5LCBkaWZmZXJlbnQgc3Vic3lzdGVtcyBjYW4gYW5kIGRvIGhhdmUNCj4g
Y29udHJhZGljdG9yeSBwb2xpY3ksIGV0Yy4gVGhlIG1haWxpbmcgbGlzdCBpcyB0aGUgYmVzdCBw
bGFjZSB0byBsZWFybg0KPiBhbmQgdG8gdGFrZSBwYXJ0IGluIHRoaXMgY29tbXVuaXR5LiBZb3Ug
bmVlZCB0byBiZSBvbiB0aGUgbGlzdCBmb3INCj4gb3RoZXIgcmVhc29ucyBhcyB3ZWxsLg0KPiAN
Cg0KT2ssIGdvdCBpdC4NCg0KPj4gSSdtIGZhbWlsaWFyIHdpdGggdGhpcyBsb2dpYyBidXQgSSBk
b24ndCB1bmRlcnN0YW5kIHlvdXIgcG9pbnQuIFRoZSBwb2ludA0KPj4geW91IGFyZSBtYWtpbmcg
aXMgdGhhdCBzZXR0aW5nIHRoaXMgQXV0b25lZyBiaXQgaW4gbHBfYWR2ZXJ0aXNpbmcgaXMNCj4+
IHBvaW50bGVzcz8gSSBzZWUgb3RoZXIgdmVuZG9ycyBzZXR0aW5nIGl0IHRvbyBpbiBjYXNlIHRo
YXQgYXV0b25lZyB3YXMNCj4+IGNvbXBsZXRlZC4NCj4+IElzIHRoYXQgcmVkdW5kYW50IGFsc28g
aW4gdGhlaXIgY2FzZT8gYmVjYXVzZSBpdCBsb29rcyB0byBtZSB0aGF0IGluIHRoaXMNCj4+IGNh
c2Ugd2UgZm9sbG93ZWQgdGhlIHNhbWUgbG9naWMgYW5kIGNvbnZlbnRpb25zIG90aGVyIHZlbmRv
cnMgZm9sbG93ZWQuDQo+IA0KPiBQbGVhc2Ugc2hvdyB1cyB0aGUgb3V0cHV0IGZyb20gZXRodG9v
bC4gRG9lcyBpdCBsb29rIGxpa2UgdGhlIGV4YW1wbGUNCj4gaSBzaG93ZWQ/IEkgbXVzdCBhZG1p
dCwgaSdtIG1vcmUgZnJvbSB0aGUgZW1iZWRkZWQgd29ybGQgYW5kIGRvbid0DQo+IGhhdmUgYWNj
ZXNzIHRvIGhpZ2ggc3BlZWQgaW50ZXJmYWNlcy4gQnV0IHRoZSBiYXNpYyBjb25jZXB0IG9mDQo+
IGF1dG8tbmVnIHNob3VsZCBub3QgY2hhbmdlIHRoYXQgbXVjaC4NCj4gDQo+IAkgQW5kcmV3DQoN
CkhlcmUgaXMgdGhlIG91dHB1dDoNCiQgZXRodG9vbCBldGgwDQpTZXR0aW5ncyBmb3IgZXRoMDoN
CglTdXBwb3J0ZWQgcG9ydHM6IFsgRklCUkUJIEJhY2twbGFuZSBdDQoJU3VwcG9ydGVkIGxpbmsg
bW9kZXM6ICAgMTAwMDAwYmFzZUtSNC9GdWxsDQoJICAgICAgICAgICAgICAgICAgICAgICAgMTAw
MDAwYmFzZVNSNC9GdWxsDQoJICAgICAgICAgICAgICAgICAgICAgICAgMTAwMDAwYmFzZUNSNC9G
dWxsDQoJICAgICAgICAgICAgICAgICAgICAgICAgMTAwMDAwYmFzZUxSNF9FUjQvRnVsbA0KCVN1
cHBvcnRlZCBwYXVzZSBmcmFtZSB1c2U6IFN5bW1ldHJpYw0KCVN1cHBvcnRzIGF1dG8tbmVnb3Rp
YXRpb246IFllcw0KCVN1cHBvcnRlZCBGRUMgbW9kZXM6IE5vdCByZXBvcnRlZA0KCUFkdmVydGlz
ZWQgbGluayBtb2RlczogIDEwMDAwMGJhc2VLUjQvRnVsbA0KCSAgICAgICAgICAgICAgICAgICAg
ICAgIDEwMDAwMGJhc2VTUjQvRnVsbA0KCSAgICAgICAgICAgICAgICAgICAgICAgIDEwMDAwMGJh
c2VDUjQvRnVsbA0KCSAgICAgICAgICAgICAgICAgICAgICAgIDEwMDAwMGJhc2VMUjRfRVI0L0Z1
bGwNCglBZHZlcnRpc2VkIHBhdXNlIGZyYW1lIHVzZTogU3ltbWV0cmljDQoJQWR2ZXJ0aXNlZCBh
dXRvLW5lZ290aWF0aW9uOiBZZXMNCglBZHZlcnRpc2VkIEZFQyBtb2RlczogTm90IHJlcG9ydGVk
DQoJTGluayBwYXJ0bmVyIGFkdmVydGlzZWQgbGluayBtb2RlczogIE5vdCByZXBvcnRlZA0KCUxp
bmsgcGFydG5lciBhZHZlcnRpc2VkIHBhdXNlIGZyYW1lIHVzZTogTm8NCglMaW5rIHBhcnRuZXIg
YWR2ZXJ0aXNlZCBhdXRvLW5lZ290aWF0aW9uOiBZZXMNCglMaW5rIHBhcnRuZXIgYWR2ZXJ0aXNl
ZCBGRUMgbW9kZXM6IE5vdCByZXBvcnRlZA0KCVNwZWVkOiAxMDAwMDBNYi9zDQoJRHVwbGV4OiBG
dWxsDQoJQXV0by1uZWdvdGlhdGlvbjogb24NCg0KVGhlcmUgYXJlIGZldyBwb2ludHMgdG8gbWVu
dGlvbjoNCjEuIFdlIGRvbid0IGFsbG93IHRvIG1vZGlmeSB0aGUgYWR2ZXJ0aXNlZCBsaW5rIG1v
ZGVzIHNvIGJ5IGRlZmluaXRpb24gdGhlDQogICBhZHZlcnRpc2VkIG9uZXMgYXJlIGEgY29weSBv
ZiB0aGUgc3VwcG9ydGVkIG9uZXMuDQoyLiBSZWFkaW5nIHRoZSBwZWVyIGFkdmVydGlzZWQgbGlu
ayBtb2RlcyBpcyBub3Qgc3VwcG9ydGVkIHNvIHdlIGRvbid0DQogICByZXBvcnQgdGhlbSAoc2lt
aWxhcmx5IHRvIHNvbWUgb3RoZXIgdmVuZG9ycykuDQozLiBPdXIgc3BlZWQgaXMgZml4ZWQgYW5k
IGFsc28gY2Fubm90IGJlIGNoYW5nZWQgc28gd2UgZG9uJ3QgbWFzaw0KICAgbHBfYWR2ZXJ0aXNp
bmcgd2l0aCBhZHZlcnRpc2luZyB0byBwaWNrIHRoZSBoaWdoZXN0IHNwZWVkLiBXZSBhaW0gZm9y
IGENCiAgIHNwZWNpZmljIHNwZWVkIGFuZCBoZW5jZSBpdCdzIGJpbmFyeSAtIG9yIHdlJ2xsIGhh
dmUgYSBsaW5rIHdpdGggdGhhdA0KICAgc3BlY2lmaWMgc3BlZWQgb3Igd2Ugd29uJ3QgaGF2ZSBh
IGxpbmsgYXQgYWxsLg0KNC4gSWYgd2Ugc3VwcG9ydCBhdXRvbmVnIGFuZCBpdCB3YXMgY29tcGxl
dGVkLCB3ZSBjYW4gY29uY2x1ZGUgdGhhdCBhbHNvDQogICBvdXIgcGVlciBzdXBwb3J0cyBhdXRv
bmVnIGFuZCBoZW5jZSB3ZSByZXBvcnQgdGhhdC4NCg==
