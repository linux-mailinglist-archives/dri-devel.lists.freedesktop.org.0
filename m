Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7058D38B86A
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 22:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439156F546;
	Thu, 20 May 2021 20:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAD36F546
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 20:28:59 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id t206so9943610wmf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 13:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pzIrqo0iPF0+HXbP98gGMjsMEkhBnb1ZZRdolfv5z30=;
 b=jbzf0PMJoTx3jdmZHO7iUwJNO/P9LnoOVHyVn06+q8qwmpPsmA5slB0UXyWu3X9BFS
 5Mywo3uJSJ9Rz0rOU67+po2jgJGbsXi8R0S8kUnqgt1wBEi7QKL80lUlNhIqYSqq8hSl
 M7lN9OFX0DDiioIlAc3X2TfLDu3C/U1wsTcik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pzIrqo0iPF0+HXbP98gGMjsMEkhBnb1ZZRdolfv5z30=;
 b=iN5X+9zJj7DD96K+lwiQJjmcladLbmtgp9TggBSoV1v9lSTAM3mH/bksssSsUVcMy0
 kWB6+jfv+EkWLCbHo0sqmjVL73Fw+q488GwtiVp5tQGapUUDwYcJ/nKG/LZCKWk+2dNW
 Afx12bFRglv+fugPqJwdTIpLl/3jIPKo03NCjq+aNCfemtDCte1YcM+CjHaD+fdONOev
 bYpa1NLUc+Yb2NMhUhtnZvdSuv6DEYbprO3Lete/ODDD8pFDdBHPj8UGemluM/vtLcEE
 o3EnCJNrUIJNtKGTDnXJY6RitZQBq6MrVSz32K6pmwjyIAhnCdqvL6uKs/CAbx9KyF71
 fwJg==
X-Gm-Message-State: AOAM533AyQ3QNDpSp9Dv4FuDB0qO3qUise165vdZm3grmLxiP4kpuc8E
 /bVPKoVKFtMsR67izAOOR+gCuw==
X-Google-Smtp-Source: ABdhPJzDti4Btph6sXtOL+2GdKhmlFbkFs8CjrB34SM+DrfT8knDdmX7iovhT9IMFTfpzs4MCy9fTA==
X-Received: by 2002:a05:600c:2219:: with SMTP id
 z25mr5306207wml.78.1621542537805; 
 Thu, 20 May 2021 13:28:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z66sm11236243wmc.4.2021.05.20.13.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 13:28:57 -0700 (PDT)
Date: Thu, 20 May 2021 22:28:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/ttm: Explain why ttm_bo_add_move_fence uses a shared
 slot
Message-ID: <YKbGh65vB6e69Q1v@phenom.ffwll.local>
References: <20210519082409.672016-1-daniel.vetter@ffwll.ch>
 <ac723ad9-e2e3-38e7-e178-db0246cdffa0@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac723ad9-e2e3-38e7-e178-db0246cdffa0@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 12:43:49PM +0200, Christian König wrote:
> Am 19.05.21 um 10:24 schrieb Daniel Vetter:
> > Motivated because I got confused and Christian confirmed why this
> > works. I think this is non-obvious enough that it merits a slightly
> > longer comment.
> > 
> > Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Cc: Huang Rui <ray.huang@amd.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Applied to drm-misc-next, thanks for reviewing.
-Daniel

> 
> > ---
> >   drivers/gpu/drm/ttm/ttm_bo.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > index ca1b098b6a56..51a94fd63bd7 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -682,7 +682,9 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
> >   }
> >   /*
> > - * Add the last move fence to the BO and reserve a new shared slot.
> > + * Add the last move fence to the BO and reserve a new shared slot. We only use
> > + * a shared slot to avoid unecessary sync and rely on the subsequent bo move to
> > + * either stall or use an exclusive fence respectively set bo->moving.
> >    */
> >   static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
> >   				 struct ttm_resource_manager *man,
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
