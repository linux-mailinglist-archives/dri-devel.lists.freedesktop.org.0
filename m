Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7221A58DC52
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 18:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036FE8AFE9;
	Tue,  9 Aug 2022 16:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2BB61137EA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 16:41:13 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id y13so23133078ejp.13
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 09:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc;
 bh=naNpYkxE68tX1ARbD3iQv+CO+kO6ut9LpVz/MEIjf2U=;
 b=iX9Se9TiI3Acb0PyhnYkVRNdA7lVQuf4CJDx2D6WpGaKbYqVnU4KX3GTPDDKS7PYVg
 gZCH6sdLyyngWxfgd5D+yNp6kzG+ewgTuTXqWMqSckX17sr8zonXMCWzvhLjGrjQGv/c
 ell5/FxG7+4Gqy9X+TsWsq7ykFiSjP9m/Frk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc;
 bh=naNpYkxE68tX1ARbD3iQv+CO+kO6ut9LpVz/MEIjf2U=;
 b=BZ63B808hOiY8ljn/iVvR66tzjg+L98ut+o9BSyMbRihAMlytYP/V29MRPEoiKTzaA
 EfeRBNVv6mnjcfMZfSb2pUuof+fhqAIV7AyejsHgnRe2XCpTZDoVuR2I52pTFZAZ+e2i
 SCQE8WrPeGI8wSuptrC7GuIVeFTACPqTtCDZGIgJCcqIRrilbc0oHRVcW7UcGVuDJiMb
 P3xdHoyq07Qiq/IJneANqQWcUczT+2oHEZIzhs4noo1BwOGRxzH/Ff4mjANRIAiudA7n
 h9YaJ8TuSyx4jkH05WcTIL5Znc/FwQM/HaGhrqeH/r69KvcqwgU0nvxcBmmUCYCFuWAr
 MYpw==
X-Gm-Message-State: ACgBeo32DYv71bsa21veYDAqVNEVxLntuk9f38xxiv5s/u9r4tuOznEk
 3ZUCMjyki+otZdYpt5Co8vvzkw==
X-Google-Smtp-Source: AA6agR5JiN6PB/2pP/tfQ4vgKWFUin1cCx29k5oNnI6uFJ+xd5aN1v/0W1ws1t92QMVelRHOPdZjFw==
X-Received: by 2002:a17:907:3f98:b0:730:cfce:9c0f with SMTP id
 hr24-20020a1709073f9800b00730cfce9c0fmr18168166ejc.475.1660063272111; 
 Tue, 09 Aug 2022 09:41:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a056402515900b0043d1a9f6e4asm6277567edd.9.2022.08.09.09.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 09:41:11 -0700 (PDT)
Date: Tue, 9 Aug 2022 18:41:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v7 1/2] drm/gem: Properly annotate WW context on
 drm_gem_lock_reservations() error
Message-ID: <YvKOJRbTsBk91aPO@phenom.ffwll.local>
Mail-Followup-To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org,
 kernel@collabora.com, virtualization@lists.linux-foundation.org
References: <20220630200405.1883897-1-dmitry.osipenko@collabora.com>
 <20220630200405.1883897-2-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630200405.1883897-2-dmitry.osipenko@collabora.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas_os@shipmail.org>,
 linux-kernel@vger.kernel.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 30, 2022 at 11:04:04PM +0300, Dmitry Osipenko wrote:
> Use ww_acquire_fini() in the error code paths. Otherwise lockdep
> thinks that lock is held when lock's memory is freed after the
> drm_gem_lock_reservations() error. The ww_acquire_context needs to be
> annotated as "released", which fixes the noisy "WARNING: held lock freed!"
> splat of VirtIO-GPU driver with CONFIG_DEBUG_MUTEXES=y and enabled lockdep.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7edc3e3b975b5 ("drm: Add helpers for locking an array of BO reservations.")
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

I merged this one to drm-misc-next-fixes. The other one looks like there's
still opens pending, pls resubmit appropriately (and maybe with some
analysis in the commit message of how exactly this impacts other drivers).
-Daniel

> ---
>  drivers/gpu/drm/drm_gem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index eb0c2d041f13..86d670c71286 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1226,7 +1226,7 @@ drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
>  		ret = dma_resv_lock_slow_interruptible(obj->resv,
>  								 acquire_ctx);
>  		if (ret) {
> -			ww_acquire_done(acquire_ctx);
> +			ww_acquire_fini(acquire_ctx);
>  			return ret;
>  		}
>  	}
> @@ -1251,7 +1251,7 @@ drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
>  				goto retry;
>  			}
>  
> -			ww_acquire_done(acquire_ctx);
> +			ww_acquire_fini(acquire_ctx);
>  			return ret;
>  		}
>  	}
> -- 
> 2.36.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
