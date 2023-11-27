Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4327FA8DC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 19:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20C610E0D4;
	Mon, 27 Nov 2023 18:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB2D10E0D4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 18:21:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 9ED1BB83707;
 Mon, 27 Nov 2023 18:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA2DC433C9;
 Mon, 27 Nov 2023 18:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1701109258;
 bh=BPEZYswnHtTaDhuMtTBDQ96uRSzMIQ5kvejeliwaiw0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cbYCKymX+5I0u4bFW2dSOUBGffKJZEu4kdzCzL23Kk94zcTnWWAca+/slwSlhBAYt
 4BTNz2Dbl6Hl6QFHfVyiEaintVNanLQNjr6r+l+ruFJhY663j1FjPtzt8Vu3k621z+
 yL31ybOwTuhQpyAY9zO4VMWvlOt6zTZ70PKG5CBE=
Date: Mon, 27 Nov 2023 18:20:55 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 1/2] driver core: Export device_is_dependent() to
 modules
Message-ID: <2023112739-willing-sighing-6bdd@gregkh>
References: <20231127051414.3783108-1-victor.liu@nxp.com>
 <20231127051414.3783108-2-victor.liu@nxp.com>
 <v6rthnruba5xaxazsn4jsptn6catso5qwuyf5xxbf4ml25b6eo@snttjo7oqlod>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <v6rthnruba5xaxazsn4jsptn6catso5qwuyf5xxbf4ml25b6eo@snttjo7oqlod>
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
Cc: sfr@canb.auug.org.au, ulf.hansson@linaro.org, jernej.skrabec@gmail.com,
 rfoss@kernel.org, tzimmermann@suse.de, rafael@kernel.org,
 Liu Ying <victor.liu@nxp.com>, neil.armstrong@linaro.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, jonas@kwiboo.se,
 linux-next@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 27, 2023 at 05:38:13PM +0100, Maxime Ripard wrote:
> Greg, Rafael,
> 
> On Mon, Nov 27, 2023 at 01:14:13PM +0800, Liu Ying wrote:
> > Export device_is_dependent() since the drm_kms_helper module is starting
> > to use it.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v2:
> > * Newly introduced as needed by patch 2.
> > 
> >  drivers/base/core.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index 67ba592afc77..bfd2bf0364b7 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -328,6 +328,7 @@ int device_is_dependent(struct device *dev, void *target)
> >  	}
> >  	return ret;
> >  }
> > +EXPORT_SYMBOL_GPL(device_is_dependent);
> 
> So, a committer just applied this to drm-misc-fixes without your
> approval. Could you ack it? If you don't want to, we'll fix it.

Wait, why exactly is this needed?  Nothing outside of the driver core
should be needing this function, it shouldn't be public at all (I missed
that before.)

So please, revert it for now, let's figure out why DRM thinks this is
needed for it's devices, and yet no other bus/subsystem does.

thanks,

greg k-h
