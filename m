Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF436017C2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 21:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3116410E071;
	Mon, 17 Oct 2022 19:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2080.outbound.protection.outlook.com [40.107.96.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1C510E071;
 Mon, 17 Oct 2022 19:35:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtWZRTLfqOtFtaFalJ3TycMoQKRdJia4NMiyb+WKmC5JtnPyaJ0+7rEgVY3beZvfjwAriczCGVjY6HmB9QaFy7Gly5ks+nwG6C8pTIdVzzXBfDq/rbePdFIli90FDpzPU5PVmY2G6EtXvuSnkdjUHFIk7oZqymqRvXjoUk0jOZWxwUBQLvUmoKehu33ZoQ/T2aCx69xNvsffLLdhMPB5s9WA8Sba7X8+RgRrV8dvZL1jvL2kLkjzWHnWvKsQ1U+i0gHr1ZowBH/NjnQK5sp3G+N+BTtqh6mgBoc0vX6gvmDyJjJAhTlINf2Ezjbd9TdUREXep31/63eoJKGEljp2zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UkJLzFbT0/hjaCx3wPwyJhhd9J9H8WxFfkSdIDDS2o=;
 b=h7GmnsSvKcbeMswlEyP6wxHjZsjxa0VpQpQEFgXNd1OL227s8tHKJYF07T7ukFN4r/O/cuZhucwAcKdmlQyYzebv5ioW0vR15iOv3TXkFrIbJ5wFR+gKKJ+FPyQa1xjo7iMvHQMXQaasisnnbiFc5fTXmvobvr6qKpMaklojBaLaejgJFrXgyfBU2xn+8PBKwkHLFpAPVVTAvn+Zjr6JENkmG1IxvMEtUjcAkczjgkFld8Zwsu+lO6BQhpczPbUVKGz1Nb4O6OhOLcsGqtC5h4R1dywfG0lA0im/kpxQ6uyIFEzR3AoYk4oJPXllwPXXeTfIEXsmxlawRF9u6Q5kow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UkJLzFbT0/hjaCx3wPwyJhhd9J9H8WxFfkSdIDDS2o=;
 b=nJTE1CGlpXvNHeVJkwxU00wAe126I13qVQxAC/LXfxjrFVz1rjpQQGrcKA08VAr9APhVeU2yUS+j91T8fRyN73w1Ct/AhFIqWhwhtG2ZvLybYOfa5Jw06VALqI9gVCOwkypL7x7zCLWruQnkVMQ356PV8EJXM4S135Ujtfk4U5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB5198.namprd12.prod.outlook.com (2603:10b6:5:395::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Mon, 17 Oct
 2022 19:35:28 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f9a4:8620:8238:20e8]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f9a4:8620:8238:20e8%6]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 19:35:28 +0000
Message-ID: <a1d36d76-396a-0bf0-26b7-c009fbae5dd0@amd.com>
Date: Mon, 17 Oct 2022 15:35:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/amdkfd: use vma_lookup() instead of find_vma()
To: Deming Wang <wangdeming@inspur.com>, airlied@gmail.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com
References: <20221007024818.4921-1-wangdeming@inspur.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20221007024818.4921-1-wangdeming@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR18CA0052.namprd18.prod.outlook.com
 (2603:10b6:610:55::32) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM4PR12MB5198:EE_
X-MS-Office365-Filtering-Correlation-Id: 7775a3a0-72b4-4e4c-bc5a-08dab076be98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xkkHAw76KceK/+3UXKxic3VadHgYMppj2EiDOSpXT72Swn8iwY2M8sSkM2Ky/006XcqGHng3+xQrzaHTdfMTBYaHhxMReuql63oPxB0ZRUxFSoeyTfGupcUcdaWd5QJQ1eGQU89RQQhy8FLhwGMPiLGRZGdgti6inU6Ds7o8Xr/MKXob5mju33r5JtuwgJTI5Hb1T0G9ZXAsawZFSlrugjGMJqA4UmLsHT4NjLDRqM+RUb5coy/4sgeOdOmukdbYCJkjid8TQZSpBdtNeuG0KXQxaiA6BgmLTSamcO4DawhB0ghXcXrZYsz31sJwL+PiUrbR2aTXqcLsyXF9ULgHiwQG1/Kll4o2rz+7DOp9Qu1xT/4DAu8gVL4DjtFqqcm1TOtaxFOyDrqGyAxBOPO/AFnhArJd2u/oPblYfG0tYlis8YjIXAL99oOnKtzVK1Joy6MPls8YFcvIFxYce546I6W1uuvqSboQ8YqrLy7d1o9tFTTE3vh8ACztIkmWfTqRIgI6JpIug94zOS0R2wtGUsgD0nZnz78E/Tgvy7dcV6ejXH+p/g9My/PF+gBqlryerwT9kKVGgaFB+EXxt9yRL8CCtWI5RzwgUihmQ8NLYpxSSw6jrRNRgFCyt2WwnT9RBDdOLN9hfzPR20Rj7iUsHbiNRx7ixqtrfiFusSOA4ddaTl3eweTPUkZC9kue+y9K6VFq6m+a2C75fe0HDPMfZuPVMNKR7pNCvE8i27a+9wnEJG9mIfI4Iohp8H0tkHmtYQkkAkM2Ol7Elmb1g7vZv39LcOrqMoLoGZncPRek1C8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(451199015)(6486002)(316002)(31686004)(6636002)(8676002)(4326008)(66946007)(6666004)(66556008)(66476007)(36916002)(478600001)(44832011)(5660300002)(186003)(2616005)(41300700001)(2906002)(53546011)(6512007)(6506007)(26005)(8936002)(36756003)(83380400001)(31696002)(86362001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mzk5QUh0WWVQTmpqV291T1Rjbmx3VjN4QmRKTStVandyMWVLSDc3OEZlVHZM?=
 =?utf-8?B?QkpoUlB2SE12Ly9ReEw5c3RVYXIxempBelduK21ZTlFUQjVXZmVieHlPTlpw?=
 =?utf-8?B?M1ZKVk13dElzREp4a0UzVnFRWGxTdjFGbTJ3dGdTV25obzVxeUF3ZklYNldI?=
 =?utf-8?B?OURmbHU4Mk83VEZObTRwTk44K2hFczVFS1V5cHQyTWt4aWJzV2VSMzJtLy92?=
 =?utf-8?B?UmFNWXNKeE9pNnErYStRY1M5NFY3V3dNZCt3Q2c2UkI0Z3NyOGVjRzBOQUMw?=
 =?utf-8?B?dkNHWk96M2k2VVpoY1lIVlJmcWhsQzl3d1dRKzhjcnRNQ1ZyU1M5aEh4RkRB?=
 =?utf-8?B?WFRNZWJwQm40QVBNNkg2aWpKV3VObkI2bzgxbkZEUG9KZkVVVTNhZDlJUWN4?=
 =?utf-8?B?dU9WRjFwT2xOWTZPcjhlZkRXSEJqcDg0YlhyQ05jUFcvVmFndkdTQkN4bmYv?=
 =?utf-8?B?T0VoTzhnTjFXNUhpbTJIRk1ZQ2orSVAxME8vdWlmODBmbjJZOCtuRzh0SGFN?=
 =?utf-8?B?bkN4SFJHeVJoM0dzeXE0ZGJzcG1xTGo2eis1b2hjVkI2ZEF6eXlnOHZIMjlS?=
 =?utf-8?B?ZGdyaVVybEJYUUtBUXMzdkx4MlUrbHJzajNlV0NzV3MwY0puaTEzQnBBQnY1?=
 =?utf-8?B?SEZ6TExSTlVHclhTQ2h1ZzdncVFYQlE2SE5YR1J4b1N2ZUxGSlFienlHNWdM?=
 =?utf-8?B?WHJLeFNwdzBrZXVmWWp0NDhsbFVjSlBqQ2FLY3BDNlgzTG9MUWF1bjVPUnVK?=
 =?utf-8?B?SDBhNTJScGJKdEhSVHprS3lsa2xuLzNObk9OZGY2ZlNEeThSQjlLNU5NNUdh?=
 =?utf-8?B?NlJ4ZzVmT2lTa3FhU0U5cVBMelZ3LzdoclpVbnkyWlFrdnhabGlndzZtU3J6?=
 =?utf-8?B?UG1PUmhZWk5WbHFhcE1pRTlXOXF6SzVGd3phcitmbEJ0YTJJRjR1LzZVa0g3?=
 =?utf-8?B?RCtyNnpDWUF2eU9jbCt1MkV4aEhkOEM5QVVPZmZSUU16ai8rRi9ESFc1SE4w?=
 =?utf-8?B?b0JCOGo0N0QyWkZNNjMwWFhxQlQzbkVOeVhaQlRmOVRTQmkvTUtlVlV0SDRL?=
 =?utf-8?B?d3BMb3lWUnZUY2E3V1JyOXl4RG9vT05IcmlFaHRRZ3NXanFwQ2wxR3pMYTdH?=
 =?utf-8?B?bXFpSUEyeXlka1ovN3ZYS3IxdUhnUG9uc0w1MzRnVDRPVW50RitGa2FMQlVC?=
 =?utf-8?B?MVliZlJPZ0x1NTdMT2JUQ3ZyUXY1RWZTaU5JbEtZSDlrNFh4empvcTRJc1M3?=
 =?utf-8?B?eGt4d09hUHQ0aUEweWNtc011S0ZRWXBoZ05wTUNua1RwMGUzNWxnQWJPZ3Fq?=
 =?utf-8?B?YkhGc2kvTkVUV0pyNXhNdExMa25vMVB4NVJ2cEJPZ1pScEFMQTJzc0RHZVVO?=
 =?utf-8?B?dXFWMU5rY1VsbTE5S0ZNeGVEY1Q3L05aU0hEaHNGaG1vbzNMR1pIRHJzdzgw?=
 =?utf-8?B?Ulh0S3huTkQ0Sk1QdGNKWGsyd3VrampLWDlOQ2VvUHk0Z3plTk5Xb1djQVhC?=
 =?utf-8?B?dE13VFp0QzFCdGFZNUFxOTFPUlhlZHBQNHFOSjJRUkcveks3NUxuNDQzZGVt?=
 =?utf-8?B?cFgydjVLZDhGMkJBd0tmS05oT2lUZkVaTVJWZUNkbUJnRmFvc3ZmSXEyQW0w?=
 =?utf-8?B?SzdNUDIrRkl1cy9PYkhFTzExMnZSdDVSdVV3RzNrcCtESUdYZUxlaU9kSmRV?=
 =?utf-8?B?TXhVV0Z3V2craVRiQSt6WEYrcEFmUEQxV3JnM2l5dTNqRGlhMVY4Z0wzTHhU?=
 =?utf-8?B?aG9kNExTVFhhWmpnRWJpYjBKaFhFakIwZS92d25FMEFFVkp2VVRseU5YN0lX?=
 =?utf-8?B?dC9SU3MxQjUxbDJaajRLZUpHMnJ2YngvNE5lWWVvVUxCUDFWSnpUeE93N09Y?=
 =?utf-8?B?L0RYOVczS09CbUV3d3VTSXFxTGVsTzMxalArcXAxZkc3ZkphaEcxTHdIMFhV?=
 =?utf-8?B?eW5rNzdQTVNuMyt0Z3RKOXViUTJ6TVpSM29yR01wM216cFZlOWZhMFFLYzZk?=
 =?utf-8?B?MHF0ODV3OFNLZmM4blYwcFhjc1k3Sk5DRjlUY2JOM2xrTVJkckdpVmhlL0ZZ?=
 =?utf-8?B?QlFyT216S0E4bHhOYk44LzFNcVJXWDhYUGtZSXlHTkpNMUVtQXZPVGg5dloz?=
 =?utf-8?Q?5qQ+FYLbDXQu9fFilPqsDnndJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7775a3a0-72b4-4e4c-bc5a-08dab076be98
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 19:35:27.9469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3aC9M98NxzZeGJH6k1uuuVCILqzIzPM7RynoQegIQ1i6vx5hNJ8SuK5PcuB8YGYQ/2RFvTDUtm0xbXY0fOTVtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5198
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


On 2022-10-06 22:48, Deming Wang wrote:
> Using vma_lookup() verifies the start address is contained in the found
> vma.  This results in easier to read the code.

Thank you for the patches. This and your other patch look good to me. 
However, you missed one use of find_vma in svm_range_is_valid. Is that 
an oversight or is there a reason why we need to use find_vma there?

If you're going to respin it, you may also squash the two patches into one.

Thanks,
   Felix


>
> Signed-off-by: Deming Wang <wangdeming@inspur.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index 64fdf63093a0..cabcc2ca3c23 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -1586,8 +1586,8 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
>   		unsigned long npages;
>   		bool readonly;
>   
> -		vma = find_vma(mm, addr);
> -		if (!vma || addr < vma->vm_start) {
> +		vma = vma_lookup(mm, addr);
> +		if (!vma) {
>   			r = -EFAULT;
>   			goto unreserve_out;
>   		}
> @@ -2542,8 +2542,8 @@ svm_range_get_range_boundaries(struct kfd_process *p, int64_t addr,
>   	struct interval_tree_node *node;
>   	unsigned long start_limit, end_limit;
>   
> -	vma = find_vma(p->mm, addr << PAGE_SHIFT);
> -	if (!vma || (addr << PAGE_SHIFT) < vma->vm_start) {
> +	vma = vma_lookup(p->mm, addr << PAGE_SHIFT);
> +	if (!vma) {
>   		pr_debug("VMA does not exist in address [0x%llx]\n", addr);
>   		return -EFAULT;
>   	}
> @@ -2871,8 +2871,8 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
>   	/* __do_munmap removed VMA, return success as we are handling stale
>   	 * retry fault.
>   	 */
> -	vma = find_vma(mm, addr << PAGE_SHIFT);
> -	if (!vma || (addr << PAGE_SHIFT) < vma->vm_start) {
> +	vma = vma_lookup(mm, addr << PAGE_SHIFT);
> +	if (!vma) {
>   		pr_debug("address 0x%llx VMA is removed\n", addr);
>   		r = 0;
>   		goto out_unlock_range;
