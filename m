Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBA4B59776
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 15:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE09810E7DB;
	Tue, 16 Sep 2025 13:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1WRfp6Gz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012067.outbound.protection.outlook.com [52.101.43.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606C110E7DB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 13:23:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v13zbqaO8eK5dJWEwqv9EAabuxcS+0ZO5B3lq3MhWVMAZUsJyTI5plgz+82gMsASF9r3g5nuZWZAoAGuaS5zErFlBJf9mGJa1kyeKCke2YaXf6pPC38cGl4VXqKZUiIua4QL/P/EVzsWjs52VaV+x+Q2nZ38qwaz21nfqYU571ga/mW0mT0zR+318VgwlRQFYEm1D3VE4q0EjRTFIEbaheRPJ2t8A/U0bZoWYvsHCDqtWyFSi+1sUAjzyZmez8rwWKk7o2koc0ixME9SI0PGhjC0UHcjoJXxbzLUemZN5zAHlfmado/u1+iJe4X4yZOu2Wzo1qcByogb4CDB74MJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Q5/ufxF6wnoS7QxOBeLKQ6iAQ5JNQu8neOO0zzECAs=;
 b=L4+iCrOObYZ8UasPC637lnj0vDm4LJPELIC4McZSCd7RnLCDiITMcuU/jtdPfyqJquZHyhPTYxxwplNCeF8RESHtLw7BoXO2YvCcjbGiKEdvYDZwOV/uufuC7bvXJ3PtxrcIbKgvUxQRgYbvUcW8Nzv8vf70WpFytrbHo5IMd8E61IOZpX2GBDuqfvRY5lZ6pjVAufhhQrJNGuW50XqwUNcficmhKSu1/pN9LC0e7smWtX0UqKW5eh9V9npnPvk1ajvyH9oZXsFrddIb6lyKaJ/loxzMdaHMwnAxs4Su/EzymOy85phY7pXo7v9Uveak0K7izNcV2O+k8hwabTOy1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Q5/ufxF6wnoS7QxOBeLKQ6iAQ5JNQu8neOO0zzECAs=;
 b=1WRfp6Gzk2/9oJZgaoFK5UnoOuxxrx9NSuKuo9f/X4VufJfjzG+XxXn/+3sScL5gr1koeg5SEI0b+o4yKTUzM30un6+CJRDMeMf+NT99KGDLTUu+FxeRUtYvOfXHC+3IW0B75Y2nUPgNq+g4gZh31jM4H8Hh5wMSqhcC97Niowo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW6PR12MB8958.namprd12.prod.outlook.com (2603:10b6:303:240::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 13:23:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 13:23:27 +0000
Message-ID: <424eb21a-8f3c-4749-be5b-f3b732fe79fd@amd.com>
Date: Tue, 16 Sep 2025 15:23:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: drm/ttm/memcg/lru: enable memcg tracking for ttm and amdgpu
 driver (complete series v3)
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20250902041024.2040450-1-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250902041024.2040450-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0062.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW6PR12MB8958:EE_
X-MS-Office365-Filtering-Correlation-Id: ba95ef74-0e16-4772-0e92-08ddf5243843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkZHdlozUkRZakYyWmkzQ0NGZWM1aGlrbTlvSXBSSFNMMFI3bWZoRGNwdnJq?=
 =?utf-8?B?RUVMY1BkTUtNeFBqR2FBL1plcmJ5bWI5bXZQQnowNnNTZThxWnFNS01peDI3?=
 =?utf-8?B?eHh0MXhOd0VKOVJtRUxtSmFpL1JDR0NlcDA4bU12RUxTQ0lxSVZpZ3Rja2Qr?=
 =?utf-8?B?WHJic2Y3VzJPQzhUd1dqcTlEZWhwSDRnMmxKK3oyQjVqWkxTOTExSEl6d2J3?=
 =?utf-8?B?K2cvckwzT0xtU3pVNTkxRTR5bi96S1VmRVRZeDNYMitsTWhvdW9malRObWhS?=
 =?utf-8?B?KzZ3RDZPOEZLRmVjOStzR3F4MjFmeTF4cHRPTkc1TlJpTlNVTmkvTmlwaHNX?=
 =?utf-8?B?QjRaTDdTYmlBZjlpRTU0SjhLS1JNVG1IaWprU25KNXp0dkRtRk5oR3ZtcWZt?=
 =?utf-8?B?OHdUYklFYTZKYzNaZUdnMjUrZExXN2xCRXlUWUZxMzQvOXVmK05mdS8vdWN4?=
 =?utf-8?B?YTZIUDc5NzEyKzY4RzFMaCtoNzZZS01QazVwanVHMzAzc3pBT2VhQTBOcEZH?=
 =?utf-8?B?K09BdDhKeGUvUm1rNUxMUlFLWHNzeHhJdlpRdTRXRXh2ODk0WDlNSjFCOHdn?=
 =?utf-8?B?eVpOTVgxUDAyNVhnSXpLTWR6c25uZ212bDJYYlhhV1NkRVJTYkh2cm9yb1cy?=
 =?utf-8?B?VHYxQXhoUnZUWGRLY2d1d21aUktiUklWU3dYUUVpOTR5cXVoSnduMFlEVE5K?=
 =?utf-8?B?b0lJV1ZleUErTk8rNGxnS01sTm9QdnBUMmhvS2VCd0ZkekEzSk9KUlRpSHlC?=
 =?utf-8?B?bC9RUDFPaWRJZkttbHBsTTl1RVovK0tRNjBjUE9VRzkycFJnVlZiYW1XbWw3?=
 =?utf-8?B?ZGtNQjNZQURlK3QreCtEMENXaUhoNHNLMUxIcU9zYmlmNStLTlZjWFc5TUEr?=
 =?utf-8?B?NFBaUDJrOHAxc29aUFRVM2U0SjRvQS9oa3JXWTlzTVFGZkdYRGpSZ2FpWERO?=
 =?utf-8?B?Y2VueWU0ajZwQm4yT0U0WDZ2Nks4UVAxRjIvbVg3ZmZnSVR6b1M2eEJERWxs?=
 =?utf-8?B?bGsyQU55RlVwQ3pWMzcyRGYzSXRrL2tmMHdNZFJJWW4rTTFSQ3hwaTQ5QlRF?=
 =?utf-8?B?eW02RE1EajdsZ1EwU3A1aDdnaEpSODV6ZU1wZG9uK2FuWWxBcHJ2azZQYW1W?=
 =?utf-8?B?L3RncEhTR2xCVGlkZHlpYmZ4NjJwYzNHTlRzMWY4bmZBM2l4REJHTDVydWMy?=
 =?utf-8?B?K2hIaGErYmVmTGgyRVMzcmRDTWNhcHgyaG9CL2MxR3dYbis4WUk0Vk1Bb3M1?=
 =?utf-8?B?azlzWlNucXUxZGF0dEZETFYxdXVpWWU4amRBVDFTWGxJMlo2KzEvekdnaEt4?=
 =?utf-8?B?cjJtWkJWbmhiQlN4aWNpWnFKd0lsUTVKS3dDeEtIQ0dzS3B3RXdBOTVEckJu?=
 =?utf-8?B?ZWVRY1hXczB5YmlkYjl5eFN3bGNZS1N0ZkQyYjA1cjlaTE05NGRJN054UXNZ?=
 =?utf-8?B?TG5zVTJLVStRanZPclRHMUNkN0Nua3NRT2M0OWRGdHc3bmFHTFRTdlJhd29z?=
 =?utf-8?B?QmJLRkhDRHBQKzg5bEE2V1JkeTNPZTQ1ZnpIWllHLzVzV0YwQmlRSDhHcWVP?=
 =?utf-8?B?R1M1TExUWkdHUzlkemdQaTV4UkxYNDdQU1FKZkROZ3hoNURCRmV6UkllMzhl?=
 =?utf-8?B?Lys3SVhYdkNPb2NVdGlUZFJiWHpNc1pVOVprWEZmSmpySnZiVW9BYkt1YkQ5?=
 =?utf-8?B?cmJzOGIyWmVFR3VaTklXQWJXNGlHZldRSTI5bER5citHVnJENG04d3ZzQzlK?=
 =?utf-8?B?Q0pQRklYNE9yZVR3dVRVQnlxMWNvTE1UVzZobmRZNWJXTTdzbW05M2tqcWxo?=
 =?utf-8?Q?iDQ+2urgzcbdfxps/YL8a0jynBpm1UpiGJOnw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d21Jem1MVG5JTEt5bVEyN3picTJMdWY0RlVYSzdMV095dEpzbmRiRmJVMk9Q?=
 =?utf-8?B?aXc5ekI1MDV0Zzd3cjNRWmkxeXljc0dWVVhiekY3YmR0U0lYVC9SNE41cTNW?=
 =?utf-8?B?UVNjclByemM0QWs2WmMyZlNFU1VMVXFUSHFDZTcwREYvai9FdHVWRUZPTDlp?=
 =?utf-8?B?QTF5Z0NxTkJNNTVoZ1dYWE0yZEZyNnVkK29mTFkvL0FuMXozZzRrOHhZcGRz?=
 =?utf-8?B?ZWtvS1ZLaWJmQUp2TTJFdk0waWpmNFZqa0hydHpIWFFBQ1M3ZkdxTno5dzBS?=
 =?utf-8?B?eVVJZVROWllnL2xETnJ3TVdTUktGb0pwTEl6bUZJL2hKQzhTREErTXQ2QlVw?=
 =?utf-8?B?WDVUbWIyVnFuRVBIUHFucUs4TGpkV3NiRkNnSG1FbHJDK1dlbU5KZHpNR2NM?=
 =?utf-8?B?ODJ3dG1RdG1oSXM3dERIbkdxVnNTOHR0WThCUkNYa0lqTXUzTGpZSVMzZElm?=
 =?utf-8?B?U2VJZTZjVFFCM3diSzVMRUc3R3BGQ3RPSXpjanYrbXk3bjBhUzk5ajBVQkI1?=
 =?utf-8?B?Z1djNEEwMFJqUU1RRmNBWmwxVGdjTjQvckIvYVFRcU1hM2FMQVJ2dDF2anNs?=
 =?utf-8?B?MXgxTlBQU1M3NENYc3FJZU5EdjUxYUtlcTRxWkdzano3QWNRa2I0bWg5T2xT?=
 =?utf-8?B?QmZINWw4RlpXZmVoM2lsTFdSV3lPUHFvL0hhaXp0WGVJK2YxN1N2S3BNdlpw?=
 =?utf-8?B?UEVwSy84bnJ5L3BWNnlqYVJYSFJyZGRIMVNoT3RSYXpUVnRPSVZxdHZXdnBs?=
 =?utf-8?B?RlBmbHl6VmZVRWUyVklYQmFZSi91cm1Wd0hDSmI3QkVuSlVmMlBnbTZrdkE2?=
 =?utf-8?B?Z3F3MDZKWGF5MHNxRWkvQWdpakZydE9BeUFpSnRqVWRMd2k0Z2RJNk9nOUhH?=
 =?utf-8?B?cXNpam1RSW5sUEtTRTVSL0NjckRRbDFicDJlOWxNOGFFeW1mR2dDZlo5dXZB?=
 =?utf-8?B?amtoTW4yb3FiL3hhYXdsRkFJcG1vcFRNcUxXc3Yra1NPcThOQ3lUZnE2R1di?=
 =?utf-8?B?NWdRM0x3VkFQQkt3bXZDTXBRaGIwMkMwZ3lCYkp1M3ZIZ25YZVpPTHVwem1t?=
 =?utf-8?B?ZHBYSkY0SGNGeVJONWJlbUlFT0dNL0xmWGdEaXpkSUJ5dVNPMTZMc3JHZTBW?=
 =?utf-8?B?VWliK3A5eW1pQ2dtMWlISTl5dDVtQ3FEYnIzM1FaZzJ6S290US93WEozTkEw?=
 =?utf-8?B?MVc0cFg2QSsyNThRTklaMmhCVk5ER0gxei90RWR6aGVRWGsyNitlTFpvM2tp?=
 =?utf-8?B?VWFaMEcrYzhwbTJhQlF2TTlHWCtUcldIc2xiak1JWWh5UVVMS0pRNG1sS2lF?=
 =?utf-8?B?eHg5dkJ2dkxGQ0E0NCt0VUV3WkcwN2IydExDSFdLa2tlUVkxVDYzUFJZRXQ4?=
 =?utf-8?B?WU5CaVRRK3ExakNVWUpXbGNYb0c3eElYVVdmMmVpWlRTSlpvSTlOaTNWalRi?=
 =?utf-8?B?d280V3NTNGJqK1BNSm5HcHYybFdyTnFia3lkcUFIbllvUXoxaDJjNkRacWRv?=
 =?utf-8?B?a0YrQVFUYkkxSGExangycFh4UG5YOVNWVnFqMXBqaHVoYi9GTXZCbFZSa3oy?=
 =?utf-8?B?M2pWMDV3Zi91c1pJd2NiUXVqME9uTURDSW1Rb084U3p0NnB6eVhyL2lTQkt3?=
 =?utf-8?B?cDNqa2o2bUliVHFqTVVHMG5BeDVBZStvdHRFTWVyY3FkczNoNE5nTldwTmRZ?=
 =?utf-8?B?bTMzK0hnZysvQmJ4WHlubFphV2FjaU5hakdiYzZweExNSFduZlM0YjBmanBx?=
 =?utf-8?B?UzQrNlRNWTBMcDVhR1dsK3MvZ3JXbHJxQlZvVlJUUFo3a3UwY0w3alNzcjFk?=
 =?utf-8?B?SjV2KzlNbCtHQzgrQm9XRlkwQk9KWXV0dlFOSWJiNjkxbUJpUlZSWTFwWWs3?=
 =?utf-8?B?Y1o2UElUcmpDRkJqYTF6OFZ4ZjhIK3B6VW1ZcG1nbXlMNzBDS1pVbzlCekox?=
 =?utf-8?B?aDJzeENKbExQSHZWQmlOWlNyWHFHVjkyNjlKY1AxWU1qVVZzRlJUYmNLTVdH?=
 =?utf-8?B?blRtWmRhMFVJTlkrYWt6aUhyZGtTVUVGTEJGRWo4UEpKQVdVN1dFUzFWSU1E?=
 =?utf-8?B?dkk4QlVHenhSYUpkRHc5M1ZnWVM3YkxnRllGdVNxZUZsNjltcWYyUXB2Vk82?=
 =?utf-8?Q?u1Eu1rYnepsWFVgjqfVovkcxg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba95ef74-0e16-4772-0e92-08ddf5243843
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 13:23:26.9760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyzoeFSAYAzq7Kdw5Va3gQL4I/SRbnuQl8DRIOX0Bm0RHmtYM3lGF5Jq6a7idYrI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8958
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

Patches #1, #2, #7, #13 are Acked-by: Christian König <christian.koenig@amd.com>

Patches #3, #5, #8-#9, #12 and #15 are Reviewed-by: Christian König <christian.koenig@amd.com> 

Minor comment on patches #10/#14.

I've just noticed that #4 never made it into my inbox. Which one was that?

Regards,
Christian.

On 02.09.25 06:06, Dave Airlie wrote:
> Hi all,
> 
> This is a repost with some fixes and cleanups.
> 
> I'd really like to land this into drm-next, Maarten posted xe support for this and some other work
> and I think we need to start moving this forward in tree as I'm not sure what else I can really do
> out of tree.
> 
> Differences since last posting:
> 1. Squashed exports into where they are used (Shakeel)
> 2. Fixed bug in uncharge path memcg
> 3. Fixed config bug in the module option.
> 
> Differences since 1st posting:
> 1. Added patch 18: add a module option to allow pooled pages to not be stored in the lru per-memcg
>    (Requested by Christian Konig)
> 2. Converged the naming and stats between vmstat and memcg (Suggested by Shakeel Butt)
> 3. Cleaned up the charge/uncharge code and some other bits.
> 
> Dave.
> 
> Original cover letter:
> tl;dr: start using list_lru/numa/memcg in GPU driver core and amdgpu driver for now.
> 
> This is a complete series of patches, some of which have been sent before and reviewed,
> but I want to get the complete picture for others, and try to figure out how best to land this.
> 
> There are 3 pieces to this:
> 01->02: add support for global gpu stat counters (previously posted, patch 2 is newer)
> 03->06: port ttm pools to list_lru for numa awareness
> 07->13: add memcg stats + gpu apis, then port ttm pools to memcg aware list_lru and shrinker
> 14: enable amdgpu to use new functionality.
> 15: add a module option to turn it all off.
> 
> The biggest difference in the memcg code from previously is I discovered what
> obj cgroups were designed for and I'm reusing the page/objcg intergration that 
> already exists, to avoid reinventing that wheel right now.
> 
> There are some igt-gpu-tools tests I've written at:
> https://gitlab.freedesktop.org/airlied/igt-gpu-tools/-/tree/amdgpu-cgroups?ref_type=heads
> 
> One problem is there are a lot of delayed action, that probably means the testing
> needs a bit more robustness, but the tests validate all the basic paths.
> 
> Regards,
> Dave.
> 

