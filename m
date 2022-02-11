Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEE44B273C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 14:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE7E10EC34;
	Fri, 11 Feb 2022 13:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F6010EC34;
 Fri, 11 Feb 2022 13:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644586432; x=1676122432;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=R0eaHqrJ1AwF0P4SdvpHRmUDKgRjAAoWy1pAWX3q6Sw=;
 b=Qx/P0fge3ubmV1a1IHuXMvfPbmg2qEgP7ppc9SpCwklKMLFqGgROVPlQ
 /2neXYvZrshwgaVZAjMlGt1Su6ckyMk1fOA/Y5bv4X55cDrvL246d/dBx
 FCO0M+Uz6WVzLcGH2T+pdUN7ubKSEew2zSKDMDsQtSpe7iJuZ9HUG6I1J
 ZJARfv6aFGDZ6mvrBw7/JNjaNbu39UJutHWRzSULa91oK4gx0MZ3exWiO
 QW5iJa0JN36jKuawho+VgAHGR2bi9pY1y6ApUFa/UZXOqTji05N9xnzGB
 w+YkSfyixNDpfYTJHXqtiXf2vFpW9HUaHDmTiDeelS4jkwa9KwQXsRqIx g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="313012806"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="313012806"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 05:33:52 -0800
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="702118679"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by orsmga005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 05:33:50 -0800
Date: Fri, 11 Feb 2022 19:04:00 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915/dg2: Add Wa_22011450934
Message-ID: <20220211133400.GC25847@intel.com>
References: <20220128185209.18077-1-ramalingam.c@intel.com>
 <20220128185209.18077-2-ramalingam.c@intel.com>
 <CAM0jSHMCtDPk7MydenJHBE1yrghqjx8YrfMMuz_Zm4-WDvTFHA@mail.gmail.com>
 <79cefb8f-3f71-a59e-28de-6b9a59c28c30@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <79cefb8f-3f71-a59e-28de-6b9a59c28c30@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.william.auld@gmail.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-07 at 11:52:48 +0000, Matthew Auld wrote:
> On 07/02/2022 11:48, Matthew Auld wrote:
> > On Fri, 28 Jan 2022 at 18:52, Ramalingam C <ramalingam.c@intel.com> wrote:
> > > 
> > > An indirect ctx wabb is implemented as per Wa_22011450934 to avoid rcs
> > > restore hang during context restore of a preempted context in GPGPU mode
> > > 
> > > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > > cc: Chris Wilson <chris.p.wilson@intel.com>
> > Acked-by: Matthew Auld <matthew.auld@intel.com>
> 
> Also, feel free to upgrade to r-b for this and patches 2-4.

Thank you Matt. I have pushed these changes to the tree.

Ram.
