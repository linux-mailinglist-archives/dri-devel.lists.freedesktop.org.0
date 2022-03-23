Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D47D4E5516
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CC010E742;
	Wed, 23 Mar 2022 15:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6938710E73B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 15:22:11 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id d10so3502779eje.10
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 08:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ONSwtw8zkvAyGSL/IZ608mL40e/FAz/Mb/ufBHZ2n6I=;
 b=Ez7WQjbnLAFt53g0cjfBFCQkfI7cFrAvSNtLSuX9xXHEGwsakXmM4W6gSpQLwfXWoO
 WFEHOt291k3uvfGWiktKxkULP4sz0CG32mbKR/57gKcby02VILaM/TOBHRTOFAaIgE6P
 EsU1yw77Fo1yPXT1/bV+v9fvN8GcDhzrTnrHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ONSwtw8zkvAyGSL/IZ608mL40e/FAz/Mb/ufBHZ2n6I=;
 b=kiZBHkeYAnMMy/reRJhOyb0lusit8MbO2nHgvGXiNUxBkAg7ZnT3IOjXZ1vj6IBmlI
 4nsJKR8h58rMUi/4/OjM54Ijm5/+HLRoVD6Q8DVMKKUrlC1qvzF4ov7q/yF/WIbcEgq0
 TJHTcOCAbNWUiS7hIghITmUJ3Tz0GW+k4WulCzA8TyTiRetQvERY2Mb280e7xxKlEz4H
 RCZL2DSlX/4rxZktTYRBFBl+uI58j1dbyALaKoODGPv5NQNiy5GK+fbn56YggyRqSRiO
 k1z1/eCrz5aioHrpO2rUik1tMJuGJ65ne7cytEWHOwDAvLuCdJx2KzGIqL55ZAZnQWf1
 wIWw==
X-Gm-Message-State: AOAM533wkwbd9Av974lGuwsaTFImbhnERAt/CGCGmiceSX5xtmVEAd9O
 dHpCugM/UuObJJsupU4N7L/YJg==
X-Google-Smtp-Source: ABdhPJxJEYvzeJD5x3/NY7svz/NknHo71fnIWjKan1hqR8uRDtLoHRAcCQ/D9VLp7JTUPJQDRu8E2g==
X-Received: by 2002:a17:906:30d1:b0:6cf:c116:c9d3 with SMTP id
 b17-20020a17090630d100b006cfc116c9d3mr466508ejb.245.1648048929815; 
 Wed, 23 Mar 2022 08:22:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a170906144b00b006cf61dfb03esm67191ejc.62.2022.03.23.08.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 08:22:08 -0700 (PDT)
Date: Wed, 23 Mar 2022 16:22:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/6] drm/ttm: move the LRU into resource handling v4
Message-ID: <Yjs7H7P27NFbPm9L@phenom.ffwll.local>
References: <20220321132601.2161-1-christian.koenig@amd.com>
 <YjsLkqGEnre4JKkR@phenom.ffwll.local>
 <85c4c3bd-bdc8-83ea-f27e-ce6da141daf2@gmail.com>
 <CAKMK7uE9bd2fMgsHLG8k-v=f=5o8CZ2WTHw3coYgdN0mFikXvw@mail.gmail.com>
 <7822f627-3224-d166-62a1-3d7f6bf77d53@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7822f627-3224-d166-62a1-3d7f6bf77d53@amd.com>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix.Kuehling@amd.com, matthew.william.auld@gmail.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 23, 2022 at 02:44:17PM +0100, Christian König wrote:
> Am 23.03.22 um 14:36 schrieb Daniel Vetter:
> > On Wed, 23 Mar 2022 at 13:20, Christian König
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > Am 23.03.22 um 12:59 schrieb Daniel Vetter:
> > > > On Mon, Mar 21, 2022 at 02:25:56PM +0100, Christian König wrote:
> > > > > This way we finally fix the problem that new resource are
> > > > > not immediately evict-able after allocation.
> > > > > 
> > > > > That has caused numerous problems including OOM on GDS handling
> > > > > and not being able to use TTM as general resource manager.
> > > > > 
> > > > > v2: stop assuming in ttm_resource_fini that res->bo is still valid.
> > > > > v3: cleanup kerneldoc, add more lockdep annotation
> > > > > v4: consistently use res->num_pages
> > > > > 
> > > > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > > > Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > > > > +/**
> > > > > + * struct ttm_lru_bulk_move
> > > > > + *
> > > > > + * @tt: first/last lru entry for resources in the TT domain
> > > > > + * @vram: first/last lru entry for resources in the VRAM domain
> > > > > + *
> > > > > + * Helper structure for bulk moves on the LRU list.
> > > > > + */
> > > > > +struct ttm_lru_bulk_move {
> > > > > +    struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
> > > > > +    struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
> > > > Not really needed, just a thought: Should we track the associated dma_resv
> > > > object here to make sure the locking is all done correctly (and also check
> > > > that the bulk move bo have the same dma_resv)? It wouldn't really be any
> > > > overhead for the !CONFIG_LOCKDEP case and we could sprinkle a lot more
> > > > dma_resv_held all over the place.
> > > You made a similar comment on the last revision and I already tried to
> > > play around with that idea a bit.
> > > 
> > > But I've completely abandoned that idea after realizing that the BOs in
> > > the bulk move actually don't need to have the same dma_resv object, nor
> > > do they all need to be locked.
> > Uh how does that work? If you evict that bo while someone else is
> > doing a bulk move, then at least the result might be rather funny, and
> > I have no idea how it could work.
> 
> The LRU is still protected by the common spinlock.
> 
> So that will synchronize any modification to both the bulk move structure as
> well as the individual list_heads making up the LRU.
> 
> > 
> > Like even if you then make the rule that you have to lock all bos for
> > the bulk move, the bo could still be moved independently, and that
> > would again break the bulk lru properties.
> > 
> > And if you do none of the above, there's no reason for that bo to have
> > a distinct dma_resv.
> > 
> > Like maybe the data structure wont fall apart, but semantically it
> > just doesn't make any sense to me to allow this. What would you want
> > to use this for?
> 
> Yeah, that's a good point.
> 
> It's not technically necessary as far as I can see, but I'm not sure if
> there is a valid use case either.

Yeah I think nothing obviously bad will happen to the list, but it will
very much no longer be an LRU. Which kinda defeats the point - there's
easier ways to not have an LRU like never updating anything :-)

Aside, this is actually what i915-gem folks did without realizing, so
that's also a bit why I think being strict here would be good. It's tricky
and if you're too clever it's way too easy to end up with something which
isn't anything useful anymore.
> 
> > > It just happens that amdgpu is currently using it that way, but I can't
> > > see any technical necessarily to restrict the bulk move like that.
> > Yeah we can do that later on in a follow up patch, or I figure out why
> > it's not a good idea :-) Just figured this might be good to lock down
> > before other drivers start adopting this.
> 
> I'm just wondering if it's really more defensive to restrict the handling
> like that.
> 
> On the other hand we can still lift the restriction when anybody really
> comes along with a valid use case.

Yeah if we do have a use-case we can lift this easily, it's just a few
dma_resv_assert_held. I don't think we need this included for merging, but
it'd be great as a follow-up patch while only amdgpu is using this.
-Daniel

> 
> Christian.
> 
> > -Daniel
> > 
> > > Regards,
> > > Christian.
> > > 
> > > 
> > > > -Daniel
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
