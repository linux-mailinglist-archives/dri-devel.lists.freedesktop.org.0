Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDF958D063
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 01:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEC3A682C;
	Mon,  8 Aug 2022 23:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE344A6678;
 Mon,  8 Aug 2022 23:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660000198; x=1691536198;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=B4DoIHu/xE0J/XUD3RUk+6lgq5c+Oc/6QTYy8pBOzeA=;
 b=b5I+NoVJXUAM8iQ+yxpRmpvWt6FaBX74vZQbK1F21WWeo/UJpIzaZD3H
 ZdDmPiZIOXFJ0eE6iZOuw2VQiyU9e9qljfk+egeYkyYMetBUjdaxDczM9
 EEiiJ9NozYqlkXYJIotS9ePO0SdGlrR2rjL4CmrhhRkPcXfTW0tsn4/1A
 tYZ52IY9dynH0F6qVT8DgbUA7GZNbRjan77fORB28bBbSI9YEU23U+KpY
 4t/w6apE3sRQGgB9fHLiwK16bpSQOHYNHAnf6uqmjhZt5bdPC39X9OR+g
 ETWbJF3lSr3MdCumAcS6siL3/uaM8NR1iUMXggTx96nF/phi7oXs4MrvS A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="377002972"
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="377002972"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 16:09:57 -0700
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="664176757"
Received: from mkabdel-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.40.190])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 16:09:53 -0700
Date: Tue, 9 Aug 2022 01:09:51 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 1/3] drm/i915: pass a pointer for tlb
 seqno at vma_invalidate_tlb()
Message-ID: <YvGXv5td47ky+CnY@alfio.lan>
References: <cover.1659598090.git.mchehab@kernel.org>
 <f9550e6bacea10131ff40dd8981b69eb9251cdcd.1659598090.git.mchehab@kernel.org>
 <YvE75o0uOtDGayNK@alfio.lan> <YvFeLbUcC6yiCL5G@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvFeLbUcC6yiCL5G@intel.com>
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
Cc: Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Michael Cheng <michael.cheng@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

On Mon, Aug 08, 2022 at 03:04:13PM -0400, Rodrigo Vivi wrote:
> On Mon, Aug 08, 2022 at 06:37:58PM +0200, Andi Shyti wrote:
> > Hi Mauro,
> > 
> > On Thu, Aug 04, 2022 at 09:37:22AM +0200, Mauro Carvalho Chehab wrote:
> > > WRITE_ONCE() should happen at the original var, not on a local
> > > copy of it.
> > > 
> > > Fixes: 5d36acb7198b ("drm/i915/gt: Batch TLB invalidations")
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > 
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Thanks and pushed...

Thanks!

> > 
> > Are you going to send it to the stable mailing list?
> 
> I added cc stable while pushing and the cherry-pick to drm-intel-next-fixes
> has the right sha, so I'd assume this would be automagically now.
> But yeap, it would be good if Mauro can follow up whenever this gets
> to Linus tree and Greg's script start to pop up the heads-up messages.

That's what I meant... does Mauro now need to send the e-mail
again for the stable?

I thought there was some suspicion towards e-mails pushed without
being first sent to both stable and upstream mailing lists
because they can get lost or forgotten... maybe I'm wrong.

Andi

> Thanks,
> Rodrigo.
> 
> > 
> > Andi
