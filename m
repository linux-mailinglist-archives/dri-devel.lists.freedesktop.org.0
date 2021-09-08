Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E44403F1B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 20:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E926E24D;
	Wed,  8 Sep 2021 18:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902A86E24D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 18:27:44 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id mf2so6019040ejb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 11:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=h7qqbAYeSJZ8gicucUP36snA5crLbH8LBI1pIK+gSTo=;
 b=GKpD+E+P7KmFYfe1bXOy5uk62XNSgLQzbE+a0vGLxZ2vVQvJXrhl70bt4SkMK9cS5c
 Y19XLuGJ9h/xNT3WL5zcImMwCZLjPgwZuAXSu6ZGIipD4Tvem/cZFlPPamwfWnyGasQF
 Aecs3DgArwpUkNVPDtaS2i8ni0BEOwCO/rNrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=h7qqbAYeSJZ8gicucUP36snA5crLbH8LBI1pIK+gSTo=;
 b=IfNNx44/R9g+MgGmutQ7soMLwAJ/VySYWAtsIHmjQYa9mkrMlnl0kH5ql1QX1mC6sF
 Rcz+cRSHRXmkzNkfxHtehwJevcLnjDNebCcLy6q9mtam+PYZeoZdcQjwCKqRD7dSoeBF
 2KcQCMHj1B018N6FVmVoHtHkdJNMSDVH5NbFXERNynA44l6GIF0rW2JbsKEF0mbN6KMy
 Rhcm3YXHjfAuH1ttrhSBvVhkN/+zaV1E4dPzF4C67NC+4i6Tj7ogVC5nE1tAAtY3f9lj
 n3iKfweUC4Oqzukh9/lLtKBVRSk2nmHBSbWJCwroD8vujr9/VUBPHhnTohkk+91Zyoua
 24sg==
X-Gm-Message-State: AOAM532uUxN4FqmborU5kOaNu0ka9yDp179VbwHbz3Ym7LM4gcLK4rA/
 +sCf9ok1/f2RoK3EVyk0k3HcTp0B4iisdg==
X-Google-Smtp-Source: ABdhPJx2WdSNz2VL5q86R3bQiaG5qfGtjEk//hrIEKSqXkgKTJos41xH1KbiVSg8nKtPcyTQxpEFPw==
X-Received: by 2002:a17:906:c298:: with SMTP id
 r24mr1268253ejz.93.1631125663142; 
 Wed, 08 Sep 2021 11:27:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id bx14sm1582030edb.93.2021.09.08.11.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 11:27:42 -0700 (PDT)
Date: Wed, 8 Sep 2021 20:27:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, xinhui pan <xinhui.pan@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [resend PATCH] drm/ttm: Fix a deadlock if the target BO is not
 idle during swap
Message-ID: <YTkAnDncKU7ewW+5@phenom.ffwll.local>
References: <20210907040832.1107747-1-xinhui.pan@amd.com>
 <074efe24-db7a-df68-3624-05989596f44a@amd.com>
 <YTcrcw+hxWuyyl4C@phenom.ffwll.local>
 <37412f7e-9f6f-04bb-41b1-72931ea1381e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37412f7e-9f6f-04bb-41b1-72931ea1381e@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 07, 2021 at 11:28:23AM +0200, Christian König wrote:
> Am 07.09.21 um 11:05 schrieb Daniel Vetter:
> > On Tue, Sep 07, 2021 at 08:22:20AM +0200, Christian König wrote:
> > > Added a Fixes tag and pushed this to drm-misc-fixes.
> > We're in the merge window, this should have been drm-misc-next-fixes. I'll
> > poke misc maintainers so it's not lost.
> 
> Hui? It's a fix for a problem in stable and not in drm-misc-next.

Ah the flow chart is confusing. There is no current -rc, so it's always
-next-fixes. Or you're running the risk that it's lost until after -rc1.
Maybe we should clarify that "is the bug in current -rc?" only applies if
there is a current -rc.

Anyway Thomas sent out a pr, so it's all good.
-Daniel

> 
> Christian.
> 
> > -Daniel
> > 
> > > It will take a while until it cycles back into the development branches, so
> > > feel free to push some version to amd-staging-drm-next as well. Just ping
> > > Alex when you do this.
> > > 
> > > Thanks,
> > > Christian.
> > > 
> > > Am 07.09.21 um 06:08 schrieb xinhui pan:
> > > > The ret value might be -EBUSY, caller will think lru lock is still
> > > > locked but actually NOT. So return -ENOSPC instead. Otherwise we hit
> > > > list corruption.
> > > > 
> > > > ttm_bo_cleanup_refs might fail too if BO is not idle. If we return 0,
> > > > caller(ttm_tt_populate -> ttm_global_swapout ->ttm_device_swapout) will
> > > > be stuck as we actually did not free any BO memory. This usually happens
> > > > when the fence is not signaled for a long time.
> > > > 
> > > > Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> > > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > > > ---
> > > >    drivers/gpu/drm/ttm/ttm_bo.c | 6 +++---
> > > >    1 file changed, 3 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > index 8d7fd65ccced..23f906941ac9 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > @@ -1152,9 +1152,9 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
> > > >    	}
> > > >    	if (bo->deleted) {
> > > > -		ttm_bo_cleanup_refs(bo, false, false, locked);
> > > > +		ret = ttm_bo_cleanup_refs(bo, false, false, locked);
> > > >    		ttm_bo_put(bo);
> > > > -		return 0;
> > > > +		return ret == -EBUSY ? -ENOSPC : ret;
> > > >    	}
> > > >    	ttm_bo_del_from_lru(bo);
> > > > @@ -1208,7 +1208,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
> > > >    	if (locked)
> > > >    		dma_resv_unlock(bo->base.resv);
> > > >    	ttm_bo_put(bo);
> > > > -	return ret;
> > > > +	return ret == -EBUSY ? -ENOSPC : ret;
> > > >    }
> > > >    void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
