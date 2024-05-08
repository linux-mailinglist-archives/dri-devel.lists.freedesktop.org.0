Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D50398C04AE
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 21:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FD810E2A8;
	Wed,  8 May 2024 19:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MpU1KTkY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB4710E2A8;
 Wed,  8 May 2024 19:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715194810; x=1746730810;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wHX6ZayZR410P7sCEH4zTMDoMC1Yufhcki0M3kCLVwQ=;
 b=MpU1KTkYmgKqr7Oovj2QHS/gFdCpYJHp8mQ/18EztrpRXFIp/bg90KN5
 JduY2BlMX+j3gAM9M3QDwdNVN3An6eV+VdLSpAIJG70XvQpWmpUdaS77X
 4GfyvmWJIIpabZmH+QqqV6+dFMvEMj0kX2IruuFwDywubEWHiNauwUx2M
 wrJJhhEvWqp/9a1BcbbMg1wleKrVTKfNyD58ZN7ZzEMt5qdbOGCOFF54u
 9JdzawKZjj/Z9y0NeRg/GabZzdrfWkrzQVSLgNbH0V9gszGjNOYZbwMyd
 fZdwqnJJc3a0AE9gq6NPjC3e+805TKDJ1R5KrbnZ4X3vEu8xfGWEhN5AW w==;
X-CSE-ConnectionGUID: X/ry1wjZTzivJFSWiHZFVw==
X-CSE-MsgGUID: v4EqN914Szy9II+WjPe86w==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11239834"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="11239834"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 12:00:07 -0700
X-CSE-ConnectionGUID: HHXJY81iR96PGF0kBfWn7A==
X-CSE-MsgGUID: 6UIHKEHNQPaH/GKQipAIUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28928855"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 08 May 2024 12:00:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 08 May 2024 22:00:03 +0300
Date: Wed, 8 May 2024 22:00:03 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/5] drm/amdgpu: Use drm_crtc_vblank_crtc()
Message-ID: <ZjvLs0KZKSxEfU9F@intel.com>
References: <20240408190611.24914-1-ville.syrjala@linux.intel.com>
 <20240408190611.24914-2-ville.syrjala@linux.intel.com>
 <CADnq5_OF=MM-J6WAqnLYtu-kUWcCXkzCmi499viFptrFnBWGAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_OF=MM-J6WAqnLYtu-kUWcCXkzCmi499viFptrFnBWGAg@mail.gmail.com>
X-Patchwork-Hint: comment
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

On Wed, May 08, 2024 at 09:47:50AM -0400, Alex Deucher wrote:
> On Mon, Apr 8, 2024 at 3:06 PM Ville Syrjala
> <ville.syrjala@linux.intel.com> wrote:
> >
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Replace the open coded drm_crtc_vblank_crtc() with the real
> > thing.
> >
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> > Cc: amd-gfx@lists.freedesktop.org
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Thanks. Pushed to drm-misc-next.

-- 
Ville Syrjälä
Intel
