Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACB3ACAA7E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 10:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C335010E1E4;
	Mon,  2 Jun 2025 08:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="boU5gM5y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A459210E1E4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 08:20:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I44DbN0mERmzADBiEFLIk0rVyiHFngZvN3Unb+LO0LdenUzBjM/+Ku225zuU4l/G/R7aoPrMDIVfwvxZS2Gd8+Q/Zzq4FCQnvy7UWTPXcG0n8dJflyfd7J4Mo2Uf+RyBUTQW7gDupBy9Ei/9Vu7RatqXu9BpGmBCzlrWJltLk5v4xnE//PmWnZIh10vrZYEkK5VPB1DQAiXKyk8KEF5GQkaUtkWKy63/LfoxHIKq1fGbeaWwWPnP40HWQHichcOHPnMWFukUVg2fCi0lItKs49RZScnMgSCTBaHbt4NNMZ3kmxY/yaXMg7KrzwOvDdhi922OObvZ+8uolrOOoZdcCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVDeZpy/4nhJQHLRMhayiLVrJ7mJzJbrLCIQqDqiMwM=;
 b=BHgLysRjtdoqpyBNx40Eye7ey8pdztoFMTzV0OQ5rkorkjwIFl6vjZpZILSTTMwHBi6IaW0fkEGSp1CqDcchtQceacgfDN8NhrToC7LRqPdYL4ZFedqXKJmYrV76OCfIfC27768GX0aYSXHxoCZE4wkgG3rjbscW0799Tsj55DkkzfGlyasDJzkjqKqoUvV2MYToQ5uAffSdgqwpcjZ42er4byvdJfgRR29mNwsGLJTpGaGkCcobqMVgxnV0SewpWNsqkPstZEmksySGLiG2jhE8DZFDLPTh9vKsZ+k+riebSYraQFClcRaNcy7LVh/9IW4alCoqUEUldMvhcRE9aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVDeZpy/4nhJQHLRMhayiLVrJ7mJzJbrLCIQqDqiMwM=;
 b=boU5gM5yBlnJs1NNnumrMm6IF3ZSPRUYJ7OITcj3DQq8hvELkDGmg/oo4mHNqCS58HT3yKWlaSqBXh/wJIHcw3rsqLnbRSbtfVkEIND5/WN3zb4lAqKlmPa0NJoI7+NxoUguBnceexU3hV+RnCyzx+mZP64i6yjbxgyyul/6hKM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYXPR12MB9444.namprd12.prod.outlook.com (2603:10b6:930:d6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 2 Jun
 2025 08:20:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 2 Jun 2025
 08:20:15 +0000
Message-ID: <33461928-633a-45c4-bd83-58d795a5f5a6@amd.com>
Date: Mon, 2 Jun 2025 10:20:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: list_lru operation for new child memcg?
To: Dave Chinner <david@fromorbit.com>, Dave Airlie <airlied@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kasong@tencent.com,
 nphamcs@gmail.com
References: <CAPM=9tyJgHPp5N6XpauFRL1hZDLCG8L+9Gmi7RCLRaK4BN4tzA@mail.gmail.com>
 <aDTmUw-CQYuZ1THd@dread.disaster.area>
 <CAPM=9txBdeJmAhZb1XW=3m-uxPxfDdQgb=PCBvssoJkQQDAdFw@mail.gmail.com>
 <aDT-B0EqqDeqXYFh@dread.disaster.area>
 <b20606e9-fc73-4f8c-91a7-e059a9fbce1a@amd.com>
 <CAPM=9txMcS4TsU5M8v6yGH7T7vbAFJM_yw0CVdZWPUpWfNLqmg@mail.gmail.com>
 <aDeaUkvbakteBtZQ@dread.disaster.area>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aDeaUkvbakteBtZQ@dread.disaster.area>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0430.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYXPR12MB9444:EE_
X-MS-Office365-Filtering-Correlation-Id: c45f8f65-cbad-492a-b773-08dda1ae4d88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3h2MlR1dTAwZ3NhYm5mbEdsRmk4K0dHZnRLMmowdXRCeEtTYjZQYkgxWmJB?=
 =?utf-8?B?M3o2S1dhNTJCZTZwWXArbmgzK0xSZ0l0VzRsbWl4YXZIaTdMZFNhVXlWK1RQ?=
 =?utf-8?B?LysvdkRpTW9OaXNpWmpyY05pbHpYWUFGUmVxT0VGcndBeHJTdEJuSFNuVUJy?=
 =?utf-8?B?NWtlWG1Lam5udUhKdVA3MHc5bFFtZk15RCs4Rjd1Zk12UHRKamVKWkRkdERz?=
 =?utf-8?B?NG0zTGI4M0o2VGVYSFJyZ1NXWk5NdmYvTVlIc2hERHd3V0dzRUk3MzlCMm9W?=
 =?utf-8?B?ajBYellJUXZMOXZXUHozREFodTZHd0tmVXNGVDFkL2d2UHVzSEV1RUJvWkox?=
 =?utf-8?B?UEczQ0ZlcHdBckNBVVRUTlYyL01sRHRNZGVBc2JoQ1hxbzQycllualdMa05N?=
 =?utf-8?B?Z2dBMldCYmpyelpiK0FUeThlTUhUZ0dpVXpMT0RwTUpMbnB6VytQMEROV2J4?=
 =?utf-8?B?ZjRkYjh2L1JiZHFpN0xMWDdDS2VlTDhUa3RFc2Ixakx0Nkw5d2t5cEpEaGg1?=
 =?utf-8?B?Uy9sNU9ESVFranZiQ3lTSWZvZHF5SG9neU1wSzB1UHk4ZnR5L0ZFYURrTm0w?=
 =?utf-8?B?U1FNdHZDWkFwa3NvTGw0YkFRWW85TWhqa3FCUm9LemxFbVhrcXoxZnN1Rmll?=
 =?utf-8?B?ZzhzMXZrcitSbnNublhoSnRNY1ZESTZzRFJSb3JocWVvZjcrNU94NFRCOThM?=
 =?utf-8?B?akpSQ2hZc3hoR2hPWjViU0NXbkwyTkRWSzM4WkF4QndpcVNRRE52dkJnODNW?=
 =?utf-8?B?R3ludzh2OVNBS3NBVGVNNTBDY3VRYmN6NUowRmtUNVNsd1dzaVBkMitTM2ta?=
 =?utf-8?B?dlZtdDdHdW9xbTRwQ1V4Ukt3UkN6bSsraWRyMnhzM3J4WFNJSFRoZ0dSYXhE?=
 =?utf-8?B?SXNJaWQ1dm1TQlVSSWlsbnlnaE5wc3dHVGVTcVhjSTdOVGRHZjJQUmM1eFc3?=
 =?utf-8?B?eEF3UEM3emVZMElvUTlQa3lnKzRyQlM1M0VKM2R3a1F5Y3N1VlR1ajJ2YXN1?=
 =?utf-8?B?OGZRWkZpZ0NYekM1MWt3SFBMU01LbG1OeU9sTVorTmpWK0xKcjBBZEtoSGw4?=
 =?utf-8?B?ZlpwZVRNaXo3Rmlsc2oxSTZqdStNQkJpdVAra2ZtZTlidkIrNk1xRmo2QXg4?=
 =?utf-8?B?eGFlK0ZPU1R6SDJjR0RqSFRjbFViMkovQlpYcDhRRitkaVlXMTYyK0pVVkZy?=
 =?utf-8?B?d082Q2kxanRLT0hGY0h2eWk3cCtscW5qQ25SMmlrYW5oZ1NGTHNzUUV3UUVp?=
 =?utf-8?B?c1RUcDhXLzBEd2lIVGhyU0lVcTM5UnpLS200RjFiSlArMHZVM3JjZ1g4N010?=
 =?utf-8?B?MXQvejZkR01pMm5VMjFMVkVBYnMwWldBaTNpc1p4Y1FLQVVjREZmZUJKV240?=
 =?utf-8?B?Wjc2UlF3VFhudE9xNDZtbjRwZ2E0N1BpSk05K1dyak5kSjlRY2EzT2hQSG1Z?=
 =?utf-8?B?ZnkvZDQvaGxTZXZrbmlXRXBheFlnbnU5a3VqWnhvVnc5NHo2TnEwV1g3MkpP?=
 =?utf-8?B?Vi94TXdGQ1dXL0Q4ZVpxVWVBSUpPQnIxMGtaQldWd3RqS3E3ck05YTI3UDdq?=
 =?utf-8?B?RnhDcGpyZTdrVlJQcUNSd0FCRWZLS1ZWOGZKQ0VMa0JBeFE1c2h4WFVFTktt?=
 =?utf-8?B?anlDQ0pnQjQyaHNTUVFsYlF1UmpaSElRY2oxRHlIQW8ycUN3Y1ZHNTdBWWo3?=
 =?utf-8?B?YmlIc1A1Z1p0dUNZVnVTNzJteUJ4Y0Y4VGFoRXliYURwdjRSLzRWSkNMdmov?=
 =?utf-8?B?T24yL2dRamg0RFJ0NVlENktGQzBDd2FNRHJLR1pncDhyaTg5Sk9KemNkTGpm?=
 =?utf-8?B?NWU0cE1TWC9EMjRjYnNQa3VVbm1GanF4Y2lldnVrSVhSZDQ1T3Nxckp1OTBq?=
 =?utf-8?B?Q08xQlBLY2drOStPdDc4OXN5NGM1Nzl5dU9zWHl5NWJuNll6b3ZkcmFkY0JB?=
 =?utf-8?Q?8WapnefyYL8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dStHd0Z4Z25NZjlIc2tEL1lsSGhBYkRIUDIvRjF5TFZ3NVUyZjJzQVNNdnAz?=
 =?utf-8?B?Z1lGMmVqdDFkZ2tQR1RTdkNLby9KYTZLQmlJeTJHWm5YMlhHUjArVXhjTXRU?=
 =?utf-8?B?RGpWZ3Z2UkxacEpqKzk4QVFvSXJLRGk1ZmxPZ0RsQ0NxSHJXYWdrUVRYQ2NH?=
 =?utf-8?B?UEE1b3ozSkRHeFVmVzdzYW9jeDFuc2c0WkVZb3luS21JVDkreW9EeGtVdTh6?=
 =?utf-8?B?QkNDUnNSdU5YTHNSV2ZYbUt4K0x4QUN5VHJ2NS9EMG1UT2dJOUVOQ0N2Vldy?=
 =?utf-8?B?U3RwSFVZa2poazR1cm1tTnFUSnRPRjBGZU44dDNjVVRGK1ZTQnI1SUlaYzZN?=
 =?utf-8?B?RXZwMWl0TWJZMWtOb0pPU1NrdkhuMlN2cTdlWHhYQ2YyeHFrcHJoeW9VSXEr?=
 =?utf-8?B?OFBFKzFQbmpqL2lxeVRYb0k3TEk2dHZDMUZpYnJzclhGalFTWnl0bFhVUEpN?=
 =?utf-8?B?RHRsbU1nbDFvbWRMaHBWRzNReGRQVGtlT1hNZ2FlNnRsQjN3c2d4VVo4bURT?=
 =?utf-8?B?V1NCN3Z4TXVuZS9qaVM2TkgrQ01LbThVZmNJWEJPMzcyWjFqK0NOWW51NlVP?=
 =?utf-8?B?R1JCL25yVHlYVEJPb0hGdnlIeTE1NGZtM2F2SjZLU0ZRN3VlQ1o2ek1jcHVI?=
 =?utf-8?B?WTM2M2toaDJwQnYzdUxwQnNuZUtTS09jdFE5c0RvckFSUEVHTGpsRm9TMkMz?=
 =?utf-8?B?NTU4VXRRTmlGellLazlJeEQ1dUFURGNkT3ZhSzBkb3V0VXBFelJINFA3T25I?=
 =?utf-8?B?dkFwcmZydWxvUGp0ZjB6WEFhQmFITDhmQ05GWEhSMFl0RU5idHdvSTBLVUE4?=
 =?utf-8?B?Tit5cGI0NGlnT081aVhRSExIUnZzeGRqWVFzTlIwZStpc2hLeXFTQVVLeHNE?=
 =?utf-8?B?V21nSm00YlcreExuZS93MVVkTUZvb1F3Sk9tNFVOUEpWM2gyNzNsdjVZUS9N?=
 =?utf-8?B?am9qQUxXR2Nnc0VYd0FmMmNUMXRKcFZsS2c3WXhiV1ZqRktpRXREUE5kT2Jx?=
 =?utf-8?B?OWdMTnNHelZHbXJCOE90OEtZQ1k5dDB5TkdGRFRja1NsZnppNnYzMElNaHhz?=
 =?utf-8?B?Z0RXYzRESG5qVHkwMmE4SFhWOUozak5uQVJMNGNDcVNmTHJGL3M3ZDh5SmdC?=
 =?utf-8?B?NkRDZ0ZXVGkyK1hLSEU0M1hSM3RTR0hQN2NFR0tGdHZyN2VFY1pLTFkvREFN?=
 =?utf-8?B?dnRzZHBzRVRwZnI5QUxBODdzR25BQi82MWJjVC96dkYrdHlaRUh5dTFBbzhB?=
 =?utf-8?B?bWFaemRUVHVmU0VTcUJnRTQ2MjlOL291dWJEZ2ZkNlRsemxONi9zeDZPZmxw?=
 =?utf-8?B?anBRK21idWdEYzY3WThFdHhkbUNweTFkc0luSWpCZ21pRFlKNHBNQ21YWVZR?=
 =?utf-8?B?TWxuVnVZRE9qWnBjRGFXT1Fvd3Q1dDI1c0pHNGQ2eGREMjJEb1M2RHZPUko5?=
 =?utf-8?B?cUgvRGQrVmk2TnFEM1Z5eHVydkFCRjk1RDE3K2VZWVhZankrRDlmajV3eG9t?=
 =?utf-8?B?T3lDcmUxMEdyZFgyL291bG1PM0hlRXlPMjZzbUs1cXdJZDBpdGhSU2hwaEcr?=
 =?utf-8?B?VWJHalpweWxFV0drMkNNRkZIZ2cwSFBQdXdzSU5QbHJSUjZiOERuK2QrNUZE?=
 =?utf-8?B?by83Q1hXVlZwcHpqcXdybTBLNkNwOUNYeGh4aE9xdExsNTJLblhva05TeW1J?=
 =?utf-8?B?TFUwMGwvT2RhNklCd2M0cE9qdmpkRkxUQi9OOFllQ1hrNDlkQzNpVVgzTmRm?=
 =?utf-8?B?bjFFN0NRaGNCcjNhb3I1SWh5cWVLcFBqeng4SnZpRk9tSHZlYUZzemx6cGRM?=
 =?utf-8?B?d1FoSlAvbEk3VHIrVVl1YVduNmFISGQ3dll5RXZmcWJicEhYckpvRlowVktL?=
 =?utf-8?B?MkhQWndGZ2NGN0lYcURNWDNTL2hWcmFXcGZWN1RDYUhZTVJ2T25HQXphTkxC?=
 =?utf-8?B?UDRnNUF3V1k3Z1lkdm5PSk5kUDRQOC9DTHJEb3RPTHlrNkJmVmcwL0RBRWFJ?=
 =?utf-8?B?TFFOOE85QWVKZkFGSnh5N0JPRmQwNUdPSEQ5dUNoejV6N2ZxOTljbyt5ODNZ?=
 =?utf-8?B?SU5VMXdmY09FeTdtTElzV0F2NVhvOEZrelAyWG5jYk16TW1TVEJ6aU0rRkVp?=
 =?utf-8?Q?fgO0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c45f8f65-cbad-492a-b773-08dda1ae4d88
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 08:20:15.7084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gv7JJv30oZlYACg69KUBKGoMUDdFIUZDDZY7odw0WjAFf6o0H8nSRPIGlIPpkq0w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9444
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

On 5/29/25 01:20, Dave Chinner wrote:
> On Thu, May 29, 2025 at 07:53:55AM +1000, Dave Airlie wrote:
>> On Wed, 28 May 2025 at 17:20, Christian König <christian.koenig@amd.com> wrote:
>>>
>>> Hi guys,
>>>
>>> On 5/27/25 01:49, Dave Chinner wrote:
>>>> I disagree - specifically ordered memcg traversal is not something
>>>> that the list_lru implementation is currently doing, nor should it
>>>> be doing.
>>>
>>> I realized over night that I didn't fully explored a way of getting both advantages. And we actually don't need list_lru for that.
>>>
>>> So here is a side question:
>>>
>>> Is it possible to just have a per cgroup counter on how many pages a cgroup released back to a particular pool? E.g. something which is added up to the same counter on the parent when a cgroup is released.
>>>
>>> Background is that the pages are not distinguishable from each other, e.g. they are not cache hot or cold or anything like this. So it doesn't matter which pages a cgroup has released but only how many.
>>>
>>> If it would be possible to get such a counter then it would be like just a few lines of code to add the isolation and still get the advantage of sharing released pages between different cgroups.
>>
>> I think numa is the only possible distinction I can see between pages
>> here, even uncached GPU access will be slower to further away numa
>> nodes,

Yeah, we have gone a bit back and forth about which priority things should have internally in the past and settled on this:
1. uncached and WC requests *must* be fulfilled. This is a technical necessity.
2. Allocating from the requested NUMA node should be fulfilled as much as possible. Performance really goes south if it isn't.
3. Allocating memory in large chunks is really nice to have. Gives up to 30% performance improvements in some use cases, but it's still better to use smaller pages from the right NUMA node than larger pages from the wrong one.

>> But indeed this might be a workable idea, just make something that
>> does what list_lru does but just for the counters, and keep the pages
>> in a single pool.
> 
> If you only want NUMA aware LRU + reclaim/reuse without memcg
> awareness, list_lru supports that configuration. Use list_lru_init()
> for numa-aware LRU infrastructure, list_lru_init_memcg() should only
> be used if need memcg awareness in the LRU.

Oh, that would be really useful!

Currently our NUMA support in the ttm_pool is basically just a hack which relies on intimate knowledge of the only device using it.

> THere are various caches that use this config e.g. the XFS buffer
> cache and dquot caches because they are global caches whose contents
> is shared across all cgroups. The shrinker associated with them is
> configured only as SHRINKER_NUMA_AWARE so that reclaim is done
> per-node rather than as a single global LRU....

Yeah, that is pretty much exactly what we need as far as I can see.

Thanks,
Christian.

> 
> -Dave.

