Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BB8689F3F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 17:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45ECA10E0D3;
	Fri,  3 Feb 2023 16:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68A010E12F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 16:29:26 +0000 (UTC)
Received: from maud (138-51-85-230-lsn-2.nat.utoronto.ca [138.51.85.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alyssa)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5CFBA6602F11;
 Fri,  3 Feb 2023 16:29:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675441765;
 bh=Xc7eybUvaWT1XYp5qxoixYCppZzDo091FOnr1TEYUvc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AEWy+VGC2CHUnZvw4CWdXluWbCIfXo4kUGST1DlEUw77YYZQD9Xck4YX/AUeavOtU
 lo/O4NzlsuCcuix0/Q7JW/EGRDpZpA9+K0cWTaATeegpBF/Lujp/5qqq4Dom5gbNGV
 Uo/WiM+ngaqkYxUSugu5oyaJyF/8ih1kD0Fp3hBjuHbfvGJagLHIYxRGkaedbtaV41
 Z/IO/zDxdTFw38B1hDnggPKKjvhCgw3xEoectmhI9TsBDvLoF31zKkhEAcd7YwKTSL
 yrAk4JreO+OqYhNMMrc8d2qIJJQ6yi+bKIRSxHpEE/3lmiclLHqOCHQR+A5x/werBO
 cik3oa31+rrSA==
Date: Fri, 3 Feb 2023 11:29:16 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [RFC PATCH] drm/pancsf: Add a new driver for Mali CSF-based GPUs
Message-ID: <Y902XDkZB6PvT47s@maud>
References: <20230201084832.1708866-1-boris.brezillon@collabora.com>
 <bf9a7562-796b-d39e-ef4b-deb8217484b4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf9a7562-796b-d39e-ef4b-deb8217484b4@arm.com>
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
Cc: Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > Mali v10 (second Valhal iteration) and later GPUs replaced the Job
> > Manager block by a command stream based interface called CSF (for
> > Command Stream Frontend). This interface is not only turning the job
> > chain based submission model into a command stream based one, but also
> > introducing FW-assisted scheduling of command stream queues. This is a
> > fundamental shift in both how userspace is supposed to submit jobs, but
> > also how the driver is architectured. We initially tried to retrofit the
> > CSF model into panfrost, but this ended up introducing unneeded
> > complexity to the existing driver, which we all know is a potential
> > source of regression.
> 
> While I agree there's some big differences which effectively mandate
> splitting the driver I do think there are some parts which make a lot of
> sense to share.
> 
> For example pancsf_regs.h and panfrost_regs.h are really quite similar
> and I think could easily be combined. The clock/regulator code is pretty
> much a direct copy/paste (just adding support for more clocks), etc.
> 
> What would be ideal is factoring out 'generic' parts from panfrost and
> then being able to use them from pancsf.
> 
> I had a go at starting that:
> 
> https://gitlab.arm.com/linux-arm/linux-sp/-/tree/pancsf-refactor
> 
> (lightly tested for Panfrost, only build tested for pancsf).
> 
> That saves around 200 lines overall and avoids needing to maintain two
> lots of clock/regulator code. There's definite scope for sharing (most)
> register definitions between the drivers and quite possibly some of the
> MMU/memory code (although there's diminishing returns there).

200 lines saved in a 5kloc+ driver doesn't seem worth much, especially
against the added testing combinatorics, TBH. The main reason I can see
to unify is if we want VM_BIND (and related goodies) on JM hardware too.
That's only really for Vulkan and I really don't see the case for Vulkan
on anything older than Valhall at this point. So it comes down to
whether we want to start Vulkan at v9 or skip to v10. The separate
panfrost/pancsf drivers approach strongly favours the latter.
