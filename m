Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19088714BB3
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 16:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE3C10E2B6;
	Mon, 29 May 2023 14:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 333 seconds by postgrey-1.36 at gabe;
 Sun, 28 May 2023 16:13:15 UTC
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A7110E0C4
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 16:13:15 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 0D05DA057B;
 Sun, 28 May 2023 18:07:38 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix03.mail.de (Postfix) with ESMTP id DF59180167;
 Sun, 28 May 2023 18:07:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.de;
 s=mailde202009; t=1685290057;
 bh=jbdBDEoDfa3wd6UezV3SKzDHPpmIyDBt/01cvcW/N+M=;
 h=Message-ID:Date:From:Subject:To:Cc:From:To:CC:Subject:Reply-To;
 b=dBWH1YHTqPOFywHR7fRjjgwB6GVuHVwoEDuaGFomZD9XwNbyvlGtbX7PbsTYtgkgW
 xjS8uO6VcPEBOXZ5C2ZaaeyHLYuK1VVvJ/DA208S1UagUt4JKa7Z4dwU3r44QfpJEj
 JnPKBy9M95N/ytv3d4OKgVa06QlZGbQSboe+kBbDWv5/HhG936rv/u8N29t9saCp9R
 aPRLWpBJnxuFv8ajD4EUQri8EF28eOH3t9Z1v8EHLyURAFG3736RVSfzJRrescQtdr
 Mok2lyKY/4x8X6fvvcqQUEwSBvcdTKuXgleee5IgLuPZ2Wr0qonRIIRGwtzFkvkGQC
 GDULNH7hGAsOQ==
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id C3965C002F;
 Sun, 28 May 2023 18:07:36 +0200 (CEST)
Content-Type: multipart/alternative;
 boundary="------------twp9QAV8Oe1mg0IKdMdmtPxl"
Message-ID: <69d51cd5-732f-9dc5-4e12-d68990132c85@my.mail.de>
Date: Sun, 28 May 2023 18:07:36 +0200
MIME-Version: 1.0
From: Christopher Klooz <py0xc3@my.mail.de>
Subject: Kernel bug related to drivers/gpu/drm/ttm/ttm_bo.c
To: christian.koenig@amd.com, ray.huang@amd.com
Content-Language: en-US
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 8045
X-purgate-ID: 154282::1685290057-B57FCC09-47B9BF0D/0/0
X-Mailman-Approved-At: Mon, 29 May 2023 14:08:20 +0000
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------twp9QAV8Oe1mg0IKdMdmtPxl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi!

I think we have a serious kernel bug that is related to or inside in 
drivers/gpu/drm/ttm/ttm_bo.c

The reason for my assumptions lies in one of my recent system freezes 
with kernel 6.3.4 that go along with massive kernel error logs in 
journalctl. An extract from the logs:

...
May 28 14:38:41 fedora.domain kernel: WARNING: CPU: 4 PID: 5523 at drivers/gpu/drm/ttm/ttm_bo.c:326 ttm_bo_release+0x289/0x2e0 [ttm]
...
May 28 14:38:41 fedora.domain kernel: WARNING: CPU: 4 PID: 5523 at drivers/gpu/drm/ttm/ttm_bo.c:327 ttm_bo_release+0x296/0x2e0 [ttm]
...
May 28 14:38:41 fedora.domain kernel: kernel BUG at drivers/gpu/drm/ttm/ttm_bo.c:193!
...

The above information is more detailed than most of the occurrences, and 
its the first occurrence that did not end up in a freeze immediately or 
a few seconds after it. However, the corrupted state of the system 
became again apparent when I tried to shutdown some time after the above 
errors:

...

|May 28 14:51:09 fedora.domain kernel: #PF: error_code(0x0000) - 
not-present page May 28 14:51:09 fedora.domain kernel: #PF: supervisor 
read access in kernel mode May 28 14:51:09 fedora.domain kernel: BUG: 
unable to handle page fault for address: 0000003000300010|
...

I have that issue already for a longer time, at least since 6.2.X.

You can find my bug report and many full logs (including the full logs 
of the above) from root's journalctl in: 
https://bugzilla.redhat.com/show_bug.cgi?id=2193110

Ignore the title and the initial comments of the bug report, it is 
definitely not related to Firefox. Assuming that you want to focus on 
the kernel error logs of 6.3.X, you might focus only on the last 5 comments.

Additionally to the journalctl error logs that I already added through 
links in the bug report, I tested today once again 6.3.4 with 
amd_pstate=active (by default I am on amd_state=passive which feels most 
stable on my hardware) -> see 
https://gitlab.com/py0xc31/public-tmp-storage/-/blob/main/retry6.3.4/fullSystemFreeze.kernel6.3.4.pstate-ACTIVE.log 
(I have not yet put this into the bug report since I no longer assume it 
is relevant)


Some other people from Fedora have experienced related issues; see the 
comments on the test result pages in our update system:

https://bodhi.fedoraproject.org/updates/FEDORA-2023-514965dd8a (6.3.3 & 
6.3.4)

https://bodhi.fedoraproject.org/updates/FEDORA-2023-26325e5399 (6.2.15) 
-> I am quite sure I have seen that issue already before 6.2.15.

Maybe also related (but without explicit information referring to ttm_bo.c):

https://gitlab.freedesktop.org/drm/amd/-/issues/2548

https://gitlab.freedesktop.org/drm/amd/-/issues/2447


Let me know if you need more information or if I can help with testing.

My hardware: AMD Ryzen 6850 Pro, I have no dedicated graphics but only 
the AMD graphics of my Ryzen. I use Fedora 38 KDE -> cat 
/proc/sys/kernel/tainted = 0.

I will try updating my BIOS in the next days when I have time to see if 
that makes a difference, but I guess this is not related given the logs.


Regards,

Chris

--------------twp9QAV8Oe1mg0IKdMdmtPxl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi!</p>
    <p>I think we have a serious kernel bug that is related to or inside
      in drivers/gpu/drm/ttm/ttm_bo.c</p>
    <p>The reason for my assumptions lies in one of my recent system
      freezes with kernel 6.3.4 that go along with massive kernel error
      logs in journalctl. An extract from the logs:</p>
    <pre class="bz_comment_text" id="comment_text_18">...
May 28 14:38:41 fedora.domain kernel: WARNING: CPU: 4 PID: 5523 at drivers/gpu/drm/ttm/ttm_bo.c:326 ttm_bo_release+0x289/0x2e0 [ttm]
...
May 28 14:38:41 fedora.domain kernel: WARNING: CPU: 4 PID: 5523 at drivers/gpu/drm/ttm/ttm_bo.c:327 ttm_bo_release+0x296/0x2e0 [ttm]
...
May 28 14:38:41 fedora.domain kernel: kernel BUG at drivers/gpu/drm/ttm/ttm_bo.c:193!
...</pre>
    <p>The above information is more detailed than most of the
      occurrences, and its the first occurrence that did not end up in a
      freeze immediately or a few seconds after it. However, the
      corrupted state of the system became again apparent when I tried
      to shutdown some time after the above errors:</p>
    <pre class="bz_comment_text" id="comment_text_18">...</pre>
    <p></p>
    <pre><code>May 28 14:51:09 fedora.domain kernel: #PF: error_code(0x0000) - not-present page
May 28 14:51:09 fedora.domain kernel: #PF: supervisor read access in kernel mode
May 28 14:51:09 fedora.domain kernel: BUG: unable to handle page fault for address: 0000003000300010</code>
...
</pre>
    <p>I have that issue already for a longer time, at least since
      6.2.X.</p>
    <p>You can find my bug report and many full logs (including the full
      logs of the above) from root's journalctl in: <a
        class="moz-txt-link-freetext"
        href="https://bugzilla.redhat.com/show_bug.cgi?id=2193110">https://bugzilla.redhat.com/show_bug.cgi?id=2193110</a></p>
    <p>Ignore the title and the initial comments of the bug report, it
      is definitely not related to Firefox. Assuming that you want to
      focus on the kernel error logs of 6.3.X, you might focus only on
      the last 5 comments.</p>
    <p>Additionally to the journalctl error logs that I already added
      through links in the bug report, I tested today once again 6.3.4
      with amd_pstate=active (by default I am on amd_state=passive which
      feels most stable on my hardware) -&gt; see
      <a class="moz-txt-link-freetext"
href="https://gitlab.com/py0xc31/public-tmp-storage/-/blob/main/retry6.3.4/fullSystemFreeze.kernel6.3.4.pstate-ACTIVE.log">https://gitlab.com/py0xc31/public-tmp-storage/-/blob/main/retry6.3.4/fullSystemFreeze.kernel6.3.4.pstate-ACTIVE.log</a>
      (I have not yet put this into the bug report since I no longer
      assume it is relevant)</p>
    <p><br>
    </p>
    <p>Some other people from Fedora have experienced related issues;
      see the comments on the test result pages in our update system:<br>
    </p>
    <p><a class="moz-txt-link-freetext"
        href="https://bodhi.fedoraproject.org/updates/FEDORA-2023-514965dd8a">https://bodhi.fedoraproject.org/updates/FEDORA-2023-514965dd8a</a>
      (6.3.3 &amp; 6.3.4)<br>
    </p>
    <p><a class="moz-txt-link-freetext"
        href="https://bodhi.fedoraproject.org/updates/FEDORA-2023-26325e5399">https://bodhi.fedoraproject.org/updates/FEDORA-2023-26325e5399</a>
      (6.2.15) -&gt; I am quite sure I have seen that issue already
      before 6.2.15.</p>
    <p>Maybe also related (but without explicit information referring to
      ttm_bo.c):</p>
    <p><a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/amd/-/issues/2548">https://gitlab.freedesktop.org/drm/amd/-/issues/2548</a></p>
    <p><a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/amd/-/issues/2447">https://gitlab.freedesktop.org/drm/amd/-/issues/2447</a><br>
    </p>
    <p><br>
    </p>
    <p>Let me know if you need more information or if I can help with
      testing. <br>
    </p>
    <p>My hardware: AMD Ryzen 6850 Pro, I have no dedicated graphics but
      only the AMD graphics of my Ryzen. I use Fedora 38 KDE -&gt; cat
      /proc/sys/kernel/tainted = 0.<br>
    </p>
    <p>I will try updating my BIOS in the next days when I have time to
      see if that makes a difference, but I guess this is not related
      given the logs.</p>
    <br>
    <p>Regards,</p>
    <p>Chris<br>
    </p>
  </body>
</html>

--------------twp9QAV8Oe1mg0IKdMdmtPxl--
