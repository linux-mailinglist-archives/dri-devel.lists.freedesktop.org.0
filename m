Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D00473117
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 17:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9CF89292;
	Mon, 13 Dec 2021 16:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE9889292;
 Mon, 13 Dec 2021 16:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639411356; x=1670947356;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=980G/17/cPf9ib/kPiRwCuEEfBn5w1Rt8kaFq1oJ674=;
 b=hg4mGmCDTwY6TcbbDRiafLp8ss1nsOUQQDc66Y64FWv/YR8PUJF5CerF
 1q/ERRuaK+ntfK0MFS+r9dGR35kMe7fwuCD8bR5KWHhNo9O/OxMSq0/yo
 JOrm3Taad9VGZLW0WaO9RH+vDF/DX5oEvbWXszgY+GXg1qIbZdG3+1eFJ
 6StEbr1LW7/jQ1LiCVkvEfAsO1bQVcSnY1rie+bXBmW8DqglPaDplrWBl
 piIJPsFMoBln78LfT9ZmFoM1O9wxzFyQHyaPvP7Dr50bHfcCmYhAdKnn2
 Xcj+tWP7QT48T3XZ1jBcJ8R8QT5FEZ9r2ijIa/8byi5QBTreuiywfJNGf g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="237496473"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="237496473"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 08:02:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="660894514"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 08:02:24 -0800
Date: Mon, 13 Dec 2021 08:02:23 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/7] drm/i915: Replace kmap() with kmap_local_page()
Message-ID: <20211213160223.GN3538886@iweiny-DESK2.sc.intel.com>
References: <20211210232404.4098157-1-ira.weiny@intel.com>
 <20211210232404.4098157-2-ira.weiny@intel.com>
 <YbcMhzfm31aL5fzx@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YbcMhzfm31aL5fzx@infradead.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 13, 2021 at 01:04:07AM -0800, Christoph Hellwig wrote:
> On Fri, Dec 10, 2021 at 03:23:58PM -0800, ira.weiny@intel.com wrote:
> > -		vaddr = kmap(page);
> > +		vaddr = kmap_local_page(page);
> >  		memcpy(vaddr, data, len);
> > -		kunmap(page);
> > +		kunmap_local(vaddr);
> 
> memcpy_to_page?

Opps!  Yea!

David, Daniel,

Do you prefer me to resent the entire series or reply to this message with a
V2?

Ira
