Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C858578BF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 10:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E876110E405;
	Fri, 16 Feb 2024 09:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4d756Ix";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57B810E405;
 Fri, 16 Feb 2024 09:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708075344; x=1739611344;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=oPvDzzQc5vWK+p/SmqjSqNC1Wjp/9w/PnlwOfrdbPXU=;
 b=Q4d756IxtSqoAlPUFLZrrzoVCJUit8zj7m/fhft/AbGahJ+UNZkKVscv
 iIUVkYVoSOe93NycagCeUpT8iNuddP7c8bInNJ9utdzGyAuqHVygK2BuH
 ILz7uNyyVXPPsXJz3qzRBkoh3jJHD4/GsRiZlSp+HgWq4yx6+YXNjpRRE
 i5u9wVrxh4P8UwmX1n2KXgUoMr/uRG/8XoO+3ul0qw5kLoPmsEhqTQC+/
 zy9czkt7jCC3lGVSBP3ALTFwQeUst6UEoW97m2rXFD/WnHkuHkG5+GSGU
 F7SU8Krhf1TqB5Ky15+FnNe6bOpG56SyZvJVwhZAPU26x+fpUK9qnz2Ov w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2348352"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2348352"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 01:22:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; d="scan'208";a="41282469"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost)
 ([10.94.248.234])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 01:22:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 16 Feb 2024 11:22:13 +0200 (EET)
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>, 
 Lukas Wunner <lukas@wunner.de>
Subject: RE: [PATCH 1/3] drm/radeon: Use RMW accessors for changing LNKCTL2
In-Reply-To: <BL1PR12MB51440761895B3DF935840BF0F74D2@BL1PR12MB5144.namprd12.prod.outlook.com>
Message-ID: <dd2da980-d114-e30e-fa91-79ff9ec353e7@linux.intel.com>
References: <20240215133155.9198-1-ilpo.jarvinen@linux.intel.com>
 <20240215133155.9198-2-ilpo.jarvinen@linux.intel.com>
 <BL1PR12MB51440761895B3DF935840BF0F74D2@BL1PR12MB5144.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1671545761-1708075333=:1097"
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

--8323328-1671545761-1708075333=:1097
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 15 Feb 2024, Deucher, Alexander wrote:

> [Public]
>=20
> > -----Original Message-----
> > From: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > Sent: Thursday, February 15, 2024 8:32 AM
> > To: Deucher, Alexander <Alexander.Deucher@amd.com>; amd-
> > gfx@lists.freedesktop.org; Daniel Vetter <daniel@ffwll.ch>; David Airli=
e
> > <airlied@gmail.com>; Dennis Dalessandro
> > <dennis.dalessandro@cornelisnetworks.com>; dri-
> > devel@lists.freedesktop.org; Jason Gunthorpe <jgg@ziepe.ca>; Leon
> > Romanovsky <leon@kernel.org>; linux-kernel@vger.kernel.org; linux-
> > rdma@vger.kernel.org; Pan, Xinhui <Xinhui.Pan@amd.com>; Koenig, Christi=
an
> > <Christian.Koenig@amd.com>
> > Cc: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>; Lukas Wunner
> > <lukas@wunner.de>
> > Subject: [PATCH 1/3] drm/radeon: Use RMW accessors for changing LNKCTL2
> >
> > Convert open coded RMW accesses for LNKCTL2 to use
> > pcie_capability_clear_and_set_word() which makes its easier to understa=
nd
> > what the code tries to do.
> >
> > LNKCTL2 is not really owned by any driver because it is a collection of=
 control
> > bits that PCI core might need to touch. RMW accessors already have supp=
ort
> > for proper locking for a selected set of registers
> > (LNKCTL2 is not yet among them but likely will be in the future) to avo=
id losing
> > concurrent updates.
> >
> > Suggested-by: Lukas Wunner <lukas@wunner.de>
> > Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
>=20
> The radeon and amdgpu patches are:
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>=20
> Are you looking for me to pick them up or do you want to land them as=20
> part of some larger change?  Either way is fine with me.=20

Hi,

You please take them, I intentionally took them apart from the BW=20
controller series so they can go through the usual trees, not along with=20
the BW controller. (I don't expect the BW controller to be accepted during=
=20
this cycle).

--=20
 i.

--8323328-1671545761-1708075333=:1097--
