Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6B58A660
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 20:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2ECD6E5B9;
	Mon, 12 Aug 2019 18:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4226D6E5BE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 18:37:40 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3E75572167; Mon, 12 Aug 2019 18:37:40 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Mon, 12 Aug 2019 18:37:40 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: reddestdream@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-iRMzszhlSx@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1000069588=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1000069588==
Content-Type: multipart/alternative; boundary="15656350603.B7cD.7919"
Content-Transfer-Encoding: 7bit


--15656350603.B7cD.7919
Date: Mon, 12 Aug 2019 18:37:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #91 from ReddestDream <reddestdream@gmail.com> ---
>It returns 0 on success and -EIO on failure, which is then in turn returne=
d from vega20_set_fclk_to_highest_dpm_leve. Where did you see the check/ret=
ry on EINVAL? Perhaps -EIO should be -EINVAL?

I didn't find check/retry code. It was more just a thought that maybe we co=
uld
keep vega20_set_uclk_to_highest_dpm_level from just returning despite the e=
rror
and allowing further initialization to proceed. Even if it crashed, that mi=
ght
be even be helpful since it's not clear if it's the initialization
(drm_dev_register) or something else that is silent in the logs that is
changing something and causing vega20_set_uclk_to_highest_dpm_level to fail
where we know it succeeded so many times before.

>I'm not sure this is helpful but I managed to somewhat test the race condi=
tion theory.

If there is a race, I'm not sure it's in the time the driver waits for the
hardware registers to respond and/or the value to set. But it's still
enlightening.

At this point it seems more likely that something else we aren't seeing in =
the
logs is breaking vega20_set_uclk_to_highest_dpm_level in the last moments
(unlikely due to the dpm_state.hard_min_level value), it falls through and
drm_dev_register runs and initialization message prints. amdgpu doesn't
consider the "[SetUclkToHightestDpmLevel] Set hard min uclk failed!" to be a
significant enough error to stop initialization. But maybe it should . . .

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15656350603.B7cD.7919
Date: Mon, 12 Aug 2019 18:37:40 +0000
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
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c91">Comme=
nt # 91</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre><span class=3D"quote">&gt;It returns 0 on success and -EIO on =
failure, which is then in turn returned from vega20_set_fclk_to_highest_dpm=
_leve. Where did you see the check/retry on EINVAL? Perhaps -EIO should be =
-EINVAL?</span >

I didn't find check/retry code. It was more just a thought that maybe we co=
uld
keep vega20_set_uclk_to_highest_dpm_level from just returning despite the e=
rror
and allowing further initialization to proceed. Even if it crashed, that mi=
ght
be even be helpful since it's not clear if it's the initialization
(drm_dev_register) or something else that is silent in the logs that is
changing something and causing vega20_set_uclk_to_highest_dpm_level to fail
where we know it succeeded so many times before.

<span class=3D"quote">&gt;I'm not sure this is helpful but I managed to som=
ewhat test the race condition theory.</span >

If there is a race, I'm not sure it's in the time the driver waits for the
hardware registers to respond and/or the value to set. But it's still
enlightening.

At this point it seems more likely that something else we aren't seeing in =
the
logs is breaking vega20_set_uclk_to_highest_dpm_level in the last moments
(unlikely due to the dpm_state.hard_min_level value), it falls through and
drm_dev_register runs and initialization message prints. amdgpu doesn't
consider the &quot;[SetUclkToHightestDpmLevel] Set hard min uclk failed!&qu=
ot; to be a
significant enough error to stop initialization. But maybe it should . . .<=
/pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15656350603.B7cD.7919--

--===============1000069588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1000069588==--
