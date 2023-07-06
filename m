Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848A7749E70
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 16:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B643E10E403;
	Thu,  6 Jul 2023 14:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE9E10E403
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 14:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688652145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0GE7k8I9982HVE9TTWbDiwrZOKfvdOMPK3S9DyegjXE=;
 b=CpbtB4+gwIGB1fUzkCd2UaWdhpkrtKRmrAUboqXPxRhT8GCH/4P5ao1+wb+ttIZqlsd8aB
 y6JZ9ILVqgFPEK5RTBRDeGDmeHoBt4y7g87tAhuPUClI+9u4mL81exRCKuIetRp2RNFWeK
 rkLm2+R2cIRZL55D3lwGTfmUwHRkKq0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-TTmN27ewNielD9XA5RHhTw-1; Thu, 06 Jul 2023 10:02:23 -0400
X-MC-Unique: TTmN27ewNielD9XA5RHhTw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-314394a798dso423162f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 07:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688652141; x=1691244141;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0GE7k8I9982HVE9TTWbDiwrZOKfvdOMPK3S9DyegjXE=;
 b=JZ1PJGftcDXKFmwG5Bzcbu9zYCl0yOvaQefI6RTrwFoMtPv/2LJbfBDRiTx/q96Ajb
 MPOV0gpsZA5WFixZTGROqKPHFbpMMDehoK4cjEFAjcKvPDnyRB27Rd4dH7W+1Q9tOWGg
 J96ahOluQXUME0RyWcsHJpyujBrMLzoSBliAXNzfR4qa+LGFdhH1cvqPo+awrOa8Ig/o
 yZ4Y7j9RiM1WBdA4OdGh1AM6qAufbCbmn7/i+SanU7YgMNo+/2PSPmJV4+Jn7XE0Scl+
 7t5/Dzi1oXjFAzKV+/h7NM/npEHNA/IuISFvea0y45ucUperY2l4cV6kEE+RcdDubR1E
 funA==
X-Gm-Message-State: ABy/qLZh1WuFlO4B47j9CZlKqL4/rrgLkGqKf6xDV/00NR8cy4GqE6lc
 X/wSYLm7uoNniIVuPDIfww69lk7fxV8ItI8O0MbON+NYCQBR30nTb9vXeKzWjKRmIXk711t427f
 IrU6PnrLFlBAGwj2BOrWm9Avn1URw
X-Received: by 2002:a5d:4e12:0:b0:313:e2c8:bed1 with SMTP id
 p18-20020a5d4e12000000b00313e2c8bed1mr2235674wrt.34.1688652140611; 
 Thu, 06 Jul 2023 07:02:20 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHcrZAK048UNMfdOsb+IYlPvPsKZoDto6N+0HK8CkttE8tg+x61xjZ/Drujf9ZKOumGT2ngEg==
X-Received: by 2002:a5d:4e12:0:b0:313:e2c8:bed1 with SMTP id
 p18-20020a5d4e12000000b00313e2c8bed1mr2235624wrt.34.1688652140228; 
 Thu, 06 Jul 2023 07:02:20 -0700 (PDT)
Received: from redhat.com ([2.52.13.33]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d4742000000b0031434936f0dsm1960350wrs.68.2023.07.06.07.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 07:02:19 -0700 (PDT)
Date: Thu, 6 Jul 2023 10:02:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yang Rong <yangrong@vivo.com>
Subject: Re: [PATCH] Fix max/min warnings in virtio_net, amd/display, and
 io_uring
Message-ID: <20230706100133-mutt-send-email-mst@kernel.org>
References: <20230706021102.2066-1-yangrong@vivo.com>
MIME-Version: 1.0
In-Reply-To: <20230706021102.2066-1-yangrong@vivo.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Max Tseng <Max.Tseng@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jason Wang <jasowang@redhat.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO CORE AND NET DRIVERS"
 <virtualization@lists.linux-foundation.org>,
 Eric Dumazet <edumazet@google.com>, Jun Lei <Jun.Lei@amd.com>,
 Josip Pavic <Josip.Pavic@amd.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>,
 "open list:IO_URING" <io-uring@vger.kernel.org>,
 Alvin Lee <Alvin.Lee2@amd.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, opensource.kernel@vivo.com,
 Leo Li <sunpeng.li@amd.com>, Cruise Hung <cruise.hung@amd.com>,
 Jens Axboe <axboe@kernel.dk>,
 "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 open list <linux-kernel@vger.kernel.org>, luhongfei@vivo.com,
 "David S. Miller" <davem@davemloft.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 06, 2023 at 10:06:16AM +0800, Yang Rong wrote:
> The files drivers/net/virtio_net.c, drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c, and io_uring/io_uring.c were modified to fix warnings.

what warnings? the point of the warning is to analyze it not "fix" it
blindly.

> Specifically, the opportunities for max() and min() were utilized to address the warnings.
> 
> Signed-off-by: Yang Rong <yangrong@vivo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c | 6 +++---
>  drivers/net/virtio_net.c                     | 3 ++-
>  io_uring/io_uring.c                          | 3 ++-
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> index c753c6f30dd7..df79aea49a3c 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> +++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> @@ -22,7 +22,7 @@
>   * Authors: AMD
>   *
>   */
> -
> +#include <linux/minmax.h>
>  #include "dc.h"
>  #include "dc_dmub_srv.h"
>  #include "../dmub/dmub_srv.h"
> @@ -481,7 +481,7 @@ static void populate_subvp_cmd_drr_info(struct dc *dc,
>         max_drr_vblank_us = div64_u64((subvp_active_us - prefetch_us -
>                         dc->caps.subvp_fw_processing_delay_us - drr_active_us), 2) + drr_active_us;
>         max_drr_mallregion_us = subvp_active_us - prefetch_us - mall_region_us - dc->caps.subvp_fw_processing_delay_us;
> -       max_drr_supported_us = max_drr_vblank_us > max_drr_mallregion_us ? max_drr_vblank_us : max_drr_mallregion_us;
> +       max_drr_supported_us = max(max_drr_vblank_us, max_drr_mallregion_us);
>         max_vtotal_supported = div64_u64(((uint64_t)drr_timing->pix_clk_100hz * 100 * max_drr_supported_us),
>                         (((uint64_t)drr_timing->h_total * 1000000)));
> 
> @@ -771,7 +771,7 @@ void dc_dmub_setup_subvp_dmub_command(struct dc *dc,
>                 wm_val_refclk = context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns *
>                                 (dc->res_pool->ref_clocks.dchub_ref_clock_inKhz / 1000) / 1000;
> 
> -               cmd.fw_assisted_mclk_switch_v2.config_data.watermark_a_cache = wm_val_refclk < 0xFFFF ? wm_val_refclk : 0xFFFF;
> +               cmd.fw_assisted_mclk_switch_v2.config_data.watermark_a_cache = min(wm_val_refclk, 0xFFFF);
>         }
> 
>         dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 9b3721424e71..5bb7da885f00 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -22,6 +22,7 @@
>  #include <net/route.h>
>  #include <net/xdp.h>
>  #include <net/net_failover.h>
> +#include <linux/minmax.h>
> 
>  static int napi_weight = NAPI_POLL_WEIGHT;
>  module_param(napi_weight, int, 0444);
> @@ -1291,7 +1292,7 @@ static struct sk_buff *build_skb_from_xdp_buff(struct net_device *dev,
>         __skb_put(skb, data_len);
> 
>         metasize = xdp->data - xdp->data_meta;
> -       metasize = metasize > 0 ? metasize : 0;
> +       metasize = max(metasize, 0);
>         if (metasize)
>                 skb_metadata_set(skb, metasize);
> 
> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
> index e8096d502a7c..875ca657227d 100644
> --- a/io_uring/io_uring.c
> +++ b/io_uring/io_uring.c
> @@ -47,6 +47,7 @@
>  #include <linux/refcount.h>
>  #include <linux/uio.h>
>  #include <linux/bits.h>
> +#include <linux/minmax.h>
> 
>  #include <linux/sched/signal.h>
>  #include <linux/fs.h>
> @@ -2660,7 +2661,7 @@ static void *__io_uaddr_map(struct page ***pages, unsigned short *npages,
>                                         page_array);
>         if (ret != nr_pages) {
>  err:
> -               io_pages_free(&page_array, ret > 0 ? ret : 0);
> +               io_pages_free(&page_array, max(ret, 0));
>                 return ret < 0 ? ERR_PTR(ret) : ERR_PTR(-EFAULT);
>         }
>         /*
> --
> 2.35.3
> 
> 
> ________________________________
> 本邮件及其附件内容可能含有机密和/或隐私信息，仅供指定个人或机构使用。若您非发件人指定收件人或其代理人，请勿使用、传播、复制或存储此邮件之任何内容或其附件。如您误收本邮件，请即以回复或电话方式通知发件人，并将原始邮件、附件及其所有复本删除。谢谢。
> The contents of this message and any attachments may contain confidential and/or privileged information and are intended exclusively for the addressee(s). If you are not the intended recipient of this message or their agent, please note that any use, dissemination, copying, or storage of this message or its attachments is not allowed. If you receive this message in error, please notify the sender by reply the message or phone and delete this message, any attachments and any copies immediately.
> Thank you

