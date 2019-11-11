Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04540F70E2
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 10:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3646E874;
	Mon, 11 Nov 2019 09:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 90E246E874
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 09:33:46 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8D565720E2; Mon, 11 Nov 2019 09:33:46 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112242] amdgpu [RX Vega 56]: ring sdma0 timeout
Date: Mon, 11 Nov 2019 09:33:46 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: mh@familie-heinz.name
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-112242-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1317989561=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1317989561==
Content-Type: multipart/alternative; boundary="15734648260.dAab4CB95.29609"
Content-Transfer-Encoding: 7bit


--15734648260.dAab4CB95.29609
Date: Mon, 11 Nov 2019 09:33:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112242

            Bug ID: 112242
           Summary: amdgpu [RX Vega 56]: ring sdma0 timeout
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: mh@familie-heinz.name

Hi,

I've reported this over at bugzilla.kernel.org but didn't get any help ther=
e.
Maybe because nobody is expecting bugreports about the amdgpu driver over on
the kernels bugtracker?

So this started a while ago, when I updated from 5.0.0 to a newer kernel. I=
'm
currently at 5.3.0 and for almost any game I play I run into this problem:

Aug 24 11:13:33 egalite kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
sdma0 timeout, signaled seq=3D368056, emitted seq=3D368057
Aug 24 11:13:33 egalite kernel: [drm:drm_atomic_helper_wait_for_flip_done
[drm_kms_helper]] *ERROR* [CRTC:47:crtc-0] flip_done timed out
Aug 24 11:13:33 egalite kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process 7DaysToDie.x86_ pid 8108 thread 7DaysToDie:cs0
Aug 24 11:13:33 egalite kernel: amdgpu 0000:0c:00.0: GPU reset begin!
Aug 24 11:13:33 egalite kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
gfx timeout, but soft recovered

Only a hard reset made me recover from that.

I did some kernel traces which I will copy over to this report, if necessar=
y,
but for now you can download them here:
https://bugzilla.kernel.org/show_bug.cgi?id=3D204683

It also looks a bit like this bug:
https://bugzilla.kernel.org/show_bug.cgi?id=3D201957 , because I also get t=
he
"ring gfx timeout". And there are lots and lots of people having this issue.

I tried bisecting it, but failed, because either I missed the commit that
causes this, because there are multiple reasons why this happens or this re=
ally
goes way back to the time, where 4.18 was the base for drm-next (which does=
n't
compile on modern compilers anymore. Also steam doesn't want to run on those
old kernels, so even when I was able to compile an older kernel, there was =
no
way to test them)

I even tried debugging it over ethernet (KGDBoE is a nice thing if you need
performance), but somehow this slowed everything down enough to not trigger=
 the
bug.

I also tried the suggestions from
https://bugs.freedesktop.org/show_bug.cgi?id=3D109955, but forbidding the l=
owest
clock mode doesn't help either. (It fixes my RocketLeague problems, though).

Please advise what I should try next.

Best regards
Matthias

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15734648260.dAab4CB95.29609
Date: Mon, 11 Nov 2019 09:33:46 +0000
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
   title=3D"NEW - amdgpu [RX Vega 56]: ring sdma0 timeout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112242">112242</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>amdgpu [RX Vega 56]: ring sdma0 timeout
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
          <td>mh&#64;familie-heinz.name
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi,

I've reported this over at bugzilla.kernel.org but didn't get any help ther=
e.
Maybe because nobody is expecting bugreports about the amdgpu driver over on
the kernels bugtracker?

So this started a while ago, when I updated from 5.0.0 to a newer kernel. I=
'm
currently at 5.3.0 and for almost any game I play I run into this problem:

Aug 24 11:13:33 egalite kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
sdma0 timeout, signaled seq=3D368056, emitted seq=3D368057
Aug 24 11:13:33 egalite kernel: [drm:drm_atomic_helper_wait_for_flip_done
[drm_kms_helper]] *ERROR* [CRTC:47:crtc-0] flip_done timed out
Aug 24 11:13:33 egalite kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process 7DaysToDie.x86_ pid 8108 thread 7DaysToDie:cs0
Aug 24 11:13:33 egalite kernel: amdgpu 0000:0c:00.0: GPU reset begin!
Aug 24 11:13:33 egalite kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
gfx timeout, but soft recovered

Only a hard reset made me recover from that.

I did some kernel traces which I will copy over to this report, if necessar=
y,
but for now you can download them here:
<a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D204683">https://bu=
gzilla.kernel.org/show_bug.cgi?id=3D204683</a>

It also looks a bit like this bug:
<a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D201957">https://bu=
gzilla.kernel.org/show_bug.cgi?id=3D201957</a> , because I also get the
&quot;ring gfx timeout&quot;. And there are lots and lots of people having =
this issue.

I tried bisecting it, but failed, because either I missed the commit that
causes this, because there are multiple reasons why this happens or this re=
ally
goes way back to the time, where 4.18 was the base for drm-next (which does=
n't
compile on modern compilers anymore. Also steam doesn't want to run on those
old kernels, so even when I was able to compile an older kernel, there was =
no
way to test them)

I even tried debugging it over ethernet (KGDBoE is a nice thing if you need
performance), but somehow this slowed everything down enough to not trigger=
 the
bug.

I also tried the suggestions from
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"show_bug.cgi?id=3D109955">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109955</a>, but forbidding the lowest
clock mode doesn't help either. (It fixes my RocketLeague problems, though).

Please advise what I should try next.

Best regards
Matthias</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15734648260.dAab4CB95.29609--

--===============1317989561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1317989561==--
