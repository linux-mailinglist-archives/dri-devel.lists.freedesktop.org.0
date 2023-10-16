Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB7F7CAD65
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 17:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A297810E221;
	Mon, 16 Oct 2023 15:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2044.outbound.protection.outlook.com [40.107.95.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8143710E221;
 Mon, 16 Oct 2023 15:24:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJHc0nwHSbHmWeUL24C67kZdIcBqeRXoRIZ9D/6UsBf5oXj/T8+dCpOvr8MCRT1UggRtjggpcMR9MpxJUAfeqVZAKscsUHfzdjXCHqzjfqNaYhx9+oOnOvphqgFtSVMoVX+gqrQrgzggfPChMTOb+nuud/Fw34CtZBmocZhYMzTfyV6ActXdw3yXBnr2T5PCTk/HLPzH8ixwu/t0eqtwog53XmwKtDizImGimjR4AfZAt1335u5MUM1+iLsDvXNczZEW1HXsgPrVb8HEsQMPll8XKbbefvIQmm4rkH8GuAymln4nLNgDojGxYNgDCgZiSY56pf9w6us0sD+U2zcQlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35HOdFz4zHJuhAQtHbcl9kGYchWM+rI9lzcQmcs4phE=;
 b=odNldxGffIo8AMAiZIUW96MxL7moJHUcb30od3eC8fdQlDyMoDlVCf3olwDRhLrVJEekk9exiWcJpSaLOeOaY8LGhy8Rm8CsKgwtc6ObAdebEk/BTKoNHwkLcFSzzLkRc5ZsMfeYlMk1wReXY0sQBdUmfl2sHB1jFL8G1IxSQuhFgEWSJO0gu/PNHkGn3C9CnwIjSvzISU67616d1xA2Ti4UyUCLepp8+sIY1RonEQsok0ctZuh30F1lmPip5yTj1Qn0w/uZOhRDC/aGxlBnGmZsnWPFpuH7SGWn5dVTAm61AP1c/XqV45d4/xZoH5IPDR6cYcJl/H7hO95jD6mYtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35HOdFz4zHJuhAQtHbcl9kGYchWM+rI9lzcQmcs4phE=;
 b=RjbatOrYtx8RvQ6DKSDhLxyLrc2qjVSYt/KqX3BwnqoIG65YxpElTf7UvVxHJGL0KHcphWpq7ibWLUCKXTFxChVfHRDWKnbVkOWzPr/bHyXsomghPStu5NRxlkpn9WQ5qqb15cp9YQWMTYuzxOdIkHSN1eRHnJ0B7ypSO5XhLt0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CY8PR12MB7097.namprd12.prod.outlook.com (2603:10b6:930:51::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.36; Mon, 16 Oct 2023 15:23:59 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:23:58 +0000
Message-ID: <13d490ec-21c8-444c-a5d4-b75e78a5c520@amd.com>
Date: Mon, 16 Oct 2023 11:23:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v5 3/7] drm/sched: Move schedule policy to scheduler
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-4-matthew.brost@intel.com>
 <161b9b56-3938-48b1-a3b9-1ca55fc2134a@amd.com>
 <ZS1SC2LxOSGZ8Su8@DUT025-TGLU.fm.intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <ZS1SC2LxOSGZ8Su8@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0307.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::29) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CY8PR12MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: 76752663-5099-4369-b496-08dbce5beb48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pioHlOUQqD9ALH5DkJo6/bJ3agVX0JtLFPD5w99p4iTEvd6GRq9+E4fusn7diW1nGt51syARmTDBjOZ6Bb58DOSlXh7rPC4ysKxvVzrBwBzr/zXN6av/rahBIFqpvpc6XiNu2ds0Rz5emfp/uAbB7gGmkUkhGCzdQZEpcSU7zxjDl0ZBSwbubqAhRQefgblNN3IyWuWnddBCJMGKv8GNbIvahpy94xRF0VEi5/UFw19ZeFO9msLN0XkQQR97NlAYMQASqoz175RRUxKaUK9AtUSkNfCOnZcOvlk5M/26bPO1dJjRIPlHGfBW5ko7+ukGlkAdcDgbnSD2Vc2YeGk7kQ/nAMqG/EELL7ishGb4jFFdqwwE1ClV+AJWIRc68vnJydBJLGzFSyH97jVRocenfIak4oEsvBsL5fNUHoFK9hBevNutTCXmva4nr1I9TaKvquS92q6Yn/i4NnBYET4TO4DJ0jDU8RxlMwlZ7hzJr9lpFx+5vVGIFbzvrSvTfgJDsUwBGjSfQh5psnZJ2zAmK/d5y5UWSBlJbyBQ7PAf9SM2kimla0SU70crKLluyQ8Yr29xr8IULRrXFFdC/UDXHGkC+a73nbu++1GLBdDLuBJqsCgN6WD9Md7ILcLx3mvC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(136003)(366004)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6916009)(966005)(66946007)(6486002)(478600001)(6666004)(66476007)(66556008)(53546011)(26005)(6506007)(6512007)(2616005)(316002)(4001150100001)(4326008)(8676002)(8936002)(2906002)(7416002)(36756003)(44832011)(41300700001)(5660300002)(31696002)(86362001)(83380400001)(38100700002)(66899024)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFNBN2xmMUxTOVJNUjdnbEhlNk9OMUdEdXZoQy90WmhNb1Aya2plZEVsZlNs?=
 =?utf-8?B?QnFYZ0p1QlBZV0k2K3lqdFFRK0N6ZUpnZ1FQczJ6RTB0NFpwVDRPbUNQK2Fk?=
 =?utf-8?B?UklrQ1g5NC9wOWIwQko1SmNOOHZqcEdwWUxkeC8vc1QxTk5nNE1WSHFiTHhH?=
 =?utf-8?B?Wi8vY1BZRzV0cFU5UjEreGVEK2J5bVRkSFZ0VDNJK1VrbFdQeW85MzVIc3JS?=
 =?utf-8?B?MUdHL2RDVzA5YkR2NndsYlMyQXFnTit5RTgzOFF1VlhocVRwVm5yNXVYQXk0?=
 =?utf-8?B?UENjcmhQbklTSVNHdWlka1F6Z0xRQlBWM0UrOXZXZ2FkcmNmdTVVNld3dDd4?=
 =?utf-8?B?dVZoRUVadW1LalF3MmlnRlorbUJHUWpiMmlETjk0cGc4d1A4Z3BqdkVnZHpO?=
 =?utf-8?B?RXVRNGJLUEVidCtVeFVKR0Fsbk4rNDlCYTZqOXVBUkJCdFAreXFqaGMzZHpM?=
 =?utf-8?B?TDJFK0pDaTN1aVVsTksydGV5djErRERIZDlpcFo4eFZQNnBnaWdnVU9seTV1?=
 =?utf-8?B?OVU1UEpiRzJCZUxxU2ovSXVMTHhaMUR4ZVVmSGJGZXNZZE5vTkpRaUhYNi9T?=
 =?utf-8?B?ZmQvOWtmWVJoMWErU295ZkM3TWN3Y3lOcjNFQTBCQWE3V2hVRVRmRWVDM0I5?=
 =?utf-8?B?TUxtQWtHTWZ6aGxKTFFpMjJpYmhTQ29aNVUyNjNGK3pzclRjTFhlL0pMazM0?=
 =?utf-8?B?eCsvMG51Q29NV2o0TjcvQlhmL3VraXA3OVpPSXJIRTFUM0xuT21rc0NBbjF4?=
 =?utf-8?B?TExKNzQxUDVMWXVFWFN2N2xIMFpaVVVSS1lTWENUZFBkdHVOU1NUMXBTOUcv?=
 =?utf-8?B?K2VGTW0zb1NGbW00RUljM044c2FrVDVGSUtJcHptN0VGL3RBQjF2NlozNll1?=
 =?utf-8?B?S3A0MjhFWnM1MUZHWC8wclBlMXBUeWljVHZ2Q1BVQXNhbU1pLzFyMXM3NWZY?=
 =?utf-8?B?bmduY3R2VnRUTnpDK2RsQkc0dWlUTi9rb3R1QlZBRzRsTnJJVmVtRnpremdH?=
 =?utf-8?B?UFg3SlE4UnNzY1Bjc05pVjdxdW51eEJ6aXRXQ2lKVU04RG9DSVd1L0hwWEdC?=
 =?utf-8?B?WTNNVGxob0NyVkJMQWszQ3dNaE5qS2F6dUZLNE5BRlhHTDVJR04wTU9GVTV3?=
 =?utf-8?B?RVhtT3ZhTzFxbXdTdEFJaW1IbDZYSzQ4OTRENzZ1OFpSNzBoaVg0dEQ4SnNB?=
 =?utf-8?B?WXJsWm9rZTl0cEdmN2lEWTBpdEZralZrcGo5VTVYSWluMldkTVpXZ2R6V1Jx?=
 =?utf-8?B?VDNjWGs2Z0pBeWp6ellPdkZia1Z5a1VpekRJdGRRZmVXUGpiV2oyZzRSOFlH?=
 =?utf-8?B?UDgzRmVlcFFTeFhTQ2h4RXZHdFJWc2thS292dGZmNkp1M2JTblpmc0FpWGZZ?=
 =?utf-8?B?Z1FjZjVRRCtVcE1GZkpLYlE2QUVoL1RsM2pDRExVVGJLSDVCVHJhOFRMblFH?=
 =?utf-8?B?WVJJRXNoWUFvQ3kxZVpIUWNkam85T0hVaXZod0pac3BueXBwcW00cWhQa2p2?=
 =?utf-8?B?a01qRitxUW5rNkxaREIyeGZ5Ti9ydkVoUVRTdHhvNXMyOFdDUmhDM09NQ2Mr?=
 =?utf-8?B?ZjlCQ2lRZGFnVmxqb0gwWnhMZDYrUkxzR0NPb2w1RldkQ2c5N2YvNHdzRGE5?=
 =?utf-8?B?SUVPR0JjRzRNeHg2akpYdGJhdTQ2QTVqMFlkUDR2a3dLd0pNWk5EeXpJREdj?=
 =?utf-8?B?SkNyanRMZEpLRnlTYlVqRGI1bUdmRGEyNHdPK0tyVzM3Vm1JcDdDY1dkMU54?=
 =?utf-8?B?Y1BFVWp1ejlMbnBmY1M4NVkzVkhhc21jT1c4K1BQS2pOQjRwYldMMWNMMWh0?=
 =?utf-8?B?Q2M0UHFqbjlkeG01b25wc3RZUDVVdHlGQmhnMnpMTTFzMUY3ZlFLYjZJcmFS?=
 =?utf-8?B?akk0K25TRk1tT3dYY2FRdUtDb0ZTYy9RZm1ZL0s4QytCWm9hUTAzL2c3dGVI?=
 =?utf-8?B?U1FQYmprVFdEUDI5RUtMamtwdStLZCtuektDdDRxSjUzVGY1TFZwMU55VG11?=
 =?utf-8?B?bHdMTlZ0bFVUMkFzN3dhVW9zai9hajFOeW84N3ZTZFJ6RkloMGN0ZXVsRzVm?=
 =?utf-8?B?QmxKOGIwQjBYajVoWTNjWGVVbzEvQmEyR3grcENXRmNMaWxLL0xqZ3FKanpk?=
 =?utf-8?Q?H75I=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76752663-5099-4369-b496-08dbce5beb48
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:23:58.9181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLY13WtZr6SFJp8sRV4dY9VQAjFrWbHfZSIts6DK4c57C6ccwPi5mVuPiY8evloF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7097
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

On 2023-10-16 11:08, Matthew Brost wrote:
> On Fri, Oct 13, 2023 at 01:45:08PM -0400, Luben Tuikov wrote:
>> On 2023-10-11 19:58, Matthew Brost wrote:
>>> Rather than a global modparam for scheduling policy, move the scheduling
>>> policy to scheduler so user can control each scheduler policy.
>>>
>>> v2:
>>>   - s/DRM_SCHED_POLICY_MAX/DRM_SCHED_POLICY_COUNT (Luben)
>>>   - Only include policy in scheduler (Luben)
>>> v3:
>>>   - use a ternary operator as opposed to an if-control (Luben)
>>>   - s/DRM_SCHED_POLICY_DEFAULT/DRM_SCHED_POLICY_UNSET/ (Luben)
>>>   - s/default_drm_sched_policy/drm_sched_policy_default/ (Luben)
>>>   - Update commit message (Boris)
>>>   - Fix v3d build (CI)
>>>   - s/bad_policies/drm_sched_policy_mismatch/ (Luben)
>>>   - Don't update modparam doc (Luben)
>>> v4:
>>>   - Fix alignment in msm_ringbuffer_new (Luben / checkpatch)
>>>
>>> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>
>> Hi,
>>
>> Forgot to mention this, but it is a very important process to note,
>> is that one should _never_ add someone else's R-V tag, _*UNLESS*_
>> a) there's an email from the person giving their review or ack, and
>> b) you're the one pushing the patch set into the tree.
>> If you're not the one pushing it into the tree, the maintainer will
>> add their R-V (after their reply-to follow-up email--see below),
>> including a Link: tag when they do "git am" after it's been all reviewed.
>>
>> And there's a reason for this.
>>
>> The reason is that when kernel maintainers (especially DRM via dim[1]) push
>> patches into the kernel, we want to add a Link: tag [2,3] pointing to
>> the thread where a) the patch was posted and b) where the reviewer gave
>> their Reviewed-by to the patch in a reply-all email, and at this moment
>> there is no such email for this patch.
>>
>> When a maintainer says "Do X, Y, Z, for an immediate R-V", this means
>> do those things, post it, and get a reply from the maintainer with an
>> R-V. This records how it happened and is very helpful when doing
>> data mining on how and why the code changed, via what patches, etc.
>>
>> I suspect there might be a v6, and we can do the R-V/Ack the right way
>> at that time. No big deal, but it's good to know in one place as it
>> is a bit scatter here and there in the kernel-doc.
>>
>> [1] https://gitlab.freedesktop.org/drm/maintainer-tools/
>> [2] git am --message-id
>> [3] https://docs.kernel.org/maintainer/
>> -- 
>> Regards,
>> Luben
>>
> 
> Again thanks for all the details of the development flow. Will read up
> on all of this.
> 
> Just to be to clear, when I post a rev6 I should not include a RB in the
> patches that recieved an RB in rev5 (or prior revs)? Rather a Cc would
> be better to alert the reviewer of another rev?

If you've received an R-B in an email and are subsequently reposting
the patch, append the R-B at the bottom of the tags, as a tool would do it.

As for Cc: tags, I never separate --to/--cc/Cc:. I just include everyone
in a Cc: tag, and my --to is just amdgfx or dri-dev. This way I don't need
to worry about cc-s and what not--it's all in the commit message. It makes
it easy for me, but you can do it whichever way is easier for you.

As to Cc field, if I want someone to see my email, I always Cc them, else the rules
put the email in some folder, where it may not be seen. But if their email
is in the Cc or To field, then I know they'll get it in their inbox.
-- 
Regards,
Luben

