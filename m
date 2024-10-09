Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DA5996C78
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 15:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DD210E729;
	Wed,  9 Oct 2024 13:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJzm/qMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D0F10E722;
 Wed,  9 Oct 2024 13:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728481415; x=1760017415;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BmZuKYMkRJ8L4w1vaVjp3jgciXYLxJjGTkK4HfuIKHE=;
 b=PJzm/qMWsX8QcyB4IkbhzyiyGfqhskSYJB1xyn0QR8neyv00098YBItj
 ZEB+QutTuUBkygVysPIgKEid33IrRQ/dYvM8OfIQ+X7zKBoNBQOuy95UH
 r0GnuKuJaNWv5gDYC0AVQKTFIR/gSeN6gHxBKjXh1TkNaEY3qte4kQ740
 DADANJ+Pfh531fxWYHFK4j0s5zvfLeaYpdjdTurPZ53QEVD3oolWO+WIv
 Vet/6MhR+lK/8NL0fbr6tQ6XebYs/uRmfNfYrNwtbWdualILa4cmDo7mc
 SvizWcG+sq+SjIH3XT6n5vCJPfQvjCCQcMpM02R28TigCcswTO53VBI7T Q==;
X-CSE-ConnectionGUID: rfbVQhkiRaKh8onFBoITwg==
X-CSE-MsgGUID: iQ8VM9opQHu+5KWoWYkp9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="39142953"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="39142953"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 06:43:34 -0700
X-CSE-ConnectionGUID: bPpCYgWzR1W8nDTQLGhBjg==
X-CSE-MsgGUID: HeHDlAiMQNyfm4UODcHrCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="75855340"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.243])
 ([10.245.245.243])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 06:43:32 -0700
Message-ID: <c5e8899f4bcba24a787cd0f4c92c3fc4d7ef3130.camel@linux.intel.com>
Subject: Re: [PATCH v2] locking/ww_mutex: Adjust to lockdep nest_lock
 requirements
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: intel-xe@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng
 <boqun.feng@gmail.com>, Maarten Lankhorst <maarten@lankhorst.se>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Date: Wed, 09 Oct 2024 15:43:29 +0200
In-Reply-To: <20241009131015.GP17263@noisy.programming.kicks-ass.net>
References: <20241009092031.6356-1-thomas.hellstrom@linux.intel.com>
 <20241009131015.GP17263@noisy.programming.kicks-ass.net>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Wed, 2024-10-09 at 15:10 +0200, Peter Zijlstra wrote:
> On Wed, Oct 09, 2024 at 11:20:31AM +0200, Thomas Hellstr=C3=B6m wrote:
> > When using mutex_acquire_nest() with a nest_lock, lockdep refcounts
> > the
> > number of acquired lockdep_maps of mutexes of the same class, and
> > also
> > keeps a pointer to the first acquired lockdep_map of a class. That
> > pointer
> > is then used for various comparison-, printing- and checking
> > purposes,
> > but there is no mechanism to actively ensure that lockdep_map stays
> > in
> > memory. Instead, a warning is printed if the lockdep_map is freed
> > and
> > there are still held locks of the same lock class, even if the
> > lockdep_map
> > itself has been released.
> >=20
> > In the context of WW/WD transactions that means that if a user
> > unlocks
> > and frees a ww_mutex from within an ongoing ww transaction, and
> > that
> > mutex happens to be the first ww_mutex grabbed in the transaction,
> > such a warning is printed and there might be a risk of a UAF.
> >=20
> > Note that this is only problem when lockdep is enabled and affects
> > only
> > dereferences of struct lockdep_map.
> >=20
> > Adjust to this by adding a fake lockdep_map to the acquired context
> > and
> > make sure it is the first acquired lockdep map of the associated
> > ww_mutex class. Then hold it for the duration of the WW/WD
> > transaction.
> >=20
> > This has the side effect that trying to lock a ww mutex *without* a
> > ww_acquire_context but where a such context has been acquire, we'd
> > see
> > a lockdep splat. The test-ww_mutex.c selftest attempts to do that,
> > so
> > modify that particular test to not acquire a ww_acquire_context if
> > it
> > is not going to be used.
> >=20
> > v2:
> > - Lower the number of locks in the test-ww_mutex
> > =C2=A0 stress(STRESS_ALL) test to accommodate the dummy lock
> > =C2=A0 introduced in this patch without overflowing lockdep held lock
> > =C2=A0 references.
>=20
> Thanks, I rebased tip/locking/core, which should now have this patch.

Thanks.
It takes some time for that failing CI test to run, though so, and
since I can't repro the failure locally I'll keep a watch out.

/Thomas

