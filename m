Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9D47839E2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 08:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1617510E2E1;
	Tue, 22 Aug 2023 06:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD4A10E2E1;
 Tue, 22 Aug 2023 06:26:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=he7ogqpycBsyEaxGRT59HYWIrimPepgJoLITTbmFt44n4Imgg+ejAyuqB4NDOGQ87T/9eclXAuhcQ5x4hLan0gOd7Te0tHa+FZDD30WnrJXBYqF7He3uFlrI1bypWHThOPQ+brz2BoUFzJq5bfzRv8dHMLQkpJ5jyoBDrvA9h2VmBfCiSo6rKQLLnHQFcUYupp3ji3HeEIMEIWbP1JMDaI6iEkbmfq4xA8h4SXjml1oCrPdWhXSwGMI2iaeAEzwRnSXa5mb1iLbpJoemi88J1TiDEm551Re/gnwGPz3jTlMPYyWiTOQLHuKohoQwbHV0dCJOwl0NlsDkd+mX2XH3cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEDfhtTy9uEnWsnZfM78pW3CA7Yfj8WqBeBL7iknaYQ=;
 b=Ldcdq81gL7fAA1+cwTJx+JiyzVyXsUJu77DydInaKUVOoQCPuLiCeqCEE3Yn0ukX5pAiHqu60X30n3XiMkgN6yJc7pWD/dMR0URu/psoc1tu+4pQTC02pVd3VH5aezzi11EqWs0ey6JZ89VboOLItU6m12w/FpyF+kLqEf5jVDW64pijJzsoPsQL6R07R2paxRtiQDGkB1FM3V/iW3tdzcSTqeu6+rsh/Ds/Rg9zR56imZexAMc5J376pSUhq4y4KTo7SyFg7dQ6Mel+OfKgpIPjLMUgKSSc4TXBEC73s5rr4X4y+sio/sSy5vQrG9660hlsqaZeD8ssSXVcwCbpXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEDfhtTy9uEnWsnZfM78pW3CA7Yfj8WqBeBL7iknaYQ=;
 b=IdXj6Zszg8XpBEQ31L7zM1b1TgorMvcY6f/pihYdVCGeyTz/lhBpvhXTYQ1BoQ5WZCzV3hXDm51zRuE7PrkdrbAUp5T8rF+XtX50q+hwArhV6U8LXtKz+1+Ph5tI0rTkATk5zj3iCJD5cYEQuzeK6lnrxiV25nmwzItZHjpGIt8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by PH8PR12MB6844.namprd12.prod.outlook.com (2603:10b6:510:1cb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 06:25:55 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0%5]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 06:25:55 +0000
Message-ID: <d57e6480-fd33-b05c-f3a8-cd6e6b87b3ac@amd.com>
Date: Tue, 22 Aug 2023 11:55:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 2/7] drm/amdgpu: Add new function to set GPU power
 profile
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, shashank.sharma@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Felix.Kuehling@amd.com,
 amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-3-Arvind.Yadav@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20230821064759.94223-3-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0151.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::6) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|PH8PR12MB6844:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b676518-675d-49ed-c978-08dba2d8a334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SoBGyeDvV1Mh2XnQcywhzKkoctAt2+xTKsI0oT83x+vhM0iamcxFiVwG3lhbwD5HD8QHsi4GqssX3dMEupWucOESpc/aEm4UtAYlAXHWshdxbpy4K9uZZkoyW7xCOvFG70CF2tuu2TqOSbI5KfVd9BKmeC8EXPZa7SUfxLT09xIR7xWMTXyJ++OQ4HOHjcCcNAYzHRQW/sHko/dJBOLXZBnefs/fDWZEpMNLYy/VANgNBW3kqzeAk/HMI8fSuo1QHKh6st3uYKgOMMha5ALe1frRiEIyN3WWFQ55oaao0VJ5vMobHvTqTZ9RVTAwsA3kBM9VN3F5dE07NzKpHn8QssGuLWkrO5S8sJdf6jjd703VroMq3izxJVEROJMpnrDxTi8PyngppLWat+tPGxL9MUGGoxcFcE20rYwIrirsuCV6eDQYhuItlGD4CCnbGSqexrWsXfMZePYgPjwqr+Ag25HUDhq8+PrgsvqQR9KuBXwbd8J9OfpH5+u4iZQrCWB9z8pXjphsTdo8AiVVWcdqSjEAzi6gwbLPx3riENd99r7PidM7iIQGYsU0PCzfTPNgh9x3IJ0NJyDYmbOhiRLmtTPm6hFHezMp4aFsXT/UbrItMNm4qxHniss/bhqKUg4YCnG6a0MguV9JRBYesKMN+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199024)(1800799009)(186009)(2906002)(83380400001)(53546011)(6486002)(6506007)(38100700002)(5660300002)(26005)(31696002)(86362001)(31686004)(8676002)(8936002)(4326008)(2616005)(316002)(6512007)(66476007)(66556008)(66946007)(478600001)(6666004)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXM1NWVjVnAyYitQSG5OMDlBQis0SmRyaFJnWGdCbUpuZ1FseGdZbFp4c2xx?=
 =?utf-8?B?Y3R6YUE2OGtqYnlzUHpCNTQ1YmNJd0owRnV1ZDhQRHpjWWZVcnpndG9pNUZP?=
 =?utf-8?B?bVBrMis4dTJ1MXRQNTEvVzBwOGhuTHZUOTFxK25OT0JIVW5tZnBHaEtVUGpQ?=
 =?utf-8?B?UGZGb3gzbUE2SmVySFlzOTRHQmVDU3UxZTdBcUdpdGZWTHhCNEtTZU04ZElX?=
 =?utf-8?B?L0t6bkNwQTZESjdhd3pBZjBUMUFyV1pnQm1FVkZCYmVsekQ3NUxyS1l0OHZE?=
 =?utf-8?B?d0FMakxOYlo2YTFSby9nQ21LeVdlN20xdE91ODBrbnQzeGtiMERiZjdRYTIv?=
 =?utf-8?B?K2M5WTdjSlFUak9aZnUxcGVuRlFkOW9LeXRRUjc2a09Ld1JxejF6SDdybjN2?=
 =?utf-8?B?Q1RkbDhVVVJGNjAxREZCelZ3NnhhVzB0Y3lwcEJHNlRpLzNMYVl0Ulh2YmpD?=
 =?utf-8?B?ZFRjd094bE1IOG5MaDVvR3pXVGk1Qmo4OGVPRXBuUUdUMllEZ1RBUWMvVTFr?=
 =?utf-8?B?aG1PczFlNm5VVU03RVA3aWo0UEdIQThQQ2syc1Z4ckFmaTJjeE5sRmRDaUtF?=
 =?utf-8?B?SC9HZlFzckIrVFJOL05Cc21SVEliN05JMlowVDFaaFRVWksycmlqYUoyN3Nl?=
 =?utf-8?B?VkppQlMvTXQxVXA2QlN3NmxsTi9EOUxIWlJWN1lPMGFsMmIxSWlNbzFkbWRn?=
 =?utf-8?B?dGphTjlVYnc1U3dzUmR6ODRsY3lYbHlubjFkckd4MTZ1L0k0ZWJnRXNxRXhu?=
 =?utf-8?B?WWFvSTI1L1ViZ3FYbW5xZzJIVDF1TUY0SFVaK1NROEppV1N3bzhBV2cyNEgr?=
 =?utf-8?B?amlFYytYb0ZVaHg3RHZPK0g4Rm1FaXJlWmc2TzIyVVFtM3lWakdidHExSUZs?=
 =?utf-8?B?TnI3UHR1STVIazBXMnhSM1pieU92RkYvU29sN3FwbUwyUDNNd2ZBSG9UZmhv?=
 =?utf-8?B?blVGNmltUktwdnlCL2xXRkNab0FyVjJLVjhLQkJqd2NaeTcyNEVEMEE5WHhk?=
 =?utf-8?B?TndQbnluYkJhUmZJVld1d1RPZjJGdm56M0trWjhHYmtFaGhsSFZCalZ5NXBX?=
 =?utf-8?B?cVg3YlF1ZnFoVzFER1IwMVdtUWNiUWhuUG4rQVErSS9ZUy92NUpXcFBJNWcv?=
 =?utf-8?B?aldYOGpOQ3RNM2M5OXd5THNXZ0lIVU0vMWNtazM1eXdZc29DY2NoZTJZRU81?=
 =?utf-8?B?WkVFWFRHNDhXRmkvRUtNM2RWTWc0L0RacFRpUUhsb3FZckd3LzQ0NTNvTEUz?=
 =?utf-8?B?akVTVXZuNHdmUWUwVmo1SUZIc3pVdjhlTHdGREswT2FRaWRiUUJremFDb2kv?=
 =?utf-8?B?T1Ivdkw4ZnhrakYvNzhXSUlCMjF4ajlpTnNobUgxNnlrRC92ZlFDUVRQS2pt?=
 =?utf-8?B?c0xNWDJNK3VwVTROZzRTZHJ2RzY0N2tpbEcwMEhoOVpld0dYV3dzZUxyVU9i?=
 =?utf-8?B?Z0U1S2hydXNKUDFiVjZtYlpRcXRCcU5aQk11d1NqUzlPKzFWT0dpK3JUQnh1?=
 =?utf-8?B?OXFHN2JnWTRudDNEdTkxRVpWWTVYaGNGWUhxRXFjSnNNeEJYTndobHRkV3FV?=
 =?utf-8?B?UjRMai9Sa21nbElLUXlTRExCNXZSQU5TT2hQVGlGYTQ5UWZwR1F2R1Ria3dz?=
 =?utf-8?B?SlhoZHpvU3h5bTBBWHVJcXdYeTZ6TGk3clZQQ2hNMkxCVVUrRDJhRERoaU5V?=
 =?utf-8?B?Zld2Znl1T09aRG5HbFRwTnI4Z2M1N2hOenZRdTRiQ2dJTjNsVnRZQjZTZmhT?=
 =?utf-8?B?VVpwbzhOSVQ0MHZTNDhnUlhNM2JzMXdqRDVTbzNlelUzWi95dzJReDUzNGNG?=
 =?utf-8?B?QUNLdWgxOHNSQ0FWOHFHb3cvS1U3UmMzMWRzYmpxeUIwRjI3T0tLZU9Bemdq?=
 =?utf-8?B?MlhaWms5TXlFeHlOVTZtL0NLb3RKNDg0Z0F5YnJnQ0FtSW5zMnJjdEhLQjNX?=
 =?utf-8?B?TENrbTIwLzZBTmhMUG5IRFdiZFkwcnZ4YUUrN0ppZnJ6dU5JMGFxdEhpRnNt?=
 =?utf-8?B?TmR1SXNramsvUHNOUEJybGNicHQ5b2JKRS9uVlRDcmRZR0RQb0t0MnZ6VzVP?=
 =?utf-8?B?RmpLam1yUkI0WS8wYURaQ3ZYRlJ1aG10M1hLS1FBck9iQkJ4SFJDcFdpdE1y?=
 =?utf-8?Q?aEiLQZHHl/nwQMTzEj3e6SPrt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b676518-675d-49ed-c978-08dba2d8a334
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 06:25:54.3804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v6f8xhrh2IgS9SFj5DI/Cz3MEY9wcBgsKfetNTmK7BVkklFSuUJq3xXUqo5o1Mgh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6844
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/21/2023 12:17 PM, Arvind Yadav wrote:
> This patch adds a function which will change the GPU
> power profile based on a submitted job. This can optimize
> the power performance when the workload is on.
> 
> v2:
> - Splitting workload_profile_set and workload_profile_put
>    into two separate patches.
> - Addressed review comment.
> 
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 56 +++++++++++++++++++
>   drivers/gpu/drm/amd/include/amdgpu_workload.h |  3 +
>   2 files changed, 59 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> index 32166f482f77..e661cc5b3d92 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> @@ -24,6 +24,62 @@
>   
>   #include "amdgpu.h"
>   
> +static enum PP_SMC_POWER_PROFILE
> +ring_to_power_profile(uint32_t ring_type)
> +{
> +	switch (ring_type) {
> +	case AMDGPU_RING_TYPE_GFX:
> +		return PP_SMC_POWER_PROFILE_FULLSCREEN3D;
> +	case AMDGPU_RING_TYPE_COMPUTE:
> +		return PP_SMC_POWER_PROFILE_COMPUTE;
> +	case AMDGPU_RING_TYPE_UVD:
> +	case AMDGPU_RING_TYPE_VCE:
> +	case AMDGPU_RING_TYPE_UVD_ENC:
> +	case AMDGPU_RING_TYPE_VCN_DEC:
> +	case AMDGPU_RING_TYPE_VCN_ENC:
> +	case AMDGPU_RING_TYPE_VCN_JPEG:
> +		return PP_SMC_POWER_PROFILE_VIDEO;
> +	default:
> +		return PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
> +	}
> +}
> +
> +static int
> +amdgpu_power_profile_set(struct amdgpu_device *adev,
> +			 enum PP_SMC_POWER_PROFILE profile)
> +{
> +	int ret = amdgpu_dpm_switch_power_profile(adev, profile, true);
> +

You don't need to interact with FW for every set() call. Only send the 
message if workload_status doesn't have the profile set or refcount is 
zero. Otherwise, only need to increment the refcount.

Thanks,
Lijo

> +	if (!ret) {
> +		/* Set the bit for the submitted workload profile */
> +		adev->smu_workload.submit_workload_status |= (1 << profile);
> +		atomic_inc(&adev->smu_workload.power_profile_ref[profile]);
> +	}
> +
> +	return ret;
> +}
> +
> +void amdgpu_workload_profile_set(struct amdgpu_device *adev,
> +				 uint32_t ring_type)
> +{
> +	struct amdgpu_smu_workload *workload = &adev->smu_workload;
> +	enum PP_SMC_POWER_PROFILE profile = ring_to_power_profile(ring_type);
> +	int ret;
> +
> +	if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
> +		return;
> +
> +	mutex_lock(&workload->workload_lock);
> +
> +	ret = amdgpu_power_profile_set(adev, profile);
> +	if (ret) {
> +		DRM_WARN("Failed to set workload profile to %s, error = %d\n",
> +			 amdgpu_workload_mode_name[profile], ret);
> +	}
> +
> +	mutex_unlock(&workload->workload_lock);
> +}
> +
>   void amdgpu_workload_profile_init(struct amdgpu_device *adev)
>   {
>   	adev->smu_workload.adev = adev;
> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/gpu/drm/amd/include/amdgpu_workload.h
> index 5d0f068422d4..5022f28fc2f9 100644
> --- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
> @@ -46,6 +46,9 @@ static const char * const amdgpu_workload_mode_name[] = {
>   	"Window3D"
>   };
>   
> +void amdgpu_workload_profile_set(struct amdgpu_device *adev,
> +				 uint32_t ring_type);
> +
>   void amdgpu_workload_profile_init(struct amdgpu_device *adev);
>   
>   void amdgpu_workload_profile_fini(struct amdgpu_device *adev);
