Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D60ED9D40E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 18:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9176389A56;
	Mon, 26 Aug 2019 16:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 51F0F89A56
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 16:34:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4E9AB72161; Mon, 26 Aug 2019 16:34:02 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111236] VA-API radeonsi SIGSEGV __memmove_avx_unaligned
Date: Mon, 26 Aug 2019 16:34:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111236-502-GtBUfw4nxU@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111236-502@http.bugs.freedesktop.org/>
References: <bug-111236-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1485936337=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1485936337==
Content-Type: multipart/alternative; boundary="15668372421.b9fe.15113"
Content-Transfer-Encoding: 7bit


--15668372421.b9fe.15113
Date: Mon, 26 Aug 2019 16:34:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111236

--- Comment #8 from Michel D=C3=A4nzer <michel@daenzer.net> ---
Created attachment 145171
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145171&action=3Dedit
si_video_buffer_create fixups

I've traced this to the si_video_buffer_create function, which makes multip=
le
pipe_resources use the same buffer, but doesn't update the bo_size or make =
sure
si_can_invalidate_texture returns false for those resources. So
si_texture_transfer_map may allocate a new buffer of the original bo_size,
which is smaller than the combined size of the resources =3D> its CPU mappi=
ng
doesn't always cover the calculated address.

This quick'n'dirty patch prevents the crash, but now totem just hangs for m=
e.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15668372421.b9fe.15113
Date: Mon, 26 Aug 2019 16:34:02 +0000
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
   title=3D"NEW - VA-API radeonsi SIGSEGV __memmove_avx_unaligned"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111236#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - VA-API radeonsi SIGSEGV __memmove_avx_unaligned"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111236">bug 11123=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
michel&#64;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.=
net&gt;"> <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145171=
" name=3D"attach_145171" title=3D"si_video_buffer_create fixups">attachment=
 145171</a> <a href=3D"attachment.cgi?id=3D145171&amp;action=3Dedit" title=
=3D"si_video_buffer_create fixups">[details]</a></span> <a href=3D'page.cgi=
?id=3Dsplinter.html&amp;bug=3D111236&amp;attachment=3D145171'>[review]</a>
si_video_buffer_create fixups

I've traced this to the si_video_buffer_create function, which makes multip=
le
pipe_resources use the same buffer, but doesn't update the bo_size or make =
sure
si_can_invalidate_texture returns false for those resources. So
si_texture_transfer_map may allocate a new buffer of the original bo_size,
which is smaller than the combined size of the resources =3D&gt; its CPU ma=
pping
doesn't always cover the calculated address.

This quick'n'dirty patch prevents the crash, but now totem just hangs for m=
e.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15668372421.b9fe.15113--

--===============1485936337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1485936337==--
