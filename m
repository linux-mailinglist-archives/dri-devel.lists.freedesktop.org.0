Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E064165AC5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 10:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFF36E8B2;
	Thu, 20 Feb 2020 09:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786026E8B2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 09:59:20 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1D831292A45;
 Thu, 20 Feb 2020 09:59:19 +0000 (GMT)
Date: Thu, 20 Feb 2020 10:59:16 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv5 03/34] drm/gem-fb-helper: Add special version of
 drm_gem_fb_size_check
Message-ID: <20200220105916.6f8bb40f@collabora.com>
In-Reply-To: <20191217145020.14645-4-andrzej.p@collabora.com>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
 <20191217145020.14645-4-andrzej.p@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: kernel@collabora.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 James Wang <james.qian.wang@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 17 Dec 2019 15:49:49 +0100
Andrzej Pietrasiewicz <andrzej.p@collabora.com> wrote:

>  
>  static const struct drm_framebuffer_funcs drm_gem_fb_funcs_dirtyfb = {
> diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
> index c85d4b152e91..4955af96d6c3 100644
> --- a/include/drm/drm_gem_framebuffer_helper.h
> +++ b/include/drm/drm_gem_framebuffer_helper.h
> @@ -11,6 +11,18 @@ struct drm_mode_fb_cmd2;
>  struct drm_plane;
>  struct drm_plane_state;
>  struct drm_simple_display_pipe;
> +struct drm_size_check;
> +
> +/**
> + * struct drm_size_check - Description of special requirements for size checks.
> + */
> +struct drm_size_check {
> +	unsigned int min_size[4];
> +	bool use_min_size;
> +	u32 pitch_multiplier[4];
> +	u32 pitch_modulo;
> +	bool use_pitch_multiplier;
> +};

How about adding a ->size_check() hook to drm_framebuffer_funcs so that
each driver can provide its custom size_check logic. That sounds more
future-prood than trying to make all kind of size-checking fit in
this size-constraint descriptor, plus you wouldn't need this new
drm_gem_fb_size_check2 function.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
