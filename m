Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7BC2A7B49
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 11:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C7C6E1D5;
	Thu,  5 Nov 2020 10:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C8E6E188
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 10:08:11 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id o13so938988ljj.11
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 02:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eEue8Bau+pupF7CyTGHXC2yqWeY8Sj18qJXhmeK0+qY=;
 b=rvffOctSKYH+6isvUsZ6vjuDGiRiPXrriws2tYpmxIOJoDbVaUBBLJZNLsZfPTViCm
 OB7UJ7kJVc74V/wH1kAJWs50qUWe8BxYk+3Bh0Ntwrn4R80Kw+RHuzDoPIDkFuxVKOMP
 awvWPavfta6vj9AUR/6i26T0t+QGvBOviGEDNRn+gsaMK+rwApX3VuBwIy6OffxGwIGI
 Q9ElrJtiii5nM3Ug/hNAa7sMnYOfnIMkNbbQWWsd9e9E4LqYfoNACefZyIQWVQxYvven
 erCA3D+b6EoRTgIG3bxLlMg5PeozREFm5ydwy7sAu7xfjUKeSkZzmy6N/j40DftaLQPo
 OSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eEue8Bau+pupF7CyTGHXC2yqWeY8Sj18qJXhmeK0+qY=;
 b=kwH9G3cJzFyT/yqkCD2PfgeLazXHjLhQYMPeoNByRx0mVeLMm6WyOZ7ST+oPu2wwVP
 OLZq9giLmXk6TyZyXaK3zUSsoUNi6iaAOJmCVgkCRmhpqvJrZ/bwFKQ30lBSps8zkNb+
 x+0sXorpAHpSvfCEpZJSweIhv7VYWaZmPBFTZ5BwAWAUG0aHKn3xt+kD5Fqi5KsVDvMn
 /3dDvd7OGCERTIY9BBbht76yH6H30DspjV68EG/6TOiQp5s9VcPPKcfqC0zRtBiOLWy6
 N7bKAJHHXIm3HgMGXecXq4rNWIzJB9ImzocnutOsICZFfkMsmio+ZsDu/PkRyQAljcCW
 99qg==
X-Gm-Message-State: AOAM530qGa1T6363yK58ySjkefU/eOEwEnghDv1xl3PUPM+5b3D9XRzW
 lKIOfUhAQeb+hNbDSX9xuO5wZd42XSp1h4B8cJochg==
X-Google-Smtp-Source: ABdhPJzTsAT/B7g6yG/tiOPWkhIyiq+coc///CuocOp+hPojlZHj2TddLjwWNxDtJai798d/HI10cYYk95MMhchsZzo=
X-Received: by 2002:a05:651c:1205:: with SMTP id
 i5mr658065lja.283.1604570889728; 
 Thu, 05 Nov 2020 02:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20201020122046.31167-1-tzimmermann@suse.de>
 <20201020122046.31167-10-tzimmermann@suse.de>
In-Reply-To: <20201020122046.31167-10-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Nov 2020 11:07:59 +0100
Message-ID: <CACRpkdbvGWKo8y323actUJn9xXmxpgDw1EKLiPH4RqB_kFx=XQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/10] dma-buf-map: Add memcpy and pointer-increment
 interfaces
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: luben.tuikov@amd.com, Dave Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, melissa.srw@gmail.com,
 ray.huang@amd.com, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, lima@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, steven.price@arm.com,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Kukjin Kim <kgene@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux+etnaviv@armlinux.org.uk, spice-devel@lists.freedesktop.org,
 alyssa.rosenzweig@collabora.com, etnaviv@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org, Sean Paul <sean@poorly.run>,
 apaneers@amd.com, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Qinglang Miao <miaoqinglang@huawei.com>, yuq825@gmail.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Overall I like this, just an inline question:

On Tue, Oct 20, 2020 at 2:20 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:

> To do framebuffer updates, one needs memcpy from system memory and a
> pointer-increment function. Add both interfaces with documentation.

(...)
> +/**
> + * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
> + * @dst:       The dma-buf mapping structure
> + * @src:       The source buffer
> + * @len:       The number of byte in src
> + *
> + * Copies data into a dma-buf mapping. The source buffer is in system
> + * memory. Depending on the buffer's location, the helper picks the correct
> + * method of accessing the memory.
> + */
> +static inline void dma_buf_map_memcpy_to(struct dma_buf_map *dst, const void *src, size_t len)
> +{
> +       if (dst->is_iomem)
> +               memcpy_toio(dst->vaddr_iomem, src, len);
> +       else
> +               memcpy(dst->vaddr, src, len);
> +}

Are these going to be really big memcpy() operations?

Some platforms have DMA offload engines that can perform memcpy(),
drivers/dma, include/linux/dmaengine.h
especially if the CPU doesn't really need to touch the contents
and flush caches etc.
An example exist in some MTD drivers that move large quantities of
data off flash memory like this:
drivers/mtd/nand/raw/cadence-nand-controller.c

Notice that DMAengine and DMAbuf does not have much in common,
the names can be deceiving.

The value of this varies with the system architecture. It is not just
a question about performance but also about power and the CPU
being able to do other stuff in parallel for large transfers. So *when*
to use this facility to accelerate memcpy() is a delicate question.

What I'm after here is if these can be really big, do we want
(in the long run, not now) open up to the idea to slot in
hardware-accelerated memcpy() here?

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
