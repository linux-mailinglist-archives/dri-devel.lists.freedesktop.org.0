Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037438C04B4
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 21:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2433113199;
	Wed,  8 May 2024 19:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JR4dgGR9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA0F11318E;
 Wed,  8 May 2024 19:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715194925; x=1746730925;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5NHnRCdvIAXzjA4WUAyDqyjlylBXETqJ/EQGLEUQObE=;
 b=JR4dgGR9XlK8+P2hfornQz7511OmTXPSymbvO9ThHlhbh9YuntO4hFmo
 VR007fm7gVOZlghEwNUaihqQc2huHl9itpEOVUHiYOfNLrrK2jWaCreVk
 g4qnGcN6x8A7W2PZ6mlY7tHp/kh5PkyjC4pr40yTZn2ijWN1+Mde8z2pl
 lXQVyz/cV8GCOZes1OiBvAngZZWsrY/bdSmnkVHppAmdv3k6HWZjFF1Mk
 +f5pCuV+R78GfJyrjBtLtOnulzUeEXIl/BP3n4kEejNjDSb2MoY5rqF1F
 MCIARDTFYtFH9xFjTzpCN+2d4z/yeR9tS/ss0y78kDsSzDE6SM6QOdsPh g==;
X-CSE-ConnectionGUID: //qbGySDSfWUbdCFssHV1Q==
X-CSE-MsgGUID: xBWwkI7/SDmBoBvZ7rg27Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11240236"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="11240236"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 12:02:01 -0700
X-CSE-ConnectionGUID: yp4WO+QUQ6i4epwWjVb10w==
X-CSE-MsgGUID: vZSlSvA9TKuIRKr4B8QmnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28929131"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 08 May 2024 12:01:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 08 May 2024 22:01:58 +0300
Date: Wed, 8 May 2024 22:01:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 3/5] drm/i915: Use drm_crtc_vblank_crtc()
Message-ID: <ZjvMJuNyp63FeWOo@intel.com>
References: <20240408190611.24914-1-ville.syrjala@linux.intel.com>
 <20240408190611.24914-3-ville.syrjala@linux.intel.com>
 <877cg4lla7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877cg4lla7.fsf@intel.com>
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

On Wed, May 08, 2024 at 12:12:32PM +0300, Jani Nikula wrote:
> On Mon, 08 Apr 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Replace the open coded drm_crtc_vblank_crtc() with the real
> > thing.
> >
> > Cc: intel-gfx@lists.freedesktop.org
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Ta. Pushed this one to to drm-intel-next since
drm_crtc_vblank_crtc() made it there in the meantime.

-- 
Ville Syrjälä
Intel
