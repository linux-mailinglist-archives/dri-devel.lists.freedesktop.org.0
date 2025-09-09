Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE0EB4AB37
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FAF10E162;
	Tue,  9 Sep 2025 11:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rqaep0ha";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1138910E162
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757416264; x=1788952264;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bOM0a0A+HB5LBofYI+3MTNno0SLEwnhQSFIL8qE1y+Q=;
 b=Rqaep0haG1h6esJfx3hQq7bXVXArUR/P0Zjp1GaFptq8a9+Go+kZf60O
 +MqE8f08r870Eb5mO3v4aV/IImbm183oU3gZ3E+bet4x76SqaGQduXpgY
 zCeTBXYrJMRwlZL++3z+MrvbXnv8miuMGn6PB0v+FUyfmGYxOYgMEZfWg
 gwQG5oncqzy9urSLL5QTXqg76rPWi1QmD7rbbPXETT/tqDqcMEMApWwyk
 zYOBkEBigRGdaEntZYMr9juui/1pcIPEr3eeD0FNjSsmFRoRxmKtIsEub
 vIv64PFZ2FAKPZwOUruP0Pq8Rqm6pWfwH/ikWDtfclLqqpKDWvwMoRkvR g==;
X-CSE-ConnectionGUID: D4vh+5biQ/mpK/x9XrGhWQ==
X-CSE-MsgGUID: s1qQdAHoTAu3WvSCYAw35Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="62323934"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="62323934"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 04:11:03 -0700
X-CSE-ConnectionGUID: Z7coOfXjRzyh+dC2z08F5A==
X-CSE-MsgGUID: SqhHfoc2QVKtI97PVE5nLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172936765"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.108])
 ([10.245.244.108])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 04:11:00 -0700
Message-ID: <cbd5c99d2394335ac4aeb2740994ab14508e2553.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/gpuvm: add deferred vm_bo cleanup
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Alice Ryhl	
 <aliceryhl@google.com>, Matthew Brost <matthew.brost@intel.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Steven Price
 <steven.price@arm.com>, Daniel Almeida	 <daniel.almeida@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, 	dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 	rust-for-linux@vger.kernel.org
Date: Tue, 09 Sep 2025 13:10:59 +0200
In-Reply-To: <8078cad2-d5d3-4e20-9848-034c2a503f3d@kernel.org>
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

On Tue, 2025-09-09 at 12:47 +0200, Danilo Krummrich wrote:
> On 9/9/25 12:39 PM, Thomas Hellstr=C3=B6m wrote:
> > On 9/8/25 14:20, Danilo Krummrich wrote:
> > > On 9/8/25 2:11 PM, Boris Brezillon wrote:
> > > > On Mon, 08 Sep 2025 13:11:32 +0200
> > > > "Danilo Krummrich" <dakr@kernel.org> wrote:
> > > > > I'm saying exactly what you say: "has to be a special unlink
> > > > > function" ->
> > > > > drm_gpuva_unlink_defer_put(). :)
> > > > I don't see how calling drm_gpuva_unlink() instead of
> > > > drm_gpuva_unlink_defer_put() would leak the vm_bo though.
> > > Initially (i.e. a few mails back), it sounded to me as if you'd
> > > propose to drop
> > > the drm_gpuva's vm_bo reference only when it is freed.
> > >=20
> > > > > No, drivers can't iterate the evict/extobj lists directly; or
> > > > > at least this is
> > > > > not intended by GPUVM's API and if drivers do so, this is
> > > > > considered peeking
> > > > > into GPUVM internals, so drivers are on their own anyways.
> > > > >=20
> > > > > Iterators, such as for_each_vm_bo_in_list() are not exposed
> > > > > to drivers.
> > > > Okay, that's a good thing. I thought Xe was doing some funky
> > > > stuff with
> > > > the list...
> > > Maybe, I don't know. If they do so, the should send patches
> > > adding the
> > > corresponding iterators and provide a rationale why drivers need
> > > to access those
> > > lists directly and why we can't provide an API that handles the
> > > overall
> > > use-case, such as drm_gpuvm_prepare_objects(), etc.
> >=20
> > We're using the drm_gpuvm_*for_each* macros in drm_gpuvm.h,
> > assuming from name
> > and docs they are driver api.
> >=20
> > Also the drm_gem_for_each_gpuvm_bo(), although this usage could
> > easily be
> > converted to a helper.
>=20
> We were talking about the extobj/evict lists, the ones you mention
> are fine of
> course. :)
>=20

Hmm. Now on closer inspection it looks like we're checking for evict
list empty, It looks like rebinding after validation may in theory
evict some bos to system memory and then we'd rerun the validation step
if the evict list was not empty.

We could of course add a helper for that or if there are better
suggestions to handle that situation, that'd be fine as well.

Thanks,
Thomas

