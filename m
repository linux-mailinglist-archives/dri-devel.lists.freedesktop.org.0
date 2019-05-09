Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E0418945
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 13:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B1E89AEE;
	Thu,  9 May 2019 11:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5273F89B98
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 11:52:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4EEB87215A; Thu,  9 May 2019 11:52:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109345] drm-next-2018-12-14 -Linux PPC
Date: Thu, 09 May 2019 11:52:24 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chzigotzky@xenosoft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109345-502-WH9XspBdzk@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109345-502@http.bugs.freedesktop.org/>
References: <bug-109345-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1984433089=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1984433089==
Content-Type: multipart/alternative; boundary="15574027442.8ce91B.1464"
Content-Transfer-Encoding: 7bit


--15574027442.8ce91B.1464
Date: Thu, 9 May 2019 11:52:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109345

--- Comment #39 from Christian Zigotzky <chzigotzky@xenosoft.de> ---
Hi All,

Allan has successfully tested the eleventh test kernel.

He wrote:

Christian
DRM11 boots to Firepro.

ace

------

We have a result!

git bisect good

The following commit is responsible for the issue:

3d42f1ddc47a69c0ce155f9f30d764c4d689a5fa is the first bad commit
commit 3d42f1ddc47a69c0ce155f9f30d764c4d689a5fa
Author: Aaron Ma <aaron.ma@canonical.com>
Date:   Sat Sep 1 02:20:00 2018 +0800

    vgaarb: Keep adding VGA device in queue

    If failed to find the deivice owning the boot framebuffer,
    try to use the first VGA device instead of the last one.

    Usually the 1st device is integrated GPU who owns the boot framebuffer.

    Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
    Acked-by: Alex Deucher <alexander.deucher@amd.com>
    Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
    Link:
https://patchwork.freedesktop.org/patch/msgid/1535739600-8842-2-git-send-em=
ail-aaron.ma@canonical.com

:040000 040000 2d69570b87946ba42095609c945f04de9ad24ef7
3d86752f71500726f20d7d503128119f9b249175 M   drivers

------

I undid these changes in the file 'drivers/gpu/vga/vgaarb.c' and created
another test kernel today.

Download: http://www.xenosoft.de/linux-image-5.2-alpha2-X1000_X5000.tar.gz

You can undo the commit with the following patch:

diff -rupN a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
--- a/drivers/gpu/vga/vgaarb.c    2019-05-09 07:56:27.595746473 +0200
+++ b/drivers/gpu/vga/vgaarb.c    2019-05-09 08:00:06.352660688 +0200
@@ -725,7 +725,7 @@ static bool vga_arbiter_add_pci_device(s
     vga_arbiter_check_bridge_sharing(vgadev);

     /* Add to the list */
-    list_add_tail(&vgadev->list, &vga_list);
+    list_add(&vgadev->list, &vga_list);
     vga_count++;
     vgaarb_info(&pdev->dev, "VGA device added: decodes=3D%s,owns=3D%s,lock=
s=3D%s\n",
         vga_iostate_to_str(vgadev->decodes),

------

@Allan (acefnq/ace)
Please test it.

Thanks,
Christian

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15574027442.8ce91B.1464
Date: Thu, 9 May 2019 11:52:24 +0000
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
   title=3D"NEW - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345#c39">Comme=
nt # 39</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345">bug 10934=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chzigotzky&#64;xenosoft.de" title=3D"Christian Zigotzky &lt;chzigotzky&#64;=
xenosoft.de&gt;"> <span class=3D"fn">Christian Zigotzky</span></a>
</span></b>
        <pre>Hi All,

Allan has successfully tested the eleventh test kernel.

He wrote:

Christian
DRM11 boots to Firepro.

ace

------

We have a result!

git bisect good

The following commit is responsible for the issue:

3d42f1ddc47a69c0ce155f9f30d764c4d689a5fa is the first bad commit
commit 3d42f1ddc47a69c0ce155f9f30d764c4d689a5fa
Author: Aaron Ma &lt;<a href=3D"mailto:aaron.ma&#64;canonical.com">aaron.ma=
&#64;canonical.com</a>&gt;
Date:   Sat Sep 1 02:20:00 2018 +0800

    vgaarb: Keep adding VGA device in queue

    If failed to find the deivice owning the boot framebuffer,
    try to use the first VGA device instead of the last one.

    Usually the 1st device is integrated GPU who owns the boot framebuffer.

    Signed-off-by: Aaron Ma &lt;<a href=3D"mailto:aaron.ma&#64;canonical.co=
m">aaron.ma&#64;canonical.com</a>&gt;
    Acked-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64;amd.=
com">alexander.deucher&#64;amd.com</a>&gt;
    Signed-off-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter&#64;ff=
wll.ch">daniel.vetter&#64;ffwll.ch</a>&gt;
    Link:
<a href=3D"https://patchwork.freedesktop.org/patch/msgid/1535739600-8842-2-=
git-send-email-aaron.ma&#64;canonical.com">https://patchwork.freedesktop.or=
g/patch/msgid/1535739600-8842-2-git-send-email-aaron.ma&#64;canonical.com</=
a>

:040000 040000 2d69570b87946ba42095609c945f04de9ad24ef7
3d86752f71500726f20d7d503128119f9b249175 M   drivers

------

I undid these changes in the file 'drivers/gpu/vga/vgaarb.c' and created
another test kernel today.

Download: <a href=3D"http://www.xenosoft.de/linux-image-5.2-alpha2-X1000_X5=
000.tar.gz">http://www.xenosoft.de/linux-image-5.2-alpha2-X1000_X5000.tar.g=
z</a>

You can undo the commit with the following patch:

diff -rupN a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
--- a/drivers/gpu/vga/vgaarb.c    2019-05-09 07:56:27.595746473 +0200
+++ b/drivers/gpu/vga/vgaarb.c    2019-05-09 08:00:06.352660688 +0200
&#64;&#64; -725,7 +725,7 &#64;&#64; static bool vga_arbiter_add_pci_device(s
     vga_arbiter_check_bridge_sharing(vgadev);

     /* Add to the list */
-    list_add_tail(&amp;vgadev-&gt;list, &amp;vga_list);
+    list_add(&amp;vgadev-&gt;list, &amp;vga_list);
     vga_count++;
     vgaarb_info(&amp;pdev-&gt;dev, &quot;VGA device added: decodes=3D%s,ow=
ns=3D%s,locks=3D%s\n&quot;,
         vga_iostate_to_str(vgadev-&gt;decodes),

------

&#64;Allan (acefnq/ace)
Please test it.

Thanks,
Christian</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15574027442.8ce91B.1464--

--===============1984433089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1984433089==--
