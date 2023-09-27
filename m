Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8577B0708
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 16:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F2010E547;
	Wed, 27 Sep 2023 14:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC1210E194;
 Wed, 27 Sep 2023 14:36:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ib+A2DWaNOybUd7NBS6V1GIFNPm2HXVo6osufBYSE6keLqcCAT2AE8DejGRLEA1z1D9hK8ovbq85j7wUb9WNrp46VzRj+yXP+ed/PloXYLjc6eQQvvEWPScYWZU9Y5sMqVArdnWCmJQa9M6Q9aYMjg2aYXurFZZkyYLnyElpu92La5beQ/AcksYi4FQ0/1k4d4Z4D9TXHv3sbi1277oRYVP6OdJEeN74QwW7I8c0NG8x2Sa5xOu+eDe5nA2mp83ONWoElS7/wy+XT9CIGaziI3atJ76ZtXoP4n6SMIzlPM4xu6/u/zs8lUZ2y6aIXbgxdam6CxZs0gt3FqSRQiGsow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gilU6+4mRDAdd8qi8+6Q/0RX83uXnfZnkOy3qE4dAyk=;
 b=iFwGnuibtwq/S8A/h5ZRW9FNCYesc0itBTGGoI9Ep8jqeau/DaupqvSnTAOmYxRk2GgVZCvzQ81qJvHXC9JYQld0n/PMrrLi5fXNvTeA5PB+2qEVZe778RXiFix/suGpr4RXyhMYKZAOCUW3ev+TxrdibrHssY/3A1cZBNd4LqaFMC/QykDzVpXcPiuB+F9X2cZjQeSORD3f4Sn0tIUQyn5YZoUtY06UIjX1GpU1d8S9kkRFpV+clg8K48IP6oEzbq5a6l9Agw1GaQ5/tD+Zj6bC/B6v+HkLnQixpMaeqmwb2OMrTs4Jkt4WWo+rXs0sHmPB1zOYzm0MDhRQ6l3NUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gilU6+4mRDAdd8qi8+6Q/0RX83uXnfZnkOy3qE4dAyk=;
 b=MtbLAallu1wjzDopk25RmzYovE2RO5BE7a2jeMMSvVbLFNi6Q9mGtaCGL1SsWxMhQRhvGyKvC71b7oGu89kgkrzv2i59u16+oJ1VZYgHbi2+aYC7q2yj1dptZ5P+9RasdcGgFoVjfsflk+hX/2YYJU2WI80HuqIY1GYQxalgZ84=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH0PR12MB8824.namprd12.prod.outlook.com (2603:10b6:510:26f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 14:36:52 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Wed, 27 Sep 2023
 14:36:52 +0000
Message-ID: <8bfb2f07-fafa-4753-b37b-fb3f4c25cad8@amd.com>
Date: Wed, 27 Sep 2023 10:36:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.0
Subject: Re: [PATCH v4 04/10] drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY
 scheduling policy
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-5-matthew.brost@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <20230919050155.2647172-5-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: QB1P288CA0032.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::45) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH0PR12MB8824:EE_
X-MS-Office365-Filtering-Correlation-Id: 78078517-215f-4ed1-2b5f-08dbbf6730bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k+8TXUPtfThytTDlXxIHCsTuijJ1581k5idHOsREk9HuqJddkiJ7PSZIzv3jq8coBIWEGFY64bj2vOjzmzc5BbOpD5DMVoiAhkBvDUnkM4L2edJ2VTR9ukZNz2HKCs7y+Wd13rUxgJoVbCIiW16v+9lx62EsN4vzmGUTYMeonuqlyLSXHOTRwSU4hkF8XB7ZAC5yLWM45eSZ/Rrrpm9n1/AylmZFZXMmNECh/uw1FZzcI8OraLnrbef714PrL34koxLYHIZRBzgW1l4c/Tt7R9jYOMtdm9lvCQFd+6DW71Jr+Ilrw8x9t4cKgpwQjFFAKHPX56/Xm/R3kyVlrqlY+CaLdmAy4WlVl5ypJGl/M75PAYctQbZ1mncKpC3eRaYb0AeFCGKsbjHs0KW6rLzjdf3faPbrYP639YSHBL+uHjpKtHh7lQgr0bWDfF/IEtxTwz4t2vGaahvzi+Rd58Us8weNebmF9RAt0GpC+JTCgjTvc402jOFcOtSbJ2cVqoU3iXxLa+wxUSgQxJlkJPIJOv1zPSeljeALcQRfzMFKUqswb7Fly/GV6ThDURPDfjmspF1JR0s6g2MuBHcImoNzw4pYomebZ2H4wGPOSFObepuvh18cZQzA2h3ySDu9IuCiBQMLpPAW+ZY0YEL2+JzYl7OCXW1xCmD8iMKoqMeyO7L45JxGkNP35bEOCU5n1YTQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(346002)(366004)(396003)(230922051799003)(451199024)(186009)(1800799009)(31686004)(53546011)(6486002)(6506007)(478600001)(6666004)(31696002)(38100700002)(86362001)(2906002)(30864003)(7416002)(41300700001)(2616005)(83380400001)(6512007)(26005)(44832011)(36756003)(5660300002)(66476007)(66556008)(8936002)(66946007)(316002)(8676002)(4326008)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWQwbmZ2T1VQSzltUjhCUkVQcWpLY0hhOG5VbW1yRTZDbWJueHZEUkVkZ0Nt?=
 =?utf-8?B?bitzT2lmMkZEd01TNVI2MHgyWkEwdzNtLy9xY0dZRnFpSG5zRStMMTJJOW11?=
 =?utf-8?B?VGttSTE3eHBJQ2ptNS9Wc2RBdTBmdHR4QTNHNWgwN0JwU09BbjU3UzBWSHNz?=
 =?utf-8?B?TnJyUWI5aWpFcWVZOFRNbldRU2N0T3BXZFlGSHJCcTJrek1PSkgweGxVQzZs?=
 =?utf-8?B?N3djRklVU0U0Z0F5WGJCMGxGdlZrRmoxd3ZtdG5QZ2FUY2hqMG9mL0ppN0ZH?=
 =?utf-8?B?L0JXc3VmK2tnUTdEUjdOZDQwUWRva2ZNd3MrSFFCM0RZZ3BlZm9DUUVQQUFs?=
 =?utf-8?B?U2ZZcUttWGdxSlFzVG5JVHorWldLREt2eEVJUkZDRzVqZkpYVHd4NE4rWVhM?=
 =?utf-8?B?QmExRFN3WmZraXZwMkpjeDJzSDdEcU9JdkRXRXUzaUdBZXgwcXBaV3ArUjkz?=
 =?utf-8?B?aVFEMWNRdkE2R0ROMjNaZXk1b1RoWVM0QUJjWUN6QkwvaS9KeTRTb0xIR2M1?=
 =?utf-8?B?b2tPV3hRaHdMRGpSRkJJS1lITW5GSUd5cllKNEJnbDM3c25NRjRTOEJja01P?=
 =?utf-8?B?Rno0NlIrK0U3UFhTdS92dmRXbVNFaTEyZXV2TVg2WXVNWTNXSGJ4QjhibGF4?=
 =?utf-8?B?SmlrQWVrbmgwbWpmWGc3Rkc0ZlhScUp2NncwZzhZcmE1T0o4RzZ5UWplMTFk?=
 =?utf-8?B?TXdnQ09wZW9hdGpwVndkd3FaNUFTYXd2Mk5jcExJdlBMZ2s3QUpueW45SG0r?=
 =?utf-8?B?QUFWYmdBQlZUMUhLRXVqOHNPVFk4MmtxVkxxelhseXUvMFFzTDBDQUhncHJS?=
 =?utf-8?B?a1Y2UUo4Uk1Mekp0R2o4WFpYOWxaSng4MDl2c1VuYnF0ZkQwZ1h1bHA2eVJW?=
 =?utf-8?B?bkVFVkZoa3VqZmFrMHZramIyRXBMdGRFTzhCeFFGTkJLUVJPR25rcDJxN3lk?=
 =?utf-8?B?VER3SHFyMEV6c29GcFJWd3NNaUUwSU1yQW0xWUEvaXFBaEEraDgvWGs3STE3?=
 =?utf-8?B?L2IvRitxc0JWMmw0U1ZjWEUreHF0K2thcHk4ZG1SQjhIRXY3OTg0aDZsRlBI?=
 =?utf-8?B?UVpPazNuWVNDcjZRVnpsTXNzejRrOW5ESnB5RjY0ODF6TW51TDI3VGtnRGJT?=
 =?utf-8?B?dHhhVndQMmpCckdTZlZLS0JUcGtwSG5FeEduT0hsMkNtZFZDOWU4TVJZZ212?=
 =?utf-8?B?NlZkNzVKQ3ArVGRVci9RdGQ1WTJjSE13eCs3T1NkSEE0cDJaYWplVWY4VnJU?=
 =?utf-8?B?NEJvU3gzSUdHWTBLQ1BPV2Y4WHMvQUkwUy9WR0tUazUxOVQ2RmY0SlExNGdK?=
 =?utf-8?B?SDlsaTZJcDk2UUxtYlhMam9pa1llVTBWc0V6N0ZDb0hUTHY5YmUxWXdBdE9V?=
 =?utf-8?B?VEg3dktDU0UwUjVMdFd6RmZDM2tkUjlPdWhNblFrbU9FZk9vM0hQYnRYSFp3?=
 =?utf-8?B?em01MCt6OTYxc0JLejVrelFEOUlRYTNGYU1SNkc3aHoyckd4REwxSk5ycU5y?=
 =?utf-8?B?SVZRb1Mvc2xIaWYzaHJtNklTSzlnMEJ3UDRucEtYY2trZU4vMmJyZ0JZczVC?=
 =?utf-8?B?SzAxaFlNcFd3dC9zdFVQTEZsSHZoV2g3bEVrU2o2QVRLRGpkUmJxNUsrNGE3?=
 =?utf-8?B?MFJyM0Q3UkFYV3grbmdVRTB0cnI1NVNYTVRqRkM5b1pRK0FXTmpNb1ZQWXUx?=
 =?utf-8?B?aHo0dUNnK3E3OFRjOWJZZkhxU3VBc1dVL0VHWm56UjV3ODdKT2NtemNuTytJ?=
 =?utf-8?B?Ni9uMGYzWXhlcm0zYlcyNUgyU2NHTWNsblBsK3UzTVBSRGNCZ2RSYTVHM2Jz?=
 =?utf-8?B?OU54ZkxyS3JTS043V2FtdDYrOUY3WnlPUUI1NDYyUWVwb1JUdTY4R2JEekJ2?=
 =?utf-8?B?UzgyZFBmemFvK3BXa29zT0lLVk96bkh0Vk80MzRxZ0FGSGZqMWhCMUs2Ym0r?=
 =?utf-8?B?YVJJR3YwdGQyTmdwdTl5ZTkrRng4Rld1Z0x6SkR0cXJnSXcwL0dRRmdjN0JT?=
 =?utf-8?B?TGpwVnB2b3phaC9XaHlNUkN1R1IxNHZhek03SXh0UVFITkJZc3pXRGd0NllN?=
 =?utf-8?B?bmZDSHhITDVhWSt4RUxaMlF4cFp6UWpxaDFPYlNZU3M2T2pxdTR4dWFnL1ht?=
 =?utf-8?Q?e1SC7NJEcy/3JqYFBiFCNxHC7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78078517-215f-4ed1-2b5f-08dbbf6730bf
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 14:36:52.6879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a4Vfcj1q63d88+V0Cn/Yhz7klVAfmUjKJ13JFiNIAJl8U0B3uDEHj6Fx29P/AC/E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8824
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, lina@asahilina.net, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023-09-19 01:01, Matthew Brost wrote:
> DRM_SCHED_POLICY_SINGLE_ENTITY creates a 1 to 1 relationship between
> scheduler and entity. No priorities or run queue used in this mode.
> Intended for devices with firmware schedulers.
> 
> v2:
>   - Drop sched / rq union (Luben)
> v3:
>   - Don't pick entity if stopped in drm_sched_select_entity (Danilo)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 69 ++++++++++++++++++------
>  drivers/gpu/drm/scheduler/sched_fence.c  |  2 +-
>  drivers/gpu/drm/scheduler/sched_main.c   | 64 +++++++++++++++++++---
>  include/drm/gpu_scheduler.h              |  8 +++
>  4 files changed, 120 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index cf42e2265d64..437c50867c99 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -83,6 +83,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  	memset(entity, 0, sizeof(struct drm_sched_entity));
>  	INIT_LIST_HEAD(&entity->list);
>  	entity->rq = NULL;
> +	entity->single_sched = NULL;
>  	entity->guilty = guilty;
>  	entity->num_sched_list = num_sched_list;
>  	entity->priority = priority;
> @@ -90,8 +91,17 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  	RCU_INIT_POINTER(entity->last_scheduled, NULL);
>  	RB_CLEAR_NODE(&entity->rb_tree_node);
>  
> -	if(num_sched_list)
> -		entity->rq = &sched_list[0]->sched_rq[entity->priority];
> +	if (num_sched_list) {
> +		if (sched_list[0]->sched_policy !=
> +		    DRM_SCHED_POLICY_SINGLE_ENTITY) {
> +			entity->rq = &sched_list[0]->sched_rq[entity->priority];
> +		} else {
> +			if (num_sched_list != 1 || sched_list[0]->single_entity)
> +				return -EINVAL;
> +			sched_list[0]->single_entity = entity;
> +			entity->single_sched = sched_list[0];
> +		}
> +	}

So much (checking for) negativity...:-)
Perhaps the simplified form below?

	if (num_sched_list) {
		if (sched_list[0]->sched_policy !=
		    DRM_SCHED_POLICY_SINGLE_ENTITY) {
			entity->rq = &sched_list[0]->sched_rq[entity->priority];
		} else if (num_sched_list == 1 && !sched_list[0]->single_entity) {
			sched_list[0]->single_entity = entity;
			entity->single_sched = sched_list[0];
		} else {
			return -EINVAL;
		}
	}

>  
>  	init_completion(&entity->entity_idle);
>  
> @@ -124,7 +134,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>  				    struct drm_gpu_scheduler **sched_list,
>  				    unsigned int num_sched_list)
>  {
> -	WARN_ON(!num_sched_list || !sched_list);
> +	WARN_ON(!num_sched_list || !sched_list ||
> +		!!entity->single_sched);
>  
>  	entity->sched_list = sched_list;
>  	entity->num_sched_list = num_sched_list;
> @@ -231,13 +242,15 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>  {
>  	struct drm_sched_job *job;
>  	struct dma_fence *prev;
> +	bool single_entity = !!entity->single_sched;
>  
> -	if (!entity->rq)
> +	if (!entity->rq && !single_entity)
>  		return;
>  
>  	spin_lock(&entity->rq_lock);
>  	entity->stopped = true;
> -	drm_sched_rq_remove_entity(entity->rq, entity);
> +	if (!single_entity)
> +		drm_sched_rq_remove_entity(entity->rq, entity);
>  	spin_unlock(&entity->rq_lock);
>  
>  	/* Make sure this entity is not used by the scheduler at the moment */
> @@ -259,6 +272,20 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>  	dma_fence_put(prev);
>  }
>  
> +/**
> + * drm_sched_entity_to_scheduler - Schedule entity to GPU scheduler

Please use verbs. Please?

Fix:
/**
 * drm_sched_entity_to_scheduler - Map a schedule entity to a GPU scheduler

> + * @entity: scheduler entity
> + *
> + * Returns GPU scheduler for the entity

Fix:
* Given an entity, return its GPU scheduler.

> + */
> +struct drm_gpu_scheduler *
> +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity)
> +{
> +	bool single_entity = !!entity->single_sched;
> +
> +	return single_entity ? entity->single_sched : entity->rq->sched;
> +}
> +
>  /**
>   * drm_sched_entity_flush - Flush a context entity
>   *
> @@ -276,11 +303,12 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>  	struct drm_gpu_scheduler *sched;
>  	struct task_struct *last_user;
>  	long ret = timeout;
> +	bool single_entity = !!entity->single_sched;
>  
> -	if (!entity->rq)
> +	if (!entity->rq && !single_entity)
>  		return 0;
>  
> -	sched = entity->rq->sched;
> +	sched = drm_sched_entity_to_scheduler(entity);
>  	/**
>  	 * The client will not queue more IBs during this fini, consume existing
>  	 * queued IBs or discard them on SIGKILL
> @@ -373,7 +401,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>  		container_of(cb, struct drm_sched_entity, cb);
>  
>  	drm_sched_entity_clear_dep(f, cb);
> -	drm_sched_wakeup_if_can_queue(entity->rq->sched);
> +	drm_sched_wakeup_if_can_queue(drm_sched_entity_to_scheduler(entity));
>  }
>  
>  /**
> @@ -387,6 +415,8 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>  void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>  				   enum drm_sched_priority priority)
>  {
> +	WARN_ON(!!entity->single_sched);
> +
>  	spin_lock(&entity->rq_lock);
>  	entity->priority = priority;
>  	spin_unlock(&entity->rq_lock);
> @@ -399,7 +429,7 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
>   */
>  static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>  {
> -	struct drm_gpu_scheduler *sched = entity->rq->sched;
> +	struct drm_gpu_scheduler *sched = drm_sched_entity_to_scheduler(entity);
>  	struct dma_fence *fence = entity->dependency;
>  	struct drm_sched_fence *s_fence;
>  
> @@ -501,7 +531,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  	 * Update the entity's location in the min heap according to
>  	 * the timestamp of the next job, if any.
>  	 */
> -	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
> +	if (drm_sched_entity_to_scheduler(entity)->sched_policy ==
> +	    DRM_SCHED_POLICY_FIFO) {
>  		struct drm_sched_job *next;
>  
>  		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> @@ -524,6 +555,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>  	struct drm_gpu_scheduler *sched;
>  	struct drm_sched_rq *rq;
>  
> +	WARN_ON(!!entity->single_sched);
> +
>  	/* single possible engine and already selected */
>  	if (!entity->sched_list)
>  		return;
> @@ -573,12 +606,13 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>  void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  {
>  	struct drm_sched_entity *entity = sched_job->entity;
> -	bool first, fifo = entity->rq->sched->sched_policy ==
> -		DRM_SCHED_POLICY_FIFO;
> +	bool single_entity = !!entity->single_sched;
> +	bool first;
>  	ktime_t submit_ts;
>  
>  	trace_drm_sched_job(sched_job, entity);
> -	atomic_inc(entity->rq->sched->score);
> +	if (!single_entity)
> +		atomic_inc(entity->rq->sched->score);
>  	WRITE_ONCE(entity->last_user, current->group_leader);
>  
>  	/*
> @@ -591,6 +625,10 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  
>  	/* first job wakes up scheduler */
>  	if (first) {
> +		struct drm_gpu_scheduler *sched =
> +			drm_sched_entity_to_scheduler(entity);
> +		bool fifo = sched->sched_policy == DRM_SCHED_POLICY_FIFO;
> +
>  		/* Add the entity to the run queue */
>  		spin_lock(&entity->rq_lock);
>  		if (entity->stopped) {
> @@ -600,13 +638,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  			return;
>  		}
>  
> -		drm_sched_rq_add_entity(entity->rq, entity);
> +		if (!single_entity)
> +			drm_sched_rq_add_entity(entity->rq, entity);
>  		spin_unlock(&entity->rq_lock);
>  
>  		if (fifo)
>  			drm_sched_rq_update_fifo(entity, submit_ts);
>  
> -		drm_sched_wakeup_if_can_queue(entity->rq->sched);
> +		drm_sched_wakeup_if_can_queue(sched);
>  	}
>  }
>  EXPORT_SYMBOL(drm_sched_entity_push_job);
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 06cedfe4b486..f6b926f5e188 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -225,7 +225,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>  {
>  	unsigned seq;
>  
> -	fence->sched = entity->rq->sched;
> +	fence->sched = drm_sched_entity_to_scheduler(entity);
>  	seq = atomic_inc_return(&entity->fence_seq);
>  	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>  		       &fence->lock, entity->fence_context, seq);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index f645f32977ed..588c735f7498 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -32,7 +32,8 @@
>   * backend operations to the scheduler like submitting a job to hardware run queue,
>   * returning the dependencies of a job etc.
>   *
> - * The organisation of the scheduler is the following:
> + * The organisation of the scheduler is the following for scheduling policies
> + * DRM_SCHED_POLICY_RR and DRM_SCHED_POLICY_FIFO:

Yes, so this was badly written to begin with. If we're adding more information,
I'd write:

    * For scheduling policies DRM_SCHED_POLICY_RR and DRM_SCHED_POLICY_FIFO,
    * the scheduler organization is,

>   *
>   * 1. Each hw run queue has one scheduler
>   * 2. Each scheduler has multiple run queues with different priorities
> @@ -43,6 +44,23 @@
>   *
>   * The jobs in a entity are always scheduled in the order that they were pushed.
>   *
> + * The organisation of the scheduler is the following for scheduling policy
> + * DRM_SCHED_POLICY_SINGLE_ENTITY:

Remember, it's a list, on large enough scale, thus,

    * For DRM_SCHED_POLICY_SINGLE_ENTITY, the organization of the scheduler is,

> + *
> + * 1. One to one relationship between scheduler and entity
> + * 2. No priorities implemented per scheduler (single job queue)
> + * 3. No run queues in scheduler rather jobs are directly dequeued from entity
> + * 4. The entity maintains a queue of jobs that will be scheduled on the
> + * hardware

Good! But please fix,

      4. The entity maintains a queue of jobs that will be scheduler _to_ the hardware.

> + *
> + * The jobs in a entity are always scheduled in the order that they were pushed
> + * regardless of scheduling policy.

Please add here,
	Single-entity scheduling is essentially a FIFO for jobs.

> + *
> + * A policy of DRM_SCHED_POLICY_RR or DRM_SCHED_POLICY_FIFO is expected to used

"... is expected to _be_ used ..."

> + * when the KMD is scheduling directly on the hardware while a scheduling policy

I'd spell out "kernel-mode driver" since it makes it terse when reading a processed
DOC format, and having a three-letter abbreviation spelled out makes for an easier
reading experience. (There are too many three-letter abbreviations as is...)

"... directly _to_ the hardware ..." since, ultimately, the DRM scheduler just
pushes jobs to be executed to the hardware by the hardware and doesn't support
or control hardware preemption of jobs _on_ the hardware. (See what I did there? :-) )

> + * of DRM_SCHED_POLICY_SINGLE_ENTITY is expected to be used when there is a
> + * firmware scheduler.
> + *

Yeah, so that's a good explanation--thanks for writing this.

>   * Note that once a job was taken from the entities queue and pushed to the

Please only use present tense in software documentation. No past, future, or 
perfect tenses please.

    * Note that once a job _is_ taken from the entities queue and pushed to the

>   * hardware, i.e. the pending queue, the entity must not be referenced anymore
>   * through the jobs entity pointer.

Yeah, another good explanation--thanks for including this.

> @@ -96,6 +114,8 @@ static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
>  
>  void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
>  {
> +	WARN_ON(!!entity->single_sched);
> +
>  	/*
>  	 * Both locks need to be grabbed, one to protect from entity->rq change
>  	 * for entity from within concurrent drm_sched_entity_select_rq and the
> @@ -126,6 +146,8 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
>  static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>  			      struct drm_sched_rq *rq)
>  {
> +	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
> +
>  	spin_lock_init(&rq->lock);
>  	INIT_LIST_HEAD(&rq->entities);
>  	rq->rb_tree_root = RB_ROOT_CACHED;
> @@ -144,6 +166,8 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>  void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>  			     struct drm_sched_entity *entity)
>  {
> +	WARN_ON(!!entity->single_sched);
> +
>  	if (!list_empty(&entity->list))
>  		return;
>  
> @@ -166,6 +190,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>  void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>  				struct drm_sched_entity *entity)
>  {
> +	WARN_ON(!!entity->single_sched);
> +
>  	if (list_empty(&entity->list))
>  		return;
>  
> @@ -641,7 +667,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>  		       struct drm_sched_entity *entity,
>  		       void *owner)
>  {
> -	if (!entity->rq)
> +	if (!entity->rq && !entity->single_sched)
>  		return -ENOENT;
>  
>  	job->entity = entity;
> @@ -674,13 +700,16 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>  {
>  	struct drm_gpu_scheduler *sched;
>  	struct drm_sched_entity *entity = job->entity;
> +	bool single_entity = !!entity->single_sched;
>  
>  	BUG_ON(!entity);
> -	drm_sched_entity_select_rq(entity);
> -	sched = entity->rq->sched;
> +	if (!single_entity)
> +		drm_sched_entity_select_rq(entity);
> +	sched = drm_sched_entity_to_scheduler(entity);

So here, I wonder, and I've a tiny exploratory request:
Could we "fake" an rq for the single-entity and thus remove (become unnecessary)
all those "if (single-entity)" and "if (!single-entity)".

If we keep adding code peppered with if () everywhere, over the years it'll become
hard to read. However, if we use maps to achieve choice and selection, such as entity->rq,
then you'd not need much of the "if (single-entity)" and "if (!single-entity)",
and the code would naturally stay mostly the same and the sched selection would
still be abstracted out via the entity->rq.

What do you think?

>  
>  	job->sched = sched;
> -	job->s_priority = entity->rq - sched->sched_rq;
> +	if (!single_entity)
> +		job->s_priority = entity->rq - sched->sched_rq;
>  	job->id = atomic64_inc_return(&sched->job_id_count);
>  
>  	drm_sched_fence_init(job->s_fence, job->entity);
> @@ -896,6 +925,14 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>  	if (!drm_sched_can_queue(sched))
>  		return NULL;
>  
> +	if (sched->single_entity) {
> +		if (!READ_ONCE(sched->single_entity->stopped) &&
> +		    drm_sched_entity_is_ready(sched->single_entity))
> +			return sched->single_entity;
> +
> +		return NULL;
> +	}
> +
>  	/* Kernel run queue has higher priority than normal run queue*/
>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>  		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
> @@ -1092,6 +1129,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		return -EINVAL;
>  
>  	sched->ops = ops;
> +	sched->single_entity = NULL;
>  	sched->hw_submission_limit = hw_submission;
>  	sched->name = name;
>  	if (!submit_wq) {
> @@ -1111,7 +1149,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	sched->dev = dev;
>  	sched->sched_policy = sched_policy == DRM_SCHED_POLICY_UNSET ?
>  		drm_sched_policy_default : sched_policy;
> -	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> +	for (i = DRM_SCHED_PRIORITY_MIN; sched_policy !=
> +	     DRM_SCHED_POLICY_SINGLE_ENTITY && i < DRM_SCHED_PRIORITY_COUNT;
> +	     i++)

So, "sched_policy != DRM_SCHED_POLICY_SINGLE_ENTITY" doesn't seem to be
a loop-invariant, since it doesn't cause the loop to exit over iterations.
It's just a gate to executing the loop. I am used to seeing only loop
invariants in the for-loop conditional.

I wonder if it is clearer to just say what is meant:

	if (sched_policy != DRM_SCHED_POLICY_SINGLE_ENTITY) {
		for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
			...
	}

On a larger scheme of things, I believe it is a bit presumptuous to say:

struct drm_gpu_scheduler {
	...
	struct drm_sched_rq             sched_rq[DRM_SCHED_PRIORITY_COUNT];
	...
};

I mean, why does a scheduler have to implement all those priorities? Maybe it
wants to implement only one. :-)

Perhaps we can have,

struct drm_gpu_scheduler {
	...
	u32                             num_rqs;
	struct drm_sched_rq             *sched_rq;
	...
};

Which might make it easier to fake out an rq for single-entity and then leave
the code mostly intact, while also implementing single-entity.

It's not a gating issue, but perhaps it would create a cleaner code in the long
run? Maybe we should explore this?

>  		drm_sched_rq_init(sched, &sched->sched_rq[i]);
>  
>  	init_waitqueue_head(&sched->job_scheduled);
> @@ -1143,7 +1183,15 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>  
>  	drm_sched_submit_stop(sched);
>  
> -	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> +	if (sched->single_entity) {
> +		spin_lock(&sched->single_entity->rq_lock);
> +		sched->single_entity->stopped = true;
> +		spin_unlock(&sched->single_entity->rq_lock);
> +	}
> +
> +	for (i = DRM_SCHED_PRIORITY_COUNT - 1; sched->sched_policy !=
> +	     DRM_SCHED_POLICY_SINGLE_ENTITY && i >= DRM_SCHED_PRIORITY_MIN;
> +	     i--) {
>  		struct drm_sched_rq *rq = &sched->sched_rq[i];

Same sentiment here, as above.
-- 
Regards,
Luben

>  
>  		spin_lock(&rq->lock);
> @@ -1186,6 +1234,8 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
>  	struct drm_sched_entity *entity;
>  	struct drm_gpu_scheduler *sched = bad->sched;
>  
> +	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
> +
>  	/* don't change @bad's karma if it's from KERNEL RQ,
>  	 * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
>  	 * corrupt but keep in mind that kernel jobs always considered good.
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 9f830ff84bad..655675f797ea 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -79,6 +79,7 @@ enum drm_sched_policy {
>  	DRM_SCHED_POLICY_UNSET,
>  	DRM_SCHED_POLICY_RR,
>  	DRM_SCHED_POLICY_FIFO,
> +	DRM_SCHED_POLICY_SINGLE_ENTITY,
>  	DRM_SCHED_POLICY_COUNT,
>  };
>  
> @@ -112,6 +113,9 @@ struct drm_sched_entity {
>  	 */
>  	struct drm_sched_rq		*rq;
>  
> +	/** @single_sched: Single scheduler */
> +	struct drm_gpu_scheduler	*single_sched;
> +
>  	/**
>  	 * @sched_list:
>  	 *
> @@ -473,6 +477,7 @@ struct drm_sched_backend_ops {
>   * struct drm_gpu_scheduler - scheduler instance-specific data
>   *
>   * @ops: backend operations provided by the driver.
> + * @single_entity: Single entity for the scheduler
>   * @hw_submission_limit: the max size of the hardware queue.
>   * @timeout: the time after which a job is removed from the scheduler.
>   * @name: name of the ring for which this scheduler is being used.
> @@ -504,6 +509,7 @@ struct drm_sched_backend_ops {
>   */
>  struct drm_gpu_scheduler {
>  	const struct drm_sched_backend_ops	*ops;
> +	struct drm_sched_entity		*single_entity;
>  	uint32_t			hw_submission_limit;
>  	long				timeout;
>  	const char			*name;
> @@ -587,6 +593,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  			  struct drm_gpu_scheduler **sched_list,
>  			  unsigned int num_sched_list,
>  			  atomic_t *guilty);
> +struct drm_gpu_scheduler *
> +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity);
>  long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
>  void drm_sched_entity_fini(struct drm_sched_entity *entity);
>  void drm_sched_entity_destroy(struct drm_sched_entity *entity);

