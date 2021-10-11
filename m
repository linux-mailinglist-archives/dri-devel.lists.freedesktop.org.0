Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26353428840
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 10:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF416E43A;
	Mon, 11 Oct 2021 08:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C846E43A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 08:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=HAflW4KQk0bu+4SEMHCmi4rt11kaHtOps5jWRc2K9d0=; b=y/cJ/m66m2Z0Fi7mA5i/bk6Ccj
 KkOyYsMKju0FVYAXcJg+QwvJ8iRhdo9yLX3/FLBg2lUVV/OBsSXho/uvUlZTiK8vYguNQJRFcoo/e
 EhEZh8xwUcMGOt8H13Fo6TlCK9OXlTFpLJamZRYX3NVJ5fwgMfk/DdU5tjd8EoycqCcCVgGp6+b6N
 2J8cJvP3fpyEusPHIvrTSB+gIbHXmBIyyqIXQNkloVsQokBg6yXxvj/wxVbw0YNSpOqLXqpP2Dg20
 TtlVt9k+kp9Un4gfqXDtrGfySKYJgp1ZS7mUdMvkxq4pjm0p6WqtcmXo6iSK2VsDzafV7m0RQ+vHS
 FWDV+Ncw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZqGH-008D8Y-Jn; Mon, 11 Oct 2021 08:02:17 +0000
Subject: Re: [PATCH v2] drm/r128: fix build for UML
To: linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Jeff Dike <jdike@addtoit.com>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 linux-um@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>
References: <20211011080006.31081-1-rdunlap@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <95f6d5b9-1aa8-9093-4356-df3f79c41faf@infradead.org>
Date: Mon, 11 Oct 2021 01:02:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011080006.31081-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 10/11/21 1:00 AM, Randy Dunlap wrote:
> Fix a build error on CONFIG_UML, which does not support (provide)
> wbinvd(). UML can use the generic mb() instead.
> 
> ../drivers/gpu/drm/r128/ati_pcigart.c: In function ‘drm_ati_pcigart_init’:
> ../drivers/gpu/drm/r128/ati_pcigart.c:218:2: error: implicit declaration of function ‘wbinvd’ [-Werror=implicit-function-declaration]
>    wbinvd();
>    ^~~~~~
> 
> Fixes: 68f5d3f3b654 ("um: add PCI over virtio emulation driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Jeff Dike <jdike@addtoit.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: linux-um@lists.infradead.org
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
> v2: update Fixes: tag (Johannes)
>      Use simple CONFIG_X86 instead of a more complicated expression. (Sam)
> 

Oops, apparently I can't count and this is v3... :(

>   drivers/gpu/drm/r128/ati_pcigart.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20211007.orig/drivers/gpu/drm/r128/ati_pcigart.c
> +++ linux-next-20211007/drivers/gpu/drm/r128/ati_pcigart.c
> @@ -215,7 +215,7 @@ int drm_ati_pcigart_init(struct drm_devi
>   	}
>   	ret = 0;
>   
> -#if defined(__i386__) || defined(__x86_64__)
> +#ifdef CONFIG_X86
>   	wbinvd();
>   #else
>   	mb();
> 


-- 
~Randy
