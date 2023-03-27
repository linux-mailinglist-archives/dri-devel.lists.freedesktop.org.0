Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 459B46CB0DB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 23:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3EC10E3F5;
	Mon, 27 Mar 2023 21:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF48E10E0FF;
 Mon, 27 Mar 2023 21:44:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5k7buF9GM+N8kBSQaRSLgr6z2Qn3Q20N0XtLLUklM1iTWZhIm8DRyZPZQ9b4PPsWrdHJw21FMEh9cCxemzQZqTZbcotntvjZHYlYQXY3HdSguJtk65wSca9MvDKUUr7R4YKJibVZ9zT43q85EF5QJY4jmy8wpCyEEe3D8kuG4ljJoQAI1eXE+6XFG0U1UvMRHFw0dIwQcO1/4NpWm3SttaYJ1ELv1g2xFDnB6IzzAfGkha0hw7M7uDc/KlYUlVJ1EWbrAwOChVxVaN4wvUuQzBtqWbwRl3HuYjkHGrCjJsP7vYMVFKCfNgsFddpHK0NoSjHTYv6aDpQu/Vb+MDyJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTP9i/XHVzGQZE9h000Yoh3Uv9haAr7rPPGusGkH6JI=;
 b=ktFBLqSd8FOXNBMAEaSQRZOBYo285BroFeEcrNbyOKKxHBPvIyEznb1mf2XEHSOacA4KCOG2pBtjKu41WYy3Vodt7mk/BknSFnyPSIl3gXZjy5Uo0NJvwRiU8OL1x4eETRubc8Epn/Uuw0CG8zMmwNc/zFJ1Vktlbb7PY+76ilqVTRa+sRgcFWoHJTusxKSlquKOlg6gNda8yibaIDNtN2SJnJyctazO4NqTBBnznoGuEZ5Rh6kOCSxdmiksK4HMRUxEROnQlUOwa5IPA8qWj7wG/oq3T3q4A68Xl/imfd7KPufS+/mmp0BZMQEdzcRr6GD+gAKqvgwk7qhL0QOSqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTP9i/XHVzGQZE9h000Yoh3Uv9haAr7rPPGusGkH6JI=;
 b=0ldwnnBoKuDHqnA+VWoKmJfIANUx9HfB1r+xl6HVqEc2S4UbnJ573Ni2jDSceAcuB5iYKwHg1RE9lRf+2hvWifIXBPCZ8sfbR+JavLMCywcmahHrN0qP9km8X4oPAFULcotce1zfmc9kKWXZQoWME72wii9WxAe4JClwsfq+ESg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BL1PR12MB5207.namprd12.prod.outlook.com (2603:10b6:208:318::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.32; Mon, 27 Mar
 2023 21:44:35 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6222.031; Mon, 27 Mar 2023
 21:44:34 +0000
Message-ID: <2df95dfc-ee55-7015-0217-b8d6f5b35a20@amd.com>
Date: Mon, 27 Mar 2023 17:44:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 34/34] drm/amdkfd: optimize gfx off enable toggle for
 debugging
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230327184339.125016-1-jonathan.kim@amd.com>
 <20230327184339.125016-34-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230327184339.125016-34-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0134.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::15) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BL1PR12MB5207:EE_
X-MS-Office365-Filtering-Correlation-Id: a14492c0-5212-4c36-e4c6-08db2f0c74b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bjrsGG/rHHJTAkJAWnevN9MI7qRywIBePAZ3idfRW0HDWm7jWvpLrBmcNmxwEea5S8wBcm6sSv5WiX54TO9seRyl47AtIV4mcz5umeaLtOSwP38Rj69ZDc5QM/zxVZ5gRz5hbLUN2oBpfOWn10x93uzrXfmIEFKF2UlmkC61KzSLDnnJ65nE01aO4lHANVJUcSX+8z+veYEHbaXFh0KKcgsqdxqDr78hu3hCgu8AOCTGI5EnYoUQ+P+nh1MVrzb7RvjGNRJ65MyIuO9uiaDrHOvTZanKnaIeygMIk9Km08LHzTPU58cItiFt5i+xa3JVUlMGdRbXSStco01DNaxf5oCsHqDadeOZ8Z0CrT+Mkg62Mnx0FjJ0nrr42vHu8uADwAjN7bOJq+dZL/0hNK/rHWxP6j37QTlHutj1idQwQueHbBBb/+KRd/Ty/EjsvpVNTz/iPBLXpwKDvWaHQpG4w8U9h7Q1WoCVdgKMM0gXJq/hHAAc2I5Wl07NCDStDpDvkcLEhhSmtvteSaD5ktIfsqY0YVae7rAo6SNK+9PqvmuUnVlCaB5g7xEvsdgin9Y+Z4QQYtFSN53FQ5Ug/6US9kVJH3k/pKLKeTBmTpI2uNsxpfUd4mjdfq0yk1cyw1uu5LIjN4JcnXGwDauo66cFMEFaQco+4lC/La8YUzX7j+E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199021)(31686004)(31696002)(86362001)(36756003)(2906002)(478600001)(6486002)(2616005)(83380400001)(6512007)(36916002)(38100700002)(53546011)(8676002)(66946007)(316002)(66556008)(66476007)(450100002)(186003)(26005)(6506007)(5660300002)(44832011)(8936002)(41300700001)(30864003)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmZCbzZIdERPZGJ5Ujd3M0o2Nk1QOTZQY3l2UVQxRzNqNkpBSkFPREltWFhl?=
 =?utf-8?B?YmFxM01GOVNRN1QrWWxkcFF5SG5xZUowcFY0UFNjMTY4bS9qVE5ERkQrdDRX?=
 =?utf-8?B?dHF0M042cUgxU3Q5V2FJMmlIZDVkTzVSRWdCNnBSTGJEV3ZVazBxVEEvVFM1?=
 =?utf-8?B?T2poRDZPUlk0dUR5Sld0VnFiL2R4d2dQMmhHbHBmSGJUQ3RSSlorelZneWNW?=
 =?utf-8?B?WitTbFIvUndrMTFjeUxwZEJHZGd3MDFBVG50KzZjb3dwV2NwU2R0SXJPdWdP?=
 =?utf-8?B?c2tjVURlRERtRXBUcmdUTlAyTWMyM0IzRUthL2htTHJSNGRZcms1enlLY0Vy?=
 =?utf-8?B?VGFvMW5Rb2tpck5Wb0gwTkp4YW8xUWEvTnJQczZEY0tFMUVUcHV5ekZIVTlX?=
 =?utf-8?B?Z0tzN2tBOHhmNEZEa3VLTW1MVnUzcGRCR25NWW5DRWJ2YmF0aWxtSW5DakVS?=
 =?utf-8?B?dnVTejB6OG1RZFRQV05zVjJkMGpPNTI5dnRKMGhQeFZTS3ZReStUM2YyV3o2?=
 =?utf-8?B?ZFQ2d0NjQmx3eXdvQzhqSEFZV3VUMVVBSzdGZDg2M1JtNkdvdCtDdlI2bTQv?=
 =?utf-8?B?VnF4Zkx4RjRTNmt1WnJPYjJhRThjTVBpUTZqWXhZdGJ5bDdoVk9sQmhyWGUv?=
 =?utf-8?B?MVYwZkl3L2phcFBWWkpRYmZVMjRlUFVpM1RET2JseERVNjBMRkU5WDhzbGRS?=
 =?utf-8?B?T3J4cnZDR0FIWDBqaWl1SVZZbjFKTVpVV0cwa01HbDVNVVUvcFBiU2E1TS91?=
 =?utf-8?B?ZDZzZ1BFK3ZCa0QyYWdHcmdXVWN0WTBGa3ZJUTd6OFk2M2VIQUM3MEZMTWdr?=
 =?utf-8?B?WTBpbzM0TjQ0a044UGZaV3FpbkxITGtVVEtPTUNTelBwM1E4Y3FzWjZaRk5N?=
 =?utf-8?B?NW1CNHpZRE9Ucyt1d1Q0bC96UktkeHhoRjV4ZGVyeEVFdyt5b0RNemIrVm9z?=
 =?utf-8?B?ak9ZdkJsWDAwMGhjTkRXNWZ2NUxzbU01QnJ2Tk5KV1FHSmpDZmVxaWk1MHZ3?=
 =?utf-8?B?QTI1cHVwWklveGtPNG00aGpFZ2Z6bGZsN2NqYlVlK3ZwYzdtZTRrZVQ2NHJK?=
 =?utf-8?B?bGdaTnBmdTRHS2xPVUE2aDlFTHErazdVdHcrTDh5K2d0SEV2RXVybWVuaThT?=
 =?utf-8?B?RVRESlBnYVJFSVFkaWRhR2xrc0M4OW9jU0E5Z0U5M2t0b0JIUWRJWngyZk9N?=
 =?utf-8?B?MWgrWkZiNjc1ck1ieUlwOG4vRkdzbDJ3c3JCMzl0NW0yNlpFSTkvNkgwMmlH?=
 =?utf-8?B?UHo1OWc0T01ZVnJ0VTVkUnVzRFpKZ1V5TDgyRTIxY0IwYUdFcnpobFdLSFIw?=
 =?utf-8?B?Z2c1eVk1WnlpK09WMTRaaGZhM2R0QlQwRkswV21WOWlPQzFKcnJoZTAzRW1B?=
 =?utf-8?B?dll6L3p2anByMUhlVXRBVHBqK2lKSlJZVTAwR080S05FdkszTzRFRGNWOWU5?=
 =?utf-8?B?OUN5SnlvVU42dlFtSUFDV21RT0tIc2RPU1BDd1E4ZU9QanBpZGk3dVpGak5D?=
 =?utf-8?B?cGF3bXp5cXZVaU5OczVPb3NyanJNUmM3N3pNNXhQUFFBaEJNNFBxMHVTWk5U?=
 =?utf-8?B?cEMyY3V3akVHK1hDRmJScjdkN2Judy9lNVdSRi9WaVNPdW5TTEF6WHFIdFln?=
 =?utf-8?B?cnk5dkhWRjc4c2xTNG9YSEkvZUhSZUxIZVdoZWhMRy9Qb21zSXRDVmFVbFlD?=
 =?utf-8?B?Uk84VHkwV1Q2QTMrQ0U3dnIrVzcza1dKaE9maG5sSXBMcDJ1aGN4Zlp4bGph?=
 =?utf-8?B?b2FBNDNBdnhIaWp2blNrakw5aVlGM0x5Y2ZOd3ZxZkJ3TEs1RXlFVERONTc4?=
 =?utf-8?B?YTFVMFdoaWdKY1lrWG9FNEQyL3F3aUtyR2d1a20welkzNCt5L2RUR1VVVVds?=
 =?utf-8?B?YlNiN1N6S2hoaVZiV0V3dzIzemd2blhnaGoyZnFCZUhTNExEQWNlSEhKVXA1?=
 =?utf-8?B?bnZqUmgyd1p2UlhMa0t2UExZVkJxdEMyZUViSmkvaDRXMGJJN2s3QWFlZWlP?=
 =?utf-8?B?OFYyaVJiNXZlRjNVa055M1JreHI3UWpjRXVTUFBSb0djN3FXalNZVXB2UTlJ?=
 =?utf-8?B?SDVENkNESXduM01CMGd1d0grK1hHYXRXSlBlMFJ2ckFwR0h1WHBvRTQwKzlp?=
 =?utf-8?Q?2DEvmZ5JE5rx2EkjoSIgiBvYZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a14492c0-5212-4c36-e4c6-08db2f0c74b8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 21:44:34.9354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BBZV/TP1mM3I73f1/X2IbqEhG+5DrI9gMycFaZbnnHP7gq6QkOUoMGyQvL05HuOdntqT1TvuNhgsmooTZM5mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5207
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-03-27 14:43, Jonathan Kim wrote:
> Legacy debug devices limited to pinning a single debug VMID for debugging
> are the only devices that require disabling GFX OFF while accessing
> debug registers.  Debug devices that support multi-process debugging
> rely on the hardware scheduler to update debug registers and do not run
> into GFX OFF access issues.

The address watch functions still touch the address registers directly. 
I guess that needs GFXOFF to be disabled.

Regards,
   Felix


>
> Remove KFD GFX OFF enable toggle clutter by moving these calls into the
> KGD debug calls themselves.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  7 ++++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    | 33 ++++++++++++++++++-
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 24 ++++++++++++++
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 30 +++++------------
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 21 +-----------
>   5 files changed, 73 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> index 6df215aba4c4..dec4a3381ccb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> @@ -350,6 +350,8 @@ static uint32_t kgd_arcturus_enable_debug_trap(struct amdgpu_device *adev,
>   				bool restore_dbg_registers,
>   				uint32_t vmid)
>   {
> +	amdgpu_gfx_off_ctrl(adev, false);
> +
>   	mutex_lock(&adev->grbm_idx_mutex);
>   
>   	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
> @@ -362,6 +364,8 @@ static uint32_t kgd_arcturus_enable_debug_trap(struct amdgpu_device *adev,
>   
>   	mutex_unlock(&adev->grbm_idx_mutex);
>   
> +	amdgpu_gfx_off_ctrl(adev, true);
> +
>   	return 0;
>   }
>   
> @@ -375,6 +379,7 @@ static uint32_t kgd_arcturus_disable_debug_trap(struct amdgpu_device *adev,
>   					bool keep_trap_enabled,
>   					uint32_t vmid)
>   {
> +	amdgpu_gfx_off_ctrl(adev, false);
>   
>   	mutex_lock(&adev->grbm_idx_mutex);
>   
> @@ -388,6 +393,8 @@ static uint32_t kgd_arcturus_disable_debug_trap(struct amdgpu_device *adev,
>   
>   	mutex_unlock(&adev->grbm_idx_mutex);
>   
> +	amdgpu_gfx_off_ctrl(adev, true);
> +
>   	return 0;
>   }
>   const struct kfd2kgd_calls arcturus_kfd2kgd = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> index 444f9ea758d6..2132376e2107 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> @@ -753,12 +753,13 @@ uint32_t kgd_gfx_v10_enable_debug_trap(struct amdgpu_device *adev,
>   				bool restore_dbg_registers,
>   				uint32_t vmid)
>   {
> +	amdgpu_gfx_off_ctrl(adev, false);
>   
>   	mutex_lock(&adev->grbm_idx_mutex);
>   
>   	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, true);
>   
> -	/* assume gfx off is disabled for the debug session if rlc restore not supported. */
> +	/* keep gfx off disabled for the debug session if rlc restore not supported. */
>   	if (restore_dbg_registers) {
>   		uint32_t data = 0;
>   
> @@ -783,6 +784,8 @@ uint32_t kgd_gfx_v10_enable_debug_trap(struct amdgpu_device *adev,
>   
>   	mutex_unlock(&adev->grbm_idx_mutex);
>   
> +	amdgpu_gfx_off_ctrl(adev, true);
> +
>   	return 0;
>   }
>   
> @@ -790,6 +793,8 @@ uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
>   					bool keep_trap_enabled,
>   					uint32_t vmid)
>   {
> +	amdgpu_gfx_off_ctrl(adev, false);
> +
>   	mutex_lock(&adev->grbm_idx_mutex);
>   
>   	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, true);
> @@ -800,6 +805,16 @@ uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
>   
>   	mutex_unlock(&adev->grbm_idx_mutex);
>   
> +	amdgpu_gfx_off_ctrl(adev, true);
> +
> +	/*
> +	 * Remove the extra gfx off disable reference from debug restore call
> +	 * for asics that do not support rlc restore for debug registers.
> +	 */
> +	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 10) ||
> +	    adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 1))
> +		amdgpu_gfx_off_ctrl(adev, true);
> +
>   	return 0;
>   }
>   
> @@ -831,6 +846,8 @@ uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
>   {
>   	uint32_t data, wave_cntl_prev;
>   
> +	amdgpu_gfx_off_ctrl(adev, false);
> +
>   	mutex_lock(&adev->grbm_idx_mutex);
>   
>   	wave_cntl_prev = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
> @@ -852,6 +869,8 @@ uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
>   
>   	mutex_unlock(&adev->grbm_idx_mutex);
>   
> +	amdgpu_gfx_off_ctrl(adev, true);
> +
>   	return 0;
>   }
>   
> @@ -862,6 +881,8 @@ uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
>   	uint32_t data = 0;
>   	bool is_mode_set = !!wave_launch_mode;
>   
> +	amdgpu_gfx_off_ctrl(adev, false);
> +
>   	mutex_lock(&adev->grbm_idx_mutex);
>   
>   	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, true);
> @@ -876,6 +897,8 @@ uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
>   
>   	mutex_unlock(&adev->grbm_idx_mutex);
>   
> +	amdgpu_gfx_off_ctrl(adev, true);
> +
>   	return 0;
>   }
>   
> @@ -933,10 +956,14 @@ uint32_t kgd_gfx_v10_set_address_watch(struct amdgpu_device *adev,
>   			VALID,
>   			1);
>   
> +	amdgpu_gfx_off_ctrl(adev, false);
> +
>   	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
>   			(watch_id * TCP_WATCH_STRIDE)),
>   			watch_address_cntl);
>   
> +	amdgpu_gfx_off_ctrl(adev, true);
> +
>   	return 0;
>   }
>   
> @@ -947,10 +974,14 @@ uint32_t kgd_gfx_v10_clear_address_watch(struct amdgpu_device *adev,
>   
>   	watch_address_cntl = 0;
>   
> +	amdgpu_gfx_off_ctrl(adev, false);
> +
>   	WREG32((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
>   			(watch_id * TCP_WATCH_STRIDE)),
>   			watch_address_cntl);
>   
> +	amdgpu_gfx_off_ctrl(adev, true);
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> index 87eef794d299..4b025fa0beb5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> @@ -701,6 +701,8 @@ uint32_t kgd_gfx_v9_enable_debug_trap(struct amdgpu_device *adev,
>   				bool restore_dbg_registers,
>   				uint32_t vmid)
>   {
> +	amdgpu_gfx_off_ctrl(adev, false);
> +
>   	mutex_lock(&adev->grbm_idx_mutex);
>   
>   	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
> @@ -711,6 +713,8 @@ uint32_t kgd_gfx_v9_enable_debug_trap(struct amdgpu_device *adev,
>   
>   	mutex_unlock(&adev->grbm_idx_mutex);
>   
> +	amdgpu_gfx_off_ctrl(adev, true);
> +
>   	return 0;
>   }
>   
> @@ -724,6 +728,8 @@ uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
>   					bool keep_trap_enabled,
>   					uint32_t vmid)
>   {
> +	amdgpu_gfx_off_ctrl(adev, false);
> +
>   	mutex_lock(&adev->grbm_idx_mutex);
>   
>   	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
> @@ -734,6 +740,8 @@ uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
>   
>   	mutex_unlock(&adev->grbm_idx_mutex);
>   
> +	amdgpu_gfx_off_ctrl(adev, true);
> +
>   	return 0;
>   }
>   
> @@ -765,6 +773,8 @@ uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
>   {
>   	uint32_t data, wave_cntl_prev;
>   
> +	amdgpu_gfx_off_ctrl(adev, false);
> +
>   	mutex_lock(&adev->grbm_idx_mutex);
>   
>   	wave_cntl_prev = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
> @@ -786,6 +796,8 @@ uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
>   
>   	mutex_unlock(&adev->grbm_idx_mutex);
>   
> +	amdgpu_gfx_off_ctrl(adev, true);
> +
>   	return 0;
>   }
>   
> @@ -796,6 +808,8 @@ uint32_t kgd_gfx_v9_set_wave_launch_mode(struct amdgpu_device *adev,
>   	uint32_t data = 0;
>   	bool is_mode_set = !!wave_launch_mode;
>   
> +	amdgpu_gfx_off_ctrl(adev, false);
> +
>   	mutex_lock(&adev->grbm_idx_mutex);
>   
>   	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
> @@ -810,6 +824,8 @@ uint32_t kgd_gfx_v9_set_wave_launch_mode(struct amdgpu_device *adev,
>   
>   	mutex_unlock(&adev->grbm_idx_mutex);
>   
> +	amdgpu_gfx_off_ctrl(adev, true);
> +
>   	return 0;
>   }
>   
> @@ -867,10 +883,14 @@ uint32_t kgd_gfx_v9_set_address_watch(struct amdgpu_device *adev,
>   			VALID,
>   			1);
>   
> +	amdgpu_gfx_off_ctrl(adev, false);
> +
>   	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
>   			(watch_id * TCP_WATCH_STRIDE)),
>   			watch_address_cntl);
>   
> +	amdgpu_gfx_off_ctrl(adev, true);
> +
>   	return 0;
>   }
>   
> @@ -881,10 +901,14 @@ uint32_t kgd_gfx_v9_clear_address_watch(struct amdgpu_device *adev,
>   
>   	watch_address_cntl = 0;
>   
> +	amdgpu_gfx_off_ctrl(adev, false);
> +
>   	WREG32_RLC((SOC15_REG_OFFSET(GC, 0, mmTCP_WATCH0_CNTL) +
>   			(watch_id * TCP_WATCH_STRIDE)),
>   			watch_address_cntl);
>   
> +	amdgpu_gfx_off_ctrl(adev, true);
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index ead5afe4216b..131b9c25e3ec 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2752,7 +2752,6 @@ static int runtime_enable(struct kfd_process *p, uint64_t r_debug,
>   			struct kfd_process_device *pdd = p->pdds[i];
>   
>   			if (!kfd_dbg_is_rlc_restore_supported(pdd->dev)) {
> -				amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
>   				pdd->dev->kfd2kgd->enable_debug_trap(
>   						pdd->dev->adev,
>   						true,
> @@ -2809,33 +2808,22 @@ static int runtime_disable(struct kfd_process *p)
>   			return ret;
>   	}
>   
> -	if (was_enabled && p->runtime_info.ttmp_setup) {
> -		for (i = 0; i < p->n_pdds; i++) {
> -			struct kfd_process_device *pdd = p->pdds[i];
> -
> -			if (!kfd_dbg_is_rlc_restore_supported(pdd->dev))
> -				amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
> -		}
> -	}
> -
>   	p->runtime_info.ttmp_setup = false;
>   
>   	/* disable ttmp setup */
>   	for (i = 0; i < p->n_pdds; i++) {
>   		struct kfd_process_device *pdd = p->pdds[i];
>   
> -		if (kfd_dbg_is_per_vmid_supported(pdd->dev)) {
> -			pdd->spi_dbg_override =
> -					pdd->dev->kfd2kgd->disable_debug_trap(
> -					pdd->dev->adev,
> -					false,
> -					pdd->dev->vm_info.last_vmid_kfd);
> +		pdd->spi_dbg_override =
> +				pdd->dev->kfd2kgd->disable_debug_trap(
> +				pdd->dev->adev,
> +				false,
> +				pdd->dev->vm_info.last_vmid_kfd);
>   
> -			if (!pdd->dev->shared_resources.enable_mes)
> -				debug_refresh_runlist(pdd->dev->dqm);
> -			else
> -				kfd_dbg_set_mes_debug_mode(pdd);
> -		}
> +		if (!pdd->dev->shared_resources.enable_mes)
> +			debug_refresh_runlist(pdd->dev->dqm);
> +		else
> +			kfd_dbg_set_mes_debug_mode(pdd);
>   	}
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index 0ea85afcffd3..6e306defcc85 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -423,11 +423,9 @@ int kfd_dbg_trap_clear_dev_address_watch(struct kfd_process_device *pdd,
>   			return r;
>   	}
>   
> -	amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
>   	pdd->watch_points[watch_id] = pdd->dev->kfd2kgd->clear_address_watch(
>   							pdd->dev->adev,
>   							watch_id);
> -	amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
>   
>   	if (!pdd->dev->shared_resources.enable_mes)
>   		r = debug_map_and_unlock(pdd->dev->dqm);
> @@ -458,7 +456,6 @@ int kfd_dbg_trap_set_dev_address_watch(struct kfd_process_device *pdd,
>   		}
>   	}
>   
> -	amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
>   	pdd->watch_points[*watch_id] = pdd->dev->kfd2kgd->set_address_watch(
>   				pdd->dev->adev,
>   				watch_address,
> @@ -466,7 +463,6 @@ int kfd_dbg_trap_set_dev_address_watch(struct kfd_process_device *pdd,
>   				*watch_id,
>   				watch_mode,
>   				pdd->dev->vm_info.last_vmid_kfd);
> -	amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
>   
>   	if (!pdd->dev->shared_resources.enable_mes)
>   		r = debug_map_and_unlock(pdd->dev->dqm);
> @@ -577,15 +573,11 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
>   
>   		kfd_process_set_trap_debug_flag(&pdd->qpd, false);
>   
> -		/* GFX off is already disabled by debug activate if not RLC restore supported. */
> -		if (kfd_dbg_is_rlc_restore_supported(pdd->dev))
> -			amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
>   		pdd->spi_dbg_override =
>   				pdd->dev->kfd2kgd->disable_debug_trap(
>   				pdd->dev->adev,
>   				target->runtime_info.ttmp_setup,
>   				pdd->dev->vm_info.last_vmid_kfd);
> -		amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
>   
>   		if (!kfd_dbg_is_per_vmid_supported(pdd->dev) &&
>   				release_debug_trap_vmid(pdd->dev->dqm, &pdd->qpd))
> @@ -684,14 +676,10 @@ int kfd_dbg_trap_activate(struct kfd_process *target)
>   			}
>   		}
>   
> -		/* Disable GFX OFF to prevent garbage read/writes to debug registers.
> +		/*
>   		 * If RLC restore of debug registers is not supported and runtime enable
>   		 * hasn't done so already on ttmp setup request, restore the trap config registers.
> -		 *
> -		 * If RLC restore of debug registers is not supported, keep gfx off disabled for
> -		 * the debug session.
>   		 */
> -		amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
>   		if (!(kfd_dbg_is_rlc_restore_supported(pdd->dev) ||
>   						target->runtime_info.ttmp_setup))
>   			pdd->dev->kfd2kgd->enable_debug_trap(pdd->dev->adev, true,
> @@ -702,9 +690,6 @@ int kfd_dbg_trap_activate(struct kfd_process *target)
>   					false,
>   					pdd->dev->vm_info.last_vmid_kfd);
>   
> -		if (kfd_dbg_is_rlc_restore_supported(pdd->dev))
> -			amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
> -
>   		/**
>   		 * Setting the debug flag in the trap handler requires that the TMA has been
>   		 * allocated, which occurs during CWSR initialization.
> @@ -836,7 +821,6 @@ int kfd_dbg_trap_set_wave_launch_override(struct kfd_process *target,
>   	for (i = 0; i < target->n_pdds; i++) {
>   		struct kfd_process_device *pdd = target->pdds[i];
>   
> -		amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
>   		pdd->spi_dbg_override = pdd->dev->kfd2kgd->set_wave_launch_trap_override(
>   				pdd->dev->adev,
>   				pdd->dev->vm_info.last_vmid_kfd,
> @@ -845,7 +829,6 @@ int kfd_dbg_trap_set_wave_launch_override(struct kfd_process *target,
>   				trap_mask_request,
>   				trap_mask_prev,
>   				pdd->spi_dbg_override);
> -		amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
>   
>   		if (!pdd->dev->shared_resources.enable_mes)
>   			r = debug_refresh_runlist(pdd->dev->dqm);
> @@ -872,12 +855,10 @@ int kfd_dbg_trap_set_wave_launch_mode(struct kfd_process *target,
>   	for (i = 0; i < target->n_pdds; i++) {
>   		struct kfd_process_device *pdd = target->pdds[i];
>   
> -		amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
>   		pdd->spi_dbg_launch_mode = pdd->dev->kfd2kgd->set_wave_launch_mode(
>   				pdd->dev->adev,
>   				wave_launch_mode,
>   				pdd->dev->vm_info.last_vmid_kfd);
> -		amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
>   
>   		if (!pdd->dev->shared_resources.enable_mes)
>   			r = debug_refresh_runlist(pdd->dev->dqm);
