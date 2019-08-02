Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E5D7EBAE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 06:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0496E8A5;
	Fri,  2 Aug 2019 04:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACEA6E8A2
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 04:55:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2019 21:55:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,336,1559545200"; 
 d="scan'208,217";a="324466804"
Received: from karrer-mobl1.ger.corp.intel.com (HELO [10.249.35.237])
 ([10.249.35.237])
 by orsmga004.jf.intel.com with ESMTP; 01 Aug 2019 21:55:43 -0700
Subject: Re: Threaded submission & semaphore sharing
To: "Koenig, Christian" <Christian.Koenig@amd.com>
References: <e8063826-a38b-e1d3-fe8b-63202b8bd264@intel.com>
 <MN2PR12MB29103E4B1ABDD9A9A40EF8F6B4D90@MN2PR12MB2910.namprd12.prod.outlook.com>
 <a9904cd8-c1ff-e1d3-eb16-5183dc9a7908@intel.com>
 <970c65d1-ad63-4492-8ae2-96b603b2c7c8@email.android.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <7029d51c-2e57-a58e-d621-d9dc15614316@intel.com>
Date: Fri, 2 Aug 2019 07:55:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <970c65d1-ad63-4492-8ae2-96b603b2c7c8@email.android.com>
Content-Language: en-US
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
Content-Type: multipart/mixed; boundary="===============1301659148=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1301659148==
Content-Type: multipart/alternative;
 boundary="------------0C55F555A9F45138801D01CF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0C55F555A9F45138801D01CF
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hey Christian,

The problem boils down to the fact that we don't immediately create dma 
fences when calling vkQueueSubmit().
This is delayed to a thread.

 From a single application thread, you can QueueSubmit() to 2 queues 
from 2 different devices.
Each QueueSubmit to one queue has a dependency on the previous 
QueueSubmit on the other queue through an exported/imported semaphore.

 From the API point of view the state of the semaphore should be changed 
after each QueueSubmit().
The problem is that it's not because of the thread and because you might 
have those 2 submission threads tied to different VkDevice/VkInstance or 
even different applications (synchronizing themselves outside the vulkan 
API).

Hope that makes sense.
It's not really easy to explain by mail, the best explanation is 
probably reading the test : 
https://gitlab.freedesktop.org/mesa/crucible/blob/master/src/tests/func/sync/semaphore-fd.c#L788

Like David mentioned you're not running into that issue right now, 
because you only dispatch to the thread under specific conditions.
But I could build a case to force that and likely run into the same issue.

-Lionel

On 02/08/2019 07:33, Koenig, Christian wrote:
> Hi Lionel,
>
> Well could you describe once more what the problem is?
>
> Cause I don't fully understand why a rather normal tandem submission 
> with two semaphores should fail in any way.
>
> Regards,
> Christian.
>
> Am 02.08.2019 06:28 schrieb Lionel Landwerlin 
> <lionel.g.landwerlin@intel.com>:
> There aren't CTS tests covering the issue I was mentioning.
> But we could add them.
>
> I don't have all the details regarding your implementation but even with
> the "semaphore thread", I could see it running into the same issues.
> What if a mix of binary & timeline semaphores are handed to 
> vkQueueSubmit()?
>
> For example with queueA & queueB from 2 different VkDevice :
>      vkQueueSubmit(queueA, signal semA);
>      vkQueueSubmit(queueA, wait on [semA, timelineSemB]); with
> timelineSemB triggering a wait before signal.
>      vkQueueSubmit(queueB, signal semA);
>
>
> -Lionel
>
> On 02/08/2019 06:18, Zhou, David(ChunMing) wrote:
> > Hi Lionel,
> >
> > By the Queue thread is a heavy thread, which is always resident in 
> driver during application running, our guys don't like that. So we 
> switch to Semaphore Thread, only when waitBeforeSignal of timeline 
> happens, we spawn a thread to handle that wait. So we don't have your 
> this issue.
> > By the way, I already pass all your CTS cases for now. I suggest you 
> to switch to Semaphore Thread instead of Queue Thread as well. It 
> works very well.
> >
> > -David
> >
> > -----Original Message-----
> > From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > Sent: Friday, August 2, 2019 4:52 AM
> > To: dri-devel <dri-devel@lists.freedesktop.org>; Koenig, Christian 
> <Christian.Koenig@amd.com>; Zhou, David(ChunMing) 
> <David1.Zhou@amd.com>; Jason Ekstrand <jason@jlekstrand.net>
> > Subject: Threaded submission & semaphore sharing
> >
> > Hi Christian, David,
> >
> > Sorry to report this so late in the process, but I think we found an 
> issue not directly related to syncobj timelines themselves but with a 
> side effect of the threaded submissions.
> >
> > Essentially we're failing a test in crucible :
> > func.sync.semaphore-fd.opaque-fd
> > This test create a single binary semaphore, shares it between 2 
> VkDevice/VkQueue.
> > Then in a loop it proceeds to submit workload alternating between 
> the 2 VkQueue with one submit depending on the other.
> > It does so by waiting on the VkSemaphore signaled in the previous 
> iteration and resignaling it.
> >
> > The problem for us is that once things are dispatched to the 
> submission thread, the ordering of the submission is lost.
> > Because we have 2 devices and they both have their own submission 
> thread.
> >
> > Jason suggested that we reestablish the ordering by having 
> semaphores/syncobjs carry an additional uint64_t payload.
> > This 64bit integer would represent be an identifier that submission 
> threads will WAIT_FOR_AVAILABLE on.
> >
> > The scenario would look like this :
> >       - vkQueueSubmit(queueA, signal on semA);
> >           - in the caller thread, this would increment the syncobj 
> additional u64 payload and return it to userspace.
> >           - at some point the submission thread of queueA submits 
> the workload and signal the syncobj of semA with value returned in the 
> caller thread of vkQueueSubmit().
> >       - vkQueueSubmit(queueB, wait on semA);
> >           - in the caller thread, this would read the syncobj additional
> > u64 payload
> >           - at some point the submission thread of queueB will try 
> to submit the work, but first it will WAIT_FOR_AVAILABLE the u64 value 
> returned in the step above
> >
> > Because we want the binary semaphores to be shared across processes 
> and would like this to remain a single FD, the simplest location to 
> store this additional u64 payload would be the DRM syncobj.
> > It would need an additional ioctl to read & increment the value.
> >
> > What do you think?
> >
> > -Lionel
>
>


--------------0C55F555A9F45138801D01CF
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Hey Christian,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">The problem boils down to the fact that
      we don't immediately create dma fences when calling
      vkQueueSubmit().</div>
    <div class="moz-cite-prefix">This is delayed to a thread.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">From a single application thread, you
      can QueueSubmit() to 2 queues from 2 different devices.</div>
    <div class="moz-cite-prefix">Each QueueSubmit to one queue has a
      dependency on the previous QueueSubmit on the other queue through
      an exported/imported semaphore.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">From the API point of view the state of
      the semaphore should be changed after each QueueSubmit().</div>
    <div class="moz-cite-prefix">The problem is that it's not because of
      the thread and because you might have those 2 submission threads
      tied to different VkDevice/VkInstance or even different
      applications (synchronizing themselves outside the vulkan API).</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Hope that makes sense.</div>
    <div class="moz-cite-prefix">It's not really easy to explain by
      mail, the best explanation is probably reading the test : <a
href="https://gitlab.freedesktop.org/mesa/crucible/blob/master/src/tests/func/sync/semaphore-fd.c#L788">https://gitlab.freedesktop.org/mesa/crucible/blob/master/src/tests/func/sync/semaphore-fd.c#L788</a></div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Like David mentioned you're not running
      into that issue right now, because you only dispatch to the thread
      under specific conditions.</div>
    <div class="moz-cite-prefix">But I could build a case to force that
      and likely run into the same issue.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">-Lionel<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 02/08/2019 07:33, Koenig, Christian
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:970c65d1-ad63-4492-8ae2-96b603b2c7c8@email.android.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <meta name="Generator" content="Microsoft Exchange Server">
      <!-- converted from text -->
      <style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left: #800000 2px solid; } --></style>
      <div>
        <div dir="auto">Hi Lionel,
          <div dir="auto"><br>
          </div>
          <div dir="auto">Well could you describe once more what the
            problem is?</div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Cause I don't fully understand why a rather
            normal tandem submission with two semaphores should fail in
            any way.</div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Regards,</div>
          <div dir="auto">Christian.</div>
        </div>
        <div class="x_gmail_extra"><br>
          <div class="x_gmail_quote">Am 02.08.2019 06:28 schrieb Lionel
            Landwerlin <a class="moz-txt-link-rfc2396E" href="mailto:lionel.g.landwerlin@intel.com">&lt;lionel.g.landwerlin@intel.com&gt;</a>:<br
              type="attribution">
          </div>
        </div>
      </div>
      <font size="2"><span style="font-size:11pt;">
          <div class="PlainText">There aren't CTS tests covering the
            issue I was mentioning.<br>
            But we could add them.<br>
            <br>
            I don't have all the details regarding your implementation
            but even with <br>
            the "semaphore thread", I could see it running into the same
            issues.<br>
            What if a mix of binary &amp; timeline semaphores are handed
            to vkQueueSubmit()?<br>
            <br>
            For example with queueA &amp; queueB from 2 different
            VkDevice :<br>
                 vkQueueSubmit(queueA, signal semA);<br>
                 vkQueueSubmit(queueA, wait on [semA, timelineSemB]);
            with <br>
            timelineSemB triggering a wait before signal.<br>
                 vkQueueSubmit(queueB, signal semA);<br>
            <br>
            <br>
            -Lionel<br>
            <br>
            On 02/08/2019 06:18, Zhou, David(ChunMing) wrote:<br>
            &gt; Hi Lionel,<br>
            &gt;<br>
            &gt; By the Queue thread is a heavy thread, which is always
            resident in driver during application running, our guys
            don't like that. So we switch to Semaphore Thread, only when
            waitBeforeSignal of timeline happens, we spawn a thread to
            handle that wait. So we don't have your this issue.<br>
            &gt; By the way, I already pass all your CTS cases for now.
            I suggest you to switch to Semaphore Thread instead of Queue
            Thread as well. It works very well.<br>
            &gt;<br>
            &gt; -David<br>
            &gt;<br>
            &gt; -----Original Message-----<br>
            &gt; From: Lionel Landwerlin
            <a class="moz-txt-link-rfc2396E" href="mailto:lionel.g.landwerlin@intel.com">&lt;lionel.g.landwerlin@intel.com&gt;</a><br>
            &gt; Sent: Friday, August 2, 2019 4:52 AM<br>
            &gt; To: dri-devel <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>;
            Koenig, Christian <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>; Zhou,
            David(ChunMing) <a class="moz-txt-link-rfc2396E" href="mailto:David1.Zhou@amd.com">&lt;David1.Zhou@amd.com&gt;</a>; Jason Ekstrand
            <a class="moz-txt-link-rfc2396E" href="mailto:jason@jlekstrand.net">&lt;jason@jlekstrand.net&gt;</a><br>
            &gt; Subject: Threaded submission &amp; semaphore sharing<br>
            &gt;<br>
            &gt; Hi Christian, David,<br>
            &gt;<br>
            &gt; Sorry to report this so late in the process, but I
            think we found an issue not directly related to syncobj
            timelines themselves but with a side effect of the threaded
            submissions.<br>
            &gt;<br>
            &gt; Essentially we're failing a test in crucible :<br>
            &gt; func.sync.semaphore-fd.opaque-fd<br>
            &gt; This test create a single binary semaphore, shares it
            between 2 VkDevice/VkQueue.<br>
            &gt; Then in a loop it proceeds to submit workload
            alternating between the 2 VkQueue with one submit depending
            on the other.<br>
            &gt; It does so by waiting on the VkSemaphore signaled in
            the previous iteration and resignaling it.<br>
            &gt;<br>
            &gt; The problem for us is that once things are dispatched
            to the submission thread, the ordering of the submission is
            lost.<br>
            &gt; Because we have 2 devices and they both have their own
            submission thread.<br>
            &gt;<br>
            &gt; Jason suggested that we reestablish the ordering by
            having semaphores/syncobjs carry an additional uint64_t
            payload.<br>
            &gt; This 64bit integer would represent be an identifier
            that submission threads will WAIT_FOR_AVAILABLE on.<br>
            &gt;<br>
            &gt; The scenario would look like this :<br>
            &gt;       - vkQueueSubmit(queueA, signal on semA);<br>
            &gt;           - in the caller thread, this would increment
            the syncobj additional u64 payload and return it to
            userspace.<br>
            &gt;           - at some point the submission thread of
            queueA submits the workload and signal the syncobj of semA
            with value returned in the caller thread of vkQueueSubmit().<br>
            &gt;       - vkQueueSubmit(queueB, wait on semA);<br>
            &gt;           - in the caller thread, this would read the
            syncobj additional<br>
            &gt; u64 payload<br>
            &gt;           - at some point the submission thread of
            queueB will try to submit the work, but first it will
            WAIT_FOR_AVAILABLE the u64 value returned in the step above<br>
            &gt;<br>
            &gt; Because we want the binary semaphores to be shared
            across processes and would like this to remain a single FD,
            the simplest location to store this additional u64 payload
            would be the DRM syncobj.<br>
            &gt; It would need an additional ioctl to read &amp;
            increment the value.<br>
            &gt;<br>
            &gt; What do you think?<br>
            &gt;<br>
            &gt; -Lionel<br>
            <br>
            <br>
          </div>
        </span></font>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------0C55F555A9F45138801D01CF--

--===============1301659148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1301659148==--
