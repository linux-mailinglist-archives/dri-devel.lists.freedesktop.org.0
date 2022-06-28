Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 539CE55BFF1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 11:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C1412B35F;
	Tue, 28 Jun 2022 09:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E04412B35A;
 Tue, 28 Jun 2022 09:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656410260; x=1687946260;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=g3rAJjJUpoRtHJrnWc1+vR69IDr1sX4xKoYaGaW/7aM=;
 b=MQgj5D1Kt06ap80nTzCWvE8OCn3+esl/CBDUp/gHX9BbfobLNiHXrKZ/
 KnE3LLDnQ29cQ+UynD4LvTLrfMtONsgucjTAOzrZ46pcxwQ3uFBHOrnxj
 dMFJ9Wsh/v4EsZRirktrrVxr8ytv2WvsmLoFr+MyCKsCZhmt7kLPQ+CON
 4DrQPOCNpQwjqkmeSpQmynldUlyXamnSw4CGtRS2y+NfYJNsQwxsUSQYW
 Za1fc6HtClPLQFgjYHwj+3V45hL0Ikzg+bvKKxlnantBAY0tEflJy+d/5
 zA2JuYoKfUMbzomHlF+1yWv8w0NrIHN2LZEC4K5vPx09t94NUbnebD4Ds g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="281734550"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="281734550"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 02:57:39 -0700
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="646848374"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by fmsmga008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 02:57:38 -0700
Date: Tue, 28 Jun 2022 15:29:17 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/i915/gt: handle null ptr at sg traversing
Message-ID: <20220628095916.GA18011@intel.com>
References: <20220627173539.29094-1-ramalingam.c@intel.com>
 <61281f78-407f-8953-acd3-2de1b306e741@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <61281f78-407f-8953-acd3-2de1b306e741@intel.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-06-28 at 10:40:56 +0100, Matthew Auld wrote:
> On 27/06/2022 18:35, Ramalingam C wrote:
> > When calculating the starting address for ccs data in smem scatterlist,
> > handle the NULL pointer returned from sg_next, incase of scatterlist
> > less than required size..
> 
> Do we have some more information on how we can hit this? Is this a
> programmer error? Do we have a testcase?
Typically We will never get NULL at this point, as we allocate the smem
of sz equal to lmem obj size + requiured ccs size. So we will never run
into NULL when we traverse the sg for the size of lmem in smem's sg.

IF there is NULL returned in this scenario we could report BUG_ON or let
it NPD or return the error code.

But either way couldn't think of a scenario when this will hit. after
thinking further seems to be leaving the NPD itself sufficient as other
error handling also not doing good job at it. Please share your thoughts

Ram
> 
> > 
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_migrate.c | 13 ++++++++++---
> >   1 file changed, 10 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> > index 2c35324b5f68..c206fb4f4186 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> > @@ -669,7 +669,7 @@ calculate_chunk_sz(struct drm_i915_private *i915, bool src_is_lmem,
> >   	}
> >   }
> > -static void get_ccs_sg_sgt(struct sgt_dma *it, u32 bytes_to_cpy)
> > +static int get_ccs_sg_sgt(struct sgt_dma *it, u32 bytes_to_cpy)
> >   {
> >   	u32 len;
> > @@ -684,9 +684,13 @@ static void get_ccs_sg_sgt(struct sgt_dma *it, u32 bytes_to_cpy)
> >   		bytes_to_cpy -= len;
> >   		it->sg = __sg_next(it->sg);
> > +		if (!it->sg)
> > +			return -EINVAL;
> >   		it->dma = sg_dma_address(it->sg);
> >   		it->max = it->dma + sg_dma_len(it->sg);
> >   	} while (bytes_to_cpy);
> > +
> > +	return 0;
> >   }
> >   int
> > @@ -745,8 +749,11 @@ intel_context_migrate_copy(struct intel_context *ce,
> >   		 * Need to fix it.
> >   		 */
> >   		ccs_bytes_to_cpy = src_sz != dst_sz ? GET_CCS_BYTES(i915, bytes_to_cpy) : 0;
> > -		if (ccs_bytes_to_cpy)
> > -			get_ccs_sg_sgt(&it_ccs, bytes_to_cpy);
> > +		if (ccs_bytes_to_cpy) {
> > +			err = get_ccs_sg_sgt(&it_ccs, bytes_to_cpy);
> > +			if (err)
> > +				return err;
> > +		}
> >   	}
> >   	src_offset = 0;
