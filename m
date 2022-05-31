Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAB5538A02
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 04:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F6610E2B8;
	Tue, 31 May 2022 02:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDC710E2B8
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 02:51:48 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 n13-20020a17090a394d00b001e30a60f82dso1075865pjf.5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 19:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=xcpbx9Lt9Owdlm64rePa6qexHLWiyypbRMgxN1JLv/M=;
 b=CyYXFkxhZiXQiu14RxVExNHuXRW0mFlO3k3+vtcoaKX56jC5Ba1StMa8qKRpw1gBRQ
 m2pdXOpOXP5yoNapy24x4BR7MDFAg/xRghRxTbuu49cw3iyj+gWoa8iNtf8UAns32Wob
 fQmMqbHWuHhV5B4vVeGxYjmDjsojaHhPcIBeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xcpbx9Lt9Owdlm64rePa6qexHLWiyypbRMgxN1JLv/M=;
 b=l7nkNGzKu8KgbkPD2Imm7F/P/8lz8cVQx8ozaowg4pKHfoGMAZ/90UMFsVsfbx3IT8
 0d/qyTuieOCaegFKuIxqYoEnHj4Hh/THcEwVBuomVInI+g+ws+tMGN/Kr4cQ5L+bG8x6
 vkOZ+D94ftcbLEZ/Wqr7b81xa7wl+p7e9qklzEDEBUoP4g3lCpdn0z6GiaI62NoDSkck
 RgrbDoQseiJsAQTH7c8Zwrzgst2lNS+/pokYMPNmCNnT2QGo7s+jYuAJQmilIlOuIG0G
 fjwJC5STIrMBxkzb4crs+7m270UDrmI/THKgZIhyuiRTdYmK6sdZLdXTYRQV/N/uG/8w
 DNTQ==
X-Gm-Message-State: AOAM532RFpFLO7F0kivS7wZvW4WZ0LZUQ5UvkIlq2ACS9PoIF7xVID2h
 bl32C3GiM1bOfw4avQMSOP+PJg==
X-Google-Smtp-Source: ABdhPJylou6Lhk/REVZIpM88w/Cw5uS6g71yGFXefOXkdi3IddUox11VUsoNOmO40/Smst1WUN/3KA==
X-Received: by 2002:a17:90a:de01:b0:1df:cda5:8332 with SMTP id
 m1-20020a17090ade0100b001dfcda58332mr26157122pjv.123.1653965508382; 
 Mon, 30 May 2022 19:51:48 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:7d2a:ad1f:afa1:7770])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a056a00005000b00518382bceaesm9479310pfk.57.2022.05.30.19.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 19:51:47 -0700 (PDT)
Date: Tue, 31 May 2022 11:51:42 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] dma-fence: allow dma fence to have their own lock
Message-ID: <YpWCvniLzJfcp684@google.com>
References: <20220530142232.2871634-1-senozhatsky@chromium.org>
 <7eee4274-bd69-df8d-9067-771366217804@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7eee4274-bd69-df8d-9067-771366217804@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, Gustavo Padovan <gustavo@padovan.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tomasz Figa <tfiga@chromium.org>, Christoph Hellwig <hch@infradead.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Ricardo Ribalda <ribalda@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On (22/05/30 16:55), Christian König wrote:
> Am 30.05.22 um 16:22 schrieb Sergey Senozhatsky:
> > [SNIP]
> > So the `lock` should have at least same lifespan as the DMA fence
> > that borrows it, which is impossible to guarantee in our case.
> 
> Nope, that's not correct. The lock should have at least same lifespan as the
> context of the DMA fence.

How does one know when it's safe to release the context? DMA fence
objects are still transparently refcount-ed and "live their own lives",
how does one synchronize lifespans?
