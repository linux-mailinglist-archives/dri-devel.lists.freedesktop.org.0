Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C307C5252B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 13:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76C810E0B6;
	Wed, 12 Nov 2025 12:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Z7AprRyt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013048.outbound.protection.outlook.com
 [40.93.201.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8646E10E0B6;
 Wed, 12 Nov 2025 12:50:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9rmdnYL/uXeWFMlExwySTgw6eNKPY5cqZgKn3g94vdButQzTLR8s5cJI9QU65KoTbV8o9TxJXY6lDqfICjdlQcnR6GTwZeFznhn8WAWkbpHaD+MonFAsLS0qJJQElC7BbGQs31TGO3bu/Ooqq6+F8OelutO6fxlsEn6aMV9nELwJN2PWlfVmNka9P5oWVGEo7ZLtMCYRzGIjTJaIuROhwoUplKAG+/PJg515hDqAgE+0b+H3kieYZ+zUIL5JeQx+ZNj73vEd1wXArPVN/b0/jyVxqX9+BX0j58Ou4DrKcnROMnTk6Llrxx6hm1NGyL1GUmfEnG5g6aJ0gqIPSQuRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pcK81sDiySzeK/tuQgk0eeeSiODaCg7Fico8bmbIJA=;
 b=WmDBdJw03i1tmeJko7f2qFcg4wwV3zvwhZdcoBu5+3pWi7yx6gr13OARZhMaQ5BUmj/0wHAlEU6pG81i/NcrUtNwAJ+9JeRNUfoK+mG5X8p4eDX74z/ML/RI7ot6uFhxk17BO8fO2DLd/zeqUxmmHVMW3TflwKrTwCbeZhdN1Zxt5H6pW2uRNC2tYyQVlus7cDbihgKKhN+ETavi5M7M7N0JvK5Aeqx9B9dw1ufLL+vG2fF+6CekTygC5zMLd/W2kqWptM/uEgvKEO6RZu9r/5MttzLxIZqH22yMwL3kspMtG2u62yOIUhHDSWcgCstYnCjOstuqnrAvMyIWqyUfPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pcK81sDiySzeK/tuQgk0eeeSiODaCg7Fico8bmbIJA=;
 b=Z7AprRytn5BALucJdkZBqWGMbw2WqCTi5iS89BJQ5rFGzeGeKWcaOBMPQtQIp+b5hm5DbVw9qnK77yXxngLkbQNStPZRwAblK0Xz4cu+1LIYfUkoPWtmcStaWBIlFbItCoo7j1KqyASH4F2AXTCz1ueuH205dBwUG7GkDNiZsT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB9042.namprd12.prod.outlook.com (2603:10b6:8:ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 12:50:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 12:50:44 +0000
Message-ID: <5488f98e-4101-42c1-a0ff-0e0054e0e08c@amd.com>
Date: Wed, 12 Nov 2025 13:50:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] drm/amdkfd: Add batch SVM range registration
 support
To: "Honglei1.Huang@amd.com" <honghuan@amd.com>
Cc: Felix.Kuehling@amd.com, alexander.deucher@amd.com, Ray.Huang@amd.com,
 dmitry.osipenko@collabora.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 Honglei Huang <honglei1.huang@amd.com>
References: <20251112072910.3716944-1-honglei1.huang@amd.com>
 <32a918b6-37bc-4d83-ae72-35010d4f1a8d@amd.com>
 <03b8be5c-64e0-4577-b4f0-0d505eff04bf@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <03b8be5c-64e0-4577-b4f0-0d505eff04bf@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB9042:EE_
X-MS-Office365-Filtering-Correlation-Id: b3114d91-f2e6-42f6-13b9-08de21ea1829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWZsRmhlc2F3VXZTcXJxMmg2ejFud0xweFpDN3lBUVFzRG1HeVJIejJPUnk5?=
 =?utf-8?B?bU1mOFNJUDNIS00ydnh2eTVqcFZwbFU1ZjFRWnl6dXVLTjZGTndxamcrZHJu?=
 =?utf-8?B?ZXJZYnMycHNKZ1FRU2I5bWJHREQ3R2dFSmtpeTZsV2hXOW5MaFlySnpaOTJE?=
 =?utf-8?B?Q3hnR1VYcERiVHpocXV4ZklTQ3B6eUFVczVjT0NsTkZReGt6VmpQb0VRQUEr?=
 =?utf-8?B?NDlNQmlXT1RGdnhkRGZkTVRmMDVaZXhjbnpCL281Q2lMWjZtd2xvWTQycUF3?=
 =?utf-8?B?T3ZhalpPbkdKbEYrUWdPc3p3Z25KQU0wTEs3Yi9CaUFQNkJZNE1leVNyTEN4?=
 =?utf-8?B?dlJIaG1RYk1paUc2d2tDUzFjS21JNXZrcUJFSzY0TDZQUUUrUkRVcysrZWh6?=
 =?utf-8?B?bit2TzZjMmFLdVVPWkpOU3BLelRKU05lUUtIQUcxWmdEZWNQUk4yanI1RFpu?=
 =?utf-8?B?ZUQ5TEhkeEVKZ2c4RXVBSTNBOXRHWDJ5dXpheDVWR2Z4U244VHQ0emdCeUlj?=
 =?utf-8?B?VlIwU3ViTDJ6Wnc4WEhGZlZpMWZZWE9ITmRIWFdUYXZKQkxoZkZtVWFKdjA4?=
 =?utf-8?B?aCt0Y1BzdklnQ3BabWJ4OHk5d011b1l5Tk1STGUyS1RLZnJxZWV6Yk5yOXRY?=
 =?utf-8?B?MnVBdXgvSnRsd25pbFAweGVKUlB1cGM0dmpadUdBMDNpcHFHaGo2aThxWDBW?=
 =?utf-8?B?MDhUdXN6TE1PdDF5R0xGNi9rVGgyUjI1WVBKMktOcnA4bGNMdUR5ZUFMYVp5?=
 =?utf-8?B?a2MzamFSeEpSNU9YaFJlV3Y4K3JHejZZc1dTZllueTRRS01FRFJGQmdjc3Y5?=
 =?utf-8?B?Nnc3SHBuRytvWjd0elNBYTFWZk1yYkFUaXZJZnNUb1phYnV1cWhETDFPZWcv?=
 =?utf-8?B?UStMOEFNQzlpSXZkY3FYWU5kOGFvWWRVa1RqTzNpRnNDZGRFTlh0d1cvcThT?=
 =?utf-8?B?S1huS2dUeUNQR3ovZjhVS3MvU2FvZVIyUG9PejRYTGRNdGQ4U3J3TjZJd0Vw?=
 =?utf-8?B?ZDAyVmRxYjN1dlVCZHlWU1dqSDNSRm5uVmEvbFJldXhaTTZoeTF2d0toMktL?=
 =?utf-8?B?M0UzdGZVZDRrd1dYendmUlhnZ1RPTEJnVUJDSnprOHNkTjBHOEVrWVppN3VE?=
 =?utf-8?B?NjJEUFZXTWhGMHpOaDBkdGV2NlF0dlZKZlVRYzg0aEUrOCtrczMrUnlid1Vp?=
 =?utf-8?B?dGE5TGM5U2tySzR3ODFYazE0Q2diV1k2bzhLN0dmcWFaUlJhS2t6a1MxZEJI?=
 =?utf-8?B?YllMc3dXRmI0V1RZRGVXeGVENVJyVFZNeDE0ek5XeFRJWUJGbjdpb045YlhV?=
 =?utf-8?B?a3EvNWo4ZTROVTdhWkJzOTd1L2tYeDRMN2J3blo0UDVIU0pvV2RES0RHS3pz?=
 =?utf-8?B?c2xYNThMTUhsMzRYa1ljQnBpb0s2QUFnVWJFbjFtcDZVeEYwSnNVTFZUbXpm?=
 =?utf-8?B?STdwb2lVRVlkV1N5MktHNjkrZVRDMEZKU044dG1SVldXSlhyUUwyTE14UmtE?=
 =?utf-8?B?R1crb3VGS3I5QTlueFlZK1ltYWdPd01ZaGJhT2hVc1UvVTROQzkvb1UvaitM?=
 =?utf-8?B?Zm1qZSs0YmdqNVlJTks0UzFJd3FTeVcvOGpWbWoxMXczSnBoUFpCbnZMNURq?=
 =?utf-8?B?NWhhSTVxek5nTFgzMUYxNXJIUnNjV3crOEpqb0JUNFByOVk3Zlh3R1dUaGFw?=
 =?utf-8?B?ZzhEUzRjTnp1Q21GQ3crNjBFVVh0OVIwMkNGb0IvZk1rRmpiTkUwRDN4RkN1?=
 =?utf-8?B?UysyZG9XaU9NNHhGbUN2NmQwbE93Qi9zZE14SlBuc1kxWWxNSWtlUGhtalhv?=
 =?utf-8?B?NE1kaHRRUUdaU2FsYVNseEZ6VFdRR1A5N1kyck5MNXU2N3BWN3MvZi9SWVBh?=
 =?utf-8?B?REhpT3o3N2tJR1dlcE9lQTUyK0pYTVd1eHhFOHZ0RjhrRlRNVnp5NlIxbW1V?=
 =?utf-8?B?OFYwclVWVW9LeERKM1Ezb2g5NEJCQXA2WXdjTm5ETWR2QngwNnBwTG9TL1Fp?=
 =?utf-8?B?aW1rUUQ5RnRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXMwbVVGQk1iZUhJdytmZjVLUzVaemMwTloreUR4WjhlYWRSR2gwc3FFLzRo?=
 =?utf-8?B?ZDZwNlNVeVVMbzJlTnMvSFdFNmhyYitNVlhWOTlnLzB4dTFpZVl1aDZNdUZ0?=
 =?utf-8?B?SlU5ZHlWemR2aFFzekR5bUcvRldlUWxwWkRhaFVneUNtSjBidVJkNXVWcXJn?=
 =?utf-8?B?SGNaNzdvUFh3eHpOOXdySmU4M1kyQ0lhV0dxbkF1N1NnTWFEVUROb1RWTFVL?=
 =?utf-8?B?WDltUHd5ZlV1Y2lPZ1poSUhHWit6Y2FWcUlJMzM1OGgxdC9MODErWWdvVzdq?=
 =?utf-8?B?Qlp2eXcvSjBFRERwRUVTU0dTUEt4NURaaDArblZsZXREUjR0UWl5RTNtOE1n?=
 =?utf-8?B?TFRYMTdhTlVLUnJ6YnNNeVl0UXkxSldUU3hWWllNc09KZkR6cGVkQXlsRTJY?=
 =?utf-8?B?MXdpQi9pT3QwS1hYUnpvQ2l6dU04Z1lJelB6Mk55c1ZYS0h6L2orRWlES0ZE?=
 =?utf-8?B?Y3BFZXUxM3lwbnI1N3I0WG5HWkNnTkJONWdyaldZNkhEQWFtd3I0eWJPbG84?=
 =?utf-8?B?Y0JHaEJvc0RKb3RoSUpOZDlIVXZPM0tyYzFMQXAvM1pwQWtXMlcxeWNhTTN2?=
 =?utf-8?B?ZjNtRExZc0ZIZlJFdHJaMHovSVhMQkduSWNMSlVjTU00YUR6MUordmJUMU02?=
 =?utf-8?B?VHM2N1gwL2UvQ1YrQmlWbndNSHJ4UDRWZVRqd1NoWkZMSlVLQmpabHovamIx?=
 =?utf-8?B?ejN2MU5GbDdlaURhcEtIMS9mMUpiZVBWcmdOcTlGZElBYTExQmx2SHpDd2xS?=
 =?utf-8?B?Szc2NDRRNEplQUg5MndvOVM4bUhkQ3hQN0dvQStwVEZlQllEZFdvQ2ZGazNn?=
 =?utf-8?B?QW9XMkxiUDZEcU9FVzhSWG84NVFJTmROZmVIc2duNDZISktRSGdVb1VKRHZo?=
 =?utf-8?B?aXRDUzJJeHpuQTA3YjhYRFNxbHRVR1BqdWZCQnZuR3Vzdk50LzdjNkI3KzBO?=
 =?utf-8?B?Z05RUUZ4NUNwbmJ4dmtjS2w2YTUzZ1gvaE51YXFITnFWM29abG9rTi85WTV3?=
 =?utf-8?B?dm03WFJsdjF1bGlKVmd5VzllTnlxS0tGbXBIVE93ZmpWTldpM2tWZlB2blNW?=
 =?utf-8?B?SkhtZTFoM2MwdnpQalVDa0J0QzRrdUZicXNuRFhrcU9hblBhZU1QOU9zMVdR?=
 =?utf-8?B?dEw1VDRHcmprVUdiV1daQjZBZExEcnRpTWMxbEZjVGJZeEdnSGtjOUJhTE9v?=
 =?utf-8?B?SksxVGdPQmtQR2ZiWktCbGdGZE1kQWNaUC96ckU3N21FSEZsSHVEc29yREJq?=
 =?utf-8?B?Vlpla1Z3TklONVFRVERSYXk1WEFaU2d0ekNVQSsrVnYvSGJoRDA2NUtRQUdG?=
 =?utf-8?B?SThaY1dNK29UNStINElqOCsrckZSUlNiUUg3eTZMYzA4VHdpUEtDVjMycURP?=
 =?utf-8?B?YmZ0aGZMdDhFelNTKzhJZDhHMXJNNTJPRnBVR1RxS3U5YUpkVURCYktnNWV2?=
 =?utf-8?B?dytNU2dGS053RW1tTHp1YXNrKzZNWUY5cFlCSWtNSmkrbUFiUGlHZzg2NW1K?=
 =?utf-8?B?ZzhwMWVpbTQ1clFZN0xBTEJROTdJcnlUV3RQSFVxaXF0SlJoa1F5UkJkK3ln?=
 =?utf-8?B?U2lxbytmTHBvVzA1ZFZWQ0NaYVVHY0JZSnpxMnBFRkdWRE14R2V2ZU5rMTFB?=
 =?utf-8?B?S2laNDJXUEdMK1Z2b1NkRk14OXlVTUNvaFF2TXR1Qmt1WWprRm4weXc3MGpN?=
 =?utf-8?B?NERQZTdQUEhVT1FHVWNhQlVaTG5CRUU3SmNsdUF0TkVvdnpoVUYyMGhJM3hu?=
 =?utf-8?B?S3VyTnNpbzMrREo0YTdLRHNPUEU1MCs0MEJtajlzRmhZbWoyK0szYmxWNXgz?=
 =?utf-8?B?M1RKRnVTWGYzdWVuMFRKZ0ZZbnBKVXNDcWZoZW9JVHNxSE9nbzNKUHkzUm1m?=
 =?utf-8?B?NjZWQkQxeGI0QUJmdlJicjluSGN0Zzc4NjRaSC82Z3RDQXBsSEpjMm5FRy9w?=
 =?utf-8?B?WFNub0RsNFdrOUUwYmdMSGN4cGZRZmJWbThJREN2cGhrTlBxMFY0akRrcUta?=
 =?utf-8?B?bnhQS2d3RlVrS09BczlQRHY4SGRLb1RLTWpqOWtVeHlWbFFQR2dYTWJhU0FV?=
 =?utf-8?B?dEx0eithUTU5a1hUalljeVBDMkZlNkdlOG56L1k5YWFOakxNa0xzWU9iVHBS?=
 =?utf-8?Q?CBC6LL8jGzVbTA9Nnw8FpInnI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3114d91-f2e6-42f6-13b9-08de21ea1829
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 12:50:44.7099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+/1A83palQGbDfl5KpWCErfR5+NCX4nNzfyxw30wJgdqBhMrCKFIuQZ6h6ag/4R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9042
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

Hi Honglei,

On 11/12/25 13:10, Honglei1.Huang@amd.com wrote:
>>> Paravirtualized environments exacerbate this issue, as KVM's memory backing
>>> is often non-contiguous at the host level. In virtualized environments, guest
>>> physical memory appears contiguous to the VM but is actually scattered across
>>> host memory pages. This fragmentation means that what appears as a single
>>> large allocation in the guest may require multiple discrete SVM registrations
>>> to properly handle the underlying host memory layout, further multiplying the
>>> number of required ioctl calls.
>> SVM with dynamic migration under KVM is most likely a dead end to begin with.
>>
>> The only possibility to implement it is with memory pinning which is basically userptr.
>>
>> Or a rather slow client side IOMMU emulation to catch concurrent DMA transfers to get the necessary information onto the host side.
>>
>> Intel calls this approach colIOMMU: https://www.usenix.org/system/files/atc20-paper236-slides-tian.pdf
>>
> 
> This is very helpful context.Your confirmation that memory pinning (userptr-style) is the practical approach helps me understand that what I initially saw as a "workaround" is actually the intended solution for this use case.

Well "intended" is maybe not the right term, I would rather say "possible" with the current SW/HW stack design in virtualization.

In general fault based SVM/HMM would still be nice to have even under virtualization environment, it's just simply not really feasible at the moment.

> For colIOMMU, I'll study it to better understand the alternatives and their trade-offs.

I haven't looked into it in detail either. It's mostly developed with the pass-through use case in mind, but avoiding pinning memory on the host side which is one of many per-requisites to have some HMM based migration working as well.

...>>> Why Submit This RFC?
>>> ====================
>>>
>>> Despite the limitations above, I am submitting this series to:
>>>
>>> 1. **Start the Discussion**: I want community feedback on whether batch
>>>     registration is a useful feature worth pursuing.
>>>
>>> 2. **Explore Better Alternatives**: Is there a way to achieve batch
>>>     registration without pinning? Could I extend HMM to better support
>>>     this use case?
>>
>> There is an ongoing unification project between KFD and KGD, we are currently looking into the SVM part on a weekly basis.
>>
>> Saying that we probably need a really good justification to add new features to the KFD interfaces cause this is going to delay the unification.
>>
>> Regards,
>> Christian.
> 
> Thank you for sharing this critical information. Is there a public discussion forum or mailing list for the KFD/KGD unification where I could follow progress and understand the design direction?

Alex is driving this. No mailing list, but IIRC Alex has organized a lot of topics on some confluence page, but I can't find it of hand.

> Regarding the use case justification: I need to be honest here - the
> primary driver for this feature is indeed KVM/virtualized environments.
> The scattered allocation problem exists in native environments too, but
> the overhead is tolerable there. However, I do want to raise one consideration for the unified interface design:
> 
> GPU computing in virtualized/cloud environments is growing rapidly, major cloud providers (AWS, Azure) now offer GPU instances ROCm in containers/VMs is becoming more common.So while my current use case is specific to KVM, the virtualized GPU workload pattern may become more prevalent.
> 
> So during the unified interface design, please keep the door open for batch-style operations if they don't complicate the core design.

Oh, yes! That's definitely valuable information to have and a more or less a new requirement for the SVM userspace API.

I already expected that we sooner or later run into such things, but having it definitely confirmed is really good to have.

Regards,
Christian.

> 
> I really appreciate your time and guidance on this.
> 
> Regards,
> Honglei
> 
> 
> 
>>
>>>
>>> 3. **Understand Trade-offs**: For some workloads, the performance benefit
>>>     of batch registration might outweigh the drawbacks of pinning. I'd
>>>     like to understand where the balance lies.
>>>
>>> Questions for the Community
>>> ============================
>>>
>>> 1. Are there existing mechanisms in HMM or mm that could support batch
>>>     operations without pinning?
>>>
>>> 2. Would a different approach (e.g., async registration, delayed validation)
>>>     be more acceptable?
>>>
>>> Alternative Approaches Considered
>>> ==================================
>>>
>>> I've considered several alternatives:
>>>
>>> A) **Pure HMM approach**: Register ranges without pinning, rely entirely on
>>>
>>> B) **Userspace batching library**: Hide multiple ioctls behind a library.
>>>
>>> Patch Series Overview
>>> =====================
>>>
>>> Patch 1: Add KFD_IOCTL_SVM_ATTR_MAPPED attribute type
>>> Patch 2: Define data structures for batch SVM range registration
>>> Patch 3: Add new AMDKFD_IOC_SVM_RANGES ioctl command
>>> Patch 4: Implement page pinning mechanism for scattered ranges
>>> Patch 5: Wire up the ioctl handler and attribute processing
>>>
>>> Testing
>>> =======
>>>
>>> The series has been tested with:
>>> - Multiple scattered malloc() allocations (2-2000+ ranges)
>>> - Various allocation sizes (4KB to 1G+)
>>> - GPU compute workloads using the registered ranges
>>> - Memory pressure scenarios
>>> - OpecnCL CTS in KVM guest environment
>>> - HIP catch tests in KVM guest environment
>>> - Some AI applications like Stable Diffusion, ComfyUI, 3B LLM models based
>>>    on HuggingFace transformers
>>>
>>> I understand this approach is not ideal and are committed to working on a
>>> better solution based on community feedback. This RFC is the starting point
>>> for that discussion.
>>>
>>> Thank you for your time and consideration.
>>>
>>> Best regards,
>>> Honglei Huang
>>>
>>> ---
>>>
>>> Honglei Huang (5):
>>>    drm/amdkfd: Add KFD_IOCTL_SVM_ATTR_MAPPED attribute
>>>    drm/amdkfd: Add SVM ranges data structures
>>>    drm/amdkfd: Add AMDKFD_IOC_SVM_RANGES ioctl command
>>>    drm/amdkfd: Add support for pinned user pages in SVM ranges
>>>    drm/amdkfd: Wire up SVM ranges ioctl handler
>>>
>>>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  67 +++++++++++
>>>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 232 +++++++++++++++++++++++++++++--
>>>   drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   3 +
>>>   include/uapi/linux/kfd_ioctl.h           |  52 +++++++-
>>>   4 files changed, 348 insertions(+), 6 deletions(-)
>>
> 

