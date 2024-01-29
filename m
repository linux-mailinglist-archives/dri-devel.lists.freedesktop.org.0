Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1C7840C84
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 17:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1705D112A26;
	Mon, 29 Jan 2024 16:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2051.outbound.protection.outlook.com [40.107.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB89112A23;
 Mon, 29 Jan 2024 16:55:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGUbd0uoYJ+TSE0lFEMAdq6rtrHI2ohTr8rdXZw/7afoiyh582NDRxdaGGKFnjbAXOZGhVIsMC712uRFmEfR8Fobx9hF00BbFW9To9lgnzsUW3xvWBrvu16nCdscVU1G1CoBFzRsaAPSisYuD29t6TU3ZFYXBOJmcJfxH6mts/h9Nm7/yP/GAyAZKP80dHLG/367izSB4Kan6R0DdO1aA/VEp+nVPBP/8UX6CgRsYe1WoGiB3GbV0m06cgne2udWkNfc0FBfpqpsV38XIw3nJBgENfrxd3EcF2c2+A+EuBKokSdzZ/o+MHnnP6DlkoQ7EKNdumW+sLR6iDYryAygZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFxPptALoffkygo7l02OQ2yYnkkmSJ1B5391eBqq/l0=;
 b=oHaKJcGrmhddZ5fRliyQx1AmUHzcsRYw2wf2iTtjpLgWskeoLhsCWKPn5rIYzB6N9sd7jA2J+4M7SBK+8QqLe510Ki0HUFQ7VJE1G+y1EnBDqdePpoxxCWCKVlfUsmBrgmqWr3z+yNNTXlcHGRgsvEy9eiQw0Pim+kT5RlSB6Eg2cfabsy0GurgtNOs1g+4PtyO1Oqs4Ntom3ZuXTOfr23/QLu6UdmOVyoHXRteeDJHdUaQKRoPr26Vr4Rc7fdvJZXJ3GI4FGZerjHLozBYT/0lsERRCLnAVtK5os9HYeNIBx/eVQS6ywhdfdrsPrrqTf/kbCqFSGh4scW6z9k5obg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFxPptALoffkygo7l02OQ2yYnkkmSJ1B5391eBqq/l0=;
 b=kcT96dWGzw2VW6cK/j96K6Lht/x+VxDVhLk/DaFXF2MJwJxa07RMkyH+UXpOuJqrEyJHS9P2TFsi3UFtmqE5/MrbMWfWFbWGHSL9rH78MIdvXrJqgYPyTCQ7sfAOd6XkzVV9rXMYabg6dfOqamBoJaFw2793gwEIma/guO9jeyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA3PR12MB9105.namprd12.prod.outlook.com (2603:10b6:806:382::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 29 Jan
 2024 16:54:56 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 16:54:56 +0000
Message-ID: <b1b8545c-d05e-4e99-acae-690c3c052943@amd.com>
Date: Mon, 29 Jan 2024 10:54:53 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amd: Fetch the EDID from _DDC if available for eDP
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Hans de Goede <hdegoede@redhat.com>
References: <20240126184639.8187-1-mario.limonciello@amd.com>
 <20240126184639.8187-3-mario.limonciello@amd.com> <87le88jx63.fsf@intel.com>
 <63c60424-1b2d-4912-81b2-7c7ead4c8289@amd.com> <87cytkjddy.fsf@intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <87cytkjddy.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:8:2f::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA3PR12MB9105:EE_
X-MS-Office365-Filtering-Correlation-Id: acdd31f0-a634-43f0-3fc1-08dc20eb059b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fdRqQJ/B1T5L6YXM10ZRPKQ/4aD/sIQ4C8bkEQh5A//ohftde6x906S3LtLdzFwvqLMSVKuEUy63B6LdCpgAaPQKaoauhwSzmkNupMWdC/r7gxL9nyZQRFjYbVCTfeQECGw70/ix23sh70OuhyQ7VuiJ8pWk9dpvMxykmNe8sDZJwpuGqz8jUfrIMMbjjRfhUdwOxs6fNqu6IXdKJSZqFU3QhvgwBjONrX9f6biptSh3SuNCtCleLdHGSDpKBAkgvOW6MciuRlrihB6IjFAVkezAUagaVqfnY09hKMGjQDJMxf7i72G11iARZSS5rgrdJWZE6g5Zb4OvNJQOOn6iFIquvG/tQ0w9S0xN/qa3VIB8Tc0+LTDLWwFuc4gdKJo4O4cev3S7r1txa6ok+XAAsYLcAL+SFJJLmm7sWKdctTdiRdn6TuUGv+QHvSFKkRWqGaLTrsn4htBBPdTiYHll2z+LMwLYAUVM/PV/9+kOOkM2Eqhmo0D49cvMLnt6VlSc65SoAjI4rtfUXTQ0F368Epjxz9zzCFdWyBFQgTpM7UF5NQXjKdT7aYEZnhOrfd5iWzelF5cJtvkZCz+Qb2Vw3kDmDpuncQtHu57DAel05UM7E8ZhyGY7Q234E9/NZqHCcatPEB/LC60696wC3yQdhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(41300700001)(26005)(2616005)(31686004)(36756003)(66899024)(6486002)(316002)(54906003)(53546011)(478600001)(6506007)(38100700002)(6512007)(83380400001)(6666004)(966005)(110136005)(31696002)(66556008)(5660300002)(66946007)(66476007)(86362001)(2906002)(8676002)(44832011)(4326008)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm10TEpJOFVoK3poY3N3bmRlWGhsUjk2OGIrdE95QzZPb2xxbzRBcjRWV2ZY?=
 =?utf-8?B?S3VsZWlidXdWRzhEMXlIbTdjOGtpUHc5ZkFScG9BNWNBSFNTTWw5RVNscExo?=
 =?utf-8?B?c1hoejFwWlpEK3YyOGZLbVpaVWNaS0hHOFBKeXp6OW5XMGNkUVVYQU9TWmhD?=
 =?utf-8?B?eW1xYlRiM01GTmtTd2VpOGU0dFNERmtwV3NSMnlyYTFJMlp0cSswdGhtK0Vs?=
 =?utf-8?B?M0JOSDAzOG9iQVJQQmtXQXJra01NOFhTVGxmL2l2N0lRMmRDNnd5MnJ5d2ha?=
 =?utf-8?B?WC9VTHJITWZEb0o1bXp2QUVDK2lTNHF1TG9MVDFiZGNXbFNUODE3OE11aFU4?=
 =?utf-8?B?WTIvRDNjdHMrb3oydmNJdXlqakROSXZhb05QWWtSeitvaW9MVzJGK1NqV241?=
 =?utf-8?B?NUlkWnhLUHRWMHZycU4rNk9ONzFNaHJrRnhGNWZya0ZQaTJ4TWtlaGxZVHFO?=
 =?utf-8?B?eHRVZXR3TEExUXVBd3MveE1VUFBEWG1wZ0Nhc29qQ2FWbWVMRFF6aTVoWkZD?=
 =?utf-8?B?ekVocno0VGY2VGlYcjloYWlUcStFbzlIK0pZNVNHM0VuY1lDcnp6a2dpc3Z5?=
 =?utf-8?B?YUpXb2dhN3Z0dEY1VmtabnFadUx3UFROa1llM1h5MnFVVTRLVkMyaHNKM2Zj?=
 =?utf-8?B?d1gzR3AxZHo0WVlvMkhqc3NZZ1I5cDgzRFl4a04wK2d5Q1R3RGt3RENHdFNs?=
 =?utf-8?B?U2hSdkJqQlBLakVpSGQ0ZkZoZ0Q1YXo5OHVMZGlRSzhZbU1UcTYvYzErRmVV?=
 =?utf-8?B?TTVKUEFhMWNNc2J0VjZkeDMrSE5nWGZCSk9YcGcxeHNRM2lKSGdmOWthWnBa?=
 =?utf-8?B?VmIzN3k0Wmp6NzNKTDdDUnBmTnJvRGl2QWhLOFJIS3FxVjVpRWQzYTZ1M2Z2?=
 =?utf-8?B?aDdHRDdlZUVpSmlaR2FnM2srSVh3TFdURHU0ZktTUDJNK2hiQk95QlQxcFd3?=
 =?utf-8?B?WXhseE5SUERVZlgrTjk3dDhOSkMxY3ZRK1BSdTgwNk04RURhVEpQdzF2WU5y?=
 =?utf-8?B?eGlCZ3p1c0hQNjYwOVJadVdCTThWWWNtSWhNZmVQQkMvZUZ4MHluOU1UVnVZ?=
 =?utf-8?B?NExRdWdBWTZ3cTBqY0ZGcUJRckZ6Qis5Yk80aGNrRWFvelE4MGlyREh1VXNz?=
 =?utf-8?B?NmNZb0M2dE1iVE5Bc1dHNnNCeE55dHJma2ZpRTRNZXp3clNwbFZOd213ZmZj?=
 =?utf-8?B?R1VKV1RRdzdJNDhiVXBGUnBsSDhqYkNlZzZOaW9wNTJLMkk3U01XRHd1QWRC?=
 =?utf-8?B?Z1Y5ZUpNVmZQdVBWNnFETzBrWDZhUUo0amxTS3FWcWYza2VzdGdoa2Z1WWdv?=
 =?utf-8?B?QzQ4aXk2WE1Kbmh4ZEtHS2lWaFcrMERJYXg4SEFXV21KT3RUZjgzQTZMQkZt?=
 =?utf-8?B?TVJjN1pEckNBTG1ENVdJb2FEZGk3YUV4L25QdjE1bjhHd0hHUjB3VXh2Y1dK?=
 =?utf-8?B?OVRHNHNzR1RqbXVNTG1tb3JOS3l6VTU4UnBqU3BVRHBQcVNJcjZMRXZrNE1I?=
 =?utf-8?B?ZDJSbmhtMHgvbCs2V28vQmJWK1RMYlJwaVNnNW1ZL0pBRURhWmZOUDBVL09L?=
 =?utf-8?B?aVNHRFlESzdHSHVOZHRtdERzQVl3UiswM0NaOU5KdzQ2UmJiY1BHVDhCdGxY?=
 =?utf-8?B?REVDYXBvdUFuSE4wNnRSdmpYZnBOQUxtanZOdTdTVG93UGJDUitBRnI0UXVE?=
 =?utf-8?B?TnEzMy9ZV3NCMjhZT0hVN0hwTDZCU2grSzdydEN2U2FKcnJudkk4Vm5xZzZ4?=
 =?utf-8?B?UUs0N01LTGdxejYvSW5xaWVoMWpZNFlweFdOLzNUZjJ0MzU5TDU3dHY2WjNv?=
 =?utf-8?B?RXpjV1p4N05QaDNJS0taaFJMWXN1UTIzbjVITE0vcVFTc0U1QTIvZXhGZkJR?=
 =?utf-8?B?T3VCRGlTdEgzN08xNWJ1cVpHa2NQb3ZNQ1M5anZ5UTFSemhaTlZNUlFvb1Rq?=
 =?utf-8?B?OHJQR0Fkcm5BRkE3VE14S2NLaDBwTW1Wc0phNk55Z0ZWeWdzU0NOM09wUFdE?=
 =?utf-8?B?aDR0elBzQ2RjaWpZTkFNSXQ2cmVYbXl2RDFJcCtUbTI3TWFSK1VnZDVIVGdj?=
 =?utf-8?B?cHBzS1dPZXJndnhRRFN1d1hjWWh6cDdTcTZkanJSRFUvTTNaWDNtTzN3aFQ3?=
 =?utf-8?Q?rkOgn43xB89u9Ar/AyBgZAE8H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acdd31f0-a634-43f0-3fc1-08dc20eb059b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 16:54:56.5085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fNM32aqQ/rrsFWx31mjN8zaIwWzRPmHawGy5j3FZcMn5Tp4MQr1mFhqnz18tUwK2BJ5bvTAu5UgZNZt3ecdyHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9105
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
Cc: Melissa Wen <mwen@igalia.com>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/29/2024 10:46, Jani Nikula wrote:
> On Mon, 29 Jan 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
>> On 1/29/2024 03:39, Jani Nikula wrote:
>>> On Fri, 26 Jan 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
>>>> index 9caba10315a8..c7e1563a46d3 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
>>>> @@ -278,6 +278,11 @@ static void amdgpu_connector_get_edid(struct drm_connector *connector)
>>>>    	struct amdgpu_device *adev = drm_to_adev(dev);
>>>>    	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
>>>>    
>>>> +	if (amdgpu_connector->edid)
>>>> +		return;
>>>> +
>>>> +	/* if the BIOS specifies the EDID via _DDC, prefer this */
>>>> +	amdgpu_connector->edid = amdgpu_acpi_edid(adev, connector);
>>>
>>> Imagine the EDID returned by acpi_video_get_edid() has edid->extensions
>>> bigger than 4. Of course it should not, but you have no guarantees, and
>>> it originates outside of the kernel.
>>>
>>> The real fix is to have the function return a struct drm_edid which
>>> tracks the allocation size separately. Unfortunately, it requires a
>>> bunch of changes along the way. We've mostly done it in i915, and I've
>>> sent a series to do this in drm/bridge [1].
> 
> Looking at it again, perhaps the ACPI code should just return a blob,
> and the drm code should have a helper to wrap that around struct
> drm_edid, so that the ACPI code does not have to depend on drm. Basic
> idea remains.

I'd ideally like to split this stuff and Melissa's rework to be 
independent if possible.  I'll see if that's actually feasible.

> 
>>> Bottom line, we should stop using struct edid in drivers. They'll all
>>> parse the info differently, and from what I've seen, often wrong.
>>>
>>>
>>
>> Thanks for the feedback.  In that case this specific change should
>> probably rebase on the Melissa's work
>> https://lore.kernel.org/amd-gfx/20240126163429.56714-1-mwen@igalia.com/
>> after she takes into account the feedback.
>>
>> Let me ask you this though - do you think that after that's done should
>> we let all drivers get EDID from BIOS as a priority?  Or would you
>> prefer that this is unique to amdgpu?
> 
> If the reason for having this is that the panel EDID contains some
> garbage, that's certainly not unique to amdgpu... :p

OK; maybe a helper in DRM that wraps the ACPI code then and amdgpu will 
use the helper for this series.

I'm also thinking it makes sense to have a new /proc/cmdline setup 
option to ignore the BIOS for EDID.  I'm hoping that since Windows uses 
_DDC that BIOS will be higher quality; but you know; BIOS =)

> 
>> Something like:
>>
>> 1) If user specifies on kernel command line and puts an EDID in
>> /lib/firmware use that.
>> 2) If BIOS has EDID in _DDC and it's eDP panel, use that.
> 
> I think we should also look into this. We currently don't do this, and
> it might help with some machines. However, gut feeling says it's
> probably better to keep this as a per driver decision instead of trying
> to bolt it into drm helpers.

OK; I'll wire up the helper and if you want to use in the future you can 
too then.

> 
> BR,
> Jani.
> 
> 
>> 3) Get panel EDID.
>>
> 

