Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD489689D33
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 16:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213ED10E7CD;
	Fri,  3 Feb 2023 15:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248A810E7C0;
 Fri,  3 Feb 2023 15:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675436956; x=1706972956;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dDXulvyNwPtFpDiJ7+TPE2SX8thC6ozOW4bx2sfpBpc=;
 b=Ciu7wSa2Z6x0XuOyXdGE7pwiufgFxPMsk4+RcFuJwhC5oe9zlFYiuRDP
 BnN54HMdkt3PuRG3MmVnAnmpR2V+y51KbAr0c2eBmAdS5rP+mOS2djIYH
 rWl4G02jCrm835lLGBekJT/Cm57o6DRUHy5B9jqDYX22BtZhU7CTMmA3r
 9IOAqj1VC1Qrw+TSx3ELecoPaLjq6E4QPLEYUvJnM5mNmFqqY6gyzHiQ6
 KoxX+eBHWluOus5enAWwxQ2sLEaO8p5Vc1UEySoAx8xhl26wBormLv6VJ
 EkFCFUu4uJag6pGhUKrk1yF0HmdTnUVwc+YqpvckRQcJtkVs/ZkjRUiEi g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330897762"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="330897762"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 07:08:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729289575"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="729289575"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 07:08:35 -0800
Date: Fri, 3 Feb 2023 16:08:34 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 00/19] fix DRM_USE_DYNAMIC_DEBUG regression
Message-ID: <20230203150834.GA2751526@linux.intel.com>
References: <20230125203743.564009-1-jim.cromie@gmail.com>
 <87a61v14ad.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a61v14ad.fsf@intel.com>
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 03, 2023 at 11:34:02AM +0200, Jani Nikula wrote:
> On Wed, 25 Jan 2023, Jim Cromie <jim.cromie@gmail.com> wrote:
> > Hi everyone,
> >
> > In v6.1 DRM_USE_DYNAMIC_DEBUG=y has a regression enabling drm.debug in
> > drivers at modprobe.
> 
> I realize we haven't actually addressed the regression in any way yet,
> and any distro enabling DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE will have
> DRM_USE_DYNAMIC_DEBUG=y by default, and we're hitting the issue with
> trying to gather logs from users on v6.1 or later. It hampers debugging
> pretty badly.
> 
> I appreciate the effort in fixing the problem properly here, but we'll
> need a fix that we can backport to stable kernels.
> 
> Maybe just Ville's idea of
> 
>  config DRM_USE_DYNAMIC_DEBUG
>         bool "use dynamic debug to implement drm.debug"
> -       default y
> +       default n
> +       depends on BROKEN
>         depends on DRM
>         depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
> 
> but we'll need that as a patch and merged and backported ASAP.

+1 for this

Regards
Stanislaw
