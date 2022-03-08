Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A79DE4D1ADD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 15:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA6510E5EA;
	Tue,  8 Mar 2022 14:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB5310E5DC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 14:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646750568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tATbOgHJcJ/4hUpKdLQsepBRnBgdhbYd9x5YyJps/7o=;
 b=i0Kd/V+dTuRhTH9w+Ca1lNbCL4i7ttVpdgKwHTG4AlDHF2SxSVGxS06H0hrmupAIs/aJjj
 Kd3CUGmp2bSaqcr6p0VkFfB8c26cowAbB8nPw+JlNQoOKIlkCrHszY7UFoFCZz1s+XkBqh
 WIv3QQuTJWBqWAXIhKiYLoihvWOPeOk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-dKePLxtLMOijR8NzgS-UjQ-1; Tue, 08 Mar 2022 09:42:45 -0500
X-MC-Unique: dKePLxtLMOijR8NzgS-UjQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 187-20020a1c19c4000000b0037cc0d56524so1262646wmz.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 06:42:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tATbOgHJcJ/4hUpKdLQsepBRnBgdhbYd9x5YyJps/7o=;
 b=jHCVZJJ5ND90SaiSLpZs0UvpaZRxCmaysKWrh0YqwqPv1i79gUzkxI7TI5DUwUfOeo
 UTB3jvcNY2K2VO9yJr4kwiKa0eyNfzojm+HZFWDcaO2ywcmhaUV6Srl48iAxZN4TgWqW
 2ZH3aQzT04RzSWoLwzKkNucGSdlMs+vh9FuqemdcZpoyYnxiMKbyr7Cea/cPFnT6byR8
 +rxVLop7xYnvXOprBmN37kCpuDAxoQkZmi6ead98kqMTkiVSc1g7kTyIc5mPczYcr0Vt
 dDn2wmvdNwZKUt7+KMy/+eKSmyy14Hv4ZSeJD/uDxgBs9QiqlNRg1+1n+zKF6Hw4PIgO
 LVRQ==
X-Gm-Message-State: AOAM5308229TcjGIHaycnkSarni+ndtJe5CIRRUTcobdOjaTyzomGWur
 NdKKnvGd6y9XyA2ELegRuhkLrHiu763wK2OouKwte5XMNVGsmaDGwecEpJc2slspISf/32snzOb
 vFT/NUrgJUSTL1fHkWaIC4/qMVpxj
X-Received: by 2002:adf:b1da:0:b0:1f0:1205:89c1 with SMTP id
 r26-20020adfb1da000000b001f0120589c1mr12369664wra.27.1646750563995; 
 Tue, 08 Mar 2022 06:42:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOZcVU+hFCO17d0FKfNV//pcbVvoZdXclr9zQPpsTXnY/L9Y2Kt6jpCy1GSMTv1uSfM8TgFQ==
X-Received: by 2002:adf:b1da:0:b0:1f0:1205:89c1 with SMTP id
 r26-20020adfb1da000000b001f0120589c1mr12369647wra.27.1646750563746; 
 Tue, 08 Mar 2022 06:42:43 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfe7c2000000b001f04d622e7fsm14003199wrn.39.2022.03.08.06.42.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 06:42:43 -0800 (PST)
Message-ID: <291426e8-32ed-ba0b-4d23-38218d450c93@redhat.com>
Date: Tue, 8 Mar 2022 15:42:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/9] fbdev: Track deferred-I/O pages in pageref struct
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220303205839.28484-4-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/3/22 21:58, Thomas Zimmermann wrote:
> Store the per-page state for fbdev's deferred I/O in struct
> fb_deferred_io_pageref. Maintain a list of pagerefs for the pages
> that have to be flushed out to video memory. Update all affected
> drivers.
> 
> Like with pages before, fbdev acquires a pageref when an mmaped page
> of the framebuffer is being written to. It holds the pageref in a
> list of all currently written pagerefs until it flushes the written
> pages to video memory. Writeback occurs periodically. After writeback
> fbdev releases all pagerefs and builds up a new dirty list until the
> next writeback occurs.
> 
> Using pagerefs has a number of benefits.
> 
> For pages of the framebuffer, the deferred I/O code used struct
> page.lru as an entry into the list of dirty pages. The lru field is
> owned by the page cache, which makes deferred I/O incompatible with
> some memory pages (e.g., most notably DRM's GEM SHMEM allocator).
> struct fb_deferred_io_pageref now provides an entry into a list of
> dirty framebuffer pages, free'ing lru for use with the page cache.
> 
> Drivers also assumed that struct page.index is the page offset into
> the framebuffer. This is not true for DRM buffers, which are located
> at various offset within a mapped area. struct fb_deferred_io_pageref
> explicitly stores an offset into the framebuffer. struct page.index
> is now only the page offset into the mapped area.
> 
> These changes will allow DRM to use fbdev deferred I/O without an
> intermediate shadow buffer.
> 

As mentioned, this is a very nice cleanup.

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[snip]

> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
> index 33f355907fbb..a35f695727c9 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
> @@ -322,12 +322,13 @@ static void vmw_deferred_io(struct fb_info *info,
>  	struct vmw_fb_par *par = info->par;
>  	unsigned long start, end, min, max;
>  	unsigned long flags;
> -	struct page *page;
> +	struct fb_deferred_io_pageref *pageref;
>  	int y1, y2;
>  
>  	min = ULONG_MAX;
>  	max = 0;
> -	list_for_each_entry(page, pagelist, lru) {
> +	list_for_each_entry(pageref, pagelist, list) {
> +		struct page *page = pageref->page;
>  		start = page->index << PAGE_SHIFT;

Do you think that may be worth it to also decouple the struct page.index and 
store the index as a struct fb_deferred_io_pageref.index field ? 

It's unlikely that this would change but it feels as if the layers are more
separated that way, since no driver will access struct page fields directly.

The mapping would be 1:1 anyways just like it's the case for the page offset.

In fact, that could allow to even avoid declaring a struct page *page here.

[snip]

> @@ -340,7 +340,8 @@ static void fbtft_deferred_io(struct fb_info *info, struct list_head *pagelist)
>  	spin_unlock(&par->dirty_lock);
>  
>  	/* Mark display lines as dirty */
> -	list_for_each_entry(page, pagelist, lru) {
> +	list_for_each_entry(pageref, pagelist, list) {
> +		struct page *page = pageref->page;

Same here and the other drivers. You only need the page for the index AFAICT.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

