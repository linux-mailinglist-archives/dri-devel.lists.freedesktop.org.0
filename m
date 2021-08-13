Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1133EBCE7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 21:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB886E8B8;
	Fri, 13 Aug 2021 19:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801026E8B8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 19:59:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4B02D610FF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 19:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628884747;
 bh=BaUfNov3cPLfXZhzfo5k1vky6OJRns27qhpTV61B/fU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AP6RUKWdkPcRrMGL64MOnYM/obryzAhsH4sR6OxzMXPxLLmIXpDTTrR5X3VJy6sPu
 cxqomzuoVsjewTc7ffb+x4tha5U2VsojzZsCDUZsFnlMEw23I+Mqai23GEji5oSWdc
 rmzFjBJzpmg1fcHrS4iu6ujzwcz5DCYheqADnzqTdpeUFQutuvTdOXSksZB2FqqB59
 R6F93lbxbLyRy0oO6dV/uWxC98Hmyt151bKZUYo3cO13tnn5ZVe7eJbqTMwXD1JEWW
 vIkw6VfmbM/lz+VIoUOljsfiwur7tNdEgFSfJbVqa9mHEhXAx7RWZGNu/awoIwvdPy
 m7uEvs6FFsKgg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4801060EFE; Fri, 13 Aug 2021 19:59:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214001] [bisected][regression] After commit "drm/ttm:
 Initialize debugfs from ttm_global_init()" kernels without debugfs explicitly
 set to 'allow all' fail to boot
Date: Fri, 13 Aug 2021 19:59:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(Other)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 1i5t5.duncan@cox.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214001-2300-VLh5wrT5px@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214001-2300@https.bugzilla.kernel.org/>
References: <bug-214001-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D214001

--- Comment #4 from Duncan (1i5t5.duncan@cox.net) ---
(In reply to Linux_Chemist from comment #3)
> Thanks for your comment, Duncan!
> Yes, I'm on a customised kernel that has a lot removed (including debugfs=
 as
> you can tell) and also amdgpu (RX 5700).

So amdgpu too, but a lot newer than my rx460.

> There's usually a bug in a testing RC every few releases, I just report t=
hem
> here after bisecting; seems the right place for it even if it's not lol=
=20=20

That's what I had done previously.  But it looks like the kernel bugzilla f=
olks
updated the kernel-specific instructions recently, and I decided to try to
follow them.  Not that it seems to have done a lot of good.  At least in
bugzilla it's easier for other users (not on whatever list) to see it, which
makes a difference if it's something that can't be fixed immediately, due
either to no response (as here) or to complications like bisect difficulty =
or
inability to directly revert due to commit dependencies, both of which
complicated the last amdgpu bug I filed (against 5.7, bug #207383).

> (https://www.phoronix.com/scan.php?page=3Dnews_item&px=3DLinux-Always-Res=
erve-
> 1MB)

I remember reading about that and agreeing with the 1MiB reserved idea in
general, tho the bug triggering the proposal didn't directly affect me.

>=20
> (I wasn't sure to file this one under an AMD ("non-intel") specific 'vide=
o'
> bug but the commit was for 'drivers/gpu/drm/ttm' which I assume is agnost=
ic.
> I don't know what it's for or whether only amdgpu/radeon makes use of it =
to
> say but it is interesting that the 3 of us have similar hardware.)

All three of us users seemed to consider it generic drm, as I know ttm in
general is, but you're correct, the fact that we're all on some form of rad=
eon
looks like it could be more than coincidence.  The on-list reporter and I, =
was
interesting, but now it's three, and getting more than interesting.=20=20

FWIW the #207383 bug I mentioned bisected to a commit in Andrew Morton's mm
tree, but only affected amdgpu (and radeon? IDR) because of something only
amdgpu was doing.  I filed that against amdgpu but only because I hadn't
bisected yet when I first filed it, and had no clue it was going to bisect =
to
an mm tree commit.  And *OH* *MAN* was that thing hard to bisect, in part
because I could count on my bisect-bad results but could never be entirely =
sure
about bisect-good.  By the time I finally finished the bisect, a number of
others were CCed as they were seeing the bug too, some reproducing a lot mo=
re
reliably than I was, but no one was really helping with the bisecting!  OTO=
H,
all the others /were/ an encouragement to keep going, a good thing really,
because as hard as that thing was to bisect, if it hadn't been for them I'd
have been *seriously* tempted to simply buy a new graphics card and be done
with it!  I seriously hope I never have any any bugs so difficult to bisect
ever again!

> I can confirm all my .configs have had CONFIG_VGA_CONSOLE=3Dy in it

Hmm.  I really suspected that was the problem.  I guess not.  And amdgpu as
well.

New theory would be that the behavior's different on your much newer hardwa=
re.=20
Not that it's likely to help with the bug but I'd be interested in whether =
it
works with /only/ vgacon, no drm configured at all.  Of course that'd be a
CLI-only test, booting to text login, but if you've never tried it on that
hardware it might be useful to know if vgacon works at all for you.

(Similarly here, the last time I had really tested vgacon was before the sw=
itch
from ums to kms.  I knew it was /supposed/ to be a fallback, but for the la=
st
year or so the question had been nagging at me as to whether the fallback w=
ould
actually work if the graphics card failed and I had to switch, since I'm do=
ing
a monolithic kernel with only the specific firmware for this card builtin, =
so
if the vgacon fallback didn't work I'd be in trouble as in that case I coul=
dn't
get a text login to configure the new drivers and firmware and rebuild.  So
this failure was actually a relief for me, as it demonstrated that the fall=
back
/does/ still work, should I ever need it.)

> But anyways as you say, the ability to create a bootable kernel only beco=
mes
> an issue from the commit in question when not having CONFIG_DEBUG_FS=3Dy =
(and
> CONFIG_DEBUG_FS_ALLOW_ALL=3Dy along with that)

I think you said that.  I was at least getting the fallback, and I guess li=
ke
you before this bug, I didn't even have a clue that the three secondary cho=
ices
once CONFIG_DEBUG_FS was enabled were there. Reading it here was new to me!=
=20
=3D:^)

> Don't get me wrong, it's not a showstopper 'massive bug' because you can
> always put debugfs + 'allow all' into your kernel, I did so and am happily
> on rc5 now

I, and I think the guy who reported it to the list, reverted the commit in
question, instead.  Here, I do that by doing a git show --reverse redirecte=
d to
a patch-file, then drop that patch-file in a particular directory where it =
gets
auto-applied to further kernel updates by my kernel management scripts.  (F=
WIW
being on gentoo, auto-applying patches to package updates works similarly, =
and
I just used the same idea for my kernel scripts.)

If the bug goes long-term and the patch ultimately quits applying due to
further updates, /that's/ when I'll switch to the debugfs option.  But while
I'm beginning to suspect they may not get it fixed for 5.14 release, I susp=
ect
if it hits release and then stable they'll have enough bug reports to raise=
 the
profile, and we'll have a fix for 5.15.

> but that's why I'd like a consensus to be known or shared (i.e.
> change the wording for the kconfig options) about whether a lot of things
> are expecting debugfs to be there in some form now - is it now an
> 'essential' part of the kernel? Or should things that rely on it fail
> gracefully if they don't find it?

I believe debugfs is still clearly, at least modulo bugs, optional, and we'=
ll
eventually have a fix for this bug.  Even were someone to argue that had
changed, I expect such an argument would generate a big enough discussion t=
hat
it'd hit the usual Linux news sites, LWN, phoronix, lxer, etc.  Since kconf=
ig
still says "N" if not sure and I've seen no such discussion, that would app=
ear
not to have happened yet, and even if it were to happen, I'd expect the new
policy to apply to some later kernel, meaning they'd still need a fix for t=
he
current bug.

> It is a bit silly that even CONFIG_DEBUG_FS_ALLOW_NONE wouldn't work for
> this bug because that seems like it should be providing that 'fail
> gracefully' mechanism to debugfs being 'there' but 'don't bother with it'.

To me, that's the more demonstration that it's truly a bug, for all the rea=
sons
you say.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
