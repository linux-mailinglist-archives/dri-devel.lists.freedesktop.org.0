Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B65B958D3C7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 08:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D438B8DE36;
	Tue,  9 Aug 2022 06:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F978D6E3;
 Tue,  9 Aug 2022 06:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660026569; x=1691562569;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vyIFmtqAbHdY0idNmSeJSH07tqTNSFTVNWQhsfMsQAg=;
 b=ki4xM2MhGMrFBceDfKbY940f6y1ANI2uQBgvS8MU+sNICQ0/z4AstcZI
 z3ue3A0xce9+fz1jaojJoa1LKA3xzpc4DjmAopTMI5JKZDygmlw5nOMLO
 NNjKMhSN+vQjX/OTV1Rt8L1guTDw0lsUn8Heiz+wvEbZ8ziZ7vuB67UPW
 20Y/QnhSqAK/r+PmdGW7UTh+qupycb/7MJtuaa0zZCT1YBYLkY3e0Lclw
 a1LjMK75psCDg5mRw5MUgrKGz3EdHPhgd2BuNWAZe04AgSXsXuVhZBW4e
 2dSPNBXl3z+/qTrNnlHKnUOUYvfxPW88sSGgIWXdEbw5x9a+Qbg0tRIn4 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="271151304"
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; d="scan'208";a="271151304"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 23:29:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; d="scan'208";a="664306799"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.252.48.55])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 23:29:25 -0700
Date: Tue, 9 Aug 2022 08:29:22 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 1/3] drm/i915: pass a pointer for tlb
 seqno at vma_invalidate_tlb()
Message-ID: <20220809082922.2dbd6c0c@maurocar-mobl2>
In-Reply-To: <aabd5eff13bde62966ca9ad2a483978e4557c55f.camel@intel.com>
References: <cover.1659598090.git.mchehab@kernel.org>
 <f9550e6bacea10131ff40dd8981b69eb9251cdcd.1659598090.git.mchehab@kernel.org>
 <YvE75o0uOtDGayNK@alfio.lan> <YvFeLbUcC6yiCL5G@intel.com>
 <YvGXv5td47ky+CnY@alfio.lan>
 <aabd5eff13bde62966ca9ad2a483978e4557c55f.camel@intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Cheng, Michael" <michael.cheng@intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "Auld,
 Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 9 Aug 2022 00:15:14 +0000
"Vivi, Rodrigo" <rodrigo.vivi@intel.com> wrote:

> On Tue, 2022-08-09 at 01:09 +0200, Andi Shyti wrote:
> > Hi Rodrigo,
> > 
> > On Mon, Aug 08, 2022 at 03:04:13PM -0400, Rodrigo Vivi wrote:
> > > On Mon, Aug 08, 2022 at 06:37:58PM +0200, Andi Shyti wrote:
> > > > Hi Mauro,
> > > > 
> > > > On Thu, Aug 04, 2022 at 09:37:22AM +0200, Mauro Carvalho Chehab
> > > > wrote:
> > > > > WRITE_ONCE() should happen at the original var, not on a local
> > > > > copy of it.
> > > > > 
> > > > > Fixes: 5d36acb7198b ("drm/i915/gt: Batch TLB invalidations")
> > > > > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > > 
> > > > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > 
> > > Thanks and pushed...
> > 
> > Thanks!
> > 
> > > > 
> > > > Are you going to send it to the stable mailing list?
> > > 
> > > I added cc stable while pushing and the cherry-pick to drm-intel-
> > > next-fixes
> > > has the right sha, so I'd assume this would be automagically now.
> > > But yeap, it would be good if Mauro can follow up whenever this
> > > gets
> > > to Linus tree and Greg's script start to pop up the heads-up
> > > messages.
> > 
> > That's what I meant... does Mauro now need to send the e-mail
> > again for the stable?
> > 
> > I thought there was some suspicion towards e-mails pushed without
> > being first sent to both stable and upstream mailing lists
> > because they can get lost or forgotten... maybe I'm wrong.
> 
> It doesn't help to send now to stable ml because it can only be merged
> there after it reaches the Linus' master tree.
> Right now with the right fixes and cc:stable it should be automatically
> and he shouldn't worry.
> But in case he notices that the first patch got in but the second
> didn't then it is when we send the patch directly to the stable ml.

I sent a heads-up to Greg to warn him about the issue. I'll keep my eyes
on the -stable automatic e-mails to double-check that they'll both be
merged altogether.

Thanks!
Mauro

> 
> 
> > 
> > Andi
> > 
> > > Thanks,
> > > Rodrigo.
> > > 
> > > > 
> > > > Andi
> 
