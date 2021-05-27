Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D6F392BFE
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 12:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89E46E135;
	Thu, 27 May 2021 10:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851706E135
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 10:39:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/nntuYfy6Lu/WKkfREvjV5tBVMBxmEPojVhfZtNZUOJ4fyH2n9U0fRSlk4sm05cLu98YBrb4Vt5MhcOa1qOcsCatAR72iav6Gq669OVAqNItQS2WdAj9gVX8KR79kcVXt8TzJfiMnELeMhTcDyyMbvQdRvLububMNEp+33hxxj7a9WRpDdzHY4tm8/07v3YdIddmzBmgWLtKlVrsZPYBwUSGzayKU3ZCmpTtp5SvfnG2L+Riwu5NULWgYvJMn/eABmmKpRBhKMAXIZJPYv6k/PCQByTkavgZB99D3Nk3dG+QQM9k/4ME7XEkrHHu4ixc5mqbEQoKko6LQhJO9Qg3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9mxCJQpvtqEvOiKEfGAHT4kGF7KgrV6lawOnmPRjqg=;
 b=TWqgDyfgk+5MI/vUPlo1GA0AQFLF4N25HDiJO4NISAClpSIvgtxaR9fNC+uw4qEdKW97ingKeX/vZlPEiIz9AArKPD8bzvxrHKgh1fvO8CTTZPMQ9edBN2TmfwHvAUYHFsqtqmgjegeF7oIcf1LF6NzoL8jZ8jP1k8GKN3dTfdl/vmIz6+BUAeW4679QReK++YICMoxzszWfJYM8Udkzc7SKZ8n06IuI0z8kiHmMEqL8g0HIQqjNMbDOUDCfIZvtbGAEc36f8tL37M6BlL8/asfgqlMaOuaE/nuSLbXLyMkw9FkPK5PbWJL80vA9zTmtIYnnb8iTXjCyM4wQKJjv7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9mxCJQpvtqEvOiKEfGAHT4kGF7KgrV6lawOnmPRjqg=;
 b=haOYd6sMBQH1UC6GDFr451EKh6Gem6QVY1hE3MbZA58TWyupt4OamVlmtl38sSMOFqn5xTNOu/hnChdXAGlxjw1DPfKbLUY5LuFbsmf+VElsCdUh8WKlpZRMdQDEqmJQfRMHS5XaL2P/atxduvMp0+nWHk04QkSMykWa63+jbVg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4898.namprd12.prod.outlook.com (2603:10b6:208:1c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Thu, 27 May
 2021 10:39:48 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.024; Thu, 27 May 2021
 10:39:48 +0000
Subject: Re: [PATCH 4/4] RFC: dma-buf: Add an API for importing sync files (v6)
To: Daniel Vetter <daniel@ffwll.ch>, Jason Ekstrand <jason@jlekstrand.net>
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-5-jason@jlekstrand.net>
 <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
 <CAOFGe97b-djqwV95Y91xe9-ZVUyeGqjdPE8vj7MoSfV0Kcrp1Q@mail.gmail.com>
 <CAPj87rNJTHNKkdiZREVb8v6iiwUhYLXW10pjVOdV=zttd+tG3Q@mail.gmail.com>
 <CAOFGe95TZRw=ZpSwOKpwcxkxP_JRmEXpJn_26OS2ZPH0Mp5Kyg@mail.gmail.com>
 <CAPj87rOoVtc5dC12bBU+j6tdxHLh8fWGsPiemThBrY-=TjMx7Q@mail.gmail.com>
 <179ac18a598.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <YK9yM3/62iSucORU@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <bd0e3ebb-fc09-cdeb-9805-9a91ba7f69a9@amd.com>
Date: Thu, 27 May 2021 12:39:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YK9yM3/62iSucORU@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:e531:3aa1:4782:878a]
X-ClientProxiedBy: PR1P264CA0023.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::10) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e531:3aa1:4782:878a]
 (2a02:908:1252:fb60:e531:3aa1:4782:878a) by
 PR1P264CA0023.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Thu, 27 May 2021 10:39:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b18230f5-c982-480b-bcae-08d920fbbfff
X-MS-TrafficTypeDiagnostic: BL0PR12MB4898:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4898FE95344BCBB2E56CC30183239@BL0PR12MB4898.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H/rkA3fW0EbxR9QhZ/I1/ZaE1rQZhY6pRFwVcinEa/FIRillliYg/+CGSNBp+HPc2EBAwkUln6ndYPnj2Fh/D7xiczBBsu4CcxOya3NgrAhIKFNOAfS1pt2OXt3/eyhNEEGyNwoA7knxWBwItq4Yhnpk7HdR1lCK7TvMyvTXXKbCFERhVzjFW5pty0VH13aT4+iJLCLTDHPJo/+GMMWkylPUrOjU4QnX7Pg0ajiLwbrtYlgoLeOXo9JX2qDShQ3dZsHIZp4rYusT34EItCv4YZpBIrc0PwjLCAj6INPaIfIlJjfCF2kTczp8xVF2snC6dtdBdRT0+2cDzW+LQc3q0a5nrp7vYOWJ8jZiXDiJ4nSbJdLW+KyNKaFtNw+5wjOxjeetnoz5Wshwovk9n38jrqSL881SMcx/xybEdjBXZp2H1sRAa6w6SjK8s5Oj6fFrwjYibEu7j16HoSmuO5Q9YGBspSf5RnvimhEjKf7X6F0cU1K3EhuhyLpfa0MgT3dlzR5F1hWmRQ9Ndoskish9COk7L3qFQVLdl7pl38tUnk4iIN2LQUEASEYotDSoCROurfv+rBO3d5fVCRyS/nU0x8XbmgfYHK5mw4hFXX63lx3c1Xb+xnaY5pJDt9FDRtY+0/JKKiPeLTM6TYkzp1vXO5/TEI+9UL+XaXdKjljwGMrwtLjxTmWBE4wjrOU1ORhU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39850400004)(376002)(346002)(52116002)(66946007)(38100700002)(53546011)(2616005)(186003)(83380400001)(16526019)(4326008)(316002)(54906003)(110136005)(478600001)(8676002)(6486002)(5660300002)(36756003)(6666004)(66574015)(86362001)(8936002)(31696002)(66476007)(31686004)(2906002)(66556008)(30864003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bnRZTTRzYlM0MVRNMHJDa1JRRGFWWitheXNIZVExRDZjRTdQK2xLNTUrKzZL?=
 =?utf-8?B?UzYzMWlyMVFOK3lQdDZIOG01ekJwbHJ1QzU0TzN4N1J5cGJNVjVlM3NxSkIv?=
 =?utf-8?B?Z2VZSFJDUUFEV0wxTEpnZHB6RTZFZWZpYkVhK2VSUEZKdnNjS2FVdHVWTjB4?=
 =?utf-8?B?ekx4NkpuQSt6aEN2dmFqQ3c3OFlkZFVoRkpjSW53cU52Q1hWck1ORmtFSS9x?=
 =?utf-8?B?NFBHalROWi9aYWZldHJJaE10cVpnQzFrVUZHY1NxYXd0LytEV1gzVi9nQkZR?=
 =?utf-8?B?d0xKNFhVWkxRKzRHd1hDckNJa3JtS3AzOUVBZHcxZ2dlUnM4czRRbWJNU1R4?=
 =?utf-8?B?VDNlSUtZZFJQL1RYRDh2TGJxMWpzOXptaUFxNmFHak9KRFQ0RUE1UjdvbjVi?=
 =?utf-8?B?bXJuN2k5ZWlsbUY0OFV6emNrck9NL3pVdHNkMEpWTU9zVWUvaVBMSGtnU0s1?=
 =?utf-8?B?dXRzNnNUWU0zc2RJZ2RzdXpiK1V0ZWhoanlwWWJKblh5UTdzM2kzcDVhclZZ?=
 =?utf-8?B?WjJJdTdkdVg0eC9MeEJyTnBSeGprUFZIUmlsU29JY1NyZlZzMStrQzFXekVY?=
 =?utf-8?B?Q096S0xoV1JYYWRNVU9lakxBam5IMHA4SDdCOGVCbEN2a1p5MGFRUGhQTG9i?=
 =?utf-8?B?bE5kVDVINXJCTXBsM2lERzdwSk9QN2lWQTMwNHdzYkVpTDlmZ2kzcS96dUJa?=
 =?utf-8?B?dHB0Uk1PMVp1RDJ6QXRHc3FLQlB0S3dLOGVYSGdMWEVUVzV4SWJZM2hUTDVt?=
 =?utf-8?B?UUtmNXJ4QjdOVjFPWjNkN0xxQmd2ZEkvRGx6ZWJRV2VYQXJmM3ZmWm1QNjUy?=
 =?utf-8?B?Szg4eHhNSUVIQVBiak5RbldiRGJiQXg2dTZUY1pYQmhQWmY2dCtyVkd1R093?=
 =?utf-8?B?M0FHdGFnVnF5UnM2T3FHM1NMT3RkTjV1NnNhNkdQNXYvMXRtcE9wbWY1WVVP?=
 =?utf-8?B?c0NwTnkvR2piZWYwNDF1c05scXRqNFFWUTJSanA1dnJ2ei8rUXRMSXNnRmcw?=
 =?utf-8?B?cVNrQkFDWDB1NW51TWd4cTB3OFdaUlFTdml3UjdINklzalJMd29scm96NWph?=
 =?utf-8?B?TmJsYmJmRS84ZTNrS3BReGJ3cUJCakd1UGdYdFlKZ0NQeUoya2tkOGE2aHU4?=
 =?utf-8?B?UENFR3QyRUI1MUdPNVVVVEk2alFOS1JUc1F3SXlFVGlrQ1huTDMrYVh0cklW?=
 =?utf-8?B?K0QwSTk5QytVZlFCR3lXTTV5UER5KzBlSnhiSjFOTXR0dDFmenYveDNWM3Jr?=
 =?utf-8?B?Yno5ZnB0TnJ0UjN6L3RjK3ZRV1hLb0txRk5neTU1ek1TaGVzM1Z6Q0QwdlVk?=
 =?utf-8?B?K1o5WXdWVCtGWjJCMWxOZU5GRUVraGJYNkZHVVFaWDIwZnRMdVgrS3pPVkpX?=
 =?utf-8?B?eUFzQW0zN1h3VkxPUFZLclUvMnVVWTNVZ0FtOS9zRVUrTGI1Sml2T1RWdlZM?=
 =?utf-8?B?ZFowcHhodS9zOVlkWVM1R0NnTXpaS0hVYmJQUmlveUZaWTBkdTBJanBzSjBh?=
 =?utf-8?B?dEJxZUQ4aVFBKzNQQ0VKZ1FOdTlRdnVLV1pOeUZuTVFHSHBvUXVXZENmQ0JZ?=
 =?utf-8?B?cnNwS1VoMk9JVVlBNUpTdTFURFo5dkVVV1p6NUt0dXhxUmo3VVRTS0lFcHhI?=
 =?utf-8?B?Nm53aDlEMkZLQ3UzZkIyUFFLeEFUQjBRM2Y3ZUQva3BJVzZtSGFvQTFUSVZR?=
 =?utf-8?B?WmxjU2UwSTN0ZUdOb21vMGFtS09CVkFWMkl0S3M2V1pZL3FjMW1FVkdVME5G?=
 =?utf-8?B?TEc5Rm80WXVLWndDYXhtYVpFeENFWjFJMTlWNGtLQ2JhMDJuY0RrcStkd1dw?=
 =?utf-8?B?WmFCN0ZaRXhuNXJhVi9nNFNTUDlNaXl2eGZNRDdBYkJERnVjWG1KN3FNeHh4?=
 =?utf-8?Q?ydV8e4vYESbXi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18230f5-c982-480b-bcae-08d920fbbfff
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 10:39:48.2612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BReqswFDsOaGKl+bUTqDvlwVsw+wWmOMKgzFoYlhEcGGQuTRDyDd+R2hNEC0J6CT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4898
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.05.21 um 12:19 schrieb Daniel Vetter:
> On Wed, May 26, 2021 at 11:32:49PM -0500, Jason Ekstrand wrote:
>> On May 26, 2021 13:15:08 Daniel Stone <daniel@fooishbar.org> wrote:
>>
>>> Hey,
>>>
>>> On Wed, 26 May 2021 at 16:24, Jason Ekstrand <jason@jlekstrand.net> wrote:
>>>> On Wed, May 26, 2021 at 6:09 AM Daniel Stone <daniel@fooishbar.org> wrote:
>>>>> Typing out the Wayland protocol isn't the hard bit. If we just need to
>>>>> copy and sed syncobj to weirdsyncobj, no problem really, and it gives
>>>>> us a six-month head start on painful compositor-internal surgery
>>>>> whilst we work on common infrastructure to ship userspace fences
>>>>> around (mappable dmabuf with the sync bracketing? FD where every
>>>>> read() gives you the current value? memfd? other?).
>>>> I feel like I should elaborate more about timelines.  In my earlier
>>>> reply, my commentary about timeline syncobj was mostly focused around
>>>> helping people avoid typing.  That's not really the full story,
>>>> though, and I hope more context will help.
>>>>
>>>> First, let me say that timeline syncobj was designed as a mechanism to
>>>> implement VK_KHR_timeline_semaphore without inserting future fences
>>>> into the kernel.  It's entirely designed around the needs of Vulkan
>>>> drivers, not really as a window-system primitive.  The semantics are
>>>> designed around one driver communicating to another that new fences
>>>> have been added and it's safe to kick off more rendering.  I'm not
>>>> convinced that it's the right object for window-systems and I'm also
>>>> not convinced that it's a good idea to try and make a version of it
>>>> that's a wrapper around a userspace memory fence.  (I'm going to start
>>>> typing UMF for userspace memory fence because it's long to type out.)
>>>>
>>>> Why?  Well, the fundamental problem with timelines in general is
>>>> trying to figure out when it's about to be done.  But timeline syncobj
>>>> solves this for us!  It gives us this fancy super-useful ioctl!
>>>> Right?  Uh.... not as well as I'd like.  Let's say we make a timeline
>>>> syncobj that's a wrapper around a userspace memory fence.  What do we
>>>> do with that ioctl?  As I mentioned above, the kernel doesn't have any
>>>> clue when it will be triggered so that ioctl turns into an actual
>>>> wait.  That's no good because it creates unnecessary stalls.
>>> Yeah, I'm assuming that UMF will be a separate primitive. No problem.
>>> I also think that your submitted/completed thing is a non-problem: at
>>> this stage we're just throwing up our hands and admitting that we're
>>> letting userspace tie itself in knots, and giving it the tools to tie
>>> a sufficiently un-streetwise compositor in knots too. We're already
>>> crossing that Rubicon, so let's just embrace it and not try to design
>>> it out. Us compositors can handle the scheduling, really.
>> Ok, good. I think we're on the same page.
>>
>>>> There's another potential solution here:  Have each UMF be two
>>>> timelines: submitted and completed.  At the start of every batch
>>>> that's supposed to trigger a UMF, we set the "submitted" side and
>>>> then, when it completes, we set the "completed" side.  Ok, great, now
>>>> we can get at the "about to be done" with the submitted side,
>>>> implement the ioctl, and we're all good, right?  Sadly, no.  There's
>>>> no guarantee about how long a "batch" takes.  So there's no universal
>>>> timeout the kernel can apply.  Also, if it does time out, the kernel
>>>> doesn't know who to blame for the timeout and how to prevent itself
>>>> from getting in trouble again.  The compositor does so, in theory,
>>>> given the right ioctls, it could detect the -ETIME and kill that
>>>> client.  Not a great solution.
>>>>
>>>> The best option I've been able to come up with for this is some sort
>>>> of client-provided signal.  Something where it says, as part of submit
>>>> or somewhere else, "I promise I'll be done soon" where that promise
>>>> comes with dire consequences if it's not.  At that point, we can turn
>>>> the UMF and a particular wait value into a one-shot fence like a
>>>> dma_fence or sync_file, or signal a syncobj on it.  If it ever times
>>>> out, we kick their context.  In Vulkan terminology, they get
>>>> VK_ERROR_DEVICE_LOST.  There are two important bits here:  First, is
>>>> that it's based on a client-provided thing.  With a fully timeline
>>>> model and wait-before-signal, we can't infer when something is about
>>>> to be done.  Only the client knows when it submitted its last node in
>>>> the dependency graph and the whole mess is unblocked.  Second, is that
>>>> the dma_fence is created within the client's driver context.  If it's
>>>> created compositor-side, the kernel doesn't know who to blame if
>>>> things go badly.  If we create it in the client, it's pretty easy to
>>>> make context death on -ETIME part of the contract.
>>>>
>>>> (Before danvet jumps in here and rants about how UMF -> dma_fence
>>>> isn't possible, I haven't forgotten.  I'm pretending, for now, that
>>>> we've solved some of those problems.)
>>> Funny how we've come full circle to the original proposal here ...
>>>
>>> If we really want a kernel primitive for this - and I think it's a
>>> good idea, since can help surface 'badness' in a way which is
>>> observable by e.g. session managers in a way analogous to cgroup stats
>>> and controls - how about this for a counter-proposal? Client exports a
>>> FD for its context/queue and sends it to winsys as part of setup,
>>> compositor can ioctl() on that to kill it, which lands in the same
>>> zap/zap/zap/zap/ban codepath as GPU hangs do today. It's a bigger
>>> hammer than per-sync-point primitives, but you as a client have to
>>> accept the social contract that if you want to participate in a
>>> session, your context has to be making forward progress and you aren't
>>> writing cheques the compositor can't cash.
>> The compositor already has that. It can kick the client's Wayland protocol
>> connection. Banning the context from the kernel might be nice too but
>> kicking it is probably sufficient.
>>
>> Side-note to danvet: Do we need a plan for UMF with persistent contexts? My
>> gut says that's a very bad idea but this made me think I should say least
>> pose the question.
> Yeah UMF ctx mode needs to require non-persisten ctx mode too or it just
> goes horribly wrong everywhere.
>
>>> I'm also going to pre-emptively agree with other-Dan; I'm extremely
>>> wary of anything which tries to make UMF look even a little bit like
>>> sync_file. The requirements to support them are so wildly different
>>> that I'd almost rather a totally orthogonal interface so that there's
>>> no danger of confusing the two. Us sophisticates on this thread can
>>> eat the mild annoyance of typing out separate codepaths, but it's much
>>> worse for anyone else who may look at a UMF wolf in dma_fence sheep's
>>> clothing then only later be substantially more annoyed when they
>>> realise that it's not anything like they thought it was.
>>>
>>> So let's keep sync_file for what it is, and for UMF since the usage is
>>> so radically different, build out whatever we do around making the
>>> uAPI as useful as possible for what we want to do with it. The real
>>> complexity in handling the difference between UMF and 'real' fences is
>>> in how they behave, not in how they look.
>> Sounds good.
>>
>>>> Another option is to just stall on the UMF until it's done.  Yeah,
>>>> kind-of terrible and high-latency, but it always works and doesn't
>>>> involve any complex logic to kill clients.  If a client never gets
>>>> around to signaling a fence, it just never repaints.  The compositor
>>>> keeps going like nothing's wrong.  Maybe, if the client submits lots
>>>> of frames without ever triggering, it'll hit some max queue depth
>>>> somewhere and kill it but that's it.  More likely, the client's
>>>> vkAcquireNextImage will start timing out and it'll crash.
>>>>
>>>> I suspect where we might actually land is some combination of the two
>>>> depending on client choice.  If the client wants to be dumb, it gets
>>>> the high-latency always-works path.  If the client really wants
>>>> lowest-latency VRR, it has to take the smarter path and risk
>>>> VK_ERROR_DEVICE_LOST if it misses too far.
>>> We already have to handle unresponsive clients. If your browser
>>> livelocks today (say because it's Chrome and you hotunplug your
>>> monitor at the wrong time with active media playback in an inactive
>>> tab in an inactive window ... hypothetically),
>> That's an oddly specific hypothetical...
>>
>>> yourr Wayland server
>>> notices that it isn't responding to pings, throws up the 'do you want
>>> to force-quit?' dialog and kills the client; it's actually really
>>> simple logic. So we just hook unsignaled fences up to the same. (And,
>>> if we have the context-kill primitive, trigger that on our way out.)
>>>
>>> So yeah, we already have all the complexity points to put particular
>>> surface trees in limbo (thanks to subsurface sync mode), we already
>>> have all the complexity points to separate realised surface trees from
>>> pixels on screen, and we already have the complexity points for
>>> different parts of the surface trees being rendered at different
>>> times. Checking on fence progression is just a little more typing
>>> around those interface points which already exist, and zapping clients
>>> is utterly trivial.
>> 👍
>>
>>>> But the point of all of this is, neither of the above two paths have
>>>> anything to do with the compositor calling a "wait for submit" ioctl.
>>>> Building a design around that and baking it into protocol is, IMO, a
>>>> mistake.  I don't see any valid way to handle this mess without "wait
>>>> for sumbit" either not existing or existing only client-side for the
>>>> purposes of WSI.
>>> I'm still on the fence (sorry) about a wait-before-submit ioctl. For
>>> the sync_file-based timeline syncobjs that we have today, yes it is
>>> helpful, and we do already have it, it's just the wrong shape in being
>>> sleep rather than epoll.
>> I still don't see why we're still talking about timeline syncobj...
>>
>>> For UMF, taking it as a given that the kernel really has no visibility
>>> at all into syncpoint progress, then the kernel is conceptually a
>>> worse place to spin-sleep than userspace is, because why account the
>>> CPU burn to a kthread rather than a real PID, and lose
>>> latency/efficiency on context switches when you do wake up?
>>>
>>> But also, the kernel is conceptually the best place to spin-sleep,
>>> because it can fuse waits and do better wakeup quantisation than
>>> userspace can. And I'm still hopeful that the IHVs and Windows can
>>> both step away from the postmodern 'synchronisation doesn't mean
>>> anything anymore, just poll in a lap-burning loop' approach that we've
>>> been presented (sorry) with, where we at least get doorbells which
>>> allow the kernel to do polling much smarter than quantising timers
>>> ('this fence might not have triggered yet, but _something_ happened
>>> which might have triggered it so why not check?').
>> I think we can and do do something better than just poll on the memory. I'm
>> not sure on the details but I've been told that we can set some sort of
>> interrupt-like thing on the address so it's not actually a spin. Even
>> without that, done hardware has some way that a command buffer can trigger
>> an interrupt. If the protocol is to write memory and then trigger an
>> interrupt rather than just write memory, that gives us something if a
>> doorbell. Not as convenient, maybe, but it'd help with power consumption,
>> etc.
> Spoiler but the i915 plan is to indeed suck less than cpu spinning on
> memory. The icky part is converting this into a protocol that can be used
> across processes and stuff like that.

Yeah, same here. Basically the hardware now gives you the information 
where something was written in the fence interrupt vector.

With that information you can then figure out in the driver if anybody 
is waiting for that memory location and stop the sleeping etc...

Christian.

> -Daniel
>
>> --Jason
>>
>>> On the other other hand, the only winsys case for burning poll in a
>>> tight loop is flipping as quickly as possible straight to a VRR
>>> display. In that case, you're definitely running on mains power so
>>> you're just melting the polar ice caps rather than your lap, and
>>> you've got everything fully lit up anyway so the power cost of polling
>>> is immaterial. For FRR, the compositor already has a fixed deadline at
>>> which it will wake up and make a hard binding decision about which
>>> image to present - this includes XR as well. So we don't have to worry
>>> about optimising a polling loop, because there isn't one: we wake up
>>> once, we check once, and if the client's missed then too bad, try
>>> again next frame.
>>>
>>> As you can see, much like userspace memory fences, my position on
>>> which way to go here is not knowable upfront, and depends on when
>>> exactly you observe it. Hopefully someone can come back with an
>>> argument compelling enough either way that I have something better to
>>> do than to try to pun my way out of having more hands than Ganesh. I
>>> don't think it's material to the design or implementation of winsys
>>> support though.
>>>
>>> Cheers,
>>> Daniel

