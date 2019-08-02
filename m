Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 723AE7EC98
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 08:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079BB6ECC6;
	Fri,  2 Aug 2019 06:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19476ECC6
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 06:27:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2019 23:27:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,337,1559545200"; 
 d="scan'208,217";a="324485617"
Received: from akupijai-mobl.ger.corp.intel.com (HELO [10.252.50.158])
 ([10.252.50.158])
 by orsmga004.jf.intel.com with ESMTP; 01 Aug 2019 23:27:04 -0700
Subject: Re: Threaded submission & semaphore sharing
To: "Koenig, Christian" <Christian.Koenig@amd.com>
References: <e2a1839e-1ee1-4ecb-9b18-af338046c0f1@email.android.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <9bd985bb-1dfb-b28d-e1da-efa5b41464c8@intel.com>
Date: Fri, 2 Aug 2019 09:27:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e2a1839e-1ee1-4ecb-9b18-af338046c0f1@email.android.com>
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
Content-Type: multipart/mixed; boundary="===============1911229185=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1911229185==
Content-Type: multipart/alternative;
 boundary="------------A06BA2D1204495EECF4D4E8B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A06BA2D1204495EECF4D4E8B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/08/2019 09:10, Koenig, Christian wrote:
>
>
> Am 02.08.2019 07:38 schrieb Lionel Landwerlin 
> <lionel.g.landwerlin@intel.com>:
>
>     On 02/08/2019 08:21, Koenig, Christian wrote:
>
>
>
>         Am 02.08.2019 07:17 schrieb Lionel Landwerlin
>         <lionel.g.landwerlin@intel.com>
>         <mailto:lionel.g.landwerlin@intel.com>:
>
>             On 02/08/2019 08:08, Koenig, Christian wrote:
>
>                 Hi Lionel,
>
>                 Well that looks more like your test case is buggy.
>
>                 According to the code the ctx1 queue always waits for
>                 sem1 and ctx2 queue always waits for sem2.
>
>
>             That's supposed to be the same underlying syncobj because
>             it's exported from one VkDevice as opaque FD from sem1 and
>             imported into sem2.
>
>
>         Well than that's still buggy and won't synchronize at all.
>
>         When ctx1 waits for a semaphore and then signals the same
>         semaphore there is no guarantee that ctx2 will run in between
>         jobs.
>
>         It's perfectly valid in this case to first run all jobs from
>         ctx1 and then all jobs from ctx2.
>
>
>     That's not really how I see the semaphores working.
>
>     The spec describe VkSemaphore as an interface to an internal
>     payload opaque to the application.
>
>
>     When ctx1 waits on the semaphore, it waits on the payload put
>     there by the previous iteration.
>
>
> And who says that it's not waiting for it's own previous payload?


That's was I understood from you previous comment : "there is no 
guarantee that ctx2 will run in between jobs"


>
> See if the payload is a counter this won't work either. Keep in mind 
> that this has the semantic of a semaphore. Whoever grabs the semaphore 
> first wins and can run, everybody else has to wait.


What performs the "grab" here?

I thought that would be vkQueueSubmit().

Since that occuring from a single application thread, that should then 
be ordered in execution of ctx1,ctx2,ctx1,...


Thanks for your time on this,


-Lionel


>
>     Then it proceeds to signal it by replacing the internal payload.
>
>
> That's an implementation detail of our sync objects, but I don't think 
> that this behavior is part of the Vulkan specification.
>
> Regards,
> Christian.
>
>
>     ctx2 then waits on that and replaces the payload again with the
>     new internal synchronization object.
>
>
>     The internal payload is a dma fence in our case and signaling just
>     replaces a dma fence by another or puts one where there was none
>     before.
>
>     So we should have created a dependecy link between all the
>     submissions and then should be executed in the order of
>     QueueSubmit() calls.
>
>
>     -Lionel
>
>
>
>         It only prevents running both at the same time and as far as I
>         can see that still works even with threaded submission.
>
>         You need at least two semaphores for a tandem submission.
>
>         Regards,
>         Christian.
>
>
>
>                 This way there can't be any Synchronisation between
>                 the two.
>
>                 Regards,
>                 Christian.
>
>                 Am 02.08.2019 06:55 schrieb Lionel Landwerlin
>                 <lionel.g.landwerlin@intel.com>
>                 <mailto:lionel.g.landwerlin@intel.com>:
>                 Hey Christian,
>
>                 The problem boils down to the fact that we don't
>                 immediately create dma fences when calling
>                 vkQueueSubmit().
>                 This is delayed to a thread.
>
>                 From a single application thread, you can
>                 QueueSubmit() to 2 queues from 2 different devices.
>                 Each QueueSubmit to one queue has a dependency on the
>                 previous QueueSubmit on the other queue through an
>                 exported/imported semaphore.
>
>                 From the API point of view the state of the semaphore
>                 should be changed after each QueueSubmit().
>                 The problem is that it's not because of the thread and
>                 because you might have those 2 submission threads tied
>                 to different VkDevice/VkInstance or even different
>                 applications (synchronizing themselves outside the
>                 vulkan API).
>
>                 Hope that makes sense.
>                 It's not really easy to explain by mail, the best
>                 explanation is probably reading the test :
>                 https://gitlab.freedesktop.org/mesa/crucible/blob/master/src/tests/func/sync/semaphore-fd.c#L788
>
>                 Like David mentioned you're not running into that
>                 issue right now, because you only dispatch to the
>                 thread under specific conditions.
>                 But I could build a case to force that and likely run
>                 into the same issue.
>
>                 -Lionel
>
>                 On 02/08/2019 07:33, Koenig, Christian wrote:
>
>                     Hi Lionel,
>
>                     Well could you describe once more what the problem is?
>
>                     Cause I don't fully understand why a rather normal
>                     tandem submission with two semaphores should fail
>                     in any way.
>
>                     Regards,
>                     Christian.
>
>                     Am 02.08.2019 06:28 schrieb Lionel Landwerlin
>                     <lionel.g.landwerlin@intel.com>
>                     <mailto:lionel.g.landwerlin@intel.com>:
>                     There aren't CTS tests covering the issue I was
>                     mentioning.
>                     But we could add them.
>
>                     I don't have all the details regarding your
>                     implementation but even with
>                     the "semaphore thread", I could see it running
>                     into the same issues.
>                     What if a mix of binary & timeline semaphores are
>                     handed to vkQueueSubmit()?
>
>                     For example with queueA & queueB from 2 different
>                     VkDevice :
>                          vkQueueSubmit(queueA, signal semA);
>                          vkQueueSubmit(queueA, wait on [semA,
>                     timelineSemB]); with
>                     timelineSemB triggering a wait before signal.
>                          vkQueueSubmit(queueB, signal semA);
>
>
>                     -Lionel
>
>                     On 02/08/2019 06:18, Zhou, David(ChunMing) wrote:
>                     > Hi Lionel,
>                     >
>                     > By the Queue thread is a heavy thread, which is
>                     always resident in driver during application
>                     running, our guys don't like that. So we switch to
>                     Semaphore Thread, only when waitBeforeSignal of
>                     timeline happens, we spawn a thread to handle that
>                     wait. So we don't have your this issue.
>                     > By the way, I already pass all your CTS cases
>                     for now. I suggest you to switch to Semaphore
>                     Thread instead of Queue Thread as well. It works
>                     very well.
>                     >
>                     > -David
>                     >
>                     > -----Original Message-----
>                     > From: Lionel Landwerlin
>                     <lionel.g.landwerlin@intel.com>
>                     <mailto:lionel.g.landwerlin@intel.com>
>                     > Sent: Friday, August 2, 2019 4:52 AM
>                     > To: dri-devel <dri-devel@lists.freedesktop.org>
>                     <mailto:dri-devel@lists.freedesktop.org>; Koenig,
>                     Christian <Christian.Koenig@amd.com>
>                     <mailto:Christian.Koenig@amd.com>; Zhou,
>                     David(ChunMing) <David1.Zhou@amd.com>
>                     <mailto:David1.Zhou@amd.com>; Jason Ekstrand
>                     <jason@jlekstrand.net> <mailto:jason@jlekstrand.net>
>                     > Subject: Threaded submission & semaphore sharing
>                     >
>                     > Hi Christian, David,
>                     >
>                     > Sorry to report this so late in the process, but
>                     I think we found an issue not directly related to
>                     syncobj timelines themselves but with a side
>                     effect of the threaded submissions.
>                     >
>                     > Essentially we're failing a test in crucible :
>                     > func.sync.semaphore-fd.opaque-fd
>                     > This test create a single binary semaphore,
>                     shares it between 2 VkDevice/VkQueue.
>                     > Then in a loop it proceeds to submit workload
>                     alternating between the 2 VkQueue with one submit
>                     depending on the other.
>                     > It does so by waiting on the VkSemaphore
>                     signaled in the previous iteration and resignaling it.
>                     >
>                     > The problem for us is that once things are
>                     dispatched to the submission thread, the ordering
>                     of the submission is lost.
>                     > Because we have 2 devices and they both have
>                     their own submission thread.
>                     >
>                     > Jason suggested that we reestablish the ordering
>                     by having semaphores/syncobjs carry an additional
>                     uint64_t payload.
>                     > This 64bit integer would represent be an
>                     identifier that submission threads will
>                     WAIT_FOR_AVAILABLE on.
>                     >
>                     > The scenario would look like this :
>                     >       - vkQueueSubmit(queueA, signal on semA);
>                     >           - in the caller thread, this would
>                     increment the syncobj additional u64 payload and
>                     return it to userspace.
>                     >           - at some point the submission thread
>                     of queueA submits the workload and signal the
>                     syncobj of semA with value returned in the caller
>                     thread of vkQueueSubmit().
>                     >       - vkQueueSubmit(queueB, wait on semA);
>                     >           - in the caller thread, this would
>                     read the syncobj additional
>                     > u64 payload
>                     >           - at some point the submission thread
>                     of queueB will try to submit the work, but first
>                     it will WAIT_FOR_AVAILABLE the u64 value returned
>                     in the step above
>                     >
>                     > Because we want the binary semaphores to be
>                     shared across processes and would like this to
>                     remain a single FD, the simplest location to store
>                     this additional u64 payload would be the DRM syncobj.
>                     > It would need an additional ioctl to read &
>                     increment the value.
>                     >
>                     > What do you think?
>                     >
>                     > -Lionel
>
>
>
>
>
>
>


--------------A06BA2D1204495EECF4D4E8B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 02/08/2019 09:10, Koenig, Christian
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e2a1839e-1ee1-4ecb-9b18-af338046c0f1@email.android.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="auto">
        <div><br>
          <div class="gmail_extra"><br>
            <div class="gmail_quote">Am 02.08.2019 07:38 schrieb Lionel
              Landwerlin <a class="moz-txt-link-rfc2396E" href="mailto:lionel.g.landwerlin@intel.com">&lt;lionel.g.landwerlin@intel.com&gt;</a>:<br
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
                                    <div dir="auto">Well that looks more
                                      like your test case is buggy.</div>
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
                        and then signals the same semaphore there is no
                        guarantee that ctx2 will run in between jobs.</div>
                      <div dir="auto"><br>
                      </div>
                      <div dir="auto">It's perfectly valid in this case
                        to first run all jobs from ctx1 and then all
                        jobs from ctx2.</div>
                    </div>
                  </blockquote>
                  <p><br>
                  </p>
                  <p>That's not really how I see the semaphores working.</p>
                  <p>The spec describe VkSemaphore as an interface to an
                    internal payload opaque to the application.</p>
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
        <div dir="auto">And who says that it's not waiting for it's own
          previous payload?</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>That's was I understood from you previous comment : "there is no
      guarantee that ctx2 will run in between jobs"</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:e2a1839e-1ee1-4ecb-9b18-af338046c0f1@email.android.com">
      <div dir="auto">
        <div dir="auto"><br>
        </div>
        <div dir="auto">See if the payload is a counter this won't work
          either. Keep in mind that this has the semantic of a
          semaphore. Whoever grabs the semaphore first wins and can run,
          everybody else has to wait.</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>What performs the "grab" here?</p>
    <p>I thought that would be vkQueueSubmit().</p>
    <p>Since that occuring from a single application thread, that should
      then be ordered in execution of ctx1,ctx2,ctx1,...<br>
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
                    again with the new internal synchronization object.</p>
                  <p><br>
                  </p>
                  <p>The internal payload is a dma fence in our case and
                    signaling just replaces a dma fence by another or
                    puts one where there was none before.</p>
                  <p>So we should have created a dependecy link between
                    all the submissions and then should be executed in
                    the order of QueueSubmit() calls.<br>
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
                        the same time and as far as I can see that still
                        works even with threaded submission.</div>
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
                                    <div dir="auto">This way there can't
                                      be any Synchronisation between the
                                      two.</div>
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
                                      thread, you can QueueSubmit() to 2
                                      queues from 2 different devices.</div>
                                    <div>Each QueueSubmit to one queue
                                      has a dependency on the previous
                                      QueueSubmit on the other queue
                                      through an exported/imported
                                      semaphore.</div>
                                    <div><br>
                                    </div>
                                    <div>From the API point of view the
                                      state of the semaphore should be
                                      changed after each QueueSubmit().</div>
                                    <div>The problem is that it's not
                                      because of the thread and because
                                      you might have those 2 submission
                                      threads tied to different
                                      VkDevice/VkInstance or even
                                      different applications
                                      (synchronizing themselves outside
                                      the vulkan API).</div>
                                    <div><br>
                                    </div>
                                    <div>Hope that makes sense.</div>
                                    <div>It's not really easy to explain
                                      by mail, the best explanation is
                                      probably reading the test :
                                      <a
href="https://gitlab.freedesktop.org/mesa/crucible/blob/master/src/tests/func/sync/semaphore-fd.c#L788"
                                        moz-do-not-send="true">
https://gitlab.freedesktop.org/mesa/crucible/blob/master/src/tests/func/sync/semaphore-fd.c#L788</a></div>
                                    <div><br>
                                    </div>
                                    <div>Like David mentioned you're not
                                      running into that issue right now,
                                      because you only dispatch to the
                                      thread under specific conditions.</div>
                                    <div>But I could build a case to
                                      force that and likely run into the
                                      same issue.<br>
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
                                          <div dir="auto">Well could you
                                            describe once more what the
                                            problem is?</div>
                                          <div dir="auto"><br>
                                          </div>
                                          <div dir="auto">Cause I don't
                                            fully understand why a
                                            rather normal tandem
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
                                            schrieb Lionel Landwerlin <a
href="mailto:lionel.g.landwerlin@intel.com" moz-do-not-send="true">
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
                                            I don't have all the details
                                            regarding your
                                            implementation but even with
                                            <br>
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
                                            &gt; By the Queue thread is
                                            a heavy thread, which is
                                            always resident in driver
                                            during application running,
                                            our guys don't like that. So
                                            we switch to Semaphore
                                            Thread, only when
                                            waitBeforeSignal of timeline
                                            happens, we spawn a thread
                                            to handle that wait. So we
                                            don't have your this issue.<br>
                                            &gt; By the way, I already
                                            pass all your CTS cases for
                                            now. I suggest you to switch
                                            to Semaphore Thread instead
                                            of Queue Thread as well. It
                                            works very well.<br>
                                            &gt;<br>
                                            &gt; -David<br>
                                            &gt;<br>
                                            &gt; -----Original
                                            Message-----<br>
                                            &gt; From: Lionel Landwerlin
                                            <a
                                              href="mailto:lionel.g.landwerlin@intel.com"
                                              moz-do-not-send="true">&lt;lionel.g.landwerlin@intel.com&gt;</a><br>
                                            &gt; Sent: Friday, August 2,
                                            2019 4:52 AM<br>
                                            &gt; To: dri-devel <a
                                              href="mailto:dri-devel@lists.freedesktop.org"
                                              moz-do-not-send="true">&lt;dri-devel@lists.freedesktop.org&gt;</a>;
                                            Koenig, Christian
                                            <a
                                              href="mailto:Christian.Koenig@amd.com"
                                              moz-do-not-send="true">&lt;Christian.Koenig@amd.com&gt;</a>;
                                            Zhou, David(ChunMing)
                                            <a
                                              href="mailto:David1.Zhou@amd.com"
                                              moz-do-not-send="true">&lt;David1.Zhou@amd.com&gt;</a>;
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
                                            &gt; Sorry to report this so
                                            late in the process, but I
                                            think we found an issue not
                                            directly related to syncobj
                                            timelines themselves but
                                            with a side effect of the
                                            threaded submissions.<br>
                                            &gt;<br>
                                            &gt; Essentially we're
                                            failing a test in crucible :<br>
                                            &gt;
                                            func.sync.semaphore-fd.opaque-fd<br>
                                            &gt; This test create a
                                            single binary semaphore,
                                            shares it between 2
                                            VkDevice/VkQueue.<br>
                                            &gt; Then in a loop it
                                            proceeds to submit workload
                                            alternating between the 2
                                            VkQueue with one submit
                                            depending on the other.<br>
                                            &gt; It does so by waiting
                                            on the VkSemaphore signaled
                                            in the previous iteration
                                            and resignaling it.<br>
                                            &gt;<br>
                                            &gt; The problem for us is
                                            that once things are
                                            dispatched to the submission
                                            thread, the ordering of the
                                            submission is lost.<br>
                                            &gt; Because we have 2
                                            devices and they both have
                                            their own submission thread.<br>
                                            &gt;<br>
                                            &gt; Jason suggested that we
                                            reestablish the ordering by
                                            having semaphores/syncobjs
                                            carry an additional uint64_t
                                            payload.<br>
                                            &gt; This 64bit integer
                                            would represent be an
                                            identifier that submission
                                            threads will
                                            WAIT_FOR_AVAILABLE on.<br>
                                            &gt;<br>
                                            &gt; The scenario would look
                                            like this :<br>
                                            &gt;       -
                                            vkQueueSubmit(queueA, signal
                                            on semA);<br>
                                            &gt;           - in the
                                            caller thread, this would
                                            increment the syncobj
                                            additional u64 payload and
                                            return it to userspace.<br>
                                            &gt;           - at some
                                            point the submission thread
                                            of queueA submits the
                                            workload and signal the
                                            syncobj of semA with value
                                            returned in the caller
                                            thread of vkQueueSubmit().<br>
                                            &gt;       -
                                            vkQueueSubmit(queueB, wait
                                            on semA);<br>
                                            &gt;           - in the
                                            caller thread, this would
                                            read the syncobj additional<br>
                                            &gt; u64 payload<br>
                                            &gt;           - at some
                                            point the submission thread
                                            of queueB will try to submit
                                            the work, but first it will
                                            WAIT_FOR_AVAILABLE the u64
                                            value returned in the step
                                            above<br>
                                            &gt;<br>
                                            &gt; Because we want the
                                            binary semaphores to be
                                            shared across processes and
                                            would like this to remain a
                                            single FD, the simplest
                                            location to store this
                                            additional u64 payload would
                                            be the DRM syncobj.<br>
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
  </body>
</html>

--------------A06BA2D1204495EECF4D4E8B--

--===============1911229185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1911229185==--
