Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A52B40699
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16EC10E769;
	Tue,  2 Sep 2025 14:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="c08AC9+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EDE10E758
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 14:23:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A82xUGZbkUFoBQ36R4ZwNqs1B3mKxS4yZrNA5ECSSKcGFa5uFMcQauAG5l1Kz5ydVh2UpCUGdfE4yrdNxlcOKKBSiygt2oDQmzRxUMY9YeOPn0KuRaHDKq25tktS5C6kurfdK/JUNCNkyXaDbQK8iNoaJGNpwqdj1ZiSB4FlbjFkpxhEZylISvrPjLoKcze02CXVbqPA9hut901IETpavUSonkkJ5UF9gb6ceQssCSAfZQ6yDx/vo/fXKn1n7/cK/kIhu6il7TySZczipH7nHIwbX34eelV6p3u5XpChDjR1IRq5oK2BqEVmP66HKpPS1fAElFT7BfTmGhd8LqxVEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAeT+u+JEB0dWNJaYx/lo/AF+Pcg+YQ4ESoCCz7StdY=;
 b=VD7h7vikQ50tgWvsO4dAX6ZdJPZ5J6ntxVmDy/QQ5Oi1dPn2hK/WRmCs9blD+VPqAeeJvXuiHSXQh5wPifBJAyiWgmqrrfR6ECF9PYS3Dyc0oJjVjkKFUGmgSvU9/dyxO8VSm7XgCsg5FvlUnhFtt3GChvEyt6UpDDsKUY7L8rqq2Nk0BbeM2hz9xjIzkhzJDr6Dq7KiJV+xjDRz0jHZbSoqOkhw/2LNT19aXTjoYyqPU4dPYKdP6QDcxqp7g31fFUQ02dvyTp7Wbmu5UWG4as5ZW2fKdqSX6kkpJOV62H57Tcq2Mo1zKNfQt5zQvxb2wVH4bisXhLVi/YHgLP05SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAeT+u+JEB0dWNJaYx/lo/AF+Pcg+YQ4ESoCCz7StdY=;
 b=c08AC9+91DnZYq6JIX3K6Ovu5GXRmuPt10IcZqpIIbQrrOq+i967znRU5H72rhs3xwustWWFI10r2UDi/cRvBC4edN74xr6jgOkWZYhiWPdhdvew32EQ06bsHgXQL9QmriDTXBP089onVjS0WNJ/I7NlczWQ3dwZF2RjdjFOXX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8172.namprd12.prod.outlook.com (2603:10b6:806:352::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 14:23:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9073.021; Tue, 2 Sep 2025
 14:23:37 +0000
Message-ID: <4e462912-64de-461c-8c4b-204e6f58dde8@amd.com>
Date: Tue, 2 Sep 2025 16:23:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] ttm/pool: enable memcg tracking and shrinker. (v2)
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20250902041024.2040450-1-airlied@gmail.com>
 <20250902041024.2040450-12-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250902041024.2040450-12-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: ba36c10e-9d00-4d43-8218-08ddea2c4e19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkFmSEt5ampvMU9uSk1VaGoyeXJtMTU2QjhWRGlFS3dyQUg1K3ppREUxRWpB?=
 =?utf-8?B?bHIrWnFOcEpNQWRqcGNWaklPd0FyOTJpWE1iNXJkeER6THVyRjI2MnNKa0FD?=
 =?utf-8?B?VTRTMWhUanFaVmhvOHZwKzQ2SUo0czU1MnlaZEZDSmU3YWc5dlN6Qzgyb2dH?=
 =?utf-8?B?UDVqZENXamZPSXRkc1N3NEhhYXRFeHprUFhwMVovUmhLdW5DeHNiVzM2Z1F4?=
 =?utf-8?B?SG9STUsxT3Q5bnVzVVFEcjU2WlRyQmxYR1Q5RE5WcFdwc2pvUStxRUZtTGRt?=
 =?utf-8?B?NnJxWWhXVWY5L2dsenBIamgzcFFJTUtTM0V6VXFCY2xFeWpiT3JXUzhFZHhL?=
 =?utf-8?B?aXFCR2p1Y1BXUkRoUHZjdjRTT3Zld0ZsK0pIbFpjaGVMdGtLV1AvWFNpSEdu?=
 =?utf-8?B?RHpESjNBQ25laFFZbERUdEhTVytUeHFhOHRNVEJ4MEgwK2hmd1RTbDNRYy8x?=
 =?utf-8?B?NFdqbjBseFZRVWFOWU5XZ2c2b01Bam9kVm9PMkRHblRFTDRUdHczUzhSRGlN?=
 =?utf-8?B?aUFvb3pPTjZzUFFMbFJRbnNsd29qZFA1NE1kdS9OMW5keHdrZnI3MkMxRytK?=
 =?utf-8?B?aFhMRW9CbDY2KzJLWVRlZ0lEV2oySTE4UU52bDFNWC9OL1hocnVodU5tVTZ5?=
 =?utf-8?B?MUV2WkVIUmpnTzVKS2NUbTJlQ1RtQ0YxcDBhc0dHRTBZTWZ3aWZWMXVGd09Z?=
 =?utf-8?B?Snp6aG1jNkt6MGwwc29HdFBkVlZER295R2lYOHZiQmVDSzBIRlJJYyszT0xj?=
 =?utf-8?B?K0JUY3NxWmxtdVM0ME5iTHdIWjhyd2ZFU09oM0NuUmJCR29vWndaSmdMYnl1?=
 =?utf-8?B?L2p0WCt5aUdCbVBMNms2QjE2bSt1c2tRdVhLWEtncnFMRVp2RGNFSlM3R2tt?=
 =?utf-8?B?b2hmL2l3RFQrL0VVWCtLS05EWk4ySUkvdjhsS0phT2U5RTlnUVVFUWlnQzBR?=
 =?utf-8?B?ZHpjVVVPOG9IaVNFeHZRVHBIMGpSczVFSlBXU3hjWWdGSHF4RkwwMHExRzh3?=
 =?utf-8?B?UDd1SHRGTHlTM29lekVaYzZkWlAvVzhoR2gySjZ1TG11Uy9oMHVzNE5PQ1d4?=
 =?utf-8?B?YVdYVUZDTVB5UDRzRzlPRDYwRWpMdEw4MThlR0MwbVoyQzQ0TUZyZUZYUjNR?=
 =?utf-8?B?cnVzU240QVFuODl6bWgvekUxTVNybXFBQytWK0s4Mk44RnFiQk53SlpVQ3Bl?=
 =?utf-8?B?Si9GdEp3V2R3alNVTXBtTGFEU0ExcGdRM1ZUVExReFVRb2JkeTFoeTlZNkVs?=
 =?utf-8?B?MUU0TmdFM2hlNW1PZk9HNmlzNnRwZmFpdTc2cXVRd2hMRS9jOGYyODdQeUxy?=
 =?utf-8?B?dWZQS2czYytHakVweDdUTzFLclNWYVpTdmw2SGJqUVpuMGJGOTFnZTJUWHBQ?=
 =?utf-8?B?Rjh2QS9STUxWbjZ6ZDhPRnozZ0xDVzI3bTdNL2tIdWpYdjNjNEhKRXN4QUI4?=
 =?utf-8?B?OFp3a0V0MThEL0RvZFdTSEdTbFhLaktUU2FGU1BEd0I2bmJRd3FobkVBU0w4?=
 =?utf-8?B?MEY0VThnVW5nZDlrdGU1RGh4MXI2dERXbTBRbVZhdjJ6cEJ2alpWbXMrUy8v?=
 =?utf-8?B?S1pqQzVCSzAvVUp0VjhoV0RvR3NzQ0duZHFuUHRsQ29uOG8vd1EvTjJRYURK?=
 =?utf-8?B?Z0Rxc1A5OElGY0srQndFUE5ESzZRV25TSUFTT2t4UmpZUzI0U3Jnd0REbVlB?=
 =?utf-8?B?V1hEZEFWbjUyc1k3MmE1U3V6MndORlBZbG40UXFldmdsbk5QdlVwcmV5VTQ2?=
 =?utf-8?B?QmVNcTZqc2hpZk95UFREVTZjVzRTM0ZHYXg0ZnJGSURWQ0VnTGxGV0NEa3BS?=
 =?utf-8?B?alFzejYyc1JYTElGWjRkZDFrQW5vcHpXZytzQ1JyZVNqb2oxZWVRQmZBTXNG?=
 =?utf-8?B?Zmxpem5OOHdJa3NhMElVaXIvRVhaZzZESm13eUtkc3JuL1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVg3SnRpZVVBbzIvZEFEZTRLdTNEa1prSGlBOGRkbUNJSndLZ0NlVHRkcHBl?=
 =?utf-8?B?dmY3SW1QQUJZMkxhd3VmbitLK0Q5VFloVDZXVWQ1WW05clZsZkNBSUNneUxR?=
 =?utf-8?B?QldORVNtc3VMaTkvNFNrTjRNNHdzZjZoU3F4UUR2VjBQczN1dTZ4Q3h3YXV3?=
 =?utf-8?B?UUU4QXdZc1hhZGpCR1VzSE1UMS9UL3JiSkN4WlVWaFJRbVB3MVViV04zeGFZ?=
 =?utf-8?B?b2JLMWJkNk1sQmlmT2Z0U2FRVkdHenlna0dkYWZtR3pvQjhteVF4bFFSM0Ju?=
 =?utf-8?B?YmhpTC8yY09paWhadHhmNkF2L1o1OEdIOVZsazlDcVh0VTBvRnZOTWIzTlFl?=
 =?utf-8?B?SW5rWVNVUXVQWWMzTmtaRTVjWHJGSWFsVmtKMVJ1bGZYUmR4R2twRWxhc1Q0?=
 =?utf-8?B?TzhTOHgvcHMyaEIvL1o3Wlp1RjAyZVFHT1h6aktIY3RPS3dKMVNBYnhGT3Ur?=
 =?utf-8?B?dDlNdkNrcnp4T2cxZ3cyenpUL0k2RWJNeG9LVXVLZlZ2VjVLaDRrdS9iQXpi?=
 =?utf-8?B?TlVTOTdpNXRHYjRtWVFNWnphWkR1eWdZTElaNUZERDZyNnFXbTR6d1NVazZC?=
 =?utf-8?B?Y0prWm5zbnUyeGJibXE0NGRYZ1FoSjJNRTJJVkNIZlFSWnJRN01uRTBvUGVC?=
 =?utf-8?B?dDcrUkhuQUpVZytUNkV6SDEyci9BbnIvZkhLdG5HWG5qYTRzMDF1UTluMGs4?=
 =?utf-8?B?R1Y2Q1NuMmRaZ3RqR2pKNk9nSzgwaTdYcmZkVm9ickdhQUEvOE1ZSndpSDlN?=
 =?utf-8?B?ZGcwWFY5ODFia0htQ3lJMmY1NGxqVHA5MWYyNkQwdnNGa0M3VXh2Q2JGZFlZ?=
 =?utf-8?B?bWY5YkRYRWJGZURkcjNaY0JXTlM0NTFoWHk1NlEvKzRjRTIxdjhqR3NEaGlu?=
 =?utf-8?B?YjBtbmZNSkM0aXlBbmJWaFVHTFNLV013QlFOU1NjT29XQW9wSFVITlF2RFlN?=
 =?utf-8?B?ano2YlFYSWVERU1Kd1NqMGJuQ2l4bGR1VmlBdGJYYy8xYXBTOU5ROXc1MVhG?=
 =?utf-8?B?UlNnTE9oTkJFeXVSa0M4cUNGY3UwbUdxM0t6b0VNbnJ6dW1FcTMzNU52dDdw?=
 =?utf-8?B?ZUlhSU11VUR3U1RlbXMwWVF2NFMzMGh4b0JZQmdicEFWaU9kVDU1SmdxZWlo?=
 =?utf-8?B?Y3M2MFVGQ1BmODlSbmpzNkFEMFE0NXJPaEZWN0NxY21yS1JMNVJNcE1VUFpz?=
 =?utf-8?B?TDhrL0lodjZlN0g1YTVDeTVqdDZSSDQ0cVBRSEdmRmxkMmhHTXFWNldFOE5q?=
 =?utf-8?B?anFVN3VLSnBoK0xPSWRiTnVYamZtM25qSXAyM1g3K3lQa2p5ekNJaCtnZmVl?=
 =?utf-8?B?bG5YTkR1eHF2bVIzS3ZQM1dOR05KcUJUc0VUblR1MmZZeEZoNlY1ZE5HSnQx?=
 =?utf-8?B?SzBzcjVacStKMGxNNzB4OERwSmZRRXVXMkpEYUM5SmVkWkVvVkpLVHpJOFh1?=
 =?utf-8?B?QVp1dTVwRGE3VUUySzFKV3plNHp4NWJJeFJZbHl0R2wyT2dBYUpLOTA1UlF3?=
 =?utf-8?B?emlvTU1vSG5LS2c2Q0dNd0ZWREpWQnZYRFBIb2Z0cFd0MmRUYVY0NzBKc0Ex?=
 =?utf-8?B?YTVnZkEvRmd5SzBwWHZmRTUxNnVYOW93emdyL3lRR1RTWnRCTjFXQzJCNnRo?=
 =?utf-8?B?enZkV0grcUdxekN1aUhrZ1Y0YVFDVTFBU014VHo4LzlFc3pWVWVFM0czWEZ5?=
 =?utf-8?B?UVJaZTVXd1k0T3g2OUdvUTJNLzV0cEpzK1BmMmZWY3pCRmpkWG5YZUZLNGFk?=
 =?utf-8?B?Z3FFWFArQlp1VXJNSlpKbkxvUml4UkdUc211SzVMaDNON050L3gyQ0duN0Zo?=
 =?utf-8?B?Ni9ZVkNlNlpCYUhKN0ZDRFk1d3dWUFlUa0tnT2pQN1QycUlMRFhlNzBKbUZJ?=
 =?utf-8?B?M2VCcEMyR0xsS2tsWXFxYndSUnp6MmR0Mkc4YkQrZU9GU2ZnS3Z4UXJnc3Vk?=
 =?utf-8?B?OTBsVTdXSDh0NkQwU0tJczNuQ2xtcGRCQWpjUE9oVHZHS2pFRmpXUkN2U3Y1?=
 =?utf-8?B?U0diR3cvNnhGUnVHY1BMVTVNZDd6UVc2bG56QVA1S3plL3JPQnViVUYzdStO?=
 =?utf-8?B?bGQrOEZTT2tab2tvVU1QeWw0QzkxNjVpT2hYY1V6TXJIUzcvcGU4UGZuTkVm?=
 =?utf-8?Q?ic4uG8vmhSLm8WOZNNycVfpPD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba36c10e-9d00-4d43-8218-08ddea2c4e19
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:23:36.9543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DPu9mxwaEcaPSz1vht6oW2dvgR/hB377K+V06TW1F0QDmciasI5UuXCPQAPaQuR0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8172
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

On 02.09.25 06:06, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This enables all the backend code to use the list lru in memcg mode,
> and set the shrinker to be memcg aware.
> 
> It adds the loop case for when pooled pages end up being reparented
> to a higher memcg group, that newer memcg can search for them there
> and take them back.

I can only repeat that as far as I can see that makes no sense at all.

This just enables stealing pages from the page pool per cgroup and won't give them back if another cgroup runs into a low memery situation.

Maybe Thomas and the XE guys have an use case for that, but as far as I can see that behavior is not something we would ever want.

Regards,
Christian.

> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> 
> ---
> v2: just use the proper stats.
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 127 ++++++++++++++++++++++++++-------
>  mm/list_lru.c                  |   1 +
>  2 files changed, 104 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 2c9969de7517..1e6da2cc1f06 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -142,7 +142,9 @@ static int ttm_pool_nid(struct ttm_pool *pool) {
>  }
>  
>  /* Allocate pages of size 1 << order with the given gfp_flags */
> -static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
> +static struct page *ttm_pool_alloc_page(struct ttm_pool *pool,
> +					struct obj_cgroup *objcg,
> +					gfp_t gfp_flags,
>  					unsigned int order)
>  {
>  	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
> @@ -162,7 +164,10 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>  		p = alloc_pages_node(pool->nid, gfp_flags, order);
>  		if (p) {
>  			p->private = order;
> -			mod_lruvec_page_state(p, NR_GPU_ACTIVE, 1 << order);
> +			if (!mem_cgroup_charge_gpu_page(objcg, p, order, gfp_flags, false)) {
> +				__free_pages(p, order);
> +				return NULL;
> +			}
>  		}
>  		return p;
>  	}
> @@ -213,8 +218,7 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>  #endif
>  
>  	if (!pool || !pool->use_dma_alloc) {
> -		mod_lruvec_page_state(p, reclaim ? NR_GPU_RECLAIM : NR_GPU_ACTIVE,
> -				      -(1 << order));
> +		mem_cgroup_uncharge_gpu_page(p, order, reclaim);
>  		__free_pages(p, order);
>  		return;
>  	}
> @@ -301,12 +305,11 @@ static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
>  
>  	INIT_LIST_HEAD(&p->lru);
>  	rcu_read_lock();
> -	list_lru_add(&pt->pages, &p->lru, nid, NULL);
> +	list_lru_add(&pt->pages, &p->lru, nid, page_memcg_check(p));
>  	rcu_read_unlock();
>  
> -	atomic_long_add(num_pages, &allocated_pages[nid]);	
> -	mod_lruvec_page_state(p, NR_GPU_ACTIVE, -num_pages);
> -	mod_lruvec_page_state(p, NR_GPU_RECLAIM, num_pages);
> +	atomic_long_add(num_pages, &allocated_pages[nid]);
> +	mem_cgroup_move_gpu_page_reclaim(NULL, p, pt->order, true);
>  }
>  
>  static enum lru_status take_one_from_lru(struct list_head *item,
> @@ -321,20 +324,56 @@ static enum lru_status take_one_from_lru(struct list_head *item,
>  	return LRU_REMOVED;
>  }
>  
> -/* Take pages from a specific pool_type, return NULL when nothing available */
> -static struct page *ttm_pool_type_take(struct ttm_pool_type *pt, int nid)
> +static int pool_lru_get_page(struct ttm_pool_type *pt, int nid,
> +			     struct page **page_out,
> +			     struct obj_cgroup *objcg,
> +			     struct mem_cgroup *memcg)
>  {
>  	int ret;
>  	struct page *p = NULL;
>  	unsigned long nr_to_walk = 1;
> +	unsigned int num_pages = 1 << pt->order;
>  
> -	ret = list_lru_walk_node(&pt->pages, nid, take_one_from_lru, (void *)&p, &nr_to_walk);
> +	ret = list_lru_walk_one(&pt->pages, nid, memcg, take_one_from_lru, (void *)&p, &nr_to_walk);
>  	if (ret == 1 && p) {
> -		atomic_long_sub(1 << pt->order, &allocated_pages[nid]);
> -		mod_lruvec_page_state(p, NR_GPU_ACTIVE, (1 << pt->order));
> -		mod_lruvec_page_state(p, NR_GPU_RECLAIM, -(1 << pt->order));		
> +		atomic_long_sub(num_pages, &allocated_pages[nid]);
> +
> +		if (!mem_cgroup_move_gpu_page_reclaim(objcg, p, pt->order, false)) {
> +			__free_pages(p, pt->order);
> +			p = NULL;
> +		}
>  	}
> -	return p;
> +	*page_out = p;
> +	return ret;
> +}
> +
> +/* Take pages from a specific pool_type, return NULL when nothing available */
> +static struct page *ttm_pool_type_take(struct ttm_pool_type *pt, int nid,
> +				       struct obj_cgroup *orig_objcg)
> +{
> +	struct page *page_out = NULL;
> +	int ret;
> +	struct mem_cgroup *orig_memcg = orig_objcg ? get_mem_cgroup_from_objcg(orig_objcg) : NULL;
> +	struct mem_cgroup *memcg = orig_memcg;
> +
> +	/*
> +	 * Attempt to get a page from the current memcg, but if it hasn't got any in it's level,
> +	 * go up to the parent and check there. This helps the scenario where multiple apps get
> +	 * started into their own cgroup from a common parent and want to reuse the pools.
> +	 */
> +	while (!page_out) {
> +		ret = pool_lru_get_page(pt, nid, &page_out, orig_objcg, memcg);
> +		if (ret == 1)
> +			break;
> +		if (!memcg)
> +			break;
> +		memcg = parent_mem_cgroup(memcg);
> +		if (!memcg)
> +			break;
> +	}
> +
> +	mem_cgroup_put(orig_memcg);
> +	return page_out;
>  }
>  
>  /* Initialize and add a pool type to the global shrinker list */
> @@ -344,7 +383,7 @@ static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
>  	pt->pool = pool;
>  	pt->caching = caching;
>  	pt->order = order;
> -	list_lru_init(&pt->pages);
> +	list_lru_init_memcg(&pt->pages, mm_shrinker);
>  
>  	spin_lock(&shrinker_lock);
>  	list_add_tail(&pt->shrinker_list, &shrinker_list);
> @@ -387,6 +426,30 @@ static void ttm_pool_type_fini(struct ttm_pool_type *pt)
>  	ttm_pool_dispose_list(pt, &dispose);
>  }
>  
> +static int ttm_pool_check_objcg(struct obj_cgroup *objcg)
> +{
> +#ifdef CONFIG_MEMCG
> +	int r = 0;
> +	struct mem_cgroup *memcg;
> +	if (!objcg)
> +		return 0;
> +
> +	memcg = get_mem_cgroup_from_objcg(objcg);
> +	for (unsigned i = 0; i < NR_PAGE_ORDERS; i++) {
> +		r = memcg_list_lru_alloc(memcg, &global_write_combined[i].pages, GFP_KERNEL);
> +		if (r) {
> +			break;
> +		}
> +		r = memcg_list_lru_alloc(memcg, &global_uncached[i].pages, GFP_KERNEL);
> +		if (r) {
> +			break;
> +		}
> +	}
> +	mem_cgroup_put(memcg);
> +#endif
> +	return 0;
> +}
> +
>  /* Return the pool_type to use for the given caching and order */
>  static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>  						  enum ttm_caching caching,
> @@ -416,7 +479,9 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>  }
>  
>  /* Free pages using the per-node shrinker list */
> -static unsigned int ttm_pool_shrink(int nid, unsigned long num_to_free)
> +static unsigned int ttm_pool_shrink(int nid,
> +				    struct mem_cgroup *memcg,
> +				    unsigned long num_to_free)
>  {
>  	LIST_HEAD(dispose);
>  	struct ttm_pool_type *pt;
> @@ -428,7 +493,11 @@ static unsigned int ttm_pool_shrink(int nid, unsigned long num_to_free)
>  	list_move_tail(&pt->shrinker_list, &shrinker_list);
>  	spin_unlock(&shrinker_lock);
>  
> -	num_pages = list_lru_walk_node(&pt->pages, nid, pool_move_to_dispose_list, &dispose, &num_to_free);
> +	if (!memcg) {
> +		num_pages = list_lru_walk_node(&pt->pages, nid, pool_move_to_dispose_list, &dispose, &num_to_free);
> +	} else {
> +		num_pages = list_lru_walk_one(&pt->pages, nid, memcg, pool_move_to_dispose_list, &dispose, &num_to_free);
> +	}
>  	num_pages *= 1 << pt->order;
>  
>  	ttm_pool_dispose_list(pt, &dispose);
> @@ -593,6 +662,7 @@ static int ttm_pool_restore_commit(struct ttm_pool_tt_restore *restore,
>  			 */
>  			ttm_pool_split_for_swap(restore->pool, p);
>  			copy_highpage(restore->alloced_page + i, p);
> +			p->memcg_data = 0;
>  			__free_pages(p, 0);
>  		}
>  
> @@ -754,6 +824,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  	bool allow_pools;
>  	struct page *p;
>  	int r;
> +	struct obj_cgroup *objcg = memcg_account ? tt->objcg : NULL;
>  
>  	WARN_ON(!alloc->remaining_pages || ttm_tt_is_populated(tt));
>  	WARN_ON(alloc->dma_addr && !pool->dev);
> @@ -771,6 +842,9 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  
>  	page_caching = tt->caching;
>  	allow_pools = true;
> +
> +	ttm_pool_check_objcg(objcg);
> +
>  	for (order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
>  	     alloc->remaining_pages;
>  	     order = ttm_pool_alloc_find_order(order, alloc)) {
> @@ -780,7 +854,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  		p = NULL;
>  		pt = ttm_pool_select_type(pool, page_caching, order);
>  		if (pt && allow_pools)
> -			p = ttm_pool_type_take(pt, ttm_pool_nid(pool));
> +			p = ttm_pool_type_take(pt, ttm_pool_nid(pool), objcg);
>  
>  		/*
>  		 * If that fails or previously failed, allocate from system.
> @@ -791,7 +865,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  		if (!p) {
>  			page_caching = ttm_cached;
>  			allow_pools = false;
> -			p = ttm_pool_alloc_page(pool, gfp_flags, order);
> +			p = ttm_pool_alloc_page(pool, objcg, gfp_flags, order);
>  		}
>  		/* If that fails, lower the order if possible and retry. */
>  		if (!p) {
> @@ -935,7 +1009,7 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>  
>  	while (atomic_long_read(&allocated_pages[nid]) > pool_node_limit[nid]) {
>  		unsigned long diff = pool_node_limit[nid] - atomic_long_read(&allocated_pages[nid]);
> -		ttm_pool_shrink(nid, diff);
> +		ttm_pool_shrink(nid, NULL, diff);
>  	}
>  }
>  EXPORT_SYMBOL(ttm_pool_free);
> @@ -1055,6 +1129,7 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
>  			if (flags->purge) {
>  				shrunken += num_pages;
>  				page->private = 0;
> +				page->memcg_data = 0;
>  				__free_pages(page, order);
>  				memset(tt->pages + i, 0,
>  				       num_pages * sizeof(*tt->pages));
> @@ -1191,10 +1266,14 @@ static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
>  					    struct shrink_control *sc)
>  {
>  	unsigned long num_freed = 0;
> +	int num_pools;
> +	spin_lock(&shrinker_lock);
> +	num_pools = list_count_nodes(&shrinker_list);
> +	spin_unlock(&shrinker_lock);
>  
>  	do
> -		num_freed += ttm_pool_shrink(sc->nid, sc->nr_to_scan);
> -	while (num_freed < sc->nr_to_scan &&
> +		num_freed += ttm_pool_shrink(sc->nid, sc->memcg, sc->nr_to_scan);
> +	while (num_pools-- >= 0 && num_freed < sc->nr_to_scan &&
>  	       atomic_long_read(&allocated_pages[sc->nid]));
>  
>  	sc->nr_scanned = num_freed;
> @@ -1381,7 +1460,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>  	spin_lock_init(&shrinker_lock);
>  	INIT_LIST_HEAD(&shrinker_list);
>  
> -	mm_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "drm-ttm_pool");
> +	mm_shrinker = shrinker_alloc(SHRINKER_MEMCG_AWARE | SHRINKER_NUMA_AWARE, "drm-ttm_pool");
>  	if (!mm_shrinker)
>  		return -ENOMEM;
>  
> diff --git a/mm/list_lru.c b/mm/list_lru.c
> index 627589d75320..6a277f479dc3 100644
> --- a/mm/list_lru.c
> +++ b/mm/list_lru.c
> @@ -562,6 +562,7 @@ int memcg_list_lru_alloc(struct mem_cgroup *memcg, struct list_lru *lru,
>  
>  	return xas_error(&xas);
>  }
> +EXPORT_SYMBOL_GPL(memcg_list_lru_alloc);
>  #else
>  static inline void memcg_init_list_lru(struct list_lru *lru, bool memcg_aware)
>  {

