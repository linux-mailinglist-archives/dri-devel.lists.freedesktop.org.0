Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1116FB0761
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845206E077;
	Thu, 12 Sep 2019 04:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id AFDC76E2FF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 17:44:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id ACC2F72167; Wed, 11 Sep 2019 17:44:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111591] [radeonsi/Navi] The Bard's Tale IV causes a GPU hang
Date: Wed, 11 Sep 2019 17:44:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vgglvyww36@khasekhemwy.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111591-502-RMd37xLBQ8@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111591-502@http.bugs.freedesktop.org/>
References: <bug-111591-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1387320946=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1387320946==
Content-Type: multipart/alternative; boundary="15682238542.cfc3.29145"
Content-Transfer-Encoding: 7bit


--15682238542.cfc3.29145
Date: Wed, 11 Sep 2019 17:44:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111591

--- Comment #16 from vggl <vgglvyww36@khasekhemwy.net> ---

"The games shaders use GLSL 4.30 which mean interpolation qualifiers must m=
atch
across shader interfaces otherwise it is a link-time error. In GLSL 4.40 th=
is
restriction was relaxed."

I believe that relaxation came in version 4.30, not 4.40.

The 4.30 spec here:
https://www.khronos.org/registry/OpenGL/specs/gl/GLSLangSpec.4.30.pdf

From the "4.3.4 Input Variables" section:

"The fragment shader inputs form an interface with the last active shader in
the vertex processing pipeline. For this interface, the last active shader
stage output variables and fragment shader input variables of the same name
must match in type and qualification, with a few exceptions: The storage
qualifiers must, of course, differ (one is in and one is out). Also,
interpolation qualification (e.g., flat) and auxiliary qualification (e.g.
centroid) may differ. These mismatches are allowed between any pair of stag=
es.
When interpolation or auxiliary qualifiers do not match, those provided in =
the
fragment shader supersede those provided in previous stages. If any such
qualifiers are completely missing in the fragment shaders, then the default=
 is
used, rather than any qualifiers that may have been declared in previous
stages. That is, what matters is what is declared in the fragment shaders, =
not
what is declared in shaders in previous stages."

That language is identical between 4.30 and 4.40. It sounds like it explici=
tly
allows interpolation qualifiers to differ.  However the 4.20 spec language =
in
that section was quite different and did require an interpolation qualifier
match.

Also, from
https://www.khronos.org/opengl/wiki/Shader_Compilation#Interface_matching:

"If GLSL 4.30 or later is available, then the interpolation qualifiers
(including centroid and sample) do not need to match."

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15682238542.cfc3.29145
Date: Wed, 11 Sep 2019 17:44:14 +0000
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
   title=3D"NEW - [radeonsi/Navi] The Bard's Tale IV causes a GPU hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111591#c16">Comme=
nt # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [radeonsi/Navi] The Bard's Tale IV causes a GPU hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111591">bug 11159=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
vgglvyww36&#64;khasekhemwy.net" title=3D"vggl &lt;vgglvyww36&#64;khasekhemw=
y.net&gt;"> <span class=3D"fn">vggl</span></a>
</span></b>
        <pre>
&quot;The games shaders use GLSL 4.30 which mean interpolation qualifiers m=
ust match
across shader interfaces otherwise it is a link-time error. In GLSL 4.40 th=
is
restriction was relaxed.&quot;

I believe that relaxation came in version 4.30, not 4.40.

The 4.30 spec here:
<a href=3D"https://www.khronos.org/registry/OpenGL/specs/gl/GLSLangSpec.4.3=
0.pdf">https://www.khronos.org/registry/OpenGL/specs/gl/GLSLangSpec.4.30.pd=
f</a>

From the &quot;4.3.4 Input Variables&quot; section:

&quot;The fragment shader inputs form an interface with the last active sha=
der in
the vertex processing pipeline. For this interface, the last active shader
stage output variables and fragment shader input variables of the same name
must match in type and qualification, with a few exceptions: The storage
qualifiers must, of course, differ (one is in and one is out). Also,
interpolation qualification (e.g., flat) and auxiliary qualification (e.g.
centroid) may differ. These mismatches are allowed between any pair of stag=
es.
When interpolation or auxiliary qualifiers do not match, those provided in =
the
fragment shader supersede those provided in previous stages. If any such
qualifiers are completely missing in the fragment shaders, then the default=
 is
used, rather than any qualifiers that may have been declared in previous
stages. That is, what matters is what is declared in the fragment shaders, =
not
what is declared in shaders in previous stages.&quot;

That language is identical between 4.30 and 4.40. It sounds like it explici=
tly
allows interpolation qualifiers to differ.  However the 4.20 spec language =
in
that section was quite different and did require an interpolation qualifier
match.

Also, from
<a href=3D"https://www.khronos.org/opengl/wiki/Shader_Compilation#Interface=
_matching">https://www.khronos.org/opengl/wiki/Shader_Compilation#Interface=
_matching</a>:

&quot;If GLSL 4.30 or later is available, then the interpolation qualifiers
(including centroid and sample) do not need to match.&quot;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15682238542.cfc3.29145--

--===============1387320946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1387320946==--
