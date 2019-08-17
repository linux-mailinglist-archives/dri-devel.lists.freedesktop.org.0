Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD29391097
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 15:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA266E4EA;
	Sat, 17 Aug 2019 13:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 918546E4FE
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2019 13:37:15 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8E9B372161; Sat, 17 Aug 2019 13:37:15 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sat, 17 Aug 2019 13:37:15 +0000
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
Message-ID: <bug-110674-502-qscScdfrAk@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0290949404=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0290949404==
Content-Type: multipart/alternative; boundary="15660490355.BC70a8360.7193"
Content-Transfer-Encoding: 7bit


--15660490355.BC70a8360.7193
Date: Sat, 17 Aug 2019 13:37:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #115 from Tom B <tom@r.je> ---
I should have noted it earlier, but I had already tried reverting both "gol=
den
values" commits. I've no idea what it does but it didn't fix this crash.

One thing that would be insightful would be logging every call to
smum_send_msg_to_smc_with_parameter and printing out message/parameter:

int smum_send_msg_to_smc_with_parameter(struct pp_hwmgr *hwmgr,
                                        uint16_t msg, uint32_t parameter)
{

This would cause a very busy log but we could see the last successful messa=
ge
that was sent and with the same log in 5.0.13 see if there are any obvious
differences. It might be that the previous message causes the invalid state=
 so
knowing what that is could lead us towards the solution.

I don't think I have time to try it today but if anyone is recompiling the =
code
adding

pr_err("msg: %d / parameter: %d\n", msg, parameter);=20

to this function in smumgr.c would be a useful addition.

Also, wants to try re-compiling, here's a quick guide for arch:

1. Get the kernel sources using asp as described here:
https://wiki.archlinux.org/index.php/Kernel/Arch_Build_System navigate to t=
he
created linux/repos/core-x86_64 directory.=20

2. You will need to run makepkg -s once to get it to download the sources.

3. You can set the kernel version in PKGBUILD: e.g. _srcver=3D5.2.7-arch1 or
_srcver=3D5.0.13-arch1

4. If you want to revert one or more commits put it in the prepare() block
before local src:

  echo "$_kernelname" > localversion.20-pkgname

  git revert db64a2f43c1bc22c5ff2d22606000b8c3587d0ec --no-edit
  git revert f5e79735cab448981e245a41ee6cbebf0e334f61 --no-edit

  local src

It will open your editor, if you don't want to use vi set:


5. For making changes to the code you need to make a patch. Open the
src/archlinux-linux directory. The files you're interested in are in
drivers/drm/gpu/drm/amd/powerplay likely hwmgr/vega20_hwmgr.c Make your cha=
nges
to the code. You can't just re-run makepkg as it checks out the original
version of the code. After making changes, navigate to the archlinux-linux
directory and run git diff > ../../vii.patch

6. Add your patch to PKGBUILD source:=20

source=3D(
  "$_srcname::git+https://git.archlinux.org/linux.git?signed#tag=3Dv$_srcve=
r"
  config         # the main kernel config file
  60-linux.hook  # pacman hook for depmod
  90-linux.hook  # pacman hook for initramfs regeneration
  linux.preset   # standard config files for mkinitcpio ramdisk
  vii.patch
)

7. I've been cheating with makepkg and getting it to skip hash checks as
otherwise you have to generate the sha256sums for each patch you create. Th=
is
is an extra step that only slows down testing. To compile/install run makep=
kg
-si --skipinteg

Because of the way makepkg works, it keeps the compiled code in the src
directory. That means that although the first compile will take a few minut=
es,
subsequent compiles will be a lot faster as it'll probably only be recompil=
ing
vega20_hwmgr.c

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15660490355.BC70a8360.7193
Date: Sat, 17 Aug 2019 13:37:15 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c115">Comm=
ent # 115</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>I should have noted it earlier, but I had already tried revert=
ing both &quot;golden
values&quot; commits. I've no idea what it does but it didn't fix this cras=
h.

One thing that would be insightful would be logging every call to
smum_send_msg_to_smc_with_parameter and printing out message/parameter:

int smum_send_msg_to_smc_with_parameter(struct pp_hwmgr *hwmgr,
                                        uint16_t msg, uint32_t parameter)
{

This would cause a very busy log but we could see the last successful messa=
ge
that was sent and with the same log in 5.0.13 see if there are any obvious
differences. It might be that the previous message causes the invalid state=
 so
knowing what that is could lead us towards the solution.

I don't think I have time to try it today but if anyone is recompiling the =
code
adding

pr_err(&quot;msg: %d / parameter: %d\n&quot;, msg, parameter);=20

to this function in smumgr.c would be a useful addition.

Also, wants to try re-compiling, here's a quick guide for arch:

1. Get the kernel sources using asp as described here:
<a href=3D"https://wiki.archlinux.org/index.php/Kernel/Arch_Build_System">h=
ttps://wiki.archlinux.org/index.php/Kernel/Arch_Build_System</a> navigate t=
o the
created linux/repos/core-x86_64 directory.=20

2. You will need to run makepkg -s once to get it to download the sources.

3. You can set the kernel version in PKGBUILD: e.g. _srcver=3D5.2.7-arch1 or
_srcver=3D5.0.13-arch1

4. If you want to revert one or more commits put it in the prepare() block
before local src:

  echo &quot;$_kernelname&quot; &gt; localversion.20-pkgname

  git revert db64a2f43c1bc22c5ff2d22606000b8c3587d0ec --no-edit
  git revert f5e79735cab448981e245a41ee6cbebf0e334f61 --no-edit

  local src

It will open your editor, if you don't want to use vi set:


5. For making changes to the code you need to make a patch. Open the
src/archlinux-linux directory. The files you're interested in are in
drivers/drm/gpu/drm/amd/powerplay likely hwmgr/vega20_hwmgr.c Make your cha=
nges
to the code. You can't just re-run makepkg as it checks out the original
version of the code. After making changes, navigate to the archlinux-linux
directory and run git diff &gt; ../../vii.patch

6. Add your patch to PKGBUILD source:=20

source=3D(
  &quot;$_srcname::git+<a href=3D"https://git.archlinux.org/linux.git?signe=
d#tag=3Dv$_srcver">https://git.archlinux.org/linux.git?signed#tag=3Dv$_srcv=
er</a>&quot;
  config         # the main kernel config file
  60-linux.hook  # pacman hook for depmod
  90-linux.hook  # pacman hook for initramfs regeneration
  linux.preset   # standard config files for mkinitcpio ramdisk
  vii.patch
)

7. I've been cheating with makepkg and getting it to skip hash checks as
otherwise you have to generate the sha256sums for each patch you create. Th=
is
is an extra step that only slows down testing. To compile/install run makep=
kg
-si --skipinteg

Because of the way makepkg works, it keeps the compiled code in the src
directory. That means that although the first compile will take a few minut=
es,
subsequent compiles will be a lot faster as it'll probably only be recompil=
ing
vega20_hwmgr.c</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15660490355.BC70a8360.7193--

--===============0290949404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0290949404==--
