Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A541259926
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 18:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4236E888;
	Tue,  1 Sep 2020 16:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C5B6E2B2
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 14:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598971549;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JdnTGG+FGAeYr/CaqX7nq47kV+5WzzeAxfnDtVerGyo=;
 b=SLYjGoK4HrL2DpYCS1/LA5fdNb6dd2b0HWdODbI8HSC7FhijV+TQKZ97
 LifBAsjQ7fJGXaZoEthWj6XaT/w42H+GOl68pg3oSvTYdXp4+Mh5q9I82
 BxrHH5BIsODzkymIMNgHAQzOmo3ZIe4ALpMvdlTLKnJf/MgwwKdMCSdmX Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Fx1CBO5kj/E1oAMz1SNj/x+W2f0hG4uH49vCOwacHjqiEVjH7W+Z6ZuJZjjum/02jE8xubVska
 3sIRr0yzCkV4UFYdAcAEcQc4GhV+gB8w1o75XW1D5ExaZvi5cN6ZLmCer9O+ksnWJQiP2Sgj10
 qB4qwe6YKfcng8UZr3n0SOQ5PpIFcJuHhd74YlTayszxMAsS0OrjOzM8z+nks1IfNFppYINasU
 Ro6lhbOIuB5NwPtFeaSBPdzODMC3WqFYJrILMML41cyYE6RwfKjxRUW9A0yz27uqJzHVG1uKB9
 Dt4=
X-SBRS: 2.7
X-MesageID: 26701517
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,379,1592884800"; d="scan'208";a="26701517"
Date: Tue, 1 Sep 2020 16:45:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/3] xen: add helpers to allocate unpopulated memory
Message-ID: <20200901144539.GI753@Air-de-Roger>
References: <20200901083326.21264-1-roger.pau@citrix.com>
 <20200901083326.21264-4-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200901083326.21264-4-roger.pau@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
X-Mailman-Approved-At: Tue, 01 Sep 2020 16:37:24 +0000
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
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan Yankovskyi <yyankovskyi@gmail.com>,
 David Hildenbrand <david@redhat.com>, dri-devel@lists.freedesktop.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 01, 2020 at 10:33:26AM +0200, Roger Pau Monne wrote:
> +static int fill_list(unsigned int nr_pages)
> +{
> +	struct dev_pagemap *pgmap;
> +	void *vaddr;
> +	unsigned int i, alloc_pages = round_up(nr_pages, PAGES_PER_SECTION);
> +	int nid, ret;
> +
> +	pgmap = kzalloc(sizeof(*pgmap), GFP_KERNEL);
> +	if (!pgmap)
> +		return -ENOMEM;
> +
> +	pgmap->type = MEMORY_DEVICE_GENERIC;
> +	pgmap->res.name = "Xen scratch";
> +	pgmap->res.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
> +
> +	ret = allocate_resource(&iomem_resource, &pgmap->res,
> +				alloc_pages * PAGE_SIZE, 0, -1,
> +				PAGES_PER_SECTION * PAGE_SIZE, NULL, NULL);
> +	if (ret < 0) {
> +		pr_err("Cannot allocate new IOMEM resource\n");
> +		kfree(pgmap);
> +		return ret;
> +	}
> +
> +	nid = memory_add_physaddr_to_nid(pgmap->res.start);

I think this is not needed ...

> +
> +#ifdef CONFIG_XEN_HAVE_PVMMU
> +        /*
> +         * memremap will build page tables for the new memory so
> +         * the p2m must contain invalid entries so the correct
> +         * non-present PTEs will be written.
> +         *
> +         * If a failure occurs, the original (identity) p2m entries
> +         * are not restored since this region is now known not to
> +         * conflict with any devices.
> +         */
> +	if (!xen_feature(XENFEAT_auto_translated_physmap)) {
> +		xen_pfn_t pfn = PFN_DOWN(pgmap->res.start);
> +
> +		for (i = 0; i < alloc_pages; i++) {
> +			if (!set_phys_to_machine(pfn + i, INVALID_P2M_ENTRY)) {
> +				pr_warn("set_phys_to_machine() failed, no memory added\n");
> +				release_resource(&pgmap->res);
> +				kfree(pgmap);
> +				return -ENOMEM;
> +			}
> +                }
> +	}
> +#endif
> +
> +	vaddr = memremap_pages(pgmap, nid);

... and NUMA_NO_NODE should be used here instead, as this memory is just
fictitious space to map foreign memory, and shouldn't be related to
any NUMA node.

The following chunk should be folded in, or I can resend.

Thanks, Roger.
---8<---
diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-alloc.c
index 1b5d157c6977..3b98dc921426 100644
--- a/drivers/xen/unpopulated-alloc.c
+++ b/drivers/xen/unpopulated-alloc.c
@@ -20,7 +20,7 @@ static int fill_list(unsigned int nr_pages)
 	struct dev_pagemap *pgmap;
 	void *vaddr;
 	unsigned int i, alloc_pages = round_up(nr_pages, PAGES_PER_SECTION);
-	int nid, ret;
+	int ret;
 
 	pgmap = kzalloc(sizeof(*pgmap), GFP_KERNEL);
 	if (!pgmap)
@@ -39,8 +39,6 @@ static int fill_list(unsigned int nr_pages)
 		return ret;
 	}
 
-	nid = memory_add_physaddr_to_nid(pgmap->res.start);
-
 #ifdef CONFIG_XEN_HAVE_PVMMU
         /*
          * memremap will build page tables for the new memory so
@@ -65,7 +63,7 @@ static int fill_list(unsigned int nr_pages)
 	}
 #endif
 
-	vaddr = memremap_pages(pgmap, nid);
+	vaddr = memremap_pages(pgmap, NUMA_NO_NODE);
 	if (IS_ERR(vaddr)) {
 		pr_err("Cannot remap memory range\n");
 		release_resource(&pgmap->res);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
