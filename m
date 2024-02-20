Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CD785B290
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 07:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCAB10E04C;
	Tue, 20 Feb 2024 06:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="MmrXIEPJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8C39110E04C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 06:02:17 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1134)
 id 3A9A220B2000; Mon, 19 Feb 2024 22:02:17 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3A9A220B2000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1708408937;
 bh=PPoSUXeB6zRIX7Zi7HPGjneiE6SaP9iHR6fDjGL5kCU=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=MmrXIEPJ0Z5ihryAmXvf/QmfzvFLW/Mz8jB7Nff7oretJPnlYvhsHarBC03s23Fzh
 bZpv+QZix/4bH9jOUPtDrCDzrFIt6+vA/rugZav9Glmfb/FruTlRv74ThUvVkx6Huw
 B/hENEWQauktVL/zPy734bIKKI/cuV2cAy+dFKmk=
Date: Mon, 19 Feb 2024 22:02:17 -0800
From: Shradha Gupta <shradhagupta@linux.microsoft.com>
To: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.dev>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Saurabh Singh Sengar <ssengar@linux.microsoft.com>,
 Shradha Gupta <shradhagupta@microsoft.com>
Subject: Re: [PATCH v4 0/2] drm: Check polling initialized before
Message-ID: <20240220060217.GA14395@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1706856176-9483-1-git-send-email-shradhagupta@linux.microsoft.com>
 <ZcI9Mw-MclTtkbwe@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZcI9Mw-MclTtkbwe@phenom.ffwll.local>
User-Agent: Mutt/1.5.21 (2010-09-15)
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

Gentle reminder to consume this patchset.

On Tue, Feb 06, 2024 at 03:07:47PM +0100, Daniel Vetter wrote:
> On Thu, Feb 01, 2024 at 10:42:56PM -0800, Shradha Gupta wrote:
> > This patchset consists of sanity checks before enabling/disabling
> > output polling to make sure we do not call polling enable and disable
> > functions when polling for the device is not initialized or is now
> > uninitialized(by drm_kms_helper_poll_fini() function)
> > 
> > The first patch consists of these checks in
> > drm_kms_helper_poll_disable() and drm_kms_helper_poll_enable() calls.
> > It further flags a warning if a caller violates this. It also adds
> > these checks in drm_mode_config_helper_resume() and
> > drm_mode_config_helper_suspend() calls to avoid this warning.
> > 
> > The second patch adds a similar missing check in
> > drm_helper_probe_single_connector_modes() function that is exposed by
> > the new warning introduced in the first patch.
> > 
> > Shradha Gupta (2):
> >   drm: Check output polling initialized before disabling
> >   drm: Check polling initialized before enabling in
> >     drm_helper_probe_single_connector_modes
> 
> On the series:
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> > 
> >  drivers/gpu/drm/drm_modeset_helper.c | 19 ++++++++++++++++---
> >  drivers/gpu/drm/drm_probe_helper.c   | 21 +++++++++++++++++----
> >  2 files changed, 33 insertions(+), 7 deletions(-)
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
