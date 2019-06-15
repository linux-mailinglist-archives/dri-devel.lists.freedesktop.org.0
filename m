Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 286364716F
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 19:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F578926D;
	Sat, 15 Jun 2019 17:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id ABAA5892B5
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 17:39:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A804172167; Sat, 15 Jun 2019 17:39:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Sat, 15 Jun 2019 17:39:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: u9vata@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110897-502-8DLwCCI05M@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110897-502@http.bugs.freedesktop.org/>
References: <bug-110897-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1431387845=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1431387845==
Content-Type: multipart/alternative; boundary="15606203484.c41756.6468"
Content-Transfer-Encoding: 7bit


--15606203484.c41756.6468
Date: Sat, 15 Jun 2019 17:39:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #49 from Richard Thier <u9vata@gmail.com> ---
Hmmm. There are a lot of FIXMEs in the kernel at this part saying things are
not pretty sure. I think I am running into an other code path I should be
taking, but if this was always like this then maybe "fixing" it will just c=
ause
a whole lot of errors...

RC410 is said to use the "RAGE 8" architecture:

https://www.techpowerup.com/gpu-specs/ati-rc410.g757.

Looking up Rage8 it seems to be RV350 so the mesa side seems to be more rig=
ht
about what category it puts my card into.

In this place I see a lot of asics (for example r300_asic and r420_asic):

    drivers/gpu/drm/radeon/radeon_asic.c

All of these structs have their rxx_init functions set in the struct (basic=
ally
a vtable using structs and function pointers). I think maybe the wrong one =
is
used for my card.

For example RV410 is said to be r400 architecture card instead of "Rage8"
(RV350) architecture one here:

https://www.techpowerup.com/gpu-specs/ati-rv410.g9

It can very likely have happened that the because of the number itself they
classified my Mobility Radeon Xpress 200M as r400 while it is basically an
RV350 and having a marketing-affected naming scheme confusion...

Look at this function:

2306 /**
2307  * radeon_asic_init - register asic specific callbacks
2308  *
2309  * @rdev: radeon device pointer
2310  *
2311  * Registers the appropriate asic specific callbacks for each
2312  * chip family.  Also sets other asics specific info like the number
2313  * of crtcs and the register aperture accessors (all asics).
2314  * Returns 0 for success.
2315  */
2316 int radeon_asic_init(struct radeon_device *rdev)
2317 { ...

This is the one that sets the asic and there is a big switch-case for setti=
ng
the "proper" one in the driver based on "rdev->family".

My RC410 is not directly named here:

        case CHIP_R300:
        case CHIP_R350:
        case CHIP_RV350:
        case CHIP_RV380:
                if (rdev->flags & RADEON_IS_PCIE)
                        rdev->asic =3D &r300_asic_pcie;
                else
                        rdev->asic =3D &r300_asic;
                break;
        case CHIP_R420:
        case CHIP_R423:
        case CHIP_RV410:
                rdev->asic =3D &r420_asic;
                /* handle macs */
                if (rdev->bios =3D=3D NULL) {
                        rdev->asic->pm.get_engine_clock =3D
&radeon_legacy_get_engine_clock;
                        rdev->asic->pm.set_engine_clock =3D
&radeon_legacy_set_engine_clock;
                        rdev->asic->pm.get_memory_clock =3D
&radeon_legacy_get_memory_clock;
                        rdev->asic->pm.set_memory_clock =3D NULL;
                        rdev->asic->display.set_backlight_level =3D
&radeon_legacy_set_backlight_level;
                }
                break;
        case CHIP_RS400:
        case CHIP_RS480:
                rdev->asic =3D &rs400_asic;
                break;
        case CHIP_RS600:

(there are other families mentioned here as well, but these are the ones th=
at
might affect my case I think)

According to techpowerup.com saying that Xpress 200M is Rage8 architecture I
should also get an r300 asic and the same as the RV350:

https://www.techpowerup.com/gpu-specs/ati-rv350.g13

Also there is this "RS400" asic listed in the above switch case and it is s=
till
an other candidate maybe but surely not the rs400_asic.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15606203484.c41756.6468
Date: Sat, 15 Jun 2019 17:39:08 +0000
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
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c49">Comme=
nt # 49</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897">bug 11089=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
u9vata&#64;gmail.com" title=3D"Richard Thier &lt;u9vata&#64;gmail.com&gt;">=
 <span class=3D"fn">Richard Thier</span></a>
</span></b>
        <pre>Hmmm. There are a lot of FIXMEs in the kernel at this part say=
ing things are
not pretty sure. I think I am running into an other code path I should be
taking, but if this was always like this then maybe &quot;fixing&quot; it w=
ill just cause
a whole lot of errors...

RC410 is said to use the &quot;RAGE 8&quot; architecture:

<a href=3D"https://www.techpowerup.com/gpu-specs/ati-rc410.g757">https://ww=
w.techpowerup.com/gpu-specs/ati-rc410.g757</a>.

Looking up Rage8 it seems to be RV350 so the mesa side seems to be more rig=
ht
about what category it puts my card into.

In this place I see a lot of asics (for example r300_asic and r420_asic):

    drivers/gpu/drm/radeon/radeon_asic.c

All of these structs have their rxx_init functions set in the struct (basic=
ally
a vtable using structs and function pointers). I think maybe the wrong one =
is
used for my card.

For example RV410 is said to be r400 architecture card instead of &quot;Rag=
e8&quot;
(RV350) architecture one here:

<a href=3D"https://www.techpowerup.com/gpu-specs/ati-rv410.g9">https://www.=
techpowerup.com/gpu-specs/ati-rv410.g9</a>

It can very likely have happened that the because of the number itself they
classified my Mobility Radeon Xpress 200M as r400 while it is basically an
RV350 and having a marketing-affected naming scheme confusion...

Look at this function:

2306 /**
2307  * radeon_asic_init - register asic specific callbacks
2308  *
2309  * &#64;rdev: radeon device pointer
2310  *
2311  * Registers the appropriate asic specific callbacks for each
2312  * chip family.  Also sets other asics specific info like the number
2313  * of crtcs and the register aperture accessors (all asics).
2314  * Returns 0 for success.
2315  */
2316 int radeon_asic_init(struct radeon_device *rdev)
2317 { ...

This is the one that sets the asic and there is a big switch-case for setti=
ng
the &quot;proper&quot; one in the driver based on &quot;rdev-&gt;family&quo=
t;.

My RC410 is not directly named here:

        case CHIP_R300:
        case CHIP_R350:
        case CHIP_RV350:
        case CHIP_RV380:
                if (rdev-&gt;flags &amp; RADEON_IS_PCIE)
                        rdev-&gt;asic =3D &amp;r300_asic_pcie;
                else
                        rdev-&gt;asic =3D &amp;r300_asic;
                break;
        case CHIP_R420:
        case CHIP_R423:
        case CHIP_RV410:
                rdev-&gt;asic =3D &amp;r420_asic;
                /* handle macs */
                if (rdev-&gt;bios =3D=3D NULL) {
                        rdev-&gt;asic-&gt;pm.get_engine_clock =3D
&amp;radeon_legacy_get_engine_clock;
                        rdev-&gt;asic-&gt;pm.set_engine_clock =3D
&amp;radeon_legacy_set_engine_clock;
                        rdev-&gt;asic-&gt;pm.get_memory_clock =3D
&amp;radeon_legacy_get_memory_clock;
                        rdev-&gt;asic-&gt;pm.set_memory_clock =3D NULL;
                        rdev-&gt;asic-&gt;display.set_backlight_level =3D
&amp;radeon_legacy_set_backlight_level;
                }
                break;
        case CHIP_RS400:
        case CHIP_RS480:
                rdev-&gt;asic =3D &amp;rs400_asic;
                break;
        case CHIP_RS600:

(there are other families mentioned here as well, but these are the ones th=
at
might affect my case I think)

According to techpowerup.com saying that Xpress 200M is Rage8 architecture I
should also get an r300 asic and the same as the RV350:

<a href=3D"https://www.techpowerup.com/gpu-specs/ati-rv350.g13">https://www=
.techpowerup.com/gpu-specs/ati-rv350.g13</a>

Also there is this &quot;RS400&quot; asic listed in the above switch case a=
nd it is still
an other candidate maybe but surely not the rs400_asic.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15606203484.c41756.6468--

--===============1431387845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1431387845==--
