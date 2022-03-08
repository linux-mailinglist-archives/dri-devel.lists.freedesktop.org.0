Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D2A4D227C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 21:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296B210E245;
	Tue,  8 Mar 2022 20:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2066.outbound.protection.outlook.com [40.107.102.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1359A10E16D;
 Tue,  8 Mar 2022 20:24:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b50AEqBcmROQJkAyA7tKh7lizg3Sf83xwbMf03y29BOCdsllRuTpP5bXuFdLDHhVh7GZd520zxTASYUQ0FQ7dRMpcr4GiufDoGdIa1RXF7v2IQqHpp5F7bm0+PRNNZN1Q+N5Wt40Hw+/ZY4l7kXZzo8DkjEAKMRdMihzWH9ZLDgUt0ylekvbD+rtiyV6w9zA3ch9hKW5bjhxW1nFOyuPMfJ1EiI9SgJyFXr8xZflHZ2/bw1gjpKoS5Y/MNJI5xZeqngSZ1yYdyBbe8wmt88RQWi03FTZ2+iR1QWbhcID9exhn6FsrLhADANveUCuiZIKAhtH9/sqyamX7zy4Bd92IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXwJXNe6bugdnDeDieCAgDGG2eNiNZq+uORYggd+rR8=;
 b=Qk3tWPB+wnbZzZ2VPRQem8vwA/Tyj1oASYSrC+Mzr/OxnPkb0wn0vJdR9Fp+24Wlu9SRZiMNSJ3xkYocajV9K1okvbAbQgZw5BvuVmSYDE6gM+rbeXu4OxcZPGFa9P56ZgryxxjFaKiGQcqj7MOhutqhWhFPrfI36fQOCDABSIDpoFNb6KXZxbuCvJm5ia6ZvDwbOU53jOVSaKUUw6MLLbKSnjNSz2CR4/H49Q2Dp5x6qr09HZYNWOlEg6iOnmpjIMfnmAexrPXsyI/Ml2OBUpebYMsD0YVCwqoqPcDt2EqFz6nWTFpNzW6dJ9+NZlL1TcJZOPX6j6CTyEUxInnicA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXwJXNe6bugdnDeDieCAgDGG2eNiNZq+uORYggd+rR8=;
 b=Dmx4Ch47dxEM683QAp97tXVNf8hdGRXOS+ZUXC5xb1O43WuKJBMyq1/EeGmUHhmnEZ5/TbKAECLubKKg5vk8n0lpTy/7xkq57Yy166jevDn9a8nrO49tabdY6PDrw0sHlOmYgWq2+mDM7wuicbyhVw2lVUkhVtO7rKG6zR70uHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BYAPR12MB2600.namprd12.prod.outlook.com (2603:10b6:a03:69::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Tue, 8 Mar
 2022 20:24:45 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::b030:b1ba:4eb2:7fb7]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::b030:b1ba:4eb2:7fb7%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 20:24:45 +0000
Message-ID: <943f605e-4da3-9694-1358-fc2357de1451@amd.com>
Date: Tue, 8 Mar 2022 15:24:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdkfd: CRIU export dmabuf handles for GTT BOs
Content-Language: en-US
To: David Yat Sin <david.yatsin@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220308191148.13861-1-david.yatsin@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220308191148.13861-1-david.yatsin@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0092.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::31) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbe53f83-e4c0-416d-40e0-08da0141af8c
X-MS-TrafficTypeDiagnostic: BYAPR12MB2600:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2600037B10EB2856FE83422C92099@BYAPR12MB2600.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /RXc7SH7o+jsLQkyyy9JMVFvtNoiiGh4tH5zO1Uudcf+hJE3HkFQRGXw+PeBALHV28luVgR9GZb1/ZsPLZTJ2N8pvTTYj6EHnrp17QxGQPqfLFgvOz6tPB80ATkzO0h7iC+Bla+1sNk0buwQe8cCZAGNMOeUik/MgDvStp8DvyIPQnReyVq8HlCrdACIffSznq6lgwmKIc+sTHywFbUnetRB1VmnWAeFueTmnrnoxkrzZFUVrLSazPmgn6OaHPqkW6LNq7I2nkBw7W5jPxAIqelkPGYC0Hgvl+W6rcFhJH2+4144cWhCllVPvSwLtSsChJQB8/0OkAdcL4J4Aee5gpJ2z9i2WbpLiG42G+1W65SDATSejXmspODCbc7EpfF0VScqQkyASf7qSlgWDRDK5/TZ7h5gb0Kttvrc6LMJ/ff3zgKW0pdTB0rlhRDlMBtefyauxvSxTTapMwcHVv+atDVE8uhz4rktdbNAJit7lZTrR282qAUX2X+CKiKoydVPjsE0cP7tBvzjx1pUkUgZBPNd7kSFdSHxEPfYtmvm6hpS6nE21YyTJW7i3skBVi3eNLse9E5GIMlBxDcVM9iyaWSdQ5g7BjmZEqfS61eDOdzT1Tj6OSUv+2wNSroNRKih1LJAU7ReuMBIbRUpV9vcs8xhRRa4EF2mLMHnuaFXq3HKdMB4QUOyUB02VUtfCs0cm0Fl1mgFO3SlI30jULlc5aQtFlCSCcaGKB85W55TqryJOhSR6gaVJIvC5GNhUHL/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(450100002)(38100700002)(8676002)(66556008)(66946007)(66476007)(508600001)(36756003)(26005)(2616005)(186003)(31686004)(44832011)(31696002)(86362001)(83380400001)(2906002)(6486002)(6506007)(6512007)(5660300002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFY4MWhaaURXQXNld21jcHpocTB4SkptUkNqQXpaSDFCU0diZXFBL1c4bVdr?=
 =?utf-8?B?ODgrRFVtOWVUZzZJL3lLb2g5WGlic0lMeFo5ZERLZmV2c2ZHenJ5b3ZNdDZE?=
 =?utf-8?B?azBBcVFJbHNLOFFJcHhub0dkaW1lK0FkWmxUUEZZbmZwTjQ0MTFpWUtFSXRz?=
 =?utf-8?B?WVIxdGZ1SUVsUUhpTVA2ZlBlNTZFeEJJemRzYUpkMUdqUWlseFVHTjVzZm5F?=
 =?utf-8?B?VE5UZlQrQk41YzYvWk1tT3AvS2JUNmJkU3BYWENmc3Q4TGtkeVprNnNMamZY?=
 =?utf-8?B?cDk2bW1KRVZQYU9Nb0svUzhuRkwvQUN0N2g0bStucW1PbStiRDlYUTdGWU9D?=
 =?utf-8?B?WmYvTmVibUJSczNEM0dlaGU0R3JJM3dXRHRXdzRCSjVHU3J6SWNrRmM3Rmls?=
 =?utf-8?B?c0t4TlhKRGsrYkYyOGFFYW9McThCUHMzRU14SmdaSUxUdmZVc3QvTWJjOWVW?=
 =?utf-8?B?Q2REeDZacEh3UTIvMTM5TWplYzZJTUQ0aUtORTlmaU5qdFM2bmRhVHJPdUxx?=
 =?utf-8?B?Y00za055L0RHSERZeWw0VS9wbUYrRGRLNkgxVGRmdGpEN0c3TnBNbmZjdlJ2?=
 =?utf-8?B?SmNhaGgrWjhLbnRJTGhVQVJQcVV1ME55NHM1VXdENU1CRkJKNGZrYURBTUR2?=
 =?utf-8?B?MWxXcGN0N3NEWkpXMHhEWUwwSFhwZmxFQzk5N0lGWGtwR09BaWtuSjd3Wnh1?=
 =?utf-8?B?SVMxbHBaRDRWMURTUEMwOSs1VHlwVEZsKytsalY2WlYvWjBmWnpCaXF2cFg5?=
 =?utf-8?B?VUtvYnFvdjA2MXFMSlRqakpkeWQwT0ZvOXBLUTNib1k4V3dDU2xoVXMzbHJK?=
 =?utf-8?B?WWpodWhMNWNVcDlmTitmYkJ6a05DaXhnNHM2bnhTMzFNT1FIV01lMStJZG5N?=
 =?utf-8?B?M2h2WFU3N2Y0QkRXb2JTTUFkTzJGODhxaG5Iekd4YVcvZ29SeHJLRmhKYmFI?=
 =?utf-8?B?dzFHVHdYWE9Ld2hYR2xmMFdXWG1jK3dSTndKQUthQlBkVC9TN2lpRnFVd2xL?=
 =?utf-8?B?VEd0NVpkOWh4VHBIaFVzTW1tbzdwZldaR3JMRDUzOHhrcG1uU3RtUjI0dm1W?=
 =?utf-8?B?YnpxM2d1TWxVbWdTVDcxaENRNTR4M29LaE11bG1rcmwwYXB5WSthNlh1QjNG?=
 =?utf-8?B?Q0hPaFBvL2VWWHp4YWZqSTVJbVltZEpSSHJ4Q2hjK1c1S200cVNuNUF5V284?=
 =?utf-8?B?WEtSMGVWbFNqSDZJb3BPWGI4UWdBWE9xNjF0Sm0zRW1xN0NuUVZTV093QmVV?=
 =?utf-8?B?eEdrRDUrek9hdkhxUldOMng5ZjFJN0hrbFFJbll3ekp6TDV4MVlERWo2eTZU?=
 =?utf-8?B?ZnpJMW9oWm10SFVxS2FKNWRxblJvS1JEYnV5RitWY0F5QW1aWkY3bXdHWlds?=
 =?utf-8?B?T3YzYjRuMVVvMEZOOWZrSGVodzZvVmRtSXdEVmxMN0ZLdGVRSUVWQjZReEIz?=
 =?utf-8?B?bVNpQXphVVIyZE1NMnRFRXhHbVhXelZXdFM4YWZKK0NZbUhwR2dVZSszZFdz?=
 =?utf-8?B?eTBreE9FY3pjR2tBUEZkWHh4ZDlENTVwVldpaXpuZC9yNUZ4ZndBS3BUVTZW?=
 =?utf-8?B?b3NUZ1BRYVFvaGFLK1lQa3BxR3ZYK05jTnVLL1hMSXJmVjBENTc1aDA3Z3VM?=
 =?utf-8?B?a3g3aFdQRWJnNGhvYkZTMk5XVENra0RUMkdPcHIxUzR5dkpJRTh3Ty9FbE1V?=
 =?utf-8?B?TWVlQS9wd2lMVEh6QUlkTkdKK3ZGclVWV29qQTR0U25SQ3JFMHZWdkxhRm9o?=
 =?utf-8?B?WUEwYy9XdVRNeUxUQm9VR1BRdmZweHQ4SlhrSVBIMlVUbW9BTHNUeHI0emc1?=
 =?utf-8?B?N2ZZL2M3SkhLTUFBMlNFZFV6a0thajZIZ1dhNG44WS9OVDNkZ2Jrb0h2UkEw?=
 =?utf-8?B?bFdaSXRUQ21yMUZyM01TQ1FDZXduQnI4c0M1bFVlUHc1Mm44VGVHU2dZTG5j?=
 =?utf-8?B?U1pNMnM3VzlWNFlnbGgyaFV6cEYvbnV5MzdTcW01YjYrMmxlR0pQQXRzeE5H?=
 =?utf-8?B?K0xzS0c3WG9lY2FZZXJOQTNPNkpEZHJOWEo1MXZxaGlUeDNaNGFEQ3V6Slg0?=
 =?utf-8?B?Z2NiOWdCZjJGOWQrbTBxaDU5RWlOMUNFOWdLMW9GSDVjS3d1cGZXUFlKSnFI?=
 =?utf-8?B?d1A2TTdPQnBKcE4wTEliZmxOanQyaDRmcmlMOTFQVFlzS1pFVDF4QVhTTzAr?=
 =?utf-8?Q?FTs1khNwKmOSO9Z2vTgFwrI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe53f83-e4c0-416d-40e0-08da0141af8c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 20:24:45.7615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJLrq/3xq+AqKO6AkOKQ1dN7BD2dX5RkIYLxAPQfDQZJuO6CwETSWHYaxpFDOsOiQcFvx8wbfc0tEfewzyFgYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2600
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


Am 2022-03-08 um 14:11 schrieb David Yat Sin:
> Export dmabuf handles for GTT BOs so that their contents can be accessed
> using SDMA during checkpoint/restore.
This deserves a minor version bump. The plugin should depend on that 
bumped version when it starts using dmabuf handles for GTT BOs.

Regards,
   Felix

>
> Signed-off-by: David Yat Sin <david.yatsin@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 2c7d76e67ddb..e1e2362841f8 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -1759,7 +1759,8 @@ static int criu_checkpoint_bos(struct kfd_process *p,
>   					goto exit;
>   				}
>   			}
> -			if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
> +			if (bo_bucket->alloc_flags
> +			    & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT)) {
>   				ret = criu_get_prime_handle(&dumper_bo->tbo.base,
>   						bo_bucket->alloc_flags &
>   						KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ? DRM_RDWR : 0,
> @@ -1812,7 +1813,8 @@ static int criu_checkpoint_bos(struct kfd_process *p,
>   
>   exit:
>   	while (ret && bo_index--) {
> -		if (bo_buckets[bo_index].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
> +		if (bo_buckets[bo_index].alloc_flags
> +		    & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT))
>   			close_fd(bo_buckets[bo_index].dmabuf_fd);
>   	}
>   
> @@ -2211,7 +2213,8 @@ static int criu_restore_bo(struct kfd_process *p,
>   
>   	pr_debug("map memory was successful for the BO\n");
>   	/* create the dmabuf object and export the bo */
> -	if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
> +	if (bo_bucket->alloc_flags
> +	    & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT)) {
>   		ret = criu_get_prime_handle(&kgd_mem->bo->tbo.base, DRM_RDWR,
>   					    &bo_bucket->dmabuf_fd);
>   		if (ret)
> @@ -2281,7 +2284,8 @@ static int criu_restore_bos(struct kfd_process *p,
>   
>   exit:
>   	while (ret && i--) {
> -		if (bo_buckets[i].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
> +		if (bo_buckets[i].alloc_flags
> +		   & (KFD_IOC_ALLOC_MEM_FLAGS_VRAM | KFD_IOC_ALLOC_MEM_FLAGS_GTT))
>   			close_fd(bo_buckets[i].dmabuf_fd);
>   	}
>   	kvfree(bo_buckets);
