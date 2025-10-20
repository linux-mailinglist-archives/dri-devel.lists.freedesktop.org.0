Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C02BF0EBF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 13:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A81410E29A;
	Mon, 20 Oct 2025 11:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="PaL/OAYl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928C210E29A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 11:51:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760961056; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=C6s9lTyHmYNGClzUwi70t4LJADX3+pHHK1XyNHdHK8pkqZ0ewDbfJbwIXWji+uiKKcmUeuBW6l+zGWUuO+03pxUuW4fSbebuqG/S8KLJ5DCvdHU667ISmBHyMLGiEhevq79+UUaFc7vwqAm5S5mMXdCMvSHVgcf314a5waiB5NI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760961056;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=A/c/4oL8Z03NjnVaEgMnJiauD1mgyw2BMdnR11SbtOU=; 
 b=iW82Q/ZctwRGQX/L9mOKuaimgoLOz0fVBR1M3TyCll3uEAfcdqH7w9UXuCqxDvtaM0ZJWtujTQtrBMFIsHz79mKsGlZlxVJUxxPgaOPiETDnmLnSSlwiQ6TTLdJq4ZGBBnB7YHbpk1mKNlRkRjCJStTnqRl8T1J3jkhSJ2wQsK0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760961056; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=A/c/4oL8Z03NjnVaEgMnJiauD1mgyw2BMdnR11SbtOU=;
 b=PaL/OAYlpW7pCWoX/nW8/r5Ars7ZMGegZ6sORd7Ra52eVXY8qtIgTV84a6OuCiti
 f1QFLSFukxd6rYxUkCCtp1sRRNyjyBoz59JCtIF/7UUcfAFVo1cFMZUeeejGOl4n1WW
 oo+B23a8e3D8+ZHnwIQTPwmfqEktI30JqVK/GOy4=
Received: by mx.zohomail.com with SMTPS id 1760961055618931.097867690532;
 Mon, 20 Oct 2025 04:50:55 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Karunika Choo <karunika.choo@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH v8 4/5] drm/panthor: Use existing OPP table if present
Date: Mon, 20 Oct 2025 13:50:47 +0200
Message-ID: <12781303.O9o76ZdvQC@workhorse>
In-Reply-To: <386ca96d-34b6-4aab-844d-ea720099cf6b@arm.com>
References: <20251017-mt8196-gpufreq-v8-0-98fc1cc566a1@collabora.com>
 <20251017-mt8196-gpufreq-v8-4-98fc1cc566a1@collabora.com>
 <386ca96d-34b6-4aab-844d-ea720099cf6b@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Monday, 20 October 2025 10:35:04 Central European Summer Time Karunika Choo wrote:
> On 17/10/2025 16:31, Nicolas Frattaroli wrote:
> > On SoCs where the GPU's power-domain is in charge of setting performance
> > levels, the OPP table of the GPU node will have already been populated
> > during said power-domain's attach_dev operation.
> > 
> > To avoid initialising an OPP table twice, only set the OPP regulator and
> > the OPPs from DT if there's no OPP table present.
> > 
> > Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_devfreq.c | 32 ++++++++++++++++++++++---------
> >  1 file changed, 23 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> > index a6dca599f0a5..ec63e27f4883 100644
> > --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> > +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> > @@ -141,6 +141,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
> >  	struct thermal_cooling_device *cooling;
> >  	struct device *dev = ptdev->base.dev;
> >  	struct panthor_devfreq *pdevfreq;
> > +	struct opp_table *table;
> >  	struct dev_pm_opp *opp;
> >  	unsigned long cur_freq;
> >  	unsigned long freq = ULONG_MAX;
> > @@ -152,17 +153,30 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
> >  
> >  	ptdev->devfreq = pdevfreq;
> >  
> > -	ret = devm_pm_opp_set_regulators(dev, reg_names);
> > -	if (ret && ret != -ENODEV) {
> > -		if (ret != -EPROBE_DEFER)
> > -			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
> > -		return ret;
> > +	/*
> > +	 * The power domain associated with the GPU may have already added an
> > +	 * OPP table, complete with OPPs, as part of the platform bus
> > +	 * initialization. If this is the case, the power domain is in charge of
> > +	 * also controlling the performance, with a set_performance callback.
> > +	 * Only add a new OPP table from DT if there isn't such a table present
> > +	 * already.
> > +	 */
> > +	table = dev_pm_opp_get_opp_table(dev);
> > +	if (IS_ERR_OR_NULL(table)) {
> > +		ret = devm_pm_opp_set_regulators(dev, reg_names);
> > +		if (ret && ret != -ENODEV) {
> 
> Is there a reason to not fail on -ENODEV? I would assume it is a valid 
> failure path. 

Hi,

the -ENODEV logic wasn't added by me, it was added in
Commit: a8cb5ca53690 ("drm/panthor: skip regulator setup if no such prop")

with the justification

  The regulator is optional, skip the setup instead of returning an
  error if it is not present

I will not be changing anything about this logic in this patch set,
as it is not in scope for MT8196 enablement, since MT8196 does not
use this code path at all.

Kind regards,
Nicolas Frattaroli

> 
> Kind regards,
> Karunika Choo
> 
> > +			if (ret != -EPROBE_DEFER)
> > +				DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
> > +			return ret;
> > +		}
> > +
> > +		ret = devm_pm_opp_of_add_table(dev);
> > +		if (ret)
> > +			return ret;
> > +	} else {
> > +		dev_pm_opp_put_opp_table(table);
> >  	}
> >  
> > -	ret = devm_pm_opp_of_add_table(dev);
> > -	if (ret)
> > -		return ret;
> > -
> >  	spin_lock_init(&pdevfreq->lock);
> >  
> >  	panthor_devfreq_reset(pdevfreq);
> > 
> 
> 




