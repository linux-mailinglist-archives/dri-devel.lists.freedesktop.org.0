Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D37450A17F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 16:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3129610E5DE;
	Thu, 21 Apr 2022 14:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65DE10E433;
 Thu, 21 Apr 2022 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650549843; x=1682085843;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WmLUG+wgMS4gwKqYaDoaLmeCVcIa+MSlNnYacrvIA9A=;
 b=ibyusumxokeKPs/jxJny98c/awBtVP1Cl0IP8TtPg5pL/qWPSxQ/fym9
 nyQ5jdsUVGF3pR/1iDbfjBHqiqsTxk7fFbfCgJndAANdddOBmhkFCTN1w
 98kd31R3DBIOKit4PWpMSdq2ORRoA0Tj1NyHYbMBknFFpuHctg8kMWFtX
 yMsZPo7RVLMC2DtCdGFf2cRziAvzG1IaYqRSikMw89y3WXrwL3/Xipuct
 NPDs0VCtSbw+wDQyN8Jt3ktrKmVIbvaqWa9lKkGv2rssSO8DHUdoTiR4P
 e9EknpeRKn0nR9zrvDrmgbSB7Y3C2di98Nsa7yi8x0XGVKLm1OpSiL+nB Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="246254780"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="246254780"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 07:04:03 -0700
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="648143599"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by fmsmga003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 07:04:01 -0700
Date: Thu, 21 Apr 2022 19:34:56 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Subject: Re: [PATCH 1/4] drm/i915/gt: GEM_BUG_ON unexpected NULL at
 scatterlist walking
Message-ID: <20220421140455.GF18679@intel.com>
References: <20220421113813.30796-1-ramalingam.c@intel.com>
 <20220421113813.30796-2-ramalingam.c@intel.com>
 <173edd6c6f5de5d6e596d9df109bfd019ce6ca14.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173edd6c6f5de5d6e596d9df109bfd019ce6ca14.camel@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-04-21 at 18:57:59 +0530, Hellstrom, Thomas wrote:
> On Thu, 2022-04-21 at 17:08 +0530, Ramalingam C wrote:
> > While locating the start of ccs scatterlist in smem scatterlist, that
> > has
> > to be the size of lmem obj size + corresponding ccs data size. Report
> > bug
> > if scatterlist terminate before that length.
> >
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_migrate.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c
> > b/drivers/gpu/drm/i915/gt/intel_migrate.c
> > index 9d552f30b627..29d761da02c4 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> > @@ -687,6 +687,12 @@ static void get_ccs_sg_sgt(struct sgt_dma *it,
> > u32 bytes_to_cpy)
> >                 bytes_to_cpy -= len;
> >
> 
> 
> >                 it->sg = __sg_next(it->sg);
> 
> If bytes_to_cpy == 0 here, couldn't it->sg be NULL then?
Hi,

bytes_to_cpy is the lmem size and the scatterlist is the length of
bytes_to_cpy + GET_CCS_BYTES(bytes_to_cpy). So this should not be null.

when bytes_to_cpy reduces to zero we will be having the start of the scatterlist
for ccs.

Ram.
> 
> > +
> > +               /*
> > +                * scatterlist supposed to be the size of
> > +                * bytes_to_cpy + GET_CCS_BYTES(bytes_to_copy).
> > +                */
> > +               GEM_BUG_ON(!it->sg);
> >                 it->dma = sg_dma_address(it->sg);
> >                 it->max = it->dma + sg_dma_len(it->sg);
> >         } while (bytes_to_cpy);
> 
> /Thomas
> 
