Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B6C8581AA
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:47:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EA310E949;
	Fri, 16 Feb 2024 15:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FlHWKDeP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFA010E949;
 Fri, 16 Feb 2024 15:47:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9xJHufWzM3ZLzNuk/sCdDQxJQVGQCGaz42oSvEaG3O0k9Fgo6r2Ne5QCg0jkjyUNSymKLUM6tVAUTeVhShJ7Z89ZRDKPpLfTI81XlSkWmp3HdEagUZswcIr6ARjGEJsVWWpS6wdIF7RGk+Kl+6n09ARxjiDsgYN1IsvPIZrMsjl/Q+WO2Z6aDZFhG/4f6hDHD0rGOPA9fBuudYEsRq5VGwLEMbJlijbeBrKKqVK6FUxjEJC7oKnRBxQ48jvx8Txl+JXOy9IPN15YXhymx84CbaOMYvvIaGbVOjktsqHyL++QAbb058FKMSJxv0o52kpksjTdsX3QLfKaE5QeKKyTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QqwhuwY5PJS0ZqPxBprWwKbJqHlheGJfCuuc5/gsXs=;
 b=RrudusX7V8XOzKYDC3tPbPrYfkpkEqP46eP9ofGvXhR1lh7IsUdF6jDzy+RvDlqN+PIHnTvXDxOA3rgbVU1sUeWtZ9uoM44nGvQiqhrhdemQpuZyxNNmYTJ1FGlDnebvM8GxyX+nfgj+j1spLw4kzgkwhReg7yNxXmXbfU0xx41ptvnEZVemP9EUZ4JjM2YG4lAIE/sut+N1Mq0YnrxvGm7hPg4Ev2mZIDU7GniSJCAyqS8sibCl6AAdpILHJbIZ2WxYQZ1ld3J2CD3iu1FB3KMljlFp1ZWHV+Z8hi6Th/muY8fGbq2i0keGizX1OI2QjnmSx/qH18DiX9QXPiYNXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QqwhuwY5PJS0ZqPxBprWwKbJqHlheGJfCuuc5/gsXs=;
 b=FlHWKDePVwG2/t3YLtTh6yGagZ/97cehmahDBYmluMfi0v4IODHi0H5l0vZJWb/PAaYXKeVVDih41Hx350mX9omhQpqOLDO+psuPJVCHKPRYcx4LXagxjcm9j9JYSDxXKTNJ42BuYWGi5fUJAYcW5eH1m5fpfx+xq+Xk8yEdrE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB7555.namprd12.prod.outlook.com (2603:10b6:208:43d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.15; Fri, 16 Feb
 2024 15:47:08 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a%7]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 15:47:08 +0000
Message-ID: <5c3ef760-8227-4914-94d5-79278827bee1@amd.com>
Date: Fri, 16 Feb 2024 09:47:05 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Only allow one entity to control ABM
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Hamza Mahfooz <Hamza.Mahfooz@amd.com>,
 Sun peng Li <Sunpeng.Li@amd.com>
References: <20240216140709.73708-1-mario.limonciello@amd.com>
 <8970de85-3117-4e28-82b4-3b35c5beb7cf@gmail.com>
 <6b9e6f24-8fa5-43c5-88a2-068dfcb9996e@amd.com>
 <e47b859d-eb0c-49f8-8a96-6f454fa18592@gmail.com>
 <20361f26-2c83-4619-8f9e-ec8788b8280f@amd.com>
 <126803c6-177a-4ffd-8b65-856fb83f9972@amd.com>
 <0e10db11-0723-47e8-82ed-94d68e3c5afb@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <0e10db11-0723-47e8-82ed-94d68e3c5afb@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0058.namprd03.prod.outlook.com
 (2603:10b6:5:3b5::33) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA0PR12MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eb221b5-1904-4b59-a363-08dc2f068864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CLi2Ne5j/n9o08FiH5OOWqRR0Y8iWZTWzze5fe2UOFB2IJTLqInEoPq7oODV0NQU+vkR6lVmWIjCLt4U+Yh7M6+HR2ZPQQ8bCGWBH8dqWwzQ0U+pM43sUpZyMnT8XZrvs+uHmbq7Ly2+LQXM52cXOV6Vg8vxjKGxGNqQR3gLkywLKgGv++ArqRzqlLp9rJGAZVPZWPgiNZjoZ4bvBYUjWmDIW0V8k3aSrcUwpJ5k/AybPR7LfsNuemo72VQQNNVCEKPX9aFYenQlZSzHHdrsoBnAftTmzlZ01GTOD5lxoxHrkcgWdn4xRbvTG5k7sWiUp+NVZSOcJ82A1v/mqHjo/7WwDBIGgB3P90TlDv1tiPP+mE+pXv6Oi+RnEpElNNXBN9ORW86zTYtipn0Lk1PonCybzcKLdDE2m0qsORe88HqOFyvuS4jhPxBG0t4osk1A6ulq0bNastFg1+yNm7T6Cd13zBqq96lMlLHnmj/dFXU6IQ2WpkHIMheNTbyEHIaF6Gs9iEd1IHxwbclUzH7sqS1PfB1GD5QP3qtIlUVoUYM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(396003)(366004)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(2906002)(44832011)(8936002)(66476007)(8676002)(4326008)(450100002)(66946007)(5660300002)(66556008)(83380400001)(41300700001)(26005)(478600001)(2616005)(66899024)(6506007)(6512007)(6486002)(966005)(6666004)(110136005)(54906003)(316002)(36756003)(38100700002)(86362001)(31696002)(31686004)(53546011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjR6TUNCZklGTERxRkFGd3JlaFUvelpKOW1GMVpoNnJGOXFMNDUwZG82MnU4?=
 =?utf-8?B?SmVEVVFYUG9FVWs5KzYveUIvS1V4OVpGbEloa1J6NzVVbHJPNmJ4bUlKK2l6?=
 =?utf-8?B?WHhtMTJTUDUxdHZiV2RQZUlpaW5WZXY4TVBYM1hUaDdvMmdTajM1RHhETWJO?=
 =?utf-8?B?dFgxTlBHWUNJVnZvN1M1ems0b2w2WHp4cm9ZbU1jZEhHZC8yd1JCR01Dc2pQ?=
 =?utf-8?B?RWlVcm9DWENOeWRPbjJ4ZDdRZlBLZDArV1h0b0sxRmlzUFY1WDdBVGF1Yko4?=
 =?utf-8?B?aEQxbjB0bWdONk1rWVFlbGNSaW1GN2xlVDg2VEpCRTVSQjUyM01XNXhZOUVK?=
 =?utf-8?B?cUtUTFpnck5VNUY0TlFjMk9ZOHhnYkU0ZXlYd3dXVVRDdU45UzNhVFlYc2F4?=
 =?utf-8?B?eldhQkhUYzBsVEVuUSs4RmVoSTB3REJ2d0MxR1F1R3NMQzBDR3h5K1BCYVo2?=
 =?utf-8?B?dEl3bTRJbzdzQ3VNR216Zjg0SitrTXBXV2MrZHVXLzVmNnlhdnZqd3Q3NmtN?=
 =?utf-8?B?aWtaWkRJZlVQQUIzVTlBWld0RXh2SzdaQlIzVlFCKy9pOU9WcCs4dUZVKzJV?=
 =?utf-8?B?Tm1oMVNjS0oxVHo2U0NKTGhDc3JZRk9lcDR1MXJVNlJtVnlid2lFZ09jMThX?=
 =?utf-8?B?eGlmQ1BMcHVXcVJ0TjVsR2NVTzk4SUFJbDR4UEtKMkNFTElEZVAyQ3JwSkw4?=
 =?utf-8?B?QnZvS0F3cEpuVXF4T0l0aGZRWVQ5OVhGVnFmb3AxSWY4ZlZQT2MxYmplcytx?=
 =?utf-8?B?MzZBT0o4YXZDMGJYWnI2WmtoSWVUQlZ0SWxLUjljVGZ3YTFkbDBYR21uTmhV?=
 =?utf-8?B?c212K2xaWUpQN3M0R21GQ3FsRjY3MEJ1Z1JuaFR5SlhTWEJPYVZ5Y0V5VUU5?=
 =?utf-8?B?dG1DN0hUbjBxcGxxWHQzSFl0T1Yxd24wRkRXM29OdmpSc1RVOXhnMGxTM0d2?=
 =?utf-8?B?WFVQUGdYRVpoRnNJQWhiVURaNU9iaEdHbmkxTVQ3THZNK2o1RmtaNThsYVFZ?=
 =?utf-8?B?L2YrVWUrcUlzYi9pYjNwRUM4Qk1QWlRSbitCZDkzRDkzcTloaFdiN1JBaUN1?=
 =?utf-8?B?NW41Y24wN0pGQ041bnpmMlBBWi9rMWdCaEVTYjlzWTZkU3JTenVYY0p0RWVU?=
 =?utf-8?B?RUJtMHNDeTVhZmpMWEtnUzROQkMwaXVORW5WTS9OT0dDU2RaWjVieHcvK2ZX?=
 =?utf-8?B?dlJqTWVUZTkxUVdtWWljV29OMzQvVWFRems1RXRhQVBlSUlxc3hpWEpDSUM2?=
 =?utf-8?B?dVZUVmNCRUFjMDZldkpqeGROWS9Qam1kb2lxQXBNYmFRUHZWZERESHhxY0ZG?=
 =?utf-8?B?QzRmcXpJSEJNaU81cStVQlh4bnhQaXdlL2h2UGRWcG5UZ0U1TmtDd2lZSmEw?=
 =?utf-8?B?QTNkaVNpME9GQW82eVdIeC9oUDR3ZElnWTRZWHpFdXB3aWExeUFrSjZvVGg5?=
 =?utf-8?B?N1puZ3ZUcDF3b3hYMUFQVnNxdHU1SG9neG9jaXZNaUp6YSt4MFRnWG1zbFMx?=
 =?utf-8?B?dGhKdWtwazE0RmYwK0tldDBkTnhKVlpXUU5ZOWtIaTkyYnhhT2U3TGQzam9L?=
 =?utf-8?B?bW83dmFhSjE0cFZhMkJINGxBdUZqY3dyaW1yOExvM2h5QmV5Z3FvZGFMVWtm?=
 =?utf-8?B?dnFZbU5xd0JSNXJBeE9ObUF2UWFuUlRWUktOWEM4ZXVCalJhVG5iSFNTYU1C?=
 =?utf-8?B?WDJacDlMNmpJeGxROTdXd2Q5N3NXcnlzWlRZUXdxb2JtckNHVk5GeHN4NThX?=
 =?utf-8?B?UnpBNUxCeGlkYU9LNkZzVDFSQkRTMEV2cU5pUVhhUkFUdERLaG9Vd2xjR2lj?=
 =?utf-8?B?RGljSURXczJnRm01K0tWdDU3T0ZvRFdsdmQybW81VVoxa3EzMkNMclIya0RI?=
 =?utf-8?B?dXpTT3VPSytRd3cxZHdWSVlmbkhVZkt5c0Nua2poSHZucHMxR21MRFZQM05J?=
 =?utf-8?B?eXhuN0tvYXRLV1JoM2VGUkNScTE3bFVwem5vaS9wdUhMUjI2RVpVNExJTUdr?=
 =?utf-8?B?azRkRzUzNmlVSVpMUUFTbko1RUJ4eCtLZ3F5cUVqOENqTzlMT04vNjZTMnln?=
 =?utf-8?B?MG93N3Zobmd6eEdLRkFiTVZKL0diS2dWOVB4TFlFS291RVJVZXU3VWdkQ0Zh?=
 =?utf-8?Q?kh/Di0zX0NIVvJli3Uupp/hYs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb221b5-1904-4b59-a363-08dc2f068864
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 15:47:08.5660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ArXQzNQyrWclI3AvMPZ4NPOUR8EYnxW3/ffUS03KPFbIPnk4sRxaU1HOS4Fz3IKWz98hy5Lt4USpgPJv/SEAFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7555
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

On 2/16/2024 09:41, Christian König wrote:
> Am 16.02.24 um 16:12 schrieb Mario Limonciello:
>> On 2/16/2024 09:05, Harry Wentland wrote:
>>>
>>>
>>> On 2024-02-16 09:47, Christian König wrote:
>>>> Am 16.02.24 um 15:42 schrieb Mario Limonciello:
>>>>> On 2/16/2024 08:38, Christian König wrote:
>>>>>> Am 16.02.24 um 15:07 schrieb Mario Limonciello:
>>>>>>> By exporting ABM to sysfs it's possible that DRM master and software
>>>>>>> controlling the sysfs file fight over the value programmed for ABM.
>>>>>>>
>>>>>>> Adjust the module parameter behavior to control who control ABM:
>>>>>>> -2: DRM
>>>>>>> -1: sysfs (IE via software like power-profiles-daemon)
>>>>>>
>>>>>> Well that sounds extremely awkward. Why should a 
>>>>>> power-profiles-deamon has control over the panel power saving 
>>>>>> features?
>>>>>>
>>>>>> I mean we are talking about things like reducing backlight level 
>>>>>> when the is inactivity, don't we?
>>>>>
>>>>> We're talking about activating the ABM algorithm when the system is 
>>>>> in power saving mode; not from inactivity.  This allows the user to 
>>>>> squeeze out some extra power "just" in that situation.
>>>>>
>>>>> But given the comments on the other patch, I tend to agree with 
>>>>> Harry's proposal instead that we just drop the DRM property 
>>>>> entirely as there are no consumers of it.
>>>>
>>>> Yeah, but even then the design to let this be controlled by an 
>>>> userspace deamon is questionable. Stuff like that is handled inside 
>>>> the kernel and not exposed to userspace usually.
>>>>
>>
>> Regarding the "how" and "why" of PPD; besides this panel power savings 
>> sysfs file there are two other things that are nominally changed.
>>
>> ACPI platform profile: 
>> https://www.kernel.org/doc/html/latest/userspace-api/sysfs-platform_profile.html
>>
>> AMD-Pstate EPP value: 
>> https://www.kernel.org/doc/html//latest/admin-guide/pm/amd-pstate.html
>>
>> When a user goes into "power saving" mode both of those are tweaked. 
>> Before we introduced the EPP tweaking in PPD we did discuss a callback 
>> within the kernel so that userspace could change "just" the ACPI 
>> platform profile and everything else would react.  There was pushback 
>> on this, and so instead knobs are offered for things that should be 
>> tweaked and the userspace daemon can set up policy for what to do when 
>> a a user uses a userspace client (such as GNOME or KDE) to change the 
>> desired system profile.
> 
> Ok, well who came up with the idea of the userspace deamon? Cause I 
> think there will be even more push back on this approach.
> 
> Basically when we go from AC to battery (or whatever) the drivers 
> usually handle that all inside the kernel today. Involving userspace is 
> only done when there is a need for that, e.g. inactivity detection or 
> similar.
> 

It's more than AC vs battery.  It's user preference of how they want to 
use the system.

Here's some screenshots of how it all works:

https://linuxconfig.org/how-to-manage-power-profiles-over-d-bus-with-power-profiles-daemon-on-linux

>>>
>>> I think we'll need a bit in our kernel docs describing ABM. 
>>> Assumptions around what it is and does seem to lead to confusion.
>>>
>>> The thing is that ABM has a visual impact that not all users like. It 
>>> would make sense for users to be able to change the ABM level as 
>>> desired, and/or configure their power profiles to select a certain 
>>> ABM level.
>>>
>>> ABM will reduce the backlight and compensate by adjusting brightness 
>>> and contrast of the image. It has 5 levels: 0, 1, 2, 3, 4. 0 means 
>>> off. 4 means maximum backlight reduction. IMO, 1 and 2 look okay. 3 
>>> and 4 can be quite impactful, both to power and visual fidelity.
>>>
>>
>> Aside from this patch Hamza did make some improvements to the kdoc in 
>> the recent patches, can you read through again and see if you think it 
>> still needs improvements?
> 
> Well what exactly is the requirement? That we have different ABM 
> settings for AC and battery? If yes providing different DRM properties 
> would sound like the right approach to me.
> 

It's user wants system in "power-saving" state or they want it in 
"balanced" state or they want it in "performance" state.

User picks that state in a client and there is a designated ABM policy 
value that goes with it.  Daemon programs the ABM value.
