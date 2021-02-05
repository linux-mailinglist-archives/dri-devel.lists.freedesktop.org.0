Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9FF310D87
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 17:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0036D6F47F;
	Fri,  5 Feb 2021 16:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB4E6F47F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 16:00:19 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601d6b930003>; Fri, 05 Feb 2021 08:00:19 -0800
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb
 2021 16:00:18 +0000
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb
 2021 16:00:07 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS)
 id 15.0.1473.3 via Frontend Transport; Fri, 5 Feb 2021 16:00:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8fHzLYy3jp7fZotN0Axez1Zrpy+DHGKDROu6/TWjv475qzUmNA4KO4KLh0n8lUk5KQBmLUes8GUvwaJvqy9Rygc54LAI189/iaDZv7XrroOagE3bh5u0yDaS8U4HWN9YIVJ4UDQUecSs3iw50s3V6MgZS8JcvYQP8wBoWFxoaKasvAC6tqhuRLa/U1V0y5N2i6xfvfF0CcoyjwflSpZcC59v+yZk3PihRLkuTDXUpQ1mja8nG6AAKFDxnJ1prjJfdqOWva2RpqVvjuLM8giPi6TeUVdSdNMNj5B4VtAfPgJl1KEqvQJUIWQxnP5CDw40f/04WdPNxjVhoR78ph1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3N+DgaS9u6qIkxoAkMYURK5JtAJiWwyv5X1ffCmBSkc=;
 b=cBF4tyTlMXE/WSJC5TTt/oBZh5Ni6Pk47gJNCwNX6vHnsDrthlat021ruyUfLm9KLj5EWePqP8Qk/uTzDEJ/sw+GXAvg2RWKAR1boy/HTGapKB3X2ke1efF+gXFaXvScO3w8qaBNt+20Wg25o4Jh9sHDA4YaXkdXkpzj7L4FNJRCOYAOzuY+wr74aX6cZni9KHe0+esT8Da52vNDEvRIl1+nMW4n0c7w96KoFYwPKkR9nwXL19frDbsxSYKomUwyaE/aGbr2rfynRNuJQzhwnKr3F21uBwDEsUII8im9y26OPMyme/m5srKGuyX0ZD8ho+y0YyKq65wi5z2HXLMcaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB2583.namprd12.prod.outlook.com (2603:10b6:4:b3::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 5 Feb
 2021 16:00:05 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::d6b:736:fa28:5e4]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::d6b:736:fa28:5e4%7]) with mapi id 15.20.3825.025; Fri, 5 Feb 2021
 16:00:05 +0000
Date: Fri, 5 Feb 2021 12:00:03 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v16 0/4] RDMA: Add dma-buf support
Message-ID: <20210205160003.GU4247@nvidia.com>
References: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
 <5e4ac17d-1654-9abc-9a14-bda223d62866@nvidia.com>
 <CADnq5_M2YuOv16E2DG6sCPtL=z5SDDrN+y7iwD_pHVc7Omyrmw@mail.gmail.com>
 <20210204182923.GL4247@nvidia.com>
 <CADnq5_N9QvgAKQMLeutA7oBo5W5XyttvNOMK_siOc6QL+H07jQ@mail.gmail.com>
 <8e731fce-95c1-4ace-d8bc-dc0df7432d22@nvidia.com>
 <YB1mw/uYwueFwUdh@phenom.ffwll.local> <20210205154319.GT4247@nvidia.com>
 <YB1p4Bpmz0yFcbEf@phenom.ffwll.local>
Content-Disposition: inline
In-Reply-To: <YB1p4Bpmz0yFcbEf@phenom.ffwll.local>
X-ClientProxiedBy: BL1PR13CA0132.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::17) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 BL1PR13CA0132.namprd13.prod.outlook.com (2603:10b6:208:2bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend
 Transport; Fri, 5 Feb 2021 16:00:05 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1l83Wd-003tF4-Bh; Fri, 05 Feb 2021 12:00:03 -0400
X-Header: ProcessedBy-CMR-outbound
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612540819; bh=3N+DgaS9u6qIkxoAkMYURK5JtAJiWwyv5X1ffCmBSkc=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType:X-Header;
 b=UO5a8d7Gq9JBisbqiDTdil2e3bedvGcKAxMZwDubmN1H7+ZuTTfatjM7tRkqr0Baw
 b/Tt7FR2NaI0kqH57yP0FNB3FZrxcBvX7dJqUXOrqer42vo8+ars1t6WbWLAGM4P1a
 qGkw5iMTfAB7jMkmvNXjBrJpujgKZ5hGSTm6RT6sk0V8O1/HsDMl/rODxq4peJBcEN
 F1XSIeWiKReF4Fg7yoeEhs8mOQhgamM3JKTpvxmeZWFYvskOOHPjl27v6hv/huHO+F
 x/8FQAKWYNfhxokNOXXrYXVF/DJ9htfKOmIG/l52AckogXGe0vvKLFJepy1DOSdVXn
 bIh1FXGPHs0xg==
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian
 Koenig <christian.koenig@amd.com>, Jianxin Xiong <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 04:53:04PM +0100, Daniel Vetter wrote:
> On Fri, Feb 05, 2021 at 11:43:19AM -0400, Jason Gunthorpe wrote:
> > On Fri, Feb 05, 2021 at 04:39:47PM +0100, Daniel Vetter wrote:
> > 
> > > > And again, for slightly older hardware, without pinning to VRAM there is
> > > > no way to use this solution here for peer-to-peer. So I'm glad to see that
> > > > so far you're not ruling out the pinning option.
> > > 
> > > Since HMM and ZONE_DEVICE came up, I'm kinda tempted to make ZONE_DEVICE
> > > ZONE_MOVEABLE (at least if you don't have a pinned vram contigent in your
> > > cgroups) or something like that, so we could benefit from the work to make
> > > sure pin_user_pages and all these never end up in there?
> > 
> > ZONE_DEVICE should already not be returned from GUP.
> > 
> > I've understood in the hmm casse the idea was a CPU touch of some
> > ZONE_DEVICE pages would trigger a migration to CPU memory, GUP would
> > want to follow the same logic, presumably it comes for free with the
> > fault handler somehow
> 
> Oh I didn't know this, I thought the proposed p2p direct i/o patches would
> just use the fact that underneath ZONE_DEVICE there's "normal" struct
> pages. 

So, if that every happens, it would be some special FOLL_ALLOW_P2P
flag to get the behavior.

> And so I got worried that maybe also pin_user_pages can creep in.
> But I didn't read the patches in full detail:

And yes, you might want to say that you can't longterm pin certain
kinds of zone_device pages, but if that is the common operating mode
then we'd probably never create a FOLL_ALLOW_P2P

> But if you're saying that this all needs specific code and all the gup/pup
> code we have is excluded, I think we can make sure that we're not ever
> building features that requiring time-unlimited pinning of
> ZONE_DEVICE.

Well, it is certainly a useful idea of some uses of ZONE_DEVICE, GPU
vram is not the whole world.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
