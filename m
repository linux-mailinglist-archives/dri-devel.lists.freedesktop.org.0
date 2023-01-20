Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD71675149
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 10:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B7C10E9F9;
	Fri, 20 Jan 2023 09:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 668 seconds by postgrey-1.36 at gabe;
 Fri, 20 Jan 2023 09:36:07 UTC
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0AB3710E9F8;
 Fri, 20 Jan 2023 09:36:06 +0000 (UTC)
Received: from 8bytes.org
 (p200300c27714bc0086ad4f9d2505dd0d.dip0.t-ipconnect.de
 [IPv6:2003:c2:7714:bc00:86ad:4f9d:2505:dd0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPSA id E12D62626D1;
 Fri, 20 Jan 2023 10:24:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1674206697;
 bh=N0Ez9jlBhYWiOK7+xYABfIe0+VmfRPgpACpzUje2F4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lOLKVLD4dyMYfuGfszt0Aqi18MMtbwUvgwVbHoDO6hE/pu3jlsoFnfOvfV2sSJ6i8
 k3lOBgDA7x9bkKbnD+qVSk6qrzEVOc/9/JS99/CzblV3IjUWMNUsDLegoejr0hYkyT
 NIAGgbjvSNtqhO8clUAYjH7vWYcGoTKi2kDTgKFmFcsSDinl9Vo2l2M2oUTe7UNJh3
 4hHtdAX4so62XBRGFWlRKgCJW94p/lPduMMBp2SCZ238xwGOe1m0xh9F5SouN8x7NO
 06U5w+umYu9ogUcIQK1YpQ4ciXMhW+H2quzpMMrP7f3cTLkb2U0hf6Ab3xk/GMJY5E
 1P63Vv4/HChRw==
Date: Fri, 20 Jan 2023 10:24:55 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 1/8] iommu: Add a gfp parameter to iommu_map()
Message-ID: <Y8pd50mdNShTyVRX@8bytes.org>
References: <1-v1-6e8b3997c46d+89e-iommu_map_gfp_jgg@nvidia.com>
 <4fd1b194-29ef-621d-4059-a8336058f217@arm.com>
 <Y7hZOwerwljDKoQq@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7hZOwerwljDKoQq@nvidia.com>
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

On Fri, Jan 06, 2023 at 01:24:11PM -0400, Jason Gunthorpe wrote:
> I think it is just better to follow kernel convention and have
> allocation functions include the GFP because it is a clear signal to
> the user that there is an allocation hidden inside the API. The whole
> point of gfp is not to have multitudes of every function for every
> allocation mode.

Well, having GFP parameters is not a strict kernel convention. There are
places doing it differently and have sleeping and atomic variants of
APIs. I have to say I like the latter more. But given that this leads to
an invasion of API functions here which all do the same under the hood, I
agree it is better to go with a GFP parameter here.

Regards,

	Joerg
