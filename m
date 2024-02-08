Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B1E84E7FF
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 19:48:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C60210EA1B;
	Thu,  8 Feb 2024 18:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="F7H2h5Ry";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2064.outbound.protection.outlook.com [40.107.100.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF1410EA16;
 Thu,  8 Feb 2024 18:48:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nG2dNd2rEY7Ww9D0zWiZVnXDAfxSgeeh6AkpsmdNGircqkHPAIrVnpl+61MHmm/5+krGRUwJa0xxFKE7wpnPGfSkERWgVKyB4Nyvl+4+yjXJSYudCCkpab3uN1kY++i3GHDsXOwKs/TG2/GNOs7TYpl6tnBP4bn2xSvhCI+fbhzRcIWKyD+5BWx6X3G22znyDdVfn09SeWuABAuQNuz7K88yoiKCeusunaGnJyRmLQ7UHFSs/k6Vg0wkGhHu/12GTkYQj3Vkn5uusl0FRTO/izKGEalYG/dc0Ek6MRi/LZQK+AKHEPgFmC4wdUbd2dXVFDuVF6m1Rctn7tooda2DJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqNIM+7E9RN52RQqYZVmvOGnzBPRJcnusawxDFKy46A=;
 b=kaxC3VLJy39rCgh9yW0qGke7kuIiNUyhn/MSxJG3U7W692Txutp9NILfSKPbLMtfdhJOFOj7yI9L1N88wcP0l8fMLtqeLyyZTMvcqB9m+zAW+3qGMfA9unHXIFRTXsue1usPcbUBKaJkaLxPIJbQKio8cu8rKJskkc3o4irLtF+c9CaV0PPAqXX4funGyaI+eBjdAfuP6Cbny2jczrtPL5w3TpnbOiknwrJbCSW+TY5ol7/PnkxoryOvhQTR/7i3FtlXZNcDHs2EWn2WHp5eFOI+bSJSnOkam442WicnL7RZEGcIUuHL80nyxA0V6Oho5yQGQmVJORn+RDIdht87Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqNIM+7E9RN52RQqYZVmvOGnzBPRJcnusawxDFKy46A=;
 b=F7H2h5Ryr0F6MQTtFYL6dcWOYr0H47PtOszVRBoaFuxj5BnQXOWqCiYAEd9bSOzpLaCrpj0rGZ94Ruf5Olm3uRStvnWwFqBk1cgP1FKIIVtMuXQGZV8B8hBGwlQM94LyenMkmwWcETEnBcfSxjDcImnbQGSi4EdiULZIIXVvcJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by LV3PR12MB9215.namprd12.prod.outlook.com (2603:10b6:408:1a0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.14; Thu, 8 Feb
 2024 18:48:41 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f6d2:541d:5eda:d826]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f6d2:541d:5eda:d826%5]) with mapi id 15.20.7270.016; Thu, 8 Feb 2024
 18:48:41 +0000
Message-ID: <70c1b737-d4f5-4e66-8ee5-c9af22cec85c@amd.com>
Date: Thu, 8 Feb 2024 12:48:38 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm: Add drm_get_acpi_edid() helper
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: amd-gfx@lists.freedesktop.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Melissa Wen <mwen@igalia.com>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20240207224429.104625-1-mario.limonciello@amd.com>
 <20240207224429.104625-2-mario.limonciello@amd.com>
 <87y1bvb7ns.fsf@intel.com>
 <ysm2e3vczov7z7vezmexe35fjnkhsakud3elsgggedhk2lknlz@cx7j44y354db>
 <87sf23auxv.fsf@intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <87sf23auxv.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR02CA0039.namprd02.prod.outlook.com
 (2603:10b6:5:177::16) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|LV3PR12MB9215:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d0ce743-e4e0-41f6-58e2-08dc28d691de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U87DmfugsBJA99/khL/IWd+/XfynsfpMwVhr84BeZIhVgbHWRc9/32DOLxDinstruLU62NT5IvMqTAnWz1ziJ+CD59tPu0KrzsdQ9YY2LjY8027R8fHHl6eGigQKr0c5HRFMzrs0q0I23tyeW5EDqJn+XPZ72u17xR1zTVJbPm2Ukl8hbA0cPMK7W/Hcd2fH9FMtHDAmTzQTunt3KxEx6kT5V+y0AxeJxVUl8rSwrlXL0BfXQUM2cGPD3ELFkrbO/brfjfvbo2nzx1k51zT6nrYn9bVetT4WtTHgRHzEthxRP15ioEGRiAW+HGjt40C2ImnyGKJMp+R3wpxQMjOn4HUjY6I+KNWSCcV+4TbDmppbdqJh6CJ1rwQ91HbAWtFRMdEiIgaVOLYsfsw+e1qqdPW1I22+OFAwIHEu0J1bqFlN+R6QcivC5oENXqWrm9+Ryr4qMOA4Rlf0SH3FrYINLaYyRyFUZYOHlswnlE5nDE3lNMjyMxVc7gxIg9XeCgXBbsz2oTzUwBTszl16BrCx2ZEL1mpwRDs86IKWNB1AoqWcEOt0OU4OCio1K4ZI0sUw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(31686004)(36756003)(66899024)(26005)(53546011)(41300700001)(6486002)(54906003)(86362001)(478600001)(6512007)(5660300002)(66476007)(2616005)(31696002)(66946007)(8936002)(44832011)(8676002)(66556008)(38100700002)(4326008)(6666004)(83380400001)(110136005)(7416002)(2906002)(6506007)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2wwRGpWSGtRNzVRSkF2UDRObXliZDFuSTlmUEtzditZcVE5VFdCQUgxQmor?=
 =?utf-8?B?T2JOZ0dFVU50ZllqVUppcXlNSHQ2cVA2ajl2NHV5djIwY3VvampIdE9rYmVM?=
 =?utf-8?B?bG1UcWMrYklya3hzTzg3ME1NMU5PaTNNWlRmODVnTUdFNnBtK0hHbHEyUlJU?=
 =?utf-8?B?Vklva0hueVlGcVJtLy85SS9BSGdZVkFUOXQyZ1hYSGw4bkdvMzFQSHBURmg4?=
 =?utf-8?B?Z3ZsK0dNbmVGd0tveG1jTXJ4eElIMFpmbWZFR2F3MXVCMWdxNXM0bXpJdnNS?=
 =?utf-8?B?RzQrMkJRbWFmaS9EM1NCZnR3dFFHYVM4cDNxTEtDdFJFWkUxNk5tWVY1RkVa?=
 =?utf-8?B?c0hGMks3M1NOTXZTamZWWUtMNUtlejRrY0xLalBDZHd0S0xJZkRnaEpaTUsr?=
 =?utf-8?B?bzNwdXFtZ1NyakNCdUY0NmJ1dDc1YkR3dStiL1JpNUYrWUlWajF0d0huVVND?=
 =?utf-8?B?Y3VHa0p1VjBBWExPUDJ2YVdNcDc5ellXYXB5WXo4VjdaUnBVZ1lrTFNKajdK?=
 =?utf-8?B?UnZUcnl0WS9GSnJVVVAzeDNRTHRhK3E1em9vVmdBQ2ZyN296dkxzTi9wRTlW?=
 =?utf-8?B?dUF2T3kvNEtid1JrZFA3c2xmenNjYWJwZGFXTDFlWmJpWnhGblNiOTdlcGJT?=
 =?utf-8?B?cnNrcDI4S1QxV2tES1grZzR0aEFDV3lxYTZvMkNDOWVsdndhdFlQVmVWaTZ1?=
 =?utf-8?B?RTZOTWpZZHBPc3U2ZU8rdGJETnROTmFtaFZLSUpDNW82YjlueWtBeER0RlRS?=
 =?utf-8?B?cStNQTJFcWQyL1Z0dlVXekw4ZHBDbEhhVEpOdzdoZ2UrUERBWEszNjRqeFp1?=
 =?utf-8?B?aExodG9wbUNPUjBtQ3lWdXpmMlVqQVZIOVR2OGZyNit3cDRVYXQyRmhUZENF?=
 =?utf-8?B?cU9IV09qSGdOWGErd2xTVlZNUE5CbGtaVkcrRWUvVkhsOXhRM3FOZnJkaG82?=
 =?utf-8?B?VytMd2c0RFlwNFhrMnJQV2xRalpuVXBJSVJxWjJVM0s0S1NqYmFlZGozYnlU?=
 =?utf-8?B?TVl5VlZrR204aGpxNkhQdVRPdGVQbG5pTVhLZVdqaHJHWm1NMU5Laktuc0Fx?=
 =?utf-8?B?WExUalgrSFBYSVhaZ0ExSEl2OUVjeUNwZUJJRis0M1Y3VEhOYkEvYnpXYWlG?=
 =?utf-8?B?Z2dMcUVSNGFLRkorcFZIdHVsTFl1blpyOE5vdStFZ2Fkejk4ZURWUDNzSUhj?=
 =?utf-8?B?d0Z5MVVOTHdNaGZnN2FQaXl2NWVXS1VaQW0rS3Y0TnpqNVc1azZjL0xOSWta?=
 =?utf-8?B?OFJKSDN0S1lnYk9ZYkErK2dTRVdYNlI5djNxQWFleDZ2U2pLOGFPZHNMT0xq?=
 =?utf-8?B?Mk4vRy83S1NhK2VRZkN2aTlYdTU1ZnlRd1Q1cHRrVGtHTzdGS3plOXBob21V?=
 =?utf-8?B?Y2p5WHQrdU9UYmowM2R4a0V1NlJJWXgvKzAzWjN2QkNMRlZqTGVXQ3JCR1A2?=
 =?utf-8?B?R0ZGMVp1QTE5eVJBSEh2am1xTHF3V1NtUnpZdGloNUYxM1ZQaUxlU2lsVDZa?=
 =?utf-8?B?QVBQcGRQZjdzYThoSlVtOHhHM0tBZlhta2EyU2FUZk4xeFFUQWx2N3VHWW55?=
 =?utf-8?B?bThoS094UUt2UHk0U2NEbms4OFRHT0dTNzRPMnBEODNlbGlJWXBFSUZSNVBV?=
 =?utf-8?B?SDJieVptMzVEU2NhclRvd2JWRnVsd1hZQWYyeGh2SUJLa2ZjdGxNWHZPaVZK?=
 =?utf-8?B?WDMvL3ppRDVPVnMxUzk5Nk5FcmY5YWNjdUJrSEYwTjBRRk11Q1pGZWZZdlJ0?=
 =?utf-8?B?eWZNaVhBU3pLeTNaby9MaHNkcTFqcC96SVNETXB0KzNKR3hqeWt0OEEybGVj?=
 =?utf-8?B?Rm8wbXROd2N1RGs4YlhVYkliNHVocysrRXBQZHRyR1NHd3BpbXIvZkVSZHpi?=
 =?utf-8?B?QzM2UXpIdjZsMXgyZHhwYWlyYTZHVjFSck4weGcxekRyazN1Ni91L3pxRU1R?=
 =?utf-8?B?SGRnbmo1QVV5TGQrZlh3TnJ2dnlwblZCMWU1Wk9GVEw2QktJWGJzMWNPUnpp?=
 =?utf-8?B?SE1jeW5BdEZXcFVaRkl5OGdoanY4aG1ldVd3K29uQ1lDcTRkb1R2NFhDSStN?=
 =?utf-8?B?SzE3ekJDM0gvdnluRFZJSWl1R0JRRGltVGRiNzJVR3ArWFg2S1A2NGlkWHdz?=
 =?utf-8?Q?csDBJ3/v/imTsMVuR0RG4KVBe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0ce743-e4e0-41f6-58e2-08dc28d691de
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 18:48:41.6427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sR0DrMyqOlE4nMR0hbh+g5xx+G6Hm9Yp2r9cbp4+Exydmt1jluqLStaruzwwEWt7HFqbJTiWpHsmslgRt1W87w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9215
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

On 2/8/2024 08:31, Jani Nikula wrote:
> On Thu, 08 Feb 2024, Maxime Ripard <mripard@kernel.org> wrote:
>> On Thu, Feb 08, 2024 at 11:57:11AM +0200, Jani Nikula wrote:
>>> On Wed, 07 Feb 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
>>>> Some manufacturers have intentionally put an EDID that differs from
>>>> the EDID on the internal panel on laptops.  Drivers can call this
>>>> helper to attempt to fetch the EDID from the BIOS's ACPI _DDC method.
>>>>
>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/Kconfig    |  5 +++
>>>>   drivers/gpu/drm/drm_edid.c | 77 ++++++++++++++++++++++++++++++++++++++
>>>>   include/drm/drm_edid.h     |  1 +
>>>>   3 files changed, 83 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>>> index 6ec33d36f3a4..ec2bb71e8b36 100644
>>>> --- a/drivers/gpu/drm/Kconfig
>>>> +++ b/drivers/gpu/drm/Kconfig
>>>> @@ -21,6 +21,11 @@ menuconfig DRM
>>>>   	select KCMP
>>>>   	select VIDEO_CMDLINE
>>>>   	select VIDEO_NOMODESET
>>>> +	select ACPI_VIDEO if ACPI
>>>> +	select BACKLIGHT_CLASS_DEVICE if ACPI
>>>> +	select INPUT if ACPI
>>>> +	select X86_PLATFORM_DEVICES if ACPI && X86
>>>> +	select ACPI_WMI if ACPI && X86
>>>
>>> I think I'll defer to drm maintainers on whether this is okay or
>>> something to be avoided.

It's pretty much the same thing that all the other drivers do right now.
Because the symbol is now used by DRM it needs to do this.

Patch 3 in this version of the series tears it out from all the drivers.

>>>
>>>
>>>>   	help
>>>>   	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
>>>>   	  introduced in XFree86 4.0. If you say Y here, you need to select
>>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>>>> index 923c4423151c..c649b4f9fd8e 100644
>>>> --- a/drivers/gpu/drm/drm_edid.c
>>>> +++ b/drivers/gpu/drm/drm_edid.c
>>>> @@ -28,6 +28,7 @@
>>>>    * DEALINGS IN THE SOFTWARE.
>>>>    */
>>>>   
>>>> +#include <acpi/video.h>
>>>>   #include <linux/bitfield.h>
>>>>   #include <linux/cec.h>
>>>>   #include <linux/hdmi.h>
>>>> @@ -2188,6 +2189,49 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
>>>>   	return ret == xfers ? 0 : -1;
>>>>   }
>>>>   
>>>> +/**
>>>> + * drm_do_probe_acpi_edid() - get EDID information via ACPI _DDC
>>>> + * @data: struct drm_device
>>>> + * @buf: EDID data buffer to be filled
>>>> + * @block: 128 byte EDID block to start fetching from
>>>> + * @len: EDID data buffer length to fetch
>>>> + *
>>>> + * Try to fetch EDID information by calling acpi_video_get_edid() function.
>>>> + *
>>>> + * Return: 0 on success or error code on failure.
>>>> + */
>>>> +static int
>>>> +drm_do_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
>>>> +{
>>>> +	struct drm_device *ddev = data;
>>>> +	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
>>>> +	unsigned char start = block * EDID_LENGTH;
>>>> +	void *edid;
>>>> +	int r;
>>>> +
>>>> +	if (!acpidev)
>>>> +		return -ENODEV;
>>>> +
>>>> +	/* fetch the entire edid from BIOS */
>>>> +	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
>>>> +	if (r < 0) {
>>>> +		DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
>>>> +		return -EINVAL;
>>>> +	}
>>>> +	if (len > r || start > r || start + len > r) {
>>>> +		r = -EINVAL;
>>>> +		goto cleanup;
>>>> +	}
>>>> +
>>>> +	memcpy(buf, edid + start, len);
>>>> +	r = 0;
>>>> +
>>>> +cleanup:
>>>> +	kfree(edid);
>>>> +
>>>> +	return r;
>>>> +}
>>>> +
>>>>   static void connector_bad_edid(struct drm_connector *connector,
>>>>   			       const struct edid *edid, int num_blocks)
>>>>   {
>>>> @@ -2643,6 +2687,39 @@ struct edid *drm_get_edid(struct drm_connector *connector,
>>>>   }
>>>>   EXPORT_SYMBOL(drm_get_edid);
>>>>   
>>>> +/**
>>>> + * drm_get_acpi_edid - get EDID data, if available
>>>
>>> I'd prefer all the new EDID API to be named drm_edid_*. Makes a clean
>>> break from the old API, and is more consistent.
>>>
>>> So perhaps drm_edid_read_acpi() to be in line with all the other struct
>>> drm_edid based EDID reading functions.
>>>

Roger that.  Even if it ends up not being exported out will rename as such.

>>>> + * @connector: connector we're probing
>>>> + *
>>>> + * Use the BIOS to attempt to grab EDID data if possible.
>>>> + *
>>>> + * The returned pointer must be freed using drm_edid_free().
>>>> + *
>>>> + * Return: Pointer to valid EDID or NULL if we couldn't find any.
>>>> + */
>>>> +const struct drm_edid *drm_get_acpi_edid(struct drm_connector *connector)
>>>> +{
>>>> +	const struct drm_edid *drm_edid;
>>>> +
>>>> +	switch (connector->connector_type) {
>>>> +	case DRM_MODE_CONNECTOR_LVDS:
>>>> +	case DRM_MODE_CONNECTOR_eDP:
>>>> +		break;
>>>> +	default:
>>>> +		return NULL;
>>>> +	}
>>>> +
>>>> +	if (connector->force == DRM_FORCE_OFF)
>>>> +		return NULL;
>>>> +
>>>> +	drm_edid = drm_edid_read_custom(connector, drm_do_probe_acpi_edid, connector->dev);
>>>> +
>>>> +	/* Note: Do *not* call connector updates here. */
>>>> +
>>>> +	return drm_edid;
>>>> +}
>>>> +EXPORT_SYMBOL(drm_get_acpi_edid);
>>
>> Why shouldn't we use the BIOS/UEFI to retrieve them if it's available?
>>
>> I guess what I'm asking is why should we make this an exported function
>> that drivers would have to call explicitly, instead of just making it
>> part of the usual EDID retrieval interface.
> 
> Two main questions:
> 
> What if the EDID from ACPI is bogus? Needs to be configurable in the
> connector somehow?

In the earlier versions of the patch that touched amdgpu I left a knob 
in the amdgpu kernel module to let users turn this off.  Whenever a 
variation of this hits amdgpu I'm planning to keep that there unless 
Alex or Christian have opinions against it.

> 
> What if you have multiple local panels? This seems to only support one,
> and would return the same EDID for both.
> 

The GPU driver should know best how many panels it's dealing with.

How about if we make it "opt-out" by the connector?  The connector can 
set a flag before it tries to get the EDID that it doesn't want one from 
the BIOS for any reason (module parameter, too many eDP etc).
