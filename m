Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8437CED6D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 03:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4B410E469;
	Thu, 19 Oct 2023 01:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FB510E468;
 Thu, 19 Oct 2023 01:19:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEW2Fj+bzmQAe5VWlYdHvjuVitDit+9+772lilVL2fW8Wi7Ni5a16lwDo+Dl0noUJloekrtITjOLZGOekxOxSomN7J1y3Sj/susU9bPs/UawY4on7kHms3zpFepm8wZdKXZFDusxB2C+MzjQzS2kFw0RX+73lApiDPVCyIlaCIvOSZbuUIPwpm71PVEw6WLgD9lV/XlIUMGKhFcCMbHlCUUmoMsCR6rP0nX63tEFALILz/zuFFl+22aMfvLjztDjQhV0l05fGIFCe6u9t+jbC+I16X/j+GeAYWK3+VdoC1b6zv0oy3wQluKsbY0zYhlw6jg1HhFYQNw3HLeAELvUcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/b0AuhbyhtwHnL6/tV/Vf2lD2NZtyAw+o52Kr3ssN1U=;
 b=JFXdu3sAIrA+yb01Y9XJlwXWKuVBbk+9/ygmqvHURMCC/w/ZBb4VEAdP0ZIwPpR4k73Frl70NqqVsBppwgX6Lt+WezegDhfOhiL0mlMwKYQTaG/kTGq5NFpa1qDBMfe77+d7IPhZIFbXI4A8ibE1zHoqJ4B4OsgEapl5hrGcoui6jRFrUHZ9zoMJVmZuZExnhlp3fMT+jRpjibSN0Vts+llV6sQa0jjhDvBZNSyJS0ASDfmAZlvNCCfJrLPzFPaZYuBbnzNdtAbt5D9JeJgfYbChAXt0pm3anZVaZMkYJ2H0K5CmBSJD17lZsb6VYJiv64xuMHEzO1hoiJptVNqj5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/b0AuhbyhtwHnL6/tV/Vf2lD2NZtyAw+o52Kr3ssN1U=;
 b=rurpbddpHH2PNbkHY07eh3wuJScIzwfQqfx3+PYSaVq2E5CypTYOjYtL7/Qq2lfew1xLd4Cw4TDPh6ro1Fauu6L25d9l+S/KA0+uuElmGTWq5+rmyIsDY4xkw1eqMB6x7BWvQxcXuP8BY3zUS35UDqK+Eshgo6o1srQMm3KgPVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3375.namprd12.prod.outlook.com (2603:10b6:208:cc::12)
 by CH2PR12MB4940.namprd12.prod.outlook.com (2603:10b6:610:65::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 01:19:43 +0000
Received: from MN2PR12MB3375.namprd12.prod.outlook.com
 ([fe80::3ca8:3bb0:d0d7:3302]) by MN2PR12MB3375.namprd12.prod.outlook.com
 ([fe80::3ca8:3bb0:d0d7:3302%2]) with mapi id 15.20.6907.021; Thu, 19 Oct 2023
 01:19:43 +0000
Message-ID: <f95dbf9b-a17b-4de3-84ed-7b64cf575326@amd.com>
Date: Wed, 18 Oct 2023 21:19:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v5 3/7] drm/sched: Move schedule policy to scheduler
Content-Language: en-CA, en-US
From: Luben Tuikov <luben.tuikov@amd.com>
To: Matthew Brost <matthew.brost@intel.com>
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-4-matthew.brost@intel.com>
 <34a4a2f4-a907-4fa2-9705-878106155639@amd.com>
 <ZSd2lmMDy+ayyILC@DUT025-TGLU.fm.intel.com>
 <78832cf8-2649-49ff-a668-fd41f1a0a75f@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <78832cf8-2649-49ff-a668-fd41f1a0a75f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT2PR01CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::9) To MN2PR12MB3375.namprd12.prod.outlook.com
 (2603:10b6:208:cc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3375:EE_|CH2PR12MB4940:EE_
X-MS-Office365-Filtering-Correlation-Id: 234dfade-3f82-4301-212b-08dbd04178fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IYgKrliAHCCJpP2UJpPSGOsD+6UIaEhLEejXEIH8VHaXOps3WoEjBQ2g0GGqCqcQoSV4N8NGNF9CDR2YiDpPNR0EDe37qt2hyxfGrLxTcNe/OHUva2ZFM+AUgkhzcITUwd6e+T1NF8Ssla9IoDG/wMfEHPHLBzC67iTCl6j5aIkv3tH69MMl8lfI9OdPV92Tgprl6g8Bt+IFCfz5p5KbsS4t3eNk2pkTaOAULmntxvNG2XpSA4GAwbUIQwI+vTQcE0xaNhY5zPkbHspw/4TsCCiCiYOocVS1h4ifF6NZb9kJLc86uwvM6gT6NhG6/5kYBiBeBjJJ9sVIT73IPTgk8rMNUm5QQqPhYO5edPAogmkuBXXh0wkWQr0f6KoIn/XfPbvZcQnIChT5P7DFUMT3l11ICnb+w5reMJo/po8EFm5bFy5502oApDW6tscZytpVLxk7EemdMRdmJEzLBR0QvIwutnzqxHGdzzodwF9bUYnfCGHOo4FipTGcSBKWQjo5CZMfgpYHjHKHbmEBWM6atiNjNPYyRUNFEphewVBl2gEC5LJcWkCraB9D+7js2N4O/DOsGwFL7O0HNCRTiBxBtDLhZSIOmNdWRFVJXXliTcT7T6Fe0kwJGuhYiNDugfdndmWREtLKPxf+zGAq2iXvkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3375.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6486002)(966005)(478600001)(66946007)(66556008)(66476007)(38100700002)(31686004)(6916009)(316002)(53546011)(26005)(2616005)(6506007)(6512007)(83380400001)(5660300002)(41300700001)(8936002)(4326008)(31696002)(86362001)(8676002)(44832011)(2906002)(4001150100001)(36756003)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWREOW9XZThhS25PTTlXRkhtV3ZNZUI4M0lSRTRWOXNmVnJzSGVmWU1VWTlH?=
 =?utf-8?B?czg4cnZKcUo0cThlMzc4b0lUU0JGQWU4YmxnTUR1RkgwTGtPdkZNT2FhQnhV?=
 =?utf-8?B?ckl1WWFPbEJaZURhRHNqajkxMHJTUElYUjMxVElIOTlKTjlUd2tGZCt3R2gx?=
 =?utf-8?B?RGFNSmN3dkpoSFdGckxhakEvL0dwMDRmTWdGVmVrQ0pSbVNvK2tpRVk0V2xP?=
 =?utf-8?B?aGozM21iWk44TU5HYzlrNWozMHlnMGRBS0ordFk3dnRnV1ZNWXBJbXdyYkFP?=
 =?utf-8?B?b0tUN3BUNWUzQlhiV2hJWnk3ZWxoNkhxYmRQUGNuVkQ5N01JUTZ2Z3A3L2R5?=
 =?utf-8?B?NlNRaGNEbjU5UUxmelJwd3hsdFpwZjNRMC9ZNk9lcHA4SFQ3bDBKbjJKWGQw?=
 =?utf-8?B?SmR1REV6THVMVm1YaEl1NW1vZVlQR2lQM21icTdIaUVzWVZ4L0Jkb1ZqQ0NR?=
 =?utf-8?B?WHltWU1DWlZjQ29iWHNEejdTMFVEaEk2b2hDYlhPZkY0bjRoWUxtbm5WL1A3?=
 =?utf-8?B?cVpMZnNVbHNYa2p6a2RUendNMzZqeFR4OFpsZVhtdmtQNEJOQWdTeDBOdjYy?=
 =?utf-8?B?emgwZ1g5aXFJWVRCT293VkxMVGxBcU5wMnM4Z3lORmM5UjNEaWsxcjQ1SUxF?=
 =?utf-8?B?S21qejZsUmVHVkJSSkFUMFhhMkN2Nnkyd2NKQlp5a0lWT0M0WmZYbVA3VUpp?=
 =?utf-8?B?am01QlRNWEg5OEdJdWpYdUxYeVpTY25DNVd1ZUx1cXkwaE9nbFJMWW9HN1di?=
 =?utf-8?B?RWdpMUQxRHlSbFB6eFNTcEdJT2hzS0htdHU3dU9tUFpKc0QyY0pmUDVYMENy?=
 =?utf-8?B?WEYvNWVYMVpEZy9WaDhBb3BmcEN0Qjd2Z2Y5S1RoaTJJUGN3NGgxajhyZGxR?=
 =?utf-8?B?alc2Ukd1S0luaDZtVEo1WTF3Vi9lYWFKQlZ2YUpXeHVBejArdkYxdit4VVhj?=
 =?utf-8?B?Q2NVeWNmWi9WVStlYUppWHVtL20wQkpYQlVRRWl6b0lDMlRtbWFyZjd3S2xj?=
 =?utf-8?B?Rkl3TjFxdWdoRmI3Y1Nod3l4OUNjemZJVFNTQ0ZvL1RWeE9OaS9yVmh6bzJ4?=
 =?utf-8?B?MFVIUXBaN0VsSGwzMHB6MEtzNEZZS1duN3JGQ2diTG9DZ3NoU1dWdHpSb0hu?=
 =?utf-8?B?TDNDWnZuS05ubHZLNDhTemFDblN0ajZGY0dYVWV4eVBWb2NwM3FsY1NYcWt6?=
 =?utf-8?B?L1lsL3FWblNzN0RuNjZlMnJ2OWRSbnVXQi9EOGdySnI0NXUvS3N0MGFOeDRr?=
 =?utf-8?B?ZzJxSFJ5VmpMQ2Irem1BVFU0MFptOHd4RG9CaW9tdDRSKzYySTNsUE53OUZH?=
 =?utf-8?B?aUl5U0x5QksxbEN6aDdUaklYUGVxenZmRDFzMDVOZFIvMWxTYVMrU1k4QjdZ?=
 =?utf-8?B?d2syNWRHV2NzMmtlWHF3eFBZRVBITTdrNndTRWt6MzQvNFJkMlEzRVY4L3Nl?=
 =?utf-8?B?S1hxSW8vWUFEZC9lY1RGeGtIMEpaejhPTEszRG5hY2VUZjVnSEZtaEl1aXBw?=
 =?utf-8?B?Y0VReGJVaUl2eHEvRHVkbXVZL3VtcnZzdVhtbUViUDZRK3h5OFpWUS9WczdZ?=
 =?utf-8?B?T2Qza29JdnRnZGxTYU13dTJFYTZXVW1JUTlwZlMyRGtyNTQ2TitpNDMrbnR2?=
 =?utf-8?B?dkRYRDYrNllxTTE4TTFMblNoQ0RHQUs0L29SbUpMYk5GVFVZMmlDVG45R3JP?=
 =?utf-8?B?YkorRzJBcFRuNG1vYXJyUnp4aWFTZzVJZitid3Fla2djMzZsdjBEQjZJVE9K?=
 =?utf-8?B?OTBldFEvZk1ybmZjbmxaWERwTThDbUVpU3RKMElHKzFORnphSzh0eHBIeGtr?=
 =?utf-8?B?amduWlFlZW02VmkzUGNzeFVRbE52Nm0xOXBqQ3VHV1hpeTJMNGwxZFl1Vzh4?=
 =?utf-8?B?anhxOW1Nc0Y5RG02c3hQUlVlN1FDSDY3aGRhTk9IcWxUWTNCNHJPVVRwR1Vl?=
 =?utf-8?B?V2JwRjNtV2Z2eEVwOHcyTUZpb0dSeVNBc3ZJRDB4Y0JIb1lpek5tVytRRUNv?=
 =?utf-8?B?M3JNUm0rbnJ2amtRaE1mOUNnd3VCeS9VRk1FT21YQlVrRFRUWFlqL1N4czBG?=
 =?utf-8?B?NmRqeFNTMFpwZGJIeXFrZFo4V1hhejBCSWt2eHBwMHJ1T25nWXlid2J2L0RG?=
 =?utf-8?Q?cpyE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 234dfade-3f82-4301-212b-08dbd04178fd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3375.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 01:19:42.5686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PWFT4VNra29EsDsh6b9x6gnWV99LPyClksq3LB2m72Jb7hpDEDMFdWIuktg5gTnV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4940
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 lina@asahilina.net, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

One more very important thing!

Once you add an R-V tag, you cannot change the patch and keep the R-V, when reposting it.

If you change the code and thus the patch changes, you _*must*_ remove the R-V tag,
to let people know that there's changes which need reviewing.

Regards,
Luben

On 2023-10-12 01:54, Luben Tuikov wrote:
> On 2023-10-12 00:31, Matthew Brost wrote:
>> On Wed, Oct 11, 2023 at 08:39:55PM -0400, Luben Tuikov wrote:
>>> On 2023-10-11 19:58, Matthew Brost wrote:
>>>> Rather than a global modparam for scheduling policy, move the scheduling
>>>> policy to scheduler so user can control each scheduler policy.
>>>>
>>>> v2:
>>>>   - s/DRM_SCHED_POLICY_MAX/DRM_SCHED_POLICY_COUNT (Luben)
>>>>   - Only include policy in scheduler (Luben)
>>>> v3:
>>>>   - use a ternary operator as opposed to an if-control (Luben)
>>>>   - s/DRM_SCHED_POLICY_DEFAULT/DRM_SCHED_POLICY_UNSET/ (Luben)
>>>>   - s/default_drm_sched_policy/drm_sched_policy_default/ (Luben)
>>>>   - Update commit message (Boris)
>>>>   - Fix v3d build (CI)
>>>>   - s/bad_policies/drm_sched_policy_mismatch/ (Luben)
>>>>   - Don't update modparam doc (Luben)
>>>> v4:
>>>>   - Fix alignment in msm_ringbuffer_new (Luben / checkpatch)
>>>>
>>>> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>
>>> Was the R-V added by hand? (As in editing the commit message manually?)
>>>
>>
>> Yes.
>>
>>> I use automated tools for this which do not re-order the tags.
>>> IOW, the S-O-B is first as this is how it appears in the patch,
>>> then the R-V most probably added by automated tools, and then
>>> any other as are tacked on by other automated tools.
>>>
>>
>> Ok, so always add tags in order starting with S-O-B?
> 
> Yes!
> 
> The S-O-B tag you add when you write the commit and then you post
> it up to a mailing list, it's mandatory and it's always there.
> It's most likely the first, top tag.
> 
> Then various other scripts and tools start adding tags in an automated way,
> and those tags are just appended below any existing tags.
> 
> Generally, always follow a natural order (meaning least amount of energy
> expenditure--if you have to edit to reorder, that is extra energy expenditure
> and nature doesn't like that). Make it like a letter you'd get from or write to
> your bank, attorney, etc.
> 	These are tags you add when you craft your commit:
> Cc: goes first, followed by other tags whose values
> Cc: are personal emails, i.e. people. These are people
> Cc: you want to let know of this commit. This is followed
> Cc: by other personal tags, for instance,
> Co-developed-by: or
> Suggested-by: Another personal tag is,
> Reported-by: which must be followed by a Link tag with
> Link: the link of the report. This could also be a link to anything else. You can also add a
> Fixes: tag which should follow a --pretty %h (\"%s\") format.
> Closes: link to the bug the patch closes
> Signed-off-by: You
> 	Then scripts and tools (or even people) would append the tag list with:
> Tested-by: someone reliable, could have more than one instance of this tag,
> Acked-by: someone
> Reviewed-by: someone
> 
> There are no empty lines between tags. They form a block paragraph as they would
> if/when added by a script. (I never add _any_ tag manually.)
> 
> So, for instance, you may have:
> 
> Cc: Luben
> Signed-off-by: Matt
> 
> And when the patch is R-V-ed this becomes (least amount of energy, append at the bottom),
> 
> Cc: Luben
> Signed-off-by: Matt
> Reviewed-by: Luben
> 
> Then other tags may be appended, depending on the path the patch takes to land in a tree.
> 
> Check out:
> https://docs.kernel.org/process/5.Posting.html
> https://docs.kernel.org/process/submitting-patches.html
> https://docs.kernel.org/process/submit-checklist.html
> And there's more resources to check out in the Documentation/process directory.

