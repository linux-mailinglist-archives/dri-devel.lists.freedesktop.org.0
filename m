Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B01446C2D
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 00:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D052E8972C;
	Fri, 14 Jun 2019 22:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C77578972C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 22:01:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BF4B772167; Fri, 14 Jun 2019 22:01:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Fri, 14 Jun 2019 22:01:40 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: u9vata@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110897-502-G24NvKAORf@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110897-502@http.bugs.freedesktop.org/>
References: <bug-110897-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1246002512=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1246002512==
Content-Type: multipart/alternative; boundary="15605496990.71DA231.17378"
Content-Transfer-Encoding: 7bit


--15605496990.71DA231.17378
Date: Fri, 14 Jun 2019 22:01:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #36 from Richard Thier <u9vata@gmail.com> ---
Okay it seems pipes=3D1 is working on my machine.

diff --git a/src/gallium/drivers/r300/r300_texture_desc.c
b/src/gallium/drivers/r300/r300_texture_desc.c
index 77d272bfb6b..029b28570d7 100644
--- a/src/gallium/drivers/r300/r300_texture_desc.c
+++ b/src/gallium/drivers/r300/r300_texture_desc.c
@@ -358,6 +358,9 @@ static void r300_setup_hyperz_properties(struct r300_sc=
reen
*screen,
             pipes =3D screen->info.r300_num_z_pipes;
         } else {
             pipes =3D screen->info.r300_num_gb_pipes;
+           /* FIXME: Quickfix only for Mobility Radeon Xpress 200M in asus
laptop! */
+            pipes =3D 2; // Half the screen is bad for me
+            pipes =3D 1; // Whole screen is ok for me
         }

         for (i =3D 0; i <=3D tex->b.b.last_level; i++) {

I do not even dare uploading this patch as it likely only works on my speci=
fic
machine! The know-how seems to be worthy of knowing though so in case anyone
see something like this, they can try something similar until there is a pr=
oper
fix.

317     /* The tile size of 1 DWORD in ZMASK RAM is:
318      *
319      * GPU    Pipes    4x4 mode   8x8 mode
320      * ------------------------------------------
321      * R580   4P/1Z    32x32      64x64
322      * RV570  3P/1Z    48x16      96x32
323      * RV530  1P/2Z    32x16      64x32
324      *        1P/1Z    16x16      32x32
325      */
326     static unsigned zmask_blocks_x_per_dw[4] =3D {4, 8, 12, 8};
327     static unsigned zmask_blocks_y_per_dw[4] =3D {4, 4,  4, 8};

I should have thought that pipes=3D1 is for me. As you can see here, there =
are
hardcoded values for X and Y block counts. Originally drm reports pipes=3D3=
 for
my card so I end up using the third column in this table: 12*4 blocks.

Now remembering I had to half both of them earlier using the hacky patch (6=
*2)
it was sure that "pipes=3D2" would not work still, because 4*8 =3D 32 is st=
ill much
more than 6*2=3D12 I provided. Of course 4*4=3D16 so now I see my earlier h=
ack was
a bit miscalculated.

Also now I see exactly why 1/3 of the screen was only "working": because 12=
/4 =3D
3 and 4/4=3D1. You can clearly see this from the table!!! Wow!

I see that "r300_num_gb_pipes" is used at some of the other places:

src/gallium/drivers/r300/r300_query.c
src/gallium/drivers/r300/r300_emit.c (also for some queries)
src/gallium/drivers/r300/r300_context.c (only fprintf-ing for debugging)
src/gallium/winsys/radeon/drm/radeon_drm_winsys.c (this where the drm query=
 is)

I do not really know what kind of "queries" are these, but I might go and
change code so that winsys returns gb_pipes=3D1 itself without hacks at oth=
er
places and see if there are other glitches (a bit prolonged testing).

Who knows, maybe things actually get less glitchy if this query stuff is re=
ally
used and the value was bad before!

Then if I see that I really only have one pipeline, then maybe I should loo=
k at
the other side of this drm call to see why it returns this value and not el=
se.

PS.: One other thing that I do not know is if pipes can exist maybe but can=
 be
turned off or something? But I really have no idea about that.

PS.: I also grow to understand the logic why the smaller values here actual=
ly
make more to be properly rendered on screen! Because if there are two or th=
ree
pipes for example, you clear things similarly to this pattern:

01012323.... etc (I saw them in docs or source comments). So if there would=
 be
two pipes, you can z-delete two blocks at the same time etc. it is only sim=
ple
maths to see the smaller values are better here then.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15605496990.71DA231.17378
Date: Fri, 14 Jun 2019 22:01:39 +0000
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
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c36">Comme=
nt # 36</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897">bug 11089=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
u9vata&#64;gmail.com" title=3D"Richard Thier &lt;u9vata&#64;gmail.com&gt;">=
 <span class=3D"fn">Richard Thier</span></a>
</span></b>
        <pre>Okay it seems pipes=3D1 is working on my machine.

diff --git a/src/gallium/drivers/r300/r300_texture_desc.c
b/src/gallium/drivers/r300/r300_texture_desc.c
index 77d272bfb6b..029b28570d7 100644
--- a/src/gallium/drivers/r300/r300_texture_desc.c
+++ b/src/gallium/drivers/r300/r300_texture_desc.c
&#64;&#64; -358,6 +358,9 &#64;&#64; static void r300_setup_hyperz_propertie=
s(struct r300_screen
*screen,
             pipes =3D screen-&gt;info.r300_num_z_pipes;
         } else {
             pipes =3D screen-&gt;info.r300_num_gb_pipes;
+           /* FIXME: Quickfix only for Mobility Radeon Xpress 200M in asus
laptop! */
+            pipes =3D 2; // Half the screen is bad for me
+            pipes =3D 1; // Whole screen is ok for me
         }

         for (i =3D 0; i &lt;=3D tex-&gt;b.b.last_level; i++) {

I do not even dare uploading this patch as it likely only works on my speci=
fic
machine! The know-how seems to be worthy of knowing though so in case anyone
see something like this, they can try something similar until there is a pr=
oper
fix.

317     /* The tile size of 1 DWORD in ZMASK RAM is:
318      *
319      * GPU    Pipes    4x4 mode   8x8 mode
320      * ------------------------------------------
321      * R580   4P/1Z    32x32      64x64
322      * RV570  3P/1Z    48x16      96x32
323      * RV530  1P/2Z    32x16      64x32
324      *        1P/1Z    16x16      32x32
325      */
326     static unsigned zmask_blocks_x_per_dw[4] =3D {4, 8, 12, 8};
327     static unsigned zmask_blocks_y_per_dw[4] =3D {4, 4,  4, 8};

I should have thought that pipes=3D1 is for me. As you can see here, there =
are
hardcoded values for X and Y block counts. Originally drm reports pipes=3D3=
 for
my card so I end up using the third column in this table: 12*4 blocks.

Now remembering I had to half both of them earlier using the hacky patch (6=
*2)
it was sure that &quot;pipes=3D2&quot; would not work still, because 4*8 =
=3D 32 is still much
more than 6*2=3D12 I provided. Of course 4*4=3D16 so now I see my earlier h=
ack was
a bit miscalculated.

Also now I see exactly why 1/3 of the screen was only &quot;working&quot;: =
because 12/4 =3D
3 and 4/4=3D1. You can clearly see this from the table!!! Wow!

I see that &quot;r300_num_gb_pipes&quot; is used at some of the other place=
s:

src/gallium/drivers/r300/r300_query.c
src/gallium/drivers/r300/r300_emit.c (also for some queries)
src/gallium/drivers/r300/r300_context.c (only fprintf-ing for debugging)
src/gallium/winsys/radeon/drm/radeon_drm_winsys.c (this where the drm query=
 is)

I do not really know what kind of &quot;queries&quot; are these, but I migh=
t go and
change code so that winsys returns gb_pipes=3D1 itself without hacks at oth=
er
places and see if there are other glitches (a bit prolonged testing).

Who knows, maybe things actually get less glitchy if this query stuff is re=
ally
used and the value was bad before!

Then if I see that I really only have one pipeline, then maybe I should loo=
k at
the other side of this drm call to see why it returns this value and not el=
se.

PS.: One other thing that I do not know is if pipes can exist maybe but can=
 be
turned off or something? But I really have no idea about that.

PS.: I also grow to understand the logic why the smaller values here actual=
ly
make more to be properly rendered on screen! Because if there are two or th=
ree
pipes for example, you clear things similarly to this pattern:

01012323.... etc (I saw them in docs or source comments). So if there would=
 be
two pipes, you can z-delete two blocks at the same time etc. it is only sim=
ple
maths to see the smaller values are better here then.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15605496990.71DA231.17378--

--===============1246002512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1246002512==--
