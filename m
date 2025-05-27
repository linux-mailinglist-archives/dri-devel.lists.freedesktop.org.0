Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B89B7AC5A1D
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 20:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7336110E4D6;
	Tue, 27 May 2025 18:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lwGmTrVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C888D10E1E1;
 Tue, 27 May 2025 18:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748371036; x=1779907036;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=n1Hvv26+Zpv8SzTuLKYLJ1yZzLAggmKAgUbIT3iJPeU=;
 b=lwGmTrVx8NfqBzCd61wVc23TEzorNyKmbB/uHJLZMvREWCFw6jwQfVJM
 ITmJL3HP54Gi5tZew8/JDrUNbr8bAmF9cgYCBGa1yDo81Vg2qYb6Yw9Z/
 z4YD7rC/sM7T3WEwWdyeDpwT1agY34mMhAFGrz6LEvz5PLJvA3c2ruxMp
 bYiC4ghK5KiX7OyYlnoRbby7Mx7kkE54YShv01c/Qk8tAuYB90wIWvmua
 zeT4Fv/61C15uMlXA251j1YVBnuE2dXyGpjHfInEGipvZtefuA/grgMwG
 XOIM5jgpVJ8NSHTf7PJBdJ28O6FnzZruyrBFJQA1IWy+5mIy4VdnirOqo w==;
X-CSE-ConnectionGUID: dqfROedbSrOLtitpO3Xb5A==
X-CSE-MsgGUID: 2kywnb5+QQOJ+1+6n6We6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49488064"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="49488064"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 11:37:15 -0700
X-CSE-ConnectionGUID: QP7Y5iKzQTiQfK4EH1nU1A==
X-CSE-MsgGUID: 5qVzn4b9QGOkky5MxopYcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="142896602"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 11:37:10 -0700
Date: Tue, 27 May 2025 21:37:07 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Abliyev, Reuven" <reuven.abliyev@intel.com>,
 "Weil, Oren jer" <oren.jer.weil@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 08/10] drm/xe/nvm: add on-die non-volatile memory
 device
Message-ID: <aDYGUzSWLdeyzpQ_@black.fi.intel.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-9-alexander.usyskin@intel.com>
 <aDGfgubuFfa3e0K_@black.fi.intel.com>
 <CY5PR11MB63666722F7C02E4D776CE601ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR11MB63666722F7C02E4D776CE601ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
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

On Tue, May 27, 2025 at 11:55:13AM +0530, Usyskin, Alexander wrote:
> > Subject: Re: [PATCH v10 08/10] drm/xe/nvm: add on-die non-volatile
> > memory device
> > 
> > On Thu, May 15, 2025 at 04:33:43PM +0300, Alexander Usyskin wrote:
> > > Enable access to internal non-volatile memory on DGFX
> > > with GSC/CSC devices via a child device.
> > > The nvm child device is exposed via auxiliary bus.
> > 
> > ...
> > 
> > > +void xe_nvm_init(struct xe_device *xe)
> > > +{
> > 
> > Same as patch 6, please handle errors.
> This device failure is non-fatal for Xe, caller will ignore
> the failure anyway.

Same as patch 6, let's atleast have the readiness.

Raag
