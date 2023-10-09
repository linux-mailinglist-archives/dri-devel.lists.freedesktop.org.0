Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 237F77BEAC9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 21:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122F610E18C;
	Mon,  9 Oct 2023 19:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76B610E18C;
 Mon,  9 Oct 2023 19:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696880649; x=1728416649;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CeuEV85nO2zKrbS3SEVVUhS8o0CnWqg6FDmqanSR9N4=;
 b=OrO9sy91Ji95kqoa/XR+76DOKC63Hndq5vtAXnVdlyl03ngXF9hAIfts
 tFUWgnzaOoayhCnbR2DBW4o4uGtxVNLoRq3dMxglAievh0SQ6446mfgKx
 J4YDexH8uHf2QOgt1hiSBpLA7rvqbFToHVcKMDBPQ34A/DXtWQJvHlE1f
 4addCSkXfdjFLjk/GP/BG9h7CzJKfMyzw4YO47+rsdWTrBgbBT0ml0wPt
 5Aakr5id6oAnXxMrOHkW2B0o9xTlcAL+iC+bQSYPEJZXovUGsGhXeZUzO
 OKQb6od6f6/yMdbkfiv11+12GQMr2oVbKizGk4kkVyGrQk+mt86qSJ+E1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="470495032"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="470495032"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 12:44:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="703032908"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="703032908"
Received: from ibrahim2-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.213.42.185])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 12:44:01 -0700
Date: Mon, 9 Oct 2023 21:43:55 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/print: Add drm_dbg_ratelimited
Message-ID: <ZSRX+0BB3Mf5diMC@ashyti-mobl2.lan>
References: <20231006132606.810110-1-andi.shyti@linux.intel.com>
 <ZSQv69bLHoOglE+T@ashyti-mobl2.lan>
 <2e44254d-5243-477a-8b2b-35623967ec1f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e44254d-5243-477a-8b2b-35623967ec1f@intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

> > > From: Nirmoy Das <nirmoy.das@intel.com>
> > > 
> > > Add a function for ratelimitted debug print.
> > > 
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Just a kind reminder!
> > 
> > This is the second time this patch has been sent and we have seen
> > some potential use of the drm_dbg_ratelimited().
> But this patch does not actually add a user. So it is dead code at this
> point, which is not allowed.
> 
> If you have code that wants to use such a helper then the helper should be
> part of the patch that adds that code.

this is the kind of "Argh! If I had it!" patch. At the 3/4th
"Argh! If I had it!" then you decide to send it but don't
remember for which case you needed it.

I'm sure that once this goes in won't be long until poeple will
start using it. In any case, if it doesn't go in I will keep it
ready until the case comes.

Andi
