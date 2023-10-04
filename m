Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 879477B85FB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 18:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF6A10E399;
	Wed,  4 Oct 2023 16:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0494E10E399;
 Wed,  4 Oct 2023 16:59:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WK1ht/KeyVUSrFaSj680f6jo/n5SsnbZyD4FfMsIquZRyKQ/UsQXCH6JE0Yrn7zUgNMh+3q9llQ5Bg2ibUiVxcEUOPPdl6HG6PImNomkcZHHYL6sSlJGXKKhNZxDYFfXud6O3q4i39FGKE7N0kcXyciV4Zt2siQ/Mews1+0NIO/5QdLPOYEpJDhJMgGkpTaM5dnFeynjIH19pOyYcYx2YuRzWFj/0OVTBaJ8juqTuvAccOuPHGfGa5YChMZ3ypXIK6rqQArrMIvLmtliQNV7EB1x8UwUR/EepDMMj88XKjPrN6VQOuZTDatAz6nIBWdiVGzcdphZQvBZAzfGubDdLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiu85Cg1dUpSq3ISZ8eSTdrDvZLpVAtG9jI30+T33NY=;
 b=jUWJS+pvR7YVbyLWX6CLx4P5EIy0cgFnV1vSN2nBWj7GTdFyr/mNmfuxmvaCa2QsEmjVcBkbvkWFHv/sH4jG4EzZ2MTB4Kt8A1cqvsBFYjcNCr2EVAud4wfnSmvGV7LmlNLH57ySqLc1SaQfQR5+3HFl2x3Rcr5h5QUYJOyzAOAWwKkd6D/+iQPVmZDFyFfxcTLi9+9OvtcsN7pCZ02QtXFSMmCtymAyxXLh8eKYp5tbJ2P9xxQGZcSi1ArYSnUvTV/LHFPjgi24z8o/SM5j8UzhfKPvJGbJ3+9eZpmzU+AHDVXQTNmuCDIsaN15u8iSnZiZAWlujIHxhjioXcFoJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiu85Cg1dUpSq3ISZ8eSTdrDvZLpVAtG9jI30+T33NY=;
 b=FBFCz0KlmMW05ayVxT9f26sDlCsRLpJBcZuRQGl04atAF04ZE163jR9Jnt/Ywaga0Thnm5dEgzKfAgX+Eg/Rx3YvNYv9j58817lvPk9VL3WINTGwC7NNMOidvXIzMfWsdnEqHxCbhcAHnP57MveJBtVWa4EQP47i85OTdsLzWaw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH7PR12MB7162.namprd12.prod.outlook.com (2603:10b6:510:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Wed, 4 Oct
 2023 16:59:45 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::2e40:ffd7:e752:644f]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::2e40:ffd7:e752:644f%6]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 16:59:45 +0000
Message-ID: <c0d6ea10-b648-4f44-8ce6-156aefe556f9@amd.com>
Date: Wed, 4 Oct 2023 12:59:43 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/amdkfd: get doorbell's absolute offset based
 on the db size
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, shashank.sharma@amd.com, Mukul.Joshi@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch
References: <20231004161652.3082-1-Arvind.Yadav@amd.com>
 <20231004161652.3082-3-Arvind.Yadav@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20231004161652.3082-3-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::26) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH7PR12MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: bcd20be0-652c-42c9-dd1d-08dbc4fb4faf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yHRdyYULdlFtBc4PT4Vdy2pYSlPcOTwqe7rSvv/VjJTguaI3vdXsQ/afpQucPg/jHPTna/3j/OyhvV7mUlcU7nEPykuNgiNN+qTwVWL0YpB6+uUGMFfcMk0A9xDI3+t9pZsWqnP6zSCdOFVYCkhsv6wyrLWAymIOCO6GcUEUwGjEY4Vz5GZyzFd2BRQdMyKvsR8VE0FbKPZDkUcC7arv+lPq5q3eZOoCclFraQ/+O7ODdTaypfLK3AUf2OoYfJjtOaM5I6anWIg3c+XMdGSBartj6hDLLqRZrHZePrtYfwVgjiJeBg8jxdfSvQSz3ZdzXPIrYMDpgInIkHN+1UIvrdS5CDd/8mVq2INVPmVh53mihb6hgTlBmvnzHMdjK/3BMX/FwhlBT84wecN4coAXQMx5HRU+5kLQC17/8MYqDEd4xeyfXv1YdnRreK2gT9NScjIpUd5jMcYPZWdlnz0os2qwnB9cowTY8m84cHZHbiZ8P/45mOpaZNde2Tx5L8KHfp3svczr2QdLIJWJbBs8bsHaLJvbS8i7lnKgbMmHBx1rvolkalUiUM+1DzDSx7XPpdEZtASvxjn9Oo5NXnOWsHIo14fYxYOuLfbBdGYlagpq+03rgYEXAm3aPzeriiWNXE8dXMwMhcDNfyZcalONLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(136003)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(31686004)(6512007)(53546011)(6506007)(36916002)(478600001)(6486002)(38100700002)(86362001)(31696002)(2906002)(316002)(83380400001)(26005)(2616005)(36756003)(66556008)(66476007)(66946007)(44832011)(5660300002)(4326008)(8936002)(8676002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ems3cVVwQTBQcjVGemJhVm1ZQnRURERaTklYR3NoVnd5bDJJdURkd3dqTEVs?=
 =?utf-8?B?aEtwUWFGMzcyMkdzVUl0dXVBOVY3Z1FDc1d1WXIyYk9pRGQ0V09UbzU0Q0Fm?=
 =?utf-8?B?bWQ0UFlzNkF6QzRiZTNleFl4amcvd0lWZFh5RTFLVCtaZ2pHM3VyT3ltNGFw?=
 =?utf-8?B?SjY0anZqMlhKbzdGcnpnUGNHOHQrc1hCOVhHTFBOWGFEWFkyK1ZaVktNU0g0?=
 =?utf-8?B?MWxFL3pXSkJZbWFQODlqeHZmZFJ0VTlKemdvUlZnY1czVmRaVzlJNlR1R1JH?=
 =?utf-8?B?aWNoQThDVGEzSzhEREtGa2FiaitCcWRhaVRkZEdGS2VYZ1BxSGs3c1luWm93?=
 =?utf-8?B?UTdxdG5FK3Q1clBpWjNhdWNJWmMrZXNEMEtEVUdxREdLeFlMTFlvUnRwV1F4?=
 =?utf-8?B?bGJFZ2xUQUNINUJvVXFMMkE4Q3Z4aFNsa3VJRk5UUmlmdzdjSEllb2tjOXVw?=
 =?utf-8?B?blpFR3kwTFJ1NWpYcmZVdWhBdzRLRThweXd2UEZoUWp6dHpscml6dzNiM2hG?=
 =?utf-8?B?WVpzNlhDUUR4ZGpCeXBnWTE2RjZrc1pzT3NMZ1JZa2l1QzlkUVZWQjVJdkdM?=
 =?utf-8?B?QTNFbTBaK2F5a2NHK05vNjNrZ1Y2Vkx6c3UwVzNXRnVLVFBNOEFBV3VZZ2Ju?=
 =?utf-8?B?MHFJeHJyY2kwaDdVaWIzbFhVZGxNbjIrT1I5R01YSHFXRjg4V1VzLzRPTTNi?=
 =?utf-8?B?eTVRMUtJcTMzamVGVExSck9kOWsyM04xejhTOGFNNDRDUUxNcVVHS1BsejZl?=
 =?utf-8?B?cXVBbEJVWVRVRytpUG9MeURQdTRIRkVTVmEycUM0MGJmSmtpQ3NENmtqakZl?=
 =?utf-8?B?bnliV3dyUFVPMXpJTzlqTll4MHBPRU5sWUQwcUtQckRTYVh0Q3dCRDBWNEJv?=
 =?utf-8?B?Si9CekFVa252NlcwRjFyYlhaMWltQlMyVzRvS29WaDE4dXBNM0g5V01BRlcw?=
 =?utf-8?B?cjBlcmJKbFV0eW5qK3NNNFZNQWw4YzBMeEk5U2NiaG1QTHJVWEZYL3RLY1J4?=
 =?utf-8?B?SDNIWXRLaGdaQTllbVVaOEhiTTBjcXErODZqeUpCSk1aQ2ZQb0dLRjZmUGJ0?=
 =?utf-8?B?WG9XMzREbzRoUmMxSlhVUzBGY0srMmQ4MEVNaFpiZE1zbUQ2WEtjTVZyTFRw?=
 =?utf-8?B?VTBGbXlTb3NtKzBBSmVTLzhCYVB6NTFQYjF2M0d1UzUzUWVuVHJwS0h5dHFH?=
 =?utf-8?B?S0NqSlhzd0ROVkpnKzhraG5BNk53Ti9LNDA0VGlaK1BCa3FpVjh4bWtkdExn?=
 =?utf-8?B?b240QjZtNzk3T0tOUmhKMVpaNkZmZlRVcG96cU5MRm1ZK3lSWlpnVTZvdzJO?=
 =?utf-8?B?ZE03N3F4S2M4ckQ5Q2ZEUTkybVNzUWpnMS9hV1p6ZlNiVHNTeU1YUlJiZWs4?=
 =?utf-8?B?aUROcmtIYXVIVzlHOFVFOElwZDRQdHBqd2RQY3RVT3R3aWx2dnJQL3BwOHZ0?=
 =?utf-8?B?T1VOZlFZWHloL3czUjVtMUh2V1hxQnovcTdCOTdPVVBiTis5S2lIa1NMckF0?=
 =?utf-8?B?aXlKQnI0SWczUGpiaGpDbWtseGo2K2RabWJUVWZKT2VwTTUyK1JocC9DZ2cw?=
 =?utf-8?B?b3lra2dWVkhkZ2FxUUM0SFlBK284YVY5U01SNmJhUkxzczhFeHk0Y0kydnVL?=
 =?utf-8?B?RTVTTTRtWkNNbG02akZtSXA1cExRMCsrL1krUmgrRGFKOC9rY0dBcmp2S0d2?=
 =?utf-8?B?MWdqRlZpeVBWZzJUUWUreVZCQnRlekxlNU9EcFR4STcxTk9taGpzMkp1N2py?=
 =?utf-8?B?c0p0QTZMMnhKOVJYb3RrVXF6QjRWcTQvajE5OEhnQUFiMU1GYlY5dWJ3VVY1?=
 =?utf-8?B?T1FKK0pBdDJqNDVRbm9zWmxiaGxNYWVqdysxTHoybnJXajE2bjdvZVdEQng5?=
 =?utf-8?B?WHBWYktqYmFHa05ybTAyVklBblNDQklFaHNUb1BhQ25uUmlsRVoxR2ZLTjVN?=
 =?utf-8?B?K2xvVVNoZU1DcUNIUTR5b3h6NmNOTWRJdExPWEg0VG5KSkE2czRVWmVmcE9t?=
 =?utf-8?B?S245Q1U1L1BscXBsbG5xckNtTnlUTmZmdFd2anVMVXdEMjN2eTVxMUk1LzBr?=
 =?utf-8?B?Sm9RT25IZmNBc0FmY1JpZTJOZ3IrN1A3S1NMeTJPVDhuRjMwZnpxdDR4eWk3?=
 =?utf-8?Q?lsv5F6mZMJIAZEwoY2nS7QpR9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd20be0-652c-42c9-dd1d-08dbc4fb4faf
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 16:59:45.7620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8BtvchYB00oFbq0/KGts+8tejq/QpvPvGlOVLnknwWnbvt0D8lRDZ6iDvlC1Oub89YQBtQ0NWPHk4SMbGFvdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7162
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


On 2023-10-04 12:16, Arvind Yadav wrote:
> This patch is to align the absolute doorbell offset
> based on the doorbell's size. So that doorbell offset
> will be aligned for both 32 bit and 64 bit.
>
> v2:
> - Addressed the review comment from Felix.
> v3:
> - Adding doorbell_size as parameter to get db absolute offset.
>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>

The final result looks good to me. But please squash the two patches 
into one. The first patch on its own breaks the build, and that's 
something we don't want to commit to the branch history as it makes 
tracking regressions (e.g. with git bisect) very hard or impossible.

More nit-picks inline.


> ---
>   .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c   |  6 +++++-
>   drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c           | 13 +++++++++++--
>   .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c  |  4 +++-
>   3 files changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 0d3d538b64eb..690ff131fe4b 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -346,6 +346,7 @@ static int allocate_doorbell(struct qcm_process_device *qpd,
>   			     uint32_t const *restore_id)
>   {
>   	struct kfd_node *dev = qpd->dqm->dev;
> +	uint32_t doorbell_size;
>   
>   	if (!KFD_IS_SOC15(dev)) {
>   		/* On pre-SOC15 chips we need to use the queue ID to
> @@ -405,9 +406,12 @@ static int allocate_doorbell(struct qcm_process_device *qpd,
>   		}
>   	}
>   
> +	doorbell_size = dev->kfd->device_info.doorbell_size;
> +
>   	q->properties.doorbell_off = amdgpu_doorbell_index_on_bar(dev->adev,
>   								  qpd->proc_doorbells,
> -								  q->doorbell_id);
> +								  q->doorbell_id,
> +								  doorbell_size);

You don't need a local variable for doorbell size that's only used once. 
Just pass dev->kfd->device_info.doorbell_size directly.


>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c b/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
> index 7b38537c7c99..59dd76c4b138 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
> @@ -161,7 +161,10 @@ void __iomem *kfd_get_kernel_doorbell(struct kfd_dev *kfd,
>   	if (inx >= KFD_MAX_NUM_OF_QUEUES_PER_PROCESS)
>   		return NULL;
>   
> -	*doorbell_off = amdgpu_doorbell_index_on_bar(kfd->adev, kfd->doorbells, inx);
> +	*doorbell_off = amdgpu_doorbell_index_on_bar(kfd->adev,
> +						     kfd->doorbells,
> +						     inx,
> +						     kfd->device_info.doorbell_size);
>   	inx *= 2;
>   
>   	pr_debug("Get kernel queue doorbell\n"
> @@ -233,6 +236,7 @@ phys_addr_t kfd_get_process_doorbells(struct kfd_process_device *pdd)
>   {
>   	struct amdgpu_device *adev = pdd->dev->adev;
>   	uint32_t first_db_index;
> +	uint32_t doorbell_size;
>   
>   	if (!pdd->qpd.proc_doorbells) {
>   		if (kfd_alloc_process_doorbells(pdd->dev->kfd, pdd))
> @@ -240,7 +244,12 @@ phys_addr_t kfd_get_process_doorbells(struct kfd_process_device *pdd)
>   			return 0;
>   	}
>   
> -	first_db_index = amdgpu_doorbell_index_on_bar(adev, pdd->qpd.proc_doorbells, 0);
> +	doorbell_size = pdd->dev->kfd->device_info.doorbell_size;
> +
> +	first_db_index = amdgpu_doorbell_index_on_bar(adev,
> +						      pdd->qpd.proc_doorbells,
> +						      0,
> +						      doorbell_size);

Same as above, no local variable needed.


>   	return adev->doorbell.base + first_db_index * sizeof(uint32_t);
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> index adb5e4bdc0b2..010cd8e8e6a1 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> @@ -375,9 +375,11 @@ int pqm_create_queue(struct process_queue_manager *pqm,
>   		 * relative doorbell index = Absolute doorbell index -
>   		 * absolute index of first doorbell in the page.
>   		 */
> +		uint32_t doorbell_size = pdd->dev->kfd->device_info.doorbell_size;
>   		uint32_t first_db_index = amdgpu_doorbell_index_on_bar(pdd->dev->adev,
>   								       pdd->qpd.proc_doorbells,
> -								       0);
> +								       0,
> +								       doorbell_size);

No local variable needed.

Regards,
   Felix


>   
>   		*p_doorbell_offset_in_process = (q->properties.doorbell_off
>   						- first_db_index) * sizeof(uint32_t);
