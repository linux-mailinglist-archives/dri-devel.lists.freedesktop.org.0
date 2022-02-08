Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 931544AD66F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 12:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE7810E1F6;
	Tue,  8 Feb 2022 11:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06E510E1F6;
 Tue,  8 Feb 2022 11:25:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDH7UBaY0WBSuRuFAd7OGk4GsMgbqijGATFAhtyITtzjVCm3VISi+cWmR42cLZwXl7K35qlUwHPGiihc1alijBX8gZwV4w53AG4bsgIThZvM96k8cxXh5SOvUf4VFcC7uPiSsEuzldFDo3Q6wtkfMdw2HB/ZveHus8FhDhBIik3LrS31ndhIeU+yFZ3mJLttiP6oGnZqUlQez7zNWCqcdmYn68/tD4H4kkW2tyfjnVgxdNsVAovIvDcUVVYyisk3TVrbGnW6097/WGS7DpbSSohzzDIBkg0QHktawHBd3JtSNJFVME2WJkx4ge+xXtY8H7/ymKuX8a5IBR7E6tR8lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Unp5uLMaImNyFGRgeG0LnVtf5Sb/otIqfLR83uLvMh8=;
 b=UH0uTcNhG7Q4yY6+uABE4iLqepMMjgQnrk6X6CGH2fawdZB7sIS9fNNMhqUbAYTVm0JVOXsF8HYtHz9t+6xOdctKe1pfwhRAIDpDUhssy+3PYD7wZ05BPf3aRtuA2Slm8/JBLPavMteocQFhBFMqxTeIE/YUAOmLusFy+uVHNQbetv1D5mcvxLGZ5HiqaqjmKlYzELqW3wjW58tagTGxaCsedb8n/5YvEUyDbDgtC6+hDY2cGxQ2MYOr1gF1PPLZqZpWG2d/pQ++tgsX8koco5aW9rf053qx+Ndq9jpwF8Nt677amRhzcD+DB9b1qke/HjCnYqfqLkYmf5j5KHm0jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Unp5uLMaImNyFGRgeG0LnVtf5Sb/otIqfLR83uLvMh8=;
 b=txHrXVk7Jb5huckamR8zrPHlCh6b6x0h1uy6nWJcObq1J6CiiN/q00D6h/7roGsTRl+dGU8OajVZBPFDDeIP5rPY7MpSbzRxX1/Gk39z1uf0vHOqRgjM2KHNytB/K3t0V2ZGTtRuI3+KP34aCSweXpuFLiLJJY0Lj3NtOUDPMfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by CY4PR1201MB0040.namprd12.prod.outlook.com (2603:10b6:910:1b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.16; Tue, 8 Feb
 2022 11:25:46 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::d0d1:eba5:5729:c636]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::d0d1:eba5:5729:c636%5]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 11:25:46 +0000
Message-ID: <8e4dc322-2946-9047-7cd4-8a734dc29bd3@amd.com>
Date: Tue, 8 Feb 2022 16:55:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [RFC v4] drm/amdgpu: Rework reset domain to be refcounted.
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220125223752.200211-9-andrey.grodzovsky@amd.com>
 <20220202172617.16181-1-andrey.grodzovsky@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20220202172617.16181-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR0101CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::30) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16fde6e6-e0db-4f42-ea2f-08d9eaf5bfe8
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0040:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0040F8A4846D100F5C366C2C972D9@CY4PR1201MB0040.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JBnQm6Q4yx0WOdvXbbUexIvpLtilAdFRKaUQqpVKn46Axr9JDDYq0NRrMbt1QU1Bf44yLnKnkC0k2OfJ/YyT+98OolyZ9jGEwfC4rtqVVM3/D+X1VUQx9cElKAMnDdQvnGcVe5Joi1I6JQDMPh4dlF7aQjHLwDHh+jp+KZfogvBfa3azJfJlMPmeMdLfUdeoXb7048UdYm50BhTMULX0ThcB2I3n5HZqIzSYuSlCcXw1Ib+DklWMzcb/UGXXzfLd4XYBHjpGuLtIRFySHYHoRZj2Tnz3jrmhVj6vsIkPOlrirq7aSEnmBK06F36FX/Z5gsWp5dZtRXS73yX5Yh4IQVbB23lBC0d4uuyERMtdI26OKb/bTWwpfJPH9cWcif2fP3kAcUT4m3GurwmlJk16m0WTJOMcFbv7oFuf1/xBAMdG4lwpHD0tG4vJh3lnRaLjXnpJlIPWTFrl61GlPeQcHoXlHiH41kXtVeumoYxQVqpU0KkLvZLC/gFCU+ZbQljxYRx9afFLFMI8nA7h9qkSLLvGPbE5GqqhC/tGCAlEw7OHvBai876n6mX58TjOzH5NQaQ+S/9+doni9esmjGHpKLmYNeXKyXBgicIn3bvd5memqf0o5obkv/yOPSsbrsEbevf110J4epTrODDo+NsueqJWRHtB1TrGxPmUAqD56b1nSq54r3xHZA9H7DT1hUMSjIrx1Bnj15a7ARGrmanmxe2fvEoAkR1S2CJf/On2IZ406UKIur4+BvC1uZQAFMoyo2hVivzmsptUKaX6zrWKBJvUm4n6GJ37bFObpDOBsVS3zDo5n5M8w6vRLQNFxN1BljvZbqWlb0Y4X8GeF6JH2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(36756003)(8676002)(66556008)(66476007)(6666004)(30864003)(86362001)(5660300002)(316002)(66946007)(8936002)(26005)(2616005)(83380400001)(53546011)(31696002)(6506007)(186003)(6486002)(966005)(31686004)(38100700002)(508600001)(2906002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVhPYXZWMWlLa1ErNm1Mc2VtcDZ0MTEyVVBsS2lkeDdVc1BVT2pjRGdxeHRH?=
 =?utf-8?B?VFFpckVCOFNvdm12Vy9oaVlBK3dUdlR5N1Q4R01rVitXZWZzbFlzZlZIcXFI?=
 =?utf-8?B?elZFYnVlRW1KSXFsZ21JSklpTXRZTElRQ0paOEhxK3hpZmhvMXJUUWVWb2ZC?=
 =?utf-8?B?RjdYazNMbTdYL21PcVhjQnd3eUwxbkpFRXlMeDdOMGJQYzNEWW45TmdKQWZB?=
 =?utf-8?B?WlNvUTlZekFkYThRZHBiK29hSTc2bDh4MzRZbk5HbzNKbkNIbHlOa0VEV3VM?=
 =?utf-8?B?N2Z2SUhMNzJkSFpBVTBLUW5uZkVSR3A3cWJnWW9jMHJHQ1lLRU9DVW05VGFv?=
 =?utf-8?B?M3Qyd2tTWXFGMnBGVStxT0ROM1k3OVdudTVTOTM2MHF4WVBpTHRudllXNk5r?=
 =?utf-8?B?MHlNdU9nUkFVZUFUaGN5MHgycU1Pa0QzdTRHSWRqSDhGeUNvRzh2TVhYdkxh?=
 =?utf-8?B?MXc1Y1RDaGFUbTlYN0RiNnVpdlc2T3FpMjd5cklJSTRPTERQcUtYZXpBYk1n?=
 =?utf-8?B?bjk4SVNpV0wyZDFsQ1ZZUXRmZlJ0UWxCUENpZ0tQUzZrQTVwVXRlaFRBSks3?=
 =?utf-8?B?cllac3VPRmJkTmpiZnNSS0JubzZzQU5IcVF6ekNtZHFLb3RxeXlXcENNbDZF?=
 =?utf-8?B?cFBndlE5SDAvSjJZcUZNWkVCQmNoWVZ4RE1HdEh6NGdoZVdHNVQvOGg0YnNj?=
 =?utf-8?B?RkNITXRMZTRPWHNDSTJDR2taMThheFZFUkpVNkxld3cyZURFcjJFMzdoZHNG?=
 =?utf-8?B?TjhtQTJQSkNkQjZvRWRTNWZ0RVZBUGxMVy8zVCt6cm9NYUZmZjFEZXhLRXgr?=
 =?utf-8?B?aWRZa2pSSTRjVnVCc09WakZEZVNWNWV4dW5uU3hiVnhRa1pYdm1ORlViK3RO?=
 =?utf-8?B?OVBJNDJvQUx6YlVNeXZ4RFRLTU1jSlRJY0kzbFF4QWhFNTNQMEZMb0JvUGFk?=
 =?utf-8?B?cS80dy9uZEpjZmJCVTZQZXF5aUdlaGhjQlQ0YXhlaVcvQ09VNUdZZGRqbTlp?=
 =?utf-8?B?RVJGVVp4QndydWh0UFhqbzlhQVZmTms3clgvRW1WR25EWDI5cFpRVDFWWUJO?=
 =?utf-8?B?WHc3LzZKWEh1ZmFiVUUzRS9ZUWxKV2t0NW0vaUtJMjlDbVdqcE5rUllkampX?=
 =?utf-8?B?RlFzVHRBelRBYUZIaUNyS1JNVkt1V0ZzdFJJUis3UlEzelBYUm5rNjFLbUJM?=
 =?utf-8?B?M2VKWTBCbEsrTnVsL044ZEY3ZGZlS1ZaM1g3SkRjSVB5K2d5NHJDMUcxeEpZ?=
 =?utf-8?B?enArUVJsZWlTSjNWeXlJbzM2K2lQby9lN1dIWUYzWEEwUS9rczBRMEdYaWZz?=
 =?utf-8?B?UEEyb2tJOG9zY0dFMEd6SmpzR1pITnlLcmxwY2ZuRnNqYnhaaTJlaDVOMVNm?=
 =?utf-8?B?OEFvUklsUGhBcjJiM0J1d0NmcllRL1B6Q293U3pmRlR5SktGazlBbVR4djVI?=
 =?utf-8?B?VkRFOW81N3BCRmx5azBIQ1NmdHNFKzVRTnpHbEoyNmdoZ2JESTcrcVFPWGdr?=
 =?utf-8?B?TFBNaDZZTmlYNUM3Q29TK3lYUHgxL0tiY2tHcUxETUNXUkptTjhtUWNPVUF2?=
 =?utf-8?B?WDd5NWlWZTM1anJVWkFaLytxdkpVckcrdWh2TUFZOElPMlFWOGlOYXJMVnhw?=
 =?utf-8?B?Qzd0SENpeTJCK09SMjhXSnprcHR4aDJoOE5aeGsxcFE2WVVkcXJTV3Rpci93?=
 =?utf-8?B?MEZmcEE3Z1NjZE5uTWMvejByQUdDZkFYcWY5QTF1VDVRTUdUT2g4Q21SVWFj?=
 =?utf-8?B?M2xXYVFGWVlZeEdrNGYzbzloclFORGRTSmszTnF3Tnk4NU9WMkpXdTVGejhO?=
 =?utf-8?B?b0hDcVlCRU9hY01JT3NWT2tOYnhoVzYvcmRXYS9MWXd3VkpJRU9WNzY3MWxC?=
 =?utf-8?B?aklJUE9HYUVNSVZPUndVcVJxb2lYN0ZNN1pySXM5U0xJRjJKeTZpeHU1Uk16?=
 =?utf-8?B?MWhLRU1Ob1dHQTAxa0NscURvcEtPbW9IWnB2VEI3MlM0MXR0RW1lSG9BMXE5?=
 =?utf-8?B?RXpiZitEMnJwOEE0Ujk5TUxxZ2oyd2swdUR1T2tZMkZoSlVzYmY1NCs2cU5w?=
 =?utf-8?B?aTZPNEFvRGZzUHZyekJzeUZKc2JHeFhWL3BJNDIxV0FtMkhrSWM5RlJWcW93?=
 =?utf-8?Q?cvYs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16fde6e6-e0db-4f42-ea2f-08d9eaf5bfe8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 11:25:46.1766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IzOli+Y2rcq40hUTQBSd/1dFdv7giFEmltfyn9zNatZOlfZ5Q83bOYKN6VHoH6nV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0040
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
Cc: Monk.Liu@amd.com, horace.chen@amd.com, jingwech@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/2/2022 10:56 PM, Andrey Grodzovsky wrote:
> The reset domain contains register access semaphor
> now and so needs to be present as long as each device
> in a hive needs it and so it cannot be binded to XGMI
> hive life cycle.
> Adress this by making reset domain refcounted and pointed
> by each member of the hive and the hive itself.
> 
> v4:
> Fix crash on boot with XGMI hive by adding type to reset_domain.
> XGMI will only create a new reset_domain if prevoius was of single
> device type meaning it's first boot. Otherwsie it will take a
> refocunt to exsiting reset_domain from the amdgou device.
> 
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  6 +--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 44 +++++++++++++---------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  | 38 +++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h  | 18 +++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   | 29 +++++++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |  2 +-
>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c      |  4 +-
>   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c      |  4 +-
>   drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c      |  4 +-
>   9 files changed, 118 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 8e96b9a14452..f2ba460bfd59 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -813,9 +813,7 @@ struct amd_powerplay {
>   #define AMDGPU_RESET_MAGIC_NUM 64
>   #define AMDGPU_MAX_DF_PERFMONS 4
>   
> -struct amdgpu_reset_domain {
> -	struct workqueue_struct *wq;
> -};
> +struct amdgpu_reset_domain;
>   
>   struct amdgpu_device {
>   	struct device			*dev;
> @@ -1102,7 +1100,7 @@ struct amdgpu_device {
>   	struct amdgpu_reset_control     *reset_cntl;
>   	uint32_t                        ip_versions[HW_ID_MAX][HWIP_MAX_INSTANCE];
>   
> -	struct amdgpu_reset_domain	reset_domain;
> +	struct amdgpu_reset_domain	*reset_domain;
>   };
>   
>   static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index fef952ca8db5..cd1b7af69c35 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2313,7 +2313,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>   
>   		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>   				   ring->num_hw_submission, amdgpu_job_hang_limit,
> -				   timeout, adev->reset_domain.wq, ring->sched_score, ring->name);
> +				   timeout, adev->reset_domain->wq, ring->sched_score, ring->name);
>   		if (r) {
>   			DRM_ERROR("Failed to create scheduler on ring %s.\n",
>   				  ring->name);
> @@ -2432,24 +2432,22 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>   	if (r)
>   		goto init_failed;
>   
> +	/**
> +	 * In case of XGMI grab extra reference for reset domain for this device
> +	 */
>   	if (adev->gmc.xgmi.num_physical_nodes > 1) {
> -		struct amdgpu_hive_info *hive;
> -
> -		amdgpu_xgmi_add_device(adev);
> +		if (amdgpu_xgmi_add_device(adev) == 0) {
> +			struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(adev);
>   
> -		hive = amdgpu_get_xgmi_hive(adev);
> -		if (!hive || !hive->reset_domain.wq) {
> -			DRM_ERROR("Failed to obtain reset domain info for XGMI hive:%llx", hive->hive_id);
> -			r = -EINVAL;
> -			goto init_failed;
> -		}
> +			if (!hive->reset_domain ||
> +			    !kref_get_unless_zero(&hive->reset_domain->refcount)) {
> +				r = -ENOENT;
> +				goto init_failed;
> +			}
>   
> -		adev->reset_domain.wq = hive->reset_domain.wq;
> -	} else {
> -		adev->reset_domain.wq = alloc_ordered_workqueue("amdgpu-reset-dev", 0);
> -		if (!adev->reset_domain.wq) {
> -			r = -ENOMEM;
> -			goto init_failed;
> +			/* Drop the early temporary reset domain we created for device */
> +			kref_put(&adev->reset_domain->refcount, amdgpu_reset_destroy_reset_domain);
> +			adev->reset_domain = hive->reset_domain;
>   		}
>   	}
>   
> @@ -3599,6 +3597,15 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   		return r;
>   	}
>   
> +	/*
> +	 * Reset domain needs to be present early, before XGMI hive discovered
> +	 * (if any) and intitialized to use reset sem and in_gpu reset flag
> +	 * early on during init.
> +	 */
> +	adev->reset_domain = amdgpu_reset_create_reset_domain(SINGLE_DEVICE ,"amdgpu-reset-dev");
> +	if (!adev->reset_domain)
> +		return -ENOMEM;
> +
>   	/* early init functions */
>   	r = amdgpu_device_ip_early_init(adev);
>   	if (r)
> @@ -3949,6 +3956,9 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>   	if (adev->mman.discovery_bin)
>   		amdgpu_discovery_fini(adev);
>   
> +	kref_put(&adev->reset_domain->refcount, amdgpu_reset_destroy_reset_domain);
> +	adev->reset_domain = NULL;
> +
>   	kfree(adev->pci_state);
>   
>   }
> @@ -5186,7 +5196,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   
>   	INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
>   
> -	if (!queue_work(adev->reset_domain.wq, &work.base))
> +	if (!queue_work(adev->reset_domain->wq, &work.base))
>   		return -EAGAIN;
>   
>   	flush_work(&work.base);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> index 02afd4115675..14f003d5ebe8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -96,3 +96,41 @@ int amdgpu_reset_perform_reset(struct amdgpu_device *adev,
>   	return reset_handler->restore_hwcontext(adev->reset_cntl,
>   						reset_context);
>   }
> +
> +
> +void amdgpu_reset_destroy_reset_domain(struct kref *ref)
> +{
> +	struct amdgpu_reset_domain *reset_domain = container_of(ref,
> +								struct amdgpu_reset_domain,
> +								refcount);
> +	destroy_workqueue(reset_domain->wq);
> +	kvfree(reset_domain);
> +}
> +
> +struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(enum amdgpu_reset_domain_type type,
> +							     char *wq_name)
> +{
> +	struct amdgpu_reset_domain *reset_domain;
> +
> +	reset_domain = kvzalloc(sizeof(struct amdgpu_reset_domain), GFP_KERNEL);
> +	if (!reset_domain) {
> +		DRM_ERROR("Failed to allocate amdgpu_reset_domain!");
> +		return NULL;
> +	}
> +
> +	reset_domain->type = type;
> +	kref_init(&reset_domain->refcount);
> +
> +	reset_domain->wq = create_singlethread_workqueue(wq_name);
> +	if (!reset_domain->wq) {
> +		DRM_ERROR("Failed to allocate wq for amdgpu_reset_domain!");
> +		kref_put(&reset_domain->refcount, amdgpu_reset_destroy_reset_domain);
> +		return NULL;
> +
> +	}
> +
> +	return reset_domain;
> +}
> +
> +
> +
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> index e00d38d9160a..0b310cd963d9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> @@ -70,6 +70,19 @@ struct amdgpu_reset_control {
>   	void (*async_reset)(struct work_struct *work);
>   };
>   
> +
> +enum amdgpu_reset_domain_type {
> +	SINGLE_DEVICE,
> +	XGMI_HIVE
> +};
> +
> +struct amdgpu_reset_domain {
> +	struct kref refcount;
> +	struct workqueue_struct *wq;
> +	enum amdgpu_reset_domain_type type;
> +};
> +
> +
>   int amdgpu_reset_init(struct amdgpu_device *adev);
>   int amdgpu_reset_fini(struct amdgpu_device *adev);
>   
> @@ -82,4 +95,9 @@ int amdgpu_reset_perform_reset(struct amdgpu_device *adev,
>   int amdgpu_reset_add_handler(struct amdgpu_reset_control *reset_ctl,
>   			     struct amdgpu_reset_handler *handler);
>   
> +struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(enum amdgpu_reset_domain_type type,
> +							     char *wq_name);
> +
> +void amdgpu_reset_destroy_reset_domain(struct kref *ref);
> +
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> index 9ad742039ac9..a216e88a7b54 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> @@ -32,6 +32,8 @@
>   #include "wafl/wafl2_4_0_0_smn.h"
>   #include "wafl/wafl2_4_0_0_sh_mask.h"
>   
> +#include "amdgpu_reset.h"
> +
>   #define smnPCS_XGMI23_PCS_ERROR_STATUS   0x11a01210
>   #define smnPCS_XGMI3X16_PCS_ERROR_STATUS 0x11a0020c
>   #define smnPCS_GOPX1_PCS_ERROR_STATUS    0x12200210
> @@ -226,6 +228,9 @@ static void amdgpu_xgmi_hive_release(struct kobject *kobj)
>   	struct amdgpu_hive_info *hive = container_of(
>   		kobj, struct amdgpu_hive_info, kobj);
>   
> +	kref_put(&hive->reset_domain->refcount, amdgpu_reset_destroy_reset_domain);
> +	hive->reset_domain = NULL;
> +
>   	mutex_destroy(&hive->hive_lock);
>   	kfree(hive);
>   }
> @@ -392,12 +397,24 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
>   		goto pro_end;
>   	}
>   
> -	hive->reset_domain.wq = alloc_ordered_workqueue("amdgpu-reset-hive", 0);
> -	if (!hive->reset_domain.wq) {
> -		dev_err(adev->dev, "XGMI: failed allocating wq for reset domain!\n");
> -		kfree(hive);
> -		hive = NULL;
> -		goto pro_end;
> +	/**
> +	 * Avoid recreating reset domain when hive is reconstructed for the case
> +	 * of reset the devices in the XGMI hive during probe for SRIOV
> +	 * See https://www.spinics.net/lists/amd-gfx/msg58836.html
> +	 */
> +	if (adev->reset_domain->type != XGMI_HIVE) {
> +		hive->reset_domain = amdgpu_reset_create_reset_domain(XGMI_HIVE, "amdgpu-reset-hive");
> +			if (!hive->reset_domain) {
> +				dev_err(adev->dev, "XGMI: failed initializing reset domain for xgmi hive\n");
> +				ret = -ENOMEM;
> +				kobject_put(&hive->kobj);
> +				kfree(hive);
> +				hive = NULL;
> +				goto pro_end;
> +			}
> +	} else {
> +		kref_get_unless_zero(&adev->reset_domain->refcount);
> +		hive->reset_domain = adev->reset_domain;

Suggest to wrap this like -
	amdgpu_reset_domain_get(reset_domain)

and another like
	amdgpu_reset_domain_put(reset_domain)

Even smaller wrappers like
	amdgpu_reset_domain_schedule(reset_domain, reset_work)

Other than that, looks good to me (need to combine with earlier series 
as this misses a few other members in reset domain).

Thanks,
Lijo
	
>   	}
>   
>   	hive->hive_id = adev->gmc.xgmi.hive_id;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
> index 2f2ce53645a5..dcaad22be492 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
> @@ -42,7 +42,7 @@ struct amdgpu_hive_info {
>   		AMDGPU_XGMI_PSTATE_UNKNOWN
>   	} pstate;
>   
> -	struct amdgpu_reset_domain reset_domain;
> +	struct amdgpu_reset_domain *reset_domain;
>   };
>   
>   struct amdgpu_pcs_ras_field {
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> index b2b40e169342..05e98af30b48 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> @@ -32,6 +32,8 @@
>   #include "soc15_common.h"
>   #include "mxgpu_ai.h"
>   
> +#include "amdgpu_reset.h"
> +
>   static void xgpu_ai_mailbox_send_ack(struct amdgpu_device *adev)
>   {
>   	WREG8(AI_MAIBOX_CONTROL_RCV_OFFSET_BYTE, 2);
> @@ -302,7 +304,7 @@ static int xgpu_ai_mailbox_rcv_irq(struct amdgpu_device *adev,
>   	switch (event) {
>   		case IDH_FLR_NOTIFICATION:
>   		if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
> -			WARN_ONCE(!queue_work(adev->reset_domain.wq,
> +			WARN_ONCE(!queue_work(adev->reset_domain->wq,
>   					      &adev->virt.flr_work),
>   				  "Failed to queue work! at %s",
>   				  __func__);
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> index 08411924150d..6e12055f3f4a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> @@ -31,6 +31,8 @@
>   #include "soc15_common.h"
>   #include "mxgpu_nv.h"
>   
> +#include "amdgpu_reset.h"
> +
>   static void xgpu_nv_mailbox_send_ack(struct amdgpu_device *adev)
>   {
>   	WREG8(NV_MAIBOX_CONTROL_RCV_OFFSET_BYTE, 2);
> @@ -337,7 +339,7 @@ static int xgpu_nv_mailbox_rcv_irq(struct amdgpu_device *adev,
>   	switch (event) {
>   	case IDH_FLR_NOTIFICATION:
>   		if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
> -			WARN_ONCE(!queue_work(adev->reset_domain.wq,
> +			WARN_ONCE(!queue_work(adev->reset_domain->wq,
>   					      &adev->virt.flr_work),
>   				  "Failed to queue work! at %s",
>   				  __func__);
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
> index 02290febfcf4..fe1570c2146e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
> @@ -42,6 +42,8 @@
>   #include "smu/smu_7_1_3_d.h"
>   #include "mxgpu_vi.h"
>   
> +#include "amdgpu_reset.h"
> +
>   /* VI golden setting */
>   static const u32 xgpu_fiji_mgcg_cgcg_init[] = {
>   	mmRLC_CGTT_MGCG_OVERRIDE, 0xffffffff, 0xffffffff,
> @@ -551,7 +553,7 @@ static int xgpu_vi_mailbox_rcv_irq(struct amdgpu_device *adev,
>   
>   		/* only handle FLR_NOTIFY now */
>   		if (!r && !amdgpu_in_reset(adev))
> -			WARN_ONCE(!queue_work(adev->reset_domain.wq,
> +			WARN_ONCE(!queue_work(adev->reset_domain->wq,
>   					      &adev->virt.flr_work),
>   				  "Failed to queue work! at %s",
>   				  __func__);
> 
