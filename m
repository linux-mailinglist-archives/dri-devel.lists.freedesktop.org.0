Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB7E90C0C
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 04:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E585B6E9BD;
	Sat, 17 Aug 2019 02:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B357A6E9D7
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2019 02:15:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B04097215A; Sat, 17 Aug 2019 02:15:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sat, 17 Aug 2019 02:15:16 +0000
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
Message-ID: <bug-110674-502-QIUJvIZUYc@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0339683333=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0339683333==
Content-Type: multipart/alternative; boundary="15660081167.3ECcC2e.30459"
Content-Transfer-Encoding: 7bit


--15660081167.3ECcC2e.30459
Date: Sat, 17 Aug 2019 02:15:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #112 from ReddestDream <reddestdream@gmail.com> ---
More ideas:

3. Looking through the crash in sehellion's comment 45:

gfx_v9_0_ring_test_ring+0x19e/0x230 [amdgpu]
amdgpu_ring_test_helper+0x1e/0x90 [amdgpu]
gfx_v9_0_hw_fini+0x299/0x690 [amdgpu]
amdgpu_device_ip_suspend_phase2+0x6c/0xa0 [amdgpu]
amdgpu_device_ip_suspend+0x44/0x80 [amdgpu]
amdgpu_device_pre_asic_reset+0x1ef/0x204 [amdgpu]
amdgpu_device_gpu_recover+0x7b/0x7a3 [amdgpu]
amdgpu_job_timedout+0xfc/0x120 [amdgpu]

We see gfx_v9_0_ring_test and gfx_v9_0_hw_fini which both come from:

https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/amd/amdgpu/gf=
x_v9_0.c

There's a 5.1-rc1 commit in this file pertaining to a "wave ID mismatch" th=
at
could cause deadlocks.

https://github.com/torvalds/linux/commit/41cca166cc57e75e94d888595a428d23a3=
bf4e36

Along with updated "golden values" for Vega in 5.1-rc1:

https://github.com/torvalds/linux/commit/919a94d8101ebc29868940b580fe9e9811=
b7dc86

https://github.com/torvalds/linux/commit/f7b1844bacecca96dd8d813675e4d8adec=
02cd66

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15660081167.3ECcC2e.30459
Date: Sat, 17 Aug 2019 02:15:16 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c112">Comm=
ent # 112</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre>More ideas:

3. Looking through the crash in sehellion's <a href=3D"show_bug.cgi?id=3D11=
0674#c45">comment 45</a>:

gfx_v9_0_ring_test_ring+0x19e/0x230 [amdgpu]
amdgpu_ring_test_helper+0x1e/0x90 [amdgpu]
gfx_v9_0_hw_fini+0x299/0x690 [amdgpu]
amdgpu_device_ip_suspend_phase2+0x6c/0xa0 [amdgpu]
amdgpu_device_ip_suspend+0x44/0x80 [amdgpu]
amdgpu_device_pre_asic_reset+0x1ef/0x204 [amdgpu]
amdgpu_device_gpu_recover+0x7b/0x7a3 [amdgpu]
amdgpu_job_timedout+0xfc/0x120 [amdgpu]

We see gfx_v9_0_ring_test and gfx_v9_0_hw_fini which both come from:

<a href=3D"https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/am=
d/amdgpu/gfx_v9_0.c">https://github.com/torvalds/linux/blob/master/drivers/=
gpu/drm/amd/amdgpu/gfx_v9_0.c</a>

There's a 5.1-rc1 commit in this file pertaining to a &quot;wave ID mismatc=
h&quot; that
could cause deadlocks.

<a href=3D"https://github.com/torvalds/linux/commit/41cca166cc57e75e94d8885=
95a428d23a3bf4e36">https://github.com/torvalds/linux/commit/41cca166cc57e75=
e94d888595a428d23a3bf4e36</a>

Along with updated &quot;golden values&quot; for Vega in 5.1-rc1:

<a href=3D"https://github.com/torvalds/linux/commit/919a94d8101ebc29868940b=
580fe9e9811b7dc86">https://github.com/torvalds/linux/commit/919a94d8101ebc2=
9868940b580fe9e9811b7dc86</a>

<a href=3D"https://github.com/torvalds/linux/commit/f7b1844bacecca96dd8d813=
675e4d8adec02cd66">https://github.com/torvalds/linux/commit/f7b1844bacecca9=
6dd8d813675e4d8adec02cd66</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15660081167.3ECcC2e.30459--

--===============0339683333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0339683333==--
