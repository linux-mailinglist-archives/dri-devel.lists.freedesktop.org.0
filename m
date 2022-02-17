Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1EE4B9E43
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 12:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F0710E248;
	Thu, 17 Feb 2022 11:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9FB10E248
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645095932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6YSZbwBi3c0InCkDrYByE4b4NApn0BejRZUJ5ijAPEA=;
 b=hdPTmift3fKLoVG/YV2MSnHLspV1BBUKmCeQPhdbbgvmZDoNLnpJtATVDg9OpaOkiIm2OZ
 31V13IUEYlUsnCdPwvaoCCWg/VbGf5P7JgoWHxyleQCSPHS9+JwV6ukoFSwDXnufKSEK/8
 oFtEKeJzEoQw3u30eXFd6PBLWpL4CFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-tz6_fUFfOR60RApTJwRpVQ-1; Thu, 17 Feb 2022 06:05:29 -0500
X-MC-Unique: tz6_fUFfOR60RApTJwRpVQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9B3381424B;
 Thu, 17 Feb 2022 11:05:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC03256A8A;
 Thu, 17 Feb 2022 11:05:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 267F618000AA; Thu, 17 Feb 2022 12:05:19 +0100 (CET)
Date: Thu, 17 Feb 2022 12:05:19 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] fbdev: Improve performance of sys_imageblit()
Message-ID: <20220217110519.ql5baa46sbsfb5cy@sirius.home.kraxel.org>
References: <20220217103405.26492-1-tzimmermann@suse.de>
 <20220217103405.26492-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217103405.26492-3-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, geert@linux-m68k.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -		for (j = k; j--; ) {
> -			shift -= ppw;
> -			end_mask = tab[(*src >> shift) & bit_mask];
> -			*dst++ = (end_mask & eorx) ^ bgx;
> -			if (!shift) {
> -				shift = 8;
> -				src++;
> +		for (j = k; j; j -= jdecr, ++src) {
> +			switch (ppw) {
> +			case 4: /* 8 bpp */
> +				*dst++ = colortab[(*src >> 4) & bit_mask];
> +				*dst++ = colortab[(*src >> 0) & bit_mask];
> +				break;
> +			case 2: /* 16 bpp */
> +				*dst++ = colortab[(*src >> 6) & bit_mask];
> +				*dst++ = colortab[(*src >> 4) & bit_mask];
> +				*dst++ = colortab[(*src >> 2) & bit_mask];
> +				*dst++ = colortab[(*src >> 0) & bit_mask];
> +				break;
> +			case 1: /* 32 bpp */
> +				*dst++ = colortab[(*src >> 7) & bit_mask];
> +				*dst++ = colortab[(*src >> 6) & bit_mask];
> +				*dst++ = colortab[(*src >> 5) & bit_mask];
> +				*dst++ = colortab[(*src >> 4) & bit_mask];
> +				*dst++ = colortab[(*src >> 3) & bit_mask];
> +				*dst++ = colortab[(*src >> 2) & bit_mask];
> +				*dst++ = colortab[(*src >> 1) & bit_mask];
> +				*dst++ = colortab[(*src >> 0) & bit_mask];
> +				break;
>  			}

How about moving the switch out of the loop, i.e.

switch (ppw) {
case 4:
    for (j = ...) {
        *dst++ = colortab[(*src >> 4) & bit_mask];
        *dst++ = colortab[(*src >> 0) & bit_mask];
    }
[ ... ]
}

?

take care,
  Gerd

