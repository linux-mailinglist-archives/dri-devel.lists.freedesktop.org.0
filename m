Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4411BBB19
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 20:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B2E6E995;
	Mon, 23 Sep 2019 18:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 070A16E995
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 18:17:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0447472162; Mon, 23 Sep 2019 18:17:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111789] drm/etnaviv: command buffer outside valid memory window
 (on cubox i4), Linux 5.3
Date: Mon, 23 Sep 2019 18:17:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: rechner@vlado-do.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111789-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1850394619=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1850394619==
Content-Type: multipart/alternative; boundary="15692626271.DcD5.2036"
Content-Transfer-Encoding: 7bit


--15692626271.DcD5.2036
Date: Mon, 23 Sep 2019 18:17:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111789

            Bug ID: 111789
           Summary: drm/etnaviv: command buffer outside valid memory
                    window (on cubox i4), Linux 5.3
           Product: DRI
           Version: unspecified
          Hardware: ARM
                OS: Linux (All)
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/other
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: rechner@vlado-do.de

Created attachment 145475
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145475&action=3Dedit
dmesg from kernel 5.3, loading firmware

I'm trying to get somewhat accelerated video output out of my CuBox i4 (imx6
cpu, GC2000 graphics), but I don't have any luck with kernels 5.0, 5.2, or =
5.3.

I tried recent Armbian and Fedora (30 and 31 beta).

The etnaviv messages from dmesg are:

[   18.891291] etnaviv etnaviv: bound 130000.gpu (ops gpu_ops [etnaviv])
[   18.895022] etnaviv etnaviv: bound 134000.gpu (ops gpu_ops [etnaviv])
[   18.898366] etnaviv etnaviv: bound 2204000.gpu (ops gpu_ops [etnaviv])
[   18.898385] etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
[   18.929873] etnaviv-gpu 130000.gpu: command buffer outside valid memory
window
[   18.931182] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
[   19.075240] etnaviv-gpu 134000.gpu: command buffer outside valid memory
window
[   19.076522] etnaviv-gpu 2204000.gpu: model: GC355, revision: 1215
[   19.076542] etnaviv-gpu 2204000.gpu: Ignoring GPU with VG and FE2.0
[   19.083510] [drm] Initialized etnaviv 1.2.0 20151214 for etnaviv on mino=
r 1

I'll attach the complete dmesg - or you can see it here: http://ix.io/1WAW

Google brought me to Russell King's similar problem from June:
https://lists.freedesktop.org/archives/dri-devel/2019-June/224474.html

I don't know why the problem disappeared for him, though.

Initially I reported the problem at the armbian forum:
https://forum.armbian.com/topic/11539-no-hdmi-with-linux-image-dev-cubox-ke=
rnel-5211/

I'm more of a user than a developer, especially when it comes to the Linux
kernel. But I can test switches or patches.

Any help would be appreciated!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15692626271.DcD5.2036
Date: Mon, 23 Sep 2019 18:17:07 +0000
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
   title=3D"NEW - drm/etnaviv: command buffer outside valid memory window (=
on cubox i4), Linux 5.3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111789">111789</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>drm/etnaviv: command buffer outside valid memory window (on c=
ubox i4), Linux 5.3
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>ARM
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
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/other
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>rechner&#64;vlado-do.de
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145475=
" name=3D"attach_145475" title=3D"dmesg from kernel 5.3, loading firmware">=
attachment 145475</a> <a href=3D"attachment.cgi?id=3D145475&amp;action=3Ded=
it" title=3D"dmesg from kernel 5.3, loading firmware">[details]</a></span>
dmesg from kernel 5.3, loading firmware

I'm trying to get somewhat accelerated video output out of my CuBox i4 (imx6
cpu, GC2000 graphics), but I don't have any luck with kernels 5.0, 5.2, or =
5.3.

I tried recent Armbian and Fedora (30 and 31 beta).

The etnaviv messages from dmesg are:

[   18.891291] etnaviv etnaviv: bound 130000.gpu (ops gpu_ops [etnaviv])
[   18.895022] etnaviv etnaviv: bound 134000.gpu (ops gpu_ops [etnaviv])
[   18.898366] etnaviv etnaviv: bound 2204000.gpu (ops gpu_ops [etnaviv])
[   18.898385] etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
[   18.929873] etnaviv-gpu 130000.gpu: command buffer outside valid memory
window
[   18.931182] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
[   19.075240] etnaviv-gpu 134000.gpu: command buffer outside valid memory
window
[   19.076522] etnaviv-gpu 2204000.gpu: model: GC355, revision: 1215
[   19.076542] etnaviv-gpu 2204000.gpu: Ignoring GPU with VG and FE2.0
[   19.083510] [drm] Initialized etnaviv 1.2.0 20151214 for etnaviv on mino=
r 1

I'll attach the complete dmesg - or you can see it here: <a href=3D"http://=
ix.io/1WAW">http://ix.io/1WAW</a>

Google brought me to Russell King's similar problem from June:
<a href=3D"https://lists.freedesktop.org/archives/dri-devel/2019-June/22447=
4.html">https://lists.freedesktop.org/archives/dri-devel/2019-June/224474.h=
tml</a>

I don't know why the problem disappeared for him, though.

Initially I reported the problem at the armbian forum:
<a href=3D"https://forum.armbian.com/topic/11539-no-hdmi-with-linux-image-d=
ev-cubox-kernel-5211/">https://forum.armbian.com/topic/11539-no-hdmi-with-l=
inux-image-dev-cubox-kernel-5211/</a>

I'm more of a user than a developer, especially when it comes to the Linux
kernel. But I can test switches or patches.

Any help would be appreciated!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15692626271.DcD5.2036--

--===============1850394619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1850394619==--
