Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64130894EA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 01:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4CC88052;
	Sun, 11 Aug 2019 23:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0FBF189933
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 23:44:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0A46B72168; Sun, 11 Aug 2019 23:44:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sun, 11 Aug 2019 23:44:16 +0000
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
Message-ID: <bug-110674-502-NLtyfhkUHf@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2059111744=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2059111744==
Content-Type: multipart/alternative; boundary="15655670560.7CfE.19745"
Content-Transfer-Encoding: 7bit


--15655670560.7CfE.19745
Date: Sun, 11 Aug 2019 23:44:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #75 from ReddestDream <reddestdream@gmail.com> ---
>Here's some additional investigation.

>[SetUclkToHightestDpmLevel] Set hard min uclk failed! Appears as one of th=
e first errors in dmesg. This is from vega20_hwmgr.c:3354 and triggered by:

I agree that [SetUclkToHightestDpmLevel] is probably the key to all this as=
 it
always seems to be the first thing that fails after dysregulation occurs. T=
he
"Failed to send message 0x28, response 0x0" errors show that the driver is
sending wrong or at least wrongly timed commands to the GPU that eventually
cascade into complete failure.

>Again, it didn't help. I will note that this code is identical in 5.0.13=20

I have also been unable to find changed code since 5.0 that could be direct=
ly
connected to display detect/init/enumeration issues on Radeon VII/Vega 20. =
This
is why I've come to suspect the error is triggered indirectly in a way that
will probably not be obvious and by code that was likely flawed from the
beginning of Radeon VII/Vega 20 support.

This is also why I was hopeful that 5.3-rc2 would fix this issue since it h=
as
commits that do seem to affect display detection on AMD GPUs. Alas, it did =
not.
:(

>If the GPU did not crash with dpm disabled as a whole, the proper way to
proceed would be to start from there and step by step add dpm features and =
see
when it starts crashing. It's not a small task since dpm code paths may be
scattered all over the code.

Unfortunately, it does look like going through and slowing disabling featur=
es
and/or bisecting might be the only way to find how this issue got started. =
At
least if we could narrow it down, we might be in better shape. :/

I must admit I don't have much experience with graphics drivers and when I =
tell
other people about this issue, they immediately want to blame X or Mesa unt=
il I
explain that I can get these errors w/o starting any graphics at all. lol.

In any case, I really appreciate your testing Tom B. And any advice you mig=
ht
have on debugging, Sylvain BERTRAND, is greatly appreciated. :)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15655670560.7CfE.19745
Date: Sun, 11 Aug 2019 23:44:16 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c75">Comme=
nt # 75</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre><span class=3D"quote">&gt;Here's some additional investigation=
.</span >

<span class=3D"quote">&gt;[SetUclkToHightestDpmLevel] Set hard min uclk fai=
led! Appears as one of the first errors in dmesg. This is from vega20_hwmgr=
.c:3354 and triggered by:</span >

I agree that [SetUclkToHightestDpmLevel] is probably the key to all this as=
 it
always seems to be the first thing that fails after dysregulation occurs. T=
he
&quot;Failed to send message 0x28, response 0x0&quot; errors show that the =
driver is
sending wrong or at least wrongly timed commands to the GPU that eventually
cascade into complete failure.

<span class=3D"quote">&gt;Again, it didn't help. I will note that this code=
 is identical in 5.0.13 </span >

I have also been unable to find changed code since 5.0 that could be direct=
ly
connected to display detect/init/enumeration issues on Radeon VII/Vega 20. =
This
is why I've come to suspect the error is triggered indirectly in a way that
will probably not be obvious and by code that was likely flawed from the
beginning of Radeon VII/Vega 20 support.

This is also why I was hopeful that 5.3-rc2 would fix this issue since it h=
as
commits that do seem to affect display detection on AMD GPUs. Alas, it did =
not.
:(

<span class=3D"quote">&gt;If the GPU did not crash with dpm disabled as a w=
hole, the proper way to</span >
proceed would be to start from there and step by step add dpm features and =
see
when it starts crashing. It's not a small task since dpm code paths may be
scattered all over the code.

Unfortunately, it does look like going through and slowing disabling featur=
es
and/or bisecting might be the only way to find how this issue got started. =
At
least if we could narrow it down, we might be in better shape. :/

I must admit I don't have much experience with graphics drivers and when I =
tell
other people about this issue, they immediately want to blame X or Mesa unt=
il I
explain that I can get these errors w/o starting any graphics at all. lol.

In any case, I really appreciate your testing Tom B. And any advice you mig=
ht
have on debugging, Sylvain BERTRAND, is greatly appreciated. :)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15655670560.7CfE.19745--

--===============2059111744==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2059111744==--
