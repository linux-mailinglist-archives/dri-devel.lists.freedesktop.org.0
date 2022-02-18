Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C4E4BB50F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 10:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86EFB10E145;
	Fri, 18 Feb 2022 09:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6C410E145
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 09:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645175363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sfUvFXiSU5P3OmBH8sxlrxxdpF+uShF0CD9hT9uvq4w=;
 b=Rg9QGncCnSVV/CnK0j0Y0qr0Wn13EwmhvX0qv0hyA/wcpUragjXvxtsKDn8RafHMnRseez
 /cClN1e2VwNJDL0Ov23+lgK+DgCEtaq7rx2PnT4aZuui2oFo2btcJ2TSBIqIuNEpnhMTHt
 GLiyX+nM0cvtgIU51nWdZfIOf6BAOR0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-axLLJVC8N3efK0P7XijFig-1; Fri, 18 Feb 2022 04:09:21 -0500
X-MC-Unique: axLLJVC8N3efK0P7XijFig-1
Received: by mail-wr1-f70.google.com with SMTP id
 s5-20020adfbc05000000b001e7af4f2231so3306934wrg.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 01:09:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sfUvFXiSU5P3OmBH8sxlrxxdpF+uShF0CD9hT9uvq4w=;
 b=Dgv+Q9LZYH7CnhE7ycj8mytF5B6oHvtPN+uV2dBUxhOSASb7UkeXzOTZLWxocjrh4D
 tjuFx2iWa6NSIB+X+lZjprFG0+4RsSVrSQcoZUEu9pyXndr3KJEL3tmNrKLivkphdwSk
 DYRSXhRrTIqBVcXwr3aVhpVFpNXglzH2190mAZuWn57Hj8dz41kZFZlnNremoKIsf+Eq
 qOgD5c1OdPFqEpI1LpqoTkUxzroON4qP75KouhTmOke2fPRNBF5bVmHXPIzfJBMI7hFb
 M0GMJnwROnn0HVREaVcTqx0W14o2mzVr+sL2yz/FiFRnpG6wVJbEbEpyjGGvPAoHemHO
 DK9Q==
X-Gm-Message-State: AOAM532grr9vanpgRH/Mlc6bHUufF7j6xN8YzZG3qs1A7XpCU4zlD9rX
 ZEmJNzQRqBcdQC1GGjn4zPGin39xOsIociJ4jbWqezlsdHV3PhyuTXb6dbNvDbyz6xrBkXjDKm8
 95Ia/225qewwEyxTkBxZsDsRYskvV
X-Received: by 2002:adf:82cb:0:b0:1e3:f20:fd0d with SMTP id
 69-20020adf82cb000000b001e30f20fd0dmr5123089wrc.458.1645175360417; 
 Fri, 18 Feb 2022 01:09:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDhTUNdcKxIs3VZA8gHsdneOJBFqccL9dojSFci0NSVvT7WcRQOnowaL0DRCJpfceq4VKGwA==
X-Received: by 2002:adf:82cb:0:b0:1e3:f20:fd0d with SMTP id
 69-20020adf82cb000000b001e30f20fd0dmr5123066wrc.458.1645175360161; 
 Fri, 18 Feb 2022 01:09:20 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id a12sm25231149wru.99.2022.02.18.01.09.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 01:09:19 -0800 (PST)
Message-ID: <ceca85df-7a28-66a6-7c38-b2aa481d67df@redhat.com>
Date: Fri, 18 Feb 2022 10:09:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] fbdev: Improve performance of sys_fillrect()
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch, deller@gmx.de,
 geert@linux-m68k.org
References: <20220217103405.26492-1-tzimmermann@suse.de>
 <20220217103405.26492-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220217103405.26492-2-tzimmermann@suse.de>
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

Hello Thomas,

On 2/17/22 11:34, Thomas Zimmermann wrote:
> Improve the performance of sys_fillrect() by using word-aligned
> 32/64-bit mov instructions. While the code tried to implement this,
> the compiler failed to create fast instructions. The resulting
> binary instructions were even slower than cfb_fillrect(), which
> uses the same algorithm, but operates on I/O memory.
> 
> A microbenchmark measures the average number of CPU cycles
> for sys_fillrect() after a stabilizing period of a few minutes
> (i7-4790, FullHD, simpledrm, kernel with debugging). The value
> for CFB is given as a reference.
> 
>   sys_fillrect(), new:  26586 cycles
>   sys_fillrect(), old: 166603 cycles
>   cfb_fillrect():       41012 cycles
> 
> In the optimized case, sys_fillrect() is now ~6x faster than before
> and ~1.5x faster than the CFB implementation.
>

Wow, that's a big speedup!

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/fbdev/core/sysfillrect.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/sysfillrect.c b/drivers/video/fbdev/core/sysfillrect.c
> index 33ee3d34f9d2..bcdcaeae6538 100644
> --- a/drivers/video/fbdev/core/sysfillrect.c
> +++ b/drivers/video/fbdev/core/sysfillrect.c
> @@ -50,19 +50,9 @@ bitfill_aligned(struct fb_info *p, unsigned long *dst, int dst_idx,
>  
>  		/* Main chunk */
>  		n /= bits;
> -		while (n >= 8) {
> -			*dst++ = pat;
> -			*dst++ = pat;
> -			*dst++ = pat;
> -			*dst++ = pat;
> -			*dst++ = pat;
> -			*dst++ = pat;
> -			*dst++ = pat;
> -			*dst++ = pat;
> -			n -= 8;
> -		}
> -		while (n--)
> -			*dst++ = pat;
> +		memset_l(dst, pat, n);
> +		dst += n;
> +

Also the code is much more simpler / easy to read now. Amazing patch.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

