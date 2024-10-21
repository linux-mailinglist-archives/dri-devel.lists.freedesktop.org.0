Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B5A9A60A5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 11:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D505810E46A;
	Mon, 21 Oct 2024 09:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.b="HFaWJdUh";
	dkim=pass (1024-bit key; secure) header.d=iki.fi header.i=@iki.fi header.b="TT11sIJs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 492 seconds by postgrey-1.36 at gabe;
 Mon, 21 Oct 2024 09:51:00 UTC
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857DE10E46A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 09:51:00 +0000 (UTC)
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4XX9Mp4n1tz49QG6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 12:42:46 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1729503766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iItfBry1csHzGqUNbyVvEH2vzYvKChbmjbYESjm867M=;
 b=HFaWJdUhknpUxTswJMSo5/Ei8FsJKR0wICU2ChFfuT/B/WcLLx9HY8Vq90z12Scltzd8jY
 siLqCYpHtFqIE2cW1iPcnxFx2K7e/FSbhk5KNp6e7/xDh6wWLAeYkYBKTad7m7+N2z/N9M
 8EUJ91h75DL7Q/Wpe6hRq9fTGgf8SiQUnXZa70Rh9rSUtDhBtWVG+u0pNiagrR3jmmQY3u
 k+tAywNQv7iFDKgWh/Vd7Zc1af162yO9g0y3dFeyVBwQXArzhGQv+O6uOHlk9IpDDN7TPr
 DSAZjgWsVbwyqvwmcbjss0Gp3qZ5zeCC4WjOA+CcPUcX0y4tUp9N7uYccuqWpw==
Received: from hillosipuli.retiisi.eu
 (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net
 [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sailus)
 by meesny.iki.fi (Postfix) with ESMTPSA id 4XX9Mh1c2kzyS6;
 Mon, 21 Oct 2024 12:42:40 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
 t=1729503763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iItfBry1csHzGqUNbyVvEH2vzYvKChbmjbYESjm867M=;
 b=TT11sIJskyRx4EEr+KaB1vS9ZH1SrCpLkOsmpLXhV+msJ8nnG/c+KvasmmZkysT/XmnZSF
 yzI1WuUO2SX3wT0J+rpBDVKiWNTyzy+UbHSQOIEjaKqHupcEcstRyggRrZ89bJ/pCW6MjT
 E1gF2WbPBegINFg/pG7UZVa227DDmg8=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1729503763; a=rsa-sha256; cv=none;
 b=dAu7+pIdIlghojNCKKb7WLzQDsJuVijf/a7ZiZcBa3UA0XHPe/kht+wAwuGAtiUGqpd4Te
 LfWGHY+l6PAYM9iVxr/PvQS7IEAJYX2426q2duOLHAS+HnQV5/TLv/P2PjNAInD2SIs2mA
 VmHE41wmRy6Gy3+u9bU6C4EA22IgZbk=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=meesny; t=1729503763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iItfBry1csHzGqUNbyVvEH2vzYvKChbmjbYESjm867M=;
 b=bVCLNoC2TXGV7eAh0a6ceMJHIaPpJJU1ZaP4jA0ZfxVTtkfzdDdnxcM0fVFHXDiBvvll/R
 NYiTURklrRn0pW+Wj4zdDxekI5VlHJkikY5JLAyrUcNxC6Kac8dWOivI6OMsfq/uZ4Fr52
 R79/Djv0r4sJdwZfbt0SWAbsfKTtT4A=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6DC52634C93;
 Mon, 21 Oct 2024 12:42:39 +0300 (EEST)
Date: Mon, 21 Oct 2024 09:42:39 +0000
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
Message-ID: <ZxYiD5CCzcrwbD1o@valkosipuli.retiisi.eu>
References: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
 <87v7y2rqwf.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7y2rqwf.wl-kuninori.morimoto.gx@renesas.com>
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

Dead Morimoto-san,

On Wed, Oct 09, 2024 at 01:44:48AM +0000, Kuninori Morimoto wrote:
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 11b922fde7af..6a5d27dd0c64 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -630,6 +630,43 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
>  }
>  EXPORT_SYMBOL(of_graph_get_port_by_id);
>  
> +/**
> + * of_graph_get_next_port() - get next port node.
> + * @parent: pointer to the parent device node, or parent ports node
> + * @prev: previous port node, or NULL to get first
> + *
> + * Parent device node can be used as @parent whether device node has ports node or not.

This line should be wrapped, no reason to have it longer than 80 chars.

Maybe this could be done while applying?

> + * It will work same as ports@0 node.
> + *
> + * Return: A 'port' node pointer with refcount incremented. Refcount
> + * of the passed @prev node is decremented.
> + */

-- 
Kind regards,

Sakari Ailus
