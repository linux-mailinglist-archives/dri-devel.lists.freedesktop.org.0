Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5CE69B355
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 20:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A9D10E43D;
	Fri, 17 Feb 2023 19:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F41A10E43D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 19:50:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBSPNBrpRgcSBhnxpEE80JPmy/J8z15es5fSnyTmGRgHIYy4MNUXnMhkuphc4PrsWDMvJWGjjxtUJpJAb8X0Z2DSDX1N8SccmEpaUVazpCfsUs1bKFUWQTiexcEsdNiEbD/4BhrR9hzYEICdRTtXZHdohOfH/tjWCxPglTtu+yNy60U2ldJLhErBloKTejDy9Cx1c5+rhH8jfpdpxcctcYBhodqx+BQh31UEie4XrpIV8+oE44aa5rDNI/9pEs+qoLUPStBFj/hnrIyPeEHdeSvxF1Dzq8hAdyiOQRhiKxxoGuDaJZ1f3kz4euDtLHOOeAlCbFnNcXUALs0fHMJaRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ga+JqtRwREpnT3yVSSeL1LR5GE6QP6kGpqJg5XpaTo=;
 b=g4IUbjKuNaHQRaRnwRRdAPXuOZIwztIhdF5A5FiCRgdcXLEoQw70NNmhJ+dhCWU2aEp4Q4XrM4faxQMf4MkHkbxnocw0XaRab6KNr5rlLscrSDVhmuT0WTC8znHh8LfWaEcie3+8OxodRDQr90+izSSi0f3fWBYkT6YZRal3Ca5CP4g5TNxzh/oRGDKk0jzOSsjUVYssQsfJabkuw1nCJ7/idvz4JbEELhfT/jtK6ic862d19bmR/oQFCKWfk2ejGGNrSl0ugmA8vCpyhH9IPyKdNCrZ3iBx6CRLOEasUBi2iVSnSgYYmMz7c859dXIkRwOkrbkQNY/3yumd1juV/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ga+JqtRwREpnT3yVSSeL1LR5GE6QP6kGpqJg5XpaTo=;
 b=FrEpSChMPmMkDjWaGZYa/Ys4QE7CPvWnXEDJZZpeVto8yDAuWwVnl6QyG8XnZARYifV7CeSIE26cstnkivRVZ5HjXcPbsk9r9P6uNkQQ5lyV3GNNDdY28M3hFvXS06hpf4sNOGSfFmSDlKQMLqIfsNgRig8LD9LyfCS0Ig2vt/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB8650.namprd12.prod.outlook.com (2603:10b6:a03:544::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 19:49:59 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 19:49:58 +0000
Message-ID: <3bd8069f-ffa6-75d9-97cc-57a0d057eb4d@amd.com>
Date: Fri, 17 Feb 2023 20:49:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230209081838.45273-4-christian.koenig@amd.com>
 <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
 <20230216163757.GK2849548@linux.intel.com> <87lekxzgih.fsf@intel.com>
 <20230217103501.GC2862577@linux.intel.com> <871qmozhve.fsf@intel.com>
 <20230217113621.GD2862577@linux.intel.com>
 <5c6fe661-9e96-d122-1a7a-110ecbd8a6c6@gmail.com> <87r0uoxyby.fsf@intel.com>
 <17f64e37-4ad4-d42d-ce0b-175f01a24957@amd.com>
 <Y+/YmK32UYNlQR52@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Y+/YmK32UYNlQR52@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB8650:EE_
X-MS-Office365-Filtering-Correlation-Id: d4f5e57a-c5d3-43d0-4f3f-08db11202655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4INP2zFm9ePNINDuuIpnZ1cG+NQNjOxdZI9JHKJ6Vz6q7u7aa6dWUpIVcM9ktMg0FJlZrHTztMR1d5qzzWmdgfwO+IdSH729hHyyy7eCu4oocEBeumG2U0CQT3AXgh/ZtYtl4WFbXQTfACjQXBFPTCMTeNeovqDa5yxqS4Z/sZQIbpO9Ft+WzhWXdXEwZcsbiNgrgTY9gl26tw5t0KNBx6BqRnu2teeaaS3jyigrcAGAHlQWKbEjPeXL7EwNXzs/CLajHY1qXKOm/EmzUhxjIjR1AyQx2tii+SroiO3bPscNDU6I9UgiuCk9Ex4nu7x9CFXppgBc/sTuJqUW1tD/BdQgOHhQlZELaub6in+AZzdlIh62vyl/68yltqvCecPO9rk6/wfvH767lEk4iLwefsgKRCe7pGVkcZ29ffIar67jpIYeqwHvLyDHMSjaelRxbAdsNGRhUCwfYbNYBCXxY6TplAjszW29LtnMUG+Votg6BXMyY9JEmBgoccqnwdF+qGVKnXg2e5fDDkGHEDulHHTjsy2n9jrlOkwSGrTkYmQHXttS1CbkdtIfOy2gCYgdZk3Qs/GWb94Z1UIHRZH+y3a4ijNCJP/8Mtgmr3XB0sbnGBoXWn6x1LlbGaZQPja/kfj41fTgJePXpOuVhE10El2aivMegZxAd91aD3tOc7aiVXfvUgZfGOOPZNT3L5gts/VK20MDzKWD8pEaaT66X1g+iCn7e5Og6qY48SE84Mg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(451199018)(36756003)(5660300002)(83380400001)(7416002)(8936002)(66574015)(478600001)(6666004)(2616005)(6486002)(6512007)(186003)(6506007)(66946007)(66476007)(66556008)(8676002)(6916009)(4326008)(31696002)(38100700002)(54906003)(316002)(86362001)(2906002)(41300700001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dS9qZWJPOUZSR09naEV3UEQxbkptcVRPeGQ0dEdmODM5SWk1Smo2cjljVllK?=
 =?utf-8?B?L2MvU2VoUkdZWXFTMEhHVGxRNG40ekdob1V4VjkrckZvYVVRRUx2NU10L0da?=
 =?utf-8?B?blZQU2VmV3YwZ2wwb05yUmdKSlhtZjk4WlBkRkVzd3lZZmRtcVRUd2hFQmZk?=
 =?utf-8?B?TENWOXhxTkFSSUdPd1FGUUZuWmFJamhlajJ0Y0NURVlBSDlPUlBHMFdwOTVQ?=
 =?utf-8?B?ZVhsbGVkeDB5TzMvY2tyQk10eUpzWjBubGR5SkxJeWVqOFZTekRRdUVyK212?=
 =?utf-8?B?Q0llVU9la0Y3MXI2WVVLTkI1ODhGczQ5bmdCMEF1bytUUkl3U2RCRnk3VWxk?=
 =?utf-8?B?aElFWm9KUGFiWmV3eFZXdzFtZFhxaGl0OWI5Sk1vRTlNSGtCc043L2VEK3FE?=
 =?utf-8?B?M2NnY3Y3OFV0eGdiSWdwYUZiZEhpbnAxdmdUK2FFUk5kdFNOa2JKMEhHWlRa?=
 =?utf-8?B?bWJCdFpFNllrZDRoQVVZSUY1d2NXTVZzR1JJMWtpcVlaV0ZpRTJyZVRPejZK?=
 =?utf-8?B?YlBkZWluWFdzOXphSVFuZUlDbFNGdUdQTzRYVG0zamsxTjZ1SVBlcUJvZ0Fi?=
 =?utf-8?B?UStDbHNvNHRDbnRQY1oxcUZsYlBNd244S21Pd0MvMzFjWHk5QUM1RTdpOVh2?=
 =?utf-8?B?Y1BNeVZFMU1uanBkd3pwTmFqaldzYzU5blFyeUlid2xHdWhubWZ3ZnU1WENr?=
 =?utf-8?B?bXJRcVc4Y3YraEVlSVNjcVRISjZRNmY5YVVwTGZORTl0amxOdnF6R2JCMFJF?=
 =?utf-8?B?Tzlib0lqSkJVTE1ZZTROSnBOMHo0Mmh0WlAyK1h6elZyaEdOcS9rMHUyRjJR?=
 =?utf-8?B?RjhRMW1qdjFySlNCcXJsK2Z4d1IzeDZEV2JRenlkeG52amQ2N050WmQ1Rkhv?=
 =?utf-8?B?aitqR3hlZnRaRlVQbDF0MEtCUmpRcmdIVXVqL0Q2L3hNMUprdUljWU5haFJt?=
 =?utf-8?B?aittVzJDTENkTGZ0M2c2bml4VXdLTWNWV1BtblJTaXFpYzZ3c3Z4UGpmT3Vr?=
 =?utf-8?B?K2JwZ3ZrcDFmWkZJZzdjcHJ5ckR5Y3pyMnpjRmgzc0o5Q01RNmJsUWpBcW9p?=
 =?utf-8?B?ZjdNRDFRWGNtTTU2R2VNbzN1MUtwSUlnVjNZc3pyaFFiNzdiVzBBOS8ySTY4?=
 =?utf-8?B?TUVFb1J1TUlyRE9VVGFUNDlTRVY4SGdaaWV1bFJ5NEFQYjZPQXluMXJ6bkhN?=
 =?utf-8?B?dzV1N3Z4eExkeFkrZWkzaVhxQWRLTGsvMm9uL0hULytyekVhVmxkRDR0VHp1?=
 =?utf-8?B?WFdpWENyUDhpMW9Gb3U1SnhoalRPbDkvUklPcDRGTG9DaFlrN2FUenVMbG5w?=
 =?utf-8?B?WE4rbkZOcnNxMGxvYXlEZmNOWVpibVRTNmFmMEVldHR3Y0plSG83OEh0VUF5?=
 =?utf-8?B?c2lPaVR1aWZaTHNQTGFNNWl5MWlleGV6ZG9BenZOcmMwTS9HMTRoUDJJZ0Vq?=
 =?utf-8?B?MTlZRUlNRW1hVGF4QThEYlJLMENjSlJId1BVQjVmQ2lacS9rRFJqaXBUVVBG?=
 =?utf-8?B?c3NoTUFPYXhWOEx4azAya1lZblRUeTVMRlRiK0huV1doUGp6RWNwZHpxajhS?=
 =?utf-8?B?bXVYOFZpY2xmdHlBWHJhSUhPN094eGt6QUUxQzk3Y3Z2RHRKU1M0S2V1NHR2?=
 =?utf-8?B?bmtPSmtPNEsyZFNaTU52ajUyUldicnFPdDBaNXVhcldvNmR0RGQvcHVLWXYr?=
 =?utf-8?B?M3VXeGNKdWE5U1dMTXpsODN0alhVUGRxRnJmTm5xZTdxMnlsbFhlb25DOW5D?=
 =?utf-8?B?cVl3RnZyUjBpWDg4aEtyZFROdmEzcmhsT25DaVlxb1FNMjV1bUxkYnM5b2lM?=
 =?utf-8?B?aGxyd2ZabTNXK3NMYlJDVW5xZGg3M09rTysxdThhZ2JDblNWQWRYQmsxRnVk?=
 =?utf-8?B?UmxYSWwzSjRhQmpkU0tPTXhWWEh6UjhPNmNFb0tnSlBaamZ5ZHFWdnVjUEhV?=
 =?utf-8?B?bkdPQUpNOHR5b2c1YzNGQkhIYzBsWG0vVnNxbUU1SWoybUhGSEpuZm44Y1Zq?=
 =?utf-8?B?cDIzV2psRFBwREhYV2NIaS9WSmpVVno5YjBRUi9BZWpLTEppWGFyTDkwUGRh?=
 =?utf-8?B?dllDa09rUmVzWnhwMFpVK3J0ODZXa1JUMTkzOVcvbHRPazNMWkFDbnlZdGdB?=
 =?utf-8?B?M1FlZFJ1ZThJYWFsckNUaS8yY1E4azZZNUY2NzZPejdsbnpvZEtVNmllRmVF?=
 =?utf-8?Q?FnoFx2rlvrMF91muO2LkRpU5/npjPFFC2b/tCxoiN8wW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f5e57a-c5d3-43d0-4f3f-08db11202655
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 19:49:58.4682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QPL0EytJ8nbhgobUI0iO10TNOvsO3DUMmdzc9wlteQSPudGiI4DWpKz4njel8pNn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8650
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
Cc: mairacanal@riseup.net, daniel.vetter@ffwll.ch, mcanal@igalia.com,
 dri-devel@lists.freedesktop.org, mwen@igalia.com,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 wambui.karugax@gmail.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.02.23 um 20:42 schrieb Daniel Vetter:
> On Fri, Feb 17, 2023 at 04:55:27PM +0100, Christian König wrote:
>> Am 17.02.23 um 13:37 schrieb Jani Nikula:
>>> On Fri, 17 Feb 2023, Christian König <ckoenig.leichtzumerken@gmail.com> wrote:
>>>> If i915 have such structural problems then I strongly suggest to solve
>>>> them inside i915 and not make common code out of that.
>>> All other things aside, that's just a completely unnecessary and
>>> unhelpful remark.
>> Sorry, but why?
>>
>> We have gone through the same problems on radeon and it was massively
>> painful, what I try here is to prevent others from using this bad design as
>> well. And yes I think devm_ and drmm_ is a bit questionable in that regard
>> as well.
>>
>> The goal is not to make it as simple as possible to write a driver, but
>> rather as defensive as possible. In other words automatically releasing
>> memory when an object is destroyed might be helpful, but it isn't
>> automatically a good idea.
>>
>> What can easily happen for example is that you run into use after free
>> situations on object reference decommissions, e.g. parent is freed before
>> child for example.
> I know that radeon/amd are going different paths on this, but I think it's
> also very clear that you're not really representing the consensus here.
> For smaller drivers especially there really isn't anyone arguing against
> devm/drmm.

Which I completely agree on. It's just that we shouldn't promote it as 
"Hey this magically makes everything work in your very complex use case".

It can be a good tool to have such stuff which makes sense in a lot of 
use case, but everybody using it should always keep its downsides in 
mind as well.

> Similar for uapi interfaces that just do the right thing and prevent
> races. You're the very first one who argued this is a good thing to have.
> kernfs/kobj/sysfs people spend endless amounts of engineer on trying to
> build something that's impossible to get wrong, or at least get as close
> to that as feasible.

Yeah, for kernfs/kobj/sysfs it does make complete sense because those 
files are actually sometimes waited on by userspace tools to appear.

I just find it extremely questionable for debugfs.

Regards,
Christian.

> I mean the entire rust endeavour flies under that flag too.
> -Daniel

