Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8461990DD4A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B51C10E7B1;
	Tue, 18 Jun 2024 20:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="g7P841kk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DE110E788
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 19:39:42 +0000 (UTC)
Received: from rly16b.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly16b.srv.mailcontrol.com (MailControl) with ESMTP id 45IJdQdb138223;
 Tue, 18 Jun 2024 20:39:26 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly16b.srv.mailcontrol.com (MailControl) id 45IJdGYN137444;
 Tue, 18 Jun 2024 20:39:16 +0100
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02lp2040.outbound.protection.outlook.com [104.47.11.40])
 by rly16b-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45IJdDk2137288
 (TLS bits=256 verify=OK); Tue, 18 Jun 2024 20:39:16 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dANg+uAqbaYpan48DbX7vAb9FzT19ay27HrfxkBeP0leHmmXVjsyR4sUcxg1NudXZQZQEV92W9eZX4cVftzlShcF+nEcVgGSzmzTismr/t8awtRyNxO6v1T/j265BsrMWX1x9F8Cfwu9Zi/QH59DTOqP/NUNPEdDDH3dLvsmW8gLVHW5/CMKe3hmEFpFw6TVgw9zFkX93se2EJuyn1VQJIxA9aRQ79c3H1NJiiDK5FNWzD55kxOPfnjZpVrrTPDVGVoaUa6G6i6vmDI46jbrWm7261yi2CYyqGjnm5VKFcDHya8xcvFv4bZd5SgrpQBd9eU4dqfmO2HBwUKfS0Vp/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4zkwfZ+BCruQCD0zJW7GjVm6yYbqXMHEVUvQ5fnuG8=;
 b=fPSwtknfQEL+LpOOm2/mp+hwfHo4VKzFA9rr2rhLmPl7+az3LV2PMxTFZGFEIzgwi1u7SY12PvXV860TZPlGTsgRaR1g9jD8D4C1yPQrO5uqKKo6Y7D+aEA8vm8gVyGOeWMl2QsGPm+R+r3z0n8QuXMXWVV7WWhBX3Rsz+TUwpwgFyPsbqcxbs0izLNMY3qObs2WE+l8LG7KwlMLiPGGZGu97DOBJIKu2VkiilTpSqt8Atrbr24Jnf7agsr9nj3cg+LIQ+mmzWixEZYPrXti5Infj9sXULzy2Cu60VII0v6DXJRE/iTaeXWjJdlCv+P3J+NYJY1fcVj/WVsd+TeyQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4zkwfZ+BCruQCD0zJW7GjVm6yYbqXMHEVUvQ5fnuG8=;
 b=g7P841kkfJOqNFUhZPnTI81Zq0Rl+5ROHy6TlwcMEICpk+JSvAPQ2zz6ZqczhAm7SOdVXdagwWkw5RliCJ4NV+1Wd4Tx4m9YrqiIAOrbRmw8Wz38tLZw++A81bX9GrvuqFu3ao59dyI9ysmZPyQerMGhbcldtw1Ak7hynBm/Hdz9Fz5ExFxqiHAPen1oXfgUSltGZMsbzOXp4gYV9cD8ev+5pPeZpBJTnZShYq6JTYwxXbMDtl8dhWBevPKSstiItuoWwNrEBfDlTCd2sSxSfritANp+jGmI2ipjieWD+AekkcU9jCSRRIm+r7jN/EPGXMNPg123NK6kel4rBiQSGg==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by AM7PR02MB6258.eurprd02.prod.outlook.com (2603:10a6:20b:1b8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 19:39:12 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 19:39:12 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Stephen Hemminger <stephen@networkplumber.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Thread-Topic: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Thread-Index: AQHavWrQgrJbi1vMQEmkq/v8mH9idrHH96YAgAX76AA=
Date: Tue, 18 Jun 2024 19:39:12 +0000
Message-ID: <46806cc6-4008-467e-8ebf-cb70d1b8118c@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
 <20240614171618.3b65b3c9@hermes.local>
In-Reply-To: <20240614171618.3b65b3c9@hermes.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|AM7PR02MB6258:EE_
x-ms-office365-filtering-correlation-id: ef899065-848c-4b48-a7cc-08dc8fce5495
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|1800799021|41320700010|366013|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?NjA4c1hvc3ZoekdkTldYTHloZFY3R1ZVR1hZN0RsWmdSem56QWRZL2NFYWx5?=
 =?utf-8?B?VTVrOTVqZzRONkp4N1JUN1ZCRkpkRHZnRzZnLzJ4TFBqTVh2K3l0UzVURGVG?=
 =?utf-8?B?WDByUjVQWVZma0E5ZmltY21FQVllRTRpZDdvNEorOFROczVraStjYWlENVNQ?=
 =?utf-8?B?djZJWjg5VmJNSldGYmRGK2o1Q2liWnBPU3RBbFhMRmNOYXViQUdSV1hVY3Er?=
 =?utf-8?B?TFVWeVJnbDdkSlE4VTZ4UkFyWDhzRFlTb0VWSE0za0hFZTZQRktaeWQ4NkFa?=
 =?utf-8?B?b2xzS2hrNTZYdUJ3OGtPaXRqTjlBSjhZUnBDUlpzS1lEamxlUVpLM2hzOUpv?=
 =?utf-8?B?elMyUXk3UW5Cd1hZS0pNZUQxZzREMmVIVERNcmg4cnR0Vldzdm02eDFIOEZo?=
 =?utf-8?B?cWEyb1B6VHVFRkRUcEd1aGFBeUs0VFUvbTgvWEZzY08vMFg0dHBpTW9KZm5t?=
 =?utf-8?B?bFZrejRsN1pwWG1rQlVMeGxseHZnVnZFNTE5Y1AwUzd1NGpHb1A3MTgyNUs3?=
 =?utf-8?B?eHd4ZjcveU9VVnJMenFpMWZnSDNNNjVNdkd0WWxuY09hZDlxMGpJSUw3S2RE?=
 =?utf-8?B?ZmxncVNVRzlpZk4zTExVbTNBWjF0YlBtek1CNEVJS2ZOY3JuQ0dJdEo1WnJC?=
 =?utf-8?B?MTR2a2ZuODljQTNRZnpyTmZxSzdqTDVNSWQ4VzhqeUlSczI0TFhyaE1lTHlk?=
 =?utf-8?B?bXRTT2RmanIrTUdDVkRDWDNMbnR6MVhRM0ppc1FYQ2cxWDZDQUhCMnpCZlRX?=
 =?utf-8?B?TW1HazNPaWNaY2k2eERHRnRHVitmcjBQK2p5M0xjVmhOWGJkaE16TUxlRmlJ?=
 =?utf-8?B?cUlROVh2NUFSdWNpQTdITVRtckRCTjZzWEJJbG01TFFabkNHTGVGQ1hpY1Vo?=
 =?utf-8?B?Z3dRcWk0SllaK05mbnpHTHFxYndmOFpJTzB6OFdKL2FwbERET1lSRUNiK2hF?=
 =?utf-8?B?SHUvQUZvdWxEbm9ocU0vZXNONHlpci8reUxmNzJoZ3JqQTBzWjNEZDEvVGg0?=
 =?utf-8?B?bXRCTllqczN0S2wwMVJZRzhveVFtdHdWRFZyRlJUU0NmL2tnTzJzMk84VlEz?=
 =?utf-8?B?SHlGa3BlaE1YWXl4c1lVR3ppVG1rbC8zM2lJNGdQeWZ6TWJTeVQrZmc3NVp6?=
 =?utf-8?B?a3VGbWFWUGk3MU9YVzRYalIzdFNQNEN1cE1hT3hwbjJ3ZTMwV3JKRE5qTmV2?=
 =?utf-8?B?cWg3OWZlN3Z2UlBuak1xMG14OEN3TG9IM1htT0pEcDJ4YUo5QjFNUjA3OWJn?=
 =?utf-8?B?VFJuZzkxRDhTQkYxajRiMEZPZXhpQXFZRkVqTWZCbEZoWFJ3M2RpV0NGSFlW?=
 =?utf-8?B?eURxVXVSelBGOWxzbmo1bDhEQmhSL0dkMVZkekhyakJkdTBOMkgwZ2c5M2ZI?=
 =?utf-8?B?a2ZmazJra3NVR1JlZ3V5YXRuTHBFaWhDNDFrSnFJTE9VcEhQMzRYTGk1TXJ3?=
 =?utf-8?B?SVhBbTZsalRtNFRYMFpuRlpmV0Q4UWo0TGFuTkpyNWUrU2RQSTd4cVJ2dmhv?=
 =?utf-8?B?L3JUblV5RW1CZ3ZScVpRRTZFZWU0Q3RWcnpJTHE0dE55WG5BQi9iRmhYQzZW?=
 =?utf-8?B?eVJqckpnMmNQTWRuMi90TmZ3TUtodjlINDFDSkVBZjAwdXh1ZStqZWs3RER3?=
 =?utf-8?B?bllaam5MVDRha0FXRDBEYmFncUZYNHUyREhaNHVSOC83U1B0Ym5lQ0RHOUkv?=
 =?utf-8?B?YTZwZEVTcEpFRXgycXM1dW9DZWNkMEMybXR6OG5lMWZXaWpDdzllM1R2QWZh?=
 =?utf-8?B?dlFDMG02ZnE4eHBBcnNyZlAyQ2h2Ym04SzNvVHdnK2J0Q2VrZ3VkejNRK0dF?=
 =?utf-8?Q?50NKAIcBL2wPNUSqYiHOUravGa0S0PHUo9Aw4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(41320700010)(366013)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlJPOUNGTzRyVm1wdmliZjNWZTZTWXJmSlRSVWk0aDNiVnNMZ3hxdFBqVHc2?=
 =?utf-8?B?WEhyYkl1bVlrU1UydlNjQk1VbUR5QjQ4WmI1ZTAweVRVTjhDdTVpRnpQYm5M?=
 =?utf-8?B?Q2Z5RnpEMHAwU09CZFJUY2VtWG5GTERid1loaEJMNlZnWVFKRXFpemdJTVpS?=
 =?utf-8?B?dTR2UkxCRllUVVVsY0dyR1BZbjlXVHkwOWtOZjdURHdaZXY2eHhjUFM2ZU9V?=
 =?utf-8?B?T3pVRGdoQzFEaktwbG50MDBlREVBaysvcmZ6NmxVbU05Q2dJRUJSL1V2VW1j?=
 =?utf-8?B?cCtqZDg1V1RkQUt1bHoyaUZVZDllK1ZhbzcwcTVvYlgxTkc0ajVvV1pBYldQ?=
 =?utf-8?B?VXhqeEJPUzVkVWdpNGFSdUZqamtYeDZpSmprK3ZjS01Fa3lQZ1U2RnV2bksv?=
 =?utf-8?B?SXZ4ZG83QmhEcE1MRlZlRU44Z2xLamV1NXEzWEl1WnhCOUYvcGJ0K2VRREZ4?=
 =?utf-8?B?ODJXWTFvU3BjUlNxK1MvWG56U3pTQXZsd2FrNXVXQ0g4UUQraXRDcENUaUl5?=
 =?utf-8?B?YlpBQkhwdExvT1Rqa25iSnJjUXpqcFhRVkhpMTBXdGFLSE44MENFbmxFdlFQ?=
 =?utf-8?B?U0dBT3pUdkdWMUh3cDFaNldhNlJsZVJPZHYwWjFsZW9NRWZQTDdvZFF3ZG9X?=
 =?utf-8?B?MXRGU25lTitCeTN4amZVQjRvUzhmL3ljbVYxWnhPb2FuV25xSnNPL1ozLzU0?=
 =?utf-8?B?bzg2NTVJWHFLZEd6Z2JlSFhOTVVLRHNRRGw4bnd2c2cybWdiQkJrZ2NHaDMx?=
 =?utf-8?B?V2gwMVpRWFJ5S244cGY4aENTZXJwclMzYmU0Wi81eWkwdDZtSU9CdnBROUFi?=
 =?utf-8?B?R1R5YjFjdS9ERzd5L2pGU1pjMXZna0NUa3VnL1JDMk5Rd3Biam9zNUsyampN?=
 =?utf-8?B?UGlQdGYyWHUxNkp5Wm1xWU4wK0s2YjhUaTZhNTMyM3M3WUtrNnZaZ2ttZCtq?=
 =?utf-8?B?SXFNWjlucXpQazdSRUZOeHViR01EYkxRcnlpSDJzRVFER0JVcWlRQWtHdlI1?=
 =?utf-8?B?TWtmaVZDdmM4YSswaE9qLzBVc1A5QkdtM0VLUjdYODJPZDM5bWJaWVI4cHUv?=
 =?utf-8?B?bm0xZUZnSEt4M0IzWDBtclJiR0JwTDBMQmxkYWg5SXQweEV5MnlES1RobkQw?=
 =?utf-8?B?UFNKNEJPN0JtVnhBVktiRGlRNDZpYitaWGZUdlZTNW82REduNm9nTmhuckdZ?=
 =?utf-8?B?VlhqR3ViZ3c2NUc3Y2RhTkdZUUdOVG1Kdzcxem5xLzBwMzFwazJLa25lOEVs?=
 =?utf-8?B?QWtqYmVROTFOQ2JpRDFMc3BIejVUNEhSSEY2Y1M4YmxSTzJvNys2bXRyZWhT?=
 =?utf-8?B?K0llYndsTkhtaS9pdlpnbmFGejJ2Z0lCNzhraDZ3ODNoNGg2Tlp4VlVCTDc2?=
 =?utf-8?B?U2dJZDY5OWExZThxMy9FTUdrbFUzVjQ5ck1CTXRvZ2c5clBsZ3ZlYjc0N2dv?=
 =?utf-8?B?SHZKbzFUT3o4cHpOa2cyZkhkMzhWWXBHVUFmaEl3cE10dmVYaUJiY1BtRHJj?=
 =?utf-8?B?Qlpnc2RvblgyYjRaV0ZxZHNrdHNRU1BYNjVNbUl1dWZ6bHExdFRGMGZMVDZQ?=
 =?utf-8?B?VWF5Nlo4SUdUSGdWeTY2cGNRZm43YXN4WDdxZE9YY0JrYm1nd2dtdEVPQWNH?=
 =?utf-8?B?d1A2VmdEOHB1ZkJPZkVRUVlUN24vSGdxb0NFbmlON21nMk9LWHFKdDJhdWFO?=
 =?utf-8?B?RU0wSG0wV0FkVGM3K1MwWXNhQ3kxZE42VW1Ib3lrWWllblk0MVNpRi9xNC9i?=
 =?utf-8?B?UlQ0SDBRSVh0T09wUWNlbEJsTG4weXhwTHR5MjNONTFyaG5yRlFFZFBad2JL?=
 =?utf-8?B?NndpYzIwNlhQNWpoc0hOWkpqdEpxRkg1N1puUkZQdnFueGZJaG53ZElGVGEz?=
 =?utf-8?B?SFdrU050eDZUTVk5YUx2NGUxVFFTaElocFZhSndxa29MdG8rU2VJcWI2bFdw?=
 =?utf-8?B?RURBWEJsbzVtN1pmRTVUckdtNUg2MDlqWnl3RzJwanZYbkF1WDZTaEJDVFFV?=
 =?utf-8?B?amZpaEkzcktlbXA0V3hIYi8vZDczVFpWcXhaT2xCcm96b1E4dUZyYWgzcndu?=
 =?utf-8?B?cUJUeldHeEJyUHRmREtqYnM3dGVCS3h0cDFLOHRsN2RDOFphNDd1OWRlRitt?=
 =?utf-8?Q?xtGkL4+w2jx6Tl2MDWEsurmNF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7B0D081B4F1FF4C8FE7E68E23DB92A9@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ZFd+ZolczjfxBwCT3R1ct6+3CO86wpwJ55MAAr9GUq1AOdo4P7KSWej+Yfw+QR2rk7U7fAFURVFfaYJpDoFLR0/ADimsHiRZ3ML57CRNtaUStucTN09xHCtG8O8szik+14xCPR2M5Vx6dfMTHmXjRMzu4HTSGOCN8rkr6QrdPS5HgJqW7DattyyOozZ2Rm21y7EOpvj2jVlAEvr1sPUExjDKv/Y5RxOBBSoEjVFJzCW+uT7jWAC0KTapuJvYKznETjjhhXJQGfOXLLKKyGy0eWzkIqRw5EI4QMHQ9wyputf/mb+cDB6s4oRWE3+JClR6HTQmXTn/pBwTDrqHXcmxmWGnXf3f/uB4/C8LSnQJegnb3VjGTAojoaieA5z66MbwVSQuPmuesKH2NSuSS2U9gJ9Oy3OBjvOXP8hu7QxfRe+0ieSV0nA7P0NvGRfNyr6hMOHHDir79HhYl0byD/qr2ZEDVTZKrFdPaPcHxUP0loZo4YoTRmcoz8TlOvI5CdPrEqRrrFisTqyeHY0GYFdX2yjnrYn093ZYgvBGjNo52KF2OKDV01Su8eoHE05JayBl9JJOdtijurB/2yWn+iE5vb5J7i0pAZhzvnPLw/Ar/S4RR9tUukRbnmm5rRUGwjtq
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef899065-848c-4b48-a7cc-08dc8fce5495
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 19:39:12.4654 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: id0m2rSolnwk5tVC0cTRxeA8MKddJ9oz6sTe1E0A/7hKZWxnj5+iLtNjBDrUUqyHDit+j3zaM6Rh7ND/sixi6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6258
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxODczOTU2ODpGUEtleTEucHJpdjpZoauesIlRNBGq1emptrcR8LTIug92dgMTduw8ZZIlWtc+VQVJU/eMtLU0AEP/e5L9w+a3BVK/atx2cxqF9cyRrN66nVeK09z0wE5y+3qfB9YfPkxIiI26hdFciPa2+lsaUCgIylnGEpcrTwgB1jvNq3z/mIR6cAE+nW+Rw+94AEdetWrpsBjKsbRM17XOG7Wfe3EC2PuLNUwEplGF5KaPGJeSUIrTGfkIVfLTeskEntqPSjlp1pq2LTqkIoDGuKzBRX051KKyQrMqPpN8RhDESrOk4HPhm8Qey+2CXIxUbq4IQGsoWxiIUZEz6uHgiyAcVjHAZsSV9zAvMw1Jgypy
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.66.1.126
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

T24gNi8xNS8yNCAwMzoxNiwgU3RlcGhlbiBIZW1taW5nZXIgd3JvdGU6DQo+IFtZb3UgZG9uJ3Qg
b2Z0ZW4gZ2V0IGVtYWlsIGZyb20gc3RlcGhlbkBuZXR3b3JrcGx1bWJlci5vcmcuIExlYXJuIHdo
eSB0aGlzIGlzIGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRl
bnRpZmljYXRpb24gXQ0KPiANCj4+ICsNCj4+ICsvKiBnZXQgdGhlIHNyYyBJUCBhcyBpdCBpcyBk
b25lIGluIGRldmluZXRfaW9jdGwoKSAqLw0KPj4gK3N0YXRpYyBpbnQgaGJsX2VuX2dldF9zcmNf
aXAoc3RydWN0IGhibF9hdXhfZGV2ICphdXhfZGV2LCB1MzIgcG9ydF9pZHgsIHUzMiAqc3JjX2lw
KQ0KPj4gK3sNCj4+ICsgICAgIHN0cnVjdCBoYmxfZW5fcG9ydCAqcG9ydCA9IEhCTF9FTl9QT1JU
KGF1eF9kZXYsIHBvcnRfaWR4KTsNCj4+ICsgICAgIHN0cnVjdCBuZXRfZGV2aWNlICpuZGV2ID0g
cG9ydC0+bmRldjsNCj4+ICsgICAgIHN0cnVjdCBpbl9kZXZpY2UgKmluX2RldjsNCj4+ICsgICAg
IHN0cnVjdCBpbl9pZmFkZHIgKmlmYTsNCj4+ICsgICAgIGludCByYyA9IDA7DQo+PiArDQo+PiAr
ICAgICAvKiBmb3IgdGhlIGNhc2Ugd2hlcmUgbm8gc3JjIElQIGlzIGNvbmZpZ3VyZWQgKi8NCj4+
ICsgICAgICpzcmNfaXAgPSAwOw0KPj4gKw0KPj4gKyAgICAgLyogcnRubCBsb2NrIHNob3VsZCBi
ZSBhY3F1aXJlZCBpbiByZWxldmFudCBmbG93cyBiZWZvcmUgdGFraW5nIGNvbmZpZ3VyYXRpb24g
bG9jayAqLw0KPj4gKyAgICAgaWYgKCFydG5sX2lzX2xvY2tlZCgpKSB7DQo+PiArICAgICAgICAg
ICAgIG5ldGRldl9lcnIocG9ydC0+bmRldiwgIlJ0bmwgbG9jayBpcyBub3QgYWNxdWlyZWQsIGNh
bid0IHByb2NlZWRcbiIpOw0KPj4gKyAgICAgICAgICAgICByYyA9IC1FRkFVTFQ7DQo+PiArICAg
ICAgICAgICAgIGdvdG8gb3V0Ow0KPj4gKyAgICAgfQ0KPj4gKw0KPj4gKyAgICAgaW5fZGV2ID0g
X19pbl9kZXZfZ2V0X3J0bmwobmRldik7DQo+PiArICAgICBpZiAoIWluX2Rldikgew0KPj4gKyAg
ICAgICAgICAgICBuZXRkZXZfZXJyKHBvcnQtPm5kZXYsICJGYWlsZWQgdG8gZ2V0IElQdjQgc3Ry
dWN0XG4iKTsNCj4+ICsgICAgICAgICAgICAgcmMgPSAtRUZBVUxUOw0KPj4gKyAgICAgICAgICAg
ICBnb3RvIG91dDsNCj4+ICsgICAgIH0NCj4+ICsNCj4+ICsgICAgIGlmYSA9IHJ0bmxfZGVyZWZl
cmVuY2UoaW5fZGV2LT5pZmFfbGlzdCk7DQo+PiArDQo+PiArICAgICB3aGlsZSAoaWZhKSB7DQo+
PiArICAgICAgICAgICAgIGlmICghc3RyY21wKG5kZXYtPm5hbWUsIGlmYS0+aWZhX2xhYmVsKSkg
ew0KPj4gKyAgICAgICAgICAgICAgICAgICAgIC8qIGNvbnZlcnQgdGhlIEJFIHRvIG5hdGl2ZSBh
bmQgbGF0ZXIgb24gaXQgd2lsbCBiZQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAqIHdyaXR0
ZW4gdG8gdGhlIEhXIGFzIExFIGluIFFQQ19TRVQNCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
Ki8NCj4+ICsgICAgICAgICAgICAgICAgICAgICAqc3JjX2lwID0gYmUzMl90b19jcHUoaWZhLT5p
ZmFfbG9jYWwpOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPj4gKyAgICAgICAg
ICAgICB9DQo+PiArICAgICAgICAgICAgIGlmYSA9IHJ0bmxfZGVyZWZlcmVuY2UoaWZhLT5pZmFf
bmV4dCk7DQo+PiArICAgICB9DQo+PiArb3V0Og0KPj4gKyAgICAgcmV0dXJuIHJjOw0KPj4gK30N
Cj4gDQo+IERvZXMgdGhpcyBkZXZpY2UgcmVxdWlyZSBJUHY0PyBXaGF0IGFib3V0IHVzZXJzIGFu
ZCBpbmZyYXN0cnVjdHVyZXMgdGhhdCB1c2UgSVB2NiBvbmx5Pw0KPiBJUHY0IGlzIGxlZ2FjeSBh
dCB0aGlzIHBvaW50Lg0KDQpHYXVkaTIgc3VwcG9ydHMgSVB2NCBvbmx5Lg0K
