Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD0DB807D9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 17:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B93C10E578;
	Wed, 17 Sep 2025 15:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oLEYpBhK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010023.outbound.protection.outlook.com [52.101.85.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2116210E578
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 15:22:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7n5NZlKgbtJF0sOECiQK/t2F0lq/fv2pU7Z7dSy6aY3X9/TjRUNiWwt+aVkqo9mcIXIypECyVOcqGkFnvMAz8iEyU7xOmVyWZNN272ZS1NlxsBd+FXISlmwQhj3aI2/Nouf9naYiM4PQR6b1MqsebUrua9ZjUXgOzili9kaiFbtMzHMTBjzHw95XaJyTU8c5ymGz6YNZg2y2Be4ehSYyp5USHyRKQFg8dLLnTcdC6Z3EAViP6JrG0rF0DHC/K91YssIAI74nut76FJ+MOmNY51+t53Gk7BwBYmzOJvYKHAO35Gk7wlFuithSdao8flmlG/pEuSH+ZP5IE68Ej7BeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEYx+A+oZdSSrIuuKhTCh6kJnhKO+eyHAdXAPkl4MMk=;
 b=xMdstS0dDM6PRuj37uyf1suuV5eDw1fzhHF1bOsMkw9dYoineh2BkrJNxVCELf1kBfwGgiiuwmb3pqpvxpLG2JdWekWorrZNxUx/ompIQBVYRgIG/SkI8WIuEN8LVWqvD8R2k4gUgvINy63zpto4013/2hcrPv/RwgDfw6YmdhsykWy+47unz+a+KCERPWgKeYdsF+s5V7be7WWOiAGEpKptfzYfbdR68FQDDt2Fw4THDSxaoKlLXoAtao9Jx+gRTEY+IBhrhC0TgZDTULHGFChpobcApqbY3enngcEbTMkyXG7CiI1Q4FdLzF9aZjfw9tXToFAWParVa5bemHkF2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEYx+A+oZdSSrIuuKhTCh6kJnhKO+eyHAdXAPkl4MMk=;
 b=oLEYpBhKdpgz77ZPQp4uCHaoeCA4Q7qtaQmY1YCYu+fSNm3sul2AZpzVOttbvc41URaydC6reg0PW/ZynKaj7g1Dz8TFv0ixfR4VKoH75wChzT2tmRSkCeYr4ABjatqynMxPdHfOgpri2J6M6esngb8JEnsDNdjwtz1NWG/Zc74=
Received: from MN2PR06CA0017.namprd06.prod.outlook.com (2603:10b6:208:23d::22)
 by CH2PR12MB4117.namprd12.prod.outlook.com (2603:10b6:610:ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 15:22:00 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::59) by MN2PR06CA0017.outlook.office365.com
 (2603:10b6:208:23d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Wed,
 17 Sep 2025 15:22:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 15:21:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 17 Sep
 2025 08:21:59 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Sep
 2025 10:21:58 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 17 Sep 2025 08:21:58 -0700
Message-ID: <ca40954e-26cc-93e1-63a0-e65f23c943cf@amd.com>
Date: Wed, 17 Sep 2025 08:21:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Add support for user-managed preemption buffer
Content-Language: en-US
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <jeff.hugo@oss.qualcomm.com>,
 <maciej.falkowski@linux.intel.com>, Andrzej Kacprowski
 <Andrzej.Kacprowski@intel.com>
References: <20250915103437.830086-1-karol.wachowski@linux.intel.com>
 <072bd85b-5c74-e9f4-13e4-151ee24acd62@amd.com>
 <4a8a7543-37b8-490e-a2f2-abe6d3352719@linux.intel.com>
 <8d93f6d1-654e-3c93-0bd7-182ec7bc56bb@amd.com>
 <9a179c12-94e5-4e4c-9567-974023b5f2f7@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <9a179c12-94e5-4e4c-9567-974023b5f2f7@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|CH2PR12MB4117:EE_
X-MS-Office365-Filtering-Correlation-Id: 8558e6fc-e520-4159-6750-08ddf5fdf246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVVFV3phYmlncU54TUhmZk1jRVhBRUJjUDVCM0hlVVNZRzh2QVg0WWZxOSts?=
 =?utf-8?B?cjE3SUtRcEJLbUpCbVhTeVpIbVRJMXRKNWEzR2tlbk4rUXZYMnVNQTRrY2cz?=
 =?utf-8?B?MGFyeElxazRYRllDbExZd0gvd1BaTWFkUEo1K01vUEQrYkFtYWYvSUxFOGs0?=
 =?utf-8?B?THRsZFZrTjRsdy9XZzdRWE4yMXlXNDJmUlhiODNIVHh3TGR2V3c1aEY4Vys4?=
 =?utf-8?B?djd4Qy9JSldqeUxMRnNoRDlJd1lhVnVXRFBhanlUTEJEcGg1NzBadGU1MVcz?=
 =?utf-8?B?aSthN0lGUk1JN1JoNitRN1lLRUxqMXBvaTZXSlNqOTh0ODN0OHRUZStBQWpv?=
 =?utf-8?B?NmhYY0trQ3dpZG5LRnBUSDNVTzRlakV1VEY3M1A2TUdRbW9sSHFoVGpONjZW?=
 =?utf-8?B?OTl0MzJBMTdUYVAzZUp0c21GV204RkptWFJuZnZRcHAybTBRTWQ1bUZhejhw?=
 =?utf-8?B?RTAxS3JaVVdqM1FWejgrL0NLVlBtNmVZdis5QUhYd0xOQXlXNTFzK2hrSnl6?=
 =?utf-8?B?TlMwRDh4TFBFZVR0SnNQMnJoRHFBY0ZKajd2RWpDOU43ZnJ5MCtDV1YydWlh?=
 =?utf-8?B?OHJWa21BK1U2YzcrVldJektlajhwNkc5NERaYVpzaG80ZUpBenVSdEpvZENS?=
 =?utf-8?B?Uk5kK1krY3duRGdtT3IyOFU3T2YwcHpQTXpUVUhRayszd0RMOVFDSVczOVlp?=
 =?utf-8?B?Y2FzSVJLU29vaVk1eFNYb3l5MFNEKy9RcFgvWDZKZlF0Tko5VEZNQmhSdllq?=
 =?utf-8?B?OS9Fejd5VXJPMmthS2VWTzhFZnNnR29haVVtN1RVREN2eEVrVEZpdmZRTWVD?=
 =?utf-8?B?SnlxYXJtNzNTZ2RXOTJvMkZETFR5TTZOL05zSjM5bjlxUm13aXF4dzRLdXow?=
 =?utf-8?B?aHdraG14ajN0RG0rMUdzRnU0Z0FGMjJzTlhNMGlVb2RTYXQ1WFZEWVk0THg2?=
 =?utf-8?B?R3Y1SVhFcGlBMTA3VkZHUDF6K2dLSGlqbGdCSHVwdmw3MzJHanJjL0N3Tjlp?=
 =?utf-8?B?YS8yVW0wdFFoUlFBOUZWSkFQbjd2ZlV2azk2VUsrZ1VRVkE5eVpTdi9maExx?=
 =?utf-8?B?aEs2bGFaSUJEVWFVcStJNmtUcGRBVkFiSXJaamxxUmNOUm5wVVBTTHIyRU9N?=
 =?utf-8?B?alcrRjB2TEo2cWE5VWszRWpNdzJNVHh1YTF0bzJWaWtFbnc2eWNvZmNxN0JX?=
 =?utf-8?B?ZzVJRjdybjZhajdIZGl2bDR5SWdIOFJyNWpJUEx6eE9xOG53SXlJOTVYVFRB?=
 =?utf-8?B?MitjUTN5Q3phcXVSZXl3WDBLY1FFODc1VGJ2OHY5OXhEYTNHWURmKzhycGlh?=
 =?utf-8?B?aUVnKzl0dkFyZUNtVmZYSXhOQitZYzVXSnJMSlo2VXhNUEc0U0JsbktOOFZr?=
 =?utf-8?B?RE51cFc2YWhNZFV0Sit4MnBUdXdqczM1dnBuWGlkY3J4Q21wQUVidzhHd285?=
 =?utf-8?B?RC9QNUFtVU5GQVZNTG52VE0vMy9BU1VlVSsyTEJKZjFPU3BGNWtZT213UWlT?=
 =?utf-8?B?VFMxa3FSc1BxZnV0dWdqNUc4c002aktVa0czeElrbjhLSmNNNXI2T3VucERF?=
 =?utf-8?B?YWlFdHF0VXIzQ3ZDZmFYYlZycFVTZFJNRUdwSnRjcTFEbnVBbDQ4cnRURU5L?=
 =?utf-8?B?MUZsdjU2TDBoZkFheTE1YUVPclQ5NVkrd3pmL2tXbS9rQUpqWWxoTkxQdjVM?=
 =?utf-8?B?bUJyMURpZXRQK1ZwKzlmV3BJMDhkYnVUTHVITmhIbHpJa0c3OHZIeGUybFB5?=
 =?utf-8?B?SXlDODVNQWNSdkZYSm9HblY3Q0RlRmluSS91dGxNMzd4cWxUWkJrYTAzVFc0?=
 =?utf-8?B?SVZ3RlF2N213Z3lDNW9JQXdObTlPZjJnSDV1NUlEVEMwU2RIUlFkUy80MzJM?=
 =?utf-8?B?bnkyNUUvTTNoU20yKzdmbzJMUnJ1WlRhaFZFamVPV0JzVDNpRG8zcTI3elJu?=
 =?utf-8?B?eEhuelZlT2VRc1FFU3QwSkU5dW44R2c3SXpMWmNBcU9uUXg0YldScWdHb3Qx?=
 =?utf-8?B?UVh3OGZlUDVEWjJBNkllMEcwMkhPcTloeW1LV05YR1RNUHFjRCt5MDdaemtn?=
 =?utf-8?Q?cmldfe?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 15:21:59.6293 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8558e6fc-e520-4159-6750-08ddf5fdf246
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4117
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


On 9/17/25 00:24, Karol Wachowski wrote:
> On 9/16/2025 5:29 PM, Lizhi Hou wrote:
>> On 9/16/25 01:25, Karol Wachowski wrote:
>>> On 9/15/2025 10:33 PM, Lizhi Hou wrote:
>>>> On 9/15/25 03:34, Karol Wachowski wrote:
>>>>> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>>>>
>>>>> Allow user mode drivers to manage preemption buffers, enabling
>>>>> memory savings by sharing a single buffer across multiple
>>>>> command queues within the same memory context.
>>>>>
>>>>> Introduce DRM_IVPU_PARAM_PREEMPT_BUFFER_SIZE to report the required
>>>>> preemption buffer size as specified by the firmware.
>>>>>
>>>>> The preemption buffer is now passed from user space as an entry
>>>>> in the BO list of DRM_IVPU_CMDQ_SUBMIT. The buffer must be
>>>>> non-mappable and large enough to hold preemption data.
>>>>>
>>>>> For backward compatibility, the kernel will allocate an internal
>>>>> preemption buffer if user space does not provide one.
>>>>>
>>>>> User space can only provide a single preemption buffer,
>>>>> simplifying the ioctl interface and parameter validation.
>>>>> A separate secondary preemption buffer is only needed
>>>>> to save below 4GB address space on 37xx and only if preemption
>>>>> buffers are not shared.
>>>>>
>>>>> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>>>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>>>>> ---
>>>>>     drivers/accel/ivpu/ivpu_drv.c |  3 ++
>>>>>     drivers/accel/ivpu/ivpu_fw.c  | 57 +++++++++++++++++----
>>>>>     drivers/accel/ivpu/ivpu_fw.h  |  7 ++-
>>>>>     drivers/accel/ivpu/ivpu_gem.h |  7 ++-
>>>>>     drivers/accel/ivpu/ivpu_job.c | 96
>>>>> ++++++++++++++++++++++++-----------
>>>>>     drivers/accel/ivpu/ivpu_job.h |  4 +-
>>>>>     include/uapi/drm/ivpu_accel.h | 11 ++++
>>>>>     7 files changed, 141 insertions(+), 44 deletions(-)
>>>>>
>>>>> diff --git a/drivers/accel/ivpu/ivpu_drv.c
>>>>> b/drivers/accel/ivpu/ivpu_drv.c
>>>>> index 3d6d52492536..61c4f627c7c7 100644
>>>>> --- a/drivers/accel/ivpu/ivpu_drv.c
>>>>> +++ b/drivers/accel/ivpu/ivpu_drv.c
>>>>> @@ -200,6 +200,9 @@ static int ivpu_get_param_ioctl(struct drm_device
>>>>> *dev, void *data, struct drm_f
>>>>>         case DRM_IVPU_PARAM_CAPABILITIES:
>>>>>             args->value = ivpu_is_capable(vdev, args->index);
>>>>>             break;
>>>>> +    case DRM_IVPU_PARAM_PREEMPT_BUFFER_SIZE:
>>>>> +        args->value = ivpu_fw_preempt_buf_size(vdev);
>>>>> +        break;
>>>>>         default:
>>>>>             ret = -EINVAL;
>>>>>             break;
>>>>> diff --git a/drivers/accel/ivpu/ivpu_fw.c
>>>>> b/drivers/accel/ivpu/ivpu_fw.c
>>>>> index 9db741695401..6e0941d324a8 100644
>>>>> --- a/drivers/accel/ivpu/ivpu_fw.c
>>>>> +++ b/drivers/accel/ivpu/ivpu_fw.c
>>>>> @@ -26,6 +26,8 @@
>>>>>     #define FW_RUNTIME_MIN_ADDR    (FW_GLOBAL_MEM_START)
>>>>>     #define FW_RUNTIME_MAX_ADDR    (FW_GLOBAL_MEM_END -
>>>>> FW_SHARED_MEM_SIZE)
>>>>>     #define FW_FILE_IMAGE_OFFSET    (VPU_FW_HEADER_SIZE +
>>>>> FW_VERSION_HEADER_SIZE)
>>>>> +#define FW_PREEMPT_BUF_MIN_SIZE SZ_4K
>>>>> +#define FW_PREEMPT_BUF_MAX_SIZE SZ_32M
>>>>>       #define WATCHDOG_MSS_REDIRECT    32
>>>>>     #define WATCHDOG_NCE_REDIRECT    33
>>>>> @@ -151,6 +153,47 @@ ivpu_fw_sched_mode_select(struct ivpu_device
>>>>> *vdev, const struct vpu_firmware_he
>>>>>         return VPU_SCHEDULING_MODE_HW;
>>>>>     }
>>>>>     +static void
>>>>> +ivpu_preemption_config_parse(struct ivpu_device *vdev, const struct
>>>>> vpu_firmware_header *fw_hdr)
>>>>> +{
>>>>> +    struct ivpu_fw_info *fw = vdev->fw;
>>>>> +    u32 primary_preempt_buf_size, secondary_preempt_buf_size;
>>>>> +
>>>>> +    if (fw_hdr->preemption_buffer_1_max_size)
>>>>> +        primary_preempt_buf_size =
>>>>> fw_hdr->preemption_buffer_1_max_size;
>>>>> +    else
>>>>> +        primary_preempt_buf_size = fw_hdr->preemption_buffer_1_size;
>>>>> +
>>>>> +    if (fw_hdr->preemption_buffer_2_max_size)
>>>>> +        secondary_preempt_buf_size =
>>>>> fw_hdr->preemption_buffer_2_max_size;
>>>>> +    else
>>>>> +        secondary_preempt_buf_size =
>>>>> fw_hdr->preemption_buffer_2_size;
>>>>> +
>>>>> +    ivpu_dbg(vdev, FW_BOOT, "Preemption buffer size, primary: %u,
>>>>> secondary: %u\n",
>>>>> +         primary_preempt_buf_size, secondary_preempt_buf_size);
>>>>> +
>>>>> +    if (primary_preempt_buf_size < FW_PREEMPT_BUF_MIN_SIZE ||
>>>>> +        secondary_preempt_buf_size < FW_PREEMPT_BUF_MIN_SIZE) {
>>>>> +        ivpu_warn(vdev, "Preemption buffers size too small\n");
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    if (primary_preempt_buf_size > FW_PREEMPT_BUF_MAX_SIZE ||
>>>>> +        secondary_preempt_buf_size > FW_PREEMPT_BUF_MAX_SIZE) {
>>>>> +        ivpu_warn(vdev, "Preemption buffers size too big\n");
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    if (fw->sched_mode != VPU_SCHEDULING_MODE_HW)
>>>>> +        return;
>>>>> +
>>>>> +    if (ivpu_test_mode & IVPU_TEST_MODE_MIP_DISABLE)
>>>>> +        return;
>>>>> +
>>>>> +    vdev->fw->primary_preempt_buf_size =
>>>>> ALIGN(primary_preempt_buf_size, PAGE_SIZE);
>>>>> +    vdev->fw->secondary_preempt_buf_size =
>>>>> ALIGN(secondary_preempt_buf_size, PAGE_SIZE);
>>>>> +}
>>>>> +
>>>>>     static int ivpu_fw_parse(struct ivpu_device *vdev)
>>>>>     {
>>>>>         struct ivpu_fw_info *fw = vdev->fw;
>>>>> @@ -235,17 +278,9 @@ static int ivpu_fw_parse(struct ivpu_device
>>>>> *vdev)
>>>>>         fw->sched_mode = ivpu_fw_sched_mode_select(vdev, fw_hdr);
>>>>>         ivpu_info(vdev, "Scheduler mode: %s\n", fw->sched_mode ? "HW" :
>>>>> "OS");
>>>>>     -    if (fw_hdr->preemption_buffer_1_max_size)
>>>>> -        fw->primary_preempt_buf_size =
>>>>> fw_hdr->preemption_buffer_1_max_size;
>>>>> -    else
>>>>> -        fw->primary_preempt_buf_size =
>>>>> fw_hdr->preemption_buffer_1_size;
>>>>> -
>>>>> -    if (fw_hdr->preemption_buffer_2_max_size)
>>>>> -        fw->secondary_preempt_buf_size =
>>>>> fw_hdr->preemption_buffer_2_max_size;
>>>>> -    else
>>>>> -        fw->secondary_preempt_buf_size =
>>>>> fw_hdr->preemption_buffer_2_size;
>>>>> -    ivpu_dbg(vdev, FW_BOOT, "Preemption buffer sizes: primary %u,
>>>>> secondary %u\n",
>>>>> -         fw->primary_preempt_buf_size,
>>>>> fw->secondary_preempt_buf_size);
>>>>> +    ivpu_preemption_config_parse(vdev, fw_hdr);
>>>>> +    ivpu_dbg(vdev, FW_BOOT, "Mid-inference preemption %s
>>>>> supported\n",
>>>>> +         ivpu_fw_preempt_buf_size(vdev) ? "is" : "is not");
>>>>>           if (fw_hdr->ro_section_start_address &&
>>>>> !is_within_range(fw_hdr->ro_section_start_address,
>>>>>                                      fw_hdr->ro_section_size,
>>>>> diff --git a/drivers/accel/ivpu/ivpu_fw.h
>>>>> b/drivers/accel/ivpu/ivpu_fw.h
>>>>> index 7081913fb0dd..6fe2917abda6 100644
>>>>> --- a/drivers/accel/ivpu/ivpu_fw.h
>>>>> +++ b/drivers/accel/ivpu/ivpu_fw.h
>>>>> @@ -1,6 +1,6 @@
>>>>>     /* SPDX-License-Identifier: GPL-2.0-only */
>>>>>     /*
>>>>> - * Copyright (C) 2020-2024 Intel Corporation
>>>>> + * Copyright (C) 2020-2025 Intel Corporation
>>>>>      */
>>>>>       #ifndef __IVPU_FW_H__
>>>>> @@ -52,4 +52,9 @@ static inline bool ivpu_fw_is_cold_boot(struct
>>>>> ivpu_device *vdev)
>>>>>         return vdev->fw->entry_point ==
>>>>> vdev->fw->cold_boot_entry_point;
>>>>>     }
>>>>>     +static inline u32 ivpu_fw_preempt_buf_size(struct ivpu_device
>>>>> *vdev)
>>>>> +{
>>>>> +    return vdev->fw->primary_preempt_buf_size +
>>>>> vdev->fw->secondary_preempt_buf_size;
>>>>> +}
>>>>> +
>>>>>     #endif /* __IVPU_FW_H__ */
>>>>> diff --git a/drivers/accel/ivpu/ivpu_gem.h
>>>>> b/drivers/accel/ivpu/ivpu_gem.h
>>>>> index aa8ff14f7aae..3ee996d503b2 100644
>>>>> --- a/drivers/accel/ivpu/ivpu_gem.h
>>>>> +++ b/drivers/accel/ivpu/ivpu_gem.h
>>>>> @@ -1,6 +1,6 @@
>>>>>     /* SPDX-License-Identifier: GPL-2.0-only */
>>>>>     /*
>>>>> - * Copyright (C) 2020-2023 Intel Corporation
>>>>> + * Copyright (C) 2020-2025 Intel Corporation
>>>>>      */
>>>>>     #ifndef __IVPU_GEM_H__
>>>>>     #define __IVPU_GEM_H__
>>>>> @@ -96,4 +96,9 @@ static inline u32 cpu_to_vpu_addr(struct ivpu_bo
>>>>> *bo, void *cpu_addr)
>>>>>         return bo->vpu_addr + (cpu_addr - ivpu_bo_vaddr(bo));
>>>>>     }
>>>>>     +static inline bool ivpu_bo_is_mappable(struct ivpu_bo *bo)
>>>>> +{
>>>>> +    return bo->flags & DRM_IVPU_BO_MAPPABLE;
>>>>> +}
>>>>> +
>>>>>     #endif /* __IVPU_GEM_H__ */
>>>>> diff --git a/drivers/accel/ivpu/ivpu_job.c
>>>>> b/drivers/accel/ivpu/ivpu_job.c
>>>>> index fa1720fa06a4..521b7ac6e35e 100644
>>>>> --- a/drivers/accel/ivpu/ivpu_job.c
>>>>> +++ b/drivers/accel/ivpu/ivpu_job.c
>>>>> @@ -34,22 +34,20 @@ static void ivpu_cmdq_ring_db(struct ivpu_device
>>>>> *vdev, struct ivpu_cmdq *cmdq)
>>>>>     static int ivpu_preemption_buffers_create(struct ivpu_device *vdev,
>>>>>                           struct ivpu_file_priv *file_priv, struct
>>>>> ivpu_cmdq *cmdq)
>>>>>     {
>>>>> -    u64 primary_size = ALIGN(vdev->fw->primary_preempt_buf_size,
>>>>> PAGE_SIZE);
>>>>> -    u64 secondary_size = ALIGN(vdev->fw->secondary_preempt_buf_size,
>>>>> PAGE_SIZE);
>>>>> -
>>>>> -    if (vdev->fw->sched_mode != VPU_SCHEDULING_MODE_HW ||
>>>>> -        ivpu_test_mode & IVPU_TEST_MODE_MIP_DISABLE)
>>>>> +    if (ivpu_fw_preempt_buf_size(vdev) == 0)
>>>>>             return 0;
>>>>>           cmdq->primary_preempt_buf = ivpu_bo_create(vdev,
>>>>> &file_priv->ctx, &vdev->hw->ranges.user,
>>>>> -                           primary_size, DRM_IVPU_BO_WC);
>>>>> +                           vdev->fw->primary_preempt_buf_size,
>>>>> +                           DRM_IVPU_BO_WC);
>>>> Could vdev->fw->primary_preempt_buf_size be zero?
>>> This can be zero and zero is intended to indicate that preemption
>>> buffers are disabled and should not be allocated by the driver.
>>>> ivpu_fw_preempt_buf_size(vdev) make sure primary+secondary is not zero.
>>> Either of them or both can be zero. In case of both of them being zero
>>> function returns early not allocating any of the buffers.
>> ivpu_bo_create will generate a warning stack if size is zero. So just
>> checking if both are zero is not good enough.
> Thank you for your feedback. I apologize for my earlier inaccurate
> statement regarding the possibility of zeroing the buffers separately.
> To clarify, the driver ensures that both preemption buffer sizes are
> either non-zero or both zero. This is already handled during the
> firmware header parsing,
> specifically in the ivpu_preemption_config_parse() function.
> That function guarantees that both preemption buffer sizes are set to
> non-zero values together, or both are explicitly set to zero.
> Therefore, whenever ivpu_preemption_buffers_create() is invoked, both
> buffers are either allocated with non-zero sizes or not allocated at all.
> Adding individual checks within this function would reduce readability,
> as we only ever allocate both buffers together or neither.

Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>

Adding some comment might be good. :)

>
> Thanks,
> Karol
>> Lizhi
>>
>>> Best regards,
>>>
>>> Karol
>>>
>>>> Lizhi
>>>>
>>>>>         if (!cmdq->primary_preempt_buf) {
>>>>>             ivpu_err(vdev, "Failed to create primary preemption
>>>>> buffer\n");
>>>>>             return -ENOMEM;
>>>>>         }
>>>>>           cmdq->secondary_preempt_buf = ivpu_bo_create(vdev,
>>>>> &file_priv->ctx, &vdev->hw->ranges.dma,
>>>>> -                             secondary_size, DRM_IVPU_BO_WC);
>>>>> +                             vdev->fw->secondary_preempt_buf_size,
>>>>> +                             DRM_IVPU_BO_WC);
>>>>>         if (!cmdq->secondary_preempt_buf) {
>>>>>             ivpu_err(vdev, "Failed to create secondary preemption
>>>>> buffer\n");
>>>>>             goto err_free_primary;
>>>>> @@ -66,20 +64,39 @@ static int ivpu_preemption_buffers_create(struct
>>>>> ivpu_device *vdev,
>>>>>     static void ivpu_preemption_buffers_free(struct ivpu_device *vdev,
>>>>>                          struct ivpu_file_priv *file_priv, struct
>>>>> ivpu_cmdq *cmdq)
>>>>>     {
>>>>> -    if (vdev->fw->sched_mode != VPU_SCHEDULING_MODE_HW)
>>>>> -        return;
>>>>> -
>>>>>         if (cmdq->primary_preempt_buf)
>>>>>             ivpu_bo_free(cmdq->primary_preempt_buf);
>>>>>         if (cmdq->secondary_preempt_buf)
>>>>>             ivpu_bo_free(cmdq->secondary_preempt_buf);
>>>>>     }
>>>>>     +static int ivpu_preemption_job_init(struct ivpu_device *vdev,
>>>>> struct ivpu_file_priv *file_priv,
>>>>> +                    struct ivpu_cmdq *cmdq, struct ivpu_job *job)
>>>>> +{
>>>>> +    int ret;
>>>>> +
>>>>> +    /* Use preemption buffer provided by the user space */
>>>>> +    if (job->primary_preempt_buf)
>>>>> +        return 0;
>>>>> +
>>>>> +    if (!cmdq->primary_preempt_buf) {
>>>>> +        /* Allocate per command queue preemption buffers */
>>>>> +        ret = ivpu_preemption_buffers_create(vdev, file_priv, cmdq);
>>>>> +        if (ret)
>>>>> +            return ret;
>>>>> +    }
>>>>> +
>>>>> +    /* Use preemption buffers allocated by the kernel */
>>>>> +    job->primary_preempt_buf = cmdq->primary_preempt_buf;
>>>>> +    job->secondary_preempt_buf = cmdq->secondary_preempt_buf;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>     static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv
>>>>> *file_priv)
>>>>>     {
>>>>>         struct ivpu_device *vdev = file_priv->vdev;
>>>>>         struct ivpu_cmdq *cmdq;
>>>>> -    int ret;
>>>>>           cmdq = kzalloc(sizeof(*cmdq), GFP_KERNEL);
>>>>>         if (!cmdq)
>>>>> @@ -89,10 +106,6 @@ static struct ivpu_cmdq *ivpu_cmdq_alloc(struct
>>>>> ivpu_file_priv *file_priv)
>>>>>         if (!cmdq->mem)
>>>>>             goto err_free_cmdq;
>>>>>     -    ret = ivpu_preemption_buffers_create(vdev, file_priv, cmdq);
>>>>> -    if (ret)
>>>>> -        ivpu_warn(vdev, "Failed to allocate preemption buffers,
>>>>> preemption limited\n");
>>>>> -
>>>>>         return cmdq;
>>>>>       err_free_cmdq:
>>>>> @@ -429,17 +442,14 @@ static int ivpu_cmdq_push_job(struct ivpu_cmdq
>>>>> *cmdq, struct ivpu_job *job)
>>>>>         if (unlikely(ivpu_test_mode & IVPU_TEST_MODE_NULL_SUBMISSION))
>>>>>             entry->flags = VPU_JOB_FLAGS_NULL_SUBMISSION_MASK;
>>>>>     -    if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW) {
>>>>> -        if (cmdq->primary_preempt_buf) {
>>>>> -            entry->primary_preempt_buf_addr =
>>>>> cmdq->primary_preempt_buf->vpu_addr;
>>>>> -            entry->primary_preempt_buf_size =
>>>>> ivpu_bo_size(cmdq->primary_preempt_buf);
>>>>> -        }
>>>>> +    if (job->primary_preempt_buf) {
>>>>> +        entry->primary_preempt_buf_addr =
>>>>> job->primary_preempt_buf->vpu_addr;
>>>>> +        entry->primary_preempt_buf_size =
>>>>> ivpu_bo_size(job->primary_preempt_buf);
>>>>> +    }
>>>>>     -        if (cmdq->secondary_preempt_buf) {
>>>>> -            entry->secondary_preempt_buf_addr =
>>>>> cmdq->secondary_preempt_buf->vpu_addr;
>>>>> -            entry->secondary_preempt_buf_size =
>>>>> -                ivpu_bo_size(cmdq->secondary_preempt_buf);
>>>>> -        }
>>>>> +    if (job->secondary_preempt_buf) {
>>>>> +        entry->secondary_preempt_buf_addr =
>>>>> job->secondary_preempt_buf->vpu_addr;
>>>>> +        entry->secondary_preempt_buf_size =
>>>>> ivpu_bo_size(job->secondary_preempt_buf);
>>>>>         }
>>>>>           wmb(); /* Ensure that tail is updated after filling entry */
>>>>> @@ -663,6 +673,13 @@ static int ivpu_job_submit(struct ivpu_job *job,
>>>>> u8 priority, u32 cmdq_id)
>>>>>             goto err_unlock;
>>>>>         }
>>>>>     +    ret = ivpu_preemption_job_init(vdev, file_priv, cmdq, job);
>>>>> +    if (ret) {
>>>>> +        ivpu_err(vdev, "Failed to initialize preemption buffers for
>>>>> job %d: %d\n",
>>>>> +             job->job_id, ret);
>>>>> +        goto err_unlock;
>>>>> +    }
>>>>> +
>>>>>         job->cmdq_id = cmdq->id;
>>>>>           is_first_job = xa_empty(&vdev->submitted_jobs_xa);
>>>>> @@ -716,7 +733,7 @@ static int ivpu_job_submit(struct ivpu_job *job,
>>>>> u8 priority, u32 cmdq_id)
>>>>>       static int
>>>>>     ivpu_job_prepare_bos_for_submit(struct drm_file *file, struct
>>>>> ivpu_job *job, u32 *buf_handles,
>>>>> -                u32 buf_count, u32 commands_offset)
>>>>> +                u32 buf_count, u32 commands_offset, u32
>>>>> preempt_buffer_index)
>>>>>     {
>>>>>         struct ivpu_file_priv *file_priv = job->file_priv;
>>>>>         struct ivpu_device *vdev = file_priv->vdev;
>>>>> @@ -752,6 +769,20 @@ ivpu_job_prepare_bos_for_submit(struct drm_file
>>>>> *file, struct ivpu_job *job, u32
>>>>>           job->cmd_buf_vpu_addr = bo->vpu_addr + commands_offset;
>>>>>     +    if (preempt_buffer_index) {
>>>>> +        struct ivpu_bo *preempt_bo = job->bos[preempt_buffer_index];
>>>>> +
>>>>> +        if (ivpu_bo_size(preempt_bo) <
>>>>> ivpu_fw_preempt_buf_size(vdev)) {
>>>>> +            ivpu_warn(vdev, "Preemption buffer is too small\n");
>>>>> +            return -EINVAL;
>>>>> +        }
>>>>> +        if (ivpu_bo_is_mappable(preempt_bo)) {
>>>>> +            ivpu_warn(vdev, "Preemption buffer cannot be
>>>>> mappable\n");
>>>>> +            return -EINVAL;
>>>>> +        }
>>>>> +        job->primary_preempt_buf = preempt_bo;
>>>>> +    }
>>>>> +
>>>>>         ret = drm_gem_lock_reservations((struct drm_gem_object
>>>>> **)job->bos, buf_count,
>>>>>                         &acquire_ctx);
>>>>>         if (ret) {
>>>>> @@ -782,7 +813,7 @@ ivpu_job_prepare_bos_for_submit(struct drm_file
>>>>> *file, struct ivpu_job *job, u32
>>>>>       static int ivpu_submit(struct drm_file *file, struct
>>>>> ivpu_file_priv *file_priv, u32 cmdq_id,
>>>>>                    u32 buffer_count, u32 engine, void __user
>>>>> *buffers_ptr, u32 cmds_offset,
>>>>> -               u8 priority)
>>>>> +               u32 preempt_buffer_index, u8 priority)
>>>>>     {
>>>>>         struct ivpu_device *vdev = file_priv->vdev;
>>>>>         struct ivpu_job *job;
>>>>> @@ -814,7 +845,8 @@ static int ivpu_submit(struct drm_file *file,
>>>>> struct ivpu_file_priv *file_priv,
>>>>>             goto err_exit_dev;
>>>>>         }
>>>>>     -    ret = ivpu_job_prepare_bos_for_submit(file, job, buf_handles,
>>>>> buffer_count, cmds_offset);
>>>>> +    ret = ivpu_job_prepare_bos_for_submit(file, job, buf_handles,
>>>>> buffer_count, cmds_offset,
>>>>> +                          preempt_buffer_index);
>>>>>         if (ret) {
>>>>>             ivpu_err(vdev, "Failed to prepare job: %d\n", ret);
>>>>>             goto err_destroy_job;
>>>>> @@ -868,7 +900,7 @@ int ivpu_submit_ioctl(struct drm_device *dev,
>>>>> void *data, struct drm_file *file)
>>>>>         priority = ivpu_job_to_jsm_priority(args->priority);
>>>>>           return ivpu_submit(file, file_priv, 0, args->buffer_count,
>>>>> args->engine,
>>>>> -               (void __user *)args->buffers_ptr,
>>>>> args->commands_offset, priority);
>>>>> +               (void __user *)args->buffers_ptr,
>>>>> args->commands_offset, 0, priority);
>>>>>     }
>>>>>       int ivpu_cmdq_submit_ioctl(struct drm_device *dev, void *data,
>>>>> struct drm_file *file)
>>>>> @@ -885,6 +917,9 @@ int ivpu_cmdq_submit_ioctl(struct drm_device
>>>>> *dev, void *data, struct drm_file *
>>>>>         if (args->buffer_count == 0 || args->buffer_count >
>>>>> JOB_MAX_BUFFER_COUNT)
>>>>>             return -EINVAL;
>>>>>     +    if (args->preempt_buffer_index >= args->buffer_count)
>>>>> +        return -EINVAL;
>>>>> +
>>>>>         if (!IS_ALIGNED(args->commands_offset, 8))
>>>>>             return -EINVAL;
>>>>>     @@ -895,7 +930,8 @@ int ivpu_cmdq_submit_ioctl(struct drm_device
>>>>> *dev, void *data, struct drm_file *
>>>>>             return -EBADFD;
>>>>>           return ivpu_submit(file, file_priv, args->cmdq_id,
>>>>> args->buffer_count, VPU_ENGINE_COMPUTE,
>>>>> -               (void __user *)args->buffers_ptr,
>>>>> args->commands_offset, 0);
>>>>> +               (void __user *)args->buffers_ptr,
>>>>> args->commands_offset,
>>>>> +               args->preempt_buffer_index, 0);
>>>>>     }
>>>>>       int ivpu_cmdq_create_ioctl(struct drm_device *dev, void *data,
>>>>> struct drm_file *file)
>>>>> diff --git a/drivers/accel/ivpu/ivpu_job.h
>>>>> b/drivers/accel/ivpu/ivpu_job.h
>>>>> index 2e301c2eea7b..6c8b9c739b51 100644
>>>>> --- a/drivers/accel/ivpu/ivpu_job.h
>>>>> +++ b/drivers/accel/ivpu/ivpu_job.h
>>>>> @@ -1,6 +1,6 @@
>>>>>     /* SPDX-License-Identifier: GPL-2.0-only */
>>>>>     /*
>>>>> - * Copyright (C) 2020-2024 Intel Corporation
>>>>> + * Copyright (C) 2020-2025 Intel Corporation
>>>>>      */
>>>>>       #ifndef __IVPU_JOB_H__
>>>>> @@ -55,6 +55,8 @@ struct ivpu_job {
>>>>>         u32 job_id;
>>>>>         u32 engine_idx;
>>>>>         size_t bo_count;
>>>>> +    struct ivpu_bo *primary_preempt_buf;
>>>>> +    struct ivpu_bo *secondary_preempt_buf;
>>>>>         struct ivpu_bo *bos[] __counted_by(bo_count);
>>>>>     };
>>>>>     diff --git a/include/uapi/drm/ivpu_accel.h
>>>>> b/include/uapi/drm/ivpu_accel.h
>>>>> index 160ee1411d4a..e470b0221e02 100644
>>>>> --- a/include/uapi/drm/ivpu_accel.h
>>>>> +++ b/include/uapi/drm/ivpu_accel.h
>>>>> @@ -90,6 +90,7 @@ extern "C" {
>>>>>     #define DRM_IVPU_PARAM_TILE_CONFIG        11
>>>>>     #define DRM_IVPU_PARAM_SKU            12
>>>>>     #define DRM_IVPU_PARAM_CAPABILITIES        13
>>>>> +#define DRM_IVPU_PARAM_PREEMPT_BUFFER_SIZE  14
>>>>>       #define DRM_IVPU_PLATFORM_TYPE_SILICON        0
>>>>>     @@ -176,6 +177,9 @@ struct drm_ivpu_param {
>>>>>          *
>>>>>          * %DRM_IVPU_PARAM_CAPABILITIES:
>>>>>          * Supported capabilities (read-only)
>>>>> +     *
>>>>> +     * %DRM_IVPU_PARAM_PREEMPT_BUFFER_SIZE:
>>>>> +     * Size of the preemption buffer (read-only)
>>>>>          */
>>>>>         __u32 param;
>>>>>     @@ -371,6 +375,13 @@ struct drm_ivpu_cmdq_submit {
>>>>>          * to be executed. The offset has to be 8-byte aligned.
>>>>>          */
>>>>>         __u32 commands_offset;
>>>>> +    /**
>>>>> +     * @preempt_buffer_index:
>>>>> +     *
>>>>> +     * Index of the preemption buffer in the buffers_ptr array.
>>>>> +     */
>>>>> +    __u32 preempt_buffer_index;
>>>>> +    __u32 reserved;
>>>>>     };
>>>>>       /* drm_ivpu_bo_wait job status codes */
