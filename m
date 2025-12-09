Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A7BCAFB51
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 11:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B508D10E50A;
	Tue,  9 Dec 2025 10:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="j/29xTmz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8216C10E50A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 10:58:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765277916; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lTcSUhwM9bSPYwqWhozKXBINV++FZt2VyJhf8bJt42ZsifrbktMSA5v72qJyGZ5G3SzuJVQT+1bWJtPfOblAZI4TE2OwlUtofvpPVSDpSjAHUd7fcpgzY+Ez8jvDRcbjNOY7N15uvIw0hH7Yiq5kR73oFCHlzexEXYjoh9bjazs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765277916;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ZhZ+DMaVFnsaAoNn1u9s946/IX2aY4shp0I0o4Xsl6E=; 
 b=l92y3mYpv8+dkteFWAOUIWyKoht7QpiuX78ujH21kW14/26WaeOoZBW/Zwl9DEdvJ1g+oR3FFakCVFh6n1xO/jpZdmAo9viaAb7jC1r8Tvvj9ig9Gcth1kSKY8xGYNPHpTCzPRsokUDzbRrAU/e804m6LzSiGhRO5LkHohR+VYo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765277916; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=ZhZ+DMaVFnsaAoNn1u9s946/IX2aY4shp0I0o4Xsl6E=;
 b=j/29xTmzKJ6tZOl1wo+QnYi+H7Jj84UVpnU2yzjUyxclrWqmOYVp+9H46pB5SSMV
 0x9DFomx5pT8tBKxJAAGZLH6+S76vMXNJnYU2J5rlKlJvCpIA+gxQulGA0X+ou+cXTQ
 Oj15G7YM1EDPURUUmsiN8Rso56fanRTYKGm6XOhY=
Received: by mx.zohomail.com with SMTPS id 1765277913550726.3974170059719;
 Tue, 9 Dec 2025 02:58:33 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v2 5/8] drm/rockchip: vop2: Enforce AFBC source alignment
 in plane_check
Date: Tue, 09 Dec 2025 11:58:26 +0100
Message-ID: <8655687.NyiUUSuA9g@workhorse>
In-Reply-To: <4696988.LvFx2qVVIh@workhorse>
References: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
 <f9f7b446-8575-4f16-aa96-5197b22846e3@rock-chips.com>
 <4696988.LvFx2qVVIh@workhorse>
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

Hi Chaoyi Chen, Andy Yan,

On Monday, 8 December 2025 08:24:52 Central European Standard Time Nicolas Frattaroli wrote:
> On Monday, 8 December 2025 03:48:24 Central European Standard Time Chaoyi Chen wrote:
> > Hello Nicolas, Daniel,
> > 
> > On 12/7/2025 4:45 AM, Nicolas Frattaroli wrote:
> > > From: Daniel Stone <daniels@collabora.com>
> > > 
> > > Planes can only source AFBC framebuffers at multiples of 4px wide on
> > > RK3566/RK3568. Instead of clipping on all SoCs when the user asks for an
> > > unaligned source rectangle, reject the configuration in the plane's
> > > atomic check on RK3566/RK3568 only.
> > > 
> > > Signed-off-by: Daniel Stone <daniels@collabora.com>
> > > [Make RK3566/RK3568 specific, reword message]
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 +++++++++-----
> > >  1 file changed, 9 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > index bc1ed0ffede0..e23213337104 100644
> > > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > @@ -1076,6 +1076,13 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
> > >  		return -EINVAL;
> > >  	}
> > >  
> > > +	if (vop2->version == VOP_VERSION_RK3568 && drm_is_afbc(fb->modifier) && src_w % 4) {
> > > +		drm_dbg_kms(vop2->drm,
> > > +			    "AFBC source rectangles must be 4-byte aligned; is %d\n",
> > > +			    src_w);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > >  	return 0;
> > >  }
> > >  
> > > @@ -1237,11 +1244,8 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
> > >  	WARN_ON(src_w < 4);
> > >  	WARN_ON(src_h < 4);
> > >  
> > > -	if (afbc_en && src_w % 4) {
> > > -		drm_dbg_kms(vop2->drm, "vp%d %s src_w[%d] not 4 pixel aligned\n",
> > > -			    vp->id, win->data->name, src_w);
> > > -		src_w = ALIGN_DOWN(src_w, 4);
> > > -	}
> > > +	if (vop2->version == VOP_VERSION_RK3568 && drm_is_afbc(fb->modifier))
> > > +		WARN_ON(src_w % 4);
> > >  
> > >  	act_info = (src_h - 1) << 16 | ((src_w - 1) & 0xffff);
> > >  	dsp_info = (dsp_h - 1) << 16 | ((dsp_w - 1) & 0xffff);
> > > 
> > 
> > You haven't replied to Andy's comment yet [0].
> > 
> > [0] https://lore.kernel.org/dri-devel/7b4e26ec.75f3.19a77276b53.Coremail.andyshrk@163.com/
> > 
> 
> Hello,
> 
> I addressed the follow-ups where it was clarified that the 4 pixel
> limitation was RK3566/RK3568-only. I'm not going to bring back the
> post-atomic_check modification for a fast path, but I'm open to
> suggestions on how to do this differently.
> 
> One solution might be to modify the state with the ALIGN_DOWN stuff
> in atomic_check instead, where userspace is then aware of the change
> being done to its requested parameters. I'll need to double-check
> whether this is in line with atomic modesetting's design.
> 
> Kind regards,
> Nicolas Frattaroli

Okay, so I've asked internally, and atomic_check isn't allowed to
modify any of the parameters either. There's efforts [0] underway
to allow error codes to be more specific, so that userspace knows
which constraint is being violated. That would allow userspace
applications to react by either adjusting their size or turning
off AFBC in this case. Turning off AFBC seems more generally
applicable here, since it means it won't need to resize the plane
and it'll save more than enough memory bandwidth by not going
through the GPU.

On that note: Andy, I didn't find a weston-simple-egl test in the
Weston 14.0.2 or git test suite, and weston-simple-egl itself does
not tell me whether GPU compositing is being used or not. Do you
have more information on how to test for this? I'd like to know
for when we have the necessary functionality in place to make
userspace smart enough to pick the fast path again.

In either case, I think adhering to the atomic API to ensure
artifact-free presentation is more important here than enabling
a fast-path on RK3568. I do think in most real-world use case
scenarios, the fallback won't degrade user experience, because
almost everything performance intensive I can think of (video
playback, games) will likely already use a plane geometry
where the width is divisible by 4. 800, 1024, 1280, 1600, 1920,
2560, 3840 are all divisible by 4, so a window or full-screen
playback of common content won't need to fall back to GPU
compositing.

I'll send a v2 to fix another instance of "eSmart" left in a
message, but beyond that I think we should be good.

Kind regards,
Nicolas Frattaroli

https://lore.kernel.org/dri-devel/20251009-atomic-v6-0-d209709cc3ba@intel.com/ [0]


