Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F40790AC9
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 00:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5DA6E9B5;
	Fri, 16 Aug 2019 22:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 321326E9BC
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 22:14:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2F0DE7215A; Fri, 16 Aug 2019 22:14:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Fri, 16 Aug 2019 22:14:48 +0000
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
Message-ID: <bug-110674-502-TdnMsbObgl@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0308665635=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0308665635==
Content-Type: multipart/alternative; boundary="15659936882.B30C7ab0.25908"
Content-Transfer-Encoding: 7bit


--15659936882.B30C7ab0.25908
Date: Fri, 16 Aug 2019 22:14:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #109 from Tom B <tom@r.je> ---
Created attachment 145080
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145080&action=3Dedit
dmesg with amdgpu.dpm=3D2

> Tom B., did you try booting with amdgpu.dpm=3D1 or amdgpu.dpm=3D2 (defaul=
t is generally -1 for automatic)? Seems like one of those might enable the =
new experimental SW SMU v11 feature on Vega20 . . .

Now that is interesting.dpm=3D-1 is the same as default, and default is 1,
enabled so dpm=3D1 is what we've been using all along. But dpm=3D2 and the =
patch
you linked to are interesting.

I tried it, it didn't help the crashing issue and I was stuck at 30w. As so=
on
as I started sddm the system froze. I've attached my dmesg from amdgpu.dpm=
=3D2
boot. It doesn't fix the issue but it does help answer a few questions I ha=
d:


1. The functions in vega20_ppt.c are used with this new patch so that answe=
rs
my question from earlier, that's what this file is for and why it contains
similar/identical functions.

2. It explains the difference I found in comment 97: This commit
https://github.com/torvalds/linux/commit/94ed6d0cfdb867be9bf05f03d682980bce=
5d0036
has the new else block for smu_display_configuration_change which we now kn=
ow
is the software version of this function.


More importantly, though, knowing that enabling DPM causes the crash, this
tells us either:

A) The bug is present in both versions of the vega20 code: vega20_hwmgr.c a=
nd
vega20_ppt.c or..

B) The card reaches an invalid state before DPM is initialised and the card=
 is
fine until it receives a DPM change.

Given that two different versions of the code produce the same result, my h=
unch
is that the problem is B. The card is not in a state where it's able to rec=
eive
power changes.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15659936882.B30C7ab0.25908
Date: Fri, 16 Aug 2019 22:14:48 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c109">Comm=
ent # 109</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145080=
" name=3D"attach_145080" title=3D"dmesg with amdgpu.dpm=3D2">attachment 145=
080</a> <a href=3D"attachment.cgi?id=3D145080&amp;action=3Dedit" title=3D"d=
mesg with amdgpu.dpm=3D2">[details]</a></span>
dmesg with amdgpu.dpm=3D2

<span class=3D"quote">&gt; Tom B., did you try booting with amdgpu.dpm=3D1 =
or amdgpu.dpm=3D2 (default is generally -1 for automatic)? Seems like one o=
f those might enable the new experimental SW SMU v11 feature on Vega20 . . =
.</span >

Now that is interesting.dpm=3D-1 is the same as default, and default is 1,
enabled so dpm=3D1 is what we've been using all along. But dpm=3D2 and the =
patch
you linked to are interesting.

I tried it, it didn't help the crashing issue and I was stuck at 30w. As so=
on
as I started sddm the system froze. I've attached my dmesg from amdgpu.dpm=
=3D2
boot. It doesn't fix the issue but it does help answer a few questions I ha=
d:


1. The functions in vega20_ppt.c are used with this new patch so that answe=
rs
my question from earlier, that's what this file is for and why it contains
similar/identical functions.

2. It explains the difference I found in <a href=3D"show_bug.cgi?id=3D11067=
4#c97">comment 97</a>: This commit
<a href=3D"https://github.com/torvalds/linux/commit/94ed6d0cfdb867be9bf05f0=
3d682980bce5d0036">https://github.com/torvalds/linux/commit/94ed6d0cfdb867b=
e9bf05f03d682980bce5d0036</a>
has the new else block for smu_display_configuration_change which we now kn=
ow
is the software version of this function.


More importantly, though, knowing that enabling DPM causes the crash, this
tells us either:

A) The bug is present in both versions of the vega20 code: vega20_hwmgr.c a=
nd
vega20_ppt.c or..

B) The card reaches an invalid state before DPM is initialised and the card=
 is
fine until it receives a DPM change.

Given that two different versions of the code produce the same result, my h=
unch
is that the problem is B. The card is not in a state where it's able to rec=
eive
power changes.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15659936882.B30C7ab0.25908--

--===============0308665635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0308665635==--
