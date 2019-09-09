Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDE4AD170
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 02:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D35B896EB;
	Mon,  9 Sep 2019 00:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A11BD896E9
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 00:58:42 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 946E172167; Mon,  9 Sep 2019 00:58:42 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111077] link_shader and deserialize_glsl_program suddenly
 consume huge amount of RAM
Date: Mon, 09 Sep 2019 00:58:42 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: bisected
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: t_arceri@yahoo.com.au
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111077-502-WTvXhXuHvU@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1208166021=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1208166021==
Content-Type: multipart/alternative; boundary="15679907220.2320.27084"
Content-Transfer-Encoding: 7bit


--15679907220.2320.27084
Date: Mon, 9 Sep 2019 00:58:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111077

--- Comment #29 from Timothy Arceri <t_arceri@yahoo.com.au> ---
(In reply to roland@rptd.ch from comment #22)
> Hi Marek,
>=20
> This is going to be complicated. The application is not yet free to use by
> others (working on getting it to release shape). I would have to figure o=
ut
> first how to break this down into a reproducible test case since I don't
> know myself what triggers the bug.
>=20
> If you can think of some corner values to narrow down in what direction to
> search I can fully mess with the source code over here. The faulty commit
> talks about UBO maximum size so this might be a start. The OpenGL
> Capabilities from the GPU is this:
>=20
> - UBO Maximum Block Size =3D 65536
> - UBO Buffer Offset Alignment =3D 4
>=20
> So the maximum size used by the application is 65536 bytes.
>=20
> UBOs are used as shared buffers so blocks of data are placed next to each
> other respecting alignment and updated.
>=20
> UBOs are created like this:
>=20
> glBindBuffer(GL_UNIFORM_BUFFER, pUBO)  // <=3D done once
> glBufferData(GL_UNIFORM_BUFFER, bufferSize, NULL, GL_DYNAMIC_DRAW)  // <=
=3D
> done once
> glMapBufferRange(GL_UNIFORM_BUFFER, stride * elementCount, elementStride,
> GL_WRITE_ONLY | GL_MAP_INVALIDATE_RANGE_BIT)  // <=3D done for each data =
block
> written
>=20
> Data then written and unmapped
>=20
> In particular this means a larger UBO is created once then individual blo=
cks
> are written to it using ranged mapping. Just a wield guess but could the
> problem be related to this kind of usage pattern?

UBOs are written to the shader cache, and shade cache items are kept in mem=
ory
in a queue when all threads are busy compiling. If you have large UBOs this
could indeed be your problem.

The following merge request might be helpful. Are you able to give this a t=
est?

https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1852

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15679907220.2320.27084
Date: Mon, 9 Sep 2019 00:58:42 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077#c29">Comme=
nt # 29</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - link_shader and deserialize_glsl_program suddenly consume=
 huge amount of RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077">bug 11107=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
t_arceri&#64;yahoo.com.au" title=3D"Timothy Arceri &lt;t_arceri&#64;yahoo.c=
om.au&gt;"> <span class=3D"fn">Timothy Arceri</span></a>
</span></b>
        <pre>(In reply to <a href=3D"mailto:roland&#64;rptd.ch">roland&#64;=
rptd.ch</a> from <a href=3D"show_bug.cgi?id=3D111077#c22">comment #22</a>)
<span class=3D"quote">&gt; Hi Marek,
&gt;=20
&gt; This is going to be complicated. The application is not yet free to us=
e by
&gt; others (working on getting it to release shape). I would have to figur=
e out
&gt; first how to break this down into a reproducible test case since I don=
't
&gt; know myself what triggers the bug.
&gt;=20
&gt; If you can think of some corner values to narrow down in what directio=
n to
&gt; search I can fully mess with the source code over here. The faulty com=
mit
&gt; talks about UBO maximum size so this might be a start. The OpenGL
&gt; Capabilities from the GPU is this:
&gt;=20
&gt; - UBO Maximum Block Size =3D 65536
&gt; - UBO Buffer Offset Alignment =3D 4
&gt;=20
&gt; So the maximum size used by the application is 65536 bytes.
&gt;=20
&gt; UBOs are used as shared buffers so blocks of data are placed next to e=
ach
&gt; other respecting alignment and updated.
&gt;=20
&gt; UBOs are created like this:
&gt;=20
&gt; glBindBuffer(GL_UNIFORM_BUFFER, pUBO)  // &lt;=3D done once
&gt; glBufferData(GL_UNIFORM_BUFFER, bufferSize, NULL, GL_DYNAMIC_DRAW)  //=
 &lt;=3D
&gt; done once
&gt; glMapBufferRange(GL_UNIFORM_BUFFER, stride * elementCount, elementStri=
de,
&gt; GL_WRITE_ONLY | GL_MAP_INVALIDATE_RANGE_BIT)  // &lt;=3D done for each=
 data block
&gt; written
&gt;=20
&gt; Data then written and unmapped
&gt;=20
&gt; In particular this means a larger UBO is created once then individual =
blocks
&gt; are written to it using ranged mapping. Just a wield guess but could t=
he
&gt; problem be related to this kind of usage pattern?</span >

UBOs are written to the shader cache, and shade cache items are kept in mem=
ory
in a queue when all threads are busy compiling. If you have large UBOs this
could indeed be your problem.

The following merge request might be helpful. Are you able to give this a t=
est?

<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/merge_requests/1852">ht=
tps://gitlab.freedesktop.org/mesa/mesa/merge_requests/1852</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15679907220.2320.27084--

--===============1208166021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1208166021==--
