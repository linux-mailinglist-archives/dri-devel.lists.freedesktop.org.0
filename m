Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 055DA315DDE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 04:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC886E14D;
	Wed, 10 Feb 2021 03:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31A36E14D;
 Wed, 10 Feb 2021 03:40:16 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6023559f0000>; Tue, 09 Feb 2021 19:40:15 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Feb
 2021 03:40:15 +0000
Received: from nvdebian.localnet (172.20.145.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Feb
 2021 03:40:12 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 1/9] mm/migrate.c: Always allow device private pages to
 migrate
Date: Wed, 10 Feb 2021 14:40:10 +1100
Message-ID: <1780857.6Ip0F2Sa4d@nvdebian>
In-Reply-To: <20210209133932.GD4718@ziepe.ca>
References: <20210209010722.13839-1-apopple@nvidia.com>
 <20210209010722.13839-2-apopple@nvidia.com> <20210209133932.GD4718@ziepe.ca>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612928415; bh=tAmJ0+G97SMFAbiRRa3d8nEsiux+3wqoFMSUz5oWXEY=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=HROK2Gi63VmhyROJ40EZiAFFzcCoLcWvPFvxuOfp205Epk8rw5YTtBCGIYoAb9hxk
 CnfqGNLFdzz2Xtsj3yumfUK/9+hBtfXrJEmX4iVqiMoaXgM+TMGxt18tqaG5sw0ScD
 43ZxLw3DvD9R33aTIvurLvOsng5qWOn/AzmOA29piHPJdAChtXqQDQvf303F0aYOBT
 svQatmXEX23sU3Ao/P9UZXWmvJHz/I0b/xjuoB1mUuhQHJ7wLVFQzTgKe0in2pLJIP
 kkoNwUFXagV0YIb9Ks2CHAtmM5KrXk8JUZRq0BVnbpF6TD5kPWxc0Cx+2iFqHy0KUt
 zNFD/OabsiQEw==
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 10 February 2021 12:39:32 AM AEDT Jason Gunthorpe wrote:
> On Tue, Feb 09, 2021 at 12:07:14PM +1100, Alistair Popple wrote:
> > Device private pages are used to represent device memory that is not
> > directly accessible from the CPU. Extra references to a device private
> > page are only used to ensure the struct page itself remains valid whilst
> > waiting for migration entries. Therefore extra references should not
> > prevent device private page migration as this can lead to failures to
> > migrate pages back to the CPU which are fatal to the user process.
> 
> This should identify the extra references in expected_count, just
> disabling this protection seems unsafe, ZONE_DEVICE is not so special
> that the refcount means nothing

This is similar to what migarte_vma_check_page() does now. The issue is that a 
migration wait takes a reference on the device private page so you can end up 
with one thread stuck waiting for migration whilst the other can't migrate due 
to the extra refcount.

Given device private pages can't undergo GUP and that it's not possible to 
differentiate the migration wait refcount from any other refcount we assume 
any possible extra reference must be from migration wait.

> Is this a side effect of the extra refcounts that Ralph was trying to
> get rid of? I'd rather see that work finished :)

I'd like to see that finished too but I don't think it would help here as this 
is not a side effect of that.

 - Alistair

> Jason




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
