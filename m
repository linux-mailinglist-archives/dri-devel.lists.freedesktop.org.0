Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E543E219E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 19:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A156EB54;
	Wed, 23 Oct 2019 17:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 038186EB56
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 17:18:45 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 00D18720E2; Wed, 23 Oct 2019 17:18:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Wed, 23 Oct 2019 17:18:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: yamagi@yamagi.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-poZhpghs7K@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0391875648=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0391875648==
Content-Type: multipart/alternative; boundary="157185112412.b8fa7ac.1869"
Content-Transfer-Encoding: 7bit


--157185112412.b8fa7ac.1869
Date: Wed, 23 Oct 2019 17:18:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #128 from yamagi@yamagi.org ---
(In reply to yamagi from comment #124)
> Interestingly I've got the problem the other way round. My 5700XT was
> running fine since I got it about two weeks ago. This is Arch Linux, I've
> run Mesa 19.2.1 and llvm-libs 9.0.0 since day one. The card was stable wi=
th
> 5.4-RC2 and 5.4-RC3, not a single hang in about 10 hours The Witcher 3 un=
der
> wine + dxvk and Yamagi Quake II with OpenGL 3.2 renderer. After I upgraded
> to 5.4-RC4 I've seen several GPU hangs. The last one, and the only one
> that's still in the logs was:
>=20
> [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout, signaled
> seq=3D85270, emitted seq=3D85272
>=20
> That one was in Yamagi Quake II, but I had hangs on the desktop and in The
> Witcher 3. I have no umr reports so far. I've just compiled the tool and
> will see if I can get some.


As promised, some more informations:

For me the crash is fairly easy to reproduce with Linux 5.4-RC4. All it tak=
es
is Yamagi Quake II (Revision 1232289, can be found at
https://github.com/yquake2/yquake2) with OpenGL 3.2 renderer. The old OpenGL
1.4 doesn't trigger it. Start the game, it's a good idea to set set timedemo
mode to 1, and just let it cycle through the demo loop until it crashes. I =
used
'./quake +set timedemo 1 +set vid_renderer gl3'. I've never experienced this
crash in the wild with Linux 5.4-RC3 until I learned that I can trigger with
the Quake II demo loop. In Linux 5.4-RC3 it usually takes somewhere between=
 20
to 30 cycles through loop to trigger, with 5.4-RC4 only 5 to 10 cycles. So
something changed between RC3 and RC4 that made it more likely.

I suspect some kind of timing issue. The demo loop is deterministic, it
generates exactly the same API calls each time it's run. While the crash al=
ways
happens while the loading screen is up, it never occures at the same one.
Sometimes it's in the fifth iteration, the next time at the 12th and so on.
Putting apitrace (adds some latency!) onto it, makes it much less likely to
occure. To the point I thought that it's a heisenbug. The same goes for cyc=
ling
through the loop without timedemo mode enabled (~20 FPS in normal mode, ~10=
00
FPS in timedemo mode).

I made an apitrace for easier reproduction. It's a little bit big for bugzi=
lla,
so I've uploaded it here: https://deponie.yamagi.org/temp/quake2.trace.xz
Replaying it usually triggers the crash during the first or second run.

The exact software versions were:
* Linux 5.4-RC4 with https://bugzilla.freedesktop.org/attachment.cgi?id=3D1=
45323
and https://bugzilla.freedesktop.org/attachment.cgi?id=3D145734 applied.
* Mesa 19.2.1-2
* LLVM 9.0.0

dmesg output after a crash in Quake IIs demo loop is:
[  122.294181] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeou=
t,
signaled seq=3D177737, emitted seq=3D177739
[  122.294256] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process glretrace pid 1302 thread glretrace:cs0 pid 1303
[  122.294257] [drm] GPU recovery disabled.

dmesg output after a crash by replaying the apitrace is:
[  266.695388] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeou=
t,
signaled seq=3D27598, emitted seq=3D27600
[  266.695463] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process glretrace pid 1372 thread glretrace:cs0 pid 1373
[  266.695465] [drm] GPU recovery disabled.

I'm attaching the state of sdma0 is both cases.

I hope this helps to find the root cause of this. If can provide more
informations don't hesitate to ask.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--157185112412.b8fa7ac.1869
Date: Wed, 23 Oct 2019 17:18:44 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c128">Comm=
ent # 128</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
yamagi&#64;yamagi.org" title=3D"yamagi&#64;yamagi.org">yamagi&#64;yamagi.or=
g</a>
</span></b>
        <pre>(In reply to yamagi from <a href=3D"show_bug.cgi?id=3D111481#c=
124">comment #124</a>)
<span class=3D"quote">&gt; Interestingly I've got the problem the other way=
 round. My 5700XT was
&gt; running fine since I got it about two weeks ago. This is Arch Linux, I=
've
&gt; run Mesa 19.2.1 and llvm-libs 9.0.0 since day one. The card was stable=
 with
&gt; 5.4-RC2 and 5.4-RC3, not a single hang in about 10 hours The Witcher 3=
 under
&gt; wine + dxvk and Yamagi Quake II with OpenGL 3.2 renderer. After I upgr=
aded
&gt; to 5.4-RC4 I've seen several GPU hangs. The last one, and the only one
&gt; that's still in the logs was:
&gt;=20
&gt; [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeout, signaled
&gt; seq=3D85270, emitted seq=3D85272
&gt;=20
&gt; That one was in Yamagi Quake II, but I had hangs on the desktop and in=
 The
&gt; Witcher 3. I have no umr reports so far. I've just compiled the tool a=
nd
&gt; will see if I can get some.</span >


As promised, some more informations:

For me the crash is fairly easy to reproduce with Linux 5.4-RC4. All it tak=
es
is Yamagi Quake II (Revision 1232289, can be found at
<a href=3D"https://github.com/yquake2/yquake2">https://github.com/yquake2/y=
quake2</a>) with OpenGL 3.2 renderer. The old OpenGL
1.4 doesn't trigger it. Start the game, it's a good idea to set set timedemo
mode to 1, and just let it cycle through the demo loop until it crashes. I =
used
'./quake +set timedemo 1 +set vid_renderer gl3'. I've never experienced this
crash in the wild with Linux 5.4-RC3 until I learned that I can trigger with
the Quake II demo loop. In Linux 5.4-RC3 it usually takes somewhere between=
 20
to 30 cycles through loop to trigger, with 5.4-RC4 only 5 to 10 cycles. So
something changed between RC3 and RC4 that made it more likely.

I suspect some kind of timing issue. The demo loop is deterministic, it
generates exactly the same API calls each time it's run. While the crash al=
ways
happens while the loading screen is up, it never occures at the same one.
Sometimes it's in the fifth iteration, the next time at the 12th and so on.
Putting apitrace (adds some latency!) onto it, makes it much less likely to
occure. To the point I thought that it's a heisenbug. The same goes for cyc=
ling
through the loop without timedemo mode enabled (~20 FPS in normal mode, ~10=
00
FPS in timedemo mode).

I made an apitrace for easier reproduction. It's a little bit big for bugzi=
lla,
so I've uploaded it here: <a href=3D"https://deponie.yamagi.org/temp/quake2=
.trace.xz">https://deponie.yamagi.org/temp/quake2.trace.xz</a>
Replaying it usually triggers the crash during the first or second run.

The exact software versions were:
* Linux 5.4-RC4 with <a href=3D"https://bugzilla.freedesktop.org/attachment=
.cgi?id=3D145323">https://bugzilla.freedesktop.org/attachment.cgi?id=3D1453=
23</a>
and <a href=3D"https://bugzilla.freedesktop.org/attachment.cgi?id=3D145734"=
>https://bugzilla.freedesktop.org/attachment.cgi?id=3D145734</a> applied.
* Mesa 19.2.1-2
* LLVM 9.0.0

dmesg output after a crash in Quake IIs demo loop is:
[  122.294181] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeou=
t,
signaled seq=3D177737, emitted seq=3D177739
[  122.294256] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process glretrace pid 1302 thread glretrace:cs0 pid 1303
[  122.294257] [drm] GPU recovery disabled.

dmesg output after a crash by replaying the apitrace is:
[  266.695388] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 timeou=
t,
signaled seq=3D27598, emitted seq=3D27600
[  266.695463] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process glretrace pid 1372 thread glretrace:cs0 pid 1373
[  266.695465] [drm] GPU recovery disabled.

I'm attaching the state of sdma0 is both cases.

I hope this helps to find the root cause of this. If can provide more
informations don't hesitate to ask.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--157185112412.b8fa7ac.1869--

--===============0391875648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0391875648==--
