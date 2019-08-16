Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E41B90B54
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 01:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F6A6E3CE;
	Fri, 16 Aug 2019 23:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD2BF6E9BD
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 23:19:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BA6507215A; Fri, 16 Aug 2019 23:19:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Fri, 16 Aug 2019 23:19:25 +0000
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
Message-ID: <bug-110674-502-ezRHSfF7T3@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0725341565=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0725341565==
Content-Type: multipart/alternative; boundary="15659975654.7B625ca4E.3273"
Content-Transfer-Encoding: 7bit


--15659975654.7B625ca4E.3273
Date: Fri, 16 Aug 2019 23:19:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #110 from ReddestDream <reddestdream@gmail.com> ---
> 1. The functions in vega20_ppt.c are used with this new patch so that ans=
wers my question from earlier, that's what this file is for and why it cont=
ains similar/identical functions.

I was hoping this was the case as the duplicated functions were confusing me
too. Glad we got this figured out! :)

> I tried it, it didn't help the crashing issue and I was stuck at 30w. As =
soon as I started sddm the system froze. I've attached my dmesg from amdgpu=
.dpm=3D2 boot. It doesn't fix the issue but it does help answer a few quest=
ions I had:

This is disappointing tho. I was hoping that setting amdgpu.dpm=3D2 would u=
se the
more "actively developed" path and that would fix the issue. :/

> Given that two different versions of the code produce the same result, my=
 hunch is that the problem is B. The card is not in a state where it's able=
 to receive power changes.

I tend to agree, but it's still not clear why or how the card ends up in a =
bad
state when commands to it via smu_send_smc_msg_with_param seem to just sudd=
enly
stop working. And given the amount of same/similar functions in vega20_hwmg=
r.c
and vega20_ppt.c it's hard to rule out A entirely.

Since amdgpu.dpm=3D0 resolves the issue (albeit at the cost of being stuck =
at
minimum clocks inherited from the VBIOS/GOP/UEFI/firmware), it seems that t=
he
card is starting out in a reasonable state and then being thrown into a bad
state later by bad driver code. And that code is part of the DPM (Dynamic P=
ower
Management) system. We are pretty confident that dpm_state.hard_min_level is
stable the whole time, so that's probably not what's throwing the card into=
 a
bad state. But perhaps another value in the DPM table is . . .=20

It doesn't make intuitive sense that the soft min/max values would be
problematic since they are presumably "more flexible," but it's possible th=
at
they get calculated out of spec or something and logging them should be
possible like how dpm_state.hard_min_level was logged.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15659975654.7B625ca4E.3273
Date: Fri, 16 Aug 2019 23:19:25 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c110">Comm=
ent # 110</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre><span class=3D"quote">&gt; 1. The functions in vega20_ppt.c ar=
e used with this new patch so that answers my question from earlier, that's=
 what this file is for and why it contains similar/identical functions.</sp=
an >

I was hoping this was the case as the duplicated functions were confusing me
too. Glad we got this figured out! :)

<span class=3D"quote">&gt; I tried it, it didn't help the crashing issue an=
d I was stuck at 30w. As soon as I started sddm the system froze. I've atta=
ched my dmesg from amdgpu.dpm=3D2 boot. It doesn't fix the issue but it doe=
s help answer a few questions I had:</span >

This is disappointing tho. I was hoping that setting amdgpu.dpm=3D2 would u=
se the
more &quot;actively developed&quot; path and that would fix the issue. :/

<span class=3D"quote">&gt; Given that two different versions of the code pr=
oduce the same result, my hunch is that the problem is B. The card is not i=
n a state where it's able to receive power changes.</span >

I tend to agree, but it's still not clear why or how the card ends up in a =
bad
state when commands to it via smu_send_smc_msg_with_param seem to just sudd=
enly
stop working. And given the amount of same/similar functions in vega20_hwmg=
r.c
and vega20_ppt.c it's hard to rule out A entirely.

Since amdgpu.dpm=3D0 resolves the issue (albeit at the cost of being stuck =
at
minimum clocks inherited from the VBIOS/GOP/UEFI/firmware), it seems that t=
he
card is starting out in a reasonable state and then being thrown into a bad
state later by bad driver code. And that code is part of the DPM (Dynamic P=
ower
Management) system. We are pretty confident that dpm_state.hard_min_level is
stable the whole time, so that's probably not what's throwing the card into=
 a
bad state. But perhaps another value in the DPM table is . . .=20

It doesn't make intuitive sense that the soft min/max values would be
problematic since they are presumably &quot;more flexible,&quot; but it's p=
ossible that
they get calculated out of spec or something and logging them should be
possible like how dpm_state.hard_min_level was logged.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15659975654.7B625ca4E.3273--

--===============0725341565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0725341565==--
