Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F6E5FEB1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 01:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045896E3EB;
	Thu,  4 Jul 2019 23:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC59C6E3EB
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 23:41:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E955472167; Thu,  4 Jul 2019 23:41:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109524] "Invalid glsl version in shading_language_version()"
 when trying to run directX games using wine
Date: Thu, 04 Jul 2019 23:41:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/R100
X-Bugzilla-Version: 18.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109524-502-Tkd9Rb59Xu@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109524-502@http.bugs.freedesktop.org/>
References: <bug-109524-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0604649018=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0604649018==
Content-Type: multipart/alternative; boundary="15622836782.2F85f.31907"
Content-Transfer-Encoding: 7bit


--15622836782.2F85f.31907
Date: Thu, 4 Jul 2019 23:41:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109524

--- Comment #8 from Ilia Mirkin <imirkin@alum.mit.edu> ---
Doing a little more digging, we enabled GL_ARB_shading_language_100
unconditionally in 2013:

commit 70966570f3e4275dc15b5a94c70698f6aef64150
Author: Ian Romanick <ian.d.romanick@intel.com>
Date:   Thu Jun 27 18:20:31 2013 -0700

    mesa: GL_ARB_shading_language_100 is not optional

However it appears that wine code has something like

https://source.winehq.org/git/wine.git/blob/201d13a3c31131f204f89d61be37bf7=
5d58dc6dd:/dlls/wined3d/adapter_gl.c#l3737

3737     if (gl_info->supported[ARB_SHADING_LANGUAGE_100])
3738     {
3739         const char *str =3D (const char
*)gl_info->gl_ops.gl.p_glGetString(GL_SHADING_LANGUAGE_VERSION_ARB);
3740         unsigned int major, minor;
3741=20
3742         TRACE("GLSL version string: %s.\n", debugstr_a(str));
3743=20
3744         /* The format of the GLSL version string is "major.minor[.rele=
ase]
[vendor info]". */
3745         sscanf(str, "%u.%u", &major, &minor);
3746         gl_info->glsl_version =3D MAKEDWORD_VERSION(major, minor);

I think the debugstr_a(NULL) is giving problems, but if it's not, sscanf
probably will.

I'm not 100% sure who's right here. Certainly the GL_ARB_shading_language_1=
00
spec talks about GL_SHADING_LANGUAGE_VERSION_ARB not being available due to=
 it
not existing in early extension specs.=20

However the current behavior is a bit questionable on the mesa side. I don't
know what the rationale was for always exposing the ext (as given, it's bec=
ause
one ought to check for ARB_vertex_program/etc, but that seems weak).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15622836782.2F85f.31907
Date: Thu, 4 Jul 2019 23:41:18 +0000
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
   title=3D"NEW - &quot;Invalid glsl version in shading_language_version()&=
quot; when trying to run directX games using wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109524#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - &quot;Invalid glsl version in shading_language_version()&=
quot; when trying to run directX games using wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109524">bug 10952=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Doing a little more digging, we enabled GL_ARB_shading_languag=
e_100
unconditionally in 2013:

commit 70966570f3e4275dc15b5a94c70698f6aef64150
Author: Ian Romanick &lt;<a href=3D"mailto:ian.d.romanick&#64;intel.com">ia=
n.d.romanick&#64;intel.com</a>&gt;
Date:   Thu Jun 27 18:20:31 2013 -0700

    mesa: GL_ARB_shading_language_100 is not optional

However it appears that wine code has something like

<a href=3D"https://source.winehq.org/git/wine.git/blob/201d13a3c31131f204f8=
9d61be37bf75d58dc6dd:/dlls/wined3d/adapter_gl.c#l3737">https://source.wineh=
q.org/git/wine.git/blob/201d13a3c31131f204f89d61be37bf75d58dc6dd:/dlls/wine=
d3d/adapter_gl.c#l3737</a>

3737     if (gl_info-&gt;supported[ARB_SHADING_LANGUAGE_100])
3738     {
3739         const char *str =3D (const char
*)gl_info-&gt;gl_ops.gl.p_glGetString(GL_SHADING_LANGUAGE_VERSION_ARB);
3740         unsigned int major, minor;
3741=20
3742         TRACE(&quot;GLSL version string: %s.\n&quot;, debugstr_a(str));
3743=20
3744         /* The format of the GLSL version string is &quot;major.minor[=
.release]
[vendor info]&quot;. */
3745         sscanf(str, &quot;%u.%u&quot;, &amp;major, &amp;minor);
3746         gl_info-&gt;glsl_version =3D MAKEDWORD_VERSION(major, minor);

I think the debugstr_a(NULL) is giving problems, but if it's not, sscanf
probably will.

I'm not 100% sure who's right here. Certainly the GL_ARB_shading_language_1=
00
spec talks about GL_SHADING_LANGUAGE_VERSION_ARB not being available due to=
 it
not existing in early extension specs.=20

However the current behavior is a bit questionable on the mesa side. I don't
know what the rationale was for always exposing the ext (as given, it's bec=
ause
one ought to check for ARB_vertex_program/etc, but that seems weak).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15622836782.2F85f.31907--

--===============0604649018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0604649018==--
