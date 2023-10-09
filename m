Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9C67BD3A4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 08:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2C810E235;
	Mon,  9 Oct 2023 06:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF4210E21B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 06:42:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuMVwDIOLnFKKWRzcmh0uj8GpY1iWIRiu7p5ICHk6IqEy4WjbW1Tcw25o9u7Pd9riLXxOk5jQuXrwGs7pxCIB3euoXUtX7Wfumz4MktygufqxqYuDlnWwYkAg1jCDzsK9GhfB+n6L8c2NnGo4NUeSJP2PtzVbWXvuXRXO7JrNpSARafFC+L1iojb9sVvD8UWX5/TroGkqauifOAoYGsDnj9o+xRz5bgQeoNxdSWNVgN0TUbS+v71ik0xSfyCT3EfEHyQ9bhGfViQTz2bSsGEb7DzzpjnkPDRZW/GGkgEnZMmmt9rXmpiF+NehxpYPLh6vj+sWwv/Zvsjs2k2qaUgWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHZLWu39QSzUo6taBDWmQkk+X6jJq3IdpJi/br5BCVU=;
 b=PEnO+WV1q/TtHPuaFD631607ncbc/HkmqQ5om3k6lHl5N8VtzqBC2cT1z3Zk3RrJF42k06XVouSTiFTC7XGLhqumrkuDfoLf0g/0v2VyQk9gu2n+DBrvBbhg9fTtrxPdS9g+Xr7KekLbAIMlMn7K90IIXOZ/RkzFCSdriGHg6gB3DnFDAofBfPyMPI090jFTiApsMbTe1wIEGB3IjCpmgzpgKzhA2gSKU7fsMP3ORVQFh4+pzr1HtGDfwmPfetxM7Sfycm+8nZbRwcYUYDDHZKaN6M0RE6Wni20pOPjEaq16GQX+Qn1Q0JNd6ez0txqWl6xTfzr6Uq/eYxZRJPabSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHZLWu39QSzUo6taBDWmQkk+X6jJq3IdpJi/br5BCVU=;
 b=S0LAUHcGMThuQ/Mo8cu6D66pobW9s01DcK3abQ6ZLROl77apiP7OfYc7/NvjILfm96ke/gy2UEbZKYzroOmCaAANGnOqq2KbQfLNypZfxurjdR9SEIss1yw1SUazF1k7uIQhK68FSAg3XdCHNyW7JASrUko04hO7jyvkjIA04V8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB6446.namprd12.prod.outlook.com (2603:10b6:8:be::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.36; Mon, 9 Oct 2023 06:42:30 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 06:42:30 +0000
Message-ID: <9f9b50fa-8bad-4e96-ac60-21c48f473fc6@amd.com>
Date: Mon, 9 Oct 2023 08:42:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Content-Language: en-US
To: Ray Strode <halfline@gmail.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20230926170549.2589045-1-halfline@gmail.com>
 <ZR6IlVR-A5KtIHEU@phenom.ffwll.local>
 <CAA_UwzL=2PjeH_qW2GJa_XzJCeWkz9NcokPQX3-qn2f0iPz+Rw@mail.gmail.com>
 <90e7f66f-96bf-4e90-88c8-75019bc506a4@amd.com>
 <CAA_UwzJ7q8aq_iw3wimeQXmvKp8Z253J7oqi3UQqcKdkRmAcAA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAA_UwzJ7q8aq_iw3wimeQXmvKp8Z253J7oqi3UQqcKdkRmAcAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: fda19046-59b6-40fc-ca3c-08dbc892e8fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oGmthE1UEHlSMOoDUO4nwApUAgAO6VI9qMiQcdz94ixkapKE9sUIGvtP8wyoRtpxSg3LfFIeltNVs0qfK3Wxg4M4PEkpBv+kRDcVqfsv/Aod7HANOGl15MFoyPi3qPXbQofplxngsV63fqcr4DefAcq3ZlwpoqLc71ukH4+nAqjQMzzsw85oI5cAbpn+gP5pC/Gsu42AXXPeLga8wjtkA3WfrjB8qKXuu5jCCQbD5tqRj8Oo7tVJJJtv9OPEIPDkK4nKFtYt7qBkEYofvg10OJ1OFLUvRDA2AIN5j1gKspc7rl/a8RuxxNwHZGMgLsdegQuWZ+1giQ1KpHTcsXFGp//vp9ySi36Ha75UXZLLjGsDsbrtxsYUbwu9sbQ1nnbp5k2X98OgrVCZcqmtHvCGMPo1ikMEfT2ZAuGeMp7q7RAUC+xq4Y2KTXfnmIOiB3+79fdAACMpOml9GDYcYeZc49MqCWFI2MGWEoAayBi1s70rFP9iExqCN5KzOZCkkeRmsAzgORP89p4Z2rEePNpId+mcUVVL4SHgaNmGDMqZEBQXF4yPCRZmzZJ7F/Qeyc8jYNAMGjfq9e1klWy727LF14mXo1/0D0N4GAz9HHcHQw5jsvcEpYh2t9Y8S6IVNG8seK/ve5xttINx/JidnoBQbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(39860400002)(346002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(31686004)(2616005)(26005)(53546011)(36756003)(31696002)(86362001)(38100700002)(83380400001)(8936002)(4326008)(2906002)(6506007)(478600001)(8676002)(6512007)(66574015)(6666004)(41300700001)(6486002)(5660300002)(316002)(66556008)(66476007)(66946007)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEg4aHBiamxzYWw3UENycWVDQm9uelFXN1F1UU81QU1zSWMxem9aSW5JeENu?=
 =?utf-8?B?T0c2ckozTjM4bngxaGltcDQzZ00vQWF2MnQyWjZZREtoeW9rdEdYcFFIK0g2?=
 =?utf-8?B?ZHl3MGh5cWdjaG1KbVlGd3kxV3JMTFBaL0hSN0hGSko5WEpBdkUyaU1uUFZX?=
 =?utf-8?B?cVBoc3ExY2k4UlhHaW84eHdweEpTMjI2bTJmUkdpTkF1VDhycHlhSDR1RFpX?=
 =?utf-8?B?VEdRREhkZFBoV2tMbFpCamE4SFFsdFpNZXY2RVNOZkliNHJPdU1ZUWZGLy9X?=
 =?utf-8?B?UVJVK3cranUxRzgxV1picXJvT1R3ei9mREo0SVNLNDhTYTZNMjhLbHZZU2xt?=
 =?utf-8?B?MU55WU5DN295Tm9TNWR4YTE3b1ZRQ01QWUtLMSt0b3pDeWJQYWtXSEhDRmF2?=
 =?utf-8?B?ZGV5SWdHUzUwLzBxTGJEUW13R05tQkNFdk05bVlzU0hUT24rUFNNNXNyd2ZD?=
 =?utf-8?B?RElYYk16emlKZ2NZdXRHeUdkZ3hWR0REby9rd1ZKVVIySlplTE5Cbm0wTktn?=
 =?utf-8?B?c3lNQ1VvVTd1MFN2TUJoMUh6bzBvNkJnVllBUmpCYW02TlpJeUlvR2Y4L1F1?=
 =?utf-8?B?TWJVTnU3dTQzTkExQWE1aGZOYlVhdzR3TWhWWTBIU0xOL0lLbzBNYlVmeW9J?=
 =?utf-8?B?Z1RRSlJKcnJTT01WNGZJTWpUbDQ3Sk9VZFQ2SjNrRWlaWVhsdytIVXpqajlY?=
 =?utf-8?B?d1hQWS9kRmc3OTM4aHpLVVRiWGZZSEZYNGNOamNLUXB0RmxSNW9Qa0lrUmVN?=
 =?utf-8?B?SWp2OFNnWnp5M1NxeExLZzJkamhsVGw3ZlM1M3NnK0t3UTVDVHBYb0Q3TlIx?=
 =?utf-8?B?R0c0NnVhRm1obWthVFY4RG9NcUR6TXIxc2JYSGxkeVVRMXA5UXdrUmRxL1RM?=
 =?utf-8?B?UzVqZ0Y4SXlkcFZibjBlQk5NMFVFTm10dVdwUFFlNmZVQmtpRWgwL3FiZitj?=
 =?utf-8?B?S09iYzVtaU5SdTY4YUJ4L2xDVUFmblE1N29jR3p2SWtQRjJOOUZMdnZRcnNo?=
 =?utf-8?B?MTJlV1VpSGVTcFBVeWpFZVlzaGZsWjJDbjh0QzR3bHNhRzdjRk9LRG8vNkRx?=
 =?utf-8?B?V2kzbFBMaFdJZVdjZHVpM0IvS2d0aXQxWlhDTndqV0NIUUVnOVdmRGNUdnFk?=
 =?utf-8?B?cE9pRGEzVlArZFNISnNVK0FtMlorV0RWTXV4K0lTekZnT3UzTTcxaFV4c3cz?=
 =?utf-8?B?L2oyRUV2VUptaXhyMGdmWWM0bVpuOWwwRUt5MlVRNWs2SGxYV1RtOXF6aHJz?=
 =?utf-8?B?R0FONkF5ZXRRbmppbWQ3aTh5K25NYkhleHJJalFEQS9NekhhdGtjbDhRZjFV?=
 =?utf-8?B?dG4reW8xVHQ2MkIxZ01nRzRpRklRSjFlNHAxQzE0cEVNQ25PRmNNZVVKY0R5?=
 =?utf-8?B?MmlaSXYyVHJ3ZndURDQ5MHdObkxOWHhBYXg1ZmszZFFQYks3NHF0YmtQQ3hz?=
 =?utf-8?B?d2RRT2plbFlUYkYrTnEvSHlFZlovbTVSc3JENVcwM2MycU1yQU85UVc0YW8x?=
 =?utf-8?B?c1p2OVorUmdUUkNyaThudWd4MVVnODYweHZtTFYwd3UxQmIySllOMnQ5VnJ5?=
 =?utf-8?B?THRKSVZtRzNOeXM4TXVyYTJYZXkxazZ1TStNcTkyb212K0pxV0EyN0RQd1Mv?=
 =?utf-8?B?VEg1WVRHYnk5UUlWQThMdm5qengydXlSRkFzTW5ieHZIWGU5ZkJQUnUzSklH?=
 =?utf-8?B?Y25DcjVHNVk4QUhJS25nbHRveUFMRkhOaEQ5M2RwR2tsa0kvVWlIckF2NEl1?=
 =?utf-8?B?UDF2VmVzUnorcGR3bXVKbWJYVENWVHV0OFdCK2FYNkdVTDJuaHlhU09nMHVQ?=
 =?utf-8?B?Y2VBL1lHeVg1S2dlSWk1SURNQTVVK3VPSXdGNzhhbk9WM0pWYkJSMit0NEt2?=
 =?utf-8?B?cmpFS3UrWFl2dG9WVThranpib0I4RDJjVHpoZ0NSSCtiMjR4a21SQWRiQldQ?=
 =?utf-8?B?T2lWcjNjaE9QMjJCNHpxdWJPVFNOYWRUbWVLN2pwSWMrb3BQSWkyZFBZbW1Q?=
 =?utf-8?B?MHY0cWVJYkZIdlFJYnI1Uy9iOVMyUlpSemFnSnBwZmJQK2NtTkNUUmZEQkFm?=
 =?utf-8?B?Q0t1cWZOL2pnS0RWYm40bDZ6bXU2NitWaTllWFVsYUNwd1NSUHlhWGIxSlhY?=
 =?utf-8?Q?7ld5ycev79Ogz8Q8YRaMLUD3z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda19046-59b6-40fc-ca3c-08dbc892e8fa
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 06:42:30.3742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVbmpI+zuTl4805vZh13VW0WXE6b2aMYI2zSnYs3Qc9IyIvGE7b8x9yJxl9hV9GY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6446
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
Cc: daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 mdaenzer@redhat.com, alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.10.23 um 20:48 schrieb Ray Strode:
> Hi,
>
> On Fri, Oct 6, 2023 at 3:12 AM Christian König <christian.koenig@amd.com> wrote:
>> When the operation busy waits then that *should* get accounted to the
>> CPU time of the current process. When the operation sleeps and waits for
>> some interrupt for example it should not get accounted.
>> What you suggest is to put the parts of the operation which busy wait
>> into a background task and then sleep for that task to complete. This is
>> not a solution to the problem, but just hides it.
> Actually, I think we both probably agree that there shouldn't be long
> busy waits in the context of the current process. After all, we both
> agree what the AMD DC driver code is doing is wrong.
>
> To be clear, my take is, if driver code is running in process context
> and needs to wait for periods of time on the order of or in excess of
> a typical process time slice it should be sleeping during the waiting.
> If the operation is at a point where it can be cancelled without side
> effects, the sleeping should be INTERRUPTIBLE. If it's past the point
> of no return, sleeping should be UNINTERRUPTIBLE. At no point, in my
> opinion, should kernel code busy block a typical process for dozens of
> milliseconds while keeping the process RUNNING. I don't think this is
> a controversial take.

Exactly that's what I completely disagree on.

When the driver is burning CPU cycles on behalves of a process then 
those CPU cycles should be accounted to the process causing this.

That the driver should probably improve it's behavior is a different issue.

> Actually, I think (maybe?) you might even agree with that, but you're
> also saying: user space processes aren't special here. While it's not
> okay to busy block them, it's also not okay to busy block on the
> system unbound workqueue either. If that's your sentiment, I don't
> disagree with it.

No, it's absolutely ok to busy block them it's just not nice to do so.

As Daniel pointed out this behavior is not incorrect at all. The DRM 
subsystem doesn't make any guarantee that drmModeAtomicCommit() will not 
burn CPU cycles.

>
> So I think we both agree the busy waiting is a problem, but maybe we
> disagree on the best place for the problem to manifest when it
> happens.
>
> One thought re the DC code is regardless of where the code is running,
> the scheduler is going to forcefully preempt it at some point right?
> Any writereg/udelay(1)/readreg loop is going to get disrupted by a
> much bigger than 1us delay by the kernel if the loop goes on long
> enough. I'm not wrong about that? if that's true, the code might as
> well switch out the udelay(1) for a usleep(1) and call it a day (well
> modulo the fact I think it can be called from an interrupt handler; at
> least "git grep" says there's a link_set_dpms_off in
> link_dp_irq_handler.c)
>
>> Stuff like that is not a valid justification for the change. Ville
>> changes on the other hand tried to prevent lock contention which is a
>> valid goal here.
> Okay so let's land his patchset! (assuming it's ready to go in).
> Ville, is that something you'd want to resend for review?

Well, while Ville patch has at least some justification I would still 
strongly object to move the work into a background thread to prevent 
userspace from being accounted for the work it causes.

Regards,
Christian.

>
> Note, a point that I don't think has been brought up yet, too, is the
> system unbound workqueue doesn't run with real time priority. Given
> the lion's share of mutter's drmModeAtomicCommit calls are nonblock,
> and so are using the system unbound workqueue for handling the
> commits, even without this patch, that somewhat diminishes the utility
> of using a realtime thread anyway. I believe the original point of the
> realtime thread was to make sure mouse cursor motion updates are as
> responsive as possible, because any latency there is something the
> user really feels. Maybe there needs to be a different mechanism in
> place to make sure user perceived interactivity is given priority.
>
> --Ray

