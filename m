Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6590D8B973
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 15:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06006E126;
	Tue, 13 Aug 2019 13:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D733B6E12B
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 13:05:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D3E717215A; Tue, 13 Aug 2019 13:05:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Tue, 13 Aug 2019 13:05:17 +0000
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
Message-ID: <bug-110674-502-F88fGKeBiP@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1054273976=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1054273976==
Content-Type: multipart/alternative; boundary="15657015175.11CDe.31974"
Content-Transfer-Encoding: 7bit


--15657015175.11CDe.31974
Date: Tue, 13 Aug 2019 13:05:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #94 from Tom B <tom@r.je> ---
Reverting d1a3e239a6016f2bb42a91696056e223982e8538 didn't fix it for me. But
that commit may give some insight because it is related to uclk which is the
first error we get.

I also tried globally increasing usec_timeout as it's used in a few places
(patch below). This makes the PC take about a minute to boot up, so clearly=
 the
GPU is in an invalid state before these timeouts are hit and then each
subsequent call to smum_send_msg_to_smc_with_parameter causes a delay becau=
se
each call times out. Whatever happens, puts the card into a state that it c=
an't
recover from.

The next step is to try to find where vega20_set_uclk_to_highest_dpm_level =
is
called from and see what happens just before the call to this function.



diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index f4ac632a87b2..9b878c74b17e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2418,7 +2418,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
        adev->pdev =3D pdev;
        adev->flags =3D flags;
        adev->asic_type =3D flags & AMD_ASIC_MASK;
-       adev->usec_timeout =3D AMDGPU_MAX_USEC_TIMEOUT;
+       adev->usec_timeout =3D AMDGPU_MAX_USEC_TIMEOUT*10;
        if (amdgpu_emu_mode =3D=3D 1)
                adev->usec_timeout *=3D 2;
        adev->gmc.gart_size =3D 512 * 1024 * 1024;
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
b/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
index a7e8340baf90..a6b2bc4277ef 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
@@ -84,7 +84,7 @@ int hwmgr_early_init(struct pp_hwmgr *hwmgr)
        if (!hwmgr)
                return -EINVAL;

-       hwmgr->usec_timeout =3D AMD_MAX_USEC_TIMEOUT;
+       hwmgr->usec_timeout =3D AMD_MAX_USEC_TIMEOUT*10;
        hwmgr->pp_table_version =3D PP_TABLE_V1;
        hwmgr->dpm_level =3D AMD_DPM_FORCED_LEVEL_AUTO;
        hwmgr->request_dpm_level =3D AMD_DPM_FORCED_LEVEL_AUTO;

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15657015175.11CDe.31974
Date: Tue, 13 Aug 2019 13:05:17 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c94">Comme=
nt # 94</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>Reverting d1a3e239a6016f2bb42a91696056e223982e8538 didn't fix =
it for me. But
that commit may give some insight because it is related to uclk which is the
first error we get.

I also tried globally increasing usec_timeout as it's used in a few places
(patch below). This makes the PC take about a minute to boot up, so clearly=
 the
GPU is in an invalid state before these timeouts are hit and then each
subsequent call to smum_send_msg_to_smc_with_parameter causes a delay becau=
se
each call times out. Whatever happens, puts the card into a state that it c=
an't
recover from.

The next step is to try to find where vega20_set_uclk_to_highest_dpm_level =
is
called from and see what happens just before the call to this function.



diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index f4ac632a87b2..9b878c74b17e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
&#64;&#64; -2418,7 +2418,7 &#64;&#64; int amdgpu_device_init(struct amdgpu_=
device *adev,
        adev-&gt;pdev =3D pdev;
        adev-&gt;flags =3D flags;
        adev-&gt;asic_type =3D flags &amp; AMD_ASIC_MASK;
-       adev-&gt;usec_timeout =3D AMDGPU_MAX_USEC_TIMEOUT;
+       adev-&gt;usec_timeout =3D AMDGPU_MAX_USEC_TIMEOUT*10;
        if (amdgpu_emu_mode =3D=3D 1)
                adev-&gt;usec_timeout *=3D 2;
        adev-&gt;gmc.gart_size =3D 512 * 1024 * 1024;
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
b/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
index a7e8340baf90..a6b2bc4277ef 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
&#64;&#64; -84,7 +84,7 &#64;&#64; int hwmgr_early_init(struct pp_hwmgr *hwm=
gr)
        if (!hwmgr)
                return -EINVAL;

-       hwmgr-&gt;usec_timeout =3D AMD_MAX_USEC_TIMEOUT;
+       hwmgr-&gt;usec_timeout =3D AMD_MAX_USEC_TIMEOUT*10;
        hwmgr-&gt;pp_table_version =3D PP_TABLE_V1;
        hwmgr-&gt;dpm_level =3D AMD_DPM_FORCED_LEVEL_AUTO;
        hwmgr-&gt;request_dpm_level =3D AMD_DPM_FORCED_LEVEL_AUTO;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15657015175.11CDe.31974--

--===============1054273976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1054273976==--
