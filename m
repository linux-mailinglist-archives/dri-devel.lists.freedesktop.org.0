Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D23228D763
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 17:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165A889228;
	Wed, 14 Aug 2019 15:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3425A89228
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 15:44:46 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3088A7215A; Wed, 14 Aug 2019 15:44:46 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Wed, 14 Aug 2019 15:44:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: tom@r.je
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110674-502-KOkMOp4Cwq@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1927573160=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1927573160==
Content-Type: multipart/alternative; boundary="15657974861.A10423b9.2052"
Content-Transfer-Encoding: 7bit


--15657974861.A10423b9.2052
Date: Wed, 14 Aug 2019 15:44:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #99 from Tom B <tom@r.je> ---
Created attachment 145062
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145062&action=3Dedit
a list of commits 5.0.13 - 5.1.0

Attached is a list of all amdgpu and powerplay commits from 5.0.13 - 5.1.0.=
=20

I have tried reverting the following which looked most likely culprits:

919a94d8101ebc29868940b580fe9e9811b7dc86 drm/amdgpu: fix CPDMA hang in PRT =
mode
for VEGA20

f7b1844bacecca96dd8d813675e4d8adec02cd66 drm/amdgpu: Update gc golden setti=
ng
for vega family

d25689760b747287c6ca03cfe0729da63e0717f4 drm/amdgpu/display:
drm/amdgpu/display: Keep malloc ref to MST port  -- A change to the way
displayport connectors are handled, looked promising.

db64a2f43c1bc22c5ff2d22606000b8c3587d0ec drm/amd/powerplay: fix possible ha=
ng
with 3+ 4K monitors


I also looked at that last one in detail as it seems very close to this bug.
Nothing in the code looks for 3+ monitors or even 4k. It only actually looks
for > 1 monitor.

Although it's based on disable_mclk_switching, I also tried forcing
disable_fclk_switching to true and false, neither had any affect. The resul=
t is
that mclk would be calculated based on screens but fclk would be forced on/=
off.
 It didn't help but I can't help think that this commit is a little too clo=
se
to this issue to be irrelevant.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15657974861.A10423b9.2052
Date: Wed, 14 Aug 2019 15:44:46 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c99">Comme=
nt # 99</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145062=
" name=3D"attach_145062" title=3D"a list of commits 5.0.13 - 5.1.0">attachm=
ent 145062</a> <a href=3D"attachment.cgi?id=3D145062&amp;action=3Dedit" tit=
le=3D"a list of commits 5.0.13 - 5.1.0">[details]</a></span>
a list of commits 5.0.13 - 5.1.0

Attached is a list of all amdgpu and powerplay commits from 5.0.13 - 5.1.0.=
=20

I have tried reverting the following which looked most likely culprits:

919a94d8101ebc29868940b580fe9e9811b7dc86 drm/amdgpu: fix CPDMA hang in PRT =
mode
for VEGA20

f7b1844bacecca96dd8d813675e4d8adec02cd66 drm/amdgpu: Update gc golden setti=
ng
for vega family

d25689760b747287c6ca03cfe0729da63e0717f4 drm/amdgpu/display:
drm/amdgpu/display: Keep malloc ref to MST port  -- A change to the way
displayport connectors are handled, looked promising.

db64a2f43c1bc22c5ff2d22606000b8c3587d0ec drm/amd/powerplay: fix possible ha=
ng
with 3+ 4K monitors


I also looked at that last one in detail as it seems very close to this bug.
Nothing in the code looks for 3+ monitors or even 4k. It only actually looks
for &gt; 1 monitor.

Although it's based on disable_mclk_switching, I also tried forcing
disable_fclk_switching to true and false, neither had any affect. The resul=
t is
that mclk would be calculated based on screens but fclk would be forced on/=
off.
 It didn't help but I can't help think that this commit is a little too clo=
se
to this issue to be irrelevant.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15657974861.A10423b9.2052--

--===============1927573160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1927573160==--
