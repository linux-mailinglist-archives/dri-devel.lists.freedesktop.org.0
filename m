Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25718CB8D29
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 13:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C403910E34F;
	Fri, 12 Dec 2025 12:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Y/hAqvQK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5722610E34F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 12:46:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765543444; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Weu0CDwZIa4DQj4+JZX7MHkwLnD7GMhEeDpXz4JwPDXJ+UweHch98irmB8CPR62O81T234en7sTKdqH1muGOKJYGWf7qc0It4VziJ5ozii+mCR6bI0fO7BT/8fRA2e5z4g9Pno9dv1wIv0W2bJaQUuAu8Xvc/VM5HuF+tA9S9lM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765543444;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=NCtTFdAR550Ro/EK0CpnBBWGB4plAQMacluoc0gbQ24=; 
 b=KSsna4+V13P+LGlIn1om0lqh6qg30/GXTjbn8HKEMH+IVBlsdFMlEJYO1Y9qxFAFq+rSPdT4kmuzmvJzZb1+dHchXqHq/fYLqqf1kjehS++1gKhHu/RllM31AeVlRaw/9K4wTN5Tb9bT2B0utx4fDrPRj69IoA1I8iPpXcyJ7PE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765543444; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=NCtTFdAR550Ro/EK0CpnBBWGB4plAQMacluoc0gbQ24=;
 b=Y/hAqvQKLHS0IpK+77z+Oa5HaISq+OWT8kgiCPMRfk9ZhuFlyxQN9I708ZrRgHmd
 KeELLl4Uxm8q7qeY5lBzkUREGDOJLMty6wC42IB+2RbWzEU1mGOl/Q7jrb/esrpKlQi
 kNlTHiTDSV8hSOA/Py7ngJPYTtIf00XGdYNQI/Zk=
Received: by mx.zohomail.com with SMTPS id 1765543441860202.14133912038153;
 Fri, 12 Dec 2025 04:44:01 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>,
 kernel@collabora.com
Subject: Re: [PATCH v4 1/8] drm/rockchip: vop2: Switch impossible format
 conditional to WARN_ON
Date: Fri, 12 Dec 2025 13:43:55 +0100
Message-ID: <14738785.uLZWGnKmhe@workhorse>
In-Reply-To: <20251211223822.6eeabb4d@pumpkin>
References: <20251211-vop2-atomic-fixups-v4-0-5d50eda26bf8@collabora.com>
 <20251211-vop2-atomic-fixups-v4-1-5d50eda26bf8@collabora.com>
 <20251211223822.6eeabb4d@pumpkin>
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

On Thursday, 11 December 2025 23:38:22 Central European Standard Time David Laight wrote:
> On Thu, 11 Dec 2025 21:40:31 +0100
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:
> 
> > From: Daniel Stone <daniels@collabora.com>
> > 
> > We should never be able to create a framebuffer with an unsupported
> > format, so throw a warning if this ever happens, instead of attempting
> > to stagger on.
> 
> It doesn't look like you've changed the behaviour.

Yes, the commit message needs to be adjusted.

> Except that all the systems with PANIC_ON_WARN set will panic.
> I believe that is somewhere over 90% of systems.

I also like making up statistics. Warning here is the correct move
in my opinion because this warning being triggered indicates a bug
in the kernel code, and with PANIC_ON_WARN the user explicitly says
they would rather panic in such a case than treat it as an abnormal
condition that is recoverable.

The reason why this condition ever occurring should be treated as an
abnormal condition is because the DRM subsystem should guarantee we
don't get a framebuffer of a format we didn't explicitly declare
support for in the first place. So this condition being hit either
means drm_universal_plane_init is broken, or the array of formats
that's passed to it is out of sync with the conversion code, which
is also a bug. Or someone managed to thoroughly hose DRM's internal
kernel-side data structures, which is precisely the kind of thing
PANIC_ON_WARN users want to abort for.

> 
> 	David
> 
> > 
> > Signed-off-by: Daniel Stone <daniels@collabora.com>
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > index 498df0ce4680..20b49209ddcd 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > @@ -1030,7 +1030,8 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
> >  		return 0;
> >  
> >  	format = vop2_convert_format(fb->format->format);
> > -	if (format < 0)
> > +	/* We shouldn't be able to create a fb for an unsupported format */
> > +	if (WARN_ON(format < 0))
> >  		return format;
> >  
> >  	/* Co-ordinates have now been clipped */
> > 
> 
> 




