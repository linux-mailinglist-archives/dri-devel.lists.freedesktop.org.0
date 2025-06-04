Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62A2ACDDBA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 14:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4E610E5F7;
	Wed,  4 Jun 2025 12:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MWc9O9BS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E649010E5F7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 12:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749039493; x=1780575493;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=JfaoRG57LFIS/dd8Kog1/eQFr8Bx0dcUrQuHslbLOmY=;
 b=MWc9O9BSADNDesTQ6Sf06Ujf0HYWeolQX4Ulj9FYCT5COBH4ptO26xd8
 PRvV3s9Hl/01FLKK8aPCwq7wqWUQ/JF0cspwICZyZcL3iosiZ6Ok7gId6
 qF7ZqoSWPSVLaZ81tUNOV/ZZ2glAyf1/AwQAWFAjYy8BLJib3ouzXKv8m
 e4qom9kEvpDLvU16ZZF8rzVTYn5TpNek72O2HQD9bhHIBTc/sbKgqow1r
 6nVM5uVf8mSOggjGVXm0B3hwpPMw16FDgLml0cDGL1GD16f6R9yhIvgws
 sNpeL7ivLUnxduPMGbl/rgzOCCOyQ6No1SBu9jqEdUJDzv4V8+OveAkk+ w==;
X-CSE-ConnectionGUID: cf7OZmMiSim5N6joERz/8A==
X-CSE-MsgGUID: neFk3rL7R+yAUh6AqOeEJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51188750"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="51188750"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 05:18:13 -0700
X-CSE-ConnectionGUID: vUOPYx5oQuixYIIMdrWXhg==
X-CSE-MsgGUID: x63ZjyzkTBO+WtX82pS7Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="182345818"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.121])
 ([10.245.245.121])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 05:18:09 -0700
Message-ID: <3262455c0ac3bff64522fff47c0281943c9f76ea.camel@linux.intel.com>
Subject: Re: [PATCH] mm: Fix compile error when CONFIG_SHMEM is not set
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Steven Rostedt <rostedt@goodmis.org>, Hugh Dickins <hughd@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Matthew Wilcox	
 <willy@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org,  Andrew Morton <akpm@linux-foundation.org>, Christian
 Koenig <christian.koenig@amd.com>, Huang Rui	 <ray.huang@amd.com>, Matthew
 Auld <matthew.auld@intel.com>, Matthew Brost	 <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Date: Wed, 04 Jun 2025 14:18:06 +0200
In-Reply-To: <20250604080409.448a27e4@gandalf.local.home>
References: <20250602170500.48713a2b@gandalf.local.home>
 <20250602171458.7ceabb1c@gandalf.local.home>
 <aD4boBrdZXtz_5kL@casper.infradead.org>
 <fc2b6a94-bd2d-a5d9-c935-381a1613f47e@google.com>
 <20250603102959.20c85adb@gandalf.local.home>
 <aD8iL4cFoXpIVK_0@casper.infradead.org>
 <20250603132736.554f611d@gandalf.local.home>
 <CAHk-=whb2rMUCGsaNQC4pkCikJ7iX2_Tc1ye5_a6R9-vAkd2Cg@mail.gmail.com>
 <20250603140632.168190f9@gandalf.local.home>
 <dca861b8-a29d-b2b3-eba7-32aaf2b8eff7@google.com>
 <20250604080409.448a27e4@gandalf.local.home>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Wed, 2025-06-04 at 08:04 -0400, Steven Rostedt wrote:
> On Wed, 4 Jun 2025 00:03:18 -0700 (PDT)
> Hugh Dickins <hughd@google.com> wrote:
>=20
> > I vote for the "select SHMEM", but Thomas and dri-devel and Linus
> > should decide.
>=20
> I only tried "depends on SHMEM" which did not work, but it looks like
> "select SHMEM" should.

I agree. The whole ttm_backup implementation is based on backing things
up to shmem objects so IMO it perfectly makes sense to "select SHMEM".

Let me know if you want me to send a patch for that.

In the very unlikely case someone would ever want a config without
SHMEM but with TTM, they'd have to live without the ttm_backup and we'd
create a separate config for that.

/Thomas


>=20
> I prefer this solution too.
>=20
> Thanks,
>=20
> -- Steve

