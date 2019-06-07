Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC3B3957B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 21:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BE589E98;
	Fri,  7 Jun 2019 19:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9B5F889E8C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 19:23:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 92A4872167; Fri,  7 Jun 2019 19:23:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110781] Radeon: heavy r300 performance drop regression between
 11.x and 19.x
Date: Fri, 07 Jun 2019 19:23:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: u9vata@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110781-502-Lz9b7zBcVZ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110781-502@http.bugs.freedesktop.org/>
References: <bug-110781-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1470142277=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1470142277==
Content-Type: multipart/alternative; boundary="15599354150.1cDF.13839"
Content-Transfer-Encoding: 7bit


--15599354150.1cDF.13839
Date: Fri, 7 Jun 2019 19:23:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110781

--- Comment #57 from Richard Thier <u9vata@gmail.com> ---
Hello everyone!

I have found one more place where we can end up calling extra ioctls for
GEM_CREATE. I remember telling you above after the very first proposed patc=
h of
Marek, that "Interesting to me is that the CREATE call number is still high=
er
in strace output than how it was originally before the first slowdown"

I went on to find the cause because I was using his patch when bisecting the
minor issue and this makes it really hard to spot the minor issue I mentined
earlier.

So I decided to find out what causes the 600-700 CREATE calls despite the
performance seems fast.

This is what I did:

    /* Shared resources don't use cached heaps. */
    if (use_reusable_pool) {
        int heap =3D radeon_get_heap_index(domain, flags);
        assert(heap >=3D 0 && heap < RADEON_MAX_CACHED_HEAPS);
        usage =3D 1 << heap; /* Only set one usage bit for each heap. */

        pb_cache_bucket =3D radeon_get_pb_cache_bucket_index(heap);
        assert(pb_cache_bucket < ARRAY_SIZE(ws->bo_cache.buckets));

        bo =3D radeon_bo(pb_cache_reclaim_buffer(&ws->bo_cache, size, align=
ment,
                                               usage, pb_cache_bucket));
        if (bo)=20
            return &bo->base;
    } else {
        // first only logs where here
        fprintf(stderr, "1 KULAKVA!!!\n");
        fprintf(stderr, "2 KULAKVA!!!\n");
        fprintf(stderr, "3 KULAKVA!!!\n");
        // this segfault got added later
        uint kula =3D 0;=20
        int *kulakva =3D (int*)kula;
        *kulakva=3D42;
    }=20=20=20=20

I saw that still I can get to the code path where "KULAKVA" gets printed, w=
hile
in the very original code of course this was never the case ever as the who=
le
if and the bool variable if using reusable pools or not was not existing ye=
t.

I am now recompiling with debug symbols so that running glxgears with gdb w=
ill
hopefully fail at the last line of the else clause and tell me a backtrace
where I am coming from ;-)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15599354150.1cDF.13839
Date: Fri, 7 Jun 2019 19:23:35 +0000
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
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781#c57">Comme=
nt # 57</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781">bug 11078=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
u9vata&#64;gmail.com" title=3D"Richard Thier &lt;u9vata&#64;gmail.com&gt;">=
 <span class=3D"fn">Richard Thier</span></a>
</span></b>
        <pre>Hello everyone!

I have found one more place where we can end up calling extra ioctls for
GEM_CREATE. I remember telling you above after the very first proposed patc=
h of
Marek, that &quot;Interesting to me is that the CREATE call number is still=
 higher
in strace output than how it was originally before the first slowdown&quot;

I went on to find the cause because I was using his patch when bisecting the
minor issue and this makes it really hard to spot the minor issue I mentined
earlier.

So I decided to find out what causes the 600-700 CREATE calls despite the
performance seems fast.

This is what I did:

    /* Shared resources don't use cached heaps. */
    if (use_reusable_pool) {
        int heap =3D radeon_get_heap_index(domain, flags);
        assert(heap &gt;=3D 0 &amp;&amp; heap &lt; RADEON_MAX_CACHED_HEAPS);
        usage =3D 1 &lt;&lt; heap; /* Only set one usage bit for each heap.=
 */

        pb_cache_bucket =3D radeon_get_pb_cache_bucket_index(heap);
        assert(pb_cache_bucket &lt; ARRAY_SIZE(ws-&gt;bo_cache.buckets));

        bo =3D radeon_bo(pb_cache_reclaim_buffer(&amp;ws-&gt;bo_cache, size=
, alignment,
                                               usage, pb_cache_bucket));
        if (bo)=20
            return &amp;bo-&gt;base;
    } else {
        // first only logs where here
        fprintf(stderr, &quot;1 KULAKVA!!!\n&quot;);
        fprintf(stderr, &quot;2 KULAKVA!!!\n&quot;);
        fprintf(stderr, &quot;3 KULAKVA!!!\n&quot;);
        // this segfault got added later
        uint kula =3D 0;=20
        int *kulakva =3D (int*)kula;
        *kulakva=3D42;
    }=20=20=20=20

I saw that still I can get to the code path where &quot;KULAKVA&quot; gets =
printed, while
in the very original code of course this was never the case ever as the who=
le
if and the bool variable if using reusable pools or not was not existing ye=
t.

I am now recompiling with debug symbols so that running glxgears with gdb w=
ill
hopefully fail at the last line of the else clause and tell me a backtrace
where I am coming from ;-)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15599354150.1cDF.13839--

--===============1470142277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1470142277==--
