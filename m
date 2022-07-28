Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5BE5846DD
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 22:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD43F11A091;
	Thu, 28 Jul 2022 20:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD33113FCB
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 20:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659039442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A6u4ZQlbvoh48fBsQdaHBjhOh58DQBN7dDe6CmLd1i8=;
 b=ePCzQ6+1SrrUWuS7mQYBs1LASC3MEyaxXEK28Kqhl+igTQLr1Lz8zxliDP3awTwZxpAIOD
 d7SsHDW9FQOUNlMK+8kTojsXAt6TR8JM2pfCvOl9cMuzfrVsycCcocCjeIVxolGTAK9YvN
 3E4OkIKuaZ3J5anp8DN3VO2+tBXBk+0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-LATxpZvNNyq7SRCSQLb8_A-1; Thu, 28 Jul 2022 16:17:17 -0400
X-MC-Unique: LATxpZvNNyq7SRCSQLb8_A-1
Received: by mail-qv1-f69.google.com with SMTP id
 q1-20020a056214018100b0047464a85fc4so2006835qvr.7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 13:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=A6u4ZQlbvoh48fBsQdaHBjhOh58DQBN7dDe6CmLd1i8=;
 b=YOnUUxoqP4acdSqvU0dCTxg3S3y+Q1GxVtrjOF+VKxMKLGTcw5MIcv5GCYWAXQ/WsF
 fls/3St5zOVmgqG4FaSUUXDH5ocukphGVVlRY2aD0sR8cJ81P7kyvzus2Lq3zXr0PHCT
 FSfhgkqCHhlfuBAPHmu4z9OrQsZhebNB4Txkp6FzV2xF2L9CmPRgbZ9wJghCULmS+1i9
 vuMKYMVBtKpY054YSJJh6ievZeVe7H1tkFIQGMP48w6Sa+FzqBOkiphwbVPnMWmkO7KN
 AUWhOl/jtcQg0tw/IU1zhNF5COwyCO+Uf28emkUl89Xh40W47ubgHB0VSZoPrqqkwrFq
 dv0Q==
X-Gm-Message-State: AJIora/jtFpWqFz+S7VPBkobpNKNGHs80GbT4g/fRX9LIFPviOyEXy4Z
 e4hQG5RtVNQ+CqHlfxWk/eQooz8uojHgIZnARKKvP4aaZWhwDuJ09Q6yJgHD8Q8JLFtMk9Q2LKk
 owfrDLn1hxPvufC77tQ6TwSYG9tm2
X-Received: by 2002:a05:620a:3707:b0:6b5:e205:81c7 with SMTP id
 de7-20020a05620a370700b006b5e20581c7mr454888qkb.754.1659039436932; 
 Thu, 28 Jul 2022 13:17:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vOtsnFMeB+47s+JEBfSL51sNWIhYCgzWGrde48yH7YXwWO1SbAs5TDZJ3n/JREYKaXerZ2MQ==
X-Received: by 2002:a05:620a:3707:b0:6b5:e205:81c7 with SMTP id
 de7-20020a05620a370700b006b5e20581c7mr454869qkb.754.1659039436693; 
 Thu, 28 Jul 2022 13:17:16 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 j18-20020a05620a289200b006a693e46d5csm1338993qkp.11.2022.07.28.13.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 13:17:16 -0700 (PDT)
Message-ID: <63f7fdefca924ac5d192a5f617ea41cf266ba756.camel@redhat.com>
Subject: Re: [PATCH] nouveau/svm: Fix to migrate all requested pages
From: Lyude Paul <lyude@redhat.com>
To: Alistair Popple <apopple@nvidia.com>, bskeggs@redhat.com, 
 rcampbell@nvidia.com
Date: Thu, 28 Jul 2022 16:17:14 -0400
In-Reply-To: <20220720062745.960701-1-apopple@nvidia.com>
References: <20220720062745.960701-1-apopple@nvidia.com>
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
Cc: kherbst@redhat.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jhubbard@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi, in the future if it's taking a while for a review to come back feel free
to just send a poke on the thread for the patch you submitted, I do my best to
keep up with all of the patches coming in. But there's a lot of email that I
get so every now and then one slips through the cracks.

Anyway, this patch looks good to me:

Reviewed-by: Lyude Paul <lyude@redhat.com>

I will push it to the appropriate branch in a little bit

On Wed, 2022-07-20 at 16:27 +1000, Alistair Popple wrote:
> Users may request that pages from an OpenCL SVM allocation be migrated
> to the GPU with clEnqueueSVMMigrateMem(). In Nouveau this will call into
> nouveau_dmem_migrate_vma() to do the migration. If the total range to be
> migrated exceeds SG_MAX_SINGLE_ALLOC the pages will be migrated in
> chunks of size SG_MAX_SINGLE_ALLOC. However a typo in updating the
> starting address means that only the first chunk will get migrated.
> 
> Fix the calculation so that the entire range will get migrated if
> possible.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Fixes: e3d8b0890469 ("drm/nouveau/svm: map pages after migration")
> ---
>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 7ba66ad68a8a..16356611b5b9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -680,7 +680,11 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
>                 goto out_free_dma;
>  
>         for (i = 0; i < npages; i += max) {
> -               args.end = start + (max << PAGE_SHIFT);
> +               if (args.start + (max << PAGE_SHIFT) > end)
> +                       args.end = end;
> +               else
> +                       args.end = args.start + (max << PAGE_SHIFT);
> +
>                 ret = migrate_vma_setup(&args);
>                 if (ret)
>                         goto out_free_pfns;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

