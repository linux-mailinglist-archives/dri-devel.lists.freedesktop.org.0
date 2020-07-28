Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AAD2312A2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D8C6E3AE;
	Tue, 28 Jul 2020 19:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250916E03A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 16:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595955569;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tRrG2kIPRmHZl5KYjBZDnpKOe+a1KAifCS6TcraQCvw=;
 b=bsvj2kZHsIsV/VdDQu9Ewf3LB7Ze6qu+aPDlb0qSu42JejEVQH7EPLQZ
 1InNm2Hr85rqkI/aHquXZhV3Sxou5DSCjiracnmcNbDJ/FPkGNiS7a5TU
 DICTBnGAviWnA380nELIgDpLk51v/BCsX+fwnMrimFeKzKFsLk+0sK2ev w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ek+XUNwRJ4Q5p4iyKzYjQH2lwOuZGVQ6Lx+zstg9NwpzzjRk2zB+v1/h9r6kuVVwRRNSCQGoXa
 D8++MW18YDeKCEmXhrvpH1ZyV0JbQvvIgpmIJERE5rrUKGp9cmDKMmPTr4piKhlvofOfDIfJYe
 2rK+680bc67sJoyZee3FTviqXiwfbr0qq0/CqTZ5Z0mVPLSMrngigHlxQVYUtTkhCySNVkupEs
 zSdbmNe7SgW5IpviGcOeDar3EuhU7jdXOS/8qypW3eFImgTAyx5Vym8iTQCHVMYS3dHYj3I2H8
 GeI=
X-SBRS: 2.7
X-MesageID: 23705708
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="23705708"
Date: Tue, 28 Jul 2020 18:59:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 4/4] xen: add helpers to allocate unpopulated memory
Message-ID: <20200728165919.GA7191@Air-de-Roger>
References: <20200727091342.52325-1-roger.pau@citrix.com>
 <20200727091342.52325-5-roger.pau@citrix.com>
 <b5460659-88a5-c2aa-c339-815d5618bcb5@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5460659-88a5-c2aa-c339-815d5618bcb5@xen.org>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Oleksandr
 Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan Yankovskyi <yyankovskyi@gmail.com>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>, Dan
 Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 05:48:23PM +0100, Julien Grall wrote:
> Hi,
> 
> On 27/07/2020 10:13, Roger Pau Monne wrote:
> > To be used in order to create foreign mappings. This is based on the
> > ZONE_DEVICE facility which is used by persistent memory devices in
> > order to create struct pages and kernel virtual mappings for the IOMEM
> > areas of such devices. Note that on kernels without support for
> > ZONE_DEVICE Xen will fallback to use ballooned pages in order to
> > create foreign mappings.
> > 
> > The newly added helpers use the same parameters as the existing
> > {alloc/free}_xenballooned_pages functions, which allows for in-place
> > replacement of the callers. Once a memory region has been added to be
> > used as scratch mapping space it will no longer be released, and pages
> > returned are kept in a linked list. This allows to have a buffer of
> > pages and prevents resorting to frequent additions and removals of
> > regions.
> > 
> > If enabled (because ZONE_DEVICE is supported) the usage of the new
> > functionality untangles Xen balloon and RAM hotplug from the usage of
> > unpopulated physical memory ranges to map foreign pages, which is the
> > correct thing to do in order to avoid mappings of foreign pages depend
> > on memory hotplug.
> I think this is going to break Dom0 on Arm if the kernel has been built with
> hotplug. This is because you may end up to re-use region that will be used
> for the 1:1 mapping of a foreign map.
> 
> Note that I don't know whether hotplug has been tested on Xen on Arm yet. So
> it might be possible to be already broken.
> 
> Meanwhile, my suggestion would be to make the use of hotplug in the balloon
> code conditional (maybe using CONFIG_ARM64 and CONFIG_ARM)?

Right, this feature (allocation of unpopulated memory separated from
the balloon driver) is currently gated on CONFIG_ZONE_DEVICE, which I
think could be used on Arm.

IMO the right solution seems to be to subtract the physical memory
regions that can be used for the identity mappings of foreign pages
(all RAM on the system AFAICT) from iomem_resource, as that would make
this and the memory hotplug done in the balloon driver safe?

Thanks, Roger.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
