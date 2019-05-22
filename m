Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 917BF25FB3
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 10:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0715689812;
	Wed, 22 May 2019 08:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 94B5C89829
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 08:42:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9105B72167; Wed, 22 May 2019 08:42:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109206] Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U
Date: Wed, 22 May 2019 08:42:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: ondrej@lang.sk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-109206-502-VDgOpcQ1LV@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109206-502@http.bugs.freedesktop.org/>
References: <bug-109206-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1353693289=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1353693289==
Content-Type: multipart/alternative; boundary="15585145215.cC2AE.28977"
Content-Transfer-Encoding: 7bit


--15585145215.cC2AE.28977
Date: Wed, 22 May 2019 08:42:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109206

--- Comment #44 from Ondrej Lang <ondrej@lang.sk> ---
Created attachment 144316
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144316&action=3Dedit
Kernel log 5.1.3 showing amdgpu drm crash

Experiencing the same problem. On boot with any kernel > 4.20, the graphics=
 is
not initialized, few scrambled lines appear at the bottom of the screen and
then the screen goes blank. The system actually boots as when I entered my
credentials (on the black screen) and did "cat dmesg > dmesg.txt", when I
rebooted with kernel 4.19 the file was there (I have attached it to this
thread). The relevant portion of the dmesg log is:

[    5.133929] [drm] REG_WAIT timeout 1us * 100000 tries -
mpc1_assert_idle_mpcc line:103
[    5.134034] WARNING: CPU: 2 PID: 367 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:277
generic_reg_wait.cold.0+0x29/0x30 [amdgpu]
...
[    5.134925]  drm_dev_register+0x111/0x150 [drm]
[    5.135335] [drm] Display Core initialized with v3.2.17!
[    5.642999] [drm:hwss_edp_wait_for_hpd_ready [amdgpu]] *ERROR*
hwss_edp_wait_for_hpd_ready: wait timed out!
[    6.142512] [drm:hwss_edp_wait_for_hpd_ready [amdgpu]] *ERROR*
hwss_edp_wait_for_hpd_ready: wait timed out!
[    6.143119] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    6.143121] [drm] Driver supports precise vblank timestamp query.
[    6.158613] [drm] VCN decode and encode initialized successfully(under S=
PG
Mode).
[    6.161822] [drm] Cannot find any crtc or sizes
[    6.188933] [drm] Initialized amdgpu 3.30.0 20150101 for 0000:04:00.0 on
minor 0

I can also confirm that as a workaround, removing/moving file
/lib/firmware/amdgpu/raven_dmcu.bin and regenerating the initramfs ("mkinit=
cpio
-p linux" on Arch linux) allows the 5.1.3 kernel to boot normally (I can al=
so
start an X session and everything seems to be fine) and there are no drm er=
rors
in dmesg anymore.

System:
HP ENVY x360 Convertible 15-bq1xx/83C6, BIOS F.20 12/25/2018
Kernel: 5.1.3-arch1-1-ARCH
Grub kernel parameters: amd_iommu=3Don iommu=3Dpt idle=3Dnomwait

If you need anything else let me know

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15585145215.cC2AE.28977
Date: Wed, 22 May 2019 08:42:01 +0000
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
   title=3D"NEW - Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206#c44">Comme=
nt # 44</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206">bug 10920=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ondrej&#64;lang.sk" title=3D"Ondrej Lang &lt;ondrej&#64;lang.sk&gt;"> <span=
 class=3D"fn">Ondrej Lang</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144316=
" name=3D"attach_144316" title=3D"Kernel log 5.1.3 showing amdgpu drm crash=
">attachment 144316</a> <a href=3D"attachment.cgi?id=3D144316&amp;action=3D=
edit" title=3D"Kernel log 5.1.3 showing amdgpu drm crash">[details]</a></sp=
an>
Kernel log 5.1.3 showing amdgpu drm crash

Experiencing the same problem. On boot with any kernel &gt; 4.20, the graph=
ics is
not initialized, few scrambled lines appear at the bottom of the screen and
then the screen goes blank. The system actually boots as when I entered my
credentials (on the black screen) and did &quot;cat dmesg &gt; dmesg.txt&qu=
ot;, when I
rebooted with kernel 4.19 the file was there (I have attached it to this
thread). The relevant portion of the dmesg log is:

[    5.133929] [drm] REG_WAIT timeout 1us * 100000 tries -
mpc1_assert_idle_mpcc line:103
[    5.134034] WARNING: CPU: 2 PID: 367 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:277
generic_reg_wait.cold.0+0x29/0x30 [amdgpu]
...
[    5.134925]  drm_dev_register+0x111/0x150 [drm]
[    5.135335] [drm] Display Core initialized with v3.2.17!
[    5.642999] [drm:hwss_edp_wait_for_hpd_ready [amdgpu]] *ERROR*
hwss_edp_wait_for_hpd_ready: wait timed out!
[    6.142512] [drm:hwss_edp_wait_for_hpd_ready [amdgpu]] *ERROR*
hwss_edp_wait_for_hpd_ready: wait timed out!
[    6.143119] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    6.143121] [drm] Driver supports precise vblank timestamp query.
[    6.158613] [drm] VCN decode and encode initialized successfully(under S=
PG
Mode).
[    6.161822] [drm] Cannot find any crtc or sizes
[    6.188933] [drm] Initialized amdgpu 3.30.0 20150101 for 0000:04:00.0 on
minor 0

I can also confirm that as a workaround, removing/moving file
/lib/firmware/amdgpu/raven_dmcu.bin and regenerating the initramfs (&quot;m=
kinitcpio
-p linux&quot; on Arch linux) allows the 5.1.3 kernel to boot normally (I c=
an also
start an X session and everything seems to be fine) and there are no drm er=
rors
in dmesg anymore.

System:
HP ENVY x360 Convertible 15-bq1xx/83C6, BIOS F.20 12/25/2018
Kernel: 5.1.3-arch1-1-ARCH
Grub kernel parameters: amd_iommu=3Don iommu=3Dpt idle=3Dnomwait

If you need anything else let me know</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15585145215.cC2AE.28977--

--===============1353693289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1353693289==--
