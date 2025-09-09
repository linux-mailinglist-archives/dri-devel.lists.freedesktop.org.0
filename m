Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE74B4AC9B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384AC10E6D1;
	Tue,  9 Sep 2025 11:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W4v5nXSY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3E710E6D1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757418367; x=1788954367;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=uhe//XJjJxP6iJWzYFShGAzGMjO7dDnhbwj/aYwazAs=;
 b=W4v5nXSYh1fKMRSlkAjYlvO1AZ5qC5q3c2UPkGV0eIVvniX2xs7mJEEi
 bTheefRY4uqn24sTCzzs369JCXFl0WokLgP/fXNMOJQOXLWAQprcvJLFy
 R9tYOJu5XdbsINQij2YcGLXxZsiPQ7zy2ncQfNKrNxcXf4bQO7+yD4wRm
 LISsEfBER8FQmadgB8qkWKS0Gn4O66lkzYN+cDYM9aWJD/yRrTJDXNl8J
 KFYv16Li4OqF++fwl++XwR42qHolJt97c4pa/cETxUzmbch997RmS9h+h
 bvadQN9e+QdZYTAY/N/W1bvA3BrIPYUguj65/d9EeJ6ajtzK2JebR60yn Q==;
X-CSE-ConnectionGUID: dzo67DawTFCF7dRvO58kRA==
X-CSE-MsgGUID: QqMBSDRYQQCpZ4f1HMyILQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63528669"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63528669"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 04:46:06 -0700
X-CSE-ConnectionGUID: Rqaf2/G3TNS/txgKEP8nLg==
X-CSE-MsgGUID: 8mFi2zPYScWSR1sIesxYyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="204053396"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.108])
 ([10.245.244.108])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 04:46:02 -0700
Message-ID: <ed002179af749657ebe503cdf708588de9330013.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/gpuvm: add deferred vm_bo cleanup
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Matthew Brost	
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Daniel Almeida	 <daniel.almeida@collabora.com>, Liviu Dudau
 <liviu.dudau@arm.com>, 	dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 	rust-for-linux@vger.kernel.org
Date: Tue, 09 Sep 2025 13:46:03 +0200
In-Reply-To: <e5afeb60-96cc-4a9b-a360-2da03e4e236e@kernel.org>
References: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
 <20250905-vmbo-defer-v1-1-7ae1a382b674@google.com>
 <20250905152505.005a610d@fedora>
 <CAH5fLghgqv0mNYf8r-rdeBaCGxYsdkBouqgo_ohx3DYHwpcZRQ@mail.gmail.com>
 <DCL8DQV23FIZ.KJ74UQ9YOFZV@kernel.org> <aL1pSFB9iBsfHFM_@google.com>
 <DCMJ6K06T63T.2UBTM1RL4YJ0A@kernel.org> <aL1u_YxOkuj1kIq6@google.com>
 <20250908091140.44856fde@fedora> <aL6TJYRmWIkQXujj@google.com>
 <DCNAE3CJMEJ0.JH1F0MJABXQI@kernel.org> <20250908122002.2c80dd3a@fedora>
 <DCNDGFE7RR5Q.X3PCDW0KIX89@kernel.org> <20250908141156.3dbdea0b@fedora>
 <7aa3f464-a3d0-47a0-b044-d8db93f45918@kernel.org>
 <a2006f74-75bb-48ac-ac9c-0a71c8f9d510@linux.intel.com>
 <8078cad2-d5d3-4e20-9848-034c2a503f3d@kernel.org>
 <cbd5c99d2394335ac4aeb2740994ab14508e2553.camel@linux.intel.com>
 <CAH5fLghY8o0ouvaz48D4bsWMJ7A06L750xdKibaoe=bKjVOpzg@mail.gmail.com>
 <e5afeb60-96cc-4a9b-a360-2da03e4e236e@kernel.org>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Tue, 2025-09-09 at 13:28 +0200, Danilo Krummrich wrote:
> On 9/9/25 1:24 PM, Alice Ryhl wrote:
> > On Tue, Sep 9, 2025 at 1:11=E2=80=AFPM Thomas Hellstr=C3=B6m
> > <thomas.hellstrom@linux.intel.com> wrote:
> > >=20
> > > On Tue, 2025-09-09 at 12:47 +0200, Danilo Krummrich wrote:
> > > > On 9/9/25 12:39 PM, Thomas Hellstr=C3=B6m wrote:
> > > > > On 9/8/25 14:20, Danilo Krummrich wrote:
> > > > > > On 9/8/25 2:11 PM, Boris Brezillon wrote:
> > > > > > > On Mon, 08 Sep 2025 13:11:32 +0200
> > > > > > > "Danilo Krummrich" <dakr@kernel.org> wrote:
> > > > > > > > No, drivers can't iterate the evict/extobj lists
> > > > > > > > directly; or
> > > > > > > > at least this is
> > > > > > > > not intended by GPUVM's API and if drivers do so, this
> > > > > > > > is
> > > > > > > > considered peeking
> > > > > > > > into GPUVM internals, so drivers are on their own
> > > > > > > > anyways.
> > > > > > > >=20
> > > > > > > > Iterators, such as for_each_vm_bo_in_list() are not
> > > > > > > > exposed
> > > > > > > > to drivers.
> > > > > > > Okay, that's a good thing. I thought Xe was doing some
> > > > > > > funky
> > > > > > > stuff with
> > > > > > > the list...
> > > > > > Maybe, I don't know. If they do so, the should send patches
> > > > > > adding the
> > > > > > corresponding iterators and provide a rationale why drivers
> > > > > > need
> > > > > > to access those
> > > > > > lists directly and why we can't provide an API that handles
> > > > > > the
> > > > > > overall
> > > > > > use-case, such as drm_gpuvm_prepare_objects(), etc.
> > > > >=20
> > > > > We're using the drm_gpuvm_*for_each* macros in drm_gpuvm.h,
> > > > > assuming from name
> > > > > and docs they are driver api.
> > > > >=20
> > > > > Also the drm_gem_for_each_gpuvm_bo(), although this usage
> > > > > could
> > > > > easily be
> > > > > converted to a helper.
> > > >=20
> > > > We were talking about the extobj/evict lists, the ones you
> > > > mention
> > > > are fine of
> > > > course. :)
> > > >=20
> > >=20
> > > Hmm. Now on closer inspection it looks like we're checking for
> > > evict
> > > list empty, It looks like rebinding after validation may in
> > > theory
> > > evict some bos to system memory and then we'd rerun the
> > > validation step
> > > if the evict list was not empty.
> > >=20
> > > We could of course add a helper for that or if there are better
> > > suggestions to handle that situation, that'd be fine as well.
> >=20
> > I don't think evict list empty means that there are no evicted
> > GEMs.
> > It's possible for an extobj to be missing from the evict list in
> > some
> > scenarios. That's why drm_gpuvm_prepare_objects_locked() checks
> > evicted on the extobj list to ensure that the evicted list is
> > up-to-date when you call into drm_gpuvm_validate_locked().
>=20
> Indeed, though I would expect that Xe considers that? It was Thomas
> who proposed
> the logic you describe here back then IIRC. :)
>=20

Yeah I don't think that eviction-while-validating could happen to
extobjs, but rather to local objects, if it happens at all anymore,
we've made a lot of changes in that area.

But moving forward both the extobj scenario and local object scenarios
will probably have to be considered in OOM situations, but then we'd of
course need to suggest suitable additions to drm_gpuvm to handle that.

/Thomas




