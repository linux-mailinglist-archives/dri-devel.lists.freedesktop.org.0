Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B937542B4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 20:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FA310E314;
	Fri, 14 Jul 2023 18:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FC510E2DF;
 Fri, 14 Jul 2023 18:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689360149; x=1720896149;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hYKo7su7u2gAY/CVwklV+f6j8aLNS2V8V8EYn5Idbuw=;
 b=Q/BCl6pAVFrNo/ioKQ8lcn2zXnUiXr8wsTkA3itKcVt/c8YvutyYA8/c
 FoHrkppRVXmSPLOTXuL8X88qW2OlrlRfxIyrbecnVII1WZSBHh0b3VyIy
 doMR/Ef0rW74aVWgWPdrfMFYPT0TQadi73ou16kV6QLzdGJ4UkFU2bMlL
 /J+gjljuf3LYtAGekmX89yD6l5SnH1XUtQ3fzGPFCuySR5fCt2WroYYWf
 TpdgkFhLhHCl4+CKJx0x00wDwq9Ok7cP/K1xJzJ5v5MdhUpKbtZMgp4u1
 QtQPtJDJFHnzQ+EXRpQ+nU9IT/pTFm9Th7kPSUOS9fVD1qnxhUuJnA1Rv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="363012986"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; d="scan'208";a="363012986"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 11:42:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="812551454"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; d="scan'208";a="812551454"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by FMSMGA003.fm.intel.com with SMTP; 14 Jul 2023 11:42:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 14 Jul 2023 21:42:24 +0300
Date: Fri, 14 Jul 2023 21:42:24 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] dma-buf/dma-resv: Stop leaking on krealloc() failure
Message-ID: <ZLGXEMdvBAVaNICJ@intel.com>
References: <20230713194745.1751-1-ville.syrjala@linux.intel.com>
 <defcbed9-7cfc-9499-9e08-02a06390cc8f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <defcbed9-7cfc-9499-9e08-02a06390cc8f@amd.com>
X-Patchwork-Hint: comment
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
Cc: linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 14, 2023 at 08:56:15AM +0200, Christian König wrote:
> Am 13.07.23 um 21:47 schrieb Ville Syrjala:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Currently dma_resv_get_fences() will leak the previously
> > allocated array if the fence iteration got restarted and
> > the krealloc_array() fails.
> >
> > Free the old array by hand, and make sure we still clear
> > the returned *fences so the caller won't end up accessing
> > freed memory. Some (but not all) of the callers of
> > dma_resv_get_fences() seem to still trawl through the
> > array even when dma_resv_get_fences() failed. And let's
> > zero out *num_fences as well for good measure.
> >
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Fixes: d3c80698c9f5 ("dma-buf: use new iterator in dma_resv_get_fences v3")
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Good catch, Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Should I add a CC: stable and push to drm-misc-fixes?

Sure, if you don't mind. Thanks.

> 
> Thanks,
> Christian.
> 
> > ---
> >   drivers/dma-buf/dma-resv.c | 13 +++++++++----
> >   1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > index b6f71eb00866..38b4110378de 100644
> > --- a/drivers/dma-buf/dma-resv.c
> > +++ b/drivers/dma-buf/dma-resv.c
> > @@ -571,6 +571,7 @@ int dma_resv_get_fences(struct dma_resv *obj, enum dma_resv_usage usage,
> >   	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> >   
> >   		if (dma_resv_iter_is_restarted(&cursor)) {
> > +			struct dma_fence **new_fences;
> >   			unsigned int count;
> >   
> >   			while (*num_fences)
> > @@ -579,13 +580,17 @@ int dma_resv_get_fences(struct dma_resv *obj, enum dma_resv_usage usage,
> >   			count = cursor.num_fences + 1;
> >   
> >   			/* Eventually re-allocate the array */
> > -			*fences = krealloc_array(*fences, count,
> > -						 sizeof(void *),
> > -						 GFP_KERNEL);
> > -			if (count && !*fences) {
> > +			new_fences = krealloc_array(*fences, count,
> > +						    sizeof(void *),
> > +						    GFP_KERNEL);
> > +			if (count && !new_fences) {
> > +				kfree(*fences);
> > +				*fences = NULL;
> > +				*num_fences = 0;
> >   				dma_resv_iter_end(&cursor);
> >   				return -ENOMEM;
> >   			}
> > +			*fences = new_fences;
> >   		}
> >   
> >   		(*fences)[(*num_fences)++] = dma_fence_get(fence);

-- 
Ville Syrjälä
Intel
