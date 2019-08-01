Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2847DD7A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 16:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB036E624;
	Thu,  1 Aug 2019 14:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 865656E63C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 14:09:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 83A4472167; Thu,  1 Aug 2019 14:09:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 104602] [apitrace] Graphical artifacts in Civilization VI on RX
 Vega
Date: Thu, 01 Aug 2019 14:09:56 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 17.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwabbott0@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-104602-502-4WW38XEEnW@http.bugs.freedesktop.org/>
In-Reply-To: <bug-104602-502@http.bugs.freedesktop.org/>
References: <bug-104602-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0270515758=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0270515758==
Content-Type: multipart/alternative; boundary="15646685966.db5AEeAC.6625"
Content-Transfer-Encoding: 7bit


--15646685966.db5AEeAC.6625
Date: Thu, 1 Aug 2019 14:09:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104602

--- Comment #20 from Connor Abbott <cwabbott0@gmail.com> ---
I wanted to make sure that improving the NIR path to reach parity with TGSI=
 in
local variable handling wouldn't break things, so I investigated this a bit
more. It seems this is triggered by the fact that on Vega the TGSI path alw=
ays
uses scratch, even for smaller local arrays. This bloats the scratch space =
used
by the VS in question. There are three back-to-back draw calls with this VS
(used to build up the map), each using scratch, and it seems that radeonsi
doesn't properly wait for each call to be done before starting the next and
reuses the same scratch buffer, resulting in the threads from one draw call
overwriting the scratch of the previous call. Hacking
si_update_spi_tmpring_size() to always allocate a new scratch buffer "fixes"
the black triangles.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15646685966.db5AEeAC.6625
Date: Thu, 1 Aug 2019 14:09:56 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [apitrace] Graphical artifacts in Civilization=
 VI on RX Vega"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104602#c20">Comme=
nt # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [apitrace] Graphical artifacts in Civilization=
 VI on RX Vega"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104602">bug 10460=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cwabbott0&#64;gmail.com" title=3D"Connor Abbott &lt;cwabbott0&#64;gmail.com=
&gt;"> <span class=3D"fn">Connor Abbott</span></a>
</span></b>
        <pre>I wanted to make sure that improving the NIR path to reach par=
ity with TGSI in
local variable handling wouldn't break things, so I investigated this a bit
more. It seems this is triggered by the fact that on Vega the TGSI path alw=
ays
uses scratch, even for smaller local arrays. This bloats the scratch space =
used
by the VS in question. There are three back-to-back draw calls with this VS
(used to build up the map), each using scratch, and it seems that radeonsi
doesn't properly wait for each call to be done before starting the next and
reuses the same scratch buffer, resulting in the threads from one draw call
overwriting the scratch of the previous call. Hacking
si_update_spi_tmpring_size() to always allocate a new scratch buffer &quot;=
fixes&quot;
the black triangles.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15646685966.db5AEeAC.6625--

--===============0270515758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0270515758==--
