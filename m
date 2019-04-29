Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CD3E3E1
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 15:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBE5891A3;
	Mon, 29 Apr 2019 13:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1DC2F891A3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 13:41:31 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 18D4172155; Mon, 29 Apr 2019 13:41:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110509] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
 timeout
Date: Mon, 29 Apr 2019 13:41:31 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: James.Dutton@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110509-502-Zw3XXlfltL@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110509-502@http.bugs.freedesktop.org/>
References: <bug-110509-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============1948748831=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1948748831==
Content-Type: multipart/alternative; boundary="15565452910.d19b68.5256"
Content-Transfer-Encoding: 7bit


--15565452910.d19b68.5256
Date: Mon, 29 Apr 2019 13:41:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110509

--- Comment #6 from James.Dutton@gmail.com ---
I think I have found the problem.
[  657.526313] amdgpu 0000:43:00.0: GPU reset begin!
[  657.526318] Evicting PASID 32782 queues
[  667.756000] [drm:amdgpu_dm_atomic_check [amdgpu]] *ERROR* [CRTC:49:crtc-=
0]
hw_done or flip_done timed out


The intention is to do a GPU reset, but the implementation in the code is j=
ust
to try and do a suspend.
Part of the suspend does this:

Apr 29 14:29:19 thread kernel: [  363.445607] INFO: task kworker/u258:0:55
blocked for more than 120 seconds.
Apr 29 14:29:19 thread kernel: [  363.445612]       Not tainted 5.0.10-dirty
#26
Apr 29 14:29:19 thread kernel: [  363.445613] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Apr 29 14:29:19 thread kernel: [  363.445615] kworker/u258:0  D    0    55=
=20=20=20=20=20
2 0x80000000
Apr 29 14:29:19 thread kernel: [  363.445628] Workqueue: events_unbound
commit_work [drm_kms_helper]
Apr 29 14:29:19 thread kernel: [  363.445629] Call Trace:
Apr 29 14:29:19 thread kernel: [  363.445635]  __schedule+0x2c0/0x880
Apr 29 14:29:19 thread kernel: [  363.445637]  schedule+0x2c/0x70
Apr 29 14:29:19 thread kernel: [  363.445639]  schedule_timeout+0x1db/0x360
Apr 29 14:29:19 thread kernel: [  363.445641]  ? update_load_avg+0x8b/0x590
Apr 29 14:29:19 thread kernel: [  363.445645]=20
dma_fence_default_wait+0x1eb/0x270
Apr 29 14:29:19 thread kernel: [  363.445647]  ? dma_fence_release+0xa0/0xa0
Apr 29 14:29:19 thread kernel: [  363.445649]=20
dma_fence_wait_timeout+0xfd/0x110
Apr 29 14:29:19 thread kernel: [  363.445651]=20
reservation_object_wait_timeout_rcu+0x17d/0x370
Apr 29 14:29:19 thread kernel: [  363.445710]  amdgpu_dm_do_flip+0x14a/0x4a0
[amdgpu]
Apr 29 14:29:19 thread kernel: [  363.445767]=20
amdgpu_dm_atomic_commit_tail+0x7b7/0xc10 [amdgpu]
Apr 29 14:29:19 thread kernel: [  363.445820]  ?
amdgpu_dm_atomic_commit_tail+0x7b7/0xc10 [amdgpu]
Apr 29 14:29:19 thread kernel: [  363.445828]  commit_tail+0x42/0x70
[drm_kms_helper]
Apr 29 14:29:19 thread kernel: [  363.445835]  commit_work+0x12/0x20
[drm_kms_helper]
Apr 29 14:29:19 thread kernel: [  363.445838]  process_one_work+0x1fd/0x400
Apr 29 14:29:19 thread kernel: [  363.445840]  worker_thread+0x34/0x410
Apr 29 14:29:19 thread kernel: [  363.445841]  kthread+0x121/0x140
Apr 29 14:29:19 thread kernel: [  363.445843]  ? process_one_work+0x400/0x4=
00
Apr 29 14:29:19 thread kernel: [  363.445844]  ? kthread_park+0x90/0x90
Apr 29 14:29:19 thread kernel: [  363.445847]  ret_from_fork+0x22/0x40


So, amggpu_dm_do_flip()  is the bit that hangs.
If the GPU needs to be reset because some of it has hung, trying a "flip" is
unlikely to work.
It is failing/hanging when doing "suspend of IP block <dm>" in
amdgpu_device_ip_suspend_phase1().

I would suggest creating code that actually tries to reset the GPU, instead=
 of
trying to suspend it while GPU is hung.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15565452910.d19b68.5256
Date: Mon, 29 Apr 2019 13:41:31 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110509#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110509">bug 11050=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
James.Dutton&#64;gmail.com" title=3D"James.Dutton&#64;gmail.com">James.Dutt=
on&#64;gmail.com</a>
</span></b>
        <pre>I think I have found the problem.
[  657.526313] amdgpu 0000:43:00.0: GPU reset begin!
[  657.526318] Evicting PASID 32782 queues
[  667.756000] [drm:amdgpu_dm_atomic_check [amdgpu]] *ERROR* [CRTC:49:crtc-=
0]
hw_done or flip_done timed out


The intention is to do a GPU reset, but the implementation in the code is j=
ust
to try and do a suspend.
Part of the suspend does this:

Apr 29 14:29:19 thread kernel: [  363.445607] INFO: task kworker/u258:0:55
blocked for more than 120 seconds.
Apr 29 14:29:19 thread kernel: [  363.445612]       Not tainted 5.0.10-dirty
#26
Apr 29 14:29:19 thread kernel: [  363.445613] &quot;echo 0 &gt;
/proc/sys/kernel/hung_task_timeout_secs&quot; disables this message.
Apr 29 14:29:19 thread kernel: [  363.445615] kworker/u258:0  D    0    55=
=20=20=20=20=20
2 0x80000000
Apr 29 14:29:19 thread kernel: [  363.445628] Workqueue: events_unbound
commit_work [drm_kms_helper]
Apr 29 14:29:19 thread kernel: [  363.445629] Call Trace:
Apr 29 14:29:19 thread kernel: [  363.445635]  __schedule+0x2c0/0x880
Apr 29 14:29:19 thread kernel: [  363.445637]  schedule+0x2c/0x70
Apr 29 14:29:19 thread kernel: [  363.445639]  schedule_timeout+0x1db/0x360
Apr 29 14:29:19 thread kernel: [  363.445641]  ? update_load_avg+0x8b/0x590
Apr 29 14:29:19 thread kernel: [  363.445645]=20
dma_fence_default_wait+0x1eb/0x270
Apr 29 14:29:19 thread kernel: [  363.445647]  ? dma_fence_release+0xa0/0xa0
Apr 29 14:29:19 thread kernel: [  363.445649]=20
dma_fence_wait_timeout+0xfd/0x110
Apr 29 14:29:19 thread kernel: [  363.445651]=20
reservation_object_wait_timeout_rcu+0x17d/0x370
Apr 29 14:29:19 thread kernel: [  363.445710]  amdgpu_dm_do_flip+0x14a/0x4a0
[amdgpu]
Apr 29 14:29:19 thread kernel: [  363.445767]=20
amdgpu_dm_atomic_commit_tail+0x7b7/0xc10 [amdgpu]
Apr 29 14:29:19 thread kernel: [  363.445820]  ?
amdgpu_dm_atomic_commit_tail+0x7b7/0xc10 [amdgpu]
Apr 29 14:29:19 thread kernel: [  363.445828]  commit_tail+0x42/0x70
[drm_kms_helper]
Apr 29 14:29:19 thread kernel: [  363.445835]  commit_work+0x12/0x20
[drm_kms_helper]
Apr 29 14:29:19 thread kernel: [  363.445838]  process_one_work+0x1fd/0x400
Apr 29 14:29:19 thread kernel: [  363.445840]  worker_thread+0x34/0x410
Apr 29 14:29:19 thread kernel: [  363.445841]  kthread+0x121/0x140
Apr 29 14:29:19 thread kernel: [  363.445843]  ? process_one_work+0x400/0x4=
00
Apr 29 14:29:19 thread kernel: [  363.445844]  ? kthread_park+0x90/0x90
Apr 29 14:29:19 thread kernel: [  363.445847]  ret_from_fork+0x22/0x40


So, amggpu_dm_do_flip()  is the bit that hangs.
If the GPU needs to be reset because some of it has hung, trying a &quot;fl=
ip&quot; is
unlikely to work.
It is failing/hanging when doing &quot;suspend of IP block &lt;dm&gt;&quot;=
 in
amdgpu_device_ip_suspend_phase1().

I would suggest creating code that actually tries to reset the GPU, instead=
 of
trying to suspend it while GPU is hung.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15565452910.d19b68.5256--

--===============1948748831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1948748831==--
