Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153A26CCF9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 12:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156726E395;
	Thu, 18 Jul 2019 10:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 689D66E395
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 10:50:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6507D72167; Thu, 18 Jul 2019 10:50:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110258] Lenovo V110-15AST AMD A9-9410  AMD R5 Stoney hangs
 after waking after suspend. 5.0-5.1rc2
Date: Thu, 18 Jul 2019 10:50:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: pmw.gover@yahoo.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110258-502-XpAA7MnWQF@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110258-502@http.bugs.freedesktop.org/>
References: <bug-110258-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1513094595=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1513094595==
Content-Type: multipart/alternative; boundary="15634470252.f922b.30623"
Content-Transfer-Encoding: 7bit


--15634470252.f922b.30623
Date: Thu, 18 Jul 2019 10:50:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110258

--- Comment #8 from Paul Gover <pmw.gover@yahoo.co.uk> ---
Git bisect:

106c7d6148e5aadd394e6701f7e498df49b869d1 is the first bad commit
commit 106c7d6148e5aadd394e6701f7e498df49b869d1
Author: Likun Gao <Likun.Gao@amd.com>
Date:   Thu Nov 8 20:19:54 2018 +0800

    drm/amdgpu: abstract the function of enter/exit safe mode for RLC

    Abstract the function of amdgpu_gfx_rlc_enter/exit_safe_mode and some p=
art
of
    rlc_init to improve the reusability of RLC.

    Signed-off-by: Likun Gao <Likun.Gao@amd.com>
    Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
    Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

:040000 040000 8f3b365496f3bbd380a62032f20642ace51c8fef
e14ec968011019e3f601df3f15682bb9ae0bafc6 M      drivers

This run on my HP 15-bw0xx
cpu:AMD A9-9420 RADEON R5, 5 COMPUTE CORES 2C+3G
with integrated graphics:
Stoney [Radeon R2/R3/R4/R5 Graphics] [1002:98E4]

I get the same symptoms as above;
a more involved scenario that may shed light is to switch to a tty and stop=
 xdm
(and hence sddm) so I have no graphics sessions running.
pm-suspend followed by resume works and brings me back to the tty, but when=
 I
then start xdm, I get a broken screen, usually garbage or grey, and syslog
shows something like the following:
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, signaled seq=
=3D49,
emitted seq=3D51
[drm] IP block:gfx_v8_0 is hung!
[drm] GPU recovery disabled.

If I enable amdgpu.gpu_recovery=3D1
kernel: [  279.726475] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
timeout, signaled seq=3D57, emitted seq=3D59
kernel: [  279.726536] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
information: process X pid 2860 thread X:cs0 pid 2861
kernel: [  279.726542] [drm] IP block:gfx_v8_0 is hung!
kernel: [  279.726609] amdgpu 0000:00:01.0: GPU reset begin!
kernel: [  279.726992] amdgpu 0000:00:01.0: GRBM_SOFT_RESET=3D0x000F0001
kernel: [  279.727047] amdgpu 0000:00:01.0: SRBM_SOFT_RESET=3D0x00000100
kernel: [  279.863162] [drm] recover vram bo from shadow start
kernel: [  279.863164] [drm] recover vram bo from shadow done
kernel: [  279.863166] [drm] Skip scheduling IBs!
kernel: [  279.863191] amdgpu 0000:00:01.0: GPU reset(2) succeeded!
kernel: [  280.015794] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to
initialize parser -125!

I can probably run diagnostics or collect a trace if someone tells me what =
and
how.

The problem persists - I still get it running kernel 5.2.1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15634470252.f922b.30623
Date: Thu, 18 Jul 2019 10:50:25 +0000
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
   title=3D"NEW - Lenovo V110-15AST AMD A9-9410 AMD R5 Stoney hangs after w=
aking after suspend. 5.0-5.1rc2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110258#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Lenovo V110-15AST AMD A9-9410 AMD R5 Stoney hangs after w=
aking after suspend. 5.0-5.1rc2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110258">bug 11025=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pmw.gover&#64;yahoo.co.uk" title=3D"Paul Gover &lt;pmw.gover&#64;yahoo.co.u=
k&gt;"> <span class=3D"fn">Paul Gover</span></a>
</span></b>
        <pre>Git bisect:

106c7d6148e5aadd394e6701f7e498df49b869d1 is the first bad commit
commit 106c7d6148e5aadd394e6701f7e498df49b869d1
Author: Likun Gao &lt;<a href=3D"mailto:Likun.Gao&#64;amd.com">Likun.Gao&#6=
4;amd.com</a>&gt;
Date:   Thu Nov 8 20:19:54 2018 +0800

    drm/amdgpu: abstract the function of enter/exit safe mode for RLC

    Abstract the function of amdgpu_gfx_rlc_enter/exit_safe_mode and some p=
art
of
    rlc_init to improve the reusability of RLC.

    Signed-off-by: Likun Gao &lt;<a href=3D"mailto:Likun.Gao&#64;amd.com">L=
ikun.Gao&#64;amd.com</a>&gt;
    Acked-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig&#=
64;amd.com">christian.koenig&#64;amd.com</a>&gt;
    Reviewed-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64;a=
md.com">alexander.deucher&#64;amd.com</a>&gt;
    Signed-off-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64=
;amd.com">alexander.deucher&#64;amd.com</a>&gt;

:040000 040000 8f3b365496f3bbd380a62032f20642ace51c8fef
e14ec968011019e3f601df3f15682bb9ae0bafc6 M      drivers

This run on my HP 15-bw0xx
cpu:AMD A9-9420 RADEON R5, 5 COMPUTE CORES 2C+3G
with integrated graphics:
Stoney [Radeon R2/R3/R4/R5 Graphics] [1002:98E4]

I get the same symptoms as above;
a more involved scenario that may shed light is to switch to a tty and stop=
 xdm
(and hence sddm) so I have no graphics sessions running.
pm-suspend followed by resume works and brings me back to the tty, but when=
 I
then start xdm, I get a broken screen, usually garbage or grey, and syslog
shows something like the following:
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, signaled seq=
=3D49,
emitted seq=3D51
[drm] IP block:gfx_v8_0 is hung!
[drm] GPU recovery disabled.

If I enable amdgpu.gpu_recovery=3D1
kernel: [  279.726475] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
timeout, signaled seq=3D57, emitted seq=3D59
kernel: [  279.726536] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
information: process X pid 2860 thread X:cs0 pid 2861
kernel: [  279.726542] [drm] IP block:gfx_v8_0 is hung!
kernel: [  279.726609] amdgpu 0000:00:01.0: GPU reset begin!
kernel: [  279.726992] amdgpu 0000:00:01.0: GRBM_SOFT_RESET=3D0x000F0001
kernel: [  279.727047] amdgpu 0000:00:01.0: SRBM_SOFT_RESET=3D0x00000100
kernel: [  279.863162] [drm] recover vram bo from shadow start
kernel: [  279.863164] [drm] recover vram bo from shadow done
kernel: [  279.863166] [drm] Skip scheduling IBs!
kernel: [  279.863191] amdgpu 0000:00:01.0: GPU reset(2) succeeded!
kernel: [  280.015794] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to
initialize parser -125!

I can probably run diagnostics or collect a trace if someone tells me what =
and
how.

The problem persists - I still get it running kernel 5.2.1</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15634470252.f922b.30623--

--===============1513094595==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1513094595==--
