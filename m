Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C00A0A401D
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2019 00:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0F96E0FF;
	Fri, 30 Aug 2019 22:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7A80A6E10D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 22:07:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 772DA72161; Fri, 30 Aug 2019 22:07:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Fri, 30 Aug 2019 22:07:20 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: saldorin@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-Fg5KG9nGm3@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0660657493=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0660657493==
Content-Type: multipart/alternative; boundary="15672028403.eb7bb69.307"
Content-Transfer-Encoding: 7bit


--15672028403.eb7bb69.307
Date: Fri, 30 Aug 2019 22:07:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #3 from Matthias M=C3=BCller <saldorin@web.de> ---
I don't know if i'm encountering the same bug, but it is at least similar.
I don't get hard freezes/lockups, but i get a strange "stutterting", as if =
the
whole OS halted for a few seconds, then continued for a few seconds...and t=
he
halted times grew while the "usable seconds" got shorter quickly to the poi=
nt
of unusability...

It doesn't happen regularly (seems like anything between 30min and 120min) =
and
i haven't yet made out a direct cause, but in journalctl, it seems the same
messages appear every time when it begins:

kernel: amdgpu: [powerplay] Failed to send message 0xf, response 0xfffffffb,
param 0xfd6000
kernel: amdgpu: [powerplay] Failed to send message 0xf, response 0xfffffffb,
param 0xfd6000
 kernel: amdgpu 0000:0f:00.0: [mmhub] VMC page fault (src_id:0 ring:169 vmi=
d:0
pasid:0)
 kernel: amdgpu 0000:0f:00.0:   at page 0x0000600000fd6000 from 18
 kernel: amdgpu 0000:0f:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00041152

after that there are a lot of these:

kernel: amdgpu: [powerplay] Failed to send message 0x40, response 0xffffffc2
param 0x2
kernel: amdgpu: [powerplay] Failed to send message 0xe, response 0xffffffc2,
param 0x80

until shutdown/hardreset.

Maybe some observation that might help to narrow it down:
The first time it occured, i had to do a few reboots that showed this behav=
iour
right after startup until it finally worked again - for about 45min.
As it didn't work again after around 10 reboots, i tried uninstalling corec=
trl
(that i used to have a custom fan-curve) - and it finally booted normal aga=
in!
I then installed radeon-profile to have fan-controll (i don't want to have =
the
fans stand still on desktop, as the card gets over 80=C2=B0 C hot before th=
e fans
kick in...).
The issue still occurs with radeon-profile, but at least every reboot is
running fine...
Other thing i noticed is that after the first "freeze" with radeon-profile
lm_sensors stopped reporting the fanspeed for the card, it always stays at
zero.

So maybe it is related to fan-control or the sysfs interface in general?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15672028403.eb7bb69.307
Date: Fri, 30 Aug 2019 22:07:20 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
saldorin&#64;web.de" title=3D"Matthias M=C3=BCller &lt;saldorin&#64;web.de&=
gt;"> <span class=3D"fn">Matthias M=C3=BCller</span></a>
</span></b>
        <pre>I don't know if i'm encountering the same bug, but it is at le=
ast similar.
I don't get hard freezes/lockups, but i get a strange &quot;stutterting&quo=
t;, as if the
whole OS halted for a few seconds, then continued for a few seconds...and t=
he
halted times grew while the &quot;usable seconds&quot; got shorter quickly =
to the point
of unusability...

It doesn't happen regularly (seems like anything between 30min and 120min) =
and
i haven't yet made out a direct cause, but in journalctl, it seems the same
messages appear every time when it begins:

kernel: amdgpu: [powerplay] Failed to send message 0xf, response 0xfffffffb,
param 0xfd6000
kernel: amdgpu: [powerplay] Failed to send message 0xf, response 0xfffffffb,
param 0xfd6000
 kernel: amdgpu 0000:0f:00.0: [mmhub] VMC page fault (src_id:0 ring:169 vmi=
d:0
pasid:0)
 kernel: amdgpu 0000:0f:00.0:   at page 0x0000600000fd6000 from 18
 kernel: amdgpu 0000:0f:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00041152

after that there are a lot of these:

kernel: amdgpu: [powerplay] Failed to send message 0x40, response 0xffffffc2
param 0x2
kernel: amdgpu: [powerplay] Failed to send message 0xe, response 0xffffffc2,
param 0x80

until shutdown/hardreset.

Maybe some observation that might help to narrow it down:
The first time it occured, i had to do a few reboots that showed this behav=
iour
right after startup until it finally worked again - for about 45min.
As it didn't work again after around 10 reboots, i tried uninstalling corec=
trl
(that i used to have a custom fan-curve) - and it finally booted normal aga=
in!
I then installed radeon-profile to have fan-controll (i don't want to have =
the
fans stand still on desktop, as the card gets over 80=C2=B0 C hot before th=
e fans
kick in...).
The issue still occurs with radeon-profile, but at least every reboot is
running fine...
Other thing i noticed is that after the first &quot;freeze&quot; with radeo=
n-profile
lm_sensors stopped reporting the fanspeed for the card, it always stays at
zero.

So maybe it is related to fan-control or the sysfs interface in general?</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15672028403.eb7bb69.307--

--===============0660657493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0660657493==--
