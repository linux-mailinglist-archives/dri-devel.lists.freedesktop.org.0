Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DDB851F5A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 22:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C359D10E4FC;
	Mon, 12 Feb 2024 21:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HYUfLv+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D3210E170;
 Mon, 12 Feb 2024 21:16:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ju/+Mq5z7exQxkYBUGjgR9OPzNmvcIU2UCorIMWH9Ve7zof94vTajDLKKEbNl1um+0/T8pCcru+NrXAdC/YH6c/Kcq12zV3AAd13NMgFufbdTNa4qA8BoeUqmE+vXuRvdhFVy6ub6JEadNXWjWbcQUxStuyYZzZ7QzUI//M1wG+zerQFIQe4CHfeyNcP9/chCoDWYDbhAk8pscRcfCZmrxe/G9YTsdE+Dbg/hWCxMpxSSAEzqjbfr+4OzpKw5mY+JECglcWXHY2if7R5mk1bcazi2aCZq5bVw8kXhYQwJpAu1Cta9U7RzJwzffGSb7eyZLa0ZFb+3wopTCBKtanSkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9v98tJyYFlnCzY1ezqkL7uqoccjF0isxoRxgpny+0iw=;
 b=msrPYOPidHCxGyq8IQt+cCxbRXQY5FdruPnO7d/a6HwmlJu+WHKQVsKgVRqEXhI3IyaQs1yMZEu+SPB5dwIXZjcoF9iwScoxi6P7VigMMApQaeI2F6tzIL87rpR0kXBHolbRdYtlEj06Vgi/QmfgIbwFBtQ/X+Xqzc70d96PLclcAvVguc7SB9NNsHNJwuI9Pd3ZzLhobNo55U1lvZA9icCp0zIctgE4Wo90SEEeOZ1Zl7H5rSGakDBRcD5kJR5F0eNnlW/k/q+gvofk56TEYdEZ6QshZmJ0NPQwXVFcpUVGmwa1Msu4vqwgvROw51dkdLpkjJWkiFN2pN34FjRSRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9v98tJyYFlnCzY1ezqkL7uqoccjF0isxoRxgpny+0iw=;
 b=HYUfLv+ED0PbGBIssyPHblXmR7huK1OoHs+eT1Z3U2WP9WEFym0tOIb3ciJKYzV5ZrDBAce3MukpnUJMGTKOMRkGdp92ggb3cKRHmEVpOH6YXFA64Fvd1CJd2n5TYVPAgSUxE9KEuL1cCQQYFLUjSruuGxpHMcHMqOOBu052m/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB9345.namprd12.prod.outlook.com (2603:10b6:8:1a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.10; Mon, 12 Feb
 2024 21:16:56 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a%7]) with mapi id 15.20.7292.019; Mon, 12 Feb 2024
 21:16:56 +0000
Message-ID: <db0c726f-c72b-4392-981d-7ac1bef4a9d5@amd.com>
Date: Mon, 12 Feb 2024 15:16:54 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm: Add support to get EDID from ACPI
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
To: amd-gfx@lists.freedesktop.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Cc: "open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Melissa Wen <mwen@igalia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20240211055011.3583-1-mario.limonciello@amd.com>
 <20240211055011.3583-2-mario.limonciello@amd.com>
 <08ced68d-99bc-4a5e-90e7-f6a4b4b20e93@amd.com>
In-Reply-To: <08ced68d-99bc-4a5e-90e7-f6a4b4b20e93@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM5PR07CA0102.namprd07.prod.outlook.com
 (2603:10b6:4:ae::31) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB9345:EE_
X-MS-Office365-Filtering-Correlation-Id: a95686c5-35ba-41dc-df53-08dc2c0ff15d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iv5mxZT9rBrTvoHTv7pvOdVwHI0FheHb74+I7kKCGnh4m2ZQHPvIm/bUd6iik4EtAcHCWuovZoCdG58xXkgMZtPartAmo+ke/FrH8pcN4LnpVaLqgRx5HkiAdYZuzzQEzqLgEst12o/khGcQcKsUWFa3ZYZuZQdMgkV1ftg45GGdgZvRGMCNA7czMh0K80izUlsZxxkp//7FPes2cXRN3kphmX4sNTcYZD/Y/R0bcvdobxJA+y52+bggaSI05Ck2PWZ1fzaOjyjig808KdZfyo8YrWbeZQ0TUiMF6IbKXyGvPndGXo+1Rd7GOXzoYIa+vCAe6oKwdUFX+AmBtwgdIFsUtc/AYjGpi5GnuIS3ea3BrAkHtad1hKIkbo5Bg+nZMKXv4MbGxkFX0IqZ7q+G/P36mpOiW9y1CvpDkwQnRWJdVySs1Covq7Pz0AYTPK+Y75XZsdaH+fdHJqAZ9fkoQ3BaTC8XzkJn2JjTjt2W4gOKYvuU4W777cx5R2WFPogqtmH3bHkmNKZurMbGHq9XwR2glyHDrxHsnsUy9KmDXR1nnnx+EwqAT3SaI/xe0sXH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(346002)(366004)(136003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(44832011)(478600001)(6486002)(31686004)(41300700001)(66899024)(6506007)(5660300002)(2906002)(6916009)(316002)(26005)(8676002)(36756003)(53546011)(83380400001)(66556008)(66476007)(8936002)(4326008)(2616005)(66946007)(6512007)(86362001)(54906003)(31696002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEhuQ0IxaGt4aERTVVlXRTk3UWtjK3RocWlZOHRkLzBQYTRMcWZJbVNaYTBK?=
 =?utf-8?B?WmNKZmU0VEcvM3ZVeGFzSDNvYklwaDlldm9oVllqUFRLR2ZFSXFtRXduSEdq?=
 =?utf-8?B?dUZzWE10c1E3bndLTEtUd3BBOWRhWlhLc3hIOWlacnYyKy9mY3NWamxERldx?=
 =?utf-8?B?aDMyNTRGdk4vU3d5dVp5eXNNTjVieTd6OElNaVpCT1I0bDdYK0NUR3c3Wklz?=
 =?utf-8?B?VXV1bGFsZFFpcG9ZT2pjdWFKV3pIOHNTZWRGdlI3Nk53UlFmQndxd2RhM3Np?=
 =?utf-8?B?dEsxVU9ydmI3dy9lQUNERVhoeit1L0dsb2pQUHhrRjZPZGNZS0M4YnQ2amRD?=
 =?utf-8?B?Z1Mxck0wUVk4YU44UDdXaTQ5V0E0U0ZkTmhVeFBuN1B2REhEaEtyZGROeElm?=
 =?utf-8?B?UFdCNDhXQml5cVNjdzVSUmt3cUNxejB1MW5sa3dnQzc2TmdsTEpqN2tzZE56?=
 =?utf-8?B?eDJaYkxXWW8va09aV3lSUCtiMWdZdVBVUCswK3VibE9mVVlFNUp6dC84Zi96?=
 =?utf-8?B?MElnWmhNdnd6QjZ0NzZYUmQvaFRhMlpzT1FFckpSMi85RjlHQ2xjN3Jnb0wz?=
 =?utf-8?B?OVJOak9mUDJyQ3Bpa29MTW9XK1dEYTlmZXhyNlZDaGljeThGbVdXa1JzU2Fx?=
 =?utf-8?B?TUVRWmpoRmNvdyt1QXpVQVM4N3E0cng1SmMwQnVHbjlTcFlPaGVNcE9HK0Fs?=
 =?utf-8?B?d1JrNmI2VDg3OUNQMUVaeGJ1TktPU3BtQjE4cjl5NzEzaWRtcG5FUm10NkhT?=
 =?utf-8?B?ZDRMdWZIUDRob2tMclZtb2V3aDZlSko5czhqUndTVE4vSlNBcjMrd0JyVytZ?=
 =?utf-8?B?ZmhJd08xb09BWWpsVmMrRDV4VGlhOW1VcGJlaWxpbmZ0TnFuWWlJdFBybU12?=
 =?utf-8?B?ZlBCM2dHR3BlOHpkcDBpV3Z1SEZXWWx4WUhOTjJjdjhRZ0JGVTZCR25vb05M?=
 =?utf-8?B?ZnZUemlqQ2dlL0g4MjU0OW01NFBMbVFyb0xhZ1FXbkI0eEt6WjNvZWN0dEhl?=
 =?utf-8?B?bUVnL1AwSjJoTG5oT1R2YVE4OTBXRFkxVW5nd29YV2N3NG96c3U5ZjFBQ2xC?=
 =?utf-8?B?N2trM3QyeXpsRDBsREgrZXBxVEd6S3FxWXU3bUpocGV0N3ZHejBkeFBwMVZQ?=
 =?utf-8?B?b3crSDBKQk12NkJJTE1NTVZla1c5K2g2eUtiOVhJMng2RWRzdjh0QlM0VXlF?=
 =?utf-8?B?bnJWUVFtMEZ3K2ZSeGVRWmcyaEUzWnZVMnVHckUvSE0raDZublB5amJpVmF1?=
 =?utf-8?B?aFRIV0p3dXlub1VpTDQvQTJmeFF3am1uVStVaE9sMDRKZ2dubmpHUHExOFlX?=
 =?utf-8?B?eXBFN1h6cndTOHdkeC9kbDd5V3Y2YmhPaXg5K3JKM3RYcHZ4TUNqamYvcnN0?=
 =?utf-8?B?akVSY2ZsaGhqRVAyNnRQejVZeU83MkYvTFFXVDV3WkhOZFAwRE5INWJWQTBJ?=
 =?utf-8?B?cHJKcjFTRHl4MGo0akR1VjR1OUw0VXFjU25JbGcrenoxaVNTQmd2MnZSSDkz?=
 =?utf-8?B?SkJZWkMyQkFmM1lzWGh3NEVQbjdTM2tMU0lIR0x5clp2VHdlcjdSUGFSM2lZ?=
 =?utf-8?B?Yll3ZVcwbUY5LzRzL3EzdEVOdWtQZE1uY0FyK0pES1FwV0Y3ejJJOHhyajNL?=
 =?utf-8?B?SkRNU05jRVNiU084UW1vN2FNRE5lSWlhQncxcDVidGJsWkx2dCtYY3NaQUJM?=
 =?utf-8?B?VTFhYUJDbTNnVkhqSEpxT0FsUVQ1WnJiZTFScTZwYXZkMUhzanFJQzF5UzJh?=
 =?utf-8?B?TC8xYkRvSjdiWDVQb0pJSkRvaVZDemp6S0JrSXhOMTBJdGRYTlNaNWtWTktB?=
 =?utf-8?B?bjdzYUY2SUg1VXVQNVB2Z2NiYjR3QVIxSWNHWTh0eHZuN25jVVU4UlRsNnpK?=
 =?utf-8?B?WGZiMitxanhmSjJVaUlmYm01b0tPMHUrODFJZ2VpYWFPWVNCdk9QNzJBbUVl?=
 =?utf-8?B?L09VWkF1L0s2VU5kdURKTzRNUE5KMUtIZWpibzhON1hJYm01OWFkWGFVWm9i?=
 =?utf-8?B?WFZkZVdXSmI4TmcwZEkrdlFYNjRUMjJzTDg5ZXYwSEU3RW1mT1hZNENrYklo?=
 =?utf-8?B?SzBUdXZJdXduSTdlenBuNjRwRUUrMWZ6L1ZqMzU0OWRKVDV2NDBpTUxPRkxM?=
 =?utf-8?Q?kpJBp1s6v1TgdYkBUvuVK099D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a95686c5-35ba-41dc-df53-08dc2c0ff15d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 21:16:56.6914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CCAj+2bJ6wI5m1wmPAgx9R5sDrQsD4MoDKT7lqa/4bY3KojUZXK9mvV/guS6oRcvLK53uLLnW06x4hjTZo79g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9345
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

On 2/12/2024 10:31, Mario Limonciello wrote:
> On 2/10/2024 23:50, Mario Limonciello wrote:
>> Some manufacturers have intentionally put an EDID that differs from
>> the EDID on the internal panel on laptops.  Drivers that prefer to
>> fetch this EDID can set a bit on the drm_connector to indicate that
>> the DRM EDID helpers should try to fetch it and it is preferred if
>> it's present.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>> v1->v2:
>>   * Split code from previous amdgpu specific helper to generic drm 
>> helper.
>> v2->v3:
>>   * Add an extra select to fix a variety of randconfig errors found from
>>     LKP robot.
>> v3->v4:
>>   * Return struct drm_edid
>> v4->v5:
>>   * Rename to drm_edid_read_acpi
>>   * Drop selects
>> ---
>>   drivers/gpu/drm/Kconfig     |   7 +++
>>   drivers/gpu/drm/drm_edid.c  | 113 +++++++++++++++++++++++++++++++++---
>>   include/drm/drm_connector.h |   6 ++
>>   include/drm/drm_edid.h      |   1 +
>>   4 files changed, 119 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 2520db0b776e..a49740c528b9 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -103,6 +103,13 @@ config DRM_KMS_HELPER
>>       help
>>         CRTC helpers for KMS drivers.
>> +config DRM_ACPI_HELPER
>> +    tristate "ACPI support in DRM"
>> +    depends on DRM
>> +    depends on (ACPI_VIDEO || ACPI_VIDEO=n)
>> +    help
>> +      ACPI helpers for DRM drivers.
>> +
> 
> Unfortunately in my wider testing this still fails with a few combinations.
> 
> This combination fails to link:
> 
> CONFIG_ACPI_VIDEO=m
> CONFIG_DRM_ACPI_HELPER=y
> CONFIG_DRM=y
> 
> This combination links but doesn't work because the IS_REACHABLE() fails 
> (-EOPNOTSUPP):
> 
> CONFIG_ACPI_VIDEO=m
> CONFIG_DRM_ACPI_HELPER=M
> CONFIG_DRM=y
> 
> I'm tempted to split off all of drm_edid to it's own module instead  of 
> CONFIG_DRM_ACPI_HELPER which has a depends on (ACPI_VIDEO || 
> ACPI_VIDEIO=n).
> 
> Or Daniel, any better ideas?

I've come up with a solution that undoes all the select mess in 
preceding patches.

This patch will be swapped around to

--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -8,6 +8,7 @@
  menuconfig DRM
         tristate "Direct Rendering Manager (XFree86 4.1.0 and higher 
DRI support)"
         depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && HAS_DMA
+       depends on (ACPI_VIDEO || ACPI_VIDEO=n)
         select DRM_PANEL_ORIENTATION_QUIRKS
         select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
         select FB_CORE if DRM_FBDEV_EMULATION

I'll wait a little for any other feedback and then post the updated 
series.  None of the other patches change in any material way.

> 
>>   config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>>           bool "Enable refcount backtrace history in the DP MST helpers"
>>       depends on STACKTRACE_SUPPORT
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 69c68804023f..096c278b6f66 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -28,6 +28,7 @@
>>    * DEALINGS IN THE SOFTWARE.
>>    */
>> +#include <acpi/video.h>
>>   #include <linux/bitfield.h>
>>   #include <linux/cec.h>
>>   #include <linux/hdmi.h>
>> @@ -2188,6 +2189,62 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, 
>> unsigned int block, size_t len)
>>       return ret == xfers ? 0 : -1;
>>   }
>> +/**
>> + * drm_do_probe_acpi_edid() - get EDID information via ACPI _DDC
>> + * @data: struct drm_connector
>> + * @buf: EDID data buffer to be filled
>> + * @block: 128 byte EDID block to start fetching from
>> + * @len: EDID data buffer length to fetch
>> + *
>> + * Try to fetch EDID information by calling acpi_video_get_edid() 
>> function.
>> + *
>> + * Return: 0 on success or error code on failure.
>> + */
>> +static int
>> +drm_do_probe_acpi_edid(void *data, u8 *buf, unsigned int block, 
>> size_t len)
>> +{
>> +    struct drm_connector *connector = data;
>> +    struct drm_device *ddev = connector->dev;
>> +    struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
>> +    unsigned char start = block * EDID_LENGTH;
>> +    void *edid;
>> +    int r;
>> +
>> +    if (!acpidev)
>> +        return -ENODEV;
>> +
>> +    switch (connector->connector_type) {
>> +    case DRM_MODE_CONNECTOR_LVDS:
>> +    case DRM_MODE_CONNECTOR_eDP:
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>> +    /* fetch the entire edid from BIOS */
>> +    if (IS_REACHABLE(CONFIG_DRM_ACPI_HELPER)) {
>> +        r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, 
>> &edid);
>> +        if (r < 0) {
>> +            DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
>> +            return -EINVAL;
>> +        }
>> +    } else {
>> +        r = -EOPNOTSUPP;
>> +    }
>> +    if (len > r || start > r || start + len > r) {
>> +        r = -EINVAL;
>> +        goto cleanup;
>> +    }
>> +
>> +    memcpy(buf, edid + start, len);
>> +    r = 0;
>> +
>> +cleanup:
>> +    kfree(edid);
>> +
>> +    return r;
>> +}
>> +
>>   static void connector_bad_edid(struct drm_connector *connector,
>>                      const struct edid *edid, int num_blocks)
>>   {
>> @@ -2621,7 +2678,8 @@ EXPORT_SYMBOL(drm_probe_ddc);
>>    * @connector: connector we're probing
>>    * @adapter: I2C adapter to use for DDC
>>    *
>> - * Poke the given I2C channel to grab EDID data if possible.  If found,
>> + * If the connector allows it, try to fetch EDID data using ACPI. If 
>> not found
>> + * poke the given I2C channel to grab EDID data if possible.  If found,
>>    * attach it to the connector.
>>    *
>>    * Return: Pointer to valid EDID or NULL if we couldn't find any.
>> @@ -2629,20 +2687,50 @@ EXPORT_SYMBOL(drm_probe_ddc);
>>   struct edid *drm_get_edid(struct drm_connector *connector,
>>                 struct i2c_adapter *adapter)
>>   {
>> -    struct edid *edid;
>> +    struct edid *edid = NULL;
>>       if (connector->force == DRM_FORCE_OFF)
>>           return NULL;
>> -    if (connector->force == DRM_FORCE_UNSPECIFIED && 
>> !drm_probe_ddc(adapter))
>> -        return NULL;
>> +    if (connector->acpi_edid_allowed)
>> +        edid = _drm_do_get_edid(connector, drm_do_probe_acpi_edid, 
>> connector, NULL);
>> +
>> +    if (!edid) {
>> +        if (connector->force == DRM_FORCE_UNSPECIFIED && 
>> !drm_probe_ddc(adapter))
>> +            return NULL;
>> +        edid = _drm_do_get_edid(connector, drm_do_probe_ddc_edid, 
>> adapter, NULL);
>> +    }
>> -    edid = _drm_do_get_edid(connector, drm_do_probe_ddc_edid, 
>> adapter, NULL);
>>       drm_connector_update_edid_property(connector, edid);
>>       return edid;
>>   }
>>   EXPORT_SYMBOL(drm_get_edid);
>> +/**
>> + * drm_edid_read_acpi - get EDID data, if available
>> + * @connector: connector we're probing
>> + *
>> + * Use the BIOS to attempt to grab EDID data if possible.
>> + *
>> + * The returned pointer must be freed using drm_edid_free().
>> + *
>> + * Return: Pointer to valid EDID or NULL if we couldn't find any.
>> + */
>> +const struct drm_edid *drm_edid_read_acpi(struct drm_connector 
>> *connector)
>> +{
>> +    const struct drm_edid *drm_edid;
>> +
>> +    if (connector->force == DRM_FORCE_OFF)
>> +        return NULL;
>> +
>> +    drm_edid = drm_edid_read_custom(connector, 
>> drm_do_probe_acpi_edid, connector);
>> +
>> +    /* Note: Do *not* call connector updates here. */
>> +
>> +    return drm_edid;
>> +}
>> +EXPORT_SYMBOL(drm_edid_read_acpi);
>> +
>>   /**
>>    * drm_edid_read_custom - Read EDID data using given EDID block read 
>> function
>>    * @connector: Connector to use
>> @@ -2727,10 +2815,11 @@ const struct drm_edid 
>> *drm_edid_read_ddc(struct drm_connector *connector,
>>   EXPORT_SYMBOL(drm_edid_read_ddc);
>>   /**
>> - * drm_edid_read - Read EDID data using connector's I2C adapter
>> + * drm_edid_read - Read EDID data using BIOS or connector's I2C adapter
>>    * @connector: Connector to use
>>    *
>> - * Read EDID using the connector's I2C adapter.
>> + * Read EDID from BIOS if allowed by connector or by using the 
>> connector's
>> + * I2C adapter.
>>    *
>>    * The EDID may be overridden using debugfs override_edid or 
>> firmware EDID
>>    * (drm_edid_load_firmware() and drm.edid_firmware parameter), in 
>> this priority
>> @@ -2742,10 +2831,18 @@ EXPORT_SYMBOL(drm_edid_read_ddc);
>>    */
>>   const struct drm_edid *drm_edid_read(struct drm_connector *connector)
>>   {
>> +    const struct drm_edid *drm_edid = NULL;
>> +
>>       if (drm_WARN_ON(connector->dev, !connector->ddc))
>>           return NULL;
>> -    return drm_edid_read_ddc(connector, connector->ddc);
>> +    if (connector->acpi_edid_allowed)
>> +        drm_edid = drm_edid_read_acpi(connector);
>> +
>> +    if (!drm_edid)
>> +        drm_edid = drm_edid_read_ddc(connector, connector->ddc);
>> +
>> +    return drm_edid;
>>   }
>>   EXPORT_SYMBOL(drm_edid_read);
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index fe88d7fc6b8f..74ed47f37a69 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -1886,6 +1886,12 @@ struct drm_connector {
>>       /** @hdr_sink_metadata: HDR Metadata Information read from sink */
>>       struct hdr_sink_metadata hdr_sink_metadata;
>> +
>> +    /**
>> +     * @acpi_edid_allowed: Get the EDID from the BIOS, if available.
>> +     * This is only applicable to eDP and LVDS displays.
>> +     */
>> +    bool acpi_edid_allowed;
>>   };
>>   #define obj_to_connector(x) container_of(x, struct drm_connector, base)
>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>> index 518d1b8106c7..38b5e1b5c773 100644
>> --- a/include/drm/drm_edid.h
>> +++ b/include/drm/drm_edid.h
>> @@ -463,5 +463,6 @@ bool drm_edid_is_digital(const struct drm_edid 
>> *drm_edid);
>>   const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>>                     int ext_id, int *ext_index);
>> +const struct drm_edid *drm_edid_read_acpi(struct drm_connector 
>> *connector);
>>   #endif /* __DRM_EDID_H__ */
> 

