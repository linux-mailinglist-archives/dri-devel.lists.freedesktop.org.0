Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20062716EA1
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 22:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0156010E427;
	Tue, 30 May 2023 20:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249AE10E426;
 Tue, 30 May 2023 20:26:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meVijEJjfj8PYQ6iEAZ7uLw52XtVcD7SIWOuMzXqJb87nvbqb5OM9ykXaDPVI0U3zmeqHwmbh0rwce83fLvGicfqiS+BPoQJIQvl9Ei4XB5oVixEswZy1yicr+0h6J5hWZw4p17XDmmRAJMjzmDiW4i1oVTlRZA0IW0Y0x/8KvECABdDHhaMZMk+gHX72W+DRM7Z/y0ss9ZTnIZoj4UGgrl6M/co0aKnMumEXOu7uOusibWEJY+6T8FwO8fUtvg7VaPqiJokwZHtG1BZt1Mpm/KZn/SFoeROrUbC+HT2lESfjR3/u1pFjaKV/tdUwgBtTsAOLcrIOvMZG4hVFmYlRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5JU0mQc75pKy0xMczLuhjkn1ozhDT3wqgzEZTcAINU=;
 b=fj/DBbp1hBtdTZ9Ec8M7i6LQLZXOpmOmhZo2ZuHQD4TkU2ySQCZZlyCft4THbp0A3fK2dnnsTTZrelgpQK32ulNZxR25mea9uNEUWkpHLBFju0473MZY8XYU+4HKNFnxaZt/KGfs9OjN/Qnj2dyasTOU4/hN0pnl4sSNd/tIWNmShel0b04Vh6xjZMSyTB3R9Eqrzu5f3sHyQaZsIIAPYhtA1X3l66txwY8MI9XHEvlvYrCcYoSIWxkUQi1ba7r4xBs0GwnVjddeUdbbXxo+LntKgscJxFPEGNtppMQpNh9yAgO5PDXxbwJHw1H5ZjiZTH4hoNSuyoMFE9G6kw5gXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5JU0mQc75pKy0xMczLuhjkn1ozhDT3wqgzEZTcAINU=;
 b=3RhyNP1jTLfgm7jCRCwAjRrOgFQfJSlFnzuF+o6ymBT9g079r9eKkMM4Y07CnXdukQbGEjqRqXQH87t12EZEYlxd2HyGJIchtPc9fCFe5CDKJ2JHLJNXMKTDmz/P6+SIPdMYho+HXYGtfEu8KUQ94H976wAItn0difOGRsRpSSw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB6184.namprd12.prod.outlook.com (2603:10b6:8:a6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.22; Tue, 30 May 2023 20:26:42 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 20:26:42 +0000
Message-ID: <2a0d1fdc-3a53-1187-0e36-2f68b57ea883@amd.com>
Date: Tue, 30 May 2023 16:26:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 27/33] drm/amdkfd: add debug set and clear address watch
 points operation
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230525172745.702700-1-jonathan.kim@amd.com>
 <20230525172745.702700-27-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230525172745.702700-27-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::35) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM4PR12MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b435c4b-3145-45ab-ce45-08db614c2e3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jJZhWe2TUDYmeKu4zb6RQZimd8LV9NIwLPXdtQWALft605zFBLoUT+MI+gP+A2ZNeCBCjNIY1BTuPiWHk/vM0nH8J0fft/N351OCpGfboRPev2NQyxv+RfEoZ0GlBBoz0v+CsBEYF2Od7//wMjbXeq6+9Hhng8VoiPX5xppZgaZ8RnXBsHaEqevtjhf7xVgnd10tTJUT/M14syJ3+0dQihHZOeKPIMoTYE+tel/iKzVmtbmp3jOqK0+7jEK75IiYBG6Y0Punf5XlygB+zVPJZUm9dythEW8qvfBk/VlFDMfl3sTV24ptH9h5/LSMkH+w2cLJVVVYVxP1GXkzcjfJbf7eT+Iwkn1pJlU+m/1HPaFc77nFkvVHrXqokm2yeL+wbAQ+qVys4FWMzoxq4UaDG6gHPpjR8LjcBK4zD2HCmjNJgWghwq/y6DKLITYpTPmG9cB3dC8ocsKl6uYAXjMGkZCuw5szQRIv1I89VeFzsUh62aBEXxm+tLUZ4CmrveN3seq89TWvFjxFVgvf901Ll0njoUlyS7e6EjKTtalcEWdzSK6WlmTCjOmNJhnNdo8jZiq0qQLA4cjC6IqLVJfoMEgLIFCU7DmUnZoxdm5fHglfV+S3dMPMQjlo30Yos09cAWmn9dph6N5aZGuq5LTv+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199021)(478600001)(83380400001)(5660300002)(186003)(30864003)(4326008)(86362001)(6486002)(8676002)(2906002)(8936002)(316002)(41300700001)(31686004)(38100700002)(31696002)(6512007)(6506007)(26005)(44832011)(66946007)(450100002)(2616005)(66476007)(66556008)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T05wVVdGcUZzYXo0RHdJanhZbTVPVld6blkxWDdKQnh6VG5peTFRTk1sN01H?=
 =?utf-8?B?V2U5MUlhZHBFY2tNYzl5SHl5NTJsQ2V6aXpvN25ZTldPR25pa0YySGlqUHJr?=
 =?utf-8?B?cjd0NU9LRE9GVktWVFpaUTFFRSs0bjhqSldkenU1a2IyN0wwQkZ4UTVCMWVj?=
 =?utf-8?B?NU5Idm5IUXZYcmxwN2tXejljaDU5aFBtWDJrTWZQSm9tVktFc0Q4Vy93R1JD?=
 =?utf-8?B?K3o2M2NiTkswK2Jhd1J6d0pMcDE5elk3eG5Rb2c2MnY1K0dZUWQyemZEWXhP?=
 =?utf-8?B?aUxKMSs5WGpLTVpVSUFQZ1duTHd6RlgzMmZuYVJYOXlNYkR4TFNOQUlpRVJt?=
 =?utf-8?B?cm1aRURKZ3NpVjZyeUJRWlhTN3hOODlTajZzVURVNUszTytHUTB1OGx0Njdm?=
 =?utf-8?B?eVprMjlsR0g2Lzl2eGlTa2xYbFk0KzRwZzJPOUdmaXU0VW1TZUZpY1dwRVhM?=
 =?utf-8?B?YW9MZSt4aFJjRFczK0JWYVlnNUZmN3N6alNOekg1RlVzRkJCVlY1bVVtTUFy?=
 =?utf-8?B?eitkMkZDQjVzeFFNZkV6OVp4K0luN1lMQVVMejBPSlFld1RQeHFwTXFTcUZy?=
 =?utf-8?B?MXRranZsK3ZVNzc4S25XK0VZaWZ0SmI0UzN0SXUxN3M0SFFMQzgzZkoxeDBF?=
 =?utf-8?B?UzBiWGR4RG4yTStBeHVXdkRWOWlBdlFnV3p1VmE2VUZyeFVKUVJNdUk0K2Fv?=
 =?utf-8?B?QklVaUpjcncwK0ZhY2JYK0RscDN3bkNKME5rb0Myb0lSUWNPU3pGUTFRcjRP?=
 =?utf-8?B?QnNlKzZUNTNmNEtlYmRKbWlTRGluNkdjU0phdk5ZdU9RNXNEOFYxMHZ1VmZB?=
 =?utf-8?B?aXlKcTFSMGpCS0JPbjlPM0xxRVJFaVhEMmVYb2dabVBzMllOUzRvSHlQNXZI?=
 =?utf-8?B?cnJFMEErODdrMkdtUlBUdU9wNk9JaS81MHRKYjZsN2l3RDFMVnBDcE5UOXZR?=
 =?utf-8?B?dnFlUkpPQ21UMTdUeXIvdkZ5WEg3anlRM2ROU3RRcGswRVVKOGU3R0kycHpD?=
 =?utf-8?B?NXFrWDhyMzFCMjZjQnFZUTlNcVA2TnJDZWVhRnlHYWRua3grS2dZejZKQVhZ?=
 =?utf-8?B?S1duaWlESUxpT2tQWVhCczNrUks0TTVPMTI3T1E4eUpzWUtSL20wK3VSMURM?=
 =?utf-8?B?Uk5CenpGLzhaLzRGWW02clRRTkpCam9zV0l0aHB1RFNyOXJQVXFuU2NGRjBh?=
 =?utf-8?B?K3I1NXkyclFjZWZFMFE2ZUNUL3c2a3lZbGVuVlRVekNqV0pmVDZTQlBPK2F3?=
 =?utf-8?B?VFpMRmtITEtTbW5YVlFoYjBqVW9PR1lDblVxcDhNVmp1UFBOaEs5K1pwazQw?=
 =?utf-8?B?K2l1Nml6cFhtSEtzV1Bya1NmblNOb2tZdW9uU1h5ZzA2VVdyTm1SZ2FuY2tx?=
 =?utf-8?B?NzFaWDhocVhhN0FDUDN2MDQ2WkdaNFRNRG5FUU5kS1luNW40TGw3VytRRkN4?=
 =?utf-8?B?OE81VTg2aHowUWs0NHVsUzdrdGZ6RStrR1p4V1VuZ2U3Q1o5TU1MZ3FzSnNz?=
 =?utf-8?B?NnA4S043ak5oWTlsV0Q3ZitiSHBjL3VCRWZsb0lhYlBndG5CRlJrT1RVS0xH?=
 =?utf-8?B?UFZzR1A4Wk5JaDlXdVV6S0NScC9kSG1MQWJQaFVGOEgxcExQUU1BNHE0RndW?=
 =?utf-8?B?Y1hGYVNDOFMvVm1kaVVUaWpSOUdRVEtaUHZ0KzA1UHFiS3V5SGRSMUhMbE9L?=
 =?utf-8?B?cmVIdURFNFJxUG1oZEIxb1NCSEJlU1F0VzBlMG5wWkR4TkF1eGlzbkJiRUJD?=
 =?utf-8?B?eXp6Qm9JWGhYQ21lcHVJV0lZWjRvc0pwNGwxQ3NReHNwZi83VG03UW1meVZV?=
 =?utf-8?B?dHltMkh5cjljUTRlNHozSk5qTUVicFJNcHF2Rm1zWUpYK0xuYUtpVkFNaVp5?=
 =?utf-8?B?enV5aEduU0ljVmhjR05XRnZhWmZwYjBmekMxQmtMaWZuY09rcCtvbUl4Yzdr?=
 =?utf-8?B?Vm9WYjRYaVY2YUxFUWRwcnBIc09sU3FNajJpdWh4OFkweHJ4QnhQMGhidEVZ?=
 =?utf-8?B?WjJvMEpHSys1KzVxVzM1NXBnSk9jaC9mWHBwTGtESG1pSHhUOXpCNnVJVWpn?=
 =?utf-8?B?V0ZFMGh6VmQxdEFjQW44a0VJL0NmNytEZHpJd0N4N084RUk5a1VSMm1tMVRI?=
 =?utf-8?Q?NYShGFwsZ5+Jd+dXX3OCw1htW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b435c4b-3145-45ab-ce45-08db614c2e3f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 20:26:42.6102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJaKcuHZwPTZw8R26tqg64kyScQoz+/nFpt6dBTXtqPf9iKDJk76KpkWXN6ADYkpcUQIdirFFlkgBKMkMMZHwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6184
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
Cc: Jinhuieric.Huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2023-05-25 um 13:27 schrieb Jonathan Kim:
> Shader read, write and atomic memory operations can be alerted to the
> debugger as an address watch exception.
>
> Allow the debugger to pass in a watch point to a particular memory
> address per device.
>
> Note that there exists only 4 watch points per devices to date, so have
> the KFD keep track of what watch points are allocated or not.
>
> v2: fixup with new kfd_node struct reference for mes and watch point
> checks
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   .../drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c  |  51 +++++++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    |  78 ++++++++++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h    |   8 ++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  |   5 +-
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c    |  52 ++++++-
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c |  77 ++++++++++
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h |   8 ++
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  24 ++++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 136 ++++++++++++++++++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |   8 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_device.c       |   2 +
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   6 +-
>   13 files changed, 452 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> index 774ecfc3451a..efd6a72aab4e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> @@ -118,6 +118,55 @@ static uint32_t kgd_aldebaran_set_wave_launch_mode(struct amdgpu_device *adev,
>   	return data;
>   }
>   
> +#define TCP_WATCH_STRIDE (regTCP_WATCH1_ADDR_H - regTCP_WATCH0_ADDR_H)
> +static uint32_t kgd_gfx_aldebaran_set_address_watch(
> +					struct amdgpu_device *adev,
> +					uint64_t watch_address,
> +					uint32_t watch_address_mask,
> +					uint32_t watch_id,
> +					uint32_t watch_mode,
> +					uint32_t debug_vmid)
> +{
> +	uint32_t watch_address_high;
> +	uint32_t watch_address_low;
> +	uint32_t watch_address_cntl;
> +
> +	watch_address_cntl = 0;
> +	watch_address_low = lower_32_bits(watch_address);
> +	watch_address_high = upper_32_bits(watch_address) & 0xffff;
> +
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			MODE,
> +			watch_mode);
> +
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			MASK,
> +			watch_address_mask >> 6);
> +
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			VALID,
> +			1);
> +
> +	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, regTCP_WATCH0_ADDR_H) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_high);
> +
> +	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, regTCP_WATCH0_ADDR_L) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_low);
> +
> +	return watch_address_cntl;
> +}
> +
> +uint32_t kgd_gfx_aldebaran_clear_address_watch(struct amdgpu_device *adev,
> +					uint32_t watch_id)
> +{
> +	return 0;
> +}
> +
>   const struct kfd2kgd_calls aldebaran_kfd2kgd = {
>   	.program_sh_mem_settings = kgd_gfx_v9_program_sh_mem_settings,
>   	.set_pasid_vmid_mapping = kgd_gfx_v9_set_pasid_vmid_mapping,
> @@ -141,6 +190,8 @@ const struct kfd2kgd_calls aldebaran_kfd2kgd = {
>   	.validate_trap_override_request = kgd_aldebaran_validate_trap_override_request,
>   	.set_wave_launch_trap_override = kgd_aldebaran_set_wave_launch_trap_override,
>   	.set_wave_launch_mode = kgd_aldebaran_set_wave_launch_mode,
> +	.set_address_watch = kgd_gfx_aldebaran_set_address_watch,
> +	.clear_address_watch = kgd_gfx_aldebaran_clear_address_watch,
>   	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
>   	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> index fbdc1b7b1e42..6df215aba4c4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> @@ -413,6 +413,8 @@ const struct kfd2kgd_calls arcturus_kfd2kgd = {
>   	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
>   	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
>   	.set_wave_launch_mode = kgd_gfx_v9_set_wave_launch_mode,
> +	.set_address_watch = kgd_gfx_v9_set_address_watch,
> +	.clear_address_watch = kgd_gfx_v9_clear_address_watch,
>   	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
>   	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> index a7a6edda557f..8ad7a7779e14 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> @@ -880,6 +880,82 @@ uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
>   	return 0;
>   }
>   
> +#define TCP_WATCH_STRIDE (mmTCP_WATCH1_ADDR_H - mmTCP_WATCH0_ADDR_H)
> +uint32_t kgd_gfx_v10_set_address_watch(struct amdgpu_device *adev,
> +					uint64_t watch_address,
> +					uint32_t watch_address_mask,
> +					uint32_t watch_id,
> +					uint32_t watch_mode,
> +					uint32_t debug_vmid)
> +{
> +	uint32_t watch_address_high;
> +	uint32_t watch_address_low;
> +	uint32_t watch_address_cntl;
> +
> +	watch_address_cntl = 0;
> +
> +	watch_address_low = lower_32_bits(watch_address);
> +	watch_address_high = upper_32_bits(watch_address) & 0xffff;
> +
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			VMID,
> +			debug_vmid);
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			MODE,
> +			watch_mode);
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			MASK,
> +			watch_address_mask >> 7);
> +
> +	/* Turning off this watch point until we set all the registers */
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			VALID,
> +			0);
> +
> +	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_cntl);
> +
> +	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_ADDR_H) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_high);
> +
> +	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_ADDR_L) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_low);
> +
> +	/* Enable the watch point */
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			VALID,
> +			1);
> +
> +	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_cntl);
> +
> +	return 0;
> +}
> +
> +uint32_t kgd_gfx_v10_clear_address_watch(struct amdgpu_device *adev,
> +					uint32_t watch_id)
> +{
> +	uint32_t watch_address_cntl;
> +
> +	watch_address_cntl = 0;
> +
> +	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_cntl);
> +
> +	return 0;
> +}
> +
> +
>   /* kgd_gfx_v10_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
>    * The values read are:
>    *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
> @@ -969,6 +1045,8 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
>   	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
>   	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
>   	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode,
> +	.set_address_watch = kgd_gfx_v10_set_address_watch,
> +	.clear_address_watch = kgd_gfx_v10_clear_address_watch,
>   	.get_iq_wait_times = kgd_gfx_v10_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v10_build_grace_period_packet_info,
>   	.program_trap_handler_settings = program_trap_handler_settings,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> index 3a6aca2b0eaa..e6b70196071a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> @@ -39,6 +39,14 @@ uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
>   uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
>   					 uint8_t wave_launch_mode,
>   					 uint32_t vmid);
> +uint32_t kgd_gfx_v10_set_address_watch(struct amdgpu_device *adev,
> +					uint64_t watch_address,
> +					uint32_t watch_address_mask,
> +					uint32_t watch_id,
> +					uint32_t watch_mode,
> +					uint32_t debug_vmid);
> +uint32_t kgd_gfx_v10_clear_address_watch(struct amdgpu_device *adev,
> +					uint32_t watch_id);
>   void kgd_gfx_v10_get_iq_wait_times(struct amdgpu_device *adev, uint32_t *wait_times);
>   void kgd_gfx_v10_build_grace_period_packet_info(struct amdgpu_device *adev,
>   					       uint32_t wait_times,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> index ed36b433a48b..8c8437a4383f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> @@ -678,6 +678,7 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
>   	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
>   	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
>   	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
> -	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode
> -
> +	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode,
> +	.set_address_watch = kgd_gfx_v10_set_address_watch,
> +	.clear_address_watch = kgd_gfx_v10_clear_address_watch
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> index 9711d5128d09..52efa690a3c2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> @@ -737,6 +737,54 @@ static uint32_t kgd_gfx_v11_set_wave_launch_mode(struct amdgpu_device *adev,
>   	return data;
>   }
>   
> +#define TCP_WATCH_STRIDE (regTCP_WATCH1_ADDR_H - regTCP_WATCH0_ADDR_H)
> +static uint32_t kgd_gfx_v11_set_address_watch(struct amdgpu_device *adev,
> +					uint64_t watch_address,
> +					uint32_t watch_address_mask,
> +					uint32_t watch_id,
> +					uint32_t watch_mode,
> +					uint32_t debug_vmid)
> +{
> +	uint32_t watch_address_high;
> +	uint32_t watch_address_low;
> +	uint32_t watch_address_cntl;
> +
> +	watch_address_cntl = 0;
> +	watch_address_low = lower_32_bits(watch_address);
> +	watch_address_high = upper_32_bits(watch_address) & 0xffff;
> +
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			MODE,
> +			watch_mode);
> +
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			MASK,
> +			watch_address_mask >> 7);
> +
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			VALID,
> +			1);
> +
> +	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, regTCP_WATCH0_ADDR_H) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_high);
> +
> +	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, regTCP_WATCH0_ADDR_L) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_low);
> +
> +	return watch_address_cntl;
> +}
> +
> +uint32_t kgd_gfx_v11_clear_address_watch(struct amdgpu_device *adev,
> +					uint32_t watch_id)
> +{
> +	return 0;
> +}
> +
>   const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
>   	.program_sh_mem_settings = program_sh_mem_settings_v11,
>   	.set_pasid_vmid_mapping = set_pasid_vmid_mapping_v11,
> @@ -757,5 +805,7 @@ const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
>   	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap,
>   	.validate_trap_override_request = kgd_gfx_v11_validate_trap_override_request,
>   	.set_wave_launch_trap_override = kgd_gfx_v11_set_wave_launch_trap_override,
> -	.set_wave_launch_mode = kgd_gfx_v11_set_wave_launch_mode
> +	.set_wave_launch_mode = kgd_gfx_v11_set_wave_launch_mode,
> +	.set_address_watch = kgd_gfx_v11_set_address_watch,
> +	.clear_address_watch = kgd_gfx_v11_clear_address_watch
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> index 060331652573..a56c895e1cd9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> @@ -816,6 +816,81 @@ uint32_t kgd_gfx_v9_set_wave_launch_mode(struct amdgpu_device *adev,
>   	return 0;
>   }
>   
> +#define TCP_WATCH_STRIDE (mmTCP_WATCH1_ADDR_H - mmTCP_WATCH0_ADDR_H)
> +uint32_t kgd_gfx_v9_set_address_watch(struct amdgpu_device *adev,
> +					uint64_t watch_address,
> +					uint32_t watch_address_mask,
> +					uint32_t watch_id,
> +					uint32_t watch_mode,
> +					uint32_t debug_vmid)
> +{
> +	uint32_t watch_address_high;
> +	uint32_t watch_address_low;
> +	uint32_t watch_address_cntl;
> +
> +	watch_address_cntl = 0;
> +
> +	watch_address_low = lower_32_bits(watch_address);
> +	watch_address_high = upper_32_bits(watch_address) & 0xffff;
> +
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			VMID,
> +			debug_vmid);
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			MODE,
> +			watch_mode);
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			MASK,
> +			watch_address_mask >> 6);
> +
> +	/* Turning off this watch point until we set all the registers */
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			VALID,
> +			0);
> +
> +	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_cntl);
> +
> +	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_ADDR_H) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_high);
> +
> +	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_ADDR_L) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_low);
> +
> +	/* Enable the watch point */
> +	watch_address_cntl = REG_SET_FIELD(watch_address_cntl,
> +			TCP_WATCH0_CNTL,
> +			VALID,
> +			1);
> +
> +	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_cntl);
> +
> +	return 0;
> +}
> +
> +uint32_t kgd_gfx_v9_clear_address_watch(struct amdgpu_device *adev,
> +					uint32_t watch_id)
> +{
> +	uint32_t watch_address_cntl;
> +
> +	watch_address_cntl = 0;
> +
> +	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
> +			(watch_id * TCP_WATCH_STRIDE)),
> +			watch_address_cntl);
> +
> +	return 0;
> +}
> +
>   /* kgd_gfx_v9_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
>    * The values read are:
>    *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
> @@ -1088,6 +1163,8 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
>   	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
>   	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
>   	.set_wave_launch_mode = kgd_gfx_v9_set_wave_launch_mode,
> +	.set_address_watch = kgd_gfx_v9_set_address_watch,
> +	.clear_address_watch = kgd_gfx_v9_clear_address_watch,
>   	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
>   	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> index 18f4970ac8e4..5f54bff0db49 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> @@ -84,6 +84,14 @@ uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
>   					     uint32_t trap_mask_request,
>   					     uint32_t *trap_mask_prev,
>   					     uint32_t kfd_dbg_trap_cntl_prev);
> +uint32_t kgd_gfx_v9_set_address_watch(struct amdgpu_device *adev,
> +					uint64_t watch_address,
> +					uint32_t watch_address_mask,
> +					uint32_t watch_id,
> +					uint32_t watch_mode,
> +					uint32_t debug_vmid);
> +uint32_t kgd_gfx_v9_clear_address_watch(struct amdgpu_device *adev,
> +					uint32_t watch_id);
>   void kgd_gfx_v9_get_iq_wait_times(struct amdgpu_device *adev, uint32_t *wait_times);
>   void kgd_gfx_v9_build_grace_period_packet_info(struct amdgpu_device *adev,
>   					       uint32_t wait_times,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index adda60273456..e88be582d44d 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2880,6 +2880,7 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   	struct mm_struct *mm = NULL;
>   	struct pid *pid = NULL;
>   	struct kfd_process *target = NULL;
> +	struct kfd_process_device *pdd = NULL;
>   	int r = 0;
>   
>   	if (sched_policy == KFD_SCHED_POLICY_NO_HWS) {
> @@ -2957,6 +2958,20 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   		goto unlock_out;
>   	}
>   
> +	if (args->op == KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH ||
> +	    args->op == KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH) {
> +		int user_gpu_id = kfd_process_get_user_gpu_id(target,
> +				args->op == KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH ?
> +					args->set_node_address_watch.gpu_id :
> +					args->clear_node_address_watch.gpu_id);
> +
> +		pdd = kfd_process_device_data_by_id(target, user_gpu_id);
> +		if (user_gpu_id == -EINVAL || !pdd) {
> +			r = -ENODEV;
> +			goto unlock_out;
> +		}
> +	}
> +
>   	switch (args->op) {
>   	case KFD_IOC_DBG_TRAP_ENABLE:
>   		if (target != p)
> @@ -3009,7 +3024,16 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   				(uint32_t *)args->resume_queues.queue_array_ptr);
>   		break;
>   	case KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH:
> +		r = kfd_dbg_trap_set_dev_address_watch(pdd,
> +				args->set_node_address_watch.address,
> +				args->set_node_address_watch.mask,
> +				&args->set_node_address_watch.id,
> +				args->set_node_address_watch.mode);
> +		break;
>   	case KFD_IOC_DBG_TRAP_CLEAR_NODE_ADDRESS_WATCH:
> +		r = kfd_dbg_trap_clear_dev_address_watch(pdd,
> +				args->clear_node_address_watch.id);
> +		break;
>   	case KFD_IOC_DBG_TRAP_SET_FLAGS:
>   	case KFD_IOC_DBG_TRAP_QUERY_DEBUG_EVENT:
>   	case KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO:
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index f4d3dfb35cb3..4b36cc8b5fb7 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -24,6 +24,8 @@
>   #include "kfd_device_queue_manager.h"
>   #include <linux/file.h>
>   
> +#define MAX_WATCH_ADDRESSES	4
> +
>   void debug_event_write_work_handler(struct work_struct *work)
>   {
>   	struct kfd_process *process;
> @@ -289,6 +291,139 @@ int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
>   						pdd->watch_points, flags);
>   }
>   
> +#define KFD_DEBUGGER_INVALID_WATCH_POINT_ID -1
> +static int kfd_dbg_get_dev_watch_id(struct kfd_process_device *pdd, int *watch_id)
> +{
> +	int i;
> +
> +	*watch_id = KFD_DEBUGGER_INVALID_WATCH_POINT_ID;
> +
> +	spin_lock(&pdd->dev->kfd->watch_points_lock);
> +
> +	for (i = 0; i < MAX_WATCH_ADDRESSES; i++) {
> +		/* device watchpoint in use so skip */
> +		if ((pdd->dev->kfd->alloc_watch_ids >> i) & 0x1)
> +			continue;
> +
> +		pdd->alloc_watch_ids |= 0x1 << i;
> +		pdd->dev->kfd->alloc_watch_ids |= 0x1 << i;
> +		*watch_id = i;
> +		spin_unlock(&pdd->dev->kfd->watch_points_lock);
> +		return 0;
> +	}
> +
> +	spin_unlock(&pdd->dev->kfd->watch_points_lock);
> +
> +	return -ENOMEM;
> +}
> +
> +static void kfd_dbg_clear_dev_watch_id(struct kfd_process_device *pdd, int watch_id)
> +{
> +	spin_lock(&pdd->dev->kfd->watch_points_lock);
> +
> +	/* process owns device watch point so safe to clear */
> +	if ((pdd->alloc_watch_ids >> watch_id) & 0x1) {
> +		pdd->alloc_watch_ids &= ~(0x1 << watch_id);
> +		pdd->dev->kfd->alloc_watch_ids &= ~(0x1 << watch_id);
> +	}
> +
> +	spin_unlock(&pdd->dev->kfd->watch_points_lock);
> +}
> +
> +static bool kfd_dbg_owns_dev_watch_id(struct kfd_process_device *pdd, int watch_id)
> +{
> +	bool owns_watch_id = false;
> +
> +	spin_lock(&pdd->dev->kfd->watch_points_lock);
> +	owns_watch_id = watch_id < MAX_WATCH_ADDRESSES &&
> +			((pdd->alloc_watch_ids >> watch_id) & 0x1);
> +
> +	spin_unlock(&pdd->dev->kfd->watch_points_lock);
> +
> +	return owns_watch_id;
> +}
> +
> +int kfd_dbg_trap_clear_dev_address_watch(struct kfd_process_device *pdd,
> +					uint32_t watch_id)
> +{
> +	int r;
> +
> +	if (!kfd_dbg_owns_dev_watch_id(pdd, watch_id))
> +		return -EINVAL;
> +
> +	if (!pdd->dev->kfd->shared_resources.enable_mes) {
> +		r = debug_lock_and_unmap(pdd->dev->dqm);
> +		if (r)
> +			return r;
> +	}
> +
> +	amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
> +	pdd->watch_points[watch_id] = pdd->dev->kfd2kgd->clear_address_watch(
> +							pdd->dev->adev,
> +							watch_id);
> +	amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
> +
> +	if (!pdd->dev->kfd->shared_resources.enable_mes)
> +		r = debug_map_and_unlock(pdd->dev->dqm);
> +	else
> +		r = kfd_dbg_set_mes_debug_mode(pdd);
> +
> +	kfd_dbg_clear_dev_watch_id(pdd, watch_id);
> +
> +	return r;
> +}
> +
> +int kfd_dbg_trap_set_dev_address_watch(struct kfd_process_device *pdd,
> +					uint64_t watch_address,
> +					uint32_t watch_address_mask,
> +					uint32_t *watch_id,
> +					uint32_t watch_mode)
> +{
> +	int r = kfd_dbg_get_dev_watch_id(pdd, watch_id);
> +
> +	if (r)
> +		return r;
> +
> +	if (!pdd->dev->kfd->shared_resources.enable_mes) {
> +		r = debug_lock_and_unmap(pdd->dev->dqm);
> +		if (r) {
> +			kfd_dbg_clear_dev_watch_id(pdd, *watch_id);
> +			return r;
> +		}
> +	}
> +
> +	amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
> +	pdd->watch_points[*watch_id] = pdd->dev->kfd2kgd->set_address_watch(
> +				pdd->dev->adev,
> +				watch_address,
> +				watch_address_mask,
> +				*watch_id,
> +				watch_mode,
> +				pdd->dev->vm_info.last_vmid_kfd);
> +	amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
> +
> +	if (!pdd->dev->kfd->shared_resources.enable_mes)
> +		r = debug_map_and_unlock(pdd->dev->dqm);
> +	else
> +		r = kfd_dbg_set_mes_debug_mode(pdd);
> +
> +	/* HWS is broken so no point in HW rollback but release the watchpoint anyways */
> +	if (r)
> +		kfd_dbg_clear_dev_watch_id(pdd, *watch_id);
> +
> +	return 0;
> +}
> +
> +static void kfd_dbg_clear_process_address_watch(struct kfd_process *target)
> +{
> +	int i, j;
> +
> +	for (i = 0; i < target->n_pdds; i++)
> +		for (j = 0; j < MAX_WATCH_ADDRESSES; j++)
> +			kfd_dbg_trap_clear_dev_address_watch(target->pdds[i], j);
> +}
> +
> +
>   /* kfd_dbg_trap_deactivate:
>    *	target: target process
>    *	unwind: If this is unwinding a failed kfd_dbg_trap_enable()
> @@ -303,6 +438,7 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
>   
>   	if (!unwind) {
>   		cancel_work_sync(&target->debug_event_workarea);
> +		kfd_dbg_clear_process_address_watch(target);
>   		kfd_dbg_trap_set_wave_launch_mode(target, 0);
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> index cb17869437c5..7f0757c2af2c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -50,7 +50,13 @@ int kfd_dbg_trap_set_wave_launch_override(struct kfd_process *target,
>   					uint32_t *trap_mask_supported);
>   int kfd_dbg_trap_set_wave_launch_mode(struct kfd_process *target,
>   					uint8_t wave_launch_mode);
> -
> +int kfd_dbg_trap_clear_dev_address_watch(struct kfd_process_device *pdd,
> +					uint32_t watch_id);
> +int kfd_dbg_trap_set_dev_address_watch(struct kfd_process_device *pdd,
> +					uint64_t watch_address,
> +					uint32_t watch_address_mask,
> +					uint32_t *watch_id,
> +					uint32_t watch_mode);
>   int kfd_dbg_send_exception_to_runtime(struct kfd_process *p,
>   					unsigned int dev_id,
>   					unsigned int queue_id,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> index 1eb57a4798f4..5b0f3be7d15f 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> @@ -802,6 +802,8 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
>   	if (kfd_resume_iommu(kfd))
>   		goto kfd_resume_iommu_error;
>   
> +	spin_lock_init(&kfd->watch_points_lock);
> +
>   	kfd->init_complete = true;
>   	dev_info(kfd_device, "added device %x:%x\n", kfd->adev->pdev->vendor,
>   		 kfd->adev->pdev->device);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index 05da43bf233a..8ec87bc8ba82 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -381,6 +381,10 @@ struct kfd_dev {
>   
>   	struct kfd_node *nodes[MAX_KFD_NODES];
>   	unsigned int num_nodes;
> +
> +	/* Track per device allocated watch points */
> +	uint32_t alloc_watch_ids;
> +	spinlock_t watch_points_lock;
>   };
>   
>   enum kfd_mempool {
> @@ -833,6 +837,7 @@ struct kfd_process_device {
>   	uint32_t spi_dbg_override;
>   	uint32_t spi_dbg_launch_mode;
>   	uint32_t watch_points[4];
> +	uint32_t alloc_watch_ids;
>   
>   	/*
>   	 * If this process has been checkpointed before, then the user
> @@ -989,7 +994,6 @@ struct kfd_process {
>   	struct semaphore runtime_enable_sema;
>   	bool is_runtime_retry;
>   	struct kfd_runtime_info runtime_info;
> -
>   };
>   
>   #define KFD_PROCESS_TABLE_SIZE 5 /* bits: 32 entries */
