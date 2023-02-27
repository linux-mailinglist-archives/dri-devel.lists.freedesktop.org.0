Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA956A47AF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 18:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C13D10E441;
	Mon, 27 Feb 2023 17:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8F110E441
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 17:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677518141; x=1709054141;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HEz3CJUXlV/zWn0/lsDpYmBYVCX0qvkRTSXlFLe1sXs=;
 b=PYXd23g0mdUIYbR6it7RFD6Ga6uA3rIbTi1gxu51XomoYWOhVl9rP7dG
 qsDuI5U2T6DteKJKctXAyyHwVKGL8yh4qfg+Ul+eRoAeNfh8ohC9qsPJ1
 tnj8GS0KDFNwWD6T0N9eCibUAo8EwTjZF145Twy/cdp+IXf8HSFEw0THd
 YzMeBs4yyYp0Lg6XZrekEt33z1JxcN4w4xGZiCLMKwrzCtR0pDJfzme6q
 xTZQRT0hURNedbhMijpSTp2EvP7BTtS/Ely+qjjMmXsoU2s53wCT3paZH
 Dk5wNlJ1zCJXn2ZvN0OCY6pbPJjCqu90wvytR+weqrwKvbUcFBIdP39Xv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="396469007"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; d="scan'208";a="396469007"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 09:14:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="816748087"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; d="scan'208";a="816748087"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 09:14:56 -0800
Date: Mon, 27 Feb 2023 18:14:54 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v2 5/8] accel/qaic: Add datapath
Message-ID: <20230227171454.GF3547587@linux.intel.com>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <1675698105-19025-6-git-send-email-quic_jhugo@quicinc.com>
 <20230224152546.GB3547587@linux.intel.com>
 <00914fa9-8618-a3ef-d3c5-2a3bba68fa1f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00914fa9-8618-a3ef-d3c5-2a3bba68fa1f@quicinc.com>
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
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ogabbay@kernel.org, dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com,
 jacek.lawrynowicz@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 12:36:51PM -0700, Jeffrey Hugo wrote:
> > > +static int reserve_pages(unsigned long start_pfn, unsigned long nr_pages,
> > > +			 bool reserve)
> > > +{
> > > +	unsigned long pfn;
> > > +	unsigned long end_pfn = start_pfn + nr_pages;
> > > +	struct page *page;
> > > +
> > > +	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
> > > +		if (!pfn_valid(pfn))
> > > +			return -EINVAL;
> > > +		page =  pfn_to_page(pfn);
> > > +		if (reserve)
> > > +			SetPageReserved(page);
> > > +		else
> > > +			ClearPageReserved(page);
> > 
> > It is needed? Looks like taken from some legacy code.
> 
> Required for remap_pfn_range().

PG_reserved is not required any longer for remap_pfn_range(), here
is excerpt from comment from include/linux/page-flags.h :

 * Some PG_reserved pages will be excluded from the hibernation image.
 * PG_reserved does in general not hinder anybody from dumping or swapping
 * and is no longer required for remap_pfn_range(). ioremap might require it.
 * Consequently, PG_reserved for a page mapped into user space can indicate
 * the zero page, the vDSO, MMIO pages or device memory.

> > > +static int copy_sgt(struct qaic_device *qdev, struct sg_table **sgt_out,
> > > +		    struct sg_table *sgt_in, u64 size, u64 offset)
> > > +{
> > > +	int total_len, len, nents, offf = 0, offl = 0;
> > > +	struct scatterlist *sg, *sgn, *sgf, *sgl;
> > > +	struct sg_table *sgt;
> > > +	int ret, j;
> > > +
> > > +	/* find out number of relevant nents needed for this mem */
> > > +	total_len = 0;
> > > +	sgf = NULL;
> > > +	sgl = NULL;
> > > +	nents = 0;
> > > +
> > > +	size = size ? size : PAGE_SIZE;
> > > +	for (sg = sgt_in->sgl; sg; sg = sg_next(sg)) {
> > > +		len = sg_dma_len(sg);
> > > +
> > > +		if (!len)
> > > +			continue;
> > > +		if (offset >= total_len && offset < total_len + len) {
> > > +			sgf = sg;
> > > +			offf = offset - total_len;
> > > +		}
> > > +		if (sgf)
> > > +			nents++;
> > > +		if (offset + size >= total_len &&
> > > +		    offset + size <= total_len + len) {
> > > +			sgl = sg;
> > > +			offl = offset + size - total_len;
> > > +			break;
> > > +		}
> > > +		total_len += len;
> > > +	}
> > > +
> > > +	if (!sgf || !sgl) {
> > > +		ret = -EINVAL;
> > > +		goto out;
> > > +	}
> > > +
> > > +	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
> > > +	if (!sgt) {
> > > +		ret = -ENOMEM;
> > > +		goto out;
> > > +	}
> > > +
> > > +	ret = sg_alloc_table(sgt, nents, GFP_KERNEL);
> > > +	if (ret)
> > > +		goto free_sgt;
> > > +
> > > +	/* copy relevant sg node and fix page and length */
> > > +	sgn = sgf;
> > > +	for_each_sgtable_sg(sgt, sg, j) {
> > > +		memcpy(sg, sgn, sizeof(*sg));
> > > +		if (sgn == sgf) {
> > > +			sg_dma_address(sg) += offf;

This looks a bit suspicious. Are you sure you can modify
sg->dma_address and still use it as valid value ?

> > > +			sg_dma_len(sg) -= offf;
> > > +			sg_set_page(sg, sg_page(sgn),
> > > +				    sg_dma_len(sg), offf);
> > > +		} else {
> > > +			offf = 0;
> > > +		}
> > > +		if (sgn == sgl) {
> > > +			sg_dma_len(sg) = offl - offf;
> > > +			sg_set_page(sg, sg_page(sgn),
> > > +				    offl - offf, offf);
> > > +			sg_mark_end(sg);
> > > +			break;
> > > +		}
> > > +		sgn = sg_next(sgn);
> > > +	}
> > 
> > Why not use sg_copy_table() ? Overall copy_sgt() seems to be something
> > that could be replaced by generic helper or at least simplify.
> 
> I don't see "sg_copy_table" defined in 6.2. 

Because there is no such function in any kernel source. It was only my
imagination, not sure right now how I came up with this function name :-/
Sorry about confusion.

There are only sg_copy_{to,from}_buffer(), but not really useful in
this case.

> Are you suggesting renaming
> this function?  I guess I'm not quite understanding your comment here. Can
> you elaborate?

Renaming would be nice. I was thinking by simplifying it, not sure
now if that's easy achievable, though.

Regards
Stanislaw


