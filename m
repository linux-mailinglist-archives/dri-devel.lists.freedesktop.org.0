Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 108ABAEE757
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 21:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B3610E4B8;
	Mon, 30 Jun 2025 19:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BXi8vv8r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F8D10E4B8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 19:17:31 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-747ef5996edso2258729b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 12:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751311051; x=1751915851; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Um5P65+nf9UZ6CcWggyKqfAjkPQHQmkomV6ie3f7noc=;
 b=BXi8vv8rLsecwMBOOo+M0pv3WQSU7PPsaMiVvUWTLcq10zVxCEpIWl3oC8Mo82MgkD
 IRx8tpSsRTjU9DtlwtKCYixBvdR+uCD6BMs0YR7iUp5kD8d69vrfULcbWzT3Bjeg+CeZ
 PsqxqItu0iUkOsBTgzpDTuNH1IwEUsH63Bxle51stxClOib2yrr3yLWKEFAa0doX1Mvi
 GIRMi+eZhzN8bB0RuQi1ygov35hNy2b4tYHFwX+4xCOhuylK8zx0Sei1S7LCunC78KZi
 nkY1YV7Q6JdXpZ2fSfSyWTb/nBOoIY9Xj/ON1fjIG6JeND9hksf9RvQfOI0hJ1Jl5Lk9
 3Lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751311051; x=1751915851;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Um5P65+nf9UZ6CcWggyKqfAjkPQHQmkomV6ie3f7noc=;
 b=uPWWb9tKtfsvgfLEaqq+Uuh1mUpJRsO+Od9zkrjvXmxU6V5HFaGs89HzcOwXfx4ASp
 KOgJS5o54zLzpcwNhUMx7RQYcXnHwrgy/n5khZopBRZErhgO7SnWoGjJC8oriQ4+qNFp
 bOn2iTpCOhvNXLFgpj1tlG8iQsDyYWrtoPrHcA2VKiGAHMj8DfFsCdMg3H73RrudHNR6
 eaEG9Zgs9w7lkPXwhKGqL+GPrD4tUBsEs7jRlsKIMwx92GpUPzO5vyteX3Pfsc8IapaH
 ZzA8GhovseqCoX9a340FoikHofnS/7bGVqeTr/4Xa/coxXbx4LAHUOTFCg7fQfF9t+C4
 io5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUBTItccHI+FZT4//w7JBdU9zreh5QA/YGJuD3y29SkgLZCoyRmputKbfapNFE6EYxt8Q07Jo4wm0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEck0WRvd/8OCqg99BPf/PX7x4ieUbtNE7od6ZyNsyzxqhLHhA
 jDINHNkhEuHdcacnhHA8l0j+v71u35pWfzGLVEa3yKo20vttz/pSR6iu
X-Gm-Gg: ASbGnctRYAWI8ODp9r/eSQp1bAhlT2ywCaCpUljygk0DWAdGxVJG/ipkQnmFuJYBYUd
 Ev6FeQGGFA1WlA8EFioKTWQ9+ES8NqQMlm5kn9CHkRHTlJ3PJF38lNvDQITKtLEDf7SEzkx7UqR
 K4lDKb3kU/tVKNWR1m34RqVRjc36MX3vop7wNexnRUF9cMl5oZd5JUFiPAjqjjT4WXeoW9b8OLD
 GVS23/MwoL1Z2fo6tCj/HJ4ru2FJ2xXR+9m4aKSBZsPxrN/pFpSuDDUxPFwk+DZqsHQlpB+vLLu
 ChrGT+KqJtU3tMKvUdYULqbCZuVxEX1t2qLeLbYJFUOmjgGbMgWjhjU=
X-Google-Smtp-Source: AGHT+IH7tDIInMf2NZlvN/kfsFCNXiU4Z8uqHFH4ypgMKE0Hx9X2SxMn1hWbWYecPU0Ne2UXg2PsXQ==
X-Received: by 2002:a05:6a00:2288:b0:746:3025:6576 with SMTP id
 d2e1a72fcca58-74af6f222dfmr19186926b3a.14.1751311051009; 
 Mon, 30 Jun 2025 12:17:31 -0700 (PDT)
Received: from essd ([49.37.221.186]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af57ef0f3sm9986457b3a.154.2025.06.30.12.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 12:17:30 -0700 (PDT)
Date: Tue, 1 Jul 2025 00:47:22 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: andy@kernel.org, dan.carpenter@linaro.org, lorenzo.stoakes@oracle.com, 
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, 
 thomas.petazzoni@free-electrons.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v3 2/2] staging: fbtft: cleanup error handling in
 fbtft_framebuffer_alloc()
Message-ID: <ezkfonpaubsmw6gr4tutgnjmbhvsuwkhaiya7xozl2szfqi4f3@zmde3sfybyzi>
References: <cover.1751207100.git.abdun.nihaal@gmail.com>
 <4e062d040806dc29d6124ac0309e741c63f13ac0.1751207100.git.abdun.nihaal@gmail.com>
 <2025063022-chump-pointless-6580@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025063022-chump-pointless-6580@gregkh>
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

Hello Greg,

On Mon, Jun 30, 2025 at 07:16:38PM +0200, Greg KH wrote:
> This patch does not apply to my tree, can you rebase and resend?

I think you have added both the V1 patch and this current V3 patchset to
your tree, that's why this patch does not apply.

Commit eb2cb7dab60f ("staging: fbtft: fix potential memory leak in fbtft_framebuffer_alloc()") 
on staging-testing is an older version of this patchset, and so it has to be dropped.

Regards,
Nihaal
