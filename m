Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D45061275
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2019 19:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544F289893;
	Sat,  6 Jul 2019 17:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF57F89893
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 17:46:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D603272167; Sat,  6 Jul 2019 17:46:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111077] link_shader and deserialize_glsl_program suddenly
 consume huge amount of RAM
Date: Sat, 06 Jul 2019 17:46:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: roland@rptd.ch
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-111077-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1728550014=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1728550014==
Content-Type: multipart/alternative; boundary="15624351820.09Ec4.22058"
Content-Transfer-Encoding: 7bit


--15624351820.09Ec4.22058
Date: Sat, 6 Jul 2019 17:46:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111077

            Bug ID: 111077
           Summary: link_shader and deserialize_glsl_program suddenly
                    consume huge amount of RAM
           Product: Mesa
           Version: 18.3
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: roland@rptd.ch
        QA Contact: dri-devel@lists.freedesktop.org

Created attachment 144715
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144715&action=3Dedit
Valgrind massif log

Since a recent update a few days ago an application which barely consumes 2G
RAM at full load is very slow to load and compiling shaders causes over 16G=
 RAM
to be consumed when the app eventually crashes.

I don't know what exactly in the update caused problems but certainly Mesa,=
 the
amdgpu driver and LLVM did get updates.

I also tried using Mesa 19.x but the problem is the same.

Driver is xf86-video-amdgpu-19.0.1 . LLVM is 7.0.x .

I've already deleted the mesa shader cache and all caches the application
creates. I've totally recompiled the system (GenToo) to make sure no strange
problems can be around. I've also tried with a completely fresh user to run=
 the
app.

Using valgrind --tool=3Dmassif the culprit seems to be ralloc_size which is
called by the two above mentioned methods. I've attached a massif log of a
couple of seconds running of the application and shutting it down before me=
mory
skyrockets even more. The app in question shows at that point of time only =
an
empty scene with a simple shader doing a sky-box. The rest is Non OpenGL UI
stuff.

Classified this as blocker since as soon as you try loading more shaders not
even 32G seems to be enough to cope with the rampaging glsl compiler.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15624351820.09Ec4.22058
Date: Sat, 6 Jul 2019 17:46:22 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - link_shader and deserialize_glsl_program suddenly consume=
 huge amount of RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077">111077</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>link_shader and deserialize_glsl_program suddenly consume hug=
e amount of RAM
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>18.3
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>blocker
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/Gallium/radeonsi
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>roland&#64;rptd.ch
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144715=
" name=3D"attach_144715" title=3D"Valgrind massif log">attachment 144715</a=
> <a href=3D"attachment.cgi?id=3D144715&amp;action=3Dedit" title=3D"Valgrin=
d massif log">[details]</a></span>
Valgrind massif log

Since a recent update a few days ago an application which barely consumes 2G
RAM at full load is very slow to load and compiling shaders causes over 16G=
 RAM
to be consumed when the app eventually crashes.

I don't know what exactly in the update caused problems but certainly Mesa,=
 the
amdgpu driver and LLVM did get updates.

I also tried using Mesa 19.x but the problem is the same.

Driver is xf86-video-amdgpu-19.0.1 . LLVM is 7.0.x .

I've already deleted the mesa shader cache and all caches the application
creates. I've totally recompiled the system (GenToo) to make sure no strange
problems can be around. I've also tried with a completely fresh user to run=
 the
app.

Using valgrind --tool=3Dmassif the culprit seems to be ralloc_size which is
called by the two above mentioned methods. I've attached a massif log of a
couple of seconds running of the application and shutting it down before me=
mory
skyrockets even more. The app in question shows at that point of time only =
an
empty scene with a simple shader doing a sky-box. The rest is Non OpenGL UI
stuff.

Classified this as blocker since as soon as you try loading more shaders not
even 32G seems to be enough to cope with the rampaging glsl compiler.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15624351820.09Ec4.22058--

--===============1728550014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1728550014==--
