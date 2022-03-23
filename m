Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7C74E5331
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 14:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E730E10E1EA;
	Wed, 23 Mar 2022 13:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362C610E1EA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 13:36:22 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id z8so1643752oix.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 06:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eyqicTsebIRvqd26pBg6QT5sH5EF2uSkS2ERA7uh4wc=;
 b=bpoJtlsoP1DLEgRbXc5ALzOUQqNvDVJSpRt3Bqh87DyatRC1EkcrUiWWvGr6MQN8hH
 XMOb3RnJ1JqcFmNr0WD/rJAxwqg8TWyYn87AvPBrkJpK5Uj6RWnllOAY61HgxLEdEYJF
 L2dcuY4dEm77j4r6aTw2ShcQxiI4PC0nYoYmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eyqicTsebIRvqd26pBg6QT5sH5EF2uSkS2ERA7uh4wc=;
 b=qqFU86JAOj5o97kn87pLHJHy/TGbXTr6uLbb5Qj0DhSY6FWQVSyBU9lP1cpuL97igD
 OJyblULcykxqqAq5PdJ42qWuMlvOiIAhyQbvBOqs7T7Hg6P0b+4h8UXL5dp3w3m2JbVh
 4jfeXMmcM3Cl0eFt5VKQV/fPY1BElVj3cSS5sPFerY2kCuN4oUDQSPL+nGliQpCsSRks
 TYb9di99Q4Yxzkb3s//Q6e7VUKwyn3NySY7l+lKZYig1dxy/Vus28cq+/Bt94U/nuRHX
 2eUY0r5WMD3weWd39mvYAuHZMobqfvrrduBy9SGrdzw0dxLTt6Im7DScCiCXEx43MboM
 ANWw==
X-Gm-Message-State: AOAM530dX6WZ3LLJYooBElZcc9qYN/PUyMHar7hv/IMNRJCrw6KYs/2d
 XJaBY/nuYbDjONY3cQgOuGZrNCjL/pF79D0lZqb87g==
X-Google-Smtp-Source: ABdhPJyfzsibVr4BtUxoUK6Q5DNl2LdfmvPCpH9y2FvwOO+ODxN+adjFjvqQYhrcajaviE8Qgxq/hLs3gYeWQsC5/uQ=
X-Received: by 2002:a54:4099:0:b0:2ec:d31c:481d with SMTP id
 i25-20020a544099000000b002ecd31c481dmr24965oii.7.1648042581432; Wed, 23 Mar
 2022 06:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220321132601.2161-1-christian.koenig@amd.com>
 <YjsLkqGEnre4JKkR@phenom.ffwll.local>
 <85c4c3bd-bdc8-83ea-f27e-ce6da141daf2@gmail.com>
In-Reply-To: <85c4c3bd-bdc8-83ea-f27e-ce6da141daf2@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 23 Mar 2022 14:36:10 +0100
Message-ID: <CAKMK7uE9bd2fMgsHLG8k-v=f=5o8CZ2WTHw3coYgdN0mFikXvw@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/ttm: move the LRU into resource handling v4
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Felix.Kuehling@amd.com, matthew.william.auld@gmail.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Mar 2022 at 13:20, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 23.03.22 um 12:59 schrieb Daniel Vetter:
> > On Mon, Mar 21, 2022 at 02:25:56PM +0100, Christian K=C3=B6nig wrote:
> >> This way we finally fix the problem that new resource are
> >> not immediately evict-able after allocation.
> >>
> >> That has caused numerous problems including OOM on GDS handling
> >> and not being able to use TTM as general resource manager.
> >>
> >> v2: stop assuming in ttm_resource_fini that res->bo is still valid.
> >> v3: cleanup kerneldoc, add more lockdep annotation
> >> v4: consistently use res->num_pages
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> >> +/**
> >> + * struct ttm_lru_bulk_move
> >> + *
> >> + * @tt: first/last lru entry for resources in the TT domain
> >> + * @vram: first/last lru entry for resources in the VRAM domain
> >> + *
> >> + * Helper structure for bulk moves on the LRU list.
> >> + */
> >> +struct ttm_lru_bulk_move {
> >> +    struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
> >> +    struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
> > Not really needed, just a thought: Should we track the associated dma_r=
esv
> > object here to make sure the locking is all done correctly (and also ch=
eck
> > that the bulk move bo have the same dma_resv)? It wouldn't really be an=
y
> > overhead for the !CONFIG_LOCKDEP case and we could sprinkle a lot more
> > dma_resv_held all over the place.
>
> You made a similar comment on the last revision and I already tried to
> play around with that idea a bit.
>
> But I've completely abandoned that idea after realizing that the BOs in
> the bulk move actually don't need to have the same dma_resv object, nor
> do they all need to be locked.

Uh how does that work? If you evict that bo while someone else is
doing a bulk move, then at least the result might be rather funny, and
I have no idea how it could work.

Like even if you then make the rule that you have to lock all bos for
the bulk move, the bo could still be moved independently, and that
would again break the bulk lru properties.

And if you do none of the above, there's no reason for that bo to have
a distinct dma_resv.

Like maybe the data structure wont fall apart, but semantically it
just doesn't make any sense to me to allow this. What would you want
to use this for?

> It just happens that amdgpu is currently using it that way, but I can't
> see any technical necessarily to restrict the bulk move like that.

Yeah we can do that later on in a follow up patch, or I figure out why
it's not a good idea :-) Just figured this might be good to lock down
before other drivers start adopting this.
-Daniel

>
> Regards,
> Christian.
>
>
> > -Daniel
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
