Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 818E2AE8A9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 12:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306F86E8BD;
	Tue, 10 Sep 2019 10:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 74D536E8BA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 10:52:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 71D9F72167; Tue, 10 Sep 2019 10:52:02 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111630] Generate a list of tags for the machine that runs the
 testsuite
Date: Tue, 10 Sep 2019 10:52:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: arkadiusz.hiler@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-111630-502-nLg60p5CIu@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111630-502@http.bugs.freedesktop.org/>
References: <bug-111630-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0201935989=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0201935989==
Content-Type: multipart/alternative; boundary="15681127220.379Ea5.21964"
Content-Transfer-Encoding: 7bit


--15681127220.379Ea5.21964
Date: Tue, 10 Sep 2019 10:52:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111630

Arek Hiler <arkadiusz.hiler@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |petri.latvala@intel.com

--- Comment #1 from Arek Hiler <arkadiusz.hiler@intel.com> ---
Martin first suggested to have something like
igt_require_feature(TWO_DISPLAYS), with a set of different defines/function
pointers, or whatever - so we have a single way of checking for a number of
connected displays and it's simple to tie it with a cibuglog tag.

I find that hard both hard to use (using names instead of numbers, changing
almost all of test to use this new framework) and implement (centralizing a=
 lot
of knowledge, how to do the display checks without passing igt_display, fd,
etc). But it would be easy to assure consistency in the skip messages.

What I would to propose instead is a special igt test that would do the
discovery:

/* has to be before KMS/DISPALY checks to enable all outputs */
igt_subtest("CHAMELIUM") {
        chamelium =3D chamelium_init(fd);
        igt_require(chamelium);
        /* deinit && plug all */
}

igt_subtest_group {
        volatile igt_display display;

        igt_fixture {
                igt_require_display(&display, fd);
        }

        igt_subtest("DISPLAY")
        { /* intentionaly left blank */ }

        igt_subtest("TWO_OUTPUTS") {
                igt_require_n_outputs(&display, 2);
        }

        igt_feature("THREE_OUTPUTS") {
                igt_require_n_outputs(&display, 3);
        }
}


Then you can run it like that: `igt_runner -m -t feature_detection ...` whi=
ch
would get you a nice parsable, piglit-style json as well as sample skip
messages.

It will still need a lot of test changes to assure consistency, but arguably
fewer than the igt_require_feature(XYZ). Since it's also a piglit-format js=
on
we can ingest it easily and check for flip-floppers on those tags :-)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15681127220.379Ea5.21964
Date: Tue, 10 Sep 2019 10:52:02 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:arkadiusz=
.hiler&#64;intel.com" title=3D"Arek Hiler &lt;arkadiusz.hiler&#64;intel.com=
&gt;"> <span class=3D"fn">Arek Hiler</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Generate a list of tags for the machine that runs the tes=
tsuite"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111630">bug 11163=
0</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>petri.latvala&#64;intel.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Generate a list of tags for the machine that runs the tes=
tsuite"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111630#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Generate a list of tags for the machine that runs the tes=
tsuite"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111630">bug 11163=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
arkadiusz.hiler&#64;intel.com" title=3D"Arek Hiler &lt;arkadiusz.hiler&#64;=
intel.com&gt;"> <span class=3D"fn">Arek Hiler</span></a>
</span></b>
        <pre>Martin first suggested to have something like
igt_require_feature(TWO_DISPLAYS), with a set of different defines/function
pointers, or whatever - so we have a single way of checking for a number of
connected displays and it's simple to tie it with a cibuglog tag.

I find that hard both hard to use (using names instead of numbers, changing
almost all of test to use this new framework) and implement (centralizing a=
 lot
of knowledge, how to do the display checks without passing igt_display, fd,
etc). But it would be easy to assure consistency in the skip messages.

What I would to propose instead is a special igt test that would do the
discovery:

/* has to be before KMS/DISPALY checks to enable all outputs */
igt_subtest(&quot;CHAMELIUM&quot;) {
        chamelium =3D chamelium_init(fd);
        igt_require(chamelium);
        /* deinit &amp;&amp; plug all */
}

igt_subtest_group {
        volatile igt_display display;

        igt_fixture {
                igt_require_display(&amp;display, fd);
        }

        igt_subtest(&quot;DISPLAY&quot;)
        { /* intentionaly left blank */ }

        igt_subtest(&quot;TWO_OUTPUTS&quot;) {
                igt_require_n_outputs(&amp;display, 2);
        }

        igt_feature(&quot;THREE_OUTPUTS&quot;) {
                igt_require_n_outputs(&amp;display, 3);
        }
}


Then you can run it like that: `igt_runner -m -t feature_detection ...` whi=
ch
would get you a nice parsable, piglit-style json as well as sample skip
messages.

It will still need a lot of test changes to assure consistency, but arguably
fewer than the igt_require_feature(XYZ). Since it's also a piglit-format js=
on
we can ingest it easily and check for flip-floppers on those tags :-)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15681127220.379Ea5.21964--

--===============0201935989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0201935989==--
