Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 328883D4E2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 20:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DE4891D9;
	Tue, 11 Jun 2019 18:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7F332891D9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 18:03:29 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 764F572167; Tue, 11 Jun 2019 18:03:29 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Tue, 11 Jun 2019 18:03:29 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-110897-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0569463646=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0569463646==
Content-Type: multipart/alternative; boundary="15602762090.9cA1DeEcc.11610"
Content-Transfer-Encoding: 7bit


--15602762090.9cA1DeEcc.11610
Date: Tue, 11 Jun 2019 18:03:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

            Bug ID: 110897
           Summary: HyperZ is broken for r300 (bad z for some micro and
                    macrotiles?)
           Product: Mesa
           Version: git
          Hardware: Other
                OS: other
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/r300
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: u9vata@gmail.com
        QA Contact: dri-devel@lists.freedesktop.org

Created attachment 144505
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144505&action=3Dedit
first screenshot (still not completely ruined zbuffer)

Hello everyone!

I went on and tried RADEON_HYPERZ=3D1 with my r300 card and I see bad glitc=
hes -
while in the same time elevated performance. See attached screenshot(s).

This affect every application, even the simplest ones like glxgears.

The top of the screen is rendering properly always, but around the 25% of t=
he
screen it starts to break down and I can see tiles where things seem to hav=
e a
really bad z-value.

What is also interesting is that [b]I feel the z-clear is the operation tha=
t is
happening wrong[/b]! I am pretty sure in this because at the first few fram=
es
of glxgears I can nearly see all the gears and as the gears turn, I see less
and less of them - it kind of feels that whenever some pixel got rendered, =
its
place cannot be used anymore - or likely cannot be used! If I turn the whee=
ls
some times around the Y axis the bottom 2/3 of the screen just becomes
completely dark after a while.

If I exit glxgears - or any app in question of testing -  and restart it fr=
om
the terminal however, I see that everything is immediately wrong! So [b]the
problem persists between multiple runs of the same program with same sized
window[/b] and this also hints that the z buffer is never properly (or at a=
ll)
cleared!

BUT [b]resizing the window immediately fixes the current frame[/b] with
seemingly proper Z-values and if I keep resizing I can see a constant
flickering - but a much more clear image. I think the resize operation trig=
gers
some resize in the buffers that cleans them properly, but in the very first
second it already gets wrong again pretty much and this is what is happenin=
g.

Also while resizing the window I saw that [b]there is no straight horizontal
cut above which things are good and below which things are bad, but I liter=
ally
see only the number of (macro?)tiles count from the top-left corner![/b] So
basically I can see the side of one of the macrotiles. I tried to picture t=
his
with a screenshot, but it is not that easy to resize that way. See the seco=
nd
sceenshot that does not have anything on the bottom, but you see the cut and
the  left side of the tile where first things got wrong.

Also the order of how the tiles go wrong is not always linear, but the first
ones always work - from top-left going just like pixels.

I am trying to use documentation that I have found here:
http://renderingpipeline.com/graphics-literature/low-level-gpu-documentatio=
n/

Of course the r300 register docs should be good I hope, but I started readi=
ng
through the r500_acceleration docs as it seems many-many of it applies to a=
ll
r300 cards. Am I right that these are the best sources so far?

To be honest I think the fast z-clear maybe is the problem and is badly
configured to only clear the top few tiles on the screen or something simil=
ar.
The tiles are approximately 32x32 or 16x16, but surely not just 1-2 pixels =
as
they are pretty much visible to the naked eye (see second attachment
screenshot).

I have just barely started my analysis, so I still have a lot of directions=
 to
take and the docs (if they are good) are really helpful at least! I did not
know about them so far!!!

Currently playing around the code to see if I can help the problem disappea=
r.

This is likely never worked. I do not know of any version where this worked=
 on
my machine, but I cannot completely rule it out of course.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15602762090.9cA1DeEcc.11610
Date: Tue, 11 Jun 2019 18:03:29 +0000
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
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897">110897</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>HyperZ is broken for r300 (bad z for some micro and macrotile=
s?)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>other
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
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/Gallium/r300
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>u9vata&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144505=
" name=3D"attach_144505" title=3D"first screenshot (still not completely ru=
ined zbuffer)">attachment 144505</a> <a href=3D"attachment.cgi?id=3D144505&=
amp;action=3Dedit" title=3D"first screenshot (still not completely ruined z=
buffer)">[details]</a></span>
first screenshot (still not completely ruined zbuffer)

Hello everyone!

I went on and tried RADEON_HYPERZ=3D1 with my r300 card and I see bad glitc=
hes -
while in the same time elevated performance. See attached screenshot(s).

This affect every application, even the simplest ones like glxgears.

The top of the screen is rendering properly always, but around the 25% of t=
he
screen it starts to break down and I can see tiles where things seem to hav=
e a
really bad z-value.

What is also interesting is that [b]I feel the z-clear is the operation tha=
t is
happening wrong[/b]! I am pretty sure in this because at the first few fram=
es
of glxgears I can nearly see all the gears and as the gears turn, I see less
and less of them - it kind of feels that whenever some pixel got rendered, =
its
place cannot be used anymore - or likely cannot be used! If I turn the whee=
ls
some times around the Y axis the bottom 2/3 of the screen just becomes
completely dark after a while.

If I exit glxgears - or any app in question of testing -  and restart it fr=
om
the terminal however, I see that everything is immediately wrong! So [b]the
problem persists between multiple runs of the same program with same sized
window[/b] and this also hints that the z buffer is never properly (or at a=
ll)
cleared!

BUT [b]resizing the window immediately fixes the current frame[/b] with
seemingly proper Z-values and if I keep resizing I can see a constant
flickering - but a much more clear image. I think the resize operation trig=
gers
some resize in the buffers that cleans them properly, but in the very first
second it already gets wrong again pretty much and this is what is happenin=
g.

Also while resizing the window I saw that [b]there is no straight horizontal
cut above which things are good and below which things are bad, but I liter=
ally
see only the number of (macro?)tiles count from the top-left corner![/b] So
basically I can see the side of one of the macrotiles. I tried to picture t=
his
with a screenshot, but it is not that easy to resize that way. See the seco=
nd
sceenshot that does not have anything on the bottom, but you see the cut and
the  left side of the tile where first things got wrong.

Also the order of how the tiles go wrong is not always linear, but the first
ones always work - from top-left going just like pixels.

I am trying to use documentation that I have found here:
<a href=3D"http://renderingpipeline.com/graphics-literature/low-level-gpu-d=
ocumentation/">http://renderingpipeline.com/graphics-literature/low-level-g=
pu-documentation/</a>

Of course the r300 register docs should be good I hope, but I started readi=
ng
through the r500_acceleration docs as it seems many-many of it applies to a=
ll
r300 cards. Am I right that these are the best sources so far?

To be honest I think the fast z-clear maybe is the problem and is badly
configured to only clear the top few tiles on the screen or something simil=
ar.
The tiles are approximately 32x32 or 16x16, but surely not just 1-2 pixels =
as
they are pretty much visible to the naked eye (see second attachment
screenshot).

I have just barely started my analysis, so I still have a lot of directions=
 to
take and the docs (if they are good) are really helpful at least! I did not
know about them so far!!!

Currently playing around the code to see if I can help the problem disappea=
r.

This is likely never worked. I do not know of any version where this worked=
 on
my machine, but I cannot completely rule it out of course.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15602762090.9cA1DeEcc.11610--

--===============0569463646==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0569463646==--
