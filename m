Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63810543829
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 17:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023BF10EFA7;
	Wed,  8 Jun 2022 15:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C6B10F22D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 15:56:51 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id s1so5842862wra.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 08:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=hvjv3fnVF8/pJboCz6mWgtVEtXjO0iOOfBgaF/yNVMo=;
 b=ahT9YKwEeR+XSeONSXQTycUR9Rwmkdy7lCR5zYJRh4X5bG9rUUhmTMOSm37a1x2dQg
 sMSmyJrsx3DNYa++Z88Bhsarj8eGiDNj6lZ14rsnqIbYC6BOHbBt5Y+tBBLl0+ML7RHn
 Ih5H8wQKW1wJh2UK/djICTHx/r/bY8cS7pAc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=hvjv3fnVF8/pJboCz6mWgtVEtXjO0iOOfBgaF/yNVMo=;
 b=54dJ9DJdzleMwEwG0tcdqSACtR5muC8GT48ylqChNcCyRZksKo0FBmzyAmnWRcBquT
 O2F8oTQ08Op072K/uGR9Jul4YGJN6MAbRE9dBNzHC+m+0yu7yM0tR0UHpU93jnm7X+sT
 bg501qWWet699Uq1yxCLopfh9P9iv08erkY1lPtsk4/Hp/3EHq2sfta1mBqFNj2epAbw
 JLXLUiY1PdUe2gip9E90j56oMBxuS3gtP69QoqzWbHps16c/S+FMdp+vBKbPccKp17vA
 N0PyHxaMBNcTduyBE5Z/ExaCWFViIt02dVCHgZKXYHe2y9ZvF5BkMHgsTkbsyY6Wayxn
 mv0A==
X-Gm-Message-State: AOAM531UoZN0UYE2dZwH6JKY03v/JPnL2FZO0x15AxCvU8jbGm8ObqTt
 kl5CVSbrsfNTy5Ev0nvzD8dBZQ==
X-Google-Smtp-Source: ABdhPJwAMheQ1yFKSE/vSoH57NTuCuUEEt5+IEndiXLbnF/iIe54uouTXcKfsDHA5SD7lcSxX7tXDQ==
X-Received: by 2002:a5d:594f:0:b0:213:d715:cec7 with SMTP id
 e15-20020a5d594f000000b00213d715cec7mr28858360wri.44.1654703809923; 
 Wed, 08 Jun 2022 08:56:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a05600c4f5300b003942a244f2esm30998208wmq.7.2022.06.08.08.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 08:56:47 -0700 (PDT)
Date: Wed, 8 Jun 2022 17:56:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: jim.cromie@gmail.com
Subject: Re: [RFC PATCH v2 00/27] DRM.debug on DYNAMIC_DEBUG, add trace events
Message-ID: <YqDGvJtNjDFIViQu@phenom.ffwll.local>
Mail-Followup-To: jim.cromie@gmail.com, Jason Baron <jbaron@akamai.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Sean Paul <seanpaul@chromium.org>, robdclark@gmail.com,
 Steven Rostedt <rostedt@goodmis.org>,
 mathieu.desnoyers@efficios.com, quic_saipraka@quicinc.com,
 Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 quic_psodagud@quicinc.com, Marc Zyngier <maz@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-arm-msm@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 David Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
References: <20220516225640.3102269-1-jim.cromie@gmail.com>
 <Yo5FFMbNG1Viirj1@phenom.ffwll.local>
 <CAJfuBxzQPeYvpzd_=WkQasKJceHrUYK8umG6gWbTmoAUfApJ8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJfuBxzQPeYvpzd_=WkQasKJceHrUYK8umG6gWbTmoAUfApJ8w@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: quic_saipraka@quicinc.com, Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Ingo Molnar <mingo@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jason Baron <jbaron@akamai.com>, Sean Paul <seanpaul@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>, intel-gvt-dev@lists.freedesktop.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, quic_psodagud@quicinc.com,
 mathieu.desnoyers@efficios.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 06, 2022 at 08:59:36AM -0600, jim.cromie@gmail.com wrote:
> On Wed, May 25, 2022 at 9:02 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Mon, May 16, 2022 at 04:56:13PM -0600, Jim Cromie wrote:
> > > DRM.debug API is 23 macros, issuing 10 exclusive categories of debug
> > > messages.  By rough count, they are used 5140 times in the kernel.
> > > These all call drm_dbg or drm_devdbg, which call drm_debug_enabled(),
> > > which checks bits in global __drm_debug.  Some of these are page-flips
> > > and vblanks, and get called often.
> > >
> > > DYNAMIC_DEBUG (with CONFIG_JUMP_LABEL) is built to avoid this kind of
> > > work, with NOOPd jump/callsites.
> > >
> > > This patchset is RFC because:
> > > - it touches 2.5 subsystems: dyndbg, drm, tracefs (new events)
> > > - dyndbg class support is built for drm, needs it for validation
> > > - new api, used by drm
> > > - big memory impact, with 5100 new pr-debug callsites.
> > > - drm class bikeshedding opportunities
> > > - others, names etc.
> >
> > Thanks a lot for keeping on pushing this!
> 
> 
> > >
> > > DYNAMIC_DEBUG:
> > >
> 
> 
> 
> > > RFC:
> > >
> > > dynamic_debug_register_classes() cannot act early enough to be in
> > > effect at module-load.  So this will not work as you'd reasonably
> > > expect:
> > >
> > >   modprobe test_dynamic_debug dyndbg='+pfm; class FOO +pfmlt'
> > >
> > > The 1st query:+pfm will be enabled during load, but in the 2nd query,
> > > "class FOO" will be unknown at load time.  Early class enablement
> > > would be nice.  DYNAMIC_DEBUG_CLASSES is a static initializer, which
> > > is certainly early enough, but Im missing a trick, suggestions?
> >
> > So maybe I'm just totally overloading this work here so feel free to
> > ignore or postpone, but: Could we do the dynamic_debug_register_classes()
> > automatically at module load as a new special section? And then throw in a
> > bit of kbuild so that in a given subsystem every driver gets the same
> > class names by default and everything would just work, without having to
> > sprinkle calls to dynamic_debug_register_classes() all over the place?
> >
> 
> This is now done; Ive added __dyndbg_classes section.
> load_module() now grabs it from the .ko
> and ddebug_add_module() attaches it to the module's ddebug_table record.
> for builtins, dynamic_debug_init feeds the builtin class-maps to
> ddebug_add_module
> 
> bash-5.1# modprobe test_dynamic_debug dyndbg="class FOO +p"
> [   88.374722] dyndbg: class[0]: nm:test_dynamic_debug base:20 len:7 ty:1
> [   88.375158] dyndbg:  0: EMERG
> [   88.375345] dyndbg:  1: DANGER
> [   88.375540] dyndbg:  2: ERROR
> [   88.375726] dyndbg:  3: WARNING
> [   88.375930] dyndbg:  4: NOTICE
> [   88.376130] dyndbg:  5: INFO
> [   88.376310] dyndbg:  6: DEBUG
> [   88.376499] dyndbg: class[1]: nm:test_dynamic_debug base:12 len:3 ty:1
> [   88.376903] dyndbg:  0: ONE
> [   88.377079] dyndbg:  1: TWO
> [   88.377253] dyndbg:  2: THREE
> [   88.377441] dyndbg: class[2]: nm:test_dynamic_debug base:8 len:3 ty:0
> [   88.377837] dyndbg:  0: bing
> [   88.378022] dyndbg:  1: bong
> [   88.378203] dyndbg:  2: boom
> [   88.378387] dyndbg: class[3]: nm:test_dynamic_debug base:4 len:3 ty:0
> [   88.378800] dyndbg:  0: Foo
> [   88.378986] dyndbg:  1: Bar
> [   88.379167] dyndbg:  2: Buzz
> [   88.379348] dyndbg: class[4]: nm:test_dynamic_debug base:0 len:3 ty:0
> [   88.379757] dyndbg:  0: FOO
> [   88.379938] dyndbg:  1: BAR
> [   88.380136] dyndbg:  2: BUZZ
> [   88.380410] dyndbg: module:test_dynamic_debug attached 5 classes
> [   88.380881] dyndbg:  24 debug prints in module test_dynamic_debug
> [   88.381315] dyndbg: module: test_dynamic_debug dyndbg="class FOO +p"
> [   88.381714] dyndbg: query 0: "class FOO +p" mod:test_dynamic_debug
> [   88.382109] dyndbg: split into words: "class" "FOO" "+p"
> [   88.382445] dyndbg: op='+'
> [   88.382616] dyndbg: flags=0x1
> [   88.382802] dyndbg: *flagsp=0x1 *maskp=0xffffffff
> [   88.383101] dyndbg: parsed: func="" file="" module="test_dynamic_debug"
> format="" lineno=0-0 class=FOO
> [   88.383740] dyndbg: applied: func="" file="" module="test_dynamic_debug"
> format="" lineno=0-0 class=FOO
> [   88.384324] dyndbg: processed 1 queries, with 2 matches, 0 errs
> bash-5.1#
> 
> so its working at module-load time.

Awesome!

> > For the entire class approach, did you spot another subsystem that could
> > benefit from this and maybe make a more solid case that this is something
> > good?
> >
> 
> I had been working on the premise that ~4k drm*dbg callsites was a good
> case.

Oh I'm happy with just drm, but occasionally we've done stuff in drm that
the wider kernel community found a bit silly. So bit more acks/validation
from outside the dri-devel echo chamber would be great, whatever form it
is.

> verbosity-levels - with x<y logic instead of x==y is what's currently
> missing.
> 
> the next revision adds something, which "kinda works".
> But I think I'll rip it out, and do this simpler approach instead:
> 
> implement a verbose/levels  param & callback, which takes
> 
>    echo 3 > /sys/module/foo/parameters/debug_verbosity
> 
> and effectively does
> 
>   echo <<EOQRY  > /proc/dynamic_debug/control
> module foo class V1 +p
> module foo class V2 +p
> module foo class V3 +p
> module foo class V4 -p
> module foo class V5 -p
> module foo class V6 -p
> module foo class V7 -p
> module foo class V8 -p
> EOQRY
> 
> since only real +/-p changes incur kernel-patching costs,
> the remaining overheads are minimal.
> 
> 
> > RFC for DRM:
> >
> > - decoration flags "fmlt" do not work on drm_*dbg().
> >   (drm_*dbg() dont use pr_debug, they *become* one flavor of them)
> >   this could (should?) be added, and maybe tailored for drm.
> >   some of the device prefixes are very long, a "d" flag could optionalize
> them.
> 
> I'm lost what the fmlt decoration flags are?
> 
> 
> The flags are::
> 
>   p    enables the pr_debug() callsite.
>   f    Include the function name in the printed message
>   l    Include line number in the printed message
>   m    Include module name in the printed message
>   t    Include thread ID in messages not generated from interrupt context
>   _    No flags are set. (Or'd with others on input)
> 
> 
> the fmlt flags add a "decoration" prefix to enabled/printed log messages

Oh I was just confused and thought fmlt was some special format thing, and
not just the list of letters that wond work due to the implementation.

If you havent, maybe just spell the above list out (like you do here) in
the docs?

> > - api use needs review wrt drm life-cycle.
> > >   enum drm_debug_category and DYNAMIC_DEBUG_CLASSES could be together?
> >
> > Hm if they're tied to module lifetime we should be good? Not sure what
> > could go wrong here.
> >
> >
> with the new __section, "life-cycle" doesnt really pertain.
> the new issue is how the class-maps are shared across the subsystem;
> the current class-maps list for each module will probably break;
> a list item cannot be on N different lists of different modules.
> Altering the list-items to ref the class-map (not contain it) should solve
> the problem.
> 
> 
> 
> 
> > > - class-names could stand review, perhaps extension
> > >   "drm:core:" etc have appeared (maybe just from me)
> > >   or a "plan" to look at it later
> >
> > Yeah it's been a bit sprawling. I'm kinda hoping that by firmly
> > establishing dyndbg as the drm debug approach we can cut down for the need
> > for ad-hoc flags a bit.
> >
> > yeah thats why I kept the DRM_UT_* names.
> OTOH - the symbolic names patch exposes the choices,
> which locks the names as API ??

Yeah that part is fine. It's more because the flags was the only thing we
ever had, any debug need was solved with them. With dyndbg we should have
a lot more and a lot more precise options for handling this.

So I'm not worried about the flags and their names per-se, more that we
had some pressure to add more flags for specific files and libraries.
Dyndbg should give us a much more powerful tool for these problems.

> > > - i915 & amdgpu have pr_debugs (DC_LOG_*, gvt_dbg_*) that have
> > > class-ish prefixes that are separate from, but similar to DRM_UT_*,
> > > and could stand review and possible unification with reformed or
> > > extended drm categories.
> >
> > Yeah drm is not entirely consistent with how exactly driver debug printing
> > should be done. Another reason why I'm hoping that the kitchen sync with
> > everything approach you're doing here could help unify things.
> >
> 
> 
> the decoration flags can help here; they loosely/precisely describe
> the elements of most/all the current debug format-prefix variations.
> So case by case, the ad-hoc variations should map onto these flags,
> 
> The flags allow selectively dropping the prefix info from some of the log
> entries,
> after you've seen the module name and function a dozen times,
> it's helpful to reduce screen clutter.
> 
> It might make sense to add a new flag for device,
> so that dev_dbg() flavors can shorten-or-skip the longer device strings,
> maybe some drm specific flavors.
> 
> 
> 
> >
> > > - the change to enum drm_debug_category from bitmask values to 0..31
> > >   means that we foreclose this possiblility:
> > >
> > >    drm_dbg(DRM_UT_CORE|DRM_UT_KMS, "wierd double-cat experiment");
> >
> > Yeah no, that doesn't make much sense to me :-)
> >
> > no chuckles for the schrodinger's cat joke ?
> (maybe "yeah no" is the artful superpositional reply, I just caught :)
> 
> 
> > > - nouveau has very few drm.debug calls,
> > >   has NV_DEBUG, VMM_DEBUG, nvkm_printk_, I havent looked deeply.
> >
> >
> nouveau has like levels, man ..
> test_dynamic_debug implements its priority-style names as a POC
> 
> patch 18 converts nvkm_debug/trace to use dev_dbg instead of dev_info
> it probably could adapt to use drm_devdbg
> 
> 
> 
> 
> > Yeah see above. There's a pile more drivers (more on the armsoc side of
> > things) which are quite big on the raw debug call approach.
> >
> >
> LOW, MID, HI has been proposed at least once wrt dyndbg.
> that probably fits well with current disjoint classes.
> level/verbose classes should be practical too, as described above.
> 
> NB: The symbolic names should also work
> 
>    echo +MID > /sys/module/foobar/parameters/debug_verbosity
> 
> though theres some ambiguity with
> 
>    echo -V3 > /sys/module/foobar/parameters/debug_verbosity
> 
> that should turn off V4,5,6,
> but what about V1,2 ?
> it could leave them alone (whatever their previous settings are)
> 
> anyway, lkp-robot and igt-trybot should be grinding on the latest patchset
> soon,
> I'll send it after I fix whatever breaks.

Awesome, like I said I'm a bit drowned in everything, but I'm really happy
you're pushing this!
-Daniel

> 
> 
> 
> > Cheers, Daniel
> >
> 
> thanks,
> Jim

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
