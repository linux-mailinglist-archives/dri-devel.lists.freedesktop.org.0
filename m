Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFEB856D4B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 20:04:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618B410EA0C;
	Thu, 15 Feb 2024 19:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C/XOwYdD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DDB10E22C;
 Thu, 15 Feb 2024 19:04:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvEmAriE+2PspVxemw2j3n7cvu+SjavtvEY5RuEY8wWo4fdT33C2grWCHbNwxOzDprH7LHQK3bu3PjcxCC7OkILwLgLIoyLh8uNGiWboLIyrZbuxzpvXX0qiWJjaiFzQZzgpVtY0WqCcz8C38zKoEu0tu657/s/rWfoS4hRKXy5kG5Yg80wtDDmZ+66nGaQB8sQmWjTl+6VFxRLi/X0oPaMJvgiv1szBJ045X34r52oUBYIosPE9SZEtntZnPqG0k/F4gMLrL43E1bTRv+HoNOcGh7RjgX9MYsAtf1768iYISbMZ4iYiyxAG8B8u/DZ/0GLrJ/FE7anYIcuOYzfO7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4XuuYsOSCdQXrJWV6tyJoAmDAM30z8Yj39x/o5TTzk=;
 b=XL6Gqgh0GXV5cJMVo1lX1NGzGQvTX9AoIjLw9yp3K3qxxsNa9+GAUQYxcPZdZMpLPG45CZggLXOTInpJ5dMT3kM7lyZofieBqaAJz/yx+AeaGCMXKdkhtJkFljl2onmBUOkmjxM1ZJY/ItYdwO0DrenwWy/+kpEL0igzmVRlllXnRyV1JmzfzresyCGPeEnfrX+YJ4p65LBIGZ9R9nwnygNJEHJt6d54GGJPph21mQl8F54HfCzNqpLwrktrDwWcx8iESBXpClB2FRq8+Jr0yHAZkghycJgIs1iRrU0+COgKpJNJZEtt03vzCy02+rU0Ulghxpe2Y61K7687rKJCqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4XuuYsOSCdQXrJWV6tyJoAmDAM30z8Yj39x/o5TTzk=;
 b=C/XOwYdDB/8t71XedKLuu525VQlB7jcLX18maiPqrorwh+i7U016+/sOABNeQk6DUGXwc47L22O/d3/XQrcgrtGEO56krGcXqHT/nrmJcgB/cDfiI9/nLjP1vCbPJR8YvgwckUsxqiHm4ev7YXExKWSzAsGhI1Mbc1o3MUwUuqs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB8044.namprd12.prod.outlook.com (2603:10b6:8:148::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Thu, 15 Feb
 2024 19:04:02 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a%7]) with mapi id 15.20.7316.012; Thu, 15 Feb 2024
 19:04:02 +0000
Message-ID: <ecbaadf9-dfa1-46af-9a7e-cfd7aa1120be@amd.com>
Date: Thu, 15 Feb 2024 13:03:59 -0600
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
 <Zc1JEg5mC0ww_BeU@intel.com> <9831e9bc-d55f-4a72-950a-684a757af59c@amd.com>
 <Zc5cPjpNZydqKeS8@intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <Zc5cPjpNZydqKeS8@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P222CA0003.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB8044:EE_
X-MS-Office365-Filtering-Correlation-Id: 69d27505-6321-4eec-fc3c-08dc2e58df59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hh4mw9s01LFG2eftEVYv0j304xtQbDPyNwPndsN6ld/y44flztWeNCgVxg6h8A62kCXEaIVD6NwGXXr9SJpsO+UCDZyrKikqMaE1W9ah19XTIv/ZAKtNgyCGDft37WxrCqUJ8MwKOJWKpCYH1H6kEEe1M1agKEFJuWdWMQunQa0O1f0YN9AwM1SdL1td8P2+vFGdXIgmxNZnBDds5CCPkU/akBGfdUD34U+mhu46sxEaPgsPwjwV7OzO4u6oCsBWrEA1uy4pg2WOdfTo8Eo6zOw4s+wpT7mNuiHkg2nH6F23w5WZ/a/JxMc8QP0Ve9c+OJbIHEgfUQVIX+Tb2j1lLSzBY5haQqx0YTtNF3gtV1/hES+qAnh3/mzuj0U5VyLb6HuL9MofPU3lnrBYlm9Zj4hLLKeBlfUXUpgUQPsYQU7TzOjzkoT9dhXoR+aP7RhPztl2AZt6ruouKi0ziBBfkPuG2vdU0bW5ngad+0VhucG1P38vhlPM7DgPv8tbyyw7ZfAomccLjZk/rgrUAFx6B7sTSTBikv4brqvaQZb6SII=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(6506007)(6512007)(6486002)(966005)(478600001)(53546011)(31686004)(2906002)(7416002)(30864003)(44832011)(5660300002)(66899024)(316002)(41300700001)(54906003)(6916009)(66476007)(8936002)(66946007)(8676002)(66556008)(6666004)(4326008)(26005)(2616005)(83380400001)(66574015)(31696002)(36756003)(38100700002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2hrdkdZYVZ3NFM4bFFDY1NLbWNzeTQyY2crZjJTQ0UxNmtndVJlZW9FUEQz?=
 =?utf-8?B?SlQ4V3ZzVG81VlVZVHJVbm5HbFVRQm5XWDdKNnFZK1hteUtkdENKZ2c3Qk9C?=
 =?utf-8?B?WGJvZkNlZWFnM2VJeDV6V1lET2Q5b0NSYTNNdW9mMEZQeitFcVNkQXFMNGt3?=
 =?utf-8?B?UnZvaUVCcERKTUdGZ1FvWVBZTHoxcmlLamw4eUxjUCtKdW1SUDBJZVR0WjlI?=
 =?utf-8?B?SnYwN0JnL1ptR2Zyd0diaWR1elB0cE91ZGhmRUJ3c05TN3hSL0hjNU11Tzl3?=
 =?utf-8?B?L2RJY2N0UVdwN2NZR3JtMlBjTWZlMmRQYnVVUW44NFp6Z0ZGOTVrR3krUWZs?=
 =?utf-8?B?WVh2eEg4clZjb3lzM1VqL0FZNHc0R2xDRHM2ME83L1VxUzlqQnVrMU9sZ1lo?=
 =?utf-8?B?V0VhcXltL2NXWHlNempGQU12SFFuaFBWWkdyMFUyOEg5Zmc5M3Yrc3VXbWtN?=
 =?utf-8?B?UCtGcW9RZVdvNkVqZXZaTjYxdDhqQ1hTZHRLL2VabEEzbUdUdUVaTGFMcmZ6?=
 =?utf-8?B?YlpscGlBemVuYzlyTkNDdEV5ZTdvMUg1MVlhMi9zdkxvV3d3WmJMdURSZVkv?=
 =?utf-8?B?OXZmb2Q2ZWJId1VtTVoxOUhlZGw5WTVIdDFLZGVXRDQzRXJNdVJFT0VoNGNJ?=
 =?utf-8?B?VVpJbE5tRU00N0hBZTdQUUo0cGtoRjZqL2VGV3ZLa1hOVmIvSzJ5bStkaUJz?=
 =?utf-8?B?Mm0ya0pZY1FMYXNLbEhZbTVuZHA0WlY0RGFXVmRmVVZJSmEvK2kzWTN0WFFl?=
 =?utf-8?B?MGY1alRqa0ZxV2tDMjZ1eWxFQW1BZzRtbWgvYm00RUxiaHZhK3pwY0tVeENQ?=
 =?utf-8?B?eER3QjlaV0l2MHpsaUFCblkwODBkVmd1Qm5kMDg4N1ZhQm1nSkFzd09xRGZR?=
 =?utf-8?B?TDV5MWJ0TEJZWFcwanBoRlBUYXJpS1g1dTVuRmZ2elhQcFNZeXEwOXFSOCs1?=
 =?utf-8?B?ZTVDY25JY3k3b1Y2M092V3NsSEdOcmpaRmdMY3RLbm5OenlWMHorV0EweTY1?=
 =?utf-8?B?NWx4d0pCVVozRWFjS2l4aTFFdVpwaVJKNmNxNlk4Nisrem9nMXgyVno3SWNr?=
 =?utf-8?B?L0xxYkRDNE5aa2I5enJHN2tSWmtRTld5QjVRcUEwSFEvSVI2QW0xWE9RcjVR?=
 =?utf-8?B?WVcrUEg2UGNrVlhzY0RvWVNnQ2FhZXdxM0phN3RtNEdLMUlJcDhMRG5ZY2Zp?=
 =?utf-8?B?VDVNdTZWMTBBc3ZYcWFDK3JGVWo3OCs3bXhMR1Y0dkY4aW9LTU4xa2p0S0t5?=
 =?utf-8?B?b0RMYkZIRHo0Nkx3Q0ZZRDgxMk5USC91OGdNSGJoQVUzY1AvMUFTVmxzUEw5?=
 =?utf-8?B?aEZJSzBjdG1FcUpyTU9vQ2MvWmZPbTYvT0M2YXh6eGFUMkNEN1dYK21OQjhR?=
 =?utf-8?B?aEx1R1NhWTN1MmsxWStOR1gyWUxTYWRMVWF2ajBqODVCcThzYVI1ZTBHanNq?=
 =?utf-8?B?THBwQUVTM2JxVU1rUXJvd3NmSG5Cckd1MkVmVDVUaTFoT0tjMXFOdm90MnVM?=
 =?utf-8?B?OWdNVjRtY1pTcTRzSEtsYm52RlBNWjJNbitrTS9xeC9tRlVDL3ZuTmJpWXIz?=
 =?utf-8?B?RnZpL3VLMjlPUG5sd0RTV0dUUGQ3SENwZHIyUThOWVFrYkxxL3hqdU5IZlAy?=
 =?utf-8?B?KzFrWUQ1K3Y0ZThtTHpEaXh6K3VqT2lQWGpidEh1ei9Rdmp2bllHbU5MeHBa?=
 =?utf-8?B?WCtSQUU1VTZKbkloUGszZmRPcjIyS3lidllyU2RDa0llSFdTM1dCQVdYQ0hu?=
 =?utf-8?B?aStvREJYZUliS2tHUTJORzNVQjM0czAvVERFSTdCRTQ2aTlicFJuWGh3SWtn?=
 =?utf-8?B?VFBQZENRVkExNmRYdU5TTkJYbUJVaTJMeGVLK0kxOEROdklqRDljNGVHNHlK?=
 =?utf-8?B?alVvNkprdEppdjA0ellTQWNGMHExNGp6VUhCa05LaWVmS2ovU3lSeDJveElU?=
 =?utf-8?B?eFoyMlM3ZVNOWTVSVUdHaWdjNm5ET0tqTHJmMFBCWGM4M2hHNmFxTXEySlZk?=
 =?utf-8?B?Wm5tYWZvK3R4UVhyK3VHUVFLWlZONUgzMkxBQkNPWGtnSm14NDRVcDVaKzk0?=
 =?utf-8?B?VGg5ZzM4clNFY0pJcjczVjN0UFdJZStrUVBOVlo1TGVuVDl6enB2SExZNGkx?=
 =?utf-8?Q?zqzeWTIdgmmdCOIj9eaYg+inQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d27505-6321-4eec-fc3c-08dc2e58df59
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 19:04:02.0329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RC59FrQORRspkEp/6HiZABArSug8zHdoEs1h/jSzEdEFQyaQigT7n4MNIlCaR2Tdq4+uWZcbMtX8GRfx09hznw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8044
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

On 2/15/2024 12:47, Ville Syrjälä wrote:
> On Thu, Feb 15, 2024 at 12:20:56PM -0600, Mario Limonciello wrote:
>> On 2/14/2024 17:13, Ville Syrjälä wrote:
>>> On Wed, Feb 14, 2024 at 03:57:54PM -0600, Mario Limonciello wrote:
>>>> Some manufacturers have intentionally put an EDID that differs from
>>>> the EDID on the internal panel on laptops.  Drivers that prefer to
>>>> fetch this EDID can set a bit on the drm_connector to indicate that
>>>> the DRM EDID helpers should try to fetch it and it is preferred if
>>>> it's present.
>>>>
>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/Kconfig     |   1 +
>>>>    drivers/gpu/drm/drm_edid.c  | 109 +++++++++++++++++++++++++++++++++---
>>>>    include/drm/drm_connector.h |   6 ++
>>>>    include/drm/drm_edid.h      |   1 +
>>>>    4 files changed, 109 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>>> index 872edb47bb53..3db89e6af01d 100644
>>>> --- a/drivers/gpu/drm/Kconfig
>>>> +++ b/drivers/gpu/drm/Kconfig
>>>> @@ -8,6 +8,7 @@
>>>>    menuconfig DRM
>>>>    	tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)"
>>>>    	depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && HAS_DMA
>>>> +	depends on (ACPI_VIDEO || ACPI_VIDEO=n)
>>>>    	select DRM_PANEL_ORIENTATION_QUIRKS
>>>>    	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
>>>>    	select FB_CORE if DRM_FBDEV_EMULATION
>>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>>>> index 923c4423151c..cdc30c6d05d5 100644
>>>> --- a/drivers/gpu/drm/drm_edid.c
>>>> +++ b/drivers/gpu/drm/drm_edid.c
>>>> @@ -28,6 +28,7 @@
>>>>     * DEALINGS IN THE SOFTWARE.
>>>>     */
>>>>    
>>>> +#include <acpi/video.h>
>>>>    #include <linux/bitfield.h>
>>>>    #include <linux/cec.h>
>>>>    #include <linux/hdmi.h>
>>>> @@ -2188,6 +2189,58 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
>>>>    	return ret == xfers ? 0 : -1;
>>>>    }
>>>>    
>>>> +/**
>>>> + * drm_do_probe_acpi_edid() - get EDID information via ACPI _DDC
>>>> + * @data: struct drm_connector
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
>>>> +	struct drm_connector *connector = data;
>>>> +	struct drm_device *ddev = connector->dev;
>>>> +	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
>>>> +	unsigned char start = block * EDID_LENGTH;
>>>> +	void *edid;
>>>> +	int r;
>>>> +
>>>> +	if (!acpidev)
>>>> +		return -ENODEV;
>>>> +
>>>> +	switch (connector->connector_type) {
>>>> +	case DRM_MODE_CONNECTOR_LVDS:
>>>> +	case DRM_MODE_CONNECTOR_eDP:
>>>> +		break;
>>>> +	default:
>>>> +		return -EINVAL;
>>>> +	}
>>>
>>> We could have other types of connectors that want this too.
>>> I don't see any real benefit in having this check tbh. Drivers
>>> should simply notset the flag on connectors where it won't work,
>>> and only the driver can really know that.
>>
>> Ack.
>>
>>>
>>>> +	/* fetch the entire edid from BIOS */
>>>> +	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
>>>> +	if (r < 0) {
>>>> +		DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
>>>> +		return r;
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
>>>>    static void connector_bad_edid(struct drm_connector *connector,
>>>>    			       const struct edid *edid, int num_blocks)
>>>>    {
>>>> @@ -2621,7 +2674,8 @@ EXPORT_SYMBOL(drm_probe_ddc);
>>>>     * @connector: connector we're probing
>>>>     * @adapter: I2C adapter to use for DDC
>>>>     *
>>>> - * Poke the given I2C channel to grab EDID data if possible.  If found,
>>>> + * If the connector allows it, try to fetch EDID data using ACPI. If not found
>>>> + * poke the given I2C channel to grab EDID data if possible.  If found,
>>>>     * attach it to the connector.
>>>>     *
>>>>     * Return: Pointer to valid EDID or NULL if we couldn't find any.
>>>> @@ -2629,20 +2683,50 @@ EXPORT_SYMBOL(drm_probe_ddc);
>>>>    struct edid *drm_get_edid(struct drm_connector *connector,
>>>>    			  struct i2c_adapter *adapter)
>>>>    {
>>>> -	struct edid *edid;
>>>> +	struct edid *edid = NULL;
>>>>    
>>>>    	if (connector->force == DRM_FORCE_OFF)
>>>>    		return NULL;
>>>>    
>>>> -	if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
>>>> -		return NULL;
>>>> +	if (connector->acpi_edid_allowed)
>>>> +		edid = _drm_do_get_edid(connector, drm_do_probe_acpi_edid, connector, NULL);
>>>> +
>>>> +	if (!edid) {
>>>> +		if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
>>>> +			return NULL;
>>>> +		edid = _drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter, NULL);
>>>> +	}
>>>>    
>>>> -	edid = _drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter, NULL);
>>>>    	drm_connector_update_edid_property(connector, edid);
>>>>    	return edid;
>>>>    }
>>>>    EXPORT_SYMBOL(drm_get_edid);
>>>>    
>>>> +/**
>>>> + * drm_edid_read_acpi - get EDID data, if available
>>>> + * @connector: connector we're probing
>>>> + *
>>>> + * Use the BIOS to attempt to grab EDID data if possible.
>>>> + *
>>>> + * The returned pointer must be freed using drm_edid_free().
>>>> + *
>>>> + * Return: Pointer to valid EDID or NULL if we couldn't find any.
>>>> + */
>>>> +const struct drm_edid *drm_edid_read_acpi(struct drm_connector *connector)
>>>> +{
>>>> +	const struct drm_edid *drm_edid;
>>>> +
>>>> +	if (connector->force == DRM_FORCE_OFF)
>>>> +		return NULL;
>>>> +
>>>> +	drm_edid = drm_edid_read_custom(connector, drm_do_probe_acpi_edid, connector);
>>>> +
>>>> +	/* Note: Do *not* call connector updates here. */
>>>> +
>>>> +	return drm_edid;
>>>> +}
>>>> +EXPORT_SYMBOL(drm_edid_read_acpi);
>>>> +
>>>>    /**
>>>>     * drm_edid_read_custom - Read EDID data using given EDID block read function
>>>>     * @connector: Connector to use
>>>> @@ -2727,10 +2811,11 @@ const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
>>>>    EXPORT_SYMBOL(drm_edid_read_ddc);
>>>>    
>>>>    /**
>>>> - * drm_edid_read - Read EDID data using connector's I2C adapter
>>>> + * drm_edid_read - Read EDID data using BIOS or connector's I2C adapter
>>>>     * @connector: Connector to use
>>>>     *
>>>> - * Read EDID using the connector's I2C adapter.
>>>> + * Read EDID from BIOS if allowed by connector or by using the connector's
>>>> + * I2C adapter.
>>>>     *
>>>>     * The EDID may be overridden using debugfs override_edid or firmware EDID
>>>>     * (drm_edid_load_firmware() and drm.edid_firmware parameter), in this priority
>>>> @@ -2742,10 +2827,18 @@ EXPORT_SYMBOL(drm_edid_read_ddc);
>>>>     */
>>>>    const struct drm_edid *drm_edid_read(struct drm_connector *connector)
>>>>    {
>>>> +	const struct drm_edid *drm_edid = NULL;
>>>> +
>>>>    	if (drm_WARN_ON(connector->dev, !connector->ddc))
>>>>    		return NULL;
>>>>    
>>>> -	return drm_edid_read_ddc(connector, connector->ddc);
>>>> +	if (connector->acpi_edid_allowed)
>>>
>>> That should probably be called 'prefer_acpi_edid' or something
>>> since it's the first choice when the flag is set.
>>
>> OK.
>>
>>>
>>> But I'm not so sure there's any real benefit in having this
>>> flag at all. You anyway have to modify the driver to use this,
>>> so why not just have the driver do the call directly instead of
>>> adding this extra detour via the flag?
>>
>> This was proposed by Maxime Ripard during v4.
>>
>> https://lore.kernel.org/dri-devel/ysm2e3vczov7z7vezmexe35fjnkhsakud3elsgggedhk2lknlz@cx7j44y354db/
> 
> Which somewhat ignores Jani's concerns about potentially
> bogus EDIDs coming from ACPI, as well as not allowing
> the driver to dictate the priority between ACPI vs. DDC
> vs. whatever else methods are available. Eg. i915 has
> at least one other place where it could get the EDID.
> So I don't think i915 could use this version.
> 
> But as long we still have the individual methods available
> as separate exported functions I suppose drivers can still
> choose to stitch their own thing together.
> 
> I just don't see much point in having that midlayer.
> I don't think drivers can just plug that thing straight
> into an existing vfunc or can they? If not, then they still
> have to implement the actual function where it gets called.
> And once you're doing that, calling two functions instead of
> one seems about the same amount of work as setting that flag.
> 
> But if people think it's actually useful for them
> I won't stand in the way.

The series as is works on an OEM laptop I have on my desk with
an amdgpu that has the EDID in the BIOS.

All that had to be done for amdgpu was to set the flag (which is what 
patch 4 does).

> 
>>
>>>
>>>> +		drm_edid = drm_edid_read_acpi(connector);
>>>> +
>>>> +	if (!drm_edid)
>>>> +		drm_edid = drm_edid_read_ddc(connector, connector->ddc);
>>>> +
>>>> +	return drm_edid;
>>>>    }
>>>>    EXPORT_SYMBOL(drm_edid_read);
>>>>    
>>>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>>>> index fe88d7fc6b8f..74ed47f37a69 100644
>>>> --- a/include/drm/drm_connector.h
>>>> +++ b/include/drm/drm_connector.h
>>>> @@ -1886,6 +1886,12 @@ struct drm_connector {
>>>>    
>>>>    	/** @hdr_sink_metadata: HDR Metadata Information read from sink */
>>>>    	struct hdr_sink_metadata hdr_sink_metadata;
>>>> +
>>>> +	/**
>>>> +	 * @acpi_edid_allowed: Get the EDID from the BIOS, if available.
>>>> +	 * This is only applicable to eDP and LVDS displays.
>>>> +	 */
>>>> +	bool acpi_edid_allowed;
>>>
>>> Aren't there other bools/small stuff in there for tighter packing?
>>
>> Does the compiler automatically do the packing if you put bools nearby
>> in a struct?  If so; TIL.
> 
> Yes. Well, depends on the types and their alignment requirements
> of course, and/or whether you specified __packed or not.
> 
> You can use 'pahole' to find the holes in structures.
> 

Thanks!  I don't see a __packed attribute on struct drm_connector, but 
I'll put it near by other bools in case that changes in the future.

>>
>>>
>>>>    };
>>>>    
>>>>    #define obj_to_connector(x) container_of(x, struct drm_connector, base)
>>>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>>>> index 7923bc00dc7a..1c1ee927de9c 100644
>>>> --- a/include/drm/drm_edid.h
>>>> +++ b/include/drm/drm_edid.h
>>>> @@ -459,5 +459,6 @@ bool drm_edid_is_digital(const struct drm_edid *drm_edid);
>>>>    
>>>>    const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>>>>    				  int ext_id, int *ext_index);
>>>> +const struct drm_edid *drm_edid_read_acpi(struct drm_connector *connector);
>>>>    
>>>>    #endif /* __DRM_EDID_H__ */
>>>> -- 
>>>> 2.34.1
>>>
> 

