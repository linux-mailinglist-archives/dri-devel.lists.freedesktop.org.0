Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 738C79A40C6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 16:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB0D10E93B;
	Fri, 18 Oct 2024 14:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="awpFi9E/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DF510E939;
 Fri, 18 Oct 2024 14:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729260580; x=1760796580;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YH6p04yWfXy+x6eRVU5zann2hTNt933EiknJufhu5dI=;
 b=awpFi9E/SFYA7/dIRzIyNgrRGk8q4KLfDD+EE+ymcx4XFovI58DW8CFf
 iy3tjJMb/QmfEASMIM678JkzZNT4U9L6MsPsIqMFJcyNFLwHsDPdIkjV8
 Ir4CEG8FblZ5qfEX8l5mu77w9mPNHkyEoPqHIVMRb2xfaGshaQ+tWwwLB
 oo+OdvoBNefNwEBN36cf1rViAjU4S2RDEqDreE9cbUVY0iISEFRPslEiE
 5iYUSY7okZ5CcsRUoptJAfvRNQ6qbGgay0fUKsYFuYQkH0ltjFndO1iXr
 XwSM1yq+GnTmHtnSoI01xUz+zS75j7LMNTdgCrjtPMiCno+SE9pVAbFaO A==;
X-CSE-ConnectionGUID: OHtsZLdSTPWMXo0r27cdVg==
X-CSE-MsgGUID: Mbfs3vGsQnGdQo4H+a/78g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39335508"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39335508"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 07:09:37 -0700
X-CSE-ConnectionGUID: eMI5WRbxSxSKvlomQ96cHw==
X-CSE-MsgGUID: Rnq2IQ8/QguPuO40AjEyEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="83459366"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 07:09:30 -0700
Date: Fri, 18 Oct 2024 17:09:27 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, airlied@gmail.com,
 simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 matthew.d.roper@intel.com, boris.brezillon@collabora.com,
 adrian.larumbe@collabora.com, kernel@collabora.com,
 maraeo@gmail.com, friedrich.vock@gmx.de, michel@daenzer.net,
 joshua@froggi.es, alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
Message-ID: <ZxJsF89DXAGvFRr5@black.fi.intel.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
 <ZxB6yKRrgvCoRK7y@black.fi.intel.com>
 <9b720b21-6195-408c-88bf-a092e0e7555c@amd.com>
 <ZxE-x6osh_jFHl5X@intel.com>
 <5a89757f-7000-4ccc-8762-1befe1fae258@amd.com>
 <ZxJYm6epuuConWdz@black.fi.intel.com>
 <da5d8d7d-cbf3-403d-89f9-465cd730ef0a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da5d8d7d-cbf3-403d-89f9-465cd730ef0a@amd.com>
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

On Fri, Oct 18, 2024 at 02:54:38PM +0200, Christian König wrote:
> Am 18.10.24 um 14:46 schrieb Raag Jadav:
> > > As far as I can see this makes the enum how to recover the device
> > > superfluous because you will most likely always need a bus reset to get out
> > > of this again.
> > That depends on the kind of fault the device has encountered and the bus it is
> > sitting on. There could be buses that don't support reset.
> 
> That is even more an argument to not expose this in the uevent.
> 
> Getting the device working again is strongly device dependent and can't be
> handled in a generic way.

My understanding is that the proposed methods can be handled in a generic way
and are useful for the devices that do support it. This way the userspace can
atleast have a hint about recovery.

For others we can have something like WEDGED=none (as proposed by Michal and
Lucas in other threads) and let admin/user decide how to deal with it.

Raag
