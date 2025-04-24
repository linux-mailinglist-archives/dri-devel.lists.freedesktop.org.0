Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347A7A9B388
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 18:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E33910E1BF;
	Thu, 24 Apr 2025 16:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OgKHJI9H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CD110E1BF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 16:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745511091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8xsE74yKYPMH+2VlPy+Ra90/yb4WgqS6fEIO1+kVqG4=;
 b=OgKHJI9H5noil+8helMA03ido6cCbv25EiwCG3mZZ+PezcV5yzlKIMUoP5qA0iceUuYDJ5
 kVC2izdt58zIxYUcif9Pc5I+VTZxAOXS1aKsFPzMj3xzzfRX+2jiuqAkyOiShQubT+Qz9r
 unLMuQSo4f4+Dzz+FrCSy42cA7KdUfs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-LEh3SpmTPjGadfdYXPP-MQ-1; Thu, 24 Apr 2025 12:11:29 -0400
X-MC-Unique: LEh3SpmTPjGadfdYXPP-MQ-1
X-Mimecast-MFC-AGG-ID: LEh3SpmTPjGadfdYXPP-MQ_1745511089
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f2af3128b0so20746896d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 09:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745511089; x=1746115889;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8xsE74yKYPMH+2VlPy+Ra90/yb4WgqS6fEIO1+kVqG4=;
 b=jOlpq3yIP7LMiYFsWoUpCPZ6oSGOxONYZovzsKBS4Dr4rUweMI1EyuG3NbOeq47FnO
 +HZfy7P9dSYifyYuJ7HWcr6YgHYfAm69cZaa992ZCXyqPfKScXaiQSK7enuO56nYwOoD
 2cdr3fMXkPPP1/R2pWMHQ3VkPjOJa4c/XM5ScO49LGR9JgSe8c2CDm8MunvPte9+ZUpK
 B5ZQ9DjNnmVRMspYMGFTDItnDnUYekDQMlDttT2fxa6kLdU7sTPdpSXMD91+vynMcR8k
 KWVRERKXws7V+D/xwqSEKa954hPnZp/+cmdvOG4YcJ3cr5GxT8V7Av2YqSzC3wO2K9dA
 y9Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZHWbZCZW1e0hlKN2PCyLHdgVaQ8QizAEmMDQUJ53OTCEyF43XfrgQmwiGQtotJOpG01sGsQ7tiR0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5qt2G7eGk+aKuJabPDT7jL3lIAXyh3uPYcKbWCByqCdwcTUcM
 yloULswp3ekQNPW0+G6J+aDHM+bPMkBtxUMwDDp/lZz9PmSPPJqLJiNKaJzDGPwjcdxMwc1zhmn
 5O7RA9GKMOyFsO2A74StGgJQ0TLseWcxhfkDBldFgyF09c2sdf6vRpaUkv1JUUNwZOA==
X-Gm-Gg: ASbGncsjOf/vjcrHGyqK8bt6du7VtRHab20a5OkCoiDsRT5S01AnHGtV4HPwZVlSv/M
 cOrRbyl6c4j9pT6vVgF+GCPx/0edYecSN/5fSRe8teWvxCpakoI7PGbVIzOduuo83fg0+oU4Em/
 lw/bUeYLdtMti5yDweRcw2DDM/HqnwsKHk31qY0QTbRPzgQCoyqMyiuiyzNu/CKmesCxpEuEj4/
 62XPlzfJaAULMeyjaK6HhdnjKElecKFkAIOz4J5FnXgaMb1GBGNS/ui9IZAc3GV4WOP0eonyqQv
 mP9jyGfIE3S6yv5DZr7LVapUgycPOqE66Jtew0DcAuQ=
X-Received: by 2002:a05:6214:2b56:b0:6f4:c824:9d4a with SMTP id
 6a1803df08f44-6f4c824a12emr9235756d6.13.1745511088976; 
 Thu, 24 Apr 2025 09:11:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpF/KPHX3XupnXyOW//4CbII7OI3Fx0Pl8hvYFBhQZabQLo2Ocev5iqYKgDBjH6eF1US/txw==
X-Received: by 2002:a05:6214:2b56:b0:6f4:c824:9d4a with SMTP id
 6a1803df08f44-6f4c824a12emr9235276d6.13.1745511088411; 
 Thu, 24 Apr 2025 09:11:28 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb
 ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f4c0aaf5e9sm10784096d6.99.2025.04.24.09.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 09:11:28 -0700 (PDT)
Date: Thu, 24 Apr 2025 09:11:24 -0700
From: Jared Kangas <jkangas@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
Message-ID: <aApirJb9P-LOOB8j@jkangas-thinkpadp1gen3.rmtuswa.csb>
References: <20250422191939.555963-1-jkangas@redhat.com>
 <20250422191939.555963-3-jkangas@redhat.com>
 <20250424-sassy-cunning-pillbug-ffde51@houat>
MIME-Version: 1.0
In-Reply-To: <20250424-sassy-cunning-pillbug-ffde51@houat>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QC_0hsXtUvYgOZPFQiNVRXeJLnHEWr0tFKzbkGLT_l4_1745511089
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Maxime,

On Thu, Apr 24, 2025 at 10:33:58AM +0200, Maxime Ripard wrote:
> Hi Jared,
> 
> Thanks for working on this
> 
> On Tue, Apr 22, 2025 at 12:19:39PM -0700, Jared Kangas wrote:
> > The CMA heap's name in devtmpfs can vary depending on how the heap is
> > defined. Its name defaults to "reserved", but if a CMA area is defined
> > in the devicetree, the heap takes on the devicetree node's name, such as
> > "default-pool" or "linux,cma". To simplify naming, just name it
> > "default_cma", and keep a legacy node in place backed by the same
> > underlying structure for backwards compatibility.
> > 
> > Signed-off-by: Jared Kangas <jkangas@redhat.com>
> > ---
> >  Documentation/userspace-api/dma-buf-heaps.rst | 11 +++++++----
> >  drivers/dma-buf/heaps/Kconfig                 | 10 ++++++++++
> >  drivers/dma-buf/heaps/cma_heap.c              | 14 +++++++++++++-
> >  3 files changed, 30 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
> > index 535f49047ce64..577de813ba461 100644
> > --- a/Documentation/userspace-api/dma-buf-heaps.rst
> > +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> > @@ -19,7 +19,10 @@ following heaps:
> >   - The ``cma`` heap allocates physically contiguous, cacheable,
> >     buffers. Only present if a CMA region is present. Such a region is
> >     usually created either through the kernel commandline through the
> > -   `cma` parameter, a memory region Device-Tree node with the
> > -   `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
> > -   `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
> > -   might be called ``reserved``, ``linux,cma``, or ``default-pool``.
> > +   ``cma`` parameter, a memory region Device-Tree node with the
> > +   ``linux,cma-default`` property set, or through the ``CMA_SIZE_MBYTES`` or
> > +   ``CMA_SIZE_PERCENTAGE`` Kconfig options. The heap's name in devtmpfs is
> > +   ``default_cma``. For backwards compatibility, when the
> > +   ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
> > +   created following legacy naming conventions; the legacy name might be
> > +   ``reserved``, ``linux,cma``, or ``default-pool``.
> 
> It looks like, in addition to documenting the new naming, you also
> changed all the backticks to double backticks. Why did you do so? It
> seems mostly unrelated to that patch, so it would be better in a
> separate patch.

Ah, I thought that since it was touching the immediate area and it's a
small fix it would be suitable for this patch. Thanks for the catch,
I'll extract this in v3.

As for the rationale: as I understand it, the single backticks here are
semantically incorrect, at least in general reST -- they're mainly used
for links and roles. In this instance, the syntax is interpreted as the
default role:

    https://docutils.sourceforge.io/docs/ref/rst/roles.html

I believe double backticks are what the doc is looking for here, used
for code and rendered as monospaced text. Although there are a number of
places around existing documentation that use single backticks (which
happens to render as italics because the default role is
:title-reference: if not configured in conf.py), a look through doc
history points to double backticks being treated as correct for code,
such as f6314b76d826 ("docs: kbuild/kconfig: reformat/cleanup") or
2f0e2a39bbab ("docs/kbuild/makefiles: unify quoting").

> 
> > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> > index a5eef06c42264..83f3770fa820a 100644
> > --- a/drivers/dma-buf/heaps/Kconfig
> > +++ b/drivers/dma-buf/heaps/Kconfig
> > @@ -12,3 +12,13 @@ config DMABUF_HEAPS_CMA
> >  	  Choose this option to enable dma-buf CMA heap. This heap is backed
> >  	  by the Contiguous Memory Allocator (CMA). If your system has these
> >  	  regions, you should say Y here.
> > +
> > +config DMABUF_HEAPS_CMA_LEGACY
> > +	bool "DMA-BUF CMA Heap"
> > +	default y
> > +	depends on DMABUF_HEAPS_CMA
> > +	help
> > +	  Add a duplicate CMA-backed dma-buf heap with legacy naming derived
> > +	  from the CMA area's devicetree node, or "reserved" if the area is not
> > +	  defined in the devicetree. This uses the same underlying allocator as
> > +	  CONFIG_DMABUF_HEAPS_CMA.
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> > index e998d8ccd1dc6..cd742c961190d 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/vmalloc.h>
> >  
> > +#define DEFAULT_CMA_NAME "default_cma"
> 
> I appreciate this is kind of bikeshed-color territory, but I think "cma"
> would be a better option here. There's nothing "default" about it.

I'm a little uncertain about plain "cma"; John mentioned the possibility
of other CMA regions, suggesting that if we used "cma", we'd need to
rename it again in the future to disambiguate. It doesn't sound
guaranteed that other regions will be added, so I can see starting with
"cma" and adjusting later if needed, but "default_cma" seemed
inoffensive enough because it's consistent with current wording (e.g.,
"linux,cma-default", "default-pool"), and has a lower chance of changing
if other CMA regions/heaps were added. Let me know what you think.

> 
> >  struct cma_heap {
> >  	struct dma_heap *heap;
> > @@ -394,15 +395,26 @@ static int __init __add_cma_heap(struct cma *cma, const char *name)
> >  static int __init add_default_cma_heap(void)
> >  {
> >  	struct cma *default_cma = dev_get_cma_area(NULL);
> > +	const char *legacy_cma_name;
> >  	int ret;
> >  
> >  	if (!default_cma)
> >  		return 0;
> >  
> > -	ret = __add_cma_heap(default_cma, cma_get_name(default_cma));
> > +	ret = __add_cma_heap(default_cma, DEFAULT_CMA_NAME);
> >  	if (ret)
> >  		return ret;
> >  
> > +	legacy_cma_name = cma_get_name(default_cma);
> > +
> > +	if (IS_ENABLED(CONFIG_DMABUF_HEAPS_CMA_LEGACY) &&
> > +	    strcmp(legacy_cma_name, DEFAULT_CMA_NAME)) {
> > +		ret = __add_cma_heap(default_cma, legacy_cma_name);
> > +		if (ret)
> > +			pr_warn("cma_heap: failed to add legacy heap: %pe\n",
> > +				ERR_PTR(-ret));
> > +	}
> > +
> 
> It would also simplify this part, since you would always create the legacy heap.

By "always", do you mean removing the strcmp? I added this to guard
against cases where the devicetree node's name clashed with the default
name, given that the DT name isn't necessarily restricted to one of the
current names in use ("linux,cma" or "default-pool"). It seems like the
strcmp would be relevant regardless of the naming choice, but if this is
overly cautious, I can remove it in v3.

Jared

> 
> Maxime


