Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389D7993ED1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 08:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EC210E469;
	Tue,  8 Oct 2024 06:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Mzqa+g2M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2076.outbound.protection.outlook.com [40.107.236.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6569F10E468;
 Tue,  8 Oct 2024 06:46:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMevHOvGTiNFyDx3hujZ57UcoZMbX3GpdyTIxxGkNXfBm7C4n/pq5abh4Uo07uT+b+Ak/chb0TnO0RVvrRfnM8IqnSlA8irolV+YOU1WPrrwIeSKHbs+WDM+Fuqn80fPv5+z+qvCU+dqLVUwMtjhYE2rj5Y1Y8t7D9LeMQ66U94uvmtrjUKV5pvUV70L5LNevEdoFuGdJvBN8nTGviTo0n9yL1s7WlWydzXebgn6C9YuFxJjO9zJOe/LJPhhFiaWLXEezfLbJqnMUwXSD/ECTvp+sUYZS6YYq2bMI62NkKqe2OL4m4wyaUEaEFov3/mhWZdzY0JKMVtcnzd2h/GPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZskjqkyTFpVKgwAeac8qDpsVNXz4WemZtnJAgwYViE=;
 b=XRfMSrdIyFo7v0wN8P29e+/2tdKaRCEaKYib6z+dyiauPPviAgQsrygt+cClmuYzUpNkQ6g4N2rTycQZOrZEkA6UsttdG1bYOu96/I8mwAI0Z7ctskCiGUT1KIXzH7Y7nmKjStc14EhSbwGsqRyXLA96UrD0AbbWF01PySxMu0OT1OfKPFj6qSu7JoRMDcxkCQeaQWU8PUvBP94PBPxX7/Di55GyVK+LDj4KgHCvf+RyyTuG7kLZdlPeZm71XBO3OtIOVft1hQStwEUQUg+Yu4w0YG9+eRdxHqxcQfITTJQAB03WAKS7mTYN3TfvMymdl5n7f7nJH+g8EbOMvJXJFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZskjqkyTFpVKgwAeac8qDpsVNXz4WemZtnJAgwYViE=;
 b=Mzqa+g2Mrp1wBU96u5zV8SmiuSSyNGGry7ow/kibMY/5Ubkez0+qLiWXd/hF6OZJkoR+WH06VLZabWLhFPxjRfTX7uh6nPHsAz/FAZSZtnOxlKMibD0sg3cTnM6SJDFKs+agunwPdAzeU/iI+NghH4xX/rnUzIYi5iAi8pZycZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB5812.namprd12.prod.outlook.com (2603:10b6:208:378::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 06:46:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 06:46:13 +0000
Message-ID: <bc1f6bc0-6512-48e0-9f97-c607b34e9ab1@amd.com>
Date: Tue, 8 Oct 2024 08:46:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH AUTOSEL 6.11 72/76] drm/amdgpu: nuke the VM PD/PT shadow
 handling
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Cc: Lijo Lazar <lijo.lazar@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, sumit.semwal@linaro.org, mario.limonciello@amd.com,
 Hawking.Zhang@amd.com, le.ma@amd.com, hamza.mahfooz@amd.com,
 andrealmeid@igalia.com, victorchengchi.lu@amd.com, sunil.khatri@amd.com,
 chenxb_99091@126.com, victor.skvortsov@amd.com, Jun.Ma2@amd.com,
 Yunxiang.Li@amd.com, Felix.Kuehling@amd.com,
 Arunpravin.PaneerSelvam@amd.com, tvrtko.ursulin@igalia.com,
 pierre-eric.pelloux-prayer@amd.com, Wang.Beyond@amd.com,
 shashank.sharma@amd.com, zhenguo.yin@amd.com, jesse.zhang@amd.com,
 Philip.Yang@amd.com, rajneesh.bhardwaj@amd.com, Tim.Huang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20241004181828.3669209-1-sashal@kernel.org>
 <20241004181828.3669209-72-sashal@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241004181828.3669209-72-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ad0aea-0012-488c-a2bd-08dce764e695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTZWdXhncWQxV0MvNFFSNE9sM2kzVTM4TjBqbEpUYnVQdTQzQko2cktaZDZw?=
 =?utf-8?B?bEpEQmRycHhodGtqcEgwR00wTE8vQ2FGbFdvQXpqQ3BKTGFWT1Y2anFpb0Zl?=
 =?utf-8?B?U1hRUTdVdkNFV09lTnhGR0NIUG5JWTBsa0srNnhBOGxDdGdDMi83S3JndlRD?=
 =?utf-8?B?V2Q1dmw0STBiYVNueWdUelJUd0M0d3dNazZkRm9ONlR6YnpSdUtLZHY0a0xK?=
 =?utf-8?B?dmYwOFhuMEY1bHgwWjhOREtiUjYzUmg3RDMrL01ObFI2aDZUMHdudFZZSUpX?=
 =?utf-8?B?Y1M3ZGRvUTRyRTJjUEFHdXNjR3Y4Y1I2aWlXZ1d6Uzk5bjdLMnJOOFZuS0tu?=
 =?utf-8?B?R0gyQTY0blo3WnpmR0Jram5yRWRYQWIrSXlZNUNJdDVzQ0VkU3RRSVljSjdE?=
 =?utf-8?B?OWYwcHNmU05yZXEvN2dTQUJ6MFBoeUZwUG55dW52anBPZDJQZVQ0dnVSU3Uw?=
 =?utf-8?B?K2lLQlgwWmRYOVFKS2RIVDVqKzRhV3lVUHh5N05wT3hrNGdKa01FNmNCbGlR?=
 =?utf-8?B?TWJhQkY0eW41ejBvdnlXRUpZU0RxdUNYOHN4Qzh1RmpBQkdMN0MyeWhydmZn?=
 =?utf-8?B?Uyt0K0RHVXUvQ2c3Y1RvbmJyT05GdkZtTHpKbWFXSEVqUS9aUmVjOXNUSGxU?=
 =?utf-8?B?S1dxQk9ZN2pBdFhUYXlrSXRsZk1JRVl1SWw2Wi9GMWdKV1RKSnBkV2tEQmpF?=
 =?utf-8?B?VUhuUjF5UlZNaTJHRUszM3hHbjRYS01SODNZcWNmL3JGMlFPUGhlRHluMHcr?=
 =?utf-8?B?eFpnd0lIQ0pud3BHV3JwalJjSFdjSlVFUGdRNUJIaGkrODF3OTFJTVZMSHdU?=
 =?utf-8?B?RC9LODduYVJZN1ZEb3Q2bTFtNjBwYzEwZUFGbHBLZFN4REE4WjFmSWhmR095?=
 =?utf-8?B?U3lFRjFhbHRORHJnMk1OUVhvdVJCV2tEN29kUFBjSVFScVNxUUpuL216Skhm?=
 =?utf-8?B?MDhTRC83Ky9nUzN6ZjV0K040NTBIVkMwMVBnVzc1emUxYXZUbjJVWnlKVnQw?=
 =?utf-8?B?dFpiN0lNd25WaE9jS2ErMnE5MmlPU01LQWVxenV6cnBmdnBMdDJEUnV6SWdU?=
 =?utf-8?B?bWxlRHBDc2d0UjYwbFZkbEh0eEVWV3h4TDNmdFl1VVMvUzRFYllWZzJncUhO?=
 =?utf-8?B?bWJVQzhRZjc5aUplNm1vMnNybHVsMWhDUEM1RytTazdiNTdNNEFHUGdVejNX?=
 =?utf-8?B?L1V1Sm5HNXFJb21FaEpETmJCUFdiVUVmc0RHR2xqSmxkTXhuK2ZsQmQyWkx5?=
 =?utf-8?B?a2o2cC9HQXRYRVNVMmRwVk4vUDRjNHhpYi8rUUhBZWN3V09mNUEvckVkKzZC?=
 =?utf-8?B?cTJBSEJ5RzJpYy9NZ3JTMVBHMk9pbGorM3g4U253TThiOXZ0eWxjSm8wSGw2?=
 =?utf-8?B?b2VvcEtCeldyeVJOc3ZBRTliVlJCSEdKQnAyMkQzZWdXdk9ybjRTWjVSRlgz?=
 =?utf-8?B?ZlIvNDZDYTVaT3dIaVU4UGJUTDhDYU54SmNzZVE1QzBtTXhPb1ZnV3JzQitR?=
 =?utf-8?B?ZUp6RkROKzRDeHRycVcyT2tHb2EvbHZTUjMydmIvcUhyRC82VDlPQ2dYM2FG?=
 =?utf-8?B?Vmh1ZVRxS2JyMzM0ZjloQ1hwRWlrcWpsZEg4dE5FeUVaK29ieElxek9tdG5H?=
 =?utf-8?B?OFFUdkdNemVpRk1NZHgwRG1wa0g5Z3BmRjR4S0VsR21kalhOQ0lYczhES2Zi?=
 =?utf-8?B?TFFJQk55ZW1ibmRyK0V0a2pUNHRWVE95bDdBNXNncXZHRksxVzVEbDJBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjVkTjZnS1VoVzB4NEF6UWxQdDkxU29Tamx4ZytpWkRrZFc0d2NaSVd1N2lF?=
 =?utf-8?B?MFl5TFM1YkJqK1NuenRiS0ZsQVRYV2NQYWhwWGkvZFhrSnByaG03amxOOEph?=
 =?utf-8?B?SjhwOWJYaEppeXR4cXZlYVJMQmZOV0lZYjNXYjNXSEczcGVFNVVCV0dKNkQ4?=
 =?utf-8?B?T1pmRVl1T3NqcmVsdytvOXlXN1hXOFNCeHB3WGVwbXdpVDladnJMMXdGeWJL?=
 =?utf-8?B?amltUkNzaXQ2WjZRdTNpblBpSnphbDdld2ZlUlZxWDVqNTB0MTlab0R5dVBq?=
 =?utf-8?B?Y0QwU0V2Vkd5c0dSWUs0dUt4QTNwa2xXZkRRc056YlZsWXNzbW0rckYwTUI2?=
 =?utf-8?B?MUNRNEoxUi9DME9yVlBWZmJlTldSaE9IVHNpNkdpKzBDMDBNbkVndXZGS05G?=
 =?utf-8?B?QitCcXVKcVR3ZEM3UnVCZFIyY0Jxem81REcxWkRReDdPQmFHMVVGNDNMRitQ?=
 =?utf-8?B?Mzk2K2dsT2FRbWptVnNVV2tYczljREVTanRnUFphRWsxaHRBZEpGQUlLbHk2?=
 =?utf-8?B?N3BvWlk5bUlNSHNnQnc2VGk3YmRwU1dlbUV1Zi96NC83UlAzMmU0cXBDQ0Qx?=
 =?utf-8?B?djFmYUxXSUxHdW5CN0JVbGVWR1dHSzI2c2tjWWZkbmNwTGJHZVU0RlFrbTMv?=
 =?utf-8?B?YUFjbyt5VEJ6YzNTeFhOUDhrcEI3TGVLWVlVV0F0cVNJUXZBaGJTclpkRm1X?=
 =?utf-8?B?aDFxZkE1MWtPck1JaFpFcXY1L1E0RjZwTjFsUlFjV25tNm5kWWs2cDVBaFNV?=
 =?utf-8?B?UDJmbkJOU1VxSTg2bEREUCtydEdFcUdtejhuUWU5ckE3YXRtMEoxakJaVWsv?=
 =?utf-8?B?QUtkM0gwODYzaFhUMU4zVjkyaVJqUklGV25GZjYzNjlmRjVxUTN5SUUyVXhC?=
 =?utf-8?B?aThRVTc0V1pMVlVvamtKZ2tqb3dNbGZWZ3FHM3JYenMzQzZydG5vZGk0RU9a?=
 =?utf-8?B?V2VGS0VHbXNIalBZWnVmaHFYUEVnTCtLYnlKTVNVK0dZclh6b3pVb3RvdUxa?=
 =?utf-8?B?b3ZIN3dkZDc5ZHFZUFRRSTA1ODB3VUdxSzJpb012K21kUm9rWVkvcVh4KzlK?=
 =?utf-8?B?ZC9pZ3JFeTRIYjBSWEdNWFpGM0RNSDBNUmNvejZOZ3NXRzQybXNmMnU3eTR3?=
 =?utf-8?B?T1FKeDhiOEhGSVM0RjdiUVZ1SFNURW5sNk9pVEVzaVEyenVyS0VVZDc1NHVI?=
 =?utf-8?B?Z3RQYk1vMkVZL3ZSNHZLejhnYVBCNEtYdUJLTXFybFM3Sk5lNkpQeEhoVHpU?=
 =?utf-8?B?ZXBKMitwMHdWcWNhNEhYWkNCUnd6bmYzTzlFOGs5c3Vqekc3U1BoM3didHdo?=
 =?utf-8?B?VmNiR05xa29YdVRaWUVoY0tzL3JBVDA3OG91Q05TdVVKOHhvUnNtY2pSSTdz?=
 =?utf-8?B?aDF0TkFEL0RtSjZnQ1RNUXBjbk5NUUtjWW9kUVV1Y0lCL3k2MzU1TzQ4TVg2?=
 =?utf-8?B?NlhrcVQ5NlhXeGhvancweHNrN01QR1VmR2FPRlB0VlFKTGJTdDlNR3YxMXdK?=
 =?utf-8?B?Smc1YWttVitWeHkzRWYyZDZPSGc4cFlYQjlWamlBVDZ6RmVtVit0UVZ1UVcx?=
 =?utf-8?B?UzdEbSsrYnRBZStKNTh1Y3ZDZnhZVzJQZ0NpMGdubWZURGF3dld4R0RhaXMy?=
 =?utf-8?B?cmYzb0w1L1RsVkhpSDFzSGVpMFd4ZU1mMGdvUEl2dEk4MUtONFFSNHVDSnh0?=
 =?utf-8?B?UnJnemt5T1hZOVVnc0RmUGxpV2RodC9Fbm9yYU5ReUx3a3JtemZ5NmJVNDlp?=
 =?utf-8?B?TmhBNlpJMDEreXF1dWozV3VhMmx2Q0x3NHBNRmVYVmVZcklUZVM3ZjVTTjE0?=
 =?utf-8?B?KzBma1J2OWpEeVI5R29oQmc2QkJyOVhURElwcWN6ZGVFOHR2OTEyc3NwNk9X?=
 =?utf-8?B?NWgzN1BXbVFpa1k3NjhhemU1dWNMNzVlWVkrT1RRWE5UdFkrcW1yRGZsV2Vy?=
 =?utf-8?B?VVAySVl6TzFlWVFtNlkxY01FWUNtQWtISmh1Q3R1bjRIR3JMSUpPc0VIc3V3?=
 =?utf-8?B?U0h0M1RJZ082VWpxbnR6NU0rZnBmLzlYdUh6VEd0TlBwejl3d1VPUjVoaWZa?=
 =?utf-8?B?VGFjVk9OYXI4R2syeXdicm41WWRQYXNnMGhROEpQcWhuL3ZNK1ZZWnNFQ3dO?=
 =?utf-8?Q?PPRzEJ3YREi6m3Ki5cbcQet62?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ad0aea-0012-488c-a2bd-08dce764e695
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 06:46:13.2519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBqzhCZymY6dHiRX7rtepvO77DtsofxLClRU6BUuW5QTe44lNLlTotuON777WxbD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5812
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

Hi Sasha,

Am 04.10.24 um 20:17 schrieb Sasha Levin:
> From: Christian König <christian.koenig@amd.com>
>
> [ Upstream commit 7181faaa4703705939580abffaf9cb5d6b50dbb7 ]
>
> This was only used as workaround for recovering the page tables after
> VRAM was lost and is no longer necessary after the function
> amdgpu_vm_bo_reset_state_machine() started to do the same.
>
> Compute never used shadows either, so the only proplematic case left is
> SVM and that is most likely not recoverable in any way when VRAM is
> lost.

why is that backported to older kernels? It's basically just removing an 
old and now unused feature.

Lijo pointed out a related bug fixed by removing the feature, but that 
only happens extremely rarely and in my view doesn't really justify a 
backport.

Regards,
Christian.

>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Acked-by: Lijo Lazar <lijo.lazar@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h         |  4 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  | 87 +--------------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 67 +---------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  | 21 -----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 17 ----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c   | 56 +------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 19 +----
>   7 files changed, 6 insertions(+), 265 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 137a88b8de453..a1b2bf3db55b8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1091,10 +1091,6 @@ struct amdgpu_device {
>   
>   	struct amdgpu_virt	virt;
>   
> -	/* link all shadow bo */
> -	struct list_head                shadow_list;
> -	struct mutex                    shadow_list_lock;
> -
>   	/* record hw reset is performed */
>   	bool has_hw_reset;
>   	u8				reset_magic[AMDGPU_RESET_MAGIC_NUM];
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index bcacf2e35eba0..dfd468729d52b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4073,9 +4073,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   	spin_lock_init(&adev->mm_stats.lock);
>   	spin_lock_init(&adev->wb.lock);
>   
> -	INIT_LIST_HEAD(&adev->shadow_list);
> -	mutex_init(&adev->shadow_list_lock);
> -
>   	INIT_LIST_HEAD(&adev->reset_list);
>   
>   	INIT_LIST_HEAD(&adev->ras_list);
> @@ -4980,80 +4977,6 @@ static int amdgpu_device_ip_post_soft_reset(struct amdgpu_device *adev)
>   	return 0;
>   }
>   
> -/**
> - * amdgpu_device_recover_vram - Recover some VRAM contents
> - *
> - * @adev: amdgpu_device pointer
> - *
> - * Restores the contents of VRAM buffers from the shadows in GTT.  Used to
> - * restore things like GPUVM page tables after a GPU reset where
> - * the contents of VRAM might be lost.
> - *
> - * Returns:
> - * 0 on success, negative error code on failure.
> - */
> -static int amdgpu_device_recover_vram(struct amdgpu_device *adev)
> -{
> -	struct dma_fence *fence = NULL, *next = NULL;
> -	struct amdgpu_bo *shadow;
> -	struct amdgpu_bo_vm *vmbo;
> -	long r = 1, tmo;
> -
> -	if (amdgpu_sriov_runtime(adev))
> -		tmo = msecs_to_jiffies(8000);
> -	else
> -		tmo = msecs_to_jiffies(100);
> -
> -	dev_info(adev->dev, "recover vram bo from shadow start\n");
> -	mutex_lock(&adev->shadow_list_lock);
> -	list_for_each_entry(vmbo, &adev->shadow_list, shadow_list) {
> -		/* If vm is compute context or adev is APU, shadow will be NULL */
> -		if (!vmbo->shadow)
> -			continue;
> -		shadow = vmbo->shadow;
> -
> -		/* No need to recover an evicted BO */
> -		if (!shadow->tbo.resource ||
> -		    shadow->tbo.resource->mem_type != TTM_PL_TT ||
> -		    shadow->tbo.resource->start == AMDGPU_BO_INVALID_OFFSET ||
> -		    shadow->parent->tbo.resource->mem_type != TTM_PL_VRAM)
> -			continue;
> -
> -		r = amdgpu_bo_restore_shadow(shadow, &next);
> -		if (r)
> -			break;
> -
> -		if (fence) {
> -			tmo = dma_fence_wait_timeout(fence, false, tmo);
> -			dma_fence_put(fence);
> -			fence = next;
> -			if (tmo == 0) {
> -				r = -ETIMEDOUT;
> -				break;
> -			} else if (tmo < 0) {
> -				r = tmo;
> -				break;
> -			}
> -		} else {
> -			fence = next;
> -		}
> -	}
> -	mutex_unlock(&adev->shadow_list_lock);
> -
> -	if (fence)
> -		tmo = dma_fence_wait_timeout(fence, false, tmo);
> -	dma_fence_put(fence);
> -
> -	if (r < 0 || tmo <= 0) {
> -		dev_err(adev->dev, "recover vram bo from shadow failed, r is %ld, tmo is %ld\n", r, tmo);
> -		return -EIO;
> -	}
> -
> -	dev_info(adev->dev, "recover vram bo from shadow done\n");
> -	return 0;
> -}
> -
> -
>   /**
>    * amdgpu_device_reset_sriov - reset ASIC for SR-IOV vf
>    *
> @@ -5116,12 +5039,8 @@ static int amdgpu_device_reset_sriov(struct amdgpu_device *adev,
>   	if (r)
>   		return r;
>   
> -	if (adev->virt.gim_feature & AMDGIM_FEATURE_GIM_FLR_VRAMLOST) {
> +	if (adev->virt.gim_feature & AMDGIM_FEATURE_GIM_FLR_VRAMLOST)
>   		amdgpu_inc_vram_lost(adev);
> -		r = amdgpu_device_recover_vram(adev);
> -	}
> -	if (r)
> -		return r;
>   
>   	/* need to be called during full access so we can't do it later like
>   	 * bare-metal does.
> @@ -5541,9 +5460,7 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
>   			}
>   		}
>   
> -		if (!r)
> -			r = amdgpu_device_recover_vram(tmp_adev);
> -		else
> +		if (r)
>   			tmp_adev->asic_reset_res = r;
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index e32161f6b67a3..a987f671b1d53 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -77,24 +77,6 @@ static void amdgpu_bo_user_destroy(struct ttm_buffer_object *tbo)
>   	amdgpu_bo_destroy(tbo);
>   }
>   
> -static void amdgpu_bo_vm_destroy(struct ttm_buffer_object *tbo)
> -{
> -	struct amdgpu_device *adev = amdgpu_ttm_adev(tbo->bdev);
> -	struct amdgpu_bo *shadow_bo = ttm_to_amdgpu_bo(tbo), *bo;
> -	struct amdgpu_bo_vm *vmbo;
> -
> -	bo = shadow_bo->parent;
> -	vmbo = to_amdgpu_bo_vm(bo);
> -	/* in case amdgpu_device_recover_vram got NULL of bo->parent */
> -	if (!list_empty(&vmbo->shadow_list)) {
> -		mutex_lock(&adev->shadow_list_lock);
> -		list_del_init(&vmbo->shadow_list);
> -		mutex_unlock(&adev->shadow_list_lock);
> -	}
> -
> -	amdgpu_bo_destroy(tbo);
> -}
> -
>   /**
>    * amdgpu_bo_is_amdgpu_bo - check if the buffer object is an &amdgpu_bo
>    * @bo: buffer object to be checked
> @@ -108,8 +90,7 @@ static void amdgpu_bo_vm_destroy(struct ttm_buffer_object *tbo)
>   bool amdgpu_bo_is_amdgpu_bo(struct ttm_buffer_object *bo)
>   {
>   	if (bo->destroy == &amdgpu_bo_destroy ||
> -	    bo->destroy == &amdgpu_bo_user_destroy ||
> -	    bo->destroy == &amdgpu_bo_vm_destroy)
> +	    bo->destroy == &amdgpu_bo_user_destroy)
>   		return true;
>   
>   	return false;
> @@ -722,52 +703,6 @@ int amdgpu_bo_create_vm(struct amdgpu_device *adev,
>   	return r;
>   }
>   
> -/**
> - * amdgpu_bo_add_to_shadow_list - add a BO to the shadow list
> - *
> - * @vmbo: BO that will be inserted into the shadow list
> - *
> - * Insert a BO to the shadow list.
> - */
> -void amdgpu_bo_add_to_shadow_list(struct amdgpu_bo_vm *vmbo)
> -{
> -	struct amdgpu_device *adev = amdgpu_ttm_adev(vmbo->bo.tbo.bdev);
> -
> -	mutex_lock(&adev->shadow_list_lock);
> -	list_add_tail(&vmbo->shadow_list, &adev->shadow_list);
> -	vmbo->shadow->parent = amdgpu_bo_ref(&vmbo->bo);
> -	vmbo->shadow->tbo.destroy = &amdgpu_bo_vm_destroy;
> -	mutex_unlock(&adev->shadow_list_lock);
> -}
> -
> -/**
> - * amdgpu_bo_restore_shadow - restore an &amdgpu_bo shadow
> - *
> - * @shadow: &amdgpu_bo shadow to be restored
> - * @fence: dma_fence associated with the operation
> - *
> - * Copies a buffer object's shadow content back to the object.
> - * This is used for recovering a buffer from its shadow in case of a gpu
> - * reset where vram context may be lost.
> - *
> - * Returns:
> - * 0 for success or a negative error code on failure.
> - */
> -int amdgpu_bo_restore_shadow(struct amdgpu_bo *shadow, struct dma_fence **fence)
> -
> -{
> -	struct amdgpu_device *adev = amdgpu_ttm_adev(shadow->tbo.bdev);
> -	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> -	uint64_t shadow_addr, parent_addr;
> -
> -	shadow_addr = amdgpu_bo_gpu_offset(shadow);
> -	parent_addr = amdgpu_bo_gpu_offset(shadow->parent);
> -
> -	return amdgpu_copy_buffer(ring, shadow_addr, parent_addr,
> -				  amdgpu_bo_size(shadow), NULL, fence,
> -				  true, false, 0);
> -}
> -
>   /**
>    * amdgpu_bo_kmap - map an &amdgpu_bo buffer object
>    * @bo: &amdgpu_bo buffer object to be mapped
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> index bc42ccbde659a..a4fa1f296daec 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -130,8 +130,6 @@ struct amdgpu_bo_user {
>   
>   struct amdgpu_bo_vm {
>   	struct amdgpu_bo		bo;
> -	struct amdgpu_bo		*shadow;
> -	struct list_head		shadow_list;
>   	struct amdgpu_vm_bo_base        entries[];
>   };
>   
> @@ -269,22 +267,6 @@ static inline bool amdgpu_bo_encrypted(struct amdgpu_bo *bo)
>   	return bo->flags & AMDGPU_GEM_CREATE_ENCRYPTED;
>   }
>   
> -/**
> - * amdgpu_bo_shadowed - check if the BO is shadowed
> - *
> - * @bo: BO to be tested.
> - *
> - * Returns:
> - * NULL if not shadowed or else return a BO pointer.
> - */
> -static inline struct amdgpu_bo *amdgpu_bo_shadowed(struct amdgpu_bo *bo)
> -{
> -	if (bo->tbo.type == ttm_bo_type_kernel)
> -		return to_amdgpu_bo_vm(bo)->shadow;
> -
> -	return NULL;
> -}
> -
>   bool amdgpu_bo_is_amdgpu_bo(struct ttm_buffer_object *bo);
>   void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain);
>   
> @@ -343,9 +325,6 @@ u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo);
>   u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo);
>   void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
>   			  struct amdgpu_mem_stats *stats);
> -void amdgpu_bo_add_to_shadow_list(struct amdgpu_bo_vm *vmbo);
> -int amdgpu_bo_restore_shadow(struct amdgpu_bo *shadow,
> -			     struct dma_fence **fence);
>   uint32_t amdgpu_bo_get_preferred_domain(struct amdgpu_device *adev,
>   					    uint32_t domain);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index a060c28f0877c..8cda1d02dade3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -465,7 +465,6 @@ int amdgpu_vm_validate(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   {
>   	uint64_t new_vm_generation = amdgpu_vm_generation(adev, vm);
>   	struct amdgpu_vm_bo_base *bo_base;
> -	struct amdgpu_bo *shadow;
>   	struct amdgpu_bo *bo;
>   	int r;
>   
> @@ -486,16 +485,10 @@ int amdgpu_vm_validate(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   		spin_unlock(&vm->status_lock);
>   
>   		bo = bo_base->bo;
> -		shadow = amdgpu_bo_shadowed(bo);
>   
>   		r = validate(param, bo);
>   		if (r)
>   			return r;
> -		if (shadow) {
> -			r = validate(param, shadow);
> -			if (r)
> -				return r;
> -		}
>   
>   		if (bo->tbo.type != ttm_bo_type_kernel) {
>   			amdgpu_vm_bo_moved(bo_base);
> @@ -2123,10 +2116,6 @@ void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,
>   {
>   	struct amdgpu_vm_bo_base *bo_base;
>   
> -	/* shadow bo doesn't have bo base, its validation needs its parent */
> -	if (bo->parent && (amdgpu_bo_shadowed(bo->parent) == bo))
> -		bo = bo->parent;
> -
>   	for (bo_base = bo->vm_bo; bo_base; bo_base = bo_base->next) {
>   		struct amdgpu_vm *vm = bo_base->vm;
>   
> @@ -2454,7 +2443,6 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   	root_bo = amdgpu_bo_ref(&root->bo);
>   	r = amdgpu_bo_reserve(root_bo, true);
>   	if (r) {
> -		amdgpu_bo_unref(&root->shadow);
>   		amdgpu_bo_unref(&root_bo);
>   		goto error_free_delayed;
>   	}
> @@ -2546,11 +2534,6 @@ int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>   	vm->last_update = dma_fence_get_stub();
>   	vm->is_compute_context = true;
>   
> -	/* Free the shadow bo for compute VM */
> -	amdgpu_bo_unref(&to_amdgpu_bo_vm(vm->root.bo)->shadow);
> -
> -	goto unreserve_bo;
> -
>   unreserve_bo:
>   	amdgpu_bo_unreserve(vm->root.bo);
>   	return r;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> index e39d6e7643bfb..c8e0b8cfd3363 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> @@ -383,14 +383,6 @@ int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   	if (r)
>   		return r;
>   
> -	if (vmbo->shadow) {
> -		struct amdgpu_bo *shadow = vmbo->shadow;
> -
> -		r = ttm_bo_validate(&shadow->tbo, &shadow->placement, &ctx);
> -		if (r)
> -			return r;
> -	}
> -
>   	if (!drm_dev_enter(adev_to_drm(adev), &idx))
>   		return -ENODEV;
>   
> @@ -448,10 +440,7 @@ int amdgpu_vm_pt_create(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   			int32_t xcp_id)
>   {
>   	struct amdgpu_bo_param bp;
> -	struct amdgpu_bo *bo;
> -	struct dma_resv *resv;
>   	unsigned int num_entries;
> -	int r;
>   
>   	memset(&bp, 0, sizeof(bp));
>   
> @@ -484,42 +473,7 @@ int amdgpu_vm_pt_create(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   	if (vm->root.bo)
>   		bp.resv = vm->root.bo->tbo.base.resv;
>   
> -	r = amdgpu_bo_create_vm(adev, &bp, vmbo);
> -	if (r)
> -		return r;
> -
> -	bo = &(*vmbo)->bo;
> -	if (vm->is_compute_context || (adev->flags & AMD_IS_APU)) {
> -		(*vmbo)->shadow = NULL;
> -		return 0;
> -	}
> -
> -	if (!bp.resv)
> -		WARN_ON(dma_resv_lock(bo->tbo.base.resv,
> -				      NULL));
> -	resv = bp.resv;
> -	memset(&bp, 0, sizeof(bp));
> -	bp.size = amdgpu_vm_pt_size(adev, level);
> -	bp.domain = AMDGPU_GEM_DOMAIN_GTT;
> -	bp.flags = AMDGPU_GEM_CREATE_CPU_GTT_USWC;
> -	bp.type = ttm_bo_type_kernel;
> -	bp.resv = bo->tbo.base.resv;
> -	bp.bo_ptr_size = sizeof(struct amdgpu_bo);
> -	bp.xcp_id_plus1 = xcp_id + 1;
> -
> -	r = amdgpu_bo_create(adev, &bp, &(*vmbo)->shadow);
> -
> -	if (!resv)
> -		dma_resv_unlock(bo->tbo.base.resv);
> -
> -	if (r) {
> -		amdgpu_bo_unref(&bo);
> -		return r;
> -	}
> -
> -	amdgpu_bo_add_to_shadow_list(*vmbo);
> -
> -	return 0;
> +	return amdgpu_bo_create_vm(adev, &bp, vmbo);
>   }
>   
>   /**
> @@ -569,7 +523,6 @@ static int amdgpu_vm_pt_alloc(struct amdgpu_device *adev,
>   	return 0;
>   
>   error_free_pt:
> -	amdgpu_bo_unref(&pt->shadow);
>   	amdgpu_bo_unref(&pt_bo);
>   	return r;
>   }
> @@ -581,17 +534,10 @@ static int amdgpu_vm_pt_alloc(struct amdgpu_device *adev,
>    */
>   static void amdgpu_vm_pt_free(struct amdgpu_vm_bo_base *entry)
>   {
> -	struct amdgpu_bo *shadow;
> -
>   	if (!entry->bo)
>   		return;
>   
>   	entry->bo->vm_bo = NULL;
> -	shadow = amdgpu_bo_shadowed(entry->bo);
> -	if (shadow) {
> -		ttm_bo_set_bulk_move(&shadow->tbo, NULL);
> -		amdgpu_bo_unref(&shadow);
> -	}
>   	ttm_bo_set_bulk_move(&entry->bo->tbo, NULL);
>   
>   	spin_lock(&entry->vm->status_lock);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> index 9b748d7058b5c..390432a22ddd5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> @@ -35,16 +35,7 @@
>    */
>   static int amdgpu_vm_sdma_map_table(struct amdgpu_bo_vm *table)
>   {
> -	int r;
> -
> -	r = amdgpu_ttm_alloc_gart(&table->bo.tbo);
> -	if (r)
> -		return r;
> -
> -	if (table->shadow)
> -		r = amdgpu_ttm_alloc_gart(&table->shadow->tbo);
> -
> -	return r;
> +	return amdgpu_ttm_alloc_gart(&table->bo.tbo);
>   }
>   
>   /* Allocate a new job for @count PTE updates */
> @@ -273,17 +264,13 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
>   
>   		if (!p->pages_addr) {
>   			/* set page commands needed */
> -			if (vmbo->shadow)
> -				amdgpu_vm_sdma_set_ptes(p, vmbo->shadow, pe, addr,
> -							count, incr, flags);
>   			amdgpu_vm_sdma_set_ptes(p, bo, pe, addr, count,
>   						incr, flags);
>   			return 0;
>   		}
>   
>   		/* copy commands needed */
> -		ndw -= p->adev->vm_manager.vm_pte_funcs->copy_pte_num_dw *
> -			(vmbo->shadow ? 2 : 1);
> +		ndw -= p->adev->vm_manager.vm_pte_funcs->copy_pte_num_dw;
>   
>   		/* for padding */
>   		ndw -= 7;
> @@ -298,8 +285,6 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
>   			pte[i] |= flags;
>   		}
>   
> -		if (vmbo->shadow)
> -			amdgpu_vm_sdma_copy_ptes(p, vmbo->shadow, pe, nptes);
>   		amdgpu_vm_sdma_copy_ptes(p, bo, pe, nptes);
>   
>   		pe += nptes * 8;

