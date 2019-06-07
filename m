Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8C83968A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 22:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBAA89122;
	Fri,  7 Jun 2019 20:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2509889134
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 20:12:53 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 219EB72167; Fri,  7 Jun 2019 20:12:53 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110781] Radeon: heavy r300 performance drop regression between
 11.x and 19.x
Date: Fri, 07 Jun 2019 20:12:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: u9vata@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110781-502-PhCoAUy0HL@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110781-502@http.bugs.freedesktop.org/>
References: <bug-110781-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0098074660=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0098074660==
Content-Type: multipart/alternative; boundary="15599383731.5FA3.26978"
Content-Transfer-Encoding: 7bit


--15599383731.5FA3.26978
Date: Fri, 7 Jun 2019 20:12:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110781

--- Comment #58 from Richard Thier <u9vata@gmail.com> ---
The output from gdb glxgears on the segfault:

#0  0xb75a8892 in radeon_winsys_bo_create (rws=3D0x45e100, size=3D4096,
alignment=3D4096, domain=3DRADEON_DOMAIN_GTT, flags=3D(unknown: 0))
    at radeon_drm_bo.c:993
#1  0xb75a972b in radeon_cs_create_fence (rcs=3Drcs@entry=3D0xb06a4010) at
radeon_drm_cs.c:753
#2  0xb75aa327 in radeon_drm_cs_flush (rcs=3D0xb06a4010, flags=3D2,
pfence=3D0xbffff7d8) at radeon_drm_cs.c:593
#3  0xb757845a in r300_flush_and_cleanup (r300=3Dr300@entry=3D0x446090,
flags=3Dflags@entry=3D2, fence=3Dfence@entry=3D0xbffff7d8) at r300_flush.c:=
56
#4  0xb757860f in r300_flush (pipe=3D0x446090, flags=3D2, fence=3D0xbffff7d=
8) at
r300_flush.c:82
#5  0xb731508f in st_context_flush (stctxi=3D0x55ed20, flags=3D3, fence=3D0=
xbffff7d8)
at state_tracker/st_manager.c:635
#6  0xb74511f8 in dri_flush (cPriv=3D0x445fd0, dPriv=3D0x5760d0, flags=3D3,
reason=3D__DRI2_THROTTLE_SWAPBUFFER) at dri_drawable.c:568
#7  0xb7f9dbe8 in dri2Flush (psc=3Dpsc@entry=3D0x4165d0, ctx=3D<optimized o=
ut>,
draw=3Ddraw@entry=3D0x5590e0, flags=3D3,=20
    throttle_reason=3D__DRI2_THROTTLE_SWAPBUFFER) at dri2_glx.c:553
#8  0xb7f9e09d in dri2SwapBuffers (pdraw=3D0x5590e0, target_msc=3D0, diviso=
r=3D0,
remainder=3D0, flush=3D1) at dri2_glx.c:845
#9  0xb7f73049 in glXSwapBuffers (dpy=3D0x407160, drawable=3D18874370) at
glxcmds.c:843
#10 0x00401742 in ?? ()
#11 0xb7b5c669 in __libc_start_main () from /usr/lib/libc.so.6
#12 0x00401cd5 in ?? ()

I have changed this relevant part with the added flag:

    /* Create a fence, which is a dummy BO. */
    fence =3D cs->ws->base.buffer_create(&cs->ws->base, 1, 1,
                                       RADEON_DOMAIN_GTT,
                                       RADEON_FLAG_NO_SUBALLOC
                                       | RADEON_FLAG_NO_INTERPROCESS_SHARIN=
G);

Currently I am testing this, in latest but the build is still going. Will
upload patch for it only if it works. I think it does not harm, but this is
happening when the bo is a "fence". I have no idea what a fence is in this
terminology, but surely it sounds some synchronization primitive so I am un=
sure
that I can add the flag safely, but knowing earlier it was not in the code
likely I can just add it.

Will see how this shrinks the GEM_CREATE call numbers.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15599383731.5FA3.26978
Date: Fri, 7 Jun 2019 20:12:53 +0000
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
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781#c58">Comme=
nt # 58</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781">bug 11078=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
u9vata&#64;gmail.com" title=3D"Richard Thier &lt;u9vata&#64;gmail.com&gt;">=
 <span class=3D"fn">Richard Thier</span></a>
</span></b>
        <pre>The output from gdb glxgears on the segfault:

#0  0xb75a8892 in radeon_winsys_bo_create (rws=3D0x45e100, size=3D4096,
alignment=3D4096, domain=3DRADEON_DOMAIN_GTT, flags=3D(unknown: 0))
    at radeon_drm_bo.c:993
#1  0xb75a972b in radeon_cs_create_fence (rcs=3Drcs&#64;entry=3D0xb06a4010)=
 at
radeon_drm_cs.c:753
#2  0xb75aa327 in radeon_drm_cs_flush (rcs=3D0xb06a4010, flags=3D2,
pfence=3D0xbffff7d8) at radeon_drm_cs.c:593
#3  0xb757845a in r300_flush_and_cleanup (r300=3Dr300&#64;entry=3D0x446090,
flags=3Dflags&#64;entry=3D2, fence=3Dfence&#64;entry=3D0xbffff7d8) at r300_=
flush.c:56
#4  0xb757860f in r300_flush (pipe=3D0x446090, flags=3D2, fence=3D0xbffff7d=
8) at
r300_flush.c:82
#5  0xb731508f in st_context_flush (stctxi=3D0x55ed20, flags=3D3, fence=3D0=
xbffff7d8)
at state_tracker/st_manager.c:635
#6  0xb74511f8 in dri_flush (cPriv=3D0x445fd0, dPriv=3D0x5760d0, flags=3D3,
reason=3D__DRI2_THROTTLE_SWAPBUFFER) at dri_drawable.c:568
#7  0xb7f9dbe8 in dri2Flush (psc=3Dpsc&#64;entry=3D0x4165d0, ctx=3D&lt;opti=
mized out&gt;,
draw=3Ddraw&#64;entry=3D0x5590e0, flags=3D3,=20
    throttle_reason=3D__DRI2_THROTTLE_SWAPBUFFER) at dri2_glx.c:553
#8  0xb7f9e09d in dri2SwapBuffers (pdraw=3D0x5590e0, target_msc=3D0, diviso=
r=3D0,
remainder=3D0, flush=3D1) at dri2_glx.c:845
#9  0xb7f73049 in glXSwapBuffers (dpy=3D0x407160, drawable=3D18874370) at
glxcmds.c:843
#10 0x00401742 in ?? ()
#11 0xb7b5c669 in __libc_start_main () from /usr/lib/libc.so.6
#12 0x00401cd5 in ?? ()

I have changed this relevant part with the added flag:

    /* Create a fence, which is a dummy BO. */
    fence =3D cs-&gt;ws-&gt;base.buffer_create(&amp;cs-&gt;ws-&gt;base, 1, =
1,
                                       RADEON_DOMAIN_GTT,
                                       RADEON_FLAG_NO_SUBALLOC
                                       | RADEON_FLAG_NO_INTERPROCESS_SHARIN=
G);

Currently I am testing this, in latest but the build is still going. Will
upload patch for it only if it works. I think it does not harm, but this is
happening when the bo is a &quot;fence&quot;. I have no idea what a fence i=
s in this
terminology, but surely it sounds some synchronization primitive so I am un=
sure
that I can add the flag safely, but knowing earlier it was not in the code
likely I can just add it.

Will see how this shrinks the GEM_CREATE call numbers.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15599383731.5FA3.26978--

--===============0098074660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0098074660==--
