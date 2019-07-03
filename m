Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19FD5E295
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 13:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019BB6E11E;
	Wed,  3 Jul 2019 11:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 547266E121
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 11:08:09 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5114F72167; Wed,  3 Jul 2019 11:08:09 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 105251] [Vega10]  GPU lockup on boot: VMC page fault
Date: Wed, 03 Jul 2019 11:08:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: 375gnu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-105251-502-Wu47bdy8d8@http.bugs.freedesktop.org/>
In-Reply-To: <bug-105251-502@http.bugs.freedesktop.org/>
References: <bug-105251-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1669787127=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1669787127==
Content-Type: multipart/alternative; boundary="15621520893.AEF8B.11787"
Content-Transfer-Encoding: 7bit


--15621520893.AEF8B.11787
Date: Wed, 3 Jul 2019 11:08:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105251

--- Comment #69 from Hleb Valoshka <375gnu@gmail.com> ---
I have this fault with 2400G and mesa 18.3 & 19.1.1 with Linux 4.19 (other
versions haven't been tested).

It seems that Vega is unable to handle tiny VBO correctly. I have an old
application that uses a lot of immediate mode GL functions to create small
billboards using GL_QUADS like the following one:

    glTexCoord2f(0, 0);          glVertex(v0 * Size);
    glTexCoord2f(1, 0);          glVertex(v1 * Size);
    glTexCoord2f(1, 1);          glVertex(v2 * Size);
    glTexCoord2f(0, 1);          glVertex(v3 * Size);

Initially I have replaced this code with
    static GLfloat Vtx[] =3D
    {
        -1, -1, 0,    0, 0,
         1, -1, 0,    1, 0,
         1,  1, 0,    1, 1,
        -1,  1, 0,    0, 1
    };

    glBufferData(GL_ARRAY_BUFFER, sizeof(Vtx), Vtx, GL_STATIC_DRAW);
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    glVertexPointer(3, GL_FLOAT, 5*sizeof(GLfloat), 0);
    glTexCoordPointer(2, GL_FLOAT, 5*sizeof(GLfloat), 3*sizeof(GLfloat));

    + I use VAO if it's available.

As a variant I used independent arrays for position and texture coordinates.
But with the same fault.

So as a result I added required data to another related VBO which contains =
8192
vertices. Now I don't have this fault.

I know that OpenGL doesn't like herds of small VBOs, but the hardware failu=
re
is not an expected result if we use them.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15621520893.AEF8B.11787
Date: Wed, 3 Jul 2019 11:08:09 +0000
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
   title=3D"NEW - [Vega10] GPU lockup on boot: VMC page fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105251#c69">Comme=
nt # 69</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Vega10] GPU lockup on boot: VMC page fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105251">bug 10525=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
375gnu&#64;gmail.com" title=3D"Hleb Valoshka &lt;375gnu&#64;gmail.com&gt;">=
 <span class=3D"fn">Hleb Valoshka</span></a>
</span></b>
        <pre>I have this fault with 2400G and mesa 18.3 &amp; 19.1.1 with L=
inux 4.19 (other
versions haven't been tested).

It seems that Vega is unable to handle tiny VBO correctly. I have an old
application that uses a lot of immediate mode GL functions to create small
billboards using GL_QUADS like the following one:

    glTexCoord2f(0, 0);          glVertex(v0 * Size);
    glTexCoord2f(1, 0);          glVertex(v1 * Size);
    glTexCoord2f(1, 1);          glVertex(v2 * Size);
    glTexCoord2f(0, 1);          glVertex(v3 * Size);

Initially I have replaced this code with
    static GLfloat Vtx[] =3D
    {
        -1, -1, 0,    0, 0,
         1, -1, 0,    1, 0,
         1,  1, 0,    1, 1,
        -1,  1, 0,    0, 1
    };

    glBufferData(GL_ARRAY_BUFFER, sizeof(Vtx), Vtx, GL_STATIC_DRAW);
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    glVertexPointer(3, GL_FLOAT, 5*sizeof(GLfloat), 0);
    glTexCoordPointer(2, GL_FLOAT, 5*sizeof(GLfloat), 3*sizeof(GLfloat));

    + I use VAO if it's available.

As a variant I used independent arrays for position and texture coordinates.
But with the same fault.

So as a result I added required data to another related VBO which contains =
8192
vertices. Now I don't have this fault.

I know that OpenGL doesn't like herds of small VBOs, but the hardware failu=
re
is not an expected result if we use them.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15621520893.AEF8B.11787--

--===============1669787127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1669787127==--
