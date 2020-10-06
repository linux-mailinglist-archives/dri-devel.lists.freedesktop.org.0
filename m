Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C72285964
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CC96E8A1;
	Wed,  7 Oct 2020 07:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E626E187
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 11:57:34 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7c5b410002>; Tue, 06 Oct 2020 04:55:45 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 6 Oct
 2020 11:57:18 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 6 Oct 2020 11:57:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPG7x1C9aHiFlVkU7jSnFEPbuv75OKrOiECkrUZb9Go3OR3ayH/+Dx/Lp6Igi+B6OfYpqQLaGiyJ2HxKzlBtg31KG//UhiejJbuKKyvFgfoY/sCMaIDzgtLOLxih9zRvL5wDmMzcXLBIJXKyxNZj/ufsfjqSnh1pZjmlU23MTKLk+ykhyE3ruE56HpTXwVIUVnnrS/QR4PUddvdvNjicEGm9l1CqHUd0z//jfsSZ5cEazZ2oQbyBMK6Icc3hw4JJULkSHriDtmDqAcskmcbIb+rOqEYg5CH3TfqGzfIf9TcKiU3LA54tmbMeVPvHkMedm9aL7Dh9dJh5lnHatO6Gng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJiWt16Yi/JhKDcw0JSkaASE3VXpV2da6RFfJ9PDyMw=;
 b=UXApHv0DGJYPQtEUZ9phujGGIlcpFiEPbOMpQ60dJYAff77Z1VIN1OB6N2E3z+pzQUMpKy+IxgHREEpmtqCxqcW0zz1G1ARFLRhKo5aBs6qsc7I4axgXJeov+ynV2ur7wxZLtow32uVq2YRcJgoL5CA9dVX3FS3Vv4GFxvw8GbEohwAWHfF56UQhqyhSO/5kW8qTpecQGJMGOygaYxAQFfePqk8mptZGX+s0pUFc48pxxcm5F7kpafGcV5TzfF04PaNlf4n6RwjP6v110bNTISwLaBV5tCCg4Bfy23sXmQtoSxYVXCQEQMMNnrGF6h3doHXM+tmkM4tZPoMSOe+xmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB1242.namprd12.prod.outlook.com (2603:10b6:3:6d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Tue, 6 Oct
 2020 11:57:16 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3433.044; Tue, 6 Oct 2020
 11:57:16 +0000
Date: Tue, 6 Oct 2020 08:57:14 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201006115714.GE4734@nvidia.com>
References: <0-v1-447bb60c11dd+174-frame_vec_fix_jgg@nvidia.com>
 <20201005174747.GA15803@nvidia.com>
 <20201005203600.9b0ccb43b9b3a2fc44814d2f@linux-foundation.org>
Content-Disposition: inline
In-Reply-To: <20201005203600.9b0ccb43b9b3a2fc44814d2f@linux-foundation.org>
X-ClientProxiedBy: MN2PR12CA0032.namprd12.prod.outlook.com
 (2603:10b6:208:a8::45) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR12CA0032.namprd12.prod.outlook.com (2603:10b6:208:a8::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.21 via Frontend Transport; Tue, 6 Oct 2020 11:57:15 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kPlak-000Vj8-Q0; Tue, 06 Oct 2020 08:57:14 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601985345; bh=fJiWt16Yi/JhKDcw0JSkaASE3VXpV2da6RFfJ9PDyMw=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=hbgEq5G/FhgikUvx5VO/xZOQvyn+8E/KEB4ReX7u7jcIlrljp0CjRnf7kD3wqjBmK
 As44aTsyzBCYb0Ir4pweq37i2hGGkPWp1atR9W0Y+j3xo0Idjg60arCs74qjYQEtZk
 xbyg4h56Dft9lldjxR7jPG5m9V0bGc+sVgwpTbKnJlJF/TZvH15wUwBf7xGlvpJ9VG
 +jVEJD6xaLP4fFZDs/L/e+gCfYJkO8Q07HTXPUGuQXntuSndXYXYgDrSq+3E32+ivC
 u2Z/vJeipzMj52nj/IGsYzvi5WekfbmNI7ZecFxsUXdKwQPxP2XEXD9m6DbA0XPJM2
 kVgLHGlib4XZg==
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 linux-mm@kvack.org, Hans Verkuil <hans.verkuil@cisco.com>,
 Mel Gorman <mgorman@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 05, 2020 at 08:36:00PM -0700, Andrew Morton wrote:
> On Mon, 5 Oct 2020 14:47:47 -0300 Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > Andrew please let me know if you need a resend
> 
> Andrew is rather confused.
> 
> Can we please identify the minimal patch(es) which are needed for 5.9
> and -stable? 

Please ignore this one, it was sent in haste

Sorry,
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
