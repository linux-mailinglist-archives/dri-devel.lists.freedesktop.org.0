Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7B729C88D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 20:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25976EC1D;
	Tue, 27 Oct 2020 19:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB396EC1B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:19:34 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id i1so3213427wro.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=94FVc/lhmQBJbpQ0I0StwCkg4DMhTbsduFiN4bjClk4=;
 b=Sld6hciHThDqeso8S8+jXbwutFt+C8GMsFv9uR38kkL9A2ymfTua46NMT/Q9ZBn3uh
 noluYBIeHRwknPmU94BZzwh6l7DE4uJbJLLOru2dF0iDS5wDVUIl89TAYeWKJJDtgD9J
 qGm+daZidj774s7wADWav2trLrU+zVLJfeX5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=94FVc/lhmQBJbpQ0I0StwCkg4DMhTbsduFiN4bjClk4=;
 b=lsTh4a9oV+JaY6mfFMoDSxsDHAiic9l7WOR0yf1M4JO8KtDX7q0C4dDFIFj1pIGezz
 0cLF/e7MZmJcHczOB3kL6bhZVvG/AL8AASfF9H29NXuEnZ4hZX3Tm+AxuzPyFw3VWPvu
 ggvbiKo+WJ6FjGaJ3xK9fvCQX9JqqBTbRcIet/fAtSvgQYYuX0ebibGPcB559vbkv9uu
 3pKyTff9SVfSsccgTBD4YqVeNAu+vLGHN6DYeoeVupUCTMKoZrgSpChQbTZ/4jXJV+yE
 k+ZqHuMxsZgjERztI1x1vIKUCfi4X5rNeDtDNrS/8a29actzLSTa7BvIm26erMnGww2G
 AIwQ==
X-Gm-Message-State: AOAM531EYvbMQ8YIA8CMVdb4xXPOwI2W/DUrikfjzVq0zSacO8dHJXgy
 VawSrQwF4hFQcwOJfyRdE0z4Ig==
X-Google-Smtp-Source: ABdhPJxSeCImtuoOwiJ2SgVqpZLT/QAEeRHxQ9b1eMNAwd7xtGe8jna3O2uLNWNIxJE6aH3a1ktGnQ==
X-Received: by 2002:a5d:4dc7:: with SMTP id f7mr4027819wru.375.1603826373382; 
 Tue, 27 Oct 2020 12:19:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h206sm3012251wmf.47.2020.10.27.12.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 12:19:32 -0700 (PDT)
Date: Tue, 27 Oct 2020 20:19:30 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 6/8] drm: atomic: use krealloc_array()
Message-ID: <20201027191930.GQ401619@phenom.ffwll.local>
Mail-Followup-To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Christoph Lameter <cl@linux.com>,
 Pekka Enberg <penberg@kernel.org>,
 David Rientjes <rientjes@google.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-gpio@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 netdev@vger.kernel.org, linux-mm@kvack.org,
 alsa-devel@alsa-project.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20201027121725.24660-1-brgl@bgdev.pl>
 <20201027121725.24660-7-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027121725.24660-7-brgl@bgdev.pl>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Gustavo Padovan <gustavo@padovan.org>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, linux-mm@kvack.org,
 Christoph Lameter <cl@linux.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 David Rientjes <rientjes@google.com>,
 virtualization@lists.linux-foundation.org, Jason Wang <jasowang@redhat.com>,
 linux-media@vger.kernel.org, Robert Richter <rric@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linaro-mm-sig@lists.linaro.org,
 linux-gpio@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, netdev@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>, James Morse <james.morse@arm.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 01:17:23PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Use the helper that checks for overflows internally instead of manually
> calculating the size of the new array.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I don't expect conflicts with this going through some other tree, so
please make that happen. Or resend once I can apply this to drm trees.

Thanks, Daniel

> ---
>  drivers/gpu/drm/drm_atomic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 58527f151984..09ad6a2ec17b 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -960,7 +960,8 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
>  		struct __drm_connnectors_state *c;
>  		int alloc = max(index + 1, config->num_connector);
>  
> -		c = krealloc(state->connectors, alloc * sizeof(*state->connectors), GFP_KERNEL);
> +		c = krealloc_array(state->connectors, alloc,
> +				   sizeof(*state->connectors), GFP_KERNEL);
>  		if (!c)
>  			return ERR_PTR(-ENOMEM);
>  
> -- 
> 2.29.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
