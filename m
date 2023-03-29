Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C076CDAA2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011D010EAC2;
	Wed, 29 Mar 2023 13:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A2E10EAC9;
 Wed, 29 Mar 2023 13:23:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwgTHtjSRWYdC/omYpBxcprdHLKLQ9JQOvNu8W7cxCvH99IWfRj0i2S1tL23jQOtNiGh2XH5P0Id0hD7MAFk8yRhiFGg2wjGCD/JFiYw+Z4WLC7Ubh8DYfb3xt0ebueE8c/b3PFUYcTwcym6H2zn3hxxm0WBGms/dtQoQzUQ5MK+mf8Rc99ckDiQl4KRwJl1g2biqw/G8reF8tT3ylGXnKLfQbNVYL4clMbyxOgyhh8iP7B0LoDO6+0d1HK7YzclBTvgwfWaH957y4IYZXMt6VcapshA7nsnj+WoDXrvniAnaSHxnM0dvewqGvYxGb6pTKPr9kDMLJ4JZn0o3hN1QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPLP8jBfvABe0NEVXZcza5WFneOTZEnrxBk+7hEcjIg=;
 b=SiwlSkp7bvrvEolKjoptLkujqovd0hRQxnf/VV/4/W7QjjBEQAD9ybdjQg+DaOUqNmTagUPOn/e2PCsCr8eq192aqjcqX4sav9cIU1cdxX7gBwBdi2RECd1BPKYZk89PlCmLpQdaGVYtbSQXqZ9eb5qC/PSMmvdo6gHyeFK+x9H5K5F+2VpAnomn9kgtdZ3Z5/mFScnZaC2jJVioza1mydX0l4jLnAQHHGycHv7SlCmS3s1xcIOa1sV3Soig4Us57umUL66q/GhSvjhDJ6ijnVv2l+USnElFaGUsh48ErntOPrRXnUZGrl+e1XyTR8PmaxMZBOIB7ySlUhjEs99yWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPLP8jBfvABe0NEVXZcza5WFneOTZEnrxBk+7hEcjIg=;
 b=wwSFQ8jN1l8F8H+lGf9mjikKSUptFT7XZ0s7UsgKOvqpXx8zXXjNq7dREQd5PkeHK8bU1SvG1Vi62S4auqKDTrfOXCweaJtswfsvW6IrpJSjxhESwli4m6+dKjbcxcpDoRj5XYwdLKSB5FywcPmK8xspbjlNxNDhxwidg5bsr5k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.20; Wed, 29 Mar
 2023 13:23:14 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6222.028; Wed, 29 Mar 2023
 13:23:14 +0000
Message-ID: <76853776-ddfd-2fbc-a209-ca4f77faa481@amd.com>
Date: Wed, 29 Mar 2023 08:23:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] drm/amdgpu: Reset GPU on S0ix when device supports
 BOCO
Content-Language: en-US
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com
References: <20230329095933.1203559-1-kai.heng.feng@canonical.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230329095933.1203559-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0171.namprd13.prod.outlook.com
 (2603:10b6:806:28::26) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH8PR12MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: a887eb08-eb0b-4da8-42a9-08db3058bfcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: quxm0yDCr1LNiHdryfCxqvdj3LzogPkR8py6u4l6jNh1mmu5vOmZK47GGaUXUfTcjSPSfHdq2Bvs2VL/y+JotBZszTl+uOJbzf00iwJVQc6l+LWbTx2bQTYqFaV23jNPMsiPXJ3w3P53hEnIFmscP/Q8QWVItS4I2xGtrwEPmOjPwcdR3LqvA289TO1ZUG6LbutLQZ2GwvDMxnsfykwO8q1lDRV9MO2Lv+i7G8rR/dyD2cq2p2RjseTJ4vpRObM5XtnpcWmtvBHEYI3XG5x/aH0uJTAt8s9pc59jD+kB95NvXpgdQykyojLtq8cnjEtY6RGPE67m84OH/bwsx4FpdCtqKINPScLp8Bw9KcrDSPzSSmVH0t4yhE1GhKry4hH6oIib1XMK/4O6P4lsrYDYPuj2GXQ5ww2FxxvrTexVqmXIrjB/OHt9H9btqwu+sptp1zomMgciNCF9t9n24nHs4XupgNbqrBYtwtqpTmwN9tmcegv7/VUQv408XBczy4/FKPu4V6mjLx56HpWHADj6HJW6fdFRzaOyPz7quwVpTCp+OFCzSW/e7Mo47wL7l8OMQqhmudH6Kje4VwNpEnxwlm8pJrJNznGfW+nbCX0MUATC2XjQl26MCHtCGKfabeCj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199021)(5660300002)(41300700001)(6486002)(966005)(7416002)(44832011)(6666004)(8936002)(8676002)(2616005)(83380400001)(6636002)(54906003)(316002)(31686004)(38100700002)(2906002)(6506007)(53546011)(6512007)(36756003)(86362001)(31696002)(186003)(4326008)(66946007)(66556008)(66476007)(478600001)(32563001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnJDQm5FV3FyYXZoQllnYjg5V2J1NXA0ZDhlMC9JbHZDZVlQenI2UnEwMUJF?=
 =?utf-8?B?c2pNeXdQemNtZmt0ZnUxb0VqbWJ0M0k0S0YvdnNRWC9jQ2h1Skd1dkdWNkNq?=
 =?utf-8?B?TTRDeDRwOSswUHE1a0ovT1VFMlBzVStIVUNBaDZLSUs2ZHlRUnRYRXhycitt?=
 =?utf-8?B?U29CVFdLNlE2eG94TFhBajlESk8zZDBIOGppOUtPblRRTEhDWnBUY1l0aG5C?=
 =?utf-8?B?WCtWNmVaYlQwWnB2VHlnUHEwMUI2UG1VeElSd2NDL0x0QkZxNzF1QzBjVlo4?=
 =?utf-8?B?TnhMWWxkRDhud20zVmI5alNCbUg3b0dSUUZQaEdhUnpyYTFKM3M1NVZFaTZp?=
 =?utf-8?B?WTFBRlRFTDNsaW9ZRkRZUHJ6NlM2c0V2UDFNMmxjVmNldll2NStoZ0dlK09a?=
 =?utf-8?B?VjNTTS81RkR0Z0lrR0RXa1RSR1ZmblNlM2kzUDlmZGJyMnc4cWVDSGVDSVNR?=
 =?utf-8?B?R0xLaVlYRkZoblRkTmI0Z1pWMy9OV3BabHdRSDE2NjJuNC9Pa3dwTzBTbEhU?=
 =?utf-8?B?cldWV1NYbFhpT0NKc3V0Q25SUVVEdVN1MlBVZEg5b1hqa0FEUkRxYURERGcv?=
 =?utf-8?B?VmMyeG5ZMURLeUVpd3pIS1A0NDVEL1RtaytvZUxFZEdvbmlETDllM0x0Nzls?=
 =?utf-8?B?NWJMdVo0M2FwSzFtQ3UwZkllSGhqU01CVFg1SlAraDdlSEhvanltU3ZOQ2NR?=
 =?utf-8?B?Z1J0WG1hNTNuMlFkSjdJTC81Q0VEcklVSmU1eS9zSHBRSkFKOW93SHdwOHR3?=
 =?utf-8?B?OVl2c2l0TnhLMGFIRzh0cnBqNnpSalhyQ29iL2tsTm93WDVrbnhNUlNzSitv?=
 =?utf-8?B?VWlGb1ViN1MyOGMydXR6eklkakwxbGxNNDFNQTZaREpFdHdGVTl4OUxSTW96?=
 =?utf-8?B?dVpxUlFiZm9OQ3dSbnR2b1pQbVJqc3hzM0JaU2ZvVHBTVm03OVlCeHgwR3VU?=
 =?utf-8?B?aDJTNW1kN2FEL1I2RFB5alE2SWMwc2tjdE1uQlVJcG9ka2l5ajN3V1hDUDRx?=
 =?utf-8?B?eTJ6U3JrT3RoN3liZVJNbnorMGVvLzhBVExuZjVYc1VWNnRQaGowSnJ1TEN2?=
 =?utf-8?B?ZlpHWnNhdXZFbThGcE9rVXlud2dQeGN3alJnS3JXbmJjTTJQcCt1dnJFeUZB?=
 =?utf-8?B?eEFwZERTSWkxeVZRUkFzamFyY1I5OWNEQ1RCOFFrcVQzWkhJbGlkaUdVRE44?=
 =?utf-8?B?Rk91ZFlwT29GNFhYNWQzdDZobFcvaEl5VE1vV1F1bGhxVEhJWUdqSHN0eWpU?=
 =?utf-8?B?MDV5bk9lRWxEamtHblgzUE5FNDJpRnhrR1Vrd0N2RFVXVzV1VGhVaUlsdmJa?=
 =?utf-8?B?VnlEZzZxdVJlcVgycnZtbmdhSnI0NlJaZzJGNkJrYU5NNnorcFBJVXZNQnZO?=
 =?utf-8?B?bW5rN2Zva05mWXFDUjNOdUZKR3hDNXdKTHcraW5WMkxRNnk0Qk1EVlJsSXZT?=
 =?utf-8?B?M3k1VUQ0ME1IMVlodlZTdEtZc2phNXUrcitVeitaUU9tWjMrdXIrc2xveHo1?=
 =?utf-8?B?Rld4WWNZUFN0MW5NME1aeHlBQ1pkYjc2Y0lDSUtQVWsvUzBPcXdNeWJFSU9P?=
 =?utf-8?B?Qys5RWZtM3ZpYkpTb1RGMUdjd2MxNWZ5Tkd1MnNJVlBjeUptNkRVa29LRzVH?=
 =?utf-8?B?MFd0dklwRlZhdXVlS25haUNGK2Z3S1d1Q1lyZkxmSGM3a2U0YVJ2Vko0UW9x?=
 =?utf-8?B?OFQ1cHpwWjQ4STlqUWpoM0dDMnZkMU82MytiVHRyM29YQldub2RuM1FoWU5r?=
 =?utf-8?B?Q1ZNcFIyQ1VHREtaSGpKNTk4a3d6VFRIdEJzVHFYRDMyakpaS1gyRUpuMUJN?=
 =?utf-8?B?S0ozWUFpQXZMRmxDWkZrbXF6eEFMQUtoZWhTSFhmSm9haGkzeGhQLzVhb0Vq?=
 =?utf-8?B?blFnWjBYUEFISm1YazdzSlhGT1ZxRU41VzM1V21nMll6Nzh0S3I5UmFRaGwx?=
 =?utf-8?B?MTJNbWZIMU40SjBML3I3OVZMbnh4YzFWSTVzUThpa0wwV0czd1NFQVRVTWhT?=
 =?utf-8?B?azAzUUVNLzZKbVlFRmNlT0QzbVFzb0ZXZFA3TFo5TFcydzNyN1JGQkpwV3pG?=
 =?utf-8?B?UDVyN0drNDhnZEJVRHNUZUVEWVE2aFVDeWJkcWhMNy9wMXBHVEk0bVRoWnNu?=
 =?utf-8?B?T05OVlVVb0VCUHcyVXFHd0pSaEFBb1o1eDN5MFVMUWlXNmJWREQ0VVl1Sis2?=
 =?utf-8?Q?38WKkECXkrXq2hS/K3P886VYDyfSzyY/nQ0Ya80o4idZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a887eb08-eb0b-4da8-42a9-08db3058bfcf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 13:23:13.9411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkrPyaUy+XUAGO76Vj3vV9KDKeKOzQ67o+qjPCvdeFxumO4f0YrJ35u6tb/utvQYvyT/iavSEuVHeG2nOYYKRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7325
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
Cc: Tim Huang <tim.huang@amd.com>, Jingyu Wang <jingyuwang_vip@163.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Guchun Chen <guchun.chen@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, dri-devel@lists.freedesktop.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, Maxime Ripard <maxime@cerno.tech>,
 Jiansong Chen <Jiansong.Chen@amd.com>, Evan Quan <evan.quan@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/29/23 04:59, Kai-Heng Feng wrote:
> When the power is lost due to ACPI power resources being turned off, the
> driver should reset the GPU so it can work anew.
>
> First, _PR3 support of the hierarchy needs to be found correctly. Since
> the GPU on some discrete GFX cards is behind a PCIe switch, checking the
> _PR3 on downstream port alone is not enough, as the _PR3 can associate
> to the root port above the PCIe switch.

I think this should be split into two commits:

* One of them to look at _PR3 further up in hierarchy to fix indication
for BOCO support.

* One to adjust policy for whether to reset


> Once the _PR3 is found and BOCO support is correctly marked, use that
> information to inform the GPU should be reset. This solves an issue that
> system freeze on a Intel ADL desktop that uses S0ix for sleep and D3cold
> is supported for the GFX slot.

I'm worried this is still papering over an underlying issue with L0s
handling on ALD + Navi1x/Navi2x.

Also, what about runtime suspend?  If you unplug the monitor from this
dGPU and interact with it over SSH it should go into runtime suspend.

Is it working properly for that case now?

>
> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2458
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c   |  3 +++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  7 ++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 12 +++++-------
>   3 files changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index 60b1857f469e..407456ac0e84 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -987,6 +987,9 @@ bool amdgpu_acpi_should_gpu_reset(struct amdgpu_device *adev)
>   	if (amdgpu_sriov_vf(adev))
>   		return false;
>   
> +	if (amdgpu_device_supports_boco(adev_to_drm(adev)))
> +		return true;
> +
>   #if IS_ENABLED(CONFIG_SUSPEND)
>   	return pm_suspend_target_state != PM_SUSPEND_TO_IDLE;
>   #else
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index f5658359ff5c..d56b7a2bafa6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2181,7 +2181,12 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
>   
>   	if (!(adev->flags & AMD_IS_APU)) {
>   		parent = pci_upstream_bridge(adev->pdev);
> -		adev->has_pr3 = parent ? pci_pr3_present(parent) : false;
> +		do {
> +			if (pci_pr3_present(parent)) {
> +				adev->has_pr3 = true;
> +				break;
> +			}
> +		} while ((parent = pci_upstream_bridge(parent)));
>   	}
>   
>   	amdgpu_amdkfd_device_probe(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index ba5def374368..5d81fcac4b0a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2415,10 +2415,11 @@ static int amdgpu_pmops_suspend(struct device *dev)
>   	struct drm_device *drm_dev = dev_get_drvdata(dev);
>   	struct amdgpu_device *adev = drm_to_adev(drm_dev);
>   
> -	if (amdgpu_acpi_is_s0ix_active(adev))
> -		adev->in_s0ix = true;
> -	else if (amdgpu_acpi_is_s3_active(adev))
> +	if (amdgpu_acpi_is_s3_active(adev) ||
> +	    amdgpu_device_supports_boco(drm_dev))
>   		adev->in_s3 = true;
> +	else if (amdgpu_acpi_is_s0ix_active(adev))
> +		adev->in_s0ix = true;
>   	if (!adev->in_s0ix && !adev->in_s3)
>   		return 0;
>   	return amdgpu_device_suspend(drm_dev, true);
> @@ -2449,10 +2450,7 @@ static int amdgpu_pmops_resume(struct device *dev)
>   		adev->no_hw_access = true;
>   
>   	r = amdgpu_device_resume(drm_dev, true);
> -	if (amdgpu_acpi_is_s0ix_active(adev))
> -		adev->in_s0ix = false;
> -	else
> -		adev->in_s3 = false;
> +	adev->in_s0ix = adev->in_s3 = false;
>   	return r;
>   }
>   
