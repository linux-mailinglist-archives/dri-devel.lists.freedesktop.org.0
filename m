Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EABF5782A04
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 15:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE76810E238;
	Mon, 21 Aug 2023 13:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B38810E238;
 Mon, 21 Aug 2023 13:10:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/yJBUEzyS+By5mva5VgqQJ4GNImF+X+9QDY828vXznmp3vIp5vbsuBrx+Zv70hsagc6yHMObCr8AZYjagq5Rh0Q99BSKtqc+3G93ROx1roms7XT+yNK74peuhchZI+7Sh1TC+KwEM7RIra2nNc/GRpaG4d9J3wU+fiWV0lsySDNzSvjWelgGPY0wkz5fRyn2Ls6pEsANZYpj+CxazuaJ+6y0GkonBh88qW7+ZzE7s6SqhBMrVT3xeMK3skBT/WtgPWuqf7NzlVDApjJrDkgYXShs4SijTLNFtfuPATv6HMzWFvRT0XtGtIhHiT2fKMk5phXHRoWTVHsCC6OJGUDYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMR22lEU7+fdSAqAc3j3gnNtsSdk3SZHfraALqU1a54=;
 b=GvjJ3AaEOooN5pk+bnqTccTcNz3JST9pn8iptXOgDMhUoFlKw7IjqRGFYv3EWt6A3B5zs/8CqKi1zMC4jPppO1Y3dOspTlPstFrnMXRLVsDiFFET5Ii94pGbaClghnb5EhsK7t2uupqNLp2C1P+O1pqi/s1xAWe0QyFWoI+M5bAJlpwVHHSg+L4naPotTTmXy4zRCbQlXuDysFVVGiHdv9s287fkKbs1modPbN3S4c8917Im/vvQI/KDtVzbXuH0WdcaiWCF+NNPbm/SfmAhSI3gzH/Q6uIkz/fgg35a3CvI3QoHpPsO2zzsMHGjg3tK903MY4SD4WKhzv25/V0sBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMR22lEU7+fdSAqAc3j3gnNtsSdk3SZHfraALqU1a54=;
 b=rNFP9LCONasKFg0LYAVyN2vvgcAMYMU7UN3QhoovJAyoStie0OGhHq9hYVit65FwzHx9vTcU/8mCBctlN5uFRUHjQoL2xa0n3H13plloxG2PCt1S1mwsZA64LYT93RHAj3bK4a/fT6etBXvsdCQmG3Ndocw1erE/ZpiGhBorP5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by DM4PR12MB5892.namprd12.prod.outlook.com (2603:10b6:8:68::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.24; Mon, 21 Aug 2023 13:10:51 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 13:10:50 +0000
Message-ID: <75462233-df16-c647-89e7-c0a507e0d981@amd.com>
Date: Mon, 21 Aug 2023 15:10:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/7] drm/amdgpu: Add new function to set GPU power
 profile
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-3-Arvind.Yadav@amd.com>
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <20230821064759.94223-3-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::16) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|DM4PR12MB5892:EE_
X-MS-Office365-Filtering-Correlation-Id: e1badea5-1f4c-4dd3-b917-08dba2480ac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PzdnBZ8WA1UV+WHq9ns0O4MqbdmhWMTTTHuw0Vf/DdmidBxzpO/2bX5r+99XOPpjKqhLA0zNjw9/127yHiMWoz6yBOJQubuvGtTWJm69iknXg6gSrBmqNsdespldU+npj1oykPn1ANbV0F9hBL5UISu/CiX5PNkGpnZxlqm+MQ91IfnHmerV1Mrx6Q208OpE9YpnzlK1Su+ShCasQ/Rr7mBWAtz6NfkyoZeFPdymH83hPi45V6UR4RBGxaPiZHKjvhddp47mxu4E2IsZePi1tFPpqYPQfTBW1T1vewI8ClQtXLlwcC0xpcb1DH3T4v99APXj2kzH2mkGWiwesPDPSen59fY+ZhSVAP/uzU/y2q71a4CvRZ3uKFJhLIeRdpQzh2ngRDRCxnft8UNnR+fOPnhnk2lF63Gh2b3Gg4cAimlURwxD0o2oZfPMIRnN37KIqCaGHkAy+XcZVrblMWk8VrUxBePzNdM5FmAId2myzRQdM+thUMXb7kdbqfNNlE9j11pzShpUS+Yo4O720Ejvnb76VFzf0Tyh3WTaZMQqJuEIaiLArdfWOTMJaHALa1EUJkU7p158M/whh4hLpCwtBzZ8XVbe8Dk+fCvRcrio/bYgSynXU6v8n/9oArATxEfOOLGbhWCDdyzM3PXT2Sm9/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(2906002)(53546011)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(44832011)(26005)(86362001)(31686004)(31696002)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(66556008)(66476007)(478600001)(6666004)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MCtEaWNMRzI0Q1Axb0ltdFljS1BYMkpjVUlnYkN6NS85dFI1TTVwTjdBSlRu?=
 =?utf-8?B?b0pNNmhTeEc2V0JJLyt5UFhTQzkvTkZ1d3k2emRYUXJLYjRJV0FYSXdKQlNa?=
 =?utf-8?B?dFJkUTR3WnlRcno5YU1zYjg3MEgrNVRCY0w4bE0rZUw1em5KTERjeHl0Mnk5?=
 =?utf-8?B?OXd1NHpDd3Q3YVkzZWpYSDl4RXdnL2d1eDJSVGJMRVp0UGJKa2R0d2x5OWlQ?=
 =?utf-8?B?ZzczSWlKaUNObVVvTDFrUGdhTDlrNDVYaHVrTTRPZnVWdEJ2NXJzcHp0ZUhp?=
 =?utf-8?B?TytvU0FKSVNJQjZxOWZLaTNsTk0zMFZCMEUyUTdZdHQvQ2twM2h3azBLZkNW?=
 =?utf-8?B?eldMOUZMOWZkNlhadkFYNk1TdUJUSUhRVkY4TC9DMXRnY2d0Z21GOUR6SkxH?=
 =?utf-8?B?TXdvUnBScU1LL0FEQ3JHVlZtQ2d2V0hPaUJEc0FRM3IxWUxvTmwxb011R2lo?=
 =?utf-8?B?bkZESjdsRE5Nck15TlIxRit1TU0xL0QwSGtLSXNVOEZVTGlhUGFOcWZzMHFx?=
 =?utf-8?B?KzkrRFV0bi91NUxSbDhybzN3WWY2OUx6TkE2citKWFlkQWxaMDV5V1U5dzdm?=
 =?utf-8?B?RUZ2YmMvSEV6WU1DRHgvaWRmVUNoQ3pScnBaNjRKb3k4K1NmOHUyS05WbXdV?=
 =?utf-8?B?cllqZjYrbVk3L21qNDlmeVF0c0lpaThpdVJpSlNpbnQzOFFNY0tacWVVd2lp?=
 =?utf-8?B?aU5CeFM0SS93MlByQ0RyeHVDV2dYdHlDckROc3oyZURnbjBub3dDRDJtNnRx?=
 =?utf-8?B?ODJRVzFHdk54YjhXSUY4emtDbituS2V4ZzBraDdSdGg4WWhza1hMQ1daL1kz?=
 =?utf-8?B?UEhSZ0gyZFNXb3E2cmxrSm9VTllTWEEzbkRNQmRDOTA1OHBXY2dnQm14Tkd1?=
 =?utf-8?B?bFlZR3pkYWdRSWNBRlNteWFCMGZ0TXZJUmhJQlVUTWFBa2tyWlgxbG9uSHRn?=
 =?utf-8?B?RWNnbHJMQVZCdkJmVzhmWU8vN1lJbHRzdSs4RE9qVnl4Q3dVNTF0U2ZYTGs4?=
 =?utf-8?B?TzNzTWJ6L0M3djEyYTRRSjlyUituNWhuM2o4cXhRR0Q2eE9xNk9uUXJTbTVm?=
 =?utf-8?B?WmlURERqUE5YMEZ2YUQwUjFvSko4TTBORmN6RE90bTVRZE9CSDZreWdBZlNw?=
 =?utf-8?B?RTQxQlp6dUZaY3F0ZERWMy9XUlE0Zm5IRTlEQ1RGNU9kdXVqdFMyL2I0QW9i?=
 =?utf-8?B?dmJzNkNhbGd1VkhDNWFtUFpYck54ZzVXaTM5eDV0dUJnY0lvMkgySEdMNXBD?=
 =?utf-8?B?Y3pQa0xmc0tYd1U2ZkVvQ0hoVWRmOE9DU1VBUUJobk9PTEVHQnczSGtXZjVG?=
 =?utf-8?B?ZkNoS2FKSGZUL0creDhWc1V1czZGVmNIS1o2UWE5RVcycTBad2lPOE1od2FU?=
 =?utf-8?B?UEVKanRMeHBDU1k2dnBmUTNYeXJQMjNyU0hwbjgvenNNMDhUN1krcHZsNmF0?=
 =?utf-8?B?RW1HMjIzSWp6MC81Q0pBZTArcFY3SlF1NE5jK0l2Y1cyUDRHSjN0Myt5dWtP?=
 =?utf-8?B?a1h3dnhSU2VVbjB6VFpGTnpEdVFFbXA5YjRhbGppSGcrZW82Qy9YNmliUHln?=
 =?utf-8?B?RWRRbGhRSXVseW0wc0ZrOThmbnE2SVBvblZoOFJWM3dEMExZb1B5cU1mTkhp?=
 =?utf-8?B?R0NwSG1jUVRFN1ludWl4L3V0ay9LenBVaFMyZHNuZWNIMno5K2lQQjJHd3N6?=
 =?utf-8?B?dk0zVk5id0luYndSbWFyMVhzdnEvQWJ6a0VKUHJFZ2lYbkFjY2dpNi8zL3FL?=
 =?utf-8?B?SGJSRU9rRjRsSHFpMjZ1eTNYVjJMTmpEeU9kZ0dkQnBMdmxnR1FNT01nK28y?=
 =?utf-8?B?ZisvN2NPUTEzSFluWlZLSTY1UEV0eTltMUozcHJ6Y2FRcEVjNWloRXZ6Y1dt?=
 =?utf-8?B?UDJodk94MzRFNldiL0RtUExHM0tkMXJTQ1d3cEp4M3F2bGNLYm9GTHFrVDQ3?=
 =?utf-8?B?a04vRk1xYUJvSG9DWGF2YnJWUjhoM2FYQWYyRElVNVVKa1FTbnFrVTdBcEQw?=
 =?utf-8?B?Q3FCOG1MQVBEb3k0c3VmYXMwaFRLOXp2TXdkQUpSOEJ4cU5NTHcyYys5SE8y?=
 =?utf-8?B?bkYzRVpNRnBBUFc3RDlENHdjSWxUTTNTaXNZU205WlV0V0ZJRCtqSVB6azNV?=
 =?utf-8?Q?6Djr17fVPG/HtQZZXfkHffWul?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1badea5-1f4c-4dd3-b917-08dba2480ac6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 13:10:50.8390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1z1CouOiS5N724zqO6wxR3QbZPvjBG/syZzfcj+rIWfF3HH2nWM3VK9uWkMGSWgY9xakGcbwttf4TV0cG7Sk1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5892
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

On 21/08/2023 08:47, Arvind Yadav wrote:
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

Please feel free to use:

Reviewed-by: Shashank Sharma <shashank.sharma@amd.com>

