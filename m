Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB4987FB8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 18:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234976EE57;
	Fri,  9 Aug 2019 16:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 42AF86EE57
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 16:22:09 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3958472167; Fri,  9 Aug 2019 16:22:09 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111241] Shadertoy shader causing hang
Date: Fri, 09 Aug 2019 16:22:09 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-eric.pelloux-prayer@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111241-502-LEw4RAYAR5@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111241-502@http.bugs.freedesktop.org/>
References: <bug-111241-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1536819545=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1536819545==
Content-Type: multipart/alternative; boundary="15653677290.9BAA3.21266"
Content-Transfer-Encoding: 7bit


--15653677290.9BAA3.21266
Date: Fri, 9 Aug 2019 16:22:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111241

--- Comment #3 from Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@=
amd.com> ---
Here's my understanding of the issue.

This shader uses 2 passes:
 - the first pass has BufferA as input and output and does:

if (first frame)
  // init bufferA content
else
  // do something useful

 - the 2nd pass has BufferA as input and does:

N =3D texelFetch(bufferA)
for(i=3D0; i < N; i++)
  // do something


The problem here is the "// init bufferA content": it fails to initialize t=
he
buffer content properly, leading to an infinite loop in the 2nd pass.

The exact code is:
   if (iFrame=3D=3D0) { O -=3D O; return; }

If one replaces this line with:
   if (iFrame=3D=3D0) { O =3D vec4(0.0f); return; }

The shader works fine (you can test the modified version here:
https://www.shadertoy.com/view/wtSXzw ).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15653677290.9BAA3.21266
Date: Fri, 9 Aug 2019 16:22:09 +0000
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
   title=3D"NEW - Shadertoy shader causing hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111241#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Shadertoy shader causing hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111241">bug 11124=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre-eric.pelloux-prayer&#64;amd.com" title=3D"Pierre-Eric Pelloux-Prayer=
 &lt;pierre-eric.pelloux-prayer&#64;amd.com&gt;"> <span class=3D"fn">Pierre=
-Eric Pelloux-Prayer</span></a>
</span></b>
        <pre>Here's my understanding of the issue.

This shader uses 2 passes:
 - the first pass has BufferA as input and output and does:

if (first frame)
  // init bufferA content
else
  // do something useful

 - the 2nd pass has BufferA as input and does:

N =3D texelFetch(bufferA)
for(i=3D0; i &lt; N; i++)
  // do something


The problem here is the &quot;// init bufferA content&quot;: it fails to in=
itialize the
buffer content properly, leading to an infinite loop in the 2nd pass.

The exact code is:
   if (iFrame=3D=3D0) { O -=3D O; return; }

If one replaces this line with:
   if (iFrame=3D=3D0) { O =3D vec4(0.0f); return; }

The shader works fine (you can test the modified version here:
<a href=3D"https://www.shadertoy.com/view/wtSXzw">https://www.shadertoy.com=
/view/wtSXzw</a> ).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15653677290.9BAA3.21266--

--===============1536819545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1536819545==--
