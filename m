Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AE3782B2A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 16:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E030710E0D5;
	Mon, 21 Aug 2023 14:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BA710E0D5;
 Mon, 21 Aug 2023 14:07:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CN90cV86hHdBX2FoMONufB6tMvPJWFzhe9VVSHTd6pcgAGkEhSokL6gxYgzttmbzpCHqI2ptvz9Y3h8BTq5AkIj5jUDngR9wZVMXT7FHZMZ1HvW+QFuAWglDVEzcmdW+WI50YBsLJgF4anrolp8Ne9afwENj/yN7JB7YXNyuaTwAuvzsrOMZQWfdwbS+abQPtwYrXi9gwKEvAw8+XjJwTAW0FO0t4/YbC8lveqBUGRf6BKpxm+mxl8kvSuYrOtYpcTVs+BUWWI96+7fzRFb5o2uuh15jqJ7sUDuKbbkg4i8iaxT+FZOjaunNEXSBAnk1TlmjHpOYUbLIFAt/WeFH/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppPe01eVihx50SxJa6+B2nCGSPe1fa48SmeCJWg0MpQ=;
 b=Pn2cLHqEMEsX69mKDG7ijuWQNmBSFm5i4qBcdsngQnU6o4d5/FHu3/FTMtS4n/iCjFYTUfhzODxc1nSvwr1VmL8ysmYkWiD99ism+ZxI7irsOs2o9nkcV4a2dbWwfM4/0iRuaXdubTWsFIswQrU9hub8WP2CvHRQ4pIJa6ExBmZR9xmHyd5OyKL8StLyH046hDzEW4sIW+TTXYtwxqJFp01uBIKmB1ZjwYkPzaEKUFhZ4yOI2FA24HflfraKnximwwHjwA1dT42C/M0mrDUnF9twXcTNt1ksr5Av/vcML/QG/KxnXiblZZTQmADx1CGD9Ydow+Fr9459mnbC0dAg0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppPe01eVihx50SxJa6+B2nCGSPe1fa48SmeCJWg0MpQ=;
 b=U8PwTNZo+2nL1kM1yq/A5Irj6Bjxtic8JIR+UoRXhbZRHvgkln5pdt9x22Q4XkVZhMWe3tZDN3r0ritCxwF6mXtGDxeHooHn8Mwb8iMPBRHJr3sftMkSgBby/LFF6OuRUmiJvO7At7+Sr1ofIq5MbYH0APyISn1oYSy1oooKGCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV8PR12MB9136.namprd12.prod.outlook.com (2603:10b6:408:18e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 14:07:32 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 14:07:30 +0000
Message-ID: <1820cb54-5f1e-d2e6-38fa-7161465ed061@amd.com>
Date: Mon, 21 Aug 2023 16:07:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
 <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
 <982800c1-e7d3-f276-51d0-1a431f92eacb@amd.com>
 <5fdf7d59-3323-24b5-a35a-bd60b06b4ce5@redhat.com>
 <0bf839df-db7f-41fa-8b34-59792d2ba8be@amd.com>
 <e8fa305a-0ac8-ece7-efeb-f9cec2892d44@redhat.com>
 <ef4d2c78-6927-3d3b-7aac-27d013af7ea6@amd.com>
 <a80be2c1-132e-5ee1-4278-47655916494a@redhat.com>
 <0d5af79a-ba3a-d4be-938f-81627db65b50@amd.com>
 <a3937c17-eaa5-e0e9-e0ac-1610e0652982@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <a3937c17-eaa5-e0e9-e0ac-1610e0652982@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV8PR12MB9136:EE_
X-MS-Office365-Filtering-Correlation-Id: 9366ad1f-7373-4e0d-80ae-08dba24ff546
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NlJuUiS8lrzyuCVkXFytYu69ZWu6cPFlWa1dOcakj5gQO6hxlSWJuYr0cKihin1sebOCiaAy6hoS+8aj0KOl2nKwUC5jtYLlmR/P5paHrg5WmwIPFAODyQMHOqXr5jxn6lUMmbaaEzkBktALNEDCthIM9ELelQVjpOGqmoOThO4kQFxmZIYOd36Dip0/zpawFhrZlPlVD+Y9dpVN2YMk1dNX/Tc9r73gByzF4b2mEHN+Ghzf1GH23JPAPXAWNu4H2WDkII9Msaxw5Is6YO0OiN3I16DuOqGJMhwXV0niCORj0Gt4Z9UVJd2SnuiqQ07mmp6D3I5kQnD/878P9zBcvX856UA1Pl2uKSlf4uZpE32uiM8e7njxGWxoq9PcE/usGsM/hCpN7zy6PeoNxG+DFeCHEtrGG8BS3kFM84vrr7NeJa9KO3Vz2UUkBOCIX9lz+QMA8ZFNJ7tbw6Pk7WbzEwUhycSarVtsZ991SW0CEf+sIM9E+tSRqq6ZBSG0QAIzWiTyFdIClk2Buzbl6GX+OunLFFMBT8FXvzoSqqXVR8armHWqFTLr0Ljwwdg9b+ZpyeR4jp6eASyGyOyhpXMTWlJjyWiPlPT7X2mypdrwJysmWB89NH9xMb5Vz7X0t7G7ZkC30w0CArglLgTiTAkm4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(366004)(396003)(1800799009)(186009)(451199024)(6666004)(6486002)(6506007)(38100700002)(6512007)(31696002)(83380400001)(36756003)(26005)(2616005)(41300700001)(66556008)(316002)(2906002)(66946007)(66476007)(110136005)(86362001)(5660300002)(7416002)(8676002)(478600001)(4326008)(8936002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU5VTkNib09PcUlCWmpwOWRSZUtEOXBDajNINklRdUR6azdXWnBSaWtGZHdq?=
 =?utf-8?B?dUJMVEJrdkhOU0xHRkdROERQTGxTVUZDY09oL3RlSWNxMXo4OGZVcHl6aXdK?=
 =?utf-8?B?RkErYVUyYVMwSkQ5WVBYR2I2QlVyNHNscDZNWGN6eFpXRTRuc05WdzBZSXhK?=
 =?utf-8?B?RFVHK3lQYWx4cHBLdjZpaWZtWXBmRE9INWVTaXRkOUZDM2RTc3lJbDUvbjI5?=
 =?utf-8?B?TkVXU3pnZ1ZPVDdPMm5wSjZxNE9pZkRoelpGSUpZNDlleDhSM1pvNDFOaVo1?=
 =?utf-8?B?VVRyUU54RGw3M0tLZFdWcmcyZUYyOWZjN2JqVWdXWGNUOHF5YUNwd1BIMFBt?=
 =?utf-8?B?TFBvejVzTVJja05iMGFReUhOcGUvZm5qSi9XbzJ0QUYxb01DZHlTMlg5NjN4?=
 =?utf-8?B?cmZwV2xvZzFYVkc4S2Y3enFIQkhOb1BKVGdkRmhHVE5vRGI3VS94VUVyYWVU?=
 =?utf-8?B?Wk15NFMya3NYTWVEc21qM3Q1T1dPTU1mSlZWaFVuOE9GWk0zOFYzMDJZWU1L?=
 =?utf-8?B?ZVRKZHR0NVhRQ0I5TzRkR0lVK1lheEhVZ0VDNmtadWxaUTM2TWhEOGtJMkpV?=
 =?utf-8?B?Z0NjdkNWbW91UnRTaklqMm9jMDRocnU4Vkt4eU53eVhmWjd5alZRbDlqOXhB?=
 =?utf-8?B?T05qQ3B1YWdVbFhVS0RqWHgvWThSOW1rVXFvNkV0UU5NZUlTR2wyYkg0WVlE?=
 =?utf-8?B?bGMzQzgvMzk1OEN5L2dsZ0ZlR05qS3FGVUROSFYrd3h3QXMyRGtTWnB2Nm9O?=
 =?utf-8?B?azZiL01iT0loQWhyaFk0d1pEQ2IzVlZ5MHBrV05KeThrWlAwVUNBSUJ3bERB?=
 =?utf-8?B?UGxHYkRZRTlSWVFzbmx0MmF1b1JVYzE2NmxzUm42N1RtR3BDRnhOcWszSzFY?=
 =?utf-8?B?ZHRCQ1ZQNVFpSWZUUXAwbmZhR0hKK0lJak1HQ3NVZjhWWVpLNUJ0cVUwTjND?=
 =?utf-8?B?b3pVSCsrZ1Q0YUZZR0Rua0NxTldQUUpqUDQ4aXpVL2c3MGlWbU81SVJjNUhW?=
 =?utf-8?B?dkYrQzFvN0d3eUt2SkVrSlRrU3RmZjZZVTByY2R0YXdFQzdNcGFUYTg5bHVn?=
 =?utf-8?B?R3hSZXZXWmtSNDJXQzY5TmhwVmpvM3VVdFdlWFZncFcvSGFpRC90aFVtM2lO?=
 =?utf-8?B?L2U2M0RxSHkvelJnY2FTcDN4TkdKakVFM2c3bndmVkY0KzFtamFxUjJBNkF1?=
 =?utf-8?B?d29kb3dueWorVzBjckFDTDhMbnFMSm1CSGRuWG95UkpweE12TllGaEFpYkM4?=
 =?utf-8?B?THd3OGVFUFFtUTZRcnk5c3FDMHVaSWZYREZXNy9wYmQ0SlRhRENsOTl6V1Uw?=
 =?utf-8?B?VDY1V095cXVEYW9sWmZ1bjNPbmh1Z255R1hVRWRTTUlJYlFlaXJGclRXMnlk?=
 =?utf-8?B?WEl5N3M2N0NUcUVvSkJvMTVXZ2ZNS21XclphOTBPalhwRUF5eTNBVGZUby9K?=
 =?utf-8?B?T1pEVWdBU3RZa0JnRFdZY2dXTFE3SWxwQ20rNkNQU29oL0pyQkZ3NWtUektH?=
 =?utf-8?B?dERIN0dXSTBsRE41ZUhiejNOcWZjQ29zYVlIcUtVc0liU1JpLzFZaTh3ZXBN?=
 =?utf-8?B?L1lxOU9FTGladDNvQXlCcVJSSTZOcnZqM1hta2VBcEZSdm1IQ052RWc3TlBQ?=
 =?utf-8?B?dWFZVnl2b3g1eW9jcnpoNFlqSHgzYW9jV2tXYWtFbG4vUWJObjNYNER6ZnFJ?=
 =?utf-8?B?S25QSTNCWnNJY1JwT0Q0R29jZzNSK2hZT0VjNzBNdDZFOHlyaU9YR0VDRVVU?=
 =?utf-8?B?ako2ZnJyL3RsY2xXc0lCUEtuSmtjZnIxTU4rMzhMa05UaVdZUXFpSlIrZFlq?=
 =?utf-8?B?cE0rOFJONVR1UzlaY1VEMWtaYU9KSnozYm5XRE1hc3h1Z050U1JrMzcwdTR2?=
 =?utf-8?B?RHNhSFVMSnk3bXZ0M2thMXpXTk5jRFBBZDV4VjdQWjZZbUhUT2RvQWNoYTdX?=
 =?utf-8?B?bktMWkNGd2oraXJaN3RxRmhZY0k5VUdLTVB5UVhVeEpZc1A2V2lqWTRFeWN2?=
 =?utf-8?B?VkNWSUNuWUwvdUovU1UzVk50UlcvUjRTK2xzSUFmaFdDM3RuNVlWTWxCVDB4?=
 =?utf-8?B?bjlDb0pCWGZjcTZ3TXJVMTIvNHd2akpHUzNIb1c1RDJLNW84b09BQ3h2ODk1?=
 =?utf-8?Q?0LFhAiFvTzkwdzZmkwVKHHjZG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9366ad1f-7373-4e0d-80ae-08dba24ff546
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 14:07:30.6845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ny/N/yoFzx5B78iqKhNS7dGUkd2Yb2rf0SOS27izNOmOR9G6mRWUMrxCBAYCb1Da
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9136
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
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.08.23 um 13:58 schrieb Danilo Krummrich:
> [SNIP]
>> I only see two possible outcomes:
>> 1. You return -EBUSY (or similar) error code indicating the the hw 
>> can't receive more commands.
>> 2. Wait on previously pushed commands to be executed.
>> (3. Your driver crash because you accidentally overwrite stuff in the 
>> ring buffer which is still executed. I just assume that's prevented).
>>
>> Resolution #1 with -EBUSY is actually something the UAPI should not 
>> do, because your UAPI then depends on the specific timing of 
>> submissions which is a really bad idea.
>>
>> Resolution #2 is usually bad because it forces the hw to run dry 
>> between submission and so degrade performance.
>
> I agree, that is a good reason for at least limiting the maximum job 
> size to half of the ring size.
>
> However, there could still be cases where two subsequent jobs are 
> submitted with just a single IB, which as is would still block 
> subsequent jobs to be pushed to the ring although there is still 
> plenty of space. Depending on the (CPU) scheduler latency, such a case 
> can let the HW run dry as well.

Yeah, that was intentionally not done as well. The crux here is that the 
more you push to the hw the worse the scheduling granularity becomes. 
It's just that neither Xe nor Nouveau relies that much on the scheduling 
granularity at all (because of hw queues).

But Xe doesn't seem to need that feature and I would still try to avoid 
it because the more you have pushed to the hw the harder it is to get 
going again after a reset.

>
> Surely, we could just continue decrease the maximum job size even 
> further, but this would result in further overhead on user and kernel 
> for larger IB counts. Tracking the actual job size seems to be the 
> better solution for drivers where the job size can vary over a rather 
> huge range.

I strongly disagree on that. A larger ring buffer is trivial to allocate 
and if userspace submissions are so small that the scheduler can't keep 
up submitting them then your ring buffer size is your smallest problem.

In other words the submission overhead will completely kill your 
performance and you should probably consider stuffing more into a single 
submission.

Regards,
Christian.

>
> - Danilo
