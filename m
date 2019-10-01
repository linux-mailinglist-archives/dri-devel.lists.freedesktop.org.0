Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EA4C301D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 11:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA8A896D8;
	Tue,  1 Oct 2019 09:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8BF92896D8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 09:24:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 88CBD72162; Tue,  1 Oct 2019 09:24:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111747] [CI][DRMTIP] igt@ - incomplete - Jenkins gives up
Date: Tue, 01 Oct 2019 09:24:48 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Intel
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: petri.latvala@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: intel-gfx-bugs@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to priority bug_severity
 qa_contact cf_i915_features
Message-ID: <bug-111747-502-3jcrW14pFR@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111747-502@http.bugs.freedesktop.org/>
References: <bug-111747-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1971278659=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1971278659==
Content-Type: multipart/alternative; boundary="15699218880.2FCfAbc.15426"
Content-Transfer-Encoding: 7bit


--15699218880.2FCfAbc.15426
Date: Tue, 1 Oct 2019 09:24:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111747

Petri Latvala <petri.latvala@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|IGT                         |DRM/Intel
           Assignee|dri-devel@lists.freedesktop |intel-gfx-bugs@lists.freede
                   |.org                        |sktop.org
           Priority|not set                     |medium
           Severity|not set                     |normal
         QA Contact|                            |intel-gfx-bugs@lists.freede
                   |                            |sktop.org
      i915 features|GEM/Other                   |CI Infra

--- Comment #15 from Petri Latvala <petri.latvala@intel.com> ---
Happens to TGL in 5 / 16 runs (31.2%), last seen in: the previous build.

(I mention TGL since this bug seems to be for the TGL occurrences but it can
happen to any machine)

User impact for this issue in particular is N/A since it's a CI issue. Howe=
ver,
having incompletes reduces the coverage for any test that doesn't get run d=
ue
to this so potentially very dire. It doesn't happen at 100% regularity thou=
gh,
and happens for arbitrary tests so coverage loss is not entirely up to the
potential cap.

What happens here is

1) Jenkins connects to DUT through ssh and launches tests
2) Jenkins loses ssh connection
3) The Jenkins job for executing the test finishes, because the ssh command
completed
4) At the end of finishing a test, a reboot-and-collect job is executed
5) The reboot-and-collect job connects through ssh and reboots the machine

The remote reboot job got a logging step added, tests that die due to the
reboot command prematurely invoked get a log entry in dmesg stating power.s=
h is
taking this machine down. From that we can determine that network didn't
completely die, just the ssh connection.

There is a plan to solve this. igt_runner will be changed to expose an AF_L=
OCAL
socket for outside control, and the Jenkins job for executing tests will th=
en
no longer be required to maintain an ssh connection active for the duration=
 of
the whole test round. Instead tests will be launched in the background (with
screen or tmux or just nohup) and the Jenkins job will reconnect the ssh
connection when/if it fails and check through igt_runner's control channel =
if a
test is still running.

Moving this bug to CI infra.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15699218880.2FCfAbc.15426
Date: Tue, 1 Oct 2019 09:24:48 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:petri.lat=
vala&#64;intel.com" title=3D"Petri Latvala &lt;petri.latvala&#64;intel.com&=
gt;"> <span class=3D"fn">Petri Latvala</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][DRMTIP] igt&#64; - incomplete - Jenkins gives up"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111747">bug 11174=
7</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>IGT
           </td>
           <td>DRM/Intel
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>dri-devel&#64;lists.freedesktop.org
           </td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Priority</td>
           <td>not set
           </td>
           <td>medium
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Severity</td>
           <td>not set
           </td>
           <td>normal
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>
               &nbsp;
           </td>
           <td>intel-gfx-bugs&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">i915 features</td>
           <td>GEM/Other
           </td>
           <td>CI Infra
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][DRMTIP] igt&#64; - incomplete - Jenkins gives up"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111747#c15">Comme=
nt # 15</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][DRMTIP] igt&#64; - incomplete - Jenkins gives up"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111747">bug 11174=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
petri.latvala&#64;intel.com" title=3D"Petri Latvala &lt;petri.latvala&#64;i=
ntel.com&gt;"> <span class=3D"fn">Petri Latvala</span></a>
</span></b>
        <pre>Happens to TGL in 5 / 16 runs (31.2%), last seen in: the previ=
ous build.

(I mention TGL since this bug seems to be for the TGL occurrences but it can
happen to any machine)

User impact for this issue in particular is N/A since it's a CI issue. Howe=
ver,
having incompletes reduces the coverage for any test that doesn't get run d=
ue
to this so potentially very dire. It doesn't happen at 100% regularity thou=
gh,
and happens for arbitrary tests so coverage loss is not entirely up to the
potential cap.

What happens here is

1) Jenkins connects to DUT through ssh and launches tests
2) Jenkins loses ssh connection
3) The Jenkins job for executing the test finishes, because the ssh command
completed
4) At the end of finishing a test, a reboot-and-collect job is executed
5) The reboot-and-collect job connects through ssh and reboots the machine

The remote reboot job got a logging step added, tests that die due to the
reboot command prematurely invoked get a log entry in dmesg stating power.s=
h is
taking this machine down. From that we can determine that network didn't
completely die, just the ssh connection.

There is a plan to solve this. igt_runner will be changed to expose an AF_L=
OCAL
socket for outside control, and the Jenkins job for executing tests will th=
en
no longer be required to maintain an ssh connection active for the duration=
 of
the whole test round. Instead tests will be launched in the background (with
screen or tmux or just nohup) and the Jenkins job will reconnect the ssh
connection when/if it fails and check through igt_runner's control channel =
if a
test is still running.

Moving this bug to CI infra.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15699218880.2FCfAbc.15426--

--===============1971278659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1971278659==--
