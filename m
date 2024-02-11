Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99A38507D5
	for <lists+dri-devel@lfdr.de>; Sun, 11 Feb 2024 06:19:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0754B10E38E;
	Sun, 11 Feb 2024 05:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T4fwVPZy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A8710E371;
 Sun, 11 Feb 2024 05:19:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ew/zSBUVVBWyDO6IddOc4Pei4yt+JzdR7eAo84uoZOa9G0jWoNcWBD+9+WIWYPiYB44A4Ds/gIQIEkCPCm091XdohYBq4PaDVaJthJtgDwvLJIXonngyefK4RbmpOah7OVLZIOsLVUa4WYCZis4R/Q0CIZe6faHItP8A46SPUpe4l01ZeZ4pfs45T6+cH1p2AppNB/cS5pzxd6EvqA9VFh6mF+z80r+MiQB/FTJhXFBHvyEkSp2MLDFmOmL61Yin1tSeFL2bi4PHGkzvYF0+zI5+hNow7Q/2D4dkz19/fgFWcU0DTaFUTKzDdljL/514sux3MiMwzezNwEWb2IrjxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjNiW1ttAiV4dYGr200byUa0PWMnRTLubI+6pw2v/R0=;
 b=E4O8U/HMHuHPOUrZdTMVj6Ilil9tjOIxmDhfl3HfuCo5qUjjpbedL8pYBSRuzYiFZWMVbiqFFZ7v9kraogUemTJMiue2zkn6LGjWN7KGqe2eymMbWvgrWd08YkmuNW50PQXvts9fQwspHuhQpzSk7l8v3KWqCNj6+dDpHTcQ+uODHF/b+k7juwjvSA4Pm60yReZYGv+AsHvNaRYRXQm61bNSk8XJVgg+8tBiIVBt3LNZPbWMMXRiN3fku/UkTIbIGZhrSftkA4uduoU1CiAJNmnLwo8WAzzckdJmrzGrnWhlhtpjnpEf36uOy4c1vSHGc/L3Z6g4cBhHahKKmcJROw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjNiW1ttAiV4dYGr200byUa0PWMnRTLubI+6pw2v/R0=;
 b=T4fwVPZyRcWLJf2umFhZLeIGPLxVCKd5fiQS8qfmvFfCUt5TxwX/h/5ulgkAi2MxKUTfzFaEXI72m6HgrCGGy12OZWliBpcCKvBZhRFZSyjXj4uLF4XiLCPIE2o153yhYB5nR7yoVu6p+IxETMqnE7YRqhpLOLUeiqQrbdETFk0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB8943.namprd12.prod.outlook.com (2603:10b6:a03:547::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.11; Sun, 11 Feb
 2024 05:19:26 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a%7]) with mapi id 15.20.7292.019; Sun, 11 Feb 2024
 05:19:26 +0000
Message-ID: <350ee747-c1bf-4513-aad3-f43b11fcdf0f@amd.com>
Date: Sat, 10 Feb 2024 23:19:23 -0600
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
 <9fa0c1ad-dd7d-4350-aad1-4723450850bd@amd.com>
 <ZcZ1tdXqH90RabvV@phenom.ffwll.local>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <ZcZ1tdXqH90RabvV@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0082.namprd11.prod.outlook.com
 (2603:10b6:806:d2::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB8943:EE_
X-MS-Office365-Filtering-Correlation-Id: ab028a70-b19c-41a3-9fc4-08dc2ac10399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VfmXFw/YZInbHSaxVhseBKddMVl8kWqnulOO/pUIntOujUygeJd9sMDjHKfOFJpJmrBNYjDItwSwRjX0Yj8NUXpG7qNKaSXOm9rGrcEiXPn5Xn0EftK5aVVd0bpXVSHCa/N15f7rUdaEdEn7mRiKrQi5IAKjU3gFDHwGc752U6hJ4k+PgNiSfF5Xu3DdUwtB74U/aWuu+b5YMczLv1UgsMr0D/o7eeYrbzBEDKMsCOF9FoXOdgzgaVJNROiypaNJOKv3pO2Hok9bnDqGVJTxcC8vujIQNQzELuF2Z+MWdfH0y9i7eBvNIYtd2hgAZtPCIVYfaoJzASdrUE8nqOXN+H9BCJ3FiDKr4Vhp56qFqxDDdw1bzZE3GkxkbtvoT7WiPZ5hqGL4jq2LIqnNXWLDtu67Et65WabuKOsMWmst+R25PZR7mVP4cG2wsdS2xQaiYiAc9t2gdmu6nbW21rh+CTrU7JmTjRnbEfufM4KQthEZ2dyCvgnKc0zfyu2MICApEw5JAxbNmq0yyTovTe/osOnHWq8k3aE/SxiBixIF0vYTzxYSJ5wpzcJHXO7NnfgoILxIhidfPQO4LRg9c9nN0M2PvkkV6TMl03LnlN+gPPk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(53546011)(66899024)(41300700001)(6486002)(5660300002)(110136005)(478600001)(6506007)(31686004)(6666004)(6512007)(26005)(2616005)(921011)(2906002)(83380400001)(44832011)(7416002)(38100700002)(36756003)(8936002)(66476007)(66946007)(316002)(8676002)(66556008)(86362001)(31696002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck1FbDl5YndHNTlZNytlWmlLenBQdFZoNFVpSjk1SlhST2RmQVFYM1JYaEFQ?=
 =?utf-8?B?VDR4YVcxV0ZidkRyenp5TkFsY040Skxhc2tkRDZMNEZpSXA0NERvY2wrQlJP?=
 =?utf-8?B?TVY3MDg1RU44c0pZRTR3cmZBRFlaREs2djRmWi9mSWxIeFpocldQZHRrRGZa?=
 =?utf-8?B?MnR0WFlmRElrd1NBZnBXM1J6VHNEWkcxYjJEeHpiZmErYUFrL21aWVRxTDRq?=
 =?utf-8?B?SGtEc2V6Z0Vtd1Q4TzArSEdoVjNGMGJNRE0zMjhNRlFtYnhCTDNiZ2FuK1la?=
 =?utf-8?B?QnAvUUwxQnNZbEdnVS9oNENkYWc5V3oxM3RycXhFRnBEUGZhUTIwZXAzS3dq?=
 =?utf-8?B?TGd2Q2JGN2lOeU1Za0M0MVVuclJraWZzV0dUWmpJbmNhMTRKUnN6UndyVjk3?=
 =?utf-8?B?QW1aRkpDeWt2WUQrZ0o2VSs3TzAyeUhlTHJqbjJ3djdBRnNBMXA2Z2FCWk1N?=
 =?utf-8?B?aFlxb2lhSlRwVTdndmFYM0Y3dmlmNTZJaUVsK01GZmYyWVBtblFXbG1ZWVlJ?=
 =?utf-8?B?TUJnV2Z4TzVuUzU2SVVzVEYvdkhESUFtd0xPQXA4bW9henVoQlRyL1dCaEtE?=
 =?utf-8?B?bTNoVGtCc3pDdnlXN0FiUW03NnFRYXZkb01RRU9KL2s4cjNWUDhrdGc5U0xH?=
 =?utf-8?B?T0xXWWEyMlBuYzVhRGQ4U1ByWE1Cd2g3WWhESHhNN3JIbUpjTFBRSjJBQ215?=
 =?utf-8?B?VGw0QXpEWElCRUJaclFVUmRicjZiL3UwZmNmRXJoeW0vSFJSY05MWGNqazFW?=
 =?utf-8?B?a2p2UWUyL0RiMTA3NVNaZjJqQ1JwbGRXUVlwaHYxRWRISDFCNjloOFBuS05v?=
 =?utf-8?B?MkVXN1AxRDgzdXZrT0JkTGc3empqNFNhUy9MdkpkQmhRSU52a1V0bjg5Ykp2?=
 =?utf-8?B?cC84VVhpZmg2Y0h4TG11c2RhSGtoVWZXNTBTRHBjR1A1cTA4K0xUZndTZ1J3?=
 =?utf-8?B?SXlkZXZCYklKdE1rRmwvSTlsYXlQK2pnYW0yOHFjbC9OaUZ3S0h3cWxHNnVp?=
 =?utf-8?B?RUh6UnROQkFUc3VZOU0rU2ErdWxwemxESUhJV1RDQ0g5R3YwZDRlMTgvT2Y0?=
 =?utf-8?B?UHc5aTIxNzRnQmJvRFV1MitQcmd2YSs4VTVIaUZwYnREV3MyZGJmWWNTdUtC?=
 =?utf-8?B?N2JjMDRIc3VKa2sxWW5xajFGY0VvcnpzRVExaHJjTGQyUFRORGtFY01JN1BC?=
 =?utf-8?B?YVdOR2EvT1IyWVJuMVA3TEFnRnltRmw1TWtTdlVqNkdnSTl5bFI5dHBraWg4?=
 =?utf-8?B?cGxobHoydjRQZWlwZkJkc1BySmNsRThUSDFzS25EajFXNEZhaitEYVF5Qml5?=
 =?utf-8?B?aWtGYmw2a0hVc0tCRjZ3empYcW96L2Y3QkN2czRYUi9mZ0NselRBeTlUZFk5?=
 =?utf-8?B?Y0xlQzNIeE93cFVrMHpRd1ljYlhVaVA4emVEOXd3TmtHekpGYU8zV3o3d2R0?=
 =?utf-8?B?NEFFOGYzTnQvR29KcDFCNUpOY1l1OHV0bmlhc0RYUGdSUU9MZzBZL2ZrS010?=
 =?utf-8?B?N2hTMHlzYUJlSW96cGtGN0lYdmFnTy9mamZpYng2d01nWnB5d1lsZVBBWWxv?=
 =?utf-8?B?SFRhTGdlSTJYSlhNb2hJc0YyaWhHSDAxaFAzR2hoWWtsRXBVQUVjTUdsR2Ir?=
 =?utf-8?B?MmFlS3d3RjlheXJROXR1VXh2NEszaElqNUtKMDJMWi9wZEN2ajE2d09LQW95?=
 =?utf-8?B?MkxEcWRudVo2NUdaRnZLdFhDODB4cHQ5Q0l5V1c4T0Q0Rk9LMno4bkdVVEp5?=
 =?utf-8?B?VUUxUS9Ua2I0K00rUDRWMThFNzhnTWlzL1ZGUkN2NUkvKzdTQllsQVdMSnVS?=
 =?utf-8?B?NnFwWm5xZ09jZDdraE1wR013VTJINDQyTzBsMzRFTFBaVldabnlYbllNRU82?=
 =?utf-8?B?UnNHdW81azI1WGlTTWVHVUt3QXNSYVNudUVBWHJxbnpFbVhhSHo3VHhtNWYz?=
 =?utf-8?B?OW1oYlZHdVhDZFFvcmRrQWFldTFJWG5vVWFtOWs1STAwN3p4N1loVW96VlNa?=
 =?utf-8?B?UlY2Q0NuRUFSSW5UbUQraXIwTDVJTzRjRjRDMGQvYmlDU2R0QTJCb2E3MGVH?=
 =?utf-8?B?YUFmaEVPTVQ2ekhLN096Tk9JVURYQy9aV29yNHU3WFhmTm13ZjBYVVFraW1m?=
 =?utf-8?Q?xWThTXnkSj3/S5HBD9/kko9MO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab028a70-b19c-41a3-9fc4-08dc2ac10399
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2024 05:19:25.8277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fhyb9ABhSD8/0q8ICPEc/INdTWMdYGC+xsvjNhwnNouwqTyy9oOVFePaK6ZPQSrSmD2oHRKHUu7jG+d63QZ/2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8943
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

On 2/9/2024 12:57, Daniel Vetter wrote:
> On Fri, Feb 09, 2024 at 09:34:13AM -0600, Mario Limonciello wrote:
>> On 2/9/2024 05:07, Daniel Vetter wrote:
>>> On Thu, Feb 08, 2024 at 11:57:11AM +0200, Jani Nikula wrote:
>>>> On Wed, 07 Feb 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
>>>>> Some manufacturers have intentionally put an EDID that differs from
>>>>> the EDID on the internal panel on laptops.  Drivers can call this
>>>>> helper to attempt to fetch the EDID from the BIOS's ACPI _DDC method.
>>>>>
>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> ---
>>>>>    drivers/gpu/drm/Kconfig    |  5 +++
>>>>>    drivers/gpu/drm/drm_edid.c | 77 ++++++++++++++++++++++++++++++++++++++
>>>>>    include/drm/drm_edid.h     |  1 +
>>>>>    3 files changed, 83 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>>>> index 6ec33d36f3a4..ec2bb71e8b36 100644
>>>>> --- a/drivers/gpu/drm/Kconfig
>>>>> +++ b/drivers/gpu/drm/Kconfig
>>>>> @@ -21,6 +21,11 @@ menuconfig DRM
>>>>>    	select KCMP
>>>>>    	select VIDEO_CMDLINE
>>>>>    	select VIDEO_NOMODESET
>>>>> +	select ACPI_VIDEO if ACPI
>>>>> +	select BACKLIGHT_CLASS_DEVICE if ACPI
>>>>> +	select INPUT if ACPI
>>>>> +	select X86_PLATFORM_DEVICES if ACPI && X86
>>>>> +	select ACPI_WMI if ACPI && X86
>>>>
>>>> I think I'll defer to drm maintainers on whether this is okay or
>>>> something to be avoided.
>>>
>>> Uh yeah this is a bit much, and select just messes with everything. Just
>>> #ifdef this in the code with a dummy alternative, if users configure their
>>> kernel without acpi but need it, they get to keep all the pieces.
>>>
>>> Alternatively make a DRM_ACPI_HELPERS symbol, but imo a Kconfig for every
>>> function is also not great. And just using #ifdef in the code also works
>>> for CONFIG_OF, which is exactly the same thing for platforms using dt to
>>> describe hw.
>>>
>>> Also I'd expect ACPI code to already provide dummy functions if ACPI is
>>> provided, so you probably dont even need all that much #ifdef in the code.
>>>
>>> What we defo cant do is select platform/hw stuff just because you enable
>>> CONFIG_DRM.
>>> -Sima
>>
>> The problem was with linking.  I'll experiment with #ifdef for the next
>> version.
> 
> Ah yes, if e.g. acpi is a module but drm is built-in then it will compile,
> but not link.
> 
> You need
> 
> 	depends on (ACPI || ACPI=n)
> 
> for this. Looks a bit funny but works for all combinations.

Nope; this fails at link time with this combination:

CONFIG_ACPI=y
CONFIG_ACPI_VIDEO=m
CONFIG_DRM=y

ld: drivers/gpu/drm/drm_edid.o: in function `drm_do_probe_acpi_edid':
drm_edid.c:(.text+0xd34): undefined reference to `acpi_video_get_edid'
make[5]: *** [scripts/Makefile.vmlinux:37: vmlinux] Error 1

So the logical solution is to try
	depends on (ACPI_VIDEO || ACPI_VIDEO=n)

But that leads me back to the rabbit hole of why I had the selects moved 
to drm instead of drivers in the first place:

drivers/gpu/drm/Kconfig:8:error: recursive dependency detected!
drivers/gpu/drm/Kconfig:8:      symbol DRM depends on ACPI_VIDEO
drivers/acpi/Kconfig:213:       symbol ACPI_VIDEO depends on 
BACKLIGHT_CLASS_DEVICE
drivers/video/backlight/Kconfig:136:    symbol BACKLIGHT_CLASS_DEVICE is 
selected by DRM_RADEON
drivers/gpu/drm/radeon/Kconfig:3:       symbol DRM_RADEON depends on DRM


> 
> Since this gets mess it might be useful to have a DRM_ACPI_HELPERS Kconfig
> that controls all this.

How about all those selects that I had in this patch moved to 
DRM_ACPI_HELPERS and keep the patch that drops from all the drivers then?

> -Sima
> 
>>
>>>
>>>>
>>>>
>>>>>    	help
>>>>>    	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
>>>>>    	  introduced in XFree86 4.0. If you say Y here, you need to select
>>>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>>>>> index 923c4423151c..c649b4f9fd8e 100644
>>>>> --- a/drivers/gpu/drm/drm_edid.c
>>>>> +++ b/drivers/gpu/drm/drm_edid.c
>>>>> @@ -28,6 +28,7 @@
>>>>>     * DEALINGS IN THE SOFTWARE.
>>>>>     */
>>>>> +#include <acpi/video.h>
>>>>>    #include <linux/bitfield.h>
>>>>>    #include <linux/cec.h>
>>>>>    #include <linux/hdmi.h>
>>>>> @@ -2188,6 +2189,49 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
>>>>>    	return ret == xfers ? 0 : -1;
>>>>>    }
>>>>> +/**
>>>>> + * drm_do_probe_acpi_edid() - get EDID information via ACPI _DDC
>>>>> + * @data: struct drm_device
>>>>> + * @buf: EDID data buffer to be filled
>>>>> + * @block: 128 byte EDID block to start fetching from
>>>>> + * @len: EDID data buffer length to fetch
>>>>> + *
>>>>> + * Try to fetch EDID information by calling acpi_video_get_edid() function.
>>>>> + *
>>>>> + * Return: 0 on success or error code on failure.
>>>>> + */
>>>>> +static int
>>>>> +drm_do_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
>>>>> +{
>>>>> +	struct drm_device *ddev = data;
>>>>> +	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
>>>>> +	unsigned char start = block * EDID_LENGTH;
>>>>> +	void *edid;
>>>>> +	int r;
>>>>> +
>>>>> +	if (!acpidev)
>>>>> +		return -ENODEV;
>>>>> +
>>>>> +	/* fetch the entire edid from BIOS */
>>>>> +	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
>>>>> +	if (r < 0) {
>>>>> +		DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +	if (len > r || start > r || start + len > r) {
>>>>> +		r = -EINVAL;
>>>>> +		goto cleanup;
>>>>> +	}
>>>>> +
>>>>> +	memcpy(buf, edid + start, len);
>>>>> +	r = 0;
>>>>> +
>>>>> +cleanup:
>>>>> +	kfree(edid);
>>>>> +
>>>>> +	return r;
>>>>> +}
>>>>> +
>>>>>    static void connector_bad_edid(struct drm_connector *connector,
>>>>>    			       const struct edid *edid, int num_blocks)
>>>>>    {
>>>>> @@ -2643,6 +2687,39 @@ struct edid *drm_get_edid(struct drm_connector *connector,
>>>>>    }
>>>>>    EXPORT_SYMBOL(drm_get_edid);
>>>>> +/**
>>>>> + * drm_get_acpi_edid - get EDID data, if available
>>>>
>>>> I'd prefer all the new EDID API to be named drm_edid_*. Makes a clean
>>>> break from the old API, and is more consistent.
>>>>
>>>> So perhaps drm_edid_read_acpi() to be in line with all the other struct
>>>> drm_edid based EDID reading functions.
>>>>
>>>>> + * @connector: connector we're probing
>>>>> + *
>>>>> + * Use the BIOS to attempt to grab EDID data if possible.
>>>>> + *
>>>>> + * The returned pointer must be freed using drm_edid_free().
>>>>> + *
>>>>> + * Return: Pointer to valid EDID or NULL if we couldn't find any.
>>>>> + */
>>>>> +const struct drm_edid *drm_get_acpi_edid(struct drm_connector *connector)
>>>>> +{
>>>>> +	const struct drm_edid *drm_edid;
>>>>> +
>>>>> +	switch (connector->connector_type) {
>>>>> +	case DRM_MODE_CONNECTOR_LVDS:
>>>>> +	case DRM_MODE_CONNECTOR_eDP:
>>>>> +		break;
>>>>> +	default:
>>>>> +		return NULL;
>>>>> +	}
>>>>> +
>>>>> +	if (connector->force == DRM_FORCE_OFF)
>>>>> +		return NULL;
>>>>> +
>>>>> +	drm_edid = drm_edid_read_custom(connector, drm_do_probe_acpi_edid, connector->dev);
>>>>> +
>>>>> +	/* Note: Do *not* call connector updates here. */
>>>>> +
>>>>> +	return drm_edid;
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_get_acpi_edid);
>>>>> +
>>>>>    /**
>>>>>     * drm_edid_read_custom - Read EDID data using given EDID block read function
>>>>>     * @connector: Connector to use
>>>>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>>>>> index 7923bc00dc7a..ca41be289fc6 100644
>>>>> --- a/include/drm/drm_edid.h
>>>>> +++ b/include/drm/drm_edid.h
>>>>> @@ -410,6 +410,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>>>>>    	void *data);
>>>>>    struct edid *drm_get_edid(struct drm_connector *connector,
>>>>>    			  struct i2c_adapter *adapter);
>>>>> +const struct drm_edid *drm_get_acpi_edid(struct drm_connector *connector);
>>>>
>>>> There's a comment
>>>>
>>>> /* Interface based on struct drm_edid */
>>>>
>>>> towards the end of the file, gathering all the new API under it.
>>>>
>>>> Other than that, LGTM,
>>>>
>>>> BR,
>>>> Jani.
>>>>
>>>>>    u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
>>>>>    struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
>>>>>    				     struct i2c_adapter *adapter);
>>>>
>>>> -- 
>>>> Jani Nikula, Intel
>>>
>>
> 

