Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4548F413288
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 13:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C036E94D;
	Tue, 21 Sep 2021 11:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2079.outbound.protection.outlook.com [40.107.212.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7AC6E950;
 Tue, 21 Sep 2021 11:28:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMlwmwttYLe5alDjLjPPY9GINTjVC3Iuh8ELhMe/WedS0awlFdzAq+G5yCMR0u6i7WOg/T/O06TvNqXhVKtvD94YQ8d5elynieAilQ00D2OK6ZQSFVoD13SduJZYHaNOUSw6WNuzyIhkqHnCF0eLJ6b2NsqANoUdtZwWJfGXmye5Zqafb9uuUyrCKZFOo5OP/mgoz6XC1cRQWUVlxyX4lDRe4giE1VNzAJc+o9f0aZheq4vFMD2BmfAto5VrYF9R1du9rfrjltJwSrPA6cCOJxZ6YhT9eyyS72CmhbgvKBaZgdla++6T7TKVCfQ0oXp4o01cxMTpekdOGwsixwEB1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=PTU8E18v19GCkECVg00liVPDndp/q2UI7GXBAW6lVEs=;
 b=M5Wi79bpBagDckvR7vgs/7YvBLWiYdLmcns+gZhasT3JE+9kqzLUQk00QorufOicjHPd8RntP/PLVUM8fCQW0+PWx73i/vZBUmDfVYdtWB00YiAaDkCK31vuvQIFHXxj6+7ceQWc7oVRUW/2ehgy0NxJ88YsMlvqfyRhSkcQLWYDl5rGdZlw481F1N73aV0xN8Er9Uy7Cpi37x0MiFHGGNP1P4ydoonDv32tzCRmop1cl0L1x89XiwiKxLbz3JS/BQk+aUMQzap/7AX7GAiSpqkYFpFXdnlW9PEf3Z5MJtd3e5GJZyPZDwlOsjUuQTv+wHvuqRrfcSZgZA25N5RZfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTU8E18v19GCkECVg00liVPDndp/q2UI7GXBAW6lVEs=;
 b=wkodp+PZ8Wo9C9Ry69lZ8BI9v4WvUoCAmX5JalqMKeJg6FHOqTBkoGt/wzTyq4R9JiiB+/BMS5wpf/ErpG5MB3kmZNygn4PCsgjiFSvXzd5ciNCof65cMbDqn4SoDa1QS/jj1Q8d8rW/098xXtqnn8oRUbvbcxQdpFflZErOV1Q=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4157.namprd12.prod.outlook.com (2603:10b6:208:1db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 21 Sep
 2021 11:28:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 11:28:38 +0000
Subject: Re: [PATCH v4 01/14] drm/ttm: stop calling tt_swapin in vm_access
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210921110121.3783395-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e358c620-fd78-f3c6-2558-7376a86701b9@amd.com>
Date: Tue, 21 Sep 2021 13:28:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210921110121.3783395-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0114.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:8582:d9f8:1318:9d2b]
 (2a02:908:1252:fb60:8582:d9f8:1318:9d2b) by
 PR0P264CA0114.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 11:28:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6003688-a8a5-4454-2a28-08d97cf2f4e8
X-MS-TrafficTypeDiagnostic: MN2PR12MB4157:
X-Microsoft-Antispam-PRVS: <MN2PR12MB415708A12EE76C1E95D29A8783A19@MN2PR12MB4157.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BKABW0BSQi2tAqj3hVHAX1IkgHDUPYwJoV63U1mUh1jrcVlZduoekrBnANH9ty6NzUmy43GNoZwzPqfIRgTkG+plWpS6QBXDKrXIiMTpGBubofc6Ul9yo1rMer7aaTuSJiiXWju0gFjvDPctB6aZTZr1KmeZaWgqFi44DYB8g9H9sh6Xkh4FrKTswe6x0Y2X7Mu+4Z5I8LchZJdI1MPjmeCVmuQEbbrpztoQynGwE1IFE3PA8cva91ItXspWiMG9B+f4o3jfpC7l3OiS9qQPYk8uKdK9OmuEP1lqMYiozGTUO7FnhU7l3mwunYmsGENG0OY99vS2Bl9aGXYulhCe1eNxm7Vk+SwrW/XpFEVu8oTDjOXYX06BDhAjDWwDrHXVmxVR48Mfa55ZCxs8JJA3gU46wDtD94T3DX9O5ZLJU6d3F6u5BL42vpl1+hzKtNqLSnhPPlULi8TGj4vJ85jrH6vXF55MlgkbtgzqAdBkIoRU2ogzgXnuP9kEtb79RlfqPH1mLDEDeC7fnzmbF+sLzWOT/N86pbAWnoGZ0t4gXW2p7h9oYD3UJBVODyYWXiB5sRAa/Qh45PTZy4YCY4SGbw/3C3whjxeiq6rg9VifDVpyVi7x5VphnyzrXo+9U8Pl5AvTSald3n+Nf7GGPO55e+5ckiuBa943xxurlDCOap+OrHS/xl3kVNkMHBiN4KWNmLD2/J6t3CBjnHp5NTbzTcn85ojKvdwwjM5XhVcKKWQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(66574015)(508600001)(83380400001)(8936002)(66946007)(66556008)(5660300002)(66476007)(316002)(4326008)(2906002)(2616005)(8676002)(38100700002)(6486002)(31686004)(36756003)(6666004)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ky9DYUdkZjhKUGJycnBmRm9KbHBESUlZNWwwamZoK0xpS1hheUdpdzFJa1hE?=
 =?utf-8?B?NUVGV3FickZyVWNBRC9pMmsxYmhjYkxvWWZHUU9vNXBXTlRIbU95Qkt6b1hy?=
 =?utf-8?B?TkRyTDcwTzFpN0NLWllQWXFGQVFHaFd1SWYwZ0t6Zzl0TWUxWjVmRnc0YWZy?=
 =?utf-8?B?ZkJwSVBZY0ZuUUF1YUJqaEgrcFZpTzZtSUtXREwrUlMyS0oyTmZmQ0prYTZT?=
 =?utf-8?B?dkoyZjBKNVFsNy9scm1nQk90VnoxalZib25vU0NMNFFuL3JIbjdwVndRT3k0?=
 =?utf-8?B?a3JFekl5d0lXOEl6TmxyaUw3S1duaUV5aExwWHhMY0h4em52MzNCVkQxbXpy?=
 =?utf-8?B?Ty82Q0xiV1BxbkNSOURSSnN1MVl1WUVxOTZlck5UV0IyV0ZYRC9zSEh6clZP?=
 =?utf-8?B?S3JOeklnNllBWHlyV1pBWlNPMC9HZHZDbFJGQXRYL2tTTWVyNENzZ3piVjJn?=
 =?utf-8?B?elJoaDZiWUFoWTMyTFl0a1NkZ0w0dVJFNGFJV0svc1hWaVdhWlNIamlRRmVJ?=
 =?utf-8?B?aENzWGxuRmt6VzhVcm9hU0ZpUmZlRStUZmRFTWR1NExGVnNMRVRrUVFmYmJy?=
 =?utf-8?B?N29scVhSKzhOemhBT0tNWWJ3SDlNR3JzeHdsNGh2dEFsOS9kSkRWeU5hejky?=
 =?utf-8?B?ZFc0OEVxNjFmNjJYRC9vNEIvYnlkem9BV0Y1S29OL1lRNGdCNEk2N2JBRTM0?=
 =?utf-8?B?WUVnNnhLNEdjempZTWkxcTZza0V3SjdnbTIxQ3JhdkhkU3VFcmlvQVZHN2dO?=
 =?utf-8?B?cDlKeUp4L2xZTSsvaTFXSy83SkF1OVkvTDdQMmdERVpaZ2FpQ2tsQUIrVjhR?=
 =?utf-8?B?OFpvZ2tvanB6dDZ6RVBjK3A1d1N1TXpQRVp0VWJWWkNPTFBaR3hGYVpvOTNC?=
 =?utf-8?B?aHk1OVVLRm1Ja2tmR0xveE5lUHdCVUt4WTQxd0VSVDZTOHRRNUVGRFJTbGNh?=
 =?utf-8?B?YVkzWS9Db0lWQzNaL2JxL2pBdTYwNXZ1OFJqWVNyUnRuUUtVWnJ2MmRiYTho?=
 =?utf-8?B?OFZlT1dLanhnNXRIRHBuZTF0ZVRqazZaczNwaWkxdTJLejlSK0VyL3JuRXI3?=
 =?utf-8?B?WEVWN0xRRHRvdXMyNnMvWmMwRFRsYThlZ3NtRDI5QTUzb2VMcmZqa3UvSkJx?=
 =?utf-8?B?Qm9JSC9kSG5vbk12bmZVbXlSbVZWSndNWE5reXJUN0UyK3ZFcXd1bnRGbzhK?=
 =?utf-8?B?NURjMkI0QU1ZY3JaTEhNRXJEYkNVWE41RHgrSSthbGpLZm91bnRwQkZzOGll?=
 =?utf-8?B?a1YyMjNKZW80dnJWUWlESDFpVGg0Q1FvWkVMZEMzQlF6SkQwNzFiQVhNN1ky?=
 =?utf-8?B?WHpKUzlNeVY0eG0zbWxwejVvN3hFZmdnajNmcUtBQzdXQ0NHT2JFTEJnZEc0?=
 =?utf-8?B?bFh5aDF6UHQwQUlZRnc0YTE1eThLZFJYbG1qVkN1NExmTXR3MDAyaW5SWlpB?=
 =?utf-8?B?eFJnV0ZSRlNnSkF0KzZHL1JaWnJYVnZJaDJHZDVMNm9Ia00xTE1jZUM2TEdq?=
 =?utf-8?B?WGp2ME41QUZjL1VGKzZtK3VPVi9WT3hhQmtPN0dXZXhma2JpcDRxaVhTamRX?=
 =?utf-8?B?bkpIVk9qd0JaeW9Eb1E2NEZkWkNKRm4zbkgweUV4MTkyRWF1N0xyeXdueWZu?=
 =?utf-8?B?MVlQUmtJa21aVjQvQy9uQ3RHQkVmTEhTcndvbU0zNkQ5WDR0dm11dm5Kb3cw?=
 =?utf-8?B?czlhVnMxUlhweEVjL0RUWjkwTytPUUUwc2dFakNOajd6UlFSSklIVGJBUmpK?=
 =?utf-8?B?RjlyRjg0RXpPczRNMlUvM2liVFA5cDMxY0N3WGNkTVRhbzFybzhGOGtBWWF3?=
 =?utf-8?B?dkRLMk5TMlR4eW9QYnpMVDArNnZsUU02ZHI3djIxTzgrVlBVNW1jdSs1T3R4?=
 =?utf-8?Q?I+uNpDm/vzJ5j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6003688-a8a5-4454-2a28-08d97cf2f4e8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 11:28:38.5929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXXuSkQtKSEi16V81Uz+Uf1+JMRJfwcxFbAayHDhjPlhTGxE6QW3pLopbyQ0f4+f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4157
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

Am 21.09.21 um 13:01 schrieb Matthew Auld:
> In commit:
>
> commit 09ac4fcb3f255e9225967c75f5893325c116cdbe
> Author: Felix Kuehling <Felix.Kuehling@amd.com>
> Date:   Thu Jul 13 17:01:16 2017 -0400
>
>      drm/ttm: Implement vm_operations_struct.access v2
>
> we added the vm_access hook, where we also directly call tt_swapin for
> some reason. If something is swapped-out then the ttm_tt must also be
> unpopulated, and since access_kmap should also call tt_populate, if
> needed, then swapping-in will already be handled there.

Sounds like you completely misunderstand what that is good for.

This is for debugger attaching to a process and peek/poke into the VMA 
and completely unrelated to kmap.

>
> If anything, calling tt_swapin directly here would likely always fail
> since the tt->pages won't yet be populated, or worse since the tt->pages
> array is never actually cleared in unpopulate this might lead to a nasty
> uaf.

That's indeed true, but we just need to unconditionally call 
ttm_tt_populate() here instead.

Regards,
Christian.

>
> Fixes: 09ac4fcb3f25 ("drm/ttm: Implement vm_operations_struct.access v2")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index f56be5bc0861..5b9b7fd01a69 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -519,11 +519,6 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>   
>   	switch (bo->resource->mem_type) {
>   	case TTM_PL_SYSTEM:
> -		if (unlikely(bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
> -			ret = ttm_tt_swapin(bo->ttm);
> -			if (unlikely(ret != 0))
> -				return ret;
> -		}
>   		fallthrough;
>   	case TTM_PL_TT:
>   		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);

