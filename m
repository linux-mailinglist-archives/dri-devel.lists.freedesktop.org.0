Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C82C1EF58
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B157388647;
	Thu, 30 Oct 2025 08:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BY4x66L9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB46B899D4;
 Thu, 30 Oct 2025 08:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761812559; x=1793348559;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=X1qoRbeR7cH7A76OaU8ea24X2x456u+mQGXe5BlwdDI=;
 b=BY4x66L9o23UZG3GDt6qR998UqhTBZiYyXgNTlETjtGY/qCcTx+i5Y2O
 70zAJvZWKZDpDrr4iN97g6D93koH3zgExkjdttlyhNFFKnuD+pHxoQLET
 8Dpn7hb2XpwCqolq8KRPY9Bgb8fY4rpTB3cZBpZ7q8J6q7ePVDHceXV08
 J1U1EtL2y59/DorfW7RFgQldBdoZ1RWjy4gMUzbCrmNvb6oiTAkUDtTa0
 KEk8WOjja+1THFCzs5swSvHxNY8zO27mDMeG9hQGA3WF5YIIqdXhJFh9l
 RGROhirSd3mWckssippbBdwoMiphLdBUuYQA3v9AXQlZRxrCJXzV2Gxpy w==;
X-CSE-ConnectionGUID: Xh8Qda5LTfyqOpjWr7xOpA==
X-CSE-MsgGUID: vQZIPc+JSKeKMqExl+fyqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="81364916"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="81364916"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 01:22:38 -0700
X-CSE-ConnectionGUID: xR/MoA+3SYyESYupl8VUhw==
X-CSE-MsgGUID: X50HDf1BT5eqFcsooueXiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="216745465"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.175])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 01:22:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 30 Oct 2025 10:22:27 +0200 (EET)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
 Simon Richter <Simon.Richter@hogyros.de>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
 Bjorn Helgaas <bhelgaas@google.com>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
 =?ISO-8859-15?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
 =?ISO-8859-2?Q?Micha=B3_Winiarski?= <michal.winiarski@intel.com>, 
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/9] PCI: Prevent resource tree corruption when BAR resize
 fails
In-Reply-To: <20251029233644.GA1604285@bhelgaas>
Message-ID: <d697c9e1-580e-6449-796c-a3f5198e0934@linux.intel.com>
References: <20251029233644.GA1604285@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-87365863-1761812347=:975"
Content-ID: <cc63bc64-2c9d-bc3a-0105-b36ea9a88737@linux.intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-87365863-1761812347=:975
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <b1bb7069-a25e-dcfe-65de-9b3ae8fc20b4@linux.intel.com>

On Wed, 29 Oct 2025, Bjorn Helgaas wrote:

> On Tue, Oct 28, 2025 at 07:35:43PM +0200, Ilpo J=E4rvinen wrote:
> > pbus_reassign_bridge_resources() saves bridge windows into the saved
> > list before attempting to adjust resource assignments to perform a BAR
> > resize operation. If resource adjustments cannot be completed fully,
> > rollback is attempted by restoring the resource from the saved list.
>=20
> > Fixes: 8bb705e3e79d ("PCI: Add pci_resize_resource() for resizing BARs"=
)
> > Reported-by: Simon Richter <Simon.Richter@hogyros.de>
> > Reported-by: Alex Benn=E9e <alex.bennee@linaro.org>
>=20
> If these reports were public, can we include lore URLs for them?
>=20
> Same question for [PATCH 5/9] PCI: Fix restoring BARs on BAR resize
> rollback path.
>=20
> I put these all on pci/resource for build testing.  I assume we'll
> tweak these based on testing reports and sorting out the pci/rebar
> conflicts.

Thanks, the links will come in v2 along with fixing a few things found by=
=20
more extensive tests by LKP. E.g., it seems clang thinks guard() cannot be=
=20
used here because goto jumps over it (auto variable initialization gets=20
skipped so it's kind of understandable limitation).

--=20
 i.
--8323328-87365863-1761812347=:975--
