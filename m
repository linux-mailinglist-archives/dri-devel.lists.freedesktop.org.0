Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C34EAFB83
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 13:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F726EA97;
	Wed, 11 Sep 2019 11:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2AC7C6EA97
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 11:39:00 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 27AAA72167; Wed, 11 Sep 2019 11:39:00 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111659] Kernel panic when waking up after screens go to dpms
 sleep
Date: Wed, 11 Sep 2019 11:39:00 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: brad@fnarfbargle.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111659-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0313256438=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0313256438==
Content-Type: multipart/alternative; boundary="15682019400.C2fdFBb1.21722"
Content-Transfer-Encoding: 7bit


--15682019400.C2fdFBb1.21722
Date: Wed, 11 Sep 2019 11:39:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111659

            Bug ID: 111659
           Summary: Kernel panic when waking up after screens go to dpms
                    sleep
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: DRM/Radeon
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: brad@fnarfbargle.com

Created attachment 145332
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145332&action=3Dedit
Multiple instances of the Panic

iMac late 2011 with 2 Thunderbolt displays.

Kernel 5.2 finally got DP routing working to allow both TB displays to work,
however I'm now getting lockups which appear to be triggered in=20=20
radeon_dp_needs_link_train.

I'm capturing these over netconsole as it leaves the machine paralysed.

Attachment faults.txt has 4 separate instances of the fault from 4 different
boots.

This machine stays on 24/7 and this seems to occur when the displays wake up
after a dpms sleep. Having said that I've also seen the fault when doing
something innocuous like changing the audio volume.

Generally at least 2 of the screens wakeup, so I have displays with a
lockscreen asking for a password and a mouse, but the machine is dead.=20

The last example in faults.txt left the machine in a state where I could ss=
h in
and reboot it. All the others required a hard power cycle.

I'm currently using 5.2.11. Previously I was using 4.17, but I can't roll b=
ack
prior to 5.2 without losing the second TB display, and it can take hours or
days to hit so bisection would be difficult.

01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Blackcomb [Radeon HD 6970M/6990M] (prog-if 00 [VGA controller])
        Subsystem: Apple Inc. Radeon HD 6970M
        Flags: bus master, fast devsel, latency 0, IRQ 79
        Memory at 90000000 (64-bit, prefetchable) [size=3D256M]
        Memory at a8800000 (64-bit, non-prefetchable) [size=3D128K]
        I/O ports at 2000 [size=3D256]
        Expansion ROM at a8820000 [disabled] [size=3D128K]
        Capabilities: [50] Power Management version 3
        Capabilities: [58] Express Legacy Endpoint, MSI 00
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
<?>
        Capabilities: [150] Advanced Error Reporting
        Kernel driver in use: radeon
        Kernel modules: radeon

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15682019400.C2fdFBb1.21722
Date: Wed, 11 Sep 2019 11:39:00 +0000
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
   title=3D"NEW - Kernel panic when waking up after screens go to dpms slee=
p"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111659">111659</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Kernel panic when waking up after screens go to dpms sleep
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
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/Radeon
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>brad&#64;fnarfbargle.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145332=
" name=3D"attach_145332" title=3D"Multiple instances of the Panic">attachme=
nt 145332</a> <a href=3D"attachment.cgi?id=3D145332&amp;action=3Dedit" titl=
e=3D"Multiple instances of the Panic">[details]</a></span>
Multiple instances of the Panic

iMac late 2011 with 2 Thunderbolt displays.

Kernel 5.2 finally got DP routing working to allow both TB displays to work,
however I'm now getting lockups which appear to be triggered in=20=20
radeon_dp_needs_link_train.

I'm capturing these over netconsole as it leaves the machine paralysed.

Attachment faults.txt has 4 separate instances of the fault from 4 different
boots.

This machine stays on 24/7 and this seems to occur when the displays wake up
after a dpms sleep. Having said that I've also seen the fault when doing
something innocuous like changing the audio volume.

Generally at least 2 of the screens wakeup, so I have displays with a
lockscreen asking for a password and a mouse, but the machine is dead.=20

The last example in faults.txt left the machine in a state where I could ss=
h in
and reboot it. All the others required a hard power cycle.

I'm currently using 5.2.11. Previously I was using 4.17, but I can't roll b=
ack
prior to 5.2 without losing the second TB display, and it can take hours or
days to hit so bisection would be difficult.

01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Blackcomb [Radeon HD 6970M/6990M] (prog-if 00 [VGA controller])
        Subsystem: Apple Inc. Radeon HD 6970M
        Flags: bus master, fast devsel, latency 0, IRQ 79
        Memory at 90000000 (64-bit, prefetchable) [size=3D256M]
        Memory at a8800000 (64-bit, non-prefetchable) [size=3D128K]
        I/O ports at 2000 [size=3D256]
        Expansion ROM at a8820000 [disabled] [size=3D128K]
        Capabilities: [50] Power Management version 3
        Capabilities: [58] Express Legacy Endpoint, MSI 00
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
&lt;?&gt;
        Capabilities: [150] Advanced Error Reporting
        Kernel driver in use: radeon
        Kernel modules: radeon</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15682019400.C2fdFBb1.21722--

--===============0313256438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0313256438==--
