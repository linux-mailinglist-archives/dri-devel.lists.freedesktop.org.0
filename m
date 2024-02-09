Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E32B84F8A6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 16:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D45810EE08;
	Fri,  9 Feb 2024 15:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Tqs5l68J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2056.outbound.protection.outlook.com [40.107.100.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3B610ED09;
 Fri,  9 Feb 2024 15:34:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ca/u9lzF0+2W6oGCkXQrGcl9Hfgu23Zmui7gJKi1CvXl59T/VCgeWwnLOkDQRtQ8wxN8PN1k4r3OBInDYdIbj1BFYglX5JJ+Y37ylB68PLN1qCURmmRTRwN9/AXG+ERO3rrtQ3seJ7SSOugZQqFHO6c/n4E7Plkh8mQrfZMnYB2HGHIUowe90XXz+he5R0k1tVdOLZvX0rnN8DxCPSptsNgnYLxKPhcv78PvAXr2HDVjoezoEEAxxlaf+tOIv0hTbA2rSdI52DCnq/fNWl8efv4EYOBLkyDbJ5Z+bUhyxbIjb7E6uyKWDmfv/h/T+v2z6dRKCRMoNdSml/B0tpehug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opgBYu5M2WMnV8XRAg0CHZt91hTOiNC7LdB2UFzcI1A=;
 b=Ch7z865dQ1BbbS/oYmtJzSx4rFTa3Uu+TW/RFGg3xuYESaPP45YEZp3l0/ebBKS7Fm/39WeaSfuVZN27PERlvkeqdrECKDUI/fFdQpPg/2Dfow44CQME/wVJY8ZX/FhN4kbQ9zZx62P9+yoR0IKGg2bSHOLFr4LaiMks0wGxec2zzIDJmBc+pPT123dqum6ubphSkFqic+qHb5sWrE4vobnDDghDhBhWZOi5puUgaftJpyX59RCM8fZMSRYzlO5X9B/Oy7qTO/K1m8Mcw21qpQ33M2Xa2+ZNQ24GORwaQmYC7zzF7bw74LjWtKIAQq0i7+tIsHBWzcqOCzfR0pzQww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opgBYu5M2WMnV8XRAg0CHZt91hTOiNC7LdB2UFzcI1A=;
 b=Tqs5l68JtM1lq6ts3z7IdFI3VzyYJ5RviKtN98tdEd8eN0ka8O6do8L69iGyy6c4VCRfFz+K2/45Ub+q/Sr9JNfWqmL1Z5ux9DDjjTu6jaLdASrR8OtUSUL6/eaTb7v4hbC2FRr7DeVh5AZty6v3yyQBPnusTqI1NCgERr54C+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN0PR12MB5715.namprd12.prod.outlook.com (2603:10b6:208:372::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.14; Fri, 9 Feb
 2024 15:34:17 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f6d2:541d:5eda:d826]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f6d2:541d:5eda:d826%5]) with mapi id 15.20.7270.016; Fri, 9 Feb 2024
 15:34:17 +0000
Message-ID: <9fa0c1ad-dd7d-4350-aad1-4723450850bd@amd.com>
Date: Fri, 9 Feb 2024 09:34:13 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm: Add drm_get_acpi_edid() helper
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Melissa Wen <mwen@igalia.com>,
 Dave Airlie <airlied@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20240207224429.104625-1-mario.limonciello@amd.com>
 <20240207224429.104625-2-mario.limonciello@amd.com>
 <87y1bvb7ns.fsf@intel.com> <ZcYHaXNJ8IqbLIra@phenom.ffwll.local>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <ZcYHaXNJ8IqbLIra@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM5PR08CA0039.namprd08.prod.outlook.com
 (2603:10b6:4:60::28) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN0PR12MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e006685-93f9-4c5d-6f4a-08dc2984939b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WgggYGxOCtoZqfd+5vCCG/vLQtfZod3/A+KTxY6JVDvsFeUtohxaXNh07yg7gx1LgBku3Y0ToABoWS5F3BhGgg6RhT5SLjdzy7nBrUgyX6lcL5YqaC6sG/zTX6jxsXIPzwXriGlsmmV1Qsh1+YKGH++Z0CUWvGqOw0dZnclj+KtltqoHyMvmlD3OW7ylarEhVDVw/rKW136asHFISA8sCfQuvLmG2We+WwxzZfp2JK94QFUMmZxM8DD2kNwxZfFZeZOPRvVI5plP7egzNxtMCjTh7WEOVP7isyTj46l4zvWY44NHEB/HZrmFr8WrGq/zMwzk4utHQuSBC+tO9CY+WrUrG/ujQXykdu6e7wAE+GjYFuELaVVwWxyMsz+zRpp2jFWSLhH9NdMe5hn7VuV5CZedtlrqE3ww6llRWYaCH3g9Q4vU2C/97mSIRzPoPiIaZxSZsAn/y+mu1jYGUGq10N4JjFV6XyyXCRBWjBbS5JyMqY0D7o5KPWgHJjsPi8tpc0i2iYvhfGknDvNya7exbxNgXPiA3UeQG1uoF4QghwYKYn5bJ97mAZGRU3D+4O5s27rIHLU72Ekm8d7hpHuNXwnUl+s6BqhYSMqFSJ0KPgA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66899024)(31686004)(110136005)(6486002)(921011)(31696002)(86362001)(41300700001)(36756003)(26005)(66476007)(83380400001)(6512007)(38100700002)(8936002)(478600001)(8676002)(53546011)(2906002)(6506007)(6666004)(66946007)(5660300002)(66556008)(2616005)(7416002)(316002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW44WU1YSDBsanRRZjNlWGtPU2RVbzRTOXA0MWg0bWxRM1FxTWRuUUZTZ1Z1?=
 =?utf-8?B?QkFtMFFSdVVoSFpJcXRIRHlaRlpMZzIxbWlaU3dTL0tTdk9jUFdMd1E0QlFj?=
 =?utf-8?B?SmFmSlBBZTV2KzdpcmVPV29XZ3VnWGRWWjJGdWdXRnBjb0tYTDBzdkpvZlN2?=
 =?utf-8?B?RVVlMTQ3TzVVZFU2L3c2WTVKTFRwTWVFZ2tkQ0tXSHZ1Ry9WMW81Y2hEZkly?=
 =?utf-8?B?T2R4dDlpbDgvcHhmaTJsVXVLRlQ5S0VTWGd1VG42TEJHL1BJR21UUk9QUFlJ?=
 =?utf-8?B?QTFNSEdRclZ3NjFvY1RUbkJObUo0aFBzQXJZSjJ3WjZBYnFPdTNVc1REWjFj?=
 =?utf-8?B?M29aZTBBZXR4VDNMd2lQVEJRdG90Vnk4aDVvem9VQUlXQzF2REhzU3JHaFZ5?=
 =?utf-8?B?MXp6WUI1K3Y3Zk9xRWRxVzdyNGtIMXZuVHViN0M5TGs1NDZuZlZDVVdtNkVV?=
 =?utf-8?B?eEVxOXRMU1VLL05MNjhabFZBQlFmRitKRzIvaDBZaWFmaFMzNFBmL1kwdXJl?=
 =?utf-8?B?eC9jcmk3ZGprVW9LcUtOREhRVnNNN1MxSEZPTFIyd3A1NzloNHRSaGRXYXds?=
 =?utf-8?B?bTl4alcwRDV5M3hUU09Yc1BWT1V5eEpnbXJjWHhSK2dGdWhWL0ZkK0NwTWNr?=
 =?utf-8?B?d0FsTVFlUlBYY3F5V016YlZtWHQwQmUxRzFIcjg3a3QwY1NoTG5PNGxHL2Qw?=
 =?utf-8?B?VWZZbFRtYVp0NWZVT0lWMkhtU0Q1TE10aVhBQlRjNnVUUzdmeW5hanRSSm5x?=
 =?utf-8?B?RWFzZWNoWlkycVUrTlNaRG1WNkpVQzN3MVAvbDdpNklXOTFLVzhyQjZ0UU9w?=
 =?utf-8?B?cnQ0Sm92ZDNzNm9XQnZoOVA2b1cxd2hMcC9rdVlaMGRjOS85c0FWZjdQcW9p?=
 =?utf-8?B?VnNjYUdmWDZKak1MVzBhY2UvbVFKL25SK056cFR4bU85M29JNUtMM0w3Nlc4?=
 =?utf-8?B?SzBWRXI4eklYYmwvT3VIdllhaWxRdlNvWS84b1ZrcWp2RDZ2MXBCMkNNWE9U?=
 =?utf-8?B?L3dtMVV4YzRxc25CN3cyeW1KNnc1R08vWjloUkdHTkR6TkVCY0pYdjFqUXhV?=
 =?utf-8?B?Y3hHQnNPMS9wRldsaFMvUXY4bFkxQm00UmN0elpWd1ZDUFhlbDBzMDVXc3ZJ?=
 =?utf-8?B?L2loWkdwalJhOEJNNy9YT0p2VWtDbTdjYzc3S2pUUkhyWGwzcExHTTlubHNB?=
 =?utf-8?B?K1VjUk05YjZPakIrWjNab1NTYU05NFkvM1RXZlBmL0hWaWJDOE0vUGU1bGlM?=
 =?utf-8?B?OTUzRjI5ZVFYNnloZmk3K1RJVlFGaktXNmwvWm1ocmlmNWd1MjFocTFORnF3?=
 =?utf-8?B?NGF3S1hjeGRhU0dnaDEvQXNCcEhwWjBtUWtNeW5LRVdoK1pEWGI5STFwQVk0?=
 =?utf-8?B?cTBkNFduSjRQakU5VnJtMGpJeUx2MEhzMWtyZ203cmtZOExaZ0xobHNXZjJm?=
 =?utf-8?B?bmFpUFhEdU8vU2d2bkp5c0NEUmc5ZWJkbzZlS0FOSlR4d0ZHZ29HV20vQ2Yr?=
 =?utf-8?B?ZjFYYkowYWVEMGgvUURyclp0dTFpVWU0OHNFMUFYblU0aG13QnZzUmF2TFF3?=
 =?utf-8?B?a2RNYjVSL0U1QWFHVm5WS2tnc2hDbTJvMTZlSkN0d0NSZEpyb2FXZ0sxNG1O?=
 =?utf-8?B?MStXRzJBQThGRVpCeGFVdXJJcDMraXpVNmwrRW5PMktuRk93azFkYnV6WGda?=
 =?utf-8?B?SVZFYXp2TVNJL0VrK09QL1RJckN2dWY2UTRhUG5YWnYwTjVhVDROU0FFMDRv?=
 =?utf-8?B?Z2tqdnZlbUllSk5LZ0NYYzAyeEswbFRXWG9sWVU4Yzc5cnJNeXlBWmtUbWVz?=
 =?utf-8?B?WGFVQ2EyQUxXMnRWSDM1NENNUGFrZ2xLbno1MHNQZkM5dTNyK0s0VE5tamVs?=
 =?utf-8?B?MWEvdTY3NFVHTGk5VzhqUU5NZnNicnljT05IVFpJTFJFRFZ0eUJsNmhHZ1dU?=
 =?utf-8?B?dDd1VUJXQVhkQmpJbkZsQjVoZXNCWFNYSGFpaGszZ1pRb2RKbytCRDQxWk5O?=
 =?utf-8?B?d2RPZVk1MlVPYXQyNFU0aDFYdXhGWGdUb0p5ZEFwa3Fad2VoNEJRZWZsL3FD?=
 =?utf-8?B?QjJ6UXlwTjZzQ25HSlltQ2xXOHgyWjZMZlZ5RXBSd2hKK1Y3ZlIyWmZWckV0?=
 =?utf-8?Q?HOaCiQdxXSlFcZRUDBf5rF88a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e006685-93f9-4c5d-6f4a-08dc2984939b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 15:34:16.9879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYjkMDVf97qPVqBrbWvOLK2oyBlsacdAAT6plt/TSLpN9bcEhcx73eo60Ts9JJ2DIDp7NjP0EVCV5w3RHVg4cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5715
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

On 2/9/2024 05:07, Daniel Vetter wrote:
> On Thu, Feb 08, 2024 at 11:57:11AM +0200, Jani Nikula wrote:
>> On Wed, 07 Feb 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
>>> Some manufacturers have intentionally put an EDID that differs from
>>> the EDID on the internal panel on laptops.  Drivers can call this
>>> helper to attempt to fetch the EDID from the BIOS's ACPI _DDC method.
>>>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> ---
>>>   drivers/gpu/drm/Kconfig    |  5 +++
>>>   drivers/gpu/drm/drm_edid.c | 77 ++++++++++++++++++++++++++++++++++++++
>>>   include/drm/drm_edid.h     |  1 +
>>>   3 files changed, 83 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>> index 6ec33d36f3a4..ec2bb71e8b36 100644
>>> --- a/drivers/gpu/drm/Kconfig
>>> +++ b/drivers/gpu/drm/Kconfig
>>> @@ -21,6 +21,11 @@ menuconfig DRM
>>>   	select KCMP
>>>   	select VIDEO_CMDLINE
>>>   	select VIDEO_NOMODESET
>>> +	select ACPI_VIDEO if ACPI
>>> +	select BACKLIGHT_CLASS_DEVICE if ACPI
>>> +	select INPUT if ACPI
>>> +	select X86_PLATFORM_DEVICES if ACPI && X86
>>> +	select ACPI_WMI if ACPI && X86
>>
>> I think I'll defer to drm maintainers on whether this is okay or
>> something to be avoided.
> 
> Uh yeah this is a bit much, and select just messes with everything. Just
> #ifdef this in the code with a dummy alternative, if users configure their
> kernel without acpi but need it, they get to keep all the pieces.
> 
> Alternatively make a DRM_ACPI_HELPERS symbol, but imo a Kconfig for every
> function is also not great. And just using #ifdef in the code also works
> for CONFIG_OF, which is exactly the same thing for platforms using dt to
> describe hw.
> 
> Also I'd expect ACPI code to already provide dummy functions if ACPI is
> provided, so you probably dont even need all that much #ifdef in the code.
> 
> What we defo cant do is select platform/hw stuff just because you enable
> CONFIG_DRM.
> -Sima

The problem was with linking.  I'll experiment with #ifdef for the next 
version.

> 
>>
>>
>>>   	help
>>>   	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
>>>   	  introduced in XFree86 4.0. If you say Y here, you need to select
>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>>> index 923c4423151c..c649b4f9fd8e 100644
>>> --- a/drivers/gpu/drm/drm_edid.c
>>> +++ b/drivers/gpu/drm/drm_edid.c
>>> @@ -28,6 +28,7 @@
>>>    * DEALINGS IN THE SOFTWARE.
>>>    */
>>>   
>>> +#include <acpi/video.h>
>>>   #include <linux/bitfield.h>
>>>   #include <linux/cec.h>
>>>   #include <linux/hdmi.h>
>>> @@ -2188,6 +2189,49 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
>>>   	return ret == xfers ? 0 : -1;
>>>   }
>>>   
>>> +/**
>>> + * drm_do_probe_acpi_edid() - get EDID information via ACPI _DDC
>>> + * @data: struct drm_device
>>> + * @buf: EDID data buffer to be filled
>>> + * @block: 128 byte EDID block to start fetching from
>>> + * @len: EDID data buffer length to fetch
>>> + *
>>> + * Try to fetch EDID information by calling acpi_video_get_edid() function.
>>> + *
>>> + * Return: 0 on success or error code on failure.
>>> + */
>>> +static int
>>> +drm_do_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
>>> +{
>>> +	struct drm_device *ddev = data;
>>> +	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
>>> +	unsigned char start = block * EDID_LENGTH;
>>> +	void *edid;
>>> +	int r;
>>> +
>>> +	if (!acpidev)
>>> +		return -ENODEV;
>>> +
>>> +	/* fetch the entire edid from BIOS */
>>> +	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
>>> +	if (r < 0) {
>>> +		DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
>>> +		return -EINVAL;
>>> +	}
>>> +	if (len > r || start > r || start + len > r) {
>>> +		r = -EINVAL;
>>> +		goto cleanup;
>>> +	}
>>> +
>>> +	memcpy(buf, edid + start, len);
>>> +	r = 0;
>>> +
>>> +cleanup:
>>> +	kfree(edid);
>>> +
>>> +	return r;
>>> +}
>>> +
>>>   static void connector_bad_edid(struct drm_connector *connector,
>>>   			       const struct edid *edid, int num_blocks)
>>>   {
>>> @@ -2643,6 +2687,39 @@ struct edid *drm_get_edid(struct drm_connector *connector,
>>>   }
>>>   EXPORT_SYMBOL(drm_get_edid);
>>>   
>>> +/**
>>> + * drm_get_acpi_edid - get EDID data, if available
>>
>> I'd prefer all the new EDID API to be named drm_edid_*. Makes a clean
>> break from the old API, and is more consistent.
>>
>> So perhaps drm_edid_read_acpi() to be in line with all the other struct
>> drm_edid based EDID reading functions.
>>
>>> + * @connector: connector we're probing
>>> + *
>>> + * Use the BIOS to attempt to grab EDID data if possible.
>>> + *
>>> + * The returned pointer must be freed using drm_edid_free().
>>> + *
>>> + * Return: Pointer to valid EDID or NULL if we couldn't find any.
>>> + */
>>> +const struct drm_edid *drm_get_acpi_edid(struct drm_connector *connector)
>>> +{
>>> +	const struct drm_edid *drm_edid;
>>> +
>>> +	switch (connector->connector_type) {
>>> +	case DRM_MODE_CONNECTOR_LVDS:
>>> +	case DRM_MODE_CONNECTOR_eDP:
>>> +		break;
>>> +	default:
>>> +		return NULL;
>>> +	}
>>> +
>>> +	if (connector->force == DRM_FORCE_OFF)
>>> +		return NULL;
>>> +
>>> +	drm_edid = drm_edid_read_custom(connector, drm_do_probe_acpi_edid, connector->dev);
>>> +
>>> +	/* Note: Do *not* call connector updates here. */
>>> +
>>> +	return drm_edid;
>>> +}
>>> +EXPORT_SYMBOL(drm_get_acpi_edid);
>>> +
>>>   /**
>>>    * drm_edid_read_custom - Read EDID data using given EDID block read function
>>>    * @connector: Connector to use
>>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>>> index 7923bc00dc7a..ca41be289fc6 100644
>>> --- a/include/drm/drm_edid.h
>>> +++ b/include/drm/drm_edid.h
>>> @@ -410,6 +410,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>>>   	void *data);
>>>   struct edid *drm_get_edid(struct drm_connector *connector,
>>>   			  struct i2c_adapter *adapter);
>>> +const struct drm_edid *drm_get_acpi_edid(struct drm_connector *connector);
>>
>> There's a comment
>>
>> /* Interface based on struct drm_edid */
>>
>> towards the end of the file, gathering all the new API under it.
>>
>> Other than that, LGTM,
>>
>> BR,
>> Jani.
>>
>>>   u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
>>>   struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
>>>   				     struct i2c_adapter *adapter);
>>
>> -- 
>> Jani Nikula, Intel
> 

