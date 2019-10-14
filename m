Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 469A2D5C5E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 09:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B416E107;
	Mon, 14 Oct 2019 07:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD36D6E107
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 07:27:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C95F07296E; Mon, 14 Oct 2019 07:27:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111989] Diagnosing issues with Radeon VII
Date: Mon, 14 Oct 2019 07:27:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: ragnaros39216@yandex.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111989-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0240878350=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0240878350==
Content-Type: multipart/alternative; boundary="15710380551.Bf94cc.22786"
Content-Transfer-Encoding: 7bit


--15710380551.Bf94cc.22786
Date: Mon, 14 Oct 2019 07:27:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111989

            Bug ID: 111989
           Summary: Diagnosing issues with Radeon VII
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: ragnaros39216@yandex.com

I'm in the process of diagnosing issues with a Radeon VII that I might have
damaged during the attempts to improve its thermal conditions. Prior to all
this the card has no major issues, just that it still runs too hot while mi=
ning
(around 80-90 celsius even with fan maxed out via Radeon Profile, which, as
well as the noise, was beyond acceptable and was the main reason why I want=
ed
to improve the thermal condition in the first place).

The GPU in question now automatically switches to some kind of "safe clock"=
 of
700/350 (as observed in Radeon Profile) when under heavy load such as mining
(using ROCm backend on Manjaro/Arch), and cannot return to normal clock on =
its
own. While I can force the default clocks back using Radeon Profile, howeve=
r,
if the card is still under load, the screen will immediately become messed =
up
and a few seconds later the system hard resets with the GPU not detected in
subsequent boots (as the screen got routed to the BMC on the motherboard
instead of the video card) until I do a power cycle (manually or via IPMI).

After some failed attempts to mod the stock cooler to improve thermal condi=
tion
(during which the symptoms began), I eventually replaced the cooler altoget=
her
with an Alphacool Eiswolf for this card. Despite the thermal condition has =
been
improved greatly (it can still run Unigine Heaven tests at full clock for a
short while without issues and at an acceptable 60 celsius), however, the i=
ssue
with entering "safe clock" while mining does not go away.

I was able to get a usable under-load GPU clock of 1150MHz with Radeon Prof=
ile
after some testing (it runs at around 40 celsius under load), but the condi=
tion
only gets worse as now I can only maintain stable clock at around 1000MHz
without entering "safe clock" too quickly. The "safe clock" can still kick =
in
when I'm doing something else while mining, but as long as the clocks are s=
et
below safe ranges, I do not get system lockup/resets if I force the clock b=
ack
(by reapplying).

I couldn't get any detailed logs yet as I haven't switched on debug paramet=
ers
for amdgpu, but recently I was able to capture one occurrence with the log
ended with "ring timeout" and "GPU reset begin" before the system hard rese=
t.

I don't know where to start the investigation and find what caused the "safe
clock" to trigger and, in case the card really got damaged, which CUs are
causing issues (that I need to disable, as I just found out that I could
disable CUs using boot parameters). I'm not sure which debug parameters I c=
an
use to get the information I need to look into the issue.

The current PSU installed on the system is an EVGA Supernova 750 P2 (750W 8=
0+
Platinum) and I have both power connectors on the video card connected. The
power supply should be sufficient and shouldn't be a problem.

After all, the experience with this card raised a lot of questions that I
previously have neglected, especially regarding cooling, such as which kind=
 of
thermal compound/pads to use, where and how to apply/place them... but
personally, cooling was never this hard to get right even with some very
power-hungry CPUs I currently have.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15710380551.Bf94cc.22786
Date: Mon, 14 Oct 2019 07:27:35 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Diagnosing issues with Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111989">111989</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Diagnosing issues with Radeon VII
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>ragnaros39216&#64;yandex.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I'm in the process of diagnosing issues with a Radeon VII that=
 I might have
damaged during the attempts to improve its thermal conditions. Prior to all
this the card has no major issues, just that it still runs too hot while mi=
ning
(around 80-90 celsius even with fan maxed out via Radeon Profile, which, as
well as the noise, was beyond acceptable and was the main reason why I want=
ed
to improve the thermal condition in the first place).

The GPU in question now automatically switches to some kind of &quot;safe c=
lock&quot; of
700/350 (as observed in Radeon Profile) when under heavy load such as mining
(using ROCm backend on Manjaro/Arch), and cannot return to normal clock on =
its
own. While I can force the default clocks back using Radeon Profile, howeve=
r,
if the card is still under load, the screen will immediately become messed =
up
and a few seconds later the system hard resets with the GPU not detected in
subsequent boots (as the screen got routed to the BMC on the motherboard
instead of the video card) until I do a power cycle (manually or via IPMI).

After some failed attempts to mod the stock cooler to improve thermal condi=
tion
(during which the symptoms began), I eventually replaced the cooler altoget=
her
with an Alphacool Eiswolf for this card. Despite the thermal condition has =
been
improved greatly (it can still run Unigine Heaven tests at full clock for a
short while without issues and at an acceptable 60 celsius), however, the i=
ssue
with entering &quot;safe clock&quot; while mining does not go away.

I was able to get a usable under-load GPU clock of 1150MHz with Radeon Prof=
ile
after some testing (it runs at around 40 celsius under load), but the condi=
tion
only gets worse as now I can only maintain stable clock at around 1000MHz
without entering &quot;safe clock&quot; too quickly. The &quot;safe clock&q=
uot; can still kick in
when I'm doing something else while mining, but as long as the clocks are s=
et
below safe ranges, I do not get system lockup/resets if I force the clock b=
ack
(by reapplying).

I couldn't get any detailed logs yet as I haven't switched on debug paramet=
ers
for amdgpu, but recently I was able to capture one occurrence with the log
ended with &quot;ring timeout&quot; and &quot;GPU reset begin&quot; before =
the system hard reset.

I don't know where to start the investigation and find what caused the &quo=
t;safe
clock&quot; to trigger and, in case the card really got damaged, which CUs =
are
causing issues (that I need to disable, as I just found out that I could
disable CUs using boot parameters). I'm not sure which debug parameters I c=
an
use to get the information I need to look into the issue.

The current PSU installed on the system is an EVGA Supernova 750 P2 (750W 8=
0+
Platinum) and I have both power connectors on the video card connected. The
power supply should be sufficient and shouldn't be a problem.

After all, the experience with this card raised a lot of questions that I
previously have neglected, especially regarding cooling, such as which kind=
 of
thermal compound/pads to use, where and how to apply/place them... but
personally, cooling was never this hard to get right even with some very
power-hungry CPUs I currently have.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15710380551.Bf94cc.22786--

--===============0240878350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0240878350==--
