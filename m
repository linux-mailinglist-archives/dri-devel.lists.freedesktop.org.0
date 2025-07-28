Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F557B1423F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 20:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6C910E57A;
	Mon, 28 Jul 2025 18:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=grimler.se header.i=@grimler.se header.b="AdLxBKNw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com
 [95.215.58.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3517410E57C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 18:56:27 +0000 (UTC)
Date: Mon, 28 Jul 2025 20:56:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
 t=1753728985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GsTJh65LY657rqwkxVWVgzfBPNOafbvVgWWFNGM+6ko=;
 b=AdLxBKNw43B4adzhvF90yj/2kXCTQ4k6U4mTfyNfit06LtIw5DxJYHqFBUpqzXQuVBnazH
 kkTf6Am29nrGFZPJkTE6Em6nIq3uRq3WtOQDGMvUO2zuuXDFPrZuvRZQmFs5UdVw06mIyJ
 o3y35B+xuSzWfcQZ5HIDh/WDP64Jexw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] drm/bridge: sii9234: use dev_err_probe where
 applicable
Message-ID: <20250728185609.GA160878@grimfrac.localdomain>
References: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
 <20250724-exynos4-sii9234-driver-v2-2-faee244f1d40@grimler.se>
 <opsrp4mlhwzoldthsna5wx32b755wl3uxrbqvocvnl5ssduf3k@76a7fycatbho>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <opsrp4mlhwzoldthsna5wx32b755wl3uxrbqvocvnl5ssduf3k@76a7fycatbho>
X-Migadu-Flow: FLOW_OUT
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

Hi Dmitry,

On Sun, Jul 27, 2025 at 07:38:12PM +0300, Dmitry Baryshkov wrote:
> On Thu, Jul 24, 2025 at 08:50:52PM +0200, Henrik Grimler wrote:
> > In case of error during resource acquisition the driver should print
> > an error message only if it is not deferred probe. Use dev_err_probe
> > helper to handle this, which will also record defer probe reason for
> > debugging.
[...]
> > @@ -836,9 +835,7 @@ static int sii9234_init_resources(struct sii9234 *ctx,
> >  	ctx->supplies[3].supply = "cvcc12";
> >  	ret = devm_regulator_bulk_get(ctx->dev, 4, ctx->supplies);
> >  	if (ret) {
> > -		if (ret != -EPROBE_DEFER)
> > -			dev_err(ctx->dev, "regulator_bulk failed\n");
> > -		return ret;
> > +		dev_err_probe(ctx->dev, ret, "regulator_bulk failed\n");
> 
> Drop the braces, use 'return dev_err_probe(...)'
> 
> >  	}
> >  
> >  	ctx->client[I2C_MHL] = client;

Thanks for reviewing and spotting that, will fix in next version!

Best regards,
Henrik Grimler
