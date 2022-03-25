Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A1C4E6E6E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 07:58:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E03410ED18;
	Fri, 25 Mar 2022 06:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A02B10ED18;
 Fri, 25 Mar 2022 06:58:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/S3LMHUas/Fj19fS93S+zCD9p5/glHVyP08YCJlhGvSODTntPXQcNBXpGm1LqoVSBRP7qZVOndyDIp/doQIibFbBmeVijTev+6vHhlOrppq7pvzAd63I+rJiw3aNa05j30u+M44pxSTluMXiRXMtDQh84dq4tnOSHcjgH3asTlKjdQBke4pBzJrEkr2fmleWmXdolEAUkO/A8B+P4zDldH8poK8tjP7oTCcoSrdYQ2ulVxG54jOkewqZPaZjUxQr/vtezXszK7S5rrecES9DJOpp097hh4/lxC6T6AuSYLnDI2zM+/GDx83Mh9+oB7o6HMpz7JpdzTMhZhzwRfrMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCGYO3Bura0e2tky5kDzaxkj+p0yfec8xezurPKAmTs=;
 b=TuI1Eqr8E1UQMv2DEWuBd/33ulaqLfxKhbZzSIrsDcc3qqe64xz8FLFI6tiIdZVrcS6MEpR+jFHAp53eP2qyQQacaZPDmmOULvOg6P+uB+wISBoIk6KSSJTt0KvC5QG+eqHH24L3k/aEJ8hhvnmKwREif6pCnyd9noRzmjux+lhWQj99FxS+/Dnjww+0wmul/OJaW3uJh0KUsBq80Lfe8OI3EnjAkiuwbSYLD2fOQvaVkuM4p3z7H5hR4C1Cr/0IzOsI0JgeBfBPirDclHv01f016cU+1FgXVzpZnCNL0j10/tYEdvFW6SJd8DiVHMkhjdenIUs521xA8jkB/FEIgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCGYO3Bura0e2tky5kDzaxkj+p0yfec8xezurPKAmTs=;
 b=A8FrB4dd+lfs7wfWcyRVLAgq4JSbOyzs3jggKffznBhbaz/T6H4yeu5z1Rk94WLmKPz/bnx/1YVMoKsyQd2A8B4un7lDjRhb/Ysjd0ZMq4vCzfd8ILvgIX9uGSc+Zvew+DazT7cbTYYF+6GEE5zdJpIMilbAjlhmikCpBXzXdvo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB3794.namprd12.prod.outlook.com (2603:10b6:a03:1aa::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Fri, 25 Mar
 2022 06:58:21 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.017; Fri, 25 Mar 2022
 06:58:20 +0000
Message-ID: <2125c5b2-b377-076a-4177-d5ef482eb657@amd.com>
Date: Fri, 25 Mar 2022 07:58:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/25] drm/amdgpu: Disable ABM when AC mode
Content-Language: en-US
To: Ryan Lin <tsung-hua.lin@amd.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, David1.Zhou@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, seanpaul@chromium.org,
 bas@basnieuwenhuizen.nl, nicholas.kazlauskas@amd.com, sashal@kernel.org,
 markyacoub@google.com, victorchengchi.lu@amd.com,
 ching-shih.li@amd.corp-partner.google.com, Rodrigo.Siqueira@amd.com,
 ddavenport@chromium.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 leon.li@amd.com
References: <20220325040515.4073706-1-tsung-hua.lin@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220325040515.4073706-1-tsung-hua.lin@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0012.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c920c1f7-0b35-411d-9e0b-08da0e2cd8ce
X-MS-TrafficTypeDiagnostic: BY5PR12MB3794:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB3794291FF3BA333ED109C251831A9@BY5PR12MB3794.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iJHd6nJaYBlxT9O7rm8CS/CFOs8XyPns1mdgOJz0VdxHF2DhyaHJWuJdwH3JPdF8ABM+oKoindWQQKjcgoGaaYpvddjGby07QjzPWcLy3qpeABjKw2TbOkkfqRqXPa9Q6Q1283xOlXSsOp80Oa1xo2c+qV0KO/PcBcBFwIWRCQupHWJpduLw41t2kKqD/wx0KChHAODJvbvSK/pBRfa2nTzC5nVHDSC6rFGmNrSOIrZEleD93fWYLr9jVyIvkNzuc3L8eKwrJ2nFm/gPYJ8W4MIOao6eVwHsu28PVo9D1htuyFSlKODrn3ynj5ZlLn5qsIXEz/AqFRmp86OmIqy9BUmUEc/SHzH4+eP1SF5cKBwd2i/CLs8zkbY4lP1Ej170czsq8e0yJklqmCGHeR1Ppq7HtIzquS/+E4lyyIOysvhI8g9RJXE5bJ0rAmt51T+F4rnNWQSqo2XlGrT1eZHnr68If5BolqZhtIxLUivw4e3OKKRZUlVFl4c9EO6fVXTP5Mp3cdaRPasS3wqyWTaAMZNfcZ5ZOoucnlqHlFU++4Qbzs+MyqhCAuPAHMO3SyltStg7V7J9HxYZW4WAVVTBsPYMe4ACY4CsQqYN1bJHX3KXRhZ+2qYbU/ZOQBE+CaDdDKighKwAlwy/Y10yUBJzfvT2pLYxNl10GGlSTvZEbn9+2EiTVjaz17WrD3vTO2yf2xtUpQMkQJ7xF4IGJ6+KESY90nLVEi2t2cDw3BH3QShU4vn6uvHauu5NgTKPnDwr+BW8FWPLH8gdZdngZbP65w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(66946007)(8676002)(66556008)(31686004)(6512007)(31696002)(66476007)(2906002)(5660300002)(26005)(316002)(7416002)(6486002)(186003)(36756003)(508600001)(83380400001)(921005)(6636002)(38100700002)(6666004)(2616005)(6506007)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVU3aWgxOW1ONU5yVWRSY3hrQ1JtM2phb04yWnhmd0ZUeFlGK3hSQ2VscFhN?=
 =?utf-8?B?SlR6T2ZLSGlkcldROURSdFZMcEEyalZsV3RaUTBwczM0NzdpdkZyOWlHU0Uz?=
 =?utf-8?B?czVKajNHZDhhZ3RRL3pXcFNHOHFZd0c3YUVCaXRoWlNrdzdhb0M2WGdFWXZP?=
 =?utf-8?B?dVVwN0I5cmxpWUZxaHhScTRISzdCd21ENk1RVkpQYW9BSU1QNCtEU05EajFr?=
 =?utf-8?B?bG9BMmVMNFlpejhCeUM4U2kvdmlIMDBaMUduZlMxODlsS1lZRlpLdUFwRG9I?=
 =?utf-8?B?U3BRblRmRDVhemhwNmtZcG5BUFV0ZytOTGlJUmgwSUd2ZDMzaHJDWm85Y203?=
 =?utf-8?B?UVMrdkV2RHc3Nm5kcWQ2TmNUVm1TVEw0ZTVBSVh6U3dldVFpMDY5NzNEVXFL?=
 =?utf-8?B?S2ZpZ0dhNjVWcXRqMkZ0TVo2cmt5cW5iQkRLY0VKUHZhbDBWV1MrVHdJNTZP?=
 =?utf-8?B?cjdEcjAzQTFpOFVMaTMxQnBDTGcyQkUvS3NLODlGbHZML1NNbEdRLzBVVGw1?=
 =?utf-8?B?SXZnckUzVXhsNmtVQnUvNU9VbTJabUpJK3ZMd1pWZnpINjFqMkM0dnVKWHdF?=
 =?utf-8?B?RDB4REU0U05menYwbGx5Z3RPcnA3VWY0M0dzWFhHQkoyemQ1VmRIaERlTVFI?=
 =?utf-8?B?NE02Uk1xU1ZNaTFKTWw1b21GS0pyZjhURWh4RUtONUNSamgyUENoMmFJL2Nw?=
 =?utf-8?B?VGY4M1d0OXhRSko2dHFhNWM4bE9BcitLVCtUQ1RkWWhxamxtY1FOcG1pQjY4?=
 =?utf-8?B?WWlkRzdJODFnQWFvcXBsL1BXTWswWmp0YVFxQ1A1aU1SZzVSSUgrUEREck1E?=
 =?utf-8?B?d00veEd2dWZzS1hLYkFzeW9pTVN4VEhQRFF4VmNBVEw1ZGxoamYwTEx5b25N?=
 =?utf-8?B?NHhjRkV4NHJHRDJEbllSbUxUV1ZEK0NyeVFXR3Y4blFKT3U1K2VKU0JjRE5m?=
 =?utf-8?B?T3BZQjYyTnN5UVg3YWFFdXJHWUZPR2c5Y1ZCcWhJNnZiTUlpQW1YOUNGZ1dx?=
 =?utf-8?B?NzlPMjZUQTZXbnNPRU1nTlF0UHFnMjJjV2RsY2RWbG4vMWNtK0piNEY5cXJV?=
 =?utf-8?B?NTQ2eHZOaFcrUm9GSDdQaitLSm80eUhIa0o4YzU1NnVWeUI5OEpHWEhxenBy?=
 =?utf-8?B?MXZlbXV5NE5VQlFmZC9vVjMyRHN2SFFpdUhyL3NEYlFSMFJueU5RdVVDZytq?=
 =?utf-8?B?TGFKN2I1d2E1bkJnZkVYZ0Q0YW9nOHpuTTZmZWFuSzM0NzRxOGNtRjhXdFNZ?=
 =?utf-8?B?VmxWdGdLaWpvVXBFOTRPbkRXR2FSeFJndTRVVndEdnU5Tk5tNTEvV052QzJG?=
 =?utf-8?B?SE84b3loejFsMnhHWStObUVJRVhURlFLb1p1QmgxcHEyZ3dhY3dzN2tZUVdP?=
 =?utf-8?B?NHZXOHR1b29iWDhyMkNFMERGK2x4VXkwemR2bnBNV3l1T00rRzc0bGs3VDVm?=
 =?utf-8?B?ZU9yellGcFh2ZUh0TjBLeTZnQlpDSWFpcWxSb0g1cTVOMlVCM0MxcEJOeWhX?=
 =?utf-8?B?QzdoalNNUFJIYmRIREFMeEFRa2ErRk5VVWtzcERYeW9WdDdRTm9Qck5JS1ky?=
 =?utf-8?B?QUJNYnN5UlMxdHk5bFBSZlpvcThCemFFTkhTeVF5a2NoS2hDYzRwU09KOHlu?=
 =?utf-8?B?cEN1SFZKbjVOZStNb2Q0MDgxUnhqcjgvZ2xDb29RNWtEMkM5eE0yVjNocm5E?=
 =?utf-8?B?TmFFRHhja0c0dS9TM0tlUlliTjMvWHlCVEx5TGdZdFlPU1dnQk1rRHZjc2sr?=
 =?utf-8?B?YWIrclFlSXhBYnBkMUxkZU1PdFVIS0QvekNGV1JnbFNNT0R6VGdONWNCVmlM?=
 =?utf-8?B?aUxQTVR2cVZxTlJ5Y0FDNTNDQkk2SlJnT3ZzRHBGRUNsb1hFWThGQmV1N2dp?=
 =?utf-8?B?NFVRbkE0LzllKzdRdzhKSS9KZmJHWVVEcm9kOTVGWUFHL2phVTMrTVpFOGZk?=
 =?utf-8?B?NHRlQ1A4MmJxSEF3TDFEZ3FGZEwwRFJWSVNSV2FEQy8wZHR5Tk5Zd09ZNk9y?=
 =?utf-8?B?MU84TDNTenBob1RxWDdtVXpvNXZjZTB5cFBIVlBhRUZRa3Nid0tkZ1dlcTFh?=
 =?utf-8?B?eW9BbUdTYk1XU3pJWHRqWHlWaDNYVER0SnNLTjVnNGY4YjZ3SUgxMGJQOHNQ?=
 =?utf-8?B?Zlg5emVYc2VvOTVmdE4wc0hoU1RPL3VrQ3BKc29vb1pwMERTME1FSFJOUlVq?=
 =?utf-8?B?ZS9SMThrNnJJZm9Pbk0zNS93TGZIcktJak0rdUdNdXVrMVlUV21tb1FlS0hj?=
 =?utf-8?B?eWlvMElJOEtPZmFBMXJwUGM1UG9YeFNnV2ZnblNqdGVQUGt6bHNwVk5lS3Yv?=
 =?utf-8?B?NXhrUzNYWUVvSm43RURqaU9DSWlPVnBOcStIbjlDeTk4UjBacVNjdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c920c1f7-0b35-411d-9e0b-08da0e2cd8ce
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 06:58:20.7147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9i7SkFahVMssI8iobMqNUchJpVpGBx5WXrTMvIuzk7ixdnZ1xiv4fkkWvzMq+3me
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3794
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

Am 25.03.22 um 05:05 schrieb Ryan Lin:
> Disable ABM feature when the system is running on AC mode to get
> the more perfect contrast of the display.
>
> Signed-off-by: Ryan Lin <tsung-hua.lin@amd.com>
>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  4 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  1 +
>   drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c | 58 ++++++++++++-------
>   drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h       |  1 +
>   4 files changed, 42 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index c560c1ab62ecb..bc8bb9aad2e36 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -822,6 +822,10 @@ static int amdgpu_acpi_event(struct notifier_block *nb,
>   	struct amdgpu_device *adev = container_of(nb, struct amdgpu_device, acpi_nb);
>   	struct acpi_bus_event *entry = (struct acpi_bus_event *)data;
>   
> +	if (strcmp(entry->device_class, "battery") == 0) {

String comparison in a hot path is not something we usually like to see 
in the kernel.

Isn't there any other way to detect that? Like a flag or similar?

Regards,
Christian.

> +		adev->pm.ac_power = power_supply_is_system_supplied() > 0;
> +	}
> +
>   	if (strcmp(entry->device_class, ACPI_AC_CLASS) == 0) {
>   		if (power_supply_is_system_supplied() > 0)
>   			DRM_DEBUG_DRIVER("pm: AC\n");
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index abfcc1304ba0c..3a0afe7602727 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3454,6 +3454,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   
>   	adev->gfx.gfx_off_req_count = 1;
>   	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
> +	adev->pm.old_ac_power = true;
>   
>   	atomic_set(&adev->throttling_logging_enabled, 1);
>   	/*
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> index 54a1408c8015c..478a734b66926 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
> @@ -23,6 +23,8 @@
>    *
>    */
>   
> +#include <linux/power_supply.h>
> +#include "amdgpu.h"
>   #include "dmub_abm.h"
>   #include "dce_abm.h"
>   #include "dc.h"
> @@ -51,6 +53,7 @@
>   #define DISABLE_ABM_IMMEDIATELY 255
>   
>   
> +extern uint amdgpu_dm_abm_level;
>   
>   static void dmub_abm_enable_fractional_pwm(struct dc_context *dc)
>   {
> @@ -117,28 +120,6 @@ static void dmub_abm_init(struct abm *abm, uint32_t backlight)
>   	dmub_abm_enable_fractional_pwm(abm->ctx);
>   }
>   
> -static unsigned int dmub_abm_get_current_backlight(struct abm *abm)
> -{
> -	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
> -	unsigned int backlight = REG_READ(BL1_PWM_CURRENT_ABM_LEVEL);
> -
> -	/* return backlight in hardware format which is unsigned 17 bits, with
> -	 * 1 bit integer and 16 bit fractional
> -	 */
> -	return backlight;
> -}
> -
> -static unsigned int dmub_abm_get_target_backlight(struct abm *abm)
> -{
> -	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
> -	unsigned int backlight = REG_READ(BL1_PWM_TARGET_ABM_LEVEL);
> -
> -	/* return backlight in hardware format which is unsigned 17 bits, with
> -	 * 1 bit integer and 16 bit fractional
> -	 */
> -	return backlight;
> -}
> -
>   static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>   {
>   	union dmub_rb_cmd cmd;
> @@ -148,6 +129,9 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>   	int edp_num;
>   	uint8_t panel_mask = 0;
>   
> +	if (power_supply_is_system_supplied() > 0)
> +		level = 0;
> +
>   	get_edp_links(dc->dc, edp_links, &edp_num);
>   
>   	for (i = 0; i < edp_num; i++) {
> @@ -170,6 +154,36 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>   	return true;
>   }
>   
> +static unsigned int dmub_abm_get_current_backlight(struct abm *abm)
> +{
> +	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
> +	unsigned int backlight = REG_READ(BL1_PWM_CURRENT_ABM_LEVEL);
> +	struct dc_context *dc = abm->ctx;
> +	struct amdgpu_device *adev = dc->driver_context;
> +
> +	if (adev->pm.ac_power != adev->pm.old_ac_power) {
> +		dmub_abm_set_level(abm, amdgpu_dm_abm_level);
> +		adev->pm.ac_power = power_supply_is_system_supplied() > 0;
> +		adev->pm.old_ac_power = adev->pm.ac_power;
> +	}
> +
> +	/* return backlight in hardware format which is unsigned 17 bits, with
> +	 * 1 bit integer and 16 bit fractional
> +	 */
> +	return backlight;
> +}
> +
> +static unsigned int dmub_abm_get_target_backlight(struct abm *abm)
> +{
> +	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
> +	unsigned int backlight = REG_READ(BL1_PWM_TARGET_ABM_LEVEL);
> +
> +	/* return backlight in hardware format which is unsigned 17 bits, with
> +	 * 1 bit integer and 16 bit fractional
> +	 */
> +	return backlight;
> +}
> +
>   static bool dmub_abm_init_config(struct abm *abm,
>   	const char *src,
>   	unsigned int bytes,
> diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> index f6e0e7d8a0077..de459411a0e83 100644
> --- a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> +++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> @@ -445,6 +445,7 @@ struct amdgpu_pm {
>   	uint32_t                smu_prv_buffer_size;
>   	struct amdgpu_bo        *smu_prv_buffer;
>   	bool ac_power;
> +	bool old_ac_power;
>   	/* powerplay feature */
>   	uint32_t pp_feature;
>   

