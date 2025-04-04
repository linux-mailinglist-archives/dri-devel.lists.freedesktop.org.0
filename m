Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DBDA7B859
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 09:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D73110E309;
	Fri,  4 Apr 2025 07:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="mlgQCiQu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f4D9D1uB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 531 seconds by postgrey-1.36 at gabe;
 Fri, 04 Apr 2025 07:42:38 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41ED410E309
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 07:42:38 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1743752015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CORAwJdGdFJqSXpfBY2eBhV3jtyb7N9hwR1HOp2miIw=;
 b=mlgQCiQuOrsco+po4sSITtC11nph9KQwzE+DSpGJF+GzYbY1iOkm+3JPijRAA5OPBTYb6Q
 cVSO8otipo4wfZTMR9e4XBBy7+JZWjVU78K6a6RbI0La0EjxVpHCOfajgXBYkW9pF5mIXq
 MlOfJJTps1zAjYHYoUraLaIKshDoNKjvRocZeBCwdTQVYw4qZfIwfNdNvPStyBPsBA4mLl
 34iqpxCz3hMPEH8Q1L2pQRcmKyoMQeBTVMkaLkZkmiM8/40W3mmcqN7vd10cylBbYoZ9bg
 uMqnQytDLVcIlT2rUK9A5IB9f59wnGpgcz8y0nYaOE2A3fDlx9Xnjr1IpgLgmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1743752015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CORAwJdGdFJqSXpfBY2eBhV3jtyb7N9hwR1HOp2miIw=;
 b=f4D9D1uBxpPnWMpsC1nrSzp/rcZLMY6vogYgkx7/pYNMe8b3tUWHHdgp5rXAqD/prNL9o3
 0oyADrspMYRwtfBQ==
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ryosuke Yasuoka <ryasuoka@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Wei Yang
 <richard.weiyang@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, John Ogness
 <john.ogness@linutronix.de>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Simona Vetter
 <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2 1/2] mm/kmap: Add kmap_local_page_try_from_panic()
In-Reply-To: <20250321112436.1739876-2-jfalempe@redhat.com>
References: <20250321112436.1739876-1-jfalempe@redhat.com>
 <20250321112436.1739876-2-jfalempe@redhat.com>
Date: Fri, 04 Apr 2025 09:33:35 +0200
Message-ID: <87mscwv0s0.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, Mar 21 2025 at 12:16, Jocelyn Falempe wrote:
> kmap_local_page() can be unsafe to call from a panic handler, if
> CONFIG_HIGHMEM is set, and the page is in the highmem zone.
> So add kmap_local_page_try_from_panic() to handle this case.

I think this is a reasonable solution and the highmem case can suffer
from not getting the reliable panic output.

> Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  include/linux/highmem-internal.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/include/linux/highmem-internal.h b/include/linux/highmem-internal.h
> index dd100e849f5e0..5d089b0ca56de 100644
> --- a/include/linux/highmem-internal.h
> +++ b/include/linux/highmem-internal.h
> @@ -73,6 +73,13 @@ static inline void *kmap_local_page(struct page *page)
>  	return __kmap_local_page_prot(page, kmap_prot);
>  }
>  
> +static inline void *kmap_local_page_try_from_panic(struct page *page)
> +{
> +	if (!PageHighMem(page))
> +		return page_address(page);
> +	return NULL;

A comment explaining the reason why the highmem mapping cannot work here
would be appreciated.

Aside of that:

      Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

Thanks,

        tglx
