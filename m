Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E62B758DC58
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 18:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F177B911DF;
	Tue,  9 Aug 2022 16:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10054113521
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 16:44:27 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id
 r1-20020a05600c35c100b003a326685e7cso801031wmq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 09:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc;
 bh=kG73ZFGwpqA9MEsaOhGxOyq0S5W0g/PKck6MJrQJjh4=;
 b=IjvlDT3GgnKcWar5hWlV3kmPtlMIw3szkL6RRUTSuwPJE7rdHudxhXegyQLbP/fx1M
 NhNiueI3flr6TSRZBFjxGWtzcrHT0mmP3lo5PnjVx5SsmwuMN8QhC2d/mki5v4qH7HDx
 8w91tH2jhqzru340MMXj1N/ZvULmrkBUYw3Is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc;
 bh=kG73ZFGwpqA9MEsaOhGxOyq0S5W0g/PKck6MJrQJjh4=;
 b=aFe0ex9BxmlAOTLi19fVMUUPwcG+ivk8KXUA4H+YuC8QRqCm1GJbJfBqNbLkIduG7b
 rEx4Mjb7paKGiWntkRUxQHMNc6duh01pFW75ChBk66PvjYGWUtSMcjgr6DuqtvzdUjOo
 gZIKBOWynp4aT5aRj7o1ZR/Lr4uq7di1s7x02vrMlVtPDbTQ3lWTa3x3uSu3NeFiEp/x
 ZHetzBSdwtZql9OTTFB8s/JA/RVGuYZw1Uo6ub6UEEfZ7xEIz3cZ94lvBScKZk6Uey+i
 q84PVTHXiyiuAJOFuhsbsuXBTocq12C27Ec1mkwdvCfDKZAN4L0qg0qZKmOqhsC6EbqI
 ITXw==
X-Gm-Message-State: ACgBeo3t1jBOH/XHuQOysV0KbJ/TE3NyyU6ub5+pnQEC9AKYqt0AMcrX
 KHnQ4Mk1vN0TAgCGn0IXimfAOg==
X-Google-Smtp-Source: AA6agR7Mh8M3suAF/jwjxN+ICA7FrHXNw3HuqSciA+CCbg9rxGZ4/Yyg824wTV/ciSBKOP3NeoJYRQ==
X-Received: by 2002:a1c:f60f:0:b0:3a0:3e0c:1de1 with SMTP id
 w15-20020a1cf60f000000b003a03e0c1de1mr21550404wmc.56.1660063465672; 
 Tue, 09 Aug 2022 09:44:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c351300b003a501ad8648sm18098101wmq.40.2022.08.09.09.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 09:44:25 -0700 (PDT)
Date: Tue, 9 Aug 2022 18:44:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v8 1/2] drm/gem: Properly annotate WW context on
 drm_gem_lock_reservations() error
Message-ID: <YvKO5r5Sr56e9vBf@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org,
 kernel@collabora.com, virtualization@lists.linux-foundation.org
References: <20220701090240.1896131-1-dmitry.osipenko@collabora.com>
 <20220701090240.1896131-2-dmitry.osipenko@collabora.com>
 <a42237c9-6304-4b06-cede-2175c7e7b87d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a42237c9-6304-4b06-cede-2175c7e7b87d@amd.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas_os@shipmail.org>,
 linux-kernel@vger.kernel.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 05, 2022 at 01:33:51PM +0200, Christian König wrote:
> Am 01.07.22 um 11:02 schrieb Dmitry Osipenko:
> > Use ww_acquire_fini() in the error code paths. Otherwise lockdep
> > thinks that lock is held when lock's memory is freed after the
> > drm_gem_lock_reservations() error. The ww_acquire_context needs to be
> > annotated as "released", which fixes the noisy "WARNING: held lock freed!"
> > splat of VirtIO-GPU driver with CONFIG_DEBUG_MUTEXES=y and enabled lockdep.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 7edc3e3b975b5 ("drm: Add helpers for locking an array of BO reservations.")
> > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Also added this r-b tag when merging to drm-misc-next-fixes.
-Daniel

> 
> > ---
> >   drivers/gpu/drm/drm_gem.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index eb0c2d041f13..86d670c71286 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -1226,7 +1226,7 @@ drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
> >   		ret = dma_resv_lock_slow_interruptible(obj->resv,
> >   								 acquire_ctx);
> >   		if (ret) {
> > -			ww_acquire_done(acquire_ctx);
> > +			ww_acquire_fini(acquire_ctx);
> >   			return ret;
> >   		}
> >   	}
> > @@ -1251,7 +1251,7 @@ drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
> >   				goto retry;
> >   			}
> > -			ww_acquire_done(acquire_ctx);
> > +			ww_acquire_fini(acquire_ctx);
> >   			return ret;
> >   		}
> >   	}
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
