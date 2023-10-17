Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A55F47CC617
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 16:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A7810E2FF;
	Tue, 17 Oct 2023 14:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC3310E2FF;
 Tue, 17 Oct 2023 14:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697553770; x=1729089770;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jVLKcMmlSbBQzVQDSw8gizK6mZLf1UqqnO/aYgkvDAA=;
 b=lpLhs6up+UD14qsHST5NghNXj+qdiISkH3C6Hyk3Y64bL6nPLkyornc9
 a5HZPFlhWGz1zb0hbeYX9ajyvgZvGlWv0oiufCNmFH0HCnacMJWaWrEJJ
 BlQ+W7mPKE5AnUmWimbxpGTdv/tyGEvfci2ZvxbfehU+4k5NNXHydhe7n
 hpEQwTZEXPEYJp3Htndjp9KNQoMLwqB5zDXyT83lYa6uAEVxAKIH0FDOU
 X5HeGMuGvBxw6q8gVK7VmkeIsLytplOxYgexxLNvvKCFFU+fG4rHdobO8
 /e06pUaKn0NoUnXXLFkC1qwSPyDiAiogrMWyBklL7bjffyNVLmPCdwFlJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="370863567"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="370863567"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 07:42:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="1087534295"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="1087534295"
Received: from hanisahi-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.214.165.149])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 07:42:36 -0700
Date: Tue, 17 Oct 2023 16:42:30 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Don't set PIPE_CONTROL_FLUSH_L3
Message-ID: <ZS6dVvH9yoFu+Uvy@ashyti-mobl2.lan>
References: <20231016225530.2152896-1-vinay.belgaumkar@intel.com>
 <ee2be6d4-1bc6-4516-80cb-408ad6731787@intel.com>
 <2b364a80-3d18-17b8-495b-e9a2a9f3c197@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b364a80-3d18-17b8-495b-e9a2a9f3c197@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Mikka Kuoppala <mika.kuoppala@intel.com>,
 dri-devel@lists.freedesktop.org, John Harrison <john.c.harrison@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinay,

> > > This bit does not cause an explicit L3 flush. We already use
> > At all? Or only on newer hardware? And as a genuine spec change or as a
> > bug / workaround?
> > 
> > If the hardware has re-purposed the bit then it is probably worth at
> > least adding a comment to the bit definition to say that it is only
> > valid up to IP version 12.70.
> At this point, this is a bug on MTL since this bit is not related to L3
> flushes as per spec. Regarding older platforms, still checking the reason
> why this was added (i.e if it fixed something and will regress if removed).
> If not, we can extend the change for others as well in a separate patch. On
> older platforms, this bit seems to cause an implicit flush at best.
> > 
> > > PIPE_CONTROL_DC_FLUSH_ENABLE for that purpose.
> > > 
> > > Cc: Nirmoy Das <nirmoy.das@intel.com>
> > > Cc: Mikka Kuoppala <mika.kuoppala@intel.com>
> > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 8 ++++++--
> > >   1 file changed, 6 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > > b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > > index ba4c2422b340..abbc02f3e66e 100644
> > > --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > > +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > > @@ -247,6 +247,7 @@ static int mtl_dummy_pipe_control(struct
> > > i915_request *rq)
> > >   int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
> > >   {
> > >       struct intel_engine_cs *engine = rq->engine;
> > > +    struct intel_gt *gt = rq->engine->gt;
> > >         /*
> > >        * On Aux CCS platforms the invalidation of the Aux
> > > @@ -278,7 +279,8 @@ int gen12_emit_flush_rcs(struct i915_request
> > > *rq, u32 mode)
> > >            * deals with Protected Memory which is not needed for
> > >            * AUX CCS invalidation and lead to unwanted side effects.
> > >            */
> > > -        if (mode & EMIT_FLUSH)
> > > +        if ((mode & EMIT_FLUSH) &&
> > > +            !(IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))))
> > Why stop at 12.71? Is the meaning only changed for 12.70 and the
> > old/correct version will be restored in later hardware?
> 
> Was trying to keep this limited to MTL for now until the above statements
> are verified.

I'm not fully conviced here... this is not what the hardware spec
says. Am I reading the specs wrong?

Is there any ongoing discussion with the hardware developers?

Andi
