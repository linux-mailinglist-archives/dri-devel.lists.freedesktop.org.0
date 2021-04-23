Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF16D368B55
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 04:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8856E069;
	Fri, 23 Apr 2021 02:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA43E6E069
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 02:58:24 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id u11so18714282pjr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 19:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=40nhsz+kltJTf7tq6pLLkes92lT1dy5Rll207DlKzWM=;
 b=HdsQJQRkixDre+dpQSVR58nl8K7T4MbrI4XmlnSivkYb875qGKmhwngqhS/XX43exh
 bg5Ne9Oub0puKLH8FRaSSn/FCuQxwpgf1ynisAFuTF4Wvjhe+t5iF+WotV6g96hB8Oro
 fWaQA0hAXWZxawu4WTORJsnwcVbFEg+0cCZO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=40nhsz+kltJTf7tq6pLLkes92lT1dy5Rll207DlKzWM=;
 b=Huo9HyKkzBVMGE/3yXIncYsEZOJvTFzD13g6+ueB1EAY3U2HzBHwk7aiq6fcNM/ZPn
 TeNAonzxxpeHvlvHuoQ3m+7Ucm5A0HMpXeuw3enM3y7Hrl5RbGGpoXAq9hl9WZZzVv7I
 Jv+hPUTl0+zrrn9bVm3WZAk3sPaPgUxjqa6C9ZrCNM6gYmOfFtkQC4pdb+j4wDf3qQn9
 jBmwO6vUhHIJAnX+/tOLGhTkddiKSJUakl/PpIlG0+2R0BtQrBuZndsXZC0Wmby5bQLW
 e68QoZScpPfPTNCJi12dV1qh8pJTXtqcgCW0i+eKWxgAMjoaIYFQuq1fOCIqBaTKbfYs
 PHLg==
X-Gm-Message-State: AOAM532HNJKy/QhfhS+kw74CtpaBDvTHNECPD6wpfm50BkmdQiLTSQ1t
 OorqfMDZqhXfz7TzQgH3B7qLnF414ivJkg==
X-Google-Smtp-Source: ABdhPJyRAiIzWs8AuSBlqrmr3IratesYGzu6KLSm7gpjPIUTjrj4ruqkVp39AcU4CUrd8aM9M6F+Uw==
X-Received: by 2002:a17:90a:1b4b:: with SMTP id
 q69mr3226984pjq.188.1619146704024; 
 Thu, 22 Apr 2021 19:58:24 -0700 (PDT)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com.
 [209.85.210.171])
 by smtp.gmail.com with ESMTPSA id v8sm3059143pfu.205.2021.04.22.19.58.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 19:58:23 -0700 (PDT)
Received: by mail-pf1-f171.google.com with SMTP id q2so1172854pfk.9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 19:58:23 -0700 (PDT)
X-Received: by 2002:a6b:c913:: with SMTP id z19mr1627785iof.50.1619146389385; 
 Thu, 22 Apr 2021 19:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210422081508.3942748-1-tientzu@chromium.org>
 <20210422081508.3942748-17-tientzu@chromium.org>
In-Reply-To: <20210422081508.3942748-17-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 23 Apr 2021 10:52:58 +0800
X-Gmail-Original-Message-ID: <CALiNf29NzRTRB-0JbCL7=0qF0SAiER_pJ_-SCtVRA7DHCsSpEg@mail.gmail.com>
Message-ID: <CALiNf29NzRTRB-0JbCL7=0qF0SAiER_pJ_-SCtVRA7DHCsSpEg@mail.gmail.com>
Subject: Re: [PATCH v5 16/16] of: Add plumbing for restricted DMA pool
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
 boris.ostrovsky@oracle.com, jgross@suse.com, Christoph Hellwig <hch@lst.de>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, jxgao@google.com, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 airlied@linux.ie, Robin Murphy <robin.murphy@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 bhelgaas@google.com, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 nouveau@lists.freedesktop.org, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 22, 2021 at 4:17 PM Claire Chang <tientzu@chromium.org> wrote:
>
> If a device is not behind an IOMMU, we look up the device node and set
> up the restricted DMA when the restricted-dma-pool is presented.
>
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>  drivers/of/address.c    | 25 +++++++++++++++++++++++++
>  drivers/of/device.c     |  3 +++
>  drivers/of/of_private.h |  5 +++++
>  3 files changed, 33 insertions(+)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 54f221dde267..fff3adfe4986 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -8,6 +8,7 @@
>  #include <linux/logic_pio.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/pci.h>
>  #include <linux/pci_regs.h>
>  #include <linux/sizes.h>
> @@ -1109,6 +1110,30 @@ bool of_dma_is_coherent(struct device_node *np)
>  }
>  EXPORT_SYMBOL_GPL(of_dma_is_coherent);
>
> +int of_dma_set_restricted_buffer(struct device *dev)
> +{
> +       struct device_node *node;
> +       int count, i;
> +
> +       if (!dev->of_node)
> +               return 0;
> +
> +       count = of_property_count_elems_of_size(dev->of_node, "memory-region",
> +                                               sizeof(phandle));
> +       for (i = 0; i < count; i++) {
> +               node = of_parse_phandle(dev->of_node, "memory-region", i);
> +               /* There might be multiple memory regions, but only one
> +                * restriced-dma-pool region is allowed.
> +                */
> +               if (of_device_is_compatible(node, "restricted-dma-pool") &&
> +                   of_device_is_available(node))
> +                       return of_reserved_mem_device_init_by_idx(
> +                               dev, dev->of_node, i);
> +       }
> +
> +       return 0;
> +}
> +
>  /**
>   * of_mmio_is_nonposted - Check if device uses non-posted MMIO
>   * @np:        device node
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index c5a9473a5fb1..d8d865223e51 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -165,6 +165,9 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
>
>         arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
>
> +       if (!iommu)
> +               return of_dma_set_restricted_buffer(dev);
> +
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(of_dma_configure_id);
> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> index d717efbd637d..e9237f5eff48 100644
> --- a/drivers/of/of_private.h
> +++ b/drivers/of/of_private.h
> @@ -163,12 +163,17 @@ struct bus_dma_region;
>  #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
>  int of_dma_get_range(struct device_node *np,
>                 const struct bus_dma_region **map);
> +int of_dma_set_restricted_buffer(struct device *dev);
>  #else
>  static inline int of_dma_get_range(struct device_node *np,
>                 const struct bus_dma_region **map)
>  {
>         return -ENODEV;
>  }
> +static inline int of_dma_get_restricted_buffer(struct device *dev)

This one should be of_dma_set_restricted_buffer. Sorry for the typo.

> +{
> +       return -ENODEV;
> +}
>  #endif
>
>  #endif /* _LINUX_OF_PRIVATE_H */
> --
> 2.31.1.368.gbe11c130af-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
