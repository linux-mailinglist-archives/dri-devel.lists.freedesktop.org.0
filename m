Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD5518C90
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 16:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A389C8929F;
	Thu,  9 May 2019 14:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25238929F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 14:59:27 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h11so3573201wmb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2019 07:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language;
 bh=qa2uVrWDE3Y55DEU6YX2CYTMHCnK7Dkt0ObtXVCuehA=;
 b=nrRXrb9JHzf2mbzZifV4Ze5Kjeee+yfmUKAGAHMJPlic+Ib44xyA2eKUouT4MrbbZx
 AmAMY3k163PKS2uP3MBZD/xi25HZFCAll6Wl7DwmriWY73FV+AecQ3//sf3owPZxhTqa
 8XMhw9SSqP6WLKWb/YVMTZmngeGGZq6yAZbKGAbqicPZaYYRGwza0ya4onv6RwcceRTK
 dI03MwL1IitF5wZStUnKPqqCSu1a+fU5LLyyNaSLrkMFw5RNpaeMtfxvVQXAwr0lVpe9
 lUiNLnMDqG4k0k1QQOiDXDQt6b7zjrCBnz58M0oVBUPs1VZQi+4F/M0dZSiHYRLc80NG
 QKjA==
X-Gm-Message-State: APjAAAXUSSJXIwYSI/VTBkkxw863vz1SivdK1h8V77ZRxLhAVG6Ol6uZ
 FmPscT/5EvuZa1ecn42dNBLct7v0
X-Google-Smtp-Source: APXvYqwMsH4L31XsUA3p59cRn+0PzrrZOaDsx1uL8hTf0RnJldMLaP7ky7LOUsS3DoEt26pff6Rrag==
X-Received: by 2002:a1c:b4d4:: with SMTP id d203mr3215412wmf.34.1557413965491; 
 Thu, 09 May 2019 07:59:25 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id s10sm3246686wrt.66.2019.05.09.07.59.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 07:59:24 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/ttm: fix busy memory to fail other user v7
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Liang, Prike" <Prike.Liang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20190507114531.26089-1-david1.zhou@amd.com>
 <e40420ea-3b25-a738-9c6e-4d251ed9e390@amd.com>
 <-yd30ko-7yy2hg-rmre4orxyza7-xndome2qdx81-wtzk8a-eccw2rc52fs2-grqgt7bajdlk-5lgjxo-xu3otx-5m9i78-2xa184-z2lana96yogmoisk45t18dyy9462b5f86c1cg5hlpw-xorlqm-lev8gs.1557413178321@email.android.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a912da5d-d429-1eff-db51-77e38e9b0724@gmail.com>
Date: Thu, 9 May 2019 16:59:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <-yd30ko-7yy2hg-rmre4orxyza7-xndome2qdx81-wtzk8a-eccw2rc52fs2-grqgt7bajdlk-5lgjxo-xu3otx-5m9i78-2xa184-z2lana96yogmoisk45t18dyy9462b5f86c1cg5hlpw-xorlqm-lev8gs.1557413178321@email.android.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=qa2uVrWDE3Y55DEU6YX2CYTMHCnK7Dkt0ObtXVCuehA=;
 b=iaIY0Qn/q4knRob1SGdiiBE0awxnEB033UW+tGfncbLYq7nMrY5QtLFAwhmXbsowG8
 cg047fROeY7IYLwW6QUJPnmJweZ9GDC4Kw8o3h67Upqn6TCVsSW4td5EPANUb0dHwrpH
 aPZve8lJ0uotGn8BFrVp0ggEkNZ93zm7OiVg2db1P7YBUVXN1dIppM2sjWg4nloCZn++
 kstl3fb/LuDHnJiB94Aly9TOQDpycDHkVllMEhc3vA/C7ELoe/Ee6ACxoHKE8eJuEXxA
 fI6GX8yLWPyEvdoPge/vPZuZzVqZ1dsjltbPG0ZK/7KFvgwourSVLYjwwliFYMf9UkQx
 IC0w==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Reply-To: christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============0355663253=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0355663253==
Content-Type: multipart/alternative;
 boundary="------------9155702B55CB9970D6F8B842"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9155702B55CB9970D6F8B842
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Oh, I know where this is coming from.

The problem is that we remove the BOs from the LRU during CS and so we 
can't wait for the CS to finish up.

Already working on this problem for Marek's similar issue,
Christian.

Am 09.05.19 um 16:46 schrieb Zhou, David(ChunMing):
> I know that before, it will issue warning only when debug option is 
> enabled. Removing that is ok to me.
> I only help Prike draft your idea, and Prike is trying this patch on 
> his side. The latest feedback he gave me is first_bo is always null, 
> code doesn't run into busy path, which is very confusing me, and he 
> said  he is debugging  that.
>
> -David
>
>
> -------- Original Message --------
> Subject: Re: [PATCH 1/2] drm/ttm: fix busy memory to fail other user v7
> From: "Koenig, Christian"
> To: "Zhou, David(ChunMing)" ,"Liang, Prike" 
> ,dri-devel@lists.freedesktop.org
> CC:
>
> I've foudn one more problem with this.
>
> With lockdep enabled I get a warning because ttm_eu_reserve_buffers()
> has called ww_acquire_done() on the ticket (which essentially means we
> are done, no more locking with that ticket).
>
> The simplest solution is probably to just remove the call to
> ww_acquire_done() from ttm_eu_reserve_buffers().
>
> Christian.
>
> Am 07.05.19 um 13:45 schrieb Chunming Zhou:
> > heavy gpu job could occupy memory long time, which lead other user 
> fail to get memory.
> >
> > basically pick up Christian idea:
> >
> > 1. Reserve the BO in DC using a ww_mutex ticket (trivial).
> > 2. If we then run into this EBUSY condition in TTM check if the BO 
> we need memory for (or rather the ww_mutex of its reservation object) 
> has a ticket assigned.
> > 3. If we have a ticket we grab a reference to the first BO on the 
> LRU, drop the LRU lock and try to grab the reservation lock with the 
> ticket.
> > 4. If getting the reservation lock with the ticket succeeded we 
> check if the BO is still the first one on the LRU in question (the BO 
> could have moved).
> > 5. If the BO is still the first one on the LRU in question we try to 
> evict it as we would evict any other BO.
> > 6. If any of the "If's" above fail we just back off and return -EBUSY.
> >
> > v2: fix some minor check
> > v3: address Christian v2 comments.
> > v4: fix some missing
> > v5: handle first_bo unlock and bo_get/put
> > v6: abstract unified iterate function, and handle all possible 
> usecase not only pinned bo.
> > v7: pass request bo->resv to ttm_bo_evict_first
> >
> > Change-Id: I21423fb922f885465f13833c41df1e134364a8e7
> > Signed-off-by: Chunming Zhou <david1.zhou@amd.com>
> > ---
> >   drivers/gpu/drm/ttm/ttm_bo.c | 111 +++++++++++++++++++++++++++++------
> >   1 file changed, 94 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > index 8502b3ed2d88..f5e6328e4a57 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -766,11 +766,13 @@ EXPORT_SYMBOL(ttm_bo_eviction_valuable);
> >    * b. Otherwise, trylock it.
> >    */
> >   static bool ttm_bo_evict_swapout_allowable(struct 
> ttm_buffer_object *bo,
> > -                     struct ttm_operation_ctx *ctx, bool *locked)
> > +                     struct ttm_operation_ctx *ctx, bool *locked, 
> bool *busy)
> >   {
> >        bool ret = false;
> >
> >        *locked = false;
> > +     if (busy)
> > +             *busy = false;
> >        if (bo->resv == ctx->resv) {
> > reservation_object_assert_held(bo->resv);
> >                if (ctx->flags & TTM_OPT_FLAG_ALLOW_RES_EVICT
> > @@ -779,35 +781,46 @@ static bool 
> ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
> >        } else {
> >                *locked = reservation_object_trylock(bo->resv);
> >                ret = *locked;
> > +             if (!ret && busy)
> > +                     *busy = true;
> >        }
> >
> >        return ret;
> >   }
> >
> > -static int ttm_mem_evict_first(struct ttm_bo_device *bdev,
> > -                            uint32_t mem_type,
> > -                            const struct ttm_place *place,
> > -                            struct ttm_operation_ctx *ctx)
> > +static struct ttm_buffer_object*
> > +ttm_mem_find_evitable_bo(struct ttm_bo_device *bdev,
> > +                      struct ttm_mem_type_manager *man,
> > +                      const struct ttm_place *place,
> > +                      struct ttm_operation_ctx *ctx,
> > +                      struct ttm_buffer_object **first_bo,
> > +                      bool *locked)
> >   {
> > -     struct ttm_bo_global *glob = bdev->glob;
> > -     struct ttm_mem_type_manager *man = &bdev->man[mem_type];
> >        struct ttm_buffer_object *bo = NULL;
> > -     bool locked = false;
> > -     unsigned i;
> > -     int ret;
> > +     int i;
> >
> > -     spin_lock(&glob->lru_lock);
> > +     if (first_bo)
> > +             *first_bo = NULL;
> >        for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> >                list_for_each_entry(bo, &man->lru[i], lru) {
> > -                     if (!ttm_bo_evict_swapout_allowable(bo, ctx, 
> &locked))
> > +                     bool busy = false;
> > +
> > +                     if (!ttm_bo_evict_swapout_allowable(bo, ctx, 
> locked,
> > + &busy)) {
> > +                             if (first_bo && !(*first_bo) && busy) {
> > +                                     ttm_bo_get(bo);
> > +                                     *first_bo = bo;
> > +                             }
> >                                continue;
> > +                     }
> >
> >                        if (place && !bdev->driver->eviction_valuable(bo,
> >                                                                     place)) {
> > -                             if (locked)
> > +                             if (*locked)
> > reservation_object_unlock(bo->resv);
> >                                continue;
> >                        }
> > +
> >                        break;
> >                }
> >
> > @@ -818,9 +831,67 @@ static int ttm_mem_evict_first(struct 
> ttm_bo_device *bdev,
> >                bo = NULL;
> >        }
> >
> > +     return bo;
> > +}
> > +
> > +static int ttm_mem_evict_first(struct ttm_bo_device *bdev,
> > +                            uint32_t mem_type,
> > +                            const struct ttm_place *place,
> > +                            struct ttm_operation_ctx *ctx,
> > +                            struct reservation_object *request_resv)
> > +{
> > +     struct ttm_bo_global *glob = bdev->glob;
> > +     struct ttm_mem_type_manager *man = &bdev->man[mem_type];
> > +     struct ttm_buffer_object *bo = NULL, *first_bo = NULL;
> > +     bool locked = false;
> > +     int ret;
> > +
> > +     spin_lock(&glob->lru_lock);
> > +     bo = ttm_mem_find_evitable_bo(bdev, man, place, ctx, &first_bo,
> > +                                   &locked);
> >        if (!bo) {
> > +             struct ttm_operation_ctx busy_ctx;
> > +
> >                spin_unlock(&glob->lru_lock);
> > -             return -EBUSY;
> > +             /* check if other user occupy memory too long time */
> > +             if (!first_bo || !request_resv || 
> !request_resv->lock.ctx) {
> > +                     if (first_bo)
> > +                             ttm_bo_put(first_bo);
> > +                     return -EBUSY;
> > +             }
> > +             if (first_bo->resv == request_resv) {
> > +                     ttm_bo_put(first_bo);
> > +                     return -EBUSY;
> > +             }
> > +             if (ctx->interruptible)
> > +                     ret = 
> ww_mutex_lock_interruptible(&first_bo->resv->lock,
> > + request_resv->lock.ctx);
> > +             else
> > +                     ret = ww_mutex_lock(&first_bo->resv->lock, 
> request_resv->lock.ctx);
> > +             if (ret) {
> > +                     ttm_bo_put(first_bo);
> > +                     return ret;
> > +             }
> > +             spin_lock(&glob->lru_lock);
> > +             /* previous busy resv lock is held by above, idle now,
> > +              * so let them evictable.
> > +              */
> > +             busy_ctx.interruptible = ctx->interruptible;
> > +             busy_ctx.no_wait_gpu   = ctx->no_wait_gpu;
> > +             busy_ctx.resv          = first_bo->resv;
> > +             busy_ctx.flags         = TTM_OPT_FLAG_ALLOW_RES_EVICT;
> > +
> > +             bo = ttm_mem_find_evitable_bo(bdev, man, place, 
> &busy_ctx, NULL,
> > + &locked);
> > +             if (bo && (bo->resv == first_bo->resv))
> > +                     locked = true;
> > +             else if (bo)
> > + ww_mutex_unlock(&first_bo->resv->lock);
> > +             if (!bo) {
> > + spin_unlock(&glob->lru_lock);
> > +                     ttm_bo_put(first_bo);
> > +                     return -EBUSY;
> > +             }
> >        }
> >
> >        kref_get(&bo->list_kref);
> > @@ -829,11 +900,15 @@ static int ttm_mem_evict_first(struct 
> ttm_bo_device *bdev,
> >                ret = ttm_bo_cleanup_refs(bo, ctx->interruptible,
> > ctx->no_wait_gpu, locked);
> >                kref_put(&bo->list_kref, ttm_bo_release_list);
> > +             if (first_bo)
> > +                     ttm_bo_put(first_bo);
> >                return ret;
> >        }
> >
> >        ttm_bo_del_from_lru(bo);
> >        spin_unlock(&glob->lru_lock);
> > +     if (first_bo)
> > +             ttm_bo_put(first_bo);
> >
> >        ret = ttm_bo_evict(bo, ctx);
> >        if (locked) {
> > @@ -907,7 +982,7 @@ static int ttm_bo_mem_force_space(struct 
> ttm_buffer_object *bo,
> >                        return ret;
> >                if (mem->mm_node)
> >                        break;
> > -             ret = ttm_mem_evict_first(bdev, mem_type, place, ctx);
> > +             ret = ttm_mem_evict_first(bdev, mem_type, place, ctx, 
> bo->resv);
> >                if (unlikely(ret != 0))
> >                        return ret;
> >        } while (1);
> > @@ -1413,7 +1488,8 @@ static int ttm_bo_force_list_clean(struct 
> ttm_bo_device *bdev,
> >        for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> >                while (!list_empty(&man->lru[i])) {
> > spin_unlock(&glob->lru_lock);
> > -                     ret = ttm_mem_evict_first(bdev, mem_type, 
> NULL, &ctx);
> > +                     ret = ttm_mem_evict_first(bdev, mem_type, 
> NULL, &ctx,
> > +                                               NULL);
> >                        if (ret)
> >                                return ret;
> > spin_lock(&glob->lru_lock);
> > @@ -1784,7 +1860,8 @@ int ttm_bo_swapout(struct ttm_bo_global *glob, 
> struct ttm_operation_ctx *ctx)
> >        spin_lock(&glob->lru_lock);
> >        for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> >                list_for_each_entry(bo, &glob->swap_lru[i], swap) {
> > -                     if (ttm_bo_evict_swapout_allowable(bo, ctx, 
> &locked)) {
> > +                     if (ttm_bo_evict_swapout_allowable(bo, ctx, 
> &locked,
> > + NULL)) {
> >                                ret = 0;
> >                                break;
> >                        }
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


--------------9155702B55CB9970D6F8B842
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Oh, I know where this is coming from.<br>
      <br>
      The problem is that we remove the BOs from the LRU during CS and
      so we can't wait for the CS to finish up.<br>
      <br>
      Already working on this problem for Marek's similar issue,<br>
      Christian.<br>
      <br>
      Am 09.05.19 um 16:46 schrieb Zhou, David(ChunMing):<br>
    </div>
    <blockquote type="cite"
cite="mid:-yd30ko-7yy2hg-rmre4orxyza7-xndome2qdx81-wtzk8a-eccw2rc52fs2-grqgt7bajdlk-5lgjxo-xu3otx-5m9i78-2xa184-z2lana96yogmoisk45t18dyy9462b5f86c1cg5hlpw-xorlqm-lev8gs.1557413178321@email.android.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <meta name="Generator" content="Microsoft Exchange Server">
      <!-- converted from text -->
      <style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left: #800000 2px solid; } --></style>
      <div>I know that before, it will issue warning only when debug
        option is enabled. Removing that is ok to me.<br>
        I only help Prike draft your idea, and Prike is trying this
        patch on his side. The latest feedback he gave me is first_bo is
        always null, code doesn't run into busy path, which is very
        confusing me, and he said  he is debugging  that.<br>
        <br>
        -David<br>
        <br>
        <br>
        -------- Original Message --------<br>
        Subject: Re: [PATCH 1/2] drm/ttm: fix busy memory to fail other
        user v7<br>
        From: "Koenig, Christian" <br>
        To: "Zhou, David(ChunMing)" ,"Liang, Prike"
        ,<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a><br>
        CC: <br>
        <br>
      </div>
      <font size="2"><span style="font-size:11pt;">
          <div class="PlainText">I've foudn one more problem with this.<br>
            <br>
            With lockdep enabled I get a warning because
            ttm_eu_reserve_buffers() <br>
            has called ww_acquire_done() on the ticket (which
            essentially means we <br>
            are done, no more locking with that ticket).<br>
            <br>
            The simplest solution is probably to just remove the call to
            <br>
            ww_acquire_done() from ttm_eu_reserve_buffers().<br>
            <br>
            Christian.<br>
            <br>
            Am 07.05.19 um 13:45 schrieb Chunming Zhou:<br>
            &gt; heavy gpu job could occupy memory long time, which lead
            other user fail to get memory.<br>
            &gt;<br>
            &gt; basically pick up Christian idea:<br>
            &gt;<br>
            &gt; 1. Reserve the BO in DC using a ww_mutex ticket
            (trivial).<br>
            &gt; 2. If we then run into this EBUSY condition in TTM
            check if the BO we need memory for (or rather the ww_mutex
            of its reservation object) has a ticket assigned.<br>
            &gt; 3. If we have a ticket we grab a reference to the first
            BO on the LRU, drop the LRU lock and try to grab the
            reservation lock with the ticket.<br>
            &gt; 4. If getting the reservation lock with the ticket
            succeeded we check if the BO is still the first one on the
            LRU in question (the BO could have moved).<br>
            &gt; 5. If the BO is still the first one on the LRU in
            question we try to evict it as we would evict any other BO.<br>
            &gt; 6. If any of the "If's" above fail we just back off and
            return -EBUSY.<br>
            &gt;<br>
            &gt; v2: fix some minor check<br>
            &gt; v3: address Christian v2 comments.<br>
            &gt; v4: fix some missing<br>
            &gt; v5: handle first_bo unlock and bo_get/put<br>
            &gt; v6: abstract unified iterate function, and handle all
            possible usecase not only pinned bo.<br>
            &gt; v7: pass request bo-&gt;resv to ttm_bo_evict_first<br>
            &gt;<br>
            &gt; Change-Id: I21423fb922f885465f13833c41df1e134364a8e7<br>
            &gt; Signed-off-by: Chunming Zhou
            <a class="moz-txt-link-rfc2396E" href="mailto:david1.zhou@amd.com">&lt;david1.zhou@amd.com&gt;</a><br>
            &gt; ---<br>
            &gt;   drivers/gpu/drm/ttm/ttm_bo.c | 111
            +++++++++++++++++++++++++++++------<br>
            &gt;   1 file changed, 94 insertions(+), 17 deletions(-)<br>
            &gt;<br>
            &gt; diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
            b/drivers/gpu/drm/ttm/ttm_bo.c<br>
            &gt; index 8502b3ed2d88..f5e6328e4a57 100644<br>
            &gt; --- a/drivers/gpu/drm/ttm/ttm_bo.c<br>
            &gt; +++ b/drivers/gpu/drm/ttm/ttm_bo.c<br>
            &gt; @@ -766,11 +766,13 @@
            EXPORT_SYMBOL(ttm_bo_eviction_valuable);<br>
            &gt;    * b. Otherwise, trylock it.<br>
            &gt;    */<br>
            &gt;   static bool ttm_bo_evict_swapout_allowable(struct
            ttm_buffer_object *bo,<br>
            &gt; -                     struct ttm_operation_ctx *ctx,
            bool *locked)<br>
            &gt; +                     struct ttm_operation_ctx *ctx,
            bool *locked, bool *busy)<br>
            &gt;   {<br>
            &gt;        bool ret = false;<br>
            &gt;   <br>
            &gt;        *locked = false;<br>
            &gt; +     if (busy)<br>
            &gt; +             *busy = false;<br>
            &gt;        if (bo-&gt;resv == ctx-&gt;resv) {<br>
            &gt;               
            reservation_object_assert_held(bo-&gt;resv);<br>
            &gt;                if (ctx-&gt;flags &amp;
            TTM_OPT_FLAG_ALLOW_RES_EVICT<br>
            &gt; @@ -779,35 +781,46 @@ static bool
            ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,<br>
            &gt;        } else {<br>
            &gt;                *locked =
            reservation_object_trylock(bo-&gt;resv);<br>
            &gt;                ret = *locked;<br>
            &gt; +             if (!ret &amp;&amp; busy)<br>
            &gt; +                     *busy = true;<br>
            &gt;        }<br>
            &gt;   <br>
            &gt;        return ret;<br>
            &gt;   }<br>
            &gt;   <br>
            &gt; -static int ttm_mem_evict_first(struct ttm_bo_device
            *bdev,<br>
            &gt; -                            uint32_t mem_type,<br>
            &gt; -                            const struct ttm_place
            *place,<br>
            &gt; -                            struct ttm_operation_ctx
            *ctx)<br>
            &gt; +static struct ttm_buffer_object*<br>
            &gt; +ttm_mem_find_evitable_bo(struct ttm_bo_device *bdev,<br>
            &gt; +                      struct ttm_mem_type_manager
            *man,<br>
            &gt; +                      const struct ttm_place *place,<br>
            &gt; +                      struct ttm_operation_ctx *ctx,<br>
            &gt; +                      struct ttm_buffer_object
            **first_bo,<br>
            &gt; +                      bool *locked)<br>
            &gt;   {<br>
            &gt; -     struct ttm_bo_global *glob = bdev-&gt;glob;<br>
            &gt; -     struct ttm_mem_type_manager *man =
            &amp;bdev-&gt;man[mem_type];<br>
            &gt;        struct ttm_buffer_object *bo = NULL;<br>
            &gt; -     bool locked = false;<br>
            &gt; -     unsigned i;<br>
            &gt; -     int ret;<br>
            &gt; +     int i;<br>
            &gt;   <br>
            &gt; -     spin_lock(&amp;glob-&gt;lru_lock);<br>
            &gt; +     if (first_bo)<br>
            &gt; +             *first_bo = NULL;<br>
            &gt;        for (i = 0; i &lt; TTM_MAX_BO_PRIORITY; ++i) {<br>
            &gt;                list_for_each_entry(bo,
            &amp;man-&gt;lru[i], lru) {<br>
            &gt; -                     if
            (!ttm_bo_evict_swapout_allowable(bo, ctx, &amp;locked))<br>
            &gt; +                     bool busy = false;<br>
            &gt; +<br>
            &gt; +                     if
            (!ttm_bo_evict_swapout_allowable(bo, ctx, locked,<br>
            &gt;
            +                                                        
            &amp;busy)) {<br>
            &gt; +                             if (first_bo &amp;&amp;
            !(*first_bo) &amp;&amp; busy) {<br>
            &gt; +                                     ttm_bo_get(bo);<br>
            &gt; +                                     *first_bo = bo;<br>
            &gt; +                             }<br>
            &gt;                                continue;<br>
            &gt; +                     }<br>
            &gt;   <br>
            &gt;                        if (place &amp;&amp;
            !bdev-&gt;driver-&gt;eviction_valuable(bo,<br>
&gt;                                                                     
            place)) {<br>
            &gt; -                             if (locked)<br>
            &gt; +                             if (*locked)<br>
            &gt;                                       
            reservation_object_unlock(bo-&gt;resv);<br>
            &gt;                                continue;<br>
            &gt;                        }<br>
            &gt; +<br>
            &gt;                        break;<br>
            &gt;                }<br>
            &gt;   <br>
            &gt; @@ -818,9 +831,67 @@ static int
            ttm_mem_evict_first(struct ttm_bo_device *bdev,<br>
            &gt;                bo = NULL;<br>
            &gt;        }<br>
            &gt;   <br>
            &gt; +     return bo;<br>
            &gt; +}<br>
            &gt; +<br>
            &gt; +static int ttm_mem_evict_first(struct ttm_bo_device
            *bdev,<br>
            &gt; +                            uint32_t mem_type,<br>
            &gt; +                            const struct ttm_place
            *place,<br>
            &gt; +                            struct ttm_operation_ctx
            *ctx,<br>
            &gt; +                            struct reservation_object
            *request_resv)<br>
            &gt; +{<br>
            &gt; +     struct ttm_bo_global *glob = bdev-&gt;glob;<br>
            &gt; +     struct ttm_mem_type_manager *man =
            &amp;bdev-&gt;man[mem_type];<br>
            &gt; +     struct ttm_buffer_object *bo = NULL, *first_bo =
            NULL;<br>
            &gt; +     bool locked = false;<br>
            &gt; +     int ret;<br>
            &gt; +<br>
            &gt; +     spin_lock(&amp;glob-&gt;lru_lock);<br>
            &gt; +     bo = ttm_mem_find_evitable_bo(bdev, man, place,
            ctx, &amp;first_bo,<br>
            &gt; +                                   &amp;locked);<br>
            &gt;        if (!bo) {<br>
            &gt; +             struct ttm_operation_ctx busy_ctx;<br>
            &gt; +<br>
            &gt;                spin_unlock(&amp;glob-&gt;lru_lock);<br>
            &gt; -             return -EBUSY;<br>
            &gt; +             /* check if other user occupy memory too
            long time */<br>
            &gt; +             if (!first_bo || !request_resv ||
            !request_resv-&gt;lock.ctx) {<br>
            &gt; +                     if (first_bo)<br>
            &gt; +                             ttm_bo_put(first_bo);<br>
            &gt; +                     return -EBUSY;<br>
            &gt; +             }<br>
            &gt; +             if (first_bo-&gt;resv == request_resv) {<br>
            &gt; +                     ttm_bo_put(first_bo);<br>
            &gt; +                     return -EBUSY;<br>
            &gt; +             }<br>
            &gt; +             if (ctx-&gt;interruptible)<br>
            &gt; +                     ret =
            ww_mutex_lock_interruptible(&amp;first_bo-&gt;resv-&gt;lock,<br>
            &gt; +                                                      
            request_resv-&gt;lock.ctx);<br>
            &gt; +             else<br>
            &gt; +                     ret =
            ww_mutex_lock(&amp;first_bo-&gt;resv-&gt;lock,
            request_resv-&gt;lock.ctx);<br>
            &gt; +             if (ret) {<br>
            &gt; +                     ttm_bo_put(first_bo);<br>
            &gt; +                     return ret;<br>
            &gt; +             }<br>
            &gt; +             spin_lock(&amp;glob-&gt;lru_lock);<br>
            &gt; +             /* previous busy resv lock is held by
            above, idle now,<br>
            &gt; +              * so let them evictable.<br>
            &gt; +              */<br>
            &gt; +             busy_ctx.interruptible =
            ctx-&gt;interruptible;<br>
            &gt; +             busy_ctx.no_wait_gpu   =
            ctx-&gt;no_wait_gpu;<br>
            &gt; +             busy_ctx.resv          =
            first_bo-&gt;resv;<br>
            &gt; +             busy_ctx.flags         =
            TTM_OPT_FLAG_ALLOW_RES_EVICT;<br>
            &gt; +<br>
            &gt; +             bo = ttm_mem_find_evitable_bo(bdev, man,
            place, &amp;busy_ctx, NULL,<br>
            &gt; +                                          
            &amp;locked);<br>
            &gt; +             if (bo &amp;&amp; (bo-&gt;resv ==
            first_bo-&gt;resv))<br>
            &gt; +                     locked = true;<br>
            &gt; +             else if (bo)<br>
            &gt; +                    
            ww_mutex_unlock(&amp;first_bo-&gt;resv-&gt;lock);<br>
            &gt; +             if (!bo) {<br>
            &gt; +                    
            spin_unlock(&amp;glob-&gt;lru_lock);<br>
            &gt; +                     ttm_bo_put(first_bo);<br>
            &gt; +                     return -EBUSY;<br>
            &gt; +             }<br>
            &gt;        }<br>
            &gt;   <br>
            &gt;        kref_get(&amp;bo-&gt;list_kref);<br>
            &gt; @@ -829,11 +900,15 @@ static int
            ttm_mem_evict_first(struct ttm_bo_device *bdev,<br>
            &gt;                ret = ttm_bo_cleanup_refs(bo,
            ctx-&gt;interruptible,<br>
            &gt;                                         
            ctx-&gt;no_wait_gpu, locked);<br>
            &gt;                kref_put(&amp;bo-&gt;list_kref,
            ttm_bo_release_list);<br>
            &gt; +             if (first_bo)<br>
            &gt; +                     ttm_bo_put(first_bo);<br>
            &gt;                return ret;<br>
            &gt;        }<br>
            &gt;   <br>
            &gt;        ttm_bo_del_from_lru(bo);<br>
            &gt;        spin_unlock(&amp;glob-&gt;lru_lock);<br>
            &gt; +     if (first_bo)<br>
            &gt; +             ttm_bo_put(first_bo);<br>
            &gt;   <br>
            &gt;        ret = ttm_bo_evict(bo, ctx);<br>
            &gt;        if (locked) {<br>
            &gt; @@ -907,7 +982,7 @@ static int
            ttm_bo_mem_force_space(struct ttm_buffer_object *bo,<br>
            &gt;                        return ret;<br>
            &gt;                if (mem-&gt;mm_node)<br>
            &gt;                        break;<br>
            &gt; -             ret = ttm_mem_evict_first(bdev, mem_type,
            place, ctx);<br>
            &gt; +             ret = ttm_mem_evict_first(bdev, mem_type,
            place, ctx, bo-&gt;resv);<br>
            &gt;                if (unlikely(ret != 0))<br>
            &gt;                        return ret;<br>
            &gt;        } while (1);<br>
            &gt; @@ -1413,7 +1488,8 @@ static int
            ttm_bo_force_list_clean(struct ttm_bo_device *bdev,<br>
            &gt;        for (i = 0; i &lt; TTM_MAX_BO_PRIORITY; ++i) {<br>
            &gt;                while (!list_empty(&amp;man-&gt;lru[i]))
            {<br>
            &gt;                       
            spin_unlock(&amp;glob-&gt;lru_lock);<br>
            &gt; -                     ret = ttm_mem_evict_first(bdev,
            mem_type, NULL, &amp;ctx);<br>
            &gt; +                     ret = ttm_mem_evict_first(bdev,
            mem_type, NULL, &amp;ctx,<br>
            &gt; +                                               NULL);<br>
            &gt;                        if (ret)<br>
            &gt;                                return ret;<br>
            &gt;                       
            spin_lock(&amp;glob-&gt;lru_lock);<br>
            &gt; @@ -1784,7 +1860,8 @@ int ttm_bo_swapout(struct
            ttm_bo_global *glob, struct ttm_operation_ctx *ctx)<br>
            &gt;        spin_lock(&amp;glob-&gt;lru_lock);<br>
            &gt;        for (i = 0; i &lt; TTM_MAX_BO_PRIORITY; ++i) {<br>
            &gt;                list_for_each_entry(bo,
            &amp;glob-&gt;swap_lru[i], swap) {<br>
            &gt; -                     if
            (ttm_bo_evict_swapout_allowable(bo, ctx, &amp;locked)) {<br>
            &gt; +                     if
            (ttm_bo_evict_swapout_allowable(bo, ctx, &amp;locked,<br>
            &gt;
            +                                                       
            NULL)) {<br>
            &gt;                                ret = 0;<br>
            &gt;                                break;<br>
            &gt;                        }<br>
            <br>
          </div>
        </span></font>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
dri-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/dri-devel">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------9155702B55CB9970D6F8B842--

--===============0355663253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0355663253==--
