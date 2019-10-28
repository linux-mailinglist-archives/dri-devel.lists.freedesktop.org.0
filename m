Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8C6E6DE1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34F26E42F;
	Mon, 28 Oct 2019 08:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7EB576E42F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 08:14:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 771F8720E2; Mon, 28 Oct 2019 08:14:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111659] Kernel panic when waking up after screens go to dpms
 sleep
Date: Mon, 28 Oct 2019 08:14:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: brad@fnarfbargle.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111659-502-F5oVXsXGpr@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111659-502@http.bugs.freedesktop.org/>
References: <bug-111659-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0914603339=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0914603339==
Content-Type: multipart/alternative; boundary="15722504560.0CE24DBcC.3703"
Content-Transfer-Encoding: 7bit


--15722504560.0CE24DBcC.3703
Date: Mon, 28 Oct 2019 08:14:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111659

--- Comment #5 from Brad Campbell <brad@fnarfbargle.com> ---
I was stating to suspect this might be a hardware problem, so I sourced a
similar machine with a Radeon 6770M. Unfortunately the same fault exhibits.

[ 2060.703207] Kernel panic - not syncing: stack-protector: Kernel stack is
corrupted in: radeon_dp_needs_link_train+0x69/0x70 [radeon]
[ 2060.703221] CPU: 2 PID: 1386 Comm: kworker/2:2 Not tainted 5.3.4+ #19
[ 2060.703223] Hardware name: Apple Inc. iMac12,2/Mac-942B59F58194171B, BIOS
82.0.0.0.0 09/25/2018
[ 2060.703238] Workqueue: events radeon_dp_work_func [radeon]
[ 2060.703241] Call Trace:
[ 2060.703248]  dump_stack+0x46/0x5b
[ 2060.703253]  panic+0xf3/0x288
[ 2060.703274]  ? radeon_dp_needs_link_train+0x69/0x70 [radeon]
[ 2060.703278]  __stack_chk_fail+0x10/0x10
[ 2060.703294]  radeon_dp_needs_link_train+0x69/0x70 [radeon]
[ 2060.703308]  radeon_connector_hotplug+0xa4/0xd0 [radeon]
[ 2060.703323]  radeon_dp_work_func+0x28/0x40 [radeon]
[ 2060.703326]  process_one_work+0x1b4/0x330
[ 2060.703329]  worker_thread+0x44/0x3d0
[ 2060.703333]  kthread+0xeb/0x120
[ 2060.703336]  ? process_one_work+0x330/0x330
[ 2060.703338]  ? kthread_park+0xa0/0xa0
[ 2060.703344]  ret_from_fork+0x1f/0x30
[ 2060.703382] Kernel Offset: disabled
[ 2060.703385] ---[ end Kernel panic - not syncing: stack-protector: Kernel
stack is corrupted in: radeon_dp_needs_link_train+0x69/0x70 [radeon] ]---

I'm now at a bit of a loss as to how to debug it. I can reproduce it reliab=
ly
by playing a 1080p video on each head with mplayer and triggering the OSD
(volume/brightness) changes. I can't bisect it with an earlier kernel becau=
se
it doesn't occur when using the internal panel, one Thunderbolt and one HDM=
I,
and the dual thunderbolt support only turned up in 5.2.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15722504560.0CE24DBcC.3703
Date: Mon, 28 Oct 2019 08:14:16 +0000
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
   title=3D"NEW - Kernel panic when waking up after screens go to dpms slee=
p"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111659#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel panic when waking up after screens go to dpms slee=
p"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111659">bug 11165=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
brad&#64;fnarfbargle.com" title=3D"Brad Campbell &lt;brad&#64;fnarfbargle.c=
om&gt;"> <span class=3D"fn">Brad Campbell</span></a>
</span></b>
        <pre>I was stating to suspect this might be a hardware problem, so =
I sourced a
similar machine with a Radeon 6770M. Unfortunately the same fault exhibits.

[ 2060.703207] Kernel panic - not syncing: stack-protector: Kernel stack is
corrupted in: radeon_dp_needs_link_train+0x69/0x70 [radeon]
[ 2060.703221] CPU: 2 PID: 1386 Comm: kworker/2:2 Not tainted 5.3.4+ #19
[ 2060.703223] Hardware name: Apple Inc. iMac12,2/Mac-942B59F58194171B, BIOS
82.0.0.0.0 09/25/2018
[ 2060.703238] Workqueue: events radeon_dp_work_func [radeon]
[ 2060.703241] Call Trace:
[ 2060.703248]  dump_stack+0x46/0x5b
[ 2060.703253]  panic+0xf3/0x288
[ 2060.703274]  ? radeon_dp_needs_link_train+0x69/0x70 [radeon]
[ 2060.703278]  __stack_chk_fail+0x10/0x10
[ 2060.703294]  radeon_dp_needs_link_train+0x69/0x70 [radeon]
[ 2060.703308]  radeon_connector_hotplug+0xa4/0xd0 [radeon]
[ 2060.703323]  radeon_dp_work_func+0x28/0x40 [radeon]
[ 2060.703326]  process_one_work+0x1b4/0x330
[ 2060.703329]  worker_thread+0x44/0x3d0
[ 2060.703333]  kthread+0xeb/0x120
[ 2060.703336]  ? process_one_work+0x330/0x330
[ 2060.703338]  ? kthread_park+0xa0/0xa0
[ 2060.703344]  ret_from_fork+0x1f/0x30
[ 2060.703382] Kernel Offset: disabled
[ 2060.703385] ---[ end Kernel panic - not syncing: stack-protector: Kernel
stack is corrupted in: radeon_dp_needs_link_train+0x69/0x70 [radeon] ]---

I'm now at a bit of a loss as to how to debug it. I can reproduce it reliab=
ly
by playing a 1080p video on each head with mplayer and triggering the OSD
(volume/brightness) changes. I can't bisect it with an earlier kernel becau=
se
it doesn't occur when using the internal panel, one Thunderbolt and one HDM=
I,
and the dual thunderbolt support only turned up in 5.2.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15722504560.0CE24DBcC.3703--

--===============0914603339==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0914603339==--
