Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 227F86AC780
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981CF10E2A6;
	Mon,  6 Mar 2023 16:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB2310E2A2;
 Mon,  6 Mar 2023 16:17:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hw14SJPMudhCrO1JV4TQZ8xOjCwn3jcPL4TXTE9MzFbHXXUwbqnBaFIqVhhBOxPY8nA89TnnlqV7XqB1wol2WHWXfgrEFMHt7Hf7blR6JBrnTvTDHCgjRY+dmOoTkqfEs5akWH5sL7r626rUcPa1bh+8XbXiafFxsqKJMZO2uv4o2/uporfbon8b2q0SS1LVxxuaz7cktg/JxcRkYj/mfWUAh00SmjoF7R39o2gPHJEFJM4ROqRklRMuIG6SZnudMWcF+hk4xpIh/OZ8nK+lJCObN+a3ikncg8TeHSp+AKtcNLZZj8k4xd4bbU1SOI4M18oZwpM2fGlOIE5wzKJ8sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5A/XbJAe3nKDJfqIO1xLh6RVBwIUyEfICfeq++VBZqo=;
 b=THPoTnOmY6ItrvUuP2mUd9IBY1645WDqODJyHmt9t/jlAvGq619dB17LuYlVvWUwfefE6wPhBwU7GG4HytvMNewuqFqxT4/FnIoGbzjRQ30vaVPAEfAL9BGNEH8/gu2TUfZ6db74gfkER1dUCcWkDU36cc3rPPRj8HVoPJL/QFoTASuhaiA61cDhqcV0o0/Wn7g9BB7pn7kqBIc6w+Pf7i0uVKodfaGSKSbrqXR2HLnGS8gEfzdZkEnRc0Y6Zc86n9gOQNLol8acHUGT10f5D/CfFcl/qz2mhxG029+WJ/S/JSh3HtVLTiouziwa5RjfZc/FdxH8AY5gXqY7jzX/ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5A/XbJAe3nKDJfqIO1xLh6RVBwIUyEfICfeq++VBZqo=;
 b=jJQdmhdBer5NYD3mbeTv1IQuc8xz5hA1FpgJRvf6+va+yowmCR+W2ZG+tEtsFFR3EyIw/OWXpFHx3GRmdAsiDdL2kJQVWwtAj1hr4Av12fa6qkNKqLoaNnX7Yjnks2dgB6HO+1yLfG4KcEiPbBriklzRqp+mbhFzJxLHTiCRpL8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN2PR12MB4469.namprd12.prod.outlook.com (2603:10b6:208:268::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 16:17:29 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%4]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 16:17:28 +0000
Message-ID: <7212f65a-4d2d-5ecd-235d-95b60f45a0e8@amd.com>
Date: Mon, 6 Mar 2023 11:17:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] amdgpu: Avoid building on UML
Content-Language: en-US
To: Peter Foley <pefoley2@pefoley.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230112-amduml-v1-1-5e4a0d37de16@pefoley.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230112-amduml-v1-1-5e4a0d37de16@pefoley.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0086.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::19) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MN2PR12MB4469:EE_
X-MS-Office365-Filtering-Correlation-Id: 05fe4c60-da80-4497-b7e1-08db1e5e47fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PkA1HwfQbsowCa0Y/JkAhVhAQu4bmCYc0AtpBED+OxeiaZxsY8ygO9xKGOq3HiLAjkvUir2bEGwcJW11nnFXO0wfMaG27OQ9wwvJHwccuQCZqYDjJGhWf/M88o5RxnE/51V83mLCp4GlYk1uuIbPdttYrMdoZ4j6a8o8Q93R6Np4AqHmxTC3ymvEFDpZGNvXTxvja2Ikcwnptwo890n5vqTsBkrR2ERS+Cd0vOWgyVk9UNZiMNABw0dtMIlEbIr51hDqatSKc60gglJSnOXXQOfsMSzFCybO1EaSLXllGdvEG944fgHlkI9G9SoaSD7f7MbKw/gUIg4/5TWCFK3OLn86T0Oxv1LHZL2uhud+26J6XjHU3c0TQTw+sCJNK0uEX48JQVQkaYSY+fhePJ6irU9GcpKX3Aqq4ZeYhpaUiQWq/0dek2y2YjOmAPthxocB4DJW+PV5iP0O0wweGRhvUm7+67g4l6upH9AbVx+fPxMN9BYds1YaZViDOa4KZyRC19gPvrXtbNNRknY4wlnWkuN5YqYaJdcUNS+3zGfHH+r7CmOY0AegNyx1ql78iVvj4t9rZeZJhU6kMZJf4OYNloTer+EyHoFyrMr6b0y+JRN08fVRwLUfehlIpbaFIFGR2qHS8QP3buvCbxsft5MmDZUwaVfz/6E/Hno8ow9FfAUt9ctMu1AVkm+qV3ecZNuAAyAwBTZ+oCNRjbqqadjGBCw5d8In6VdatbKb7zf7J94=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199018)(31696002)(86362001)(31686004)(186003)(26005)(6512007)(6506007)(8936002)(5660300002)(4326008)(41300700001)(8676002)(44832011)(66946007)(66556008)(36756003)(66476007)(6486002)(478600001)(2906002)(38100700002)(316002)(2616005)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmFjWVB3cUNCVXlDK1F0SlJheFR1MUFhYUtpY3NmOXFBMm5sTlp4bWdxNzNr?=
 =?utf-8?B?SU13NDRBMVFtTVcvRVZGQUJiUFhWVzhzam1WT2Y5WXFTdElSd3dua0dyMUFH?=
 =?utf-8?B?MUVjbDk3bzFhQ0JZbGlZK09ZYzNWWnFwU3FYV1Q2MGFmdWl3UDlWVG8wcjk5?=
 =?utf-8?B?SU54N2pqSDlmYlFpcndJSHFQaXgvZWlLZ3ZwQVd1TzNjZXEvbHdjWDVwcW1W?=
 =?utf-8?B?KzNHbC9rNUh6QSsycUFVVmtrNDhmWHVwRlVpeC90aVZmSkduMkh3TlAxYUpq?=
 =?utf-8?B?M2NmeHFBOS9mc1RhVDQxZzhEMG9OOTY5NnhmTVZvdFVSd2tCc0ZJcnl5QUN0?=
 =?utf-8?B?Ukk5WHcrWTJFNng4dE4xSVhlVEp5MWJnY1llVVliY2NPSG4xemk5cGs4RVNE?=
 =?utf-8?B?ZHJLNk5ITFlUb3MxcWZXYU1YbnA3Qnk4YW5LRW9JT0NQQTlQTzhSUTlROEYx?=
 =?utf-8?B?SUVYck5tZFFzYmQ1MFpjaDZBOUcyYktJRzNLMXZCeFROdzZ6Q0M1NU1ZalI3?=
 =?utf-8?B?L0N4cHMyOHRzc1lRMVFzaUxVdCs0OHplQXNVSW9FYSsxODNtRDlETm45ZC9o?=
 =?utf-8?B?ejd4dk9DbXU5Qjd2NE82bTBsaFpNcG0wNDhBYzZGUHdtOVE2aEFmMFlFMWJF?=
 =?utf-8?B?N3dScm5uVkpjUlh1RXNhQUE2UFdWQjZxT2dnb2s1bXMwWGVOajBmZWJ0cmV6?=
 =?utf-8?B?VXFmc3lzT2k5Rit3eitCYXM0ZEw0ZmhYQ0pIaWh5TkFNc2MzdVdxS00reTFC?=
 =?utf-8?B?bmF3WlRLUThmaXZod0lNdkN2ZXg1TkNXbEVKVzR4R29kN0JGTC9xSWFGSmFm?=
 =?utf-8?B?TWpxMFdYUEF0YVJOWkFCQmhCRWg1NmJtRCtyWkRyNURTMTJnODZPZHp0UW5o?=
 =?utf-8?B?b2NyTGxjNG1EaUFnUVB5NEZqNk9LMmVZNFRLdEFHQTFnQktIM1JnUHRicWVm?=
 =?utf-8?B?THdKZUxmV2Y1S3d0OElvYmJzMkdjQ2RYb3VFem1EU1NCbVFFYlVEbXF0cE1k?=
 =?utf-8?B?NXRsSkhmTGkyVkYyTTZUUDdYOHRuMHVEQUNJNFRSM3VSWlJiUDhiaFdEOFFJ?=
 =?utf-8?B?UVppL2ROU3ZDL3haMkUxUVBrNFBQOHo2WEdOQjVFbHlURUpXbVQ0aThNd0hi?=
 =?utf-8?B?d1VLTjFPR3VtTnFiRUIxRzBUWG5qVm9HaEhpOWNTa3Mxc2kyN3ViazNmNkVx?=
 =?utf-8?B?M3dvUzlicHIxZ0h1SzErcTZiZkJZQjZRUDMxNzVLcDl1anNQaGZEUm8wMHZR?=
 =?utf-8?B?alhwM0ZLd2l0OStkNkpCb0NxTWErUzdzc2laZkpaQm5VV3pLbzRUTGRMTFhZ?=
 =?utf-8?B?bzIxL3hKWUIxb25HZmFaT2dCRzBjUEhZM1gyL3JaUHJXTFpQcG9jK1gzUmpk?=
 =?utf-8?B?YW1sSzkrNStBOXRsZ21wNDlpS1FDZFlOc2tpUW9tN0txMHJnOExtUGpFSEdH?=
 =?utf-8?B?K2M3dmNkZERJS2FrZmN2S2ZSQnBGTWdUczJoL3UrVzdsblI4RDc1eld2MmRP?=
 =?utf-8?B?ZVZ4V1JSckNjUDh6SVZ2cWlCM2M1YmNNaFlFOHJEakRlN3FLMXdtUkh0K0Ns?=
 =?utf-8?B?QXAzdUtIMFpTa1RVSk9iSXdxRU1SODIzREdtc1NETWFSSlliZ1JFSG5DMkFs?=
 =?utf-8?B?d2tDTEtuRkRKc3IwQzhKZzk5WGJQSFBQZDhBclFSYnExUVdGTmJ6QlVNcm5q?=
 =?utf-8?B?SU4zQTRydk1xWWp4TThXY01MOW1mdzBvYWtoMDRGVGk2dHRhaUJaNUZobXg2?=
 =?utf-8?B?a3ZFd0pJQmtUNmRGN2p0d3pOUmJ4ZFlJMnhXME1LYlk2bGM0SERtcHp0RjVO?=
 =?utf-8?B?KzNqOUFaVzZYRWx4TnJPVG0wbHBGNThzN1JqTHR0ck84QkZkTkZMYjlXTk9C?=
 =?utf-8?B?VmExbkVQTjdwdllnUnJnbExkOUV0OWRJS3RoRS9neHZNTmkrcVM2NXg3K1BQ?=
 =?utf-8?B?aDlNM0EwWFMyWWhOdE5rb3RBam1zLzUwUE5yanZkRC93Ui9XMEljN2hMSzdM?=
 =?utf-8?B?MUV1VVNSRGZhK1RUU0JTREd2NGJORVdieHU0dE81T295eTRzY3htTGRuRXdy?=
 =?utf-8?B?REgzcVVhS2E5RG1wd1RzSU1JWFgvL1NFMERHMmZYZVBzdGV4cDFBUHRPVkd0?=
 =?utf-8?Q?R4M2wFVVMwGUv7XNA+lQtm3kz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05fe4c60-da80-4497-b7e1-08db1e5e47fe
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 16:17:28.8410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjvYZFulerTGVVPXMNfHVgSkUMa4Hoh8Bux/8nusqcpp3ySyZMBfxbncB1gclOjqf7ziqrIxTbDbS+ydVNacmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4469
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks like this patch got lost over the holidays. Alex, are you OK with 
applying this patch? Or are people looking for a more general solution 
to not build HW drivers for UML? FWIW:

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>


Am 2023-01-12 um 23:30 schrieb Peter Foley:
> The amdgpu driver tries to use fields not supported by UML's cpuinfo
> struct. Disable the driver when targeting UML to avoid tripping up
> allyesconfig.
>
> e.g.
> ../drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c: In function ‘intel_core_rkl_chk’:
> ../drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:1742:33: error: initialization of ‘struct cpuinfo_x86 *’ from incompatible pointer type ‘struct cpuinfo_um *’ [-Werror=incompatible-pointer-types
> ]
> ../drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c: In function ‘kfd_cpumask_to_apic_id’:
> ../drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2157:48: error: ‘struct cpuinfo_um’ has no member named ‘apicid’
>
> Signed-off-by: Peter Foley <pefoley2@pefoley.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
> index 5fcd510f1abb..aa0008ff8712 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> @@ -3,6 +3,7 @@
>   config DRM_AMDGPU
>   	tristate "AMD GPU"
>   	depends on DRM && PCI && MMU
> +	depends on !UML
>   	select FW_LOADER
>   	select DRM_DISPLAY_DP_HELPER
>   	select DRM_DISPLAY_HDMI_HELPER
>
> ---
> base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
> change-id: 20230112-amduml-565935d34bfb
>
> Best regards,
