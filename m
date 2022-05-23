Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B275315D7
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 21:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1AB10FE4F;
	Mon, 23 May 2022 19:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C213510FE4D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 19:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653335536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KOYC9iIBfV1vzZrPUZwk0oyKY1xPZWZ/ayniepgLDTs=;
 b=eT6/ydLrLnAZFrKlyEznc9q50dQ8RlJKkQfWSefyKc2pAd2k0cOWbH1oBdubGMkP9V5cFa
 /NyhBTYaa3SrXWVhDNwNBvM93S/kFTfYuOEdFiDpFZBGHvV5iSJOclh11B/J24AuhogFIi
 MZk7TW8qly7k+yqObieG9jXDpG1Bjg0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-H5EYySi4MiKykm2iTmFtXw-1; Mon, 23 May 2022 15:52:15 -0400
X-MC-Unique: H5EYySi4MiKykm2iTmFtXw-1
Received: by mail-qk1-f197.google.com with SMTP id
 v14-20020a05620a0f0e00b00699f4ea852cso12071851qkl.9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 12:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=KOYC9iIBfV1vzZrPUZwk0oyKY1xPZWZ/ayniepgLDTs=;
 b=FJyqHCyCrzlvzxWF2yHgPODAzTHKWKhmL7H4Jsfdw/W34yhvkZ5RdxklFUAvZvE2mJ
 SVmPNe0zYDX7wHDY4O14GRrL1rSWwCSlWsPDQ2CWwxJv9isfnhWVhVxJoeAfLd3n4dLs
 j9vy0hfzzqfKFXikEulH94iTCeEEV38xmCeM771/0Ft/nJdCxHfBtb/lfqbK9k8s3D0u
 EHmDOeX70uHpQUy7nWQE8gEfzUsanx7HDFMS7Q2+zKmjaJBK8oUwubbSc82kCxXH5xpZ
 DE7AUyQq12Ip+/1yEq4BKHB5ab5+W6giIEBHdPUXo4co1uPbprLTKrsbipuXn/FEGi6R
 BKmw==
X-Gm-Message-State: AOAM531zanmfuzusU0cVBMftxS6cC1xZtctF2e4gZXr/qCJLHa16vhy/
 FCAJ2Xrw5mcZfy7hI7bTKOJnnhYFkUzdVA19SIP1M9nQ/ScW2jg2mbTIzBEcBnzwVIcCS2Yt4ob
 hYG1qtatfkIw6QTdjBgK5JskBAHyG
X-Received: by 2002:a37:6650:0:b0:6a3:5fb9:7ff7 with SMTP id
 a77-20020a376650000000b006a35fb97ff7mr8582257qkc.90.1653335535108; 
 Mon, 23 May 2022 12:52:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgZ4upgTLufDFLOHGMjBcNkvM4E+LvXn+UyvlAfFfBcrNLQCi/YNJUO8bUY6aCMfrUg56p0w==
X-Received: by 2002:a37:6650:0:b0:6a3:5fb9:7ff7 with SMTP id
 a77-20020a376650000000b006a35fb97ff7mr8582253qkc.90.1653335534913; 
 Mon, 23 May 2022 12:52:14 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 v128-20020a372f86000000b006a33009158esm4838303qkh.119.2022.05.23.12.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 12:52:12 -0700 (PDT)
Message-ID: <70daebd6d65b34f5ab85f0286df9a539b5c62146.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/mmu: fix typo in comment
From: Lyude Paul <lyude@redhat.com>
To: Julia Lawall <Julia.Lawall@inria.fr>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 23 May 2022 15:52:11 -0400
In-Reply-To: <20220521111145.81697-57-Julia.Lawall@inria.fr>
References: <20220521111145.81697-57-Julia.Lawall@inria.fr>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will fix that double space after the punctuation while I'm at it as well, and
will push to the appropriate branch in a little bit. Thanks!

On Sat, 2022-05-21 at 13:11 +0200, Julia Lawall wrote:
> Spelling mistake (triple letters) in comment.
> Detected with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> index 8bf00b396ec1..8b11dfa0998d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> @@ -280,7 +280,7 @@ nvkm_vmm_unref_ptes(struct nvkm_vmm_iter *it, bool pfn,
> u32 ptei, u32 ptes)
>         if (desc->type == SPT && (pgt->refs[0] || pgt->refs[1]))
>                 nvkm_vmm_unref_sptes(it, pgt, desc, ptei, ptes);
>  
> -       /* PT no longer neeed?  Destroy it. */
> +       /* PT no longer needed?  Destroy it. */
>         if (!pgt->refs[type]) {
>                 it->lvl++;
>                 TRA(it, "%s empty", nvkm_vmm_desc_type(desc));
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

