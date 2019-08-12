Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5158A367
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 18:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FAC6E580;
	Mon, 12 Aug 2019 16:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id AAB5B6E58E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 16:32:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A820572167; Mon, 12 Aug 2019 16:32:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Mon, 12 Aug 2019 16:32:01 +0000
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
Message-ID: <bug-110674-502-y4ESKiGqRG@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2035925096=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2035925096==
Content-Type: multipart/alternative; boundary="15656275216.fcE9.21155"
Content-Transfer-Encoding: 7bit


--15656275216.fcE9.21155
Date: Mon, 12 Aug 2019 16:32:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #86 from ReddestDream <reddestdream@gmail.com> ---
>In addition to that, vega20_set_fclk_to_highest_dpm_level is called severa=
l times before the card is initialized and even on 5.2.7 works. Something h=
appens during or just before the initialization stage that stops smum_send_=
msg_to_smc_with_parameter accepting 1001 as a valid value, as it does until=
 that point.

Could be we've got a race condition between the powerplay setup and amdgpu
handing off the card to drm_dev_register to advertise it for normal use.

drm_dev_register is responsible for the "[drm] Initialized" message:

https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/drm_drv.c#L994

And it seems like amdgpu calls it here:

https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/amd/amdgpu/am=
dgpu_drv.c#L1054

Odd that it's doing this if powerplay still has more work to do. And that m=
ight
be why vega20_set_uclk_to_highest_dpm_level fails that last time.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15656275216.fcE9.21155
Date: Mon, 12 Aug 2019 16:32:01 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c86">Comme=
nt # 86</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre><span class=3D"quote">&gt;In addition to that, vega20_set_fclk=
_to_highest_dpm_level is called several times before the card is initialize=
d and even on 5.2.7 works. Something happens during or just before the init=
ialization stage that stops smum_send_msg_to_smc_with_parameter accepting 1=
001 as a valid value, as it does until that point.</span >

Could be we've got a race condition between the powerplay setup and amdgpu
handing off the card to drm_dev_register to advertise it for normal use.

drm_dev_register is responsible for the &quot;[drm] Initialized&quot; messa=
ge:

<a href=3D"https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/dr=
m_drv.c#L994">https://github.com/torvalds/linux/blob/master/drivers/gpu/drm=
/drm_drv.c#L994</a>

And it seems like amdgpu calls it here:

<a href=3D"https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c#L1054">https://github.com/torvalds/linux/blob/master/=
drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c#L1054</a>

Odd that it's doing this if powerplay still has more work to do. And that m=
ight
be why vega20_set_uclk_to_highest_dpm_level fails that last time.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15656275216.fcE9.21155--

--===============2035925096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2035925096==--
