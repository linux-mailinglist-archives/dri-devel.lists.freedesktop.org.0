Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C628A2BB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 17:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9FD6E560;
	Mon, 12 Aug 2019 15:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id EF2516E563
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 15:56:31 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CF3EE72168; Mon, 12 Aug 2019 15:56:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Mon, 12 Aug 2019 15:56:32 +0000
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
Message-ID: <bug-110674-502-D2rlBNnA5t@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0148548089=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0148548089==
Content-Type: multipart/alternative; boundary="15656253911.Ebb022b.14995"
Content-Transfer-Encoding: 7bit


--15656253911.Ebb022b.14995
Date: Mon, 12 Aug 2019 15:56:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #85 from Tom B <tom@r.je> ---

> Yeah. I've had boots where I have my 2 4K DP monitors in and I don't get =
powerplay error on boot. In fact, it can go a bit and seem stable.

In addition to that, vega20_set_fclk_to_highest_dpm_level is called several
times before the card is initialized and even on 5.2.7 works. Something hap=
pens
during or just before the initialization stage that stops
smum_send_msg_to_smc_with_parameter accepting 1001 as a valid value, as it =
does
until that point.

I think you're right about BACO, it was worth looking at but I applied a qu=
ick
hack to ensure it's disabled:

int vega20_baco_set_state(struct pp_hwmgr *hwmgr, enum BACO_STATE state)
{
        return 0;
}

int vega20_baco_get_capability(struct pp_hwmgr *hwmgr, bool *cap)
{
    *cap =3D false;
    return 0;
}

No difference, I still get the errors and wrong wattage so unless BACO is
somehow on by default and only turned off in the proper version of this cod=
e,
we can rule it out.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15656253911.Ebb022b.14995
Date: Mon, 12 Aug 2019 15:56:31 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c85">Comme=
nt # 85</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>
<span class=3D"quote">&gt; Yeah. I've had boots where I have my 2 4K DP mon=
itors in and I don't get powerplay error on boot. In fact, it can go a bit =
and seem stable.</span >

In addition to that, vega20_set_fclk_to_highest_dpm_level is called several
times before the card is initialized and even on 5.2.7 works. Something hap=
pens
during or just before the initialization stage that stops
smum_send_msg_to_smc_with_parameter accepting 1001 as a valid value, as it =
does
until that point.

I think you're right about BACO, it was worth looking at but I applied a qu=
ick
hack to ensure it's disabled:

int vega20_baco_set_state(struct pp_hwmgr *hwmgr, enum BACO_STATE state)
{
        return 0;
}

int vega20_baco_get_capability(struct pp_hwmgr *hwmgr, bool *cap)
{
    *cap =3D false;
    return 0;
}

No difference, I still get the errors and wrong wattage so unless BACO is
somehow on by default and only turned off in the proper version of this cod=
e,
we can rule it out.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15656253911.Ebb022b.14995--

--===============0148548089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0148548089==--
