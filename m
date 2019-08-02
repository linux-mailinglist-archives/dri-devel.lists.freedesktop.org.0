Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8AC7F00B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 11:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F25E6ED69;
	Fri,  2 Aug 2019 09:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810051.outbound.protection.outlook.com [40.107.81.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832096ED69
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 09:11:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STQ4XBocAcD49I0gHn+75OxFTKsdHCzzFmh50szTbZCoQQAS2BglrraczCqDd1z1mc9EuWOWUi+zFx/GBNrZpvTbG8LeEb64rmctoTZG8C/05EOXel8nd2mgh2GVLizT/7wnID/msLXYg+XVc5jlSSDzZ+RqBc2SNoOX3GVEPSTwBf9ioWiTVe9LmP8xuKDB6if12U2avIBf0+k44iJqgdICkLS++wYPVNUO2o3+QLCF4mthmHZeI0okG95oQSzUcokt1b7LKDmBcuSthkq7Hpz1BBAhi7PMcSZE0tKp7avCRR4Zc9QVzbfr84v1l6yOvZXOBfeIUgESHn4TkI5kog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+AvEzRQsIA0/jEvRZF3c3rudJdChuO38tvuXsqIjJA=;
 b=aHad1GNquWOuHNKPSIxTXmtxqw6hUWXEQEGdzSGbJ8oqeW6IeDE7Qwt6BfhckFgIrkKZoir7ISVEwWfZMUWuBM5FtQqcRplqEwyjQ7FsATMyHFLIRfNkuPun95FrpCvCtTSLPnhLUnZo5oEPtvnjaHc8n8GgDeQw4kgYrJh8yyt11Y67aINDzNnuxK6Evk0pshEy+5jAzfwAewqqjdaVRP9752ajlT+eVRrGjH3d3EyEO0p84hU8s0Z+kznIM2gYmq8O+Je7b79x0cWvLOrg32E9ILk7+wPNNGYGxXde0iWJmRNgXLgXQksj8v4Gfs3WwhZXlfsBEhl96LoKQC78lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CH2PR12CA0003.namprd12.prod.outlook.com (2603:10b6:610:57::13)
 by DM5PR12MB2423.namprd12.prod.outlook.com (2603:10b6:4:b4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16; Fri, 2 Aug
 2019 09:11:47 +0000
Received: from BY2NAM03FT050.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by CH2PR12CA0003.outlook.office365.com
 (2603:10b6:610:57::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.12 via Frontend
 Transport; Fri, 2 Aug 2019 09:11:47 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT050.mail.protection.outlook.com (10.152.85.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Fri, 2 Aug 2019 09:11:46 +0000
Received: from [10.65.99.155] (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Fri, 2 Aug
 2019 04:11:43 -0500
Subject: Re: Threaded submission & semaphore sharing
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
References: <e2a1839e-1ee1-4ecb-9b18-af338046c0f1@email.android.com>
 <9bd985bb-1dfb-b28d-e1da-efa5b41464c8@intel.com>
From: zhoucm1 <zhoucm1@amd.com>
Message-ID: <d23455fe-c74a-2ee0-a954-af86963e4d2f@amd.com>
Date: Fri, 2 Aug 2019 17:11:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <9bd985bb-1dfb-b28d-e1da-efa5b41464c8@intel.com>
Content-Language: en-US
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(2980300002)(428003)(13464003)(199004)(189003)(6246003)(6306002)(54896002)(30864003)(31696002)(478600001)(65826007)(76176011)(64126003)(16586007)(58126008)(37036004)(110136005)(54906003)(53936002)(16576012)(71190400001)(236005)(68736007)(53946003)(229853002)(5660300002)(606006)(31686004)(6636002)(316002)(4326008)(65806001)(65956001)(3846002)(6116002)(6666004)(356004)(70586007)(36756003)(70206006)(966005)(126002)(476003)(2616005)(11346002)(446003)(2906002)(7736002)(486006)(81166006)(81156014)(14444005)(426003)(336012)(8936002)(8676002)(33964004)(53546011)(16526019)(186003)(26005)(579004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2423; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 161e64f3-d1bd-4cb8-f7b4-08d717297214
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR12MB2423; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB2423:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <DM5PR12MB24239DA88600C9A1E97B4E77B4D90@DM5PR12MB2423.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 011787B9DD
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: yRAJed4bAjit9flMIAk9bFz4PH3I6VnsgMgvPNTu3q89FwcnjBA1DCMgR5DpFC92fhqyfcCJf88WH1GXcYchED4TdcB2Hf6Ca9FrOkoU4vjDSiODnh3b+9gjSc70gLA036YbVaXhkfUcVkUeLGofeCezijgPHaLElvpR8dAq7Iu8xeuK9aYSKJkpyoWyoscv8CXQ7D2ZjVHfUjW/szeSXLl0+e0bYqOiWkVxVPuv9svgEoesDCIyb/vGtgU5rjLKlaWm1lhVnQ2GO4SKCqD5k9Mhoq3vL4j8C7Q+z9X/3vMOeKTigeRjqKgyochD4spQjZphsWF67v1H5wA3jMQvBHkvotFh0B1HCDc6Keih3ZAIKzz8yUWyXN337Fl/uwRhFfYRpXsMMgQWcdMdJ7klWjG87NkYQipJVI4UkQc+BSw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2019 09:11:46.9768 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 161e64f3-d1bd-4cb8-f7b4-08d717297214
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2423
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+AvEzRQsIA0/jEvRZF3c3rudJdChuO38tvuXsqIjJA=;
 b=ZhZ1OgAS55+FGM/wqjmoJBEIptMfk6yTamkoUxDd+9dXe8JMe7zr9KKKN5p0B/LJwZexpUAWH4O7S8bnJxEFevNuwyqfa1Gg/A/jOCXwcm4YAEyDbEjZ+d9tPbOHAL28vwUK8j2i8OMDLfnf7a73wncesj8DPwE4YJrLn7NuAsM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=permerror action=none header.from=amd.com;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0412359660=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0412359660==
Content-Type: multipart/alternative;
	boundary="------------46899491CFE5B674251C13D2"
Content-Language: en-US

--------------46899491CFE5B674251C13D2
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Lionel,

For binary semaphore, I guess every one will think application will 
guarantee wait is behind the signal, whenever the semaphore is shared or 
used in internal-process.

I think below two options can fix your problem:

a. Can we extend vkWaitForFence so that it can be able to wait on 
fence-available? If fence is available, then it's safe to do semaphore 
wait in vkQueueSubmit.

b. Make waitBeforeSignal is valid for binary semaphore as well, as that 
way, It is reasonable to add wait/signal counting for binary syncobj.


-David


On 2019年08月02日 14:27, Lionel Landwerlin wrote:
> On 02/08/2019 09:10, Koenig, Christian wrote:
>>
>>
>> Am 02.08.2019 07:38 schrieb Lionel Landwerlin 
>> <lionel.g.landwerlin@intel.com>:
>>
>>     On 02/08/2019 08:21, Koenig, Christian wrote:
>>
>>
>>
>>         Am 02.08.2019 07:17 schrieb Lionel Landwerlin
>>         <lionel.g.landwerlin@intel.com>
>>         <mailto:lionel.g.landwerlin@intel.com>:
>>
>>             On 02/08/2019 08:08, Koenig, Christian wrote:
>>
>>                 Hi Lionel,
>>
>>                 Well that looks more like your test case is buggy.
>>
>>                 According to the code the ctx1 queue always waits for
>>                 sem1 and ctx2 queue always waits for sem2.
>>
>>
>>             That's supposed to be the same underlying syncobj because
>>             it's exported from one VkDevice as opaque FD from sem1
>>             and imported into sem2.
>>
>>
>>         Well than that's still buggy and won't synchronize at all.
>>
>>         When ctx1 waits for a semaphore and then signals the same
>>         semaphore there is no guarantee that ctx2 will run in between
>>         jobs.
>>
>>         It's perfectly valid in this case to first run all jobs from
>>         ctx1 and then all jobs from ctx2.
>>
>>
>>     That's not really how I see the semaphores working.
>>
>>     The spec describe VkSemaphore as an interface to an internal
>>     payload opaque to the application.
>>
>>
>>     When ctx1 waits on the semaphore, it waits on the payload put
>>     there by the previous iteration.
>>
>>
>> And who says that it's not waiting for it's own previous payload?
>
>
> That's was I understood from you previous comment : "there is no 
> guarantee that ctx2 will run in between jobs"
>
>
>>
>> See if the payload is a counter this won't work either. Keep in mind 
>> that this has the semantic of a semaphore. Whoever grabs the 
>> semaphore first wins and can run, everybody else has to wait.
>
>
> What performs the "grab" here?
>
> I thought that would be vkQueueSubmit().
>
> Since that occuring from a single application thread, that should then 
> be ordered in execution of ctx1,ctx2,ctx1,...
>
>
> Thanks for your time on this,
>
>
> -Lionel
>
>
>>
>>     Then it proceeds to signal it by replacing the internal payload.
>>
>>
>> That's an implementation detail of our sync objects, but I don't 
>> think that this behavior is part of the Vulkan specification.
>>
>> Regards,
>> Christian.
>>
>>
>>     ctx2 then waits on that and replaces the payload again with the
>>     new internal synchronization object.
>>
>>
>>     The internal payload is a dma fence in our case and signaling
>>     just replaces a dma fence by another or puts one where there was
>>     none before.
>>
>>     So we should have created a dependecy link between all the
>>     submissions and then should be executed in the order of
>>     QueueSubmit() calls.
>>
>>
>>     -Lionel
>>
>>
>>
>>         It only prevents running both at the same time and as far as
>>         I can see that still works even with threaded submission.
>>
>>         You need at least two semaphores for a tandem submission.
>>
>>         Regards,
>>         Christian.
>>
>>
>>
>>                 This way there can't be any Synchronisation between
>>                 the two.
>>
>>                 Regards,
>>                 Christian.
>>
>>                 Am 02.08.2019 06:55 schrieb Lionel Landwerlin
>>                 <lionel.g.landwerlin@intel.com>
>>                 <mailto:lionel.g.landwerlin@intel.com>:
>>                 Hey Christian,
>>
>>                 The problem boils down to the fact that we don't
>>                 immediately create dma fences when calling
>>                 vkQueueSubmit().
>>                 This is delayed to a thread.
>>
>>                 From a single application thread, you can
>>                 QueueSubmit() to 2 queues from 2 different devices.
>>                 Each QueueSubmit to one queue has a dependency on the
>>                 previous QueueSubmit on the other queue through an
>>                 exported/imported semaphore.
>>
>>                 From the API point of view the state of the semaphore
>>                 should be changed after each QueueSubmit().
>>                 The problem is that it's not because of the thread
>>                 and because you might have those 2 submission threads
>>                 tied to different VkDevice/VkInstance or even
>>                 different applications (synchronizing themselves
>>                 outside the vulkan API).
>>
>>                 Hope that makes sense.
>>                 It's not really easy to explain by mail, the best
>>                 explanation is probably reading the test :
>>                 https://gitlab.freedesktop.org/mesa/crucible/blob/master/src/tests/func/sync/semaphore-fd.c#L788
>>
>>                 Like David mentioned you're not running into that
>>                 issue right now, because you only dispatch to the
>>                 thread under specific conditions.
>>                 But I could build a case to force that and likely run
>>                 into the same issue.
>>
>>                 -Lionel
>>
>>                 On 02/08/2019 07:33, Koenig, Christian wrote:
>>
>>                     Hi Lionel,
>>
>>                     Well could you describe once more what the
>>                     problem is?
>>
>>                     Cause I don't fully understand why a rather
>>                     normal tandem submission with two semaphores
>>                     should fail in any way.
>>
>>                     Regards,
>>                     Christian.
>>
>>                     Am 02.08.2019 06:28 schrieb Lionel Landwerlin
>>                     <lionel.g.landwerlin@intel.com>
>>                     <mailto:lionel.g.landwerlin@intel.com>:
>>                     There aren't CTS tests covering the issue I was
>>                     mentioning.
>>                     But we could add them.
>>
>>                     I don't have all the details regarding your
>>                     implementation but even with
>>                     the "semaphore thread", I could see it running
>>                     into the same issues.
>>                     What if a mix of binary & timeline semaphores are
>>                     handed to vkQueueSubmit()?
>>
>>                     For example with queueA & queueB from 2 different
>>                     VkDevice :
>>                          vkQueueSubmit(queueA, signal semA);
>>                          vkQueueSubmit(queueA, wait on [semA,
>>                     timelineSemB]); with
>>                     timelineSemB triggering a wait before signal.
>>                          vkQueueSubmit(queueB, signal semA);
>>
>>
>>                     -Lionel
>>
>>                     On 02/08/2019 06:18, Zhou, David(ChunMing) wrote:
>>                     > Hi Lionel,
>>                     >
>>                     > By the Queue thread is a heavy thread, which is
>>                     always resident in driver during application
>>                     running, our guys don't like that. So we switch
>>                     to Semaphore Thread, only when waitBeforeSignal
>>                     of timeline happens, we spawn a thread to handle
>>                     that wait. So we don't have your this issue.
>>                     > By the way, I already pass all your CTS cases
>>                     for now. I suggest you to switch to Semaphore
>>                     Thread instead of Queue Thread as well. It works
>>                     very well.
>>                     >
>>                     > -David
>>                     >
>>                     > -----Original Message-----
>>                     > From: Lionel Landwerlin
>>                     <lionel.g.landwerlin@intel.com>
>>                     <mailto:lionel.g.landwerlin@intel.com>
>>                     > Sent: Friday, August 2, 2019 4:52 AM
>>                     > To: dri-devel <dri-devel@lists.freedesktop.org>
>>                     <mailto:dri-devel@lists.freedesktop.org>; Koenig,
>>                     Christian <Christian.Koenig@amd.com>
>>                     <mailto:Christian.Koenig@amd.com>; Zhou,
>>                     David(ChunMing) <David1.Zhou@amd.com>
>>                     <mailto:David1.Zhou@amd.com>; Jason Ekstrand
>>                     <jason@jlekstrand.net> <mailto:jason@jlekstrand.net>
>>                     > Subject: Threaded submission & semaphore sharing
>>                     >
>>                     > Hi Christian, David,
>>                     >
>>                     > Sorry to report this so late in the process,
>>                     but I think we found an issue not directly
>>                     related to syncobj timelines themselves but with
>>                     a side effect of the threaded submissions.
>>                     >
>>                     > Essentially we're failing a test in crucible :
>>                     > func.sync.semaphore-fd.opaque-fd
>>                     > This test create a single binary semaphore,
>>                     shares it between 2 VkDevice/VkQueue.
>>                     > Then in a loop it proceeds to submit workload
>>                     alternating between the 2 VkQueue with one submit
>>                     depending on the other.
>>                     > It does so by waiting on the VkSemaphore
>>                     signaled in the previous iteration and
>>                     resignaling it.
>>                     >
>>                     > The problem for us is that once things are
>>                     dispatched to the submission thread, the ordering
>>                     of the submission is lost.
>>                     > Because we have 2 devices and they both have
>>                     their own submission thread.
>>                     >
>>                     > Jason suggested that we reestablish the
>>                     ordering by having semaphores/syncobjs carry an
>>                     additional uint64_t payload.
>>                     > This 64bit integer would represent be an
>>                     identifier that submission threads will
>>                     WAIT_FOR_AVAILABLE on.
>>                     >
>>                     > The scenario would look like this :
>>                     >       - vkQueueSubmit(queueA, signal on semA);
>>                     >           - in the caller thread, this would
>>                     increment the syncobj additional u64 payload and
>>                     return it to userspace.
>>                     >           - at some point the submission thread
>>                     of queueA submits the workload and signal the
>>                     syncobj of semA with value returned in the caller
>>                     thread of vkQueueSubmit().
>>                     >       - vkQueueSubmit(queueB, wait on semA);
>>                     >           - in the caller thread, this would
>>                     read the syncobj additional
>>                     > u64 payload
>>                     >           - at some point the submission thread
>>                     of queueB will try to submit the work, but first
>>                     it will WAIT_FOR_AVAILABLE the u64 value returned
>>                     in the step above
>>                     >
>>                     > Because we want the binary semaphores to be
>>                     shared across processes and would like this to
>>                     remain a single FD, the simplest location to
>>                     store this additional u64 payload would be the
>>                     DRM syncobj.
>>                     > It would need an additional ioctl to read &
>>                     increment the value.
>>                     >
>>                     > What do you think?
>>                     >
>>                     > -Lionel
>>
>>
>>
>>
>>
>>
>>
>


--------------46899491CFE5B674251C13D2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Lionel,</p>
    <p>For binary semaphore, I guess every one will think application
      will guarantee wait is behind the signal, whenever the semaphore
      is shared or used in internal-process. <br>
    </p>
    <p>I think below two options can fix your problem:<br>
    </p>
    <p>a. Can we extend vkWaitForFence so that it can be able to wait on
      fence-available? If fence is available, then it's safe to do
      semaphore wait in vkQueueSubmit.</p>
    <p>b. Make waitBeforeSignal is valid for binary semaphore as well,
      as that way, It is reasonable to add wait/signal counting for
      binary syncobj.<br>
    </p>
    <p><br>
    </p>
    <p>-David<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2019年08月02日 14:27, Lionel Landwerlin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9bd985bb-1dfb-b28d-e1da-efa5b41464c8@intel.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div class="moz-cite-prefix">On 02/08/2019 09:10, Koenig,
        Christian wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:e2a1839e-1ee1-4ecb-9b18-af338046c0f1@email.android.com">
        <div dir="auto">
          <div><br>
            <div class="gmail_extra"><br>
              <div class="gmail_quote">Am 02.08.2019 07:38 schrieb
                Lionel Landwerlin <a class="moz-txt-link-rfc2396E"
                  href="mailto:lionel.g.landwerlin@intel.com"
                  moz-do-not-send="true">&lt;lionel.g.landwerlin@intel.com&gt;</a>:<br
                  type="attribution">
                <blockquote class="quote" style="margin:0 0 0
                  .8ex;border-left:1px #ccc solid;padding-left:1ex">
                  <div>
                    <div>On 02/08/2019 08:21, Koenig, Christian wrote:<br>
                    </div>
                    <blockquote>
                      <div dir="auto">
                        <div><br>
                          <div><br>
                            <div class="elided-text">Am 02.08.2019 07:17
                              schrieb Lionel Landwerlin <a
                                href="mailto:lionel.g.landwerlin@intel.com"
                                moz-do-not-send="true">
                                &lt;lionel.g.landwerlin@intel.com&gt;</a>:<br
                                type="attribution">
                              <blockquote style="margin:0 0 0
                                0.8ex;border-left:1px #ccc
                                solid;padding-left:1ex">
                                <div>
                                  <div>On 02/08/2019 08:08, Koenig,
                                    Christian wrote:<br>
                                  </div>
                                  <blockquote>
                                    <div dir="auto">Hi Lionel,
                                      <div dir="auto"><br>
                                      </div>
                                      <div dir="auto">Well that looks
                                        more like your test case is
                                        buggy.</div>
                                      <div dir="auto"><br>
                                      </div>
                                      <div dir="auto">According to the
                                        code the ctx1 queue always waits
                                        for sem1 and ctx2 queue always
                                        waits for sem2.</div>
                                    </div>
                                  </blockquote>
                                  <p><br>
                                  </p>
                                  <p>That's supposed to be the same
                                    underlying syncobj because it's
                                    exported from one VkDevice as opaque
                                    FD from sem1 and imported into sem2.<br>
                                  </p>
                                </div>
                              </blockquote>
                            </div>
                          </div>
                        </div>
                        <div dir="auto"><br>
                        </div>
                        <div dir="auto">Well than that's still buggy and
                          won't synchronize at all.</div>
                        <div dir="auto"><br>
                        </div>
                        <div dir="auto">When ctx1 waits for a semaphore
                          and then signals the same semaphore there is
                          no guarantee that ctx2 will run in between
                          jobs.</div>
                        <div dir="auto"><br>
                        </div>
                        <div dir="auto">It's perfectly valid in this
                          case to first run all jobs from ctx1 and then
                          all jobs from ctx2.</div>
                      </div>
                    </blockquote>
                    <p><br>
                    </p>
                    <p>That's not really how I see the semaphores
                      working.</p>
                    <p>The spec describe VkSemaphore as an interface to
                      an internal payload opaque to the application.</p>
                    <p><br>
                    </p>
                    <p>When ctx1 waits on the semaphore, it waits on the
                      payload put there by the previous iteration.</p>
                  </div>
                </blockquote>
              </div>
            </div>
          </div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">And who says that it's not waiting for it's
            own previous payload?</div>
        </div>
      </blockquote>
      <p><br>
      </p>
      <p>That's was I understood from you previous comment : "there is
        no guarantee that ctx2 will run in between jobs"</p>
      <p><br>
      </p>
      <blockquote type="cite"
        cite="mid:e2a1839e-1ee1-4ecb-9b18-af338046c0f1@email.android.com">
        <div dir="auto">
          <div dir="auto"><br>
          </div>
          <div dir="auto">See if the payload is a counter this won't
            work either. Keep in mind that this has the semantic of a
            semaphore. Whoever grabs the semaphore first wins and can
            run, everybody else has to wait.</div>
        </div>
      </blockquote>
      <p><br>
      </p>
      <p>What performs the "grab" here?</p>
      <p>I thought that would be vkQueueSubmit().</p>
      <p>Since that occuring from a single application thread, that
        should then be ordered in execution of ctx1,ctx2,ctx1,...<br>
      </p>
      <p><br>
      </p>
      <p>Thanks for your time on this,</p>
      <p><br>
      </p>
      <p>-Lionel<br>
      </p>
      <p><br>
      </p>
      <blockquote type="cite"
        cite="mid:e2a1839e-1ee1-4ecb-9b18-af338046c0f1@email.android.com">
        <div dir="auto">
          <div dir="auto"><br>
          </div>
          <div dir="auto">
            <div class="gmail_extra">
              <div class="gmail_quote">
                <blockquote class="quote" style="margin:0 0 0
                  .8ex;border-left:1px #ccc solid;padding-left:1ex">
                  <div>
                    <p>Then it proceeds to signal it by replacing the
                      internal payload.</p>
                  </div>
                </blockquote>
              </div>
            </div>
          </div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">That's an implementation detail of our sync
            objects, but I don't think that this behavior is part of the
            Vulkan specification.</div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Regards,</div>
          <div dir="auto">Christian.</div>
          <div dir="auto">
            <div class="gmail_extra">
              <div class="gmail_quote">
                <blockquote class="quote" style="margin:0 0 0
                  .8ex;border-left:1px #ccc solid;padding-left:1ex">
                  <div>
                    <p><br>
                    </p>
                    <p>ctx2 then waits on that and replaces the payload
                      again with the new internal synchronization
                      object.</p>
                    <p><br>
                    </p>
                    <p>The internal payload is a dma fence in our case
                      and signaling just replaces a dma fence by another
                      or puts one where there was none before.</p>
                    <p>So we should have created a dependecy link
                      between all the submissions and then should be
                      executed in the order of QueueSubmit() calls.<br>
                    </p>
                    <p><br>
                    </p>
                    <p>-Lionel<br>
                    </p>
                    <p><br>
                    </p>
                    <blockquote>
                      <div dir="auto">
                        <div dir="auto"><br>
                        </div>
                        <div dir="auto">It only prevents running both at
                          the same time and as far as I can see that
                          still works even with threaded submission.</div>
                        <div dir="auto"><br>
                        </div>
                        <div dir="auto">You need at least two semaphores
                          for a tandem submission.</div>
                        <div dir="auto"><br>
                        </div>
                        <div dir="auto">Regards,</div>
                        <div dir="auto">Christian.</div>
                        <div dir="auto">
                          <div>
                            <div class="elided-text">
                              <blockquote style="margin:0 0 0
                                0.8ex;border-left:1px #ccc
                                solid;padding-left:1ex">
                                <div>
                                  <p><br>
                                  </p>
                                  <blockquote>
                                    <div dir="auto">
                                      <div dir="auto"><br>
                                      </div>
                                      <div dir="auto">This way there
                                        can't be any Synchronisation
                                        between the two.</div>
                                      <div dir="auto"><br>
                                      </div>
                                      <div dir="auto">Regards,</div>
                                      <div dir="auto">Christian.</div>
                                    </div>
                                    <div><br>
                                      <div class="elided-text">Am
                                        02.08.2019 06:55 schrieb Lionel
                                        Landwerlin <a
                                          href="mailto:lionel.g.landwerlin@intel.com"
                                          moz-do-not-send="true">
&lt;lionel.g.landwerlin@intel.com&gt;</a>:<br type="attribution">
                                      </div>
                                    </div>
                                    <div>
                                      <div>Hey Christian,</div>
                                      <div><br>
                                      </div>
                                      <div>The problem boils down to the
                                        fact that we don't immediately
                                        create dma fences when calling
                                        vkQueueSubmit().</div>
                                      <div>This is delayed to a thread.</div>
                                      <div><br>
                                      </div>
                                      <div>From a single application
                                        thread, you can QueueSubmit() to
                                        2 queues from 2 different
                                        devices.</div>
                                      <div>Each QueueSubmit to one queue
                                        has a dependency on the previous
                                        QueueSubmit on the other queue
                                        through an exported/imported
                                        semaphore.</div>
                                      <div><br>
                                      </div>
                                      <div>From the API point of view
                                        the state of the semaphore
                                        should be changed after each
                                        QueueSubmit().</div>
                                      <div>The problem is that it's not
                                        because of the thread and
                                        because you might have those 2
                                        submission threads tied to
                                        different VkDevice/VkInstance or
                                        even different applications
                                        (synchronizing themselves
                                        outside the vulkan API).</div>
                                      <div><br>
                                      </div>
                                      <div>Hope that makes sense.</div>
                                      <div>It's not really easy to
                                        explain by mail, the best
                                        explanation is probably reading
                                        the test : <a
href="https://gitlab.freedesktop.org/mesa/crucible/blob/master/src/tests/func/sync/semaphore-fd.c#L788"
                                          moz-do-not-send="true">
https://gitlab.freedesktop.org/mesa/crucible/blob/master/src/tests/func/sync/semaphore-fd.c#L788</a></div>
                                      <div><br>
                                      </div>
                                      <div>Like David mentioned you're
                                        not running into that issue
                                        right now, because you only
                                        dispatch to the thread under
                                        specific conditions.</div>
                                      <div>But I could build a case to
                                        force that and likely run into
                                        the same issue.<br>
                                      </div>
                                      <div><br>
                                      </div>
                                      <div>-Lionel<br>
                                      </div>
                                      <div><br>
                                      </div>
                                      <div>On 02/08/2019 07:33, Koenig,
                                        Christian wrote:<br>
                                      </div>
                                      <blockquote>
                                        <div>
                                          <div dir="auto">Hi Lionel,
                                            <div dir="auto"><br>
                                            </div>
                                            <div dir="auto">Well could
                                              you describe once more
                                              what the problem is?</div>
                                            <div dir="auto"><br>
                                            </div>
                                            <div dir="auto">Cause I
                                              don't fully understand why
                                              a rather normal tandem
                                              submission with two
                                              semaphores should fail in
                                              any way.</div>
                                            <div dir="auto"><br>
                                            </div>
                                            <div dir="auto">Regards,</div>
                                            <div dir="auto">Christian.</div>
                                          </div>
                                          <div><br>
                                            <div>Am 02.08.2019 06:28
                                              schrieb Lionel Landwerlin
                                              <a
                                                href="mailto:lionel.g.landwerlin@intel.com"
                                                moz-do-not-send="true">
&lt;lionel.g.landwerlin@intel.com&gt;</a>:<br type="attribution">
                                            </div>
                                          </div>
                                        </div>
                                        <font size="2"><span
                                            style="font-size:11pt">
                                            <div>There aren't CTS tests
                                              covering the issue I was
                                              mentioning.<br>
                                              But we could add them.<br>
                                              <br>
                                              I don't have all the
                                              details regarding your
                                              implementation but even
                                              with <br>
                                              the "semaphore thread", I
                                              could see it running into
                                              the same issues.<br>
                                              What if a mix of binary
                                              &amp; timeline semaphores
                                              are handed to
                                              vkQueueSubmit()?<br>
                                              <br>
                                              For example with queueA
                                              &amp; queueB from 2
                                              different VkDevice :<br>
                                                   vkQueueSubmit(queueA,
                                              signal semA);<br>
                                                   vkQueueSubmit(queueA,
                                              wait on [semA,
                                              timelineSemB]); with <br>
                                              timelineSemB triggering a
                                              wait before signal.<br>
                                                   vkQueueSubmit(queueB,
                                              signal semA);<br>
                                              <br>
                                              <br>
                                              -Lionel<br>
                                              <br>
                                              On 02/08/2019 06:18, Zhou,
                                              David(ChunMing) wrote:<br>
                                              &gt; Hi Lionel,<br>
                                              &gt;<br>
                                              &gt; By the Queue thread
                                              is a heavy thread, which
                                              is always resident in
                                              driver during application
                                              running, our guys don't
                                              like that. So we switch to
                                              Semaphore Thread, only
                                              when waitBeforeSignal of
                                              timeline happens, we spawn
                                              a thread to handle that
                                              wait. So we don't have
                                              your this issue.<br>
                                              &gt; By the way, I already
                                              pass all your CTS cases
                                              for now. I suggest you to
                                              switch to Semaphore Thread
                                              instead of Queue Thread as
                                              well. It works very well.<br>
                                              &gt;<br>
                                              &gt; -David<br>
                                              &gt;<br>
                                              &gt; -----Original
                                              Message-----<br>
                                              &gt; From: Lionel
                                              Landwerlin <a
                                                href="mailto:lionel.g.landwerlin@intel.com"
                                                moz-do-not-send="true">&lt;lionel.g.landwerlin@intel.com&gt;</a><br>
                                              &gt; Sent: Friday, August
                                              2, 2019 4:52 AM<br>
                                              &gt; To: dri-devel <a
                                                href="mailto:dri-devel@lists.freedesktop.org"
                                                moz-do-not-send="true">&lt;dri-devel@lists.freedesktop.org&gt;</a>;
                                              Koenig, Christian <a
                                                href="mailto:Christian.Koenig@amd.com"
                                                moz-do-not-send="true">&lt;Christian.Koenig@amd.com&gt;</a>;
                                              Zhou, David(ChunMing) <a
href="mailto:David1.Zhou@amd.com" moz-do-not-send="true">&lt;David1.Zhou@amd.com&gt;</a>;
                                              Jason Ekstrand <a
                                                href="mailto:jason@jlekstrand.net"
                                                moz-do-not-send="true">
&lt;jason@jlekstrand.net&gt;</a><br>
                                              &gt; Subject: Threaded
                                              submission &amp; semaphore
                                              sharing<br>
                                              &gt;<br>
                                              &gt; Hi Christian, David,<br>
                                              &gt;<br>
                                              &gt; Sorry to report this
                                              so late in the process,
                                              but I think we found an
                                              issue not directly related
                                              to syncobj timelines
                                              themselves but with a side
                                              effect of the threaded
                                              submissions.<br>
                                              &gt;<br>
                                              &gt; Essentially we're
                                              failing a test in crucible
                                              :<br>
                                              &gt;
                                              func.sync.semaphore-fd.opaque-fd<br>
                                              &gt; This test create a
                                              single binary semaphore,
                                              shares it between 2
                                              VkDevice/VkQueue.<br>
                                              &gt; Then in a loop it
                                              proceeds to submit
                                              workload alternating
                                              between the 2 VkQueue with
                                              one submit depending on
                                              the other.<br>
                                              &gt; It does so by waiting
                                              on the VkSemaphore
                                              signaled in the previous
                                              iteration and resignaling
                                              it.<br>
                                              &gt;<br>
                                              &gt; The problem for us is
                                              that once things are
                                              dispatched to the
                                              submission thread, the
                                              ordering of the submission
                                              is lost.<br>
                                              &gt; Because we have 2
                                              devices and they both have
                                              their own submission
                                              thread.<br>
                                              &gt;<br>
                                              &gt; Jason suggested that
                                              we reestablish the
                                              ordering by having
                                              semaphores/syncobjs carry
                                              an additional uint64_t
                                              payload.<br>
                                              &gt; This 64bit integer
                                              would represent be an
                                              identifier that submission
                                              threads will
                                              WAIT_FOR_AVAILABLE on.<br>
                                              &gt;<br>
                                              &gt; The scenario would
                                              look like this :<br>
                                              &gt;       -
                                              vkQueueSubmit(queueA,
                                              signal on semA);<br>
                                              &gt;           - in the
                                              caller thread, this would
                                              increment the syncobj
                                              additional u64 payload and
                                              return it to userspace.<br>
                                              &gt;           - at some
                                              point the submission
                                              thread of queueA submits
                                              the workload and signal
                                              the syncobj of semA with
                                              value returned in the
                                              caller thread of
                                              vkQueueSubmit().<br>
                                              &gt;       -
                                              vkQueueSubmit(queueB, wait
                                              on semA);<br>
                                              &gt;           - in the
                                              caller thread, this would
                                              read the syncobj
                                              additional<br>
                                              &gt; u64 payload<br>
                                              &gt;           - at some
                                              point the submission
                                              thread of queueB will try
                                              to submit the work, but
                                              first it will
                                              WAIT_FOR_AVAILABLE the u64
                                              value returned in the step
                                              above<br>
                                              &gt;<br>
                                              &gt; Because we want the
                                              binary semaphores to be
                                              shared across processes
                                              and would like this to
                                              remain a single FD, the
                                              simplest location to store
                                              this additional u64
                                              payload would be the DRM
                                              syncobj.<br>
                                              &gt; It would need an
                                              additional ioctl to read
                                              &amp; increment the value.<br>
                                              &gt;<br>
                                              &gt; What do you think?<br>
                                              &gt;<br>
                                              &gt; -Lionel<br>
                                              <br>
                                              <br>
                                            </div>
                                          </span></font></blockquote>
                                      <p><br>
                                      </p>
                                    </div>
                                  </blockquote>
                                  <p><br>
                                  </p>
                                </div>
                              </blockquote>
                            </div>
                            <br>
                          </div>
                        </div>
                      </div>
                    </blockquote>
                    <p><br>
                    </p>
                  </div>
                </blockquote>
              </div>
              <br>
            </div>
          </div>
        </div>
      </blockquote>
      <p><br>
      </p>
    </blockquote>
    <br>
  </body>
</html>

--------------46899491CFE5B674251C13D2--

--===============0412359660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0412359660==--
