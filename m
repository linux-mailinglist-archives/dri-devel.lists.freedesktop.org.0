Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 187447BAAA8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 21:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2970610E491;
	Thu,  5 Oct 2023 19:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7D710E490;
 Thu,  5 Oct 2023 19:48:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qpf1+WmV+JGF4Y+0ho5iyK/Z6DvzFlJqZ0TtxPTJ/LQpWg6okA4r0lY4v7j7uzqfWnDnAe6XdvtjZJS+UFtAKeoYUZ8FzB8E+XQqDNTBWL8n7yqHnz4laETy/TQIEkmkg7zbjmIboK4rp6sNsQNmcnZNgL9KVX9guYHeRTeNLSw0b7trpWGJFv2cHdyl63dfUpxyZGG2Wsk8qwuxM5Q3bMYWTitirNChgRjAtgojMS79xmDekgtQnioUhN9iHmUI6Uc9V9mVQHv6vxQ7kjVql2c99q94t/KeFvPn2yYeq8Kq0bQxy0YyaeB95b6obop0EpSD8ANetbkj7aWK+W2kOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kDqyYkG0M5sYUrJ+pD4Sm0sR8pMhzC0qzxsYAfpiyY=;
 b=b7aLibb2tuhB42rkOiE69PEsUdsJHcsamBl14AcFLD2Gz8sJLeKRiTErWMAMwMd1l4P++mXKB6kacLLD48Wq3qDGC4SuiN+J1PWczorC6LwJSoYuGK426lJRY9MQjAbftFuuAXV0NrsVFv6H50vVhUWCfvZCf2gBbldvY17S8qn9JnxnOVWO/1VC+TYshrm1dD0WOipQNzIENS9Kn3Oy5wT8Uc0Lfq1zMbBiilAZ4NMx+E6MXJBmDFfWsj02a2tmhFIOA2407o/y0hwVBSFFDh2Px69h6F2Vnq1q+rnWlrh43V4KAzVwwZFI7oBNNVQikNJtzJiXBNgOBKJHon/b8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kDqyYkG0M5sYUrJ+pD4Sm0sR8pMhzC0qzxsYAfpiyY=;
 b=NZYf2cm5hdc1/2E9Z5fiUMnb7/7PC+iVSdyvh9F+V49Nqa2pjt9aRqKDwtRvD72DHoob069znqXElR0WqrsXajho2dEDdOshD6WBtbiw0343xlpV47n/9N8iDeF/2B7GZ761NfDEeGLngPKyycrL/k65fg16B/rMJL8F+2epQ2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BL0PR12MB4867.namprd12.prod.outlook.com (2603:10b6:208:17e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Thu, 5 Oct
 2023 19:48:07 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::2e40:ffd7:e752:644f]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::2e40:ffd7:e752:644f%6]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 19:48:07 +0000
Message-ID: <a6edf388-3000-404a-a4a1-acab7a9df1d9@amd.com>
Date: Thu, 5 Oct 2023 15:48:04 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] drm/amdkfd: get doorbell's absolute offset based
 on the db_size
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, shashank.sharma@amd.com, Mukul.Joshi@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch
References: <20231005172011.9271-1-Arvind.Yadav@amd.com>
 <20231005172011.9271-2-Arvind.Yadav@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20231005172011.9271-2-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0147.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::20) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BL0PR12MB4867:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dad04c4-a388-4571-4a5f-08dbc5dbff40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4OlICpsw8CmzW0+WpVJKZvAQ7LYoM7DUU0AvzSvhmK+p2gl9OAvZQlQUOrzHns+LQ/jQTSsMDmonzxaJLKJ2Nr9qt8OmwVh62536GzOws/k44igoQ3XsQCOOsP3Mtil+a7T/IXSD401BcYzoqpv1HfFPUVxNsscvdWSAUl2uBb9IT6Z+2omhSL1ep6muJf7E++tGZFF6TGUui2PArZdwQVvR9fOI6BgoAG7/JdtEM0BjqTXiQvQLd5/jGeslgna6kaBU/OeHnWG55PFL0DNBw7wtKJvqk5RX5jx7uSziPJkddOF96nzdKfSBTSHiwkYFOGeutKhQnyqxo17+qQiBddWPFhyxWgfBFVun0vjloZB3C6IkbAmTH5NjXSQpsxuTJgUz5IEW/3NGbo0+WyC7T/KbC3JYBvsX3oT+YtPEj9WviUJmj+2K00pD7ekLrbv6zAn944WIgfqqO37JHrJ1LqB5c/w33MGe2+kCNjCSlSqszdd5Wlq7TqYzJENptZhQW7KqqvWFY1p0AHUyOnO+eUA7SzvUeMbp9M5S5DGUXkVyuBjdksb3L54bzBRzTiPixcxBKyvJ1NMPQkqgoLE0b5hpNxg7k5S4Ax5W+mfX3FcPijp8/wZtQiSfBNrstwpwyiALjWgqvcq4yG2uL0otWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(366004)(136003)(346002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(53546011)(6512007)(86362001)(31686004)(38100700002)(83380400001)(31696002)(26005)(2616005)(6486002)(478600001)(6506007)(6666004)(36916002)(66476007)(66556008)(66946007)(5660300002)(2906002)(44832011)(36756003)(316002)(41300700001)(8936002)(8676002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czBua255VGtQakQ3ZHd4OE5FUkNMamJoMXZyTEFkYWI0cDhSSGNZY3hRano2?=
 =?utf-8?B?RlRKcDUzZWt4dTlJZEVWSStaR2FtamxtUFhteG5OOHd5OU4rWkx0T0FQRDRC?=
 =?utf-8?B?UW5ObVZ6Z1lOWTlhVGRnQ3dEVWNiRjB5dWl1WFBlMUNTdHhVaUl1UjZoM3pL?=
 =?utf-8?B?SDNIQjY4V3Z1OEtYNHhWYzljMUpxNDJFWWloeDBXcTZWVVcxcGE5WVE2djJ2?=
 =?utf-8?B?VGtFa3BXVS8xcXE3U2hVR2JtRXNpcjZDRFJ6dzNUOWt4V2Fvd3IvN21BaFBZ?=
 =?utf-8?B?UnFQak5tNVZ2MWFZdWgwODhFN3pXcWlQUnJuaDM3UWZtM0NPclRIWUFsT0hQ?=
 =?utf-8?B?dzJPUTgya3hJWWhYYTZtSUZtUUwySTlzeGxEQ1hZajdNUXhNVjJQN05vQnpy?=
 =?utf-8?B?UmkxVk1lMTd2WHZmM09Mc2g2QnhlM2RoQy9Kcm9iMXFrakpFRXUrRlN4akdE?=
 =?utf-8?B?NUJxY290NnY3TXVadUFzQ1grVzI2bXBheVpmd0kvbFlQYW5Jc0ZLcEtQd1hL?=
 =?utf-8?B?MFhwR2tYUmhHVmlWQWlFc0FlaTFLejY0SjBuZlgyVm9YcTM0U3ZyTDM1TkFa?=
 =?utf-8?B?UkRFdDNGd2FLb1hXRmRPUUxVM1V6Rys2RVYyMEwySXB5cERybEJKQ2kzQzZI?=
 =?utf-8?B?SGpvMldKeVZqU0Y4WTZXZjFUOFNxRU9kcG5TS2pXS1hoaFNDSjVmOWVyRXY2?=
 =?utf-8?B?Wk83bEpCbnEwTlovU3ovdU8rYkQyY1ZuS1IzazNsa0J4dUJ3WTNycDRFRzBN?=
 =?utf-8?B?U1ZqSWlQeVN5bWxzVFF5RjY2c0h6ZU9CZ2x2c21qYzc2V1JiSVpPclcrblNY?=
 =?utf-8?B?OWducVA4RWJjaFV1LzR4TjQzUDNiNFBtL2xXWEQ1aTBoK3JhZ2k5bmtBVzNM?=
 =?utf-8?B?SmJVZHUxN1ZpY1poRGFMREdvdEhoZ0xIY254cjN3T0YxV3ZPZTZNcUwzc3hW?=
 =?utf-8?B?RDE3b1BBMW9IcUlydE9BMnZ5b2xLWmJONUYvSVluRVlORWp6WmVxRmlURzdM?=
 =?utf-8?B?UWJ1d04yMGY2enZoUnFMRlozUExneU1rVDMwckszQlRQbUhwWXcwc2JEcUFX?=
 =?utf-8?B?cUJidXFRTktCak1qdlNVVW85Q3NVclNUcjNxUUFmT2dYcDZ4blFYdHk4MlhJ?=
 =?utf-8?B?WXZxeWgwSWdXQnhXbG5HRGViMkxKWUdGeExLNmpLNFJjOTV4TjZLYzhvdTQ3?=
 =?utf-8?B?L0s5SHpRTmk1c1QyOXNCL3dYd2JzUHZocVVmUXBLdEhlQnRGK1ZiQVM1RnBP?=
 =?utf-8?B?UmZIZWF3dkdvYTdCNU05dnRCcGZuVWh1STVVVDh5cm45bkRHU0JqQnhJa3Rj?=
 =?utf-8?B?YlZPaEhzbisyZWNQVm1Ba0N0bHpUT2R6K0N3QytHMUdDVGlwRjlBdWlTcXNq?=
 =?utf-8?B?dm5OMW0vWllmR096RFpLTTdYNDB1NnI2bU1xUW9OVkQwc1dQYnRxbnNXWDA5?=
 =?utf-8?B?R1lIOFR0QXkvQlE1eXhGSkI1d1gvM2tub05tVHdvc3ozeVVmL09mcitzaXo4?=
 =?utf-8?B?WmVGSEEwR3E4NG9QK2QrUVBHNkVDay9lTTlJR1krRVljayt0c09lc2tlakNG?=
 =?utf-8?B?MjNoRi85Ylc2dDhMRmVadCs4SjVDK1pabjJWZGdhUFo2THhUMFdEaXI3d2l6?=
 =?utf-8?B?Y05pOTZFZ3J0OFZJRTlFY0xkQVIrb1B3a2dZQUZET0RVaTEwQlA0ZmNqbTQw?=
 =?utf-8?B?ZWMvU2VkQWx6VEw0RkRuditwRmdRR0x1SGhVckgxd1RVOElKOXlBU3Zpblda?=
 =?utf-8?B?M2FNLzYzSzhtM2VxaGswb0lWdU1LR2J0N1lSS3d3SnpIenNhV0lLaTlqcVNT?=
 =?utf-8?B?bVEzZGdZOWFVdEtvT2paU2MxN2N5L1dhYWtlUE1nbXlqL0dMV1I5b3lMWFNQ?=
 =?utf-8?B?dG5sYktYYjVUWUtNcHh1aVFlaHRHWW1mSTRWNjRPWVR6VmZiMmU2UFMydGdS?=
 =?utf-8?B?UnMvSGNMajJUNGtCL2ZLZ2lPMzF5K0NWNCtKeUxUbndGZTBuQk12SGlwUS8r?=
 =?utf-8?B?RnBzOC8zM3ZGTERQSVM2czJia2lZeXMwUUJNVnZVb3pJVTl3T3JJc1daOFhE?=
 =?utf-8?B?Y2ZrQUJTT1RWY0tGaWx6aGVpb09DTStYSFdaT2Q4Qit4UXkxS1hKZWxhMjVs?=
 =?utf-8?Q?mE6WdrXqJ+3NI5jb8zDmrsfbX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dad04c4-a388-4571-4a5f-08dbc5dbff40
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 19:48:07.6329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tAV2J3U9wmHmoV043Lehi/2mA9Q4E9RrCW4Jwv/nInMffZa7kSMN4QV48tbdt32nADDx7KYcVUSds+E5OdazQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4867
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

On 2023-10-05 13:20, Arvind Yadav wrote:
> Here, Adding db_size in byte to find the doorbell's
> absolute offset for both 32-bit and 64-bit doorbell sizes.
> So that doorbell offset will be aligned based on the doorbell
> size.
>
> v2:
> - Addressed the review comment from Felix.
> v3:
> - Adding doorbell_size as parameter to get db absolute offset.
> v4:
>    Squash the two patches into one.
>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h        |  5 +++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c    | 13 +++++++++----
>   .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c   |  3 ++-
>   drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c           | 10 ++++++++--
>   .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c  |  3 ++-
>   5 files changed, 24 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h
> index 09f6727e7c73..4a8b33f55f6b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h
> @@ -357,8 +357,9 @@ int amdgpu_doorbell_init(struct amdgpu_device *adev);
>   void amdgpu_doorbell_fini(struct amdgpu_device *adev);
>   int amdgpu_doorbell_create_kernel_doorbells(struct amdgpu_device *adev);
>   uint32_t amdgpu_doorbell_index_on_bar(struct amdgpu_device *adev,
> -				       struct amdgpu_bo *db_bo,
> -				       uint32_t doorbell_index);
> +				      struct amdgpu_bo *db_bo,
> +				      uint32_t doorbell_index,
> +				      uint32_t db_size);
>   
>   #define RDOORBELL32(index) amdgpu_mm_rdoorbell(adev, (index))
>   #define WDOORBELL32(index, v) amdgpu_mm_wdoorbell(adev, (index), (v))
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
> index da4be0bbb446..6690f5a72f4d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
> @@ -114,19 +114,24 @@ void amdgpu_mm_wdoorbell64(struct amdgpu_device *adev, u32 index, u64 v)
>    * @adev: amdgpu_device pointer
>    * @db_bo: doorbell object's bo
>    * @db_index: doorbell relative index in this doorbell object
> + * @db_size: doorbell size is in byte
>    *
>    * returns doorbell's absolute index in BAR
>    */
>   uint32_t amdgpu_doorbell_index_on_bar(struct amdgpu_device *adev,
> -				       struct amdgpu_bo *db_bo,
> -				       uint32_t doorbell_index)
> +				      struct amdgpu_bo *db_bo,
> +				      uint32_t doorbell_index,
> +				      uint32_t db_size)
>   {
>   	int db_bo_offset;
>   
>   	db_bo_offset = amdgpu_bo_gpu_offset_no_check(db_bo);
>   
> -	/* doorbell index is 32 bit but doorbell's size is 64-bit, so *2 */
> -	return db_bo_offset / sizeof(u32) + doorbell_index * 2;
> +	/* doorbell index is 32 bit but doorbell's size can be 32 bit
> +	 * or 64 bit, so *db_size(in byte)/4 for alignment.
> +	 */
> +	return db_bo_offset / sizeof(u32) + doorbell_index *
> +	       DIV_ROUND_UP(db_size, 4);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 0d3d538b64eb..e07652e72496 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -407,7 +407,8 @@ static int allocate_doorbell(struct qcm_process_device *qpd,
>   
>   	q->properties.doorbell_off = amdgpu_doorbell_index_on_bar(dev->adev,
>   								  qpd->proc_doorbells,
> -								  q->doorbell_id);
> +								  q->doorbell_id,
> +								  dev->kfd->device_info.doorbell_size);
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c b/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
> index 7b38537c7c99..05c74887fd6f 100644
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
> @@ -240,7 +243,10 @@ phys_addr_t kfd_get_process_doorbells(struct kfd_process_device *pdd)
>   			return 0;
>   	}
>   
> -	first_db_index = amdgpu_doorbell_index_on_bar(adev, pdd->qpd.proc_doorbells, 0);
> +	first_db_index = amdgpu_doorbell_index_on_bar(adev,
> +						      pdd->qpd.proc_doorbells,
> +						      0,
> +						      pdd->dev->kfd->device_info.doorbell_size);
>   	return adev->doorbell.base + first_db_index * sizeof(uint32_t);
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> index adb5e4bdc0b2..77649392e233 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
> @@ -377,7 +377,8 @@ int pqm_create_queue(struct process_queue_manager *pqm,
>   		 */
>   		uint32_t first_db_index = amdgpu_doorbell_index_on_bar(pdd->dev->adev,
>   								       pdd->qpd.proc_doorbells,
> -								       0);
> +								       0,
> +								       pdd->dev->kfd->device_info.doorbell_size);
>   
>   		*p_doorbell_offset_in_process = (q->properties.doorbell_off
>   						- first_db_index) * sizeof(uint32_t);
