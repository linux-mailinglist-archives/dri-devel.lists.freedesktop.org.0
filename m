Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2907AFBA1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B02810E061;
	Wed, 27 Sep 2023 07:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AECE10E061;
 Wed, 27 Sep 2023 07:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695798258; x=1727334258;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JsAH8TGlgdMz7xgx/yWphSDB2jC7pb2BPccONHzjDHk=;
 b=WfLlz0AyI0NTn4U4TmuldHbPgAjU2UNDGdB4x2PCIy/ZO3jHExviGxE2
 TpOG/Net3cm6MfnKNTVR5KXf/4owtoXhCqy9M1tgZrr2SolqnIoGdGZZz
 fAwwZulXnVXIoyEHOJw8Go5yGXqy1RHP4UM9YMtlr+j/fr5ayFZg4o6nL
 TlvVl0ZW5DA6lCek89WR0uzhSNFIsGP0fsgebt1xhkPj8zuBumxunu5Xc
 BEZBkfiimbIZKB9/FrjbV3CtJWb6ErbSlj889N/vIidZwwhMpmoJZueYt
 vopCrsWFgWMiSj+nIMlVMEeFpULxE7G/v6UzkslcjTxo0CuR+YOvqz67n w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361134537"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="361134537"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 00:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="784216278"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="784216278"
Received: from yeehernc-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.214.173.104])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 00:04:12 -0700
Date: Wed, 27 Sep 2023 09:04:05 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v2] drm/i915/mtl: Skip MCR ops for ring fault register
Message-ID: <ZRPT5Vpn1uABZ7vc@ashyti-mobl2.lan>
References: <20230926215802.10822-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926215802.10822-1-nirmoy.das@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, matthew.d.roper@intel.com,
 andi.shyti@linux.intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Tue, Sep 26, 2023 at 11:58:02PM +0200, Nirmoy Das wrote:
> On MTL GEN12_RING_FAULT_REG is not replicated so don't
> do mcr based operation for this register.
> 
> v2: use MEDIA_VER() instead of GRAPHICS_VER()(Matt).
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

This looks very good!

> -	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> +	/*
> +	 * for media tile this ring fault register is not replicated
> +	 * so skip doing mcr ops on it.

Can we spare a few more words on "doing mcr ops on it"?

Andi
