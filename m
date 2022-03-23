Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 240564E5686
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 17:32:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F75110E059;
	Wed, 23 Mar 2022 16:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE8910E059
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 16:32:45 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id e22so1604095qvf.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 09:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7LH/BAJ5JIiAI3E0xe273jWZ+iAloz6/lGJSM6J+7qc=;
 b=UUg+s18BivN7Ydyj2Ln4yb45sBSGsRz/zT14LWD4Y+rRELLyXCvQHk7hpbcgzcn9ni
 iy7BZaBsQjGIOpygvNMl82NGgay+S5LVTg5lmNUc78+cJgwEsRZ0B9XrcRyZabJgrvNA
 cq0g3tEKC3UHqTl2QJGv7BrfJAQRwk3P5WA6WtnGGrBfcEYTK5TWAQjyOD1Prb489rZZ
 XJ5aS0AX8Q52whoJ//Ckj0x+hXg66HJEC3iA3mAgAtkYr21rDnaxQAKiQ94mV0LftGSU
 82uSFpw5H/NuKHm6o6yJA9aFV8Bewpep2O2QYCeJPO5wDvtPvcrUm13o9et24+K65FO0
 0Irg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7LH/BAJ5JIiAI3E0xe273jWZ+iAloz6/lGJSM6J+7qc=;
 b=Q8YQSFhSSG/y+Zu7IiiDcKvXu5IADid9E8Z/PxRgKdmNzNUPt7U6IleTpujZlqtwgN
 z0TdK5UuY2+SIMri6pE/SGq1Or1RCPT2kfbBk5x4hZwhKtmBNriabyzUa0KtOL14fj4D
 FE1fNQCfVbE3bOqHwyqPaOHxKOxtFbg6wqFZNumUAPaGhcJem7qqKlSFKCPiOjPFUqPq
 FB3Tb2xQyhX/e2m3rezvbAUDe1qsakHuaIGdJRxdU86yDSm9paY3jWSvoy2qBG+V5i1S
 fQTPOKZXpcp7zwtC6p9daaNq8PSU2ayaITHgvA2i3OCIgikmVwEyBpsHXO6k7QWOSoVG
 /5eA==
X-Gm-Message-State: AOAM531BMA1w8K8qmQl2vD4BMNLC4f21kq56A1Bbdb2bmnvuk3f15rEo
 qeFmsbxA4SVxUOTKgZkfVUVeIw==
X-Google-Smtp-Source: ABdhPJyZieS4yH7sj5HKr466jKN3HJ6IQr0Aix1wpCOMBxPMNqtld1II12OSbI55/DAsq2dmJpfpNg==
X-Received: by 2002:ad4:5a11:0:b0:441:1485:33ff with SMTP id
 ei17-20020ad45a11000000b00441148533ffmr340193qvb.127.1648053164217; 
 Wed, 23 Mar 2022 09:32:44 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 h206-20020a379ed7000000b0067b5192da4csm214905qke.12.2022.03.23.09.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 09:32:43 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nX3uc-004xPv-BA; Wed, 23 Mar 2022 13:32:42 -0300
Date: Wed, 23 Mar 2022 13:32:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 04/23] RDMA: use dma_resv_wait() instead of extracting
 the fence
Message-ID: <20220323163242.GJ64706@ziepe.ca>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-4-christian.koenig@amd.com>
 <Yjse+S0bf4P6QTfu@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yjse+S0bf4P6QTfu@phenom.ffwll.local>
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
Cc: Leon Romanovsky <leon@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Gal Pressman <galpress@amazon.com>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, daniel.vetter@ffwll.ch,
 Maor Gottlieb <maorg@nvidia.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 23, 2022 at 02:22:01PM +0100, Daniel Vetter wrote:
> On Mon, Mar 21, 2022 at 02:58:37PM +0100, Christian König wrote:
> > Use dma_resv_wait() instead of extracting the exclusive fence and
> > waiting on it manually.
> > 
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> 
> Jason, can you ack this for merging through drm trees please?

Sure, it looks trivial, but I didn't see the whole series:

Acked-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
