Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9693228473A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD066E409;
	Tue,  6 Oct 2020 07:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134C189CAD
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 17:58:05 +0000 (UTC)
Received: from HKMAIL104.nvidia.com (Not Verified[10.18.92.77]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7b5ea90000>; Tue, 06 Oct 2020 01:58:01 +0800
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 5 Oct
 2020 17:57:51 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 5 Oct 2020 17:57:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WV+MR56hCTqldtnB/qkM1rmV0oR6xkrGreGU1JGwnz/xcTWvMRZYV9PP2jgH2WbENGpAjymFIpSqfGU82lb+nRdY+hK9aGpS9MD9280hz6k1kxm8rf6CI6N49bsa+ybL+aQRGdHG4w0nddtndqRRDnmE62+auUoxi044buOzMRwzD1RgfH75mYyVx+tnNG7ImbKVkU1fcdVhZBjkarPSmLQFMGyk9scgkF4W/a+eIl8X8W7iu2kyqMLox1XbGWljtOPWvX7R2xJQ/hfRxtUkTd2uqT78eEZ56eWw+10hZgSqAb0AZD+JMu300TJF6aepSNjplfw+LuhT8PHZ40j0NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rApgK6OSfcWBhmL5nkaxy8ldgngDjPhb7Ki5j5tm6Ro=;
 b=aBMLYWg66d1/c5GK4oB5+etRbCzsNys8TGyqyPJZgQbNxtZUEXUEqZKaQ2lgrJqnr4WpKd5BZcgOt10utpteEJYCSmCVucwDRRDt0OK0UJ2UTQKZ6dlGJ28v4JgJvN8wXguEdcKs8tjbNrMeD//QoVJW79B9u7aApntNyb6zJ1Wfb67l5lrHdZaLslpdwLGd+sOsV8fUWkXl1kdILfB8OCC/DXhz0pz8EpbEoFOesLQB/5HbmPkjFZR2LRDIWBxQBC7scUS5YrRukK5Er6CwJ/9orNGH5+7B7fsbKLOhqD6Z9IHcA4aF5k9u1r2CsVOLzhkc1UgJHcXgMnH8W5QcVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3403.namprd12.prod.outlook.com (2603:10b6:5:11d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.39; Mon, 5 Oct
 2020 17:57:48 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3433.044; Mon, 5 Oct 2020
 17:57:48 +0000
Date: Mon, 5 Oct 2020 14:57:46 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201005175746.GA4734@nvidia.com>
References: <0-v1-447bb60c11dd+174-frame_vec_fix_jgg@nvidia.com>
 <20201005175308.GI4225@quack2.suse.cz>
Content-Disposition: inline
In-Reply-To: <20201005175308.GI4225@quack2.suse.cz>
X-ClientProxiedBy: BL0PR02CA0111.namprd02.prod.outlook.com
 (2603:10b6:208:35::16) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 BL0PR02CA0111.namprd02.prod.outlook.com (2603:10b6:208:35::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Mon, 5 Oct 2020 17:57:47 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kPUk6-0004PD-El; Mon, 05 Oct 2020 14:57:46 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601920681; bh=rApgK6OSfcWBhmL5nkaxy8ldgngDjPhb7Ki5j5tm6Ro=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=q5gxLa9H3D83FDQXakAWmCG044dYGXmWabRqcGyccimGL8UwDhSOFCiEakEoqCdmz
 xw36EdOyI5QKakIyIxc4gCBOn0cWzeoP0cKd3pr6yYgBgun5UJtX5zZVc2dTD3jS7q
 CrMhR9il9rIcxrksoQnHzoJaS0blTBsXKoQqNvKNDB/jLZmXEpNB6JKJ2o3m4455CG
 lM/J3x5ZP/5RyouwTpQnj9iuSNKz640cRqLlI2pK4L9rSD59jsMU+xZlSq/bjm6IwC
 Nl2xfLSY3tDxnQEUw89qPIEl4aLAFe9HWv9iWT7hrYWdEz5KYP1TZfySKl+6jCc2HQ
 91M5J7bW4oEDw==
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 linux-mm@kvack.org, Hans Verkuil <hans.verkuil@cisco.com>,
 Mel Gorman <mgorman@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 andrew Morton <akpm@linux-foundation.org>, Dan
 Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 05, 2020 at 07:53:08PM +0200, Jan Kara wrote:
> On Mon 05-10-20 14:38:54, Jason Gunthorpe wrote:
> > When get_vaddr_frames() does its hacky follow_pfn() loop it should never
> > be allowed to extract a struct page from a normal VMA. This could allow a
> > serious use-after-free problem on any kernel memory.
> > 
> > Restrict this to only work on VMA's with one of VM_IO | VM_PFNMAP
> > set. This limits the use-after-free problem to only IO memory, which while
> > still serious, is an improvement.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 8025e5ddf9c1 ("[media] mm: Provide new get_vaddr_frames() helper")
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> >  mm/frame_vector.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/mm/frame_vector.c b/mm/frame_vector.c
> > index 10f82d5643b6de..26cb20544b6c37 100644
> > +++ b/mm/frame_vector.c
> > @@ -99,6 +99,10 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
> >  		if (ret >= nr_frames || start < vma->vm_end)
> >  			break;
> >  		vma = find_vma_intersection(mm, start, start + 1);
> > +		if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
> > +			ret = -EINVAL;
> > +			goto out;
> > +		}
> >  	} while (vma && vma->vm_flags & (VM_IO | VM_PFNMAP));
> 
> Hum, I fail to see how this helps. If vma has no VM_IO or VM_PFNMAP flag,
> we'd exit the loop (to out: label) anyway due to the loop termination
> condition and why not return the frames we already have? Furthermore
> find_vma_intersection() can return NULL which would oops in your check
> then. What am I missing?

Oh, nothing, you are right. It just didn't read naturally because
hitting the wrong kind of VMA should be an error condition :\

Sorry again,
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
