Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FA386BBF
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 22:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95566E8B9;
	Thu,  8 Aug 2019 20:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD5366E8C1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 20:41:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BA0A572167; Thu,  8 Aug 2019 20:41:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110671] Regression: DP outputs out of sync on dual-DP tiled 5k
 screen
Date: Thu, 08 Aug 2019 20:41:59 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: d.budelkov@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110671-502-8FZQzuJhHC@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110671-502@http.bugs.freedesktop.org/>
References: <bug-110671-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2045830150=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2045830150==
Content-Type: multipart/alternative; boundary="15652969195.9EF729c.4990"
Content-Transfer-Encoding: 7bit


--15652969195.9EF729c.4990
Date: Thu, 8 Aug 2019 20:41:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110671

--- Comment #10 from Denys <d.budelkov@gmail.com> ---
Just added some debug to rc3 and tried to check what happens(in context of
5fc0cbfad4564856ee0f323d3f88a7cff19cc3f1).

So in program_timing_sync() there is preparing of groups of pipes for sync.=
=20
And looks like(in my case) pipe_set[j]->plane_state is always true,=20
and all elements > 0 is removed from the pipe_set in this case,=20
hence group_size =3D=3D 1 and dc->hwss.enable_timing_synchronization() newer
called.

Contrary with old check
!pipe_set[j]->stream_res.tg->funcs->is_blanked(pipe_set[j]->stream_res.tg) =
is
always false and we have our sync.

Maybe it should be !pipe_set[j]->plane_state instead of
pipe_set[j]->plane_state ?
I applied this change to my 5.3.0-rc3 build and so far everything looks ok.

I do not understand the purpose of is_blanked or plane_state, maybe with mst
hubs or other stuff it may be a different story, but in my simple config it
looks like just a typo.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15652969195.9EF729c.4990
Date: Thu, 8 Aug 2019 20:41:59 +0000
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
   title=3D"NEW - Regression: DP outputs out of sync on dual-DP tiled 5k sc=
reen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110671#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Regression: DP outputs out of sync on dual-DP tiled 5k sc=
reen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110671">bug 11067=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
d.budelkov&#64;gmail.com" title=3D"Denys &lt;d.budelkov&#64;gmail.com&gt;">=
 <span class=3D"fn">Denys</span></a>
</span></b>
        <pre>Just added some debug to rc3 and tried to check what happens(i=
n context of
5fc0cbfad4564856ee0f323d3f88a7cff19cc3f1).

So in program_timing_sync() there is preparing of groups of pipes for sync.=
=20
And looks like(in my case) pipe_set[j]-&gt;plane_state is always true,=20
and all elements &gt; 0 is removed from the pipe_set in this case,=20
hence group_size =3D=3D 1 and dc-&gt;hwss.enable_timing_synchronization() n=
ewer
called.

Contrary with old check
!pipe_set[j]-&gt;stream_res.tg-&gt;funcs-&gt;is_blanked(pipe_set[j]-&gt;str=
eam_res.tg) is
always false and we have our sync.

Maybe it should be !pipe_set[j]-&gt;plane_state instead of
pipe_set[j]-&gt;plane_state ?
I applied this change to my 5.3.0-rc3 build and so far everything looks ok.

I do not understand the purpose of is_blanked or plane_state, maybe with mst
hubs or other stuff it may be a different story, but in my simple config it
looks like just a typo.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15652969195.9EF729c.4990--

--===============2045830150==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2045830150==--
