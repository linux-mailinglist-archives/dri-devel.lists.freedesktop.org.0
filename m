Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C1C89F83
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 15:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8536E046;
	Mon, 12 Aug 2019 13:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id DAC776E50C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 13:21:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D778372167; Mon, 12 Aug 2019 13:21:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Mon, 12 Aug 2019 13:21:03 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-B4DRdj91Tt@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0565557666=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0565557666==
Content-Type: multipart/alternative; boundary="15656160633.0B26B.23910"
Content-Transfer-Encoding: 7bit


--15656160633.0B26B.23910
Date: Mon, 12 Aug 2019 13:21:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #80 from Tom B <tom@r.je> ---
> I tried something like that before but a huge portion of the commits in t=
hat range won't build kernels that can boot (at least on my system). I ende=
d up resorting to trying reverting individual vega20-affecting  commits out=
 of 5.1. See my results far above in the thread (though someone else willin=
g to spend more time doing a deeper analysis of the code could probably tak=
e my approach much further).

That's why my focus has been finding places in the code where something
different happens based on the number of displays. Though this may be a fut=
ile
avenue of exploration as it could just be an issue of additional memory
bandwith requirements or even something that should be done differently wit=
h 2
displays that isn't.

> It does make me wonder if it's worth testing like 2 simple 1080p 60 Hz di=
splays. Maybe that wouldn't trigger this issue. Not that that would really =
be of use to me. But it might help distinguish between just monitor detect =
generally being broken and "high monitor load" being broken . . .

This would be an interesting test but I think 1080p 60hz monitors with
displayport are fairly uncommon and I don't have any to test with. My guess=
 is
anyone with a Radeon VII, a high end card with 16gb VRAM, is likely to have=
 a
high end display which could equally explain why there are no reports here =
of
people running 1080p 60hz displays.=20

My next test is going to be logging dpm_table->dpm_state.hard_min_level on =
line
3354 (just before it's sent to the smc) on both 5.0.13 and 5.2.7 to see if =
the
same hard_min_level value is sent to the smc on both kernels. This will at
least let us know whether it's something that's incorrectly setting
hard_min_level or something that prevents the smc accepting the value. My h=
unch
from my previous tests is that it's the latter but I'll try it and report b=
ack.

I know nothing about driver development so I have no idea how this stuff sh=
ould
work, I can only compare the differences between 5.0.13 and later kernels.

Anyway, thanks everyone for your input. Any information, even on things that
you tried and didn't work, is valuable as it can help us narrow down the
problem.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15656160633.0B26B.23910
Date: Mon, 12 Aug 2019 13:21:03 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c80">Comme=
nt # 80</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre><span class=3D"quote">&gt; I tried something like that before =
but a huge portion of the commits in that range won't build kernels that ca=
n boot (at least on my system). I ended up resorting to trying reverting in=
dividual vega20-affecting  commits out of 5.1. See my results far above in =
the thread (though someone else willing to spend more time doing a deeper a=
nalysis of the code could probably take my approach much further).</span >

That's why my focus has been finding places in the code where something
different happens based on the number of displays. Though this may be a fut=
ile
avenue of exploration as it could just be an issue of additional memory
bandwith requirements or even something that should be done differently wit=
h 2
displays that isn't.

<span class=3D"quote">&gt; It does make me wonder if it's worth testing lik=
e 2 simple 1080p 60 Hz displays. Maybe that wouldn't trigger this issue. No=
t that that would really be of use to me. But it might help distinguish bet=
ween just monitor detect generally being broken and &quot;high monitor load=
&quot; being broken . . .</span >

This would be an interesting test but I think 1080p 60hz monitors with
displayport are fairly uncommon and I don't have any to test with. My guess=
 is
anyone with a Radeon VII, a high end card with 16gb VRAM, is likely to have=
 a
high end display which could equally explain why there are no reports here =
of
people running 1080p 60hz displays.=20

My next test is going to be logging dpm_table-&gt;dpm_state.hard_min_level =
on line
3354 (just before it's sent to the smc) on both 5.0.13 and 5.2.7 to see if =
the
same hard_min_level value is sent to the smc on both kernels. This will at
least let us know whether it's something that's incorrectly setting
hard_min_level or something that prevents the smc accepting the value. My h=
unch
from my previous tests is that it's the latter but I'll try it and report b=
ack.

I know nothing about driver development so I have no idea how this stuff sh=
ould
work, I can only compare the differences between 5.0.13 and later kernels.

Anyway, thanks everyone for your input. Any information, even on things that
you tried and didn't work, is valuable as it can help us narrow down the
problem.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15656160633.0B26B.23910--

--===============0565557666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0565557666==--
