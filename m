Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B58A5BEB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 19:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B62898AF;
	Mon,  2 Sep 2019 17:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 98094898B7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 17:47:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8ED21721AA; Mon,  2 Sep 2019 17:47:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111077] link_shader and deserialize_glsl_program suddenly
 consume huge amount of RAM
Date: Mon, 02 Sep 2019 17:47:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: bisected
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: roland@rptd.ch
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111077-502-b1nlLExYa8@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111077-502@http.bugs.freedesktop.org/>
References: <bug-111077-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0932677836=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0932677836==
Content-Type: multipart/alternative; boundary="15674464341.cFE1.24960"
Content-Transfer-Encoding: 7bit


--15674464341.cFE1.24960
Date: Mon, 2 Sep 2019 17:47:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111077

--- Comment #22 from roland@rptd.ch <roland@rptd.ch> ---
Hi Marek,

This is going to be complicated. The application is not yet free to use by
others (working on getting it to release shape). I would have to figure out
first how to break this down into a reproducible test case since I don't kn=
ow
myself what triggers the bug.

If you can think of some corner values to narrow down in what direction to
search I can fully mess with the source code over here. The faulty commit t=
alks
about UBO maximum size so this might be a start. The OpenGL Capabilities fr=
om
the GPU is this:

- UBO Maximum Block Size =3D 65536
- UBO Buffer Offset Alignment =3D 4

So the maximum size used by the application is 65536 bytes.

UBOs are used as shared buffers so blocks of data are placed next to each o=
ther
respecting alignment and updated.

UBOs are created like this:

glBindBuffer(GL_UNIFORM_BUFFER, pUBO)  // <=3D done once
glBufferData(GL_UNIFORM_BUFFER, bufferSize, NULL, GL_DYNAMIC_DRAW)  // <=3D=
 done
once
glMapBufferRange(GL_UNIFORM_BUFFER, stride * elementCount, elementStride,
GL_WRITE_ONLY | GL_MAP_INVALIDATE_RANGE_BIT)  // <=3D done for each data bl=
ock
written

Data then written and unmapped

In particular this means a larger UBO is created once then individual blocks
are written to it using ranged mapping. Just a wield guess but could the
problem be related to this kind of usage pattern?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15674464341.cFE1.24960
Date: Mon, 2 Sep 2019 17:47:14 +0000
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
   title=3D"NEW - link_shader and deserialize_glsl_program suddenly consume=
 huge amount of RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077#c22">Comme=
nt # 22</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - link_shader and deserialize_glsl_program suddenly consume=
 huge amount of RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077">bug 11107=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
roland&#64;rptd.ch" title=3D"roland&#64;rptd.ch &lt;roland&#64;rptd.ch&gt;"=
> <span class=3D"fn">roland&#64;rptd.ch</span></a>
</span></b>
        <pre>Hi Marek,

This is going to be complicated. The application is not yet free to use by
others (working on getting it to release shape). I would have to figure out
first how to break this down into a reproducible test case since I don't kn=
ow
myself what triggers the bug.

If you can think of some corner values to narrow down in what direction to
search I can fully mess with the source code over here. The faulty commit t=
alks
about UBO maximum size so this might be a start. The OpenGL Capabilities fr=
om
the GPU is this:

- UBO Maximum Block Size =3D 65536
- UBO Buffer Offset Alignment =3D 4

So the maximum size used by the application is 65536 bytes.

UBOs are used as shared buffers so blocks of data are placed next to each o=
ther
respecting alignment and updated.

UBOs are created like this:

glBindBuffer(GL_UNIFORM_BUFFER, pUBO)  // &lt;=3D done once
glBufferData(GL_UNIFORM_BUFFER, bufferSize, NULL, GL_DYNAMIC_DRAW)  // &lt;=
=3D done
once
glMapBufferRange(GL_UNIFORM_BUFFER, stride * elementCount, elementStride,
GL_WRITE_ONLY | GL_MAP_INVALIDATE_RANGE_BIT)  // &lt;=3D done for each data=
 block
written

Data then written and unmapped

In particular this means a larger UBO is created once then individual blocks
are written to it using ranged mapping. Just a wield guess but could the
problem be related to this kind of usage pattern?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15674464341.cFE1.24960--

--===============0932677836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0932677836==--
