Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2528C7A701
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120C410E8AD;
	Fri, 21 Nov 2025 15:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UZPNlLI0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011056.outbound.protection.outlook.com [52.101.52.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9DE10E8A8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:13:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hg/Y6U3KYQMwilgR9E6te+341fSlaAWdfynAmCdqyKwNOsEM348H7tnFRCIKFrQ32gD1kWyIQ7E4rGeXSWdEaZhGjh7DIkVTWKdXVDYR5IznAWPAaOfRnqJZVS6TS0slMx6nZa/8MLV502L6unGL54+JDDgMw91t1cMLmWo0L/6YghfLd3AWGX9rozxHf0kRMLYzzRi8OgUvtcjlqsKUtaVcIVCPlYpZpPfrHkrKy2XedTLUvSwsHbe727chvT+q6CJouteH6PdE3ffMk+N/V0IH8n/6CUmUPGxj1awIo9q71Ln7HX8A9ADQltUd6cwgv2KEFVgdLP0Z37Sv7BFarw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCkFtK7ProeNUQJtZxxec4UsRJpnBLxRIYFS2x/rH4w=;
 b=k/j2/ud9Bp/RxxFOzbri3uFLf8nt+jQCFyzJudijndswTrVvJwJgWtizr/Ttiw/FFknf9QPvT0TuklicSD439gHbbGXssQ5/dnwZ4ppOUK0+rRI5KWIVsbwBLYgrrV5z0RvlUKsxrOdSm7kp0pc7Tm6CtlqYCyVl15elw7HYJb7t4kJWJTFdzXE488XAZgyDRdhrv+xiL7vIqrJDge1sfXEYGYML6W3JeyODCYYMNsnwCC43zc06k1+UthQbQxmTiDe4Ydy0aKXAhIiABa9HHi51UfIOCBg5qiKE6yDurTfwVNnQ7v7Zn0UViQMgJpVg6NXMfpoc41yShL/uMHZU4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCkFtK7ProeNUQJtZxxec4UsRJpnBLxRIYFS2x/rH4w=;
 b=UZPNlLI0OgfOYUicbtlBI+b8GiXDL2AdSnpaZeajjpwXe8trbIl2ZZO0RIQTagFEVn8fCdrEfY+G24vo3U+VzMhc/T1jprIFmu0NdGx3598vaTsg9ecOe1DfOSUg99U4IYvEClZZagjKp5Up/0HRSP9OiOevPX15KHqR8uwRmI0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9357.namprd12.prod.outlook.com (2603:10b6:408:1ff::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 15:12:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 15:12:56 +0000
Message-ID: <414584f0-3fdb-41e2-aa26-3776dc514184@amd.com>
Date: Fri, 21 Nov 2025 16:12:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/28] drm/ttm: rework pipelined eviction fence handling
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-20-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-20-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0225.apcprd06.prod.outlook.com
 (2603:1096:4:68::33) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9357:EE_
X-MS-Office365-Filtering-Correlation-Id: fe42c08f-075e-4eae-f495-08de2910732e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3BVbTNTbnBZaWNyUVNOUm5mN1p0ZDE4Y3YwVHVtM0FZNmQwMEd0OWkzajJO?=
 =?utf-8?B?UUw1MHN2eUtqYTltWG5NTXdOZUxvdktmdUx4NnVPMlc1cUk2L2JMTzhZM1o1?=
 =?utf-8?B?VWxqUTY3TENwWCtmT0lWY1F1OTlqVWRkVHB4TG9Temh2VmpwK0luNVVTNFA1?=
 =?utf-8?B?NnA2R1F4VUF6ZzMycDJYR3RnQXhHQ2thb3lBeWVsMXQvRDMvSC9ndnUrN2gw?=
 =?utf-8?B?SnhyemZXbmZtT0lOUFFYTnBpSHB0ZjlwOVVvUzMrZnBjS3VxUkhxalpvVVpu?=
 =?utf-8?B?SmdmQ3FzTGV1L1hpRnFVZ24vajJJMnBWbWFUbDdWdy8vNkFTYnYrS3V3TnVE?=
 =?utf-8?B?TG9VTkowV0tKQkJlM2dPUzFzU2tkanVVT25xTEFTcGdjaFJoU2ZvVEZtditi?=
 =?utf-8?B?TVZGUmU4Yk55K2MzRWF4ZWNUY0J4SmpHNWs1TFRxQlV1MHFvYk5mQis4ZzR3?=
 =?utf-8?B?ZzN0ZlNtdmZBdkp1MTlhdkk5T1U1ZE9Va3c2Vzk4d1V5SFJ6ZmRzcWxoTTg3?=
 =?utf-8?B?blpVL1pOMDM5Ymhab1hHdEVKS3ZmaExaSFYwZGdvUHp2TTRTTXdPUnNNc1hk?=
 =?utf-8?B?UURLZW53R1dINnBNczZaY2NTdjZYMGY3dW9sdUtlSW1qUG9ROXltamRueEU1?=
 =?utf-8?B?Q01YcUs4anNFdkJHajlxNFdWZGlNc2oxejZ5OGs5TVBYTDN4Q1k1WUhxR1VW?=
 =?utf-8?B?ald3d0Y0NWJyMXdrL0tLZzZFNksvamhWbHhxR2EvQmZ3bjk1Q3lvaUdlWjAw?=
 =?utf-8?B?d1VlaytYU3VBU1V3VzNaaklFVjZmWTUxWTZLdmJpZ0FOTXdmS2grZXQ1NnFy?=
 =?utf-8?B?TkF2SEZmbloralVrTXFYZGFUKzRtQlNkU1p2VmJHcXBXeWhkaHNzb29UQmVt?=
 =?utf-8?B?WE1xTVBDbmpFSmdxOWp5Q1ZvdDVRVnlNWGE1RWNpWjlYRERkZGs2TWN2WEFN?=
 =?utf-8?B?OVE4OUpRN2RqYkVQRVFkSVA3SWxGb01Sd2o3MmEvWGZRMmxsS2JnN2gxWWpC?=
 =?utf-8?B?UlhyM0krSGw0dGh6b0NqeW1DcGlJOXF5em9VTnR0WStUZExPdkNWNjg4OCtF?=
 =?utf-8?B?K0g3ejRaVkhFMkhBZnhnM2Jha2ZjdCt3OFpCOHJaS0hZNU04dnZqbGczeStE?=
 =?utf-8?B?L2VkRGJsYVM0YXBwbU9wVkVJVTZXSmNnNmFaaDFiOTZKTFdzYlNxSzZLQkxt?=
 =?utf-8?B?V3VUekVnMElwc01rZnhQM09qSVh0MjkyWVN2bEJldFB5RTY4S2dqSDhtUDNE?=
 =?utf-8?B?WU5xU0FHdUFNWjNsTzNDMWtOUWZiejdGQkNHbmlGVFVPWnRvbkx0WTNyOEZ6?=
 =?utf-8?B?WVJVVVgyUkZDR1BJcFpWd2VNdW5RbWt4eHpQMWdzZSs4RzF6K0VBVmlOYmMw?=
 =?utf-8?B?a25HQXZ5dkVZYmQ5Ty9TeS9jQXJ6dWxZKzJpRHNiMU5GNS9FcHllclBwZGg0?=
 =?utf-8?B?ZkpIMjN5QmJkcFRGNTFHQTJUd1NXdk9NUDYzTGpRQVhGMGp1bHVLYy91UjZS?=
 =?utf-8?B?UDNrd2poTGpVeW5GSzB6cnhVVGFnV3VCY0hFMnEzSkthSDZ4U2YydkczaVY4?=
 =?utf-8?B?eGEydkFzN01mNEU0RElJU1FWN3dBVnY3T0JCM2RaZmxJYUp4cGtSbytMcTVq?=
 =?utf-8?B?MWl2a2tCOStFSEJKUnJVam5rODc4b2RiRnBxcjJCZVpTTVp5bFNJTzBaRmxs?=
 =?utf-8?B?SVhNY0NHTzI1T1d6YmVmOXVyOGN4bXdrdnNEM1JIV1BZaUcxbVc5bVhGVHhu?=
 =?utf-8?B?RzFRZ05LMTNiNkxpYkJaSkI3T2dMemVlNTRwNDNDWm90c1UrZ0wraEtoQlJt?=
 =?utf-8?B?NjFJa2NrWFIzNGRQbEhUb002VStWeWpUNElrOFZXQnNKTFhIV1E4UlFoWW9F?=
 =?utf-8?B?bzNock8xaG4zbDd1aUZCdVArRGtJNnNkSVNhZmNCU3ZNcVNPVXpWQWRJcEFY?=
 =?utf-8?B?NHNzN1oxVlNZbDJKV2NvSFR5Y3NPQmRwZkZYNkRET3ZzTjljTkZqUGFSOVV3?=
 =?utf-8?Q?KHpqGBm5TjyPaQmZnrsmQVDkA5YnWE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTlTVXFIajNpQ0M2aG1FOWlIbTArNWtYeGRvM2JQSS9CbUhrZkRNdXhPQWQw?=
 =?utf-8?B?OGJjbmRibHM1MFZKSmNZR0NqWTIwdGxVcTB6bHU2OVAwY1JLVnZjYzQ5SmJQ?=
 =?utf-8?B?OU5zS0F0ZUxpQWFBRFNVZlZUQzlRblJrU1dHeFRrcytSU3dGV0MrZjFtWm9K?=
 =?utf-8?B?RzB5bTM4Yjh0L0I3enpVd1R3aWNyWTdUOWRiQm0vNmRlYmZQNUhBc2RJK0dN?=
 =?utf-8?B?YXhObGQwbzVKamk3Z3o5OWRoNkY3YTMzdTFPSUNGTkowRHNxUTlOZXdSREpP?=
 =?utf-8?B?T3U1K05tQVU3M1U2UTdHZENPTDZrUEJiY1UzRlV6MDNESXVDL3pEWmZWMU1w?=
 =?utf-8?B?V2RCbCt0VCtvNktFbUh5RWhWbGk2bEhVRDYzMmt5U0ZyeHFzTDdOMzRFMjhQ?=
 =?utf-8?B?QXM4TW9Ebm5nN3J6dW1GYUdJL25XcWdpMVV2ZmdtT1lzU1JLUVFqTVp3R2dZ?=
 =?utf-8?B?cm1Lam82Ry9HQ0xWYk1CYzY1RHJrMFlUYVZEOFIxR1UrdE1vZTF1aUYwcVNU?=
 =?utf-8?B?UWhwemo4UkNhRmNXUGlVbktRVTVWdTJYcUdoTW8wUVFkNm1paG00Z3ozTTFN?=
 =?utf-8?B?TS9WZDZaZmFNd1Z3dzR3bXdSYjFQeTRxWXpxM29aRkFpc0FLZ2NuU3A3TTlx?=
 =?utf-8?B?aENHdWlQSXU4UzhnZUV1TmxMUWVzanFKL3diVWxYODJFUTVSVmJtWHJUQU0z?=
 =?utf-8?B?U2l2ZXpWOUllVXNRZWJtZ1dYN3lNYllBdzVZbzZVbUp1OW5NeHpkZUdFU0ZH?=
 =?utf-8?B?cWZhRkNTMHNqa0JGQ2x4cGVQSWtiTUlHQ3FFR3RJbnRGUVp1SFVObkUxbm15?=
 =?utf-8?B?clB0SW9YMTZ3WDRjeE11RXQxUmpWTVlUbGltK256MGt3dmJiSGI2VDVUQng5?=
 =?utf-8?B?UnRiaWZZK0xKYzVzZU4wb0p0ZnZFWGxGRDNwTUUwNFU4MUVtSEtYR2R5RFI5?=
 =?utf-8?B?ZG9TN1BxRnkzNURkWkVZZHZCS2x5VUFhMzQzV0Z1QWFwZ25ZZmxROHBFN0wr?=
 =?utf-8?B?QXhtZTF6dXNOYWlFV1F3Wm5KeGFqQ2tFWDRURUI0b1kxRkgxZk4zeTF2MlhS?=
 =?utf-8?B?TWJDRXhOUnJ1RXhEOXVIbTd1d2dDZTRDbDVUWHA1SkFmNVhubGVwUkJDQzBK?=
 =?utf-8?B?R0tNak1iSUk3TjRINHhZWThpZVErS254UjQ0NkZvSUlqQncrRTVGRklmU3Fr?=
 =?utf-8?B?amNWcVJyaWFKQUU1bWZwaWl5eGw0ZEFyWEdpNTMxbFk2cXVMblpHY1RzZ1VB?=
 =?utf-8?B?K0xlWEJrWHBVaXFvMEpSeXhjWm0xNlNQVGtNQXNrVUVHYUtZZm5MZ3ZLMThl?=
 =?utf-8?B?WStTRFVYU3BiYTJRYXU5SjdYRHZKYStQbkV5b2w5YmdMVHJtTUVXOTIwbTI4?=
 =?utf-8?B?WDdQSUh0TUZlSGRRYmdaT3VnaUQ0SFkxaWNPR2xrVlJiVUpHLzNPZ3E3b3c1?=
 =?utf-8?B?T1dPc2hxbFQ2aGpkMWlsdHI3Ni9wazdVVW45R3hZdlFZZmtJYkl1ZnVGd0NW?=
 =?utf-8?B?NE1od1RKYVpnd29sQnJVMmtOOFZKb0ExUE1QdXdneVdhelMvblI4RHEwQm01?=
 =?utf-8?B?aGNnRjRTMlVwUk5RMFJQOHdQKzlXZUVuMjc1WUZ5YldyUysraVluRXdsaWpn?=
 =?utf-8?B?WDBqMTZlTXZmL002THlITWJ2MDl6QzdlRTNXS2M0QUdxVFBTcGozM3RFVFkx?=
 =?utf-8?B?RHRFSWp6MEQzRXNMUVJZK1ZRaS94dGJZeFNBRTJ1TXoxaDhTcUVyTkZhOGFz?=
 =?utf-8?B?OHBBcFkzNjN4dU5wQmFYVFpOaG40M2pBVWdDMi9YbndjSzRwRm1Gb1ozdWNN?=
 =?utf-8?B?MWV0am9wWHVRL2J2Uk8vcjlkbnRwYmVMUGM1SFBIbmQyMUVORXVGcElTR1lm?=
 =?utf-8?B?ZCtZWDBCTjBDaEpGMzdleTNrLzl2SEdhVGpHM21aVFowTTBrVEx1eWFTelpk?=
 =?utf-8?B?TmZtQlI3Qm5JQlBYV29DMmtMSU1oMkVoNkp5cjRhZjFGMWJSRGkyd292eXdq?=
 =?utf-8?B?S3I5UVpGNkgwb1ZkcnY5ZmRZUkc2MUlmc1ZFY3p4ZGh6KzhvamV0bjNBS3Y4?=
 =?utf-8?B?b2U4WVRocHVaODVaWFFzbnBEd2cxbEUybkNMQmFqU0wvMmZieDdHeXVwSlF2?=
 =?utf-8?Q?gzeL886oHdMKqvB2Iu+tbo20Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe42c08f-075e-4eae-f495-08de2910732e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:12:56.4816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2A/gyWtyTEElmVFmF8OVZULghNK+T1GO1pc1H1ZzmK1wwU45YEk71+t8nXH1Q6c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9357
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

On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
> Until now ttm stored a single pipelined eviction fence which means
> drivers had to use a single entity for these evictions.
> 
> To lift this requirement, this commit allows up to 8 entities to
> be used.
> 
> Ideally a dma_resv object would have been used as a container of
> the eviction fences, but the locking rules makes it complex.
> dma_resv all have the same ww_class, which means "Attempting to
> lock more mutexes after ww_acquire_done." is an error.
> 
> One alternative considered was to introduced a 2nd ww_class for
> specific resv to hold a single "transient" lock (= the resv lock
> would only be held for a short period, without taking any other
> locks).
> 
> The other option, is to statically reserve a fence array, and
> extend the existing code to deal with N fences, instead of 1.
> 
> The driver is still responsible to reserve the correct number
> of fence slots.
> 
> ---
> v2:
> - simplified code
> - dropped n_fences
> - name changes
> v3: use ttm_resource_manager_cleanup
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Going to push separately to drm-misc-next on Monday.

Regards,
Christian.

> ---
>  .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 11 +++--
>  drivers/gpu/drm/ttm/tests/ttm_resource_test.c |  5 +-
>  drivers/gpu/drm/ttm/ttm_bo.c                  | 47 ++++++++++---------
>  drivers/gpu/drm/ttm/ttm_bo_util.c             | 38 ++++++++++++---
>  drivers/gpu/drm/ttm/ttm_resource.c            | 31 +++++++-----
>  include/drm/ttm/ttm_resource.h                | 29 ++++++++----
>  6 files changed, 104 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> index 3148f5d3dbd6..8f71906c4238 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> @@ -651,7 +651,7 @@ static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
>  	int err;
>  
>  	man = ttm_manager_type(priv->ttm_dev, mem_type);
> -	man->move = dma_fence_get_stub();
> +	man->eviction_fences[0] = dma_fence_get_stub();
>  
>  	bo = ttm_bo_kunit_init(test, test->priv, size, NULL);
>  	bo->type = bo_type;
> @@ -668,7 +668,7 @@ static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
>  
>  	ttm_bo_put(bo);
> -	dma_fence_put(man->move);
> +	dma_fence_put(man->eviction_fences[0]);
>  }
>  
>  static const struct ttm_bo_validate_test_case ttm_bo_validate_wait_cases[] = {
> @@ -732,9 +732,9 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
>  
>  	spin_lock_init(&fence_lock);
>  	man = ttm_manager_type(priv->ttm_dev, fst_mem);
> -	man->move = alloc_mock_fence(test);
> +	man->eviction_fences[0] = alloc_mock_fence(test);
>  
> -	task = kthread_create(threaded_fence_signal, man->move, "move-fence-signal");
> +	task = kthread_create(threaded_fence_signal, man->eviction_fences[0], "move-fence-signal");
>  	if (IS_ERR(task))
>  		KUNIT_FAIL(test, "Couldn't create move fence signal task\n");
>  
> @@ -742,7 +742,8 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
>  	err = ttm_bo_validate(bo, placement_val, &ctx_val);
>  	dma_resv_unlock(bo->base.resv);
>  
> -	dma_fence_wait_timeout(man->move, false, MAX_SCHEDULE_TIMEOUT);
> +	dma_fence_wait_timeout(man->eviction_fences[0], false, MAX_SCHEDULE_TIMEOUT);
> +	man->eviction_fences[0] = NULL;
>  
>  	KUNIT_EXPECT_EQ(test, err, 0);
>  	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size);
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> index e6ea2bd01f07..c0e4e35e0442 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> @@ -207,6 +207,7 @@ static void ttm_resource_manager_init_basic(struct kunit *test)
>  	struct ttm_resource_test_priv *priv = test->priv;
>  	struct ttm_resource_manager *man;
>  	size_t size = SZ_16K;
> +	int i;
>  
>  	man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
>  	KUNIT_ASSERT_NOT_NULL(test, man);
> @@ -216,8 +217,8 @@ static void ttm_resource_manager_init_basic(struct kunit *test)
>  	KUNIT_ASSERT_PTR_EQ(test, man->bdev, priv->devs->ttm_dev);
>  	KUNIT_ASSERT_EQ(test, man->size, size);
>  	KUNIT_ASSERT_EQ(test, man->usage, 0);
> -	KUNIT_ASSERT_NULL(test, man->move);
> -	KUNIT_ASSERT_NOT_NULL(test, &man->move_lock);
> +	for (i = 0; i < TTM_NUM_MOVE_FENCES; i++)
> +		KUNIT_ASSERT_NULL(test, man->eviction_fences[i]);
>  
>  	for (int i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>  		KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[i]));
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index f4d9e68b21e7..0b3732ed6f6c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -658,34 +658,35 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo)
>  EXPORT_SYMBOL(ttm_bo_unpin);
>  
>  /*
> - * Add the last move fence to the BO as kernel dependency and reserve a new
> - * fence slot.
> + * Add the pipelined eviction fencesto the BO as kernel dependency and reserve new
> + * fence slots.
>   */
> -static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
> -				 struct ttm_resource_manager *man,
> -				 bool no_wait_gpu)
> +static int ttm_bo_add_pipelined_eviction_fences(struct ttm_buffer_object *bo,
> +						struct ttm_resource_manager *man,
> +						bool no_wait_gpu)
>  {
>  	struct dma_fence *fence;
> -	int ret;
> +	int i;
>  
> -	spin_lock(&man->move_lock);
> -	fence = dma_fence_get(man->move);
> -	spin_unlock(&man->move_lock);
> +	spin_lock(&man->eviction_lock);
> +	for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
> +		fence = man->eviction_fences[i];
> +		if (!fence)
> +			continue;
>  
> -	if (!fence)
> -		return 0;
> -
> -	if (no_wait_gpu) {
> -		ret = dma_fence_is_signaled(fence) ? 0 : -EBUSY;
> -		dma_fence_put(fence);
> -		return ret;
> +		if (no_wait_gpu) {
> +			if (!dma_fence_is_signaled(fence)) {
> +				spin_unlock(&man->eviction_lock);
> +				return -EBUSY;
> +			}
> +		} else {
> +			dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
> +		}
>  	}
> +	spin_unlock(&man->eviction_lock);
>  
> -	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
> -
> -	ret = dma_resv_reserve_fences(bo->base.resv, 1);
> -	dma_fence_put(fence);
> -	return ret;
> +	/* TODO: this call should be removed. */
> +	return dma_resv_reserve_fences(bo->base.resv, 1);
>  }
>  
>  /**
> @@ -718,7 +719,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>  	int i, ret;
>  
>  	ticket = dma_resv_locking_ctx(bo->base.resv);
> -	ret = dma_resv_reserve_fences(bo->base.resv, 1);
> +	ret = dma_resv_reserve_fences(bo->base.resv, TTM_NUM_MOVE_FENCES);
>  	if (unlikely(ret))
>  		return ret;
>  
> @@ -757,7 +758,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>  				return ret;
>  		}
>  
> -		ret = ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
> +		ret = ttm_bo_add_pipelined_eviction_fences(bo, man, ctx->no_wait_gpu);
>  		if (unlikely(ret)) {
>  			ttm_resource_free(bo, res);
>  			if (ret == -EBUSY)
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index acbbca9d5c92..2ff35d55e462 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -258,7 +258,7 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>  	ret = dma_resv_trylock(&fbo->base.base._resv);
>  	WARN_ON(!ret);
>  
> -	ret = dma_resv_reserve_fences(&fbo->base.base._resv, 1);
> +	ret = dma_resv_reserve_fences(&fbo->base.base._resv, TTM_NUM_MOVE_FENCES);
>  	if (ret) {
>  		dma_resv_unlock(&fbo->base.base._resv);
>  		kfree(fbo);
> @@ -646,20 +646,44 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
>  {
>  	struct ttm_device *bdev = bo->bdev;
>  	struct ttm_resource_manager *from;
> +	struct dma_fence *tmp;
> +	int i;
>  
>  	from = ttm_manager_type(bdev, bo->resource->mem_type);
>  
>  	/**
>  	 * BO doesn't have a TTM we need to bind/unbind. Just remember
> -	 * this eviction and free up the allocation
> +	 * this eviction and free up the allocation.
> +	 * The fence will be saved in the first free slot or in the slot
> +	 * already used to store a fence from the same context. Since
> +	 * drivers can't use more than TTM_NUM_MOVE_FENCES contexts for
> +	 * evictions we should always find a slot to use.
>  	 */
> -	spin_lock(&from->move_lock);
> -	if (!from->move || dma_fence_is_later(fence, from->move)) {
> -		dma_fence_put(from->move);
> -		from->move = dma_fence_get(fence);
> +	spin_lock(&from->eviction_lock);
> +	for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
> +		tmp = from->eviction_fences[i];
> +		if (!tmp)
> +			break;
> +		if (fence->context != tmp->context)
> +			continue;
> +		if (dma_fence_is_later(fence, tmp)) {
> +			dma_fence_put(tmp);
> +			break;
> +		}
> +		goto unlock;
> +	}
> +	if (i < TTM_NUM_MOVE_FENCES) {
> +		from->eviction_fences[i] = dma_fence_get(fence);
> +	} else {
> +		WARN(1, "not enough fence slots for all fence contexts");
> +		spin_unlock(&from->eviction_lock);
> +		dma_fence_wait(fence, false);
> +		goto end;
>  	}
> -	spin_unlock(&from->move_lock);
>  
> +unlock:
> +	spin_unlock(&from->eviction_lock);
> +end:
>  	ttm_resource_free(bo, &bo->resource);
>  }
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index e2c82ad07eb4..62c34cafa387 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -523,14 +523,15 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>  {
>  	unsigned i;
>  
> -	spin_lock_init(&man->move_lock);
>  	man->bdev = bdev;
>  	man->size = size;
>  	man->usage = 0;
>  
>  	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>  		INIT_LIST_HEAD(&man->lru[i]);
> -	man->move = NULL;
> +	spin_lock_init(&man->eviction_lock);
> +	for (i = 0; i < TTM_NUM_MOVE_FENCES; i++)
> +		man->eviction_fences[i] = NULL;
>  }
>  EXPORT_SYMBOL(ttm_resource_manager_init);
>  
> @@ -551,7 +552,7 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>  		.no_wait_gpu = false,
>  	};
>  	struct dma_fence *fence;
> -	int ret;
> +	int ret, i;
>  
>  	do {
>  		ret = ttm_bo_evict_first(bdev, man, &ctx);
> @@ -561,18 +562,24 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>  	if (ret && ret != -ENOENT)
>  		return ret;
>  
> -	spin_lock(&man->move_lock);
> -	fence = dma_fence_get(man->move);
> -	spin_unlock(&man->move_lock);
> +	ret = 0;
>  
> -	if (fence) {
> -		ret = dma_fence_wait(fence, false);
> -		dma_fence_put(fence);
> -		if (ret)
> -			return ret;
> +	spin_lock(&man->eviction_lock);
> +	for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
> +		fence = man->eviction_fences[i];
> +		if (fence && !dma_fence_is_signaled(fence)) {
> +			dma_fence_get(fence);
> +			spin_unlock(&man->eviction_lock);
> +			ret = dma_fence_wait(fence, false);
> +			dma_fence_put(fence);
> +			if (ret)
> +				return ret;
> +			spin_lock(&man->eviction_lock);
> +		}
>  	}
> +	spin_unlock(&man->eviction_lock);
>  
> -	return 0;
> +	return ret;
>  }
>  EXPORT_SYMBOL(ttm_resource_manager_evict_all);
>  
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index f49daa504c36..50e6added509 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -50,6 +50,15 @@ struct io_mapping;
>  struct sg_table;
>  struct scatterlist;
>  
> +/**
> + * define TTM_NUM_MOVE_FENCES - How many entities can be used for evictions
> + *
> + * Pipelined evictions can be spread on multiple entities. This
> + * is the max number of entities that can be used by the driver
> + * for that purpose.
> + */
> +#define TTM_NUM_MOVE_FENCES 8
> +
>  /**
>   * enum ttm_lru_item_type - enumerate ttm_lru_item subclasses
>   */
> @@ -180,8 +189,8 @@ struct ttm_resource_manager_func {
>   * @size: Size of the managed region.
>   * @bdev: ttm device this manager belongs to
>   * @func: structure pointer implementing the range manager. See above
> - * @move_lock: lock for move fence
> - * @move: The fence of the last pipelined move operation.
> + * @eviction_lock: lock for eviction fences
> + * @eviction_fences: The fences of the last pipelined move operation.
>   * @lru: The lru list for this memory type.
>   *
>   * This structure is used to identify and manage memory types for a device.
> @@ -195,12 +204,12 @@ struct ttm_resource_manager {
>  	struct ttm_device *bdev;
>  	uint64_t size;
>  	const struct ttm_resource_manager_func *func;
> -	spinlock_t move_lock;
>  
> -	/*
> -	 * Protected by @move_lock.
> +	/* This is very similar to a dma_resv object, but locking rules make
> +	 * it difficult to use one in this context.
>  	 */
> -	struct dma_fence *move;
> +	spinlock_t eviction_lock;
> +	struct dma_fence *eviction_fences[TTM_NUM_MOVE_FENCES];
>  
>  	/*
>  	 * Protected by the bdev->lru_lock.
> @@ -421,8 +430,12 @@ static inline bool ttm_resource_manager_used(struct ttm_resource_manager *man)
>  static inline void
>  ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
>  {
> -	dma_fence_put(man->move);
> -	man->move = NULL;
> +	int i;
> +
> +	for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
> +		dma_fence_put(man->eviction_fences[i]);
> +		man->eviction_fences[i] = NULL;
> +	}
>  }
>  
>  void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);

