Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04DC3CB37C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 09:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF49B6E939;
	Fri, 16 Jul 2021 07:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECE06E939;
 Fri, 16 Jul 2021 07:46:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQhqDVXOrFQ9Mws8oq+HmU7g7jVFY+BTuzVDIhgaXhAGQrV++C2Suowq/JOYwm2KKvp38NafCrjRu87+vWHm0nrcHlco0Cw3gN3BQlRhGnE52fBp72RT0hCtDNGqcV1EVzSZ0Hvk3DgM6KmXoAQEe/LFL5lwdE9W2Iqj9OdPAMhjOPOgwS8Cx/7dqIKtg4RB04UtB/cEAq8bh1mgy4rfF6LI+7RL10iBGiUlbdFBX6HXaQJxTRu55XWoh5InEDm1S/Owo6axKq60HvZTFxXD/CrGghxDvLQ/1JF0yuluuGHfiEbpRg519ZXgn3x9KmTmF6xTndkUFLFxhXb6KlDXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OM5DlbKr9hHkjuSbQR4Vv9hFEQXR3tVYLTYhOOCUQvY=;
 b=I5+UrRelNjggYy6/A2aQmLslQBffQR/K2zcRe8scrFCDURU1ulAtMoG9VW7qq2T7QHfClszfHeGjy5Py9Ngoq4WnhEbqb5C5msd+fRLrL2It7NODTQptwj/e0zQ3KUxZG4lN7QiXSasVPJZefIpxloflv51Ijr7UGiF0uzTRE3IFnqXWs3XbK390PX1lCrdhhBHpaq2KJW+OHePzxGmeJ73HCcNuIpu0WcFYEeEYWpMUa5ed6TjWsr/J8e5tpuPF/F9CKnRgZTHu/XGhUWsUcBMribE/bXr7xvjj/J5g6aXiyuXEiyZTF5o9237VOBqjwhym2PSeAuFKK3Ht700j4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OM5DlbKr9hHkjuSbQR4Vv9hFEQXR3tVYLTYhOOCUQvY=;
 b=XMThUrPyFeUOSYSWKAXBZ6JdPZWhB43tI/0itNE6CyTOfdY/KjUAFt9f4716hGaGxjCwkgiXmAH8t2J0j+yKhe6afvVgexlTygN9nWhN3AGHjXvZ+I1iHG1nQ8/wNId5s0OMOTGesng76hhy0e6spbtsK62uHy0eHcYX4GVMEVs=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4358.namprd12.prod.outlook.com (2603:10b6:208:24f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 07:46:38 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4331.026; Fri, 16 Jul 2021
 07:46:38 +0000
Subject: Re: [PATCH 1/1] drm/amdgpu: workaround failed COW checks for Thunk
 VMAs
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210715190537.585456-1-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ce707fb0-4c61-3a88-5fe1-cd1dcc5f43d9@amd.com>
Date: Fri, 16 Jul 2021 09:46:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210715190537.585456-1-Felix.Kuehling@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PR3P250CA0006.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:102:57::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e013:2fad:8ece:8234]
 (2a02:908:1252:fb60:e013:2fad:8ece:8234) by
 PR3P250CA0006.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:57::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 07:46:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7341b5d6-6759-419b-1966-08d9482dd75a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4358:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43583E7C640265524508334583119@MN2PR12MB4358.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3SlRO80B53UjZYjiSn3RIc8EruEr/bFHtWOrIREixLYYs3WLZcIl6NHROWQac/ISqWgLUM4Whpy2A45WJzVnfWltNuI2eO7pE4aO5mya2R1Tja5Xh2tjbWjBoWf00JgpUq5EwAZ+88TGFy9KRW5eJBx47+Vd+wqB7gvN8TfVWCXaoiN93g28ZGNXZbJcvkFXKgarQzLai15maJrcGto0NIU9X7snN+gPgTWPCAHCai/CtYUuF7DHRT+qn0SgD7qFlrx50gsUUqMnluJ8GaLdJXxf5U2pySvYRmSmX3zMrgJD8Sxw1McS8feHeAZvsPofDvLsRXeymlJ3I9z8BlIqCOIJb/rhEKrvon5fwVmK5ClWRYv4mpCIgZTMYrXMioRnAxAUC3WjM6QYZJwuzG9kGVtDAmJXKbtu/I9n9R1XU5whS6njnLZQIe6/y7sloGriwXi6D/O+Bw14H9DTp6AK4KI5aY5lHeu0Wejh6KCX5BRJ4eCHcddkQGRdrmcb2jzH8x8aaRFyzO+7QEzIhemCsB4GzAOjVcprc/m2vTxDq35LFyudOZtlah+2UrjEm4yoBH4Reluw+JTaBxv4pbK4TmE7tuuwVycDuzsDaGj9D7NPVicLegorWlHGtyOK8q/gz+AzN5nO/gniBsinJap+wM+5F1UMIRT7blnwy3QGmT90xp4wkDI7Ac+FgxggfgA9D+szK8MWH/h7YXvK5q4LflnSKnORXc62qEIjGlDJWDc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(36756003)(6666004)(86362001)(4326008)(2616005)(8676002)(5660300002)(83380400001)(316002)(31686004)(6486002)(31696002)(2906002)(8936002)(186003)(478600001)(66556008)(66946007)(66476007)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2hOS3VnNk1ROFkwc0c2VERQS0RGY29vUGNlbEprelVWOCs4NmROdXRQd2lJ?=
 =?utf-8?B?VVRJVVE2QjdaZGRjWWxadDNKdUU4UlhKNWdTNmlkcWVhUVRkQ0hJWWNkQ2Rh?=
 =?utf-8?B?WndLRVhsQmlHS216R0cxZHVqRXZBckF0N3V3T2FKaTFYMHd6T3dWQTk3Smho?=
 =?utf-8?B?bVcrd0ZQYlFncDRMWlVtSktWd2N6Wk1hU1VkN0c1eWs2SmdDZndib1BFdUpF?=
 =?utf-8?B?OHNITTFzc0hNSVNqZVhPcmJqcUtCYmNWdEVRdXFnbnFjWTFIR1NBcEt4Y2VM?=
 =?utf-8?B?TXNPRVlSeWgxd0FOZnh1MFdhRUxEU1N3a2ZaMlNLSXZGRVpKaysyVk9QRGFm?=
 =?utf-8?B?TzA3RjN4d0V3WXdKMHdiMFpldE5rM2RqZUpOcE9lbEdtVno5ZUlxSk1ORFRO?=
 =?utf-8?B?VW5NUENPV01lM2Q3Q1JEd2MrTDB1MjNiQUdrVHNtbkpwTmE4TmtDWFM5M21L?=
 =?utf-8?B?N3hNYnEwYVNEeHZXS0FhSnE3U2xWdFFEcWFLRUo0WXlmWFVxTzZuNkVpN2wx?=
 =?utf-8?B?aU94c3dKcnl6YklQUFgxMkFXandGVkFoenpCYzJPZ1lTLy9mTGlRQm1MN2Q5?=
 =?utf-8?B?U2dZVk1GckFtbWI1cUFQN0J1VENDSlFzWHpFbHY5NTA0dER2bzV2Mzk2b3NX?=
 =?utf-8?B?KzVQcXFpTnZwSDI3d1ZTd1hHZ3EraW9nTkdINnF6cy9Ccmp4RFJEdndCVzdM?=
 =?utf-8?B?THluSjdnZ3BxVStkSWdzYlRRTjZ5dE1WYlB4MURzZ1pyN1pZUmJmZW1ibWJj?=
 =?utf-8?B?a0g3T3FZbWZjd2M2TzZqZk5BY2h5ZGFhNlB0TjM2WlR3RW1oL2ZIZ0s1aWM2?=
 =?utf-8?B?M0lWQTRPUE80Tng5d1c0NG4xZnhiSTJPTmNZT3BMN3BoZWk0Ry9rNitteGhH?=
 =?utf-8?B?eEdJKzUrVTJQbElmbkdqVVI0aTJsNDZ4bUlZUmJsWUsxeFo0STZSTUZmV0ZS?=
 =?utf-8?B?SjhGbzl3NlQ3STlIaFUwUnFnTDJ0MzdwT1pxRzlCdk44R0VVZUhKZGVpZWRB?=
 =?utf-8?B?TmRvenZ1WlA4VzExMnpxSTJ0ZklvTDkyZEVFZ3A3SnJib05kN2t1OVgzQ3RG?=
 =?utf-8?B?YytTaXNoWVYzTURUa1pXUjNTR0NsZ0RjcTNjdXFjdlNwdzRxR3VZY2FLWUd1?=
 =?utf-8?B?SGVSbkc3ZWhGem9VVTI3OHpLczBtR1htVytnaHhRYW1GbjE0QnJNVzJxZjdT?=
 =?utf-8?B?RU1paDMyU0tWazBFVkk3SVppaTJtWE5XRjZHYUlCU0NnRVlnNHhVV09tMnlZ?=
 =?utf-8?B?K1hUcTNWN1pKL1NoZ21EUmFtclpZNHBjQWRzWnpTU3Z1aGU1azcrRDEwWW9X?=
 =?utf-8?B?R3VSaWQrNitYMXM5U0V1ZXFLenorbm9BYUVpMXVhdFJmVC9zWnQ0eFlkUlc3?=
 =?utf-8?B?eVdpRmZHeXV3aHVoaS9KRnlGZER5UElENVBOUHB5OEo4UXNTNlZhMjdVRFI1?=
 =?utf-8?B?ZHJNSHBXRE5wSmhTY0w0MVBZUldzRGpzYkZGQ2N2SytjQ2daOG9vUE1yTDYz?=
 =?utf-8?B?Ym5ac29xNG04NFlUZllQTWt6OHcwaVdGMDg5SE11RnNIRUFtcEpadWNXQzBk?=
 =?utf-8?B?SG9rb1pTcW45VllVczFxK3ZDK29WY1h1S2lpWHFaTEErc2E2RlpNWmdlR3Zt?=
 =?utf-8?B?andOU1FybTY3WjNUdmR4WGxRQmxYQ0xYWUhQM3k4NWVoQWRHUkowTW1NVnEw?=
 =?utf-8?B?dFNNUDJmK3JnSjR5enZ1Mkd0SU9PcEtOS2pEM0lKbU85OGlORG9OYVJybkNr?=
 =?utf-8?B?R2t3aVFYQXBsSnZUVGd6ZzF5dVRmb2FTbnZQWjN5KzFtNHFjSkpEbS9HSDQr?=
 =?utf-8?B?REcrMkFKcjZKSnFBb3lPZlpGbE55RUpYaG1YMFpnbHp3c0g4RnBWay9aOGtk?=
 =?utf-8?Q?jZ/8jglQW8ze5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7341b5d6-6759-419b-1966-08d9482dd75a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 07:46:38.3004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aew5YpUoD/TN375VVtOlvIGfQpTVO93waf+L38b1THZfc8tTQGZY7YL6pLr4pfs/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4358
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
Cc: daniel.vetter@ffwll.ch, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.07.21 um 21:05 schrieb Felix Kuehling:
> KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
> is_cow_mapping returns true for these mappings, which causes mmap to fail
> in ttm_bo_mmap_obj.
>
> As a workaround, clear VM_MAYWRITE for PROT_NONE-COW mappings. This
> should prevent the mapping from ever becoming writable and makes
> is_cow_mapping(vm_flags) false.
>
> Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
> Suggested-by: Daniel Vetter <daniel.vetter@intel.com>
> Tested-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>

I've reviewed and pushed the patch to drm-misc-fixes.

Regards,
Christian.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index b3404c43a911..9f952b7fc197 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -255,6 +255,15 @@ static int amdgpu_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_str
>   	if (bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS)
>   		return -EPERM;
>   
> +	/* Workaround for Thunk bug creating PROT_NONE,MAP_PRIVATE mappings
> +	 * for debugger access to invisible VRAM. Should have used MAP_SHARED
> +	 * instead. Clearing VM_MAYWRITE prevents the mapping from ever
> +	 * becoming writable and makes is_cow_mapping(vm_flags) false.
> +	 */
> +	if (is_cow_mapping(vma->vm_flags) &&
> +	    !(vma->vm_flags & (VM_READ | VM_WRITE | VM_EXEC)))
> +		vma->vm_flags &= ~VM_MAYWRITE;
> +
>   	return drm_gem_ttm_mmap(obj, vma);
>   }
>   

