Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C1C78E68D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 08:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54DE10E18B;
	Thu, 31 Aug 2023 06:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDBB10E18B;
 Thu, 31 Aug 2023 06:31:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAPAal8mCHwyWCH17FphX/7v7jVJgUb5WibwLo+C99t6ZmQPQokiskwxzQJykZO9nysOmg1k3rGczIubGo7I4VlSX3pLX4kIv3cSncALuXBXZJLUd+MWvfW5r6G03sMeIr3FXTlNDsDvvrMAtG7wWuwSlGs4+7iM4XDjH3A9mrG++EUgBwtDDoN2srrdmVmFsH/sQ91z3vYdlRNNNOsqsTlercf+DP4dB4bhpSZesOw1m0g1oLmUy4Hsp72vAR+mCMXuEBrp2sL0qnAnm5L5x5+E6A1Az//Xk3rDbC6evbx9WN9n8qMwTE19puouKpEybMEZYqdVsNBPtsWoSY+Z0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRnwTB6e4UprRvmIQK26IrUM9GbqgxJCLeh8dW4tBCU=;
 b=Lv59YG9F7GztKcEzDLusuhFiwC15gouqg6Bh7G61EtfKkp/t7B+r58NaFHpARW82B9g2uQvsfa/4pGEuZXMXL6SQEGeQzRE+mRGrOJnZSSJe+QEdkFHqkJgI63MAaN2TmEPnzZtDOQcxqNQKGXLmobFJjTenIugQG8Fz3jhx3gYVR9v1vnfMf/2+N8QYIxp9vwDMRzAAw/7ObQ3Tw3EysiDuhGjOdyuhEbyW2KlNV0+G59EJQc8iGRdb0QGNTYOQIdsXmNRAWnUpTucHjLvXYPEzUq09Q7uL0vvKRS21XZ01WL8BSuEWWYeesQvnsFuI4oOeNfDIFCbSyBG7GeDSvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRnwTB6e4UprRvmIQK26IrUM9GbqgxJCLeh8dW4tBCU=;
 b=vtaZDaJzLWVNcHXHHQKd8BJE/Q77dvAbajC5plHxEAMhJQgs9YC4rCjgaWbdYVnwaRQaExw6KgDxPJtbtzdaqI7yNIaKMfp9hrSlFrlGsvZjznPHa9zltX9ixK9Z7CRpWsWJa/n+37ksbEDwU1coiyhtyOrBbqPuQycs+6YMnYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB5408.namprd12.prod.outlook.com (2603:10b6:a03:305::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 06:31:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 06:31:23 +0000
Message-ID: <5b9f24d0-00b3-4581-826d-0bce8c9349ce@amd.com>
Date: Thu, 31 Aug 2023 08:31:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] drm/amdgpu: Create an option to disable soft
 recovery
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230830220808.421935-1-andrealmeid@igalia.com>
 <20230830220808.421935-3-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230830220808.421935-3-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0242.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB5408:EE_
X-MS-Office365-Filtering-Correlation-Id: 11e0b0c8-fe4c-4536-826e-08dba9ebe561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eX6niz1kds1VJHN8QL5wKa5omfgLlgVdFa1kggCsQICthdyHrY3J7cT7A3VpNFBe0fP/vHhSN0p/2VQE9o0mmF9lC9DF+HV/rH1vZl+s3q3iZUCUVb2uHPKoz0Dyauow92nXdnZkEPrL5VfN+De1nlSEfc8xZZifz/9bmn5Gj2t+Dqz2J5IE+2WjMlZ1ed8JB+J9im0ZqiMrluhjrshRf8YtgdOdxsHoWOzIv3txcjizMhVtJeSx5kySjqUc7f28tSRhrtbg4SPw6280p6TjhEtTQyxNx7RaGwKpnPG2NWcTpSvkq5yIMpi+HTqLgqJstFXsMYaENbE6owVRebEBdfDBVGkL5odhJkgJp+WQNG5F5QPoX+319GV5Hu4k2kKU6Irz5DuWNd1YmFd/buFeONYat8wy9bWrh/MUN6gzBehZzcqaUxihrWWyhtl6UeRinAXbi5fszBIaPEFc11x37xTkLSvF6+WvjbE3QWxAvjj6VqQVwCpsfdi69Ag+AGGdIMFRgWxrMz7Hgy52p42wPM8JQ2Rkd5W7KY/pTrEa6nohzRw9p76nooo3GW5KYF6x5SVRT4jE9s5aBI4RVK2qfkF6dvcNYZBeH9c4jhc7UmrUmXXOqj3XhcaQRuTgPjm8LkEcxUKRubtaOJoJLQw6dQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(186009)(451199024)(1800799009)(6512007)(6486002)(6506007)(6666004)(83380400001)(478600001)(2906002)(26005)(316002)(66476007)(4326008)(66574015)(66556008)(8676002)(41300700001)(66946007)(5660300002)(8936002)(86362001)(36756003)(31696002)(38100700002)(2616005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2hTZUNmU2tzZVc2eW5sL2YzN0trYUx1RjhVNmJOVVJQQjlXQ0RLZmZvalNP?=
 =?utf-8?B?VldlL0NXZVV5YnFzK21NNVZLMW5LWDNGV21ZNEEzZ3NUdkN3cDFEbUFVTHhB?=
 =?utf-8?B?b1ZDZ1kvUjN2S0gxd09BRkxYK0YrL0RFSTFQN1RJSnNTWTBsREFxcUM5SWM5?=
 =?utf-8?B?RGllaVE1blJLQWpBQ1k0cEpvRWUyTHpTZWVwR0VKeW0zNmNaYVRSM2dmWm45?=
 =?utf-8?B?OUVScXdSTTN4cG5EVkYvM2t6VUtrQ05OZDZRV0ZKZkl5RHJlVWoya0FjZHZ1?=
 =?utf-8?B?eHJSMncwRmJubW96TFJGYTlQemJGVEFFSU5ZWVpJNERaaVd6REQxdXNKaGdH?=
 =?utf-8?B?YUJXYWhlRVQwdmMySUVLcjJKcTVwR3lCRnhCOUpHMWgwbzlPVndnR2ZSSy8y?=
 =?utf-8?B?STY1dmF4L1dneHBBV3B4ejFEcXYrTEozWFVIZkFxR2hzMnBZTXdRMnowZXNj?=
 =?utf-8?B?Q0lwelJxVWROUTJ4SGp4TXRycmZyZ3ExSU11MWI0TzVWZkdRV1NwKy8weXF4?=
 =?utf-8?B?b3VjWGxEUHBtR1hWVGU0eWpBbGRMS2pmcE5hcDA4VTljUGtsMzJOUTIxNUls?=
 =?utf-8?B?dXd6KzNqaUxEenVZV1dWQUNpTU5rTGxVc3lLZ3pMdmJTVkIwOUtuUytPaWo5?=
 =?utf-8?B?R2dxRVRiZWJhUlpneEh0YUIrTE5yZkt2dnN3UXNqOG56dnJZSWFCZ0pzWTR3?=
 =?utf-8?B?aUZ6cGlmV202d0dKbUN4alBhVGxWS2JYVjB1aFdROXRRQVk0VnJGYXhrUGRC?=
 =?utf-8?B?R0RDTGVLMG1IdXFxdEFQcmRtS2loUTBvV1B0TVpERFBtdCtNR3pGRllpL1h6?=
 =?utf-8?B?ZWNVSlhzYzZhcWprckJadXlIU2FuTXYvM2t0RGVnZ0RvZ1Y0c3lBYnpLWkRh?=
 =?utf-8?B?WElYSUVOTnAyS1JYdkwwMzBQSWRQbWRFb3VZYmxMWW16YVJYTk5ocE4zVSto?=
 =?utf-8?B?YVp2c2JNMXZDUFgyK2dvNkY0V0Q5NTB4Q2dOc2lFYVkwUUh3QjBCOVdVN203?=
 =?utf-8?B?elZRMHRpSmlPUzRNUWFhdXUxTkdwQmg0OG95clNPK3ZEWk1HRmMrdTlERXdQ?=
 =?utf-8?B?dEJMa3lXdlNNSVNKWWxMUkMrN2lyMFovRVlVZXBhMjR0SFpFejlKQXBSa2pI?=
 =?utf-8?B?Zkp6Z2U0UEZ3RXM3S3J2VE1mRStPUXBJQkxFR1RjclovTlEyTWlWbUE2dHc3?=
 =?utf-8?B?SkdHK3lVVWF0QUtGWG42aXJEVjR2QmIvL2dQTE9Eb1BxdTZpSDAvRmRrelZC?=
 =?utf-8?B?bGk0b21GaVRiM1hKUUdORmRTeUZrTDJWVVBTaFZ1cDQrbFRyTHlrWmlUbWJm?=
 =?utf-8?B?cU9vVDg4SGlXMW9LZlNLMkpvWmE1MkVDM0d2OFNoclBsYlZyWG4zN1o3a1Jj?=
 =?utf-8?B?Sk5XcWRaYXJRNEIvRzBJZlVTR0UxUFROc2hWbFl2VUwwMXo1aUxRMDlCSmZu?=
 =?utf-8?B?UFVYN0QwOEVIQmpVRlNBZ05ZVEdncFpmdGVFT29pT3hVd2RNWUpQamxpNGpp?=
 =?utf-8?B?Qll2K1VCY2RvN0lxUHdKWW9TWFd2bUM4TktxWW1iSHlpejNvS2o0Wk1lazVW?=
 =?utf-8?B?cXlObzdnSnVkVmhvcFNvSkNCU1hzK054bm90V1B3c04xV213L0ZXT0dCbFhM?=
 =?utf-8?B?SmRXYzNvVnh4cEo1TkhoUGpBVXdkMnJSOXJENUt5bTlHcTNaWVRMZ1hNRTdQ?=
 =?utf-8?B?Z2VybXpIaDMvb09kNlp0cVYxTjdDTG5WMTRtbytQR3JHTm5SQmdvOEhhcDVF?=
 =?utf-8?B?a1RRbk85YytMRk9MUzR4LzBlcDVyQTVWZXNtU25YeVFoVmh1U0UxbW5YRU1l?=
 =?utf-8?B?WGFRYThpMm9SbHJHK2tzajR4TGg5NUo1Ulh6T2JIdkhqSnlYTHlRMDV3UVE5?=
 =?utf-8?B?dFBKc3Rsend5cXpjdGwrWXRMRE1LWFpId2dxbmtlMktKbGhqWTU4ems2WEpS?=
 =?utf-8?B?SmxoSTVkTnB0aktUSS9XTyt3QWdqdU5FYVJnN2twcWtLcE5sdno4UWVTcFNm?=
 =?utf-8?B?SmVIZkVQRy9GSjRDMkRXOXBXQTVJaTQvY1BsUytnenI5U2ZxdmZPT09xV2FQ?=
 =?utf-8?B?NWxWMFloSk1RSFdiaWJLMnRtQkYzbUszSGVjTXMwZVdMNXpqa210Z2ZXUGd0?=
 =?utf-8?Q?DsOsyPnw94UCYUxIp2kxhG/Xu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e0b0c8-fe4c-4536-826e-08dba9ebe561
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 06:31:23.6261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBfj/TZKme+f/+X4DdwkAA1KqWPmTM7nsyOvPT0JbyEs7dwqk5Rs3nxfogjdZa2t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5408
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
Cc: alexander.deucher@amd.com, pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>, kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.08.23 um 00:08 schrieb André Almeida:
> Create a module option to disable soft recoveries on amdgpu, making
> every recovery go through the device reset path. This option makes
> easier to force device resets for testing and debugging purposes.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h      | 1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  | 6 ++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 6 +++++-
>   drivers/gpu/drm/amd/include/amd_shared.h | 1 +
>   4 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 82eaccfce347..5f49e2c0ae7a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1105,6 +1105,7 @@ struct amdgpu_device {
>   	/* Debug */
>   	bool                            debug_vm;
>   	bool                            debug_largebar;
> +	bool                            debug_disable_soft_recovery;
>   };
>   
>   static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 0cd48c025433..59e9fe594b51 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -927,6 +927,7 @@ MODULE_PARM_DESC(enforce_isolation, "enforce process isolation between graphics
>    * - 0x2: Enable simulating large-bar capability on non-large bar system. This
>    *   limits the VRAM size reported to ROCm applications to the visible
>    *   size, usually 256MB.
> + * - 0x4: Disable GPU soft recovery

"Disable GPU soft recovery, always do a full reset."

Apart from that Reviewed-by: Christian König <christian.koenig@amd.com>.

Regards,
Christian.

>    */
>   MODULE_PARM_DESC(debug_mask, "debug options for amdgpu, disabled by default");
>   module_param_named(debug_mask, amdgpu_debug_mask, uint, 0444);
> @@ -2046,6 +2047,11 @@ static void amdgpu_init_debug_options(struct amdgpu_device *adev)
>   		pr_info("debug: enabled simulating large-bar capability on non-large bar system\n");
>   		adev->debug_largebar = true;
>   	}
> +
> +	if (amdgpu_debug_mask & AMDGPU_DEBUG_DISABLE_GPU_SOFT_RECOVERY) {
> +		pr_info("debug: soft reset for GPU recovery disabled\n");
> +		adev->debug_disable_soft_recovery = true;
> +	}
>   }
>   
>   static int amdgpu_pci_probe(struct pci_dev *pdev,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> index 80d6e132e409..6a80d3ec887e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> @@ -434,8 +434,12 @@ bool amdgpu_ring_soft_recovery(struct amdgpu_ring *ring, unsigned int vmid,
>   			       struct dma_fence *fence)
>   {
>   	unsigned long flags;
> +	ktime_t deadline;
>   
> -	ktime_t deadline = ktime_add_us(ktime_get(), 10000);
> +	if (unlikely(ring->adev->debug_disable_soft_recovery))
> +		return false;
> +
> +	deadline = ktime_add_us(ktime_get(), 10000);
>   
>   	if (amdgpu_sriov_vf(ring->adev) || !ring->funcs->soft_recovery || !fence)
>   		return false;
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
> index 2fd6af2183cc..32ee982be99e 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -263,6 +263,7 @@ enum amd_dpm_forced_level;
>   enum AMDGPU_DEBUG_MASK {
>   	AMDGPU_DEBUG_VM = BIT(0),
>   	AMDGPU_DEBUG_LARGEBAR = BIT(1),
> +	AMDGPU_DEBUG_DISABLE_GPU_SOFT_RECOVERY = BIT(2),
>   };
>   
>   /**

