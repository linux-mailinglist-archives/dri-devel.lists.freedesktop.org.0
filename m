Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2DF2A9159
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903746EDF5;
	Fri,  6 Nov 2020 08:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB526EDE2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 19:36:15 +0000 (UTC)
Received: from HKMAIL101.nvidia.com (Not Verified[10.18.92.100]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa4542d0000>; Fri, 06 Nov 2020 03:36:13 +0800
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Nov
 2020 19:35:58 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by HKMAIL102.nvidia.com (10.18.16.11) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 5 Nov 2020 19:35:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IACebdQDUK1LPo6dtFEzqoPn564iKyqzXEEOE+ViMcGLFXgwZepHQSyFZ8Qe5GQPD/YYEpTWoPS7Uff2gz0CbZVLDJeYx2uODzS0ytjN5/CxntsvGqDcKT7hJalCFbgRvCIEYfQ0PvnzBugfEfKSNmD3txNbH2Ajm503GukCsVV1H+iJWBBF/DTiV7dbwucG5M8HEq8U8C843r4DFFMcV1QtirC5ypSVpKSA4Mn+71sktqPDGCuofZQpNtXi3bqFTOtNoJfkJvXIHtYFar5WrzWxUmch1+tQTcCYWB2kZ8YspqytNcOjvXqn6UEg2GAJPlQIwg1KVbjNf6LqJm2yXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkt+EEj/AWdQBRd7cUpKSor6iRfLsu2dvJIC8FuRwXA=;
 b=n6Ilovgc5QZ4v2uzn8Fh2ddTm5FdVAmN/HDo3+fhN2JDK2eLgfkYYdMstJcWCrfoxowsBuEuU/+2E+ar0XaPO/5VZo2OmWJqHGMQaPdTSNxQzb7r4rnH/uuoPOvVeTUh8JK6o/qhNLKvS5E4tmLIFoWVg196sH8CVwnSPzAGRxwlLUHabKDNXuypE8H0F9UyUlJSr8FY0oZzeD+2JyVHTvFes787lCRb5dHtRXMbN78qWk2OvdCTW6KzLHi0CZ9HwrX2VFLCOELqQ8kCd6hG6I0WriQ5dcsk0XdbkY2IwZw+zL4trYiamel6hEmZz2GEoMxi0b4HHNEXalWxI7NYRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3211.namprd12.prod.outlook.com (2603:10b6:5:15c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 5 Nov
 2020 19:35:56 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 19:35:56 +0000
Date: Thu, 5 Nov 2020 15:35:54 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: remove pgprot_decrypted() before calls to
 io_remap_pfn_range()
Message-ID: <20201105193554.GP2620339@nvidia.com>
References: <0-v1-2e6a0db57868+166-drm_sme_clean_jgg@nvidia.com>
 <20201105191746.GC401619@phenom.ffwll.local>
Content-Disposition: inline
In-Reply-To: <20201105191746.GC401619@phenom.ffwll.local>
X-ClientProxiedBy: BL1PR13CA0256.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::21) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 BL1PR13CA0256.namprd13.prod.outlook.com (2603:10b6:208:2ba::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.13 via Frontend
 Transport; Thu, 5 Nov 2020 19:35:55 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kal34-000MOo-3X; Thu, 05 Nov 2020 15:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604604973; bh=rkt+EEj/AWdQBRd7cUpKSor6iRfLsu2dvJIC8FuRwXA=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=ACwaGx3dDTum1U+ykLD82m47Ai7xTcq52MKtpQXbs2qLqj29t0If9n3h/fxiaDM9U
 SQDPbLHmLROjzNvpDB2mnLRQ4waa1yIqso6xriHQesxp1MlRpHDC9mTqtXeIq+azxn
 1ZRJOorG2hXMQLCDCx4kvflSAGP07Py805QVQT0IX8xBJ48trEFGWy/+ZW5FKur1FX
 TNDD1NWygwZ2IF017JapYatlRLn6Awz3mQjP0GZ6Y15C0pu46HRTQ7pEhyWx8CL5st
 D5yX/u+OapKGOy3c/Ih5Xhkhi/CxPImlDrfGy7zifSJu1bUgLQ9vgt7MoVLmRMRNp3
 MC2rGZGeG8zYg==
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 05, 2020 at 08:17:46PM +0100, Daniel Vetter wrote:
> On Thu, Nov 05, 2020 at 01:00:19PM -0400, Jason Gunthorpe wrote:
> > commit f8f6ae5d077a ("mm: always have io_remap_pfn_range() set
> > pgprot_decrypted()") moves the pgprot_decrypted() into
> > io_remap_pfn_range(). Delete any, now confusing, open coded calls that
> > directly precede io_remap_pfn_range():
> > 
> > - drm_io_prot() is only in drm_mmap_locked() to call io_remap_pfn_range()
> > 
> > - fb_mmap() immediately calls vm_iomap_memory() which is a convenience
> >   wrapper for io_remap_pfn_range()
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> >  drivers/gpu/drm/drm_vm.c         | 3 ---
> >  drivers/video/fbdev/core/fbmem.c | 5 -----
> >  2 files changed, 8 deletions(-)
> > 
> > rc3 will have the dependent patch, this should not be merged to DRM until it
> > has the rc3 commits.
> > 
> > There are three other pgprot_decrypted() calls in DRM, I could not figure out
> > what was what there, but other than very special cases I would expect code to
> > use io_remap_pfn_range() instead.
> 
> There's 4 now, I think linux-next added one. It's another io_remap_pfn
> 
> Of the three you mentioned we have:
> - ttm and i915 use vm_insert_pfn (and ttm also can do also do pud_mkhuge
>   entries)

You can't insert IO memory with vmf_insert_pfn_pmd_prot() (it
doesn't set the special flag) so why does it need decrypted?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
