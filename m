Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BBD8DBE6
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 19:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737416E79F;
	Wed, 14 Aug 2019 17:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 74E156E79C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 17:30:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6C7847215A; Wed, 14 Aug 2019 17:30:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Wed, 14 Aug 2019 17:30:55 +0000
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
Message-ID: <bug-110674-502-DUN6i4wVaI@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2059765766=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2059765766==
Content-Type: multipart/alternative; boundary="15658038550.30f1.22645"
Content-Transfer-Encoding: 7bit


--15658038550.30f1.22645
Date: Wed, 14 Aug 2019 17:30:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #100 from Tom B <tom@r.je> ---
I've bee trying to work backwards to find the place where screens get
initialised and eventually call vega20_pre_display_configuration_changed_ta=
sk.=20

vega20_pre_display_configuration_changed_task is exported as
pp_hwmgr_func::display_config_changed

Which is called form hardwaremanager.c:phm_pre_display_configuration_change=
d=20

phm_pre_display_configuration_changed is called from
hwmghr.c:hwmgr_handle_task:

        switch (task_id) {
        case AMD_PP_TASK_DISPLAY_CONFIG_CHANGE:
                ret =3D phm_pre_display_configuration_changed(hwmgr);


pp_dpm_dispatch_tasks is exported as amd_pm_funcs::dispatch_tasks is called
from amdgpu_dpm_dispatch_task which is called in amdgpu_pm.c:


void amdgpu_pm_compute_clocks(struct amdgpu_device *adev)
{
        int i =3D 0;

        if (!adev->pm.dpm_enabled)
                return;

        if (adev->mode_info.num_crtc)
                amdgpu_display_bandwidth_update(adev);

        for (i =3D 0; i < AMDGPU_MAX_RINGS; i++) {
                struct amdgpu_ring *ring =3D adev->rings[i];
                if (ring && ring->sched.ready)
                        amdgpu_fence_wait_empty(ring);
        }

        if (is_support_sw_smu(adev)) {
                struct smu_context *smu =3D &adev->smu;
                struct smu_dpm_context *smu_dpm =3D &adev->smu.smu_dpm;
                mutex_lock(&(smu->mutex));
                smu_handle_task(&adev->smu,
                                smu_dpm->dpm_level,
                                AMD_PP_TASK_DISPLAY_CONFIG_CHANGE);
                mutex_unlock(&(smu->mutex));
        } else {
                if (adev->powerplay.pp_funcs->dispatch_tasks) {
                        if (!amdgpu_device_has_dc_support(adev)) {
                                mutex_lock(&adev->pm.mutex);
                                amdgpu_dpm_get_active_displays(adev);
                                adev->pm.pm_display_cfg.num_display =3D
adev->pm.dpm.new_active_crtc_count;
                                adev->pm.pm_display_cfg.vrefresh =3D
amdgpu_dpm_get_vrefresh(adev);
                                adev->pm.pm_display_cfg.min_vblank_time =3D
amdgpu_dpm_get_vblank_time(adev);
                                /* we have issues with mclk switching with
refresh rates over 120 hz on the non-DC code. */
                                if (adev->pm.pm_display_cfg.vrefresh > 120)
                                        adev->pm.pm_display_cfg.min_vblank_=
time
=3D 0;
                                if
(adev->powerplay.pp_funcs->display_configuration_change)
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
adev->powerplay.pp_funcs->display_configuration_change(
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
adev->powerplay.pp_handle,
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&adev->pm.pm_display_cfg);
                                mutex_unlock(&adev->pm.mutex);
                        }
                        amdgpu_dpm_dispatch_task(adev,
AMD_PP_TASK_DISPLAY_CONFIG_CHANGE, NULL);
                } else {
                        mutex_lock(&adev->pm.mutex);
                        amdgpu_dpm_get_active_displays(adev);
                        amdgpu_dpm_change_power_state_locked(adev);
                        mutex_unlock(&adev->pm.mutex);
                }
        }
}


This is the only place I can see AMD_PP_TASK_DISPLAY_CONFIG_CHANGE being ca=
lled
from, which eventually is where vega20_pre_display_configuration_changed_ta=
sk
gets called.

Presumably the code:

        for (i =3D 0; i < AMDGPU_MAX_RINGS; i++) {
                struct amdgpu_ring *ring =3D adev->rings[i];
                if (ring && ring->sched.ready)
                        amdgpu_fence_wait_empty(ring);
        }



is what generates=20


[    3.683718] amdgpu 0000:44:00.0: ring gfx uses VM inv eng 0 on hub 0
[    3.683719] amdgpu 0000:44:00.0: ring comp_1.0.0 uses VM inv eng 1 on hu=
b 0
[    3.683720] amdgpu 0000:44:00.0: ring comp_1.1.0 uses VM inv eng 4 on hu=
b 0
[    3.683720] amdgpu 0000:44:00.0: ring comp_1.2.0 uses VM inv eng 5 on hu=
b 0
[    3.683721] amdgpu 0000:44:00.0: ring comp_1.3.0 uses VM inv eng 6 on hu=
b 0
[    3.683722] amdgpu 0000:44:00.0: ring comp_1.0.1 uses VM inv eng 7 on hu=
b 0
[    3.683722] amdgpu 0000:44:00.0: ring comp_1.1.1 uses VM inv eng 8 on hu=
b 0
[    3.683723] amdgpu 0000:44:00.0: ring comp_1.2.1 uses VM inv eng 9 on hu=
b 0
[    3.683724] amdgpu 0000:44:00.0: ring comp_1.3.1 uses VM inv eng 10 on h=
ub 0
[    3.683724] amdgpu 0000:44:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hu=
b 0
[    3.683725] amdgpu 0000:44:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[    3.683726] amdgpu 0000:44:00.0: ring page0 uses VM inv eng 1 on hub 1
[    3.683726] amdgpu 0000:44:00.0: ring sdma1 uses VM inv eng 4 on hub 1
[    3.683727] amdgpu 0000:44:00.0: ring page1 uses VM inv eng 5 on hub 1
[    3.683728] amdgpu 0000:44:00.0: ring uvd_0 uses VM inv eng 6 on hub 1
[    3.683728] amdgpu 0000:44:00.0: ring uvd_enc_0.0 uses VM inv eng 7 on h=
ub 1
[    3.683729] amdgpu 0000:44:00.0: ring uvd_enc_0.1 uses VM inv eng 8 on h=
ub 1
[    3.683730] amdgpu 0000:44:00.0: ring uvd_1 uses VM inv eng 9 on hub 1
[    3.683730] amdgpu 0000:44:00.0: ring uvd_enc_1.0 uses VM inv eng 10 on =
hub
1
[    3.683731] amdgpu 0000:44:00.0: ring uvd_enc_1.1 uses VM inv eng 11 on =
hub
1
[    3.683731] amdgpu 0000:44:00.0: ring vce0 uses VM inv eng 12 on hub 1
[    3.683732] amdgpu 0000:44:00.0: ring vce1 uses VM inv eng 13 on hub 1
[    3.683733] amdgpu 0000:44:00.0: ring vce2 uses VM inv eng 14 on hub 1

In dmesg. I'll add a pr_err() to verify this.  If so, it means our issue is
introduced somewhere between that for loop and amdgpu_dpm_dispatch_task in =
this
function.=20


amdgpu_pm_compute_clocks is called from
amdgpu_dm_pp_smu.c:dm_pp_apply_display_requirements which is called in
dce_clk_mgr.c in two places: dce_pplib_apply_display_requirements and
dce11_pplib_apply_display_requirements. I don't know which is used for the =
VII,
I'll add some logging to verify.

But here's something that may be relevant to this bug. In
dce11_pplib_apply_display_requirements there's a check for the number of
displays:


        /* TODO: is this still applicable?*/
        if (pp_display_cfg->display_count =3D=3D 1) {
                const struct dc_crtc_timing *timing =3D
                        &context->streams[0]->timing;

                pp_display_cfg->crtc_index =3D
                        pp_display_cfg->disp_configs[0].pipe_idx;
                pp_display_cfg->line_time_in_us =3D timing->h_total * 10000=
 /
timing->pix_clk_100hz;
        }


So there's something that is different when mroe than one display is connec=
ted.
That's as far as I got walking backwards through the code. I'll note that t=
his
was also present in 5.0.1, but it could be that something is relying on
ctrc_inxex or line_time_in_us, which wasn't checked previously as these val=
ues
only appear to be set if there is a single display.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15658038550.30f1.22645
Date: Wed, 14 Aug 2019 17:30:55 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c100">Comm=
ent # 100</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>I've bee trying to work backwards to find the place where scre=
ens get
initialised and eventually call vega20_pre_display_configuration_changed_ta=
sk.=20

vega20_pre_display_configuration_changed_task is exported as
pp_hwmgr_func::display_config_changed

Which is called form hardwaremanager.c:phm_pre_display_configuration_change=
d=20

phm_pre_display_configuration_changed is called from
hwmghr.c:hwmgr_handle_task:

        switch (task_id) {
        case AMD_PP_TASK_DISPLAY_CONFIG_CHANGE:
                ret =3D phm_pre_display_configuration_changed(hwmgr);


pp_dpm_dispatch_tasks is exported as amd_pm_funcs::dispatch_tasks is called
from amdgpu_dpm_dispatch_task which is called in amdgpu_pm.c:


void amdgpu_pm_compute_clocks(struct amdgpu_device *adev)
{
        int i =3D 0;

        if (!adev-&gt;pm.dpm_enabled)
                return;

        if (adev-&gt;mode_info.num_crtc)
                amdgpu_display_bandwidth_update(adev);

        for (i =3D 0; i &lt; AMDGPU_MAX_RINGS; i++) {
                struct amdgpu_ring *ring =3D adev-&gt;rings[i];
                if (ring &amp;&amp; ring-&gt;sched.ready)
                        amdgpu_fence_wait_empty(ring);
        }

        if (is_support_sw_smu(adev)) {
                struct smu_context *smu =3D &amp;adev-&gt;smu;
                struct smu_dpm_context *smu_dpm =3D &amp;adev-&gt;smu.smu_d=
pm;
                mutex_lock(&amp;(smu-&gt;mutex));
                smu_handle_task(&amp;adev-&gt;smu,
                                smu_dpm-&gt;dpm_level,
                                AMD_PP_TASK_DISPLAY_CONFIG_CHANGE);
                mutex_unlock(&amp;(smu-&gt;mutex));
        } else {
                if (adev-&gt;powerplay.pp_funcs-&gt;dispatch_tasks) {
                        if (!amdgpu_device_has_dc_support(adev)) {
                                mutex_lock(&amp;adev-&gt;pm.mutex);
                                amdgpu_dpm_get_active_displays(adev);
                                adev-&gt;pm.pm_display_cfg.num_display =3D
adev-&gt;pm.dpm.new_active_crtc_count;
                                adev-&gt;pm.pm_display_cfg.vrefresh =3D
amdgpu_dpm_get_vrefresh(adev);
                                adev-&gt;pm.pm_display_cfg.min_vblank_time =
=3D
amdgpu_dpm_get_vblank_time(adev);
                                /* we have issues with mclk switching with
refresh rates over 120 hz on the non-DC code. */
                                if (adev-&gt;pm.pm_display_cfg.vrefresh &gt=
; 120)
                                        adev-&gt;pm.pm_display_cfg.min_vbla=
nk_time
=3D 0;
                                if
(adev-&gt;powerplay.pp_funcs-&gt;display_configuration_change)
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
adev-&gt;powerplay.pp_funcs-&gt;display_configuration_change(
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
adev-&gt;powerplay.pp_handle,
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
&amp;adev-&gt;pm.pm_display_cfg);
                                mutex_unlock(&amp;adev-&gt;pm.mutex);
                        }
                        amdgpu_dpm_dispatch_task(adev,
AMD_PP_TASK_DISPLAY_CONFIG_CHANGE, NULL);
                } else {
                        mutex_lock(&amp;adev-&gt;pm.mutex);
                        amdgpu_dpm_get_active_displays(adev);
                        amdgpu_dpm_change_power_state_locked(adev);
                        mutex_unlock(&amp;adev-&gt;pm.mutex);
                }
        }
}


This is the only place I can see AMD_PP_TASK_DISPLAY_CONFIG_CHANGE being ca=
lled
from, which eventually is where vega20_pre_display_configuration_changed_ta=
sk
gets called.

Presumably the code:

        for (i =3D 0; i &lt; AMDGPU_MAX_RINGS; i++) {
                struct amdgpu_ring *ring =3D adev-&gt;rings[i];
                if (ring &amp;&amp; ring-&gt;sched.ready)
                        amdgpu_fence_wait_empty(ring);
        }



is what generates=20


[    3.683718] amdgpu 0000:44:00.0: ring gfx uses VM inv eng 0 on hub 0
[    3.683719] amdgpu 0000:44:00.0: ring comp_1.0.0 uses VM inv eng 1 on hu=
b 0
[    3.683720] amdgpu 0000:44:00.0: ring comp_1.1.0 uses VM inv eng 4 on hu=
b 0
[    3.683720] amdgpu 0000:44:00.0: ring comp_1.2.0 uses VM inv eng 5 on hu=
b 0
[    3.683721] amdgpu 0000:44:00.0: ring comp_1.3.0 uses VM inv eng 6 on hu=
b 0
[    3.683722] amdgpu 0000:44:00.0: ring comp_1.0.1 uses VM inv eng 7 on hu=
b 0
[    3.683722] amdgpu 0000:44:00.0: ring comp_1.1.1 uses VM inv eng 8 on hu=
b 0
[    3.683723] amdgpu 0000:44:00.0: ring comp_1.2.1 uses VM inv eng 9 on hu=
b 0
[    3.683724] amdgpu 0000:44:00.0: ring comp_1.3.1 uses VM inv eng 10 on h=
ub 0
[    3.683724] amdgpu 0000:44:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hu=
b 0
[    3.683725] amdgpu 0000:44:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[    3.683726] amdgpu 0000:44:00.0: ring page0 uses VM inv eng 1 on hub 1
[    3.683726] amdgpu 0000:44:00.0: ring sdma1 uses VM inv eng 4 on hub 1
[    3.683727] amdgpu 0000:44:00.0: ring page1 uses VM inv eng 5 on hub 1
[    3.683728] amdgpu 0000:44:00.0: ring uvd_0 uses VM inv eng 6 on hub 1
[    3.683728] amdgpu 0000:44:00.0: ring uvd_enc_0.0 uses VM inv eng 7 on h=
ub 1
[    3.683729] amdgpu 0000:44:00.0: ring uvd_enc_0.1 uses VM inv eng 8 on h=
ub 1
[    3.683730] amdgpu 0000:44:00.0: ring uvd_1 uses VM inv eng 9 on hub 1
[    3.683730] amdgpu 0000:44:00.0: ring uvd_enc_1.0 uses VM inv eng 10 on =
hub
1
[    3.683731] amdgpu 0000:44:00.0: ring uvd_enc_1.1 uses VM inv eng 11 on =
hub
1
[    3.683731] amdgpu 0000:44:00.0: ring vce0 uses VM inv eng 12 on hub 1
[    3.683732] amdgpu 0000:44:00.0: ring vce1 uses VM inv eng 13 on hub 1
[    3.683733] amdgpu 0000:44:00.0: ring vce2 uses VM inv eng 14 on hub 1

In dmesg. I'll add a pr_err() to verify this.  If so, it means our issue is
introduced somewhere between that for loop and amdgpu_dpm_dispatch_task in =
this
function.=20


amdgpu_pm_compute_clocks is called from
amdgpu_dm_pp_smu.c:dm_pp_apply_display_requirements which is called in
dce_clk_mgr.c in two places: dce_pplib_apply_display_requirements and
dce11_pplib_apply_display_requirements. I don't know which is used for the =
VII,
I'll add some logging to verify.

But here's something that may be relevant to this bug. In
dce11_pplib_apply_display_requirements there's a check for the number of
displays:


        /* TODO: is this still applicable?*/
        if (pp_display_cfg-&gt;display_count =3D=3D 1) {
                const struct dc_crtc_timing *timing =3D
                        &amp;context-&gt;streams[0]-&gt;timing;

                pp_display_cfg-&gt;crtc_index =3D
                        pp_display_cfg-&gt;disp_configs[0].pipe_idx;
                pp_display_cfg-&gt;line_time_in_us =3D timing-&gt;h_total *=
 10000 /
timing-&gt;pix_clk_100hz;
        }


So there's something that is different when mroe than one display is connec=
ted.
That's as far as I got walking backwards through the code. I'll note that t=
his
was also present in 5.0.1, but it could be that something is relying on
ctrc_inxex or line_time_in_us, which wasn't checked previously as these val=
ues
only appear to be set if there is a single display.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15658038550.30f1.22645--

--===============2059765766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2059765766==--
