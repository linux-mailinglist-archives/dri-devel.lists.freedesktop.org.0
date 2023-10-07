Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA557BC75B
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 14:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EBD10E03A;
	Sat,  7 Oct 2023 12:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3006::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8889310E03A
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Oct 2023 12:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202212;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gH4u45ASov7lD+Mbhn+82JdR0Lp57tbpyBeuKAvovWg=; b=iwJmYPsoN5e1ySGOoQo5Qon7HZ
 SoKVxRl90B8796jRC7j71zKAGbunw5/pF4aovAq9qz99jQuezDk6RPfiZn+K9K8QHInJGeM6Pfykh
 nFX9axm8up1KKiskNXcpoY7u/OwJET84z3yfOyhRxfR7MkQsGZOHB7pxE29+djdbCo+uQ4wDEntln
 X8PhPBPQXcfKIl1Z48sp46FxVZmwSICwV11+nYGUSWzwywAwjkXQlbVG5o6wsRm6szR4fTH0cxYwd
 bnn+GyJLrIoziq67OQaWDABnXlMXhY10T6A+GPZE1JU3Nu+FZn5omEdY1agSwiLW5ILgAQbzANZxV
 bORFyd1w==;
Received: from [2a01:799:95f:2800:2fb5:c6db:11b1:a10f] (port=47990)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1qp5zk-002uUV-5W;
 Sat, 07 Oct 2023 14:01:20 +0200
Message-ID: <47a54b65-168f-4188-ad5c-79ba55d7a768@tronnes.org>
Date: Sat, 7 Oct 2023 14:01:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] drm: Reuse temporary memory for format conversion
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 jfalempe@redhat.com, jose.exposito89@gmail.com, arthurgrillo@riseup.net,
 mairacanal@riseup.net, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
References: <20231005090520.16511-1-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <20231005090520.16511-1-tzimmermann@suse.de>
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
Cc: noralf@tronnes.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/5/23 11:04, Thomas Zimmermann wrote:
> DRM's format-conversion helpers require temporary memory. Pass the
> buffer from the caller and keep it allocated over several calls. Allow
> the caller to preallocate the buffer memory.
> 
> The motivation for this patchset is the recent work on a DRM panic
> handler. [1] The panic handler requires format conversion to display an
> error to the screen. But allocating memory during kernel panics is
> fragile. The changes in this patchset enable the DRM panic handler to
> preallocate buffer storage before the panic occurs.
> 

I've been thinking about this and afaiu this requires the display hw to
switch to the new panic buffer for scanout, right?
I don't think that is possible for any complex hw to do in a panic
situation. Or are you thinking that the driver should somehow "memcpy"
this buffer to the actual scanout buffer?

Noralf.

> As an additonal benefit, drivers can now keep the temporary storage
> across multiple updates. Avoiding memory allocation slightly reduces
> the CPU overhead of the format helpers.
> 
> Patch 1 adds struct drm_format_conv_state, a simple interface to pass
> around the buffer storage. Patch 2 adds an instance of the struct to
> the shadow-plane state. Patch 3 moves the buffer's memory management
> from the format helpers into their callers within the DRM drivers. Most
> of the afected drivers use the state instance stored in their shadow-
> plane state. The shadow-plane code releases the buffer memory automatically.
> 
> Patches 4 to 7 update three drivers to preallocate the format-conversion
> buffer in their plane's atomic_check function. The driver thus detects OOM
> errors before the display update begins.
> 
> Tested with simpledrm.
> 
> v4:
> 	* rename struct to drm_format_conv_state (Javier)
> 	* replace ARRAY_SIZE() with sizeof() (Jani)
> 	* store buffer in shadow-plane state (Javier, Maxime)
> 	* prealloc in atomic_check in several drivers
> v3:
> 	* no changes
> v2:
> 	* reserve storage during probing in the drivers
> 
> [1] https://patchwork.freedesktop.org/series/122244/
> 
> Thomas Zimmermann (7):
>   drm/format-helper: Cache buffers with struct drm_format_conv_state
>   drm/atomic-helper: Add format-conversion state to shadow-plane state
>   drm/format-helper: Pass format-conversion state to helpers
>   drm/ofdrm: Preallocate format-conversion buffer in atomic_check
>   drm/simpledrm: Preallocate format-conversion buffer in atomic_check
>   drm/ssd130x: Fix atomic_check for disabled planes
>   drm/ssd130x: Preallocate format-conversion buffer in atomic_check
> 
>  drivers/gpu/drm/drm_format_helper.c           | 212 +++++++++++++-----
>  drivers/gpu/drm/drm_gem_atomic_helper.c       |   9 +
>  drivers/gpu/drm/drm_mipi_dbi.c                |  19 +-
>  drivers/gpu/drm/gud/gud_pipe.c                |  30 ++-
>  drivers/gpu/drm/solomon/ssd130x.c             |  36 ++-
>  .../gpu/drm/tests/drm_format_helper_test.c    |  72 +++---
>  drivers/gpu/drm/tiny/cirrus.c                 |   3 +-
>  drivers/gpu/drm/tiny/ili9225.c                |  10 +-
>  drivers/gpu/drm/tiny/ofdrm.c                  |  16 +-
>  drivers/gpu/drm/tiny/repaper.c                |   8 +-
>  drivers/gpu/drm/tiny/simpledrm.c              |  43 +++-
>  drivers/gpu/drm/tiny/st7586.c                 |  19 +-
>  include/drm/drm_format_helper.h               |  81 +++++--
>  include/drm/drm_gem_atomic_helper.h           |  10 +
>  include/drm/drm_mipi_dbi.h                    |   4 +-
>  15 files changed, 428 insertions(+), 144 deletions(-)
> 
> 
> base-commit: 57d3b83a83c5527325efb5bcaf594da09fe4a41b
