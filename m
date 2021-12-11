Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE62470F9F
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 01:55:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6127410E56A;
	Sat, 11 Dec 2021 00:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31E010E56A;
 Sat, 11 Dec 2021 00:55:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfCv6HjTVc/HFI9Hq/VK+kABT152VwtyjjrNTEbrWaF2XT7GmdTN+A029jyTbTOfttLlhzMOtadZ+Deg2pXHlgXtqIrR1UKEM8eMayDUqVLNJ8R7lihIJGJKz6nJvxx1nFPAOBlq9cHxmQbW6LLxdnz6TBXCCo0qU0BwlZSGbK2CGvgXynTzqyXF0A4bo01gUVa1cIkxFKsNXgiDUBejIPWHyg14JvkGHc5Y4oZQz234f/L+YZNVLngX3U2NHkZEimbFLEfvQVkUKCmz2wwmegBUTE4oMeijcIgyRmYFPfC1vbYO9oo+bFSTM2ZvjJBzpf4+8hHbGcn43/IpGKtB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FcdSn01JrjtxLW8y8+APmyC+ywte9bTPlIfw4fVS0Q=;
 b=dma4Nfk7hayGWH1KqXXqnLkF9hyLYVkseoq2ri5wk/CXz5weq0Xb38dovOpd9woiljUCsoRx6n9Wep1BWdMT4rlQC/bwJw/Fn3c61mLNphIsamvlzJWtdZPazLPUSUSJsnRXNZL1bAArQ7r0Cux7MCLEQc0GcVhB4mEKLwX+UA5S701JLbgtGYboBBz6cLFgRFpXAMUzrAV5aHowMw8F+xRIEs+D4wh5khRfGolbkqdX8sYqVAaG0grUnCRc51LxVy7dc3DtJCXqGxV5R4Iy7kUZkljC8UekcVELLakwzFywg5U+neWSZADjXpxMeAmFsN92WIf6kbNNN09Av2usdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FcdSn01JrjtxLW8y8+APmyC+ywte9bTPlIfw4fVS0Q=;
 b=G/aOGKhQMPgyJXHqgPjuEPj3tu8DpRiZSFr2R+gdnMeyUBCfn2HV81Q9Nrsi2Th8Llk1Dip0L3EB3uZTjaY6FUwOBbOSJL1MxzACNeuekqqVlc+7WA2GKDMp9QLHt7XFdr2kx6BkJgT5o4GdiNmqguVPA1+aAX8os4IOJVk7YdA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5034.namprd12.prod.outlook.com (2603:10b6:408:104::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Sat, 11 Dec
 2021 00:55:50 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300%7]) with mapi id 15.20.4755.022; Sat, 11 Dec 2021
 00:55:50 +0000
Subject: Re: [Patch v2] drm/amdgpu: Don't inherit GEM object VMAs in child
 process
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211210214802.12620-1-rajneesh.bhardwaj@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <a1a865f5-ad2c-29c8-cbe4-2635d53eceb6@amd.com>
Date: Fri, 10 Dec 2021 19:55:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211210214802.12620-1-rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BL0PR0102CA0035.prod.exchangelabs.com
 (2603:10b6:207:18::48) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
Received: from [172.27.226.80] (165.204.55.251) by
 BL0PR0102CA0035.prod.exchangelabs.com (2603:10b6:207:18::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.25 via Frontend Transport; Sat, 11 Dec 2021 00:55:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c308301-4af0-4589-42d6-08d9bc40f998
X-MS-TrafficTypeDiagnostic: BN9PR12MB5034:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5034BA2A107A82F82900600B92729@BN9PR12MB5034.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G6o2hBrHdrZ4cVeIWEarKHdk3KD018xNL4WKt70k6j0PDFX3Zkjg4+5ilvJXS1s6QC1EdZ1WkulzMVb1R/pYMWP8CjGdrvhCx8iu67jSxW8Y6wG7PXbeQEJeZxR+jjeJ1s9RnGIRwT609ubikWQWsYE/OD6zDKHq/PI7foB6LAk1r26Uv31bP7QdlX6RJnPJQCtw537qQXTX/lELHYSibxqqgiwHsYlWDR00G8GNWWSnHt9tG9Ac/Qg88zVeYZ6ZVv/KisIuF9dyaeKIvfNiBKDZmJA/pskNtfg01DWon3bvCS83SXeqhphewhl9YvteECscwZOlbYt7n9IvHUaR8SovVag6sBwU/hprdjQGi1xTL7kfk/lK3M0a9ZO2VL4rs1LRGlO5azxyRp2j6DvWMpHrvWel+vn7/xR8IwV4v+q6Fr2eQnFovddWvHeDnPjP6PXzuuzsL35AkFEb1UJ1nhto69CUnGT2qE53sThvaV/xFtBhy7gdE0lg3Q05xGPUrj71JbOiigzM10RWTXsSx+fJk0ngRNWTpiJ8DBSHQIkkdrLBGFHroUn0d23tDkyNPQkX88NOk/7LhZ+VlqlwubwgJgyVDxKUQnG+8bypYZxlgAeTmUEOex9qGs4+Np2twyyvqCTJWPzTQO7z1y5I6xNUesf9Zi8zvf9iXiu79EiKonjq/KWC3GmhRMOP2VVPU5Vq5DhTnZj9nGFs99cnkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(8936002)(53546011)(316002)(44832011)(36756003)(38100700002)(16576012)(31686004)(5660300002)(956004)(6486002)(66946007)(66556008)(26005)(508600001)(186003)(31696002)(8676002)(4001150100001)(36916002)(2906002)(4326008)(2616005)(83380400001)(86362001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVd4bWhSWXdUYWpGZ2Ewc0JMQ25MVkh6TUpwQ0FYVmt5bXliY1dsU0I0cjJN?=
 =?utf-8?B?S0l1aUlFRWUrdGdocHo0NXBZUkxtUUFaTWY2ejQ0UVZNb2lHUUs5b3loL0NH?=
 =?utf-8?B?c3FyL1ZFcXVKVFNzbSswLytXL1BsWXFDUEc5TElXUUJPS0VCRmdNdUZpcEh1?=
 =?utf-8?B?eDF4SXB5NU44WmtXMnN0anp1MHUwNU5ZQTZBejJTcWprQ1A0K1dlTGVYMmZV?=
 =?utf-8?B?eGtFVU5uVTFkVUxDM3FqTmhzMWk1RFlHK0lRRVEvTmpWT2FmYzNnakh0M3N5?=
 =?utf-8?B?cWZzd1U2SGF3ODVGMEsrUDQwbUlrVUt6d1MwR3FTZkFTbFMrbWpORWRVSmd4?=
 =?utf-8?B?RmdrQ3hyN3JncnFYeUtaWEhFanI5Y0c5a2tiTzNJTVJUeC9LMVlxN3FPbVA2?=
 =?utf-8?B?eTJ3VnVJSlM2cCtDakNzaCtHVzBSTmZIVVNXUXN0bUtvRjMvdXY2aUcwV0pQ?=
 =?utf-8?B?S29acGZ0eHkzbmJCZUJ2N3RvZVR1NzZSV3U5T015TEU3aDdTNXQrTkdwWmdC?=
 =?utf-8?B?KzVpeWhSQ1RFQm16OS9xOEh0dS9xR1NuY1N5cnk5K3pMalhTekhMS0RGMmZl?=
 =?utf-8?B?S0E4aGo2TW4zNzlXOVdCeUVmcjJxZjZPeVZYUGhZQ0tjRDJrbmN2dGVLeTBB?=
 =?utf-8?B?UnNZU1FJbTNmNTVUN3h1S0Z1dG83N2NySnhWYW5mY2hwcUZrQW5XakI3Y1Zr?=
 =?utf-8?B?OGQzcDZoMzZqVmt6REMrMy9NNnVLdE9BcmZtOUc4dWFCSy9rR3ViaXVHcVJj?=
 =?utf-8?B?VXdoSlhjaXc1YW00WHhnQVptbFI2dFVaYmZrbmdQZVl5TGtKbHJVNVBxNjZi?=
 =?utf-8?B?SEQzMFdtVElNV3NZS3doL0EzMHJoRDYxVE1TSXBVNFhmNXZ1VUZaOGxwWHJv?=
 =?utf-8?B?N0lxZjF5cVBPNi9uU1o3R0Vxdks0M0JleGJkQ0E3ZW5FakFxM0dqTFYzK05x?=
 =?utf-8?B?ZDVmOXRNbktHZE9lOXVQMWFleThEeTJ1QVpDZ2ZXKzd2cnJsZE9xUVFsRndO?=
 =?utf-8?B?cXhnQmtWWndadjVrWkRFLzNIVlB0SG1XZ2VLZjRFVkx3WTQyU2p6RzE1dzUz?=
 =?utf-8?B?OWtiRStlWUc4VTRkVWluU1BXTG5ONXBBaUhNUHVVMXNkOXdrb2ZSaVhIRC8y?=
 =?utf-8?B?ZWVadWVPRzhZbTVFaFg1V2JuTHY1YVRpM1VCUDI1MGQ4bnIxSE5IcWhDNGl3?=
 =?utf-8?B?aTJySDNOR1VrQ0V0VDF6TjYwaEd2bndlb2U3V0Y5QXFUNEtCYnMxVWU2L2JC?=
 =?utf-8?B?MTdKWWpOTzhmZTQrMHg3Vk9zNHR6elNVcmxyTlZlU3YvMU5sa1p5M2lPeVlR?=
 =?utf-8?B?bzRNQ1NNM3lkOXB3RlFxbXlITnFON0ZUaG1sMSsxWS9FaGh2SnQ3c3NIOWdF?=
 =?utf-8?B?RkxDV2psLzRkeUhlb3JXM0FiUlRPbWhXekFvc3g3YW45Um1SWTIrY3lkWDFX?=
 =?utf-8?B?cFZjcERNS1B2cmM5UnNtbUs4ZWR3OVNyWVRvVEx0SU5yM255a1Zzc0pjNzMv?=
 =?utf-8?B?VDhObmdxc2xNdm9JLzJaWnpvdVlDYTRQbW9qcjBySTFVeloyWS9uUGZycmY0?=
 =?utf-8?B?K2xXdVRlT21mc0dIeTVZL0d1T1VETXZVZmFhWkUzS1o4UEtDNmU1ZEIzdnhv?=
 =?utf-8?B?QXlJVWVpZlZmUTdSL1Vvc2VRcEdYNUdpR3FKaU5za1o3YmJDdzhNUVFFeVhV?=
 =?utf-8?B?bGo3UHZjakgvR0NWbTN0Z2ovQ2VWTHJQaTdwMXc4T0FyOTBVQlVIR3hGL0RQ?=
 =?utf-8?B?d3d5Wko2Y01FQktjUjZBdmZyYTdPdVdrVGtyN202VmJkays1V1FVWGRBZS9C?=
 =?utf-8?B?WnBST0RYK2VCc3RZaFVuU1JRbFl1MXlhMFBoeEgrZ3NnMVFpQlBrdUU2SjF3?=
 =?utf-8?B?QnQ5N3VxcGhKLzJjank2cFdjMDdHeWJMVkp1d2c4ZElCVFZaUmlzY3ZNeVJG?=
 =?utf-8?B?bmExNmV4bngvMC85VFdXUnEwcXozbTd4ZytwenJESi9tdk1PTm1MYXRUUDIz?=
 =?utf-8?B?eGd6NENLTE9ORTAwOXpDZ090RUc3eldvMnIxMGx4aDZRaDVVajFPK2w3b2ta?=
 =?utf-8?B?OEl2b1JmenlFRzRPLyswdkQ1SDltRGhycEt6UCsvQ2pOY25ueWRUeThsbUtL?=
 =?utf-8?B?L0hwNVVObHdsUVk0azd3RGE3a1VDM3pQVmJWRHBpOThpQXJ0L29sN0hKV1g3?=
 =?utf-8?Q?wwfhg0iujzvH6C+9v2q6GxU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c308301-4af0-4589-42d6-08d9bc40f998
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 00:55:50.2205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqkmejDaQTWp1Q4Iohsx7umlwB/3IQU0D9ojo5uH7yPV2mged3wnbs6k3xw8DaRHmVblvL0I/t/Da8gx9/ZSgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5034
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
Cc: alexander.deucher@amd.com, airlied@redhat.com,
 David Yat Sin <david.yatsin@amd.com>, christian.koenig@amd.com,
 daniel.vetter@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-10 4:48 p.m., Rajneesh Bhardwaj wrote:
> When an application having open file access to a node forks, its shared
> mappings also get reflected in the address space of child process even
> though it cannot access them with the object permissions applied. With the
> existing permission checks on the gem objects, it might be reasonable to
> also create the VMAs with VM_DONTCOPY flag so a user space application
> doesn't need to explicitly call the madvise(addr, len, MADV_DONTFORK)
> system call to prevent the pages in the mapped range to appear in the
> address space of the child process. It also prevents the memory leaks
> due to additional reference counts on the mapped BOs in the child
> process that prevented freeing the memory in the parent for which we had
> worked around earlier in the user space inside the thunk library.
>
> Additionally, we faced this issue when using CRIU to checkpoint restore
> an application that had such inherited mappings in the child which
> confuse CRIU when it mmaps on restore. Having this flag set for the
> render node VMAs helps. VMAs mapped via KFD already take care of this so
> this is needed only for the render nodes.
>
> To limit the impact of the change to user space consumers such as OpenGL
> etc, limit it to KFD BOs only.
>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>
> Signed-off-by: David Yat Sin <david.yatsin@amd.com>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>
> Changes in v2:
>   * Addressed Christian's concerns for user space impact
>   * Further reduced the scope to KFD BOs only
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index a224b5295edd..64a7931eda8c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -263,6 +263,9 @@ static int amdgpu_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_str
>   	    !(vma->vm_flags & (VM_READ | VM_WRITE | VM_EXEC)))
>   		vma->vm_flags &= ~VM_MAYWRITE;
>   
> +	if (bo->kfd_bo)
> +		vma->vm_flags |= VM_DONTCOPY;
> +
>   	return drm_gem_ttm_mmap(obj, vma);
>   }
>   
