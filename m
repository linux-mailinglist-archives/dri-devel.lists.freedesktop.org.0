Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FACAC6E69
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 18:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F5B10E688;
	Wed, 28 May 2025 16:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="WOWf1ep6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFA610E66E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:51:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1748451072; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=n2O5YJx9JLGoHDpWy4J0J8tW2Wh57kK4qnSd6xBLXF8IadU/bwUqqvDmEH+qf0+RyXh1vFu8YgOccCNdvoakvHaJqEe1zhChT2uqI8Q/vfs7rRhwNbuqG1XDSkZHLiRHP0xIiR6i6bt502Frr8wssPTfR3QwXZj3Gdnh62l78QQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1748451072;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=8TTGW/rXxgU3Ny26UAPvPgeNMMZC2BFxIblODqxuWhE=; 
 b=oLmQTS99fsBdrc9WA84SlkPLR29GrnSyj0xrC4+req2ZpKijnP0vyBPPu/9abwwTl4Pd5l9MHylSQXtE4iLQNaCM0v8y8yYlrVE6hPn3gk6iXGbQD7Dfl3YOnPo7bS+V6qZf7P45gE0MWu0azRlymt860xQdRwUmV5P9Y+u29Ag=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748451072; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=8TTGW/rXxgU3Ny26UAPvPgeNMMZC2BFxIblODqxuWhE=;
 b=WOWf1ep6qOYIps7naxYy8w0WWJ90Dxf87CBtuoQKM0S7UgMB7um15P3HFuTdjqeD
 LTfbU3ZmqarOebids+bEmxrHdG07rq+Pw9mVh4GXcQovodxf9Zu75vW5F2pm0fM42ZK
 Y/Mv2vPV3NmyI/nfC+5HSJmVFyARQC1Slh5CGY+g=
Received: by mx.zohomail.com with SMTPS id 1748451070120388.2472960078295;
 Wed, 28 May 2025 09:51:10 -0700 (PDT)
Message-ID: <1aa88d93-3fb5-46a0-a6a7-dd60d7a38eeb@collabora.com>
Date: Wed, 28 May 2025 19:51:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/client: Do not pin in drm_client_buffer_vmap()
To: Thomas Zimmermann <tzimmermann@suse.de>, boris.brezillon@collabora.com,
 airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20250526132634.531789-1-tzimmermann@suse.de>
 <20250526132634.531789-2-tzimmermann@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250526132634.531789-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 5/26/25 16:25, Thomas Zimmermann wrote:
> Pin and vmap are two distict operations. Do not mix them.
> 
> The helper drm_client_buffer_vmap() maps the pages for fbdev-dma
> and fbdev-shmem. In both cases, the vmap operation ensures that
> the pages are available until the vunmap happens. And as the pages
> in DMA or SHMEM areas cannot be moved, there is no reason to call
> pin. Hence remove the pin call.
> 
> Update drm_client_buffer_vunmap() accordingly.
> 
> v2:
> - call 'locked' variants of GEM helpers (Dmitry)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/drm_client.c | 35 ++++++-----------------------------
>  1 file changed, 6 insertions(+), 29 deletions(-)

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
