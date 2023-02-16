Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE1A6997A7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 15:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA72A10E342;
	Thu, 16 Feb 2023 14:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7555D10E342
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676558452; x=1708094452;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dL00yM7gmDfndl3cwI6NV2MDqC0w+G5xyM82XUZpnno=;
 b=UlzktledyflXBpZWGLXVEYnBYSj6ERyegrp3e535FO27gGPLZh/74yLr
 aHmRfE3FGolG7OeoE188Nvp1tT8Q/OBrZSFNMRoOctjnqmsUEuGRjwt3c
 ZRU8yQaxG17Igoci/4Ane3sZgMQ+o/WswVTP3SG7eE+981zlMvg7mOBne
 jrjnIIYGVuupfIswGUEIlCsUSHM8ROt+486wTaOZEzuWfipuCGIU1+Nqm
 3mbFIFUfK6cCd8llxNiDbG2nR4UVLtfJLa4O9uoPom2NLujjKmISlFqvV
 vE05Wm+AP5l06IQAxaJR9Dy2vS3Q0ma07FsvC5ithjv0I/jJWazthqJ1c w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="394158301"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="394158301"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 06:40:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="663474393"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="663474393"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 06:40:36 -0800
Date: Thu, 16 Feb 2023 15:40:34 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Tomer Tayar <ttayar@habana.ai>
Subject: Re: [PATCH 06/27] habanalabs: use memhash_node_export_put() in
 hl_release_dmabuf()
Message-ID: <20230216144034.GI2849548@linux.intel.com>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
 <20230212204454.2938561-6-ogabbay@kernel.org>
 <20230216114817.GD2849548@linux.intel.com>
 <DU2PR02MB75736B78964EBB3644911C2AD2A09@DU2PR02MB7573.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU2PR02MB75736B78964EBB3644911C2AD2A09@DU2PR02MB7573.eurprd02.prod.outlook.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 02:26:50PM +0000, Tomer Tayar wrote:
> > This looks suspicious, I think hnode can be not-NULL here and has
> > hnode->vaddr different than searched addr, in case there is
> > hash collision and we iterate over hlist where there is no
> > searched addr. Not 100% sure about that though.
> > 
> > I think would be better to provide helper like this:
> > 
> > 	hash_for_each_possible(ctx->mem_hash, hnode, node, (unsigned
> > long)addr)
> > 		if (addr == hnode->vaddr)
> > 			return hnode;
> > 	return NULL;
> > 
> > which is basically standard way how hash_for_each_possible() used.
> > 
> > 
> > Regards
> > Stanislaw
> 
> Thanks Stanislaw, we will add such a helper and use it here and in another place with a similar pattern.
> If that is okay, we will do it in another patch, as this one only moves an existing function for code reuse.

Sure, no problem with that.

Regards
Stanislaw

