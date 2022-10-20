Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFF960663F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 18:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FD110E7B4;
	Thu, 20 Oct 2022 16:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2070.outbound.protection.outlook.com [40.107.96.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D264B10E178;
 Thu, 20 Oct 2022 16:50:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vrr4X7mT/F8NcMbnDtwIxA0PO/MeqUHuwdvQwET211sIQ8h3Wq6LRv+WwyirgqIP9TAv/LSeuiGXeZnobz6X85LaoJvli3LIDV11Kw1JRIAr3eZyJ+T3Hl0h1OM51N5Xtrln4D8XzkEETGIJA/baqMbZGdKIn2Tx5lpkLpIuK95yEdgGXrSLeNPXabuHKrCZLrmtzf5z2mDjSZveuKqNdKiyIm8Bx2Vv9XAUrVc6jacdtjPklPeK35OJpUm3ffMM+cS+grLdQuc0fa05LsZHTg1GqMAG1j5RY17Z3MU+qznw6Ah6YY2yVIm2qcTwB8FK1RyLy1kFJqODjXZhWK5XLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jedVheM+JrThZ3U5wZlWLXCzJUOc/sbbwwB9b9QfEJQ=;
 b=B7nV9h6FnxBgyZbSd7jBa6jQuoqzP5O+6ThaoTRC7MAupW8HgnOZR5ynFC5H0CbEd3+DmFYDeRKRi6bpJHigP2vwfTH403MkF46j+nTWiGLd7OBTOHclfrSy4Koasrb0nhpyx29Mtxxs/Yl7kTy2MvWsWugFORGDbyCnmbD+ZhcFB7ZcPPNnnnVFbobg5lOa+VsFxJIamPL8q5ToUq9VS4DJeUbep0hg+w/T9W7fXpCkLbMYAtjXN22YtKgdE1e/I8dZ4xNALh7QnyC4b1v7dQcF70/zt1/XJbFIE/iHSSs9/TxOsBcYt2B5xg0NbXjLzZoehTpZdjSdY2hBoQA3eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jedVheM+JrThZ3U5wZlWLXCzJUOc/sbbwwB9b9QfEJQ=;
 b=WOm9kThlwSFbFeE3gMCy5FnJI/vkgQ+N1GrqOI8Ww2JBUiBklyPubB+i9GPPfF/dYSiV+FOF7JY5X/0Z6kxNuPYl8E6cZGuYBy8n+uuufDCmd6bcnKLfJdwRXJhu/azCjlX5Y2+iMd/pAbRO+/3muUqudTpEzUPl7bfcHnuTv3M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CH2PR12MB4056.namprd12.prod.outlook.com (2603:10b6:610:a5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 16:50:31 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f9a4:8620:8238:20e8]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f9a4:8620:8238:20e8%6]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 16:50:31 +0000
Message-ID: <bccdb508-0ced-24ff-3c27-a95d4b1a662e@amd.com>
Date: Thu, 20 Oct 2022 12:50:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/amdkfd: use vma_lookup() instead of find_vma()
Content-Language: en-US
To: Deming Wang <wangdeming@inspur.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20221020082020.1589-1-wangdeming@inspur.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20221020082020.1589-1-wangdeming@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT2PR01CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::27) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CH2PR12MB4056:EE_
X-MS-Office365-Filtering-Correlation-Id: fd171e6a-a4c0-4cdf-cf60-08dab2bb3312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bAR1Gnx4izQVUs6XI5NLcOv0+EMMYUoikcglU2L6kD32RvBAfj1EhbqPt6/ZLtEYZ5rwAb3dywmI/SYpoB5zpoqDKPId30xnx9aDFtYwXLM+QxkHfBJ9ED5wm19jT9/RV/fyd98W5RO8Yaw6ZR14uJa23IiWw5lJ1s60BwYVH+26w2Tx4RtB3RGTSCawg1lQ/4gsLZMrbmV++XQjuWcSRW2wCzkgZvw00wKXNDLV8Bf1pJpqMHADYzJEWc0e7RseOoeXEgtgjOw1HfJsnmMKM7HJEG9YywH9Bdk+EpHhuevB7FzZWNlYLiE7Z76rYGGgEMSIsJuWxcWfxFoBpb2JonXTOvLaj7stK23x49hbMNenXadgpqAU1SIPD9Qp2cLuwGszAR6qkr/+09AdDFRo1XVVbgySjce7/xDXor4pTRZgxcQbQIoU9gVAzQfnkmSeOZqjD2p2o85QQaf0sL7RHK00RlB9ynAdMTT/QPqO9baDXU5akZ9rsX0DsZa/1X99PdmTyKsoVgV6luXPEIz+JqUHcUsyLzMXBtagTX4ZAraU8pxi6BXzowbHSPM76pxyswnIpwPyVrU0IBzSkmTRt3nOJwpcnVo6Oiq1EHvkJkZENJH5xbfflqm/fRecJlsJqHnh+VJ+uj6m8ZdMT18tyRXWPMz/AwGktNYudBI9M8fTMeRUXbGougw1l6GCIZZgicyFmS67qIBR8skHRaYGX2K4G3Hhk7uRoiSkyayp+pAK9KarUf0d5aqIDbjJEgKRVcY/I4dz3hh8hwjHSN41E6x2Y2GtiQdKXOPR1mJwzRw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(451199015)(38100700002)(86362001)(66476007)(5660300002)(6512007)(8676002)(8936002)(41300700001)(66946007)(66556008)(26005)(4326008)(31696002)(316002)(2906002)(4001150100001)(186003)(44832011)(6506007)(2616005)(36756003)(31686004)(6486002)(478600001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlVsTHhXZld1S1JEY2Y3OVNEUE5EQmdBY0tGK2Z6ck9xdFBRYjZGWHN4M0NE?=
 =?utf-8?B?WXVyTU1CRk9XZ21wVkduTWFsVngycUE2dXVqSW5aSkNueXZhNW1qVnplUW0r?=
 =?utf-8?B?MFVPNmJpMU9CMFplTmUzdndoMDVxM2NQSUxaNVVhR0x4djhHZ3JkUmFpNURh?=
 =?utf-8?B?QmxBSUdzd2xiSGdBKytVWkh2alZQN2llTGxqOC9MUk5hdFEwckhod0tEK2dh?=
 =?utf-8?B?ZFROR2hPRWthUksyVXcrSUdoSmFscG5MNGxmWUZ2LzFxUVBhTllUNkEyYXdp?=
 =?utf-8?B?Ryt6QnBTaVZScFZVUjE3akhaSTByMTBacVl5WXNpclBDczZEM0llNHJ3bC9j?=
 =?utf-8?B?UnhycVVTUHl6L0YyWGpFQk51TTdVeU8rRkM5OEtZanlCS0JML1laMUdqRWdF?=
 =?utf-8?B?eXZlVW5jSEVMN2czcFJPODJ5VWQ0MVdtRkZ5OHROaTZraUxHMEFZYzFja0p0?=
 =?utf-8?B?QzFVMWFFK2pvMEsvSk1LVlR0RHB0bHA5TmpaNWd0elg0cFhENGFNb29iZjkx?=
 =?utf-8?B?WFpVallHSm9LSklZSzcrRlpMbFpISEc2NnJyWll6SGN0b1dmRnVMNEt1emRK?=
 =?utf-8?B?MHcxODVYTnEzaXdwUGx0OVZVK2V0V1NXK1NheVZnamRqTzltdnZWR0F4cFVh?=
 =?utf-8?B?VmVEMVI2YitWeStDa29jbjhqeUNpU1I3YWdST29XV256Z3RqemhwOWtRenMz?=
 =?utf-8?B?cERFTmF1VnFuWmJCUUtDajZvdDVTSzM5SDhkSmtBMHBHaFhQZVhEOXd3SUI4?=
 =?utf-8?B?SUNsZWJ2LzByaEN2SFlYZDlEc1pQRUJjajVWTmFFUGFTTkxzemluYjBKTGps?=
 =?utf-8?B?S1BUZTBLdStGS0VXVktkYzZsSFRiRzJyRUY5RWR2Tlg0cnJUMTIzT3hvWnUy?=
 =?utf-8?B?cWhGSWcwZ2p5cnJJa1dRd2MwTllRWFVnWi9KVVFKUHJkT0FYVzQ3WW5sVFdM?=
 =?utf-8?B?Tm5sRUVWMHpOekVpY2JYejZUaTg5MW9zMC93Q1YyWEVnQkFJRlZRU2IxRmo1?=
 =?utf-8?B?ZlRPWVd2SU5lRmFjekRqaFRyQWRweTlTMzJGQ1FIQjVIR3VWcXllUm1SbzdV?=
 =?utf-8?B?TFRWSkc4ZWwyK0g5ZlA0TCtreEhaa1R6TlBBeTBGVWhidjNrd0piVUR0T2ls?=
 =?utf-8?B?Sm1VcVVxUDMwVEw3OHhDYnZQOTVNNUxDTTA2Ny9uclFYVmZFeTJHZkdaYzZz?=
 =?utf-8?B?RnluSENzYmZadStKUVRwQzcxZldMZVh6YnFTT1h3TklkaXhvaDRjcnVzb1NR?=
 =?utf-8?B?SnA1alB3TC83Zk81dnRrRnE0czJDaWdkbEFPdEdPYTRKTG9RcE52bVNCUDVs?=
 =?utf-8?B?U09PNXJYeVM1N0JOQjM1MGJCbG1BUG5ybWhYWmpOQnBYM0N4bEllcHhLSWlD?=
 =?utf-8?B?WWl5d3NoMHFWc3JFZWY0N2x2Y1hYTlpOcU4xVlZpaWRZTk10bEljY0dzYU1m?=
 =?utf-8?B?Ky9BMVdJcldIeERpcTg4TXRlZTVDMU1tTUc5bFdDaW45NlRhcytNYlJzV29F?=
 =?utf-8?B?bmFnZXRORkpwczFOQW5Cby85WkdvQkRjU2FHbUZjMVJzdjljdFBRTDRwMFc4?=
 =?utf-8?B?WDJHd0NRQWdmeTVNZ0FwUUhvdUdiemZMbVNUcUtxVFU1VDd2d0tLbTd0S2V3?=
 =?utf-8?B?Q0tSMGxmWE1uL0Zjd3dGYkhHS3dva3hqK0xxb0o5WHpWVzNxNlR0K1ZkVzBJ?=
 =?utf-8?B?emNyYWx5MzlJM0ZCS1VmS2VuMmtoNVZYU2o5bGdnZHpMdTArS3pBZDlwQ29Z?=
 =?utf-8?B?WlI0bnNEeXdBdHJVeWo3Zm9ka2YzcDlNclk4YVUzTUNCWm1kNGl0b0JUOFF4?=
 =?utf-8?B?RytVOWRDV0VjSWRKRi8yOTlaZW9sa0xBeng3QlpDenZENnhVRy9KQlFVbDJz?=
 =?utf-8?B?cEZseXZXSmxNamF2NXIyUVVlYXkyeWkwZGFPNVYxek1haFZQS2kyMEFUWWFl?=
 =?utf-8?B?b1k1WHZmVjJHU1F4S1dONXVlTmp2elk2WWRuOUpQS2o0U0JnYzRLRy9ZTFI1?=
 =?utf-8?B?c09seUxwNzNJVGJ2WmFyZWNoT2l6VlRRNXhZY1lMR2pMWEVmOUpNOXE1L0NJ?=
 =?utf-8?B?THRQOC9NNVZTZEV4aitMcWxRQi9tSWxTdEc1bjFLREZsN2FnNU9IN3hFOTJk?=
 =?utf-8?Q?U64A+H63Zjg6AMpYyIRiRjI64?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd171e6a-a4c0-4cdf-cf60-08dab2bb3312
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 16:50:31.3094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: folDD66xi+/2G3reWq78aED7DIyrhI6bK9SjsMmsFeCHi3zTfDDjf9gtkljxUIBGn7JoQBkbE5FrQzu3O0GJzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4056
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

Am 2022-10-20 um 04:20 schrieb Deming Wang:
> Using vma_lookup() verifies the start address is contained in the found
> vma.  This results in easier to read the code.
>
> Signed-off-by: Deming Wang <wangdeming@inspur.com>

Thank you. This patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

I squashed it with your earlier patch in kfd_migrate.c and submitted it 
to our amd-staging-drm-next branch.

Regards,
   Felix


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 17 ++++++++---------
>   1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index 64fdf63093a0..0100812478b2 100644
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
> @@ -3152,9 +3152,8 @@ svm_range_is_valid(struct kfd_process *p, uint64_t start, uint64_t size)
>   	start <<= PAGE_SHIFT;
>   	end = start + (size << PAGE_SHIFT);
>   	do {
> -		vma = find_vma(p->mm, start);
> -		if (!vma || start < vma->vm_start ||
> -		    (vma->vm_flags & device_vma))
> +		vma = vma_lookup(p->mm, start);
> +		if (!vma || (vma->vm_flags & device_vma))
>   			return -EFAULT;
>   		start = min(end, vma->vm_end);
>   	} while (start < end);
