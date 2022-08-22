Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BBD59CA9E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 23:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92CA11BE5E;
	Mon, 22 Aug 2022 21:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F396A33CD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 21:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661202938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W99ikbboaJjO+6FHQ4eYoJSNppDNkQvI/eXvuOgjNJE=;
 b=gal/QNw0mfk889K9/IPoF6ACcfSDCXooDoJUFjj6CeR0PRBtmn3XYagUTo9XsQ2wym/1Ao
 wgdMrqKMU/YYO67YV189lUTpjNKrCRp+lsiQb+Gnf/NeJ74Z6BlX0iV/YgKMqOdPoHldPj
 UsmzGTU07ydvZONt6Gt0l0LiyiHhvFM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-T8PqvFwMNseB1np7sfMdDw-1; Mon, 22 Aug 2022 17:15:37 -0400
X-MC-Unique: T8PqvFwMNseB1np7sfMdDw-1
Received: by mail-qk1-f198.google.com with SMTP id
 w17-20020a05620a425100b006b97978c693so10656129qko.19
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 14:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=W99ikbboaJjO+6FHQ4eYoJSNppDNkQvI/eXvuOgjNJE=;
 b=5ePwVX/8MMLDk/jAO5IUVUCqL9TGZNK/6xwidkRD2cXMYONRwLkGPruhQAJDhnq/5x
 T1Qsvngt9GG9bqfPtEYADhlCemYNlODviVzfDC6e9FYNn1QMoxY/YurSH7rWBGrOgcSO
 ezK+b8NxDXP+62Qey+PGvEDuqWkdtPR/Xqb1SCyy2vzr2Mo4b6genP1IuklzUIle5J8O
 nEAOW7+kGQyWvG4XzZYjzwubDnJbGZ287Nz59KmgFSQ21MHVhMn9WhugpATHC8sXYdvW
 Esl0Hd1ucLqnqANxQcDma7fjctAVZSf5+0tXcD0mdP5UqeBrA7lIqdT9ZM3XYSle2F0X
 7ohg==
X-Gm-Message-State: ACgBeo35I4cIzBZ2cuNsVnX36a2Ee6puTLHSqI26y9KOg+omEvKAxQzW
 GjblC048JMcTgL0ZDw3jJopLldG/lFy3T61ZNkebPgP6Dixn1UhsKBKRi/YhWhA7l5y9xCdORgn
 Lqz74HyXIlfUEDSkSufPIsZ/Eb3c4
X-Received: by 2002:a05:622a:392:b0:343:738e:6f6b with SMTP id
 j18-20020a05622a039200b00343738e6f6bmr17200980qtx.174.1661202936870; 
 Mon, 22 Aug 2022 14:15:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5EnIC47AD0HBg/p8AcS7SZGGBNwPKTx0oDmr3tOt7DoWa5vhMJb3HcnPkR2X3yyJinWb3S5A==
X-Received: by 2002:a05:622a:392:b0:343:738e:6f6b with SMTP id
 j18-20020a05622a039200b00343738e6f6bmr17200952qtx.174.1661202936595; 
 Mon, 22 Aug 2022 14:15:36 -0700 (PDT)
Received: from [192.168.8.139] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 w25-20020a05620a0e9900b006b5bf5d45casm11352206qkm.27.2022.08.22.14.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 14:15:35 -0700 (PDT)
Message-ID: <26a6f44c4b2a24d01b23d692416bf3f73103410d.camel@redhat.com>
Subject: Re: [PATCH] nouveau: explicitly wait on the fence in
 nouveau_bo_move_m2mf
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org
Date: Mon, 22 Aug 2022 17:15:34 -0400
In-Reply-To: <20220819200928.401416-1-kherbst@redhat.com>
References: <20220819200928.401416-1-kherbst@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2022-08-19 at 22:09 +0200, Karol Herbst wrote:
> It is a bit unlcear to us why that's helping, but it does and unbreaks
> suspend/resume on a lot of GPUs without any known drawbacks.
> 
> Cc: stable@vger.kernel.org # v5.15+
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/156
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 35bb0bb3fe61..126b3c6e12f9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -822,6 +822,15 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
>  		if (ret == 0) {
>  			ret = nouveau_fence_new(chan, false, &fence);
>  			if (ret == 0) {
> +				/* TODO: figure out a better solution here
> +				 *
> +				 * wait on the fence here explicitly as going through
> +				 * ttm_bo_move_accel_cleanup somehow doesn't seem to do it.
> +				 *
> +				 * Without this the operation can timeout and we'll fallback to a
> +				 * software copy, which might take several minutes to finish.
> +				 */
> +				nouveau_fence_wait(fence, false, false);
>  				ret = ttm_bo_move_accel_cleanup(bo,
>  								&fence->base,
>  								evict, false,

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

