Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6BBA84A4D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FBA10E377;
	Thu, 10 Apr 2025 16:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Bt2fquV/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FC910E2B3;
 Thu, 10 Apr 2025 16:43:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7AbJob+zyX/1a8x+qI1OIN1L5+58tQj/6ldMc2Qz01DHqBQAUDWgcGwKoWWhCNWDoULjkUGsWsdG39+AWhv+UVNroM/2dauYWzM6WyS4nzcTJAKcRuxtrXiulELDn41RH0wvksw3YKEmgzv94QjSZDqy98J4transzNR2GEPi1K8sENVGVBvbCCIQi37gnMyUdBM9jh+ZGuzHHDhErZoE3vpqf4JCstvLM2y02QCdkq3Si9ceNHtHbPR9Yb/bbdDD/vgj59hZh3U6BgQzwEEKRvoiVyWl2+9hNLgkvMSpFoXQLBmwLLaSc0Jx/8EwfaHhNcoFLEKLNTpc4Wsw4z4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfwJefihanbG85PjygD4etLHb/CECY4zwGSbK/okJ0o=;
 b=obslcHOgz66fcPj8ME6ZYXT4SHLkHLD/kz3JTzHKykWmTzanFPK1VKTt0AabQgi3pTvEkSaj1y1tWS9MS8hOFuhD/JX1YJnSYEHPRa9ITPGtnA4gVnqyZafFH59TQngFpfgPnNmSBmEXtWeQWHovbeKM5AJqwLS6nNZbX9fu3OSjKzIhIRM+VDAkpsn2Mjqx0rAgJS5xwOzljvpbAnlVkgw1hfJku/hp35hUVC2+JBCFFa2Ta1USHkbWsPSh56DX4dOP18arKRMYkDU6oCtaZbo+eYhLPloj5BR5uIe7hY/0zBm/8+dsEr7wuSRMTWXLbbf3Jt9hzaGCwC7sPNA9Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfwJefihanbG85PjygD4etLHb/CECY4zwGSbK/okJ0o=;
 b=Bt2fquV/Dugs/V/A+WGJ3fqmj937ESfU9SX5xMe6lLpl/E3+ncd0PIhuzAC7VmX1obPT1EyONeaXFmv5V/Wv7APhdzaIkM2C/Ybvvcd3ABGQKlCD4uCHQv9c/BNpuHZgBtVAojQC6ajwZ98rtQGcg0bTOgJPCDZEzz09/HgGRzo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6552.namprd12.prod.outlook.com (2603:10b6:930:40::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Thu, 10 Apr
 2025 16:43:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 16:43:38 +0000
Message-ID: <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
Date: Thu, 10 Apr 2025 18:43:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250410175349.6bf6a4ea@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: 869a9af6-a286-48b1-0d36-08dd784ed7cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFdTa1RwUmRITlM1ZmVFeXFVUjRhRWFHem1XQ3RQSjYvMm4xWEkyWnRZc1A2?=
 =?utf-8?B?aWU1eWJab0VtWTBtZjZDZlgwZ3RBVFRocEd6NkpRRVRvU2VwaGVVUzdWR0Rq?=
 =?utf-8?B?cGRwTDNEOFc3cGJjUnhGaHBSOFFoT0NZWXdpR2lwRUkycExnMmxnMVhHMzBw?=
 =?utf-8?B?cSszKzlZRGs5NzVmc29MSlNSbG1YRmRqcDhYaXFnS3pwNlp3aU50ZkdlRHNS?=
 =?utf-8?B?VmR1NXNmSTZLWjV1ZCtQNk5DTnBZYXo3VDZQQk9UdW1aanFEWlBaSGh6cGI2?=
 =?utf-8?B?WG9lMG1PellyaDYvckVIYUc1elN5V3k4QXN3UnBnTXdZYnBWbVhnNm4xMVFW?=
 =?utf-8?B?WWJEc0ovZ3Bnc09LTUpHQkNTU25hcHA0YTRnbFRnQ0NXN0pHVGhEMXhaSVpK?=
 =?utf-8?B?ZmZSZ1FacHErbDNTOEhGTlZIQnkxRGIrblJ3ZTh1QlZYOEVud3IrK0JBRnQ4?=
 =?utf-8?B?SnlvNHV4TzJ3QTZENlFhRHJQSWRacGg3VUU0UXdhN25JQmNlSTY4aEFpRjFY?=
 =?utf-8?B?anpORExCZXdNb2toYjJ0U0d2NVNxaGdoTTBKM29KbWlKeUNtS1JEWlluVGl1?=
 =?utf-8?B?ckVLVE5TZ29BaVh5c0dvVnBGc0dTNkJhWStjaHhUcHZITWR2b1BvNG5FM3Ev?=
 =?utf-8?B?cUxnSk4xSUw1dXRtd0FCbjRDS1VvR2U3MWFIVHlaOUhCUkE0NEFOSVRNYXpx?=
 =?utf-8?B?dDFVc3hIYUx6QTk3ZVBKVVUzY003TWdobGZINTg5MlVBNVYyMW1qVGgzRUdw?=
 =?utf-8?B?R1RHSU8xNjU5N0tSY1hIdzZVMk9oVXZaaHFjOHo5SktucjQwUXB4elhremlo?=
 =?utf-8?B?WGlRelIrTVRVb1B3SkdyN2hlZkxkbXh6OTl5d3lRWCs1WXhDV0NwK1dkait1?=
 =?utf-8?B?cXUrbFlab3AvT3c5WlJjM2xBNGI4UmxxWE1oa29pOFdEL0wyNHZlY2REUGs1?=
 =?utf-8?B?N2VRL2RyUm9ycTVmRjAyMEJBT3lqVjF1d3pucGpiZklvSHg0cmp0Qjg3SVZ5?=
 =?utf-8?B?RElxTFFRbmdlN0E1QkViUFhWbnY2emR1cDhuSzRmV3ora2tYTXN4OTQ0WXpG?=
 =?utf-8?B?ajUxc016ZUFsZDRVSWNCR2hXUExsZEgyVzM1UVFwNjgzUmRLQnlYR2xLSkVu?=
 =?utf-8?B?eTRTTGJib0phRndhaTZaRWxqaG5BekUyY09mOWVpMEFmWnczb0VIV1NpYitk?=
 =?utf-8?B?a1JmaE9OaFNvZWxJZHR1UEU3QWlWQ0dpUGxYNkZxVC83bEVRcW45Z1Q1RXIz?=
 =?utf-8?B?Mkw0K2c2Tk85M2RrOUhGek1YaHhET3lXVkE0YjBmdmFIWnlaMWdEamxXdmxi?=
 =?utf-8?B?RkN2QWRmeC9lS3RtbjRoTVhjOEpNUkdVV1lLN25FMCtJSkY2S1B1TXo1d1Na?=
 =?utf-8?B?Ni9WQ2YxdWkwUUNvcUxFZ2QvTlpxQTRQc083N2FqYU5MekdzY3JtMWg5d21S?=
 =?utf-8?B?TUVxSDRFdW4zNjFUeVU2VUhyS0J5S2dFWktLU2Y2amNUTzB3TkZ1QnZMYWJv?=
 =?utf-8?B?ZVpBZzA1SmVhdmRHNnZFVXg5bUhMa2tGWGc1eXpoZkQzT2dUMXlncHgvZlhp?=
 =?utf-8?B?U1dveVVuZUJOaDRRbGZoT29tWGg3bkoyajhvSW9JTVR6OEIwczdiQVY1R3Fw?=
 =?utf-8?B?RVM0aHlaNWx1dUYycFJUemVIUjgrSXB4TVRsY2YzdmhGdWloR25KcmovQzJm?=
 =?utf-8?B?ckNvQnR3cjc2Y2hxUjRWV00yb1IvVHlPQU9laENFNGVhTVcveWxaR2I0Qmg5?=
 =?utf-8?B?U3VkMDQ1d3RMOUZsMmdNUjVJZW1vWnFaZEV0dVM1MG5UY0J3TmRlRCtoei9H?=
 =?utf-8?B?MWJVcUFKc1dsZGltUmdJTzhvYlMwdzNDU1YrNHF2QUhKTlNUWm5rM1pjZysz?=
 =?utf-8?Q?nnWwos3U1e4Ts?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnBDZGtKcHJuSDI5M3VZUWxGQ3U0Q1Z1b1ZpWUFFd1oxU281SXRmWmRrQ3VL?=
 =?utf-8?B?V1p4WVdtNWtzUkp1SkF2VUxyNm1VYzkrcnUzWXNlMzV2eWMyWnJrWmtiNTc0?=
 =?utf-8?B?d0d5WlpZb2YrRDdWbDVBRDhXTURxVDk1M056REN0WkVYbEdJcnczdE1WOFFD?=
 =?utf-8?B?Ukh0STFPbWM1dE50UXB3NmlrV0c1cVRiL3lpME9zT1kvQ3NFeFI2dUowNWVZ?=
 =?utf-8?B?MzJlQk45cmRtVFk3TVhDeHgrMlhqdU8wNzN5cjBYcWlwWkN2WFdPZGVyMUFI?=
 =?utf-8?B?VVd6WUF3MmpJQ2l0WkY3SDdJREtJREFVZFV3SVZpVFJOSVNES0tIemk4UWpF?=
 =?utf-8?B?R1FoOHBXamJkdlRBVDlFYk5sd0VIUTRqQUxmaFlKMWtSenRQSWhaWTYvcmFr?=
 =?utf-8?B?RkRPbUF3UFBDY2YrNGNCc0RGSTArNlZVdTBwaTdTbVk0N21EdlNGdUNFYkhZ?=
 =?utf-8?B?aFpUWjJLZE02d0VsYTJveHhMTnhnalZtV2o5cWZqeEs2aTd6NGdiVzdydE1q?=
 =?utf-8?B?aTNHdFdaTG5xWE1lK0cybWhLMlU0MHl6WmhkU3RKSjQ0dzNGQnBvK0cxSzAr?=
 =?utf-8?B?Z0pXakZmYTdQWVhSQWo5bmpPOHV3NTN0Y2FLU25jUnF6UitZSDVYK2hYL0NL?=
 =?utf-8?B?eTZWM2tkL3FXQ1VLRVRTUU4xZjR3ZGFCbldkbEllRC82L0o4cUJwVitXN0lk?=
 =?utf-8?B?eFNKblNVV1E4alZva2dIcEJpOTY2QlF2blZraVZoSWFhNmlyam43QXpMSEMv?=
 =?utf-8?B?amRXYmVIakVoRDQ5K2poRlNVajN1QWxuenFxTTZhWnE0bHlZSk51VGRpcG4x?=
 =?utf-8?B?NlpyLzFSVTVDdWNoUmNxUkdSNENCbE45MmNKcUFWWUZySTNhVlZUUTFnQTRF?=
 =?utf-8?B?NFUxQ2VXSTJHa0JSZHBKOHRwSU9KdGNZMitaUFhrVVlSWXpIQk9xTEhmQ1VH?=
 =?utf-8?B?NHdnK1liNG1UWDd1ZTYvd2tZMUhEL3ZuQTh1cExGN2RyOC9vQ3JsdDNZQTU1?=
 =?utf-8?B?SWRBV3hnS1RDTllSK3VDTUNMVkVGb3RDSEVnUjVTdmllanp1a1lUdjJNSXlJ?=
 =?utf-8?B?ZS9WNjRSa3ZjMTdUbURsVUNSY0lQWnJGamRZTTVHbHRBbHdDbmVtSkhJRlV6?=
 =?utf-8?B?SEE5MHlOYjNjbmVYUS9RLzNSbTdPZ3R1VWduV1F4STVxL1BNWWMyUFJpSXRk?=
 =?utf-8?B?V1gzeUxLRVE3a08vNTZCNTVaUWs5bC92U3lreVhVSENGbHR4YnR5aVhRZktE?=
 =?utf-8?B?QU9pdzdkbXEvZENiaEpFdlpCajVVeGdqZGVRR2E1Q28vZGFKWHZETXVHcm1O?=
 =?utf-8?B?Yzl0dFlLdU5aRkdhb0xGZkhaS1c0cGtoSG9tbHpITEhuMDRsK0IwNWRCMEsx?=
 =?utf-8?B?VGZwbVUwL1JOcGMyWWRZeG8xZUpCRUljN2kxazFZMFgyQXdOMUZzTkZUbHhH?=
 =?utf-8?B?eTBLT2NzU1JMNGdXQnFtdjg5d2tMSC9Fem05RTNudGwzMUlVcm43TFh1YktD?=
 =?utf-8?B?SlVXN0R0U0YwTjFVcDc5VUlrUkszSmVmQ2lvSUtkUjlaZkJjeTdWbFp2aGYz?=
 =?utf-8?B?WW90Q1Rnc2ZEcWx0d3ZSZllucFZyVnNOclVYRXBtTmI5MTJxZzc4UW5rVDFO?=
 =?utf-8?B?YktjeERIcnl0NWo3djZCWElHTTFpcE9KazhpWlQ2ZjFVWHpkQlp0WHYwbE43?=
 =?utf-8?B?aXh2aUtFWGNGb21QVkJRQmQvSUVOMkNRdW5UY1JSWVd6NjVGNlpOMnJhT0lN?=
 =?utf-8?B?b0Q0QVRRTWNJUWpRM0lFYitJcUZ3ZitHOUJzNTllZ01rZ0ttSENjYnNVZ2Mr?=
 =?utf-8?B?THZmU1pkUUQ3bHE2eU94YlBRbWdsTHhJd3RGTzJDL0dlOUQrUU56c2FvYTNr?=
 =?utf-8?B?b0lvMGJiMlZvYVNhc1VROFpLbHp4QUNHRldjM3NnMjVnV1B6MGVvd2JDUWkw?=
 =?utf-8?B?dzNUZ3cvRU1nbExISE4rRmdIdXAzRGFOUDBwdlRkSlFwVlVBNVFPK291YkM2?=
 =?utf-8?B?WlNqZHc0ejc2YmM5V1NSVm1VK2NLR2Rqc0lnU3V2WDZDSHpPclF1cWI5SUxS?=
 =?utf-8?B?bGhsZm9JYkY0NjFsQUZ4Y28wZjZ3TGpRa3d2emRtcURhVS85VytvZUIrcGY0?=
 =?utf-8?Q?9vXvqSTizVwRZiK2pRu85DTSK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 869a9af6-a286-48b1-0d36-08dd784ed7cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 16:43:38.2475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 91Sp90KrcAC9N/ZdsgUWlkjW0N7N7tU9DbDGWd/ycaJFmpKnsEUiLgQ5hBpzNdon
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6552
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

Hi Boris,

Am 10.04.25 um 17:53 schrieb Boris Brezillon:
> Hi Christian,
>
> On Thu, 10 Apr 2025 17:05:07 +0200
> Christian König <christian.koenig@amd.com> wrote:
>
>> Hi Boris,
>>
>> thanks for looping me in. Can you also send the full patch set to me since I don't see that on the mailing list (yet maybe).
>>
>> Am 10.04.25 um 16:48 schrieb Boris Brezillon:
>>> +Christian, Alyssa and Faith, as suggested by Sima. I'll make sure to
>>> Cc you on v4, but before that, I'd like to get your opinion on the
>>> drm-gem/drm-gem-shmem changes to see if sending a v4 is actually
>>> desirable or if I should go back to the drawing board.
>>>
>>> On Fri,  4 Apr 2025 11:26:26 +0200
>>> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>>>  
>>>> This patch series is a proposal for implementing sparse page allocations
>>>> for shmem objects. It was initially motivated by a kind of BO managed by
>>>> the Panfrost/Panthor and Lima drivers, the tiler heap, which grows on
>>>> demand every time the GPU faults on a virtual address within the heap BO
>>>> range.  
>> Oh, wait a second! GPU faults and DMA fences are usually fundamentally incompatible.
>>
>> So stuff like filling in GEM objects on demand like you suggest here is usually seen as illegal. All resources must be pre-pinned before the submission.
> Unfortunately, that's already how it's done in lima, panfrost and
> panthor.
>
>> Faulting is only legal when you have something like HMM, SVM or whatever you call it. And then you can just use a plain shmem object to provide you with backing pages.
>>
>> I mean we could in theory allow faulting on GEM objects as well, but we would need to take very strict precautions on that we currently don't have as far as I know.
> We only use this mechanism for very specific allocations: tiler memory
> whose maximum size can't be guessed upfront because tile binning is by
> nature unpredictible.
>
>> So could you explain how this works in the first place?
> I can explain you how this works in Panthor, yes. You get an initial
> amount of memory that the tiler can use, when it runs out of memory, it
> will first ask the system for more memory, if the allocation fails, it
> will fallback to what they call "incremental rendering", where the
> already binned primitives are flushed to the FB in order to free memory,
> and the rendering starts over from there, with the memory that has been
> freed.
>
> In Panthor, this on-demand allocation scheme is something that allows
> us to speed-up rendering when there's memory available, but we can make
> progress when that's not the case, hence the failable allocation scheme
> I'm proposing here.

Puh, that sounds like it can potentially work but is also very very fragile.

You must have a code comment when you select the GFP flags how and why that works.

> In Panfrost and Lima, we don't have this concept of "incremental
> rendering", so when we fail the allocation, we just fail the GPU job
> with an unhandled GPU fault.

To be honest I think that this is enough to mark those two drivers as broken.  It's documented that this approach is a no-go for upstream drivers.

How widely is that used?

> And that's how it is today, the
> alloc-on-fault mechanism is being used in at least 3 drivers, and all
> I'm trying to do here is standardize it and try to document the
> constraints that comes with this model, constraint that are currently
> being ignored. Like the fact allocations in the fault handler path
> shouldn't block so we're guaranteed to signal the job fence in finite
> time, and we don't risk a deadlock between the driver shrinker and the
> job triggering the fault.

Well on one hand it's good to that we document the pitfalls, but I clearly think that we should *not* spread that into common code.

That would give the impression that this actually works and to be honest I should start to charge money to rejecting stuff like that. It would probably get me rich.

> I'm well aware of the implications of what I'm proposing here, but
> ignoring the fact some drivers already violate the rules don't make them
> disappear. So I'd rather work with you and others to clearly state what
> the alloc-in-fault-path rules are, and enforce them in some helper
> functions, than pretend these ugly things don't exist. :D

Yeah, but this kind of says to others it's ok to do this which clearly isn't as far as I can see.

What we should do instead is to add this as not ok approaches to the documentation and move on.

Regards,
Christian.

>
> Regards,
>
> Boris

