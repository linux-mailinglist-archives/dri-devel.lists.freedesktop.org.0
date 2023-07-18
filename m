Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B49B757CD5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 15:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7F510E027;
	Tue, 18 Jul 2023 13:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC95210E027;
 Tue, 18 Jul 2023 13:09:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lK7S7Gmj4VRhC6o3SOiy6x3piffBjTLbKpt5m417UB5EfMjaKsUX8+GRCbDHWAYxc/jW+Bz9nNFPNGnNz2UHIlglUKVmiBCMbyIujmkgIsDq5HHeZSYrh/bkmDnvyD0s0/bBeSDrK3ME0Gfngz9GPTa0Hs5Z7mwMavRE3/DA4Si3oCcbVMoZ0A9O8L3OUOTSRKmVja9cdrilpExHK0lnO+0TN07aIjueYiYGkasQI4QKya7FKGMyYPG2BE/WYj7ajhu8jTzLMw6UmvjAHeWz9u3E4vODjv+VoMFwj8LxTKTy7txUxASgRVNNniQVtkAu8KhlDbL4fq2GF0O/C+xXyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JP0G7sJ2sQZ/xQps3bprfL+Bfbno6tCviMhxqkITJWA=;
 b=Dvt7iDCw7Y3k9Y0ot5pgRWOnEBlczgPPyC/OnZDrjfYdiMWUIpKXZEIUHopjy1CaLipGIZ2Pj+kmd0lPCN1DlwUIvuLwXkWAavMTJ7vj1gn/zsQplQMhZDoIFOrdEvKUo1LfKMKl0h8poxX2yPBdckcukdZxB6OKcHNwPIeBSuAgYZNpMhaoYzFZmCY8TQPWqmKuw9NzrXXk5iFQ8TEamEPykcAIYvW5tvVVFbGDVciHMNsFY4gXggtC0fyBs94FjitXUIHpNv+E4dlMcMhiK0wQ4aekgQeDCLhy6cqBSgW9WBteuJQAF6wBED+HHXFtC4MSONtEBSrvAZyuYyR+fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JP0G7sJ2sQZ/xQps3bprfL+Bfbno6tCviMhxqkITJWA=;
 b=y0VnSXA9gq9AMlbPZUNvyzf3VyLETKhbAJuNdUUTjmc8QypU08c7g8vkiPr3BzsUGTqUgg6UxBgR1vpLx0wOVWCYg9gRR/Qd+B1eATX+wQXtOaXss5XCI2FvdlAEGnzuWxNQHRr3fEW6l7G4rsufzmPGjcHavldbD7ENo0rAiuQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5399.namprd12.prod.outlook.com (2603:10b6:8:34::5) by
 CH3PR12MB9314.namprd12.prod.outlook.com (2603:10b6:610:1c5::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.31; Tue, 18 Jul 2023 13:08:56 +0000
Received: from DM8PR12MB5399.namprd12.prod.outlook.com
 ([fe80::4aa7:3431:dc3:4388]) by DM8PR12MB5399.namprd12.prod.outlook.com
 ([fe80::4aa7:3431:dc3:4388%6]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 13:08:56 +0000
Message-ID: <f13c119c-c690-9c5c-6540-f1a4224942b7@amd.com>
Date: Tue, 18 Jul 2023 09:08:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/amdgpu: Enabling FW workaround through shared memory
 for VCN4_0_2
Content-Language: en-US
To: sguttula <Suresh.Guttula@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230718032032.4115822-1-Suresh.Guttula@amd.com>
From: Leo Liu <leo.liu@amd.com>
In-Reply-To: <20230718032032.4115822-1-Suresh.Guttula@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::25) To DM8PR12MB5399.namprd12.prod.outlook.com
 (2603:10b6:8:34::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5399:EE_|CH3PR12MB9314:EE_
X-MS-Office365-Filtering-Correlation-Id: 03245288-4790-4357-ee3e-08db879024ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yHDm4vmqxlC6yEZkm+iC3LFPR4dlL0zkravnnnCtgZmOIveOHM1QhOBY+q4NObx+RD4fDmPVpcS5XJYjaEGy4ytCi1ZhSI+NSpuWwShUuWk1/l02qW265dSe8Z7Fj1hRFk5NnuXuc+7mSWTgZ/smDhJCYW/5MFRYhW/JIQ0lZILzUlf9VakJQ3svnSxAoDcinvMfzVqrHfk44778AET24RGinyr9q0Z/Gyer1fHb4F0WYs8LsibYswVzr52DrP+NaXS1QcMF7w3tSvvNxDsnlRQTcTC4E05XqfBcxGQU8/9OOdC2ttkpQuMClP2AkkygI1zMUXWAKnLc7Bd3bO2rhDqW8zMrWTFpKYxph0ifoX9Oi29D0L9FC5Jctp3KuvNXb+3XvyFq+KBOt+WnyP58HqpdzIf5GwrQOTLppEeUXcu7b6Ams4GPzAERiG+CNcKQl5LRp6OSgn8E2lXJNLsp6qx1tKf6hbtI39N8/Pcaj6RlsDMkgbuAj54wJvFtwYQoWxRjk5k7kxxqlToVBh4cxPxUUXkBZai86AaJJbb94kHtugMAfoUppdxhR06cF0PvXBbn65kl5OcbMfImc5Uw4wl8z7MLNqdQKgWGiJ+M3PDqni4hJe1TGWUHJpsZV1TIvXqrYePHeR4U/dzKFKydew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5399.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199021)(6512007)(6506007)(53546011)(26005)(110136005)(450100002)(38100700002)(66946007)(36756003)(66476007)(66556008)(44832011)(2906002)(5660300002)(31696002)(316002)(8676002)(41300700001)(6636002)(4326008)(8936002)(6486002)(86362001)(478600001)(2616005)(31686004)(83380400001)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU52dWI0Myt5VytERlhOS2JiL3N1YkIrZXVhMnQzOXZ0TlBSNG9DQUM2QlZS?=
 =?utf-8?B?RjVCK1h3NkJGcGxZWnpUSE9FTldlWkRpa0ErczlYTHVKeFpGdGs5SWpwcFZh?=
 =?utf-8?B?NHNLc2dwS3dIb1RpaVh1bk5KZiszMitJTTVPTy9LZSs3TE5xd0FQN3JDaUk5?=
 =?utf-8?B?djJ6OGpyRTZlZ051aWtJM1hEUXZJN3JhUitlLzNKY2dsOFFHQkk0UG1Fem5z?=
 =?utf-8?B?dkhuSGxWSHk3RlNqeDMyKzgvMWNnZk5uM20vYnRVbkpPY3VWYzI4aERHSFY4?=
 =?utf-8?B?eUpOcndZWnZDTW9YS2tIL2FaZWQrUWhyb2tDMnpWN0t1ZGVqYTkxaXpoZTZR?=
 =?utf-8?B?UG9nK0VlRjRXRmhya0tIRnVzRnBRMmErd1VlZFRsZlBlcnpyc1h6V1NXME9N?=
 =?utf-8?B?SWppbDFEU0JRYWZsRnZTdzhSQndlOHJoQ3VSRjJDV1F5UDdOVE9oUEJIZ1F5?=
 =?utf-8?B?YktaeDdlQnZkanFPVHlRS0tBV1laUTBPYUs2a0t3bURITjhiL1hWU2J6SmxO?=
 =?utf-8?B?azdkaWJka1RrbGpZUHdBZFpwMml0ODZhbFQ5N29yUDhDZHBGcHdKSU8yNEtZ?=
 =?utf-8?B?K1dRTEt6RW9pMHNZaTJBZFRTbk82Y0FWREdRV2N1TmtCS1VtNCtZRU4rVURW?=
 =?utf-8?B?amNPOW14V3lpMkxsdTkvTHcwYXB6cGl6U2RGNDgybEZUYUxuVTJxemhSd29H?=
 =?utf-8?B?aFRZb2hNdGZ2eDZOZTdVR0M4eUltWlhNZndIQm5VdFJ6ay9JQjN0d3NGMEZH?=
 =?utf-8?B?em5TTzNVL0txY2FORmc2dy92VnNOaXErSjVoays1M2Vob2RYTEpHbU5HSWNW?=
 =?utf-8?B?dzNvNlN0cTg2UHJodzdzZzFTK1BtSzVuN0tnZGo3UnRjWGhGdlc5S0JDWWFQ?=
 =?utf-8?B?T3M1SUE5Wk9jaS9kZS9OTnUrSzdDVDdpRkdZVURlbEU0S1VzaDdrQmIyYWR2?=
 =?utf-8?B?VUhiVUk3YzBKdk9PdFFkQkovQ01Ed2gwRml0cWFBV25IYnZyY2E3QlZoL0pC?=
 =?utf-8?B?aGE0K0VWODYwRlZrZnRDY3FZMTI4UWQxSFVQL3pvZzFHcDUvV1ZGc2Qrb2dW?=
 =?utf-8?B?S3VhNjU3OEZ2VTgrbHBWNEZIb1dCQmZWMldnZG8rTWNNRTlmeEFRd0ZLUnht?=
 =?utf-8?B?NlNvb3dLSjJrclpJTElDbGhubE9TZytjZTJ2akplalk3UlhWRjZTQVRFeDU4?=
 =?utf-8?B?bXNkK1l6aVN3eXJ5THp6eHZNZlpJOVVUdlRic3pMWGhMWE53YUhCNjZhM0k0?=
 =?utf-8?B?THpBek45T0NEa0dHUzlNYmc3ZG9HMFpESks1RXVlZXRtYTZKZFFHclp4Mm83?=
 =?utf-8?B?QmNXZXFwZDFxNlZKVlJBMlFVRnVIbk14dDdySkRKUm43RW1KU3hUNUd0NlVD?=
 =?utf-8?B?S2I2MmxHaXkrOGRpeHBJYmV6aDVuamRqV3dzcy94NVBDRlZteHpFTTJSM3ky?=
 =?utf-8?B?TTdxWWxIRnllTEphVHFHWk5XOHlKTnNMVjZnVFYvMXRMOEI5d3o3VWtDd1hy?=
 =?utf-8?B?TVYySStBSjRKcEw3bytUS2V4bWRHTk9FNXFuNzBJUm9rOHIvOFZkZ1dkaGF4?=
 =?utf-8?B?dWNNQk5HTjcrRmFPREtXTE5uRmpqRWhqR3VDMjkyZng3V2J4WDlpR3ZKa015?=
 =?utf-8?B?LzYyVmdkcWFpdSsvTFV4S09IdTZrUHplQWE1SjI2R05YUHAwQWdDenFlc3Ex?=
 =?utf-8?B?YlBEWm9OTjR0STFRczNHSDJ1WU9ldzV1cGh3L1RtTXVDQXZXb3dGK0NWbEFH?=
 =?utf-8?B?M1VsSGtEMmV3Y0N5Y0ZBZjVSTDQxQmRReWFjSG50MjZkVHJpTkt4cVFLdS9t?=
 =?utf-8?B?cmdYdEllZkoyTm93S1JxT3FWU2FidHphM2ZZdWhqR1AvNm1SUHpkVHBrRlZP?=
 =?utf-8?B?Y1kwZW01Z3ZEaWgyNHRSanJxelprQ1RWeUJyN3dmQVlIZnBLL3l0MUdXQzhY?=
 =?utf-8?B?VzhHdjdEcWlEOFpTVHJaVVZLeHlOWVlHOXd5VDdlMDRKUmJOSEM1VDV2Q0JJ?=
 =?utf-8?B?alBSY1lyWGpMeUR3MjdVRFk0YTBQNEVoYWU5eHVlSGpqeTJsbm5zTXBUMVNp?=
 =?utf-8?B?eWE0Skh1NXczdWNrdlhTWFdFTitNU2l4TzhJMUIzSUxhcnZVU3N5MWpUNTRJ?=
 =?utf-8?Q?VVLk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03245288-4790-4357-ee3e-08db879024ce
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 13:08:56.7467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qpbm+wp905eM3fGrFD4FdGFsHXfEb9Fgq1dxeZjYNmhJAKkD+q2Cr4LVm5BrCgl1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9314
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Leo Liu <leo.liiu@amd.com>

On 2023-07-17 23:20, sguttula wrote:
> This patch will enable VCN FW workaround using
> DRM KEY INJECT WORKAROUND method,
> which is helping in fixing the secure playback.
>
> Signed-off-by: sguttula <Suresh.Guttula@amd.com>
>
> ---
>
> Changes in v2:
> -updated commit message as per veera's feedback
>
> Changes in v3:
> -updated commit message as enabling for 402
> -updated the logic as per leo, feedback
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h | 9 +++++++++
>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c   | 6 ++++++
>   2 files changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> index 1f1d7dc94f90..a3eed90b6af0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> @@ -161,6 +161,7 @@
>   	} while (0)
>   
>   #define AMDGPU_FW_SHARED_FLAG_0_UNIFIED_QUEUE (1 << 2)
> +#define AMDGPU_FW_SHARED_FLAG_0_DRM_KEY_INJECT (1 << 4)
>   #define AMDGPU_VCN_FW_SHARED_FLAG_0_RB	(1 << 6)
>   #define AMDGPU_VCN_MULTI_QUEUE_FLAG	(1 << 8)
>   #define AMDGPU_VCN_SW_RING_FLAG		(1 << 9)
> @@ -180,6 +181,8 @@
>   #define AMDGPU_VCN_SMU_DPM_INTERFACE_DGPU (0)
>   #define AMDGPU_VCN_SMU_DPM_INTERFACE_APU (1)
>   
> +#define AMDGPU_DRM_KEY_INJECT_WORKAROUND_VCNFW_ASD_HANDSHAKING 2
> +
>   enum fw_queue_mode {
>   	FW_QUEUE_RING_RESET = 1,
>   	FW_QUEUE_DPG_HOLD_OFF = 2,
> @@ -343,6 +346,11 @@ struct amdgpu_fw_shared_rb_setup {
>   	uint32_t  reserved[6];
>   };
>   
> +struct amdgpu_fw_shared_drm_key_wa {
> +	uint8_t  method;
> +	uint8_t  reserved[3];
> +};
> +
>   struct amdgpu_vcn4_fw_shared {
>   	uint32_t present_flag_0;
>   	uint8_t pad[12];
> @@ -352,6 +360,7 @@ struct amdgpu_vcn4_fw_shared {
>   	uint8_t pad2[20];
>   	struct amdgpu_fw_shared_rb_setup rb_setup;
>   	struct amdgpu_fw_shared_smu_interface_info smu_dpm_interface;
> +	struct amdgpu_fw_shared_drm_key_wa drm_key_wa;
>   };
>   
>   struct amdgpu_vcn_fwlog {
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> index e8c02ae10163..16ee73cfc3a8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
> @@ -169,6 +169,12 @@ static int vcn_v4_0_sw_init(void *handle)
>   		fw_shared->smu_dpm_interface.smu_interface_type = (adev->flags & AMD_IS_APU) ?
>   			AMDGPU_VCN_SMU_DPM_INTERFACE_APU : AMDGPU_VCN_SMU_DPM_INTERFACE_DGPU;
>   
> +		if (adev->ip_versions[VCN_HWIP][0] == IP_VERSION(4, 0, 2)) {
> +			fw_shared->present_flag_0 |= AMDGPU_FW_SHARED_FLAG_0_DRM_KEY_INJECT;
> +			fw_shared->drm_key_wa.method =
> +				AMDGPU_DRM_KEY_INJECT_WORKAROUND_VCNFW_ASD_HANDSHAKING;
> +		}
> +
>   		if (amdgpu_sriov_vf(adev))
>   			fw_shared->present_flag_0 |= cpu_to_le32(AMDGPU_VCN_VF_RB_SETUP_FLAG);
>   
