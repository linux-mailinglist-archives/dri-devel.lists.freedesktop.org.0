Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9242CECCB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 12:12:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF2889F6D;
	Fri,  4 Dec 2020 11:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CC189F4F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 11:12:39 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 301EC1F45F67;
 Fri,  4 Dec 2020 11:12:38 +0000 (GMT)
Date: Fri, 4 Dec 2020 12:12:35 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 5/7] drm/tidss: Set bus_format correctly from
 bridge/connector
Message-ID: <20201204121235.4bbbe2eb@collabora.com>
In-Reply-To: <422bd85b-cbda-7b9f-4393-057bef127894@ti.com>
References: <20201201121830.29704-1-nikhil.nd@ti.com>
 <20201201121830.29704-6-nikhil.nd@ti.com>
 <20201204115030.04509092@collabora.com>
 <422bd85b-cbda-7b9f-4393-057bef127894@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Yuti Amonkar <yamonkar@cadence.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 4 Dec 2020 12:56:27 +0200
Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:

> Hi Boris,
> 
> On 04/12/2020 12:50, Boris Brezillon wrote:
> > On Tue, 1 Dec 2020 17:48:28 +0530
> > Nikhil Devshatwar <nikhil.nd@ti.com> wrote:
> >   
> >> Remove the old code to iterate over the bridge chain, as this is
> >> already done by the framework.
> >> The bridge state should have the negotiated bus format and flags.
> >> Use these from the bridge's state.
> >> If the bridge does not support format negotiation, error out
> >> and fail.  
> > 
> > That'd be even better if you implement the bridge interface instead of
> > the encoder one so we can get rid of the encoder_{helper}_funcs and use
> > drm_simple_encoder_init().  
> 
> I'm a bit confused here. What should be the design here...
> 
> These formats need to be handled by the crtc (well, the display controller, which is modeled as the
> crtc). Should we have a tidss_crtc.c file, which implements a crtc, a simple encoder and a bridge?
> And just consider those three DRM components as different API parts of the display controller?

The idea is to hide the encoder abstraction from drivers as much as we
can. We have to keep the encoder concept because that's what we expose
to userspace, but drivers shouldn't have to worry about the distinction
between the first bridge in the chain (what we currently call encoders)
and other bridges. The bridge interface provides pretty much the same
functionality, so all you need to do is turn your encoder driver into a
bridge driver (see what we did for
drivers/gpu/drm/imx/parallel-display.c), the only particularity here is
that the bridge knows it's the first in the chain, and has access to
the CRTC it's directly connected to.

IMHO, the less interfaces we keep the clearer it gets for our users.
Getting rid of the encoder_{helper_}funcs in favor or bridge_ops would
clarify the fact that any kind of encoder, no matter if it's the first
in the chain or not, should be represented as a bridge object.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
