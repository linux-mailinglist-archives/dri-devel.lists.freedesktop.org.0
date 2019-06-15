Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 307DE470BF
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 17:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33887892BB;
	Sat, 15 Jun 2019 15:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1146D890F4
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 15:15:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 00AFD72167; Sat, 15 Jun 2019 15:15:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Sat, 15 Jun 2019 15:15:23 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110897-502-rqVGFZhRJz@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2048795210=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2048795210==
Content-Type: multipart/alternative; boundary="15606117230.Ad1Ab7.14824"
Content-Transfer-Encoding: 7bit


--15606117230.Ad1Ab7.14824
Date: Sat, 15 Jun 2019 15:15:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #47 from Richard Thier <u9vata@gmail.com> ---
Created attachment 144552
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144552&action=3Dedit
grepping around init functions in kernel / drm

Hmmm... I see that this got printed out in dmesg:

[   17.669902] [drm] radeon: 3 quad pipes, 1 z pipes initialized.

However here is an excerpt from the kernel function you mention:

static void r300_gpu_init(struct radeon_device *rdev)
{
        uint32_t gb_tile_config, tmp;

        if ((rdev->family =3D=3D CHIP_R300 && rdev->pdev->device !=3D 0x414=
4) ||
            (rdev->family =3D=3D CHIP_R350 && rdev->pdev->device !=3D 0x414=
8)) {
                /* r300,r350 */
                rdev->num_gb_pipes =3D 2;
        } else {
                /* rv350,rv370,rv380,r300 AD, r350 AH */
                rdev->num_gb_pipes =3D 1;
        }

...

        DRM_INFO("radeon: %d quad pipes, %d Z pipes initialized\n",
                 rdev->num_gb_pipes, rdev->num_z_pipes);
}

And it is pretty clear that the there is nothing that should change the num=
ber
between the log and the setup code! This kind of tells me that this functio=
n is
not called.

I see multiple "rXX_gpu_init" functions so maybe the corresponding one shou=
ld
be called, but in my case not an r300 but the rs400 variant is called? See
attachment about me grepping around in kernel sources.

I mean.. maybe calling "rs400_gpu_init" is already bad and it should be ins=
tead
the r300_gpu_init here!

Also I can see there are multiple implementations for the r420_pipes_init, =
but
mostly for later cards so it kind of seems something is really off. Maybe
someone just saw "oh RC410? That is higher number than 400 so it is an rs400
card" and completely disconfigure this card for some reason??? I mean... I =
can
still sometimes grow unsure where this specific card belongs to "properly" =
so I
can imagine someone just thinking the above.

[prenex@prenex-laptop zen-kernel-5.0.17-lqx1]$ grep -R r420_pipes_init
drivers/gpu/*
drivers/gpu/drm/radeon/rs400.c: r420_pipes_init(rdev);
drivers/gpu/drm/radeon/rv515.o bin=C3=A1ris f=C3=A1jl illeszkedik
drivers/gpu/drm/radeon/rs600.o bin=C3=A1ris f=C3=A1jl illeszkedik
drivers/gpu/drm/radeon/r520.c:  r420_pipes_init(rdev);
drivers/gpu/drm/radeon/radeon.o bin=C3=A1ris f=C3=A1jl illeszkedik
drivers/gpu/drm/radeon/rs690.c: r420_pipes_init(rdev);
drivers/gpu/drm/radeon/r420.c:void r420_pipes_init(struct radeon_device *rd=
ev)
drivers/gpu/drm/radeon/r420.c:  r420_pipes_init(rdev);
drivers/gpu/drm/radeon/rs690.o bin=C3=A1ris f=C3=A1jl illeszkedik
drivers/gpu/drm/radeon/r520.o bin=C3=A1ris f=C3=A1jl illeszkedik
drivers/gpu/drm/radeon/radeon_asic.h:extern void r420_pipes_init(struct
radeon_device *rdev);
drivers/gpu/drm/radeon/rs600.c: r420_pipes_init(rdev);
drivers/gpu/drm/radeon/r420.o bin=C3=A1ris f=C3=A1jl illeszkedik
drivers/gpu/drm/radeon/radeon.ko bin=C3=A1ris f=C3=A1jl illeszkedik
drivers/gpu/drm/radeon/rs400.o bin=C3=A1ris f=C3=A1jl illeszkedik
drivers/gpu/drm/radeon/rv515.c: r420_pipes_init(rdev);

I don't see it yet where the radeon driver decides which of the r*_gpu_init
function to call, but I am already grepping for it. If there is an easy to =
spot
error there I might be even able to patch it - or at least go further :-)

Oh I see now that I am grepping for the wrong function as likely "r300_star=
tup"
is the one that calls the r300_gpu_init (and likely others call the same in=
 the
similar pattern) so I must search for this startup function instead.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15606117230.Ad1Ab7.14824
Date: Sat, 15 Jun 2019 15:15:23 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c47">Comme=
nt # 47</a>
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144552=
" name=3D"attach_144552" title=3D"grepping around init functions in kernel =
/ drm">attachment 144552</a> <a href=3D"attachment.cgi?id=3D144552&amp;acti=
on=3Dedit" title=3D"grepping around init functions in kernel / drm">[detail=
s]</a></span>
grepping around init functions in kernel / drm

Hmmm... I see that this got printed out in dmesg:

[   17.669902] [drm] radeon: 3 quad pipes, 1 z pipes initialized.

However here is an excerpt from the kernel function you mention:

static void r300_gpu_init(struct radeon_device *rdev)
{
        uint32_t gb_tile_config, tmp;

        if ((rdev-&gt;family =3D=3D CHIP_R300 &amp;&amp; rdev-&gt;pdev-&gt;=
device !=3D 0x4144) ||
            (rdev-&gt;family =3D=3D CHIP_R350 &amp;&amp; rdev-&gt;pdev-&gt;=
device !=3D 0x4148)) {
                /* r300,r350 */
                rdev-&gt;num_gb_pipes =3D 2;
        } else {
                /* rv350,rv370,rv380,r300 AD, r350 AH */
                rdev-&gt;num_gb_pipes =3D 1;
        }

...

        DRM_INFO(&quot;radeon: %d quad pipes, %d Z pipes initialized\n&quot=
;,
                 rdev-&gt;num_gb_pipes, rdev-&gt;num_z_pipes);
}

And it is pretty clear that the there is nothing that should change the num=
ber
between the log and the setup code! This kind of tells me that this functio=
n is
not called.

I see multiple &quot;rXX_gpu_init&quot; functions so maybe the correspondin=
g one should
be called, but in my case not an r300 but the rs400 variant is called? See
attachment about me grepping around in kernel sources.

I mean.. maybe calling &quot;rs400_gpu_init&quot; is already bad and it sho=
uld be instead
the r300_gpu_init here!

Also I can see there are multiple implementations for the r420_pipes_init, =
but
mostly for later cards so it kind of seems something is really off. Maybe
someone just saw &quot;oh RC410? That is higher number than 400 so it is an=
 rs400
card&quot; and completely disconfigure this card for some reason??? I mean.=
.. I can
still sometimes grow unsure where this specific card belongs to &quot;prope=
rly&quot; so I
can imagine someone just thinking the above.

[prenex&#64;prenex-laptop zen-kernel-5.0.17-lqx1]$ grep -R r420_pipes_init
drivers/gpu/*
drivers/gpu/drm/radeon/rs400.c: r420_pipes_init(rdev);
drivers/gpu/drm/radeon/rv515.o bin=C3=A1ris f=C3=A1jl illeszkedik
drivers/gpu/drm/radeon/rs600.o bin=C3=A1ris f=C3=A1jl illeszkedik
drivers/gpu/drm/radeon/r520.c:  r420_pipes_init(rdev);
drivers/gpu/drm/radeon/radeon.o bin=C3=A1ris f=C3=A1jl illeszkedik
drivers/gpu/drm/radeon/rs690.c: r420_pipes_init(rdev);
drivers/gpu/drm/radeon/r420.c:void r420_pipes_init(struct radeon_device *rd=
ev)
drivers/gpu/drm/radeon/r420.c:  r420_pipes_init(rdev);
drivers/gpu/drm/radeon/rs690.o bin=C3=A1ris f=C3=A1jl illeszkedik
drivers/gpu/drm/radeon/r520.o bin=C3=A1ris f=C3=A1jl illeszkedik
drivers/gpu/drm/radeon/radeon_asic.h:extern void r420_pipes_init(struct
radeon_device *rdev);
drivers/gpu/drm/radeon/rs600.c: r420_pipes_init(rdev);
drivers/gpu/drm/radeon/r420.o bin=C3=A1ris f=C3=A1jl illeszkedik
drivers/gpu/drm/radeon/radeon.ko bin=C3=A1ris f=C3=A1jl illeszkedik
drivers/gpu/drm/radeon/rs400.o bin=C3=A1ris f=C3=A1jl illeszkedik
drivers/gpu/drm/radeon/rv515.c: r420_pipes_init(rdev);

I don't see it yet where the radeon driver decides which of the r*_gpu_init
function to call, but I am already grepping for it. If there is an easy to =
spot
error there I might be even able to patch it - or at least go further :-)

Oh I see now that I am grepping for the wrong function as likely &quot;r300=
_startup&quot;
is the one that calls the r300_gpu_init (and likely others call the same in=
 the
similar pattern) so I must search for this startup function instead.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15606117230.Ad1Ab7.14824--

--===============2048795210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2048795210==--
