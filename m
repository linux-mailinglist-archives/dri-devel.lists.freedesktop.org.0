Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F62F245D3C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8F46E4A5;
	Mon, 17 Aug 2020 07:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA8D6EB1D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 09:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597398999;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=M2heJ5UJIi6VeX83HdtsuKbDz3J1W8I/My2z+YBPJbc=;
 b=VMUPhAunCPJYS7U/d4AcTWAUNCTlkb+q/8skt/OUmXKQ4MaqEQAeVgXX
 BMInVCYqVOYrPRmN/H/+cbHAa9l6X4TmLr6fbLeMioVvrAo49N1rgzyyD
 Wym+QZ5mrVnxXlmY+vv1umCugWKy7RBV5iFubSq01LEZGm70YZ8432AjK o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: LSUv+nx7tcMiKh/86la0ov2CD6bm0s6I0CZ/3c8oZ8SKd5FBsD9NTk6X+etvRWHGxjQoN4ifLc
 WZkEtigJTsHGqnWNv9UJ60WQsP5kEKf5sFfIOA6zvU9VIklNrxh92Vbu7Lw/zOteb+Zprr9bcz
 EDqmXPpuivFanGkQt/96ZKFaN0KdR0AoyWD2zxgECUj3l8VTghEId76fKUoi3SYFO8M2Otk1Pf
 CYzZj5rDqfvUJsn9+hgY+6CFXoxaN6UM05eSlIPALUijsytQzL+vRPNV5LDNkQ09XoNxVizA79
 cjQ=
X-SBRS: 2.7
X-MesageID: 24845878
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,311,1592884800"; d="scan'208";a="24845878"
Date: Fri, 14 Aug 2020 11:56:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 2/2] xen: add helpers to allocate unpopulated memory
Message-ID: <20200814095629.GJ975@Air-de-Roger>
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-3-roger.pau@citrix.com>
 <20200813073337.GA16160@infradead.org>
 <20200813075420.GC975@Air-de-Roger>
 <20200814072920.GA6126@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814072920.GA6126@infradead.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan
 Yankovskyi <yyankovskyi@gmail.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 14, 2020 at 08:29:20AM +0100, Christoph Hellwig wrote:
> On Thu, Aug 13, 2020 at 09:54:20AM +0200, Roger Pau Monn?? wrote:
> > On Thu, Aug 13, 2020 at 08:33:37AM +0100, Christoph Hellwig wrote:
> > > On Tue, Aug 11, 2020 at 11:44:47AM +0200, Roger Pau Monne wrote:
> > > > If enabled (because ZONE_DEVICE is supported) the usage of the new
> > > > functionality untangles Xen balloon and RAM hotplug from the usage of
> > > > unpopulated physical memory ranges to map foreign pages, which is the
> > > > correct thing to do in order to avoid mappings of foreign pages depend
> > > > on memory hotplug.
> > > 
> > > So please just select ZONE_DEVICE if this is so much better rather
> > > than maintaining two variants.
> > 
> > We still need to other variant for Arm at least, so both need to be
> > maintained anyway, even if we force ZONE_DEVICE on x86.
> 
> Well, it still really helps reproducability if you stick to one
> implementation of x86.
> 
> The alternative would be an explicit config option to opt into it,
> but just getting a different implementation based on a random
> kernel option is strange.

Would adding something like the chunk below to the patch be OK?

---8<---
diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 018020b91baa..5f321a1319e6 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -328,7 +328,14 @@ config XEN_FRONT_PGDIR_SHBUF
 	tristate
 
 config XEN_UNPOPULATED_ALLOC
-	bool
-	default y if ZONE_DEVICE && !ARM && !ARM64
+	bool "Use unpopulated memory ranges for guest mappings"
+	depends on X86
+	select ZONE_DEVICE
+	default y
+	help
+	  Use unpopulated memory ranges in order to create mappings for guest
+	  memory regions, including grants maps and foreign pages. This avoids
+	  having to balloon out RAM regions in order to obtain physical memory
+	  space to create such mappings.
 
 endmenu

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
