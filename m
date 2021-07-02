Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1873BA62B
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 01:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540796E08A;
	Fri,  2 Jul 2021 23:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B3F6E08A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 23:00:42 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id l8so14200070wry.13
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 16:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=dq8fUyEcyiByFi+gKaYdmSRiQKhtbBhDKl3kxlrYUqM=;
 b=PqiqTDcZxcsjYVvjFbZWlDI959Ka0UIJkWmBX88sRlehCGEzGSO03vA2Q1KkG/Z3Sv
 YUYtY19HOLhJ8JxkKNtotv/Y/KeZy8eUYYdIu7wGTD4YbjHk1KH+KqeO+SW+cJYS7sDb
 D3WsSjfJnLd1IQ5YHClOlrIyxqXMj7G9ejFFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dq8fUyEcyiByFi+gKaYdmSRiQKhtbBhDKl3kxlrYUqM=;
 b=VZwEpDE0uY86zgIAu3xBTomLNtJgLbEcFp5KM0Fq/8ww7gDv5TxnBQZ6UIA+tnBSre
 5JMlpMVU6ZHNsiWZiaRnVS4zfxu8/RoLTYZ3Zzu8rmEXbO+JHB1HzhJh6iafg3IHWg9I
 Q2bwIR1eazzm2cFl682UU1A9nLwq+lAAzZIO22Qc7xSEUI0oQVMhsEgKQTUuJ82oFubO
 i/0XeTO+W2ev+GVT9T6pYnmIDZoBmuMA85Im7sQtqb57DlcDJQKGow/GcPQL/17p8kT5
 C1vTpey1lG2Ik8hPoK7tK5z3UbvLcbwLKMvZamf/EexW1WZx29FPI0ANt4YWh4X1F95D
 aUZQ==
X-Gm-Message-State: AOAM531Il/L4lN+0LyqZnzLLX381olWKb8GI9ESniYz9I3ZCpE4GyHbK
 8f/cgaZnfKi7xzuRf5xq/0k9hQ==
X-Google-Smtp-Source: ABdhPJyWizTKZs1jspUfbZwftyd4fcd/rleXaTVRBSJ5PQzoOn0n5erFj7z9caWpHNIOY27ZcYfVaQ==
X-Received: by 2002:adf:fa92:: with SMTP id h18mr2126017wrr.57.1625266841386; 
 Fri, 02 Jul 2021 16:00:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k15sm13741110wms.21.2021.07.02.16.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 16:00:40 -0700 (PDT)
Date: Sat, 3 Jul 2021 01:00:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/4] drm/nouveau: always wait for the exclusive fence
Message-ID: <YN+alm8BZtnvFC+Q@phenom.ffwll.local>
References: <20210702111642.17259-1-christian.koenig@amd.com>
 <20210702111642.17259-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210702111642.17259-4-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 02, 2021 at 01:16:41PM +0200, Christian König wrote:
> Drivers also need to to sync to the exclusive fence when
> a shared one is present.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 6b43918035df..05d0b3eb3690 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -358,7 +358,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
>  	fobj = dma_resv_shared_list(resv);
>  	fence = dma_resv_excl_fence(resv);
>  
> -	if (fence && (!exclusive || !fobj || !fobj->shared_count)) {
> +	if (fence) {
>  		struct nouveau_channel *prev = NULL;
>  		bool must_wait = true;
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
