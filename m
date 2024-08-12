Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C245F94E98E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 11:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DE610E088;
	Mon, 12 Aug 2024 09:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K1Iffsws";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4F910E088;
 Mon, 12 Aug 2024 09:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723454346; x=1754990346;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=+41+f5s1jH10I4YSNPeaAGsgnJPW+a7kFpxcNilpth4=;
 b=K1IffswsuBS6MAwerMbN9D00tH790+e1qbQpWX/oQjHB/kYQSQoSFTnU
 jzn+CvHr0XstpuLPZtzimHcKO6p6nYbT60vHYggbUtwyavYKuJdyJLf5E
 lfY3C3je9l+YIuCoHKzc2STixdDEAnoJqP0djv07TFcYqsPQvC3Arp7R2
 7/2L5TBp6lnk4SE6Hrjr4V8XDbPiKpma8j16O1NfLO/TxnjujMBpHTiBF
 N4EWm3QHUVudFOZ7hcuBUQUirvqL5DyS1kFC/KbreolDaHa00aBMIjw6e
 8B75Lf179YJXFd6IYwUC2Axz3hhP6soHOPPY0J2TCec/WI7uNUrahEUJI w==;
X-CSE-ConnectionGUID: vMUOGFTcSCWyLls8/G9ZMA==
X-CSE-MsgGUID: UntBlBmORm2hirOPCxbkwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21113248"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="21113248"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 02:19:04 -0700
X-CSE-ConnectionGUID: ClDqEzp4TQW7IVbfEEkYFw==
X-CSE-MsgGUID: BM9dZOgmRdKKRLFNanmUkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="58138159"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.23])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 02:19:01 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAG48ez1PDJKd5gd932K9iknNg+V=mTmK5OMZys3OEXmKUTXxAw@mail.gmail.com>
References: <20240805102554.154464-1-andi.shyti@linux.intel.com>
 <ZrFMopcHlT6G7p3V@ashyti-mobl2.lan> <2024080640-landfall-doozy-e0d2@gregkh>
 <ZrHw3y8QKPT87LxP@ashyti-mobl2.lan>
 <172294612086.38654.15621922821489001205@jlahtine-mobl.ger.corp.intel.com>
 <CAG48ez0P6juWnVL-m6A33X2GTsrm6CO4okN0s7Y_YT01yTqkrA@mail.gmail.com>
 <CAG48ez1PDJKd5gd932K9iknNg+V=mTmK5OMZys3OEXmKUTXxAw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix mmap memory boundary calculation
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
To: Jann Horn <jannh@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Mon, 12 Aug 2024 12:18:56 +0300
Message-ID: <172345433630.14739.7181647476623310397@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.10
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

Quoting Jann Horn (2024-08-09 18:40:45)
> On Fri, Aug 9, 2024 at 4:48=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> > On Tue, Aug 6, 2024 at 2:08=E2=80=AFPM Joonas Lahtinen
> > <joonas.lahtinen@linux.intel.com> wrote:
> > > Quoting Andi Shyti (2024-08-06 12:46:07)
> > > > Hi Greg,
> > > >
> > > > same question without the stable mailing list not to trigger the
> > > > automatic reply.
> > > >
> > > > > Andi Shyti (2):
> > > > >   drm/i915/gem: Adjust vma offset for framebuffer mmap offset
> > > > >   drm/i915/gem: Fix Virtual Memory mapping boundaries calculation
> > > >
> > > > I have forgotten to actually Cc the stable mailing list here.
> > > > These two patches need to be merged together even if only the
> > > > second patch has the "Fixes:" tag.
> > > >
> > > > I could have used the "Requires:" tag, but the commit id would
> > > > change in between merges and rebases.
> > >
> > > The patches were the top two in drm-intel-gt-next and committed
> > > only few hours ago so I fixed up the patches adding Cc: stable
> > > and Requires:
> >
> > I'm not very familiar with how the DRM trees work - shouldn't fixes in
> > i915 go on the separate drm-intel-fixes branch so that they don't have
> > to wait for a merge window?
>=20
> Ah, nevermind, I see it is already in drm-intel-fixes. Sorry for the nois=
e.

Yeah, the DRM subsystem has a rather specific process.

Jann, do you consider the fix released already now that it is in -rc3 or wi=
ll
you start the 30 day count from when 6.11 gets released? I hope the latter,
but just want to make sure there are no surprises.

Regards, Joonas
