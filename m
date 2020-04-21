Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF3D1B381B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3ABD6E9AD;
	Wed, 22 Apr 2020 06:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326586E2F9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 18:59:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.72,411,1580770800"; d="scan'208";a="346583965"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 20:59:10 +0200
Date: Tue, 21 Apr 2020 20:59:09 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] drm/xen-front: Add support for Xen PV display
 frontend
In-Reply-To: <20200421175220.GE2659@kadam>
Message-ID: <alpine.DEB.2.21.2004212057070.3118@hadrien>
References: <20200421104522.GA86681@mwanda>
 <alpine.DEB.2.21.2004211728360.3118@hadrien> <20200421175220.GE2659@kadam>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Apr 2020 06:54:41 +0000
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
Cc: xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, oleksandr_andrushchenko@epam.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Tue, 21 Apr 2020, Dan Carpenter wrote:

> On Tue, Apr 21, 2020 at 05:29:02PM +0200, Julia Lawall wrote:
> >
> >
> > On Tue, 21 Apr 2020, Dan Carpenter wrote:
> >
> > > Hi Kernel Janitors,
> > >
> > > Here is another idea that someone could work on, fixing the
> > > IS_ERR_OR_NULL() checks in the xen driver.
> > >
> > > The patch c575b7eeb89f: "drm/xen-front: Add support for Xen PV
> > > display frontend" from Apr 3, 2018, leads to the following static
> > > checker warning:
> > >
> > > 	drivers/gpu/drm/xen/xen_drm_front_gem.c:140 xen_drm_front_gem_create()
> > > 	warn: passing zero to 'ERR_CAST'
> > >
> > > drivers/gpu/drm/xen/xen_drm_front_gem.c
> > >    133  struct drm_gem_object *xen_drm_front_gem_create(struct drm_device *dev,
> > >    134                                                  size_t size)
> > >    135  {
> > >    136          struct xen_gem_object *xen_obj;
> > >    137
> > >    138          xen_obj = gem_create(dev, size);
> > >    139          if (IS_ERR_OR_NULL(xen_obj))
> > >    140                  return ERR_CAST(xen_obj);
> >
> > Are the other occurrences of this also a possible problem?  There are a
> > few others outside of xen.
>
> We sometimes check a parameter for IS_ERR_OR_NULL().
>
> void free_function(struct something *p)
> {
> 	if (IS_ERR_OR_NULL(p))
> 		return;
> }
>
> That's fine, absolutely harmless and not a bug.  But if we are checking
> a return value like this then probably most of the time it's invalid
> code.  Normally it's again like this code where we're dealing with an
> impossible thing because the return is never NULL.  The common bugs are
> that it returns NULL to a caller which only expects error pointers or it
> returns success instead of failure.  But sometimes returning success can
> be valid:
>
> 	obj = get_feature(dev);
> 	if (IS_ERR_OR_NULL(obj))
> 		return PTR_ERR(obj);
>
> It deliberately returns success because the rest of the function is
> useless when we don't have the feature.

The other cases are also with ERR_CAST:

drivers/infiniband/hw/usnic/usnic_ib_qp_grp.c in create_udp_flow
fs/overlayfs/namei.c in ovl_index_upper
sound/soc/qcom/qdsp6/q6adm.c in q6adm_open
drivers/clk/clk.c in clk_hw_create_clk

julia
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
