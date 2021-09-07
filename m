Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E606540219D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 02:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD7589BBE;
	Tue,  7 Sep 2021 00:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BC089BBE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 00:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630974309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jic5HY4jNpPRbTOqmnYf0rZzsoprtJWy8oewb7ALUqk=;
 b=FktdDvNA8Exhe/HhN5xYZRX0QfPYD20s2GriYh09M9bYsbB1A72yBEtcvDVlm6shulA4Wx
 h1OGC1J6i1b4Dck609fqhQSG7vyMq94eS30Xkhbkkp8/mKHjY1XVtCylXfGc9X8IAn25c0
 YL/uG33M6vZeFk0YhossKcu/mGfFhY0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-xTLnfmDAMJS--_9qCJ9cYw-1; Mon, 06 Sep 2021 20:25:08 -0400
X-MC-Unique: xTLnfmDAMJS--_9qCJ9cYw-1
Received: by mail-wm1-f71.google.com with SMTP id
 m16-20020a7bca50000000b002ee5287d4bfso479601wml.7
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Sep 2021 17:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jic5HY4jNpPRbTOqmnYf0rZzsoprtJWy8oewb7ALUqk=;
 b=QhOa6bDQbU23/fw7jxazjolwJxJmeDp4KqvwweY6EqRmun+BFhKdKecqKsnZLFlBwB
 y6QajcIOIP11DSILPBBqBGfNb63jK0fHkYHJWhyRS1Sgbf4guzo+IEuF2h8yOsc+i42X
 PRRfSEtiH65ZJYJEB5kMmkfbYI1EKKljr1wL8ghnUpRmmVLtnGHV541L915vsTJB5J/n
 KGRyBxXm6oU8O/+bV5BY19N1kXTPYyL66Z6PXsMqAB7r816qdd991c/vytOFEBb3orog
 2v7jfKsATiVv2BfDHXZQZzgTNYf5iNkT4vA7NHNDlVpYI+TW8b3BMYIwptL7Z7bbMcS8
 Phvw==
X-Gm-Message-State: AOAM530pQBc7djIPkkVnIyUWdYQbpAveSXyocdgVOUbOglhRYNkx4QkB
 7EnY2OP7eGTduWmcZJQ+jPoCQTXW/7G13Pzp97iR9O08AMPkbLzJCdpJX3vXo4yaEhTY66071SC
 /b8YXGfouwoGGWUk432BLSSKm8yfbyM8dtCJHElaHuKcq
X-Received: by 2002:adf:d184:: with SMTP id v4mr15702441wrc.229.1630974307011; 
 Mon, 06 Sep 2021 17:25:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9oaLql9qw9yoEaRVBWmdJjUHaViTSV2BQtZQNSO/tf1UNrEHGPGIDNAwEVdW+beEeqqgAckgH7AK38kefaRo=
X-Received: by 2002:adf:d184:: with SMTP id v4mr15702436wrc.229.1630974306848; 
 Mon, 06 Sep 2021 17:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210906005628.11499-1-skeggsb@gmail.com>
 <20210906005628.11499-2-skeggsb@gmail.com>
In-Reply-To: <20210906005628.11499-2-skeggsb@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 7 Sep 2021 02:24:56 +0200
Message-ID: <CACO55ttVQBhvakr4OhfE6x0rvE1kifLuQht6x+1X3HgXHv=z0A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau/kms/tu102-: delay enabling cursor until
 after assign_windows
To: Ben Skeggs <skeggsb@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, stable@vger.kernel.org
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Sep 6, 2021 at 2:56 AM Ben Skeggs <skeggsb@gmail.com> wrote:
>
> From: Ben Skeggs <bskeggs@redhat.com>
>
> Prevent NVD core channel error code 67 occuring and hanging display,
> managed to reproduce on GA102 while testing suspend/resume scenarios.
>
> Required extension of earlier commit to fix interactions with EFI.
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>


> Fixes: e78b1b545c6c ("drm/nouveau/kms/nv50: workaround EFI GOP window channel format differences").
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: <stable@vger.kernel.org> # v5.12+
> ---
>  drivers/gpu/drm/nouveau/dispnv50/head.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
> index f8438a886b64..c3c57be54e1c 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/head.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
> @@ -52,6 +52,7 @@ nv50_head_flush_clr(struct nv50_head *head,
>  void
>  nv50_head_flush_set_wndw(struct nv50_head *head, struct nv50_head_atom *asyh)
>  {
> +       if (asyh->set.curs   ) head->func->curs_set(head, asyh);
>         if (asyh->set.olut   ) {
>                 asyh->olut.offset = nv50_lut_load(&head->olut,
>                                                   asyh->olut.buffer,
> @@ -67,7 +68,6 @@ nv50_head_flush_set(struct nv50_head *head, struct nv50_head_atom *asyh)
>         if (asyh->set.view   ) head->func->view    (head, asyh);
>         if (asyh->set.mode   ) head->func->mode    (head, asyh);
>         if (asyh->set.core   ) head->func->core_set(head, asyh);
> -       if (asyh->set.curs   ) head->func->curs_set(head, asyh);
>         if (asyh->set.base   ) head->func->base    (head, asyh);
>         if (asyh->set.ovly   ) head->func->ovly    (head, asyh);
>         if (asyh->set.dither ) head->func->dither  (head, asyh);
> --
> 2.31.1
>

