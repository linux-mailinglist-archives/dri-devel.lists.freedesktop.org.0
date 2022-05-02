Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F028D51726A
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 17:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F04110EB66;
	Mon,  2 May 2022 15:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEF310EB25;
 Mon,  2 May 2022 15:22:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzU4ZNCtF0e7+xIQAt0F7sHFwT4ChfFXgxCqW7oZtZfpb3vxBMzD4qP03Q/BIBBQzNzsTPyFWqukKR0JldSA3pHupsDuotqMNf6kOJiCIYGcYuAvHqRNLAYMEauEL2T604EwJCP+VURZAcuJiwgK1ehM5MIA+/az5IEJC0QMlhzBpdZDykc9EGEgNpndd8RI2zuGGiKl/rC1lJHVXQi+t/KbYCZReO6Xz5L5kqpoOm6KM/FcVE4W3vfFfyQSkzYQddRudZYvc6afylf9dqgKJsQAUhVih9TEe9D+Je6BCsBHRH+GYWpnxkuA9xUxiJmO+QvX2a3xYlu/DNS/uqlnGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0f8JuskA0gOBfPlVzN5n1a0tANoPpJTjYaolxdLYAoc=;
 b=h1rB+3pvUd7QRytTK8/V147qjFPppBZXwT4RY+BISari+Yr1En3fZEe7jafdOAP2ZxN2cxo856uvFJk49iD3ANDzcMRh/fNeDnReL0JqaDiwnkK6TaNV3+mi0cti7mYe436tt/uzp+kKm7xGvh7sB/wnFRInC5Yi/LQRPsi4DQZz4WUc5ZBFGtk07izKNv4J/iC/0V0rPYUhUxkHd39VabNmyv4JpM1ZMcBGc5Kd+FdCtfEleTwXRCrVazaoMVXL4QuwR05pLnNMV4aHTPWL5N5P3PfslN8aHvTe3Vbkh+mLeNnZfaDL1zPlM6K9jmHBE8pYXKT4z8YHOywL2C3vFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0f8JuskA0gOBfPlVzN5n1a0tANoPpJTjYaolxdLYAoc=;
 b=1aCQe6iAINlGRQ4fYK8HKkTrc+cQ+U1eIQtFct1jRmz/u+OCNwLu0uxU/p7AnBvSF/ZSwtPmSs6MSXgk2nlteB5yvZZ5aPFaECIQYt9X1Sl9/6NXUm3SXPU6sm2+2lraMyrIiApQW5LHwovo4b0vmZXx5SjYyye7Fy5cuxp19gM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4526.namprd12.prod.outlook.com (2603:10b6:806:98::23)
 by CH2PR12MB3925.namprd12.prod.outlook.com (2603:10b6:610:21::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Mon, 2 May
 2022 15:22:06 +0000
Received: from SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::89d2:6db0:5fc9:cc03]) by SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::89d2:6db0:5fc9:cc03%5]) with mapi id 15.20.5206.024; Mon, 2 May 2022
 15:22:06 +0000
Message-ID: <19bacaa9-4b63-37d3-aefc-23b4efe54516@amd.com>
Date: Mon, 2 May 2022 10:22:02 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCHv5] drm/amdgpu: vi: disable ASPM on Intel Alder Lake based
 systems
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20220429160604.2608782-1-richard.gong@amd.com>
 <232384f1-c888-33f7-07dd-b99545f1b115@molgen.mpg.de>
From: "Gong, Richard" <richard.gong@amd.com>
In-Reply-To: <232384f1-c888-33f7-07dd-b99545f1b115@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR06CA0019.namprd06.prod.outlook.com
 (2603:10b6:208:23d::24) To SA0PR12MB4526.namprd12.prod.outlook.com
 (2603:10b6:806:98::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d958a7fe-b419-4fd9-37dc-08da2c4f8448
X-MS-TrafficTypeDiagnostic: CH2PR12MB3925:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB39250E42BA5644DB2A52DAC595C19@CH2PR12MB3925.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UfyNq1eOEFBhe6OICgGhWA/3LjNVWhFRVPxeYDuuEXbApYILgXDEybfQn1MgazMf4YxPrl4qfs5UUJNYKAh9JhC4LLTQsSGmUr/vp0O7RngHk6FeMZvhh+R9PgIBe2LMxJvdm6zf65GzlEpE6vmqOeLg8x7ZW+1BS1BI2rR5jaf4Ue0aaPc8J0ttA3KHAcuPWHvBqaYSVXMPo0a+Cbw/D9gK4LXlLSl96cQK454Zv8oSj5kLOwkExChtbXPCwAO1j+OFZhDp/vmzRPSDaTVyAz97rT8TTjl+4A+/dzGmxUXxzpemlaCpkb0OJRoKNAovrd+/MZ81KNYM4vOFjlBdKdcKuxfFejZ/f9LufCf+EpkJpyHKnmsZfm+ki48y9Xl+Z6F4WkcpJJzlS9/xzg4vUPaadI1OvikNMjwh2LqTpYfqFaKdGd4hfz127sCnbL1jDCh6xde6zUuUB8aw/zoVvIg6vnEP/+1xKOZ8wAX2OwRcqwotMAP5nzRyKAYr49LqlbWMQLLi971wZM9dk3vzyORS9nhaZ4kpEEa+Q6Cu62Uxcl15I1zGOrrgu0ZuuweuJkZW1yNGpNhTGcyCVmr/vaa+154OzqG0OrbfDjH9qwyRCd+67T6wi4tewgL7dTs0HHeZehcJ5R/ULS2uIH6PerY9/0khwpKQn5tY6E6mE4lIQ3Vi8hy3hi586P21rPH08deJms4y+2UmCZTwEpNzsOHDDWl/PIVq35SxWiiRv8f0NvKnxKdVHh8SItKsORr/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(66946007)(38100700002)(6512007)(31686004)(45080400002)(66556008)(8676002)(66476007)(8936002)(5660300002)(6916009)(2906002)(966005)(6486002)(508600001)(31696002)(86362001)(316002)(83380400001)(2616005)(36756003)(6666004)(186003)(26005)(6506007)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1gwTjY1QUFncVZIa25uOW94ZWlvYndXakd6RmlpMWpEdjZTK3VlVFRVa05q?=
 =?utf-8?B?QW9HNHVxT0Z6ZDdiQmFpaEtYZTVGS2JzTTFTa0JnUlN2Q1pTUWd1N1VqQUc4?=
 =?utf-8?B?WThackcrQ092NnN0LzI2cTVXQzZURnlRU2txV2FCUGNqRWRsaVdXMUo1T2Fs?=
 =?utf-8?B?b3NJSWxBeDBNblR4cWg3Q08vVUpkSkZEVUI5QWwyaFpBYUExZHc4YzAxUjNM?=
 =?utf-8?B?U2orLzV6TnB4d0YvQVhXaWVEeTlzeEpCcktscnZLOC85ZjFTNUlteVZBK3pS?=
 =?utf-8?B?MXFyeWpZUnYyVHRueEFicHpMbjkzcDdJeGpxR2ZxOHIvdVN0VG8rL3lSMTJx?=
 =?utf-8?B?L1hSbGVMSmdUb2E3bDRWdHBXY0wyaHdKN2hndGJuL0pIUy9VekRWRnl3WUIw?=
 =?utf-8?B?Nm1rYzFZYzBLVnVDUXAycWdSK1l5YVE0cCtaTEFCNm9NT1gzZmtjd0tHZURi?=
 =?utf-8?B?MjY0c0tWc25ITlNTV2p3V3pMVFJhTGg4V3NIOGNMZEJCbGZ6LzcwR0M1WHNk?=
 =?utf-8?B?OEt1TGRHT3M0cHJ5bzJWWUZCS3dzZCtVMUZKaFhPSzN0S1V4M3BQdVoveFhZ?=
 =?utf-8?B?blhrTmM2eHRGMmkrTnhvY3pZRkpoMFMyZFVLMVYwVkZCRFRIWGdYNWRzWFFa?=
 =?utf-8?B?MWROcjBYWW9TNzBLWlMwZVpWRGpDOWVrRUZmQUxSWlV1NDUwS0M3dGl6WjZB?=
 =?utf-8?B?MzZ5SE5KdGdJdDFhdlpmTmlJdXN6OElUb1ZQckd1OTcxSitUTzZ2QW0yVzdi?=
 =?utf-8?B?NUlBRlBHSGgxR1FSQ2pqRmt4djl2SXBFR1R5WGhwaUFjN0dGSHJqNzk3UWZx?=
 =?utf-8?B?OVIzY1VscEdkY09KcENpbHBmeUNDZ3VJakU2YUh3bEY2ek9YdDRDVEcvVjBZ?=
 =?utf-8?B?cVFubElWNkJoYW5zVWMyWkdWSFYxMUN6SkQ5S3ZiOHRQR0l1MzNKVUsrdWUy?=
 =?utf-8?B?WC9mcDU3L1RUd0pnbnVSa1hobFhYWHlyVU4yR3J4TS9ObTFISW8rMmF2UnNw?=
 =?utf-8?B?MmpRUHowazNUVzBKZDhkdmROVmdJdStCMS9SQWZla2xCWGZiaHBOb3VvZktD?=
 =?utf-8?B?eE5KaGRjWHgwdEZpQndtUjgrbjlHcFVqOE5TOWdGL2IxR3I3aEVta216Snk2?=
 =?utf-8?B?R3IxZllHRlZWeFhuNzBNU0ltUUsybXNqK21VMEpIZnlQU2JTUHNOQWEweGpJ?=
 =?utf-8?B?d09lbzNnT2NHMGZRWkhnbXdndkV3dDRhY0lLdHVuVEpmZ09yVUk3ekEvc25L?=
 =?utf-8?B?MzREWlNkdzMrVXBoT0M0RXI3SlpRVnNPRzJNdWJQRnR2Tlk0dmJvSVRlaE5o?=
 =?utf-8?B?dlNLcDc4UHVLUlA1MGlPTjhyWW9yWDhTRWI0VTNZVGY0amxCV3VtSzlVU2dq?=
 =?utf-8?B?VXlvYUpGL1FOdGx6WmpmYkU5a25wb0hRMUsrUEVrK3d2Z1JESjQ5eGtBai91?=
 =?utf-8?B?KzlUOUhCTjUycHBYV1EvME9UODdGdzAzdGpzbXl0MTYvcWhBOXN0MXdxU0ZO?=
 =?utf-8?B?L2t1VWR0UFIzWVY2ZG1NOW9oUUpGMU03WGpxM0dRRUNSNVNSSktDUTNNcWt5?=
 =?utf-8?B?b3BtdTFGQXZRbC9mT244R1kwQktJWm9RaCtzWktwSDFLSHRkVmRiam01cXVR?=
 =?utf-8?B?VmVDZ09nN3NBOU13QVRQMnAzdlFSMDY2OHlkTndHZit4dXRCZnE0b3hZVkdE?=
 =?utf-8?B?cXMwcDZLL21obGpwczBFM3pzRko5UDN6TFZQRHUyeGl2M3RWMWFqUTdBd01F?=
 =?utf-8?B?bmlza2I2R2ozU3dIMkNEY1pOMnBlckhNK0RkdldLSzhrUHlJTWN1dTlEeHhX?=
 =?utf-8?B?NWIwUTBaNzZFOXRNTlZtZFRHV1EwbXJLNlEzQ20xbnVzVmhHMGhBVkllVktJ?=
 =?utf-8?B?YWFNbjRBdXA3ZjNvUUk4TnBSVkNGRmdpQWR3QVlGNGlIYURKRmswVTNBK200?=
 =?utf-8?B?a3BJNmNFbEtEVWxnTUpDNlUxaGs2NkI1TEJra1BsNldoNGpHOWVVcDhUQ2k1?=
 =?utf-8?B?Z204LzJyTU13YzdXS2Y2bjlYSWl6ZDAxZldITVlpQXRCSksrTi8zcDhqZFJx?=
 =?utf-8?B?NDdmQWVaUEppUUZvb2J4WU5GemVxd1pYRGhDclVCNTZxUEluTy93OHFEZnNn?=
 =?utf-8?B?cGVYRDVFSDBOSEhCRjgyQkNURzlHanJPYmNRQTBLWkZ5Y3VCMVpxb0hNbExM?=
 =?utf-8?B?Y256K2dPQndQNCtreWg2Y2dna0NPcWpFcGRwaHlnWDRCM1JUT1ZDdmVzUUZV?=
 =?utf-8?B?K284K1kvb05WVkxCZXhnMWV5dU56b2t6YW5HNXM5TGdtb0pqUmx1U0VpK0hH?=
 =?utf-8?B?WmlpNGpzODNNdDN2b2RYUVJrQmgvY1JsWnRzOTh3UmxtUFJBN2NYQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d958a7fe-b419-4fd9-37dc-08da2c4f8448
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 15:22:06.1428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouGWeFGD5u6WRIEtllWq8hwlevSCx6HFvXEN1QK0sOqecQ/QQVvrV1gh8VkMQziGI8dyyB4IK2RQ59e2niYC3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3925
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
Cc: kernel test robot <lkp@intel.com>, airlied@linux.ie, xinhui.pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

On 5/1/2022 2:14 AM, Paul Menzel wrote:
> Dear Richard,
>
>
> Am 29.04.22 um 18:06 schrieb Richard Gong:
>> Active State Power Management (ASPM) feature is enabled since kernel 
>> 5.14.
>> There are some AMD Volcanic Islands (VI) GFX cards, such as the 
>> WX3200 and
>> RX640, that do not work with ASPM-enabled Intel Alder Lake based 
>> systems.
>> Using these GFX cards as video/display output, Intel Alder Lake based
>> systems will freeze after suspend/resume.
>
> As replied in v4 just now, “freeze” is misleading if you can still run 
> `dmesg` after resume.
As my comments in v4, we can't run 'dmesg' when issue occurred. User 
have to recycle power to reset the system.
>
>
> Kind regards,
>
> Paul

Regards,

Richard

>
>
>> The issue was originally reported on one system (Dell Precision 3660 
>> with
>> BIOS version 0.14.81), but was later confirmed to affect at least 4
>> pre-production Alder Lake based systems.
>>
>> Add an extra check to disable ASPM on Intel Alder Lake based systems 
>> with
>> the problematic AMD Volcanic Islands GFX cards.
>>
>> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
>> Link: 
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1885&amp;data=05%7C01%7Crichard.gong%40amd.com%7C78173acb0fe3463fead808da2b423e81%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637869860787352219%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=TK3Ur99Ro4OczgUlCpdod6CrvgGJvNZAyUfpzKEqExw%3D&amp;reserved=0
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Richard Gong <richard.gong@amd.com>
>> ---
>> v5: added vi to commit header and updated commit message
>>      rolled back guard with the preprocessor as did in v2 to correct 
>> build
>>      error on non-x86 systems
>> v4: s/CONFIG_X86_64/CONFIG_X86
>>      enhanced check logic
>> v3: s/intel_core_aspm_chk/aspm_support_quirk_check
>>      correct build error with W=1 option
>> v2: correct commit description
>>      move the check from chip family to problematic platform
>> ---
>>   drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c 
>> b/drivers/gpu/drm/amd/amdgpu/vi.c
>> index 039b90cdc3bc..45f0188c4273 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
>> @@ -81,6 +81,10 @@
>>   #include "mxgpu_vi.h"
>>   #include "amdgpu_dm.h"
>>   +#if IS_ENABLED(CONFIG_X86)
>> +#include <asm/intel-family.h>
>> +#endif
>> +
>>   #define ixPCIE_LC_L1_PM_SUBSTATE    0x100100C6
>>   #define PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK 
>> 0x00000001L
>>   #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK 
>> 0x00000002L
>> @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct 
>> amdgpu_device *adev)
>>           WREG32_PCIE(ixPCIE_LC_CNTL, data);
>>   }
>>   +static bool aspm_support_quirk_check(void)
>> +{
>> +#if IS_ENABLED(CONFIG_X86)
>> +    struct cpuinfo_x86 *c = &cpu_data(0);
>> +
>> +    return !(c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
>> +#else
>> +    return true;
>> +#endif
>> +}
>> +
>>   static void vi_program_aspm(struct amdgpu_device *adev)
>>   {
>>       u32 data, data1, orig;
>>       bool bL1SS = false;
>>       bool bClkReqSupport = true;
>>   -    if (!amdgpu_device_should_use_aspm(adev))
>> +    if (!amdgpu_device_should_use_aspm(adev) || 
>> !aspm_support_quirk_check())
>>           return;
>>         if (adev->flags & AMD_IS_APU ||
