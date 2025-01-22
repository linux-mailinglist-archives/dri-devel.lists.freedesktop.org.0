Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FE4A1A266
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 12:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A831E10E7CB;
	Thu, 23 Jan 2025 11:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=amlogic.com header.i=@amlogic.com header.b="w2ytXgYR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20721.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200e::721])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707CB10E08F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 09:50:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a18qcHdjsK9CQT/IswjNz0ejseKQpymxKT1HpXIIhsWN7fjIbV+ymYMMjOGXQmpN75rb1EuvFDekpqRkJcuUt8uwy9TMPDzSW6Pj3pB1324aNVcVIVs95W3qLbtKSc4q7jYMn7dDk6nbTnBYP5NrMRLqcO6+WV/mmi/rs8a4SUgDyFvKQjeAeP21I/bOGYJaA7U3l1WeYWeKMgSfnfqVw1yPE2eS6GA7ihWIo44+vyyYYGZYgvQZJ9GiW6zjwgGOl1sbsQvcWPTe7ba18c4HCdlTpTvFwNq/jXOHDcLqcPDAcsogoV0ExLFR9UOuG7A2Nvib3b7oNnjxciLwsdqS1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDYt3TIelwB9XXttsZTSY33aWcaWYEgNY4NojCYHGcc=;
 b=Hoj/2fOLW2PkoKgm1XBPWqsVU2aer6wLZJbvgUPAT+EXES7UrYANzLD37ppBDF9SuUEGnx9S8i+hWcF0++TNPPktOwqq0gKdAGDUsTIzDXCtc3PyH0UqLinVZvXlPa8UvrxW5SZuG7IZdQ0aMMBhkdapy87DNGMLxW8HliNL7CsHk5P05/MKgpTEDIS9iybtJQ1v6YOATh/FS14t1qMWZ9WYN7soQFmqbHHtcPNZAfnvZTbvSEMLHBDLWcPcjzxNViI7ZJoqEJ0XXkeEbGDOodDfahUoXnzprIlU2uCPYyRkDh1+N6eZvQKyClyaUWw+MwJZRJIUQJongk68iws83w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDYt3TIelwB9XXttsZTSY33aWcaWYEgNY4NojCYHGcc=;
 b=w2ytXgYRzW1g4PSNKW6GeqgZfVj/fv56ESBZYYeBQ0JPc5owjAAEP/S9a3xjuGytXkZ/UxhqeCgRxKCMt9WQ6dJ0KBqpDDJ5ws7aUQaQu3DLVM15X5DdBh3HaNW3ZHi+yhHVf7OrWz7oUSopy6J4O7plvULJ+182y3E6pfWQ+AJIGdGu+nzWVPxtEYGAdCvZuyDdsKtdMeA621KiH6R9IT9xFTR1dUHUgg4YgYLk6BRd6uJOLYr+eHgLQ1r3g+6fX8427C/dd3+NO/hW0BjWF0pcmiPMwj+f+CNaYqRV3U74DgXZ6de1+mZjTTBMZEgo2rLA+4Ib97BVh/psGFSgqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB7155.apcprd03.prod.outlook.com (2603:1096:400:33e::5)
 by OSQPR03MB8436.apcprd03.prod.outlook.com (2603:1096:604:277::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Wed, 22 Jan
 2025 09:50:31 +0000
Received: from TYZPR03MB7155.apcprd03.prod.outlook.com
 ([fe80::8d2f:b8cd:fdec:5724]) by TYZPR03MB7155.apcprd03.prod.outlook.com
 ([fe80::8d2f:b8cd:fdec:5724%5]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 09:50:30 +0000
Message-ID: <3aa88bdb-ce84-4029-b497-2502ab1eb7a5@amlogic.com>
Date: Wed, 22 Jan 2025 17:50:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for Amlogic
 S4
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <CAFBinCDG2in4ZZAp2LXnz8bgiZoPL3G_c9+aCo9+Ort2W-tFCA@mail.gmail.com>
 <1jwmex5lpc.fsf@starbuckisacylon.baylibre.com>
From: Ao Xu <ao.xu@amlogic.com>
In-Reply-To: <1jwmex5lpc.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1P15301CA0059.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:3d::20) To TYZPR03MB7155.apcprd03.prod.outlook.com
 (2603:1096:400:33e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB7155:EE_|OSQPR03MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d8bc139-60a8-4cd5-9743-08dd3aca351d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWJnanVudE1qSWhnOWtMS3ZWN0JaeEtOUHlPUDIrZG8ydDV4SFZia2FmL1hn?=
 =?utf-8?B?ZFd4NUVtSFFFaFU3TmRpSUI4aGxXSy8yMU51S2hjM211ZkVCTzB2bHlvcm1Z?=
 =?utf-8?B?aU05VXNFQ1NoRTF6cWpGNGh5NWU2NnNGeGQwU0RRcFRnN0NrQWJJTWJaUlp3?=
 =?utf-8?B?NnpETUtnYmF5REJmQ1YzdkwwcWNhbUsrZ3RiOUZxRFVESDd6MnNqWTZQRWU5?=
 =?utf-8?B?eEVYbDIrZ0F5eXM5UFJ6a1JNMzRwamozWmRMdU5heDlFNWJGOXhRbHdxdU5v?=
 =?utf-8?B?ekxVUUx5S3Z4cThIWkJVL1plZUxhNk9jUkJtaFp4YVU1Tm42aG92eklDNGtQ?=
 =?utf-8?B?RGRhUkFNQytmdmtsaVFWcGpQNDNCMFBxVUovMlNUV2RXS1pHcWJHVFhoMXM0?=
 =?utf-8?B?UW5HcmR6Rk85bFIydGlsczU3VWhsZlM2amphb1h3ZGxNVis0UW9sallSTWFW?=
 =?utf-8?B?RmVmZnAxV3AxN0tYVld4Um5LTlZCNUt3dUNnNDVkUlBmaDdwUC9weEYrYmhh?=
 =?utf-8?B?MnFOSjFGSW1mTXo1YldmM2ZLTGZUcXdxdjZBMHRyeGNrZERlWE4wSlZhS1Rs?=
 =?utf-8?B?ZkhEOEEyNE1aVjBTZE5wVnJ3OFN5Mm1EdEpWV0F4THh0R3ppaUJtMVNZdkdG?=
 =?utf-8?B?WHREbnpYWFlFalJGVHc4cWNtUTFYOXhjS1JyMVVRaUJFY2M2dlo2NTFRMWpI?=
 =?utf-8?B?YXIwMk9rZFJMZ09nWVlrZXFwSkxhejhhaEF6L1RZZmlsVXlPaFp2YjZnSmRR?=
 =?utf-8?B?T1h5Z0lZdlFYYVU3SHErTWNwMzZEakhnOVpGNHg2MHZxc3h6NVNha20xMzdU?=
 =?utf-8?B?WVpvWUd6Z2lYU1pIVGNuR2UycC91Wm5MR0Z0cFZPSjIwOHUyOUdyNEpNcXl2?=
 =?utf-8?B?NWVzWmhPVVZ4SWhlckNyQnBNVG9SQkFoUm42ZmVLUUVqelhYTVFUY28vbUN0?=
 =?utf-8?B?OHVjc1RUSnQ3RmxsTmFSZ2JlOC9aOUR4T2NoOE1OeFk1WUY0dXBzaHMzZFpW?=
 =?utf-8?B?ekx6ckE3ZTJwbjIwMnoxbjhnbFhsazhPdWFHQVROOHhrbS9qWVlYN3J0RUN0?=
 =?utf-8?B?eDZHYkUxWHhyV2ljZURraGY5cWNyaG1PODFvS2xZZHh6WVduQXVKQi9UTHhW?=
 =?utf-8?B?dlVJaWkyaGcrdE1vanJQMmZXVk5BUDY3eVU4eTcvOURVVU02a3p2R0J3UlZ2?=
 =?utf-8?B?WG4xZmVlVW1FTk02LzF5dTFnNnp4ZkJtYk5mR0V2T1FCLzFtN3VtWDhmZkRW?=
 =?utf-8?B?UVgzY016WDZDUUxKWWM1UHJWcjV1TW9rSnZQcERIZzMzOEptdVhPN0JLSUx3?=
 =?utf-8?B?eTR6bU15NStpdjhlOWM1bHdaUmJhUG9Nb3NyUWtONzYzbEJJTmhXTW9pQmli?=
 =?utf-8?B?NjJRZlNMSHd5YW43Y04zSDErNnQ4Rm5wdHFUQ1pGN0FoTUQ1akV2d0FBQ2hx?=
 =?utf-8?B?eGFmbk5lMVhwL3BhZEJLVHgvVkFMNnA0NjRQNVFHUlZFaXBmUEJ3OGxBQmtP?=
 =?utf-8?B?OHZxY29YbGE0NU42MDZ3dWlSRjEyR3dZSUlWNXVjUjlTYlVXcFFkSVJyUUN0?=
 =?utf-8?B?Tko0VmJERTIyZzQ5Yjg5Z25hTkRDQ2IwZHVPbVlqVHQ3L0dhUzBwSDVxM0oz?=
 =?utf-8?B?eHRocGJORzBJNThlcUw1WHE3YWVxRCttckdyZW4xcjZzZWJselJueTRHMjVq?=
 =?utf-8?B?dGVKZTdiTWloK2NCSndTWGlMWEtybkxUL3k5elFKa0htbW5LNVd4NFJ5UXUz?=
 =?utf-8?B?Rk53OXhuUEp2UEwrZktZR3p4VGExNUFwc0ZHWktwRVEvMHIrVlJoWjlKSWF4?=
 =?utf-8?B?aGVPTWRLTXFtTVY5aW1kdXgxaUhhZmNrSXRqbno5VHJyUFdSRXYramtTWHpT?=
 =?utf-8?B?V25tekR5TSsra2xlYXNCdWtucUNWSjQ5bS9EZDA3cnQ0U0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB7155.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUQxc3ZCWHpDM3BzM255QTJiNXZLd2VFc2JFTE14b3hMVHpUL21ic1daWC8r?=
 =?utf-8?B?TnREQko2ekw3Tzd5eTd0RlloK1Q5WTlPeWZlbjAzd3BjWTdiWjlmSURPZlJM?=
 =?utf-8?B?SHpwOWVUWVdjeFBaVFpqRXZDcS83R2xDMUdNMUVGaHpEbi9rcG8yc29QR0xG?=
 =?utf-8?B?TnV0QmVWK3NaM2s5UUJ2aGpHZW91ckg1YUU3V2l6NlRkMi90N2ZqcUp3NXJQ?=
 =?utf-8?B?d3A1R3ZWL2daa2lXMDAraTZtK2Q0VnVwS1hoUzhiQkpzWHJGblhndnV0eHlY?=
 =?utf-8?B?ajFsbGpuNmNOU0JnWURPTGEyZTRtNUI4Znp0Z0RjUFpkZEhZblRmNUhDdUZT?=
 =?utf-8?B?NmdTVmo5dHZZUkxmenFaTVc0THZTSGFNY2YzYUFzQmRPaU8wWnlmcFZDa3F0?=
 =?utf-8?B?bFJrZTM0T0ZDMHRyMHhNZm5yVWs0bmhCL2Jmd0EvNFVzM2pEQitlSjBiempG?=
 =?utf-8?B?bDBta09sVzlrUWx0YkV3K1hYS1REbnlJeXFGYVg5cDFPTUN0emp5aW5qM2Nv?=
 =?utf-8?B?MnhWUHR0dkJxMTlKRDhyemI1YkRtWGRDOFJEdXpLcjg4d2JpWGNDT2hsblZV?=
 =?utf-8?B?cmlqT3UrZ2c0WEgzRVFrYTB3cjF6S05WV2ljNmFSZzB2MEkrNzZ1MTJQUFdo?=
 =?utf-8?B?VnBaTUZqdTJMYS96eDVURTZZZ3E1Mnp1NnFIUEttL2FTSnBZWjhxT1NpRjdB?=
 =?utf-8?B?bWJZMWRlMXg3L1MrMWxMdG5DL3RTYlFIVjFPMUlob1FoVjZGdG5oZ05tSUg2?=
 =?utf-8?B?U0xIMVVLK1UvdE1TL2xJQk9ydkd4MWwxc1E3MDFXWHFzSUtpR2haYitpWGg4?=
 =?utf-8?B?TEJGcG8zaXFjTHlJZHp0UjBkMkFvRTN6NWlJREtyNWNGLzhiM1ZuT0ZoU3Na?=
 =?utf-8?B?c0pvOHlNUmF3RXVXZlowdEpPSE5Sa2Rrak5tVUQvNlpUa0FSWFBoZHJtcTlJ?=
 =?utf-8?B?eWxzNHY0NEZmRzZVMWpRWFU5YWNrd2Z3S0V1WmhWRUdFWmd1czVYSnlHZ0d4?=
 =?utf-8?B?RVFFdlVHcHRNelpPYTRyOUpPU00xeWh4cWNMNVFsSW1JelBscGtsb0ZKUTdl?=
 =?utf-8?B?bTBsUmZkMHFkZ2pJOElJYy9WQWk4d3JMNGZ4N1JZRzJGcmp6MGI4SDYrYVNC?=
 =?utf-8?B?TGozWk9aYWZ2R3VtSnk0SmdLcXhuNHZTbXJ4VlFTNEM2akt4L1pHT1h6MVdr?=
 =?utf-8?B?MHRScmEva1pRK1NQelJqN1hldnhBcE9ldU5EY241bHBSMEhXNHl5SlEzdmpk?=
 =?utf-8?B?ZFVyYzVtSWZRQjdKYWxlb2VhYVVkTUtkTlhja2Q4d3V6Y1lYVWVIcUF0eHR6?=
 =?utf-8?B?N3crRlBOdXY0akkwRHVjVk9BSFp3LzcyaE1valBQZXZhNEpqYWVwbm5zaVBX?=
 =?utf-8?B?OFd1UVZzaVArU3FNU25VbXFCV0p4RnFJMDdveXpZS3BsNlgyc1NRdkszN0g4?=
 =?utf-8?B?SHJnaDlkNFd2K3JmQmEvUVN1RXQvQlFjWlVaRFBHWFhGT2pNNXBWbzAxWEZL?=
 =?utf-8?B?TXNuKzhrSHRWNHdmbkx1dmVFQVRFc1ZhU2tHdzk4U3NFT0V4SXcwMkhmQ21P?=
 =?utf-8?B?N2FqTytGOC9nTnhEaVFNR2pMRE5wcWMxLzhvS1FPbDdPRWVLTFgrTFlSVTQw?=
 =?utf-8?B?Y25jTlRqNnd3cUZMWTZybElMY2FsNFFEL3NpMGVKQnBMTGt5eWwxU2tJcjFx?=
 =?utf-8?B?UkN4c1VyVFcyWkpzMS8zbk1SSHpqSmdlMUY3cndlNVFWNHhFOHA0NVFDVHBR?=
 =?utf-8?B?RUZ3c1BoSlBVQ3ByOW5LR3IxSzVuQWIzVlQySVBDVnZvcUw3eGFrNHlVNTgz?=
 =?utf-8?B?TEJNbTI4aml5MTRQcnpTSlpCSjlJYXFoM2tNdkVwV3I1enlFVk0zbUYrVnpK?=
 =?utf-8?B?N01DRk9MSzk2cTFhYVErS3V3L2U4SFhiTXNSV0l0eW5LdUFPNnUzUitKbmRJ?=
 =?utf-8?B?M01PM1BmSU1JS1ZWNS9sVXB4a1NmMlNFRlZTNksvSXBHcmZQcy9FL09IVm42?=
 =?utf-8?B?RHdtdVI0Q2c1eFlvTFJObFRaYmlsM1BFZmdEdWIzRVRzMXNBckxTU1VTcUh0?=
 =?utf-8?B?VXYzN1kvSEtpMmRLRm8rRjVWOU51WXhCckFrVHBFejlObWdSbW93UlZxZmN4?=
 =?utf-8?Q?s5l1rqWory9YXgRb0Zg8MqspX?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8bc139-60a8-4cd5-9743-08dd3aca351d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7155.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 09:50:30.8460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdllN26YsxCGSttWdmmo45RPLy5ipQIiqTwHafEF3ntjQCRx7P0aP9uvfnCH6WD+xjyv46d8AM2BRLYS/cIlBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8436
X-Mailman-Approved-At: Thu, 23 Jan 2025 11:02:12 +0000
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

On 2025/1/15 1:50, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On Sun 12 Jan 2025 at 23:44, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
>> Hello,
>>
>> On Fri, Jan 10, 2025 at 6:39 AM Ao Xu via B4 Relay
>> <devnull+ao.xu.amlogic.com@kernel.org> wrote:
>>> This patch series adds DRM support for the Amlogic S4-series SoCs.
>>> Compared to the Amlogic G12-series, the S4-series introduces the following changes:
>> Thanks for your patches. With this mail I'll try to summarize my
>> understanding of the situation with the drm/meson driver as I'm not
>> sure how familiar you are with previous discussions.
>>
>>> 1 The S4-series splits the HIU into three separate components: `sys_ctrl`, `pwr_ctrl`, and `clk_ctrl`.
>>>    As a result, VENC and VCLK drivers are updated with S4-specific compatible strings to accommodate these changes.
>> Jerome has already commented on patch 3/11 that this mixes in too many
>> IP blocks into one driver.
>> This is not a new situation, the existing code is doing exactly the same.
>>
>> Jerome has previously sent a series which started "an effort to remove
>> the use HHI syscon" [0] from the drm/meson hdmi driver.
>> In the same mail he further notes: "[the patchset] stops short of
>> making any controversial DT changes. To decouple the HDMI
>> phy driver and main DRM driver, allowing the PHY to get hold of its
>> registers, I believe a DT ABI break is inevitable. Ideally the
>> register region of the PHY within the HHI should provided, not the
>> whole HHI. That's pain for another day ..."
>>
>> For now I'm assuming you're familiar with device-tree ABI.
>> If not then please let us know so we can elaborate further on this.
>>
>> My own notes for meson_dw_hdmi.c are:
>> - we should not program HHI_HDMI_CLK_CNTL directly but go through CCF
>> (common clock framework) instead (we should already have the driver
>> for this in place)
>> - we should not program HHI_MEM_PD_REG0 directly but go through the
>> genpd/pmdomain framework (we should already have the driver for this
>> in place)
>> - for the HDMI PHY registers: on Meson8/8b/8m2 (those were 32-bit SoCs
>> in case you're not familiar with them, they predate GXBB/GXL/...) I
>> wrote a PHY driver (which is already upstream:
>> drivers/phy/amlogic/phy-meson8-hdmi-tx.c) as that made most sense to
>> me
>>
>> Then there's meson_venc.c which has two writes to HHI_GCLK_MPEG2.
>> I think those should go through CCF instead of directly accessing this register.
>>
>> Also there's the VDAC registers in meson_encoder_cvbs.c:
>> I think Neil suggested at one point to make it a PHY driver. I even
>> started working on this (if you're curious: see [0] and [1]).
>> DT ABI backwards compatibility is also a concern here.
>>
>> And finally there's the video clock tree programming in meson_vclk.c.
>> My understanding here is that video PLL settings are very sensitive
>> and require fine-tuning according to the desired output clock.
>> Since it's a bunch of clocks I'd say that direct programming of the
>> clock registers should be avoided and we need to go through CCF as
>> well.
>> But to me those register values are all magic (as I am not aware of
>> any documentation that's available to me which describes how to
>> determine the correct PLL register values - otherside the standard
>> en/m/n/frac/lock and reset bits).
>>
>> I'm not saying that all of my thoughts are correct and immediately
>> need to be put into code.
>> Think of them more as an explanation to Jerome's reaction.
>>
>> I think what we need next is a discussion on how to move forward with
>> device-tree ABI for new SoCs.
>> Neil, Jerome: I'd like to hear your feedback on this.
> I completely agree with your description of the problem, that and
> Krzysztof's remark on patch 6. This is not new with this series indeed,
> so it does not introduce new problems really but it compounds the
> existing ones.
>
> Addressing those issues, if we want to, will get more difficult as more
> support is added for sure.

Hi，jerome

     What are the next steps for "an effort to remove the use HHI 
syscon" patch set, and what is the schedule?

>>> 2 The S4-series secures access to HDMITX DWC and TOP registers,
>>>    requiring modifications to the driver to handle this new access method.
> Regmap buses are made for those cases where the registers are the same,
> but accessed differently. There is an example in the patchset referenced by
> Martin, to handle GXL and G12 diff.
>
>> This info should go into patch 1/11 to explain why the g12a compatible
>> string cannot be used as fallback.
>>
>>
>> Best regards,
>> Martin
>>
>>
>> [0] https://github.com/xdarklight/linux/commit/36e698edc25dc698a0d57b729a7a4587fafc0987
>> [1] https://github.com/xdarklight/linux/commit/824b792fdbd2d3c0b71b21e1105eca0aaad8daa6
> --
> Jerome


