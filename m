Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8EAC0FD42
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 19:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F4610E540;
	Mon, 27 Oct 2025 18:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ER/TOk4S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6A510E53F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:02:50 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b4736e043f9so905180266b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 11:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761588169; x=1762192969; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=keQgCiVBqugDEVy75un1KzT9J08z1JpEGApwh+kNxek=;
 b=ER/TOk4S00rh2kikHE6K2HXRcWlMjzl8u8K0FoHmR6bX7V3ko0PiHIiax6zr2O/ax5
 6SoTdD40H4RLTTiweA9UvvQ7Wa3EHdbP/WpRJde219tRi1i7aTlW3Z9Vl9AuFglbMUY4
 Ci/ivA4sUnxpA5Vz1SScdxwV/TwmQmrzrs6SUcz776NZkf656BphB6FEzd4Rq2i6uZcQ
 4mnXdIbaoTxfbtq4uJCK8asA33EKPhxEgHbZLKASPfYxxYDQg/4AwedGc1gz+jGjncxS
 RYO7CTDWAbrtl2hIBUZYQQs7RYwgFHW2VxkuckR7qCX9K5XD4h0oz+VYmmBblyiTgHdL
 RGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761588169; x=1762192969;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=keQgCiVBqugDEVy75un1KzT9J08z1JpEGApwh+kNxek=;
 b=urrvHNzbssoFvDyYHWEj2xAz52RkoZBtip/teFOnDH+lXVtLdKRzMun+bgn67AtNsM
 Qsg20HobKDWwQRBQg/nowrwXhNEPv2m/sz3iOXWE3ZIaTNWLGO+G/DC7jPNNOHdXyJdS
 g3vLel26KJXWpvNRlAGJGbLLFR3L+3NKh495HZlbqjMOBdozSXVM527WTBkEqqJvPqyT
 Zy4g0/eTTSp4oiNsqSC4AelSsmZry9pJb9tb6TSRUxHrYGAxwEDqdZtnrS8+InlA6b4O
 T9+9f8URQjW3DRLWQZbeAQKHNYHvHWSLw335LNNncBwZb4kZFJvX/rC4OzIK12ieYrdQ
 MRtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK06nUQG01ooUCkyHdYESJtjY2eLO1wYENXFtRpRb/eQWDE+3ITaeRCt5vYQvGcrnSoH2ID/mHm+s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmnN4Ar/QCV0fDej8/ogOsnZQ9WP9R/uU/VHtAURhrhlhn9Mb3
 Z5AM0SYdK+el7ENzEKQSd7Xm9ECM+9WFcXLuq/edB9ptSpEkjLt4PalMNc5UECq+lnrmiHuOH6/
 V6Va1I+gzCSr+9Evu6daq1w9+4H/YJbM=
X-Gm-Gg: ASbGncsev4qm+gmoVT8XyIy2/88RrJqTYLiaAwg2XZFX8fLea1j+TPg2NcmFbCy+j/E
 LIf8c4oL8l9uYYn5IKD754K3bz5bUOg3yAIa/jhHWnJVh4ITzof8TDI6Xyf4ldC2iXuqd6p72/I
 7j+QdwSvbkP6N2d/Nb4wZaq6ZruCDY+MjI6n0/w3hLgI/P//GW+0CdfhQx105GdPGLYtW32jUYA
 ngDID2mQrLnIYvEhkI6VtOwUkPXAIVJadIwpiYi911kJ27pYAJiwcazcM50YaI1D6fQJfBQbbhL
 9da6I31g7t9+N51FbsJ1R05H
X-Google-Smtp-Source: AGHT+IHP/V1F9P3TW5ZFh/h+hXxyEHvlqMWOQvAOVjJ5loLIb8qqHYGPMlplTaY2sFeQxNozQ0fFjQ7ofp+S0wxS29I=
X-Received: by 2002:a17:907:785:b0:b6d:6a3e:b960 with SMTP id
 a640c23a62f3a-b6dba5c0ce8mr88785366b.59.1761588168846; Mon, 27 Oct 2025
 11:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251016171845.1397153-1-rampxxxx@gmail.com>
In-Reply-To: <20251016171845.1397153-1-rampxxxx@gmail.com>
From: Javier Garcia <rampxxxx@gmail.com>
Date: Mon, 27 Oct 2025 19:02:37 +0100
X-Gm-Features: AWmQ_bnRxFLdM34KXqFkDra9NbBgRdtN8M_nP9qHeXiirDeaOiJxudxosg27OyM
Message-ID: <CABPJ0vgtpjh2q605TifawiS36qAS+OO_dAnYVGsqd03GSXZp+g@mail.gmail.com>
Subject: Re: [PATCH] fbdev: vga16fb: Request memory region.
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, shuah@kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Helge Deller, any comment on this patch?

---
Javier Garcia


On Thu, 16 Oct 2025 at 19:18, Javier Garcia <rampxxxx@gmail.com> wrote:
>
> This patch reserve and release VGA memory region with `*_mem_region`
> fn's.
>
> This align with Documentation/drm/todo.rst
> "Request memory regions in all fbdev drivers"
>
> I've tested with kernel and qemu both 32bits.
>
> Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
> ---
>
> When I've run the code always return -EBUSY which makes sense as
> mem is already requested,`/proc/iomem` shows `000a0000-000bffff : Video RAM area`.
>
> I've seen that `cirrusfb` has this kind of code wrapped up with `#if 0`, and I
> wonder if it makes sense to also wrap up with `#if 0`, at least , in
> that way the code gets commented about expected behavior.
>
>
>  drivers/video/fbdev/vga16fb.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
> index eedab14c7d51..f506bf144a97 100644
> --- a/drivers/video/fbdev/vga16fb.c
> +++ b/drivers/video/fbdev/vga16fb.c
> @@ -1319,6 +1319,11 @@ static int vga16fb_probe(struct platform_device *dev)
>         if (ret)
>                 return ret;
>
> +       if (!request_mem_region(vga16fb_fix.smem_start, vga16fb_fix.smem_len,
> +                               "vga16b")) {
> +               dev_err(&dev->dev,"vga16b: cannot reserve video memory at 0x%lx\n",
> +                      vga16fb_fix.smem_start);
> +       }
>         printk(KERN_DEBUG "vga16fb: initializing\n");
>         info = framebuffer_alloc(sizeof(struct vga16fb_par), &dev->dev);
>
> @@ -1398,6 +1403,8 @@ static int vga16fb_probe(struct platform_device *dev)
>   err_ioremap:
>         framebuffer_release(info);
>   err_fb_alloc:
> +       release_mem_region(vga16fb_fix.smem_start,
> +                   vga16fb_fix.smem_len);
>         return ret;
>  }
>
> --
> 2.50.1
>
