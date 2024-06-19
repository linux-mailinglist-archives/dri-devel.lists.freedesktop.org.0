Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDC990EA68
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 14:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F0310E1F5;
	Wed, 19 Jun 2024 12:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="bU4OuwEv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311FB10E1F5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 12:08:34 +0000 (UTC)
Received: from rly31b.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly31b.srv.mailcontrol.com (MailControl) with ESMTP id 45JC8Kaw226444;
 Wed, 19 Jun 2024 13:08:22 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly31b.srv.mailcontrol.com (MailControl) id 45JC7q8m218496;
 Wed, 19 Jun 2024 13:07:52 +0100
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2049.outbound.protection.outlook.com [104.47.14.49])
 by rly31b-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45JC7nN7217912
 (TLS bits=256 verify=OK); Wed, 19 Jun 2024 13:07:52 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H72LaOJ9HK6T0EovCnVrEUgLp/CzFrr+brDkI1Y5WDaUiWQVwRb8L+htOay0M7Gqx+5YBET0NT5PbMY+wquu47xJpsMw34LBNv8JeIx+ebtogpG6GdFyyTO0bsDik5ueZzX6ZzifLBKGkrUDQX3lDr/KTUig/RGycFNvZ7ewXFUggYQg63Eskt2jMUAPK1alPRfE/OtGzI4GPWuGeVXPqhaQdXYJoG7wgy3nMnDHrFO155BCb6UnpzO1WA7CkCZMlTNxjxrAbYli9P/4a0UgGFdqmigRGFvMfO1HOMYjUoZvPfmarcFyvCTfWjaFJrhvVM3Cb2ig6YldlA3Pp/xAng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUDb7541K8KXqzkayjspZy2SuzLUaY5CAsIWDVWx33A=;
 b=ob/c8fCD/doPoID/DRBiOChs5JxEwLz3ENZNo6pltAAdpOStsKpwmGvv00SWutBEaJcCZlbs5RSB8Zo1HwWutEhLbL4928wb634b182ztXJMq9bwQbLatd3WiiOl3uwiUbOKGzodXyRl2rYAnq+btMEra9B1wKj2hVLGKM2RdnzpsghfUI4jtYdkY5qu2pjhsSClboKiL2RZpw60wH5VeDLy/+3QYu3oc3oabAztaamH7rfjQy2fVccqvGTqC1lt5xyKglyzU/eDpiMfotUZkqNk/5UiRRFZr13UraN4J5+o+zknx4UQvSbxUwdvimy5yEXqsGopnLeKMoREDyNUPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUDb7541K8KXqzkayjspZy2SuzLUaY5CAsIWDVWx33A=;
 b=bU4OuwEvrteX8UDdvIsaqtVGlK1B8aJEU6/fgxCAuuQOtprFolB8gU2g1xUFlnXbVOs3CtcpZ3VLUFPgugzR+mfpl3OUKmeBu2ItORdsuSiSqgqsQUgt5zy1pOWlvZ/3JBlJQrflGTKEzqCKW6EWLbOLNhgXYCVOTEW7nB/gI1AXBthwbh/zSYjleCeeIPiknblnJzPUIUlonv/M8/3vsyujtq2D6ixbCYRfplS/aA5uFUZM92t2NObY0vya7SnjdIlFUshDjuaBhgTpdtMEmdIWXst5Tw8HYAuCJXEkO8dOyoACsBaDOPvfqA8n0vMgnn2KyqQdr8ljIol38Pl9cA==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by GV2PR02MB9640.eurprd02.prod.outlook.com (2603:10a6:150:df::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 12:07:42 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 12:07:42 +0000
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
Thread-Index: AQHavWrQgrJbi1vMQEmkq/v8mH9idrHH9hSAgAcRqQA=
Date: Wed, 19 Jun 2024 12:07:42 +0000
Message-ID: <f11dd9f9-449f-4b6c-a276-f16737036fd3@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
 <20240614171041.7b880232@hermes.local>
In-Reply-To: <20240614171041.7b880232@hermes.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|GV2PR02MB9640:EE_
x-ms-office365-filtering-correlation-id: 0a18f7ac-27c4-4c42-db10-08dc90586c28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|41320700010|366013|1800799021|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?ZnE2RzJGYXhSaFdpams5aWlLcndNbWVxakZTWDVIR2RZVDFETjluZEpGRUh4?=
 =?utf-8?B?R3JKZ2duSFlaU0djaEEvbjF5dmJRVUhvT2hXS0c5RFpwNGtoNzlRbWc4bnhk?=
 =?utf-8?B?NTNGckZPbDFlV2R4ZEhaS3c0Z09uV1JlS29zN2hqbmVDbFdxblc4VzNja3BW?=
 =?utf-8?B?UG5ORW9wNGMxS1RQQ1ZrbXN3OXBEWit4Mi83cUtvVmJLMWpEYldscU00Tlc1?=
 =?utf-8?B?TjdIZ3lLT2lEUGFhcWs0cngwdXR6R2hJaFNpYTlnZkZmeFlwWUplWXN4SjRS?=
 =?utf-8?B?NHhqTkk0MVIxVk1Pa25FOHNCaC9mTisrK09nQldQdWw5Q05tR3pYc2dZczhE?=
 =?utf-8?B?cmpiZm1pWmxkNCsxNEpnbFhBckc0b2J3c2JmMWFOZC9hR3RlcGxXSG1GK3hE?=
 =?utf-8?B?T3hkNEZqUTI4RjI2ZjVxWUIwdmUvMGcxSW9CanJJN2JtZjBWdTVZb2VvVExI?=
 =?utf-8?B?Z0xqVkxqSWNwVmhBRCthN2JNYlE4UGJWTjRsUDVnYnh4Z2VsYXE2d2s2ZGpB?=
 =?utf-8?B?R2V2MDkrdkhmcnlYa1B2U0FxSHdRYlpTbnN4RjJMdE12MmQ0SEg5YUV2TXUz?=
 =?utf-8?B?K1BERStFaFAvNS8xcTVlc2JnaklUWlZ2TWMvaW9wQ24vakVtN3E2aVFORVJI?=
 =?utf-8?B?cDVPWUxOQmh1a25SVW8ydXQyYUhKWkE4b3kvM1pNUnJrQzhSUXlNaFNwYi92?=
 =?utf-8?B?VE9YZEtFYU1QdWNYWUczU1BPKzNtTWJFR0xxWXZuWmRYWVg1U1pHZ3Y1cVVh?=
 =?utf-8?B?eXVPa3JHVjAxVmpDT0lPMnR5WnYzbDFKNzJLSlR2SWNaK1kybDF0L090c1d2?=
 =?utf-8?B?SmNidmgxV1lKRFhLOVl0VnpNN2NWL1dWUDh1UGRST3U3S1V6S1JoMjJqMGVF?=
 =?utf-8?B?OU01aEJDVzZJK0Q1QmkrV25KbFRmaThSVE52ZUk2aGF5djM2WC8xTEJxdDVj?=
 =?utf-8?B?TDYwR2h2UW1IWUU4TzNlQnVQMzh2cGFQSnc3MWFXMlI1bXJ0UEV5VElkaW00?=
 =?utf-8?B?Yi9TOE5CeW1MNG92YThOZE55amxTY3NLclBqaTVvTWhnSmJsdzhQYlhEbFph?=
 =?utf-8?B?RG10VUV2d3pkMkE0RmhVeHFkcXByckpxcUdMMnlhVzAweUxkS3Rrcm12Rndt?=
 =?utf-8?B?bWRPV2RBY3JocFdFcnEvQktuRnphL21ha0xrVldjZnVwV1lJV2x1Ukhrak0r?=
 =?utf-8?B?cnhMazIvTnl0VHB0ODlZdkE2b1VxQWpZQ044aUJFcFBLUWIyVXRlYkxRdXJ6?=
 =?utf-8?B?QXVrNG90WkkxRUxKYXcwVFhrNk5FeVZ1WFEyVFpOQkM5K3RyOHJaMlZrZk80?=
 =?utf-8?B?YmltZ3o5cXhHTHlDU2FwOXNFeG90MTIralRPMWZYL2pTdmxyNU96cUdOTUcz?=
 =?utf-8?B?V0prZzR6SWRzSmoyWDJCeTJKWUIvTHRUVDdXNnpNdjdLUmduNGNoRWFqWlI2?=
 =?utf-8?B?d1lkY2JKbVc1WGpJVTdjWVl5endCRGl5dFBZVVpEZXF4QWNjVnUvV1hUUjVm?=
 =?utf-8?B?cGZxd2kvUFlBbzNYTlNRbXdHQXZxMHh3aWwxWjRWK2Y4b2d1YmtoQzJ1ZWV0?=
 =?utf-8?B?UXF0aXBaeDJxWEo0c1RCM3VURmo4OExTTFhiVVArNVNPTzNSSlBseG9heDFx?=
 =?utf-8?B?S2wwSTNKTHlxSThGYnp3TW9HSlA4QWZLVEpCODVUcWlteVVnZXJTaHljeXZT?=
 =?utf-8?B?Q2lVV2Y0UUhKSGx5TjJlWXcwQVdEanpNUWJ3RlhMV3VDbkJ4UFcwM2lCUVZj?=
 =?utf-8?B?cVVuaXNnM25CQXdVNDJvMWFhYnBnMHdscG5abUNFZFlnWHdVOWJBbjJNWlIr?=
 =?utf-8?Q?isK6pBESQOhtKoJ+Xti7X103342Lb+8iBUvvo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(41320700010)(366013)(1800799021)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qm9Ja3hWYUtHTHQ4S1ZHcVBNSjI5VGN0TkErVGtSdmJ6TEM5c3BpYUlYU3Jy?=
 =?utf-8?B?L1RDUU5CazUrTUJWSWpmVlJFYkoxcFVzVUJjTThkZ0JGZ2F0WlV1MDllNG9S?=
 =?utf-8?B?bHlBdFdXeXBjeHBCZjJ3V0JEZi9xSUpIYnpzdTZBTDltTkw2dnpoTDkycGx4?=
 =?utf-8?B?c3EvVVYwNEpLbXpYaFhKOCtYNEdjbGd5VDBzcDFpNXB0dFY2T3Nma2FLQkVl?=
 =?utf-8?B?UFpqZVVvb3BFSGFYR2lVZ2RKczAxQm9CSTd3dVVvT0ZIN3pwQ0NTU2czeHhX?=
 =?utf-8?B?S0JTZzRqcDlnS0R2Nmk5NlpKdC9yY0JzLzA5WGdvSlhXaCtlYVF2SzdtaHZO?=
 =?utf-8?B?SFU2bEVrb1FwbWdZTUpWNURWMXBLN1RVays0Ti9BdUZEZU81ay91SXMzZDBz?=
 =?utf-8?B?cjh6RGZXdmp6aEZybmxhdGRGa0JTVFNULy96Z3FXamp0bFBaZVNZQ01iaUlO?=
 =?utf-8?B?K3JsaGkxc0R5a0x5RHhVMzdUQjF6bElUaGdoS2dJTmxaZGFPeEhuWTVRVXNT?=
 =?utf-8?B?ZjQ5Z2s5MThlSXR6T09yaENGekxwWHdvYmh5K0YwdkRmMWJMQzkzU3IyNHE3?=
 =?utf-8?B?ajRpSHFSQ2pubkRFRnhGbkdRZGFuU1BLTHhaWHYxVWxDRXhZdTFka1R4bDNJ?=
 =?utf-8?B?TjNicXBPSndwNG1qbjAyWi9sak9SeVRwSHhWMnB4REdUWFdRZVJSWHE3Sm50?=
 =?utf-8?B?RmRLVDdUSzBPcmtvZ1A5MjhBaW9QUDM2RjAwNjZYQTlDY09DVFlRdm9wNW5O?=
 =?utf-8?B?b1NlNUxOeVU4WDdvQ1RmMXd6WHp2RXNrS2NIQ0lsU0J0V0sxQnBlMEZ1MElL?=
 =?utf-8?B?OUd2ck1zTnBEUDY1NDhaTU1BTDNJUER3cy91UzFMemF4OG15WVRkL0QzMzNE?=
 =?utf-8?B?anl3MDJscmdQL2pRd01ORnhtMXpHL29nVWNvN3FQRGRQcmV0eTR6VGZqeTZR?=
 =?utf-8?B?NENzQWhlMHo4R21uamtGNklmeHBiUUZkM2hQK3RGR0pQbEowQnJkdFZ6aVZk?=
 =?utf-8?B?Q2F2azJ6MG9QbWE4K20vMjBTL0JpZ3JQUjd0bllNdnFRTm1HbHR3cThmQVBx?=
 =?utf-8?B?UEs2cGpic3ZVSDc4TUthanF1ckZ0YlROa0xnRXhmZEp0ZWJMdTRnRk9rVkJ4?=
 =?utf-8?B?MkNEbFFqeU5pYmtJWWNWU3NSQWxQaERLSkFZUFRMZUNlaTNCVHFLdGMwNERX?=
 =?utf-8?B?ZFFxMEV4WkJXT1VlTHhpMUpJTW1JREk1VGtGZi91NitnT2tSeDVQQ3dvbEpU?=
 =?utf-8?B?Ri9lZTJqT0Q0dE4wMWdlY1JLakFpUkFyc2JYUVcrd1Y3NXMwU0ZYT2VPS0pG?=
 =?utf-8?B?eGxBcURQYzVITEtJd3AvTld5NWRUOGJKTU9iWnlLU0dCa3pvakRUSm1ERXYr?=
 =?utf-8?B?U1kzT08rNVBQRnNnRVY2T1lCMzZOdE5vNGhVR21WVXhnbjN4VkpOVnB2NTN5?=
 =?utf-8?B?Vnd0bGR5a1o5d29QZ2dvZ3B5TCtGdzJyLytyemtsNnZoa091QVBPbFpxaFJ1?=
 =?utf-8?B?VksvUGpMdUhsQUgwbys1NUJLSlZLMG5IMElHTThjK2V6RkVDTWtHWHM2TjE4?=
 =?utf-8?B?c1M2dW1QcE5YOWpDYTd3eG1GOUF1QkhkN0dxWnNHOStFT29YOG5rZEU5QXN3?=
 =?utf-8?B?YkoyT2lUQ0hXaTJMQWlrdWVmOVQvaGFpZ0pwRVFySlY0OFNJWDhqT3ZydHZv?=
 =?utf-8?B?ZDF6dVdhZExYQ1IyOGhMT2RXWmNKS3ovVElra3ZDRDlORktWTTA1K3hEL1J3?=
 =?utf-8?B?N3RlMTFKK3ByZmN3eUt3bHU5dlJVS1A4dzhjTUV2RnNRWWM5em5HSzE4a2V5?=
 =?utf-8?B?dS94SlJXb2xBbG04TFRFWm90SnZoYU54MVVqME5TcnRMWWpZV1NxNGRkNjZ2?=
 =?utf-8?B?Z0YrK2pnMEorSm9ZVy9xUkFINDY5ZC9xQzlySGlNTkZ0VFJ3U2VnZWpHRzly?=
 =?utf-8?B?ZE9GWUQrWEpyMjRBMEtNaytqSXB2c0paVGVqVnFheW1NNDFWdDlqQWFTbmpZ?=
 =?utf-8?B?RW9RbHk3YUtMVXRvN1p6ME1DaXlSVXYyQ2hHendZYlVuNi9yblh0V3dEM2xP?=
 =?utf-8?B?M2JQWkRBRGdnblQxUWpFZ2xoekhXRlpVTjh5em9ON2U4eWEvS0NKL1dIaElK?=
 =?utf-8?Q?0LtZO5ujVeRKpjb0bLpqTA/nP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FC258EBC7DB57428D659D0C7C386EF0@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 7CCKb9HVjF108O9/pgD02+TWalIy4Al/ms1T/Z1ff7u8tanRiLTOXADnaQSOXqqi1ai/vo0irwMEBRT0ozg6Zp6FUUE8i338sJLoYCVUyOtGRwHtkL8DGHGAD8BDMWbclpZ6JcliAi7xhO586sAQIuS7mNVEACwOmT7b70DUB175MfMt98Hp//KkQyEUhT8wDfhv22PF3uN2ekfWPKIOi1oV+wJrOFug0Pxr3DmzOL4oqyx9sdfMz5sENWdZQb87TcLVYJe60jKcLX/xVVzS1biTI2BsavEk+jGvZa66qoHrC7K212QLaEa8Vz+WVBB8j4uOikiBW7wlRk8SMcyO+qBliOQHmAGRQ8+P8lAxCFbl6OCPm087Fs0e2RCNMgkIfsQ0KqwWSDL9L2WIKbFyZ6wtvJBTxcjems+ukgc5urIQ1nd35SC+Fwyp3Ec149qXtxqLM/XkPSGh1WHoSbQACh5fWKQlo0PYD4J8Wc8tan16/YlrzQRd7S+n+KLoqvLOdN6xQ9iOciKyPOkYKYUnsMoM+1+EdELD+EbVG2U6wRRYiiN8VNtN+lZHcaXQBdK8s2yE/d5IU+IVvkvXWWa0RB6voDNwMx/J3Amngk7TSzCVr2q+uEOVytdae8F/SG3+
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a18f7ac-27c4-4c42-db10-08dc90586c28
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2024 12:07:42.5583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ji1Ki7C3cB83bgtw0NxvvhFxEK2m5Xg5hsx7UOdT39UBC7uZpHYoai/imlvopMkxwuPZY5GI1i3tdM4JXO3j6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB9640
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxODc5ODkwNDpGUEtleTEucHJpdjqymu/ALGJvoSI14yY9lpGP+CLRHjLbI+BLFLeTNzBXG4kjpz+KhB6ZW54gl545BhPIDVTX5Dl4HUA29a2v/PlXiZjDb9vQxnHH+SXUySDVdGly0+H6DIO+ECo/gj2+Y8T8K4xzQYsbnZZTbpTBPxhHIqghtMR4kacPj6x/YXBzVbMCpKP7gUxwLbnpuwiYJy5RE2/5gkGLNPUsluUB3VFjXMqK9iEicTSNc2A7ZsCuKquhDTIbmjxmsPBHpTVaFbIMuXeeXCx/9caZl+zIDgaf2kGH5IjYvx43ro3ZpVIOMIMUMFlYPVP7ptegKduuTLFs8H/4TK0c359DaN+KT7Hs
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.66.1.141
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

T24gNi8xNS8yNCAwMzoxMCwgU3RlcGhlbiBIZW1taW5nZXIgd3JvdGU6DQo+IFtZb3UgZG9uJ3Qg
b2Z0ZW4gZ2V0IGVtYWlsIGZyb20gc3RlcGhlbkBuZXR3b3JrcGx1bWJlci5vcmcuIExlYXJuIHdo
eSB0aGlzIGlzIGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRl
bnRpZmljYXRpb24gXQ0KPiANCj4gT24gVGh1LCAxMyBKdW4gMjAyNCAxMToyMjowMiArMDMwMA0K
PiBPbWVyIFNocGlnZWxtYW4gPG9zaHBpZ2VsbWFuQGhhYmFuYS5haT4gd3JvdGU6DQo+IA0KPj4g
K3N0YXRpYyBpbnQgaGJsX2VuX3BvcnRzX3Jlb3BlbihzdHJ1Y3QgaGJsX2F1eF9kZXYgKmF1eF9k
ZXYpDQo+PiArew0KPj4gKyAgICAgc3RydWN0IGhibF9lbl9kZXZpY2UgKmhkZXYgPSBhdXhfZGV2
LT5wcml2Ow0KPj4gKyAgICAgc3RydWN0IGhibF9lbl9wb3J0ICpwb3J0Ow0KPj4gKyAgICAgaW50
IHJjID0gMCwgaTsNCj4+ICsNCj4+ICsgICAgIGZvciAoaSA9IDA7IGkgPCBoZGV2LT5tYXhfbnVt
X29mX3BvcnRzOyBpKyspIHsNCj4+ICsgICAgICAgICAgICAgaWYgKCEoaGRldi0+cG9ydHNfbWFz
ayAmIEJJVChpKSkpDQo+PiArICAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQo+PiArDQo+
PiArICAgICAgICAgICAgIHBvcnQgPSAmaGRldi0+cG9ydHNbaV07DQo+PiArDQo+PiArICAgICAg
ICAgICAgIC8qIEl0IGNvdWxkIGJlIHRoYXQgdGhlIHBvcnQgd2FzIHNodXRkb3duIGJ5ICdpcCBs
aW5rIHNldCBkb3duJyBhbmQgdGhlcmUgaXMgbm8gbmVlZA0KPj4gKyAgICAgICAgICAgICAgKiBp
biByZW9wZW5pbmcgaXQuDQo+PiArICAgICAgICAgICAgICAqIFNpbmNlIHdlIG1hcmsgdGhlIHBv
cnRzIGFzIGluIHJlc2V0IGV2ZW4gaWYgdGhleSBhcmUgZGlzYWJsZWQsIHdlIGNsZWFyIHRoZSBm
bGFnDQo+PiArICAgICAgICAgICAgICAqIGhlcmUgYW55d2F5Lg0KPj4gKyAgICAgICAgICAgICAg
KiBTZWUgaGJsX2VuX3BvcnRzX3N0b3BfcHJlcGFyZSgpIGZvciBtb3JlIGluZm8uDQo+PiArICAg
ICAgICAgICAgICAqLw0KPj4gKyAgICAgICAgICAgICBpZiAoIW5ldGlmX3J1bm5pbmcocG9ydC0+
bmRldikpIHsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBhdG9taWNfc2V0KCZwb3J0LT5pbl9y
ZXNldCwgMCk7DQo+PiArICAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQo+PiArICAgICAg
ICAgICAgIH0NCj4+ICsNCj4gDQo+IFJhdGhlciB0aGFuIGR1cGxpY2F0aW5nIG5ldHdvcmsgZGV2
aWNlIHN0YXRlIGluIHlvdXIgb3duIGZsYWdzLCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gdXNlDQo+
IGV4aXN0aW5nIGluZnJhc3RydWN0dXJlLiBSZWFkIERvY3VtZW50YXRpb24vbmV0d29ya2luZy9v
cGVyc3RhdGVzLnJzdA0KPiANCj4gVGhlbiB5b3UgY291bGQgYWxzbyBnZXQgcmlkIG9mIHRoZSBr
bHVkZ2UgdGltZXIgc3R1ZmYgaW4gaGJsX2VuX2Nsb3NlKCkuDQo+IA0KDQpJIHRoaW5rIHRoYXQg
YWRkaXRpb25hbCBleHBsYW5hdGlvbiBpcyBuZWVkZWQgaGVyZS4NCkluIGFkZGl0aW9uIHRvIG5l
dGRldiBmbG93cywgd2UgYWxzbyBzdXBwb3J0IGFuIGludGVybmFsIHJlc2V0IGZsb3cNCih0aGF0
J3Mgd2hhdCB0aGUgaW5fcmVzZXQgYm9vbGVhbiBpbmRpY2F0ZXMpLg0KT3VyIE5JQyBkcml2ZXIg
aXMgYW4gZXh0ZW5zaW9uIG9mIHRoZSBjb21wdXRlIGRyaXZlciAodGhleSBzaGFyZSB0aGUgc2Ft
ZQ0KSFcpIGFuZCBhIHJlc2V0IGZsb3cgbWlnaHQgYmUgbmVlZGVkIGR1ZSB0byBzb21lIGNvbXB1
dGUgb3BlcmF0aW9uIHdoaWNoDQppcyBlbnRpcmVseSB1bnJlbGF0ZWQgdG8gdGhlIE5JQyBkcml2
ZXIuIEJ1dCB3ZSBtdXN0IG5vdCBhY2Nlc3MgdGhlIEhXDQp3aGlsZSB0aGlzIHJlc2V0IGZsb3cg
aXMgZXhlY3V0ZWQuDQpOb3RlIHRoYXQgdGhpcyBpbnRlcm5hbCByZXNldCBmbG93IG9yaWdpbmF0
ZXMgZnJvbSB0aGUgY29tcHV0ZSBkcml2ZXIgYW5kDQpoZW5jZSB3ZSBtaWdodCBoYXZlIHBhcmFs
bGVsIG5ldGRldiBvcGVyYXRpb25zIHRoYXQgc2hvdWxkIGJlIGJsb2NrZWQNCm1lYW53aGlsZS4N
ClRoZSBpbnRlcm5hbCByZXNldCBmbG93IGhhcyAyIHBoYXNlcyAtIHRlYXJkb3duIGFuZCByZS1p
bml0LiBUaGlzIHJlb3Blbg0KZnVuY3Rpb24gaXMgY2FsbGVkIGR1cmluZyB0aGUgcmUtaW5pdCBw
aGFzZSB0byByZXN0b3JlIHRoZSBOSUMgcG9ydHMsIGJ1dA0Kb25seSBpZiB0aGV5IHdlcmUgYWN0
dWFsbHkgb3BlbmVkIHByaW9yIHRvIHRoZSByZXNldCBmbG93Lg0KUmVnYXJkaW5nIGhibF9lbl9j
bG9zZSgpIC0gZHVyaW5nIHRoZSBwb3J0IGNsb3NlIHdlIG5lZWQgdG8gd3JpdGUgdG8gdGhlDQpI
VyBzbyBkdWUgdG8gdGhlIGV4cGxhbmF0aW9uIGFib3ZlLCBhbHNvIHRoZXJlIHdlIHNob3VsZCB3
YWl0IGZvciBhbg0KZXhpc3RpbmcgaW50ZXJuYWwgcmVzZXQgZmxvdyB0byBmaW5pc2ggZmlyc3Qu
DQpMZXQgbWUga25vdyBpZiB0aGF0J3MgY2xlYXIgZW5vdWdoIGFuZCBhZGRyZXNzZXMgeW91ciBj
b25jZXJucy4NCg==
