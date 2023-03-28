Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7746CBBE4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 12:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C880310E45E;
	Tue, 28 Mar 2023 10:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596A410E45A;
 Tue, 28 Mar 2023 10:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679998053; x=1711534053;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IgA5KGe5gHqlZ/siQWqV6gU3W6l3X63NbdaTCUgGatw=;
 b=BtXlCxW+DA7WQqzsizviwbPECmJibztT/3xSmzMksf5SoyH8mXXe1fsW
 b8UDvvfzMKFRqq3gVLkfEdQ8mbFbZ+7Go2v21cEUnhq6RBdtI+zrIvcxU
 trPTDfq8shT/UwstYWSoKvA7VK9vNBWwafrDjOvLMAD3e9JXt20kVo9/D
 +qZkX3tKyiJYZQCS7rc/hTfOfxfxk4QqFbQsA2HHEDA8DFTokuMsNKR92
 jrE2PAQ/aduJr0YAnevN7lRmywaoeK0KPRgu1M5DuOlgflF2mnLItfcJ+
 tDmmk9rWJRmOxHus3T7mke6JYjZdPF5zH1wrTRkgyzFz3RMs1dBZzh+Sh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="324421005"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="324421005"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 03:07:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="753080963"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="753080963"
Received: from mgaucher-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.63.207])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 03:07:30 -0700
Date: Tue, 28 Mar 2023 12:07:04 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Fix MTL stolen memory GGTT
 mapping
Message-ID: <ZCK8SKwU3nOmL5KL@ashyti-mobl2.lan>
References: <20230328012430.2524330-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328012430.2524330-1-daniele.ceraolospurio@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniele,

On Mon, Mar 27, 2023 at 06:24:30PM -0700, Daniele Ceraolo Spurio wrote:
> The PTEs expect the offset from the base of the fake LMEM region (i.e.
> the base of stolen) and not from the base of the DSM. Quoting the specs:
> "Driver will set the Device Memory bit = 1 in the PTE when pointing to a
> page in DSM and program the PTE with offset from LMEM_BAR. Device Memory
> Offset from LMEM_BAR is same as offset from BGSM."
> 
> DSM starts 8MBs from BGSM, so we set dsm_base = 8MB.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
