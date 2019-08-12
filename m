Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 554648A4C8
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 19:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75C16E58B;
	Mon, 12 Aug 2019 17:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 150C06E58F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 17:40:12 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 11A9A72167; Mon, 12 Aug 2019 17:40:12 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Mon, 12 Aug 2019 17:40:12 +0000
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
Message-ID: <bug-110674-502-ejlzG0qZ2f@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0351146533=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0351146533==
Content-Type: multipart/alternative; boundary="15656316120.Bf4a.31562"
Content-Transfer-Encoding: 7bit


--15656316120.Bf4a.31562
Date: Mon, 12 Aug 2019 17:40:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #90 from Tom B <tom@r.je> ---
I'm not sure this is helpful but I managed to somewhat test the race condit=
ion
theory.

If you follow the callstack:

vega20_set_fclk_to_highest_dpm_level -> smum_send_msg_to_smc_with_parameter=
 ->
vega20_send_msg_to_smc_with_parameter -> vega20_wait_for_response ->
phm_wait_for_register_unequal you find this code in smu_helper.c:

int phm_wait_on_register(struct pp_hwmgr *hwmgr, uint32_t index,
                         uint32_t value, uint32_t mask)
{
        uint32_t i;
        uint32_t cur_value;

        if (hwmgr =3D=3D NULL || hwmgr->device =3D=3D NULL) {
                pr_err("Invalid Hardware Manager!");
                return -EINVAL;
        }

        for (i =3D 0; i < hwmgr->usec_timeout; i++) {
                cur_value =3D cgs_read_register(hwmgr->device, index);
                if ((cur_value & mask) =3D=3D (value & mask))
                        break;
                udelay(1);
        }

        /* timeout means wrong logic*/
        if (i =3D=3D hwmgr->usec_timeout)
                return -1;
        return 0;
}


The timeout there is interesting. I increased it.


for (i =3D 0; i < hwmgr->usec_timeout*10; i++) {
                cur_value =3D cgs_read_register(hwmgr->device, index);
                if ((cur_value & mask) =3D=3D (value & mask))
                        break;
                udelay(1);
        }


The PC takes significantly longer to boot (10 or so seconds when it's usual=
ly
instant) and the error still occurs. So I'm not sure it's just a matter of
waiting.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15656316120.Bf4a.31562
Date: Mon, 12 Aug 2019 17:40:12 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c90">Comme=
nt # 90</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>I'm not sure this is helpful but I managed to somewhat test th=
e race condition
theory.

If you follow the callstack:

vega20_set_fclk_to_highest_dpm_level -&gt; smum_send_msg_to_smc_with_parame=
ter -&gt;
vega20_send_msg_to_smc_with_parameter -&gt; vega20_wait_for_response -&gt;
phm_wait_for_register_unequal you find this code in smu_helper.c:

int phm_wait_on_register(struct pp_hwmgr *hwmgr, uint32_t index,
                         uint32_t value, uint32_t mask)
{
        uint32_t i;
        uint32_t cur_value;

        if (hwmgr =3D=3D NULL || hwmgr-&gt;device =3D=3D NULL) {
                pr_err(&quot;Invalid Hardware Manager!&quot;);
                return -EINVAL;
        }

        for (i =3D 0; i &lt; hwmgr-&gt;usec_timeout; i++) {
                cur_value =3D cgs_read_register(hwmgr-&gt;device, index);
                if ((cur_value &amp; mask) =3D=3D (value &amp; mask))
                        break;
                udelay(1);
        }

        /* timeout means wrong logic*/
        if (i =3D=3D hwmgr-&gt;usec_timeout)
                return -1;
        return 0;
}


The timeout there is interesting. I increased it.


for (i =3D 0; i &lt; hwmgr-&gt;usec_timeout*10; i++) {
                cur_value =3D cgs_read_register(hwmgr-&gt;device, index);
                if ((cur_value &amp; mask) =3D=3D (value &amp; mask))
                        break;
                udelay(1);
        }


The PC takes significantly longer to boot (10 or so seconds when it's usual=
ly
instant) and the error still occurs. So I'm not sure it's just a matter of
waiting.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15656316120.Bf4a.31562--

--===============0351146533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0351146533==--
