Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514DFAE4F4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 09:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5680C6E856;
	Tue, 10 Sep 2019 07:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E9C06E856
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 07:55:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8AE1872167; Tue, 10 Sep 2019 07:55:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108718] Raven Ridge: ring sdma0 timeout on heavy CSS website
 with Firefox WebRender
Date: Tue, 10 Sep 2019 07:55:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-eric.pelloux-prayer@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108718-502-S9cA2Ia78U@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108718-502@http.bugs.freedesktop.org/>
References: <bug-108718-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2068965755=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2068965755==
Content-Type: multipart/alternative; boundary="15681021222.F06EcdC6.22812"
Content-Transfer-Encoding: 7bit


--15681021222.F06EcdC6.22812
Date: Tue, 10 Sep 2019 07:55:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108718

--- Comment #4 from Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@=
amd.com> ---
(In reply to Pierre-Eric Pelloux-Prayer from comment #2)
> Can you still reproduce this issue?
>=20
> It seems to work fine here with a recent kernel + mesa configuration.

Correction: I retested and can reproduce the problem partially.

After zooming and scrolling for a while, there are logs like this in dmesg:


[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* amdgpu_vm_validate_pt_bos() failed.
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Not enough memory for command
submission!
[TTM] Failed to find memory space for buffer 0x00000000de5c5282 eviction
[TTM]  No space for 00000000de5c5282 (2224 pages, 8896K, 8M)
[TTM]    placement[0]=3D0x00060002 (1)
[TTM]      has_type: 1
[TTM]      use_type: 1
[TTM]      flags: 0x0000000A
[TTM]      gpu_offset: 0x00000000
[TTM]      size: 786432
[TTM]      available_caching: 0x00070000
[TTM]      default_caching: 0x00010000
[TTM]  0x0000000000000400-0x0000000000000401: 1: used
[TTM]  0x0000000000000401-0x0000000000000443: 66: used
[TTM]  0x0000000000000443-0x0000000000000445: 2: used
[TTM]  0x0000000000000445-0x0000000000000447: 2: used
[TTM]  0x0000000000000447-0x0000000000000449: 2: used
[TTM]  0x0000000000000449-0x000000000000044b: 2: used
[TTM]  0x000000000000044b-0x000000000000044d: 2: used
[TTM]  0x000000000000044d-0x000000000000044f: 2: used
[TTM]  0x000000000000044f-0x0000000000000451: 2: used
[TTM]  0x0000000000000451-0x0000000000000453: 2: used
[TTM]  0x0000000000000453-0x0000000000000455: 2: used
[TTM]  0x0000000000000455-0x0000000000000456: 1: used
[TTM]  0x0000000000000456-0x0000000000000556: 256: used
[TTM]  0x0000000000000556-0x0000000000000557: 1: used
[TTM]  0x0000000000000557-0x0000000000000558: 1: used
[TTM]  0x0000000000000558-0x0000000000000559: 1: used
[TTM]  0x0000000000000559-0x000000000000055a: 1: used
[TTM]  0x000000000000055a-0x000000000000055b: 1: used
[TTM]  0x000000000000055b-0x000000000000055c: 1: used
[TTM]  0x000000000000055c-0x000000000000055d: 1: used
[TTM]  0x000000000000055d-0x000000000000055e: 1: used
[TTM]  0x000000000000055e-0x0000000000000560: 2: used
[TTM]  0x0000000000000560-0x0000000000000561: 1: used
[TTM]  0x0000000000000561-0x0000000000000562: 1: used
[TTM]  0x0000000000000562-0x0000000000000563: 1: used
[TTM]  0x0000000000000563-0x0000000000000565: 2: used
[TTM]  0x0000000000000565-0x0000000000000665: 256: used
[TTM]  0x0000000000000665-0x000000000000075c: 247: used
[TTM]  0x000000000000075c-0x0000000000000800: 164: free
[TTM]  0x0000000000000800-0x0000000000000900: 256: used
[TTM]  0x0000000000000900-0x0000000000000cca: 970: used
[TTM]  0x0000000000000cca-0x0000000000040000: 258870: free
[TTM]  total: 261120, used 2086 free 259034


The computer doesn't hang or crash though and if I close Firefox's window
everything goes back to normal.

(using: Mesa master, LLVM 10, kernel 865b4ca43816 from amd-staging-drm-next)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15681021222.F06EcdC6.22812
Date: Tue, 10 Sep 2019 07:55:22 +0000
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
   title=3D"NEW - Raven Ridge: ring sdma0 timeout on heavy CSS website with=
 Firefox WebRender"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108718#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Raven Ridge: ring sdma0 timeout on heavy CSS website with=
 Firefox WebRender"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108718">bug 10871=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre-eric.pelloux-prayer&#64;amd.com" title=3D"Pierre-Eric Pelloux-Prayer=
 &lt;pierre-eric.pelloux-prayer&#64;amd.com&gt;"> <span class=3D"fn">Pierre=
-Eric Pelloux-Prayer</span></a>
</span></b>
        <pre>(In reply to Pierre-Eric Pelloux-Prayer from <a href=3D"show_b=
ug.cgi?id=3D108718#c2">comment #2</a>)
<span class=3D"quote">&gt; Can you still reproduce this issue?
&gt;=20
&gt; It seems to work fine here with a recent kernel + mesa configuration.<=
/span >

Correction: I retested and can reproduce the problem partially.

After zooming and scrolling for a while, there are logs like this in dmesg:


[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* amdgpu_vm_validate_pt_bos() failed.
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Not enough memory for command
submission!
[TTM] Failed to find memory space for buffer 0x00000000de5c5282 eviction
[TTM]  No space for 00000000de5c5282 (2224 pages, 8896K, 8M)
[TTM]    placement[0]=3D0x00060002 (1)
[TTM]      has_type: 1
[TTM]      use_type: 1
[TTM]      flags: 0x0000000A
[TTM]      gpu_offset: 0x00000000
[TTM]      size: 786432
[TTM]      available_caching: 0x00070000
[TTM]      default_caching: 0x00010000
[TTM]  0x0000000000000400-0x0000000000000401: 1: used
[TTM]  0x0000000000000401-0x0000000000000443: 66: used
[TTM]  0x0000000000000443-0x0000000000000445: 2: used
[TTM]  0x0000000000000445-0x0000000000000447: 2: used
[TTM]  0x0000000000000447-0x0000000000000449: 2: used
[TTM]  0x0000000000000449-0x000000000000044b: 2: used
[TTM]  0x000000000000044b-0x000000000000044d: 2: used
[TTM]  0x000000000000044d-0x000000000000044f: 2: used
[TTM]  0x000000000000044f-0x0000000000000451: 2: used
[TTM]  0x0000000000000451-0x0000000000000453: 2: used
[TTM]  0x0000000000000453-0x0000000000000455: 2: used
[TTM]  0x0000000000000455-0x0000000000000456: 1: used
[TTM]  0x0000000000000456-0x0000000000000556: 256: used
[TTM]  0x0000000000000556-0x0000000000000557: 1: used
[TTM]  0x0000000000000557-0x0000000000000558: 1: used
[TTM]  0x0000000000000558-0x0000000000000559: 1: used
[TTM]  0x0000000000000559-0x000000000000055a: 1: used
[TTM]  0x000000000000055a-0x000000000000055b: 1: used
[TTM]  0x000000000000055b-0x000000000000055c: 1: used
[TTM]  0x000000000000055c-0x000000000000055d: 1: used
[TTM]  0x000000000000055d-0x000000000000055e: 1: used
[TTM]  0x000000000000055e-0x0000000000000560: 2: used
[TTM]  0x0000000000000560-0x0000000000000561: 1: used
[TTM]  0x0000000000000561-0x0000000000000562: 1: used
[TTM]  0x0000000000000562-0x0000000000000563: 1: used
[TTM]  0x0000000000000563-0x0000000000000565: 2: used
[TTM]  0x0000000000000565-0x0000000000000665: 256: used
[TTM]  0x0000000000000665-0x000000000000075c: 247: used
[TTM]  0x000000000000075c-0x0000000000000800: 164: free
[TTM]  0x0000000000000800-0x0000000000000900: 256: used
[TTM]  0x0000000000000900-0x0000000000000cca: 970: used
[TTM]  0x0000000000000cca-0x0000000000040000: 258870: free
[TTM]  total: 261120, used 2086 free 259034


The computer doesn't hang or crash though and if I close Firefox's window
everything goes back to normal.

(using: Mesa master, LLVM 10, kernel 865b4ca43816 from amd-staging-drm-next=
)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15681021222.F06EcdC6.22812--

--===============2068965755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2068965755==--
