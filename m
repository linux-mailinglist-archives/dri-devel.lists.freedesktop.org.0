Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C0270ED09
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 07:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6777610E038;
	Wed, 24 May 2023 05:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CBD10E038
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 05:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ZgvfolGox3uzjBIvn/zvlH6IbQJKAlBVVhbBRQoBAFc=; b=p8otjwLeYkd+K+o+o8Q27CmKGp
 z9rYA2K0u4yWt9KybnLrn+phprc+yCHtXydznHJpjtOZt16iv6H1WY2DA+mk9JR4PiSX4ME85chJ7
 7vYJDTctL5volJOigSCeHUq+bKTuuWYYNAWlGzcLKy07dhU7JKPU73jd9clQS0IRSRB/oDRlIW+IB
 3aP7jO48NmARb0ls0utJqr/nMIzLZr/pkd5J0wOBF4gW4Wv5I8L4PIVmDgZ6lsbc6UVbX7PE2vAxQ
 6DvHP8Acwd5oARsqbdGRhQSqvDcvPwGne0PXxSh6AMHWLUwjlhcTAU/tOV4wXm6qzvWQvQfoOxQeB
 9GH0Uj6w==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
 Hat Linux)) id 1q1h12-00COyT-2I; Wed, 24 May 2023 05:26:28 +0000
Date: Tue, 23 May 2023 22:26:28 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] modules/firmware: add a new option to denote a firmware
 group to choose one.
Message-ID: <ZG2gBJbwX73owRYu@bombadil.infradead.org>
References: <20230419043652.1773413-1-airlied@gmail.com>
 <ck2dzxvllhhh74oa3vjlacutc7rdmgl7cfrfq7vgx4w3jcufrz@7jbgxcat42yn>
 <CAPM=9tw0Y2A4DvuTHT_yd58Eit+tUmo63pbEOHwRJ66LeqznEQ@mail.gmail.com>
 <fsleccud43leoioli6bj4xoydwbdcjb5qr4denuf6morhgtqki@t6xya2mygon5>
 <ZEcJNcz+ArLfUSJ1@bombadil.infradead.org>
 <n6gwizwt26ucpuva2kt35rprth6iqeibi3inq2qrn5qhs3aa3b@4hjbhgnskutq>
 <CAPM=9txLf2NbuZSM5CLYT4wA5mbQ=+ssm9tdzh6JJ=gtEBeqAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9txLf2NbuZSM5CLYT4wA5mbQ=+ssm9tdzh6JJ=gtEBeqAA@mail.gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-modules@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 03, 2023 at 01:19:31PM +1000, Dave Airlie wrote:
> >
> > >
> > >> > the GROUP until after the FIRMWARE, so this can't work, as it already
> > >> > will have included all the ones below, hence why I bracketed top and
> > >> > bottom with a group.
> > >>
> > >> well... that is something that can be adapted easily by using a 2 pass
> > >> approach, filtering out the list based on the groups.
> > >>
> > >> I agree that yours is simpler though.  If we can rely on the
> > >> order produced by the compiler and we document the expectations of
> > >> MODULE_FIRMWARE_GROUP_ONLY_ONE, then I believe we can stay with the
> > >> simpler approach.
> > >>
> > >> Luis, any thoughts here?
> > >
> > >I see the Dracut code indicates that the order says now that you should
> > >put the preferred firmware last, and that seems to match most coding
> > >conventions, ie, new firmwares likely get added last, so it's a nice
> >
> > not all. i915 for example keeps it newest first so when attempting
> > multiple firmware versions it starts from the preferred version.  It
> > will be harder to convert since it also uses a x-macro to make sure the
> > MODULE_FIRMWARE() and the the platform mapping are actually using the same
> > firmware.
> >
> > >coincidence. Will this always work? I don't know. But if you like to
> >
> > short answer: it depends if your compiler is gcc *and* -O2 is used
> > Longer debug ahead. Simple test with the expansion of MODULE_FIRMWARE
> > baked in:
> >
> >         $ cat /tmp/a.c
> >         static const __attribute__((section("__modinfo_manual"), used, aligned(1))) char foo[] = "modinfo_manual_foo";
> >         static const __attribute__((section("__modinfo_manual"), used, aligned(1))) char bar[] = "modinfo_manual_bar";
> >         $ gcc -c -o /tmp/a.o /tmp/a.c
> >         $ objcopy -O binary --only-section=__modinfo_manual /tmp/a.o /tmp/modinfo_manual
> >         $ strings /tmp/modinfo_manual
> >         modinfo_manual_foo
> >         modinfo_manual_bar
> >
> > However that doesn't match when building modules. In kmod:
> >
> > diff --git a/testsuite/module-playground/mod-simple.c b/testsuite/module-playground/mod-simple.c
> > index 503e4d8..6dd5771 100644
> > --- a/testsuite/module-playground/mod-simple.c
> > +++ b/testsuite/module-playground/mod-simple.c
> > @@ -30,3 +30,9 @@ module_exit(test_module_exit);
> >
> >   MODULE_AUTHOR("Lucas De Marchi <lucas.demarchi@intel.com>");
> >   MODULE_LICENSE("GPL");
> > +
> > +
> > +static const char __UNIQUE_ID_firmware404[] __attribute__((__used__)) __attribute__((__section__("__modinfo_cpp"))) __attribute__((__aligned__(1))) = "modinfo_cpp_foo";
> > +static const char __UNIQUE_ID_firmware405[] __attribute__((__used__)) __attribute__((__section__("__modinfo_cpp"))) __attribute__((__aligned__(1))) = "modinfo_cpp_bar";
> >
> >         $ make ....
> >         $ objcopy -O binary --only-section=__modinfo_cpp testsuite/module-playground/mod-simple.ko /tmp/modinfo_cpp
> >         $ strings /tmp/modinfo_cpp
> >         modinfo_cpp_bar
> >         modinfo_cpp_foo
> >
> > It doesn't seem to be ./scripts/Makefile.modfinal neither as it's also
> > inverted in testsuite/module-playground/mod-simple.o
> >
> > After checking the options passed to gcc, here is the "culprit": -O2
> >
> >         $ gcc -c -o /tmp/a.o /tmp/a.c && objcopy -O binary --only-section=__modinfo_manual /tmp/a.o /tmp/modinfo_manual && strings /tmp/modinfo_manual
> >         modinfo_manual_foo
> >         modinfo_manual_bar
> >         $ gcc -O2 -c -o /tmp/a.o /tmp/a.c && objcopy -O binary --only-section=__modinfo_manual /tmp/a.o /tmp/modinfo_manual && strings /tmp/modinfo_manual
> >         modinfo_manual_bar
> >         modinfo_manual_foo
> >
> > It seems anything but -O0 inverts the section.
> >
> >         $ gcc --version
> >         gcc (GCC) 12.2.1 20230201
> >
> > It doesn't match the behavior described in its man page though. Manually
> > specifying all the options that -O1 turns on doesn't invert it.
> >
> >         $ gcc -fauto-inc-dec -fbranch-count-reg -fcombine-stack-adjustments \
> >                 -fcompare-elim -fcprop-registers -fdce -fdefer-pop -fdelayed-branch
> >                 -fdse -fforward-propagate -fguess-branch-probability -fif-conversion \
> >                 -fif-conversion2 -finline-functions-called-once -fipa-modref \
> >                 -fipa-profile -fipa-pure-const -fipa-reference -fipa-reference-addressable \
> >                 -fmerge-constants -fmove-loop-stores -fomit-frame-pointer -freorder-blocks \
> >                 -fshrink-wrap -fshrink-wrap-separate -fsplit-wide-types -fssa-backprop \
> >                 -fssa-phiopt -ftree-bit-ccp -ftree-ccp -ftree-ch -ftree-coalesce-vars \
> >                 -ftree-copy-prop -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop \
> >                 -ftree-fre -ftree-phiprop -ftree-pta -ftree-scev-cprop -ftree-sink -ftree-slsr \
> >                 -ftree-sra -ftree-ter -funit-at-a-time -c -o /tmp/a.o /tmp/a.c \
> >                 && objcopy -O binary --only-section=__modinfo_manual /tmp/a.o /tmp/modinfo_manual && strings /tmp/modinfo_manual
> >         cc1: warning: this target machine does not have delayed branches
> >         modinfo_manual_foo
> >         modinfo_manual_bar
> >
> 
> Thanks Lucas,
> 
> -ftoplevel-reorder is the one that does it, now that does mean how
> I've done it isn't going to be robust.
> 
> I will reconsider but in order to keep backwards compat, it might be
> easier to add firmware groups as an explicit list, but also spit out
> the individual names, but not sure how clean this will end up on
> dracut side.
> 
> I'll take a look at the other options, but it does seem like reworking
> dracut is going to be the harder end of this, esp if I still want to
> keep compat with older ones.

Hey Dave, just curious if there was going to be another follow up patch
for this or if it was already posted. I don't see it clearly so just
wanted to double check.

  Luis
