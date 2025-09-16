Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715CBB5901B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 10:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A02410E22E;
	Tue, 16 Sep 2025 08:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lx8hGWJS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8D810E0AC;
 Tue, 16 Sep 2025 08:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758010352; x=1789546352;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=/fOTPnIYRzNwyZiVhCec2Qefpdd4a+D5flBWydA6AZE=;
 b=lx8hGWJSEdQTR9BNvogza54a3y3txZ2UBqpPVzTLCmq1vktDeK8klsDa
 XnL/Nmnf5CtoPTb6kylv4xLKzxqG3vC7k9oFcKL6h3WOQAJ6L8lEAb8wg
 d4dhE3zDV+kBdwPGcRcA1sJdTI4G+maEIwKMj1L6QLRwsMj6A/XEUbSyW
 D9AeFUjQWdCk4ATQtp1Wvzb+HSPlQVaHTzQoFxLOKw3aLq4MHvooTRp6g
 kPoEdv+IvloOD1ow2bvfY7t7WRIrg6B+D+n8lBYTPrhsF7MUV6mSt2e1G
 mkawVuYIO7YhP3kBaCwMINkm1LHcoguNxPkjEi011ARWQ3OTh+hExclWH Q==;
X-CSE-ConnectionGUID: CVg8k4SjSQCRjMN6Kt6nEQ==
X-CSE-MsgGUID: bR/nNCRnRq62NUOMFk4xQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60211645"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="60211645"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 01:12:31 -0700
X-CSE-ConnectionGUID: ZT4Lqgl3Qg2yWk79GVLDRA==
X-CSE-MsgGUID: j/vJU0B9RmavdKiDJ4Kqsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="175658518"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.81])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 01:12:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Christian
 =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, =?utf-8?Q?Micha=C5=82?=
 Winiarski <michal.winiarski@intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, David Airlie
 <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko
 Ursulin <tursulin@ursulin.net>, ?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Michael J . Ruhl" <mjruhl@habana.ai>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 06/11] drm/i915/gt: Use pci_rebar_size_supported()
In-Reply-To: <aMhzougLzpfw2wWw@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
 <20250915091358.9203-7-ilpo.jarvinen@linux.intel.com>
 <b918053f6ac7b4a27148a1cbf10eb8402572c6c9@intel.com>
 <ewypjj64siaswcfvfzgxihwrflb6k6pz2mrfuu4ursdldwnqlm@ignlhd73keck>
 <aMhzougLzpfw2wWw@intel.com>
Date: Tue, 16 Sep 2025 11:12:21 +0300
Message-ID: <58fb988207c4d5c5ba25338c1281189e12c009c3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 15 Sep 2025, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Mon, Sep 15, 2025 at 07:24:10PM +0200, Andi Shyti wrote:
>> Hi,
>>=20
>> On Mon, Sep 15, 2025 at 03:42:23PM +0300, Jani Nikula wrote:
>> > On Mon, 15 Sep 2025, Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com=
> wrote:
>> > > PCI core provides pci_rebar_size_supported() that helps in checking =
if
>> > > a BAR Size is supported for the BAR or not. Use it in
>> > > i915_resize_lmem_bar() to simplify code.
>> > >
>> > > Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
>> > > Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>> >=20
>> > Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>> >=20
>> > and
>> >=20
>> > Acked-by: Jani Nikula <jani.nikula@intel.com>
>>=20
>> Just for some random noise on commit log's bureaucracy: why do we
>> need both Ack and R-b? I think R-b covers Ack making it
>> redundant. Right?
>
> reviewed-by is a more formal attestation of the entries in the
> submitting-patches doc, saying that he carefully reviewed the work.
>
> acked by is to state that from the maintainer perspective of that file
> the file can be merged through any tree.
>
> in the drm trees nowdays our tooling is enforcing acked-by tag if
> the patch is touching domains outside that drm branch itself.
>
> if a committer tries to push a patch without ack from the maintainer
> of that domain it will be blocked.
>
> So I believe it is a good idea to keep a separation of the meaning.
> Carrying a technical review of the patch in question doesn't necessarily
> mean that you, as maintainer, is okay of getting that patch merged
> through other trees.

Yes, all of the above. I just wanted to be explicit to avoid the
follow-up questions "thanks for the review, but is it okay to merge via
pci" or "thanks for the ack, but does this need review also", and move
on from this whole thread. (Which is a nice cleanup, btw, thanks.)

BR,
Jani.

--=20
Jani Nikula, Intel
