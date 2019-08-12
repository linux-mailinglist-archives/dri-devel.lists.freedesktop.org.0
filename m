Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 914798A3D6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 18:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2326E588;
	Mon, 12 Aug 2019 16:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CAED46E58E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 16:57:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C7D3872167; Mon, 12 Aug 2019 16:57:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Mon, 12 Aug 2019 16:57:16 +0000
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
Message-ID: <bug-110674-502-L5lkPPdnix@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0924165278=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0924165278==
Content-Type: multipart/alternative; boundary="15656290363.d584c8cb4.25469"
Content-Transfer-Encoding: 7bit


--15656290363.d584c8cb4.25469
Date: Mon, 12 Aug 2019 16:57:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #89 from Tom B <tom@r.je> ---
> It should return -EINVAL instead. Maybe then it would reset and try again=
 instead of just ignoring it and continuing with initialization anyway, lea=
ding to instability.

If you look at vega20_send_msg_to_smc_with_parameter:=20

static int vega20_send_msg_to_smc_with_parameter(struct pp_hwmgr *hwmgr,
                uint16_t msg, uint32_t parameter)
{
        struct amdgpu_device *adev =3D hwmgr->adev;
        int ret =3D 0;

        vega20_wait_for_response(hwmgr);

        WREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_90, 0);

        WREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_82, parameter);

        vega20_send_msg_to_smc_without_waiting(hwmgr, msg);

        ret =3D vega20_wait_for_response(hwmgr);
        if (ret !=3D PPSMC_Result_OK)
                pr_err("Failed to send message 0x%x, response 0x%x\n", msg,
ret);

        return (ret =3D=3D PPSMC_Result_OK) ? 0 : -EIO;
}


It returns 0 on success and -EIO on failure, which is then in turn returned
from vega20_set_fclk_to_highest_dpm_leve. Where did you see the check/retry=
 on
EINVAL? Perhaps -EIO should be -EINVAL?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15656290363.d584c8cb4.25469
Date: Mon, 12 Aug 2019 16:57:16 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c89">Comme=
nt # 89</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre><span class=3D"quote">&gt; It should return -EINVAL instead. M=
aybe then it would reset and try again instead of just ignoring it and cont=
inuing with initialization anyway, leading to instability.</span >

If you look at vega20_send_msg_to_smc_with_parameter:=20

static int vega20_send_msg_to_smc_with_parameter(struct pp_hwmgr *hwmgr,
                uint16_t msg, uint32_t parameter)
{
        struct amdgpu_device *adev =3D hwmgr-&gt;adev;
        int ret =3D 0;

        vega20_wait_for_response(hwmgr);

        WREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_90, 0);

        WREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_82, parameter);

        vega20_send_msg_to_smc_without_waiting(hwmgr, msg);

        ret =3D vega20_wait_for_response(hwmgr);
        if (ret !=3D PPSMC_Result_OK)
                pr_err(&quot;Failed to send message 0x%x, response 0x%x\n&q=
uot;, msg,
ret);

        return (ret =3D=3D PPSMC_Result_OK) ? 0 : -EIO;
}


It returns 0 on success and -EIO on failure, which is then in turn returned
from vega20_set_fclk_to_highest_dpm_leve. Where did you see the check/retry=
 on
EINVAL? Perhaps -EIO should be -EINVAL?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15656290363.d584c8cb4.25469--

--===============0924165278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0924165278==--
