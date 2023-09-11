Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADF879A827
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 15:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D2110E2F2;
	Mon, 11 Sep 2023 13:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0155210E2F0;
 Mon, 11 Sep 2023 13:09:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0+LvL/ur1UN9j8ZbDmX4SPs6u6FOYoTcBZ7aT94EAWogNmRjYuEk70xscxrXXadGgrliqFARJyn4rlgjSbYDGIvgEqBoyoqR2S79z0B/G09BBq410e+gLHZbezpWcAj2ZTFN/ZmAjtytMQlGS0ip0wbuSxH6ud9UfoBUGzkfOuYaqo4ueVuTFpSDNWz22+42Ce4ZckMTBD/myXgGidSMisMX/YZ67FQFomu3tfdWQJJ+Pj0y5HQL5UBo8k2UtHtgfestKdMJ4TV5IFiT0smA16ukDDNFUu+WUTWOXyuWlbyEAMURhB+aV4lKqJlpdl0q1i+6gLbVHmqV+5RQms5Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMCabexB434PuRwooTe2LtOM9WbB4vZoNo5aozCkbmU=;
 b=fQYAO13mR9leEH7ljT58A2V/W/47yL3cqIKPOq02N0eFzN/9ay5L6Gvyl85n2tPpPqee6wvddPU5Cf+MjWG8+54Kga2FLd/BpjVL4LdMdZfZqBmFObfevbeX01R/3gFvhImH7gOTmchb0C3hSwthG1eh3bcMKR+FbPgRin4oQgu/oFimV3Xs6R+YGsty9RX74EKY/5f7OzOwlPb+dSF1haavzXusltE6j/AbG/rkCBSLfEiFPnZ8+r9VzigvkT2I7+LwWJhuXX0i8YZv+JE7v5kKpxO5n6uPy3GZ51PmVCM/JA9ACq48z/AQzgHyl+WB5AnjcOKjyC3U1Y4UFSBQQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMCabexB434PuRwooTe2LtOM9WbB4vZoNo5aozCkbmU=;
 b=J77m754ZGNFbKm2DLpfIALGvtqXs4OrZo/JJ8HF22am6EF5h35Ii1mNAk21T7jhz3tCGHxWF4GBDBcJiHvry2xuqY2fkZoThpiD7z4+vhfKllJliJ/l/RqHkFNhyEZ/vghTtGPdLyQzi+1L+OS022nlsQ/aI4avFbMybocPp+F4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4269.namprd12.prod.outlook.com (2603:10b6:208:1d4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 13:09:35 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 13:09:35 +0000
Message-ID: <211f3f89-edd8-b2b3-5f51-93066e60ebd6@amd.com>
Date: Mon, 11 Sep 2023 15:09:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH drm-misc-next v3 2/7] drm/gpuvm: allow building as module
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, faith.ekstrand@collabora.com
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-3-dakr@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230909153125.30032-3-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR02CA0047.eurprd02.prod.outlook.com
 (2603:10a6:802:14::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b9ee42a-e8fb-462b-943a-08dbb2c858c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IToq6q/5ByhWxSLLftYM19p8uLUHjTGcrG4eT93S9TAdS6Svuc47Pwd7Zhl7qMyrBDJDZa2Q7NG4T/4/+tmyCvuM2b6RgYiHbKxcd2N1gK9CXxV1JpGTs8BpJFDcFZm2O0YLIazIuVDbyp2tB4Ant7EsOpMu6JlxZYDRhKbbQYxDuWJNTuyBHImgegr0ZOU3FkLvglEhexgIsWCliqbp/D2Y2DuP/0lkd1SK9PFMIfECKGIzU+2h8SLODYVNInbQvCOhEloEUCR/qHHmg7GQLivtcGn7s+9ENfb53VCo0VY8jpb4YVx44MAcVj7xUPJnY8qxYLA2wOehbuQrl8rMP0zW4azofiwsQZJJxy3k/kIbl/sHEFcrzTwAuex+XLZAk8TbA0AiQHvXlRxn70KZ7sryDYGugNHVxB7nDxj/7zX13vNDrjv5jQ7OiRmO2GnvM4pw/XK0g+1qeM9KO4wT/YxEw3c0xOAPzzWcZ4GKhMXWfnvnU2z7f8dpzvZ6MwB62+y1pTl39BZ9/BliP+uz6GMlQ/niIFPtETGbOx/hAoDGfY70w9kM9SEu4Wdear7ejHAOLo8f1gWIN5u9Q1CX2ubUgZVYtk2DbDstzeVxYA2QUNhH4nmt9iIZHnrfv3L41x14sInhzJEboA6hcpOBtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(376002)(366004)(39860400002)(186009)(1800799009)(451199024)(6486002)(6506007)(6666004)(6512007)(478600001)(83380400001)(66574015)(26005)(2616005)(7416002)(66476007)(66556008)(66946007)(4326008)(316002)(2906002)(41300700001)(5660300002)(8936002)(8676002)(86362001)(31696002)(36756003)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3ZETVU1Rjdaa211eFJWZUJCK05tenp5T0xONW1UeXRQbTUyUGRsZGZGekk1?=
 =?utf-8?B?ZmdnMlN5citHZm1ncGZkaWhzMGREMVNBSm5PRUNUU0pWVjYwdVhsc01NSFB0?=
 =?utf-8?B?T0h1cmdMVU4vbFBybWFkV2xCbHlDd1RZNmZNYzdtU2xOYjFvU2JyMGtETlhr?=
 =?utf-8?B?RHYycVBOMkd2VmxSck5OQmhSbDJDazV5OFk5NjBUOVNvK2NmOW1lTEw2bkxy?=
 =?utf-8?B?S3VDKzYvT1hyVGEyODRRTVVkUGt4bHhVR3ZtVEx3NDU1RlpiS0Flb29NNklh?=
 =?utf-8?B?aEhPRlFWNDdQdHQyWHZwd1RBbVhKR3RUTmZQRTBDYlpCZHE2R2JBYm9TL2JZ?=
 =?utf-8?B?RmJIQWNoOUtKUFI3c1pveC9LQWVKYWh4Nnk1NlpXY2pVKzRjOUlwaU95ZkRk?=
 =?utf-8?B?U2NRT1Nwc3hKbi81Wm5UN2RkNmd5L0dNVFZqa2dXQm5HM0Z4ZmQ5cXBsT21v?=
 =?utf-8?B?dVc5Ukg1SVZqdG9QT3pUaWVZN2VyOGRwdmZwQUJUYlNqVTZqYWZXa3E0SWZG?=
 =?utf-8?B?bys3T3gvQmdTSDJ5ZmVRZEJaak9oV3FaVitKaVhiclRobkt6Zy9qaU1GQ3pv?=
 =?utf-8?B?VmpKR1dGWXZnRUQ4Wm5OR2IzOE1ZRjFyWUtyemdQdkhqc1lSNlJ4eVNrUXNh?=
 =?utf-8?B?eHByZjI1Mmd1TU5FdHVUbkNBdzNwc2VlM3Q1TzNVRHEvMXZyUWt1UGwzRnQr?=
 =?utf-8?B?b2VzYkVQT3hGYTNGRkkxMUdCSXNoVHZOTHpkeGRkUUFrTkdlbUFkRHVZTkZE?=
 =?utf-8?B?dU5GTlJXaU42cCs0c3ZvU3NxcnZkUkNzQytldTFBS3JCMldPWk1EYU9VY1Az?=
 =?utf-8?B?dksza2Y4bVgxRDdmZEFQVmZNSnF6L1Y0ZUlacGFqV2tlZ0RZMVpaUmF6YUxI?=
 =?utf-8?B?Kzd2aVdCMWZlMjJ6UjdLMXo1RHQ5TW1MVlRVYWJyNVJNelNxRXNEZ05HajdL?=
 =?utf-8?B?c2d0cVgxWnhGRnpUZGIvWmpJNzVCUFRWM3pSUzBRNGIrdmxiQ0NOMkhIOHBX?=
 =?utf-8?B?WU5lbkxnT0hLT0R6RHRVZXpaYUNZZ3NqZXpQdyt6RVh5eVp5MTJnekptNTZq?=
 =?utf-8?B?Q0RaZ1ZrUjVSRjYwMEFIeGMrK1AzRjRxTVFZK0lPdERlTkNiTVRHMUZJdUc0?=
 =?utf-8?B?YzVKMER1U1NTUWZ4NWR2NG8wZHBtUjQwVXlFQjFvUUMwZEtaQTBIWmVvaFpt?=
 =?utf-8?B?K1B6QXM0d1F6QjZqaThsaktxZ0FIbGNOT3pQVHlWc3lyckthWXo3RFEzMXY4?=
 =?utf-8?B?bXVTSlorL0J6RGdYc01QQlJSeDRNVFRtK21OUmNaOE5HVkY2NzI3TVRsRis2?=
 =?utf-8?B?TzUyVVJ1UjcwNWYxUFBUYnoyYldmbE9RRGlqUnU1SXg1UUxEcjVwVlBtQUNT?=
 =?utf-8?B?dnFwQVNOU2t3Z3JkMDJzdGw5YTN2c1JVclI2d3U5dFFUdlhXK2pwek1Rc05U?=
 =?utf-8?B?TFFjVU1lcFdxbk55Qms3M2pqRlcyeGQ1d1pWMHZMdE91V1BVZ2dGa25yb3B6?=
 =?utf-8?B?Ry9sVnZ5eUE5UDlRWmk0UStPaC9Qc3dQOHFyRnovRkR5ekRIWXo1MGRzVStD?=
 =?utf-8?B?ZkYxTkdxZkhGbnBJc0tNSnY4TkFWM1lLSDNtelRCRVBGbHE4MWpDTU8zU05P?=
 =?utf-8?B?Vk9yUmRVQk82bjU4NlMyM25teS9VeXBTdldaOW1FMlp3NUE1RG1QN1FJVElJ?=
 =?utf-8?B?LzBCYXNTb1d4Y1ZQbkNwUHRqdkRrNnQvanVvbWR5OGF3R3NSTjMxMkhrRlRC?=
 =?utf-8?B?eUM2UXhESHN1Ujh3SGhFY1ZaU3JTNG5NOUhlV0s4R3hJcFN3RW9BbElUZEcw?=
 =?utf-8?B?cE9FNkhoSnVHMWliZTJ5V09LcTh2cU1pZ2dtd05sSDdHdExQKzVRMDdncGh5?=
 =?utf-8?B?ODYveEJjdmdxMlpYdGZBTnZpMTlDNHUrcGlJQlRnbDQ4eHVYSHc1T0h6ZVJZ?=
 =?utf-8?B?V25pSjc2TzhhNDlEM2tQRXpFMTFkSEJqdVJkQmVoMWlNT0wyRFZxZ0NHd1Jh?=
 =?utf-8?B?cUR5Y0ZobnVxREIzN21nVkI1STFWT1hXellIaXBxVVJLbjAzSi9GdUxCbzYw?=
 =?utf-8?B?L1BoYWdNd3RVbXYyaFgxZ1NYblNBam5GZ1BteWdsLzZmVEk1Y3hId0RiKzRD?=
 =?utf-8?Q?3nGmeoQzMM+L0aMll5JS6wiwf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9ee42a-e8fb-462b-943a-08dbb2c858c9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 13:09:35.7738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKBWs7KZ80LiMabBY+qwo8TKdTmEgjsBz+Q+s2Lkph9mHJevyfhySesTTtbFCOEW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4269
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.09.23 um 17:31 schrieb Danilo Krummrich:
> Currently, the DRM GPUVM does not have any core dependencies preventing
> a module build.
>
> Also, new features from subsequent patches require helpers (namely
> drm_exec) which can be built as module.
>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Reviewed-by: Christian König <christian.koenig@amd.com> for this one here.

I hope that I can get somebody to work on the remaining patches with the 
end goal of using this in amdgpu as well.

Regards,
Christian.

> ---
>   drivers/gpu/drm/Kconfig         | 7 +++++++
>   drivers/gpu/drm/Makefile        | 2 +-
>   drivers/gpu/drm/drm_gpuvm.c     | 3 +++
>   drivers/gpu/drm/nouveau/Kconfig | 1 +
>   4 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index ab9ef1c20349..0f78a03e4e84 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -216,6 +216,13 @@ config DRM_EXEC
>   	help
>   	  Execution context for command submissions
>   
> +config DRM_GPUVM
> +	tristate
> +	depends on DRM && DRM_EXEC
> +	help
> +	  GPU-VM representation providing helpers to manage a GPUs virtual
> +	  address space
> +
>   config DRM_BUDDY
>   	tristate
>   	depends on DRM
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 7a84b3cddeab..8e1bde059170 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -45,7 +45,6 @@ drm-y := \
>   	drm_vblank.o \
>   	drm_vblank_work.o \
>   	drm_vma_manager.o \
> -	drm_gpuvm.o \
>   	drm_writeback.o
>   drm-$(CONFIG_DRM_LEGACY) += \
>   	drm_agpsupport.o \
> @@ -81,6 +80,7 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
>   #
>   #
>   obj-$(CONFIG_DRM_EXEC) += drm_exec.o
> +obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
>   
>   obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
>   
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index de1a69bc4a44..aae086deaa2b 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -1723,3 +1723,6 @@ drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
>   	kfree(ops);
>   }
>   EXPORT_SYMBOL_GPL(drm_gpuva_ops_free);
> +
> +MODULE_DESCRIPTION("DRM GPUVM");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
> index c52e8096cca4..1e6aaf95ff7c 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -11,6 +11,7 @@ config DRM_NOUVEAU
>   	select DRM_TTM
>   	select DRM_TTM_HELPER
>   	select DRM_EXEC
> +	select DRM_GPUVM
>   	select DRM_SCHED
>   	select I2C
>   	select I2C_ALGOBIT

