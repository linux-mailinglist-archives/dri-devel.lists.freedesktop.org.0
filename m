Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A89E4856C57
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 19:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F1110E909;
	Thu, 15 Feb 2024 18:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cMgRwyI8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7A010E6EE;
 Thu, 15 Feb 2024 18:21:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMpDUPtpt0WGTZwZ9S9IVc2M693FP+GqMXSGJHLz6m9NwfeK02cUZbQCRNZ2o4AE0TvOXCWUQuxGtFK4TSaUY9x0F029619OdDzu4fCOgkBhkLmcoaJ9yCi4fCOt4TJNptjeijGR49SpdRCKy+lwB00s49lLabTAVECxA020XSsB78BdPsfP0UTHkT55V/AK2QLTg6elu5xFaw2FRnk90lmQBZPxeFs19ooQDM8YSX9zoDixKgYn6jDDQmoLnOPnslL0fvmHaxdfowi+yesyMN7Kr2gSRZ/NTJDEKjN39a4Fxfo9CRWk4tp/LcBWHTDxxEOUmXBNBlW4vAwfu3MKaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1r6gLBZefAC96kU3hPSZuqgTeztWnPCUBD3QWEyHtv4=;
 b=IAVsg4+1EEPHliyLtK48pO+85YM8w1MZdCvaRrYMnYf9Ak/TSwXnBPfO7VVXjpwo9FDfyUQRTkoOSGNJUigiCbHAQCE18YJ3kHCQ3PNYYEJQ5BA16fbRMreaI9GNoNwUENUHDrgH4kW02cs3n/BXWWjgD/1JFY0ohHzR9HbU++pEMkPMEg8c3qrDo1qMttvfZ4fE99EtBk//xlZf8LOjiTYBGAUJCiFHaL9McvAArxjh6iKRHO8Y9RQuwesquUn5HnyhC1xJuNWc8+VqE3QupfJMyoZlqMNj28O6HGg3v7IBaJEf/0Mfy0pgkB4FCZxiVOCp07GX/bAtzukb3LrGfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1r6gLBZefAC96kU3hPSZuqgTeztWnPCUBD3QWEyHtv4=;
 b=cMgRwyI88rkJYm3d4ymXMBY/4HbR+lPZXtfglmfHMaiQklhgWp/7iKJ9/g5emkGKraWFwuLWAA62MTqebeaRaWcg6iGd6EYGBhR64xPxe3YFeM7aNiAErb0o5nyB/sBytEvHDkWKh8vix/efvj8dmq/Pf6KDH4xdrEGyw8OGgyw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Thu, 15 Feb
 2024 18:20:59 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a%7]) with mapi id 15.20.7316.012; Thu, 15 Feb 2024
 18:20:59 +0000
Message-ID: <9831e9bc-d55f-4a72-950a-684a757af59c@amd.com>
Date: Thu, 15 Feb 2024 12:20:56 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] drm: Add support to get EDID from ACPI
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Alex Deucher <alexander.deucher@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 linux-fbdev@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 intel-xe@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Melissa Wen <mwen@igalia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20240214215756.6530-1-mario.limonciello@amd.com>
 <20240214215756.6530-4-mario.limonciello@amd.com>
 <Zc1JEg5mC0ww_BeU@intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <Zc1JEg5mC0ww_BeU@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0227.namprd04.prod.outlook.com
 (2603:10b6:806:127::22) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c45bc0-72d5-41d3-4f3b-08dc2e52dbf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R5sNtKshCleh/IeS5tewx7heFcTqJ1vMwDGT3JpqZrblq2IbZfspWcRvqmJX2kWqgjjTKF5CeCuXKKKoFKH3rLshY8fut2Mo9Y+4g32LjOvDEdLZAAAUKvtxQd+wblBNIsGIS0sDQcxieQ+uWjImMdfoCSWR3qJbzC7QMD8Be6i8QaPmSTtrZA688WIS4sZis7YDBYD67FBV17cRWSBDqCZUDDFl4PUjCHAn5JJPfZRe5PmRj42r2kevZ597nCBRaePjDs64Lhrtv4zHKHz64n6yJPfgcXKXQeq7kThXVk1MFb2inDdSHMVkmEmYwtL/RMUzmNsbEVMk8U05PAAr+RNIaBDqpKipOQ6JAN1J5WjEO4v7m8q6quSB9+U7hAmHoquyQBuU5XlAxbwKjfebprkmZgyQr/SvYZkq2i1CwWVVkUWoBc4O6Za2yKQwnRX+2Ql8cuKTriyNwBZBRmPzq9HMUBQosCXZAe/RTPWENXTb5vR1cCQb6LaNKeyYQ8yLIEQNGHki1LjpB9OCEFr8VR895kmPnJgNbKB8OEKQNs0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(366004)(136003)(396003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(83380400001)(66899024)(31696002)(86362001)(66476007)(6916009)(316002)(66946007)(66556008)(2616005)(6506007)(6512007)(54906003)(53546011)(966005)(6486002)(44832011)(478600001)(66574015)(5660300002)(7416002)(2906002)(6666004)(8676002)(8936002)(4326008)(31686004)(36756003)(38100700002)(26005)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHdkamxOYTgxd1B2Kzg0OU9jSkkvY3hEVktRTHZYSk8vbUc1UWp4U0VwdUVp?=
 =?utf-8?B?OXhZQUFiQlhXNVBFVVhZOXZEeWpuTkRPNk0zSmkwU0dYN2M3dEl2R3RRK0o1?=
 =?utf-8?B?dGsyb211anVrK3J2R3hOZnlvQWVSRE1IVG9hbkpRcFJhMWpURTRFcmpLc2Ja?=
 =?utf-8?B?cmtIVzJTM0d4NVZodmdQZVViMW1rR2g4MHpVcXNaczBoVzRuajhKckZLOVE1?=
 =?utf-8?B?SzJDWm1WTTMwUGhScEVIQyt3NzQraEpWUllPVk42RkUzRE5OOGU2VzZtbFdY?=
 =?utf-8?B?dFdwMkxpMHBTYzhzc2FyeE9Hbzl5YzJ4dFFzUW1mOFFtZjlvYnJiaGJzemJS?=
 =?utf-8?B?TlkwckFkUlp1ZFhnR1FxcEEyVmhJYjdoR1ZZdytjaVJRZlNwbk9weUdkdk9q?=
 =?utf-8?B?aExwWi93TDUrd0VERzBtcTdLMkZoa2NzQVJzY2hjTEpDSTVtMGticjhyK05Z?=
 =?utf-8?B?SXlzSVBrNXBadm51bXJLL3dITWVwMTQrN3l4bUhyQ1ZRN2pPK1NYTGpPeVVC?=
 =?utf-8?B?QU5oNW5TM1dURGczbE5hWDhNa0V6blUwb0VyU0hKNWlJaWJPTEhTUWRaOVhB?=
 =?utf-8?B?NXZadTQ1dVVMYWlGT2ZPNFBNNUcvcWFNTFpQSzJtMFBjUFRQa0tNOXpiQTZU?=
 =?utf-8?B?N0pGNG5hMzJQNExPQVNFbXlqR2g1MUErbnhocHY4WDMyMVFwb0VseVNpQit1?=
 =?utf-8?B?Mmx4Y0g5OExDandqVnJ3QldHaGZqQnd2UFNUK3k0aHFGT2ROdzAvMmJTaEs2?=
 =?utf-8?B?cDBBWjZ0U0d0WXg3R3R1akk1RG1yY2FzVks1aXJxTDdIMDZBQjY2eDhiOGE2?=
 =?utf-8?B?RmNRZU5Wd1FCZmxVSVBuTVhON1hjOG50M20wMlAxeEVaOXVoZGkxVW94by9q?=
 =?utf-8?B?czNxbHNXMkYvV1d2VG8xWmtSNUZhZDNIeXFMNHd5Q0VBNVBPSTlYRklWTC8v?=
 =?utf-8?B?NmtBMTJRV0t5cjl2Nzc1OG9ra21QeVhMdHg1LzNpa3NPV2c0bkhQbm9YcGps?=
 =?utf-8?B?REVaMy9wTjBWTVJIc2RmMDhwOUVYRnlnWHd0WUpvbVdrdVFFTlVoek84MjhS?=
 =?utf-8?B?bkYxRlVyOUFUNUpYYktWd2RDUWFTRTA4MlZNdEJ2THNnYU5udTBKbGNpR2Vr?=
 =?utf-8?B?ZXNra1VzT2lsemVhZEd0WkRTQ2xNUGEyMk9QNkQ4bkhpV2FYT3AwUEI1bWFW?=
 =?utf-8?B?TC85VUNrb2xqZjJhL2ozV01Tc2NsNlFEdXdzaWZSM1pSd3I2YTJWREZzUnV5?=
 =?utf-8?B?MzcvK1lHbWlRUnloUnhRd1g2SDdHUm1pbnNVVURGSjdmc0pzano5WWxJT1RW?=
 =?utf-8?B?TVE4Vm9IYVFpcXZyT3k3dE9LZFVxdUY1TjhBYzl6TkxncGhTVkxBUkttNERl?=
 =?utf-8?B?ODZ0dGhiYnRjeEhTQ3BiYWp3aVIvV3VEdW0wbXdKSTF6ZnMyLzVIWENZUXB6?=
 =?utf-8?B?Q3d0R2lDRlkrQzhIMFlIL2JpNU93c1VkSWZDWWdHdWdLUmtpVjJFaHNGVzJR?=
 =?utf-8?B?U3h2UGFTbXJ6U2thK3ZTcE4rNGRBbkJOazFKMU11Zy9oVG5OcUs1N0F5M3R2?=
 =?utf-8?B?WnpXSzg3elF0UC9HQk5SYnFFajlGemhsYzBXdk1oOHpub3ZPM21FTGM4TE9D?=
 =?utf-8?B?SDE0OEhRNWh4a1A1VENoMTlIU2RBMzRtY0pkUFI3NjJjeU5PRlEwYVNuQ0Fh?=
 =?utf-8?B?SkJZWEF4TVNKWUF4b0NpUFQ2dTVrN3BqUCtWZ3U1enRyaUk0SEp3NzFnOGV0?=
 =?utf-8?B?WjI3VDQvYW1Cak5qNENEeGppcnVTNEFxVXB1UlZvMFQvdlVRZ2VacFVjdmZT?=
 =?utf-8?B?Z2xNWTZCNDVaSWE0Q2F2aVFVNERRWnFWUFdsd0FoUjVGdVprQ0hmSy85OUR6?=
 =?utf-8?B?eVB1bVNmWHljeUNjZnU0WlBMckdjbmV4ay9PUlBHOUx5SDZiNDlxazdZZGNw?=
 =?utf-8?B?c1dmaTVZSkplaU5pN0lUWVRnU3EydHo0dTlJUjVyclpOWmxmOWMyYytqYXE0?=
 =?utf-8?B?eVNwVHM1NUpNTzllQWRucCs4M1RUNGhTWUZxVk5WeHVudFQ1d1R3UnJUdkNp?=
 =?utf-8?B?czZjOHJvMDZzbXZ2TGVKcEdyNHZDNXBBSEU1cC9WaGRYUzNLRUx2Q213cnN0?=
 =?utf-8?Q?H8p77uOsl0/mGGjNSY10kR8ua?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c45bc0-72d5-41d3-4f3b-08dc2e52dbf7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 18:20:59.4610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOsqDl9/LArWFLEdw5E7GBmm76U6jDHZ6RMfHO1wFDSZc/Txyx7TbryelGDC3TV7c9YFe8E2tAprR8tKHEu5Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459
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

On 2/14/2024 17:13, Ville Syrjälä wrote:
> On Wed, Feb 14, 2024 at 03:57:54PM -0600, Mario Limonciello wrote:
>> Some manufacturers have intentionally put an EDID that differs from
>> the EDID on the internal panel on laptops.  Drivers that prefer to
>> fetch this EDID can set a bit on the drm_connector to indicate that
>> the DRM EDID helpers should try to fetch it and it is preferred if
>> it's present.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/gpu/drm/Kconfig     |   1 +
>>   drivers/gpu/drm/drm_edid.c  | 109 +++++++++++++++++++++++++++++++++---
>>   include/drm/drm_connector.h |   6 ++
>>   include/drm/drm_edid.h      |   1 +
>>   4 files changed, 109 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 872edb47bb53..3db89e6af01d 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -8,6 +8,7 @@
>>   menuconfig DRM
>>   	tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)"
>>   	depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && HAS_DMA
>> +	depends on (ACPI_VIDEO || ACPI_VIDEO=n)
>>   	select DRM_PANEL_ORIENTATION_QUIRKS
>>   	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
>>   	select FB_CORE if DRM_FBDEV_EMULATION
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 923c4423151c..cdc30c6d05d5 100644
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
>> @@ -2188,6 +2189,58 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
>>   	return ret == xfers ? 0 : -1;
>>   }
>>   
>> +/**
>> + * drm_do_probe_acpi_edid() - get EDID information via ACPI _DDC
>> + * @data: struct drm_connector
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
>> +	struct drm_connector *connector = data;
>> +	struct drm_device *ddev = connector->dev;
>> +	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
>> +	unsigned char start = block * EDID_LENGTH;
>> +	void *edid;
>> +	int r;
>> +
>> +	if (!acpidev)
>> +		return -ENODEV;
>> +
>> +	switch (connector->connector_type) {
>> +	case DRM_MODE_CONNECTOR_LVDS:
>> +	case DRM_MODE_CONNECTOR_eDP:
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
> 
> We could have other types of connectors that want this too.
> I don't see any real benefit in having this check tbh. Drivers
> should simply notset the flag on connectors where it won't work,
> and only the driver can really know that.

Ack.

> 
>> +	/* fetch the entire edid from BIOS */
>> +	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
>> +	if (r < 0) {
>> +		DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
>> +		return r;
>> +	}
>> +	if (len > r || start > r || start + len > r) {
>> +		r = -EINVAL;
>> +		goto cleanup;
>> +	}
>> +
>> +	memcpy(buf, edid + start, len);
>> +	r = 0;
>> +
>> +cleanup:
>> +	kfree(edid);
>> +
>> +	return r;
>> +}
>> +
>>   static void connector_bad_edid(struct drm_connector *connector,
>>   			       const struct edid *edid, int num_blocks)
>>   {
>> @@ -2621,7 +2674,8 @@ EXPORT_SYMBOL(drm_probe_ddc);
>>    * @connector: connector we're probing
>>    * @adapter: I2C adapter to use for DDC
>>    *
>> - * Poke the given I2C channel to grab EDID data if possible.  If found,
>> + * If the connector allows it, try to fetch EDID data using ACPI. If not found
>> + * poke the given I2C channel to grab EDID data if possible.  If found,
>>    * attach it to the connector.
>>    *
>>    * Return: Pointer to valid EDID or NULL if we couldn't find any.
>> @@ -2629,20 +2683,50 @@ EXPORT_SYMBOL(drm_probe_ddc);
>>   struct edid *drm_get_edid(struct drm_connector *connector,
>>   			  struct i2c_adapter *adapter)
>>   {
>> -	struct edid *edid;
>> +	struct edid *edid = NULL;
>>   
>>   	if (connector->force == DRM_FORCE_OFF)
>>   		return NULL;
>>   
>> -	if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
>> -		return NULL;
>> +	if (connector->acpi_edid_allowed)
>> +		edid = _drm_do_get_edid(connector, drm_do_probe_acpi_edid, connector, NULL);
>> +
>> +	if (!edid) {
>> +		if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
>> +			return NULL;
>> +		edid = _drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter, NULL);
>> +	}
>>   
>> -	edid = _drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter, NULL);
>>   	drm_connector_update_edid_property(connector, edid);
>>   	return edid;
>>   }
>>   EXPORT_SYMBOL(drm_get_edid);
>>   
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
>> +const struct drm_edid *drm_edid_read_acpi(struct drm_connector *connector)
>> +{
>> +	const struct drm_edid *drm_edid;
>> +
>> +	if (connector->force == DRM_FORCE_OFF)
>> +		return NULL;
>> +
>> +	drm_edid = drm_edid_read_custom(connector, drm_do_probe_acpi_edid, connector);
>> +
>> +	/* Note: Do *not* call connector updates here. */
>> +
>> +	return drm_edid;
>> +}
>> +EXPORT_SYMBOL(drm_edid_read_acpi);
>> +
>>   /**
>>    * drm_edid_read_custom - Read EDID data using given EDID block read function
>>    * @connector: Connector to use
>> @@ -2727,10 +2811,11 @@ const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
>>   EXPORT_SYMBOL(drm_edid_read_ddc);
>>   
>>   /**
>> - * drm_edid_read - Read EDID data using connector's I2C adapter
>> + * drm_edid_read - Read EDID data using BIOS or connector's I2C adapter
>>    * @connector: Connector to use
>>    *
>> - * Read EDID using the connector's I2C adapter.
>> + * Read EDID from BIOS if allowed by connector or by using the connector's
>> + * I2C adapter.
>>    *
>>    * The EDID may be overridden using debugfs override_edid or firmware EDID
>>    * (drm_edid_load_firmware() and drm.edid_firmware parameter), in this priority
>> @@ -2742,10 +2827,18 @@ EXPORT_SYMBOL(drm_edid_read_ddc);
>>    */
>>   const struct drm_edid *drm_edid_read(struct drm_connector *connector)
>>   {
>> +	const struct drm_edid *drm_edid = NULL;
>> +
>>   	if (drm_WARN_ON(connector->dev, !connector->ddc))
>>   		return NULL;
>>   
>> -	return drm_edid_read_ddc(connector, connector->ddc);
>> +	if (connector->acpi_edid_allowed)
> 
> That should probably be called 'prefer_acpi_edid' or something
> since it's the first choice when the flag is set.

OK.

> 
> But I'm not so sure there's any real benefit in having this
> flag at all. You anyway have to modify the driver to use this,
> so why not just have the driver do the call directly instead of
> adding this extra detour via the flag?

This was proposed by Maxime Ripard during v4.

https://lore.kernel.org/dri-devel/ysm2e3vczov7z7vezmexe35fjnkhsakud3elsgggedhk2lknlz@cx7j44y354db/

> 
>> +		drm_edid = drm_edid_read_acpi(connector);
>> +
>> +	if (!drm_edid)
>> +		drm_edid = drm_edid_read_ddc(connector, connector->ddc);
>> +
>> +	return drm_edid;
>>   }
>>   EXPORT_SYMBOL(drm_edid_read);
>>   
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index fe88d7fc6b8f..74ed47f37a69 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -1886,6 +1886,12 @@ struct drm_connector {
>>   
>>   	/** @hdr_sink_metadata: HDR Metadata Information read from sink */
>>   	struct hdr_sink_metadata hdr_sink_metadata;
>> +
>> +	/**
>> +	 * @acpi_edid_allowed: Get the EDID from the BIOS, if available.
>> +	 * This is only applicable to eDP and LVDS displays.
>> +	 */
>> +	bool acpi_edid_allowed;
> 
> Aren't there other bools/small stuff in there for tighter packing?

Does the compiler automatically do the packing if you put bools nearby 
in a struct?  If so; TIL.

> 
>>   };
>>   
>>   #define obj_to_connector(x) container_of(x, struct drm_connector, base)
>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>> index 7923bc00dc7a..1c1ee927de9c 100644
>> --- a/include/drm/drm_edid.h
>> +++ b/include/drm/drm_edid.h
>> @@ -459,5 +459,6 @@ bool drm_edid_is_digital(const struct drm_edid *drm_edid);
>>   
>>   const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>>   				  int ext_id, int *ext_index);
>> +const struct drm_edid *drm_edid_read_acpi(struct drm_connector *connector);
>>   
>>   #endif /* __DRM_EDID_H__ */
>> -- 
>> 2.34.1
> 

