Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B868472FA
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 16:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AAE10E7B6;
	Fri,  2 Feb 2024 15:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="c1vXd5vL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508FD10E76C;
 Fri,  2 Feb 2024 15:19:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsFh8ojCNZZMjoqf44VOFegq5MCbAWvEmfbGlE34SWZFkWV49SM50XdDItIT1yJLLn/4vrP0Oi2n9SlrzorT4nG/JbQ4k2CNkEZ4kHtIEAoUYxwRUs7RHvpTv7zz+SXkarmsyOrULrCf35CwQxZoU+DSMWvDCgKTypMmPgcw8OnfTgZG8fmDCxwMDqCIeIrDU/JOj/84gsjPV80erk/COjFUDjYo49pXfo1zph25aK2H2v+qUaghG6I2zXZOgY5sh7a+2ap+ltiDeLNOEQzR3PIW2MPWCj3WTCUMlJYzhBKvaaiFvcTDsHBOkdfTxwHNP5GmhNd3Z6n0PpANRJPzOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yy4TrToG8GGBQO65TIpKzJ/FsW2r5wASM9SOVJIpODk=;
 b=QBRqjWXzqZF43+X2iApbkLNbldAvhcOHQlgCPdjJBoOKMbA+x1/9avBhxUZLkmJfM7xfDXWVHSsDtNaXwKUsjFnrXVVLNCYb4Lh5cQCrHO7QgPP5HQfKByGMlxxRSw4+9KNHW99Wcmqu3IAo+/MvKNuKufRDnoRArlhDqzzjRE/1VCwYoBNtm/AMqUMgmSIsuGhhkWx8un/gcuk24U+zeyblFt1p5bHmFXJY0gMLG/AFpxEoeD7bLvbrRXcoVqNW/JzpMS+KeOFTLpEms/o7Xf6VfQzklMmuUGs24iSyjU4p2epGEF+rzOuvoR89oAoHwkI6w0gNzCKKFN6YFd2iTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yy4TrToG8GGBQO65TIpKzJ/FsW2r5wASM9SOVJIpODk=;
 b=c1vXd5vLVKPZmmj21Nps//OwzwMHU8bZQurTCTkbyPvH29z4+qWCnRHnWsf9cgUFRnvUi50Yo6Gmj/jsy9ZFefecarzPgrR5QWEjWdwkNebKk6n7Qj2eA+bwqrh6Kaak1iuaWQD8WmqrJEUKnV0wv6IgGNLHmE/CB+CkJ55getg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY8PR12MB7612.namprd12.prod.outlook.com (2603:10b6:930:9c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Fri, 2 Feb
 2024 15:19:45 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64%4]) with mapi id 15.20.7249.024; Fri, 2 Feb 2024
 15:19:45 +0000
Message-ID: <2c72f42e-2170-4cd3-b471-c079a754f9d1@amd.com>
Date: Fri, 2 Feb 2024 09:19:42 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm: Add drm_get_acpi_edid() helper
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: "open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20240201221119.42564-1-mario.limonciello@amd.com>
 <20240201221119.42564-3-mario.limonciello@amd.com> <878r43f9bd.fsf@intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <878r43f9bd.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0197.namprd04.prod.outlook.com
 (2603:10b6:806:126::22) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY8PR12MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: 9429d2e9-c4f7-41cc-c1ca-08dc2402631a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QLsYg1QH66oK0mTqX2+hqhC0VEG5E7ZuGDdABgU/5rkye4nuI3eK4HO4SbYM13J41FCdLXdjsBHozLabRllwMgej+Fgh4LA2BkRy/MOhzHg4rI3YqBRK/+NE14xBgLJ1TXkcxJ7stmox38e292JRfGWVtOV8DFQadHtRHLB0OrXUhztSliZuE+RH8m5zJbbHA5EenQS1wBRc6W3FLNEJ6jWY9Zd9U+JxHnYcMnZaB4t+kipkd53A8OpIT8q14f7+nd7ONau9uFvHPnjwhUHw4J0kUz24guK9RIZ+oVsc9kaf4tF9FJqkcqwASMs8KXzXZyHXzkpv1NlA3av+yQNtkXKG1XTLw9CswaDWOp4XQRxZNJ7zwV6vYApyP9c4n8OdmDoiZCVK0QdopMUfcGPkrhI9GhKFifruRAQy+w7qPTapoiK3+Nio8ZAxxkorye0KwLaMHV9U0qr/j9r+WaQ2MfkJz1JNvoBXlCQ8HqxiRF3NXb3zPGp+/Zo59Hw/wBSah3tfrKN8NDapSR1NvxVehfTP6y/Dxe53yPxzLSzAeybSMGMvj+iV3nihB9x+ZS2u+AOvusEKVTg4r8DxRAZ+jGCL4tjg+Dfycv34j6VjrgNppJ/Q6yFd+ynABXePGszNukEX3/w5CTyi5CA2of/yag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(2616005)(26005)(83380400001)(6486002)(478600001)(6506007)(53546011)(41300700001)(6666004)(66899024)(6512007)(36756003)(8676002)(4326008)(8936002)(31686004)(66476007)(316002)(66946007)(44832011)(54906003)(2906002)(66556008)(5660300002)(38100700002)(86362001)(110136005)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlMycGl0eEZxN0h5ZDU3d2hGbTBjL1VkUGNjYkFaWUxYYXBTVDV0YTRNYU5O?=
 =?utf-8?B?TU1kbFk2Uys0WHhsMlVjeFIwTXprVUJ0QjIrVkFEVzRHY0FnYmRyVTNLbXRi?=
 =?utf-8?B?c3lIQ1BndHJBNkR6bEo3RktPRHlDOGRCdW9XZzZ6em04dldJTkJYbnVJK0dF?=
 =?utf-8?B?TTFhNVdBb1ZPM3QySDN4ZkhUSDNRSkxvcUJ0alpSblJrM1BXajhXZVRPeTUx?=
 =?utf-8?B?VjhQTW1iRGxTbnZKMTBoZUVEU2RyQ2R0c2lSSjhDL3ViMDh5SjZDaWRaQUt2?=
 =?utf-8?B?bnBxNVU3c2VzSklwK0dya2JKSEpqb2FqWE5KbXQxcmVIV1kvTUpsZmdYb0pm?=
 =?utf-8?B?YXN6T2hFVSt1THRLMUw1WDNJSUFUeG5iNTJkNkJJTXhzcTNzNzB6TnFZUFRv?=
 =?utf-8?B?SllnTS8rMjFJRklTaWNjOEJrZEVnOTJENHRYRmMwcDBHU2xoakdsNGgzSm1G?=
 =?utf-8?B?ZTl2SCsxNFJ2K2E0VEUvbndUR0UyTlBkNmxwYTNuRkFpb204dE9wWnJrZVlt?=
 =?utf-8?B?ZE1rY0pUdWNUK2xRNWJFY3F5ZENpTTRJS1NBL0c1U2lFeUgvTFp0bW1iRENs?=
 =?utf-8?B?VE9BV2w5ak9WcTZXZldVOFJLMzBoQmNnNEg5d3ZTQmZRdklyeEwzUGFlSGQ5?=
 =?utf-8?B?cFVpYlA4bzJTVDRWb3NSMjRkSGdoZW5WTEcvQnk1RTVQQVBEemErSExueW1H?=
 =?utf-8?B?UkQyVjV0dDdoU3lIcFFhaVhhT21Od0w3UTdDd0p3bTN4NmhZNm5qOE5hdmlq?=
 =?utf-8?B?ay81YSt4Nm1uQTg0Z3lmL1lHRlhjS2pVSkdVQVIrWm5HaHdqODZwN1RwL0g0?=
 =?utf-8?B?elNLdFE1MHppZkJpLy9EQ2pwSDFncTJhY083bWtzSG80ckcvaDEzc1FBSUJJ?=
 =?utf-8?B?WVZYN3MvZ0lwRmkxYVdoelF6QnJOYzZndlM1YndyVm82YURqUytUMTN2V0d4?=
 =?utf-8?B?WFBHSWNwUDl6Q1k1STF2UFEwWVNlYUQ1WkdsYUVwRjBnVWh0TmQ4eDJLd3hZ?=
 =?utf-8?B?dHRiSmFrUFR6V0V5d0VIT0VBRW9WVGJod2RQNVBXTWJ2WWpXMUQvdjJWaERF?=
 =?utf-8?B?NXBRVkdIdWQvVVdIUmpCTWU1SWE3dG10R0hkTEZZOXFyWis4WHZ2bHoyRDdu?=
 =?utf-8?B?N0V0YVJJMUN3S0Y4TEpWZWJtSU9hVGY4ZXJFelZtb1dTUXlTOGNVMFlaYWtq?=
 =?utf-8?B?aERYS3MwQzhEVVMvcm5wcnhiZ1d5YzdoaUZRRk9lVkxSOU5zK1d0YStITUVL?=
 =?utf-8?B?RHZXMGRVUDJSaGI1RUVtRUJhK212K0xON0toZDBvay9CNlNicEV4ODVLRytR?=
 =?utf-8?B?M0NyaUVyOGtQSXViY3dKWXphUDRZUG1ySHRON3Z2TEl0RmJwQ25VdFBSMnZL?=
 =?utf-8?B?T0tGRUdKY3lnWTB6TitwTXlLMTVmcUNFNXFsRkVCb2YyNEs3RWR4NkVqbEdP?=
 =?utf-8?B?b3VxVjFrcllPMndzSFhzb2NleVpHdGd0bUlWK2EwUHB6SlR3UkkzeXNtd2Mv?=
 =?utf-8?B?UHd6VVc0MzRDQnZmQk5XVGRuRXVwT3RrN0hFWWFoWFJsYjVIL1hTV0hiMlVM?=
 =?utf-8?B?aU84SkZsUFF3VXFkejlHTHBBeVlwYmkwL1VBanNBcUg5NUlQZEtRUUpIZkdy?=
 =?utf-8?B?aHJBYkkremdONXhOZEV6d2prRjFGc0psM0JyYk1kR0FmWFloSTVPbEJNcTBS?=
 =?utf-8?B?S0tLTVN4aE40ZWZwOTRjUExCVlBhRE1sL21qb3BzZ2xSTjdvTEZJQUFkeXpz?=
 =?utf-8?B?UHNHRjJqLzVZUlVqdXFSNDRCY1FWbGxuT0dnODc2KzdKQ3hkUU5STlhWcHIx?=
 =?utf-8?B?MGYwMGN1blV2UVE1aTZ5L2lXcklUV294QWlGRmhrVk52bFg5YjdZQi8wZjVO?=
 =?utf-8?B?N2E5MWp6MEkzVVpsK3l0aTBGZHF6UmRWZVhnSEFXa1VPejBqclNqR3JaaWU0?=
 =?utf-8?B?ZzN3cHlPM0p5QWg4eE9WTWx1S3RiZmNRa2d5RGlpSXoyVnRtUFBzSzV5ZURL?=
 =?utf-8?B?UDEzK1RGWE8xZnVyU090dGZOT0YyZEg3Wjk5dDZzNWNqenpDVTZXQnBVdGZi?=
 =?utf-8?B?YmVjNytyUXdrQ3lKV20xSHJzeFp2YVFWWktnSkQ1QWxKYTQ2MzhoQjlYY2pT?=
 =?utf-8?Q?avrFZUinuHli1WgmHyECYG+0d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9429d2e9-c4f7-41cc-c1ca-08dc2402631a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 15:19:45.2269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwG3FiE6JzIIwjh/TRl55ugxEIo8xMrItdAta/xGuCrK6zL6VAF53gvePVQ++8mFBjDHaSTWmPMvPz32cE1FSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7612
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

On 2/2/2024 04:29, Jani Nikula wrote:
> On Thu, 01 Feb 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
>> Some manufacturers have intentionally put an EDID that differs from
>> the EDID on the internal panel on laptops.  Drivers can call this
>> helper to attempt to fetch the EDID from the BIOS's ACPI _DDC method.
> 
> I'm really not happy about adding new struct edid based APIs to
> drm_edid.[ch]. Everything new should be struct drm_edid based. All
> drivers should be converting towards struct drm_edid, instead of adding
> more legacy to rip out later.

OK; I'll redo it with struct drm_edid.

The changeover for amdgpu to use drm_edid is going to be a pretty 
involved effort so I'm going to use a get_raw in amdgpu for now so we 
can unblock the issue this is fixing and let that part get removed when 
the rest of the overhaul gets done there.

> 
> BR,
> Jani.
> 
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>> v1->v2:
>>   * Split code from previous amdgpu specific helper to generic drm helper.
>> v2->v3:
>>   * Add an extra select to fix a variety of randconfig errors found from
>>     LKP robot.
>> ---
>>   drivers/gpu/drm/Kconfig    |  5 +++
>>   drivers/gpu/drm/drm_edid.c | 73 ++++++++++++++++++++++++++++++++++++++
>>   include/drm/drm_edid.h     |  1 +
>>   3 files changed, 79 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 2520db0b776e..14df907c96c8 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -21,6 +21,11 @@ menuconfig DRM
>>   	select KCMP
>>   	select VIDEO_CMDLINE
>>   	select VIDEO_NOMODESET
>> +	select ACPI_VIDEO if ACPI
>> +	select BACKLIGHT_CLASS_DEVICE if ACPI
>> +	select INPUT if ACPI
>> +	select X86_PLATFORM_DEVICES if ACPI && X86
>> +	select ACPI_WMI if ACPI && X86
>>   	help
>>   	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
>>   	  introduced in XFree86 4.0. If you say Y here, you need to select
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 69c68804023f..1fbbeaa664b2 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -28,6 +28,7 @@
>>    * DEALINGS IN THE SOFTWARE.
>>    */
>>   
>> +#include <acpi/video.h>
>>   #include <linux/bitfield.h>
>>   #include <linux/cec.h>
>>   #include <linux/hdmi.h>
>> @@ -2188,6 +2189,47 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
>>   	return ret == xfers ? 0 : -1;
>>   }
>>   
>> +/**
>> + * drm_do_probe_acpi_edid() - get EDID information via ACPI _DDC
>> + * @data: struct drm_device
>> + * @buf: EDID data buffer to be filled
>> + * @block: 128 byte EDID block to start fetching from
>> + * @len: EDID data buffer length to fetch
>> + *
>> + * Try to fetch EDID information by calling acpi_video_get_edid() function.
>> + *
>> + * Return: 0 on success or error code on failure.
>> + */
>> +static int
>> +drm_do_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
>> +{
>> +	struct drm_device *ddev = data;
>> +	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
>> +	unsigned char start = block * EDID_LENGTH;
>> +	void *edid;
>> +	int r;
>> +
>> +	if (!acpidev)
>> +		return -ENODEV;
>> +
>> +	/* fetch the entire edid from BIOS */
>> +	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
>> +	if (r < 0) {
>> +		DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
>> +		return -EINVAL;
>> +	}
>> +	if (len > r || start > r || start + len > r) {
>> +		r = EINVAL;
>> +		goto cleanup;
>> +	}
>> +
>> +	memcpy(buf, edid + start, len);
>> +	r = 0;
>> +cleanup:
>> +	kfree(edid);
>> +	return r;
>> +}
>> +
>>   static void connector_bad_edid(struct drm_connector *connector,
>>   			       const struct edid *edid, int num_blocks)
>>   {
>> @@ -2643,6 +2685,37 @@ struct edid *drm_get_edid(struct drm_connector *connector,
>>   }
>>   EXPORT_SYMBOL(drm_get_edid);
>>   
>> +/**
>> + * drm_get_acpi_edid - get EDID data, if available
>> + * @connector: connector we're probing
>> + *
>> + * Use the BIOS to attempt to grab EDID data if possible.  If found,
>> + * attach it to the connector.
>> + *
>> + * Return: Pointer to valid EDID or NULL if we couldn't find any.
>> + */
>> +struct edid *drm_get_acpi_edid(struct drm_connector *connector)
>> +{
>> +	struct edid *edid = NULL;
>> +
>> +	switch (connector->connector_type) {
>> +	case DRM_MODE_CONNECTOR_LVDS:
>> +	case DRM_MODE_CONNECTOR_eDP:
>> +		break;
>> +	default:
>> +		return NULL;
>> +	}
>> +
>> +	if (connector->force == DRM_FORCE_OFF)
>> +		return NULL;
>> +
>> +	edid = _drm_do_get_edid(connector, drm_do_probe_acpi_edid, connector->dev, NULL);
>> +
>> +	drm_connector_update_edid_property(connector, edid);
>> +	return edid;
>> +}
>> +EXPORT_SYMBOL(drm_get_acpi_edid);
>> +
>>   /**
>>    * drm_edid_read_custom - Read EDID data using given EDID block read function
>>    * @connector: Connector to use
>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>> index 518d1b8106c7..60fbdc06badc 100644
>> --- a/include/drm/drm_edid.h
>> +++ b/include/drm/drm_edid.h
>> @@ -412,6 +412,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>>   	void *data);
>>   struct edid *drm_get_edid(struct drm_connector *connector,
>>   			  struct i2c_adapter *adapter);
>> +struct edid *drm_get_acpi_edid(struct drm_connector *connector);
>>   u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
>>   struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
>>   				     struct i2c_adapter *adapter);
> 

