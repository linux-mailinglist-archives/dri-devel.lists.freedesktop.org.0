Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F7A6C212A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 20:20:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06ED910E30C;
	Mon, 20 Mar 2023 19:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140E010E2A9;
 Mon, 20 Mar 2023 19:19:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMxWkyNGFiVAuZIWoaEOlK2yamm5XI4kFuwvu1JAZvSVilk+pRn4440X1QR4YpKHUpMOT21/2N5XkSjmK6mi6VszzxdDNKQ++XZkTQHCECIq0hy/Udx8K0RmbArILSzjC6TshqPz09Eeiu+NB/nvI18O+5raYioS+3dN2AelspUOsn5eNEKy+xlKsDRxLcjGU5lTjE9UaMI+fz8aI6yMR8jKJASg5v0tj4121t3+UOaRMVhQ7r/SpgMbdM2jm14Cdv+8FPzyyfP9EXdoH5eeJZHu0OveQgT0k02SUHUMY2rzH/xyuXuCC7wZYAtZCYgRTlNIXBStzjVSMEYq5MSt8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CR59Vki7z0KuxHe/yeGrfyXOx/2+mPFJpoRlZkMwYao=;
 b=A9UgJ6j7LvGsy3+zgfpACfM3lSPCLT0e3rrQb3Fw0qnv0Lqmd2C4uI7qOQz3Z/nxLYqNqbH8A7eu13vok+Frt3Ym9f/5orMfKGxd7tMnwtHSLjtinRK/Nx2O5AKt6zZamhUed2qSafb/TqcQOCbui5T0J26GsBBJQ6YKPFy+4R1ptCICw1hFdUGC7AhkvNsqKqNEhQ/zJ5rhtEiymfXbO4M7vFICYvEdI51s2WL1bO1HLRYw9QJnhTebj2Wka8sgWVNkKZzxaMWI8KBaz8ehAf352LaObpBJth6yL35N+sYUHUrcuD/yhVF0cUpZbDuhdRw3oUfmPh0BQdxougufIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CR59Vki7z0KuxHe/yeGrfyXOx/2+mPFJpoRlZkMwYao=;
 b=ye1apm2PPqS6L//bmjT0tltIp0JhKyc619lfGuD8xqbDHr65K6qn9jRjQ3L/ODydHX4dMlY8rP3hg/47kK5eOcQleWuEXlk3BlRgnZkcjuNHL1qaeaCz7XeHYIRVIr7zbRTpchpy5YFdhLUqkr7KQLbHXTp9CIrU4c3nel/Vgy0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SJ0PR12MB8138.namprd12.prod.outlook.com (2603:10b6:a03:4e0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 19:19:54 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 19:19:50 +0000
Message-ID: <20dc5e9c-ad1a-9417-bfb2-95586ee117cd@amd.com>
Date: Mon, 20 Mar 2023 15:19:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 11/32] drm/amdgpu: add configurable grace period for unmap
 queues
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-12-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230125195401.4183544-12-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1P288CA0027.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::40)
 To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SJ0PR12MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: 924aacf4-388a-4939-304a-08db29781321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hIdx42XYwbNePjZ2DWlR9Z3MTntYWdSHZ0cHp6v9HHo2dODBYnJ//BSTq+B7PWJuTJsmoCTfbRpOuJhkHscrD0XnVZRfN5er8j1usQKYYIfW6qX9+G6qfqYvhOBarF880scf/rPabiMmwY3IQFqxqhPHPqoaXtbCoUsmWrdXsEw3MAgs/iePQHiFfavYfVGkJaxVZoJSLJdpBMANleYuRx7kKSKPZM12S0UsHY3J7r8YG0eckCKv8kjLS2RHUh+X4r43cirJIBTenQX8avDaGqCa0ru8w/os7uFdsTis6EjihFtxsHWjHxGsM33EItcHJZsZj/syTJ/vRRUALUPxSBdlYEE/j3jGkJxEULxLgMBrxYQO+D1ZdceWXH6fOMZyspdjp9ca+KP8WT85uqfD7kHapv7iJGdct1GnnJ+WUG2U/3mt+ColTTIk+WxiK0AwgakCYhcOGZ3DYSMMT6RuWMtDVz7EJIQnP6FoT6hCq+lDmEKsdGsH1wlByH7aLhCAUgldElbtdLWb440/d1zfagKBNaL1daMGyv3/Em3/AYlox23H6UTiQhVEdtUyJJ1M6JkijK3pMnBY14fuVqTFOh1TpvzBDKTatFqf+TTsxdMbGR0tObAmYM48sVAVWSN9+WGQcWPXJ0tq1At/mwp2iIKk4E/uf8mIa+FyCkiOlFnz2cNvb/dXmTnm5xZULiZo4yCDzekUidk8nxVghvvuQiIF3E6AvMefSYE/afIEfzQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199018)(86362001)(31696002)(36756003)(36916002)(83380400001)(66556008)(316002)(478600001)(450100002)(66946007)(8676002)(66476007)(186003)(6512007)(26005)(6506007)(53546011)(2616005)(31686004)(6486002)(38100700002)(66899018)(8936002)(5660300002)(30864003)(41300700001)(44832011)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1dFUVliVGc1WUJJVDAvaVFHbzZyNGZaR3ZRS1JxN3FERFZscjBKd0N3YUhK?=
 =?utf-8?B?T2hUcFp0Z2s4YXpHR0d3dHA3bnV5THMwK095MDc0ZTltOUpZbklibGZXTHJZ?=
 =?utf-8?B?QW5wMkFrbk9aS1lLS3BmdmdoTFJoSk90YlZMbDlYWGQ1ek84RDJESGtxN3lZ?=
 =?utf-8?B?VVdDUVpHbjZpbUdXcFU5VlJ3aWRpSG5aYnJRZXgrRWhUMGFjaWxyMlQ2Q1c3?=
 =?utf-8?B?V3FHQTltREtmTzlZaENKRFpkZXRXU0JIZ0RHWHdJK2lYZU9BVWhhaVh1T2Y3?=
 =?utf-8?B?R3hxSGxLbDlRbytxRGtYMndZYlVTZ2VxZUVOOGxHQWtIUzBsZ3pKb0hJbVhF?=
 =?utf-8?B?ZTFVOXRzZ1VTUTJ6cmdQSjFRWVpxbWc4bDN3T2dJajY1dnhBdFg5L3RPM1c3?=
 =?utf-8?B?cEowbHUvYTFhMEVMbVBDWFNsZlJNczljZHZlcVhvUG1XVzB5SWxXV0lTU0lp?=
 =?utf-8?B?MkZHZlhxaHJWVFhEN2Jza0NGOXRpUm9tQzRzUzFzcGxGWGlOQVprVjdmUDZo?=
 =?utf-8?B?ZG5TclBNa1VjQW4vcGtCUEM2UW11L0VvczdudTlNdkRyVlEvVTI4ZXk5V0c2?=
 =?utf-8?B?SGZselBqeUl6UmJuTTRwYXVPS2lQS2Fnakw2TGx4M2pMMWNET0JQVURCR2FY?=
 =?utf-8?B?eVhJdGNDcWRIcS9KdENhanlVZzFQcGtsOEJZS3BHbnViNmowdHdNTUx1elgw?=
 =?utf-8?B?eWFhT3BHQVZGUFJtd2hpZVNSd0d5ZmU3dGJGSTVDODg1SkdkV2VHVm5EWk5w?=
 =?utf-8?B?dmQ2bUs1WExBa0lRQTFSbnh3Lyt6VHkwZ21WWHRPZkhic2Q4ellMaTZZWnFH?=
 =?utf-8?B?WDE4ZFVGOW52cmVCOElManhmQlhxTmpyNDhzeW9YV0g0ZEl6ZThqU01aTW9C?=
 =?utf-8?B?VkhuOGpvNjRsV2dBL08xdDh5Z1RkRkJYUUZPWDlVdWZzcWRZKzZmSDgremJx?=
 =?utf-8?B?V1E1VG9YUDZWK1BaVnl5Q0VmSUxkL2RNZkFJN09ad3JVUjBsMWp5NDlHRExX?=
 =?utf-8?B?SjhzaUx3SWgrYlcvNjJBUThQbmsvNGpMU3ROQWcrU0VESjNWVVo4bWxBQno0?=
 =?utf-8?B?emRJR2VHeitrZTVsakpwWE43UlZja2FLV3J0eVA4T00rV3VNRGFTSjNTWkxS?=
 =?utf-8?B?ZFlES21qd3B5L2cweTNmVS8yYnZmYW1SSmF5RlNIRDJNNE1ZUWxIdmJMeTFI?=
 =?utf-8?B?WEVZMTlCSzExMlphSjBYQ1JuckF2d0pOMWJQK0tmZVQ5SGxyZVJPL0lpQUxI?=
 =?utf-8?B?OEhtck95ZDNzQ2tmZXNSaE9qQmJDa2k3Qjd4Tm02c0I5b2NicWdQQWdVektN?=
 =?utf-8?B?MlYraG1EVTcxSkx6NG1hYmo0STJucVQ3KzU2NGhKQ1pOYTR1MXlOWU9LUHpR?=
 =?utf-8?B?bWN5blVZT1cyQ1FXOGpYSVdFREVCTCt1VEZPUERaNEFxNVE0T1hmS0QxcE1C?=
 =?utf-8?B?bG1FSEdVS0hPNWRRZ0Rydm8wMWhWYXdOUXR5L2svSVdHSHMvQVJ4WGdJc2Y0?=
 =?utf-8?B?UHU1ZHo2TFJIR1lrek5RTVJhc2daRU5pVThOY3UyTndjajZoWXZ2WDJkTGtB?=
 =?utf-8?B?R0E3bjF6NGJYRW52dzhnSlQycEF4RjBNME9pNm1Ra3AvL0M0b1IwVURBTHo0?=
 =?utf-8?B?eWxrRnV3blhyVlJXK2lvUFNEaW44WWJBUWt6N1hrWnZyRWc2S3ZETldiL1U1?=
 =?utf-8?B?Y2hLMThSL2NjcGpPK0NsZ2wwc1RPNkE0VktDSGtzWHdXTGUxOHNwZTN2TDlQ?=
 =?utf-8?B?c1hVQVRadmVtT2VYYjVhMG5mWEZXTm5ST1hPc3FTYnVlN2h2a0RtWUNHMmJ5?=
 =?utf-8?B?TExUQ09NN1ZnVldabFlkZmt6QVBnR0VIczMrZFE3VXg1VThjbTV5bkVtMlNY?=
 =?utf-8?B?V0NtbkVsZGo2YnBWY01URy93bVd3dkR4QzByU0FrSENJb2tqNGxGOEM1STZ1?=
 =?utf-8?B?S3RYVVBXK1hnSFZtRmFkbHhCYUNEQVREQTlMbnhNOEtjcXdabTV6Sk1mWFN3?=
 =?utf-8?B?MXd2cXdZTUM0YkRXempqdWh2bTJUN3NBRy83VWI2cjNUdk1iaTNjbW5Da3Jp?=
 =?utf-8?B?N29jdEVOLzJYR0hpN3pFY2k5dlBuaUIvM2M3bFNmN2JlUkJBeVRxd2tUWTBY?=
 =?utf-8?Q?L7qGOWGHTGPkAK5TB5tuPMPdF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 924aacf4-388a-4939-304a-08db29781321
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 19:19:49.8375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +eq+3+TBdCxAM/ojihDA7vph4o+IlwCIMyN/78aDxqM1VftrVqz8QeCoF5qmdaQwxmVW4a0o1vZwwXWNTG+NYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8138
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

On 2023-01-25 14:53, Jonathan Kim wrote:
> The HWS schedule allows a grace period for wave completion prior to
> preemption for better performance by avoiding CWSR on waves that can
> potentially complete quickly. The debugger, on the other hand, will
> want to inspect wave status immediately after it actively triggers
> preemption (a suspend function to be provided).
>
> To minimize latency between preemption and debugger wave inspection, allow
> immediate preemption by setting the grace period to 0.
>
> Note that setting the preepmtion grace period to 0 will result in an
> infinite grace period being set due to a CP FW bug so set it to 1 for now.
>
> v2: clarify purpose in the description of this patch
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   .../drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c  |  2 +
>   .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  2 +
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    | 43 ++++++++++++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h    |  6 ++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  |  2 +
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 43 ++++++++++++
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h |  9 ++-
>   .../drm/amd/amdkfd/kfd_device_queue_manager.c | 61 ++++++++++++-----
>   .../drm/amd/amdkfd/kfd_device_queue_manager.h |  2 +
>   .../gpu/drm/amd/amdkfd/kfd_packet_manager.c   | 32 +++++++++
>   .../drm/amd/amdkfd/kfd_packet_manager_v9.c    | 39 +++++++++++
>   .../gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h   | 65 +++++++++++++++++++
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  5 ++
>   13 files changed, 291 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> index 89868f9927ae..a64a53f9efe6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> @@ -81,5 +81,7 @@ const struct kfd2kgd_calls aldebaran_kfd2kgd = {
>   	.set_vm_context_page_table_base = kgd_gfx_v9_set_vm_context_page_table_base,
>   	.enable_debug_trap = kgd_aldebaran_enable_debug_trap,
>   	.disable_debug_trap = kgd_aldebaran_disable_debug_trap,
> +	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
> +	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
>   	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> index d5bb86ccd617..ef8befc31fc6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> @@ -410,6 +410,8 @@ const struct kfd2kgd_calls arcturus_kfd2kgd = {
>   				kgd_gfx_v9_set_vm_context_page_table_base,
>   	.enable_debug_trap = kgd_arcturus_enable_debug_trap,
>   	.disable_debug_trap = kgd_arcturus_disable_debug_trap,
> +	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
> +	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
>   	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
>   	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> index c09b45de02d0..2491402afd58 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> @@ -801,6 +801,47 @@ uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
>   	return 0;
>   }
>   
> +/* kgd_gfx_v10_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
> + * The values read are:
> + *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
> + *     atomic_offload_wait_time -- Wait Count for L2 and GDS Atomics Offloads.
> + *     wrm_offload_wait_time    -- Wait Count for WAIT_REG_MEM Offloads.
> + *     gws_wait_time            -- Wait Count for Global Wave Syncs.
> + *     que_sleep_wait_time      -- Wait Count for Dequeue Retry.
> + *     sch_wave_wait_time       -- Wait Count for Scheduling Wave Message.
> + *     sem_rearm_wait_time      -- Wait Count for Semaphore re-arm.
> + *     deq_retry_wait_time      -- Wait Count for Global Wave Syncs.
> + */
> +void kgd_gfx_v10_get_iq_wait_times(struct amdgpu_device *adev,
> +					uint32_t *wait_times)
> +
> +{
> +	*wait_times = RREG32(SOC15_REG_OFFSET(GC, 0, mmCP_IQ_WAIT_TIME2));
> +}
> +
> +void kgd_gfx_v10_build_grace_period_packet_info(struct amdgpu_device *adev,
> +						uint32_t wait_times,
> +						uint32_t grace_period,
> +						uint32_t *reg_offset,
> +						uint32_t *reg_data)
> +{
> +	*reg_data = wait_times;
> +
> +	/*
> +	 * The CP cannont handle a 0 grace period input and will result in
> +	 * an infinite grace period being set so set to 1 to prevent this.
> +	 */
> +	if (grace_period == 0)
> +		grace_period = 1;
> +
> +	*reg_data = REG_SET_FIELD(*reg_data,
> +			CP_IQ_WAIT_TIME2,
> +			SCH_WAVE,
> +			grace_period);
> +
> +	*reg_offset = SOC15_REG_OFFSET(GC, 0, mmCP_IQ_WAIT_TIME2);
> +}
> +
>   static void program_trap_handler_settings(struct amdgpu_device *adev,
>   		uint32_t vmid, uint64_t tba_addr, uint64_t tma_addr)
>   {
> @@ -845,5 +886,7 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
>   	.set_vm_context_page_table_base = set_vm_context_page_table_base,
>   	.enable_debug_trap = kgd_gfx_v10_enable_debug_trap,
>   	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
> +	.get_iq_wait_times = kgd_gfx_v10_get_iq_wait_times,
> +	.build_grace_period_packet_info = kgd_gfx_v10_build_grace_period_packet_info,
>   	.program_trap_handler_settings = program_trap_handler_settings,
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> index 370d6c312981..0abc1e805180 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> @@ -26,3 +26,9 @@ uint32_t kgd_gfx_v10_enable_debug_trap(struct amdgpu_device *adev,
>   uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
>   					bool keep_trap_enabled,
>   					uint32_t vmid);
> +void kgd_gfx_v10_get_iq_wait_times(struct amdgpu_device *adev, uint32_t *wait_times);
> +void kgd_gfx_v10_build_grace_period_packet_info(struct amdgpu_device *adev,
> +					       uint32_t wait_times,
> +					       uint32_t grace_period,
> +					       uint32_t *reg_offset,
> +					       uint32_t *reg_data);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> index 73e3b9ae1fb0..c57f2a6b6e23 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> @@ -670,6 +670,8 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
>   	.get_atc_vmid_pasid_mapping_info = get_atc_vmid_pasid_mapping_info_v10_3,
>   	.set_vm_context_page_table_base = set_vm_context_page_table_base_v10_3,
>   	.program_trap_handler_settings = program_trap_handler_settings_v10_3,
> +	.get_iq_wait_times = kgd_gfx_v10_get_iq_wait_times,
> +	.build_grace_period_packet_info = kgd_gfx_v10_build_grace_period_packet_info,
>   	.enable_debug_trap = kgd_gfx_v10_enable_debug_trap,
>   	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> index 94a9fd9bd984..4a8bd266d3f6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> @@ -737,6 +737,24 @@ uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
>   	return 0;
>   }
>   
> +/* kgd_gfx_v9_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
> + * The values read are:
> + *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
> + *     atomic_offload_wait_time -- Wait Count for L2 and GDS Atomics Offloads.
> + *     wrm_offload_wait_time    -- Wait Count for WAIT_REG_MEM Offloads.
> + *     gws_wait_time            -- Wait Count for Global Wave Syncs.
> + *     que_sleep_wait_time      -- Wait Count for Dequeue Retry.
> + *     sch_wave_wait_time       -- Wait Count for Scheduling Wave Message.
> + *     sem_rearm_wait_time      -- Wait Count for Semaphore re-arm.
> + *     deq_retry_wait_time      -- Wait Count for Global Wave Syncs.
> + */
> +void kgd_gfx_v9_get_iq_wait_times(struct amdgpu_device *adev,
> +					uint32_t *wait_times)
> +
> +{
> +	*wait_times = RREG32(SOC15_REG_OFFSET(GC, 0, mmCP_IQ_WAIT_TIME2));
> +}
> +
>   void kgd_gfx_v9_set_vm_context_page_table_base(struct amdgpu_device *adev,
>   			uint32_t vmid, uint64_t page_table_base)
>   {
> @@ -921,6 +939,29 @@ void kgd_gfx_v9_get_cu_occupancy(struct amdgpu_device *adev, int pasid,
>   				adev->gfx.cu_info.max_waves_per_simd;
>   }
>   
> +void kgd_gfx_v9_build_grace_period_packet_info(struct amdgpu_device *adev,
> +		uint32_t wait_times,
> +		uint32_t grace_period,
> +		uint32_t *reg_offset,
> +		uint32_t *reg_data)
> +{
> +	*reg_data = wait_times;
> +
> +	/*
> +	 * The CP cannont handle a 0 grace period input and will result in
> +	 * an infinite grace period being set so set to 1 to prevent this.
> +	 */
> +	if (grace_period == 0)
> +		grace_period = 1;
> +
> +	*reg_data = REG_SET_FIELD(*reg_data,
> +			CP_IQ_WAIT_TIME2,
> +			SCH_WAVE,
> +			grace_period);
> +
> +	*reg_offset = SOC15_REG_OFFSET(GC, 0, mmCP_IQ_WAIT_TIME2);
> +}
> +
>   void kgd_gfx_v9_program_trap_handler_settings(struct amdgpu_device *adev,
>                           uint32_t vmid, uint64_t tba_addr, uint64_t tma_addr)
>   {
> @@ -964,6 +1005,8 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
>   	.set_vm_context_page_table_base = kgd_gfx_v9_set_vm_context_page_table_base,
>   	.enable_debug_trap = kgd_gfx_v9_enable_debug_trap,
>   	.disable_debug_trap = kgd_gfx_v9_disable_debug_trap,
> +	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
> +	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
>   	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
>   	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> index d39256162616..c0866497cb5c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> @@ -20,8 +20,6 @@
>    * OTHER DEALINGS IN THE SOFTWARE.
>    */
>   
> -
> -
>   void kgd_gfx_v9_program_sh_mem_settings(struct amdgpu_device *adev, uint32_t vmid,
>   		uint32_t sh_mem_config,
>   		uint32_t sh_mem_ape1_base, uint32_t sh_mem_ape1_limit,
> @@ -51,7 +49,6 @@ int kgd_gfx_v9_wave_control_execute(struct amdgpu_device *adev,
>   					uint32_t sq_cmd);
>   bool kgd_gfx_v9_get_atc_vmid_pasid_mapping_info(struct amdgpu_device *adev,
>   					uint8_t vmid, uint16_t *p_pasid);
> -
>   void kgd_gfx_v9_set_vm_context_page_table_base(struct amdgpu_device *adev,
>   			uint32_t vmid, uint64_t page_table_base);
>   void kgd_gfx_v9_get_cu_occupancy(struct amdgpu_device *adev, int pasid,
> @@ -67,3 +64,9 @@ uint32_t kgd_gfx_v9_enable_debug_trap(struct amdgpu_device *adev,
>   uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
>   					bool keep_trap_enabled,
>   					uint32_t vmid);
> +void kgd_gfx_v9_get_iq_wait_times(struct amdgpu_device *adev, uint32_t *wait_times);
> +void kgd_gfx_v9_build_grace_period_packet_info(struct amdgpu_device *adev,
> +					       uint32_t wait_times,
> +					       uint32_t grace_period,
> +					       uint32_t *reg_offset,
> +					       uint32_t *reg_data);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index a2ac98d06e71..7556f80d41e4 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -46,10 +46,13 @@ static int set_pasid_vmid_mapping(struct device_queue_manager *dqm,
>   
>   static int execute_queues_cpsch(struct device_queue_manager *dqm,
>   				enum kfd_unmap_queues_filter filter,
> -				uint32_t filter_param);
> +				uint32_t filter_param,
> +				uint32_t grace_period);
>   static int unmap_queues_cpsch(struct device_queue_manager *dqm,
>   				enum kfd_unmap_queues_filter filter,
> -				uint32_t filter_param, bool reset);
> +				uint32_t filter_param,
> +				uint32_t grace_period,
> +				bool reset);
>   
>   static int map_queues_cpsch(struct device_queue_manager *dqm);
>   
> @@ -839,7 +842,7 @@ static int update_queue(struct device_queue_manager *dqm, struct queue *q,
>   	if (dqm->sched_policy != KFD_SCHED_POLICY_NO_HWS) {
>   		if (!dqm->dev->shared_resources.enable_mes)
>   			retval = unmap_queues_cpsch(dqm,
> -						    KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0, false);
> +						    KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0, USE_DEFAULT_GRACE_PERIOD, false);
>   		else if (prev_active)
>   			retval = remove_queue_mes(dqm, q, &pdd->qpd);
>   
> @@ -1015,7 +1018,8 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
>   		retval = execute_queues_cpsch(dqm,
>   					      qpd->is_debug ?
>   					      KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES :
> -					      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
> +					      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
> +					      USE_DEFAULT_GRACE_PERIOD);
>   
>   out:
>   	dqm_unlock(dqm);
> @@ -1155,7 +1159,7 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
>   	}
>   	if (!dqm->dev->shared_resources.enable_mes)
>   		retval = execute_queues_cpsch(dqm,
> -					      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
> +					      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0, USE_DEFAULT_GRACE_PERIOD);
>   	qpd->evicted = 0;
>   	eviction_duration = get_jiffies_64() - pdd->last_evict_timestamp;
>   	atomic64_add(eviction_duration, &pdd->evict_duration_counter);
> @@ -1490,6 +1494,9 @@ static int initialize_cpsch(struct device_queue_manager *dqm)
>   
>   	init_sdma_bitmaps(dqm);
>   
> +	if (dqm->dev->kfd2kgd->get_iq_wait_times)
> +		dqm->dev->kfd2kgd->get_iq_wait_times(dqm->dev->adev,
> +					&dqm->wait_times);
>   	return 0;
>   }
>   
> @@ -1529,7 +1536,7 @@ static int start_cpsch(struct device_queue_manager *dqm)
>   	dqm->is_resetting = false;
>   	dqm->sched_running = true;
>   	if (!dqm->dev->shared_resources.enable_mes)
> -		execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
> +		execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0, USE_DEFAULT_GRACE_PERIOD);
>   	dqm_unlock(dqm);
>   
>   	return 0;
> @@ -1554,7 +1561,7 @@ static int stop_cpsch(struct device_queue_manager *dqm)
>   
>   	if (!dqm->is_hws_hang) {
>   		if (!dqm->dev->shared_resources.enable_mes)
> -			unmap_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0, false);
> +			unmap_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0, USE_DEFAULT_GRACE_PERIOD, false);
>   		else
>   			remove_all_queues_mes(dqm);
>   	}
> @@ -1596,7 +1603,8 @@ static int create_kernel_queue_cpsch(struct device_queue_manager *dqm,
>   	list_add(&kq->list, &qpd->priv_queue_list);
>   	increment_queue_count(dqm, qpd, kq->queue);
>   	qpd->is_debug = true;
> -	execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
> +	execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
> +			USE_DEFAULT_GRACE_PERIOD);
>   	dqm_unlock(dqm);
>   
>   	return 0;
> @@ -1610,7 +1618,8 @@ static void destroy_kernel_queue_cpsch(struct device_queue_manager *dqm,
>   	list_del(&kq->list);
>   	decrement_queue_count(dqm, qpd, kq->queue);
>   	qpd->is_debug = false;
> -	execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0);
> +	execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0,
> +			USE_DEFAULT_GRACE_PERIOD);
>   	/*
>   	 * Unconditionally decrement this counter, regardless of the queue's
>   	 * type.
> @@ -1687,7 +1696,7 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
>   
>   		if (!dqm->dev->shared_resources.enable_mes)
>   			retval = execute_queues_cpsch(dqm,
> -					KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
> +					KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0, USE_DEFAULT_GRACE_PERIOD);
>   		else
>   			retval = add_queue_mes(dqm, q, qpd);
>   		if (retval)
> @@ -1776,7 +1785,9 @@ static int map_queues_cpsch(struct device_queue_manager *dqm)
>   /* dqm->lock mutex has to be locked before calling this function */
>   static int unmap_queues_cpsch(struct device_queue_manager *dqm,
>   				enum kfd_unmap_queues_filter filter,
> -				uint32_t filter_param, bool reset)
> +				uint32_t filter_param,
> +				uint32_t grace_period,
> +				bool reset)
>   {
>   	int retval = 0;
>   	struct mqd_manager *mqd_mgr;
> @@ -1788,6 +1799,12 @@ static int unmap_queues_cpsch(struct device_queue_manager *dqm,
>   	if (!dqm->active_runlist)
>   		return retval;
>   
> +	if (grace_period != USE_DEFAULT_GRACE_PERIOD) {
> +		retval = pm_update_grace_period(&dqm->packet_mgr, grace_period);
> +		if (retval)
> +			return retval;
> +	}
> +
>   	retval = pm_send_unmap_queue(&dqm->packet_mgr, filter, filter_param, reset);
>   	if (retval)
>   		return retval;
> @@ -1820,6 +1837,13 @@ static int unmap_queues_cpsch(struct device_queue_manager *dqm,
>   		return -ETIME;
>   	}
>   
> +	/* We need to reset the grace period value for this device */
> +	if (grace_period != USE_DEFAULT_GRACE_PERIOD) {
> +		if (pm_update_grace_period(&dqm->packet_mgr,
> +					USE_DEFAULT_GRACE_PERIOD))
> +			pr_err("Failed to reset grace period\n");
> +	}
> +
>   	pm_release_ib(&dqm->packet_mgr);
>   	dqm->active_runlist = false;
>   
> @@ -1835,7 +1859,7 @@ static int reset_queues_cpsch(struct device_queue_manager *dqm,
>   	dqm_lock(dqm);
>   
>   	retval = unmap_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_BY_PASID,
> -			pasid, true);
> +			pasid, USE_DEFAULT_GRACE_PERIOD, true);
>   
>   	dqm_unlock(dqm);
>   	return retval;
> @@ -1844,13 +1868,14 @@ static int reset_queues_cpsch(struct device_queue_manager *dqm,
>   /* dqm->lock mutex has to be locked before calling this function */
>   static int execute_queues_cpsch(struct device_queue_manager *dqm,
>   				enum kfd_unmap_queues_filter filter,
> -				uint32_t filter_param)
> +				uint32_t filter_param,
> +				uint32_t grace_period)
>   {
>   	int retval;
>   
>   	if (dqm->is_hws_hang)
>   		return -EIO;
> -	retval = unmap_queues_cpsch(dqm, filter, filter_param, false);
> +	retval = unmap_queues_cpsch(dqm, filter, filter_param, grace_period, false);
>   	if (retval)
>   		return retval;
>   
> @@ -1908,7 +1933,8 @@ static int destroy_queue_cpsch(struct device_queue_manager *dqm,
>   		if (!dqm->dev->shared_resources.enable_mes) {
>   			decrement_queue_count(dqm, qpd, q);
>   			retval = execute_queues_cpsch(dqm,
> -						      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
> +						      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
> +						      USE_DEFAULT_GRACE_PERIOD);
>   			if (retval == -ETIME)
>   				qpd->reset_wavefronts = true;
>   		} else {
> @@ -2193,7 +2219,7 @@ static int process_termination_cpsch(struct device_queue_manager *dqm,
>   	}
>   
>   	if (!dqm->dev->shared_resources.enable_mes)
> -		retval = execute_queues_cpsch(dqm, filter, 0);
> +		retval = execute_queues_cpsch(dqm, filter, 0, USE_DEFAULT_GRACE_PERIOD);
>   
>   	if ((!dqm->is_hws_hang) && (retval || qpd->reset_wavefronts)) {
>   		pr_warn("Resetting wave fronts (cpsch) on dev %p\n", dqm->dev);
> @@ -2537,7 +2563,8 @@ int dqm_debugfs_hang_hws(struct device_queue_manager *dqm)
>   		return r;
>   	}
>   	dqm->active_runlist = true;
> -	r = execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0);
> +	r = execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES,
> +				0, USE_DEFAULT_GRACE_PERIOD);
>   	dqm_unlock(dqm);
>   
>   	return r;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> index a537b9ef3e16..fb48b124161f 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> @@ -37,6 +37,7 @@
>   
>   #define KFD_MES_PROCESS_QUANTUM		100000
>   #define KFD_MES_GANG_QUANTUM		10000
> +#define USE_DEFAULT_GRACE_PERIOD 0xffffffff
>   
>   struct device_process_node {
>   	struct qcm_process_device *qpd;
> @@ -256,6 +257,7 @@ struct device_queue_manager {
>   	struct work_struct	hw_exception_work;
>   	struct kfd_mem_obj	hiq_sdma_mqd;
>   	bool			sched_running;
> +	uint32_t		wait_times;
>   };
>   
>   void device_queue_manager_init_cik(
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
> index ed02b6d8bf63..c57f9a46dfcc 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
> @@ -369,6 +369,38 @@ int pm_send_query_status(struct packet_manager *pm, uint64_t fence_address,
>   	return retval;
>   }
>   
> +int pm_update_grace_period(struct packet_manager *pm, uint32_t grace_period)
> +{
> +	int retval = 0;
> +	uint32_t *buffer, size;
> +
> +	size = pm->pmf->set_grace_period_size;
> +
> +	mutex_lock(&pm->lock);
> +
> +	if (size) {
> +		kq_acquire_packet_buffer(pm->priv_queue,
> +			size / sizeof(uint32_t),
> +			(unsigned int **)&buffer);
> +
> +		if (!buffer) {
> +			pr_err("Failed to allocate buffer on kernel queue\n");
> +			retval = -ENOMEM;
> +			goto out;
> +		}
> +
> +		retval = pm->pmf->set_grace_period(pm, buffer, grace_period);
> +		if (!retval)
> +			kq_submit_packet(pm->priv_queue);
> +		else
> +			kq_rollback_packet(pm->priv_queue);
> +	}
> +
> +out:
> +	mutex_unlock(&pm->lock);
> +	return retval;
> +}
> +
>   int pm_send_unmap_queue(struct packet_manager *pm,
>   			enum kfd_unmap_queues_filter filter,
>   			uint32_t filter_param, bool reset)
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> index 18250845a989..f0cdc8695b8c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> @@ -251,6 +251,41 @@ static int pm_map_queues_v9(struct packet_manager *pm, uint32_t *buffer,
>   	return 0;
>   }
>   
> +static int pm_set_grace_period_v9(struct packet_manager *pm,
> +		uint32_t *buffer,
> +		uint32_t grace_period)
> +{
> +	struct pm4_mec_write_data_mmio *packet;
> +	uint32_t reg_offset = 0;
> +	uint32_t reg_data = 0;
> +
> +	pm->dqm->dev->kfd2kgd->build_grace_period_packet_info(
> +			pm->dqm->dev->adev,
> +			pm->dqm->wait_times,
> +			grace_period,
> +			&reg_offset,
> +			&reg_data);
> +
> +	if (grace_period == USE_DEFAULT_GRACE_PERIOD)
> +		reg_data = pm->dqm->wait_times;
> +
> +	packet = (struct pm4_mec_write_data_mmio *)buffer;
> +	memset(buffer, 0, sizeof(struct pm4_mec_write_data_mmio));
> +
> +	packet->header.u32All = pm_build_pm4_header(IT_WRITE_DATA,
> +					sizeof(struct pm4_mec_write_data_mmio));
> +
> +	packet->bitfields2.dst_sel  = dst_sel___write_data__mem_mapped_register;
> +	packet->bitfields2.addr_incr =
> +			addr_incr___write_data__do_not_increment_address;
> +
> +	packet->bitfields3.dst_mmreg_addr = reg_offset;
> +
> +	packet->data = reg_data;
> +
> +	return 0;
> +}
> +
>   static int pm_unmap_queues_v9(struct packet_manager *pm, uint32_t *buffer,
>   			enum kfd_unmap_queues_filter filter,
>   			uint32_t filter_param, bool reset)
> @@ -333,6 +368,7 @@ const struct packet_manager_funcs kfd_v9_pm_funcs = {
>   	.set_resources		= pm_set_resources_v9,
>   	.map_queues		= pm_map_queues_v9,
>   	.unmap_queues		= pm_unmap_queues_v9,
> +	.set_grace_period       = pm_set_grace_period_v9,
>   	.query_status		= pm_query_status_v9,
>   	.release_mem		= NULL,
>   	.map_process_size	= sizeof(struct pm4_mes_map_process),
> @@ -340,6 +376,7 @@ const struct packet_manager_funcs kfd_v9_pm_funcs = {
>   	.set_resources_size	= sizeof(struct pm4_mes_set_resources),
>   	.map_queues_size	= sizeof(struct pm4_mes_map_queues),
>   	.unmap_queues_size	= sizeof(struct pm4_mes_unmap_queues),
> +	.set_grace_period_size  = sizeof(struct pm4_mec_write_data_mmio),
>   	.query_status_size	= sizeof(struct pm4_mes_query_status),
>   	.release_mem_size	= 0,
>   };
> @@ -350,6 +387,7 @@ const struct packet_manager_funcs kfd_aldebaran_pm_funcs = {
>   	.set_resources		= pm_set_resources_v9,
>   	.map_queues		= pm_map_queues_v9,
>   	.unmap_queues		= pm_unmap_queues_v9,
> +	.set_grace_period       = pm_set_grace_period_v9,
>   	.query_status		= pm_query_status_v9,
>   	.release_mem		= NULL,
>   	.map_process_size	= sizeof(struct pm4_mes_map_process_aldebaran),
> @@ -357,6 +395,7 @@ const struct packet_manager_funcs kfd_aldebaran_pm_funcs = {
>   	.set_resources_size	= sizeof(struct pm4_mes_set_resources),
>   	.map_queues_size	= sizeof(struct pm4_mes_map_queues),
>   	.unmap_queues_size	= sizeof(struct pm4_mes_unmap_queues),
> +	.set_grace_period_size  = sizeof(struct pm4_mec_write_data_mmio),
>   	.query_status_size	= sizeof(struct pm4_mes_query_status),
>   	.release_mem_size	= 0,
>   };
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h b/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
> index a666710ed403..795001c947e1 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
> @@ -583,6 +583,71 @@ struct pm4_mec_release_mem {
>   
>   #endif
>   
> +#ifndef PM4_MEC_WRITE_DATA_DEFINED
> +#define PM4_MEC_WRITE_DATA_DEFINED
> +
> +enum WRITE_DATA_dst_sel_enum {
> +	dst_sel___write_data__mem_mapped_register = 0,
> +	dst_sel___write_data__tc_l2 = 2,
> +	dst_sel___write_data__gds = 3,
> +	dst_sel___write_data__memory = 5,
> +	dst_sel___write_data__memory_mapped_adc_persistent_state = 6,
> +};
> +
> +enum WRITE_DATA_addr_incr_enum {
> +	addr_incr___write_data__increment_address = 0,
> +	addr_incr___write_data__do_not_increment_address = 1
> +};
> +
> +enum WRITE_DATA_wr_confirm_enum {
> +	wr_confirm___write_data__do_not_wait_for_write_confirmation = 0,
> +	wr_confirm___write_data__wait_for_write_confirmation = 1
> +};
> +
> +enum WRITE_DATA_cache_policy_enum {
> +	cache_policy___write_data__lru = 0,
> +	cache_policy___write_data__stream = 1
> +};
> +
> +
> +struct pm4_mec_write_data_mmio {
> +	union {
> +		union PM4_MES_TYPE_3_HEADER header;     /*header */
> +		unsigned int ordinal1;
> +	};
> +
> +	union {
> +		struct {
> +			unsigned int reserved1:8;
> +			unsigned int dst_sel:4;
> +			unsigned int reserved2:4;
> +			unsigned int addr_incr:1;
> +			unsigned int reserved3:2;
> +			unsigned int resume_vf:1;
> +			unsigned int wr_confirm:1;
> +			unsigned int reserved4:4;
> +			unsigned int cache_policy:2;
> +			unsigned int reserved5:5;
> +		} bitfields2;
> +		unsigned int ordinal2;
> +	};
> +
> +	union {
> +		struct {
> +			unsigned int dst_mmreg_addr:18;
> +			unsigned int reserved6:14;
> +		} bitfields3;
> +		unsigned int ordinal3;
> +	};
> +
> +	uint32_t reserved7;
> +
> +	uint32_t data;
> +
> +};
> +
> +#endif
> +
>   enum {
>   	CACHE_FLUSH_AND_INV_TS_EVENT = 0x00000014
>   };
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index 62b75ba28425..d557a7ae756c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -1300,6 +1300,8 @@ struct packet_manager_funcs {
>   	int (*unmap_queues)(struct packet_manager *pm, uint32_t *buffer,
>   			enum kfd_unmap_queues_filter mode,
>   			uint32_t filter_param, bool reset);
> +	int (*set_grace_period)(struct packet_manager *pm, uint32_t *buffer,
> +			uint32_t grace_period);
>   	int (*query_status)(struct packet_manager *pm, uint32_t *buffer,
>   			uint64_t fence_address,	uint64_t fence_value);
>   	int (*release_mem)(uint64_t gpu_addr, uint32_t *buffer);
> @@ -1310,6 +1312,7 @@ struct packet_manager_funcs {
>   	int set_resources_size;
>   	int map_queues_size;
>   	int unmap_queues_size;
> +	int set_grace_period_size;
>   	int query_status_size;
>   	int release_mem_size;
>   };
> @@ -1332,6 +1335,8 @@ int pm_send_unmap_queue(struct packet_manager *pm,
>   
>   void pm_release_ib(struct packet_manager *pm);
>   
> +int pm_update_grace_period(struct packet_manager *pm, uint32_t grace_period);
> +
>   /* Following PM funcs can be shared among VI and AI */
>   unsigned int pm_build_pm4_header(unsigned int opcode, size_t packet_size);
>   
