Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A67B46CF6
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 01:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE27D89568;
	Fri, 14 Jun 2019 23:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 60ABB895C8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 23:30:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4FC73721A2; Fri, 14 Jun 2019 23:30:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Fri, 14 Jun 2019 23:30:39 +0000
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
Message-ID: <bug-110897-502-eFcbezLoUn@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0340472079=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0340472079==
Content-Type: multipart/alternative; boundary="15605550392.ff412.7691"
Content-Transfer-Encoding: 7bit


--15605550392.ff412.7691
Date: Fri, 14 Jun 2019 23:30:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #42 from Richard Thier <u9vata@gmail.com> ---
(In reply to Marek Ol=C5=A1=C3=A1k from comment #40)
> I'm afraid nobody remembers anymore how HyperZ works on r300. I can answer
> basic questions if you have any.

Hi!

Currently I have added this to radeon_drm_winsys.c:

385     if (ws->gen =3D=3D DRV_R300) {
386         if (!radeon_get_drm_value(ws->fd, RADEON_INFO_NUM_GB_PIPES,
387                                   "GB pipe count",
388                                   &ws->info.r300_num_gb_pipes))
389             return false;
390 +       // FIXME: only works for my own setup (prenex):
391 +       ws->info.r300_num_gb_pipes=3D1;

Now I have no problems so far. It can be that HyperZ code is just good as-i=
s,
but for some resoun the radeon_get_drm_value returns a bad gb_pipes number.

Currently testing with this a bit more throughly before moving further, but
everything seems to work so far, just this is not a proper fix.

Some questions I can have:

1.) Is there any way to ensure how many pipes a card has? One pipeline seem=
s to
be really few for a GPU, but this is a mobile integrated card.

2.) Can the other indicated pipes be existing on my card but turned off for
some reason?

3.) radeon_get_drm_value - is this in the kernel source tree? I will have a
look later on the code behind it.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15605550392.ff412.7691
Date: Fri, 14 Jun 2019 23:30:39 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c42">Comme=
nt # 42</a>
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
        <pre>(In reply to Marek Ol=C5=A1=C3=A1k from <a href=3D"show_bug.cg=
i?id=3D110897#c40">comment #40</a>)
<span class=3D"quote">&gt; I'm afraid nobody remembers anymore how HyperZ w=
orks on r300. I can answer
&gt; basic questions if you have any.</span >

Hi!

Currently I have added this to radeon_drm_winsys.c:

385     if (ws-&gt;gen =3D=3D DRV_R300) {
386         if (!radeon_get_drm_value(ws-&gt;fd, RADEON_INFO_NUM_GB_PIPES,
387                                   &quot;GB pipe count&quot;,
388                                   &amp;ws-&gt;info.r300_num_gb_pipes))
389             return false;
390 +       // FIXME: only works for my own setup (prenex):
391 +       ws-&gt;info.r300_num_gb_pipes=3D1;

Now I have no problems so far. It can be that HyperZ code is just good as-i=
s,
but for some resoun the radeon_get_drm_value returns a bad gb_pipes number.

Currently testing with this a bit more throughly before moving further, but
everything seems to work so far, just this is not a proper fix.

Some questions I can have:

1.) Is there any way to ensure how many pipes a card has? One pipeline seem=
s to
be really few for a GPU, but this is a mobile integrated card.

2.) Can the other indicated pipes be existing on my card but turned off for
some reason?

3.) radeon_get_drm_value - is this in the kernel source tree? I will have a
look later on the code behind it.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15605550392.ff412.7691--

--===============0340472079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0340472079==--
