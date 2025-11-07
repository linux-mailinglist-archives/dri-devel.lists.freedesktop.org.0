Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A497C3F7BE
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 11:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A6710EA6F;
	Fri,  7 Nov 2025 10:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u14m9wBE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010044.outbound.protection.outlook.com [52.101.56.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D7310EA6D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 10:33:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BR1MzSyhY1v7mTLQAT8+WI22AYNc1DC/rOl7CHCeKTvKzaN22lrOguwIueN2+AKvahb3EGBnC4WhUtGHpByD43khIOkEHAEueF1HjNXcyYpuXgp27D+bF9tINF7Mz4a3LvNh5PKoYklQFir9W0JUoY4PBa+dTChQZZY7NbFzU4i+j4+9dpM5Ni1AZehlznAET7SKrBE+cTdGaE+NJqGG5lLhy/PCJSR6rBWklGGvSaCjsYK52olgKnDrNiKxWMzZVLbtXHi9WNE45rYJjfT3hJM1rKLq/47OBFrfmJD7TX1OmWEH1t1ytI2l1B8GRom6ZY31bjuFqgRX20YJsrddCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqEroYi3wAjd7PENcWaOkHVGiMM7ecrJ2hzWtJXskhE=;
 b=e6zyQrNHmFNNnd4CSxyg4JeteRYZhXQNAsfVHCeslBNQTqIQumtza9ufmi8KfFcw3pJIkc4srB2cLvWBDjDGY2EAExdzPLCmT6Pbii7AhYGYzh2LGQDgABP0E/aQSbxQTR88EGWfNw2ukdqMG/xuzREUpMWoq6pSG+woE5gndf2glAZOFXt9XvZ8y908vpoRLODZFqHiZikL366SzSdHyVX3SU95TlRjvmM7eMANoBbRLuCPJ6SFPzrt8/ld0rUhqovbo2G4MrWivHuEdlXgHSTO+8452TxdZV1X28IIopnisLCHPYrV6f7pp0zB29BiyjLxQNVXH6w9mKCeeaH8Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqEroYi3wAjd7PENcWaOkHVGiMM7ecrJ2hzWtJXskhE=;
 b=u14m9wBEu8ZmInxy1DjsJ881pOW6PlXU1zbeyk5Xjs2CVWb6fkLX8GPi6OuUIZdiOJ5F8aJyFrNT17p/Bq1OD72V/Ac2cWHgF81rJM6xQu/sVEVIJHxCX8CBdyT1mnvTVYPwDUEfGpcnt4N1wjpHtT42kAom1GpQP0SXdH8I9J4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5949.namprd12.prod.outlook.com (2603:10b6:510:1d8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 10:33:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 10:33:54 +0000
Message-ID: <38836d5b-9a98-4752-a5a5-f40bd643601a@amd.com>
Date: Fri, 7 Nov 2025 11:33:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/sched: Limit sched score update to jobs change
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251107090425.23199-1-pierre-eric.pelloux-prayer@amd.com>
 <20251107090425.23199-3-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251107090425.23199-3-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0905.namprd03.prod.outlook.com
 (2603:10b6:408:107::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ab26523-cea0-454c-12c3-08de1de92654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3hpWDBhK0M0VWRLQ21XSCtudDdiZDNPMVNuOHpxblRtSlpEVjd1TVM1Z0Ry?=
 =?utf-8?B?R1pKVjVVRHBaSVZNUG82aVVqSHRMczhXR3BkY3hLNitIcUNOOWwrVWNydkVz?=
 =?utf-8?B?ZG5aK3Y3QzZ4WUwrYlZTZEhZdW5BRkhxS1o0V1hEVStxQjhPaGRrS0I4elB3?=
 =?utf-8?B?MzdDOFRnM0RuaUpsT0hMZFBwWitMdGxDeVBITE92QlhNdCtDcXc5QkVveUx5?=
 =?utf-8?B?NytLOGV3S2FveUF3dzFMMUdTbXF4bEpKWG5neTR4aFNYM3NpQUpQR2kyQVdx?=
 =?utf-8?B?TnJFVnlBVE4yRWw2TzBMdUd5L1FKRHJBcS82VWZDalp4OStSUUVGbDZYdmw3?=
 =?utf-8?B?TTNmTnFKWTVnemdlTkJ3dGFINktNekh3TllYVVQ4SjdWZGNqR2dpVlpsNDJj?=
 =?utf-8?B?OVlIMG9wNjFuNUdJQmdnR25jbW8wVGtKWlQwckZUeUl3bTNHbUc5Sm9QaU8v?=
 =?utf-8?B?YXhLYzRya0w5M043WnhwenZCaTJsMWF0WVNmNm9TbzFreGFtNFArZnlJTmxG?=
 =?utf-8?B?T3c4andRQXRMR0NsSXBJL1JXcWlpeVlybW91MWxGZFJMQjVVTGRVdDZCR2dX?=
 =?utf-8?B?clpkcWFLcXF1Zm85eFV0djNaZTRmcWEvbks5cDhDY3kybEZRMWdXK2FtSVhy?=
 =?utf-8?B?b0lDS2VBcnBWcmhJSkhNamxDNTVLSGM4SmFEVmJGTmpLWHVJd1ZNcGs0TkRD?=
 =?utf-8?B?L3Q2ZHY5VFRRUXNIb3pnL3VNSzRqNlBqZTF0eHJHMmVTbVRnZnVLK1hKRzJB?=
 =?utf-8?B?SHQyZmJFeUxwQUZKUGVsVVQ0ZloxUktod1NQY2Z6Vy9xTEhRQko0WVVhVGhV?=
 =?utf-8?B?UkViUUVCWDNRTTk5UWFLUWQrcDVYQnBqVHVyMjQ2aGJydUlQNEl6QTRZcmNy?=
 =?utf-8?B?MUYwcFlYakJhdDRoV29Cdk1BNXBEWlRYMmhadkVvUHQvVU9xWE5oZGNOb2JF?=
 =?utf-8?B?QllENTZPVUkxUUF4cUV3akcwdDVvVFJxRTZ0bjExOTFoYlR5UkgrMFJmQUZC?=
 =?utf-8?B?U2crRnlSS3lXMHZKcndOcVhCSUp4aEZ4b2xrOGNFSVE4bmlDMGhxWnBXSncr?=
 =?utf-8?B?VE9OLzZuL2VrMlZpNnNjNGJLbGEwNzRYUXh3OWVzQlFHRVl2Y01taHdsM3ZD?=
 =?utf-8?B?Nk5JOEw1a1dqcFBZTitEbjlHYThZZzJwZmJnMnYyYStRbVlHOXNPOUlNYVV2?=
 =?utf-8?B?Q0F5emVEaHZNY3hhTmZKNWJGMklmSk44eTI5TStNUVpHM3RZc3dCVFJmd3JG?=
 =?utf-8?B?NDFXQVRrOUhaV0d1MlBYckxFVWVNaXlZeDcwaHFWTkR6WUlHSkp2U09zU2I3?=
 =?utf-8?B?RlVibUlIYm1zb0hPQWluc01ZeVExYWZnVlNFcTZNays1WXduTVUwUWZvT24y?=
 =?utf-8?B?UWtPTzc3UmVFeDk0bzJnbVZnb3RVdW93eHNDZWxpOXgvaHRoWUZ3NVRVMWhR?=
 =?utf-8?B?b1NhVm1FNzdYelp0TW5sL003alBvRHB0T2R4bzJYV2dLZ3duWnRvaEhnUG5k?=
 =?utf-8?B?UHJULzQvaHJ1M3ZLdlVWMjRUM0Z5VFhXd3lJQkkvUVZvblcyOEtsN2ZCeW81?=
 =?utf-8?B?Ulh5ZHBUTXdQSWdzZDZ1cG1sK01hb3hMSXJrRk9qRHZNQVdQdEMyQzVUR2t6?=
 =?utf-8?B?bFRhNjhNZWc1TzhTTzBVUll6ZjhZWGdXaGhSMS9qZFVrcDI0cDZJd2RCUWRi?=
 =?utf-8?B?VFF0OXRhTW1UdjBaSzdsZDB3eEFYZmxheE93RFB2aGtBcjlLVlpOalB2NTlz?=
 =?utf-8?B?RmlYcm5keU9FMEdTKzdyMVlJZkEwcTRmc080SllSb2ZpYXpKZkREL2NUeVY0?=
 =?utf-8?B?ektPQTRKYnhUNzFhcURUdlhXOUY5Q0ZIQXJ3ZjFRWEFlZ3RVY0xqMlNWckhO?=
 =?utf-8?B?RTh2MWIzRTJTSnFibnpTOUhINFNKcFcvVGgzUVlId3ZwUlVZcTBvZWlpSU5I?=
 =?utf-8?Q?dkHcj+x8nNUl5mXfdQS8M1BPqPYycVh8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDNmZ3E2QUlHWHBZK3lNNUN2R2xXVG8wS1JKSlJWWWFocTFlbU0xQTdOdEQ0?=
 =?utf-8?B?RWxtaVFuVndOLzlTQTlTcUgxZWNYcmR6K1Ewd2RMZVZJN2kxQlVHTUc1ZkFy?=
 =?utf-8?B?WWUvWkloOVVLQmxXckphcWxFUXU2SlV4Q25LSXk3eXpnL042eGI1VUNxOTA2?=
 =?utf-8?B?WHBoaEF2TldIOHNlNXU0d1pMZ0xHNVpwUXJ1YStTRmdjREdWZDZIOEJwODhS?=
 =?utf-8?B?bXE4NDhTRkRhY3B6T3Bhb3F6Z2hkS3pUMVhPOHp1WkhDd0ZRYnlGTThqdi9C?=
 =?utf-8?B?TnpQNFFFVHQvSm82djlkU3dpU2lFcU10MUswaW50elFOb01tTUZiMjBOUmQx?=
 =?utf-8?B?Y1AvdHdMWWJibXcxNkt5SHF3Ti9nNzJOdjRIRUgyZ1I1NHVGNWNLaWFsVVFJ?=
 =?utf-8?B?TXFvcllYZVQrVUdoZHp5cm9zS2J2Q3QySjcrRnR3YXVka21TRzRLQzU2alI3?=
 =?utf-8?B?QWk3aWJuNUdsWDREd1BUSk96MjZvSDJIWE15ck4zQzYzVEZDSEt6YUVRdFJ0?=
 =?utf-8?B?M2Qxamh6b3YyT1pyZDZRNVhxazk3d2xDZXRqQXhBeVhSV0ZUNjlRSmtpWEND?=
 =?utf-8?B?Q2tsNG9tNjdFMWtLbzUrakdTbW9SVGVBZlFmSVM3Y0gxMld6TE5Fb1EyZ2Jj?=
 =?utf-8?B?N1ZneTljQkFoVnpWN2I2S21KUk1Vc0FMM2hvZytiK0pyRERDajljVHFzNmp2?=
 =?utf-8?B?Vm5LMi9RZ21PMktzaDA4b2syQkRBWjZRSmNHeGlnMlRlT3UrR2d6NmNVUDdV?=
 =?utf-8?B?NXRJeExWNE1JeXJ4a3NkdklDRXhlOVRveU5ZbzVqOGgxZ21DajBhaG95cEVH?=
 =?utf-8?B?c2F3NmlqNW5tck1iMERqeUZJZmhPU2xyeVlIQjh5aWdrNERRUjlCeVFPYW5O?=
 =?utf-8?B?dkVpTVczcXRtK01tWmpGSHVicmE3VTFIWDMvSXpYTG4zSGx2WHdtUnNPQ3NJ?=
 =?utf-8?B?RHB4VGpsNEJYM2JhVVhpbERBUDQ3NGtLakpIUzBMNjBZSCtyejhVdkwwK0Ra?=
 =?utf-8?B?Zkw1RnFDSzVyZk56a2J6enBNdytGVGh6cFQ5ejArdTRNeUpxM25SKzkrQk9u?=
 =?utf-8?B?YjJzY2UvM2xmMWl6UkpHTTlyT3VsOVRpaHFWTjA1ZTBNNXFEYTBYSitOeTdn?=
 =?utf-8?B?RUhjUzRmL2VKV09TWnE4NGwxUDNTRFkrNll4bWJPMFNhQmRQVzlJTEluMndL?=
 =?utf-8?B?R0FlQTgwNHFRd1FnNmhDUm5hdWRYcXQyajdxeENFVmRid0Q3dzVnRUkzdU5B?=
 =?utf-8?B?SzY5RVhnUEpGMXdUSFBadHRWMjdkK0c2RWc0b0lGbzJYVzVPQkVoWjBVcEl5?=
 =?utf-8?B?MTI5MFNndXYxbVVYR2lucStOSlEwckRTcFY0anpyK2hGQnQ1aHNrWXhjSUl6?=
 =?utf-8?B?N0RZME9RdVhRSVBXTGRNY0Y4SElVYUdlWno4M0lodVh3dkYwbVNsaHM3NG5w?=
 =?utf-8?B?blNBalp6VGFibzVFeEFGNG81YWZEbER2eGo4Zmt2MW4wYXkyM3BlSEx4UDBM?=
 =?utf-8?B?YWVvK1N1R3JGK09kS1VWZlRZT2F1WFJGeTdORC8wNzhpZWlGU0dmK3A5aldp?=
 =?utf-8?B?UTZYOXJvdmh5YmJ6ZVRSNldxTTV3d05ScDdBaEtjV3FkR3JVR3dQRDMyVmJZ?=
 =?utf-8?B?blduV3psQkRXRGdweVNXaG5WZXF1R2lqejAzRU9WYzN6OWhSZ3I2REpzZnNH?=
 =?utf-8?B?eXVOTkxveEVCd2pLa0N5MHhaN1NSQnh1S2ZGVkwwTFZXWWExK3JNK1AvRTZz?=
 =?utf-8?B?aHY3ZVNLdzYzYlh0dHo2UTFFT1lGU2hLZjRFdG9KRmJScTY0eFQ2RFAyRWlj?=
 =?utf-8?B?NFlycm5xcEQ1a1ZMc1ZobkRpaVNtOStBS2hFdEJmM01ZRWRyWEZVRmpueGRQ?=
 =?utf-8?B?VXJvZTVJUG5nNWNlOHNZUGFaUlZ0WmlWUkZYY1JxK3VKemhkY3dnVWw1MVBD?=
 =?utf-8?B?c1BuY1JhQXpMWGRTMnVVY0taczl2ZlBTcHFiRDhmUWZORW8rcS9jRkZEeEo3?=
 =?utf-8?B?VTFZNldBSm5XNll4Q0p5QjE5S0hSQkk5MGJsK0NNZVdvVzZQdnVhUzRtQUJ0?=
 =?utf-8?B?QTd6QWx6MUE3Q3AzcXBVbXVjcmdyUkV6OGYrbWZEYmJRM2ZHcjhVUDZOYm9C?=
 =?utf-8?Q?pFeUagLVxSd5VyodDYUOngd7m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab26523-cea0-454c-12c3-08de1de92654
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 10:33:54.3199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4/j4qwZl2mxOE9U2/SYUL5ou6ga2oN7sV41i3W+yR2CSBADKfz/hY9JA/O6v4YZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5949
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

On 11/7/25 10:04, Pierre-Eric Pelloux-Prayer wrote:
> Currently, the scheduler score is incremented when a job is pushed to an
> entity and when an entity is attached to the scheduler.
> 
> This leads to some bad scheduling decision where the score value is
> largely made of idle entities.
> 
> For instance, a scenario with 2 schedulers and where 10 entities submit
> a single job, then do nothing, each scheduler will probably end up with
> a score of 5.
> Now, let's imagine 5 userspace apps exit, so their entities will be dropped. In
> the worst case, these apps' entities were all attached to the same
> scheduler and we end up with score=5 (the 5 remaining entities) and
> score=0, despite the 2 schedulers being idle.
> When new entities show up, they will all select the second scheduler
> based on its low score value, instead of alternating between the 2.
> 
> Some amdgpu rings depended on this feature, but the previous commit
> implemented the same thing in amdgpu directly so it can be safely
> removed from drm/sched.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Acked-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> Acked-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index c39f0245e3a9..8a3d99a86090 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -206,7 +206,6 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>  	if (!list_empty(&entity->list))
>  		return;
>  
> -	atomic_inc(rq->sched->score);
>  	list_add_tail(&entity->list, &rq->entities);
>  }
>  
> @@ -228,7 +227,6 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>  
>  	spin_lock(&rq->lock);
>  
> -	atomic_dec(rq->sched->score);
>  	list_del_init(&entity->list);
>  
>  	if (rq->current_entity == entity)

