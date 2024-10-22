Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DECAD9A9B38
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 09:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBE710E5F4;
	Tue, 22 Oct 2024 07:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.b="Ug5CIh3w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2BA10E5F4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 07:38:49 +0000 (UTC)
Received: from hillosipuli.retiisi.eu
 (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net
 [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sailus)
 by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4XXkZD0MHgz49QB3;
 Tue, 22 Oct 2024 10:38:43 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1729582726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JywbDX15nq2UroYMBFhAwnTYlwi6J5gla6pJnh99TIQ=;
 b=Ug5CIh3wd2favuBs1zfGzgeIkMM18PuICQn4kLoZEJF0I4Iln0b7X/T7H6MzFZJyZE2cJu
 ZUYb1Aatxq1+44x1A5kz1yR7y5GHTVbmSGuF35ipvd5WZdwq7NANsn9zr9//Q0s++1RBcT
 zD33msa5ng7EXjNYRn68gTZ0y+GUcXNPSiG5dPoiMd3O7K8iFJe51SmJupZNXjgE8Q/dR+
 dfzbvBKXHPdl1o8VxEb3MVqgwkyN9xJa7zr8egkcNAqPqeWgCHTYCgbo7r8jEFczuEQ5eg
 10ahoL7v44SCGrGMK4rS6ZgIPKTyVaRLrCnImsjCepCwK6aZAl0gVAv6/3M4Bw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1729582726; a=rsa-sha256; cv=none;
 b=aVNLoEqQSDWxxRn0i2iY3h5UOGcvN7v8Fehljky+yjTbGMIJcUIdD4BmdcMe7y0/md0qwO
 OF/IjxdhqSq5jEQ4GUF7ljU9ap6QpiQ/eh2wT5PQcE8IFX7BRLFN9RleK1VVNRALBoTDPN
 3Z7ZTPph2Bb078svCVX8lPkJrPXmh6SgZjROgX8mIwL6cMspFPT6LNSUeBUk1Kf1g8PHDr
 0HHSkkEWwZzcKCebGtxNdk3Au8JHDqiFuGVTX7Ts7dwEPt2/VQh/Tthg8nnNPwZ6aPmP44
 pBVJ4av4Ug9EzkKMvHHAUJ+Vfe+5vKuaEMAqigUQ7EjG0kyZLGMWj2ilzK+N4Q==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=lahtoruutu; t=1729582726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JywbDX15nq2UroYMBFhAwnTYlwi6J5gla6pJnh99TIQ=;
 b=ahBeazQXJN0sr8dX4cYyLxfpE+ornNZKUNgPkuQhUNVFh0GvouWLDbBG6hj/J+Jol/+lZY
 Vbmm5gMKvx0zgA8qPZMD3mwduEwy+9nbCnDPvxKzJcxz1vqcBRe+QN6nOEyvHl0+fqQrZz
 MDk1ep9790xOKq/TLoQ3eU7aoKaHUVHl/VPWpxGlbrPeYIFs1uidFn/18kHKVCDUOSVQic
 q6GzpsxzFrcVfeZUOEVb6jklequWQjeYxTWdjlI2l0iK5oevJrOtJPuO95m0Md8A11wVXa
 XpFapAUycljenzSdhyVUKPCuqSHQSUBZrpNWmzLQguxrxcmhy2v+jB/jk7MfKA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 96BB5634C93;
 Tue, 22 Oct 2024 10:38:43 +0300 (EEST)
Date: Tue, 22 Oct 2024 07:38:43 +0000
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
Subject: Re: [PATCH v7 9/9] media: xilinx-tpg: use new of_graph functions
Message-ID: <ZxdWg68UVopg7ZvT@valkosipuli.retiisi.eu>
References: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
 <87jzeirqv3.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzeirqv3.wl-kuninori.morimoto.gx@renesas.com>
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

Hi Morimoto-san, Rob,

On Wed, Oct 09, 2024 at 01:45:36AM +0000, Kuninori Morimoto wrote:
> Now we can use new port related functions for port parsing. Use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

I.e. it's ok to merge this via non-media tree.

-- 
Kind regards,

Sakari Ailus
