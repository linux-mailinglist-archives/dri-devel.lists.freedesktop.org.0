Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BCE325347
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 17:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C9C6ECBC;
	Thu, 25 Feb 2021 16:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1466ECB8;
 Thu, 25 Feb 2021 16:12:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9NrvuVDZk7uUVDYFHl9s3HfR9yYfzx+C8FdBofZqbNLYGGkAsNb02gdoNrPf8kPC70etAAbAZJtqECEhHpoPnTv2jPKstXJnQkJuERLGvxKMf3BU7CBPry9eU1HjmCpdAtULovEXkyCS+5XW1m4gcTOxc6g2qPVqUVLn2QzV/hUk0wSzmPF8GwJyAbzpq6hguGzLrwNU4U4Ynw0s3fUemtCvScvivwHU5Q5QPcIoGOuiDtqVtsr6/huCYf3eYUqSFdRwCaI7DNsSFdot87jlDTKjM7vGTQpSN+WV7cAF8vOMT+J6LFFby1cPA2WtH3pMrnKDDcsJTwRlfD/JpyVig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Phc+xWeF/8HzsmQiux6H7QjLTQWRQaYLpa/NdT/VZEs=;
 b=PswpvdqPm5hiEfPL6HBmh1cEky54PHRuvNeWSH1AVij6QjzLJ2kO6c2k8MsrJJ8iJRYPXAj2kpfcu4xtYoOHTdn+iI2Y3HFgGjP5paserZ6113QX6gfeq4NP6IVfQcMBcPUU82dfmqIpgUWd3Gy4ZmU1gNVjIHKF9dj41zlXERkCtSRn2URV4V7ODi62silGR1ynDKvUuOPf0kfszE4ymBhC69U7BWW5o1kEvMXS5n+I9Mq5wKkB4BDSDIanM4XlVOG1xO9AW/Erz6I09gp0YFalaxEbuMMnpFRX0fQAW/fbJulOsKt1ntkLo/ll45LIV0Yyamkf1sNUEY5UI3zzXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Phc+xWeF/8HzsmQiux6H7QjLTQWRQaYLpa/NdT/VZEs=;
 b=CytLQ7UwLDyXHImWhGg1py2gYBa/rZRHTFuZDbzeLNNuKwHhmsZblDt3d+cfkJIwME5TRuNWLkaYvof/HAUZPWsjFX1Cvm7N7ft90EEIynE0sLgSy4CW+t73ZqpFVbafbLOgs62Ikjn6nPvRdl/1t3rWvOjQt6wf73LOrt9X2co=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4615.namprd12.prod.outlook.com (2603:10b6:a03:96::21)
 by BYAPR12MB2645.namprd12.prod.outlook.com (2603:10b6:a03:61::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Thu, 25 Feb
 2021 16:12:33 +0000
Received: from BYAPR12MB4615.namprd12.prod.outlook.com
 ([fe80::5cbd:c5a8:779:9672]) by BYAPR12MB4615.namprd12.prod.outlook.com
 ([fe80::5cbd:c5a8:779:9672%7]) with mapi id 15.20.3868.033; Thu, 25 Feb 2021
 16:12:33 +0000
Subject: Re: [PATCH v4 00/14] RFC Support hot device unplug in amdgpu
To: Daniel Vetter <daniel@ffwll.ch>
References: <YAfyPEB2gpMnW/PP@phenom.ffwll.local>
 <8ea4b2d7-d5f3-3708-724d-c70520603283@amd.com>
 <CAKMK7uE11MonjPB3dmy6u=b029am1p2KqJ57DgLUGu-9QgtebA@mail.gmail.com>
 <75e782f1-4cb9-9210-87d2-e7d2a76782f1@amd.com>
 <CAKMK7uH=ycuBQ5qbujA8kwcrExAC4YAM26W-7wJjE7RS4zPiHw@mail.gmail.com>
 <6152bf16-6086-17f5-4157-c9be0ef84155@amd.com>
 <YCJa2HraImprr4Ew@phenom.ffwll.local>
 <871a02d8-e776-dd37-bd25-3169f8167923@amd.com>
 <CAKMK7uEKERRmQRfngkO_1yfi6kHJjarJncFm3eZ1Uxcf9pNWGg@mail.gmail.com>
 <c8666ac8-e7b4-59e1-dac7-a10d77aeb9ff@amd.com>
 <YDd7LkMw+S4obnFe@phenom.ffwll.local>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <cd96a04e-8ecc-c376-0ec3-d556941048b8@amd.com>
Date: Thu, 25 Feb 2021 11:12:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <YDd7LkMw+S4obnFe@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:4771:7d48:3bd5:98a]
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BYAPR12MB4615.namprd12.prod.outlook.com
 (2603:10b6:a03:96::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:4771:7d48:3bd5:98a]
 (2607:fea8:3edf:49b0:4771:7d48:3bd5:98a) by
 YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.29 via Frontend Transport; Thu, 25 Feb 2021 16:12:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d56d8556-18a2-43d5-8f52-08d8d9a82866
X-MS-TrafficTypeDiagnostic: BYAPR12MB2645:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB2645720AF1E74A47B05949E8EA9E9@BYAPR12MB2645.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7R5k/GRU7Ss09I+QcHn/dAQ+CljrX/HYYjShSaaQGqhfdpDp1z/uYo93sLAe3XEJZdT7NyR05uZvLv9UpMAg2+bYHLHMWzATz3/2p74WMytoCVKQF3/mvFEpigKsWPFIqcj76Org+DYSrZudNc9WXtqvHIVRCtA07oyE3rmEY4ka3daWDRIgX9xdOPlecIboR1SSH4NE9JlEncoScJXTTU/U1f12JBvnlKrDGx5oV+x9vdq8L5eutLAr9Pk3Zf6NJGtUO7iqTfJ7+8jyISfbeSjqv30Fn0hI+AtDvfg1qGJpSSAEcBPsOVytIgfy9A0ThpWlF2/QixGh81F+Em7uEWy4sJNL+KJwQDHn2nG3HNPGjcqGapcSI38RvEaKs8WfenIuuq54wesdzcjR/Zr3w0tDUpSwH0Laf767IAi6HT0v0JmzghDDa+u8qja+bOKDTcecpwWryC+IpWFjEjQdDVJszkp5YSkLewtdYzAZkYhXpIrF4E8P+Lpl//bkIBSI5zAFJZSO4UmLZ8kFLdiOJFG70NNnPTKFF/WgThFfYM89ES7xyV34VWpGCt2lAIaHBIVB/He329ISxpT6yyeU4jHsbuOcOPjAyRq5LSKcxJ1gIypqJtOaLzQGgqjZb3TAsX4cTAZSG68Ch9TENPW/fLEZ4g+2yeQWavbUoE4SvrDRNUUToF3ir4fiDQZf1laj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(8936002)(52116002)(6486002)(2906002)(16526019)(5660300002)(966005)(53546011)(8676002)(86362001)(7416002)(478600001)(45080400002)(6916009)(36756003)(31696002)(316002)(186003)(66556008)(31686004)(2616005)(66946007)(4326008)(66476007)(44832011)(54906003)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MDc0blU3SjE1bEJPK2JOVU0wVUlCbnMvemFPc3l3Tm9ucU1jREhrVS9HK1cv?=
 =?utf-8?B?Rkg2MkxEU1dHT0xpK0Rqam9xS0o2VFdCaUhrNHNvR3E0dEhjcjdPNTRzUk5Y?=
 =?utf-8?B?MFJBY3BLUkE5ZmlGcnRSSG5PWFVvSmJWcFA0a3JVblZqdVhGQkNpMWppZ3ZN?=
 =?utf-8?B?UlpyZHBTcFZJNm12ZkhSWmFMZHliL2hWbGZHUW5QWVluV1NSQzB6TVR3WGhD?=
 =?utf-8?B?Y0E5YmxpcTFNSEFndEhDYzFsdHRnOFNSTm1zWlBybmt3SC9QVXI5VUVVYVF3?=
 =?utf-8?B?dkFuV3ZiZUxZMUV2L0hJMjN1SEFBbFcycFdtZjlONHFWWTFKQmMxSk55NzI3?=
 =?utf-8?B?U0pGR2NoMTBQZVVFSGx0NklnZmhiZnFyNng3ejA5S21aYktjdkgxeHVNMnNy?=
 =?utf-8?B?SXBZSGs5S3VESGljY3pjVWQzdEpSbXdlOHI3K1hrN1NFei9MdHFUVnR5cnAx?=
 =?utf-8?B?b29FY1h2L1E4cTJwQ1lYelVKNjBmN2JoUC9NdjlXaFdVU1k5WVZRQmlieVh5?=
 =?utf-8?B?QzlsSXZCUGM0dEZhMHB6Q2xvUE0wSGlUWmFiei9HcGlLYkIxQjlLTXFzVWFp?=
 =?utf-8?B?K1NkYm1tTVZkd2xqUXM2dkMvdkNNcFZ5aXVGYmg3TmNRckFramlOQjBrYkNh?=
 =?utf-8?B?dk13c1l1QmFza0JRbUlmb2JMNWhmK20zemtudElZdXFJZmtSL3l2ajQrdGor?=
 =?utf-8?B?Z2gvMmtsYjU3b0xLbGRyZVQ2VGZnTWZTUk11ZlNJc0ZWREY5cytkZzJsSmVn?=
 =?utf-8?B?VG8yb21EcVBUK2FMN21KaUdvOUlGRCtHSWwrOU5aVHhjL3pkWnVMSTFTVkky?=
 =?utf-8?B?Q3hxUUY2Z25iZVBXMEdJQy9ULzU1WHdpN1B6TmQzdUV1V1VhZi9EUEt0RlBE?=
 =?utf-8?B?Q2lYSGMvUldab05LaEd0cU5Bd0VqRk9VVVhYMjdIYkthN3cvZkdkZUxBdmUx?=
 =?utf-8?B?b2FFc0QzVEpxUVV6elBlTU14UFMxQVJIQXJHK3M2Uzd0Q1BtampXcGpRWFF4?=
 =?utf-8?B?SE9IY0p2UW5PT0NFTFc0YnZqeUp1em4wRmlYMzlhUE5MTDdCalNESEVvMmdJ?=
 =?utf-8?B?N1owUFF3c2NOVm41ZEIvYTVpWHFMNWZCWGhGWmc3NmRwbldRUHkxL3MxTGM1?=
 =?utf-8?B?a2JKWk1Gd09wcHlRelZ4cU44cWRwSTBKcFRxM3h1YnB0ZUYyaTNyOC9WbitM?=
 =?utf-8?B?dWlINEFWN0hHbGhFNDBPbjdOOGdmU2QrN3dhZ0FjL1VsbGdlOWxMcG5hQU84?=
 =?utf-8?B?cWF5TE1VajVkVFZrTkNieURQN1hUNnI0MHNkZjlCYXVNNG1qa2IyelZ1bFBn?=
 =?utf-8?B?MVQreVBGWENXSVhlbjBFeU92ZDJEQWRpZnordlJsNXhlVUp4RlY1QzhnVEVt?=
 =?utf-8?B?aXl1aGovY1hONm5IaVJCOGdxRG05Vi8yUUpFUEJwc3EzUzRQMkFWc2JMYys3?=
 =?utf-8?B?VGRRNjJKTGgzMHFTeDllWmhLa0l5bThTS3BGQVJzRnloZjFpbWFmNXV4QS9z?=
 =?utf-8?B?R25MT0VtZnI2L01QYmtub2Vma1E2L2dhem14RDNjZnhhQXRHWFFZakhlQnUy?=
 =?utf-8?B?MjJONkFYVUhELzNTNjlFUElqb3kyNE9qZm9Jdk1SNUhTOG1oNjF5L1NGVnhR?=
 =?utf-8?B?cWRDSHY5cDFUbVR3d09iZXpGcTcxMlpHbU1KS1ZEOW9kaGpwcTdwa0oydXV6?=
 =?utf-8?B?bXM5bW52UC9xTEhMVXdWenM2Y2xnNzZ1YytKOUFDMHpqNDlzSmxxSFFJMUsv?=
 =?utf-8?B?S1VIUk5PSW16S2NMZmhaaGZWSTlXSHI3emtyVGNyR0F2bHBjL3hvSi9WU3NI?=
 =?utf-8?B?TG54KzA5Q1k2TW5TYlNBN21UNG1DTGkxU05qaHMwNUllR01MUUFmaWN6WUt1?=
 =?utf-8?Q?IqYFqkKi5D/Uq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d56d8556-18a2-43d5-8f52-08d8d9a82866
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 16:12:33.0417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EzbY2g7f2me+0UCkq2M98uQyP6EFfFXlHctPuM5n2OTKCHhpnFBmrJKx8dntKhbf8Giw7B7PudsU5iQ8yl81OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2645
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <Alexander.Deucher@amd.com>,
 Qiang Yu <yuq825@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021-02-25 5:25 a.m., Daniel Vetter wrote:
> On Wed, Feb 24, 2021 at 11:30:50AM -0500, Andrey Grodzovsky wrote:
>> On 2021-02-19 5:24 a.m., Daniel Vetter wrote:
>>> On Thu, Feb 18, 2021 at 9:03 PM Andrey Grodzovsky
>>> <Andrey.Grodzovsky@amd.com> wrote:
>>>> Looked a bit into it, I want to export sync_object to FD and import  from that FD
>>>> such that I will wait on the imported sync object handle from one thread while
>>>> signaling the exported sync object handle from another (post device unplug) ?
>>>>
>>>> My problem is how to create a sync object with a non signaled 'fake' fence ?
>>>> I only see API that creates it with already signaled fence (or none) -
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Flatest%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Fdrm_syncobj.c%23L56&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Cc6828a032b80464fc0f008d8d977bc32%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637498455582209331%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Izca%2BYNliCefXqAgOIX%2Bs3XQ1vWVGXbfAh28B%2F51blQ%3D&amp;reserved=0
>>>>
>>>> P.S I expect the kernel to crash since unlike with dma_bufs we don't hold
>>>> drm device reference here on export.
>>> Well maybe there's no crash. I think if you go through all your
>>> dma_fence that you have and force-complete them, then I think external
>>> callers wont go into the driver anymore. But there's still pointers
>>> potentially pointing at your device struct and all that, but should
>>> work. Still needs some audit ofc.
>>>
>>> Wrt how you get such a free-standing fence, that's amdgpu specific. Roughly
>>> - submit cs
>>> - get the fence for that (either sync_file, but I don't think amdgpu
>>> supports that, or maybe through drm_syncobj)
>>> - hotunplug
>>> - wait on that fence somehow (drm_syncobj has direct uapi for this,
>>> same for sync_file I think)
>>>
>>> Cheers, Daniel
>>
>> Indeed worked fine, did with 2 devices. Since syncobj is refcounted, even
>> after I
>> destroyed the original syncobj and unplugged the device, the exported
>> syncobj and the
>> fence inside didn't go anywhere.
>>
>> See my 3 tests in my branch on Gitlab
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fagrodzov%2Figt-gpu-tools%2F-%2Fcommits%2Fmaster&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Cc6828a032b80464fc0f008d8d977bc32%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637498455582209331%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=IvoCIggDUV3EgDqOhrJokWei%2B6byg%2Be9cfaJel9y2RY%3D&amp;reserved=0
>> and let me know if I should go ahead and do a merge request (into which
>> target project/branch ?) or you
>> have more comments.
> igt still works with patch submission.
> -Daniel


I see, Need to divert to other work for a while, will get to it once I 
am back to device unplug.

Andrey


>
>> Andrey
>>
>>
>>>> Andrey
>>>>
>>>> On 2/9/21 4:50 AM, Daniel Vetter wrote:
>>>>> Yeah in the end we'd need 2 hw devices for testing full fence
>>>>> functionality. A useful intermediate step would be to just export the
>>>>> fence (either as sync_file, which I think amdgpu doesn't support because
>>>>> no android egl support in mesa) or drm_syncobj (which you can do as
>>>>> standalone fd too iirc), and then just using the fence a bit from
>>>>> userspace (like wait on it or get its status) after the device is
>>>>> unplugged.
>>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
