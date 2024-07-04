Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8C0927781
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 15:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B977010E149;
	Thu,  4 Jul 2024 13:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XxI1lfv8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDB910E149
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 13:53:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D91AFCE2082;
 Thu,  4 Jul 2024 13:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF1AC3277B;
 Thu,  4 Jul 2024 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720101189;
 bh=eQz2IBKd/Q7hCL1YjwIbirGf/hcd4Pso5HkourWlFN8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XxI1lfv80rJr1/7yGA95ZgA6CrbvweUqIvqiuT+zxsy9TX1ELTFYRkh+Om5FfvySF
 5tnVPH8EUJhdjVlF72YJiBiCmvE4rjE+vYF+VyoZoWWr10m/Z54aZX3SmdRHUqFlqe
 Q3VX52GRIRKUrAc+18kBK18UjNQfqAQdvSiWavQjFgz95e7tLq7Sl06OTz6YxpthPK
 aqYUSEWs4dOfQPE5wpWbqxuhBB0RW8TrF5/TyXZKbd00ypWocDnYibNw+WGF7sj+Il
 WO49vWsPz9I4WJIa6FgAqLc9l9+XQLye7cjdkS23vbjuczwn7WJj5DZEh2hbyD15c3
 gSFfx8okA3upA==
Date: Thu, 4 Jul 2024 14:53:01 +0100
From: Will Deacon <will@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k@lists.infradead.org, ath11k@lists.infradead.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/21] vhost-vdpa: Use iommu_paging_domain_alloc()
Message-ID: <20240704135300.GA7854@willie-the-truck>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-5-baolu.lu@linux.intel.com>
 <20240703123146-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703123146-mutt-send-email-mst@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 03, 2024 at 12:32:06PM -0400, Michael S. Tsirkin wrote:
> On Mon, Jun 10, 2024 at 04:55:38PM +0800, Lu Baolu wrote:
> > Replace iommu_domain_alloc() with iommu_paging_domain_alloc().
> > 
> > Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> 
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
> 
> I assume it's merged with the rest of the stuff, right?

Sure, I can grab this one in the iommu tree. It has to go along with
the patch adding iommu_paging_domain_alloc() anyway.

Will
