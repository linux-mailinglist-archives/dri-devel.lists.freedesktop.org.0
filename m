Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DCC52E5A6
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 09:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B3C11ACE8;
	Fri, 20 May 2022 07:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED2611ACE8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 07:03:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/ptJNKHyiU7RyQQKnSkC/3SvtqERBKTzIlgIeBP8ggyLiRMZHTMhgG6b75KvhiUceulU8jIVbo1BbreHHheimFr84CJ8g8QqbKIZt3rBuTEcJ3Ln0Dgu1UlZ5X0pLSQprnMdK6zihZtiek7emD6jY+Ss0pkqydXml3TNrSk7mE3vunU/cJZBAWDz8Coej/cXTkdApEpwCtAWBUzZipxW5pxI3qrdIN8bzpJLvEMZ3vIWn8nQ07F9A0OaQ5248dsEeMUn334t0B6OWnkjt0eOUP4szMixpKNCbEtqoMDUrXMEvy/0MmFxovUC3rs3ea+bHxZW7wA8tt7WLHoj+sJCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+Dzvl+Dyi1MltSeP9RmO4xx+4ur6OdivvIhfRV+eeQ=;
 b=c6/JZP+zE0Ic1TfeEtGekdOEF0I7FgqLJY/k6t+DPO+gY3EwXJyk98wHk+Rh844Is/6m9IVCHYeVtixGD5NSenfYgYHb7+Alf41qsG8OCJdWP5xcmMj033K3X8YOkwIRhG3PYw7lmlkM3K1TEY/KuiOrOEwHa/tCi6Z/5jPKfgzqPiSw2x3JCNMdL1tzOuLtMAgaHjqTP+1CVc5hYlsKPdB3ruxXaTT3tMh8NNL1/cZanPvWZr6BehPLM5lOkr4fyJNCG9krWrlhCN7SgeOVNZA54NiBZgv3Ne8syMsOwdqi12gw2GpcDnzbWeWIIN6R4HZAxkdCTDhkhk1dN568KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+Dzvl+Dyi1MltSeP9RmO4xx+4ur6OdivvIhfRV+eeQ=;
 b=PMoxnjtpfjfeFtZS9ddU1YHCjMte8ZdggdV5Zn8fam2S11z/dm9ttugFrrYD485g/wEBqNcqydA4BqQ1fQok2QHlQBOPom5d4dqDa1c2uAv0uBLUdYKCgPKVkP/6r/s5kgmgJNRm+fWRkJ9svbOTSVjRtHZD/V6sY+7DPZTJgKM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4805.namprd12.prod.outlook.com (2603:10b6:610:12::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 07:03:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 07:03:06 +0000
Message-ID: <953d4a2c-bf0c-9a92-9964-eae445a8f113@amd.com>
Date: Fri, 20 May 2022 09:03:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] dma-buf: Move sysfs work out of DMA-BUF export path
Content-Language: en-US
To: "T.J. Mercier" <tjmercier@google.com>
References: <20220516171315.2400578-1-tjmercier@google.com>
 <175c5af3-9224-9c8e-0784-349dad9a2954@amd.com>
 <CABdmKX2GcgCs1xANYPBp8OEtk9qqH7AvCzpdppj9rHXvMqWSAw@mail.gmail.com>
 <0875fa95-3a25-a354-1433-201fca81ed3e@amd.com>
 <CABdmKX1+VYfdzyVYOS5MCsr4ptGTygmuUP9ikyh-vW6DgKk2kg@mail.gmail.com>
 <YoM9BAwybcjG7K/H@kroah.com> <d820893c-fa2e-3bac-88be-f39c06d89c01@amd.com>
 <CABdmKX2m1b1kdACKM19S+u9uR5RTy1UGMRgd+3QA_oAyCpeggg@mail.gmail.com>
 <7f895a99-adfa-bcbd-c130-a924c668b8af@amd.com>
 <CABdmKX0XLvRZvXyiN0P_B-fUACiF5xwQ07+u_gaR+hDhu_x_TA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABdmKX0XLvRZvXyiN0P_B-fUACiF5xwQ07+u_gaR+hDhu_x_TA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P194CA0002.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1d1f4ae-5678-4dea-02d4-08da3a2eca28
X-MS-TrafficTypeDiagnostic: CH2PR12MB4805:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB48053D5060023C287239A4A383D39@CH2PR12MB4805.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DdugSlSyKcxO0gi5mY7lMj/9fGzJd3wsTB5fbkvPXK2ejrhICrAQ6kkC50dz/NFgkt63q4LlvgNM/ERy+awIAaHYwzGvqJt9uArdbo/w/q8sK62d4w9hmtSWrAc460wmAauramu60Gb3H84I29Xuq8JojZ5DPgAQxstN2ZACw48T9NwxLACpuVsOsPNUH+gPx96owtHWAcHkBk42x6394LQd/y4Fkpk6XG8i9RbGQTcEzsyJpO4y/XvqzHNwnRKKOo45LKQTXASM/WjTS2Ad9RphiFTbORhm4JrKxhsQ8JQ12WKq7SvuAPQyKNsP1kGeWlJLbfvlmcz/Vx03a4Cl34WmVARN18dIEdAE0BDm9m48wirHMOQ056nJH7MqjIaqYirwCASpP488GGZQKX6axWH2KXfKFl1XsiEJUyUcjdsSNFqD2hOC+5K9R/vclckcBUiLxVapAaYJCsi0+j90P8sirfLhTXoahoN3ARIwW++vJi9mDnElYOTNcT9lb4aMaMN82sK6lrfFwUkZfP8/I9GV50dOmYlxP3NAEsii2V7LHShVEHOZPrUUV3L42vOQAupmB4I4KdAUpT6OnL0d2wDJe0A86BiAxZgDtz8wu0NFpJUcydpp1/G6iA1WOCTMqPoxB/zk7YE7Fk98j3JBtm/rx9rje9xbtyUe45lzZeg5LZhuZJ8MPJ+qDhikOX95F/yFyQ/4KZa3OeCH0/0DiWXhoNrMdghB+s6Qy0Cx06cVi+pUKueUWkBDMYhe2MPS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(38100700002)(186003)(86362001)(2616005)(83380400001)(6512007)(5660300002)(8936002)(66946007)(66556008)(66476007)(8676002)(4326008)(36756003)(7416002)(2906002)(508600001)(6486002)(6506007)(6666004)(31686004)(316002)(6916009)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZElPWDJRdlpwMTZLM2NCZEJsM2U5UURaL0xpTEdzTzhqZlhSc0dRU01jSW5v?=
 =?utf-8?B?eUZrdU56VlFDbllxaUdZZUFycno4RlZLRmhqVVYzTElQREhTRlcyT0JWTlNJ?=
 =?utf-8?B?cEJ3Wk5WWGRESExOT21lRnFQYnZPSHBQVHhETTZtR1pUeWdkRjA0bFpOZEpI?=
 =?utf-8?B?Y1BvRGRndkFuZUpreFpWSHQzZ3FpcXpUcGZjelBLT0oycEtCWjlkMjUzL1pN?=
 =?utf-8?B?amc4NCtuaE9NcmJwVldkNUlCdmxOQkdRbGR1dTltb1JPelVrK3JreUZkRktz?=
 =?utf-8?B?dEhXeG9uOW9PZzQ0ZVhZV2MxL1ZTUUI4eDd4S2RkMUNXVVRPRFVPWlBwVGxW?=
 =?utf-8?B?a0IvdTVGTjlYTXAwTUFGd1RvRlJ0OVhSMDlVVzlaRUlHZmJjU1Z4RGc2QUQz?=
 =?utf-8?B?ZXNzNmttR3R3UTRQKzJwZXRHR0pwT3NXMldjRU9JTTRFeDhwZHhha2x6ZzUw?=
 =?utf-8?B?YVRMTlJhL2MwenBtSTkvQUtjR21sOU5LY1VRNUZ1UmdKdmRTbGxPY0IwenhT?=
 =?utf-8?B?R1U5YWZxVXk5aE1hMTRVSHNjb3FTZ1F6bjNzNXlIWE8yY25hMituQ0JMNkF3?=
 =?utf-8?B?U2FFeTVBQk5zRFJ0cENPLzZQY1BGS2FyakJKWGtmOUZsUkJtQmtYdWx2TEJ0?=
 =?utf-8?B?aDBvcmMrNVJINXliVEI4ZUFRVXYrZnlaOVRjcFNTbmo4ZU83bmhqR0pVNTNt?=
 =?utf-8?B?bjRvMHZVM0VSNnZUSTF6anc1UjU0MTJSN09SRUxiUDZPcm1jbXk3VDlQUWUr?=
 =?utf-8?B?R2NXYUFxRHppUmJIK2ZvSmNjQjhFOVlnMnNWemc4OXBEbjlYZlpqV0Z5N0h0?=
 =?utf-8?B?aFREdVFwVGI5RXRuSnZUTld2b3BzblF6cXJZWmlqcUJacGNIc3o5N05ZUmJH?=
 =?utf-8?B?U2lvTUhOUzZrclJkUGNGYytTWXZqWFVBbFduRlNwUkxDTXA3Q3hzRzF6ZVAv?=
 =?utf-8?B?dUhEN3BnT0hOT3EzSUJ6cTFXMkpmakFlQTl3cVA0bm1IcnlnN0t2dUd5VHVO?=
 =?utf-8?B?d1gzc2k4MFEyYVozU1YwWVV4MzFDUTMxTnZxWU5aVkZGT005c0p4UXpmMWJ1?=
 =?utf-8?B?Mm8rSDJ2eFJVcVIrN3dZL05XcTRuL1YvWGlVRlcvbFVScy9rclZkU24yN0dj?=
 =?utf-8?B?V25zcDJlRmtIOEhLWmVqMzVNWW1RWno1M0NjTmZVVDNmMXlWV3d0UVFyUkpU?=
 =?utf-8?B?SWJHZkxLYjNzNzdNYThYUTlPMTY4bXRkZlRmdGRjeHgrWVdSOUlWZmJmOTN0?=
 =?utf-8?B?cWZKQnlBYnd2QlZxOTlTeEtGdDVoQkRpZkRiY1JiT2VWTFY3OERvY2VVbzlG?=
 =?utf-8?B?M2k2SFhXOXY2RzdIbnpmSDNuMGwyYlFmcXg2Rmh1cHUwSVRjN091anVjQ2tK?=
 =?utf-8?B?M3dUa1k5MTYyVmhRU3BlTDBGTnpJL3BydG15VXBuS2xlMnd5eHJ1bnltSmZw?=
 =?utf-8?B?MGkrY0hFdUNIVXIvaU1PN1ZwRk9sZmp3T3FrQTQ5ZzY5ZkhpODFYTnpPcmJt?=
 =?utf-8?B?U3NENW9aNFZUaE1JUXlUYjRpanZSbGNwamhrVzZoa09YeXBCT0dkN2tXSlBv?=
 =?utf-8?B?ZlZITmQwVm5yU2tCREFITFZGNER4UXc5T1htMDZvOWM4NzNYeEJoWFpXTll0?=
 =?utf-8?B?NGV2dExIT1d6RUYydWlGODRGbGNBaU9IeWpZOHZGOXFnNnZoWXNoU1dKN3pM?=
 =?utf-8?B?VGJETWlmbzMyNExsbEN6TEJLcUwvZTVMU1drYUJBRFZ3Ti93cU9NbDRpdGI5?=
 =?utf-8?B?OFowOXZVM0g0bFFXTmJEZUNhNGdCcG03NytyNHd5S3l0TjBPUk16U1BDZmlw?=
 =?utf-8?B?TkZWc2ZxSEorSWh2cFlvSCtEM3lHbFhqL1crMWdabzM2K2h6ejNOQmVjNjly?=
 =?utf-8?B?dUVTck1HSEpEY0NJTTFrcEdIY3p6aFR6b05DbTdMMWdoa2lWa1piRG5vR1lU?=
 =?utf-8?B?c0NMVXBWUmFyVHp5eUhWK21kWEZFZ1JxczByWVZRYUNhUEppeFl5NU9xQWNy?=
 =?utf-8?B?MVFrMjBKdWpzV05MUHJMOG9oZkRHN1pnMkVXRWZTN1dHczlXWDRrcmI5d0tL?=
 =?utf-8?B?Y2JQWThlaUJDeENUWmhDMW9pdHNXRzFRRjR4TDBxUGtwbFo4Q2wzbEJpRW5T?=
 =?utf-8?B?MEtobENVM2dEdWlpRWprTlpoWFJWcGtWTlJkc0x0dHk1RFVHd252ci9URjky?=
 =?utf-8?B?Z1VmUnd4VWh6MmxVZCt3cHk3TS9ZSHJQb3Y1bFVlUTl6L240NDF5OVc0Z01K?=
 =?utf-8?B?RGFmaittVE9CTW5TdWZ3emsyQURWc0UrenEyMXp1aEpDNFZ5SHIvY2NYYUdt?=
 =?utf-8?B?cmlraE9rVGYxWU1LeE9LS2s1cEZmbTVDRjNZc2RRbUM1WEdCYm1DK0gzNW0z?=
 =?utf-8?Q?sM0ZtNd5DAtfupCyzkS3Hm19nqrVE0kKdtWBg1B/Mr3E/?=
X-MS-Exchange-AntiSpam-MessageData-1: 8SYuiOngzpzI7Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d1f4ae-5678-4dea-02d4-08da3a2eca28
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 07:03:06.2122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VddUqOAAKwbyBjgh/rRfShJzsG9j2PKSOoci8vYufAj93FVbW7o5kPcg/TA0Th9p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4805
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
Cc: linaro-mm-sig@lists.linaro.org, kernel-team@android.com,
 Minchan Kim <minchan@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 John Stultz <jstultz@google.com>, Kalesh Singh <kaleshsingh@google.com>,
 Hridya Valsaraju <hridya@google.com>, Greg Kroah-Hartman <gregkh@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.05.22 um 00:58 schrieb T.J. Mercier:
> [SNIP]
>>> Is there some other
>>> solution to the problem of exports getting blocked that you would
>>> suggest here?
>> Well pretty much the same as Greg outlined as well. Go back to your
>> drawing board and come back with a solution which does not need such
>> workarounds.
>>
>> Alternatively you can give me a full overview of the design and explain
>> why exactly that interface here is necessary in exactly that form.
>>
> We ended up here because we could not use debugfs.

[SNIP]

> Another idea was adding per-buffer stats to procfs, but that was not
> an option since per-buffer stats are not process specific.
>
> So it seemed like sysfs was an appropriate solution at the time. It
> comes with a stable interface as a bonus, but with the limitation of 1
> value per file this leads to creating lots of files in sysfs for all
> dma buffers. This leads to increased kernfs lock contention, and
> unfortunately we try to take the lock on the hot path.

That's what I totally agree on about. debugfs is for debugging and not 
for production use.

So either sysfs or procfs or something completely different seems to be 
the right direction for the solution of the problem.

> With the description and links to the userspace code which actually
> uses the feature I feel like that's a complete picture of what's
> currently happening with this interface. If you could explain what
> information is missing I'll do my best to provide it.

Yeah, I've realized that I didn't made it clear what my concerns are 
here. So let me try once more from the beginning:

DMA-buf is a framework for sharing device buffers and their handles 
between different userspace processes and kernel device. It's based 
around the concept of representing those buffers as files which can then 
be mmap(), referenced with a file descriptor, etc....

Those abilities come with a certain overhead, using inode numbers, 
reference counters, creating virtual files for tracking (both debugfs, 
sysfs, procfs) etc... So what both drivers and userspace implementing 
DMA-buf is doing is that they share buffers using this framework only 
when they have to.

In other words for upstream graphics drivers 99.9% of the buffers are 
*not* shared using DMA-buf. And this is perfectly intentional because of 
the additional overhead. Only the 3 or 4 buffers which are shared per 
process between the client and server in a display environment are 
actually exported and imported as DMA-buf.

What the recent patches suggest is that this is not the case on Android. 
So for example overrunning a 32bit inode number means that you manage to 
created and destroy over 4 billion DMA-bufs. Same for this sysfs based 
accounting, this only makes sense when you really export *everything* as 
DMA-buf.

So if that is correct, then that would be a pretty clear design issue in 
Android. Now, if you want to keep this design then that is perfectly 
fine with the kernel, but it also means that you need to deal with any 
arising problems by yourself.

Pushing patches upstream indicates that you want to share your work with 
others. And in this case it suggests that you want to encourage others 
to follow the Android design and that is something I would pretty 
clearly reject.

>> Yeah and to be honest I have the strong feeling now that this was
>> absolutely not well thought through.
> I'm open to working on a replacement for this if we can't find an
> acceptable solution here, but I would appreciate some direction on
> what would be acceptable. For example Greg's idea sounds workable, but
> the question is if it mergeable?

Well one possibility would be to use cgroups. That framework needs to do 
accounting as well, just with an additional limitation to it.

And there are already some proposed cgroup patches for device driver 
memory. While reviewing those both Daniel and I already made it pretty 
clear that it must be separated from DMA-buf, exactly because of the 
reason that we probably don't want every buffer exported.

But to work on a full blown solution I need a better understanding of 
how your userspace components do.

Regards,
Christian.
