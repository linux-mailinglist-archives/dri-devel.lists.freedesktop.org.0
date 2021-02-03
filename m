Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CADC430D0CD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 02:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD7B6E9C5;
	Wed,  3 Feb 2021 01:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CB36E9C5
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 01:31:08 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id w14so15613725pfi.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 17:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=T+IFulWS30TVdfKg6FbK/0wljc+JOjEQqde/nrXKzCI=;
 b=pHh0nOo43ZTL5LL9P7k8jk/hC0amgWajB0mH3Dxb+vwAmJsJmm/nGyaG++L/G1mVNK
 eDiW55ib9GCrzzm1FaVcoNxYgnApFS7wl0oXCt4dHRtUunxsYGX4PyyZG9peXq3jNugE
 9jqld7I4QdoQTqMGI1xnvPCO6XSRkm/HRq/sXHP0RHvxaC3GeBTRLlvfHUqCOrgjhPjI
 7sZ6na77hAuh5dI+E6MUQnVguhNOdS2AzUAGlmPiqSKzcXP09y9xoGCXVukyBxOtWZxt
 u2Ki9FNu/+eDKY60VVxREEQkIKo3xthogr7K0IvOl5r8kHX9pJfkJkvG/XcYHqU8fKY4
 EvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=T+IFulWS30TVdfKg6FbK/0wljc+JOjEQqde/nrXKzCI=;
 b=CyIDmNyjtQsUawZkm2VENdhojnB8dLAyXiHfbf26/jjkXdIty051IKlQ5cvNf+tQ8x
 k0IX1ge/uK0szXZOK4pX1X7qkb0hP7LTXSyuUKadr21L/mo9CS6AvZB6gku/LYPDOAx4
 7L/t5jtS6xhytQX9a/RAxH50gaXUIoxO7iXv+/rIq+5xGj9DCAzcuHjxSlDaGjacyA41
 4doelPZ52Hg4L09Asw0dn3EjF42yg3ImuCMAo74sLjltA2ChCOabO0dxZZiRIg6NGOEA
 94Wy/e4P3cw/7dXU+/YwsXSeCZTBPf8UkHaToeCkjsP2BdjAj607rKE/hPYo38Jtpeew
 9MMw==
X-Gm-Message-State: AOAM533cl091u8l/ikInyfhXlMJNCHwS9NK7g/5s9ZjkHjCtks8Db7cO
 +VOgQkqAxoX3n/UT+ueayCE=
X-Google-Smtp-Source: ABdhPJz+SHeDGDiOTFr7BCLmdLVZac+uhes3CUQ3tgyGdAX3UbuwtARrizczD0kVVmAQ9gNAoPNKtA==
X-Received: by 2002:a62:f202:0:b029:1bc:a634:8e9c with SMTP id
 m2-20020a62f2020000b02901bca6348e9cmr717628pfh.49.1612315867684; 
 Tue, 02 Feb 2021 17:31:07 -0800 (PST)
Received: from google.com ([2620:15c:211:201:1502:84f8:ffc3:45b])
 by smtp.gmail.com with ESMTPSA id o20sm212189pgn.6.2021.02.02.17.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 17:31:06 -0800 (PST)
Date: Tue, 2 Feb 2021 17:31:03 -0800
From: Minchan Kim <minchan@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 1/2] mm: replace BUG_ON in vm_insert_page with a return
 of an error
Message-ID: <YBn81xAeCqHgudYb@google.com>
References: <20210203003134.2422308-1-surenb@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203003134.2422308-1-surenb@google.com>
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
Cc: linaro-mm-sig@lists.linaro.org, orjan.eide@arm.com, sspatil@google.com,
 christian.koenig@amd.com, kernel-team@android.com, jajones@nvidia.com,
 linux-kernel@vger.kernel.org, lmark@codeaurora.org, hch@infradead.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org, cgoldswo@codeaurora.org,
 hridya@google.com, akpm@linux-foundation.org, labbott@redhat.com,
 robin.murphy@arm.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 02, 2021 at 04:31:33PM -0800, Suren Baghdasaryan wrote:
> Replace BUG_ON(vma->vm_flags & VM_PFNMAP) in vm_insert_page with
> WARN_ON_ONCE and returning an error. This is to ensure users of the
> vm_insert_page that set VM_PFNMAP are notified of the wrong flag usage
> and get an indication of an error without panicing the kernel.
> This will help identifying drivers that need to clear VM_PFNMAP before
> using dmabuf system heap which is moving to use vm_insert_page.
> 
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  mm/memory.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index feff48e1465a..e503c9801cd9 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1827,7 +1827,8 @@ int vm_insert_page(struct vm_area_struct *vma, unsigned long addr,
>  		return -EINVAL;
>  	if (!(vma->vm_flags & VM_MIXEDMAP)) {
>  		BUG_ON(mmap_read_trylock(vma->vm_mm));

Better to replace above BUG_ON with WARN_ON_ONCE, too?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
