Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A95F53852E
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 17:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C9210F214;
	Mon, 30 May 2022 15:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E2310F2A3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 15:45:16 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id r71so10511490pgr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=UzXLXm8vq0opPbH6M8k2y8y+ok1gbqPBfw980V3Tkyk=;
 b=OC//hEgQZz5hudScLXcI+3NIXxxiRgV/eBvm2OMmnz0Z8udrwsrpuPPA72m7d0+4ad
 YH8xRKqUWhJqk6c2VBbCRt1rsr3umJ9xr10B6r+YoN88npTj2HUNhET6FKAGQ9FpP5sa
 grwNjNYIahG7tnWRMWx/Fv5XTCPwE9/Gvf/AU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UzXLXm8vq0opPbH6M8k2y8y+ok1gbqPBfw980V3Tkyk=;
 b=J5kIvSBXQU/2m9dPoByg2a15590wO2DODNn2xfK2UOOIbCNlk0eark8TVSB6nRn2g4
 I5YEyXfFvATJtzhwJzeyEXi8Gzc2yuyC42byVpRo6DIUt5UQKVzcFuo+WfUALZU7xoWo
 BmgOc9+xRpjKLiyYFF7ugcgI89AVfX8g3RhuHiI+wNaY8xXdvsYcdD1MfC+TxxIKnz5u
 qCLaB8pZQgPTBves/2GQf0Q3tA/jLQjMXnKRjf9UYXD5R87s06ubtDbOYeBye3vCvU2e
 jN5bTCauxtaDHoMqMHzpLqZZkR1hRVBbLVp6+ScM3rpKJMcbqMAYjwbCGOpd2EAd3q07
 kcKA==
X-Gm-Message-State: AOAM533TgZoSlVgGmb0sZe+uGjzGAWnKp46kIrNOgOzxELE4PjiVKCZg
 0ftU5or6YR96bEGArn535rRi4w==
X-Google-Smtp-Source: ABdhPJyzRn6dpzJxAThZJd/mUWBZTsKavBYdkXkPO7g2uyd2aZ+PyHCjdemggRcBDIURpiq1V2iudg==
X-Received: by 2002:a63:1163:0:b0:3fa:5e1c:f86f with SMTP id
 35-20020a631163000000b003fa5e1cf86fmr32724131pgr.543.1653925516458; 
 Mon, 30 May 2022 08:45:16 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:7d2a:ad1f:afa1:7770])
 by smtp.gmail.com with ESMTPSA id
 65-20020a620644000000b0050dc7628166sm8935262pfg.64.2022.05.30.08.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 08:45:15 -0700 (PDT)
Date: Tue, 31 May 2022 00:45:10 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] dma-fence: allow dma fence to have their own lock
Message-ID: <YpTmhixkV7+yh6wo@google.com>
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
> 
> If you just want to create a single dma_fence which is also only bound to a
> single context you can embed the lock into the fence without much problem.
> 
> See how the dma_fence_array does that for example: https://elixir.bootlin.com/linux/latest/source/include/linux/dma-fence-array.h#L37

Christian, I'm not sure I'm following you on the "embed the lock into the
fence without much problem" part. If I understand it correctly this should
be something like:

	fences = kmalloc_array(1, sizeof(*fences), GFP_KERNEL);
	for_each_fence(...) {

		// what spinlock should I use here?

		dma_fence_init(&fences[i], .. &lock ..);
		dma_fence_get(&fences[i]);
	}
	fence_array = dma_fence_array_create(1, fences, ....);
	sync_file_create(&fence_array->base);
