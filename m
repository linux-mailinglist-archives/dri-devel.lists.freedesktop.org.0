Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC319AC072
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 09:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E775E10E355;
	Wed, 23 Oct 2024 07:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.b="JY4IPgUU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B0A10E355
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 07:38:42 +0000 (UTC)
Received: from hillosipuli.retiisi.eu
 (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net
 [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sailus)
 by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4XYLWf5yY6z49QG8;
 Wed, 23 Oct 2024 10:38:38 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1729669120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1h+F/u7tVRldbNXsJpUJj1dGS4Jj3sN0KCmaRER52UA=;
 b=JY4IPgUUebTOP68hAyVqLDne1vVPZTrNDzB7jAtDtVNYt3IqdjdGY3nb7NWUb1Ak4cmssz
 wEuHxiFPisnqTlhH226i2kq74xvqK0vShaxg1KoDTYP1QZyCdoLfWQUfo2URcJBZUPrveI
 giMrKdFIS+8wuTGm3ydFGpyYEZiWFQAyvhShlkuzJ3iDe4Irmb14RyVcloVJBgFp75qMvM
 MZWr/0uAYxgR+HQefP0Th7dRyCRNJv1MiHoYDjNCjaXdxSMSaC6LPO0tW3cBmgikaTUacl
 j67M/RxZ6vHPbK6+mgixdLEgfyOIzT5m87t863zfc8KwCtaQ4/CS9omSESZ3BQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1729669120; a=rsa-sha256; cv=none;
 b=FvfpxZPPmgr9hTE7bsNVnfE+TfCOBlj0mDd/nFOWogNn/0jz28Yl8iUV8KJcVZ1oNPVK6P
 xmXME5c2wgvTpFZOWL8cKSaYpooYMPbxInmzGez0mZdauQIjjcgq3TtULPC+rDuENlc/TZ
 PojAXNqwA2smd+Uflbnpr91Ag5dkOlwQKr7EuoPboOZkzUIUOzuCRavvxzbG5Jv764DHtr
 veULu9SdmGdJJX8SQ3ZjDS8mIqWY12u1ZK5yZoaTNawBI4VonOBiFCK1VU78WmdbtPJFiW
 9vF4uU/EWjs+i4VcbWYM9QfbpW+WvWnMD5xWwEcUao2nwlnThXPMlfExc919aQ==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=lahtoruutu; t=1729669120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1h+F/u7tVRldbNXsJpUJj1dGS4Jj3sN0KCmaRER52UA=;
 b=h1RgPKM0i5vhy0NAvI3YP9focSGtw0oHdw30Pq7UljFoAXWEiNXjVkgOu8Dm35/2kJWHs6
 HIl0HMv9iEZ9gJgw9/hEfKz25xAFilvPNxUeyj7EYYEoemOHClh0G8dyV+cs/CdYxzcFwq
 D6VpRkKPSLnZD4+K8Q3NLyQzTAmrIraMq8VPGySpvMDP8nqtuSKd3X30U3jN7FBep9K0Cn
 Go/eHa6urAYA1NWZC2jE1xZNZabuk4P9DijkfMOcQoPnJvg5nS9GzIGWt/L70fGlu4qGH2
 8HQv8MG3qRMQEyFh7vvWLS6PxiRaxVpAGvFkg09xiSMP6FGSk3s3Vl451pYZKw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C563F634C94;
 Wed, 23 Oct 2024 10:38:36 +0300 (EEST)
Date: Wed, 23 Oct 2024 07:38:36 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 1/9] of: property: add of_graph_get_next_port()
Message-ID: <Zxin_DeoTPjZ0enu@valkosipuli.retiisi.eu>
References: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
 <87v7y2rqwf.wl-kuninori.morimoto.gx@renesas.com>
 <ZxYiD5CCzcrwbD1o@valkosipuli.retiisi.eu>
 <87y12fwhwy.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y12fwhwy.wl-kuninori.morimoto.gx@renesas.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Morimoto-san,

On Wed, Oct 23, 2024 at 04:40:45AM +0000, Kuninori Morimoto wrote:
> 
> Hi Sakari, again
> 
> > > diff --git a/drivers/of/property.c b/drivers/of/property.c
> > > index 11b922fde7af..6a5d27dd0c64 100644
> > > --- a/drivers/of/property.c
> > > +++ b/drivers/of/property.c
> > > @@ -630,6 +630,43 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
> > >  }
> > >  EXPORT_SYMBOL(of_graph_get_port_by_id);
> > >  
> > > +/**
> > > + * of_graph_get_next_port() - get next port node.
> > > + * @parent: pointer to the parent device node, or parent ports node
> > > + * @prev: previous port node, or NULL to get first
> > > + *
> > > + * Parent device node can be used as @parent whether device node has ports node or not.
> > 
> > This line should be wrapped, no reason to have it longer than 80 chars.
> 
> We can use 100 char now on upstream ?
> 
> 	commit bdc48fa11e46f867ea4d75fa59ee87a7f48be144
> 	("checkpatch/coding-style: deprecate 80-column warning")

It's the checkpatch.pl warning that's gone, not the preference to have
lines shorter than that. This is reflected in
Documentation/process/coding-style.rst as well as the commit message of the
patch removing the warning.

> 
> Thank you for your help !!

You're welcome!

-- 
Kind regards,

Sakari Ailus
