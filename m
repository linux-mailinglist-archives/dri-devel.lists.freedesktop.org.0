Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B052A790A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C22B6EA1A;
	Thu,  5 Nov 2020 08:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6186E160
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 07:00:57 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id w65so688885pfd.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 23:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=In22z4zSRFjmN0f9ZWT4tSWe/e4QLia1xEowLwJnVsw=;
 b=MXqPgs8+6JTdO/hUoDQw5oReQIcGnaaVfUbxHiTj/WNMBS0cf3z4ohV+gF45hY58w/
 aoFliyd9R/tnYceFsDd1i5ZqyVInBUwnOTkO0iGVPUyoNe059GQEoAK6RMQUzn3dMo1l
 n9M7VKH4+IyCkaIL+7QBE2LQmvswOpQQnMjujNrQlvxsPx87Z28CxZPz+egzh8LAELS1
 S+F/AqaP302QLGtQjTyL4M7IxF1We073NibdHPAzDHgpmmJILhf1mJaq6BnvAlrSjSh2
 LzOl1rH84hlkjcyzBvUXH9e57VW746Fzr1Vd5+qP9c9nk8Gtt7KQOSjZhfNjGgPBap4m
 fuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=In22z4zSRFjmN0f9ZWT4tSWe/e4QLia1xEowLwJnVsw=;
 b=HOs15DjeIaIrWiJIGfI39c9Z1brPX1++z6B8n0e7x7ii7C0KKxFLdD2eo8XD5d1T9I
 xvzC+N5fzfpCjMDR84865KcWgrIDIzW7Kyzg13YAgaKmj65avn3tIKS4KalTLZ81qIZF
 Bj+bngTwNhFvLwWCeHjNhNMF3cUY5BzjEO5QcxuGpNPbSNWmmVC6W7imBZjcRQ5BccRk
 +27ttFpxiRTGhKIpMFkgIl0SOsaA9OX68x6fvH9EdMDpkCWpFrKMUQVWCagsw/axs++N
 5SCi5WvUx5YoC/yH1NzQGFyWRX17ZbjFhfDTCRKGoLyWcOIdPIOOiDCfU8PZgRiaUPhB
 JCzQ==
X-Gm-Message-State: AOAM5328y1raxArwAyWRi1d7YIRLPzg9u8jrdPRBhndCfqfy45i+z5kK
 8YzG2SayPsCib6sThhfTw5g=
X-Google-Smtp-Source: ABdhPJxccwbMNiHKtX8PlDU2gsnrWVHgRU2ASpOcGh5rnfj0CZusDbR0R9TyZJHcK06SvgZWWBZTOw==
X-Received: by 2002:a65:4b84:: with SMTP id t4mr1159089pgq.138.1604559657437; 
 Wed, 04 Nov 2020 23:00:57 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:a6ae:11ff:fe11:4b46])
 by smtp.gmail.com with ESMTPSA id c11sm814474pjn.26.2020.11.04.23.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 23:00:56 -0800 (PST)
Date: Thu, 5 Nov 2020 16:00:54 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/virtio: use kvmalloc for large allocations
Message-ID: <20201105070054.GD128655@google.com>
References: <20201105014744.1662226-1-senozhatsky@chromium.org>
 <20201105065233.3td3zuyfmbypjtvq@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105065233.3td3zuyfmbypjtvq@sirius.home.kraxel.org>
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Suleiman Souhlal <suleiman@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On (20/11/05 07:52), Gerd Hoffmann wrote:
> > -	*ents = kmalloc_array(*nents, sizeof(struct virtio_gpu_mem_entry),
> > -			      GFP_KERNEL);
> > +	*ents = kvmalloc_array(*nents,
> > +			       sizeof(struct virtio_gpu_mem_entry),
> > +			       GFP_KERNEL);
> 
> Shouldn't that be balanced with a kvfree() elsewhere?

I think it already is. ents pointer is assigned to vbuf->data_buf,
and free_vbuf() already uses kvfree(vbuf->data_buf) to free it.

	-ss
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
