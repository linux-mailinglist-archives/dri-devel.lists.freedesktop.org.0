Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E65A433D1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB9A8972C;
	Thu, 13 Jun 2019 07:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1B0F98972C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 07:44:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 12ABB72167; Thu, 13 Jun 2019 07:44:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110822] [Bisected]Booting with kernel version 5.1.0 or higher
 on RX 580 hangs
Date: Thu, 13 Jun 2019 07:44:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: gobinda.joy@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110822-502-CIdVjTvXBP@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110822-502@http.bugs.freedesktop.org/>
References: <bug-110822-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0397144533=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0397144533==
Content-Type: multipart/alternative; boundary="15604118810.eE4cC.15441"
Content-Transfer-Encoding: 7bit


--15604118810.eE4cC.15441
Date: Thu, 13 Jun 2019 07:44:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110822

--- Comment #20 from Gobinda Joy <gobinda.joy@gmail.com> ---
(In reply to Alex Deucher from comment #19)
> (In reply to Gobinda Joy from comment #18)
> >=20
> > What I don't get is why they are using 2 calls to get the bandwidth rea=
ding.
> > Since both function walking the PCIe tree what's the point. Also it see=
ms
> > like the call to pcie_bandwidth_available() function is casing the
> > freeze/hangs in my system. So that's counts for something.
> >=20
>=20
> Can you try a drm-next kernel?  This code was ultimately cleaned in this
> patch:
> https://cgit.freedesktop.org/drm/drm/commit/
> ?id=3Ddbaa922b5706b1aff4572c280e15bbea2d04afe6
> I don't know why pcie_bandwidth_available() is causing problems for you,
> it's just standard PCIE stuff.

Yes, I have tried the drm-next kernel and also tried that patch with current
5.2.0-rc4 same result boot hang. But this time I couldn't even get any log.

As little as I understand this, the difference between these two functions
seems one reads the link capability (PCI_EXP_LNKCAP) other one tries to read
link status (PCI_EXP_LNKSTA) and causes problem.

It could be that older UEFI BIOS like mine doesn't initialize the device
properly when the link status gets accessed because newer board doesn't have
this problem.

Also it could be that my board has a PLEX chip between the CPU and PCIE slo=
ts
and there is no direct CPU<->PCIE slots available.

The PLEX chip is used to provide 2 x16_gen3 PCIE slot and 2 x8_gen3 PCIE sl=
ot.
If all four slot gets populated first 2 slot will be downgraded to x8_gen3
slots as the 3rd/4th slot shares the bandwidth.

If the older method working fine for the newer cards too is there a reason =
to
use pcie_bandwidth_available() function at all.

I'm way out of my league here. So don't get offended, I'm just curious.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15604118810.eE4cC.15441
Date: Thu, 13 Jun 2019 07:44:41 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - [Bisected]Booting with kernel version 5.1.0 or highe=
r on RX 580 hangs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822#c20">Comme=
nt # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [Bisected]Booting with kernel version 5.1.0 or highe=
r on RX 580 hangs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822">bug 11082=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gobinda.joy&#64;gmail.com" title=3D"Gobinda Joy &lt;gobinda.joy&#64;gmail.c=
om&gt;"> <span class=3D"fn">Gobinda Joy</span></a>
</span></b>
        <pre>(In reply to Alex Deucher from <a href=3D"show_bug.cgi?id=3D11=
0822#c19">comment #19</a>)
<span class=3D"quote">&gt; (In reply to Gobinda Joy from <a href=3D"show_bu=
g.cgi?id=3D110822#c18">comment #18</a>)
&gt; &gt;=20
&gt; &gt; What I don't get is why they are using 2 calls to get the bandwid=
th reading.
&gt; &gt; Since both function walking the PCIe tree what's the point. Also =
it seems
&gt; &gt; like the call to pcie_bandwidth_available() function is casing the
&gt; &gt; freeze/hangs in my system. So that's counts for something.
&gt; &gt;=20
&gt;=20
&gt; Can you try a drm-next kernel?  This code was ultimately cleaned in th=
is
&gt; patch:
&gt; <a href=3D"https://cgit.freedesktop.org/drm/drm/commit/">https://cgit.=
freedesktop.org/drm/drm/commit/</a>
&gt; ?id=3Ddbaa922b5706b1aff4572c280e15bbea2d04afe6
&gt; I don't know why pcie_bandwidth_available() is causing problems for yo=
u,
&gt; it's just standard PCIE stuff.</span >

Yes, I have tried the drm-next kernel and also tried that patch with current
5.2.0-rc4 same result boot hang. But this time I couldn't even get any log.

As little as I understand this, the difference between these two functions
seems one reads the link capability (PCI_EXP_LNKCAP) other one tries to read
link status (PCI_EXP_LNKSTA) and causes problem.

It could be that older UEFI BIOS like mine doesn't initialize the device
properly when the link status gets accessed because newer board doesn't have
this problem.

Also it could be that my board has a PLEX chip between the CPU and PCIE slo=
ts
and there is no direct CPU&lt;-&gt;PCIE slots available.

The PLEX chip is used to provide 2 x16_gen3 PCIE slot and 2 x8_gen3 PCIE sl=
ot.
If all four slot gets populated first 2 slot will be downgraded to x8_gen3
slots as the 3rd/4th slot shares the bandwidth.

If the older method working fine for the newer cards too is there a reason =
to
use pcie_bandwidth_available() function at all.

I'm way out of my league here. So don't get offended, I'm just curious.</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15604118810.eE4cC.15441--

--===============0397144533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0397144533==--
