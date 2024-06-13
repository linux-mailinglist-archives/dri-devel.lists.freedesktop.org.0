Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7FE90684E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A748C10E18E;
	Thu, 13 Jun 2024 09:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=8bytes.org header.i=@8bytes.org header.b="TuJjJkej";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 414 seconds by postgrey-1.36 at gabe;
 Thu, 13 Jun 2024 09:17:31 UTC
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
 by gabe.freedesktop.org (Postfix) with ESMTP id 463BE10E04C;
 Thu, 13 Jun 2024 09:17:30 +0000 (UTC)
Received: from 8bytes.org (pd9fe9dd8.dip0.t-ipconnect.de [217.254.157.216])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPSA id 0CA191C8182;
 Thu, 13 Jun 2024 11:10:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1718269836;
 bh=uwgNIsvKzltZ++YyP8KzyRNwS3DxApijGasjMKyMWAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TuJjJkejGm0MfLgodYlEkxSB3Ynzcf7M+hp6VHakuN4+1vOgGlqd5oczCJuxEsOGu
 WqIkjKEwvX2haQyyUhbamusFUYwCEwIIRCIF6VlNfmtASHzYFmsyKRIG6pNAZcLWAd
 pnJcgXXchWIJBOdBNrJSEPf3B6PIWZ9BgiKB50q/eLtIjLHienBaLr1+0JriUp2iwW
 xk/7D9LdolUZZ5HhoJPZbmDBRZ1sPVJFbIQcrIIU/1NbVcFDt1gPY6qIkLDBDo8Uvq
 6Qd10LFqV3aJzVyIm3o1i+I+IOwZREW/LL6A2t0dHY5MOTvWP1zx9xBezWuv8oVM9D
 PNrYHh/Swi8LQ==
Date: Thu, 13 Jun 2024 11:10:34 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] iommu/io-pgtable-arm: Add way to debug pgtable walk
Message-ID: <Zmq3iqSc8fFV0N-q@8bytes.org>
References: <20240523175227.117984-1-robdclark@gmail.com>
 <20240523175227.117984-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240523175227.117984-2-robdclark@gmail.com>
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

On Thu, May 23, 2024 at 10:52:21AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add an io-pgtable method to walk the pgtable returning the raw PTEs that
> would be traversed for a given iova access.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/io-pgtable-arm.c | 51 ++++++++++++++++++++++++++++------
>  include/linux/io-pgtable.h     |  4 +++
>  2 files changed, 46 insertions(+), 9 deletions(-)

Acked-by: Joerg Roedel <jroedel@suse.de>

