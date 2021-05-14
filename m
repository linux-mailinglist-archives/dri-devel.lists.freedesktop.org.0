Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB39C380C09
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 16:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C0F6EE91;
	Fri, 14 May 2021 14:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DDE6EEA1;
 Fri, 14 May 2021 14:41:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxzYO3ZZTsGrKz14TP1hZbETjC+6TnJ83I4QHJZSVdrv5GBqZTgSG1fZ23nPByukPJgh7YywIVjtX7UwUPv50ZUzZT0U7HJyK5o6d2LHOBtM9VpMfwspD/k12BQWEy/8YnNEqMvp1SBqmFYL8ROxx3w21dfp3DqRJIoNxPlh48KaJssrYRJhTENznHMhBzREAQhf45kyXomhSXH1MirvG5Pu5c2FJd9kDpj/IufN9hksPoRlxgdhhf1SQolVnm+SsZyBfXU8W4+ylYqm71rtTKxaOyhuWxrRrplLvXCrCNLFpKLoCd9lK1myl6NEM0A3K1Wsgtz37PhkGwWkWRgCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EJ5R49PV/21baZg3nVYubt2o+alwUB2NSBAZ7P9VX4=;
 b=YbuEC7aBLxVmX5+r+k3CCq8nyLf3S9HQtSXfVBef8JBOAzU20LpRCbqEW19Gw7EKccitZTgg0JuOqeXgzNvmxk1YwguVUWLE3slALEmwTMEKa6wWfUCmtCndwUcKdP8ycPHOX3uzIkmroAXXs9krXVeW1xgnfuiHchFKe2V10ncj/eGR298+CERYM31iMhxWGBvWQTT/G1bd9NMmCe5cgCzTp/vDhWRDwHivarmRcayRQBke9dUDDwB+MTQRNElGGCsL2yMcXZubBngKuBVS/QsEVCcYytjDVcKl74rJuG2066xU11vuPYegLBgbVXhxIHsG3Yu0ukpWY6ZAD/U2ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EJ5R49PV/21baZg3nVYubt2o+alwUB2NSBAZ7P9VX4=;
 b=UUtjQF1G9xPW6LAS6rpw/6EbSI8/W8ZavQbr2FS1GZ1H0z2guzjBgdxkW8jCVQHSba0vD+A/yZpQ1Z/92qY5YaDMumtHipkV3YVfjyN2N2PpoUO2T4W9TT2yFUv+BUm8WxR4UKJ3E9TuF5D+5rlIYKrbXbutpMK5hQNr4Q4FxXg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2654.namprd12.prod.outlook.com (2603:10b6:805:73::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 14 May
 2021 14:41:27 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Fri, 14 May 2021
 14:41:27 +0000
Subject: Re: [PATCH v7 05/16] drm/amdgpu: Handle IOMMU enabled case.
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-6-andrey.grodzovsky@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <996a4ded-08da-7c27-5e79-6b408d8c43b0@amd.com>
Date: Fri, 14 May 2021 10:41:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210512142648.666476-6-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [207.107.137.243]
X-ClientProxiedBy: YQBPR0101CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::10) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.30.117.98] (207.107.137.243) by
 YQBPR0101CA0137.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Fri, 14 May 2021 14:41:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b3d89d7-4537-4a15-638d-08d916e65af0
X-MS-TrafficTypeDiagnostic: SN6PR12MB2654:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB265437C06F53281DF1E990FBEA509@SN6PR12MB2654.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: atmF+TJHhoQRvLIdsY6FJEtGyrE/3ao6CsCvp8zbzJrz873rcQI8yR5BNJtEwqiRCOpqpJVTiVKH1Tmpy67SneMmNr/gv3Uuc6JWePYbc24n4Qa6fj2pw6Mez3DNPoQV5qsETyBN9HAALZlH9t1nimsP6p+Q5adx0M/GZxCvh+gT1v9VTNbs22/58RYdg5ta96NDCENCpA9FcxksaiTz5Gw1UBXlf/43XnxFLyx7BvbcUbggixMgaDwkTAqde3ywRHQz0usnnrgLrbLcIZV5jh0fhW4cAlBeJdvJD/W0dZpQGtjdgjPoCn8BeRT1DhV8eoYrohJ1ibP7tUme3P79XHuKJjSWfslzpVc1dn6VPrifiB1tAlwiPp1WYYxqjTYocWRMlrHfTUqdfYa1KArr74DosFzLVE0bIE9krxc6PStlL38dDqDwLHyuMjwVQoxVbMHVovQTvnDHRv1dIC3Y7akUxA3agp4+prN3dXBVC58cNJojM46untfQQ6XlSVvpeDhNMBK2b5E7IQjDWAdiYq4WbH7rxq9pmhVL/UfWQPlXVt90KQZN7cdcIVmXQFrY5vk8zfObKqav00AJ/z4odik9d46UOwx2qM//rnN/fQeEe10fFZjJ7RJ1xrkmYBDF3wPAttU89NrI9PyZsig68xTiRvxi+dTQOiR0+63YbSEJZ7Ckuz+E7tpNfxcJgIm5yLaxlft4vm8sybATTH3c8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(31696002)(6486002)(5660300002)(86362001)(8936002)(316002)(8676002)(2906002)(38350700002)(26005)(38100700002)(83380400001)(30864003)(52116002)(36756003)(66556008)(4326008)(16576012)(44832011)(956004)(66946007)(53546011)(478600001)(66476007)(2616005)(186003)(6666004)(6636002)(16526019)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UDE5aVBLSGJheWUxRk9zNGZWTUtsUjZteUx4Wk9tMTlqQ014eWFNOElGaXIr?=
 =?utf-8?B?QnY5K0p1TEtYNE9iVTRaZWdBODRzWVExVDJDVjF5SnNwSWxqZWswTnkzU1Z4?=
 =?utf-8?B?TjNtU1VPeXYxMWJPUU5TOTZhU0R5V1B5YmhyYnpQN01zSlJXMjdDZnpCWUdF?=
 =?utf-8?B?WXlBc2d6RFBoMElVZDdCaFg5VUZlOVdGcHUybkx1MzdWUGVUZWNTOUhJQk9T?=
 =?utf-8?B?QzRnMC91TDlTeFRlc3NmNHFVbzFubEcyQlFaRmpDL0FLQVBpSnRTa01QWHhX?=
 =?utf-8?B?WHM2d3BpOUp3a3dlSUk4Q3htMjEzbk5tSEFRN3dVZG9uWFdjSEl0NG9wbElo?=
 =?utf-8?B?S3FSZ0Y3eFh4aUszeHFyQmpRanlOZTlHWU1aaDRQdXQwcVhOdXFFNWpBQ1Fv?=
 =?utf-8?B?ajRnemNKU05UakJFelFMUkNmQS9Yc3RoOUJETHJxdFZMSm9yVzBSa2QwUDgx?=
 =?utf-8?B?VVNrZllLNkt3em8wbm1lblNpU0Z4NTNURlB5RmhqTTFlUFBLclBUZDdFWU9X?=
 =?utf-8?B?bGcrdE8wTHNMamNMU2srOE9CT2VSWFQxVm5aRCtkWEl6SVhBdlgrd2dvM1BF?=
 =?utf-8?B?bXpiSjZ1cVYzMzloczBmSlhORytnVzZhRDBEK0FnVDJhSlo4Q0NYZjhOTHJF?=
 =?utf-8?B?UXN4dS91bXVPQ2RzZ2hZMFc4ODUvNkJBa2kyemVveTdvbCtvaytkWjlVNGdk?=
 =?utf-8?B?S0ZiVStDTzd2bVpGWG1pSmpBWEpBVDkzQlE5aTZOakdFelhacUhQbHpkLzI1?=
 =?utf-8?B?bWpZWTFUUi9ySTNndklMQlpBQkhlbU82SENjb0hEWXhWRUxBTTVUWFZtcjBS?=
 =?utf-8?B?YU5NbVRKUVNNNWU5WDRCVjY3UzM3cDB6MExYME8rL2hZQldZZjBJQ1ZScnIr?=
 =?utf-8?B?ZC9oWmN6RS9FUFdrZ1R4ZWZBZElUVkphcnBVOXpFREhsOGZkaFB0bGU4T05K?=
 =?utf-8?B?aVBDSEF6NFhkZWlZMm81cjlMTzRvSEtMUWgxdTlCajVEZmFzaDM1V2tTUHFH?=
 =?utf-8?B?MzBPMzZKaUtlVlN5L3VRdzhNNlo4SURzSjFPTVJqcWRnaXRDemVMOWRvY0dG?=
 =?utf-8?B?RGIyTHU3clBuVTROSGR5OWZlZW54bDZFcS80ancvWUpQUHJjQlNVeE9SeUI1?=
 =?utf-8?B?VnBPRXY2U1BWV1U3UThEQXFXRGdiVGdUWXd2OGduNEdWNXc3V2xzYkJiN0pT?=
 =?utf-8?B?a25jNlZHd2lXeUdmeEJycUdsV0xhSklFK0UvMHZvQnZaT29TTmVuVlRpREdx?=
 =?utf-8?B?NjExMmwyakxJbzdLN0JrejBiWXhCT2Z4SU9mVzNoZ3UyK1UvMG83M3ZFMXFk?=
 =?utf-8?B?R0hsUEE5ZDRuYnhFZ0FjVWp6Uk10L0FLenJRZFJTcVlMRHZNeHZTdWZDUjFZ?=
 =?utf-8?B?MVZQbWkwUGgrNkZyRFJJVFlJQTFDWjMza3FacGM3UGltNVNDQktYQVdyM1Zw?=
 =?utf-8?B?b2NNZ1NFRlBBclVMOElRTzJ0bkNWT2dpN3hSUmpSY1pHYWp1MGpHenl3MUFn?=
 =?utf-8?B?U2lIS3lxYkdtbUM2WXRyRS8vOGhHSU10S3E5WTNKZFl5TVA3by9HckdWM2dI?=
 =?utf-8?B?RWJvZXRiTTQ0OUdPdlppclBLQjROSmkyMlp4WDlQejJqZzRHbHlqTnJxVGh3?=
 =?utf-8?B?eFFkVkY5MkJjeGZ1ZURoZk1jcTQ5Z3llMGxuZXIwWWJOdU84K2h2T094N2ds?=
 =?utf-8?B?VEV5aGJsa3ZDVjBLZlNadU5RL2lERlVZeVBaM3UyZlc2RFBLelNGb3Zyd09i?=
 =?utf-8?Q?56IKTPZ+FohNd8T718qhRBvTApPMETinp5xZPXV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3d89d7-4537-4a15-638d-08d916e65af0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 14:41:27.6137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QnZea2BdciSWePCAW4hG6VfQz8nhoDKWhCFiwvR+7pBeTqEuzmsxX1OlfFbAgiyQ4JIf3jF4L9VKszUjXsLDog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2654
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping

Andrey

On 2021-05-12 10:26 a.m., Andrey Grodzovsky wrote:
> Handle all DMA IOMMU gropup related dependencies before the
> group is removed.
> 
> v5: Drop IOMMU notifier and switch to lockless call to ttm_tt_unpopulate
> v6: Drop the BO unamp list
> v7:
> Drop amdgpu_gart_fini
> In amdgpu_ih_ring_fini do uncinditional  check (!ih->ring)
> to avoid freeing uniniitalized rings.
> Call amdgpu_ih_ring_fini unconditionally.
> 
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c   | 14 +-------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h   |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c     |  6 ++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    |  5 +++++
>   drivers/gpu/drm/amd/amdgpu/cik_ih.c        |  1 -
>   drivers/gpu/drm/amd/amdgpu/cz_ih.c         |  1 -
>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c     |  1 -
>   drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c      |  1 -
>   drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c      |  1 -
>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c      |  1 -
>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c      |  1 -
>   drivers/gpu/drm/amd/amdgpu/iceland_ih.c    |  1 -
>   drivers/gpu/drm/amd/amdgpu/navi10_ih.c     |  4 ----
>   drivers/gpu/drm/amd/amdgpu/si_ih.c         |  1 -
>   drivers/gpu/drm/amd/amdgpu/tonga_ih.c      |  1 -
>   drivers/gpu/drm/amd/amdgpu/vega10_ih.c     |  4 ----
>   drivers/gpu/drm/amd/amdgpu/vega20_ih.c     |  4 ----
>   18 files changed, 13 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 18598eda18f6..a0bff4713672 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3256,7 +3256,6 @@ static const struct attribute *amdgpu_dev_attributes[] = {
>   	NULL
>   };
>   
> -
>   /**
>    * amdgpu_device_init - initialize the driver
>    *
> @@ -3698,12 +3697,13 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
>   		amdgpu_ucode_sysfs_fini(adev);
>   	sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
>   
> -
>   	amdgpu_fbdev_fini(adev);
>   
>   	amdgpu_irq_fini_hw(adev);
>   
>   	amdgpu_device_ip_fini_early(adev);
> +
> +	amdgpu_gart_dummy_page_fini(adev);
>   }
>   
>   void amdgpu_device_fini_sw(struct amdgpu_device *adev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> index c5a9a4fb10d2..6460cf723f0a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> @@ -92,7 +92,7 @@ static int amdgpu_gart_dummy_page_init(struct amdgpu_device *adev)
>    *
>    * Frees the dummy page used by the driver (all asics).
>    */
> -static void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
>   {
>   	if (!adev->dummy_page_addr)
>   		return;
> @@ -365,15 +365,3 @@ int amdgpu_gart_init(struct amdgpu_device *adev)
>   
>   	return 0;
>   }
> -
> -/**
> - * amdgpu_gart_fini - tear down the driver info for managing the gart
> - *
> - * @adev: amdgpu_device pointer
> - *
> - * Tear down the gart driver info and free the dummy page (all asics).
> - */
> -void amdgpu_gart_fini(struct amdgpu_device *adev)
> -{
> -	amdgpu_gart_dummy_page_fini(adev);
> -}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
> index a25fe97b0196..030b9d4c736a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
> @@ -57,7 +57,7 @@ void amdgpu_gart_table_vram_free(struct amdgpu_device *adev);
>   int amdgpu_gart_table_vram_pin(struct amdgpu_device *adev);
>   void amdgpu_gart_table_vram_unpin(struct amdgpu_device *adev);
>   int amdgpu_gart_init(struct amdgpu_device *adev);
> -void amdgpu_gart_fini(struct amdgpu_device *adev);
> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev);
>   int amdgpu_gart_unbind(struct amdgpu_device *adev, uint64_t offset,
>   		       int pages);
>   int amdgpu_gart_map(struct amdgpu_device *adev, uint64_t offset,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
> index faaa6aa2faaf..433469ace6f4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
> @@ -115,9 +115,11 @@ int amdgpu_ih_ring_init(struct amdgpu_device *adev, struct amdgpu_ih_ring *ih,
>    */
>   void amdgpu_ih_ring_fini(struct amdgpu_device *adev, struct amdgpu_ih_ring *ih)
>   {
> +
> +	if (!ih->ring)
> +		return;
> +
>   	if (ih->use_bus_addr) {
> -		if (!ih->ring)
> -			return;
>   
>   		/* add 8 bytes for the rptr/wptr shadows and
>   		 * add them to the end of the ring allocation.
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> index 233b64dab94b..32ce0e679dc7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> @@ -361,6 +361,11 @@ void amdgpu_irq_fini_hw(struct amdgpu_device *adev)
>   		if (!amdgpu_device_has_dc_support(adev))
>   			flush_work(&adev->hotplug_work);
>   	}
> +
> +	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
> +	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
> +	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
> +	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> index 183d44a6583c..df385ffc9768 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> @@ -310,7 +310,6 @@ static int cik_ih_sw_fini(void *handle)
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
>   	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>   	amdgpu_irq_remove_domain(adev);
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
> index d32743949003..b8c47e0cf37a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
> @@ -302,7 +302,6 @@ static int cz_ih_sw_fini(void *handle)
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
>   	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>   	amdgpu_irq_remove_domain(adev);
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> index 2bfd620576f2..5e8bfcdd422e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> @@ -954,7 +954,6 @@ static int gmc_v10_0_sw_init(void *handle)
>   static void gmc_v10_0_gart_fini(struct amdgpu_device *adev)
>   {
>   	amdgpu_gart_table_vram_free(adev);
> -	amdgpu_gart_fini(adev);
>   }
>   
>   static int gmc_v10_0_sw_fini(void *handle)
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> index 405d6ad09022..0e81e03e9b49 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> @@ -898,7 +898,6 @@ static int gmc_v6_0_sw_fini(void *handle)
>   	amdgpu_vm_manager_fini(adev);
>   	amdgpu_gart_table_vram_free(adev);
>   	amdgpu_bo_fini(adev);
> -	amdgpu_gart_fini(adev);
>   	release_firmware(adev->gmc.fw);
>   	adev->gmc.fw = NULL;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> index 210ada2289ec..0795ea736573 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> @@ -1085,7 +1085,6 @@ static int gmc_v7_0_sw_fini(void *handle)
>   	kfree(adev->gmc.vm_fault_info);
>   	amdgpu_gart_table_vram_free(adev);
>   	amdgpu_bo_fini(adev);
> -	amdgpu_gart_fini(adev);
>   	release_firmware(adev->gmc.fw);
>   	adev->gmc.fw = NULL;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> index c1bd190841f8..dbf2e5472069 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> @@ -1194,7 +1194,6 @@ static int gmc_v8_0_sw_fini(void *handle)
>   	kfree(adev->gmc.vm_fault_info);
>   	amdgpu_gart_table_vram_free(adev);
>   	amdgpu_bo_fini(adev);
> -	amdgpu_gart_fini(adev);
>   	release_firmware(adev->gmc.fw);
>   	adev->gmc.fw = NULL;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index c82d82da2c73..5ed0adae05cf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -1601,7 +1601,6 @@ static int gmc_v9_0_sw_fini(void *handle)
>   	amdgpu_gart_table_vram_free(adev);
>   	amdgpu_bo_unref(&adev->gmc.pdb0_bo);
>   	amdgpu_bo_fini(adev);
> -	amdgpu_gart_fini(adev);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
> index da96c6013477..ddfe4eaeea05 100644
> --- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
> @@ -301,7 +301,6 @@ static int iceland_ih_sw_fini(void *handle)
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
>   	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>   	amdgpu_irq_remove_domain(adev);
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> index 5eea4550b856..941d464a2b47 100644
> --- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> @@ -570,10 +570,6 @@ static int navi10_ih_sw_fini(void *handle)
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
>   	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
> index 751307f3252c..9a24f17a5750 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
> @@ -176,7 +176,6 @@ static int si_ih_sw_fini(void *handle)
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
>   	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
> index 973d80ec7f6c..b08905d1c00f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
> @@ -313,7 +313,6 @@ static int tonga_ih_sw_fini(void *handle)
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
>   	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>   	amdgpu_irq_remove_domain(adev);
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> index dead9c2fbd4c..32ec4b8e806a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> @@ -514,10 +514,6 @@ static int vega10_ih_sw_fini(void *handle)
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
>   	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
> index 58993ae1fe11..f51dfc38ac65 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
> @@ -566,10 +566,6 @@ static int vega20_ih_sw_fini(void *handle)
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
>   	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>   
>   	return 0;
>   }
> 
