Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30772483D1E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 08:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BFF89C63;
	Tue,  4 Jan 2022 07:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B3F89BF4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 07:43:09 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id t2so7629127ljo.6
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 23:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fgKwWZIfcsw72ZHfRdvesZsrrJZ1f8dTTxjt4J+BNV4=;
 b=X1ob57L7f7pUYK9slUoi/6n/KdzlJZAH8oS41+fUBZrebkN3Jnk2uaUo6PEJFCsaUx
 zcPjGMq4Kp7cO3mAF8RhPxz3hDyy64IWH4viwJceKGUJZlgsF9B3sEJDeAKfMKIZiboU
 6CpumNRlrBIBJG0KASIkN0/5UCUtgBpFO8+Xt16kpgHQM7cSI8PDNwSKBxGLM1FOz0qD
 Y3nhvzScK/BTQb1cIrUde5TyCbBSCRqkLXhZ6QbnNyOn49n+c1Ss1yAizUgMpLKYZYns
 +WIDARIMUXhTMkCfFwFme7n+TFF3gO93EtOBE6Sdcs3LU8YN7bpf5nct2QHtI71vKdrV
 aPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fgKwWZIfcsw72ZHfRdvesZsrrJZ1f8dTTxjt4J+BNV4=;
 b=ixuchj0kt1Cj6qKDnLEjYaFrIfinMrDv7xrxGmMKa83TJFngTCrgsCO1wcrnQHdGp4
 hSf6GXFOYga85XgQE/axkLvqWIbnnnnGBXKQmYKW1klcZC9b3PX8Hrii0hw7up+HZhVO
 Oo6Sse9JUc0cJ3ZN+GcgXC4nwbJyFKwjSCa17teh+yJqc/B36E7IJnoOAfiWPMlzTciK
 n6843fBq3SWTMhrdOSAq/MNEiGLw5lMGu/8soSbexYaHTZBSRt7Lk+T7IfST5oC3eyko
 dhawKOWp4DKMnomtzzTMsBBFjgvcmwLGAOO14cCsZfs6TGIqqNwxs4jw5LMiJJyrJUaJ
 1eTw==
X-Gm-Message-State: AOAM5321FwfIZd+OvWN2KZ1r7R2x/Ynsih5flh0wlRNLCT+XzlfmcQdi
 dpGGoBuXxCsO+3euZ47wZ405vkX76h0spMFkCsJ8aQ==
X-Google-Smtp-Source: ABdhPJzTcr2rRRGYiX1ocR9ztRnmH4dD/4uUxGjd34ka6S9DtNKHuHT8CJGQDqdSwIr3ls+LKbpZ96lYXoI18cN1eoE=
X-Received: by 2002:a2e:9901:: with SMTP id v1mr40463499lji.61.1641282187995; 
 Mon, 03 Jan 2022 23:43:07 -0800 (PST)
MIME-Version: 1.0
References: <20220104073545.124244-1-o451686892@gmail.com>
In-Reply-To: <20220104073545.124244-1-o451686892@gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 3 Jan 2022 23:42:56 -0800
Message-ID: <CALAqxLVSaZywOOnF=67X+gu9eo+ZmKQmW3wUOOKEM0rUZ4K5gg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: cma_heap: Fix mutex locking section
To: Weizhao Ouyang <o451686892@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>, linaro-mm-sig@lists.linaro.org,
 Laura Abbott <labbott@kernel.org>, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 3, 2022 at 11:36 PM Weizhao Ouyang <o451686892@gmail.com> wrote:
>
> Fix cma_heap_buffer mutex locking critical section to protect vmap_cnt
> and vaddr.
>
> Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma_heap implementation")
> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>

Looks good to me!  Thanks so much for sending this in!

Acked-by: John Stultz <john.stultz@linaro.org>

thanks again
-john
