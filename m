Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB0244A83
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 20:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8D289700;
	Thu, 13 Jun 2019 18:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id EDBA689708
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 18:17:31 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EAA7672167; Thu, 13 Jun 2019 18:17:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110856] Freesync causes in-game blackscreens when game has low
 fps.
Date: Thu, 13 Jun 2019 18:17:32 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: rropid@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110856-502-XcNjgir1gw@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110856-502@http.bugs.freedesktop.org/>
References: <bug-110856-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0036247884=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0036247884==
Content-Type: multipart/alternative; boundary="15604498513.F846E.1486"
Content-Transfer-Encoding: 7bit


--15604498513.F846E.1486
Date: Thu, 13 Jun 2019 18:17:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110856

--- Comment #7 from Ropid <rropid@gmail.com> ---
I saw the same issue when I tried the BenQ EX3203R for a few days. I could =
work
around the problem by extracting and saving the monitor's EDID in a file, a=
nd
changing the VRR range in that file from the original 24-144Hz to 48-144Hz.=
 I
then overrode the monitor's EDID on the kernel command line with this param=
eter
here:

drm_kms_helper.edid_firmware=3DDP-1:edid/edid-benq-xr3203r-vrr-48-144.bin

My customized EDID file is this:

$ base64 /usr/lib/firmware/edid/edid-benq-xr3203r-vrr-48-144.bin=20
AP///////wAJ0WZ/RVQAABkcAQS1Rid4P901rE9FrCYQUFQlSwDR/NHo0cCzAKnAgYCBAIHAVl4A
oKCgKVAvIDUAgGghAAAaAAAA/QAwkN7ePAEKICAgICAgAAAA/ABCZW5RIEVYMzIwM1IKAAAAEAAA
AAAAAAAAAAAAAAAAAdUCA1VwUVxbWj9AEB8iISAEExIDAWFrIwkHB4MBAADiAMBtAwwAEAA4eCAA
YAECA2fYXcQBeAADbRoAAAIDMJAAA2A3CC/jBeMB5A9g/AHmBgcBYF06+OMAoKCgMlAIIJgEgGgh
AAAeB4KAUHA4TUAIIPgM4A4RAAAcAAAAAAAAqw=3D=3D

If you want to try this custom EDID file I used, run that base64 encoded te=
xt I
shared here through "base64 --decode > filename.bin" to get the binary file.

For the kernel parameter, the output ports are named differently than in Xo=
rg.
You can get the output port name where the monitor is connected like this:

$ grep . /sys/class/drm/card*-*/status
/sys/class/drm/card0-DP-1/status:connected
/sys/class/drm/card0-DP-2/status:disconnected
...

About how I created the EDID file, it was with a Windows tool named "Custom
Resolution Utility". It can extract the EDID from the monitor/driver and sa=
ve
it in a file, and can customize the VRR data structure in there.

I only tried 48Hz for minimum VRR range and this worked fine, there were no
black screens anymore. I don't know what other values work with the EX3203R.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15604498513.F846E.1486
Date: Thu, 13 Jun 2019 18:17:31 +0000
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
   title=3D"NEW - Freesync causes in-game blackscreens when game has low fp=
s."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110856#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Freesync causes in-game blackscreens when game has low fp=
s."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110856">bug 11085=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rropid&#64;gmail.com" title=3D"Ropid &lt;rropid&#64;gmail.com&gt;"> <span c=
lass=3D"fn">Ropid</span></a>
</span></b>
        <pre>I saw the same issue when I tried the BenQ EX3203R for a few d=
ays. I could work
around the problem by extracting and saving the monitor's EDID in a file, a=
nd
changing the VRR range in that file from the original 24-144Hz to 48-144Hz.=
 I
then overrode the monitor's EDID on the kernel command line with this param=
eter
here:

drm_kms_helper.edid_firmware=3DDP-1:edid/edid-benq-xr3203r-vrr-48-144.bin

My customized EDID file is this:

$ base64 /usr/lib/firmware/edid/edid-benq-xr3203r-vrr-48-144.bin=20
AP///////wAJ0WZ/RVQAABkcAQS1Rid4P901rE9FrCYQUFQlSwDR/NHo0cCzAKnAgYCBAIHAVl4A
oKCgKVAvIDUAgGghAAAaAAAA/QAwkN7ePAEKICAgICAgAAAA/ABCZW5RIEVYMzIwM1IKAAAAEAAA
AAAAAAAAAAAAAAAAAdUCA1VwUVxbWj9AEB8iISAEExIDAWFrIwkHB4MBAADiAMBtAwwAEAA4eCAA
YAECA2fYXcQBeAADbRoAAAIDMJAAA2A3CC/jBeMB5A9g/AHmBgcBYF06+OMAoKCgMlAIIJgEgGgh
AAAeB4KAUHA4TUAIIPgM4A4RAAAcAAAAAAAAqw=3D=3D

If you want to try this custom EDID file I used, run that base64 encoded te=
xt I
shared here through &quot;base64 --decode &gt; filename.bin&quot; to get th=
e binary file.

For the kernel parameter, the output ports are named differently than in Xo=
rg.
You can get the output port name where the monitor is connected like this:

$ grep . /sys/class/drm/card*-*/status
/sys/class/drm/card0-DP-1/status:connected
/sys/class/drm/card0-DP-2/status:disconnected
...

About how I created the EDID file, it was with a Windows tool named &quot;C=
ustom
Resolution Utility&quot;. It can extract the EDID from the monitor/driver a=
nd save
it in a file, and can customize the VRR data structure in there.

I only tried 48Hz for minimum VRR range and this worked fine, there were no
black screens anymore. I don't know what other values work with the EX3203R=
.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15604498513.F846E.1486--

--===============0036247884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0036247884==--
