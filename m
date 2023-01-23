Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B12C677806
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 10:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A55F10E1E9;
	Mon, 23 Jan 2023 09:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
 by gabe.freedesktop.org (Postfix) with ESMTP id 769A510E1E1;
 Mon, 23 Jan 2023 09:59:36 +0000 (UTC)
Received: from 8bytes.org (p5b006afb.dip0.t-ipconnect.de [91.0.106.251])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPSA id 9A316262C2B;
 Mon, 23 Jan 2023 10:59:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1674467975;
 bh=0KQBObUcnpg5GrqXq3hC5RyjGf2zS6TIXg2zcVgFWn0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tr3JGNsZMXVI480xgKW5iIBnC2CS9vyEqh9gWSstha079Y/cRMHa9gi+uxnReHb5d
 fwek2sY7wwUJnFwFFwIvWemH12HdN0YbgdSZ2RWwC0269UqDUwGwB35CRDyXhq60AT
 USyIwI3wP05/5oGtUOpS94M53A08jNcPckKA5ZXpZIPRaNJ96Q+BFkTkmpgSNGCPm5
 YogHT95t/tBdYhxC9Y35A2TokJihCUBd4VwOl8Pa35zfKfyCatWPy6AY7P+apvfw5a
 T/W6TQnG+GLz390G6KRQWUX8KnoKg77Sxn7JUzcugID6/sS1m397rjmidCEXxQK2Lj
 1j8HX1fY4eNAw==
Date: Mon, 23 Jan 2023 10:59:32 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 1/8] iommu: Add a gfp parameter to iommu_map()
Message-ID: <Y85ahCk3sRTVAU8O@8bytes.org>
References: <1-v1-6e8b3997c46d+89e-iommu_map_gfp_jgg@nvidia.com>
 <4fd1b194-29ef-621d-4059-a8336058f217@arm.com>
 <Y7hZOwerwljDKoQq@nvidia.com> <Y8pd50mdNShTyVRX@8bytes.org>
 <Y8rVJGyTKAjXjLwV@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8rVJGyTKAjXjLwV@nvidia.com>
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
Cc: kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-rdma@vger.kernel.org,
 ath10k@lists.infradead.org, iommu@lists.linux.dev,
 Christian Borntraeger <borntraeger@linux.ibm.com>, ath11k@lists.infradead.org,
 linux-media@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>, linux-arm-msm@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 01:53:40PM -0400, Jason Gunthorpe wrote:
> > Well, having GFP parameters is not a strict kernel convention. There are
> > places doing it differently and have sleeping and atomic variants of
> > APIs. I have to say I like the latter more. But given that this leads to
> > an invasion of API functions here which all do the same under the hood, I
> > agree it is better to go with a GFP parameter here.
> 
> Ok, I think we are done with this series, I'll stick it in linux-next
> for a bit and send you a PR so the trees stay in sync

This series mostly touches parts outside of IOMMUFD, so we should follow
the process here and let this reach linux-next via the IOMMU tree.
Please send me a new version and I will put it into a separate branch
where you can pull it from.

Regards,

	Joerg
