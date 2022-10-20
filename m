Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B9B606630
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 18:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320C310E731;
	Thu, 20 Oct 2022 16:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2083.outbound.protection.outlook.com [40.107.101.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E698510E637;
 Thu, 20 Oct 2022 16:47:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQybIGZcC4/CvcZ9KIAQ9Na4mcHdbRpxZXiXCC3s3nETG3Lo0rpgaCHUTQv+s5iUad3VkQkI1QtmBJHmhpKJQWJasOUBGCCjrUYoCU1EZ0lZjp/X63x9pLsqT0JjNyAyfOAbSe71C97q1+He0plSJdG6bW8xffI4ziF16WJJDnq0TCgjjy97tRLZbYpSo1/aAdsBK2sULdpt72/QC0H4YIRD2lM68ngDysjdqfcyJQffvPVvkqxJkHUw3V7DYRO/SrNHB1ptwykUsU0UsdOxAP/bkU8FnIpEsBTNz7MZCKGhn/ixmr1abWjN0JTe74Gve8Iv6UoIYU2hFHVDqqeEAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+02KaacGz4xY6GOVRQ98K/MX3q9mehMLCejg1kTNOqQ=;
 b=RRmmT6688zrR/gAmheosP3oZ1yiIGLZ2Vm29lcL0jXPf5sqVBUmjfITtzAaia56aAVOCt9fnTqrYLbh9PyvHXRkmzvM0m8gRpyXRp1UG/EvDv5hUmVaF7RXpt79V3TZwZxywsPJQTi1KzDHSgGbRuU3aUZCI6aYLWdbql/av71xvTiH/CcpefvfcX1ZkjpjQ5OTPvvg2LuiR3AO6UcmNmQMREgDJzO/bHeXmPUOw/Up4yqE8FssEh0vZF5FExolP+LR/dqIZvgNsMmzJr//OrR2MzoxWYKMnUoqhY7kPlrjxoc0nez8en/JrKFTahSXkgJhgapThccKWAchvD6dHPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+02KaacGz4xY6GOVRQ98K/MX3q9mehMLCejg1kTNOqQ=;
 b=YpjqHM5DOTtlgn9MwtVfTTr52nwUVEuP7CxTtRowDgHeNxjapHPkR/3Xs+ctS1VauWoGUfLc7UogvhR15gRgvnxqxYg/XRFGkRl+onysUgWih4G5o9M/dOqv4z+DSdlqKg5RhDDsf9+n8cTdb7SZ6tCFBN6nCmoW4I32FWn2IjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH8PR12MB7253.namprd12.prod.outlook.com (2603:10b6:510:226::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 16:47:30 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f9a4:8620:8238:20e8]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f9a4:8620:8238:20e8%6]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 16:47:30 +0000
Message-ID: <fcc77463-10e7-7fd4-b675-7adcb13219ed@amd.com>
Date: Thu, 20 Oct 2022 12:47:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/amdkfd: use vma_lookup() instead of find_vma()
Content-Language: en-US
To: Deming Wang <wangdeming@inspur.com>, airlied@gmail.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com
References: <20221007022651.4816-1-wangdeming@inspur.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20221007022651.4816-1-wangdeming@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0115.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::26) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH8PR12MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: c20a39f5-9647-49d0-f293-08dab2bac72a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kEv6UJt9Lv/ExeMmsBGl+EptEJyx7Zx2c8FntIcSAvi1ErKPo9r0X/7WXA0rYTsQvlHC09kN7A/LaINZgEq9nxhSJSC1LhprjazZYWppolxbeA27/qnP6dl7a4q3R41ReO7mZ2j2n7X7RBR8rRq2tUoRssVMj3Zq2oFKeEBMq+2PjsUKNXf8gBy0vU6fmwAC5R7GNWrVHMbkXKt0cszVt8VSP3A6QEhU3mYpfRYmQOXfOt1s2Dys5/HRIYGwHOFo/d/piTmAZpfgMXyuPyZkaVlt3/ZwWN3hVcJyk2iXZzCr3C6cv/JVssz8RhpbW9FJzW7UFzBFqjDwTG3T6VP8O3IEhIyZBqb+1R5vGRtZ6F1UbFSIxecJiwSO1Wf+owH2Ej/ZAu9PqD9fT9ZAMuclHjGZV1gjWvr59A+JC7NyPv6QccI1VGCU1Fr5q6UtVegoWQNgi9jgAI1exPNq/sc8H53Qj/O0YRdc6wwPgMtBtHzSL1akmDPV6SmT9jP5LlRj+YlprF1lxIGmKEUitLV/0Gv/SiKok0mOUtn/Mj/5AHkArtFgQePzrQJR6nW8s+VcGBQNzUCzFUvh2q9FogMtHBDuCOejtURMC8UB2xowm+WUCh1EWdIWWII4E1gROKYwossTo58QG/MXhfhtWI9sAoX34Dmi3wjZt7Yb/2ohD9qboNaE1mpj6Kc9Ju0icW4SqqoVztgtjJ/uM94G8VFX3SKXC/HfEQ9NXiFWMEE5MUSPfGkOP2MeJGGWjozPH0yYn8QYv3iJ1hJHfqxhtQtjYBfmGm3TAW9UwS6WA9lDQno=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(451199015)(41300700001)(6506007)(38100700002)(26005)(6512007)(6636002)(66946007)(66476007)(6486002)(66556008)(8676002)(86362001)(316002)(31696002)(2906002)(4326008)(478600001)(36756003)(186003)(83380400001)(31686004)(5660300002)(8936002)(44832011)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c212c1BKSUh5UFZtWDQyeVpzMHZnZ2FSTWFrZ2gzTnhvcFBxYnIvcmQyaUV2?=
 =?utf-8?B?S1JqYzk3NW5rZDFodkwyMWJDUlh5S2UySG5TeVhzSXRlemN1aVZ3LzBLMm1z?=
 =?utf-8?B?ZkVmVFF4Wjkwdktwc3dtc0g5ZkxjNXpsTnpFSUQxMVV4TmtOZWhGK2NITjdU?=
 =?utf-8?B?aFJiRXRoL3FXaVl5TDVFS1JxWmozRVJBakkrYitpZ1VHWGhYcGozMWswRWZi?=
 =?utf-8?B?N3lRaWdaUzhTSzZFTTRHcUh3bTJZbCtkTHJ3enlPdHdQc3VUeWw1Skc2SHlW?=
 =?utf-8?B?Q0oyWTBiZkltZnc2YnQ0VDBMR09INXNnd0pwSUFDdG1ldm5TZHlqcWwxcWFL?=
 =?utf-8?B?ZVQ5TmtIOU5PSDNZdTNnNi92cTJVZVVRRFphRmFwT0l4bHd3WGJGYmk2WlVB?=
 =?utf-8?B?NHZXa3VXa0N6TDZVSDB1MkhRVzdiRXhBSUNESjlJOXpyaFRaR1JJcnRXODBY?=
 =?utf-8?B?aEx3emdaK0pNTDRzRExpZWFQUnJEc0dKdEQyMFhxcXUxaVkzZkRMalVxWHYw?=
 =?utf-8?B?UG1Kd0lvTWU5cDBxUjlzaGhycUwyR0tmY0FYcDlZNHNIdS9sY2orcHlORjhj?=
 =?utf-8?B?bys4akdQQzB3S3FNTnByaEFMZlQrZ0F3c3BIdjIwYWtBRkt3Rm1CSnB0TE1B?=
 =?utf-8?B?cHJzbmtUNERVSXlqQUVPWHBTUjNCditpRmJlTnIreUhBYVpYTDFlUTZYbDdQ?=
 =?utf-8?B?MXl2MVVkd2cxVGR6NXViL0ZtSGdSY2Y0VDZNRDFQVFN6MThmQ2VTTVNYTEk4?=
 =?utf-8?B?MnU2OXNxY256UllaRGk5dlQrK2ptdkhQbjBHM3JRVjVLaTNNMkRQdVZZcjla?=
 =?utf-8?B?Ym1uK1FEOGdYZUF6aGJOeEdscEl5N0d3bHd5cE5LbTFlbHJRTXVFajNray9F?=
 =?utf-8?B?QjNQYWlvWWhmbFZGR3hYUHJJVmFvNmIyR2lJdmZMc09EakNzdExFNU4zKzVn?=
 =?utf-8?B?K1ByTWZiMFR3cVRrbHEyNUFJSm8rZEVvTmltTC9ocUFZR3JqcVhDeWh0ZkJY?=
 =?utf-8?B?b0tpSk1TQ243K1ZoYklZK0JvTEs1YWdsVU9HNnNnUmw4dGZHaUlqZXlVbjN5?=
 =?utf-8?B?NGs4Ukg3NmRDanFleE0ya3F3RTJNL2lXK21rd01VK0t5WEhwaiswRzY2ODlL?=
 =?utf-8?B?TElCV0NUY2NkcW1TUjU5b2ZGTkhnR2grY3J4Z2pFSmhqOUgvR3FUTVFLNjVO?=
 =?utf-8?B?bXVIdGk0MVdYQUppYldkVnBLY1JSZXBsVWEvY25WWDhnS1Z2aC91M2RjdWth?=
 =?utf-8?B?SU0yZTRCc2xVOWlZUEw2NkRnYWZ0T3AyUnNXMWVYOTM1aGUyQXp1Yjd5NzRs?=
 =?utf-8?B?c3lCNWRNVUpKUUc0UW9GQktjYlRxWDgyMDZOVzhkSkZ5ZDFTRTk3MW4rY2c3?=
 =?utf-8?B?Zzd4SloyaEhRelE2czNYbGd1dWFZbnFmQzBDNy9weDIwTzdCMWVPTmozbCtY?=
 =?utf-8?B?SDFpeHNnd0E0SVVIVkpRZEoxMGtkdHBjOTE1Qk9XS2hSdEQ0VnE0ZVg3TlNy?=
 =?utf-8?B?VWFFZ2RhSTVVNmt3MTAvMXZaVlFWWFFwZklVWW8yVU1EN3V0VEY1Mnl2MENE?=
 =?utf-8?B?RDFCbWpPTkxMb2x3MnhKYWVycERrL3ZCd3VIWmVuQ05mVWhEK080ZHYrUlBD?=
 =?utf-8?B?U2F6TDFtQVNVSWI3Z0JGOVQ1ajYyQkNJdnNMdVl4Tnp5cFovVDYzSjQra1RF?=
 =?utf-8?B?L2NBeko5UW43OEx0OVhRRlNEb0Z5YlljNkVPMzV1ZzVuU0dtRWxVTzZhckls?=
 =?utf-8?B?TFUxc2tCYzJDaVJSNHZncElhRmNQeVNhSkhhY3ZhTGlZa0VKNHZ3aXBOMXND?=
 =?utf-8?B?WGM3Nld0LzBFdVlPNG80VUVYRzFMVklGL29vazJkRmJrNXQvcDJMWHBuaEFK?=
 =?utf-8?B?azBKbjFVcHlmZlMwM2FWM3VuUDh0U1ZGczlCZmFRVmhXeUVZT2JXOWdqMHhq?=
 =?utf-8?B?dHpSYUY5OURwVjg2VXo2ZFR1WHRFNHgwT2R5VlpnZFgvTlhxZnIxUkxNTSs2?=
 =?utf-8?B?M1NyWlpwcUZXUUZUc3BnVG8xbE5PR1NVZTZ3QkJtZHZ6SCtQTzQyTHBBTkdl?=
 =?utf-8?B?YlUxeDRGb3dBMGkxVGJHNExZTXVuSEhSQTdLRUNsM1BKZnRNeWpjRzd4QTlJ?=
 =?utf-8?Q?2nAEkH6SlUpq2U8bpHxd+h+q0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c20a39f5-9647-49d0-f293-08dab2bac72a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 16:47:30.4144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2oQ8ZNodjiI0OLLk2VHEofuGbBinHXn1ZtV+cegshJGKYiiYDPIDJd1QK8E7yZExbWzP4Ru0P+Y59OKVgpedqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7253
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-10-06 um 22:26 schrieb Deming Wang:
> Using vma_lookup() verifies the start address is contained in the found
> vma.  This results in easier to read the code.
>
> Signed-off-by: Deming Wang <wangdeming@inspur.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 2797029bd500..3599cc931b0a 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -529,8 +529,8 @@ svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
>   	for (addr = start; addr < end;) {
>   		unsigned long next;
>   
> -		vma = find_vma(mm, addr);
> -		if (!vma || addr < vma->vm_start)
> +		vma = vma_lookup(mm, addr);
> +		if (!vma)
>   			break;
>   
>   		next = min(vma->vm_end, end);
> @@ -798,8 +798,8 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
>   	for (addr = start; addr < end;) {
>   		unsigned long next;
>   
> -		vma = find_vma(mm, addr);
> -		if (!vma || addr < vma->vm_start) {
> +		vma = vma_lookup(mm, addr)

There is a semicolon missing here. I will fix this before I submit the 
patch.

Please do at least a minimum amount of due diligence before posting 
patches. That would include a test to make sure your code compiles.

Regards,
   Felix


> +		if (!vma) {
>   			pr_debug("failed to find vma for prange %p\n", prange);
>   			r = -EFAULT;
>   			break;
