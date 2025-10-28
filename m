Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A59BC16D34
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 21:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E273610E182;
	Tue, 28 Oct 2025 20:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMVR2UUq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823DC10E149;
 Tue, 28 Oct 2025 20:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761684769; x=1793220769;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MrFmi4nutVJ88C6N9UIN60oxiHIesmpQ4tsvTyjR+Ts=;
 b=CMVR2UUq8sqzIyCXLKKJWYpuwGTztctRN2Ck33tCkjy+z6JAcN70rAhm
 KbPyN1v8w/kpWfZ+OD/E3xAV4kWSRKYiDia6B62A2UHXZ/nBb6wzgbjpt
 Fl2TFJjWZbdGUjJeuVINymt5dYcL4pI5Bct1Rg3BWeEye0SBh6WHGTVaR
 4aIeTdFwI8HL59oKMCITtmkJ3q+nom6KQKrex/fLlJ5tbVuRhmeQlN8jg
 xOEECwWiSAKnPkui70dcRvewilr0hsiUSWHjdr/cojtAACR2XmOH61aSt
 tvQVEDkCiF+LiUWKi1D2VqDez8DY3SNIXdrcl7sAoYqBBbkP8PyFSmDCl g==;
X-CSE-ConnectionGUID: t6C4/db8RqKUD1D6IEJnSw==
X-CSE-MsgGUID: M1IdLbPnSSm6nu3ZHCr9CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67440085"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="67440085"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:52:49 -0700
X-CSE-ConnectionGUID: opDK6Fe4SQyJydL/YF5G1Q==
X-CSE-MsgGUID: gKdLiDTtTL2UdTwLcAaHHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="222679629"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.169])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:52:46 -0700
Date: Tue, 28 Oct 2025 22:52:43 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH 2/2] drm/atomic: WARN about invalid drm_foo_get_state()
 usage
Message-ID: <aQEtG0CbmPxLMiQD@intel.com>
References: <20251017163327.9074-2-ville.syrjala@linux.intel.com>
 <6bccb6ce0672f5b736bb8669060d8005@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6bccb6ce0672f5b736bb8669060d8005@kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, Oct 20, 2025 at 07:29:49AM +0000, Maxime Ripard wrote:
> On Fri, 17 Oct 2025 19:33:27 +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > drm_{crtc,plane,connector,private_obj}_get_state() must not
> > be called after the atomic check phase. At that point the commit
> > has been carved in stone and no new objects must be introduced
> > 
> > [ ... ]
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks. This is now in, so I guess we'll see if there are further
issues still remaining anywhere.

After any initial fires have been put out, I'm thinking we should
change the implementation from just WARN to "WARN+return an error"...

-- 
Ville Syrjälä
Intel
