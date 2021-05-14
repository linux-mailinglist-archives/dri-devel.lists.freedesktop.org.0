Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1C0380C91
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 17:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34306EEB5;
	Fri, 14 May 2021 15:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3E86EEB3;
 Fri, 14 May 2021 15:10:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfsvTREkTZXB/HBXL6q8CvEuPkM9xGrrn+gYUHJjk+XIP2cDVvmdnutXbAz4gC5FkS/YF4ytCufth0RlmqwGde2vGZsC9XDSLxhu1FJCTEI38ElLssuJ26taJUcSMqvyEsJcGzGhNA0xShHEDHxcOBOk4lN5y24mZd0MAwa8uLr0zvCh6UhOF/KddQ2U5m5yY5BJLi8wjO7aoC7nPURFTjSCfCrE35YPrkWwzt4x9rsy2okxJiFZ21S4zZEufClm1mcYIPS0ZoB0Wre6atUEdj2FUhI+AO97Goqbw9nRtruA7RF57tavcmVNS8QEkp723tS9wFdUp+tx6p7St8LWVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkJj74YkLL6GJSZ97ZYRpVfz1JTtVGnCIsI8xiqBFvc=;
 b=YzUBbLjko+deLHUGQ838lZzbwkoFZmV3ei2wTAPwwUQM8CVnxcrtGtlbfur97IFxl67huU+L8rM9yDrBxrmWsTbHI1OtiAK+sVgQ6UKxzW11TD3lphSqTqqMAaBN/gGxaIG9l7C2zp0iCH6ppNs/FmJhdekPcSpKxcdX6ifX3c6Y9nXkg40ea65v7OqjjSRsVLwwwWsNNigL4TUzcqGa3J1c5dmAq0XEVkL1I2E+qgcDZYuCnjrhKh78XFBHp202zaiCwjyNrebzYKMn0D/yYG9c1qIr6cF5/BN3vqEBXGWUa3qNJFDD7CiFmjJwUI1ks+fWn1Xnew5LpsT/pI0zew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkJj74YkLL6GJSZ97ZYRpVfz1JTtVGnCIsI8xiqBFvc=;
 b=f6e0Hvz2Ps+KwkO1kMs76h+aRqk97KLBZCxUYuwyMyY4/R3jtSLKTMDMQDW0MG0OZG6dGtkWFRoSza+qEszRWJfuQkPKfMHmQU8NTnncDsAyNQJVvwHtzJkLuGQmo2ootVrbvDJt64HUSlq+b8tjngWlb9nbijkNKiRumm0miSI=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4061.namprd12.prod.outlook.com (2603:10b6:208:19a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Fri, 14 May
 2021 15:10:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 15:10:33 +0000
Subject: Re: [PATCH 0/7] Per client engine busyness
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Nieto, David M" <David.Nieto@amd.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
 <CADnq5_NEg4s2AWBTkjW7NXoBe+WB=qQUHCMPP6DcpGSLbBF-rg@mail.gmail.com>
 <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <CADnq5_N03pz6GmptzhRnCRQH=qkd4eWuAbuUysHp-A9NZHQMHg@mail.gmail.com>
 <BYAPR12MB2840AA68BCAEBD9279C6184FF4509@BYAPR12MB2840.namprd12.prod.outlook.com>
 <39ccc2ef-05d1-d9f0-0639-ea86bef58b80@amd.com>
 <7d6d09fe-ec85-6aaf-9834-37a49ec7d6c5@linux.intel.com>
 <9144f63b-953d-2019-742d-6553e09f5b40@amd.com>
 <22e7d6ea-f2dd-26da-f264-b17aad25af95@linux.intel.com>
 <b2203d34-2de3-7c58-de2f-bf6fafc3f67c@amd.com>
 <6cf2f14a-6a16-5ea3-d307-004faad4cc79@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a2b03603-eb3e-7bef-a799-c15cfb1a8e0b@amd.com>
Date: Fri, 14 May 2021 17:10:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <6cf2f14a-6a16-5ea3-d307-004faad4cc79@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:cf70:a0fd:8c48:efd4]
X-ClientProxiedBy: PR3P189CA0031.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::6) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:cf70:a0fd:8c48:efd4]
 (2a02:908:1252:fb60:cf70:a0fd:8c48:efd4) by
 PR3P189CA0031.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Fri, 14 May 2021 15:10:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8c3f4e2-c00c-42c6-325f-08d916ea6b90
X-MS-TrafficTypeDiagnostic: MN2PR12MB4061:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB40614C050EFE16DF3E20FDD483509@MN2PR12MB4061.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gWDqzXMfFHTp8i5ddPmYAoMBYEgDUUna6zsdwL8xEezEJkikxCgqjvsRyFgL4THtpwljpiJSFJ7MkRAOEkI9q86suwRvyxiJIHa/G2kCYUWlbuESYUl+ZF8khwUz975Lj+xUy888UB5LuHcjxNiIeiO7jh5e7slIh9O0b+GWVde2guCDn0ivS6KzkwLOOFvuHQyymUQ/HqZYjh9jsh+V+1d3trKGxSZPkEy9mH/2VuKlwPqrdRDVfRKtvwZNBqpKB5j6eCWW2hws958PJixDd+ox1t95yTed5JuCLNsoGn+kjsr+dHeuqMnkQmEWWPWRDrMJVy5mfpKNychp1CLL4X+rGgPkb9uBifWPivRNHPxhWlVUO8SCm8z2oH15zFMJc0Cw1zo7nE6nFwN8DGRj5D0jKb1/pPQ6DkN30/uRPco7ca/TIJe/XT+G1+djF9fCaleRuFRu+it7HX87XUtLC6wUhJwGuv/oU19E8xKyzLHQuyJjDAAjo57xYZRCOGHayMOajc1auE5C2oVbHr/KF7HhvTYVegJzX8seXD7F7ZbjhfZLXxZAmk3FImgmooGohOXM+EDttAeOGagSPaRiwijve/HSfxQO1YYqju9ur+QKWyagluBs/mpQGPG86I5DV6tBO6WaGxDmnSW3V4e3XpunZMn0Z7L16a0k8zGc+64pnFbRKhJDa2T4VdR6kQrT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(6486002)(66946007)(16526019)(66476007)(66556008)(5660300002)(52116002)(8936002)(54906003)(66574015)(31696002)(2906002)(186003)(31686004)(498600001)(8676002)(2616005)(110136005)(86362001)(53546011)(83380400001)(38100700002)(4326008)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N2JINlhxUU11ZExCQ3UzVUVTeCtOTXM0NDkvZWNONzlnSnE0L2JJM2t3amtO?=
 =?utf-8?B?eG9ZZmNZZ2tLTHAzaG5SK3pvNE5wYzBJV3RmNXJTM0ZpWWJIbDdvRndXaEhI?=
 =?utf-8?B?YXN6T2c2NUkyYXRacC9GSDF0MmtzRVQvakthS1NJeVY1cWszekhwVzdWdENu?=
 =?utf-8?B?aUs1OW1tOXFFT3Z5aUcyS0wreGtwMzE1SjkvNFlmUGhXcytpd1hHK1dCbUQx?=
 =?utf-8?B?WnRXVlMxOWcxcDJOSHZoK0xBQUNWSGlZa3B1a05aQmNzeW40YTVSWWtIMWFy?=
 =?utf-8?B?eStWTjdvc2dFalFSUnJpVDZVeFpNZzhUZktyUUlYNFRpV2RKbzl0Q2lIcjY1?=
 =?utf-8?B?VTlaWFBLajlRTWtsZVcrY2ZCL0pyYk1WWGp5T2llSGJkeEtLdHVuRTZCakdt?=
 =?utf-8?B?VnVRVVMwendyVnFGMzNoOUtPaHArQlBRT0ZxeHRrdFV4dHhtYThWZm9TdTRr?=
 =?utf-8?B?SzE1WTliOHovQnYvOXNXaWlaVEpMSmw3cXdFUnpORVJWWnB6Ymg0NUVHaGpF?=
 =?utf-8?B?azcwTEFBdWZYSU1PSmZEK3VGUVQ4TkI0UzhoRGpNekVyVUNUZ00rNGdlcmJW?=
 =?utf-8?B?L3lYL0JDMHd2aGd3SmdNOWhuMmI2L0ptSWZkUVlZcHZlZ1VRZ0pUR3NxNWta?=
 =?utf-8?B?Mzg2UEJjaVBUdmE2NmVJOCsrWk5rYTQ0NnVRWVNzUVBKdTVic1lPRi9FV3VM?=
 =?utf-8?B?RnFVL25rZ0owakJQMHFZUEg1aERJM3V2M0hKWENxZjRNRUQrdlRLZmVJMy8z?=
 =?utf-8?B?YTdCSjdleVlmYzNMRHhrQ0ZyUmgxOVdsaWZ1WHNJQ3BLYTYrT1h5N3ZpNFM3?=
 =?utf-8?B?azd4akZXVk9ydlBxMjNXUkV5UmwwUy9PRXF4c1RudmlVcnBrdlZUTFFqQXBz?=
 =?utf-8?B?bmZDZGQwYndyZUQ5YjJXZ0tsa2haalBPaVkwamt3TEc3ZWhmWThKeWRkOVVu?=
 =?utf-8?B?bVdSaENGZy8rVjQydFFiLyszRnZzSXR0a0RrNExwMHpDVEJIMndIWjhHajN4?=
 =?utf-8?B?RHhncjM4ZS9xNmx2TzY5SmRpT3d5K1E5cmphUnFHcG1aN3VMd2pSU3IxWWJO?=
 =?utf-8?B?cHUrQWVVcVIyVVU0RUY4ZGV6OEk4TUlSbkRNM3JocU5DMmVWTnlrQnE5QXhh?=
 =?utf-8?B?T2Q2ZVc3R0pyNFd6Z2FZVEpnYzZraEZhSXh5YzhwSmJCTlVJK045OFhmR1hq?=
 =?utf-8?B?ZWgyYzlLV1pWUGkySFl2ZDI3V1NJK1ArYkZUclBFQU1pU083TWtMWDRUeUkr?=
 =?utf-8?B?RlpsRWpIbHlEclg2WXk1RFU3V0liWEo0Y1JIbXhGRWEzZGVENFU3SmlLZkM0?=
 =?utf-8?B?bUptNjIzemF4Q2xqYjhFUE81dlJ0Uzlhd28xQ2lCeHdBejdQay9Ya3g2Zkpu?=
 =?utf-8?B?NE5Oc3hLVjNFNElFbE0yYTZTOWQ5S3pUcHE2T3crMUdwRFE4dFZUODl6YnNn?=
 =?utf-8?B?REVKQ2dPZnpZZXZYWlFHZ3lQNHJnZFdoc0Y2elZPdHhXRGlCYWpaYldvc3pX?=
 =?utf-8?B?cVNLRFVjVll1blYxQzNkS29CRFoxQVNGQ0FkSXNuUnhXRnA1RzY0N0l6dkNW?=
 =?utf-8?B?ZkFaRDhJVmxPdW14QVNiaUxSSWcxL3hRT20rMjdiSUFRZGY3OFZjQnhZVFNv?=
 =?utf-8?B?ZXc0RDZuQWZTQ2ZFa1V1bEtpNWVFdjJxLzV2SHBuN3RhVDVEeEw3WXpFYy9K?=
 =?utf-8?B?UFduWDZzRUtHT256WkJyK3F1QmR3TjZiVVltZWNzZ3YvYnFNcHY3d3FXcVB5?=
 =?utf-8?B?Z3B1WTh0dis1ajkxZWluTXh4TzkxT21CNkF4MG5GZ09yK2xUbzhUUFF3NlBh?=
 =?utf-8?B?Vmh1Y011dVB6NWZ4RkRmaVJLNUI4czg0YmZFQ2ZHZlBXbFJhMnBTWFZhbkVh?=
 =?utf-8?Q?u2j6pqzrkBQym?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c3f4e2-c00c-42c6-325f-08d916ea6b90
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 15:10:33.3565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: baF78Bq9OYnivkz7H97svGXQCl+McUP4y+7rRQpIgJ5fwNqg7N8QnDw1sRNwC2W4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4061
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.05.21 um 17:03 schrieb Tvrtko Ursulin:
>
> On 14/05/2021 15:56, Christian König wrote:
>> Am 14.05.21 um 16:47 schrieb Tvrtko Ursulin:
>>>
>>> On 14/05/2021 14:53, Christian König wrote:
>>>>>
>>>>> David also said that you considered sysfs but were wary of 
>>>>> exposing process info in there. To clarify, my patch is not 
>>>>> exposing sysfs entry per process, but one per open drm fd.
>>>>>
>>>>
>>>> Yes, we discussed this as well, but then rejected the approach.
>>>>
>>>> To have useful information related to the open drm fd you need to 
>>>> related that to process(es) which have that file descriptor open. 
>>>> Just tracking who opened it first like DRM does is pretty useless 
>>>> on modern systems.
>>>
>>> We do update the pid/name for fds passed over unix sockets.
>>
>> Well I just double checked and that is not correct.
>>
>> Could be that i915 has some special code for that, but on my laptop I 
>> only see the X server under the "clients" debugfs file.
>
> Yes we have special code in i915 for this. Part of this series we are 
> discussing here.

Ah, yeah you should mention that. Could we please separate that into 
common code instead? Cause I really see that as a bug in the current 
handling independent of the discussion here.

As far as I know all IOCTLs go though some common place in DRM anyway.

>>>> But an "lsof /dev/dri/renderD128" for example does exactly what top 
>>>> does as well, it iterates over /proc and sees which process has 
>>>> that file open.
>>>
>>> Lsof is quite inefficient for this use case. It has to open _all_ 
>>> open files for _all_ processes on the system to find a handful of 
>>> ones which may have the DRM device open.
>>
>> Completely agree.
>>
>> The key point is you either need to have all references to an open 
>> fd, or at least track whoever last used that fd.
>>
>> At least the last time I looked even the fs layer didn't know which 
>> fd is open by which process. So there wasn't really any alternative 
>> to the lsof approach.
>
> I asked you about the use case you have in mind which you did not 
> answer. Otherwise I don't understand when do you need to walk all 
> files. What information you want to get?

Per fd debugging information, e.g. instead of the top use case you know 
which process you want to look at.

>
> For the use case of knowing which DRM file is using how much GPU time 
> on engine X we do not need to walk all open files either with my sysfs 
> approach or the proc approach from Chris. (In the former case we 
> optionally aggregate by PID at presentation time, and in the latter 
> case aggregation is implicit.)

I'm unsure if we should go with the sysfs, proc or some completely 
different approach.

In general it would be nice to have a way to find all the fd references 
for an open inode.

Regards,
Christian.

>
> Regards,
>
> Tvrtko

