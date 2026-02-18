Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNfbJ5WplWlVTAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 12:59:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D3F1562C7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 12:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9631110E5BE;
	Wed, 18 Feb 2026 11:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OlSgX/mL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013062.outbound.protection.outlook.com
 [40.107.162.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B529110E5B6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 11:59:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KcnRY61oF7go2I4ihLiIT5d6V2oQYZfjYXS41ewVP13s6jAVPLld6BMWepBJuwH4GUeZ3peQ2Ske2jPQbdd5yQY7UIf716gJMRoAycfGN/tsYk5SLEWazVA1/ERs1sERvMbEpSPC8QHc8bQFXduBli7tXN9wCUTqXKS6aVoxtu7wfIdka9ZyGM+Cx9hJhQdoLqXKRJbxsQ/SK7DUuZ/TSo9NujolRL1Q5sDQt+EADseC4QCphHM7iI1byBeecIMOstVokIhRZl1ZKrf7syjeNrnhy+UalGtMKEPf4pTKf415Q0qTrYKGFpxn2ltI7Vav3HwmgLuo0KiZlTzBR4jcBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7X/MJKp8/PIf82tpGKdqdN3yg6js2Df5FS4DxXoRgs=;
 b=rS9pRE78X2O62LkEJy53StEl+jOgPnoye//XuqAbMCIJ1mW/vUcrtEOGgjF9o8LiG+4WEf4qIegFR2+nl6OGGjznx5eBvR1A0TsWxB30fvtHiQqz1rZZOKz0AM8wadi3DqzdY2kP7G1S6aqtAEjUeY4fhnv7y2EgPx86EuFQXIH7b6GXcNasurzRhnMK0QJ4lyjH88cuN6hGq6tXGGj7Ax77nN0x8iJopI6za/u6u2kjvb9aaHRifFuTCqKDFZ4N3u/7CCy1W1zdjSGsGFkHX7zEcjPm+n3U/TKbppDITa+C/2hHS+bxV7B2X1ICB8ffAFld/02KhB0RR1CPBNVrZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7X/MJKp8/PIf82tpGKdqdN3yg6js2Df5FS4DxXoRgs=;
 b=OlSgX/mL/kIq+Jd1x5XegL/5a8LHqMQiMB+c6T9GpjqJmGpSMEtlf1/18VU2SuCPUGYgz9jLJTye1O/uQU0mN715HKJ58MAu8QxyU7xKgohsYmQeclRtbkr5yqKJOrkxViM8kHybUudjf0bcnngFwNqYUX1KMrPnCLx7tm6IgwU1it/02G4O5hasFYjqf33V3v/jqwPLGmpLMk39xlbGtIiq2FlSf7A/McetEv4H65/Fbaxzuuusgr8tqEZJ58MFlNwAYfFIyk34V8cEFTc5SL1D87acJcikgmmHa2Obx1IMOXtW8407kScFTyXmF4F/ZH4wAhz0/VNoi3iA7dgLFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5)
 by AS8PR04MB8181.eurprd04.prod.outlook.com (2603:10a6:20b:3f5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 11:59:07 +0000
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63]) by PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8e54:4d38:df79:fd63%7]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 11:59:07 +0000
Message-ID: <0c02809d-2108-4261-ae36-c68cc7a169e1@oss.nxp.com>
Date: Wed, 18 Feb 2026 13:58:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] serial: linflexuart: Fix locking in set_termios
To: Frank Li <Frank.li@nxp.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, chester62515@gmail.com, cosmin.stoica@nxp.com,
 adrian.nitu@freescale.com, stefan-gabriel.mirea@nxp.com,
 Mihaela.Martinas@freescale.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, s32@nxp.com, imx@lists.linux.dev,
 clizzi@redhat.com, aruizrui@redhat.com, eballetb@redhat.com,
 echanude@redhat.com, jkangas@redhat.com,
 Radu Pirea <radu-nicolae.pirea@nxp.com>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
 <20260216150205.212318-2-larisa.grigore@oss.nxp.com>
 <aZN7Hx_aK4ta1ksL@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Larisa Ileana Grigore <larisa.grigore@oss.nxp.com>
In-Reply-To: <aZN7Hx_aK4ta1ksL@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0045.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::17) To PA4PR04MB9224.eurprd04.prod.outlook.com
 (2603:10a6:102:2a3::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9224:EE_|AS8PR04MB8181:EE_
X-MS-Office365-Filtering-Correlation-Id: 995bfb67-9f64-47c2-e9ec-08de6ee51eb7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|19092799006; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTVrVkVaUm9JZngvL3lPZytYdU11RnFsM2tXaHoxY3lVMGRZT3QrS3N5ZjNr?=
 =?utf-8?B?a0drakZXUnNVa3Y5Mnlvc1NyWm5INEpWRURHdFNDa2JoVDV5UVBwZzZSNzdi?=
 =?utf-8?B?YkFvTWNhWWxSMFBEWWJpSXYyRVpVODliLzJ5OVczN0RXREg0SlJsN1Z6UVVJ?=
 =?utf-8?B?ZXYyandNT2JrNUZhRWxTcFhNYkJibVEvR0VyNFZwbnpNeUJjOW80Y3RzQUxi?=
 =?utf-8?B?VzkxTnB4eXo1eHA2OTFzYmJZQVhtckVja0I1a2dCK2crVXZONjluYWxJY1li?=
 =?utf-8?B?K0J1ejE0WFBtaFUvVStnT1ZuSXYySy9adE1MQTdTTUtieDd1WUhmS0phNlNT?=
 =?utf-8?B?VldXYURsQ1IvNUx3bXZ1SU5Bek5UV05GS3NuNEJTVDRTcVZyU2l3UkdyNDRs?=
 =?utf-8?B?LzEyVjdTSzJVRnNvTWMyUzg3dHBYVVhlYmxHMTdqT25FYXNoMWJYQ3UvcjNa?=
 =?utf-8?B?a3U4TEpYU1o3cTZab1FJZTcyeHlnTitzMHJoRkJEZjRwTEJabkRaaW94T0Qx?=
 =?utf-8?B?NFlDVXFsaGZWck1QNTluUUVqTDFXMy9VczFlSkV3UDd4L1lzT1NkZ1BQbTRl?=
 =?utf-8?B?N0F5OWc3V2k0WVMwbUNnVzRpNWhiNDkrSVd3LzhTMzY4TU5scVZIZG51L1d1?=
 =?utf-8?B?aDN5Q1pOaWhGaVlPczZ5dTB2QjNjRUh0WldMVUVGY3lkQ2V3U1ZSaDVBb2pD?=
 =?utf-8?B?M3dsY0toUTZzamxtZWpaT2hkK1FkaWtFLzUrcHc4UnROWmg4NHVtYVVqZXJX?=
 =?utf-8?B?dWJnamI1ajY5blljOTJXbDZjUTRqOXBlbHR5aGNaOG9vNXVrMkRaMThKcW9v?=
 =?utf-8?B?QXN0ZkdYTHhPUUZ5RisxV0JEU1Q3aHc0cFEzTFBGNDJGZUR2dFZMdnptTEJO?=
 =?utf-8?B?RjNNSDdPZkJzVDdPbTFMYWRoa2E1OEFTWmh3SGRLWXlPT1FsbHF2TlA0VEhh?=
 =?utf-8?B?N0hzZ1gwZEt2M1I3emYySTFGMW1wSEVLQytqM3YvdXRWOEN6NDhjTkdsM0Fy?=
 =?utf-8?B?VmxUVFkvL1pSbnJLNmNmTW5WL1IxVGNQRFdweFhNMjQ1ZVE2Ynk5amkxVU1i?=
 =?utf-8?B?UVlRZ0NOYkFRdU5hL2hUWUhmVG4rRnFYb2NtNk4zQnE1dmFWclA4RHlLcFhl?=
 =?utf-8?B?bGExUkE1R0xyOGpWMHZhVVVFdlBwUUZTL1N4eXE3NktTdUNaekptdXEyYlRr?=
 =?utf-8?B?NFdjbk1pZVFseXhpbDNBT1doa3J3NXcwSVoweWtSVnFxajd2NS9jR3hRRThZ?=
 =?utf-8?B?dE42Uy8ySkJDc2JpOG5EZHpHdHY2ZnpOWFZ5Nkw3eTlreFFQMmp4UFZlWWNl?=
 =?utf-8?B?bHo2bUt1blhra005NzdLUWphYXZPTFZ6MndXSm1XMXpudGJ5M1REQisxdTBl?=
 =?utf-8?B?bk54SnAzbjY4WWJlbUFQYkw1NVUxNUJhTFY5ZXZtNHlWQUVUeUkzMzJwTTMz?=
 =?utf-8?B?TE5OZU1kVldJeTZlUnhwbmN0M3ZlU2kxTDNRNWNGSWFHdUZpOWxYaVFYdTJN?=
 =?utf-8?B?VDlZWTZQcVR5TGR3dFh0ZlBJTlBoZjJoTW1OZzF5RFE2MGpCeXdGUVZ4QXd3?=
 =?utf-8?B?VzNtbFE1QzVPQzBFSEU1cmZqT2ZvYWNwVVI4UzB4VXMwL1ZqTndtMEpET2U0?=
 =?utf-8?B?OWYybTZrQWNLQkRPSkh5QVF0RDRSeWJ6blAyZkhqZTgrR1hyS2lnNVVleE5q?=
 =?utf-8?B?emQ0UVN4ZStqQmpyRjMxcjlZdGZlVlJJSm15citJZlZTMFZoQ2xuQWs0Tnpt?=
 =?utf-8?B?U3NHMWF3VDQ5TUlBaG5neXFKbzVrbm5ERmtnend3YWwrVVN5d3lKK2RuMjVo?=
 =?utf-8?B?amN3QkRkRWZnRWpaL0x0Qkpkd29jY2lZOHlMK1JJWDJjTW90Y1AyczlIZU1J?=
 =?utf-8?B?UWFXbTJXcms4bHlIOElwa21EVVBsbFJFWWhqckdocGw0dmpNcHIrc1RYU2dm?=
 =?utf-8?B?ZnVFQnB4b3lycFFyTTFidzFubkx3WlFTT2pJbkk4RW1NTXRjVVBvaTZPL3E0?=
 =?utf-8?B?UnEydlpWU2FyUW9KTC81VG9IYXdtaE1UVEUvMkEzdnN5aCtzdjEzNExtdTUx?=
 =?utf-8?B?eDdselNtbG4wczhNa0tYY1ZQWlRkTmNacnpyVlZEdXltM1N6ZDNnUDZRTVhQ?=
 =?utf-8?Q?81+M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9224.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkNsNzZXU1pPaTBVd041NE4yS1A1c3FWTUdaaVlyY2l6TVg1VnJwd2w2WlZu?=
 =?utf-8?B?Sm1DU0tHc2huL1pGMzhabVArN25Kd0RmZGlxQkZGRURtbGd2Y0cxRmdmWEts?=
 =?utf-8?B?Y2ltVFh3eG95Q0g5VG55Z2RMZTE3S25jMzJvWmZpU0hqWU85ZTNSa2J4VUlB?=
 =?utf-8?B?NmVBQmpMTlUrZ1lrKzd1NHJWR1dHcEQ0c0ZHVmZGMVRKNnpyQ2RmbXM0UFRl?=
 =?utf-8?B?SE92TDRNbGtYeWVYbHNPQXBCWHNGckpXY05NZXo4L3doYjJjQlFxVkQySllK?=
 =?utf-8?B?MVJWSEJ6YXZZdlhQOWp1UEdLUlNjcXRZSnN0WjRPRUJPc0I2eEZEUVJKcmdp?=
 =?utf-8?B?UExWSDdaTzgvVDRsNzNyQUlLLy84V2wvVVNPQXpvVG5ML3NpRjc3N1BrLy9T?=
 =?utf-8?B?aitwdFVRczRHTUpNVVdHdUx4WVFlWGtodW50WmJ2dGVPTzFnMytmQTFRSnlS?=
 =?utf-8?B?a1lkb1U5eC82WHFsZ3Z2Mktkc0EyQ0M4RkgrZ1dWTSsxY3VWWjllandvVUtp?=
 =?utf-8?B?VzdaNkNkeW5sZE5jamVOcGljS1JDSC9nTkh1Z2RCOEJsZXZNNnJwSmhIYlNB?=
 =?utf-8?B?TndFV3FaVnM0NEZvQ09rSEJRUnVja1p0M2htY3d3Q2RGckh4WlBneU50SGI3?=
 =?utf-8?B?RkVrbit3cHRhZ2hnL2V6Szc3bnI5RzRDWDlpbFdNL1ZMTlZ5ZldraWRuYmk0?=
 =?utf-8?B?Q2IrMzZ5Ylo3b2xNVUIxRGRyZ015aEx4UVdMWnZLK2RSTGVUNi9tVnZ5bXhN?=
 =?utf-8?B?cGlTL1ZoVFdpL3Z6TjJlOGtQOGd0VmhJdk0rZjA0ZVZaMklIWTZpZ09PdVFh?=
 =?utf-8?B?WmdTeFNka2RYRzB5a0JhVmxaNnVWSGllSkYzRjU0bE9RQXlFVnYyUmRyMWlR?=
 =?utf-8?B?U2JJak5iK0ZvekNObHh2bTNVOHV5Nk9VUWFPZ1g4UWJ4a2VScFUxeGYrR2FZ?=
 =?utf-8?B?T1FUUlBiN2hHVUo4azRHS0NNck45dWJVYVlvdExaMWRxbzJ4dStBb1NQdjRt?=
 =?utf-8?B?VHZvYnpvMGltYVo1WXZXVjlaOFcvVlpMNEVpZEtnM25RYlBSWldWUWdXb0JF?=
 =?utf-8?B?QURYQUYvdUZVNm5jUzlYZTJ1aHJJb1BiYWo1TUZiRFowZEZMdnhjMVVnbGY0?=
 =?utf-8?B?MlJMTkRmNXNiTXoyNUx4ODNmdVBMVmZtODk1aC8rQlkzaWswVGRIb0tzYVVS?=
 =?utf-8?B?WCt1MmJuTzc4VDVPQndPSHkzRTJndjNOYk9RTlJxRlQzcWh3Z1RXSU9hYk5v?=
 =?utf-8?B?Q3VBbDVJSVRac0Q2djNUSWlZZDZRajJ1OTFRMXNQU1ZORy8rM1RDd3ZqN1ll?=
 =?utf-8?B?WTROMXM2NHJLcnRzVTlQM0RZR2phMHl1Rlk5N29KYUFVbU1laWgxcHFaKzli?=
 =?utf-8?B?SHhQZDVTdHJQR2hyeXdoU2VyR0thUmZrY0orMjVweGg0aWs5Z1pnS3RlUzd5?=
 =?utf-8?B?TloxanVUcmZmQVRDY1hoN285RGpaWVlzbE9YSi8weW94QjVwN0dLK3kzUHd5?=
 =?utf-8?B?SFpoV1cySjBKaGs2cHBRQjlQSWhVMEFPNTFoM3A4VWdaWnRGU2N6WUNudVJ5?=
 =?utf-8?B?SVJRNFJhbGVtcU1LcmtZZDNLdFZtd1ErU1hrNkhmWGxGTEtCRnNLOEVibHFy?=
 =?utf-8?B?bHQvY0R5eVFUaGVmdFN2RXVvVHdpbFU4UEQ3SHZwS2M4eXlxSjBKWVVtSlFG?=
 =?utf-8?B?dDZCTEw4WjJ2Sk9BRHRza1ZDNmRJZWpIYzdiaXA4SWp2dDA1eWRWNnpiY3ps?=
 =?utf-8?B?NXBwN1F0VkZtRWZ5ekY3eVI5YW1vcVF0T0RjUjN0RFUrUkJpTjRIVzBPWnZk?=
 =?utf-8?B?dzZhMy9CQi9qVXgrbU9leW5TZUdzVmFWTXBDNUYrY0lZQWFiemM5VVd3MHV5?=
 =?utf-8?B?SkZER1Z0eTJCa1FpOUVGYkFjQzFCWkJjRU1wdWxvQ0dGRVMyUzVGaktFS296?=
 =?utf-8?B?ZFZaWEZNSk81ZmR0blBxQmhWZG1CdmNqODdXejIvNUl6Z1dINmtHZ1g0ditt?=
 =?utf-8?B?aEFZZDdhSFI2cytKR1o1Rk5CT1lYRTFWcXVLeUl1d0pMR0o2d0J4V1RTYWQ1?=
 =?utf-8?B?aEk4M0NOUTVobXk3dnBFSm50TUpZOVI0N3c0OUk0eHp6U3EzdnN3T01IQ3k1?=
 =?utf-8?B?KzNENFBFMVkwckltU0ViUjZ4elhMM2o2dlF6WnI5TUtEaW5vMWF1cXYwOWM0?=
 =?utf-8?B?bjhKdVZ1MFRLQ1ovc3QwRlQwaEJ1QWhTR1JuVXlUTWRiS1NISHhCbHoza090?=
 =?utf-8?B?S1Z2WmJzRGlURnA1ekpRdGVoSFR1d2NLZGd1MVVZeFdFWjQxMXlmaHBhRjh0?=
 =?utf-8?B?V0NuU1lBTnFEZDNCbm9wR0s3RU9QVXp2WWFaQTc5NXRkQ1FNeEtoUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 995bfb67-9f64-47c2-e9ec-08de6ee51eb7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9224.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 11:59:07.8486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJ1DWgTE8AeMuf0jD+Jserr0C7ainTTYSU8ljoEk21o3aZOqwaeBwfUBerrY7KPBWPirIZ40yzzvP6ftxstDTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8181
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:Frank.li@nxp.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:chester62515@gmail.com,m:cosmin.stoica@nxp.com,m:adrian.nitu@freescale.com,m:stefan-gabriel.mirea@nxp.com,m:Mihaela.Martinas@freescale.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:s32@nxp.com,m:imx@lists.linux.dev,m:clizzi@redhat.com,m:aruizrui@redhat.com,m:eballetb@redhat.com,m:echanude@redhat.com,m:jkangas@redhat.com,m:radu-nicolae.pirea@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[larisa.grigore@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larisa.grigore@oss.nxp.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev,redhat.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid]
X-Rspamd-Queue-Id: D4D3F1562C7
X-Rspamd-Action: no action

On 2/16/2026 10:16 PM, Frank Li wrote:
> On Mon, Feb 16, 2026 at 04:01:53PM +0100, Larisa Grigore wrote:
>> From: Radu Pirea <radu-nicolae.pirea@nxp.com>
>>
>> Take the port->lock when set_termios is called, otherwise if characters
>> are sent while IP is in init mode, the IP will hang in an uncertain
>> state.
> 
> According to patch, you move it before read(UARTCR). can explain why hang?
> 
> Frank

Hello Frank,

Thanks for the review! This change was made to not let anyone send 
characters (for example calling `linflex_console_putchar`) while 
LINFlexD is entering INIT mode. The INIT mode is entered when setting 
LINFLEXD_LINCR1_INIT in LINCR1. UARTCR should also be protected with a 
lock since it can be modified from different other places.
I will update the commit description.

Regards,
Larisa
>>
>> Fixes: 09864c1cdf5c ("tty: serial: Add linflexuart driver for S32V234")
>> Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
>> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
>> ---
>>   drivers/tty/serial/fsl_linflexuart.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/tty/serial/fsl_linflexuart.c b/drivers/tty/serial/fsl_linflexuart.c
>> index e70a56de1fce..5a410e2d56ac 100644
>> --- a/drivers/tty/serial/fsl_linflexuart.c
>> +++ b/drivers/tty/serial/fsl_linflexuart.c
>> @@ -407,6 +407,8 @@ linflex_set_termios(struct uart_port *port, struct ktermios *termios,
>>   	unsigned long cr, old_cr, cr1;
>>   	unsigned int old_csize = old ? old->c_cflag & CSIZE : CS8;
>>
>> +	uart_port_lock_irqsave(port, &flags);
>> +
>>   	cr = readl(port->membase + UARTCR);
>>   	old_cr = cr;
>>
>> @@ -475,8 +477,6 @@ linflex_set_termios(struct uart_port *port, struct ktermios *termios,
>>   		cr &= ~LINFLEXD_UARTCR_PCE;
>>   	}
>>
>> -	uart_port_lock_irqsave(port, &flags);
>> -
>>   	port->read_status_mask = 0;
>>
>>   	if (termios->c_iflag & INPCK)
>> --
>> 2.47.0
>>

