Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C503699019A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 12:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9654E10E295;
	Fri,  4 Oct 2024 10:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GdOo/AxX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C805B10E25E;
 Fri,  4 Oct 2024 10:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728039046; x=1759575046;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=r6rL3L5eTw5B0T8Ujpsb9LXOrepEYcMhL1hmLv1gie4=;
 b=GdOo/AxX9nSQCoCbtRCTn2kaMOMfV2VhtEtsGwnkSog9SqSMzVqgKJhT
 3oChd6aeh8yqfU/4w1zlEka5kU535/3+XPPkFvkLVFl9I1XTmvAjwgWoz
 crGH6IP1bzKhNUpgJDOk+Bbzh3yzEf2X7MUK+8H1Tc6tefFOPcL5cpfnp
 2s5+tC/mdV6J3+rwfff9SdVawkmurkZ8yZJLlEtErN3oFjkUeg0SDYj7y
 D40KeaAvh3mvyFgwpwSR54k46CzLAMVBCSNe1G+BDQ06EhGw9X1zmSPTZ
 +MB4432doI0ld/hpLRzw87faAfCKkfpwK/7RGb3yQ+3YFnkW3zfsgqS6n w==;
X-CSE-ConnectionGUID: cjN7ShglSKiAV6+iOUa3Cw==
X-CSE-MsgGUID: NyS7RMmeRD+OPGEzNTvF9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27141834"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="27141834"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 03:50:44 -0700
X-CSE-ConnectionGUID: dGyipNc9TmmqCR0NFbAMCQ==
X-CSE-MsgGUID: 8hET29gKTpmKLsqOju4K6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="79438667"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.128])
 ([10.245.245.128])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 03:50:41 -0700
Message-ID: <c8f3278c442de947a167876a565c2c96c6264cc3.camel@linux.intel.com>
Subject: Re: [PATCH RESEND] locking/ww_mutex: Adjust to lockdep nest_lock
 requirements
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: intel-xe@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng
 <boqun.feng@gmail.com>, Maarten Lankhorst <maarten@lankhorst.se>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Date: Fri, 04 Oct 2024 12:50:27 +0200
In-Reply-To: <20241004101601.GQ18071@noisy.programming.kicks-ass.net>
References: <20241002125611.361001-1-thomas.hellstrom@linux.intel.com>
 <20241004101601.GQ18071@noisy.programming.kicks-ass.net>
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

On Fri, 2024-10-04 at 12:16 +0200, Peter Zijlstra wrote:
> On Wed, Oct 02, 2024 at 02:56:11PM +0200, Thomas Hellstr=C3=B6m wrote:
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
>=20
> I'm assuming you actually hit this?

Yes, but there was a change merged to drm_exec, a main ww_mutex user
that makes it less likely to happen. (Unlocking in reverse unless the
user explicitly requests an unlock which will be a more common use-case
moving forward).

>=20
> Anyway, work around seems sane enough, thanks!

Thanks,
Thomas


